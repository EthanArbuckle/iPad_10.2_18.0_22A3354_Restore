@implementation WBSRetryableCKFetchRecordZoneChangesOperation

- (NSArray)recordZoneIDs
{
  os_unfair_lock_s *p_internalLock;
  void *v4;

  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)-[NSArray copy](self->_recordZoneIDs, "copy");
  os_unfair_lock_unlock(p_internalLock);
  return (NSArray *)v4;
}

- (void)setRecordZoneIDs:(id)a3
{
  os_unfair_lock_s *p_internalLock;
  id v5;
  NSArray *v6;
  NSArray *recordZoneIDs;

  p_internalLock = &self->super.super._internalLock;
  v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (NSArray *)objc_msgSend(v5, "copy");

  recordZoneIDs = self->_recordZoneIDs;
  self->_recordZoneIDs = v6;

  -[NSMutableSet addObject:](self->super.super._explicitlySetProperties, "addObject:", CFSTR("recordZoneIDs"));
  os_unfair_lock_unlock(p_internalLock);
}

- (NSDictionary)configurationsByRecordZoneID
{
  os_unfair_lock_s *p_internalLock;
  void *v4;

  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)-[NSDictionary copy](self->_configurationsByRecordZoneID, "copy");
  os_unfair_lock_unlock(p_internalLock);
  return (NSDictionary *)v4;
}

- (void)setConfigurationsByRecordZoneID:(id)a3
{
  os_unfair_lock_s *p_internalLock;
  id v5;
  NSDictionary *v6;
  NSDictionary *configurationsByRecordZoneID;

  p_internalLock = &self->super.super._internalLock;
  v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (NSDictionary *)objc_msgSend(v5, "copy");

  configurationsByRecordZoneID = self->_configurationsByRecordZoneID;
  self->_configurationsByRecordZoneID = v6;

  -[NSMutableSet addObject:](self->super.super._explicitlySetProperties, "addObject:", CFSTR("configurationsByRecordZoneID"));
  os_unfair_lock_unlock(p_internalLock);
}

- (BOOL)fetchAllChanges
{
  WBSRetryableCKFetchRecordZoneChangesOperation *v2;
  os_unfair_lock_s *p_internalLock;

  v2 = self;
  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  LOBYTE(v2) = v2->_fetchAllChanges;
  os_unfair_lock_unlock(p_internalLock);
  return (char)v2;
}

- (void)setFetchAllChanges:(BOOL)a3
{
  os_unfair_lock_s *p_internalLock;

  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  self->_fetchAllChanges = a3;
  -[NSMutableSet addObject:](self->super.super._explicitlySetProperties, "addObject:", CFSTR("fetchAllChanges"));
  os_unfair_lock_unlock(p_internalLock);
}

- (id)recordWasChangedBlock
{
  os_unfair_lock_s *p_internalLock;
  void *v4;

  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)objc_msgSend(self->_recordWasChangedBlock, "copy");
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setRecordWasChangedBlock:(id)a3
{
  os_unfair_lock_s *p_internalLock;
  id v5;
  void *v6;
  id recordWasChangedBlock;

  p_internalLock = &self->super.super._internalLock;
  v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)objc_msgSend(v5, "copy");

  recordWasChangedBlock = self->_recordWasChangedBlock;
  self->_recordWasChangedBlock = v6;

  -[NSMutableSet addObject:](self->super.super._explicitlySetProperties, "addObject:", CFSTR("recordWasChangedBlock"));
  os_unfair_lock_unlock(p_internalLock);
}

- (id)recordWithIDWasDeletedBlock
{
  os_unfair_lock_s *p_internalLock;
  void *v4;

  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)objc_msgSend(self->_recordWithIDWasDeletedBlock, "copy");
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setRecordWithIDWasDeletedBlock:(id)a3
{
  os_unfair_lock_s *p_internalLock;
  id v5;
  void *v6;
  id recordWithIDWasDeletedBlock;

  p_internalLock = &self->super.super._internalLock;
  v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)objc_msgSend(v5, "copy");

  recordWithIDWasDeletedBlock = self->_recordWithIDWasDeletedBlock;
  self->_recordWithIDWasDeletedBlock = v6;

  -[NSMutableSet addObject:](self->super.super._explicitlySetProperties, "addObject:", CFSTR("recordWithIDWasDeletedBlock"));
  os_unfair_lock_unlock(p_internalLock);
}

- (id)recordZoneChangeTokensUpdatedBlock
{
  os_unfair_lock_s *p_internalLock;
  void *v4;

  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)objc_msgSend(self->_recordZoneChangeTokensUpdatedBlock, "copy");
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setRecordZoneChangeTokensUpdatedBlock:(id)a3
{
  os_unfair_lock_s *p_internalLock;
  id v5;
  void *v6;
  id recordZoneChangeTokensUpdatedBlock;

  p_internalLock = &self->super.super._internalLock;
  v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)objc_msgSend(v5, "copy");

  recordZoneChangeTokensUpdatedBlock = self->_recordZoneChangeTokensUpdatedBlock;
  self->_recordZoneChangeTokensUpdatedBlock = v6;

  -[NSMutableSet addObject:](self->super.super._explicitlySetProperties, "addObject:", CFSTR("recordZoneChangeTokensUpdatedBlock"));
  os_unfair_lock_unlock(p_internalLock);
}

- (id)recordZoneFetchCompletionBlock
{
  os_unfair_lock_s *p_internalLock;
  void *v4;

  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)objc_msgSend(self->_recordZoneFetchCompletionBlock, "copy");
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setRecordZoneFetchCompletionBlock:(id)a3
{
  os_unfair_lock_s *p_internalLock;
  id v5;
  void *v6;
  id recordZoneFetchCompletionBlock;

  p_internalLock = &self->super.super._internalLock;
  v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)objc_msgSend(v5, "copy");

  recordZoneFetchCompletionBlock = self->_recordZoneFetchCompletionBlock;
  self->_recordZoneFetchCompletionBlock = v6;

  -[NSMutableSet addObject:](self->super.super._explicitlySetProperties, "addObject:", CFSTR("recordZoneFetchCompletionBlock"));
  os_unfair_lock_unlock(p_internalLock);
}

- (id)fetchRecordZoneChangesCompletionBlock
{
  os_unfair_lock_s *p_internalLock;
  void *v4;

  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)objc_msgSend(self->_fetchRecordZoneChangesCompletionBlock, "copy");
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setFetchRecordZoneChangesCompletionBlock:(id)a3
{
  os_unfair_lock_s *p_internalLock;
  id v5;
  void *v6;
  id fetchRecordZoneChangesCompletionBlock;

  p_internalLock = &self->super.super._internalLock;
  v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)objc_msgSend(v5, "copy");

  fetchRecordZoneChangesCompletionBlock = self->_fetchRecordZoneChangesCompletionBlock;
  self->_fetchRecordZoneChangesCompletionBlock = v6;

  -[NSMutableSet addObject:](self->super.super._explicitlySetProperties, "addObject:", CFSTR("fetchRecordZoneChangesCompletionBlock"));
  os_unfair_lock_unlock(p_internalLock);
}

- (id)_makeOperation
{
  return objc_alloc_init(MEMORY[0x1E0C94DE0]);
}

- (void)_setUpOperation:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WBSRetryableCKFetchRecordZoneChangesOperation;
  -[WBSRetryableCKDatabaseOperation _setUpOperation:](&v17, sel__setUpOperation_, v4);
  if (-[NSMutableSet containsObject:](self->super.super._explicitlySetProperties, "containsObject:", CFSTR("recordZoneIDs")))objc_msgSend(v4, "setRecordZoneIDs:", self->_recordZoneIDs);
  if (-[NSMutableSet containsObject:](self->super.super._explicitlySetProperties, "containsObject:", CFSTR("configurationsByRecordZoneID")))objc_msgSend(v4, "setConfigurationsByRecordZoneID:", self->_configurationsByRecordZoneID);
  if (-[NSMutableSet containsObject:](self->super.super._explicitlySetProperties, "containsObject:", CFSTR("fetchAllChanges")))objc_msgSend(v4, "setFetchAllChanges:", self->_fetchAllChanges);
  v5 = MEMORY[0x1E0C809B0];
  if (self->_recordWasChangedBlock)
  {
    objc_initWeak(&location, self);
    v14[0] = v5;
    v14[1] = 3221225472;
    v14[2] = __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke;
    v14[3] = &unk_1E4B3EFE8;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v4, "setRecordWasChangedBlock:", v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  if (self->_recordWithIDWasDeletedBlock)
  {
    objc_initWeak(&location, self);
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke_3;
    v12[3] = &unk_1E4B3F010;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v4, "setRecordWithIDWasDeletedBlock:", v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  if (self->_recordZoneChangeTokensUpdatedBlock)
  {
    objc_initWeak(&location, self);
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke_5;
    v10[3] = &unk_1E4B3F038;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v4, "setRecordZoneChangeTokensUpdatedBlock:", v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  if (self->_recordZoneFetchCompletionBlock)
  {
    objc_initWeak(&location, self);
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke_7;
    v8[3] = &unk_1E4B3F088;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v4, "setRecordZoneFetchCompletionBlock:", v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  objc_initWeak(&location, self);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke_9;
  v6[3] = &unk_1E4B3EE80;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v4, "setFetchRecordZoneChangesCompletionBlock:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
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
    v13[2] = __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke_2;
    v13[3] = &unk_1E4B3EE30;
    v13[4] = WeakRetained;
    v14 = v7;
    v15 = v8;
    v16 = v9;
    objc_msgSend(v12, "addOperationWithBlock:", v13);

  }
}

void __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke_2(_QWORD *a1)
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

void __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = (void *)*((_QWORD *)WeakRetained + 33);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke_4;
    v10[3] = &unk_1E4B2A5F8;
    v10[4] = WeakRetained;
    v11 = v5;
    v12 = v6;
    objc_msgSend(v9, "addOperationWithBlock:", v10);

  }
}

void __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke_4(_QWORD *a1)
{
  id WeakRetained;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 248));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 272));
    v3 = (void *)MEMORY[0x1A8599ED0](*(_QWORD *)(a1[4] + 424));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 272));
    v4 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1A8599ED0](v3);

    if (v4)
      ((void (**)(_QWORD, id, _QWORD, _QWORD))v4)[2](v4, v5, a1[5], a1[6]);

    WeakRetained = v5;
  }

}

void __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
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
    v13[2] = __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke_6;
    v13[3] = &unk_1E4B3EE30;
    v13[4] = WeakRetained;
    v14 = v7;
    v15 = v8;
    v16 = v9;
    objc_msgSend(v12, "addOperationWithBlock:", v13);

  }
}

void __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke_6(_QWORD *a1)
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
    v3 = (void *)MEMORY[0x1A8599ED0](*(_QWORD *)(a1[4] + 432));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 272));
    v4 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1A8599ED0](v3);

    if (v4)
      ((void (**)(_QWORD, id, _QWORD, _QWORD, _QWORD))v4)[2](v4, v5, a1[5], a1[6], a1[7]);

    WeakRetained = v5;
  }

}

void __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke_7(uint64_t a1, void *a2, void *a3, void *a4, char a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id WeakRetained;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  char v23;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v16 = WeakRetained;
  if (WeakRetained)
  {
    v17 = (void *)*((_QWORD *)WeakRetained + 33);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke_8;
    v18[3] = &unk_1E4B3F060;
    v18[4] = WeakRetained;
    v19 = v11;
    v20 = v12;
    v21 = v13;
    v23 = a5;
    v22 = v14;
    objc_msgSend(v17, "addOperationWithBlock:", v18);

  }
}

void __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke_8(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 248));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 272));
    v3 = (void *)MEMORY[0x1A8599ED0](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 440));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 272));
    v4 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1A8599ED0](v3);

    if (v4)
      ((void (**)(_QWORD, id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v4)[2](v4, v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 64));

    WeakRetained = v5;
  }

}

void __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke_9(uint64_t a1, void *a2)
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
    v7[2] = __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke_10;
    v7[3] = &unk_1E4B2A118;
    v7[4] = WeakRetained;
    v8 = v3;
    objc_msgSend(v6, "addOperationWithBlock:", v7);

  }
}

void __65__WBSRetryableCKFetchRecordZoneChangesOperation__setUpOperation___block_invoke_10(uint64_t a1)
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
    v3 = (void *)MEMORY[0x1A8599ED0](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 448));
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
  objc_storeStrong(&self->_fetchRecordZoneChangesCompletionBlock, 0);
  objc_storeStrong(&self->_recordZoneFetchCompletionBlock, 0);
  objc_storeStrong(&self->_recordZoneChangeTokensUpdatedBlock, 0);
  objc_storeStrong(&self->_recordWithIDWasDeletedBlock, 0);
  objc_storeStrong(&self->_recordWasChangedBlock, 0);
  objc_storeStrong((id *)&self->_configurationsByRecordZoneID, 0);
  objc_storeStrong((id *)&self->_recordZoneIDs, 0);
}

@end
