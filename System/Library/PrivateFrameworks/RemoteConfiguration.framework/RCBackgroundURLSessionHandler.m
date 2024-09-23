@implementation RCBackgroundURLSessionHandler

- (RCBackgroundURLSessionHandler)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RCBackgroundURLSessionHandler;
  return -[RCBackgroundURLSessionHandler init](&v3, sel_init);
}

- (void)reestablishBackgroundSessionWithConfigurationSettings:(id)a3 sessionCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[RCBackgroundURLSessionHandler setConfigurationSettings:](self, "setConfigurationSettings:", v7);
  -[RCBackgroundURLSessionHandler setSessionCompletionHandler:](self, "setSessionCompletionHandler:", v6);

  objc_msgSend(v7, "backgroundFetchConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "sessionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCBackgroundURLSessionHandler setSessionIdentifier:](self, "setSessionIdentifier:", v9);

  RCSharedLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "sessionIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v11;
    _os_log_impl(&dword_1A1FB5000, v10, OS_LOG_TYPE_DEFAULT, "RCBackgroundURLSessionHandler will reestablish background URL session, id: %{public}@", buf, 0xCu);

  }
  v14 = 0;
  +[RCURLSession backgroundSessionForFetchConfig:delegateReference:](RCURLSession, "backgroundSessionForFetchConfig:delegateReference:", v8, &v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v14;
  objc_msgSend(v13, "addObserver:", self);

}

- (void)networkSessionDidFinishWithTasks:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *queue;
  id obj;
  uint64_t v23;
  uint64_t v24;
  _QWORD block[6];
  _QWORD v27[6];
  NSObject *v28;
  _QWORD *v29;
  _BYTE *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[5];
  RCUnfairLock *v36;
  uint8_t v37[4];
  void *v38;
  __int16 v39;
  void *v40;
  uint8_t v41[128];
  _BYTE buf[24];
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  RCSharedLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[RCBackgroundURLSessionHandler sessionIdentifier](self, "sessionIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1A1FB5000, v4, OS_LOG_TYPE_DEFAULT, "RCBackgroundURLSessionHandler networkSessionDidFinish, id: %{public}@, taskCount: %lu", buf, 0x16u);

  }
  RCDispatchQueueForQualityOfService(-1);
  queue = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_group_create();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v43 = __Block_byref_object_copy__2;
  v44 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v45 = (id)objc_claimAutoreleasedReturnValue();
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__2;
  v35[4] = __Block_byref_object_dispose__2;
  v36 = objc_alloc_init(RCUnfairLock);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v3;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v32 != v23)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        dispatch_group_enter(v6);
        objc_msgSend(v8, "data");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "httpResponse");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "allHeaderFields");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Cache-Control"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "rc_numberFollowingString:", CFSTR("max-age="));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13 || (objc_msgSend(v13, "doubleValue"), v14 == 0.0))
        {
          RCSharedLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v10, "URL");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "absoluteString");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "identifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v37 = 138543618;
            v38 = v17;
            v39 = 2114;
            v40 = v18;
            _os_log_impl(&dword_1A1FB5000, v15, OS_LOG_TYPE_DEFAULT, "max-age missing from Cache-Control header for URL: %{public}@, taskID: %{public}@", v37, 0x16u);

          }
          v13 = 0;
        }
        -[RCBackgroundURLSessionHandler configurationSettings](self, "configurationSettings");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __66__RCBackgroundURLSessionHandler_networkSessionDidFinishWithTasks___block_invoke;
        v27[3] = &unk_1E470EA80;
        v27[4] = v8;
        v27[5] = self;
        v29 = v35;
        v30 = buf;
        v28 = v6;
        +[RCEndpointResponseProcessing parseEndpointResponse:configurationSettings:maxAge:loggingPrefix:completion:](RCEndpointResponseProcessing, "parseEndpointResponse:configurationSettings:maxAge:loggingPrefix:completion:", v9, v19, v13, v20, v27);

      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    }
    while (v24);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__RCBackgroundURLSessionHandler_networkSessionDidFinishWithTasks___block_invoke_2;
  block[3] = &unk_1E470EAA8;
  block[4] = self;
  block[5] = buf;
  dispatch_group_notify(v6, queue, block);
  _Block_object_dispose(v35, 8);

  _Block_object_dispose(buf, 8);
}

void __66__RCBackgroundURLSessionHandler_networkSessionDidFinishWithTasks___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  RCBackgroundTaskResult *v15;
  void *v16;
  RCBackgroundTaskResult *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  RCBackgroundTaskResult *v21;
  _QWORD v22[4];
  RCBackgroundTaskResult *v23;
  uint64_t v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  RCSharedLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "sessionIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v9;
      v27 = 2114;
      v28 = v10;
      v29 = 2114;
      v30 = v5;
      v11 = "Failed to parse response data for task (%{public}@) of network session (%{public}@), error: %{public}@";
      v12 = v8;
      v13 = OS_LOG_TYPE_ERROR;
      v14 = 32;
LABEL_6:
      _os_log_impl(&dword_1A1FB5000, v12, v13, v11, buf, v14);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "sessionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = v9;
    v27 = 2114;
    v28 = v10;
    v11 = "Successfully parsed response data for task (%{public}@) of network session (%{public}@)";
    v12 = v8;
    v13 = OS_LOG_TYPE_DEFAULT;
    v14 = 22;
    goto LABEL_6;
  }

  v15 = [RCBackgroundTaskResult alloc];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[RCBackgroundTaskResult initWithTaskIdentifier:configurationResourcesByRequestKey:error:](v15, "initWithTaskIdentifier:configurationResourcesByRequestKey:error:", v16, v6, v5);

  v18 = *(_QWORD *)(a1 + 64);
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[2] = __66__RCBackgroundURLSessionHandler_networkSessionDidFinishWithTasks___block_invoke_7;
  v22[3] = &unk_1E470DFC8;
  v20 = *(void **)(v19 + 40);
  v22[1] = 3221225472;
  v23 = v17;
  v24 = v18;
  v21 = v17;
  objc_msgSend(v20, "performWithLockSync:", v22);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __66__RCBackgroundURLSessionHandler_networkSessionDidFinishWithTasks___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", *(_QWORD *)(a1 + 32));
}

void __66__RCBackgroundURLSessionHandler_networkSessionDidFinishWithTasks___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(id, void *);

  objc_msgSend(*(id *)(a1 + 32), "sessionCompletionHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionCompletionHandler");
    v4 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "copy");
    v4[2](v4, v3);

  }
}

- (RCConfigurationSettings)configurationSettings
{
  return self->_configurationSettings;
}

- (void)setConfigurationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_configurationSettings, a3);
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sessionIdentifier, a3);
}

- (id)sessionCompletionHandler
{
  return self->_sessionCompletionHandler;
}

- (void)setSessionCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sessionCompletionHandler, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_configurationSettings, 0);
}

@end
