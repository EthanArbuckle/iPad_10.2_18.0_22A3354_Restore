@implementation RCFolderBrowsingCollectionViewController

- (void)setRecordingViewControllerDelegate:(id)a3
{
  RCRecordingViewControllerDelegate **p_recordingViewControllerDelegate;
  id v5;
  id v6;

  p_recordingViewControllerDelegate = &self->_recordingViewControllerDelegate;
  v5 = a3;
  objc_storeWeak((id *)p_recordingViewControllerDelegate, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController currentActiveFolderViewController](self, "currentActiveFolderViewController"));
  objc_msgSend(v6, "setRecordingViewControllerDelegate:", v5);

}

- (void)setLibraryActionHandler:(id)a3
{
  RCLibraryActionHandler **p_libraryActionHandler;
  id v5;
  void *v6;
  id v7;

  p_libraryActionHandler = &self->_libraryActionHandler;
  v5 = a3;
  objc_storeWeak((id *)p_libraryActionHandler, v5);
  v7 = (id)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController currentActiveFolderViewController](self, "currentActiveFolderViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordingsCollectionViewController"));
  objc_msgSend(v6, "setLibraryActionHandler:", v5);

}

- (void)goToBuiltInFolderOfType:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v5 = a4;
  v8 = a5;
  switch(a3)
  {
    case 0:
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[RCApplicationModel sharedApplicationModel](RCApplicationModel, "sharedApplicationModel"));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "voiceMemosRecordingsFolder"));
      goto LABEL_6;
    case 1:
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[RCApplicationModel sharedApplicationModel](RCApplicationModel, "sharedApplicationModel"));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "favoriteRecordingsFolder"));
      goto LABEL_6;
    case 2:
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[RCApplicationModel sharedApplicationModel](RCApplicationModel, "sharedApplicationModel"));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "capturedOnWatchRecordingsFolder"));
      goto LABEL_6;
    case 3:
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[RCApplicationModel sharedApplicationModel](RCApplicationModel, "sharedApplicationModel"));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recentlyDeletedRecordingsFolder"));
LABEL_6:
      v11 = v10;

      if (!v11)
        goto LABEL_8;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject uuid](v11, "uuid"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[RCFolderDisplayModel folderNameForBuiltInFolderOfType:](RCFolderDisplayModel, "folderNameForBuiltInFolderOfType:", a3));
      -[RCFolderBrowsingCollectionViewController _pushViewControllerForFolderOfType:withName:folderUUID:animated:completion:](self, "_pushViewControllerForFolderOfType:withName:folderUUID:animated:completion:", a3, v13, v12, v5, v8);

      break;
    default:
LABEL_8:
      v14 = OSLogForCategory(kVMLogCategoryDefault);
      v11 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        sub_10010D328(a3, v11, v15, v16, v17, v18, v19, v20);
      break;
  }

}

- (void)_pushViewControllerForFolderOfType:(int64_t)a3 withName:(id)a4 folderUUID:(id)a5 animated:(BOOL)a6 completion:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  RCFolderViewController *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void (**v20)(void);
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  RCFolderViewController *v27;
  id v28;
  _QWORD v29[5];
  id v30;
  BOOL v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  RCFolderBrowsingCollectionViewController *v36;
  id v37;
  id v38;
  id from;
  id location[2];

  v8 = a6;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  if ((unint64_t)a3 >= 4)
  {
    if (a3 != 4)
    {
      v27 = 0;
      goto LABEL_7;
    }
    v15 = -[RCFolderViewController initWithUserFolderNamed:folderUUID:]([RCFolderViewController alloc], "initWithUserFolderNamed:folderUUID:", v12, v13);
  }
  else
  {
    v15 = -[RCFolderViewController initWithBuiltInFolderType:folderUUID:]([RCFolderViewController alloc], "initWithBuiltInFolderType:folderUUID:", a3, v13);
  }
  v27 = v15;
LABEL_7:
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController selectionDelegate](self, "selectionDelegate"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController recordingsCollectionViewController](v27, "recordingsCollectionViewController"));
  objc_msgSend(v17, "setFolderSelectionDelegate:", v16);

  -[RCFoldersCollectionViewController setCurrentFolderViewController:](self, "setCurrentFolderViewController:", v27);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController currentActiveFolderViewController](self, "currentActiveFolderViewController"));

  if (v18)
  {
    objc_initWeak(location, self);
    objc_initWeak(&from, v27);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10000D478;
    v34[3] = &unk_1001ACD18;
    objc_copyWeak(&v37, &from);
    objc_copyWeak(&v38, location);
    v28 = v12;
    v35 = v12;
    v36 = self;
    -[RCFolderViewController setSetupBlock:](v27, "setSetupBlock:", v34);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100077BD8;
    v32[3] = &unk_1001AC138;
    objc_copyWeak(&v33, &from);
    -[RCFolderViewController setTeardownBlock:](v27, "setTeardownBlock:", v32);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController setupBlock](v27, "setupBlock"));

    if (v19)
    {
      v20 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[RCFolderViewController setupBlock](v27, "setupBlock"));
      v20[2]();

    }
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", !v8);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000074B8;
    v29[3] = &unk_1001AC800;
    v31 = v8;
    v29[4] = self;
    v30 = v14;
    +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v29);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderBrowsingCollectionViewController splitViewController](self, "splitViewController"));
    objc_msgSend(v21, "setViewController:forColumn:", v27, 1);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderViewController navigationController](v27, "navigationController"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
    v24 = objc_msgSend(v23, "usesLargeTitles");
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "navigationBar"));
    objc_msgSend(v25, "setPrefersLargeTitles:", v24);

    objc_msgSend(v22, "setToolbarHidden:animated:", 1, 1);
    +[CATransaction commit](CATransaction, "commit");
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderBrowsingCollectionViewController browsingDelegate](self, "browsingDelegate"));
    objc_msgSend(v26, "didSelectFolderOfType:", a3);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&v38);
    objc_destroyWeak(&v37);
    objc_destroyWeak(&from);
    objc_destroyWeak(location);
    v12 = v28;
  }
  -[RCFoldersCollectionViewController setCurrentFolderViewController:](self, "setCurrentFolderViewController:", v27);
  -[RCFolderBrowsingCollectionViewController _selectActiveFolderIfNeeded](self, "_selectActiveFolderIfNeeded");

}

- (RCRecordingsCollectionViewController)activeRecordingsCollectionViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController currentActiveFolderViewController](self, "currentActiveFolderViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "recordingsCollectionViewController"));

  return (RCRecordingsCollectionViewController *)v3;
}

- (void)setUndoManager:(id)a3
{
  objc_storeWeak((id *)&self->_undoManager, a3);
}

- (void)setBrowsingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_browsingDelegate, a3);
}

- (RCRecordingViewControllerDelegate)recordingViewControllerDelegate
{
  return (RCRecordingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_recordingViewControllerDelegate);
}

- (RCLibraryActionHandler)libraryActionHandler
{
  return (RCLibraryActionHandler *)objc_loadWeakRetained((id *)&self->_libraryActionHandler);
}

- (RCFolderBrowsingDelegate)browsingDelegate
{
  return (RCFolderBrowsingDelegate *)objc_loadWeakRetained((id *)&self->_browsingDelegate);
}

- (void)_selectActiveFolderIfNeeded
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (-[RCFolderBrowsingCollectionViewController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderBrowsingCollectionViewController splitViewController](self, "splitViewController"));
    v4 = objc_msgSend(v3, "isCollapsed");

    if ((v4 & 1) == 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderBrowsingCollectionViewController _currentActiveFolder](self, "_currentActiveFolder"));
      if (v5)
      {
        v12 = v5;
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController foldersController](self, "foldersController"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathForFolder:", v12));

        v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderBrowsingCollectionViewController collectionView](self, "collectionView"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "indexPathsForSelectedItems"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));

        if ((objc_msgSend(v10, "isEqual:", v7) & 1) == 0)
        {
          if ((-[RCFolderBrowsingCollectionViewController isEditing](self, "isEditing") & 1) != 0)
          {
            -[RCFoldersCollectionViewController setIndexPathOfSelectionDuringEditing:](self, "setIndexPathOfSelectionDuringEditing:", v7);
          }
          else
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderBrowsingCollectionViewController collectionView](self, "collectionView"));
            objc_msgSend(v11, "selectItemAtIndexPath:animated:scrollPosition:", v7, 0, 0);

          }
        }

        v5 = v12;
      }

    }
  }
}

- (RCCloudRecording)selectedRecording
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderBrowsingCollectionViewController activeRecordingsCollectionViewController](self, "activeRecordingsCollectionViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "selectedRecording"));

  return (RCCloudRecording *)v3;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  _BOOL4 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];

  v4 = a4;
  v5 = a3;
  v26 = -[RCFolderBrowsingCollectionViewController isEditing](self, "isEditing");
  if (!v26 && v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderBrowsingCollectionViewController collectionView](self, "collectionView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "indexPathsForSelectedItems"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    -[RCFoldersCollectionViewController setIndexPathOfSelectionDuringEditing:](self, "setIndexPathOfSelectionDuringEditing:", v9);

  }
  v32.receiver = self;
  v32.super_class = (Class)RCFolderBrowsingCollectionViewController;
  v27 = v5;
  -[RCFolderBrowsingCollectionViewController setEditing:animated:](&v32, "setEditing:animated:", v5, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderBrowsingCollectionViewController browsingDelegate](self, "browsingDelegate"));
  objc_msgSend(v10, "didChangeEditingState");

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderBrowsingCollectionViewController collectionView](self, "collectionView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "visibleCells"));

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderBrowsingCollectionViewController collectionView](self, "collectionView"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "indexPathForCell:", v17));

        if (-[RCFolderBrowsingCollectionViewController isEditing](self, "isEditing"))
          v20 = objc_msgSend(v19, "section") == (id)1;
        else
          v20 = 1;
        objc_msgSend(v17, "setEnabled:", v20);
        if (objc_msgSend(v17, "enabled"))
        {
          objc_msgSend(v17, "setAccessibilityValue:", &stru_1001B2BC0);
        }
        else
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("AX_DIMMED_VALUE"), &stru_1001B2BC0, 0));
          objc_msgSend(v17, "setAccessibilityValue:", v22);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v14);
  }

  if ((v26 & !v27) == 1)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController indexPathOfSelectionDuringEditing](self, "indexPathOfSelectionDuringEditing"));

    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderBrowsingCollectionViewController collectionView](self, "collectionView"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController indexPathOfSelectionDuringEditing](self, "indexPathOfSelectionDuringEditing"));
      objc_msgSend(v24, "selectItemAtIndexPath:animated:scrollPosition:", v25, 0, 0);

      -[RCFoldersCollectionViewController setIndexPathOfSelectionDuringEditing:](self, "setIndexPathOfSelectionDuringEditing:", 0);
    }
  }
}

- (RCRecordingViewController)recordingViewController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController currentActiveFolderViewController](self, "currentActiveFolderViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "recordingViewController"));

  return (RCRecordingViewController *)v3;
}

- (id)undoManager
{
  return objc_loadWeakRetained((id *)&self->_undoManager);
}

- (void)_classSpecificLoadView
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController diffableDataSource](self, "diffableDataSource"));
  objc_msgSend(v2, "setSupportsMove:", 1);

}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RCFolderBrowsingCollectionViewController;
  -[RCFoldersCollectionViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderBrowsingCollectionViewController collectionView](self, "collectionView"));
  objc_msgSend(v3, "setDropDelegate:", self);
  objc_msgSend(v3, "setDragDelegate:", self);

}

- (Class)_collectionViewCellClass
{
  return (Class)objc_opt_class(RCFoldersCollectionViewCell, a2);
}

- (Class)_collectionViewHeaderCellClass
{
  return (Class)objc_opt_class(RCFoldersCollectionViewHeaderCell, a2);
}

- (void)handleFolderDeletion
{
  -[RCFolderBrowsingCollectionViewController _selectAllRecordingsFolderForActiveFolderDeletion](self, "_selectAllRecordingsFolderForActiveFolderDeletion");
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;

  -[RCFolderBrowsingCollectionViewController _pushViewControllerForFolderAtIndexPath:](self, "_pushViewControllerForFolderAtIndexPath:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCFolderBrowsingCollectionViewController splitViewController](self, "splitViewController"));
  objc_msgSend(v5, "hidePrimaryColumnIfNeeded");

}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderBrowsingCollectionViewController collectionView](self, "collectionView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathsForSelectedItems"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));

  v9 = !v8 || (objc_msgSend(v8, "isEqual:", v5) & 1) == 0;
  return v9;
}

- (void)_pushViewControllerForFolderAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController foldersController](self, "foldersController"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "folderAtIndexPath:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RCFolderDisplayModel folderDisplayModelWithFolderModel:](RCFolderDisplayModel, "folderDisplayModelWithFolderModel:", v10));
  v7 = objc_msgSend(v10, "folderType");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUID"));
  -[RCFolderBrowsingCollectionViewController _pushViewControllerForFolderOfType:withName:folderUUID:animated:completion:](self, "_pushViewControllerForFolderOfType:withName:folderUUID:animated:completion:", v7, v8, v9, 1, 0);

}

- (void)restyle
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RCFolderBrowsingCollectionViewController;
  -[RCFoldersCollectionViewController restyle](&v5, "restyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController currentFolderViewController](self, "currentFolderViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recordingViewController"));
  objc_msgSend(v4, "restyle");

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  UIAccessibilityNotifications v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RCFolderBrowsingCollectionViewController;
  -[RCFolderBrowsingCollectionViewController viewDidAppear:](&v8, "viewDidAppear:", a3);
  -[RCFolderBrowsingCollectionViewController _updateCellSelectionForActiveFolder](self, "_updateCellSelectionForActiveFolder");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderBrowsingCollectionViewController _currentActiveFolder](self, "_currentActiveFolder"));
  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderBrowsingCollectionViewController browsingDelegate](self, "browsingDelegate"));
    objc_msgSend(v5, "didReturnToFoldersList");

  }
  v6 = UIAccessibilityLayoutChangedNotification;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderBrowsingCollectionViewController collectionView](self, "collectionView"));
  UIAccessibilityPostNotification(v6, v7);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void (**v7)(void);
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RCFolderBrowsingCollectionViewController;
  -[RCFolderBrowsingCollectionViewController viewWillDisappear:](&v8, "viewWillDisappear:");
  -[RCFolderBrowsingCollectionViewController setEditing:animated:](self, "setEditing:animated:", 0, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderBrowsingCollectionViewController navigationController](self, "navigationController"));
  objc_msgSend(v5, "setToolbarHidden:animated:", 1, v3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderBrowsingCollectionViewController viewWillDisappearBlock](self, "viewWillDisappearBlock"));
  if (v6)
  {
    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[RCFolderBrowsingCollectionViewController viewWillDisappearBlock](self, "viewWillDisappearBlock"));
    v7[2]();

    -[RCFolderBrowsingCollectionViewController setViewWillDisappearBlock:](self, "setViewWillDisappearBlock:", 0);
  }
}

- (void)_configureCell:(id)a3 withFolderDisplayModel:(id)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RCFolderBrowsingCollectionViewController;
  v6 = a3;
  -[RCFoldersCollectionViewController _configureCell:withFolderDisplayModel:](&v7, "_configureCell:withFolderDisplayModel:", v6, a4);
  objc_msgSend(v6, "setActionHandler:", self, v7.receiver, v7.super_class);

}

- (void)_updateCellSelectionForActiveFolder
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCFolderBrowsingCollectionViewController _currentActiveFolder](self, "_currentActiveFolder"));
  if (v6)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController foldersController](self, "foldersController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathForFolder:", v6));

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderBrowsingCollectionViewController collectionView](self, "collectionView"));
    objc_msgSend(v5, "selectItemAtIndexPath:animated:scrollPosition:", v4, 0, 0);

  }
}

- (id)_currentActiveFolder
{
  return -[RCFolderBrowsingCollectionViewController _currentFolder:](self, "_currentFolder:", 0);
}

- (id)_currentFolder:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  if (a3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController currentFolderViewController](self, "currentFolderViewController"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController currentActiveFolderViewController](self, "currentActiveFolderViewController"));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "folderTitle"));
    v6 = objc_msgSend(v4, "folderType");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[RCApplicationModel sharedApplicationModel](RCApplicationModel, "sharedApplicationModel"));
    v8 = v7;
    switch((unint64_t)v6)
    {
      case 0uLL:
        v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "voiceMemosRecordingsFolder"));
        goto LABEL_13;
      case 1uLL:
        v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "favoriteRecordingsFolder"));
        goto LABEL_13;
      case 2uLL:
        v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "capturedOnWatchRecordingsFolder"));
        goto LABEL_13;
      case 3uLL:
        v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recentlyDeletedRecordingsFolder"));
        goto LABEL_13;
      case 4uLL:
        v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "existingFolderWithName:", v5));
LABEL_13:
        v10 = (void *)v9;
        break;
      default:
        v10 = 0;
        break;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_selectAllRecordingsFolderForActiveFolderDeletion
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderBrowsingCollectionViewController splitViewController](self, "splitViewController"));
  v4 = objc_msgSend(v3, "isCollapsed");

  if (v4)
  {
    -[RCFolderBrowsingCollectionViewController goToBuiltInFolderOfType:animated:completion:](self, "goToBuiltInFolderOfType:animated:completion:", 0, 0, 0);
  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[RCFolderBrowsingCollectionViewController _allRecordingsIndexPath](self, "_allRecordingsIndexPath"));
    -[RCFolderBrowsingCollectionViewController _pushViewControllerForFolderAtIndexPath:](self, "_pushViewControllerForFolderAtIndexPath:");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController indexPathOfSelectionDuringEditing](self, "indexPathOfSelectionDuringEditing"));

    if (v5)
      -[RCFoldersCollectionViewController setIndexPathOfSelectionDuringEditing:](self, "setIndexPathOfSelectionDuringEditing:", v6);

  }
}

- (id)_allRecordingsIndexPath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCApplicationModel sharedApplicationModel](RCApplicationModel, "sharedApplicationModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "voiceMemosRecordingsFolder"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController foldersController](self, "foldersController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForFolder:", v4));

  return v6;
}

- (void)showRenamingControllerWithFolderName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController selectionDelegate](self, "selectionDelegate"));
  objc_msgSend(v5, "showRenamingControllerWithFolderName:controller:", v4, self);

}

- (void)deleteFolderWithFolderName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[RCApplicationModel sharedApplicationModel](RCApplicationModel, "sharedApplicationModel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "folderWithName:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController selectionDelegate](self, "selectionDelegate"));
  objc_msgSend(v6, "deleteFolder:controller:completionBlock:", v5, self, 0);

}

- (void)goToUserFolderWithName:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v14 = (id)objc_claimAutoreleasedReturnValue(+[RCApplicationModel sharedApplicationModel](RCApplicationModel, "sharedApplicationModel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "folderWithName:", v9));

  v11 = objc_msgSend(v10, "folderType");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uuid"));
  -[RCFolderBrowsingCollectionViewController _pushViewControllerForFolderOfType:withName:folderUUID:animated:completion:](self, "_pushViewControllerForFolderOfType:withName:folderUUID:animated:completion:", v11, v12, v13, v5, v8);

}

- (BOOL)isShowingRecentlyDeleted
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController currentActiveFolderViewController](self, "currentActiveFolderViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "recordingsCollectionViewController"));
  v5 = objc_opt_class(RCRecentlyDeletedRecordingsCollectionViewController, v4);
  isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  return isKindOfClass & 1;
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSItemProvider *v14;
  id v15;
  void *v16;
  id v18;

  v7 = a4;
  v8 = a5;
  if (objc_msgSend(v8, "section"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController foldersController](self, "foldersController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "folderAtIndexPath:", v8));

    v11 = objc_msgSend(v10, "folderType");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uuid"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[RCLocalDropContext dropContextWithFolderType:folderUUID:folderIndexPath:payloadType:](RCLocalDropContext, "dropContextWithFolderType:folderUUID:folderIndexPath:payloadType:", v11, v12, v8, 1));

    objc_msgSend(v7, "setLocalContext:", v13);
    v14 = objc_opt_new(NSItemProvider);
    v15 = objc_msgSend(objc_alloc((Class)UIDragItem), "initWithItemProvider:", v14);
    v18 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));

  }
  else
  {
    v16 = &__NSArray0__struct;
  }

  return v16;
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCFolderBrowsingCollectionViewController libraryActionHandler](self, "libraryActionHandler", a3, a4));
  objc_msgSend(v4, "willBeginDragSession");

}

- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCFolderBrowsingCollectionViewController libraryActionHandler](self, "libraryActionHandler", a3, a4));
  objc_msgSend(v4, "didEndDragSession");

}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localDragSession"));

  if (v5)
    LOBYTE(v6) = 1;
  else
    v6 = objc_msgSend(v4, "hasItemsConformingToTypeIdentifiers:", &off_1001B7520);

  return v6;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  id v24;

  v24 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "session"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localDragSession"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "destinationIndexPath"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController foldersController](self, "foldersController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "folderAtIndexPath:", v9));

  if (!v8)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController foldersController](self, "foldersController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "folderAtIndexPath:", v9));

    objc_msgSend(v24, "selectItemAtIndexPath:animated:scrollPosition:", v9, 0, 0);
    -[RCFolderBrowsingCollectionViewController collectionView:didSelectItemAtIndexPath:](self, "collectionView:didSelectItemAtIndexPath:", v24, v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderBrowsingCollectionViewController activeRecordingsCollectionViewController](self, "activeRecordingsCollectionViewController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "session"));
    objc_msgSend(v18, "performDropWithSession:folder:", v20, v14);
    goto LABEL_8;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "session"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localDragSession"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localContext"));

  v15 = objc_msgSend(v14, "payloadType");
  if (v15 == (id)1)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "folderIndexPath"));
    v23 = objc_msgSend(v22, "isEqual:", v9);

    if ((v23 & 1) == 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "dataSource"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "folderIndexPath"));
      objc_msgSend(v18, "collectionView:moveItemAtIndexPath:toIndexPath:", v24, v20, v9);
      goto LABEL_8;
    }
  }
  else if (!v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "session"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "items"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderBrowsingCollectionViewController _uuidArrayFromItemArray:](self, "_uuidArrayFromItemArray:", v17));

    v19 = objc_msgSend(v14, "folderType");
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "folderUUID"));
    -[RCFolderBrowsingCollectionViewController _dropLocalRecordingsWithUUIDArray:intoDestinationFolder:fromFolderType:fromFolderUUID:](self, "_dropLocalRecordingsWithUUIDArray:intoDestinationFolder:fromFolderType:fromFolderUUID:", v18, v11, v19, v20);
LABEL_8:

  }
}

- (void)_dropLocalRecordingsWithUUIDArray:(id)a3 intoDestinationFolder:(id)a4 fromFolderType:(int64_t)a5 fromFolderUUID:(id)a6
{
  id v10;
  id v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v10 = a4;
  v11 = a6;
  if (v20 && objc_msgSend(v20, "count"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[RCFolderDisplayModel folderDisplayModelWithFolderModel:](RCFolderDisplayModel, "folderDisplayModelWithFolderModel:", v10));
    v13 = objc_msgSend(v12, "representsPossibleMoveDestination");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderBrowsingCollectionViewController browsingDelegate](self, "browsingDelegate"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uuid"));
    v16 = objc_msgSend(v14, "canMoveRecordingsWithUUIDs:toFolderWithUUID:toFolderType:fromFolderUUID:", v20, v15, objc_msgSend(v12, "folderType"), v11);

    if (v13 && v16)
    {
      v17 = objc_msgSend(v12, "folderType");
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderBrowsingCollectionViewController browsingDelegate](self, "browsingDelegate"));
      if (v17 == (id)4)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUID"));
        objc_msgSend(v18, "moveRecordingsWithUUIDs:toFolderWithUUID:", v20, v19);

      }
      else
      {
        objc_msgSend(v18, "moveRecordingsWithUUIDs:fromFolderOfType:toBuiltInFolderOfType:", v20, a5, objc_msgSend(v12, "folderType"));
      }

    }
  }

}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  unsigned __int8 v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  unint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  unsigned int v39;
  void *v40;
  uint64_t v41;

  v7 = a4;
  v8 = a5;
  v9 = objc_msgSend(objc_alloc((Class)UICollectionViewDropProposal), "initWithDropOperation:intent:", 1, 0);
  v10 = v9;
  if (v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localDragSession"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController foldersController](self, "foldersController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "folderAtIndexPath:", v8));

    if (!v13)
    {
      v28 = v10;
LABEL_24:

      goto LABEL_25;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[RCFolderDisplayModel folderDisplayModelWithFolderModel:](RCFolderDisplayModel, "folderDisplayModelWithFolderModel:", v13));
    v15 = v14;
    if (!v11)
    {
      v29 = (unint64_t)objc_msgSend(v14, "folderType") & 0xFFFFFFFFFFFFFFFELL;
      v30 = objc_alloc((Class)UICollectionViewDropProposal);
      if (v29 == 2)
      {
        v31 = 1;
        v32 = 0;
      }
      else
      {
        v31 = 2;
        v32 = 2;
      }
      v17 = v10;
      v10 = objc_msgSend(v30, "initWithDropOperation:intent:", v31, v32);
      goto LABEL_23;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localDragSession"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localContext"));

    v18 = objc_msgSend(v17, "payloadType");
    if (v18 != (id)1)
    {
      if (!v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "items"));
        v41 = objc_claimAutoreleasedReturnValue(-[RCFolderBrowsingCollectionViewController _uuidArrayFromItemArray:](self, "_uuidArrayFromItemArray:", v19));

        v39 = objc_msgSend(v15, "representsPossibleMoveDestination");
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderBrowsingCollectionViewController browsingDelegate](self, "browsingDelegate"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUID"));
        v40 = v15;
        v22 = objc_msgSend(v15, "folderType");
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "folderUUID"));
        v24 = objc_msgSend(v20, "canMoveRecordingsWithUUIDs:toFolderWithUUID:toFolderType:fromFolderUUID:", v41, v21, v22, v23);

        v25 = objc_alloc((Class)UICollectionViewDropProposal);
        if (v39 && (v24 & 1) != 0)
        {
          v26 = 3;
          v27 = 2;
        }
        else
        {
          v26 = 1;
          v27 = 0;
        }
        v37 = objc_msgSend(v25, "initWithDropOperation:intent:", v26, v27);

        v15 = v40;
        v10 = (id)v41;
        goto LABEL_22;
      }
LABEL_23:

      v28 = v10;
      goto LABEL_24;
    }
    v33 = objc_msgSend(v8, "section");
    if (v33 == (id)1)
    {
      v34 = objc_alloc((Class)UICollectionViewDropProposal);
      v35 = 3;
      v36 = 1;
    }
    else
    {
      if (v33)
        goto LABEL_23;
      v34 = objc_alloc((Class)UICollectionViewDropProposal);
      v35 = 1;
      v36 = 0;
    }
    v37 = objc_msgSend(v34, "initWithDropOperation:intent:", v35, v36);
LABEL_22:

    v10 = v37;
    goto LABEL_23;
  }
  v28 = v9;
LABEL_25:

  return v28;
}

- (id)_uuidArrayFromItemArray:(id)a3
{
  id v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableArray);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v9), "localObject", (_QWORD)v15));
        if (v11)
        {
          v12 = objc_opt_class(NSString, v10);
          if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
            -[NSMutableArray addObject:](v4, "addObject:", v11);
        }

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  if (-[NSMutableArray count](v4, "count"))
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v4));
  else
    v13 = 0;

  return v13;
}

- (id)viewWillDisappearBlock
{
  return self->_viewWillDisappearBlock;
}

- (void)setViewWillDisappearBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_viewWillDisappearBlock, 0);
  objc_destroyWeak((id *)&self->_browsingDelegate);
  objc_destroyWeak((id *)&self->_recordingViewControllerDelegate);
  objc_destroyWeak((id *)&self->_libraryActionHandler);
  objc_destroyWeak((id *)&self->_undoManager);
}

@end
