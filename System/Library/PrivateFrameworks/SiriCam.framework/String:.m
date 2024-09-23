@implementation String:

- (uint64_t)Int
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (autoSendInput: AutoSendInput, crrSignals: [String : Int]));
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

- (uint64_t)MLFeatureValue
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (UUID, [String : MLFeatureValue]));
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

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
    result = MEMORY[0x1C3BCB3E4](MEMORY[0x1E0DEA0B8], v1, v3);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : AnyEncodable] and conformance <> [A : B]);
  }
  return result;
}

- (void)MLFeatureValue
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_49_0(a1, a2, a3);
  OUTLINED_FUNCTION_14_6(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_1_5();
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
    v2[0] = MEMORY[0x1E0DEA970];
    v2[1] = MEMORY[0x1E0DEA970];
    result = MEMORY[0x1C3BCB3E4](MEMORY[0x1E0DEA0B8], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : String] and conformance <> [A : B]);
  }
  return result;
}

- (unint64_t)MLFeatureValue
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = lazy protocol witness table cache variable for type [String : MLFeatureValue] and conformance <> [A : B];
  if (!lazy protocol witness table cache variable for type [String : MLFeatureValue] and conformance <> [A : B])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : MLFeatureValue]);
    v2 = lazy protocol witness table accessor for type MLFeatureValue and conformance MLFeatureValue();
    v3[0] = MEMORY[0x1E0DEA970];
    v3[1] = v2;
    result = MEMORY[0x1C3BCB3E4](MEMORY[0x1E0DEA0B8], v1, v3);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : MLFeatureValue] and conformance <> [A : B]);
  }
  return result;
}

@end
