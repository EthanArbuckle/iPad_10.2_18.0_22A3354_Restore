@implementation SearchUIShowPhotosOneUpViewHandler

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v7 = a5;
  +[SearchUIPhotosOneUpController sharedController](SearchUIPhotosOneUpController, "sharedController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SearchUICommandHandler rowModel](self, "rowModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentOneUpViewForRowModel:triggerEvent:environment:", v8, a4, v7);

}

- (id)createViewControllerForCommand:(id)a3 environment:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  +[SearchUIPhotosOneUpController sharedController](SearchUIPhotosOneUpController, "sharedController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICommandHandler rowModel](self, "rowModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "previewViewControllerForRowModel:environment:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)supportsCopy
{
  return 1;
}

- (id)additionalActionMenuItems
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
  _QWORD v16[4];
  id v17;
  id v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  -[SearchUICommandHandler command](self, "command");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_matchedPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photosIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "photosIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "photosLibraryImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIPhotosUtilities fetchResultForPersonIdentifiers:isSyndicated:](SearchUIPhotosUtilities, "fetchResultForPersonIdentifiers:isSyndicated:", v6, objc_msgSend(v7, "isSyndicated"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D7B6E0], "notThisPersonLocalizedTitleForPerson:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D7B6E0], "notThisPersonSystemImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0DC3428];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __63__SearchUIShowPhotosOneUpViewHandler_additionalActionMenuItems__block_invoke;
    v16[3] = &unk_1EA1F69D8;
    v17 = v2;
    v18 = v3;
    objc_msgSend(v12, "actionWithTitle:image:identifier:handler:", v10, v11, 0, v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAttributes:", 2);
    v19 = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v14;
}

void __63__SearchUIShowPhotosOneUpViewHandler_additionalActionMenuItems__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "photosLibraryImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIImage imageWithSFImage:](SearchUIPhotosLibraryImage, "imageWithSFImage:", v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "rejectPerson:", *(_QWORD *)(a1 + 40));
}

- (id)itemProvider
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
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[SearchUICommandHandler command](self, "command");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photosLibraryImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[SearchUIPhotosOneUpController sharedController](SearchUIPhotosOneUpController, "sharedController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWithCoreSpotlightIdentifiers:currentCorespotlightIdentifier:", v6, v4);

  objc_msgSend(v5, "activeDataSourceManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photosDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "indexPathForFirstAsset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assetAtIndexPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    PUItemProviderForAsset();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)useSourceViewAsPreviewForDragging
{
  return 1;
}

- (unint64_t)destination
{
  return 3;
}

+ (id)matchedSceneIdentifiersForCommand:(id)a3 andType:(int)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v5, "matchedScenes", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "sceneType") == a4)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v12, "sceneIdentifier"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v13);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  v14 = (void *)objc_msgSend(v6, "copy");
  return v14;
}

+ (id)matchedPersonLocalIdentifiersForCommand:(id)a3
{
  id v3;
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
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "matchedPeople");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "photosIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "photosIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  v13 = (void *)objc_msgSend(v4, "copy");

  return v13;
}

@end
