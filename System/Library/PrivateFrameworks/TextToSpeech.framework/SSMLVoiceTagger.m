@implementation SSMLVoiceTagger

- (_TtC12TextToSpeech15SSMLVoiceTagger)init
{
  _QWORD *v2;
  _QWORD *v3;
  objc_class *v4;
  objc_super v6;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12TextToSpeech15SSMLVoiceTagger_currentVoiceName);
  *v2 = 0;
  v2[1] = 0;
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12TextToSpeech15SSMLVoiceTagger_currentLanguage);
  *v3 = 0;
  v3[1] = 0;
  v4 = (objc_class *)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12TextToSpeech15SSMLVoiceTagger_leafPiles) = (Class)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12TextToSpeech15SSMLVoiceTagger_voiceTagRanges) = v4;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SSMLVoiceTagger();
  return -[SSMLVoiceTagger init](&v6, sel_init);
}

- (id)tagSSML:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _TtC12TextToSpeech15SSMLVoiceTagger *v7;
  _QWORD *v8;

  v4 = sub_1A3AB497C();
  v6 = v5;
  v7 = self;
  v8 = sub_1A39CAE20(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
