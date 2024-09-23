@implementation ShadowBackdropView

- (void)layoutSubviews
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  id v12;
  id v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)swift_getObjectType();
  v2 = v14.receiver;
  -[ShadowBackdropView layoutSubviews](&v14, "layoutSubviews");
  objc_msgSend(v2, "bounds", v14.receiver, v14.super_class);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = objc_msgSend(v2, "layer");
  v12 = objc_msgSend((id)objc_opt_self(UIBezierPath), "bezierPathWithRoundedRect:cornerRadius:", v4, v6, v8, v10, 6.0);
  v13 = objc_msgSend(v12, "CGPath");

  objc_msgSend(v11, "setShadowPath:", v13);
  sub_90384C();

}

- (_TtC16MusicApplicationP33_A3A68D9BDEEA2EFD7AF836E311107B9218ShadowBackdropView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[ShadowBackdropView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC16MusicApplicationP33_A3A68D9BDEEA2EFD7AF836E311107B9218ShadowBackdropView)initWithCoder:(id)a3
{
  id v4;
  _TtC16MusicApplicationP33_A3A68D9BDEEA2EFD7AF836E311107B9218ShadowBackdropView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = -[ShadowBackdropView initWithCoder:](&v7, "initWithCoder:", v4);

  return v5;
}

- (_TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB18ShadowBackdropView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[ShadowBackdropView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB18ShadowBackdropView)initWithCoder:(id)a3
{
  id v4;
  _TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB18ShadowBackdropView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = -[ShadowBackdropView initWithCoder:](&v7, "initWithCoder:", v4);

  return v5;
}

@end
