@implementation VSMobileAssetsManager

- (id)voiceDataWithBundleIdentifier:(id)a3 attributes:(id)a4 voicePathCallback:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  id v9;
  VSVoiceAsset *v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  VSVoiceAsset *v21;
  uint64_t v22;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void (**)(_QWORD))a5;
  v9 = a3;
  v10 = objc_alloc_init(VSVoiceAsset);
  -[VSAssetBase setStorage:](v10, "setStorage:", 2);
  -[VSAssetBase setBundleIdentifier:](v10, "setBundleIdentifier:", v9);
  v11 = +[VSMobileAssetsManager typeFromBundleIdentifier:](VSMobileAssetsManager, "typeFromBundleIdentifier:", v9);

  -[VSVoiceAsset setType:](v10, "setType:", v11);
  if (v7)
  {
    -[VSVoiceAsset amendNameVersionAndSizeWithMobileAssetAttributes:](v10, "amendNameVersionAndSizeWithMobileAssetAttributes:", v7);
    if (v11 == 1)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Language"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Language"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSVoiceAsset setLanguages:](v10, "setLanguages:", v14);

LABEL_16:
        goto LABEL_17;
      }
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Gender"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSVoiceAsset setGender:](v10, "setGender:", +[VSVoiceAsset genderFromString:](VSVoiceAsset, "genderFromString:", v15));

    +[VSVoiceAsset languagesFromMobileAssetAttributes:](VSVoiceAsset, "languagesFromMobileAssetAttributes:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSVoiceAsset setLanguages:](v10, "setLanguages:", v16);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Footprint"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSVoiceAsset setFootprint:](v10, "setFootprint:", +[VSVoiceAsset footprintFromString:](VSVoiceAsset, "footprintFromString:", v17));

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Type"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Type"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSVoiceAsset setType:](v10, "setType:", +[VSVoiceAsset typeFromString:](VSVoiceAsset, "typeFromString:", v19));

    }
    if (-[VSVoiceAsset type](v10, "type") == 4)
    {
      if (v8)
      {
        v8[2](v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          v20 = +[VSNeuralTTSUtils isNeuralVoiceReady:](VSNeuralTTSUtils, "isNeuralVoiceReady:", v13);
        else
          v20 = 0;
        -[VSVoiceAsset setIsVoiceReadyToUse:](v10, "setIsVoiceReadyToUse:", v20);
        goto LABEL_16;
      }
      v21 = v10;
      v22 = 0;
    }
    else
    {
      v21 = v10;
      v22 = 1;
    }
    -[VSVoiceAsset setIsVoiceReadyToUse:](v21, "setIsVoiceReadyToUse:", v22);
  }
LABEL_17:

  return v10;
}

+ (int64_t)typeFromBundleIdentifier:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileAsset.VoiceServicesVocalizerVoice")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileAsset.VoiceServices.CustomVoice")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileAsset.VoiceServices.GryphonVoice")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)installedTrialVoicesForType:(int64_t)a3 voiceName:(id)a4 language:(id)a5 footprint:(int64_t)a6
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  VSVoiceAssetSelection *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[VSTrialService definedVoicesWithLanguage:name:type:footprint:](self->_trialService, "definedVoicesWithLanguage:name:type:footprint:", a5, a4, a3, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "isLocal", (_QWORD)v16))
        {
          v14 = -[VSVoiceAssetSelection initWithTrialVoice:]([VSVoiceAssetSelection alloc], "initWithTrialVoice:", v13);
          objc_msgSend(v7, "addObject:", v14);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)inactiveVoiceAssets
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  void *v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSMobileAssetsManager activeVoiceAssets](self, "activeVoiceAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v56 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        objc_msgSend(v10, "asset");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "asset");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "assetId");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
            objc_msgSend(v3, "addObject:", v13);
        }
        else
        {
          objc_msgSend(v10, "trialVoice");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
            continue;
          objc_msgSend(v10, "trialVoice");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "factorName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v15);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
    }
    while (v7);
  }
  v47 = v4;
  v49 = v3;
  -[VSMobileAssetsManager installedAssetsForType:voicename:language:gender:footprint:](self, "installedAssetsForType:voicename:language:gender:footprint:", 0, 0, 0, 0, 0, v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v48 = (id)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v52;
    v50 = v17;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v52 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
        if (objc_msgSend(v22, "isInstalled"))
        {
          objc_msgSend(v22, "voiceData");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "footprint");

          if (v24 != 1)
          {
            objc_msgSend(v22, "asset");
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (v25)
            {
              objc_msgSend(v22, "asset");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "assetId");
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              if (v27 && objc_msgSend(v49, "containsObject:", v27))
              {
                VSGetLogDefault();
                v28 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v22, "asset");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "attributes");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v60 = v30;
                  _os_log_impl(&dword_1DE15E000, v28, OS_LOG_TYPE_DEFAULT, "#MobileAsset current in-use asset, %@", buf, 0xCu);

                  v17 = v50;
                }
                goto LABEL_36;
              }
              objc_msgSend(v22, "asset");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "assetType");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v32, "isEqualToString:", CFSTR("com.apple.MobileAsset.VoiceServicesVocalizerVoice")))
              {

LABEL_34:
                VSGetLogDefault();
                v28 = objc_claimAutoreleasedReturnValue();
                v17 = v50;
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v22, "asset");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v43, "attributes");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v60 = v44;
                  _os_log_impl(&dword_1DE15E000, v28, OS_LOG_TYPE_DEFAULT, "#MobileAsset ignore VoiceOver asset, %@", buf, 0xCu);

                }
LABEL_36:

                continue;
              }
              objc_msgSend(v22, "asset");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "assetType");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = objc_msgSend(v41, "isEqualToString:", CFSTR("com.apple.MobileAsset.VoiceServices.CustomVoice"));

              if (v42)
                goto LABEL_34;

              v17 = v50;
LABEL_38:
              objc_msgSend(v48, "addObject:", v22);
              continue;
            }
            objc_msgSend(v22, "trialVoice");
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v33)
              goto LABEL_38;
            objc_msgSend(v22, "trialVoice");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "factorName");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v47, "containsObject:", v35);

            if (!v36)
              goto LABEL_38;
            VSGetLogDefault();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v22, "trialVoice");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "factorName");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v60 = v39;
              _os_log_impl(&dword_1DE15E000, v37, OS_LOG_TYPE_DEFAULT, "#Trial current in-use asset, %@", buf, 0xCu);

            }
          }
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
    }
    while (v19);
  }

  return v48;
}

void __84__VSMobileAssetsManager_installedAssetsForType_voicename_language_gender_footprint___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  VSVoiceAssetSelection *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_getVoiceAssetsForType:voiceName:language:gender:footprint:returnTypes:", a3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "wasLocal"))
        {
          v12 = objc_alloc_init(VSVoiceAssetSelection);
          -[VSVoiceAssetSelection setAsset:](v12, "setAsset:", v11);
          objc_msgSend(*(id *)(a1 + 32), "voiceDataFromAsset:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[VSVoiceAssetSelection setVoiceData:](v12, "setVoiceData:", v13);

          objc_msgSend(v5, "addObject:", v12);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (id)voiceDataFromAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "assetType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __44__VSMobileAssetsManager_voiceDataFromAsset___block_invoke;
    v11[3] = &unk_1EA8AF510;
    v8 = v5;
    v12 = v8;
    -[VSMobileAssetsManager voiceDataWithBundleIdentifier:attributes:voicePathCallback:](self, "voiceDataWithBundleIdentifier:attributes:voicePathCallback:", v6, v7, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setIsInstalled:", objc_msgSend(v8, "wasLocal"));
    objc_msgSend(v9, "setIsPurgeable:", objc_msgSend(v8, "wasPurgeable"));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_getVoiceAssetsForType:(int64_t)a3 voiceName:(id)a4 language:(id)a5 gender:(int64_t)a6 footprint:(int64_t)a7 returnTypes:(int64_t)a8
{
  void *v9;
  void *v10;

  +[VSMobileAssetsManager queryForLanguage:forType:voiceName:gender:footprint:returnTypes:](VSMobileAssetsManager, "queryForLanguage:forType:voiceName:gender:footprint:returnTypes:", a5, a3, a4, a6, a7, a8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSMobileAssetsManager _getResults:](self, "_getResults:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_getResults:(id)a3
{
  id v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  intptr_t (*v18)(uint64_t, uint64_t);
  void *v19;
  NSObject *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v4 = dispatch_semaphore_create(0);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __37__VSMobileAssetsManager__getResults___block_invoke;
  v19 = &unk_1EA8AF418;
  v21 = &v22;
  v5 = v4;
  v20 = v5;
  objc_msgSend(v3, "queryMetaData:", &v16);
  v6 = dispatch_time(0, 1000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    VSGetLogDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "assetType", v16, v17, v18, v19);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v8;
      _os_log_impl(&dword_1DE15E000, v7, OS_LOG_TYPE_INFO, "#MobileAsset ERROR query '%@', timeout after 1 sec", buf, 0xCu);

    }
    v9 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    if (v23[3])
    {
      VSGetLogDefault();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v3, "assetType", v16, v17, v18, v19);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        MEMORY[0x1DF0E8D6C](v23[3]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v27 = v11;
        v28 = 2112;
        v29 = v12;
        _os_log_impl(&dword_1DE15E000, v10, OS_LOG_TYPE_INFO, "#MobileAsset WARNING query '%@', error: %@", buf, 0x16u);

      }
    }
    objc_msgSend(v3, "results", v16, v17, v18, v19);
    v13 = objc_claimAutoreleasedReturnValue();
    v7 = v13;
    v14 = (void *)MEMORY[0x1E0C9AA60];
    if (v13)
      v14 = (void *)v13;
    v9 = v14;
  }

  _Block_object_dispose(&v22, 8);
  return v9;
}

+ (id)queryForLanguage:(id)a3 forType:(int64_t)a4 voiceName:(id)a5 gender:(int64_t)a6 footprint:(int64_t)a7 returnTypes:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t *v25;

  v14 = a3;
  v15 = a5;
  if (queryForLanguage_forType_voiceName_gender_footprint_returnTypes__onceToken != -1)
    dispatch_once(&queryForLanguage_forType_voiceName_gender_footprint_returnTypes__onceToken, &__block_literal_global_332);
  v16 = objc_alloc(MEMORY[0x1E0D4E050]);
  objc_msgSend(a1, "bundleIdentifierForVoiceType:", a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithType:", v17);

  objc_msgSend(v18, "returnTypes:", a8);
  if (v14)
  {
    if ((unint64_t)(a4 - 3) > 1)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addKeyValueArray:with:", CFSTR("Languages"), v21);
      v22 = 0;
LABEL_9:

      if (!a7)
        goto LABEL_11;
      goto LABEL_10;
    }
    objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", v14, v19, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addKeyValueArray:with:", CFSTR("LanguagesCompatibility"), v20);

LABEL_7:
    +[VSVoiceAsset typeStringFromType:](VSVoiceAsset, "typeStringFromType:", a4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addKeyValuePair:with:", CFSTR("Type"), v21);
    v22 = 1;
    goto LABEL_9;
  }
  if ((unint64_t)(a4 - 3) <= 1)
    goto LABEL_7;
  v22 = 0;
  if (a7)
  {
LABEL_10:
    +[VSVoiceAsset footprintStringFromFootprint:](VSVoiceAsset, "footprintStringFromFootprint:", a7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addKeyValuePair:with:", CFSTR("Footprint"), v23);

  }
LABEL_11:
  if (a6)
  {
    +[VSVoiceAsset genderStringFromGender:](VSVoiceAsset, "genderStringFromGender:", a6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addKeyValuePair:with:", CFSTR("Gender"), v24);

  }
  if (v15)
    objc_msgSend(v18, "addKeyValuePair:with:", CFSTR("Name"), v15);
  v25 = &queryForLanguage_forType_voiceName_gender_footprint_returnTypes__customVersions;
  if (v22)
    v25 = &queryForLanguage_forType_voiceName_gender_footprint_returnTypes__gryphonVersions;
  objc_msgSend(v18, "addKeyValueArray:with:", *MEMORY[0x1E0D4DEE0], *v25);

  return v18;
}

+ (id)bundleIdentifierForVoiceType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return 0;
  else
    return off_1EA8AF550[a3 - 1];
}

- (id)activeVoiceAssets
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSPreferencesInterface defaultInstance](VSPreferencesInterface, "defaultInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscribedVoicesForClientID:accessoryID:", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
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
        -[VSMobileAssetsManager voiceAssetsForSubscription:](self, "voiceAssetsForSubscription:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v3;
}

- (id)installedAssetsForType:(int64_t)a3 voicename:(id)a4 language:(id)a5 gender:(int64_t)a6 footprint:(int64_t)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  void (*v21)(void);
  void *v22;
  int64_t v23;
  _QWORD v25[5];
  id v26;
  id v27;
  int64_t v28;
  int64_t v29;

  v12 = a4;
  v13 = a5;
  v14 = (void *)MEMORY[0x1E0C99DE8];
  -[VSMobileAssetsManager installedTrialVoicesForType:voiceName:language:footprint:](self, "installedTrialVoicesForType:voiceName:language:footprint:", a3, v12, v13, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "arrayWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __84__VSMobileAssetsManager_installedAssetsForType_voicename_language_gender_footprint___block_invoke;
  v25[3] = &unk_1EA8AF220;
  v25[4] = self;
  v26 = v12;
  v27 = v13;
  v28 = a6;
  v29 = a7;
  v17 = v13;
  v18 = v12;
  v19 = MEMORY[0x1DF0E94A4](v25);
  v20 = (void (**)(_QWORD, _QWORD, _QWORD))v19;
  v21 = *(void (**)(void))(v19 + 16);
  v22 = v16;
  if (a3)
  {
    v23 = a3;
  }
  else
  {
    v21();
    ((void (**)(_QWORD, void *, uint64_t))v20)[2](v20, v16, 3);
    ((void (**)(_QWORD, void *, uint64_t))v20)[2](v20, v16, 1);
    v21 = (void (*)(void))v20[2];
    v19 = (uint64_t)v20;
    v22 = v16;
    v23 = 2;
  }
  ((void (*)(uint64_t, void *, int64_t))v21)(v19, v22, v23);

  return v16;
}

intptr_t __37__VSMobileAssetsManager__getResults___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_73);
  return (id)sharedManager___sharedManager;
}

- (BOOL)migrateAssetsWithProgress:(id)a3
{
  void (**v4)(id, _BYTE *, float);
  BOOL v5;
  char v7;

  v4 = (void (**)(id, _BYTE *, float))a3;
  v7 = 0;
  v4[2](v4, &v7, 0.0);
  if (v7
    || (-[VSMobileAssetsManager migrateAssetIfNeededWithAssetType:](self, "migrateAssetIfNeededWithAssetType:", CFSTR("com.apple.MobileAsset.VoiceServices.GryphonVoice")), v4[2](v4, &v7, 0.33), v7)|| (-[VSMobileAssetsManager migrateAssetIfNeededWithAssetType:](self, "migrateAssetIfNeededWithAssetType:", CFSTR("com.apple.MobileAsset.VoiceServices.CustomVoice")), v4[2](v4, &v7, 0.66), v7))
  {
    v5 = 1;
  }
  else
  {
    -[VSMobileAssetsManager migrateAssetIfNeededWithAssetType:](self, "migrateAssetIfNeededWithAssetType:", CFSTR("com.apple.MobileAsset.VoiceServicesVocalizerVoice"));
    v4[2](v4, &v7, 1.0);
    v5 = v7 != 0;
  }

  return v5;
}

- (void)migrateAssetIfNeededWithAssetType:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  VSMobileAssetsManager *v9;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4E050]), "initWithType:", v4);
  objc_msgSend(v5, "returnTypes:", 1);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__VSMobileAssetsManager_migrateAssetIfNeededWithAssetType___block_invoke;
  v7[3] = &unk_1EA8AF0F0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "queryMetaData:", v7);

}

- (VSMobileAssetsManager)init
{
  VSMobileAssetsManager *v2;
  uint64_t v3;
  VSTrialService *trialService;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *assetQueryQueue;
  NSCache *v8;
  NSCache *cachedMAVoiceSelections;
  NSCache *v10;
  NSCache *cachedMAVoiceResources;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VSMobileAssetsManager;
  v2 = -[VSMobileAssetsManager init](&v13, sel_init);
  if (v2)
  {
    +[VSTrialService sharedService](VSTrialService, "sharedService");
    v3 = objc_claimAutoreleasedReturnValue();
    trialService = v2->_trialService;
    v2->_trialService = (VSTrialService *)v3;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.voiced.assetQueryQueue", v5);
    assetQueryQueue = v2->_assetQueryQueue;
    v2->_assetQueryQueue = (OS_dispatch_queue *)v6;

    v8 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    cachedMAVoiceSelections = v2->_cachedMAVoiceSelections;
    v2->_cachedMAVoiceSelections = v8;

    -[NSCache setCountLimit:](v2->_cachedMAVoiceSelections, "setCountLimit:", 10);
    v10 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    cachedMAVoiceResources = v2->_cachedMAVoiceResources;
    v2->_cachedMAVoiceResources = v10;

    -[NSCache setCountLimit:](v2->_cachedMAVoiceResources, "setCountLimit:", 10);
  }
  return v2;
}

- (id)_mobileAssetVoiceForLanguage:(id)a3 name:(id)a4 type:(int64_t)a5 gender:(int64_t)a6 footprint:(int64_t)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  int v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  VSVoiceAssetSelection *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v56;
  id obj;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  VSMobileAssetsManager *v63;
  int64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  void *v75;
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  void *v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = a7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v13;
  v61 = v12;
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@_%@_%@_%@_%@"), v12, v13, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v63 = self;
  -[VSMobileAssetsManager cachedMAVoiceSelections](self, "cachedMAVoiceSelections");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v18;
  objc_msgSend(v19, "objectForKey:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v20, "asset");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = (void *)v21;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "voicePath");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "fileExistsAtPath:", v24);

      if ((v25 & 1) == 0)
      {
        VSGetLogDefault();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v77 = v18;
          _os_log_debug_impl(&dword_1DE15E000, v31, OS_LOG_TYPE_DEBUG, "#MobileAsset Ignore cached voice selection for voice query key %@ since it is not installed anymore.", buf, 0xCu);
        }

        -[VSMobileAssetsManager cachedMAVoiceSelections](v63, "cachedMAVoiceSelections");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "removeObjectForKey:", v18);
        goto LABEL_13;
      }
    }
    objc_msgSend(v20, "voiceData");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "type") == 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "thermalState") > 2)
      {
        +[VSSpeechInternalSettings standardInstance](VSSpeechInternalSettings, "standardInstance");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "ignorePowerAndThermalState");

        if ((v29 & 1) == 0)
        {
          VSGetLogDefault();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DE15E000, v30, OS_LOG_TYPE_DEFAULT, "#MobileAsset Ignore neural voice due to thermal critical condition.", buf, 2u);
          }

LABEL_13:
          goto LABEL_14;
        }
LABEL_25:
        VSGetLogDefault();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v20, "descriptiveKey");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v77 = v38;
          v78 = 2112;
          v79 = v18;
          _os_log_impl(&dword_1DE15E000, v37, OS_LOG_TYPE_DEFAULT, "#MobileAsset Found cached voice selection %@ for voice query key %@", buf, 0x16u);

        }
        v39 = v20;
        goto LABEL_57;
      }

    }
    goto LABEL_25;
  }
LABEL_14:
  +[VSSpeechInternalSettings standardInstance](VSSpeechInternalSettings, "standardInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "disableDeviceNeuralTTS");

  if (!v33)
  {
    if (!a5)
    {
      v35 = &unk_1EA8BE4A0;
      goto LABEL_29;
    }
    goto LABEL_21;
  }
  VSGetLogDefault();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DE15E000, v34, OS_LOG_TYPE_DEFAULT, "#MobileAsset Ignore neural voices since device neural TTS is disabled.", buf, 2u);
  }

  if (!a5)
  {
    v35 = &unk_1EA8BE488;
    goto LABEL_29;
  }
  if (a5 != 4)
  {
LABEL_21:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a5);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v36;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_29;
  }
  v35 = &unk_1EA8BE4B8;
LABEL_29:
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  obj = v35;
  v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
  if (v59)
  {
    v58 = *(_QWORD *)v70;
LABEL_31:
    v40 = 0;
    while (1)
    {
      if (*(_QWORD *)v70 != v58)
        objc_enumerationMutation(obj);
      v62 = v40;
      -[VSMobileAssetsManager _getVoiceAssetsForType:voiceName:language:gender:footprint:returnTypes:](v63, "_getVoiceAssetsForType:voiceName:language:gender:footprint:returnTypes:", objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * v40), "longValue"), v60, v61, a6, v64, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v43 = v41;
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
      if (v44)
      {
        v45 = v44;
        v46 = *(_QWORD *)v66;
        do
        {
          for (i = 0; i != v45; ++i)
          {
            if (*(_QWORD *)v66 != v46)
              objc_enumerationMutation(v43);
            v48 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
            if (objc_msgSend(v48, "wasLocal"))
            {
              v49 = objc_alloc_init(VSVoiceAssetSelection);
              -[VSMobileAssetsManager voiceDataFromAsset:](v63, "voiceDataFromAsset:", v48);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              -[VSVoiceAssetSelection setAsset:](v49, "setAsset:", v48);
              -[VSVoiceAssetSelection setVoiceData:](v49, "setVoiceData:", v50);
              if ((!a6 || objc_msgSend(v50, "gender") == a6) && (!v64 || objc_msgSend(v50, "footprint") == v64))
                objc_msgSend(v42, "addObject:", v49);

            }
          }
          v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
        }
        while (v45);
      }

      +[VSMobileAssetsManager pickCorrectAssetFromLocalAssets:](VSMobileAssetsManager, "pickCorrectAssetFromLocalAssets:", v42);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      if (v51)
        break;
      v40 = v62 + 1;
      if (v62 + 1 == v59)
      {
        v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
        if (v59)
          goto LABEL_31;
        goto LABEL_51;
      }
    }
  }
  else
  {
LABEL_51:
    v51 = 0;
  }

  VSGetLogDefault();
  v52 = objc_claimAutoreleasedReturnValue();
  v18 = v56;
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v51, "voiceData");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v77 = v53;
    v78 = 2114;
    v79 = v56;
    _os_log_impl(&dword_1DE15E000, v52, OS_LOG_TYPE_DEFAULT, "#MobileAsset Selected %{public}@ and will cache it for %{public}@", buf, 0x16u);

  }
  if (v51)
  {
    -[VSMobileAssetsManager cachedMAVoiceSelections](v63, "cachedMAVoiceSelections");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setObject:forKey:", v51, v56);

  }
  v39 = v51;

LABEL_57:
  return v39;
}

- (id)preinstallAssetsMetadata
{
  if (preinstallAssetsMetadata_onceToken != -1)
    dispatch_once(&preinstallAssetsMetadata_onceToken, &__block_literal_global_319);
  return (id)preinstallAssetsMetadata___preinstallAssetsMetadata;
}

- (id)voiceAssetFromPreinstallMetadata:(id)a3
{
  id v3;
  VSVoiceAssetSelection *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  v4 = objc_alloc_init(VSVoiceAssetSelection);
  +[VSMobileAssetsManager preinstallAssetsDirectory](VSMobileAssetsManager, "preinstallAssetsDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("_RelativePath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("AssetData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSVoiceAssetSelection setBuiltInVoicePath:](v4, "setBuiltInVoicePath:", v8);

  v9 = -[VSVoiceAsset initFromMobileAssetAttributes:]([VSVoiceAsset alloc], "initFromMobileAssetAttributes:", v3);
  -[VSVoiceAssetSelection setVoiceData:](v4, "setVoiceData:", v9);

  -[VSVoiceAssetSelection voiceData](v4, "voiceData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStorage:", 1);

  -[VSVoiceAssetSelection voiceData](v4, "voiceData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIsInstalled:", 1);

  -[VSVoiceAssetSelection voiceData](v4, "voiceData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIsBuiltInVoice:", 1);

  -[VSVoiceAssetSelection voiceData](v4, "voiceData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setIsVoiceReadyToUse:", 1);

  return v4;
}

- (id)preinstalledVoicesForLanguage:(id)a3 gender:(int64_t)a4 name:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  int64_t v22;
  void *v23;
  void *v25;
  VSMobileAssetsManager *v26;
  id v27;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v26 = self;
  -[VSMobileAssetsManager preinstallAssetsMetadata](self, "preinstallAssetsMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v25 = v9;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Assets"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        +[VSVoiceAsset languagesFromMobileAssetAttributes:](VSVoiceAsset, "languagesFromMobileAssetAttributes:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (!v7
          || (objc_msgSend(v15, "firstObject"),
              v17 = (void *)objc_claimAutoreleasedReturnValue(),
              v18 = objc_msgSend(v7, "isEqualToString:", v17),
              v17,
              v18))
        {
          if (!v8
            || (objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Name")),
                v19 = (void *)objc_claimAutoreleasedReturnValue(),
                v20 = objc_msgSend(v19, "isEqualToString:", v8),
                v19,
                v20))
          {
            if (!a4
              || (objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Gender")),
                  v21 = (void *)objc_claimAutoreleasedReturnValue(),
                  v22 = +[VSVoiceAsset genderFromString:](VSVoiceAsset, "genderFromString:", v21),
                  v21,
                  v22 == a4))
            {
              -[VSMobileAssetsManager voiceAssetFromPreinstallMetadata:](v26, "voiceAssetFromPreinstallMetadata:", v14);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "addObject:", v23);

            }
          }
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v11);
  }

  return v27;
}

- (id)selectPreinstalledVoiceForLanguage:(id)a3 gender:(int64_t)a4 name:(id)a5
{
  void *v5;
  void *v6;

  -[VSMobileAssetsManager preinstalledVoicesForLanguage:gender:name:](self, "preinstalledVoicesForLanguage:gender:name:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)builtInVoices
{
  void *v3;
  CFDictionaryRef v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = VSVocalizerCopyVoiceEngineFormatVersions();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[__CFDictionary allKeys](v4, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[VSMobileAssetsManager _builtInVoiceForLanguage:](self, "_builtInVoiceForLanguage:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v3, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v3;
}

- (id)_installedVoiceResourceAssetForLanguage:(id)a3
{
  id v4;
  VSVoiceResourceAsset *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  VSMobileAssetsManager *v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  id v30;
  VSVoiceResourceAsset *v32;
  id v33;
  void *v34;
  id obj;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _QWORD v51[4];

  v51[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(VSVoiceResourceAsset);
  v51[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSVoiceResourceAsset setLanguages:](v5, "setLanguages:", v6);

  -[VSAssetBase setCompatibilityVersion:](v5, "setCompatibilityVersion:", &unk_1EA8BE680);
  +[VSMobileAssetsManager queryForVoiceResourceAsset:returnTypes:](VSMobileAssetsManager, "queryForVoiceResourceAsset:returnTypes:", v5, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSMobileAssetsManager _getResults:](self, "_getResults:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v34 = v7;
  }
  else
  {
    -[VSAssetBase setCompatibilityVersion:](v5, "setCompatibilityVersion:", 0);
    +[VSMobileAssetsManager queryForVoiceResourceAsset:returnTypes:](VSMobileAssetsManager, "queryForVoiceResourceAsset:returnTypes:", v5, 3);
    v9 = objc_claimAutoreleasedReturnValue();

    -[VSMobileAssetsManager _getResults:](self, "_getResults:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
    v34 = (void *)v9;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v42 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        if (objc_msgSend(v17, "wasLocal"))
          objc_msgSend(v11, "addObject:", v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v14);
  }

  objc_msgSend(v11, "sortUsingComparator:", &__block_literal_global_331);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v11;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
  if (v18)
  {
    v19 = v18;
    v20 = self;
    v32 = v5;
    v33 = v4;
    v21 = *(_QWORD *)v38;
    while (2)
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v38 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
        objc_msgSend(v23, "getLocalFileUrl");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "path");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 0;
        objc_msgSend(v26, "contentsOfDirectoryAtPath:error:", v25, &v36);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v36;

        if (v27 && objc_msgSend(v27, "count"))
        {
          v30 = v23;

          goto LABEL_26;
        }
        VSGetLogDefault();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v46 = v25;
          v47 = 2114;
          v48 = v28;
          _os_log_error_impl(&dword_1DE15E000, v29, OS_LOG_TYPE_ERROR, "Purging corrupted VoiceResource '%{public}@', error: %{public}@", buf, 0x16u);
        }

        -[VSMobileAssetsManager _purgeMobileAsset:](v20, "_purgeMobileAsset:", v23);
      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
      if (v19)
        continue;
      break;
    }
    v30 = 0;
LABEL_26:
    v5 = v32;
    v4 = v33;
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (id)_trialVoiceResourceWithLanguage:(id)a3
{
  void *v3;
  void *v4;

  -[VSTrialService selectVoiceResourceWithLanguage:](self->_trialService, "selectVoiceResourceWithLanguage:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[VSVoiceResourceAsset resourceFromTrial:](VSVoiceResourceAsset, "resourceFromTrial:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_mobileAssetVoiceResourceWithLanguage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  int v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[VSMobileAssetsManager cachedMAVoiceResources](self, "cachedMAVoiceResources");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "searchPathURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "path");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "contentsOfDirectoryAtPath:error:", v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v10, "count");
      VSGetLogDefault();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v11)
      {
        if (v13)
        {
          v21 = 138412546;
          v22 = v6;
          v23 = 2114;
          v24 = v4;
          _os_log_impl(&dword_1DE15E000, v12, OS_LOG_TYPE_DEFAULT, "#MobileAsset Found cached voice resource %@ for %{public}@", (uint8_t *)&v21, 0x16u);
        }

        goto LABEL_15;
      }
      if (v13)
      {
        v21 = 138412290;
        v22 = v6;
        _os_log_impl(&dword_1DE15E000, v12, OS_LOG_TYPE_DEFAULT, "#MobileAsset Cached voice resource is corrupted %@", (uint8_t *)&v21, 0xCu);
      }

      -[VSMobileAssetsManager cachedMAVoiceResources](self, "cachedMAVoiceResources");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeObjectForKey:", v4);

    }
    -[VSMobileAssetsManager _installedVoiceResourceAssetForLanguage:](self, "_installedVoiceResourceAssetForLanguage:", v4);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      VSGetLogDefault();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v21 = 138543362;
        v22 = v4;
        _os_log_error_impl(&dword_1DE15E000, v19, OS_LOG_TYPE_ERROR, "#MobileAsset Unable to find asset for VoiceResources %{public}@", (uint8_t *)&v21, 0xCu);
      }

      v10 = 0;
      v14 = 0;
      goto LABEL_19;
    }
    v10 = (void *)v16;
    +[VSMobileAssetsManager voiceResourceFromAsset:](VSMobileAssetsManager, "voiceResourceFromAsset:", v16);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSMobileAssetsManager cachedMAVoiceResources](self, "cachedMAVoiceResources");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v6, v4);

    VSGetLogDefault();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138412546;
      v22 = v6;
      v23 = 2114;
      v24 = v4;
      _os_log_impl(&dword_1DE15E000, v18, OS_LOG_TYPE_DEFAULT, "#MobileAsset Found voice resource %@ for %{public}@", (uint8_t *)&v21, 0x16u);
    }

LABEL_15:
    v14 = v6;
LABEL_19:

    goto LABEL_20;
  }
  v14 = 0;
LABEL_20:

  return v14;
}

- (id)selectVoiceResourceAssetForLanguage:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[VSMobileAssetsManager _trialVoiceResourceWithLanguage:](self, "_trialVoiceResourceWithLanguage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[VSMobileAssetsManager _mobileAssetVoiceResourceWithLanguage:](self, "_mobileAssetVoiceResourceWithLanguage:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)definedVoicesForLanguage:(id)a3 voiceName:(id)a4 type:(int64_t)a5 footprint:(int64_t)a6
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  VSVoiceAsset *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[VSTrialService definedVoicesWithLanguage:name:type:footprint:](self->_trialService, "definedVoicesWithLanguage:name:type:footprint:", a3, a4, a5, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v14 = objc_alloc_init(VSVoiceAsset);
        objc_msgSend(v13, "language", (_QWORD)v21);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(v13, "language");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v16;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[VSVoiceAsset setLanguages:](v14, "setLanguages:", v17);

        }
        else
        {
          -[VSVoiceAsset setLanguages:](v14, "setLanguages:", MEMORY[0x1E0C9AA60]);
        }

        objc_msgSend(v13, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSVoiceAsset setName:](v14, "setName:", v18);

        -[VSVoiceAsset setType:](v14, "setType:", objc_msgSend(v13, "type"));
        -[VSVoiceAsset setFootprint:](v14, "setFootprint:", objc_msgSend(v13, "footprint"));
        if (objc_msgSend(v13, "assetSize"))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "assetSize"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[VSAssetBase setDownloadSize:](v14, "setDownloadSize:", v19);

        }
        else
        {
          -[VSAssetBase setDownloadSize:](v14, "setDownloadSize:", 0);
        }
        objc_msgSend(v7, "addObject:", v14);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)voiceAssetsForSubscription:(id)a3
{
  void *v4;
  id v5;
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
  char v20;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "voice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "languages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSMobileAssetsManager selectVoiceForLang:name:type:gender:footprint:](self, "selectVoiceForLang:name:type:gender:footprint:", v9, v10, objc_msgSend(v7, "type"), objc_msgSend(v7, "gender"), objc_msgSend(v7, "footprint"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v6, "addObject:", v11);
  if (!objc_msgSend(v7, "type") || objc_msgSend(v7, "type") == 4)
  {
    objc_msgSend(v7, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "languages");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSMobileAssetsManager installedAssetsForType:voicename:language:gender:footprint:](self, "installedAssetsForType:voicename:language:gender:footprint:", 4, v12, v14, objc_msgSend(v7, "gender"), objc_msgSend(v7, "footprint"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "sortedArrayUsingComparator:", &__block_literal_global_337);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v11, "key");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "key");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqualToString:", v19);

      if ((v20 & 1) == 0)
        objc_msgSend(v6, "addObject:", v17);
    }

  }
  return v6;
}

- (id)cleanUnusedAssets
{
  NSObject *v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  dispatch_semaphore_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  id v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[4];
  NSObject *v47;
  uint8_t *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[8];
  uint8_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  _BYTE v59[128];
  _BYTE v60[128];
  void *v61;
  _BYTE v62[128];
  uint64_t v63;
  _QWORD v64[3];

  v64[1] = *MEMORY[0x1E0C80C00];
  VSGetLogEvent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DE15E000, v3, OS_LOG_TYPE_DEFAULT, "Cleaning unused assets.", buf, 2u);
  }

  +[VSSpeechInternalSettings standardInstance](VSSpeechInternalSettings, "standardInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "disableAssetCleaning");

  if (v5)
  {
    VSGetLogEvent();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DE15E000, v6, OS_LOG_TYPE_DEFAULT, "#MobileAsset Cleaning voice assets is disabled in internal setting. Skip cleaning...", buf, 2u);
    }

    v7 = (void *)MEMORY[0x1E0CB35C8];
    v63 = *MEMORY[0x1E0CB2D50];
    v64[0] = CFSTR("Cleaning voice assets is disabled in internal setting.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, &v63, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("VSMobileAssetsManager"), -1, v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    return v9;
  }
  *(_QWORD *)buf = 0;
  v54 = buf;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy_;
  v57 = __Block_byref_object_dispose_;
  v58 = 0;
  -[VSMobileAssetsManager inactiveVoiceAssets](self, "inactiveVoiceAssets");
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
  if (!v10)
    goto LABEL_19;
  v11 = *(_QWORD *)v50;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v50 != v11)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
      objc_msgSend(v13, "asset");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v13, "asset");
        v15 = objc_claimAutoreleasedReturnValue();
        -[VSMobileAssetsManager _purgeMobileAsset:](self, "_purgeMobileAsset:", v15);
      }
      else
      {
        objc_msgSend(v13, "trialVoice");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
          continue;
        v17 = dispatch_semaphore_create(0);
        objc_msgSend(v13, "trialVoice");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v18;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __42__VSMobileAssetsManager_cleanUnusedAssets__block_invoke;
        v46[3] = &unk_1EA8AF1F8;
        v48 = buf;
        v15 = v17;
        v47 = v15;
        -[VSMobileAssetsManager _removeTrialVoices:completion:](self, "_removeTrialVoices:completion:", v19, v46);

        dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
      }

    }
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v62, 16);
  }
  while (v10);
LABEL_19:

  -[VSMobileAssetsManager activeVoiceAssets](self, "activeVoiceAssets");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v36 = v20;
  v22 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v42, v60, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v43 != v23)
          objc_enumerationMutation(v36);
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * j), "voiceData");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "languages");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObjectsFromArray:", v26);

      }
      v22 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v42, v60, 16);
    }
    while (v22);
  }

  -[VSMobileAssetsManager installedTrialVoiceResources](self, "installedTrialVoiceResources");
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v38, v59, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v39;
    do
    {
      for (k = 0; k != v28; ++k)
      {
        if (*(_QWORD *)v39 != v29)
          objc_enumerationMutation(v27);
        v31 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * k);
        objc_msgSend(v31, "languages");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "firstObject");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v21, "containsObject:", v33);

        if ((v34 & 1) == 0)
          -[VSMobileAssetsManager removeTrialVoiceResource:completion:](self, "removeTrialVoiceResource:completion:", v31, 0);
      }
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v38, v59, 16);
    }
    while (v28);
  }

  -[VSMobileAssetsManager cleanMobileAssetVoiceResourcesWithActiveLanguages:](self, "cleanMobileAssetVoiceResourcesWithActiveLanguages:", v21);
  -[VSMobileAssetsManager resetCache](self, "resetCache");
  v9 = *((id *)v54 + 5);

  _Block_object_dispose(buf, 8);
  return v9;
}

- (void)cleanOldMobileAssetVoiceResources
{
  id v3;

  +[VSSpeechSynthesizerPreference availableLanguages](VSSpeechSynthesizerPreference, "availableLanguages");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[VSMobileAssetsManager cleanMobileAssetVoiceResourcesWithActiveLanguages:](self, "cleanMobileAssetVoiceResourcesWithActiveLanguages:", v3);

}

- (void)cleanMobileAssetVoiceResourcesWithActiveLanguages:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _UNKNOWN **v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  VSMobileAssetsManager *v35;
  VSVoiceResourceAsset *v36;
  uint64_t v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36 = objc_alloc_init(VSVoiceResourceAsset);
  +[VSMobileAssetsManager queryForVoiceResourceAsset:returnTypes:](VSMobileAssetsManager, "queryForVoiceResourceAsset:returnTypes:");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = self;
  -[VSMobileAssetsManager _getResults:](self, "_getResults:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  v39 = v6;
  v42 = v7;
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v51;
    v37 = *MEMORY[0x1E0D4DF08];
    v38 = v4;
    v11 = &off_1EA8AE000;
    v40 = *MEMORY[0x1E0D4DEE8];
    v41 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v51 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        if (objc_msgSend(v13, "wasLocal") && objc_msgSend(v13, "state") != 5)
        {
          objc_msgSend(v13, "attributes");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11[131], "languagesFromMobileAssetAttributes:", v14);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "firstObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v4, "containsObject:", v15) & 1) != 0)
          {
            objc_msgSend(v14, "objectForKeyedSubscript:", v40);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v16, "integerValue");

            objc_msgSend(v6, "objectForKeyedSubscript:", v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            {
              objc_msgSend(v6, "objectForKeyedSubscript:", v15);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "attributes");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "objectForKeyedSubscript:", v40);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v20, "integerValue");

              if (v21 < v43)
                goto LABEL_12;
              objc_msgSend(v18, "attributes");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "objectForKeyedSubscript:", v37);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v23, "integerValue");

              objc_msgSend(v13, "attributes");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "objectForKeyedSubscript:", v37);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "integerValue");

              if (v24 >= v27)
              {
                v6 = v39;
              }
              else
              {
LABEL_12:
                v6 = v39;
                objc_msgSend(v39, "setObject:forKeyedSubscript:", v13, v15);
                v13 = v18;
              }
              v7 = v42;
              objc_msgSend(v44, "addObject:", v13);

              v4 = v38;
              v10 = v41;
            }
            else
            {
              objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, v15);
              v10 = v41;
              v7 = v42;
            }
            v11 = &off_1EA8AE000;
          }
          else
          {
            objc_msgSend(v44, "addObject:", v13);
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    }
    while (v9);
  }
  v28 = v4;

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v29 = v44;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v47 != v32)
          objc_enumerationMutation(v29);
        -[VSMobileAssetsManager _purgeMobileAsset:](v35, "_purgeMobileAsset:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j));
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v31);
  }

}

- (void)resetCache
{
  void *v3;
  id v4;

  -[VSMobileAssetsManager cachedMAVoiceSelections](self, "cachedMAVoiceSelections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[VSMobileAssetsManager trialService](self, "trialService");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "refreshTrialClient");

}

- (void)resetResourcesCache
{
  void *v3;
  id v4;

  -[VSMobileAssetsManager cachedMAVoiceResources](self, "cachedMAVoiceResources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[VSMobileAssetsManager trialService](self, "trialService");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "refreshTrialClient");

}

- (id)installedTrialVoiceResources
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[VSTrialService definedVoiceResourcesWithLanguage:](self->_trialService, "definedVoiceResourcesWithLanguage:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "isLocal", (_QWORD)v12))
        {
          +[VSVoiceResourceAsset resourceFromTrial:](VSVoiceResourceAsset, "resourceFromTrial:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v10);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)installedVoiceResources
{
  void *v3;
  void *v4;
  void *v5;
  VSVoiceResourceAsset *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[VSMobileAssetsManager installedTrialVoiceResources](self, "installedTrialVoiceResources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(VSVoiceResourceAsset);
  +[VSMobileAssetsManager queryForVoiceResourceAsset:returnTypes:](VSMobileAssetsManager, "queryForVoiceResourceAsset:returnTypes:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSMobileAssetsManager _getResults:](self, "_getResults:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "wasLocal"))
        {
          +[VSMobileAssetsManager voiceResourceFromAsset:](VSMobileAssetsManager, "voiceResourceFromAsset:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v14);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  return v5;
}

- (id)_trialVoiceWithLanguage:(id)a3 name:(id)a4 type:(int64_t)a5 footprint:(int64_t)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  VSGetLogDefault();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    +[VSVoiceAsset typeStringFromType:](VSVoiceAsset, "typeStringFromType:", a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[VSVoiceAsset footprintStringFromFootprint:](VSVoiceAsset, "footprintStringFromFootprint:", a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138544130;
    v28 = v10;
    v29 = 2114;
    v30 = v11;
    v31 = 2114;
    v32 = v13;
    v33 = 2114;
    v34 = v14;
    _os_log_impl(&dword_1DE15E000, v12, OS_LOG_TYPE_INFO, "#Trial Search voice asset for lang: %{public}@, name: %{public}@, type: %{public}@, footprint: %{public}@", (uint8_t *)&v27, 0x2Au);

  }
  -[VSMobileAssetsManager installedTrialVoicesForType:voiceName:language:footprint:](self, "installedTrialVoicesForType:voiceName:language:footprint:", a5, v11, v10, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "count"))
  {
    VSGetLogDefault();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      +[VSVoiceAsset typeStringFromType:](VSVoiceAsset, "typeStringFromType:", a5);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[VSVoiceAsset footprintStringFromFootprint:](VSVoiceAsset, "footprintStringFromFootprint:", a6);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138544130;
      v28 = v10;
      v29 = 2114;
      v30 = v11;
      v31 = 2114;
      v32 = v22;
      v33 = 2114;
      v34 = v23;
      _os_log_impl(&dword_1DE15E000, v20, OS_LOG_TYPE_DEFAULT, "#Trial no installed voices found for lang: %{public}@, name: %{public}@, type: %{public}@, footprint: %{public}@", (uint8_t *)&v27, 0x2Au);

    }
    goto LABEL_13;
  }
  +[VSMobileAssetsManager pickCorrectAssetFromLocalAssets:](VSMobileAssetsManager, "pickCorrectAssetFromLocalAssets:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  VSGetLogDefault();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (!v16)
  {
    if (v18)
    {
      +[VSVoiceAsset typeStringFromType:](VSVoiceAsset, "typeStringFromType:", a5);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[VSVoiceAsset footprintStringFromFootprint:](VSVoiceAsset, "footprintStringFromFootprint:", a6);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138544130;
      v28 = v10;
      v29 = 2114;
      v30 = v11;
      v31 = 2114;
      v32 = v24;
      v33 = 2114;
      v34 = v25;
      _os_log_impl(&dword_1DE15E000, v17, OS_LOG_TYPE_DEFAULT, "#Trial no suitable installed voices found for lang: %{public}@, name: %{public}@, type: %{public}@, footprint: %{public}@", (uint8_t *)&v27, 0x2Au);

    }
    v20 = 0;
LABEL_13:
    v21 = 0;
    goto LABEL_14;
  }
  if (v18)
  {
    objc_msgSend(v16, "voiceData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543362;
    v28 = v19;
    _os_log_impl(&dword_1DE15E000, v17, OS_LOG_TYPE_DEFAULT, "#Trial Found suitable voice: %{public}@", (uint8_t *)&v27, 0xCu);

  }
  v20 = v16;
  v21 = v20;
LABEL_14:

  return v21;
}

- (id)selectVoiceForLang:(id)a3 name:(id)a4 type:(int64_t)a5 gender:(int64_t)a6 footprint:(int64_t)a7
{
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  BOOL v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  VSGetLogDefault();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      +[VSVoiceAsset typeStringFromType:](VSVoiceAsset, "typeStringFromType:", a5);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      +[VSVoiceAsset genderStringFromGender:](VSVoiceAsset, "genderStringFromGender:", a6);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      +[VSVoiceAsset footprintStringFromFootprint:](VSVoiceAsset, "footprintStringFromFootprint:", a7);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v39 = v12;
      v40 = 2114;
      v41 = v13;
      v42 = 2112;
      v43 = v35;
      v44 = 2114;
      v45 = v36;
      v46 = 2114;
      v47 = v37;
      _os_log_debug_impl(&dword_1DE15E000, v15, OS_LOG_TYPE_DEBUG, "Searching voice asset for lang: %{public}@, name: %{public}@, type: %{public0}@, gender: %{public}@, footprint: %{public}@", buf, 0x34u);

    }
    +[VSSpeechInternalSettings standardInstance](VSSpeechInternalSettings, "standardInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "enableLocalVoices"))
    {
      v17 = objc_msgSend(v13, "length");

      if (!v17)
        goto LABEL_14;
      VSGetLogDefault();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v39 = v12;
        v40 = 2114;
        v41 = v13;
        _os_log_impl(&dword_1DE15E000, v18, OS_LOG_TYPE_DEFAULT, "Search local voices for lang: %{public}@, name: %{public}@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v12, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSMobileAssetsManager _localVoiceForLanguageAndNamePath:](self, "_localVoiceForLanguageAndNamePath:", v16);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }

LABEL_14:
    v20 = a5 == 1 && v17 == 0;
    if (v20)
      v19 = 0;
    else
      v19 = (void *)v17;
    if (v20 && a7 == 1)
    {
      VSGetLogDefault();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DE15E000, v21, OS_LOG_TYPE_DEFAULT, "Built-in voice is requested.", buf, 2u);
      }

      -[VSMobileAssetsManager _builtInVoiceForLanguage:](self, "_builtInVoiceForLanguage:", v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (!v19)
    {
      VSGetLogDefault();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1DE15E000, v22, OS_LOG_TYPE_DEBUG, "Search voices in Trial", buf, 2u);
      }

      -[VSMobileAssetsManager _trialVoiceWithLanguage:name:type:footprint:](self, "_trialVoiceWithLanguage:name:type:footprint:", v12, v13, a5, a7 == 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        VSGetLogDefault();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1DE15E000, v23, OS_LOG_TYPE_DEBUG, "Search voices in MobileAsset", buf, 2u);
        }

        -[VSMobileAssetsManager _mobileAssetVoiceForLanguage:name:type:gender:footprint:](self, "_mobileAssetVoiceForLanguage:name:type:gender:footprint:", v12, v13, a5, a6, a7 == 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    if (a7 == 1 || !v19)
    {
      if (v19)
        goto LABEL_50;
    }
    else
    {
      objc_msgSend(v19, "voiceData");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "footprint");

      if (v25 != 1)
      {
LABEL_50:
        VSGetLogDefault();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v19, "voiceData");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v39 = v33;
          _os_log_impl(&dword_1DE15E000, v15, OS_LOG_TYPE_DEFAULT, "Selected voice %{public}@", buf, 0xCu);

        }
        goto LABEL_52;
      }
    }
    VSGetLogDefault();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1DE15E000, v26, OS_LOG_TYPE_DEBUG, "Search voices in pre-installed location as fallback", buf, 2u);
    }

    -[VSMobileAssetsManager selectPreinstalledVoiceForLanguage:gender:name:](self, "selectPreinstalledVoiceForLanguage:gender:name:", v12, a6, v13);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v27;
    if (v27)
      v29 = (void *)v27;
    else
      v29 = v19;
    v30 = v29;

    v19 = v30;
    if (!v30)
    {
      VSGetLogDefault();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1DE15E000, v31, OS_LOG_TYPE_DEBUG, "Fallback to custom compact voice", buf, 2u);
      }

      -[VSMobileAssetsManager _mobileAssetVoiceForLanguage:name:type:gender:footprint:](self, "_mobileAssetVoiceForLanguage:name:type:gender:footprint:", v12, 0, 2, a6, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        VSGetLogDefault();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1DE15E000, v32, OS_LOG_TYPE_DEBUG, "Fallback to built-in compact voice", buf, 2u);
        }

        -[VSMobileAssetsManager _builtInVoiceForLanguage:](self, "_builtInVoiceForLanguage:", v12);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    goto LABEL_50;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1DE15E000, v15, OS_LOG_TYPE_ERROR, "Parameter language can't be nil for voice selection", buf, 2u);
  }
  v19 = 0;
LABEL_52:

  return v19;
}

- (void)downloadVoiceAsset:(id)a3 useBattery:(BOOL)a4 progressUpdateHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  +[VSMobileAssetsManager downloadOptionsWithBattery:](VSMobileAssetsManager, "downloadOptionsWithBattery:", v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[VSMobileAssetsManager downloadVoiceAsset:options:progressUpdateHandler:](self, "downloadVoiceAsset:options:progressUpdateHandler:", v9, v10, v8);

}

- (BOOL)shouldDownloadTrialVoice:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  NSObject *v13;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isLocal"))
  {
    VSGetLogDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v4;
      _os_log_impl(&dword_1DE15E000, v5, OS_LOG_TYPE_DEFAULT, "#Trial Found local voice, skip downloading. Target voice: %@", (uint8_t *)&v15, 0xCu);
    }
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v4, "language");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSMobileAssetsManager _mobileAssetVoiceForLanguage:name:type:gender:footprint:](self, "_mobileAssetVoiceForLanguage:name:type:gender:footprint:", v6, v7, objc_msgSend(v4, "type"), objc_msgSend(v4, "gender"), objc_msgSend(v4, "footprint"));
  v5 = objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NSObject voiceData](v5, "voiceData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");
    v11 = objc_msgSend(v4, "version");

    if (v10 >= v11)
    {
      VSGetLogDefault();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412290;
        v16 = v4;
        _os_log_impl(&dword_1DE15E000, v13, OS_LOG_TYPE_DEFAULT, "#Trial Found local MobileAsset voice with same or higher version, skip downloading. Target voice: %@", (uint8_t *)&v15, 0xCu);
      }

      goto LABEL_10;
    }
  }
  v12 = 1;
LABEL_11:

  return v12;
}

- (id)preferredDownloadForVoice:(id)a3
{
  void *v3;
  VSVoiceAssetSelection *v4;
  void *v5;

  -[VSMobileAssetsManager candidateToDownloadForVoice:](self, "candidateToDownloadForVoice:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[VSVoiceAssetSelection initWithTrialVoice:]([VSVoiceAssetSelection alloc], "initWithTrialVoice:", v3);
    -[VSVoiceAssetSelection voiceData](v4, "voiceData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)candidateToDownloadForVoice:(id)a3
{
  VSTrialService *trialService;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  trialService = self->_trialService;
  v4 = a3;
  objc_msgSend(v4, "languages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "type");
  v9 = objc_msgSend(v4, "footprint");

  -[VSTrialService definedVoicesWithLanguage:name:type:footprint:](trialService, "definedVoicesWithLanguage:name:type:footprint:", v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_354);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "filteredArrayUsingPredicate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v12, "sortedArrayUsingComparator:", &__block_literal_global_357);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v13;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)downloadVoiceAsset:(id)a3 options:(id)a4 progressUpdateHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void (**v13)(_QWORD, double, float);
  void *v14;
  uint64_t v15;
  NSObject *v16;
  VSDownloadOptions *v17;
  VSTrialService *trialService;
  VSDownloadOptions *v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  VSMobileAssetsManager *v23;
  VSDownloadOptions *v24;
  void (**v25)(_QWORD, double, float);
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __74__VSMobileAssetsManager_downloadVoiceAsset_options_progressUpdateHandler___block_invoke;
  v26[3] = &unk_1EA8AF2C8;
  v12 = v10;
  v27 = v12;
  v13 = (void (**)(_QWORD, double, float))MEMORY[0x1DF0E94A4](v26);
  objc_msgSend(v8, "languages");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    VSGetLogEvent();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v29 = v8;
      _os_log_impl(&dword_1DE15E000, v16, OS_LOG_TYPE_DEFAULT, "#Trial Enqueued downloading: %{public}@", buf, 0xCu);
    }

    v17 = objc_alloc_init(VSDownloadOptions);
    -[VSDownloadOptions setAllowCellularData:](v17, "setAllowCellularData:", objc_msgSend(v9, "allowsCellularAccess"));
    -[VSDownloadOptions setAllowDiscretionary:](v17, "setAllowDiscretionary:", objc_msgSend(v9, "discretionary"));
    trialService = self->_trialService;
    v21[0] = v11;
    v21[1] = 3221225472;
    v21[2] = __74__VSMobileAssetsManager_downloadVoiceAsset_options_progressUpdateHandler___block_invoke_360;
    v21[3] = &unk_1EA8AF318;
    v22 = v8;
    v24 = v17;
    v25 = v13;
    v23 = self;
    v19 = v17;
    -[VSTrialService downloadNamespaceImmediatelyIfNeededWithOption:completion:](trialService, "downloadNamespaceImmediatelyIfNeededWithOption:completion:", v19, v21);

  }
  else
  {
    VSGetLogDefault();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DE15E000, v20, OS_LOG_TYPE_ERROR, "Language must be provided for voice download.", buf, 2u);
    }

    v13[2](v13, -1.0, -1.0);
  }

}

- (void)_removeTrialVoices:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  void *v14;
  VSTrialService *trialService;
  NSObject *v16;
  void *v17;
  void *v18;
  id obj;
  _QWORD block[4];
  NSObject *v21;
  id v22;
  _QWORD *v23;
  _QWORD v24[5];
  NSObject *v25;
  _QWORD *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[3];
  char v32;
  uint8_t buf[4];
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17 = v6;
  if (objc_msgSend(v6, "count"))
  {
    v18 = v7;
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    v32 = 0;
    v8 = dispatch_group_create();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = v6;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16, v6);
    if (v9)
    {
      v10 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          VSGetLogEvent();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v12, "factorName");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v34 = v14;
            _os_log_impl(&dword_1DE15E000, v13, OS_LOG_TYPE_DEFAULT, "#Trial Removing voice: %@", buf, 0xCu);

          }
          dispatch_group_enter(v8);
          trialService = self->_trialService;
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __55__VSMobileAssetsManager__removeTrialVoices_completion___block_invoke;
          v24[3] = &unk_1EA8AFAD0;
          v24[4] = v12;
          v26 = v31;
          v25 = v8;
          -[VSTrialService removeVoice:completion:](trialService, "removeVoice:completion:", v12, v24);

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v9);
    }

    if (v18)
    {
      dispatch_get_global_queue(21, 0);
      v16 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __55__VSMobileAssetsManager__removeTrialVoices_completion___block_invoke_364;
      block[3] = &unk_1EA8AF340;
      v21 = v8;
      v23 = v31;
      v22 = v18;
      dispatch_async(v16, block);

    }
    _Block_object_dispose(v31, 8);
    v7 = v18;
  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (void)cancelDownloads:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  VSGetLogEvent();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v9;
    _os_log_impl(&dword_1DE15E000, v8, OS_LOG_TYPE_DEFAULT, "#Trial Cancelling voice downloads: %{public}@", (uint8_t *)&v13, 0xCu);

  }
  -[VSTrialService definedVoicesWithAssets:](self->_trialService, "definedVoicesWithAssets:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_365);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "filteredArrayUsingPredicate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSMobileAssetsManager _removeTrialVoices:completion:](self, "_removeTrialVoices:completion:", v12, v7);
}

- (void)cancelDownload:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  VSTrialService *trialService;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  VSGetLogEvent();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543362;
    v18 = v9;
    _os_log_impl(&dword_1DE15E000, v8, OS_LOG_TYPE_DEFAULT, "#Trial Cancelling voice download: %{public}@", (uint8_t *)&v17, 0xCu);

  }
  trialService = self->_trialService;
  objc_msgSend(v6, "languages");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSTrialService definedVoicesWithLanguage:name:type:footprint:](trialService, "definedVoicesWithLanguage:name:type:footprint:", v12, v13, objc_msgSend(v6, "type"), objc_msgSend(v6, "footprint"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_366);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "filteredArrayUsingPredicate:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSMobileAssetsManager _removeTrialVoices:completion:](self, "_removeTrialVoices:completion:", v16, v7);
}

- (void)removeTrialVoice:(id)a3 completion:(id)a4
{
  VSTrialService *trialService;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  trialService = self->_trialService;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "languages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "type");
  v13 = objc_msgSend(v8, "footprint");

  -[VSTrialService definedVoicesWithLanguage:name:type:footprint:](trialService, "definedVoicesWithLanguage:name:type:footprint:", v10, v11, v12, v13);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_367);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "filteredArrayUsingPredicate:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSMobileAssetsManager _removeTrialVoices:completion:](self, "_removeTrialVoices:completion:", v15, v7);
}

- (void)removeVoiceAsset:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t i;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  id v33;
  uint8_t v34[128];
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (v6)
  {
    VSGetLogEvent();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v10;
      _os_log_impl(&dword_1DE15E000, v9, OS_LOG_TYPE_DEFAULT, "Removing voice: %{public}@", buf, 0xCu);

    }
    v11 = objc_msgSend(v6, "type");
    objc_msgSend(v6, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "languages");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSMobileAssetsManager installedAssetsForType:voicename:language:gender:footprint:](self, "installedAssetsForType:voicename:language:gender:footprint:", v11, v12, v14, objc_msgSend(v6, "gender"), objc_msgSend(v6, "footprint"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0CB3880];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __53__VSMobileAssetsManager_removeVoiceAsset_completion___block_invoke;
    v32[3] = &unk_1EA8AF3C8;
    v17 = v6;
    v33 = v17;
    objc_msgSend(v16, "predicateWithBlock:", v32);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "filteredArrayUsingPredicate:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v19, "count"))
    {
      VSGetLogEvent();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v17, "description");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v36 = v21;
        _os_log_impl(&dword_1DE15E000, v20, OS_LOG_TYPE_DEFAULT, "Asset not removed because it is not present: %@", buf, 0xCu);

      }
    }
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v22 = v19;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v23)
    {
      v24 = v23;
      v25 = 0;
      v26 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v29 != v26)
            objc_enumerationMutation(v22);
          if (!v25)
          {
            -[VSMobileAssetsManager purgeAsset:](self, "purgeAsset:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), (_QWORD)v28);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v24);
    }
    else
    {
      v25 = 0;
    }

    if (v8)
      ((void (**)(_QWORD, void *))v8)[2](v8, v25);

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (BOOL)shouldDownloadTrialResource:(id)a3
{
  NSObject *v4;
  VSTrialService *trialService;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  unint64_t v16;
  NSObject *v17;
  NSObject *v18;
  BOOL v19;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  unint64_t v26;
  NSObject *v27;
  const char *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  NSObject *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  trialService = self->_trialService;
  -[NSObject languages](v4, "languages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSTrialService definedVoiceResourcesWithLanguage:](trialService, "definedVoiceResourcesWithLanguage:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (!v10)
  {

LABEL_16:
    VSGetLogDefault();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v4;
      _os_log_error_impl(&dword_1DE15E000, v12, OS_LOG_TYPE_ERROR, "#Trial Cannot find any Trial resource, skip downloading. Target resource: %@", buf, 0xCu);
    }
    goto LABEL_18;
  }
  v11 = v10;
  v12 = 0;
  v13 = *(_QWORD *)v30;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v30 != v13)
        objc_enumerationMutation(v9);
      v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
      v16 = objc_msgSend(v15, "version", (_QWORD)v29);
      if (v16 > -[NSObject version](v12, "version"))
      {
        v17 = v15;

        v12 = v17;
      }
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  }
  while (v11);

  if (!v12)
    goto LABEL_16;
  if (!-[NSObject isLocal](v12, "isLocal"))
  {
    -[NSObject languages](v4, "languages");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSMobileAssetsManager _mobileAssetVoiceResourceWithLanguage:](self, "_mobileAssetVoiceResourceWithLanguage:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v23 == 0;
    if (v23)
    {
      v24 = -[NSObject version](v12, "version");
      objc_msgSend(v23, "contentVersion");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "integerValue");

      if (v24 > v26)
      {
        v19 = 1;
LABEL_29:

        goto LABEL_19;
      }
      VSGetLogDefault();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v4;
        v28 = "#Trial Found same or newer resource in MobileAsset, skip downloading. Target resource: %@";
        goto LABEL_27;
      }
    }
    else
    {
      VSGetLogDefault();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v4;
        v28 = "#Trial No MobileAsset resource found, will download Trial resource. Target resource: %@";
LABEL_27:
        _os_log_impl(&dword_1DE15E000, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 0xCu);
      }
    }

    goto LABEL_29;
  }
  VSGetLogDefault();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v12;
    _os_log_impl(&dword_1DE15E000, v18, OS_LOG_TYPE_DEFAULT, "#Trial Found local resource, skip downloading. Target resource: %@", buf, 0xCu);
  }

LABEL_18:
  v19 = 0;
LABEL_19:

  return v19;
}

- (void)downloadVoiceResource:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  +[VSMobileAssetsManager downloadOptionsWithBattery:](VSMobileAssetsManager, "downloadOptionsWithBattery:", 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[VSMobileAssetsManager downloadVoiceResource:options:completion:](self, "downloadVoiceResource:options:completion:", v7, v8, v6);

}

- (void)downloadVoiceResourceCatalogWithCompletion:(id)a3
{
  -[VSMobileAssetsManager downloadCatalog:options:completion:](self, "downloadCatalog:options:completion:", CFSTR("com.apple.MobileAsset.VoiceServices.VoiceResources"), 0, a3);
}

- (void)downloadTrialVoiceResource:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  VSDownloadOptions *v12;
  uint64_t v13;
  VSTrialService *trialService;
  VSDownloadOptions *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  VSMobileAssetsManager *v20;
  VSDownloadOptions *v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  VSGetLogEvent();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v8;
    _os_log_impl(&dword_1DE15E000, v11, OS_LOG_TYPE_DEFAULT, "#Trial Enqueue downloading resource: %@", buf, 0xCu);
  }

  v12 = objc_alloc_init(VSDownloadOptions);
  -[VSDownloadOptions setAllowDiscretionary:](v12, "setAllowDiscretionary:", objc_msgSend(v10, "discretionary"));
  v13 = objc_msgSend(v10, "allowsCellularAccess");

  -[VSDownloadOptions setAllowCellularData:](v12, "setAllowCellularData:", v13);
  trialService = self->_trialService;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __71__VSMobileAssetsManager_downloadTrialVoiceResource_options_completion___block_invoke;
  v18[3] = &unk_1EA8AF318;
  v19 = v8;
  v20 = self;
  v21 = v12;
  v22 = v9;
  v15 = v12;
  v16 = v9;
  v17 = v8;
  -[VSTrialService downloadNamespaceImmediatelyIfNeededWithOption:completion:](trialService, "downloadNamespaceImmediatelyIfNeededWithOption:completion:", v15, v18);

}

- (void)removeTrialVoiceResource:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  VSTrialVoiceResource *v8;
  void *v9;
  void *v10;
  VSTrialVoiceResource *v11;

  v6 = a4;
  v7 = a3;
  v8 = [VSTrialVoiceResource alloc];
  objc_msgSend(v7, "languages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[VSTrialVoiceResource initWithLanguage:](v8, "initWithLanguage:", v10);

  -[VSTrialService removeVoiceResource:completion:](self->_trialService, "removeVoiceResource:completion:", v11, v6);
}

- (void)removeMobileAssetVoiceResource:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD))a4;
  +[VSMobileAssetsManager queryForVoiceResourceAsset:returnTypes:](VSMobileAssetsManager, "queryForVoiceResourceAsset:returnTypes:", a3, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSMobileAssetsManager _getResults:](self, "_getResults:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[VSMobileAssetsManager _purgeMobileAsset:](self, "_purgeMobileAsset:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }
  if (v6)
    v6[2](v6, 0);

}

- (void)removeVoiceResource:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__VSMobileAssetsManager_removeVoiceResource_completion___block_invoke;
  v10[3] = &unk_1EA8AF3F0;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[VSMobileAssetsManager removeTrialVoiceResource:completion:](self, "removeTrialVoiceResource:completion:", v9, v10);

}

- (id)downloadCatalog:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  id v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  v8 = dispatch_semaphore_create(0);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49__VSMobileAssetsManager_downloadCatalog_options___block_invoke;
  v12[3] = &unk_1EA8AF1F8;
  v14 = &v15;
  v9 = v8;
  v13 = v9;
  -[VSMobileAssetsManager downloadCatalog:options:completion:](self, "downloadCatalog:options:completion:", v6, v7, v12);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (void)downloadCatalog:(id)a3 options:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v8)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0D4E088]);
    objc_msgSend(v8, "setAllowsCellularAccess:", +[VSUtilities isWatch](VSUtilities, "isWatch") ^ 1);
    objc_msgSend(v8, "setDiscretionary:", 0);
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4E050]), "initWithType:", v7);
  objc_msgSend(v10, "lastFetchDate");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_5;
  v12 = (void *)v11;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastFetchDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceDate:", v14);
  v16 = v15;

  if (v16 >= 3600.0)
  {
LABEL_5:
    v17 = (void *)MEMORY[0x1E0D4E038];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __60__VSMobileAssetsManager_downloadCatalog_options_completion___block_invoke;
    v18[3] = &unk_1EA8AF440;
    v19 = v7;
    v20 = v9;
    objc_msgSend(v17, "startCatalogDownload:options:then:", v19, v8, v18);

  }
}

- (void)_downloadAsset:(id)a3 options:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  unint64_t v19;
  NSObject *v20;
  __CFString *v21;
  uint64_t v22;
  NSObject *v23;
  _BOOL4 v24;
  const __CFString *v25;
  int v26;
  void *v27;
  NSObject *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  uint64_t v39;
  const __CFString *v40;
  uint8_t buf[4];
  const __CFString *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __68__VSMobileAssetsManager__downloadAsset_options_progress_completion___block_invoke;
  v37[3] = &unk_1EA8AF468;
  v14 = v11;
  v38 = v14;
  v15 = (void *)MEMORY[0x1DF0E94A4](v37);
  v34[0] = v13;
  v34[1] = 3221225472;
  v34[2] = __68__VSMobileAssetsManager__downloadAsset_options_progress_completion___block_invoke_2;
  v34[3] = &unk_1EA8AF440;
  v16 = v9;
  v35 = v16;
  v17 = v12;
  v36 = v17;
  v18 = (void *)MEMORY[0x1DF0E94A4](v34);
  v19 = objc_msgSend(v16, "state");
  if (v19 <= 6)
  {
    if (((1 << v19) & 0x6C) != 0)
    {
      VSGetLogEvent();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v16, "attributes");
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v42 = v21;
        _os_log_impl(&dword_1DE15E000, v20, OS_LOG_TYPE_DEFAULT, "#MobileAsset download skipped, asset is already installed: %{public}@", buf, 0xCu);

      }
      if (v17)
        (*((void (**)(id, _QWORD))v17 + 2))(v17, 0);
    }
    else if (((1 << v19) & 0x12) != 0)
    {
      v22 = objc_msgSend(v16, "state");
      VSGetLogEvent();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
      if (v22 == 1)
      {
        if (v24)
        {
          if (objc_msgSend(v10, "discretionary"))
            v25 = CFSTR("discretionary");
          else
            v25 = CFSTR("immediate");
          v26 = objc_msgSend(v10, "allowsCellularAccess");
          objc_msgSend(v16, "attributes");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v42 = v25;
          v43 = 1024;
          v44 = v26;
          v45 = 2112;
          v46 = v27;
          _os_log_impl(&dword_1DE15E000, v23, OS_LOG_TYPE_DEFAULT, "#MobileAsset Begin %@ download, allowing cellular %{BOOL}d: %@", buf, 0x1Cu);

        }
      }
      else if (v24)
      {
        objc_msgSend(v16, "attributes");
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v42 = v33;
        _os_log_impl(&dword_1DE15E000, v23, OS_LOG_TYPE_DEFAULT, "#MobileAsset Asset is already downloading: %{public}@", buf, 0xCu);

      }
      if (v14)
        objc_msgSend(v16, "attachProgressCallBack:", v15);
      objc_msgSend(v16, "startDownload:then:", v10, v18);
    }
    else
    {
      VSGetLogEvent();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v16, "attributes");
        v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v42 = v29;
        _os_log_impl(&dword_1DE15E000, v28, OS_LOG_TYPE_DEFAULT, "#MobileAsset download skipped, asset is in an unknown state: %{public}@", buf, 0xCu);

      }
      if (v17)
      {
        v30 = (void *)MEMORY[0x1E0CB35C8];
        v39 = *MEMORY[0x1E0CB2D50];
        v40 = CFSTR("Asset is in an unknown state");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("VSMobileAssetServiceErrorDomain"), -5000, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *))v17 + 2))(v17, v32);

      }
    }
  }

}

- (id)purgeAsset:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  dispatch_semaphore_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "asset");
    v6 = objc_claimAutoreleasedReturnValue();
    -[VSMobileAssetsManager _purgeMobileAsset:](self, "_purgeMobileAsset:", v6);
  }
  else
  {
    v7 = dispatch_semaphore_create(0);
    objc_msgSend(v4, "voiceData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __36__VSMobileAssetsManager_purgeAsset___block_invoke;
    v12[3] = &unk_1EA8AF1F8;
    v14 = &v15;
    v6 = v7;
    v13 = v6;
    -[VSMobileAssetsManager removeTrialVoice:completion:](self, "removeTrialVoice:completion:", v8, v12);

    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:", CFSTR("com.apple.voiceservices.notification.voice-purge"), v4);

  v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

- (void)_purgeMobileAsset:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  const char *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  switch(objc_msgSend(v3, "state"))
  {
    case 0:
    case 1:
      VSGetLogEvent();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      objc_msgSend(v3, "attributes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v9;
      v11 = "#MobileAsset Purge cannot find asset: %{public}@";
      goto LABEL_17;
    case 2:
    case 3:
    case 6:
      VSGetLogEvent();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "attributes");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543362;
        v17 = v5;
        _os_log_impl(&dword_1DE15E000, v4, OS_LOG_TYPE_DEFAULT, "#MobileAsset purge asset: %{public}@", (uint8_t *)&v16, 0xCu);

      }
      v6 = objc_msgSend(v3, "purgeSync");
      if (!v6)
        goto LABEL_20;
      v7 = v6;
      VSGetLogDefault();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        goto LABEL_19;
      MEMORY[0x1DF0E8D60](v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v9;
      v10 = "#MobileAsset purge error: %@";
      break;
    case 4:
      VSGetLogEvent();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "attributes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543362;
        v17 = v13;
        _os_log_impl(&dword_1DE15E000, v12, OS_LOG_TYPE_DEFAULT, "#MobileAsset cancel downloading asset: %{public}@", (uint8_t *)&v16, 0xCu);

      }
      v14 = objc_msgSend(v3, "cancelDownloadSync");
      if (!v14)
        goto LABEL_20;
      v15 = v14;
      VSGetLogEvent();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        goto LABEL_19;
      MEMORY[0x1DF0E8D3C](v15);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v9;
      v10 = "#MobileAsset Cancel download error: %@";
      break;
    case 5:
      VSGetLogEvent();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      objc_msgSend(v3, "attributes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v9;
      v11 = "#MobileAsset not removed because it is required by the OS: %{public}@";
LABEL_17:
      _os_log_impl(&dword_1DE15E000, v8, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, 0xCu);
      goto LABEL_18;
    default:
      goto LABEL_20;
  }
  _os_log_error_impl(&dword_1DE15E000, v8, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v16, 0xCu);
LABEL_18:

LABEL_19:
LABEL_20:

}

- (id)_builtInVoiceForLanguage:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  void *v5;
  VSVoiceAssetSelection *v6;
  VSVoiceAsset *v7;
  void *v8;
  void *v10;
  void *v11;
  uint8_t buf[4];
  __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  v10 = 0;
  v4 = (__CFString *)VSVocalizerCopyPathForBuiltInVoice(v3, &v10);
  v5 = v10;
  if (v4)
  {
    v6 = objc_alloc_init(VSVoiceAssetSelection);
    -[VSVoiceAssetSelection setBuiltInVoicePath:](v6, "setBuiltInVoicePath:", v4);
    v7 = objc_alloc_init(VSVoiceAsset);
    -[VSAssetBase setStorage:](v7, "setStorage:", 1);
    -[VSVoiceAsset setIsInstalled:](v7, "setIsInstalled:", 1);
    -[VSVoiceAsset setIsBuiltInVoice:](v7, "setIsBuiltInVoice:", 1);
    -[VSVoiceAsset setType:](v7, "setType:", 1);
    v11 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSVoiceAsset setLanguages:](v7, "setLanguages:", v8);

    -[VSVoiceAsset setFootprint:](v7, "setFootprint:", 1);
    -[VSVoiceAsset setIsVoiceReadyToUse:](v7, "setIsVoiceReadyToUse:", 1);
    -[VSVoiceAssetSelection setVoiceData:](v6, "setVoiceData:", v7);
  }
  else
  {
    VSGetLogDefault();
    v7 = (VSVoiceAsset *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v3;
      _os_log_error_impl(&dword_1DE15E000, &v7->super.super, OS_LOG_TYPE_ERROR, "#MobileAsset Couldn't find any built-in voice for language: %{public}@", buf, 0xCu);
    }
    v6 = 0;
  }

  return v6;
}

- (id)_localVoiceForLanguageAndNamePath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  VSVoiceAssetSelection *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  id (*v25)(uint64_t);
  void *v26;
  id v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  v30[0] = CFSTR("/private/var/mobile/Library/VoiceServices/voices/");
  v30[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathWithComponents:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3940];
  v29[0] = v7;
  v29[1] = CFSTR("AssetData");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pathWithComponents:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "fileExistsAtPath:", v10);

  if (v12)
  {
    v13 = objc_alloc_init(VSVoiceAssetSelection);
    -[VSVoiceAssetSelection setBuiltInVoicePath:](v13, "setBuiltInVoicePath:", v10);
    v14 = (void *)MEMORY[0x1E0C99D80];
    v15 = (void *)MEMORY[0x1E0CB3940];
    v28[0] = v7;
    v28[1] = CFSTR("Info.plist");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pathWithComponents:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryWithContentsOfFile:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("CFBundleIdentifier"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("MobileAssetProperties"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __59__VSMobileAssetsManager__localVoiceForLanguageAndNamePath___block_invoke;
    v26 = &unk_1EA8AF510;
    v27 = v10;
    -[VSMobileAssetsManager voiceDataWithBundleIdentifier:attributes:voicePathCallback:](self, "voiceDataWithBundleIdentifier:attributes:voicePathCallback:", v19, v20, &v23);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "setIsInstalled:", 1, v23, v24, v25, v26);
    objc_msgSend(v21, "setMasteredVersion:", CFSTR("local_voice"));
    -[VSVoiceAssetSelection setVoiceData:](v13, "setVoiceData:", v21);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)installedLocalVoices
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v17;
  void *v18;
  id v19;
  VSMobileAssetsManager *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  uint8_t v26[128];
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", CFSTR("/private/var/mobile/Library/VoiceServices/voices/"), &v25);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v25;

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v6 = v4;
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (!v7)
      goto LABEL_19;
    v8 = v7;
    v20 = self;
    v17 = 0;
    v18 = v4;
    v9 = *(_QWORD *)v22;
LABEL_7:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v10);
      objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("_"), v17, v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "count") != 2)
        goto LABEL_16;
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v13, "length"))
        goto LABEL_15;
      objc_msgSend(v12, "lastObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "length");

      if (v15)
        break;
LABEL_16:

      if (v8 == ++v10)
      {
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (!v8)
        {
          v5 = v17;
          v4 = v18;
          goto LABEL_19;
        }
        goto LABEL_7;
      }
    }
    -[VSMobileAssetsManager _localVoiceForLanguageAndNamePath:](v20, "_localVoiceForLanguageAndNamePath:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v19, "addObject:", v13);
LABEL_15:

    goto LABEL_16;
  }
  VSGetLogDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v5;
    _os_log_error_impl(&dword_1DE15E000, v6, OS_LOG_TYPE_ERROR, "Unable to query local voice directory, %@", buf, 0xCu);
  }
  v19 = (id)MEMORY[0x1E0C9AA60];
LABEL_19:

  return v19;
}

- (OS_dispatch_queue)assetQueryQueue
{
  return self->_assetQueryQueue;
}

- (void)setAssetQueryQueue:(id)a3
{
  objc_storeStrong((id *)&self->_assetQueryQueue, a3);
}

- (NSCache)cachedMAVoiceSelections
{
  return self->_cachedMAVoiceSelections;
}

- (void)setCachedMAVoiceSelections:(id)a3
{
  objc_storeStrong((id *)&self->_cachedMAVoiceSelections, a3);
}

- (NSCache)cachedMAVoiceResources
{
  return self->_cachedMAVoiceResources;
}

- (void)setCachedMAVoiceResources:(id)a3
{
  objc_storeStrong((id *)&self->_cachedMAVoiceResources, a3);
}

- (VSTrialService)trialService
{
  return self->_trialService;
}

- (void)setTrialService:(id)a3
{
  objc_storeStrong((id *)&self->_trialService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialService, 0);
  objc_storeStrong((id *)&self->_cachedMAVoiceResources, 0);
  objc_storeStrong((id *)&self->_cachedMAVoiceSelections, 0);
  objc_storeStrong((id *)&self->_assetQueryQueue, 0);
}

id __44__VSMobileAssetsManager_voiceDataFromAsset___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "getLocalUrl");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __59__VSMobileAssetsManager__localVoiceForLanguageAndNamePath___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __36__VSMobileAssetsManager_purgeAsset___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __68__VSMobileAssetsManager__downloadAsset_options_progress_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  __n128 v6;
  float v7;
  id v8;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    v8 = v3;
    v4 = -1.0;
    if ((objc_msgSend(v3, "isStalled") & 1) == 0)
    {
      objc_msgSend(v8, "expectedTimeRemaining");
      v4 = v5;
    }
    if (objc_msgSend(v8, "totalExpected") < 1)
    {
      v6.n128_u32[0] = 0;
    }
    else
    {
      v7 = (float)objc_msgSend(v8, "totalWritten");
      v6.n128_f32[0] = v7 / (float)objc_msgSend(v8, "totalExpected");
    }
    (*(void (**)(double, __n128))(*(_QWORD *)(a1 + 32) + 16))(v4, v6);
    v3 = v8;
  }

}

void __68__VSMobileAssetsManager__downloadAsset_options_progress_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  VSGetLogEvent();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      MEMORY[0x1DF0E8D48](a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "attributes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v15 = v10;
      v16 = 2114;
      v17 = v11;
      _os_log_error_impl(&dword_1DE15E000, v5, OS_LOG_TYPE_ERROR, "#MobileAsset err %@, unable to download asset %{public}@", buf, 0x16u);

    }
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2D50];
    v13 = CFSTR("Unable to download asset");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("VSMobileAssetServiceErrorDomain"), a2, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "attributes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v8;
      _os_log_impl(&dword_1DE15E000, v5, OS_LOG_TYPE_DEFAULT, "#MobileAsset Finished downloading asset %{public}@", buf, 0xCu);

    }
    v7 = 0;
  }

  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v7);

}

void __60__VSMobileAssetsManager_downloadCatalog_options_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v2 = a2;
  v18 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    VSGetLogEvent();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      MEMORY[0x1DF0E8D48](v2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      _os_log_error_impl(&dword_1DE15E000, v4, OS_LOG_TYPE_ERROR, "#MobileAsset Catalog '%@' download error: %@", buf, 0x16u);

    }
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2D50];
    v13 = CFSTR("Unable to download catalog");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("VSMobileAssetServiceErrorDomain"), v2, v6);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "runUntilDate:", v8);

  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v2);

}

void __49__VSMobileAssetsManager_downloadCatalog_options___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __56__VSMobileAssetsManager_removeVoiceResource_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeMobileAssetVoiceResource:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __71__VSMobileAssetsManager_downloadTrialVoiceResource_options_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void (*v7)(void);
  NSObject *v8;
  uint64_t v9;
  VSTrialVoiceResource *v10;
  void *v11;
  void *v12;
  VSTrialVoiceResource *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    VSGetLogEvent();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = 138412546;
      v17 = v15;
      v18 = 2112;
      v19 = v4;
      _os_log_error_impl(&dword_1DE15E000, v5, OS_LOG_TYPE_ERROR, "#Trial Error downloading resource: %@, error: %@", (uint8_t *)&v16, 0x16u);
    }

    v6 = *(_QWORD *)(a1 + 56);
    if (v6)
    {
      v7 = *(void (**)(void))(v6 + 16);
LABEL_12:
      v7();
    }
  }
  else if ((objc_msgSend(*(id *)(a1 + 40), "shouldDownloadTrialResource:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    VSGetLogEvent();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v16 = 138412290;
      v17 = v9;
      _os_log_impl(&dword_1DE15E000, v8, OS_LOG_TYPE_DEFAULT, "#Trial Start downloading for: %@", (uint8_t *)&v16, 0xCu);
    }

    v10 = [VSTrialVoiceResource alloc];
    objc_msgSend(*(id *)(a1 + 32), "languages");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[VSTrialVoiceResource initWithLanguage:](v10, "initWithLanguage:", v12);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "downloadVoiceResource:withOptions:progress:completion:", v13, *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56));
  }
  else
  {
    v14 = *(_QWORD *)(a1 + 56);
    if (v14)
    {
      v7 = *(void (**)(void))(v14 + 16);
      goto LABEL_12;
    }
  }

}

uint64_t __53__VSMobileAssetsManager_removeVoiceAsset_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "masteredVersion");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        objc_msgSend(v3, "asset"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    objc_msgSend(v3, "asset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D4DF08]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "masteredVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

uint64_t __53__VSMobileAssetsManager_removeTrialVoice_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isLocal");
}

uint64_t __51__VSMobileAssetsManager_cancelDownload_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isLocal") ^ 1;
}

uint64_t __52__VSMobileAssetsManager_cancelDownloads_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isLocal") ^ 1;
}

void __55__VSMobileAssetsManager__removeTrialVoices_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  VSGetLogEvent();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "factorName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_error_impl(&dword_1DE15E000, v5, OS_LOG_TYPE_ERROR, "#Trial Unable to remove voice %@, error: %@", (uint8_t *)&v8, 0x16u);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "factorName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1DE15E000, v5, OS_LOG_TYPE_DEFAULT, "#Trial Removed voice: %@", (uint8_t *)&v8, 0xCu);

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __55__VSMobileAssetsManager__removeTrialVoices_completion___block_invoke_364(_QWORD *a1)
{
  NSObject *v2;
  dispatch_time_t v3;
  intptr_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v2 = a1[4];
  v3 = dispatch_time(0, 5000000000);
  v4 = dispatch_group_wait(v2, v3);
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    v5 = a1[5];
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = 2;
LABEL_5:
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("VSTrialServiceErrorDomain"), v7, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v8);

    return;
  }
  v5 = a1[5];
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = 1;
    goto LABEL_5;
  }
  (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);
}

uint64_t __74__VSMobileAssetsManager_downloadVoiceAsset_options_progressUpdateHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __74__VSMobileAssetsManager_downloadVoiceAsset_options_progressUpdateHandler___block_invoke_360(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  __n128 v10;
  __n128 v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __n128 v15;
  __n128 v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    VSGetLogDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v17 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v24 = v17;
      v25 = 2112;
      v26 = v4;
      _os_log_error_impl(&dword_1DE15E000, v5, OS_LOG_TYPE_ERROR, "#Trial Unable to download namespace to download voice: %@, error: %@", buf, 0x16u);
    }

    (*(void (**)(double, float))(*(_QWORD *)(a1 + 56) + 16))(-1.0, -1.0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "candidateToDownloadForVoice:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    VSGetLogDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v6;
        _os_log_impl(&dword_1DE15E000, v8, OS_LOG_TYPE_DEFAULT, "Target voice to download: %@", buf, 0xCu);
      }

      objc_msgSend(v6, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setName:", v9);

      objc_msgSend(*(id *)(a1 + 32), "setType:", objc_msgSend(v6, "type"));
      objc_msgSend(*(id *)(a1 + 32), "setFootprint:", objc_msgSend(v6, "footprint"));
      if ((objc_msgSend(*(id *)(a1 + 40), "shouldDownloadTrialVoice:", v6) & 1) != 0)
      {
        v12 = *(_QWORD *)(a1 + 48);
        v13 = MEMORY[0x1E0C809B0];
        v14 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __74__VSMobileAssetsManager_downloadVoiceAsset_options_progressUpdateHandler___block_invoke_361;
        v21[3] = &unk_1EA8AF2F0;
        v22 = *(id *)(a1 + 56);
        v19[0] = v13;
        v19[1] = 3221225472;
        v19[2] = __74__VSMobileAssetsManager_downloadVoiceAsset_options_progressUpdateHandler___block_invoke_2;
        v19[3] = &unk_1EA8B00E0;
        v20 = *(id *)(a1 + 56);
        objc_msgSend(v14, "downloadVoice:withOptions:progress:completion:", v6, v12, v21, v19);

      }
      else
      {
        v10.n128_u64[0] = 0;
        v11.n128_u32[0] = 1.0;
        (*(void (**)(__n128, __n128))(*(_QWORD *)(a1 + 56) + 16))(v10, v11);
      }
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v18 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v24 = v18;
        _os_log_error_impl(&dword_1DE15E000, v8, OS_LOG_TYPE_ERROR, "#Trial Unable to find suitable voice to download for voice criteria: %@", buf, 0xCu);
      }

      v15.n128_u64[0] = -1.0;
      v16.n128_u32[0] = -1.0;
      (*(void (**)(__n128, __n128))(*(_QWORD *)(a1 + 56) + 16))(v15, v16);
    }

  }
}

uint64_t __74__VSMobileAssetsManager_downloadVoiceAsset_options_progressUpdateHandler___block_invoke_361(uint64_t a1, float a2)
{
  return (*(uint64_t (**)(double, float))(*(_QWORD *)(a1 + 32) + 16))(1.0, fminf(a2, 0.99));
}

uint64_t __74__VSMobileAssetsManager_downloadVoiceAsset_options_progressUpdateHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(double, float);

  v2 = *(uint64_t (**)(double, float))(*(_QWORD *)(a1 + 32) + 16);
  if (a2)
    return v2(-1.0, -1.0);
  v2(0.0, 1.0);
  return notify_post((const char *)objc_msgSend(CFSTR("com.apple.voiceservices.notification.voice-update"), "UTF8String"));
}

uint64_t __53__VSMobileAssetsManager_candidateToDownloadForVoice___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a2, "preferenceScore");
  v6 = v5;
  objc_msgSend(v4, "preferenceScore");
  v8 = v7;

  if (v6 >= v8)
    return 1;
  else
    return -1;
}

BOOL __53__VSMobileAssetsManager_candidateToDownloadForVoice___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = (+[VSNeuralTTSUtils isNeuralTTSPlatform](VSNeuralTTSUtils, "isNeuralTTSPlatform")
     || objc_msgSend(v2, "type") != 4)
    && (+[VSUtilities isHomePod](VSUtilities, "isHomePod") || objc_msgSend(v2, "footprint") != 3)
    && (!+[VSUtilities isWatch](VSUtilities, "isWatch")
     || objc_msgSend(v2, "type") == 3
     || objc_msgSend(v2, "type") == 4);

  return v3;
}

void __42__VSMobileAssetsManager_cleanUnusedAssets__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v4;
  id *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v4 + 40);
  v5 = (id *)(v4 + 40);
  v6 = v7;
  if (v7)
    a2 = v6;
  objc_storeStrong(v5, a2);
  v8 = v2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __52__VSMobileAssetsManager_voiceAssetsForSubscription___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a2, "preferenceScore");
  v6 = v5;
  objc_msgSend(v4, "preferenceScore");
  v8 = v7;

  if (v6 >= v8)
    return 1;
  else
    return -1;
}

uint64_t __65__VSMobileAssetsManager__installedVoiceResourceAssetForLanguage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(a2, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *MEMORY[0x1E0D4DEE8];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D4DEE8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  v12 = 1;
  if (v9 >= v11)
    v12 = -1;
  if (v9 == v11)
    v13 = 0;
  else
    v13 = v12;

  return v13;
}

void __49__VSMobileAssetsManager_preinstallAssetsMetadata__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0C99D80];
  +[VSMobileAssetsManager preinstallAssetsDirectory](VSMobileAssetsManager, "preinstallAssetsDirectory");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("preinstall_metadata.plist"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dictionaryWithContentsOfFile:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)preinstallAssetsMetadata___preinstallAssetsMetadata;
  preinstallAssetsMetadata___preinstallAssetsMetadata = v2;

}

uint64_t __59__VSMobileAssetsManager_migrateAssetIfNeededWithAssetType___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a2 == 2)
  {
    v2 = result;
    v3 = MEMORY[0x1DF0E8D30](*(_QWORD *)(result + 32));
    VSGetLogEvent();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v6 = *(_QWORD *)(v2 + 32);
        MEMORY[0x1DF0E8D54](v3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412546;
        v10 = v6;
        v11 = 2112;
        v12 = v7;
        _os_log_error_impl(&dword_1DE15E000, v5, OS_LOG_TYPE_ERROR, "#MobileAsset migrate '%@', error: %@", (uint8_t *)&v9, 0x16u);

      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(v2 + 32);
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_1DE15E000, v5, OS_LOG_TYPE_DEFAULT, "#MobileAsset migrate '%@', success", (uint8_t *)&v9, 0xCu);
    }

    return objc_msgSend(*(id *)(v2 + 40), "downloadCatalog:options:completion:", *(_QWORD *)(v2 + 32), 0, 0);
  }
  return result;
}

+ (id)preinstallAssetsDirectory
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.voiceservices"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundlePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("TTSResources/PreinstallAssets/"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)queryForVoiceResourceAsset:(id)a3 returnTypes:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4E050]), "initWithType:", CFSTR("com.apple.MobileAsset.VoiceServices.VoiceResources"));
  objc_msgSend(v6, "returnTypes:", a4);
  objc_msgSend(v5, "compatibilityVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *MEMORY[0x1E0D4DEE0];
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "compatibilityVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%d"), objc_msgSend(v10, "intValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addKeyValuePair:with:", v8, v11);

  }
  objc_msgSend(v5, "masteredVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = *MEMORY[0x1E0D4DF08];
    objc_msgSend(v5, "masteredVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addKeyValuePair:with:", v13, v14);

  }
  objc_msgSend(v5, "languages");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    objc_msgSend(v6, "addKeyValuePair:with:", CFSTR("Languages"), v16);

  return v6;
}

+ (id)downloadOptionsWithBattery:(BOOL)a3
{
  _BOOL4 v3;
  id v4;
  void *v5;
  _BOOL8 v6;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0D4E088]);
  +[VSSpeechInternalSettings standardInstance](VSSpeechInternalSettings, "standardInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = !v3;
  objc_msgSend(v4, "setDiscretionary:", v6 & (objc_msgSend(v5, "defaultToNonDiscretionaryDownloads") ^ 1));

  objc_msgSend(v4, "setRequiresPowerPluggedIn:", v6);
  return v4;
}

+ (id)voiceResourceFromAsset:(id)a3
{
  id v3;
  VSVoiceResourceAsset *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(VSVoiceResourceAsset);
    -[VSAssetBase setStorage:](v4, "setStorage:", 2);
    objc_msgSend(v3, "attributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSAssetBase setBundleIdentifier:](v4, "setBundleIdentifier:", CFSTR("com.apple.MobileAsset.VoiceServices.VoiceResources"));
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D4DF08]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSAssetBase setMasteredVersion:](v4, "setMasteredVersion:", v6);

    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D4DEE8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSAssetBase setContentVersion:](v4, "setContentVersion:", v7);

    +[VSVoiceAsset compatibilityVersionFromMobileAssetAttributes:](VSVoiceAsset, "compatibilityVersionFromMobileAssetAttributes:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSAssetBase setCompatibilityVersion:](v4, "setCompatibilityVersion:", v8);

    +[VSVoiceAsset languagesFromMobileAssetAttributes:](VSVoiceAsset, "languagesFromMobileAssetAttributes:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSVoiceResourceAsset setLanguages:](v4, "setLanguages:", v9);

    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D4DEF8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSAssetBase setDownloadSize:](v4, "setDownloadSize:", v10);

    if (objc_msgSend(v3, "wasLocal"))
    {
      objc_msgSend(v3, "getLocalFileUrl");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSVoiceResourceAsset setSearchPathURL:](v4, "setSearchPathURL:", v11);

    }
    -[VSAssetBase setIsPurgeable:](v4, "setIsPurgeable:", objc_msgSend(v3, "wasPurgeable"));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)pickCorrectAssetFromLocalAssets:(id)a3
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v14[16];

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    +[VSSpeechInternalSettings standardInstance](VSSpeechInternalSettings, "standardInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "disableDeviceNeuralTTS");

    if (v5)
    {
      VSGetLogDefault();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1DE15E000, v6, OS_LOG_TYPE_DEFAULT, "Ignoring all neural voices due to disableDeviceNeuralTTS", v14, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_385);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "filteredArrayUsingPredicate:", v7);
      v8 = objc_claimAutoreleasedReturnValue();

      v3 = (id)v8;
    }
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_386);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "filteredArrayUsingPredicate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "sortedArrayUsingComparator:", &__block_literal_global_388);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v10;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)getLatestAssetFromArray:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_396);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)isVoiceAssetWellDefined:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  uint64_t v8;

  v3 = a3;
  if (!objc_msgSend(v3, "type"))
    goto LABEL_9;
  objc_msgSend(v3, "languages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
    goto LABEL_9;
  if (objc_msgSend(v3, "type") != 1)
  {
    objc_msgSend(v3, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {

LABEL_8:
      v6 = objc_msgSend(v3, "footprint") != 0;
      goto LABEL_10;
    }
    v8 = objc_msgSend(v3, "gender");

    if (v8)
      goto LABEL_8;
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  v6 = 1;
LABEL_10:

  return v6;
}

uint64_t __49__VSMobileAssetsManager_getLatestAssetFromArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D4DEE8];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D4DEE8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");

  if (v10 == v12)
  {
    if ((objc_msgSend(v4, "wasLocal") & 1) != 0)
      v13 = 1;
    else
      v13 = objc_msgSend(v5, "wasLocal") << 63 >> 63;
  }
  else if (v10 > v12)
  {
    v13 = 1;
  }
  else
  {
    v13 = -1;
  }

  return v13;
}

uint64_t __57__VSMobileAssetsManager_pickCorrectAssetFromLocalAssets___block_invoke_387(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a2, "preferenceScore");
  v6 = v5;
  objc_msgSend(v4, "preferenceScore");
  v8 = v7;

  if (v6 >= v8)
    return 1;
  else
    return -1;
}

uint64_t __57__VSMobileAssetsManager_pickCorrectAssetFromLocalAssets___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  int v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "voiceData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  if (v4 == 4
    && (objc_msgSend(v2, "voicePath"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = +[VSNeuralTTSUtils shouldUseNeuralVoice:](VSNeuralTTSUtils, "shouldUseNeuralVoice:", v5),
        v5,
        !v6))
  {
    VSGetLogDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v2, "key");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = +[VSUtilities isH12Platform](VSUtilities, "isH12Platform");
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "thermalState");
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138413058;
      v16 = v9;
      v17 = 1024;
      v18 = v10;
      v19 = 1024;
      v20 = v12;
      v21 = 1024;
      v22 = objc_msgSend(v13, "isLowPowerModeEnabled");
      _os_log_impl(&dword_1DE15E000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring neural voice %@. Current states as H12 platform: %{BOOL}d, thermal state:%d, low power enabled:%{BOOL}d", (uint8_t *)&v15, 0x1Eu);

    }
    v7 = 0;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

BOOL __57__VSMobileAssetsManager_pickCorrectAssetFromLocalAssets___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "voiceData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type") != 4;

  return v3;
}

void __89__VSMobileAssetsManager_queryForLanguage_forType_voiceName_gender_footprint_returnTypes___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  int64_t v6;
  int64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 7);
  v1 = (void *)queryForLanguage_forType_voiceName_gender_footprint_returnTypes__customVersions;
  queryForLanguage_forType_voiceName_gender_footprint_returnTypes__customVersions = v0;

  v2 = -7;
  do
  {
    v3 = (void *)queryForLanguage_forType_voiceName_gender_footprint_returnTypes__customVersions;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v2 + 8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
  while (!__CFADD__(v2++, 1));
  v6 = +[VSSpeechEngine engineMinimumCompatibility](VSSpeechEngine, "engineMinimumCompatibility");
  v7 = +[VSSpeechEngine engineCurrentCompatibility](VSSpeechEngine, "engineCurrentCompatibility");
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7 - v6 + 1);
  v9 = (void *)queryForLanguage_forType_voiceName_gender_footprint_returnTypes__gryphonVersions;
  queryForLanguage_forType_voiceName_gender_footprint_returnTypes__gryphonVersions = v8;

  if (v7 >= v6)
  {
    do
    {
      v10 = (void *)queryForLanguage_forType_voiceName_gender_footprint_returnTypes__gryphonVersions;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);

      ++v6;
    }
    while (v7 + 1 != v6);
  }
}

void __38__VSMobileAssetsManager_sharedManager__block_invoke()
{
  VSMobileAssetsManager *v0;
  void *v1;

  v0 = objc_alloc_init(VSMobileAssetsManager);
  v1 = (void *)sharedManager___sharedManager;
  sharedManager___sharedManager = (uint64_t)v0;

}

@end
