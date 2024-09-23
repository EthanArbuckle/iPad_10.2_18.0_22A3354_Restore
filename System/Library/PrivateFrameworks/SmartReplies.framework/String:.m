@implementation String:

- (uint64_t)Double
{
  return swift_release();
}

- (unint64_t)String
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type [String : String] and conformance <> [A : B];
  if (!lazy protocol witness table cache variable for type [String : String] and conformance <> [A : B])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : String]);
    v2[0] = MEMORY[0x24BEE0D38];
    v2[1] = MEMORY[0x24BEE0D38];
    result = MEMORY[0x24957EC18](MEMORY[0x24BEE04E0], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : String] and conformance <> [A : B]);
  }
  return result;
}

- (Class)NSObject
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  NSDictionary v4;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v3 = v1(v2);
  swift_release();
  if (v3)
  {
    type metadata accessor for NSObject();
    v4.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }
  return v4.super.isa;
}

@end
