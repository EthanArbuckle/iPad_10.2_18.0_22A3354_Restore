@implementation String:

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
    result = MEMORY[0x2495AAEA0](MEMORY[0x24BEE04E0], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : String] and conformance <> [A : B]);
  }
  return result;
}

- (uint64_t)MetadataSpecialToken
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
    result = MEMORY[0x2495AAEA0](MEMORY[0x24BEE04E0], v6, v8);
    atomic_store(result, a1);
  }
  return result;
}

- (void)String
{
  unint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[2];

  if (!OUTLINED_FUNCTION_90_2(a1))
  {
    v4 = v3;
    v5 = v2;
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : String]);
    v7[0] = v5;
    v7[1] = v5;
    atomic_store(MEMORY[0x2495AAEA0](v4, v6, v7), v1);
  }
  OUTLINED_FUNCTION_25();
}

@end
