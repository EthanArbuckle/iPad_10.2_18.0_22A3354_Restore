@implementation UIGestureRecognizer(SystemApertureAdditions)

- (uint64_t)sb_cancel
{
  objc_msgSend(a1, "setEnabled:", 0);
  return objc_msgSend(a1, "setEnabled:", 1);
}

@end
