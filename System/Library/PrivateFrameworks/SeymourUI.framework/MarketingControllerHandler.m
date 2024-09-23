@implementation MarketingControllerHandler

- (_TtC9SeymourUI26MarketingControllerHandler)init
{
  _TtC9SeymourUI26MarketingControllerHandler *result;

  result = (_TtC9SeymourUI26MarketingControllerHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC9SeymourUI26MarketingControllerHandler_actionHandler));
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI26MarketingControllerHandler_impressionConsumer);
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI26MarketingControllerHandler_metricPage;
  v4 = sub_22BA79CF8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
}

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  id v6;
  id v7;
  _TtC9SeymourUI26MarketingControllerHandler *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22B7B9548(v6, v7);

}

- (void)messageViewController:(id)a3 enqueueEventWithFields:(id)a4 inTopic:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  _TtC9SeymourUI26MarketingControllerHandler *v12;

  v8 = sub_22BA8052C();
  if (a5)
  {
    v9 = sub_22BA8067C();
    a5 = v10;
  }
  else
  {
    v9 = 0;
  }
  v11 = a3;
  v12 = self;
  sub_22B7BA77C(v8, v9, (unint64_t)a5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

@end
