@implementation PLAmbientSuggestionComputePayloadAdapter

- (id)payloadForChangedKeys:(id)a3
{
  id v4;
  PLAmbientSuggestionComputeJournalEntryPayload *v5;

  v4 = a3;
  if (-[PLSuggestionComputePayloadAdapter isValidForJournalPersistence](self, "isValidForJournalPersistence"))
    v5 = -[PLManagedObjectJournalEntryPayload initWithInsertAdapter:changedKeys:]([PLAmbientSuggestionComputeJournalEntryPayload alloc], "initWithInsertAdapter:changedKeys:", self, v4);
  else
    v5 = 0;

  return v5;
}

@end
