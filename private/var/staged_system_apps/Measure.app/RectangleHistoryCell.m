@implementation RectangleHistoryCell

- (_TtC7Measure20RectangleHistoryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  objc_class *ObjectType;
  uint64_t v8;
  uint64_t v9;
  _TtC7Measure20RectangleHistoryCell *v10;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType(self);
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v9 = v8;
    a4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = -[BaseRectangleHistoryCell initWithStyle:reuseIdentifier:](&v12, "initWithStyle:reuseIdentifier:", a3, a4);

  return v10;
}

- (_TtC7Measure20RectangleHistoryCell)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self);
  return -[BaseRectangleHistoryCell initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
