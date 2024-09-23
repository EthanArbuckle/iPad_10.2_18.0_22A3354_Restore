@implementation TIStatisticCheckRecentTriggersForTrigger

void __TIStatisticCheckRecentTriggersForTrigger_block_invoke_2(uint64_t a1)
{
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  objc_msgSend(*(id *)(a1 + 32), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_sync_exit(obj);

}

void __TIStatisticCheckRecentTriggersForTrigger_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 8);
  v1 = (void *)TIStatisticCheckRecentTriggersForTrigger_recentByMetricType;
  TIStatisticCheckRecentTriggersForTrigger_recentByMetricType = v0;

}

@end
