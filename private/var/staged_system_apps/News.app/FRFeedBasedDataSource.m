@implementation FRFeedBasedDataSource

- (FRFeedBasedDataSource)initWithFeldsparContext:(id)a3 tags:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  FRTagFeedBasedDataSource *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[FRTagFeedBasedDataSource initWithFeldsparContext:tags:delegate:]([FRTagFeedBasedDataSource alloc], "initWithFeldsparContext:tags:delegate:", v10, v9, v8);

  return &v11->super;
}

- (FRFeedBasedDataSource)initWithFeldsparContext:(id)a3
{
  id v5;
  FRFeedBasedDataSource *v6;
  FRFeedBasedDataSource *v7;
  FRDragController *v8;
  FRDragController *dragController;
  uint64_t v10;
  NSHashTable *collectionViews;
  uint64_t v12;
  NSHashTable *tableViews;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FRFeedBasedDataSource;
  v6 = -[FRFeedBasedDataSource init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_feldsparContext, a3);
    v8 = -[FRDragController initWithDataSource:context:]([FRDragController alloc], "initWithDataSource:context:", v7, v5);
    dragController = v7->_dragController;
    v7->_dragController = v8;

    v10 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    collectionViews = v7->_collectionViews;
    v7->_collectionViews = (NSHashTable *)v10;

    v12 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    tableViews = v7->_tableViews;
    v7->_tableViews = (NSHashTable *)v12;

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)FRFeedBasedDataSource;
  -[FRFeedBasedDataSource dealloc](&v4, "dealloc");
}

- (id)feedAtIndexPath:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;

  v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FRFeedBasedDataSource feedAtIndexPath:]";
    v9 = 2080;
    v10 = "FRFeedBasedDataSource.m";
    v11 = 1024;
    v12 = 85;
    v13 = 2114;
    v14 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FRFeedBasedDataSource feedAtIndexPath:]"));
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v5, 0));

  objc_exception_throw(v6);
}

- (id)feedsInSection:(int64_t)a3
{
  id v3;
  void *v4;
  id v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  id v13;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v3 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v7 = "-[FRFeedBasedDataSource feedsInSection:]";
    v8 = 2080;
    v9 = "FRFeedBasedDataSource.m";
    v10 = 1024;
    v11 = 90;
    v12 = 2114;
    v13 = v3;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FRFeedBasedDataSource feedsInSection:]"));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v4, 0));

  objc_exception_throw(v5);
}

- (id)indexPathForFeed:(id)a3
{
  return 0;
}

- (void)fetchFeedsUpToCount:(unint64_t)a3 qualityOfService:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource tagResults](self, "tagResults"));
  objc_msgSend(v9, "fetchObjectsUpToCount:qualityOfService:completion:", a3, a4, v8);

}

- (id)_titleForSection:(int64_t)a3
{
  id v3;
  void *v4;
  id v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  id v13;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v3 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v7 = "-[FRFeedBasedDataSource _titleForSection:]";
    v8 = 2080;
    v9 = "FRFeedBasedDataSource.m";
    v10 = 1024;
    v11 = 108;
    v12 = 2114;
    v13 = v3;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FRFeedBasedDataSource _titleForSection:]"));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v4, 0));

  objc_exception_throw(v5);
}

- (int64_t)_numberOfSections
{
  id v2;
  void *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v6 = "-[FRFeedBasedDataSource _numberOfSections]";
    v7 = 2080;
    v8 = "FRFeedBasedDataSource.m";
    v9 = 1024;
    v10 = 116;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FRFeedBasedDataSource _numberOfSections]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (int64_t)_cleanNumberOfItemsInSection:(int64_t)a3
{
  void *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource feedsInSection:](self, "feedsInSection:", a3));
  v5 = (unint64_t)objc_msgSend(v4, "count");

  if (!-[FRFeedBasedDataSource numberOfItemsPerPage](self, "numberOfItemsPerPage"))
    return v5;
  if (!-[FRFeedBasedDataSource canItemsPerPageLessThanNumberOfItemsPerPage](self, "canItemsPerPageLessThanNumberOfItemsPerPage"))
  {
    v6 = -[FRFeedBasedDataSource numberOfItemsPerPage](self, "numberOfItemsPerPage");
    if (v5 > -[FRFeedBasedDataSource numberOfItemsPerPage](self, "numberOfItemsPerPage"))
      v5 = v5 / v6 * v6;
  }
  if (!-[FRFeedBasedDataSource maxNumberOfPages](self, "maxNumberOfPages"))
    return v5;
  v7 = -[FRFeedBasedDataSource numberOfItemsPerPage](self, "numberOfItemsPerPage");
  v8 = -[FRFeedBasedDataSource maxNumberOfPages](self, "maxNumberOfPages");
  if (v5 >= v8 * v7)
    return v8 * v7;
  else
    return v5;
}

- (void)configureCollectionView:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(FRFeedPickerCardCollectionViewBaseCell, v5), CFSTR("kFRFeedPickerCardTextCellIdentifier"));
  v7 = objc_opt_class(FRBlankCollectionViewCell, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FRBlankCollectionViewCell reuseIdentifier](FRBlankCollectionViewCell, "reuseIdentifier"));
  objc_msgSend(v4, "registerClass:forCellWithReuseIdentifier:", v7, v8);

  objc_msgSend(v4, "_setCellPrefetchMode:", 1);
  v9 = (id)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource collectionViews](self, "collectionViews"));
  objc_msgSend(v9, "addObject:", v4);

}

- (void)configureTableView:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(FRTagSearchResultTableViewCell, v5), CFSTR("FRTagSearchResultTableViewCellReuseIdentifier"));
  objc_msgSend(v4, "setRowHeight:", 52.0);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource tableViews](self, "tableViews"));
  objc_msgSend(v6, "addObject:", v4);

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  _BYTE *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource feedsInSection:](self, "feedsInSection:", a4));
  v6 = objc_msgSend(v5, "count");

  if (-[FRFeedBasedDataSource tableViewDataOffset](self, "tableViewDataOffset"))
  {
    if ((_BYTE *)-[FRFeedBasedDataSource tableViewDataOffset](self, "tableViewDataOffset") >= v6)
      return 0;
    else
      v6 -= -[FRFeedBasedDataSource tableViewDataOffset](self, "tableViewDataOffset");
  }
  return (int64_t)v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)objc_msgSend(v7, "row")+ -[FRFeedBasedDataSource tableViewDataOffset](self, "tableViewDataOffset"), objc_msgSend(v7, "section")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource knownTags](self, "knownTags"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v8, "row")));

  if (v10)
  {
    v12 = objc_opt_class(FRTagSearchResultTableViewCell, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("FRTagSearchResultTableViewCellReuseIdentifier"), v7));
    v14 = FCDynamicCast(v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource feldsparContext](self, "feldsparContext"));
    objc_msgSend(v15, "applyTag:context:", v10, v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource feldsparContext](self, "feldsparContext"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "subscriptionController"));
    v19 = objc_msgSend(v18, "hasSubscriptionToTag:", v10);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "subscriptionButton"));
    v21 = v20;
    if (v19)
      v22 = 2;
    else
      v22 = 1;
    objc_msgSend(v20, "setSubscriptionState:animated:completion:", v22, 0, 0);

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "subscriptionButton"));
    objc_msgSend(v23, "addTarget:action:forControlEvents:", self, "toggleSubscription:", 64);

    v24 = objc_msgSend(v8, "row");
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "subscriptionButton"));
    objc_msgSend(v25, "setTag:", v24);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)toggleSubscription:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", objc_msgSend(v9, "tag"), 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource feedAtIndexPath:](self, "feedAtIndexPath:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource delegate](self, "delegate"));
  v7 = objc_opt_respondsToSelector(v6, "feedDataSource:toggleSubscription:subscriptionButton:indexPath:");

  if ((v7 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource delegate](self, "delegate"));
    objc_msgSend(v8, "feedDataSource:toggleSubscription:subscriptionButton:indexPath:", self, v5, v9, v4);

  }
}

- (BOOL)_isScrollViewScrolling:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  unsigned int v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FRPPTContext sharedContext](FRPPTContext, "sharedContext"));
  v5 = objc_msgSend(v4, "isRunningPPT");

  if ((objc_msgSend(v3, "isDragging") & 1) != 0
    || (objc_msgSend(v3, "isDecelerating") & 1) != 0)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    v6 = objc_msgSend(v3, "_isAnimatingScroll") | v5;
  }

  return v6;
}

- (BOOL)canLoadCachedImageSynchronouslyForCell:(id)a3
{
  unsigned __int8 v4;
  void *v5;
  void *v6;
  unsigned int v7;

  v4 = -[FRFeedBasedDataSource shouldLoadImageForCell:](self, "shouldLoadImageForCell:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource embeddedScrollView](self, "embeddedScrollView"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource embeddedScrollView](self, "embeddedScrollView"));
    v7 = !-[FRFeedBasedDataSource _isScrollViewScrolling:](self, "_isScrollViewScrolling:", v6);

  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v4 & v7;
}

- (BOOL)shouldAnimateImageLoadForCell:(id)a3
{
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  _BOOL4 v22;
  void *v23;
  unsigned __int8 v24;
  void *v25;
  unsigned __int8 v26;
  CGRect v28;
  CGRect v29;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superview"));
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v4, "frame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v28.origin.x = v7;
  v28.origin.y = v9;
  v28.size.width = v11;
  v28.size.height = v13;
  v29.origin.x = v15;
  v29.origin.y = v17;
  v29.size.width = v19;
  v29.size.height = v21;
  v22 = CGRectIntersectsRect(v28, v29);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource delegate](self, "delegate"));
  v24 = objc_opt_respondsToSelector(v23, "feedDataSourceShouldAnimateLoadOfCellImages:");

  if (((v24 ^ 1) & 1) != 0 || !v22)
    return (v24 ^ 1) & v22;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource delegate](self, "delegate"));
  v26 = objc_msgSend(v25, "feedDataSourceShouldAnimateLoadOfCellImages:", self);

  return v26;
}

- (BOOL)shouldLoadImageForCell:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  unsigned __int8 v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource delegate](self, "delegate", a3));
  v5 = objc_opt_respondsToSelector(v4, "feedDataSourceShouldLoadImagesForCells:");

  if ((v5 & 1) == 0)
    return 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource delegate](self, "delegate"));
  v7 = objc_msgSend(v6, "feedDataSourceShouldLoadImagesForCells:", self);

  return v7;
}

- (void)presentNotificationSettingsForCell:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "feedDataSource:presentNotificationManagerForTag:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "populatedFeed"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "backingTag"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource delegate](self, "delegate"));
    objc_msgSend(v8, "feedDataSource:presentNotificationManagerForTag:", self, v7);

  }
}

- (id)dragController:(id)a3 feedForCellAtIndexPath:(id)a4
{
  return -[FRFeedBasedDataSource feedAtIndexPath:](self, "feedAtIndexPath:", a4);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[FRFeedBasedDataSource _cleanNumberOfItemsInSection:](self, "_cleanNumberOfItemsInSection:", a4);
}

- (BOOL)hasFeedItems
{
  int64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v3 = -[FRFeedBasedDataSource _numberOfSections](self, "_numberOfSections");
  if (v3)
  {
    v4 = v3;
    if (-[FRFeedBasedDataSource _cleanNumberOfItemsInSection:](self, "_cleanNumberOfItemsInSection:", 0) <= 0)
    {
      v5 = 1;
      do
      {
        v6 = v5;
        if (v4 == v5)
          break;
        v7 = -[FRFeedBasedDataSource _cleanNumberOfItemsInSection:](self, "_cleanNumberOfItemsInSection:", v5);
        v5 = v6 + 1;
      }
      while (v7 < 1);
      LOBYTE(v3) = v6 < v4;
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void **v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  id v29;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource feedAtIndexPath:](self, "feedAtIndexPath:", v7));
  v9 = v8;
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000812E4((uint64_t)v7);
    goto LABEL_15;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "backingTag"));
  if (v11)
  {
    v12 = objc_opt_class(FRFeedPickerCardCollectionViewBaseCell, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("kFRFeedPickerCardTextCellIdentifier"), v7));
    v14 = FCDynamicCast(v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    objc_msgSend(v15, "setCardCellDelegate:", self);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100081398((uint64_t)v9);
    v15 = 0;
  }
  objc_msgSend(v15, "setSubscriptionMonitorDelegate:", self);
  objc_msgSend(v15, "setSubscriptionModificationDelegate:", self);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource feldsparContext](self, "feldsparContext"));
  objc_msgSend(v15, "populateWithFeed:context:", v9, v16);

  objc_msgSend(v15, "setRankInSource:", objc_msgSend(v7, "row"));
  objc_msgSend(v15, "setMode:", objc_msgSend(v6, "mode"));
  objc_msgSend(v15, "setTag:", objc_msgSend(v7, "row"));
  objc_msgSend(v15, "setHideHighlightState:", -[FRFeedBasedDataSource hideCellHighlightState](self, "hideCellHighlightState"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource feldsparContext](self, "feldsparContext"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "notificationsConfiguration"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "preSubscribedNotificationsChannelIDs"));
  if (objc_msgSend(v19, "count"))
  {
    objc_msgSend(v15, "setNotificationUIEnabled:", 1);
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "recommendedNotificationChannelIDs"));
    objc_msgSend(v15, "setNotificationUIEnabled:", objc_msgSend(v20, "count") != 0);

  }
  if (+[FRMacros isUIAutomationRunning](FRMacros, "isUIAutomationRunning"))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
    v24 = _NSConcreteStackBlock;
    v25 = 3221225472;
    v26 = sub_100062738;
    v27 = &unk_1000DDC48;
    v28 = v15;
    v29 = v9;
    FCPerformIfNonNil(v21, &v24);

  }
  if (!v15)
  {
LABEL_15:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100081208();
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[FRBlankCollectionViewCell reuseIdentifier](FRBlankCollectionViewCell, "reuseIdentifier", v24, v25, v26, v27));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v22, v7));

  }
  return v15;
}

- (void)exceededMaximumAllowedSubscription
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource subscriptionMonitorDelegate](self, "subscriptionMonitorDelegate"));

  if (v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource subscriptionMonitorDelegate](self, "subscriptionMonitorDelegate"));
    objc_msgSend(v4, "exceededMaximumAllowedSubscription");

  }
}

- (void)showNotificationsEnabledAlertForTag:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource subscriptionMonitorDelegate](self, "subscriptionMonitorDelegate"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource subscriptionMonitorDelegate](self, "subscriptionMonitorDelegate"));
    objc_msgSend(v5, "showNotificationsEnabledAlertForTag:", v6);

  }
}

- (void)feedSubscribedForCollectionViewCell:(id)a3 feed:(id)a4 preSubscribedTagIDs:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource delegate](self, "delegate"));
  v11 = objc_opt_respondsToSelector(v10, "feedDataSource:subscribedWithFeed:indexPathRow:preSubscribedTagIDs:");

  if ((v11 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource delegate](self, "delegate"));
    objc_msgSend(v12, "feedDataSource:subscribedWithFeed:indexPathRow:preSubscribedTagIDs:", self, v8, objc_msgSend(v13, "tag"), v9);

  }
}

- (void)feedUnsubscribedForCollectionViewCell:(id)a3 feed:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource delegate](self, "delegate"));
  v6 = objc_opt_respondsToSelector(v5, "feedDataSource:unsubscribedWithFeed:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRFeedBasedDataSource delegate](self, "delegate"));
    objc_msgSend(v7, "feedDataSource:unsubscribedWithFeed:", self, v8);

  }
}

- (FRFeldsparContext)feldsparContext
{
  return self->_feldsparContext;
}

- (void)setFeldsparContext:(id)a3
{
  objc_storeStrong((id *)&self->_feldsparContext, a3);
}

- (FRSubscriptionMonitorDelegate)subscriptionMonitorDelegate
{
  return (FRSubscriptionMonitorDelegate *)objc_loadWeakRetained((id *)&self->_subscriptionMonitorDelegate);
}

- (void)setSubscriptionMonitorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_subscriptionMonitorDelegate, a3);
}

- (FRFeedBasedDataSourceDelegate)delegate
{
  return (FRFeedBasedDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)tableViewDataOffset
{
  return self->_tableViewDataOffset;
}

- (void)setTableViewDataOffset:(unint64_t)a3
{
  self->_tableViewDataOffset = a3;
}

- (FCStreamingResults)tagResults
{
  return self->_tagResults;
}

- (void)setTagResults:(id)a3
{
  objc_storeStrong((id *)&self->_tagResults, a3);
}

- (unint64_t)numberOfItemsPerPage
{
  return self->_numberOfItemsPerPage;
}

- (void)setNumberOfItemsPerPage:(unint64_t)a3
{
  self->_numberOfItemsPerPage = a3;
}

- (unint64_t)maxNumberOfPages
{
  return self->_maxNumberOfPages;
}

- (void)setMaxNumberOfPages:(unint64_t)a3
{
  self->_maxNumberOfPages = a3;
}

- (BOOL)canItemsPerPageLessThanNumberOfItemsPerPage
{
  return self->_canItemsPerPageLessThanNumberOfItemsPerPage;
}

- (void)setCanItemsPerPageLessThanNumberOfItemsPerPage:(BOOL)a3
{
  self->_canItemsPerPageLessThanNumberOfItemsPerPage = a3;
}

- (BOOL)hideCellHighlightState
{
  return self->_hideCellHighlightState;
}

- (void)setHideCellHighlightState:(BOOL)a3
{
  self->_hideCellHighlightState = a3;
}

- (UIScrollView)embeddedScrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_embeddedScrollView);
}

- (void)setEmbeddedScrollView:(id)a3
{
  objc_storeWeak((id *)&self->_embeddedScrollView, a3);
}

- (FRDragController)dragController
{
  return self->_dragController;
}

- (void)setDragController:(id)a3
{
  objc_storeStrong((id *)&self->_dragController, a3);
}

- (NSArray)knownTags
{
  return self->_knownTags;
}

- (void)setKnownTags:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)filteredTags
{
  return self->_filteredTags;
}

- (void)setFilteredTags:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSHashTable)collectionViews
{
  return self->_collectionViews;
}

- (void)setCollectionViews:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViews, a3);
}

- (NSHashTable)tableViews
{
  return self->_tableViews;
}

- (void)setTableViews:(id)a3
{
  objc_storeStrong((id *)&self->_tableViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableViews, 0);
  objc_storeStrong((id *)&self->_collectionViews, 0);
  objc_storeStrong((id *)&self->_filteredTags, 0);
  objc_storeStrong((id *)&self->_knownTags, 0);
  objc_storeStrong((id *)&self->_dragController, 0);
  objc_destroyWeak((id *)&self->_embeddedScrollView);
  objc_storeStrong((id *)&self->_tagResults, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_subscriptionMonitorDelegate);
  objc_storeStrong((id *)&self->_feldsparContext, 0);
}

@end
