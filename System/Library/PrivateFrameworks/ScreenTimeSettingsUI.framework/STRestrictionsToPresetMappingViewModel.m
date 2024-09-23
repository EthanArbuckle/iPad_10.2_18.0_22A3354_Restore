@implementation STRestrictionsToPresetMappingViewModel

+ (id)presetKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__STRestrictionsToPresetMappingViewModel_presetKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (presetKeys_onceToken != -1)
    dispatch_once(&presetKeys_onceToken, block);
  return (id)presetKeys_presetKeys;
}

void __52__STRestrictionsToPresetMappingViewModel_presetKeys__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("system.ratings.ratingTVShows"), CFSTR("system.ratings.ratingApps"), CFSTR("system.ratings.ratingMovies"), CFSTR("STCustomRestrictionConfiguration.STCustomRestrictionWebFilterState"), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)presetKeys_presetKeys;
  presetKeys_presetKeys = v2;

  v4 = (void *)presetKeys_presetKeys;
  objc_msgSend(*(id *)(a1 + 32), "BOOLPresetKeys");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setByAddingObjectsFromSet:", v7);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)presetKeys_presetKeys;
  presetKeys_presetKeys = v5;

}

+ (id)BOOLPresetKeys
{
  if (BOOLPresetKeys_onceToken != -1)
    dispatch_once(&BOOLPresetKeys_onceToken, &__block_literal_global_22);
  return (id)BOOLPresetKeys_BOOLPresetKeys;
}

void __56__STRestrictionsToPresetMappingViewModel_BOOLPresetKeys__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("media.settings.allowBookstoreErotica"), CFSTR("system.ratings.allowExplicitContent"), CFSTR("system.music.allowMusicVideos"), CFSTR("system.music.allowMusicArtistActivity"), CFSTR("system.siri.allowAssistantUserGeneratedContent"), CFSTR("system.siri.forceAssistantProfanityFilter"), CFSTR("application.store.allowAppRemoval"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)BOOLPresetKeys_BOOLPresetKeys;
  BOOLPresetKeys_BOOLPresetKeys = v0;

}

- (STRestrictionsToPresetMappingViewModel)initWithRestrictionsDataSource:(id)a3
{
  STRestrictionsDataSourceProtocol *v4;
  STRestrictionsToPresetMappingViewModel *v5;
  STRestrictionsDataSourceProtocol *restrictionsDataSource;
  objc_super v8;

  v4 = (STRestrictionsDataSourceProtocol *)a3;
  v8.receiver = self;
  v8.super_class = (Class)STRestrictionsToPresetMappingViewModel;
  v5 = -[STRestrictionsToPresetMappingViewModel init](&v8, sel_init);
  restrictionsDataSource = v5->_restrictionsDataSource;
  v5->_restrictionsDataSource = v4;

  return v5;
}

- (void)loadPresetMatchingCurrentRestrictionsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[STRestrictionsToPresetMappingViewModel restrictionsDataSource](self, "restrictionsDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __101__STRestrictionsToPresetMappingViewModel_loadPresetMatchingCurrentRestrictionsWithCompletionHandler___block_invoke;
  v7[3] = &unk_24DB880F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "loadValuesByRestrictionWithCompletionHandler:", v7);

}

void __101__STRestrictionsToPresetMappingViewModel_loadPresetMatchingCurrentRestrictionsWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "_presetForValuesByRestriction:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)_presetForValuesByRestriction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend((id)objc_opt_class(), "presetKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[STRestrictionsToPresetMappingViewModel _restrictionsWithValuesByRestriction:presetKeys:](self, "_restrictionsWithValuesByRestriction:presetKeys:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE30B08]), "initWithValues:", v6);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE30B10]), "initWithIdentifier:configuration:", CFSTR("com.apple.ScreenTime"), v7);
    v9 = objc_alloc(MEMORY[0x24BE30B00]);
    v13[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithIdentifier:minAge:maxAge:sources:", CFSTR("current-preset"), 0, 0, v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_restrictionsWithValuesByRestriction:(id)a3 presetKeys:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v5;
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
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v6, "containsObject:", v13, (_QWORD)v16))
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v13);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  return v7;
}

- (STRestrictionsDataSourceProtocol)restrictionsDataSource
{
  return (STRestrictionsDataSourceProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRestrictionsDataSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictionsDataSource, 0);
}

@end
