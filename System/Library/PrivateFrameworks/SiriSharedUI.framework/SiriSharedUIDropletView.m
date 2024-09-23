@implementation SiriSharedUIDropletView

+ (Class)layerClass
{
  type metadata accessor for SiriSharedUIDropletLayer();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC12SiriSharedUI23SiriSharedUIDropletView)init
{
  _TtC12SiriSharedUI23SiriSharedUIDropletView *v2;
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SiriSharedUIDropletView();
  v2 = -[SiriSharedUIDropletView initWithFrame:](&v5, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v3 = -[SiriSharedUIDropletView layer](v2, sel_layer);
  type metadata accessor for SiriSharedUIDropletLayer();
  swift_dynamicCastClassUnconditional();
  sub_1DE11B2F0();

  return v2;
}

- (_TtC12SiriSharedUI23SiriSharedUIDropletView)initWithCoder:(id)a3
{
  _TtC12SiriSharedUI23SiriSharedUIDropletView *result;

  result = (_TtC12SiriSharedUI23SiriSharedUIDropletView *)sub_1DE130BFC();
  __break(1u);
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  uint64_t v4;
  double y;
  double x;
  id v8;
  _TtC12SiriSharedUI23SiriSharedUIDropletView *v9;
  id v10;
  unint64_t v11;
  id v12;
  _TtC12SiriSharedUI23SiriSharedUIDropletView *v13;

  v4 = (uint64_t)a4;
  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = -[SiriSharedUIDropletView subviews](v9, sel_subviews);
  sub_1DE10FE10();
  v11 = sub_1DE1309BC();

  v12 = v8;
  v13 = v9;
  LOBYTE(v4) = sub_1DE10FE4C(v11, v13, v4, x, y);
  swift_bridgeObjectRelease();

  return v4 & 1;
}

- (_TtC12SiriSharedUI23SiriSharedUIDropletView)initWithFrame:(CGRect)a3
{
  _TtC12SiriSharedUI23SiriSharedUIDropletView *result;

  result = (_TtC12SiriSharedUI23SiriSharedUIDropletView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
