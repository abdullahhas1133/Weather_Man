require 'csv'

filenames_Dubai = Dir.chdir("/home/abdullah126/Desktop/project2/Weather man-20220810T060630Z-001/Weather man/Dubai_weather") { Dir.entries(".") }
filenames_Murree = Dir.chdir("/home/abdullah126/Desktop/project2/Weather man-20220810T060630Z-001/Weather man/Murree_weather") { Dir.entries(".") }
filenames_lahore = Dir.chdir("/home/abdullah126/Desktop/project2/Weather man-20220810T060630Z-001/Weather man/lahore_weather") { Dir.entries(".") }

def disp_sign(bonus,date,max_times,min_times)

    max_times = max_times.to_i
    min_times = min_times.to_i
    if bonus == 0     
    print " #{date} "
    if max_times >= 0
        max_times.times.each do
        print colorize("+", :bright_red)
        end
    end

    puts " #{max_times}C"
    print " #{date} "
    if min_times >= 0
        min_times.times.each do
            print colorize("+", :blue)
        end
    end     
    puts " #{min_times}C \n\n"   
    
    elsif bonus == 1
        print " #{date} "
    if max_times >= 0
        max_times.times.each do
        print colorize("+", :bright_red)
        end
    end

    
    if min_times >= 0
        min_times.times.each do
            print colorize("+", :blue)
        end
    end         
    puts " #{max_times}C - #{min_times}C "
    
    
    end

end

file_name=""
file_path = "/home/abdullah126/Desktop/project2/Weather man-20220810T060630Z-001/Weather man" 
folder_name=""
city=""
filenames_Dubai.sort!
ques = ARGV[0]
year = ARGV[1]
folder_name = ARGV[2]
# puts "#{ques}, #{year}, #{file_name}"


city = folder_name.split('_')[0] 
puts file_path
city.delete!("/")

month = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]

cities = ["lahore","Dubai","Murree"]
if ques != "-e"
     month = month[year.split('/')[1].to_i-1]
     year = year.split('/')[0]
     file_path= file_path<<"/"<<"#{city}_weather"
     file_name=folder_name.dup
end

file_path = file_path << folder_name

if year.include?("/")
     year = year.split('/')[0]

 end
 file_name.delete!("/")
 puts ques
 puts month
 puts year
 puts file_path
file_path_copy = file_path.dup

def colorize(value, color)
	case color
        when :black then "\e[30m" + value.to_s + "\e[0m"
        when :red then "\e[31m" + value.to_s + "\e[0m"
        when :green then "\e[32m" + value.to_s + "\e[0m"
        when :yellow then "\e[33m" + value.to_s + "\e[0m"
        when :blue then "\e[34m" + value.to_s + "\e[0m"
        when :magenta then "\e[35m" + value.to_s + "\e[0m"
        when :cyan then "\e[36m" + value.to_s + "\e[0m"
        when :white then "\e[37m" + value.to_s + "\e[0m"
        when :bright_black then "\e[1m\e[30m" + value.to_s + "\e[0m"
        when :bright_red then "\e[1m\e[31m" + value.to_s + "\e[0m"
        when :bright_green then "\e[1m\e[32m" + value.to_s + "\e[0m"
        when :bright_yellow then "\e[1m\e[33m" + value.to_s + "\e[0m"
        when :bright_blue then "\e[1m\e[34m" + value.to_s + "\e[0m"
        when :bright_magenta then "\e[1m\e[35m" + value.to_s + "\e[0m"
        when :bright_cyan then "\e[1m\e[36m" + value.to_s + "\e[0m"
        when :bright_white then "\e[1m\e[37m" + value.to_s + "\e[0m"
        else value.to_s
	end
end

max_temp=-1000
min_temp = 1000
min_temp_date=""
max_temp_date=""
max_humidity= -100
max_humidity_date=""


max_avg_temp=-1000

min_avg_temp=1000

avg_humidity=-2

if(ques == "-e")
    puts "in  e"
    
    month.each do |mon|
        file_path= file_path_copy.dup
        if city == "Dubai"
            

            file_name = "#{city}_weather_#{year}_#{mon}.txt"
            if filenames_Dubai.include?(file_name)
                
                file_path = file_path<<"/"<< file_name
                
                file = File.open(file_path,"r+")
                puts file.inspect
                puts file.read
                

                csv = CSV.read(file_path, :headers=>true)
                size = csv['Max TemperatureC'].size
                
                size.times.each do |i|    
                   
                    if max_temp.to_i < csv['Max TemperatureC'][i].to_i
                        max_temp = csv['Max TemperatureC'][i]
                        max_temp_date= csv[i][0]
                        #puts "max"
                    end
                end
                

                size = csv['Min TemperatureC'].size
                #puts csv['Min TemperatureC']
                
                size.times.each do |i| 
                   
                    if min_temp.to_i > csv['Min TemperatureC'][i].to_i && csv['Min TemperatureC'][i] != nil
                        min_temp = csv['Min TemperatureC'][i]
                        min_temp_date= csv[i][0]
                        
                    end
                end

                size = csv['Max Humidity'].size
                
                size.times.each do |i| 
                    
                    if max_humidity.to_i < csv['Max Humidity'][i].to_i
                        max_humidity = csv['Max Humidity'][i]
                        max_humidity_date= csv[i][0]
                        
                    end
                end
            elsif
                puts "no file exist"  
            end

        elsif city == "lahore"
            puts "lahore"
        
            file_name = "#{city}_weather_#{year}_#{mon}.txt"
            if filenames_lahore.include?(file_name)
                
                file_path = file_path<<"/"<< file_name
                
                file = File.open(file_path,"r+")
                puts file.inspect
                puts file.read
                
                csv = CSV.read(file_path, :headers=>true,:skip_blanks=>true)
                size = csv['Max TemperatureC'].size
                puts csv['Max TemperatureC']
                size.times.each do |i| 
                    if max_temp.to_i < csv['Max TemperatureC'][i].to_i
                        max_temp = csv['Max TemperatureC'][i]
                        max_temp_date= csv[i][0]
                        puts max_temp_date
                    end
                end

                size = csv['Min TemperatureC'].size
                #puts csv['Min TemperatureC']
                
                size.times.each do |i| 
                    if min_temp.to_i > csv['Min TemperatureC'][i].to_i && csv['Min TemperatureC'][i] != nil
                        min_temp = csv['Min TemperatureC'][i]
                        min_temp_date= csv[i][0]
                    end
                end
                
                size = csv['Max Humidity'].size
                #puts csv['Max Humidity']
                
                size.times.each do |i| 
                    # puts "in loop"    # ... tells ruby to exclude the last number (here 10 if we .. only then it includes the last num)
                    if max_humidity.to_i < csv['Max Humidity'][i].to_i
                        max_humidity = csv['Max Humidity'][i]
                        max_humidity_date= csv[i][0]
                    end
                end
            elsif
                puts "no file exist"  
            end

        elsif city == "Murree"
            
            
            # file_name = "#{city}_weather_#{year}_#{mon}.txt"
            if filenames_Murree.include?(file_name)
                
                file_path = file_path<<"/"<< file_name
                
                file = File.open(file_path,"r+")
                puts file.inspect
                puts file.read
                
                csv = CSV.read(file_path, :headers=>true)
                size = csv['Max TemperatureC'].size
                #puts csv['Max TemperatureC']
                size.times.each do |i| 
                 
                    if max_temp.to_i < csv['Max TemperatureC'][i].to_i
                        max_temp = csv['Max TemperatureC'][i]
                        max_temp_date= csv[i][0]
                        #puts "max"
                    end
                end

                size = csv['Min TemperatureC'].size
                # puts csv['Min TemperatureC']
                
                size.times.each do |i| 
    
                    if min_temp.to_i > csv['Min TemperatureC'][i].to_i && csv['Min TemperatureC'][i] != nil
                        min_temp = csv['Min TemperatureC'][i]
                        min_temp_date= csv[i][0]
                        #puts "Min found"
                        # puts "max"
                    end
                end
                
                size = csv['Max Humidity'].size
                puts csv['Max Humidity']

                size.times.each do |i| 
                    if max_humidity.to_i < csv['Max Humidity'][i].to_i
                        max_humidity = csv['Max Humidity'][i]
                        max_humidity_date= csv[i][0]
                        # puts "max"
                    end
                end
                  
            elsif
                puts "no file exist"  
        
            end      
        end
       
    end

    puts "The max temp for all cities : #{max_temp}" 
    puts "The max temp date for all cities : #{max_temp_date}" 

    puts "The min temp for all cities : #{min_temp}"
    puts "The min temp date for all cities : #{min_temp_date}"  

    puts "The max humidity for all cities : #{max_humidity}"
    puts "The max humidity date for all cities : #{max_humidity_date}"  

elsif ques =="-a" 
    
    mon = month
        file_path= file_path_copy.dup
             
            if city == "Dubai"
               
                if filenames_Dubai.include?(file_name) 
                    
                    puts file_path
                    file = File.open(file_path,"r+")
                    puts file.inspect
                    puts file.read
    
    
                    csv = CSV.read(file_path, :headers=>true)
                    
                    size = csv['Min TemperatureC'].size
                    array1 =  csv['Min TemperatureC']
                    array1.map!{|e| e.to_i}
                    puts array1.size
                    if min_avg_temp > array1.sum/array1.size
                        min_avg_temp = (array1.sum/array1.size)
                    end
    
                    size = csv['Max TemperatureC'].size
                    array1 =  csv['Max TemperatureC']
                    array1.map!{|e| e.to_i}
                    puts array1.size
                    if max_avg_temp < array1.sum/array1.size
                        max_avg_temp = (array1.sum/array1.size)
                    end

                    size = csv[' Mean Humidity'].size
                    array1 =  csv[' Mean Humidity']
                    array1.map!{|e| e.to_i}
                    
                    if avg_humidity < array1.sum/array1.size
                        avg_humidity = (array1.sum/array1.size)
                    end
                    
                    
                elsif
                    puts "no file exist"  
                end
    
            elsif city == "lahore"
                puts "lahore"
            
                if filenames_lahore.include?(file_name) 
                    
                    puts file_path
                    file = File.open(file_path,"r+")
                    puts file.inspect
                    puts file.read
    
    
                    csv = CSV.read(file_path, :headers=>true,:skip_blanks=>true)

                    size = csv['Min TemperatureC'].size
                    array1 =  csv['Min TemperatureC']
                    array1.map!{|e| e.to_i}
                    puts array1.size
                    if min_avg_temp > array1.sum/array1.size
                        min_avg_temp = (array1.sum/array1.size)
                    end
    
                    size = csv['Max TemperatureC'].size
                    array1 =  csv['Max TemperatureC']
                    array1.map!{|e| e.to_i}
                    puts array1.size
                    if max_avg_temp < array1.sum/array1.size
                        max_avg_temp = (array1.sum/array1.size)
                    end

                    size = csv[' Mean Humidity'].size
                    array1 =  csv[' Mean Humidity']
                    array1.map!{|e| e.to_i}
                    
                    if avg_humidity < array1.sum/array1.size
                        avg_humidity = (array1.sum/array1.size)
                    end
                    
                    
                elsif
                    puts "no file exist"  
                end
    
            elsif city == "Murree"
            
                  if filenames_Murree.include?(file_name) 
                    puts file_path
                    file = File.open(file_path,"r+")
                    puts file.inspect
                    puts file.read
        
                    csv = CSV.read(file_path, :headers=>true)
                    
                    size = csv['Min TemperatureC'].size
                    array1 =  csv['Min TemperatureC']
                    array1.map!{|e| e.to_i}
                    puts array1.size
                    if min_avg_temp > array1.sum/array1.size
                        min_avg_temp = (array1.sum/array1.size)
                    end
    
                    size = csv['Max TemperatureC'].size
                    array1 =  csv['Max TemperatureC']
                    array1.map!{|e| e.to_i}
                    puts array1.size
                    if max_avg_temp < array1.sum/array1.size
                        max_avg_temp = (array1.sum/array1.size)
                    end

                    size = csv[' Mean Humidity'].size
                    array1 =  csv[' Mean Humidity']
                    array1.map!{|e| e.to_i}
                    
                    if avg_humidity < array1.sum/array1.size
                        avg_humidity = (array1.sum/array1.size)
                    end
                    
                      
                elsif
                    puts "no file exist"  
                end
           
        end
        
    puts "The avg max temp : #{max_avg_temp}" 
    
    puts "The avg min temp : #{min_avg_temp}"
    
    puts "The avg humidity : #{avg_humidity}%"
else 
    puts "third part"    
        mon = month
        file_path= file_path_copy.dup
            if city == "Dubai"
                if filenames_Dubai.include?(file_name) 
                    puts file_path
                    file = File.open(file_path,"r+")
                    puts file.inspect
                    puts file.read
    
    
                    csv = CSV.read(file_path, :headers=>true)
                    
                    size = csv['GST'].size
                    array_max = csv['Max TemperatureC']
                    array_min = csv['Min TemperatureC']
                    
                    
                    size.times.each do |index|                   
                        disp_sign(0,index+1,array_max[index],array_min[index])
                    end
                    
                elsif
                    puts "no file exist"  
                end
    
            elsif city == "lahore"
                # puts "congrats"  
                puts file_name
                if filenames_lahore.include?(file_name) 
                    
                    puts file_path
                    file = File.open(file_path,"r+")
                    puts file.inspect
                    puts file.read
    
    
                    csv = CSV.read(file_path, :headers=>true,:skip_blanks=>true)

                    size = csv['PKT'].size
                    array_max = csv['Max TemperatureC']
                    array_min = csv['Min TemperatureC']
                    
                    
                    size.times.each do |index|                   
                        disp_sign(0,index+1,array_max[index],array_min[index])
                    end
                    
                    
                elsif
                    puts "no file exist"  
                end
    
            elsif city == "Murree"
                    puts file_name
                if filenames_Murree.include?(file_name) 
                    puts file_path
                    file = File.open(file_path,"r+")
                    puts file.inspect
                    puts file.read
                    puts "congrats"
                    csv = CSV.read(file_path, :headers=>true)
                    
                    size = csv['PKT'].size
                    array_max = csv['Max TemperatureC']
                    array_min = csv['Min TemperatureC']
                    
                    
                    size.times.each do |index|                   
                        disp_sign(1,index+1,array_max[index],array_min[index])
                    end
                    
                      
                elsif
                    puts "no file exist"  
                end
           
            end
        
end
