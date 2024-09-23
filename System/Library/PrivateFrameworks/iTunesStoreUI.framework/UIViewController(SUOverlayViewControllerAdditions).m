@implementation UIViewController(SUOverlayViewControllerAdditions)

- (void)overlayViewController
{
  void *i;

  for (i = a1; i; i = (void *)objc_msgSend(i, "parentViewController"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
  }
  return i;
}

- (uint64_t)scriptWindowContext
{
  return objc_msgSend((id)objc_msgSend(a1, "parentViewController"), "scriptWindowContext");
}

@end
