@implementation SBAVSystemControllerCache

- (void)_receiveUpdatedValueFromNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *queue;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  SBAVSystemControllerCache *v14;
  id v15;
  id v16;

  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  queue = self->_queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__SBAVSystemControllerCache__receiveUpdatedValueFromNotification___block_invoke;
  v12[3] = &unk_1E8E9F108;
  v13 = v5;
  v14 = self;
  v15 = v6;
  v16 = v7;
  v9 = v7;
  v10 = v6;
  v11 = v5;
  dispatch_async(queue, v12);

}

uint64_t __50__SBAVSystemControllerCache_isAudioSessionPlaying__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 98);
  return result;
}

void __47__SBAVSystemControllerCache_activeCategoryName__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 104));
}

- (NSString)activeCategoryName
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__27;
  v10 = __Block_byref_object_dispose__27;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__SBAVSystemControllerCache_activeCategoryName__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (BOOL)isAudioSessionPlaying
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__SBAVSystemControllerCache_isAudioSessionPlaying__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __171__SBAVSystemControllerCache__queue_updatePickableRoutesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return result;
}

- (void)_queue_updateAudioSessionPlayingFromNotification:(id)a3 allowingBackgroundQueries:(BOOL)a4 backgroundQueriesCancelledBlock:(id)a5 cancelBackgroundQueriesBlock:(id)a6 completion:(id)a7
{
  _BOOL4 v10;
  id v12;
  id v13;
  void (**v14)(_QWORD);
  id v15;
  uint64_t v16;
  id v17;
  void (**v18)(_QWORD, _QWORD);
  SBAVSystemControllerDataProviding *v19;
  SBAVSystemControllerDataProviding *v20;
  NSObject *backgroundQueryQueue;
  _QWORD block[4];
  SBAVSystemControllerDataProviding *v23;
  SBAVSystemControllerCache *v24;
  id v25;
  void (**v26)(_QWORD, _QWORD);
  _QWORD v27[5];
  id v28;
  BOOL v29;

  v10 = a4;
  v12 = a3;
  v13 = a5;
  v14 = (void (**)(_QWORD))a6;
  v15 = a7;
  v16 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __176__SBAVSystemControllerCache__queue_updateAudioSessionPlayingFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke;
  v27[3] = &unk_1E8EA8B68;
  v29 = v10;
  v27[4] = self;
  v17 = v15;
  v28 = v17;
  v18 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v27);
  if (v10)
  {
    if (!v12)
    {
      v20 = self->_queue_dataProvider;
      backgroundQueryQueue = self->_backgroundQueryQueue;
      block[0] = v16;
      block[1] = 3221225472;
      block[2] = __176__SBAVSystemControllerCache__queue_updateAudioSessionPlayingFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_55;
      block[3] = &unk_1E8EA8B18;
      v23 = v20;
      v24 = self;
      v25 = v13;
      v26 = v18;
      v19 = v20;
      dispatch_async(backgroundQueryQueue, block);

      goto LABEL_7;
    }
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D48278]);
    v19 = (SBAVSystemControllerDataProviding *)objc_claimAutoreleasedReturnValue();
    v14[2](v14);
  }
  else
  {
    -[SBAVSystemControllerDataProviding attributeForKey:](self->_queue_dataProvider, "attributeForKey:", *MEMORY[0x1E0D48060]);
    v19 = (SBAVSystemControllerDataProviding *)objc_claimAutoreleasedReturnValue();
  }
  ((void (**)(_QWORD, SBAVSystemControllerDataProviding *))v18)[2](v18, v19);
LABEL_7:

}

uint64_t __176__SBAVSystemControllerCache__queue_updateAudioSessionPlayingFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  void *v7;
  NSObject *v8;
  int v9;
  uint64_t result;
  _QWORD v11[5];
  char v12;
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a2, "count") != 0;
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 48))
  {
    if (*(unsigned __int8 *)(v4 + 98) != v3)
    {
      *(_BYTE *)(v4 + 98) = v3;
      SBLogAVSystemControllerCache();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 98);
        *(_DWORD *)buf = 67109120;
        v14 = v6;
        _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Updated audioSessionPlaying to %{BOOL}i", buf, 8u);
      }

      v7 = *(void **)(a1 + 32);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __176__SBAVSystemControllerCache__queue_updateAudioSessionPlayingFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_51;
      v11[3] = &unk_1E8EA8B40;
      v11[4] = v7;
      v12 = v3;
      objc_msgSend(v7, "_queue_notifyObserversWithBlock:", v11);
    }
  }
  else
  {
    *(_BYTE *)(v4 + 98) = v3;
    SBLogAVSystemControllerCache();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 98);
      *(_DWORD *)buf = 67109120;
      v14 = v9;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Initialized audioSessionPlaying to %{BOOL}i", buf, 8u);
    }

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __66__SBAVSystemControllerCache__receiveUpdatedValueFromNotification___block_invoke(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v8;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void (*v24)(_QWORD, uint64_t, _QWORD, _QWORD, void *, void *, _QWORD);
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = (uint64_t *)(a1 + 32);
  v6 = *(_QWORD *)(v4 + 56);
  if (v3 != v6 || v6 == 0)
  {
    v8 = *(_QWORD *)(v4 + 48);
    if (v3 != v8 || v8 == 0)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = objc_opt_class();
      v12 = *(_QWORD *)(a1 + 32);
      v13 = objc_opt_class();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("sender: <%@:%p>; data provider: <%@:%p>, output context: <%@:%p>"),
        v11,
        v12,
        v13,
        *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56),
        objc_opt_class(),
        *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      SBLogAVSystemControllerCache();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543618;
        v38 = v16;
        v39 = 2114;
        v40 = v14;
        _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "Ignoring notification '%{public}@' from %{public}@", buf, 0x16u);
      }
      goto LABEL_20;
    }
  }
  SBLogAVSystemControllerCache();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);

  SBLogAVSystemControllerCache();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v18)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      __66__SBAVSystemControllerCache__receiveUpdatedValueFromNotification___block_invoke_cold_1(a1, v5, v20);
  }
  else if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v21 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412290;
    v38 = v21;
    _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_INFO, "Notification '%@' received", buf, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v22;
  if (v22)
  {
    v23 = objc_msgSend(v22, "pointerValue");
    v24 = (void (*)(_QWORD, uint64_t, _QWORD, _QWORD, void *, void *, _QWORD))objc_msgSend(*(id *)(a1 + 40), "methodForSelector:", v23);
    v25 = *(id *)(*(_QWORD *)(a1 + 40) + 88);
    objc_msgSend(*(id *)(a1 + 40), "_queue_backgroundQueryCancellationSignalForNotificationCreatingIfNecessary:", *(_QWORD *)(a1 + 48));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __66__SBAVSystemControllerCache__receiveUpdatedValueFromNotification___block_invoke_89;
    v34[3] = &unk_1E8E9EA50;
    v35 = v26;
    v36 = v25;
    v15 = v25;
    v28 = v26;
    v29 = (void *)MEMORY[0x1D17E5550](v34);
    v32[0] = v27;
    v32[1] = 3221225472;
    v32[2] = __66__SBAVSystemControllerCache__receiveUpdatedValueFromNotification___block_invoke_2;
    v32[3] = &unk_1E8E9E820;
    v30 = *(void **)(a1 + 48);
    v32[4] = *(_QWORD *)(a1 + 40);
    v33 = v30;
    v31 = (void *)MEMORY[0x1D17E5550](v32);
    v24(*(_QWORD *)(a1 + 40), v23, *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 80), v29, v31, 0);

LABEL_20:
  }

}

- (id)_queue_backgroundQueryCancellationSignalForNotificationCreatingIfNecessary:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_notificationToBackgroundQueryCancellationSignalMap, "objectForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0D016C0]);
    -[NSMutableDictionary setObject:forKey:](self->_notificationToBackgroundQueryCancellationSignalMap, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (void)_queue_updateActiveCategoryNameFromNotification:(id)a3 allowingBackgroundQueries:(BOOL)a4 backgroundQueriesCancelledBlock:(id)a5 cancelBackgroundQueriesBlock:(id)a6 completion:(id)a7
{
  _BOOL4 v10;
  id v12;
  id v13;
  void (**v14)(_QWORD);
  id v15;
  uint64_t v16;
  id v17;
  void (**v18)(_QWORD, _QWORD);
  void *v19;
  SBAVSystemControllerDataProviding *v20;
  int v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  SBAVSystemControllerDataProviding *v26;
  NSObject *backgroundQueryQueue;
  SBAVSystemControllerDataProviding *v28;
  id v29;
  _QWORD block[4];
  SBAVSystemControllerDataProviding *v31;
  SBAVSystemControllerCache *v32;
  id v33;
  void (**v34)(_QWORD, _QWORD);
  _QWORD v35[5];
  id v36;
  BOOL v37;

  v10 = a4;
  v12 = a3;
  v13 = a5;
  v14 = (void (**)(_QWORD))a6;
  v15 = a7;
  v16 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __175__SBAVSystemControllerCache__queue_updateActiveCategoryNameFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke;
  v35[3] = &unk_1E8EA8BE0;
  v37 = v10;
  v35[4] = self;
  v17 = v15;
  v36 = v17;
  v18 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v35);
  if (v10)
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D47F70]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (SBAVSystemControllerDataProviding *)objc_msgSend(v19, "copy");

    if (v20)
    {
      v14[2](v14);
      ((void (**)(_QWORD, SBAVSystemControllerDataProviding *))v18)[2](v18, v20);
    }
    else
    {
      v26 = self->_queue_dataProvider;
      backgroundQueryQueue = self->_backgroundQueryQueue;
      block[0] = v16;
      block[1] = 3221225472;
      block[2] = __175__SBAVSystemControllerCache__queue_updateActiveCategoryNameFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_60;
      block[3] = &unk_1E8EA8B18;
      v31 = v26;
      v32 = self;
      v33 = v13;
      v34 = v18;
      v28 = v26;
      dispatch_async(backgroundQueryQueue, block);

    }
  }
  else
  {
    v20 = self->_queue_dataProvider;
    v29 = 0;
    v21 = -[SBAVSystemControllerDataProviding getActiveCategoryVolume:andName:](v20, "getActiveCategoryVolume:andName:", 0, &v29);
    v22 = v29;
    v23 = v22;
    if (!v21 || !v22)
    {
      SBLogAVSystemControllerCache();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[SBAVSystemControllerCache _queue_updateActiveCategoryNameFromNotification:allowingBackgroundQueries:backgroundQueriesCancelledBlock:cancelBackgroundQueriesBlock:completion:].cold.1();

    }
    v25 = (void *)objc_msgSend(v23, "copy");

    ((void (**)(_QWORD, void *))v18)[2](v18, v25);
  }

}

void __175__SBAVSystemControllerCache__queue_updateActiveCategoryNameFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (*(_BYTE *)(a1 + 48))
  {
    if ((BSEqualStrings() & 1) == 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), a2);
      SBLogAVSystemControllerCache();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
        *(_DWORD *)buf = 138412290;
        v18 = v10;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Updated activeCategoryName to %@", buf, 0xCu);
      }

      v11 = *(void **)(a1 + 32);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __175__SBAVSystemControllerCache__queue_updateActiveCategoryNameFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_56;
      v15[3] = &unk_1E8EA8BB8;
      v15[4] = v11;
      v16 = v4;
      objc_msgSend(v11, "_queue_notifyObserversWithBlock:", v15);

    }
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), a2);
    SBLogAVSystemControllerCache();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
      *(_DWORD *)buf = 138412290;
      v18 = v13;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "Initialized activeCategoryName to %@", buf, 0xCu);
    }

  }
  v14 = *(_QWORD *)(a1 + 40);
  if (v14)
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 16))(v14, v5, v6, v7, v8);

}

uint64_t __66__SBAVSystemControllerCache__receiveUpdatedValueFromNotification___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_signalBackgroundQueryCancellationForNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_signalBackgroundQueryCancellationForNotification:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[NSMutableDictionary objectForKey:](self->_notificationToBackgroundQueryCancellationSignalMap, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "signal");
    -[NSMutableDictionary removeObjectForKey:](self->_notificationToBackgroundQueryCancellationSignalMap, "removeObjectForKey:", v6);
  }

}

- (void)_queue_updatePickableRoutesFromNotification:(id)a3 allowingBackgroundQueries:(BOOL)a4 backgroundQueriesCancelledBlock:(id)a5 cancelBackgroundQueriesBlock:(id)a6 completion:(id)a7
{
  _BOOL4 v8;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void (**v14)(_QWORD, _QWORD);
  SBAVSystemControllerDataProviding *queue_dataProvider;
  SBAVSystemControllerDataProviding *v16;
  NSObject *backgroundQueryQueue;
  SBAVSystemControllerDataProviding *v18;
  void *v19;
  _QWORD block[4];
  SBAVSystemControllerDataProviding *v21;
  SBAVSystemControllerCache *v22;
  id v23;
  void (**v24)(_QWORD, _QWORD);
  _QWORD v25[5];
  id v26;
  BOOL v27;

  v8 = a4;
  v10 = a5;
  v11 = a7;
  v12 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __171__SBAVSystemControllerCache__queue_updatePickableRoutesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke;
  v25[3] = &unk_1E8EA8B68;
  v27 = v8;
  v25[4] = self;
  v13 = v11;
  v26 = v13;
  v14 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v25);
  queue_dataProvider = self->_queue_dataProvider;
  if (v8)
  {
    v16 = queue_dataProvider;
    backgroundQueryQueue = self->_backgroundQueryQueue;
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = __171__SBAVSystemControllerCache__queue_updatePickableRoutesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_76;
    block[3] = &unk_1E8EA8B18;
    v21 = v16;
    v22 = self;
    v23 = v10;
    v24 = v14;
    v18 = v16;
    dispatch_async(backgroundQueryQueue, block);

  }
  else
  {
    -[SBAVSystemControllerDataProviding attributeForKey:](queue_dataProvider, "attributeForKey:", *MEMORY[0x1E0D48030]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (SBAVSystemControllerDataProviding *)objc_msgSend(v19, "copy");

    ((void (**)(_QWORD, SBAVSystemControllerDataProviding *))v14)[2](v14, v18);
  }

}

- (void)_queue_notifyObserversWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *callOutQueue;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  -[NSHashTable allObjects](self->_queue_observers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  callOutQueue = self->_callOutQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__SBAVSystemControllerCache__queue_notifyObserversWithBlock___block_invoke;
  v10[3] = &unk_1E8EA02D8;
  v11 = v6;
  v12 = v4;
  v8 = v4;
  v9 = v6;
  dispatch_async(callOutQueue, v10);

}

void __61__SBAVSystemControllerCache__queue_notifyObserversWithBlock___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __171__SBAVSystemControllerCache__queue_updatePickableRoutesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[5];
  id v33;
  uint8_t buf[16];

  v4 = a2;
  v5 = a1 + 32;
  if (*(_BYTE *)(a1 + 48))
  {
    if ((BSEqualObjects() & 1) == 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)v5 + 128), a2);
      SBLogAVSystemControllerCache();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);

      SBLogAVSystemControllerCache();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v11)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          __171__SBAVSystemControllerCache__queue_updatePickableRoutesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_cold_2(a1 + 32, v13, v14, v15, v16, v17, v18, v19);
      }
      else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "Updated pickableRoutes", buf, 2u);
      }

      v30 = *(void **)v5;
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __171__SBAVSystemControllerCache__queue_updatePickableRoutesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_73;
      v32[3] = &unk_1E8EA8BB8;
      v32[4] = v30;
      v33 = v4;
      objc_msgSend(v30, "_queue_notifyObserversWithBlock:", v32);

    }
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 128), a2);
    SBLogAVSystemControllerCache();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);

    SBLogAVSystemControllerCache();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v21)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        __171__SBAVSystemControllerCache__queue_updatePickableRoutesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_cold_1(a1 + 32, v23, v24, v25, v26, v27, v28, v29);
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v23, OS_LOG_TYPE_DEFAULT, "Initialized pickableRoutes", buf, 2u);
    }

  }
  v31 = *(_QWORD *)(a1 + 40);
  if (v31)
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v31 + 16))(v31, v6, v7, v8, v9);

}

- (SBAVSystemControllerCache)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAVSystemControllerCache.m"), 54, CFSTR("-init is not allowed on SBAVSystemControllerCache"));

  return 0;
}

- (SBAVSystemControllerCache)initWithCallOutQueue:(id)a3 notificationCenter:(id)a4 dataProviderInitializer:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBAVSystemControllerCache *v12;
  SBAVSystemControllerCache *v13;
  uint64_t v14;
  id dataProviderInitializer;
  uint64_t v16;
  NSHashTable *queue_observers;
  uint64_t Serial;
  OS_dispatch_queue *queue;
  uint64_t v20;
  NSMutableDictionary *notificationToHandlerMap;
  uint64_t v22;
  NSMutableDictionary *notificationToBackgroundQueryCancellationSignalMap;
  void *v24;
  uint64_t v25;
  OS_dispatch_queue *backgroundQueryQueue;
  NSObject *v27;
  dispatch_block_t v28;
  _QWORD block[4];
  SBAVSystemControllerCache *v31;
  uint8_t buf[16];
  objc_super v33;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v33.receiver = self;
  v33.super_class = (Class)SBAVSystemControllerCache;
  v12 = -[SBAVSystemControllerCache init](&v33, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_callOutQueue, a3);
    objc_storeStrong((id *)&v13->_notificationCenter, a4);
    v14 = objc_msgSend(v11, "copy");
    dataProviderInitializer = v13->_dataProviderInitializer;
    v13->_dataProviderInitializer = (id)v14;

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v16 = objc_claimAutoreleasedReturnValue();
    queue_observers = v13->_queue_observers;
    v13->_queue_observers = (NSHashTable *)v16;

    Serial = BSDispatchQueueCreateSerial();
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)Serial;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v20 = objc_claimAutoreleasedReturnValue();
    notificationToHandlerMap = v13->_notificationToHandlerMap;
    v13->_notificationToHandlerMap = (NSMutableDictionary *)v20;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v22 = objc_claimAutoreleasedReturnValue();
    notificationToBackgroundQueryCancellationSignalMap = v13->_notificationToBackgroundQueryCancellationSignalMap;
    v13->_notificationToBackgroundQueryCancellationSignalMap = (NSMutableDictionary *)v22;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = BSDispatchQueueCreateWithQualityOfService();
    backgroundQueryQueue = v13->_backgroundQueryQueue;
    v13->_backgroundQueryQueue = (OS_dispatch_queue *)v25;

    SBLogAVSystemControllerCache();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v27, OS_LOG_TYPE_DEFAULT, "Creating SBAVSystemControllerCache", buf, 2u);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __93__SBAVSystemControllerCache_initWithCallOutQueue_notificationCenter_dataProviderInitializer___block_invoke;
    block[3] = &unk_1E8E9DED8;
    v31 = v13;
    v28 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
    dispatch_async((dispatch_queue_t)v13->_queue, v28);

  }
  return v13;
}

void __93__SBAVSystemControllerCache_initWithCallOutQueue_notificationCenter_dataProviderInitializer___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;

  objc_msgSend(MEMORY[0x1E0C8B2B0], "sharedAudioPresentationOutputContext");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 144) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "supportsMultipleOutputDevices");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", sel__queue_updateFullyMutedFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D47FB8]);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", sel__queue_updateRingerMutedFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D48218]);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", sel__queue_updateAudioSessionPlayingFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D48270]);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", sel__queue_updateAirplayDisplayActiveFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D47F98]);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", sel__queue_updateActiveCategoryNameFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D48228]);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", sel__queue_updateActiveCategoryNameFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion_);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D47F68]);

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 144))
    v11 = (id *)MEMORY[0x1E0C8AB40];
  else
    v11 = (id *)MEMORY[0x1E0C8AB30];
  v12 = (void *)MEMORY[0x1E0CB3B18];
  v13 = *v11;
  objc_msgSend(v12, "valueWithPointer:", sel__queue_updateActiveOutputDevicesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion_);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKeyedSubscript:", v14, v13);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", sel__queue_updateActiveAudioRouteFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion_);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D47E48]);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", sel__queue_updatePickableRoutesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion_);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D48048]);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__serverDied_, *MEMORY[0x1E0D48200], 0);
  v17 = *(_QWORD **)(a1 + 32);
  v18 = (void *)v17[8];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __93__SBAVSystemControllerCache_initWithCallOutQueue_notificationCenter_dataProviderInitializer___block_invoke_2;
  v20[3] = &unk_1E8EA8A68;
  v21 = v17;
  objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v20);
  v19 = *(void **)(a1 + 32);

  objc_msgSend(v19, "_queue_rebuildCache");
}

uint64_t __93__SBAVSystemControllerCache_initWithCallOutQueue_notificationCenter_dataProviderInitializer___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__receiveUpdatedValueFromNotification_, a2, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[NSNotificationCenter removeObserver:](self->_notificationCenter, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBAVSystemControllerCache;
  -[SBAVSystemControllerCache dealloc](&v3, sel_dealloc);
}

+ (SBAVSystemControllerCache)sharedInstance
{
  if (sharedInstance_onceToken_10 != -1)
    dispatch_once(&sharedInstance_onceToken_10, &__block_literal_global_99);
  return (SBAVSystemControllerCache *)(id)sharedInstance___sharedInstance_7;
}

void __43__SBAVSystemControllerCache_sharedInstance__block_invoke()
{
  SBAVSystemControllerCache *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [SBAVSystemControllerCache alloc];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[SBAVSystemControllerCache initWithCallOutQueue:notificationCenter:dataProviderInitializer:](v0, "initWithCallOutQueue:notificationCenter:dataProviderInitializer:", MEMORY[0x1E0C80D38], v3, &__block_literal_global_37_1);
  v2 = (void *)sharedInstance___sharedInstance_7;
  sharedInstance___sharedInstance_7 = v1;

}

uint64_t __43__SBAVSystemControllerCache_sharedInstance__block_invoke_2()
{
  return objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
}

- (void)addObserver:(id)a3
{
  id v5;
  NSObject *queue;
  id v7;
  void *v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAVSystemControllerCache.m"), 123, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__SBAVSystemControllerCache_addObserver___block_invoke;
  block[3] = &unk_1E8E9E820;
  block[4] = self;
  v10 = v5;
  v7 = v5;
  dispatch_async(queue, block);

}

uint64_t __41__SBAVSystemControllerCache_addObserver___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "containsObject:", *(_QWORD *)(a1 + 40));
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", *(_QWORD *)(a1 + 40));
  return result;
}

- (BOOL)isFullyMuted
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__SBAVSystemControllerCache_isFullyMuted__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __41__SBAVSystemControllerCache_isFullyMuted__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 96);
  return result;
}

- (BOOL)isRingerMuted
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__SBAVSystemControllerCache_isRingerMuted__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__SBAVSystemControllerCache_isRingerMuted__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 97);
  return result;
}

- (BOOL)isAirplayDisplayActive
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__SBAVSystemControllerCache_isAirplayDisplayActive__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __51__SBAVSystemControllerCache_isAirplayDisplayActive__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 99);
  return result;
}

- (NSString)activeAudioRoute
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__27;
  v10 = __Block_byref_object_dispose__27;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__SBAVSystemControllerCache_activeAudioRoute__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __45__SBAVSystemControllerCache_activeAudioRoute__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 112));
}

- (NSDictionary)activeAudioRouteInfo
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__27;
  v10 = __Block_byref_object_dispose__27;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__SBAVSystemControllerCache_activeAudioRouteInfo__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __49__SBAVSystemControllerCache_activeAudioRouteInfo__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 120));
}

- (NSArray)pickableRoutes
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__27;
  v10 = __Block_byref_object_dispose__27;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__SBAVSystemControllerCache_pickableRoutes__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __43__SBAVSystemControllerCache_pickableRoutes__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 128));
}

- (NSArray)activeOutputDevices
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__27;
  v10 = __Block_byref_object_dispose__27;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__SBAVSystemControllerCache_activeOutputDevices__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __48__SBAVSystemControllerCache_activeOutputDevices__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 136));
}

- (void)fetchPickableRoutesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __63__SBAVSystemControllerCache_fetchPickableRoutesWithCompletion___block_invoke;
    v7[3] = &unk_1E8EA02D8;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

void __63__SBAVSystemControllerCache_fetchPickableRoutesWithCompletion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 128);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__SBAVSystemControllerCache_fetchPickableRoutesWithCompletion___block_invoke_2;
  v6[3] = &unk_1E8E9F1E8;
  v7 = v2;
  v8 = v3;
  v5 = v2;
  dispatch_async(v4, v6);

}

uint64_t __63__SBAVSystemControllerCache_fetchPickableRoutesWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (OS_dispatch_workloop)avscOperationsWorkloop
{
  OS_dispatch_workloop *avscOperationsWorkloop;
  NSObject *inactive;
  OS_dispatch_workloop *v5;

  avscOperationsWorkloop = self->_avscOperationsWorkloop;
  if (!avscOperationsWorkloop)
  {
    inactive = dispatch_workloop_create_inactive("SBAVSystemControllerCache.AVSCOperations");
    dispatch_workloop_set_autorelease_frequency(inactive, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_activate(inactive);
    v5 = self->_avscOperationsWorkloop;
    self->_avscOperationsWorkloop = (OS_dispatch_workloop *)inactive;

    avscOperationsWorkloop = self->_avscOperationsWorkloop;
  }
  return avscOperationsWorkloop;
}

- (void)_queue_updateFullyMutedFromNotification:(id)a3 allowingBackgroundQueries:(BOOL)a4 backgroundQueriesCancelledBlock:(id)a5 cancelBackgroundQueriesBlock:(id)a6 completion:(id)a7
{
  _BOOL4 v10;
  id v12;
  id v13;
  void (**v14)(_QWORD);
  id v15;
  uint64_t v16;
  id v17;
  void (**v18)(_QWORD, _QWORD);
  void *v19;
  uint64_t v20;
  void *v21;
  SBAVSystemControllerDataProviding *v22;
  NSObject *backgroundQueryQueue;
  SBAVSystemControllerDataProviding *v24;
  _QWORD block[4];
  SBAVSystemControllerDataProviding *v26;
  SBAVSystemControllerCache *v27;
  id v28;
  void (**v29)(_QWORD, _QWORD);
  _QWORD v30[5];
  id v31;
  BOOL v32;

  v10 = a4;
  v12 = a3;
  v13 = a5;
  v14 = (void (**)(_QWORD))a6;
  v15 = a7;
  v16 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __167__SBAVSystemControllerCache__queue_updateFullyMutedFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke;
  v30[3] = &unk_1E8EA6868;
  v32 = v10;
  v30[4] = self;
  v17 = v15;
  v31 = v17;
  v18 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v30);
  if (v10)
  {
    if (!v12)
    {
      v22 = self->_queue_dataProvider;
      backgroundQueryQueue = self->_backgroundQueryQueue;
      block[0] = v16;
      block[1] = 3221225472;
      block[2] = __167__SBAVSystemControllerCache__queue_updateFullyMutedFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_45;
      block[3] = &unk_1E8EA8B18;
      v26 = v22;
      v27 = self;
      v28 = v13;
      v29 = v18;
      v24 = v22;
      dispatch_async(backgroundQueryQueue, block);

      goto LABEL_7;
    }
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D47EA8]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "BOOLValue");

    v14[2](v14);
  }
  else
  {
    -[SBAVSystemControllerDataProviding attributeForKey:](self->_queue_dataProvider, "attributeForKey:", *MEMORY[0x1E0D47FA8]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v21, "BOOLValue");

  }
  v18[2](v18, v20);
LABEL_7:

}

uint64_t __167__SBAVSystemControllerCache__queue_updateFullyMutedFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  const char *v6;
  int v7;
  uint64_t result;
  int v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 48))
  {
    if (*(unsigned __int8 *)(v3 + 96) == (_DWORD)a2)
      goto LABEL_9;
    *(_BYTE *)(v3 + 96) = a2;
    SBLogAVSystemControllerCache();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 96);
      v9 = 67109120;
      v10 = v5;
      v6 = "Updated fullyMuted to %{BOOL}i";
LABEL_7:
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, 8u);
    }
  }
  else
  {
    *(_BYTE *)(v3 + 96) = a2;
    SBLogAVSystemControllerCache();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 96);
      v9 = 67109120;
      v10 = v7;
      v6 = "Initialized fullyMuted to %{BOOL}i";
      goto LABEL_7;
    }
  }

LABEL_9:
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void __167__SBAVSystemControllerCache__queue_updateFullyMutedFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_45(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  id v8;
  char v9;

  objc_msgSend(*(id *)(a1 + 32), "attributeForKey:", *MEMORY[0x1E0D47FA8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  v4 = *(void **)(a1 + 48);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __167__SBAVSystemControllerCache__queue_updateFullyMutedFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_2;
  block[3] = &unk_1E8EA8AF0;
  v7 = v4;
  v8 = *(id *)(a1 + 56);
  v9 = v3;
  dispatch_async(v5, block);

}

uint64_t __167__SBAVSystemControllerCache__queue_updateFullyMutedFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

- (void)_queue_updateRingerMutedFromNotification:(id)a3 allowingBackgroundQueries:(BOOL)a4 backgroundQueriesCancelledBlock:(id)a5 cancelBackgroundQueriesBlock:(id)a6 completion:(id)a7
{
  _BOOL4 v10;
  id v12;
  id v13;
  void (**v14)(_QWORD);
  id v15;
  uint64_t v16;
  id v17;
  void (**v18)(_QWORD, _QWORD);
  void *v19;
  uint64_t v20;
  void *v21;
  SBAVSystemControllerDataProviding *v22;
  NSObject *backgroundQueryQueue;
  SBAVSystemControllerDataProviding *v24;
  _QWORD block[4];
  SBAVSystemControllerDataProviding *v26;
  SBAVSystemControllerCache *v27;
  id v28;
  void (**v29)(_QWORD, _QWORD);
  _QWORD v30[5];
  id v31;
  BOOL v32;

  v10 = a4;
  v12 = a3;
  v13 = a5;
  v14 = (void (**)(_QWORD))a6;
  v15 = a7;
  v16 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __168__SBAVSystemControllerCache__queue_updateRingerMutedFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke;
  v30[3] = &unk_1E8EA6868;
  v32 = v10;
  v30[4] = self;
  v17 = v15;
  v31 = v17;
  v18 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v30);
  if (v10)
  {
    if (!v12)
    {
      v22 = self->_queue_dataProvider;
      backgroundQueryQueue = self->_backgroundQueryQueue;
      block[0] = v16;
      block[1] = 3221225472;
      block[2] = __168__SBAVSystemControllerCache__queue_updateRingerMutedFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_50;
      block[3] = &unk_1E8EA8B18;
      v26 = v22;
      v27 = self;
      v28 = v13;
      v29 = v18;
      v24 = v22;
      dispatch_async(backgroundQueryQueue, block);

      goto LABEL_7;
    }
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D48220]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "BOOLValue");

    v14[2](v14);
  }
  else
  {
    -[SBAVSystemControllerDataProviding attributeForKey:](self->_queue_dataProvider, "attributeForKey:", *MEMORY[0x1E0D48210]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v21, "BOOLValue");

  }
  v18[2](v18, v20);
LABEL_7:

}

uint64_t __168__SBAVSystemControllerCache__queue_updateRingerMutedFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke(uint64_t a1, int a2)
{
  char v2;
  uint64_t v4;
  NSObject *v5;
  int v6;
  void *v7;
  NSObject *v8;
  int v9;
  uint64_t result;
  _QWORD v11[5];
  char v12;
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v2 = a2;
  v15 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 48))
  {
    if (*(unsigned __int8 *)(v4 + 97) != a2)
    {
      *(_BYTE *)(v4 + 97) = a2;
      SBLogAVSystemControllerCache();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 97);
        *(_DWORD *)buf = 67109120;
        v14 = v6;
        _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Updated ringerMuted to %{BOOL}i", buf, 8u);
      }

      v7 = *(void **)(a1 + 32);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __168__SBAVSystemControllerCache__queue_updateRingerMutedFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_46;
      v11[3] = &unk_1E8EA8B40;
      v11[4] = v7;
      v12 = v2;
      objc_msgSend(v7, "_queue_notifyObserversWithBlock:", v11);
    }
  }
  else
  {
    *(_BYTE *)(v4 + 97) = a2;
    SBLogAVSystemControllerCache();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 97);
      *(_DWORD *)buf = 67109120;
      v14 = v9;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Initialized ringerMuted to %{BOOL}i", buf, 8u);
    }

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __168__SBAVSystemControllerCache__queue_updateRingerMutedFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_46(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "cache:didUpdateRingerMuted:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

void __168__SBAVSystemControllerCache__queue_updateRingerMutedFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_50(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  id v8;
  char v9;

  objc_msgSend(*(id *)(a1 + 32), "attributeForKey:", *MEMORY[0x1E0D48210]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  v4 = *(void **)(a1 + 48);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __168__SBAVSystemControllerCache__queue_updateRingerMutedFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_2;
  block[3] = &unk_1E8EA8AF0;
  v7 = v4;
  v8 = *(id *)(a1 + 56);
  v9 = v3;
  dispatch_async(v5, block);

}

uint64_t __168__SBAVSystemControllerCache__queue_updateRingerMutedFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

void __176__SBAVSystemControllerCache__queue_updateAudioSessionPlayingFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_51(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "cache:didUpdateAudioSessionPlaying:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

void __176__SBAVSystemControllerCache__queue_updateAudioSessionPlayingFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_55(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "attributeForKey:", *MEMORY[0x1E0D48060]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 48);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __176__SBAVSystemControllerCache__queue_updateAudioSessionPlayingFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_2;
  block[3] = &unk_1E8EA8B90;
  v8 = v3;
  v9 = *(id *)(a1 + 56);
  v7 = v2;
  v5 = v2;
  dispatch_async(v4, block);

}

uint64_t __176__SBAVSystemControllerCache__queue_updateAudioSessionPlayingFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return result;
}

void __175__SBAVSystemControllerCache__queue_updateActiveCategoryNameFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_56(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "cache:didUpdateActiveCategoryName:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __175__SBAVSystemControllerCache__queue_updateActiveCategoryNameFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_60(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v2 = *(void **)(a1 + 32);
  v16 = 0;
  v3 = objc_msgSend(v2, "getActiveCategoryVolume:andName:", 0, &v16);
  v4 = v16;
  v5 = v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (v6)
  {
    SBLogAVSystemControllerCache();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __175__SBAVSystemControllerCache__queue_updateActiveCategoryNameFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_60_cold_1();

  }
  v8 = (void *)objc_msgSend(v5, "copy");

  v9 = *(void **)(a1 + 48);
  v10 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __175__SBAVSystemControllerCache__queue_updateActiveCategoryNameFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_61;
  v12[3] = &unk_1E8EA8B90;
  v14 = v9;
  v15 = *(id *)(a1 + 56);
  v13 = v8;
  v11 = v8;
  dispatch_async(v10, v12);

}

uint64_t __175__SBAVSystemControllerCache__queue_updateActiveCategoryNameFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_61(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return result;
}

- (void)_queue_updateActiveAudioRouteFromNotification:(id)a3 allowingBackgroundQueries:(BOOL)a4 backgroundQueriesCancelledBlock:(id)a5 cancelBackgroundQueriesBlock:(id)a6 completion:(id)a7
{
  _BOOL4 v8;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  SBAVSystemControllerDataProviding *queue_dataProvider;
  SBAVSystemControllerDataProviding *v16;
  NSObject *backgroundQueryQueue;
  SBAVSystemControllerDataProviding *v18;
  SBAVSystemControllerDataProviding *v19;
  void *v20;
  void *v21;
  _QWORD block[4];
  SBAVSystemControllerDataProviding *v23;
  SBAVSystemControllerCache *v24;
  id v25;
  void (**v26)(_QWORD, _QWORD, _QWORD);
  _QWORD v27[5];
  id v28;
  BOOL v29;

  v8 = a4;
  v10 = a5;
  v11 = a7;
  v12 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __173__SBAVSystemControllerCache__queue_updateActiveAudioRouteFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke;
  v27[3] = &unk_1E8EA8C30;
  v29 = v8;
  v27[4] = self;
  v13 = v11;
  v28 = v13;
  v14 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17E5550](v27);
  queue_dataProvider = self->_queue_dataProvider;
  if (v8)
  {
    v16 = queue_dataProvider;
    backgroundQueryQueue = self->_backgroundQueryQueue;
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = __173__SBAVSystemControllerCache__queue_updateActiveAudioRouteFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_68;
    block[3] = &unk_1E8EA8B18;
    v23 = v16;
    v24 = self;
    v25 = v10;
    v26 = v14;
    v18 = v16;
    dispatch_async(backgroundQueryQueue, block);

    v19 = v23;
  }
  else
  {
    -[SBAVSystemControllerDataProviding attributeForKey:](queue_dataProvider, "attributeForKey:", *MEMORY[0x1E0D47E40]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (SBAVSystemControllerDataProviding *)objc_msgSend(v20, "copy");

    -[SBAVSystemControllerDataProviding attributeForKey:](self->_queue_dataProvider, "attributeForKey:", *MEMORY[0x1E0D48050]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (SBAVSystemControllerDataProviding *)objc_msgSend(v21, "copy");

    ((void (**)(_QWORD, SBAVSystemControllerDataProviding *, SBAVSystemControllerDataProviding *))v14)[2](v14, v18, v19);
  }

}

void __173__SBAVSystemControllerCache__queue_updateActiveAudioRouteFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = a1 + 32;
  if (!*(_BYTE *)(a1 + 48))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 112), a2);
    objc_storeStrong((id *)(*(_QWORD *)v8 + 120), a3);
    SBLogAVSystemControllerCache();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);

    SBLogAVSystemControllerCache();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v18)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        __173__SBAVSystemControllerCache__queue_updateActiveAudioRouteFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_cold_1();
    }
    else if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v25 = *(_QWORD *)(*(_QWORD *)v8 + 112);
      *(_DWORD *)buf = 138412290;
      v31 = v25;
      _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEFAULT, "Initialized activeAudioRoute (and attributes) to %@", buf, 0xCu);
    }
    goto LABEL_13;
  }
  if (!BSEqualStrings() || (BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)v8 + 112), a2);
    objc_storeStrong((id *)(*(_QWORD *)v8 + 120), a3);
    SBLogAVSystemControllerCache();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);

    SBLogAVSystemControllerCache();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        __173__SBAVSystemControllerCache__queue_updateActiveAudioRouteFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_cold_2();
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v21 = *(_QWORD *)(*(_QWORD *)v8 + 112);
      *(_DWORD *)buf = 138412290;
      v31 = v21;
      _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "Updated activeAudioRoute (and attributes) to %@", buf, 0xCu);
    }

    v22 = *(id *)(*(_QWORD *)v8 + 136);
    v23 = *(void **)v8;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __173__SBAVSystemControllerCache__queue_updateActiveAudioRouteFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_62;
    v26[3] = &unk_1E8EA8C08;
    v26[4] = v23;
    v27 = v6;
    v28 = v7;
    v29 = v22;
    v20 = v22;
    objc_msgSend(v23, "_queue_notifyObserversWithBlock:", v26);

LABEL_13:
  }
  v24 = *(_QWORD *)(a1 + 40);
  if (v24)
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 16))(v24, v9, v10, v11, v12);

}

void __173__SBAVSystemControllerCache__queue_updateActiveAudioRouteFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_62(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "cache:didUpdateActiveAudioRoutingWithRoute:routeAttributes:activeOutputDevices:", a1[4], a1[5], a1[6], a1[7]);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "cache:didUpdateActiveAudioRoute:", a1[4], a1[5]);
  }

}

void __173__SBAVSystemControllerCache__queue_updateActiveAudioRouteFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_68(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "attributeForKey:", *MEMORY[0x1E0D47E40]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  objc_msgSend(*(id *)(a1 + 32), "attributeForKey:", *MEMORY[0x1E0D48050]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = *(void **)(a1 + 48);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __173__SBAVSystemControllerCache__queue_updateActiveAudioRouteFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_2;
  v10[3] = &unk_1E8EA8C58;
  v13 = v6;
  v14 = *(id *)(a1 + 56);
  v11 = v3;
  v12 = v5;
  v8 = v5;
  v9 = v3;
  dispatch_async(v7, v10);

}

uint64_t __173__SBAVSystemControllerCache__queue_updateActiveAudioRouteFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return result;
}

- (void)_queue_updateActiveOutputDevicesFromNotification:(id)a3 allowingBackgroundQueries:(BOOL)a4 backgroundQueriesCancelledBlock:(id)a5 cancelBackgroundQueriesBlock:(id)a6 completion:(id)a7
{
  _BOOL4 v8;
  id v10;
  id v11;
  NSArray *v12;
  uint64_t v13;
  NSArray *v14;
  id v15;
  void (**v16)(_QWORD, _QWORD);
  AVOutputContext *queue_outputContext;
  AVOutputContext *v18;
  NSObject *backgroundQueryQueue;
  AVOutputContext *v20;
  _QWORD v21[5];
  AVOutputContext *v22;
  id v23;
  void (**v24)(_QWORD, _QWORD);
  _QWORD v25[4];
  NSArray *v26;
  SBAVSystemControllerCache *v27;
  id v28;
  BOOL v29;

  v8 = a4;
  v10 = a5;
  v11 = a7;
  v12 = self->_queue_activeOutputDevices;
  v13 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __176__SBAVSystemControllerCache__queue_updateActiveOutputDevicesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke;
  v25[3] = &unk_1E8EA8C80;
  v29 = v8;
  v14 = v12;
  v26 = v14;
  v27 = self;
  v15 = v11;
  v28 = v15;
  v16 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v25);
  queue_outputContext = self->_queue_outputContext;
  if (v8)
  {
    v18 = queue_outputContext;
    backgroundQueryQueue = self->_backgroundQueryQueue;
    v21[0] = v13;
    v21[1] = 3221225472;
    v21[2] = __176__SBAVSystemControllerCache__queue_updateActiveOutputDevicesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_72;
    v21[3] = &unk_1E8EA8B18;
    v21[4] = self;
    v22 = v18;
    v23 = v10;
    v24 = v16;
    v20 = v18;
    dispatch_async(backgroundQueryQueue, v21);

  }
  else
  {
    -[SBAVSystemControllerCache _queryActiveOutputDevicesFromContext:](self, "_queryActiveOutputDevicesFromContext:", queue_outputContext);
    v20 = (AVOutputContext *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, AVOutputContext *))v16)[2](v16, v20);
  }

}

void __176__SBAVSystemControllerCache__queue_updateActiveOutputDevicesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  uint8_t buf[16];

  v4 = a2;
  if (*(_BYTE *)(a1 + 56))
  {
    if ((BSEqualObjects() & 1) != 0)
      goto LABEL_15;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 136), a2);
    SBLogAVSystemControllerCache();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);

    SBLogAVSystemControllerCache();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __176__SBAVSystemControllerCache__queue_updateActiveOutputDevicesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_cold_2();
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "Updated activeOutputDevices", buf, 2u);
    }

    v17 = *(id *)(*(_QWORD *)(a1 + 40) + 112);
    v18 = *(id *)(*(_QWORD *)(a1 + 40) + 120);
    v19 = *(void **)(a1 + 40);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __176__SBAVSystemControllerCache__queue_updateActiveOutputDevicesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_69;
    v22[3] = &unk_1E8EA8C08;
    v22[4] = v19;
    v23 = v17;
    v24 = v18;
    v25 = v4;
    v20 = v18;
    v16 = v17;
    objc_msgSend(v19, "_queue_notifyObserversWithBlock:", v22);

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 136), a2);
    SBLogAVSystemControllerCache();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);

    SBLogAVSystemControllerCache();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        __176__SBAVSystemControllerCache__queue_updateActiveOutputDevicesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_cold_1();
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "Initialized activeOutputDevices", buf, 2u);
    }
  }

LABEL_15:
  v21 = *(_QWORD *)(a1 + 48);
  if (v21)
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 16))(v21, v5, v6, v7, v8);

}

void __176__SBAVSystemControllerCache__queue_updateActiveOutputDevicesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_69(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "cache:didUpdateActiveAudioRoutingWithRoute:routeAttributes:activeOutputDevices:", a1[4], a1[5], a1[6], a1[7]);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "cache:didUpdateActiveOutputDevices:", a1[4], a1[7]);
  }

}

void __176__SBAVSystemControllerCache__queue_updateActiveOutputDevicesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_72(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_queryActiveOutputDevicesFromContext:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __176__SBAVSystemControllerCache__queue_updateActiveOutputDevicesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_2;
  block[3] = &unk_1E8EA8B90;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v6 = v2;
  v4 = v2;
  dispatch_async(v3, block);

}

uint64_t __176__SBAVSystemControllerCache__queue_updateActiveOutputDevicesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return result;
}

void __171__SBAVSystemControllerCache__queue_updatePickableRoutesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_73(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "cache:didUpdatePickableRoutes:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __171__SBAVSystemControllerCache__queue_updatePickableRoutesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_76(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "attributeForKey:", *MEMORY[0x1E0D48030]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v4 = *(void **)(a1 + 48);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __171__SBAVSystemControllerCache__queue_updatePickableRoutesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_2;
  block[3] = &unk_1E8EA8B90;
  v9 = v4;
  v10 = *(id *)(a1 + 56);
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, block);

}

- (void)_queue_updateAirplayDisplayActiveFromNotification:(id)a3 allowingBackgroundQueries:(BOOL)a4 backgroundQueriesCancelledBlock:(id)a5 cancelBackgroundQueriesBlock:(id)a6 completion:(id)a7
{
  _BOOL4 v8;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void (**v14)(_QWORD, _QWORD);
  SBAVSystemControllerDataProviding *queue_dataProvider;
  SBAVSystemControllerDataProviding *v16;
  NSObject *backgroundQueryQueue;
  SBAVSystemControllerDataProviding *v18;
  void *v19;
  uint64_t v20;
  _QWORD block[4];
  SBAVSystemControllerDataProviding *v22;
  SBAVSystemControllerCache *v23;
  id v24;
  void (**v25)(_QWORD, _QWORD);
  _QWORD v26[5];
  id v27;
  BOOL v28;

  v8 = a4;
  v10 = a5;
  v11 = a7;
  v12 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __177__SBAVSystemControllerCache__queue_updateAirplayDisplayActiveFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke;
  v26[3] = &unk_1E8EA6868;
  v28 = v8;
  v26[4] = self;
  v13 = v11;
  v27 = v13;
  v14 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v26);
  queue_dataProvider = self->_queue_dataProvider;
  if (v8)
  {
    v16 = queue_dataProvider;
    backgroundQueryQueue = self->_backgroundQueryQueue;
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = __177__SBAVSystemControllerCache__queue_updateAirplayDisplayActiveFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_80;
    block[3] = &unk_1E8EA8B18;
    v22 = v16;
    v23 = self;
    v24 = v10;
    v25 = v14;
    v18 = v16;
    dispatch_async(backgroundQueryQueue, block);

  }
  else
  {
    -[SBAVSystemControllerDataProviding attributeForKey:](queue_dataProvider, "attributeForKey:", *MEMORY[0x1E0D47F40]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0D47FA0]);

    v14[2](v14, v20);
  }

}

uint64_t __177__SBAVSystemControllerCache__queue_updateAirplayDisplayActiveFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke(uint64_t a1, int a2)
{
  char v2;
  uint64_t v4;
  NSObject *v5;
  int v6;
  void *v7;
  NSObject *v8;
  int v9;
  uint64_t result;
  _QWORD v11[5];
  char v12;
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v2 = a2;
  v15 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 48))
  {
    if (*(unsigned __int8 *)(v4 + 99) != a2)
    {
      *(_BYTE *)(v4 + 99) = a2;
      SBLogAVSystemControllerCache();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 99);
        *(_DWORD *)buf = 67109120;
        v14 = v6;
        _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Updated airplayDisplayActive to %{BOOL}i", buf, 8u);
      }

      v7 = *(void **)(a1 + 32);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __177__SBAVSystemControllerCache__queue_updateAirplayDisplayActiveFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_77;
      v11[3] = &unk_1E8EA8B40;
      v11[4] = v7;
      v12 = v2;
      objc_msgSend(v7, "_queue_notifyObserversWithBlock:", v11);
    }
  }
  else
  {
    *(_BYTE *)(v4 + 99) = a2;
    SBLogAVSystemControllerCache();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 99);
      *(_DWORD *)buf = 67109120;
      v14 = v9;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Initialized airplayDisplayActive to %{BOOL}i", buf, 8u);
    }

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __177__SBAVSystemControllerCache__queue_updateAirplayDisplayActiveFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_77(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "cache:didUpdateAirplayDisplayActive:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

void __177__SBAVSystemControllerCache__queue_updateAirplayDisplayActiveFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_80(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  id v8;
  char v9;

  objc_msgSend(*(id *)(a1 + 32), "attributeForKey:", *MEMORY[0x1E0D47F40]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0D47FA0]);

  v4 = *(void **)(a1 + 48);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __177__SBAVSystemControllerCache__queue_updateAirplayDisplayActiveFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_2;
  block[3] = &unk_1E8EA8AF0;
  v7 = v4;
  v8 = *(id *)(a1 + 56);
  v9 = v3;
  dispatch_async(v5, block);

}

uint64_t __177__SBAVSystemControllerCache__queue_updateAirplayDisplayActiveFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

- (id)_queryActiveOutputDevicesFromContext:(id)a3
{
  void *v3;
  void *v4;

  if (self->_outputContextSupportsMultipleOutputDevices)
  {
    objc_msgSend(a3, "outputDevices");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a3, "outputDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v4);
    else
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)_queue_rebuildCache
{
  SBAVSystemControllerDataProviding *queue_dataProvider;
  BSAtomicSignal *queue_serverDeathSignal;
  id v5;
  id v6;
  dispatch_block_t v7;
  _QWORD v8[4];
  id v9;
  SBAVSystemControllerCache *v10;

  queue_dataProvider = self->_queue_dataProvider;
  self->_queue_dataProvider = 0;

  queue_serverDeathSignal = self->_queue_serverDeathSignal;
  if (queue_serverDeathSignal)
    -[BSAtomicSignal signal](queue_serverDeathSignal, "signal");
  v5 = objc_alloc_init(MEMORY[0x1E0D016C0]);
  objc_storeStrong((id *)&self->_queue_serverDeathSignal, v5);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__SBAVSystemControllerCache__queue_rebuildCache__block_invoke;
  v8[3] = &unk_1E8E9E820;
  v9 = v5;
  v10 = self;
  v6 = v5;
  v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, v8);
  dispatch_async((dispatch_queue_t)self->_backgroundQueryQueue, v7);

}

void __48__SBAVSystemControllerCache__queue_rebuildCache__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  dispatch_block_t v5;
  _QWORD block[5];
  id v7;
  id v8;
  uint8_t buf[16];

  if (objc_msgSend(*(id *)(a1 + 32), "hasBeenSignalled"))
  {
    SBLogAVSystemControllerCache();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "Cancelling rebuilding data provider since the server has died", buf, 2u);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_backgroundQueryQueue_rebuildDataProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__SBAVSystemControllerCache__queue_rebuildCache__block_invoke_83;
    block[3] = &unk_1E8E9E270;
    v4 = *(void **)(a1 + 32);
    block[4] = *(_QWORD *)(a1 + 40);
    v7 = v3;
    v8 = v4;
    v2 = v3;
    v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
    dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 40) + 32), v5);

  }
}

uint64_t __48__SBAVSystemControllerCache__queue_rebuildCache__block_invoke_83(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_finishRebuildingCacheWithDataProvider:serverDeathSignal:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)_backgroundQueryQueue_rebuildDataProvider
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  _BOOL4 v17;
  id v19;
  uint8_t buf[8];
  _QWORD v21[11];

  v21[10] = *MEMORY[0x1E0C80C00];
  SBLogAVSystemControllerCache();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Rebuilding data provider", buf, 2u);
  }

  (*((void (**)(void))self->_dataProviderInitializer + 2))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D47FD8];
  v21[0] = *MEMORY[0x1E0D47F68];
  v21[1] = v5;
  v6 = *MEMORY[0x1E0D48218];
  v21[2] = *MEMORY[0x1E0D47FB8];
  v21[3] = v6;
  v7 = *MEMORY[0x1E0D47F98];
  v21[4] = *MEMORY[0x1E0D48270];
  v21[5] = v7;
  v8 = *MEMORY[0x1E0D47E48];
  v21[6] = *MEMORY[0x1E0D48228];
  v21[7] = v8;
  v9 = *MEMORY[0x1E0D48200];
  v21[8] = *MEMORY[0x1E0D48048];
  v21[9] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 10);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0D48280];
  v19 = 0;
  v12 = objc_msgSend(v4, "setAttribute:forKey:error:", v10, v11, &v19);
  v13 = v19;
  SBLogAVSystemControllerCache();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "Successfully subscribed to all necessary AVSystemController notifications.", buf, 2u);
    }

  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SBAVSystemControllerCache _backgroundQueryQueue_rebuildDataProvider].cold.1();

    SBLogCommon();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);

    if (v17)
      NSLog(CFSTR("We really shouldn't miss out on AVSystemController notifications... error: %@"), v13);
  }

  return v4;
}

- (void)_queue_finishRebuildingCacheWithDataProvider:(id)a3 serverDeathSignal:(id)a4
{
  id v7;
  id v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  NSMutableDictionary *notificationToHandlerMap;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t *v21;
  _QWORD v22[4];
  id v23;
  uint8_t *v24;
  _QWORD v25[4];
  id v26;
  SBAVSystemControllerCache *v27;
  uint8_t buf[8];
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v8, "hasBeenSignalled");
  SBLogAVSystemControllerCache();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Cancelling finishing rebuilding cache since the server has died", buf, 2u);
    }

  }
  else
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Finishing rebuilding cache", buf, 2u);
    }

    objc_storeStrong((id *)&self->_queue_dataProvider, a3);
    *(_QWORD *)buf = 0;
    v29 = buf;
    v30 = 0x2020000000;
    v31 = 0;
    v12 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __92__SBAVSystemControllerCache__queue_finishRebuildingCacheWithDataProvider_serverDeathSignal___block_invoke;
    v25[3] = &unk_1E8E9E820;
    v13 = v8;
    v26 = v13;
    v27 = self;
    v22[0] = v12;
    v22[1] = 3221225472;
    v22[2] = __92__SBAVSystemControllerCache__queue_finishRebuildingCacheWithDataProvider_serverDeathSignal___block_invoke_3;
    v22[3] = &unk_1E8EA8CD0;
    v24 = buf;
    v14 = (id)MEMORY[0x1D17E5550](v25);
    v23 = v14;
    v15 = (void *)MEMORY[0x1D17E5550](v22);
    notificationToHandlerMap = self->_notificationToHandlerMap;
    v18[0] = v12;
    v18[1] = 3221225472;
    v18[2] = __92__SBAVSystemControllerCache__queue_finishRebuildingCacheWithDataProvider_serverDeathSignal___block_invoke_4;
    v18[3] = &unk_1E8EA8D20;
    v18[4] = self;
    v19 = v13;
    v17 = v15;
    v20 = v17;
    v21 = buf;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](notificationToHandlerMap, "enumerateKeysAndObjectsUsingBlock:", v18);
    self->_queue_initialized = 1;

    _Block_object_dispose(buf, 8);
  }

}

uint64_t __92__SBAVSystemControllerCache__queue_finishRebuildingCacheWithDataProvider_serverDeathSignal___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  _QWORD v4[5];

  result = objc_msgSend(*(id *)(a1 + 32), "hasBeenSignalled");
  if ((result & 1) == 0)
  {
    v3 = *(void **)(a1 + 40);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __92__SBAVSystemControllerCache__queue_finishRebuildingCacheWithDataProvider_serverDeathSignal___block_invoke_2;
    v4[3] = &unk_1E8EA8CA8;
    v4[4] = v3;
    return objc_msgSend(v3, "_queue_notifyObserversWithBlock:", v4);
  }
  return result;
}

void __92__SBAVSystemControllerCache__queue_finishRebuildingCacheWithDataProvider_serverDeathSignal___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "cacheDidRebuildAfterServerDeath:", *(_QWORD *)(a1 + 32));

}

uint64_t __92__SBAVSystemControllerCache__queue_finishRebuildingCacheWithDataProvider_serverDeathSignal___block_invoke_3(uint64_t result)
{
  if (!--*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __92__SBAVSystemControllerCache__queue_finishRebuildingCacheWithDataProvider_serverDeathSignal___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void (*v7)(_QWORD, uint64_t, _QWORD, _QWORD, void *, void *, void *);
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;

  v5 = a2;
  v6 = objc_msgSend(a3, "pointerValue");
  v7 = (void (*)(_QWORD, uint64_t, _QWORD, _QWORD, void *, void *, void *))objc_msgSend(*(id *)(a1 + 32), "methodForSelector:", v6);
  objc_msgSend(*(id *)(a1 + 32), "_queue_backgroundQueryCancellationSignalForNotificationCreatingIfNecessary:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __92__SBAVSystemControllerCache__queue_finishRebuildingCacheWithDataProvider_serverDeathSignal___block_invoke_5;
  v22[3] = &unk_1E8EA8CF8;
  v22[4] = *(_QWORD *)(a1 + 32);
  v10 = v8;
  v23 = v10;
  v24 = *(id *)(a1 + 40);
  v11 = (void *)MEMORY[0x1D17E5550](v22);
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __92__SBAVSystemControllerCache__queue_finishRebuildingCacheWithDataProvider_serverDeathSignal___block_invoke_6;
  v19[3] = &unk_1E8E9F7B8;
  v19[4] = *(_QWORD *)(a1 + 32);
  v20 = v5;
  v21 = *(id *)(a1 + 48);
  v12 = v5;
  v13 = (void *)MEMORY[0x1D17E5550](v19);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __92__SBAVSystemControllerCache__queue_finishRebuildingCacheWithDataProvider_serverDeathSignal___block_invoke_7;
  v16[3] = &unk_1E8E9F7B8;
  v16[4] = *(_QWORD *)(a1 + 32);
  v17 = v10;
  v18 = *(id *)(a1 + 48);
  v14 = v10;
  v15 = (void *)MEMORY[0x1D17E5550](v16);
  v7(*(_QWORD *)(a1 + 32), v6, 0, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 80), v11, v13, v15);

}

uint64_t __92__SBAVSystemControllerCache__queue_finishRebuildingCacheWithDataProvider_serverDeathSignal___block_invoke_5(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 32));
  if ((objc_msgSend(*(id *)(a1 + 40), "hasBeenSignalled") & 1) != 0)
    return 1;
  else
    return objc_msgSend(*(id *)(a1 + 48), "hasBeenSignalled");
}

uint64_t __92__SBAVSystemControllerCache__queue_finishRebuildingCacheWithDataProvider_serverDeathSignal___block_invoke_6(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(*(id *)(a1 + 32), "_queue_signalBackgroundQueryCancellationForNotification:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __92__SBAVSystemControllerCache__queue_finishRebuildingCacheWithDataProvider_serverDeathSignal___block_invoke_7(uint64_t a1)
{
  uint64_t result;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 32));
  result = objc_msgSend(*(id *)(a1 + 40), "hasBeenSignalled");
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return result;
}

- (void)_serverDied:(id)a3
{
  id v4;
  id v5;
  dispatch_block_t v6;
  _QWORD v7[4];
  id v8;
  SBAVSystemControllerCache *v9;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__SBAVSystemControllerCache__serverDied___block_invoke;
  v7[3] = &unk_1E8E9E820;
  v8 = v4;
  v9 = self;
  v5 = v4;
  v6 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, v7);
  dispatch_async((dispatch_queue_t)self->_queue, v6);

}

uint64_t __41__SBAVSystemControllerCache__serverDied___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogAVSystemControllerCache();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "Notification '%@' received", (uint8_t *)&v5, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 40), "_queue_rebuildCache");
}

uint64_t __66__SBAVSystemControllerCache__receiveUpdatedValueFromNotification___block_invoke_89(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "hasBeenSignalled") & 1) != 0)
    return 1;
  else
    return objc_msgSend(*(id *)(a1 + 40), "hasBeenSignalled");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avscOperationsWorkloop, 0);
  objc_storeStrong((id *)&self->_backgroundQueryQueue, 0);
  objc_storeStrong((id *)&self->_queue_activeOutputDevices, 0);
  objc_storeStrong((id *)&self->_queue_pickableRoutes, 0);
  objc_storeStrong((id *)&self->_queue_activeAudioRouteInfo, 0);
  objc_storeStrong((id *)&self->_queue_activeAudioRoute, 0);
  objc_storeStrong((id *)&self->_queue_activeCategoryName, 0);
  objc_storeStrong((id *)&self->_queue_serverDeathSignal, 0);
  objc_storeStrong((id *)&self->_notificationToBackgroundQueryCancellationSignalMap, 0);
  objc_storeStrong((id *)&self->_notificationToHandlerMap, 0);
  objc_storeStrong((id *)&self->_queue_dataProvider, 0);
  objc_storeStrong((id *)&self->_queue_outputContext, 0);
  objc_storeStrong((id *)&self->_queue_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_dataProviderInitializer, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_callOutQueue, 0);
}

- (void)_queue_updateActiveCategoryNameFromNotification:allowingBackgroundQueries:backgroundQueriesCancelledBlock:cancelBackgroundQueriesBlock:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_8(&dword_1D0540000, v0, v1, "Failed to get active category name: %{public}@, dataProvider: %{public}@");
  OUTLINED_FUNCTION_2_0();
}

void __175__SBAVSystemControllerCache__queue_updateActiveCategoryNameFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_60_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_8(&dword_1D0540000, v0, v1, "Failed to get active category name: %{public}@, dataProvider: %{public}@ (background query)");
  OUTLINED_FUNCTION_2_0();
}

void __173__SBAVSystemControllerCache__queue_updateActiveAudioRouteFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_5_1(&dword_1D0540000, v0, v1, "Initialized activeAudioRoute to %@; attributes: %@",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_2_0();
}

void __173__SBAVSystemControllerCache__queue_updateActiveAudioRouteFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_5_1(&dword_1D0540000, v0, v1, "Updated activeAudioRoute to %@; attributes: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __176__SBAVSystemControllerCache__queue_updateActiveOutputDevicesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, v0, v1, "Initialized activeOutputDevices to %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __176__SBAVSystemControllerCache__queue_updateActiveOutputDevicesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, v0, v1, "Updated activeOutputDevices to %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __171__SBAVSystemControllerCache__queue_updatePickableRoutesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, a2, a3, "Initialized pickableRoutes to %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __171__SBAVSystemControllerCache__queue_updatePickableRoutesFromNotification_allowingBackgroundQueries_backgroundQueriesCancelledBlock_cancelBackgroundQueriesBlock_completion___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, a2, a3, "Updated pickableRoutes to %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)_backgroundQueryQueue_rebuildDataProvider
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1D0540000, v0, OS_LOG_TYPE_ERROR, "Failed to subscribe to AVSystemController notifications due to error: %@", v1, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

void __66__SBAVSystemControllerCache__receiveUpdatedValueFromNotification___block_invoke_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = 138412802;
  v7 = v4;
  v8 = 2048;
  v9 = v3;
  v10 = 2112;
  v11 = v5;
  _os_log_debug_impl(&dword_1D0540000, log, OS_LOG_TYPE_DEBUG, "Notification '%@' received from %p : %@", (uint8_t *)&v6, 0x20u);
}

@end
