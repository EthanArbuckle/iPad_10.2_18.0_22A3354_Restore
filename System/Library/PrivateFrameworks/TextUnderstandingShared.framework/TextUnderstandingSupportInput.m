@implementation TextUnderstandingSupportInput

- (NSSet)featureNames
{
  Class isa;

  specialized Set.init(_nonEmptyArrayLiteral:)((uint64_t)&outlined read-only object #0 of @objc TextUnderstandingSupportInput.featureNames.getter);
  swift_arrayDestroy();
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSSet *)isa;
}

- (id)featureValueForName:(id)a3
{
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  if (static String._unconditionallyBridgeFromObjectiveC(_:)() == 1954047348 && v4 == 0xE400000000000000
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    v5 = (uint64_t (*)(uint64_t))*((_QWORD *)self->super.isa + 11);
    v6 = swift_retain();
    v7 = v5(v6);
    v8 = (void *)MEMORY[0x24959E374](v7);
    swift_bridgeObjectRelease();
    v9 = objc_msgSend((id)objc_opt_self(), sel_featureValueWithString_, v8);
    swift_release();
    swift_bridgeObjectRelease();

  }
  else
  {
    swift_bridgeObjectRelease();
    v9 = 0;
  }
  return v9;
}

@end
