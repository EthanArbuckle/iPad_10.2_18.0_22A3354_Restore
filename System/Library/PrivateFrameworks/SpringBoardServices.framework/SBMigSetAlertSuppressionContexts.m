@implementation SBMigSetAlertSuppressionContexts

uint64_t ___SBMigSetAlertSuppressionContexts_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t, _OWORD *);
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t result;
  _OWORD v8[2];

  v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, _OWORD *))(a1 + 40);
  v2 = *(_QWORD *)(a1 + 48);
  v4 = *(unsigned int *)(a1 + 56);
  v5 = *(unsigned int *)(a1 + 60);
  v6 = *(_OWORD *)(a1 + 80);
  v8[0] = *(_OWORD *)(a1 + 64);
  v8[1] = v6;
  result = v3(v4, v2, v5, v8);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
