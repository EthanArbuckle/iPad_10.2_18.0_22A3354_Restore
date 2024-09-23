@implementation TranscriptionModelAssetService

+ (_TtC10VoiceMemos30TranscriptionModelAssetService)sharedInstance
{
  if (qword_1001E9058 != -1)
    swift_once(&qword_1001E9058, sub_1000EB6A4);
  return (_TtC10VoiceMemos30TranscriptionModelAssetService *)(id)qword_1001F6E18;
}

- (_TtC10VoiceMemos30TranscriptionModelAssetService)init
{
  uint64_t v3;
  uint64_t v4;
  _TtC10VoiceMemos30TranscriptionModelAssetService *v5;
  objc_super v7;
  uint64_t v8;
  char v9;

  v3 = OBJC_IVAR____TtC10VoiceMemos30TranscriptionModelAssetService__downloadStateValueSubject;
  v8 = 0;
  v9 = 0x80;
  v4 = sub_100014E10((uint64_t *)&unk_1001EC3D0);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)CurrentValueSubject.init(_:)(&v8);

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for TranscriptionModelAssetService();
  return -[TranscriptionModelAssetService init](&v7, "init");
}

- (void)assetIsInstalledWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC10VoiceMemos30TranscriptionModelAssetService *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_100014E10(&qword_1001E9BB0);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_1001B1C70, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_1001B1C98, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1001EC3B8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_1001B1CC0, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1001EC3C0;
  v12[5] = v11;
  v13 = self;
  v14 = sub_10010485C((uint64_t)v7, (uint64_t)&unk_1001EC3C8, (uint64_t)v12);
  swift_release(v14);
}

- (void)isAvailableWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC10VoiceMemos30TranscriptionModelAssetService *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_100014E10(&qword_1001E9BB0);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_1001B1BF8, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_1001B1C20, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1001EC3A8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_1001B1C48, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1001EA788;
  v12[5] = v11;
  v13 = self;
  v14 = sub_10010485C((uint64_t)v7, (uint64_t)&unk_1001EA790, (uint64_t)v12);
  swift_release(v14);
}

- (void)downloadAsset
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _TtC10VoiceMemos30TranscriptionModelAssetService *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = sub_100014E10(&qword_1001E9BB0);
  __chkstk_darwin(v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  type metadata accessor for MainActor(0);
  v7 = self;
  v8 = static MainActor.shared.getter(v7);
  v9 = (_QWORD *)swift_allocObject(&unk_1001B1B10, 40, 7);
  v9[2] = v8;
  v9[3] = &protocol witness table for MainActor;
  v9[4] = v7;
  v10 = sub_1000F7930((uint64_t)v5, (uint64_t)&unk_1001EA740, (uint64_t)v9);
  swift_release(v10);

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC10VoiceMemos30TranscriptionModelAssetService__downloadStateValueSubject));
}

@end
