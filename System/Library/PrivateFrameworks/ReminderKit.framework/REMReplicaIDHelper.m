@implementation REMReplicaIDHelper

+ (id)replicaUUIDForCreation
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
}

+ (id)nonEditingReplicaUUID
{
  if (nonEditingReplicaUUID_onceToken != -1)
    dispatch_once(&nonEditingReplicaUUID_onceToken, &__block_literal_global_21);
  return (id)nonEditingReplicaUUID_replicaUUID;
}

void __43__REMReplicaIDHelper_nonEditingReplicaUUID__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)nonEditingReplicaUUID_replicaUUID;
  nonEditingReplicaUUID_replicaUUID = v0;

}

- (REMReplicaIDHelper)initWithReplicaIDSource:(id)a3 owner:(id)a4 replicaClockProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  REMReplicaIDHelper *v12;
  REMReplicaIDHelper *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)REMReplicaIDHelper;
  v12 = -[REMReplicaIDHelper init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_replicaIDSource, a3);
    objc_storeWeak((id *)&v13->_owner, v10);
    objc_storeStrong((id *)&v13->_replicaClockProvider, a5);
  }

  return v13;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_acquiredReplicaUUID)
  {
    -[REMReplicaIDHelper replicaManager](self, "replicaManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "returnReplicaForClient:", self);

  }
  v4.receiver = self;
  v4.super_class = (Class)REMReplicaIDHelper;
  -[REMReplicaIDHelper dealloc](&v4, sel_dealloc);
}

- (void)willEdit
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_FAULT, "rem_log_fault_if (!self.owner) -- Editting REMReplicaIDHelper without an owner {replicaIDHelper: %@}", (uint8_t *)&v2, 0xCu);
}

- (void)didSerialize
{
  void *v3;
  id v4;

  -[REMReplicaIDHelper acquiredReplicaUUID](self, "acquiredReplicaUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[REMReplicaIDHelper replicaManager](self, "replicaManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateVersionForClient:", self);

  }
}

- (REMReplicaManager)replicaManager
{
  _REMDefaultReplicaManagerProvider *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[REMReplicaIDHelper lazilyCachedReplicaManagerProvider](self, "lazilyCachedReplicaManagerProvider");
  v3 = (_REMDefaultReplicaManagerProvider *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[REMReplicaIDHelper owner](self, "owner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "replicaManagerProvider");
    v3 = (_REMDefaultReplicaManagerProvider *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      v3 = -[_REMDefaultReplicaManagerProvider initWithStore:]([_REMDefaultReplicaManagerProvider alloc], "initWithStore:", 0);
    -[REMReplicaIDHelper setLazilyCachedReplicaManagerProvider:](self, "setLazilyCachedReplicaManagerProvider:", v3);
  }
  -[REMReplicaIDHelper replicaIDSource](self, "replicaIDSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_REMDefaultReplicaManagerProvider replicaManagerForAccountID:](v3, "replicaManagerForAccountID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (REMReplicaManager *)v7;
}

- (NSString)crdtID
{
  void *v2;
  void *v3;

  -[REMReplicaIDHelper replicaIDSource](self, "replicaIDSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "crdtID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)clockElementListForReplicaUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[REMReplicaIDHelper replicaClockProvider](self, "replicaClockProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clockElementListForReplicaUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (REMReplicaClockProviding)replicaClockProvider
{
  return self->_replicaClockProvider;
}

- (void)setReplicaClockProvider:(id)a3
{
  objc_storeStrong((id *)&self->_replicaClockProvider, a3);
}

- (REMReplicaIDSource)replicaIDSource
{
  return self->_replicaIDSource;
}

- (void)setReplicaIDSource:(id)a3
{
  objc_storeStrong((id *)&self->_replicaIDSource, a3);
}

- (REMReplicaIDHelperOwner)owner
{
  return (REMReplicaIDHelperOwner *)objc_loadWeakRetained((id *)&self->_owner);
}

- (void)setOwner:(id)a3
{
  objc_storeWeak((id *)&self->_owner, a3);
}

- (NSUUID)acquiredReplicaUUID
{
  return self->_acquiredReplicaUUID;
}

- (void)setAcquiredReplicaUUID:(id)a3
{
  objc_storeStrong((id *)&self->_acquiredReplicaUUID, a3);
}

- (REMReplicaManagerProviding)lazilyCachedReplicaManagerProvider
{
  return self->_lazilyCachedReplicaManagerProvider;
}

- (void)setLazilyCachedReplicaManagerProvider:(id)a3
{
  objc_storeStrong((id *)&self->_lazilyCachedReplicaManagerProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazilyCachedReplicaManagerProvider, 0);
  objc_storeStrong((id *)&self->_acquiredReplicaUUID, 0);
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_replicaIDSource, 0);
  objc_storeStrong((id *)&self->_replicaClockProvider, 0);
}

@end
