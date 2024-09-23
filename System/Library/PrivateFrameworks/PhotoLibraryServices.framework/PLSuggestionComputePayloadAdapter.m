@implementation PLSuggestionComputePayloadAdapter

- (PLSuggestionComputePayloadAdapter)initWithManagedObject:(id)a3 suggestionTypes:(id)a4
{
  id v6;
  PLSuggestionComputePayloadAdapter *v7;
  uint64_t v8;
  NSSet *suggestionTypes;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PLSuggestionComputePayloadAdapter;
  v7 = -[PLJournalEntryPayloadUpdateAdapter initWithManagedObject:](&v11, sel_initWithManagedObject_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    suggestionTypes = v7->_suggestionTypes;
    v7->_suggestionTypes = (NSSet *)v8;

  }
  return v7;
}

- (BOOL)isValidForJournalPersistence
{
  NSSet *suggestionTypes;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;

  suggestionTypes = self->_suggestionTypes;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[PLSuggestionComputePayloadAdapter suggestion](self, "suggestion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedShort:", objc_msgSend(v5, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NSSet containsObject:](suggestionTypes, "containsObject:", v6);

  if (v7)
  {
    -[PLSuggestionComputePayloadAdapter suggestion](self, "suggestion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "keyAssets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count") == 1)
    {
      objc_msgSend(v9, "anyObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v7) = objc_msgSend(v10, "trashedState") == 0;

    }
    else
    {
      LOBYTE(v7) = 0;
    }

  }
  return v7;
}

- (id)payloadID
{
  void *v2;
  void *v3;
  void *v4;

  -[PLSuggestionComputePayloadAdapter suggestion](self, "suggestion");
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
  PLSuggestionComputeJournalEntryPayload *v5;

  v4 = a3;
  if (-[PLSuggestionComputePayloadAdapter isValidForJournalPersistence](self, "isValidForJournalPersistence"))
    v5 = -[PLManagedObjectJournalEntryPayload initWithInsertAdapter:changedKeys:]([PLSuggestionComputeJournalEntryPayload alloc], "initWithInsertAdapter:changedKeys:", self, v4);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionTypes, 0);
}

@end
