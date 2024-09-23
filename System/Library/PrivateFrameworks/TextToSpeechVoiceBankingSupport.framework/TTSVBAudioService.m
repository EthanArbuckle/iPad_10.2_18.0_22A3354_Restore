@implementation TTSVBAudioService

- (_TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService)init
{
  return (_TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService *)TTSVBAudioService.init()();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService *v13;
  id v14;
  _TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService *v15;
  _OWORD v16[2];

  if (a3)
  {
    v9 = sub_2487B5528();
    v11 = v10;
    if (a4)
      goto LABEL_3;
LABEL_6:
    memset(v16, 0, sizeof(v16));
    v14 = a5;
    v15 = self;
    if (!a5)
      goto LABEL_7;
    goto LABEL_4;
  }
  v9 = 0;
  v11 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  swift_unknownObjectRetain();
  v12 = a5;
  v13 = self;
  sub_2487B59A8();
  swift_unknownObjectRelease();
  if (a5)
  {
LABEL_4:
    type metadata accessor for NSKeyValueChangeKey(0);
    sub_2486F4CA0(&qword_25777DF48, (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey, (uint64_t)&unk_2487C1A48);
    sub_2487B5474();

  }
LABEL_7:
  _s31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceC12observeValue10forKeyPath2of6change7contextySSSg_ypSgSDySo05NSKeyj6ChangeL0aypGSgSvSgtF_0(v9, v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2486F5008((uint64_t)v16, (uint64_t *)&unk_25777CBD0);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_calloutQueue));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioSession));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioPlayerNode));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService____lazy_storage___audioEngine));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService____lazy_storage___playbackPlayer));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioIOQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_speechRecognitionService));
  swift_bridgeObjectRelease();
}

@end
