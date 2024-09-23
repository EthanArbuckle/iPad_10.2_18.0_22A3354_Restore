@implementation String

- (unint64_t):
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = lazy protocol witness table cache variable for type [String : [String : String]] and conformance <> [A : B];
  if (!lazy protocol witness table cache variable for type [String : [String : String]] and conformance <> [A : B])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : [String : String]]);
    v2 = lazy protocol witness table accessor for type [String : String] and conformance <> [A : B]();
    v3[0] = MEMORY[0x24BEE0D38];
    v3[1] = v2;
    result = MEMORY[0x24957EC18](MEMORY[0x24BEE04E0], v1, v3);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : [String : String]] and conformance <> [A : B]);
  }
  return result;
}

- (uint64_t):(uint64_t)result
{
  if (result != 1)
    return swift_bridgeObjectRelease();
  return result;
}

- (uint64_t):(uint64_t *)(a3
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[2];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7 = a3();
    v8[0] = MEMORY[0x24BEE0D38];
    v8[1] = v7;
    result = MEMORY[0x24957EC18](MEMORY[0x24BEE04E0], v6, v8);
    atomic_store(result, a1);
  }
  return result;
}

- (uint64_t):()block
{
  uint64_t v3;
  _QWORD *v5;
  id v6;
  uint64_t v8;
  uint64_t v9;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    swift_allocError();
    *v5 = a3;
    v6 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    if (a2)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [SRSmartRepliesPredictionItem]);
      v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
    }
    else
    {
      v8 = 0;
    }
    v9 = v8;
    outlined init with take of [String : [SRSmartRepliesPredictionItem]]?((uint64_t)&v9, *(_QWORD *)(*(_QWORD *)(v3 + 64) + 40));
    return swift_continuation_throwingResume();
  }
}

- (uint64_t):(uint64_t)a1
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : [SRSmartRepliesPredictionItem]]?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

@end
