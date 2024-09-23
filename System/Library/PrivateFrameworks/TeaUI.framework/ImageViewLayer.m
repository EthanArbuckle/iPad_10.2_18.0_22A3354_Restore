@implementation ImageViewLayer

- (void)setShadowOffset:(CGSize)a3
{
  double height;
  double width;
  _TtC5TeaUIP33_01AB305DE961FE9633E4B4930A1B15A714ImageViewLayer *v5;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_1B13BE074(width, height);

}

- (void)setShadowRadius:(double)a3
{
  _TtC5TeaUIP33_01AB305DE961FE9633E4B4930A1B15A714ImageViewLayer *v4;

  v4 = self;
  sub_1B13BE104(a3);

}

- (void)setShadowOpacity:(float)a3
{
  _TtC5TeaUIP33_01AB305DE961FE9633E4B4930A1B15A714ImageViewLayer *v4;

  v4 = self;
  sub_1B13BE218(a3);

}

- (CGSize)shadowOffset
{
  _TtC5TeaUIP33_01AB305DE961FE9633E4B4930A1B15A714ImageViewLayer *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  sub_1B13CC26C();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (float)shadowOpacity
{
  _TtC5TeaUIP33_01AB305DE961FE9633E4B4930A1B15A714ImageViewLayer *v2;
  float v3;
  float v4;

  v2 = self;
  sub_1B13CC2D8();
  v4 = v3;

  return v4;
}

- (void)setShadowColor:(CGColor *)a3
{
  CGColor *v5;
  _TtC5TeaUIP33_01AB305DE961FE9633E4B4930A1B15A714ImageViewLayer *v6;

  v5 = a3;
  v6 = self;
  sub_1B13CE624(a3);

}

- (void)setShadowPath:(const CGPath *)a3
{
  const CGPath *v5;
  _TtC5TeaUIP33_01AB305DE961FE9633E4B4930A1B15A714ImageViewLayer *v6;

  v5 = a3;
  v6 = self;
  sub_1B13CE624(a3);

}

- (void)setMaskedCorners:(unint64_t)a3
{
  _TtC5TeaUIP33_01AB305DE961FE9633E4B4930A1B15A714ImageViewLayer *v4;

  v4 = self;
  sub_1B13D4338(a3);

}

- (void)setCornerRadius:(double)a3
{
  _TtC5TeaUIP33_01AB305DE961FE9633E4B4930A1B15A714ImageViewLayer *v4;

  v4 = self;
  sub_1B13D6F48(a3);

}

- (_TtC5TeaUIP33_01AB305DE961FE9633E4B4930A1B15A714ImageViewLayer)init
{
  return (_TtC5TeaUIP33_01AB305DE961FE9633E4B4930A1B15A714ImageViewLayer *)sub_1B13D7A54();
}

- (double)shadowRadius
{
  _TtC5TeaUIP33_01AB305DE961FE9633E4B4930A1B15A714ImageViewLayer *v2;
  double v3;
  double v4;

  v2 = self;
  sub_1B13D8380();
  v4 = v3;

  return v4;
}

- (double)cornerRadius
{
  _TtC5TeaUIP33_01AB305DE961FE9633E4B4930A1B15A714ImageViewLayer *v2;
  double v3;
  double v4;

  v2 = self;
  sub_1B13D8380();
  v4 = v3;

  return v4;
}

- (const)shadowPath
{
  _TtC5TeaUIP33_01AB305DE961FE9633E4B4930A1B15A714ImageViewLayer *v2;
  id v3;

  v2 = self;
  v3 = sub_1B13DB580();

  return (const CGPath *)v3;
}

- (CGColor)shadowColor
{
  _TtC5TeaUIP33_01AB305DE961FE9633E4B4930A1B15A714ImageViewLayer *v2;
  id v3;

  v2 = self;
  v3 = sub_1B13DB580();

  return (CGColor *)v3;
}

- (_TtC5TeaUIP33_01AB305DE961FE9633E4B4930A1B15A714ImageViewLayer)initWithCoder:(id)a3
{
  return (_TtC5TeaUIP33_01AB305DE961FE9633E4B4930A1B15A714ImageViewLayer *)sub_1B155C480(a3);
}

- (_TtC5TeaUIP33_01AB305DE961FE9633E4B4930A1B15A714ImageViewLayer)initWithLayer:(id)a3
{
  _QWORD v4[4];

  swift_unknownObjectRetain();
  sub_1B16BA3AC();
  swift_unknownObjectRelease();
  return (_TtC5TeaUIP33_01AB305DE961FE9633E4B4930A1B15A714ImageViewLayer *)sub_1B155C500(v4);
}

- (unint64_t)maskedCorners
{
  _TtC5TeaUIP33_01AB305DE961FE9633E4B4930A1B15A714ImageViewLayer *v2;
  id v3;

  v2 = self;
  v3 = sub_1B155C60C();

  return (unint64_t)v3;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC5TeaUIP33_01AB305DE961FE9633E4B4930A1B15A714ImageViewLayer_coordinateWithLayer));
}

@end
