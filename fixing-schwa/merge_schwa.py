import sys

gb = sys.argv[1]
us = sys.argv[2]

def op(f):
	o = open(f, "r")
	t = o.readlines()
	o.close()
	return t

gb = op(gb)
us = op(us)

merged = []
for lg,lu in zip(gb, us):
	wlu = lu.split()
	if wlu[0] == "ORT" or not "V" in wlu[2]:
		merged.append(lu)
	else:
		u = wlu[2]
		g = lg.split()[2]
		g = g.replace("@U","#U")
		if not '@' in g:
			merged.append(lu)
		else:
			changed = []
			for i,c in enumerate(u):
				if c != "V":
					changed.append(c)
					continue
				if c == "V" and "@" in g[max(0,i-3):i+3]:
					changed.append("@")
			merged.append(wlu[0]+" "+wlu[1]+" "+"".join(changed)+"\n")


print("".join(merged), end="")
