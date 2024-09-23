@implementation EnterCurrencyAmountView.Coordinator

- (BOOL)enterCurrencyAmountView:(id)a3 shouldChangeAmountFrom:(id)a4 to:(id)a5
{
  id v9;
  id v10;
  id v11;
  _TtCV9PassKitUI23EnterCurrencyAmountView11Coordinator *v12;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = self;
  LOBYTE(a5) = sub_19D8CF2EC(a3, (uint64_t)a4, (uint64_t)a5);

  return a5 & 1;
}

- (void)enterCurrencyAmountViewDidChangeAmount:(id)a3
{
  id v5;
  _TtCV9PassKitUI23EnterCurrencyAmountView11Coordinator *v6;

  v5 = a3;
  v6 = self;
  sub_19D8CF688(a3);

}

- (void)numberPadSuggestionsView:(id)a3 didSelectSuggestion:(id)a4
{
  id v6;
  id v7;
  _TtCV9PassKitUI23EnterCurrencyAmountView11Coordinator *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_19D8D01E4(a4);

}

- (_TtCV9PassKitUI23EnterCurrencyAmountView11Coordinator)init
{
  _TtCV9PassKitUI23EnterCurrencyAmountView11Coordinator *result;

  result = (_TtCV9PassKitUI23EnterCurrencyAmountView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  sub_19D1A9F60(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCV9PassKitUI23EnterCurrencyAmountView11Coordinator_keypadSuggestionSelected));
}

@end
