@implementation PFTranscriptProviderBridge

+ (PFTranscriptProviderBridge)shared
{
  if (qword_1EDADECD8 != -1)
    swift_once();
  return (PFTranscriptProviderBridge *)(id)qword_1EDADF9B0;
}

- (void)invalidateTranscriptAssetForAdamID:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  PFTranscriptProviderBridge *v9;
  id v10;
  _QWORD v11[6];

  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PFTranscriptProviderBridge_managedObjectContext);
  v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = v5;
  v7[3] = a3;
  v7[4] = v6;
  v11[4] = sub_1DA597E2C;
  v11[5] = v7;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1107296256;
  v11[2] = sub_1DA4A9194;
  v11[3] = &block_descriptor_24;
  v8 = _Block_copy(v11);
  v9 = self;
  v10 = v5;
  swift_release();
  objc_msgSend(v10, sel_performBlock_, v8);
  _Block_release(v8);

}

- (void)updateTTMLIDFrom:(id)a3 toNewID:(id)a4 hasDownloadedContent:(BOOL)a5 forEpisodeAdamID:(int64_t)a6
{
  id v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  PFTranscriptProviderBridge *v15;

  v8 = a4;
  if (!a3)
  {
    v10 = 0;
    v12 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  v10 = sub_1DA66F8BC();
  v12 = v11;
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v13 = sub_1DA66F8BC();
  v8 = v14;
LABEL_6:
  v15 = self;
  sub_1DA59625C(v10, v12, v13, (uint64_t)v8, a5, a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (PFTranscriptProviderBridge)init
{
  PFTranscriptProviderBridge *result;

  result = (PFTranscriptProviderBridge *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___PFTranscriptProviderBridge_wrappedProvider);

}

@end
