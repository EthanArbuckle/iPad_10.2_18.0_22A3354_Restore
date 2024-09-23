@implementation NSUserDefaults

- (NSArray)libraryMenuOrderedIdentifiers
{
  NSUserDefaults *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  Class isa;

  v2 = self;
  v3 = NSUserDefaults.libraryMenuRevision.getter();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  swift_bridgeObjectRetain();
  v10 = sub_511D94(v7);

  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease_n(v7, 2);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v10);
  return (NSArray *)isa;
}

- (NSSet)libraryMenuSelectedIdentifiers
{
  NSUserDefaults *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  Class isa;

  v2 = self;
  v3 = NSUserDefaults.libraryMenuRevision.getter();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  swift_bridgeObjectRetain();
  v10 = sub_511FE8(v9);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease_n(v9, 2);
  v11 = sub_5134E0((uint64_t)v10);

  swift_bridgeObjectRelease(v10);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v11);
  return (NSSet *)isa;
}

@end
