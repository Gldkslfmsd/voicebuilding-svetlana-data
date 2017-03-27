select all
nocheck Remove
clearinfo

# timit.txt contains all TIMIT prompts (without comments!)
# utterances.TextGrid contains all utterances, speech intervals must not be empty
timit = Read Strings from raw text file... timit.txt
tg = Read from file... utterances.TextGrid
snd = Open long sound file... group5.flac
plus tg
View & Edit

t = 0
select tg
ni = Get number of intervals... 1
for i to ni
  label$ = Get label of interval... 1 i
  if label$ != ""
    t += 1
    select timit
    prompt$ = Get string... t
    code$ = replace_regex$(prompt$, "(.+)\((s.\d+)\)$", "\2 \1", 1)
    select tg
    Set interval text... 1 i 'code$'
  endif
endfor
