@implementation AddBankAccountInformationView.Coordinator

- (void)addBankAccountInformationViewController:(id)a3 didAddFundingSource:(id)a4
{
  id v4;
  id v5;

  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV9PassKitUI29AddBankAccountInformationView11Coordinator_fundingSourceAdded);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtCV9PassKitUI29AddBankAccountInformationView11Coordinator_fundingSourceAdded) = (Class)a4;
  v4 = a4;

}

- (void)addBankAccountInformationViewControllerDidFinish:(id)a3
{
  void (*v5)(void *);
  void *v6;
  id v7;
  _TtCV9PassKitUI29AddBankAccountInformationView11Coordinator *v8;
  id v9;

  v5 = *(void (**)(void *))((char *)&self->super.isa
                                     + OBJC_IVAR____TtCV9PassKitUI29AddBankAccountInformationView11Coordinator_completionAction);
  v6 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV9PassKitUI29AddBankAccountInformationView11Coordinator_fundingSourceAdded);
  v9 = v6;
  v7 = a3;
  v8 = self;
  sub_19DE82CB0();
  v5(v6);

  swift_release();
}

- (_TtCV9PassKitUI29AddBankAccountInformationView11Coordinator)init
{
  _TtCV9PassKitUI29AddBankAccountInformationView11Coordinator *result;

  result = (_TtCV9PassKitUI29AddBankAccountInformationView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV9PassKitUI29AddBankAccountInformationView11Coordinator_fundingSourceAdded));
}

@end
