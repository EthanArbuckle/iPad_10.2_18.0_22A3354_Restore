@implementation UIDruidDestinationConnection

uint64_t __72___UIDruidDestinationConnection_initWithSessionIdentifier_systemPolicy___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __72___UIDruidDestinationConnection_initWithSessionIdentifier_systemPolicy___block_invoke_2(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[16];

  v2 = kOutstandingItemsCountKey_block_invoke_7___s_category;
  if (!kOutstandingItemsCountKey_block_invoke_7___s_category)
  {
    v2 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&kOutstandingItemsCountKey_block_invoke_7___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "_UIDruidDestinationConnection connection invalidated", buf, 2u);
  }
  +[UIApplication _systemAnimationFenceExemptQueue](UIApplication, "_systemAnimationFenceExemptQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72___UIDruidDestinationConnection_initWithSessionIdentifier_systemPolicy___block_invoke_643;
  v5[3] = &unk_1E16B3F40;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  objc_msgSend(v4, "performAsync:", v5);

  objc_destroyWeak(&v6);
}

void __72___UIDruidDestinationConnection_initWithSessionIdentifier_systemPolicy___block_invoke_643(uint64_t a1)
{
  id WeakRetained;
  BOOL v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = objc_msgSend(WeakRetained, "state") == 4;
    WeakRetained = v3;
    if (!v2)
    {
      objc_msgSend(v3, "setState:", 5);
      WeakRetained = v3;
    }
  }

}

void __40___UIDruidDestinationConnection_connect__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v10;
  id v11;
  id *v12;
  id *WeakRetained;
  id *v14;
  unint64_t v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21[3];
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = a2;
  v11 = a3;
  v12 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v14 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 1, a2);
    v15 = kOutstandingItemsCountKey_block_invoke_8___s_category;
    if (!kOutstandingItemsCountKey_block_invoke_8___s_category)
    {
      v15 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v15, (unint64_t *)&kOutstandingItemsCountKey_block_invoke_8___s_category);
    }
    v16 = *(NSObject **)(v15 + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v10;
      _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_DEFAULT, "_UIDruidDestinationConnection: sawFirstDragEvent reply with session %@", buf, 0xCu);
    }
    +[UIApplication _systemAnimationFenceExemptQueue](UIApplication, "_systemAnimationFenceExemptQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __40___UIDruidDestinationConnection_connect__block_invoke_644;
    v18[3] = &unk_1E16C46B0;
    objc_copyWeak(v21, v12);
    v19 = v10;
    v20 = v11;
    v21[1] = a4;
    v21[2] = a5;
    objc_msgSend(v17, "performAsync:", v18);

    objc_destroyWeak(v21);
  }

}

void __40___UIDruidDestinationConnection_connect__block_invoke_644(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  UIItemProvider *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "state") || !*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(v3, "setState:", 5);
    }
    else
    {
      objc_msgSend(v3, "setState:", 1);
      objc_msgSend(v3, "connectionBlock");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v13 = 0u;
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        objc_msgSend(*(id *)(a1 + 40), "items", 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v14;
          do
          {
            v10 = 0;
            do
            {
              if (*(_QWORD *)v14 != v9)
                objc_enumerationMutation(v6);
              v11 = -[UIItemProvider initWithPBItem:]([UIItemProvider alloc], "initWithPBItem:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
              objc_msgSend(v5, "addObject:", v11);

              ++v10;
            }
            while (v8 != v10);
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          }
          while (v8);
        }

        objc_msgSend(v3, "connectionBlock");
        v12 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, id, _QWORD, _QWORD))v12)[2](v12, *(_QWORD *)(a1 + 40), v5, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

      }
    }
  }

}

void __40___UIDruidDestinationConnection_connect__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = kOutstandingItemsCountKey_block_invoke_9___s_category;
  if (!kOutstandingItemsCountKey_block_invoke_9___s_category)
  {
    v4 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v4, (unint64_t *)&kOutstandingItemsCountKey_block_invoke_9___s_category);
  }
  v5 = *(NSObject **)(v4 + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_DEFAULT, "_UIDruidDestinationConnection sawFirstDragEvent error handler with %@", buf, 0xCu);
  }
  +[UIApplication _systemAnimationFenceExemptQueue](UIApplication, "_systemAnimationFenceExemptQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40___UIDruidDestinationConnection_connect__block_invoke_646;
  v7[3] = &unk_1E16B3F40;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  objc_msgSend(v6, "performAsync:", v7);

  objc_destroyWeak(&v8);
}

void __40___UIDruidDestinationConnection_connect__block_invoke_646(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "setState:", 5);
    WeakRetained = v2;
  }

}

void __70___UIDruidDestinationConnection_requestDragPreviewsForIndexSet_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD, _QWORD);
  uint64_t v4;
  unint64_t v5;
  NSObject *v6;
  uint8_t v7[8];
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "dragPreviewProviderBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "dragPreviewProviderBlock");
    v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __70___UIDruidDestinationConnection_requestDragPreviewsForIndexSet_reply___block_invoke_2;
    v8[3] = &unk_1E16C4688;
    v4 = *(_QWORD *)(a1 + 40);
    v9 = *(id *)(a1 + 48);
    ((void (**)(_QWORD, uint64_t, _QWORD *))v3)[2](v3, v4, v8);

  }
  else
  {
    v5 = kOutstandingItemsCountKey_block_invoke_10___s_category;
    if (!kOutstandingItemsCountKey_block_invoke_10___s_category)
    {
      v5 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&kOutstandingItemsCountKey_block_invoke_10___s_category);
    }
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "Source has no dragPreviewProviderBlock yet; we assume druid will retry",
        v7,
        2u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t __70___UIDruidDestinationConnection_requestDragPreviewsForIndexSet_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __53___UIDruidDestinationConnection_updatedPresentation___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "updatedPresentationBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "updatedPresentationBlock");
    v3 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 40));

  }
}

void __53___UIDruidDestinationConnection_addedItemCollection___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "itemsAddedBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "itemsAddedBlock");
    v3 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 40));

  }
}

void __115___UIDruidDestinationConnection_performDropWithItemCollection_dataProviderEndpoint_visibleDroppedItems_completion___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  UIItemProvider *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v15;
  uint64_t v16;
  id v17;
  unint64_t v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2 && *(_QWORD *)(a1 + 40) && *(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "setState:", 3);
    objc_msgSend(*(id *)(a1 + 40), "setDataProviderEndpoint:", *(_QWORD *)(a1 + 48));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 40), "registerLocalAvailableDerivedRepresentations");
    objc_msgSend(*(id *)(a1 + 32), "dropPerformBlock");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      v3 = qword_1ECD77518;
      if (!qword_1ECD77518)
      {
        v3 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v3, (unint64_t *)&qword_1ECD77518);
      }
      v4 = *(NSObject **)(v3 + 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "_UIDruidDestinationConnection performDropWithItemCollection: calling dropPerformBlock", buf, 2u);
      }
      v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
      objc_msgSend(*(id *)(a1 + 40), "items");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));

      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      objc_msgSend(*(id *)(a1 + 40), "items");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v29 != v11)
              objc_enumerationMutation(v8);
            v13 = -[UIItemProvider initWithPBItem:]([UIItemProvider alloc], "initWithPBItem:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
            objc_msgSend(v7, "addObject:", v13);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
        }
        while (v10);
      }

      objc_msgSend(*(id *)(a1 + 32), "dropPerformBlock");
      v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 40);
      v16 = *(_QWORD *)(a1 + 56);
      v27 = 0;
      ((void (**)(_QWORD, uint64_t, void *, uint64_t, id *))v14)[2](v14, v15, v7, v16, &v27);
      v17 = v27;

    }
    else
    {
      v17 = 0;
    }
    v22 = *(void **)(a1 + 64);
    if (v22)
    {
      v23 = *(void **)(a1 + 40);
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __115___UIDruidDestinationConnection_performDropWithItemCollection_dataProviderEndpoint_visibleDroppedItems_completion___block_invoke_651;
      v24[3] = &unk_1E16B2F48;
      v26 = v22;
      v25 = v17;
      objc_msgSend(v23, "waitForItemRequestsDeliveryCompletion:", v24);

    }
  }
  else
  {
    v18 = qword_1ECD77520;
    if (!qword_1ECD77520)
    {
      v18 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v18, (unint64_t *)&qword_1ECD77520);
    }
    v19 = *(NSObject **)(v18 + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *(void **)(a1 + 32);
      v21 = v19;
      *(_DWORD *)buf = 134217984;
      v33 = objc_msgSend(v20, "state");
      _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_DEFAULT, "_UIDruidDestinationConnection performDropWithItemCollection: failing, state is %ld", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "setState:", 5);
  }
}

uint64_t __115___UIDruidDestinationConnection_performDropWithItemCollection_dataProviderEndpoint_visibleDroppedItems_completion___block_invoke_651(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = kOutstandingItemsCountKey_block_invoke_12___s_category;
  if (!kOutstandingItemsCountKey_block_invoke_12___s_category)
  {
    v2 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&kOutstandingItemsCountKey_block_invoke_12___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "_UIDruidDestinationConnection performDropWithItemCollection: sending reply to druid", v5, 2u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __63___UIDruidDestinationConnection_handOffDroppedItems_withFence___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "handOffDroppedItemsBlock");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 32), "handOffDroppedItemsBlock");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

    }
  }
  else
  {
    v3 = kOutstandingItemsCountKey_block_invoke_13___s_category;
    if (!kOutstandingItemsCountKey_block_invoke_13___s_category)
    {
      v3 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v3, (unint64_t *)&kOutstandingItemsCountKey_block_invoke_13___s_category);
    }
    v4 = *(NSObject **)(v3 + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 32);
      v6 = v4;
      *(_DWORD *)buf = 134217984;
      v9 = objc_msgSend(v5, "state");
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "_UIDruidDestinationConnection handOffDroppedItems:withFence: failing, state is %ld", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "setState:", 5);
  }
}

uint64_t __42___UIDruidDestinationConnection_dragEnded__block_invoke(uint64_t a1)
{
  uint64_t v2;

  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    v2 = 4;
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "state") == 3)
  {
    v2 = 4;
  }
  else
  {
    v2 = 5;
  }
  return objc_msgSend(*(id *)(a1 + 32), "setState:", v2);
}

@end
