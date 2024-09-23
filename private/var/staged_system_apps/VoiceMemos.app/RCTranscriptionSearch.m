@implementation RCTranscriptionSearch

+ (void)recordingURIsForTranscriptionsContaining:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  uint64_t v16;
  uint64_t v17;

  v7 = sub_100014E10(&qword_1001E9BB0);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_1001B1E88, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_1001B1EB0, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1001ECAB8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_1001B1ED8, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1001EA788;
  v14[5] = v13;
  v15 = a3;
  v16 = sub_10010485C((uint64_t)v9, (uint64_t)&unk_1001EA790, (uint64_t)v14);
  swift_release(v16);
}

- (_TtC10VoiceMemos21RCTranscriptionSearch)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RCTranscriptionSearch();
  return -[RCTranscriptionSearch init](&v3, "init");
}

@end
