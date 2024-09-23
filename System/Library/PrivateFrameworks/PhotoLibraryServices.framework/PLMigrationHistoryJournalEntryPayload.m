@implementation PLMigrationHistoryJournalEntryPayload

- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withManagedObject:(id)a5 forPayloadProperty:(id)a6
{
  id v8;
  id v9;
  id v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a5;
  v10 = a6;
  v11 = objc_msgSend(v10, "isEqualToKey:", CFSTR("globalKeyValues"));
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3B20], "valueTransformerForName:", CFSTR("PLGlobalKeyValueAnyTransformer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "globalKeyValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reverseTransformedValue:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "key");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v15);

  }
  return v11;
}

- (void)appendAttributeKey:(id)a3 value:(id)a4 toDescriptionBuilder:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  objc_super v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("globalKeyValues")))
  {
    objc_msgSend(MEMORY[0x1E0CB3B20], "valueTransformerForName:", CFSTR("PLGlobalKeyValueAnyTransformer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "transformedValue:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14.receiver = self;
    v14.super_class = (Class)PLMigrationHistoryJournalEntryPayload;
    -[PLManagedObjectJournalEntryPayload appendAttributeKey:value:toDescriptionBuilder:](&v14, sel_appendAttributeKey_value_toDescriptionBuilder_, v8, v12, v10);

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PLMigrationHistoryJournalEntryPayload;
    -[PLManagedObjectJournalEntryPayload appendAttributeKey:value:toDescriptionBuilder:](&v13, sel_appendAttributeKey_value_toDescriptionBuilder_, v8, v9, v10);
  }

}

- (id)payloadValueFromAttributes:(id)a3 forPayloadProperty:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToKey:", CFSTR("globalKeyValues")))
  {
    objc_msgSend(MEMORY[0x1E0CB3B20], "valueTransformerForName:", CFSTR("PLGlobalKeyValueAnyTransformer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "transformedValue:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PLMigrationHistoryJournalEntryPayload;
    -[PLManagedObjectJournalEntryPayload payloadValueFromAttributes:forPayloadProperty:](&v13, sel_payloadValueFromAttributes_forPayloadProperty_, v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (void)applyPayloadProperty:(id)a3 toManagedObject:(id)a4 key:(id)a5 payloadAttributesToUpdate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  void *v18;
  NSMutableDictionary *payloadAttributes;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v10, "requiresConversion"))
  {
    objc_msgSend(v10, "key");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("globalKeyValues"));

    if (v15)
    {
      v16 = (void *)MEMORY[0x1E0CB3B20];
      v17 = v11;
      objc_msgSend(v16, "valueTransformerForName:", CFSTR("PLGlobalKeyValueAnyTransformer"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      payloadAttributes = self->super._payloadAttributes;
      objc_msgSend(v10, "key");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](payloadAttributes, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "transformedValue:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setGlobalKeyValues:", v22);

    }
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)PLMigrationHistoryJournalEntryPayload;
    -[PLManagedObjectJournalEntryPayload applyPayloadProperty:toManagedObject:key:payloadAttributesToUpdate:](&v23, sel_applyPayloadProperty_toManagedObject_key_payloadAttributesToUpdate_, v10, v11, v12, v13);
  }

}

- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v10, "isEqualToKey:", CFSTR("globalKeyValues")) & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PLMigrationHistoryJournalEntryPayload;
    v11 = -[PLManagedObjectJournalEntryPayload comparePayloadValue:toObjectDictionaryValue:forPayloadProperty:](&v13, sel_comparePayloadValue_toObjectDictionaryValue_forPayloadProperty_, v8, v9, v10);
  }

  return v11;
}

- (id)insertMigrationHistoryFromDataInManagedObjectContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  +[PLManagedObject insertInManagedObjectContext:](PLMigrationHistory, "insertInManagedObjectContext:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObjectJournalEntryPayload payloadID](self, "payloadID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "payloadIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIndex:", objc_msgSend(v6, "longLongValue"));

  -[PLManagedObjectJournalEntryPayload applyPayloadToManagedObject:payloadAttributesToUpdate:](self, "applyPayloadToManagedObject:payloadAttributesToUpdate:", v4, 0);
  return v4;
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
  _QWORD v19[15];
  _QWORD v20[17];

  v20[15] = *MEMORY[0x1E0C80C00];
  v19[0] = CFSTR("index");
  +[PLJournalEntryPayloadProperty payloadPropertyForUUID](PLJournalEntryPayloadProperty, "payloadPropertyForUUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v18;
  v19[1] = CFSTR("modelVersion");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v17;
  v19[2] = CFSTR("sourceModelVersion");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v16;
  v19[3] = CFSTR("migrationType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v15;
  v19[4] = CFSTR("osVersion");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v14;
  v19[5] = CFSTR("migrationDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v13;
  v19[6] = CFSTR("forceRebuildReason");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v20[6] = v2;
  v19[7] = CFSTR("origin");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[7] = v3;
  v19[8] = CFSTR("globalKeyValues");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[8] = v4;
  v19[9] = CFSTR("storeUUID");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[9] = v5;
  v19[10] = CFSTR("frameworkUUID");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[10] = v6;
  v19[11] = CFSTR("hardwareModel");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[11] = v7;
  v19[12] = CFSTR("deviceUniqueID");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[12] = v8;
  v19[13] = CFSTR("cplEnabled");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[13] = v9;
  v19[14] = CFSTR("initialSyncDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[14] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 15);
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
  block[2] = __56__PLMigrationHistoryJournalEntryPayload_modelProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (modelProperties_onceToken_87225 != -1)
    dispatch_once(&modelProperties_onceToken_87225, block);
  return (id)modelProperties_modelProperties_87226;
}

+ (id)persistedPropertyNamesForEntityNames
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__PLMigrationHistoryJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (persistedPropertyNamesForEntityNames_onceToken_87223 != -1)
    dispatch_once(&persistedPropertyNamesForEntityNames_onceToken_87223, block);
  return (id)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_87224;
}

+ (id)payloadClassID
{
  return +[PLMigrationHistory entityName](PLMigrationHistory, "entityName");
}

+ (unsigned)payloadVersion
{
  return 1;
}

+ (unsigned)minimumSnapshotPayloadVersion
{
  return 1;
}

void __77__PLMigrationHistoryJournalEntryPayload_persistedPropertyNamesForEntityNames__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "persistedPropertyNamesForEntityNamesFromModelProperties");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_87224;
  persistedPropertyNamesForEntityNames_persistedPropertyNamesForEntityNames_87224 = v1;

}

uint64_t __56__PLMigrationHistoryJournalEntryPayload_modelProperties__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "modelPropertiesDescription");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)modelProperties_modelProperties_87226;
  modelProperties_modelProperties_87226 = v2;

  return objc_msgSend(*(id *)(a1 + 32), "loadModelPropertiesDescription:parentPayloadProperty:", modelProperties_modelProperties_87226, 0);
}

@end
