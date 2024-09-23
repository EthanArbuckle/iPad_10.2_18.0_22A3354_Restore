@implementation PSProximityBooster

void __27___PSProximityBooster_init__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __27___PSProximityBooster_init__block_invoke_cold_1();

}

void __27___PSProximityBooster_init__block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __27___PSProximityBooster_init__block_invoke_6_cold_1();

}

void __27___PSProximityBooster_init__block_invoke_8(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  NSObject *v5;

  v4 = a2;
  +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __27___PSProximityBooster_init__block_invoke_8_cold_1((uint64_t)v4, a3, v5);

}

void __27___PSProximityBooster_init__block_invoke_12()
{
  NSObject *v0;

  +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __27___PSProximityBooster_init__block_invoke_12_cold_1();

}

void __27___PSProximityBooster_init__block_invoke_15()
{
  NSObject *v0;

  +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __27___PSProximityBooster_init__block_invoke_15_cold_1();

}

void __47___PSProximityBooster_startMonitoringProximity__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;

  v2 = a2;
  +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __47___PSProximityBooster_startMonitoringProximity__block_invoke_cold_2();
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    __47___PSProximityBooster_startMonitoringProximity__block_invoke_cold_1();
  }

}

void __62___PSProximityBooster_suggestionsByBoostingNearbySuggestions___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "peopleDiscovery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "discoveredPeople");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "contactID", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v10 = objc_msgSend(v4, "count");
  +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v10)
  {
    if (v12)
      __62___PSProximityBooster_suggestionsByBoostingNearbySuggestions___block_invoke_cold_2();
  }
  else if (v12)
  {
    __62___PSProximityBooster_suggestionsByBoostingNearbySuggestions___block_invoke_cold_1();
  }

}

uint64_t __62___PSProximityBooster_suggestionsByBoostingNearbySuggestions___block_invoke_24(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "recipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __27___PSProximityBooster_init__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1A07F4000, v0, v1, "Found new person: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __27___PSProximityBooster_init__block_invoke_6_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1A07F4000, v0, v1, "Lost person: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __27___PSProximityBooster_init__block_invoke_8_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_6_0(&dword_1A07F4000, a3, v6, "Changed person: %@, changes: %@", (uint8_t *)&v7);

}

void __27___PSProximityBooster_init__block_invoke_12_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "People discovery session invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __27___PSProximityBooster_init__block_invoke_15_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "People discovery session interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __47___PSProximityBooster_startMonitoringProximity__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, v0, v1, "Activated people discovery", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __47___PSProximityBooster_startMonitoringProximity__block_invoke_cold_2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1A07F4000, v0, OS_LOG_TYPE_ERROR, "Error activating people discovery: %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __62___PSProximityBooster_suggestionsByBoostingNearbySuggestions___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, v0, v1, "No nearby people to boost suggestions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __62___PSProximityBooster_suggestionsByBoostingNearbySuggestions___block_invoke_cold_2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_6_0(&dword_1A07F4000, v1, (uint64_t)v1, "Boosting suggestions with nearby people: %@, nearbyContactIDs: %@", v2);
  OUTLINED_FUNCTION_1();
}

@end
