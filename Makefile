
toflac: group5_mic1.wav group5_mic2.wav group5_midi.wav group5_beeps.wav
	flac group5*

merge:
	sox -M group5_mic*.flac mic12.flac

zip:
	zip voice.zip group*.flac 

normalize:
	sox group5_mic1.flac -r 16000 tmp.flac
	sox -v 3.0 tmp.flac mic1_norm.flac
	rm tmp.flac

download:
	# download this file manually via browser, it's in a private repository
	# so wget can't see it now.
	#wget https://github.com/Gldkslfmsd/voicebuilding-svetlana-voice/releases/download/voice-data/voice.zip -O voice.zip
	unzip voice.zip
	rm -rf voice.zip

f=single_utt

split_to_utt:
	./split_to_utt.sh



zip_single:
	zip single_utt.zip single_utt/*
