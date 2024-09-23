@implementation ProvisioningVerificationMethodsFlowItem

- (_TtC9PassKitUI39ProvisioningVerificationMethodsFlowItem)init
{
  _TtC9PassKitUI39ProvisioningVerificationMethodsFlowItem *result;

  result = (_TtC9PassKitUI39ProvisioningVerificationMethodsFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI39ProvisioningVerificationMethodsFlowItem_verificationController));
  swift_unknownObjectWeakDestroy();
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI39ProvisioningVerificationMethodsFlowItem_delegate);
  swift_bridgeObjectRelease();
}

- (void)showExternalVerificationForVerificationMethodsViewController:(id)a3
{
  sub_19D595234((char *)self, (uint64_t)a2, a3, (void (*)(void))sub_19D595664);
}

- (void)showVerificationCompletionForVerificationMethodsViewController:(id)a3
{
  sub_19D595234((char *)self, (uint64_t)a2, a3, (void (*)(void))sub_19D5957BC);
}

- (void)showVerificationMethodsForVerificationMethodsViewController:(id)a3
{
  sub_19D595234((char *)self, (uint64_t)a2, a3, (void (*)(void))sub_19D5954FC);
}

- (void)verificationMethodsViewControllerDidFinish:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t ObjectType;
  id v8;
  _TtC9PassKitUI39ProvisioningVerificationMethodsFlowItem *v9;

  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI39ProvisioningVerificationMethodsFlowItem_delegate;
  if (MEMORY[0x1A1AE6A68]((char *)self + OBJC_IVAR____TtC9PassKitUI39ProvisioningVerificationMethodsFlowItem_delegate, a2))
  {
    v6 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType();
    v8 = a3;
    v9 = self;
    sub_19D789E94((uint64_t)v9, (uint64_t)&off_1E3E43B58, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

@end
