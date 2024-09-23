@implementation AppleBalanceAddMoneyViewController

- (_TtC9PassKitUI34AppleBalanceAddMoneyViewController)initWithCoder:(id)a3
{
  uint64_t v4;
  _TtC9PassKitUI34AppleBalanceAddMoneyViewController *result;

  v4 = OBJC_IVAR____TtC9PassKitUI34AppleBalanceAddMoneyViewController_paymentWebService;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)objc_msgSend((id)objc_opt_self(), sel_sharedService);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9PassKitUI34AppleBalanceAddMoneyViewController_dtuConfiguration) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9PassKitUI34AppleBalanceAddMoneyViewController_cancelItem) = 0;

  result = (_TtC9PassKitUI34AppleBalanceAddMoneyViewController *)sub_19DE888C0();
  __break(1u);
  return result;
}

- (void)loadView
{
  _TtC9PassKitUI34AppleBalanceAddMoneyViewController *v2;

  v2 = self;
  sub_19D346290();

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
  v14.super_class = (Class)type metadata accessor for AppleBalanceAddMoneyViewController();
  v2 = (char *)v14.receiver;
  -[AppleBalanceAddMoneyViewController viewWillLayoutSubviews](&v14, sel_viewWillLayoutSubviews);
  v3 = objc_msgSend(v2, sel_view, v14.receiver, v14.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_bounds);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    v13 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC9PassKitUI34AppleBalanceAddMoneyViewController_hostingVC], sel_view);
    objc_msgSend(v13, sel_setFrame_, v6, v8, v10, v12);

  }
  else
  {
    __break(1u);
  }
}

- (void)dismissAction
{
  -[AppleBalanceAddMoneyViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (_TtC9PassKitUI34AppleBalanceAddMoneyViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9PassKitUI34AppleBalanceAddMoneyViewController *result;

  v4 = a4;
  result = (_TtC9PassKitUI34AppleBalanceAddMoneyViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34AppleBalanceAddMoneyViewController_hostingVC));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34AppleBalanceAddMoneyViewController_account));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34AppleBalanceAddMoneyViewController_accountService));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34AppleBalanceAddMoneyViewController_uiManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34AppleBalanceAddMoneyViewController_paymentWebService));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34AppleBalanceAddMoneyViewController_dtuConfiguration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34AppleBalanceAddMoneyViewController_inStoreModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI34AppleBalanceAddMoneyViewController_cancelItem));
}

@end
