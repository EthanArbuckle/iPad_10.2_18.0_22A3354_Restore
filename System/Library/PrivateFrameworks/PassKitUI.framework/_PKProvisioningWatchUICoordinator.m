@implementation _PKProvisioningWatchUICoordinator

- (PKProvisioningWatchUICoordinatorDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____PKProvisioningWatchUICoordinator_delegate;
  swift_beginAccess();
  return (PKProvisioningWatchUICoordinatorDelegate *)(id)MEMORY[0x1A1AE6A68](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (_PKProvisioningWatchUICoordinator)initWithSetupContext:(int64_t)a3 provisioningController:(id)a4 credential:(id)a5
{
  id v7;
  id v8;
  _PKProvisioningWatchUICoordinator *v9;

  v7 = a4;
  v8 = a5;
  v9 = (_PKProvisioningWatchUICoordinator *)sub_19D46B8D0(a3, v7, v8);

  return v9;
}

- (_PKProvisioningWatchUICoordinator)initWithManualEntrySetupContext:(int64_t)a3 provisioningController:(id)a4 skipRequirements:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  _PKProvisioningWatchUICoordinator *v8;

  v5 = a5;
  v7 = a4;
  v8 = (_PKProvisioningWatchUICoordinator *)sub_19D46BBBC(a3, v7, v5);

  return v8;
}

- (void)dealloc
{
  _PKProvisioningWatchUICoordinator *v2;
  objc_super v3;

  v2 = self;
  sub_19D468768();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for ProvisioningWatchUICoordinator();
  -[_PKProvisioningWatchUICoordinator dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____PKProvisioningWatchUICoordinator_delegate);
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)continueWithFieldsModel:(id)a3
{
  id v4;
  _PKProvisioningWatchUICoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_19D467A00(v4);

}

- (void)preflightWithFieldModel:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _PKProvisioningWatchUICoordinator *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_19D467AE0(v8, (uint64_t)sub_19D266A30, v7);

  swift_release();
}

- (void)reset
{
  _PKProvisioningWatchUICoordinator *v2;

  v2 = self;
  sub_19D467EF4();

}

- (void)cancel
{
  _PKProvisioningWatchUICoordinator *v2;

  v2 = self;
  sub_19D468F14();

}

- (_PKProvisioningWatchUICoordinator)init
{
  _PKProvisioningWatchUICoordinator *result;

  result = (_PKProvisioningWatchUICoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
