@implementation PLCloudMasterMediaMetadata

+ (id)entityName
{
  return CFSTR("CloudMasterMediaMetadata");
}

- (id)payloadID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PLCloudMasterMediaMetadata cloudMaster](self, "cloudMaster");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PLCloudMasterMediaMetadata cloudMaster](self, "cloudMaster");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cloudMasterGUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLJournalEntryPayloadIDFactory payloadIDWithString:](PLJournalEntryPayloadIDFactory, "payloadIDWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PLCloudMasterMediaMetadata additionalAssetAttributes](self, "additionalAssetAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v6 = 0;
      return v6;
    }
    -[PLCloudMasterMediaMetadata additionalAssetAttributes](self, "additionalAssetAttributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:](PLJournalEntryPayloadIDFactory, "payloadIDWithUUIDString:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)_addPayloadIfValidForAsset:(id)a3 changedKeys:(id)a4 toPayloads:(id)a5 modelProperties:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  PLAssetJournalEntryPayload *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "payloadID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (objc_msgSend(v10, "isValidForJournalPersistence"))
    {
      v15 = -[PLAssetJournalEntryPayload initWithCloudMasterMediaMetadata:payloadID:changedKeys:modelProperties:]([PLAssetJournalEntryPayload alloc], "initWithCloudMasterMediaMetadata:payloadID:changedKeys:modelProperties:", self, v14, v11, v13);
      if (v15)
        objc_msgSend(v12, "addObject:", v15);
LABEL_8:

    }
  }
  else if (v10)
  {
    PLMigrationGetLog();
    v15 = (PLAssetJournalEntryPayload *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v15->super.super, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "objectID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v16;
      _os_log_impl(&dword_199541000, &v15->super.super, OS_LOG_TYPE_ERROR, "Skipping payload for CloudMasterMediaMetadata update with nil payloadID for existing object: %{public}@", (uint8_t *)&v17, 0xCu);

    }
    goto LABEL_8;
  }

}

- (id)payloadsForChangedKeys:(id)a3
{
  void *v4;
  PLCloudMasterMediaMetadata *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
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
  void *v25;
  void *v26;
  id v27;
  id obj;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PLCloudMasterMediaMetadata cloudMaster](self, "cloudMaster");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v5 = self;
    -[PLCloudMasterMediaMetadata cloudMaster](self, "cloudMaster");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v7;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v33 != v10)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          +[PLAssetJournalEntryPayload modelProperties](PLAssetJournalEntryPayload, "modelProperties");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("master"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "subRelationshipProperties");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("mediaMetadata"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "subRelationshipProperties");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLCloudMasterMediaMetadata _addPayloadIfValidForAsset:changedKeys:toPayloads:modelProperties:](v5, "_addPayloadIfValidForAsset:changedKeys:toPayloads:modelProperties:", v12, v31, v30, v17);

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v9);
    }

  }
  else
  {
    -[PLCloudMasterMediaMetadata additionalAssetAttributes](self, "additionalAssetAttributes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[PLCloudMasterMediaMetadata additionalAssetAttributes](self, "additionalAssetAttributes");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "asset");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      +[PLAssetJournalEntryPayload modelProperties](PLAssetJournalEntryPayload, "modelProperties");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("additionalAttributes"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "subRelationshipProperties");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("mediaMetadata"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "subRelationshipProperties");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLCloudMasterMediaMetadata _addPayloadIfValidForAsset:changedKeys:toPayloads:modelProperties:](self, "_addPayloadIfValidForAsset:changedKeys:toPayloads:modelProperties:", v20, v31, v30, v25);

    }
  }
  if (objc_msgSend(v30, "count"))
    v26 = v30;
  else
    v26 = 0;
  v27 = v26;

  return v27;
}

@end
