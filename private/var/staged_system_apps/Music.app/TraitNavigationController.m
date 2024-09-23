@implementation TraitNavigationController

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  _TtC5Music25TraitNavigationController *v12;
  uint64_t v13;

  v4 = a4;
  v7 = sub_100007E8C(&qword_1011ACE00);
  __chkstk_darwin(v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for UITraitOverrides(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v11 = a3;
  v12 = self;
  sub_1008EB784(v11, (uint64_t)v9, v4);
  sub_10004FF60((uint64_t)v9, &qword_1011ACE00);

}

- (id)_traitCollectionForChildEnvironment:(id)a3
{
  _TtC5Music25TraitNavigationController *v5;
  id v6;

  swift_unknownObjectRetain(a3, a2);
  v5 = self;
  v6 = sub_1008EC160((uint64_t)a3);
  swift_unknownObjectRelease(a3);

  return v6;
}

- (void)removeChildViewController:(id)a3 notifyDidMove:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _TtC5Music25TraitNavigationController *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super *v12;
  _TtC5Music25TraitNavigationController *v13;
  _TtC5Music25TraitNavigationController *v14;

  v4 = a4;
  v6 = a3;
  v7 = self;
  v8 = -[TraitNavigationController viewControllers](v7, "viewControllers");
  v9 = sub_10004A07C(0, (unint64_t *)&qword_10119D470, UIViewController_ptr);
  v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v8, v9);

  LOBYTE(v8) = sub_100413F34((uint64_t)v6, v10);
  swift_bridgeObjectRelease();
  v11 = type metadata accessor for TraitNavigationController();
  if ((v8 & 1) != 0)
  {
    v13 = v7;
    v12 = (objc_super *)&v13;
  }
  else
  {
    v14 = v7;
    v12 = (objc_super *)&v14;
  }
  v12->super_class = (Class)v11;
  -[objc_super removeChildViewController:notifyDidMove:](v12, "removeChildViewController:notifyDidMove:", v6, v4, v13);

}

- (_TtC5Music25TraitNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TraitNavigationController();
  return -[TraitNavigationController initWithNavigationBarClass:toolbarClass:](&v7, "initWithNavigationBarClass:toolbarClass:", a3, a4);
}

- (_TtC5Music25TraitNavigationController)initWithRootViewController:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TraitNavigationController();
  return -[TraitNavigationController initWithRootViewController:](&v5, "initWithRootViewController:", a3);
}

- (_TtC5Music25TraitNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  NSString v7;
  id v8;
  _TtC5Music25TraitNavigationController *v9;
  objc_super v11;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v6 = a4;
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for TraitNavigationController();
  v9 = -[TraitNavigationController initWithNibName:bundle:](&v11, "initWithNibName:bundle:", v7, a4);

  return v9;
}

- (_TtC5Music25TraitNavigationController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TraitNavigationController();
  return -[TraitNavigationController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
