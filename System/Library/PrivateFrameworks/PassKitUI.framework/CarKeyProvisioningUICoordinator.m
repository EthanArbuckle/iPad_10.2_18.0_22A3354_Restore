@implementation CarKeyProvisioningUICoordinator

- (void)dealloc
{
  _TtC9PassKitUI31CarKeyProvisioningUICoordinator *v2;
  objc_super v3;

  v2 = self;
  sub_19D3ADB20();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for CarKeyProvisioningUICoordinator();
  -[CarKeyProvisioningUICoordinator dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI31CarKeyProvisioningUICoordinator_delegate);
  swift_unknownObjectWeakDestroy();
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI31CarKeyProvisioningUICoordinator_renderer);
  swift_release();
  swift_release();
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI31CarKeyProvisioningUICoordinator_provisioningError));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI31CarKeyProvisioningUICoordinator_provisionedPasses));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI31CarKeyProvisioningUICoordinator_idleTimerAssertion));
}

- (_TtC9PassKitUI31CarKeyProvisioningUICoordinator)init
{
  _TtC9PassKitUI31CarKeyProvisioningUICoordinator *result;

  result = (_TtC9PassKitUI31CarKeyProvisioningUICoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
