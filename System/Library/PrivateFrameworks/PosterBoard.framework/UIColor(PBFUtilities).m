@implementation UIColor(PBFUtilities)

+ (uint64_t)pbf_randomColor
{
  double v0;
  double v1;

  v0 = (double)arc4random() * 0.00390625;
  v1 = (double)(arc4random() & 0x7F) * 0.00390625 + 0.5;
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", v0, v1, (double)(arc4random() & 0x7F) * 0.00390625 + 0.5, 1.0);
}

@end
