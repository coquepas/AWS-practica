require 'aws-sdk-s3'
require 'pry' #interactive shell for debugging (exit! para salir)
Pry.config.input = STDIN
Pry.config.output = STDOUT
Pry.config.color = true

require 'dotenv'
require 'securerandom'
require 'tmpdir'
require 'fileutils'

Dotenv.load

tmp_dir = Dir.tmpdir
FileUtils.mkdir_p(tmp_dir)

bucket_name= ENV['BUCKET_NAME']
region = ENV['AWS_DEFAULT_REGION']

client = Aws::S3::Client.new

# resp = client.create_bucket({
#   bucket: bucket_name,
#     create_bucket_configuration: {
#         location_constraint: region
#     }
# })  

# binding.pry

number_of_files = 1 + rand(6)

puts 'number of files to upload: ' + number_of_files.to_s

number_of_files.times.each do |i|
    puts "i: #{i}"
    filename = "file-#{i}.txt"
    output_path = File.join(tmp_dir, filename)

    File.open(output_path, 'w') do |f|
        f.write(SecureRandom.hex(10))
    end

    File.open(output_path, 'rb') do |f|
        client.put_object({
            bucket: bucket_name,
            key: filename,
            body: f
        })
    end
end

