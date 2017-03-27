#!/bin/bash

DIR=single_utt
AUDIO=group5_mic1.flac
TSV=utterances.tsv

#praat tg2tsv.praat
mkdir -p $DIR
cat $TSV | sed 's/\t/@/g' | {
	read _  # extract header
	while read line; do
		tmin=`echo $line | sed 's/@.*//'`
		tmax=`echo $line | sed 's/[^@]*@[^@]*@//'`
		code=`echo $line | sed -r 's/^[^@]*@([^ ]*) .*$/\1/'`

		echo "processing: $tmin $tmax $code"
		sox $AUDIO $DIR/$code"".wav trim $tmin =$tmax rate 16000
	done
}
