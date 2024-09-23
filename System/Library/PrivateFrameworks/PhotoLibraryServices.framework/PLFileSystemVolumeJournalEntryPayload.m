@implementation PLFileSystemVolumeJournalEntryPayload

+ (id)modelPropertiesDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("uuid");
  +[PLJournalEntryPayloadProperty payloadPropertyForUUID](PLJournalEntryPayloadProperty, "payloadPropertyForUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v7[1] = CFSTR("name");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v7[2] = CFSTR("volumeUuidString");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("volumeUuid"), 700, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)nonPersistedModelPropertiesDescription
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("resources");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)modelProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PLFileSystemVolumeJournalEntryPayload_modelProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (modelProperties_onceToken != -1)
    dispatch_once(&modelProperties_onceToken, block);
  return (id)modelProperties_modelProperties;
}

+ (id)persistedPropertyNamesForEntityNames
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__PLFileSystemVolumeJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (persistedPropertyNamesForEntityNames_onceToken != -1)
    dispatch_once(&persistedPropertyNamesForEntityNames_onceToken, block);
  return (id)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames;
}

+ (id)payloadClassID
{
  return +[PLFileSystemVolume entityName](PLFileSystemVolume, "entityName");
}

+ (unsigned)payloadVersion
{
  return 1;
}

+ (unsigned)minimumSnapshotPayloadVersion
{
  return 1;
}

void __77__PLFileSystemVolumeJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "persistedPropertyNamesForEntityNamesFromModelProperties");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames;
  persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames = v1;

}

uint64_t __56__PLFileSystemVolumeJournalEntryPayload_modelProperties__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "modelPropertiesDescription");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)modelProperties_modelProperties;
  modelProperties_modelProperties = v2;

  return objc_msgSend(*(id *)(a1 + 32), "loadModelPropertiesDescription:parentPayloadProperty:", modelProperties_modelProperties, 0);
}

- (id)insertFileSystemVolumeFromDataInManagedObjectContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  +[PLManagedObject insertInManagedObjectContext:](PLFileSystemVolume, "insertInManagedObjectContext:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObjectJournalEntryPayload payloadID](self, "payloadID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "payloadIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUuid:", v6);

  -[PLManagedObjectJournalEntryPayload applyPayloadToManagedObject:payloadAttributesToUpdate:](self, "applyPayloadToManagedObject:payloadAttributesToUpdate:", v4, 0);
  return v4;
}

@end
