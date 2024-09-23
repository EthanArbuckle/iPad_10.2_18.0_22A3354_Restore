@implementation TrimUnregisteredClients

void ___TrimUnregisteredClients_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _RegisteredClients();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = ___TrimUnregisteredClients_block_invoke_2;
  v4[3] = &unk_1E2AC7B70;
  v3 = v0;
  v5 = v3;
  objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v4);

  if (objc_msgSend(v3, "count"))
  {
    _RegisteredClients();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeObjectsForKeys:", v3);

    _ArchiveRegisteredClients();
  }

}

void ___TrimUnregisteredClients_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(v6, "isValid") & 1) == 0)
  {
    objc_msgSend(v6, "activityRegistrations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          _XPCActivityIdentifier(v5, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13));
          v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          xpc_activity_unregister((const char *)objc_msgSend(v14, "UTF8String", (_QWORD)v16));

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      }
      while (v11);
    }

    PKLogFacilityTypeGetObject(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v5;
      _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Activity Client: %@ is no longer valid and will be removed.", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  }

}

@end
