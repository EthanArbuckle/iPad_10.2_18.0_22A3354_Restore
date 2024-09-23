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
    v2[0] = MEMORY[0x1E0DEA970];
    v2[1] = MEMORY[0x1E0DEA970];
    result = MEMORY[0x1C3BBFE74](MEMORY[0x1E0DEA0B8], v1, v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : String] and conformance <> [A : B]);
  }
  return result;
}

- (uint64_t)Float
{
  uint64_t result;
  uint64_t v9;
  _QWORD v10[2];

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : Float]);
    v10[0] = a2;
    v10[1] = a3;
    result = MEMORY[0x1C3BBFE74](a4, v9, v10);
    atomic_store(result, a1);
  }
  return result;
}

@end
