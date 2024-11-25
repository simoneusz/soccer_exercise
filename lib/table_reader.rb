# frozen_string_literal: true

# TableReader class that reads data from file as a tournament table
class TableReader
  def read_table_from_file(path)
    File.read(path)
  end
end
