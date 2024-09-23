@implementation RCFolderSelectionCollectionViewController

- (void)_classSpecificLoadView
{
  void *v3;
  void *v4;
  NSArray *v5;
  NSArray *excludedFolderUUIDsForMove;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController diffableDataSource](self, "diffableDataSource"));
  objc_msgSend(v3, "setSupportsMove:", 0);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[RCFolderSelectionCollectionViewController selectionDelegate](self, "selectionDelegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderSelectionCollectionViewController uuidsToMove](self, "uuidsToMove"));
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "folderUUIDsToExcludeWhenMovingRecordingUUIDs:", v4));
  excludedFolderUUIDsForMove = self->_excludedFolderUUIDsForMove;
  self->_excludedFolderUUIDsForMove = v5;

}

- (Class)_collectionViewCellClass
{
  return (Class)objc_opt_class(RCFolderSelectionCollectionViewCell, a2);
}

- (Class)_collectionViewHeaderCellClass
{
  return (Class)objc_opt_class(RCFoldersSelectionCollectionViewHeaderCell, a2);
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController foldersController](self, "foldersController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "folderAtIndexPath:", v5));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[RCFolderDisplayModel folderDisplayModelWithFolderModel:](RCFolderDisplayModel, "folderDisplayModelWithFolderModel:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderSelectionCollectionViewController selectionDelegate](self, "selectionDelegate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderSelectionCollectionViewController uuidOfSourceFolder](self, "uuidOfSourceFolder"));
  LOBYTE(self) = objc_msgSend(v9, "canMoveSelectedRecordingsFromFolderWithUUID:toFolderWithDisplayModel:excludedFolderUUIDsForSelection:", v10, v8, self->_excludedFolderUUIDsForMove);

  return (char)self;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController foldersController](self, "foldersController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "folderAtIndexPath:", v5));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[RCFolderDisplayModel folderDisplayModelWithFolderModel:](RCFolderDisplayModel, "folderDisplayModelWithFolderModel:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderSelectionCollectionViewController selectionDelegate](self, "selectionDelegate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderSelectionCollectionViewController uuidOfSourceFolder](self, "uuidOfSourceFolder"));
  LOBYTE(self) = objc_msgSend(v9, "canMoveSelectedRecordingsFromFolderWithUUID:toFolderWithDisplayModel:excludedFolderUUIDsForSelection:", v10, v8, self->_excludedFolderUUIDsForMove);

  return (char)self;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController foldersController](self, "foldersController"));
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "folderAtIndexPath:", v5));

  v7 = objc_msgSend(v14, "folderType");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderSelectionCollectionViewController selectionDelegate](self, "selectionDelegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderSelectionCollectionViewController uuidsToMove](self, "uuidsToMove"));
  if (v7 == (id)4)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uuid"));
    objc_msgSend(v8, "moveRecordingsWithUUIDs:toFolderWithUUID:", v9, v10);

  }
  else
  {
    objc_msgSend(v8, "moveRecordingsWithUUIDs:fromFolderOfType:toBuiltInFolderOfType:", v9, -[RCFolderSelectionCollectionViewController folderTypeOfSourceFolder](self, "folderTypeOfSourceFolder"), v7);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderSelectionCollectionViewController presentingDelegate](self, "presentingDelegate"));
  v12 = objc_opt_respondsToSelector(v11, "didCompleteFolderSelection");

  if ((v12 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderSelectionCollectionViewController presentingDelegate](self, "presentingDelegate"));
    objc_msgSend(v13, "didCompleteFolderSelection");

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;
  _QWORD v21[2];

  v20.receiver = self;
  v20.super_class = (Class)RCFolderSelectionCollectionViewController;
  -[RCFoldersCollectionViewController viewWillAppear:](&v20, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SELECT_A_FOLDER"), &stru_1001B2BC0, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderSelectionCollectionViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v6, "setTitle:", v5);

  v7 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "_handleCancel");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderSelectionCollectionViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v8, "setRightBarButtonItem:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderSelectionCollectionViewController navigationController](self, "navigationController"));
  objc_msgSend(v10, "setToolbarHidden:", 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "createNewFolderImage"));
  v12 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithImage:style:target:action:", v11, 0, self, "_handleNewFolder");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("AX_NEW_FOLDER"), &stru_1001B2BC0, 0));
  objc_msgSend(v12, "setAccessibilityLabel:", v14);

  v15 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, self, 0);
  v21[0] = v15;
  v21[1] = v12;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 2));
  -[RCFolderSelectionCollectionViewController setToolbarItems:animated:](self, "setToolbarItems:animated:", v16, 1);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderSelectionCollectionViewController navigationController](self, "navigationController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "toolbar"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "folderSelectionNavBarNewFolderImageTintColor"));
  objc_msgSend(v18, "setTintColor:", v19);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  unint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];

  v15.receiver = self;
  v15.super_class = (Class)RCFolderSelectionCollectionViewController;
  -[RCFolderSelectionCollectionViewController viewDidAppear:](&v15, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersCollectionViewController foldersController](self, "foldersController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "builtinFolders"));

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "folderType", (_QWORD)v11) == (id)1)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  v10 = -[RCFoldersCollectionViewController _countOfUserFolders](self, "_countOfUserFolders");
  if ((v7 & 1) == 0 && !v10)
    -[RCFolderSelectionCollectionViewController _handleNewFolder](self, "_handleNewFolder");

}

- (void)_handleCancel
{
  void *v3;
  char v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderSelectionCollectionViewController presentingDelegate](self, "presentingDelegate"));
  v4 = objc_opt_respondsToSelector(v3, "didCancelFolderSelection");

  if ((v4 & 1) != 0)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[RCFolderSelectionCollectionViewController presentingDelegate](self, "presentingDelegate"));
    objc_msgSend(v5, "didCancelFolderSelection");

  }
}

- (void)_handleNewFolder
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RCFolderSelectionCollectionViewController selectionDelegate](self, "selectionDelegate"));
  objc_msgSend(v3, "showNewFolderUIFromController:", self);

}

- (void)_configureCell:(id)a3 withFolderDisplayModel:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RCFolderSelectionCollectionViewController;
  v7 = a4;
  -[RCFoldersCollectionViewController _configureCell:withFolderDisplayModel:](&v13, "_configureCell:withFolderDisplayModel:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderSelectionCollectionViewController selectionDelegate](self, "selectionDelegate", v13.receiver, v13.super_class));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderSelectionCollectionViewController uuidOfSourceFolder](self, "uuidOfSourceFolder"));
  v10 = objc_msgSend(v8, "canMoveSelectedRecordingsFromFolderWithUUID:toFolderWithDisplayModel:excludedFolderUUIDsForSelection:", v9, v7, self->_excludedFolderUUIDsForMove);

  objc_msgSend(v6, "setEnabled:", v10);
  if ((_DWORD)v10)
  {
    objc_msgSend(v6, "setAccessibilityValue:", &stru_1001B2BC0);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("AX_DIMMED_VALUE"), &stru_1001B2BC0, 0));
    objc_msgSend(v6, "setAccessibilityValue:", v12);

  }
}

- (id)_backgroundColorToUse
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "folderSelectionCollectionViewBackgroundColor"));

  return v3;
}

- (BOOL)_showsSeparators
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v3 = objc_msgSend(v2, "folderSelectionCollectionViewShowsSeparators");

  return v3;
}

- (int64_t)_layoutListAppearance
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v3 = objc_msgSend(v2, "folderSelectionCollectionViewListAppearance");

  return (int64_t)v3;
}

- (double)_builtInFolderSectionTopPadding
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v2, "folderSelectionCollectionViewTopPadding");
  v4 = v3;

  return v4;
}

- (BOOL)_selectionFollowsFocus
{
  return 0;
}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  return 0;
}

- (id)selectionDelegate
{
  return objc_loadWeakRetained((id *)&self->_selectionDelegate);
}

- (void)setSelectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_selectionDelegate, a3);
}

- (RCFolderSelectionPresenting)presentingDelegate
{
  return (RCFolderSelectionPresenting *)objc_loadWeakRetained((id *)&self->_presentingDelegate);
}

- (void)setPresentingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentingDelegate, a3);
}

- (NSArray)uuidsToMove
{
  return self->_uuidsToMove;
}

- (void)setUuidsToMove:(id)a3
{
  objc_storeStrong((id *)&self->_uuidsToMove, a3);
}

- (NSString)uuidOfSourceFolder
{
  return self->_uuidOfSourceFolder;
}

- (void)setUuidOfSourceFolder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (int64_t)folderTypeOfSourceFolder
{
  return self->_folderTypeOfSourceFolder;
}

- (void)setFolderTypeOfSourceFolder:(int64_t)a3
{
  self->_folderTypeOfSourceFolder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidOfSourceFolder, 0);
  objc_storeStrong((id *)&self->_uuidsToMove, 0);
  objc_destroyWeak((id *)&self->_presentingDelegate);
  objc_storeStrong((id *)&self->_excludedFolderUUIDsForMove, 0);
  objc_destroyWeak((id *)&self->_selectionDelegate);
}

@end
