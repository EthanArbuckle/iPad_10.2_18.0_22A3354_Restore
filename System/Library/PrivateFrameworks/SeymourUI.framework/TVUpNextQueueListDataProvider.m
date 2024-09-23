@implementation TVUpNextQueueListDataProvider

- (_TtC9SeymourUI29TVUpNextQueueListDataProvider)init
{
  _TtC9SeymourUI29TVUpNextQueueListDataProvider *result;

  result = (_TtC9SeymourUI29TVUpNextQueueListDataProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC9SeymourUI29TVUpNextQueueListDataProvider_onFocusSettled));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC9SeymourUI29TVUpNextQueueListDataProvider_onUpNextQueueItemsChanged));

  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI29TVUpNextQueueListDataProvider_metricPage;
  v4 = sub_22BA79CF8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  _TtC9SeymourUI29TVUpNextQueueListDataProvider *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_22B357CC4(v6);

  return v9;
}

@end
