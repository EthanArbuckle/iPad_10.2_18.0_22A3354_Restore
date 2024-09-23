@implementation ProvisioningCarPerformPairingViewController

- (_TtC9PassKitUI43ProvisioningCarPerformPairingViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC9PassKitUI43ProvisioningCarPerformPairingViewController *result;

  v5 = OBJC_IVAR____TtC9PassKitUI43ProvisioningCarPerformPairingViewController_provisioningView;
  v6 = objc_allocWithZone((Class)PKProvisioningProgressView);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9PassKitUI43ProvisioningCarPerformPairingViewController_coordinator) = 0;

  result = (_TtC9PassKitUI43ProvisioningCarPerformPairingViewController *)sub_19DE888C0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  id v3;
  _TtC9PassKitUI43ProvisioningCarPerformPairingViewController *v4;
  id v5;
  id v6;

  v3 = objc_allocWithZone(MEMORY[0x1E0DC34F0]);
  v4 = self;
  v5 = objc_msgSend(v3, sel_initWithBarButtonSystemItem_target_action_, 1, v4, sel_cancelButtonPressed);
  v6 = -[ProvisioningCarPerformPairingViewController navigationItem](v4, sel_navigationItem);
  objc_msgSend(v6, sel_setLeftBarButtonItem_animated_, v5, 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void *v5;
  id v6;
  id v7;
  char *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v4 = (char *)v9.receiver;
  -[ProvisioningCarPerformPairingViewController viewDidAppear:](&v9, sel_viewDidAppear_, v3);
  v5 = *(void **)&v4[OBJC_IVAR____TtC9PassKitUI43ProvisioningCarPerformPairingViewController_coordinator];
  if (v5)
  {
    v6 = objc_allocWithZone(MEMORY[0x1E0D67300]);
    v7 = v5;
    v8 = (char *)objc_msgSend(v6, sel_init, v9.receiver, v9.super_class);
    sub_19D3AC118(v8);

    v4 = v8;
  }

}

- (void)loadView
{
  _TtC9PassKitUI43ProvisioningCarPerformPairingViewController *v2;

  v2 = self;
  sub_19D734C20();

}

- (void)viewWillLayoutSubviews
{
  char *v2;
  char *v3;
  char *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)swift_getObjectType();
  v2 = (char *)v15.receiver;
  -[ProvisioningCarPerformPairingViewController viewWillLayoutSubviews](&v15, sel_viewWillLayoutSubviews);
  v3 = (char *)objc_msgSend(v2, sel_view, v15.receiver, v15.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = *(void **)&v2[OBJC_IVAR____TtC9PassKitUI43ProvisioningCarPerformPairingViewController_provisioningView];
    v6 = objc_msgSend(v3, sel_safeAreaLayoutGuide);
    objc_msgSend(v6, sel_layoutFrame);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    objc_msgSend(v5, sel_setFrame_, v8, v10, v12, v14);
    v2 = v4;
  }

}

- (void)cancelButtonPressed
{
  void *v2;
  _TtC9PassKitUI43ProvisioningCarPerformPairingViewController *v3;
  id v4;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI43ProvisioningCarPerformPairingViewController_coordinator);
  if (v2)
  {
    v3 = self;
    v4 = v2;
    sub_19D3ACE40();

  }
}

- (_TtC9PassKitUI43ProvisioningCarPerformPairingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9PassKitUI43ProvisioningCarPerformPairingViewController *result;

  v4 = a4;
  result = (_TtC9PassKitUI43ProvisioningCarPerformPairingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI43ProvisioningCarPerformPairingViewController_credential));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI43ProvisioningCarPerformPairingViewController_provisioningView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI43ProvisioningCarPerformPairingViewController_coordinator));
}

@end
