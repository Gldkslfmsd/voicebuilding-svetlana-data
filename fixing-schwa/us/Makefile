
merge:
	for i in *.par ; do python3 ../merge_schwa.py ../gb/$$i $$i > ../merged/$$i ; done
	
rename:
	rename 's/\.g2p//' merged/*
