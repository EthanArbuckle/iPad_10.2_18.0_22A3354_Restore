@implementation WBTabCyclerTabGroupUpdateObserver

void __52___WBTabCyclerTabGroupUpdateObserver_startObserving__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v2;
  uint64_t v3;
  id v4;
  __int16 v5[8];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v5[0] = 0;
      _os_log_impl(&dword_211022000, v2, OS_LOG_TYPE_INFO, "Beginning to observe Tab Group updates", (uint8_t *)v5, 2u);
    }
    objc_msgSend(WeakRetained[2], "addTabGroupObserver:", WeakRetained);
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", WeakRetained, sel__timeout, 0, 0, 300.0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = WeakRetained[3];
    WeakRetained[3] = (id)v3;

  }
}

@end
