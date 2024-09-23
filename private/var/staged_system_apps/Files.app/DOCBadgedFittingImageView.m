@implementation DOCBadgedFittingImageView

- (_TtC5Files25DOCBadgedFittingImageView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC5Files25DOCBadgedFittingImageView *v7;
  id v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType(self, a2);
  v7 = -[DOCBadgedFittingImageView initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
  v8 = -[DOCBadgedFittingImageView layer](v7, "layer");
  objc_msgSend(v8, "setMagnificationFilter:", kCAFilterTrilinear);

  return v7;
}

- (_TtC5Files25DOCBadgedFittingImageView)initWithCoder:(id)a3
{
  _TtC5Files25DOCBadgedFittingImageView *result;

  result = (_TtC5Files25DOCBadgedFittingImageView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010050DA60, "Files/DOCItemCollectionCell.swift", 33, 2, 35, 0);
  __break(1u);
  return result;
}

- (_TtC5Files25DOCBadgedFittingImageView)initWithImage:(id)a3
{
  id v3;
  _TtC5Files25DOCBadgedFittingImageView *result;

  v3 = a3;
  result = (_TtC5Files25DOCBadgedFittingImageView *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCBadgedFittingImageView", 31, "init(image:)", 12, 0);
  __break(1u);
  return result;
}

- (_TtC5Files25DOCBadgedFittingImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v5;
  id v6;
  _TtC5Files25DOCBadgedFittingImageView *result;

  v5 = a3;
  v6 = a4;
  result = (_TtC5Files25DOCBadgedFittingImageView *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCBadgedFittingImageView", 31, "init(image:highlightedImage:)", 29, 0);
  __break(1u);
  return result;
}

@end
