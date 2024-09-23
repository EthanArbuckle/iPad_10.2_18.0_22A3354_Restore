@implementation UIViewController(Widgets)

- (BOOL)wg_isAppearingOrAppeared
{
  return objc_msgSend(a1, "_appearState") - 1 < 2;
}

- (BOOL)wg_isDisappearingOrDisappeared
{
  int v1;

  v1 = objc_msgSend(a1, "_appearState");
  return !v1 || v1 == 3;
}

- (BOOL)wg_isAppearanceTransitioning
{
  return (objc_msgSend(a1, "_appearState") & 0xFFFFFFFD) == 1;
}

- (uint64_t)wg_beginAppearanceTransitionIfNecessary:()Widgets animated:
{
  uint64_t result;

  result = objc_msgSend(a1, "isViewLoaded");
  if ((_DWORD)result)
  {
    if ((_DWORD)a3)
    {
      if ((objc_msgSend(a1, "wg_isDisappearingOrDisappeared") & 1) == 0)
        return 0;
    }
    else
    {
      result = objc_msgSend(a1, "wg_isAppearingOrAppeared");
      if (!(_DWORD)result)
        return result;
    }
    objc_msgSend(a1, "beginAppearanceTransition:animated:", a3, a4);
    return 1;
  }
  return result;
}

- (uint64_t)wg_endAppearanceTransitionIfNecessary
{
  uint64_t result;

  result = objc_msgSend(a1, "isViewLoaded");
  if ((_DWORD)result)
  {
    if ((objc_msgSend(a1, "_appearState") & 0xFFFFFFFD) == 1)
    {
      objc_msgSend(a1, "endAppearanceTransition");
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

@end
