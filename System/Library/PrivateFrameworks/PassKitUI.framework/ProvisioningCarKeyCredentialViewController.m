@implementation ProvisioningCarKeyCredentialViewController

- (_TtC9PassKitUI42ProvisioningCarKeyCredentialViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC9PassKitUI42ProvisioningCarKeyCredentialViewController *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9PassKitUI42ProvisioningCarKeyCredentialViewController_coordinator) = 0;
  v4 = a3;

  result = (_TtC9PassKitUI42ProvisioningCarKeyCredentialViewController *)sub_19DE888C0();
  __break(1u);
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ProvisioningCarKeyCredentialViewController();
  v4 = v10.receiver;
  -[PKPaymentSetupFieldsViewController viewWillAppear:](&v10, sel_viewWillAppear_, v3);
  v5 = objc_msgSend(v4, sel_navigationController, v10.receiver, v10.super_class);
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, sel_viewControllers);

    sub_19D1A9ED4(0, (unint64_t *)&qword_1EE49CE90);
    v8 = sub_19DE87E10();

    if (v8 >> 62)
    {
      sub_19DE82F08();
      v9 = sub_19DE888E4();
      swift_bridgeObjectRelease();
    }
    else
    {
      v9 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (v9 == 1)
      sub_19D5C8C10();
  }

}

- (void)cancel
{
  void *v2;
  _TtC9PassKitUI42ProvisioningCarKeyCredentialViewController *v3;
  id v4;

  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI42ProvisioningCarKeyCredentialViewController_coordinator);
  if (v2)
  {
    v3 = self;
    v4 = v2;
    sub_19D3ACB98();

  }
}

- (void)loadView
{
  _TtC9PassKitUI42ProvisioningCarKeyCredentialViewController *v2;

  v2 = self;
  sub_19D5C84C8();

}

- (_TtC9PassKitUI42ProvisioningCarKeyCredentialViewController)initWithWebService:(id)a3 context:(int64_t)a4 setupDelegate:(id)a5 setupFieldsModel:(id)a6
{
  id v7;
  id v8;
  _TtC9PassKitUI42ProvisioningCarKeyCredentialViewController *result;

  v7 = a3;
  swift_unknownObjectRetain();
  v8 = a6;
  result = (_TtC9PassKitUI42ProvisioningCarKeyCredentialViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI42ProvisioningCarKeyCredentialViewController_credential));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI42ProvisioningCarKeyCredentialViewController_coordinator));
}

- (id)visibleFieldIdentifiers
{
  _TtC9PassKitUI42ProvisioningCarKeyCredentialViewController *v2;
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
  _TtC9PassKitUI42ProvisioningCarKeyCredentialViewController *v3;
  _TtC9PassKitUI42ProvisioningCarKeyCredentialViewController *v4;
  _TtC9PassKitUI42ProvisioningCarKeyCredentialViewController *v5;
  void *v6;
  id v7;
  PKPaymentSetupFieldsModel *v8;
  _TtC9PassKitUI42ProvisioningCarKeyCredentialViewController *v9;
  _OWORD v10[2];

  v3 = self;
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_19DE8868C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v5 = self;
  }
  v6 = *(Class *)((char *)&v3->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI42ProvisioningCarKeyCredentialViewController_coordinator);
  if (!v6)
    goto LABEL_7;
  v7 = v6;
  v8 = -[PKPaymentSetupFieldsViewController fieldsModel](v3, sel_fieldsModel);
  if (v8)
  {
    v9 = (_TtC9PassKitUI42ProvisioningCarKeyCredentialViewController *)v8;
    sub_19D3AC118(v8);

    v3 = v9;
LABEL_7:

    sub_19D2BAA1C((uint64_t)v10);
    return;
  }
  __break(1u);
}

- (id)defaultHeaderViewTitle
{
  _TtC9PassKitUI42ProvisioningCarKeyCredentialViewController *v2;
  void *v3;

  v2 = self;
  sub_19D5C9264();

  swift_bridgeObjectRelease();
  v3 = (void *)sub_19DE87BD0();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)defaultHeaderViewSubTitle
{
  _TtC9PassKitUI42ProvisioningCarKeyCredentialViewController *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_19D5C9264();
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
