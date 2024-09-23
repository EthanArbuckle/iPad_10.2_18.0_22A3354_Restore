@implementation PXCuratedLibraryAssetCollectionSkimmingModel

- (PXCuratedLibraryViewModel)viewModel
{
  return self->_viewModel;
}

- (PXCuratedLibraryAssetCollectionSkimmingModel)initWithViewModel:(id)a3
{
  id v5;
  PXCuratedLibraryAssetCollectionSkimmingModel *v6;
  PXCuratedLibraryAssetCollectionSkimmingModel *v7;
  __int128 v8;
  __int128 v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXCuratedLibraryAssetCollectionSkimmingModel;
  v6 = -[PXCuratedLibraryAssetCollectionSkimmingModel init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewModel, a3);
    v7->_zoomLevel = 0;
    v8 = *(_OWORD *)off_1E50B8778;
    v9 = *((_OWORD *)off_1E50B8778 + 1);
    *(_OWORD *)&v7->_skimmedIndexPath.dataSourceIdentifier = *(_OWORD *)off_1E50B8778;
    *(_OWORD *)&v7->_skimmedIndexPath.item = v9;
    *(_OWORD *)&v7->_initialIndexPath.dataSourceIdentifier = v8;
    *(_OWORD *)&v7->_initialIndexPath.item = v9;
  }

  return v7;
}

- (BOOL)canStartSkimming
{
  return -[PXCuratedLibraryViewModel zoomLevel](self->_viewModel, "zoomLevel") == 1;
}

- (id)validatedAssetCollectionReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "assetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "px_highlightKind") == 2)
  {
    v6 = v4;
LABEL_5:

    goto LABEL_6;
  }
  v7 = -[PXCuratedLibraryViewModel zoomLevel](self->_viewModel, "zoomLevel");

  v6 = v4;
  if (v7 == 1)
  {
    -[PXCuratedLibraryViewModel assetsDataSourceManager](self->_viewModel, "assetsDataSourceManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataSourceForZoomLevel:", -[PXCuratedLibraryViewModel zoomLevel](self->_viewModel, "zoomLevel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "assetCollectionReferenceNearestToObjectReference:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
LABEL_6:

  return v6;
}

- (void)prepareForSlideshowForAssetCollectionReference:(id)a3
{
  -[PXCuratedLibraryAssetCollectionSkimmingModel _prepareIndexesForAssetCollectionReference:willStartSkimming:willStartSlideshow:](self, "_prepareIndexesForAssetCollectionReference:willStartSkimming:willStartSlideshow:", a3, 0, 0);
}

- (void)prepareForShowingHintsForAssetCollectionReference:(id)a3
{
  -[PXCuratedLibraryAssetCollectionSkimmingModel _prepareIndexesForAssetCollectionReference:willStartSkimming:willStartSlideshow:](self, "_prepareIndexesForAssetCollectionReference:willStartSkimming:willStartSlideshow:", a3, 0, 0);
}

- (void)prepareForSkimmingInAssetCollectionReference:(id)a3
{
  -[PXCuratedLibraryAssetCollectionSkimmingModel _prepareIndexesForAssetCollectionReference:willStartSkimming:willStartSlideshow:](self, "_prepareIndexesForAssetCollectionReference:willStartSkimming:willStartSlideshow:", a3, 1, 0);
}

- (void)transitionToSlideshow
{
  if (!self->_isPlayingSlideshow)
  {
    *(_WORD *)&self->_isPlayingSlideshow = 1;
    -[PXCuratedLibraryAssetCollectionSkimmingModel _updateViewModel](self, "_updateViewModel");
  }
}

- (void)transitionToSkimming
{
  if (!self->_isInteractionInProgress)
  {
    *(_WORD *)&self->_isPlayingSlideshow = 256;
    -[PXCuratedLibraryAssetCollectionSkimmingModel _updateViewModel](self, "_updateViewModel");
  }
}

- (void)_prepareIndexesForAssetCollectionReference:(id)a3 willStartSkimming:(BOOL)a4 willStartSlideshow:(BOOL)a5
{
  id v7;
  int64_t v8;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int64_t skimmingZoomLevel;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  PXIndexPathSet *v23;
  PXIndexPathSet *indexPathSetForSkimming;
  PXIndexPathSet *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  __int128 v30;
  void *v31;
  void *v32;
  PXIndexPathSet *v33;
  PXSimpleIndexPath *p_initialIndexPath;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  PXIndexPathSet *v38;
  __int128 v39;
  PXIndexPathSet *v40;
  PXIndexPathSet *v41;
  __int128 v42;
  __int128 v43;
  void *v44;
  void *v45;
  objc_class *v46;
  void *v47;
  void *v48;
  void *v49;
  _BOOL4 v51;
  _OWORD v53[2];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[5];
  _QWORD v59[4];
  id v60;
  PXCuratedLibraryAssetCollectionSkimmingModel *v61;
  __int128 *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _OWORD v67[2];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  id v72;
  _BYTE v73[128];
  uint64_t v74;

  v51 = a5;
  v74 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = -[PXCuratedLibraryViewModel zoomLevel](self->_viewModel, "zoomLevel");
  self->_zoomLevel = v8;
  if (v8 == 1)
  {
    objc_msgSend(v7, "assetCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "px_highlightKind");

    if (v12 != 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "assetCollection");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibrarySkimmingController.m"), 546, CFSTR("Expected Year highlight, received %@"), v45);

    }
    self->_skimmingZoomLevel = 2;
  }
  else if ((unint64_t)(v8 - 2) < 3 || v8 == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibrarySkimmingController.m"), 554, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  objc_storeStrong((id *)&self->_containingAssetCollectionReference, a3);
  -[PXCuratedLibraryViewModel assetsDataSourceManager](self->_viewModel, "assetsDataSourceManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  skimmingZoomLevel = self->_skimmingZoomLevel;
  v72 = 0;
  objc_msgSend(v13, "assetCollectionReferencesInDataSourceForZoomLevel:withParentAssetCollectionReference:assetCollectionReferenceWithSameKeyAssetAsParent:", skimmingZoomLevel, v7, &v72);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v72;
  v17 = objc_alloc_init((Class)off_1E50B3668);
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v18 = v15;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v69 != v20)
          objc_enumerationMutation(v18);
        v22 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
        if (v22)
          objc_msgSend(v22, "indexPath");
        else
          memset(v67, 0, sizeof(v67));
        objc_msgSend(v17, "addIndexPath:", v67);
      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
    }
    while (v19);
  }

  v23 = (PXIndexPathSet *)objc_msgSend(v17, "copy");
  indexPathSetForSkimming = self->_indexPathSetForSkimming;
  self->_indexPathSetForSkimming = v23;

  if (a4 || v51)
  {
    v25 = self->_indexPathSetForSkimming;
    *(_QWORD *)&v65 = 0;
    *((_QWORD *)&v65 + 1) = &v65;
    *(_QWORD *)&v66 = 0x2020000000;
    BYTE8(v66) = 0;
    v26 = -[PXIndexPathSet count](v25, "count");
    v27 = MEMORY[0x1E0C809B0];
    if (v26 >= 1)
    {
      if (v25)
      {
        -[PXIndexPathSet anySectionIndexPath](v25, "anySectionIndexPath");
        v28 = v63;
      }
      else
      {
        v28 = 0;
        v63 = 0u;
        v64 = 0u;
      }
      -[PXIndexPathSet sectionIndexSetForDataSourceIdentifier:](v25, "sectionIndexSetForDataSourceIdentifier:", v28);
      v59[0] = v27;
      v59[1] = 3221225472;
      v59[2] = __128__PXCuratedLibraryAssetCollectionSkimmingModel__prepareIndexesForAssetCollectionReference_willStartSkimming_willStartSlideshow___block_invoke;
      v59[3] = &unk_1E5137520;
      v62 = &v65;
      v29 = (id)objc_claimAutoreleasedReturnValue();
      v60 = v29;
      v61 = self;
      objc_msgSend(v13, "performChanges:", v59);

    }
    v58[0] = v27;
    v58[1] = 3221225472;
    v58[2] = __128__PXCuratedLibraryAssetCollectionSkimmingModel__prepareIndexesForAssetCollectionReference_willStartSkimming_willStartSlideshow___block_invoke_2;
    v58[3] = &unk_1E5137548;
    v58[4] = self;
    objc_msgSend(v13, "performChanges:", v58);
    _Block_object_dispose(&v65, 8);

  }
  v65 = 0u;
  v66 = 0u;
  if (v16)
  {
    objc_msgSend(v16, "indexPath");
  }
  else
  {
    v30 = *((_OWORD *)off_1E50B8778 + 1);
    v65 = *(_OWORD *)off_1E50B8778;
    v66 = v30;
  }
  if ((_QWORD)v65 == *(_QWORD *)off_1E50B7E98)
  {
    objc_msgSend(v13, "dataSourceForZoomLevel:", self->_skimmingZoomLevel);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectReferenceNearestToObjectReference:", v7);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = (objc_class *)objc_opt_class();
        NSStringFromClass(v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "px_descriptionForAssertionMessage");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibrarySkimmingController.m"), 594, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("[dataSource objectReferenceNearestToObjectReference:assetCollectionReference]"), v47, v48);

      }
    }
    if (v31)
    {
      objc_msgSend(v31, "indexPathForAssetCollectionReference:", v32);
    }
    else
    {
      v56 = 0u;
      v57 = 0u;
    }
    v65 = v56;
    v66 = v57;
    if ((-[PXIndexPathSet containsIndexPath:](self->_indexPathSetForSkimming, "containsIndexPath:", &v56) & 1) == 0)
    {
      v56 = 0u;
      v57 = 0u;
      v33 = self->_indexPathSetForSkimming;
      p_initialIndexPath = &self->_initialIndexPath;
      if (v33)
      {
        v35 = *(_OWORD *)&self->_initialIndexPath.item;
        v54 = *(_OWORD *)&p_initialIndexPath->dataSourceIdentifier;
        v55 = v35;
        -[PXIndexPathSet indexPathLessThanIndexPath:](v33, "indexPathLessThanIndexPath:", &v54);
        v33 = self->_indexPathSetForSkimming;
      }
      v54 = v56;
      v55 = v57;
      if (-[PXIndexPathSet containsIndexPath:](v33, "containsIndexPath:", &v54))
      {
        v36 = v56;
        v37 = v57;
      }
      else
      {
        v38 = self->_indexPathSetForSkimming;
        if (v38)
        {
          v39 = *(_OWORD *)&self->_initialIndexPath.item;
          v53[0] = *(_OWORD *)&p_initialIndexPath->dataSourceIdentifier;
          v53[1] = v39;
          -[PXIndexPathSet indexPathGreaterThanIndexPath:](v38, "indexPathGreaterThanIndexPath:", v53);
        }
        else
        {
          v54 = 0u;
          v55 = 0u;
        }
        v36 = v54;
        v37 = v55;
      }
      v65 = v36;
      v66 = v37;
    }

  }
  v40 = self->_indexPathSetForSkimming;
  v56 = v65;
  v57 = v66;
  if ((-[PXIndexPathSet containsIndexPath:](v40, "containsIndexPath:", &v56) & 1) == 0)
  {
    v41 = self->_indexPathSetForSkimming;
    if (v41)
    {
      -[PXIndexPathSet anySectionIndexPath](v41, "anySectionIndexPath");
    }
    else
    {
      v56 = 0u;
      v57 = 0u;
    }
    v65 = v56;
    v66 = v57;
  }
  v42 = v65;
  v43 = v66;
  *(_OWORD *)&self->_initialIndexPath.dataSourceIdentifier = v65;
  *(_OWORD *)&self->_initialIndexPath.item = v43;
  self->_isPlayingSlideshow = v51;
  self->_isInteractionInProgress = a4;
  *(_OWORD *)&self->_skimmedIndexPath.dataSourceIdentifier = v42;
  *(_OWORD *)&self->_skimmedIndexPath.item = v43;
  -[PXCuratedLibraryAssetCollectionSkimmingModel _updateViewModel](self, "_updateViewModel");

}

- (void)tearDownAfterSkimmingShowHints:(BOOL)a3 persistState:(BOOL)a4
{
  void *v6;
  id dataSourcePauseToken;
  PXAssetCollectionReference *containingAssetCollectionReference;
  PXIndexPathSet *indexPathSetForSkimming;
  __int128 v10;
  __int128 v11;
  _QWORD v12[5];

  if (self->_skimmingZoomLevel)
  {
    if (a4)
      -[PXCuratedLibraryAssetCollectionSkimmingModel persistSkimmingState](self, "persistSkimmingState");
    if (self->_dataSourcePauseToken)
    {
      -[PXCuratedLibraryViewModel assetsDataSourceManager](self->_viewModel, "assetsDataSourceManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __92__PXCuratedLibraryAssetCollectionSkimmingModel_tearDownAfterSkimmingShowHints_persistState___block_invoke;
      v12[3] = &unk_1E5137548;
      v12[4] = self;
      objc_msgSend(v6, "performChanges:", v12);

      dataSourcePauseToken = self->_dataSourcePauseToken;
      self->_dataSourcePauseToken = 0;

    }
    *(_WORD *)&self->_isPlayingSlideshow = 0;
    if (!a3)
    {
      containingAssetCollectionReference = self->_containingAssetCollectionReference;
      self->_containingAssetCollectionReference = 0;

      v10 = *(_OWORD *)off_1E50B8778;
      v11 = *((_OWORD *)off_1E50B8778 + 1);
      *(_OWORD *)&self->_skimmedIndexPath.dataSourceIdentifier = *(_OWORD *)off_1E50B8778;
      *(_OWORD *)&self->_skimmedIndexPath.item = v11;
      indexPathSetForSkimming = self->_indexPathSetForSkimming;
      self->_indexPathSetForSkimming = 0;

      *(_OWORD *)&self->_initialIndexPath.dataSourceIdentifier = v10;
      *(_OWORD *)&self->_initialIndexPath.item = v11;
      self->_skimmingZoomLevel = 0;
    }
    -[PXCuratedLibraryAssetCollectionSkimmingModel _updateViewModel](self, "_updateViewModel", v10, v11);
  }
}

- (void)setSkimmedIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v3;

  if (a3->section != self->_skimmedIndexPath.section)
  {
    v3 = *(_OWORD *)&a3->item;
    *(_OWORD *)&self->_skimmedIndexPath.dataSourceIdentifier = *(_OWORD *)&a3->dataSourceIdentifier;
    *(_OWORD *)&self->_skimmedIndexPath.item = v3;
    -[PXCuratedLibraryAssetCollectionSkimmingModel _updateViewModel](self, "_updateViewModel");
  }
}

- (void)_updateViewModel
{
  PXCuratedLibraryViewModel *viewModel;
  _QWORD v3[5];

  viewModel = self->_viewModel;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64__PXCuratedLibraryAssetCollectionSkimmingModel__updateViewModel__block_invoke;
  v3[3] = &unk_1E5143468;
  v3[4] = self;
  -[PXCuratedLibraryViewModel performChanges:](viewModel, "performChanges:", v3);
}

- (void)persistSkimmingState
{
  int64_t dataSourceIdentifier;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  PXCuratedLibraryAssetCollectionSkimmingModel *v10;
  int64_t v11;
  __int128 v12;
  int64_t v13;
  __int128 v14;
  int64_t subitem;

  if (self->_skimmingZoomLevel)
  {
    dataSourceIdentifier = self->_skimmedIndexPath.dataSourceIdentifier;
    v14 = *(_OWORD *)&self->_skimmedIndexPath.section;
    subitem = self->_skimmedIndexPath.subitem;
    -[PXCuratedLibraryViewModel assetsDataSourceManager](self->_viewModel, "assetsDataSourceManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataSourceForZoomLevel:", self->_skimmingZoomLevel);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "identifier") == dataSourceIdentifier)
    {
      v11 = dataSourceIdentifier;
      v12 = v14;
      v13 = subitem;
      objc_msgSend(v5, "keyAssetsInSectionIndexPath:", &v11);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __68__PXCuratedLibraryAssetCollectionSkimmingModel_persistSkimmingState__block_invoke;
        v8[3] = &unk_1E5137570;
        v9 = v7;
        v10 = self;
        objc_msgSend(v4, "performChanges:", v8);

      }
    }

  }
}

- (PXAssetCollectionReference)containingAssetCollectionReference
{
  return self->_containingAssetCollectionReference;
}

- (BOOL)isPlayingSlideshow
{
  return self->_isPlayingSlideshow;
}

- (BOOL)isInteractionInProgress
{
  return self->_isInteractionInProgress;
}

- (PXIndexPathSet)indexPathSetForSkimming
{
  return self->_indexPathSetForSkimming;
}

- (PXSimpleIndexPath)initialIndexPath
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].item;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[2].dataSourceIdentifier;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (PXSimpleIndexPath)skimmedIndexPath
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].item;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[3].dataSourceIdentifier;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPathSetForSkimming, 0);
  objc_storeStrong((id *)&self->_containingAssetCollectionReference, 0);
  objc_storeStrong(&self->_dataSourcePauseToken, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

void __68__PXCuratedLibraryAssetCollectionSkimmingModel_persistSkimmingState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "containingAssetCollectionReference");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTransientKeyAsset:forAssetCollection:zoomLevel:", v3, v6, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));

}

void __64__PXCuratedLibraryAssetCollectionSkimmingModel__updateViewModel__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  PXCuratedLibraryAssetCollectionSkimmingInfo *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  _OWORD v13[2];

  v3 = a2;
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "count");
  v5 = objc_msgSend(*(id *)(a1 + 32), "isPlayingSlideshow");
  if (v4 > 1)
    v6 = v5;
  else
    v6 = 0;
  v7 = objc_msgSend(*(id *)(a1 + 32), "isInteractionInProgress");
  v8 = v7;
  if ((v6 & 1) != 0 || (_DWORD)v7)
  {
    v9 = objc_alloc_init(PXCuratedLibraryAssetCollectionSkimmingInfo);
    -[PXCuratedLibraryAssetCollectionSkimmingInfo setSlideshowStarted:](v9, "setSlideshowStarted:", v6);
    -[PXCuratedLibraryAssetCollectionSkimmingInfo setTouchInteractionStarted:](v9, "setTouchInteractionStarted:", v8);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "assetCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryAssetCollectionSkimmingInfo setParentAssetCollection:](v9, "setParentAssetCollection:", v10);

    -[PXCuratedLibraryAssetCollectionSkimmingInfo setChildCollectionsZoomLevel:](v9, "setChildCollectionsZoomLevel:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    -[PXCuratedLibraryAssetCollectionSkimmingInfo setChildCollectionsIndexes:](v9, "setChildCollectionsIndexes:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(_OWORD *)(v11 + 112);
    v13[0] = *(_OWORD *)(v11 + 96);
    v13[1] = v12;
    -[PXCuratedLibraryAssetCollectionSkimmingInfo setCurrentChildCollectionIndexPath:](v9, "setCurrentChildCollectionIndexPath:", v13);
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v3, "setSkimmingInfo:", v9);

}

uint64_t __92__PXCuratedLibraryAssetCollectionSkimmingModel_tearDownAfterSkimmingShowHints_persistState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resumeChangeDelivery:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
}

uint64_t __128__PXCuratedLibraryAssetCollectionSkimmingModel__prepareIndexesForAssetCollectionReference_willStartSkimming_willStartSlideshow___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "forceAccurateSectionsIfNeeded:inZoomLevel:", a1[4], *(_QWORD *)(a1[5] + 24));
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

void __128__PXCuratedLibraryAssetCollectionSkimmingModel__prepareIndexesForAssetCollectionReference_willStartSkimming_willStartSlideshow___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "pauseChangeDeliveryWithTimeout:identifier:", CFSTR("PXCuratedLibrarySkimmingController"), 180.0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v3;

}

@end
