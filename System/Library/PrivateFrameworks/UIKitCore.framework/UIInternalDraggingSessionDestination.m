@implementation UIInternalDraggingSessionDestination

void __48___UIInternalDraggingSessionDestination_connect__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, char a5)
{
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _UIDropItem *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v12 = WeakRetained;
  if (WeakRetained)
  {
    v28 = v9;
    *((_BYTE *)WeakRetained + 40) = 1;
    *((_BYTE *)WeakRetained + 152) = a5 & 1;
    *((_BYTE *)WeakRetained + 153) = (a5 & 2) != 0;
    *((_QWORD *)WeakRetained + 26) = a4;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v14 = v10;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v30;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v30 != v17)
            objc_enumerationMutation(v14);
          v19 = -[UIDragItem initWithItemProvider:]([_UIDropItem alloc], "initWithItemProvider:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v18));
          objc_msgSend(v13, "addObject:", v19);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v16);
    }

    v9 = v28;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192) = objc_msgSend(v28, "originatorDataOwner");
    objc_msgSend(v12, "inAppSessionSource");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      objc_msgSend(v20, "internalItems");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v13, "count");
      if (v23 - 1 < (unint64_t)objc_msgSend(v22, "count"))
      {
        v24 = 0;
        do
        {
          objc_msgSend(v22, "objectAtIndexedSubscript:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectAtIndexedSubscript:", v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "_setLocalDragItem:", v25);

          ++v24;
        }
        while (v23 != v24);
      }

    }
    objc_msgSend(v12, "setInternalItems:", v13);
    objc_msgSend(v12, "dragEvents");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "makeObjectsPerformSelector:", sel__sendIfNeeded);

  }
}

void __48___UIInternalDraggingSessionDestination_connect__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "internalItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    dragPreviewsOfItems(v9, v5, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)UIApp;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __48___UIInternalDraggingSessionDestination_connect__block_invoke_3;
    v13[3] = &unk_1E16B2F48;
    v14 = v10;
    v15 = v6;
    v12 = v10;
    objc_msgSend(v11, "_performBlockAfterCATransactionCommits:", v13);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }

}

uint64_t __48___UIInternalDraggingSessionDestination_connect__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __48___UIInternalDraggingSessionDestination_connect__block_invoke_4(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  UIItemProvider *v12;
  _UIDropItem *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v21, "items");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "internalItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    v7 = objc_msgSend(v4, "count");
    objc_msgSend(WeakRetained, "internalItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    if (v6 < v7)
    {
      v10 = v6;
      do
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[UIItemProvider initWithPBItem:]([UIItemProvider alloc], "initWithPBItem:", v11);
        v13 = -[UIDragItem initWithItemProvider:]([_UIDropItem alloc], "initWithItemProvider:", v12);
        objc_msgSend(v9, "addObject:", v13);

        ++v10;
      }
      while (v7 != v10);
    }
    objc_msgSend(WeakRetained, "inAppSessionSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "internalItems");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");
      if (v6 < v7 && v7 <= v17)
      {
        do
        {
          objc_msgSend(v16, "objectAtIndexedSubscript:", v6);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", v6);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "_setLocalDragItem:", v18);

          ++v6;
        }
        while (v7 != v6);
      }

    }
    objc_msgSend(WeakRetained, "setInternalItems:", v9);
    objc_msgSend(WeakRetained, "dragEvents");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "makeObjectsPerformSelector:", sel__setNeedsHitTestReset);

  }
}

void __48___UIInternalDraggingSessionDestination_connect__block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v10;
  id v11;
  id v12;
  _QWORD *WeakRetained;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a2;
  v11 = a3;
  v12 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v14 = WeakRetained;
  if (WeakRetained && WeakRetained[9])
  {
    v22 = a1;
    v23 = v11;
    v24 = v10;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v15 = v11;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "setDataTransferDelegate:", *((_QWORD *)v14 + 14), v22);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v17);
    }

    objc_msgSend(v14, "takeVisibleDroppedItems:", v12);
    objc_storeStrong((id *)v14 + 23, a3);
    objc_storeStrong((id *)v14 + 13, a2);
    *(_BYTE *)(*(_QWORD *)(v22 + 32) + 128) = 1;
    (*(void (**)(void))(*((_QWORD *)v14 + 9) + 16))();
    v20 = (void *)*((_QWORD *)v14 + 23);
    *((_QWORD *)v14 + 23) = 0;

    v21 = (void *)*((_QWORD *)v14 + 9);
    *((_QWORD *)v14 + 9) = 0;

    objc_msgSend(v14, "setUpDropAnimation:layerContext:", v12, a5);
    v10 = v24;
    v11 = v23;
  }

}

void __48___UIInternalDraggingSessionDestination_connect__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;

  v7 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v5)
      +[UIScene _synchronizeDrawingWithFence:](UIScene, "_synchronizeDrawingWithFence:", v5);
    objc_msgSend(WeakRetained, "handOffDroppedItems:", v7);
  }

}

void __48___UIInternalDraggingSessionDestination_connect__block_invoke_7(uint64_t a1, int a2)
{
  _BYTE *WeakRetained;
  _BYTE *v4;
  BOOL v5;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  _QWORD v9[5];
  BOOL v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
      v5 = *((_QWORD *)WeakRetained + 9) == 0;
    else
      v5 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48___UIInternalDraggingSessionDestination_connect__block_invoke_8;
    v9[3] = &unk_1E16B1B78;
    v9[4] = WeakRetained;
    v10 = v5;
    v6 = (void (**)(_QWORD))_Block_copy(v9);
    objc_msgSend(v4, "activeDragEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5 || !v7)
      v6[2](v6);
    else
      objc_msgSend(v7, "_dragFailedWithCallback:", v6);
    objc_msgSend(v4, "setDruidConnection:", 0);
    v4[40] = 0;

  }
}

uint64_t __48___UIInternalDraggingSessionDestination_connect__block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sessionDidEndNormally:", *(unsigned __int8 *)(a1 + 40));
}

void __64___UIInternalDraggingSessionDestination__sessionDidEndNormally___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "_sendSessionDidEnd:", *(_QWORD *)(a1 + 32), (_QWORD)v10);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeAllObjects");
  v7 = *(id **)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(v7[14], "sendDelegateEventsIfNeeded");
  else
    objc_msgSend(v7, "_removeFromDragManager");
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 176), *(id *)(*(_QWORD *)(a1 + 32) + 168));
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 168);
  *(_QWORD *)(v8 + 168) = 0;

}

void __75___UIInternalDraggingSessionDestination_dataTransferMonitorBeganTransfers___block_invoke(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  id WeakRetained;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  int v41;
  _QWORD v42[4];
  id v43;
  uint64_t v44;
  _QWORD aBlock[5];
  __int128 buf;
  uint64_t (*v47)(uint64_t);
  void *v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 128))
  {
    v3 = qword_1ECD77500;
    if (!qword_1ECD77500)
    {
      v3 = __UILogCategoryGetNode("Dragging", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v3, (unint64_t *)&qword_1ECD77500);
      v1 = *(_QWORD *)(a1 + 32);
    }
    v4 = *(NSObject **)(v3 + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v1;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "Data transfer began for dragging session destination %p", (uint8_t *)&buf, 0xCu);
      v1 = *(_QWORD *)(a1 + 32);
    }
    v5 = *(void **)(v1 + 232);
    objc_msgSend(*(id *)(a1 + 40), "progress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addChild:withPendingUnitCount:", v6, 100);

    v7 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v7 + 216) == 1
      && objc_msgSend(*(id *)(v7 + 112), "totalItemsCount")
      && !*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120))
    {
      _UIKitUserDefaults();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v47 = ___UIGetDraggingModalAlertLatencySeconds_block_invoke;
      v48 = &unk_1E16B1B28;
      v49 = v8;
      v10 = _MergedGlobals_18_0;
      v11 = v8;
      v12 = v11;
      if (v10 == -1)
      {
        v13 = v11;
      }
      else
      {
        dispatch_once(&_MergedGlobals_18_0, &buf);
        v13 = v49;
      }
      v14 = objc_msgSend(v12, "integerForKey:", CFSTR("DraggingModalAlertLatencySeconds"));

      if (v14 >= 1)
      {
        WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
        objc_msgSend(WeakRetained, "windowScene");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
          +[_UIApplicationModalProgressController instanceForScene:](_UIApplicationModalProgressController, "instanceForScene:", v16);
        else
          +[_UIApplicationModalProgressController sharedInstance](_UIApplicationModalProgressController, "sharedInstance");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v14;
        objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 120), v17);
        if (_IsKindOfUIView(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56)))
        {
          v18 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
          objc_msgSend(v18, "traitCollection");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "userInterfaceIdiom");

          if (v20 == 6)
          {
            +[UIViewController _viewControllerForFullScreenPresentationFromView:](UIViewController, "_viewControllerForFullScreenPresentationFromView:", v18);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v21 = 0;
          }

        }
        else
        {
          v21 = 0;
        }
        v22 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "totalItemsCount");
        _UILocalizedFormat(CFSTR("dragging.dropAlertTitle"), (uint64_t)CFSTR("Drop alert title"), CFSTR("Importing %lu items"), v23, v24, v25, v26, v27, v22);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        _UILocalizedFormat(CFSTR("dragging.dropAlertItemsRemaining"), (uint64_t)CFSTR("Drop alert message"), CFSTR("%lu items remaining"), v29, v30, v31, v32, v33, v22);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        _UILocalizedString(CFSTR("dragging.dropAlertCancelButton"), (uint64_t)CFSTR("Drop alert cancel button"), CFSTR("Cancel"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        aBlock[0] = v9;
        aBlock[1] = 3221225472;
        aBlock[2] = __75___UIInternalDraggingSessionDestination_dataTransferMonitorBeganTransfers___block_invoke_419;
        aBlock[3] = &unk_1E16B2268;
        aBlock[4] = *(_QWORD *)(a1 + 32);
        v36 = _Block_copy(aBlock);
        v42[0] = v9;
        v42[1] = 3221225472;
        v42[2] = __75___UIInternalDraggingSessionDestination_dataTransferMonitorBeganTransfers___block_invoke_2;
        v42[3] = &unk_1E16B2218;
        v37 = *(id *)(a1 + 40);
        v38 = *(_QWORD *)(a1 + 32);
        v43 = v37;
        v44 = v38;
        v39 = _Block_copy(v42);
        objc_msgSend(*(id *)(a1 + 40), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("outstandingItemsCount"), 1, 0);
        objc_msgSend(v17, "setDisplayDelaySeconds:", (double)v41);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "progress");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "displayWithTitle:message:progress:buttonTitle:sourceViewController:preDisplayTestBlock:dismissalHandler:", v28, v34, v40, v35, v21, v36, v39);

      }
    }
  }
}

uint64_t __75___UIInternalDraggingSessionDestination_dataTransferMonitorBeganTransfers___block_invoke_419(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "isFinished") ^ 1;
}

uint64_t __75___UIInternalDraggingSessionDestination_dataTransferMonitorBeganTransfers___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "progress");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancel");

  }
  return objc_msgSend(*(id *)(a1 + 32), "removeObserver:forKeyPath:", *(_QWORD *)(a1 + 40), CFSTR("outstandingItemsCount"));
}

void __88___UIInternalDraggingSessionDestination_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  if (v1)
  {
    v2 = *(_QWORD *)(a1 + 40);
    v3 = v1;
    _UILocalizedFormat(CFSTR("dragging.dropAlertItemsRemaining"), (uint64_t)CFSTR("Drop alert message"), CFSTR("%lu items remaining"), v4, v5, v6, v7, v8, v2);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setMessage:", v9);

  }
}

uint64_t __78___UIInternalDraggingSessionDestination_dataTransferMonitorFinishedTransfers___block_invoke(uint64_t a1)
{
  id *v2;

  v2 = *(id **)(a1 + 32);
  if (v2[15])
  {
    objc_msgSend(v2[15], "hideAfterDelay:forceCompletion:replacementDismissalHandler:", 1, 0, 0.5);
    v2 = *(id **)(a1 + 32);
  }
  return objc_msgSend(v2, "_removeFromDragManager");
}

uint64_t __93___UIInternalDraggingSessionDestination_requestDropOnOwner_withOperation_perform_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "druidConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enableKeyboardIfNeeded");

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __73___UIInternalDraggingSessionDestination_setUpDropAnimation_layerContext___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[10];
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 80);
    *(_QWORD *)(v4 + 80) = 0;

    v2 = *(_QWORD **)(a1 + 32);
  }
  v6 = v2[11];
  if (v6)
  {
    (*(void (**)(void))(v6 + 16))();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 88);
    *(_QWORD *)(v7 + 88) = 0;

    v2 = *(_QWORD **)(a1 + 32);
  }
  v9 = (void *)v2[12];
  v2[12] = 0;

}

@end
