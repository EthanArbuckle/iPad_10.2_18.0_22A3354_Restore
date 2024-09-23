@implementation UITabBarItem(SUAdditions)

- (uint64_t)setBadgeValue:()SUAdditions animated:blink:
{
  if ((_DWORD)a4)
    objc_msgSend(a1, "setBadgeValue:", 0);
  objc_msgSend(a1, "setAnimatedBadge:", a4);
  objc_msgSend(a1, "setBadgeValue:", a3);
  return objc_msgSend(a1, "setAnimatedBadge:", a5);
}

@end
