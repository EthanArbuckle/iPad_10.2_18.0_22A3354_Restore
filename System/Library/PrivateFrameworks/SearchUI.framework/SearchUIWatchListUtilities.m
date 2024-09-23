@implementation SearchUIWatchListUtilities

+ (int64_t)wlkTypeForType:(int)a3
{
  if ((a3 - 1) > 4)
    return 1;
  else
    return qword_1DAE1D6A8[a3 - 1];
}

+ (int)watchListTypeForType:(int)a3 isMediaContainer:(BOOL)a4
{
  int v4;

  if (a4)
    v4 = 3;
  else
    v4 = 4;
  if (a3)
    return a3;
  else
    return v4;
}

+ (void)generateWatchListReponseForWatchListIdentifier:(id)a3 type:(int)a4 completion:(id)a5
{
  uint64_t v5;
  id v8;
  objc_class *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v9 = (objc_class *)MEMORY[0x1E0DC8768];
  v10 = a3;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithCanonicalID:", v10);

  objc_msgSend(v11, "setCaller:", CFSTR("SearchUI"));
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __93__SearchUIWatchListUtilities_generateWatchListReponseForWatchListIdentifier_type_completion___block_invoke;
  v13[3] = &unk_1EA1F70A8;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "makeRequestWithCompletion:canonicalType:", v13, objc_msgSend(a1, "wlkTypeForType:", v5));

}

uint64_t __93__SearchUIWatchListUtilities_generateWatchListReponseForWatchListIdentifier_type_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)generateMediaContainerWatchListReponseForWatchListIdentifier:(id)a3 type:(int)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  int v16;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __107__SearchUIWatchListUtilities_generateMediaContainerWatchListReponseForWatchListIdentifier_type_completion___block_invoke;
  v12[3] = &unk_1EA1F7148;
  v14 = v9;
  v15 = a1;
  v16 = a4;
  v13 = v8;
  v10 = v9;
  v11 = v8;
  +[SearchUIUtilities dispatchAsyncIfNecessary:](SearchUIUtilities, "dispatchAsyncIfNecessary:", v12);

}

void __107__SearchUIWatchListUtilities_generateMediaContainerWatchListReponseForWatchListIdentifier_type_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  char v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD v13[4];
  NSObject *v14;
  _QWORD v15[4];
  NSObject *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC8760]), "initWithCanonicalID:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v2, "setCaller:", CFSTR("SearchUI"));
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__1;
  v21[4] = __Block_byref_object_dispose__1;
  v22 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__1;
  v19[4] = __Block_byref_object_dispose__1;
  v20 = 0;
  v4 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __107__SearchUIWatchListUtilities_generateMediaContainerWatchListReponseForWatchListIdentifier_type_completion___block_invoke_96;
  v15[3] = &unk_1EA1F70D0;
  v17 = v21;
  v18 = v19;
  v5 = v3;
  v16 = v5;
  objc_msgSend(v2, "makeRequestWithCompletion:canonicalType:", v15, objc_msgSend(*(id *)(a1 + 48), "wlkTypeForType:", *(unsigned int *)(a1 + 56)));
  os_unfair_lock_lock(&sSeasonTitleLock);
  v6 = sSeasonTitlesFlagCached;
  os_unfair_lock_unlock(&sSeasonTitleLock);
  if ((v6 & 1) == 0)
  {
    dispatch_group_enter(v5);
    v7 = (void *)MEMORY[0x1E0DC8770];
    v13[0] = v4;
    v13[1] = 3221225472;
    v13[2] = __107__SearchUIWatchListUtilities_generateMediaContainerWatchListReponseForWatchListIdentifier_type_completion___block_invoke_2;
    v13[3] = &unk_1EA1F70F8;
    v14 = v5;
    objc_msgSend(v7, "sui_fetchSeasonTitlesSettingWithCompletionHandler:", v13);

  }
  dispatch_get_global_queue(25, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __107__SearchUIWatchListUtilities_generateMediaContainerWatchListReponseForWatchListIdentifier_type_completion___block_invoke_3;
  block[3] = &unk_1EA1F7120;
  v10 = *(id *)(a1 + 40);
  v11 = v21;
  v12 = v19;
  dispatch_group_notify(v5, v8, block);

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);

}

void __107__SearchUIWatchListUtilities_generateMediaContainerWatchListReponseForWatchListIdentifier_type_completion___block_invoke_96(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __107__SearchUIWatchListUtilities_generateMediaContainerWatchListReponseForWatchListIdentifier_type_completion___block_invoke_2(uint64_t a1, char a2)
{
  os_unfair_lock_lock(&sSeasonTitleLock);
  sSeasonTitlesEnabled = a2;
  sSeasonTitlesFlagCached = 1;
  os_unfair_lock_unlock(&sSeasonTitleLock);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __107__SearchUIWatchListUtilities_generateMediaContainerWatchListReponseForWatchListIdentifier_type_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

+ (void)fetchWatchListStateForWatchListIdentifier:(id)a3 type:(int)a4 completion:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __88__SearchUIWatchListUtilities_fetchWatchListStateForWatchListIdentifier_type_completion___block_invoke;
  v10[3] = &unk_1EA1F7170;
  v11 = v8;
  v9 = v8;
  objc_msgSend(a1, "fetchButtonsForWatchListIdentifier:type:isHorizontallySrollingStyle:fetchButtons:completion:", a3, v5, 1, 0, v10);

}

uint64_t __88__SearchUIWatchListUtilities_fetchWatchListStateForWatchListIdentifier_type_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)fetchButtonsForWatchListIdentifier:(id)a3 type:(int)a4 isHorizontallySrollingStyle:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  uint64_t v7;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a5;
  v7 = *(_QWORD *)&a4;
  v10 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __109__SearchUIWatchListUtilities_fetchButtonsForWatchListIdentifier_type_isHorizontallySrollingStyle_completion___block_invoke;
  v12[3] = &unk_1EA1F7170;
  v13 = v10;
  v11 = v10;
  objc_msgSend(a1, "fetchButtonsForWatchListIdentifier:type:isHorizontallySrollingStyle:fetchButtons:completion:", a3, v7, v6, 1, v12);

}

uint64_t __109__SearchUIWatchListUtilities_fetchButtonsForWatchListIdentifier_type_isHorizontallySrollingStyle_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)fetchButtonsForWatchListIdentifier:(id)a3 type:(int)a4 isHorizontallySrollingStyle:(BOOL)a5 fetchButtons:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v7 = a5;
  v8 = *(_QWORD *)&a4;
  v10 = fetchButtonsForWatchListIdentifier_type_isHorizontallySrollingStyle_fetchButtons_completion__onceToken;
  v11 = a7;
  v12 = a3;
  v14 = v12;
  if (v10 == -1)
  {
    v13 = v12;
  }
  else
  {
    dispatch_once(&fetchButtonsForWatchListIdentifier_type_isHorizontallySrollingStyle_fetchButtons_completion__onceToken, &__block_literal_global_15);
    v13 = v14;
  }
  objc_msgSend((id)fetchButtonsForWatchListIdentifier_type_isHorizontallySrollingStyle_fetchButtons_completion__cache, "getButtonsForWatchListIdentifier:type:isHorizontallySrollingStyle:completion:", v13, v8, v7, v11);

}

void __122__SearchUIWatchListUtilities_fetchButtonsForWatchListIdentifier_type_isHorizontallySrollingStyle_fetchButtons_completion___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)fetchButtonsForWatchListIdentifier_type_isHorizontallySrollingStyle_fetchButtons_completion__cache;
  fetchButtonsForWatchListIdentifier_type_isHorizontallySrollingStyle_fetchButtons_completion__cache = v0;

}

+ (void)computeButtonsForWatchListIdentifier:(id)a3 type:(int)a4 isHorizontallySrollingStyle:(BOOL)a5 completion:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  BOOL v18;
  _QWORD v19[4];
  id v20;
  id v21;
  BOOL v22;

  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = a6;
  v12 = v11;
  if (v10)
  {
    v13 = (void *)objc_opt_class();
    if ((v8 & 0xFFFFFFFE) == 2)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __111__SearchUIWatchListUtilities_computeButtonsForWatchListIdentifier_type_isHorizontallySrollingStyle_completion___block_invoke;
      v19[3] = &unk_1EA1F71B8;
      v21 = a1;
      v22 = a5;
      v20 = v12;
      objc_msgSend(v13, "generateMediaContainerWatchListReponseForWatchListIdentifier:type:completion:", v10, v8, v19);
      v14 = v20;
    }
    else
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __111__SearchUIWatchListUtilities_computeButtonsForWatchListIdentifier_type_isHorizontallySrollingStyle_completion___block_invoke_2;
      v15[3] = &unk_1EA1F71E0;
      v17 = a1;
      v18 = a5;
      v16 = v12;
      objc_msgSend(v13, "generateWatchListReponseForWatchListIdentifier:type:completion:", v10, v8, v15);
      v14 = v16;
    }

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v11 + 2))(v11, 0, 0, 0);
  }

}

void __111__SearchUIWatchListUtilities_computeButtonsForWatchListIdentifier_type_isHorizontallySrollingStyle_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  SearchUIWatchListState *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (objc_msgSend(v11, "isWatchListable"))
    v6 = -[SearchUIWatchListState initWithContainerResponse:]([SearchUIWatchListState alloc], "initWithContainerResponse:", v11);
  else
    v6 = 0;
  v7 = *(void **)(a1 + 40);
  objc_msgSend(v11, "channels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentEpisode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "buttonsForPlayables:channels:currentEpisode:isUpNextable:watchListState:isHorizontallySrollingStyle:", 0, v8, v9, objc_msgSend(v11, "isWatchListable"), v6, *(unsigned __int8 *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __111__SearchUIWatchListUtilities_computeButtonsForWatchListIdentifier_type_isHorizontallySrollingStyle_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  SearchUIWatchListState *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (objc_msgSend(v10, "isWatchListable"))
    v6 = -[SearchUIWatchListState initWithResponse:]([SearchUIWatchListState alloc], "initWithResponse:", v10);
  else
    v6 = 0;
  v7 = *(void **)(a1 + 40);
  objc_msgSend(v10, "playables");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "buttonsForPlayables:channels:currentEpisode:isUpNextable:watchListState:isHorizontallySrollingStyle:", v8, 0, 0, objc_msgSend(v10, "isWatchListable"), v6, *(unsigned __int8 *)(a1 + 48));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)buttonsForPlayables:(id)a3 channels:(id)a4 currentEpisode:(id)a5 isUpNextable:(BOOL)a6 watchListState:(id)a7 isHorizontallySrollingStyle:(BOOL)a8
{
  _BOOL4 v8;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  unsigned __int8 v42;
  void *v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  char v47;
  void *v48;
  char v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _BOOL8 v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  BOOL v65;
  int v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  id v82;
  _BOOL4 v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  unint64_t v88;
  _BOOL4 v89;
  id v90;
  id obj;
  void *v92;
  void *v93;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;

  v8 = a8;
  v83 = a6;
  v105 = *MEMORY[0x1E0C80C00];
  v81 = a3;
  v12 = a4;
  v13 = a5;
  v82 = a7;
  v89 = v8;
  v14 = 4;
  if (v8)
    v14 = 0x7FFFFFFFLL;
  v80 = v14;
  v90 = (id)objc_opt_new();
  v93 = (void *)objc_opt_new();
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  obj = v12;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v104, 16);
  v86 = v13;
  if (!v15)
  {
    v92 = 0;
    goto LABEL_35;
  }
  v16 = v15;
  v92 = 0;
  v17 = *(_QWORD *)v100;
  v84 = *MEMORY[0x1E0DC89A0];
  v85 = *(_QWORD *)v100;
  do
  {
    v18 = 0;
    v87 = v16;
    do
    {
      if (*(_QWORD *)v100 != v17)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * v18);
      objc_msgSend(v19, "details");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20 && (objc_msgSend(a1, "channelHasBeenSeen:seenChannels:", v20, v93) & 1) == 0)
      {
        objc_msgSend(v13, "playable");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "punchoutUrls");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "channelID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "channelID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v23, "isEqual:", v24) & 1) != 0)
        {
          objc_msgSend(v19, "seasonNumbers");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "seasonNumber");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v25, "containsObject:", v26);

          if (v27)
          {
            objc_msgSend(v21, "punchoutUrls");
            v28 = (id)objc_claimAutoreleasedReturnValue();
            if (v28)
            {
              v13 = v86;
              objc_msgSend(v86, "seasonNumber");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v86, "episodeNumber");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = v28;
              v31 = v22;
              v22 = v28;
              goto LABEL_20;
            }
            v30 = 0;
            v29 = 0;
            v13 = v86;
LABEL_21:

            goto LABEL_22;
          }
        }
        else
        {

        }
        if (objc_msgSend(v20, "isiTunes"))
        {
          v28 = (id)objc_msgSend(v22, "mutableCopy");
          v13 = v86;
          objc_msgSend(v86, "tvAppDeeplinkURL");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "absoluteString");
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (v31)
          {
            objc_msgSend(v28, "setObject:forKey:", v31, v84);
            v28 = v28;

            v30 = 0;
            v29 = 0;
            v22 = v28;
          }
          else
          {
            v30 = 0;
            v29 = 0;
          }
LABEL_20:

          goto LABEL_21;
        }
        v30 = 0;
        v29 = 0;
        v13 = v86;
LABEL_22:
        objc_msgSend(v19, "subscriptionOffers");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "firstObject");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v34 || v92)
        {
          v35 = objc_msgSend(v20, "isSubscribed");
          objc_msgSend(v13, "seasonTitle");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v79) = v89;
          LOBYTE(v78) = v36 != 0;
          objc_msgSend(a1, "buttonForChannelDetails:punchoutURLs:tvAppDeeplinkURL:isEntitled:isContinuing:isContainerItem:hasDescriptiveSeasonTitle:seasonNumber:episodeNumber:isHorizontallySrollingStyle:", v20, v22, 0, v35, 0, 1, v78, v29, v30, v79);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (v37)
            objc_msgSend(v90, "addObject:", v37);

        }
        else
        {
          objc_msgSend(a1, "buttonForChannelOffer:channel:episode:", v34, v19, v13);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
        }

        v17 = v85;
        v16 = v87;
      }

      ++v18;
    }
    while (v16 != v18);
    v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v104, 16);
    v16 = v38;
  }
  while (v38);
LABEL_35:

  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v39 = v81;
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v95, v103, 16);
  if (!v40)
  {

    v43 = 0;
    v56 = v92 != 0;
    v57 = v80 - v83 - v56;
    goto LABEL_86;
  }
  v41 = v40;
  v42 = 0;
  v43 = 0;
  v44 = *(_QWORD *)v96;
  v88 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    for (i = 0; i != v41; ++i)
    {
      if (*(_QWORD *)v96 != v44)
        objc_enumerationMutation(v39);
      v46 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * i);
      v47 = objc_msgSend(v46, "isEntitled");
      objc_msgSend(v46, "channelDetails");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(a1, "channelHasBeenSeen:seenChannels:", v48, v93);

      if ((v49 & 1) == 0)
      {
        if (objc_msgSend(v46, "isiTunes"))
        {
          v50 = v46;

          v88 = objc_msgSend(v90, "count");
          v43 = v50;
        }
        else if (v92
               || (objc_msgSend(v46, "bestStoreSubscriptionOffer"),
                   v52 = (void *)objc_claimAutoreleasedReturnValue(),
                   v52,
                   !v52))
        {
          objc_msgSend(a1, "buttonForPlayable:isHorizontallySrollingStyle:", v46, v89);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          if (v51)
            objc_msgSend(v90, "addObject:", v51);

        }
        else
        {
          objc_msgSend(v46, "bestStoreSubscriptionOffer");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "buttonForOffer:playable:", v53, v46);
          v92 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
      v42 |= v47;
    }
    v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v95, v103, 16);
  }
  while (v41);

  v54 = v92;
  if ((v42 & (v92 != 0)) == 1)
  {

    v54 = 0;
  }
  v13 = v86;
  v55 = v90;
  v92 = v54;
  v56 = v54 != 0;
  v57 = v80 - v83 - v56;
  if (v43)
  {
    v58 = objc_msgSend(v90, "count");
    if (v88 < v57 && (uint64_t)(v57 - v58) < 1)
      v60 = 1;
    else
      v60 = v57 - v58;
    if (v60 >= 1)
    {
      v61 = (void *)objc_opt_new();
      objc_msgSend(v43, "bestStoreRentalOffer");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      if (v62)
      {
        objc_msgSend(v43, "bestStoreBuyOffer");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = v60 == 1 && v63 != 0;

      }
      else
      {
        v65 = 0;
      }

      v66 = objc_msgSend(v43, "isEntitled");
      if (v65 || v66)
      {
        objc_msgSend(a1, "buttonForPlayable:isHorizontallySrollingStyle:", v43, v89);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "addObject:", v68);
      }
      else
      {
        objc_msgSend(v43, "bestStoreRentalOffer");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "buttonForOffer:playable:", v67, v43);
        v68 = (void *)objc_claimAutoreleasedReturnValue();

        if (v68)
          objc_msgSend(v61, "addObject:", v68);
        objc_msgSend(v43, "bestStoreBuyOffer");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "buttonForOffer:playable:", v69, v43);
        v70 = (void *)objc_claimAutoreleasedReturnValue();

        if (v70)
          objc_msgSend(v61, "addObject:", v70);
        if (!objc_msgSend(v61, "count"))
        {
          objc_msgSend(v43, "storeOffers");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "lastObject");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "buttonForOffer:playable:", v72, v43);
          v73 = (void *)objc_claimAutoreleasedReturnValue();

          if (v73)
            objc_msgSend(v61, "addObject:", v73);

          v13 = v86;
        }

      }
      if (objc_msgSend(v61, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v88, objc_msgSend(v61, "count"));
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "insertObjects:atIndexes:", v61, v74);

      }
    }
LABEL_86:
    v55 = v90;
  }
  while (objc_msgSend(v55, "count") > v57)
    objc_msgSend(v55, "removeLastObject");
  if (v56)
    objc_msgSend(v90, "addObject:", v92);
  if (v83)
  {
    v75 = (void *)objc_opt_new();
    objc_msgSend(v75, "setWatchListState:", v82);
    objc_msgSend(v75, "setButtonType:", 3);
    objc_msgSend(v90, "addObject:", v75);

  }
  v76 = v90;

  return v76;
}

+ (BOOL)channelHasBeenSeen:(id)a3 seenChannels:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  objc_msgSend(a3, "channelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);
  if ((v7 & 1) == 0)
    objc_msgSend(v5, "addObject:", v6);

  return v7;
}

+ (id)buttonForPlayable:(id)a3 isHorizontallySrollingStyle:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;

  v6 = a3;
  objc_msgSend(v6, "channelDetails");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "punchoutUrls");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tvAppDeeplinkURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "isEntitled");
  objc_msgSend(v6, "playEvent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v15) = a4;
  LOBYTE(v14) = 0;
  objc_msgSend(a1, "buttonForChannelDetails:punchoutURLs:tvAppDeeplinkURL:isEntitled:isContinuing:isContainerItem:hasDescriptiveSeasonTitle:seasonNumber:episodeNumber:isHorizontallySrollingStyle:", v7, v8, v9, v10, v11 != 0, 0, v14, 0, 0, v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)buttonForChannelDetails:(id)a3 punchoutURLs:(id)a4 tvAppDeeplinkURL:(id)a5 isEntitled:(BOOL)a6 isContinuing:(BOOL)a7 isContainerItem:(BOOL)a8 hasDescriptiveSeasonTitle:(BOOL)a9 seasonNumber:(id)a10 episodeNumber:(id)a11 isHorizontallySrollingStyle:(BOOL)a12
{
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  id v17;
  id v18;
  unint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  BOOL v24;
  id v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  SearchUIWatchListIconImage *v34;
  void *v35;
  SearchUIWatchListIconImage *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  unint64_t v56;
  void *v57;
  id v59;
  void *v61;
  id v62;
  id v63;
  id v64;

  v12 = a8;
  v13 = a7;
  v14 = a6;
  v17 = a3;
  v18 = a4;
  v19 = (unint64_t)a5;
  v64 = a10;
  v20 = a11;
  objc_msgSend(v17, "sui_channelName");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v20;
  if ((objc_msgSend(v17, "isAppInstalled") & 1) != 0 || objc_msgSend(v17, "isFirstParty"))
  {
    objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0DC89A8]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v18;
    objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0DC89A0]);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v22;
    if (!v14 || !v21 || (v20 ? (v24 = v64 == 0) : (v24 = 1), v24 && v12))
    {
      if (v19 | v22)
      {
        if (v19)
        {
          v25 = (id)v19;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v22);
          v25 = (id)objc_claimAutoreleasedReturnValue();
        }
        v28 = v25;
        v29 = v61;
        if (objc_msgSend(v17, "isApSubscription"))
          v43 = CFSTR("SUBSCRIBE_BUTTON_TITLE");
        else
          v43 = CFSTR("OPEN_BUTTON_TITLE");
        +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", v43);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        v26 = 0;
LABEL_40:
        v36 = (SearchUIWatchListIconImage *)objc_opt_new();
        if ((objc_msgSend(v17, "isFirstParty") & 1) != 0)
        {
          +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 18);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[SearchUIWatchListIconImage setBundleIdentifier:](v36, "setBundleIdentifier:", v49);
        }
        else
        {
          objc_msgSend(v17, "appBundleIDs");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "firstObject");
          v62 = v17;
          v50 = v26;
          v51 = v28;
          v52 = v27;
          v53 = v21;
          v54 = v23;
          v55 = v29;
          v56 = v19;
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[SearchUIWatchListIconImage setBundleIdentifier:](v36, "setBundleIdentifier:", v57);

          v19 = v56;
          v29 = v55;
          v23 = v54;
          v21 = v53;
          v27 = v52;
          v28 = v51;
          v26 = v50;
          v17 = v62;
        }

        v33 = 0;
        v18 = v59;
        v45 = v63;
        if (v28)
        {
LABEL_44:
          objc_msgSend(a1, "buttonWithTitle:subtitle:punchoutURL:type:image:storeIdentifier:", v27, v29, v28, v26, v36, v33);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_45;
        }
        goto LABEL_33;
      }
      v26 = 0;
      v27 = 0;
      v28 = 0;
LABEL_15:
      v29 = v61;
      goto LABEL_40;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v21);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      os_unfair_lock_lock(&sSeasonTitleLock);
      v37 = sSeasonTitlesEnabled;
      os_unfair_lock_unlock(&sSeasonTitleLock);
      objc_msgSend(v17, "sui_seasonEpisodeLabel:seasonTitleAvailable:seasonNumber:episodeNumber:", v37, a9, v64, v63);
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = (void *)v38;
      v40 = (void *)MEMORY[0x1E0CB3940];
      if (a12)
      {
        +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", CFSTR("PLAY_EPISODE_FORMAT"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", CFSTR("PLAY"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "stringWithValidatedFormat:validFormatSpecifiers:error:", v41, CFSTR("%@ %@"), 0, v42, v39);
        v27 = (id)objc_claimAutoreleasedReturnValue();

        v29 = v61;
      }
      else
      {
        v41 = v61;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), v38, v61);
        v27 = 0;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      if (!v13)
      {
        if (a12)
        {
          +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", CFSTR("PLAY"));
          v27 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v27 = 0;
        }
        v26 = 1;
        goto LABEL_15;
      }
      +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", CFSTR("CONTINUE"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v46;
      if (a12)
      {
        v27 = v46;
        v29 = v61;
      }
      else
      {
        v47 = (void *)MEMORY[0x1E0CB3940];
        +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", CFSTR("CONTINUE_IN_FORMAT"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "stringWithValidatedFormat:validFormatSpecifiers:error:", v48, CFSTR("%@ %@"), 0, v39, v61);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = 0;
      }
    }

    v26 = 1;
    goto LABEL_40;
  }
  v30 = v19;
  objc_msgSend(v17, "appStoreURL");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", CFSTR("INSTALL_BUTTON_TITLE"));
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "appStoreURL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "appAdamIDs");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "firstObject");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (a12)
    {
      v34 = [SearchUIWatchListIconImage alloc];
      objc_msgSend(v17, "images");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = -[SearchUIWatchListIconImage initWithArtwork:](v34, "initWithArtwork:", v35);

      -[SearchUIWatchListIconImage setSize:](v36, "setSize:", 45.0, 45.0);
    }
    else
    {
      v36 = 0;
    }
    v26 = 2;
    v19 = v30;
    v29 = v61;
    v45 = v63;
    if (v28)
      goto LABEL_44;
LABEL_33:
    v44 = 0;
    goto LABEL_45;
  }
  v28 = 0;
  v27 = 0;
  v36 = 0;
  v33 = 0;
  v44 = 0;
  v19 = v30;
  v29 = v61;
  v45 = v63;
LABEL_45:

  return v44;
}

+ (id)buttonForOffer:(id)a3 playable:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "channelDetails");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isFirstParty");

  v10 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v7, "punchoutUrls");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0DC89A0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLWithString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "channelDetails");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appBundleIDs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    v17 = v9 == 0;
  else
    v17 = 0;
  if (!v17)
  {
    +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 18);
    v18 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "tvAppDeeplinkURL");
    v19 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v18;
    v13 = (void *)v19;
  }
  v20 = 0;
  if (v6 && v13)
  {
    objc_msgSend(v6, "sui_buttonTitle");
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "channelDetails");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sui_channelName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sui_buttonSubtitleWithServiceName:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v25 = (void *)objc_opt_new();
      objc_msgSend(v25, "setBundleIdentifier:", v16);
      objc_msgSend(a1, "buttonWithTitle:subtitle:punchoutURL:type:image:storeIdentifier:", v21, v24, v13, 0, v25, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = (void *)v21;
    }
    else
    {
      v20 = 0;
    }

  }
  return v20;
}

+ (id)buttonForChannelOffer:(id)a3 channel:(id)a4 episode:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a3;
  v9 = a4;
  objc_msgSend(a5, "tvAppDeeplinkURL");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = 0;
  if (v8 && v10)
  {
    objc_msgSend(v8, "sui_buttonTitle");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "details");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sui_channelName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sui_buttonSubtitleWithServiceName:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v17 = (void *)objc_opt_new();
      +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 18);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setBundleIdentifier:", v18);

      objc_msgSend(a1, "buttonWithTitle:subtitle:punchoutURL:type:image:storeIdentifier:", v13, v16, v11, 0, v17, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)v13;
    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

+ (id)buttonWithTitle:(id)a3 subtitle:(id)a4 punchoutURL:(id)a5 type:(unint64_t)a6 image:(id)a7 storeIdentifier:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;

  v13 = a8;
  v14 = a7;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = (void *)objc_opt_new();
  objc_msgSend(v18, "setTitle:", v17);

  objc_msgSend(v18, "setSubtitle:", v16);
  objc_msgSend(v18, "setPunchoutURL:", v15);

  objc_msgSend(v18, "setButtonType:", a6);
  objc_msgSend(v18, "setThumbnailImage:", v14);

  objc_msgSend(v18, "setStoreIdentifier:", v13);
  return v18;
}

+ (void)updateStatusIsInWatchList:(BOOL)a3 watchListItemWithIdentifier:(id)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  Class *v12;
  void *v13;
  _QWORD aBlock[4];
  id v15;
  id v16;
  BOOL v17;

  v6 = a3;
  v7 = a4;
  v8 = a5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__SearchUIWatchListUtilities_updateStatusIsInWatchList_watchListItemWithIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1EA1F7080;
  v17 = v6;
  v9 = v7;
  v15 = v9;
  v10 = v8;
  v16 = v10;
  v11 = _Block_copy(aBlock);
  v12 = (Class *)0x1E0DC8740;
  if (!v6)
    v12 = (Class *)0x1E0DC8828;
  v13 = (void *)objc_msgSend(objc_alloc(*v12), "initWithCanonicalID:", v9);
  objc_msgSend(v13, "setCaller:", CFSTR("SearchUI"));
  objc_msgSend(v13, "makeRequestWithCompletion:", v11);

}

void __95__SearchUIWatchListUtilities_updateStatusIsInWatchList_watchListItemWithIdentifier_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    SearchUITapLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __95__SearchUIWatchListUtilities_updateStatusIsInWatchList_watchListItemWithIdentifier_completion___block_invoke_cold_1(a1, v6);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __95__SearchUIWatchListUtilities_updateStatusIsInWatchList_watchListItemWithIdentifier_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 48))
    v3 = CFSTR("add");
  else
    v3 = CFSTR("remove");
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = v2;
  _os_log_error_impl(&dword_1DAD39000, a2, OS_LOG_TYPE_ERROR, "Failed to %@ %@ to watchlist", (uint8_t *)&v4, 0x16u);
}

@end
