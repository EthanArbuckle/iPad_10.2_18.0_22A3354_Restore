@implementation CRLBoardFileReadAssistant

- (void)readBoardWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC8Freeform25CRLBoardFileReadAssistant *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_1004B804C(&qword_1013E01F0);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_10126F090, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_10126F0B8, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1013E51C0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_10126F0E0, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1013E51C8;
  v12[5] = v11;
  v13 = self;
  v14 = sub_100C46C50((uint64_t)v7, (uint64_t)&unk_1013E51D0, (uint64_t)v12);
  swift_release(v14);
}

- (void)getOriginalBoardUUIDWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC8Freeform25CRLBoardFileReadAssistant *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_1004B804C(&qword_1013E01F0);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_10126F018, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_10126F040, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1013E51B0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_10126F068, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10140B7B0;
  v12[5] = v11;
  v13 = self;
  v14 = sub_100C46C50((uint64_t)v7, (uint64_t)&unk_101405D50, (uint64_t)v12);
  swift_release(v14);
}

- (_TtC8Freeform25CRLBoardFileReadAssistant)init
{
  _TtC8Freeform25CRLBoardFileReadAssistant *result;

  result = (_TtC8Freeform25CRLBoardFileReadAssistant *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLBoardFileReadAssistant", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8Freeform25CRLBoardFileReadAssistant_url;
  v4 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLBoardFileReadAssistant_readAssistant));
}

@end
