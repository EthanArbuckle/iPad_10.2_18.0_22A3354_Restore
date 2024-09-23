@implementation HKSPWeekdaysFromDays

uint64_t __HKSPWeekdaysFromDays_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if ((unint64_t)(a2 + 2) > 9)
    v2 = 0;
  else
    v2 = qword_1A4F67120[a2 + 2];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) |= v2;
  return result;
}

@end
