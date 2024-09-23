@implementation WBSRetryableCKFetchShareMetadataOperation

- (NSArray)shareURLs
{
  os_unfair_lock_s *p_internalLock;
  void *v4;

  p_internalLock = &self->super._internalLock;
  os_unfair_lock_lock(&self->super._internalLock);
  v4 = (void *)-[NSArray copy](self->_shareURLs, "copy");
  os_unfair_lock_unlock(p_internalLock);
  return (NSArray *)v4;
}

- (void)setShareURLs:(id)a3
{
  os_unfair_lock_s *p_internalLock;
  id v5;
  NSArray *v6;
  NSArray *shareURLs;

  p_internalLock = &self->super._internalLock;
  v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (NSArray *)objc_msgSend(v5, "copy");

  shareURLs = self->_shareURLs;
  self->_shareURLs = v6;

  -[NSMutableSet addObject:](self->super._explicitlySetProperties, "addObject:", CFSTR("shareURLs"));
  os_unfair_lock_unlock(p_internalLock);
}

- (NSDictionary)shareInvitationTokensByShareURL
{
  os_unfair_lock_s *p_internalLock;
  void *v4;

  p_internalLock = &self->super._internalLock;
  os_unfair_lock_lock(&self->super._internalLock);
  v4 = (void *)-[NSDictionary copy](self->_shareInvitationTokensByShareURL, "copy");
  os_unfair_lock_unlock(p_internalLock);
  return (NSDictionary *)v4;
}

- (void)setShareInvitationTokensByShareURL:(id)a3
{
  os_unfair_lock_s *p_internalLock;
  id v5;
  NSDictionary *v6;
  NSDictionary *shareInvitationTokensByShareURL;

  p_internalLock = &self->super._internalLock;
  v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (NSDictionary *)objc_msgSend(v5, "copy");

  shareInvitationTokensByShareURL = self->_shareInvitationTokensByShareURL;
  self->_shareInvitationTokensByShareURL = v6;

  -[NSMutableSet addObject:](self->super._explicitlySetProperties, "addObject:", CFSTR("shareInvitationTokensByShareURL"));
  os_unfair_lock_unlock(p_internalLock);
}

- (BOOL)shouldFetchRootRecord
{
  WBSRetryableCKFetchShareMetadataOperation *v2;
  os_unfair_lock_s *p_internalLock;

  v2 = self;
  p_internalLock = &self->super._internalLock;
  os_unfair_lock_lock(&self->super._internalLock);
  LOBYTE(v2) = v2->_shouldFetchRootRecord;
  os_unfair_lock_unlock(p_internalLock);
  return (char)v2;
}

- (void)setShouldFetchRootRecord:(BOOL)a3
{
  os_unfair_lock_s *p_internalLock;

  p_internalLock = &self->super._internalLock;
  os_unfair_lock_lock(&self->super._internalLock);
  self->_shouldFetchRootRecord = a3;
  -[NSMutableSet addObject:](self->super._explicitlySetProperties, "addObject:", CFSTR("shouldFetchRootRecord"));
  os_unfair_lock_unlock(p_internalLock);
}

- (NSArray)rootRecordDesiredKeys
{
  os_unfair_lock_s *p_internalLock;
  void *v4;

  p_internalLock = &self->super._internalLock;
  os_unfair_lock_lock(&self->super._internalLock);
  v4 = (void *)-[NSArray copy](self->_rootRecordDesiredKeys, "copy");
  os_unfair_lock_unlock(p_internalLock);
  return (NSArray *)v4;
}

- (void)setRootRecordDesiredKeys:(id)a3
{
  os_unfair_lock_s *p_internalLock;
  id v5;
  NSArray *v6;
  NSArray *rootRecordDesiredKeys;

  p_internalLock = &self->super._internalLock;
  v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (NSArray *)objc_msgSend(v5, "copy");

  rootRecordDesiredKeys = self->_rootRecordDesiredKeys;
  self->_rootRecordDesiredKeys = v6;

  -[NSMutableSet addObject:](self->super._explicitlySetProperties, "addObject:", CFSTR("rootRecordDesiredKeys"));
  os_unfair_lock_unlock(p_internalLock);
}

- (id)perShareMetadataBlock
{
  os_unfair_lock_s *p_internalLock;
  void *v4;

  p_internalLock = &self->super._internalLock;
  os_unfair_lock_lock(&self->super._internalLock);
  v4 = (void *)objc_msgSend(self->_perShareMetadataBlock, "copy");
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setPerShareMetadataBlock:(id)a3
{
  os_unfair_lock_s *p_internalLock;
  id v5;
  void *v6;
  id perShareMetadataBlock;

  p_internalLock = &self->super._internalLock;
  v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)objc_msgSend(v5, "copy");

  perShareMetadataBlock = self->_perShareMetadataBlock;
  self->_perShareMetadataBlock = v6;

  -[NSMutableSet addObject:](self->super._explicitlySetProperties, "addObject:", CFSTR("perShareMetadataBlock"));
  os_unfair_lock_unlock(p_internalLock);
}

- (id)fetchShareMetadataCompletionBlock
{
  os_unfair_lock_s *p_internalLock;
  void *v4;

  p_internalLock = &self->super._internalLock;
  os_unfair_lock_lock(&self->super._internalLock);
  v4 = (void *)objc_msgSend(self->_fetchShareMetadataCompletionBlock, "copy");
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setFetchShareMetadataCompletionBlock:(id)a3
{
  os_unfair_lock_s *p_internalLock;
  id v5;
  void *v6;
  id fetchShareMetadataCompletionBlock;

  p_internalLock = &self->super._internalLock;
  v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)objc_msgSend(v5, "copy");

  fetchShareMetadataCompletionBlock = self->_fetchShareMetadataCompletionBlock;
  self->_fetchShareMetadataCompletionBlock = v6;

  -[NSMutableSet addObject:](self->super._explicitlySetProperties, "addObject:", CFSTR("fetchShareMetadataCompletionBlock"));
  os_unfair_lock_unlock(p_internalLock);
}

- (id)_makeOperation
{
  return objc_alloc_init(MEMORY[0x1E0C94E38]);
}

- (void)_setUpOperation:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WBSRetryableCKFetchShareMetadataOperation;
  -[WBSRetryableCKOperation _setUpOperation:](&v11, sel__setUpOperation_, v4);
  if (-[NSMutableSet containsObject:](self->super._explicitlySetProperties, "containsObject:", CFSTR("shareURLs")))objc_msgSend(v4, "setShareURLs:", self->_shareURLs);
  if (-[NSMutableSet containsObject:](self->super._explicitlySetProperties, "containsObject:", CFSTR("shareInvitationTokensByShareURL")))objc_msgSend(v4, "setShareInvitationTokensByShareURL:", self->_shareInvitationTokensByShareURL);
  if (-[NSMutableSet containsObject:](self->super._explicitlySetProperties, "containsObject:", CFSTR("shouldFetchRootRecord")))objc_msgSend(v4, "setShouldFetchRootRecord:", self->_shouldFetchRootRecord);
  if (-[NSMutableSet containsObject:](self->super._explicitlySetProperties, "containsObject:", CFSTR("rootRecordDesiredKeys")))objc_msgSend(v4, "setRootRecordDesiredKeys:", self->_rootRecordDesiredKeys);
  v5 = MEMORY[0x1E0C809B0];
  if (self->_perShareMetadataBlock)
  {
    objc_initWeak(&location, self);
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __61__WBSRetryableCKFetchShareMetadataOperation__setUpOperation___block_invoke;
    v8[3] = &unk_1E4B3F0D8;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v4, "setPerShareMetadataBlock:", v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  objc_initWeak(&location, self);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __61__WBSRetryableCKFetchShareMetadataOperation__setUpOperation___block_invoke_3;
  v6[3] = &unk_1E4B3EE80;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v4, "setFetchShareMetadataCompletionBlock:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __61__WBSRetryableCKFetchShareMetadataOperation__setUpOperation___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    v12 = (void *)*((_QWORD *)WeakRetained + 33);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __61__WBSRetryableCKFetchShareMetadataOperation__setUpOperation___block_invoke_2;
    v13[3] = &unk_1E4B3EE30;
    v13[4] = WeakRetained;
    v14 = v7;
    v15 = v8;
    v16 = v9;
    objc_msgSend(v12, "addOperationWithBlock:", v13);

  }
}

void __61__WBSRetryableCKFetchShareMetadataOperation__setUpOperation___block_invoke_2(_QWORD *a1)
{
  id WeakRetained;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 248));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 272));
    v3 = (void *)MEMORY[0x1A8599ED0](*(_QWORD *)(a1[4] + 416));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 272));
    v4 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1A8599ED0](v3);

    if (v4)
      ((void (**)(_QWORD, id, _QWORD, _QWORD, _QWORD))v4)[2](v4, v5, a1[5], a1[6], a1[7]);

    WeakRetained = v5;
  }

}

void __61__WBSRetryableCKFetchShareMetadataOperation__setUpOperation___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (void *)*((_QWORD *)WeakRetained + 33);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __61__WBSRetryableCKFetchShareMetadataOperation__setUpOperation___block_invoke_4;
    v7[3] = &unk_1E4B2A118;
    v7[4] = WeakRetained;
    v8 = v3;
    objc_msgSend(v6, "addOperationWithBlock:", v7);

  }
}

void __61__WBSRetryableCKFetchShareMetadataOperation__setUpOperation___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 248));
  if (WeakRetained
    && (objc_msgSend(*(id *)(a1 + 32), "_scheduleRetryIfNeededForError:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 272));
    v3 = (void *)MEMORY[0x1A8599ED0](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 424));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 272));
    v4 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1A8599ED0](v3);

    if (v4)
      ((void (**)(_QWORD, _QWORD, id, _QWORD))v4)[2](v4, *(_QWORD *)(a1 + 32), WeakRetained, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_DEFAULT, "Operation of %{public}@ did finish successfully", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_didFinishOperation");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchShareMetadataCompletionBlock, 0);
  objc_storeStrong(&self->_perShareMetadataBlock, 0);
  objc_storeStrong((id *)&self->_rootRecordDesiredKeys, 0);
  objc_storeStrong((id *)&self->_shareInvitationTokensByShareURL, 0);
  objc_storeStrong((id *)&self->_shareURLs, 0);
}

@end
