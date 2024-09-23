@implementation UIImage(SBFEXIFConveniences)

- (uint64_t)sbf_EXIFOrientation
{
  objc_msgSend(a1, "imageOrientation");
  return _EXIFOrientationForUIImageOrientation();
}

@end
