@implementation SearchUIPhotosOneUpController

+ (id)sharedController
{
  if (sharedController_onceToken != -1)
    dispatch_once(&sharedController_onceToken, &__block_literal_global_44);
  return (id)sharedController_sharedController;
}

void __49__SearchUIPhotosOneUpController_sharedController__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedController_sharedController;
  sharedController_sharedController = v0;

}

+ (id)corespotlightIdentifierForAsset:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "wellKnownPhotoLibraryIdentifier");

  objc_msgSend(v3, "curationProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "syndicationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == 3 && v7)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(v3, "uuid");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (id)previewViewControllerForRowModel:(id)a3 environment:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  if (-[SearchUIPhotosOneUpController updateWithRowModel:environment:](self, "updateWithRowModel:environment:", a3, v6))
  {
    objc_msgSend(v6, "presentingViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_oneUpPresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "previewViewControllerAllowingActions:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  -[SearchUIPhotosOneUpController setPeekedViewController:](self, "setPeekedViewController:", v9);

  return v9;
}

- (void)presentOneUpViewForRowModel:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a5;
  v9 = v8;
  if (a4 == 6)
  {
    objc_msgSend(v8, "presentingViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "px_oneUpPresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIPhotosOneUpController peekedViewController](self, "peekedViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "commitPreviewViewController:", v12);
LABEL_7:

    goto LABEL_8;
  }
  if (-[SearchUIPhotosOneUpController updateWithRowModel:environment:](self, "updateWithRowModel:environment:", v13, v8))
  {
    objc_msgSend(v9, "feedbackDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "resignTextField");
    objc_msgSend(v9, "presentingViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "px_oneUpPresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startWithConfigurationHandler:", &__block_literal_global_163);
    goto LABEL_7;
  }
LABEL_8:

}

uint64_t __86__SearchUIPhotosOneUpController_presentOneUpViewForRowModel_triggerEvent_environment___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setInteractiveMode:", 0);
}

- (BOOL)updateWithRowModel:(id)a3 environment:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  SearchUIPhotosOneUpController *v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v6 = a4;
  v29 = self;
  -[SearchUIPhotosOneUpController setCommandEnvironment:](self, "setCommandEnvironment:", v6);
  v28 = (void *)objc_opt_new();
  v26 = v6;
  v27 = (void *)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v6, "lastEngagedSection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rowModels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v9)
  {
    v10 = v9;
    v30 = 0;
    v11 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v33 != v11)
          objc_enumerationMutation(v8);
        v13 = *(id *)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v13, "cardSection");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "command");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v16 = v15;
          objc_msgSend(v16, "photosLibraryImage");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "photoIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = objc_msgSend(v18, "length");
          if (v13 == v31 && v19 != 0)
          {
            objc_msgSend(v27, "addObject:", v18);
            objc_msgSend(v28, "setObject:forKeyedSubscript:", v31, v18);
            v21 = v18;

            objc_msgSend(v16, "photosLibraryImage");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[SearchUIPhotosOneUpController setIsSyndicated:](v29, "setIsSyndicated:", objc_msgSend(v22, "isSyndicated"));

            v30 = v21;
          }

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v10);
  }
  else
  {
    v30 = 0;
  }

  -[SearchUIPhotosOneUpController setRowModelsForCorespotlightIdentifiers:](v29, "setRowModelsForCorespotlightIdentifiers:", v28);
  -[SearchUIPhotosOneUpController setActiveDataSourceManager:](v29, "setActiveDataSourceManager:", 0);
  -[SearchUIPhotosOneUpController setNavigatedAssetReference:](v29, "setNavigatedAssetReference:", 0);
  objc_msgSend(v31, "cardSection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "command");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIPhotosOneUpController setCommand:](v29, "setCommand:", v24);

  LOBYTE(v23) = -[SearchUIPhotosOneUpController updateWithCoreSpotlightIdentifiers:currentCorespotlightIdentifier:](v29, "updateWithCoreSpotlightIdentifiers:currentCorespotlightIdentifier:", v27, v30);
  return (char)v23;
}

- (BOOL)updateWithCoreSpotlightIdentifiers:(id)a3 currentCorespotlightIdentifier:(id)a4
{
  id v6;
  _BOOL8 v7;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  _BOOL4 v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  _QWORD v51[4];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  void *v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v50 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v7 = -[SearchUIPhotosOneUpController isSyndicated](self, "isSyndicated");
    +[SearchUIPhotosUtilities fetchResultForPhotoIdentifiers:isSyndicated:](SearchUIPhotosUtilities, "fetchResultForPhotoIdentifiers:isSyndicated:", v6, v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "count"))
    {
      v25 = 0;
LABEL_33:

      goto LABEL_34;
    }
    v9 = (void *)objc_opt_new();
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v8 = v8;
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v57 != v12)
            objc_enumerationMutation(v8);
          v14 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
          objc_msgSend((id)objc_opt_class(), "corespotlightIdentifierForAsset:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, v15);

        }
        v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
      }
      while (v11);
    }

    if ((unint64_t)objc_msgSend(v8, "count") < 2)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", v50);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v26)
        goto LABEL_30;
      v21 = 0;
    }
    else
    {
      v44 = v7;
      v46 = v8;
      v16 = (void *)objc_opt_new();
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v48 = v6;
      v17 = v6;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v53;
        v21 = 0x7FFFFFFFFFFFFFFFLL;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v53 != v20)
              objc_enumerationMutation(v17);
            v23 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
            objc_msgSend(v9, "objectForKeyedSubscript:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
            {
              if (objc_msgSend(v23, "isEqualToString:", v50))
                v21 = objc_msgSend(v16, "count");
              objc_msgSend(v16, "addObject:", v24);
            }

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
        }
        while (v19);
      }
      else
      {
        v21 = 0x7FFFFFFFFFFFFFFFLL;
      }

      +[SearchUIPhotosUtilities sharedPhotoLibraryIsSyndicated:](SearchUIPhotosUtilities, "sharedPhotoLibraryIsSyndicated:", v44);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CD1620]), "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v16, v27, 0, 0, 0, 0);

      v25 = 0;
      v6 = v48;
      if (v21 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_32;
    }
    objc_msgSend(v9, "objectForKeyedSubscript:", v50);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isHidden");

    if ((v29 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:", v8, 0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)MEMORY[0x1E0CD14E0];
      v60 = v47;
      v25 = 1;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "transientCollectionListWithCollections:title:", v31, 0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CD13B8], "fetchCollectionsInCollectionList:options:", v45, 0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B790]), "initWithCollectionListFetchResult:options:", v43, 0);
      v49 = v6;
      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B788]), "initWithPhotosDataSourceConfiguration:", v32);
      v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B6F8]), "initWithPhotosDataSource:", v33);
      -[SearchUIPhotosOneUpController setActiveDataSourceManager:](self, "setActiveDataSourceManager:", v34);

      -[SearchUIPhotosOneUpController activeDataSourceManager](self, "activeDataSourceManager");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "dataSource");
      v36 = v8;
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v51[0] = objc_msgSend(v37, "identifier");
      v51[1] = 0;
      v51[2] = v21;
      v51[3] = 0x7FFFFFFFFFFFFFFFLL;
      objc_msgSend(v37, "assetReferenceAtItemIndexPath:", v51);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIPhotosOneUpController setNavigatedAssetReference:](self, "setNavigatedAssetReference:", v38);

      -[SearchUIPhotosOneUpController commandEnvironment](self, "commandEnvironment");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "presentingViewController");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v40, "px_enableOneUpPresentation");
      objc_msgSend(v40, "px_oneUpPresentation");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setDelegate:", self);

      v8 = v36;
      v6 = v49;

      goto LABEL_32;
    }
LABEL_30:
    v25 = 0;
LABEL_32:

    goto LABEL_33;
  }
  v25 = 0;
LABEL_34:

  return v25;
}

- (id)oneUpPresentationMediaProvider:(id)a3
{
  _BOOL4 v4;
  uint64_t *v5;

  if (oneUpPresentationMediaProvider__onceToken[0] != -1)
    dispatch_once(oneUpPresentationMediaProvider__onceToken, &__block_literal_global_172);
  v4 = -[SearchUIPhotosOneUpController isSyndicated](self, "isSyndicated");
  v5 = &oneUpPresentationMediaProvider__syndicatedMediaProvider;
  if (!v4)
    v5 = &oneUpPresentationMediaProvider__mediaProvider;
  return (id)*v5;
}

void __64__SearchUIPhotosOneUpController_oneUpPresentationMediaProvider___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v0 = objc_alloc(MEMORY[0x1E0D7B768]);
  objc_msgSend(MEMORY[0x1E0CD1488], "defaultManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIPhotosUtilities sharedPhotoLibraryIsSyndicated:](SearchUIPhotosUtilities, "sharedPhotoLibraryIsSyndicated:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v0, "initWithImageManager:library:", v1, v2);
  v4 = (void *)oneUpPresentationMediaProvider__mediaProvider;
  oneUpPresentationMediaProvider__mediaProvider = v3;

  v5 = objc_alloc(MEMORY[0x1E0D7B768]);
  objc_msgSend(MEMORY[0x1E0CD1488], "defaultManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  +[SearchUIPhotosUtilities sharedPhotoLibraryIsSyndicated:](SearchUIPhotosUtilities, "sharedPhotoLibraryIsSyndicated:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "initWithImageManager:library:", v9, v6);
  v8 = (void *)oneUpPresentationMediaProvider__syndicatedMediaProvider;
  oneUpPresentationMediaProvider__syndicatedMediaProvider = v7;

}

- (int64_t)oneUpPresentationOrigin:(id)a3
{
  return 0;
}

- (id)rowModelForAssetReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIPhotosOneUpController rowModelForAsset:](self, "rowModelForAsset:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)rowModelForAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "corespotlightIdentifierForAsset:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUIPhotosOneUpController rowModelsForCorespotlightIdentifiers](self, "rowModelsForCorespotlightIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)oneUpPresentation:(id)a3 scrollAssetReferenceToVisible:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  -[SearchUIPhotosOneUpController rowModelForAssetReference:](self, "rowModelForAssetReference:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SearchUIPhotosOneUpController commandEnvironment](self, "commandEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rowModelViewDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scrollRowModelToVisible:", v7);

}

- (id)oneUpPresentation:(id)a3 regionOfInterestForAssetReference:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[SearchUIPhotosOneUpController viewForAssetReference:](self, "viewForAssetReference:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0D7B890]);
  objc_msgSend(v5, "bounds");
  v7 = (void *)objc_msgSend(v6, "initWithRect:inCoordinateSpace:", v5);
  -[SearchUIPhotosOneUpController imageViewInView:](self, "imageViewInView:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "maskedCorners"))
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v9, "cornerRadius");
    objc_msgSend(v10, "setCornerRadius:");
    objc_msgSend(v10, "setCornerMask:", objc_msgSend(v9, "maskedCorners"));
    objc_msgSend(v9, "cornerCurve");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCornerCurve:", v11);

    objc_msgSend(v7, "setImageViewSpec:", v10);
  }

  return v7;
}

- (id)imageViewInView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v4, "subviews", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          -[SearchUIPhotosOneUpController imageViewInView:](self, "imageViewInView:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v5 = (id)v11;

            goto LABEL_13;
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          continue;
        break;
      }
    }

    v5 = 0;
  }
LABEL_13:

  return v5;
}

- (int64_t)oneUpPresentationActionContext:(id)a3
{
  return 0xFFFFLL;
}

- (id)oneUpPresentationActionManager:(id)a3
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
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc(MEMORY[0x1E0D7B920]);
  -[SearchUIPhotosOneUpController activeDataSourceManager](self, "activeDataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithDataSourceManager:", v5);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B6E0]), "initWithSelectionManager:", v6);
  -[SearchUIPhotosOneUpController command](self, "command");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_matchedPerson");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "photosIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPerformerDelegate:", self);
  if (v10)
  {
    v16[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "photosLibraryImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIPhotosUtilities fetchResultForPersonIdentifiers:isSyndicated:](SearchUIPhotosUtilities, "fetchResultForPersonIdentifiers:isSyndicated:", v11, objc_msgSend(v12, "isSyndicated"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPerson:", v14);

  }
  return v7;
}

- (id)oneUpPresentationMatchedQueryStrings:(id)a3
{
  void *v3;
  void *v4;
  __CFString *v5;
  const __CFString *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[SearchUIPhotosOneUpController commandEnvironment](self, "commandEnvironment", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v6 = &stru_1EA1FB118;
  if (v5)
    v6 = v5;
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)oneUpPresentationMatchedSceneIdentifiers:(id)a3
{
  void *v3;
  void *v4;

  -[SearchUIPhotosOneUpController command](self, "command", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIShowPhotosOneUpViewHandler matchedSceneIdentifiersForCommand:andType:](SearchUIShowPhotosOneUpViewHandler, "matchedSceneIdentifiersForCommand:andType:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)oneUpPresentationMatchedAudioIdentifiers:(id)a3
{
  void *v3;
  void *v4;

  -[SearchUIPhotosOneUpController command](self, "command", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIShowPhotosOneUpViewHandler matchedSceneIdentifiersForCommand:andType:](SearchUIShowPhotosOneUpViewHandler, "matchedSceneIdentifiersForCommand:andType:", v3, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)oneUpPresentationMatchedHumanActionIdentifiers:(id)a3
{
  void *v3;
  void *v4;

  -[SearchUIPhotosOneUpController command](self, "command", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIShowPhotosOneUpViewHandler matchedSceneIdentifiersForCommand:andType:](SearchUIShowPhotosOneUpViewHandler, "matchedSceneIdentifiersForCommand:andType:", v3, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)oneUpPresentationMatchedPersonLocalIdentifiers:(id)a3
{
  void *v3;
  void *v4;

  -[SearchUIPhotosOneUpController command](self, "command", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIShowPhotosOneUpViewHandler matchedPersonLocalIdentifiersForCommand:](SearchUIShowPhotosOneUpViewHandler, "matchedPersonLocalIdentifiersForCommand:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)oneUpPresentation:(id)a3 setHiddenAssetReferences:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[SearchUIPhotosOneUpController hiddenView](self, "hiddenView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 0);

  objc_msgSend(v5, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUIPhotosOneUpController viewForAssetReference:](self, "viewForAssetReference:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setHidden:", 1);
  -[SearchUIPhotosOneUpController setHiddenView:](self, "setHiddenView:", v8);

}

- (id)viewForAssetReference:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SearchUIPhotosOneUpController rowModelForAssetReference:](self, "rowModelForAssetReference:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIPhotosOneUpController commandEnvironment](self, "commandEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rowModelViewDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewForRowModel:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)actionPerformer:(id)a3 didChangeState:(unint64_t)a4
{
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
  id v15;

  if (a4 == 30)
  {
    v5 = a3;
    objc_msgSend(v5, "actionType");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectionSnapshot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[SearchUIPhotosOneUpController rowModelForAsset:](self, "rowModelForAsset:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIPhotosOneUpController commandEnvironment](self, "commandEnvironment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0D7C0F8]))
    {
      objc_msgSend((id)objc_opt_class(), "bundleIdentifierForAsset:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "corespotlightIdentifierForAsset:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
LABEL_13:

        goto LABEL_14;
      }
      if (objc_msgSend(v10, "hasPrefix:", CFSTR("com.apple"))
        && objc_msgSend(v10, "containsString:", CFSTR("FileProvider")))
      {
        v12 = (void *)objc_opt_new();
        objc_msgSend(v12, "setFileProviderIdentifier:", v10);
      }
      else
      {
        v12 = (void *)objc_opt_new();
        objc_msgSend(v12, "setApplicationBundleIdentifier:", v10);
      }
      objc_msgSend(v12, "setCoreSpotlightIdentifier:", v11);
      v13 = (void *)objc_opt_new();
      objc_msgSend(v13, "setCommand:", v12);
      +[SearchUICommandHandler handlerForButton:rowModel:environment:](SearchUICommandHandler, "handlerForButton:rowModel:environment:", v13, v8, v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "executeWithTriggerEvent:", 2);

    }
    else
    {
      if (!objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0D7C0D0]))
      {
LABEL_14:

        return;
      }
      v10 = (void *)objc_opt_new();
      v11 = (void *)objc_opt_new();
      objc_msgSend(v11, "setCommand:", v10);
      +[SearchUICommandHandler handlerForButton:rowModel:environment:](SearchUICommandHandler, "handlerForButton:rowModel:environment:", v11, v8, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "wasPerformedWithTriggerEvent:", 2);
    }

    goto LABEL_13;
  }
}

- (id)undoManagerForActionPerformer:(id)a3
{
  return 0;
}

+ (id)bundleIdentifierForAsset:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "wellKnownPhotoLibraryIdentifier");

  if (v5 == 3)
  {
    objc_msgSend(v3, "curationProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "importedByBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (PXPhotoKitAssetsDataSourceManager)activeDataSourceManager
{
  return self->_activeDataSourceManager;
}

- (void)setActiveDataSourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_activeDataSourceManager, a3);
}

- (PXAssetReference)navigatedAssetReference
{
  return self->_navigatedAssetReference;
}

- (void)setNavigatedAssetReference:(id)a3
{
  objc_storeStrong((id *)&self->_navigatedAssetReference, a3);
}

- (BOOL)isSyndicated
{
  return self->_isSyndicated;
}

- (void)setIsSyndicated:(BOOL)a3
{
  self->_isSyndicated = a3;
}

- (SFShowPhotosOneUpViewCommand)command
{
  return self->_command;
}

- (void)setCommand:(id)a3
{
  objc_storeStrong((id *)&self->_command, a3);
}

- (NSDictionary)rowModelsForCorespotlightIdentifiers
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRowModelsForCorespotlightIdentifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (SearchUICommandEnvironment)commandEnvironment
{
  return (SearchUICommandEnvironment *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCommandEnvironment:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (UIView)hiddenView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_hiddenView);
}

- (void)setHiddenView:(id)a3
{
  objc_storeWeak((id *)&self->_hiddenView, a3);
}

- (UIViewController)peekedViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_peekedViewController);
}

- (void)setPeekedViewController:(id)a3
{
  objc_storeWeak((id *)&self->_peekedViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_peekedViewController);
  objc_destroyWeak((id *)&self->_hiddenView);
  objc_storeStrong((id *)&self->_commandEnvironment, 0);
  objc_storeStrong((id *)&self->_rowModelsForCorespotlightIdentifiers, 0);
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_navigatedAssetReference, 0);
  objc_storeStrong((id *)&self->_activeDataSourceManager, 0);
}

@end
