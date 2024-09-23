@implementation DOCGoToSuggestionsViewController.SuggestionCell

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtCC5Files32DOCGoToSuggestionsViewControllerP33_D3104C987618D68A12FF2C3DB05A577214SuggestionCell *v9;
  uint64_t v10;

  v5 = type metadata accessor for UICellConfigurationState(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_100454330((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtCC5Files32DOCGoToSuggestionsViewControllerP33_D3104C987618D68A12FF2C3DB05A577214SuggestionCell)initWithFrame:(CGRect)a3
{
  return (_TtCC5Files32DOCGoToSuggestionsViewControllerP33_D3104C987618D68A12FF2C3DB05A577214SuggestionCell *)sub_100454628(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for DOCGoToSuggestionsViewController.SuggestionCell);
}

- (_TtCC5Files32DOCGoToSuggestionsViewControllerP33_D3104C987618D68A12FF2C3DB05A577214SuggestionCell)initWithCoder:(id)a3
{
  return (_TtCC5Files32DOCGoToSuggestionsViewControllerP33_D3104C987618D68A12FF2C3DB05A577214SuggestionCell *)sub_1004546A4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_QWORD))type metadata accessor for DOCGoToSuggestionsViewController.SuggestionCell);
}

@end
