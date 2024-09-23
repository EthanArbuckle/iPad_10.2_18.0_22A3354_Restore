@implementation UIEvent(IC)

- (const)ic_isPencilEvent
{
  const __CFArray *result;
  const __CFArray *v2;

  result = (const __CFArray *)objc_msgSend(a1, "_hidEvent");
  if (result)
  {
    result = (const __CFArray *)IOHIDEventGetChildren();
    if (result)
    {
      v2 = result;
      if (CFArrayGetCount(result)
        && (CFArrayGetValueAtIndex(v2, 0), IOHIDEventGetType() == 11))
      {
        return (const __CFArray *)(IOHIDEventGetIntegerValue() == 0);
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

@end
