@implementation PRSPosterUpdater

+ (BOOL)canUpdatesBeAppliedLocally:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "type", (_QWORD)v12);
        if ((unint64_t)(v8 - 13) >= 5 && v8 != 0)
        {
          v10 = 0;
          goto LABEL_14;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  v10 = 1;
LABEL_14:

  return v10;
}

+ (id)updaterForPath:(id)a3
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  if (v5)
  {
    v6 = a1;
    objc_sync_enter(v6);
    objc_getAssociatedObject(v5, a2);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v7 = -[PRSPosterUpdater _initWithWeakPath:]([PRSPosterUpdater alloc], "_initWithWeakPath:", v5);
      objc_setAssociatedObject(v5, a2, v7, (void *)1);
    }
    objc_sync_exit(v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (PRSPosterUpdater)init
{

  return 0;
}

- (id)_initWithWeakPath:(id)a3
{
  id v4;
  PRSPosterUpdater *v5;
  PRSPosterUpdater *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PRSPosterUpdater;
  v5 = -[PRSPosterUpdater init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_weakPath, v4);

  return v6;
}

- (BOOL)applyUpdateLocally:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 1;
  v11 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PRSPosterUpdater applyUpdatesLocally:error:](self, "applyUpdatesLocally:error:", v8, a4, v11, v12);
  return v9;
}

- (BOOL)applyUpdatesLocally:(id)a3 error:(id *)a4
{
  id v6;
  id WeakRetained;
  PRSPosterUpdater *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  id *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  BOOL v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  int v33;
  id v34;
  void *v35;
  void *v36;
  id PRPosterPathUtilitiesClass;
  void *v38;
  int v39;
  PRSService *v40;
  void *v41;
  void *v42;
  id v44;
  void *v45;
  id *v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[5];
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const __CFString *v59;
  uint64_t v60;
  const __CFString *v61;
  uint64_t v62;
  const __CFString *v63;
  _BYTE v64[128];
  uint64_t v65;
  _QWORD v66[3];

  v66[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_weakPath);
    if (!WeakRetained)
    {
      if (!a4)
      {
        v24 = 0;
LABEL_57:

        goto LABEL_58;
      }
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v65 = *MEMORY[0x1E0CB2D68];
      v66[0] = CFSTR("path is no longer valid.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, &v65, 1);
      v8 = (PRSPosterUpdater *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoardServices"), -1, v8);
      v24 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_56:

      goto LABEL_57;
    }
    v8 = self;
    objc_sync_enter(v8);
    objc_msgSend(WeakRetained, "instanceURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "checkResourceIsReachableAndReturnError:", a4) & 1) == 0)
    {
      v24 = 0;
LABEL_55:

      objc_sync_exit(v8);
      goto LABEL_56;
    }
    objc_msgSend(WeakRetained, "role");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = a4;
    v45 = v9;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v49, v64, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v50;
      v14 = *MEMORY[0x1E0D7F950];
      v15 = *MEMORY[0x1E0D7F928];
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v50 != v13)
            objc_enumerationMutation(v11);
          v17 = objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * v16), "type");
          if (v17 <= 0x11)
          {
            if (((1 << v17) & 0x3E1C6) != 0)
            {
              if ((objc_msgSend(v10, "isEqualToString:", v14) & 1) == 0)
              {
                v19 = v46;
                if (v46)
                {
                  v26 = (void *)MEMORY[0x1E0CB35C8];
                  v60 = *MEMORY[0x1E0CB2D68];
                  v61 = CFSTR("Lockscreen role is inconsistent with provided updates.");
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
                  v9 = v45;
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoardServices"), -1, v27);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_43:
                  v32 = v28;
                  goto LABEL_44;
                }
                goto LABEL_45;
              }
            }
            else if (((1 << v17) & 0x1200) != 0)
            {
              if ((objc_msgSend(v10, "isEqualToString:", v15) & 1) == 0)
              {
                v19 = v46;
                if (v46)
                {
                  v36 = (void *)MEMORY[0x1E0CB35C8];
                  v58 = *MEMORY[0x1E0CB2D68];
                  v59 = CFSTR("Ambient role is inconsistent with provided updates.");
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
                  v9 = v45;
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoardServices"), -1, v27);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  goto LABEL_43;
                }
LABEL_45:
                v24 = 0;
                v9 = v45;
                goto LABEL_54;
              }
            }
            else if (((1 << v17) & 0xC38) != 0)
            {
              v19 = v46;
              if (v46)
              {
                v29 = (void *)MEMORY[0x1E0CB35C8];
                v62 = *MEMORY[0x1E0CB2D68];
                v63 = CFSTR("update type is not valid for PRSPosterUpdater.");
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
                v9 = v45;
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PosterBoardServices"), -1, v27);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                goto LABEL_43;
              }
              goto LABEL_45;
            }
          }
          ++v16;
        }
        while (v12 != v16);
        v18 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v49, v64, 16);
        v12 = v18;
      }
      while (v18);
    }

    v19 = v46;
    v9 = v45;
    v48 = 0;
    objc_msgSend(getPRPosterPathUtilitiesClass(), "loadConfiguredPropertiesForPath:error:", WeakRetained, &v48);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v48;
    v21 = (void *)objc_msgSend(v20, "mutableCopy");
    v22 = v21;
    if (v21)
    {
      v23 = v21;
    }
    else
    {
      v54 = 0;
      v55 = &v54;
      v56 = 0x2050000000;
      v30 = (void *)getPRPosterMutableConfiguredPropertiesClass_softClass;
      v57 = getPRPosterMutableConfiguredPropertiesClass_softClass;
      if (!getPRPosterMutableConfiguredPropertiesClass_softClass)
      {
        v53[0] = MEMORY[0x1E0C809B0];
        v53[1] = 3221225472;
        v53[2] = __getPRPosterMutableConfiguredPropertiesClass_block_invoke;
        v53[3] = &unk_1E4D42598;
        v53[4] = &v54;
        __getPRPosterMutableConfiguredPropertiesClass_block_invoke((uint64_t)v53);
        v30 = (void *)v55[3];
      }
      v31 = objc_retainAutorelease(v30);
      _Block_object_dispose(&v54, 8);
      objc_msgSend(v31, "defaultConfiguredPropertiesForRole:", v10);
      v23 = (id)objc_claimAutoreleasedReturnValue();
    }
    v27 = v23;

    if (v44)
    {
      if (v46)
      {
        v32 = objc_retainAutorelease(v44);
        v11 = v32;
LABEL_44:
        v24 = 0;
        *v19 = v32;
LABEL_53:

LABEL_54:
        goto LABEL_55;
      }
      v24 = 0;
LABEL_52:
      v11 = v44;
      goto LABEL_53;
    }
    v47 = 0;
    v33 = objc_msgSend(v27, "applyUpdates:error:", v11, &v47);
    v34 = v47;
    v35 = v34;
    if (v34)
    {
      if (v46)
      {
        v24 = 0;
        *v46 = objc_retainAutorelease(v34);
LABEL_51:

        goto LABEL_52;
      }
LABEL_50:
      v24 = 0;
      goto LABEL_51;
    }
    if (v33)
    {
      PRPosterPathUtilitiesClass = getPRPosterPathUtilitiesClass();
      v38 = (void *)objc_msgSend(v27, "copy");
      v39 = objc_msgSend(PRPosterPathUtilitiesClass, "storeConfiguredPropertiesForPath:configuredProperties:error:", WeakRetained, v38, v46);

      if (!v39)
        goto LABEL_50;
      v40 = objc_alloc_init(PRSService);
      objc_msgSend(WeakRetained, "identity");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "posterUUID");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRSService notePosterConfigurationUnderlyingModelDidChange:](v40, "notePosterConfigurationUnderlyingModelDidChange:", v42);

    }
    v24 = 1;
    goto LABEL_51;
  }
  v24 = 1;
LABEL_58:

  return v24;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakPath);
}

@end
