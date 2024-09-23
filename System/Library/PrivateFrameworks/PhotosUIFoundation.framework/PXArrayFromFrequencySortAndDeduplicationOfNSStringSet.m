@implementation PXArrayFromFrequencySortAndDeduplicationOfNSStringSet

uint64_t __PXArrayFromFrequencySortAndDeduplicationOfNSStringSet_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", v5);
  v8 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", v6);
  if (v7 == v8)
  {
    v9 = objc_msgSend(v5, "localizedCompare:", v6);
  }
  else if (v7 > v8)
  {
    v9 = -1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

@end
