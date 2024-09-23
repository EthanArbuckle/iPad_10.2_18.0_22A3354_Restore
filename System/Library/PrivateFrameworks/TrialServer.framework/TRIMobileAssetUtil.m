@implementation TRIMobileAssetUtil

+ (id)allTrialAssetTypes
{
  return &unk_1E9363690;
}

+ (id)siriTrialAssetTypes
{
  return &unk_1E93636A8;
}

+ (void)configureMobileAssetForTrialEnvironment:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  id v9;
  const __CFString *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  __CFString *v15;
  id v16;
  uint8_t buf[4];
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC0B90], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "populationType");

  if (a3 != 3)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", CFSTR("https://gdmf.apple.com/v2/assets"));
    v16 = (id)v11;
    if ((_DWORD)v6 != 5 && (_DWORD)v6 != 4)
    {
      if ((_DWORD)v6 != 3)
      {
LABEL_14:

        return;
      }
      if ((objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild") & 1) == 0)
      {
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", CFSTR("https://gdmf-staging-int.apple.com/v2/assets"));
        objc_msgSend(a1, "_setAllAssetsToAudience:siriAudience:assetURL:siriAssetURL:", CFSTR("ce9c2203-903b-4fb3-9f03-040dc2202694"), 0, v14, 0);

        goto LABEL_14;
      }
      v8 = CFSTR("ce9c2203-903b-4fb3-9f03-040dc2202694");
      v10 = CFSTR("0206c249-b301-46e0-9d6a-23ce9c5d875d");
      v9 = a1;
      v7 = 0;
      v12 = v16;
LABEL_13:
      objc_msgSend(v9, "_setAllAssetsToAudience:siriAudience:assetURL:siriAssetURL:", v8, v10, v7, v12);
      goto LABEL_14;
    }
    v9 = a1;
    v8 = 0;
    v10 = 0;
    v7 = v11;
LABEL_12:
    v12 = 0;
    goto LABEL_13;
  }
  if ((_DWORD)v6 == 3)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", CFSTR("https://gdmf-staging-int.apple.com/v2/assets"));
    v8 = CFSTR("9e2ceb05-96a4-4218-a942-74cdd002ea13");
    v9 = a1;
    v10 = 0;
    v16 = (id)v7;
    goto LABEL_12;
  }
  TRILogCategory_Server();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    if (v6 < 6 && ((0x37u >> v6) & 1) != 0)
    {
      v15 = off_1E932F840[(int)v6];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    *(_DWORD *)buf = 138543362;
    v18 = v15;
    _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, "Tried to configure MA for UAT environment with unexpected population: %{public}@", buf, 0xCu);

  }
}

+ (void)_setAllAssetsToAudience:(id)a3 siriAudience:(id)a4 assetURL:(id)a5 siriAssetURL:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  int v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  id v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v24 = a6;
  if (!v24)
    v24 = v12;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = a1;
  objc_msgSend(a1, "allTrialAssetTypes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (v11
          && (objc_msgSend(v13, "siriTrialAssetTypes"),
              v19 = (void *)objc_claimAutoreleasedReturnValue(),
              v20 = objc_msgSend(v19, "containsObject:", v18),
              v19,
              v20))
        {
          TRILogCategory_Server();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            v31 = v18;
            v32 = 2114;
            v33 = v11;
            v34 = 2114;
            v35 = v24;
            _os_log_impl(&dword_1D207F000, v21, OS_LOG_TYPE_DEFAULT, "Setting Siri-specific audience setting for %{public}@ to %{public}@ with Pallas URL %{public}@", buf, 0x20u);
          }

          MEMORY[0x1D82325E8](v24, v18);
          v22 = v11;
        }
        else
        {
          TRILogCategory_Server();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            v31 = v18;
            v32 = 2114;
            v33 = v10;
            v34 = 2114;
            v35 = v12;
            _os_log_impl(&dword_1D207F000, v23, OS_LOG_TYPE_DEFAULT, "Setting audience setting for %{public}@ to %{public}@ with Pallas URL %{public}@", buf, 0x20u);
          }

          MEMORY[0x1D82325E8](v12, v18);
          v22 = v10;
        }
        MEMORY[0x1D82325DC](v22, v18);
      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    }
    while (v15);
  }

}

@end
