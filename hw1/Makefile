.PHONY : all
all : hw1

.PHONY : clean
clean :
	rm -rf hw1 run-tests compiled

hw1 : hw1.rkt
	raco exe -o $@ $<

run-tests : run-tests.rkt hw1.rkt
	raco exe -o $@ $<

.PHONY : test
test : run-tests
	./run-tests
