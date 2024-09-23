@implementation MTDownloadsCollectionViewController

- (MTDownloadsCollectionViewController)initWithCollectionViewLayout:(id)a3 libraryActionControllerBridge:(id)a4
{
  id v6;
  MTDownloadsCollectionViewController *v7;
  MTDownloadsCollectionViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MTDownloadsCollectionViewController;
  v7 = -[MTDownloadsCollectionViewController initWithCollectionViewLayout:](&v13, "initWithCollectionViewLayout:", a3);
  v8 = v7;
  if (v7)
  {
    -[MTDownloadsCollectionViewController setLibraryActionControllerBridge:](v7, "setLibraryActionControllerBridge:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v8, "sizeCategoryChanged:", UIContentSizeCategoryDidChangeNotification, 0);

    -[MTDownloadsCollectionViewController updateDownloadCount](v8, "updateDownloadCount");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTLegacyDownloadManagerProvider sharedInstance](MTLegacyDownloadManagerProvider, "sharedInstance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "downloadsNotifier"));
    objc_msgSend(v11, "registerForUpdates:", v8);

  }
  return v8;
}

- (id)_downloadDataSource
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTLegacyDownloadManagerProvider sharedInstance](MTLegacyDownloadManagerProvider, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "downloadManager"));

  return v3;
}

+ (id)defaultViewControllerWithLibraryActionControllerBridge:(id)a3
{
  id v3;
  MTDownloadsCollectionViewFlowLayout *v4;
  MTDownloadsCollectionViewController *v5;

  v3 = a3;
  v4 = objc_alloc_init(MTDownloadsCollectionViewFlowLayout);
  v5 = -[MTDownloadsCollectionViewController initWithCollectionViewLayout:libraryActionControllerBridge:]([MTDownloadsCollectionViewController alloc], "initWithCollectionViewLayout:libraryActionControllerBridge:", v4, v3);

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, UIContentSizeCategoryDidChangeNotification, 0);

  v4.receiver = self;
  v4.super_class = (Class)MTDownloadsCollectionViewController;
  -[MTDownloadsCollectionViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  MTDownloadsCollectionView *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  MTDownloadsCollectionView *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)MTDownloadsCollectionViewController;
  -[MTDownloadsCollectionViewController viewDidLoad](&v23, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v3, "setLargeTitleDisplayMode:", 2);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Downloads"), &stru_1004C6D40, 0));
  -[MTDownloadsCollectionViewController setTitle:](self, "setTitle:", v5);

  v6 = [MTDownloadsCollectionView alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController view](self, "view"));
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController collectionViewLayout](self, "collectionViewLayout"));
  v17 = -[MTDownloadsCollectionView initWithFrame:collectionViewLayout:](v6, "initWithFrame:collectionViewLayout:", v16, v9, v11, v13, v15);
  -[MTDownloadsCollectionViewController setCollectionView:](self, "setCollectionView:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v18, "setPreservesSuperviewLayoutMargins:", 1);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController collectionView](self, "collectionView"));
  v20 = objc_opt_class(MTEpisodeDownloadCell);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[MTGenericCollectionCell reuseIdentifier](MTEpisodeDownloadCell, "reuseIdentifier"));
  objc_msgSend(v19, "registerClass:forCellWithReuseIdentifier:", v20, v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v22, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", objc_opt_class(MTDownloadsCancelReusableView), UICollectionElementKindSectionHeader, CFSTR("DownloadHeader"));

  -[MTDownloadsCollectionViewController configureBarButtonItems](self, "configureBarButtonItems");
  -[MTDownloadsCollectionViewController updateDownloadCount](self, "updateDownloadCount");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTDownloadsCollectionViewController;
  -[MTDownloadsCollectionViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[MTDownloadsCollectionViewController setVisible:](self, "setVisible:", 1);
  -[MTDownloadsCollectionViewController configureBarButtonItems](self, "configureBarButtonItems");
  -[MTDownloadsCollectionViewController updateDownloadCount](self, "updateDownloadCount");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[MTDownloadsCollectionViewController setVisible:](self, "setVisible:", 0);
  v5.receiver = self;
  v5.super_class = (Class)MTDownloadsCollectionViewController;
  -[MTDownloadsCollectionViewController viewWillDisappear:](&v5, "viewWillDisappear:", v3);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTDownloadsCollectionViewController;
  -[MTDownloadsCollectionViewController viewDidLayoutSubviews](&v6, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v3, "frame");
  v5 = v4;

  -[MTDownloadsCollectionViewController calculateCellWidth:](self, "calculateCellWidth:", v5);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)MTDownloadsCollectionViewController;
  v7 = a4;
  -[MTDownloadsCollectionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  -[MTDownloadsCollectionViewController calculateCellWidth:](self, "calculateCellWidth:", width);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000ADFFC;
  v8[3] = &unk_1004A7508;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v8);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  double Width;
  objc_super v7;
  CGRect v8;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MTDownloadsCollectionViewController;
  -[MTDownloadsCollectionViewController traitCollectionDidChange:](&v7, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v5, "bounds");
  Width = CGRectGetWidth(v8);

  -[MTDownloadsCollectionViewController calculateCellWidth:](self, "calculateCellWidth:", Width);
  -[MTDownloadsCollectionViewController configureBarButtonItems](self, "configureBarButtonItems");
  if (-[MTDownloadsCollectionViewController isHorizontallyCompact](self, "isHorizontallyCompact")
    && objc_msgSend(v4, "horizontalSizeClass") != (id)1)
  {
    -[MTDownloadsCollectionViewController tuckHeader](self, "tuckHeader");
  }

}

- (id)tabBarItem
{
  UITabBarItem *tabBarItem;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UITabBarItem *v11;
  UITabBarItem *v12;

  tabBarItem = self->_tabBarItem;
  if (!tabBarItem)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("UITabBarDownloads")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageWithRenderingMode:", 2));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("UITabBarDownloads"), "stringByAppendingString:", CFSTR("Selected")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageWithRenderingMode:", 2));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Downloads"), &stru_1004C6D40, 0));

    v11 = (UITabBarItem *)objc_msgSend(objc_alloc((Class)UITabBarItem), "initWithTitle:image:selectedImage:", v10, v5, v8);
    v12 = self->_tabBarItem;
    self->_tabBarItem = v11;

    -[UITabBarItem setTag:](self->_tabBarItem, "setTag:", 1685548132);
    tabBarItem = self->_tabBarItem;
  }
  return tabBarItem;
}

- (void)setCalculatedCellSize:(CGSize)a3
{
  void *v5;
  id v6;

  if (self->_calculatedCellSize.width != a3.width || self->_calculatedCellSize.height != a3.height)
  {
    self->_calculatedCellSize = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController collectionViewLayout](self, "collectionViewLayout"));
    objc_msgSend(v5, "invalidateLayout");

    v6 = (id)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController collectionView](self, "collectionView"));
    objc_msgSend(v6, "reloadData");

  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController _downloadDataSource](self, "_downloadDataSource", a3, a4));
  v5 = objc_msgSend(v4, "numberOfDownloads");

  return (int64_t)v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTGenericCollectionCell reuseIdentifier](MTEpisodeDownloadCell, "reuseIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v8, v6));

  v10 = objc_msgSend(v6, "row");
  -[MTDownloadsCollectionViewController configureCell:atIndex:](self, "configureCell:atIndex:", v9, v10);
  return v9;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  objc_msgSend(a4, "setDelegate:", self);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  objc_msgSend(a4, "setDelegate:", 0);
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  return objc_msgSend(a3, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", UICollectionElementKindSectionHeader, CFSTR("DownloadHeader"), a5);
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "cancelAllButton", a3));
  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, "cancelDownloads:", 64);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  -[MTDownloadsCollectionViewController toggleDownloadForIndex:](self, "toggleDownloadForIndex:", a4);
}

- (void)collectionView:(id)a3 didEndDisplayingSupplementaryView:(id)a4 forElementOfKind:(id)a5 atIndexPath:(id)a6
{
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "cancelAllButton", a3));
  objc_msgSend(v7, "removeTarget:action:forControlEvents:", self, "cancelDownloads:", 64);

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  -[MTDownloadsCollectionViewController calculatedCellSize](self, "calculatedCellSize", a3, a4, a5);
  result.height = v6;
  result.width = v5;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  v5 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  v8 = 0.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  return 0.0;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 0.0;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v6;
  CGFloat Width;
  CGFloat height;
  double v9;
  double v10;
  CGSize result;
  CGRect v12;

  v6 = a3;
  if (-[MTDownloadsCollectionViewController isHorizontallyCompact](self, "isHorizontallyCompact"))
  {
    objc_msgSend(v6, "bounds");
    Width = CGRectGetWidth(v12);
    height = 44.0;
  }
  else
  {
    Width = CGSizeZero.width;
    height = CGSizeZero.height;
  }

  v9 = Width;
  v10 = height;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)downloadManagerDidAddDownload:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController collectionView](self, "collectionView", a3));
  objc_msgSend(v4, "reloadData");

  -[MTDownloadsCollectionViewController updateDownloadCount](self, "updateDownloadCount");
}

- (void)downloadManagerWillRemoveDownload:(id)a3
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController _downloadDataSource](self, "_downloadDataSource", a3));
  v5 = objc_msgSend(v4, "numberOfDownloads");

  if (!v5)
  {
    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "done:", 0);
    -[MTDownloadsCollectionViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "done:", 0, 1.0);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v6, "reloadData");

  -[MTDownloadsCollectionViewController updateDownloadCount](self, "updateDownloadCount");
}

- (void)downloadManagerDidRemoveDownloads:(id)a3
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController _downloadDataSource](self, "_downloadDataSource", a3));
  v5 = objc_msgSend(v4, "numberOfDownloads");

  if (!v5)
  {
    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "done:", 0);
    -[MTDownloadsCollectionViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "done:", 0, 1.0);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v6, "reloadData");

  -[MTDownloadsCollectionViewController updateDownloadCount](self, "updateDownloadCount");
}

- (void)downloadManagerDidUpdateDownload:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (v9)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController _downloadDataSource](self, "_downloadDataSource"));
    v5 = objc_msgSend(v4, "indexForDownload:", v9);

    if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v5, 0));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController collectionView](self, "collectionView"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellForItemAtIndexPath:", v6));

      -[MTDownloadsCollectionViewController configureCell:atIndex:](self, "configureCell:atIndex:", v8, v5);
    }
  }
  -[MTDownloadsCollectionViewController updateDownloadCount](self, "updateDownloadCount");

}

- (void)cellDidPressDelete:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController collectionView](self, "collectionView"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForCell:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController episodeForDownloadAtIndex:](self, "episodeForDownloadAtIndex:", objc_msgSend(v9, "row")));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController libraryActionControllerBridge](self, "libraryActionControllerBridge"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
    objc_msgSend(v7, "cancelDownloadForEpisodeUuid:", v8);

  }
}

- (void)cellDidPressToggleDownload:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController collectionView](self, "collectionView"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForCell:", v4));

  -[MTDownloadsCollectionViewController toggleDownloadForIndex:](self, "toggleDownloadForIndex:", v6);
}

- (id)episodeForDownloadAtIndex:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController _downloadDataSource](self, "_downloadDataSource"));
  v6 = objc_msgSend(v5, "numberOfDownloads");

  if ((unint64_t)v6 <= a3)
  {
    v12 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController _downloadDataSource](self, "_downloadDataSource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "downloadAtIndex:", a3));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mainQueueContext"));

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "episodeUuid"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "episodeForUuid:", v11));

    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (void)cancelDownloads:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController libraryActionControllerBridge](self, "libraryActionControllerBridge", a3));
  objc_msgSend(v3, "cancelAllDownloadsUserInitiated:", 1);

}

- (void)updateDownloadCount
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController _downloadDataSource](self, "_downloadDataSource"));
  v4 = objc_msgSend(v3, "numberOfDownloads");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v4));
    v6 = IMAccessibilityLocalizedNumber();
    v10 = (id)objc_claimAutoreleasedReturnValue(v6);

  }
  else
  {
    v10 = 0;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController tabBarItem](self, "tabBarItem"));
  objc_msgSend(v7, "setBadgeValue:", v10);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController navigationController](self, "navigationController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tabBarItem"));
  objc_msgSend(v9, "setBadgeValue:", v10);

}

- (void)toggleDownloadForIndex:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController episodeForDownloadAtIndex:](self, "episodeForDownloadAtIndex:", objc_msgSend(a3, "row")));
  if (v6)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController libraryActionControllerBridge](self, "libraryActionControllerBridge"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
    objc_msgSend(v4, "resumeOrPauseEpisodeDownloadWithUuid:", v5);

  }
}

- (void)calculateCellWidth:(double)a3
{
  double v3;
  double v5;
  double v6;

  v3 = a3;
  if (a3 >= 703.0)
  {
    +[MTGenericCollectionCell preferredContentWidth](MTEpisodeDownloadCell, "preferredContentWidth");
    v3 = floor(v3 / (double)(unint64_t)ceil(v3 / v5));
  }
  +[MTGenericCollectionCell heightForWidth:](MTEpisodeDownloadCell, "heightForWidth:", v3);
  -[MTDownloadsCollectionViewController setCalculatedCellSize:](self, "setCalculatedCellSize:", v3, v6);
}

- (void)configureCell:(id)a3 atIndex:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController _downloadDataSource](self, "_downloadDataSource"));
  v7 = objc_msgSend(v6, "numberOfDownloads");

  if ((unint64_t)v7 > a4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController _downloadDataSource](self, "_downloadDataSource"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "downloadAtIndex:", a4));

    objc_msgSend(v10, "updateWithObject:", v9);
  }

}

- (void)configureBarButtonItems
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  if (-[MTDownloadsCollectionViewController isHorizontallyRegular](self, "isHorizontallyRegular"))
  {
    v3 = objc_alloc((Class)UIBarButtonItem);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Cancel All"), &stru_1004C6D40, 0));
    v12 = objc_msgSend(v3, "initWithTitle:style:target:action:", v5, 2, self, "cancelDownloads:");

  }
  else
  {
    v12 = 0;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController navigationController](self, "navigationController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentingViewController"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController navigationItem](self, "navigationItem"));
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v8, "setLeftBarButtonItem:", v12);

    v10 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "done:");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v11, "setRightBarButtonItem:", v10);

  }
  else
  {
    objc_msgSend(v8, "setRightBarButtonItem:", v12);

    v10 = (id)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v10, "setLeftBarButtonItem:", 0);
  }

}

- (void)tuckHeader
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController collectionViewLayout](self, "collectionViewLayout"));
  -[MTDownloadsCollectionViewController collectionView:layout:referenceSizeForHeaderInSection:](self, "collectionView:layout:referenceSizeForHeaderInSection:", v3, v4, 0);
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v7, "adjustedContentInset");
  v9 = v8;

  v10 = (id)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v10, "setContentOffset:animated:", 0, 0.0, v6 - v9);

}

- (void)sizeCategoryChanged:(id)a3
{
  -[MTDownloadsCollectionViewController updateCellSizes](self, "updateCellSizes", a3);
}

- (void)updateCellSizes
{
  void *v3;
  double Width;
  CGRect v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v3, "bounds");
  Width = CGRectGetWidth(v5);

  -[MTDownloadsCollectionViewController calculateCellWidth:](self, "calculateCellWidth:", Width);
}

- (void)done:(id)a3
{
  MTDownloadsCollectionViewController *v4;
  void *v5;
  void *v6;
  MTDownloadsCollectionViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  MTDownloadsCollectionViewController *v20;

  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "done:", 0);
  v4 = self;
  if (v4)
  {
    while (1)
    {
      v20 = v4;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController presentingViewController](v4, "presentingViewController"));

      if (v5)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController presentingViewController](v20, "presentingViewController"));
        objc_msgSend(v14, "dismissViewControllerAnimated:completion:", 1, 0);

        goto LABEL_13;
      }
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController navigationController](v20, "navigationController"));
      v7 = v20;
      if (v6)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController navigationController](v20, "navigationController"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewControllers"));
        if ((unint64_t)objc_msgSend(v9, "count") <= 1)
        {

          v7 = v20;
        }
        else
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController navigationController](v20, "navigationController"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "viewControllers"));
          v12 = objc_msgSend(v11, "indexOfObject:", v20);

          v7 = v20;
          if (v12)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController navigationController](v20, "navigationController"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "viewControllers"));

            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndex:", (char *)objc_msgSend(v16, "indexOfObject:", v20) - 1));
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController navigationController](v20, "navigationController"));
            v19 = objc_msgSend(v18, "popToViewController:animated:", v17, 1);

            goto LABEL_13;
          }
        }
      }
      if ((objc_opt_respondsToSelector(v7, "showDefaultDetailsWithCompletion:") & 1) != 0)
        break;
      v13 = objc_claimAutoreleasedReturnValue(-[MTDownloadsCollectionViewController parentViewController](v20, "parentViewController"));

      v4 = (MTDownloadsCollectionViewController *)v13;
      if (!v13)
        return;
    }
    -[MTDownloadsCollectionViewController performSelector:withObject:](v20, "performSelector:withObject:", "showDefaultDetailsWithCompletion:", 0);
LABEL_13:

  }
}

- (id)metricsName
{
  return CFSTR("Downloads");
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (CGSize)calculatedCellSize
{
  double width;
  double height;
  CGSize result;

  width = self->_calculatedCellSize.width;
  height = self->_calculatedCellSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (_TtC23ShelfKitCollectionViews41DownloadsCVCLibraryActionControllerBridge)libraryActionControllerBridge
{
  return self->_libraryActionControllerBridge;
}

- (void)setLibraryActionControllerBridge:(id)a3
{
  objc_storeStrong((id *)&self->_libraryActionControllerBridge, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryActionControllerBridge, 0);
  objc_storeStrong((id *)&self->_tabBarItem, 0);
}

@end
