@implementation SliderView.PanGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v7;
  unint64_t v8;
  id v9;
  _TtCC11MusicCoreUI10SliderViewP33_54515F1554A39BA10CF5FF24DBCB49D920PanGestureRecognizer *v10;
  Class isa;
  objc_super v12;

  v7 = sub_10000598C(0, &qword_1004CD4A0, UITouch_ptr);
  v8 = sub_10036E4DC();
  static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  v9 = a4;
  v10 = self;
  isa = Set._bridgeToObjectiveC()().super.isa;
  v12.receiver = v10;
  v12.super_class = (Class)type metadata accessor for SliderView.PanGestureRecognizer();
  -[SliderView.PanGestureRecognizer touchesBegan:withEvent:](&v12, "touchesBegan:withEvent:", isa, v9);

  -[SliderView.PanGestureRecognizer setState:](v10, "setState:", 1);
  swift_bridgeObjectRelease();

}

- (_TtCC11MusicCoreUI10SliderViewP33_54515F1554A39BA10CF5FF24DBCB49D920PanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  uint64_t v6;
  _OWORD v8[2];

  if (a3)
  {
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  return (_TtCC11MusicCoreUI10SliderViewP33_54515F1554A39BA10CF5FF24DBCB49D920PanGestureRecognizer *)sub_10036B7B0((uint64_t)v8, (uint64_t)a4);
}

@end
