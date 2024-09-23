@implementation PLFetchingAlbumJournalEntryPayload

+ (id)nonPersistedModelPropertiesDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___PLFetchingAlbumJournalEntryPayload;
  objc_msgSendSuper2(&v11, sel_nonPersistedModelPropertiesDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithDictionary:", v4);

  v12[0] = CFSTR("customQueryParameters");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v12[1] = CFSTR("customQueryType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  v12[2] = CFSTR("searchIndexRebuildState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v9);

  return v5;
}

+ (id)modelProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__PLFetchingAlbumJournalEntryPayload_modelProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (modelProperties_onceToken_46701 != -1)
    dispatch_once(&modelProperties_onceToken_46701, block);
  return (id)modelProperties_modelProperties_46702;
}

+ (id)persistedPropertyNamesForEntityNames
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__PLFetchingAlbumJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (persistedPropertyNamesForEntityNames_onceToken_46699 != -1)
    dispatch_once(&persistedPropertyNamesForEntityNames_onceToken_46699, block);
  return (id)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_46700;
}

+ (id)payloadClassID
{
  return +[PLFetchingAlbum entityName](PLFetchingAlbum, "entityName");
}

+ (unsigned)payloadVersion
{
  return 2;
}

+ (unsigned)minimumSnapshotPayloadVersion
{
  return 1;
}

+ (BOOL)isValidForPersistenceWithObjectDictionary:(id)a3 additionalEntityName:(id)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[PLFetchingAlbum validKindsForPersistence](PLFetchingAlbum, "validKindsForPersistence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kind"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6);
  return (char)v4;
}

void __74__PLFetchingAlbumJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "persistedPropertyNamesForEntityNamesFromModelProperties");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_46700;
  persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_46700 = v1;

}

uint64_t __53__PLFetchingAlbumJournalEntryPayload_modelProperties__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "modelPropertiesDescription");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)modelProperties_modelProperties_46702;
  modelProperties_modelProperties_46702 = v2;

  return objc_msgSend(*(id *)(a1 + 32), "loadModelPropertiesDescription:parentPayloadProperty:", modelProperties_modelProperties_46702, 0);
}

- (id)insertAlbumFromDataInManagedObjectContext:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGenericAlbum insertNewSmartAlbumIntoLibrary:](PLGenericAlbum, "insertNewSmartAlbumIntoLibrary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)migrateMergedPayloadWithUpdatePayloads:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (-[PLManagedObjectJournalEntryPayload payloadVersion](self, "payloadVersion") <= 1)
    -[PLFetchingAlbumJournalEntryPayload _fixHasLocationSmartAlbum](self, "_fixHasLocationSmartAlbum");
  v5.receiver = self;
  v5.super_class = (Class)PLFetchingAlbumJournalEntryPayload;
  -[PLManagedObjectJournalEntryPayload migrateMergedPayloadWithUpdatePayloads:](&v5, sel_migrateMergedPayloadWithUpdatePayloads_, v4);

}

- (void)_fixHasLocationSmartAlbum
{
  void *v3;
  void *v4;
  id v5;

  -[PLGenericAlbumJournalEntryPayload userQueryData](self, "userQueryData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[PLQueryHandler constructQueryFromData:](PLQueryHandler, "constructQueryFromData:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[PLQueryHandler fixUserQueryDataInQuery:](PLQueryHandler, "fixUserQueryDataInQuery:", v3))
  {
    +[PLQueryHandler dataFromQuery:](PLQueryHandler, "dataFromQuery:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLGenericAlbumJournalEntryPayload setUserQueryData:](self, "setUserQueryData:", v4);

  }
}

@end
