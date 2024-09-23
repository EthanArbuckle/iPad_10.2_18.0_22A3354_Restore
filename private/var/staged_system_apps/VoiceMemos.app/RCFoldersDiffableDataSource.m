@implementation RCFoldersDiffableDataSource

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v7;
  id v8;
  id v9;
  unsigned int v10;
  unsigned __int8 v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v8, "isEqualToString:", UICollectionElementKindSectionHeader);
  v11 = objc_msgSend(v8, "isEqualToString:", CFSTR("kFolderCollectionElementKindSectionSpacer"));
  if ((v10 & 1) == 0 && (v11 & 1) == 0)
  {
    v12 = OSLogForCategory(kVMLogCategoryDefault);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      sub_10010D2AC((uint64_t)v8, v13, v14, v15, v16, v17, v18, v19);

  }
  if (v10)
    v20 = CFSTR("kFolderHeaderCellReuseIdentifier");
  else
    v20 = CFSTR("kFolderSpacerCellReuseIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v8, v20, v9));

  return v21;
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  id v5;
  BOOL v6;

  v5 = a4;
  if (-[RCFoldersDiffableDataSource supportsMove](self, "supportsMove"))
    v6 = objc_msgSend(v5, "section") == (id)1;
  else
    v6 = 0;

  return v6;
}

- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersDiffableDataSource foldersController](self, "foldersController"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "folderAtIndexPath:", v8));

  -[RCFoldersDiffableDataSource setIsDuringMove:](self, "setIsDuringMove:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCFoldersDiffableDataSource selectionDelegate](self, "selectionDelegate"));
  objc_msgSend(v10, "moveFolder:toDestinationIndexPath:", v11, v7);

  -[RCFoldersDiffableDataSource setIsDuringMove:](self, "setIsDuringMove:", 0);
}

- (RCFolderSelectionDelegate)selectionDelegate
{
  return (RCFolderSelectionDelegate *)objc_loadWeakRetained((id *)&self->_selectionDelegate);
}

- (void)setSelectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_selectionDelegate, a3);
}

- (RCFoldersFetchedResultsController)foldersController
{
  return self->_foldersController;
}

- (void)setFoldersController:(id)a3
{
  objc_storeStrong((id *)&self->_foldersController, a3);
}

- (BOOL)isDuringMove
{
  return self->_isDuringMove;
}

- (void)setIsDuringMove:(BOOL)a3
{
  self->_isDuringMove = a3;
}

- (BOOL)supportsMove
{
  return self->_supportsMove;
}

- (void)setSupportsMove:(BOOL)a3
{
  self->_supportsMove = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foldersController, 0);
  objc_destroyWeak((id *)&self->_selectionDelegate);
}

@end
