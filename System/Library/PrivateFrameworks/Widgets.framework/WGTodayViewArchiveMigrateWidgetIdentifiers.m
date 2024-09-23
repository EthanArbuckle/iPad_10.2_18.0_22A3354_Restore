@implementation WGTodayViewArchiveMigrateWidgetIdentifiers

void ___WGTodayViewArchiveMigrateWidgetIdentifiers_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v6 = v5;
    objc_msgSend(*(id *)(a1 + 40), "replaceObjectAtIndex:withObject:", a3, v5);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
    v5 = v6;
  }

}

@end
