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
    result = MEMORY[0x1C3BCEDD8](a4, v9, v10);
    atomic_store(result, a1);
  }
  return result;
}

- (void)String
{
  if (!*a1)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : String]);
    OUTLINED_FUNCTION_72_0();
  }
  OUTLINED_FUNCTION_7_1();
}

@end
