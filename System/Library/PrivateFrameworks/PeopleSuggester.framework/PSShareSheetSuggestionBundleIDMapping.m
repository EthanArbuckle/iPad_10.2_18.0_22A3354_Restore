@implementation PSShareSheetSuggestionBundleIDMapping

void ___PSShareSheetSuggestionBundleIDMapping_block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v0 = objc_alloc(MEMORY[0x1E0D815F0]);
  v1 = (void *)objc_opt_new();
  v2 = objc_msgSend(v0, "initWithGuardedData:", v1);
  v3 = (void *)_PSShareSheetSuggestionBundleIDMapping_lock;
  _PSShareSheetSuggestionBundleIDMapping_lock = v2;

  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "_PSShareSheetSuggestionBundleIDMapping expiration", 9);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_PSShareSheetSuggestionBundleIDMapping_queue;
  _PSShareSheetSuggestionBundleIDMapping_queue = v4;

}

void ___PSShareSheetSuggestionBundleIDMapping_block_invoke_108(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  dispatch_time_t v11;
  _QWORD block[4];
  char v13;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v5);
  }
  else
  {
    _uncachedPSShareSheetSuggestionBundleIDMapping(*(_BYTE *)(a1 + 40));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, v10);

    v11 = dispatch_time(0, 60000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___PSShareSheetSuggestionBundleIDMapping_block_invoke_2;
    block[3] = &__block_descriptor_33_e5_v8__0l;
    v13 = *(_BYTE *)(a1 + 40);
    dispatch_after(v11, (dispatch_queue_t)_PSShareSheetSuggestionBundleIDMapping_queue, block);
  }

}

uint64_t ___PSShareSheetSuggestionBundleIDMapping_block_invoke_2(uint64_t a1)
{
  _QWORD v2[4];
  char v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = ___PSShareSheetSuggestionBundleIDMapping_block_invoke_3;
  v2[3] = &__block_descriptor_33_e29_v16__0__NSMutableDictionary_8l;
  v3 = *(_BYTE *)(a1 + 32);
  return objc_msgSend((id)_PSShareSheetSuggestionBundleIDMapping_lock, "runWithLockAcquired:", v2);
}

void ___PSShareSheetSuggestionBundleIDMapping_block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = *(unsigned __int8 *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "numberWithBool:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, v5);

}

@end
