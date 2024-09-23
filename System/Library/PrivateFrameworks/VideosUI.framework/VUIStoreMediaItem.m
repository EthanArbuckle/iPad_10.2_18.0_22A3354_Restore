@implementation VUIStoreMediaItem

void __35__VUIStoreMediaItem_iOS_initialize__block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;

  v0 = os_log_create("com.apple.AppleTV.playback", "VUIStoreMediaItem_iOS");
  v1 = (void *)sLogObject_14;
  sLogObject_14 = (uint64_t)v0;

  v2 = os_log_create("com.apple.AppleTV.playback", "SecureKeyDelivery");
  v3 = (void *)sSecureKeyDeliveryLogObject;
  sSecureKeyDeliveryLogObject = (uint64_t)v2;

}

void __86__VUIStoreMediaItem_iOS_initWithMPMediaItem_videoManagedObject_isForStartingDownload___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "canonicalID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMediaItemMetadata:forProperty:", v3, *MEMORY[0x1E0DB1A08]);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "referenceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMediaItemMetadata:forProperty:", v5, *MEMORY[0x1E0DB1BE8]);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "requiredAgeForPlayback");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMediaItemMetadata:forProperty:", v7, *MEMORY[0x1E0DB1C10]);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "frequencyOfAgeConfirmation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMediaItemMetadata:forProperty:", v9, *MEMORY[0x1E0DB1AF0]);

  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "mediaMetrics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMediaItemMetadata:forProperty:", v11, *MEMORY[0x1E0DB1B88]);

  v12 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "downloadedPlaybackMode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMediaItemMetadata:forProperty:", v13, CFSTR("VUIContentMetadataDownloadedPlaybackMode"));

  v14 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "playablePassThrough");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setMediaItemMetadata:forProperty:", v15, CFSTR("VUIMediaItemMetadataPlayablePassThrough"));

  objc_msgSend(*(id *)(a1 + 40), "programID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(*(id *)(a1 + 40), "downloadURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v37 = v17;
      v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v17, 0);
      objc_msgSend(v36, "queryItems");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v18, "mutableCopy");

      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v20 = v19;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v21)
      {
        v22 = v21;
        v16 = 0;
        v23 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v39 != v23)
              objc_enumerationMutation(v20);
            v25 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
            objc_msgSend(v25, "name");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("id"));

            if (v27)
            {
              objc_msgSend(v25, "value");
              v28 = objc_claimAutoreleasedReturnValue();

              v16 = (void *)v28;
            }
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        }
        while (v22);
      }
      else
      {
        v16 = 0;
      }

      v17 = v37;
    }
    else
    {
      v16 = 0;
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "setMediaItemMetadata:forProperty:", v16, *MEMORY[0x1E0DB1B08]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v29 = *(void **)(a1 + 32);
    v30 = *(id *)(a1 + 40);
    objc_msgSend(v30, "series");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "canonicalID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setMediaItemMetadata:forProperty:", v32, *MEMORY[0x1E0DB1C60]);

    v33 = *(void **)(a1 + 32);
    objc_msgSend(v30, "season");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "canonicalID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setMediaItemMetadata:forProperty:", v35, *MEMORY[0x1E0DB1C38]);

  }
}

void __57__VUIStoreMediaItem_iOS_prepareForLoadingWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id *v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  NSObject *v29;
  uint64_t v30;
  id v31;
  id v32;
  int v33;
  int v34;
  id v35;
  NSObject *v36;
  NSObject *v37;
  id v38;
  _QWORD aBlock[4];
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    v6 = (id *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "setFpsKeyError:", 0);

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__VUIStoreMediaItem_iOS_prepareForLoadingWithCompletion___block_invoke_2;
    aBlock[3] = &unk_1E9F9FF48;
    objc_copyWeak(&v41, (id *)(a1 + 40));
    v40 = *(id *)(a1 + 32);
    v8 = _Block_copy(aBlock);
    v9 = objc_loadWeakRetained(v6);
    objc_msgSend(v9, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1AE8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    if (v11)
    {
      v12 = sLogObject_14;
      if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_DEFAULT, "Force streaming is set; configuring for streaming",
          buf,
          2u);
      }
      v13 = objc_loadWeakRetained(v6);
      objc_msgSend(v13, "_configureForStreamingPlaybackWithCompletion:", v8);
      goto LABEL_35;
    }
    v15 = objc_loadWeakRetained(v6);
    objc_msgSend(v15, "videoManagedObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = objc_loadWeakRetained(v6);
      objc_msgSend(v17, "videoManagedObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "downloadState");

      if (v19 == 2)
      {
        v20 = sLogObject_14;
        if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D96EE000, v20, OS_LOG_TYPE_DEFAULT, "Using local file path from sideband database", buf, 2u);
        }
        v21 = objc_loadWeakRetained(v6);
        objc_msgSend(v21, "videoManagedObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "localPlaybackURL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v38 = objc_alloc_init(MEMORY[0x1E0CB3620]);
        objc_msgSend(v13, "path");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v23 || (objc_msgSend(v38, "fileExistsAtPath:", v23) & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_ERROR))
            __57__VUIStoreMediaItem_iOS_prepareForLoadingWithCompletion___block_invoke_cold_1();
          +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "sidebandMediaLibrary");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_loadWeakRetained(v6);
          objc_msgSend(v26, "videoManagedObject");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "removeDownloadedMediaForVideoManagedObject:markAsDeleted:invalidateImmediately:", v27, 0, 1);

        }
        v19 = 2;
        if (v13)
          goto LABEL_24;
      }
    }
    else
    {

      v19 = 0;
    }
    v28 = objc_loadWeakRetained(v6);
    objc_msgSend(v28, "_localPlaybackFilePathURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v29 = sLogObject_14;
      if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v29, OS_LOG_TYPE_DEFAULT, "Using local file path from MediaLibrary database", buf, 2u);
      }
      v30 = 0;
LABEL_25:
      v31 = objc_loadWeakRetained(v6);
      objc_msgSend(v31, "setUseSidebandLibraryForPlaybackKeys:", v30);

      v32 = objc_loadWeakRetained(v6);
      v33 = objc_msgSend(v32, "isForStartingDownload");
      if (v19 == 1)
        v34 = 1;
      else
        v34 = v33;

      if (v34)
      {
        v35 = objc_loadWeakRetained(v6);
        objc_msgSend(v35, "_configureForDownloadingWithCompletion:", v8);
      }
      else if (v13)
      {
        v36 = sLogObject_14;
        if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v43 = v13;
          _os_log_impl(&dword_1D96EE000, v36, OS_LOG_TYPE_DEFAULT, "Found local file path for this media item: %@", buf, 0xCu);
        }
        v35 = objc_loadWeakRetained(v6);
        objc_msgSend(v35, "_configureForLocalPlaybackWithURL:completion:", v13, v8);
      }
      else
      {
        if (v19)
          goto LABEL_35;
        v37 = sLogObject_14;
        if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D96EE000, v37, OS_LOG_TYPE_DEFAULT, "No local file path or download exists for this media item; configuring for streaming",
            buf,
            2u);
        }
        v35 = objc_loadWeakRetained(v6);
        objc_msgSend(v35, "_configureForStreamingPlaybackWithCompletion:", v8);
      }

LABEL_35:
      objc_destroyWeak(&v41);
      goto LABEL_36;
    }
LABEL_24:
    v30 = 1;
    goto LABEL_25;
  }
  v14 = *(_QWORD *)(a1 + 32);
  if (v14)
    (*(void (**)(uint64_t, _QWORD, id))(v14 + 16))(v14, 0, v5);
LABEL_36:

}

void __57__VUIStoreMediaItem_iOS_prepareForLoadingWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)sLogObject_14;
  if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_videoPlaybackTypeDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v9;
    _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "Playback type is %@", (uint8_t *)&v11, 0xCu);

  }
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, a2, v5);

}

void __68__VUIStoreMediaItem_iOS_prepareForPlaybackInitiationWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = *MEMORY[0x1E0DB1D28];
  objc_msgSend(WeakRetained, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (_QWORD *)MEMORY[0x1E0DB1F08];
  objc_msgSend(v7, "addEndEventWithName:", *MEMORY[0x1E0DB1F08]);

  if (v14)
  {
    v9 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v9, "mediaItemMetadataForProperty:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSingleShotEventWithName:value:", *MEMORY[0x1E0DB1E80], v14);

    v11 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v11, "mediaItemMetadataForProperty:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSingleShotEventWithName:value:", *MEMORY[0x1E0DB1E88], *v8);

  }
  v13 = *(_QWORD *)(a1 + 32);
  if (v13)
    (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, a2, v14);

}

uint64_t __63__VUIStoreMediaItem_iOS_processFinishedDownloadWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

void __77__VUIStoreMediaItem_iOS_mediaItemAllInitialLoadingComplete_totalTime_player___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  void *v4;
  BOOL v5;
  void *v6;
  _QWORD v7[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1BF8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1A50]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v2)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF600]), "initWithAccountIdentifier:rentalKeyIdentifier:", v3, v2);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __77__VUIStoreMediaItem_iOS_mediaItemAllInitialLoadingComplete_totalTime_player___block_invoke_2;
    v7[3] = &unk_1E9F9FF98;
    v7[4] = WeakRetained;
    objc_msgSend(v6, "startWithResponseBlock:", v7);

  }
}

void __77__VUIStoreMediaItem_iOS_mediaItemAllInitialLoadingComplete_totalTime_player___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  uint64_t v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__VUIStoreMediaItem_iOS_mediaItemAllInitialLoadingComplete_totalTime_player___block_invoke_3;
  block[3] = &unk_1E9F99840;
  v11 = v6;
  v12 = v7;
  v13 = *(_QWORD *)(a1 + 32);
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __77__VUIStoreMediaItem_iOS_mediaItemAllInitialLoadingComplete_totalTime_player___block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D0D530]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = sLogObject_14;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(void **)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      v7 = 138412546;
      v8 = v4;
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "rentalInformation: %@ error: %@", (uint8_t *)&v7, 0x16u);
    }
    v6 = sLogObject_14;
    if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v2;
      _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "Playback start date: %@", (uint8_t *)&v7, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 48), "_updateRentalPlaybackStartDate:", v2);
  }
  else if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_ERROR))
  {
    __77__VUIStoreMediaItem_iOS_mediaItemAllInitialLoadingComplete_totalTime_player___block_invoke_3_cold_1();
  }

}

uint64_t __69__VUIStoreMediaItem_iOS_loadFairPlayStreamingKeyRequests_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  v2 = sLogObject_14;
  if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D96EE000, v2, OS_LOG_TYPE_DEFAULT, "Received response for key request(s)", v4, 2u);
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __94__VUIStoreMediaItem_iOS__configureForPlaybackFromExistingDownload_downloadManager_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id *v6;
  id WeakRetained;
  char v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  void *v53;
  void *v54;
  uint64_t v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  void *v63;
  const __CFString *v64;
  void *v65;
  _QWORD v66[2];
  uint64_t v67;
  uint64_t v68;
  uint8_t buf[4];
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = objc_msgSend(WeakRetained, "_loadingCancelled:", *(_QWORD *)(a1 + 56));

  if ((v8 & 1) == 0)
  {
    if (a2 == 1)
    {
      v9 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v9, "_localPlaybackFilePathURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "pathExtension");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("movpkg"));

      v13 = sLogObject_14;
      if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v70 = v10;
        _os_log_impl(&dword_1D96EE000, v13, OS_LOG_TYPE_DEFAULT, "After downloading, using local file path for this media item: %@", buf, 0xCu);
      }
      v14 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v14, "setPlaybackURL:", v10);

      v15 = objc_loadWeakRetained((id *)(a1 + 48));
      v16 = v15;
      if (v12)
        v17 = 6;
      else
        v17 = 5;
      if (v12)
        v18 = 2;
      else
        v18 = 1;
      objc_msgSend(v15, "setPlaybackType:", v17);

      v19 = objc_loadWeakRetained((id *)(a1 + 48));
      v20 = *MEMORY[0x1E0DB1D28];
      objc_msgSend(v19, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setIsDownloaded:", 1);

      v22 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v22, "mediaItemMetadataForProperty:", v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setVideoType:", v18);

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else if (a2 == 2)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "assetsForType:", *MEMORY[0x1E0DAF7C8]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "firstObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = *MEMORY[0x1E0DAF7B0];
      v66[0] = *MEMORY[0x1E0DAF7B8];
      v26 = v66[0];
      v66[1] = v27;
      v29 = *MEMORY[0x1E0DAF7A8];
      v67 = *MEMORY[0x1E0DAF7A0];
      v28 = v67;
      v68 = v29;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 4);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "vui_valuesForProperties:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v31, "objectForKey:", v26);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKey:", v27);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKey:", v28);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v29;
      v36 = v25;
      objc_msgSend(v31, "objectForKey:", v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v37, "BOOLValue");

      objc_msgSend(v25, "sinfs");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v32, "length")
        || (v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v32)) == 0)
      {
        if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_ERROR))
          __94__VUIStoreMediaItem_iOS__configureForPlaybackFromExistingDownload_downloadManager_completion___block_invoke_cold_3();
        v63 = 0;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || !objc_msgSend(v33, "length")
        || (objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v33),
            (v38 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_ERROR))
          __94__VUIStoreMediaItem_iOS__configureForPlaybackFromExistingDownload_downloadManager_completion___block_invoke_cold_2();
        v38 = 0;
      }
      v61 = v33;
      if (!v34
        || !objc_msgSend(v34, "unsignedLongLongValue")
        || (v39 = objc_msgSend(v34, "unsignedLongLongValue"), v39 == *MEMORY[0x1E0DAF708]))
      {
        if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_ERROR))
          __94__VUIStoreMediaItem_iOS__configureForPlaybackFromExistingDownload_downloadManager_completion___block_invoke_cold_1();

        v34 = 0;
      }
      if (!v62)
      {
        v40 = sLogObject_14;
        if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D96EE000, v40, OS_LOG_TYPE_DEFAULT, "sinfsArray is nil", buf, 2u);
        }
      }
      if (v63 && v38 && v34)
      {
        v59 = v32;
        v41 = objc_loadWeakRetained((id *)(a1 + 48));
        objc_msgSend(v41, "setPlaybackURL:", v63);

        if (v62)
        {
          v42 = objc_loadWeakRetained((id *)(a1 + 48));
          v64 = CFSTR("sinfs");
          v65 = v62;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setSinfsDict:", v43);

        }
        v44 = objc_loadWeakRetained((id *)(a1 + 48));
        objc_msgSend(v44, "setDownloadToken:", v34);

        v45 = objc_loadWeakRetained((id *)(a1 + 48));
        objc_msgSend(v45, "setDownloadDestinationURL:", v38);

        v46 = objc_loadWeakRetained((id *)(a1 + 48));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v36, "fileSize"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setFileSize:", v47);

        v48 = objc_loadWeakRetained((id *)(a1 + 48));
        v49 = v48;
        if (v60)
          v50 = 4;
        else
          v50 = 3;
        if (v60)
          v51 = 2;
        else
          v51 = 1;
        objc_msgSend(v48, "setPlaybackType:", v50);

        v52 = objc_loadWeakRetained((id *)(a1 + 48));
        objc_msgSend(v52, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
        v53 = v36;
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "setVideoType:", v51);

        v36 = v53;
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        v32 = v59;
      }
      else
      {
        v55 = *(_QWORD *)(a1 + 40);
        v56 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v57 = (void *)objc_msgSend(v56, "initWithDomain:code:userInfo:", VUIStoreMediaItemErrorDomain, -123004, 0);
        (*(void (**)(uint64_t, _QWORD, void *))(v55 + 16))(v55, 0, v57);

      }
    }
    v58 = objc_loadWeakRetained(v6);
    objc_msgSend(v58, "setDownloadMonitor:", 0);

  }
}

void __70__VUIStoreMediaItem_iOS__configureForStreamingPlaybackWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id WeakRetained;
  char v9;
  void *v10;
  uint64_t *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  NSObject *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  void *v60;
  id *v61;
  _QWORD *v62;
  id v63;
  void *v64;
  id v65;
  void *v66;
  id v67;
  void *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  id *location;
  uint64_t v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint64_t v84;
  void *v85;
  uint8_t buf[4];
  void *v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = objc_msgSend(WeakRetained, "_loadingCancelled:", *(_QWORD *)(a1 + 48));

  v10 = v6;
  if ((v9 & 1) == 0)
  {
    v11 = (uint64_t *)MEMORY[0x1E0DB1D28];
    if (v5)
    {
      location = (id *)(a1 + 40);
      v73 = a1;
      v74 = v6;
      v75 = v5;
      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      objc_msgSend(v5, "objectForKey:", CFSTR("assets"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
      if (!v13)
      {
        v78 = 0;
        v79 = 0;
        v76 = 0;
        v77 = 0;
        goto LABEL_22;
      }
      v14 = v13;
      v78 = 0;
      v79 = 0;
      v76 = 0;
      v77 = 0;
      v15 = *(_QWORD *)v81;
      while (1)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v81 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
          objc_msgSend(v17, "objectForKey:", CFSTR("flavor"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v18, "isEqualToString:", CFSTR("1080p")) & 1) != 0)
          {
            v20 = v78;
            v19 = v79;
            v78 = v17;
          }
          else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("720p")) & 1) != 0)
          {
            v20 = v77;
            v19 = v79;
            v77 = v17;
          }
          else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("480p")) & 1) != 0)
          {
            v20 = v76;
            v19 = v79;
            v76 = v17;
          }
          else
          {
            v20 = v79;
            v19 = v17;
            if (!objc_msgSend(v18, "isEqualToString:", CFSTR("SD")))
              goto LABEL_16;
          }
          v21 = v17;

          v79 = v19;
LABEL_16:

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v80, v88, 16);
        if (!v14)
        {
LABEL_22:

          +[VUIPlaybackSettings sharedSettings](VUIPlaybackSettings, "sharedSettings");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "preferredPlaybackQualityForCurrentNetworkStatus");

          v7 = (id *)(a1 + 40);
          v24 = objc_loadWeakRetained(location);
          objc_msgSend(v24, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B98]);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
            v23 = objc_msgSend(v25, "BOOLValue") ^ 1;
          if (!v23 && (v26 = v78) != 0 || !v23 && (v26 = v77) != 0 || (v26 = v76) != 0 || (v26 = v79) != 0)
          {
            v27 = v26;
            v28 = (void *)sLogObject_14;
            if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
            {
              v29 = v28;
              objc_msgSend(v27, "objectForKey:", CFSTR("flavor"));
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v87 = v30;
              _os_log_impl(&dword_1D96EE000, v29, OS_LOG_TYPE_DEFAULT, "Preferred CRABS asset flavor: %@", buf, 0xCu);

            }
          }
          else
          {
            v68 = (void *)sLogObject_14;
            if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
            {
              v69 = v68;
              objc_msgSend(v75, "valueForKeyPath:", CFSTR("asset-info.flavor"));
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v87 = v70;
              _os_log_impl(&dword_1D96EE000, v69, OS_LOG_TYPE_DEFAULT, "No assets available in store item dictionary.  Returning store item dictionary itself.  Flavor is %@", buf, 0xCu);

            }
            v27 = v75;
          }
          objc_msgSend(v27, "objectForKey:", CFSTR("URL"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "objectForKey:", CFSTR("hls-playlist-url"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v32, "length") && !*(_BYTE *)(v73 + 56))
          {
            v71 = v31;
            v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v32);
            v46 = objc_loadWeakRetained(location);
            objc_msgSend(v46, "_hlsURLEnsuringDsidQueryParamIsPresentFromURL:", v45);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            v47 = objc_loadWeakRetained(location);
            LODWORD(v46) = objc_msgSend(v47, "isBingeWatched");

            if ((_DWORD)v46)
            {
              objc_msgSend(v33, "vui_URLByAddingQueryParamWithName:value:", CFSTR("bingeWatching"), CFSTR("true"));
              v48 = objc_claimAutoreleasedReturnValue();

              v33 = (void *)v48;
            }
            v49 = objc_loadWeakRetained(location);
            objc_msgSend(v49, "setPlaybackURL:", v33);

            v50 = objc_loadWeakRetained(location);
            objc_msgSend(v50, "setPlaybackType:", 2);

            v51 = objc_loadWeakRetained(location);
            objc_msgSend(v51, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "setVideoType:", 2);

            v53 = sLogObject_14;
            if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D96EE000, v53, OS_LOG_TYPE_DEFAULT, "Updating ML3Track's HLS playlist URL", buf, 2u);
            }
            v54 = objc_loadWeakRetained(location);
            objc_msgSend(v54, "ml3Track");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v85 = v32;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v84 = *MEMORY[0x1E0D50DD0];
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v84, 1);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "setValues:forProperties:async:withCompletionBlock:", v56, v57, 1, 0);

            v7 = location;
            v10 = v74;
            v31 = v71;
          }
          else if (v31)
          {
            objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v31);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v31;
            v35 = objc_loadWeakRetained(location);
            objc_msgSend(v27, "objectForKey:", CFSTR("downloadKey"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "_setDownloadKeyCookieWithURL:downloadKey:", v33, v36);

            v37 = objc_loadWeakRetained(location);
            objc_msgSend(v37, "setPlaybackURL:", v33);

            v38 = objc_loadWeakRetained(location);
            objc_msgSend(v38, "setSinfsDict:", v27);

            v39 = objc_loadWeakRetained(location);
            objc_msgSend(v27, "objectForKey:", CFSTR("file-size"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "setFileSize:", v40);

            v41 = objc_loadWeakRetained(location);
            objc_msgSend(v41, "setPlaybackType:", 1);

            v42 = objc_loadWeakRetained(location);
            objc_msgSend(v42, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "setVideoType:", 1);

            v31 = v34;
            v10 = v74;
          }
          else
          {
            v44 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v10 = (void *)objc_msgSend(v44, "initWithDomain:code:userInfo:", VUIStoreMediaItemErrorDomain, -123005, 0);
            v33 = v74;
          }

          v6 = v74;
          v5 = v75;
          a1 = v73;
          v11 = (uint64_t *)MEMORY[0x1E0DB1D28];
          goto LABEL_43;
        }
      }
    }
    if (v6)
    {
      v10 = v6;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_ERROR))
        __70__VUIStoreMediaItem_iOS__configureForStreamingPlaybackWithCompletion___block_invoke_cold_1();
      v67 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v10 = (void *)objc_msgSend(v67, "initWithDomain:code:userInfo:", VUIStoreMediaItemErrorDomain, -123006, 0);
    }
LABEL_43:
    v58 = objc_loadWeakRetained(v7);
    v59 = *v11;
    objc_msgSend(v58, "mediaItemMetadataForProperty:", *v11);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v7;
    v62 = (_QWORD *)MEMORY[0x1E0DB1E68];
    objc_msgSend(v60, "addEndEventWithName:", *MEMORY[0x1E0DB1E68]);

    if (v10)
    {
      v63 = objc_loadWeakRetained(v61);
      objc_msgSend(v63, "mediaItemMetadataForProperty:", v59);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "addSingleShotEventWithName:value:", *MEMORY[0x1E0DB1E80], v10);

      v65 = objc_loadWeakRetained(v61);
      objc_msgSend(v65, "mediaItemMetadataForProperty:", v59);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "addSingleShotEventWithName:value:", *MEMORY[0x1E0DB1E88], *v62);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __64__VUIStoreMediaItem_iOS__configureForDownloadingWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  char v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  NSObject *v59;
  void *v60;
  id *location;
  void *v62;
  uint64_t v63;
  id v64;
  void *v65;
  void *v66;
  id obj;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t buf[4];
  void *v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = objc_msgSend(WeakRetained, "_loadingCancelled:", *(_QWORD *)(a1 + 48));

  v9 = v6;
  if ((v8 & 1) != 0)
    goto LABEL_42;
  if (!v5)
  {
    if (v6)
    {
      v9 = v6;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_ERROR))
        __70__VUIStoreMediaItem_iOS__configureForStreamingPlaybackWithCompletion___block_invoke_cold_1();
      v57 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v9 = (void *)objc_msgSend(v57, "initWithDomain:code:userInfo:", VUIStoreMediaItemErrorDomain, -123006, 0);
    }
    goto LABEL_41;
  }
  location = (id *)(a1 + 40);
  v62 = v5;
  v63 = a1;
  v64 = v6;
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  objc_msgSend(v5, "objectForKey:", CFSTR("assets"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
  if (!v10)
  {
    v12 = 0;
    v65 = 0;
    v66 = 0;
    v68 = 0;
    goto LABEL_22;
  }
  v11 = v10;
  v12 = 0;
  v65 = 0;
  v66 = 0;
  v68 = 0;
  v13 = *(_QWORD *)v70;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v70 != v13)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
      objc_msgSend(v15, "objectForKey:", CFSTR("flavor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v16, "isEqualToString:", CFSTR("1080p")) & 1) != 0)
      {
        v17 = v68;
        v18 = v12;
        v68 = v15;
      }
      else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("720p")) & 1) != 0)
      {
        v17 = v66;
        v18 = v12;
        v66 = v15;
      }
      else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("480p")) & 1) != 0)
      {
        v17 = v65;
        v18 = v12;
        v65 = v15;
      }
      else
      {
        v17 = v12;
        v18 = v15;
        if (!objc_msgSend(v16, "isEqualToString:", CFSTR("SD")))
          goto LABEL_16;
      }
      v19 = v15;

      v12 = v18;
LABEL_16:

    }
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
  }
  while (v11);
LABEL_22:

  v20 = objc_loadWeakRetained(location);
  objc_msgSend(v20, "mediaItemMetadataForProperty:", CFSTR("VUIContentMetadataDownloadQuality"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "integerValue");

  if (!v22 && (v23 = v68) != 0 || (v23 = v66) != 0 || (v23 = v65) != 0 || (v23 = v12) != 0)
  {
    v24 = v23;
    v25 = (void *)sLogObject_14;
    if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
    {
      v26 = v25;
      objc_msgSend(v24, "objectForKey:", CFSTR("flavor"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v74 = v27;
      _os_log_impl(&dword_1D96EE000, v26, OS_LOG_TYPE_DEFAULT, "Preferred CRABS asset flavor: %@", buf, 0xCu);

    }
    v5 = v62;
  }
  else
  {
    v58 = (void *)sLogObject_14;
    v5 = v62;
    if (os_log_type_enabled((os_log_t)sLogObject_14, OS_LOG_TYPE_DEFAULT))
    {
      v59 = v58;
      objc_msgSend(v62, "valueForKeyPath:", CFSTR("asset-info.flavor"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v74 = v60;
      _os_log_impl(&dword_1D96EE000, v59, OS_LOG_TYPE_DEFAULT, "No assets available in store item dictionary.  Returning store item dictionary itself.  Flavor is %@", buf, 0xCu);

    }
    v24 = v62;
  }
  objc_msgSend(v24, "objectForKey:", CFSTR("URL"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("hls-playlist-url"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v29, "length") && !*(_BYTE *)(v63 + 56))
  {
    v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v29);
    v48 = objc_loadWeakRetained(location);
    objc_msgSend(v48, "_hlsURLEnsuringDsidQueryParamIsPresentFromURL:", v47);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v49, "vui_URLByAddingQueryParamWithName:value:", CFSTR("playback-type"), CFSTR("download"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v62;
    v50 = objc_loadWeakRetained(location);
    objc_msgSend(v50, "setPlaybackURL:", v30);

    v51 = objc_loadWeakRetained(location);
    objc_msgSend(v51, "setPlaybackType:", 4);

    v52 = objc_loadWeakRetained(location);
    objc_msgSend(v52, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setVideoType:", 2);

LABEL_36:
    v9 = v64;
  }
  else
  {
    if (v28)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_loadWeakRetained(location);
      objc_msgSend(v24, "objectForKey:", CFSTR("downloadKey"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "_setDownloadKeyCookieWithURL:downloadKey:", v30, v32);

      v33 = objc_loadWeakRetained(location);
      objc_msgSend(v33, "setPlaybackURL:", v30);

      v34 = objc_loadWeakRetained(location);
      objc_msgSend(v34, "setSinfsDict:", v24);

      v35 = objc_loadWeakRetained(location);
      objc_msgSend(v24, "objectForKey:", CFSTR("file-size"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setFileSize:", v36);

      v37 = objc_loadWeakRetained(location);
      objc_msgSend(v37, "setPlaybackType:", 3);

      v38 = objc_loadWeakRetained(location);
      objc_msgSend(v38, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1D28]);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setVideoType:", 1);

      v40 = objc_loadWeakRetained(location);
      objc_msgSend(v40, "videoManagedObject");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setPlaybackURL:", v30);

      v42 = objc_loadWeakRetained(location);
      objc_msgSend(v42, "videoManagedObject");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setRedownloadProductResponseDictionary:", v24);

      +[VUIMediaLibraryManager defaultManager](VUIMediaLibraryManager, "defaultManager");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "sidebandMediaLibrary");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "saveChangesToManagedObjects");

      goto LABEL_36;
    }
    v46 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v9 = (void *)objc_msgSend(v46, "initWithDomain:code:userInfo:", VUIStoreMediaItemErrorDomain, -123005, 0);
    v30 = v64;
  }

  objc_msgSend(v5, "vui_numberForKey:", CFSTR("rental-id"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v54;
  if (v54 && (objc_msgSend(v54, "isEqualToNumber:", &unk_1EA0B9C40) & 1) == 0)
  {
    v56 = objc_loadWeakRetained(location);
    objc_msgSend(v56, "setMediaItemMetadata:forProperty:", v55, *MEMORY[0x1E0DB1BF8]);

    v5 = v62;
  }

  a1 = v63;
  v6 = v64;
LABEL_41:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_42:

}

void __87__VUIStoreMediaItem_iOS__checkoutRentalWithCheckoutType_startPlaybackClock_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = v5;
  objc_msgSend(v7, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("TVPlaybackErrorDomain")))
  {
    v9 = objc_msgSend(v7, "code");

    v10 = v7;
    if (v9 == 812)
    {
      objc_msgSend(WeakRetained, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CC8]);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!-[__CFString length](v11, "length"))
      {

        v11 = &stru_1E9FF3598;
      }
      v12 = (void *)MEMORY[0x1E0CB3940];
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:", CFSTR("TOO_MANY_STREAMS_FORMAT"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithValidatedFormat:validFormatSpecifiers:error:", v14, CFSTR("%@"), 0, v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = *MEMORY[0x1E0CB2D80];
      v19[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TVPlaybackErrorDomain"), 812, v16);

    }
  }
  else
  {

    v10 = v7;
  }
  v17 = *(_QWORD *)(a1 + 32);
  if (v17)
    (*(void (**)(uint64_t, uint64_t, void *))(v17 + 16))(v17, a2, v10);

}

void __57__VUIStoreMediaItem_iOS_prepareForLoadingWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Resetting managed object download state since download is missing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

void __77__VUIStoreMediaItem_iOS_mediaItemAllInitialLoadingComplete_totalTime_player___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "SSRentalInformationRequest response is missing playbackStartDate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

void __94__VUIStoreMediaItem_iOS__configureForPlaybackFromExistingDownload_downloadManager_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "Download token is invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

void __94__VUIStoreMediaItem_iOS__configureForPlaybackFromExistingDownload_downloadManager_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "downloadDestinationURL is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

void __94__VUIStoreMediaItem_iOS__configureForPlaybackFromExistingDownload_downloadManager_completion___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "playbackURL is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

void __70__VUIStoreMediaItem_iOS__configureForStreamingPlaybackWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_0_10(&dword_1D96EE000, v0, v1, "storeItemDict is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_14();
}

@end
