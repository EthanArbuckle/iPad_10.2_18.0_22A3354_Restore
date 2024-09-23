@implementation PLAssetJournalEntryPayloadResource

- (PLAssetJournalEntryPayloadResource)initWithPayloadAttributes:(id)a3 payload:(id)a4
{
  id v7;
  id v8;
  PLAssetJournalEntryPayloadResource *v9;
  PLAssetJournalEntryPayloadResource *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PLAssetJournalEntryPayloadResource;
  v9 = -[PLAssetJournalEntryPayloadResource init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_payloadAttributes, a3);
    objc_storeStrong((id *)&v10->_payload, a4);
  }

  return v10;
}

- (id)validatedExternalResourceWithAsset:(id)a3 isCPLEnabled:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  PLValidatedExternalCloudResource *v7;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  id v36;
  void *v37;
  NSObject *v38;
  void *v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  PLAssetJournalEntryPayloadResource *v53;
  uint64_t v54;

  v4 = a4;
  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(PLValidatedExternalCloudResource);
  -[PLValidatedExternalResource setResourceType:](v7, "setResourceType:", -[PLAssetJournalEntryPayloadResource resourceType](self, "resourceType"));
  -[PLValidatedExternalResource setVersion:](v7, "setVersion:", -[PLAssetJournalEntryPayloadResource version](self, "version"));
  -[PLValidatedExternalResource setRecipeID:](v7, "setRecipeID:", -[PLAssetJournalEntryPayloadResource recipeID](self, "recipeID"));
  -[NSDictionary objectForKeyedSubscript:](self->_payloadAttributes, "objectForKeyedSubscript:", CFSTR("length"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLValidatedExternalResource setDataLength:](v7, "setDataLength:", objc_msgSend(v8, "longLongValue"));

  -[NSDictionary objectForKeyedSubscript:](self->_payloadAttributes, "objectForKeyedSubscript:", CFSTR("uwidth"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLValidatedExternalResource setUnorientedWidth:](v7, "setUnorientedWidth:", objc_msgSend(v9, "longLongValue"));

  -[NSDictionary objectForKeyedSubscript:](self->_payloadAttributes, "objectForKeyedSubscript:", CFSTR("uheight"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLValidatedExternalResource setUnorientedHeight:](v7, "setUnorientedHeight:", objc_msgSend(v10, "longLongValue"));

  -[PLAssetJournalEntryPayloadResource uniformTypeIdentifierString](self, "uniformTypeIdentifierString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLUniformTypeIdentifier utiWithIdentifier:](PLUniformTypeIdentifier, "utiWithIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLValidatedExternalResource setUniformTypeIdentifier:](v7, "setUniformTypeIdentifier:", v12);
  -[PLAssetJournalEntryPayloadResource fourCharCodeName](self, "fourCharCodeName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[PLAssetJournalEntryPayloadResource fourCharCodeName](self, "fourCharCodeName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLValidatedExternalResource setCodecFourCharCode:](v7, "setCodecFourCharCode:", v14);

  }
  -[PLValidatedExternalCloudResource setCplType:](v7, "setCplType:", -[PLAssetJournalEntryPayloadResource cplType](self, "cplType"));
  -[NSDictionary objectForKeyedSubscript:](self->_payloadAttributes, "objectForKeyedSubscript:", CFSTR("fingerprint"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLValidatedExternalCloudResource setFingerprint:](v7, "setFingerprint:", v15);

  -[NSDictionary objectForKeyedSubscript:](self->_payloadAttributes, "objectForKeyedSubscript:", CFSTR("stableHash"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLValidatedExternalCloudResource setStableHash:](v7, "setStableHash:", v16);

  if (v4 && -[PLValidatedExternalCloudResource cplType](v7, "cplType"))
  {
    -[NSDictionary objectForKeyedSubscript:](self->_payloadAttributes, "objectForKeyedSubscript:", CFSTR("remoteAvailability"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLValidatedExternalCloudResource setRemoteAvailability:](v7, "setRemoteAvailability:", (__int16)objc_msgSend(v17, "integerValue"));

    -[NSDictionary objectForKeyedSubscript:](self->_payloadAttributes, "objectForKeyedSubscript:", CFSTR("cloudLocalState"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLValidatedExternalCloudResource setCloudLocalState:](v7, "setCloudLocalState:", (__int16)objc_msgSend(v18, "integerValue"));

  }
  else
  {
    -[PLValidatedExternalCloudResource setRemoteAvailability:](v7, "setRemoteAvailability:", 0);
    -[PLValidatedExternalCloudResource setCloudLocalState:](v7, "setCloudLocalState:", 0);
  }
  objc_msgSend(v6, "master");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "creationDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLValidatedExternalCloudResource setMasterDateCreated:](v7, "setMasterDateCreated:", v20);

  -[NSDictionary objectForKeyedSubscript:](self->_payloadAttributes, "objectForKeyedSubscript:", CFSTR("ptpTrashedState"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLValidatedExternalResource setPtpTrashedState:](v7, "setPtpTrashedState:", objc_msgSend(v21, "integerValue"));

  -[NSDictionary objectForKeyedSubscript:](self->_payloadAttributes, "objectForKeyedSubscript:", CFSTR("sidecarIndex"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLValidatedExternalResource setSidecarIndex:](v7, "setSidecarIndex:", v22);

  if (!-[PLAssetJournalEntryPayloadResource isReferenceResource](self, "isReferenceResource"))
  {
    objc_msgSend((id)objc_opt_class(), "_applyLargeVideoRecipeRefactorFixToExternalResource:withAsset:", v7, v6);
    if (-[PLAssetJournalEntryPayloadResource cplType](self, "cplType") == 1)
    {
      objc_msgSend(v6, "mainFileURL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLValidatedExternalResource setFileURL:](v7, "setFileURL:", v23);

    }
    else
    {
      objc_msgSend(v6, "pathManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "isUBF"))
      {
        if (v12)
        {
          v25 = objc_alloc(MEMORY[0x1E0D73278]);
          objc_msgSend(v6, "uuid");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "identifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)objc_msgSend(v25, "initWithAssetUuid:bundleScope:uti:resourceVersion:resourceType:recipeID:originalFilename:", v26, 0, v27, -[PLValidatedExternalResource version](v7, "version"), -[PLValidatedExternalResource resourceType](v7, "resourceType"), -[PLValidatedExternalResource recipeID](v7, "recipeID"), 0);

          objc_msgSend(v24, "readOnlyUrlWithIdentifier:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLValidatedExternalResource setFileURL:](v7, "setFileURL:", v29);

        }
        else
        {
          PLMigrationGetLog();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v6, "uuid");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v51 = v39;
            v52 = 2112;
            v53 = self;
            _os_log_impl(&dword_199541000, v38, OS_LOG_TYPE_ERROR, "Resource payload has nil UTI, cannot derive resource URL, assetUUID: %@, payload: %@", buf, 0x16u);

          }
        }
      }
      else
      {
        objc_msgSend(v12, "identifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLManagedAsset preferredFileExtensionForType:](PLManagedAsset, "preferredFileExtensionForType:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v49 = objc_retainAutorelease(v31);
        objc_msgSend(v49, "UTF8String");
        -[PLValidatedExternalResource version](v7, "version");
        -[PLValidatedExternalResource recipeID](v7, "recipeID");
        -[PLValidatedExternalResource resourceType](v7, "resourceType");
        objc_msgSend(v6, "filename");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "directory");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "photoDirectoryWithType:", 1);
        v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v48, "UTF8String");
        objc_msgSend(v24, "photoDirectoryWithType:", 4);
        v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v46, "UTF8String");
        objc_msgSend(v24, "photoDirectoryWithType:", 9);
        v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v43 = objc_msgSend(v44, "UTF8String");
        objc_msgSend(v24, "photoDirectoryWithType:", 10);
        v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v33 = objc_msgSend(v32, "UTF8String");
        objc_msgSend(v24, "photoDirectoryWithType:", 18);
        v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v35 = objc_msgSend(v34, "UTF8String");
        objc_msgSend(v24, "photoDirectoryWithType:", 12);
        v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v42 = objc_msgSend(v36, "UTF8String");
        v41 = v33;
        PLDCIMURLForResourceProperties();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLValidatedExternalResource setFileURL:](v7, "setFileURL:", v37, v43, v41, v35, v42, ");

      }
    }
  }

  return v7;
}

- (void)updateStoredResource:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PLPrimaryResourceDataStoreReferenceFileKey *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  -[PLAssetJournalEntryPayloadResource volumeUuidString](self, "volumeUuidString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLAssetJournalEntryPayloadResource volumeUuidString](self, "volumeUuidString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLFileSystemVolume volumeForObjectUUID:context:](PLFileSystemVolume, "volumeForObjectUUID:context:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFileSystemVolume:", v7);

  }
  if (-[PLAssetJournalEntryPayloadResource isReferenceResource](self, "isReferenceResource"))
  {
    objc_msgSend(v17, "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLManagedObject insertInManagedObjectContext:](PLFileSystemBookmark, "insertInManagedObjectContext:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLAssetJournalEntryPayloadResource bookmarkData](self, "bookmarkData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBookmarkData:", v10);

    -[PLAssetJournalEntryPayloadResource bookmarkPath](self, "bookmarkPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPathRelativeToVolume:", v11);

    objc_msgSend(v17, "setFileSystemBookmark:", v9);
    v12 = -[PLPrimaryResourceDataStoreReferenceFileKey initWithResourceType:]([PLPrimaryResourceDataStoreReferenceFileKey alloc], "initWithResourceType:", -[PLAssetJournalEntryPayloadResource resourceType](self, "resourceType"));
    -[PLPrimaryResourceDataStoreReferenceFileKey keyData](v12, "keyData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDataStoreKeyData:", v13);

    objc_msgSend(v17, "setLocalAvailability:", 1);
  }
  v14 = -[PLAssetJournalEntryPayloadResource trashedState](self, "trashedState");
  v15 = v17;
  if (v14)
  {
    objc_msgSend(v17, "setTrashedState:", -[PLAssetJournalEntryPayloadResource trashedState](self, "trashedState"));
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTrashedDate:", v16);

    v15 = v17;
  }

}

- (void)appendToDescriptionBuilder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  unsigned int v15;
  __CFString *v16;
  uint64_t v17;
  unsigned int v18;
  __CFString *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSDictionary allKeys](self->_payloadAttributes, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v10);
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("volume")))
        {
          -[PLAssetJournalEntryPayloadResource volumeUuidString](self, "volumeUuidString");
          v12 = objc_claimAutoreleasedReturnValue();
LABEL_8:
          v13 = (__CFString *)v12;
          objc_msgSend(v4, "appendName:object:", v11, v12);
          goto LABEL_19;
        }
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("type")))
        {
          v14 = (void *)MEMORY[0x1E0CB3940];
          v15 = -[PLAssetJournalEntryPayloadResource resourceType](self, "resourceType");
          v16 = CFSTR("invalid");
          if (v15 <= 0x1F)
            v16 = off_1E3662240[v15];
          v13 = v16;
          v17 = -[PLAssetJournalEntryPayloadResource resourceType](self, "resourceType");
          goto LABEL_17;
        }
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("version")))
        {
          v14 = (void *)MEMORY[0x1E0CB3940];
          v18 = -[PLAssetJournalEntryPayloadResource version](self, "version");
          v19 = CFSTR("cur");
          if (v18 <= 2)
            v19 = off_1E3662340[v18];
          v13 = v19;
          v17 = -[PLAssetJournalEntryPayloadResource version](self, "version");
LABEL_17:
          objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ (%d)"), v13, v17);
LABEL_18:
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendName:object:", v11, v20);

          goto LABEL_19;
        }
        if (!objc_msgSend(v11, "isEqualToString:", CFSTR("recipeID")))
        {
          if (!objc_msgSend(v11, "isEqualToString:", CFSTR("subType")))
          {
            -[NSDictionary objectForKeyedSubscript:](self->_payloadAttributes, "objectForKeyedSubscript:", v11);
            v12 = objc_claimAutoreleasedReturnValue();
            goto LABEL_8;
          }
          v25 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0D11440], "shortDescriptionForResourceType:", -[PLAssetJournalEntryPayloadResource cplType](self, "cplType"));
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "stringWithFormat:", CFSTR("%@ (%lu)"), v13, -[PLAssetJournalEntryPayloadResource cplType](self, "cplType"));
          goto LABEL_18;
        }
        +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", -[PLAssetJournalEntryPayloadResource recipeID](self, "recipeID"));
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v13 = v21;
        v22 = (void *)MEMORY[0x1E0CB3940];
        if (v21)
        {
          -[__CFString description](v21, "description");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringWithFormat:", CFSTR("%@ (%d_%d, %d)"), v23, -[PLAssetJournalEntryPayloadResource recipeID](self, "recipeID") >> 16, (unsigned __int16)-[PLAssetJournalEntryPayloadResource recipeID](self, "recipeID") >> 1, -[PLAssetJournalEntryPayloadResource recipeID](self, "recipeID"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendName:object:", v11, v24);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("None (%d)"), -[PLAssetJournalEntryPayloadResource recipeID](self, "recipeID"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendName:object:", v11, v23);
        }

LABEL_19:
        ++v10;
      }
      while (v8 != v10);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      v8 = v26;
    }
    while (v26);
  }

}

- (BOOL)isEqualToPayloadResource:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  char v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (objc_msgSend(v4, "cplType")
    && objc_msgSend(v4, "resourceType") != 5
    && (v5 = objc_msgSend(v4, "cplType"), v5 == -[PLAssetJournalEntryPayloadResource cplType](self, "cplType"))
    && (v6 = objc_msgSend(v4, "version"), v6 == -[PLAssetJournalEntryPayloadResource version](self, "version")))
  {
    v7 = 1;
  }
  else
  {
    v8 = objc_msgSend(v4, "resourceType");
    if (v8 == -[PLAssetJournalEntryPayloadResource resourceType](self, "resourceType")
      && (v9 = objc_msgSend(v4, "version"), v9 == -[PLAssetJournalEntryPayloadResource version](self, "version"))
      && (v10 = objc_msgSend(v4, "recipeID"), v10 == -[PLAssetJournalEntryPayloadResource recipeID](self, "recipeID")))
    {
      objc_msgSend(v4, "uniformTypeIdentifierString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAssetJournalEntryPayloadResource uniformTypeIdentifierString](self, "uniformTypeIdentifierString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v11, "isEqualToString:", v12);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (void)mergePayloadResource:(id)a3 nilAttributes:(id)a4
{
  objc_class *v6;
  id v7;
  NSDictionary *v8;
  void *v9;
  void *v10;
  NSDictionary *payloadAttributes;
  id v12;

  v12 = a4;
  v6 = (objc_class *)MEMORY[0x1E0C99E08];
  v7 = a3;
  v8 = (NSDictionary *)objc_msgSend([v6 alloc], "initWithDictionary:", self->_payloadAttributes);
  objc_msgSend(v7, "payloadAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDictionary addEntriesFromDictionary:](v8, "addEntriesFromDictionary:", v9);
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v12, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary removeObjectsForKeys:](v8, "removeObjectsForKeys:", v10);

  }
  payloadAttributes = self->_payloadAttributes;
  self->_payloadAttributes = v8;

}

- (unint64_t)cplType
{
  void *v2;
  unint64_t v3;

  -[NSDictionary objectForKeyedSubscript:](self->_payloadAttributes, "objectForKeyedSubscript:", CFSTR("subType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (unsigned)dataStoreClassID
{
  void *v2;
  unsigned __int16 v3;

  -[NSDictionary objectForKeyedSubscript:](self->_payloadAttributes, "objectForKeyedSubscript:", CFSTR("storeID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntValue");

  return v3;
}

- (unsigned)resourceType
{
  void *v2;
  unsigned int v3;

  -[NSDictionary objectForKeyedSubscript:](self->_payloadAttributes, "objectForKeyedSubscript:", CFSTR("type"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedShortValue");

  return v3;
}

- (unsigned)version
{
  void *v2;
  unsigned int v3;

  -[NSDictionary objectForKeyedSubscript:](self->_payloadAttributes, "objectForKeyedSubscript:", CFSTR("version"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedShortValue");

  return v3;
}

- (unsigned)recipeID
{
  void *v2;
  unsigned int v3;

  -[NSDictionary objectForKeyedSubscript:](self->_payloadAttributes, "objectForKeyedSubscript:", CFSTR("recipeID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (NSString)uniformTypeIdentifierString
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_payloadAttributes, "objectForKeyedSubscript:", CFSTR("uti"));
}

- (PLUniformTypeIdentifier)uniformTypeIdentifier
{
  void *v2;
  void *v3;

  -[PLAssetJournalEntryPayloadResource uniformTypeIdentifierString](self, "uniformTypeIdentifierString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLUniformTypeIdentifier utiWithIdentifier:](PLUniformTypeIdentifier, "utiWithIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PLUniformTypeIdentifier *)v3;
}

- (id)fourCharCodeName
{
  return -[NSDictionary objectForKeyedSubscript:](self->_payloadAttributes, "objectForKeyedSubscript:", CFSTR("codec"));
}

- (NSString)volumeUuidString
{
  PLManagedObjectJournalEntryPayload *payload;
  void *v3;
  void *v4;

  payload = self->_payload;
  -[NSDictionary objectForKeyedSubscript:](self->_payloadAttributes, "objectForKeyedSubscript:", CFSTR("volume"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLManagedObjectJournalEntryPayload UUIDStringForData:](payload, "UUIDStringForData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSData)bookmarkData
{
  return (NSData *)-[NSDictionary objectForKeyedSubscript:](self->_payloadAttributes, "objectForKeyedSubscript:", CFSTR("bookmarkData"));
}

- (NSString)bookmarkPath
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_payloadAttributes, "objectForKeyedSubscript:", CFSTR("bookmarkPath"));
}

- (signed)trashedState
{
  void *v2;
  signed __int16 v3;

  -[NSDictionary objectForKeyedSubscript:](self->_payloadAttributes, "objectForKeyedSubscript:", CFSTR("inTrash"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isOriginalResource
{
  PLAssetJournalEntryPayloadResource *v2;
  BOOL v3;

  v2 = self;
  if (-[PLAssetJournalEntryPayloadResource version](v2, "version"))
    v3 = 0;
  else
    v3 = (-[PLAssetJournalEntryPayloadResource recipeID](v2, "recipeID") & 1) == 0;

  return v3;
}

- (BOOL)isPrimaryResource
{
  unsigned int v3;

  if (-[PLAssetJournalEntryPayloadResource resourceType](self, "resourceType"))
  {
    v3 = -[PLAssetJournalEntryPayloadResource resourceType](self, "resourceType");
    if (v3 != 1)
      LOBYTE(v3) = -[PLAssetJournalEntryPayloadResource resourceType](self, "resourceType") == 2;
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)isAdjusted
{
  return -[PLAssetJournalEntryPayloadResource version](self, "version") == 2
      || -[PLAssetJournalEntryPayloadResource version](self, "version") == 1;
}

- (BOOL)isReferenceResource
{
  void *v3;
  BOOL v4;
  void *v5;

  -[PLAssetJournalEntryPayloadResource bookmarkData](self, "bookmarkData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[PLAssetJournalEntryPayloadResource bookmarkPath](self, "bookmarkPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (BOOL)isValidForPersistence
{
  return objc_msgSend((id)objc_opt_class(), "isValidForPersistenceWithRecipeID:", -[PLAssetJournalEntryPayloadResource recipeID](self, "recipeID"));
}

- (NSString)description
{
  return -[NSDictionary description](self->_payloadAttributes, "description");
}

- (NSDictionary)payloadAttributes
{
  return self->_payloadAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_payloadAttributes, 0);
}

+ (void)_applyLargeVideoRecipeRefactorFixToExternalResource:(id)a3 withAsset:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  int v15;
  int *v16;
  char *v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  char *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "recipeID") == 131473)
  {
    objc_msgSend(v6, "pathManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isUBF"))
    {
      objc_msgSend(v5, "uniformTypeIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = objc_alloc(MEMORY[0x1E0D73278]);
        objc_msgSend(v6, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v10, "initWithAssetUuid:bundleScope:uti:resourceVersion:resourceType:recipeID:originalFilename:", v11, 0, v9, objc_msgSend(v5, "version"), objc_msgSend(v5, "resourceType"), objc_msgSend(v5, "recipeID"), 0);

        objc_msgSend(v7, "readOnlyUrlWithIdentifier:", v12);
        v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        if (unlink((const char *)objc_msgSend(v13, "fileSystemRepresentation")) && *__error() != 2)
        {
          PLMigrationGetLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v15 = *__error();
            v16 = __error();
            v17 = strerror(*v16);
            *(_DWORD *)buf = 67109634;
            v19 = v15;
            v20 = 2082;
            v21 = v17;
            v22 = 2082;
            v23 = objc_msgSend(objc_retainAutorelease(v13), "fileSystemRepresentation");
            _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "unlink failed with errno %d (%{public}s) for path %{public}s", buf, 0x1Cu);
          }

        }
      }

    }
    objc_msgSend(v5, "setRecipeID:", 131077);

  }
}

+ (BOOL)isValidForPersistenceWithRecipeID:(unsigned int)a3
{
  return (a3 - 327687 > 6 || ((1 << (a3 - 7)) & 0x55) == 0) && a3 != 65747 && a3 != 65749;
}

@end
