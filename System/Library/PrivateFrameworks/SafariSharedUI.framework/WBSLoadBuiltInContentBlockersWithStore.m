@implementation WBSLoadBuiltInContentBlockersWithStore

uint64_t __WBSLoadBuiltInContentBlockersWithStore_block_invoke()
{
  uint64_t result;

  result = objc_msgSend(getWPResourcesClass(), "instancesRespondToSelector:", sel_loadTrackerBlockerRuleListForStore_completionHandler_);
  if ((_DWORD)result)
    WBSLoadBuiltInContentBlockersWithStore_canLoadRuleListUsingWebPrivacy = 1;
  return result;
}

void __WBSLoadBuiltInContentBlockersWithStore_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void (*v6)(void);
  NSObject *v7;

  v5 = a3;
  if (a2)
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v7 = WBS_LOG_CHANNEL_PREFIXBuiltInContentBlockers();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __WBSLoadBuiltInContentBlockersWithStore_block_invoke_2_cold_1(v7, v5);
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v6();

}

void __WBSLoadBuiltInContentBlockersWithStore_block_invoke_2_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A840B000, v3, OS_LOG_TYPE_ERROR, "Failed to load content rule list from WebPrivacy with error: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
