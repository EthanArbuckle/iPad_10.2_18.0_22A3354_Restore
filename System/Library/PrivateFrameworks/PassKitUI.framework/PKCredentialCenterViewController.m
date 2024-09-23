@implementation PKCredentialCenterViewController

- (PKCredentialCenterViewController)init
{
  return (PKCredentialCenterViewController *)CredentialCenterViewController.init()();
}

- (PKCredentialCenterViewController)initWithCoder:(id)a3
{
  PKCredentialCenterViewController *result;

  result = (PKCredentialCenterViewController *)sub_19DE888C0();
  __break(1u);
  return result;
}

- (void)loadView
{
  PKCredentialCenterViewController *v2;

  v2 = self;
  sub_19D8A1228();

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
  id *v13;
  id v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)type metadata accessor for CredentialCenterViewController();
  v2 = (char *)v15.receiver;
  -[PKCredentialCenterViewController viewWillLayoutSubviews](&v15, sel_viewWillLayoutSubviews);
  v3 = objc_msgSend(v2, sel_view);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_bounds);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    v13 = (id *)&v2[OBJC_IVAR___PKCredentialCenterViewController_hostingVC];
    swift_beginAccess();
    v14 = objc_msgSend(*v13, sel_view);
    objc_msgSend(v14, sel_setFrame_, v6, v8, v10, v12);

  }
  else
  {
    __break(1u);
  }
}

- (PKCredentialCenterViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  PKCredentialCenterViewController *result;

  v4 = a4;
  result = (PKCredentialCenterViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
