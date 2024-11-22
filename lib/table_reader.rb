# frozen_string_literal: true

# TableReader class that reads data from file as a tournament table
class TableReader
  def read_table_from_file(path)
    file = File.new path
    content = file.read

    file.close
    content
  end
end
