@implementation DigitalPresentmentSessionProxy

- (void)canRequestDocumentWithDescriptor:(_TtC7CoreIDV29XPCIdentityDocumentDescriptor *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC7CoreIDV29XPCIdentityDocumentDescriptor *v15;
  uint64_t v16;
  uint64_t v17;

  v7 = sub_100004828(&qword_10062FEC0);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_100615F80, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_100615FA8, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10063F2B0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_100615FD0, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10063F2B8;
  v14[5] = v13;
  v15 = a3;
  swift_retain(self);
  v16 = sub_1004B685C((uint64_t)v9, (uint64_t)&unk_10063F2C0, (uint64_t)v14);
  swift_release(v16);
}

- (void)requestDocument:(_TtC7CoreIDV25DigitalPresentmentRequest *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC7CoreIDV25DigitalPresentmentRequest *v15;
  uint64_t v16;
  uint64_t v17;

  v7 = sub_100004828(&qword_10062FEC0);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_100615F08, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_100615F30, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10063F290;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_100615F58, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10063F298;
  v14[5] = v13;
  v15 = a3;
  swift_retain(self);
  v16 = sub_1004B685C((uint64_t)v9, (uint64_t)&unk_10063F2A0, (uint64_t)v14);
  swift_release(v16);
}

- (void)cancelRequestWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = sub_100004828(&qword_10062FEC0);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_100615E90, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_100615EB8, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_10063F280;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_100615EE0, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100634BB0;
  v12[5] = v11;
  swift_retain(self);
  v13 = sub_1004B685C((uint64_t)v7, (uint64_t)&unk_100631240, (uint64_t)v12);
  swift_release(v13);
}

@end
