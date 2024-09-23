@implementation ACHBankCredentialViewController

- (_TtC9PassKitUI31ACHBankCredentialViewController)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC9PassKitUI31ACHBankCredentialViewController *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9PassKitUI31ACHBankCredentialViewController_hostingVC) = 0;
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC9PassKitUI31ACHBankCredentialViewController_editAction);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC9PassKitUI31ACHBankCredentialViewController *)sub_19DE888C0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC9PassKitUI31ACHBankCredentialViewController *v2;

  v2 = self;
  sub_19D61135C();

}

- (void)viewWillLayoutSubviews
{
  _TtC9PassKitUI31ACHBankCredentialViewController *v2;

  v2 = self;
  sub_19D6116B8();

}

- (void)editButtonTapped
{
  void (*v2)(uint64_t);
  uint64_t v3;
  _TtC9PassKitUI31ACHBankCredentialViewController *v4;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC9PassKitUI31ACHBankCredentialViewController_editAction);
  if (v2)
  {
    v4 = self;
    v3 = sub_19D1A9EC4((uint64_t)v2);
    v2(v3);
    sub_19D1A9F60((uint64_t)v2);

  }
}

- (_TtC9PassKitUI31ACHBankCredentialViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_19D29AA78((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI31ACHBankCredentialViewController_hostingVC));
  sub_19D1A9F60(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9PassKitUI31ACHBankCredentialViewController_editAction));
}

@end
