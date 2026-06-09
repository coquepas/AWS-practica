## Create a new S3 bucket

'''md
aws s3 mb s3://checksums-examples-coque
'''

## Create a file that will do a checksum on (en este caso myfile.txt)

## Apply the checksum
'''
md5sum myfile.txt
'''

## Upload our file and look at its etag
'''
aws s3 cp myfile.txt s3://checksums-examples-coque
aws s3api head-object --bucket checksums-examples-coque --key myfile.txt
'''

## Apply a different checksum algorithm
'''
rhash --crc32 --simple myfile.txt  --> y luego pasarlo a base64
aws s3api put-object \
--bucket "checksums-examples-coque" \
--key "myfilecrc32.txt" \
--body "myfile.txt" \
--checksum-algorithm "CRC32" \
--checksum-crc32 "kpfyjQ=="

'''