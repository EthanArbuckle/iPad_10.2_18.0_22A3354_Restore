@implementation PASCoalescingTimer

void __63___PASCoalescingTimer__replaceCoalescingTimerUsingLockWitness___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;

  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = a1[6] == *(_QWORD *)(a2 + 16);
  if (*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    v3 = *(_QWORD *)(a1[5] + 8);
    v4 = *(id *)(a2 + 48);
    v5 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v4;
    v8 = (id)a2;

    v6 = *(void **)(a2 + 48);
    *(_QWORD *)(a2 + 48) = 0;

    v7 = (void *)v8[3];
    v8[3] = 0;

  }
}

void __72___PASCoalescingTimer_processData_afterDelaySeconds_coalescingBehavior___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  id *v6;
  void *v7;
  uint64_t v8;
  id *v9;
  id *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id *v16;

  v16 = a2;
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 16))();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v16[6];
  v16[6] = (id)v3;

  v6 = v16 + 3;
  v5 = v16[3];
  v7 = *(void **)(a1 + 48);
  if (!v5)
  {
    v15 = v7;
    v11 = *v6;
    *v6 = v15;
    goto LABEL_14;
  }
  v8 = objc_msgSend(v5, "compare:", v7);
  if (v8 == -1)
    v9 = v16 + 3;
  else
    v9 = (id *)(a1 + 48);
  if (v8 == -1)
    v10 = (id *)(a1 + 48);
  else
    v10 = v16 + 3;
  v11 = *v9;
  v12 = *v10;
  v13 = v12;
  v14 = v11;
  if (!*(_BYTE *)(a1 + 56))
    goto LABEL_11;
  if (*(_BYTE *)(a1 + 56) == 1)
  {
    v14 = v12;
LABEL_11:
    objc_storeStrong(v6, v14);
  }

LABEL_14:
  objc_msgSend(*(id *)(a1 + 32), "_replaceCoalescingTimerUsingLockWitness:", v16);

}

void __63___PASCoalescingTimer__replaceCoalescingTimerUsingLockWitness___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  _QWORD v11[5];
  id v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3032000000;
    v11[3] = __Block_byref_object_copy__2262;
    v11[4] = __Block_byref_object_dispose__2263;
    v12 = 0;
    v7 = 0;
    v8 = &v7;
    v9 = 0x2020000000;
    v10 = 0;
    v4 = (void *)WeakRetained[5];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __63___PASCoalescingTimer__replaceCoalescingTimerUsingLockWitness___block_invoke_2;
    v6[3] = &unk_1E4430070;
    v5 = *(_QWORD *)(a1 + 40);
    v6[5] = v11;
    v6[6] = v5;
    v6[4] = &v7;
    objc_msgSend(v4, "runWithLockAcquired:", v6);
    if (*((_BYTE *)v8 + 24))
      (*(void (**)(void))(v3[4] + 16))();
    _Block_object_dispose(&v7, 8);
    _Block_object_dispose(v11, 8);

  }
}

void __46___PASCoalescingTimer_cancelPendingOperations__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = *((_QWORD *)v2 + 1);
  if (v3)
  {
    dispatch_source_cancel(v3);
    v4 = (void *)*((_QWORD *)v2 + 1);
  }
  else
  {
    v4 = 0;
  }
  *((_QWORD *)v2 + 1) = 0;

  v5 = (void *)*((_QWORD *)v2 + 3);
  ++*((_QWORD *)v2 + 2);
  *((_QWORD *)v2 + 3) = 0;

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = *((id *)v2 + 4);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        dispatch_source_cancel(*(dispatch_source_t *)(*((_QWORD *)&v12 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  objc_msgSend(*((id *)v2 + 4), "removeAllObjects", (_QWORD)v12);
  v11 = (void *)*((_QWORD *)v2 + 6);
  ++*((_QWORD *)v2 + 5);
  *((_QWORD *)v2 + 6) = 0;

}

void __59___PASCoalescingTimer_processData_afterStrictDelaySeconds___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  dispatch_source_t v6;
  void *v7;
  NSObject *v8;
  dispatch_time_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  NSObject *v15;
  id v16[2];
  id location;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 16))();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)*((_QWORD *)v3 + 6);
  *((_QWORD *)v3 + 6) = v4;

  v6 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 8));
  v7 = (void *)*((_QWORD *)v3 + 5);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __59___PASCoalescingTimer_processData_afterStrictDelaySeconds___block_invoke_2;
  v14 = &unk_1E4430020;
  objc_copyWeak(v16, &location);
  v16[1] = v7;
  v8 = v6;
  v15 = v8;
  dispatch_source_set_event_handler(v8, &v11);
  v9 = +[_PASDispatch dispatchTimeWithSecondsFromNow:](_PASDispatch, "dispatchTimeWithSecondsFromNow:", *(double *)(a1 + 48), v11, v12, v13, v14);
  if (v9 == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("_PASCoalescingTimer.m"), 149, CFSTR("delaySeconds is too large!"));

  }
  dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(*(double *)(*(_QWORD *)(a1 + 32) + 16) * 1000000000.0));
  dispatch_resume(v8);
  objc_msgSend(*((id *)v3 + 4), "addObject:", v8);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

}

void __59___PASCoalescingTimer_processData_afterStrictDelaySeconds___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__2262;
    v21 = __Block_byref_object_dispose__2263;
    v22 = 0;
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    v4 = (void *)WeakRetained[5];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __59___PASCoalescingTimer_processData_afterStrictDelaySeconds___block_invoke_17;
    v8[3] = &unk_1E442FFF8;
    v5 = *(_QWORD *)(a1 + 48);
    v11 = &v17;
    v12 = v5;
    v10 = &v13;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v4, "runWithLockAcquired:", v8);
    if (*((_BYTE *)v14 + 24))
      (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v3[4] + 16))(v3[4], v18[5], v6, v7);

    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v17, 8);

  }
}

void __59___PASCoalescingTimer_processData_afterStrictDelaySeconds___block_invoke_17(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id *v8;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a1[7] == *(_QWORD *)(a2 + 40);
  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    v4 = *(_QWORD *)(a1[6] + 8);
    v5 = *(id *)(a2 + 48);
    v6 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v5;
    v8 = (id *)(id)a2;

    v7 = *(void **)(a2 + 48);
    *(_QWORD *)(a2 + 48) = 0;

    objc_msgSend(v8[4], "removeObject:", a1[4]);
  }
}

@end
