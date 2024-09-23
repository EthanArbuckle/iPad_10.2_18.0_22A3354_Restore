@implementation PUCurationImportSourceBrowserDebugViewController

- (void)viewDidLoad
{
  void *v3;
  PUCurationImportSourceAssetBrowserDebugViewController *v4;
  void *v5;
  PUCurationImportSourceAssetBrowserDebugViewController *v6;
  PUCurationImportSourceAssetBrowserDebugViewController *assetCollectionViewController;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUCurationImportSourceBrowserDebugViewController;
  -[PUCurationImportSourceBrowserDebugViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[PUCurationImportSourceBrowserDebugViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInterfaceIdiom");
  objc_opt_class();

  v4 = [PUCurationImportSourceAssetBrowserDebugViewController alloc];
  v5 = (void *)objc_opt_new();
  v6 = -[PUPhotosAlbumViewController initWithSpec:](v4, "initWithSpec:", v5);
  assetCollectionViewController = self->_assetCollectionViewController;
  self->_assetCollectionViewController = v6;

  -[PUCurationImportSourceBrowserDebugViewController _fetchImportSources](self, "_fetchImportSources");
}

- (void)_fetchImportSources
{
  NSMutableDictionary *v3;
  NSMutableDictionary *assetsByImportSource;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
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
  uint64_t v25;
  void *context;
  void *v27;
  id obj;
  _QWORD block[5];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _QWORD v39[2];
  _BYTE v40[128];
  _QWORD v41[4];

  v41[1] = *MEMORY[0x1E0C80C00];
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  assetsByImportSource = self->_assetsByImportSource;
  self->_assetsByImportSource = v3;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v41[0] = *MEMORY[0x1E0CD19D0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFetchPropertySets:", v7);

  objc_msgSend(v6, "setChunkSizeForFetch:", 500);
  v27 = v6;
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x1AF42B2C0]();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v35;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v35 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x1AF42B2C0](v9);
        objc_msgSend(v13, "importProperties", context);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v15, "importedBy"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_assetsByImportSource, "objectForKeyedSubscript:", v16);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_assetsByImportSource, "setObject:forKeyedSubscript:", v17, v16);
        }
        objc_msgSend(v17, "addObject:", v13);

        objc_autoreleasePoolPop(v14);
        ++v12;
      }
      while (v10 != v12);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      v10 = v9;
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v18;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_assetsByImportSource, "objectEnumerator");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v31;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v31 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v25++), "sortUsingDescriptors:", v20, context);
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v23);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__PUCurationImportSourceBrowserDebugViewController__fetchImportSources__block_invoke;
  block[3] = &unk_1E58ABD10;
  block[4] = self;
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
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a4, "item", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_assetsByImportSource, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "integerValue");
  PHAssetImportSourceDescription();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssets:title:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CD14E0];
  v15[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transientCollectionListWithCollections:title:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosAlbumViewController setAssetCollection:fetchResultContainingAssetCollection:filterPredicate:](self->_assetCollectionViewController, "setAssetCollection:fetchResultContainingAssetCollection:filterPredicate:", v8, v13, 0);
  -[PUCurationImportSourceAssetBrowserDebugViewController setImportSourceName:](self->_assetCollectionViewController, "setImportSourceName:", v7);
  -[PUCurationImportSourceBrowserDebugViewController navigationController](self, "navigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pushViewController:animated:", self->_assetCollectionViewController, 1);

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
  return 10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  PUCurationImportSourceBrowserDebugViewCell *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("ImportSourceBrowserDebugTableViewCellIdentifier"));
  v7 = (PUCurationImportSourceBrowserDebugViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = -[PUCurationImportSourceBrowserDebugViewCell initWithStyle:reuseIdentifier:]([PUCurationImportSourceBrowserDebugViewCell alloc], "initWithStyle:reuseIdentifier:", 3, CFSTR("ImportSourceBrowserDebugTableViewCellIdentifier"));
    -[PUCurationImportSourceBrowserDebugViewCell detailTextLabel](v7, "detailTextLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNumberOfLines:", 1);

    -[PUCurationImportSourceBrowserDebugViewCell detailTextLabel](v7, "detailTextLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLineBreakMode:", 0);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "item"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_assetsByImportSource, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "integerValue");
  PHAssetImportSourceDescription();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%lu)"), v12, objc_msgSend(v11, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCurationImportSourceBrowserDebugViewCell setImportSourceName:](v7, "setImportSourceName:", v12);
  -[PUCurationImportSourceBrowserDebugViewCell textLabel](v7, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v13);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollectionViewController, 0);
  objc_storeStrong((id *)&self->_assetsByImportSource, 0);
}

void __71__PUCurationImportSourceBrowserDebugViewController__fetchImportSources__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

@end
