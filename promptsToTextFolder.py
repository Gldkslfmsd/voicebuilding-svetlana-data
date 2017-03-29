from string import punctuation
import re

regex = '[{}]'.format(punctuation)

with open("prompts.txt", "r") as prompts:
    for line in prompts.readlines():
        if(line.strip() == ""):
            continue
        fileTo = line.split()[-1]
        prompt = " ".join(line.split()[:-1])
        prompt = re.sub(regex, ' ', prompt)
        #prompt = prompt.replace('.', "").replace(",", " ").replace("?", "").replace("!", "")
        fileTo = fileTo.strip("()")
        with open("text/" + fileTo + ".lab", "w") as target:
            target.write(prompt)
