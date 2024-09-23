@implementation TPSSplitViewController

- (UIViewController)childViewControllerForStatusBarStyle
{
  _TtC4Tips22TPSSplitViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_10000B788();
  v4 = v3;

  return (UIViewController *)v4;
}

- (_TtC4Tips22TPSSplitViewController)initWithStyle:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TPSSplitViewController();
  return -[TPSSplitViewController initWithStyle:](&v5, "initWithStyle:", a3);
}

- (_TtC4Tips22TPSSplitViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TPSSplitViewController();
  return -[TPSSplitViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

- (_TtC4Tips22TPSSplitViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  _TtC4Tips22TPSSplitViewController *v11;
  objc_super v13;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    v8 = a4;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v10 = a4;
    v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for TPSSplitViewController();
  v11 = -[TPSSplitViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

@end
