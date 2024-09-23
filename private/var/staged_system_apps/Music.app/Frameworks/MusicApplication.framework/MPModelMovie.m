@implementation MPModelMovie

- (NSString)musicTypeIdentifier
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (NSString)shortDescription
{
  MPModelMovie *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  Swift::String v8;
  Swift::String v9;
  NSString v10;

  v2 = self;
  v3 = -[MPModelMovie title](v2, "title", 0x22203A656D614ELL);
  if (v3)
  {
    v4 = v3;
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
    v7 = v6;

  }
  else
  {
    v7 = (void *)0xEE006569766F4D20;
    v5 = 0x64656C7469746E55;
  }
  v8._countAndFlagsBits = v5;
  v8._object = v7;
  String.append(_:)(v8);
  swift_bridgeObjectRelease(v7);
  v9._countAndFlagsBits = 34;
  v9._object = (void *)0xE100000000000000;
  String.append(_:)(v9);

  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(0xE700000000000000);
  return (NSString *)v10;
}

@end
