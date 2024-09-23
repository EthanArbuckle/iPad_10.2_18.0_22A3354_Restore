@implementation PDScheduledActivityClientRegister

void __PDScheduledActivityClientRegister_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  PDScheduledActivityClient *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  _RegisteredClients();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_msgSend(v3, "isValid");
    objc_msgSend(v3, "setClientInstance:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v3, "setActivityQueue:", *(_QWORD *)(a1 + 48));
    if ((v4 & 1) == 0)
    {
      objc_msgSend(v3, "activityRegistrations");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "allKeys");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v15;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v15 != v10)
              objc_enumerationMutation(v7);
            _RegisterXPCActivity(*(void **)(a1 + 32), *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11++));
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v9);
      }

    }
  }
  else
  {
    v12 = -[PDScheduledActivityClient initWithClientInstance:activityQueue:]([PDScheduledActivityClient alloc], "initWithClientInstance:activityQueue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    _RegisteredClients();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, *(_QWORD *)(a1 + 32));

    _ArchiveRegisteredClients();
  }

}

@end
