@implementation ProvisioningVerificationCompletionFlowItem

- (_TtC9PassKitUI42ProvisioningVerificationCompletionFlowItem)init
{
  _TtC9PassKitUI42ProvisioningVerificationCompletionFlowItem *result;

  result = (_TtC9PassKitUI42ProvisioningVerificationCompletionFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI42ProvisioningVerificationCompletionFlowItem_verificationController));
  swift_unknownObjectWeakDestroy();
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI42ProvisioningVerificationCompletionFlowItem_delegate);
  swift_bridgeObjectRelease();
}

- (void)verificationCompletionViewControllerDidFinish:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t ObjectType;
  id v8;
  _TtC9PassKitUI42ProvisioningVerificationCompletionFlowItem *v9;

  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI42ProvisioningVerificationCompletionFlowItem_delegate;
  if (MEMORY[0x1A1AE6A68]((char *)self + OBJC_IVAR____TtC9PassKitUI42ProvisioningVerificationCompletionFlowItem_delegate, a2))
  {
    v6 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType();
    v8 = a3;
    v9 = self;
    sub_19D789E94((uint64_t)v9, (uint64_t)&off_1E3E30BD8, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

- (void)showVerificationMethodsForVerificationCompletionViewController:(id)a3
{
  void *v4;
  _TtC9PassKitUI42ProvisioningVerificationCompletionFlowItem *v5;
  uint64_t v6;
  _TtC9PassKitUI42ProvisioningVerificationCompletionFlowItem *v7;
  _TtC9PassKitUI42ProvisioningVerificationCompletionFlowItem *v8;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC9PassKitUI42ProvisioningVerificationCompletionFlowItem_verificationController);
  v8 = self;
  v5 = (_TtC9PassKitUI42ProvisioningVerificationCompletionFlowItem *)a3;
  objc_msgSend(v4, sel_clearSelectedChannel);
  v6 = MEMORY[0x1A1AE6A68]((char *)v8 + OBJC_IVAR____TtC9PassKitUI42ProvisioningVerificationCompletionFlowItem_managingSection);
  if (v6)
  {
    v7 = (_TtC9PassKitUI42ProvisioningVerificationCompletionFlowItem *)v6;
    sub_19D595390((uint64_t)v8, v6);

    v5 = v8;
    v8 = v7;
  }

}

@end
