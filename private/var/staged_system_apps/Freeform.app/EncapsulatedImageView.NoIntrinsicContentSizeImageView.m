@implementation EncapsulatedImageView.NoIntrinsicContentSizeImageView

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = UIViewNoIntrinsicMetric;
  v3 = UIViewNoIntrinsicMetric;
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtCC8FreeformP33_22C834EA6031CC5FD96573982091823D21EncapsulatedImageView31NoIntrinsicContentSizeImageView)initWithImage:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for EncapsulatedImageView.NoIntrinsicContentSizeImageView();
  return -[EncapsulatedImageView.NoIntrinsicContentSizeImageView initWithImage:](&v5, "initWithImage:", a3);
}

- (_TtCC8FreeformP33_22C834EA6031CC5FD96573982091823D21EncapsulatedImageView31NoIntrinsicContentSizeImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for EncapsulatedImageView.NoIntrinsicContentSizeImageView();
  return -[EncapsulatedImageView.NoIntrinsicContentSizeImageView initWithImage:highlightedImage:](&v7, "initWithImage:highlightedImage:", a3, a4);
}

- (_TtCC8FreeformP33_22C834EA6031CC5FD96573982091823D21EncapsulatedImageView31NoIntrinsicContentSizeImageView)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for EncapsulatedImageView.NoIntrinsicContentSizeImageView();
  return -[EncapsulatedImageView.NoIntrinsicContentSizeImageView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCC8FreeformP33_22C834EA6031CC5FD96573982091823D21EncapsulatedImageView31NoIntrinsicContentSizeImageView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for EncapsulatedImageView.NoIntrinsicContentSizeImageView();
  return -[EncapsulatedImageView.NoIntrinsicContentSizeImageView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
