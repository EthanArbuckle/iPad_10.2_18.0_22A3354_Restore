@implementation DebugNavigationController

- (_TtC5TeaUI25DebugNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  uint64_t ObjCClassMetadata;
  uint64_t v6;

  if (!a3)
  {
    ObjCClassMetadata = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return (_TtC5TeaUI25DebugNavigationController *)DebugNavigationController.init(navigationBarClass:toolbarClass:)(ObjCClassMetadata, v6);
  }
  ObjCClassMetadata = swift_getObjCClassMetadata();
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v6 = swift_getObjCClassMetadata();
  return (_TtC5TeaUI25DebugNavigationController *)DebugNavigationController.init(navigationBarClass:toolbarClass:)(ObjCClassMetadata, v6);
}

- (_TtC5TeaUI25DebugNavigationController)initWithRootViewController:(id)a3
{
  id v3;
  _TtC5TeaUI25DebugNavigationController *result;

  v3 = a3;
  DebugNavigationController.init(rootViewController:)();
  return result;
}

- (_TtC5TeaUI25DebugNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC5TeaUI25DebugNavigationController *result;

  if (a3)
  {
    v5 = sub_1B16B9860();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  DebugNavigationController.init(nibName:bundle:)(v5, v7, a4);
  return result;
}

- (_TtC5TeaUI25DebugNavigationController)initWithCoder:(id)a3
{
  id v3;
  _TtC5TeaUI25DebugNavigationController *result;

  v3 = a3;
  DebugNavigationController.init(coder:)();
  return result;
}

@end
