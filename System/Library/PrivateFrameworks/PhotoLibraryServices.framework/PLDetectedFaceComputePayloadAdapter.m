@implementation PLDetectedFaceComputePayloadAdapter

- (BOOL)isValidForJournalPersistence
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;

  -[PLDetectedFaceComputePayloadAdapter face](self, "face");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetForFace");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v9 = 0;
LABEL_9:

    return v9;
  }
  v5 = (void *)v4;
  -[PLDetectedFaceComputePayloadAdapter face](self, "face");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetForFace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "trashedState");

  if (!v8)
  {
    -[PLDetectedFaceComputePayloadAdapter face](self, "face");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "personForFace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[PLDetectedFaceComputePayloadAdapter face](self, "face");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "personForFace");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v12, "verifiedType") != 0;

    }
    else
    {
      v9 = 0;
    }

    goto LABEL_9;
  }
  return 0;
}

- (id)payloadID
{
  void *v2;
  void *v3;
  void *v4;

  -[PLDetectedFaceComputePayloadAdapter face](self, "face");
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
  PLDetectedFaceComputeJournalEntryPayload *v5;

  v4 = a3;
  if (-[PLDetectedFaceComputePayloadAdapter isValidForJournalPersistence](self, "isValidForJournalPersistence"))
    v5 = -[PLManagedObjectJournalEntryPayload initWithInsertAdapter:changedKeys:]([PLDetectedFaceComputeJournalEntryPayload alloc], "initWithInsertAdapter:changedKeys:", self, v4);
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
