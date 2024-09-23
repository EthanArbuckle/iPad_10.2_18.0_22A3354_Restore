@implementation PUCurationTragicFailureInHighlightsDebugViewController

- (void)dealloc
{
  objc_super v3;

  -[NSConditionLock lock](self->_backgroundActivityLock, "lock");
  -[NSConditionLock unlockWithCondition:](self->_backgroundActivityLock, "unlockWithCondition:", 2);
  v3.receiver = self;
  v3.super_class = (Class)PUCurationTragicFailureInHighlightsDebugViewController;
  -[PUCurationTragicFailureInHighlightsDebugViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  PUCurationTragicFailureInHighlightsGridDebugViewController *v4;
  void *v5;
  PUCurationTragicFailureInHighlightsGridDebugViewController *v6;
  PUCurationTragicFailureInHighlightsGridDebugViewController *assetCollectionViewController;
  NSConditionLock *v8;
  NSConditionLock *backgroundActivityLock;
  NSMutableArray *v10;
  NSMutableArray *highlightDatas;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PUCurationTragicFailureInHighlightsDebugViewController;
  -[PUCurationTragicFailureInHighlightsDebugViewController viewDidLoad](&v12, sel_viewDidLoad);
  -[PUCurationTragicFailureInHighlightsDebugViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInterfaceIdiom");
  objc_opt_class();

  v4 = [PUCurationTragicFailureInHighlightsGridDebugViewController alloc];
  v5 = (void *)objc_opt_new();
  v6 = -[PUCurationTragicFailureInHighlightsGridDebugViewController initWithSpec:](v4, "initWithSpec:", v5);
  assetCollectionViewController = self->_assetCollectionViewController;
  self->_assetCollectionViewController = v6;

  -[PUCurationTragicFailureInHighlightsGridDebugViewController setParentController:](self->_assetCollectionViewController, "setParentController:", self);
  v8 = (NSConditionLock *)objc_alloc_init(MEMORY[0x1E0CB3538]);
  backgroundActivityLock = self->_backgroundActivityLock;
  self->_backgroundActivityLock = v8;

  v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  highlightDatas = self->_highlightDatas;
  self->_highlightDatas = v10;

  -[PUCurationTragicFailureInHighlightsDebugViewController _fetchUtilityAssetInformation](self, "_fetchUtilityAssetInformation");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUCurationTragicFailureInHighlightsDebugViewController;
  -[PUCurationTragicFailureInHighlightsDebugViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[NSConditionLock lock](self->_backgroundActivityLock, "lock");
  -[NSConditionLock unlockWithCondition:](self->_backgroundActivityLock, "unlockWithCondition:", 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUCurationTragicFailureInHighlightsDebugViewController;
  -[PUCurationTragicFailureInHighlightsDebugViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[NSConditionLock lock](self->_backgroundActivityLock, "lock");
  -[NSConditionLock unlockWithCondition:](self->_backgroundActivityLock, "unlockWithCondition:", 1);
}

- (void)_fetchUtilityAssetInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PHFetchResult *v9;
  PHFetchResult *highlights;
  void *v11;
  PHFetchResult *v12;
  NSConditionLock *v13;
  id v14;
  NSObject *v15;
  id v16;
  PHFetchResult *v17;
  NSConditionLock *v18;
  id v19;
  _QWORD block[4];
  id v21;
  NSConditionLock *v22;
  PHFetchResult *v23;
  id v24;
  PUCurationTragicFailureInHighlightsDebugViewController *v25;
  id v26;
  id location;
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("endDate"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v6;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v8);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 6, 1000000301, v4);
  v9 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
  highlights = self->_highlights;
  self->_highlights = v9;

  -[PUCurationTragicFailureInHighlightsDebugViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reloadData");

  v12 = self->_highlights;
  v13 = self->_backgroundActivityLock;
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_initWeak(&location, self);
  dispatch_get_global_queue(17, 0);
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__PUCurationTragicFailureInHighlightsDebugViewController__fetchUtilityAssetInformation__block_invoke;
  block[3] = &unk_1E58A8660;
  v21 = v3;
  v22 = v13;
  v23 = v12;
  v24 = v14;
  v16 = v14;
  v17 = v12;
  v18 = v13;
  v19 = v3;
  objc_copyWeak(&v26, &location);
  v25 = self;
  dispatch_async(v15, block);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  unint64_t v5;
  void *v6;
  id v7;

  v5 = objc_msgSend(a4, "item", a3);
  self->_currentHighlightIndex = v5;
  -[PHFetchResult objectAtIndexedSubscript:](self->_highlights, "objectAtIndexedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCurationTragicFailureInHighlightsGridDebugViewController setHighlight:](self->_assetCollectionViewController, "setHighlight:", v6);

  -[PUCurationTragicFailureInHighlightsDebugViewController navigationController](self, "navigationController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushViewController:animated:", self->_assetCollectionViewController, 1);

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 48.0;
}

- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  return 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[PHFetchResult count](self->_highlights, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v38;
  id v39;
  void *v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("TragicFailureInHighlightsDebugTableViewCellIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, CFSTR("TragicFailureInHighlightsDebugTableViewCellIdentifier"));
    objc_msgSend(v7, "detailTextLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNumberOfLines:", 1);

    objc_msgSend(v7, "detailTextLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLineBreakMode:", 0);

  }
  v10 = objc_msgSend(v6, "item");
  -[PHFetchResult objectAtIndexedSubscript:](self->_highlights, "objectAtIndexedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedSubtitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %@"), v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = v12;
  }
  objc_msgSend(v7, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v14);

  if (v13)
  if (v10 < -[NSMutableArray count](self->_highlightDatas, "count"))
  {
    v40 = v12;
    -[NSMutableArray objectAtIndexedSubscript:](self->_highlightDatas, "objectAtIndexedSubscript:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "unsignedIntegerValue");

    objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "unsignedIntegerValue");

    objc_msgSend(v16, "objectAtIndexedSubscript:", 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "unsignedIntegerValue");

    if (v20)
    {
      v39 = v6;
      v23 = objc_alloc(MEMORY[0x1E0CB3778]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d assets, "), v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v23, "initWithString:", v24);

      v26 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d tragic failures"), v20);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = *MEMORY[0x1E0DC1140];
      objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = v28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v26, "initWithString:attributes:", v27, v29);
      objc_msgSend(v25, "appendAttributedString:", v30);

      if (v22)
      {
        v31 = objc_alloc(MEMORY[0x1E0CB3498]);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", %d other utilities"), v22);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)objc_msgSend(v31, "initWithString:", v32);
        objc_msgSend(v25, "appendAttributedString:", v33);

      }
      objc_msgSend(v7, "detailTextLabel");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setAttributedText:", v25);

      v6 = v39;
    }
    else
    {
      if (v22)
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d assets, %d other utilities"), v18, v22);
      else
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d assets, no utilities"), v18, v38);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "detailTextLabel");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setText:", v35);

    }
    v12 = v40;

  }
  return v7;
}

- (void)goToNextHighlight:(id)a3
{
  unint64_t v4;
  unint64_t currentHighlightIndex;
  id v6;

  v4 = self->_currentHighlightIndex + 1;
  self->_currentHighlightIndex = v4;
  if (v4 == -[PHFetchResult count](self->_highlights, "count", a3))
  {
    currentHighlightIndex = 0;
    self->_currentHighlightIndex = 0;
  }
  else
  {
    currentHighlightIndex = self->_currentHighlightIndex;
  }
  -[PHFetchResult objectAtIndexedSubscript:](self->_highlights, "objectAtIndexedSubscript:", currentHighlightIndex);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PUCurationTragicFailureInHighlightsGridDebugViewController setHighlight:](self->_assetCollectionViewController, "setHighlight:", v6);

}

- (void)goToPreviousHighlight:(id)a3
{
  unint64_t currentHighlightIndex;
  id v5;

  currentHighlightIndex = self->_currentHighlightIndex;
  if (!currentHighlightIndex)
    currentHighlightIndex = -[PHFetchResult count](self->_highlights, "count", a3);
  self->_currentHighlightIndex = currentHighlightIndex - 1;
  -[PHFetchResult objectAtIndexedSubscript:](self->_highlights, "objectAtIndexedSubscript:");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PUCurationTragicFailureInHighlightsGridDebugViewController setHighlight:](self->_assetCollectionViewController, "setHighlight:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightDatas, 0);
  objc_storeStrong((id *)&self->_backgroundActivityLock, 0);
  objc_storeStrong((id *)&self->_assetCollectionViewController, 0);
  objc_storeStrong((id *)&self->_highlights, 0);
}

void __87__PUCurationTragicFailureInHighlightsDebugViewController__fetchUtilityAssetInformation__block_invoke(id *a1)
{
  id *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  float v26;
  float v27;
  double v28;
  float v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  float v42;
  float v43;
  float v44;
  double v45;
  double v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  unint64_t v52;
  unint64_t v53;
  id v54;
  id v55;
  id v56;
  id *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  unint64_t v62;
  id *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  int8x16_t v67;
  _QWORD block[4];
  int8x16_t v69;
  id v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _QWORD v80[3];
  _BYTE v81[128];
  _BYTE v82[128];
  _QWORD v83[5];

  v1 = a1;
  v83[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "librarySpecificFetchOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0CD19F0];
  v83[0] = *MEMORY[0x1E0CD1A50];
  v83[1] = v3;
  v83[2] = *MEMORY[0x1E0CD1938];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFetchPropertySets:", v4);

  v5 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v6 = 0;
  v57 = v1 + 9;
  v7 = 0x1E0C99000uLL;
  v8 = 0x1E0CD1000uLL;
  do
  {
    while (1)
    {
      v9 = (void *)MEMORY[0x1AF42B2C0]();
      v10 = v1[5];
      objc_msgSend(*(id *)(v7 + 3432), "dateWithTimeIntervalSinceNow:", 1.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v10) = objc_msgSend(v10, "lockWhenCondition:beforeDate:", 0, v11);

      if ((_DWORD)v10)
        break;
      v12 = objc_msgSend(v1[5], "condition");
      objc_autoreleasePoolPop(v9);
      if (v12 == 2)
        goto LABEL_40;
    }
    v60 = v9;
    v61 = v5;
    v63 = v1;
    objc_msgSend(v1[6], "objectAtIndexedSubscript:", v6);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v2;
    objc_msgSend(*(id *)(v8 + 912), "fetchAssetsInAssetCollection:options:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
    v65 = v15;
    v62 = v6;
    v58 = v14;
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      v19 = 0;
      v20 = *(_QWORD *)v77;
      while (1)
      {
        v21 = 0;
        v66 = v17;
        do
        {
          if (*(_QWORD *)v77 != v20)
            objc_enumerationMutation(v15);
          v22 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v21);
          if (objc_msgSend(v22, "isPhoto"))
          {
            objc_msgSend(v22, "sceneAnalysisProperties");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "sceneAnalysisVersion");

            if (v24 > 40)
            {
              v30 = v20;
              v31 = v18;
              v32 = v19;
              v74 = 0u;
              v75 = 0u;
              v72 = 0u;
              v73 = 0u;
              objc_msgSend(v22, "sceneClassifications");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
              if (v34)
              {
                v35 = v34;
                v36 = *(_QWORD *)v73;
LABEL_18:
                v37 = 0;
                while (1)
                {
                  if (*(_QWORD *)v73 != v36)
                    objc_enumerationMutation(v33);
                  v38 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v37);
                  if (objc_msgSend(v38, "extendedSceneIdentifier") == 2147483631)
                    break;
                  if (v35 == ++v37)
                  {
                    v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
                    if (v35)
                      goto LABEL_18;
                    goto LABEL_24;
                  }
                }
                objc_msgSend(v38, "confidence");
                v40 = v39;

                v19 = v32;
                v18 = v31;
                v20 = v30;
                v15 = v65;
                v17 = v66;
                if (v40 < 0.34)
                {
                  if (v40 < 0.05)
                    goto LABEL_30;
                  objc_msgSend(v22, "mediaAnalysisProperties");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "blurrinessScore");
                  v43 = v42;

                  if (v43 >= 0.25)
                    goto LABEL_30;
                }
                goto LABEL_28;
              }
LABEL_24:

              v19 = v32;
              v18 = v31;
              v20 = v30;
              v15 = v65;
              v17 = v66;
            }
            else
            {
              objc_msgSend(v22, "mediaAnalysisProperties");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "blurrinessScore");
              if (v26 < 0.01)
                goto LABEL_15;
              objc_msgSend(v22, "overallAestheticScore");
              v28 = v27;

              if (v28 < 0.1)
                goto LABEL_28;
              objc_msgSend(v22, "aestheticProperties");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "failureScore");
              if (v29 < -0.45)
              {
LABEL_15:

LABEL_28:
                ++v18;
                goto LABEL_32;
              }
              objc_msgSend(v25, "tastefullyBlurredScore");
              v45 = v44;

              if (v45 < -0.92)
                goto LABEL_28;
            }
          }
LABEL_30:
          objc_msgSend(v22, "curationScore");
          if (v46 < 0.5)
            ++v19;
LABEL_32:
          ++v21;
        }
        while (v21 != v17);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
        if (!v17)
          goto LABEL_36;
      }
    }
    v18 = 0;
    v19 = 0;
LABEL_36:

    v1 = v63;
    v47 = v63[7];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v58);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v80[0] = v48;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v80[1] = v49;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v80[2] = v50;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 3);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addObject:", v51);

    v5 = v61;
    objc_msgSend(v61, "addIndex:", v62);
    v6 = v62 + 1;
    v52 = objc_msgSend(v63[6], "count");
    v53 = v52;
    if (__ROR8__(0x8F5C28F5C28F5C29 * (v62 + 1), 2) < 0x28F5C28F5C28F5DuLL || v6 >= v52)
    {
      v54 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __87__PUCurationTragicFailureInHighlightsDebugViewController__fetchUtilityAssetInformation__block_invoke_2;
      block[3] = &unk_1E58A9F58;
      objc_copyWeak(&v71, v57);
      v67 = *(int8x16_t *)(v63 + 7);
      v55 = (id)v67.i64[0];
      v69 = vextq_s8(v67, v67, 8uLL);
      v70 = v61;
      v56 = v61;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      objc_destroyWeak(&v71);
      v5 = v54;
    }
    v2 = v64;
    v7 = 0x1E0C99000;
    v8 = 0x1E0CD1000;
    objc_msgSend(v63[5], "unlock");

    objc_autoreleasePoolPop(v60);
  }
  while (v6 < v53);
LABEL_40:

}

void __87__PUCurationTragicFailureInHighlightsDebugViewController__fetchUtilityAssetInformation__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id WeakRetained;
  _QWORD v7[4];
  id v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 1048);
    *(_QWORD *)(v3 + 1048) = v2;

    objc_msgSend(WeakRetained, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __87__PUCurationTragicFailureInHighlightsDebugViewController__fetchUtilityAssetInformation__block_invoke_3;
    v7[3] = &unk_1E58ABCA8;
    v8 = *(id *)(a1 + 48);
    v9 = WeakRetained;
    objc_msgSend(v5, "performBatchUpdates:completion:", v7, &__block_literal_global_91021);

  }
}

uint64_t __87__PUCurationTragicFailureInHighlightsDebugViewController__fetchUtilityAssetInformation__block_invoke_3(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __87__PUCurationTragicFailureInHighlightsDebugViewController__fetchUtilityAssetInformation__block_invoke_4;
  v3[3] = &unk_1E58A85F8;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumerateIndexesUsingBlock:", v3);
}

void __87__PUCurationTragicFailureInHighlightsDebugViewController__fetchUtilityAssetInformation__block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadRowsAtIndexPaths:withRowAnimation:", v5, 5);

}

@end
