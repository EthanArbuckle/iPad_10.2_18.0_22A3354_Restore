@implementation UIFlowManager

- (_TtC9PassKitUI13UIFlowManager)init
{
  _TtC9PassKitUI13UIFlowManager *result;

  result = (_TtC9PassKitUI13UIFlowManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI13UIFlowManager_parentRenderer);
  sub_19D1A9F60(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI13UIFlowManager_resultHandler));
  sub_19D1A9F60(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI13UIFlowManager_onViewLoaded));
  swift_release();
  swift_release();
  sub_19D1A9F60(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI13UIFlowManager_completion));
  swift_bridgeObjectRelease();
}

- (void)rendererDidRunOutOfContentWithRenderer:(id)a3
{
  sub_19D429E68(self, (uint64_t)a2, (uint64_t)a3, sub_19D429C40);
}

- (void)rendererDidDisappearWithRenderer:(id)a3
{
  sub_19D429E68(self, (uint64_t)a2, (uint64_t)a3, sub_19D429C40);
}

@end
