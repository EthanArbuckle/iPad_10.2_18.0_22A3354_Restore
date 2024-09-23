@implementation RCRecentlyDeletedRecordingsCollectionViewController

- (BOOL)isRecentlyDeleted
{
  return 1;
}

- (RCRecentlyDeletedRecordingsCollectionViewController)init
{
  id v3;
  RCRecentlyDeletedRecordingsCollectionViewController *v4;
  RCRecordingsCollectionViewControllerDataCoordinator *v5;
  objc_super v7;

  v3 = objc_alloc_init((Class)UICollectionViewLayout);
  v7.receiver = self;
  v7.super_class = (Class)RCRecentlyDeletedRecordingsCollectionViewController;
  v4 = -[RCRecordingsCollectionViewController initWithCollectionViewLayout:](&v7, "initWithCollectionViewLayout:", v3);

  if (v4)
  {
    -[RCRecordingsCollectionViewController setFolderType:](v4, "setFolderType:", 3);
    v5 = -[RCRecordingsCollectionViewControllerDataCoordinator initWithFolderType:delegate:]([RCRecordingsCollectionViewControllerDataCoordinator alloc], "initWithFolderType:delegate:", 3, v4);
    -[RCRecordingsCollectionViewController setRecordingsDataCoordinator:](v4, "setRecordingsDataCoordinator:", v5);

    -[RCRecordingsCollectionViewController _commonInit](v4, "_commonInit");
    -[RCRecentlyDeletedRecordingsCollectionViewController _classSpecificInit](v4, "_classSpecificInit");
  }
  return v4;
}

- (void)_classSpecificInit
{
  RCRecordingsCollectionViewControllerDataCoordinator *v3;

  v3 = -[RCRecordingsCollectionViewControllerDataCoordinator initWithFolderType:delegate:]([RCRecordingsCollectionViewControllerDataCoordinator alloc], "initWithFolderType:delegate:", 3, self);
  -[RCRecordingsCollectionViewController setRecordingsDataCoordinator:](self, "setRecordingsDataCoordinator:", v3);

  -[RCRecordingsCollectionViewController setReuseIdentifier:](self, "setReuseIdentifier:", CFSTR("RecentlyDeletedRecordingCellReuseIdentifier"));
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RCRecentlyDeletedRecordingsCollectionViewController;
  -[RCRecordingsCollectionViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "contentSizeChanged", UIContentSizeCategoryDidChangeNotification, 0);

}

- (void)contentSizeChanged
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecentlyDeletedRecordingsCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v3, "reloadData");

  -[RCRecordingsCollectionViewController restyle](self, "restyle");
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RCRecentlyDeletedRecordingsCollectionViewController;
  -[RCRecordingsCollectionViewController setEditing:animated:](&v9, "setEditing:animated:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecentlyDeletedRecordingsCollectionViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v6, "setHidesBackButton:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecentlyDeletedRecordingsCollectionViewController navigationController](self, "navigationController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "interactivePopGestureRecognizer"));
  objc_msgSend(v8, "setEnabled:", v4 ^ 1);

}

- (void)handleEraseAll:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController libraryActionHandler](self, "libraryActionHandler"));
  objc_msgSend(v5, "performAction:atPosition:forUUID:sourceController:source:", 19, 0, self, v4, 0.0);

}

- (void)handleRecover:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecentlyDeletedRecordingsCollectionViewController collectionView](self, "collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathsForSelectedItems"));
  v7 = objc_msgSend(v6, "count");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController libraryActionHandler](self, "libraryActionHandler"));
  v9 = v8;
  if (v7)
    v10 = 21;
  else
    v10 = 22;
  objc_msgSend(v8, "performAction:atPosition:forUUID:sourceController:source:", v10, 0, self, v4, 0.0);

  -[RCRecordingsCollectionViewController _handleEditModeFooterAndNavigationItem](self, "_handleEditModeFooterAndNavigationItem");
}

- (void)_handleDelete:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  v19 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecentlyDeletedRecordingsCollectionViewController navigationController](self, "navigationController"));
  v5 = objc_msgSend(v4, "isToolbarHidden");

  v6 = v19;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecentlyDeletedRecordingsCollectionViewController collectionView](self, "collectionView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "indexPathsForSelectedItems"));
    v9 = objc_msgSend(v8, "count");

    v6 = v19;
    if (!v9)
      goto LABEL_11;
    if (v9 == (id)1)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecentlyDeletedRecordingsCollectionViewController collectionView](self, "collectionView"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecentlyDeletedRecordingsCollectionViewController collectionView](self, "collectionView"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "indexPathForSelectedItem"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cellForItemAtIndexPath:", v12));

    }
    else
    {
      v6 = 0;
    }

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecentlyDeletedRecordingsCollectionViewController collectionView](self, "collectionView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "indexPathsForSelectedItems"));
  v15 = objc_msgSend(v14, "count");

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController libraryActionHandler](self, "libraryActionHandler"));
  v17 = v16;
  if (v15)
    v18 = 18;
  else
    v18 = 19;
  objc_msgSend(v16, "performAction:atPosition:forUUID:sourceController:source:", v18, 0, self, v6, 0.0);

  -[RCRecordingsCollectionViewController _handleEditModeFooterAndNavigationItem](self, "_handleEditModeFooterAndNavigationItem");
LABEL_11:

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if ("delete:" == a3)
    return -[RCRecentlyDeletedRecordingsCollectionViewController canDelete](self, "canDelete");
  else
    return 0;
}

- (void)deleteCurrentSelection:(id)a3
{
  -[RCRecentlyDeletedRecordingsCollectionViewController _handleDelete:](self, "_handleDelete:", a3);
}

- (BOOL)canDelete
{
  BOOL v3;
  void *v4;
  void *v5;

  if (-[RCRecordingsCollectionViewController selectedCellIsEditingTitle](self, "selectedCellIsEditingTitle"))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecentlyDeletedRecordingsCollectionViewController collectionView](self, "collectionView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPathsForSelectedItems"));
  v3 = objc_msgSend(v5, "count") != 0;

  return v3;
}

- (void)delete:(id)a3
{
  -[RCRecentlyDeletedRecordingsCollectionViewController _handleDelete:](self, "_handleDelete:", a3);
}

- (BOOL)_showsRecentlyDeleted
{
  return 0;
}

- (BOOL)canRenameRecording
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecentlyDeletedRecordingsCollectionViewController collectionView](self, "collectionView"));
  v4 = (uint64_t)objc_msgSend(v3, "numberOfItemsInSection:", 0);

  if (v4 < 1)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecentlyDeletedRecordingsCollectionViewController collectionView](self, "collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForSelectedItem"));

  v7 = v6 != 0;
  return v7;
}

- (void)renameRecording:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecentlyDeletedRecordingsCollectionViewController collectionView](self, "collectionView", a3));
  v5 = (uint64_t)objc_msgSend(v4, "numberOfItemsInSection:", 0);

  if (v5 >= 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecentlyDeletedRecordingsCollectionViewController collectionView](self, "collectionView"));
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathForSelectedItem"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecentlyDeletedRecordingsCollectionViewController collectionView](self, "collectionView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellForItemAtIndexPath:", v11));

    if (v8)
    {
      v10 = objc_opt_class(RCRecordingCollectionViewCell, v9);
      if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
        objc_msgSend(v8, "beginEditingTitle");
    }

  }
}

- (BOOL)canPlayRecording
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecentlyDeletedRecordingsCollectionViewController collectionView](self, "collectionView"));
  v4 = (uint64_t)objc_msgSend(v3, "numberOfItemsInSection:", 0);

  if (v4 < 1)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecentlyDeletedRecordingsCollectionViewController collectionView](self, "collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForSelectedItem"));

  v7 = v6 != 0;
  return v7;
}

- (void)_styleView
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RCRecentlyDeletedRecordingsCollectionViewController collectionView](self, "collectionView"));
  -[RCRecordingsCollectionViewController _restyleAllExtantCells](self, "_restyleAllExtantCells");
  objc_msgSend(v3, "restyle");

}

- (void)handleRecoverForUUID:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController uuidOfSelectedItem](self, "uuidOfSelectedItem"));
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
    -[RCRecordingsCollectionViewController setUuidOfSelectedItem:](self, "setUuidOfSelectedItem:", 0);
}

- (void)handleEraseForUUID:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionViewController uuidOfSelectedItem](self, "uuidOfSelectedItem"));
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
    -[RCRecordingsCollectionViewController setUuidOfSelectedItem:](self, "setUuidOfSelectedItem:", 0);
}

- (BOOL)isShowingRecentlyDeleted
{
  RCRecentlyDeletedRecordingsCollectionViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecentlyDeletedRecordingsCollectionViewController navigationController](self, "navigationController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "childViewControllers"));
  LOBYTE(v2) = objc_msgSend(v4, "containsObject:", v2);

  return (char)v2;
}

@end
