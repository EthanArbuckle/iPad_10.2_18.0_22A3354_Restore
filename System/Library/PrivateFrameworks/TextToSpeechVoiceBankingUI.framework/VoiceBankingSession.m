@implementation VoiceBankingSession

- (_TtC26TextToSpeechVoiceBankingUI19VoiceBankingSession)init
{
  return (_TtC26TextToSpeechVoiceBankingUI19VoiceBankingSession *)VoiceBankingSession.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;

  v3 = (char *)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI19VoiceBankingSession__script;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257796620);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI19VoiceBankingSession__configurationStage;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257796630);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self
     + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI19VoiceBankingSession__speechRecognitionDownloadProgress;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257796638);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  sub_2487F3864((uint64_t)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI19VoiceBankingSession_voiceID, &qword_257794250);
  v9 = (char *)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI19VoiceBankingSession_voiceCreationLocale;
  v10 = sub_2488BBF68();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  v11 = (char *)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI19VoiceBankingSession__trainingScriptType;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_257796640);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v13 = (char *)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI19VoiceBankingSession__sample;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_257796650);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI19VoiceBankingSession_voiceBankingManager));
}

@end
