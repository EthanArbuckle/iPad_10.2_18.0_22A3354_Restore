@implementation TSIDSSubscriptionSelector

+ (id)activeIMessageSlots
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  uint8_t v24[4];
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  v23 = 0;
  objc_msgSend(v2, "selectedSubscriptionsWithError:", &v23);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v23;
  if (v4)
  {
    _TSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[TSIDSSubscriptionSelector activeIMessageSlots].cold.3();
    v6 = 0;
    goto LABEL_24;
  }
  v18 = v2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v17 = v3;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
  if (!v8)
    goto LABEL_21;
  v9 = v8;
  v10 = *(_QWORD *)v20;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v20 != v10)
        objc_enumerationMutation(v7);
      v12 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v11), "subscriptionSlot", v17);
      if (v12)
      {
        if (v12 == 2)
        {
          v13 = v6;
          v14 = &unk_24DF23788;
        }
        else
        {
          if (v12 != 1)
            goto LABEL_19;
          v13 = v6;
          v14 = &unk_24DF23770;
        }
        objc_msgSend(v13, "addObject:", v14);
      }
      else
      {
        _TSLogDomain();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          +[TSIDSSubscriptionSelector activeIMessageSlots].cold.2(v24, &v25, v15);

      }
LABEL_19:
      ++v11;
    }
    while (v9 != v11);
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
  }
  while (v9);
LABEL_21:

  _TSLogDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    +[TSIDSSubscriptionSelector activeIMessageSlots].cold.1();
  v3 = v17;
  v2 = v18;
LABEL_24:

  return v6;
}

+ (void)registerSlotsForIMessage:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[4];
  NSObject *v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = dispatch_queue_create("iMessage Background", 0);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__TSIDSSubscriptionSelector_registerSlotsForIMessage___block_invoke;
    block[3] = &unk_24DEF29A8;
    v7 = v3;
    dispatch_async(v4, block);

    v5 = v7;
  }
  else
  {
    _TSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "+[TSIDSSubscriptionSelector registerSlotsForIMessage:]";
      _os_log_impl(&dword_21B647000, v5, OS_LOG_TYPE_DEFAULT, "Empty input @%s", buf, 0xCu);
    }
  }

}

uint64_t __54__TSIDSSubscriptionSelector_registerSlotsForIMessage___block_invoke(uint64_t a1)
{
  return +[TSIDSSubscriptionSelector doRegistrationForIMessage:](TSIDSSubscriptionSelector, "doRegistrationForIMessage:", *(_QWORD *)(a1 + 32));
}

+ (void)doRegistrationForIMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  uint8_t v25[4];
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "selectedSubscriptionsWithError:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (!v5)
    v5 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v10), "integerValue");
        if ((unint64_t)(v11 - 1) >= 2)
        {
          _TSLogDomain();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            +[TSIDSSubscriptionSelector doRegistrationForIMessage:].cold.2(v25, &v26, v13);
        }
        else
        {
          v12 = v11;
          objc_msgSend(MEMORY[0x24BE4FC70], "phoneSubscriptionWithSubscriptionSlot:", v11);
          v13 = objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_msgSend(v5, "addObject:", v13);
          }
          else
          {
            _TSLogDomain();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218242;
              v22 = v12;
              v23 = 2080;
              v24 = "+[TSIDSSubscriptionSelector doRegistrationForIMessage:]";
              _os_log_error_impl(&dword_21B647000, v14, OS_LOG_TYPE_ERROR, "[E]Skipping slot %lu @%s", buf, 0x16u);
            }

          }
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    _TSLogDomain();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      +[TSIDSSubscriptionSelector doRegistrationForIMessage:].cold.1();

    objc_msgSend(v16, "setSelectedSubscriptions:withCompletion:", v5, &__block_literal_global_15);
  }

}

void __55__TSIDSSubscriptionSelector_doRegistrationForIMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a2;
  v5 = a3;
  _TSLogDomain();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __55__TSIDSSubscriptionSelector_doRegistrationForIMessage___block_invoke_cold_1((uint64_t)v4, (uint64_t)v5, v6);

}

+ (void)activeIMessageSlots
{
  os_log_t v0;
  uint8_t v1[14];
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  v2 = "+[TSIDSSubscriptionSelector activeIMessageSlots]";
  _os_log_error_impl(&dword_21B647000, v0, OS_LOG_TYPE_ERROR, "[E]Error: %@ @%s", v1, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)doRegistrationForIMessage:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_21B647000, v0, v1, "[Db]  %@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)doRegistrationForIMessage:(NSObject *)a3 .cold.2(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "+[TSIDSSubscriptionSelector doRegistrationForIMessage:]";
  OUTLINED_FUNCTION_1_4(&dword_21B647000, (int)a2, a3, "[E]Invalid slot - skipping @%s", a1);
}

void __55__TSIDSSubscriptionSelector_doRegistrationForIMessage___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 138412802;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  v7 = 2080;
  v8 = "+[TSIDSSubscriptionSelector doRegistrationForIMessage:]_block_invoke";
  _os_log_error_impl(&dword_21B647000, log, OS_LOG_TYPE_ERROR, "[E]Selection %@, Error %@ @%s", (uint8_t *)&v3, 0x20u);
}

@end
