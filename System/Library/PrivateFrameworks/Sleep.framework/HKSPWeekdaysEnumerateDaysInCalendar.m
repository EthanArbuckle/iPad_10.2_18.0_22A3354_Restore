@implementation HKSPWeekdaysEnumerateDaysInCalendar

uint64_t __HKSPWeekdaysEnumerateDaysInCalendar_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if ((unint64_t)(a2 + 2) > 9)
    v2 = 0;
  else
    v2 = qword_1A4F67120[a2 + 2];
  if ((v2 & *(_QWORD *)(result + 40)) != 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

@end
