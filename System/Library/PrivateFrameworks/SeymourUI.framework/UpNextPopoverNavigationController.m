@implementation UpNextPopoverNavigationController

- (_TtC9SeymourUI33UpNextPopoverNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for UpNextPopoverNavigationController();
  return -[UpNextPopoverNavigationController initWithNavigationBarClass:toolbarClass:](&v7, sel_initWithNavigationBarClass_toolbarClass_, a3, a4);
}

- (_TtC9SeymourUI33UpNextPopoverNavigationController)initWithRootViewController:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for UpNextPopoverNavigationController();
  return -[UpNextPopoverNavigationController initWithRootViewController:](&v5, sel_initWithRootViewController_, a3);
}

- (_TtC9SeymourUI33UpNextPopoverNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _TtC9SeymourUI33UpNextPopoverNavigationController *v9;
  objc_super v11;

  if (a3)
  {
    sub_22BA8067C();
    v6 = a4;
    v7 = (void *)sub_22BA8064C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for UpNextPopoverNavigationController();
  v9 = -[UpNextPopoverNavigationController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v7, a4);

  return v9;
}

- (_TtC9SeymourUI33UpNextPopoverNavigationController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for UpNextPopoverNavigationController();
  return -[UpNextPopoverNavigationController initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
