@implementation FMCoreBridge

+ (id)displayNameFor:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;

  type metadata accessor for FMFCoreHelper(0, a2);
  v4 = a3;
  static FMFCoreHelper.displayName(for:)();
  v6 = v5;

  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  return v7;
}

- (_TtC6FindMy12FMCoreBridge)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMCoreBridge();
  return -[FMCoreBridge init](&v3, "init");
}

@end
