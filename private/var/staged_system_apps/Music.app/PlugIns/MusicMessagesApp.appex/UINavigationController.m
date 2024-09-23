@implementation UINavigationController

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
