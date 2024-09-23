@implementation WAKView(WebExtras)

- (void)_web_superviewOfClass:()WebExtras
{
  void *i;

  for (i = (void *)objc_msgSend(a1, "superview"); i; i = (void *)objc_msgSend(i, "superview"))
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
  }
  return i;
}

- (uint64_t)_web_parentWebFrameView
{
  return objc_msgSend(a1, "_web_superviewOfClass:", objc_opt_class());
}

- (uint64_t)_web_firstResponderIsSelfOrDescendantView
{
  uint64_t result;
  void *v3;

  result = objc_msgSend((id)objc_msgSend(a1, "window"), "firstResponder");
  if (result)
  {
    v3 = (void *)result;
    if ((void *)result == a1)
    {
      return 1;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        return objc_msgSend(v3, "isDescendantOf:", a1);
      else
        return 0;
    }
  }
  return result;
}

@end
