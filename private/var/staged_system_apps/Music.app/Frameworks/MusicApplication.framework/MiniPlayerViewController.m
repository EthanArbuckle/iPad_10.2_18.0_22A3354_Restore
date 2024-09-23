@implementation MiniPlayerViewController

- (_TtC16MusicApplication24MiniPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  _TtC16MusicApplication24MiniPlayerViewController *v11;
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
  v13.super_class = (Class)type metadata accessor for MiniPlayerViewController();
  v11 = -[MiniPlayerViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (_TtC16MusicApplication24MiniPlayerViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC16MusicApplication24MiniPlayerViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MiniPlayerViewController();
  v4 = a3;
  v5 = -[MiniPlayerViewController initWithCoder:](&v7, "initWithCoder:", v4);

  return v5;
}

@end
