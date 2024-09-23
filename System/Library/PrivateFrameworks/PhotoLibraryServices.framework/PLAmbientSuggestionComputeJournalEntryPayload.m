@implementation PLAmbientSuggestionComputeJournalEntryPayload

+ (id)payloadClassID
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Ambient%@Compute"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (unsigned)payloadVersion
{
  return 1;
}

+ (unsigned)minimumSnapshotPayloadVersion
{
  return 1;
}

+ (id)snapshotSortDescriptors
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)supportedSuggestionTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E3763FB0);
}

+ (id)payloadAdapterForManagedObject:(id)a3
{
  id v4;
  PLAmbientSuggestionComputePayloadAdapter *v5;
  void *v6;
  PLAmbientSuggestionComputePayloadAdapter *v7;

  v4 = a3;
  v5 = [PLAmbientSuggestionComputePayloadAdapter alloc];
  objc_msgSend(a1, "supportedSuggestionTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PLSuggestionComputePayloadAdapter initWithManagedObject:suggestionTypes:](v5, "initWithManagedObject:suggestionTypes:", v4, v6);

  return v7;
}

+ (BOOL)isValidForPersistenceWithObjectDictionary:(id)a3 additionalEntityName:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "supportedSuggestionTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "isValidForPersistenceWithObjectDictionary:additionalEntityName:suggestionTypes:", v7, v6, v8);

  return (char)a1;
}

@end
