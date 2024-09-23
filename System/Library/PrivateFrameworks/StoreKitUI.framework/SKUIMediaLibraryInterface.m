@implementation SKUIMediaLibraryInterface

- (void)enumerateStatesForLibraryItems:(id)a3 usingBlock:(id)a4
{
  id v5;
  void (**v6)(id, void *, SKUILibraryItemState *, _BYTE *);
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  SKUILibraryItemState *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id obj;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v26[4];
  SKUILibraryItemState *v27;
  SKUIMediaLibraryInterface *v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  unsigned __int8 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, void *, SKUILibraryItemState *, _BYTE *))a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIMediaLibraryInterface enumerateStatesForLibraryItems:usingBlock:].cold.1();
  }
  v7 = (void *)SKUIMediaPlayerFramework();
  v8 = -[SKUIMediaLibraryInterface _newDefaultQuery](self, "_newDefaultQuery");
  v24 = *(id *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyStoreAccountID", v7);
  v23 = *(id *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyIsHD", v7);
  v22 = *(id *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyStoreID", v7);
  v21 = SKUIWeakLinkedClassForString(CFSTR("MPMediaPropertyPredicate"), (uint64_t)v7);
  v35 = 0;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v5;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v32;
LABEL_7:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v32 != v11)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v12);
      v14 = (void *)MEMORY[0x1BCCE6C7C]();
      v15 = objc_alloc_init(SKUILibraryItemState);
      objc_msgSend(v13, "storeItemIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v13, "storeItemIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "predicateWithValue:forProperty:", v17, v22);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "addFilterPredicate:", v18);
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __71__SKUIMediaLibraryInterface_enumerateStatesForLibraryItems_usingBlock___block_invoke;
        v26[3] = &unk_1E73A3BD8;
        v27 = v15;
        v28 = self;
        v29 = v23;
        v30 = v24;
        objc_msgSend(v8, "_enumerateUnorderedItemsUsingBlock:", v26);
        objc_msgSend(v8, "removeFilterPredicate:", v18);

      }
      v6[2](v6, v13, v15, &v35);
      v19 = v35;

      objc_autoreleasePoolPop(v14);
      if (v19)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        if (v10)
          goto LABEL_7;
        break;
      }
    }
  }

}

void __71__SKUIMediaLibraryInterface_enumerateStatesForLibraryItems_usingBlock___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (a2)
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v7 = a2;
    objc_msgSend(v5, "setAvailability:", objc_msgSend(v6, "_availabilityForMediaItem:", v7));
    objc_msgSend(*(id *)(a1 + 32), "setAVTypes:", objc_msgSend(*(id *)(a1 + 40), "_AVTypesForMediaItem:", v7));
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v7, "valueForProperty:", *(_QWORD *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHighDefinition:", objc_msgSend(v9, "BOOLValue"));

    objc_msgSend(*(id *)(a1 + 32), "setRental:", objc_msgSend(v7, "isRental"));
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v7, "valueForProperty:", *(_QWORD *)(a1 + 56));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setStoreAccountIdentifier:", v11);

    v12 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_storePlatformKindForMediaItem:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setStorePlatformKind:", v13);
    *a3 = 1;
  }
}

- (id)exposedPlatformItemKinds
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        -[SKUIMediaLibraryInterface exposedPlatformItemKinds].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("book"), CFSTR("movie"), CFSTR("song"), CFSTR("musicVideo"), CFSTR("podcastEpisode"), CFSTR("tvEpisode"), 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)performActionForLibraryItem:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  objc_class *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  void *v53;
  void *v54;
  int v55;
  void *v57;
  void *v58;
  BOOL v59;
  id v60;
  SKUIMediaLibraryInterface *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIMediaLibraryInterface performActionForLibraryItem:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = (void *)SKUIMediaPlayerFramework();
  v14 = (objc_class *)SKUIWeakLinkedClassForString(CFSTR("MPMediaQuery"), (uint64_t)v13);
  v15 = SKUIWeakLinkedClassForString(CFSTR("MPMediaPropertyPredicate"), (uint64_t)v13);
  v16 = *(id *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyStoreID", v13);
  v17 = *(id *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyMediaType", v13);
  v18 = *(id *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyStorePlaylistID", v13);
  v19 = objc_alloc_init(v14);
  objc_msgSend(v4, "storeItemIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v15;
  objc_msgSend(v15, "predicateWithValue:forProperty:", v20, v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addFilterPredicate:", v21);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v16, v17, v18, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setItemPropertiesToFetch:", v22);

  -[SKUIMediaLibraryInterface _restrictQueryToLocalContent:](self, "_restrictQueryToLocalContent:", v19);
  v67 = v19;
  objc_msgSend(v19, "items");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = v24;
  if (v24 && (objc_msgSend(v24, "mediaType") & 0xFF00) != 0)
  {
    v26 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v4, "storeItemIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v26, "initWithFormat:", CFSTR("videos://play?adam-id=%lld&allowCloudPlayback=1"), objc_msgSend(v27, "longLongValue"));

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    SKUIMetricsOpenSensitiveURL(v29, 0);
    v30 = 1;
  }
  else
  {
    v31 = v4;
    v32 = v17;
    -[objc_class albumsQuery](v14, "albumsQuery");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = self;
    -[SKUIMediaLibraryInterface _restrictQueryToLocalContent:](self, "_restrictQueryToLocalContent:", v33);
    v34 = v31;
    objc_msgSend(v31, "storeItemIdentifier");
    v35 = v25;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "predicateWithValue:forProperty:", v36, v18);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addFilterPredicate:", v37);

    v64 = v33;
    objc_msgSend(v33, "items");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v29, "count");
    v39 = 0;
    v63 = v35;
    if (!v35 || v38)
    {
      v17 = v32;
      v4 = v34;
    }
    else
    {
      v40 = v18;
      objc_msgSend(v63, "valueForProperty:", v18);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v32;
      if (v41)
      {
        v4 = v34;
        if ((objc_msgSend(v63, "mediaType") & 4) != 0)
          -[objc_class audiobooksQuery](v14, "audiobooksQuery");
        else
          -[objc_class albumsQuery](v14, "albumsQuery");
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        -[SKUIMediaLibraryInterface _restrictQueryToLocalContent:](v61, "_restrictQueryToLocalContent:", v42);
        objc_msgSend(v65, "predicateWithValue:forProperty:", v41, v40);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addFilterPredicate:", v43);

        objc_msgSend(v42, "items");
        v44 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v63, "valueForProperty:", v16);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)v44;
        v64 = v42;
      }
      else
      {
        v39 = 0;
        v4 = v34;
      }

      v18 = v40;
    }
    v45 = objc_msgSend(v29, "count");
    v30 = v45 != 0;
    if (v45)
    {
      v46 = (void *)objc_msgSend(objc_alloc((Class)SKUIWeakLinkedClassForString(CFSTR("MPMediaItemCollection"), (uint64_t)v13)), "initWithItems:", v29);
      objc_msgSend(SKUIWeakLinkedClassForString(CFSTR("MPMusicPlayerController"), (uint64_t)v13), "systemMusicPlayer");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setQueueWithItemCollection:", v46);
      if (v39)
      {
        v58 = v46;
        v59 = v30;
        v60 = v18;
        v62 = v17;
        v66 = v4;
        v70 = 0u;
        v71 = 0u;
        v68 = 0u;
        v69 = 0u;
        v48 = v29;
        v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
        if (v49)
        {
          v50 = v49;
          v51 = *(_QWORD *)v69;
          v57 = v47;
          while (2)
          {
            for (i = 0; i != v50; ++i)
            {
              if (*(_QWORD *)v69 != v51)
                objc_enumerationMutation(v48);
              v53 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
              objc_msgSend(v53, "valueForProperty:", v16);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = objc_msgSend(v54, "isEqualToNumber:", v39);

              if (v55)
              {
                v47 = v57;
                objc_msgSend(v57, "setNowPlayingItem:", v53);
                goto LABEL_30;
              }
            }
            v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
            v47 = v57;
            if (v50)
              continue;
            break;
          }
        }
LABEL_30:

        v4 = v66;
        v18 = v60;
        v17 = v62;
        v30 = v59;
        v46 = v58;
      }
      objc_msgSend(v47, "play");

    }
    v25 = v63;
    v28 = v64;
  }

  return v30;
}

- (BOOL)isItemLocalAudiobook:(id)a3
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        -[SKUIMediaLibraryInterface isItemLocalAudiobook:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = (void *)SKUIMediaPlayerFramework();
  v13 = SKUIWeakLinkedClassForString(CFSTR("MPMediaQuery"), (uint64_t)v12);
  v14 = SKUIWeakLinkedClassForString(CFSTR("MPMediaPropertyPredicate"), (uint64_t)v12);
  objc_msgSend(v13, "audiobooksQuery");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(id *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyStorePlaylistID", v12);
  objc_msgSend(v3, "storeItemIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "predicateWithValue:forProperty:", v17, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "addFilterPredicate:", v18);
  objc_msgSend(v15, "items");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = objc_msgSend(v19, "count") != 0;

  return (char)v16;
}

- (id)stateForLibraryItem:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUILibraryItemState *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  SKUILibraryItemState *v22;
  id v23;
  id v24;
  void *v25;
  SKUILibraryItemState *v26;
  _QWORD v28[4];
  SKUILibraryItemState *v29;
  SKUIMediaLibraryInterface *v30;
  id v31;
  id v32;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIMediaLibraryInterface stateForLibraryItem:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = objc_alloc_init(SKUILibraryItemState);
  v14 = (void *)SKUIMediaPlayerFramework();
  v15 = -[SKUIMediaLibraryInterface _newDefaultQuery](self, "_newDefaultQuery");
  v16 = *(id *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyStoreAccountID", v14);
  v17 = *(id *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyIsHD", v14);
  v18 = *(id *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyStoreID", v14);
  v19 = SKUIWeakLinkedClassForString(CFSTR("MPMediaPropertyPredicate"), (uint64_t)v14);
  objc_msgSend(v4, "storeItemIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "predicateWithValue:forProperty:", v20, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "addFilterPredicate:", v21);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __49__SKUIMediaLibraryInterface_stateForLibraryItem___block_invoke;
  v28[3] = &unk_1E73A3BD8;
  v22 = v13;
  v29 = v22;
  v30 = self;
  v31 = v17;
  v32 = v16;
  v23 = v16;
  v24 = v17;
  objc_msgSend(v15, "_enumerateUnorderedItemsUsingBlock:", v28);
  v25 = v32;
  v26 = v22;

  return v26;
}

void __49__SKUIMediaLibraryInterface_stateForLibraryItem___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (a2)
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v7 = a2;
    objc_msgSend(v5, "setAvailability:", objc_msgSend(v6, "_availabilityForMediaItem:", v7));
    objc_msgSend(*(id *)(a1 + 32), "setAVTypes:", objc_msgSend(*(id *)(a1 + 40), "_AVTypesForMediaItem:", v7));
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v7, "valueForProperty:", *(_QWORD *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHighDefinition:", objc_msgSend(v9, "BOOLValue"));

    objc_msgSend(*(id *)(a1 + 32), "setRental:", objc_msgSend(v7, "isRental"));
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v7, "valueForProperty:", *(_QWORD *)(a1 + 56));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setStoreAccountIdentifier:", v11);

    v12 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_storePlatformKindForMediaItem:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setStorePlatformKind:", v13);
    *a3 = 1;
  }
}

- (void)removeMediaItemsForLibraryItems:(id)a3
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        -[SKUIMediaLibraryInterface removeMediaItemsForLibraryItems:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = (void *)SKUIMediaPlayerFramework();
  v13 = (objc_class *)SKUIWeakLinkedClassForString(CFSTR("MPMediaQuery"), (uint64_t)v12);
  v14 = SKUIWeakLinkedClassForString(CFSTR("MPMediaPropertyPredicate"), (uint64_t)v12);
  v27 = SKUIWeakLinkedClassForString(CFSTR("MPMediaLibrary"), (uint64_t)v12);
  v15 = *(id *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyStoreID", v12);
  v16 = objc_alloc_init(v13);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v3;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v30;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v30 != v20)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v21), "storeItemIdentifier", v27);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "predicateWithValue:forProperty:", v22, v15);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "addFilterPredicate:", v23);
        objc_msgSend(v16, "items");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "firstObject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
          objc_msgSend(v17, "addObject:", v25);
        objc_msgSend(v16, "removeFilterPredicate:", v23);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v19);
  }

  if (objc_msgSend(v17, "count"))
  {
    objc_msgSend(v27, "defaultMediaLibrary");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "removeItems:", v17);

  }
}

- (int64_t)_availabilityForMediaItem:(id)a3
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        -[SKUIMediaLibraryInterface _availabilityForMediaItem:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  if (_availabilityForMediaItem__sOnce != -1)
    dispatch_once(&_availabilityForMediaItem__sOnce, &__block_literal_global_13);
  objc_msgSend(v3, "valueForProperty:", _availabilityForMediaItem__sFamilyAccountIDProperty);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "unsignedLongLongValue") && (objc_msgSend(v3, "mediaType") & 0x300) != 0)
  {
    objc_msgSend(v3, "valueForProperty:", _availabilityForMediaItem__sFilePathProperty);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "length"))
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v13, 0);
      v15 = (void *)objc_msgSend(objc_alloc((Class)_availabilityForMediaItem__sPlayerItemClass), "initWithURL:", v14);
      if (objc_msgSend(v15, "isContentAuthorizedForPlayback"))
        v16 = 2;
      else
        v16 = 0;

    }
    else
    {
      v16 = 2;
    }

  }
  else
  {
    v16 = 2;
  }

  return v16;
}

id __55__SKUIMediaLibraryInterface__availabilityForMediaItem___block_invoke()
{
  void *v0;
  id *v1;
  id *v2;
  uint64_t v3;
  id result;

  v0 = (void *)SKUIMediaPlayerFramework();
  v1 = (id *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyStoreFamilyAccountID", v0);
  objc_storeStrong((id *)&_availabilityForMediaItem__sFamilyAccountIDProperty, *v1);
  v2 = (id *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyFilePath", v0);
  objc_storeStrong((id *)&_availabilityForMediaItem__sFilePathProperty, *v2);
  v3 = SKUIAVFoundationFramework();
  result = SKUIWeakLinkedClassForString(CFSTR("AVPlayerItem"), v3);
  _availabilityForMediaItem__sPlayerItemClass = (uint64_t)result;
  return result;
}

- (unint64_t)_AVTypesForMediaItem:(id)a3
{
  if ((objc_msgSend(a3, "mediaType") & 0xFF00) != 0)
    return 5;
  else
    return 1;
}

- (id)_newDefaultQuery
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)SKUIMediaPlayerFramework();
  v4 = objc_alloc_init((Class)SKUIWeakLinkedClassForString(CFSTR("MPMediaQuery"), (uint64_t)v3));
  -[SKUIMediaLibraryInterface _restrictQueryToLocalContent:](self, "_restrictQueryToLocalContent:", v4);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v5, "addObject:", *(_QWORD *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyIsHD", v3));
  objc_msgSend(v5, "addObject:", *(_QWORD *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyIsRental", v3));
  objc_msgSend(v5, "addObject:", *(_QWORD *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyMediaType", v3));
  objc_msgSend(v5, "addObject:", *(_QWORD *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyStoreAccountID", v3));
  objc_msgSend(v4, "setItemPropertiesToFetch:", v5);

  return v4;
}

- (void)_restrictQueryToLocalContent:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;

  v3 = a3;
  v4 = (void *)SKUIMediaPlayerFramework();
  v5 = *(id *)SKUIWeakLinkedSymbolForString("MPMediaItemPropertyIsLocal", v4);
  objc_msgSend(SKUIWeakLinkedClassForString(CFSTR("MPMediaPropertyPredicate"), (uint64_t)v4), "predicateWithValue:forProperty:", MEMORY[0x1E0C9AAB0], v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addFilterPredicate:", v6);
}

- (id)_storePlatformKindForMediaItem:(id)a3
{
  uint64_t v3;
  id result;

  v3 = objc_msgSend(a3, "mediaType");
  result = 0;
  if (v3 <= 511)
  {
    switch(v3)
    {
      case 1:
        result = CFSTR("song");
        break;
      case 2:
      case 8:
        return CFSTR("podcastEpisode");
      case 3:
      case 5:
      case 6:
      case 7:
        return result;
      case 4:
        result = CFSTR("book");
        break;
      default:
        if (v3 == 256)
          result = CFSTR("movie");
        else
          result = 0;
        break;
    }
    return result;
  }
  if (v3 > 2047)
  {
    if (v3 == 2048)
      return CFSTR("musicVideo");
    if (v3 != 4096)
      return result;
    return CFSTR("podcastEpisode");
  }
  if (v3 == 512)
    return CFSTR("tvEpisode");
  if (v3 == 1024)
    return CFSTR("podcastEpisode");
  return result;
}

- (void)enumerateStatesForLibraryItems:usingBlock:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIMediaLibraryInterface enumerateStatesForLibraryItems:usingBlock:]";
  OUTLINED_FUNCTION_1();
}

- (void)exposedPlatformItemKinds
{
  OUTLINED_FUNCTION_1();
}

- (void)performActionForLibraryItem:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)isItemLocalAudiobook:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)stateForLibraryItem:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)removeMediaItemsForLibraryItems:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)_availabilityForMediaItem:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
