@implementation PSIAlbumTranslator

+ (id)psiCollectionFromAlbum:(id)a3 indexingContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char valid;
  NSObject *v10;
  void *v11;
  PSIDate *v12;
  void *v13;
  PSIDate *v14;
  void *v15;
  PSIDate *v16;
  PSICollection *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  PSICollection *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  PSIDate *v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  valid = PLIsValidUUIDString();

  if ((valid & 1) != 0)
  {
    objc_msgSend(v7, "calendar");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_psiAssetForAlbum:calendar:", v6, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v30 = v7;
      v12 = [PSIDate alloc];
      objc_msgSend(v6, "startDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[PSIDate initWithUniversalDate:calendar:](v12, "initWithUniversalDate:calendar:", v13, v10);

      v14 = [PSIDate alloc];
      objc_msgSend(v6, "endDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[PSIDate initWithUniversalDate:calendar:](v14, "initWithUniversalDate:calendar:", v15, v10);

      v17 = [PSICollection alloc];
      objc_msgSend(v6, "uuid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "title");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "assets");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");
      objc_msgSend(v6, "startDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[PSICollection initWithUUID:startDate:endDate:title:subtitle:keyAssetPrivate:keyAssetShared:type:assetsCountPrivate:assetsCountShared:sortDate:](v17, "initWithUUID:startDate:endDate:title:subtitle:keyAssetPrivate:keyAssetShared:type:assetsCountPrivate:assetsCountShared:sortDate:", v18, v29, v16, v19, 0, v11, 0, 3, v21, 0, v22);

      objc_msgSend(v6, "title");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSIObject addContentString:category:owningCategory:](v23, "addContentString:category:owningCategory:", v24, 1400, 0);

      v7 = v30;
    }
    else
    {
      PLSearchBackendModelTranslationGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "uuid");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v32 = v27;
        _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_DEFAULT, "No key asset found for Album. Not translating Album: %@", buf, 0xCu);

      }
      v23 = 0;
    }

  }
  else
  {
    PLSearchBackendModelTranslationGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "uuid");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v25;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Invalid Album UUID: %{public}@. Not inserting Album into PSI.", buf, 0xCu);

    }
    v23 = 0;
  }

  return v23;
}

+ (id)_psiAssetForAlbum:(id)a3 calendar:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PSIAsset *v12;
  PSIDate *v13;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "keyAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(v5, "assets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateCreated");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length") || v11)
  {
    v13 = -[PSIDate initWithUniversalDate:calendar:]([PSIDate alloc], "initWithUniversalDate:calendar:", v11, v6);
    v12 = -[PSIAsset initWithUUID:creationDate:]([PSIAsset alloc], "initWithUUID:creationDate:", v10, v13);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
