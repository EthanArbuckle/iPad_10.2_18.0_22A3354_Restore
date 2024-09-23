@implementation JetActionHandler

- (void)performRawActionModel:(NSDictionary *)a3 withParentTracker:(_TtC13BookAnalytics9BATracker *)a4 shouldReportFigaro:(BOOL)a5 sourceViewController:(UIViewController *)a6 completion:(id)a7
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  NSDictionary *v21;
  _TtC13BookAnalytics9BATracker *v22;
  UIViewController *v23;
  _TtC11BookStoreUI16JetActionHandler *v24;
  uint64_t v25;
  uint64_t v26;

  v13 = sub_5C154(&qword_329740);
  __chkstk_darwin(v13);
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  v17 = swift_allocObject(&unk_2E82D8, 64, 7);
  *(_QWORD *)(v17 + 16) = a3;
  *(_QWORD *)(v17 + 24) = a4;
  *(_BYTE *)(v17 + 32) = a5;
  *(_QWORD *)(v17 + 40) = a6;
  *(_QWORD *)(v17 + 48) = v16;
  *(_QWORD *)(v17 + 56) = self;
  v18 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = (_QWORD *)swift_allocObject(&unk_2E8300, 48, 7);
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_3206A8;
  v19[5] = v17;
  v20 = (_QWORD *)swift_allocObject(&unk_2E8328, 48, 7);
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_3206B0;
  v20[5] = v19;
  v21 = a3;
  v22 = a4;
  v23 = a6;
  v24 = self;
  v25 = sub_174AF8((uint64_t)v15, (uint64_t)&unk_3206B8, (uint64_t)v20);
  swift_release(v25);
}

- (_TtC11BookStoreUI16JetActionHandler)init
{
  _TtC11BookStoreUI16JetActionHandler *result;

  result = (_TtC11BookStoreUI16JetActionHandler *)_swift_stdlib_reportUnimplementedInitializer("BookStoreUI.JetActionHandler", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11BookStoreUI16JetActionHandler_objectGraph));
}

@end
