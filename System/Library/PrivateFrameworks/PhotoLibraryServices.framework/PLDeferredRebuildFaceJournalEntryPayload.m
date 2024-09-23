@implementation PLDeferredRebuildFaceJournalEntryPayload

+ (id)modelPropertiesDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[16];
  _QWORD v21[18];

  v21[16] = *MEMORY[0x1E0C80C00];
  v20[0] = CFSTR("uuid");
  +[PLJournalEntryPayloadProperty payloadPropertyForUUID](PLJournalEntryPayloadProperty, "payloadPropertyForUUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v19;
  v20[1] = CFSTR("faceUUID");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v18;
  v20[2] = CFSTR("assetCloudGUID");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v17;
  v20[3] = CFSTR("assetUUID");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v16;
  v20[4] = CFSTR("personUUID");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v15;
  v20[5] = CFSTR("centerX");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[5] = v14;
  v20[6] = CFSTR("centerY");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[6] = v13;
  v20[7] = CFSTR("size");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v21[7] = v2;
  v20[8] = CFSTR("hidden");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21[8] = v3;
  v20[9] = CFSTR("manual");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[9] = v4;
  v20[10] = CFSTR("representative");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[10] = v5;
  v20[11] = CFSTR("rejected");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[11] = v6;
  v20[12] = CFSTR("clusterRejected");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[12] = v7;
  v20[13] = CFSTR("nameSource");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[13] = v8;
  v20[14] = CFSTR("cloudNameSource");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[14] = v9;
  v20[15] = CFSTR("faceAlgorithmVersion");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[15] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)nonPersistedModelPropertiesDescription
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)modelProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__PLDeferredRebuildFaceJournalEntryPayload_modelProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (modelProperties_onceToken_83895 != -1)
    dispatch_once(&modelProperties_onceToken_83895, block);
  return (id)modelProperties_modelProperties_83896;
}

+ (id)persistedPropertyNamesForEntityNames
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__PLDeferredRebuildFaceJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (persistedPropertyNamesForEntityNames_onceToken_83893 != -1)
    dispatch_once(&persistedPropertyNamesForEntityNames_onceToken_83893, block);
  return (id)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_83894;
}

+ (id)payloadClassID
{
  return +[PLDeferredRebuildFace entityName](PLDeferredRebuildFace, "entityName");
}

+ (unsigned)payloadVersion
{
  return 1;
}

+ (unsigned)minimumSnapshotPayloadVersion
{
  return 1;
}

+ (BOOL)isValidForPersistenceWithObjectDictionary:(id)a3 additionalEntityName:(id)a4
{
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("uuid"), a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

void __80__PLDeferredRebuildFaceJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "persistedPropertyNamesForEntityNamesFromModelProperties");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_83894;
  persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_83894 = v1;

}

uint64_t __59__PLDeferredRebuildFaceJournalEntryPayload_modelProperties__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "modelPropertiesDescription");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)modelProperties_modelProperties_83896;
  modelProperties_modelProperties_83896 = v2;

  return objc_msgSend(*(id *)(a1 + 32), "loadModelPropertiesDescription:parentPayloadProperty:", modelProperties_modelProperties_83896, 0);
}

- (id)insertDeferredRebuildFaceFromDataInManagedObjectContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  +[PLManagedObject insertInManagedObjectContext:](PLDeferredRebuildFace, "insertInManagedObjectContext:", a3);
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
