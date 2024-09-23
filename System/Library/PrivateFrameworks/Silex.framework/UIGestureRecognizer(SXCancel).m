@implementation UIGestureRecognizer(SXCancel)

- (uint64_t)cancel
{
  objc_msgSend(a1, "setEnabled:", 0);
  return objc_msgSend(a1, "setEnabled:", 1);
}

@end
