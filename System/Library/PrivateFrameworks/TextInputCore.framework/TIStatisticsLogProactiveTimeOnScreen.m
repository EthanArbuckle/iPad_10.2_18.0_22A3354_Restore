@implementation TIStatisticsLogProactiveTimeOnScreen

void __TIStatisticsLogProactiveTimeOnScreen_block_invoke(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1DF0A2708]();
  v3 = CFSTR("NA");
  v4 = *(void **)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
    v3 = *(__CFString **)(a1 + 32);
  v5 = v3;
  TIStatisticsCategoriesForProactiveTrigger(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_TIStatisticsProactiveTracker sharedInstance](_TIStatisticsProactiveTracker, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trackPredictionTimeWithSource:time:selected:categories:locale:fieldType:", objc_msgSend(*(id *)(a1 + 40), "triggerSourceType"), *(unsigned __int8 *)(a1 + 64), v6, *(_QWORD *)(a1 + 48), v5, *(double *)(a1 + 56));

  objc_autoreleasePoolPop(v2);
}

@end
