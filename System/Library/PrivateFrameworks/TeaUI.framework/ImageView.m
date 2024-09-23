@implementation ImageView

- (void)layoutSubviews
{
  _TtC5TeaUI9ImageView *v2;

  v2 = self;
  ImageView.layoutSubviews()();

}

- (BOOL)accessibilityElementsHidden
{
  _TtC5TeaUI9ImageView *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = ImageView.accessibilityElementsHidden.getter();

  return v3 & 1;
}

- (void)setAccessibilityElementsHidden:(BOOL)a3
{
  _TtC5TeaUI9ImageView *v4;

  v4 = self;
  ImageView.accessibilityElementsHidden.setter(a3);

}

- (void)setAccessibilityIgnoresInvertColors:(BOOL)a3
{
  _TtC5TeaUI9ImageView *v4;

  v4 = self;
  ImageView.accessibilityIgnoresInvertColors.setter(a3);

}

- (BOOL)accessibilityIgnoresInvertColors
{
  _TtC5TeaUI9ImageView *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = ImageView.accessibilityIgnoresInvertColors.getter();

  return v3 & 1;
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  _TtC5TeaUI9ImageView *v5;

  v4 = a3;
  v5 = self;
  sub_1B13EDC88();

}

- (UIColor)backgroundColor
{
  _TtC5TeaUI9ImageView *v2;
  id v3;

  v2 = self;
  v3 = sub_1B13EDD04();

  return (UIColor *)v3;
}

+ (Class)layerClass
{
  static ImageView.layerClass.getter();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC5TeaUI9ImageView)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI9ImageView *)ImageView.init(frame:)();
}

- (void)setContentMode:(int64_t)a3
{
  _TtC5TeaUI9ImageView *v3;

  v3 = self;
  ImageView.contentMode.setter();

}

- (int64_t)contentMode
{
  _TtC5TeaUI9ImageView *v2;
  id v3;

  v2 = self;
  v3 = ImageView.contentMode.getter();

  return (int64_t)v3;
}

- (_TtC5TeaUI9ImageView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  ImageView.init(coder:)();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

- (BOOL)clipsToBounds
{
  _TtC5TeaUI9ImageView *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = ImageView.clipsToBounds.getter();

  return v3 & 1;
}

- (void)setClipsToBounds:(BOOL)a3
{
  _TtC5TeaUI9ImageView *v4;

  v4 = self;
  ImageView.clipsToBounds.setter(a3);

}

@end
