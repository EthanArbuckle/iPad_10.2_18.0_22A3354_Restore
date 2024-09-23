@implementation IndexingSpeedViewFactory

+ (id)createWithData:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v7;
  id v9;

  swift_getObjCClassMetadata(a1);
  v3 = a3;
  v4 = sub_10003A0C8(&qword_1005A5730);
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v4);
  swift_getObjCClassMetadata(a1);
  v9 = (id)sub_1002552B4(v7);
  swift_bridgeObjectRelease(v7);

  return v9;
}

- (_TtC10MobileMail24IndexingSpeedViewFactory)init
{
  return (_TtC10MobileMail24IndexingSpeedViewFactory *)sub_100256B24();
}

@end
