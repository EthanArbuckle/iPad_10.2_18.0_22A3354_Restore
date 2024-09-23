@implementation SBMigShutDown

uint64_t ___SBMigShutDown_block_invoke(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, _OWORD *);
  uint64_t v2;
  __int128 v3;
  _OWORD v5[2];

  v1 = *(uint64_t (**)(uint64_t, _OWORD *))(a1 + 32);
  v2 = *(unsigned int *)(a1 + 40);
  v3 = *(_OWORD *)(a1 + 60);
  v5[0] = *(_OWORD *)(a1 + 44);
  v5[1] = v3;
  return v1(v2, v5);
}

@end
