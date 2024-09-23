@implementation ICURLSession

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *accessQueue;
  uint64_t v15;
  id v16;
  NSObject *operationQueue;
  NSObject *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  _QWORD block[5];
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint8_t buf[4];
  ICURLSession *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__9438;
  v32 = __Block_byref_object_dispose__9439;
  v33 = 0;
  accessQueue = self->_accessQueue;
  v15 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__ICURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke;
  block[3] = &unk_1E43907D8;
  v27 = &v28;
  block[4] = self;
  v16 = v11;
  v26 = v16;
  dispatch_sync(accessQueue, block);
  if (v29[5])
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend((id)v29[5], "setLastUpdateTime:");
    operationQueue = self->_operationQueue;
    v19[0] = v15;
    v19[1] = 3221225472;
    v19[2] = __73__ICURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2;
    v19[3] = &unk_1E438B4D0;
    v19[4] = self;
    v24 = &v28;
    v20 = v16;
    v21 = v12;
    v22 = v10;
    v23 = v13;
    dispatch_async(operationQueue, v19);

  }
  else
  {
    v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v35 = self;
      v36 = 2114;
      v37 = v16;
      _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ no request for data task %{public}@ - ignoring", buf, 0x16u);
    }

    (*((void (**)(id, uint64_t))v13 + 2))(v13, 1);
  }

  _Block_object_dispose(&v28, 8);
}

void __48__ICURLSession__scheduleNextRequestTimeoutCheck__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  dispatch_time_t v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  double v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v23;
    v6 = 3.40282347e38;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v23 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v8, "requestState", (_QWORD)v22) != 2)
        {
          objc_msgSend(*(id *)(a1 + 32), "_timeoutForRequest:", v8);
          if (v9 != 0.0)
          {
            v10 = v9;
            objc_msgSend(v8, "lastUpdateTime");
            if (v10 + v11 < v6)
            {
              objc_msgSend(v8, "lastUpdateTime");
              v6 = v10 + v12;
            }
          }
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v4);

    if (v6 != 3.40282347e38)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v14 = v6 - v13;
      v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v27 = v16;
        v28 = 2048;
        v29 = v14;
        _os_log_impl(&dword_1A03E3000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Scheduling next timeout check in %.2fs", buf, 0x16u);
      }

      v17 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 72);
      v18 = dispatch_time(0, (unint64_t)(v14 * 1000000000.0));
      v19 = v17;
      goto LABEL_20;
    }
  }
  else
  {

  }
  v20 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v27 = v21;
    _os_log_impl(&dword_1A03E3000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Canceling timeout timer", buf, 0xCu);
  }

  v19 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 72);
  v18 = -1;
LABEL_20:
  dispatch_source_set_timer(v19, v18, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
}

- (double)_timeoutForRequest:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;

  objc_msgSend(a3, "currentURLRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeoutInterval");
  v6 = v5;

  if (v6 == 0.0)
  {
    -[NSURLSession configuration](self->_urlSession, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeoutIntervalForRequest");
    v6 = v8;

  }
  return v6 + v6;
}

void __39__ICURLSession__processPendingRequests__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t i;
  unint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD block[5];
  id v33;
  id v34;
  uint64_t v35;
  uint8_t v36[128];
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 32);
  v4 = (void *)objc_msgSend(*(id *)(v2 + 40), "copy");
  v5 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v38 = v7;
    v39 = 2048;
    v40 = v3;
    _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Checking request queue (counter = %lu).", buf, 0x16u);
  }

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__ICURLSession__processPendingRequests__block_invoke_52;
  block[3] = &unk_1E438BA30;
  block[4] = v8;
  v35 = v3;
  v10 = v5;
  v33 = v10;
  v11 = v4;
  v34 = v11;
  dispatch_async(v9, block);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v12 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v12);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "requestState", (_QWORD)v28) != 2)
          ++v15;
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v14);
  }
  else
  {
    v15 = 0;
  }

  v18 = 0;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count"))
  {
    while (1)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectAtIndex:", v18, (_QWORD)v28);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v21 = *(_QWORD *)(a1 + 32);
      if (!*(_BYTE *)(v21 + 64) && v15 < *(_QWORD *)(v21 + 88))
        break;
      if (objc_msgSend(v19, "prioritize"))
        break;

      if (++v18 >= objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count"))
        goto LABEL_21;
    }

  }
LABEL_21:
  if (v18 < objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count", (_QWORD)v28))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectAtIndex:", v18);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v24 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;

    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setLastUpdateTime:");
    v25 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = *(_QWORD *)(a1 + 32);
      v27 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      v38 = v26;
      v39 = 2114;
      v40 = v27;
      _os_log_impl(&dword_1A03E3000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ Activating request %{public}@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_processRequest:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }

}

- (void)_processRequest:(id)a3
{
  id v4;
  NSObject *operationQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  ICURLSession *v9;

  v4 = a3;
  operationQueue = self->_operationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__ICURLSession__processRequest___block_invoke;
  v7[3] = &unk_1E4391110;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(operationQueue, v7);

}

uint64_t __32__ICURLSession__enqueueRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", *(_QWORD *)(a1 + 40));
}

void __59__ICURLSession_URLSession_task_didFinishCollectingMetrics___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  ICURLPerformanceMetrics *v6;
  void *v7;
  void *v8;
  ICURLPerformanceMetrics *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "transactionMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "_requestForTask:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v12 = v4;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), *(_QWORD *)(a1 + 48));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = [ICURLPerformanceMetrics alloc];
      objc_msgSend(*(id *)(a1 + 32), "transactionMetrics");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[ICURLPerformanceMetrics initWithTransactionMetrics:request:taskIdentifier:](v6, "initWithTransactionMetrics:request:taskIdentifier:", v8, v12, v5);

      objc_msgSend(v12, "aggregatedPerformanceMetrics");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICURLAggregatedPerformanceMetrics aggregatedMetricsFromAggregatedMetrics:addingMetrics:](ICURLAggregatedPerformanceMetrics, "aggregatedMetricsFromAggregatedMetrics:addingMetrics:", v10, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAggregatedPerformanceMetrics:", v11);

      v4 = v12;
    }

  }
}

void __32__ICURLSession__processRequest___block_invoke(int8x16_t *a1)
{
  int8x16_t v1;
  _QWORD v2[4];
  int8x16_t v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __32__ICURLSession__processRequest___block_invoke_2;
  v2[3] = &unk_1E438B4F8;
  v1 = a1[2];
  v3 = vextq_s8(v1, v1, 8uLL);
  objc_msgSend((id)v1.i64[0], "buildURLRequestWithCompletionHandler:", v2);

}

void __31__ICURLSession__finishRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  int8x16_t v8;
  _QWORD v9[4];
  int8x16_t v10;
  id v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "updateState:", 3);
  objc_msgSend(*(id *)(a1 + 32), "currentURLRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "_newResponseForRequest:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "responseHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __31__ICURLSession__finishRequest___block_invoke_2;
  v9[3] = &unk_1E438B548;
  v8 = *(int8x16_t *)(a1 + 32);
  v5 = (id)v8.i64[0];
  v10 = vextq_s8(v8, v8, 8uLL);
  v11 = v3;
  v12 = v2;
  v6 = v2;
  v7 = v3;
  objc_msgSend(v4, "processCompletedResponse:toRequest:withCompletionHandler:", v7, v5, v9);

  objc_msgSend(*(id *)(a1 + 40), "_scheduleNextRequestTimeoutCheck");
}

void __73__ICURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInternalBuild");

  if (v3)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      v26 = v6;
      v27 = 2114;
      v28 = v5;
      v29 = 2114;
      v30 = v7;
      v31 = 2114;
      v32 = v8;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ received response for task %{public}@: %{public}@", buf, 0x2Au);
    }
  }
  else
  {
    v9 = objc_msgSend(*(id *)(a1 + 48), "statusCode");
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 40);
      ICURLResponseStatusCodeGetExtendedDescription(v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v26 = v11;
      v27 = 2114;
      v28 = v10;
      v29 = 2114;
      v30 = v12;
      v31 = 2114;
      v32 = v13;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ received response for task %{public}@: %{public}@", buf, 0x2Au);

    }
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setUrlResponse:", *(_QWORD *)(a1 + 48));
  v14 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newResponseForRequest:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "responseHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(a1 + 72);
  v17 = *(_QWORD *)(*(_QWORD *)(v16 + 8) + 40);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __73__ICURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_38;
  v19[3] = &unk_1E438B4A8;
  v20 = v14;
  v24 = v16;
  v21 = *(id *)(a1 + 56);
  v22 = *(id *)(a1 + 40);
  v23 = *(id *)(a1 + 64);
  v18 = v14;
  objc_msgSend(v15, "processInitialResponse:toRequest:withCompletionHandler:", v18, v17, v19);

}

void __51__ICURLSession_URLSession_dataTask_didReceiveData___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_requestForTask:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(v5, "setLastUpdateTime:");
    objc_msgSend(v5, "responseData");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appendData:", *(_QWORD *)(a1 + 48));

    objc_msgSend(v5, "progress");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "responseData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCompletedUnitCount:", objc_msgSend(v4, "length") + 1);

  }
}

- (id)_newResponseForRequest:(id)a3
{
  id v3;
  unint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;

  v3 = a3;
  v4 = objc_msgSend(v3, "type");
  if (v4 > 5)
  {
    v12 = 0;
  }
  else
  {
    if (((1 << v4) & 0x3A) != 0)
    {
      v5 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_responseClass"));
      objc_msgSend(v3, "urlResponse");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "currentURLRequest");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "responseDataURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "aggregatedPerformanceMetrics");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v5, "initWithURLResponse:urlRequest:bodyDataURL:performanceMetrics:", v6, v7, v8, v9);
    }
    else
    {
      v11 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_responseClass"));
      objc_msgSend(v3, "urlResponse");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "currentURLRequest");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "responseData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "aggregatedPerformanceMetrics");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v11, "initWithURLResponse:urlRequest:bodyData:performanceMetrics:", v6, v7, v8, v9);
    }
    v12 = (void *)v10;

  }
  return v12;
}

void __32__ICURLSession__processRequest___block_invoke_3(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  double v31;
  double v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD block[5];
  id v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  if (v2)
    goto LABEL_2;
  v10 = *(void **)(a1 + 40);
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7101, 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
LABEL_2:
    v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 48);
      v5 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 138543874;
      v41 = v4;
      v42 = 2114;
      v43 = v5;
      v44 = 2114;
      v45 = v2;
      _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@ failed to build URL request. err=%{public}@", buf, 0x20u);
    }

    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(void **)(a1 + 56);
    v8 = *(NSObject **)(v6 + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__ICURLSession__processRequest___block_invoke_53;
    block[3] = &unk_1E4391110;
    block[4] = v6;
    v39 = v7;
    dispatch_sync(v8, block);
    objc_msgSend(*(id *)(a1 + 56), "completionHandler");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v9)[2](v9, 0, v2);

    objc_msgSend(*(id *)(a1 + 56), "setCompletionHandler:", 0);
    goto LABEL_19;
  }
  v2 = (id)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 56), "requestContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "networkConstraints");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12
    && (objc_msgSend(v12, "shouldAllowDataForCellularNetworkTypes") & 1) == 0
    && objc_msgSend(v2, "allowsCellularAccess"))
  {
    objc_msgSend(v2, "setAllowsCellularAccess:", 0);
  }
  +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "requestTimeoutOverride");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "doubleValue");
    objc_msgSend(v2, "setTimeoutInterval:");
  }
  objc_msgSend(*(id *)(a1 + 56), "setCurrentURLRequest:", v2);
  objc_msgSend(*(id *)(a1 + 48), "_createURLSessionTaskForRequest:usingSession:", *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 80));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "setTask:", v15);

  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isInternalBuild");

  v18 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
  v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (v17)
  {
    if (v19)
    {
      v20 = *(void **)(a1 + 56);
      v36 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v20, "task");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(*(id *)(a1 + 56), "retryCount") + 1;
      v21 = objc_msgSend(*(id *)(a1 + 56), "maxRetryCount") + 1;
      objc_msgSend(*(id *)(a1 + 56), "currentURLRequest");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "currentURLRequest");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "allHTTPHeaderFields");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      v41 = v36;
      v42 = 2114;
      v43 = v20;
      v44 = 2114;
      v45 = v35;
      v46 = 2048;
      v47 = v34;
      v48 = 2048;
      v49 = v21;
      v50 = 2114;
      v51 = v22;
      v52 = 2114;
      v53 = v24;
      _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ created URL task %{public}@ (attempt %lu/%lu) for request: %{public}@\n%{public}@", buf, 0x48u);

    }
  }
  else if (v19)
  {
    v25 = *(void **)(a1 + 56);
    v37 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v25, "task");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(*(id *)(a1 + 56), "retryCount") + 1;
    v28 = objc_msgSend(*(id *)(a1 + 56), "maxRetryCount") + 1;
    objc_msgSend(*(id *)(a1 + 56), "currentURLRequest");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v41 = v37;
    v42 = 2114;
    v43 = v25;
    v44 = 2114;
    v45 = v26;
    v46 = 2048;
    v47 = v27;
    v48 = 2048;
    v49 = v28;
    v50 = 2114;
    v51 = v29;
    _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ created URL task %{public}@ (attempt %lu/%lu) for request: %{public}@", buf, 0x3Eu);

  }
  v30 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  objc_msgSend(*(id *)(a1 + 56), "setResponseData:", v30);

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v32 = v31;
  objc_msgSend(*(id *)(a1 + 56), "setLastUpdateTime:");
  objc_msgSend(*(id *)(a1 + 56), "setStartTime:", v32);
  objc_msgSend(*(id *)(a1 + 56), "updateState:", 1);
  objc_msgSend(*(id *)(a1 + 56), "task");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "resume");

  objc_msgSend(*(id *)(a1 + 48), "_scheduleNextRequestTimeoutCheck");
LABEL_19:

}

- (id)_requestForTask:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_activeRequests;
  v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "task", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "taskIdentifier");
        v12 = objc_msgSend(v4, "taskIdentifier");

        if (v11 == v12)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_scheduleNextRequestTimeoutCheck
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__ICURLSession__scheduleNextRequestTimeoutCheck__block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (id)_createURLSessionTaskForRequest:(id)a3 usingSession:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  switch(objc_msgSend(v7, "type"))
  {
    case 0:
      objc_msgSend(v7, "currentURLRequest");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dataTaskWithRequest:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      objc_msgSend(v7, "currentURLRequest");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "downloadTaskWithRequest:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      objc_msgSend(v7, "currentURLRequest");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "currentURLRequest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "HTTPBody");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uploadTaskWithRequest:fromData:", v9, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 4:
      objc_msgSend(v7, "resumeData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "downloadTaskWithResumeData:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v13 = (void *)v10;
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICURLSession.m"), 749, CFSTR("unsupported request type %d"), objc_msgSend(v7, "type"));
      v13 = 0;
      break;
  }

  return v13;
}

void __53__ICURLSession_URLSession_task_didCompleteWithError___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  NSObject *v39;
  id v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  NSObject *v47;
  _QWORD v48[5];
  id v49;
  id v50;
  NSObject *v51;
  id v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint8_t buf[4];
  id v61;
  __int16 v62;
  id v63;
  __int16 v64;
  id v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  double v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  void *v75;
  uint64_t v76;
  _QWORD v77[4];

  v77[1] = *MEMORY[0x1E0C80C00];
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__9438;
  v58 = __Block_byref_object_dispose__9439;
  objc_msgSend(a1[4], "_requestForTask:", a1[5]);
  v59 = (id)objc_claimAutoreleasedReturnValue();
  if (v55[5])
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend((id)v55[5], "setLastUpdateTime:");
    v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = a1[4];
      v4 = (void *)v55[5];
      v5 = a1[6];
      *(_DWORD *)buf = 138412802;
      v61 = v3;
      v62 = 2114;
      v63 = v4;
      v64 = 2114;
      v65 = v5;
      _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%@ %{public}@ task finished. err=%{public}@", buf, 0x20u);
    }

    if (objc_msgSend((id)v55[5], "type") != 3 && objc_msgSend((id)v55[5], "type") != 5)
    {
      objc_msgSend(a1[5], "response");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v55[5], "setUrlResponse:", v6);

    }
    v7 = a1[6];
    if (v7)
    {
      objc_msgSend(v7, "domain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CB32E8]);

      if (v9)
      {
        v10 = objc_msgSend(a1[6], "code");
        if (v10 == -1008 || v10 == -1100)
          v12 = -7104;
        else
          v12 = -7100;
      }
      else
      {
        v12 = -7100;
      }
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0CB3388];
      v18 = a1[6];
      v76 = *MEMORY[0x1E0CB3388];
      v77[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, &v76, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("ICError"), v12, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)v55[5], "error");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21)
      {
        objc_msgSend(v21, "userInfo");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          objc_msgSend(v22, "userInfo");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)objc_msgSend(v24, "mutableCopy");

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend(v25, "setObject:forKey:", v20, v17);
        v26 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v22, "domain");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, objc_msgSend(v22, "code"), v25);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v55[5], "setError:", v28);

      }
      else
      {
        objc_msgSend((id)v55[5], "setError:", v20);
      }

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v30 = v29;
    objc_msgSend((id)v55[5], "startTime");
    v32 = v31;
    v33 = objc_msgSend(a1[5], "countOfBytesSent");
    v34 = objc_msgSend(a1[5], "countOfBytesReceived");
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v36 = v35;
    objc_msgSend((id)v55[5], "startTime");
    v38 = v37;
    v39 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v41 = a1[4];
      v40 = a1[5];
      v42 = (void *)v55[5];
      v43 = objc_msgSend(v40, "countOfBytesSent");
      v44 = objc_msgSend(a1[5], "countOfBytesReceived");
      objc_msgSend((id)v55[5], "error");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138545154;
      v61 = v41;
      v62 = 2114;
      v63 = v40;
      v64 = 2114;
      v65 = v42;
      v66 = 2048;
      v67 = v43;
      v68 = 2048;
      v69 = v44;
      v70 = 2048;
      v71 = v30 - v32;
      v72 = 2048;
      v73 = (uint64_t)(((double)v33 + (double)v34) / (v36 - v38));
      v74 = 2114;
      v75 = v45;
      _os_log_impl(&dword_1A03E3000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ finished task %{public}@ for request %{public}@ [%lld sent, %lld rcvd in %.3fs (%lld bytes/s)]. err=%{public}@", buf, 0x52u);

    }
    objc_msgSend((id)v55[5], "loadURLMetricsRequestName");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)a1[4] + 6), "removeObject:", v55[5]);
    objc_msgSend(a1[4], "_finishRequest:", v55[5]);
    if (objc_msgSend((id)v55[5], "shouldReportLoadURLMetrics"))
    {
      v46 = a1[4];
      v47 = *((_QWORD *)v46 + 3);
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __53__ICURLSession_URLSession_task_didCompleteWithError___block_invoke_25;
      v48[3] = &unk_1E438B430;
      v48[4] = v46;
      v49 = a1[7];
      v50 = a1[5];
      v13 = v13;
      v51 = v13;
      v53 = &v54;
      v52 = a1[6];
      dispatch_async(v47, v48);

    }
  }
  else
  {
    v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = a1[4];
      v15 = a1[5];
      *(_DWORD *)buf = 138543618;
      v61 = v14;
      v62 = 2114;
      v63 = v15;
      _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ no request for completed task %{public}@ - ignoring", buf, 0x16u);
    }
  }

  _Block_object_dispose(&v54, 8);
}

void __73__ICURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_requestForTask:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_finishRequest:(id)a3
{
  id v4;
  NSObject *operationQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  ICURLSession *v9;

  v4 = a3;
  operationQueue = self->_operationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31__ICURLSession__finishRequest___block_invoke;
  v7[3] = &unk_1E4391110;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(operationQueue, v7);

}

- (void)enqueueUploadRequest:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "setType:", 2);
  objc_msgSend(v7, "setCompletionHandler:", v6);

  -[ICURLSession _enqueueRequest:](self, "_enqueueRequest:", v7);
}

- (void)enqueueDataRequest:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *operationQueue;
  _QWORD block[4];
  id v18;
  id v19;
  uint8_t buf[4];
  ICURLSession *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "urlRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9
    && (objc_msgSend(v9, "host"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "length"),
        v10,
        v11))
  {
    objc_msgSend(v6, "setType:", 0);
    objc_msgSend(v6, "setCompletionHandler:", v7);
    -[ICURLSession _enqueueRequest:](self, "_enqueueRequest:", v6);
  }
  else
  {
    v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v21 = self;
      v22 = 2114;
      v23 = v9;
      _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Enqueued data request with invalid url '%{public}@'", buf, 0x16u);
    }

    v13 = (void *)MEMORY[0x1E0D4D030];
    v14 = *MEMORY[0x1E0D4CE48];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Enqueued data request with invalid url '%@'"), v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v14, CFSTR("Bug"), CFSTR("ICURLSession"), v15, &stru_1E4391778, 0, 0);

    operationQueue = self->_operationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__ICURLSession_enqueueDataRequest_withCompletionHandler___block_invoke;
    block[3] = &unk_1E4390EF8;
    v19 = v7;
    v18 = v9;
    dispatch_async(operationQueue, block);

  }
}

void __31__ICURLSession__finishRequest___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  double v3;
  double v4;
  unint64_t v5;
  unint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  dispatch_time_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD block[5];
  id v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  double v34;
  __int16 v35;
  unint64_t v36;
  __int16 v37;
  unint64_t v38;
  __int16 v39;
  unint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 80);
  if ((unint64_t)(v2 - 1) > 1)
  {
LABEL_11:
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v18 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v18[2](v18, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

    objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", 0);
    goto LABEL_12;
  }
  v3 = 0.0;
  if (v2 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "retryDelay");
    v3 = v4;
  }
  v5 = objc_msgSend(*(id *)(a1 + 32), "_retryCountForReason:", *(_QWORD *)(a1 + 40));
  v6 = objc_msgSend(*(id *)(a1 + 32), "_maxRetryCountForReason:", *(_QWORD *)(a1 + 40));
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5 >= v6)
  {
    if (v8)
    {
      v16 = *(double *)(a1 + 40);
      v15 = *(_QWORD *)(a1 + 48);
      v17 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138544386;
      v30 = v15;
      v31 = 2114;
      v32 = v17;
      v33 = 2114;
      v34 = v16;
      v35 = 2048;
      v36 = v5;
      v37 = 2048;
      v38 = v6;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ rejecting retry for request %{public}@ (retryReason = %{public}@, retryCount = %lu, maxRetryCount = %lu)", buf, 0x34u);
    }

    goto LABEL_11;
  }
  if (v8)
  {
    v10 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138544642;
    v30 = v9;
    v31 = 2114;
    v32 = v11;
    v33 = 2048;
    v34 = v3;
    v35 = 2114;
    v36 = v10;
    v37 = 2048;
    v38 = v5;
    v39 = 2048;
    v40 = v6;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ retrying request %{public}@ in %f seconds (retryReason = %{public}@, retryCount = %lu, maxRetryCount = %lu)", buf, 0x3Eu);
  }

  v12 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  v13 = *(_QWORD *)(a1 + 48);
  v14 = *(NSObject **)(v13 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__ICURLSession__finishRequest___block_invoke_55;
  block[3] = &unk_1E4391230;
  block[4] = v13;
  v27 = *(id *)(a1 + 32);
  v28 = *(id *)(a1 + 40);
  dispatch_after(v12, v14, block);

LABEL_12:
  objc_msgSend(*(id *)(a1 + 48), "_processPendingRequests");
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isInternalBuild");

  if (v20)
  {
    +[ICHTTPArchive sharedArchive](ICHTTPArchive, "sharedArchive");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 56), "urlResponse");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "bodyData");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "performanceMetrics");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "archiveRequest:withResponse:responseData:performanceMetrics:", v22, v23, v24, v25);

  }
}

- (void)_enqueueRequest:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *accessQueue;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  ICURLSession *v17;
  id v18;
  uint8_t buf[4];
  ICURLSession *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICURLSession.m"), 541, CFSTR("_enqueue request called with nil request"));

  }
  v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    +[ICURLRequest _nameForRequestType:](ICURLRequest, "_nameForRequestType:", objc_msgSend(v5, "type"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "urlRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v20 = self;
    v21 = 2114;
    v22 = v7;
    v23 = 2114;
    v24 = v5;
    v25 = 2114;
    v26 = v9;
    _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ enqueueing new %{public}@ request %{public}@ with url %{public}@", buf, 0x2Au);

  }
  objc_msgSend(v5, "updateState:", 0);
  accessQueue = self->_accessQueue;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __32__ICURLSession__enqueueRequest___block_invoke;
  v16 = &unk_1E4391110;
  v17 = self;
  v18 = v5;
  v11 = v5;
  dispatch_sync(accessQueue, &v13);
  -[ICURLSession _processPendingRequests](self, "_processPendingRequests", v13, v14, v15, v16, v17);

}

- (void)_processPendingRequests
{
  NSObject *accessQueue;
  _QWORD block[7];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;
  _QWORD v9[5];
  id v10;

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__9438;
  v9[4] = __Block_byref_object_dispose__9439;
  v10 = 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__ICURLSession__processPendingRequests__block_invoke;
  block[3] = &unk_1E4390C10;
  block[4] = self;
  block[5] = v9;
  block[6] = &v5;
  dispatch_sync(accessQueue, block);
  if (*((_BYTE *)v6 + 24))
    -[ICURLSession _processPendingRequests](self, "_processPendingRequests");
  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(v9, 8);

}

void __32__ICURLSession__processRequest___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 16);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __32__ICURLSession__processRequest___block_invoke_3;
  v12[3] = &unk_1E43912A8;
  v13 = v6;
  v14 = v5;
  v15 = v7;
  v16 = v8;
  v10 = v5;
  v11 = v6;
  dispatch_async(v9, v12);

}

void __31__ICURLSession__finishRequest___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  v7 = a3;
  v8 = a4;
  v9 = *(void **)(a1 + 40);
  v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__ICURLSession__finishRequest___block_invoke_3;
  block[3] = &unk_1E438B520;
  v20 = a2;
  v14 = v9;
  v15 = v7;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(id *)(a1 + 48);
  v18 = v8;
  v19 = *(id *)(a1 + 56);
  v11 = v8;
  v12 = v7;
  dispatch_async(v10, block);

}

- (ICURLSession)initWithConfiguration:(id)a3 maxConcurrentRequests:(unint64_t)a4 qualityOfService:(int64_t)a5
{
  id v8;
  ICURLSession *v9;
  ICURLSession *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *accessQueue;
  NSObject *v13;
  id v14;
  unint64_t v15;
  dispatch_qos_class_t v16;
  void *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *operationQueue;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *utilityQueue;
  NSMutableOrderedSet *v23;
  NSMutableOrderedSet *pendingRequests;
  NSMutableSet *v25;
  NSMutableSet *activeRequests;
  dispatch_source_t v27;
  OS_dispatch_source *requestTimeoutTimer;
  NSObject *v29;
  double v30;
  uint64_t v31;
  NSURLSession *urlSession;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t);
  void *v37;
  id v38;
  id location;
  objc_super v40;

  v8 = a3;
  v40.receiver = self;
  v40.super_class = (Class)ICURLSession;
  v9 = -[ICURLSession init](&v40, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_maxConcurrentRequests = a4;
    v11 = dispatch_queue_create("com.apple.iTunesCloud.ICURLSession.access", 0);
    accessQueue = v10->_accessQueue;
    v10->_accessQueue = (OS_dispatch_queue *)v11;

    v13 = MEMORY[0x1E0C80D50];
    v14 = MEMORY[0x1E0C80D50];
    if (a5 != -1)
    {
      v15 = __ROR8__(a5 - 9, 3);
      if (v15 >= 4)
        v16 = QOS_CLASS_UNSPECIFIED;
      else
        v16 = 8 * v15 + 9;
      v17 = (void *)MEMORY[0x1E0C80D50];
      dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], v16, 0);
      v13 = objc_claimAutoreleasedReturnValue();

    }
    v18 = dispatch_queue_create("com.apple.iTunesCloud.ICURLSession.operation", v13);
    operationQueue = v10->_operationQueue;
    v10->_operationQueue = (OS_dispatch_queue *)v18;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = dispatch_queue_create("com.apple.iTunesCloud.ICURLSession.utility", v20);
    utilityQueue = v10->_utilityQueue;
    v10->_utilityQueue = (OS_dispatch_queue *)v21;

    v23 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    pendingRequests = v10->_pendingRequests;
    v10->_pendingRequests = v23;

    v25 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    activeRequests = v10->_activeRequests;
    v10->_activeRequests = v25;

    v10->_paused = 0;
    v27 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v10->_accessQueue);
    requestTimeoutTimer = v10->_requestTimeoutTimer;
    v10->_requestTimeoutTimer = (OS_dispatch_source *)v27;

    objc_initWeak(&location, v10);
    v29 = v10->_requestTimeoutTimer;
    v34 = MEMORY[0x1E0C809B0];
    v35 = 3221225472;
    v36 = __77__ICURLSession_initWithConfiguration_maxConcurrentRequests_qualityOfService___block_invoke;
    v37 = &unk_1E4391400;
    objc_copyWeak(&v38, &location);
    dispatch_source_set_event_handler(v29, &v34);
    dispatch_source_set_timer((dispatch_source_t)v10->_requestTimeoutTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
    dispatch_resume((dispatch_object_t)v10->_requestTimeoutTimer);
    objc_msgSend(v8, "timeoutIntervalForRequest", v34, v35, v36, v37);
    if (v30 == 0.0)
      objc_msgSend(v8, "setTimeoutIntervalForRequest:", 120.0);
    objc_msgSend(v8, "set_timingDataOptions:", 5);
    -[ICURLSession _createURLSessionWithConfiguration:](v10, "_createURLSessionWithConfiguration:", v8);
    v31 = objc_claimAutoreleasedReturnValue();
    urlSession = v10->_urlSession;
    v10->_urlSession = (NSURLSession *)v31;

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);

  }
  return v10;
}

- (id)_createURLSessionWithConfiguration:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C92C98], "sessionWithConfiguration:delegate:delegateQueue:", a3, self, 0);
}

+ (unint64_t)defaultMaximumConcurrentRequests
{
  return 3;
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v7;
  id v8;
  NSObject *accessQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__ICURLSession_URLSession_dataTask_didReceiveData___block_invoke;
  block[3] = &unk_1E4391230;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_sync(accessQueue, block);

}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v7;
  id v8;
  NSObject *accessQueue;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  ICURLSession *v14;
  id v15;

  v7 = a4;
  v8 = a5;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__ICURLSession_URLSession_task_didFinishCollectingMetrics___block_invoke;
  block[3] = &unk_1E4391230;
  v13 = v8;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_sync(accessQueue, block);

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *accessQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__ICURLSession_URLSession_task_didCompleteWithError___block_invoke;
  block[3] = &unk_1E43912A8;
  block[4] = self;
  v16 = v9;
  v17 = v10;
  v18 = v8;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_sync(accessQueue, block);

}

- (ICURLSession)init
{
  void *v3;
  ICURLSession *v4;

  objc_msgSend(MEMORY[0x1E0C92CA0], "ephemeralSessionConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ICURLSession initWithConfiguration:](self, "initWithConfiguration:", v3);

  return v4;
}

- (ICURLSession)initWithConfiguration:(id)a3
{
  return -[ICURLSession initWithConfiguration:maxConcurrentRequests:](self, "initWithConfiguration:maxConcurrentRequests:", a3, 3);
}

- (ICURLSession)initWithConfiguration:(id)a3 maxConcurrentRequests:(unint64_t)a4
{
  return -[ICURLSession initWithConfiguration:maxConcurrentRequests:qualityOfService:](self, "initWithConfiguration:maxConcurrentRequests:qualityOfService:", a3, a4, -1);
}

- (void)dealloc
{
  NSObject *requestTimeoutTimer;
  objc_super v4;

  requestTimeoutTimer = self->_requestTimeoutTimer;
  if (requestTimeoutTimer)
    dispatch_source_cancel(requestTimeoutTimer);
  v4.receiver = self;
  v4.super_class = (Class)ICURLSession;
  -[ICURLSession dealloc](&v4, sel_dealloc);
}

- (void)enqueueDownloadRequest:(id)a3 withCompletionHandler:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = (void *)MEMORY[0x1E0C99E98];
  v7 = a4;
  v8 = a3;
  NSTemporaryDirectory();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("tmp.%@"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURLWithPath:", v14);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[ICURLSession enqueueDownloadRequest:toDestination:withCompletionHandler:](self, "enqueueDownloadRequest:toDestination:withCompletionHandler:", v8, v15, v7);
}

- (void)enqueueDownloadRequest:(id)a3 toDestination:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v12 = a3;
  objc_msgSend(v12, "resumeData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = 4;
  else
    v11 = 1;
  objc_msgSend(v12, "setType:", v11);

  objc_msgSend(v12, "setCompletionHandler:", v8);
  objc_msgSend(v12, "setResponseDataURL:", v9);

  -[ICURLSession _enqueueRequest:](self, "_enqueueRequest:", v12);
}

- (void)pauseRequest:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__ICURLSession_pauseRequest___block_invoke;
  block[3] = &unk_1E4391110;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(accessQueue, block);
  -[ICURLSession _processPendingRequests](self, "_processPendingRequests");

}

- (void)resumeRequest:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__ICURLSession_resumeRequest___block_invoke;
  block[3] = &unk_1E4391110;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(accessQueue, block);

}

- (void)cancelRequest:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB35C8];
  v5 = a3;
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7004, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ICURLSession cancelRequest:withError:](self, "cancelRequest:withError:", v5, v6);

}

- (void)cancelRequest:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__ICURLSession_cancelRequest_withError___block_invoke;
  block[3] = &unk_1E4391230;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(accessQueue, block);

}

- (void)cancelPendingRequestsWithError:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__ICURLSession_cancelPendingRequestsWithError___block_invoke;
  v7[3] = &unk_1E4391110;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

- (void)pause
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__ICURLSession_pause__block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (void)resume
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__ICURLSession_resume__block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_sync(accessQueue, block);
  -[ICURLSession _processPendingRequests](self, "_processPendingRequests");
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, uint64_t, void *);
  NSObject *accessQueue;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  _QWORD block[5];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, uint64_t, void *))a6;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__9438;
  v30 = __Block_byref_object_dispose__9439;
  v31 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__ICURLSession_URLSession_task_didReceiveChallenge_completionHandler___block_invoke;
  block[3] = &unk_1E43907D8;
  v25 = &v26;
  block[4] = self;
  v15 = v11;
  v24 = v15;
  dispatch_sync(accessQueue, block);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend((id)v27[5], "setLastUpdateTime:");
  objc_msgSend(v12, "protectionSpace");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "authenticationMethod");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0C92B30]))
  {
    if (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0C92B70]))
    {
      +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v18, "isInternalBuild"))
      {
        v19 = 1;
        goto LABEL_3;
      }
      +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "ignoreExtendedCertificateValidation");

      if (v22)
      {
        objc_msgSend(MEMORY[0x1E0C92C60], "credentialForTrust:", objc_msgSend(v16, "serverTrust"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 0;
        goto LABEL_9;
      }
    }
    v20 = 0;
    v19 = 1;
    goto LABEL_9;
  }
  objc_msgSend(v12, "sender");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_respondsToSelector() & 1;
LABEL_3:

  v20 = 0;
LABEL_9:
  v13[2](v13, v19, v20);

  _Block_object_dispose(&v26, 8);
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *accessQueue;
  uint64_t v16;
  id v17;
  NSObject *operationQueue;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD *v28;
  _QWORD block[5];
  id v30;
  _QWORD *v31;
  _QWORD v32[5];
  id v33;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__9438;
  v32[4] = __Block_byref_object_dispose__9439;
  v33 = 0;
  accessQueue = self->_accessQueue;
  v16 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__ICURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke;
  block[3] = &unk_1E43907D8;
  v31 = v32;
  block[4] = self;
  v17 = v11;
  v30 = v17;
  dispatch_sync(accessQueue, block);
  operationQueue = self->_operationQueue;
  v23[0] = v16;
  v23[1] = 3221225472;
  v23[2] = __88__ICURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2;
  v23[3] = &unk_1E438B4D0;
  v27 = v14;
  v28 = v32;
  v23[4] = self;
  v24 = v12;
  v25 = v13;
  v26 = v17;
  v19 = v17;
  v20 = v13;
  v21 = v12;
  v22 = v14;
  dispatch_async(operationQueue, v23);

  _Block_object_dispose(v32, 8);
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  -[ICURLSession _updateProgressForSessionTask:withTotalBytesWritten:totalBytesExpectedToWrite:](self, "_updateProgressForSessionTask:withTotalBytesWritten:totalBytesExpectedToWrite:", a4, a6, a7);
}

- (void)URLSession:(id)a3 avAssetDownloadTask:(id)a4 didReceiveAVAssetDownloadToken:(unint64_t)a5
{
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD block[5];
  id v10;

  v6 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__ICURLSession_URLSession_avAssetDownloadTask_didReceiveAVAssetDownloadToken___block_invoke;
  block[3] = &unk_1E4391110;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_sync(accessQueue, block);

}

- (void)URLSession:(id)a3 avAssetDownloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  -[ICURLSession _updateProgressForSessionTask:withTotalBytesWritten:totalBytesExpectedToWrite:](self, "_updateProgressForSessionTask:withTotalBytesWritten:totalBytesExpectedToWrite:", a4, a6, a7);
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v7;
  id v8;
  NSObject *accessQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__ICURLSession_URLSession_downloadTask_didFinishDownloadingToURL___block_invoke;
  block[3] = &unk_1E4391230;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_sync(accessQueue, block);

}

- (void)_checkRequestTimeouts
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__ICURLSession__checkRequestTimeouts__block_invoke;
  block[3] = &unk_1E43913D8;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)_updateProgressForSessionTask:(id)a3 withTotalBytesWritten:(int64_t)a4 totalBytesExpectedToWrite:(int64_t)a5
{
  id v8;
  NSObject *accessQueue;
  id v10;
  _QWORD block[5];
  id v12;
  int64_t v13;
  int64_t v14;

  v8 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__ICURLSession__updateProgressForSessionTask_withTotalBytesWritten_totalBytesExpectedToWrite___block_invoke;
  block[3] = &unk_1E438B570;
  block[4] = self;
  v12 = v8;
  v13 = a5;
  v14 = a4;
  v10 = v8;
  dispatch_sync(accessQueue, block);

}

- (void)_reportLoadURLMetricsWithSession:(id)a3 task:(id)a4 signatureName:(id)a5 request:(id)a6 error:(id)a7
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  ICURLSession *v19;
  __CFString *v20;

  v9 = a5;
  v10 = a6;
  objc_msgSend(v10, "aggregatedPerformanceMetrics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "urlMetrics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __82__ICURLSession__reportLoadURLMetricsWithSession_task_signatureName_request_error___block_invoke;
    v15[3] = &unk_1E438B598;
    v16 = v13;
    v17 = v9;
    v18 = v10;
    v19 = self;
    v20 = CFSTR("com.apple.amp.itunescloud.LoadURL");
    v14 = (void *)MEMORY[0x1A1AFA8D0](v15);
    AnalyticsSendEventLazy();

  }
}

- (unint64_t)maxConcurrentRequests
{
  return self->_maxConcurrentRequests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_requestTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_activeRequests, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_utilityQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

id __82__ICURLSession__reportLoadURLMetricsWithSession_task_signatureName_request_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  double v68;
  double v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  NSObject *v75;
  uint64_t v76;
  uint64_t v77;
  int v79;
  uint64_t v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  void *v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICClientInfo defaultInfo](ICClientInfo, "defaultInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("app"));

  objc_msgSend(v3, "clientVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("appVersion"));

  objc_msgSend(*(id *)(a1 + 32), "appleTimingApp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(" "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  if (v9 >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, CFSTR("appleTimingApp"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "cachedResponse"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, CFSTR("cachedResponse"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "connectionReused"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, CFSTR("connectionReused"));

  objc_msgSend(*(id *)(a1 + 32), "connectionType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, CFSTR("connectionType"));

  +[ICEnvironmentMonitor sharedMonitor](ICEnvironmentMonitor, "sharedMonitor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "networkType");

  if (v15 > 499)
  {
    v17 = CFSTR("Ethernet");
    v18 = CFSTR("Other");
    if (v15 != 3000)
      v18 = 0;
    if (v15 != 2000)
      v17 = v18;
    v19 = CFSTR("Bluetooth");
    if (v15 != 500)
      v19 = 0;
    if ((unint64_t)(v15 - 1000) >= 2)
      v20 = v19;
    else
      v20 = CFSTR("WiFi");
    if (v15 <= 1999)
      v16 = v20;
    else
      v16 = v17;
  }
  else if ((unint64_t)(v15 - 1) < 8 || v15 == 100)
  {
    v16 = CFSTR("Cellular");
  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v16, CFSTR("radioType"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "redirectCount"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v21, CFSTR("redirectCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "requestBytesSent"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v22, CFSTR("requestMessageSize"));

  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("requestSignature"));
  objc_msgSend(*(id *)(a1 + 48), "urlRequest");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "URL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICURLSession _sanitizeURL:](ICURLSession, "_sanitizeURL:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v25, CFSTR("requestUrl"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "responseBytesReceived"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v26, CFSTR("responseMessageSize"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "responseMessageSize"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v27, CFSTR("responseMessageSizeUncompressed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "statusCode"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v28, CFSTR("statusCode"));

  v29 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "dnsTime");
  objc_msgSend(v29, "numberWithDouble:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v30, CFSTR("domainLookupTime"));

  v31 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "connectionTime");
  objc_msgSend(v31, "numberWithDouble:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v32, CFSTR("connectionTime"));

  v33 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "responseTime");
  objc_msgSend(v33, "numberWithDouble:");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v34, CFSTR("responseTime"));

  v35 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "totalTime");
  objc_msgSend(v35, "numberWithDouble:");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v36, CFSTR("totalTime"));

  objc_msgSend(*(id *)(a1 + 32), "fetchStartTime");
  if (v37 != 0.0)
  {
    objc_msgSend(*(id *)(a1 + 32), "domainLookupStartTime");
    if (v38 != 0.0)
    {
      v39 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(a1 + 32), "domainLookupStartTime");
      v41 = v40;
      objc_msgSend(*(id *)(a1 + 32), "fetchStartTime");
      objc_msgSend(v39, "numberWithDouble:", v41 - v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v43, CFSTR("domainLookupStartTime"));

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "fetchStartTime");
  if (v44 != 0.0)
  {
    objc_msgSend(*(id *)(a1 + 32), "connectionStartTime");
    if (v45 != 0.0)
    {
      v46 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(a1 + 32), "connectionStartTime");
      v48 = v47;
      objc_msgSend(*(id *)(a1 + 32), "fetchStartTime");
      objc_msgSend(v46, "numberWithDouble:", v48 - v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v50, CFSTR("connectionStartTime"));

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "connectionStartTime");
  if (v51 != 0.0)
  {
    objc_msgSend(*(id *)(a1 + 32), "secureConnectionStartTime");
    if (v52 != 0.0)
    {
      v53 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(a1 + 32), "secureConnectionStartTime");
      v55 = v54;
      objc_msgSend(*(id *)(a1 + 32), "connectionStartTime");
      objc_msgSend(v53, "numberWithDouble:", v55 - v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v57, CFSTR("secureConnectionStartTime"));

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "connectionEndTime");
  if (v58 != 0.0)
  {
    objc_msgSend(*(id *)(a1 + 32), "requestStartTime");
    if (v59 != 0.0)
    {
      objc_msgSend(*(id *)(a1 + 32), "requestStartTime");
      v61 = v60;
      objc_msgSend(*(id *)(a1 + 32), "connectionEndTime");
      if (v61 > v62)
      {
        v63 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(a1 + 32), "requestStartTime");
        v65 = v64;
        objc_msgSend(*(id *)(a1 + 32), "connectionEndTime");
        objc_msgSend(v63, "numberWithDouble:", v65 - v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v67, CFSTR("requestStartTime"));

      }
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "requestStartTime");
  if (v68 != 0.0)
  {
    objc_msgSend(*(id *)(a1 + 32), "responseStartTime");
    if (v69 != 0.0)
    {
      v70 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(a1 + 32), "responseStartTime");
      v72 = v71;
      objc_msgSend(*(id *)(a1 + 32), "requestStartTime");
      objc_msgSend(v70, "numberWithDouble:", v72 - v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v74, CFSTR("responseStartTime"));

    }
  }
  if (MSVDeviceOSIsInternalInstall())
  {
    v75 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      v76 = *(_QWORD *)(a1 + 56);
      v77 = *(_QWORD *)(a1 + 64);
      v79 = 138543874;
      v80 = v76;
      v81 = 2114;
      v82 = v77;
      v83 = 2112;
      v84 = v2;
      _os_log_impl(&dword_1A03E3000, v75, OS_LOG_TYPE_DEFAULT, "%{public}@ Logging CoreAnalytics %{public}@ event: %@", (uint8_t *)&v79, 0x20u);
    }

  }
  return v2;
}

void __94__ICURLSession__updateProgressForSessionTask_withTotalBytesWritten_totalBytesExpectedToWrite___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "_requestForTask:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v11 = v2;
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v4 = v3;
    if (*(uint64_t *)(a1 + 48) >= 1)
    {
      objc_msgSend(v11, "progress");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "totalUnitCount");
      v7 = *(_QWORD *)(a1 + 48) + 1;

      if (v6 != v7)
      {
        objc_msgSend(v11, "progress");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setTotalUnitCount:", *(_QWORD *)(a1 + 48) + 1);

      }
      objc_msgSend(v11, "lastProgressUpdateTime");
      if (v4 - v9 > 0.5)
      {
        objc_msgSend(v11, "progress");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setCompletedUnitCount:", *(_QWORD *)(a1 + 56) + 1);

        objc_msgSend(v11, "setLastProgressUpdateTime:", v4);
      }
    }
    objc_msgSend(v11, "setLastUpdateTime:", v4);
    v2 = v11;
  }

}

void __37__ICURLSession__checkRequestTimeouts__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v29 = v3;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Checking for timeouts", buf, 0xCu);
  }

  v4 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v6)
  {
    v8 = v6;
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v25;
    *(_QWORD *)&v7 = 138543618;
    v23 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v5);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v13, "requestState", v23, (_QWORD)v24) != 2)
        {
          objc_msgSend(*(id *)(a1 + 32), "_timeoutForRequest:", v13);
          if (v14 == 0.0
            || (v15 = v14,
                objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate"),
                v17 = v16,
                objc_msgSend(v13, "lastUpdateTime"),
                v17 <= v15 + v18))
          {
            v9 = 1;
          }
          else
          {
            v19 = os_log_create("com.apple.amp.iTunesCloud", "Default");
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              v20 = *(_QWORD *)(a1 + 32);
              *(_DWORD *)buf = v23;
              v29 = v20;
              v30 = 2114;
              v31 = v13;
              _os_log_impl(&dword_1A03E3000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ timing out request %{public}@", buf, 0x16u);
            }

            v21 = *(void **)(a1 + 32);
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7003, 0);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "cancelRequest:withError:", v13, v22);

            v9 = 1;
            v10 = 1;
          }
        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v8);

    if (!(v10 & 1 | ((v9 & 1) == 0)))
      objc_msgSend(*(id *)(a1 + 32), "_scheduleNextRequestTimeoutCheck");
  }
  else
  {

  }
}

void __31__ICURLSession__finishRequest___block_invoke_55(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD block[4];
  id v7;
  id v8;
  uint64_t v9;

  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__ICURLSession__finishRequest___block_invoke_2_56;
  block[3] = &unk_1E4391230;
  v7 = v2;
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v9 = v5;
  dispatch_sync(v3, block);
  objc_msgSend(*(id *)(a1 + 32), "_processPendingRequests");

}

uint64_t __31__ICURLSession__finishRequest___block_invoke_2_56(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "setError:", 0);
  objc_msgSend(*(id *)(a1 + 32), "task");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

  objc_msgSend(*(id *)(a1 + 32), "setTask:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setCurrentURLRequest:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setHandlingType:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setRetryReason:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_incrementRetryCountForReason:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "updateState:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 40), "addObject:", *(_QWORD *)(a1 + 32));
}

uint64_t __32__ICURLSession__processRequest___block_invoke_53(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", *(_QWORD *)(a1 + 40));
}

void __39__ICURLSession__processPendingRequests__block_invoke_52(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    v6 = a1[6];
    v5 = a1[7];
    v7 = 138544130;
    v8 = v3;
    v9 = 2048;
    v10 = v5;
    v11 = 2114;
    v12 = v4;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Request queue state for counter = %lu: _activeRequests = %{public}@, _pendingRequests = %{public}@", (uint8_t *)&v7, 0x2Au);
  }

}

void __66__ICURLSession_URLSession_downloadTask_didFinishDownloadingToURL___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_requestForTask:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      v28 = v4;
      v29 = 2114;
      v30 = v2;
      v31 = 2114;
      v32 = v5;
      _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%@ %{public}@ download task finished. location=%{public}@", buf, 0x20u);
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(v2, "setLastUpdateTime:");
    objc_msgSend(*(id *)(a1 + 40), "response");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "statusCode");
    objc_msgSend(*(id *)(a1 + 40), "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 || v7 < 300)
    {
      objc_msgSend(v2, "responseDataURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9 && !*(_QWORD *)(a1 + 48))
      {
        v9 = 0;
        goto LABEL_17;
      }
      v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(a1 + 32);
        v15 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v2, "responseDataURL");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v28 = v14;
        v29 = 2114;
        v30 = v2;
        v31 = 2114;
        v32 = v15;
        v33 = 2114;
        v34 = v16;
        _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_DEFAULT, "%@ %{public}@ moving download file %{public}@ --> %{public}@", buf, 0x2Au);

      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v2, "responseDataURL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0;
      v20 = objc_msgSend(v17, "moveItemAtURL:toURL:error:", v18, v19, &v26);
      v11 = v26;

      if ((v20 & 1) == 0)
      {
        v21 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v22 = *(_QWORD *)(a1 + 32);
          v23 = *(_QWORD *)(a1 + 48);
          objc_msgSend(v2, "responseDataURL");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          v28 = v22;
          v29 = 2114;
          v30 = v2;
          v31 = 2114;
          v32 = v23;
          v33 = 2114;
          v34 = v24;
          v35 = 2114;
          v36 = v11;
          _os_log_impl(&dword_1A03E3000, v21, OS_LOG_TYPE_ERROR, "%@ %{public}@ failed to move download file from %{public}@ --> %{public}@. err=%{public}@", buf, 0x34u);

        }
        objc_msgSend(v2, "error");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25)
          objc_msgSend(v2, "setError:", v11);
      }
    }
    else
    {
      objc_msgSend(v2, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0CB35C8];
      ICURLResponseStatusCodeGetExtendedDescription(v7);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICError"), -7004, v9, CFSTR("Download request received HTTP status code %@"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setError:", v12);

    }
LABEL_17:

  }
}

void __78__ICURLSession_URLSession_avAssetDownloadTask_didReceiveAVAssetDownloadToken___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_requestForTask:", *(_QWORD *)(a1 + 40));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(v1, "setLastUpdateTime:");
  }

}

void __73__ICURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_38(uint64_t a1, int a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void (*v16)(void);
  id v17;

  v17 = a4;
  v9 = a5;
  if (!v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "urlResponse");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "expectedContentLength");

    if (v11 >= 1)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "progress");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTotalUnitCount:", v11 + 1);

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "progress");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setCompletedUnitCount:", 1);

    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setHandlingType:", a3);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setRetryReason:", v17);
  objc_msgSend(*(id *)(a1 + 40), "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "_ignoreDidReceiveResponseDisposition");

  if (v15)
  {
    if (a2)
      objc_msgSend(*(id *)(a1 + 48), "cancel");
    v16 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  else
  {
    v16 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  v16();

}

void __88__ICURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_requestForTask:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __88__ICURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (*v9)(void);
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  uint64_t v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  void *v43;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138543618;
      v39 = v11;
      v40 = 2114;
      v41 = v12;
      v13 = "%{public}@ no request for redirected task %{public}@ - ignoring";
      v14 = v10;
      v15 = 22;
LABEL_15:
      _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
    }
LABEL_16:

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
LABEL_17:
    v9();
    return;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setLastUpdateTime:");
  if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "redirectCount") >= 0x14)
  {
    v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      v39 = v3;
      v40 = 2114;
      v41 = v4;
      _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ exceeded the redirect limit - aborting", buf, 0x16u);
    }

    v5 = (void *)MEMORY[0x1E0CB35C8];
    v44 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Too many redirects (%d)"), objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "redirectCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7102, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setError:", v8);

    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    goto LABEL_17;
  }
  if (!*(_QWORD *)(a1 + 40) || !*(_QWORD *)(a1 + 48))
  {
    v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v32 = *(_QWORD *)(a1 + 32);
      v33 = *(_QWORD *)(a1 + 40);
      v34 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v39 = v32;
      v40 = 2114;
      v41 = v33;
      v42 = 2114;
      v43 = v34;
      v13 = "%{public}@ either response %{public}@ or new request %{public}@ is invalid - ignoring";
      v14 = v10;
      v15 = 32;
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 48), "URL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v39 = v17;
    v40 = 2114;
    v41 = v18;
    v42 = 2114;
    v43 = v19;
    _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ handling redirect response --> %{public}@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "currentURLRequest");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 48), "URL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setURL:", v22);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setCurrentURLRequest:", v21);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setRedirectCount:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "redirectCount") + 1);
  v23 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_responseClass"));
  v24 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "aggregatedPerformanceMetrics");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v23, "initWithURLResponse:urlRequest:bodyData:performanceMetrics:", v24, v20, 0, v25);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "responseHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = *(void **)(a1 + 64);
  v28 = *(_QWORD *)(a1 + 72);
  v30 = *(_QWORD *)(v28 + 8);
  v35[0] = MEMORY[0x1E0C809B0];
  v35[2] = __88__ICURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_33;
  v35[3] = &unk_1E438B480;
  v31 = *(_QWORD *)(v30 + 40);
  v35[1] = 3221225472;
  v35[4] = *(_QWORD *)(a1 + 32);
  v37 = v28;
  v36 = v29;
  objc_msgSend(v27, "processInitialResponse:toRequest:withCompletionHandler:", v26, v31, v35);

}

void __88__ICURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_33(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  __int128 v15;

  v6 = a5;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__ICURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2_34;
  block[3] = &unk_1E43909E8;
  v13 = v6;
  v14 = v7;
  v11 = *(_OWORD *)(a1 + 40);
  v9 = (id)v11;
  v15 = v11;
  v10 = v6;
  dispatch_async(v8, block);

}

void __88__ICURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2_34(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
      v5 = a1[4];
      v4 = a1[5];
      *(_DWORD *)buf = 138543874;
      v13 = v4;
      v14 = 2114;
      v15 = v3;
      v16 = 2114;
      v17 = v5;
      _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ Failed to process redirect response. err=%{public}@", buf, 0x20u);
    }

    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    v7 = (void *)a1[6];
    v6 = a1[7];
    v8 = *(void **)(*(_QWORD *)(v6 + 8) + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __88__ICURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_35;
    v9[3] = &unk_1E438B458;
    v11 = v6;
    v10 = v7;
    objc_msgSend(v8, "buildURLRequestWithCompletionHandler:", v9);

  }
}

void __88__ICURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_35(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setCurrentURLRequest:");
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

void __70__ICURLSession_URLSession_task_didReceiveChallenge_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_requestForTask:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __53__ICURLSession_URLSession_task_didCompleteWithError___block_invoke_25(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reportLoadURLMetricsWithSession:task:signatureName:request:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 64));
}

void __22__ICURLSession_resume__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 64))
  {
    v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v17 = v3;
      _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Resuming...", buf, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 0;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if (objc_msgSend(v9, "requestState", (_QWORD)v11) == 2)
          {
            objc_msgSend(v9, "task");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "resume");

            objc_msgSend(v9, "setRequestState:", 1);
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
}

void __21__ICURLSession_pause__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 64))
  {
    v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v17 = v3;
      _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Pausing...", buf, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 1;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if ((objc_msgSend(v9, "prioritize", (_QWORD)v11) & 1) == 0 && objc_msgSend(v9, "requestState") != 2)
          {
            objc_msgSend(v9, "task");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "suspend");

            objc_msgSend(v9, "setRequestState:", 2);
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
}

void __47__ICURLSession_cancelPendingRequestsWithError___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count"))
  {
    v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllObjects");
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            v10 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138543618;
            v16 = v10;
            v17 = 2114;
            v18 = v8;
            _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ cancelling request...", buf, 0x16u);
          }

          objc_msgSend(v8, "setHandlingType:", 0);
          objc_msgSend(v8, "setRetryReason:", 0);
          objc_msgSend(v8, "setMaxRetryCount:", 0);
          objc_msgSend(v8, "setError:", *(_QWORD *)(a1 + 40));
          objc_msgSend(*(id *)(a1 + 32), "_finishRequest:", v8);
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
      }
      while (v5);
    }

  }
}

void __40__ICURLSession_cancelRequest_withError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v9 = 138543618;
    v10 = v3;
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ cancelling request...", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "setHandlingType:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setRetryReason:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setMaxRetryCount:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setError:", *(_QWORD *)(a1 + 48));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 40), "task");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancel");

  }
  else if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_finishRequest:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138543618;
      v10 = v7;
      v11 = 2114;
      v12 = v8;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ failed to cancel request because it could not be found", (uint8_t *)&v9, 0x16u);
    }

  }
}

uint64_t __30__ICURLSession_resumeRequest___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t result;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v9 = 138543618;
    v10 = v3;
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ resuming request...", (uint8_t *)&v9, 0x16u);
  }

  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "containsObject:", *(_QWORD *)(a1 + 40));
  v6 = *(void **)(a1 + 40);
  if (v5)
  {
    result = objc_msgSend(v6, "requestState");
    if (result == 2)
    {
      objc_msgSend(*(id *)(a1 + 40), "task");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "resume");

      return objc_msgSend(*(id *)(a1 + 40), "setRequestState:", 1);
    }
  }
  else
  {
    objc_msgSend(v6, "setRequestState:", 0);
    return objc_msgSend(*(id *)(a1 + 32), "_processPendingRequests");
  }
  return result;
}

uint64_t __29__ICURLSession_pauseRequest___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v7 = 138543618;
    v8 = v3;
    v9 = 2114;
    v10 = v4;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ pausing request...", (uint8_t *)&v7, 0x16u);
  }

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "containsObject:", *(_QWORD *)(a1 + 40))
    && objc_msgSend(*(id *)(a1 + 40), "requestState") != 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "task");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "suspend");

  }
  return objc_msgSend(*(id *)(a1 + 40), "setRequestState:", 2);
}

void __57__ICURLSession_enqueueDataRequest_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICError"), -7101, 0, CFSTR("Enqueued data request with invalid url '%@'"), *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __77__ICURLSession_initWithConfiguration_maxConcurrentRequests_qualityOfService___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_checkRequestTimeouts");
    WeakRetained = v2;
  }

}

+ (id)_sanitizeURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a3, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setFragment:", 0);
    objc_msgSend(v3, "queryItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "msv_filter:", &__block_literal_global_9511);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setQueryItems:", v5);

    objc_msgSend(v3, "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

uint64_t __29__ICURLSession__sanitizeURL___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("guid")))
  {
    objc_msgSend(v2, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("id")) ^ 1;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

@end
