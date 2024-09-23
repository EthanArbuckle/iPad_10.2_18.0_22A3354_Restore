@implementation RootTabBarControllerDelegate

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  id v6;
  id v7;
  _TtC23ShelfKitCollectionViews28RootTabBarControllerDelegate *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_297A38(v7);

  return v9 & 1;
}

- (_TtC23ShelfKitCollectionViews28RootTabBarControllerDelegate)init
{
  _TtC23ShelfKitCollectionViews28RootTabBarControllerDelegate *result;

  result = (_TtC23ShelfKitCollectionViews28RootTabBarControllerDelegate *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.RootTabBarControllerDelegate", 52, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews28RootTabBarControllerDelegate_objectGraph));
}

@end
