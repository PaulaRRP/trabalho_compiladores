compile: genparser Main.java
	javac -cp .:antlr-4.8-complete.jar Main.java

genparser: parser/lang.g4
	java -jar antlr-4.8-complete.jar parser/lang.g4

run: compile genparser
	java -cp .:antlr-4.8-complete.jar Main $(filter-out $@,$(MAKECMDGOALS))

clean:
	rm -R parser/*Listener.java parser/langLexer* parser/langParser.java parser/lang.interp parser/lang.tokens
	find . -type f -name "*.class" -delete
	find . -type f -name "*~" -delete
