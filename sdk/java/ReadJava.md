mvn -B archetype:generate \
 -DarchetypeGroupId=software.amazon.awssdk \
 -DarchetypeArtifactId=archetype-lambda -Dservice=s3 -Dregion=US_WEST_3 \
 -DarchetypeVersion=2.46.5\
 -DgroupId=com.example.myapp \
 -DartifactId=myapp