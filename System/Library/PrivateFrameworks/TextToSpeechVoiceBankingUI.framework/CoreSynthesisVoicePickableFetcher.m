@implementation CoreSynthesisVoicePickableFetcher

- (void)dealloc
{
  void (*v2)(void);
  _TtC26TextToSpeechVoiceBankingUI33CoreSynthesisVoicePickableFetcher *v3;
  objc_super v4;

  v2 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0x138);
  v3 = self;
  v2();
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for CoreSynthesisVoicePickableFetcher(0);
  -[CoreSynthesisVoicePickableFetcher dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33CoreSynthesisVoicePickableFetcher_assetService));
  swift_bridgeObjectRelease();
  sub_248802884(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33CoreSynthesisVoicePickableFetcher_filterBlock));
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33CoreSynthesisVoicePickableFetcher_requiredTraits;
  v4 = sub_2488BBA1C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC26TextToSpeechVoiceBankingUI33CoreSynthesisVoicePickableFetcher_source);
}

- (void)downloadProgressForVoiceId:(id)a3 progress:(float)a4 storageSize:(int64_t)a5 requiredDiskSpace:(BOOL)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, float);
  _TtC26TextToSpeechVoiceBankingUI33CoreSynthesisVoicePickableFetcher *v12;

  v8 = sub_2488BD7A4();
  v10 = v9;
  v11 = *(void (**)(uint64_t, uint64_t, float))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0x110);
  v12 = self;
  v11(v8, v10, a4);

  swift_bridgeObjectRelease();
}

- (void)finishedDownloadingResource:(id)a3 wasCancelled:(BOOL)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  _TtC26TextToSpeechVoiceBankingUI33CoreSynthesisVoicePickableFetcher *v13;

  v6 = a3;
  v13 = self;
  v7 = objc_msgSend(v6, sel_voiceId);
  if (v7)
  {
    v8 = v7;
    v9 = sub_2488BD7A4();
    v11 = v10;

    if (a4)
      v12 = *(void (**)(uint64_t, uint64_t))((*MEMORY[0x24BEE4EA0] & (uint64_t)v13->super.isa) + 0x128);
    else
      v12 = *(void (**)(uint64_t, uint64_t))((*MEMORY[0x24BEE4EA0] & (uint64_t)v13->super.isa) + 0x120);
    v12(v9, v11);

    swift_bridgeObjectRelease();
  }
  else
  {

  }
}

- (void)finishedDeletingResource:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC26TextToSpeechVoiceBankingUI33CoreSynthesisVoicePickableFetcher *v10;

  v4 = a3;
  v10 = self;
  v5 = objc_msgSend(v4, sel_voiceId);
  if (v5)
  {
    v6 = v5;
    v7 = sub_2488BD7A4();
    v9 = v8;

    (*(void (**)(uint64_t, uint64_t))((*MEMORY[0x24BEE4EA0] & (uint64_t)v10->super.isa) + 0x118))(v7, v9);
    swift_bridgeObjectRelease();
  }
  else
  {

  }
}

- (_TtC26TextToSpeechVoiceBankingUI33CoreSynthesisVoicePickableFetcher)init
{
  _TtC26TextToSpeechVoiceBankingUI33CoreSynthesisVoicePickableFetcher *result;

  result = (_TtC26TextToSpeechVoiceBankingUI33CoreSynthesisVoicePickableFetcher *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
