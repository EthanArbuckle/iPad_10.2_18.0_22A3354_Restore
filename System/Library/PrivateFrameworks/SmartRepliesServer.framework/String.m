@implementation String

- (uint64_t):(uint64_t *)a3
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
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
    result = MEMORY[0x24957F5C4](MEMORY[0x24BEE04E0], v6, v8);
    atomic_store(result, a1);
  }
  return result;
}

@end
