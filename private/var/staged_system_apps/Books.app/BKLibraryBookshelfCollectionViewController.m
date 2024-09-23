@implementation BKLibraryBookshelfCollectionViewController

- (BKLibraryBookshelfCollectionViewController)init
{
  BKLibraryBookshelfCollectionViewController *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v9;
  void *v10;

  v9.receiver = self;
  v9.super_class = (Class)BKLibraryBookshelfCollectionViewController;
  v2 = -[BKLibraryBookshelfCollectionViewController init](&v9, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "_didChangePreferredContentSize:", UIContentSizeCategoryDidChangeNotification, 0);

    v4 = objc_opt_self(UITraitHorizontalSizeClass);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v10 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
    v7 = -[BKLibraryBookshelfCollectionViewController registerForTraitChanges:withAction:](v2, "registerForTraitChanges:withAction:", v6, "updateBarButtonsForTraitChange");

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  BKCollection *collection;
  BKLibraryDataSourceAdaptor *dataSourceAdaptor;
  BKCollection *allBooksCollection;
  void *v7;
  objc_super v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, UIContentSizeCategoryDidChangeNotification, 0);

  -[BKCollection removeObserver:forKeyPath:context:](self->_collection, "removeObserver:forKeyPath:context:", self, CFSTR("sortMode"), off_1009C9C58);
  -[BKCollection removeObserver:forKeyPath:context:](self->_collection, "removeObserver:forKeyPath:context:", self, CFSTR("localizedTitle"), off_1009C9C60);
  -[BKLibraryDataSourceAdaptor removeObserver:forKeyPath:context:](self->_dataSourceAdaptor, "removeObserver:forKeyPath:context:", self, CFSTR("currentStoreAccountID"), off_1009C9C68);
  -[BKCollection removeObserver:forKeyPath:context:](self->_allBooksCollection, "removeObserver:forKeyPath:context:", self, CFSTR("viewMode"), off_1009C9C70);
  collection = self->_collection;
  self->_collection = 0;

  dataSourceAdaptor = self->_dataSourceAdaptor;
  self->_dataSourceAdaptor = 0;

  allBooksCollection = self->_allBooksCollection;
  self->_allBooksCollection = 0;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BURestrictionsProvider sharedInstance](BURestrictionsProvider, "sharedInstance"));
  objc_msgSend(v7, "removeObserver:", self);

  v8.receiver = self;
  v8.super_class = (Class)BKLibraryBookshelfCollectionViewController;
  -[BKLibraryBookshelfCollectionViewController dealloc](&v8, "dealloc");
}

- (id)navigationItem
{
  BSUINavigationItem *bsuiNavigationItem;
  id v4;
  void *v5;
  BSUINavigationItem *v6;
  BSUINavigationItem *v7;

  bsuiNavigationItem = self->_bsuiNavigationItem;
  if (!bsuiNavigationItem)
  {
    v4 = objc_alloc((Class)BSUINavigationItem);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController title](self, "title"));
    v6 = (BSUINavigationItem *)objc_msgSend(v4, "initWithTitle:", v5);
    v7 = self->_bsuiNavigationItem;
    self->_bsuiNavigationItem = v6;

    bsuiNavigationItem = self->_bsuiNavigationItem;
  }
  return bsuiNavigationItem;
}

- (void)setCollection:(id)a3
{
  BKCollection *v5;
  BKCollection **p_collection;
  BKCollection *collection;
  BKCollection *v8;

  v5 = (BKCollection *)a3;
  p_collection = &self->_collection;
  collection = self->_collection;
  if (collection != v5)
  {
    v8 = v5;
    -[BKCollection removeObserver:forKeyPath:context:](collection, "removeObserver:forKeyPath:context:", self, CFSTR("sortMode"), off_1009C9C58);
    -[BKCollection removeObserver:forKeyPath:context:](*p_collection, "removeObserver:forKeyPath:context:", self, CFSTR("localizedTitle"), off_1009C9C60);
    objc_storeStrong((id *)&self->_collection, a3);
    -[BKCollection addObserver:forKeyPath:options:context:](*p_collection, "addObserver:forKeyPath:options:context:", self, CFSTR("sortMode"), 0, off_1009C9C58);
    -[BKCollection addObserver:forKeyPath:options:context:](*p_collection, "addObserver:forKeyPath:options:context:", self, CFSTR("localizedTitle"), 0, off_1009C9C60);
    v5 = v8;
  }

}

- (void)setDataSourceAdaptor:(id)a3
{
  BKLibraryDataSourceAdaptor *v5;
  BKLibraryDataSourceAdaptor *dataSourceAdaptor;
  void *v7;
  unsigned int v8;
  BKCollection *allBooksCollection;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BKCollection *v14;
  BKCollection *v15;
  BKLibraryDataSourceAdaptor *v16;

  v5 = (BKLibraryDataSourceAdaptor *)a3;
  dataSourceAdaptor = self->_dataSourceAdaptor;
  if (dataSourceAdaptor != v5)
  {
    v16 = v5;
    -[BKLibraryDataSourceAdaptor removeObserver:forKeyPath:context:](dataSourceAdaptor, "removeObserver:forKeyPath:context:", self, CFSTR("currentStoreAccountID"), off_1009C9C68);
    -[BKCollection removeObserver:forKeyPath:context:](self->_allBooksCollection, "removeObserver:forKeyPath:context:", self, CFSTR("viewMode"), off_1009C9C70);
    objc_storeStrong((id *)&self->_dataSourceAdaptor, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDataSourceAdaptor supplementaryDataSource](v16, "supplementaryDataSource"));
    v8 = objc_msgSend(v7, "canChangeViewMode");

    allBooksCollection = self->_allBooksCollection;
    if (v8)
    {
      if (allBooksCollection)
      {
LABEL_7:
        -[BKLibraryDataSourceAdaptor addObserver:forKeyPath:options:context:](self->_dataSourceAdaptor, "addObserver:forKeyPath:options:context:", self, CFSTR("currentStoreAccountID"), 0, off_1009C9C68);
        -[BKCollection addObserver:forKeyPath:options:context:](self->_allBooksCollection, "addObserver:forKeyPath:options:context:", self, CFSTR("viewMode"), 0, off_1009C9C70);
        v5 = v16;
        goto LABEL_8;
      }
      allBooksCollection = (BKCollection *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollection collectionController](allBooksCollection, "collectionController"));
      v11 = kBKCollectionDefaultAll;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uiChildContext"));
      v14 = (BKCollection *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mutableCollectionWithCollectionID:inManagedObjectContext:error:", v11, v13, 0));
      v15 = self->_allBooksCollection;
      self->_allBooksCollection = v14;

    }
    else
    {
      self->_allBooksCollection = 0;
    }

    goto LABEL_7;
  }
LABEL_8:

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  id v18;
  objc_super v19;
  _QWORD v20[5];
  id v21;
  _QWORD block[5];
  _QWORD v23[5];
  _QWORD v24[5];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (off_1009C9C68 == a6)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000CFE10;
    v24[3] = &unk_1008E72C0;
    v24[4] = self;
    v13 = v24;
LABEL_9:
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
    goto LABEL_10;
  }
  if (off_1009C9C70 == a6)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000CFE18;
    v23[3] = &unk_1008E72C0;
    v23[4] = self;
    v13 = v23;
    goto LABEL_9;
  }
  if (off_1009C9C58 == a6)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000CFE80;
    block[3] = &unk_1008E72C0;
    block[4] = self;
    v13 = block;
    goto LABEL_9;
  }
  if (off_1009C9C60 == a6)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collection](self, "collection"));
    v15 = objc_msgSend(v14, "isDefaultCollection");

    if ((v15 & 1) == 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collection](self, "collection"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedTitle"));

      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000CFF40;
      v20[3] = &unk_1008E7338;
      v20[4] = self;
      v21 = v17;
      v18 = v17;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v20);

    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)BKLibraryBookshelfCollectionViewController;
    -[BKLibraryBookshelfCollectionViewController observeValueForKeyPath:ofObject:change:context:](&v19, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }
LABEL_10:

}

- (void)_didChangePreferredContentSize:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionViewLayout"));
  objc_msgSend(v3, "invalidateLayout");

}

- (void)changeViewModeTo:(unint64_t)a3
{
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController allBooksCollection](self, "allBooksCollection"));
  if (v11)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    v6 = objc_msgSend(v11, "setDifferentNumber:forKey:", v5, CFSTR("viewMode"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "managedObjectContext"));
      objc_msgSend(v7, "saveManagedObjectContext:", v8);

    }
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "supplementaryDataSource"));
    objc_msgSend(v10, "setViewMode:", a3);

    -[BKLibraryBookshelfCollectionViewController viewModeChanged](self, "viewModeChanged");
  }

}

- (void)setNeedsUpdateViewMode
{
  self->_needsUpdateViewMode = 1;
}

- (void)updateViewModeIfNeeded
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  if (self->_needsUpdateViewMode)
  {
    self->_needsUpdateViewMode = 0;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController allBooksCollection](self, "allBooksCollection"));
    v4 = objc_msgSend(v3, "resolvedViewMode");

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "supplementaryDataSource"));
    v7 = objc_msgSend(v6, "viewMode");

    if (v7 != v4)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "supplementaryDataSource"));
      objc_msgSend(v9, "setViewMode:", v4);

      -[BKLibraryBookshelfCollectionViewController viewModeChanged](self, "viewModeChanged");
    }
  }
}

- (void)changeSortModeTo:(unint64_t)a3
{
  unint64_t v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (a3 - 11 < 0xFFFFFFFFFFFFFFF6)
    v4 = 1;
  else
    v4 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collection](self, "collection"));
  if (v11)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v4));
    v6 = objc_msgSend(v11, "setDifferentNumber:forKey:", v5, CFSTR("sortMode"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "managedObjectContext"));
      objc_msgSend(v7, "saveManagedObjectContext:", v8);

    }
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "supplementaryDataSource"));
    objc_msgSend(v10, "setSortMode:", v4);

    if (-[BKLibraryBookshelfCollectionViewController isSeriesCollection](self, "isSeriesCollection"))
    {
      +[BKCollection setSortModeForSeriesCollections:](BKCollection, "setSortModeForSeriesCollections:", v4);
      -[BKLibraryBookshelfCollectionViewController _emitAllInSeriesViewEventIfNeeded](self, "_emitAllInSeriesViewEventIfNeeded");
    }
    -[BKLibraryBookshelfCollectionViewController sortModeChanged](self, "sortModeChanged");
  }

}

- (void)bc_environmentDidChangeFont
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionViewLayout"));
  objc_msgSend(v2, "invalidateLayout");

}

- (BOOL)isSeriesCollection
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "supplementaryDataSource"));
  v4 = objc_msgSend(v3, "collectionIsSeries");

  return v4;
}

- (void)_applicationDidEnterBackground:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v4 = BKLibraryLog(self, a2, a3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Resume removing from My Samples as app is now background", v8, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BSUIStoreServices sharedInstance](BSUIStoreServices, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
  objc_msgSend(v6, "resumeRemovingFromMySamplesWithTracker:", v7);

}

- (void)_applicationWillEnterForeground:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = BKLibraryLog(self, a2, a3);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Pause removing from My Samples as app is now foreground", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BSUIStoreServices sharedInstance](BSUIStoreServices, "sharedInstance"));
  objc_msgSend(v5, "pauseRemovingFromMySamples");

}

- (id)_supplementalContentCount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "supplementaryDataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "supplementalContentStorePlaylistID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uiChildContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "libraryMutableAssetWithAssetID:inManagedObjectContext:", v6, v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "supplementalContentAssets"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count")));

  return v10;
}

- (void)setDragDelegate:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_dragDelegate, a3);
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v6, "setDragDelegate:", v5);

}

- (void)setDropDelegate:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_dropDelegate, a3);
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v6, "setDropDelegate:", v5);

}

- (void)loadView
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BKLibraryBookshelfCollectionView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  BKLibraryBookshelfSelectedActionBarViewController *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  BKLibraryBookshelfCollectionView *v55;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BURestrictionsProvider sharedInstance](BURestrictionsProvider, "sharedInstance"));
  objc_msgSend(v3, "addObserver:", self);

  v4 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 500.0, 500.0);
  -[BKLibraryBookshelfCollectionViewController setWrapperView:](self, "setWrapperView:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController wrapperView](self, "wrapperView"));
  objc_msgSend(v5, "setAutoresizingMask:", 18);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController wrapperView](self, "wrapperView"));
  objc_msgSend(v6, "setAutoresizesSubviews:", 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController wrapperView](self, "wrapperView"));
  -[BKLibraryBookshelfCollectionViewController setView:](self, "setView:", v7);

  v8 = [BKLibraryBookshelfCollectionView alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController layout](self, "layout"));
  v55 = -[BKLibraryBookshelfCollectionView initWithFrame:collectionViewLayout:](v8, "initWithFrame:collectionViewLayout:", v9, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

  -[BKLibraryBookshelfCollectionView setBkaxLabelProvider:](v55, "setBkaxLabelProvider:", self);
  -[BKLibraryBookshelfCollectionViewController setCollectionView:](self, "setCollectionView:", v55);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v11, "setDataSource:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v12, "setDelegate:", self);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dragDelegate](self, "dragDelegate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v14, "setDragDelegate:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dropDelegate](self, "dropDelegate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v16, "setDropDelegate:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v17, "setAllowsSelection:", 1);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v18, "setAllowsMultipleSelection:", 1);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v19, "setAllowsMultipleSelectionDuringEditing:", 1);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v20, "setAutoresizingMask:", 18);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v21, "setReorderingCadence:", 1);

  v22 = -[BKLibraryBookshelfCollectionViewController isSupplementalContentPDFPicker](self, "isSupplementalContentPDFPicker") ^ 1;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v23, "setDragInteractionEnabled:", v22);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v24, "setAlwaysBounceVertical:", 1);

  -[BKLibraryBookshelfCollectionViewController _setCollectionViewSelectionFollowsFocus](self, "_setCollectionViewSelectionFollowsFocus");
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
  objc_msgSend(v26, "setCollectionView:", v25);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "booksDataSource"));
  objc_msgSend(v29, "setDelegate:", v27);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
  objc_msgSend(v30, "reloadData");

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController wrapperView](self, "wrapperView"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v31, "addSubview:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController wrapperView](self, "wrapperView"));
  objc_msgSend(v33, "bounds");
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v42, "setFrame:", v35, v37, v39, v41);

  v43 = objc_alloc_init(BKLibraryBookshelfSelectedActionBarViewController);
  -[BKLibraryBookshelfCollectionViewController setActionBarViewController:](self, "setActionBarViewController:", v43);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController actionBarViewController](self, "actionBarViewController"));
  objc_msgSend(v44, "setDelegate:", self);

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController actionBarViewController](self, "actionBarViewController"));
  -[BKLibraryBookshelfCollectionViewController addChildViewController:](self, "addChildViewController:", v45);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController actionBarViewController](self, "actionBarViewController"));
  objc_msgSend(v46, "loadViewIfNeeded");

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController wrapperView](self, "wrapperView"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController actionBarViewController](self, "actionBarViewController"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "view"));
  objc_msgSend(v47, "addSubview:", v49);

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController actionBarViewController](self, "actionBarViewController"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "view"));
  objc_msgSend(v51, "setHidden:", 1);

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController actionBarViewController](self, "actionBarViewController"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "view"));
  objc_msgSend(v53, "setAlpha:", 0.0);

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController actionBarViewController](self, "actionBarViewController"));
  objc_msgSend(v54, "didMoveToParentViewController:", self);

}

- (void)viewDidLoad
{
  void *v3;
  BKLibraryCollectionTitleView *v4;
  void *v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKLibraryBookshelfCollectionViewController;
  -[BKLibraryBookshelfCollectionViewController viewDidLoad](&v7, "viewDidLoad");
  -[BKLibraryBookshelfCollectionViewController bc_setNavBarVisible:](self, "bc_setNavBarVisible:", 1);
  -[BKLibraryBookshelfCollectionViewController updateBarButtonsAnimated:](self, "updateBarButtonsAnimated:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v3, "_setSupportsTwoLineLargeTitles:", 1);

  v4 = objc_alloc_init(BKLibraryCollectionTitleView);
  -[BKLibraryCollectionTitleView setDelegate:](v4, "setDelegate:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v5, "setTitleView:", v4);

  v6 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", 0, 0, self, "selectAllButtonPressed:");
  -[BKLibraryBookshelfCollectionViewController setNavBarSelectAllButtonItem:](self, "setNavBarSelectAllButtonItem:", v6);
  -[BKLibraryBookshelfCollectionViewController _configureSupplementalContentPDFPicker](self, "_configureSupplementalContentPDFPicker");

}

- (void)viewIsAppearing:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  double v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];

  v21.receiver = self;
  v21.super_class = (Class)BKLibraryBookshelfCollectionViewController;
  -[BKLibraryBookshelfCollectionViewController viewIsAppearing:](&v21, "viewIsAppearing:", a3);
  if (self->_appearingForFirstTime)
  {
    self->_appearingForFirstTime = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController navigationController](self, "navigationController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationBar"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_restingHeights"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController view](self, "view"));
    objc_msgSend(v7, "safeAreaInsets");
    v9 = v8;

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), "doubleValue", (_QWORD)v17);
          v9 = v9 + v15;
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v12);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
    objc_msgSend(v16, "_setShouldContentOffsetAlwaysIgnoreSafeAreaInsetsChange:", 1);
    objc_msgSend(v16, "setContentOffset:", 0.0, -(v9 + 1.0));
    objc_msgSend(v16, "_setShouldContentOffsetAlwaysIgnoreSafeAreaInsetsChange:", 0);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)BKLibraryBookshelfCollectionViewController;
  -[BKLibraryBookshelfCollectionViewController viewWillAppear:](&v22, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collection](self, "collection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionID"));
  v6 = objc_msgSend(v5, "isEqualToString:", kBKCollectionDefaultIDFinished);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    objc_msgSend(v7, "cleanupDateFinished");

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController ba_analyticsTracker](self, "ba_analyticsTracker"));

  if (!v8)
    v9 = -[BKLibraryBookshelfCollectionViewController ba_setupNewAnalyticsTrackerWithName:](self, "ba_setupNewAnalyticsTrackerWithName:", CFSTR("Collection"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v10, "addObserver:selector:name:object:", self, "preferredContentSizeChanged:", UIContentSizeCategoryDidChangeNotification, 0);

  -[BKLibraryBookshelfCollectionViewController setHasInitializedCollectionBackgroundColor:](self, "setHasInitializedCollectionBackgroundColor:", 0);
  -[BKLibraryBookshelfCollectionViewController updateViewModeIfNeeded](self, "updateViewModeIfNeeded");
  -[BKLibraryBookshelfCollectionViewController updateSelectAllBarButton](self, "updateSelectAllBarButton");
  -[BKLibraryBookshelfCollectionViewController updateBarButtonsAnimated:](self, "updateBarButtonsAnimated:", 0);
  -[BKLibraryBookshelfCollectionViewController configureForDragAndDropSession](self, "configureForDragAndDropSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "supplementaryDataSource"));
  objc_msgSend(v12, "updateSettingsForMajorVisibilityChange");

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "priceManager"));
  objc_msgSend(v14, "invalidate:", 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "panGestureRecognizer"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController navigationController](self, "navigationController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "interactivePopGestureRecognizer"));
  objc_msgSend(v16, "requireGestureRecognizerToFail:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController navigationController](self, "navigationController"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "navigationBar"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksKeyColor](UIColor, "bc_booksKeyColor"));
  objc_msgSend(v20, "setTintColor:", v21);

  -[BKLibraryBookshelfCollectionViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKLibraryBookshelfCollectionViewController;
  -[BKLibraryBookshelfCollectionViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v6, "viewDidMoveToWindow:shouldAppearOrDisappear:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController layout](self, "layout"));
  objc_msgSend(v5, "updateMetricsWithViewController:", self);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKLibraryBookshelfCollectionViewController;
  -[BKLibraryBookshelfCollectionViewController viewWillLayoutSubviews](&v4, "viewWillLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController layout](self, "layout"));
  objc_msgSend(v3, "updateMetricsWithViewController:", self);

  -[BKLibraryBookshelfCollectionViewController updateTitleFromMetrics](self, "updateTitleFromMetrics");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)BKLibraryBookshelfCollectionViewController;
  -[BKLibraryBookshelfCollectionViewController viewDidAppear:](&v15, "viewDidAppear:", a3);
  -[BKLibraryBookshelfCollectionViewController bc_analyticsVisibilityUpdateSubtree](self, "bc_analyticsVisibilityUpdateSubtree");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collection](self, "collection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionID"));
  v6 = objc_msgSend(v5, "isEqualToString:", kBKCollectionDefaultIDSamples);

  if (v6)
  {
    v10 = BKLibraryLog(v7, v8, v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Pause removing from My Samples", v14, 2u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[BSUIStoreServices sharedInstance](BSUIStoreServices, "sharedInstance"));
    objc_msgSend(v12, "pauseRemovingFromMySamples");

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v13, "addObserver:selector:name:object:", self, "_applicationDidEnterBackground:", UIApplicationDidEnterBackgroundNotification, 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", self, "_applicationWillEnterForeground:", UIApplicationWillEnterForegroundNotification, 0);

  }
  if (-[BKLibraryBookshelfCollectionViewController shouldAccessibilityFocusCollectionViewUponAppearing](self, "shouldAccessibilityFocusCollectionViewUponAppearing"))
  {
    -[BKLibraryBookshelfCollectionViewController _bkAccessibilityFocusCollectionView](self, "_bkAccessibilityFocusCollectionView");
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKLibraryBookshelfCollectionViewController;
  -[BKLibraryBookshelfCollectionViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[BKLibraryBookshelfCollectionViewController dismissReadingListPopover](self, "dismissReadingListPopover");
  -[BKLibraryBookshelfCollectionViewController bc_analyticsVisibilitySubtreeWillDisappear](self, "bc_analyticsVisibilitySubtreeWillDisappear");
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t v16[16];
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)BKLibraryBookshelfCollectionViewController;
  -[BKLibraryBookshelfCollectionViewController viewDidDisappear:](&v17, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collection](self, "collection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionID"));
  v6 = objc_msgSend(v5, "isEqualToString:", kBKCollectionDefaultIDSamples);

  if (v6)
  {
    v10 = BKLibraryLog(v7, v8, v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Resume removing from My Samples", v16, 2u);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[BSUIStoreServices sharedInstance](BSUIStoreServices, "sharedInstance"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
    objc_msgSend(v12, "resumeRemovingFromMySamplesWithTracker:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v14, "removeObserver:name:object:", self, UIApplicationDidEnterBackgroundNotification, 0);
    objc_msgSend(v14, "removeObserver:name:object:", self, UIApplicationWillEnterForegroundNotification, 0);

  }
  -[BKLibraryBookshelfCollectionViewController bc_analyticsVisibilitySubtreeDidDisappear](self, "bc_analyticsVisibilitySubtreeDidDisappear");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v15, "removeObserver:name:object:", self, UIContentSizeCategoryDidChangeNotification, 0);

}

- (void)_emitAllInSeriesViewEventIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  if (-[BKLibraryBookshelfCollectionViewController isSeriesCollection](self, "isSeriesCollection"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "supplementaryDataSource"));
    v5 = objc_msgSend(v4, "sortMode");

    if (v5 == (id)10)
    {
      v13 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "supplementaryDataSource"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "seriesID"));

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "booksDataSource"));
      v11 = objc_msgSend(v10, "totalNumberOfItems");

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
      objc_msgSend(v12, "emitAllInSeriesViewEventWithTracker:collectionID:collectionItemCount:", v13, v8, v11);

    }
  }
}

- (void)bc_analyticsVisibilityDidAppear
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSDate *v12;
  NSDate *analyticsStartDate;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BKLibraryBookshelfCollectionViewController;
  -[BKLibraryBookshelfCollectionViewController bc_analyticsVisibilityDidAppear](&v14, "bc_analyticsVisibilityDidAppear");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "supplementaryDataSource"));
  v6 = objc_msgSend(v5, "supplementalContentPDFPicker");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "supplementaryDataSource"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "supplementalContentStorePlaylistID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController _supplementalContentCount](self, "_supplementalContentCount"));
    objc_msgSend(v7, "emitPageViewEventForSupplementalContentPDFWithTracker:contentID:supplementalContentCount:", v3, v10, v11);

  }
  else
  {
    v12 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    analyticsStartDate = self->_analyticsStartDate;
    self->_analyticsStartDate = v12;

    -[BKLibraryBookshelfCollectionViewController _emitAllInSeriesViewEventIfNeeded](self, "_emitAllInSeriesViewEventIfNeeded");
  }

}

- (void)bc_analyticsVisibilityWillDisappear
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  NSMutableArray *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableArray *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  NSDate *analyticsStartDate;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  unint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  BKLibraryBookshelfCollectionViewController *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  id v51;
  id obj;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  objc_super v57;
  _BYTE v58[128];

  v57.receiver = self;
  v57.super_class = (Class)BKLibraryBookshelfCollectionViewController;
  -[BKLibraryBookshelfCollectionViewController bc_analyticsVisibilityWillDisappear](&v57, "bc_analyticsVisibilityWillDisappear");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "supplementaryDataSource"));
  v5 = objc_msgSend(v4, "supplementalContentPDFPicker");

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collection](self, "collection"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionID"));
    v9 = objc_msgSend(v8, "isEqualToString:", kBKCollectionDefaultAll);

    if ((v9 & 1) != 0)
    {
      v50 = v6;
      v10 = objc_opt_new(NSMutableArray);
      v47 = self;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "booksDataSource"));

      v48 = v12;
      if (objc_msgSend(v12, "numberOfSections"))
      {
        v13 = 0;
        do
        {
          v55 = 0u;
          v56 = 0u;
          v53 = 0u;
          v54 = 0u;
          v49 = v13;
          obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "representedObjectsInSection:", v13));
          v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v54;
            do
            {
              v17 = 0;
              v51 = v15;
              do
              {
                if (*(_QWORD *)v54 != v16)
                  objc_enumerationMutation(obj);
                v18 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)v17);
                if (objc_msgSend(v18, "isLocal"))
                {
                  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "assetID"));
                  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "contentPrivateIDForContentID:", v19));
                  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "contentUserIDForContentID:", v19));
                  v22 = v10;
                  v23 = +[BAUtilities contentTypeFromAssetType:](BAUtilities, "contentTypeFromAssetType:", (int)objc_msgSend(v18, "contentType"));
                  v24 = objc_alloc((Class)BALibraryItemTypeData);
                  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v18, "isSample")));
                  v26 = v23;
                  v10 = v22;
                  v27 = objc_msgSend(v24, "initWithContentPrivateID:contentUserID:contentType:contentID:isSample:", v20, v21, v26, v19, v25);

                  -[NSMutableArray addObject:](v22, "addObject:", v27);
                  v15 = v51;

                }
                v17 = (char *)v17 + 1;
              }
              while (v15 != v17);
              v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
            }
            while (v15);
          }

          v12 = v48;
          v13 = v49 + 1;
        }
        while (v49 + 1 < (unint64_t)objc_msgSend(v48, "numberOfSections"));
      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
      analyticsStartDate = v47->_analyticsStartDate;
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](v47, "dataSourceAdaptor"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "supplementaryDataSource"));
      v32 = objc_msgSend(v31, "viewMode");
      if (v32 == (id)1)
        v33 = 1;
      else
        v33 = 2 * (v32 == (id)2);
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](v47, "dataSourceAdaptor"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "supplementaryDataSource"));
      v36 = (unint64_t)objc_msgSend(v35, "sortMode") - 1;
      if (v36 > 5)
        v37 = 0;
      else
        v37 = qword_10070C830[v36];
      v6 = v50;
      objc_msgSend(v28, "emitLibraryViewEventWithTracker:startDate:librarySummary:displayType:sortType:", v50, analyticsStartDate, v10, v33, v37);

      v44 = v48;
    }
    else
    {
      if (-[BKLibraryBookshelfCollectionViewController isSeriesCollection](self, "isSeriesCollection"))
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "supplementaryDataSource"));
        v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "seriesID"));

        v41 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "booksDataSource"));
        v43 = objc_msgSend(v42, "totalNumberOfItems");
      }
      else
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collection](self, "collection"));
        v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "collectionID"));

        v41 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collection](self, "collection"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "members"));
        v43 = objc_msgSend(v42, "count");
      }
      v46 = v43;

      v44 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
      objc_msgSend(v44, "emitCollectionScreenViewEventWithTracker:startDate:collectionID:collectionItemCount:", v6, self->_analyticsStartDate, v40, v46);
      v10 = (NSMutableArray *)v40;
    }

  }
}

- (unint64_t)supportedInterfaceOrientations
{
  if (isPad(self, a2))
    return 30;
  else
    return 2;
}

- (void)bc_tabBarControllerWillSelectViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController tabBarController](self, "tabBarController"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectedViewController"));

  v6 = v12;
  if (v12 != v4)
  {
    v7 = objc_msgSend(v12, "im_isAncestorOfChildViewController:", self);
    v6 = v12;
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController bc_descendentPresentedViewController](self, "bc_descendentPresentedViewController"));
      objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 0, 0);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController actionBarViewController](self, "actionBarViewController"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
      v11 = objc_msgSend(v10, "isHidden");

      v6 = v12;
      if ((v11 & 1) == 0)
      {
        -[BKLibraryBookshelfCollectionViewController setEditing:animated:](self, "setEditing:animated:", 0, 0);
        v6 = v12;
      }
    }
  }

}

- (BOOL)editableCollection
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController layout](self, "layout"));
  v3 = objc_msgSend(v2, "editableCollection");

  return v3;
}

- (BOOL)reorderableCollection
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController layout](self, "layout"));
  v3 = objc_msgSend(v2, "reorderableCollection");

  return v3;
}

- (void)preferredContentSizeChanged:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView", a3));
  objc_msgSend(v3, "reloadData");

}

- (BOOL)isSupplementalContentPDFPicker
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "supplementaryDataSource"));
  v4 = objc_msgSend(v3, "supplementalContentPDFPicker");

  return v4;
}

- (void)reloadData
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
  objc_msgSend(v3, "reloadData");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v4, "reloadData");

}

- (void)explicitContentRestrictedChanged
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D1D84;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)scrollToMakeLibraryAssetIDVisible:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uiChildContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "libraryMutableAssetWithAssetID:inManagedObjectContext:", v4, v5));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "booksDataSource"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "indexPathForRepresentedObject:", v6));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
      objc_msgSend(v10, "scrollToItemAtIndexPath:atScrollPosition:animated:", v9, 2, 0);

    }
  }

}

- (void)openSeriesContainer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000D1F18;
  v7[3] = &unk_1008EA130;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[BKLibraryBookshelfCollectionViewController createSeriesViewControllerFromSeriesContainer:withParentTracker:completion:](self, "createSeriesViewControllerFromSeriesContainer:withParentTracker:completion:", v6, v5, v7);

}

- (void)_refreshSeriesContainer:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BUBag defaultBag](BUBag, "defaultBag"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "seriesInfoLiveFetchesEnabled"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000D2310;
  v7[3] = &unk_1008EA158;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "valueWithCompletion:", v7);

}

- (void)_configureSupplementalContentPDFPicker
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (-[BKLibraryBookshelfCollectionViewController isSupplementalContentPDFPicker](self, "isSupplementalContentPDFPicker"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
    -[BKLibraryBookshelfCollectionViewController setContentScrollView:forEdge:](self, "setContentScrollView:forEdge:", v3, 1);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "supplementaryDataSource"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "supplementalContentPDFPickerTitle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v7, "setTitle:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v8, "setLargeTitleDisplayMode:", 2);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v9, "setRightBarButtonItem:", 0);

    v11 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 24, self, "cancelButtonPressed:");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v10, "setRightBarButtonItem:animated:", v11, 0);

  }
}

- (void)cancelButtonPressed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "supplementaryDataSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "supplementalContentStorePlaylistID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController _supplementalContentCount](self, "_supplementalContentCount"));
  objc_msgSend(v4, "emitCloseSupplementalContentPDFPickerWithTracker:contentID:supplementalContentCount:", v5, v8, v9);

  -[BKLibraryBookshelfCollectionViewController _dismissIfSupplementContentPDFPicker](self, "_dismissIfSupplementContentPDFPicker");
}

- (void)selectAllButtonPressed:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPathsForSelectedItems"));
  v6 = objc_msgSend(v5, "count");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "booksDataSource"));
  v9 = objc_msgSend(v8, "totalNumberOfItems");

  if (v6 == v9)
    -[BKLibraryBookshelfCollectionViewController deselectAll](self, "deselectAll");
  else
    -[BKLibraryBookshelfCollectionViewController selectAll](self, "selectAll");
}

- (void)updateSelectAllBarButton
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  if (-[BKLibraryBookshelfCollectionViewController isEditing](self, "isEditing"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "booksDataSource"));
    v5 = objc_msgSend(v4, "totalNumberOfItems");

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathsForSelectedItems"));
    v8 = objc_msgSend(v7, "count");

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = v9;
    if (v5 && v8 == v5)
      v11 = CFSTR("Deselect All");
    else
      v11 = CFSTR("Select All");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_10091C438, 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController navBarSelectAllButtonItem](self, "navBarSelectAllButtonItem"));
    objc_msgSend(v13, "setTitle:", v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController navBarSelectAllButtonItem](self, "navBarSelectAllButtonItem"));
    objc_msgSend(v14, "setEnabled:", v5 != 0);

    v16 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController navigationItem](self, "navigationItem"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController navBarSelectAllButtonItem](self, "navBarSelectAllButtonItem"));
    objc_msgSend(v16, "setLeftBarButtonItem:animated:", v15, 0);

  }
  else
  {
    v16 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v16, "setLeftBarButtonItem:animated:", 0, 0);
  }

}

- (void)doneButtonPressed:(id)a3
{
  -[BKLibraryBookshelfCollectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)addDoneButton:(BOOL)a3 forPresentationController:(id)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  v6 = a4;
  v7 = objc_opt_class(UINavigationController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentedViewController"));

  v9 = BUDynamicCast(v7, v8);
  v15 = (id)objc_claimAutoreleasedReturnValue(v9);

  v10 = v15;
  if (v15)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "topViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "navigationItem"));
    v13 = v12;
    if (v4)
    {
      v14 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "doneButtonPressed:");
      objc_msgSend(v13, "setRightBarButtonItem:animated:", v14, 0);

    }
    else
    {
      objc_msgSend(v12, "setRightBarButtonItem:animated:", 0, 0);
    }

    v10 = v15;
  }

}

- (void)prepareForPopoverPresentation:(id)a3
{
  -[BKLibraryBookshelfCollectionViewController addDoneButton:forPresentationController:](self, "addDoneButton:forPresentationController:", 0, a3);
}

- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4
{
  -[BKLibraryBookshelfCollectionViewController addDoneButton:forPresentationController:](self, "addDoneButton:forPresentationController:", 1, a3);
  return 0;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController addSelectedBooksCompletion](self, "addSelectedBooksCompletion", a3));
  if (v4)
    v4[2](v4, 0);
  -[BKLibraryBookshelfCollectionViewController setAddSelectedBooksCompletion:](self, "setAddSelectedBooksCompletion:", 0);

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v4;
  id v5;
  id v6;

  if (!a4)
    return 0;
  v4 = a4;
  v5 = objc_msgSend(v4, "horizontalSizeClass");
  v6 = objc_msgSend(v4, "verticalSizeClass");

  if (v6 == (id)1 || v5 == (id)1)
    return 0;
  else
    return 7;
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return 1;
}

- (void)_setCollectionViewSelectionFollowsFocus
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v2, "setSelectionFollowsFocus:", 1);

}

- (void)updateBarButtonsForTraitChange
{
  -[BKLibraryBookshelfCollectionViewController updateBarButtonsAnimated:](self, "updateBarButtonsAnimated:", 1);
}

- (void)restrictionsForExplicitContentAllowedChanged:(BOOL)a3
{
  -[BKLibraryBookshelfCollectionViewController explicitContentRestrictedChanged](self, "explicitContentRestrictedChanged", a3);
}

- (id)coverAnimationHostSourceForItem:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  BKLibraryBookOpenAnimatingSourceProxy *v8;
  void *v9;
  BKLibraryBookOpenAnimatingSourceProxy *v10;

  v4 = a3;
  v5 = objc_opt_class(BKLibraryAsset);
  v6 = BUDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
  {
    v8 = [BKLibraryBookOpenAnimatingSourceProxy alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
    v10 = -[BKLibraryBookOpenAnimatingSourceProxy initWithLibraryAsset:coverHost:](v8, "initWithLibraryAsset:coverHost:", v7, v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)coverAnimationHostScrollToMakeVisible:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  v5 = objc_opt_class(BKLibraryBookOpenAnimatingSourceProxy);
  v6 = BUDynamicCast(v5, v4);
  v14 = (id)objc_claimAutoreleasedReturnValue(v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "libraryAsset"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "booksDataSource"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "indexPathForRepresentedObject:", v7));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController layout](self, "layout"));
    objc_msgSend(v11, "setCoverAnimationRunningHack:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
    objc_msgSend(v12, "scrollToItemAtIndexPath:atScrollPosition:animated:", v10, 2, 0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
    objc_msgSend(v13, "layoutIfNeeded");

  }
}

- (BOOL)coverAnimationHostWantsScrollOnClose
{
  return 1;
}

- (BOOL)coverAnimationHostIsFullyVisible:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double MinY;
  void *v35;
  double v36;
  BOOL v37;
  CGRect v39;
  CGRect v40;

  v4 = a3;
  v5 = objc_opt_class(BKLibraryBookOpenAnimatingSourceProxy);
  v6 = BUDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "libraryAsset"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "booksDataSource"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "indexPathForRepresentedObject:", v8));

  if (v11
    && (v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView")),
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "indexPathsForVisibleItems")),
        v14 = objc_msgSend(v13, "containsObject:", v11),
        v13,
        v12,
        v14))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "cellForItemAtIndexPath:", v11));

    if (v16)
    {
      objc_msgSend(v16, "frame");
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
      objc_msgSend(v25, "contentOffset");
      v27 = v26;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
      objc_msgSend(v28, "bounds");
      v30 = v29;
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
      objc_msgSend(v31, "verticalScrollIndicatorInsets");
      v33 = v32;

      v39.origin.x = v18;
      v39.origin.y = v20;
      v39.size.width = v22;
      v39.size.height = v24;
      MinY = CGRectGetMinY(v39);
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
      objc_msgSend(v35, "contentOffset");
      if (MinY >= v36)
      {
        v40.origin.x = v18;
        v40.origin.y = v20;
        v40.size.width = v22;
        v40.size.height = v24;
        v37 = CGRectGetMaxY(v40) <= v27 + v30 - v33;
      }
      else
      {
        v37 = 0;
      }

    }
    else
    {
      v37 = 0;
    }

  }
  else
  {
    v37 = 0;
  }

  return v37;
}

- (void)_openBook:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSMutableDictionary *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  BKLibraryBookshelfCollectionViewController *v22;
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController im_ancestorFlowControllerConformingToProtocol:](self, "im_ancestorFlowControllerConformingToProtocol:", &OBJC_PROTOCOL___BKBookPresenting));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "permanentOrTemporaryAssetID"));
  v12 = BKLibraryLog(v9, v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    sub_10069FA2C();

  v14 = objc_opt_new(NSMutableDictionary);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneControllerForViewController:](BKAppDelegate, "sceneControllerForViewController:", self));
  v16 = objc_msgSend(v15, "newShowAssetTransaction");

  if (v16)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v16, BCTransactionOptionsTransactionKey);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assetLogID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v17, AEAssetLogID);

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000D3168;
  v20[3] = &unk_1008EA180;
  v22 = self;
  v23 = v7;
  v21 = v6;
  v18 = v6;
  v19 = v7;
  objc_msgSend(v8, "showAssetWithTransaction:assetID:location:options:completion:", v16, v9, 0, v14, v20);

}

- (void)_playPreview:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "booksDataSource"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storeID"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000D3324;
  v12[3] = &unk_1008EA1A8;
  objc_copyWeak(&v14, &location);
  v11 = v7;
  v13 = v11;
  objc_msgSend(v9, "resourceForAssetID:type:completion:", v10, 1, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)_downloadSample:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  BKLibraryBookshelfCollectionViewController *v21;
  id v22;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController _contentDataForContentID:tracker:](self, "_contentDataForContentID:tracker:", v8, v9));

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000D359C;
  v19[3] = &unk_1008EA1F8;
  v20 = v10;
  v21 = self;
  v22 = v6;
  v11 = v6;
  v12 = v10;
  v13 = objc_retainBlock(v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[BSUIItemDescriptionCache sharedInstance](BSUIItemDescriptionCache, "sharedInstance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "storeID"));

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000D371C;
  v17[3] = &unk_1008EA220;
  v18 = v13;
  v16 = v13;
  objc_msgSend(v14, "sampleDownloadURLForAssetID:completion:", v15, v17);

}

- (int64_t)_contentTypeForContentID:(id)a3 withLibraryAsset:(id)a4
{
  if (a4)
    return (int64_t)+[BAUtilities contentTypeFromAssetType:](BAUtilities, "contentTypeFromAssetType:", (int)objc_msgSend(a4, "contentType", a3));
  else
    return 0;
}

- (id)_contentDataForContentID:(id)a3 tracker:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v25;
  int64_t v26;
  void *v27;
  void *v28;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController _libraryAssetWithContentID:](self, "_libraryAssetWithContentID:", v6));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentPrivateIDForContentID:", v6));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentUserIDForContentID:", v6));

  v26 = -[BKLibraryBookshelfCollectionViewController _contentTypeForContentID:withLibraryAsset:](self, "_contentTypeForContentID:withLibraryAsset:", v6, v8);
  v27 = (void *)v10;
  if (objc_msgSend(v8, "isOwned"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "storeID"));
    v12 = objc_msgSend(v11, "length");
    v13 = 1;
    if (!v12)
      v13 = 2;
    v25 = v13;

  }
  else
  {
    v25 = 0;
  }
  v28 = (void *)v9;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
  v15 = objc_msgSend(v14, "seriesTypeForContentID:", v6);

  if (objc_msgSend(v8, "isAudiobook"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hasRACSupport"));
    if (objc_msgSend(v16, "BOOLValue"))
      v17 = 1;
    else
      v17 = 2;

  }
  else
  {
    v17 = 0;
  }
  v18 = objc_alloc((Class)BAContentData);
  v19 = objc_msgSend(v8, "contentType");
  if (v19 == 3)
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v8, "pageCount")));
  else
    v20 = 0;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "supplementalContentAssets"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "count")));
  v23 = objc_msgSend(v18, "initWithContentID:contentType:contentPrivateID:contentUserID:contentAcquisitionType:contentSubType:contentLength:supplementalContentCount:seriesType:productionType:isUnified:contentKind:", v6, v26, v28, v27, v25, 0, v20, v22, v15, v17, 0, 0);

  if (v19 == 3)
  return v23;
}

- (id)_libraryAssetWithContentID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "libraryAssetProvider"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "libraryAssetOnMainQueueWithAssetID:", v3));
  return v6;
}

- (void)_openStoreSample:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "storeID"));
  v8 = BKLibraryLog(v5, v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_10069FB74();

  if (objc_msgSend(v5, "length"))
  {
    -[BKLibraryBookshelfCollectionViewController _downloadSample:completion:](self, "_downloadSample:completion:", v4, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController im_ancestorFlowControllerConformingToProtocol:](self, "im_ancestorFlowControllerConformingToProtocol:", &OBJC_PROTOCOL___BKBookPresenting));
    if ((objc_msgSend(v4, "isAudiobook") & 1) != 0
      || !+[BKSceneUtilities hasMultiWindowEnabled](BKSceneUtilities, "hasMultiWindowEnabled"))
    {
      v13 = (id)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneControllerForViewController:](BKAppDelegate, "sceneControllerForViewController:", self));
      v15 = objc_msgSend(v13, "newShowAssetTransaction");
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetID"));
      v13 = objc_msgSend(v11, "newBookSceneControllerProviderWithRequestAssetID:", v12);

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate currentSceneController](BKAppDelegate, "currentSceneController"));
      v15 = objc_msgSend(v14, "newShowAssetTransactionWithTargetSceneDescriptor:", v13);

    }
    if (v15)
    {
      v23 = BCTransactionOptionsTransactionKey;
      v24 = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
    }
    else
    {
      v16 = 0;
    }
    if (+[BKSceneUtilities hasMultiWindowEnabled](BKSceneUtilities, "hasMultiWindowEnabled")
      && (objc_msgSend(v4, "isAudiobook") & 1) == 0)
    {
      objc_msgSend(v10, "showAssetWithTransaction:storeID:options:", v15, v5, v16);
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager"));
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1000D3C84;
      v18[3] = &unk_1008E7B70;
      v19 = v10;
      v20 = v15;
      v21 = v5;
      v22 = v16;
      objc_msgSend(v17, "forceTransaction:ontoPrimarySceneWithContinuation:", v20, v18);

    }
  }

}

- (id)_transactionForStorePresentingAction
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sceneControllerForViewController:", self));

  v5 = objc_msgSend(v4, "newShowURLTransaction");
  return v5;
}

- (void)_showBooksInSectionAtIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  BKLibraryBookshelfCollectionViewController *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;

  v4 = a3;
  v7 = BKLibraryLog(v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_10069FBD8();

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "booksDataSource"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "representedObjectsInSection:", objc_msgSend(v4, "section")));

  v38 = v4;
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v4, "item")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "storeID"));

  if (!v12)
  {
    v16 = 0;
    v22 = &__NSArray0__struct;
    v23 = &__NSArray0__struct;
    goto LABEL_25;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (objc_msgSend(v11, "count"))
  {
    v15 = 0;
    v16 = -1;
    do
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v15));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "storeID"));
      if (objc_msgSend(v17, "isAudiobook"))
        v19 = 0;
      else
        v19 = 3;
      if (v18)
      {
        if (v17 == v39)
          v16 = (uint64_t)objc_msgSend(v13, "count");
        objc_msgSend(v13, "addObject:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v19));
        objc_msgSend(v14, "addObject:", v20);

      }
      ++v15;
    }
    while (v15 < (unint64_t)objc_msgSend(v11, "count"));
    if ((unint64_t)objc_msgSend(v13, "count") > 0x64)
    {
      v21 = v16 - 49;
      if (v16 >= 49)
      {
        if (v16 + 51 > (unint64_t)objc_msgSend(v13, "count"))
          v21 = (uint64_t)objc_msgSend(v13, "count") - 100;
      }
      else
      {
        v21 = 0;
      }
      goto LABEL_23;
    }
  }
  else
  {
    v16 = -1;
    if ((unint64_t)objc_msgSend(v13, "count") > 0x64)
    {
      v21 = 0;
LABEL_23:
      v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "subarrayWithRange:", v21, 100));
      v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "subarrayWithRange:", v21, 100));
      v16 -= v21;
      goto LABEL_24;
    }
  }
  v23 = v13;
  v22 = v14;
LABEL_24:

LABEL_25:
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
  v37 = v23;
  v36 = v22;
  if (-[BKLibraryBookshelfCollectionViewController isSeriesCollection](self, "isSeriesCollection"))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "supplementaryDataSource"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "seriesID"));

  }
  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collection](self, "collection"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "collectionID"));
  }

  v28 = objc_alloc((Class)BALinkData);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController navigationItem](self, "navigationItem"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "title"));
  v31 = self;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "storeID"));
  v33 = objc_msgSend(v28, "initWithPreviousSectionID:previousSectionName:previousContentID:linkActionType:previousSeriesID:previousGenreID:previousCollectionID:previousAuthorID:previousFlowcaseID:previousBrickID:", v27, v30, v32, 2, 0, 0, 0, 0, 0, 0);

  objc_msgSend(v24, "pushLinkData:file:line:", v33, CFSTR("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AppSource/Classes/BKLibraryBookshelfCollectionViewController.m"), 1299);
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController im_ancestorFlowControllerConformingToProtocol:](v31, "im_ancestorFlowControllerConformingToProtocol:", &OBJC_PROTOCOL___BKStorePresenting));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController _transactionForStorePresentingAction](v31, "_transactionForStorePresentingAction"));
  objc_msgSend(v34, "storeShowBooksWithStoreIDs:resourceTypes:focusedIndex:transaction:needsAnalyticsLinkData:", v37, v36, v16, v35, 0);

}

- (BOOL)_isErrorFromUserCanceled:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  BOOL v30;
  uint64_t v31;
  int v33;
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;

  v3 = a3;
  v6 = v3;
  if (v3)
  {
    v7 = AKAppleIDAuthenticationErrorDomain;
    v8 = AMSErrorDomain;
    v9 = AMSErrorUserInfoKeyStatusCode;
    v10 = v3;
    while (1)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "domain"));
      if (objc_msgSend(v11, "isEqualToString:", v7))
      {
        v12 = objc_msgSend(v10, "code");

        if (v12 == (id)-7003)
          goto LABEL_15;
      }
      else
      {

      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "domain"));
      v14 = objc_msgSend(v13, "isEqualToString:", v8);

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userInfo"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v9));

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userInfo"));
      v18 = v17;
      if (v14)
      {
        if (v16)
          break;
      }
      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

      v10 = (void *)v19;
      if (!v19)
        goto LABEL_18;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v9));
    v21 = objc_msgSend(v20, "intValue");

    v25 = BKLibraryLog(v22, v23, v24);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      sub_10069FC3C(v21, v21 < 500, v26);

    if (v21 < 500)
    {
LABEL_15:
      v27 = BKLibraryLog(v3, v4, v5);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
        v33 = 138543874;
        v34 = v29;
        v35 = 2048;
        v36 = objc_msgSend(v6, "code");
        v37 = 2112;
        v38 = v6;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Treating error as being caused by user cancel: Error Domain=%{public}@ Code=%ld (%@)", (uint8_t *)&v33, 0x20u);

      }
      v30 = 1;
      goto LABEL_21;
    }
  }
  else
  {
    v10 = 0;
  }
LABEL_18:
  v31 = BKLibraryLog(v3, v4, v5);
  v28 = objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v33 = 138412290;
    v34 = v6;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "NOT treating error as being caused by user cancel: %@", (uint8_t *)&v33, 0xCu);
  }
  v30 = 0;
LABEL_21:

  return v30;
}

- (void)openItemAtIndexPath:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  unsigned int v17;
  unsigned int v18;
  id v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  _BOOL4 v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  NSObject *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  void (**v62)(_QWORD);
  void *v63;
  void *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  void *v71;
  uint64_t v72;
  int v73;
  int v74;
  unsigned int v75;
  id v76;
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  int v80;
  __int16 v81;
  unsigned int v82;
  __int16 v83;
  unsigned int v84;
  __int16 v85;
  unsigned int v86;
  __int16 v87;
  int v88;
  __int16 v89;
  unsigned int v90;
  __int16 v91;
  int v92;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
  objc_msgSend(v8, "postEvent:sender:", kBETestDriverOpenAnimationStart, self);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
  objc_msgSend(v9, "postEvent:sender:", kBETestDriverOpenAnimationSetupStart, self);

  kdebug_trace(725353092, 0, 0, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "booksDataSource"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "representedObjectForIndexPath:", v6));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
  LODWORD(v72) = objc_msgSend(v13, "isItemPlayingAtIndexPath:", v6);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[BURestrictionsProvider sharedInstance](BURestrictionsProvider, "sharedInstance"));
  v15 = objc_msgSend(v14, "isBookStoreAllowed");

  v75 = +[BKReachability isOffline](BKReachability, "isOffline");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionID](self, "collectionID"));
  v17 = objc_msgSend(v16, "isEqualToString:", kBKCollectionDefaultIDWantToRead);

  HIDWORD(v72) = objc_msgSend(v12, "isInSamples");
  v18 = objc_msgSend(v12, "isContainer");
  v19 = -[BKLibraryBookshelfCollectionViewController isEditing](self, "isEditing");
  v20 = (int)v19;
  v23 = BKLibraryLog(v19, v21, v22);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = v6;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "assetID"));
    *(_DWORD *)buf = 138414082;
    v78 = v26;
    v79 = 1024;
    v80 = v72;
    v81 = 1024;
    v82 = v15;
    v83 = 1024;
    v84 = v75;
    v85 = 1024;
    v86 = v17;
    v87 = 1024;
    v88 = HIDWORD(v72);
    v89 = 1024;
    v90 = v18;
    v91 = 1024;
    v92 = v20;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[Open] Attempting to open book %@: bookIsPlaying: %{BOOL}d, isStoreAllowed: %{BOOL}d, isOffline: %{BOOL}d, inWantToReadCollection: %{BOOL}d, isInSamples: %{BOOL}d, isContainer: %{BOOL}d, isEditing: %{BOOL}d", buf, 0x36u);

    v6 = v25;
  }

  if (!v18)
  {
    if ((v15 & 1) == 0 && objc_msgSend(v12, "isStoreOrSeriesItem"))
    {
      v31 = objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController im_ancestorFlowControllerConformingToProtocol:](self, "im_ancestorFlowControllerConformingToProtocol:", &OBJC_PROTOCOL___BKStorePresenting));
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController _transactionForStorePresentingAction](self, "_transactionForStorePresentingAction"));
      v36 = BKLibraryLog(v33, v34, v35);
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        sub_10069FE44();

      -[NSObject displayBookUnavailableInStorefrontErrorWithTransaction:](v31, "displayBookUnavailableInStorefrontErrorWithTransaction:", v33);
      goto LABEL_46;
    }
    if (((objc_msgSend(v12, "isSeriesItem", v72) & 1) != 0
       || (objc_msgSend(v12, "isPreorderBook") & 1) != 0
       || objc_msgSend(v12, "isStoreItem"))
      && (objc_msgSend(v12, "isSample") & 1) == 0
      && (v38 = objc_msgSend(v12, "isAudiobookPreview"), (v38 & 1) == 0))
    {
      v54 = BKLibraryLog(v38, v39, v40);
      v55 = objc_claimAutoreleasedReturnValue(v54);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
        sub_10069FE18();

      if ((v20 & 1) != 0)
      {
        v59 = BKLibraryLog(v56, v57, v58);
        v31 = objc_claimAutoreleasedReturnValue(v59);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          sub_10069FD6C();
        goto LABEL_46;
      }
      if (((v75 | v74 ^ 1 | v17) & 1) == 0)
      {
        -[BKLibraryBookshelfCollectionViewController _openStoreSample:](self, "_openStoreSample:", v12);
        goto LABEL_47;
      }
      if ((-[BKLibraryBookshelfCollectionViewController isSeriesCollection](self, "isSeriesCollection") | v17) != 1)
      {
        v63 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController im_ancestorFlowControllerConformingToProtocol:](self, "im_ancestorFlowControllerConformingToProtocol:", &OBJC_PROTOCOL___BKStorePresenting));
        v64 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController _transactionForStorePresentingAction](self, "_transactionForStorePresentingAction"));
        v65 = objc_msgSend(v12, "isAudiobook");
        if ((_DWORD)v65)
          v68 = 0;
        else
          v68 = 3;
        v69 = BKLibraryLog(v65, v66, v67);
        v70 = objc_claimAutoreleasedReturnValue(v69);
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
          sub_10069FD98(v12, v70);

        v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "storeID"));
        objc_msgSend(v63, "storeShowBookWithStoreID:resourceType:transaction:", v71, v68, v64);

        goto LABEL_47;
      }
    }
    else
    {
      v41 = objc_msgSend(v12, "isDownloading");
      if ((_DWORD)v41)
      {
        v41 = objc_msgSend(v12, "streamable");
        if ((v41 & 1) == 0)
        {
          v60 = BKLibraryLog(v41, v42, v43);
          v61 = objc_claimAutoreleasedReturnValue(v60);
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
            sub_10069FD40();

          v31 = objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
          -[NSObject toggleDownloadPausedForAsset:](v31, "toggleDownloadPausedForAsset:", v12);
          goto LABEL_46;
        }
      }
      if (v20)
      {
        v44 = BKLibraryLog(v41, v42, v43);
        v31 = objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          sub_10069FD14();
        goto LABEL_46;
      }
      if (((v75 | v74 ^ 1) & 1) != 0
        || ((v17 ^ 1) & 1) != 0
        || (objc_msgSend(v12, "isStoreOrSeriesItem") & 1) == 0
        && !objc_msgSend(v12, "isSample"))
      {
        if ((objc_msgSend(v12, "isLocal") & 1) != 0
          || (objc_msgSend(v12, "isSupplementalContent") ^ 1 | v75) != 1
          || (objc_msgSend(v12, "isSample") & 1) != 0
          || (objc_msgSend(v12, "isAudiobookPreview") & 1) != 0
          || (objc_msgSend(v12, "streamable") & (v75 ^ 1) | v73) == 1)
        {
          if (objc_msgSend(v12, "isSupplementalContent"))
          {
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "supplementalContentParent"));
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "storeID"));

            v47 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
            v76 = v7;
            v48 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
            v49 = v6;
            v50 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "supplementaryDataSource"));
            v52 = objc_msgSend(v51, "fromActionMenu");
            v53 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController _supplementalContentCount](self, "_supplementalContentCount"));
            objc_msgSend(v47, "emitViewSupplementalContentWithTracker:contentID:sourceIsAction:supplementalContentCount:", v48, v46, v52, v53);

            v6 = v49;
            v7 = v76;

          }
          if (objc_msgSend(v12, "isAudiobookPreview"))
            -[BKLibraryBookshelfCollectionViewController _playPreview:completion:](self, "_playPreview:completion:", v12, 0);
          else
            -[BKLibraryBookshelfCollectionViewController _openBook:completion:](self, "_openBook:completion:", v12, 0);
        }
        else if (v75)
        {
          -[BKLibraryBookshelfCollectionViewController _showInternetReachabilityErrorAlert:](self, "_showInternetReachabilityErrorAlert:", v12);
        }
        else
        {
          -[BKLibraryBookshelfCollectionViewController _downloadBook:](self, "_downloadBook:", v12);
        }
        goto LABEL_47;
      }
    }
    -[BKLibraryBookshelfCollectionViewController _showBooksInSectionAtIndexPath:](self, "_showBooksInSectionAtIndexPath:", v6);
    goto LABEL_47;
  }
  v30 = BKLibraryLog(v27, v28, v29);
  v31 = objc_claimAutoreleasedReturnValue(v30);
  v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG);
  if (v20)
  {
    if (v32)
      sub_10069FCBC();
LABEL_46:

    goto LABEL_47;
  }
  if (v32)
    sub_10069FCE8();

  -[BKLibraryBookshelfCollectionViewController openSeriesContainer:](self, "openSeriesContainer:", v12);
LABEL_47:
  v62 = (void (**)(_QWORD))objc_retainBlock(v7);

  if (v62)
    v62[2](v62);

}

- (void)_downloadBook:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  v7 = BKLibraryLog(v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_10069FE70(v4, v8);

  if (objc_msgSend(v4, "isCloud"))
  {
    v9 = objc_opt_class(BKAppDelegate);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "delegate"));
    v12 = BUDynamicCast(v9, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    if (objc_msgSend(v13, "isConnectedToInternet"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000D4C28;
      v15[3] = &unk_1008EA248;
      v15[4] = self;
      v16 = v4;
      objc_msgSend(v14, "resolveLibraryAsset:completion:", v16, v15);

    }
    else
    {
      -[BKLibraryBookshelfCollectionViewController _showInternetReachabilityErrorAlert:](self, "_showInternetReachabilityErrorAlert:", v4);
    }

  }
}

- (void)_showInternetReachabilityErrorAlert:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController im_ancestorFlowControllerConformingToProtocol:](self, "im_ancestorFlowControllerConformingToProtocol:", &OBJC_PROTOCOL___BKStorePresenting));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController _transactionForStorePresentingAction](self, "_transactionForStorePresentingAction"));
  v9 = BKLibraryLog(v6, v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_10069FF1C(v4, v10);

  objc_msgSend(v5, "displayOffineCannotDownloadErrorForContentType:transaction:", objc_msgSend(v4, "contentType"), v6);
}

- (void)cancelDownloadBook:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryAssetStatusController sharedController](BKLibraryAssetStatusController, "sharedController"));
  if (objc_msgSend(v7, "isValid") && objc_msgSend(v7, "state") == 2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "statusForAssetID:", v4));

    if (objc_msgSend(v5, "canPause"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetID"));
      objc_msgSend(v3, "cancelDownloadOfAsset:", v6);

    }
  }

}

- (void)resumeDownloadBook:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryAssetStatusController sharedController](BKLibraryAssetStatusController, "sharedController"));
  if (objc_msgSend(v7, "isValid") && objc_msgSend(v7, "state") == 2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "statusForAssetID:", v4));

    if (objc_msgSend(v5, "canResume"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetID"));
      objc_msgSend(v3, "resumeDownloadOfAsset:", v6);

    }
  }

}

- (NSArray)selectedBooks
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathsForSelectedItems"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController booksAtIndexPaths:](self, "booksAtIndexPaths:", v4));
  return (NSArray *)v5;
}

- (id)booksAtIndexPaths:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor", (_QWORD)v16));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "booksDataSource"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "representedObjectForIndexPath:", v11));

        objc_msgSend(v5, "addObject:", v14);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)_addSelectedBooksToReadingList:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSMutableArray *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  BKLibraryBookshelfCollectionViewController *v22;
  id v23;
  id v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  _BYTE v31[128];

  v6 = a3;
  v7 = a4;
  v8 = v6;
  if (objc_msgSend(v8, "count"))
  {
    -[BKLibraryBookshelfCollectionViewController setAddSelectedBooksCompletion:](self, "setAddSelectedBooksCompletion:", v7);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000D54A8;
    v30[3] = &unk_1008E72C0;
    v30[4] = self;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController im_ancestorFlowControllerConformingToProtocol:](self, "im_ancestorFlowControllerConformingToProtocol:", &OBJC_PROTOCOL___BSUILibraryCollectionUIProvider));
    objc_msgSend(v25, "setSuccessfulAddFinishedBlock:", v30);
    v9 = objc_opt_new(NSMutableArray);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 512));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v11 = v8;
    v12 = (uint64_t)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v12)
    {
      v22 = self;
      v23 = v8;
      v24 = v7;
      v13 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", objc_msgSend(v15, "contentType", v22, v23, v24)));
          -[NSMutableArray addObject:](v9, "addObject:", v16);

          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "storeID"));
          v18 = objc_msgSend(v17, "length");

          if (v18)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "assetID"));
            objc_msgSend(v10, "addObject:", v19);

          }
          if ((objc_msgSend(v15, "isContainer") & 1) != 0)
          {
            v12 = 1;
            goto LABEL_14;
          }
        }
        v12 = (uint64_t)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        if (v12)
          continue;
        break;
      }
LABEL_14:
      v8 = v23;
      v7 = v24;
      self = v22;
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForKey:", CFSTR("assetID")));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "libraryCollectionListViewControllerWithAssetIDs:knownAssetTypes:knownStoreAssetIDs:containsSeriesContainer:showDivider:", v20, v9, v10, v12, 0));

    -[BKLibraryBookshelfCollectionViewController _showOverlayViewController:](self, "_showOverlayViewController:", v21);
  }

}

- (void)_showOverlayViewController:(id)a3
{
  id v4;
  void ***v5;
  void *v6;
  void *v7;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  BKLibraryBookshelfCollectionViewController *v13;

  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_1000D55CC;
  v11 = &unk_1008E7338;
  v12 = a3;
  v13 = self;
  v4 = v12;
  v5 = objc_retainBlock(&v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController bc_descendentPresentedViewController](self, "bc_descendentPresentedViewController", v8, v9, v10, v11));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController bc_descendentPresentedViewController](self, "bc_descendentPresentedViewController"));
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v5);

  }
  else
  {
    ((void (*)(void ***))v5[2])(v5);
  }

}

- (void)_dismissOverlayViewController:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController presentedViewController](self, "presentedViewController", a3));
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)updateActionBarForSelection
{
  void *v3;
  _BOOL8 v4;
  _BOOL8 v5;
  void *v6;
  id v7;

  -[BKLibraryBookshelfCollectionViewController updateSelectAllBarButton](self, "updateSelectAllBarButton");
  v7 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController actionBarViewController](self, "actionBarViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController selectedBooks](self, "selectedBooks"));
  v4 = -[BKLibraryBookshelfCollectionViewController hasAnyDeletableBookSelected](self, "hasAnyDeletableBookSelected");
  v5 = -[BKLibraryBookshelfCollectionViewController hasAnySeriesContainerSelected](self, "hasAnySeriesContainerSelected");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collection](self, "collection"));
  objc_msgSend(v7, "updateForSelectedItems:deletableItems:seriesItems:editable:", v3, v4, v5, objc_msgSend(v6, "isDefaultCollection") ^ 1);

}

- (void)updateActionBarFromMetrics
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController actionBarViewController](self, "actionBarViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController layout](self, "layout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actionBarMetrics"));
  objc_msgSend(v5, "updateActionBarFromMetrics:", v4);

}

- (void)updateTitleFromMetrics
{
  void *v3;
  BKLibraryBookshelfCollectionViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController navigationController](self, "navigationController"));
  v4 = (BKLibraryBookshelfCollectionViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topViewController"));

  if (v4 == self)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController navigationController](self, "navigationController"));
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "navigationBar"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController layout](self, "layout"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "columnMetrics"));

    objc_msgSend(v7, "margins");
    v9 = v8;
    objc_msgSend(v7, "margins");
    objc_msgSend(v11, "setDirectionalLayoutMargins:", 0.0, v9, 0.0, v10);

  }
}

- (void)updateTabBarControllerForEditing:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController tabBarController](self, "tabBarController"));
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "hideBarWithTransition:", 6);
  else
    objc_msgSend(v5, "showBarWithTransition:", 6);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController _collectionBackingButton](self, "_collectionBackingButton"));
  objc_msgSend(v7, "setEnabled:", !v3);

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  int v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  void *v42;
  void *v43;
  _QWORD *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  _QWORD v61[4];
  id v62;
  BOOL v63;
  id location;
  _QWORD v65[5];
  BOOL v66;
  _QWORD v67[4];
  id v68;
  _QWORD v69[5];
  BOOL v70;
  objc_super v71;
  CGRect v72;

  v4 = a4;
  v5 = a3;
  if (-[BKLibraryBookshelfCollectionViewController isEditing](self, "isEditing") != a3)
  {
    v71.receiver = self;
    v71.super_class = (Class)BKLibraryBookshelfCollectionViewController;
    -[BKLibraryBookshelfCollectionViewController setEditing:animated:](&v71, "setEditing:animated:", v5, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController bk_rootBarCoordinator](self, "bk_rootBarCoordinator"));
    objc_msgSend(v7, "setIsMiniPlayerHidden:", v5);

    if (v5)
    {
      -[BKLibraryBookshelfCollectionViewController updateActionBarFromMetrics](self, "updateActionBarFromMetrics");
      if ((_os_feature_enabled_impl("UIKit", "uip_floating_tab_bar") & 1) != 0)
        v8 = 1;
      else
        v8 = _os_feature_enabled_impl("UIKit", "uip_floating_tab_bar_only");
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController viewIfLoaded](self, "viewIfLoaded"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "traitCollection"));
      v13 = objc_msgSend(v12, "horizontalSizeClass");

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController viewIfLoaded](self, "viewIfLoaded"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "traitCollection"));
      v16 = objc_msgSend(v15, "userInterfaceIdiom");

      v17 = objc_alloc_init((Class)UITabBar);
      objc_msgSend(v17, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
      v19 = v18;

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController wrapperView](self, "wrapperView"));
      objc_msgSend(v20, "safeAreaInsets");
      v22 = v21;

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController bk_rootBarCoordinator](self, "bk_rootBarCoordinator"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "miniPlayerViewController"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "view"));
      objc_msgSend(v25, "bounds");
      v27 = v26;

      v28 = v19 + v27;
      if (!v8 || v13 == (id)1)
      {
        if (v22 >= v28)
        {
          v22 = v22 - v28;
          v30 = v27 > 0.0 ? v8 : 0;
          if (v30 == 1)
          {
            v31 = 15.0;
            if (!v16)
              v31 = 25.0;
            v22 = v22 - v31;
          }
        }
      }
      else
      {
        v29 = vabdd_f64(v22, v28);
        if (v27 > 0.0)
          v22 = v29;
      }
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController wrapperView](self, "wrapperView"));
      objc_msgSend(v32, "bounds");
      v34 = v33;
      v36 = v35;
      v38 = v37;
      v40 = v39;

      v72.origin.x = v34;
      v72.origin.y = v36;
      v72.size.width = v38;
      v72.size.height = v40;
      v41 = CGRectGetMaxY(v72) - v19 - v22;
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController actionBarViewController](self, "actionBarViewController"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "view"));
      objc_msgSend(v43, "setFrame:", v34, v41, v38, v19);

      sub_1000D5958(self);
      -[BKLibraryBookshelfCollectionViewController updateSelectAllBarButton](self, "updateSelectAllBarButton");
      -[BKLibraryBookshelfCollectionViewController updateBarButtonsAnimated:](self, "updateBarButtonsAnimated:", v4);
      -[BKLibraryBookshelfCollectionViewController updateActionBarForSelection](self, "updateActionBarForSelection");
    }
    else
    {
      sub_1000D5958(self);
      -[BKLibraryBookshelfCollectionViewController updateSelectAllBarButton](self, "updateSelectAllBarButton");
      -[BKLibraryBookshelfCollectionViewController updateBarButtonsAnimated:](self, "updateBarButtonsAnimated:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController view](self, "view"));
      objc_msgSend(v9, "endEditing:", 1);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
      objc_msgSend(v10, "layoutIfNeeded");

      -[BKLibraryBookshelfCollectionViewController deselectAll](self, "deselectAll");
    }
    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472;
    v69[2] = sub_1000D604C;
    v69[3] = &unk_1008E83C0;
    v69[4] = self;
    v70 = v5;
    v44 = objc_retainBlock(v69);
    v45 = v44;
    if (v4)
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController actionBarViewController](self, "actionBarViewController"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "view"));
      objc_msgSend(v47, "setHidden:", 0);

      v67[0] = _NSConcreteStackBlock;
      v67[1] = 3221225472;
      v67[2] = sub_1000D60B8;
      v67[3] = &unk_1008E7818;
      v68 = v45;
      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472;
      v65[2] = sub_1000D60C4;
      v65[3] = &unk_1008E9C48;
      v65[4] = self;
      v66 = v5;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v67, v65, 0.3);
      v48 = v68;
    }
    else
    {
      ((void (*)(_QWORD *))v44[2])(v44);
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController actionBarViewController](self, "actionBarViewController"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "view"));
      objc_msgSend(v49, "setHidden:", v5 ^ 1);

    }
    -[BKLibraryBookshelfCollectionViewController setTransitioningToNewLayout:](self, "setTransitioningToNewLayout:", 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
    objc_msgSend(v50, "contentOffset");
    -[BKLibraryBookshelfCollectionViewController setPreviousContentOffset:](self, "setPreviousContentOffset:");

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController layout](self, "layout"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "cellMetrics"));
    if (objc_msgSend(v52, "cellType") == 3)
    {
      -[BKLibraryBookshelfCollectionViewController setPreserveContentOffsetInNewLayout:](self, "setPreserveContentOffsetInNewLayout:", 0);
    }
    else
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController layout](self, "layout"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "cellMetrics"));
      if (objc_msgSend(v54, "cellType") == 4)
      {
        -[BKLibraryBookshelfCollectionViewController setPreserveContentOffsetInNewLayout:](self, "setPreserveContentOffsetInNewLayout:", 0);
      }
      else
      {
        v55 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController layout](self, "layout"));
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "cellMetrics"));
        -[BKLibraryBookshelfCollectionViewController setPreserveContentOffsetInNewLayout:](self, "setPreserveContentOffsetInNewLayout:", objc_msgSend(v56, "cellType") != 0);

      }
    }

    v57 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController layout](self, "layout"));
    v58 = objc_msgSend(v57, "copy");

    objc_msgSend(v58, "setEditMode:", v5);
    -[BKLibraryBookshelfCollectionViewController setLayout:](self, "setLayout:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController layout](self, "layout"));
    objc_msgSend(v59, "updateMetricsWithViewController:", self);

    objc_initWeak(&location, self);
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_1000D611C;
    v61[3] = &unk_1008EA270;
    objc_copyWeak(&v62, &location);
    v63 = v5;
    objc_msgSend(v60, "setCollectionViewLayout:animated:completion:", v58, v4, v61);

    objc_destroyWeak(&v62);
    objc_destroyWeak(&location);

  }
}

- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  if (-[BKLibraryBookshelfCollectionViewController transitioningToNewLayout](self, "transitioningToNewLayout", a3))
  {
    if (-[BKLibraryBookshelfCollectionViewController preserveContentOffsetInNewLayout](self, "preserveContentOffsetInNewLayout")|| (-[BKLibraryBookshelfCollectionViewController previousContentOffset](self, "previousContentOffset"), v7 < 0.0))
    {
      -[BKLibraryBookshelfCollectionViewController previousContentOffset](self, "previousContentOffset");
      x = v8;
      y = v9;
    }
  }
  v10 = x;
  v11 = y;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)selectAll
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
  if ((uint64_t)objc_msgSend(v6, "numberOfSections") >= 1)
  {
    v3 = 0;
    do
    {
      if ((uint64_t)objc_msgSend(v6, "numberOfItemsInSection:", v3) >= 1)
      {
        v4 = 0;
        do
        {
          v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", v4, v3));
          objc_msgSend(v6, "selectItemAtIndexPath:animated:scrollPosition:", v5, 0, 0);

          ++v4;
        }
        while (v4 < (uint64_t)objc_msgSend(v6, "numberOfItemsInSection:", v3));
      }
      ++v3;
    }
    while (v3 < (uint64_t)objc_msgSend(v6, "numberOfSections"));
  }
  -[BKLibraryBookshelfCollectionViewController updateActionBarForSelection](self, "updateActionBarForSelection");

}

- (void)deselectAll
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v3, "selectItemAtIndexPath:animated:scrollPosition:", 0, 1, 0);

  -[BKLibraryBookshelfCollectionViewController updateActionBarForSelection](self, "updateActionBarForSelection");
}

- (void)dismissPDFPicker
{
  if (-[BKLibraryBookshelfCollectionViewController isSupplementalContentPDFPicker](self, "isSupplementalContentPDFPicker"))
  {
    -[BKLibraryBookshelfCollectionViewController cancelButtonPressed:](self, "cancelButtonPressed:", 0);
  }
}

- (void)openSelectedBooks
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathsForSelectedItems"));

  v4 = v5;
  if (v5)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000D6498;
    v6[3] = &unk_1008EA298;
    v6[4] = self;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);
    v4 = v5;
  }

}

- (void)toggleAccessibilityIfNeeded
{
  NSMutableArray *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMutableArray *v10;
  void *v11;
  id v12;
  _QWORD block[4];
  NSMutableArray *v14;

  if (UIAccessibilityIsVoiceOverRunning()
    && -[BKLibraryBookshelfCollectionViewController isEditing](self, "isEditing"))
  {
    v3 = objc_opt_new(NSMutableArray);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPathsForSelectedItems"));
    v6 = objc_msgSend(v5, "count");

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("%lu selected books"), &stru_10091C438, 0));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, v6));
    -[NSMutableArray addObject:](v3, "addObject:", v8);

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D6664;
    block[3] = &unk_1008E72C0;
    v14 = v3;
    v9 = qword_1009F4EF8;
    v10 = v3;
    if (v9 != -1)
      dispatch_once(&qword_1009F4EF8, block);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v10, "componentsJoinedByString:", CFSTR(", ")));
    UIAccessibilitySpeakAndDoNotBeInterrupted();

  }
}

- (void)bookTapped:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  int v17;

  v6 = a3;
  v7 = a4;
  v8 = -[BKLibraryBookshelfCollectionViewController isEditing](self, "isEditing");
  v9 = (int)v8;
  v12 = BKLibraryLog(v8, v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412546;
    v15 = v6;
    v16 = 1024;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[Open] Processing book tapped at index: %@,  isEditing: %{BOOL}d", (uint8_t *)&v14, 0x12u);
  }

  if ((v9 & 1) == 0)
  {
    -[BKLibraryBookshelfCollectionViewController _dismissIfSupplementContentPDFPicker](self, "_dismissIfSupplementContentPDFPicker");
    -[BKLibraryBookshelfCollectionViewController openItemAtIndexPath:completion:](self, "openItemAtIndexPath:completion:", v6, v7);
  }

}

- (void)_dismissIfSupplementContentPDFPicker
{
  if (-[BKLibraryBookshelfCollectionViewController isSupplementalContentPDFPicker](self, "isSupplementalContentPDFPicker"))
  {
    -[BKLibraryBookshelfCollectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (void)directBuyTapped:(id)a3 buyParameters:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "booksDataSource"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "representedObjectForIndexPath:", v10));

  v14 = objc_msgSend(v13, "isAudiobook");
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000D6920;
  v16[3] = &unk_1008EA2C0;
  v17 = v8;
  v15 = v8;
  +[BKBookPurchaseAction tryToPurchaseBook:libraryAssetProvider:buyParameters:allowPurchaseFromNonSampleBuyButton:suppressNetworkEvaluatorDialogs:analyticsInfo:completion:](BKBookPurchaseAction, "tryToPurchaseBook:libraryAssetProvider:buyParameters:allowPurchaseFromNonSampleBuyButton:suppressNetworkEvaluatorDialogs:analyticsInfo:completion:", v13, 0, v9, 1, v14, 0, v16);

}

- (void)showReadingListsForActionHandler:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController im_ancestorFlowControllerConformingToProtocol:](self, "im_ancestorFlowControllerConformingToProtocol:", &OBJC_PROTOCOL___BSUILibraryCollectionUIProvider));
  v4 = objc_opt_class(BKLibraryCollectionsListViewController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "libraryCollectionListViewControllerWithAssetIDs:knownAssetTypes:knownStoreAssetIDs:containsSeriesContainer:showDivider:", 0, 0, 0, 0, 0));
  v6 = BUDynamicCast(v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  objc_msgSend(v7, "bsui_setPrefersExtraCompactNavBarMargin:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController navigationController](self, "navigationController"));
  objc_msgSend(v8, "pushViewController:animated:", v7, 1);

}

- (void)presentReadingListsPopoverFromItem:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController im_ancestorFlowControllerConformingToProtocol:](self, "im_ancestorFlowControllerConformingToProtocol:", &OBJC_PROTOCOL___BSUILibraryCollectionUIProvider));
  if ((_os_feature_enabled_impl("UIKit", "uip_floating_tab_bar") & 1) != 0)
    v5 = 1;
  else
    v5 = _os_feature_enabled_impl("UIKit", "uip_floating_tab_bar_only");
  v6 = objc_opt_class(BKLibraryCollectionsListViewController);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "libraryCollectionListViewControllerWithAssetIDs:knownAssetTypes:knownStoreAssetIDs:containsSeriesContainer:showDivider:", 0, 0, 0, 0, v5));
  v8 = BUDynamicCast(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  objc_msgSend(v9, "setSupressLargeTitle:", 1);
  -[BKLibraryBookshelfCollectionViewController _showPopoverViewController:fromItem:](self, "_showPopoverViewController:fromItem:", v9, v4);

}

- (void)dismissReadingListPopover
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController presentedReadingListPopover](self, "presentedReadingListPopover"));
  objc_msgSend(v2, "im_dismissAnimated:", 0);

}

- (void)_showPopoverViewController:(id)a3 fromItem:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  BKLibraryBookshelfCollectionViewController *v13;
  id v14;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000D6C48;
  v11[3] = &unk_1008E7928;
  v12 = a3;
  v13 = self;
  v14 = a4;
  v6 = v14;
  v7 = v12;
  v8 = objc_retainBlock(v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController bc_descendentPresentedViewController](self, "bc_descendentPresentedViewController"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController bc_descendentPresentedViewController](self, "bc_descendentPresentedViewController"));
    objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 1, v8);

  }
  else
  {
    ((void (*)(_QWORD *))v8[2])(v8);
  }

}

- (BOOL)collectionView:(id)a3 selectionFollowsFocusForItemAtIndexPath:(id)a4
{
  return -[BKLibraryBookshelfCollectionViewController isEditing](self, "isEditing", a3, a4) ^ 1;
}

- (BOOL)canSelectItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  unsigned __int8 v12;
  BOOL v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "booksDataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "representedObjectForIndexPath:", v4));

  v8 = objc_opt_class(BKLibraryAsset);
  v9 = BUDynamicCast(v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = objc_msgSend(v10, "state");
  if (-[BKLibraryBookshelfCollectionViewController isEditing](self, "isEditing"))
  {
    v12 = -[BKLibraryBookshelfCollectionViewController isEditing](self, "isEditing");
    if (v11 == 2)
      v13 = 0;
    else
      v13 = v12;
  }
  else
  {
    v13 = 1;
  }

  return v13;
}

- (BOOL)shouldAllowCellSelection
{
  int v2;

  v2 = _AXSFullKeyboardAccessEnabled(self, a2);
  if (v2)
    LOBYTE(v2) = GSEventIsHardwareKeyboardAttached() != 0;
  return v2;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return -[BKLibraryBookshelfCollectionViewController canSelectItemAtIndexPath:](self, "canSelectItemAtIndexPath:", a4);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  if (-[BKLibraryBookshelfCollectionViewController isEditing](self, "isEditing", a3, a4))
  {
    -[BKLibraryBookshelfCollectionViewController toggleAccessibilityIfNeeded](self, "toggleAccessibilityIfNeeded");
    -[BKLibraryBookshelfCollectionViewController updateActionBarForSelection](self, "updateActionBarForSelection");
  }
}

- (BOOL)collectionView:(id)a3 canPerformPrimaryActionForItemAtIndexPath:(id)a4
{
  return -[BKLibraryBookshelfCollectionViewController isEditing](self, "isEditing", a3, a4) ^ 1;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = a4;
  v6 = a3;
  v7 = objc_opt_class(BKLibraryBookshelfCollectionViewCell);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForItemAtIndexPath:", v5));
  v9 = BUDynamicCast(v7, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue(v9);

  objc_msgSend(v10, "handleTapIfPossible");
  objc_msgSend(v6, "deselectItemAtIndexPath:animated:", v5, 1);

}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  if (-[BKLibraryBookshelfCollectionViewController isEditing](self, "isEditing", a3, a4))
  {
    -[BKLibraryBookshelfCollectionViewController toggleAccessibilityIfNeeded](self, "toggleAccessibilityIfNeeded");
    -[BKLibraryBookshelfCollectionViewController updateActionBarForSelection](self, "updateActionBarForSelection");
  }
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
  objc_msgSend(v11, "collectionView:willDisplayCell:forItemAtIndexPath:", v10, v9, v8);

}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
  objc_msgSend(v14, "collectionView:willDisplaySupplementaryView:forElementKind:atIndexPath:", v13, v12, v11, v10);

}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
  objc_msgSend(v11, "collectionView:didEndDisplayingCell:forItemAtIndexPath:", v10, v9, v8);

}

- (void)collectionView:(id)a3 didEndDisplayingSupplementaryView:(id)a4 forElementOfKind:(id)a5 atIndexPath:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
  objc_msgSend(v14, "collectionView:didEndDisplayingSupplementaryView:forElementOfKind:atIndexPath:", v13, v12, v11, v10);

}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  NSDate *v6;
  NSDate *contextMenuAppearDate;

  v6 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date", a3, a4, a5));
  contextMenuAppearDate = self->_contextMenuAppearDate;
  self->_contextMenuAppearDate = v6;

}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSDate *contextMenuAppearDate;
  void *v21;
  void *v22;
  NSDate *v23;
  uint64_t v24;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "identifier", a3));
  v7 = objc_opt_class(NSIndexPath);
  v8 = BUDynamicCast(v7, v6);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)v9;
  if (v9)
  {
    v24 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController booksAtIndexPaths:](self, "booksAtIndexPaths:", v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collection](self, "collection"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "cellForItemAtIndexPath:", v10));
    v16 = sub_1000D734C(self, v12, v13, v15, 0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
    contextMenuAppearDate = self->_contextMenuAppearDate;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[BKContextMenuProvider sharedProvider](BKContextMenuProvider, "sharedProvider"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "analyticsAssetPropertyProviderForDataModel:", v17));
    objc_msgSend(v18, "emitContextualActionSheetExposureEventWithTracker:startDate:propertyProvider:", v19, contextMenuAppearDate, v22);

  }
  v23 = self->_contextMenuAppearDate;
  self->_contextMenuAppearDate = 0;

}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  CGFloat y;
  CGFloat x;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void **v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  id v21[3];
  id location;

  y = a5.y;
  x = a5.x;
  v9 = a3;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contextMenuInteraction"));
  v12 = objc_msgSend(v11, "menuAppearance");

  if (v12 == (id)2)
  {
    objc_initWeak(&location, self);
    v15 = _NSConcreteStackBlock;
    v16 = 3221225472;
    v17 = sub_1000D7800;
    v18 = &unk_1008EA2E8;
    objc_copyWeak(v21, &location);
    v19 = v9;
    v20 = v10;
    v21[1] = *(id *)&x;
    v21[2] = *(id *)&y;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", v20, 0, &v15));
    objc_msgSend(v13, "setPreferredMenuElementOrder:", 2, v15, v16, v17, v18);

    objc_destroyWeak(v21);
    objc_destroyWeak(&location);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_dci_collectionView:(id)a3 contextMenuConfigurationForSelectedItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contextMenuInteraction"));
  v10 = objc_msgSend(v9, "menuAppearance");

  if (v10 == (id)2)
  {
    objc_initWeak(&location, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000D7C88;
    v13[3] = &unk_1008EA310;
    objc_copyWeak(&v15, &location);
    v14 = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v13));
    objc_msgSend(v11, "setPreferredMenuElementOrder:", 2);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)coverEffectsNightMode
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_opt_class(BKLibraryBookshelfCollectionView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  LOBYTE(v4) = objc_msgSend(v6, "currentUserInterfaceStyle") == (id)2;
  return (char)v4;
}

- (unint64_t)coverEffectsContent
{
  return 1;
}

- (id)coverEffectRTLOverride
{
  return 0;
}

- (BOOL)hasAnySeriesContainerSelected
{
  BKLibraryBookshelfCollectionViewController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController selectedBooks](self, "selectedBooks"));
  LOBYTE(v2) = -[BKLibraryBookshelfCollectionViewController hasAnySeriesContainerInLibraryAssets:](v2, "hasAnySeriesContainerInLibraryAssets:", v3);

  return (char)v2;
}

- (BOOL)hasAnySeriesContainerInLibraryAssets:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "isValid", (_QWORD)v9)
          && (objc_msgSend(v7, "isContainer") & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_12;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_12:

  return (char)v4;
}

- (BOOL)hasAnyDeletableBookSelected
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController selectedBooks](self, "selectedBooks"));
  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v3));
  else
    v4 = 0;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "supplementaryDataSource"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collection"));

    v8 = objc_alloc((Class)BKDeleteActionItemsProvider);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionID"));
    v10 = objc_msgSend(v8, "initWithBooks:currentCollectionId:", v4, v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "actionItems"));
  }
  else
  {
    v11 = 0;
  }
  v12 = objc_msgSend(v11, "count") != 0;

  return v12;
}

- (void)removeForSelectedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathsForSelectedItems"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trashButton"));
  -[BKLibraryBookshelfCollectionViewController _removalAttemptForItemsAtIndexPaths:sourceBarButtonItem:](self, "_removalAttemptForItemsAtIndexPaths:sourceBarButtonItem:", v7, v6);

}

- (void)removeForSelectedItems
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathsForSelectedItems"));

  -[BKLibraryBookshelfCollectionViewController _removalAttemptForItemsAtIndexPaths:sourceBarButtonItem:](self, "_removalAttemptForItemsAtIndexPaths:sourceBarButtonItem:", v4, 0);
}

- (void)_removalAttemptForItemsAtIndexPaths:(id)a3 sourceBarButtonItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  char v15;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController booksAtIndexPaths:](self, "booksAtIndexPaths:", v6));
  if (objc_msgSend(v8, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "booksDataSource"));
    v11 = objc_msgSend(v10, "totalNumberOfItems");
    LOBYTE(v11) = v11 == objc_msgSend(v8, "count");

    objc_initWeak(&location, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000D8340;
    v12[3] = &unk_1008EA360;
    v12[4] = self;
    v13 = v8;
    objc_copyWeak(&v14, &location);
    v15 = (char)v11;
    -[BKLibraryBookshelfCollectionViewController deleteBooks:sourceBarButtonItem:completion:](self, "deleteBooks:sourceBarButtonItem:completion:", v13, v7, v12);
    objc_destroyWeak(&v14);

    objc_destroyWeak(&location);
  }

}

- (void)shareSelectedItemFromBarButtonItem:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController selectedBooks](self, "selectedBooks"));
  if (objc_msgSend(v5, "count") == (id)1)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000D8538;
    v6[3] = &unk_1008E7928;
    v6[4] = self;
    v7 = v5;
    v8 = v4;
    -[BKLibraryBookshelfCollectionViewController _presentUsingBlock:](self, "_presentUsingBlock:", v6);

  }
}

- (void)addForSelectedItems:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView", a3));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPathsForSelectedItems"));

  -[BKLibraryBookshelfCollectionViewController _addToCollectionAttemptForItemsAtIndexPaths:](self, "_addToCollectionAttemptForItemsAtIndexPaths:", v5);
}

- (void)_addToCollectionAttemptForItemsAtIndexPaths:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController booksAtIndexPaths:](self, "booksAtIndexPaths:", v4));
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000D8710;
  v7[3] = &unk_1008E98F8;
  objc_copyWeak(&v9, &location);
  v6 = v5;
  v8 = v6;
  -[BKLibraryBookshelfCollectionViewController _addSelectedBooksToReadingList:completion:](self, "_addSelectedBooksToReadingList:completion:", v6, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)doneForSelectedItems:(id)a3
{
  -[BKLibraryBookshelfCollectionViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
}

- (void)_presentUsingBlock:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(void);

  v8 = (void (**)(void))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController presentedViewController](self, "presentedViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentingViewController"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController presentedViewController](self, "presentedViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentingViewController"));
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, v8);

  }
  else
  {
    v8[2]();
  }

}

- (void)deleteBooks:(id)a3 sourceBarButtonItem:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  BKLibraryBookshelfCollectionViewController *v11;
  id v12;
  id v13;
  id v14;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000D89B4;
  v10[3] = &unk_1008E8EE0;
  v11 = self;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v7 = v14;
  v8 = v13;
  v9 = v12;
  -[BKLibraryBookshelfCollectionViewController _presentUsingBlock:](v11, "_presentUsingBlock:", v10);

}

- (void)didUpdateLibraryBookshelfLayout:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView", a3));
  if (objc_msgSend(v4, "isDragging"))
  {

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
    v6 = objc_msgSend(v5, "isDecelerating");

    if ((v6 & 1) == 0)
    {
      -[BKLibraryBookshelfCollectionViewController updateActionBarFromMetrics](self, "updateActionBarFromMetrics");
      -[BKLibraryBookshelfCollectionViewController updateTitleFromMetrics](self, "updateTitleFromMetrics");
    }
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "backgroundColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController layout](self, "layout"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mainHeaderMetrics"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "headerBackgroundColor"));
  v12 = objc_msgSend(v8, "isEqual:", v11);

  if ((v12 & 1) == 0)
  {
    if (-[BKLibraryBookshelfCollectionViewController hasInitializedCollectionBackgroundColor](self, "hasInitializedCollectionBackgroundColor"))
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000D8C10;
      v17[3] = &unk_1008E72C0;
      v17[4] = self;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v17, 0.3);
    }
    else
    {
      -[BKLibraryBookshelfCollectionViewController setHasInitializedCollectionBackgroundColor:](self, "setHasInitializedCollectionBackgroundColor:", 1);
      v16 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController layout](self, "layout"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mainHeaderMetrics"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "headerBackgroundColor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
      objc_msgSend(v15, "setBackgroundColor:", v14);

    }
  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  objc_super v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionViewLayout"));
  objc_msgSend(v9, "invalidateLayout");

  v11.receiver = self;
  v11.super_class = (Class)BKLibraryBookshelfCollectionViewController;
  -[BKLibraryBookshelfCollectionViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v11, "willTransitionToTraitCollection:withTransitionCoordinator:", v7, v6);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000D8D6C;
  v10[3] = &unk_1008E8308;
  v10[4] = self;
  objc_msgSend(v6, "animateAlongsideTransition:completion:", v10, &stru_1008EA3A0);

}

- (void)selectItemAtIndexPath:(id)a3 animated:(BOOL)a4 scrollPosition:(unint64_t)a5
{
  _BOOL8 v6;
  void *v8;
  id v9;

  v6 = a4;
  v9 = a3;
  if (-[BKLibraryBookshelfCollectionViewController shouldAllowCellSelection](self, "shouldAllowCellSelection"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
    objc_msgSend(v8, "selectItemAtIndexPath:animated:scrollPosition:", v9, v6, a5);

  }
}

- (void)deselectItemAtIndexPath:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  if (-[BKLibraryBookshelfCollectionViewController shouldAllowCellSelection](self, "shouldAllowCellSelection"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
    objc_msgSend(v6, "deselectItemAtIndexPath:animated:", v7, v4);

  }
}

- (id)indexPathForCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForCell:", v4));

  return v6;
}

- (BOOL)isAudiobookAtIndexpath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "booksDataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "representedObjectForIndexPath:", v4));

  LOBYTE(v5) = objc_msgSend(v7, "isAudiobook");
  return (char)v5;
}

- (BOOL)allowsOpeningBooks
{
  return -[BKLibraryBookshelfCollectionViewController isEditing](self, "isEditing") ^ 1;
}

- (id)bkaxLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collection](self, "collection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedTitle"));

  return v3;
}

- (void)didBecomeVisibleContentScrollView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController tabBarController](self, "tabBarController"));
  objc_msgSend(v3, "bc_setPreferredTabBarScrollEdgeAppearance:", 0);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController tabBarController](self, "tabBarController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectedViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v4, "setContentScrollView:forEdge:", v5, 4);

}

- (void)_bkAccessibilityFocusCollectionView
{
  UIAccessibilityNotifications v2;
  id v3;

  v2 = UIAccessibilityLayoutChangedNotification;
  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfCollectionViewController collectionView](self, "collectionView"));
  UIAccessibilityPostNotification(v2, v3);

}

- (BOOL)accessibilityPerformEscape
{
  unsigned int v3;

  v3 = -[BKLibraryBookshelfCollectionViewController isEditing](self, "isEditing");
  if (v3)
    -[BKLibraryBookshelfCollectionViewController doneForSelectedItems:](self, "doneForSelectedItems:", 0);
  return v3;
}

- (BKCollection)collection
{
  return self->_collection;
}

- (NSString)collectionID
{
  return self->_collectionID;
}

- (void)setCollectionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (BKLibraryBookshelfLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (BSUINavigationItem)bsuiNavigationItem
{
  return self->_bsuiNavigationItem;
}

- (UICollectionViewDragDelegate)dragDelegate
{
  return self->_dragDelegate;
}

- (UICollectionViewDropDelegate)dropDelegate
{
  return self->_dropDelegate;
}

- (BKLibraryDataSourceAdaptor)dataSourceAdaptor
{
  return self->_dataSourceAdaptor;
}

- (int64_t)dragAndDropSessionsActive
{
  return self->_dragAndDropSessionsActive;
}

- (void)setDragAndDropSessionsActive:(int64_t)a3
{
  self->_dragAndDropSessionsActive = a3;
}

- (UIButton)_collectionBackingButton
{
  return self->__collectionBackingButton;
}

- (void)set_collectionBackingButton:(id)a3
{
  objc_storeStrong((id *)&self->__collectionBackingButton, a3);
}

- (UIBarButtonItem)_readingListBackingButton
{
  return self->__readingListBackingButton;
}

- (void)set_readingListBackingButton:(id)a3
{
  objc_storeStrong((id *)&self->__readingListBackingButton, a3);
}

- (BKCollection)allBooksCollection
{
  return self->_allBooksCollection;
}

- (void)setAllBooksCollection:(id)a3
{
  objc_storeStrong((id *)&self->_allBooksCollection, a3);
}

- (BKLibraryBookshelfSelectedActionBarViewController)actionBarViewController
{
  return self->_actionBarViewController;
}

- (void)setActionBarViewController:(id)a3
{
  objc_storeStrong((id *)&self->_actionBarViewController, a3);
}

- (UIBarButtonItem)navBarEditButtonItem
{
  return self->_navBarEditButtonItem;
}

- (void)setNavBarEditButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_navBarEditButtonItem, a3);
}

- (UIBarButtonItem)navBarSelectAllButtonItem
{
  return self->_navBarSelectAllButtonItem;
}

- (void)setNavBarSelectAllButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_navBarSelectAllButtonItem, a3);
}

- (UIView)wrapperView
{
  return self->_wrapperView;
}

- (void)setWrapperView:(id)a3
{
  objc_storeStrong((id *)&self->_wrapperView, a3);
}

- (BOOL)ubiquityDeleteWarningShown
{
  return self->_ubiquityDeleteWarningShown;
}

- (void)setUbiquityDeleteWarningShown:(BOOL)a3
{
  self->_ubiquityDeleteWarningShown = a3;
}

- (BOOL)hasInitializedCollectionBackgroundColor
{
  return self->_hasInitializedCollectionBackgroundColor;
}

- (void)setHasInitializedCollectionBackgroundColor:(BOOL)a3
{
  self->_hasInitializedCollectionBackgroundColor = a3;
}

- (BOOL)transitioningToNewLayout
{
  return self->_transitioningToNewLayout;
}

- (void)setTransitioningToNewLayout:(BOOL)a3
{
  self->_transitioningToNewLayout = a3;
}

- (BOOL)preserveContentOffsetInNewLayout
{
  return self->_preserveContentOffsetInNewLayout;
}

- (void)setPreserveContentOffsetInNewLayout:(BOOL)a3
{
  self->_preserveContentOffsetInNewLayout = a3;
}

- (CGPoint)previousContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_previousContentOffset.x;
  y = self->_previousContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPreviousContentOffset:(CGPoint)a3
{
  self->_previousContentOffset = a3;
}

- (id)addSelectedBooksCompletion
{
  return self->_addSelectedBooksCompletion;
}

- (void)setAddSelectedBooksCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (BOOL)shouldAccessibilityFocusCollectionViewUponAppearing
{
  return self->_shouldAccessibilityFocusCollectionViewUponAppearing;
}

- (void)setShouldAccessibilityFocusCollectionViewUponAppearing:(BOOL)a3
{
  self->_shouldAccessibilityFocusCollectionViewUponAppearing = a3;
}

- (UIViewController)presentedReadingListPopover
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentedReadingListPopover);
}

- (void)setPresentedReadingListPopover:(id)a3
{
  objc_storeWeak((id *)&self->_presentedReadingListPopover, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentedReadingListPopover);
  objc_storeStrong(&self->_addSelectedBooksCompletion, 0);
  objc_storeStrong((id *)&self->_wrapperView, 0);
  objc_storeStrong((id *)&self->_navBarSelectAllButtonItem, 0);
  objc_storeStrong((id *)&self->_navBarEditButtonItem, 0);
  objc_storeStrong((id *)&self->_actionBarViewController, 0);
  objc_storeStrong((id *)&self->_allBooksCollection, 0);
  objc_storeStrong((id *)&self->__readingListBackingButton, 0);
  objc_storeStrong((id *)&self->__collectionBackingButton, 0);
  objc_storeStrong((id *)&self->_dataSourceAdaptor, 0);
  objc_storeStrong((id *)&self->_dropDelegate, 0);
  objc_storeStrong((id *)&self->_dragDelegate, 0);
  objc_storeStrong((id *)&self->_bsuiNavigationItem, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_collectionID, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_analyticsStartDate, 0);
  objc_storeStrong((id *)&self->_contextMenuAppearDate, 0);
}

- (BOOL)hasSelectedItems
{
  BKLibraryBookshelfCollectionViewController *v2;
  UICollectionView *v3;
  UICollectionView *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = self;
  v3 = -[BKLibraryBookshelfCollectionViewController collectionView](v2, "collectionView");
  if (v3)
  {
    v4 = v3;
    v5 = -[UICollectionView indexPathsForSelectedItems](v3, "indexPathsForSelectedItems");

    if (v5)
    {
      v6 = type metadata accessor for IndexPath(0);
      v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v5, v6);

      v8 = sub_10004CFD4(&qword_1009D7688);
      v9 = sub_10029F8CC((unint64_t *)&unk_1009D7690, &qword_1009D7688);
      LOBYTE(v5) = Collection.isNotEmpty.getter(v8, v9);

      swift_bridgeObjectRelease(v7);
    }
    else
    {

    }
  }
  else
  {

    LOBYTE(v5) = 0;
  }
  return v5 & 1;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (NSArray)preferredFocusEnvironments
{
  BKLibraryBookshelfCollectionViewController *v2;
  UICollectionView *v3;
  UICollectionView *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  Class isa;
  _QWORD *v10;

  v2 = self;
  v3 = -[BKLibraryBookshelfCollectionViewController collectionView](v2, "collectionView");
  if (v3)
  {
    v4 = v3;
    v5 = sub_10004CFD4((uint64_t *)&unk_1009D4750);
    v6 = swift_allocObject(v5, 40, 7);
    *(_OWORD *)(v6 + 16) = xmmword_1007118F0;
    *(_QWORD *)(v6 + 32) = v4;
    v10 = (_QWORD *)v6;
    specialized Array._endMutation()(v6);
    v7 = v10;

  }
  else
  {

    v7 = _swiftEmptyArrayStorage;
  }
  sub_10004CFD4((uint64_t *)&unk_1009D76F0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v7);
  return (NSArray *)isa;
}

- (NSArray)keyCommands
{
  BKLibraryBookshelfCollectionViewController *v2;
  unint64_t v3;
  NSArray v4;

  v2 = self;
  v3 = BKLibraryBookshelfCollectionViewController.keyCommands.getter();

  if (v3)
  {
    sub_100009E04(0, &qword_1009D76A0, UIKeyCommand_ptr);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  BKLibraryBookshelfCollectionViewController *v7;
  uint64_t v8;
  BKLibraryBookshelfCollectionViewController *v9;
  char v10;
  _OWORD v12[2];

  if (a4)
  {
    v7 = self;
    v8 = swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v8);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v9 = self;
  }
  v10 = BKLibraryBookshelfCollectionViewController.canPerformAction(_:withSender:)((uint64_t)a3, (uint64_t)v12);

  sub_100010960((uint64_t)v12, (uint64_t *)&unk_1009D04E0);
  return v10 & 1;
}

- (void)validateCommand:(id)a3
{
  id v4;
  BKLibraryBookshelfCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  BKLibraryBookshelfCollectionViewController.validate(_:)((UICommand)v4);

}

- (void)selectAll:(id)a3
{
  sub_1002ADA08(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_selectAll);
}

- (void)dismissPDFPicker:(id)a3
{
  sub_1002ADA08(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_dismissPDFPicker);
}

- (void)delete:(id)a3
{
  sub_1002ADA08(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_removeForSelectedItems);
}

- (void)updateBarButtonsAnimated:(BOOL)a3
{
  BKLibraryBookshelfCollectionViewController *v4;

  v4 = self;
  if (-[BKLibraryBookshelfCollectionViewController isEditing](v4, "isEditing"))
    sub_1002ADAA8(a3);
  else
    sub_1002ADCF8(a3);
  sub_1002AEAB8();

}

- (void)viewModeChanged
{
  BKLibraryBookshelfCollectionViewController *v2;

  v2 = self;
  BKLibraryBookshelfCollectionViewController.viewModeChanged()();

}

- (void)sortModeChanged
{
  BKLibraryBookshelfCollectionViewController *v2;

  v2 = self;
  BKLibraryBookshelfCollectionViewController.sortModeChanged()();

}

- (void)editButtonPressed:(id)a3
{
  BKLibraryBookshelfCollectionViewController *v5;
  uint64_t v6;
  BKLibraryBookshelfCollectionViewController *v7;
  BKLibraryDataSourceAdaptor *v8;
  BKLibraryActionHandler *v9;
  __int128 v10;
  __int128 v11;

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    v10 = 0u;
    v11 = 0u;
    v7 = self;
  }
  v8 = -[BKLibraryBookshelfCollectionViewController dataSourceAdaptor](self, "dataSourceAdaptor", v10, v11);
  v9 = -[BKLibraryDataSourceAdaptor actionHandler](v8, "actionHandler");

  -[BKLibraryActionHandler toggleEditMode](v9, "toggleEditMode");
  sub_100010960((uint64_t)&v10, (uint64_t *)&unk_1009D04E0);
}

- (void)largeTitleVisibilityDidChangeWithIsVisible:(BOOL)a3
{
  _BOOL8 v3;
  BKLibraryBookshelfCollectionViewController *v4;
  BKLibraryBookshelfCollectionViewController *v5;
  BKLibraryBookshelfCollectionViewController *v6;
  BKLibraryBookshelfCollectionViewController *v7;

  v3 = a3;
  v7 = self;
  v4 = (BKLibraryBookshelfCollectionViewController *)sub_1002B101C();
  if (v4)
  {
    v5 = v4;
    if (-[BKLibraryBookshelfCollectionViewController isHidden](v4, "isHidden") != v3)
      -[BKLibraryBookshelfCollectionViewController setHidden:](v5, "setHidden:", v3);

    v6 = v5;
  }
  else
  {
    v6 = v7;
  }

}

- (void)dragAndDropSessionDidStart
{
  char *v2;
  BKLibraryBookshelfCollectionViewController *v3;

  v3 = self;
  v2 = -[BKLibraryBookshelfCollectionViewController dragAndDropSessionsActive](v3, "dragAndDropSessionsActive");
  if (__OFADD__(v2, 1))
  {
    __break(1u);
  }
  else
  {
    -[BKLibraryBookshelfCollectionViewController setDragAndDropSessionsActive:](v3, "setDragAndDropSessionsActive:", v2 + 1);
    -[BKLibraryBookshelfCollectionViewController configureForDragAndDropSession](v3, "configureForDragAndDropSession");

  }
}

- (void)dragAndDropSessionDidEnd
{
  char *v2;
  BKLibraryBookshelfCollectionViewController *v3;

  v3 = self;
  v2 = -[BKLibraryBookshelfCollectionViewController dragAndDropSessionsActive](v3, "dragAndDropSessionsActive");
  if (__OFSUB__(v2, 1))
  {
    __break(1u);
  }
  else
  {
    -[BKLibraryBookshelfCollectionViewController setDragAndDropSessionsActive:](v3, "setDragAndDropSessionsActive:", v2 - 1);
    -[BKLibraryBookshelfCollectionViewController configureForDragAndDropSession](v3, "configureForDragAndDropSession");

  }
}

- (void)configureForDragAndDropSession
{
  uint64_t v3;
  BKLibraryBookshelfCollectionViewController *v4;

  sub_100009E04(0, (unint64_t *)&qword_1009CEC30, OS_dispatch_queue_ptr);
  v3 = swift_allocObject(&unk_1008F9968, 24, 7);
  swift_unknownObjectWeakInit(v3 + 16);
  v4 = self;
  swift_retain(v3);
  static OS_dispatch_queue.dispatchAsyncOnMainIfNeeded(block:)(sub_1002B2BA4, v3);

  swift_release_n(v3, 2);
}

- (void)books_open:(id)a3
{
  sub_1002ADA08(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_openSelectedBooks);
}

- (void)books_viewAsGrid:(id)a3
{
  sub_1002B1C80(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_changeViewModeTo_, 1);
}

- (void)books_viewAsList:(id)a3
{
  sub_1002B1C80(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_changeViewModeTo_, 2);
}

- (void)books_viewAllInSeries:(id)a3
{
  sub_1002B1C80(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_changeSortModeTo_, 10);
}

- (void)books_viewOnlyPurchased:(id)a3
{
  sub_1002B1C80(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_changeSortModeTo_, 9);
}

- (void)books_sortByLastOpened:(id)a3
{
  sub_1002B1C80(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_changeSortModeTo_, 1);
}

- (void)books_sortByTitle:(id)a3
{
  sub_1002B1C80(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_changeSortModeTo_, 2);
}

- (void)books_sortByAuthor:(id)a3
{
  sub_1002B1C80(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_changeSortModeTo_, 3);
}

- (void)books_sortManually:(id)a3
{
  sub_1002B1C80(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_changeSortModeTo_, 6);
}

- (void)createSeriesViewControllerFromSeriesContainer:(BKLibraryAsset *)a3 withParentTracker:(_TtC13BookAnalytics9BATracker *)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  BKLibraryAsset *v17;
  _TtC13BookAnalytics9BATracker *v18;
  BKLibraryBookshelfCollectionViewController *v19;
  uint64_t v20;
  uint64_t v21;

  v9 = sub_10004CFD4(&qword_1009D3150);
  __chkstk_darwin(v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_1008F9990, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_1008F99B8, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1009D76D8;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_1008F99E0, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1009D76E0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  v20 = sub_1005D61EC((uint64_t)v11, (uint64_t)&unk_1009E5570, (uint64_t)v16);
  swift_release(v20);
}

@end
