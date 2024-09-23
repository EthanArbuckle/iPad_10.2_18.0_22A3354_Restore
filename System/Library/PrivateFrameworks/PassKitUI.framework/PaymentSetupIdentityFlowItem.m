@implementation PaymentSetupIdentityFlowItem

- (_TtC9PassKitUI28PaymentSetupIdentityFlowItem)init
{
  _TtC9PassKitUI28PaymentSetupIdentityFlowItem *result;

  result = (_TtC9PassKitUI28PaymentSetupIdentityFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
  sub_19D7BF36C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI28PaymentSetupIdentityFlowItem_region), *(_QWORD *)&self->context[OBJC_IVAR____TtC9PassKitUI28PaymentSetupIdentityFlowItem_region]);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI28PaymentSetupIdentityFlowItem_proofingManager));
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI28PaymentSetupIdentityFlowItem_delegate);
  swift_bridgeObjectRelease();
}

- (void)proofingFlowManager:(id)a3 completedProofingWithError:(id)a4
{
  id v6;
  _TtC9PassKitUI28PaymentSetupIdentityFlowItem *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_19D8291AC(a4);

}

- (void)proofingFlowManager:(id)a3 didChangeActiveConfigurations:(id)a4
{
  uint64_t v4;
  id v7;
  _TtC9PassKitUI28PaymentSetupIdentityFlowItem *v8;

  v4 = (uint64_t)a4;
  if (a4)
  {
    sub_19D1A9ED4(0, &qword_1EE4B9368);
    v4 = sub_19DE87E10();
  }
  v7 = a3;
  v8 = self;
  sub_19D829394(v4);

  swift_bridgeObjectRelease();
}

@end
