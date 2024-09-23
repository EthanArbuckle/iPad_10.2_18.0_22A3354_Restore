@implementation HKSleepScheduleWeekdaysFromHKSPWeekdays

uint64_t __HKSleepScheduleWeekdaysFromHKSPWeekdays_block_invoke(uint64_t result, uint64_t a2)
{
  if ((unint64_t)(a2 - 1) <= 6)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) |= qword_1A4F67170[a2 - 1];
  return result;
}

@end
