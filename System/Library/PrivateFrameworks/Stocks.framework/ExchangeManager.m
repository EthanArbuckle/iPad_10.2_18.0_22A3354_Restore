@implementation ExchangeManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_2);
  return (id)sharedManager_sharedManager;
}

void __32__ExchangeManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = v0;

}

- (ExchangeManager)init
{
  ExchangeManager *v2;
  uint64_t v3;
  NSMutableDictionary *exchangesByName;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ExchangeManager;
  v2 = -[ExchangeManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    exchangesByName = v2->_exchangesByName;
    v2->_exchangesByName = (NSMutableDictionary *)v3;

    -[ExchangeManager _loadExchangesFromDefaults](v2, "_loadExchangesFromDefaults");
  }
  return v2;
}

- (id)exchangeList
{
  return (id)-[NSMutableDictionary allValues](self->_exchangesByName, "allValues");
}

- (id)exchangeWithName:(id)a3
{
  return -[ExchangeManager exchangeWithName:createIfNotFound:](self, "exchangeWithName:createIfNotFound:", a3, 0);
}

- (id)exchangeWithName:(id)a3 createIfNotFound:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  Exchange *v7;
  BOOL v8;
  NSObject *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a4;
  +[Exchange formattedExchangeNameForName:](Exchange, "formattedExchangeNameForName:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_exchangesByName, "objectForKeyedSubscript:", v6);
  v7 = (Exchange *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (v6)
      v8 = !v4;
    else
      v8 = 1;
    if (v8)
    {
      v7 = 0;
    }
    else
    {
      StocksLogForCategory(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[ExchangeManager exchangeWithName:createIfNotFound:].cold.1((uint64_t)v6, v9, v11, v12, v13, v14, v15, v16);

      v7 = -[Exchange initWithName:]([Exchange alloc], "initWithName:", v6);
      -[ExchangeManager addExchange:](self, "addExchange:", v7);
    }
  }

  return v7;
}

- (BOOL)containsExchange:(id)a3
{
  void *v4;
  void *v5;
  BOOL v6;

  if (!a3)
    return 0;
  objc_msgSend(a3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ExchangeManager exchangeWithName:](self, "exchangeWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (void)addExchange:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  StocksLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ExchangeManager addExchange:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  -[ExchangeManager _addExchange:](self, "_addExchange:", v4);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:", CFSTR("ExchangeWasAddedNotification"), v4);

}

- (void)_addExchange:(id)a3
{
  NSMutableDictionary *exchangesByName;
  id v4;
  id v5;

  if (a3)
  {
    exchangesByName = self->_exchangesByName;
    v4 = a3;
    objc_msgSend(v4, "name");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](exchangesByName, "setObject:forKeyedSubscript:", v4, v5);

  }
}

- (void)removeExchange:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableDictionary *exchangesByName;
  void *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *v16;
  void *v17;

  v4 = a3;
  StocksLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ExchangeManager removeExchange:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  if (v4)
  {
    exchangesByName = self->_exchangesByName;
    objc_msgSend(v4, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](exchangesByName, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "postNotificationName:object:", CFSTR("ExchangeWillBeRemovedNotification"), v4);

      v16 = self->_exchangesByName;
      objc_msgSend(v4, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](v16, "removeObjectForKey:", v17);

    }
  }

}

- (void)_loadExchangesFromDefaults
{
  OUTLINED_FUNCTION_1(&dword_21736B000, a1, a3, "#ExchangeManager Loading exchanges from defaults", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)reloadExchangesFromDefaults
{
  OUTLINED_FUNCTION_1(&dword_21736B000, a1, a3, "#ExchangeManager Reloading exchanges from defaults", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)saveChanges
{
  OUTLINED_FUNCTION_1(&dword_21736B000, a1, a3, "#ExchangeManager Saving exchanges to defaults", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __30__ExchangeManager_saveChanges__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "archiveDictionary");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exchangesByName, 0);
}

- (void)exchangeWithName:(uint64_t)a3 createIfNotFound:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21736B000, a2, a3, "#ExchangeManager Could not find #exchange %@; creating new exchange",
    a5,
    a6,
    a7,
    a8,
    2u);
  OUTLINED_FUNCTION_3();
}

- (void)addExchange:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21736B000, a2, a3, "#ExchangeManager Adding #exchange %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)removeExchange:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21736B000, a2, a3, "#ExchangeManager Removing #exchange %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
