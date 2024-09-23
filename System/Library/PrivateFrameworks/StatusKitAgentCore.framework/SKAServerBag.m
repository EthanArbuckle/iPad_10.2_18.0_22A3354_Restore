@implementation SKAServerBag

+ (id)logger
{
  if (logger_onceToken_14 != -1)
    dispatch_once(&logger_onceToken_14, &__block_literal_global_14);
  return (id)logger__logger_14;
}

void __22__SKAServerBag_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "SKAServerBag");
  v1 = (void *)logger__logger_14;
  logger__logger_14 = (uint64_t)v0;

}

+ (BOOL)statusEnabledByServerForStatusTypeIdentifier:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = 1;
  objc_msgSend(MEMORY[0x24BE4FE58], "sharedInstanceForBagType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("shared-channels-status-type-disabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v16;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v16 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && objc_msgSend(v12, "isEqualToString:", v3, (_QWORD)v15))
            {
              +[SKAServerBag logger](SKAServerBag, "logger");
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v20 = v3;
                _os_log_impl(&dword_2188DF000, v13, OS_LOG_TYPE_DEFAULT, "Server bag indicates status disablement for status type identifier: %@", buf, 0xCu);
              }

              v4 = 0;
              goto LABEL_17;
            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
          if (v9)
            continue;
          break;
        }
      }
      v4 = 1;
LABEL_17:

    }
    else
    {
      v4 = 1;
    }
  }

  return v4;
}

+ (BOOL)presenceEnabledByServer
{
  unsigned int v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  LOBYTE(v2) = 1;
  objc_msgSend(MEMORY[0x24BE4FE58], "sharedInstanceForBagType:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("activity-presence-enabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v2 = objc_msgSend(v4, "BOOLValue");
      +[SKAServerBag logger](SKAServerBag, "logger");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 134217984;
        v8 = v2;
        _os_log_impl(&dword_2188DF000, v5, OS_LOG_TYPE_DEFAULT, "Server bag indicates presence enablement with status: %ld", (uint8_t *)&v7, 0xCu);
      }

    }
    else
    {
      LOBYTE(v2) = 1;
    }
  }

  return v2;
}

+ (BOOL)presenceEnabledByServerForServiceIdentifier:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = 1;
  objc_msgSend(MEMORY[0x24BE4FE58], "sharedInstanceForBagType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("activity-presence-adopter-disabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v16;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v16 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && objc_msgSend(v12, "isEqualToString:", v3, (_QWORD)v15))
            {
              +[SKAServerBag logger](SKAServerBag, "logger");
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v20 = v3;
                _os_log_impl(&dword_2188DF000, v13, OS_LOG_TYPE_DEFAULT, "Server bag indicates presence disablement for service: %@", buf, 0xCu);
              }

              v4 = 0;
              goto LABEL_17;
            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
          if (v9)
            continue;
          break;
        }
      }
      v4 = 1;
LABEL_17:

    }
    else
    {
      v4 = 1;
    }
  }

  return v4;
}

+ (double)statusValidityForOffGridPayload
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x24BE4FE58], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("shared-channels-cp-status-payload-validity-sec"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = 5184000.0;
  }

  return v5;
}

@end
