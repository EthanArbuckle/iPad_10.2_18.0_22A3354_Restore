@implementation PXMediaViewControllerEventTracker

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8;
  objc_super v9;

  v8 = a3;
  if ((void *)EventTrackerObservationContext == a5)
  {
    if ((a4 & 8) != 0)
      -[PXMediaViewControllerEventTracker _invalidateCurrentlyVisibleMedia](self, "_invalidateCurrentlyVisibleMedia");
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PXMediaViewControllerEventTracker;
    -[PXViewControllerEventTracker observable:didChange:context:](&v9, sel_observable_didChange_context_, v8, a4, a5);
  }

}

- (PXMediaViewControllerEventTracker)initWithViewName:(id)a3
{
  id v4;
  PXMediaViewControllerEventTracker *v5;
  uint64_t v6;
  NSString *viewName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXMediaViewControllerEventTracker;
  v5 = -[PXViewControllerEventTracker init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    viewName = v5->_viewName;
    v5->_viewName = (NSString *)v6;

    -[PXMediaViewControllerEventTracker registerChangeObserver:context:](v5, "registerChangeObserver:context:", v5, EventTrackerObservationContext);
  }

  return v5;
}

void __69__PXMediaViewControllerEventTracker__invalidateCurrentlyVisibleMedia__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "updater");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsUpdateOf:", sel__updateCurrentlyVisibleMedia);

}

- (NSString)viewName
{
  return self->_viewName;
}

- (void)logDidStartViewingMedia:(id)a3 mediaKind:(int64_t)a4
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (-[PXMediaViewControllerEventTracker mediaViewedSignpost](self, "mediaViewedSignpost"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMediaViewControllerEventTracker.m"), 125, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.mediaViewedSignpost == CPAnalyticsSignpostIDNull"));

  }
  -[PXMediaViewControllerEventTracker setMediaViewedSignpost:](self, "setMediaViewedSignpost:", objc_msgSend(MEMORY[0x1E0D09910], "startSignpost"));
  if (-[PXMediaViewControllerEventTracker specificMediaViewedSignpost](self, "specificMediaViewedSignpost"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMediaViewControllerEventTracker.m"), 127, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.specificMediaViewedSignpost == CPAnalyticsSignpostIDNull"));

  }
  -[PXMediaViewControllerEventTracker setSpecificMediaViewedSignpost:](self, "setSpecificMediaViewedSignpost:", objc_msgSend(MEMORY[0x1E0D09910], "startSignpost"));
  -[PXMediaViewControllerEventTracker lastVisibleMedia](self, "lastVisibleMedia");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v7);

  if ((v9 & 1) == 0)
    -[PXMediaViewControllerEventTracker setLastVisibleMedia:](self, "setLastVisibleMedia:", v7);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  v11 = v10;
  switch(a4)
  {
    case 2:
      v13 = (_QWORD *)MEMORY[0x1E0D09818];
LABEL_15:
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, *v13);
      break;
    case 1:
      v13 = (_QWORD *)MEMORY[0x1E0D09828];
      goto LABEL_15;
    case 0:
      PXAssertGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v7;
        _os_log_error_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "unsupported media %@", buf, 0xCu);
      }

      break;
  }
  -[PXMediaViewControllerEventTracker viewName](self, "viewName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D09830]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9 ^ 1u);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("isFirstAppearance"));

  objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.mediaAppeared"), v11);
}

- (int64_t)specificMediaViewedSignpost
{
  return self->_specificMediaViewedSignpost;
}

- (void)setSpecificMediaViewedSignpost:(int64_t)a3
{
  self->_specificMediaViewedSignpost = a3;
}

- (void)setMediaViewedSignpost:(int64_t)a3
{
  self->_mediaViewedSignpost = a3;
}

- (void)setLastVisibleMedia:(id)a3
{
  objc_storeStrong(&self->_lastVisibleMedia, a3);
}

- (int64_t)mediaViewedSignpost
{
  return self->_mediaViewedSignpost;
}

- (id)lastVisibleMedia
{
  return self->_lastVisibleMedia;
}

- (void)_updateCurrentlyVisibleMedia
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _PXTrackedMediaRecord *v7;
  _PXTrackedMediaRecord *v8;
  id v9;

  if (!-[PXViewControllerEventTracker isViewVisible](self, "isViewVisible"))
    goto LABEL_8;
  -[PXMediaViewControllerEventTracker displayedAsset](self, "displayedAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PXMediaViewControllerEventTracker displayedAssetCollection](self, "displayedAssetCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_8;
    -[PXMediaViewControllerEventTracker displayedAssetCollection](self, "displayedAssetCollection");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = 2;
    if (!v4)
      goto LABEL_8;
LABEL_7:
    v9 = (id)v4;
    v7 = [_PXTrackedMediaRecord alloc];
    -[PXUserInterfaceElementEventTracker currentTimestamp](self, "currentTimestamp");
    v8 = -[_PXTrackedMediaRecord initWithMedia:mediaKind:timestamp:](v7, "initWithMedia:mediaKind:timestamp:", v9, v5);
    -[PXMediaViewControllerEventTracker setCurrentlyVisibleMediaRecord:](self, "setCurrentlyVisibleMediaRecord:", v8);

    return;
  }
  -[PXMediaViewControllerEventTracker displayedAsset](self, "displayedAsset");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = 1;
  if (v4)
    goto LABEL_7;
LABEL_8:
  -[PXMediaViewControllerEventTracker setCurrentlyVisibleMediaRecord:](self, "setCurrentlyVisibleMediaRecord:", 0);
}

- (PXDisplayAsset)displayedAsset
{
  return self->_displayedAsset;
}

- (void)setCurrentlyVisibleMediaRecord:(id)a3
{
  id v5;
  _PXTrackedMediaRecord **p_currentlyVisibleMediaRecord;
  id v7;
  void *v8;
  char v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "media");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  p_currentlyVisibleMediaRecord = &self->_currentlyVisibleMediaRecord;
  -[_PXTrackedMediaRecord media](self->_currentlyVisibleMediaRecord, "media");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v7)
  {

    goto LABEL_8;
  }
  v8 = v7;
  v9 = objc_msgSend(v5, "isEqual:", v7);

  if ((v9 & 1) == 0)
  {
    if (*p_currentlyVisibleMediaRecord)
    {
      -[_PXTrackedMediaRecord timestamp](*p_currentlyVisibleMediaRecord, "timestamp");
      -[PXUserInterfaceElementEventTracker timeIntervalSinceTimestamp:](self, "timeIntervalSinceTimestamp:");
      v11 = v10;
      -[_PXTrackedMediaRecord media](*p_currentlyVisibleMediaRecord, "media");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXMediaViewControllerEventTracker logDidEndViewingMedia:mediaKind:duration:](self, "logDidEndViewingMedia:mediaKind:duration:", v12, -[_PXTrackedMediaRecord mediaKind](*p_currentlyVisibleMediaRecord, "mediaKind"), v11);

    }
    objc_storeStrong((id *)&self->_currentlyVisibleMediaRecord, a3);
    if (*p_currentlyVisibleMediaRecord)
    {
      objc_msgSend(v13, "media");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[PXMediaViewControllerEventTracker logDidStartViewingMedia:mediaKind:](self, "logDidStartViewingMedia:mediaKind:", v5, objc_msgSend(v13, "mediaKind"));
LABEL_8:

    }
  }

}

- (void)setDisplayedAssetCollection:(id)a3
{
  PXDisplayAssetCollection *v5;
  char v6;
  PXDisplayAssetCollection *v7;

  v7 = (PXDisplayAssetCollection *)a3;
  v5 = self->_displayedAssetCollection;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXDisplayAssetCollection isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_displayedAssetCollection, a3);
      -[PXMediaViewControllerEventTracker _invalidateCurrentlyVisibleMedia](self, "_invalidateCurrentlyVisibleMedia");
    }
  }

}

- (void)setDisplayedAsset:(id)a3
{
  PXDisplayAsset *v5;
  char v6;
  PXDisplayAsset *v7;

  v7 = (PXDisplayAsset *)a3;
  v5 = self->_displayedAsset;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXDisplayAsset isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_displayedAsset, a3);
      -[PXMediaViewControllerEventTracker _invalidateCurrentlyVisibleMedia](self, "_invalidateCurrentlyVisibleMedia");
    }
  }

}

- (void)_invalidateCurrentlyVisibleMedia
{
  void *v3;
  _QWORD v4[5];

  if (!self->_didInvalidateCurrentlyVisibleMediaOnce)
  {
    self->_didInvalidateCurrentlyVisibleMediaOnce = 1;
    -[PXUserInterfaceElementEventTracker updater](self, "updater");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addUpdateSelector:", sel__updateCurrentlyVisibleMedia);

  }
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__PXMediaViewControllerEventTracker__invalidateCurrentlyVisibleMedia__block_invoke;
  v4[3] = &unk_1E51479C8;
  v4[4] = self;
  -[PXMediaViewControllerEventTracker performChanges:](self, "performChanges:", v4);
}

- (PXMediaViewControllerEventTracker)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMediaViewControllerEventTracker.m"), 46, CFSTR("%s is not available as initializer"), "-[PXMediaViewControllerEventTracker init]");

  abort();
}

- (void)logDidEndViewingMedia:(id)a3 mediaKind:(int64_t)a4 duration:(double)a5
{
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id *v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  v9 = v8;
  switch(a4)
  {
    case 2:
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D09818]);
      v12 = (id *)MEMORY[0x1E0D096B8];
LABEL_10:
      v11 = *v12;
      goto LABEL_11;
    case 1:
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D09828]);
      v12 = (id *)MEMORY[0x1E0D096F0];
      goto LABEL_10;
    case 0:
      PXAssertGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v17 = 138412290;
        v18 = v7;
        _os_log_error_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "unsupported media %@", (uint8_t *)&v17, 0xCu);
      }

      break;
  }
  v11 = 0;
LABEL_11:
  -[PXMediaViewControllerEventTracker viewName](self, "viewName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D09830]);

  -[PXUserInterfaceElementEventTracker finalPayloadWithPayload:](self, "finalPayloadWithPayload:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0D09910];
  v16 = -[PXMediaViewControllerEventTracker mediaViewedSignpost](self, "mediaViewedSignpost");
  objc_msgSend(v15, "endSignpost:forEventName:withPayload:", v16, *MEMORY[0x1E0D09710], v14);
  -[PXMediaViewControllerEventTracker setMediaViewedSignpost:](self, "setMediaViewedSignpost:", 0);
  if (v11)
    objc_msgSend(MEMORY[0x1E0D09910], "endSignpost:forEventName:withPayload:", -[PXMediaViewControllerEventTracker specificMediaViewedSignpost](self, "specificMediaViewedSignpost"), v11, v14);
  -[PXMediaViewControllerEventTracker setSpecificMediaViewedSignpost:](self, "setSpecificMediaViewedSignpost:", 0);

}

- (PXDisplayAssetCollection)displayedAssetCollection
{
  return self->_displayedAssetCollection;
}

- (_PXTrackedMediaRecord)currentlyVisibleMediaRecord
{
  return self->_currentlyVisibleMediaRecord;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lastVisibleMedia, 0);
  objc_storeStrong((id *)&self->_currentlyVisibleMediaRecord, 0);
  objc_storeStrong((id *)&self->_displayedAssetCollection, 0);
  objc_storeStrong((id *)&self->_displayedAsset, 0);
  objc_storeStrong((id *)&self->_viewName, 0);
}

@end
