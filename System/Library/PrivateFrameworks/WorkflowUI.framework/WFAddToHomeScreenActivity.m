@implementation WFAddToHomeScreenActivity

- (WFAddToHomeScreenActivity)initWithReference:(id)a3
{
  return (WFAddToHomeScreenActivity *)AddToHomeScreenActivity.init(reference:)((uint64_t)a3);
}

- (NSString)activityType
{
  return (NSString *)(id)AddToHomeScreenActivity.activityType.getter();
}

- (NSString)activityTitle
{
  WFAddToHomeScreenActivity *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  AddToHomeScreenActivity.activityTitle.getter();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_220306FFC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (id)_systemImageName
{
  void *v2;

  v2 = (void *)sub_220306FFC();
  swift_bridgeObjectRelease();
  return v2;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  sub_220307164();
  swift_bridgeObjectRelease();
  return 1;
}

- (void)prepareWithActivityItems:(id)a3
{
  sub_220307164();
  swift_bridgeObjectRelease();
}

- (UIViewController)activityViewController
{
  WFAddToHomeScreenActivity *v2;
  id v3;

  v2 = self;
  v3 = AddToHomeScreenActivity.activityViewController.getter();

  return (UIViewController *)v3;
}

- (void)activityDidFinish:(BOOL)a3
{
  WFAddToHomeScreenActivity *v3;

  v3 = self;
  AddToHomeScreenActivity.activityDidFinish(_:)(0);

}

- (WFAddToHomeScreenActivity)init
{
  AddToHomeScreenActivity.init()();
}

- (void).cxx_destruct
{

}

@end
