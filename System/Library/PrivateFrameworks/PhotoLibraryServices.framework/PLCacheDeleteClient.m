@implementation PLCacheDeleteClient

- (PLCacheDeleteClient)initWithQoSClass:(unsigned int)a3 pathForVolume:(id)a4 callbackQueue:(id)a5
{
  id v10;
  id v11;
  void *v12;
  PLCacheDeleteClient *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *cacheDeleteQueryQueue;
  NSByteCountFormatter *v17;
  NSByteCountFormatter *byteFormatter;
  void *v20;
  void *v21;
  objc_super v22;

  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLCacheDeleteClient.m"), 110, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathForVolume"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLCacheDeleteClient.m"), 111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("callbackQueue"));

LABEL_3:
  v22.receiver = self;
  v22.super_class = (Class)PLCacheDeleteClient;
  v13 = -[PLCacheDeleteClient init](&v22, sel_init);
  if (v13)
  {
    dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)a3, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.photos.CacheDeleteRequest", v14);
    cacheDeleteQueryQueue = v13->_cacheDeleteQueryQueue;
    v13->_cacheDeleteQueryQueue = (OS_dispatch_queue *)v15;

    objc_storeStrong((id *)&v13->_pathForVolume, a4);
    objc_storeStrong((id *)&v13->_callbackQueue, a5);
    v17 = (NSByteCountFormatter *)objc_alloc_init(MEMORY[0x1E0CB34E8]);
    byteFormatter = v13->_byteFormatter;
    v13->_byteFormatter = v17;

  }
  return v13;
}

- (NSString)cacheDeleteVolume
{
  NSString *cachedVolume;
  NSObject *v4;
  int *v5;
  char *v6;
  NSString *v7;
  NSString *v8;
  int v10;
  char *v11;
  statfs v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  cachedVolume = self->_cachedVolume;
  if (!cachedVolume)
  {
    memset(&v12, 0, 512);
    if (statfs(-[NSString fileSystemRepresentation](self->_pathForVolume, "fileSystemRepresentation"), &v12))
    {
      PLBackendGetLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = __error();
        v6 = strerror(*v5);
        v10 = 136315138;
        v11 = v6;
        _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "statfs error: %s, Unable to get storage mount point.", (uint8_t *)&v10, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v12.f_mntonname, 4);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = self->_cachedVolume;
    self->_cachedVolume = v7;

    cachedVolume = self->_cachedVolume;
  }
  return cachedVolume;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)_queryAvailableSpace
{
  NSObject *v3;
  void *v4;
  double Current;
  NSObject *v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int64_t v14;
  int64_t v15;
  uint8_t buf[4];
  double v17;
  __int16 v18;
  NSObject *v19;
  __int16 v20;
  void *v21;
  const __CFString *v22;
  _QWORD v23[2];
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  v23[1] = *MEMORY[0x1E0C80C00];
  -[PLCacheDeleteClient cacheDeleteQueryQueue](self, "cacheDeleteQueryQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[PLCacheDeleteClient cacheDeleteVolume](self, "cacheDeleteVolume");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v22 = CFSTR("CACHE_DELETE_VOLUME");
    v23[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v6 = CacheDeleteCopyItemizedPurgeableSpaceWithInfo();
    v7 = CFAbsoluteTimeGetCurrent();
    -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_FREESPACE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "longLongValue");

    -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_TOTAL_FSPURGEABLE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "longLongValue");

    PLBackendGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Available space (MB):\n\tFree=%lld MB (%lld)\n\tPurgeable=%lld MB (%lld)"), v9 / 0x100000, v9, v11 / 0x100000, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v17 = v7 - Current;
      v18 = 2112;
      v19 = v6;
      v20 = 2112;
      v21 = v13;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "PLCacheDeleteClient: queryAvailableSpace (%.3f seconds)\nCacheDeleteCopyItemizedPurgeableSpaceWithInfo: %@ \n%@", buf, 0x20u);

    }
  }
  else
  {
    PLBackendGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "PLCacheDeleteClient: queryAvailableSpace returning 0 available space because cacheDeleteVolume was nil", buf, 2u);
    }
    v11 = 0;
    v9 = 0;
  }

  v14 = v9;
  v15 = v11;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (void)requestDiskSpaceAvailabilityOfSize:(int64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v13;
  int64_t v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  PLBackendGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[PLCacheDeleteClient byteFormatter](self, "byteFormatter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringFromByteCount:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v9;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "PLCacheDeleteClient: Ensuring availability of %{public}@ free space", buf, 0xCu);

  }
  -[PLCacheDeleteClient cacheDeleteQueryQueue](self, "cacheDeleteQueryQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__PLCacheDeleteClient_requestDiskSpaceAvailabilityOfSize_completion___block_invoke;
  block[3] = &unk_1E3674C40;
  block[4] = self;
  v13 = v6;
  v14 = a3;
  v11 = v6;
  dispatch_async(v10, block);

}

- (void)_notifyDiskAvailabilityRequestCompletionHandler:(id)a3 withSuccess:(BOOL)a4 numBytesPurged:(int64_t)a5 additionalBytesRequired:(int64_t)a6 error:(id)a7
{
  id v12;
  id v13;
  CacheDeleteToken *v14;
  NSObject *v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  int64_t v21;
  int64_t v22;
  BOOL v23;

  v12 = a3;
  v13 = a7;
  v14 = -[PLCacheDeleteClient currentCacheDeletePurgeToken](self, "currentCacheDeletePurgeToken");
  if (v14)
    CFRelease(v14);
  -[PLCacheDeleteClient setCurrentCacheDeletePurgeToken:](self, "setCurrentCacheDeletePurgeToken:", 0);
  -[PLCacheDeleteClient callbackQueue](self, "callbackQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __128__PLCacheDeleteClient__notifyDiskAvailabilityRequestCompletionHandler_withSuccess_numBytesPurged_additionalBytesRequired_error___block_invoke;
  block[3] = &unk_1E3660C10;
  v23 = a4;
  v21 = a5;
  v22 = a6;
  v19 = v13;
  v20 = v12;
  v16 = v13;
  v17 = v12;
  dispatch_async(v15, block);

}

- (void)cancelDiskSpaceAvailabilityRequest
{
  NSObject *v3;
  _QWORD block[5];

  -[PLCacheDeleteClient cacheDeleteQueryQueue](self, "cacheDeleteQueryQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PLCacheDeleteClient_cancelDiskSpaceAvailabilityRequest__block_invoke;
  block[3] = &unk_1E3677AA0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (OS_dispatch_queue)cacheDeleteQueryQueue
{
  return self->_cacheDeleteQueryQueue;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (NSString)pathForVolume
{
  return self->_pathForVolume;
}

- (NSByteCountFormatter)byteFormatter
{
  return self->_byteFormatter;
}

- (CacheDeleteToken)currentCacheDeletePurgeToken
{
  return self->_currentCacheDeletePurgeToken;
}

- (void)setCurrentCacheDeletePurgeToken:(CacheDeleteToken *)a3
{
  self->_currentCacheDeletePurgeToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_byteFormatter, 0);
  objc_storeStrong((id *)&self->_pathForVolume, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_cacheDeleteQueryQueue, 0);
  objc_storeStrong((id *)&self->_cachedVolume, 0);
}

void __57__PLCacheDeleteClient_cancelDiskSpaceAvailabilityRequest__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  const void *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  v2 = objc_msgSend(*(id *)(a1 + 32), "currentCacheDeletePurgeToken");
  PLBackendGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "PLCacheDeleteClient: Cancelling purge request", buf, 2u);
    }

    v5 = (const void *)objc_msgSend(*(id *)(a1 + 32), "currentCacheDeletePurgeToken");
    objc_msgSend(*(id *)(a1 + 32), "setCurrentCacheDeletePurgeToken:", 0);
    CacheDeleteCancelPurge();
    CFRelease(v5);
  }
  else
  {
    if (v4)
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "PLCacheDeleteClient: No active purge request to cancel.", v6, 2u);
    }

  }
}

uint64_t __128__PLCacheDeleteClient__notifyDiskAvailabilityRequestCompletionHandler_withSuccess_numBytesPurged_additionalBytesRequired_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
  return result;
}

void __69__PLCacheDeleteClient_requestDiskSpaceAvailabilityOfSize_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint8_t v30[16];
  _QWORD v31[3];
  _QWORD v32[3];
  _BYTE buf[12];
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "currentCacheDeletePurgeToken"))
  {
    PLBackendGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_ERROR, "PLCacheDeleteClient: Attempting to make a purge request when we already have one active. Ignoring.", buf, 2u);
    }

    PLCacheDeleteClientError(2, CFSTR("A purge request is already active and hasn't been cancelled."));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_notifyDiskAvailabilityRequestCompletionHandler:withSuccess:numBytesPurged:additionalBytesRequired:error:", *(_QWORD *)(a1 + 40), 0, 0, 0, v3);

  }
  else
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "_queryAvailableSpace");
    v6 = v5;
    PLBackendGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Available space (MB):\n\tFree=%lld MB (%lld)\n\tPurgeable=%lld MB (%lld)"), v4 / 0x100000, v4, v6 / 0x100000, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v8;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "PLCacheDeleteClient: Current disk state: %{public}@", buf, 0xCu);

    }
    v9 = *(_QWORD *)(a1 + 48);
    v10 = v9 - v4;
    if (v9 <= v4)
    {
      PLBackendGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "byteFormatter");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringFromByteCount:", v4);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "byteFormatter");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringFromByteCount:", *(_QWORD *)(a1 + 48));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v26;
        v34 = 2114;
        v35 = v28;
        _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_DEFAULT, "PLCacheDeleteClient: Purging cache delete files not required, as there is enough free space (%{public}@) to cover the required disk space (%{public}@)", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 32), "_notifyDiskAvailabilityRequestCompletionHandler:withSuccess:numBytesPurged:additionalBytesRequired:error:", *(_QWORD *)(a1 + 40), 1, 0, 0, 0);
    }
    else
    {
      PLBackendGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "byteFormatter");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringFromByteCount:", v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "byteFormatter");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringFromByteCount:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v13;
        v34 = 2114;
        v35 = v15;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "PLCacheDeleteClient: Since we have %{public}@ free already, requesting %{public}@ of purgeable space to be cleared...", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 32), "cacheDeleteVolume");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = CFSTR("CACHE_DELETE_VOLUME");
      v31[1] = CFSTR("CACHE_DELETE_URGENCY_LIMIT");
      v32[0] = v16;
      v32[1] = &unk_1E375D500;
      v31[2] = CFSTR("CACHE_DELETE_AMOUNT");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v32[2] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      PLBackendGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = os_signpost_id_generate(v19);
      *(_QWORD *)buf = 0;
      mach_timebase_info((mach_timebase_info_t)buf);
      v21 = v19;
      v22 = v21;
      if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        *(_WORD *)v30 = 0;
        _os_signpost_emit_with_name_impl(&dword_199541000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "PLCacheDeleteClientPurgeRequest", ", v30, 2u);
      }

      mach_absolute_time();
      CFAbsoluteTimeGetCurrent();
      v29 = *(id *)(a1 + 40);
      v23 = v22;
      objc_msgSend(*(id *)(a1 + 32), "setCurrentCacheDeletePurgeToken:", CacheDeletePurgeSpaceWithInfo());

    }
  }
}

void __69__PLCacheDeleteClient_requestDiskSpaceAvailabilityOfSize_completion___block_invoke_42(uint64_t a1, void *a2)
{
  double Current;
  double v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  char *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  _QWORD block[5];
  id v31;
  id v32;
  double v33;
  uint64_t v34;
  __int128 v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  double v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  v5 = *(double *)(a1 + 56);
  v6 = mach_absolute_time();
  v7 = *(_QWORD *)(a1 + 64);
  v9 = *(_DWORD *)(a1 + 96);
  v8 = *(_DWORD *)(a1 + 100);
  v10 = *(id *)(a1 + 32);
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 72);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v11, OS_SIGNPOST_INTERVAL_END, v12, "PLCacheDeleteClientPurgeRequest", ", buf, 2u);
  }

  v13 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "PLCacheDeleteClientPurgeRequest";
    v38 = 2048;
    v39 = (float)((float)((float)((float)(v6 - v7) * (float)v9) / (float)v8) / 1000000.0);
    _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v14 = Current - v5;
  v15 = COERCE_DOUBLE(a2);
  v16 = objc_msgSend(*(id *)(a1 + 40), "currentCacheDeletePurgeToken");
  objc_msgSend(*(id *)&v15, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_ERROR"));
  v17 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
  objc_msgSend(*(id *)&v15, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_AMOUNT"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "longLongValue");

  if (v16)
  {
    if (v17 == 0.0)
    {
      objc_msgSend(*(id *)(a1 + 40), "cacheDeleteQueryQueue");
      v29 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __69__PLCacheDeleteClient_requestDiskSpaceAvailabilityOfSize_completion___block_invoke_50;
      block[3] = &unk_1E3660BC0;
      block[4] = *(_QWORD *)(a1 + 40);
      v33 = v14;
      v31 = *(id *)&v15;
      v34 = v19;
      v35 = *(_OWORD *)(a1 + 80);
      v32 = *(id *)(a1 + 48);
      dispatch_async(v29, block);

    }
    else
    {
      PLBackendGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 40), "byteFormatter");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringFromByteCount:", *(_QWORD *)(a1 + 80));
        v22 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v22;
        v38 = 2112;
        v39 = v17;
        _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "PLCacheDeleteClient: Encountered error requesting purge of %{public}@. Error string: \"%@\", buf, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Encountered error in Cache Delete: %@"), *(_QWORD *)&v17);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      PLCacheDeleteClientError(4, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "_notifyDiskAvailabilityRequestCompletionHandler:withSuccess:numBytesPurged:additionalBytesRequired:error:", *(_QWORD *)(a1 + 48), 0, v19, *(_QWORD *)(a1 + 80) - v19, v24);
    }
  }
  else
  {
    PLBackendGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "byteFormatter");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringFromByteCount:", v19);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v37 = *(const char **)&v14;
      v38 = 2114;
      v39 = v15;
      v40 = 2114;
      v41 = v27;
      _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEFAULT, "PLCacheDeleteClient: Purge cancelled (%.3f seconds) with results: %{public}@\n%{public}@ purged before cancellation.", buf, 0x20u);

    }
    PLCacheDeleteClientError(1, CFSTR("Purge request was cancelled."));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_notifyDiskAvailabilityRequestCompletionHandler:withSuccess:numBytesPurged:additionalBytesRequired:error:", *(_QWORD *)(a1 + 48), 0, v19, *(_QWORD *)(a1 + 80) - v19, v28);

  }
}

void __69__PLCacheDeleteClient_requestDiskSpaceAvailabilityOfSize_completion___block_invoke_50(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  const __CFString *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  const __CFString *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_queryAvailableSpace");
  v4 = v3;
  v5 = objc_msgSend(MEMORY[0x1E0D731D8], "diskSpaceAvailableForUse");
  PLBackendGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(void **)(a1 + 56);
    v8 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Available space (MB):\n\tFree=%lld MB (%lld)\n\tPurgeable=%lld MB (%lld)"), v2 / 0x100000, v2, v4 / 0x100000, v4);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "byteFormatter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringFromByteCount:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "byteFormatter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringFromByteCount:", *(_QWORD *)(a1 + 64));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v40 = v7;
    v41 = 2114;
    v42 = v8;
    v43 = 2114;
    v44 = v9;
    v45 = 2114;
    v46 = v11;
    v47 = 2114;
    v48 = v13;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "PLCacheDeleteClient: Purge completed (%.3f seconds) with results: %{public}@\n%{public}@\n%{public}@ free\n%{public}@ purged.", buf, 0x34u);

  }
  v14 = *(_QWORD *)(a1 + 64);
  v15 = *(_QWORD *)(a1 + 72);
  v16 = *(_QWORD *)(a1 + 80);
  PLBackendGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v5 >= v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "byteFormatter");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "stringFromByteCount:", *(_QWORD *)(a1 + 72));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "byteFormatter");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringFromByteCount:", *(_QWORD *)(a1 + 64));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 >= v15)
        v31 = CFSTR("YES");
      else
        v31 = CFSTR("NO");
      objc_msgSend(*(id *)(a1 + 32), "byteFormatter");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringFromByteCount:", *(_QWORD *)(a1 + 80));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "byteFormatter");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringFromByteCount:", v5);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v40 = v28;
      v41 = 2114;
      v42 = v30;
      v43 = 2114;
      v44 = v31;
      v45 = 2114;
      v46 = v33;
      v47 = 2114;
      v48 = v35;
      v49 = 2114;
      v50 = CFSTR("YES");
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "PLCacheDeleteClient: Purged enough bytes (requested=%{public}@, purged=%{public}@): %{public}@, Enough space now available (total needed: %{public}@, now available=%{public}@): %{public}@", buf, 0x3Eu);

    }
    objc_msgSend(*(id *)(a1 + 32), "_notifyDiskAvailabilityRequestCompletionHandler:withSuccess:numBytesPurged:additionalBytesRequired:error:", *(_QWORD *)(a1 + 48), 1, *(_QWORD *)(a1 + 64), 0, 0);
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "byteFormatter");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "stringFromByteCount:", *(_QWORD *)(a1 + 64));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "byteFormatter");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "stringFromByteCount:", *(_QWORD *)(a1 + 72));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 >= v15)
        v21 = CFSTR("YES");
      else
        v21 = CFSTR("NO");
      objc_msgSend(*(id *)(a1 + 32), "byteFormatter");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringFromByteCount:", v5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "byteFormatter");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringFromByteCount:", *(_QWORD *)(a1 + 80));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v40 = v19;
      v41 = 2114;
      v42 = v20;
      v43 = 2114;
      v44 = v21;
      v45 = 2114;
      v46 = v23;
      v47 = 2114;
      v48 = v25;
      v49 = 2114;
      v50 = CFSTR("NO");
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "PLCacheDeleteClient: Purged enough bytes (purged=%{public}@ requested=%{public}@): %{public}@, Enough space now available (available=%{public}@ total needed: %{public}@): %{public}@", buf, 0x3Eu);

    }
    v26 = *(_QWORD *)(a1 + 80) - v5;
    PLCacheDeleteClientError(3, CFSTR("The requested disk space could not be satisfied with currently available (and purgeable) disk space."));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_notifyDiskAvailabilityRequestCompletionHandler:withSuccess:numBytesPurged:additionalBytesRequired:error:", *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 64), v26, v27);

  }
}

+ (BOOL)hasEntitlementsForCacheDelete
{
  if (hasEntitlementsForCacheDelete_onceToken != -1)
    dispatch_once(&hasEntitlementsForCacheDelete_onceToken, &__block_literal_global_3059);
  return hasEntitlementsForCacheDelete_hasEntitlements;
}

void __52__PLCacheDeleteClient_hasEntitlementsForCacheDelete__block_invoke()
{
  __SecTask *v0;
  __SecTask *v1;
  id v2;
  id v3;

  v0 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  if (v0)
  {
    v1 = v0;
    v3 = (id)SecTaskCopyValueForEntitlement(v0, CFSTR("com.apple.private.CacheDelete"), 0);
    CFRelease(v1);
  }
  else
  {
    v3 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v3;
    if (objc_msgSend(v2, "containsObject:", CFSTR("CLIENT_ENTITLEMENT"))
      && objc_msgSend(v2, "containsObject:", CFSTR("PURGE_ENTITLEMENT"))
      && objc_msgSend(v2, "containsObject:", CFSTR("ITEMIZED_PURGEABLE_ENTITLEMENT"))
      && objc_msgSend(v2, "containsObject:", CFSTR("CANCEL_PURGE_ENTITLEMENT")))
    {
      hasEntitlementsForCacheDelete_hasEntitlements = 1;
    }

  }
}

@end
