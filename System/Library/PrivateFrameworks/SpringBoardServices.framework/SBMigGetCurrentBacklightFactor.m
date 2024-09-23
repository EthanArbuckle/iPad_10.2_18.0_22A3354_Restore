@implementation SBMigGetCurrentBacklightFactor

uint64_t ___SBMigGetCurrentBacklightFactor_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD, _QWORD))(a1 + 40))(*(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
