@implementation _PXPhotosDetailsAssetsWidgetEventTracker

- (_PXPhotosDetailsAssetsWidgetEventTracker)init
{
  _PXPhotosDetailsAssetsWidgetEventTracker *v2;
  _PXPhotosDetailsAssetsWidgetEventTracker *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_PXPhotosDetailsAssetsWidgetEventTracker;
  v2 = -[PXUserInterfaceElementEventTracker init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_PXPhotosDetailsAssetsWidgetEventTracker registerChangeObserver:context:](v2, "registerChangeObserver:context:", v2, EventTrackerObservationContext_205810);
    -[PXUserInterfaceElementEventTracker updater](v3, "updater");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addUpdateSelector:", sel__updateVisibleState);

  }
  return v3;
}

- (void)setIsDisplayingCuratedContent:(BOOL)a3
{
  if (self->_isDisplayingCuratedContent != a3)
  {
    self->_isDisplayingCuratedContent = a3;
    -[_PXPhotosDetailsAssetsWidgetEventTracker _invalidateVisibleState](self, "_invalidateVisibleState");
  }
}

- (void)_invalidateVisibleState
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __67___PXPhotosDetailsAssetsWidgetEventTracker__invalidateVisibleState__block_invoke;
  v2[3] = &unk_1E51479C8;
  v2[4] = self;
  -[_PXPhotosDetailsAssetsWidgetEventTracker performChanges:](self, "performChanges:", v2);
}

- (void)_updateVisibleState
{
  _BOOL4 v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;

  if (-[PXUserInterfaceElementEventTracker isVisible](self, "isVisible"))
  {
    v3 = -[_PXPhotosDetailsAssetsWidgetEventTracker isDisplayingCuratedContent](self, "isDisplayingCuratedContent");
    v4 = CFSTR("com.apple.photos.CPAnalytics.photosDetailsAssetsAllDisplayed");
    if (v3)
      v4 = CFSTR("com.apple.photos.CPAnalytics.photosDetailsAssetsSummaryDisplayed");
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;
  -[_PXPhotosDetailsAssetsWidgetEventTracker setVisibleState:](self, "setVisibleState:", v5);

}

- (void)setVisibleState:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *visibleState;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_visibleState;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      if (self->_visibleState)
        -[_PXPhotosDetailsAssetsWidgetEventTracker _logDidEndViewingState:](self, "_logDidEndViewingState:");
      v6 = (NSString *)-[NSString copy](v8, "copy");
      visibleState = self->_visibleState;
      self->_visibleState = v6;

      if (self->_visibleState)
        -[_PXPhotosDetailsAssetsWidgetEventTracker _logDidStartViewingState:](self, "_logDidStartViewingState:");
    }
  }

}

- (void)_logDidStartViewingState:(id)a3
{
  void *v5;

  if (-[_PXPhotosDetailsAssetsWidgetEventTracker visibleStateSignpost](self, "visibleStateSignpost", a3))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDetailsAssetsWidgetEventTracker.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.visibleStateSignpost == CPAnalyticsSignpostIDNull"));

  }
  -[_PXPhotosDetailsAssetsWidgetEventTracker setVisibleStateSignpost:](self, "setVisibleStateSignpost:", objc_msgSend(MEMORY[0x1E0D09910], "startSignpost"));
}

- (void)_logDidEndViewingState:(id)a3
{
  void *v4;
  id v5;
  int64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D09910];
  v5 = a3;
  v6 = -[_PXPhotosDetailsAssetsWidgetEventTracker visibleStateSignpost](self, "visibleStateSignpost");
  v7 = *MEMORY[0x1E0D09708];
  v9 = *MEMORY[0x1E0D09850];
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endSignpost:forEventName:withPayload:", v6, v7, v8);

  -[_PXPhotosDetailsAssetsWidgetEventTracker setVisibleStateSignpost:](self, "setVisibleStateSignpost:", 0);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)EventTrackerObservationContext_205810 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDetailsAssetsWidgetEventTracker.m"), 104, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 1) != 0)
  {
    v11 = v9;
    -[_PXPhotosDetailsAssetsWidgetEventTracker _invalidateVisibleState](self, "_invalidateVisibleState");
    v9 = v11;
  }

}

- (BOOL)isDisplayingCuratedContent
{
  return self->_isDisplayingCuratedContent;
}

- (NSString)visibleState
{
  return self->_visibleState;
}

- (int64_t)visibleStateSignpost
{
  return self->_visibleStateSignpost;
}

- (void)setVisibleStateSignpost:(int64_t)a3
{
  self->_visibleStateSignpost = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleState, 0);
}

@end
