@implementation RootHostingControllerNavigationItem

- (BOOL)leftItemsSupplementBackButton
{
  return 0;
}

- (_TtC11BookStoreUIP33_33EEA6210FEC2640A5148301F86EE4A335RootHostingControllerNavigationItem)initWithTitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  NSString v6;
  _TtC11BookStoreUIP33_33EEA6210FEC2640A5148301F86EE4A335RootHostingControllerNavigationItem *v7;
  objc_super v9;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for RootHostingControllerNavigationItem();
  v7 = -[RootHostingControllerNavigationItem initWithTitle:](&v9, "initWithTitle:", v6);

  return v7;
}

- (_TtC11BookStoreUIP33_33EEA6210FEC2640A5148301F86EE4A335RootHostingControllerNavigationItem)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RootHostingControllerNavigationItem();
  return -[RootHostingControllerNavigationItem initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
