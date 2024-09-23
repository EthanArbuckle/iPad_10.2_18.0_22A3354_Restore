@implementation TTSVBSpeechRecognitionService

- (_TtC31TextToSpeechVoiceBankingSupport29TTSVBSpeechRecognitionService)init
{
  return (_TtC31TextToSpeechVoiceBankingSupport29TTSVBSpeechRecognitionService *)sub_248759610();
}

- (void)speechRecognitionTask:(id)a3 didHypothesizeTranscription:(id)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _TtC31TextToSpeechVoiceBankingSupport29TTSVBSpeechRecognitionService *v12;
  _QWORD v13[6];

  v7 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport29TTSVBSpeechRecognitionService_userFinishedSpeakingTimer);
  v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v13[4] = sub_24875D388;
  v13[5] = v8;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 1107296256;
  v13[2] = sub_2486F1008;
  v13[3] = &block_descriptor_54;
  v9 = _Block_copy(v13);
  v10 = a3;
  v11 = a4;
  v12 = self;
  swift_release();
  objc_msgSend(v7, sel_afterDelay_processBlock_, v9, 1.0);
  _Block_release(v9);

}

- (void)speechRecognitionTask:(id)a3 didFinishRecognition:(id)a4
{
  id v6;
  id v7;
  _TtC31TextToSpeechVoiceBankingSupport29TTSVBSpeechRecognitionService *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_24875C204(v6, v7);

}

- (void)speechRecognitionTask:(id)a3 didFinishSuccessfully:(BOOL)a4
{
  id v6;
  _TtC31TextToSpeechVoiceBankingSupport29TTSVBSpeechRecognitionService *v7;

  v6 = a3;
  v7 = self;
  sub_24875C8F8(v6, a4);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport29TTSVBSpeechRecognitionService_recognitionRequest));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport29TTSVBSpeechRecognitionService_recognitionTask));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport29TTSVBSpeechRecognitionService_speechRecognitionQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport29TTSVBSpeechRecognitionService_userFinishedSpeakingTimer));
  swift_bridgeObjectRelease();
  sub_24875D40C((uint64_t)self + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport29TTSVBSpeechRecognitionService_delegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport29TTSVBSpeechRecognitionService__cachedRecognizer));
}

@end
