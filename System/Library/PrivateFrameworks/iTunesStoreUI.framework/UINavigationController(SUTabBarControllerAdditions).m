@implementation UINavigationController(SUTabBarControllerAdditions)

- (uint64_t)tabBarControllerDidLongPressTabBarItem:()SUTabBarControllerAdditions
{
  return objc_msgSend((id)objc_msgSend(a1, "topViewController"), "tabBarControllerDidLongPressTabBarItem:", a3);
}

- (uint64_t)tabBarControllerDidReselectTabBarItem:()SUTabBarControllerAdditions
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(a1, "viewControllers"), "count");
  if (result == 1)
    return objc_msgSend((id)objc_msgSend(a1, "topViewController"), "tabBarControllerDidReselectTabBarItem:", a3);
  return result;
}

@end
