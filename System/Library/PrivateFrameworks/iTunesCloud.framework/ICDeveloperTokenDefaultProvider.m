@implementation ICDeveloperTokenDefaultProvider

+ (ICDeveloperTokenDefaultProvider)sharedProvider
{
  if (sharedProvider_onceToken != -1)
    dispatch_once(&sharedProvider_onceToken, &__block_literal_global_3956);
  return (ICDeveloperTokenDefaultProvider *)(id)sharedProvider___sharedProvider;
}

void __70__ICDeveloperTokenDefaultProvider__fetchDeveloperTokenWithClientInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v17 = v10;
    v18 = 2114;
    v19 = v9;
    v20 = 2048;
    v21 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ developer token fetch completed for clientInfo %{public}@ with %lu handlers", buf, 0x20u);
  }

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__ICDeveloperTokenDefaultProvider__fetchDeveloperTokenWithClientInfo___block_invoke_6;
  v13[3] = &unk_1E438A770;
  v14 = v5;
  v15 = v6;
  v11 = v6;
  v12 = v5;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v13);

}

- (void)fetchDeveloperTokenForClientInfo:(id)a3 completionHandler:(id)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  v14 = (id)objc_msgSend(a3, "copy");
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingCompletionHandlers, "objectForKeyedSubscript:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingCompletionHandlers, "objectForKeyedSubscript:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1A1AFA8D0](v6);

    objc_msgSend(v9, "addObject:", v10);
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pendingCompletionHandlers, "setObject:forKeyedSubscript:", v11, v14);

    -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingCompletionHandlers, "objectForKeyedSubscript:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1A1AFA8D0](v6);

    objc_msgSend(v12, "addObject:", v13);
    os_unfair_lock_unlock(&self->_lock);
    -[ICDeveloperTokenDefaultProvider _fetchDeveloperTokenWithClientInfo:](self, "_fetchDeveloperTokenWithClientInfo:", v14);
  }

}

- (void)_fetchDeveloperTokenWithClientInfo:(id)a3
{
  id v4;
  NSObject *v5;
  ICDeveloperTokenFetchRequest *v6;
  NSOperationQueue *requestOperationQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  ICDeveloperTokenDefaultProvider *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v12 = self;
    v13 = 2114;
    v14 = v4;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ fetching developer token with clientInfo %{public}@", buf, 0x16u);
  }

  v6 = -[ICDeveloperTokenFetchRequest initWithClientInfo:options:]([ICDeveloperTokenFetchRequest alloc], "initWithClientInfo:options:", v4, 0);
  -[ICDeveloperTokenFetchRequest setClientType:](v6, "setClientType:", 0);
  requestOperationQueue = self->_requestOperationQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__ICDeveloperTokenDefaultProvider__fetchDeveloperTokenWithClientInfo___block_invoke;
  v9[3] = &unk_1E438A798;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  -[ICDeveloperTokenFetchRequest performRequestOnOperationQueue:withResponseHandler:](v6, "performRequestOnOperationQueue:withResponseHandler:", requestOperationQueue, v9);

}

uint64_t __70__ICDeveloperTokenDefaultProvider__fetchDeveloperTokenWithClientInfo___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __49__ICDeveloperTokenDefaultProvider_sharedProvider__block_invoke()
{
  ICDeveloperTokenDefaultProvider *v0;
  void *v1;

  v0 = objc_alloc_init(ICDeveloperTokenDefaultProvider);
  v1 = (void *)sharedProvider___sharedProvider;
  sharedProvider___sharedProvider = (uint64_t)v0;

}

- (ICDeveloperTokenDefaultProvider)init
{
  ICDeveloperTokenDefaultProvider *v2;
  ICDeveloperTokenDefaultProvider *v3;
  uint64_t v4;
  NSMutableDictionary *pendingCompletionHandlers;
  NSOperationQueue *v6;
  NSOperationQueue *requestOperationQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICDeveloperTokenDefaultProvider;
  v2 = -[ICDeveloperTokenDefaultProvider init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    pendingCompletionHandlers = v3->_pendingCompletionHandlers;
    v3->_pendingCompletionHandlers = (NSMutableDictionary *)v4;

    v6 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    requestOperationQueue = v3->_requestOperationQueue;
    v3->_requestOperationQueue = v6;

    -[NSOperationQueue setName:](v3->_requestOperationQueue, "setName:", CFSTR("com.apple.iTunesCloud.ICDeveloperTokenDefaultProvider.operationQueue"));
  }
  return v3;
}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_opt_class(), "hash");
}

- (BOOL)isEqual:(id)a3
{
  ICDeveloperTokenDefaultProvider *v4;
  uint64_t v5;
  char v6;

  v4 = (ICDeveloperTokenDefaultProvider *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (-[ICDeveloperTokenDefaultProvider isMemberOfClass:](self, "isMemberOfClass:", v5))
      v6 = -[ICDeveloperTokenDefaultProvider isMemberOfClass:](v4, "isMemberOfClass:", v5);
    else
      v6 = 0;
  }

  return v6;
}

- (ICDeveloperTokenDefaultProvider)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICDeveloperTokenDefaultProvider;
  return -[ICDeveloperTokenDefaultProvider init](&v4, sel_init, a3);
}

- (void)invalidateCachedDeveloperTokenForClientInfo:(id)a3 completionHandler:(id)a4
{
  +[ICDeveloperTokenFetchRequest invalidateCachedDeveloperTokenForClientInfo:clientType:requester:completionHandler:](ICDeveloperTokenFetchRequest, "invalidateCachedDeveloperTokenForClientInfo:clientType:requester:completionHandler:", a3, 0, self, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_requestOperationQueue, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
