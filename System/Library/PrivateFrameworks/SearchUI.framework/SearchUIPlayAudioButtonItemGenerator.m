@implementation SearchUIPlayAudioButtonItemGenerator

+ (BOOL)mayRequireAsyncGenerationForButtonItem:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "audioData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "mediaMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "mediaType") != 100;

  }
  return v5;
}

- (void)generateSearchUIButtonItemsWithSFButtonItem:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD aBlock[4];
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "mediaMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mediaIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "mediaType");
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__SearchUIPlayAudioButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke;
  aBlock[3] = &unk_1EA1F6BE0;
  v11 = v5;
  v37 = v11;
  v12 = v7;
  v38 = v12;
  v13 = v6;
  v39 = v13;
  v14 = _Block_copy(aBlock);
  objc_msgSend(v11, "audioData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    if (+[SearchUIMediaUtilities isCoreSpotlightMedia:](SearchUIMediaUtilities, "isCoreSpotlightMedia:", v8))
    {
      SearchUIButtonItemLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DAD39000, v20, OS_LOG_TYPE_DEFAULT, "Generating a button item with core spotlight media metadata", buf, 2u);
      }

      v33[0] = v10;
      v33[1] = 3221225472;
      v33[2] = __95__SearchUIPlayAudioButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_11;
      v33[3] = &unk_1EA1F6BB8;
      v34 = v8;
      v35 = v14;
      +[SearchUIMediaUtilities getMusicUserDisclosureApprovalStatusWithCompletionHandler:](SearchUIMediaUtilities, "getMusicUserDisclosureApprovalStatusWithCompletionHandler:", v33);

      v21 = v34;
      goto LABEL_10;
    }
    if (v8 && v9 == 100)
    {
      SearchUIButtonItemLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        goto LABEL_5;
      *(_DWORD *)buf = 138412290;
      v41 = v8;
      v17 = "Generating a button for voicemail: %@";
      v18 = v16;
      v19 = 12;
      goto LABEL_4;
    }
    if (v12 && (objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS") & 1) == 0)
    {
      SearchUIButtonItemLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v12, "bundleIdentifiersToExclude");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v41 = v25;
        _os_log_impl(&dword_1DAD39000, v24, OS_LOG_TYPE_DEFAULT, "Figuring out best play button path with SAAudioAppPrediction with bundleIDs to exclude: %@", buf, 0xCu);

      }
      v28[0] = v10;
      v28[1] = 3221225472;
      v28[2] = __95__SearchUIPlayAudioButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_15;
      v28[3] = &unk_1EA1F7F98;
      v31 = v14;
      v29 = v12;
      v32 = v13;
      v30 = v11;
      +[SearchUIMediaUtilities predictionForMediaMetadata:completion:](SearchUIMediaUtilities, "predictionForMediaMetadata:completion:", v29, v28);

      v21 = v31;
      goto LABEL_10;
    }
    SearchUIButtonItemLog();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v8)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v8;
        _os_log_impl(&dword_1DAD39000, v23, OS_LOG_TYPE_DEFAULT, "Generating a button for media identifier: %@", buf, 0xCu);
      }

      if (v9 <= 5 && ((1 << v9) & 0x2E) != 0)
      {
        v26[0] = v10;
        v26[1] = 3221225472;
        v26[2] = __95__SearchUIPlayAudioButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_26;
        v26[3] = &unk_1EA1F6EB8;
        v27 = v14;
        +[SearchUIMediaUtilities canPlayAppleMusicWithCompletionHandler:](SearchUIMediaUtilities, "canPlayAppleMusicWithCompletionHandler:", v26);
        v21 = v27;
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[SearchUIPlayAudioButtonItemGenerator generateSearchUIButtonItemsWithSFButtonItem:completion:].cold.1(v23);

    }
    (*((void (**)(void *, _QWORD))v14 + 2))(v14, 0);
    goto LABEL_11;
  }
  SearchUIButtonItemLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v17 = "Generating a button item with audio data";
    v18 = v16;
    v19 = 2;
LABEL_4:
    _os_log_impl(&dword_1DAD39000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
  }
LABEL_5:

  (*((void (**)(void *, uint64_t))v14 + 2))(v14, 1);
LABEL_11:

}

void __95__SearchUIPlayAudioButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke(_QWORD *a1, int a2)
{
  SearchUIPlayAudioButtonItem *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = -[SearchUIPlayAudioButtonItem initWithSFButtonItem:]([SearchUIPlayAudioButtonItem alloc], "initWithSFButtonItem:", a1[4]);
    -[SearchUIButtonItem setStatus:](v3, "setStatus:", +[SearchUIMediaUtilities isNowPlayingMedia:](SearchUIMediaUtilities, "isNowPlayingMedia:", a1[5]));
    v4 = a1[6];
    v6[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t))(v4 + 16))(v4, v5, 1);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, uint64_t))(a1[6] + 16))(a1[6], MEMORY[0x1E0C9AA60], 1);
  }
}

void __95__SearchUIPlayAudioButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_11(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  if (a2)
  {
    +[SearchUIMediaUtilities localAudioCache](SearchUIMediaUtilities, "localAudioCache");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __95__SearchUIPlayAudioButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_2;
    v5[3] = &unk_1EA1F7F70;
    v4 = *(_QWORD *)(a1 + 32);
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v3, "getObjectForKey:completionHandler:", v4, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __95__SearchUIPlayAudioButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    SearchUIButtonItemLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = objc_msgSend(v4, "count");
      _os_log_impl(&dword_1DAD39000, v5, OS_LOG_TYPE_DEFAULT, "Fetched the collection with count: %lu", (uint8_t *)&v7, 0xCu);
    }

    (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v4, "count") != 0);
  }
  else
  {
    SearchUIButtonItemLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = (uint64_t)v3;
      _os_log_impl(&dword_1DAD39000, v6, OS_LOG_TYPE_DEFAULT, "Fetched the media entity for corespotlight media identifier: %@", (uint8_t *)&v7, 0xCu);
    }

    (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v3 != 0);
  }

}

void __95__SearchUIPlayAudioButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  SearchUIPlayAudioButtonItem *v34;
  void *v35;
  uint64_t v36;
  SearchUIPlayAudioButtonItem *v37;
  void *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  SearchUIPlayAudioButtonItem *v46;
  _BYTE v47[128];
  SearchUIPlayAudioButtonItem *v48;
  uint8_t buf[4];
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SearchUIButtonItemLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "selectedBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v50 = v5;
    _os_log_impl(&dword_1DAD39000, v4, OS_LOG_TYPE_DEFAULT, "Siri predicted app bundle: %@", buf, 0xCu);

  }
  objc_msgSend(v3, "selectedBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[SearchUIUtilities isAppInstalledWithBundleId:](SearchUIUtilities, "isAppInstalledWithBundleId:", v6);

  if (!v7)
    goto LABEL_26;
  objc_msgSend(v3, "selectedBundleIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(*(id *)(a1 + 32), "bundleIdentifiersToExclude");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "selectedBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "containsObject:", v11);

    if ((v12 & 1) == 0)
    {
      objc_msgSend(v3, "selectedBundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqual:", v15);

      if (v16)
      {
        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = __95__SearchUIPlayAudioButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_17;
        v44[3] = &unk_1EA1F6EB8;
        v45 = *(id *)(a1 + 48);
        +[SearchUIMediaUtilities getMusicUserDisclosureApprovalStatusWithCompletionHandler:](SearchUIMediaUtilities, "getMusicUserDisclosureApprovalStatusWithCompletionHandler:", v44);

      }
      else
      {
        v36 = *(_QWORD *)(a1 + 56);
        v37 = -[SearchUIPlayAudioButtonItem initWithSFButtonItem:]([SearchUIPlayAudioButtonItem alloc], "initWithSFButtonItem:", *(_QWORD *)(a1 + 40));
        v48 = v37;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, uint64_t))(v36 + 16))(v36, v38, 1);

      }
      goto LABEL_30;
    }
  }
  +[SearchUIMediaUtilities mediaDestinationsForMediaMetadata:](SearchUIMediaUtilities, "mediaDestinationsForMediaMetadata:", *(_QWORD *)(a1 + 32));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "count"))
  {
    objc_msgSend(v3, "disambiguateBundleIdentifiers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (v18)
      goto LABEL_11;
LABEL_26:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_30;
  }

LABEL_11:
  SearchUIButtonItemLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "disambiguateBundleIdentifiers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v50 = v20;
    _os_log_impl(&dword_1DAD39000, v19, OS_LOG_TYPE_DEFAULT, "siri audo predicated disambiguate identifiers: %@", buf, 0xCu);

  }
  v21 = (void *)objc_opt_new();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v39 = v3;
  objc_msgSend(v3, "disambiguateBundleIdentifiers");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v41;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v41 != v25)
          objc_enumerationMutation(v22);
        v27 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v26);
        objc_msgSend(*(id *)(a1 + 32), "bundleIdentifiersToExclude");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "containsObject:", v27);

        if ((v29 & 1) == 0)
        {
          v30 = (void *)objc_opt_new();
          objc_msgSend(v30, "setAppBundleIdentifier:", v27);
          objc_msgSend(v30, "setMediaMetadata:", *(_QWORD *)(a1 + 32));
          objc_msgSend(v21, "addObject:", v30);

        }
        ++v26;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    }
    while (v24);
  }

  +[SearchUIMediaUtilities mediaDestinationsForMediaMetadata:](SearchUIMediaUtilities, "mediaDestinationsForMediaMetadata:", *(_QWORD *)(a1 + 32));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObjectsFromArray:", v31);

  SearchUIButtonItemLog();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v50 = v21;
    _os_log_impl(&dword_1DAD39000, v32, OS_LOG_TYPE_DEFAULT, "final media destinations: %@", buf, 0xCu);
  }

  v3 = v39;
  if (objc_msgSend(v21, "count"))
  {
    v33 = *(_QWORD *)(a1 + 56);
    v34 = -[SearchUIPlayAudioButtonItem initWithSFButtonItem:]([SearchUIPlayAudioButtonItem alloc], "initWithSFButtonItem:", *(_QWORD *)(a1 + 40));
    v46 = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t))(v33 + 16))(v33, v35, 1);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

LABEL_30:
}

void __95__SearchUIPlayAudioButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_17(uint64_t a1, int a2)
{
  _QWORD v2[4];
  id v3;

  if (a2)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __95__SearchUIPlayAudioButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_2_18;
    v2[3] = &unk_1EA1F6EB8;
    v3 = *(id *)(a1 + 32);
    +[SearchUIMediaUtilities canPlayAppleMusicWithCompletionHandler:](SearchUIMediaUtilities, "canPlayAppleMusicWithCompletionHandler:", v2);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

uint64_t __95__SearchUIPlayAudioButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_2_18(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  SearchUIButtonItemLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("NO");
    if (a2)
      v5 = CFSTR("YES");
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1DAD39000, v4, OS_LOG_TYPE_DEFAULT, "Siri predicted apple music and can play: %@", (uint8_t *)&v7, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __95__SearchUIPlayAudioButtonItemGenerator_generateSearchUIButtonItemsWithSFButtonItem_completion___block_invoke_26(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  SearchUIButtonItemLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("NO");
    if (a2)
      v5 = CFSTR("YES");
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1DAD39000, v4, OS_LOG_TYPE_DEFAULT, "Media Metadata can play apple music! %@", (uint8_t *)&v7, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)generateSearchUIButtonItemsWithSFButtonItem:(os_log_t)log completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DAD39000, log, OS_LOG_TYPE_ERROR, "Could not generate audio button item", v1, 2u);
}

@end
