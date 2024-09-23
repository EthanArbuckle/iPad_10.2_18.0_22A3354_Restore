@implementation AppleBalanceEnterAmountView.Coordinator

- (BOOL)enterCurrencyAmountView:(id)a3 shouldChangeAmountFrom:(id)a4 to:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtCV9PassKitUI27AppleBalanceEnterAmountView11Coordinator *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  LOBYTE(a5) = sub_19D63E1B4((uint64_t)a4, (uint64_t)a5);

  return a5 & 1;
}

- (void)enterCurrencyAmountViewDidChangeAmount:(id)a3
{
  id v5;
  _TtCV9PassKitUI27AppleBalanceEnterAmountView11Coordinator *v6;

  v5 = a3;
  v6 = self;
  sub_19D63D1E8(a3);

}

- (void)numberPadSuggestionsView:(id)a3 didSelectSuggestion:(id)a4
{
  id v6;
  id v7;
  _TtCV9PassKitUI27AppleBalanceEnterAmountView11Coordinator *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_19D63E394(a4);

}

- (_TtCV9PassKitUI27AppleBalanceEnterAmountView11Coordinator)init
{
  _TtCV9PassKitUI27AppleBalanceEnterAmountView11Coordinator *result;

  result = (_TtCV9PassKitUI27AppleBalanceEnterAmountView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV9PassKitUI27AppleBalanceEnterAmountView11Coordinator_accountModel));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV9PassKitUI27AppleBalanceEnterAmountView11Coordinator_configuration));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV9PassKitUI27AppleBalanceEnterAmountView11Coordinator_view));
}

@end
