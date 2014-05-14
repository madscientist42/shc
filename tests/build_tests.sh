#!/bin/sh

# Very lazy presumption here.  We're expecting to be ran from above 
# via CMake as a "test" target.  So we're just going to issue a cd
# command into tests...
cd tests

# Build each of the scripts in turn...
for i in test.bash pru.sh match.sh; do
	../shc -f $i
done

# Run each of the scripts in turn...
for i in test.bash pru.sh match.sh; do
	./$i.x bash
done
