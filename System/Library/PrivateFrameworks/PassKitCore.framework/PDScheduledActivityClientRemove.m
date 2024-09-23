@implementation PDScheduledActivityClientRemove

void __PDScheduledActivityClientRemove_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  _RegisteredClients();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v19 = v3;
    objc_msgSend(v3, "activityRegistrations");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          _XPCActivityIdentifier(*(void **)(a1 + 32), v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          PKLogFacilityTypeGetObject(0);
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v14 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138412546;
            v25 = v11;
            v26 = 2112;
            v27 = v14;
            _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Removing Scheduled Activity: %@ for Client: %@", buf, 0x16u);
          }

          v15 = objc_retainAutorelease(v12);
          xpc_activity_unregister((const char *)objc_msgSend(v15, "UTF8String"));

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v8);
    }

    PKLogFacilityTypeGetObject(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v25 = v17;
      _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Removing Scheduled Activity Client: %@", buf, 0xCu);
    }

    _RegisteredClients();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 32));

    _ArchiveRegisteredClients();
    v3 = v19;
  }

}

@end
