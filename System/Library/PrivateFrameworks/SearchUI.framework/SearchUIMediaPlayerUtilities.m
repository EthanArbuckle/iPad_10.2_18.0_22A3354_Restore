@implementation SearchUIMediaPlayerUtilities

+ (int64_t)MPMediaEntityTypeForSFMediaEntityType:(int)a3
{
  if ((a3 - 1) > 5)
    return 0;
  else
    return qword_1DAE1D730[a3 - 1];
}

+ (int64_t)MPMediaGroupingForMPMediaEntityType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6)
    return 0;
  else
    return qword_1DAE1D760[a3 - 1];
}

+ (id)filterPropertyForMPMediaEntityType:(int64_t)a3
{
  if ((unint64_t)a3 <= 7 && ((0xBFu >> a3) & 1) != 0)
    a1 = **((id **)&unk_1EA1F7DC8 + a3);
  return a1;
}

+ (void)fetchVideoPunchoutForActionItem:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__SearchUIMediaPlayerUtilities_fetchVideoPunchoutForActionItem_completion___block_invoke;
  v9[3] = &unk_1EA1F7DA8;
  v10 = v5;
  v11 = v6;
  v7 = v5;
  v8 = v6;
  +[SearchUIUtilities dispatchAsyncIfNecessary:](SearchUIUtilities, "dispatchAsyncIfNecessary:", v9);

}

void __75__SearchUIMediaPlayerUtilities_fetchVideoPunchoutForActionItem_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  int64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  id v32;
  __CFString *v33;
  void *v34;
  int v35;
  __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  int64_t v43;
  void *v44;
  void *v45;
  _QWORD block[4];
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(*(id *)(a1 + 32), "localMediaIdentifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "storeIdentifiers");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "persistentID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "longLongValue");

      v43 = +[SearchUIMediaPlayerUtilities MPMediaEntityTypeForSFMediaEntityType:](SearchUIMediaPlayerUtilities, "MPMediaEntityTypeForSFMediaEntityType:", objc_msgSend(*(id *)(a1 + 32), "mediaEntityType"));
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v6 = v3;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      if (v7)
      {
        v8 = v7;
        v9 = 0;
        v10 = *(_QWORD *)v54;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v54 != v10)
              objc_enumerationMutation(v6);
            v12 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0CC2408], "defaultMediaLibrary");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "itemWithStoreID:", objc_msgSend(v12, "longLongValue"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v14, "mediaType") & 0xFF00) != 0)
            {
              v15 = v14;

              v9 = v15;
            }

          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
        }
        while (v8);
      }
      else
      {
        v9 = 0;
      }

      if (v45 && !v9)
      {
        objc_msgSend(MEMORY[0x1E0CC2408], "defaultMediaLibrary");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "entityWithSpotlightIdentifier:", v45);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v18 = v17;
        }
        else
        {
          objc_msgSend(v17, "representativeItem");
          v18 = (id)objc_claimAutoreleasedReturnValue();
        }
        v19 = v18;
        if ((objc_msgSend(v18, "mediaType") & 0xFF00) != 0)
        {
          v19 = v19;
          v9 = v19;
        }
        else
        {
          v9 = 0;
        }

      }
      if (v5 && !v9)
      {
        v20 = +[SearchUIMediaPlayerUtilities MPMediaGroupingForMPMediaEntityType:](SearchUIMediaPlayerUtilities, "MPMediaGroupingForMPMediaEntityType:", v43);
        +[SearchUIMediaPlayerUtilities filterPropertyForMPMediaEntityType:](SearchUIMediaPlayerUtilities, "filterPropertyForMPMediaEntityType:", v43);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_opt_new();
        v23 = (void *)MEMORY[0x1E0CC2430];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v5);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = (void *)v21;
        objc_msgSend(v23, "predicateWithValue:forProperty:", v24, v21);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "setGroupingType:", v20);
        objc_msgSend(v22, "addFilterPredicate:", v25);
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        objc_msgSend(v22, "items");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
        if (v27)
        {
          v28 = v27;
          v9 = 0;
          v29 = *(_QWORD *)v50;
          do
          {
            for (j = 0; j != v28; ++j)
            {
              if (*(_QWORD *)v50 != v29)
                objc_enumerationMutation(v26);
              v31 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
              if ((objc_msgSend(v31, "mediaType") & 0xFF00) != 0)
              {
                v32 = v31;

                v9 = v32;
              }
            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
          }
          while (v28);
        }
        else
        {
          v9 = 0;
        }

      }
      if (v9)
      {
        v33 = CFSTR("music");
        if ((objc_msgSend(v9, "mediaType") & 0x800) == 0)
        {
          objc_msgSend(v9, "valueForProperty:", *MEMORY[0x1E0CC1E88]);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "BOOLValue");
          v36 = CFSTR("videos");
          if (v35)
            v36 = CFSTR("music");
          v33 = v36;

        }
        v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), objc_msgSend(v9, "persistentID"));
        v38 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@://play/?pid=%@&allowCloudPlayback=1"), v33, v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "URLWithString:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __75__SearchUIMediaPlayerUtilities_fetchVideoPunchoutForActionItem_completion___block_invoke_2;
        block[3] = &unk_1EA1F7DA8;
        v41 = *(id *)(a1 + 40);
        v47 = v40;
        v48 = v41;
        v42 = v40;
        dispatch_async(MEMORY[0x1E0C80D38], block);

      }
      else
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
    }
  }
}

void __75__SearchUIMediaPlayerUtilities_fetchVideoPunchoutForActionItem_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0D8C5E0], "punchoutWithURL:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

@end
