@implementation YQLRequest

- (id)_yahooDoppelganger_taskForRequest:(id)a3 delegate:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (!activeDoppelgangers)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v8 = (void *)activeDoppelgangers;
    activeDoppelgangers = (uint64_t)v7;

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = (id)preppedDoppelgangers;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v22;
    while (2)
    {
      v14 = 0;
      v15 = v12;
      do
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v9);
        v12 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * v14);

        if (objc_msgSend(v12, "matchesRequest:", v5))
        {
          objc_msgSend((id)activeDoppelgangers, "addObject:", v12);
          objc_msgSend((id)preppedDoppelgangers, "removeObject:", v12);
          if (v6)
            objc_msgSend(v12, "setDelegate:", v6);
          objc_msgSend(v12, "start");
          v18 = v12;
          v19 = v18;
          goto LABEL_16;
        }
        ++v14;
        v15 = v12;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v11)
        continue;
      break;
    }

  }
  v16 = (void *)testHarness;
  v17 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "HTTPBodyString");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("YahooDoppelganger had no prepared response for the request %@"), v18);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "assertTrue:withMessage:", 0, v9);
  v19 = 0;
LABEL_16:

  return v19;
}

- (YQLRequest)init
{
  YQLRequest *v2;
  YQLRequest *v3;
  YQLRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)YQLRequest;
  v2 = -[YQLRequest init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[YQLRequest _createDefaultSession](v2, "_createDefaultSession");
    v4 = v3;
  }

  return v3;
}

- (void)dealloc
{
  NSURLSession *defaultSession;
  objc_super v4;

  defaultSession = self->_defaultSession;
  self->_defaultSession = 0;

  v4.receiver = self;
  v4.super_class = (Class)YQLRequest;
  -[YQLRequest dealloc](&v4, sel_dealloc);
}

- (void)_createDefaultSession
{
  void *v3;
  void *v4;
  NSURLSession *v5;
  NSURLSession *defaultSession;
  id v7;

  objc_msgSend(MEMORY[0x24BDB74B8], "defaultSessionConfiguration");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSharedContainerIdentifier:", CFSTR("group.com.apple.stocks"));
  v3 = (void *)MEMORY[0x24BDB74B0];
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sessionWithConfiguration:delegate:delegateQueue:", v7, self, v4);
  v5 = (NSURLSession *)objc_claimAutoreleasedReturnValue();
  defaultSession = self->_defaultSession;
  self->_defaultSession = v5;

}

- (void)_loadDefaultSessionIfNeeded
{
  if (!self->_defaultSession)
    -[YQLRequest _createDefaultSession](self, "_createDefaultSession");
}

- (id)taskForRequest:(id)a3 delegate:(id)a4
{
  id v5;
  void *v6;

  v5 = a3;
  -[YQLRequest _loadDefaultSessionIfNeeded](self, "_loadDefaultSessionIfNeeded");
  -[NSURLSession dataTaskWithRequest:](self->_defaultSession, "dataTaskWithRequest:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)loadRequest:(id)a3
{
  id v5;
  NSURLRequest **p_request;
  NSURLSessionTask *v7;
  NSURLSessionTask *dataTask;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  p_request = &self->_request;
  objc_storeStrong((id *)&self->_request, a3);
  -[YQLRequest taskForRequest:delegate:](self, "taskForRequest:delegate:", self->_request, self);
  v7 = (NSURLSessionTask *)objc_claimAutoreleasedReturnValue();
  dataTask = self->_dataTask;
  self->_dataTask = v7;

  -[NSURLSessionTask resume](self->_dataTask, "resume");
  v9 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[NSURLRequest HTTPBody](self->_request, "HTTPBody");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithData:encoding:", v10, 4);

  StocksLogForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    -[NSURLSessionTask description](self->_dataTask, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 136315394;
    v18 = "-[YQLRequest loadRequest:]";
    v19 = 2114;
    v20 = v13;
    _os_log_impl(&dword_21736B000, v12, OS_LOG_TYPE_DEFAULT, "%s %{public}@", (uint8_t *)&v17, 0x16u);

  }
  StocksLogForCategory(0);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[YQLRequest loadRequest:].cold.2((id *)p_request, v14);

  StocksLogForCategory(0);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[YQLRequest loadRequest:].cold.1((uint64_t)v11, v15, v16);

}

- (BOOL)isLoading
{
  return self->_dataTask != 0;
}

- (void)parseData:(id)a3
{
  int v4;
  const char *Name;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_21736B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s to be implemented by subclass", (uint8_t *)&v4, 0xCu);
  }
}

- (void)didParseData
{
  int v3;
  const char *Name;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_21736B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s to be implemented by subclass", (uint8_t *)&v3, 0xCu);
  }
}

- (void)failWithError:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  StocksLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[YQLRequest failWithError:].cold.1((uint64_t)self, v4, v5);

  -[YQLRequest cancel](self, "cancel");
}

- (void)failToParseWithData:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.stocks"), 4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[YQLRequest failWithError:](self, "failWithError:", v5);

  StocksLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v4, 4);
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_21736B000, v6, OS_LOG_TYPE_DEFAULT, "#YQLRequest Attempted to parse %@", (uint8_t *)&v8, 0xCu);

  }
}

- (void)failToParseWithDataSeriesDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("error"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v12 = CFSTR("error");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("error"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.stocks"), 4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[YQLRequest failWithError:](self, "failWithError:", v8);

  StocksLogForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_21736B000, v9, OS_LOG_TYPE_DEFAULT, "#YQLRequest Attempted to parse %@", (uint8_t *)&v10, 0xCu);
  }

}

- (void)cancel
{
  NSObject *v3;
  void *v4;
  NSURLSessionTask *dataTask;
  NSURLRequest *request;
  NSMutableData *rawData;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  StocksLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[NSURLSessionTask description](self->_dataTask, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[YQLRequest cancel]";
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_21736B000, v3, OS_LOG_TYPE_DEFAULT, "%s %{public}@", (uint8_t *)&v8, 0x16u);

  }
  -[NSURLSessionTask cancel](self->_dataTask, "cancel");
  dataTask = self->_dataTask;
  self->_dataTask = 0;

  request = self->_request;
  self->_request = 0;

  rawData = self->_rawData;
  self->_rawData = 0;

}

- (void)cancelAndInvalidate
{
  NSURLSession *defaultSession;

  -[NSURLSession invalidateAndCancel](self->_defaultSession, "invalidateAndCancel");
  defaultSession = self->_defaultSession;
  self->_defaultSession = 0;

}

+ (void)saveDebugString
{
  void *v2;
  void *v3;
  id v4;

  +[NetPreferences sharedPreferences](NetPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceDebuggingPath");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_web_removeFileOnlyAtPath:", v4);

}

- (id)YQLCountryCode
{
  void *v2;
  void *v3;

  +[NetPreferences sharedPreferences](NetPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stocksCountryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)YQLLanguageCode
{
  void *v2;
  void *v3;

  +[NetPreferences sharedPreferences](NetPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stocksLanguageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  NSMutableData *rawData;
  NSMutableData *v6;
  objc_class *v8;
  id v9;
  NSMutableData *v10;
  NSMutableData *v11;

  rawData = self->_rawData;
  if (rawData)
  {
    v11 = (NSMutableData *)a5;
    -[NSMutableData appendData:](rawData, "appendData:", v11);
    v6 = v11;
  }
  else
  {
    v8 = (objc_class *)MEMORY[0x24BDBCEC8];
    v9 = a5;
    v10 = (NSMutableData *)objc_msgSend([v8 alloc], "initWithData:", v9);

    v6 = self->_rawData;
    self->_rawData = v10;
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSMutableData *rawData;
  NSURLSessionTask *dataTask;
  NSMutableData *v14;
  NSURLRequest *request;
  NSMutableData *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  StocksLogForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[YQLRequest URLSession:task:didCompleteWithError:].cold.1(v8, v7, v10);

    -[YQLRequest failWithError:](self, "failWithError:", v8);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 136315394;
      v18 = "-[YQLRequest URLSession:task:didCompleteWithError:]";
      v19 = 2114;
      v20 = v11;
      _os_log_impl(&dword_21736B000, v10, OS_LOG_TYPE_DEFAULT, "%s %{public}@", (uint8_t *)&v17, 0x16u);

    }
    rawData = self->_rawData;
    dataTask = self->_dataTask;
    self->_dataTask = 0;
    v14 = rawData;

    request = self->_request;
    self->_request = 0;

    v16 = self->_rawData;
    self->_rawData = 0;

    -[YQLRequest parseData:](self, "parseData:", v14);
  }
  -[YQLRequest cancelAndInvalidate](self, "cancelAndInvalidate");

}

+ (void)setShouldGenerateOfflineData:(BOOL)a3
{
  __shouldGenerateOfflineData = a3;
}

+ (BOOL)shouldGenerateOfflineData
{
  return __shouldGenerateOfflineData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawData, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);
  objc_storeStrong((id *)&self->_defaultSession, 0);
}

- (void)loadRequest:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_3(&dword_21736B000, a2, a3, "#YQLRequest body\n%@", (uint8_t *)&v3);
}

- (void)loadRequest:(id *)a1 .cold.2(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "allHTTPHeaderFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_3(&dword_21736B000, a2, v4, "#YQLRequest headers\n%@", (uint8_t *)&v5);

}

- (void)failWithError:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "localizedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  _os_log_error_impl(&dword_21736B000, a3, OS_LOG_TYPE_ERROR, "#%@ failWithError %@", (uint8_t *)&v8, 0x16u);

}

- (void)URLSession:(void *)a1 task:(void *)a2 didCompleteWithError:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  int v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(a1, "code");
  objc_msgSend(a2, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 136315650;
  v8 = "-[YQLRequest URLSession:task:didCompleteWithError:]";
  v9 = 1024;
  v10 = v5;
  v11 = 2114;
  v12 = v6;
  _os_log_error_impl(&dword_21736B000, a3, OS_LOG_TYPE_ERROR, "%s %{errno}d %{public}@", (uint8_t *)&v7, 0x1Cu);

}

@end
