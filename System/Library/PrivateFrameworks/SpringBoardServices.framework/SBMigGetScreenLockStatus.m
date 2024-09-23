@implementation SBMigGetScreenLockStatus

uint64_t ___SBMigGetScreenLockStatus_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1 + 40))(*(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
