@implementation HKSPCompareWeekdaysInCalendar

_QWORD *__HKSPCompareWeekdaysInCalendar_block_invoke(_QWORD *result, uint64_t a2, _BYTE *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((unint64_t)(a2 + 2) > 9)
    v3 = 0;
  else
    v3 = qword_1A4F67120[a2 + 2];
  v4 = result[5] & v3;
  if (v4 != (result[6] & v3))
  {
    if (v4)
      v5 = -1;
    else
      v5 = 1;
    *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24) = v5;
    *a3 = 1;
  }
  return result;
}

@end
