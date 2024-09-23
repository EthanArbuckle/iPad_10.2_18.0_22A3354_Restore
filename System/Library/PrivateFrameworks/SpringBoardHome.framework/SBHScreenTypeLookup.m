@implementation SBHScreenTypeLookup

uint64_t ___SBHScreenTypeLookup_block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  __int128 v6;
  uint64_t result;
  _OWORD v8[2];
  uint64_t v9;
  _OWORD v10[2];
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = 0;
  v12 = 0u;
  v13 = 0u;
  SBHGetScreenSpecification(a2, (uint64_t)&v12);
  v10[0] = v12;
  v10[1] = v13;
  v11 = v14;
  v6 = *(_OWORD *)(a1 + 64);
  v8[0] = *(_OWORD *)(a1 + 48);
  v8[1] = v6;
  v9 = *(_QWORD *)(a1 + 80);
  result = SBHScreenSpecificationEqualToScreenSpecification((uint64_t)v10, (uint64_t)v8);
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

uint64_t __SBHScreenTypeLookup_block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t __SBHScreenTypeLookup_block_invoke_2(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 33);
}

uint64_t __SBHScreenTypeLookup_block_invoke_3(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 34);
}

@end
