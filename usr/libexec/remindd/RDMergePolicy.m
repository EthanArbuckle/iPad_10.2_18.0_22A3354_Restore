@implementation RDMergePolicy

+ (id)defaultMergePolicy
{
  return objc_msgSend(objc_allocWithZone((Class)a1), "initWithMergeType:", 2);
}

- (_TtC7remindd13RDMergePolicy)initWithMergeType:(unint64_t)a3
{
  return (_TtC7remindd13RDMergePolicy *)sub_1003DCFA0(a3);
}

- (BOOL)resolveConflicts:(id)a3 error:(id *)a4
{
  uint64_t v5;
  _TtC7remindd13RDMergePolicy *v6;

  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, (char *)&type metadata for Any + 8);
  v6 = self;
  sub_1003DD0C0(v5);
  swift_bridgeObjectRelease();

  return 1;
}

@end
