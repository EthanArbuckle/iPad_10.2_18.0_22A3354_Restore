@implementation SiriSuggestionsIntelligence.DeviceListDelegate

- (void)deviceListModified:(id)a3
{
  unint64_t v4;
  _TtCO27SiriSuggestionsIntelligence27SiriSuggestionsIntelligenceP33_5C99411072011048FFC9A949C6515F9C18DeviceListDelegate *v5;

  if (a3)
  {
    sub_2472B1E28(0, (unint64_t *)&unk_25443E8B8);
    v4 = sub_24731B634();
  }
  else
  {
    v4 = 0;
  }
  v5 = self;
  sub_2472AEE2C(v4);

  swift_bridgeObjectRelease();
}

- (_TtCO27SiriSuggestionsIntelligence27SiriSuggestionsIntelligenceP33_5C99411072011048FFC9A949C6515F9C18DeviceListDelegate)init
{
  sub_2472AF2BC();
}

- (void).cxx_destruct
{
  sub_2472B1F0C((uint64_t)self+ OBJC_IVAR____TtCO27SiriSuggestionsIntelligence27SiriSuggestionsIntelligenceP33_5C99411072011048FFC9A949C6515F9C18DeviceListDelegate_continuation, (uint64_t *)&unk_254440810);
}

@end
