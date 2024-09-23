@implementation UIDataTransferMonitor

void __30___UIDataTransferMonitor_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "cancelOutstandingRequests");
    WeakRetained = v2;
  }

}

uint64_t __58___UIDataTransferMonitor_setSuppressEventsUntilRequested___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 24) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __54___UIDataTransferMonitor_suppressEventsUntilRequested__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

void __58___UIDataTransferMonitor__transferQueue_sendBeganCallback__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(WeakRetained, "dataTransferMonitorBeganTransfers:", *(_QWORD *)(a1 + 32));

}

void __61___UIDataTransferMonitor__transferQueue_sendFinishedCallback__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(WeakRetained, "dataTransferMonitorFinishedTransfers:", *(_QWORD *)(a1 + 32));

}

uint64_t __41___UIDataTransferMonitor_totalItemsCount__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

_BYTE *__52___UIDataTransferMonitor_sendDelegateEventsIfNeeded__block_invoke(uint64_t a1)
{
  _BYTE *result;
  uint64_t v3;
  _BYTE *v4;
  int v5;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  result = *(_BYTE **)(a1 + 32);
  if (!result[26])
  {
    if (result[25])
    {
      result[25] = 0;
      result = (_BYTE *)objc_msgSend(*(id *)(a1 + 32), "_transferQueue_sendBeganCallback");
      v3 = *(_QWORD *)(a1 + 32);
      v5 = *(unsigned __int8 *)(v3 + 28);
      v4 = (_BYTE *)(v3 + 28);
      if (!v5)
        return result;
    }
    else
    {
      v4 = result + 28;
      if (!result[28])
      {
        objc_msgSend(result, "_transferQueue_sendBeganCallback");
        return (_BYTE *)objc_msgSend(*(id *)(a1 + 32), "_transferQueue_sendFinishedCallback");
      }
    }
    *v4 = 0;
    return (_BYTE *)objc_msgSend(*(id *)(a1 + 32), "_transferQueue_sendFinishedCallback");
  }
  return result;
}

void __34___UIDataTransferMonitor_progress__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

void __51___UIDataTransferMonitor_cancelOutstandingRequests__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v1 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v5), "progress", (_QWORD)v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "cancel");

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

void __81___UIDataTransferMonitor_itemProvider_beganDataTransferTransactionUUID_progress___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _UIDataTransferRequest *v4;

  v4 = objc_alloc_init(_UIDataTransferRequest);
  -[_UIDataTransferRequest setItemProvider:](v4, "setItemProvider:", *(_QWORD *)(a1 + 32));
  -[_UIDataTransferRequest setUUID:](v4, "setUUID:", *(_QWORD *)(a1 + 40));
  -[_UIDataTransferRequest setProgress:](v4, "setProgress:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 48), "addObject:", v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 8), "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 8), "setObject:forKeyedSubscript:", v3, v2);
  }
  objc_msgSend(v3, "addObject:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 16), "addObject:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 40), "addObject:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 48), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 56), CFSTR("fractionCompleted"), 1, 0);
  objc_msgSend(*(id *)(a1 + 56), "_transferQueue_recomputeMasterProgress");
  objc_msgSend(*(id *)(a1 + 56), "_transferQueue_scheduleBeganCallback");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 8), "count");

}

uint64_t __64___UIDataTransferMonitor__transferQueue_recomputeMasterProgress__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setTotalUnitCount:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", (uint64_t)(*(double *)(a1 + 48) * 100.0));
}

uint64_t __73___UIDataTransferMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_transferQueue_recomputeMasterProgress");
}

void __75___UIDataTransferMonitor_itemProvider_finishedDataTransferTransactionUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  objc_msgSend(*(id *)(a1 + 40), "_UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v6 = v3;
  v7 = v4;
  v8 = v5;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0x7FFFFFFFFFFFFFFFLL;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = ___indexOfDataTransferRequestMatching_block_invoke;
  v14[3] = &unk_1E16C4808;
  v9 = v7;
  v15 = v9;
  v10 = v8;
  v16 = v10;
  v17 = &v18;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v14);
  v11 = v19[3];

  _Block_object_dispose(&v18, 8);
  objc_msgSend(v6, "objectAtIndexedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "progress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObserver:forKeyPath:", *(_QWORD *)(a1 + 32), CFSTR("fractionCompleted"));

  objc_msgSend(v6, "removeObjectAtIndex:", v11);
  if (!objc_msgSend(v6, "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", v12);
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count"))
    objc_msgSend(*(id *)(a1 + 32), "_transferQueue_scheduleFinishedCallback");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");

}

uint64_t __75___UIDataTransferMonitor_itemProvider_finishedDataTransferTransactionUUID___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_transferQueue_scheduleFinishedCallback");
}

@end
