@implementation SBMigGetBatteryUsageTimesInSeconds

uint64_t ___SBMigGetBatteryUsageTimesInSeconds_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t result;
  _OWORD v10[2];

  v2 = *(unsigned int *)(a1 + 80);
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *))(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 72);
  v8 = *(_OWORD *)(a1 + 100);
  v10[0] = *(_OWORD *)(a1 + 84);
  v10[1] = v8;
  result = v4(v2, v3, v5, v6, v7, v10);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
