@implementation SBSnapshotViewEnumerateSupportedRoles

uint64_t __SBSnapshotViewEnumerateSupportedRoles_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (SBSnapshotViewSupportedRoles_onceToken != -1)
    dispatch_once(&SBSnapshotViewSupportedRoles_onceToken, &__block_literal_global_370);
  result = SBLayoutRoleMaskContainsRole(SBSnapshotViewSupportedRoles___result, a2);
  if ((_DWORD)result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return result;
}

@end
