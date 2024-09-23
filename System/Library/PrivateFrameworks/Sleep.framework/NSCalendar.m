@implementation NSCalendar

void __46__NSCalendar_HKSPSleep__hksp_orderedSleepDays__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __62__NSCalendar_HKSPSleep__hksp_orderedSleepWeekdaysForWeekdays___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  id v4;

  if ((unint64_t)(a2 + 2) > 9)
    v2 = 0;
  else
    v2 = qword_1A4F66F30[a2 + 2];
  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

uint64_t __78__NSCalendar_HKSPSleep___hksp_nextDateAfterDate_matchingComponents_backwards___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "nextDateAfterDate:matchingComponents:options:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __78__NSCalendar_HKSPSleep___hksp_nextDateAfterDate_matchingUnit_value_backwards___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "nextDateAfterDate:matchingUnit:value:options:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __48__NSCalendar_HKSPSleep__hksp_firstNonWeekendDay__block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  uint64_t v8;

  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v6, "containsObject:", v7);

  if ((v6 & 1) == 0)
  {
    if ((unint64_t)(a2 - 1) >= 7)
      v8 = 0;
    else
      v8 = a2;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v8;
    *a3 = 1;
  }
}

@end
