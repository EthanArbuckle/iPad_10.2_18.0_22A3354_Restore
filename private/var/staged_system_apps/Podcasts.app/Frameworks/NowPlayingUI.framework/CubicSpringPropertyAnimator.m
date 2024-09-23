@implementation CubicSpringPropertyAnimator

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC12NowPlayingUI27CubicSpringPropertyAnimator *v10;
  id v11;

  if (a4)
  {
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = a3;
  v10 = self;
  v11 = sub_1067A4((uint64_t)a3, v6, v8);

  swift_bridgeObjectRelease(v8);
  return v11;
}

- (_TtC12NowPlayingUI27CubicSpringPropertyAnimator)initWithDuration:(double)a3 timingParameters:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CubicSpringPropertyAnimator();
  return -[CubicSpringPropertyAnimator initWithDuration:timingParameters:](&v7, "initWithDuration:timingParameters:", a4, a3);
}

@end
