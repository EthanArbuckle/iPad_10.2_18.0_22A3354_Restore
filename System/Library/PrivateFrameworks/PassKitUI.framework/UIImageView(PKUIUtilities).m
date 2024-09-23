@implementation UIImageView(PKUIUtilities)

- (uint64_t)pkui_alignmentRect
{
  objc_msgSend(a1, "frame");
  return objc_msgSend(a1, "alignmentRectForFrame:");
}

- (uint64_t)pkui_setAlignmentRect:()PKUIUtilities
{
  objc_msgSend(a1, "frameForAlignmentRect:");
  return objc_msgSend(a1, "setFrame:");
}

- (double)pkui_alignmentSize
{
  double v2;
  double v3;
  double v4;
  double v5;

  objc_msgSend(a1, "frame");
  v3 = v2;
  objc_msgSend(a1, "alignmentRectInsets");
  return v3 - (v4 + v5);
}

@end
