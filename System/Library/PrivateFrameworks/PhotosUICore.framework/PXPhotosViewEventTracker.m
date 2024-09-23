@implementation PXPhotosViewEventTracker

- (PXPhotosViewEventTracker)initWithViewName:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosViewEventTracker.m"), 91, CFSTR("%s is not available as initializer"), "-[PXPhotosViewEventTracker initWithViewName:]");

  abort();
}

- (PXPhotosViewEventTracker)initWithViewModel:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  PXPhotosViewEventTracker *v9;
  PXPhotosViewEventTracker *v10;
  void *v11;
  objc_super v13;

  v5 = a3;
  v6 = (void *)objc_opt_class();
  objc_msgSend(v5, "currentDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "analyticsViewNameForDataSource:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v13.receiver = self;
  v13.super_class = (Class)PXPhotosViewEventTracker;
  v9 = -[PXMediaViewControllerEventTracker initWithViewName:](&v13, sel_initWithViewName_, v8);
  v10 = v9;
  if (v9)
  {
    -[PXPhotosViewEventTracker registerChangeObserver:context:](v9, "registerChangeObserver:context:", v9, EventTrackerObserverContext_211962);
    objc_storeStrong((id *)&v10->_viewModel, a3);
    -[PXPhotosViewModel registerChangeObserver:context:](v10->_viewModel, "registerChangeObserver:context:", v10, ViewModelObservationContext_211963);
    -[PXUserInterfaceElementEventTracker updater](v10, "updater");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addUpdateSelector:", sel__updateTrackedValues);

  }
  return v10;
}

- (void)_invalidateTrackedValues
{
  id v2;

  -[PXUserInterfaceElementEventTracker updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateTrackedValues);

}

- (void)_updateTrackedValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;

  if (-[PXViewControllerEventTracker isViewVisible](self, "isViewVisible"))
  {
    -[PXPhotosViewEventTracker viewModel](self, "viewModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "isInSelectMode"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "containerCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EEA14980))
      v7 = v6;
    else
      v7 = 0;
    v9 = v7;

    v8 = v9;
  }
  else
  {
    v4 = 0;
    v8 = 0;
  }
  v10 = v8;
  -[PXMediaViewControllerEventTracker setDisplayedAssetCollection:](self, "setDisplayedAssetCollection:", v8);
  -[PXPhotosViewEventTracker setIsInSelectModeValue:](self, "setIsInSelectModeValue:", v4);

}

- (void)setIsInSelectModeValue:(id)a3
{
  NSNumber *v5;
  NSNumber *v6;
  NSNumber *v7;
  char v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = (NSNumber *)a3;
  v6 = self->_isInSelectModeValue;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[NSNumber isEqual:](v5, "isEqual:", v6);

    if ((v8 & 1) == 0)
    {
      if (-[NSNumber BOOLValue](self->_isInSelectModeValue, "BOOLValue"))
      {
        -[PXUserInterfaceElementEventTracker timeIntervalSinceTimestamp:](self, "timeIntervalSinceTimestamp:", self->_isInSelectModeValueTimestamp);
        v10 = v9;
        objc_msgSend((id)objc_opt_class(), "selectModeImpressionMinimumDuration");
        if (v10 >= v11)
        {
          v12 = (void *)MEMORY[0x1E0D09910];
          v17 = *MEMORY[0x1E0D09830];
          -[PXMediaViewControllerEventTracker viewName](self, "viewName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v18[0] = v13;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXUserInterfaceElementEventTracker finalPayloadWithPayload:](self, "finalPayloadWithPayload:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.selectModeEntered"), v15);

        }
      }
      objc_storeStrong((id *)&self->_isInSelectModeValue, a3);
      -[PXUserInterfaceElementEventTracker currentTimestamp](self, "currentTimestamp");
      self->_isInSelectModeValueTimestamp = v16;
    }
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8;
  _QWORD v9[5];
  objc_super v10;

  v8 = a3;
  if ((void *)EventTrackerObserverContext_211962 == a5)
  {
    if ((a4 & 8) == 0)
      goto LABEL_6;
LABEL_5:
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__PXPhotosViewEventTracker_observable_didChange_context___block_invoke;
    v9[3] = &unk_1E51479C8;
    v9[4] = self;
    -[PXPhotosViewEventTracker performChanges:](self, "performChanges:", v9);
    goto LABEL_6;
  }
  if ((void *)ViewModelObservationContext_211963 == a5)
  {
    if ((a4 & 5) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v10.receiver = self;
  v10.super_class = (Class)PXPhotosViewEventTracker;
  -[PXMediaViewControllerEventTracker observable:didChange:context:](&v10, sel_observable_didChange_context_, v8, a4, a5);
LABEL_6:

}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (NSNumber)isInSelectModeValue
{
  return self->_isInSelectModeValue;
}

- (double)isInSelectModeValueTimestamp
{
  return self->_isInSelectModeValueTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isInSelectModeValue, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

uint64_t __57__PXPhotosViewEventTracker_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateTrackedValues");
}

+ (id)analyticsViewNameForDataSource:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __CFString *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  int v15;
  const __CFString *v16;
  const __CFString *v17;
  char v18;
  void *v19;

  v3 = a3;
  objc_msgSend(v3, "containerCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    goto LABEL_10;
  if ((objc_msgSend(v4, "px_isRecentsSmartAlbum") & 1) == 0)
  {
    if ((objc_msgSend(v5, "px_isOwnedSharedAlbum") & 1) != 0)
    {
      v6 = CFSTR("PhotosView_sharedAlbumOwned");
      goto LABEL_32;
    }
    if ((objc_msgSend(v5, "px_isImportedAlbum") & 1) != 0)
    {
      v6 = CFSTR("PhotosView_smartImported");
      goto LABEL_32;
    }
    if ((objc_msgSend(v5, "px_isAllLibraryDuplicatesSmartAlbum") & 1) != 0)
    {
      v6 = CFSTR("DuplicatesAlbum");
      goto LABEL_32;
    }
LABEL_10:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = CFSTR("PhotosView");
      goto LABEL_32;
    }
    v7 = v5;
    if (objc_msgSend(v7, "isTransient")
      && (objc_msgSend(v7, "transientIdentifier"), v8 = (void *)objc_claimAutoreleasedReturnValue(),
                                                   v8,
                                                   v8))
    {
      objc_msgSend(v7, "transientIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "hasPrefix:", CFSTR("PXFeaturedPhotosVirtualCollection"));

      if ((v10 & 1) != 0)
      {
        v6 = CFSTR("PhotosView_PXFeaturedPhotosVirtualCollection");
LABEL_31:

        goto LABEL_32;
      }
      v19 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "transientIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("PhotosView_%@"), v14);
    }
    else
    {
      objc_msgSend(v3, "container");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      objc_msgSend(v3, "container");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((isKindOfClass & 1) != 0)
      {
        v15 = objc_msgSend(v13, "detectionType");
        v16 = CFSTR("PhotosView_personUnknown");
        if ((unsigned __int16)v15 == 3)
          v16 = CFSTR("PhotosView_personDog");
        if ((unsigned __int16)v15 == 4)
          v17 = CFSTR("PhotosView_personCat");
        else
          v17 = v16;
        if (v15 == 1)
          v6 = CFSTR("PhotosView_personHuman");
        else
          v6 = (__CFString *)v17;
        goto LABEL_30;
      }
      objc_opt_class();
      v18 = objc_opt_isKindOfClass();

      if ((v18 & 1) != 0)
      {
        v6 = CFSTR("PhotosView_socialGroup");
        goto LABEL_31;
      }
      objc_msgSend(MEMORY[0x1E0CD13B8], "descriptionForSubtype:", objc_msgSend(v7, "assetCollectionSubtype"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PhotosView_%@"), v14);
    }
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_30:

    goto LABEL_31;
  }
  v6 = CFSTR("PhotosView_smartAlbumRecents");
LABEL_32:

  return v6;
}

+ (double)selectModeImpressionMinimumDuration
{
  return 1.0;
}

@end
