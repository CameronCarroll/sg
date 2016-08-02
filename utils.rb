module Utils
  def self.media_path(file)
    File.join(File.dirname(
      __FILE__), 'assets', file)
  end
end
