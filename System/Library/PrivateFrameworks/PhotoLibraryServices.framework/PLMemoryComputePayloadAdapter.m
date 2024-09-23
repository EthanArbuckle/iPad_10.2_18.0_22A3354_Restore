@implementation PLMemoryComputePayloadAdapter

- (BOOL)isValidForJournalPersistence
{
  void *v3;
  void *v4;
  int v5;

  -[PLMemoryComputePayloadAdapter memory](self, "memory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "pendingState") == 2)
  {
    -[PLMemoryComputePayloadAdapter memory](self, "memory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "rejected") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)payloadID
{
  void *v2;
  void *v3;
  void *v4;

  -[PLMemoryComputePayloadAdapter memory](self, "memory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:](PLJournalEntryPayloadIDFactory, "payloadIDWithUUIDString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)payloadForChangedKeys:(id)a3
{
  id v4;
  PLMemoryComputeJournalEntryPayload *v5;

  v4 = a3;
  if (-[PLMemoryComputePayloadAdapter isValidForJournalPersistence](self, "isValidForJournalPersistence"))
    v5 = -[PLManagedObjectJournalEntryPayload initWithInsertAdapter:changedKeys:]([PLMemoryComputeJournalEntryPayload alloc], "initWithInsertAdapter:changedKeys:", self, v4);
  else
    v5 = 0;

  return v5;
}

- (id)payloadIDForTombstone:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("uuid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:](PLJournalEntryPayloadIDFactory, "payloadIDWithUUIDString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
