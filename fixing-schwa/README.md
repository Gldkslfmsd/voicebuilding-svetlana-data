# Fixing schwa

G2P tool:

http://clarin.phonetik.uni-muenchen.de/BASWebServices/#/services/Grapheme2Phoneme


`gb/*` -- par files created by the G2P online tool from our txt files,
language is British English 

`us/*` -- the same, but US English

`merge_schwa.py` -- script for replacing `V` from US English on the places
where  `@` is in gb

`merged/*` -- resulting par files with fixed schwa

How to run the script on all prompts:

```
cd us
make merge
```

`fixed_text_grids/` -- TextGrids created by WebMAUS from merged par files and audio
