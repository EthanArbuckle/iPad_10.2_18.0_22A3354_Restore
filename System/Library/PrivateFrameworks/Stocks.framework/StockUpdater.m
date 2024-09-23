@implementation StockUpdater

- (BOOL)_updateStocks:(id)a3 comprehensive:(BOOL)a4 forceUpdate:(BOOL)a5
{
  _BOOL4 v6;
  id v8;
  char v9;
  NSError *lastError;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  NSUInteger v22;
  NSObject *v23;
  const char *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __CFString **v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id WeakRetained;
  NSObject *v46;
  void (**updateCompletionHandler)(id, uint64_t, _QWORD);
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[2];
  _QWORD v56[2];
  uint8_t buf[4];
  NSUInteger v58;
  __int16 v59;
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  v6 = a4;
  v62 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = objc_msgSend((id)objc_opt_class(), "shouldGenerateOfflineData");
  self->_isComprehensive = v6;
  self->_forceUpdate = a5;
  lastError = self->_lastError;
  self->_lastError = 0;

  if (!self->_forceUpdate && (v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
    if (!v13)
      goto LABEL_15;
    v14 = v13;
    v15 = *(_QWORD *)v52;
    while (1)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v52 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        if (!v6)
        {
          if (!objc_msgSend(v17, "isQuoteStale"))
            continue;
LABEL_12:
          objc_msgSend(v11, "addObject:", v17);
          continue;
        }
        if ((objc_msgSend(v17, "isMetadataStale") & 1) != 0)
          goto LABEL_12;
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
      if (!v14)
      {
LABEL_15:

        goto LABEL_17;
      }
    }
  }
  v11 = v8;
LABEL_17:
  v18 = objc_msgSend(v11, "count");
  if (v18)
  {
    if ((unint64_t)objc_msgSend(v11, "count") >= 0x65)
    {
      objc_msgSend(v11, "subarrayWithRange:", 100, objc_msgSend(v11, "count") - 100);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[StockUpdater setPendingStocks:](self, "setPendingStocks:", v19);

      objc_msgSend(v11, "subarrayWithRange:", 0, 100);
      v20 = objc_claimAutoreleasedReturnValue();

      StocksLogForCategory(0);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = -[NSArray count](self->_pendingStocks, "count");
        *(_DWORD *)buf = 134217984;
        v58 = v22;
        _os_log_impl(&dword_21736B000, v21, OS_LOG_TYPE_DEFAULT, "#StockUpdater Splitting stocks update into multiple requests, %lu pending", buf, 0xCu);
      }

      v11 = (void *)v20;
    }
    StocksLogForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_isComprehensive)
        v24 = "comprehensive";
      else
        v24 = "basic";
      *(_DWORD *)buf = 136315394;
      v58 = (NSUInteger)v24;
      v59 = 2112;
      v60 = v11;
      _os_log_impl(&dword_21736B000, v23, OS_LOG_TYPE_DEFAULT, "#StockUpdater Performing %s update for stocks: %@", buf, 0x16u);
    }

    -[StockUpdater setRequestStocks:](self, "setRequestStocks:", v11);
    -[NSArray valueForKey:](self->_requestStocks, "valueForKey:", CFSTR("symbol"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "componentsJoinedByString:", CFSTR(","));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    +[NetPreferences sharedPreferences](NetPreferences, "sharedPreferences");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[YQLRequest YQLLanguageCode](self, "YQLLanguageCode");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[YQLRequest YQLCountryCode](self, "YQLCountryCode");
    v29 = objc_claimAutoreleasedReturnValue();
    v55[0] = CFSTR("format");
    v55[1] = CFSTR("crossProduct");
    v56[0] = CFSTR("json");
    v56[1] = CFSTR("optimized");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v30, "mutableCopy");

    objc_msgSend(v31, "na_safeSetObject:forKey:", v26, CFSTR("tickers"));
    objc_msgSend(v31, "na_safeSetObject:forKey:", v28, CFSTR("lang"));
    v50 = (void *)v29;
    objc_msgSend(v31, "na_safeSetObject:forKey:", v29, CFSTR("region"));
    objc_msgSend(v27, "stocksYQLBaseURL");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    v34 = YQLMetadataPath;
    if (!v6)
      v34 = YQLBasicDataPath;
    objc_msgSend(v32, "URLByAppendingPathComponent:", *v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "signedRequestForURL:parameters:", v35, v31);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "serviceDebugging"))
    {
      objc_msgSend(v36, "URL");
      v49 = v26;
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "absoluteString");
      v38 = v35;
      v39 = v27;
      v40 = v28;
      v41 = v18;
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      +[YQLRequest appendDebugString:](YQLRequest, "appendDebugString:", v42);

      v18 = v41;
      v28 = v40;
      v27 = v39;
      v35 = v38;

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v31);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      +[YQLRequest appendDebugString:](YQLRequest, "appendDebugString:", v43);

      v26 = v49;
    }
    -[YQLRequest loadRequest:](self, "loadRequest:", v36);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "postNotificationName:object:", CFSTR("StocksUpdateLoadingStatusNotification"), 0);

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "stockUpdater:didRequestUpdateForStocks:isComprehensive:", self, v11, self->_isComprehensive);

  }
  else
  {
    StocksLogForCategory(0);
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v58) = v6;
      _os_log_impl(&dword_21736B000, v46, OS_LOG_TYPE_DEFAULT, "#StockUpdater hit cache, comprehensive: %d", buf, 8u);
    }

    updateCompletionHandler = (void (**)(id, uint64_t, _QWORD))self->_updateCompletionHandler;
    if (updateCompletionHandler)
    {
      updateCompletionHandler[2](updateCompletionHandler, 1, 0);
      -[StockUpdater setUpdateCompletionHandler:](self, "setUpdateCompletionHandler:", 0);
    }
  }

  return v18 != 0;
}

- (void)parseData:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __26__StockUpdater_parseData___block_invoke;
  v6[3] = &unk_24D74B9A8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  +[YahooResponseParser parseData:resultsHandler:](YahooResponseParser, "parseData:resultsHandler:", v5, v6);

}

void __26__StockUpdater_parseData___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = a4;
  v8 = *(void **)(a1 + 32);
  if (v9)
  {
    objc_msgSend(v8, "_parseExchangeDictionaries:", a2);
    objc_msgSend(*(id *)(a1 + 32), "_parseQuoteDictionaries:withDataSourceDictionaries:", v9, v7);
  }
  else
  {
    objc_msgSend(v8, "failToParseWithData:", *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(*(id *)(a1 + 32), "didParseData");

}

- (void)_parseQuoteDictionaries:(id)a3 withDataSourceDictionaries:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 isComprehensive;
  void *v20;
  double Current;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v7;
  +[YahooResponseParser parseDataSourceMapFromDataSourceDictionaries:](YahooResponseParser, "parseDataSourceMapFromDataSourceDictionaries:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __67__StockUpdater__parseQuoteDictionaries_withDataSourceDictionaries___block_invoke;
  v29[3] = &unk_24D74B9D0;
  v10 = v8;
  v30 = v10;
  v24 = v6;
  v22 = (void *)v9;
  +[YahooResponseParser parseStockQuoteDictionaries:withDataSources:parsedStockResult:](YahooResponseParser, "parseStockQuoteDictionaries:withDataSources:parsedStockResult:", v6, v9, v29);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = self->_requestStocks;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v16, "symbol");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          isComprehensive = self->_isComprehensive;
          objc_msgSend(v10, "objectForKeyedSubscript:", v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          Current = CFAbsoluteTimeGetCurrent();
          if (isComprehensive)
            objc_msgSend(v16, "updateMetadataWithDictionary:forTime:", v20, Current);
          else
            objc_msgSend(v16, "updateQuoteWithDictionary:forTime:", v20, Current);

        }
      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v13);
  }

}

uint64_t __67__StockUpdater__parseQuoteDictionaries_withDataSourceDictionaries___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

- (void)_parseExchangeDictionaries:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[StockUpdater requestStocks](self, "requestStocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  +[StockManager sharedManager](StockManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stocksList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == objc_msgSend(v8, "count"))
  {
    v9 = (void *)MEMORY[0x24BDBCF20];
    -[StockUpdater requestStocks](self, "requestStocks");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BDBCF20];
    +[StockManager sharedManager](StockManager, "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stocksList");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v11, "isEqualToSet:", v15);

    if (v16)
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 1;
      goto LABEL_6;
    }
  }
  else
  {

  }
  v17 = 0;
  v18 = 0;
LABEL_6:
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __43__StockUpdater__parseExchangeDictionaries___block_invoke;
  v36[3] = &unk_24D74B9D0;
  v19 = v17;
  v37 = v19;
  +[YahooResponseParser parseExchangeDictionaries:parsedExchangeResult:](YahooResponseParser, "parseExchangeDictionaries:parsedExchangeResult:", v4, v36);
  if (v18)
  {
    +[ExchangeManager sharedManager](ExchangeManager, "sharedManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "exchangeList");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "copy");

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v23 = v22;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v33 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v28, "name", (_QWORD)v32);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v19, "containsObject:", v29);

          if ((v30 & 1) == 0)
          {
            +[ExchangeManager sharedManager](ExchangeManager, "sharedManager");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "removeExchange:", v28);

          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      }
      while (v25);
    }

  }
}

void __43__StockUpdater__parseExchangeDictionaries___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  Exchange *v8;
  NSObject *v9;
  void *v10;

  v5 = a2;
  v6 = a3;
  +[ExchangeManager sharedManager](ExchangeManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "exchangeWithName:", v5);
  v8 = (Exchange *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    StocksLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __43__StockUpdater__parseExchangeDictionaries___block_invoke_cold_1(v8, (uint64_t)v6, v9);

    -[Exchange updateWithDictionary:](v8, "updateWithDictionary:", v6);
  }
  else
  {
    v8 = -[Exchange initWithDictionary:]([Exchange alloc], "initWithDictionary:", v6);
    +[ExchangeManager sharedManager](ExchangeManager, "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addExchange:", v8);

  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

- (BOOL)hadError
{
  return self->_lastError != 0;
}

- (void)didParseData
{
  void *v3;
  id WeakRetained;
  void *v5;
  NSArray *requestStocks;
  NSArray *pendingStocks;
  void (**updateCompletionHandler)(id, uint64_t, _QWORD);
  NSArray *v9;

  +[StockManager sharedManager](StockManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "saveDataChanges");

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "stockUpdater:didUpdateStocks:isComprehensive:", self, self->_requestStocks, self->_isComprehensive);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("StocksUpdateLoadingStatusNotification"), 0);

  requestStocks = self->_requestStocks;
  self->_requestStocks = 0;

  if (-[NSArray count](self->_pendingStocks, "count"))
  {
    pendingStocks = self->_pendingStocks;
    self->_pendingStocks = 0;
    v9 = pendingStocks;

    -[StockUpdater _updateStocks:comprehensive:forceUpdate:](self, "_updateStocks:comprehensive:forceUpdate:", v9, self->_isComprehensive, self->_forceUpdate);
  }
  else
  {
    updateCompletionHandler = (void (**)(id, uint64_t, _QWORD))self->_updateCompletionHandler;
    if (updateCompletionHandler)
    {
      updateCompletionHandler[2](updateCompletionHandler, 1, 0);
      -[StockUpdater setUpdateCompletionHandler:](self, "setUpdateCompletionHandler:", 0);
    }
  }
}

- (void)failWithError:(id)a3
{
  id v5;
  id WeakRetained;
  void *v7;
  NSArray *requestStocks;
  void (**updateCompletionHandler)(id, _QWORD, id);
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)StockUpdater;
  -[YQLRequest failWithError:](&v10, sel_failWithError_, v5);
  objc_storeStrong((id *)&self->_lastError, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "stockUpdater:didFailWithError:whileUpdatingStocks:comprehensive:", self, v5, self->_requestStocks, self->_isComprehensive);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("StocksUpdateLoadingStatusNotification"), 0);

  requestStocks = self->_requestStocks;
  self->_requestStocks = 0;

  updateCompletionHandler = (void (**)(id, _QWORD, id))self->_updateCompletionHandler;
  if (updateCompletionHandler)
  {
    updateCompletionHandler[2](updateCompletionHandler, 0, v5);
    -[StockUpdater setUpdateCompletionHandler:](self, "setUpdateCompletionHandler:", 0);
  }

}

- (StockUpdaterDelegate)delegate
{
  return (StockUpdaterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isComprehensive
{
  return self->_isComprehensive;
}

- (BOOL)forceUpdate
{
  return self->_forceUpdate;
}

- (NSArray)requestStocks
{
  return self->_requestStocks;
}

- (void)setRequestStocks:(id)a3
{
  objc_storeStrong((id *)&self->_requestStocks, a3);
}

- (NSArray)pendingStocks
{
  return self->_pendingStocks;
}

- (void)setPendingStocks:(id)a3
{
  objc_storeStrong((id *)&self->_pendingStocks, a3);
}

- (id)updateCompletionHandler
{
  return self->_updateCompletionHandler;
}

- (void)setUpdateCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateCompletionHandler, 0);
  objc_storeStrong((id *)&self->_pendingStocks, 0);
  objc_storeStrong((id *)&self->_requestStocks, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastError, 0);
}

void __43__StockUpdater__parseExchangeDictionaries___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_debug_impl(&dword_21736B000, a3, OS_LOG_TYPE_DEBUG, "#StockUpdater Updating #exchange %@ with dictionary %@", (uint8_t *)&v6, 0x16u);

}

@end
