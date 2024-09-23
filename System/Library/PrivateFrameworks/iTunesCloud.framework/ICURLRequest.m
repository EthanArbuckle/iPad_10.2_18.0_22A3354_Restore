@implementation ICURLRequest

- (NSString)description
{
  unint64_t requestState;
  __CFString *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  requestState = self->_requestState;
  if (requestState > 3)
    v4 = 0;
  else
    v4 = off_1E438C1E8[requestState];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  -[ICRequestContext clientInfo](self->_requestContext, "clientInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_clientIdentifierForUserAgent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICRequestContext clientInfo](self->_requestContext, "clientInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clientVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@ %p (%@) [%@/%@]>"), v6, self, v4, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (double)lastUpdateTime
{
  return self->_lastUpdateTime;
}

- (int64_t)requestState
{
  return self->_requestState;
}

- (void)setLastUpdateTime:(double)a3
{
  self->_lastUpdateTime = a3;
}

- (void)dealloc
{
  objc_super v3;

  -[NSMutableArray removeAllObjects](self->_observers, "removeAllObjects");
  v3.receiver = self;
  v3.super_class = (Class)ICURLRequest;
  -[ICURLRequest dealloc](&v3, sel_dealloc);
}

- (ICRequestContext)requestContext
{
  return self->_requestContext;
}

- (BOOL)prioritize
{
  return self->_prioritize;
}

- (void)buildURLRequestWithCompletionHandler:(id)a3
{
  NSURLRequest *currentURLRequest;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void (**v13)(id, void *, _QWORD);

  v13 = (void (**)(id, void *, _QWORD))a3;
  currentURLRequest = self->_currentURLRequest;
  if (!currentURLRequest)
    currentURLRequest = self->_urlRequest;
  v5 = (void *)-[NSURLRequest mutableCopy](currentURLRequest, "mutableCopy");
  -[ICURLRequest requestContext](self, "requestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForHTTPHeaderField:", CFSTR("User-Agent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(v6, "userAgent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forHTTPHeaderField:", v8, CFSTR("User-Agent"));

  }
  objc_msgSend(v5, "valueForHTTPHeaderField:", CFSTR("Accept-Language"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("AppleLanguages"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(v11, "objectAtIndex:", 0);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = CFSTR("en");
    }
    objc_msgSend(v5, "setValue:forHTTPHeaderField:", v12, CFSTR("Accept-Language"));

  }
  v13[2](v13, v5, 0);

}

- (void)updateState:(int64_t)a3
{
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *observerQueue;
  os_unfair_lock_t lock;
  _QWORD block[7];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[ICURLRequest setRequestState:](self, "setRequestState:", a3);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_observers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          observerQueue = self->_observerQueue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __28__ICURLRequest_updateState___block_invoke;
          block[3] = &unk_1E438C1C8;
          block[4] = v10;
          block[5] = self;
          block[6] = a3;
          dispatch_async(observerQueue, block);
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16, lock);
    }
    while (v7);
  }

  os_unfair_lock_unlock(lock);
}

- (void)setRequestState:(int64_t)a3
{
  -[ICURLRequest _updateSignpostsForNewState:](self, "_updateSignpostsForNewState:");
  -[ICURLRequest willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("requestState"));
  self->_requestState = a3;
  -[ICURLRequest didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("requestState"));
}

- (void)_updateSignpostsForNewState:(int64_t)a3
{
  unint64_t signpostIdentifier;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  __CFString *v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  uint64_t v25;
  void *v26;
  char isKindOfClass;
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  signpostIdentifier = self->_signpostIdentifier;
  if (!signpostIdentifier)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Analytics");
    self->_signpostIdentifier = os_signpost_id_make_with_pointer(v6, self);

    v7 = os_log_create("com.apple.amp.iTunesCloud", "Analytics");
    v8 = v7;
    v9 = self->_signpostIdentifier;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      -[ICURLRequest _analyticSignature](self, "_analyticSignature");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136446210;
      v29 = objc_msgSend(v10, "UTF8String");
      _os_signpost_emit_with_name_impl(&dword_1A03E3000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v9, "ICURLRequestWaiting", " enableTelemetry=YES request=%{public, signpost.telemetry:string1}s", buf, 0xCu);

    }
    signpostIdentifier = self->_signpostIdentifier;
  }
  if (signpostIdentifier + 1 >= 2)
  {
    if (a3 == 1 && !self->_requestState)
    {
      v11 = os_log_create("com.apple.amp.iTunesCloud", "Analytics");
      v12 = v11;
      v13 = self->_signpostIdentifier;
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A03E3000, v12, OS_SIGNPOST_INTERVAL_END, v13, "ICURLRequestWaiting", ", buf, 2u);
      }

      -[ICURLRequest _analyticSignature](self, "_analyticSignature");
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v15 = os_log_create("com.apple.amp.iTunesCloud", "Analytics");
      v16 = v15;
      v17 = self->_signpostIdentifier;
      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        v18 = -[__CFString UTF8String](objc_retainAutorelease(v14), "UTF8String");
        *(_DWORD *)buf = 136446210;
        v29 = v18;
        _os_signpost_emit_with_name_impl(&dword_1A03E3000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v17, "ICURLRequest", " enableTelemetry=YES request=%{public, signpost.telemetry:string1}s", buf, 0xCu);
      }

LABEL_25:
      return;
    }
    if (a3 != 3)
      return;
    -[ICURLRequest error](self, "error");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[ICURLRequest error](self, "error");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "msv_analyticSignature");
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[ICURLRequest urlResponse](self, "urlResponse");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        v14 = CFSTR("OK");
LABEL_21:
        v22 = os_log_create("com.apple.amp.iTunesCloud", "Analytics");
        v23 = v22;
        v24 = self->_signpostIdentifier;
        if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
        {
          v25 = -[__CFString UTF8String](objc_retainAutorelease(v14), "UTF8String");
          *(_DWORD *)buf = 136446210;
          v29 = v25;
          _os_signpost_emit_with_name_impl(&dword_1A03E3000, v23, OS_SIGNPOST_INTERVAL_END, v24, "ICURLRequest", "result=%{public, signpost.telemetry:string2}s", buf, 0xCu);
        }

        self->_signpostIdentifier = -1;
        goto LABEL_25;
      }
      -[ICURLRequest urlResponse](self, "urlResponse");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "statusCode") == 200)
      {
        v14 = CFSTR("OK");
        goto LABEL_20;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HTTP-%ld"), objc_msgSend(v20, "statusCode"));
      v21 = objc_claimAutoreleasedReturnValue();
    }
    v14 = (__CFString *)v21;
LABEL_20:

    goto LABEL_21;
  }
}

- (id)_analyticSignature
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[ICURLRequest urlRequest](self, "urlRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasPrefix:", CFSTR("/WebObjects/")))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v4, v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v4;
  }
  v7 = v6;

  return v7;
}

- (NSURLRequest)urlRequest
{
  return self->_urlRequest;
}

- (NSURLResponse)urlResponse
{
  return self->_urlResponse;
}

- (void)setAggregatedPerformanceMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_aggregatedPerformanceMetrics, a3);
}

- (void)setPrioritize:(BOOL)a3
{
  self->_prioritize = a3;
}

- (BOOL)cancelOnHTTPErrors
{
  return self->_cancelOnHTTPErrors;
}

- (NSError)error
{
  return self->_error;
}

- (void)setCurrentURLRequest:(id)a3
{
  objc_storeStrong((id *)&self->_currentURLRequest, a3);
}

- (int64_t)handlingType
{
  return self->_handlingType;
}

- (void)setRetryReason:(id)a3
{
  objc_storeStrong((id *)&self->_retryReason, a3);
}

- (void)setHandlingType:(int64_t)a3
{
  self->_handlingType = a3;
}

- (NSString)retryReason
{
  return self->_retryReason;
}

- (unint64_t)redirectCount
{
  return self->_redirectCount;
}

- (void)setRetryDelay:(double)a3
{
  self->_retryDelay = a3;
}

- (double)retryDelay
{
  return self->_retryDelay;
}

- (void)setRedirectCount:(unint64_t)a3
{
  self->_redirectCount = a3;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (ICURLResponseHandler)responseHandler
{
  return self->_responseHandler;
}

- (void)setUrlResponse:(id)a3
{
  objc_storeStrong((id *)&self->_urlResponse, a3);
}

- (NSMutableData)responseData
{
  return self->_responseData;
}

- (ICURLAggregatedPerformanceMetrics)aggregatedPerformanceMetrics
{
  return self->_aggregatedPerformanceMetrics;
}

+ (Class)_responseClass
{
  return (Class)objc_opt_class();
}

- (NSURLRequest)currentURLRequest
{
  return self->_currentURLRequest;
}

- (NSURLSessionTask)task
{
  return self->_task;
}

- (unint64_t)maxRetryCount
{
  return -[ICURLRequest _maxRetryCountForReason:](self, "_maxRetryCountForReason:", CFSTR("other"));
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (void)setResponseData:(id)a3
{
  objc_storeStrong((id *)&self->_responseData, a3);
}

- (unint64_t)retryCount
{
  return -[ICURLRequest _retryCountForReason:](self, "_retryCountForReason:", CFSTR("other"));
}

- (unint64_t)_retryCountForReason:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  unint64_t v7;

  v4 = a3;
  -[ICURLRequest _ensureValidRetryReason:](self, "_ensureValidRetryReason:", v4);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_retryCounts, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "unsignedIntegerValue");
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (unint64_t)_maxRetryCountForReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  -[ICURLRequest _ensureValidRetryReason:](self, "_ensureValidRetryReason:", v4);
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_maxRetryCounts, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "unsignedIntegerValue");
  else
    v7 = 0x7FFFFFFFFFFFFFFFLL;

  os_unfair_lock_unlock(&self->_lock);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    v7 = objc_msgSend((id)objc_opt_class(), "_defaultMaxRetryCountForReason:", v4);

  return v7;
}

- (void)_ensureValidRetryReason:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5 || objc_msgSend(v5, "isEqual:", 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICURLRequest.m"), 272, CFSTR("There is no retry count for ICURLResponseHandlingRetryReasonNone."));

  }
}

- (int64_t)type
{
  return self->_type;
}

- (double)startTime
{
  return self->_startTime;
}

- (BOOL)shouldReportLoadURLMetrics
{
  return self->_loadURLMetricsRequestName != 0;
}

- (NSString)loadURLMetricsRequestName
{
  return self->_loadURLMetricsRequestName;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setResponseDataURL:(id)a3
{
  objc_storeStrong((id *)&self->_responseDataURL, a3);
}

- (void)setMaxRetryCount:(unint64_t)a3
{
  -[ICURLRequest _setMaxRetryCount:forReason:](self, "_setMaxRetryCount:forReason:", a3, CFSTR("other"));
}

- (NSData)resumeData
{
  return self->_resumeData;
}

- (NSURL)responseDataURL
{
  return self->_responseDataURL;
}

- (void)_setMaxRetryCount:(unint64_t)a3 forReason:(id)a4
{
  void *v6;
  NSMutableDictionary *maxRetryCounts;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a4;
  -[ICURLRequest _ensureValidRetryReason:](self, "_ensureValidRetryReason:");
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  maxRetryCounts = self->_maxRetryCounts;
  if (!maxRetryCounts)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = self->_maxRetryCounts;
    self->_maxRetryCounts = v8;

    maxRetryCounts = self->_maxRetryCounts;
  }
  -[NSMutableDictionary setObject:forKey:](maxRetryCounts, "setObject:forKey:", v6, v10);

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

+ (id)_nameForRequestType:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
    return CFSTR("<unknown>");
  else
    return off_1E438C208[a3];
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCancelOnHTTPErrors:(BOOL)a3
{
  self->_cancelOnHTTPErrors = a3;
}

- (ICURLRequest)initWithURLRequest:(id)a3 requestContext:(id)a4 resumeData:(id)a5
{
  id v9;
  id v10;
  id v11;
  ICURLRequest *v12;
  ICURLResponseHandler *v13;
  ICURLResponseHandler *responseHandler;
  dispatch_semaphore_t v15;
  OS_dispatch_semaphore *waitSemaphore;
  NSMutableData *v17;
  NSMutableData *responseData;
  uint64_t v19;
  ICRequestContext *requestContext;
  uint64_t v21;
  NSData *resumeData;
  uint64_t v23;
  NSMutableArray *observers;
  dispatch_queue_t v25;
  OS_dispatch_queue *observerQueue;
  void *v27;
  objc_super v29;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v29.receiver = self;
  v29.super_class = (Class)ICURLRequest;
  v12 = -[ICURLRequest init](&v29, sel_init);
  if (v12)
  {
    v13 = (ICURLResponseHandler *)objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "_responseHandlerClass"));
    responseHandler = v12->_responseHandler;
    v12->_responseHandler = v13;

    objc_storeStrong((id *)&v12->_urlRequest, a3);
    *(_WORD *)&v12->_prioritize = 256;
    v12->_handlingType = 0;
    objc_storeStrong((id *)&v12->_retryReason, 0);
    v12->_retryDelay = 10.0;
    v15 = dispatch_semaphore_create(0);
    waitSemaphore = v12->_waitSemaphore;
    v12->_waitSemaphore = (OS_dispatch_semaphore *)v15;

    v17 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
    responseData = v12->_responseData;
    v12->_responseData = v17;

    v19 = objc_msgSend(v10, "copy");
    requestContext = v12->_requestContext;
    v12->_requestContext = (ICRequestContext *)v19;

    v21 = objc_msgSend(v11, "copy");
    resumeData = v12->_resumeData;
    v12->_resumeData = (NSData *)v21;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v23 = objc_claimAutoreleasedReturnValue();
    observers = v12->_observers;
    v12->_observers = (NSMutableArray *)v23;

    v12->_lock._os_unfair_lock_opaque = 0;
    v25 = dispatch_queue_create("com.apple.itunescloud.ICURLRequest.observer", MEMORY[0x1E0C80D50]);
    observerQueue = v12->_observerQueue;
    v12->_observerQueue = (OS_dispatch_queue *)v25;

    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 100);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICURLRequest setProgress:](v12, "setProgress:", v27);

  }
  return v12;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_aggregatedPerformanceMetrics, 0);
  objc_storeStrong((id *)&self->_retryReason, 0);
  objc_storeStrong((id *)&self->_avURLAsset, 0);
  objc_storeStrong((id *)&self->_avDownloadOptions, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_responseDataURL, 0);
  objc_storeStrong((id *)&self->_responseData, 0);
  objc_storeStrong((id *)&self->_urlResponse, 0);
  objc_storeStrong((id *)&self->_currentURLRequest, 0);
  objc_storeStrong((id *)&self->_waitSemaphore, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_urlRequest, 0);
  objc_storeStrong((id *)&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_resumeData, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_loadURLMetricsRequestName, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_retryCounts, 0);
  objc_storeStrong((id *)&self->_maxRetryCounts, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (ICURLRequest)initWithURL:(id)a3 requestContext:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  ICURLRequest *v9;

  v6 = (void *)MEMORY[0x1E0C92C80];
  v7 = a4;
  objc_msgSend(v6, "requestWithURL:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ICURLRequest initWithURLRequest:requestContext:resumeData:](self, "initWithURLRequest:requestContext:resumeData:", v8, v7, 0);

  return v9;
}

- (ICURLRequest)initWithURL:(id)a3 requestContext:(id)a4 resumeData:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  ICURLRequest *v12;

  v8 = (void *)MEMORY[0x1E0C92C80];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "requestWithURL:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ICURLRequest initWithURLRequest:requestContext:resumeData:](self, "initWithURLRequest:requestContext:resumeData:", v11, v10, v9);

  return v12;
}

- (ICURLRequest)initWithURLRequest:(id)a3 requestContext:(id)a4
{
  return -[ICURLRequest initWithURLRequest:requestContext:resumeData:](self, "initWithURLRequest:requestContext:resumeData:", a3, a4, 0);
}

- (void)registerObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableArray addObject:](self->_observers, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)unregisterObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableArray removeObject:](self->_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)_incrementRetryCountForReason:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSMutableDictionary *retryCounts;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  -[ICURLRequest _ensureValidRetryReason:](self, "_ensureValidRetryReason:", v10);
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_retryCounts, "objectForKey:", v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5 + 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  retryCounts = self->_retryCounts;
  if (!retryCounts)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = self->_retryCounts;
    self->_retryCounts = v8;

    retryCounts = self->_retryCounts;
  }
  -[NSMutableDictionary setObject:forKey:](retryCounts, "setObject:forKey:", v6, v10);

  os_unfair_lock_unlock(&self->_lock);
}

- (void)enableLoadURLMetricsWithRequestName:(id)a3
{
  objc_storeStrong((id *)&self->_loadURLMetricsRequestName, a3);
}

- (void)setResponseHandler:(id)a3
{
  objc_storeStrong((id *)&self->_responseHandler, a3);
}

- (OS_dispatch_semaphore)waitSemaphore
{
  return self->_waitSemaphore;
}

- (void)setWaitSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_waitSemaphore, a3);
}

- (NSDictionary)avDownloadOptions
{
  return self->_avDownloadOptions;
}

- (void)setAVDownloadOptions:(id)a3
{
  objc_storeStrong((id *)&self->_avDownloadOptions, a3);
}

- (AVURLAsset)avURLAsset
{
  return self->_avURLAsset;
}

- (void)setAVURLAsset:(id)a3
{
  objc_storeStrong((id *)&self->_avURLAsset, a3);
}

- (double)lastProgressUpdateTime
{
  return self->_lastProgressUpdateTime;
}

- (void)setLastProgressUpdateTime:(double)a3
{
  self->_lastProgressUpdateTime = a3;
}

uint64_t __28__ICURLRequest_updateState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "ICURLRequest:didChangeState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (unint64_t)_defaultMaxRetryCountForReason:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  char v5;
  unint64_t v6;

  v3 = (__CFString *)a3;
  v4 = CFSTR("authentication-performed");
  if (v3 == CFSTR("authentication-performed"))
  {

    goto LABEL_7;
  }
  v5 = -[__CFString isEqual:](v3, "isEqual:", CFSTR("authentication-performed"));

  if ((v5 & 1) != 0)
  {
LABEL_7:
    v6 = 1;
    goto LABEL_8;
  }
  if (v3 != CFSTR("other"))
    -[__CFString isEqual:](v3, "isEqual:", CFSTR("other"));
  v6 = 0;
LABEL_8:

  return v6;
}

+ (Class)_responseHandlerClass
{
  return (Class)objc_opt_class();
}

@end
