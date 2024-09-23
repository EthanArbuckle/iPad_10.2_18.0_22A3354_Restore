@implementation ProvisioningCardReaderViewController

- (_TtC9PassKitUI36ProvisioningCardReaderViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_19D8BE37C();
}

- (void)loadView
{
  _TtC9PassKitUI36ProvisioningCardReaderViewController *v2;

  v2 = self;
  sub_19D8B5EC0();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC9PassKitUI36ProvisioningCardReaderViewController *v4;

  v4 = self;
  sub_19D8B6728(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC9PassKitUI36ProvisioningCardReaderViewController *v4;

  v4 = self;
  sub_19D8B68CC(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC9PassKitUI36ProvisioningCardReaderViewController *v4;

  v4 = self;
  sub_19D8B6ACC(a3);

}

- (void)viewWillLayoutSubviews
{
  _TtC9PassKitUI36ProvisioningCardReaderViewController *v2;

  v2 = self;
  sub_19D8B6BC8();

}

- (void)manualEntryButtonPressed
{
  _TtC9PassKitUI36ProvisioningCardReaderViewController *v2;

  v2 = self;
  sub_19D8B7078();

}

- (void)setupLaterButtonPressed
{
  _TtC9PassKitUI36ProvisioningCardReaderViewController *v2;

  v2 = self;
  sub_19D8B722C();

}

- (void)tryAgainButtonPressed
{
  void *v2;
  id v4;
  _TtC9PassKitUI36ProvisioningCardReaderViewController *v5;
  PKPaymentSetupFieldsModel *v6;
  PKPaymentSetupFieldsModel *v7;

  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI36ProvisioningCardReaderViewController_coordinator);
  if (v2)
  {
    v4 = v2;
    v5 = self;
    v6 = -[PKPaymentSetupFieldsViewController fieldsModel](v5, sel_fieldsModel);
    if (v6)
    {
      v7 = v6;
      sub_19D759A4C(v6);

    }
    else
    {
      __break(1u);
    }
  }
}

- (void)cancelButtonPressed
{
  _TtC9PassKitUI36ProvisioningCardReaderViewController *v2;

  v2 = self;
  sub_19D8B74A4();

}

- (void)backButtonPressed
{
  _TtC9PassKitUI36ProvisioningCardReaderViewController *v2;
  _TtC9PassKitUI36ProvisioningCardReaderViewController *v3;
  id v4;
  _TtC9PassKitUI36ProvisioningCardReaderViewController *v5;
  _TtC9PassKitUI36ProvisioningCardReaderViewController *v6;

  v6 = self;
  v2 = (_TtC9PassKitUI36ProvisioningCardReaderViewController *)-[ProvisioningCardReaderViewController navigationController](v6, sel_navigationController);
  if (v2)
  {
    v3 = v2;
    v4 = -[ProvisioningCardReaderViewController popViewControllerAnimated:](v2, sel_popViewControllerAnimated_, 1);

    v5 = v3;
  }
  else
  {
    v5 = v6;
  }

}

- (void)applicationWillResignActive
{
  _TtC9PassKitUI36ProvisioningCardReaderViewController *v2;

  v2 = self;
  sub_19D8B763C();

}

- (void)didBecomeActiveNotification
{
  _TtC9PassKitUI36ProvisioningCardReaderViewController *v2;

  v2 = self;
  sub_19D8B7728();

}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  _TtC9PassKitUI36ProvisioningCardReaderViewController *v11;

  v8 = _Block_copy(a5);
  if (v8)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v8;
    v8 = sub_19D266A30;
  }
  else
  {
    v9 = 0;
  }
  v10 = a3;
  v11 = self;
  sub_19D8B789C(v10, a4, v8, v9);
  sub_19D1A9F60((uint64_t)v8);

}

- (_TtC9PassKitUI36ProvisioningCardReaderViewController)initWithWebService:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 setupFieldsModel:(id)a6
{
  id v7;
  id v8;
  _TtC9PassKitUI36ProvisioningCardReaderViewController *result;

  v7 = a3;
  swift_unknownObjectRetain();
  v8 = a6;
  result = (_TtC9PassKitUI36ProvisioningCardReaderViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI36ProvisioningCardReaderViewController_coordinator));
  swift_release();
  sub_19D2E7A50((uint64_t)self + OBJC_IVAR____TtC9PassKitUI36ProvisioningCardReaderViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI36ProvisioningCardReaderViewController_reporter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI36ProvisioningCardReaderViewController_animationView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI36ProvisioningCardReaderViewController_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI36ProvisioningCardReaderViewController_contentBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI36ProvisioningCardReaderViewController_contentBlurBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI36ProvisioningCardReaderViewController_contentBlurBackgroundMask));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI36ProvisioningCardReaderViewController_readFailureBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI36ProvisioningCardReaderViewController_manualEntryButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI36ProvisioningCardReaderViewController_springFactory));
  swift_release();
}

- (id)visibleFieldIdentifiers
{
  _TtC9PassKitUI36ProvisioningCardReaderViewController *v2;
  id result;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;

  v2 = self;
  result = -[PKPaymentSetupFieldsViewController fieldsModel](v2, sel_fieldsModel);
  if (result)
  {
    v4 = result;
    v5 = objc_msgSend(result, sel_visibleSetupFieldIdentifiers);

    if (v5)
    {
      v6 = sub_19DE87E10();

    }
    else
    {
      v6 = MEMORY[0x1E0DEE9D8];
    }
    sub_19D466E98(v6);

    swift_bridgeObjectRelease();
    v7 = (void *)sub_19DE87DF8();
    swift_bridgeObjectRelease();
    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)handleNextButtonTapped:(id)a3
{
  _TtC9PassKitUI36ProvisioningCardReaderViewController *v4;
  _TtC9PassKitUI36ProvisioningCardReaderViewController *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_19DE8868C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_19D8B806C();

  sub_19D2BAA1C((uint64_t)v6);
}

- (id)defaultHeaderViewTitle
{
  _TtC9PassKitUI36ProvisioningCardReaderViewController *v2;
  void *v3;

  v2 = self;
  sub_19D8B8170();

  swift_bridgeObjectRelease();
  v3 = (void *)sub_19DE87BD0();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)defaultHeaderViewSubTitle
{
  _TtC9PassKitUI36ProvisioningCardReaderViewController *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_19D8B8170();
  v4 = v3;

  swift_bridgeObjectRelease();
  if (v4)
  {
    v5 = (void *)sub_19DE87BD0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)defaultFields
{
  return (id)sub_19DE87DF8();
}

- (int64_t)visibilityBackdropView:(id)a3 preferredStyleForTraitCollection:(id)a4
{
  id v6;
  id v7;
  _TtC9PassKitUI36ProvisioningCardReaderViewController *v8;
  int64_t v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_19D8BE4E0(v7);

  return v9;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  _TtC9PassKitUI36ProvisioningCardReaderViewController *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_19D8BDAD4(v4);

  return v6;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC9PassKitUI36ProvisioningCardReaderViewController *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_19D8BE5AC(v8);
  v13 = v12;

  return v13;
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v10;
  id v11;
  id v12;
  _TtC9PassKitUI36ProvisioningCardReaderViewController *v13;
  _BYTE *v14;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = self;
  v14 = sub_19D8BE840(a4, v11, v12);

  return v14;
}

@end
