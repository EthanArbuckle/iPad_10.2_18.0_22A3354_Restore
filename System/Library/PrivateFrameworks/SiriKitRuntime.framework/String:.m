@implementation String:

- (unint64_t)AnyEncodable
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = lazy protocol witness table cache variable for type [String : AnyEncodable] and conformance <> [A : B];
  if (!lazy protocol witness table cache variable for type [String : AnyEncodable] and conformance <> [A : B])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : AnyEncodable]);
    v2 = lazy protocol witness table accessor for type AnyEncodable and conformance AnyEncodable();
    v3[0] = MEMORY[0x1E0DEA970];
    v3[1] = v2;
    result = MEMORY[0x1B5E44668](MEMORY[0x1E0DEA0B8], v1, v3);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : AnyEncodable] and conformance <> [A : B]);
  }
  return result;
}

- (unint64_t)Bool
{
  unint64_t result;

  result = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x1E0DEE9D8]);
  *a1 = result;
  return result;
}

- (uint64_t)NSNumber
{
  uint64_t v3;
  _QWORD *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Error);
    swift_allocError();
    *v5 = a3;
    v6 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    type metadata accessor for NSNumber();
    **(_QWORD **)(*(_QWORD *)(v3 + 64) + 40) = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
    return swift_continuation_throwingResume();
  }
}

- (unint64_t)String
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = lazy protocol witness table cache variable for type [String : String] and conformance <> [A : B];
  if (!lazy protocol witness table cache variable for type [String : String] and conformance <> [A : B])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&demangling cache variable for type metadata for [String : String]);
    v2[0] = MEMORY[0x1E0DEA9A0];
    v2[1] = MEMORY[0x1E0DEA9A0];
    result = MEMORY[0x1B5E44668](MEMORY[0x1E0DEA0D8], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : String] and conformance <> [A : B]);
  }
  return result;
}

- (uint64_t)Set<String>
{
  swift_bridgeObjectRelease();
  return a1;
}

- (uint64_t)SAPerson
{
  uint64_t v3;
  _QWORD *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Error);
    swift_allocError();
    *v5 = a3;
    v6 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    type metadata accessor for OS_dispatch_queue(0, &lazy cache variable for type metadata for SAPerson);
    **(_QWORD **)(*(_QWORD *)(v3 + 64) + 40) = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
    return swift_continuation_throwingResume();
  }
}

@end
