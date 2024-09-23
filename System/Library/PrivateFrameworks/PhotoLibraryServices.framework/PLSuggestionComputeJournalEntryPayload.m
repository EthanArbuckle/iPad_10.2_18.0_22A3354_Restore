@implementation PLSuggestionComputeJournalEntryPayload

- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withManagedObject:(id)a5 forPayloadProperty:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v13, "isEqualToKey:", CFSTR("keyAsset")))
  {
    objc_msgSend(v12, "keyAssets");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "anyObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "cloudAssetGUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend(v15, "cloudAssetGUID");
    else
      objc_msgSend(v15, "uuid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedObjectJournalEntryPayload UUIDDataForString:](self, "UUIDDataForString:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "key");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, v20);

    objc_msgSend(v15, "cloudAssetGUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
      v22 = &unk_1E37608A8;
    else
      v22 = &unk_1E37608C0;
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v22, CFSTR("assetIDType"));

    v17 = 1;
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)PLSuggestionComputeJournalEntryPayload;
    v17 = -[PLManagedObjectJournalEntryPayload updatePayloadAttributes:andNilAttributes:withManagedObject:forPayloadProperty:](&v24, sel_updatePayloadAttributes_andNilAttributes_withManagedObject_forPayloadProperty_, v10, v11, v12, v13);
  }

  return v17;
}

- (void)appendAttributeKey:(id)a3 value:(id)a4 toDescriptionBuilder:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  objc_super v12;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("keyAsset")))
  {
    -[PLManagedObjectJournalEntryPayload UUIDStringForData:](self, "UUIDStringForData:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v13.receiver = self;
    v13.super_class = (Class)PLSuggestionComputeJournalEntryPayload;
    -[PLManagedObjectJournalEntryPayload appendAttributeKey:value:toDescriptionBuilder:](&v13, sel_appendAttributeKey_value_toDescriptionBuilder_, v8, v11, v9);
    v10 = (id)v11;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PLSuggestionComputeJournalEntryPayload;
    -[PLManagedObjectJournalEntryPayload appendAttributeKey:value:toDescriptionBuilder:](&v12, sel_appendAttributeKey_value_toDescriptionBuilder_, v8, v10, v9);
  }

}

- (id)payloadValueFromAttributes:(id)a3 forPayloadProperty:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToKey:", CFSTR("keyAsset")))
  {
    objc_msgSend(v7, "key");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedObjectJournalEntryPayload UUIDStringForData:](self, "UUIDStringForData:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PLSuggestionComputeJournalEntryPayload;
    -[PLManagedObjectJournalEntryPayload payloadValueFromAttributes:forPayloadProperty:](&v12, sel_payloadValueFromAttributes_forPayloadProperty_, v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5
{
  unint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  unsigned __int8 v13;
  objc_super v15;

  v8 = (unint64_t)a3;
  v9 = a5;
  v10 = (uint64_t)a4;
  if (!objc_msgSend(v9, "isEqualToKey:", CFSTR("keyAsset")))
  {
    v15.receiver = self;
    v15.super_class = (Class)PLSuggestionComputeJournalEntryPayload;
    v13 = -[PLManagedObjectJournalEntryPayload comparePayloadValue:toObjectDictionaryValue:forPayloadProperty:](&v15, sel_comparePayloadValue_toObjectDictionaryValue_forPayloadProperty_, v8, v10, v9);
    goto LABEL_13;
  }
  objc_msgSend((id)v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PLSuggestionComputeJournalEntryPayload assetIdentifierType](self, "assetIdentifierType"))
  {
    if (-[PLSuggestionComputeJournalEntryPayload assetIdentifierType](self, "assetIdentifierType") != 1)
    {
      v10 = 0;
      goto LABEL_9;
    }
    v12 = CFSTR("cloudAssetGUID");
  }
  else
  {
    v12 = CFSTR("uuid");
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  if (v8 | v10)
    v13 = objc_msgSend((id)v10, "isEqualToString:", v8);
  else
    v13 = 1;

LABEL_13:
  return v13;
}

- (BOOL)insertWithAssets:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  -[PLManagedObjectJournalEntryPayload payloadID](self, "payloadID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "payloadIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLSuggestion suggestionWithUUID:inManagedObjectContext:](PLSuggestion, "suggestionWithUUID:inManagedObjectContext:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLSuggestion, "insertInManagedObjectContext:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedObjectJournalEntryPayload payloadID](self, "payloadID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "payloadIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUuid:", v12);

    -[PLManagedObjectJournalEntryPayload applyPayloadToManagedObject:payloadAttributesToUpdate:](self, "applyPayloadToManagedObject:payloadAttributesToUpdate:", v10, 0);
    objc_msgSend(v10, "setKeyAssets:", v6);
    objc_msgSend(v10, "setRestoreType:", 1);
    objc_msgSend(v10, "updateStartAndEndDate");
  }

  return 1;
}

- (NSSet)assetIdentifiers
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[PLSuggestionComputeJournalEntryPayload keyAssetUUID](self, "keyAssetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);

  return (NSSet *)v3;
}

- (unint64_t)assetIdentifierCount
{
  void *v2;
  unint64_t v3;

  -[PLSuggestionComputeJournalEntryPayload keyAssetUUID](self, "keyAssetUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)setLocalAssetIdentifierForCloudIdentifiers:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "allValues");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSuggestionComputeJournalEntryPayload setKeyAssetUUID:](self, "setKeyAssetUUID:", v4);

}

- (int64_t)assetIdentifierType
{
  void *v2;
  int64_t v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("assetIDType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (NSString)keyAssetUUID
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("keyAsset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObjectJournalEntryPayload UUIDStringForData:](self, "UUIDStringForData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setKeyAssetUUID:(id)a3
{
  id v4;

  -[PLManagedObjectJournalEntryPayload UUIDDataForString:](self, "UUIDDataForString:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._payloadAttributes, "setObject:forKeyedSubscript:", v4, CFSTR("keyAsset"));

}

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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[3];
  _QWORD v26[19];
  _QWORD v27[21];

  v27[19] = *MEMORY[0x1E0C80C00];
  v26[0] = CFSTR("uuid");
  +[PLJournalEntryPayloadProperty payloadPropertyForUUID](PLJournalEntryPayloadProperty, "payloadPropertyForUUID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v24;
  v26[1] = CFSTR("type");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v23;
  v26[2] = CFSTR("subtype");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v22;
  v26[3] = CFSTR("title");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v21;
  v26[4] = CFSTR("subtitle");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v20;
  v26[5] = CFSTR("state");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v19;
  v26[6] = CFSTR("version");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[6] = v18;
  v26[7] = CFSTR("featuredState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[7] = v17;
  v26[8] = CFSTR("suggestionContext");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[8] = v16;
  v26[9] = CFSTR("relatedCollectionUUID");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[9] = v15;
  v26[10] = CFSTR("notificationState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[10] = v14;
  v26[11] = CFSTR("creationDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[11] = v13;
  v26[12] = CFSTR("activationDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v27[12] = v2;
  v26[13] = CFSTR("relevantUntilDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27[13] = v3;
  v26[14] = CFSTR("expungeDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27[14] = v4;
  v26[15] = CFSTR("actionData");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[15] = v5;
  v26[16] = CFSTR("featuresData");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[16] = v6;
  v26[17] = CFSTR("availableFeatures");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[17] = v7;
  v26[18] = CFSTR("keyAssets");
  v25[0] = CFSTR("uuid");
  v25[1] = CFSTR("cloudAssetGUID");
  v25[2] = CFSTR("trashedState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:", CFSTR("keyAsset"), v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v27[18] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)nonPersistedModelPropertiesDescription
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
  _QWORD v15[11];
  _QWORD v16[13];

  v16[11] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("cachedCount");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v14;
  v15[1] = CFSTR("cachedPhotosCount");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v13;
  v15[2] = CFSTR("cachedVideosCount");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v2;
  v15[3] = CFSTR("cloudDeleteState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v3;
  v15[4] = CFSTR("cloudLocalState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v4;
  v15[5] = CFSTR("endDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v5;
  v15[6] = CFSTR("sharingComposition");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v6;
  v15[7] = CFSTR("sharingComposition");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[7] = v7;
  v15[8] = CFSTR("startDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[8] = v8;
  v15[9] = CFSTR("representativeAssets");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[9] = v9;
  v15[10] = CFSTR("restoreType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[10] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 11);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)modelProperties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PLSuggestionComputeJournalEntryPayload_modelProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (modelProperties_onceToken_86768 != -1)
    dispatch_once(&modelProperties_onceToken_86768, block);
  return (id)modelProperties_modelProperties_86769;
}

+ (id)persistedPropertyNamesForEntityNames
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__PLSuggestionComputeJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (persistedPropertyNamesForEntityNames_onceToken_86766 != -1)
    dispatch_once(&persistedPropertyNamesForEntityNames_onceToken_86766, block);
  return (id)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_86767;
}

+ (id)payloadClassID
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "entityName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("Compute"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)entityName
{
  return +[PLSuggestion entityName](PLSuggestion, "entityName");
}

+ (unsigned)payloadVersion
{
  return 1;
}

+ (unsigned)minimumSnapshotPayloadVersion
{
  return 1;
}

+ (id)supportedSuggestionTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E3763FE0);
}

+ (id)payloadAdapterForManagedObject:(id)a3
{
  id v4;
  PLSuggestionComputePayloadAdapter *v5;
  void *v6;
  PLSuggestionComputePayloadAdapter *v7;

  v4 = a3;
  v5 = [PLSuggestionComputePayloadAdapter alloc];
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

+ (BOOL)isValidForPersistenceWithObjectDictionary:(id)a3 additionalEntityName:(id)a4 suggestionTypes:(id)a5
{
  id v7;
  BOOL v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;

  v7 = a3;
  if (a4)
  {
    v8 = 1;
  }
  else
  {
    v9 = a5;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("type"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "containsObject:", v10);

    if (v11)
    {
      objc_msgSend(CFSTR("keyAssets"), "stringByAppendingPathExtension:", CFSTR("uuid"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v13, "count") == 1)
      {
        objc_msgSend(v13, "firstObject");
        v14 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("keyAssets"), "stringByAppendingPathExtension:", CFSTR("cloudAssetGUID"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "firstObject");
        v17 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(CFSTR("keyAssets"), "stringByAppendingPathExtension:", CFSTR("trashedState"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "firstObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14 | v17)
          v8 = objc_msgSend(v20, "integerValue") == 0;
        else
          v8 = 0;

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

void __78__PLSuggestionComputeJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "persistedPropertyNamesForEntityNamesFromModelProperties");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_86767;
  persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_86767 = v1;

}

uint64_t __57__PLSuggestionComputeJournalEntryPayload_modelProperties__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "modelPropertiesDescription");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)modelProperties_modelProperties_86769;
  modelProperties_modelProperties_86769 = v2;

  return objc_msgSend(*(id *)(a1 + 32), "loadModelPropertiesDescription:parentPayloadProperty:", modelProperties_modelProperties_86769, 0);
}

@end
