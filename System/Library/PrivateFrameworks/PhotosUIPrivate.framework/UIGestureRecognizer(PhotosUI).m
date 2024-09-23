@implementation UIGestureRecognizer(PhotosUI)

- (uint64_t)pu_cancel
{
  uint64_t result;

  result = objc_msgSend(a1, "isEnabled");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "setEnabled:", 0);
    return objc_msgSend(a1, "setEnabled:", 1);
  }
  return result;
}

@end
