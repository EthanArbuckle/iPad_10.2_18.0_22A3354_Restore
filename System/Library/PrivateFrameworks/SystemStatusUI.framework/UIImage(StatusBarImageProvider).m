@implementation UIImage(StatusBarImageProvider)

- (uint64_t)isFromStatusBarImageProvider
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

@end
