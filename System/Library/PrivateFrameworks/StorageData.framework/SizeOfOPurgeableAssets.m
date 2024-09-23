@implementation SizeOfOPurgeableAssets

uint64_t ___SizeOfOPurgeableAssets_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2;
  v4 = objc_msgSend(v3, "size");
  if (v4 >= 1)
  {
    v5 = v4;
    if (objc_msgSend(v3, "purgeabilityScoreAtUrgency:", 3))
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += v5;
  }

  return 1;
}

@end
