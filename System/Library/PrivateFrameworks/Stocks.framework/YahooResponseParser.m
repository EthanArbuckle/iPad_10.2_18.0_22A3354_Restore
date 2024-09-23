@implementation YahooResponseParser

+ (id)objectWithDictionaryKeyPath:(id)a3 inJSONObject:(id)a4
{
  return (id)objc_msgSend(a1, "objectOfClass:withDictionaryKeyPath:inJSONObject:", 0, a3, a4);
}

+ (id)dictionaryWithDictionaryKeyPath:(id)a3 inJSONObject:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "objectOfClass:withDictionaryKeyPath:inJSONObject:", objc_opt_class(), v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)arrayWithDictionaryKeyPath:(id)a3 inJSONObject:(id)a4 wrapResultIfDictionary:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  _QWORD v18[2];

  v5 = a5;
  v18[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  objc_msgSend(a1, "objectWithDictionaryKeyPath:inJSONObject:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18[0] = v9;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
      v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
      v11 = v10;
      goto LABEL_10;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
    goto LABEL_6;
  }
  StocksLogForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412546;
    v15 = v9;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_21736B000, v12, OS_LOG_TYPE_DEFAULT, "#YQLRequest Unexpected object %@ in key path %@; expected array or dictionary",
      (uint8_t *)&v14,
      0x16u);
  }

  v11 = 0;
LABEL_10:

  return v11;
}

+ (id)objectOfClass:(Class)a3 withDictionaryKeyPath:(id)a4 inJSONObject:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  uint64_t *v14;
  Class v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v7 = a4;
  v8 = a5;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  v23 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy__0;
    v16[4] = __Block_byref_object_dispose__0;
    v17 = v8;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __72__YahooResponseParser_objectOfClass_withDictionaryKeyPath_inJSONObject___block_invoke;
    v11[3] = &unk_24D74C580;
    v13 = v16;
    v12 = v7;
    v14 = &v18;
    v15 = a3;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v11);

    _Block_object_dispose(v16, 8);
  }
  v9 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v9;
}

void __72__YahooResponseParser_objectOfClass_withDictionaryKeyPath_inJSONObject___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "count") - 1 <= a3)
  {
    if (!*(_QWORD *)(a1 + 56) || (objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = *(_QWORD *)(a1 + 48);
      goto LABEL_7;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = *(_QWORD *)(a1 + 40);
LABEL_7:
      objc_storeStrong((id *)(*(_QWORD *)(v8 + 8) + 40), v7);
      goto LABEL_13;
    }
    if (v7)
    {
      StocksLogForCategory(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", 0, a3 + 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412546;
        v12 = v7;
        v13 = 2112;
        v14 = v10;
        _os_log_impl(&dword_21736B000, v9, OS_LOG_TYPE_DEFAULT, "#YQLRequest Unexpected object %@ in key path %@; expected dictionary",
          (uint8_t *)&v11,
          0x16u);

      }
    }
    *a4 = 1;
  }
LABEL_13:

}

+ (void)parseData:(id)a3 resultsHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *, void *);
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[7];

  v22[6] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, void *, void *))a4;
  v18 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v6, 0, &v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v18;
  v22[0] = CFSTR("query");
  v22[1] = CFSTR("results");
  v22[2] = CFSTR("item");
  v22[3] = CFSTR("response");
  v22[4] = CFSTR("finance");
  v22[5] = CFSTR("quote_service");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dictionaryWithDictionaryKeyPath:inJSONObject:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v17 = 0;
    v13 = 0;
LABEL_6:
    v15 = 0;
    goto LABEL_7;
  }
  v21[0] = CFSTR("quotes");
  v21[1] = CFSTR("quote");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "arrayWithDictionaryKeyPath:inJSONObject:wrapResultIfDictionary:", v12, v11, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v17 = 0;
    goto LABEL_6;
  }
  v20[0] = CFSTR("exchanges");
  v20[1] = CFSTR("exchange");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "arrayWithDictionaryKeyPath:inJSONObject:wrapResultIfDictionary:", v14, v11, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = CFSTR("data_sources");
  v19[1] = CFSTR("data_source");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "arrayWithDictionaryKeyPath:inJSONObject:wrapResultIfDictionary:", v16, v11, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  v7[2](v7, v15, v13, v17);

}

+ (id)parseDataSourceMapFromDataSourceDictionaries:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[YQLConstants YQLDataSourceToStocksKeyMap](YQLConstants, "YQLDataSourceToStocksKeyMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __68__YahooResponseParser_parseDataSourceMapFromDataSourceDictionaries___block_invoke;
  v12[3] = &unk_24D74C5D0;
  v13 = v6;
  v7 = v5;
  v14 = v7;
  v8 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v12);

  v9 = v14;
  v10 = v7;

  return v10;
}

void __68__YahooResponseParser_parseDataSourceMapFromDataSourceDictionaries___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, void *);
  void *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __68__YahooResponseParser_parseDataSourceMapFromDataSourceDictionaries___block_invoke_14;
    v14 = &unk_24D74C5A8;
    v15 = v3;
    v6 = v4;
    v16 = v6;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v11);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("id"), v11, v12, v13, v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "integerValue"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, v9);

    }
  }
  else
  {
    StocksLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v3;
      _os_log_impl(&dword_21736B000, v10, OS_LOG_TYPE_DEFAULT, "#StockUpdater Invalid data source dictionary %@", buf, 0xCu);
    }

  }
}

void __68__YahooResponseParser_parseDataSourceMapFromDataSourceDictionaries___block_invoke_14(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v6);

}

+ (void)parseExchangeDictionaries:(id)a3 parsedExchangeResult:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a4;
  v6 = a3;
  +[YQLConstants YQLExchangeToStocksKeyMap](YQLConstants, "YQLExchangeToStocksKeyMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (parseExchangeDictionaries_parsedExchangeResult__onceToken != -1)
    dispatch_once(&parseExchangeDictionaries_parsedExchangeResult__onceToken, &__block_literal_global_12);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __70__YahooResponseParser_parseExchangeDictionaries_parsedExchangeResult___block_invoke_2;
  v10[3] = &unk_24D74C618;
  v11 = v7;
  v12 = v5;
  v8 = v5;
  v9 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

}

void __70__YahooResponseParser_parseExchangeDictionaries_parsedExchangeResult___block_invoke()
{
  uint64_t v0;
  void *v1;
  const __CFString *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v2 = CFSTR("name");
  v3[0] = CFSTR("name");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)parseExchangeDictionaries_parsedExchangeResult__exchangeKeyMap;
  parseExchangeDictionaries_parsedExchangeResult__exchangeKeyMap = v0;

}

void __70__YahooResponseParser_parseExchangeDictionaries_parsedExchangeResult___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, void *);
  void *v23;
  id v24;
  NSObject *v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)parseExchangeDictionaries_parsedExchangeResult__exchangeKeyMap;
    v20 = MEMORY[0x24BDAC760];
    v21 = 3221225472;
    v22 = __70__YahooResponseParser_parseExchangeDictionaries_parsedExchangeResult___block_invoke_19;
    v23 = &unk_24D74C5A8;
    v6 = v3;
    v24 = v6;
    v7 = v4;
    v25 = v7;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v20);
    -[NSObject yql_objectForKey:ofClass:](v7, "yql_objectForKey:ofClass:", CFSTR("name"), objc_opt_class(), v20, v21, v22, v23);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (YQLRegionKey_block_invoke_onceToken != -1)
        dispatch_once(&YQLRegionKey_block_invoke_onceToken, &__block_literal_global_22);
      objc_msgSend(v6, "yql_objectForKey:ofClass:", CFSTR("next_open"), objc_opt_class());
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)YQLRegionKey_block_invoke_dateFormatter, "dateFromString:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        -[NSObject setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v10, CFSTR("nextOpenDate"));
      objc_msgSend(v6, "yql_objectForKey:ofClass:", CFSTR("status"), objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11
        || (objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v11),
            (v12 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        StocksLogForCategory(0);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          __70__YahooResponseParser_parseExchangeDictionaries_parsedExchangeResult___block_invoke_2_cold_2((uint64_t)v11, (uint64_t)v6, v13);

        v12 = &unk_24D75F178;
      }
      v14 = a1;
      -[NSObject setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v12, CFSTR("status"));
      objc_msgSend(v6, "yql_objectForKey:ofClass:", CFSTR("stream_interval"), objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        v17 = objc_msgSend(v15, "integerValue");
        v18 = (double)v17;
        if (!v17)
          v18 = *MEMORY[0x24BDBD230];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v19, CFSTR("streamInterval"));

      }
      (*(void (**)(void))(*(_QWORD *)(v14 + 40) + 16))();

    }
    else
    {
      StocksLogForCategory(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __70__YahooResponseParser_parseExchangeDictionaries_parsedExchangeResult___block_invoke_2_cold_1((uint64_t)v6, v9);
    }

  }
  else
  {
    StocksLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v3;
      _os_log_impl(&dword_21736B000, v7, OS_LOG_TYPE_DEFAULT, "#StockUpdater Invalid exchange dictionary %@", buf, 0xCu);
    }
  }

}

void __70__YahooResponseParser_parseExchangeDictionaries_parsedExchangeResult___block_invoke_19(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v6);

}

void __70__YahooResponseParser_parseExchangeDictionaries_parsedExchangeResult___block_invoke_21()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)YQLRegionKey_block_invoke_dateFormatter;
  YQLRegionKey_block_invoke_dateFormatter = (uint64_t)v0;

  objc_msgSend((id)YQLRegionKey_block_invoke_dateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ssZ"));
  v2 = (void *)YQLRegionKey_block_invoke_dateFormatter;
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v3);

  v4 = (void *)YQLRegionKey_block_invoke_dateFormatter;
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocale:", v5);

}

+ (void)parseStockQuoteDictionaries:(id)a3 withDataSources:(id)a4 parsedStockResult:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  char isKindOfClass;
  void *v31;
  id v32;
  void (**v33)(id, void *, void *);
  uint64_t v34;
  uint64_t v35;
  id obj;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v32 = a4;
  v33 = (void (**)(id, void *, void *))a5;
  +[YQLConstants YQLQuoteToStocksKeyMap](YQLConstants, "YQLQuoteToStocksKeyMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v43;
    v34 = *(_QWORD *)v43;
    do
    {
      v12 = 0;
      v35 = v10;
      do
      {
        if (*(_QWORD *)v43 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          v15 = v13;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
          v17 = v15;
          if (!v16)
            goto LABEL_23;
          v18 = v16;
          v37 = v12;
          v19 = *(_QWORD *)v39;
          v20 = 0x7FFFFFFFFFFFFFFFLL;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v39 != v19)
                objc_enumerationMutation(v15);
              v22 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
              objc_msgSend(v8, "objectForKeyedSubscript:", v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              if (v23)
              {
                objc_msgSend(v15, "objectForKeyedSubscript:", v22);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  if (objc_msgSend(v22, "isEqualToString:", CFSTR("price")))
                  {
                    objc_msgSend(v24, "objectForKey:", CFSTR("data_source"));
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    v20 = objc_msgSend(v25, "integerValue");

                  }
                  objc_msgSend(v24, "objectForKey:", CFSTR("raw"));
                  v26 = objc_claimAutoreleasedReturnValue();

                  v24 = (void *)v26;
                }
                objc_msgSend(v8, "objectForKeyedSubscript:", v22);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "setObject:forKey:", v24, v27);

              }
            }
            v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
          }
          while (v18);

          v11 = v34;
          v10 = v35;
          v12 = v37;
          if (v20 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v20);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "objectForKeyedSubscript:", v28);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v14, "setObject:forKey:", v17, CFSTR("dataSource"));
LABEL_23:

          }
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("id_symbol"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("id_symbol"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v33[2](v33, v31, v14);

          }
        }
        ++v12;
      }
      while (v12 != v10);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v10);
  }

}

+ (void)parseData:(uint64_t)a3 resultsHandler:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136315394;
  v4 = "+[YahooResponseParser parseData:resultsHandler:]";
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_1_1(&dword_21736B000, a2, a3, "*** [%s] Caught exception: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3();
}

void __70__YahooResponseParser_parseExchangeDictionaries_parsedExchangeResult___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21736B000, a2, OS_LOG_TYPE_ERROR, "#StockUpdater Received exchange with missing ID! This is bad. Exchange dictionary: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3();
}

void __70__YahooResponseParser_parseExchangeDictionaries_parsedExchangeResult___block_invoke_2_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_1_1(&dword_21736B000, a3, (uint64_t)a3, "#StockUpdater Unknown or missing market status %@ for #exchange %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3();
}

@end
