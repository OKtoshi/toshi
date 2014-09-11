require 'sinatra'

module Toshi
  module Web

    class Base < ::Sinatra::Base
      NotFoundError      = Class.new(StandardError)
      InvalidFormatError = Class.new(StandardError)

      set :root,            File.dirname(File.dirname(File.dirname(__FILE__)))
      set :public_folder,   Proc.new { File.join(root, "toshi/web/static") }
      set :views,           Proc.new { File.join(root, "toshi/web/views") }

      def pretty_number(number)
        number.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
      end
    end

  end
end
