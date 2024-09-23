@implementation PUCurationLocationBrowserViewController

- (PUCurationLocationBrowserViewController)initWithScoreConfiguration:(id)a3
{
  id v4;
  PUCurationLocationBrowserViewController *v5;
  void *v6;
  void *v7;
  PUCurationAssetBrowserViewController *v8;
  void *v9;
  PUCurationAssetBrowserViewController *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PUCurationLocationBrowserViewController;
  v5 = -[PUCurationLocationBrowserViewController init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCurationLocationBrowserViewController setTitle:](v5, "setTitle:", v6);

    -[PUCurationLocationBrowserViewController px_extendedTraitCollection](v5, "px_extendedTraitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userInterfaceIdiom");
    objc_opt_class();

    v8 = [PUCurationAssetBrowserViewController alloc];
    v9 = (void *)objc_opt_new();
    v10 = -[PUPhotosAlbumViewController initWithSpec:](v8, "initWithSpec:", v9);
    -[PUCurationLocationBrowserViewController setAssetBrowserViewController:](v5, "setAssetBrowserViewController:", v10);

    -[PUCurationLocationBrowserViewController setScoreConfiguration:](v5, "setScoreConfiguration:", v4);
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_systemPhotoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCurationLocationBrowserViewController setPhotoLibrary:](v5, "setPhotoLibrary:", v11);

  }
  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  NSArray *v4;
  NSArray *availableLocations;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUCurationLocationBrowserViewController;
  -[PUCurationLocationBrowserViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[PUCurationLocationBrowserViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("locationCellIdentifier"));

  -[PUCurationLocationBrowserViewController geoHashContainers](self, "geoHashContainers");
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  availableLocations = self->_availableLocations;
  self->_availableLocations = v4;

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[PUCurationLocationBrowserViewController availableLocations](self, "availableLocations", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("locationCellIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCurationLocationBrowserViewController availableLocations](self, "availableLocations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v10, "geoHash");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cityName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@, %@, %ld assets"), v12, v13, objc_msgSend(v10, "assetCount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v14);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a4;
  -[PUCurationLocationBrowserViewController availableLocations](self, "availableLocations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndex:", v7);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[PUCurationLocationBrowserViewController assetBrowserViewController](self, "assetBrowserViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCurationLocationBrowserViewController scoreConfiguration](self, "scoreConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "assetUUIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setScoreConfiguration:forAssetUUIDs:", v9, v10);

  -[PUCurationLocationBrowserViewController navigationController](self, "navigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCurationLocationBrowserViewController assetBrowserViewController](self, "assetBrowserViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pushViewController:animated:", v12, 1);

}

- (id)geoHashContainers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  PUCurationGeoHashContainer *v11;
  void *v12;
  PUCurationGeoHashContainer *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[2];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PUCurationLocationBrowserViewController assetUUIDsByGeoHash](self, "assetUUIDsByGeoHash");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[PUCurationLocationBrowserViewController cityNameForGeoHashWithAsseUUIDsByGeoHash:](self, "cityNameForGeoHashWithAsseUUIDsByGeoHash:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allKeys");
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v21 != v7)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v4, "objectForKeyedSubscript:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = [PUCurationGeoHashContainer alloc];
          objc_msgSend(v3, "objectForKeyedSubscript:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[PUCurationGeoHashContainer initWithGeoHash:assetUUIDs:cityName:](v11, "initWithGeoHash:assetUUIDs:cityName:", v9, v12, v10);

          if (-[PUCurationGeoHashContainer assetCount](v13, "assetCount") >= 1)
            objc_msgSend(v19, "addObject:", v13);

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v6);
    }
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("assetCount"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v14;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("geoHash"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "sortUsingDescriptors:", v16);
  }

  return v19;
}

- (id)cityNameForGeoHashWithAsseUUIDsByGeoHash:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  uint64_t v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v8 = v6;
  v9 = v5;
  obj = v8;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v41 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "firstObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_msgSend(v9, "addObject:", v16);
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v16);
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v11);
  }
  v34 = v4;

  v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PUCurationLocationBrowserViewController photoLibrary](self, "photoLibrary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "librarySpecificFetchOptions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = *MEMORY[0x1E0CD1A30];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFetchPropertySets:", v20);

  v32 = v19;
  v33 = v9;
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v9, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v37 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
        objc_msgSend(v26, "localizedGeoDescription");
        v27 = objc_claimAutoreleasedReturnValue();
        if (v27)
          v28 = (__CFString *)v27;
        else
          v28 = CFSTR("City Unavailable");
        objc_msgSend(v26, "uuid");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "setObject:forKeyedSubscript:", v28, v30);
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v23);
  }

  return v17;
}

- (id)assetUUIDsByGeoHash
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v28;
  NSObject *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  id v36;
  uint8_t v37[128];
  uint8_t buf[4];
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PUCurationLocationBrowserViewController photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoAnalysisClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0;
  objc_msgSend(v5, "requestGeoHashForAssetLocalIdentifiers:geoHashSize:error:", 0, CFSTR("6"), &v36);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v36;
  if (PULocationBrowserLog_onceToken != -1)
    dispatch_once(&PULocationBrowserLog_onceToken, &__block_literal_global_89530);
  v8 = (id)PULocationBrowserLog_log;
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v7;
      _os_log_error_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_ERROR, "Error requesting for geoHash for assetLocalIdentifiers: %@", buf, 0xCu);
    }
    v10 = v3;
  }
  else
  {
    v35 = 0;
    objc_msgSend(v5, "requestIconicSceneScoreForAssetLocalIdentifiers:error:", MEMORY[0x1E0C9AA60], &v35);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v35;
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v7;
        _os_log_error_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_ERROR, "Error requesting for iconicScore for assetLocalIdentifiers: %@", buf, 0xCu);
      }
      v12 = v3;
    }
    else
    {
      -[PUCurationLocationBrowserViewController scoreConfiguration](self, "scoreConfiguration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "dataType");

      objc_msgSend(MEMORY[0x1E0D77EE0], "scoreConfigurationNamePrefixForDataType:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[PUCurationLocationBrowserViewController saveToPlistForScoreDictionary:dataType:](self, "saveToPlistForScoreDictionary:dataType:", v11, v14)&& os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v15;
        _os_log_error_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_ERROR, "Fail to save plist %@ for iconicScore", buf, 0xCu);
      }
      if (objc_msgSend(v6, "count") && objc_msgSend(v11, "count"))
      {
        v28 = v15;
        v29 = v9;
        v30 = v5;
        objc_msgSend(v6, "allKeys");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v32;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v32 != v19)
                objc_enumerationMutation(v16);
              v21 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
              objc_msgSend(v6, "objectForKeyedSubscript:", v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "objectForKeyedSubscript:", v21);
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              if (v23)
              {
                objc_msgSend(v3, "objectForKeyedSubscript:", v22);
                v24 = (id)objc_claimAutoreleasedReturnValue();
                if (!v24)
                {
                  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, v22);
                }
                objc_msgSend(v24, "addObject:", v21);

              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
          }
          while (v18);
        }
        v25 = v3;

        v7 = 0;
        v5 = v30;
        v15 = v28;
        v9 = v29;
      }
      else
      {
        v26 = v3;
      }

    }
  }

  return v3;
}

- (BOOL)saveToPlistForScoreDictionary:(id)a3 dataType:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0D77EE0];
  v7 = a3;
  -[PUCurationLocationBrowserViewController photoLibrary](self, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "plistPathForPhotoLibrary:dataType:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v8) = objc_msgSend(v7, "writeToFile:atomically:", v9, 1);
  return (char)v8;
}

- (NSArray)availableLocations
{
  return self->_availableLocations;
}

- (void)setAvailableLocations:(id)a3
{
  objc_storeStrong((id *)&self->_availableLocations, a3);
}

- (PNScoreConfiguration)scoreConfiguration
{
  return self->_scoreConfiguration;
}

- (void)setScoreConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_scoreConfiguration, a3);
}

- (PUCurationAssetBrowserViewController)assetBrowserViewController
{
  return self->_assetBrowserViewController;
}

- (void)setAssetBrowserViewController:(id)a3
{
  objc_storeStrong((id *)&self->_assetBrowserViewController, a3);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setPhotoLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_photoLibrary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_assetBrowserViewController, 0);
  objc_storeStrong((id *)&self->_scoreConfiguration, 0);
  objc_storeStrong((id *)&self->_availableLocations, 0);
}

@end
