@implementation MTDebugActionTestCase

- (_TtC8Podcasts21MTDebugActionTestCase)initWithCategory:(id)a3 name:(id)a4 title:(id)a5 handler:(id)a6
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t (**v21)();
  id v22;
  objc_super v24;

  v10 = _Block_copy(a6);
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = v12;
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = v15;
  v17 = swift_allocObject(&unk_1004B8C50, 24, 7);
  *(_QWORD *)(v17 + 16) = v10;
  v18 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts21MTDebugActionTestCase_category);
  v18[3] = (id)type metadata accessor for MTDebugActionTestCategory();
  v18[4] = (id)sub_10025B704();
  *v18 = a3;
  v19 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Podcasts21MTDebugActionTestCase_name);
  *v19 = v11;
  v19[1] = v13;
  v20 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Podcasts21MTDebugActionTestCase_title);
  *v20 = v14;
  v20[1] = v16;
  v21 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC8Podcasts21MTDebugActionTestCase_handler);
  *v21 = sub_1001C0F18;
  v21[1] = (uint64_t (*)())v17;
  v24.receiver = self;
  v24.super_class = (Class)type metadata accessor for MTDebugActionTestCase();
  v22 = a3;
  return -[MTDebugActionTestCase init](&v24, "init");
}

- (_TtC8Podcasts21MTDebugActionTestCase)init
{
  _TtC8Podcasts21MTDebugActionTestCase *result;

  result = (_TtC8Podcasts21MTDebugActionTestCase *)_swift_stdlib_reportUnimplementedInitializer("Podcasts.MTDebugActionTestCase", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10003D380((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts21MTDebugActionTestCase_category));
  swift_bridgeObjectRelease(*(_QWORD *)&self->category[OBJC_IVAR____TtC8Podcasts21MTDebugActionTestCase_name]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->category[OBJC_IVAR____TtC8Podcasts21MTDebugActionTestCase_title]);
  swift_release(*(_QWORD *)&self->category[OBJC_IVAR____TtC8Podcasts21MTDebugActionTestCase_handler]);
}

@end
