class MusicImporter
    attr_accessor :path, :files 
    def initialize(path) #accepts path to MP3 directory
      @path = path 
    end 
  
  
    def files #returns all imported filenames
      @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    end
  
    def import #importals all files from library ; instantiating a new song object for ea. file.
      self.files.each do |filename|
      Song.create_from_filename(filename)
      end 
    end 
  end  