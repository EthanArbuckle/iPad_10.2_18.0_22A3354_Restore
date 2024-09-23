@implementation PICinematicVideoUtilities

+ (BOOL)assetIsCinematicVideo:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a1, "cinematicMetadataFromAsset:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (BOOL)currentSystemCanRenderAsset:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v3 = objc_msgSend(a1, "renderingVersionFromAsset:error:", a3, &v8);
  v4 = v8;
  if (v3)
  {
    v5 = objc_msgSend(MEMORY[0x1E0D7F580], "isRenderVersionSupported:", v3);
  }
  else
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_14762);
    v6 = *MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_error_impl(&dword_1A6382000, v6, OS_LOG_TYPE_ERROR, "currentSystemCanRenderAsset: error retrieving rendering version from asset: %@", buf, 0xCu);
    }
    v5 = 0;
  }

  return v5;
}

+ (unint64_t)currentSystemRenderingVersion
{
  return objc_msgSend(MEMORY[0x1E0D7F580], "latestVersion");
}

+ (id)cinematicMetadataFromAsset:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a3, "metadata", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v7 = *MEMORY[0x1E0D7F5F8];
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "key");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v7);

        if ((v11 & 1) != 0)
        {
          v12 = v9;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

+ (unint64_t)renderingVersionFromAsset:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v15;
  void *v16;

  v7 = a3;
  if (v7)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PICinematicVideoUtilities.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset != nil"));

    if (a4)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PICinematicVideoUtilities.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error != NULL"));

LABEL_3:
  objc_msgSend(a1, "cinematicMetadataFromAsset:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = (void *)MEMORY[0x1E0D7F560];
    objc_msgSend(v8, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deserializeMetadataWithType:fromGlobalMetadata:error:", 2, v11, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = objc_msgSend(v12, "renderingVersion");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D520A0], "unsupportedError:object:", CFSTR("Unexpected global rendering metadata class"), v12);
        v13 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Can't find global cinematic metadata in asset"), v7);
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

@end
