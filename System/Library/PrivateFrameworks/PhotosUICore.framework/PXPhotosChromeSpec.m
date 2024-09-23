@implementation PXPhotosChromeSpec

+ (CGSize)secondaryToolbarSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 216.0;
  v3 = 44.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (UIEdgeInsets)secondaryToolbarPaddingForSizeClass:(int64_t)a3 safeAreaInsets:(UIEdgeInsets)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  v4 = sub_1A69C809C(a3, a4.bottom);
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

+ (double)maximumAccessoryViewPadding
{
  return 40.0;
}

- (PXPhotosChromeSpec)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PhotosChromeSpec();
  return -[PXPhotosChromeSpec init](&v3, sel_init);
}

@end
