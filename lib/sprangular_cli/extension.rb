module SprangularCli

  class Extension < Thor::Group
    include Thor::Actions

    desc "builds a sprangular extension"
    argument :file_name, type: :string, desc: 'rails app_path', default: '.'

    source_root File.expand_path('../templates/extension', __FILE__)

    def generate
      use_prefix 'sprangular_'

      empty_directory file_name

      directory 'app', "#{file_name}/app"
      directory 'lib', "#{file_name}/lib"
      directory 'bin', "#{file_name}/bin"

      template 'extension.gemspec', "#{file_name}/#{file_name}.gemspec"
      template 'Gemfile', "#{file_name}/Gemfile"
      template 'gitignore', "#{file_name}/.gitignore"
      template 'LICENSE', "#{file_name}/LICENSE"
      template 'Rakefile', "#{file_name}/Rakefile"
      template 'README.md', "#{file_name}/README.md"
      template 'config/routes.rb', "#{file_name}/config/routes.rb"
      template 'config/locales/en.yml', "#{file_name}/config/locales/en.yml"
      template 'rspec', "#{file_name}/.rspec"
      template 'spec/spec_helper.rb.tt', "#{file_name}/spec/spec_helper.rb"
    end

    no_tasks do
      def class_name
        Thor::Util.camel_case(file_name)
      end

      def use_prefix(prefix)
        unless file_name =~ /^#{prefix}/
          @file_name = prefix + Thor::Util.snake_case(file_name)
        end
      end

      def name_without_prefix
        @file_name.gsub(/^sprangular_/, '')
      end

      def module_name
        Thor::Util.camel_case(name_without_prefix)
      end
    end
  end
end
