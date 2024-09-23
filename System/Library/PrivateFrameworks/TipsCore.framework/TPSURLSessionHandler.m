@implementation TPSURLSessionHandler

- (BOOL)shouldIgnoreInMemoryCaching
{
  return self->_shouldIgnoreInMemoryCaching;
}

+ (id)sharedInstance
{
  if (sharedInstance_predicate_1 != -1)
    dispatch_once(&sharedInstance_predicate_1, &__block_literal_global_7);
  return (id)sharedInstance_gTPSURLSessionHandler;
}

void __38__TPSURLSessionHandler_sharedInstance__block_invoke()
{
  TPSURLSessionHandler *v0;
  void *v1;

  v0 = objc_alloc_init(TPSURLSessionHandler);
  v1 = (void *)sharedInstance_gTPSURLSessionHandler;
  sharedInstance_gTPSURLSessionHandler = (uint64_t)v0;

}

- (TPSURLSessionHandler)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TPSURLSessionHandler;
  return -[TPSURLSessionHandler init](&v3, sel_init);
}

- (void)setPassphrase:(id)a3
{
  NSString **p_passphrase;
  NSString *passphrase;
  id v7;

  v7 = a3;
  if (+[TPSCommonDefines isInternalDevice](TPSCommonDefines, "isInternalDevice"))
  {
    passphrase = self->_passphrase;
    p_passphrase = &self->_passphrase;
    if (!-[NSString isEqualToString:](passphrase, "isEqualToString:", v7))
      objc_storeStrong((id *)p_passphrase, a3);
  }

}

- (void)setCertificateFilePath:(id)a3
{
  NSString **p_certificateFilePath;
  NSString *certificateFilePath;
  id v7;

  v7 = a3;
  if (+[TPSCommonDefines isInternalDevice](TPSCommonDefines, "isInternalDevice"))
  {
    certificateFilePath = self->_certificateFilePath;
    p_certificateFilePath = &self->_certificateFilePath;
    if (!-[NSString isEqualToString:](certificateFilePath, "isEqualToString:", v7))
      objc_storeStrong((id *)p_certificateFilePath, a3);
  }

}

- (id)cacheControllerForDataType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)(a3 - 1) > 2)
    return 0;
  -[__objc2_class sharedInstance](*off_1E395B998[a3 - 1], "sharedInstance", v3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)URLSessionManagerSessionOperationQueue:(id)a3
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  objc_msgSend(v3, "setMaxConcurrentOperationCount:", 4);
  return v3;
}

- (id)URLSessionManagerSessionConfiguration:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3990], "tps_urlCacheWithIdentifier:memoryCapacity:diskCapacity:", 0, +[TPSURLSessionManager defaultURLCacheMemoryCapcity](TPSURLSessionManager, "defaultURLCacheMemoryCapcity", a3), +[TPSURLSessionManager defaultURLCacheDiskCapcity](TPSURLSessionManager, "defaultURLCacheDiskCapcity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3990], "setSharedURLCache:", v3);
  objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setURLCache:", v3);

  return v4;
}

- (BOOL)URLSessionManagerShouldCoalesceRequest:(id)a3
{
  return 0;
}

- (void)sessionTask:(id)a3 willCacheResponse:(id)a4 completionHandler:(id)a5
{
  void (**v8)(id, _QWORD);
  id v9;
  id v10;

  v10 = a4;
  v8 = (void (**)(id, _QWORD))a5;
  if (-[NSIndexSet containsIndex:](self->_excludeCachingDataTypes, "containsIndex:", objc_msgSend(a3, "dataType")))
    v9 = v10;
  else
    v9 = 0;
  ((void (**)(id, id))v8)[2](v8, v9);

}

- (BOOL)shouldCacheToDiskForSessionTask:(id)a3
{
  return !-[NSIndexSet containsIndex:](self->_excludeCachingDataTypes, "containsIndex:", objc_msgSend(a3, "dataType"));
}

- (id)processJSONFormattedDataForCDSError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("errorDetail"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("errorCode"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "integerValue");

      objc_msgSend(v4, "objectForKey:", CFSTR("errorMessage"));
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      v9 = 0;
      if (v6 >= 1 && v7)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v7, v6, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)storeCachedResponseData:(id)a3 forSessionTask:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v5 = a4;
  objc_msgSend(v5, "response");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "underlyingSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_alloc(MEMORY[0x1E0CB34F0]);
    v11 = v10;
    if (v16)
    {
      v12 = (void *)objc_msgSend(v10, "initWithResponse:data:userInfo:storagePolicy:", v6, v16, 0, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "data");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v11, "initWithResponse:data:userInfo:storagePolicy:", v6, v13, 0, 0);

    }
    objc_msgSend(v5, "task");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "currentRequest");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "storeCachedResponse:forRequest:", v12, v15);

  }
}

- (void)sessionTask:(id)a3 didFinishDownloadingToURL:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  BOOL v21;
  int v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_class *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;

  v38 = a3;
  v6 = a4;
  v7 = objc_msgSend(v38, "dataType");
  -[TPSURLSessionHandler cacheControllerForDataType:](self, "cacheControllerForDataType:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataCacheForIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v38, "downloadTaskTotalBytes");
  if (v8)
  {
    objc_msgSend(v38, "response");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "statusCode");

    v14 = v6;
    if (v13 == 200)
    {
      v15 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TPSURLSessionError"), v13, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v21 = v7 == 1 && v15 == 0;
    v22 = !v21;
    if (v21)
    {
      objc_msgSend(v8, "formattedDataWithFileURL:", v14);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      -[TPSURLSessionHandler processJSONFormattedDataForCDSError:](self, "processJSONFormattedDataForCDSError:", v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }
    if (v15)
    {
      objc_msgSend(v38, "setDataError:", v15);
    }
    else
    {
      if (-[TPSURLSessionHandler shouldCacheToDiskForSessionTask:](self, "shouldCacheToDiskForSessionTask:", v38))
      {
        objc_msgSend(v38, "lastModified");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "saveFileURL:identifier:fileSize:lastModified:dataCache:", v14, v9, v11, v23, v10);
        v24 = objc_claimAutoreleasedReturnValue();

        v14 = (id)v24;
      }
      if (v22)
      {
        objc_msgSend(v8, "formattedDataWithFileURL:", v14);
        v25 = objc_claimAutoreleasedReturnValue();

        v19 = (id)v25;
      }
    }

    v20 = 0;
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend(v6, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dataWithContentsOfFile:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v18;
    v20 = v19;
  }
  objc_msgSend(v38, "response");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v37 = v10;
    objc_msgSend(v38, "underlyingSession");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "configuration");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "URLCache");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v30 = (objc_class *)MEMORY[0x1E0CB34F0];
      v31 = v20;
      v32 = [v30 alloc];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v6, 1, 0);
      v31 = (id)objc_claimAutoreleasedReturnValue();
      v33 = objc_alloc(MEMORY[0x1E0CB34F0]);
      if (!v31)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "data");
        v31 = (id)objc_claimAutoreleasedReturnValue();
      }
      v32 = v33;
    }
    v34 = (void *)objc_msgSend(v32, "initWithResponse:data:userInfo:storagePolicy:", v26, v31, 0, 0);

    objc_msgSend(v38, "task");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "currentRequest");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "storeCachedResponse:forRequest:", v34, v36);

    v10 = v37;
  }
  objc_msgSend(v38, "setFormattedData:", v19);

}

- (void)sessionTask:(id)a3 didReceiveResponse:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, uint64_t);
  uint64_t v11;
  _BOOL4 v12;
  id v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, uint64_t))a5;
  v11 = objc_msgSend(v8, "dataType");
  v12 = -[TPSURLSessionHandler shouldCacheToDiskForSessionTask:](self, "shouldCacheToDiskForSessionTask:", v8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v9;
    objc_msgSend(v8, "setResponse:", v13);
    objc_msgSend(v8, "task");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "currentRequest");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[TPSURLSessionHandler respectCachingForRequest:](self, "respectCachingForRequest:", v15);

    if (v12 && v16)
    {
      objc_msgSend(v13, "allHeaderFields");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Last-Modified"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "setLastModified:", v18);
      if (v18 && !-[NSIndexSet containsIndex:](self->_excludeCachingDataTypes, "containsIndex:", v11))
      {
        -[TPSURLSessionHandler cacheControllerForDataType:](self, "cacheControllerForDataType:", v11);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "dataCacheForIdentifier:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(v21, "lastModified");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v22, "isEqualToString:", v18) & 1) != 0)
          {
            v23 = objc_msgSend(v19, "isDataCacheValid:", v21);

            if (v23)
            {
              +[TPSLogger default](TPSLogger, "default");
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
                -[TPSURLSessionHandler sessionTask:didReceiveResponse:completionHandler:].cold.1(v21, v24);

              objc_msgSend(v19, "cacheFileURLForDataCache:", v21);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "formattedDataWithFileURL:", v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setFormattedData:", v26);

              v27 = 1;
              objc_msgSend(v8, "setIsCacheData:", 1);
              v33[0] = MEMORY[0x1E0C809B0];
              v33[1] = 3221225472;
              v33[2] = __73__TPSURLSessionHandler_sessionTask_didReceiveResponse_completionHandler___block_invoke;
              v33[3] = &unk_1E395B150;
              v34 = v21;
              v35 = v19;
              v28 = v19;
              v29 = v21;
              dispatch_async(MEMORY[0x1E0C80D38], v33);

LABEL_21:
              v30 = 0;
              goto LABEL_15;
            }
          }
          else
          {

          }
        }

      }
      if (v11 != 2
        || (objc_msgSend(v13, "allHeaderFields"),
            v31 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend((id)v31, "objectForKeyedSubscript:", CFSTR("Content-Type")),
            v32 = (void *)objc_claimAutoreleasedReturnValue(),
            (id)v31,
            LOBYTE(v31) = objc_msgSend(v32, "containsString:", CFSTR("text/html")),
            v32,
            (v31 & 1) == 0))
      {

        v27 = 0;
        v30 = 2;
        goto LABEL_15;
      }
      v27 = 0;
      goto LABEL_21;
    }

  }
  v27 = 0;
  if (v12)
    v30 = 2;
  else
    v30 = 1;
LABEL_15:
  v10[2](v10, v30, v27);

}

uint64_t __73__TPSURLSessionHandler_sessionTask_didReceiveResponse_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setUpdatedDate:", v2);

  return objc_msgSend(*(id *)(a1 + 40), "updateCache");
}

- (BOOL)respectCachingForRequest:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "cachePolicy");
  return v3 != 1 && v3 != 4;
}

- (void)sessionTask:(id)a3 didCompleteWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  _QWORD block[4];
  id v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "task");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "response");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "statusCode");

      objc_msgSend(v8, "response");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v8, "response");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "allHeaderFields");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Last-Modified"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setLastModified:", v15);

      }
      else
      {
        v13 = 0;
      }
      objc_msgSend(v6, "dataTaskData");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "task");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "originalRequest");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = -[TPSURLSessionHandler respectCachingForRequest:](self, "respectCachingForRequest:", v18);
      if (v6 && v19 && objc_msgSend(v13, "statusCode") != 404 && objc_msgSend(v13, "statusCode") != 200 && v18)
      {
        v39 = v16;
        objc_msgSend(MEMORY[0x1E0CB3990], "sharedURLCache");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "cachedResponseForRequest:", v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "response");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v23 = objc_opt_isKindOfClass();

        if ((v23 & 1) != 0)
        {
          objc_msgSend(v21, "response");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v24, "statusCode") == 200)
          {
            objc_msgSend(v21, "data");
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (v25)
            {
              v10 = objc_msgSend(v24, "statusCode");
              +[TPSLogger data](TPSLogger, "data");
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v18, "URL");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v45 = v27;
                _os_log_impl(&dword_19A906000, v26, OS_LOG_TYPE_DEFAULT, "Using cache data for request: %@", buf, 0xCu);

              }
              v28 = (void *)MEMORY[0x1E0C99DF0];
              objc_msgSend(v21, "data");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "dataWithData:", v29);
              v30 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v6, "setDataTaskData:", v30);
              objc_msgSend(v6, "setIsCacheData:", v30 != 0);
              v39 = (void *)v30;
            }
          }
        }
        else
        {
          v24 = v13;
        }

        v13 = v24;
        v16 = v39;
      }
      if (v10 == 200)
      {
        v31 = 0;
        if (!v6)
          goto LABEL_31;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TPSURLSessionError"), v10, 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v6)
        {
LABEL_31:
          objc_msgSend(v6, "setDataError:", v31);

          goto LABEL_32;
        }
      }
      if (objc_msgSend(v16, "length"))
      {
        v32 = objc_msgSend(v6, "dataType");
        objc_msgSend(v6, "dataError");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v33 || v32 == 1)
        {
          -[TPSURLSessionHandler cacheControllerForDataType:](self, "cacheControllerForDataType:", objc_msgSend(v6, "dataType"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v16;
          objc_msgSend(v34, "formattedDataWithData:", v16);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (v32 == 1)
          {
            -[TPSURLSessionHandler processJSONFormattedDataForCDSError:](self, "processJSONFormattedDataForCDSError:", v35);
            v36 = objc_claimAutoreleasedReturnValue();

            v31 = (void *)v36;
          }

          if (v35)
          {
            objc_msgSend(v6, "setFormattedData:", v35);

          }
          v16 = v40;
        }
      }
      goto LABEL_31;
    }
  }
LABEL_32:
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__TPSURLSessionHandler_sessionTask_didCompleteWithError___block_invoke;
  block[3] = &unk_1E395B150;
  v42 = v7;
  v43 = v8;
  v37 = v8;
  v38 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __57__TPSURLSessionHandler_sessionTask_didCompleteWithError___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    if (objc_msgSend(v2, "code") != -999)
    {
      +[TPSLogger data](TPSLogger, "data");
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "currentRequest");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "URL");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v10 = v5;
        v11 = 2112;
        v12 = v6;
        _os_log_impl(&dword_19A906000, v3, OS_LOG_TYPE_DEFAULT, "URLSession %@ failed with error, %@", buf, 0x16u);

      }
      +[TPSNetworkPathMonitor sharedMonitor](TPSNetworkPathMonitor, "sharedMonitor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "start");

    }
  }
  else
  {
    +[TPSNetworkPathMonitor sharedMonitor](TPSNetworkPathMonitor, "sharedMonitor");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stop");

  }
}

- (void)URLSessionManagerDidReceiveChallenge:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const __CFData *v13;
  void *v14;
  const __CFDictionary *v15;
  const __CFDictionary *ValueAtIndex;
  __SecIdentity *Value;
  CFArrayRef v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  SecCertificateRef v22;
  CFArrayRef items;
  void *v24;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  if (+[TPSCommonDefines isInternalDevice](TPSCommonDefines, "isInternalDevice")
    && objc_msgSend(v6, "previousFailureCount") < 4)
  {
    objc_msgSend(v6, "proposedCredential");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "protectionSpace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "authenticationMethod");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB32A8]))
    {
      objc_msgSend(v9, "host");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "hasSuffix:", CFSTR(".apple.com"));

      if (v12)
      {
        if (self->_passphrase && self->_certificateFilePath)
        {
          v13 = (const __CFData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:", self->_certificateFilePath);
          if (v13)
          {
            v14 = (void *)*MEMORY[0x1E0CD6D58];
            values = self->_passphrase;
            keys[0] = v14;
            v15 = CFDictionaryCreate(0, (const void **)keys, (const void **)&values, 1, 0, 0);
            items = 0;
            if (!SecPKCS12Import(v13, v15, &items))
            {
              ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(items, 0);
              Value = (__SecIdentity *)CFDictionaryGetValue(ValueAtIndex, (const void *)*MEMORY[0x1E0CD6D60]);
              v22 = 0;
              SecIdentityCopyCertificate(Value, &v22);
              v24 = v22;
              v18 = CFArrayCreate(0, (const void **)&v24, 1, 0);
              objc_msgSend(MEMORY[0x1E0CB39A8], "credentialWithIdentity:certificates:persistence:", Value, v18, 1);
              v19 = objc_claimAutoreleasedReturnValue();

              if (v18)
                CFRelease(v18);
              v8 = (void *)v19;
            }
            if (v15)
              CFRelease(v15);
          }

        }
      }
    }
    if (v8)
    {
      v20 = 0;
      v21 = v8;
    }
    else
    {
      v20 = 1;
      v21 = 0;
    }
    ((void (**)(id, uint64_t, void *))v7)[2](v7, v20, v21);

  }
  else
  {
    v7[2](v7, 3, 0);
  }

}

- (void)sessionTask:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__TPSURLSessionHandler_sessionTask_didReceiveChallenge_completionHandler___block_invoke;
  block[3] = &unk_1E395B978;
  objc_copyWeak(&v18, &location);
  v16 = v8;
  v17 = v10;
  v15 = v9;
  v11 = v8;
  v12 = v9;
  v13 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __74__TPSURLSessionHandler_sessionTask_didReceiveChallenge_completionHandler___block_invoke(id *a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  WeakRetained = (id *)objc_loadWeakRetained(a1 + 7);
  v3 = WeakRetained;
  if (!WeakRetained)
  {
    if (+[TPSCommonDefines isInternalDevice](TPSCommonDefines, "isInternalDevice"))
      goto LABEL_11;
    v4 = 0;
LABEL_13:
    (*((void (**)(void))a1[6] + 2))();
LABEL_22:

    goto LABEL_23;
  }
  v4 = objc_loadWeakRetained(WeakRetained + 2);
  if (!+[TPSCommonDefines isInternalDevice](TPSCommonDefines, "isInternalDevice"))
    goto LABEL_13;
  if (v4)
  {
    objc_msgSend(a1[4], "protectionSpace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "authenticationMethod");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB32B0]) & 1) != 0
      || objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB32B8]))
    {
      if (objc_msgSend(a1[4], "previousFailureCount") > 3)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v4, "urlSessionHandlerURLAuthenticationFailed:", v3);
        (*((void (**)(void))a1[6] + 2))();
      }
      else
      {
        objc_msgSend(a1[4], "proposedCredential");
        v7 = objc_claimAutoreleasedReturnValue();
        if (v7 && (v8 = (void *)v7, v9 = objc_msgSend(a1[4], "previousFailureCount"), v8, v9 <= 1))
        {
          v10 = (void (**)(id, _QWORD, void *))a1[6];
          objc_msgSend(a1[4], "proposedCredential");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v10[2](v10, 0, v11);

        }
        else
        {
          objc_msgSend(a1[5], "task");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "currentRequest");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "URL");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "host");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v16[0] = MEMORY[0x1E0C809B0];
            v16[1] = 3221225472;
            v16[2] = __74__TPSURLSessionHandler_sessionTask_didReceiveChallenge_completionHandler___block_invoke_2;
            v16[3] = &unk_1E395B950;
            v17 = a1[6];
            objc_msgSend(v4, "urlSessionHandlerURL:authenticateWithHost:completionHandler:", v3, v15, v16);

          }
          else
          {
            (*((void (**)(void))a1[6] + 2))();
          }

        }
      }
    }

    goto LABEL_22;
  }
LABEL_11:
  (*((void (**)(void))a1[6] + 2))();
LABEL_23:

}

void __74__TPSURLSessionHandler_sessionTask_didReceiveChallenge_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (objc_msgSend(v7, "length") && objc_msgSend(v5, "length"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39A8]), "initWithUser:password:persistence:", v7, v5, 2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (TPSURLSessionHandlerDelegate)delegate
{
  return (TPSURLSessionHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setShouldIgnoreInMemoryCaching:(BOOL)a3
{
  self->_shouldIgnoreInMemoryCaching = a3;
}

- (NSIndexSet)excludeCachingDataTypes
{
  return self->_excludeCachingDataTypes;
}

- (void)setExcludeCachingDataTypes:(id)a3
{
  objc_storeStrong((id *)&self->_excludeCachingDataTypes, a3);
}

- (NSString)passphrase
{
  return self->_passphrase;
}

- (NSString)certificateFilePath
{
  return self->_certificateFilePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificateFilePath, 0);
  objc_storeStrong((id *)&self->_passphrase, 0);
  objc_storeStrong((id *)&self->_excludeCachingDataTypes, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)sessionTask:(void *)a1 didReceiveResponse:(NSObject *)a2 completionHandler:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_19A906000, a2, OS_LOG_TYPE_DEBUG, "Data cache Last-Modified did not change, cancel request and use cache %@", (uint8_t *)&v4, 0xCu);

}

@end
