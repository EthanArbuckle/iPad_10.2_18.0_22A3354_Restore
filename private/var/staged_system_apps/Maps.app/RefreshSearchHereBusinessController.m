@implementation RefreshSearchHereBusinessController

- (RefreshSearchHereBusinessController)initWithDelegate:(id)a3
{
  id v4;
  RefreshSearchHereBusinessController *v5;
  RefreshSearchHereBusinessController *v6;
  RedoSearchController *v7;
  RedoSearchController *redoSearchController;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RefreshSearchHereBusinessController;
  v5 = -[RefreshSearchHereBusinessController init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = objc_alloc_init(RedoSearchController);
    redoSearchController = v6->_redoSearchController;
    v6->_redoSearchController = v7;

  }
  return v6;
}

- (void)setSearchSession:(id)a3
{
  objc_storeStrong((id *)&self->_searchSession, a3);
  self->_triggered = 0;
  -[RefreshSearchHereBusinessController updateState](self, "updateState");
}

- (void)resetRedoSearchController
{
  -[RedoSearchController setOriginalState:](self->_redoSearchController, "setOriginalState:", 0);
}

- (void)setContentView:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_storeStrong((id *)&self->_contentView, a3);
  v5 = a3;
  -[LocalSearchView setAccessibilityIdentifier:](self->_contentView, "setAccessibilityIdentifier:", CFSTR("LocalSearchContentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Search Here"), CFSTR("localized string not found"), 0));
  objc_msgSend(v5, "setText:forState:", v7, 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Searching Here"), CFSTR("localized string not found"), 0));
  objc_msgSend(v5, "setText:forState:", v9, 3);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("No results found in this area."), CFSTR("localized string not found"), 0));
  objc_msgSend(v5, "setText:forState:", v11, 4);

  -[RefreshSearchHereBusinessController updateState](self, "updateState");
}

- (void)didStartRespondingToGesture:(id)a3
{
  id v4;
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
  double v15;
  double v16;
  void *v20;
  double v21;
  double v22;
  void *v23;
  RedoSearchMapState *v24;
  RedoSearchMapState *v25;
  id v26;
  NSObject *v27;
  uint8_t v28[16];

  v4 = a3;
  objc_msgSend(v4, "visibleMapRect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[RefreshSearchHereBusinessController visibleMapRect](self, "visibleMapRect");
  if (v6 == v16 && v8 == v13 && v10 == v14 && v12 == v15)
  {
    v26 = sub_100432AEC();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "Requested region is equal to existing region, ignoring.", v28, 2u);
    }

  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapRegion"));
    objc_msgSend(v4, "_zoomLevel");
    v22 = v21;
    objc_msgSend(v4, "visibleMapRect");
    -[RefreshSearchHereBusinessController setVisibleMapRect:](self, "setVisibleMapRect:");
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[RedoSearchController originalState](self->_redoSearchController, "originalState"));

    if (!v23)
    {
      v24 = -[RedoSearchMapState initWithMapRegion:zoomLevel:]([RedoSearchMapState alloc], "initWithMapRegion:zoomLevel:", v20, v22);
      -[RedoSearchController setOriginalState:](self->_redoSearchController, "setOriginalState:", v24);

    }
    -[RefreshSearchHereBusinessController updateState](self, "updateState");
    if (self->_triggered)
    {
      v25 = -[RedoSearchMapState initWithMapRegion:zoomLevel:]([RedoSearchMapState alloc], "initWithMapRegion:zoomLevel:", v20, v22);
      -[RedoSearchController setOriginalState:](self->_redoSearchController, "setOriginalState:", v25);

    }
  }

}

- (BOOL)didStopRespondingToGesture:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  RedoSearchMapState *v16;
  RedoSearchMapState *v17;
  BOOL triggered;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapRegion"));
  objc_msgSend(v4, "_zoomLevel");
  v7 = v6;
  objc_msgSend(v4, "visibleMapRect");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[RefreshSearchHereBusinessController setVisibleMapRect:](self, "setVisibleMapRect:", v9, v11, v13, v15);
  v16 = -[RedoSearchMapState initWithMapRegion:zoomLevel:]([RedoSearchMapState alloc], "initWithMapRegion:zoomLevel:", v5, v7);
  -[RedoSearchController setCurrentState:](self->_redoSearchController, "setCurrentState:", v16);

  -[RefreshSearchHereBusinessController updateState](self, "updateState");
  -[RefreshSearchHereBusinessController updateTrigger](self, "updateTrigger");
  if (self->_triggered)
  {
    v17 = -[RedoSearchMapState initWithMapRegion:zoomLevel:]([RedoSearchMapState alloc], "initWithMapRegion:zoomLevel:", v5, v7);
    -[RedoSearchController setOriginalState:](self->_redoSearchController, "setOriginalState:", v17);

    triggered = self->_triggered;
  }
  else
  {
    triggered = 0;
  }

  return triggered;
}

- (BOOL)shouldShowManualRedoButton
{
  unsigned __int8 v2;
  void *v4;
  void *v5;
  RedoSearchController *redoSearchController;
  void *v7;
  void *v8;

  if (self->_triggered)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession searchInfo](self->_searchSession, "searchInfo"));
  v5 = v4;
  if (v4 && objc_msgSend(v4, "shouldAllowManualRedoButton"))
  {
    redoSearchController = self->_redoSearchController;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchRedoButtonThreshold"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "results"));
    v2 = -[RedoSearchController shouldShowManualRedoSearchButton:searchResults:](redoSearchController, "shouldShowManualRedoSearchButton:searchResults:", v7, v8);

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)updateState
{
  unint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = -[RefreshSearchHereBusinessController state](self, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RefreshSearchHereBusinessController contentView](self, "contentView"));
  v5 = objc_msgSend(v4, "state");

  if ((id)v3 != v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RefreshSearchHereBusinessController delegate](self, "delegate"));
    v7 = v6;
    if (v5 && v3)
      objc_msgSend(v6, "businessControllerContentSizeDidChange:", self);
    else
      objc_msgSend(v6, "businessControllerVisibilityDidChange:", self);

    v8 = (id)objc_claimAutoreleasedReturnValue(-[RefreshSearchHereBusinessController contentView](self, "contentView"));
    objc_msgSend(v8, "setState:", v3);

  }
}

- (void)updateTrigger
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  RedoSearchController *redoSearchController;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RefreshSearchHereBusinessController delegate](self, "delegate"));
  v4 = objc_msgSend(v3, "isEnabled");

  if (v4)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(-[SearchSession searchInfo](self->_searchSession, "searchInfo"));
    if (objc_msgSend(v11, "canRedoSearch"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession searchInfo](self->_searchSession, "searchInfo"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchAutoRedoThreshold"));

      if (!v6)
        return;
      redoSearchController = self->_redoSearchController;
      v11 = (id)objc_claimAutoreleasedReturnValue(-[SearchSession searchInfo](self->_searchSession, "searchInfo"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "searchAutoRedoThreshold"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession searchInfo](self->_searchSession, "searchInfo"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "results"));
      self->_triggered = -[RedoSearchController shouldTriggerAutoRedoWithThreshold:searchResults:](redoSearchController, "shouldTriggerAutoRedoWithThreshold:searchResults:", v8, v10);

    }
  }
}

- (unint64_t)state
{
  void *v4;
  _BOOL4 v5;

  if (-[SearchSession isRedoOrAutoRedoSearchType](self->_searchSession, "isRedoOrAutoRedoSearchType")
    && -[SearchSession isLoading](self->_searchSession, "isLoading"))
  {
    return 3;
  }
  if (self->_triggered)
    return 2;
  if (!-[SearchSession isRedoOrAutoRedoSearchType](self->_searchSession, "isRedoOrAutoRedoSearchType"))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession lastError](self->_searchSession, "lastError"));
  v5 = v4 != 0;

  return 4 * v5;
}

- (BOOL)isCatalyst
{
  return 0;
}

- (BOOL)shouldBeVisible
{
  return 0;
}

- (BOOL)showInCardFooterWhenCardHasExpandedLayout
{
  return 1;
}

- (void)sendAnalyticsOnBecomeVisibleWithTarget:(int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", 2016, v3, 0);

}

- (LocalSearchView)contentView
{
  return self->_contentView;
}

- (SearchSession)searchSession
{
  return self->_searchSession;
}

- (LocalSearchBusinessControllerDelegate)delegate
{
  return (LocalSearchBusinessControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (RedoSearchController)redoSearchController
{
  return self->_redoSearchController;
}

- (void)setRedoSearchController:(id)a3
{
  objc_storeStrong((id *)&self->_redoSearchController, a3);
}

- ($C79183323B9A0D5602617FF3BE5395AC)visibleMapRect
{
  double x;
  double y;
  double width;
  double height;
  $C79183323B9A0D5602617FF3BE5395AC result;

  x = self->_visibleMapRect.origin.x;
  y = self->_visibleMapRect.origin.y;
  width = self->_visibleMapRect.size.width;
  height = self->_visibleMapRect.size.height;
  result.var1.var1 = height;
  result.var1.var0 = width;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

- (void)setVisibleMapRect:(id)a3
{
  self->_visibleMapRect = ($99E9129AA7BA404914A9E870D54E0AD8)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redoSearchController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_searchSession, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
