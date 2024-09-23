@implementation MiniPlayerViewController

- (_TtC5Music24MiniPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  NSString v7;
  id v8;
  _TtC5Music24MiniPlayerViewController *v9;
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
  v11.super_class = (Class)type metadata accessor for MiniPlayerViewController();
  v9 = -[MiniPlayerViewController initWithNibName:bundle:](&v11, "initWithNibName:bundle:", v7, a4);

  return v9;
}

- (_TtC5Music24MiniPlayerViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MiniPlayerViewController();
  return -[MiniPlayerViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
