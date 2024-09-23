@implementation SiriSuggestionsIntelligence.AccountStoreDelegate

- (id)accountsForAccountManager:(id)a3
{
  id v4;
  _TtCO27SiriSuggestionsIntelligence27SiriSuggestionsIntelligenceP33_5C99411072011048FFC9A949C6515F9C20AccountStoreDelegate *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  sub_2472AF33C();

  type metadata accessor for AIDAServiceType(0);
  sub_2472B1E28(0, (unint64_t *)&unk_2544408B8);
  sub_2472B200C(&qword_254440840, (uint64_t (*)(uint64_t))type metadata accessor for AIDAServiceType, (uint64_t)&unk_24731C83C);
  v6 = (void *)sub_24731B46C();
  swift_bridgeObjectRelease();
  return v6;
}

- (_TtCO27SiriSuggestionsIntelligence27SiriSuggestionsIntelligenceP33_5C99411072011048FFC9A949C6515F9C20AccountStoreDelegate)init
{
  sub_2472AFD50();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCO27SiriSuggestionsIntelligence27SiriSuggestionsIntelligenceP33_5C99411072011048FFC9A949C6515F9C20AccountStoreDelegate_servicesOwnerManager));
}

@end
