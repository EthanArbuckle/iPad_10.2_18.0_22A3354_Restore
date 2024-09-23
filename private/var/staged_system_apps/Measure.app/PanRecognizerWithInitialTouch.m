@implementation PanRecognizerWithInitialTouch

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  _TtC7Measure29PanRecognizerWithInitialTouch *v11;

  v7 = sub_10001AD70();
  v8 = sub_10001ADAC();
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  v10 = a4;
  v11 = self;
  sub_10008C07C(v9, (uint64_t)v10);

  swift_bridgeObjectRelease(v9);
}

- (_TtC7Measure29PanRecognizerWithInitialTouch)initWithTarget:(id)a3 action:(SEL)a4
{
  uint64_t v6;
  _OWORD v8[2];

  if (a3)
  {
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v8, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  return (_TtC7Measure29PanRecognizerWithInitialTouch *)sub_10008C1F8((uint64_t)v8, (uint64_t)a4);
}

@end
