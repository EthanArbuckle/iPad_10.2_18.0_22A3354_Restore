@implementation PanGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  _TtC12NowPlayingUIP33_FA232F067623283ED0BBB5857CB78B8620PanGestureRecognizer *v11;
  Class isa;
  objc_super v13;

  v7 = sub_F174(0, &qword_1FC800, UITouch_ptr);
  v8 = sub_4C000();
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  v10 = a4;
  v11 = self;
  isa = Set._bridgeToObjectiveC()().super.isa;
  v13.receiver = v11;
  v13.super_class = (Class)type metadata accessor for PanGestureRecognizer();
  -[PanGestureRecognizer touchesBegan:withEvent:](&v13, "touchesBegan:withEvent:", isa, v10);

  -[PanGestureRecognizer setState:](v11, "setState:", 1);
  swift_bridgeObjectRelease(v9);
}

- (_TtC12NowPlayingUIP33_FA232F067623283ED0BBB5857CB78B8620PanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  uint64_t v6;
  _OWORD v8[2];

  if (a3)
  {
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v8, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  return (_TtC12NowPlayingUIP33_FA232F067623283ED0BBB5857CB78B8620PanGestureRecognizer *)sub_43F24((uint64_t)v8, (uint64_t)a4);
}

@end
