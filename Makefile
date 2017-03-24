
toflac: group5_mic1.wav group5_mic2.wav group5_midi.wav group5_beeps.wav
	flac group5*

merge:
	sox -M group5_mic*.wav mic12.flac

zip:
	zip voice.zip group*.flac 

download:
	# TODO
	.
