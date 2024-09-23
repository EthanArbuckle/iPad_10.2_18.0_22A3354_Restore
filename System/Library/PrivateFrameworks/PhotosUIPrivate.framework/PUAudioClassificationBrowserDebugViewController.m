@implementation PUAudioClassificationBrowserDebugViewController

- (void)viewDidLoad
{
  void *v3;
  PUAudioClassificationAssetBrowserDebugViewController *v4;
  void *v5;
  PUAudioClassificationAssetBrowserDebugViewController *v6;
  PUAudioClassificationAssetBrowserDebugViewController *assetCollectionViewController;
  NSArray *audioClassificationNames;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUAudioClassificationBrowserDebugViewController;
  -[PUAudioClassificationBrowserDebugViewController viewDidLoad](&v9, sel_viewDidLoad);
  -[PUAudioClassificationBrowserDebugViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInterfaceIdiom");
  objc_opt_class();

  v4 = [PUAudioClassificationAssetBrowserDebugViewController alloc];
  v5 = (void *)objc_opt_new();
  v6 = -[PUPhotosAlbumViewController initWithSpec:](v4, "initWithSpec:", v5);
  assetCollectionViewController = self->_assetCollectionViewController;
  self->_assetCollectionViewController = v6;

  audioClassificationNames = self->_audioClassificationNames;
  self->_audioClassificationNames = (NSArray *)&unk_1E59BA738;

  -[PUAudioClassificationBrowserDebugViewController _fetchAudioClassifications](self, "_fetchAudioClassifications");
}

- (void)_fetchAudioClassifications
{
  NSMutableDictionary *v3;
  NSMutableDictionary *assetsByAudioClassificationName;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *context;
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  void *v40;
  PUAudioClassificationBrowserDebugViewController *v41;
  _QWORD block[5];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _QWORD v56[2];
  _BYTE v57[128];
  _BYTE v58[128];
  _QWORD v59[4];

  v59[1] = *MEMORY[0x1E0C80C00];
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  assetsByAudioClassificationName = self->_assetsByAudioClassificationName;
  v41 = self;
  self->_assetsByAudioClassificationName = v3;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v59[0] = *MEMORY[0x1E0CD19F0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFetchPropertySets:", v7);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(mediaSubtypes & %d) != 0"), 8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v8);

  objc_msgSend(v6, "setChunkSizeForFetch:", 500);
  v36 = v6;
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x1AF42B2C0]();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v10 = v9;
  v39 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
  if (v39)
  {
    v11 = *(_QWORD *)v52;
    v37 = *(_QWORD *)v52;
    v38 = v10;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v52 != v11)
          objc_enumerationMutation(v10);
        v13 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x1AF42B2C0]();
        objc_msgSend(v13, "mediaAnalysisProperties");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "mediaAnalysisTimeStamp");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          v26 = CFSTR("Unanalyzed");
LABEL_24:
          -[NSMutableDictionary objectForKeyedSubscript:](v41->_assetsByAudioClassificationName, "objectForKeyedSubscript:", v26);
          v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
          if (!v19)
          {
            v19 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v41->_assetsByAudioClassificationName, "setObject:forKeyedSubscript:", v19, v26);
          }
          -[NSArray addObject:](v19, "addObject:", v13);
          goto LABEL_27;
        }
        v40 = v14;
        v17 = objc_msgSend(v15, "audioClassification");
        if (!v17)
        {
          v26 = CFSTR("No Audio Classification");
          goto LABEL_24;
        }
        LOWORD(v18) = v17;
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v19 = v41->_audioClassificationNames;
        v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v48;
LABEL_10:
          v23 = 0;
          while (1)
          {
            if (*(_QWORD *)v48 != v22)
              objc_enumerationMutation(v19);
            if ((v18 & 1) != 0)
            {
              v24 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v23);
              -[NSMutableDictionary objectForKeyedSubscript:](v41->_assetsByAudioClassificationName, "objectForKeyedSubscript:", v24);
              v25 = (id)objc_claimAutoreleasedReturnValue();
              if (!v25)
              {
                v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                -[NSMutableDictionary setObject:forKeyedSubscript:](v41->_assetsByAudioClassificationName, "setObject:forKeyedSubscript:", v25, v24);
              }
              objc_msgSend(v25, "addObject:", v13);

            }
            if ((unsigned __int16)v18 < 2u)
              break;
            v18 = (__int16)v18 >> 1;
            if (v21 == ++v23)
            {
              v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
              if (v21)
                goto LABEL_10;
              break;
            }
          }
          v11 = v37;
          v10 = v38;
        }
        v14 = v40;
LABEL_27:

        objc_autoreleasePoolPop(v14);
      }
      v39 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
    }
    while (v39);
  }

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v27;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[NSMutableDictionary objectEnumerator](v41->_assetsByAudioClassificationName, "objectEnumerator");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v44 != v33)
          objc_enumerationMutation(v30);
        objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * j), "sortUsingDescriptors:", v29);
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
    }
    while (v32);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__PUAudioClassificationBrowserDebugViewController__fetchAudioClassifications__block_invoke;
  block[3] = &unk_1E58ABD10;
  block[4] = v41;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_autoreleasePoolPop(context);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[NSArray objectAtIndexedSubscript:](self->_audioClassificationNames, "objectAtIndexedSubscript:", objc_msgSend(a4, "item", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_assetsByAudioClassificationName, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssets:title:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CD14E0];
  v14[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transientCollectionListWithCollections:title:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosAlbumViewController setAssetCollection:fetchResultContainingAssetCollection:filterPredicate:](self->_assetCollectionViewController, "setAssetCollection:fetchResultContainingAssetCollection:filterPredicate:", v7, v12, 0);
  -[PUAudioClassificationAssetBrowserDebugViewController setAudioClassificationName:](self->_assetCollectionViewController, "setAudioClassificationName:", v5);
  -[PUAudioClassificationBrowserDebugViewController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pushViewController:animated:", self->_assetCollectionViewController, 1);

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 40.0;
}

- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_audioClassificationNames, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  PUAudioClassificationBrowserDebugViewCell *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("AudioClassificationBrowserDebugTableViewCellIdentifier"));
  v7 = (PUAudioClassificationBrowserDebugViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = -[PUAudioClassificationBrowserDebugViewCell initWithStyle:reuseIdentifier:]([PUAudioClassificationBrowserDebugViewCell alloc], "initWithStyle:reuseIdentifier:", 3, CFSTR("AudioClassificationBrowserDebugTableViewCellIdentifier"));
    -[PUAudioClassificationBrowserDebugViewCell detailTextLabel](v7, "detailTextLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNumberOfLines:", 1);

    -[PUAudioClassificationBrowserDebugViewCell detailTextLabel](v7, "detailTextLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLineBreakMode:", 0);

  }
  -[NSArray objectAtIndexedSubscript:](self->_audioClassificationNames, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_assetsByAudioClassificationName, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%lu)"), v10, objc_msgSend(v11, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAudioClassificationBrowserDebugViewCell setAudioClassificationName:](v7, "setAudioClassificationName:", v10);
  -[PUAudioClassificationBrowserDebugViewCell textLabel](v7, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollectionViewController, 0);
  objc_storeStrong((id *)&self->_assetsByAudioClassificationName, 0);
  objc_storeStrong((id *)&self->_audioClassificationNames, 0);
}

void __77__PUAudioClassificationBrowserDebugViewController__fetchAudioClassifications__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

@end
