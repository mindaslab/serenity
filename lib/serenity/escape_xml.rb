class String
  def escape_xml
    mgsub([[/&/, '&amp;'], [/</, '&lt;'], [/>/, '&gt;'], [/'/,'&apos;']])
  end
  def unescape_xml
    mgsub([[/&amp;/, '&'], [/&lt;/, '<'], [/&gt;/, '>'], [/&apos;/, "'"]])
  end

  def convert_newlines
    gsub("\n", '<text:line-break/>')
  end

  def mgsub(key_value_pairs=[].freeze)
    regexp_fragments = key_value_pairs.collect { |k,v| k }
    gsub(Regexp.union(*regexp_fragments)) do |match|
      key_value_pairs.detect{|k,v| k =~ match}[1]
    end
  end
end
