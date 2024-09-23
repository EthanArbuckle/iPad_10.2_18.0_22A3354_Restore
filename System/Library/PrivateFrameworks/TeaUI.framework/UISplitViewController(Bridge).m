@implementation UISplitViewController(Bridge)

- (uint64_t)ts_setGutterWidth:()Bridge
{
  *(float *)&a3 = a3;
  return objc_msgSend(a1, "setGutterWidth:", a3);
}

- (uint64_t)ts_isCollapsing
{
  uint64_t result;

  result = objc_msgSend(a1, "_isCollapsed");
  if ((_DWORD)result)
    return objc_msgSend(a1, "isCollapsed") ^ 1;
  return result;
}

- (void)ts_setPrimaryBackgroundStyle:()Bridge
{
  void *v3;

  v3 = result;
  if (a3 != 1)
  {
    if (a3)
      return result;
    objc_msgSend(result, "setPrimaryBackgroundStyle:");
  }
  return (void *)objc_msgSend(v3, "setPrimaryBackgroundStyle:", 1);
}

@end
