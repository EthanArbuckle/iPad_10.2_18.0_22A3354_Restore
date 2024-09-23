@implementation CarPlayListenNowData

- (NSString)description
{
  _TtC5Books20CarPlayListenNowData *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_10023E1AC();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (_TtC5Books20CarPlayListenNowData)init
{
  _TtC5Books20CarPlayListenNowData *result;

  result = (_TtC5Books20CarPlayListenNowData *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000022, 0x80000001007B4470, "Books/CarPlayListenNowData.swift", 32, 2, 24, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(_QWORD *)&self->updatedReadingProgress[OBJC_IVAR____TtC5Books20CarPlayListenNowData_assetID]);
}

@end
