@implementation NearbyTeachableMomentContaineeViewController

+ (BOOL)shouldShowBasedOnTimesNearbyCardDisplayed
{
  return sub_1000B6314();
}

+ (BOOL)hasShownTeachableMoment
{
  id v2;
  NSString v3;
  unsigned __int8 v4;

  v2 = objc_msgSend((id)objc_opt_self(NSUserDefaults), "standardUserDefaults");
  v3 = String._bridgeToObjectiveC()();
  v4 = objc_msgSend(v2, "BOOLForKey:", v3);

  return v4;
}

- (_TtC4Maps44NearbyTeachableMomentContaineeViewController)init
{
  return (_TtC4Maps44NearbyTeachableMomentContaineeViewController *)sub_1000B5DC8();
}

- (_TtC4Maps44NearbyTeachableMomentContaineeViewController)initWithTeachableMomentConfiguration:(id)a3
{
  id v3;
  _TtC4Maps44NearbyTeachableMomentContaineeViewController *result;

  v3 = a3;
  result = (_TtC4Maps44NearbyTeachableMomentContaineeViewController *)_swift_stdlib_reportUnimplementedInitializer("Maps.NearbyTeachableMomentContaineeViewController", 49, "init(teachableMomentConfiguration:)", 35, 0);
  __break(1u);
  return result;
}

+ (void)hasDisplayedNearbyCard
{
  void *v0;
  id v1;
  NSString v2;
  uint64_t v3;
  id v4;
  id v5;

  v0 = (void *)objc_opt_self(NSUserDefaults);
  v1 = objc_msgSend(v0, "standardUserDefaults");
  v2 = String._bridgeToObjectiveC()();
  v3 = (uint64_t)objc_msgSend(v1, "integerForKey:", v2);

  if (v3 <= 3)
  {
    v4 = objc_msgSend(v0, "standardUserDefaults");
    v5 = String._bridgeToObjectiveC()();
    objc_msgSend(v4, "setInteger:forKey:", v3 + 1, v5);

  }
}

@end
