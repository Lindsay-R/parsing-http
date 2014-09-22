class HTTPResponseParser


  def initialize(read_file)
    @read_file =read_file

  end



  def response_code
    @read_file.to_s.split(/\W+/)[3].to_i

  end

  def version
    @read_file.to_s.split(" ")[0]
  end

  def body
    x= @read_file.to_s.split(/\n/).count
   y= @read_file.to_s.split(/\n/)[9..x]
    y.join
  end




  def content_type
    @read_file.to_s.split(/\n/)[3].split(" ")[1]
  end


  def header

    i = 1
    arry = []

    while i < 8  do
      x = @read_file.to_s.split(/\n/)[i]

      z = x.split(" ")[0].to_s
      y = x.split(": ")[1].to_s

      arry << z
      arry << y
      i +=1
    end
    return Hash[*arry.flatten]

  end

  def server
    x = @read_file.to_s.split(/\n/)[1]
    y = x.split(": ")[1].to_s
    y
  end

  def location
    x = @read_file.to_s.split(/\n/)[5]
    y = x.split(": ")[1].to_s
    y
  end

end