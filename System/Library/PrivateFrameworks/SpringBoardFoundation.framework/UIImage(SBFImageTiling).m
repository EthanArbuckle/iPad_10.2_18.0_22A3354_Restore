@implementation UIImage(SBFImageTiling)

- (uint64_t)sbf_imageByTilingCenterPixel
{
  double v2;
  double v3;
  double v4;

  objc_msgSend(a1, "size");
  objc_msgSend(a1, "scale");
  UIFloorToScale();
  v3 = v2;
  UIFloorToScale();
  return objc_msgSend(a1, "resizableImageWithCapInsets:", v4, v3, v4, v3);
}

@end
