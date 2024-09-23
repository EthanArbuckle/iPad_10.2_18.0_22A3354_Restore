@implementation BKContentViewController

- (BKContentViewController)init
{
  BKContentViewController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKContentViewController;
  result = -[BKContentViewController init](&v3, "init");
  if (result)
  {
    result->_totalPages = -1;
    result->_ordinal = -1;
    result->_pageOffset = -1;
    result->_selectionHighlightType = 0;
  }
  return result;
}

- (void)dealloc
{
  ContentStyle *style;
  IMBaseRenderingCache *contentViewImageCache;
  objc_super v5;

  -[BKContentViewController releaseViews](self, "releaseViews");
  -[BKContentViewController setBook:](self, "setBook:", 0);
  -[BKContentViewController setDocument:](self, "setDocument:", 0);
  style = self->_style;
  self->_style = 0;

  -[BKContentViewController setSearchLocation:](self, "setSearchLocation:", 0);
  -[IMBaseRenderingCache cancelRenderingCacheOperationsForTarget:](self->_contentViewImageCache, "cancelRenderingCacheOperationsForTarget:", self);
  contentViewImageCache = self->_contentViewImageCache;
  self->_contentViewImageCache = 0;

  v5.receiver = self;
  v5.super_class = (Class)BKContentViewController;
  -[BKViewController dealloc](&v5, "dealloc");
}

- (void)releaseViews
{
  NSMutableArray *highlightViews;
  BKContentReloadView *reloadView;
  BKContentLoadingView *loadingView;
  objc_super v6;

  highlightViews = self->_highlightViews;
  self->_highlightViews = 0;

  -[BKContentReloadView removeFromSuperview](self->_reloadView, "removeFromSuperview");
  reloadView = self->_reloadView;
  self->_reloadView = 0;

  -[BKContentLoadingView removeFromSuperview](self->_loadingView, "removeFromSuperview");
  loadingView = self->_loadingView;
  self->_loadingView = 0;

  v6.receiver = self;
  v6.super_class = (Class)BKContentViewController;
  -[BKViewController releaseViews](&v6, "releaseViews");
}

- (void)didReceiveMemoryWarning
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKContentViewController;
  -[BKContentViewController didReceiveMemoryWarning](&v6, "didReceiveMemoryWarning");
  if (-[BKContentViewController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController view](self, "view"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
    if (v4)
    {

    }
    else
    {
      v5 = -[BKContentViewController isContentLoaded](self, "isContentLoaded");

      if ((v5 & 1) == 0)
        -[BKContentViewController contentLoadFailed](self, "contentLoadFailed");
    }
  }
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKContentViewController;
  -[BKContentViewController viewDidLoad](&v3, "viewDidLoad");
  -[BKContentViewController applyPageColor](self, "applyPageColor");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKContentViewController;
  -[BKContentViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  if (-[BKContentViewController showsLoadingIndicator](self, "showsLoadingIndicator"))
  {
    if (!-[BKContentViewController isContentLoaded](self, "isContentLoaded"))
      -[BKContentViewController showLoadingViewAnimated:](self, "showLoadingViewAnimated:", 1);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKContentViewController;
  -[BKContentViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[BKContentViewController clearSelection](self, "clearSelection");
  -[IMBaseRenderingCache cancelRenderingCacheOperationsForTarget:](self->_contentViewImageCache, "cancelRenderingCacheOperationsForTarget:", self);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKContentViewController;
  -[BKContentViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[BKContentViewController clearHighlightsForSearchResults](self, "clearHighlightsForSearchResults");
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    if (v6)
    {
      v7 = v6;
      v8 = -[BKContentViewController isContentLoaded](self, "isContentLoaded");

      if ((v8 & 1) == 0)
        -[BKContentViewController contentLoadFailed](self, "contentLoadFailed");
    }
    objc_storeWeak((id *)&self->_delegate, obj);
    v5 = obj;
  }

}

- (BOOL)isReusable
{
  return 1;
}

- (void)prepareForReuse
{
  -[BKContentViewController setSearchLocation:](self, "setSearchLocation:", 0);
  -[BKContentViewController setPageOffset:](self, "setPageOffset:", -1);
  self->_contentLoaded = 0;
  self->_contentLoadPending = 0;
  -[BKContentViewController setDocument:](self, "setDocument:", 0);
}

- (BOOL)isLocationOnCurrentPage:(id)a3
{
  return 0;
}

- (void)isLocationVisible:(id)a3 annotation:(id)a4 completion:(id)a5
{
  id v5;
  id v6;

  v5 = objc_retainBlock(a5);
  if (v5)
  {
    v6 = v5;
    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
    v5 = v6;
  }

}

- (BOOL)isAnnotationVisible:(id)a3
{
  return 0;
}

- (CGRect)cachedRectForAnnotation:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[BKContentViewController cachedRectForAnnotation:]"));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v4, 0));

  objc_exception_throw(v5);
}

- (CGRect)cachedVisibleRectForAnnotation:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[BKContentViewController cachedVisibleRectForAnnotation:]"));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v4, 0));

  objc_exception_throw(v5);
}

- (BOOL)isLocationFromThisDocument:(id)a3
{
  return 0;
}

- (unint64_t)pageOffsetForLocation:(id)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)pageOffsetRangeForLocation:(id)a3 completion:(id)a4
{
  id v4;
  id v5;

  v4 = objc_retainBlock(a4);
  if (v4)
  {
    v5 = v4;
    (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 0x7FFFFFFFFFFFFFFFLL, 0);
    v4 = v5;
  }

}

- (id)pageTitlesForPageOffset:(int64_t)a3
{
  return 0;
}

- (void)ensureLocationVisible:(id)a3 completion:(id)a4
{
  void (**v4)(void);
  void (**v5)(void);

  v4 = (void (**)(void))objc_retainBlock(a4);
  if (v4)
  {
    v5 = v4;
    v4[2]();
    v4 = v5;
  }

}

- (void)ensureLocationVisible:(id)a3 adjustForSearchResultRevealMode:(BOOL)a4 completion:(id)a5
{
  void (**v5)(void);
  void (**v6)(void);

  v5 = (void (**)(void))objc_retainBlock(a5);
  if (v5)
  {
    v6 = v5;
    v5[2]();
    v5 = v6;
  }

}

- (int64_t)visiblePageCount
{
  return 1;
}

- (void)load
{
  -[BKContentViewController setContentLoadPending:](self, "setContentLoadPending:", 1);
  if ((-[BKContentViewController isViewLoaded](self, "isViewLoaded") & 1) == 0)

}

- (BOOL)isLoading
{
  return 0;
}

- (void)setContentLoaded:(BOOL)a3
{
  if (self->_contentLoaded != a3)
  {
    self->_contentLoaded = a3;
    if (a3)
    {
      if (self->_loadingView)
        -[BKContentViewController hideLoadingViewAnimated:](self, "hideLoadingViewAnimated:", 1);
    }
    else if (-[BKContentViewController showsLoadingIndicator](self, "showsLoadingIndicator")
           && -[BKContentViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[BKContentViewController showLoadingViewAnimated:](self, "showLoadingViewAnimated:", 0);
    }
  }
}

- (void)contentReady
{
  void *v3;
  id WeakRetained;

  -[BKContentViewController hideLoadingViewAnimated:](self, "hideLoadingViewAnimated:", 1);
  if (!-[BKContentViewController isContentLoaded](self, "isContentLoaded"))
  {
    -[BKContentViewController setContentLoaded:](self, "setContentLoaded:", 1);
    -[BKContentViewController setContentLoadPending:](self, "setContentLoadPending:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "postNotificationName:object:", BKContentReadyNotification, self);

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "contentViewReady:", self);

  }
}

- (void)contentLoadFailed
{
  id v3;

  -[BKContentViewController setContentLoadPending:](self, "setContentLoadPending:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "postNotificationName:object:", BKContentFAILNotification, self);

}

- (BOOL)shouldApplyPageColor
{
  return 0;
}

- (void)applyPageColor
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  if (-[BKContentViewController isViewLoaded](self, "isViewLoaded"))
  {
    if (-[BKContentViewController shouldApplyPageColor](self, "shouldApplyPageColor"))
    {
      v14 = (id)objc_claimAutoreleasedReturnValue(-[BKContentViewController themePage](self, "themePage"));
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "backgroundColorForTraitEnvironment:", self));
      v4 = objc_alloc((Class)CAFilter);
      v5 = objc_msgSend(v4, "initWithType:", kCAFilterMultiplyColor);
      v6 = objc_retainAutorelease(v3);
      objc_msgSend(v5, "setValue:forKeyPath:", objc_msgSend(v6, "CGColor"), CFSTR("inputColor"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v5));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController view](self, "view"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layer"));
      objc_msgSend(v9, "setFilters:", v7);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController view](self, "view"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layer"));
      objc_msgSend(v11, "setCreatesCompositingGroup:", 1);

    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController view](self, "view"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layer"));
      objc_msgSend(v13, "setFilters:", 0);

      v14 = (id)objc_claimAutoreleasedReturnValue(-[BKContentViewController view](self, "view"));
      v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "layer"));
      objc_msgSend(v6, "setCreatesCompositingGroup:", 0);
    }

  }
}

- (void)setTheme:(id)a3
{
  -[BKContentViewController setTheme:force:](self, "setTheme:force:", a3, 0);
}

- (void)setTheme:(id)a3 force:(BOOL)a4
{
  -[BKContentViewController _setThemeIfNeeded:](self, "_setThemeIfNeeded:", a3, a4);
}

- (void)_setThemeIfNeeded:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController theme](self, "theme"));
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)BKContentViewController;
    -[BKContentViewController setTheme:](&v8, "setTheme:", v4);
    -[BKContentViewController applyPageColor](self, "applyPageColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController themePage](self, "themePage"));
    -[BKContentLoadingView setTheme:](self->_loadingView, "setTheme:", v7);
    -[BKContentReloadView setTheme:](self->_reloadView, "setTheme:", v7);

  }
}

- (id)snapshot
{
  void *v3;
  void *v4;

  if (-[BKContentViewController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController view](self, "view"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "im_snapshotInContext"));

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)contentNeedsFilter
{
  return 0;
}

- (id)currentLocation
{
  return 0;
}

- (BOOL)isTOCContent
{
  return 0;
}

- (BOOL)isUpsellContent
{
  return 0;
}

- (BKPageLocation)assignedPageLocation
{
  unint64_t v3;
  BKPageLocation *v4;

  v3 = -[BKContentViewController pageOffset](self, "pageOffset");
  if (v3 <= 0x7FFFFFFFFFFFFFFELL)
    v4 = -[BKPageLocation initWithOrdinal:andOffset:]([BKPageLocation alloc], "initWithOrdinal:andOffset:", -[BKContentViewController ordinal](self, "ordinal"), v3);
  else
    v4 = 0;
  return v4;
}

- (int)pageProgressionDirection
{
  void *v2;
  int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController book](self, "book"));
  v3 = objc_msgSend(v2, "bkPageProgressionDirection");

  return v3;
}

- (BOOL)locationIsVertical:(id)a3
{
  return 0;
}

- (void)selectLocation:(id)a3 completion:(id)a4
{
  id v4;
  id v5;

  v4 = objc_retainBlock(a4);
  if (v4)
  {
    v5 = v4;
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
    v4 = v5;
  }

}

- (CGRect)rectForLocation:(id)a3
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)rectForLocation:(id)a3 completion:(id)a4
{
  void (**v4)(double, double, double, double);
  void (**v5)(double, double, double, double);

  v4 = (void (**)(double, double, double, double))objc_retainBlock(a4);
  if (v4)
  {
    v5 = v4;
    v4[2](CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v4 = v5;
  }

}

- (CGRect)visibleRectForLocation:(id)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect result;
  CGRect v21;

  -[BKContentViewController rectForLocation:](self, "rectForLocation:", a3);
  x = v17.origin.x;
  y = v17.origin.y;
  width = v17.size.width;
  height = v17.size.height;
  if (!CGRectIsNull(v17))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController view](self, "view"));
    objc_msgSend(v8, "bounds");
    v21.origin.x = v9;
    v21.origin.y = v10;
    v21.size.width = v11;
    v21.size.height = v12;
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    v19 = CGRectIntersection(v18, v21);
    x = v19.origin.x;
    y = v19.origin.y;
    width = v19.size.width;
    height = v19.size.height;

  }
  v13 = x;
  v14 = y;
  v15 = width;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)visibleRectForLocation:(id)a3 completion:(id)a4
{
  id v5;
  _QWORD v6[4];
  BKContentViewController *v7;
  id v8;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_5F1B8;
  v6[3] = &unk_1BF070;
  v7 = self;
  v8 = a4;
  v5 = v8;
  -[BKContentViewController rectForLocation:completion:](v7, "rectForLocation:completion:", a3, v6);

}

- (CGRect)rectForAnnotation:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[BKContentViewController rectForAnnotation:visible:](self, "rectForAnnotation:visible:", a3, 1);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)rectForAnnotation:(id)a3 withCompletion:(id)a4
{
  id v6;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_5F330;
  v7[3] = &unk_1C0030;
  v8 = a4;
  v6 = v8;
  -[BKContentViewController rectForAnnotation:visible:withCompletion:](self, "rectForAnnotation:visible:withCompletion:", a3, 1, v7);

}

- (void)rectForAnnotation:(id)a3 visible:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  id *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v5 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "location"));
  if (v5)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_5F488;
    v15[3] = &unk_1C0030;
    v10 = &v16;
    v16 = v8;
    v11 = v8;
    -[BKContentViewController visibleRectForLocation:completion:](self, "visibleRectForLocation:completion:", v9, v15);
  }
  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_5F4EC;
    v13[3] = &unk_1C0030;
    v10 = &v14;
    v14 = v8;
    v12 = v8;
    -[BKContentViewController rectForLocation:completion:](self, "rectForLocation:completion:", v9, v13);
  }

}

- (CGRect)rectForAnnotation:(id)a3 visible:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
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
  double v17;
  double v18;
  CGRect result;

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "location"));
  if (v4)
    -[BKContentViewController visibleRectForLocation:](self, "visibleRectForLocation:", v6);
  else
    -[BKContentViewController rectForLocation:](self, "rectForLocation:", v6);
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;

  v15 = v11;
  v16 = v12;
  v17 = v13;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)highlightSearchLocation:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  v4 = -[BKContentViewController ordinal](self, "ordinal");
  if (v4 == objc_msgSend(v5, "ordinal"))
    -[BKContentViewController setSearchLocation:](self, "setSearchLocation:", v5);

}

- (id)annotations
{
  return 0;
}

- (id)highlightViews
{
  return self->_highlightViews;
}

- (void)setHighlightViews:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *highlightViews;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];

  v4 = (NSMutableArray *)a3;
  if ((-[NSMutableArray isEqualToArray:](self->_highlightViews, "isEqualToArray:", v4) & 1) == 0)
  {
    highlightViews = self->_highlightViews;
    if (highlightViews != v4
      && (-[NSMutableArray count](highlightViews, "count") || -[NSMutableArray count](v4, "count")))
    {
      if (-[NSMutableArray count](self->_highlightViews, "count"))
      {
        v6 = -[NSMutableArray copy](self->_highlightViews, "copy");
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v7 = v6;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v25;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v25 != v10)
                objc_enumerationMutation(v7);
              -[BKContentViewController removeHighlightView:](self, "removeHighlightView:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v11));
              v11 = (char *)v11 + 1;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
          }
          while (v9);
        }

      }
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v12 = v4;
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v21;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v21 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v16);
            objc_opt_class(BKTextHighlightView);
            if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
            {
              v19 = objc_msgSend(v17, "copy", (_QWORD)v20);
              -[BKContentViewController addHighlightView:forWK2:](self, "addHighlightView:forWK2:", v19, 1);

            }
            v16 = (char *)v16 + 1;
          }
          while (v14 != v16);
          v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        }
        while (v14);
      }

    }
  }

}

- (BOOL)currentlyHighlighting
{
  return 0;
}

- (void)addHighlightView:(id)a3 forWK2:(BOOL)a4
{
  id v6;
  NSMutableArray *v7;
  NSMutableArray *highlightViews;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  if (v6)
  {
    v13 = v6;
    if (!self->_highlightViews)
    {
      v7 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 30);
      highlightViews = self->_highlightViews;
      self->_highlightViews = v7;

    }
    if (a4)
      v9 = objc_claimAutoreleasedReturnValue(-[BKContentViewController highlightViewContainerWK2](self, "highlightViewContainerWK2"));
    else
      v9 = objc_claimAutoreleasedReturnValue(-[BKContentViewController highlightViewContainer](self, "highlightViewContainer"));
    v10 = (void *)v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController view](self, "view"));

    if (v11 != v10)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController view](self, "view"));
      objc_msgSend(v13, "frame");
      objc_msgSend(v12, "convertRect:toView:", v10);
      objc_msgSend(v13, "setFrame:");

    }
    objc_msgSend(v10, "addSubview:", v13);
    -[NSMutableArray addObject:](self->_highlightViews, "addObject:", v13);

    v6 = v13;
  }

}

- (void)removeHighlightView:(id)a3
{
  NSMutableArray *highlightViews;
  id v4;

  if (a3)
  {
    highlightViews = self->_highlightViews;
    v4 = a3;
    -[NSMutableArray removeObject:](highlightViews, "removeObject:", v4);
    objc_msgSend(v4, "removeFromSuperview");

  }
}

- (void)updateSelectionHighlights
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController highlightViews](self, "highlightViews", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "updateHighlightImage");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)setSelectionHighlightsVisible:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  _BOOL8 v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController highlightViews](self, "highlightViews", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    v8 = !v3;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "setHidden:", v8);
        v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)clearSearchLocation
{
  -[BKContentViewController setSearchLocation:](self, "setSearchLocation:", 0);
}

- (BOOL)hasTextSelected
{
  return 0;
}

- (BOOL)hasHighlightedText
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController highlightViews](self, "highlightViews", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_opt_class(BKTextHighlightView);
        if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (BOOL)isPlayingMedia
{
  return 0;
}

- (void)showLoadingViewAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController loadingView](self, "loadingView"));
  v6 = 0.0;
  objc_msgSend(v5, "setAlpha:", 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));

  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController view](self, "view"));
    objc_msgSend(v8, "addSubview:", v5);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController view](self, "view"));
  objc_msgSend(v9, "bounds");
  objc_msgSend(v5, "setFrame:");

  if (v3)
    v6 = 0.2;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_5FDF8;
  v11[3] = &unk_1BEA38;
  v12 = v5;
  v10 = v5;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v11, v6);

}

- (void)hideLoadingViewAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  double v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController loadingView](self, "loadingView"));
  if (v3)
    v5 = 0.2;
  else
    v5 = 0.0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_5FED8;
  v9[3] = &unk_1BEA38;
  v10 = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_5FEE4;
  v7[3] = &unk_1BEA88;
  v8 = v10;
  v6 = v10;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v9, v7, v5);

}

- (BKContentLoadingView)loadingView
{
  BKContentLoadingView *loadingView;
  BKContentLoadingView *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  BKContentLoadingView *v15;
  BKContentLoadingView *v16;

  loadingView = self->_loadingView;
  if (!loadingView)
  {
    v4 = [BKContentLoadingView alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController view](self, "view"));
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController themePage](self, "themePage"));
    v15 = -[BKContentLoadingView initWithFrame:theme:](v4, "initWithFrame:theme:", v14, v7, v9, v11, v13);
    v16 = self->_loadingView;
    self->_loadingView = v15;

    -[BKContentLoadingView setAutoresizingMask:](self->_loadingView, "setAutoresizingMask:", 18);
    loadingView = self->_loadingView;
  }
  return loadingView;
}

- (void)showLoadFailureUI
{
  -[BKContentViewController showReloadUIAnimated:](self, "showReloadUIAnimated:", 1);
}

- (void)showReloadUIAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController reloadView](self, "reloadView"));
  v6 = 0.0;
  objc_msgSend(v5, "setAlpha:", 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));

  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController view](self, "view"));
    objc_msgSend(v8, "addSubview:", v5);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController view](self, "view"));
  objc_msgSend(v9, "bounds");
  objc_msgSend(v5, "setFrame:");

  if (v3)
    v6 = 0.2;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_600D4;
  v11[3] = &unk_1BEA38;
  v12 = v5;
  v10 = v5;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v11, v6);

}

- (void)hideReloadUIAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  double v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController reloadView](self, "reloadView"));
  if (v3)
    v5 = 0.2;
  else
    v5 = 0.0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_601B4;
  v9[3] = &unk_1BEA38;
  v10 = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_601C0;
  v7[3] = &unk_1BEA88;
  v8 = v10;
  v6 = v10;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v9, v7, v5);

}

- (BKContentReloadView)reloadView
{
  BKContentReloadView *reloadView;
  BKContentReloadView *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  BKContentReloadView *v15;
  BKContentReloadView *v16;

  reloadView = self->_reloadView;
  if (!reloadView)
  {
    v4 = [BKContentReloadView alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController view](self, "view"));
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKContentViewController themePage](self, "themePage"));
    v15 = -[BKContentReloadView initWithFrame:theme:delegate:](v4, "initWithFrame:theme:delegate:", v14, self, v7, v9, v11, v13);
    v16 = self->_reloadView;
    self->_reloadView = v15;

    -[BKContentReloadView setAutoresizingMask:](self->_reloadView, "setAutoresizingMask:", 18);
    reloadView = self->_reloadView;
  }
  return reloadView;
}

- (void)reloadViewDidBeginReloading:(id)a3
{
  -[BKContentViewController hideReloadUIAnimated:](self, "hideReloadUIAnimated:", 1);
  -[BKContentViewController reload](self, "reload");
  -[BKContentViewController showLoadingViewAnimated:](self, "showLoadingViewAnimated:", 1);
}

- (id)pathForSoundtrack
{
  return 0;
}

- (int64_t)ordinal
{
  return self->_ordinal;
}

- (void)setOrdinal:(int64_t)a3
{
  self->_ordinal = a3;
}

- (int64_t)totalPages
{
  return self->_totalPages;
}

- (void)setTotalPages:(int64_t)a3
{
  self->_totalPages = a3;
}

- (int64_t)pageOffset
{
  return self->_pageOffset;
}

- (void)setPageOffset:(int64_t)a3
{
  self->_pageOffset = a3;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (AEBookInfo)book
{
  return self->_book;
}

- (void)setBook:(id)a3
{
  objc_storeStrong((id *)&self->_book, a3);
}

- (BKDocument)document
{
  return self->_document;
}

- (void)setDocument:(id)a3
{
  objc_storeStrong((id *)&self->_document, a3);
}

- (IMBaseRenderingCache)contentViewImageCache
{
  return self->_contentViewImageCache;
}

- (void)setContentViewImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewImageCache, a3);
}

- (BKFlowingBookLayoutConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (BOOL)isContentLoaded
{
  return self->_contentLoaded;
}

- (BOOL)showsLoadingIndicator
{
  return self->_showsLoadingIndicator;
}

- (void)setShowsLoadingIndicator:(BOOL)a3
{
  self->_showsLoadingIndicator = a3;
}

- (BKContentViewControllerDelegate)delegate
{
  return (BKContentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (int)selectionHighlightType
{
  return self->_selectionHighlightType;
}

- (void)setSelectionHighlightType:(int)a3
{
  self->_selectionHighlightType = a3;
}

- (BKLocation)searchLocation
{
  return self->_searchLocation;
}

- (void)setSearchLocation:(id)a3
{
  objc_storeStrong((id *)&self->_searchLocation, a3);
}

- (BKContentViewControllerLayoutDelegate)layoutDelegate
{
  return (BKContentViewControllerLayoutDelegate *)objc_loadWeakRetained((id *)&self->_layoutDelegate);
}

- (void)setLayoutDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_layoutDelegate, a3);
}

- (UIEdgeInsets)separatorInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_separatorInsets.top;
  left = self->_separatorInsets.left;
  bottom = self->_separatorInsets.bottom;
  right = self->_separatorInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setSeparatorInsets:(UIEdgeInsets)a3
{
  self->_separatorInsets = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (BOOL)prefersSinglePagePresentation
{
  return self->_prefersSinglePagePresentation;
}

- (void)setPrefersSinglePagePresentation:(BOOL)a3
{
  self->_prefersSinglePagePresentation = a3;
}

- (CGSize)estimatedContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_estimatedContentSize.width;
  height = self->_estimatedContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setEstimatedContentSize:(CGSize)a3
{
  self->_estimatedContentSize = a3;
}

- (BOOL)isContentLoadPending
{
  return self->_contentLoadPending;
}

- (void)setContentLoadPending:(BOOL)a3
{
  self->_contentLoadPending = a3;
}

- (void)setLoadingView:(id)a3
{
  objc_storeStrong((id *)&self->_loadingView, a3);
}

- (void)setReloadView:(id)a3
{
  objc_storeStrong((id *)&self->_reloadView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reloadView, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_layoutDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_searchLocation, 0);
  objc_storeStrong((id *)&self->_contentViewImageCache, 0);
  objc_storeStrong((id *)&self->_highlightViews, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_document, 0);
  objc_storeStrong((id *)&self->_book, 0);
}

@end
