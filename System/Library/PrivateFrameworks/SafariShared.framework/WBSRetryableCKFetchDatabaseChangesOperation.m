@implementation WBSRetryableCKFetchDatabaseChangesOperation

- (CKServerChangeToken)previousServerChangeToken
{
  os_unfair_lock_s *p_internalLock;
  void *v4;

  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)-[CKServerChangeToken copy](self->_previousServerChangeToken, "copy");
  os_unfair_lock_unlock(p_internalLock);
  return (CKServerChangeToken *)v4;
}

- (void)setPreviousServerChangeToken:(id)a3
{
  os_unfair_lock_s *p_internalLock;
  id v5;
  CKServerChangeToken *v6;
  CKServerChangeToken *previousServerChangeToken;

  p_internalLock = &self->super.super._internalLock;
  v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (CKServerChangeToken *)objc_msgSend(v5, "copy");

  previousServerChangeToken = self->_previousServerChangeToken;
  self->_previousServerChangeToken = v6;

  -[NSMutableSet addObject:](self->super.super._explicitlySetProperties, "addObject:", CFSTR("previousServerChangeToken"));
  os_unfair_lock_unlock(p_internalLock);
}

- (unint64_t)resultsLimit
{
  os_unfair_lock_s *p_internalLock;
  unint64_t resultsLimit;

  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  resultsLimit = self->_resultsLimit;
  os_unfair_lock_unlock(p_internalLock);
  return resultsLimit;
}

- (void)setResultsLimit:(unint64_t)a3
{
  os_unfair_lock_s *p_internalLock;

  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  self->_resultsLimit = a3;
  -[NSMutableSet addObject:](self->super.super._explicitlySetProperties, "addObject:", CFSTR("resultsLimit"));
  os_unfair_lock_unlock(p_internalLock);
}

- (BOOL)fetchAllChanges
{
  WBSRetryableCKFetchDatabaseChangesOperation *v2;
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

- (id)recordZoneWithIDChangedBlock
{
  os_unfair_lock_s *p_internalLock;
  void *v4;

  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)objc_msgSend(self->_recordZoneWithIDChangedBlock, "copy");
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setRecordZoneWithIDChangedBlock:(id)a3
{
  os_unfair_lock_s *p_internalLock;
  id v5;
  void *v6;
  id recordZoneWithIDChangedBlock;

  p_internalLock = &self->super.super._internalLock;
  v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)objc_msgSend(v5, "copy");

  recordZoneWithIDChangedBlock = self->_recordZoneWithIDChangedBlock;
  self->_recordZoneWithIDChangedBlock = v6;

  -[NSMutableSet addObject:](self->super.super._explicitlySetProperties, "addObject:", CFSTR("recordZoneWithIDChangedBlock"));
  os_unfair_lock_unlock(p_internalLock);
}

- (id)recordZoneWithIDWasDeletedBlock
{
  os_unfair_lock_s *p_internalLock;
  void *v4;

  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)objc_msgSend(self->_recordZoneWithIDWasDeletedBlock, "copy");
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setRecordZoneWithIDWasDeletedBlock:(id)a3
{
  os_unfair_lock_s *p_internalLock;
  id v5;
  void *v6;
  id recordZoneWithIDWasDeletedBlock;

  p_internalLock = &self->super.super._internalLock;
  v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)objc_msgSend(v5, "copy");

  recordZoneWithIDWasDeletedBlock = self->_recordZoneWithIDWasDeletedBlock;
  self->_recordZoneWithIDWasDeletedBlock = v6;

  -[NSMutableSet addObject:](self->super.super._explicitlySetProperties, "addObject:", CFSTR("recordZoneWithIDWasDeletedBlock"));
  os_unfair_lock_unlock(p_internalLock);
}

- (id)recordZoneWithIDWasPurgedBlock
{
  os_unfair_lock_s *p_internalLock;
  void *v4;

  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)objc_msgSend(self->_recordZoneWithIDWasPurgedBlock, "copy");
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setRecordZoneWithIDWasPurgedBlock:(id)a3
{
  os_unfair_lock_s *p_internalLock;
  id v5;
  void *v6;
  id recordZoneWithIDWasPurgedBlock;

  p_internalLock = &self->super.super._internalLock;
  v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)objc_msgSend(v5, "copy");

  recordZoneWithIDWasPurgedBlock = self->_recordZoneWithIDWasPurgedBlock;
  self->_recordZoneWithIDWasPurgedBlock = v6;

  -[NSMutableSet addObject:](self->super.super._explicitlySetProperties, "addObject:", CFSTR("recordZoneWithIDWasPurgedBlock"));
  os_unfair_lock_unlock(p_internalLock);
}

- (id)recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock
{
  os_unfair_lock_s *p_internalLock;
  void *v4;

  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)objc_msgSend(self->_recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock, "copy");
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setRecordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock:(id)a3
{
  os_unfair_lock_s *p_internalLock;
  id v5;
  void *v6;
  id recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock;

  p_internalLock = &self->super.super._internalLock;
  v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)objc_msgSend(v5, "copy");

  recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock = self->_recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock;
  self->_recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock = v6;

  -[NSMutableSet addObject:](self->super.super._explicitlySetProperties, "addObject:", CFSTR("recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock"));
  os_unfair_lock_unlock(p_internalLock);
}

- (id)changeTokenUpdatedBlock
{
  os_unfair_lock_s *p_internalLock;
  void *v4;

  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)objc_msgSend(self->_changeTokenUpdatedBlock, "copy");
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setChangeTokenUpdatedBlock:(id)a3
{
  os_unfair_lock_s *p_internalLock;
  id v5;
  void *v6;
  id changeTokenUpdatedBlock;

  p_internalLock = &self->super.super._internalLock;
  v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)objc_msgSend(v5, "copy");

  changeTokenUpdatedBlock = self->_changeTokenUpdatedBlock;
  self->_changeTokenUpdatedBlock = v6;

  -[NSMutableSet addObject:](self->super.super._explicitlySetProperties, "addObject:", CFSTR("changeTokenUpdatedBlock"));
  os_unfair_lock_unlock(p_internalLock);
}

- (id)fetchDatabaseChangesCompletionBlock
{
  os_unfair_lock_s *p_internalLock;
  void *v4;

  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)objc_msgSend(self->_fetchDatabaseChangesCompletionBlock, "copy");
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setFetchDatabaseChangesCompletionBlock:(id)a3
{
  os_unfair_lock_s *p_internalLock;
  id v5;
  void *v6;
  id fetchDatabaseChangesCompletionBlock;

  p_internalLock = &self->super.super._internalLock;
  v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)objc_msgSend(v5, "copy");

  fetchDatabaseChangesCompletionBlock = self->_fetchDatabaseChangesCompletionBlock;
  self->_fetchDatabaseChangesCompletionBlock = v6;

  -[NSMutableSet addObject:](self->super.super._explicitlySetProperties, "addObject:", CFSTR("fetchDatabaseChangesCompletionBlock"));
  os_unfair_lock_unlock(p_internalLock);
}

- (id)_makeOperation
{
  return objc_alloc_init(MEMORY[0x1E0C94DB8]);
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
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WBSRetryableCKFetchDatabaseChangesOperation;
  -[WBSRetryableCKDatabaseOperation _setUpOperation:](&v19, sel__setUpOperation_, v4);
  if (-[NSMutableSet containsObject:](self->super.super._explicitlySetProperties, "containsObject:", CFSTR("previousServerChangeToken")))objc_msgSend(v4, "setPreviousServerChangeToken:", self->_previousServerChangeToken);
  if (-[NSMutableSet containsObject:](self->super.super._explicitlySetProperties, "containsObject:", CFSTR("resultsLimit")))objc_msgSend(v4, "setResultsLimit:", self->_resultsLimit);
  if (-[NSMutableSet containsObject:](self->super.super._explicitlySetProperties, "containsObject:", CFSTR("fetchAllChanges")))objc_msgSend(v4, "setFetchAllChanges:", self->_fetchAllChanges);
  v5 = MEMORY[0x1E0C809B0];
  if (self->_recordZoneWithIDChangedBlock)
  {
    objc_initWeak(&location, self);
    v16[0] = v5;
    v16[1] = 3221225472;
    v16[2] = __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke;
    v16[3] = &unk_1E4B3EEA8;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v4, "setRecordZoneWithIDChangedBlock:", v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  if (self->_recordZoneWithIDWasDeletedBlock)
  {
    objc_initWeak(&location, self);
    v14[0] = v5;
    v14[1] = 3221225472;
    v14[2] = __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_3;
    v14[3] = &unk_1E4B3EEA8;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v4, "setRecordZoneWithIDWasDeletedBlock:", v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  if (self->_recordZoneWithIDWasPurgedBlock)
  {
    objc_initWeak(&location, self);
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_5;
    v12[3] = &unk_1E4B3EEA8;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v4, "setRecordZoneWithIDWasPurgedBlock:", v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  if (self->_recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock)
  {
    objc_initWeak(&location, self);
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_7;
    v10[3] = &unk_1E4B3EEA8;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v4, "setRecordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock:", v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  if (self->_changeTokenUpdatedBlock)
  {
    objc_initWeak(&location, self);
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_9;
    v8[3] = &unk_1E4B3EED0;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v4, "setChangeTokenUpdatedBlock:", v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  objc_initWeak(&location, self);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_11;
  v6[3] = &unk_1E4B3EF20;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v4, "setFetchDatabaseChangesCompletionBlock:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke(uint64_t a1, void *a2)
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
    v7[2] = __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_2;
    v7[3] = &unk_1E4B2A118;
    v7[4] = WeakRetained;
    v8 = v3;
    objc_msgSend(v6, "addOperationWithBlock:", v7);

  }
}

void __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 248));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 272));
    v3 = (void *)MEMORY[0x1A8599ED0](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 416));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 272));
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A8599ED0](v3);

    if (v4)
      ((void (**)(_QWORD, id, _QWORD))v4)[2](v4, v5, *(_QWORD *)(a1 + 40));

    WeakRetained = v5;
  }

}

void __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_3(uint64_t a1, void *a2)
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
    v7[2] = __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_4;
    v7[3] = &unk_1E4B2A118;
    v7[4] = WeakRetained;
    v8 = v3;
    objc_msgSend(v6, "addOperationWithBlock:", v7);

  }
}

void __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 248));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 272));
    v3 = (void *)MEMORY[0x1A8599ED0](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 424));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 272));
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A8599ED0](v3);

    if (v4)
      ((void (**)(_QWORD, id, _QWORD))v4)[2](v4, v5, *(_QWORD *)(a1 + 40));

    WeakRetained = v5;
  }

}

void __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_5(uint64_t a1, void *a2)
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
    v7[2] = __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_6;
    v7[3] = &unk_1E4B2A118;
    v7[4] = WeakRetained;
    v8 = v3;
    objc_msgSend(v6, "addOperationWithBlock:", v7);

  }
}

void __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 248));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 272));
    v3 = (void *)MEMORY[0x1A8599ED0](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 432));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 272));
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A8599ED0](v3);

    if (v4)
      ((void (**)(_QWORD, id, _QWORD))v4)[2](v4, v5, *(_QWORD *)(a1 + 40));

    WeakRetained = v5;
  }

}

void __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_7(uint64_t a1, void *a2)
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
    v7[2] = __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_8;
    v7[3] = &unk_1E4B2A118;
    v7[4] = WeakRetained;
    v8 = v3;
    objc_msgSend(v6, "addOperationWithBlock:", v7);

  }
}

void __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_8(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 248));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 272));
    v3 = (void *)MEMORY[0x1A8599ED0](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 440));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 272));
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A8599ED0](v3);

    if (v4)
      ((void (**)(_QWORD, id, _QWORD))v4)[2](v4, v5, *(_QWORD *)(a1 + 40));

    WeakRetained = v5;
  }

}

void __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_9(uint64_t a1, void *a2)
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
    v7[2] = __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_10;
    v7[3] = &unk_1E4B2A118;
    v7[4] = WeakRetained;
    v8 = v3;
    objc_msgSend(v6, "addOperationWithBlock:", v7);

  }
}

void __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_10(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 248));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 272));
    v3 = (void *)MEMORY[0x1A8599ED0](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 448));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 272));
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A8599ED0](v3);

    if (v4)
      ((void (**)(_QWORD, id, _QWORD))v4)[2](v4, v5, *(_QWORD *)(a1 + 40));

    WeakRetained = v5;
  }

}

void __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_11(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  char v15;

  v7 = a2;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    v11 = (void *)*((_QWORD *)WeakRetained + 33);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_12;
    v12[3] = &unk_1E4B3EEF8;
    v12[4] = WeakRetained;
    v13 = v8;
    v14 = v7;
    v15 = a3;
    objc_msgSend(v11, "addOperationWithBlock:", v12);

  }
}

void __63__WBSRetryableCKFetchDatabaseChangesOperation__setUpOperation___block_invoke_12(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
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
    v3 = (void *)MEMORY[0x1A8599ED0](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 456));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 272));
    v4 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1A8599ED0](v3);

    if (v4)
      ((void (**)(_QWORD, _QWORD, id, _QWORD, _QWORD, _QWORD))v4)[2](v4, *(_QWORD *)(a1 + 32), WeakRetained, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
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
  objc_storeStrong(&self->_fetchDatabaseChangesCompletionBlock, 0);
  objc_storeStrong(&self->_changeTokenUpdatedBlock, 0);
  objc_storeStrong(&self->_recordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock, 0);
  objc_storeStrong(&self->_recordZoneWithIDWasPurgedBlock, 0);
  objc_storeStrong(&self->_recordZoneWithIDWasDeletedBlock, 0);
  objc_storeStrong(&self->_recordZoneWithIDChangedBlock, 0);
  objc_storeStrong((id *)&self->_previousServerChangeToken, 0);
}

@end
