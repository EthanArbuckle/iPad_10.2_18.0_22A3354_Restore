@implementation String:

- (uint64_t)Data
{
  uint64_t result;
  uint64_t v9;
  _QWORD v10[2];

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : Data]);
    v10[0] = a3;
    v10[1] = a2();
    result = MEMORY[0x249552EA8](a4, v9, v10);
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

  if (!OUTLINED_FUNCTION_74(a1))
  {
    v4 = v3;
    v5 = v2;
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : String]);
    v7[0] = v5;
    v7[1] = v5;
    atomic_store(MEMORY[0x249552EA8](v4, v6, v7), v1);
  }
  OUTLINED_FUNCTION_64_0();
}

@end
