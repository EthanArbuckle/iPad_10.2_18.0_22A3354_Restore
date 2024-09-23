@implementation NSUserDefaults

- (NSArray)libraryMenuOrderedIdentifiers
{
  NSUserDefaults *v2;
  uint64_t v3;
  uint64_t v4;
  Class isa;

  v2 = self;
  NSUserDefaults.libraryMenuRevision.getter();
  v4 = v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10069F7B8(v4);

  swift_bridgeObjectRelease();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (NSSet)libraryMenuSelectedIdentifiers
{
  NSUserDefaults *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  Class isa;

  v2 = self;
  NSUserDefaults.libraryMenuRevision.getter();
  v4 = v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v5 = sub_10069FA0C(v4);
  swift_bridgeObjectRelease();
  sub_1006A14E8((uint64_t)v5);

  swift_bridgeObjectRelease();
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSSet *)isa;
}

@end
