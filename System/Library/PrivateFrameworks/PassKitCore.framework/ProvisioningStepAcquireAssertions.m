@implementation ProvisioningStepAcquireAssertions

- (void)dealloc
{
  _TtC11PassKitCore33ProvisioningStepAcquireAssertions *v2;

  v2 = self;
  ProvisioningStepAcquireAssertions.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
  sub_18FCD6F28(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC11PassKitCore33ProvisioningStepAcquireAssertions_credential), *(_QWORD *)&self->context[OBJC_IVAR____TtC11PassKitCore33ProvisioningStepAcquireAssertions_credential], *(_QWORD *)&self->credential[OBJC_IVAR____TtC11PassKitCore33ProvisioningStepAcquireAssertions_credential], self->credential[OBJC_IVAR____TtC11PassKitCore33ProvisioningStepAcquireAssertions_credential + 8]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11PassKitCore33ProvisioningStepAcquireAssertions_sharedState));
}

- (_TtC11PassKitCore33ProvisioningStepAcquireAssertions)init
{
  _TtC11PassKitCore33ProvisioningStepAcquireAssertions *result;

  result = (_TtC11PassKitCore33ProvisioningStepAcquireAssertions *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
