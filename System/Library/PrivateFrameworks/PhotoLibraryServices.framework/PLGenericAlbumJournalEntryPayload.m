@implementation PLGenericAlbumJournalEntryPayload

- (BOOL)updatePayloadAttributes:(id)a3 andNilAttributes:(id)a4 withManagedObject:(id)a5 forPayloadProperty:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = v10;
  if (objc_msgSend(v11, "isEqualToKey:", CFSTR("customKeyAsset")))
  {
    objc_msgSend(v12, "customKeyAsset");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLManagedObjectJournalEntryPayload UUIDDataForString:](self, "UUIDDataForString:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "key");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v16);

  }
  else
  {
    if (!objc_msgSend(v11, "isEqualToKey:", CFSTR("inTrash")))
    {
      v17 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v12, "isInTrash"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "key");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, v14);
  }

  v17 = 1;
LABEL_7:

  return v17;
}

- (void)appendAttributeKey:(id)a3 value:(id)a4 toDescriptionBuilder:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_super v12;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("customKeyAsset")))
  {
    -[PLManagedObjectJournalEntryPayload UUIDStringForData:](self, "UUIDStringForData:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "appendName:object:", v8, v11);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PLGenericAlbumJournalEntryPayload;
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
  if (objc_msgSend(v7, "isEqualToKey:", CFSTR("customKeyAsset")))
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
    v12.super_class = (Class)PLGenericAlbumJournalEntryPayload;
    -[PLManagedObjectJournalEntryPayload payloadValueFromAttributes:forPayloadProperty:](&v12, sel_payloadValueFromAttributes_forPayloadProperty_, v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)insertAlbumFromDataInManagedObjectContext:(id)a3
{
  return 0;
}

- (void)updateAlbum:(id)a3 includePendingChanges:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  -[PLManagedObjectJournalEntryPayload payloadID](self, "payloadID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "payloadIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setUuid:", v6);

  -[PLGenericAlbumJournalEntryPayload title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTitle:", v7);

  -[PLGenericAlbumJournalEntryPayload kind](self, "kind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setKind:", v8);

  -[PLGenericAlbumJournalEntryPayload cloudGUID](self, "cloudGUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PLGenericAlbumJournalEntryPayload cloudGUID](self, "cloudGUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCloudGUID:", v10);

  }
  if (-[PLGenericAlbumJournalEntryPayload isInTrash](self, "isInTrash")
    && objc_msgSend(v19, "canMoveToTrash"))
  {
    objc_msgSend(v19, "applyTrashedState:cascade:", 1, 1);
  }
  if (-[PLGenericAlbumJournalEntryPayload isPinned](self, "isPinned"))
    objc_msgSend(v19, "setIsPinned:", -[PLGenericAlbumJournalEntryPayload isPinned](self, "isPinned"));
  if (-[PLGenericAlbumJournalEntryPayload isPrototype](self, "isPrototype"))
    objc_msgSend(v19, "setIsPrototype:", -[PLGenericAlbumJournalEntryPayload isPrototype](self, "isPrototype"));
  objc_msgSend(v19, "setCustomSortAscending:", -[PLGenericAlbumJournalEntryPayload customSortAscending](self, "customSortAscending"));
  objc_msgSend(v19, "setCustomSortKey:", -[PLGenericAlbumJournalEntryPayload customSortKey](self, "customSortKey"));
  -[PLGenericAlbumJournalEntryPayload customKeyAssetUUID](self, "customKeyAssetUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v19, "managedObjectContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLManagedAsset assetWithUUID:inManagedObjectContext:](PLManagedAsset, "assetWithUUID:inManagedObjectContext:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      objc_msgSend(v19, "setCustomKeyAsset:", v13);

  }
  -[PLGenericAlbumJournalEntryPayload userQueryData](self, "userQueryData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setUserQueryData:", v14);

  -[PLGenericAlbumJournalEntryPayload creationDate](self, "creationDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[PLGenericAlbumJournalEntryPayload creationDate](self, "creationDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCreationDate:", v16);

  }
  -[PLGenericAlbumJournalEntryPayload importedByBundleIdentifier](self, "importedByBundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[PLGenericAlbumJournalEntryPayload importedByBundleIdentifier](self, "importedByBundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setImportedByBundleIdentifier:", v18);

  }
}

- (NSString)cloudGUID
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("cloudGUID"));
}

- (NSString)title
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("title"));
}

- (NSNumber)kind
{
  return (NSNumber *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("kind"));
}

- (BOOL)isPinned
{
  void *v2;
  char v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("pinned"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isPrototype
{
  void *v2;
  char v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("prototype"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isInTrash
{
  void *v2;
  char v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("inTrash"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)customSortAscending
{
  void *v2;
  char v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("customSortAscending"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (int)customSortKey
{
  void *v2;
  int v3;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("customSortKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (NSString)customKeyAssetUUID
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("customKeyAsset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObjectJournalEntryPayload UUIDStringForData:](self, "UUIDStringForData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)importSessionID
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("importSessionID"));
}

- (NSData)userQueryData
{
  return (NSData *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("userQueryData"));
}

- (void)setUserQueryData:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._payloadAttributes, "setObject:forKeyedSubscript:", a3, CFSTR("userQueryData"));
}

- (NSDate)creationDate
{
  return (NSDate *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("creationDate"));
}

- (NSString)importedByBundleIdentifier
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._payloadAttributes, "objectForKeyedSubscript:", CFSTR("importedByBundleIdentifier"));
}

- (BOOL)comparePayloadValue:(id)a3 toObjectDictionaryValue:(id)a4 forPayloadProperty:(id)a5
{
  id v8;
  id v9;
  id v10;
  unsigned __int8 v11;
  int v12;
  __int16 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "isEqualToKey:", CFSTR("customKeyAsset")))
    goto LABEL_2;
  if (objc_msgSend(v10, "isEqualToKey:", CFSTR("inTrash")))
  {
    v13 = objc_msgSend(v9, "integerValue");
    v12 = objc_msgSend(v8, "BOOLValue") ^ (v13 == 0);
    goto LABEL_12;
  }
  if (!objc_msgSend(v10, "isEqualToKey:", CFSTR("cloudGUID")))
  {
    v18.receiver = self;
    v18.super_class = (Class)PLGenericAlbumJournalEntryPayload;
    v11 = -[PLManagedObjectJournalEntryPayload comparePayloadValue:toObjectDictionaryValue:forPayloadProperty:](&v18, sel_comparePayloadValue_toObjectDictionaryValue_forPayloadProperty_, v8, v9, v10);
    goto LABEL_3;
  }
  -[PLGenericAlbumJournalEntryPayload kind](self, "kind");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "integerValue") == 3999)
  {

LABEL_11:
    LOBYTE(v12) = 1;
    goto LABEL_12;
  }
  -[PLGenericAlbumJournalEntryPayload kind](self, "kind");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "integerValue");

  if (v16 == 3998)
    goto LABEL_11;
LABEL_2:
  v11 = objc_msgSend(v9, "isEqualToString:", v8);
LABEL_3:
  LOBYTE(v12) = v11;
LABEL_12:

  return v12;
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
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[14];
  _QWORD v20[16];

  v20[14] = *MEMORY[0x1E0C80C00];
  v19[0] = CFSTR("uuid");
  +[PLJournalEntryPayloadProperty payloadPropertyForUUID](PLJournalEntryPayloadProperty, "payloadPropertyForUUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v18;
  v19[1] = CFSTR("cloudGUID");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v17;
  v19[2] = CFSTR("title");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v16;
  v19[3] = CFSTR("kind");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v15;
  v19[4] = CFSTR("isPinned");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("pinned"), 800, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v14;
  v19[5] = CFSTR("isPrototype");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", CFSTR("prototype"), 800, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v2;
  v19[6] = CFSTR("trashedState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:requiresConversion:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:requiresConversion:info:", CFSTR("inTrash"), 100, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[6] = v3;
  v19[7] = CFSTR("customSortAscending");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[7] = v4;
  v19[8] = CFSTR("customSortKey");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[8] = v5;
  v19[9] = CFSTR("importSessionID");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[9] = v6;
  v19[10] = CFSTR("customKeyAsset");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("uuid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:relatedEntityPropertyNames:shouldPrefetchRelationship:", CFSTR("customKeyAsset"), v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v20[10] = v8;
  v19[11] = CFSTR("userQueryData");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[11] = v9;
  v19[12] = CFSTR("creationDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[12] = v10;
  v19[13] = CFSTR("importedByBundleIdentifier");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[13] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[15];
  _QWORD v20[17];

  v20[15] = *MEMORY[0x1E0C80C00];
  v19[0] = CFSTR("cachedCount");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v18;
  v19[1] = CFSTR("cachedPhotosCount");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v17;
  v19[2] = CFSTR("cachedVideosCount");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v16;
  v19[3] = CFSTR("cloudDeleteState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v15;
  v19[4] = CFSTR("cloudLocalState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v14;
  v19[5] = CFSTR("endDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v13;
  v19[6] = CFSTR("pendingItemsCount");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v20[6] = v2;
  v19[7] = CFSTR("pendingItemsType");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[7] = v3;
  v19[8] = CFSTR("startDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[8] = v4;
  v19[9] = CFSTR("syncEventOrderKey");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[9] = v5;
  v19[10] = CFSTR("trashedDate");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[10] = v6;
  v19[11] = CFSTR("albumLists");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[11] = v7;
  v19[12] = CFSTR("keyAssets");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[12] = v8;
  v19[13] = CFSTR("parentFolder");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[13] = v9;
  v19[14] = CFSTR("privacyState");
  +[PLJournalEntryPayloadProperty payloadPropertyWithKey:andType:info:](PLJournalEntryPayloadProperty, "payloadPropertyWithKey:andType:info:", 0, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[14] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
