@implementation PUTopPeopleWallpaperSuggestionsDebugViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  PUTopPeopleWallpaperSuggesterFilteringContext *v5;
  PUTopPeopleWallpaperSuggesterFilteringContext *filteringContext;
  PUTopPeopleWallpaperSuggestionsScoringContext *v7;
  PUTopPeopleWallpaperSuggestionsScoringContext *scoringContext;
  PUTopPeopleWallpaperSuggestionsDistancingContext *v9;
  PUTopPeopleWallpaperSuggestionsDistancingContext *distancingContext;
  NSMutableSet *v11;
  NSMutableSet *usedAssetLocalIdentifiers;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PUTopPeopleWallpaperSuggestionsDebugViewController;
  -[PUPhotosAlbumViewController viewDidLoad](&v13, sel_viewDidLoad);
  -[PUTopPeopleWallpaperSuggestionsDebugViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLeftItemsSupplementBackButton:", 1);

  -[PUTopPeopleWallpaperSuggestionsDebugViewController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
  -[PUTopPeopleWallpaperSuggestionsDebugViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PUPhotoCell"));

  v5 = objc_alloc_init(PUTopPeopleWallpaperSuggesterFilteringContext);
  filteringContext = self->_filteringContext;
  self->_filteringContext = v5;

  v7 = objc_alloc_init(PUTopPeopleWallpaperSuggestionsScoringContext);
  scoringContext = self->_scoringContext;
  self->_scoringContext = v7;

  v9 = objc_alloc_init(PUTopPeopleWallpaperSuggestionsDistancingContext);
  distancingContext = self->_distancingContext;
  self->_distancingContext = v9;

  v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  usedAssetLocalIdentifiers = self->_usedAssetLocalIdentifiers;
  self->_usedAssetLocalIdentifiers = v11;

  -[PUTopPeopleWallpaperSuggestionsDebugViewController _update](self, "_update");
}

- (void)settingsDidDismiss
{
  -[PUTopPeopleWallpaperSuggestionsDebugViewController _rewind:](self, "_rewind:", self);
}

- (BOOL)shouldShowToolbar
{
  return 1;
}

- (id)newToolbarItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[8];

  v9[7] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 2, self, sel__editSettings_);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 17, self, sel__next_);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 19, self, sel__rewind_);
  v9[0] = v3;
  v9[1] = v4;
  v9[2] = v3;
  v9[3] = v5;
  v9[4] = v3;
  v9[5] = v6;
  v9[6] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)getTitle:(id *)a3 prompt:(id *)a4 shouldHideBackButton:(BOOL *)a5 leftBarButtonItems:(id *)a6 rightBarButtonItems:(id *)a7
{
  void *v13;
  void *v14;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3870], "pu_PhotosUIImageNamed:", CFSTR("PUTTR"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithImage:style:target:action:", v13, 0, self, sel__presentTapToRadar);
  v15.receiver = self;
  v15.super_class = (Class)PUTopPeopleWallpaperSuggestionsDebugViewController;
  -[PUPhotosGridViewController getTitle:prompt:shouldHideBackButton:leftBarButtonItems:rightBarButtonItems:](&v15, sel_getTitle_prompt_shouldHideBackButton_leftBarButtonItems_rightBarButtonItems_, a3, a4, a5, a6, a7);
  if (*a6)
  {
    objc_msgSend(*a6, "arrayByAddingObject:", v14);
  }
  else
  {
    v16[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  }
  *a6 = (id)objc_claimAutoreleasedReturnValue();

}

- (void)_update
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  PUTopPeopleWallpaperSuggestionsDebugViewController *v31;
  id v32;
  id v33;
  _QWORD v34[4];
  _QWORD v35[4];
  _QWORD v36[5];
  _QWORD v37[6];

  v37[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D722C0];
  v36[0] = *MEMORY[0x1E0D722D0];
  v36[1] = v4;
  v37[0] = &unk_1E59BAD28;
  v37[1] = &unk_1E59BAD40;
  v5 = *MEMORY[0x1E0D722A8];
  v36[2] = *MEMORY[0x1E0D72270];
  v36[3] = v5;
  v37[2] = MEMORY[0x1E0C9AAB0];
  v37[3] = &unk_1E59BAD58;
  v36[4] = *MEMORY[0x1E0D72258];
  v34[0] = CFSTR("filteringContext");
  -[PUTopPeopleWallpaperSuggesterFilteringContext dictionaryRepresentation](self->_filteringContext, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v6;
  v34[1] = CFSTR("scoringContext");
  -[PUTopPeopleWallpaperSuggestionsScoringContext dictionaryRepresentation](self->_scoringContext, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v7;
  v34[2] = CFSTR("distancingContext");
  -[PUTopPeopleWallpaperSuggestionsDistancingContext dictionaryRepresentation](self->_distancingContext, "dictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v8;
  v34[3] = CFSTR("usedAssetLocalIdentifiers");
  -[NSMutableSet allObjects](self->_usedAssetLocalIdentifiers, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v37[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 101);
  -[PUTopPeopleWallpaperSuggestionsDebugViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v17 = v16;
  v19 = v18;

  objc_msgSend(v14, "bounds");
  objc_msgSend(v14, "setFrame:", (v17 - v20) * 0.5, (v19 - v21) * 0.5);
  -[PUTopPeopleWallpaperSuggestionsDebugViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addSubview:", v14);

  objc_msgSend(v14, "startAnimating");
  objc_msgSend(v3, "photoAnalysisClient");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __61__PUTopPeopleWallpaperSuggestionsDebugViewController__update__block_invoke;
  v28[3] = &unk_1E589B9E0;
  v29 = v12;
  v30 = v13;
  v31 = self;
  v32 = v3;
  v33 = v14;
  v24 = v14;
  v25 = v3;
  v26 = v13;
  v27 = v12;
  objc_msgSend(v23, "generateSuggestionsWithOptions:reply:", v11, v28);

}

- (void)_editSettings:(id)a3
{
  PUTopPeopleWallpaperSuggestionsDebugSettingsViewController *v4;

  v4 = -[PUTopPeopleWallpaperSuggestionsDebugSettingsViewController initWithDelegate:]([PUTopPeopleWallpaperSuggestionsDebugSettingsViewController alloc], "initWithDelegate:", self);
  -[PUTopPeopleWallpaperSuggestionsDebugViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 7);
  -[PUTopPeopleWallpaperSuggestionsDebugViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)_rewind:(id)a3
{
  -[NSMutableSet removeAllObjects](self->_usedAssetLocalIdentifiers, "removeAllObjects", a3);
  -[PUTopPeopleWallpaperSuggestionsDebugViewController _update](self, "_update");
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSDictionary *scoreByAssetLocalIdentifier;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PUTopPeopleWallpaperSuggestionsDebugViewController;
  v6 = a4;
  -[PUPhotosGridViewController collectionView:cellForItemAtIndexPath:](&v18, sel_collectionView_cellForItemAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosAlbumViewController assetCollectionAssets](self, "assetCollectionAssets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "item");

  objc_msgSend(v8, "objectAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  scoreByAssetLocalIdentifier = self->_scoreByAssetLocalIdentifier;
  objc_msgSend(v10, "localIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](scoreByAssetLocalIdentifier, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2f"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setScore:", v16);

  return v7;
}

- (void)_presentTapToRadar
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;

  -[PUPhotosGridViewController photoSelectionManager](self, "photoSelectionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosAlbumViewController assetCollection](self, "assetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isAnyAssetSelectedInAssetCollection:", v4);

  v6 = (void *)MEMORY[0x1E0CD1390];
  -[PUPhotosAlbumViewController assetCollection](self, "assetCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchAssetsInAssetCollection:options:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchedObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_localIdentifier);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((v5 & 1) != 0)
  {
    v12 = (void *)MEMORY[0x1E0D7B428];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __72__PUTopPeopleWallpaperSuggestionsDebugViewController__presentTapToRadar__block_invoke_2;
    v18[3] = &unk_1E589E760;
    v18[4] = self;
    v19 = v9;
    v20 = v10;
    v13 = v9;
    objc_msgSend(v12, "presentTermsAndConditionsForUIViewController:completion:", self, v18);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("File Radar"), CFSTR("No photo is selected. Are all the suggestions shown good?"), 1);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0DC3448];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __72__PUTopPeopleWallpaperSuggestionsDebugViewController__presentTapToRadar__block_invoke;
    v21[3] = &unk_1E589BA08;
    v21[4] = self;
    v22 = v9;
    v23 = v11;
    v15 = v9;
    objc_msgSend(v14, "actionWithTitle:style:handler:", CFSTR("File Radar"), 0, v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAction:", v16);
    objc_msgSend(v13, "addAction:", v17);
    -[PUTopPeopleWallpaperSuggestionsDebugViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);

  }
}

- (void)_fileRadarWithGoodSuggestions:(id)a3 badSuggestions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, CFSTR("Collecting data for radar..."), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __99__PUTopPeopleWallpaperSuggestionsDebugViewController__fileRadarWithGoodSuggestions_badSuggestions___block_invoke;
  v12[3] = &unk_1E58A9AE0;
  v12[4] = self;
  v13 = v7;
  v14 = v6;
  v15 = v8;
  v9 = v8;
  v10 = v6;
  v11 = v7;
  -[PUTopPeopleWallpaperSuggestionsDebugViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, v12);

}

- (BOOL)_writeDiagnosticsToURL:(id)a3 goodSuggestions:(id)a4 badSuggestions:(id)a5
{
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t i;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  int v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  NSObject *v102;
  BOOL v103;
  NSObject *v104;
  NSObject *v105;
  NSObject *v107;
  void *v108;
  void *v109;
  NSObject *v110;
  id v111;
  NSObject *v112;
  id obj;
  uint64_t v114;
  void *v115;
  void *v116;
  id v117;
  id v118;
  uint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  uint64_t v124;
  id v125;
  id v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  id v135;
  _QWORD v136[2];
  _QWORD v137[2];
  _QWORD v138[2];
  _QWORD v139[2];
  _QWORD v140[4];
  _QWORD v141[4];
  _BYTE v142[128];
  _BYTE v143[128];
  _QWORD v144[3];
  uint8_t buf[4];
  NSObject *v146;
  __int16 v147;
  NSObject *v148;
  uint64_t v149;

  v149 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = 0;
  LOBYTE(a4) = objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v135);
  v11 = v135;

  if ((a4 & 1) != 0)
  {
    v107 = v11;
    v111 = v9;
    v112 = v7;
    objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v9);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "librarySpecificFetchOptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = *MEMORY[0x1E0CD1A60];
    v144[0] = *MEMORY[0x1E0CD1938];
    v144[1] = v15;
    v144[2] = *MEMORY[0x1E0CD19F0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v144, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFetchPropertySets:", v16);

    v109 = v14;
    v110 = v12;
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v12, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "librarySpecificFetchOptions");
    v19 = objc_claimAutoreleasedReturnValue();

    v108 = (void *)v19;
    objc_msgSend(MEMORY[0x1E0CD1528], "fetchFacesGroupedByAssetLocalIdentifierForAssets:options:", v17, v19);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v117 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v131 = 0u;
    v132 = 0u;
    v133 = 0u;
    v134 = 0u;
    obj = v17;
    v119 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v131, v143, 16);
    if (v119)
    {
      v114 = *(_QWORD *)v132;
      v115 = v8;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v132 != v114)
            objc_enumerationMutation(obj);
          v124 = v20;
          v21 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * v20);
          v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v23 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v21, "overallAestheticScore");
          objc_msgSend(v23, "numberWithFloat:");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, CFSTR("overallAestheticScore"));

          objc_msgSend(v21, "aestheticProperties");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v25, "wellFramedSubjectScore");
          objc_msgSend(v26, "numberWithFloat:");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v27, CFSTR("wellFramedSubjectScore"));

          v28 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v25, "wellChosenSubjectScore");
          objc_msgSend(v28, "numberWithFloat:");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v29, CFSTR("wellChosenSubjectScore"));

          v30 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v25, "tastefullyBlurredScore");
          objc_msgSend(v30, "numberWithFloat:");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v31, CFSTR("tastefullyBlurredScore"));

          v32 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v25, "sharplyFocusedSubjectScore");
          objc_msgSend(v32, "numberWithFloat:");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v33, CFSTR("sharplyFocusedSubjectScore"));

          v34 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v25, "wellTimedShotScore");
          objc_msgSend(v34, "numberWithFloat:");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v35, CFSTR("wellTimedShotScore"));

          v36 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v25, "pleasantLightingScore");
          objc_msgSend(v36, "numberWithFloat:");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v37, CFSTR("pleasantLightingScore"));

          v38 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v25, "pleasantReflectionsScore");
          objc_msgSend(v38, "numberWithFloat:");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v39, CFSTR("pleasantReflectionsScore"));

          v40 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v25, "harmoniousColorScore");
          objc_msgSend(v40, "numberWithFloat:");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v41, CFSTR("harmoniousColorScore"));

          v42 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v25, "livelyColorScore");
          objc_msgSend(v42, "numberWithFloat:");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v43, CFSTR("livelyColorScore"));

          v44 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v25, "pleasantSymmetryScore");
          objc_msgSend(v44, "numberWithFloat:");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v45, CFSTR("pleasantSymmetryScore"));

          v46 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v25, "pleasantPatternScore");
          objc_msgSend(v46, "numberWithFloat:");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v47, CFSTR("pleasantPatternScore"));

          v48 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v25, "immersivenessScore");
          objc_msgSend(v48, "numberWithFloat:");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v49, CFSTR("immersivenessScore"));

          v50 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v25, "pleasantPerspectiveScore");
          objc_msgSend(v50, "numberWithFloat:");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v51, CFSTR("pleasantPerspectiveScore"));

          v52 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v25, "pleasantPostProcessingScore");
          objc_msgSend(v52, "numberWithFloat:");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v53, CFSTR("pleasantPostProcessingScore"));

          v54 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v25, "noiseScore");
          objc_msgSend(v54, "numberWithFloat:");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v55, CFSTR("noiseScore"));

          v56 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v25, "failureScore");
          objc_msgSend(v56, "numberWithFloat:");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v57, CFSTR("failureScore"));

          v58 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v25, "pleasantCompositionScore");
          objc_msgSend(v58, "numberWithFloat:");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v59, CFSTR("pleasantCompositionScore"));

          v60 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v25, "interestingSubjectScore");
          objc_msgSend(v60, "numberWithFloat:");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v61, CFSTR("interestingSubjectScore"));

          v62 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v25, "intrusiveObjectPresenceScore");
          objc_msgSend(v62, "numberWithFloat:");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v63, CFSTR("intrusiveObjectPresenceScore"));

          v64 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v25, "pleasantCameraTiltScore");
          objc_msgSend(v64, "numberWithFloat:");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v65, CFSTR("pleasantCameraTiltScore"));

          v66 = (void *)MEMORY[0x1E0CB37E8];
          v121 = v25;
          objc_msgSend(v25, "lowLight");
          objc_msgSend(v66, "numberWithFloat:");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v67, CFSTR("lowLight"));

          objc_msgSend(v21, "mediaAnalysisProperties");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v68, "blurrinessScore");
          objc_msgSend(v69, "numberWithFloat:");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v70, CFSTR("blurrinessScore"));

          v71 = (void *)MEMORY[0x1E0CB37E8];
          v120 = v68;
          objc_msgSend(v68, "exposureScore");
          objc_msgSend(v71, "numberWithFloat:");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v72, CFSTR("exposureScore"));

          objc_msgSend(v21, "sceneprintProperties");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "sceneprint");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v123 = v22;
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v74, CFSTR("sceneprint"));

          v75 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v127 = 0u;
          v128 = 0u;
          v129 = 0u;
          v130 = 0u;
          v122 = v21;
          objc_msgSend(v21, "localIdentifier");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v116, "objectForKeyedSubscript:", v76);
          v77 = (void *)objc_claimAutoreleasedReturnValue();

          v125 = v77;
          v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v127, v142, 16);
          if (v78)
          {
            v79 = v78;
            v80 = *(_QWORD *)v128;
            do
            {
              for (i = 0; i != v79; ++i)
              {
                if (*(_QWORD *)v128 != v80)
                  objc_enumerationMutation(v125);
                v82 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * i);
                objc_msgSend(v82, "personLocalIdentifier");
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                v84 = v83;
                if (v83)
                {
                  v85 = v83;
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
                  v86 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v86, "UUIDString");
                  v85 = (id)objc_claimAutoreleasedReturnValue();

                }
                v140[0] = CFSTR("size");
                v87 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v82, "size");
                objc_msgSend(v87, "numberWithDouble:");
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                v141[0] = v88;
                v140[1] = CFSTR("quality");
                v89 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v82, "quality");
                objc_msgSend(v89, "numberWithDouble:");
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                v141[1] = v90;
                v140[2] = CFSTR("centerX");
                v91 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v82, "centerX");
                objc_msgSend(v91, "numberWithDouble:");
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                v141[2] = v92;
                v140[3] = CFSTR("centerY");
                v93 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v82, "centerY");
                objc_msgSend(v93, "numberWithDouble:");
                v94 = (void *)objc_claimAutoreleasedReturnValue();
                v141[3] = v94;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v141, v140, 4);
                v95 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "setObject:forKeyedSubscript:", v95, v85);

              }
              v79 = objc_msgSend(v125, "countByEnumeratingWithState:objects:count:", &v127, v142, 16);
            }
            while (v79);
          }

          objc_msgSend(v123, "setObject:forKeyedSubscript:", v75, CFSTR("faces"));
          objc_msgSend(v122, "localIdentifier");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v115;
          v97 = objc_msgSend(v115, "containsObject:", v96);

          if (v97)
            v98 = v118;
          else
            v98 = v117;
          objc_msgSend(v98, "addObject:", v123);

          v20 = v124 + 1;
        }
        while (v124 + 1 != v119);
        v119 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v131, v143, 16);
      }
      while (v119);
    }

    v138[1] = CFSTR("report");
    v139[0] = CFSTR("assetInformation");
    v138[0] = CFSTR("type");
    v136[0] = CFSTR("TP");
    v136[1] = CFSTR("FP");
    v137[0] = v118;
    v137[1] = v117;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v137, v136, 2);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v139[1] = v99;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v139, v138, 2);
    v100 = (void *)objc_claimAutoreleasedReturnValue();

    v126 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v100, 100, 0, &v126);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v126;

    if (v101)
    {
      v7 = v112;
      -[NSObject URLByAppendingPathComponent:](v112, "URLByAppendingPathComponent:", CFSTR("report.plist"));
      v102 = objc_claimAutoreleasedReturnValue();
      v103 = 1;
      if ((objc_msgSend(v101, "writeToURL:atomically:", v102, 1) & 1) != 0)
      {
LABEL_33:

        v105 = v110;
        v9 = v111;
        goto LABEL_34;
      }
      PLUIGetLog();
      v104 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v146 = v102;
        v147 = 2112;
        v148 = v11;
        _os_log_impl(&dword_1AAB61000, v104, OS_LOG_TYPE_ERROR, "Failed to write plist radar report to path: %@, error: %@", buf, 0x16u);
      }

    }
    else
    {
      PLUIGetLog();
      v102 = objc_claimAutoreleasedReturnValue();
      v7 = v112;
      if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v146 = v11;
        _os_log_impl(&dword_1AAB61000, v102, OS_LOG_TYPE_ERROR, "Failed to create plist data with error: %@", buf, 0xCu);
      }
    }
    v103 = 0;
    goto LABEL_33;
  }
  PLUIGetLog();
  v105 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v146 = v7;
    v147 = 2112;
    v148 = v11;
    _os_log_impl(&dword_1AAB61000, v105, OS_LOG_TYPE_ERROR, "Failed to create directory for feedback files at path: %@, error: %@", buf, 0x16u);
  }
  v103 = 0;
LABEL_34:

  return v103;
}

- (id)_cloneAsset:(id)a3 toDirectory:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  dispatch_semaphore_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  id v26;
  _QWORD v28[4];
  id v29;
  NSObject *v30;
  uint64_t *v31;
  _QWORD *v32;
  _QWORD v33[5];
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(MEMORY[0x1E0CD1438], "assetResourcesForAsset:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v42;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "type") == 1)
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__5058;
  v39 = __Block_byref_object_dispose__5059;
  v40 = 0;
  if (v8)
  {
    v12 = (void *)MEMORY[0x1AF42B2C0]();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "originalFilename");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pathExtension");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingPathExtension:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "URLByAppendingPathComponent:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v36[5];
    v36[5] = v18;

    v20 = objc_alloc_init(MEMORY[0x1E0CD1470]);
    objc_msgSend(v20, "setNetworkAccessAllowed:", 1);
    objc_msgSend(MEMORY[0x1E0CD1458], "defaultManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = dispatch_semaphore_create(0);
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x3032000000;
    v33[3] = __Block_byref_object_copy__5058;
    v33[4] = __Block_byref_object_dispose__5059;
    v34 = 0;
    v23 = v36[5];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __78__PUTopPeopleWallpaperSuggestionsDebugViewController__cloneAsset_toDirectory___block_invoke;
    v28[3] = &unk_1E58A8E38;
    v31 = &v35;
    v29 = v6;
    v32 = v33;
    v24 = v22;
    v30 = v24;
    objc_msgSend(v21, "writeDataForAssetResource:toFile:options:completionHandler:", v8, v23, v20, v28);
    dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);

    _Block_object_dispose(v33, 8);
    objc_autoreleasePoolPop(v12);
    v25 = (void *)v36[5];
  }
  else
  {
    v25 = 0;
  }
  v26 = v25;
  _Block_object_dispose(&v35, 8);

  return v26;
}

- (PUTopPeopleWallpaperSuggesterFilteringContext)filteringContext
{
  return (PUTopPeopleWallpaperSuggesterFilteringContext *)objc_getProperty(self, a2, 1816, 1);
}

- (PUTopPeopleWallpaperSuggestionsScoringContext)scoringContext
{
  return (PUTopPeopleWallpaperSuggestionsScoringContext *)objc_getProperty(self, a2, 1824, 1);
}

- (PUTopPeopleWallpaperSuggestionsDistancingContext)distancingContext
{
  return (PUTopPeopleWallpaperSuggestionsDistancingContext *)objc_getProperty(self, a2, 1832, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distancingContext, 0);
  objc_storeStrong((id *)&self->_scoringContext, 0);
  objc_storeStrong((id *)&self->_filteringContext, 0);
  objc_storeStrong((id *)&self->_scoreByAssetLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_usedAssetLocalIdentifiers, 0);
}

void __78__PUTopPeopleWallpaperSuggestionsDebugViewController__cloneAsset_toDirectory___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v9 = 138412546;
      v10 = v6;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_ERROR, "Failed to write asset data to URL: %@, error: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    v7 = objc_msgSend(getDEUtilsClass_5061(), "copyPath:toDestinationDir:zipped:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 32), 1);
    if (v7)
    {
      v5 = v7;
      objc_msgSend(getDEUtilsClass_5061(), "removeFile:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v5);
    }
    else
    {
      PLUIGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_ERROR, "Failed to zip the asset, attaching unzipped", (uint8_t *)&v9, 2u);
      }

      v5 = 0;
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __99__PUTopPeopleWallpaperSuggestionsDebugViewController__fileRadarWithGoodSuggestions_badSuggestions___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "assetCollectionAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  v4 = objc_msgSend(*(id *)(a1 + 40), "count");
  v5 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v4 / (double)v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringFromNumber:numberStyle:", v6, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld incorrectly suggested asset(s)"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v9, "appendString:", CFSTR("— Top People Wallpaper Suggestion Feedback —\n"));
  objc_msgSend(v9, "appendFormat:", CFSTR("Incorrect Suggestion(s): %ld of %ld (%@)\n"), v4, v3, v7);
  NSTemporaryDirectory();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "_writeDiagnosticsToURL:goodSuggestions:badSuggestions:", v14, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    PLUIGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v14;
      _os_log_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_ERROR, "Failed to write diagnostics to URL: %@", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v16, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v14, 0, 4, &v28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v28;
  if (!v17)
  {
    PLUIGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v30 = v14;
      v31 = 2112;
      v32 = v18;
      _os_log_impl(&dword_1AAB61000, v19, OS_LOG_TYPE_ERROR, "Failed to find diagnostic files at URL: %@, error: %@", buf, 0x16u);
    }

  }
  v20 = (void *)MEMORY[0x1E0D7B428];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __99__PUTopPeopleWallpaperSuggestionsDebugViewController__fileRadarWithGoodSuggestions_badSuggestions___block_invoke_262;
  v24[3] = &unk_1E58A8E10;
  v24[4] = *(_QWORD *)(a1 + 32);
  v25 = *(id *)(a1 + 56);
  v26 = v16;
  v27 = v14;
  v21 = v14;
  v22 = v16;
  LOBYTE(v23) = 0;
  objc_msgSend(v20, "fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:attachmentURLs:includeSysDiagnose:completionHandler:", v8, v9, CFSTR("Other Bug"), CFSTR("819256"), CFSTR("Photos Media Mining (New Bugs)"), CFSTR("all"), &stru_1E58AD278, v17, v23, v24);

}

void __99__PUTopPeopleWallpaperSuggestionsDebugViewController__fileRadarWithGoodSuggestions_badSuggestions___block_invoke_262(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setEditing:animated:", 0, 0);
  objc_msgSend(*(id *)(a1 + 40), "dismissViewControllerAnimated:completion:", 1, 0);
  v2 = *(void **)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v8 = 0;
  v4 = objc_msgSend(v2, "removeItemAtURL:error:", v3, &v8);
  v5 = v8;
  if ((v4 & 1) == 0)
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Failed to cleanup temporary Tap-To-Radar item at URL: %@, error: %@", buf, 0x16u);
    }

  }
}

void __72__PUTopPeopleWallpaperSuggestionsDebugViewController__presentTapToRadar__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "valueForKey:", *(_QWORD *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_fileRadarWithGoodSuggestions:badSuggestions:", v2, 0);

}

void __72__PUTopPeopleWallpaperSuggestionsDebugViewController__presentTapToRadar__block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "selectedAssets");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
    objc_msgSend(v3, "removeObjectsInArray:", v7);
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "valueForKey:", *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForKey:", *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_fileRadarWithGoodSuggestions:badSuggestions:", v5, v6);

  }
}

void __61__PUTopPeopleWallpaperSuggestionsDebugViewController__update__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  _QWORD block[4];
  id v35;
  uint64_t v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  void *v45;
  void *v46;
  _QWORD v47[2];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D722E0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v42 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("assetLocalIdentifier"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("score"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v10, v9);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    }
    while (v5);
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 1808), *(id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "librarySpecificFetchOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *MEMORY[0x1E0CD1978];
  v47[0] = *MEMORY[0x1E0CD1960];
  v47[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFetchPropertySets:", v14);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", *(_QWORD *)(a1 + 32), v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "fetchedObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = MEMORY[0x1E0C809B0];
  v18 = (void *)MEMORY[0x1E0CB3928];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __61__PUTopPeopleWallpaperSuggestionsDebugViewController__update__block_invoke_2;
  v39[3] = &unk_1E589B9B8;
  v40 = *(id *)(a1 + 32);
  objc_msgSend(v18, "sortDescriptorWithKey:ascending:comparator:", CFSTR("localIdentifier"), 1, v39);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sortedArrayUsingDescriptors:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = *(void **)(*(_QWORD *)(a1 + 48) + 1800);
  objc_msgSend(v21, "valueForKey:", CFSTR("localIdentifier"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObjectsFromArray:", v23);

  objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssets:title:identifier:photoLibrary:", v21, 0, 0, *(_QWORD *)(a1 + 56));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x1E0CD14E0];
  v45 = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedTitle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "transientCollectionListWithCollections:title:", v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v28, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = v17;
  block[1] = 3221225472;
  block[2] = __61__PUTopPeopleWallpaperSuggestionsDebugViewController__update__block_invoke_3;
  block[3] = &unk_1E58A9AE0;
  v30 = *(id *)(a1 + 64);
  v31 = *(_QWORD *)(a1 + 48);
  v35 = v30;
  v36 = v31;
  v37 = v24;
  v38 = v29;
  v32 = v29;
  v33 = v24;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __61__PUTopPeopleWallpaperSuggestionsDebugViewController__update__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", a2));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v7);

  objc_msgSend(v9, "numberWithUnsignedInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "compare:", v11);

  return v12;
}

uint64_t __61__PUTopPeopleWallpaperSuggestionsDebugViewController__update__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 40), "setAssetCollection:fetchResultContainingAssetCollection:filterPredicate:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0);
}

@end
