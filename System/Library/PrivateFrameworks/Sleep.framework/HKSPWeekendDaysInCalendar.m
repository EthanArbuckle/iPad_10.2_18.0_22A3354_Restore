@implementation HKSPWeekendDaysInCalendar

uint64_t __HKSPWeekendDaysInCalendar_block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "unsignedIntegerValue");
  if ((unint64_t)(result + 2) > 9)
    v4 = 0;
  else
    v4 = qword_1A4F67120[result + 2];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= v4;
  return result;
}

@end
