@implementation ICStorePlatformRequest

- (ICStorePlatformRequest)init
{
  ICStorePlatformRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICStorePlatformRequest;
  result = -[ICStorePlatformRequest init](&v3, sel_init);
  if (result)
  {
    result->_batchSize = 100;
    result->_qualityOfService = 25;
    *(_OWORD *)&result->_retryDelay = xmmword_1A06E75E0;
  }
  return result;
}

- (NSString)clientIdentifier
{
  NSString *clientIdentifier;
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;

  clientIdentifier = self->_clientIdentifier;
  if (clientIdentifier)
  {
    v3 = clientIdentifier;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "length"))
    {
      v3 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "processName");
      v3 = (NSString *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v3;
}

- (NSString)imageProfile
{
  if (self->_imageProfile)
    return self->_imageProfile;
  else
    return (NSString *)&stru_1E4391778;
}

- (NSArray)itemIdentifiers
{
  if (self->_itemIdentifiers)
    return self->_itemIdentifiers;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSString)keyProfile
{
  if (self->_keyProfile)
    return self->_keyProfile;
  else
    return (NSString *)CFSTR("lockup");
}

- (id)performWithResponseHandler:(id)a3
{
  id v3;
  NSObject *v4;
  NSUInteger v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  void *v7;
  int64_t *p_qualityOfService;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t batchSize;
  int v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  ICStorePlatformResponse *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  ICStorePlatformRequestOperation *v30;
  id v31;
  id v32;
  id v33;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  NSObject *group;
  void *v40;
  dispatch_queue_t v41;
  NSObject *queue;
  id val;
  _QWORD block[4];
  id v46;
  dispatch_queue_t v47;
  ICStorePlatformRequest *v48;
  id v49;
  id v50;
  _QWORD *v51;
  _QWORD *v52;
  _BYTE *v53;
  _QWORD v54[6];
  id v55;
  id v56;
  dispatch_queue_t v57;
  id v58;
  void *v59;
  _BYTE *v60;
  _QWORD *v61;
  _QWORD *v62;
  uint64_t v63;
  _QWORD v64[6];
  id v65;
  _QWORD *v66;
  id v67;
  _QWORD v68[3];
  char v69;
  id location;
  _QWORD v71[4];
  _BYTE buf[24];
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[NSArray count](self->_itemIdentifiers, "count");
    -[ICStorePlatformRequest keyProfile](self, "keyProfile");
    v6 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v5;
    *(_WORD *)&buf[22] = 2114;
    v73 = v6;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing platform request of %ld items with profile '%{public}@'", buf, 0x20u);

  }
  +[ICURLSessionManager sharedSessionManager](ICURLSessionManager, "sharedSessionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  p_qualityOfService = &self->_qualityOfService;
  objc_msgSend(v7, "sessionWithQualityOfService:", self->_qualityOfService);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  group = dispatch_group_create();
  val = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v9 = objc_msgSend(v40, "maxConcurrentRequests");
  v10 = v9 - 1;
  if (v9 - 1 >= 5)
    v10 = 5;
  if (v9 <= 2)
    v11 = v9;
  else
    v11 = v10;
  objc_msgSend(val, "setMaxConcurrentOperationCount:", v11);
  objc_msgSend(val, "setName:", CFSTR("com.apple.iTunesCloud.ICStorePlatformRequest.operationQueue"));
  objc_msgSend(val, "setQualityOfService:", *p_qualityOfService);
  batchSize = self->_batchSize;
  -[ICStorePlatformRequest keyProfile](self, "keyProfile");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v37, "isEqualToString:", CFSTR("lockup"));
  v14 = 50;
  if (v13)
    v14 = 100;
  if (v14 >= batchSize)
    v15 = batchSize;
  else
    v15 = v14;
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v73 = __Block_byref_object_copy__8522;
  v74 = __Block_byref_object_dispose__8523;
  v75 = 0;
  v71[0] = 0;
  v71[1] = v71;
  v71[2] = 0x2020000000;
  v71[3] = 0;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v17 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v17, *(dispatch_qos_class_t *)p_qualityOfService, 0);
  v18 = objc_claimAutoreleasedReturnValue();
  queue = dispatch_queue_create("com.apple.iTunesCloud.ICStorePlatformRequest.union", v18);

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v19 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v19, *(dispatch_qos_class_t *)p_qualityOfService, 0);
  v20 = objc_claimAutoreleasedReturnValue();
  v41 = dispatch_queue_create("com.apple.iTunesCloud.ICStorePlatformRequest.callout", v20);

  v21 = [ICStorePlatformResponse alloc];
  v22 = -[ICStorePlatformResponse initWithResponseDictionary:](v21, "initWithResponseDictionary:", MEMORY[0x1E0C9AA70]);
  v23 = -[NSArray count](self->_itemIdentifiers, "count");
  if (v23 >= 1)
  {
    for (i = 0; i < v23; i += v15)
      objc_msgSend(v16, "addObject:", v22);
  }
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", objc_msgSend(v16, "count", v22));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setCancellable:", 1);
  objc_initWeak(&location, val);
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x2020000000;
  v69 = 0;
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = __53__ICStorePlatformRequest_performWithResponseHandler___block_invoke;
  v64[3] = &unk_1E438B170;
  objc_copyWeak(&v67, &location);
  v66 = v68;
  v64[4] = queue;
  v64[5] = v41;
  v36 = v3;
  v65 = v36;
  objc_msgSend(v25, "setCancellationHandler:", v64);
  v38 = (void *)MEMORY[0x1A1AFA8D0](self->_batchResultsHandler);
  if (v23 > 0)
  {
    v26 = 0;
    v27 = v23;
    do
    {
      if (v15 >= v27)
        v28 = v27;
      else
        v28 = v15;
      v29 = -[ICStorePlatformRequest copyWithItemIdentifiersInRange:](self, "copyWithItemIdentifiersInRange:", v26, v28);
      v30 = -[ICStorePlatformRequestOperation initWithPlatformRequest:usingURLSession:]([ICStorePlatformRequestOperation alloc], "initWithPlatformRequest:usingURLSession:", v29, v40);
      dispatch_group_enter(group);
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __53__ICStorePlatformRequest_performWithResponseHandler___block_invoke_4;
      v54[3] = &unk_1E438B1C0;
      v54[4] = group;
      v54[5] = queue;
      v55 = v25;
      v56 = v16;
      v60 = buf;
      v58 = v29;
      v59 = v38;
      v61 = v71;
      v62 = v68;
      v63 = v26 / v15;
      v57 = v41;
      -[ICStorePlatformRequestOperation setResponseHandler:](v30, "setResponseHandler:", v54);
      objc_msgSend(val, "addOperation:", v30);

      v26 += v15;
      v27 -= v15;
    }
    while (v26 < v23);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__ICStorePlatformRequest_performWithResponseHandler___block_invoke_7;
  block[3] = &unk_1E438B1E8;
  v52 = v71;
  v53 = buf;
  v46 = val;
  v47 = v41;
  v50 = v36;
  v51 = v68;
  v48 = self;
  v49 = v16;
  v31 = v36;
  v32 = val;
  dispatch_group_notify(group, queue, block);
  v33 = v25;

  objc_destroyWeak(&v67);
  _Block_object_dispose(v68, 8);
  objc_destroyWeak(&location);

  _Block_object_dispose(v71, 8);
  _Block_object_dispose(buf, 8);

  return v33;
}

- (NSString)platformIdentifier
{
  if (self->_platformIdentifier)
    return self->_platformIdentifier;
  else
    return (NSString *)&stru_1E4391778;
}

- (NSString)protocolVersion
{
  __CFString *v3;

  if (-[NSString length](self->_protocolVersion, "length"))
    v3 = self->_protocolVersion;
  else
    v3 = CFSTR("2");
  return (NSString *)v3;
}

- (void)setBatchSize:(int64_t)a3
{
  int64_t v5;

  if (a3 >= 101)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Batch size must be <= %ld"), 100);
  v5 = 100;
  if (a3 < 100)
    v5 = a3;
  self->_batchSize = v5;
}

- (id)copyWithItemIdentifiersInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  length = a3.length;
  location = a3.location;
  v6 = (_QWORD *)-[ICStorePlatformRequest copy](self, "copy");
  if (v6)
  {
    -[NSArray subarrayWithRange:](self->_itemIdentifiers, "subarrayWithRange:", location, length);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v6[5];
    v6[5] = v7;

  }
  return v6;
}

- (NSDictionary)HTTPHeaders
{
  void *v3;
  void *v4;
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(self->_personalizationStyle - 1) <= 1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (objc_class *)MEMORY[0x1E0CB3578];
    v6 = v4;
    v7 = objc_alloc_init(v5);
    objc_msgSend(v7, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss ZZZ"));
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    objc_msgSend(v7, "setLocale:", v8);
    objc_msgSend(v7, "stringFromDate:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "length"))
      objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("X-Request-TimeStamp"));

  }
  return (NSDictionary *)v3;
}

- (NSArray)queryItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICStorePlatformRequest clientIdentifier](self, "clientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("caller"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  -[NSArray componentsJoinedByString:](self->_itemIdentifiers, "componentsJoinedByString:", CFSTR(","));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("id"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  -[ICStorePlatformRequest keyProfile](self, "keyProfile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("p"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  if (-[ICStorePlatformRequest returnsLocalEquivalencies](self, "returnsLocalEquivalencies"))
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("e"), CFSTR("true"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v10);

  }
  if (-[NSString length](self->_imageProfile, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("artwork"), self->_imageProfile);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  if (-[NSString length](self->_platformIdentifier, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("platform"), self->_platformIdentifier);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v12);

  }
  -[ICStorePlatformRequest protocolVersion](self, "protocolVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("version"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v14);

  }
  return (NSArray *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = objc_msgSend(self->_batchResultsHandler, "copyWithZone:", a3);
    v7 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v6;

    *(_QWORD *)(v5 + 48) = self->_batchSize;
    v8 = -[NSString copyWithZone:](self->_clientIdentifier, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v8;

    v10 = -[NSString copyWithZone:](self->_imageProfile, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = v10;

    v12 = -[NSArray copyWithZone:](self->_itemIdentifiers, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v12;

    v14 = -[NSString copyWithZone:](self->_keyProfile, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 72);
    *(_QWORD *)(v5 + 72) = v14;

    *(_QWORD *)(v5 + 80) = self->_personalizationStyle;
    v16 = -[NSString copyWithZone:](self->_platformIdentifier, "copyWithZone:", a3);
    v17 = *(void **)(v5 + 88);
    *(_QWORD *)(v5 + 88) = v16;

    v18 = -[NSString copyWithZone:](self->_protocolVersion, "copyWithZone:", a3);
    v19 = *(void **)(v5 + 96);
    *(_QWORD *)(v5 + 96) = v18;

    v20 = -[ICRequestContext copyWithZone:](self->_requestContext, "copyWithZone:", a3);
    v21 = *(void **)(v5 + 128);
    *(_QWORD *)(v5 + 128) = v20;

    *(double *)(v5 + 104) = self->_retryDelay;
    *(_BYTE *)(v5 + 8) = self->_returnsLocalEquivalencies;
    *(_QWORD *)(v5 + 120) = self->_qualityOfService;
    *(double *)(v5 + 112) = self->_timeoutInterval;
    *(_BYTE *)(v5 + 9) = self->_shouldIgnoreCache;
  }
  return (id)v5;
}

- (void)setClientIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)clientBundleIdentifier
{
  return self->_clientBundleIdentifier;
}

- (void)setClientBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)clientBundleVersion
{
  return self->_clientBundleVersion;
}

- (void)setClientBundleVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setItemIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)batchSize
{
  return self->_batchSize;
}

- (id)batchResultsHandler
{
  return self->_batchResultsHandler;
}

- (void)setBatchResultsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setImageProfile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setKeyProfile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int64_t)personalizationStyle
{
  return self->_personalizationStyle;
}

- (void)setPersonalizationStyle:(int64_t)a3
{
  self->_personalizationStyle = a3;
}

- (void)setPlatformIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setProtocolVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (double)retryDelay
{
  return self->_retryDelay;
}

- (void)setRetryDelay:(double)a3
{
  self->_retryDelay = a3;
}

- (BOOL)returnsLocalEquivalencies
{
  return self->_returnsLocalEquivalencies;
}

- (void)setReturnsLocalEquivalencies:(BOOL)a3
{
  self->_returnsLocalEquivalencies = a3;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setTimeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

- (BOOL)shouldIgnoreCache
{
  return self->_shouldIgnoreCache;
}

- (void)setShouldIgnoreCache:(BOOL)a3
{
  self->_shouldIgnoreCache = a3;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (ICStoreRequestContext)requestContext
{
  return self->_requestContext;
}

- (void)setRequestContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_protocolVersion, 0);
  objc_storeStrong((id *)&self->_platformIdentifier, 0);
  objc_storeStrong((id *)&self->_keyProfile, 0);
  objc_storeStrong((id *)&self->_imageProfile, 0);
  objc_storeStrong(&self->_batchResultsHandler, 0);
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
  objc_storeStrong((id *)&self->_clientBundleVersion, 0);
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

void __53__ICStorePlatformRequest_performWithResponseHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  id v4;
  __int128 v5;
  _QWORD block[5];
  __int128 v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "cancelAllOperations");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__ICStorePlatformRequest_performWithResponseHandler___block_invoke_2;
  block[3] = &unk_1E438EA18;
  v3 = *(NSObject **)(a1 + 32);
  block[4] = *(_QWORD *)(a1 + 40);
  v5 = *(_OWORD *)(a1 + 48);
  v4 = (id)v5;
  v7 = v5;
  dispatch_async(v3, block);

}

void __53__ICStorePlatformRequest_performWithResponseHandler___block_invoke_7(uint64_t a1)
{
  id v2;
  NSObject *v3;
  id v4;
  _QWORD block[6];
  id v6;
  __int128 v7;

  v2 = *(id *)(a1 + 32);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__ICStorePlatformRequest_performWithResponseHandler___block_invoke_8;
    block[3] = &unk_1E438D6C8;
    v3 = *(NSObject **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 48);
    v7 = *(_OWORD *)(a1 + 80);
    v4 = *(id *)(a1 + 64);
    block[5] = *(_QWORD *)(a1 + 56);
    v6 = v4;
    dispatch_async(v3, block);

  }
}

void __53__ICStorePlatformRequest_performWithResponseHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint64_t v21;
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v8 = *(NSObject **)(a1 + 32);
  v9 = *(NSObject **)(a1 + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__ICStorePlatformRequest_performWithResponseHandler___block_invoke_5;
  block[3] = &unk_1E438B198;
  v23 = *(id *)(a1 + 48);
  v10 = v6;
  v11 = *(_QWORD *)(a1 + 88);
  v24 = v10;
  v27 = v11;
  v12 = v5;
  v13 = *(_QWORD *)(a1 + 56);
  v25 = v12;
  v26 = v13;
  v14 = *(_QWORD *)(a1 + 112);
  v28 = *(_QWORD *)(a1 + 96);
  v29 = v14;
  dispatch_group_async(v8, v9, block);
  v15 = *(_QWORD *)(a1 + 80);
  if (v15 && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24))
  {
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __53__ICStorePlatformRequest_performWithResponseHandler___block_invoke_6;
    v18[3] = &unk_1E4390EA8;
    v17 = *(NSObject **)(a1 + 64);
    v16 = *(_QWORD *)(a1 + 72);
    v21 = v15;
    v18[4] = v16;
    v19 = v12;
    v20 = v10;
    dispatch_async(v17, v18);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __53__ICStorePlatformRequest_performWithResponseHandler___block_invoke_5(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);
  v2 = *(void **)(a1 + 40);
  if (v2)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v2);
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 56), "replaceObjectAtIndex:withObject:", *(_QWORD *)(a1 + 80));
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  }
}

void __53__ICStorePlatformRequest_performWithResponseHandler___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "itemIdentifiers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __53__ICStorePlatformRequest_performWithResponseHandler___block_invoke_8(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  ICStorePlatformResponseGroup *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
    v5 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40);
    v7 = 138543874;
    v8 = v3;
    v9 = 2048;
    v10 = v4;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Request completed with %ld responses. err=%{public}@", (uint8_t *)&v7, 0x20u);
  }

  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24))
  {
    v6 = -[ICStorePlatformResponseGroup initWithResponses:]([ICStorePlatformResponseGroup alloc], "initWithResponses:", a1[5]);
    (*(void (**)(void))(a1[6] + 16))();

  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
}

void __53__ICStorePlatformRequest_performWithResponseHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[4];
  id v4;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__ICStorePlatformRequest_performWithResponseHandler___block_invoke_3;
    block[3] = &unk_1E4390D18;
    v2 = *(NSObject **)(a1 + 32);
    v4 = *(id *)(a1 + 40);
    dispatch_async(v2, block);

  }
}

void __53__ICStorePlatformRequest_performWithResponseHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7004, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

@end
