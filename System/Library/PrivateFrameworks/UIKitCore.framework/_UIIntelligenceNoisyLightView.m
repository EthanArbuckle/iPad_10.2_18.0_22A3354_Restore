@implementation _UIIntelligenceNoisyLightView

+ (Class)layerClass
{
  sub_1857197B4();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC5UIKit29_UIIntelligenceNoisyLightView)initWithCoder:(id)a3
{
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return 0;
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  objc_msgSend(v2, sel_bounds, v3.receiver, v3.super_class);
  swift_getKeyPath();
  sub_18571913C();

  swift_release();
}

- (void)_layerCornerRadiusDidChange:(double)a3
{
  _TtC5UIKit29_UIIntelligenceNoisyLightView *v4;

  swift_getKeyPath();
  v4 = self;
  sub_1857191F0();

  swift_release();
}

- (void)_layerCornerCurveDidChange:(id)a3
{
  id v5;
  _TtC5UIKit29_UIIntelligenceNoisyLightView *v6;

  swift_getKeyPath();
  v5 = a3;
  v6 = self;
  sub_185719288(v5);

  swift_release();
}

- (void)_layerMaskedCornersDidChange:(unint64_t)a3
{
  _TtC5UIKit29_UIIntelligenceNoisyLightView *v4;

  swift_getKeyPath();
  v4 = self;
  sub_185719318();

  swift_release();
}

- (_TtC5UIKit29_UIIntelligenceNoisyLightView)initWithFrame:(CGRect)a3
{
  _TtC5UIKit29_UIIntelligenceNoisyLightView *result;

  result = (_TtC5UIKit29_UIIntelligenceNoisyLightView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit29_UIIntelligenceNoisyLightView_noiseView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit29_UIIntelligenceNoisyLightView_lightView));
}

@end
