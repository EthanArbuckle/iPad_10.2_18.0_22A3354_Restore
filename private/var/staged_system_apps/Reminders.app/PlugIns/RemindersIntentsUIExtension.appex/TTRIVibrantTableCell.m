@implementation TTRIVibrantTableCell

- (void)layoutSubviews
{
  _TtC27RemindersIntentsUIExtension20TTRIVibrantTableCell *v2;

  v2 = self;
  sub_100014920();

}

- (_TtC27RemindersIntentsUIExtension20TTRIVibrantTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  NSString v8;
  _TtC27RemindersIntentsUIExtension20TTRIVibrantTableCell *v9;
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
  v11.super_class = (Class)type metadata accessor for TTRIVibrantTableCell();
  v9 = -[TTRIVibrantTableCell initWithStyle:reuseIdentifier:](&v11, "initWithStyle:reuseIdentifier:", a3, v8);

  return v9;
}

- (_TtC27RemindersIntentsUIExtension20TTRIVibrantTableCell)initWithCoder:(id)a3
{
  uint64_t v3;

  return (_TtC27RemindersIntentsUIExtension20TTRIVibrantTableCell *)sub_100014B38(self, (uint64_t)a2, (uint64_t)a3, v3, (uint64_t (*)(uint64_t))type metadata accessor for TTRIVibrantTableCell);
}

@end
