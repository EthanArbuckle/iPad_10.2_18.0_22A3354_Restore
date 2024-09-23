@implementation UIEvent(PNP)

- (BOOL)pnp_isPencilEvent
{
  void *v1;
  _BOOL8 v2;

  if (!objc_msgSend(a1, "_hidEvent"))
    return 0;
  IOHIDEventGetChildren();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 0;
  if (objc_msgSend(v1, "count"))
  {
    objc_msgSend(v1, "objectAtIndex:", 0);
    if (!IOHIDEventGetIntegerValue())
      v2 = 1;
  }

  return v2;
}

@end
