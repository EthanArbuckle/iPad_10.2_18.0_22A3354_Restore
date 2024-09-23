@implementation PXCuratedLibraryEventTracker

- (void)_invalidateCurrentAllPhotosZoomState
{
  id v2;

  -[PXUserInterfaceElementEventTracker updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCurrentAllPhotosZoomState);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8;
  unint64_t v9;
  unint64_t v10;
  int v11;
  _QWORD v12[5];
  char v13;
  char v14;
  char v15;
  char v16;
  objc_super v17;

  v8 = a3;
  if ((void *)CuratedLibraryViewModelObserverContext == a5)
  {
    a5 = (void *)((a4 >> 2) & 1);
    v10 = (a4 >> 13) & 1;
    v11 = (a4 & 0x2800) != 0;
    if ((a4 & 0x800) != 0)
      -[PXCuratedLibraryEventTracker _configureTimerForSlowScrollRegimeUpdatesIfNeeded](self, "_configureTimerForSlowScrollRegimeUpdatesIfNeeded");
    v9 = (a4 >> 2) & 1;
    if (((a4 >> 2) & 1) != 0)
      goto LABEL_15;
  }
  else if ((void *)operator|| == a5)
  {
    LOBYTE(v9) = 0;
    LOBYTE(a5) = a4 & 1;
    LOBYTE(v10) = a4 & 1;
    v11 = a4 & 1;
    if ((a4 & 1) != 0)
    {
LABEL_15:
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __61__PXCuratedLibraryEventTracker_observable_didChange_context___block_invoke;
      v12[3] = &unk_1E51400E0;
      v13 = (char)a5;
      v12[4] = self;
      v14 = v9;
      v15 = v10;
      v16 = v11;
      -[PXCuratedLibraryEventTracker performChanges:](self, "performChanges:", v12);
      goto LABEL_16;
    }
  }
  else if ((void *)EventTrackerObserverContext == a5)
  {
    LOBYTE(a5) = 0;
    LOBYTE(v10) = 0;
    v9 = (a4 >> 3) & 1;
    v11 = v9;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)PXCuratedLibraryEventTracker;
    -[PXMediaViewControllerEventTracker observable:didChange:context:](&v17, sel_observable_didChange_context_, v8, a4, a5);
    LOBYTE(a5) = 0;
    LOBYTE(v9) = 0;
    LOBYTE(v10) = 0;
    v11 = 0;
  }
  if ((v9 & 1) != 0 || (v10 & 1) != 0 || v11)
    goto LABEL_15;
LABEL_16:

}

uint64_t __57__PXCuratedLibraryEventTracker_initWithViewModel_layout___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateUserEventSource");
}

uint64_t __52__PXCuratedLibraryEventTracker_logAnalysisProgress___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "setAnalysisProgress:", a2);
}

- (void)setAnalysisProgress:(float)a3
{
  if (self->_analysisProgress != a3)
  {
    self->_analysisProgress = a3;
    if (self->_firstTimeExperienceAnalysisProgress < 0.0)
    {
      self->_firstTimeExperienceAnalysisProgress = a3;
      -[PXCuratedLibraryEventTracker _invalidateFirstTimeExperienceReadinessLogging](self, "_invalidateFirstTimeExperienceReadinessLogging");
    }
  }
}

- (void)_invalidateUserEventSource
{
  id v2;

  -[PXUserInterfaceElementEventTracker updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateUserEventSource);

}

- (void)_invalidateFirstTimeExperienceReadinessLogging
{
  id v2;

  -[PXUserInterfaceElementEventTracker updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateFirstTimeExperienceReadinessLogging);

}

void __61__PXCuratedLibraryEventTracker_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "_invalidateUserEventSource");
  if (*(_BYTE *)(a1 + 41))
    objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentlyViewedZoomLevel");
  if (*(_BYTE *)(a1 + 42))
    objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentAllPhotosZoomState");
  if (*(_BYTE *)(a1 + 43))
    objc_msgSend(*(id *)(a1 + 32), "_invalidateDominantObjectReference");

}

- (void)_invalidateCurrentlyViewedZoomLevel
{
  id v2;

  -[PXUserInterfaceElementEventTracker updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCurrentlyViewedZoomLevel);

}

- (PXCuratedLibraryEventTracker)initWithViewModel:(id)a3 layout:(id)a4
{
  id v7;
  id v8;
  PXCuratedLibraryEventTracker *v9;
  PXCuratedLibraryEventTracker *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  PXCuratedLibraryEventTracker *v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXCuratedLibraryEventTracker;
  v9 = -[PXMediaViewControllerEventTracker initWithViewName:](&v16, sel_initWithViewName_, CFSTR("CuratedLibrary"));
  v10 = v9;
  if (v9)
  {
    -[PXCuratedLibraryEventTracker registerChangeObserver:context:](v9, "registerChangeObserver:context:", v9, EventTrackerObserverContext);
    v10->_libraryItemsCount = -1;
    v10->_analysisProgress = -1.0;
    v10->_firstTimeExperienceAnalysisProgress = -1.0;
    v10->_firstTimeExperienceLibraryItemsCount = -1;
    objc_storeStrong((id *)&v10->_viewModel, a3);
    -[PXCuratedLibraryViewModel registerChangeObserver:context:](v10->_viewModel, "registerChangeObserver:context:", v10, CuratedLibraryViewModelObserverContext);
    -[PXCuratedLibraryViewModel zoomablePhotosViewModel](v10->_viewModel, "zoomablePhotosViewModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "registerChangeObserver:context:", v10, operator||);

    objc_storeStrong((id *)&v10->_layout, a4);
    -[PXUserInterfaceElementEventTracker updater](v10, "updater");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addUpdateSelector:", sel__updateUserEventSource);
    objc_msgSend(v12, "addUpdateSelector:", sel__updateFirstTimeExperienceReadinessLogging);
    objc_msgSend(v12, "addUpdateSelector:", sel__updateCurrentlyViewedZoomLevel);
    objc_msgSend(v12, "addUpdateSelector:", sel__updateCurrentAllPhotosZoomState);
    objc_msgSend(v12, "addUpdateSelector:", sel__updateDominantObjectReference);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __57__PXCuratedLibraryEventTracker_initWithViewModel_layout___block_invoke;
    v14[3] = &unk_1E51479C8;
    v15 = v10;
    -[PXCuratedLibraryEventTracker performChanges:](v15, "performChanges:", v14);

  }
  return v10;
}

- (void)_invalidateDominantObjectReference
{
  id v2;

  -[PXUserInterfaceElementEventTracker updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateDominantObjectReference);

}

- (void)logAnalysisProgress:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  float v6;
  uint64_t v7;
  uint64_t v8;

  if (a3 >= 0.0)
  {
    v7 = v3;
    v8 = v4;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __52__PXCuratedLibraryEventTracker_logAnalysisProgress___block_invoke;
    v5[3] = &unk_1E51400E0;
    v5[4] = self;
    v6 = a3;
    -[PXCuratedLibraryEventTracker performChanges:](self, "performChanges:", v5);
  }
}

- (void)setCurrentlyViewedZoomLevel:(int64_t)a3
{
  int64_t currentlyViewedZoomLevel;

  currentlyViewedZoomLevel = self->_currentlyViewedZoomLevel;
  if (currentlyViewedZoomLevel != a3)
  {
    if (currentlyViewedZoomLevel)
      -[PXCuratedLibraryEventTracker _logDidEndViewingZoomLevel:](self, "_logDidEndViewingZoomLevel:");
    self->_currentlyViewedZoomLevel = a3;
    if (a3)
      -[PXCuratedLibraryEventTracker _logDidStartViewingZoomLevel:](self, "_logDidStartViewingZoomLevel:", a3);
    -[PXCuratedLibraryEventTracker _invalidateCurrentAllPhotosZoomState](self, "_invalidateCurrentAllPhotosZoomState");
  }
}

- (void)_updateUserEventSource
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  -[PXCuratedLibraryEventTracker viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v3, "zoomLevel"))
  {
    case 1:
      v4 = 20;
      break;
    case 2:
      v4 = 21;
      break;
    case 3:
      v4 = 22;
      break;
    case 4:
      objc_msgSend(v3, "zoomablePhotosViewModel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isDisplayingIndividualItems");

      if (v6)
      {
        objc_msgSend(v3, "zoomablePhotosViewModel");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v7)
        {
          v17 = 0;
          v15 = 0u;
          v16 = 0u;
          v13 = 0u;
          v14 = 0u;
          v11 = 0u;
          v12 = 0u;
          goto LABEL_16;
        }
        v8 = v7;
        objc_msgSend(v7, "zoomState");

        v9 = 25;
        v10 = 26;
        if ((_QWORD)v13 != 1)
          v10 = 27;
        if ((uint64_t)v13 <= 2)
          v9 = v10;
        if ((uint64_t)v13 <= 4)
          v4 = v9;
        else
          v4 = 24;
      }
      else
      {
        v4 = 23;
      }
      break;
    default:
LABEL_16:
      v4 = 27;
      break;
  }
  -[PXCuratedLibraryEventTracker setUserEventSource:](self, "setUserEventSource:", v4, v11, v12, v13, v14, v15, v16, v17);

}

- (void)setUserEventSource:(unint64_t)a3
{
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  int v10;
  __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_userEventSource != a3)
  {
    self->_userEventSource = a3;
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (a3 > 0x1B)
        v6 = 0;
      else
        v6 = off_1E51470B8[a3];
      v7 = v6;
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "[CuratedLibraryEventTracker]: Updating event source to <%@>", (uint8_t *)&v10, 0xCu);

    }
    -[PXViewControllerEventTracker currentViewController](self, "currentViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[PXCuratedLibraryEventTracker userEventTracker](self, "userEventTracker");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "eventSourceDidChange:sender:", -[PXCuratedLibraryEventTracker userEventSource](self, "userEventSource"), v8);

    }
  }
}

- (void)_logDidStartViewingZoomLevel:(int64_t)a3
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  if (-[PXCuratedLibraryEventTracker currentZoomLevelSignpost](self, "currentZoomLevelSignpost"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryEventTracker.m"), 277, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.currentZoomLevelSignpost == CPAnalyticsSignpostIDNull"));

  }
  -[PXCuratedLibraryEventTracker setCurrentZoomLevelSignpost:](self, "setCurrentZoomLevelSignpost:", objc_msgSend(MEMORY[0x1E0D09910], "startSignpost"));
  v6 = (void *)MEMORY[0x1E0D09910];
  v7 = *MEMORY[0x1E0D09748];
  v13[0] = *MEMORY[0x1E0D09830];
  PXCuratedLibraryAnalyticsViewNameForZoomLevel(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  v13[1] = *MEMORY[0x1E0D09868];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[PXCuratedLibraryEventTracker currentZoomLevelSignpost](self, "currentZoomLevelSignpost"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUserInterfaceElementEventTracker finalPayloadWithPayload:](self, "finalPayloadWithPayload:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendEvent:withPayload:", v7, v11);

}

- (int64_t)currentZoomLevelSignpost
{
  return self->_currentZoomLevelSignpost;
}

- (void)setCurrentZoomLevelSignpost:(int64_t)a3
{
  self->_currentZoomLevelSignpost = a3;
}

- (void)_updateCurrentAllPhotosZoomState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _OWORD v9[6];
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  if (-[PXViewControllerEventTracker isViewVisible](self, "isViewVisible")
    && -[PXCuratedLibraryEventTracker currentlyViewedZoomLevel](self, "currentlyViewedZoomLevel") == 4)
  {
    -[PXCuratedLibraryEventTracker viewModel](self, "viewModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "zoomablePhotosViewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v17 = 0;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    if (v4)
      objc_msgSend(v4, "zoomState");
    v6 = 0;
    if (!objc_msgSend(v3, "zoomLevelTransitionPhase") && BYTE11(v14) && !BYTE8(v14))
    {
      if (objc_msgSend(v5, "isDisplayingIndividualItems"))
      {
        v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.photos.CPAnalytics.curatedLibraryAllPhotos%liColumnsDisplayed"), (_QWORD)v13);
      }
      else
      {
        v8 = objc_alloc(MEMORY[0x1E0CB3940]);
        v9[4] = v15;
        v9[5] = v16;
        v10 = v17;
        v9[0] = v11;
        v9[1] = v12;
        v9[2] = v13;
        v9[3] = v14;
        v7 = objc_msgSend(v8, "initWithFormat:", CFSTR("com.apple.photos.CPAnalytics.curatedLibraryAllPhotosDenseLevel%liDisplayed"), objc_msgSend(v5, "denseZoomLevelForZoomState:", v9));
      }
      v6 = (void *)v7;
    }

  }
  else
  {
    v6 = 0;
  }
  -[PXCuratedLibraryEventTracker setCurrentAllPhotosZoomStateName:](self, "setCurrentAllPhotosZoomStateName:", v6);

}

- (void)setCurrentAllPhotosZoomStateName:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *currentAllPhotosZoomStateName;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_currentAllPhotosZoomStateName;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      if (self->_currentAllPhotosZoomStateName)
        -[PXCuratedLibraryEventTracker _logDidEndViewingAllPhotosZoomStateName:](self, "_logDidEndViewingAllPhotosZoomStateName:");
      v6 = (NSString *)-[NSString copy](v8, "copy");
      currentAllPhotosZoomStateName = self->_currentAllPhotosZoomStateName;
      self->_currentAllPhotosZoomStateName = v6;

      if (self->_currentAllPhotosZoomStateName)
        -[PXCuratedLibraryEventTracker _logDidStartViewingAllPhotosZoomStateName:](self, "_logDidStartViewingAllPhotosZoomStateName:");
    }
  }

}

- (int64_t)currentlyViewedZoomLevel
{
  return self->_currentlyViewedZoomLevel;
}

- (void)_updateCurrentlyViewedZoomLevel
{
  void *v3;
  uint64_t v4;

  if (-[PXViewControllerEventTracker isViewVisible](self, "isViewVisible"))
  {
    -[PXCuratedLibraryEventTracker viewModel](self, "viewModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "zoomLevel");

  }
  else
  {
    v4 = 0;
  }
  -[PXCuratedLibraryEventTracker setCurrentlyViewedZoomLevel:](self, "setCurrentlyViewedZoomLevel:", v4);
}

- (void)_updateDominantObjectReference
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  _BOOL4 v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  -[PXCuratedLibraryEventTracker viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "scrollRegime") || objc_msgSend(v3, "zoomLevelTransitionPhase"))
  {
    -[PXViewControllerEventTracker isViewVisible](self, "isViewVisible");
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "zoomablePhotosViewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "zoomState");
      v7 = BYTE8(v13) != 0;
    }
    else
    {
      v7 = 0;
      v16 = 0;
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
    }

    v8 = -[PXViewControllerEventTracker isViewVisible](self, "isViewVisible");
    v4 = 0;
    if (!v7 && v8)
    {
      -[PXCuratedLibraryEventTracker layout](self, "layout");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dominantObjectReference");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  -[PXCuratedLibraryEventTracker setDominantObjectReference:](self, "setDominantObjectReference:", v4, v10, v11, v12, v13, v14, v15, v16);

}

- (PXCuratedLibraryViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setDominantObjectReference:(id)a3
{
  PXSectionedObjectReference *v5;
  void *v6;
  char v7;
  void *v8;
  PXSectionedObjectReference *v9;

  v9 = (PXSectionedObjectReference *)a3;
  v5 = self->_dominantObjectReference;
  v6 = v9;
  if (v5 == v9)
    goto LABEL_10;
  v7 = -[PXSectionedObjectReference isEqual:](v9, "isEqual:", v5);

  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_dominantObjectReference, a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PXSectionedObjectReference asset](v9, "asset");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[PXSectionedObjectReference assetCollection](v9, "assetCollection");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = 0;
LABEL_9:
        -[PXMediaViewControllerEventTracker setDisplayedAsset:](self, "setDisplayedAsset:", v6);
        -[PXMediaViewControllerEventTracker setDisplayedAssetCollection:](self, "setDisplayedAssetCollection:", v8);

LABEL_10:
        goto LABEL_11;
      }
      v6 = 0;
    }
    v8 = 0;
    goto LABEL_9;
  }
LABEL_11:

}

- (PXCuratedLibraryLayout)layout
{
  return self->_layout;
}

- (void)_updateFirstTimeExperienceReadinessLogging
{
  float v3;
  float v4;
  float v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  NSObject *v18;
  __CFString *v19;
  __CFString *v20;
  int v21;
  const __CFString *v22;
  __int16 v23;
  __CFString *v24;
  __int16 v25;
  int64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!self->_loggedFirstTimeExperience)
  {
    -[PXCuratedLibraryEventTracker firstTimeExperienceAnalysisProgress](self, "firstTimeExperienceAnalysisProgress");
    if (v3 >= 0.0
      && (-[PXCuratedLibraryEventTracker firstTimeExperienceLibraryItemsCount](self, "firstTimeExperienceLibraryItemsCount") & 0x8000000000000000) == 0)
    {
      self->_loggedFirstTimeExperience = 1;
      -[PXCuratedLibraryEventTracker firstTimeExperienceAnalysisProgress](self, "firstTimeExperienceAnalysisProgress");
      v5 = v4;
      v6 = -[PXCuratedLibraryEventTracker firstTimeExperienceLibraryItemsCount](self, "firstTimeExperienceLibraryItemsCount");
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "integerForKey:", CFSTR("LastCuratedLibraryFirstTimeExperienceReadinessLogged"));

      if (v8 < 1
        || (+[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v10 = objc_msgSend(v9, "firstTimeExperienceAlwaysLogReadiness"),
            v9,
            v10))
      {
        -[PXCuratedLibraryEventTracker userEventTracker](self, "userEventTracker");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v5 <= 0.9)
          v13 = CFSTR("com.apple.photos.CPAnalytics.firstTimeExperienceNotReady");
        else
          v13 = CFSTR("com.apple.photos.CPAnalytics.firstTimeExperienceReady");
        objc_msgSend(v11, "logFirstTimeExpericeReadiness:forLibrarySize:", v5 > 0.9, v6);

        v14 = (void *)MEMORY[0x1E0D09910];
        -[PXUserInterfaceElementEventTracker finalPayloadWithPayload:](self, "finalPayloadWithPayload:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "sendEvent:withPayload:", v13, v15);

        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setInteger:forKey:", 1, CFSTR("LastCuratedLibraryFirstTimeExperienceReadinessLogged"));

        v17 = CFSTR("YES");
      }
      else
      {
        v17 = CFSTR("NO");
      }
      PLUIGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = CFSTR("NO");
        if (v5 > 0.9)
          v19 = CFSTR("YES");
        v20 = v19;
        v21 = 138412802;
        v22 = v17;
        v23 = 2112;
        v24 = v20;
        v25 = 2048;
        v26 = v6;
        _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_DEFAULT, "[CuratedLibraryEventTracker]: FTE did log <%@> isReady <%@> for library size <%li>", (uint8_t *)&v21, 0x20u);

      }
    }
  }
}

- (int64_t)firstTimeExperienceLibraryItemsCount
{
  return self->_firstTimeExperienceLibraryItemsCount;
}

- (float)firstTimeExperienceAnalysisProgress
{
  return self->_firstTimeExperienceAnalysisProgress;
}

- (PXCuratedLibraryEventTracker)initWithViewName:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryEventTracker.m"), 83, CFSTR("%s is not available as initializer"), "-[PXCuratedLibraryEventTracker initWithViewName:]");

  abort();
}

- (void)dealloc
{
  NSTimer *slowScrollRegimeTimer;
  objc_super v4;

  -[NSTimer invalidate](self->_slowScrollRegimeTimer, "invalidate");
  slowScrollRegimeTimer = self->_slowScrollRegimeTimer;
  self->_slowScrollRegimeTimer = 0;

  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryEventTracker;
  -[PXCuratedLibraryEventTracker dealloc](&v4, sel_dealloc);
}

- (id)userEventTracker
{
  return +[PXUserEventTracker sharedInstance](PXUserEventTracker, "sharedInstance");
}

- (void)setLibraryItemsCount:(int64_t)a3
{
  void *v6;

  if (a3 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryEventTracker.m"), 188, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("libraryItemsCount >= 0"));

  }
  if (self->_libraryItemsCount != a3)
  {
    self->_libraryItemsCount = a3;
    if (self->_firstTimeExperienceLibraryItemsCount < 0)
    {
      self->_firstTimeExperienceLibraryItemsCount = a3;
      -[PXCuratedLibraryEventTracker _invalidateFirstTimeExperienceReadinessLogging](self, "_invalidateFirstTimeExperienceReadinessLogging");
    }
  }
}

- (void)_logDidEndViewingZoomLevel:(int64_t)a3
{
  void *v4;
  void *v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[2];
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  PXCuratedLibraryAnalyticsViewNameForZoomLevel(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D09910];
  v6 = -[PXCuratedLibraryEventTracker currentZoomLevelSignpost](self, "currentZoomLevelSignpost");
  v7 = *MEMORY[0x1E0D09878];
  v19 = *MEMORY[0x1E0D09830];
  v8 = v19;
  v20[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUserInterfaceElementEventTracker finalPayloadWithPayload:](self, "finalPayloadWithPayload:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endSignpost:forEventName:withPayload:", v6, v7, v10);

  v11 = (void *)MEMORY[0x1E0D09910];
  v12 = *MEMORY[0x1E0D09750];
  v13 = *MEMORY[0x1E0D09868];
  v17[0] = v8;
  v17[1] = v13;
  v18[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[PXCuratedLibraryEventTracker currentZoomLevelSignpost](self, "currentZoomLevelSignpost"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUserInterfaceElementEventTracker finalPayloadWithPayload:](self, "finalPayloadWithPayload:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendEvent:withPayload:", v12, v16);

  -[PXCuratedLibraryEventTracker setCurrentZoomLevelSignpost:](self, "setCurrentZoomLevelSignpost:", 0);
}

- (void)_logDidStartViewingAllPhotosZoomStateName:(id)a3
{
  void *v5;

  if (-[PXCuratedLibraryEventTracker currentAllPhotosZoomStateSignpost](self, "currentAllPhotosZoomStateSignpost", a3))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryEventTracker.m"), 335, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.currentAllPhotosZoomStateSignpost == CPAnalyticsSignpostIDNull"));

  }
  -[PXCuratedLibraryEventTracker setCurrentAllPhotosZoomStateSignpost:](self, "setCurrentAllPhotosZoomStateSignpost:", objc_msgSend(MEMORY[0x1E0D09910], "startSignpost"));
}

- (void)_logDidEndViewingAllPhotosZoomStateName:(id)a3
{
  void *v4;
  id v5;
  int64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D09910];
  v5 = a3;
  v6 = -[PXCuratedLibraryEventTracker currentAllPhotosZoomStateSignpost](self, "currentAllPhotosZoomStateSignpost");
  v7 = *MEMORY[0x1E0D09708];
  v10 = *MEMORY[0x1E0D09850];
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXUserInterfaceElementEventTracker finalPayloadWithPayload:](self, "finalPayloadWithPayload:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endSignpost:forEventName:withPayload:", v6, v7, v9);

  -[PXCuratedLibraryEventTracker setCurrentAllPhotosZoomStateSignpost:](self, "setCurrentAllPhotosZoomStateSignpost:", 0);
}

- (void)_configureTimerForSlowScrollRegimeUpdatesIfNeeded
{
  void *v3;
  uint64_t v4;
  NSTimer *slowScrollRegimeTimer;
  void *v6;
  NSTimer *v7;
  NSTimer *v8;
  void *v9;
  NSTimer *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id location;

  -[PXCuratedLibraryEventTracker viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "scrollRegime");

  slowScrollRegimeTimer = self->_slowScrollRegimeTimer;
  if (v4 == 1)
  {
    if (!slowScrollRegimeTimer)
    {
      objc_initWeak(&location, self);
      v6 = (void *)MEMORY[0x1E0C99E88];
      v11 = MEMORY[0x1E0C809B0];
      v12 = 3221225472;
      v13 = __81__PXCuratedLibraryEventTracker__configureTimerForSlowScrollRegimeUpdatesIfNeeded__block_invoke;
      v14 = &unk_1E5141230;
      objc_copyWeak(&v15, &location);
      objc_msgSend(v6, "timerWithTimeInterval:repeats:block:", 1, &v11, 0.45);
      v7 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      v8 = self->_slowScrollRegimeTimer;
      self->_slowScrollRegimeTimer = v7;

      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop", v11, v12, v13, v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addTimer:forMode:", self->_slowScrollRegimeTimer, *MEMORY[0x1E0C99860]);
      objc_msgSend(v9, "addTimer:forMode:", self->_slowScrollRegimeTimer, *MEMORY[0x1E0DC55B0]);

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    -[NSTimer invalidate](slowScrollRegimeTimer, "invalidate");
    v10 = self->_slowScrollRegimeTimer;
    self->_slowScrollRegimeTimer = 0;

  }
}

- (void)logLibraryItemsCount:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__PXCuratedLibraryEventTracker_logLibraryItemsCount___block_invoke;
  v3[3] = &unk_1E5144FE8;
  v3[4] = self;
  v3[5] = a3;
  -[PXCuratedLibraryEventTracker performChanges:](self, "performChanges:", v3);
}

- (unint64_t)userEventSource
{
  return self->_userEventSource;
}

- (NSString)currentAllPhotosZoomStateName
{
  return self->_currentAllPhotosZoomStateName;
}

- (int64_t)currentAllPhotosZoomStateSignpost
{
  return self->_currentAllPhotosZoomStateSignpost;
}

- (void)setCurrentAllPhotosZoomStateSignpost:(int64_t)a3
{
  self->_currentAllPhotosZoomStateSignpost = a3;
}

- (PXSectionedObjectReference)dominantObjectReference
{
  return self->_dominantObjectReference;
}

- (int64_t)libraryItemsCount
{
  return self->_libraryItemsCount;
}

- (float)analysisProgress
{
  return self->_analysisProgress;
}

- (void)setFirstTimeExperienceAnalysisProgress:(float)a3
{
  self->_firstTimeExperienceAnalysisProgress = a3;
}

- (void)setFirstTimeExperienceLibraryItemsCount:(int64_t)a3
{
  self->_firstTimeExperienceLibraryItemsCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dominantObjectReference, 0);
  objc_storeStrong((id *)&self->_currentAllPhotosZoomStateName, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_slowScrollRegimeTimer, 0);
}

uint64_t __53__PXCuratedLibraryEventTracker_logLibraryItemsCount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLibraryItemsCount:", *(_QWORD *)(a1 + 40));
}

void __81__PXCuratedLibraryEventTracker__configureTimerForSlowScrollRegimeUpdatesIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __81__PXCuratedLibraryEventTracker__configureTimerForSlowScrollRegimeUpdatesIfNeeded__block_invoke_2;
  v6[3] = &unk_1E5129188;
  objc_copyWeak(&v7, v4);
  objc_msgSend(WeakRetained, "performChanges:", v6);

  objc_destroyWeak(&v7);
}

void __81__PXCuratedLibraryEventTracker__configureTimerForSlowScrollRegimeUpdatesIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidateDominantObjectReference");

}

@end
