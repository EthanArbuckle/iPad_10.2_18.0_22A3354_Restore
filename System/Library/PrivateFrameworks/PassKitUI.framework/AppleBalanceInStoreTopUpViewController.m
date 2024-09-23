@implementation AppleBalanceInStoreTopUpViewController

- (_TtC9PassKitUI38AppleBalanceInStoreTopUpViewController)initWithCoder:(id)a3
{
  _TtC9PassKitUI38AppleBalanceInStoreTopUpViewController *result;

  result = (_TtC9PassKitUI38AppleBalanceInStoreTopUpViewController *)sub_19DE888C0();
  __break(1u);
  return result;
}

- (void)loadView
{
  _TtC9PassKitUI38AppleBalanceInStoreTopUpViewController *v2;

  v2 = self;
  sub_19D4BC124();

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
  v14.super_class = (Class)type metadata accessor for AppleBalanceInStoreTopUpViewController();
  v2 = (char *)v14.receiver;
  -[AppleBalanceInStoreTopUpViewController viewWillLayoutSubviews](&v14, sel_viewWillLayoutSubviews);
  v3 = objc_msgSend(v2, sel_view, v14.receiver, v14.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_bounds);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    v13 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC9PassKitUI38AppleBalanceInStoreTopUpViewController_hostingVC], sel_view);
    objc_msgSend(v13, sel_setFrame_, v6, v8, v10, v12);

  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  sub_19D4BC518(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidAppear_, (SEL *)&selRef_beginRequestingBacklightRamping_);
}

- (void)viewDidDisappear:(BOOL)a3
{
  sub_19D4BC518(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidDisappear_, (SEL *)&selRef_endRequestingBacklightRamping_);
}

- (void)dismissAction
{
  -[AppleBalanceInStoreTopUpViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (_TtC9PassKitUI38AppleBalanceInStoreTopUpViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9PassKitUI38AppleBalanceInStoreTopUpViewController *result;

  v4 = a4;
  result = (_TtC9PassKitUI38AppleBalanceInStoreTopUpViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI38AppleBalanceInStoreTopUpViewController_hostingVC));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI38AppleBalanceInStoreTopUpViewController_account));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI38AppleBalanceInStoreTopUpViewController_tokenModel));
}

@end
