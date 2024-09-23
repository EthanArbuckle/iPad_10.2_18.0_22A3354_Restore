@implementation SignpostSupportSortedSubArrayFromIntervals

uint64_t __SignpostSupportSortedSubArrayFromIntervals_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v9;
  uint64_t v10;

  v5 = a3;
  v6 = objc_msgSend(a2, "durationMachContinuousTime");
  v7 = objc_msgSend(v5, "durationMachContinuousTime");

  if (v6 == v7)
    return 0;
  v9 = 1;
  if (v6 <= v7)
    v9 = -1;
  v10 = 1;
  if (v6 >= v7)
    v10 = -1;
  if (*(_BYTE *)(a1 + 32))
    return v10;
  else
    return v9;
}

@end
