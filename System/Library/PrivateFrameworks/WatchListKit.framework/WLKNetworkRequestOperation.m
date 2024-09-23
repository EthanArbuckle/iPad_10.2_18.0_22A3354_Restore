@implementation WLKNetworkRequestOperation

void __59__WLKNetworkRequestOperation_prepareAndStartNetworkRequest__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setRequest:", v8);
    if (v8)
    {
      objc_msgSend(v7, "_startNetworkRequest");
    }
    else
    {
      if (!v5)
      {
        WLKError(0, 0, CFSTR("WLKNetworkRequestOperation: failed to prepare request. No error was provided."));
        v5 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v7, "setError:", v5);
      objc_msgSend(v7, "finishExecutionIfPossible");
    }
  }

}

void __50__WLKNetworkRequestOperation__startNetworkRequest__block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  os_signpost_id_t v27;
  void *v28;
  __CFString *v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  __CFString *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", v9);
    v11 = v10;

    v12 = objc_msgSend(a1[4], "_statusCodeForAMSResult:error:", v5, v6);
    if (v6)
    {
      objc_msgSend(v6, "description");
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = &stru_1E68AA228;
    }
    objc_msgSend(WeakRetained, "task");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "response");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "valueForHTTPHeaderField:", CFSTR("x-apple-jingle-correlation-key"));
      objc_msgSend(v5, "taskMetrics", objc_claimAutoreleasedReturnValue());
    }
    else
    {
      objc_msgSend(v5, "taskMetrics", 0);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "transactionMetrics");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "setResourceFetchType:", 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(WeakRetained, "setResourceFetchType:", objc_msgSend(v17, "resourceFetchType"));
    WLKNetworkingLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "HTTPMethod");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "URL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "relativePath");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v12;
      v24 = (void *)v22;
      *(_DWORD *)buf = 134219522;
      v31 = v23;
      v32 = 2048;
      v33 = v11;
      v34 = 2112;
      v35 = v19;
      v36 = 2112;
      v37 = v28;
      v38 = 2112;
      v39 = v20;
      v40 = 2112;
      v41 = v22;
      v42 = 2112;
      v43 = v29;
      _os_log_impl(&dword_1B515A000, v18, OS_LOG_TYPE_DEFAULT, "WLKNetworkRequestOperation - Request status: %lu elapsed time: %.5f id: %@ ck:%@ url: %@ %@ %@", buf, 0x48u);

    }
    WLKNetworkSignpostLogObject();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(WeakRetained, "signpostIdentifier");
    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v27 = v26;
      if (os_signpost_enabled(v25))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B515A000, v25, OS_SIGNPOST_INTERVAL_END, v27, "NetworkRequest.URLRequest", ", buf, 2u);
      }
    }

    objc_msgSend(WeakRetained, "setTask:", 0);
    objc_msgSend(WeakRetained, "handleResult:error:", v5, v6);

  }
}

uint64_t __49__WLKNetworkRequestOperation_handleResult_error___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "processResponse");
  return objc_msgSend(*(id *)(a1 + 32), "finishExecutionIfPossible");
}

- (NSURLSessionDataTask)task
{
  return self->_task;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (unint64_t)signpostIdentifier
{
  return self->_signpostIdentifier;
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void)setResponseStatusCode:(int64_t)a3
{
  self->_responseStatusCode = a3;
}

- (void)setResourceFetchType:(int64_t)a3
{
  self->_resourceFetchType = a3;
}

- (void)setRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (void)setHttpResponse:(id)a3
{
  objc_storeStrong((id *)&self->_httpResponse, a3);
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void)setEncoder:(id)a3
{
  objc_storeStrong((id *)&self->_encoder, a3);
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void)setAuthenticationDelegate:(id)a3
{
  objc_storeWeak(&self->_authenticationDelegate, a3);
}

- (int64_t)responseStatusCode
{
  return self->_responseStatusCode;
}

- (void)prepareAndStartNetworkRequest
{
  _QWORD v3[4];
  id v4;
  id location;

  -[WLKNetworkRequestOperation configureSession](self, "configureSession");
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__WLKNetworkRequestOperation_prepareAndStartNetworkRequest__block_invoke;
  v3[3] = &unk_1E68A80D0;
  objc_copyWeak(&v4, &location);
  -[WLKNetworkRequestOperation prepareURLRequest:](self, "prepareURLRequest:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (WLKNetworkRequestOperation)initWithURLRequest:(id)a3 options:(int64_t)a4
{
  id v6;
  WLKNetworkRequestOperation *v7;
  WLKNetworkRequestOperation *v8;
  uint64_t v9;
  NSURLRequest *request;
  void *v11;
  uint64_t v12;
  NSString *identifier;
  NSObject *v14;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WLKNetworkRequestOperation;
  v7 = -[WLKNetworkRequestOperation init](&v16, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_options = a4;
    v9 = objc_msgSend(v6, "copy");
    request = v8->_request;
    v8->_request = (NSURLRequest *)v9;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = objc_claimAutoreleasedReturnValue();
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v12;

    WLKNetworkSignpostLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    v8->_signpostIdentifier = os_signpost_id_make_with_pointer(v14, v8);

  }
  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSHTTPURLResponse)httpResponse
{
  return self->_httpResponse;
}

- (void)handleResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;
  NSObject *v11;
  _QWORD block[5];

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "response");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKNetworkRequestOperation setHttpResponse:](self, "setHttpResponse:", v8);

  objc_msgSend(v7, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKNetworkRequestOperation setData:](self, "setData:", v9);

  -[WLKNetworkRequestOperation setError:](self, "setError:", v6);
  v10 = -[WLKNetworkRequestOperation _statusCodeForAMSResult:error:](self, "_statusCodeForAMSResult:error:", v7, v6);

  -[WLKNetworkRequestOperation setResponseStatusCode:](self, "setResponseStatusCode:", v10);
  dispatch_get_global_queue(21, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__WLKNetworkRequestOperation_handleResult_error___block_invoke;
  block[3] = &unk_1E68A80F8;
  block[4] = self;
  dispatch_async(v11, block);

}

- (void)finishExecutionIfPossible
{
  NSObject *v3;
  unint64_t v4;
  os_signpost_id_t v5;
  objc_super v6;
  uint8_t buf[16];

  WLKNetworkSignpostLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = -[WLKNetworkRequestOperation signpostIdentifier](self, "signpostIdentifier");
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v5 = v4;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B515A000, v3, OS_SIGNPOST_INTERVAL_END, v5, "NetworkRequest.Total", ", buf, 2u);
    }
  }

  v6.receiver = self;
  v6.super_class = (Class)WLKNetworkRequestOperation;
  -[WLKAsyncOperation finishExecutionIfPossible](&v6, sel_finishExecutionIfPossible);
}

- (void)executionDidBegin
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  unint64_t v6;
  os_signpost_id_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WLKNetworkingLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[WLKNetworkRequestOperation identifier](self, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKNetworkRequestOperation - Request start: %@", (uint8_t *)&v8, 0xCu);

  }
  WLKNetworkSignpostLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = -[WLKNetworkRequestOperation signpostIdentifier](self, "signpostIdentifier");
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      LOWORD(v8) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B515A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "NetworkRequest.Total", ", (uint8_t *)&v8, 2u);
    }
  }

  if (self->_request)
  {
    -[WLKNetworkRequestOperation configureSession](self, "configureSession");
    -[WLKNetworkRequestOperation _startNetworkRequest](self, "_startNetworkRequest");
  }
  else
  {
    -[WLKNetworkRequestOperation prepareAndStartNetworkRequest](self, "prepareAndStartNetworkRequest");
  }
}

- (NSError)error
{
  return self->_error;
}

- (NSData)data
{
  return self->_data;
}

- (void)configureSession
{
  id v3;
  void *v4;
  void *v5;
  int64_t options;
  void *v7;
  void *v8;
  NSNumber *DSID;
  void *v10;
  NSNumber *v11;
  NSNumber *v12;
  NSNumber *v13;
  char v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  NSNumber *v19;
  const char *v20;
  NSNumber *v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CFDC80]);
  objc_msgSend(MEMORY[0x1E0CFD9E8], "wlk_defaultBag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithBag:", v4);

  objc_msgSend(v5, "setLogUUID:", self->_identifier);
  if ((self->_options & 1) != 0)
    objc_msgSend(v5, "setDialogOptions:", 1);
  objc_msgSend(v5, "setIncludeClientVersions:", 0);
  options = self->_options;
  if ((options & 0x10) == 0)
  {
    if (+[WLKNetworkRequestUtilities isGDPRAccepted](WLKNetworkRequestUtilities, "isGDPRAccepted"))
      goto LABEL_7;
    options = self->_options;
  }
  if ((options & 0x200000) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ams_activeiTunesAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    DSID = self->_DSID;
    if (DSID)
    {
      objc_msgSend(v8, "ams_DSID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = DSID;
      v12 = v10;
      if (v11 != v12)
      {
        v13 = v12;
        if (v12)
        {
          v14 = -[NSNumber isEqual:](v11, "isEqual:", v12);

          if ((v14 & 1) != 0)
            goto LABEL_21;
        }
        else
        {

        }
        objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "ams_iTunesAccountWithDSID:", self->_DSID);
        v16 = objc_claimAutoreleasedReturnValue();

        WLKNetworkingLogObject();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
        if (v16)
        {
          if (v18)
          {
            v19 = self->_DSID;
            LODWORD(v33) = 138412290;
            *(_QWORD *)((char *)&v33 + 4) = v19;
            v20 = "WLKNetworkRequestOperation - Found account for DSID override: %@";
LABEL_19:
            _os_log_impl(&dword_1B515A000, v17, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v33, 0xCu);
          }
        }
        else if (v18)
        {
          v21 = self->_DSID;
          LODWORD(v33) = 138412290;
          *(_QWORD *)((char *)&v33 + 4) = v21;
          v20 = "WLKNetworkRequestOperation - No account found for DSID override. Proceeding with non-personalized request %@";
          goto LABEL_19;
        }

        v8 = (void *)v16;
        goto LABEL_21;
      }

    }
LABEL_21:
    objc_msgSend(v5, "setAccount:", v8, v33);

  }
  -[WLKNetworkRequestOperation setEncoder:](self, "setEncoder:", v5);
  +[WLKLaunchConfiguration sharedInstance](WLKLaunchConfiguration, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "useSharedURLSession");

  if (!v23)
    goto LABEL_42;
  WLKNetworkingLogObject();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    -[WLKNetworkRequestOperation shortDescription](self, "shortDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v33) = 138412290;
    *(_QWORD *)((char *)&v33 + 4) = v25;
    _os_log_impl(&dword_1B515A000, v24, OS_LOG_TYPE_DEFAULT, "WLKNetworkRequestOperation - Use shared URLSession for request: %@", (uint8_t *)&v33, 0xCu);

  }
  +[WLKURLSessionManager sharedInstance](WLKURLSessionManager, "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "urlSession");
  v27 = (id)objc_claimAutoreleasedReturnValue();

  if (!v27)
  {
LABEL_42:
    if ((self->_options & 0x100000) == 0)
      goto LABEL_32;
    WLKNetworkingLogObject();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      -[WLKNetworkRequestOperation shortDescription](self, "shortDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v33) = 138412290;
      *(_QWORD *)((char *)&v33 + 4) = v29;
      _os_log_impl(&dword_1B515A000, v28, OS_LOG_TYPE_DEFAULT, "WLKNetworkRequestOperation - Use sharedCacheAMSURLSession for request: %@", (uint8_t *)&v33, 0xCu);

    }
    if (configureSession_sharedCacheAMSURLSessionOnceToken != -1)
      dispatch_once(&configureSession_sharedCacheAMSURLSessionOnceToken, &__block_literal_global_10);
    v27 = (id)configureSession_sharedCacheAMSURLSession;
    if (!v27)
    {
LABEL_32:
      WLKNetworkingLogObject();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        -[WLKNetworkRequestOperation shortDescription](self, "shortDescription");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v33) = 138412290;
        *(_QWORD *)((char *)&v33 + 4) = v31;
        _os_log_impl(&dword_1B515A000, v30, OS_LOG_TYPE_DEFAULT, "WLKNetworkRequestOperation - Use default AMSURLSession for request: %@", (uint8_t *)&v33, 0xCu);

      }
      if (configureSession_sharedAMSURLSessionOnceToken != -1)
        dispatch_once(&configureSession_sharedAMSURLSessionOnceToken, &__block_literal_global_19_0);
      v27 = (id)configureSession_sharedAMSURLSession;
    }
  }
  if ((self->_options & 1) == 0)
  {
    -[WLKNetworkRequestOperation authenticationDelegate](self, "authenticationDelegate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setDelegate:", v32);

  }
  -[WLKNetworkRequestOperation setSession:](self, "setSession:", v27);

}

- (int64_t)_statusCodeForAMSResult:(id)a3 error:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;

  v5 = a4;
  objc_msgSend(a3, "response");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "statusCode");
  else
    v8 = WLKHTTPStatusCodeForAMSError(v5);
  v9 = v8;

  return v9;
}

- (void)_startNetworkRequest
{
  void *v3;
  char v4;
  int64_t options;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  AMSURLSession *session;
  void *v21;
  void *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(id *, void *, void *);
  void *v29;
  WLKNetworkRequestOperation *v30;
  id v31;
  id v32;
  id location;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  WLKIgnoreHTTPCacheOverride();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if ((v4 & 1) != 0 || (options = self->_options, (options & 8) != 0))
  {
    WLKNetworkingLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B515A000, v6, OS_LOG_TYPE_DEFAULT, "WLKNetworkRequestOperation - Request will ignore HTTP cache", buf, 2u);
    }

    v7 = (void *)-[NSURLRequest mutableCopy](self->_request, "mutableCopy");
    objc_msgSend(v7, "setCachePolicy:", 1);
    v8 = (void *)objc_msgSend(v7, "copy");
    -[WLKNetworkRequestOperation setRequest:](self, "setRequest:", v8);

    -[WLKNetworkRequestOperation session](self, "session");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeCachedResponseForRequest:", self->_request);

    options = self->_options;
  }
  if ((options & 4) != 0)
  {
    v12 = (void *)-[NSURLRequest mutableCopy](self->_request, "mutableCopy");
    v35 = 0;
    v13 = +[WLKMescal signNetworkRequest:error:](WLKMescal, "signNetworkRequest:error:", v12, &v35);
    v14 = v35;
    if (v13)
    {
      v15 = (void *)objc_msgSend(v12, "copy");
      -[WLKNetworkRequestOperation setRequest:](self, "setRequest:", v15);

    }
    else
    {
      -[WLKNetworkRequestOperation _finishExecutionIfPossibleWithError:](self, "_finishExecutionIfPossibleWithError:", v14);
    }

  }
  -[AMSURLRequestEncoder requestByEncodingRequest:parameters:](self->_encoder, "requestByEncodingRequest:parameters:", self->_request, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  objc_msgSend(v16, "resultWithError:", &v34);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v34;
  if (v17)
  {
    if (-[WLKNetworkRequestOperation isCancelled](self, "isCancelled"))
    {
      WLKCancelledError();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[WLKNetworkRequestOperation _finishExecutionIfPossibleWithError:](self, "_finishExecutionIfPossibleWithError:", v19);

    }
    else
    {
      objc_initWeak(&location, self);
      session = self->_session;
      v26 = MEMORY[0x1E0C809B0];
      v27 = 3221225472;
      v28 = __50__WLKNetworkRequestOperation__startNetworkRequest__block_invoke;
      v29 = &unk_1E68A8120;
      objc_copyWeak(&v32, &location);
      v30 = self;
      v31 = v17;
      -[AMSURLSession dataTaskWithRequest:completionHandler:](session, "dataTaskWithRequest:completionHandler:", v31, &v26);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[WLKNetworkRequestOperation setTask:](self, "setTask:", v21, v26, v27, v28, v29, v30);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[WLKNetworkRequestOperation setStartDate:](self, "setStartDate:", v22);

      WLKNetworkSignpostLogObject();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = -[WLKNetworkRequestOperation signpostIdentifier](self, "signpostIdentifier");
      if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        -[NSURLRequest URL](self->_request, "URL");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v37 = v25;
        _os_signpost_emit_with_name_impl(&dword_1B515A000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v24, "NetworkRequest.URLRequest", "%@", buf, 0xCu);

      }
      objc_msgSend(v21, "resume");

      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    -[WLKNetworkRequestOperation _finishExecutionIfPossibleWithError:](self, "_finishExecutionIfPossibleWithError:", v18);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_encoder, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_httpResponse, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_destroyWeak(&self->_authenticationDelegate);
  objc_storeStrong((id *)&self->_DSID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)httpHeaderMaxAge
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[WLKNetworkRequestOperation httpResponse](self, "httpResponse");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForHTTPHeaderField:", CFSTR("Cache-Control"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(","));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v9, "containsString:", CFSTR("max-age"), (_QWORD)v17))
          {
            objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("="));
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v10, "count") == 2)
            {
              objc_msgSend(v10, "objectAtIndex:", 1);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              v15 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v14, "doubleValue");
              objc_msgSend(v15, "numberWithDouble:");
              v11 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_15;
            }

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v6)
          continue;
        break;
      }
    }
    v11 = 0;
LABEL_15:

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)httpHeaderResponseDate
{
  void *v3;
  void *v4;
  void *v5;

  if (httpHeaderResponseDate_onceToken != -1)
    dispatch_once(&httpHeaderResponseDate_onceToken, &__block_literal_global_7);
  -[WLKNetworkRequestOperation httpResponse](self, "httpResponse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForHTTPHeaderField:", CFSTR("Date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)httpHeaderResponseDate_httpDateFormatter, "dateFromString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __69__WLKNetworkRequestOperation_ResponseHeaders__httpHeaderResponseDate__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)httpHeaderResponseDate_httpDateFormatter;
  httpHeaderResponseDate_httpDateFormatter = (uint64_t)v0;

  v2 = (void *)httpHeaderResponseDate_httpDateFormatter;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  return objc_msgSend((id)httpHeaderResponseDate_httpDateFormatter, "setDateFormat:", CFSTR("EEE',' dd' 'MMM' 'yyyy HH':'mm':'ss zzz"));
}

- (id)originalExpirationDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[WLKNetworkRequestOperation httpHeaderMaxAge](self, "httpHeaderMaxAge");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKNetworkRequestOperation httpHeaderResponseDate](self, "httpHeaderResponseDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = 0;
  if (v3 && v4)
  {
    objc_msgSend(v4, "dateByAddingTimeInterval:", (double)objc_msgSend(v3, "integerValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  WLKNetworkingLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412802;
    v10 = v3;
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1B515A000, v7, OS_LOG_TYPE_DEFAULT, "MaxAge: %@, Response Date: %@, Expiration:%@", (uint8_t *)&v9, 0x20u);
  }

  return v6;
}

- (WLKNetworkRequestOperation)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("WLKUTSNetworkRequestOperation"), CFSTR("-init is not supported"));

  return 0;
}

- (id)shortDescription
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[WLKNetworkRequestOperation identifier](self, "identifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &stru_1E68AA228;
  if (v3)
    v5 = (__CFString *)v3;
  v6 = v5;

  if ((unint64_t)-[__CFString length](v6, "length") >= 7)
  {
    -[WLKNetworkRequestOperation identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "substringToIndex:", 7);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (__CFString *)v8;
  }
  v9 = (void *)MEMORY[0x1E0CB3940];
  -[NSURLRequest URL](self->_request, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ %@"), v6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __46__WLKNetworkRequestOperation_configureSession__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  WLKURLResponseDecoder *v4;
  void *v5;

  +[WLKNetworkRequestUtilities _sharedCacheSessionConfiguration](WLKNetworkRequestUtilities, "_sharedCacheSessionConfiguration");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    v5 = v0;
    objc_msgSend(MEMORY[0x1E0CFDCA0], "minimalSessionUsing:", v0);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)configureSession_sharedCacheAMSURLSession;
    configureSession_sharedCacheAMSURLSession = v1;

    v3 = (void *)configureSession_sharedCacheAMSURLSession;
    v4 = objc_alloc_init(WLKURLResponseDecoder);
    objc_msgSend(v3, "setResponseDecoder:", v4);

    v0 = v5;
  }

}

void __46__WLKNetworkRequestOperation_configureSession__block_invoke_18()
{
  uint64_t v0;
  void *v1;
  void *v2;
  WLKURLResponseDecoder *v3;
  id v4;

  +[WLKNetworkRequestUtilities defaultSessionConfiguration](WLKNetworkRequestUtilities, "defaultSessionConfiguration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CFDCA0], "minimalSessionUsing:", v4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)configureSession_sharedAMSURLSession;
  configureSession_sharedAMSURLSession = v0;

  v2 = (void *)configureSession_sharedAMSURLSession;
  v3 = objc_alloc_init(WLKURLResponseDecoder);
  objc_msgSend(v2, "setResponseDecoder:", v3);

}

- (void)_finishExecutionIfPossibleWithError:(id)a3
{
  -[WLKNetworkRequestOperation setError:](self, "setError:", a3);
  -[WLKNetworkRequestOperation finishExecutionIfPossible](self, "finishExecutionIfPossible");
}

- (void)cancel
{
  NSObject *v3;
  void *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WLKNetworkingLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[WLKNetworkRequestOperation identifier](self, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKNetworkRequestOperation - Request cancelled: %@", buf, 0xCu);

  }
  v6.receiver = self;
  v6.super_class = (Class)WLKNetworkRequestOperation;
  -[WLKNetworkRequestOperation cancel](&v6, sel_cancel);
  -[WLKNetworkRequestOperation task](self, "task");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSNumber)DSID
{
  return self->_DSID;
}

- (void)setDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (id)authenticationDelegate
{
  return objc_loadWeakRetained(&self->_authenticationDelegate);
}

- (NSURLRequest)request
{
  return self->_request;
}

- (int64_t)options
{
  return self->_options;
}

- (int64_t)resourceFetchType
{
  return self->_resourceFetchType;
}

- (AMSURLRequestEncoder)encoder
{
  return self->_encoder;
}

- (AMSURLSession)session
{
  return self->_session;
}

- (void)setSignpostIdentifier:(unint64_t)a3
{
  self->_signpostIdentifier = a3;
}

@end
