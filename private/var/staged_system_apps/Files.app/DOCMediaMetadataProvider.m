@implementation DOCMediaMetadataProvider

- (NSDictionary)metadataValues
{
  uint64_t v3;
  Class isa;

  swift_retain();
  v3 = sub_100349140();
  swift_release(self);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSDictionary *)isa;
}

- (NSArray)displaySortOrder
{
  uint64_t v2;
  uint64_t v3;
  Class isa;

  sub_10034DE48();
  v3 = v2;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

@end
