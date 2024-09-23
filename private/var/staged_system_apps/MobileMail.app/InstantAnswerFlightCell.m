@implementation InstantAnswerFlightCell

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  id v4;
  _TtC10MobileMail23InstantAnswerFlightCell *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC10MobileMail23InstantAnswerFlightCell *v11;

  v11 = self;
  v10 = a3;
  v9 = type metadata accessor for UICellConfigurationState(0);
  v7 = *(_QWORD *)(v9 - 8);
  v6 = (*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v8 = (uint64_t)&v6 - v6;
  v4 = (id)__chkstk_darwin(v10);
  v5 = self;
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(v10);
  sub_1002595F0(v8);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);

}

- (_TtC10MobileMail23InstantAnswerFlightCell)initWithFrame:(CGRect)a3
{
  return (_TtC10MobileMail23InstantAnswerFlightCell *)sub_10025B278(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10MobileMail23InstantAnswerFlightCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (_TtC10MobileMail23InstantAnswerFlightCell *)sub_10025B380(a3);
}

@end
