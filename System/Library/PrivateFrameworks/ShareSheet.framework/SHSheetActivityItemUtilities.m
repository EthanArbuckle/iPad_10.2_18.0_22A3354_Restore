@implementation SHSheetActivityItemUtilities

+ (id)urlForActivityItem:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v4 = 0;
        goto LABEL_11;
      }
      v6 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v3, "string");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "URLWithString:", v7);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v5, "scheme");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (v4)
      v4 = v5;

  }
LABEL_11:

  return v4;
}

+ (id)itemProvidersFromActivityItems:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v5, "addObject:", v11, (_QWORD)v13);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (void)loadMetadataFromGroupActivityItemProviders:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "count"))
  {
    v8 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __86__SHSheetActivityItemUtilities_loadMetadataFromGroupActivityItemProviders_completion___block_invoke;
    v13[3] = &unk_1E4003CC0;
    v14 = v7;
    objc_msgSend(a1, "_loadMetadataFromRemainingGroupActivityItemProviders:loadedMetadata:loadedError:completion:", v8, v9, 0, v13);

    v10 = v14;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2D50];
    v16[0] = CFSTR("No item providers were provided.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sharesheet.loadgroupactivitymetadata"), -1, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v10);
  }

}

void __86__SHSheetActivityItemUtilities_loadMetadataFromGroupActivityItemProviders_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    if (v6)
    {
      v7 = v6;
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v10 = *MEMORY[0x1E0CB2D50];
      v11[0] = CFSTR("None of the given item providers could load a GroupActivity.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sharesheet.loadgroupactivitymetadata"), -1, v9);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

+ (void)_loadMetadataFromRemainingGroupActivityItemProviders:(id)a3 loadedMetadata:(id)a4 loadedError:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v10, "removeLastObject");
    location = 0;
    objc_initWeak(&location, a1);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __123__SHSheetActivityItemUtilities__loadMetadataFromRemainingGroupActivityItemProviders_loadedMetadata_loadedError_completion___block_invoke;
    v15[3] = &unk_1E4003CE8;
    v16 = v11;
    v17 = v12;
    objc_copyWeak(&v20, &location);
    v18 = v10;
    v19 = v13;
    objc_msgSend(v14, "loadGroupActivityMetadataWithCompletion:", v15);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, id, id))v13 + 2))(v13, v11, v12);
  }

}

void __123__SHSheetActivityItemUtilities__loadMetadataFromRemainingGroupActivityItemProviders_loadedMetadata_loadedError_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id WeakRetained;
  id v9;

  v9 = a2;
  v5 = a3;
  if (v9)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
  v6 = v5;
  if (!v5)
    v6 = *(void **)(a1 + 40);
  v7 = v6;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_loadMetadataFromRemainingGroupActivityItemProviders:loadedMetadata:loadedError:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), v7, *(_QWORD *)(a1 + 56));

}

+ (BOOL)shouldShowHeaderSpecializationForMetadata:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v3 = a3;
  objc_msgSend(v3, "specialization");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v5 = (void *)getLPiTunesMediaPlaylistMetadataClass_softClass;
  v16 = getLPiTunesMediaPlaylistMetadataClass_softClass;
  if (!getLPiTunesMediaPlaylistMetadataClass_softClass)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __getLPiTunesMediaPlaylistMetadataClass_block_invoke;
    v12[3] = &unk_1E4001370;
    v12[4] = &v13;
    __getLPiTunesMediaPlaylistMetadataClass_block_invoke((uint64_t)v12);
    v5 = (void *)v14[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v13, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForQueryKey:", CFSTR("a"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lowercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("join"));

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
