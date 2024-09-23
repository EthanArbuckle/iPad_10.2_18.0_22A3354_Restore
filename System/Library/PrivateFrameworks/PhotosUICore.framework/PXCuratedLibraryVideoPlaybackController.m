@implementation PXCuratedLibraryVideoPlaybackController

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6;
  id WeakRetained;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;

  v6 = a4;
  v13 = a3;
  if ((void *)PXCuratedLibraryViewModelObservableContext == a5)
  {
    if ((v6 & 0x805) != 0)
      -[PXGridInlinePlaybackController invalidatePlaybackEnabled](self, "invalidatePlaybackEnabled");
    if ((v6 & 0x2200) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_viewModel);
      v10 = objc_msgSend(WeakRetained, "zoomLevelTransitionPhase");

      if (!v10)
      {
        v11 = objc_loadWeakRetained((id *)&self->_viewModel);
        self->_newZoomLevel = objc_msgSend(v11, "zoomLevel");

        -[PXGridInlinePlaybackController invalidatePlayingRecords](self, "invalidatePlayingRecords");
      }
    }
    if ((v6 & 8) != 0 && -[PXGridInlinePlaybackController shouldPlayOnHover](self, "shouldPlayOnHover"))
      -[PXGridInlinePlaybackController invalidatePlayingRecords](self, "invalidatePlayingRecords");
  }
  else
  {
    if ((void *)PXCuratedLibraryViewModelZoomablePhotosObserverContext_174984 != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryVideoPlaybackController.m"), 113, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((v6 & 1) != 0 && -[PXGridInlinePlaybackController shouldPlayOnHover](self, "shouldPlayOnHover"))
      -[PXGridInlinePlaybackController invalidatePlaybackEnabled](self, "invalidatePlaybackEnabled");
  }

}

- (BOOL)shouldEnablePlayback
{
  PXCuratedLibraryVideoPlaybackController *v2;
  PXCuratedLibraryViewModel **p_viewModel;
  id WeakRetained;
  id v5;
  char v6;
  id v7;
  uint64_t v8;

  v2 = self;
  p_viewModel = &self->_viewModel;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewModel);
  LODWORD(v2) = -[PXCuratedLibraryVideoPlaybackController _canPlayVideosInZoomLevel:](v2, "_canPlayVideosInZoomLevel:", objc_msgSend(WeakRetained, "zoomLevel"));

  if (!(_DWORD)v2)
    return 0;
  v5 = objc_loadWeakRetained((id *)p_viewModel);
  v6 = objc_msgSend(v5, "isSelecting");

  if ((v6 & 1) != 0)
    return 0;
  v7 = objc_loadWeakRetained((id *)p_viewModel);
  v8 = objc_msgSend(v7, "scrollRegime");

  if (v8 > 1)
    return 0;
  else
    return objc_msgSend(off_1E50B1430, "px_accessibilityIsReduceMotionEnabled") ^ 1;
}

- (BOOL)_canPlayVideosInZoomLevel:(int64_t)a3
{
  void *v5;
  int v6;
  id WeakRetained;
  void *v8;
  char v9;

  if ((unint64_t)(a3 - 1) < 3)
    return 1;
  if (a3 != 4)
    return 0;
  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "enableInlinePlaybackInZoomableGrids");

  if (!v6)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewModel);
  objc_msgSend(WeakRetained, "zoomablePhotosViewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isDisplayingIndividualItems");

  return v9;
}

- (BOOL)canUpdatePlayingRecords
{
  id WeakRetained;
  BOOL v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_viewModel);
  v3 = objc_msgSend(WeakRetained, "zoomLevelTransitionPhase") == 0;

  return v3;
}

- (void)setCuratedLibraryLayout:(id)a3
{
  objc_storeStrong((id *)&self->_curatedLibraryLayout, a3);
}

- (id)initViewViewModel:(id)a3
{
  id v4;
  PXCuratedLibraryVideoPlaybackController *v5;
  PXCuratedLibraryVideoPlaybackController *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXCuratedLibraryVideoPlaybackController;
  v5 = -[PXGridInlinePlaybackController init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_viewModel, v4);
    v6->_newZoomLevel = objc_msgSend(v4, "zoomLevel");
    objc_msgSend(v4, "registerChangeObserver:context:", v6, PXCuratedLibraryViewModelObservableContext);
    objc_msgSend(v4, "zoomablePhotosViewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registerChangeObserver:context:", v6, PXCuratedLibraryViewModelZoomablePhotosObserverContext_174984);

  }
  return v6;
}

- (PXCuratedLibraryVideoPlaybackController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryVideoPlaybackController.m"), 70, CFSTR("%s is not available as initializer"), "-[PXCuratedLibraryVideoPlaybackController init]");

  abort();
}

- (id)createPlaybackRecordForDisplayAsset:(id)a3 mediaProvider:(id)a4 geometryReference:(id)a5
{
  id v7;
  id v8;
  id v9;
  PXGridInlineVideoSessionAssetPlaybackRecord *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[PXGridInlineVideoSessionAssetPlaybackRecord initWithDisplayAsset:mediaProvider:spriteReference:playLivePhotosWithSettlingEffectIfPossible:]([PXGridInlineVideoSessionAssetPlaybackRecord alloc], "initWithDisplayAsset:mediaProvider:spriteReference:playLivePhotosWithSettlingEffectIfPossible:", v9, v8, v7, 0);

  return v10;
}

- (CGRect)currentVisibleRect
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[PXCuratedLibraryVideoPlaybackController curatedLibraryLayout](self, "curatedLibraryLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibleRect");
  objc_msgSend(v2, "safeAreaInsets");
  PXEdgeInsetsInsetRect();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)currentHoveredDisplayAsset
{
  PXCuratedLibraryViewModel **p_viewModel;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _OWORD v13[2];
  __int128 v14;
  __int128 v15;

  v14 = 0u;
  v15 = 0u;
  p_viewModel = &self->_viewModel;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewModel);
  objc_msgSend(WeakRetained, "selectionSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "pendingIndexPath");
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
  }

  if ((_QWORD)v14 == *(_QWORD *)off_1E50B7E98)
  {
    v6 = 0;
  }
  else
  {
    v7 = objc_loadWeakRetained((id *)p_viewModel);
    objc_msgSend(v7, "currentDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v14;
    v13[1] = v15;
    objc_msgSend(v8, "objectReferenceAtIndexPath:", v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v6;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = 0;
      goto LABEL_13;
    }
    objc_msgSend(v6, "keyAssetReference");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
LABEL_13:
  objc_msgSend(v10, "asset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)didUpdatePlayingRecords
{
  self->_presentedZoomLevel = self->_newZoomLevel;
}

- (id)filterSortedRecordsToPlay:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  __int128 v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _BOOL4 v23;
  int64_t newZoomLevel;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  __int128 *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "count"))
  {
    v43 = v4;
    goto LABEL_24;
  }
  v42 = v4;
  -[PXCuratedLibraryVideoPlaybackController curatedLibraryLayout](self, "curatedLibraryLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewModel);
  objc_msgSend(WeakRetained, "skimmingInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parentAssetCollection");
  v40 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)v40;
  if (v40)
  {
    v9 = objc_alloc((Class)off_1E50B1668);
    v10 = *((_OWORD *)off_1E50B8778 + 1);
    v54 = *(_OWORD *)off_1E50B8778;
    v55 = v10;
    v39 = (void *)objc_msgSend(v9, "initWithSectionObject:itemObject:subitemObject:indexPath:", v40, 0, 0, &v54);
    v53 = 0;
    v11 = objc_msgSend(v5, "spriteIndexForObjectReference:options:updatedObjectReference:", v39, 1, &v53);
    v38 = v53;
    objc_msgSend(v5, "leafSublayoutForSpriteIndex:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (id)objc_msgSend(v41, "mutableCopy");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v13 = v41;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v50 != v15)
              objc_enumerationMutation(v13);
            v17 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
            objc_msgSend(v17, "geometryReference");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v5, "spriteIndexForSpriteReference:", v18);

            objc_msgSend(v5, "leafSublayoutForSpriteIndex:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "bodyContentLayout");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v21 != v20 && v12 != v20;

            if (v23)
            {
              objc_msgSend(v17, "setDiagnosticLog:", CFSTR("Record doesn't belong to skimming card"));
              objc_msgSend(v43, "removeObject:", v17);
            }

          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
        }
        while (v14);
      }

    }
  }
  else
  {
    newZoomLevel = self->_newZoomLevel;
    if (newZoomLevel == 1)
    {
      objc_msgSend(v5, "libraryBodyLayout");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "composition");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = 0;
        v37 = v41;
        if (objc_msgSend(v36, "presentedNumberOfColumns") >= 2)
        {

          v37 = (id)MEMORY[0x1E0C9AA60];
        }
      }
      else
      {
        v8 = 0;
        v37 = v41;
      }

      v43 = v37;
      goto LABEL_22;
    }
    if (newZoomLevel != 2)
    {
      v43 = v41;
      goto LABEL_22;
    }
    objc_msgSend(v5, "libraryBodyLayout");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "composition");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((objc_msgSend(v27, "presentedSingleColumn") & 1) != 0 || (unint64_t)objc_msgSend(v41, "count") < 2)
      {
        v43 = v41;
      }
      else
      {
        v28 = (void *)objc_msgSend(v41, "mutableCopy");
        v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        *(_QWORD *)&v54 = 0;
        *((_QWORD *)&v54 + 1) = &v54;
        v55 = 0x2020000000uLL;
        v45[0] = MEMORY[0x1E0C809B0];
        v45[1] = 3221225472;
        v45[2] = __69__PXCuratedLibraryVideoPlaybackController_filterSortedRecordsToPlay___block_invoke;
        v45[3] = &unk_1E5131AA8;
        v48 = &v54;
        v30 = v28;
        v46 = v30;
        v31 = v29;
        v47 = v31;
        objc_msgSend(v5, "enumerateVisibleAssetsSectionSublayoutsUsingBlock:", v45);
        objc_msgSend(v31, "allValues");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        PXMap();
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v34 = (void *)objc_msgSend(v41, "mutableCopy");
        v44 = v33;
        PXFilter();
        v43 = (id)objc_claimAutoreleasedReturnValue();

        _Block_object_dispose(&v54, 8);
      }
    }
    else
    {
      v43 = v41;
    }

  }
  v8 = (void *)v40;
LABEL_22:

  v4 = v42;
LABEL_24:

  return v43;
}

- (CGRect)frameForPlaybackRecord:(id)a3 minPlayableSize:(CGSize *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  unsigned int v16;
  int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  CGFloat v25;
  CGFloat v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  _OWORD v46[2];
  uint64_t v47;
  _OWORD v48[2];
  int v49;
  _QWORD v50[4];
  id v51;
  uint64_t *v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  int v63;
  _QWORD v64[4];
  id v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  _OWORD v73[10];
  uint64_t v74;
  CGRect result;

  v74 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PXCuratedLibraryVideoPlaybackController curatedLibraryLayout](self, "curatedLibraryLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "geometryReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v67 = 0;
  v68 = &v67;
  v69 = 0x4010000000;
  v70 = &unk_1A7E74EE7;
  v10 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v71 = *MEMORY[0x1E0C9D648];
  v72 = v10;
  if ((unint64_t)(self->_newZoomLevel - 1) <= 1)
  {
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __82__PXCuratedLibraryVideoPlaybackController_frameForPlaybackRecord_minPlayableSize___block_invoke;
    v64[3] = &unk_1E5131B38;
    v65 = v6;
    v66 = &v67;
    objc_msgSend(v7, "enumerateVisibleAssetsSectionSublayoutsUsingBlock:", v64);
    v11 = v65;
    goto LABEL_17;
  }
  objc_msgSend(v8, "objectReference");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "keyAssetReference");
    v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v11 = v13;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v12;
    goto LABEL_7;
  }
  v11 = 0;
LABEL_9:
  v60 = 0;
  v61 = &v60;
  v62 = 0x2020000000;
  v63 = -1;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__174968;
  v58 = __Block_byref_object_dispose__174969;
  v59 = 0;
  if (v11)
  {
    if (self->_presentedZoomLevel == 4
      && (+[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "enableInlinePlaybackInZoomableGrids"),
          v14,
          v15))
    {
      v16 = objc_msgSend(v7, "spriteIndexForObjectReference:", v11);
      *((_DWORD *)v61 + 6) = v16;
    }
    else
    {
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __82__PXCuratedLibraryVideoPlaybackController_frameForPlaybackRecord_minPlayableSize___block_invoke_149;
      v50[3] = &unk_1E5131B60;
      v52 = &v60;
      v51 = v11;
      v53 = &v54;
      objc_msgSend(v7, "enumerateVisibleAssetsSectionSublayoutsUsingBlock:", v50);
      v17 = objc_msgSend(v7, "convertSpriteIndex:fromDescendantLayout:", *((unsigned int *)v61 + 6), v55[5]);
      *((_DWORD *)v61 + 6) = v17;

      v16 = *((_DWORD *)v61 + 6);
    }
    if (v16 != -1)
    {
      v49 = *(_DWORD *)off_1E50B8298;
      v18 = *((_OWORD *)off_1E50B8358 + 1);
      v48[0] = *(_OWORD *)off_1E50B8358;
      v48[1] = v18;
      v19 = *((_OWORD *)off_1E50B83A0 + 7);
      v73[6] = *((_OWORD *)off_1E50B83A0 + 6);
      v73[7] = v19;
      v20 = *((_OWORD *)off_1E50B83A0 + 9);
      v73[8] = *((_OWORD *)off_1E50B83A0 + 8);
      v73[9] = v20;
      v21 = *((_OWORD *)off_1E50B83A0 + 3);
      v73[2] = *((_OWORD *)off_1E50B83A0 + 2);
      v73[3] = v21;
      v22 = *((_OWORD *)off_1E50B83A0 + 5);
      v73[4] = *((_OWORD *)off_1E50B83A0 + 4);
      v73[5] = v22;
      v23 = *((_OWORD *)off_1E50B83A0 + 1);
      v73[0] = *(_OWORD *)off_1E50B83A0;
      v73[1] = v23;
      v24 = *((_OWORD *)off_1E50B8398 + 1);
      v46[0] = *(_OWORD *)off_1E50B8398;
      v46[1] = v24;
      v47 = *((_QWORD *)off_1E50B8398 + 4);
      objc_msgSend(v7, "copyLayoutForSpritesInRange:entities:geometries:styles:infos:", v16 | 0x100000000, &v49, v48, v73, v46);
      objc_msgSend(v7, "minPlayableSizeForSpriteAtIndex:", *((unsigned int *)v61 + 6));
      a4->width = v25;
      a4->height = v26;
      PXRectWithCenterAndSize();
      v27 = v68;
      v68[4] = v28;
      v27[5] = v29;
      v27[6] = v30;
      v27[7] = v31;
    }
  }
  _Block_object_dispose(&v54, 8);

  _Block_object_dispose(&v60, 8);
LABEL_17:

  objc_msgSend(v7, "displayScale");
  if (v32 > 0.0)
    objc_msgSend(v7, "displayScale");
  PXRectRoundToPixel();
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v41 = (double *)v68;
  *((double *)v68 + 4) = v33;
  v41[5] = v35;
  v41[6] = v37;
  v41[7] = v39;
  _Block_object_dispose(&v67, 8);

  v42 = v34;
  v43 = v36;
  v44 = v38;
  v45 = v40;
  result.size.height = v45;
  result.size.width = v44;
  result.origin.y = v43;
  result.origin.x = v42;
  return result;
}

- (BOOL)canProvideGeometriesForRecords
{
  void *v2;
  char v3;

  -[PXCuratedLibraryVideoPlaybackController curatedLibraryLayout](self, "curatedLibraryLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsObjectReferenceSpriteIndexLookup");

  return v3;
}

- (int64_t)maxNumberOfPlayingItems
{
  id WeakRetained;
  void *v4;
  int64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_viewModel);
  if (-[PXCuratedLibraryVideoPlaybackController _canPlayVideosInZoomLevel:](self, "_canPlayVideosInZoomLevel:", objc_msgSend(WeakRetained, "zoomLevel")))
  {
    +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "maxNumberOfPlayingItems");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)canPlayAsset:(id)a3
{
  void *v3;
  char v4;

  if ((unint64_t)(objc_msgSend(a3, "playbackStyle") - 3) > 2)
    return 0;
  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "enableInlinePlayback");

  return v4;
}

- (void)enumerateRectDiagnosticsForLayout:(id)a3 usingBlock:(id)a4
{
  void (**v5)(id, void *, void *, _BYTE *, double, double, double, double);
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[2];
  unsigned __int8 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *, void *, _BYTE *, double, double, double, double))a4;
  v31 = 0;
  v30[0] = 0;
  v30[1] = 0;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[PXGridInlinePlaybackController currentRecords](self, "currentRecords");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v10);
      -[PXCuratedLibraryVideoPlaybackController frameForPlaybackRecord:minPlayableSize:](self, "frameForPlaybackRecord:minPlayableSize:", v11, v30);
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v20 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v11, "diagnosticLog");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "diagnosticScoresDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "videoStatusDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("\n%@\n%@\n%@"), v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3658], "cyanColor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v25, v24, &v31, v13, v15, v17, v19);

      LODWORD(v25) = v31;
      if ((_DWORD)v25)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (PXCuratedLibraryLayout)curatedLibraryLayout
{
  return self->_curatedLibraryLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curatedLibraryLayout, 0);
  objc_destroyWeak((id *)&self->_viewModel);
}

void __82__PXCuratedLibraryVideoPlaybackController_frameForPlaybackRecord_minPlayableSize___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, uint64_t a6, void *a7, _BYTE *a8)
{
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  double *v23;
  id v24;

  v24 = a7;
  objc_msgSend(v24, "bodyContentLayout");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_12;
  v15 = (void *)v14;
  objc_msgSend(*(id *)(a1 + 32), "displayAsset");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "keyAssetsFetchResult");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v16;
  v20 = v18;
  if (v19 == v20)
  {

LABEL_10:
    v23 = *(double **)(*(_QWORD *)(a1 + 40) + 8);
    v23[4] = a2;
    v23[5] = a3;
    v23[6] = a4;
    v23[7] = a5;
    *a8 = 1;
    goto LABEL_12;
  }
  v21 = v20;
  if (!v19 || !v20)
  {

    goto LABEL_12;
  }
  v22 = objc_msgSend(v19, "isContentEqualTo:", v20);
  if (!v22)
    v22 = objc_msgSend(v21, "isContentEqualTo:", v19);

  if (v22 == 2)
    goto LABEL_10;
LABEL_12:

}

void __82__PXCuratedLibraryVideoPlaybackController_frameForPlaybackRecord_minPlayableSize___block_invoke_149(_QWORD *a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;

  v7 = a3;
  v8 = a1[4];
  v9 = 0;
  *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v7, "spriteIndexForObjectReference:options:updatedObjectReference:", v8, 0, &v9);
  if (*(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) != -1)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
    *a4 = 1;
  }

}

void __69__PXCuratedLibraryVideoPlaybackController_filterSortedRecordsToPlay___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, uint64_t a6, void *a7)
{
  id v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v12 = a7;
  objc_msgSend(v12, "assetCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = PXCuratedLibraryAssetsCollectionRepresentsChapterHeader(v13, 2);

  if (v14)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
  else
  {
    objc_msgSend(v12, "bodyContentLayout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v16 = *(id *)(a1 + 32);
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      if (v17)
      {
        v18 = v17;
        v45 = a1;
        v19 = *(_QWORD *)v47;
LABEL_6:
        v20 = 0;
        while (1)
        {
          if (*(_QWORD *)v47 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v20);
          objc_msgSend(v21, "displayAsset");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "keyAssetsFetchResult");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "firstObject");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v22;
          v26 = v24;
          if (v25 == v26)
            break;
          v27 = v26;
          if (v25)
            v28 = v26 == 0;
          else
            v28 = 1;
          if (v28)
          {

          }
          else
          {
            v29 = objc_msgSend(v25, "isContentEqualTo:", v26);
            v30 = v29;
            if (!v29)
              v30 = objc_msgSend(v27, "isContentEqualTo:", v25);

            if (v30 == 2)
              goto LABEL_23;
          }
          if (v18 == ++v20)
          {
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
            if (v18)
              goto LABEL_6;
            v31 = 0;
            a1 = v45;
            goto LABEL_26;
          }
        }

LABEL_23:
        a1 = v45;
        v32 = *(void **)(v45 + 40);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v45 + 48) + 8) + 24));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectForKeyedSubscript:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "second");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "CGRectValue");

        PXRectArea();
        v44 = a5;
        v37 = v36;
        PXRectArea();
        if (v37 <= v38)
          goto LABEL_25;
        v31 = v21;
        v39 = objc_alloc((Class)off_1E50B5CE0);
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", a2, a3, a4, v44);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)objc_msgSend(v39, "initWithFirst:second:", v31, v40);
        v42 = *(void **)(v45 + 40);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v45 + 48) + 8) + 24));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setObject:forKeyedSubscript:", v41, v43);

      }
      else
      {
LABEL_25:
        v31 = 0;
      }
LABEL_26:

      objc_msgSend(*(id *)(a1 + 32), "removeObject:", v31);
    }
  }

}

uint64_t __69__PXCuratedLibraryVideoPlaybackController_filterSortedRecordsToPlay___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

uint64_t __69__PXCuratedLibraryVideoPlaybackController_filterSortedRecordsToPlay___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "first");
}

@end
