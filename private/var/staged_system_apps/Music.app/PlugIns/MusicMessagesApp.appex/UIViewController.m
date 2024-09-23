@implementation UIViewController

- (UIViewController)playActivityFeatureNameSourceViewController
{
  UIViewController *v2;
  id v3;

  v2 = self;
  v3 = UIViewController.playActivityFeatureNameSourceViewController.getter();

  return (UIViewController *)v3;
}

- (void)setPlayActivityFeatureNameSourceViewController:(id)a3
{
  id v5;
  UIViewController *v6;

  v5 = a3;
  v6 = self;
  UIViewController.playActivityFeatureNameSourceViewController.setter(a3);

}

- (NSData)playActivityRecommendationData
{
  return (NSData *)0;
}

- (NSString)playActivityFeatureName
{
  UIViewController *v2;
  NSString v3;

  v2 = self;
  UIViewController.playActivityFeatureName.getter();

  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setPlayActivityFeatureName:(id)a3
{
  uint64_t v4;
  UIViewController *v5;
  const void *v6;
  id value;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v4 = qword_1004B8C30;
  v5 = self;
  if (v4 != -1)
    swift_once(&qword_1004B8C30, sub_1001102B0);
  v6 = (const void *)qword_1004BE010;
  value = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  objc_setAssociatedObject(v5, v6, value, (void *)3);

}

- (id)playActivityFeatureNamesWithSourceChildViewController:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  UIViewController *v8;
  NSString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  Class isa;

  v5 = sub_1000057B4((uint64_t *)&unk_1004BDBA0);
  v6 = swift_allocObject(v5, 48, 7);
  *(_OWORD *)(v6 + 16) = xmmword_1003C64D0;
  v7 = a3;
  v8 = self;
  v9 = -[UIViewController playActivityFeatureName](v8, "playActivityFeatureName");
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
  v12 = v11;

  *(_QWORD *)(v6 + 32) = v10;
  *(_QWORD *)(v6 + 40) = v12;

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (NSArray)completePlayActivityFeatureNames
{
  UIViewController *v2;
  Class isa;

  v2 = self;
  UIViewController.completePlayActivityFeatureNames.getter();

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (NSString)combinedPlayActivityFeatureName
{
  UIViewController *v2;
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  NSString v6;

  v2 = self;
  v3 = -[UIViewController completePlayActivityFeatureNames](v2, "completePlayActivityFeatureNames");
  static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, &type metadata for String);

  v4 = sub_1000057B4(&qword_1004BA5F8);
  v5 = sub_10004FFFC((unint64_t *)&qword_1004BDD10, &qword_1004BA5F8, (uint64_t)&protocol conformance descriptor for [A]);
  BidirectionalCollection<>.joined(separator:)(2109216, 0xE300000000000000, v4, v5);

  swift_bridgeObjectRelease();
  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (BOOL)canPresentViewControllers
{
  UIViewController *v2;
  UIPopoverPresentationController *v3;

  v2 = self;
  v3 = -[UIViewController popoverPresentationController](v2, "popoverPresentationController");

  if (v3)
  return v3 == 0;
}

@end
