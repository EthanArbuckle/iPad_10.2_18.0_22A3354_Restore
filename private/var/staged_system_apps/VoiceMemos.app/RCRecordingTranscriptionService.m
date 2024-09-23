@implementation RCRecordingTranscriptionService

+ (RCRecordingTranscriptionService)sharedInstance
{
  if (qword_1001E8F88 != -1)
    swift_once(&qword_1001E8F88, sub_1000B6710);
  return (RCRecordingTranscriptionService *)(id)qword_1001F6C38;
}

- (RCRecordingTranscriptionService)init
{
  _QWORD *v2;
  objc_super v4;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___RCRecordingTranscriptionService_fileTranscriptionTask);
  v2[1] = 0;
  v2[2] = 0;
  *v2 = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR___RCRecordingTranscriptionService_isTranscribingLive) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for RecordingTranscriptionService();
  return -[RCRecordingTranscriptionService init](&v4, "init");
}

- (void)startTranscriptionFor:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  RCRecordingTranscriptionService *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_100014E10(&qword_1001E9BB0);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;
  v11 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v7, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject(&unk_1001AF0E0, 56, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = self;
  v12[5] = v8;
  v12[6] = v10;
  v13 = self;
  swift_bridgeObjectRetain(v10);
  v14 = sub_1000F7930((uint64_t)v7, (uint64_t)&unk_1001EA7A0, (uint64_t)v12);
  swift_release(v14);
  swift_bridgeObjectRelease(v10);

}

- (void)cancelFileTranscriptionWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  RCRecordingTranscriptionService *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_100014E10(&qword_1001E9BB0);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_1001AF068, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_1001AF090, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1001EA780;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_1001AF0B8, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1001EA788;
  v12[5] = v11;
  v13 = self;
  v14 = sub_10010485C((uint64_t)v7, (uint64_t)&unk_1001EA790, (uint64_t)v12);
  swift_release(v14);
}

- (void).cxx_destruct
{
  sub_1000B8A20(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___RCRecordingTranscriptionService_fileTranscriptionTask), *(_QWORD *)&self->fileTranscriptionTask[OBJC_IVAR___RCRecordingTranscriptionService_fileTranscriptionTask], *(_QWORD *)&self->fileTranscriptionTask[OBJC_IVAR___RCRecordingTranscriptionService_fileTranscriptionTask + 8]);
}

@end
