@implementation HKSPPreviousDayInWeekdays

uint64_t __HKSPPreviousDayInWeekdays_block_invoke(uint64_t result, uint64_t a2, _BYTE *a3)
{
  uint64_t v3;

  if ((unint64_t)(a2 + 2) > 9)
    v3 = 0;
  else
    v3 = qword_1A4F67120[a2 + 2];
  if ((*(_QWORD *)(result + 40) & v3) != 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
    *a3 = 1;
  }
  return result;
}

@end
