@implementation UIStatusBarDataAggregator

uint64_t __69___UIStatusBarDataAggregator__updateFromPendingUpdatesForKeys_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __61___UIStatusBarDataAggregator_endDelayingUpdatesForEntryKeys___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateForCoalescedKeysWithData:", a2);
}

void __62___UIStatusBarDataAggregator__updateForCoalescedKeysWithData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id location;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_initWeak(&location, *(id *)(a1 + 40));
    v8 = (void *)MEMORY[0x1E0C99E88];
    objc_msgSend(v6, "doubleValue");
    v10 = v9;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __62___UIStatusBarDataAggregator__updateForCoalescedKeysWithData___block_invoke_2;
    v13[3] = &unk_1E16D9240;
    objc_copyWeak(&v14, &location);
    v13[4] = v5;
    objc_msgSend(v8, "scheduledTimerWithTimeInterval:repeats:block:", 0, v13, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "objectForKeyedSubscript:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invalidate");

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "setObject:forKeyedSubscript:", v11, v5);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

void __62___UIStatusBarDataAggregator__updateForCoalescedKeysWithData___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_coalescedUpdateForEntryKeys:", v2);

}

@end
