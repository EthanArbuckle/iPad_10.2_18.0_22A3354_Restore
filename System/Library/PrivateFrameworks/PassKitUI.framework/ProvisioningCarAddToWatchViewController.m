@implementation ProvisioningCarAddToWatchViewController

- (void)loadView
{
  _TtC9PassKitUI39ProvisioningCarAddToWatchViewController *v2;

  v2 = self;
  sub_19D4A81E4();

}

- (_TtC9PassKitUI39ProvisioningCarAddToWatchViewController)initWithContext:(int64_t)a3
{
  _TtC9PassKitUI39ProvisioningCarAddToWatchViewController *result;

  result = (_TtC9PassKitUI39ProvisioningCarAddToWatchViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI39ProvisioningCarAddToWatchViewController_credential));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI39ProvisioningCarAddToWatchViewController_coordinator));
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  void *v3;
  id v6;
  id v7;
  _TtC9PassKitUI39ProvisioningCarAddToWatchViewController *v8;
  id v9;
  id v10;

  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI39ProvisioningCarAddToWatchViewController_coordinator);
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

- (void)explanationViewControllerDidSelectCancel:(void *)a3
{
  void *v3;
  id v5;
  char *v6;
  id v7;

  v3 = *(void **)&a1[OBJC_IVAR____TtC9PassKitUI39ProvisioningCarAddToWatchViewController_coordinator];
  if (v3)
  {
    v5 = a3;
    v6 = a1;
    v7 = v3;
    sub_19D3ACE40();

  }
}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  _TtC9PassKitUI39ProvisioningCarAddToWatchViewController *v7;

  v4 = a3;
  v7 = self;
  v5 = -[ProvisioningCarAddToWatchViewController view](v7, sel_view);
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
