#!/bin/bash

DIR=single_utt
AUDIO=mic12.flac
TSV=utt.tsv

praat tg2tsv.praat
mkdir -p $DIR
cat $TSV | {
	read _  # extract header
	i=0
	while read tmin text tmax; do
		echo "processing: $tmin $text $tmax"
		# TODO: remove $i
		sox $AUDIO $DIR/$text""$i.wav trim $tmin =$tmax rate 16000
		i=$(($i+1))
	done
}
