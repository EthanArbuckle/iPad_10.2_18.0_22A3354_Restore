@implementation PSContactCache

void __23___PSContactCache_init__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  NSObject *v3;
  _QWORD block[4];
  _QWORD *v5;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A07F4000, v2, OS_LOG_TYPE_DEFAULT, "_PSContactCache: Received ContactStore change notification. Processing...", buf, 2u);
    }

    v3 = WeakRetained[4];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __23___PSContactCache_init__block_invoke_33;
    block[3] = &unk_1E43FEB68;
    v5 = WeakRetained;
    dispatch_async(v3, block);

  }
}

uint64_t __23___PSContactCache_init__block_invoke_33(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "syncChangeHistory");
}

uint64_t __23___PSContactCache_init__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __33___PSContactCache_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A1AFCA24]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

void __41___PSContactCache__setContact_forHandle___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _PSCachedContact *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = a2;
  objc_msgSend(v3, "distantFuture");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[_PSCachedContact initWithExpirationDate:contact:]([_PSCachedContact alloc], "initWithExpirationDate:contact:", v6, *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setObject:forKey:", v5, *(_QWORD *)(a1 + 40));

}

void __57___PSContactCache__removeAllHandlesForContactIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57___PSContactCache__removeAllHandlesForContactIdentifier___block_invoke_2;
  v15[3] = &unk_1E4401698;
  v16 = *(id *)(a1 + 32);
  v5 = v4;
  v17 = v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v15);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v18, 16);
    }
    while (v8);
  }

}

void __57___PSContactCache__removeAllHandlesForContactIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(a3, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

}

uint64_t __25___PSContactCache__purge__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllObjects");
}

uint64_t __25___PSContactCache__purge__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllObjects");
}

void __46___PSContactCache__getCachedContactForHandle___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "objectForKey:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v6)
  {
    objc_msgSend(v6, "expirationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceNow");
    v9 = v8;

    if (v9 <= 0.0)
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = 0;

      objc_msgSend(v12, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
    }
  }

}

void __65___PSContactCache__setLikelyFaceTimeHandle_forContactIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _PSCachedFaceTimeableHandle *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = a2;
  objc_msgSend(v3, "distantFuture");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[_PSCachedFaceTimeableHandle initWithExpirationDate:handle:]([_PSCachedFaceTimeableHandle alloc], "initWithExpirationDate:handle:", v6, *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setObject:forKey:", v5, *(_QWORD *)(a1 + 40));

}

void __68___PSContactCache__getCachedFaceTimeableHandleForContactIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "objectForKey:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v6)
  {
    objc_msgSend(v6, "expirationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceNow");
    v9 = v8;

    if (v9 <= 0.0)
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = 0;

      objc_msgSend(v12, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
    }
  }

}

id __88___PSContactCache_getFaceTimeableHandleForContact_interactionStore_seedRecipientHandle___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formattedInternationalStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __88___PSContactCache_getFaceTimeableHandleForContact_interactionStore_seedRecipientHandle___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

uint64_t __88___PSContactCache_getFaceTimeableHandleForContact_interactionStore_seedRecipientHandle___block_invoke_57(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "personId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

uint64_t __88___PSContactCache_getFaceTimeableHandleForContact_interactionStore_seedRecipientHandle___block_invoke_59(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "personId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

uint64_t __88___PSContactCache_getFaceTimeableHandleForContact_interactionStore_seedRecipientHandle___block_invoke_60(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "personId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

@end
