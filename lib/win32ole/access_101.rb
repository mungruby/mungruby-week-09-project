

# http://ruby-doc.org/stdlib-1.9.3/libdoc/win32ole/rdoc/index.html 
# http://rubyonwindows.blogspot.com/2007/06/using-ruby-ado-to-work-with-ms-access.html
# http://www.w3schools.com/ado/default.asp
# http://office.microsoft.com/en-us/access-help/about-ole-db-and-data-links-HP005260660.aspx


require 'win32ole'


if __FILE__ == $0

  db_file = 'lerg14.mdb'
  exit unless File.exist? db_file

  adodb_connection = WIN32OLE.new 'ADODB.Connection'
  adodb_recordset = WIN32OLE.new 'ADODB.Recordset'
  adodb_connection.Provider='Microsoft.Jet.OLEDB.4.0'
  adodb_connection.Open "Data Source=#{db_file}"

  sql_string = "SELECT * FROM [LERG14] WHERE [FG D TANDEM] = 'BLTMMDCH13T';"
  adodb_recordset.Open sql_string, adodb_connection

  puts
  puts adodb_recordset.Source
  puts
  adodb_recordset.Fields.each {|f| puts f.NAME}
  puts
  adodb_recordset.GetRows.transpose.each {|a,b,c,d,e,f,g| puts "#{a} #{b} #{c} #{f}"}
   
  adodb_recordset.Close
  adodb_connection.Close

end

 
