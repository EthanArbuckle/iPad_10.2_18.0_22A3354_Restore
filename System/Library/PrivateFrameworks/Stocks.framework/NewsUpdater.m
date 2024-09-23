@implementation NewsUpdater

+ (id)sharedNewsUpdater
{
  void *v2;
  NewsUpdater *v3;
  void *v4;

  v2 = (void *)sharedNewsUpdater_sharedNewsUpdater;
  if (!sharedNewsUpdater_sharedNewsUpdater)
  {
    v3 = objc_alloc_init(NewsUpdater);
    v4 = (void *)sharedNewsUpdater_sharedNewsUpdater;
    sharedNewsUpdater_sharedNewsUpdater = (uint64_t)v3;

    v2 = (void *)sharedNewsUpdater_sharedNewsUpdater;
  }
  return v2;
}

+ (id)_newsItemCollectionCache
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_cache;
  if (!_cache)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 20);
    v4 = (void *)_cache;
    _cache = v3;

    v2 = (void *)_cache;
  }
  return v2;
}

- (NewsUpdater)init
{
  NewsUpdater *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NewsUpdater;
  result = -[YQLRequest init](&v3, sel_init);
  if (result)
    result->_firstLoad = 1;
  return result;
}

- (BOOL)shouldReloadOnResume
{
  void *v2;
  double v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", CFSTR("nidtk"));
  v4 = CFAbsoluteTimeGetCurrent() - v3 > 1800.0;

  return v4;
}

- (void)clearNewsCacheOnDisk
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("nidtk"));
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("nidak"));

}

- (void)loadNewsCacheFromDiskForSymbol:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  StockNewsItemCollection *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  if (objc_msgSend(v12, "length"))
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "doubleForKey:", CFSTR("nidtk"));
    v6 = v5;
    if (CFAbsoluteTimeGetCurrent() - v5 <= 345600.0)
    {
      objc_msgSend(v4, "arrayForKey:", CFSTR("nidak"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = -[StockNewsItemCollection initWithArchiveArray:]([StockNewsItemCollection alloc], "initWithArchiveArray:", v7);
        -[StockNewsItemCollection newsItems](v8, "newsItems");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");

        if (v10)
        {
          -[StockNewsItemCollection setExpirationTime:](v8, "setExpirationTime:", v6 + 60.0);
          +[NewsUpdater _newsItemCollectionCache](NewsUpdater, "_newsItemCollectionCache");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKey:", v8, v12);

        }
      }

    }
    else
    {
      -[NewsUpdater clearNewsCacheOnDisk](self, "clearNewsCacheOnDisk");
    }

  }
}

- (void)fetchNewsForStock:(id)a3 withCompletion:(id)a4
{
  Stock *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  id v19;
  char v20;
  id stock;
  double v22;
  double v23;
  void *v24;
  StockNewsItemCollection *v25;
  StockNewsItemCollection *lastNewsItemCollection;
  NSObject *v27;
  void *v28;
  id updateCompletionHandler;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  double Current;
  double v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  _QWORD v56[5];
  _QWORD block[5];
  _QWORD v58[4];
  id v59;
  id v60;
  _QWORD v61[4];
  _QWORD v62[4];
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  const char *v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v8 = (Stock *)a3;
  v9 = a4;
  StocksLogForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[Stock symbol](v8, "symbol");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[NetPreferences sharedPreferences](NetPreferences, "sharedPreferences");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isNetworkReachable");
    v14 = "NO";
    if (v13)
      v14 = "YES";
    *(_DWORD *)buf = 138412546;
    v64 = v11;
    v65 = 2080;
    v66 = v14;
    _os_log_impl(&dword_21736B000, v10, OS_LOG_TYPE_DEFAULT, "#NewsUpdater fetchNewsForStock: %@ (reachable: %s)", buf, 0x16u);

  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NewsUpdater.m"), 261, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stock != nil"));

  }
  v15 = objc_msgSend((id)objc_opt_class(), "shouldGenerateOfflineData");
  +[NetPreferences sharedPreferences](NetPreferences, "sharedPreferences");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isNetworkReachable");

  if ((v17 & 1) != 0)
  {
    if (!v8)
    {
      -[YQLRequest cancel](self, "cancel");
      stock = self->_stock;
      self->_stock = 0;
      goto LABEL_38;
    }
    if (self->_stock == v8)
    {
      StocksLogForCategory(0);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        -[Stock symbol](self->_stock, "symbol");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v64 = v28;
        _os_log_impl(&dword_21736B000, v27, OS_LOG_TYPE_DEFAULT, "#NewsUpdater Skipping duplicate news update request for %@", buf, 0xCu);

      }
      updateCompletionHandler = self->_updateCompletionHandler;
      if (updateCompletionHandler)
      {
        v30 = (void *)objc_msgSend(updateCompletionHandler, "copy");
        v58[0] = MEMORY[0x24BDAC760];
        v58[1] = 3221225472;
        v58[2] = __48__NewsUpdater_fetchNewsForStock_withCompletion___block_invoke;
        v58[3] = &unk_24D74B918;
        v59 = v30;
        v60 = v9;
        stock = v30;
        v31 = (void *)MEMORY[0x219A0B984](v58);
        v32 = self->_updateCompletionHandler;
        self->_updateCompletionHandler = v31;

      }
      else
      {
        v33 = (void *)objc_msgSend(v9, "copy");
        stock = self->_updateCompletionHandler;
        self->_updateCompletionHandler = v33;
      }
    }
    else
    {
      v18 = (void *)objc_msgSend(v9, "copy");
      v19 = self->_updateCompletionHandler;
      self->_updateCompletionHandler = v18;

      -[YQLRequest cancel](self, "cancel");
      if (self->_firstLoad)
        v20 = v15;
      else
        v20 = 1;
      if ((v20 & 1) == 0)
      {
        self->_firstLoad = 0;
        objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
        stock = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(stock, "doubleForKey:", CFSTR("nidtk"));
        v23 = v22;
        objc_msgSend(stock, "removeObjectForKey:", CFSTR("nidtk"));
        if (CFAbsoluteTimeGetCurrent() - v23 <= 1800.0)
        {
          objc_msgSend(stock, "objectForKey:", CFSTR("nidak"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(stock, "removeObjectForKey:", CFSTR("nidak"));
          objc_msgSend(stock, "synchronize");
          if (objc_msgSend(v24, "count"))
          {
            self->_lastResponseTimestamp = v23;
            v25 = -[StockNewsItemCollection initWithArchiveArray:]([StockNewsItemCollection alloc], "initWithArchiveArray:", v24);
            lastNewsItemCollection = self->_lastNewsItemCollection;
            self->_lastNewsItemCollection = v25;

            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __48__NewsUpdater_fetchNewsForStock_withCompletion___block_invoke_2;
            block[3] = &unk_24D74B7C0;
            block[4] = self;
            dispatch_async(MEMORY[0x24BDAC9B8], block);

            goto LABEL_38;
          }

        }
      }
      +[NewsUpdater _newsItemCollectionCache](NewsUpdater, "_newsItemCollectionCache");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[Stock symbol](v8, "symbol");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectForKey:", v35);
      stock = (id)objc_claimAutoreleasedReturnValue();

      if (stock)
        v36 = v15;
      else
        v36 = 1;
      if ((v36 & 1) != 0
        || (Current = CFAbsoluteTimeGetCurrent(), objc_msgSend(stock, "expirationTime"), Current >= v38)
        || (objc_msgSend(stock, "newsItems"),
            v39 = (void *)objc_claimAutoreleasedReturnValue(),
            v40 = objc_msgSend(v39, "count"),
            v39,
            !v40))
      {
        v55 = v9;
        objc_storeStrong((id *)&self->_stock, a3);
        +[NetPreferences sharedPreferences](NetPreferences, "sharedPreferences");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[YQLRequest YQLLanguageCode](self, "YQLLanguageCode");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[YQLRequest YQLCountryCode](self, "YQLCountryCode");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v62[0] = CFSTR("json");
        v61[0] = CFSTR("format");
        v61[1] = CFSTR("tickers");
        -[Stock symbol](v8, "symbol");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v62[1] = v44;
        v62[2] = v42;
        v61[2] = CFSTR("lang");
        v61[3] = CFSTR("region");
        v62[3] = v43;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v62, v61, 4);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v41, "stocksYQLBaseURL");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "URLByAppendingPathComponent:", CFSTR("applewf/news"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v41, "signedRequestForURL:parameters:", v47, v45);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v41, "serviceDebugging"))
        {
          v53 = v43;
          objc_msgSend(v48, "URL");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "absoluteString");
          v54 = v42;
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          +[YQLRequest appendDebugString:](YQLRequest, "appendDebugString:", v50);

          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v45);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v54;
          +[YQLRequest appendDebugString:](YQLRequest, "appendDebugString:", v51);

          v43 = v53;
        }
        -[YQLRequest loadRequest:](self, "loadRequest:", v48);

        v9 = v55;
      }
      else
      {
        objc_storeStrong((id *)&self->_lastNewsItemCollection, stock);
        v56[0] = MEMORY[0x24BDAC760];
        v56[1] = 3221225472;
        v56[2] = __48__NewsUpdater_fetchNewsForStock_withCompletion___block_invoke_3;
        v56[3] = &unk_24D74B7C0;
        v56[4] = self;
        dispatch_async(MEMORY[0x24BDAC9B8], v56);
      }
    }
  }
  else
  {
    if (!self->_stock)
      objc_storeStrong((id *)&self->_stock, a3);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.stocks"), 3, 0);
    stock = (id)objc_claimAutoreleasedReturnValue();
    -[NewsUpdater failWithError:](self, "failWithError:", stock);
  }
LABEL_38:

}

void __48__NewsUpdater_fetchNewsForStock_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v5);
    v5 = v8;
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
    v5 = v8;
  }

}

uint64_t __48__NewsUpdater_fetchNewsForStock_withCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didParseData");
}

uint64_t __48__NewsUpdater_fetchNewsForStock_withCompletion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didParseData");
}

- (void)fetchNewsForStock:(id)a3
{
  -[NewsUpdater fetchNewsForStock:withCompletion:](self, "fetchNewsForStock:withCompletion:", a3, 0);
}

- (void)saveLastResponse
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDouble:forKey:", CFSTR("nidtk"), self->_lastResponseTimestamp);
  -[StockNewsItemCollection archiveArray](self->_lastNewsItemCollection, "archiveArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("nidak"));

}

- (void)parseData:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  StockNewsItem *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t j;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  CFAbsoluteTime Current;
  StockNewsItemCollection *v55;
  StockNewsItemCollection *lastNewsItemCollection;
  void *v57;
  Stock *stock;
  void *v59;
  double v60;
  _BOOL4 v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  id v66;
  void *v67;
  id v68;
  void *v69;
  id v71;
  id obj;
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint64_t v82;
  _BYTE v83[128];
  _QWORD v84[2];
  const __CFString *v85;
  uint8_t buf[4];
  void *v87;
  const __CFString *v88;
  const __CFString *v89;
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v82 = 0;
  v68 = a3;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:");
  v3 = objc_claimAutoreleasedReturnValue();
  v66 = 0;
  v67 = (void *)v3;
  +[YahooResponseParser arrayWithDictionaryKeyPath:inJSONObject:wrapResultIfDictionary:](YahooResponseParser, "arrayWithDictionaryKeyPath:inJSONObject:wrapResultIfDictionary:", &unk_24D760AF0, v3, 1);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v69)
  {
    -[YQLRequest failToParseWithData:](self, "failToParseWithData:", v68);
    goto LABEL_53;
  }
  v71 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  obj = v69;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
  if (v4)
  {
    v73 = *(_QWORD *)v79;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v79 != v73)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("headline"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v8 = objc_alloc_init(StockNewsItem);
            v9 = objc_opt_class();
            v89 = CFSTR("title");
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v89, 1);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            +[YahooResponseParser objectOfClass:withDictionaryKeyPath:inJSONObject:](YahooResponseParser, "objectOfClass:withDictionaryKeyPath:inJSONObject:", v9, v10, v7);
            v11 = objc_claimAutoreleasedReturnValue();
            -[StockNewsItem setHeadline:](v8, "setHeadline:", v11);

            -[StockNewsItem headline](v8, "headline");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v11) = objc_msgSend(v12, "length") == 0;

            if ((v11 & 1) == 0)
            {
              v13 = objc_opt_class();
              v88 = CFSTR("shortSummary");
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v88, 1);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              +[YahooResponseParser objectOfClass:withDictionaryKeyPath:inJSONObject:](YahooResponseParser, "objectOfClass:withDictionaryKeyPath:inJSONObject:", v13, v14, v7);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              -[StockNewsItem setSummary:](v8, "setSummary:", v15);

              StocksLogForCategory(0);
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              {
                -[StockNewsItem headline](v8, "headline");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v87 = v17;
                _os_log_impl(&dword_21736B000, v16, OS_LOG_TYPE_INFO, "#NewsUpdater headline: %@", buf, 0xCu);

              }
              StocksLogForCategory(0);
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
              {
                -[StockNewsItem summary](v8, "summary");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v87 = v19;
                _os_log_impl(&dword_21736B000, v18, OS_LOG_TYPE_INFO, "#NewsUpdater summary: %@", buf, 0xCu);

              }
              v20 = objc_opt_class();
              v85 = CFSTR("url");
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v85, 1);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              +[YahooResponseParser objectOfClass:withDictionaryKeyPath:inJSONObject:](YahooResponseParser, "objectOfClass:withDictionaryKeyPath:inJSONObject:", v20, v21, v7);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x24BDBCF48], "stocks_sanitizedURLFromString:", v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (v23)
              {
                -[StockNewsItem setLink:](v8, "setLink:", v23);
                StocksLogForCategory(0);
                v24 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                {
                  -[StockNewsItem link](v8, "link");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v87 = v25;
                  _os_log_impl(&dword_21736B000, v24, OS_LOG_TYPE_INFO, "#NewsUpdater URL: %@", buf, 0xCu);

                }
                objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("meta"));
                v26 = objc_claimAutoreleasedReturnValue();
                v27 = objc_opt_class();
                v84[0] = CFSTR("provider");
                v84[1] = CFSTR("name");
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v84, 2);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                +[YahooResponseParser objectOfClass:withDictionaryKeyPath:inJSONObject:](YahooResponseParser, "objectOfClass:withDictionaryKeyPath:inJSONObject:", v27, v28, v26);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                -[StockNewsItem setSource:](v8, "setSource:", v29);

                -[NSObject objectForKeyedSubscript:](v26, "objectForKeyedSubscript:", CFSTR("publishTime"));
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                if (v30)
                {
                  v31 = (void *)parseData__formatter;
                  if (!parseData__formatter)
                  {
                    v32 = objc_alloc_init(MEMORY[0x24BDD1500]);
                    v33 = (void *)parseData__formatter;
                    parseData__formatter = (uint64_t)v32;

                    objc_msgSend((id)parseData__formatter, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss.SSS'Z"));
                    v34 = (void *)parseData__formatter;
                    objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", 0);
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v34, "setTimeZone:", v35);

                    v36 = (void *)parseData__formatter;
                    objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v36, "setLocale:", v37);

                    v31 = (void *)parseData__formatter;
                  }
                  objc_msgSend(v31, "dateFromString:", v30);
                  v38 = objc_claimAutoreleasedReturnValue();
                  -[StockNewsItem setDate:](v8, "setDate:", v38);

                  -[StockNewsItem date](v8, "date");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  LOBYTE(v38) = v39 == 0;

                  if ((v38 & 1) == 0)
                  {
                    StocksLogForCategory(0);
                    v40 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
                    {
                      -[StockNewsItem date](v8, "date");
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      v87 = v41;
                      _os_log_impl(&dword_21736B000, v40, OS_LOG_TYPE_INFO, "#NewsUpdater date: %@", buf, 0xCu);

                    }
                    objc_msgSend(v71, "addObject:", v8);
                  }
                }

              }
              else
              {
                StocksLogForCategory(0);
                v26 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v87 = v22;
                  _os_log_impl(&dword_21736B000, v26, OS_LOG_TYPE_DEFAULT, "#NewsUpdater Skipping news item with unparsable URL %@", buf, 0xCu);
                }
              }

            }
          }

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
    }
    while (v4);
  }

  objc_msgSend(v71, "sortUsingSelector:", sel_chronologicalComparisonWithNewsItem_);
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", objc_msgSend(v71, "count"));
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v43 = v71;
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
  if (v44)
  {
    v45 = 0;
    v46 = 0;
    v47 = *(_QWORD *)v75;
    do
    {
      for (j = 0; j != v44; ++j)
      {
        if (*(_QWORD *)v75 != v47)
          objc_enumerationMutation(v43);
        v49 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * j);
        objc_msgSend(v49, "headline");
        v50 = objc_claimAutoreleasedReturnValue();

        v45 = (void *)v50;
        if (objc_msgSend(v42, "containsObject:", v50))
        {
          if (v46)
            objc_msgSend(v46, "addObject:", v49);
          else
            v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v49, 0);
        }
        else
        {
          objc_msgSend(v42, "addObject:", v50);
        }
      }
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
    }
    while (v44);

    if (v46)
      objc_msgSend(v43, "removeObjectsInArray:", v46);
  }
  else
  {

    v46 = 0;
    v45 = 0;
  }
  -[Stock symbol](self->_stock, "symbol");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  +[NewsUpdater _newsItemCollectionCache](NewsUpdater, "_newsItemCollectionCache");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "objectForKey:", v51);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  Current = CFAbsoluteTimeGetCurrent();
  if (!objc_msgSend(v43, "count"))
  {
    objc_msgSend(v53, "newsItems");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v59, "count"))
    {
      objc_msgSend(v53, "expirationTime");
      v61 = v60 + -60.0 > Current + -345600.0;

      if (v61)
      {
        v62 = (void *)MEMORY[0x24BDBCE30];
        objc_msgSend(v53, "newsItems");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "arrayWithArray:", v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setNewsItems:", v64);

        objc_storeStrong((id *)&self->_lastNewsItemCollection, v53);
        -[StockNewsItemCollection expirationTime](self->_lastNewsItemCollection, "expirationTime");
        self->_lastResponseTimestamp = v65 + -60.0;
        goto LABEL_50;
      }
    }
    else
    {

    }
  }
  self->_lastResponseTimestamp = Current;
  v55 = objc_alloc_init(StockNewsItemCollection);
  lastNewsItemCollection = self->_lastNewsItemCollection;
  self->_lastNewsItemCollection = v55;

  -[StockNewsItemCollection setNewsItems:](self->_lastNewsItemCollection, "setNewsItems:", v43);
  -[StockNewsItemCollection setExpirationTime:](self->_lastNewsItemCollection, "setExpirationTime:", self->_lastResponseTimestamp + 60.0);
LABEL_50:
  if (objc_msgSend(v51, "length"))
  {
    +[NewsUpdater _newsItemCollectionCache](NewsUpdater, "_newsItemCollectionCache");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setObject:forKey:", self->_lastNewsItemCollection, v51);

  }
  stock = self->_stock;
  self->_stock = 0;

  -[NewsUpdater didParseData](self, "didParseData");
LABEL_53:

}

- (void)failWithError:(id)a3
{
  id v4;
  void (**updateCompletionHandler)(id, _QWORD, id);
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  CFAbsoluteTime v12;
  CFAbsoluteTime v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  id WeakRetained;
  void *v19;
  Stock *stock;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NewsUpdater;
  -[YQLRequest failWithError:](&v21, sel_failWithError_, v4);
  updateCompletionHandler = (void (**)(id, _QWORD, id))self->_updateCompletionHandler;
  if (updateCompletionHandler)
  {
    updateCompletionHandler[2](updateCompletionHandler, 0, v4);
    v6 = self->_updateCompletionHandler;
    self->_updateCompletionHandler = 0;

  }
  -[Stock symbol](self->_stock, "symbol");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[NewsUpdater _newsItemCollectionCache](NewsUpdater, "_newsItemCollectionCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "newsItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "count"))
  {

    goto LABEL_7;
  }
  objc_msgSend(v9, "expirationTime");
  v12 = v11 + -60.0;
  v13 = CFAbsoluteTimeGetCurrent() + -345600.0;

  if (v12 <= v13)
  {
LABEL_7:
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "newsUpdater:didFailWithError:", self, v4);
    goto LABEL_8;
  }
  v14 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(v9, "newsItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "arrayWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNewsItems:", v16);

  objc_storeStrong((id *)&self->_lastNewsItemCollection, v9);
  -[StockNewsItemCollection expirationTime](self->_lastNewsItemCollection, "expirationTime");
  self->_lastResponseTimestamp = v17 + -60.0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[StockNewsItemCollection newsItems](self->_lastNewsItemCollection, "newsItems");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "newsUpdater:didReceiveNewsItems:", self, v19);

LABEL_8:
  stock = self->_stock;
  self->_stock = 0;

}

- (void)didParseData
{
  void (**updateCompletionHandler)(id, uint64_t, _QWORD);
  id v4;
  void *v5;
  id WeakRetained;

  updateCompletionHandler = (void (**)(id, uint64_t, _QWORD))self->_updateCompletionHandler;
  if (updateCompletionHandler)
  {
    updateCompletionHandler[2](updateCompletionHandler, 1, 0);
    v4 = self->_updateCompletionHandler;
    self->_updateCompletionHandler = 0;

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[StockNewsItemCollection newsItems](self->_lastNewsItemCollection, "newsItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "newsUpdater:didReceiveNewsItems:", self, v5);

}

- (void)resetLocale
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (_cache)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    objc_msgSend((id)_cache, "allValues", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
          objc_msgSend(v7, "setExpirationTime:", 0.0);
          objc_msgSend(v7, "newsItems");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "makeObjectsPerformSelector:", sel_resetLocale);

        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v4);
    }

  }
}

- (NewsUpdaterDelegate)delegate
{
  return (NewsUpdaterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateCompletionHandler, 0);
  objc_storeStrong((id *)&self->_stock, 0);
  objc_storeStrong((id *)&self->_lastNewsItemCollection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)parseData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[NewsUpdater parseData:]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_21736B000, a2, OS_LOG_TYPE_ERROR, "#NewsUpdater *** [%s] Caught exception: %@", (uint8_t *)&v2, 0x16u);
}

@end
