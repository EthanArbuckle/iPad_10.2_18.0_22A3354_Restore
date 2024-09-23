@implementation CRLScenesNavigatorViewController.NoIntrinsicContentSizePlatformButton

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

- (_TtCC8Freeform32CRLScenesNavigatorViewControllerP33_05C0AAD711D75A114ED1933B2A36B55D36NoIntrinsicContentSizePlatformButton)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for CRLScenesNavigatorViewController.NoIntrinsicContentSizePlatformButton();
  return -[CRLScenesNavigatorViewController.NoIntrinsicContentSizePlatformButton initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCC8Freeform32CRLScenesNavigatorViewControllerP33_05C0AAD711D75A114ED1933B2A36B55D36NoIntrinsicContentSizePlatformButton)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLScenesNavigatorViewController.NoIntrinsicContentSizePlatformButton();
  return -[CRLScenesNavigatorViewController.NoIntrinsicContentSizePlatformButton initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
