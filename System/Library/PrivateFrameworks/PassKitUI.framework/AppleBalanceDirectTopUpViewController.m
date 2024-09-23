@implementation AppleBalanceDirectTopUpViewController

- (_TtC9PassKitUI37AppleBalanceDirectTopUpViewController)initWithCoder:(id)a3
{
  char *v4;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  _TtC9PassKitUI37AppleBalanceDirectTopUpViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9PassKitUI37AppleBalanceDirectTopUpViewController_addItem) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC9PassKitUI37AppleBalanceDirectTopUpViewController_amount;
  *(_QWORD *)v4 = sub_19DE884AC();
  *((_WORD *)v4 + 4) = v5;
  *((_WORD *)v4 + 5) = v6;
  *((_WORD *)v4 + 6) = v7;
  *((_WORD *)v4 + 7) = v8;
  *((_WORD *)v4 + 8) = v9;
  *((_WORD *)v4 + 9) = v10;

  result = (_TtC9PassKitUI37AppleBalanceDirectTopUpViewController *)sub_19DE888C0();
  __break(1u);
  return result;
}

- (void)loadView
{
  _TtC9PassKitUI37AppleBalanceDirectTopUpViewController *v2;

  v2 = self;
  sub_19D31D9BC();

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
  v14.super_class = (Class)type metadata accessor for AppleBalanceDirectTopUpViewController();
  v2 = (char *)v14.receiver;
  -[AppleBalanceDirectTopUpViewController viewWillLayoutSubviews](&v14, sel_viewWillLayoutSubviews);
  v3 = objc_msgSend(v2, sel_view, v14.receiver, v14.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_bounds);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    v13 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC9PassKitUI37AppleBalanceDirectTopUpViewController_hostingVC], sel_view);
    objc_msgSend(v13, sel_setFrame_, v6, v8, v10, v12);

  }
  else
  {
    __break(1u);
  }
}

- (void)dismissAction
{
  -[AppleBalanceDirectTopUpViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (void)addAction
{
  _TtC9PassKitUI37AppleBalanceDirectTopUpViewController *v2;

  v2 = self;
  sub_19D31E26C();

}

- (void)webViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC9PassKitUI37AppleBalanceDirectTopUpViewController *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_19D31F920((uint64_t)a4, a5);

}

- (_TtC9PassKitUI37AppleBalanceDirectTopUpViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9PassKitUI37AppleBalanceDirectTopUpViewController *result;

  v4 = a4;
  result = (_TtC9PassKitUI37AppleBalanceDirectTopUpViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI37AppleBalanceDirectTopUpViewController_hostingVC));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI37AppleBalanceDirectTopUpViewController_account));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI37AppleBalanceDirectTopUpViewController_uiManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI37AppleBalanceDirectTopUpViewController_dtuModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI37AppleBalanceDirectTopUpViewController_setupController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI37AppleBalanceDirectTopUpViewController_addItem));
}

@end
