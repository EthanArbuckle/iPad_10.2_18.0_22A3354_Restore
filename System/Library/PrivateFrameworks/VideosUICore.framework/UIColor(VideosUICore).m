@implementation UIColor(VideosUICore)

- (uint64_t)colorByRemovingTransparency
{
  return objc_msgSend(a1, "colorWithAlphaComponent:", 1.0);
}

@end
