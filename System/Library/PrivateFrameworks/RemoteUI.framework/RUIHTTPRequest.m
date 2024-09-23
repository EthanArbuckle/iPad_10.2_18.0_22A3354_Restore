@implementation RUIHTTPRequest

+ (id)errorWithCode:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", RUIHTTPRequestErrorDomain, a3, 0);
}

+ (id)serviceUnavailableError
{
  return (id)objc_msgSend(a1, "errorWithCode:", 2);
}

+ (id)invalidResponseErrorWithResponse:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8[0] = CFSTR("statusCode");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v3, "statusCode"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[1] = RUIHTTPResponseKey;
    v9[0] = v4;
    v9[1] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", RUIHTTPRequestErrorDomain, 3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)nonSecureConnectionNotAllowedError
{
  return (id)objc_msgSend(a1, "errorWithCode:", 5);
}

+ (BOOL)anyRequestLoading
{
  return _loadingRequestCount != 0;
}

+ (id)safeBaseURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("x-remoteui://%@/"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("x-remoteui://remoteui/"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLWithString:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (RUIHTTPRequest)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RUIHTTPRequest;
  return -[RUIHTTPRequest init](&v3, sel_init);
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  if (self->_dataTask && _isInternalInstall())
  {
    _RUILoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209E87000, v3, OS_LOG_TYPE_DEFAULT, "RUIHTTPRequest dealloc, canceling active reqeust", buf, 2u);
    }

  }
  -[RUIHTTPRequest cancel](self, "cancel");
  -[NSURLSession invalidateAndCancel](self->_urlSession, "invalidateAndCancel");
  v4.receiver = self;
  v4.super_class = (Class)RUIHTTPRequest;
  -[RUIHTTPRequest dealloc](&v4, sel_dealloc);
}

- (void)_startedLoading
{
  ++_loadingRequestCount;
  -[RUIHTTPRequest loadStatusChanged](self, "loadStatusChanged");
}

- (void)_finishedLoading
{
  NSURLSessionDataTask *dataTask;

  --_loadingRequestCount;
  dataTask = self->_dataTask;
  self->_dataTask = 0;

  -[RUIHTTPRequest loadStatusChanged](self, "loadStatusChanged");
}

- (void)_loadRequestMain:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  v4 = a3;
  -[RUIHTTPRequest _preLoadCancel](self, "_preLoadCancel");
  if (_isInternalInstall())
  {
    _RUILoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209E87000, v5, OS_LOG_TYPE_INFO, "Querying overrides before loading the request...", buf, 2u);
    }

  }
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __35__RUIHTTPRequest__loadRequestMain___block_invoke;
  v6[3] = &unk_24C297998;
  v6[4] = self;
  -[RUIHTTPRequest shouldLoadRequest:completionHandler:](self, "shouldLoadRequest:completionHandler:", v4, v6);

}

void __35__RUIHTTPRequest__loadRequestMain___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int isInternalInstall;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *, void *, void *);
  void *v31;
  uint64_t v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  if (v6)
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v8 + 24))
    {
      objc_msgSend((id)v8, "sessionConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(*(id *)(a1 + 32), "urlSessionDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x24BDD1850];
      objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sessionWithConfiguration:delegate:delegateQueue:", v9, v10, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(void **)(v14 + 24);
      *(_QWORD *)(v14 + 24) = v13;

      v8 = *(_QWORD *)(a1 + 32);
    }
    objc_storeStrong((id *)(v8 + 8), a2);
    objc_msgSend(v6, "HTTPMethod");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lowercaseString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("post"));

    isInternalInstall = _isInternalInstall();
    if (v18)
    {
      if (isInternalInstall)
      {
        _RUILoggingFacility();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "URL");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v35 = v21;
          _os_log_impl(&dword_209E87000, v20, OS_LOG_TYPE_DEFAULT, "RUIHTTPRequest POST, URL = %@", buf, 0xCu);
LABEL_13:

          goto LABEL_14;
        }
        goto LABEL_14;
      }
    }
    else if (isInternalInstall)
    {
      _RUILoggingFacility();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "HTTPMethod");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "URL");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v35 = v21;
        v36 = 2112;
        v37 = v22;
        _os_log_impl(&dword_209E87000, v20, OS_LOG_TYPE_DEFAULT, "RUIHTTPRequest %@, URL = %@", buf, 0x16u);

        goto LABEL_13;
      }
LABEL_14:

    }
    v23 = *(_QWORD *)(a1 + 32);
    v24 = *(void **)(v23 + 24);
    v28 = MEMORY[0x24BDAC760];
    v29 = 3221225472;
    v30 = __35__RUIHTTPRequest__loadRequestMain___block_invoke_24;
    v31 = &unk_24C297970;
    v32 = v23;
    v33 = v6;
    objc_msgSend(v24, "dataTaskWithRequest:completionHandler:", v33, &v28);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = *(_QWORD *)(a1 + 32);
    v27 = *(void **)(v26 + 16);
    *(_QWORD *)(v26 + 16) = v25;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "resume", v28, v29, v30, v31, v32);
    objc_msgSend(*(id *)(a1 + 32), "_startedLoading");

  }
}

void __35__RUIHTTPRequest__loadRequestMain___block_invoke_24(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__RUIHTTPRequest__loadRequestMain___block_invoke_2;
  block[3] = &unk_24C297948;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v16 = v9;
  v17 = v10;
  v18 = v8;
  v19 = v11;
  v20 = v7;
  v12 = v7;
  v13 = v8;
  v14 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __35__RUIHTTPRequest__loadRequestMain___block_invoke_2(uint64_t a1)
{
  int v2;
  NSObject *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
    v2 = 0;
  else
    v2 = objc_msgSend(*(id *)(a1 + 40), "receivedValidResponse:forRequest:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && _isInternalInstall())
  {
    _RUILoggingFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 48), "allHeaderFields");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v4;
      _os_log_impl(&dword_209E87000, v3, OS_LOG_TYPE_DEFAULT, "Response Headers: %@", buf, 0xCu);

    }
  }
  v5 = *(_QWORD **)(a1 + 40);
  if (v5[2])
    objc_msgSend(v5, "_finishedLoading");
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "willParseData");
    v6 = *(void **)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 64);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __35__RUIHTTPRequest__loadRequestMain___block_invoke_25;
    v11[3] = &unk_24C2973F0;
    v11[4] = v6;
    objc_msgSend(v6, "parseData:completion:", v7, v11);
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 40), "failWithError:forRequest:", v8, *(_QWORD *)(a1 + 56));
    }
    else
    {
      +[RUIHTTPRequest invalidResponseErrorWithResponse:](RUIHTTPRequest, "invalidResponseErrorWithResponse:", *(_QWORD *)(a1 + 48));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "failWithError:forRequest:", v10, *(_QWORD *)(a1 + 56));

    }
  }
}

void __35__RUIHTTPRequest__loadRequestMain___block_invoke_25(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__RUIHTTPRequest__loadRequestMain___block_invoke_2_26;
  block[3] = &unk_24C2973F0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __35__RUIHTTPRequest__loadRequestMain___block_invoke_2_26(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didParseData");
}

- (void)loadRequest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __30__RUIHTTPRequest_loadRequest___block_invoke;
  v6[3] = &unk_24C2979C0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __30__RUIHTTPRequest_loadRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadRequestMain:", *(_QWORD *)(a1 + 40));
}

- (void)shouldLoadRequest:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;

  v7 = a4;
  -[RUIHTTPRequest handleWillLoadRequest:](self, "handleWillLoadRequest:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a4 + 2))(v7, v8, 0);

}

- (id)handleWillLoadRequest:(id)a3
{
  return a3;
}

- (id)sessionConfiguration
{
  return 0;
}

- (id)urlSessionDelegate
{
  return 0;
}

- (void)_preLoadCancel
{
  NSURLSessionDataTask *dataTask;
  NSURLRequest *request;

  dataTask = self->_dataTask;
  if (dataTask)
  {
    -[NSURLSessionDataTask cancel](dataTask, "cancel");
    -[RUIHTTPRequest _finishedLoading](self, "_finishedLoading");
  }
  request = self->_request;
  self->_request = 0;

}

- (BOOL)isLoading
{
  return self->_dataTask != 0;
}

- (void)loadStatusChanged
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", RUIHTTPRequestLoadingStatusDidChangeNotification, self);

}

- (id)request
{
  return self->_request;
}

- (void)parseData:(id)a3
{
  id v3;

  NSStringFromSelector(a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@ to be implemented by subclass"), v3);

}

- (void)parseData:(id)a3 completion:(id)a4
{
  void (**v6)(void);

  v6 = (void (**)(void))a4;
  -[RUIHTTPRequest parseData:](self, "parseData:", a3);
  v6[2]();

}

- (void)failWithError:(id)a3 forRequest:(id)a4
{
  id v4;

  NSStringFromSelector(a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@ to be implemented by subclass"), v4);

}

- (BOOL)receivedValidResponse:(id)a3 forRequest:(id)a4
{
  id v4;
  id v5;
  NSObject *v6;
  BOOL v7;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (_isInternalInstall())
    {
      _RUILoggingFacility();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 134217984;
        v10 = objc_msgSend(v5, "statusCode");
        _os_log_impl(&dword_209E87000, v6, OS_LOG_TYPE_DEFAULT, "RUIHTTPRequest Response StatusCode: %ld", (uint8_t *)&v9, 0xCu);
      }

    }
    v7 = (unint64_t)(objc_msgSend(v5, "statusCode") / 100 - 6) < 0xFFFFFFFFFFFFFFFELL;

  }
  else
  {
    v7 = 1;
  }

  return v7;
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
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
