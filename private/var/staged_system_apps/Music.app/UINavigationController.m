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
  double v14;
  NSArray *v15;

  v5 = a5;
  v8 = a3;
  v9 = (UINavigationController *)a4;
  v10 = self;
  v11 = -[UINavigationController viewControllers](v10, "viewControllers");
  v12 = sub_1000E5638();
  v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v11, v12);

  LOBYTE(v11) = sub_100413F34((uint64_t)v8, v13);
  *(_QWORD *)&v14 = swift_bridgeObjectRelease(v13).n128_u64[0];
  if ((v11 & 1) != 0)
  {
    v15 = -[UINavigationController popToViewController:animated:](v10, "popToViewController:animated:", v8, v5, v14);

    v9 = v10;
    v10 = (UINavigationController *)v15;
  }
  else
  {
    -[UINavigationController showViewController:sender:](v10, "showViewController:sender:", v8, v9, v14);
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
  v7 = sub_1000E5674(v5);

  return v7;
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
