@implementation UIViewController

- (void)_music_setParentTraitEnvironmentOverride:(id)a3
{
  id v4;
  _QWORD *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  if (_music_setParentTraitEnvironmentOverride__onceToken != -1)
    dispatch_once(&_music_setParentTraitEnvironmentOverride__onceToken, &__block_literal_global_3);
  objc_initWeak(&location, v4);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __98__UIViewController_MusicParentTraitEnvironmentOverride___music_setParentTraitEnvironmentOverride___block_invoke_3;
  v6[3] = &unk_13392A0;
  objc_copyWeak(&v7, &location);
  v5 = objc_retainBlock(v6);
  objc_setAssociatedObject(self, "_music_parentTraitEnvironmentOverride", v5, (char *)&dword_0 + 3);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __98__UIViewController_MusicParentTraitEnvironmentOverride___music_setParentTraitEnvironmentOverride___block_invoke(id a1)
{
  objc_class *v1;
  objc_method *InstanceMethod;
  _QWORD *v3;
  void (*v4)(void);
  objc_class *v5;
  const char *TypeEncoding;
  _QWORD v7[6];

  v1 = (objc_class *)objc_opt_class(UIViewController);
  InstanceMethod = class_getInstanceMethod(v1, "_parentTraitEnvironment");
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __98__UIViewController_MusicParentTraitEnvironmentOverride___music_setParentTraitEnvironmentOverride___block_invoke_2;
  v7[3] = &__block_descriptor_48_e26__16__0__UIViewController_8l;
  v7[4] = method_getImplementation(InstanceMethod);
  v7[5] = "_parentTraitEnvironment";
  v3 = objc_retainBlock(v7);
  v4 = imp_implementationWithBlock(v3);

  v5 = (objc_class *)objc_opt_class(UIViewController);
  TypeEncoding = method_getTypeEncoding(InstanceMethod);
  class_replaceMethod(v5, "_parentTraitEnvironment", v4, TypeEncoding);
}

id __98__UIViewController_MusicParentTraitEnvironmentOverride___music_setParentTraitEnvironmentOverride___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id AssociatedObject;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  AssociatedObject = objc_getAssociatedObject(v3, "_music_parentTraitEnvironmentOverride");
  v5 = objc_claimAutoreleasedReturnValue(AssociatedObject);
  v6 = (void *)v5;
  if (!v5
    || (v7 = (*(uint64_t (**)(uint64_t))(v5 + 16))(v5),
        (v8 = (void *)objc_claimAutoreleasedReturnValue(v7)) == 0))
  {
    v9 = (*(uint64_t (**)(id, _QWORD))(a1 + 32))(v3, *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return v8;
}

id __98__UIViewController_MusicParentTraitEnvironmentOverride___music_setParentTraitEnvironmentOverride___block_invoke_3(uint64_t a1)
{
  return objc_loadWeakRetained((id *)(a1 + 32));
}

- (NSString)musicTabIdentifier
{
  id AssociatedObject;
  void *v3;
  id v4;

  AssociatedObject = objc_getAssociatedObject(self, "_MusicTabIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (_NSIsNSString(v3) && objc_msgSend(v3, "length"))
    v4 = objc_msgSend(v3, "copy");
  else
    v4 = 0;

  return (NSString *)v4;
}

- (void)setMusicTabIdentifier:(id)a3
{
  objc_setAssociatedObject(self, "_MusicTabIdentifier", a3, &stru_2E8.segname[11]);
}

- (UIColor)viewBackgroundColor
{
  UIViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_1E1FF8();

  return (UIColor *)v3;
}

- (void)setViewBackgroundColor:(id)a3
{
  id v4;
  UIViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1E213C(v4);

}

- (void)indexKeyCommandHandler:(id)a3
{
  id v4;
  UIViewController *v5;

  v4 = a3;
  v5 = self;
  sub_80DF88(v4);

}

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
  v4 = qword_14F9EA0;
  v5 = self;
  if (v4 != -1)
    swift_once(&qword_14F9EA0, sub_C7B8B4);
  v6 = (const void *)qword_14FF280;
  value = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  objc_setAssociatedObject(v5, v6, value, (char *)&dword_0 + 3);

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

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14FEE10);
  v6 = swift_allocObject(v5, 48, 7);
  *(_OWORD *)(v6 + 16) = xmmword_105B360;
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

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_14FB868);
  v5 = sub_5C150((unint64_t *)&qword_14FEF80, &qword_14FB868, (uint64_t)&protocol conformance descriptor for [A]);
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
