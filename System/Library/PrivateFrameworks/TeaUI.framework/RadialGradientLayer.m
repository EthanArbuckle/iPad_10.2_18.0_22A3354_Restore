@implementation RadialGradientLayer

- (_TtC5TeaUI19RadialGradientLayer)init
{
  _TtC5TeaUI19RadialGradientLayer *result;

  RadialGradientLayer.init()();
  return result;
}

- (_TtC5TeaUI19RadialGradientLayer)initWithLayer:(id)a3
{
  _QWORD v4[4];

  swift_unknownObjectRetain();
  sub_1B16BA3AC();
  swift_unknownObjectRelease();
  return (_TtC5TeaUI19RadialGradientLayer *)RadialGradientLayer.init(layer:)(v4);
}

- (_TtC5TeaUI19RadialGradientLayer)initWithCoder:(id)a3
{
  id v3;
  _TtC5TeaUI19RadialGradientLayer *result;

  v3 = a3;
  RadialGradientLayer.init(coder:)();
  return result;
}

- (void)drawInContext:(CGContext *)a3
{
  CGContext *v4;
  _TtC5TeaUI19RadialGradientLayer *v5;

  v4 = a3;
  v5 = self;
  RadialGradientLayer.draw(in:)(v4);

}

- (void).cxx_destruct
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_1B1622A0C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5TeaUI19RadialGradientLayer_gradientDescriptor, v2, v3, v4, v5, v6);
}

@end
