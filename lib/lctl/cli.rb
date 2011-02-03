require 'thor'

class Lctl::CLI < Thor
  default_task :start

  desc 'load NAME', 'Load a launchd process in ~/Library/Launch[Agents|Daemons]'
  def load(name)
    find(name, :load)
  end

  desc 'unload NAME', 'Unload a launchd process in ~/Library/Launch[Agents|Daemons]'
  def unload(name)
    find(name, :unload)
  end

  desc 'list [NAME]', 'Find any agents or daemons matching optional NAME'
  def list(name = nil)
    find(name, :list)
  end

  desc 'version', "Prints Lctl's version information"
  def version
    say "Lctl version #{Lctl::VERSION}"
  end
  map %w(-v --version) => :version

  private

  def find(name, action)
    files = ::Lctl::Finder.new(name.to_s).files

    return list_files(files) if action == :list

    if files.length == 1
      say("#{action.capitalize}ing #{files.first}")
      %x(launchctl #{action} #{files.first})
    else
      say "Expected to find one file. Found #{files.length} files", :red
      print_files(files, :red)
    end
  end

  def list_files(files)
    if files.empty?
      say "Couldn't find any files matching \"#{name}\"", :red
    else
      say "Found #{files.length} file(s)", :green
      print_files(files)
    end
  end

  def print_files(files, color = :green)
    files.each { |file| say " - #{file}" }
  end
end
