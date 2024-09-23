@implementation SymbolValidator

- (SymbolValidator)initWithDelegate:(id)a3
{
  id v4;
  SymbolValidator *v5;
  SymbolValidator *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SymbolValidator;
  v5 = -[YQLRequest init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak(&v5->_delegate, v4);

  return v6;
}

- (void)validateSymbol:(id)a3 withMaxResults:(int)a4
{
  __CFString *v5;
  void *v6;
  char v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x24BDAC8D0];
  v5 = (__CFString *)a3;
  +[NetPreferences sharedPreferences](NetPreferences, "sharedPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isNetworkReachable");

  if ((v7 & 1) != 0)
  {
    if (!v5)
      return;
    v8 = (__CFString *)-[__CFString mutableCopy](v5, "mutableCopy");

    CFStringTransform(v8, 0, (CFStringRef)*MEMORY[0x24BDBD668], 0);
    +[NetPreferences sharedPreferences](NetPreferences, "sharedPreferences");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[YQLRequest YQLLanguageCode](self, "YQLLanguageCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[YQLRequest YQLCountryCode](self, "YQLCountryCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = CFSTR("format");
    v21[1] = CFSTR("ticker");
    v22[0] = CFSTR("json");
    v22[1] = v8;
    v21[2] = CFSTR("lang");
    v21[3] = CFSTR("region");
    v22[2] = v10;
    v22[3] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stocksYQLBaseURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URLByAppendingPathComponent:", CFSTR("/applewf/autocomplete"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "signedRequestForURL:parameters:", v14, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "serviceDebugging"))
    {
      objc_msgSend(v15, "URL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "absoluteString");
      v20 = v10;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[YQLRequest appendDebugString:](YQLRequest, "appendDebugString:", v17);

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v20;
      +[YQLRequest appendDebugString:](YQLRequest, "appendDebugString:", v18);

    }
    -[YQLRequest loadRequest:](self, "loadRequest:", v15);

    v5 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.stocks"), 3, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SymbolValidator failWithError:](self, "failWithError:", v19);

  }
}

- (void)parseData:(id)a3
{
  id v4;
  NSArray *symbols;
  void *v6;
  id v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSArray *v19;
  void *v20;
  SymbolValidator *v21;
  void *v22;
  void *v23;
  NSArray *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  _QWORD v33[2];
  _QWORD v34[2];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  symbols = self->_symbols;
  v21 = self;
  self->_symbols = 0;

  v30 = 0;
  v23 = v4;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v4, 0, &v30);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v30;
  v22 = v6;
  if (v7)
    v8 = 1;
  else
    v8 = v6 == 0;
  if (v8 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    -[YQLRequest failToParseWithData:](v21, "failToParseWithData:", v23);

  }
  else
  {
    +[YahooResponseParser arrayWithDictionaryKeyPath:inJSONObject:wrapResultIfDictionary:](YahooResponseParser, "arrayWithDictionaryKeyPath:inJSONObject:wrapResultIfDictionary:", &unk_24D760A78, v6, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v24 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      obj = v20;
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v27 != v10)
              objc_enumerationMutation(obj);
            v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v12, "yql_objectForKey:ofClass:", CFSTR("name"), objc_opt_class());
              v13 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "yql_objectForKey:ofClass:", CFSTR("symbol"), objc_opt_class());
              v14 = objc_claimAutoreleasedReturnValue();
              v15 = (void *)v14;
              if (v13 && v14)
              {
                v33[0] = CFSTR("companyName");
                v33[1] = CFSTR("symbol");
                v34[0] = v13;
                v34[1] = v14;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = (void *)objc_msgSend(v16, "mutableCopy");

                objc_msgSend(v12, "yql_objectForKey:ofClass:", CFSTR("exchange"), objc_opt_class());
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                if (v18)
                  objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("exchange"));
                -[NSArray addObject:](v24, "addObject:", v17, v20);

              }
            }
            else
            {
              StocksLogForCategory(0);
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v32 = v12;
                _os_log_impl(&dword_21736B000, v13, OS_LOG_TYPE_DEFAULT, "#SymbolValidator Skipping validator result %@", buf, 0xCu);
              }
            }

          }
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
        }
        while (v9);
      }

      v19 = v21->_symbols;
      v21->_symbols = v24;

      -[SymbolValidator didParseData](v21, "didParseData");
    }
    else
    {
      -[YQLRequest failToParseWithData:](v21, "failToParseWithData:", v23, 0);
    }

  }
}

- (void)didParseData
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  objc_msgSend(WeakRetained, "symbolValidator:didValidateSymbols:", self, self->_symbols);

}

- (void)failWithError:(id)a3
{
  id v4;
  id WeakRetained;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SymbolValidator;
  v4 = a3;
  -[YQLRequest failWithError:](&v6, sel_failWithError_, v4);
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  objc_msgSend(WeakRetained, "symbolValidator:didFailWithError:", self, v4, v6.receiver, v6.super_class);

}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_symbols, 0);
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
  v3 = "-[SymbolValidator parseData:]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_21736B000, a2, OS_LOG_TYPE_ERROR, "*** [%s] Caught exception: %@", (uint8_t *)&v2, 0x16u);
}

@end
