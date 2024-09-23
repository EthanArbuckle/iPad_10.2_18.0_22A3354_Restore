@implementation HKSPWeekdaysAreConsecutiveInCalendar

void __HKSPWeekdaysAreConsecutiveInCalendar_block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  _QWORD v5[5];
  int8x16_t v6;
  uint64_t v7;
  _QWORD v8[3];
  char v9;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __HKSPWeekdaysAreConsecutiveInCalendar_block_invoke_2;
  v5[3] = &unk_1E4E3D080;
  v7 = *(_QWORD *)(a1 + 56);
  v5[4] = v8;
  v6 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  HKSPEnumerateDaysOfWeekStartingOnDay(a2, (uint64_t)v5, 0);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *a3 = 1;
  _Block_object_dispose(v8, 8);
}

_QWORD *__HKSPWeekdaysAreConsecutiveInCalendar_block_invoke_2(_QWORD *result, uint64_t a2, _BYTE *a3)
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)(a2 + 2) > 9)
    v3 = 0;
  else
    v3 = qword_1A4F67120[a2 + 2];
  v4 = *(_QWORD *)(result[4] + 8);
  if ((v3 & result[7]) != 0)
  {
    if (*(_BYTE *)(v4 + 24))
    {
      *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24) = 0;
      *a3 = 1;
    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 24) = a2;
    }
  }
  else
  {
    *(_BYTE *)(v4 + 24) = 1;
  }
  return result;
}

@end
