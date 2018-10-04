# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    @data = []
    lines = tsv.split("\n")
    keys = lines[0].split("\t")
    lines.shift

    lines.each do |line|
      values = line.split("\t")
      record = {}
      keys.each_index { |index| record[keys[index]] = values[index] }
      @data.push(record)
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    tsv_str = ''
    header = @data[0].keys.join("\t")

    tsv_str << header << "\n"
    @data.each do |record|
      line = record.values.join("\t")
      tsv_str << line << "\n"
    end
    tsv_str
  end
end
