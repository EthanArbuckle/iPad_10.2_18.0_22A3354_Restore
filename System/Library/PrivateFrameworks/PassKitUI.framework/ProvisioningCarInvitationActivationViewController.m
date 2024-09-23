@implementation ProvisioningCarInvitationActivationViewController

- (void)loadView
{
  _TtC9PassKitUI49ProvisioningCarInvitationActivationViewController *v2;

  v2 = self;
  sub_19D398438();

}

- (_TtC9PassKitUI49ProvisioningCarInvitationActivationViewController)initWithContext:(int64_t)a3
{
  _TtC9PassKitUI49ProvisioningCarInvitationActivationViewController *result;

  result = (_TtC9PassKitUI49ProvisioningCarInvitationActivationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI49ProvisioningCarInvitationActivationViewController_provisionedPasses));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI49ProvisioningCarInvitationActivationViewController_invitation));
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI49ProvisioningCarInvitationActivationViewController_delegate);
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t ObjectType;
  id v10;
  _TtC9PassKitUI49ProvisioningCarInvitationActivationViewController *v11;

  v5 = MEMORY[0x1A1AE6A68]((char *)self + OBJC_IVAR____TtC9PassKitUI49ProvisioningCarInvitationActivationViewController_delegate, a2);
  if (v5)
  {
    v6 = v5;
    v7 = v5 + OBJC_IVAR____TtC9PassKitUI43ProvisioningCarInvitationActivationFlowItem_delegate;
    if (MEMORY[0x1A1AE6A68](v5 + OBJC_IVAR____TtC9PassKitUI43ProvisioningCarInvitationActivationFlowItem_delegate))
    {
      v8 = *(_QWORD *)(v7 + 8);
      ObjectType = swift_getObjectType();
      v10 = a3;
      v11 = self;
      sub_19D789E94(v6, (uint64_t)&off_1E3E35D68, ObjectType, v8);

      swift_unknownObjectRelease();
    }
    swift_unknownObjectRelease();
  }
}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  _TtC9PassKitUI49ProvisioningCarInvitationActivationViewController *v7;

  v4 = a3;
  v7 = self;
  v5 = -[ProvisioningCarInvitationActivationViewController view](v7, sel_view);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_setUserInteractionEnabled_, v4 ^ 1);

    -[PKExplanationViewController showSpinner:](v7, sel_showSpinner_, v4);
  }
  else
  {
    __break(1u);
  }
}

@end
