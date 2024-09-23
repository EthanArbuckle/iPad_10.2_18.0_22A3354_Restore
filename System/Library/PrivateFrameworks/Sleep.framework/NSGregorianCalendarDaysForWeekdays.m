@implementation NSGregorianCalendarDaysForWeekdays

uint64_t __NSGregorianCalendarDaysForWeekdays_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  v3 = HKSPDayForWeekdays(a2);
  if ((unint64_t)(v3 - 1) >= 7)
    v4 = 0;
  else
    v4 = v3;
  return objc_msgSend(v2, "addIndex:", v4);
}

@end
