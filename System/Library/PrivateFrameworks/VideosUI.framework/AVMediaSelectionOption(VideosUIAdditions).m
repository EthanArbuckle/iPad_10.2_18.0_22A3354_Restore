@implementation AVMediaSelectionOption(VideosUIAdditions)

- (id)vui_localizedDisplayNameOverride
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v25;
  void *v26;
  void *v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", *MEMORY[0x1E0C8AA98], *MEMORY[0x1E0C8A9E8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C8B220];
  objc_msgSend(a1, "commonMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadataItemsFromArray:filteredByIdentifier:", v4, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
  }
  else
  {
    v25 = v5;
    v26 = v2;
    objc_msgSend(a1, "extendedLanguageTag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    +[VUIFeaturesConfiguration sharedInstance](VUIFeaturesConfiguration, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nowPlayingConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mediaCharacteristicsToLocalize");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v10;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v11)
    {
      v12 = v11;
      v27 = 0;
      v13 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v30 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          if (objc_msgSend(a1, "hasMediaCharacteristic:", v15))
          {
            v16 = v15;
            if (objc_msgSend(v7, "length"))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v16, v7);
              v17 = objc_claimAutoreleasedReturnValue();

              v16 = (id)v17;
            }
            if (objc_msgSend(v16, "length"))
            {
              +[VUIFeaturesConfiguration sharedInstance](VUIFeaturesConfiguration, "sharedInstance");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "nowPlayingConfig");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "mediaLocalizationKeyMapping");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "objectForKey:", v16);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v21, "length"))
              {
                +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "localizedStringForKey:", v21);
                v23 = objc_claimAutoreleasedReturnValue();

                v27 = (void *)v23;
              }

            }
          }
        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v12);
    }
    else
    {
      v27 = 0;
    }

    v5 = v25;
    v2 = v26;
    v6 = v27;
  }

  return v6;
}

@end
