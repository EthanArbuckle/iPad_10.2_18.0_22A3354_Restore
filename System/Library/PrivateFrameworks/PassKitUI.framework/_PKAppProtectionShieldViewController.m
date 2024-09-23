@implementation _PKAppProtectionShieldViewController

- (_PKAppProtectionShieldViewController)initWithConfiguration:(id)a3
{
  id v4;

  v4 = a3;
  return (_PKAppProtectionShieldViewController *)AppProtectionShieldViewController.init(configuration:)(a3);
}

- (_PKAppProtectionShieldViewController)initWithCoder:(id)a3
{
  _PKAppProtectionShieldViewController *result;

  result = (_PKAppProtectionShieldViewController *)sub_19DE888C0();
  __break(1u);
  return result;
}

- (void)loadView
{
  _PKAppProtectionShieldViewController *v2;

  v2 = self;
  sub_19D630798();

}

- (void)viewWillLayoutSubviews
{
  char *v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for AppProtectionShieldViewController();
  v2 = (char *)v14.receiver;
  -[_PKAppProtectionShieldViewController viewWillLayoutSubviews](&v14, sel_viewWillLayoutSubviews);
  v3 = objc_msgSend(v2, sel_view, v14.receiver, v14.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_bounds);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    v13 = objc_msgSend(*(id *)&v2[OBJC_IVAR____PKAppProtectionShieldViewController_appProtectionShieldVC], sel_view);
    objc_msgSend(v13, sel_setFrame_, v6, v8, v10, v12);

  }
  else
  {
    __break(1u);
  }
}

- (_PKAppProtectionShieldViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _PKAppProtectionShieldViewController *result;

  v4 = a4;
  result = (_PKAppProtectionShieldViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____PKAppProtectionShieldViewController_appProtectionShieldVC));
}

@end
