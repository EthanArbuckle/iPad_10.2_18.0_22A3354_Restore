@implementation PXSharedLibraryMoveAssetsToSPLPersonalLibrary

uint64_t __PXSharedLibraryMoveAssetsToSPLPersonalLibrary_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __PXSharedLibraryMoveAssetsToSPLPersonalLibrary_block_invoke_333(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CD15E8], "changeRequestForLibraryScope:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "moveToPersonalLibrary:", *(_QWORD *)(a1 + 40));

}

void __PXSharedLibraryMoveAssetsToSPLPersonalLibrary_block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  unsigned int v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  _QWORD block[4];
  id v42;
  id v43;
  char v44;
  _QWORD v45[4];
  __CFString *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;
  _QWORD v55[4];

  v55[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(id *)(a1 + 32);
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 64);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v7, OS_SIGNPOST_INTERVAL_END, v8, "MoveToPersonalLibrary", ", buf, 2u);
  }

  PLSharedLibraryGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a2)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    objc_msgSend(*(id *)(a1 + 40), "localIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v52 = v11;
    v12 = "Did move assets to personal library from library scope with identifier: %{public}@";
    v13 = v10;
    v14 = OS_LOG_TYPE_DEFAULT;
    v15 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    objc_msgSend(*(id *)(a1 + 40), "localIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v52 = v11;
    v53 = 2112;
    v54 = v5;
    v12 = "Failed to move assets to personal library from library scope with identifier: %{public}@, error: %@";
    v13 = v10;
    v14 = OS_LOG_TYPE_ERROR;
    v15 = 22;
  }
  _os_log_impl(&dword_1A6789000, v13, v14, v12, buf, v15);

LABEL_10:
  v16 = *(void **)(a1 + 56);
  if (v16)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __PXSharedLibraryMoveAssetsToSPLPersonalLibrary_block_invoke_334;
    block[3] = &unk_1E5146308;
    v43 = v16;
    v44 = a2;
    v42 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  if (a2)
  {
    v17 = *(id *)(a1 + 48);
    objc_opt_class();
    v40 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = v17;
      objc_msgSend(v18, "fetchPropertySets");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *MEMORY[0x1E0CD19D8];
      v21 = objc_msgSend(v19, "containsObject:", *MEMORY[0x1E0CD19D8]);

      v17 = v18;
      if ((v21 & 1) == 0)
      {
        objc_msgSend(v18, "photoLibrary");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "librarySpecificFetchOptions");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v55[0] = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setFetchPropertySets:", v24);

        v25 = (void *)MEMORY[0x1E0CD1390];
        objc_msgSend(v18, "fetchedObjectIDs");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "fetchAssetsWithObjectIDs:options:", v26, v23);
        v17 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v28 = v17;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v47, buf, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v48 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          objc_msgSend(v33, "fetchPropertySetsIfNeeded");
          objc_msgSend(v33, "libraryScopeProperties");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "suggestedByClientType") + 1;
          v36 = CFSTR("Unknown");
          if (v35 <= 5)
            v36 = off_1E513E170[v35];

          v37 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v27, "objectForKeyedSubscript:", v36);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "numberWithInt:", objc_msgSend(v38, "intValue") + 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v39, v36);

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v47, buf, 16);
      }
      while (v30);
    }

    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = ___PXSharedLibrarySendAnalyticsForUserAction_block_invoke;
    v45[3] = &unk_1E513E138;
    v46 = CFSTR("move to personal");
    objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v45);

    v5 = v40;
  }

}

uint64_t __PXSharedLibraryMoveAssetsToSPLPersonalLibrary_block_invoke_334(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

@end
