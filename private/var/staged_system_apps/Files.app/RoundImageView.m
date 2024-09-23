@implementation RoundImageView

- (void)layoutSubviews
{
  id v2;
  id v3;
  id v4;
  objc_super v5;
  CGRect v6;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RoundImageView();
  v2 = v5.receiver;
  -[RoundImageView layoutSubviews](&v5, "layoutSubviews");
  v3 = objc_msgSend(v2, "layer", v5.receiver, v5.super_class);
  objc_msgSend(v3, "setMasksToBounds:", 1);

  v4 = objc_msgSend(v2, "layer");
  objc_msgSend(v2, "bounds");
  objc_msgSend(v4, "setCornerRadius:", CGRectGetHeight(v6) * 0.5);

}

- (_TtC5FilesP33_2CDE72793B16146F97C3D59460763C8F14RoundImageView)initWithImage:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RoundImageView();
  return -[RoundImageView initWithImage:](&v5, "initWithImage:", a3);
}

- (_TtC5FilesP33_2CDE72793B16146F97C3D59460763C8F14RoundImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for RoundImageView();
  return -[RoundImageView initWithImage:highlightedImage:](&v7, "initWithImage:highlightedImage:", a3, a4);
}

- (_TtC5FilesP33_2CDE72793B16146F97C3D59460763C8F14RoundImageView)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for RoundImageView();
  return -[RoundImageView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC5FilesP33_2CDE72793B16146F97C3D59460763C8F14RoundImageView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RoundImageView();
  return -[RoundImageView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
