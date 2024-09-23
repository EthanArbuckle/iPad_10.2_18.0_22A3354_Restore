@implementation PASAsset2

void __68___PASAsset2_filesystemPathsForAssetDataRelativePaths_assetVersion___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  char v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v21 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_maFilesystemPathsForAssetDataRelativePaths:guardedData:isMissingData:assetVersion:", *(_QWORD *)(a1 + 40), v3, &v21, *(_QWORD *)(a1 + 56));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    v7 = v21 == 0;
  else
    v7 = 0;
  if (!v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "_defaultBundleFilesystemPathsForAssetDataRelativePaths:guardedData:assetVersion:", *(_QWORD *)(a1 + 40), v3, *(_QWORD *)(a1 + 56));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v21)
    {
      v10 = *(_QWORD **)(a1 + 32);
      v11 = v10[5];
      if (!v8)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v17 = v11;
          objc_msgSend(v10, "_assetDescription");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v23 = v18;
          _os_log_impl(&dword_1A0957000, v17, OS_LOG_TYPE_DEFAULT, "MAAsset for \"%@\" was missing data, and no default bundle was available for fallback!", buf, 0xCu);

        }
        goto LABEL_13;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        v19 = v11;
        objc_msgSend(v10, "_assetDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v23 = v20;
        _os_log_fault_impl(&dword_1A0957000, v19, OS_LOG_TYPE_FAULT, "Using default bundle fallback for \"%@\" due to missing MAAsset data.", buf, 0xCu);

      }
      if (_PASEvaluateLogFaultAndProbCrashCriteria())
        abort();
    }
    else if (!v8)
    {
LABEL_13:

      goto LABEL_14;
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v9);
    goto LABEL_13;
  }
LABEL_14:
  if (v3[7])
  {
    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v12)
      v13 = (void *)objc_msgSend(v12, "mutableCopy");
    else
      v13 = (void *)objc_opt_new();
    v14 = v13;
    objc_msgSend(v13, "addEntriesFromDictionary:", v3[7]);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

  }
}

intptr_t __37___PASAsset2_callAssetUpdateHandlers__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __28___PASAsset2_clearOverrides__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a2 + 56);
  *(_QWORD *)(a2 + 56) = 0;

}

uint64_t __58___PASAsset2_addOverridePath_forResourceWithRelativePath___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)a2[7];
  if (!v3)
  {
    v5 = a2;
    v6 = objc_opt_new();
    v7 = (void *)a2[7];
    a2[7] = v6;

    v3 = (void *)a2[7];
  }
  return objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __24___PASAsset2_bundlePath__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(*(id *)(a2 + 8), "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __52___PASAsset2_overrideDefaultBundleWithBundleAtPath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  id *v6;

  v6 = a2;
  v3 = *(void **)(a1 + 32);
  if (v3)
    v4 = (id)objc_msgSend(v3, "copy");
  else
    v4 = *(id *)(*(_QWORD *)(a1 + 40) + 16);
  v5 = v6[1];
  v6[1] = v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "_loadDefaultBundleVersionWithGuardedData:", v6);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_storeStrong(v6 + 1, *(id *)(*(_QWORD *)(a1 + 40) + 16));
    objc_msgSend(*(id *)(a1 + 40), "_loadDefaultBundleVersionWithGuardedData:", v6);
  }

}

uint64_t __52___PASAsset2__issueUpdateNotificationsWithCallback___block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_QWORD *)(a2 + 24);
  return result;
}

uint64_t __70___PASAsset2__purgeObsoleteInstalledAssetsFromCandidates_guardedData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  _QWORD *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "state");
  if (v4 > 6)
    goto LABEL_6;
  if (((1 << v4) & 0x4C) != 0)
  {
    v7 = 1;
    goto LABEL_8;
  }
  if (((1 << v4) & 0x11) == 0)
    goto LABEL_6;
  v5 = *(_QWORD **)(a1 + 32);
  v6 = v5[5];
  v7 = 0;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v6;
    objc_msgSend(v5, "_assetDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "attributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("_ContentVersion"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = v9;
    v15 = 2112;
    v16 = v11;
    v17 = 2048;
    v18 = objc_msgSend(v3, "state");
    _os_log_impl(&dword_1A0957000, v8, OS_LOG_TYPE_DEFAULT, "Found MAAsset \"%@\" with obsolete version %@, but not removing because state is %ld.", (uint8_t *)&v13, 0x20u);

LABEL_6:
    v7 = 0;
  }
LABEL_8:

  return v7;
}

void __70___PASAsset2__purgeObsoleteInstalledAssetsFromCandidates_guardedData___block_invoke_266(uint64_t a1, uint64_t a2)
{
  os_log_t *v3;
  os_log_t v4;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = *(os_log_t **)(a1 + 32);
  v4 = v3[5];
  if (a2)
  {
    if (os_log_type_enabled(v3[5], OS_LOG_TYPE_ERROR))
    {
      v6 = v4;
      -[os_log_t _assetDescription](v3, "_assetDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v12 = 138412802;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      v16 = 2048;
      v17 = a2;
      _os_log_error_impl(&dword_1A0957000, v6, OS_LOG_TYPE_ERROR, "Failed to purge installed MAAsset \"%@\" with obsolete version %@: error %ld", (uint8_t *)&v12, 0x20u);

    }
  }
  else if (os_log_type_enabled(v3[5], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v4;
    -[os_log_t _assetDescription](v3, "_assetDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    v12 = 138412546;
    v13 = v10;
    v14 = 2112;
    v15 = v11;
    _os_log_impl(&dword_1A0957000, v9, OS_LOG_TYPE_DEFAULT, "Successfully purged installed MAAsset \"%@\" with obsolete version %@.", (uint8_t *)&v12, 0x16u);

  }
}

uint64_t __51___PASAsset2_updateAssetMetadataUsingQueryResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, void *, void *, _BYTE *);
  void *v33;
  id v34;
  _BYTE *v35;
  _BYTE buf[24];
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(v5, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("_CompatibilityVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  v11 = *(_QWORD *)(a1 + 32);
  if (v7 != v10)
  {
    v18 = *(NSObject **)(v11 + 40);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v24 = v18;
      objc_msgSend(v5, "attributes");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("_ContentVersion"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "attributes");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("_CompatibilityVersion"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v26;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v28;
      *(_WORD *)&buf[22] = 2048;
      v37 = v29;
      _os_log_debug_impl(&dword_1A0957000, v24, OS_LOG_TYPE_DEBUG, "Ignoring MAAsset version %@ with compat version %@ (required compat version: %lu)", buf, 0x20u);

    }
    goto LABEL_8;
  }
  v12 = *(void **)(v11 + 24);
  if (v12)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v37) = 0;
    v30 = MEMORY[0x1E0C809B0];
    v31 = 3221225472;
    v32 = __51___PASAsset2_updateAssetMetadataUsingQueryResults___block_invoke_258;
    v33 = &unk_1E4431010;
    v34 = v5;
    v35 = buf;
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", &v30);
    v13 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) == 0;

    _Block_object_dispose(buf, 8);
    if (!v13)
    {
LABEL_8:
      v17 = 0;
      goto LABEL_9;
    }
  }
  objc_msgSend(v5, "attributes", v30, v31, v32, v33);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("_ContentVersion"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "intValue");

  if (v16 < 0)
  {
    v20 = *(_QWORD **)(a1 + 32);
    v21 = v20[5];
    v17 = 0;
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    v22 = v21;
    objc_msgSend(v20, "_assetDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v23;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v16;
    _os_log_impl(&dword_1A0957000, v22, OS_LOG_TYPE_DEFAULT, "Found MAAsset for \"%@\" with invalid version %d", buf, 0x12u);

    goto LABEL_8;
  }
  v17 = 1;
LABEL_9:

  return v17;
}

void __51___PASAsset2_updateAssetMetadataUsingQueryResults___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v18;
  os_log_t *v19;
  os_log_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  _QWORD *v30;
  NSObject *v31;
  _QWORD *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  id obj;
  _QWORD v43[5];
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v39 = *((_QWORD *)v3 + 3);
  v40 = *((_QWORD *)v3 + 4);
  v4 = (void *)*((_QWORD *)v3 + 5);
  *((_QWORD *)v3 + 5) = 0;

  v5 = *((_QWORD *)v3 + 2);
  *((_QWORD *)v3 + 3) = v5;
  *((_QWORD *)v3 + 4) = v5;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = *(id *)(a1 + 32);
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (!v6)
    goto LABEL_34;
  v8 = v6;
  v41 = 0;
  v9 = *(_QWORD *)v47;
  *(_QWORD *)&v7 = 138412546;
  v38 = v7;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v47 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
      objc_msgSend(v11, "attributes", v38);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("_ContentVersion"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (*((_QWORD *)v3 + 2) != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "compare:", v13);

        if (v15 != -1)
        {
          v32 = *(_QWORD **)(a1 + 40);
          v33 = v32[5];
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            v34 = v33;
            objc_msgSend(v32, "_assetDescription");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v51 = v35;
            _os_log_impl(&dword_1A0957000, v34, OS_LOG_TYPE_INFO, "Baseline asset for \"%@\" is still current. Not using MobileAsset.", buf, 0xCu);

          }
          goto LABEL_33;
        }
      }
      v16 = objc_msgSend(v11, "state");
      if (v16 <= 6 && ((1 << v16) & 0x64) != 0)
      {
        objc_msgSend(v11, "getLocalUrl");
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(os_log_t **)(a1 + 40);
        v20 = v19[5];
        if (!v18)
        {
          if (os_log_type_enabled(v19[5], OS_LOG_TYPE_ERROR))
          {
            v21 = v20;
            -[os_log_t _assetDescription](v19, "_assetDescription");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v51 = v22;
            _os_log_error_impl(&dword_1A0957000, v21, OS_LOG_TYPE_ERROR, "MAAsset for \"%@\" is missing localURL", buf, 0xCu);

          }
          goto LABEL_21;
        }
        v27 = (void *)v18;
        if (os_log_type_enabled(v19[5], OS_LOG_TYPE_DEFAULT))
        {
          v28 = v20;
          -[os_log_t _assetDescription](v19, "_assetDescription");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v38;
          v51 = v29;
          v52 = 2112;
          v53 = v13;
          _os_log_impl(&dword_1A0957000, v28, OS_LOG_TYPE_DEFAULT, "Using installed MAAsset for \"%@\", version %@.", buf, 0x16u);

        }
        *((_QWORD *)v3 + 3) = objc_msgSend(v13, "unsignedIntegerValue");
        objc_storeStrong((id *)v3 + 5, v11);
        if ((v41 & 1) == 0)
        {
          v30 = *(_QWORD **)(a1 + 40);
          v31 = v30[5];
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            v36 = v31;
            objc_msgSend(v30, "_assetDescription");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v38;
            v51 = v37;
            v52 = 2112;
            v53 = v13;
            _os_log_debug_impl(&dword_1A0957000, v36, OS_LOG_TYPE_DEBUG, "Already-installed MAAsset for \"%@\" (version %@) is also the most current known to be available.", buf, 0x16u);

          }
          *((_QWORD *)v3 + 4) = objc_msgSend(v13, "unsignedIntegerValue");
        }

LABEL_33:
        goto LABEL_34;
      }
      if ((v41 & 1) == 0)
      {
        *((_QWORD *)v3 + 4) = objc_msgSend(v13, "unsignedIntegerValue");
        if (v40 != objc_msgSend(v13, "unsignedIntegerValue"))
        {
          objc_msgSend(*(id *)(a1 + 40), "_assetDescription");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = *(_QWORD *)(a1 + 40);
          v25 = *(NSObject **)(v24 + 40);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v38;
            v51 = v23;
            v52 = 2112;
            v53 = v13;
            _os_log_impl(&dword_1A0957000, v25, OS_LOG_TYPE_DEFAULT, "New MAAsset for \"%@\" available (version %@), requesting download.", buf, 0x16u);
            v24 = *(_QWORD *)(a1 + 40);
          }
          v43[0] = MEMORY[0x1E0C809B0];
          v43[1] = 3221225472;
          v43[2] = __51___PASAsset2_updateAssetMetadataUsingQueryResults___block_invoke_264;
          v43[3] = &unk_1E44310A0;
          v43[4] = v24;
          v44 = v23;
          v45 = v13;
          v26 = v23;
          objc_msgSend(v11, "startDownload:", v43);

        }
      }
      v41 = 1;
LABEL_21:

    }
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    if (v8)
      continue;
    break;
  }
LABEL_34:

  if (*((_BYTE *)v3 + 48))
  {
    objc_msgSend(*(id *)(a1 + 40), "_purgeObsoleteInstalledAssetsFromCandidates:guardedData:", *(_QWORD *)(a1 + 32), v3);
    *((_BYTE *)v3 + 48) = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *((_QWORD *)v3 + 3) != v39;

}

void __51___PASAsset2_updateAssetMetadataUsingQueryResults___block_invoke_264(_QWORD *a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = *(NSObject **)(a1[4] + 40);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[5];
    v6 = a1[6];
    v7 = 138412802;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    v11 = 2048;
    v12 = a2;
    _os_log_impl(&dword_1A0957000, v4, OS_LOG_TYPE_DEFAULT, "MAAsset download for \"%@\" (version %@) completed with result: %ld", (uint8_t *)&v7, 0x20u);
  }
}

uint64_t __51___PASAsset2_updateAssetMetadataUsingQueryResults___block_invoke_260(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _BOOL8 v11;
  _BOOL8 v12;
  void *v13;
  void *v14;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v5, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_ContentVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("_ContentVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "compare:", v9);

  if (!v10)
  {
    v11 = objc_msgSend(v4, "state") == 2;
    v12 = objc_msgSend(v5, "state") == 2;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v13, "compare:", v14);

  }
  return v10;
}

void __51___PASAsset2_updateAssetMetadataUsingQueryResults___block_invoke_258(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v7 = *(void **)(a1 + 32);
  v8 = a3;
  v9 = a2;
  objc_msgSend(v7, "attributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(v9) = objc_msgSend(v8, "isEqual:", v11);
  if ((v9 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }

}

uint64_t __34___PASAsset2__updateAssetMetadata__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addKeyValuePair:with:", a2, a3);
}

uint64_t __38___PASAsset2_bestAssetVersionObserved__block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_QWORD *)(a2 + 32);
  return result;
}

void __31___PASAsset2__assetDescription__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "description");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

uint64_t __26___PASAsset2_assetVersion__block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_QWORD *)(a2 + 24);
  return result;
}

uint64_t __45___PASAsset2_downloadMetadataWithCompletion___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t result;
  uint64_t (*v7)(void);
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a1[4];
  v4 = *(NSObject **)(v3 + 40);
  if (a2)
  {
    if (os_log_type_enabled(*(os_log_t *)(v3 + 40), OS_LOG_TYPE_ERROR))
    {
      v9 = a1[5];
      v10 = 138412546;
      v11 = v9;
      v12 = 2048;
      v13 = a2;
      _os_log_error_impl(&dword_1A0957000, v4, OS_LOG_TYPE_ERROR, "Failed to download catalog for asset type \"%@\": error %td", (uint8_t *)&v10, 0x16u);
    }
    result = a1[6];
    if (result)
    {
      v7 = *(uint64_t (**)(void))(result + 16);
      return v7();
    }
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(v3 + 40), OS_LOG_TYPE_INFO))
    {
      v8 = a1[5];
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_1A0957000, v4, OS_LOG_TYPE_INFO, "Completed download of catalog for asset type \"%@\".", (uint8_t *)&v10, 0xCu);
    }
    result = a1[6];
    if (result)
    {
      v7 = *(uint64_t (**)(void))(result + 16);
      return v7();
    }
  }
  return result;
}

void __180___PASAsset2__initWithAssetTypeIdentifier_defaultBundlePath_compatibilityVersion_matchingKeysAndValues_notificationQueue_logHandle_enableAssetUpdates_purgeObsoleteInstalledAssets___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "_loadDefaultBundleVersionWithGuardedData:", v4);
  v3 = v4[2];
  v4[3] = v3;
  v4[4] = v3;

}

void __180___PASAsset2__initWithAssetTypeIdentifier_defaultBundlePath_compatibilityVersion_matchingKeysAndValues_notificationQueue_logHandle_enableAssetUpdates_purgeObsoleteInstalledAssets___block_invoke_2(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[5];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = v3;
      objc_msgSend(v2, "_assetDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_1A0957000, v4, OS_LOG_TYPE_INFO, "Received new asset installation notification: %@", (uint8_t *)&v6, 0xCu);

    }
    objc_msgSend(v2, "_updateAssetMetadata");
  }

}

void __180___PASAsset2__initWithAssetTypeIdentifier_defaultBundlePath_compatibilityVersion_matchingKeysAndValues_notificationQueue_logHandle_enableAssetUpdates_purgeObsoleteInstalledAssets___block_invoke_232(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[5];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = v3;
      objc_msgSend(v2, "_assetDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_1A0957000, v4, OS_LOG_TYPE_INFO, "Received asset metadata update notification: %@", (uint8_t *)&v6, 0xCu);

    }
    objc_msgSend(v2, "_updateAssetMetadata");
  }

}

id __162___PASAsset2_initWithAssetTypeDescriptorPath_defaultBundlePath_matchingKeysAndValues_notificationQueue_logHandle_enableAssetUpdates_purgeObsoleteInstalledAssets___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v4;

  v2 = *(id *)(a1 + 32);
  BYTE1(v4) = *(_BYTE *)(a1 + 72);
  LOBYTE(v4) = 0;
  return (id)objc_msgSend(v2, "_initWithAssetTypeIdentifier:defaultBundlePath:compatibilityVersion:matchingKeysAndValues:notificationQueue:logHandle:enableAssetUpdates:purgeObsoleteInstalledAssets:", CFSTR("com.apple.MobileAsset.ProactiveSupport.BrokenAssetTypeDescriptor"), *(_QWORD *)(a1 + 40), 0x7FFFFFFFFFFFFFFFLL, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v4);
}

@end
