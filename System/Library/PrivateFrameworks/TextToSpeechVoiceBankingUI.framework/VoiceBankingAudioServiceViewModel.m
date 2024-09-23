@implementation VoiceBankingAudioServiceViewModel

- (_TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel)init
{
  return (_TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel *)sub_24889193C();
}

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257793570);
  MEMORY[0x24BDAC7A8](v7, v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2488BD924();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  sub_2488BD900();
  v12 = self;
  v13 = a3;
  v14 = sub_2488BD8F4();
  v15 = swift_allocObject();
  v16 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v15 + 16) = v14;
  *(_QWORD *)(v15 + 24) = v16;
  *(_BYTE *)(v15 + 32) = a4;
  *(_QWORD *)(v15 + 40) = v12;
  sub_2487F6484((uint64_t)v10, (uint64_t)&unk_257797568, v15);

  swift_release();
}

- (void)applicationDidResign
{
  _TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel *v2;

  v2 = self;
  sub_24889B9C0();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t);
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel_voiceBankingSession));
  v3 = (char *)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel__recordingResult;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257797288);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel_audioService));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel_player));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel_speechRecognitionDelayTimer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel____lazy_storage___manualModeTimeoutQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel_manualModeTimeoutTimer));
  v5 = (char *)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel__synthesizer;
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2577972A0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel__isRecording;
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2577972B0);
  v9 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8);
  v9(v7, v8);
  v10 = (char *)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel__recordingState;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577972C8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  v12 = (char *)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel__inputSource;
  v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2577972E0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  v9((char *)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel__isInputAvailable, v8);
  v9((char *)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel__playingRecording, v8);
  v9((char *)self+ OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel__isRecordingRequestInFlight, v8);
  v14 = (char *)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel__operationError;
  v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2577972F8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v14, v15);
  v16 = (char *)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel__audioButtonState;
  v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257797308);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(v16, v17);
  v18 = (char *)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel__recordingMode;
  v19 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257797328);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(v18, v19);
  swift_bridgeObjectRelease();
}

- (void)speechSynthesizer:(id)a3 didFinishSpeechUtterance:(id)a4
{
  id v6;
  id v7;
  _TtC26TextToSpeechVoiceBankingUI33VoiceBankingAudioServiceViewModel *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_24889CE6C();

}

@end
