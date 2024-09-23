@implementation TTRIMainNavigationController

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _TtC9Reminders28TTRIMainNavigationController *v7;

  v4 = a4;
  v6 = a3;
  v7 = self;
  sub_100009630((uint64_t)v6, v4);

}

- (_TtC9Reminders28TTRIMainNavigationController)initWithRootViewController:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  return -[TTRIMainNavigationController initWithRootViewController:](&v5, "initWithRootViewController:", a3);
}

- (_TtC9Reminders28TTRIMainNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType(self, a2);
  return -[TTRIMainNavigationController initWithNavigationBarClass:toolbarClass:](&v7, "initWithNavigationBarClass:toolbarClass:", a3, a4);
}

- (_TtC9Reminders28TTRIMainNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_class *ObjectType;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC9Reminders28TTRIMainNavigationController *v12;
  objc_super v14;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v9 = v8;
    v10 = a4;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }
  else
  {
    v11 = a4;
  }
  v14.receiver = self;
  v14.super_class = ObjectType;
  v12 = -[TTRIMainNavigationController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", a3, a4);

  return v12;
}

- (_TtC9Reminders28TTRIMainNavigationController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  return -[TTRIMainNavigationController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
