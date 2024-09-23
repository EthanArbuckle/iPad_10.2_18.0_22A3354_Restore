@implementation PDScheduledActivityRemove

void __PDScheduledActivityRemove_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _RegisteredClients();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "activityRegistrations");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      PKLogFacilityTypeGetObject(0);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 32);
        v7 = *(_QWORD *)(a1 + 40);
        v11 = 138412546;
        v12 = v7;
        v13 = 2112;
        v14 = v8;
        _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Removing Scheduled Activity: %@ for Client: %@", (uint8_t *)&v11, 0x16u);
      }

      objc_msgSend(v3, "activityRegistrations");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));

      _ArchiveRegisteredClients();
    }

  }
  _XPCActivityIdentifier(*(void **)(a1 + 32), *(_QWORD *)(a1 + 40));
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_activity_unregister((const char *)objc_msgSend(v10, "UTF8String"));

}

@end
