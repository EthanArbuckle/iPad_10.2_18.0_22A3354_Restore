@implementation UINavigationController

- (BOOL)navigateTo:(id)a3 from:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  UINavigationController *v9;
  UINavigationController *v10;
  NSArray *v11;
  unint64_t v12;
  uint64_t v13;
  char v14;
  double v15;
  NSArray *v16;

  v5 = a5;
  v8 = a3;
  v9 = (UINavigationController *)a4;
  v10 = self;
  v11 = -[UINavigationController viewControllers](v10, "viewControllers");
  v12 = sub_14C0C0();
  v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v11, v12);
  v14 = sub_68B468((uint64_t)v8, v13);

  *(_QWORD *)&v15 = swift_bridgeObjectRelease(v13).n128_u64[0];
  if ((v14 & 1) != 0)
  {
    v16 = -[UINavigationController popToViewController:animated:](v10, "popToViewController:animated:", v8, v5, v15);

    v9 = v10;
    v10 = (UINavigationController *)v16;
  }
  else
  {
    -[UINavigationController showViewController:sender:](v10, "showViewController:sender:", v8, v9, v15);
  }

  return 1;
}

- (id)drop:(id)a3 animated:(BOOL)a4
{
  id v5;
  UINavigationController *v6;
  void *v7;

  v5 = a3;
  v6 = self;
  v7 = sub_39B8C0(v5);

  return v7;
}

- (void)pushViewController:(id)a3 overrideTraitCollection:(id)a4 animated:(BOOL)a5
{
  -[UINavigationController pushViewController:animated:](self, "pushViewController:animated:", a3, a5);
}

- (void)presentViewControllerIfNeeded:(id)a3 overrideTraitCollection:(id)a4 animated:(BOOL)a5
{
  -[UINavigationController pushViewController:overrideTraitCollection:animated:](self, "pushViewController:overrideTraitCollection:animated:", a3, a4, a5);
}

- (id)playActivityFeatureNamesWithSourceChildViewController:(id)a3
{
  id v5;
  UINavigationController *v6;
  Class isa;

  v5 = a3;
  v6 = self;
  UINavigationController.playActivityFeatureNames(sourceChildViewController:)(a3);

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (id)removeViewController:(id)a3 animated:(BOOL)a4
{
  id v6;
  UINavigationController *v7;
  void *v8;

  v6 = a3;
  v7 = self;
  v8 = (void *)UINavigationController.removeViewController(_:animated:)((UIViewController)v6, a4);

  return v8;
}

@end
