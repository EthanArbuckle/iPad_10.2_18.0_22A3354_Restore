@implementation STMutableStatusBarData

void __68__STMutableStatusBarData_Testing__subsetOfEntryKeys_withPercentage___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
    if (objc_msgSend(*(id *)(a1 + 40), "count") == *(_QWORD *)(a1 + 48))
      *a4 = 1;
  }

}

uint64_t __45__STMutableStatusBarData_Testing__legacyData__block_invoke(uint64_t a1, unsigned int a2, void *a3)
{
  char v5;

  if (a3)
    v5 = objc_msgSend(a3, "isEnabled");
  else
    v5 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + a2) = v5;
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + a2);
}

@end
