class Lctl::Finder
  def initialize(name)
    @name = name
  end

  def files
    @files ||= Dir.glob(glob, File::FNM_CASEFOLD)
  end

  private

  def name
    @name.to_s.gsub(/(\.plist)?$/, '')
  end

  def glob
    File.expand_path(
      "~/Library/Launch{Agents,Daemons}/*#{name}*.plist"
    )
  end
end
