@implementation MPModelTVSeason

- (NSString)shortDescription
{
  MPModelTVSeason *v2;
  Swift::String v3;
  void *object;
  NSString v5;

  v2 = self;
  -[MPModelTVSeason number](v2, "number");
  v3._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
  object = v3._object;
  String.append(_:)(v3);

  swift_bridgeObjectRelease(object);
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(0xE100000000000000);
  return (NSString *)v5;
}

@end
