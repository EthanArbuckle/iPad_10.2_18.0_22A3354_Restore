@implementation PLSharedStreamsDataStore

+ (unsigned)_masterThumbRecipeID
{
  return 272155;
}

+ (unsigned)storeClassID
{
  return 2;
}

+ (unsigned)keyLengthWithDataPreview:(unsigned __int8)a3
{
  return +[PLSharedStreamsDataStoreKey dataLengthFromPreviewByte:](PLSharedStreamsDataStoreKey, "dataLengthFromPreviewByte:", a3);
}

+ (id)supportedRecipes
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (signed)_cloudSharedAssetPlaceholderKindFromSharedStreamsResourceType:(unsigned int)a3
{
  if (a3 > 9)
    return 3;
  else
    return word_199B9B5F0[a3];
}

- (void)_prepareForDownloadNotification:(id)a3 atFileURL:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  const char *v17;
  NSObject *v18;
  id v19;
  dispatch_time_t v20;
  NSObject *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  int v26;
  _QWORD handler[5];
  id v28;
  uint64_t *v29;
  int out_token;
  _QWORD block[4];
  id v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  dispatch_group_t v39;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (_prepareForDownloadNotification_atFileURL_completion__onceToken != -1)
    dispatch_once(&_prepareForDownloadNotification_atFileURL_completion__onceToken, &__block_literal_global_15266);
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__15267;
  v38 = __Block_byref_object_dispose__15268;
  v39 = dispatch_group_create();
  dispatch_group_enter((dispatch_group_t)v35[5]);
  v11 = v35[5];
  v12 = _prepareForDownloadNotification_atFileURL_completion__mediaStreamDownloadQueue;
  v13 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__PLSharedStreamsDataStore__prepareForDownloadNotification_atFileURL_completion___block_invoke_38;
  block[3] = &unk_1E3675C58;
  v14 = v9;
  v32 = v14;
  v15 = v10;
  v33 = v15;
  dispatch_group_notify(v11, v12, block);
  out_token = 0;
  v16 = objc_retainAutorelease(v8);
  v17 = (const char *)objc_msgSend(v16, "UTF8String");
  v18 = _prepareForDownloadNotification_atFileURL_completion__mediaStreamDownloadQueue;
  handler[0] = v13;
  handler[1] = 3221225472;
  handler[2] = __81__PLSharedStreamsDataStore__prepareForDownloadNotification_atFileURL_completion___block_invoke_2;
  handler[3] = &unk_1E366C470;
  handler[4] = self;
  v19 = v16;
  v28 = v19;
  v29 = &v34;
  notify_register_dispatch(v17, &out_token, v18, handler);
  v20 = dispatch_time(0, 300000000000);
  v21 = _prepareForDownloadNotification_atFileURL_completion__mediaStreamDownloadQueue;
  v23[0] = v13;
  v23[1] = 3221225472;
  v23[2] = __81__PLSharedStreamsDataStore__prepareForDownloadNotification_atFileURL_completion___block_invoke_41;
  v23[3] = &unk_1E3664040;
  v24 = v19;
  v25 = &v34;
  v26 = out_token;
  v22 = v19;
  dispatch_after(v20, v21, v23);

  _Block_object_dispose(&v34, 8);
}

- (id)_utiStringForAsset:(id)a3 type:(unsigned int)a4
{
  id v5;
  void *v6;
  id *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  v6 = v5;
  switch(a4)
  {
    case 1u:
    case 2u:
      objc_msgSend(v5, "originalUniformTypeIdentifier");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3u:
    case 4u:
    case 5u:
      v7 = (id *)MEMORY[0x1E0CEC530];
      goto LABEL_7;
    case 6u:
      v7 = (id *)MEMORY[0x1E0CEC5B0];
      goto LABEL_7;
    case 7u:
    case 8u:
      v7 = (id *)MEMORY[0x1E0CEC558];
LABEL_7:
      objc_msgSend(*v7, "identifier");
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v9 = (void *)v8;
      break;
    default:
      v9 = 0;
      break;
  }

  return v9;
}

- (BOOL)_isDerivativeForSharedStreamsType:(unsigned int)a3
{
  return (a3 < 0xA) & (0x3B1u >> a3);
}

- (id)_sharedStreamsExternalResourceForAsset:(id)a3 album:(id)a4 type:(unsigned int)a5
{
  uint64_t v5;
  id v7;
  PLSharedStreamsValidatedExternalResource *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  int v22;
  float v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;

  v5 = *(_QWORD *)&a5;
  v7 = a3;
  v8 = objc_alloc_init(PLSharedStreamsValidatedExternalResource);
  -[PLSharedStreamsValidatedExternalResource setSharedStreamsType:](v8, "setSharedStreamsType:", v5);
  -[PLValidatedExternalResource setVersion:](v8, "setVersion:", 0);
  -[PLSharedStreamsDataStore _utiStringForAsset:type:](self, "_utiStringForAsset:type:", v7, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    +[PLUniformTypeIdentifier utiWithIdentifier:](PLUniformTypeIdentifier, "utiWithIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLValidatedExternalResource setUniformTypeIdentifier:](v8, "setUniformTypeIdentifier:", v10);

  }
  if (v5 > 9)
    v11 = 3;
  else
    v11 = dword_199B9B604[v5];
  -[PLValidatedExternalResource setResourceType:](v8, "setResourceType:", v11);
  switch((int)v5)
  {
    case 3:
      -[PLValidatedExternalResource setUnorientedWidth:](v8, "setUnorientedWidth:", objc_msgSend(v7, "originalWidth"));
      v12 = objc_msgSend(v7, "originalHeight");
      goto LABEL_19;
    case 4:
      +[PLPhotoSharingHelper derivedAssetSizeForMasterSizeWidth:height:derivativeType:withSpecificationInfo:](PLPhotoSharingHelper, "derivedAssetSizeForMasterSizeWidth:height:derivativeType:withSpecificationInfo:", 1, 0, (double)objc_msgSend(v7, "originalWidth"), (double)objc_msgSend(v7, "originalHeight"));
      goto LABEL_17;
    case 5:
      +[PLPhotoSharingHelper videoPosterFrameDimension](PLPhotoSharingHelper, "videoPosterFrameDimension");
      v16 = v15;
      v18 = v17;
      v19 = (double)objc_msgSend(v7, "width");
      v20 = (double)objc_msgSend(v7, "height");
      if (v16 <= v18)
        v21 = v18;
      else
        v21 = v16;
      v22 = (int)v21;
      v23 = v19 / v20;
      v13 = (double)(int)v21;
      v24 = v23;
      if (v19 <= v20)
      {
        v25 = (double)v22;
        v13 = rint(v24 * v13);
      }
      else
      {
        v25 = rint(v13 / v24);
      }
      goto LABEL_18;
    case 7:
      v26 = (double)objc_msgSend(v7, "width");
      v27 = (double)objc_msgSend(v7, "height");
      v28 = 360.0;
      goto LABEL_16;
    case 8:
      v26 = (double)objc_msgSend(v7, "width");
      v27 = (double)objc_msgSend(v7, "height");
      v28 = 720.0;
LABEL_16:
      +[PLPrimaryResourceDataStoreImageRecipe scaleOriginalSize:toShortSideTarget:maxLongSideLength:](PLPrimaryResourceDataStoreImageRecipe, "scaleOriginalSize:toShortSideTarget:maxLongSideLength:", v26, v27, v28, 0.0);
LABEL_17:
      v25 = v14;
LABEL_18:
      -[PLValidatedExternalResource setUnorientedWidth:](v8, "setUnorientedWidth:", (uint64_t)v13);
      v12 = (uint64_t)v25;
LABEL_19:
      -[PLValidatedExternalResource setUnorientedHeight:](v8, "setUnorientedHeight:", v12);
      break;
    default:
      break;
  }

  return v8;
}

- (signed)_localAvailabilityForAsset:(id)a3 album:(id)a4 type:(unsigned int)a5
{
  uint64_t v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  PLSharedStreamsDataStoreKey *v14;
  id v15;
  id v16;
  uint64_t v17;
  PLSharedStreamsDataStoreKey *v18;
  void *v19;
  void *v20;
  int v21;
  signed __int16 v22;

  v5 = *(_QWORD *)&a5;
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  switch((int)v5)
  {
    case 1:
    case 2:
      objc_msgSend(v7, "mainFileURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(v9, "fileExistsAtPath:", v12) == 0;
      goto LABEL_11;
    case 3:
      if (objc_msgSend(v7, "cloudPlaceholderKind") != 4)
        goto LABEL_5;
      v14 = [PLSharedStreamsDataStoreKey alloc];
      v15 = v7;
      v16 = v8;
      v17 = 3;
      goto LABEL_9;
    case 4:
      if (objc_msgSend(v7, "cloudPlaceholderKind") != 3)
        goto LABEL_14;
      v14 = [PLSharedStreamsDataStoreKey alloc];
      v15 = v7;
      v16 = v8;
      v17 = 4;
      goto LABEL_9;
    case 5:
      v14 = [PLSharedStreamsDataStoreKey alloc];
      v15 = v7;
      v16 = v8;
      v17 = 5;
      goto LABEL_9;
    case 6:
LABEL_5:
      v14 = [PLSharedStreamsDataStoreKey alloc];
      v15 = v7;
      v16 = v8;
      v17 = v5;
LABEL_9:
      v18 = -[PLSharedStreamsDataStoreKey initWithAsset:album:type:](v14, "initWithAsset:album:type:", v15, v16, v17);
      v12 = v18;
      if (v18)
      {
        -[PLSharedStreamsDataStoreKey fileURLForAssetID:](v18, "fileURLForAssetID:", v10);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "path");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v9, "fileExistsAtPath:", v20);

        v13 = v21 == 0;
LABEL_11:
        if (v13)
          v22 = -1;
        else
          v22 = 1;
      }
      else
      {
        v22 = -1;
      }

      break;
    default:
LABEL_14:
      v22 = -1;
      break;
  }

  return v22;
}

- (signed)_remoteAvailabilityForType:(unsigned int)a3
{
  return a3 - 3 < 6;
}

- (unsigned)_mainResourceTypeForAsset:(id)a3
{
  if (objc_msgSend(a3, "kind"))
    return 5;
  else
    return 3;
}

- (id)name
{
  return CFSTR("SharedStreams");
}

- (id)descriptionForSubtype:(int64_t)a3
{
  if (a3 > 9)
    return CFSTR("vid-post-frame");
  else
    return off_1E3675E60[a3];
}

- (id)keyFromKeyStruct:(const void *)a3
{
  return -[PLSharedStreamsDataStoreKey initWithKeyStruct:]([PLSharedStreamsDataStoreKey alloc], "initWithKeyStruct:", a3);
}

- (id)resourceDataForKey:(id)a3 assetID:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "fileURLForAssetID:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)resourceURLForKey:(id)a3 assetID:(id)a4
{
  return (id)objc_msgSend(a3, "fileURLForAssetID:", a4);
}

- (id)expectedFileURLForResource:(id)a3 asset:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  PLSharedStreamsDataStoreKey *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "albums");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    v10 = -[PLSharedStreamsDataStoreKey initWithAsset:album:type:]([PLSharedStreamsDataStoreKey alloc], "initWithAsset:album:type:", v6, v9, objc_msgSend(v5, "dataStoreSubtype"));

    objc_msgSend(v6, "assetID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSharedStreamsDataStoreKey fileURLForAssetID:](v10, "fileURLForAssetID:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)virtualResourcesForAsset:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)updateDerivativeResourcesForAsset:(id)a3 forLifecycleEvent:(unsigned int)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 <= 2 && objc_msgSend(v6, "isCloudSharedAsset"))
  {
    objc_msgSend(v6, "albums");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "anyObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v10;
      if (!objc_msgSend(v6, "kind"))
      {
        -[PLSharedStreamsDataStore _sharedStreamsExternalResourceForAsset:album:type:](self, "_sharedStreamsExternalResourceForAsset:album:type:", v6, v11, 4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v12);

      }
      if (objc_msgSend(v6, "kind") == 1)
      {
        -[PLSharedStreamsDataStore _sharedStreamsExternalResourceForAsset:album:type:](self, "_sharedStreamsExternalResourceForAsset:album:type:", v6, v11, 7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);
        -[PLSharedStreamsDataStore _sharedStreamsExternalResourceForAsset:album:type:](self, "_sharedStreamsExternalResourceForAsset:album:type:", v6, v11, 8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v14);

      }
    }

  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v15 = v7;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v28;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v19);
        v25 = 0;
        v26 = 0;
        -[PLSharedStreamsDataStore storeExternalResource:forAsset:options:error:resultingResource:](self, "storeExternalResource:forAsset:options:error:resultingResource:", v20, v6, 0, &v26, &v25);
        v21 = v26;
        v22 = v25;
        v23 = v22;
        if (v22)
        {
          objc_msgSend(v22, "setAsset:", v6);
          objc_msgSend(v8, "addObject:", v23);
        }

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v17);
  }

  return v8;
}

- (BOOL)canStoreExternalResource:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)storeExternalResource:(id)a3 forAsset:(id)a4 options:(id)a5 error:(id *)a6 resultingResource:(id *)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  char isKindOfClass;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  PLSharedStreamsDataStoreKey *v24;
  void *v25;
  void *v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  objc_msgSend(v10, "uniformTypeIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    -[PLResourceDataStore guessUTIForExternalResource:forAssetKind:](self, "guessUTIForExternalResource:forAssetKind:", v10, objc_msgSend(v11, "kind"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUniformTypeIdentifier:", v13);

    PLImageManagerGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v10;
      v30 = 2114;
      v31 = v15;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "[RM] guessed UTI for external resource: %{public}@ for asset uuid: %{public}@", buf, 0x16u);

    }
  }
  if (-[PLSharedStreamsDataStore canStoreExternalResource:](self, "canStoreExternalResource:", v10)
    && objc_msgSend(v11, "isCloudSharedAsset"))
  {
    v16 = v10;
    objc_msgSend(v11, "albums");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "anyObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {
      v20 = v18;
      objc_msgSend(v11, "fetchOrCreateResourceWithIdentity:", v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setDataStoreClassID:", (__int16)objc_msgSend((id)objc_opt_class(), "storeClassID"));
      objc_msgSend(v21, "setRecipeID:", objc_msgSend(v16, "recipeID"));
      objc_msgSend(v21, "setDataStoreSubtype:", objc_msgSend(v16, "sharedStreamsType"));
      objc_msgSend(v16, "codecFourCharCode");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(v16, "codecFourCharCode");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setCodecFourCharCodeName:", v23);

      }
      objc_msgSend(v21, "setUnorientedWidth:", objc_msgSend(v16, "unorientedWidth"));
      objc_msgSend(v21, "setUnorientedHeight:", objc_msgSend(v16, "unorientedHeight"));
      objc_msgSend(v21, "setLocalAvailability:", -[PLSharedStreamsDataStore _localAvailabilityForAsset:album:type:](self, "_localAvailabilityForAsset:album:type:", v11, v20, objc_msgSend(v16, "sharedStreamsType")));
      v27 = v20;
      if (objc_msgSend(v21, "localAvailability") == 1)
      {
        v24 = -[PLSharedStreamsDataStoreKey initWithAsset:album:type:]([PLSharedStreamsDataStoreKey alloc], "initWithAsset:album:type:", v11, v20, objc_msgSend(v16, "sharedStreamsType"));
        -[PLSharedStreamsDataStoreKey keyData](v24, "keyData");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setDataStoreKeyData:", v25);

      }
      else
      {
        objc_msgSend(v21, "setDataStoreKeyData:", 0);
      }
      objc_msgSend(v21, "setRemoteAvailability:", -[PLSharedStreamsDataStore _remoteAvailabilityForType:](self, "_remoteAvailabilityForType:", objc_msgSend(v16, "sharedStreamsType")));
      if (a7)
        *a7 = objc_retainAutorelease(v21);

    }
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)requestLocalAvailabilityChange:(signed __int16)a3 forResource:(id)a4 options:(id)a5 completion:(id)a6
{
  int v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __CFString *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id *v22;
  uint64_t *v23;
  void *v24;
  PLSharedStreamsDataStoreKey *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  PLSharedStreamsDataStore *v46;
  NSObject *v47;
  __CFString *v48;
  __CFString *v49;
  __CFString *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  unsigned int v55;
  id v56;
  id v57;
  PLSharedStreamsDataStore *v58;
  NSObject *v59;
  void *v60;
  id v61;
  void (**v62)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v63;
  void *v64;
  void *v65;
  _QWORD v66[4];
  NSObject *v67;
  id v68;
  id v69;
  PLSharedStreamsDataStoreKey *v70;
  id v71;
  id v72;
  void (**v73)(_QWORD, _QWORD, _QWORD, _QWORD);
  int v74;
  _QWORD v75[4];
  id v76;
  id v77;
  uint8_t buf[4];
  __CFString *v79;
  __int16 v80;
  NSObject *v81;
  uint64_t v82;
  const __CFString *v83;
  uint64_t v84;
  __CFString *v85;
  uint64_t v86;
  __CFString *v87;
  uint64_t v88;
  _QWORD v89[4];

  v8 = a3;
  v89[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "asset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "dataStoreSubtype");
  objc_msgSend(v10, "objectID");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "albums");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "anyObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "assetID");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "photoLibrary");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isTransient"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Transient downloads not supported for shared streams"));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    PLImageManagerGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v79 = v17;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0D74600];
    v88 = *MEMORY[0x1E0CB2D50];
    v89[0] = v17;
    v21 = (void *)MEMORY[0x1E0C99D80];
    v22 = (id *)v89;
    v23 = &v88;
LABEL_19:
    objc_msgSend(v21, "dictionaryWithObjects:forKeys:count:", v22, v23, 1);
    v25 = (PLSharedStreamsDataStoreKey *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 47001, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD, _QWORD))v12 + 2))(v12, v26, 0, 0);
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v31 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v16, "objectID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringWithFormat:", CFSTR("Shared stream downloads are only supported for shared albums, album: %@"), v32);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

    PLImageManagerGetLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v79 = v17;
      _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0D74600];
    v86 = *MEMORY[0x1E0CB2D50];
    v87 = v17;
    v21 = (void *)MEMORY[0x1E0C99D80];
    v22 = (id *)&v87;
    v23 = &v86;
    goto LABEL_19;
  }
  objc_msgSend(v16, "photoLibrary");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Shared stream download requires photo library to be set on album."));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    PLImageManagerGetLog();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v79 = v17;
      _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0D74600];
    v84 = *MEMORY[0x1E0CB2D50];
    v85 = v17;
    v21 = (void *)MEMORY[0x1E0C99D80];
    v22 = (id *)&v85;
    v23 = &v84;
    goto LABEL_19;
  }
  v58 = self;
  v17 = v16;
  v25 = -[PLSharedStreamsDataStoreKey initWithAsset:album:type:]([PLSharedStreamsDataStoreKey alloc], "initWithAsset:album:type:", v13, v17, v14);
  -[PLSharedStreamsDataStoreKey fileURLForAssetID:](v25, "fileURLForAssetID:", v65);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v75[0] = MEMORY[0x1E0C809B0];
    v75[1] = 3221225472;
    v75[2] = __90__PLSharedStreamsDataStore_requestLocalAvailabilityChange_forResource_options_completion___block_invoke;
    v75[3] = &unk_1E3664068;
    v56 = v12;
    v77 = v56;
    v76 = v10;
    v62 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x19AEC174C](v75);
    if (v8 < 1)
    {
      PLImageManagerGetLog();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v41, OS_LOG_TYPE_DEBUG, "[RM] This business is totally not supported yet", buf, 2u);
      }
    }
    else
    {
      v60 = v11;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "path");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v27, "fileExistsAtPath:", v28);

      if (v54)
      {
        PLImageManagerGetLog();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          if (v14 > 9)
            v30 = CFSTR("vid-post-frame");
          else
            v30 = off_1E3675E60[v14];
          v49 = v30;
          *(_DWORD *)buf = 138412290;
          v79 = v49;
          _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_DEBUG, "[RM] Shared streams resource: %@ already on disk, skipping download and marking as locally available", buf, 0xCu);

        }
        -[PLSharedStreamsDataStoreKey keyData](v25, "keyData");
        v41 = objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, NSObject *, void *))v62)[2](v62, v64, v41, v63);
        v11 = v60;
      }
      else
      {
        v42 = -[PLSharedStreamsDataStore _cloudSharedAssetPlaceholderKindFromSharedStreamsResourceType:](v58, "_cloudSharedAssetPlaceholderKindFromSharedStreamsResourceType:", v14);
        objc_msgSend(v13, "uuid");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v42;
        +[PLPhotoSharingHelper downloadNotificationForAssetwithUUID:cloudPlaceholderKind:](PLPhotoSharingHelper, "downloadNotificationForAssetwithUUID:cloudPlaceholderKind:", v43, v42);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "uuid");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v66[0] = MEMORY[0x1E0C809B0];
        v66[1] = 3221225472;
        v66[2] = __90__PLSharedStreamsDataStore_requestLocalAvailabilityChange_forResource_options_completion___block_invoke_64;
        v66[3] = &unk_1E3664090;
        v74 = v14;
        v67 = v44;
        v68 = v45;
        v72 = v56;
        v73 = v62;
        v69 = v64;
        v70 = v25;
        v71 = v63;
        v57 = v45;
        v46 = v58;
        v59 = v67;
        -[PLSharedStreamsDataStore _prepareForDownloadNotification:atFileURL:completion:](v46, "_prepareForDownloadNotification:atFileURL:completion:", v67, v26, v66);
        PLImageManagerGetLog();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        {
          if (v14 > 9)
            v48 = CFSTR("vid-post-frame");
          else
            v48 = off_1E3675E60[v14];
          v50 = v48;
          *(_DWORD *)buf = 138412546;
          v79 = v50;
          v80 = 2112;
          v81 = v59;
          _os_log_impl(&dword_199541000, v47, OS_LOG_TYPE_DEBUG, "[RM] Starting download for shared streams resource: %@ with notification: %@", buf, 0x16u);

        }
        v51 = objc_msgSend(v60, "shouldPrioritize");
        v52 = objc_msgSend(v60, "shouldPrioritize");
        v53 = v51;
        v11 = v60;
        +[PLPhotoSharingHelper downloadAsset:cloudPlaceholderKind:shouldPrioritize:shouldExtendTimer:](PLPhotoSharingHelper, "downloadAsset:cloudPlaceholderKind:shouldPrioritize:shouldExtendTimer:", v13, v55, v53, v52);

        v41 = v59;
      }
    }

    v40 = v77;
  }
  else
  {
    v36 = (void *)MEMORY[0x1E0CB35C8];
    v61 = v11;
    v37 = *MEMORY[0x1E0D74600];
    v82 = *MEMORY[0x1E0CB2D50];
    v83 = CFSTR("Unable to generate a shared stream key.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v37;
    v11 = v61;
    objc_msgSend(v36, "errorWithDomain:code:userInfo:", v39, 5, v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, void *, _QWORD, _QWORD))v12 + 2))(v12, v40, 0, 0);
  }

LABEL_20:
  return 0;
}

- (BOOL)dataStoreSubtypeIsDownloadable:(int64_t)a3
{
  return (unint64_t)(a3 - 3) < 0xFFFFFFFFFFFFFFFELL;
}

- (BOOL)videoResource:(id)a3 matchesOrExceedsQualityLevel:(unsigned int)a4
{
  int v5;
  BOOL v6;

  v5 = objc_msgSend(a3, "dataStoreSubtype");
  v6 = a4 == 3;
  if (v5 != 7)
    v6 = 0;
  if (v5 == 8)
    v6 = 1;
  return v5 == 6 || v6;
}

- (BOOL)canStreamResource:(id)a3
{
  id v3;
  int v4;
  void *v5;
  char v6;
  BOOL v7;
  BOOL v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "dataStoreSubtype");
  objc_msgSend(v3, "uniformTypeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "conformsToMovie");
  if (v4 == 2)
    v7 = 0;
  else
    v7 = v6;
  v8 = v4 != 6 && v7;

  return v8;
}

- (void)requestStreamingURLForResource:(id)a3 asset:(id)a4 intent:(unint64_t)a5 timeRange:(id *)a6 streamingHints:(id)a7 inContext:(id)a8 clientBundleID:(id)a9 completion:(id)a10
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a10;
  objc_msgSend(v12, "mainFileURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "fileExistsAtPath:", v16);

  if (v17)
  {
    PLImageManagerGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v12, "cloudAssetGUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v30 = v14;
      v31 = 2112;
      v32 = v19;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "Using local file URL %@ for asset %@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dateByAddingTimeInterval:", 600.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD, void *, _QWORD, _QWORD))v13 + 2))(v13, v14, 0, v21, 0, 0);

    goto LABEL_13;
  }
  if (objc_msgSend(v11, "dataStoreSubtype") == 7)
  {
    v22 = 6;
LABEL_9:
    +[PLPhotoSharingHelper sharingPersonID](PLPhotoSharingHelper, "sharingPersonID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cloudAssetGUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D4D150], "sharedConnection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __133__PLSharedStreamsDataStore_requestStreamingURLForResource_asset_intent_timeRange_streamingHints_inContext_clientBundleID_completion___block_invoke;
    v27[3] = &unk_1E36640B8;
    v28 = v13;
    objc_msgSend(v25, "videoURLsForAssetCollectionWithGUID:forMediaAssetType:personID:completionBlock:", v24, v22, v23, v27);

    goto LABEL_13;
  }
  if (objc_msgSend(v11, "dataStoreSubtype") == 8)
  {
    v22 = 7;
    goto LABEL_9;
  }
  PLImageManagerGetLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_ERROR, "Resource does not support streaming URL", buf, 2u);
  }

  (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v13 + 2))(v13, 0, 0, 0, 0, 0);
LABEL_13:

}

- (id)requiredExternalResourcesForMigratingOrImportingAsset:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v4, "isCloudSharedAsset"))
  {
    objc_msgSend(v4, "albums");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      -[PLSharedStreamsDataStore _sharedStreamsExternalResourceForAsset:album:type:](self, "_sharedStreamsExternalResourceForAsset:album:type:", v4, v8, -[PLSharedStreamsDataStore _mainResourceTypeForAsset:](self, "_mainResourceTypeForAsset:", v4));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v9);
      if (objc_msgSend(v4, "isPhotoIris"))
      {
        -[PLSharedStreamsDataStore _sharedStreamsExternalResourceForAsset:album:type:](self, "_sharedStreamsExternalResourceForAsset:album:type:", v4, v8, 6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v10);

      }
    }

  }
  return v5;
}

void __133__PLSharedStreamsDataStore_requestStreamingURLForResource_asset_intent_timeRange_streamingHints_inContext_clientBundleID_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6;
  id v7;
  id v8;
  id v9;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = a4;
  v8 = a2;
  objc_msgSend(a3, "firstObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD, id, _QWORD, id))(v6 + 16))(v6, v9, 0, v7, 0, v8);

}

void __90__PLSharedStreamsDataStore_requestLocalAvailabilityChange_forResource_options_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __90__PLSharedStreamsDataStore_requestLocalAvailabilityChange_forResource_options_completion___block_invoke_2;
  v18[3] = &unk_1E3677530;
  v19 = v9;
  v20 = v7;
  v21 = v8;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __90__PLSharedStreamsDataStore_requestLocalAvailabilityChange_forResource_options_completion___block_invoke_3;
  v14[3] = &unk_1E3676290;
  v15 = v19;
  v17 = *(id *)(a1 + 40);
  v16 = *(id *)(a1 + 32);
  v11 = v19;
  v12 = v8;
  v13 = v7;
  objc_msgSend(v11, "performTransaction:completionHandler:", v18, v14);

}

void __90__PLSharedStreamsDataStore_requestLocalAvailabilityChange_forResource_options_completion___block_invoke_64(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  __CFString *v15;
  __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  const __CFString *v19;
  uint8_t buf[4];
  __CFString *v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  PLImageManagerGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = CFSTR("NO");
    v6 = *(__CFString **)(a1 + 32);
    if (a2)
      v5 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v21 = v6;
    v22 = 2112;
    v23 = v5;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEBUG, "[RM] Download notification received: %@, file present: %@", buf, 0x16u);
  }

  if ((a2 & 1) != 0)
  {
    v7 = *(_QWORD *)(a1 + 80);
    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "keyData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *, _QWORD))(v7 + 16))(v7, v8, v9, *(_QWORD *)(a1 + 64));
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0D11268];
    v18 = *MEMORY[0x1E0CB2938];
    v19 = CFSTR("Shared stream resource download request failed.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 81, v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    PLImageManagerGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = *(unsigned int *)(a1 + 88);
      if (v14 > 9)
        v15 = CFSTR("vid-post-frame");
      else
        v15 = off_1E3675E60[v14];
      v16 = v15;
      v17 = *(const __CFString **)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v21 = v16;
      v22 = 2112;
      v23 = v17;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Failed to download shared streams resource: %@ for asset: %@", buf, 0x16u);

    }
    (*(void (**)(_QWORD, void *, _QWORD, _QWORD))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), v9, 0, 0);
  }

}

void __90__PLSharedStreamsDataStore_requestLocalAvailabilityChange_forResource_options_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectWithID:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setLocalAvailability:", 1);
  objc_msgSend(v4, "setDataStoreKeyData:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recalculateImageRequestHints");

}

void __90__PLSharedStreamsDataStore_requestLocalAvailabilityChange_forResource_options_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __90__PLSharedStreamsDataStore_requestLocalAvailabilityChange_forResource_options_completion___block_invoke_4;
  v3[3] = &unk_1E3675C58;
  v5 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "performBlock:", v3);

}

void __90__PLSharedStreamsDataStore_requestLocalAvailabilityChange_forResource_options_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "fileURL");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v1 + 16))(v1, 0, 0, v2);

}

uint64_t __81__PLSharedStreamsDataStore__prepareForDownloadNotification_atFileURL_completion___block_invoke_38(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileExistsAtPath:", v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __81__PLSharedStreamsDataStore__prepareForDownloadNotification_atFileURL_completion___block_invoke_2(_QWORD *a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  PLBackendGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[5];
    v11 = 138412546;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "%@: Notified from assetsd for shared asset download notification %@", (uint8_t *)&v11, 0x16u);
  }

  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(NSObject **)(v7 + 40);
  if (v8)
  {
    dispatch_group_leave(v8);
    v7 = *(_QWORD *)(a1[6] + 8);
    v9 = *(void **)(v7 + 40);
  }
  else
  {
    v9 = 0;
  }
  *(_QWORD *)(v7 + 40) = 0;

  return notify_cancel(a2);
}

uint64_t __81__PLSharedStreamsDataStore__prepareForDownloadNotification_atFileURL_completion___block_invoke_41(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PLImageManagerGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEBUG, "[RM] Shared streams download timed out for notification: %@", (uint8_t *)&v8, 0xCu);
  }

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(NSObject **)(v4 + 40);
  if (v5)
  {
    dispatch_group_leave(v5);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v4 + 40);
  }
  else
  {
    v6 = 0;
  }
  *(_QWORD *)(v4 + 40) = 0;

  return notify_cancel(*(_DWORD *)(a1 + 48));
}

void __81__PLSharedStreamsDataStore__prepareForDownloadNotification_atFileURL_completion___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.assetsd.mediastreamdownloadqueue", v2);
  v1 = (void *)_prepareForDownloadNotification_atFileURL_completion__mediaStreamDownloadQueue;
  _prepareForDownloadNotification_atFileURL_completion__mediaStreamDownloadQueue = (uint64_t)v0;

}

@end
