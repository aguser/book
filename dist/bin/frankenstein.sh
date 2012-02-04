#/bin/sh
cd ../..
mvn compile
mvn dependency:copy-dependencies
if  [ -z $JAVA_HOME ] ; then
 export JAVA_HOME="/Library/Java/Home"
fi

for jar in ./target/dependency/*.jar;do
 export CLASSPATH=$CLASSPATH:$jar
done
for jar in ./lib/*.jar;do
 export CLASSPATH=$CLASSPATH:$jar
done
for jar in ./lib/dependency/*.jar;do
 export CLASSPATH=$CLASSPATH:$jar
done
export CLASSPATH=$CLASSPATH:./target/test-classes
export MEM_ARGS="-Xms512m -Xmx512m"

RUN_CMD="$JAVA_HOME/bin/java $MEM_ARGS -cp $CLASSPATH com.tamingtext.frankenstein.Frankenstein"
echo $RUN_CMD
exec $RUN_CMD

