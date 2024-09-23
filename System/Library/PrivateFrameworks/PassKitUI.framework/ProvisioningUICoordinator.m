@implementation ProvisioningUICoordinator

- (void)dealloc
{
  _TtC9PassKitUI25ProvisioningUICoordinator *v2;
  objc_super v3;

  v2 = self;
  sub_19D75B20C();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for ProvisioningUICoordinator();
  -[ProvisioningUICoordinator dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI25ProvisioningUICoordinator_delegate);
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI25ProvisioningUICoordinator_manualEntryDelegate);
  swift_unknownObjectWeakDestroy();
  sub_19D1A2C50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI25ProvisioningUICoordinator_renderer);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI25ProvisioningUICoordinator_passcodeController));

}

- (void)continueWithFieldModel:(id)a3
{
  id v4;
  _TtC9PassKitUI25ProvisioningUICoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_19D759A4C(v4);

}

- (void)terminate
{
  _TtC9PassKitUI25ProvisioningUICoordinator *v2;

  v2 = self;
  sub_19D75A530();

}

- (id)provisionedPass
{
  void *v2;
  _TtC9PassKitUI25ProvisioningUICoordinator *v3;
  id v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI25ProvisioningUICoordinator_provisionedPasses);
  if (v2)
  {
    v3 = self;
    v4 = v2;
    v2 = (void *)sub_19DE84264();

  }
  return v2;
}

- (_TtC9PassKitUI25ProvisioningUICoordinator)init
{
  _TtC9PassKitUI25ProvisioningUICoordinator *result;

  result = (_TtC9PassKitUI25ProvisioningUICoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)disambiguationViewController:(id)a3 didSelectProduct:(id)a4
{
  id v6;
  id v7;
  _TtC9PassKitUI25ProvisioningUICoordinator *v8;

  if (a4)
  {
    v6 = a3;
    v8 = self;
    v7 = a4;
    sub_19D75FBF4(v7);

  }
  else
  {
    __break(1u);
  }
}

- (void)disambiguationViewControllerSetUpLater:(id)a3
{
  id v4;
  _TtC9PassKitUI25ProvisioningUICoordinator *v5;
  _TtC9PassKitUI25ProvisioningUICoordinator *v6;
  id v7;
  _TtC9PassKitUI25ProvisioningUICoordinator *v8;

  if (a3)
  {
    v8 = self;
    v4 = a3;
    v5 = (_TtC9PassKitUI25ProvisioningUICoordinator *)objc_msgSend(v4, sel_navigationController);
    if (v5)
    {
      v6 = v5;
      v7 = -[ProvisioningUICoordinator popViewControllerAnimated:](v5, sel_popViewControllerAnimated_, 1);

      v4 = v7;
      v8 = v6;
    }

  }
  else
  {
    __break(1u);
  }
}

- (id)topViewController
{
  return (id)MEMORY[0x1A1AE6A68]((char *)self+ OBJC_IVAR____TtC9PassKitUI25ProvisioningUICoordinator_viewController, a2);
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  id v8;
  _TtC9PassKitUI25ProvisioningUICoordinator *v9;
  id v10;

  v4 = a4;
  v7 = (void *)MEMORY[0x1A1AE6A68]((char *)self + OBJC_IVAR____TtC9PassKitUI25ProvisioningUICoordinator_viewController, a2);
  v8 = a3;
  v9 = self;
  v10 = objc_msgSend(v7, sel_navigationController);

  objc_msgSend(v10, sel_pushViewController_animated_, v8, v4);
}

@end
