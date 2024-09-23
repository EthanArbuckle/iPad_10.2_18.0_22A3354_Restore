@implementation UITabBarController

- (BOOL)usingVariableBlurBottomBar
{
  void *v3;
  UITabBarController *v4;
  id v5;
  UITabBarController *v6;
  uint64_t v7;
  BOOL v8;
  __objc2_prot *v10;

  v10 = &OBJC_PROTOCOL____TtP5Files31DOCVariableBlurTabBarContaining__0;
  v3 = (void *)swift_dynamicCastObjCProtocolUnconditional(self, 1, &v10, 0, 0, 0);
  v4 = self;
  v5 = objc_msgSend(v3, "tabBar");
  v6 = (UITabBarController *)objc_msgSend(v5, "_backgroundView");

  if (v6)
  {
    v7 = type metadata accessor for DOCTabBarVariableBlurBackgroundView();
    v8 = swift_dynamicCastClass(v6, v7) != 0;

    v4 = v6;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setUsingVariableBlurBottomBar:(BOOL)a3
{
  UITabBarController *v4;

  v4 = self;
  UITabBarController.usingVariableBlurBottomBar.setter(a3);

}

- (void)detatchVariableBlurView
{
  UITabBarController *v2;

  v2 = self;
  sub_100453974();

}

@end
