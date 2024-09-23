@implementation TextUnderstandingSupportOutput

- (NSSet)featureNames
{
  void *v2;
  id v3;
  Class isa;

  v2 = *(void **)self->provider;
  swift_retain();
  v3 = objc_msgSend(v2, sel_featureNames);
  static Set._unconditionallyBridgeFromObjectiveC(_:)();
  swift_release();

  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSSet *)isa;
}

- (id)featureValueForName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;
  v7 = *(void **)self->provider;
  swift_retain();
  v8 = (void *)MEMORY[0x24959E374](v4, v6);
  v9 = objc_msgSend(v7, sel_featureValueForName_, v8);
  swift_release();
  swift_bridgeObjectRelease();

  return v9;
}

@end
