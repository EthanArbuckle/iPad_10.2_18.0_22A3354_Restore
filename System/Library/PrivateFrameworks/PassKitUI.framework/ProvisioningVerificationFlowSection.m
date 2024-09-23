@implementation ProvisioningVerificationFlowSection

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC9PassKitUI35ProvisioningVerificationFlowSection *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC9PassKitUI35ProvisioningVerificationFlowSection_verificationController);
  v5 = self;
  objc_msgSend(v4, sel_setFlowDelegate_, 0);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[ProvisioningVerificationFlowSection dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI35ProvisioningVerificationFlowSection_provisionedPasses));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI35ProvisioningVerificationFlowSection_verificationController));
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI35ProvisioningVerificationFlowSection_delegate);
  swift_bridgeObjectRelease();
}

- (_TtC9PassKitUI35ProvisioningVerificationFlowSection)init
{
  _TtC9PassKitUI35ProvisioningVerificationFlowSection *result;

  result = (_TtC9PassKitUI35ProvisioningVerificationFlowSection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)presentationContext
{
  _TtC9PassKitUI35ProvisioningVerificationFlowSection *v2;
  id v3;

  v2 = self;
  v3 = sub_19D34542C();

  return v3;
}

- (void)didFinishVerification
{
  char *v3;
  uint64_t v4;
  uint64_t ObjectType;
  _TtC9PassKitUI35ProvisioningVerificationFlowSection *v6;

  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI35ProvisioningVerificationFlowSection_delegate;
  if (MEMORY[0x1A1AE6A68]((char *)self + OBJC_IVAR____TtC9PassKitUI35ProvisioningVerificationFlowSection_delegate, a2))
  {
    v4 = *((_QWORD *)v3 + 1);
    ObjectType = swift_getObjectType();
    v6 = self;
    sub_19D789E94((uint64_t)v6, (uint64_t)&off_1E3E30EC0, ObjectType, v4);

    swift_unknownObjectRelease();
  }
}

@end
