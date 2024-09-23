@implementation ProvisioningCarKeyInvitationFlowItem

- (_TtC9PassKitUI36ProvisioningCarKeyInvitationFlowItem)init
{
  _TtC9PassKitUI36ProvisioningCarKeyInvitationFlowItem *result;

  result = (_TtC9PassKitUI36ProvisioningCarKeyInvitationFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI36ProvisioningCarKeyInvitationFlowItem_credential));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI36ProvisioningCarKeyInvitationFlowItem_coordinator));
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI36ProvisioningCarKeyInvitationFlowItem_delegate);
  swift_bridgeObjectRelease();
}

- (void)carKeyInvitationViewControllerDidRequestStart:(id)a3
{
  void *v3;
  id v6;
  id v7;
  _TtC9PassKitUI36ProvisioningCarKeyInvitationFlowItem *v8;
  id v9;
  id v10;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI36ProvisioningCarKeyInvitationFlowItem_coordinator);
  if (v3)
  {
    v6 = objc_allocWithZone(MEMORY[0x1E0D67300]);
    v7 = a3;
    v8 = self;
    v9 = v3;
    v10 = objc_msgSend(v6, sel_init);
    sub_19D3AC118(v10);

  }
}

- (void)carKeyInvitationViewControllerDidCancel:(id)a3
{
  void *v3;
  id v5;
  _TtC9PassKitUI36ProvisioningCarKeyInvitationFlowItem *v6;
  id v7;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI36ProvisioningCarKeyInvitationFlowItem_coordinator);
  if (v3)
  {
    v5 = a3;
    v6 = self;
    v7 = v3;
    sub_19D3ACE40();

  }
}

- (void)carKeyInvitationViewController:(id)a3 didEnterActivationCode:(id)a4
{
  void *v6;
  id v7;
  _TtC9PassKitUI36ProvisioningCarKeyInvitationFlowItem *v8;
  id v9;

  sub_19DE87BF4();
  v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI36ProvisioningCarKeyInvitationFlowItem_coordinator);
  if (v6)
  {
    v7 = a3;
    v8 = self;
    v9 = v6;
    sub_19D3AD13C();

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

@end
