@implementation BookMessagesCell

- (_TtC5Books16BookMessagesCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  NSString v8;
  _TtC5Books16BookMessagesCell *v9;
  objc_super v11;

  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v7 = v6;
    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v8 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for BookMessagesCell();
  v9 = -[BookMessagesCell initWithStyle:reuseIdentifier:](&v11, "initWithStyle:reuseIdentifier:", a3, v8);

  return v9;
}

- (_TtC5Books16BookMessagesCell)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BookMessagesCell();
  return -[BookMessagesCell initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
