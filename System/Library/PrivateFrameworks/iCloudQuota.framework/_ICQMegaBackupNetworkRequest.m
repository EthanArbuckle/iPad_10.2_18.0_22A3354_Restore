@implementation _ICQMegaBackupNetworkRequest

- (_ICQMegaBackupNetworkRequest)initWithRequestURL:(id)a3 URLSession:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  id v10;
  _ICQMegaBackupNetworkRequest *v11;
  uint64_t v12;
  NSURL *requestURL;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_ICQMegaBackupNetworkRequest;
  v11 = -[_ICQMegaBackupNetworkRequest init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    requestURL = v11->_requestURL;
    v11->_requestURL = (NSURL *)v12;

    objc_storeStrong((id *)&v11->_queue, a5);
    objc_storeStrong((id *)&v11->_URLSession, a4);
  }

  return v11;
}

- (void)invalidate
{
  NSURLSessionTask *URLSessionTask;
  id completionHandler;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSURLSessionTask cancel](self->_URLSessionTask, "cancel");
  URLSessionTask = self->_URLSessionTask;
  self->_URLSessionTask = 0;

  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

}

- (void)resumeWithCompletionHandler:(id)a3
{
  NSObject *queue;
  id v5;
  void *v6;
  id completionHandler;
  void *v8;
  id v9;
  id v10;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  v6 = (void *)objc_msgSend(v5, "copy");

  completionHandler = self->_completionHandler;
  self->_completionHandler = v6;

  v10 = 0;
  -[_ICQMegaBackupNetworkRequest _createURLRequestWithError:](self, "_createURLRequestWithError:", &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v10;
  if (v8)
    -[_ICQMegaBackupNetworkRequest _performURLRequest:](self, "_performURLRequest:", v8);
  else
    -[_ICQMegaBackupNetworkRequest _completeWithError:](self, "_completeWithError:", v9);

}

- (void)handleURLResponse:(id)a3 data:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSURLSessionTask *URLSessionTask;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSURLSessionTask cancel](self->_URLSessionTask, "cancel");
  URLSessionTask = self->_URLSessionTask;
  self->_URLSessionTask = 0;

  v12 = v8;
  objc_msgSend(v12, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "absoluteString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v12, "statusCode");
  if (v12)
  {
    v16 = v15;
    if (v9)
    {
      v26 = 0;
      -[_ICQMegaBackupNetworkRequest _dictionaryFromData:response:error:](self, "_dictionaryFromData:response:error:", v9, v12, &v26);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v26;
    }
    else
    {
      v17 = 0;
      v18 = 0;
    }
    _ICQGetLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend(v9, "length");
      *(_DWORD *)buf = 138413058;
      v28 = v14;
      v29 = 2050;
      v30 = v16;
      v31 = 2050;
      v32 = v21;
      v33 = 2112;
      v34 = v17;
      _os_log_impl(&dword_1CDEBD000, v20, OS_LOG_TYPE_DEFAULT, "Received response %@ Status Code: %{public}lu (%{public}lu bytes): %@", buf, 0x2Au);
    }

    _ICQGetLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v12, "allHeaderFields");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v28 = v14;
      v29 = 2114;
      v30 = (uint64_t)v23;
      _os_log_impl(&dword_1CDEBD000, v22, OS_LOG_TYPE_DEFAULT, "Response %@ headers: %{public}@", buf, 0x16u);

    }
    if (v16 != 200 && !v18)
    {
      if (v17)
        v24 = v17;
      else
        v24 = (void *)MEMORY[0x1E0C9AA70];
      -[_ICQMegaBackupNetworkRequest errorForUnsuccessfulResponse:body:](self, "errorForUnsuccessfulResponse:body:", v12, v24);
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (v17 && !v18)
    {
      -[_ICQMegaBackupNetworkRequest handleResponse:body:](self, "handleResponse:body:", v12, v17);
      v25 = objc_claimAutoreleasedReturnValue();
LABEL_24:
      v18 = (id)v25;
      goto LABEL_25;
    }
    if (!v18)
    {
LABEL_23:
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_ICQMegaBackupErrorDomain"), 0, 0);
      v25 = objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
  }
  else
  {
    _ICQGetLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v28 = v10;
      _os_log_impl(&dword_1CDEBD000, v19, OS_LOG_TYPE_DEFAULT, "Received error for request: %{public}@", buf, 0xCu);
    }

    -[_ICQMegaBackupNetworkRequest _errorForURLRequestError:](self, "_errorForURLRequestError:", v10);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    if (!v18)
      goto LABEL_23;
  }
LABEL_25:
  -[_ICQMegaBackupNetworkRequest _completeWithError:](self, "_completeWithError:", v18);

}

- (id)_dictionaryFromData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  id v25;
  uint8_t buf[4];
  NSObject *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v8, "MIMEType");
    v9 = objc_claimAutoreleasedReturnValue();
    v25 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, &v25);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v25;
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = v10;
LABEL_29:

        goto LABEL_30;
      }
      _ICQGetLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        goto LABEL_25;
      *(_WORD *)buf = 0;
      v17 = "Non-dict JSON";
      v18 = v16;
      v19 = 2;
      goto LABEL_24;
    }
    if (-[NSObject isEqualToString:](v9, "isEqualToString:", CFSTR("application/json")))
    {
      _ICQGetLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CDEBD000, v13, OS_LOG_TYPE_DEFAULT, "Malormed JSON", buf, 2u);
      }

      if (a5)
      {
        v14 = (void *)MEMORY[0x1E0CB35C8];
        v30 = *MEMORY[0x1E0CB3388];
        v31[0] = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("_ICQMegaBackupErrorDomain"), 2, v15);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_27;
    }
    if (!-[NSObject isEqualToString:](v9, "isEqualToString:", CFSTR("text/plain")))
    {
LABEL_21:
      if (objc_msgSend(v8, "statusCode") != 200)
      {
        v12 = (id)MEMORY[0x1E0C9AA70];
        goto LABEL_29;
      }
      _ICQGetLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
LABEL_25:

        if (a5)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_ICQMegaBackupErrorDomain"), 2, 0);
          v12 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_29;
        }
LABEL_27:
        v12 = 0;
        goto LABEL_29;
      }
      *(_DWORD *)buf = 138543362;
      v27 = v9;
      v17 = "Unexpected response format with Content-Type \"%{public}@\";
      v18 = v16;
      v19 = 12;
LABEL_24:
      _os_log_impl(&dword_1CDEBD000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
      goto LABEL_25;
    }
    if ((unint64_t)objc_msgSend(v7, "length") > 0x3FF)
    {
      _ICQGetLogSystem();
      v20 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
LABEL_20:

        goto LABEL_21;
      }
      objc_msgSend(v8, "URL");
      v21 = objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v7, "length");
      *(_DWORD *)buf = 138412546;
      v27 = v21;
      v28 = 2050;
      v29 = v23;
      _os_log_impl(&dword_1CDEBD000, v20, OS_LOG_TYPE_DEFAULT, "Received large text response from %@ (%{public}lu bytes)", buf, 0x16u);
    }
    else
    {
      v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v7, 4);
      _ICQGetLogSystem();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "URL");
        v22 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v27 = v22;
        v28 = 2114;
        v29 = (uint64_t)v20;
        _os_log_impl(&dword_1CDEBD000, v21, OS_LOG_TYPE_DEFAULT, "Received text response from %@: \"%{public}@\", buf, 0x16u);

      }
    }

    goto LABEL_20;
  }
  v12 = (id)MEMORY[0x1E0C9AA70];
LABEL_30:

  return v12;
}

- (NSDictionary)additionalRequestHeaders
{
  return (NSDictionary *)MEMORY[0x1E0C9AA70];
}

- (NSDictionary)bodyJSON
{
  return (NSDictionary *)MEMORY[0x1E0C9AA70];
}

- (id)handleResponse:(id)a3 body:(id)a4
{
  return 0;
}

- (id)errorForUnsuccessfulResponse:(id)a3 body:(id)a4
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "statusCode");
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134349056;
    v9 = v4;
    _os_log_impl(&dword_1CDEBD000, v5, OS_LOG_TYPE_DEFAULT, "Received status code response: %{public}ld", (uint8_t *)&v8, 0xCu);
  }

  if (v4 == 429)
    v6 = 6;
  else
    v6 = 3;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_ICQMegaBackupErrorDomain"), v6, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_createURLRequestWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint8_t v15[16];
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1D17BB6D8](self, a2);
  -[_ICQMegaBackupNetworkRequest bodyJSON](self, "bodyJSON");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v6) & 1) != 0)
  {
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v6, 0, &v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v16;

    objc_autoreleasePoolPop(v5);
    if (v7)
    {
      v9 = objc_alloc(MEMORY[0x1E0CB37A8]);
      -[_ICQMegaBackupNetworkRequest requestURL](self, "requestURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithURL:", v10);

      -[_ICQMegaBackupNetworkRequest requestHeaders](self, "requestHeaders");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAllHTTPHeaderFields:", v12);

      -[_ICQMegaBackupNetworkRequest addAdditionalRequestHeaders:](self, "addAdditionalRequestHeaders:", v11);
      objc_msgSend(v11, "setHTTPBody:", v7);
      objc_msgSend(v11, "setHTTPMethod:", CFSTR("POST"));
LABEL_13:

      goto LABEL_14;
    }
  }
  else
  {

    objc_autoreleasePoolPop(v5);
    v8 = 0;
  }
  _ICQGetLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_1CDEBD000, v13, OS_LOG_TYPE_DEFAULT, "Invalid request body", v15, 2u);
  }

  if (a3)
  {
    if (v8)
    {
      v17 = *MEMORY[0x1E0CB3388];
      v18[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_ICQMegaBackupErrorDomain"), 0, v7);
    v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v11 = 0;
LABEL_14:

  return v11;
}

- (NSDictionary)requestHeaders
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("application/json"), CFSTR("Content-Type"));
  -[_ICQMegaBackupNetworkRequest additionalRequestHeaders](self, "additionalRequestHeaders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  v5 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v5;
}

- (id)_errorForURLRequestError:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;
  id v20;
  uint64_t v21;
  const __CFString *v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB32E8]);

  if (v5)
  {
    v6 = objc_msgSend(v3, "code");
    if (v6 == -1002)
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB2938];
      v25[0] = *MEMORY[0x1E0CB3388];
      v25[1] = v16;
      v26[0] = v3;
      v26[1] = CFSTR("Bad URL");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v15;
      v11 = 1;
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = *MEMORY[0x1E0CB2938];
      if (v6 == -1001)
      {
        v27[0] = *MEMORY[0x1E0CB3388];
        v27[1] = v8;
        v28[0] = v3;
        v28[1] = CFSTR("Timed out");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v7;
        v11 = 4;
      }
      else
      {
        v23[0] = *MEMORY[0x1E0CB3388];
        v23[1] = v8;
        v24[0] = v3;
        v24[1] = CFSTR("Network failure");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v7;
        v11 = 5;
      }
    }
  }
  else
  {
    v12 = objc_alloc(MEMORY[0x1E0C99E08]);
    v21 = *MEMORY[0x1E0CB2938];
    v22 = CFSTR("Unknown URL request errro");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v12, "initWithDictionary:", v13);

    if (v3)
    {
      v19 = *MEMORY[0x1E0CB3388];
      v20 = v3;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addEntriesFromDictionary:", v14);

    }
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = 0;
  }
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("_ICQMegaBackupErrorDomain"), v11, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)_performURLRequest:(id)a3
{
  id v4;
  NSURLSession *URLSession;
  NSURLSessionTask *v6;
  NSURLSessionTask *URLSessionTask;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[5];
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  URLSession = self->_URLSession;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51___ICQMegaBackupNetworkRequest__performURLRequest___block_invoke;
  v12[3] = &unk_1E8B38578;
  v12[4] = self;
  -[NSURLSession dataTaskWithRequest:completionHandler:](URLSession, "dataTaskWithRequest:completionHandler:", v4, v12);
  v6 = (NSURLSessionTask *)objc_claimAutoreleasedReturnValue();
  URLSessionTask = self->_URLSessionTask;
  self->_URLSessionTask = v6;

  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "allHTTPHeaderFields");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "HTTPBody");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");
    *(_DWORD *)buf = 138412802;
    v14 = v4;
    v15 = 2112;
    v16 = v9;
    v17 = 2050;
    v18 = v11;
    _os_log_impl(&dword_1CDEBD000, v8, OS_LOG_TYPE_DEFAULT, "Sending request %@ %@ (%{public}lu body bytes)", buf, 0x20u);

  }
  -[NSURLSessionTask resume](self->_URLSessionTask, "resume");

}

- (void)_completeWithError:(id)a3
{
  NSError *v4;
  NSError *error;
  void *v6;
  void *v7;
  id completionHandler;
  id v9;

  v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v4 = (NSError *)objc_msgSend(v9, "copy");
  error = self->_error;
  self->_error = v4;

  v6 = _Block_copy(self->_completionHandler);
  v7 = v6;
  if (v6)
  {
    (*((void (**)(void *, _ICQMegaBackupNetworkRequest *, id))v6 + 2))(v6, self, v9);
    completionHandler = self->_completionHandler;
    self->_completionHandler = 0;

  }
}

- (NSURL)requestURL
{
  return self->_requestURL;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_requestURL, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_URLSessionTask, 0);
  objc_storeStrong((id *)&self->_URLSession, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
