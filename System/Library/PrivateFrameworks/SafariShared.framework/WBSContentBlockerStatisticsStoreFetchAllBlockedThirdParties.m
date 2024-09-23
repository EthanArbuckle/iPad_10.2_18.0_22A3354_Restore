@implementation WBSContentBlockerStatisticsStoreFetchAllBlockedThirdParties

void __WBSContentBlockerStatisticsStoreFetchAllBlockedThirdParties_block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WBSContentBlockerStatisticsStoreMergeStatistics(*(void **)(a1 + 32), *(void **)(a1 + 40));
  v2 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 48);
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_1A3D90000, v2, OS_LOG_TYPE_INFO, "Finished loading content blocker statistics from %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t __WBSContentBlockerStatisticsStoreFetchAllBlockedThirdParties_block_invoke_7(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A3D90000, v2, OS_LOG_TYPE_INFO, "Finished loading content blocker statistics", v4, 2u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __WBSContentBlockerStatisticsStoreFetchAllBlockedThirdParties_block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  fetchingQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __WBSContentBlockerStatisticsStoreFetchAllBlockedThirdParties_block_invoke_2;
  block[3] = &unk_1E4B2A5F8;
  v8 = *(id *)(a1 + 40);
  v9 = v3;
  v10 = *(_QWORD *)(a1 + 48);
  v6 = v3;
  dispatch_group_async(v4, v5, block);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __WBSContentBlockerStatisticsStoreFetchAllBlockedThirdParties_block_invoke(uint64_t a1, void *a2)
{
  WBSContentBlockerStatisticsStoreMergeStatistics(*(void **)(a1 + 32), a2);
}

@end
