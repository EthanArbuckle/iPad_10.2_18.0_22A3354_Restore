@implementation PHAWallpaperGalleryDemoHelper

- (PHAWallpaperGalleryDemoHelper)initWithPhotoLibrary:(id)a3 loggingConnection:(id)a4
{
  id v7;
  id v8;
  PHAWallpaperGalleryDemoHelper *v9;
  PHAWallpaperGalleryDemoHelper *v10;
  uint64_t v11;
  NSDictionary *config;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PHAWallpaperGalleryDemoHelper;
  v9 = -[PHAWallpaperGalleryDemoHelper init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photoLibrary, a3);
    objc_storeStrong((id *)&v10->_loggingConnection, a4);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", CFSTR("/var/mobile/Media/PhotoData/Configuration/WallpaperDemo/DemoConfig.plist"));
    v11 = objc_claimAutoreleasedReturnValue();
    config = v10->_config;
    v10->_config = (NSDictionary *)v11;

  }
  return v10;
}

- (id)demoDescriptors
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PHAWallpaperGalleryDemoHelper _demoSuggestedPhotoDescriptors](self, "_demoSuggestedPhotoDescriptors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  -[PHAWallpaperGalleryDemoHelper _demoShuffleDescriptors](self, "_demoShuffleDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  return v3;
}

- (id)_demoSuggestedPhotoDescriptors
{
  PHAWallpaperGalleryDemoHelper *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  PHAWallpaperGalleryDemoHelper *v26;
  id v27;
  void *v28;
  _QWORD v29[2];

  v2 = self;
  v29[1] = *MEMORY[0x1E0C80C00];
  -[NSDictionary objectForKeyedSubscript:](self->_config, "objectForKeyedSubscript:", CFSTR("SuggestedPhoto"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v24 = v3;
    -[PHAWallpaperGalleryDemoHelper _descriptorConfigsFromDictionaries:](v2, "_descriptorConfigsFromDictionaries:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      v5 = 0;
      v25 = v4;
      v26 = v2;
      do
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "assetUUID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHAWallpaperGalleryDemoHelper _fetchWallpaperSuggestionWithKeyAssetUUID:](v2, "_fetchWallpaperSuggestionWithKeyAssetUUID:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = objc_alloc(MEMORY[0x1E0D75220]);
          objc_msgSend(v8, "uuid");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)objc_msgSend(v9, "initWithAssetUUID:suggestionUUID:suggestionSubtype:", v7, v10, objc_msgSend(v8, "subtype"));

          if ((objc_msgSend(v8, "availableFeatures") & 1) != 0)
            v12 = 3;
          else
            v12 = 1;
          v13 = objc_alloc(MEMORY[0x1E0D751F8]);
          v29[0] = v11;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(v13, "initWithDescriptorType:media:", v12, v14);

          v16 = (void *)MEMORY[0x1E0D751F8];
          objc_msgSend(v8, "uuid");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v17;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "descriptorIdentifierForDescriptorType:uuids:", v12, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d-%@"), v5, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setIdentifier:", v20);

          objc_msgSend(v6, "styleCategory");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            objc_msgSend(v6, "styleCategory");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setStyleCategory:", v22);

          }
          objc_msgSend(v27, "addObject:", v15);

          v4 = v25;
          v2 = v26;
        }

        ++v5;
      }
      while (objc_msgSend(v4, "count") > v5);
    }

    v3 = v24;
  }
  else
  {
    v27 = (id)MEMORY[0x1E0C9AA60];
  }

  return v27;
}

- (id)_demoShuffleDescriptors
{
  void *v3;
  id v4;
  void *v5;
  unint64_t v6;
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
  void *v18;
  PHAWallpaperShuffleDescriptorGenerator *v19;

  -[NSDictionary objectForKeyedSubscript:](self->_config, "objectForKeyedSubscript:", CFSTR("Shuffle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v19 = -[PHAWallpaperShuffleDescriptorGenerator initWithPhotoLibrary:loggingConnection:]([PHAWallpaperShuffleDescriptorGenerator alloc], "initWithPhotoLibrary:loggingConnection:", self->_photoLibrary, self->_loggingConnection);
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v18 = v3;
    -[PHAWallpaperGalleryDemoHelper _descriptorConfigsFromDictionaries:](self, "_descriptorConfigsFromDictionaries:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v6 = 0;
      do
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "assetUUID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHAWallpaperGalleryDemoHelper _fetchWallpaperSuggestionWithKeyAssetUUID:](self, "_fetchWallpaperSuggestionWithKeyAssetUUID:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          -[PHAWallpaperShuffleDescriptorGenerator descriptorForSuggestion:](v19, "descriptorForSuggestion:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0D751F8], "descriptorTypeStringWithType:", 2);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "uuid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringWithFormat:", CFSTR("%@|%d|%@"), v12, v6, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setIdentifier:", v14);

          objc_msgSend(v7, "titleKey");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v7, "titleKey");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setDisplayNameLocalizationKey:", v16);

          }
          objc_msgSend(v4, "addObject:", v10);

        }
        ++v6;
      }
      while (objc_msgSend(v5, "count") > v6);
    }

    v3 = v18;
  }
  else
  {
    v4 = (id)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

- (id)_descriptorConfigsFromDictionaries:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  PHAWallpaperDemoDescriptorConfig *v12;
  NSObject *loggingConnection;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        v12 = -[PHAWallpaperDemoDescriptorConfig initWithDictionary:]([PHAWallpaperDemoDescriptorConfig alloc], "initWithDictionary:", v11);
        if (v12)
        {
          objc_msgSend(v5, "addObject:", v12);
        }
        else
        {
          loggingConnection = self->_loggingConnection;
          if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v20 = v11;
            _os_log_debug_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_DEBUG, "[PHAWallpaperGalleryDemoHelper] failed to create descriptor config from: %@", buf, 0xCu);
          }
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_fetchWallpaperSuggestionWithKeyAssetUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *loggingConnection;
  int v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CD1390];
  v18[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchAssetsWithUUIDs:options:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD17D0], "predicateForAllTopWallpaperSuggestions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPredicate:", v11);

    objc_msgSend(MEMORY[0x1E0CD17D0], "fetchAssetCollectionsContainingAsset:withType:options:", v9, 8, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEBUG))
    {
      v16 = 138412290;
      v17 = v4;
      _os_log_debug_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_DEBUG, "[PHAWallpaperGalleryDemoHelper] cannot find asset: %@", (uint8_t *)&v16, 0xCu);
    }
    v13 = 0;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

+ (id)_sampleDemoConifg
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("SuggestedPhoto");
  objc_msgSend(a1, "_suggestedPhotoConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("Shuffle");
  v8[0] = v3;
  objc_msgSend(a1, "_shuffleConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_suggestedPhotoConfig
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[6];

  v19[5] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("AssetUUID");
  v17[1] = CFSTR("StyleCategory");
  v18[0] = CFSTR("D85F0B18-CCF8-4D5D-AF4C-67572C1A21C5");
  v18[1] = CFSTR("BlackWhite");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v2;
  v15[0] = CFSTR("AssetUUID");
  v15[1] = CFSTR("StyleCategory");
  v16[0] = CFSTR("A8E7E0F1-9836-403B-A66B-47825D57055A");
  v16[1] = CFSTR("TrueColors");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v3;
  v13[0] = CFSTR("AssetUUID");
  v13[1] = CFSTR("StyleCategory");
  v14[0] = CFSTR("ABB4B8CB-5385-4527-B975-6B2332F16D4E");
  v14[1] = CFSTR("BlackWhite");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v4;
  v11[0] = CFSTR("AssetUUID");
  v11[1] = CFSTR("StyleCategory");
  v12[0] = CFSTR("A198882A-8571-4A6E-818D-FC692555C6EF");
  v12[1] = CFSTR("TrueColors");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v5;
  v9[0] = CFSTR("AssetUUID");
  v9[1] = CFSTR("StyleCategory");
  v10[0] = CFSTR("FF09A649-221A-45AD-9BB0-D9976CF0C0BC");
  v10[1] = CFSTR("TrueColors");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_shuffleConfig
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("AssetUUID");
  v14[1] = CFSTR("TitleKey");
  v15[0] = CFSTR("929100F2-8AA2-413B-AB24-423FAB866205");
  v15[1] = CFSTR("PHOTOS_WALLPAPER_DESCRIPTOR_TITLE_SMART_ALBUM");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v2;
  v12[0] = CFSTR("AssetUUID");
  v12[1] = CFSTR("TitleKey");
  v13[0] = CFSTR("1F4DE92C-1EF8-48C3-A95B-C4ED8B948E45");
  v13[1] = CFSTR("PHOTOS_WALLPAPER_DESCRIPTOR_TITLE_SMART_ALBUM_LANDSCAPE");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v3;
  v10[0] = CFSTR("AssetUUID");
  v10[1] = CFSTR("TitleKey");
  v11[0] = CFSTR("E738E8EA-BE67-4778-AF34-1ECAE5DCBD9F");
  v11[1] = CFSTR("PHOTOS_WALLPAPER_DESCRIPTOR_TITLE_SMART_ALBUM_PETS");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v4;
  v8[0] = CFSTR("AssetUUID");
  v8[1] = CFSTR("TitleKey");
  v9[0] = CFSTR("0BA9BF90-A38D-47C0-AE23-BBAD20105270");
  v9[1] = CFSTR("PHOTOS_WALLPAPER_DESCRIPTOR_TITLE_SMART_ALBUM_PEOPLE");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
