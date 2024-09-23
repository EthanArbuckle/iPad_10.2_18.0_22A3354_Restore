@implementation SBKSyncResponseDataKeyEnumerator

- (SBKSyncResponseDataKeyEnumerator)initWithResponseData:(id)a3
{
  id v5;
  SBKSyncResponseDataKeyEnumerator *v6;
  SBKSyncResponseDataKeyEnumerator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBKSyncResponseDataKeyEnumerator;
  v6 = -[SBKSyncResponseDataKeyEnumerator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_responseData, a3);

  return v7;
}

- (void)enumerateKeysInResponseForTransaction:(id)a3 completionBlock:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id completionBlock;
  void *v11;
  NSEnumerator *v12;
  NSEnumerator *updatedKeysEnumerator;
  void *v14;
  NSEnumerator *v15;
  NSEnumerator *conflictedKeysEnumerator;
  void *v17;
  NSEnumerator *v18;
  NSEnumerator *deletedKeysEnumerator;

  objc_storeStrong((id *)&self->_transaction, a3);
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x2207AF7FC]();

  completionBlock = self->_completionBlock;
  self->_completionBlock = v9;

  -[SBKSyncResponseData updatedKeys](self->_responseData, "updatedKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectEnumerator");
  v12 = (NSEnumerator *)objc_claimAutoreleasedReturnValue();
  updatedKeysEnumerator = self->_updatedKeysEnumerator;
  self->_updatedKeysEnumerator = v12;

  -[SBKSyncResponseData conflictedKeys](self->_responseData, "conflictedKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectEnumerator");
  v15 = (NSEnumerator *)objc_claimAutoreleasedReturnValue();
  conflictedKeysEnumerator = self->_conflictedKeysEnumerator;
  self->_conflictedKeysEnumerator = v15;

  -[SBKSyncResponseData deletedKeys](self->_responseData, "deletedKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectEnumerator");
  v18 = (NSEnumerator *)objc_claimAutoreleasedReturnValue();
  deletedKeysEnumerator = self->_deletedKeysEnumerator;
  self->_deletedKeysEnumerator = v18;

  self->_resolvedConflictsNeedSyncToServer = 0;
  -[SBKSyncResponseDataKeyEnumerator _processNextKey](self, "_processNextKey");
}

- (void)_processUpdatedKey:(id)a3 isConflict:(BOOL)a4 isDirty:(BOOL *)a5
{
  _BOOL8 v6;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v10 = a3;
  -[SBKSyncResponseData payloadDataForUpdateResponseKey:](self->_responseData, "payloadDataForUpdateResponseKey:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[SBKSyncTransaction transactionProcessor](self->_transaction, "transactionProcessor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "transaction:processUpdatedKey:data:conflict:isDirty:", self->_transaction, v10, v8, v6, a5);

  }
}

- (void)_processDeletedKey:(id)a3 isDirty:(BOOL *)a4
{
  SBKSyncTransaction *transaction;
  id v7;
  id v8;

  transaction = self->_transaction;
  v7 = a3;
  -[SBKSyncTransaction transactionProcessor](transaction, "transactionProcessor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transaction:processDeletedKey:isDirty:", self->_transaction, v7, a4);

}

- (void)_processNextKey
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (**completionBlock)(id, BOOL);
  unsigned __int8 v8;

  v3 = 0;
  while (1)
  {
    v8 = 0;
    -[NSEnumerator nextObject](self->_updatedKeysEnumerator, "nextObject");
    v4 = objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[SBKSyncResponseDataKeyEnumerator _processUpdatedKey:isConflict:isDirty:](self, "_processUpdatedKey:isConflict:isDirty:", v4, 0, &v8);
      v3 = (void *)v4;
      goto LABEL_8;
    }
    -[NSEnumerator nextObject](self->_conflictedKeysEnumerator, "nextObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v3 = (void *)v5;
      -[SBKSyncResponseDataKeyEnumerator _processUpdatedKey:isConflict:isDirty:](self, "_processUpdatedKey:isConflict:isDirty:", v5, 1, &v8);
      goto LABEL_8;
    }
    -[NSEnumerator nextObject](self->_deletedKeysEnumerator, "nextObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
      break;
    v3 = (void *)v6;
    -[SBKSyncResponseDataKeyEnumerator _processDeletedKey:isDirty:](self, "_processDeletedKey:isDirty:", v6, &v8);
LABEL_8:
    self->_resolvedConflictsNeedSyncToServer = (self->_resolvedConflictsNeedSyncToServer | v8) != 0;
  }
  completionBlock = (void (**)(id, BOOL))self->_completionBlock;
  if (completionBlock)
    completionBlock[2](completionBlock, self->_resolvedConflictsNeedSyncToServer);
}

- (SBKSyncResponseData)responseData
{
  return self->_responseData;
}

- (void)setResponseData:(id)a3
{
  objc_storeStrong((id *)&self->_responseData, a3);
}

- (SBKSyncTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)resolvedConflictsNeedSyncToServer
{
  return self->_resolvedConflictsNeedSyncToServer;
}

- (void)setResolvedConflictsNeedSyncToServer:(BOOL)a3
{
  self->_resolvedConflictsNeedSyncToServer = a3;
}

- (NSEnumerator)updatedKeysEnumerator
{
  return self->_updatedKeysEnumerator;
}

- (void)setUpdatedKeysEnumerator:(id)a3
{
  objc_storeStrong((id *)&self->_updatedKeysEnumerator, a3);
}

- (NSEnumerator)conflictedKeysEnumerator
{
  return self->_conflictedKeysEnumerator;
}

- (void)setConflictedKeysEnumerator:(id)a3
{
  objc_storeStrong((id *)&self->_conflictedKeysEnumerator, a3);
}

- (NSEnumerator)deletedKeysEnumerator
{
  return self->_deletedKeysEnumerator;
}

- (void)setDeletedKeysEnumerator:(id)a3
{
  objc_storeStrong((id *)&self->_deletedKeysEnumerator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedKeysEnumerator, 0);
  objc_storeStrong((id *)&self->_conflictedKeysEnumerator, 0);
  objc_storeStrong((id *)&self->_updatedKeysEnumerator, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_responseData, 0);
}

@end
