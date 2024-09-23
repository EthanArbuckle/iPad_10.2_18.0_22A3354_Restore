@implementation ProvisioningAddPaymentPassViewController

- (_TtC9PassKitUI40ProvisioningAddPaymentPassViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC9PassKitUI40ProvisioningAddPaymentPassViewController *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9PassKitUI40ProvisioningAddPaymentPassViewController_privacyController) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9PassKitUI40ProvisioningAddPaymentPassViewController_coordinator) = 0;
  v4 = a3;

  result = (_TtC9PassKitUI40ProvisioningAddPaymentPassViewController *)sub_19DE888C0();
  __break(1u);
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC9PassKitUI40ProvisioningAddPaymentPassViewController *v4;

  v4 = self;
  sub_19D5B82AC(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ProvisioningAddPaymentPassViewController();
  v4 = (char *)v5.receiver;
  -[PKPaymentSetupFieldsViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC9PassKitUI40ProvisioningAddPaymentPassViewController_reporter], sel_reportViewAppeared, v5.receiver, v5.super_class);

}

- (void)viewWillLayoutSubviews
{
  _TtC9PassKitUI40ProvisioningAddPaymentPassViewController *v2;

  v2 = self;
  sub_19D5B86FC();

}

- (void)cancel
{
  void *v2;
  _TtC9PassKitUI40ProvisioningAddPaymentPassViewController *v3;
  id v4;

  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI40ProvisioningAddPaymentPassViewController_coordinator);
  if (v2)
  {
    v3 = self;
    v4 = v2;
    sub_19D75A530();

  }
}

- (_TtC9PassKitUI40ProvisioningAddPaymentPassViewController)initWithWebService:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 setupFieldsModel:(id)a6
{
  id v7;
  id v8;
  _TtC9PassKitUI40ProvisioningAddPaymentPassViewController *result;

  v7 = a3;
  swift_unknownObjectRetain();
  v8 = a6;
  result = (_TtC9PassKitUI40ProvisioningAddPaymentPassViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI40ProvisioningAddPaymentPassViewController_configuration));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI40ProvisioningAddPaymentPassViewController_privacyController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI40ProvisioningAddPaymentPassViewController_reporter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI40ProvisioningAddPaymentPassViewController_coordinator));
}

- (id)visibleFieldIdentifiers
{
  _TtC9PassKitUI40ProvisioningAddPaymentPassViewController *v2;
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

      sub_19D466E98(v6);
      swift_bridgeObjectRelease();
      v7 = (void *)sub_19DE87DF8();
      swift_bridgeObjectRelease();
    }
    else
    {

      v7 = 0;
    }
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
  _TtC9PassKitUI40ProvisioningAddPaymentPassViewController *v4;
  _TtC9PassKitUI40ProvisioningAddPaymentPassViewController *v5;
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
  sub_19D5B8BC4();

  sub_19D2BAA1C((uint64_t)v6);
}

- (id)defaultHeaderViewTitle
{
  _TtC9PassKitUI40ProvisioningAddPaymentPassViewController *v2;
  void *v3;

  v2 = self;
  sub_19D5B8CC8();

  swift_bridgeObjectRelease();
  v3 = (void *)sub_19DE87BD0();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)defaultHeaderViewSubTitle
{
  _TtC9PassKitUI40ProvisioningAddPaymentPassViewController *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_19D5B8CC8();
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

@end
