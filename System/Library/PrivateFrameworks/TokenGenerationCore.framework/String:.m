@implementation String:

- (void)String
{
  if (!OUTLINED_FUNCTION_119(a1))
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : String]);
    OUTLINED_FUNCTION_146();
  }
  OUTLINED_FUNCTION_73();
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
    result = MEMORY[0x2495A8E14](MEMORY[0x24BEE04E0], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : String] and conformance <> [A : B]);
  }
  return result;
}

@end
