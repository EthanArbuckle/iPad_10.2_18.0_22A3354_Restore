@implementation CALayer(RBAnimationTimer)

- (uint64_t)screen
{
  uint64_t v2;
  BOOL v3;
  uint64_t Delegate;
  void *v6;

  if (screen_once != -1)
    dispatch_once_f(&screen_once, 0, (dispatch_function_t)screen_init);
  v2 = uiview_cls;
  if (uiview_cls)
    v3 = a1 == 0;
  else
    v3 = 1;
  if (v3)
    return 0;
  while (1)
  {
    if (v2)
    {
      Delegate = CALayerGetDelegate();
      if (Delegate)
      {
        v6 = (void *)Delegate;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
      }
    }
    if (!CALayerGetSuperlayer())
      return 0;
    v2 = uiview_cls;
  }
  return objc_msgSend((id)objc_msgSend(v6, "window"), "screen");
}

@end
