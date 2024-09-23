@implementation SearchPinsManagerShowSearchResultsAnimation

- (SearchPinsManagerShowSearchResultsAnimation)initWithSearchResults:(id)a3 selectedSearchResult:(id)a4 historyItem:(id)a5 suggestedMapRegion:(id)a6 mapCameraController:(id)a7 minZoom:(id)a8 maxZoom:(id)a9 disableAdditionalViewportPadding:(BOOL)a10 completion:(id)a11
{
  id v18;
  id v19;
  SearchPinsManagerShowSearchResultsAnimation *v20;
  SearchPinsManagerShowSearchResultsAnimation *v21;
  id v22;
  id completion;
  id v24;
  NSObject *v25;
  SearchPinsManagerShowSearchResultsAnimation *v26;
  objc_class *v27;
  NSString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  objc_super v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;

  v18 = a3;
  v41 = a4;
  v40 = a5;
  v39 = a6;
  v38 = a7;
  v37 = a8;
  v36 = a9;
  v19 = a11;
  v42.receiver = self;
  v42.super_class = (Class)SearchPinsManagerShowSearchResultsAnimation;
  v20 = -[SearchPinsManagerShowSearchResultsAnimation init](&v42, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_searchResults, a3);
    objc_storeStrong((id *)&v21->_searchResultToSelect, a4);
    objc_storeStrong((id *)&v21->_historyItem, a5);
    objc_storeStrong((id *)&v21->_suggestedMapRegion, a6);
    objc_storeStrong((id *)&v21->_mapCameraController, a7);
    objc_storeStrong((id *)&v21->_minZoom, a8);
    objc_storeStrong((id *)&v21->_maxZoom, a9);
    v21->_disableAdditionalViewportPadding = a10;
    v22 = objc_msgSend(v19, "copy");
    completion = v21->_completion;
    v21->_completion = v22;

    v24 = sub_1008AF4EC();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      goto LABEL_10;
    }
    v26 = v21;
    v27 = (objc_class *)objc_opt_class(v26);
    v28 = NSStringFromClass(v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    if ((objc_opt_respondsToSelector(v26, "accessibilityIdentifier") & 1) != 0)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManagerShowSearchResultsAnimation performSelector:](v26, "performSelector:", "accessibilityIdentifier"));
      v31 = v30;
      if (v30 && !objc_msgSend(v30, "isEqualToString:", v29))
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v29, v26, v31));

        goto LABEL_8;
      }

    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v29, v26));
LABEL_8:

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManagerShowSearchResultsAnimation debugDescription](v26, "debugDescription"));
    v34 = objc_msgSend(v18, "count");
    *(_DWORD *)buf = 138543874;
    v44 = v32;
    v45 = 2112;
    v46 = v33;
    v47 = 2048;
    v48 = v34;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "[%{public}@] Initialized animation: %@ for %lu results", buf, 0x20u);

    goto LABEL_9;
  }
LABEL_10:

  return v21;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  SearchPinsManagerShowSearchResultsAnimation *v5;
  SearchPinsManagerShowSearchResultsAnimation *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  __CFString *v16;
  __int16 v17;
  void *v18;

  v3 = sub_1008AF4EC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManagerShowSearchResultsAnimation performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManagerShowSearchResultsAnimation debugDescription](v6, "debugDescription"));
    *(_DWORD *)buf = 138543618;
    v16 = v12;
    v17 = 2112;
    v18 = v13;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}@] Animation is being deallocated: %@", buf, 0x16u);

  }
  -[SearchPinsManagerShowSearchResultsAnimation cancel](self, "cancel");
  v14.receiver = self;
  v14.super_class = (Class)SearchPinsManagerShowSearchResultsAnimation;
  -[SearchPinsManagerShowSearchResultsAnimation dealloc](&v14, "dealloc");
}

- (void)start
{
  id v3;
  NSObject *v4;
  SearchPinsManagerShowSearchResultsAnimation *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSUInteger v12;
  id v13;
  NSObject *v14;
  SearchPinsManagerShowSearchResultsAnimation *v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSUInteger v22;
  SearchResult *searchResultToSelect;
  HistoryEntryRecentsItem *historyItem;
  NSArray *searchResults;
  GEOMapRegion *suggestedMapRegion;
  MapCameraController *mapCameraController;
  NSNumber *minZoom;
  NSNumber *maxZoom;
  BOOL disableAdditionalViewportPadding;
  uint64_t v31;
  _QWORD v32[5];
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  NSUInteger v36;

  if (!self->_started && !self->_cancelled)
  {
    v3 = sub_1008AF4EC();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      goto LABEL_10;
    v5 = self;
    v6 = (objc_class *)objc_opt_class(v5);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if ((objc_opt_respondsToSelector(v5, "accessibilityIdentifier") & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManagerShowSearchResultsAnimation performSelector:](v5, "performSelector:", "accessibilityIdentifier"));
      v10 = v9;
      if (v9 && !objc_msgSend(v9, "isEqualToString:", v8))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v8, v5, v10));

        goto LABEL_9;
      }

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v8, v5));
LABEL_9:

    v12 = -[NSArray count](v5->_searchResults, "count");
    *(_DWORD *)buf = 138543618;
    v34 = v11;
    v35 = 2048;
    v36 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}@] Starting animation for %lu results. ", buf, 0x16u);

LABEL_10:
    self->_started = 1;
    v13 = sub_1008AF4EC();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
LABEL_17:

      searchResultToSelect = self->_searchResultToSelect;
      historyItem = self->_historyItem;
      searchResults = self->_searchResults;
      suggestedMapRegion = self->_suggestedMapRegion;
      mapCameraController = self->_mapCameraController;
      minZoom = self->_minZoom;
      maxZoom = self->_maxZoom;
      disableAdditionalViewportPadding = self->_disableAdditionalViewportPadding;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1008B62A4;
      v32[3] = &unk_1011DA6C8;
      v32[4] = self;
      LOBYTE(v31) = disableAdditionalViewportPadding;
      -[MapCameraController frameSearchResults:withResultToSelect:historyItem:suggestedMapRegion:minZoom:maxZoom:disableAdditionalViewportPadding:completion:](mapCameraController, "frameSearchResults:withResultToSelect:historyItem:suggestedMapRegion:minZoom:maxZoom:disableAdditionalViewportPadding:completion:", searchResults, searchResultToSelect, historyItem, suggestedMapRegion, minZoom, maxZoom, v31, v32);
      return;
    }
    v15 = self;
    v16 = (objc_class *)objc_opt_class(v15);
    v17 = NSStringFromClass(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    if ((objc_opt_respondsToSelector(v15, "accessibilityIdentifier") & 1) != 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManagerShowSearchResultsAnimation performSelector:](v15, "performSelector:", "accessibilityIdentifier"));
      v20 = v19;
      if (v19 && !objc_msgSend(v19, "isEqualToString:", v18))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v18, v15, v20));

        goto LABEL_16;
      }

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v18, v15));
LABEL_16:

    v22 = -[NSArray count](v15->_searchResults, "count");
    *(_DWORD *)buf = 138543618;
    v34 = v21;
    v35 = 2048;
    v36 = v22;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "[%{public}@] Framing map region to show %lu results. ", buf, 0x16u);

    goto LABEL_17;
  }
}

- (void)cancel
{
  id v3;
  NSObject *v4;
  SearchPinsManagerShowSearchResultsAnimation *v5;
  SearchPinsManagerShowSearchResultsAnimation *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  id v14;
  NSObject *v15;
  SearchPinsManagerShowSearchResultsAnimation *v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  id completion;
  uint8_t buf[4];
  __CFString *v25;
  __int16 v26;
  const __CFString *v27;

  v3 = sub_1008AF4EC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManagerShowSearchResultsAnimation performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SearchPinsManagerShowSearchResultsAnimation debugDescription](v6, "debugDescription"));
    *(_DWORD *)buf = 138543618;
    v25 = v12;
    v26 = 2112;
    v27 = v13;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}@] Cancelling animation: %@", buf, 0x16u);

  }
  if (!self->_cancelled)
  {
    self->_cancelled = 1;
    if (self->_completion)
    {
      v14 = sub_1008AF4EC();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
LABEL_20:

        (*((void (**)(double, double, double, double))self->_completion + 2))(MKMapRectNull.origin.x, MKMapRectNull.origin.y, MKMapRectNull.size.width, MKMapRectNull.size.height);
        goto LABEL_21;
      }
      v16 = self;
      v17 = (objc_class *)objc_opt_class(v16);
      v18 = NSStringFromClass(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      if ((objc_opt_respondsToSelector(v16, "accessibilityIdentifier") & 1) != 0)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManagerShowSearchResultsAnimation performSelector:](v16, "performSelector:", "accessibilityIdentifier"));
        v21 = v20;
        if (v20 && !objc_msgSend(v20, "isEqualToString:", v19))
        {
          v22 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v19, v16, v21));

          goto LABEL_19;
        }

      }
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v19, v16));
LABEL_19:

      *(_DWORD *)buf = 138543618;
      v25 = v22;
      v26 = 2112;
      v27 = CFSTR("NO");
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "[%{public}@] Calling animation completion block as animation is cancelled, finished:%@", buf, 0x16u);

      goto LABEL_20;
    }
  }
LABEL_21:
  completion = self->_completion;
  self->_completion = 0;

}

- (void)proceedWithDroppingPins:(BOOL)a3
{
  -[SearchPinsManagerShowSearchResultsAnimation proceedWithDroppingPins:searchResultsRegion:](self, "proceedWithDroppingPins:searchResultsRegion:", a3, MKMapRectNull.origin.x, MKMapRectNull.origin.y, MKMapRectNull.size.width, MKMapRectNull.size.height);
}

- (void)proceedWithDroppingPins:(BOOL)a3 searchResultsRegion:(id)a4
{
  double var1;
  double var0;
  double v6;
  double v7;
  _BOOL4 v8;
  id v10;
  NSObject *v11;
  SearchPinsManagerShowSearchResultsAnimation *v12;
  SearchPinsManagerShowSearchResultsAnimation *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  SearchResult *searchResultToSelect;
  _QWORD *v21;
  void *v22;
  _QWORD v23[9];
  uint8_t buf[4];
  __CFString *v25;
  __int16 v26;
  _BOOL4 v27;

  var1 = a4.var1.var1;
  var0 = a4.var1.var0;
  v6 = a4.var0.var1;
  v7 = a4.var0.var0;
  v8 = a3;
  v10 = sub_1008AF4EC();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = self;
    v13 = v12;
    if (!v12)
    {
      v19 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v14 = (objc_class *)objc_opt_class(v12);
    v15 = NSStringFromClass(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if ((objc_opt_respondsToSelector(v13, "accessibilityIdentifier") & 1) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManagerShowSearchResultsAnimation performSelector:](v13, "performSelector:", "accessibilityIdentifier"));
      v18 = v17;
      if (v17 && !objc_msgSend(v17, "isEqualToString:", v16))
      {
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v16, v13, v18));

        goto LABEL_8;
      }

    }
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v16, v13));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    v25 = v19;
    v26 = 1024;
    v27 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[%{public}@] Proceeding with dropping pins, canWaitForFinalMapRendering:%d", buf, 0x12u);

  }
  if (self->_started && !self->_cancelled && !self->_hasDroppedPins && self->_viewportAllowsDroppingPins)
  {
    self->_hasDroppedPins = 1;
    searchResultToSelect = self->_searchResultToSelect;
    self->_searchResultToSelect = 0;

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1008B6A04;
    v23[3] = &unk_1011AFFE8;
    v23[4] = self;
    *(double *)&v23[5] = v7;
    *(double *)&v23[6] = v6;
    *(double *)&v23[7] = var0;
    *(double *)&v23[8] = var1;
    v21 = objc_retainBlock(v23);
    v22 = v21;
    if (v8)
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v21);
    else
      ((void (*)(_QWORD *))v21[2])(v21);

  }
}

- (void)addCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  _QWORD *v8;
  id completion;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  v5 = objc_retainBlock(self->_completion);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1008B6C64;
  v10[3] = &unk_1011DA6F0;
  v11 = v5;
  v12 = v4;
  v6 = v4;
  v7 = v5;
  v8 = objc_retainBlock(v10);
  completion = self->_completion;
  self->_completion = v8;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_historyItem, 0);
  objc_storeStrong((id *)&self->_searchResultToSelect, 0);
  objc_storeStrong((id *)&self->_maxZoom, 0);
  objc_storeStrong((id *)&self->_minZoom, 0);
  objc_storeStrong((id *)&self->_mapCameraController, 0);
  objc_storeStrong((id *)&self->_suggestedMapRegion, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
}

@end
