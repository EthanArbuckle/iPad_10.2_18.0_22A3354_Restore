@implementation TraitNavigationController

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  -[TraitNavigationController pushViewController:overrideTraitCollection:animated:](self, "pushViewController:overrideTraitCollection:animated:", a3, 0, a4);
}

- (void)pushViewController:(id)a3 overrideTraitCollection:(id)a4 animated:(BOOL)a5
{
  id v8;
  id v9;
  _TtC16MusicApplication25TraitNavigationController *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_8151E4(v8, a4, a5);

}

- (void)presentViewControllerIfNeeded:(id)a3 overrideTraitCollection:(id)a4 animated:(BOOL)a5
{
  id v8;
  id v9;
  _TtC16MusicApplication25TraitNavigationController *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_8154F4(v8, (uint64_t)a4, a5);

}

- (id)_traitCollectionForChildEnvironment:(id)a3
{
  _TtC16MusicApplication25TraitNavigationController *v5;
  id v6;

  swift_unknownObjectRetain(a3);
  v5 = self;
  v6 = sub_815C74((uint64_t)a3);
  swift_unknownObjectRelease(a3);

  return v6;
}

- (void)removeChildViewController:(id)a3 notifyDidMove:(BOOL)a4
{
  id v6;
  _TtC16MusicApplication25TraitNavigationController *v7;

  v6 = a3;
  v7 = self;
  sub_815EC8(v6, a4);

}

- (_TtC16MusicApplication25TraitNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TraitNavigationController();
  return -[TraitNavigationController initWithNavigationBarClass:toolbarClass:](&v7, "initWithNavigationBarClass:toolbarClass:", a3, a4);
}

- (_TtC16MusicApplication25TraitNavigationController)initWithRootViewController:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TraitNavigationController();
  return -[TraitNavigationController initWithRootViewController:](&v5, "initWithRootViewController:", a3);
}

- (_TtC16MusicApplication25TraitNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  NSString v7;
  id v8;
  _TtC16MusicApplication25TraitNavigationController *v9;
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

- (_TtC16MusicApplication25TraitNavigationController)initWithCoder:(id)a3
{
  id v4;
  _TtC16MusicApplication25TraitNavigationController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TraitNavigationController();
  v4 = a3;
  v5 = -[TraitNavigationController initWithCoder:](&v7, "initWithCoder:", v4);

  return v5;
}

@end
