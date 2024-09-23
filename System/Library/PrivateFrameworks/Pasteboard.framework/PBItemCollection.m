@implementation PBItemCollection

- (void)setOriginatorLocalizedName:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__PBItemCollection_setOriginatorLocalizedName___block_invoke;
  block[3] = &unk_1E2430F08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)setUUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__PBItemCollection_setUUID___block_invoke;
  block[3] = &unk_1E2430F08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)setSaveBootSession:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PBItemCollection_setSaveBootSession___block_invoke;
  block[3] = &unk_1E2430F08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)setOriginatorBundleID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__PBItemCollection_setOriginatorBundleID___block_invoke;
  block[3] = &unk_1E2430F08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)setOriginatorTeamID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__PBItemCollection_setOriginatorTeamID___block_invoke;
  block[3] = &unk_1E2430F08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __28__PBItemCollection_shutdown__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 168);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v6++), "didInvalidateItemCollectionWithUUID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), (_QWORD)v11);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "invalidate");
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 24);
  *(_QWORD *)(v7 + 24) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "invalidate");
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[PBItemCollection shutdown](self, "shutdown");
  v3.receiver = self;
  v3.super_class = (Class)PBItemCollection;
  -[PBItemCollection dealloc](&v3, sel_dealloc);
}

- (void)shutdown
{
  NSObject *v3;
  _QWORD block[5];

  PBItemQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__PBItemCollection_shutdown__block_invoke;
  block[3] = &unk_1E2430DF0;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemQueue_invalidationDelegates, 0);
  objc_destroyWeak((id *)&self->_itemQueue_dataTransferDelegate);
  objc_storeStrong((id *)&self->_itemQueue_remoteDeviceName, 0);
  objc_storeStrong((id *)&self->_itemQueue_originatorLocalizedName, 0);
  objc_storeStrong((id *)&self->_itemQueue_originatorTeamID, 0);
  objc_storeStrong((id *)&self->_itemQueue_originatorBundleID, 0);
  objc_storeStrong((id *)&self->_itemQueue_originatorPersistentID, 0);
  objc_storeStrong((id *)&self->_itemQueue_saveBootSession, 0);
  objc_storeStrong((id *)&self->_itemQueue_sharingToken, 0);
  objc_storeStrong((id *)&self->_itemQueue_UUID, 0);
  objc_storeStrong((id *)&self->_itemQueue_privateMetadata, 0);
  objc_storeStrong((id *)&self->_itemQueue_metadata, 0);
  objc_storeStrong((id *)&self->_itemQueue_items, 0);
  objc_storeStrong((id *)&self->_itemQueue_remoteDataProviderConnection, 0);
  objc_storeStrong((id *)&self->_itemQueue_remoteDataProviderEndpoint, 0);
  objc_storeStrong((id *)&self->_itemQueue_dataConsumersListener, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

- (BOOL)isPersistent
{
  void *v4;
  void *v5;
  char v6;

  if (-[PBItemCollection isSystemPasteboard](self, "isSystemPasteboard"))
    return 1;
  -[PBItemCollection metadata](self, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("persistent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (BOOL)isSystemPasteboard
{
  void *v2;
  char v3;

  -[PBItemCollection name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.UIKit.pboard.general"));

  return v3;
}

- (PBItemCollection)initWithCoder:(id)a3
{
  id v4;
  PBItemCollection *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSArray *itemQueue_items;
  void *v10;
  uint64_t v11;
  NSDictionary *itemQueue_metadata;
  void *v13;
  uint64_t v14;
  NSDictionary *itemQueue_privateMetadata;
  uint64_t v16;
  NSUUID *itemQueue_UUID;
  uint64_t v18;
  NSDate *creationDate;
  uint64_t v20;
  NSUUID *itemQueue_saveBootSession;
  uint64_t v22;
  NSData *itemQueue_originatorPersistentID;
  uint64_t v24;
  NSString *itemQueue_originatorBundleID;
  uint64_t v26;
  NSString *itemQueue_originatorTeamID;
  uint64_t v28;
  NSString *itemQueue_originatorLocalizedName;
  void *v30;
  uint64_t v31;
  NSString *itemQueue_remoteDeviceName;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PBItemCollection;
  v5 = -[PBItemCollection init](&v34, sel_init);
  if (v5)
  {
    +[PBItem allowedClassesForSecureCoding](PBItem, "allowedClassesForSecureCoding");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setByAddingObject:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("items"));
    v8 = objc_claimAutoreleasedReturnValue();
    itemQueue_items = v5->_itemQueue_items;
    v5->_itemQueue_items = (NSArray *)v8;

    PBAllowedMetadataClasses();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("metadata"));
    v11 = objc_claimAutoreleasedReturnValue();
    itemQueue_metadata = v5->_itemQueue_metadata;
    v5->_itemQueue_metadata = (NSDictionary *)v11;

    PBAllowedMetadataClasses();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("privateMetadata"));
    v14 = objc_claimAutoreleasedReturnValue();
    itemQueue_privateMetadata = v5->_itemQueue_privateMetadata;
    v5->_itemQueue_privateMetadata = (NSDictionary *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
    v16 = objc_claimAutoreleasedReturnValue();
    itemQueue_UUID = v5->_itemQueue_UUID;
    v5->_itemQueue_UUID = (NSUUID *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
    v18 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("saveBootSession"));
    v20 = objc_claimAutoreleasedReturnValue();
    itemQueue_saveBootSession = v5->_itemQueue_saveBootSession;
    v5->_itemQueue_saveBootSession = (NSUUID *)v20;

    v5->_itemQueue_saveTimestamp = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("saveTimestamp"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("persistentIdentifier"));
    v22 = objc_claimAutoreleasedReturnValue();
    itemQueue_originatorPersistentID = v5->_itemQueue_originatorPersistentID;
    v5->_itemQueue_originatorPersistentID = (NSData *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v24 = objc_claimAutoreleasedReturnValue();
    itemQueue_originatorBundleID = v5->_itemQueue_originatorBundleID;
    v5->_itemQueue_originatorBundleID = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("teamIdentifier"));
    v26 = objc_claimAutoreleasedReturnValue();
    itemQueue_originatorTeamID = v5->_itemQueue_originatorTeamID;
    v5->_itemQueue_originatorTeamID = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedName"));
    v28 = objc_claimAutoreleasedReturnValue();
    itemQueue_originatorLocalizedName = v5->_itemQueue_originatorLocalizedName;
    v5->_itemQueue_originatorLocalizedName = (NSString *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceLocked"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_itemQueue_deviceLockedPasteboard = objc_msgSend(v30, "BOOLValue");

    v5->_itemQueue_originatorAllowedToCopyOnPaste = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowedToCopyOnPaste"));
    v5->_itemQueue_isOrWasRemote = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isOrWasRemote"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remoteDeviceName"));
    v31 = objc_claimAutoreleasedReturnValue();
    itemQueue_remoteDeviceName = v5->_itemQueue_remoteDeviceName;
    v5->_itemQueue_remoteDeviceName = (NSString *)v31;

    v5->_itemQueue_originatorDataOwner = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("originatorDataOwner"));
  }

  return v5;
}

+ (id)allowedClassesForSecureCoding
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PBItem allowedClassesForSecureCoding](PBItem, "allowedClassesForSecureCoding");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setByAddingObjectsFromSet:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __92__PBItemCollection_setUsesServerConnectionToLoadDataWithAuthenticationBlock_dataOwnerBlock___block_invoke(id *a1)
{
  void *v2;
  uint64_t v3;
  char *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  PBItemRepresentation *v15;
  id v16;
  PBItemRepresentation *v17;
  void *v18;
  unint64_t v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23[2];
  id location;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "itemQueue_items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    v4 = 0;
    do
    {
      objc_msgSend(a1[4], "itemQueue_items");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "setItemQueue_isStoredOnServer:", 1);
      objc_msgSend(v6, "itemQueue_typeOrder");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "copy");

      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v26;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v26 != v12)
              objc_enumerationMutation(v10);
            v14 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v13);
            objc_initWeak(&location, a1[4]);
            v15 = [PBItemRepresentation alloc];
            v20[0] = MEMORY[0x1E0C809B0];
            v20[1] = 3221225472;
            v20[2] = __92__PBItemCollection_setUsesServerConnectionToLoadDataWithAuthenticationBlock_dataOwnerBlock___block_invoke_2;
            v20[3] = &unk_1E2431DE0;
            objc_copyWeak(v23, &location);
            v21 = a1[5];
            v16 = a1[6];
            v23[1] = v4;
            v22 = v16;
            v20[4] = v14;
            v17 = -[PBItemRepresentation initWithType:preferredRepresentation:v3_loader:](v15, "initWithType:preferredRepresentation:v3_loader:", v14, 1, v20);
            objc_msgSend(v6, "itemQueue_setItemRepresentation:", v17);

            objc_destroyWeak(v23);
            objc_destroyWeak(&location);
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v11);
      }

      objc_msgSend(a1[4], "itemQueue_items");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

      ++v4;
    }
    while ((unint64_t)v4 < v19);
  }
}

uint64_t __36__PBItemCollection_encodeWithCoder___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "itemQueue_items");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "itemQueue_metadata");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1 + 32), "itemQueue_privateMetadata");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  objc_msgSend(*(id *)(a1 + 32), "itemQueue_UUID");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  objc_msgSend(*(id *)(a1 + 32), "itemQueue_saveBootSession");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "itemQueue_saveTimestamp");
  objc_msgSend(*(id *)(a1 + 32), "itemQueue_originatorPersistentID");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v17;

  objc_msgSend(*(id *)(a1 + 32), "itemQueue_originatorBundleID");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v20;

  objc_msgSend(*(id *)(a1 + 32), "itemQueue_originatorTeamID");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
  v25 = *(void **)(v24 + 40);
  *(_QWORD *)(v24 + 40) = v23;

  objc_msgSend(*(id *)(a1 + 32), "itemQueue_originatorLocalizedName");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
  v28 = *(void **)(v27 + 40);
  *(_QWORD *)(v27 + 40) = v26;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "itemQueue_originatorDataOwner");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "itemQueue_isDeviceLockedPasteboard");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "itemQueue_isOrWasRemote");
  objc_msgSend(*(id *)(a1 + 32), "itemQueue_remoteDeviceName");
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = *(_QWORD *)(*(_QWORD *)(a1 + 144) + 8);
  v31 = *(void **)(v30 + 40);
  *(_QWORD *)(v30 + 40) = v29;

  result = objc_msgSend(*(id *)(a1 + 32), "itemQueue_originatorAllowedToCopyOnPaste");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 24) = result;
  return result;
}

void __25__PBItemCollection_items__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "itemQueue_items");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)itemQueue_items
{
  return self->_itemQueue_items;
}

uint64_t __34__PBItemCollection_copyWithItems___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "itemQueue_metadata");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "itemQueue_privateMetadata");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  result = objc_msgSend(*(id *)(a1 + 32), "itemQueue_originatorDataOwner");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

void __57__PBItemCollection_Pasteboard___setMetadataValue_forKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "itemQueue_metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v2, "mutableCopy");

  v3 = (uint64_t)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (id)v3;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 48));

  }
  else
  {
    objc_msgSend(v7, "removeObjectForKey:", *(_QWORD *)(a1 + 48));
  }
  objc_msgSend(*(id *)(a1 + 32), "setItemQueue_metadata:", v7);

}

void __28__PBItemCollection_metadata__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "itemQueue_metadata");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSDictionary)itemQueue_metadata
{
  return self->_itemQueue_metadata;
}

- (void)setItemQueue_metadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)itemQueue_privateMetadata
{
  return self->_itemQueue_privateMetadata;
}

- (int64_t)itemQueue_originatorDataOwner
{
  return self->_itemQueue_originatorDataOwner;
}

- (NSUUID)itemQueue_UUID
{
  return self->_itemQueue_UUID;
}

- (unint64_t)itemQueue_saveTimestamp
{
  return self->_itemQueue_saveTimestamp;
}

- (NSUUID)itemQueue_saveBootSession
{
  return self->_itemQueue_saveBootSession;
}

- (NSString)itemQueue_remoteDeviceName
{
  return self->_itemQueue_remoteDeviceName;
}

- (NSString)itemQueue_originatorTeamID
{
  return self->_itemQueue_originatorTeamID;
}

- (NSData)itemQueue_originatorPersistentID
{
  return self->_itemQueue_originatorPersistentID;
}

- (NSString)itemQueue_originatorLocalizedName
{
  return self->_itemQueue_originatorLocalizedName;
}

- (NSString)itemQueue_originatorBundleID
{
  return self->_itemQueue_originatorBundleID;
}

- (BOOL)itemQueue_originatorAllowedToCopyOnPaste
{
  return self->_itemQueue_originatorAllowedToCopyOnPaste;
}

- (BOOL)itemQueue_isOrWasRemote
{
  return self->_itemQueue_isOrWasRemote;
}

- (BOOL)itemQueue_isDeviceLockedPasteboard
{
  return self->_itemQueue_deviceLockedPasteboard;
}

- (void)setLocalOnly:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PBItemCollection _setMetadataValue:forKey:](self, "_setMetadataValue:forKey:", v4, CFSTR("localOnly"));

}

- (void)_setMetadataValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  PBItemQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PBItemCollection_Pasteboard___setMetadataValue_forKey___block_invoke;
  block[3] = &unk_1E2431978;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD block[20];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  id v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t (*v97)(uint64_t, uint64_t);
  void (*v98)(uint64_t);
  id v99;

  v4 = a3;
  v94 = 0;
  v95 = &v94;
  v96 = 0x3032000000;
  v97 = __Block_byref_object_copy__3;
  v98 = __Block_byref_object_dispose__3;
  v99 = 0;
  v88 = 0;
  v89 = &v88;
  v90 = 0x3032000000;
  v91 = __Block_byref_object_copy__3;
  v92 = __Block_byref_object_dispose__3;
  v93 = 0;
  v82 = 0;
  v83 = &v82;
  v84 = 0x3032000000;
  v85 = __Block_byref_object_copy__3;
  v86 = __Block_byref_object_dispose__3;
  v87 = 0;
  v76 = 0;
  v77 = &v76;
  v78 = 0x3032000000;
  v79 = __Block_byref_object_copy__3;
  v80 = __Block_byref_object_dispose__3;
  v81 = 0;
  v70 = 0;
  v71 = &v70;
  v72 = 0x3032000000;
  v73 = __Block_byref_object_copy__3;
  v74 = __Block_byref_object_dispose__3;
  v75 = 0;
  v66 = 0;
  v67 = &v66;
  v68 = 0x2020000000;
  v69 = 0;
  v60 = 0;
  v61 = &v60;
  v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__3;
  v64 = __Block_byref_object_dispose__3;
  v65 = 0;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__3;
  v58 = __Block_byref_object_dispose__3;
  v59 = 0;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__3;
  v52 = __Block_byref_object_dispose__3;
  v53 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__3;
  v46 = __Block_byref_object_dispose__3;
  v47 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__3;
  v28 = __Block_byref_object_dispose__3;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  block[2] = __36__PBItemCollection_encodeWithCoder___block_invoke;
  block[3] = &unk_1E2431D90;
  block[4] = self;
  block[5] = &v94;
  block[0] = MEMORY[0x1E0C809B0];
  block[6] = &v88;
  block[7] = &v82;
  block[8] = &v76;
  block[9] = &v70;
  block[10] = &v66;
  block[11] = &v60;
  block[12] = &v54;
  block[13] = &v48;
  block[14] = &v42;
  block[15] = &v38;
  block[16] = &v34;
  block[17] = &v30;
  block[18] = &v24;
  block[19] = &v20;
  dispatch_sync(v5, block);

  v6 = v95[5];
  if (v6)
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("items"));
  v7 = v89[5];
  if (v7)
    objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("metadata"));
  v8 = v83[5];
  if (v8)
    objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("privateMetadata"));
  v9 = v77[5];
  if (v9)
    objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("UUID"));
  -[PBItemCollection creationDate](self, "creationDate", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("creationDate"));
  v11 = v71[5];
  if (v11)
    objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("saveBootSession"));
  v12 = v67[3];
  if (v12)
    objc_msgSend(v4, "encodeInt64:forKey:", v12, CFSTR("saveTimestamp"));
  v13 = v61[5];
  if (v13)
    objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("persistentIdentifier"));
  v14 = v55[5];
  if (v14)
    objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("bundleIdentifier"));
  v15 = v49[5];
  if (v15)
    objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("teamIdentifier"));
  v16 = v43[5];
  if (v16)
    objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("localizedName"));
  v17 = v25[5];
  if (v17)
    objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("remoteDeviceName"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v35 + 24));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("deviceLocked"));

  objc_msgSend(v4, "encodeBool:forKey:", *((unsigned __int8 *)v31 + 24), CFSTR("isOrWasRemote"));
  objc_msgSend(v4, "encodeBool:forKey:", *((unsigned __int8 *)v21 + 24), CFSTR("allowedToCopyOnPaste"));
  objc_msgSend(v4, "encodeInteger:forKey:", v39[3], CFSTR("originatorDataOwner"));

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v54, 8);

  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v70, 8);

  _Block_object_dispose(&v76, 8);
  _Block_object_dispose(&v82, 8);

  _Block_object_dispose(&v88, 8);
  _Block_object_dispose(&v94, 8);

}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (id)copyWithItems:(id)a3
{
  id v4;
  NSObject *v5;
  PBItemCollection *v6;
  _QWORD v8[8];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__3;
  v23 = __Block_byref_object_dispose__3;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  v18 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __34__PBItemCollection_copyWithItems___block_invoke;
  v8[3] = &unk_1E2431D68;
  v8[4] = self;
  v8[5] = &v19;
  v8[6] = &v13;
  v8[7] = &v9;
  dispatch_sync(v5, v8);

  v6 = -[PBItemCollection initWithItems:]([PBItemCollection alloc], "initWithItems:", v4);
  -[PBItemCollection setMetadata:](v6, "setMetadata:", v20[5]);
  -[PBItemCollection setPrivateMetadata:](v6, "setPrivateMetadata:", v14[5]);
  -[PBItemCollection setOriginatorDataOwner:](v6, "setOriginatorDataOwner:", v10[3]);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v6;
}

- (PBItemCollection)initWithItems:(id)a3
{
  id v4;
  PBItemCollection *v5;
  uint64_t v6;
  NSArray *itemQueue_items;
  uint64_t v8;
  NSUUID *itemQueue_UUID;
  uint64_t v10;
  NSDate *creationDate;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PBItemCollection;
  v5 = -[PBItemCollection init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    itemQueue_items = v5->_itemQueue_items;
    v5->_itemQueue_items = (NSArray *)v6;

    v5->_itemQueue_isDataProvider = 1;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = objc_claimAutoreleasedReturnValue();
    itemQueue_UUID = v5->_itemQueue_UUID;
    v5->_itemQueue_UUID = (NSUUID *)v8;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v10;

  }
  return v5;
}

- (void)setPrivateMetadata:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PBItemCollection_setPrivateMetadata___block_invoke;
  block[3] = &unk_1E2430F08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)setOriginatorDataOwner:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__PBItemCollection_setOriginatorDataOwner___block_invoke;
  v6[3] = &unk_1E2431C50;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);

}

- (void)setMetadata:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__PBItemCollection_setMetadata___block_invoke;
  block[3] = &unk_1E2430F08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (NSString)name
{
  void *v2;
  void *v3;
  id v4;

  -[PBItemCollection metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSString *)v4;
}

- (NSArray)items
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  PBItemQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __25__PBItemCollection_items__block_invoke;
  v6[3] = &unk_1E24314F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (NSDate)expirationDate
{
  void *v2;
  void *v3;

  -[PBItemCollection metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("expirationDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSDictionary)metadata
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  PBItemQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __28__PBItemCollection_metadata__block_invoke;
  v6[3] = &unk_1E24314F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

uint64_t __43__PBItemCollection_setOriginatorDataOwner___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_originatorDataOwner:", *(_QWORD *)(a1 + 40));
}

uint64_t __39__PBItemCollection_setPrivateMetadata___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_privateMetadata:", *(_QWORD *)(a1 + 40));
}

uint64_t __32__PBItemCollection_setMetadata___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_metadata:", *(_QWORD *)(a1 + 40));
}

- (void)setItemQueue_originatorDataOwner:(int64_t)a3
{
  self->_itemQueue_originatorDataOwner = a3;
}

- (void)setItemQueue_privateMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_itemQueue_privateMetadata, a3);
}

- (void)setName:(id)a3
{
  -[PBItemCollection _setMetadataValue:forKey:](self, "_setMetadataValue:forKey:", a3, CFSTR("name"));
}

uint64_t __47__PBItemCollection_setOriginatorLocalizedName___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_originatorLocalizedName:", *(_QWORD *)(a1 + 40));
}

uint64_t __46__PBItemCollection_setOriginatorPersistentID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_originatorPersistentID:", *(_QWORD *)(a1 + 40));
}

uint64_t __42__PBItemCollection_setOriginatorBundleID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_originatorBundleID:", *(_QWORD *)(a1 + 40));
}

uint64_t __40__PBItemCollection_setOriginatorTeamID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_originatorTeamID:", *(_QWORD *)(a1 + 40));
}

uint64_t __39__PBItemCollection_setSaveBootSession___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_saveBootSession:", *(_QWORD *)(a1 + 40));
}

uint64_t __37__PBItemCollection_setSaveTimestamp___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_saveTimestamp:", *(_QWORD *)(a1 + 40));
}

uint64_t __28__PBItemCollection_setUUID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_UUID:", *(_QWORD *)(a1 + 40));
}

- (void)setItemQueue_saveTimestamp:(unint64_t)a3
{
  self->_itemQueue_saveTimestamp = a3;
}

- (void)setItemQueue_saveBootSession:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setItemQueue_originatorTeamID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setItemQueue_originatorPersistentID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setItemQueue_originatorLocalizedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)setItemQueue_originatorBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setItemQueue_UUID:(id)a3
{
  objc_storeStrong((id *)&self->_itemQueue_UUID, a3);
}

uint64_t __28__PBItemCollection_isRemote__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "itemQueue_remotePasteboardState");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result > 0;
  return result;
}

- (int64_t)itemQueue_remotePasteboardState
{
  return self->_itemQueue_remotePasteboardState;
}

- (void)setExpirationDate:(id)a3
{
  -[PBItemCollection _setMetadataValue:forKey:](self, "_setMetadataValue:forKey:", a3, CFSTR("expirationDate"));
}

- (void)setUsesServerConnectionToLoadDataWithAuthenticationBlock:(id)a3 dataOwnerBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  PBItemQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__PBItemCollection_setUsesServerConnectionToLoadDataWithAuthenticationBlock_dataOwnerBlock___block_invoke;
  block[3] = &unk_1E2431E08;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

- (void)registerLocalAvailableDerivedRepresentations
{
  NSObject *v3;
  _QWORD block[5];

  PBItemQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PBItemCollection_registerLocalAvailableDerivedRepresentations__block_invoke;
  block[3] = &unk_1E2430DF0;
  block[4] = self;
  dispatch_async(v3, block);

}

void __24__PBItemCollection_UUID__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "itemQueue_UUID");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setSaveTimestamp:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__PBItemCollection_setSaveTimestamp___block_invoke;
  v6[3] = &unk_1E2431C50;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);

}

- (void)setOriginatorPersistentID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__PBItemCollection_setOriginatorPersistentID___block_invoke;
  block[3] = &unk_1E2430F08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (BOOL)isRemote
{
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  PBItemQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__PBItemCollection_isRemote__block_invoke;
  v5[3] = &unk_1E24314F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

- (NSUUID)UUID
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  PBItemQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __24__PBItemCollection_UUID__block_invoke;
  v6[3] = &unk_1E24314F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSUUID *)v4;
}

void __64__PBItemCollection_registerLocalAvailableDerivedRepresentations__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "itemQueue_items", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "itemQueue_registerLocalAvailableDerivedRepresentations");
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)setItems:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__PBItemCollection_setItems___block_invoke;
  block[3] = &unk_1E2430F08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __29__PBItemCollection_setItems___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_items:", *(_QWORD *)(a1 + 40));
}

- (NSDictionary)privateMetadata
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  PBItemQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__PBItemCollection_privateMetadata__block_invoke;
  v6[3] = &unk_1E24314F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __35__PBItemCollection_privateMetadata__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "itemQueue_privateMetadata");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSXPCListenerEndpoint)dataConsumersEndpoint
{
  void *v2;
  void *v3;

  -[PBItemCollection dataConsumersListener](self, "dataConsumersListener");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSXPCListenerEndpoint *)v3;
}

- (BOOL)isDataProvider
{
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  PBItemQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__PBItemCollection_isDataProvider__block_invoke;
  v5[3] = &unk_1E24314F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

uint64_t __34__PBItemCollection_isDataProvider__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "itemQueue_isDataProvider");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSUUID)saveBootSession
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  PBItemQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__PBItemCollection_saveBootSession__block_invoke;
  v6[3] = &unk_1E24314F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSUUID *)v4;
}

void __35__PBItemCollection_saveBootSession__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "itemQueue_saveBootSession");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (unint64_t)saveTimestamp
{
  NSObject *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  PBItemQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__PBItemCollection_saveTimestamp__block_invoke;
  v6[3] = &unk_1E24314F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __33__PBItemCollection_saveTimestamp__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "itemQueue_saveTimestamp");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (NSData)originatorPersistentID
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  PBItemQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__PBItemCollection_originatorPersistentID__block_invoke;
  v6[3] = &unk_1E24314F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSData *)v4;
}

void __42__PBItemCollection_originatorPersistentID__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "itemQueue_originatorPersistentID");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSString)originatorBundleID
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  PBItemQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__PBItemCollection_originatorBundleID__block_invoke;
  v6[3] = &unk_1E24314F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __38__PBItemCollection_originatorBundleID__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "itemQueue_originatorBundleID");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSString)originatorTeamID
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  PBItemQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__PBItemCollection_originatorTeamID__block_invoke;
  v6[3] = &unk_1E24314F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __36__PBItemCollection_originatorTeamID__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "itemQueue_originatorTeamID");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSString)originatorLocalizedName
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  PBItemQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__PBItemCollection_originatorLocalizedName__block_invoke;
  v6[3] = &unk_1E24314F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __43__PBItemCollection_originatorLocalizedName__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "itemQueue_originatorLocalizedName");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)originatorAllowedToCopyOnPaste
{
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  PBItemQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__PBItemCollection_originatorAllowedToCopyOnPaste__block_invoke;
  v5[3] = &unk_1E24314F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

uint64_t __50__PBItemCollection_originatorAllowedToCopyOnPaste__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "itemQueue_originatorAllowedToCopyOnPaste");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setOriginatorAllowedToCopyOnPaste:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__PBItemCollection_setOriginatorAllowedToCopyOnPaste___block_invoke;
  v6[3] = &unk_1E2431C78;
  v6[4] = self;
  v7 = a3;
  dispatch_sync(v5, v6);

}

uint64_t __54__PBItemCollection_setOriginatorAllowedToCopyOnPaste___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_originatorAllowedToCopyOnPaste:", *(unsigned __int8 *)(a1 + 40));
}

- (int64_t)originatorDataOwner
{
  NSObject *v3;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  PBItemQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__PBItemCollection_originatorDataOwner__block_invoke;
  v6[3] = &unk_1E24314F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __39__PBItemCollection_originatorDataOwner__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "itemQueue_originatorDataOwner");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isDeviceLockedPasteboard
{
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  PBItemQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__PBItemCollection_isDeviceLockedPasteboard__block_invoke;
  v5[3] = &unk_1E24314F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

uint64_t __44__PBItemCollection_isDeviceLockedPasteboard__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "itemQueue_isDeviceLockedPasteboard");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setDeviceLockedPasteboard:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__PBItemCollection_setDeviceLockedPasteboard___block_invoke;
  v6[3] = &unk_1E2431C78;
  v6[4] = self;
  v7 = a3;
  dispatch_sync(v5, v6);

}

uint64_t __46__PBItemCollection_setDeviceLockedPasteboard___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_deviceLockedPasteboard:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)isOrWasRemote
{
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  PBItemQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__PBItemCollection_isOrWasRemote__block_invoke;
  v5[3] = &unk_1E24314F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

uint64_t __33__PBItemCollection_isOrWasRemote__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "itemQueue_isOrWasRemote");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setIsOrWasRemote:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__PBItemCollection_setIsOrWasRemote___block_invoke;
  v6[3] = &unk_1E2431C78;
  v6[4] = self;
  v7 = a3;
  dispatch_sync(v5, v6);

}

uint64_t __37__PBItemCollection_setIsOrWasRemote___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_isOrWasRemote:", *(unsigned __int8 *)(a1 + 40));
}

- (NSString)remoteDeviceName
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  PBItemQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__PBItemCollection_remoteDeviceName__block_invoke;
  v6[3] = &unk_1E24314F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __36__PBItemCollection_remoteDeviceName__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "itemQueue_remoteDeviceName");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setRemoteDeviceName:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__PBItemCollection_setRemoteDeviceName___block_invoke;
  block[3] = &unk_1E2430F08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __40__PBItemCollection_setRemoteDeviceName___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_remoteDeviceName:", *(_QWORD *)(a1 + 40));
}

- (UISPasteSharingToken)sharingToken
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  PBItemQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__PBItemCollection_sharingToken__block_invoke;
  v6[3] = &unk_1E24314F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (UISPasteSharingToken *)v4;
}

void __32__PBItemCollection_sharingToken__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "itemQueue_sharingToken");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setSharingToken:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__PBItemCollection_setSharingToken___block_invoke;
  block[3] = &unk_1E2430F08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __36__PBItemCollection_setSharingToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_sharingToken:", *(_QWORD *)(a1 + 40));
}

- (BOOL)loadsDataSynchronously
{
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  PBItemQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__PBItemCollection_loadsDataSynchronously__block_invoke;
  v5[3] = &unk_1E24314F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

uint64_t __42__PBItemCollection_loadsDataSynchronously__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "itemQueue_loadsDataSynchronously");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setLoadsDataSynchronously:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__PBItemCollection_setLoadsDataSynchronously___block_invoke;
  v6[3] = &unk_1E2431C78;
  v6[4] = self;
  v7 = a3;
  dispatch_sync(v5, v6);

}

uint64_t __46__PBItemCollection_setLoadsDataSynchronously___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_loadsDataSynchronously:", *(unsigned __int8 *)(a1 + 40));
}

- (id)dataConsumersListener
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  PBItemQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__PBItemCollection_dataConsumersListener__block_invoke;
  v6[3] = &unk_1E2431140;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __41__PBItemCollection_dataConsumersListener__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[3])
  {
    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDelegate:", *(_QWORD *)(a1 + 32));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;
    v6 = v3;

    objc_msgSend(v6, "resume");
    v2 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v2, "itemQueue_dataConsumersListener");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;

  v5 = a4;

  objc_msgSend(v5, "resume");
  return 1;
}

- (void)setDataProviderEndpoint:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PBItemCollection_setDataProviderEndpoint___block_invoke;
  block[3] = &unk_1E2430F08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __44__PBItemCollection_setDataProviderEndpoint___block_invoke(uint64_t a1)
{
  char *i;
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  PBItemRepresentation *v15;
  PBItemRepresentation *v16;
  uint64_t v17;
  _QWORD v18[5];
  id v19[2];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id location;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setItemQueue_remoteDataProviderEndpoint:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setItemQueue_remoteDataProviderConnection:", 0);
  if (*(_QWORD *)(a1 + 40))
  {
    v17 = a1;
    objc_initWeak(&location, *(id *)(a1 + 32));
    for (i = 0; ; ++i)
    {
      objc_msgSend(*(id *)(v17 + 32), "itemQueue_items", v17);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (unint64_t)i < objc_msgSend(v3, "count");

      if (!v4)
        break;
      objc_msgSend(*(id *)(v17 + 32), "itemQueue_items");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "itemQueue_typeOrder");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "copy");

      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v21;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v21 != v12)
              objc_enumerationMutation(v10);
            v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13);
            v15 = [PBItemRepresentation alloc];
            v18[0] = MEMORY[0x1E0C809B0];
            v18[1] = 3221225472;
            v18[2] = __44__PBItemCollection_setDataProviderEndpoint___block_invoke_2;
            v18[3] = &unk_1E2431D18;
            objc_copyWeak(v19, &location);
            v18[4] = v14;
            v19[1] = i;
            v16 = -[PBItemRepresentation initWithType:preferredRepresentation:v3_loader:](v15, "initWithType:preferredRepresentation:v3_loader:", v14, 0, v18);
            objc_msgSend(v6, "itemQueue_setItemRepresentation:", v16);

            objc_destroyWeak(v19);
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        }
        while (v11);
      }

    }
    objc_destroyWeak(&location);
  }
}

id __44__PBItemCollection_setDataProviderEndpoint___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v21;
  id v22;
  uint8_t buf[16];
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[5];
  _QWORD v28[5];
  id v29;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_remoteDataProviderConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __44__PBItemCollection_setDataProviderEndpoint___block_invoke_3;
    v28[3] = &unk_1E2431CA0;
    v28[4] = *(_QWORD *)(a1 + 32);
    v9 = v4;
    v29 = v9;
    v10 = MEMORY[0x18D782EA4](v28);
    v22 = v4;
    if ((objc_msgSend(v6, "itemQueue_loadsDataSynchronously") & 1) != 0)
      objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v10, v10);
    else
      objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v10, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v8;
    v27[1] = 3221225472;
    v27[2] = __44__PBItemCollection_setDataProviderEndpoint___block_invoke_15;
    v27[3] = &unk_1E2431CC8;
    v27[4] = *(_QWORD *)(a1 + 32);
    v14 = (void *)MEMORY[0x18D782EA4](v27);
    objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 100);
    v16 = v8;
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "becomeCurrentWithPendingUnitCount:", 100);
    v17 = *(_QWORD *)(a1 + 48);
    v18 = *(_QWORD *)(a1 + 32);
    v24[0] = v16;
    v24[1] = 3221225472;
    v24[2] = __44__PBItemCollection_setDataProviderEndpoint___block_invoke_17;
    v24[3] = &unk_1E2431CF0;
    v25 = v15;
    v26 = v9;
    v19 = v15;
    objc_msgSend(v13, "loadRepresentationForItemAtIndex:type:completionBlock:", v17, v18, v24);
    objc_msgSend(v12, "resignCurrent");

    v4 = v22;
  }
  else
  {
    _PBLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18C53A000, v11, OS_LOG_TYPE_FAULT, "Cannot retrieve a strong reference to PBItemCollection.", buf, 2u);
    }

    PBCannotLoadRepresentationError(*(_QWORD *)(a1 + 32), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *, _QWORD))v4 + 2))(v4, 0, 0, 0, v7, 0);
    v12 = 0;
  }

  return v12;
}

void __44__PBItemCollection_setDataProviderEndpoint___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _PBLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_fault_impl(&dword_18C53A000, v4, OS_LOG_TYPE_FAULT, "Could not retrieve data representation of type %@. Error: %@", (uint8_t *)&v8, 0x16u);
  }

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    PBCannotLoadRepresentationError(*(_QWORD *)(a1 + 32), v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *, _QWORD))(v5 + 16))(v5, 0, 0, 0, v6, 0);

  }
}

void __44__PBItemCollection_setDataProviderEndpoint___block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _PBLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_fault_impl(&dword_18C53A000, v4, OS_LOG_TYPE_FAULT, "Could not call cleanup block for type %@. Error: %@", (uint8_t *)&v6, 0x16u);
  }

}

void __44__PBItemCollection_setDataProviderEndpoint___block_invoke_17(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, _QWORD *);
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v9 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __44__PBItemCollection_setDataProviderEndpoint___block_invoke_2_18;
  v13[3] = &unk_1E2430F08;
  v14 = v9;
  v10 = *(_QWORD *)(a1 + 40);
  v15 = *(id *)(a1 + 32);
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, _QWORD *))(v10 + 16);
  v12 = v9;
  v11(v10, a2, a3, 0, a4, v13);

}

uint64_t __44__PBItemCollection_setDataProviderEndpoint___block_invoke_2_18(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return objc_msgSend(*(id *)(result + 40), "callCleanupBlockWithUUID:");
  return result;
}

- (void)waitForItemRequestsDeliveryCompletion:(id)a3
{
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;

  v5 = a3;
  if (v5)
  {
    PBItemQueue();
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__PBItemCollection_waitForItemRequestsDeliveryCompletion___block_invoke;
    block[3] = &unk_1E24314A0;
    block[4] = self;
    v7 = v5;
    dispatch_sync(v4, block);

  }
}

void __58__PBItemCollection_waitForItemRequestsDeliveryCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
  {
    v2 = MEMORY[0x1E0C809B0];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __58__PBItemCollection_waitForItemRequestsDeliveryCompletion___block_invoke_2;
    v7[3] = &unk_1E2431168;
    v8 = *(id *)(a1 + 40);
    v3 = (void *)MEMORY[0x18D782EA4](v7);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "remoteObjectProxyWithErrorHandler:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = v2;
    v5[1] = 3221225472;
    v5[2] = __58__PBItemCollection_waitForItemRequestsDeliveryCompletion___block_invoke_21;
    v5[3] = &unk_1E2431110;
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v4, "waitForItemRequestsDeliveryCompletion:", v5);

  }
  else
  {
    PBDispatchAsyncCallback(*(void **)(a1 + 40));
  }
}

void __58__PBItemCollection_waitForItemRequestsDeliveryCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _PBLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_fault_impl(&dword_18C53A000, v4, OS_LOG_TYPE_FAULT, "Could not wait for item requests delivery. Error: %@", (uint8_t *)&v5, 0xCu);
  }

  PBDispatchAsyncCallback(*(void **)(a1 + 32));
}

void __58__PBItemCollection_waitForItemRequestsDeliveryCompletion___block_invoke_21(uint64_t a1)
{
  PBDispatchAsyncCallback(*(void **)(a1 + 32));
}

- (id)_remoteDataProviderConnection
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  PBItemQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__PBItemCollection__remoteDataProviderConnection__block_invoke;
  v6[3] = &unk_1E2431140;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __49__PBItemCollection__remoteDataProviderConnection__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "itemQueue_remoteDataProviderConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "itemQueue_remoteDataProviderEndpoint");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = objc_alloc(MEMORY[0x1E0CB3B38]);
      objc_msgSend(*(id *)(a1 + 32), "itemQueue_remoteDataProviderEndpoint");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v4, "initWithListenerEndpoint:", v5);

      PBNewDataProviderXPCInterface();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setRemoteObjectInterface:", v7);

      objc_initWeak(&location, *(id *)(a1 + 32));
      v11 = MEMORY[0x1E0C809B0];
      v12 = 3221225472;
      v13 = __49__PBItemCollection__remoteDataProviderConnection__block_invoke_2;
      v14 = &unk_1E2431D40;
      objc_copyWeak(&v15, &location);
      objc_msgSend(v6, "setInvalidationHandler:", &v11);
      objc_msgSend(*(id *)(a1 + 32), "setItemQueue_remoteDataProviderConnection:", v6, v11, v12, v13, v14);
      objc_msgSend(v6, "resume");
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "itemQueue_remoteDataProviderConnection");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void __49__PBItemCollection__remoteDataProviderConnection__block_invoke_2(uint64_t a1)
{
  NSObject *v1;
  id WeakRetained;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    PBItemQueue();
    v1 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__PBItemCollection__remoteDataProviderConnection__block_invoke_3;
    block[3] = &unk_1E2430DF0;
    block[4] = WeakRetained;
    dispatch_sync(v1, block);

  }
}

uint64_t __49__PBItemCollection__remoteDataProviderConnection__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  _PBLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_fault_impl(&dword_18C53A000, v2, OS_LOG_TYPE_FAULT, "Connection to data provider has been invalidated.", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_remoteDataProviderConnection:", 0);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)establishConnectionToDataProviderCompletionBlock:(SEL)a3
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  $115C4C562B26FF47E01F9F4EA65B5887 *result;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __69__PBItemCollection_establishConnectionToDataProviderCompletionBlock___block_invoke;
  v21[3] = &unk_1E2431110;
  v22 = v6;
  v8 = v6;
  v9 = (void *)MEMORY[0x18D782EA4](v21);
  -[PBItemCollection _remoteDataProviderConnection](self, "_remoteDataProviderConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v7;
  v17 = 3221225472;
  v18 = __69__PBItemCollection_establishConnectionToDataProviderCompletionBlock___block_invoke_2;
  v19 = &unk_1E2431168;
  v11 = v9;
  v20 = v11;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "helloCompletionBlock:", v11, v16, v17, v18, v19);
  -[PBItemCollection _remoteDataProviderConnection](self, "_remoteDataProviderConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "auditToken");
  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }

  return result;
}

uint64_t __69__PBItemCollection_establishConnectionToDataProviderCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __69__PBItemCollection_establishConnectionToDataProviderCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _PBLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    v5 = 136315394;
    v6 = "-[PBItemCollection establishConnectionToDataProviderCompletionBlock:]_block_invoke_2";
    v7 = 2112;
    v8 = v3;
    _os_log_fault_impl(&dword_18C53A000, v4, OS_LOG_TYPE_FAULT, "%s could not establish connection to data provider. Error: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (PBItemCollection)init
{
  return -[PBItemCollection initWithItems:](self, "initWithItems:", 0);
}

- (id)copyWithDoNothingLoaders
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  PBItemQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__PBItemCollection_copyWithDoNothingLoaders__block_invoke;
  v6[3] = &unk_1E2431140;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = -[PBItemCollection copyWithItems:](self, "copyWithItems:", v8[5]);
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __44__PBItemCollection_copyWithDoNothingLoaders__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "_itemQueue_copyWithDoNothingRepresentations", (_QWORD)v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)addItems:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__PBItemCollection_addItems___block_invoke;
  block[3] = &unk_1E2430F08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __29__PBItemCollection_addItems___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "mutableCopy");
  objc_msgSend(v2, "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = v2;

}

- (BOOL)hasItemWithRepresentationOfType:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PBItemCollection items](self, "items");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "hasRepresentationOfType:", v4, (_QWORD)v10) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)hasItemWithRepresentationConformingToType:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PBItemCollection items](self, "items");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "hasRepresentationConformingToType:", v4, (_QWORD)v10) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)canInstantiateObjectOfClass:(Class)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[PBItemCollection items](self, "items");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "canInstantiateObjectOfClass:", a3, (_QWORD)v11) & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (id)availableRepresentationTypes
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[PBItemCollection items](self, "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "availableTypes", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setUsesServerConnectionToLoadDataWithAuthenticationBlock:(id)a3
{
  -[PBItemCollection setUsesServerConnectionToLoadDataWithAuthenticationBlock:dataOwnerBlock:](self, "setUsesServerConnectionToLoadDataWithAuthenticationBlock:dataOwnerBlock:", a3, 0);
}

id __92__PBItemCollection_setUsesServerConnectionToLoadDataWithAuthenticationBlock_dataOwnerBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 100);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "becomeCurrentWithPendingUnitCount:", 100);
    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
    {
      (*(void (**)(void))(v9 + 16))();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }
    v11 = *(_QWORD *)(a1 + 48);
    if (v11)
      v18 = (*(uint64_t (**)(void))(v11 + 16))();
    else
      v18 = 0;
    +[PBServerConnection defaultConnection](PBServerConnection, "defaultConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 64);
    v16 = *(_QWORD *)(a1 + 32);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __92__PBItemCollection_setUsesServerConnectionToLoadDataWithAuthenticationBlock_dataOwnerBlock___block_invoke_3;
    v20[3] = &unk_1E2431DB8;
    v21 = v6;
    objc_msgSend(v12, "requestItemFromPasteboardWithName:UUID:authenticationMessage:itemIndex:typeIdentifier:dataOwner:loadContext:completionBlock:", v13, v14, v19, v15, v16, v18, v5, v20);

    objc_msgSend(v8, "resignCurrent");
  }
  else
  {
    if (v6)
    {
      PBCannotLoadRepresentationError(*(_QWORD *)(a1 + 32), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *, _QWORD))v6 + 2))(v6, 0, 0, 0, v10, 0);

    }
    v8 = 0;
  }

  return v8;
}

uint64_t __92__PBItemCollection_setUsesServerConnectionToLoadDataWithAuthenticationBlock_dataOwnerBlock___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, a3, a4, a5, 0);
  return result;
}

- (void)addInvalidationDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__PBItemCollection_addInvalidationDelegate___block_invoke;
  v7[3] = &unk_1E2430F08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __44__PBItemCollection_addInvalidationDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "itemQueue_invalidationDelegates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setItemQueue_invalidationDelegates:", v3);

  }
  objc_msgSend(*(id *)(a1 + 32), "itemQueue_invalidationDelegates");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 40));

}

- (void)removeInvalidationDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__PBItemCollection_removeInvalidationDelegate___block_invoke;
  v7[3] = &unk_1E2430F08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __47__PBItemCollection_removeInvalidationDelegate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "itemQueue_invalidationDelegates");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

- (void)setIsRemote:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__PBItemCollection_setIsRemote___block_invoke;
  v6[3] = &unk_1E2431C78;
  v6[4] = self;
  v7 = a3;
  dispatch_sync(v5, v6);

}

uint64_t __32__PBItemCollection_setIsRemote___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  if (*(_BYTE *)(a1 + 40))
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "itemQueue_remotePasteboardState");
    if (v2 <= 1)
      v3 = 1;
    else
      v3 = v2;
  }
  else
  {
    v3 = 0;
  }
  result = objc_msgSend(*(id *)(a1 + 32), "setItemQueue_remotePasteboardState:", v3);
  if (*(_BYTE *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_isOrWasRemote:", 1);
  return result;
}

- (BOOL)isRemoteMetadataLoaded
{
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  PBItemQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__PBItemCollection_isRemoteMetadataLoaded__block_invoke;
  v5[3] = &unk_1E24314F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

uint64_t __42__PBItemCollection_isRemoteMetadataLoaded__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "itemQueue_remotePasteboardState");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result > 1;
  return result;
}

- (void)setRemoteMetadataLoaded
{
  NSObject *v3;
  _QWORD block[5];

  PBItemQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__PBItemCollection_setRemoteMetadataLoaded__block_invoke;
  block[3] = &unk_1E2430DF0;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __43__PBItemCollection_setRemoteMetadataLoaded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_remotePasteboardState:", 2);
}

- (BOOL)isRemoteDataLoaded
{
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  PBItemQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__PBItemCollection_isRemoteDataLoaded__block_invoke;
  v5[3] = &unk_1E24314F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

uint64_t __38__PBItemCollection_isRemoteDataLoaded__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "itemQueue_remotePasteboardState");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result == 3;
  return result;
}

- (void)setRemoteDataLoaded
{
  NSObject *v3;
  _QWORD block[5];

  PBItemQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PBItemCollection_setRemoteDataLoaded__block_invoke;
  block[3] = &unk_1E2430DF0;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __39__PBItemCollection_setRemoteDataLoaded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemQueue_remotePasteboardState:", 3);
}

- (void)setDataTransferDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  PBItemCollection *v9;

  v4 = a3;
  PBItemQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PBItemCollection_setDataTransferDelegate___block_invoke;
  block[3] = &unk_1E2430F08;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __44__PBItemCollection_setDataTransferDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
    v2 = *(void **)(a1 + 40);
  v3 = v2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(*(_QWORD *)(a1 + 40) + 48);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "itemQueue_setDataTransferDelegate:", v3, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  objc_storeWeak((id *)(*(_QWORD *)(a1 + 40) + 160), *(id *)(a1 + 32));
}

- (PBItemCollectionDataTransferDelegate)dataTransferDelegate
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  PBItemQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__PBItemCollection_dataTransferDelegate__block_invoke;
  v6[3] = &unk_1E24314F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (PBItemCollectionDataTransferDelegate *)v4;
}

void __40__PBItemCollection_dataTransferDelegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 160));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (void)item:(id)a3 representation:(id)a4 beganDataTransferWithProgress:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PBItemCollection dataTransferDelegate](self, "dataTransferDelegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "itemCollection:item:representation:beganDataTransferWithProgress:", self, v10, v9, v8);

}

- (void)item:(id)a3 representationFinishedDataTransfer:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PBItemCollection dataTransferDelegate](self, "dataTransferDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemCollection:item:representationFinishedDataTransfer:", self, v7, v6);

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)PBItemCollection;
  -[PBItemCollection description](&v26, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[PBItemCollection name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PBItemCollection isSystemPasteboard](self, "isSystemPasteboard");
  v7 = &stru_1E24329D8;
  if (v6)
    v7 = CFSTR(" (System)");
  objc_msgSend(v4, "appendFormat:", CFSTR("\nName               : %@%@\n"), v5, v7);

  -[PBItemCollection persistenceName](self, "persistenceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("Persistence name   : %@\n"), v8);

  -[PBItemCollection UUID](self, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("UUID               : %@\n"), v9);

  -[PBItemCollection creationDate](self, "creationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("Creation date      : %@\n"), v10);

  -[PBItemCollection originatorBundleID](self, "originatorBundleID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("Originator BundleID: %@\n"), v11);

  -[PBItemCollection originatorTeamID](self, "originatorTeamID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("Originator TeamID  : %@\n"), v12);

  -[PBItemCollection originatorLocalizedName](self, "originatorLocalizedName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("Originator localized name: %@\n"), v13);

  -[PBItemCollection metadata](self, "metadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("Metadata           : %@\n"), v14);

  -[PBItemCollection items](self, "items");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("Items: %u\n"), objc_msgSend(v15, "count"));

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[PBItemCollection items](self, "items");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v23;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(v4, "appendFormat:", CFSTR("%@\n"), *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v20++));
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v18);
  }

  return (NSString *)v4;
}

- (NSXPCListener)itemQueue_dataConsumersListener
{
  return self->_itemQueue_dataConsumersListener;
}

- (void)setItemQueue_dataConsumersListener:(id)a3
{
  objc_storeStrong((id *)&self->_itemQueue_dataConsumersListener, a3);
}

- (NSXPCListenerEndpoint)itemQueue_remoteDataProviderEndpoint
{
  return self->_itemQueue_remoteDataProviderEndpoint;
}

- (void)setItemQueue_remoteDataProviderEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_itemQueue_remoteDataProviderEndpoint, a3);
}

- (NSXPCConnection)itemQueue_remoteDataProviderConnection
{
  return self->_itemQueue_remoteDataProviderConnection;
}

- (void)setItemQueue_remoteDataProviderConnection:(id)a3
{
  objc_storeStrong((id *)&self->_itemQueue_remoteDataProviderConnection, a3);
}

- (void)setItemQueue_items:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (UISPasteSharingToken)itemQueue_sharingToken
{
  return self->_itemQueue_sharingToken;
}

- (void)setItemQueue_sharingToken:(id)a3
{
  objc_storeStrong((id *)&self->_itemQueue_sharingToken, a3);
}

- (BOOL)itemQueue_isDataProvider
{
  return self->_itemQueue_isDataProvider;
}

- (void)setItemQueue_isDataProvider:(BOOL)a3
{
  self->_itemQueue_isDataProvider = a3;
}

- (void)setItemQueue_originatorAllowedToCopyOnPaste:(BOOL)a3
{
  self->_itemQueue_originatorAllowedToCopyOnPaste = a3;
}

- (void)setItemQueue_deviceLockedPasteboard:(BOOL)a3
{
  self->_itemQueue_deviceLockedPasteboard = a3;
}

- (void)setItemQueue_isOrWasRemote:(BOOL)a3
{
  self->_itemQueue_isOrWasRemote = a3;
}

- (void)setItemQueue_remoteDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)setItemQueue_remotePasteboardState:(int64_t)a3
{
  self->_itemQueue_remotePasteboardState = a3;
}

- (PBItemCollectionDataTransferDelegate)itemQueue_dataTransferDelegate
{
  return (PBItemCollectionDataTransferDelegate *)objc_loadWeakRetained((id *)&self->_itemQueue_dataTransferDelegate);
}

- (void)setItemQueue_dataTransferDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_itemQueue_dataTransferDelegate, a3);
}

- (NSHashTable)itemQueue_invalidationDelegates
{
  return self->_itemQueue_invalidationDelegates;
}

- (void)setItemQueue_invalidationDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_itemQueue_invalidationDelegates, a3);
}

- (BOOL)itemQueue_loadsDataSynchronously
{
  return self->_itemQueue_loadsDataSynchronously;
}

- (void)setItemQueue_loadsDataSynchronously:(BOOL)a3
{
  self->_itemQueue_loadsDataSynchronously = a3;
}

- (NSString)persistenceName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PBItemCollection name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBItemCollection originatorBundleID](self, "originatorBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBItemCollection originatorTeamID](self, "originatorTeamID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PBPasteboardPersistenceName(v3, v4, v5, -[PBItemCollection isDeviceLockedPasteboard](self, "isDeviceLockedPasteboard"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (int64_t)changeCount
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PBItemCollection metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("changeCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 0;

  return v4;
}

- (void)setChangeCount:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PBItemCollection _setMetadataValue:forKey:](self, "_setMetadataValue:forKey:", v4, CFSTR("changeCount"));

}

- (BOOL)isGeneralPasteboard
{
  void *v2;
  char v3;

  -[PBItemCollection name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.UIKit.pboard.general"));

  return v3;
}

- (void)setPersistent:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PBItemCollection _setMetadataValue:forKey:](self, "_setMetadataValue:forKey:", v4, CFSTR("persistent"));

}

- (BOOL)isLocalOnly
{
  void *v2;
  void *v3;
  char v4;

  -[PBItemCollection metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("localOnly"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

@end
