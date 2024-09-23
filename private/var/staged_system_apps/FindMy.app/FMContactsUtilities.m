@implementation FMContactsUtilities

+ (id)contactFor:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  id v7;
  int v8;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  swift_getObjCClassMetadata(a1);
  v7 = sub_1003BF184(v4, v6, 0, 0, 0, 0, 0);
  LODWORD(v4) = v8;
  swift_bridgeObjectRelease(v6);
  if ((v4 & 0x10000) != 0)
  {

    v7 = 0;
  }
  return v7;
}

- (_TtC6FindMy19FMContactsUtilities)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMContactsUtilities();
  return -[FMContactsUtilities init](&v3, "init");
}

@end
