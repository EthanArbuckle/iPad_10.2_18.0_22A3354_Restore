@implementation WBSRetryableCKModifyRecordZonesOperation

- (NSArray)recordZonesToSave
{
  os_unfair_lock_s *p_internalLock;
  void *v4;

  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)-[NSArray copy](self->_recordZonesToSave, "copy");
  os_unfair_lock_unlock(p_internalLock);
  return (NSArray *)v4;
}

- (void)setRecordZonesToSave:(id)a3
{
  os_unfair_lock_s *p_internalLock;
  id v5;
  NSArray *v6;
  NSArray *recordZonesToSave;

  p_internalLock = &self->super.super._internalLock;
  v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (NSArray *)objc_msgSend(v5, "copy");

  recordZonesToSave = self->_recordZonesToSave;
  self->_recordZonesToSave = v6;

  -[NSMutableSet addObject:](self->super.super._explicitlySetProperties, "addObject:", CFSTR("recordZonesToSave"));
  os_unfair_lock_unlock(p_internalLock);
}

- (NSArray)recordZoneIDsToDelete
{
  os_unfair_lock_s *p_internalLock;
  void *v4;

  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)-[NSArray copy](self->_recordZoneIDsToDelete, "copy");
  os_unfair_lock_unlock(p_internalLock);
  return (NSArray *)v4;
}

- (void)setRecordZoneIDsToDelete:(id)a3
{
  os_unfair_lock_s *p_internalLock;
  id v5;
  NSArray *v6;
  NSArray *recordZoneIDsToDelete;

  p_internalLock = &self->super.super._internalLock;
  v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (NSArray *)objc_msgSend(v5, "copy");

  recordZoneIDsToDelete = self->_recordZoneIDsToDelete;
  self->_recordZoneIDsToDelete = v6;

  -[NSMutableSet addObject:](self->super.super._explicitlySetProperties, "addObject:", CFSTR("recordZoneIDsToDelete"));
  os_unfair_lock_unlock(p_internalLock);
}

- (id)perRecordZoneSaveBlock
{
  os_unfair_lock_s *p_internalLock;
  void *v4;

  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)objc_msgSend(self->_perRecordZoneSaveBlock, "copy");
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setPerRecordZoneSaveBlock:(id)a3
{
  os_unfair_lock_s *p_internalLock;
  id v5;
  void *v6;
  id perRecordZoneSaveBlock;

  p_internalLock = &self->super.super._internalLock;
  v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)objc_msgSend(v5, "copy");

  perRecordZoneSaveBlock = self->_perRecordZoneSaveBlock;
  self->_perRecordZoneSaveBlock = v6;

  -[NSMutableSet addObject:](self->super.super._explicitlySetProperties, "addObject:", CFSTR("perRecordZoneSaveBlock"));
  os_unfair_lock_unlock(p_internalLock);
}

- (id)perRecordZoneDeleteBlock
{
  os_unfair_lock_s *p_internalLock;
  void *v4;

  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)objc_msgSend(self->_perRecordZoneDeleteBlock, "copy");
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setPerRecordZoneDeleteBlock:(id)a3
{
  os_unfair_lock_s *p_internalLock;
  id v5;
  void *v6;
  id perRecordZoneDeleteBlock;

  p_internalLock = &self->super.super._internalLock;
  v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)objc_msgSend(v5, "copy");

  perRecordZoneDeleteBlock = self->_perRecordZoneDeleteBlock;
  self->_perRecordZoneDeleteBlock = v6;

  -[NSMutableSet addObject:](self->super.super._explicitlySetProperties, "addObject:", CFSTR("perRecordZoneDeleteBlock"));
  os_unfair_lock_unlock(p_internalLock);
}

- (id)modifyRecordZonesCompletionBlock
{
  os_unfair_lock_s *p_internalLock;
  void *v4;

  p_internalLock = &self->super.super._internalLock;
  os_unfair_lock_lock(&self->super.super._internalLock);
  v4 = (void *)objc_msgSend(self->_modifyRecordZonesCompletionBlock, "copy");
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setModifyRecordZonesCompletionBlock:(id)a3
{
  os_unfair_lock_s *p_internalLock;
  id v5;
  void *v6;
  id modifyRecordZonesCompletionBlock;

  p_internalLock = &self->super.super._internalLock;
  v5 = a3;
  os_unfair_lock_lock(p_internalLock);
  v6 = (void *)objc_msgSend(v5, "copy");

  modifyRecordZonesCompletionBlock = self->_modifyRecordZonesCompletionBlock;
  self->_modifyRecordZonesCompletionBlock = v6;

  -[NSMutableSet addObject:](self->super.super._explicitlySetProperties, "addObject:", CFSTR("modifyRecordZonesCompletionBlock"));
  os_unfair_lock_unlock(p_internalLock);
}

- (id)_makeOperation
{
  return objc_alloc_init(MEMORY[0x1E0C94EF8]);
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
  id location;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WBSRetryableCKModifyRecordZonesOperation;
  -[WBSRetryableCKDatabaseOperation _setUpOperation:](&v13, sel__setUpOperation_, v4);
  if (-[NSMutableSet containsObject:](self->super.super._explicitlySetProperties, "containsObject:", CFSTR("recordZonesToSave")))objc_msgSend(v4, "setRecordZonesToSave:", self->_recordZonesToSave);
  if (-[NSMutableSet containsObject:](self->super.super._explicitlySetProperties, "containsObject:", CFSTR("recordZoneIDsToDelete")))objc_msgSend(v4, "setRecordZoneIDsToDelete:", self->_recordZoneIDsToDelete);
  v5 = MEMORY[0x1E0C809B0];
  if (self->_perRecordZoneSaveBlock)
  {
    objc_initWeak(&location, self);
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __60__WBSRetryableCKModifyRecordZonesOperation__setUpOperation___block_invoke;
    v10[3] = &unk_1E4B3F0B0;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v4, "setPerRecordZoneSaveBlock:", v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  if (self->_perRecordZoneDeleteBlock)
  {
    objc_initWeak(&location, self);
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __60__WBSRetryableCKModifyRecordZonesOperation__setUpOperation___block_invoke_3;
    v8[3] = &unk_1E4B3F1C8;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v4, "setPerRecordZoneDeleteBlock:", v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  objc_initWeak(&location, self);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __60__WBSRetryableCKModifyRecordZonesOperation__setUpOperation___block_invoke_5;
  v6[3] = &unk_1E4B3F1A0;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v4, "setModifyRecordZonesCompletionBlock:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __60__WBSRetryableCKModifyRecordZonesOperation__setUpOperation___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
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
    v13[2] = __60__WBSRetryableCKModifyRecordZonesOperation__setUpOperation___block_invoke_2;
    v13[3] = &unk_1E4B3EE30;
    v13[4] = WeakRetained;
    v14 = v7;
    v15 = v8;
    v16 = v9;
    objc_msgSend(v12, "addOperationWithBlock:", v13);

  }
}

void __60__WBSRetryableCKModifyRecordZonesOperation__setUpOperation___block_invoke_2(_QWORD *a1)
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
    v3 = (void *)MEMORY[0x1A8599ED0](*(_QWORD *)(a1[4] + 408));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 272));
    v4 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1A8599ED0](v3);

    if (v4)
      ((void (**)(_QWORD, id, _QWORD, _QWORD, _QWORD))v4)[2](v4, v5, a1[5], a1[6], a1[7]);

    WeakRetained = v5;
  }

}

void __60__WBSRetryableCKModifyRecordZonesOperation__setUpOperation___block_invoke_3(uint64_t a1, void *a2, void *a3)
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
    v10[2] = __60__WBSRetryableCKModifyRecordZonesOperation__setUpOperation___block_invoke_4;
    v10[3] = &unk_1E4B2A5F8;
    v10[4] = WeakRetained;
    v11 = v5;
    v12 = v6;
    objc_msgSend(v9, "addOperationWithBlock:", v10);

  }
}

void __60__WBSRetryableCKModifyRecordZonesOperation__setUpOperation___block_invoke_4(_QWORD *a1)
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
    v3 = (void *)MEMORY[0x1A8599ED0](*(_QWORD *)(a1[4] + 416));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 272));
    v4 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1A8599ED0](v3);

    if (v4)
      ((void (**)(_QWORD, id, _QWORD, _QWORD))v4)[2](v4, v5, a1[5], a1[6]);

    WeakRetained = v5;
  }

}

void __60__WBSRetryableCKModifyRecordZonesOperation__setUpOperation___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
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
    v13[2] = __60__WBSRetryableCKModifyRecordZonesOperation__setUpOperation___block_invoke_6;
    v13[3] = &unk_1E4B3EE30;
    v13[4] = WeakRetained;
    v14 = v9;
    v15 = v7;
    v16 = v8;
    objc_msgSend(v12, "addOperationWithBlock:", v13);

  }
}

void __60__WBSRetryableCKModifyRecordZonesOperation__setUpOperation___block_invoke_6(uint64_t a1)
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
    v3 = (void *)MEMORY[0x1A8599ED0](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 424));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 272));
    v4 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1A8599ED0](v3);

    if (v4)
      ((void (**)(_QWORD, _QWORD, id, _QWORD, _QWORD, _QWORD))v4)[2](v4, *(_QWORD *)(a1 + 32), WeakRetained, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
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
  objc_storeStrong(&self->_modifyRecordZonesCompletionBlock, 0);
  objc_storeStrong(&self->_perRecordZoneDeleteBlock, 0);
  objc_storeStrong(&self->_perRecordZoneSaveBlock, 0);
  objc_storeStrong((id *)&self->_recordZoneIDsToDelete, 0);
  objc_storeStrong((id *)&self->_recordZonesToSave, 0);
}

@end
