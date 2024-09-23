@implementation ProvisioningPushProvAddPassFlowItem

- (_TtC9PassKitUI35ProvisioningPushProvAddPassFlowItem)init
{
  _TtC9PassKitUI35ProvisioningPushProvAddPassFlowItem *result;

  result = (_TtC9PassKitUI35ProvisioningPushProvAddPassFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI35ProvisioningPushProvAddPassFlowItem_coordinator));
  swift_weakDestroy();
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI35ProvisioningPushProvAddPassFlowItem_delegate);
  swift_bridgeObjectRelease();
}

- (void)startProvisioningWithConfiguration:(id)a3
{
  _TtC9PassKitUI35ProvisioningPushProvAddPassFlowItem *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_19D7B29B8(a3);
  swift_unknownObjectRelease();

}

- (void)startProvisioningWithCredentials:(id)a3
{
  unint64_t v4;
  _TtC9PassKitUI35ProvisioningPushProvAddPassFlowItem *v5;

  sub_19D1A9ED4(0, (unint64_t *)&unk_1EE4B6750);
  v4 = sub_19DE87E10();
  v5 = self;
  sub_19D7B2DEC(v4);

  swift_bridgeObjectRelease();
}

- (void)continueProvisioning
{
  void *v2;
  id v4;
  _TtC9PassKitUI35ProvisioningPushProvAddPassFlowItem *v5;
  id v6;
  id v7;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI35ProvisioningPushProvAddPassFlowItem_coordinator);
  if (v2)
  {
    v4 = objc_allocWithZone(MEMORY[0x1E0D67300]);
    v5 = self;
    v6 = v2;
    v7 = objc_msgSend(v4, sel_init);
    sub_19D759A4C(v7);

  }
}

- (void)cancel
{
  void *v2;
  _TtC9PassKitUI35ProvisioningPushProvAddPassFlowItem *v3;
  id v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI35ProvisioningPushProvAddPassFlowItem_coordinator);
  if (v2)
  {
    v3 = self;
    v4 = v2;
    sub_19D75A530();

  }
}

- (void)pushableViewController:(id)a3 didFailWithError:(id)a4
{
  _TtC9PassKitUI35ProvisioningPushProvAddPassFlowItem *v6;
  id v7;

  swift_unknownObjectRetain();
  v6 = self;
  v7 = a4;
  sub_19D7B3D4C(a4);
  swift_unknownObjectRelease();

}

@end
