@implementation UITabBarController(VideosUICore)

- (void)setVuiViewControllers:()VideosUICore
{
  if (a3)
    return (void *)objc_msgSend(a1, "setViewControllers:");
  return a1;
}

- (id)init
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&off_1F01F2520;
  return objc_msgSendSuper2(&v2, sel_init);
}

@end
