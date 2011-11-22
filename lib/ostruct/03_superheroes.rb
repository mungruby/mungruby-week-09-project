

module BulkFile

  # use the included hook to tell if this module gets included in a class
  def self.included base
    base.class_eval do
      extend ClassMethods
      include BulkFile::InstanceMethods
    end
  end

  #
  # methods in this module will become class methods of the including class
  #
  module ClassMethods

    def collection_of
      return const_get @member_class
    end

    def attr_readers=(readers)
      readers.each do |message|
        collection_of.class_eval {define_method(message) {@data.public_send(message)} unless message =~ /=/}
      end
    end
  end  # BulkFile::ClassMethods

  #
  # methods in this module will become instance methods of the including class
  #
  module InstanceMethods

    require 'ostruct'

    def load_from_file
      load_headers
      load_values
    end

    def each
      @members.each {|e| yield e if block_given?}
    end

    private

    def load_headers
      @headers = @io.readlines.first.chomp.split(",").map { |hdr| hdr.downcase.to_sym }
      @io.rewind
      self.class.attr_readers = @headers
    end

    def load_values
      entries = []
      @io.readlines.grep( %r{^\"} ).each do |line|
        e = OpenStruct.new
        line.split(",").each_with_index do |field, idx|
          e.__send__( "#{@headers[idx]}=", field.delete('"').rstrip )
        end
        entries << e
      end
      entries
    end

  end  # BulkFile::InstanceMethods
end  # module BulkFile


class BulkFileHandler
  include BulkFile
  include Enumerable

  def initialize io
    @io = io
    member_class = self.class.collection_of
    @members = load_from_file.map {|data_obj| member_class.new data_obj}
  end
end

 
class Superhero

  def initialize data_obj
    @data = data_obj
  end

  def to_csv
    "#{name},#{origin},#{nemesis},#{nickname}"
  end
   
  def to_s
    @data.to_s
  end
end


class Superheroes < BulkFileHandler

  @member_class = 'Superhero'

  def initialize io
    super io
  end
end
 
 
