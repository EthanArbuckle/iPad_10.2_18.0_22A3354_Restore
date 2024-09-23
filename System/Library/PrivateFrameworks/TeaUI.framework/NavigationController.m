@implementation NavigationController

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  id v6;
  _TtC5TeaUI20NavigationController *v7;

  v6 = a3;
  v7 = self;
  sub_1B13CFA6C(v6, a4);

}

- (_TtC5TeaUI20NavigationController)initWithRootViewController:(id)a3
{
  id v3;
  _TtC5TeaUI20NavigationController *result;

  v3 = a3;
  NavigationController.init(rootViewController:)();
  return result;
}

- (void)setHidesBottomBarWhenPushed:(BOOL)a3
{
  _BOOL8 v3;
  _TtC5TeaUI20NavigationController *v4;

  v3 = a3;
  v4 = self;
  NavigationController.hidesBottomBarWhenPushed.setter(v3);

}

- (int64_t)ts_preferredCenterStatusBarStyle
{
  _TtC5TeaUI20NavigationController *v2;
  int64_t v3;

  v2 = self;
  v3 = NavigationController.ts_preferredCenterStatusBarStyle.getter();

  return v3;
}

- (int64_t)preferredStatusBarStyle
{
  _TtC5TeaUI20NavigationController *v2;
  int64_t v3;

  v2 = self;
  v3 = NavigationController.preferredStatusBarStyle.getter();

  return v3;
}

- (void).cxx_destruct
{
  swift_release();
}

- (_TtC5TeaUI20NavigationController)initWithRootViewController:(id)a3 navigationBarClass:(Class)a4
{
  uint64_t ObjCClassMetadata;
  _TtC5TeaUI20NavigationController *result;

  if (a4)
    ObjCClassMetadata = swift_getObjCClassMetadata();
  else
    ObjCClassMetadata = 0;
  NavigationController.init(rootViewController:navigationBarClass:)((uint64_t)a3, ObjCClassMetadata);
  return result;
}

- (_TtC5TeaUI20NavigationController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  NavigationController.init(coder:)();
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _TtC5TeaUI20NavigationController *v4;
  void *v5;

  v3 = a3;
  v4 = self;
  v5 = (void *)sub_1B14B86F4(v3);

  return v5;
}

- (id)popToViewController:(id)a3 animated:(BOOL)a4
{
  id v6;
  _TtC5TeaUI20NavigationController *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = self;
  sub_1B14B8A68(v6, a4);
  v9 = v8;

  if (v9)
  {
    sub_1B13A1BE4(0, (unint64_t *)&qword_1ED183800);
    v10 = (void *)sub_1B16B9B48();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)popToRootViewControllerAnimated:(BOOL)a3
{
  _TtC5TeaUI20NavigationController *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = self;
  sub_1B14B8C10(a3);
  v6 = v5;

  if (v6)
  {
    sub_1B13A1BE4(0, (unint64_t *)&qword_1ED183800);
    v7 = (void *)sub_1B16B9B48();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (BOOL)accessibilityPerformEscape
{
  _TtC5TeaUI20NavigationController *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1B14B8D80((uint64_t)v2);

  return v3 & 1;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _TtC5TeaUI20NavigationController *v6;

  v6 = self;
  sub_1B14B8E88(a3, a4);

}

- (_TtC5TeaUI20NavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  NavigationController.init(navigationBarClass:toolbarClass:)();
}

- (_TtC5TeaUI20NavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1B16B9860();
  v5 = a4;
  NavigationController.init(nibName:bundle:)();
}

- (BOOL)hidesBottomBarWhenPushed
{
  _TtC5TeaUI20NavigationController *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = NavigationController.hidesBottomBarWhenPushed.getter();

  return v3 & 1;
}

@end
