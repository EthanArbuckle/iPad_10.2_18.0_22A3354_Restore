@implementation RCEndpointOperation

- (void)setConfigurationResourcesByRequestKey:(id)a3
{
  objc_storeStrong((id *)&self->_configurationResourcesByRequestKey, a3);
}

void __55__RCEndpointOperation__fetchConfigurationWithSettings___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  void *v21;
  _QWORD v22[6];
  _BYTE buf[24];
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  RCSharedLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "shortOperationDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v14, "statusCode");
    objc_msgSend(MEMORY[0x1E0CB3680], "localizedStringForStatusCode:", objc_msgSend(v14, "statusCode"));
    v19 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v17;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v18;
    *(_WORD *)&buf[22] = 2112;
    v24 = v19;
    _os_log_impl(&dword_1A1FB5000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Endpoint JSON HTTP response status code: %ld (%@)", buf, 0x20u);

  }
  if (!v11 || v15)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v15);
  }
  else if (v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", v12);
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v24 = __Block_byref_object_copy__1;
    v25 = __Block_byref_object_dispose__1;
    v26 = 0;
    v20 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "shortOperationDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __55__RCEndpointOperation__fetchConfigurationWithSettings___block_invoke_14;
    v22[3] = &unk_1E470E158;
    v22[4] = *(_QWORD *)(a1 + 32);
    v22[5] = buf;
    +[RCEndpointResponseProcessing parseEndpointResponseDict:parsingError:configurationSettings:maxAge:loggingPrefix:completion:](RCEndpointResponseProcessing, "parseEndpointResponseDict:parsingError:configurationSettings:maxAge:loggingPrefix:completion:", v11, 0, v20, v13, v21, v22);

    objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
    _Block_object_dispose(buf, 8);

  }
}

- (void)performOperation
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  RCSharedLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[RCOperation shortOperationDescription](self, "shortOperationDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCEndpointOperation configurationSettings](self, "configurationSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1A1FB5000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ will perform operation to fetch config with settings %@", (uint8_t *)&v7, 0x16u);

  }
  -[RCEndpointOperation configurationSettings](self, "configurationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCEndpointOperation _fetchConfigurationWithSettings:](self, "_fetchConfigurationWithSettings:", v6);

}

- (BOOL)validateOperation
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  _BOOL4 v7;

  -[RCEndpointOperation configurationSettings](self, "configurationSettings");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[RCEndpointOperation configurationSettings](self, "configurationSettings"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isValid"),
        v5,
        v4,
        (v6 & 1) != 0))
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v7)
    {
      -[RCEndpointOperation validateOperation].cold.1();
      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

- (RCConfigurationSettings)configurationSettings
{
  return self->_configurationSettings;
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[RCEndpointOperation completionQueue](self, "completionQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    RCDispatchQueueForQualityOfService(-[RCEndpointOperation qualityOfService](self, "qualityOfService"));
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  -[RCEndpointOperation configurationCompletionHandler](self, "configurationCompletionHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __52__RCEndpointOperation_operationWillFinishWithError___block_invoke;
    v10[3] = &unk_1E470DE50;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v8, v10);

  }
}

void __52__RCEndpointOperation_operationWillFinishWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(id, void *, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "configurationCompletionHandler");
  v3 = (void (**)(id, void *, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "configurationResourcesByRequestKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v2, *(_QWORD *)(a1 + 40));

}

- (id)configurationCompletionHandler
{
  return self->_configurationCompletionHandler;
}

- (NSDictionary)configurationResourcesByRequestKey
{
  return self->_configurationResourcesByRequestKey;
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)_fetchConfigurationWithSettings:(id)a3
{
  id v4;
  RCURLFetchOperation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(RCURLFetchOperation);
  -[RCEndpointOperation endpointURL](self, "endpointURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCURLFetchOperation setURL:](v5, "setURL:", v6);

  -[RCEndpointOperation requestDataForSettings:](self, "requestDataForSettings:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCURLFetchOperation setHTTPBody:](v5, "setHTTPBody:", v7);

  -[RCURLFetchOperation setHTTPMethod:](v5, "setHTTPMethod:", CFSTR("PUT"));
  v16 = CFSTR("Content-Type");
  v17[0] = CFSTR("application/json");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCURLFetchOperation setAdditionalRequestHTTPHeaders:](v5, "setAdditionalRequestHTTPHeaders:", v8);

  objc_msgSend(v4, "loggingKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCURLFetchOperation setLoggingKey:](v5, "setLoggingKey:", v9);

  objc_msgSend(v4, "endpointTimeoutDuration");
  -[RCURLFetchOperation setURLRequestTimeoutDuration:](v5, "setURLRequestTimeoutDuration:");
  -[RCEndpointOperation networkEventHandler](self, "networkEventHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCURLFetchOperation setNetworkEventHandler:](v5, "setNetworkEventHandler:", v10);

  -[RCEndpointOperation networkActivity](self, "networkActivity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCURLFetchOperation setNetworkActivity:](v5, "setNetworkActivity:", v11);

  objc_msgSend(v4, "backgroundFetchConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCURLFetchOperation setBackgroundFetchConfiguration:](v5, "setBackgroundFetchConfiguration:", v12);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__RCEndpointOperation__fetchConfigurationWithSettings___block_invoke;
  v14[3] = &unk_1E470E180;
  v14[4] = self;
  v15 = v4;
  v13 = v4;
  -[RCURLFetchOperation setConfigurationDictionaryCompletionHandler:](v5, "setConfigurationDictionaryCompletionHandler:", v14);
  -[RCOperation associateChildOperation:](self, "associateChildOperation:", v5);
  -[RCOperation start](v5, "start");

}

- (void)setNetworkEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (void)setEndpointURL:(id)a3
{
  objc_storeStrong((id *)&self->_endpointURL, a3);
}

- (void)setConfigurationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_configurationSettings, a3);
}

- (void)setConfigurationCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (void)setChangeTagsByRequestKey:(id)a3
{
  objc_storeStrong((id *)&self->_changeTagsByRequestKey, a3);
}

- (id)requestDataForSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v33;
  uint64_t v34;
  RCEndpointOperation *v35;
  void *v36;
  uint64_t v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v33 = v4;
  objc_msgSend(v4, "requestInfos");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v44;
    v35 = self;
    v36 = v6;
    v34 = *(_QWORD *)v44;
    do
    {
      v10 = 0;
      v37 = v8;
      do
      {
        if (*(_QWORD *)v44 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1E0C99E08];
        objc_msgSend(v11, "allAdditionalFields");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "dictionaryWithDictionary:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[RCEndpointOperation changeTagsByRequestKey](self, "changeTagsByRequestKey");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "requestKey");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "requestType"))
        {
          if (objc_msgSend(v11, "requestType") != 1)
            goto LABEL_22;
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            objc_msgSend(v17, "dictionaryRepresentation");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObject:", v19);

          }
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          objc_msgSend(v11, "additionalChangeTags");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v40;
            do
            {
              for (i = 0; i != v22; ++i)
              {
                if (*(_QWORD *)v40 != v23)
                  objc_enumerationMutation(v20);
                objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "dictionaryRepresentation");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "addObject:", v25);

              }
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
            }
            while (v22);
          }

          objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, CFSTR("changeTagWrappers"));
          objc_msgSend(v11, "requestKey");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = v36;
          objc_msgSend(v36, "setObject:forKeyedSubscript:", v14, v26);

          v9 = v34;
          self = v35;
          v8 = v37;
        }
        else
        {
          if (v17)
          {
            objc_msgSend(v17, "dictionaryRepresentation");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setObject:forKeyedSubscript:", v27, CFSTR("changeTagWrapper"));

          }
          objc_msgSend(v11, "requestKey");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v18);
        }

LABEL_22:
        ++v10;
      }
      while (v10 != v8);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v6, 0, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  RCSharedLog();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    -[RCOperation shortOperationDescription](self, "shortOperationDescription");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v28, 4);
    *(_DWORD *)buf = 138543618;
    v48 = v30;
    v49 = 2112;
    v50 = v31;
    _os_log_impl(&dword_1A1FB5000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ Endpoint JSON request: %@", buf, 0x16u);

  }
  return v28;
}

- (id)networkEventHandler
{
  return self->_networkEventHandler;
}

- (NSURL)endpointURL
{
  return self->_endpointURL;
}

- (NSDictionary)changeTagsByRequestKey
{
  return self->_changeTagsByRequestKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationResourcesByRequestKey, 0);
  objc_storeStrong((id *)&self->_networkActivity, 0);
  objc_storeStrong(&self->_networkEventHandler, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong(&self->_configurationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_endpointURL, 0);
  objc_storeStrong((id *)&self->_changeTagsByRequestKey, 0);
  objc_storeStrong((id *)&self->_configurationSettings, 0);
}

void __55__RCEndpointOperation__fetchConfigurationWithSettings___block_invoke_14(uint64_t a1, void *a2, id obj)
{
  id v6;
  id v7;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v6 = obj;
  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setConfigurationResourcesByRequestKey:", v7);

}

- (unint64_t)maxRetries
{
  return 1;
}

- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  BOOL v12;

  v5 = a3;
  if (objc_msgSend(v5, "rc_shouldRetry")
    && (objc_msgSend(v5, "userInfo"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RCErrorRetryAfter")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    objc_msgSend(v5, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("RCErrorRetryAfter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;

    *a4 = -[RCOperationDelayedRetrySignal initWithDelay:]([RCOperationDelayedRetrySignal alloc], "initWithDelay:", v11);
    v12 = 1;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)resetForRetry
{
  -[RCEndpointOperation setConfigurationResourcesByRequestKey:](self, "setConfigurationResourcesByRequestKey:", 0);
}

- (void)setCompletionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_completionQueue, a3);
}

- (RCNetworkActivity)networkActivity
{
  return self->_networkActivity;
}

- (void)setNetworkActivity:(id)a3
{
  objc_storeStrong((id *)&self->_networkActivity, a3);
}

- (void)validateOperation
{
  void *v0;
  int v1;
  const char *v2;
  __int16 v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("the endpoint operation must have valid configuration settings"));
  v1 = 136315906;
  v2 = "-[RCEndpointOperation validateOperation]";
  v3 = 2080;
  v4 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/RCEndpointOperation.m";
  v5 = 1024;
  v6 = 54;
  v7 = 2114;
  v8 = v0;
  _os_log_error_impl(&dword_1A1FB5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);

}

@end
