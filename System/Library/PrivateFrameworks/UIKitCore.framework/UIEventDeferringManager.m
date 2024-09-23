@implementation UIEventDeferringManager

void __100___UIEventDeferringManager__currentLocalRecordsMatchingEnvironment_forcePreviousHardwareIdentifier___block_invoke(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  _queue_compatibilityRecord(a1[4], a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __85___UIEventDeferringManager__startObservingContextForLocalTargetWindow_inEnvironment___block_invoke(_QWORD *a1)
{
  unint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = __systemShellBehaviorDelegate_block_invoke_25___s_category;
  if (!__systemShellBehaviorDelegate_block_invoke_25___s_category)
  {
    v2 = __UILogCategoryGetNode("EventDeferring", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&__systemShellBehaviorDelegate_block_invoke_25___s_category);
  }
  if ((*(_BYTE *)v2 & 1) != 0)
  {
    v5 = *(NSObject **)(v2 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)a1[5];
      v7 = a1[6];
      v8 = a1[4];
      v9 = v5;
      v10 = 134349826;
      v11 = v8;
      v12 = 2082;
      v13 = v7;
      v14 = 2050;
      v15 = v6;
      v16 = 1026;
      v17 = objc_msgSend(v6, "_contextId");
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "[%{public}p] [%{public}s] Began tracking context for local target window: %{public}p; contextId: 0x%{public}X",
        (uint8_t *)&v10,
        0x26u);

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", a1[4], sel__localTargetWindowDidAttachContext_, _UIWindowDidAttachContextNotification, a1[5]);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", a1[4], sel__localTargetWindowDidDetachContext_, _UIWindowDidDetachContextNotification, a1[5]);

}

void __83___UIEventDeferringManager__stopObservingContextForLocalTargetWindowInEnvironment___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "pointerValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = __systemShellBehaviorDelegate_block_invoke_26___s_category;
    if (!__systemShellBehaviorDelegate_block_invoke_26___s_category)
    {
      v4 = __UILogCategoryGetNode("EventDeferring", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&__systemShellBehaviorDelegate_block_invoke_26___s_category);
    }
    if ((*(_BYTE *)v4 & 1) != 0)
    {
      v7 = *(NSObject **)(v4 + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = *(_QWORD *)(a1 + 32);
        v9 = *(_QWORD *)(a1 + 40);
        v10 = v7;
        v11 = 134349826;
        v12 = v8;
        v13 = 2082;
        v14 = v9;
        v15 = 2050;
        v16 = v3;
        v17 = 1026;
        v18 = objc_msgSend(v3, "_contextId");
        _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "[%{public}p] [%{public}s] End tracking context for local target window: %{public}p; contextId: 0x%{public}X",
          (uint8_t *)&v11,
          0x26u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), _UIWindowDidAttachContextNotification, v3);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), _UIWindowDidDetachContextNotification, v3);

  }
}

void __66___UIEventDeferringManager_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  int8x16_t v20;
  int8x16_t v21;
  int8x16_t v22;
  int8x16_t v23;
  _QWORD v24[4];
  int8x16_t v25;
  _QWORD v26[4];
  int8x16_t v27;
  _QWORD v28[4];
  int8x16_t v29;
  _QWORD v30[4];
  int8x16_t v31;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "windowHostingScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "succinctDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "appendObject:withName:", v4, CFSTR("scene"));

  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104), CFSTR("behavior"));
  objc_msgSend(*(id *)(a1 + 32), "appendDictionarySection:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("localDeferringRecords"), 0);
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v7, "activeMultilinePrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __66___UIEventDeferringManager_descriptionBuilderWithMultilinePrefix___block_invoke_3;
  v30[3] = &unk_1E16B1B50;
  v20 = *(int8x16_t *)(a1 + 32);
  v10 = (id)v20.i64[0];
  v31 = vextq_s8(v20, v20, 8uLL);
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("localCompatibilityDeferringRecords"), v8, v30);

  objc_msgSend(*(id *)(a1 + 32), "appendDictionarySection:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("remoteDeferringRecordStacks"), 0);
  v11 = *(void **)(a1 + 32);
  objc_msgSend(v11, "activeMultilinePrefix");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v9;
  v28[1] = 3221225472;
  v28[2] = __66___UIEventDeferringManager_descriptionBuilderWithMultilinePrefix___block_invoke_5;
  v28[3] = &unk_1E16B1B50;
  v21 = *(int8x16_t *)(a1 + 32);
  v13 = (id)v21.i64[0];
  v29 = vextq_s8(v21, v21, 8uLL);
  objc_msgSend(v11, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("targetWindowProvidersByEnvironment"), v12, v28);

  v14 = *(void **)(a1 + 32);
  objc_msgSend(v14, "activeMultilinePrefix");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v9;
  v26[1] = 3221225472;
  v26[2] = __66___UIEventDeferringManager_descriptionBuilderWithMultilinePrefix___block_invoke_6;
  v26[3] = &unk_1E16B1B50;
  v22 = *(int8x16_t *)(a1 + 32);
  v16 = (id)v22.i64[0];
  v27 = vextq_s8(v22, v22, 8uLL);
  objc_msgSend(v14, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("trackedLocalTargetWindowPointersByEnvironment"), v15, v26);

  v17 = *(void **)(a1 + 32);
  objc_msgSend(v17, "activeMultilinePrefix");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v9;
  v24[1] = 3221225472;
  v24[2] = __66___UIEventDeferringManager_descriptionBuilderWithMultilinePrefix___block_invoke_7;
  v24[3] = &unk_1E16B1B50;
  v23 = *(int8x16_t *)(a1 + 32);
  v19 = (id)v23.i64[0];
  v25 = vextq_s8(v23, v23, 8uLL);
  objc_msgSend(v17, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("localTargetWindowPointersUnderObservation"), v18, v24);

}

void __66___UIEventDeferringManager_descriptionBuilderWithMultilinePrefix___block_invoke_5(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v8 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", v7, (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "description");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (id)objc_msgSend(v8, "appendObject:withName:", v10, v11);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

}

void __66___UIEventDeferringManager_descriptionBuilderWithMultilinePrefix___block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id obj;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "countForObject:", v6);
        v8 = *(void **)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p count"), objc_msgSend(v6, "pointerValue"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (id)objc_msgSend(v8, "appendUnsignedInteger:withName:", v7, v9);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v3);
  }

}

void __66___UIEventDeferringManager_descriptionBuilderWithMultilinePrefix___block_invoke_6(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", v7, (_QWORD)v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(void **)(a1 + 40);
        v10 = objc_msgSend(v8, "pointerValue");
        objc_msgSend(v7, "description");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (id)objc_msgSend(v9, "appendPointer:withName:", v10, v11);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

}

id __42___UIEventDeferringManager_initWithScene___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "descriptionBuilderWithMultilinePrefix:", &stru_1E16EDF20);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __66___UIEventDeferringManager_descriptionBuilderWithMultilinePrefix___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  _queue_compatibilityRecordsForDisplay(*(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __66___UIEventDeferringManager_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "activeMultilinePrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66___UIEventDeferringManager_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E16B1B50;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "appendBodySectionWithName:multilinePrefix:block:", 0, v3, v6);

}

void __66___UIEventDeferringManager_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD block[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  -[_UIEventDeferringManager _displayHardwareIndentifierAccountingForNotFinalizedChange:](*(unsigned __int8 **)(a1 + 32), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(MEMORY[0x1E0D00CF8], "displayWithHardwareIdentifier:", v2);
  else
    objc_msgSend(MEMORY[0x1E0D00CF8], "builtinDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__34;
  v16 = __Block_byref_object_dispose__34;
  v17 = 0;
  _eventDeferringCompatibilityQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66___UIEventDeferringManager_descriptionBuilderWithMultilinePrefix___block_invoke_4;
  block[3] = &unk_1E16BACE0;
  v11 = &v12;
  v5 = v3;
  v10 = v5;
  dispatch_sync(v4, block);

  v6 = *(void **)(a1 + 40);
  v7 = v13[5];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("display: %@"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendDictionarySection:withName:skipIfEmpty:", v7, v8, 0);

  _Block_object_dispose(&v12, 8);
}

void __42___UIEventDeferringManager_initWithScene___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;
  id v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v2 = WeakRetained + 11;
    v3 = objc_loadWeakRetained(WeakRetained + 11);
    if (objc_msgSend(v3, "_allowsEventUIWindowRouting"))
      v4 = objc_loadWeakRetained(v2);
    else
      v4 = 0;

    +[_UIEventDeferringManager targetOfEventDeferringEnvironmentsDidUpdateForScene:]((uint64_t)_UIEventDeferringManager, v4);
    WeakRetained = v5;
  }

}

BOOL __83___UIEventDeferringManager__remoteRecordInStackMatchingEnvironment_deferringToken___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  id WeakRetained;
  _BOOL8 v6;

  if (a2)
    WeakRetained = objc_loadWeakRetained((id *)(a2 + 32));
  else
    WeakRetained = 0;
  v6 = WeakRetained == *(id *)(a1 + 32);

  *a3 = v6;
  return v6;
}

uint64_t __65___UIEventDeferringManager__sortRemoteRecordStackForEnvironment___block_invoke(uint64_t a1, id *a2, id *a3)
{
  void *v6;
  id *WeakRetained;
  id v8;
  id *v9;
  id v10;
  uint64_t v11;

  -[_UIEventDeferringManager internalBehavior](*(id **)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2 && (WeakRetained = (id *)objc_loadWeakRetained(a2 + 4), (a2 = WeakRetained) != 0))
  {
    v8 = WeakRetained[5];
    if (!a3)
    {
LABEL_8:
      v10 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    v8 = 0;
    if (!a3)
      goto LABEL_8;
  }
  v9 = (id *)objc_loadWeakRetained(a3 + 4);
  a3 = v9;
  if (!v9)
    goto LABEL_8;
  v10 = v9[5];
LABEL_6:
  v11 = objc_msgSend(v6, "compareRemoteRuleOwningElement:toElement:inEnvironment:", v8, v10, *(_QWORD *)(a1 + 40));

  return v11;
}

BOOL __83___UIEventDeferringManager__isRemoteRuleOwningElement_visibleForLocalTargetWindow___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) == a2 || *(_QWORD *)(a1 + 40) == a2;
}

id __175___UIEventDeferringManager__processEventDeferringActions_actionsCount_inScope_forDeferringToken_environments_target_addingRecreationReason_removingRecreationReason_forReason___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;

  objc_msgSend(*(id *)(a1 + 32), "descriptionBuilderWithMultilinePrefix:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __175___UIEventDeferringManager__processEventDeferringActions_actionsCount_inScope_forDeferringToken_environments_target_addingRecreationReason_removingRecreationReason_forReason___block_invoke_2;
  v11[3] = &unk_1E16BAC68;
  v5 = v4;
  v12 = v5;
  v13 = a2;
  v6 = *(_QWORD *)(a1 + 80);
  v16 = *(_QWORD *)(a1 + 72);
  v17 = v6;
  v7 = *(_OWORD *)(a1 + 56);
  v14 = *(_OWORD *)(a1 + 40);
  v15 = v7;
  v8 = (id)objc_msgSend(v5, "modifyBody:", v11);
  v9 = v5;

  return v9;
}

void __175___UIEventDeferringManager__processEventDeferringActions_actionsCount_inScope_forDeferringToken_environments_target_addingRecreationReason_removingRecreationReason_forReason___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  _QWORD v7[4];
  id v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "activeMultilinePrefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __175___UIEventDeferringManager__processEventDeferringActions_actionsCount_inScope_forDeferringToken_environments_target_addingRecreationReason_removingRecreationReason_forReason___block_invoke_3;
  v7[3] = &unk_1E16BAC40;
  v8 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 88);
  v11 = *(_QWORD *)(a1 + 80);
  v12 = v5;
  v6 = *(_OWORD *)(a1 + 64);
  v9 = *(_OWORD *)(a1 + 48);
  v10 = v6;
  objc_msgSend(v2, "appendBodySectionWithName:multilinePrefix:block:", v3, v4, v7);

}

void __175___UIEventDeferringManager__processEventDeferringActions_actionsCount_inScope_forDeferringToken_environments_target_addingRecreationReason_removingRecreationReason_forReason___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t *v3;
  uint64_t v4;
  void *i;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  uint64_t v16;
  id v17;

  v2 = *(void **)(a1 + 32);
  v3 = *(uint64_t **)(a1 + 72);
  v4 = *(_QWORD *)(a1 + 80);
  for (i = (void *)objc_opt_new(); v4; --v4)
  {
    v6 = *v3++;
    objc_msgSend(i, "addObject:", _NSStringFromUIDeferringAction[v6]);
  }
  objc_msgSend(v2, "appendArraySection:withName:skipIfEmpty:", i, CFSTR("actions"), 0);

  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(a1 + 40), CFSTR("deferringToken"));
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v8, "activeMultilinePrefix");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __175___UIEventDeferringManager__processEventDeferringActions_actionsCount_inScope_forDeferringToken_environments_target_addingRecreationReason_removingRecreationReason_forReason___block_invoke_4;
  v15 = &unk_1E16B1B50;
  v16 = *(_QWORD *)(a1 + 48);
  v17 = *(id *)(a1 + 32);
  objc_msgSend(v8, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("environments"), v9, &v12);

  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(a1 + 56), CFSTR("target"), v12, v13, v14, v15, v16);
  v11 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(a1 + 64), CFSTR("reason"));

}

void __175___UIEventDeferringManager__processEventDeferringActions_actionsCount_inScope_forDeferringToken_environments_target_addingRecreationReason_removingRecreationReason_forReason___block_invoke_4(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v8 = *(void **)(a1 + 40);
        objc_msgSend(v7, "description", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (id)objc_msgSend(v8, "appendObject:withName:", v7, v9);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

void __119___UIEventDeferringManager__removeLocalCompatibilityEventDeferringForSystemShellKeyboardFocusInEnvironment_withReason___block_invoke(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  _queue_compatibilityRecord(a1[4], a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

BOOL __83___UIEventDeferringManager_removeEventDeferringRulesIfNeededForDeallocatingWindow___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *WeakRetained;
  uint64_t v4;
  _BOOL8 v5;

  if (!a2)
  {
    WeakRetained = 0;
    goto LABEL_6;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a2 + 32));
  if (!WeakRetained)
  {
LABEL_6:
    v4 = 0;
    goto LABEL_4;
  }
  v4 = WeakRetained[5];
LABEL_4:
  v5 = v4 == *(_QWORD *)(a1 + 32);

  return v5;
}

uint64_t __75___UIEventDeferringManager_bufferKeyboardFocusEnvironmentEventsWithReason___block_invoke(uint64_t a1)
{
  uint64_t result;
  unint64_t *v3;
  unint64_t v4;

  result = objc_msgSend(*(id *)(a1 + 32), "invalidate");
  v3 = (unint64_t *)(*(_QWORD *)(a1 + 40) + 72);
  do
    v4 = __ldaxr(v3);
  while (__stlxr(v4 - 1, v3));
  return result;
}

@end
