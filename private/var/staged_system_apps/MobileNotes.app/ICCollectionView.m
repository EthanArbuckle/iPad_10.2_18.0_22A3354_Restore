@implementation ICCollectionView

- (void)setDiffableDataSource:(id)a3
{
  id v5;
  UICollectionViewDiffableDataSource **p_diffableDataSource;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v5 = a3;
  p_diffableDataSource = &self->_diffableDataSource;
  objc_storeStrong((id *)&self->_diffableDataSource, a3);
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000A62C4;
  v11[3] = &unk_100553460;
  objc_copyWeak(&v12, &location);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionViewDiffableDataSource reorderingHandlers](self->_diffableDataSource, "reorderingHandlers"));
  objc_msgSend(v7, "setCanReorderItemHandler:", v11);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000A6314;
  v9[3] = &unk_1005534C8;
  objc_copyWeak(&v10, &location);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionViewDiffableDataSource reorderingHandlers](*p_diffableDataSource, "reorderingHandlers"));
  objc_msgSend(v8, "setDidReorderHandler:", v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (ICCollectionView)initWithPresentingViewController:(id)a3 legacyManagedObjectContext:(id)a4 modernManagedObjectContext:(id)a5 viewControllerManager:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  ICCollectionView *v15;
  void *v16;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView createLayout](self, "createLayout"));
  v18.receiver = self;
  v18.super_class = (Class)ICCollectionView;
  v15 = -[ICCollectionView initWithFrame:collectionViewLayout:](&v18, "initWithFrame:collectionViewLayout:", v14, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

  if (v15)
  {
    objc_storeWeak((id *)&v15->_presentingViewController, v10);
    objc_storeStrong((id *)&v15->_legacyManagedObjectContext, a4);
    objc_storeStrong((id *)&v15->_modernManagedObjectContext, a5);
    objc_storeWeak((id *)&v15->_viewControllerManager, v13);
    -[ICCollectionView setAlwaysBounceVertical:](v15, "setAlwaysBounceVertical:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor ICGroupedBackgroundColor](UIColor, "ICGroupedBackgroundColor"));
    -[ICCollectionView setBackgroundColor:](v15, "setBackgroundColor:", v16);

    -[ICCollectionView setShowsHorizontalScrollIndicator:](v15, "setShowsHorizontalScrollIndicator:", 0);
    -[ICCollectionView setDragInteractionEnabled:](v15, "setDragInteractionEnabled:", 1);
    -[ICCollectionView setDragDelegate:](v15, "setDragDelegate:", v15);
    -[ICCollectionView setDropDelegate:](v15, "setDropDelegate:", v15);
    -[ICCollectionView setAllowsFocus:](v15, "setAllowsFocus:", 1);
  }

  return v15;
}

- (id)trailingSwipeActionsConfigurationProvider
{
  _QWORD *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000AB8E4;
  v4[3] = &unk_1005537F0;
  objc_copyWeak(&v5, &location);
  v2 = objc_retainBlock(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (void)setOptimisticallyAppliedSnapshotHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)leadingSwipeActionsConfigurationProvider
{
  _QWORD *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000AB780;
  v4[3] = &unk_1005537F0;
  objc_copyWeak(&v5, &location);
  v2 = objc_retainBlock(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (id)createLayout
{
  return objc_alloc_init((Class)UICollectionViewFlowLayout);
}

- (BOOL)canFocusItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unsigned __int8 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView cellForItemAtIndexPath:](self, "cellForItemAtIndexPath:", v4));
  v6 = objc_opt_class(ICTagContainerCell);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
  {
    v8 = objc_opt_class(ICFolderOutlineCollectionViewCell);
    if ((objc_opt_isKindOfClass(v5, v8) & 1) != 0)
    {
      v9 = objc_claimAutoreleasedReturnValue(-[ICCollectionView diffableDataSource](self, "diffableDataSource"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v9, "itemIdentifierForIndexPath:", v4));

      v11 = objc_opt_class(ICAccount);
      LOBYTE(v9) = objc_opt_isKindOfClass(v10, v11);

      if ((v9 & 1) == 0)
      {
LABEL_5:
        v7 = 1;
        goto LABEL_8;
      }
    }
    else
    {
      v12 = objc_opt_class(ICOutlineParentCollectionViewCell);
      if ((objc_opt_isKindOfClass(v5, v12) & 1) == 0)
        goto LABEL_5;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accessories"));
    v7 = objc_msgSend(v13, "ic_containsObjectPassingTest:", &stru_100553508);

    goto LABEL_8;
  }
  v7 = 0;
LABEL_8:

  return v7;
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4
{
  return -[ICCollectionView previewParametersWithCollectionView:atIndexPath:](self, "previewParametersWithCollectionView:atIndexPath:", a3, a4);
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v7;
  id v8;
  ICDragSessionContext *v9;
  void *v10;
  void *v11;
  ICDragSessionContext *v12;
  void *v13;

  v7 = a5;
  v8 = a4;
  v9 = [ICDragSessionContext alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView modernManagedObjectContext](self, "modernManagedObjectContext"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView legacyManagedObjectContext](self, "legacyManagedObjectContext"));
  v12 = -[ICDragSessionContext initWithModernManagedObjectContext:legacyManagedObjectContext:](v9, "initWithModernManagedObjectContext:legacyManagedObjectContext:", v10, v11);

  objc_msgSend(v8, "setLocalContext:", v12);
  -[ICCollectionView setCurrentDragSessionContext:](self, "setCurrentDragSessionContext:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView dragItemsForIndexPath:sessionContext:](self, "dragItemsForIndexPath:sessionContext:", v7, v12));

  return v13;
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *v28;
  _BYTE v29[128];

  v5 = a4;
  v6 = objc_opt_class(ICDragSessionContext);
  v23 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localContext"));
  v8 = ICDynamicCast(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentSourceObjectIDs"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v15, "ic_isEntityOfClass:", objc_opt_class(ICFolder)))
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView diffableDataSource](self, "diffableDataSource"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "snapshot"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "sectionIdentifierForSectionContainingItemIdentifier:", v15));

          v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView diffableDataSource](self, "diffableDataSource"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "snapshotForSection:", v18));

          if (objc_msgSend(v20, "isExpanded:", v15))
          {
            v28 = v15;
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
            objc_msgSend(v20, "collapseItems:", v21);

            v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView diffableDataSource](self, "diffableDataSource"));
            objc_msgSend(v22, "applySnapshot:toSection:animatingDifferences:", v20, v18, 1);

            objc_msgSend(v9, "setAutoCollapsedFolderObjectID:", v15);
          }

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v12);
  }

}

- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v8 = a5;
  v9 = a4;
  v10 = objc_opt_class(ICDragSessionContext);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localContext"));

  v12 = ICDynamicCast(v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView dragItemsForIndexPath:sessionContext:](self, "dragItemsForIndexPath:sessionContext:", v8, v13));

  return v14;
}

- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a4;
  v6 = objc_opt_class(ICDragSessionContext);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localContext"));

  v8 = ICDynamicCast(v6, v7);
  v11 = (id)objc_claimAutoreleasedReturnValue(v8);

  objc_msgSend(v11, "updateDropTargetCellsForPinNoteDrop:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "autoCollapsedFolderObjectID"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "autoCollapsedFolderObjectID"));
    -[ICCollectionView reExpandFolderWithObjectID:](self, "reExpandFolderWithObjectID:", v10);

  }
  -[ICCollectionView setCurrentDragSessionContext:](self, "setCurrentDragSessionContext:", 0);

}

- (int64_t)_collectionView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5
{
  return -[ICCollectionView dataOwnerForIndexPath:](self, "dataOwnerForIndexPath:", a5, a4);
}

- (int64_t)_collectionView:(id)a3 dataOwnerForDropSession:(id)a4 withDestinationIndexPath:(id)a5
{
  return -[ICCollectionView dataOwnerForIndexPath:](self, "dataOwnerForIndexPath:", a5, a4);
}

- (id)collectionView:(id)a3 dropPreviewParametersForItemAtIndexPath:(id)a4
{
  return -[ICCollectionView previewParametersWithCollectionView:atIndexPath:](self, "previewParametersWithCollectionView:atIndexPath:", a3, a4);
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  double v49;
  double v50;
  BOOL v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  void *v59;
  unsigned __int8 v60;
  unsigned int v61;
  id v62;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  __int128 v71;
  _QWORD v72[5];
  _QWORD v73[5];
  void *v74;
  void *v75;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = objc_opt_class(ICDragSessionContext);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localDragSession"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localContext"));
  v14 = ICDynamicCast(v11, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  objc_msgSend(v15, "updateDropTargetCellsForPinNoteDrop:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currentSourceObjectIDs"));
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = sub_1000A7468;
  v73[3] = &unk_100553530;
  v73[4] = self;
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ic_compactMap:", v73));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView diffableDataSource](self, "diffableDataSource"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "itemIdentifierForIndexPath:", v9));

  v19 = objc_opt_class(NSManagedObjectID);
  v20 = ICDynamicCast(v19, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v68 = v18;
  if ((objc_msgSend(v21, "ic_isModernType") & 1) != 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView modernManagedObjectContext](self, "modernManagedObjectContext"));
LABEL_5:
    v23 = v22;
    v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectWithID:", v21));

    goto LABEL_7;
  }
  if (objc_msgSend(v21, "ic_isLegacyType"))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView legacyManagedObjectContext](self, "legacyManagedObjectContext"));
    goto LABEL_5;
  }
  v24 = v18;
LABEL_7:
  v25 = objc_opt_class(ICCloudSyncingObject);
  v26 = ICDynamicCast(v25, v24);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v28 = objc_opt_class(ICFolder);
  v29 = ICDynamicCast(v28, v24);
  *((_QWORD *)&v71 + 1) = objc_claimAutoreleasedReturnValue(v29);
  v30 = objc_opt_class(ICNote);
  v31 = ICDynamicCast(v30, v24);
  v69 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v32 = objc_opt_class(ICVirtualSmartFolderItemIdentifier);
  v33 = ICDynamicCast(v32, v24);
  *(_QWORD *)&v71 = objc_claimAutoreleasedReturnValue(v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "parentCloudObject"));
  v35 = v34;
  if (v34)
    v36 = v34;
  else
    v36 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "cloudAccount"));
  v67 = v36;

  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cellForItemAtIndexPath:", v9));
  if (v24 && v37)
  {
    if (objc_msgSend(v15, "dragSessionType") == (id)1)
    {
      v66 = v8;
      if (v71 != 0)
      {
LABEL_14:
        v38 = objc_msgSend(objc_alloc((Class)ICMoveDecision), "initWithSourceObjects:destination:", v70, v24);
        v39 = objc_msgSend(v38, "shouldMove");
        if (v39)
          v40 = 3;
        else
          v40 = 1;
        if (v39)
          v41 = 2;
        else
          v41 = 0;

LABEL_30:
        v8 = v66;
        if (v40 == 1 || !v41)
          goto LABEL_51;
        if (v71 == 0)
        {
          if (!v69)
          {
            v41 = 2;
            goto LABEL_51;
          }
          v52 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView diffableDataSource](self, "diffableDataSource"));
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "snapshot"));

          v65 = v53;
          v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "sectionIdentifierForSectionContainingItemIdentifier:", v68));
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currentSourceObjectIDs"));
          v55 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView movableNoteObjectIDsIn:forDropIntoSection:](self, "movableNoteObjectIDsIn:forDropIntoSection:", v54, v64));

          if (objc_msgSend(v55, "count"))
          {
            v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "itemIdentifiersInSectionWithIdentifier:", v64));
            v72[0] = _NSConcreteStackBlock;
            v72[1] = 3221225472;
            v72[2] = sub_1000A74D0;
            v72[3] = &unk_100553558;
            v72[4] = self;
            v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "ic_compactMap:", v72));
            objc_msgSend(v15, "setCurrentDropTargetCells:", v57);

            objc_msgSend(v15, "setCurrentDropTargetItemIDs:", v56);
            objc_msgSend(v15, "updateDropTargetCellsForPinNoteDrop:", 1);

          }
          v41 = 2;
          v48 = v65;
          v8 = v66;
        }
        else
        {
          v75 = v37;
          v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v75, 1));
          objc_msgSend(v15, "setCurrentDropTargetCells:", v47);

          v74 = v68;
          v48 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v74, 1));
          objc_msgSend(v15, "setCurrentDropTargetItemIDs:", v48);
          v41 = 2;
        }
        goto LABEL_50;
      }
      if (v69)
      {
        v41 = 2;
        v40 = 3;
        goto LABEL_30;
      }
      goto LABEL_34;
    }
    v41 = 0;
    v40 = 1;
    if (objc_msgSend(v15, "dragSessionType") != (id)2 || !*((_QWORD *)&v71 + 1))
      goto LABEL_51;
    if ((objc_msgSend(*((id *)&v71 + 1), "isSystemFolder") & 1) != 0)
    {
      if (!objc_msgSend(*((id *)&v71 + 1), "isDefaultFolderForAccount"))
      {
        v41 = 0;
        v40 = 1;
        goto LABEL_51;
      }
      v66 = v8;
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)&v71 + 1), "account"));
      v46 = objc_msgSend(v45, "visibleCustomFoldersCount");

      if (v46)
      {
LABEL_34:
        v41 = 0;
        v40 = 1;
        v8 = v66;
LABEL_51:
        v42 = objc_alloc((Class)UICollectionViewDropProposal);
        v43 = v40;
        v44 = v41;
        goto LABEL_52;
      }
    }
    else
    {
      v66 = v8;
      objc_msgSend(v8, "locationInView:", v37);
      v50 = v49;
      if (v49 <= 0.0 || v49 >= 16.0)
      {
        objc_msgSend(v37, "frame");
        v51 = v50 <= v58 + -16.0;
      }
      else
      {
        v51 = 0;
      }
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currentSourceObjectIDs"));
      v60 = objc_msgSend(v59, "containsObject:", v21);

      if (!v51 && (v60 & 1) == 0)
        goto LABEL_14;
    }
    v48 = objc_msgSend(objc_alloc((Class)ICMoveDecision), "initWithSourceObjects:destination:", v70, v67);
    v61 = objc_msgSend(v48, "shouldMove");
    if (v61)
      v40 = 3;
    else
      v40 = 1;
    v41 = v61;
    v8 = v66;
LABEL_50:

    goto LABEL_51;
  }
  v42 = objc_alloc((Class)UICollectionViewDropProposal);
  v43 = 1;
  v44 = 0;
LABEL_52:
  v62 = objc_msgSend(v42, "initWithDropOperation:intent:", v43, v44);

  return v62;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  unsigned __int8 v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  unsigned int v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  ICMoveDecisionController *v62;
  void *v63;
  ICMoveDecisionController *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  ICCollectionView *v92;
  _QWORD v93[5];
  _QWORD v94[5];
  id v95;
  id v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];

  v5 = a4;
  v6 = objc_opt_class(ICDragSessionContext);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "session"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localDragSession"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localContext"));
  v10 = ICDynamicCast(v6, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "proposal"));
  v13 = objc_msgSend(v12, "operation");

  if (v13 == (id)3)
  {
    v90 = v11;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "session"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localDragSession"));
    v92 = self;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView sourceObjectIDsForDragSession:](self, "sourceObjectIDsForDragSession:", v15));

    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "destinationIndexPath"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v97 = 0u;
    v98 = 0u;
    v99 = 0u;
    v100 = 0u;
    v19 = v16;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v97, v101, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v98;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(_QWORD *)v98 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * (_QWORD)i);
          v25 = objc_msgSend(v24, "ic_isEntityOfClass:", objc_opt_class(ICNote));
          v26 = v17;
          if ((v25 & 1) == 0)
          {
            v27 = objc_msgSend(v24, "ic_isEntityOfClass:", objc_opt_class(ICFolder));
            v26 = v18;
            if (!v27)
              continue;
          }
          objc_msgSend(v26, "addObject:", v24);
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v97, v101, 16);
      }
      while (v21);
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView diffableDataSource](v92, "diffableDataSource"));
    v29 = v91;
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "itemIdentifierForIndexPath:", v91));

    v31 = objc_opt_class(NSManagedObjectID);
    v32 = ICDynamicCast(v31, v30);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v34 = objc_opt_class(ICVirtualSmartFolderItemIdentifier);
    v35 = ICDynamicCast(v34, v30);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    if (objc_msgSend(v17, "count") && objc_msgSend(v18, "count"))
    {
      v11 = v90;
LABEL_50:

      goto LABEL_51;
    }
    v11 = v90;
    if (!objc_msgSend(v17, "count") && !objc_msgSend(v18, "count")
      || (objc_msgSend(v33, "ic_isModernFolderType") & 1) == 0
      && (objc_msgSend(v33, "ic_isModernNoteType") & 1) == 0
      && !v36)
    {
      goto LABEL_50;
    }
    if (objc_msgSend(v18, "count"))
    {
      if (!objc_msgSend(v33, "ic_isModernFolderType"))
        goto LABEL_50;
      v88 = v36;
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "proposal"));
      v38 = objc_msgSend(v37, "intent");

      if (v38 == (id)2)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "currentDropTargetItemIDs"));
        v40 = objc_msgSend(v39, "count");

        if (v40 == (id)1)
        {
          v41 = objc_opt_class(NSManagedObjectID);
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "currentDropTargetItemIDs"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "firstObject"));
          v44 = ICDynamicCast(v41, v43);
          v45 = objc_claimAutoreleasedReturnValue(v44);

          v33 = (void *)v45;
        }
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "autoCollapsedFolderObjectID"));
        v47 = objc_msgSend(v18, "containsObject:", v46);

        if (v47)
          objc_msgSend(v90, "setAutoCollapsedFolderObjectID:", 0);
        -[ICCollectionView performDropOfFolderObjectIDs:atFolderObjectID:atIndex:](v92, "performDropOfFolderObjectIDs:atFolderObjectID:atIndex:", v18, v33, 0);
        goto LABEL_49;
      }
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView modernManagedObjectContext](v92, "modernManagedObjectContext"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectWithID:", v33));

      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "parent"));
      v59 = v58;
      if (v58)
        v60 = v58;
      else
        v60 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "account"));
      v84 = v60;

      v85 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView diffableDataSource](v92, "diffableDataSource"));
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "snapshot"));
      v86 = v57;
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectID"));
      v69 = objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "sectionIdentifierForSectionContainingItemIdentifier:", v68));

      v70 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView diffableDataSource](v92, "diffableDataSource"));
      v83 = (void *)v69;
      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "snapshotForSection:", v69));

      v72 = objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "parentOfChild:", v33));
      v82 = (void *)v72;
      if (objc_msgSend(v71, "containsItem:", v72))
        v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "childrenOfParent:", v72));
      else
        v73 = &__NSArray0__struct;
      v81 = v73;
      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "objectID"));
      v75 = objc_msgSend(v73, "indexOfObject:", v74);

      if (v75 == (id)0x7FFFFFFFFFFFFFFFLL)
        v76 = 0;
      else
        v76 = v75;
      v79 = v76;
      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "objectID"));
      v80 = -[ICCollectionView actualChildIndexForSnapshotIndex:inDestinationObjectID:sectionSnapshot:](v92, "actualChildIndexForSnapshotIndex:inDestinationObjectID:sectionSnapshot:", v79, v77, v71);

      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "objectID"));
      -[ICCollectionView performDropOfFolderObjectIDs:atFolderObjectID:atIndex:](v92, "performDropOfFolderObjectIDs:atFolderObjectID:atIndex:", v18, v78, v80);

    }
    else
    {
      if (!objc_msgSend(v17, "count"))
        goto LABEL_50;
      if (!objc_msgSend(v33, "ic_isModernNoteType"))
      {
        if ((objc_msgSend(v33, "ic_isFolderType") & 1) != 0 || v36)
        {
          v89 = v36;
          v93[0] = _NSConcreteStackBlock;
          v93[1] = 3221225472;
          v93[2] = sub_1000A7ED8;
          v93[3] = &unk_1005535A0;
          v93[4] = v92;
          v61 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "ic_map:", v93));
          v62 = [ICMoveDecisionController alloc];
          v63 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView presentingViewController](v92, "presentingViewController"));
          v87 = (void *)v61;
          v64 = -[ICMoveDecisionController initWithSourceObjects:presentingViewController:](v62, "initWithSourceObjects:presentingViewController:", v61, v63);

          if (v33)
          {
            v65 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView modernManagedObjectContext](v92, "modernManagedObjectContext"));
            v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "objectWithID:", v33));
            -[ICMoveDecisionController setDestination:](v64, "setDestination:", v66);

            v11 = v90;
            v29 = v91;
            v36 = v89;
          }
          else
          {
            v36 = v89;
            -[ICMoveDecisionController setDestination:](v64, "setDestination:", v89);
            v29 = v91;
          }
          -[ICMoveDecisionController performDecisionWithCompletion:](v64, "performDecisionWithCompletion:", 0);

        }
        goto LABEL_50;
      }
      v88 = v36;
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView diffableDataSource](v92, "diffableDataSource"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "snapshot"));

      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "sectionIdentifiers"));
      v51 = objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectAtIndexedSubscript:", objc_msgSend(v91, "section")));

      v86 = v49;
      v52 = v49;
      v53 = (void *)v51;
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "sectionIdentifiers"));
      LODWORD(v51) = objc_msgSend(v54, "ic_containsObjectPassingTest:", &stru_100553578);

      if ((_DWORD)v51)
      {
        v55 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView modernManagedObjectContext](v92, "modernManagedObjectContext"));
        v94[0] = _NSConcreteStackBlock;
        v94[1] = 3221225472;
        v94[2] = sub_1000A7D5C;
        v94[3] = &unk_100550020;
        v94[4] = v92;
        v95 = v19;
        v96 = v53;
        objc_msgSend(v55, "performBlockAndWait:", v94);

      }
    }

LABEL_49:
    v29 = v91;
    v36 = v88;
    goto LABEL_50;
  }
LABEL_51:

}

- (id)customAccessibilityActionsForObjectID:(id)a3 galleryView:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  if (objc_msgSend(v6, "ic_isModernFolderType"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView modernManagedObjectContext](self, "modernManagedObjectContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectWithID:", v6));

    if (v4)
      v10 = objc_claimAutoreleasedReturnValue(-[ICCollectionView galleryViewAcessibilityActionsForFolder:](self, "galleryViewAcessibilityActionsForFolder:", v9));
    else
      v10 = objc_claimAutoreleasedReturnValue(-[ICCollectionView commonAccessibilityActionsForFolder:](self, "commonAccessibilityActionsForFolder:", v9));
    goto LABEL_9;
  }
  if (objc_msgSend(v6, "ic_isNoteType"))
  {
    if (!v4 || !objc_msgSend(v6, "ic_isModernNoteType"))
    {
      v9 = v7;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView commonAcessibilityActionsForNoteWithObjectID:](self, "commonAcessibilityActionsForNoteWithObjectID:", v6));
      goto LABEL_11;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView modernManagedObjectContext](self, "modernManagedObjectContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectWithID:", v6));

    v10 = objc_claimAutoreleasedReturnValue(-[ICCollectionView galleryViewAcessibilityActionsForNote:](self, "galleryViewAcessibilityActionsForNote:", v9));
LABEL_9:
    v12 = (void *)v10;

    v7 = v12;
LABEL_11:

  }
  return v7;
}

- (id)contextMenuConfigurationForItemsAtIndexPaths:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  char v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  void *v30;
  void *v31;
  id obj;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[4];
  id v37;
  ICCollectionView *v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  char v44;
  char v45;
  char v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    if (objc_msgSend(v4, "count") == (id)1)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView contextMenuConfigurationForIndexPath:](self, "contextMenuConfigurationForIndexPath:", v5));
LABEL_34:

      goto LABEL_35;
    }
    v7 = objc_msgSend(v4, "count") != 0;
    v8 = objc_msgSend(v4, "count") != 0;
    v9 = objc_msgSend(v4, "count") != 0;
    v10 = objc_msgSend(v4, "count") != 0;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v29 = v4;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    obj = v4;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (!v11)
    {
      v34 = 0;
      v35 = 0;
LABEL_27:

      if ((v9 & 1) != 0 || (v8 & 1) != 0 || (v7 & 1) != 0 || (v10 & 1) != 0)
      {
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_1000A84B4;
        v36[3] = &unk_100553650;
        v43 = v10 & 1;
        v27 = v30;
        v37 = v30;
        v38 = self;
        v41 = v34;
        v42 = v35;
        v44 = v7 & 1;
        v39 = obj;
        v5 = v31;
        v40 = v31;
        v45 = v8 & 1;
        v46 = v9 & 1;
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", 0, &stru_1005535E0, v36));

        v4 = v29;
      }
      else
      {
        v6 = 0;
        v4 = v29;
        v27 = v30;
        v5 = v31;
      }

      goto LABEL_34;
    }
    v12 = v11;
    v34 = 0;
    v35 = 0;
    v33 = *(_QWORD *)v48;
LABEL_7:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v48 != v33)
        objc_enumerationMutation(obj);
      v14 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView diffableDataSource](self, "diffableDataSource", v29));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "itemIdentifierForIndexPath:", v14));

      v17 = objc_opt_class(NSManagedObjectID);
      if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
      {
        v18 = v16;
      }
      else
      {
        v19 = objc_opt_class(ICSearchResult);
        if ((objc_opt_isKindOfClass(v16, v19) & 1) != 0)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "object"));
          v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectID"));

        }
        else
        {
          v18 = 0;
        }
      }
      if (objc_msgSend(v18, "ic_isNoteType"))
        break;
      if (objc_msgSend(v18, "ic_isInvitationType"))
      {
        v22 = v10;
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView modernManagedObjectContext](self, "modernManagedObjectContext"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectWithID:", v18));

        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "highlight"));
        v10 = v22 & (v25 != 0);

        objc_msgSend(v30, "ic_addNonNilObject:", v24);
        v9 = 0;
        v8 = 0;
        v7 = 0;
LABEL_22:

      }
      if (v12 == (id)++v13)
      {
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
        if (!v12)
          goto LABEL_27;
        goto LABEL_7;
      }
    }
    if ((objc_msgSend(v18, "ic_isModernNoteType") & 1) != 0)
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView modernManagedObjectContext](self, "modernManagedObjectContext"));
    else
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView legacyManagedObjectContext](self, "legacyManagedObjectContext"));
    v26 = v21;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectWithID:", v18));

    v7 &= objc_msgSend(v24, "isPinnable");
    v8 &= objc_msgSend(v24, "isMovable");
    v9 &= objc_msgSend(v24, "isDeletable");
    v34 += objc_msgSend(v24, "isPinned");
    ++v35;
    objc_msgSend(v31, "ic_addNonNilObject:", v24);
    v10 = 0;
    goto LABEL_22;
  }
  v6 = 0;
LABEL_35:

  return v6;
}

- (id)contextMenuConfigurationForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v30[4];
  id v31;
  ICCollectionView *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView diffableDataSource](self, "diffableDataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemIdentifierForIndexPath:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView cellForItemIdentifier:](self, "cellForItemIdentifier:", v6));
  v8 = ICProtocolCast(&OBJC_PROTOCOL___ICContextMenuInteractionPreviewProviding, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contextMenuInteractionPreview"));
  v11 = (void *)v10;
  if (v10)
    v12 = (void *)v10;
  else
    v12 = v7;
  v13 = v12;

  v14 = objc_opt_class(NSManagedObjectID);
  if ((objc_opt_isKindOfClass(v6, v14) & 1) != 0)
  {
    v15 = v6;
    if (!v15)
      goto LABEL_26;
  }
  else
  {
    v16 = objc_opt_class(ICSearchResult);
    if ((objc_opt_isKindOfClass(v6, v16) & 1) == 0)
    {
      v24 = 0;
      v25 = 0;
      v15 = 0;
LABEL_27:
      v26 = 0;
      v23 = 0;
      goto LABEL_28;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "object"));
    v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectID"));

    if (!v15)
      goto LABEL_26;
  }
  if (objc_msgSend(v15, "ic_isAttachmentType"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView modernManagedObjectContext](self, "modernManagedObjectContext"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectWithID:", v15));

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "note"));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectID"));

    v15 = (id)v21;
  }
  if (objc_msgSend(v15, "ic_isInvitationType"))
  {
    v22 = (id)objc_claimAutoreleasedReturnValue(-[ICCollectionView modernManagedObjectContext](self, "modernManagedObjectContext"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectWithID:", v15));
    v24 = 0;
    v25 = 0;
    v26 = 0;
    goto LABEL_24;
  }
  if (objc_msgSend(v15, "ic_isModernFolderType"))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView modernManagedObjectContext](self, "modernManagedObjectContext"));
    v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectWithID:", v15));

    if (objc_msgSend(v22, "isModernCustomFolder"))
    {
      v22 = v22;
      v24 = 0;
      v25 = 0;
      v23 = 0;
      v26 = v22;
      goto LABEL_24;
    }
    v24 = 0;
    goto LABEL_22;
  }
  if (!objc_msgSend(v15, "ic_isModernNoteType"))
  {
    if (objc_msgSend(v15, "ic_isLegacyNoteType"))
    {
      v22 = (id)objc_claimAutoreleasedReturnValue(-[ICCollectionView legacyManagedObjectContext](self, "legacyManagedObjectContext"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectWithID:", v15));
LABEL_22:
      v25 = 0;
      goto LABEL_23;
    }
LABEL_26:
    v24 = 0;
    v25 = 0;
    goto LABEL_27;
  }
  v22 = (id)objc_claimAutoreleasedReturnValue(-[ICCollectionView modernManagedObjectContext](self, "modernManagedObjectContext"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectWithID:", v15));
  v24 = 0;
LABEL_23:
  v26 = 0;
  v23 = 0;
LABEL_24:

  if (!v23)
  {
LABEL_28:
    if (!v26 && !v25 && !v24)
      goto LABEL_32;
  }
  if ((objc_msgSend(v26, "isUnsupported") & 1) == 0)
  {
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1000A8DB8;
    v37[3] = &unk_100553678;
    v38 = v23;
    v39 = v26;
    v40 = v25;
    v41 = v24;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000A8E50;
    v30[3] = &unk_1005536A0;
    v31 = v38;
    v32 = self;
    v33 = v13;
    v34 = v39;
    v35 = v40;
    v36 = v41;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", v6, v37, v30));

    goto LABEL_34;
  }
LABEL_32:
  v28 = 0;
LABEL_34:

  return v28;
}

- (id)contextMenuPreviewForHighlightingMenuWithConfiguration:(id)a3 indexPath:(id)a4
{
  return -[ICCollectionView contextMenuPreviewWithConfiguration:indexPath:](self, "contextMenuPreviewWithConfiguration:indexPath:", a3, a4);
}

- (id)contextMenuPreviewForDismissingContextMenuWithConfiguration:(id)a3 indexPath:(id)a4
{
  return -[ICCollectionView contextMenuPreviewWithConfiguration:indexPath:](self, "contextMenuPreviewWithConfiguration:indexPath:", a3, a4);
}

- (id)multiSelectionContextMenuPreviewForHighlightingItemAtIndexPath:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView cellForItemAtIndexPath:](self, "cellForItemAtIndexPath:", a3));
  v4 = ICProtocolCast(&OBJC_PROTOCOL___ICContextMenuInteractionPreviewProviding, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contextMenuInteractionPreview"));
  v7 = (void *)v6;
  if (v6)
    v8 = (void *)v6;
  else
    v8 = v3;
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window"));
  if (v10)
    v11 = objc_msgSend(objc_alloc((Class)UITargetedPreview), "initWithView:", v9);
  else
    v11 = 0;

  return v11;
}

- (void)contextMenuWillPerformPreviewActionForMenuWithConfiguration:(id)a3 animator:(id)a4
{
  id v6;
  id v7;
  id v8;
  void ***v9;
  void *v10;
  id v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  ICCollectionView *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_1000A9078;
  v15 = &unk_10054FE80;
  v16 = self;
  v17 = v6;
  v8 = v6;
  v9 = objc_retainBlock(&v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView viewControllerManager](self, "viewControllerManager", v12, v13, v14, v15, v16));
  v11 = objc_msgSend(v10, "noteContainerViewMode");

  if (v11 == (id)1)
    objc_msgSend(v7, "addAnimations:", v9);
  else
    ((void (*)(void ***))v9[2])(v9);

}

- (BOOL)sourceObjectIDsContainsSystemPaperNotes:(id)a3
{
  void *v3;
  unsigned __int8 v4;
  _QWORD v6[5];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000A9260;
  v6[3] = &unk_1005536C8;
  v6[4] = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "ic_compactMap:", v6));
  v4 = objc_msgSend(v3, "ic_containsObjectPassingTest:", &stru_1005536E8);

  return v4;
}

- (void)reloadCellAfterDelayForObjectID:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000A934C;
  v4[3] = &unk_10054FE80;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatchMainAfterDelay(v4, 0.4);

}

- (unint64_t)actualChildIndexForSnapshotIndex:(unint64_t)a3 inDestinationObjectID:(id)a4 sectionSnapshot:(id)a5
{
  id v8;
  id v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;

  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "ic_isEntityOfClass:", objc_opt_class(ICAccount)))
  {
    v10 = objc_msgSend(v9, "containsItem:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView modernManagedObjectContext](self, "modernManagedObjectContext"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectWithID:", v8));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "defaultFolder"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectID"));

    v15 = objc_msgSend(v9, "containsItem:", v14);
    if (a3)
      v16 = v10;
    else
      v16 = 0;
    if (a3)
      v17 = v15;
    else
      v17 = 0;
    a3 = a3 - v16 - v17;

  }
  return a3;
}

- (id)sourceObjectIDsForDragSession:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "items"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ic_compactMap:", &stru_100553728));

  return v4;
}

- (id)dragItemsForIndexPath:(id)a3 sessionContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView diffableDataSource](self, "diffableDataSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "itemIdentifierForIndexPath:", v7));

  if (-[ICCollectionView isCellDraggableForIdentifier:](self, "isCellDraggableForIdentifier:", v9)
    && (v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "addItemIdentifierIfAppropriate:isEditingCollectionView:", v9, -[ICCollectionView isEditing](self, "isEditing")))) != 0)
  {
    v11 = (void *)v10;
    v14 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));

  }
  else
  {
    v12 = &__NSArray0__struct;
  }

  return v12;
}

- (BOOL)isCellDraggableForIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  unsigned __int8 v21;
  unsigned __int8 v22;
  unsigned int v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView cellForItemIdentifier:](self, "cellForItemIdentifier:", v4));
  if (!objc_msgSend(v5, "isUserInteractionEnabled")
    || (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___ICSectionIdentifier) & 1) != 0
    || (v6 = objc_opt_class(ICTagContainerItemIdentifier), (objc_opt_isKindOfClass(v4, v6) & 1) != 0)
    || (v7 = objc_opt_class(ICVirtualSmartFolderItemIdentifier), (objc_opt_isKindOfClass(v4, v7) & 1) != 0)
    || (v8 = objc_opt_class(ICTagDetailItemIdentifier), (objc_opt_isKindOfClass(v4, v8) & 1) != 0))
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    v9 = +[ICTagCoreDataIndexer isTagItemIdentifier:](ICTagCoreDataIndexer, "isTagItemIdentifier:", v4) ^ 1;
  }
  v10 = objc_opt_class(ICFolderOutlineCollectionViewCell);
  v11 = ICDynamicCast(v10, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  if (v12)
  {
    v13 = objc_opt_class(ICAccount);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "noteContainer"));
    v15 = ICDynamicCast(v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

    v17 = objc_opt_class(ICFolder);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "noteContainer"));
    v19 = ICDynamicCast(v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

    if (-[ICCollectionView isEditing](self, "isEditing"))
      v21 = objc_msgSend(v12, "allowsEditing");
    else
      v21 = 1;
    if (v16)
      v22 = 0;
    else
      v22 = v21;
    if (v20)
      v23 = objc_msgSend(v20, "isSystemFolder") ^ 1;
    else
      LOBYTE(v23) = 1;
    LOBYTE(v9) = v9 & v23 & v22;

  }
  return v9;
}

- (BOOL)isCellReorderableForIdentifier:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unsigned __int8 v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView cellForItemIdentifier:](self, "cellForItemIdentifier:", a3));
  v5 = objc_opt_class(ICFolderOutlineCollectionViewCell);
  v6 = ICDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_opt_class(ICFolderOutlineCollectionViewCell);
  if ((objc_opt_isKindOfClass(v4, v8) & 1) != 0 && objc_msgSend(v7, "allowsEditing"))
    v9 = -[ICCollectionView isEditing](self, "isEditing");
  else
    v9 = 0;

  return v9;
}

- (int64_t)dataOwnerForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  int64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView diffableDataSource](self, "diffableDataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemIdentifierForIndexPath:", v4));

  v7 = objc_opt_class(ICSearchResult);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "object"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectID"));

    v6 = (void *)v9;
  }
  v10 = objc_opt_class(NSManagedObjectID);
  if ((objc_opt_isKindOfClass(v6, v10) & 1) == 0)
    goto LABEL_15;
  v11 = v6;
  if (!objc_msgSend(v11, "ic_isInvitationType")
    && !objc_msgSend(v11, "ic_isModernFolderType"))
  {
    if (objc_msgSend(v11, "ic_isModernNoteType"))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView modernManagedObjectContext](self, "modernManagedObjectContext"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "ic_existingObjectWithID:", v11));

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "folder"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "account"));
      v21 = objc_msgSend(v20, "isManaged");

      if ((v21 & 1) != 0)
        goto LABEL_7;
    }
    else if ((objc_msgSend(v11, "ic_isAttachmentType") & 1) != 0)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView modernManagedObjectContext](self, "modernManagedObjectContext"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "ic_existingObjectWithID:", v11));

      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "note"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "folder"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "account"));
      v27 = objc_msgSend(v26, "isManaged");

      if (v27)
        goto LABEL_7;
    }
    else
    {

    }
LABEL_15:
    v16 = 1;
    goto LABEL_16;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView modernManagedObjectContext](self, "modernManagedObjectContext"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ic_existingObjectWithID:", v11));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "account"));
  v15 = objc_msgSend(v14, "isManaged");

  if ((v15 & 1) == 0)
    goto LABEL_15;
LABEL_7:
  v16 = 2;
LABEL_16:

  return v16;
}

- (void)reExpandFolderWithObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView currentDragSessionContext](self, "currentDragSessionContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "autoCollapsedFolderObjectID"));
  v7 = objc_msgSend(v6, "isEqual:", v4);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView diffableDataSource](self, "diffableDataSource"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "snapshot"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sectionIdentifierForSectionContainingItemIdentifier:", v4));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView diffableDataSource](self, "diffableDataSource"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "snapshotForSection:", v10));

    v16 = v4;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
    objc_msgSend(v12, "expandItems:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView diffableDataSource](self, "diffableDataSource"));
    objc_msgSend(v14, "applySnapshot:toSection:animatingDifferences:", v12, v10, 1);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView currentDragSessionContext](self, "currentDragSessionContext"));
    objc_msgSend(v15, "setAutoCollapsedFolderObjectID:", 0);

  }
}

- (id)movableNoteObjectIDsIn:(id)a3 forDropIntoSection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  BOOL v11;

  v6 = a4;
  v7 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000A9D84;
  v10[3] = &unk_100553750;
  v10[4] = self;
  v11 = objc_msgSend(v6, "sectionType") == (id)3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ic_compactMap:", v10));

  return v8;
}

- (void)performDropOfFolderObjectIDs:(id)a3 atFolderObjectID:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  unint64_t v15;

  v11 = a3;
  v8 = a4;
  v9 = objc_msgSend(v11, "count");
  if (v8 && v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView modernManagedObjectContext](self, "modernManagedObjectContext"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000A9F10;
    v12[3] = &unk_100553778;
    v12[4] = self;
    v13 = v8;
    v14 = v11;
    v15 = a5;
    objc_msgSend(v10, "performBlockAndWait:", v12);

  }
}

- (CGRect)presentationSourceRectForCell:(id)a3
{
  id v4;
  double v5;
  double v6;
  CGFloat Width;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double Height;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect v21;
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "frame");
  -[ICCollectionView convertPoint:toView:](self, "convertPoint:toView:", self);
  v6 = v5;
  -[ICCollectionView bounds](self, "bounds");
  Width = CGRectGetWidth(v20);
  objc_msgSend(v4, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v21.origin.x = v9;
  v21.origin.y = v11;
  v21.size.width = v13;
  v21.size.height = v15;
  Height = CGRectGetHeight(v21);
  v17 = 0.0;
  v18 = v6;
  v19 = Width;
  result.size.height = Height;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (id)contextMenuForInvitation:(id)a3 sourceView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void **v13;
  uint64_t v14;
  id (*v15)(uint64_t);
  void *v16;
  ICCollectionView *v17;
  id v18;
  _QWORD v19[5];
  id v20;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "highlight"));

  if (v7)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000AA668;
    v19[3] = &unk_100550A48;
    v19[4] = self;
    v8 = v5;
    v20 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction ic_replyActionWithHandler:](UIAction, "ic_replyActionWithHandler:", v19));
    objc_msgSend(v6, "addObject:", v9);
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_1000AA674;
    v16 = &unk_100550A48;
    v17 = self;
    v18 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction ic_removeActionWithHandler:](UIAction, "ic_removeActionWithHandler:", &v13));
    objc_msgSend(v6, "addObject:", v10, v13, v14, v15, v16, v17);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v6));

  return v11;
}

- (id)contextMenuForFolder:(id)a3 sourceView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  id *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void **v23;
  uint64_t v24;
  void (*v25)(_QWORD *);
  void *v26;
  ICCollectionView *v27;
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[5];
  id v40;
  _QWORD v41[5];
  id v42;
  _QWORD v43[5];
  id v44;
  id v45;
  _QWORD v46[5];
  id v47;
  id v48;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (objc_msgSend(v6, "canBeSharedViaICloud") && objc_msgSend(v6, "canCurrentUserShare"))
  {
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_1000AABD0;
    v46[3] = &unk_1005537C8;
    v46[4] = self;
    v47 = v6;
    v48 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction ic_collaborateShareActionWithCloudSyncingObject:withHandler:](UIAction, "ic_collaborateShareActionWithCloudSyncingObject:withHandler:", v47, v46));
    objc_msgSend(v8, "addObject:", v9);

  }
  if (objc_msgSend(v6, "canBeSharedViaICloud") && objc_msgSend(v6, "isSharedViaICloud"))
  {
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1000AABF8;
    v43[3] = &unk_1005537C8;
    v43[4] = self;
    v44 = v6;
    v45 = v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction ic_collaborateManageActionWithCloudSyncingObject:withHandler:](UIAction, "ic_collaborateManageActionWithCloudSyncingObject:withHandler:", v44, v43));
    objc_msgSend(v8, "addObject:", v10);

  }
  if (objc_msgSend(v6, "isSharedViaICloud"))
  {
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_1000AAC20;
    v41[3] = &unk_100550A48;
    v41[4] = self;
    v42 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction ic_showActivityStreamActionWithCloudSyncingObject:withHandler:](UIAction, "ic_showActivityStreamActionWithCloudSyncingObject:withHandler:", v42, v41));
    objc_msgSend(v8, "addObject:", v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView viewControllerManager](self, "viewControllerManager"));
  v13 = +[ICMoveFolderActivity canShowMoveActionForFolder:viewControllerManager:](ICMoveFolderActivity, "canShowMoveActionForFolder:viewControllerManager:", v6, v12);

  if (v13)
  {
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1000AAC2C;
    v39[3] = &unk_100550A48;
    v39[4] = self;
    v40 = v6;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction ic_moveActionWithHandler:](UIAction, "ic_moveActionWithHandler:", v39));
    objc_msgSend(v8, "addObject:", v14);

  }
  if (objc_msgSend(v6, "isEditableSmartFolder"))
  {
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1000AAC3C;
    v37[3] = &unk_100550A48;
    v37[4] = self;
    v15 = &v38;
    v38 = v6;
    v16 = objc_claimAutoreleasedReturnValue(+[UIAction ic_editSmartFolderActionWithHandler:](UIAction, "ic_editSmartFolderActionWithHandler:", v37));
  }
  else
  {
    if (!objc_msgSend(v6, "isRenamable"))
      goto LABEL_16;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000AAC48;
    v35[3] = &unk_100550A48;
    v35[4] = self;
    v15 = &v36;
    v36 = v6;
    v16 = objc_claimAutoreleasedReturnValue(+[UIAction ic_renameActionWithHandler:](UIAction, "ic_renameActionWithHandler:", v35));
  }
  v17 = (void *)v16;
  objc_msgSend(v8, "addObject:", v16);

LABEL_16:
  if (objc_msgSend(v6, "isDeletable"))
  {
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1000AAC54;
    v33[3] = &unk_100550A48;
    v33[4] = self;
    v34 = v6;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction ic_deleteActionWithHandler:](UIAction, "ic_deleteActionWithHandler:", v33));
    objc_msgSend(v8, "addObject:", v18);

  }
  if (ICInternalSettingsIsAlexandriaEnabled())
  {
    if (objc_msgSend(v6, "allowsImporting"))
    {
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1000AACD8;
      v30[3] = &unk_1005537C8;
      v30[4] = self;
      v31 = v6;
      v32 = v7;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction ic_importArchiveActionWithHandler:](UIAction, "ic_importArchiveActionWithHandler:", v30));
      objc_msgSend(v8, "addObject:", v19);

    }
    if (objc_msgSend(v6, "allowsExporting"))
    {
      v23 = _NSConcreteStackBlock;
      v24 = 3221225472;
      v25 = sub_1000AACE8;
      v26 = &unk_1005537C8;
      v27 = self;
      v28 = v6;
      v29 = v7;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction ic_exportArchiveActionWithHandler:](UIAction, "ic_exportArchiveActionWithHandler:", &v23));
      objc_msgSend(v8, "addObject:", v20, v23, v24, v25, v26, v27);

    }
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v8));

  return v21;
}

- (id)contextMenuForModernNote:(id)a3 sourceView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void **v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  ICCollectionView *v25;
  id v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;
  _QWORD v38[5];
  id v39;
  _QWORD v40[5];
  id v41;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (objc_msgSend(v6, "isPinnable"))
  {
    v9 = objc_msgSend(v6, "isPinned");
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1000AB170;
    v40[3] = &unk_100550A48;
    v40[4] = self;
    v41 = v6;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction ic_pinNoteActionPinned:withHandler:](UIAction, "ic_pinNoteActionPinned:withHandler:", v9, v40));
    objc_msgSend(v8, "addObject:", v10);

  }
  if (objc_msgSend(v6, "isLockable"))
  {
    v11 = objc_msgSend(v6, "isPasswordProtected");
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_1000AB17C;
    v38[3] = &unk_100550A48;
    v38[4] = self;
    v39 = v6;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction ic_lockNoteActionLocked:withHandler:](UIAction, "ic_lockNoteActionLocked:withHandler:", v11, v38));
    objc_msgSend(v8, "addObject:", v12);

  }
  if (objc_msgSend(v6, "canBeSharedViaICloud"))
  {
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000AB188;
    v35[3] = &unk_1005537C8;
    v35[4] = self;
    v36 = v6;
    v37 = v7;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction ic_collaborateShareActionWithCloudSyncingObject:withHandler:](UIAction, "ic_collaborateShareActionWithCloudSyncingObject:withHandler:", v36, v35));
    objc_msgSend(v8, "addObject:", v13);

  }
  if (objc_msgSend(v6, "isSharedViaICloud"))
  {
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000AB1B0;
    v32[3] = &unk_1005537C8;
    v32[4] = self;
    v33 = v6;
    v34 = v7;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction ic_collaborateManageActionWithCloudSyncingObject:withHandler:](UIAction, "ic_collaborateManageActionWithCloudSyncingObject:withHandler:", v33, v32));
    objc_msgSend(v8, "addObject:", v14);

  }
  if (ICInternalSettingsIsAlexandriaEnabled() && objc_msgSend(v6, "allowsExporting"))
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000AB1D8;
    v29[3] = &unk_1005537C8;
    v29[4] = self;
    v30 = v6;
    v31 = v7;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction ic_exportArchiveActionWithHandler:](UIAction, "ic_exportArchiveActionWithHandler:", v29));
    objc_msgSend(v8, "addObject:", v15);

  }
  if (objc_msgSend(v6, "isMovable") && -[ICCollectionView ic_behavior](self, "ic_behavior") != (id)1)
  {
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000AB268;
    v27[3] = &unk_100550A48;
    v27[4] = self;
    v28 = v6;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction ic_moveActionWithHandler:](UIAction, "ic_moveActionWithHandler:", v27));
    objc_msgSend(v8, "addObject:", v16);

  }
  if (objc_msgSend(v6, "isDeletable"))
  {
    v21 = _NSConcreteStackBlock;
    v22 = 3221225472;
    v23 = sub_1000AB2EC;
    v24 = &unk_100550A48;
    v25 = self;
    v26 = v6;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction ic_deleteActionWithHandler:](UIAction, "ic_deleteActionWithHandler:", &v21));
    objc_msgSend(v8, "addObject:", v17, v21, v22, v23, v24, v25);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities appURLForNote:](ICAppURLUtilities, "appURLForNote:", v6));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView contextMenuWithCenterWindowWithAppURL:actions:](self, "contextMenuWithCenterWindowWithAppURL:actions:", v18, v8));

  return v19;
}

- (id)contextMenuForLegacyNote:(id)a3 sourceView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000AB554;
  v23[3] = &unk_1005537C8;
  v23[4] = self;
  v9 = v6;
  v24 = v9;
  v25 = v7;
  v10 = v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction ic_sendActionWithHandler:](UIAction, "ic_sendActionWithHandler:", v23));
  objc_msgSend(v8, "addObject:", v11);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000AB564;
  v21[3] = &unk_100550A48;
  v21[4] = self;
  v12 = v9;
  v22 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction ic_moveActionWithHandler:](UIAction, "ic_moveActionWithHandler:", v21));
  objc_msgSend(v8, "addObject:", v13);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000AB5E8;
  v19[3] = &unk_100550A48;
  v19[4] = self;
  v20 = v12;
  v14 = v12;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction ic_deleteActionWithHandler:](UIAction, "ic_deleteActionWithHandler:", v19));
  objc_msgSend(v8, "addObject:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[ICAppURLUtilities appURLForHTMLNote:](ICAppURLUtilities, "appURLForHTMLNote:", v14));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView contextMenuWithCenterWindowWithAppURL:actions:](self, "contextMenuWithCenterWindowWithAppURL:actions:", v16, v8));

  return v17;
}

- (id)contextMenuWithCenterWindowWithAppURL:(id)a3 actions:(id)a4
{
  id v5;
  void *v6;
  ICCenterWindowSceneActivationRequestOptions *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1005704B8, 0, 0, 1, a4));
  v7 = objc_alloc_init(ICCenterWindowSceneActivationRequestOptions);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction ic_centerWindowActionWithAppURL:activationRequestOptions:](UIAction, "ic_centerWindowActionWithAppURL:activationRequestOptions:", v5, v7));

  v12[0] = v8;
  v12[1] = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 2));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v9));

  return v10;
}

- (id)leadingSwipeActionsConfigurationForModernNote:(id)a3 inCell:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_initWeak(&location, self);
  if (objc_msgSend(v6, "isPinnable"))
  {
    v9 = objc_msgSend(v6, "isPinned");
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000ABCF4;
    v16[3] = &unk_100553818;
    objc_copyWeak(&v18, &location);
    v10 = v6;
    v17 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextualAction ic_pinContextualActionWithPinned:pinBlock:](UIContextualAction, "ic_pinContextualActionWithPinned:pinBlock:", v9, v16));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView pinOrUnpinAccessibilityLabelForNoteIsPinned:](self, "pinOrUnpinAccessibilityLabelForNoteIsPinned:", objc_msgSend(v10, "isPinned")));
    objc_msgSend(v11, "setAccessibilityLabel:", v12);

    objc_msgSend(v8, "addObject:", v11);
    objc_destroyWeak(&v18);
  }
  v13 = objc_msgSend(v8, "copy");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UISwipeActionsConfiguration configurationWithActions:](UISwipeActionsConfiguration, "configurationWithActions:", v13));

  objc_msgSend(v14, "setPerformsFirstActionWithFullSwipe:", 1);
  objc_destroyWeak(&location);

  return v14;
}

- (id)trailingSwipeActionsConfigurationForLegacyNote:(id)a3 inCell:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_initWeak(&location, self);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000ABF8C;
  v21[3] = &unk_100553818;
  objc_copyWeak(&v23, &location);
  v9 = v6;
  v22 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextualAction ic_deleteContextualActionWithBlock:](UIContextualAction, "ic_deleteContextualActionWithBlock:", v21));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView deleteNoteAccessibilityLabel](self, "deleteNoteAccessibilityLabel"));
  objc_msgSend(v10, "setAccessibilityLabel:", v11);

  objc_msgSend(v8, "addObject:", v10);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000AC03C;
  v18[3] = &unk_100553818;
  objc_copyWeak(&v20, &location);
  v12 = v9;
  v19 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextualAction ic_moveContextualActionWithBlock:](UIContextualAction, "ic_moveContextualActionWithBlock:", v18));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView moveNoteAccessibilityLabel](self, "moveNoteAccessibilityLabel"));
  objc_msgSend(v13, "setAccessibilityLabel:", v14);

  objc_msgSend(v8, "addObject:", v13);
  v15 = objc_msgSend(v8, "copy");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UISwipeActionsConfiguration configurationWithActions:](UISwipeActionsConfiguration, "configurationWithActions:", v15));

  objc_msgSend(v16, "setPerformsFirstActionWithFullSwipe:", 0);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

  return v16;
}

- (id)trailingSwipeActionsConfigurationForModernNote:(id)a3 inCell:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_initWeak(&location, self);
  if (objc_msgSend(v6, "isDeletable"))
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000AC428;
    v29[3] = &unk_100553818;
    objc_copyWeak(&v31, &location);
    v30 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextualAction ic_deleteContextualActionWithBlock:](UIContextualAction, "ic_deleteContextualActionWithBlock:", v29));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView deleteNoteAccessibilityLabel](self, "deleteNoteAccessibilityLabel"));
    objc_msgSend(v9, "setAccessibilityLabel:", v10);

    objc_msgSend(v8, "addObject:", v9);
    objc_destroyWeak(&v31);
  }
  if (objc_msgSend(v6, "isMovable") && -[ICCollectionView ic_behavior](self, "ic_behavior") != (id)1)
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000AC4D8;
    v26[3] = &unk_100553818;
    objc_copyWeak(&v28, &location);
    v27 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextualAction ic_moveContextualActionWithBlock:](UIContextualAction, "ic_moveContextualActionWithBlock:", v26));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView moveNoteAccessibilityLabel](self, "moveNoteAccessibilityLabel"));
    objc_msgSend(v11, "setAccessibilityLabel:", v12);

    objc_msgSend(v8, "addObject:", v11);
    objc_destroyWeak(&v28);
  }
  if (objc_msgSend(v6, "canBeSharedViaICloud"))
  {
    v19 = _NSConcreteStackBlock;
    v20 = 3221225472;
    v21 = sub_1000AC588;
    v22 = &unk_100553840;
    objc_copyWeak(&v25, &location);
    v23 = v7;
    v13 = v6;
    v24 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextualAction ic_shareContextualActionWithShareImageName:shareBlock:](UIContextualAction, "ic_shareContextualActionWithShareImageName:shareBlock:", CFSTR("square.and.arrow.up"), &v19));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView collaborationAccessibilityLabelForCloudSyncingObject:](self, "collaborationAccessibilityLabelForCloudSyncingObject:", v13, v19, v20, v21, v22));
    objc_msgSend(v14, "setAccessibilityLabel:", v15);

    objc_msgSend(v8, "addObject:", v14);
    objc_destroyWeak(&v25);
  }
  v16 = objc_msgSend(v8, "copy");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UISwipeActionsConfiguration configurationWithActions:](UISwipeActionsConfiguration, "configurationWithActions:", v16));

  objc_msgSend(v17, "setPerformsFirstActionWithFullSwipe:", 0);
  objc_destroyWeak(&location);

  return v17;
}

- (id)trailingSwipeActionsConfigurationForModernFolder:(id)a3 inCell:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void **v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_initWeak(&location, self);
  if (objc_msgSend(v6, "isDeletable"))
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000AC994;
    v31[3] = &unk_100553818;
    objc_copyWeak(&v33, &location);
    v32 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextualAction ic_deleteContextualActionWithBlock:](UIContextualAction, "ic_deleteContextualActionWithBlock:", v31));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView deleteFolderAccessibilityLabel](self, "deleteFolderAccessibilityLabel"));
    objc_msgSend(v9, "setAccessibilityLabel:", v10);

    objc_msgSend(v8, "addObject:", v9);
    objc_destroyWeak(&v33);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView viewControllerManager](self, "viewControllerManager"));
  v12 = +[ICMoveFolderActivity canShowMoveActionForFolder:viewControllerManager:](ICMoveFolderActivity, "canShowMoveActionForFolder:viewControllerManager:", v6, v11);

  if (v12)
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000ACA44;
    v28[3] = &unk_100553818;
    objc_copyWeak(&v30, &location);
    v29 = v6;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextualAction ic_moveContextualActionWithBlock:](UIContextualAction, "ic_moveContextualActionWithBlock:", v28));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView moveFolderAccessibilityLabel](self, "moveFolderAccessibilityLabel"));
    objc_msgSend(v13, "setAccessibilityLabel:", v14);

    objc_msgSend(v8, "addObject:", v13);
    objc_destroyWeak(&v30);
  }
  if (objc_msgSend(v6, "canBeSharedViaICloud") && objc_msgSend(v6, "canCurrentUserShare"))
  {
    v21 = _NSConcreteStackBlock;
    v22 = 3221225472;
    v23 = sub_1000ACA9C;
    v24 = &unk_100553840;
    objc_copyWeak(&v27, &location);
    v25 = v7;
    v15 = v6;
    v26 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextualAction ic_shareContextualActionWithShareImageName:shareBlock:](UIContextualAction, "ic_shareContextualActionWithShareImageName:shareBlock:", CFSTR("square.and.arrow.up"), &v21));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView collaborationAccessibilityLabelForCloudSyncingObject:](self, "collaborationAccessibilityLabelForCloudSyncingObject:", v15, v21, v22, v23, v24));
    objc_msgSend(v16, "setAccessibilityLabel:", v17);

    objc_msgSend(v8, "addObject:", v16);
    objc_destroyWeak(&v27);
  }
  v18 = objc_msgSend(v8, "copy");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UISwipeActionsConfiguration configurationWithActions:](UISwipeActionsConfiguration, "configurationWithActions:", v18));

  objc_msgSend(v19, "setPerformsFirstActionWithFullSwipe:", 0);
  objc_destroyWeak(&location);

  return v19;
}

- (id)trailingSwipeActionsConfigurationForInvitation:(id)a3 inCell:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v18;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_initWeak(&location, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "highlight"));

  if (v9)
  {
    v18 = v7;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000ACDA4;
    v25[3] = &unk_100553818;
    objc_copyWeak(&v27, &location);
    v10 = v6;
    v26 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextualAction ic_removeContextualActionWithBlock:](UIContextualAction, "ic_removeContextualActionWithBlock:", v25));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView removeInvitationAccessibilityLabel](self, "removeInvitationAccessibilityLabel"));
    objc_msgSend(v11, "setAccessibilityLabel:", v12);

    objc_msgSend(v8, "addObject:", v11);
    v19 = _NSConcreteStackBlock;
    v20 = 3221225472;
    v21 = sub_1000ACE04;
    v22 = &unk_100553818;
    objc_copyWeak(&v24, &location);
    v23 = v10;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextualAction ic_replyContextualActionWithBlock:](UIContextualAction, "ic_replyContextualActionWithBlock:", &v19));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView replyToInvitationAccessibilityLabel](self, "replyToInvitationAccessibilityLabel"));
    objc_msgSend(v13, "setAccessibilityLabel:", v14);

    objc_msgSend(v8, "addObject:", v13);
    objc_destroyWeak(&v24);

    objc_destroyWeak(&v27);
  }
  v15 = objc_msgSend(v8, "copy", v18, v19, v20, v21, v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UISwipeActionsConfiguration configurationWithActions:](UISwipeActionsConfiguration, "configurationWithActions:", v15));

  objc_msgSend(v16, "setPerformsFirstActionWithFullSwipe:", 0);
  objc_destroyWeak(&location);

  return v16;
}

- (void)performPinActionWithNote:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));

  -[ICCollectionView performPinActionWithNotes:](self, "performPinActionWithNotes:", v5, v6);
}

- (void)performPinActionWithNotes:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *j;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[4];
  id v51;
  id v52;
  _BYTE v53[128];
  _BYTE v54[128];

  v4 = a3;
  v5 = objc_opt_class(ICBaseViewController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView presentingViewController](self, "presentingViewController"));
  v7 = ICDynamicCast(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = objc_opt_class(ICNoteBrowseDataSource);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataSource"));
  v11 = ICDynamicCast(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = objc_opt_class(ICNoteCoreDataIndexer);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "indexer"));
  v15 = ICDynamicCast(v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_1000AD28C;
  v50[3] = &unk_10054FE80;
  v17 = v4;
  v51 = v17;
  v40 = v16;
  v52 = v40;
  objc_msgSend(v12, "performBlockSuspendingUpdates:andApplySnapshotAnimated:", v50, 1);
  v18 = objc_opt_class(ICNoteSearchDataSource);
  v41 = v8;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataSource"));
  v20 = ICDynamicCast(v18, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

  if (v21)
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v22 = v17;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(_QWORD *)v47 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v27, "changePinStatusIfPossible");
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "managedObjectContext"));
          objc_msgSend(v28, "ic_save");

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      }
      while (v24);
    }

    objc_msgSend(v21, "performUpdatesIfNeededAndWait");
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v29 = v17;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v31; j = (char *)j + 1)
      {
        if (*(_QWORD *)v43 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)j);
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView presentingViewController](self, "presentingViewController"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "eventReporter"));
        objc_msgSend(v36, "submitNotePinEventForModernNote:contextPath:", v34, 0);

        if (UIAccessibilityIsVoiceOverRunning())
        {
          v37 = objc_msgSend(v34, "isPinned");
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "title"));
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView pinOrUnpinAccessibilityAnnouncementForNoteIsPinned:noteTitle:](self, "pinOrUnpinAccessibilityAnnouncementForNoteIsPinned:noteTitle:", v37, v38));

          ICAccessibilityPostHighPriorityAnnouncementNotification(0, v39);
        }
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    }
    while (v31);
  }

}

- (void)performLockActionWithNote:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  v4 = a3;
  v5 = objc_alloc((Class)ICLockNoteActivity);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView presentingViewController](self, "presentingViewController"));
  v7 = objc_msgSend(v5, "initWithNote:presentingViewController:", v4, v6);
  -[ICCollectionView setLockNoteActivity:](self, "setLockNoteActivity:", v7);

  objc_initWeak(&location, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView viewControllerManager](self, "viewControllerManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "window"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstResponder"));

  if (objc_msgSend(v10, "conformsToProtocol:", &OBJC_PROTOCOL___UITextInput))
  {
    objc_msgSend(v10, "resignFirstResponder");
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000AD54C;
    v15[3] = &unk_10054FF58;
    v11 = &v16;
    objc_copyWeak(&v16, &location);
    dispatchMainAfterDelay(v15, 0.6);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView lockNoteActivity](self, "lockNoteActivity"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000AD630;
    v13[3] = &unk_1005509A0;
    v11 = &v14;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v12, "performActivityWithCompletion:", v13);

  }
  objc_destroyWeak(v11);

  objc_destroyWeak(&location);
}

- (void)performCollaborationActionWithNote:(id)a3 forceShareSheet:(BOOL)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 completion:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  id v17;
  void *v18;
  ICCollaborationNoteActivity *v19;
  void *v20;
  void *v21;
  void *v22;
  ICSendNoteActivity *v23;
  void *v24;
  ICSendNoteActivity *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v15 = a3;
  v16 = a5;
  v17 = a7;
  v18 = v17;
  if (v15)
  {
    if (a4 || (objc_msgSend(v15, "isPubliclySharedOrHasInvitees") & 1) == 0)
    {
      v25 = [ICSendNoteActivity alloc];
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView presentingViewController](self, "presentingViewController"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView presentingViewController](self, "presentingViewController"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "eventReporter"));
      v23 = -[ICSendNoteActivity initWithNote:presentingViewController:presentingBarButtonItem:presentingSourceView:presentingSourceRect:eventReporter:](v25, "initWithNote:presentingViewController:presentingBarButtonItem:presentingSourceView:presentingSourceRect:eventReporter:", v15, v26, 0, v16, v28, x, y, width, height);

      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_1000AD88C;
      v31[3] = &unk_100553868;
      v32 = v18;
      -[ICSendNoteActivity performActivityWithCompletion:](v23, "performActivityWithCompletion:", v31);
      v24 = v32;
    }
    else
    {
      v19 = [ICCollaborationNoteActivity alloc];
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView presentingViewController](self, "presentingViewController"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView presentingViewController](self, "presentingViewController"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "eventReporter"));
      v23 = -[ICCollaborationNoteActivity initWithNote:presentingViewController:presentingBarButtonItem:presentingSourceView:eventReporter:](v19, "initWithNote:presentingViewController:presentingBarButtonItem:presentingSourceView:eventReporter:", v15, v20, 0, v16, v22);

      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_1000AD8A0;
      v29[3] = &unk_100553868;
      v30 = v18;
      -[ICSendNoteActivity performActivityWithCompletion:](v23, "performActivityWithCompletion:", v29);
      v24 = v30;
    }

  }
  else if (v17)
  {
    (*((void (**)(id, _QWORD))v17 + 2))(v17, 0);
  }

}

- (void)performSendActionWithNote:(id)a3 fromSourceView:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  ICSendNoteActivity *v12;
  void *v13;
  void *v14;
  void *v15;
  ICSendNoteActivity *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NotesActivityViewController *v22;
  void *v23;
  NotesActivityViewController *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  _QWORD v31[3];

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class(ICNote);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView modernManagedObjectContext](self, "modernManagedObjectContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectWithID:", v10));

    v12 = [ICSendNoteActivity alloc];
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView presentingViewController](self, "presentingViewController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView presentingViewController](self, "presentingViewController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "eventReporter"));
    v16 = -[ICSendNoteActivity initWithNote:presentingViewController:presentingBarButtonItem:presentingSourceView:presentingSourceRect:eventReporter:](v12, "initWithNote:presentingViewController:presentingBarButtonItem:presentingSourceView:presentingSourceRect:eventReporter:", v11, v13, 0, v7, v15, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);

    -[ICSendNoteActivity performActivityWithCompletion:](v16, "performActivityWithCompletion:", 0);
LABEL_8:

    goto LABEL_9;
  }
  v17 = objc_opt_class(NoteObject);
  if ((objc_opt_isKindOfClass(v6, v17) & 1) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView legacyManagedObjectContext](self, "legacyManagedObjectContext"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectWithID:", v19));

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView viewControllerManager](self, "viewControllerManager"));
    v16 = (ICSendNoteActivity *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "legacyNoteEditorViewController"));

    v21 = -[ICSendNoteActivity view](v16, "view");
    -[ICSendNoteActivity setNote:](v16, "setNote:", v11);
    -[ICSendNoteActivity setContentFromNote](v16, "setContentFromNote");
    v22 = [NotesActivityViewController alloc];
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICSendNoteActivity noteActivityItemsForSharing](v16, "noteActivityItemsForSharing"));
    v24 = -[NotesActivityViewController initWithActivityItems:applicationActivities:](v22, "initWithActivityItems:applicationActivities:", v23, 0);

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "store"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "account"));
    -[NotesActivityViewController setIsContentManaged:](v24, "setIsContentManaged:", objc_msgSend(v26, "isManaged"));

    v31[0] = UIActivityTypeOpenInIBooks;
    v31[1] = ICActivityTypeShareToNote;
    v31[2] = UIActivityTypeSharePlay;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 3));
    -[NotesActivityViewController setExcludedActivityTypes:](v24, "setExcludedActivityTypes:", v27);

    -[NotesActivityViewController setDisplayController:](v24, "setDisplayController:", v16);
    if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
      v28 = -2;
    else
      v28 = 7;
    -[NotesActivityViewController setModalPresentationStyle:](v24, "setModalPresentationStyle:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[NotesActivityViewController popoverPresentationController](v24, "popoverPresentationController"));
    objc_msgSend(v29, "setSourceView:", v7);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView presentingViewController](self, "presentingViewController"));
    objc_msgSend(v30, "presentViewController:animated:completion:", v24, 1, 0);

    goto LABEL_8;
  }
LABEL_9:

}

- (void)performMoveActionWithNotes:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  ICMoveDecisionController *v8;
  void *v9;
  ICMoveDecisionController *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v6 = a4;
  v7 = a3;
  v8 = [ICMoveDecisionController alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView presentingViewController](self, "presentingViewController"));
  v10 = -[ICMoveDecisionController initWithSourceObjects:presentingViewController:](v8, "initWithSourceObjects:presentingViewController:", v7, v9);

  -[ICCollectionView setMoveDecisionController:](self, "setMoveDecisionController:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView moveDecisionController](self, "moveDecisionController"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000ADCF0;
  v13[3] = &unk_100552078;
  v13[4] = self;
  v14 = v6;
  v12 = v6;
  objc_msgSend(v11, "performDecisionWithCompletion:", v13);

}

- (void)performDeleteActionWithObjects:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  ICDeleteDecisionController *v15;
  void *v16;
  void *v17;
  void *v18;
  ICDeleteDecisionController *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  _QWORD v49[5];
  id v50;
  id v51;
  _QWORD v52[5];
  id v53;
  id v54;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView presentingViewController](self, "presentingViewController"));
  if ((objc_msgSend(v8, "isFirstResponder") & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView presentingViewController](self, "presentingViewController"));
    v10 = objc_msgSend(v9, "canBecomeFirstResponder");

    if (!v10)
      goto LABEL_5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView presentingViewController](self, "presentingViewController"));
    objc_msgSend(v8, "becomeFirstResponder");
  }

LABEL_5:
  v11 = objc_opt_class(ICBaseViewController);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView presentingViewController](self, "presentingViewController"));
  v13 = ICDynamicCast(v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  v15 = [ICDeleteDecisionController alloc];
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView window](self, "window"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView presentingViewController](self, "presentingViewController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "eventReporter"));
  v19 = -[ICDeleteDecisionController initWithSourceObjects:window:sender:eventReporter:](v15, "initWithSourceObjects:window:sender:eventReporter:", v7, v16, 0, v18);

  v20 = objc_opt_class(ICFolderDataSource);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dataSource"));
  v22 = ICDynamicCast(v20, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

  v24 = objc_opt_class(ICFolderCoreDataIndexer);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "indexer"));
  v26 = ICDynamicCast(v24, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ic_compactMap:", &stru_1005538B0));
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_1000AE290;
  v52[3] = &unk_1005538D8;
  v52[4] = self;
  v29 = v28;
  v53 = v29;
  v30 = v6;
  v54 = v30;
  v45 = v27;
  objc_msgSend(v27, "deleteWithDecisionController:completion:", v19, v52);
  v31 = objc_opt_class(ICNoteBrowseDataSource);
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dataSource"));
  v33 = ICDynamicCast(v31, v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);

  v35 = objc_opt_class(ICNoteCoreDataIndexer);
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "indexer"));
  v37 = ICDynamicCast(v35, v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);

  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_1000AE2D8;
  v49[3] = &unk_1005538D8;
  v49[4] = self;
  v39 = v29;
  v50 = v39;
  v40 = v30;
  v51 = v40;
  objc_msgSend(v38, "deleteWithDecisionController:completion:", v19, v49);
  v41 = objc_opt_class(ICNoteSearchDataSource);
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dataSource"));
  v43 = ICDynamicCast(v41, v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue(v43);

  if (v44)
  {
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_1000AE320;
    v46[3] = &unk_100551FA0;
    v47 = v44;
    v48 = v40;
    -[ICDeleteDecisionController performDecisionWithCompletion:](v19, "performDecisionWithCompletion:", v46);

  }
}

- (void)performMoveActionWithFolder:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  ICMoveFolderActivity *v8;
  void *v9;
  ICMoveFolderActivity *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = [ICMoveFolderActivity alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView presentingViewController](self, "presentingViewController"));
  v10 = -[ICMoveFolderActivity initWithFolder:presentingViewController:](v8, "initWithFolder:presentingViewController:", v6, v9);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000AE450;
  v13[3] = &unk_100553900;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  -[ICMoveFolderActivity performActivityWithCompletion:](v10, "performActivityWithCompletion:", v13);

}

- (void)performRenameActionWithFolder:(id)a3
{
  id v4;
  ICRenameFolderActivity *v5;
  void *v6;
  ICRenameFolderActivity *v7;
  id v8;

  v4 = a3;
  v5 = [ICRenameFolderActivity alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView presentingViewController](self, "presentingViewController"));
  v7 = -[ICRenameFolderActivity initWithFolder:presentingViewController:](v5, "initWithFolder:presentingViewController:", v4, v6);

  -[ICCollectionView setRenameFolderActivity:](self, "setRenameFolderActivity:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue(-[ICCollectionView renameFolderActivity](self, "renameFolderActivity"));
  objc_msgSend(v8, "performActivityWithCompletion:", 0);

}

- (void)performEditSmartFolderActionWithFolder:(id)a3
{
  id v4;
  ICEditSmartFolderActivity *v5;
  void *v6;
  ICEditSmartFolderActivity *v7;

  v4 = a3;
  v5 = [ICEditSmartFolderActivity alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView presentingViewController](self, "presentingViewController"));
  v7 = -[ICEditSmartFolderActivity initWithSmartFolder:presentingViewController:](v5, "initWithSmartFolder:presentingViewController:", v4, v6);

  -[ICEditSmartFolderActivity performActivityWithCompletion:](v7, "performActivityWithCompletion:", 0);
}

- (void)performCollaborationActionWithFolder:(id)a3 forceShareSheet:(BOOL)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 completion:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v12;
  id v15;
  id v16;
  id v17;
  ICCollaborationFolderActivity *v18;
  void *v19;
  void *v20;
  void *v21;
  ICCollaborationFolderActivity *v22;
  id v23;
  _QWORD v24[4];
  id v25;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v12 = a4;
  v15 = a7;
  v16 = a5;
  v17 = a3;
  v18 = [ICCollaborationFolderActivity alloc];
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView presentingViewController](self, "presentingViewController"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView presentingViewController](self, "presentingViewController"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "eventReporter"));
  v22 = -[ICCollaborationFolderActivity initWithFolder:presentingViewController:presentingBarButtonItem:presentingSourceView:presentingSourceRect:eventReporter:](v18, "initWithFolder:presentingViewController:presentingBarButtonItem:presentingSourceView:presentingSourceRect:eventReporter:", v17, v19, 0, v16, v21, x, y, width, height);

  -[ICCollaborationFolderActivity setForceShareSheet:](v22, "setForceShareSheet:", v12);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000AE74C;
  v24[3] = &unk_100553868;
  v25 = v15;
  v23 = v15;
  -[ICCollaborationFolderActivity performActivityWithCompletion:](v22, "performActivityWithCompletion:", v24);

}

- (void)performShowActivityStreamActionWithFolder:(id)a3
{
  id v4;
  void *v5;
  ICShowActivityStreamActivity *v6;

  v4 = a3;
  v6 = -[ICShowActivityStreamActivity initWithObject:]([ICShowActivityStreamActivity alloc], "initWithObject:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView viewControllerManager](self, "viewControllerManager"));
  -[ICShowActivityStreamActivity setViewControllerManager:](v6, "setViewControllerManager:", v5);

  -[ICShowActivityStreamActivity performActivityWithCompletion:](v6, "performActivityWithCompletion:", 0);
}

- (void)performImportArchiveActionWithNoteContainer:(id)a3 fromSourceView:(id)a4
{
  id v5;
  ICImportArchiveActivity *v6;
  void *v7;
  ICImportArchiveActivity *v8;
  id v9;

  v5 = a3;
  v6 = [ICImportArchiveActivity alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView presentingViewController](self, "presentingViewController"));
  v8 = -[ICImportArchiveActivity initWithNoteContainer:presentingViewController:](v6, "initWithNoteContainer:presentingViewController:", v5, v7);

  -[ICCollectionView setImportArchiveActivity:](self, "setImportArchiveActivity:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue(-[ICCollectionView importArchiveActivity](self, "importArchiveActivity"));
  objc_msgSend(v9, "performActivityWithCompletion:", 0);

}

- (void)performExportArchiveActionWithObjects:(id)a3 fromSourceView:(id)a4
{
  id v6;
  id v7;
  ICExportArchiveActivity *v8;
  void *v9;
  ICExportArchiveActivity *v10;

  v6 = a4;
  v7 = a3;
  v8 = [ICExportArchiveActivity alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView presentingViewController](self, "presentingViewController"));
  v10 = -[ICExportArchiveActivity initWithObjects:presentingViewController:presentingBarButtonItem:presentingSourceView:](v8, "initWithObjects:presentingViewController:presentingBarButtonItem:presentingSourceView:", v7, v9, 0, v6);

  -[ICExportArchiveActivity performActivityWithCompletion:](v10, "performActivityWithCompletion:", 0);
}

- (void)performRemoveActionWithInvitation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(void);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "highlight"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hideContextMenu"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionBlock"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "highlight"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hideContextMenu"));
    v10 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "actionBlock"));
    v10[2]();

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectID"));
  v15 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  -[ICCollectionView synchronouslyRemoveItemsWithIdentifiers:](self, "synchronouslyRemoveItemsWithIdentifiers:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView presentingViewController](self, "presentingViewController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "eventReporter"));
  objc_msgSend(v14, "submitCollabNotificationEventWithAction:", 2);

}

- (void)performReplyActionWithInvitation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(void);
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "highlight"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView presentingViewController](self, "presentingViewController"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "replyContextMenuWithPresentingViewController:", v5));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "actionBlock"));
  if (v6)
  {
    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "actionBlock"));
    v7[2]();

  }
}

- (id)contextMenuPreviewWithConfiguration:(id)a3 indexPath:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView cellForItemIdentifier:](self, "cellForItemIdentifier:", v5));

  v7 = ICProtocolCast(&OBJC_PROTOCOL___ICContextMenuInteractionPreviewProviding, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contextMenuInteractionPreview"));
  v10 = (void *)v9;
  if (v9)
    v11 = (void *)v9;
  else
    v11 = v6;
  v12 = v11;

  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "window"));
  if (v13)
  {
    v13 = objc_msgSend(objc_alloc((Class)UITargetedPreview), "initWithView:", v12);
    v14 = objc_opt_class(ICFolderOutlineCollectionViewCell);
    if ((objc_opt_isKindOfClass(v6, v14) & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_visiblePathForBackgroundConfiguration"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "parameters"));
      objc_msgSend(v16, "setVisiblePath:", v15);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView backgroundColor](self, "backgroundColor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "parameters"));
      objc_msgSend(v18, "setBackgroundColor:", v17);

    }
  }

  return v13;
}

- (id)previewParametersWithCollectionView:(id)a3 atIndexPath:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellForItemAtIndexPath:", a4));
  v6 = ICProtocolCast(&OBJC_PROTOCOL___ICContextMenuInteractionPreviewProviding, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contextMenuInteractionPreview"));
  v9 = (void *)v8;
  if (v8)
    v10 = (void *)v8;
  else
    v10 = v5;
  v11 = v10;

  if (v11)
  {
    v12 = objc_alloc_init((Class)UIDragPreviewParameters);
    v13 = objc_opt_class(ICFolderOutlineCollectionViewCell);
    if ((objc_opt_isKindOfClass(v5, v13) & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_visiblePathForBackgroundConfiguration"));
      objc_msgSend(v12, "setVisiblePath:", v14);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView backgroundColor](self, "backgroundColor"));
      objc_msgSend(v12, "setBackgroundColor:", v15);
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layer"));
      objc_msgSend(v15, "bounds");
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;
      objc_msgSend(v15, "cornerRadius");
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v17, v19, v21, v23, v24));
      objc_msgSend(v12, "setVisiblePath:", v25);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)cellForItemIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView diffableDataSource](self, "diffableDataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForItemIdentifier:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView cellForItemAtIndexPath:](self, "cellForItemAtIndexPath:", v6));
  return v7;
}

- (void)synchronouslyRemoveItemsWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView diffableDataSource](self, "diffableDataSource"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "snapshot"));

  objc_msgSend(v9, "deleteItemsWithIdentifiers:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView diffableDataSource](self, "diffableDataSource"));
  objc_msgSend(v6, "applySnapshot:animatingDifferences:", v9, 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView optimisticallyAppliedSnapshotHandler](self, "optimisticallyAppliedSnapshotHandler"));
  if (v7)
  {
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[ICCollectionView optimisticallyAppliedSnapshotHandler](self, "optimisticallyAppliedSnapshotHandler"));
    ((void (**)(_QWORD, id))v8)[2](v8, v9);

  }
}

- (id)firstUnselectedIndexPathWithFrame:(CGRect)a3 arrowDirection:(unint64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  double v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  ICCollectionView *v21;
  _QWORD *v22;
  uint64_t *v23;
  unint64_t v24;
  _QWORD v25[4];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView indexPathsForSelectedItems](self, "indexPathsForSelectedItems"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView collectionViewLayout](self, "collectionViewLayout"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layoutAttributesForElementsInRect:", x, y, width, height));

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_1000AF0BC;
  v30 = sub_1000AF0CC;
  v31 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v14 = a4 == 8 || a4 == 2;
  v15 = -1.79769313e308;
  if (v14)
    v15 = 1.79769313e308;
  v25[2] = 0x2020000000;
  *(double *)&v25[3] = v15;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000AF0D4;
  v19[3] = &unk_100553928;
  v16 = v11;
  v20 = v16;
  v21 = self;
  v23 = &v26;
  v24 = a4;
  v22 = v25;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v27[5], "indexPath"));

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v26, 8);

  return v17;
}

- (id)commonAccessibilityActionsForFolder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void **v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  ICCollectionView *v18;
  id v19;
  _QWORD v20[5];
  id v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (objc_msgSend(v4, "isRenamable"))
  {
    v6 = objc_alloc((Class)UIAccessibilityCustomAction);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView renameFolderAccessibilityLabel](self, "renameFolderAccessibilityLabel"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000AF414;
    v20[3] = &unk_100553950;
    v20[4] = self;
    v21 = v4;
    v8 = objc_msgSend(v6, "initWithName:actionHandler:", v7, v20);

    objc_msgSend(v5, "addObject:", v8);
  }
  if (objc_msgSend(v4, "isSharedViaICloud"))
  {
    v9 = objc_alloc((Class)UIAccessibilityCustomAction);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView showFolderActivityAccessibilityLabel](self, "showFolderActivityAccessibilityLabel"));
    v14 = _NSConcreteStackBlock;
    v15 = 3221225472;
    v16 = sub_1000AF434;
    v17 = &unk_100553950;
    v18 = self;
    v19 = v4;
    v11 = objc_msgSend(v9, "initWithName:actionHandler:", v10, &v14);

    objc_msgSend(v5, "addObject:", v11, v14, v15, v16, v17, v18);
  }
  v12 = objc_msgSend(v5, "copy");

  return v12;
}

- (id)galleryViewAcessibilityActionsForFolder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  unsigned int v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void **v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  ICCollectionView *v24;
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView commonAccessibilityActionsForFolder:](self, "commonAccessibilityActionsForFolder:", v4));
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  if (objc_msgSend(v4, "isDeletable"))
  {
    v7 = objc_alloc((Class)UIAccessibilityCustomAction);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView deleteFolderAccessibilityLabel](self, "deleteFolderAccessibilityLabel"));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000AF6A8;
    v28[3] = &unk_100553950;
    v28[4] = self;
    v29 = v4;
    v9 = objc_msgSend(v7, "initWithName:actionHandler:", v8, v28);

    objc_msgSend(v5, "addObject:", v9);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView viewControllerManager](self, "viewControllerManager"));
  v11 = +[ICMoveFolderActivity canShowMoveActionForFolder:viewControllerManager:](ICMoveFolderActivity, "canShowMoveActionForFolder:viewControllerManager:", v4, v10);

  if (v11)
  {
    v12 = objc_alloc((Class)UIAccessibilityCustomAction);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView moveFolderAccessibilityLabel](self, "moveFolderAccessibilityLabel"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000AF730;
    v26[3] = &unk_100553950;
    v26[4] = self;
    v27 = v4;
    v14 = objc_msgSend(v12, "initWithName:actionHandler:", v13, v26);

    objc_msgSend(v5, "addObject:", v14);
  }
  if (objc_msgSend(v4, "canBeSharedViaICloud"))
  {
    v15 = objc_alloc((Class)UIAccessibilityCustomAction);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView collaborationAccessibilityLabelForCloudSyncingObject:](self, "collaborationAccessibilityLabelForCloudSyncingObject:", v4));
    v20 = _NSConcreteStackBlock;
    v21 = 3221225472;
    v22 = sub_1000AF754;
    v23 = &unk_100553950;
    v24 = self;
    v25 = v4;
    v17 = objc_msgSend(v15, "initWithName:actionHandler:", v16, &v20);

    objc_msgSend(v5, "addObject:", v17, v20, v21, v22, v23, v24);
  }
  v18 = objc_msgSend(v5, "copy");

  return v18;
}

- (id)commonAcessibilityActionsForNoteWithObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void **v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  ICCollectionView *v22;
  id v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (objc_msgSend(v4, "ic_isModernNoteType"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView modernManagedObjectContext](self, "modernManagedObjectContext"));
  }
  else
  {
    if (!objc_msgSend(v4, "ic_isLegacyNoteType"))
    {
      v8 = 0;
      goto LABEL_7;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView legacyManagedObjectContext](self, "legacyManagedObjectContext"));
  }
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectWithID:", v4));

LABEL_7:
  v9 = objc_opt_class(ICNote);
  v10 = ICDynamicCast(v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (v11 && objc_msgSend(v11, "isLockable"))
  {
    v13 = objc_alloc((Class)UIAccessibilityCustomAction);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView lockOrUnlockAccessibilityLabelForNoteIsLocked:](self, "lockOrUnlockAccessibilityLabelForNoteIsLocked:", objc_msgSend(v12, "isPasswordProtected")));
    v18 = _NSConcreteStackBlock;
    v19 = 3221225472;
    v20 = sub_1000AF958;
    v21 = &unk_100553950;
    v22 = self;
    v23 = v12;
    v15 = objc_msgSend(v13, "initWithName:actionHandler:", v14, &v18);

    objc_msgSend(v5, "addObject:", v15, v18, v19, v20, v21, v22);
  }
  v16 = objc_msgSend(v5, "copy");

  return v16;
}

- (id)galleryViewAcessibilityActionsForNote:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v24[5];
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  id v32;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView commonAcessibilityActionsForNoteWithObjectID:](self, "commonAcessibilityActionsForNoteWithObjectID:", v6));
  objc_msgSend(v5, "addObjectsFromArray:", v7);

  if (objc_msgSend(v4, "isDeletable"))
  {
    v8 = objc_alloc((Class)UIAccessibilityCustomAction);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView deleteNoteAccessibilityLabel](self, "deleteNoteAccessibilityLabel"));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000AFC74;
    v31[3] = &unk_100553950;
    v31[4] = self;
    v32 = v4;
    v10 = objc_msgSend(v8, "initWithName:actionHandler:", v9, v31);

    objc_msgSend(v5, "addObject:", v10);
  }
  if (objc_msgSend(v4, "isMovable"))
  {
    v11 = objc_alloc((Class)UIAccessibilityCustomAction);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView moveNoteAccessibilityLabel](self, "moveNoteAccessibilityLabel"));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000AFCFC;
    v29[3] = &unk_100553950;
    v29[4] = self;
    v30 = v4;
    v13 = objc_msgSend(v11, "initWithName:actionHandler:", v12, v29);

    objc_msgSend(v5, "addObject:", v13);
  }
  if (objc_msgSend(v4, "isPinnable"))
  {
    v14 = objc_alloc((Class)UIAccessibilityCustomAction);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView pinOrUnpinAccessibilityLabelForNoteIsPinned:](self, "pinOrUnpinAccessibilityLabelForNoteIsPinned:", objc_msgSend(v4, "isPinned")));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000AFD84;
    v27[3] = &unk_100553950;
    v27[4] = self;
    v28 = v4;
    v16 = objc_msgSend(v14, "initWithName:actionHandler:", v15, v27);

    objc_msgSend(v5, "addObject:", v16);
  }
  if (objc_msgSend(v4, "canBeSharedViaICloud"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView interactionSourceViewForObjectID:](self, "interactionSourceViewForObjectID:", v17));

    v19 = objc_alloc((Class)UIAccessibilityCustomAction);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView collaborationAccessibilityLabelForCloudSyncingObject:](self, "collaborationAccessibilityLabelForCloudSyncingObject:", v4));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000AFDA4;
    v24[3] = &unk_100553978;
    v24[4] = self;
    v25 = v4;
    v26 = v18;
    v21 = v18;
    v22 = objc_msgSend(v19, "initWithName:actionHandler:", v20, v24);

    objc_msgSend(v5, "addObject:", v22);
  }

  return v5;
}

- (id)interactionSourceViewForObjectID:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollectionView cellForItemIdentifier:](self, "cellForItemIdentifier:", a3));
  v4 = ICProtocolCast(&OBJC_PROTOCOL___ICContextMenuInteractionPreviewProviding, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contextMenuInteractionPreview"));
  v7 = (void *)v6;
  if (v6)
    v8 = (void *)v6;
  else
    v8 = v3;
  v9 = v8;

  return v9;
}

- (id)deleteNoteAccessibilityLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Delete note"), &stru_1005704B8, 0));

  return v3;
}

- (id)moveNoteAccessibilityLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Move note"), &stru_1005704B8, 0));

  return v3;
}

- (id)sendNoteCopyAccessibilityLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Share button"), &stru_1005704B8, 0));

  return v3;
}

- (id)pinOrUnpinAccessibilityLabelForNoteIsPinned:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = v4;
  if (v3)
    v6 = CFSTR("Unpin note");
  else
    v6 = CFSTR("Pin note");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1005704B8, 0));

  return v7;
}

- (id)pinOrUnpinAccessibilityAnnouncementForNoteIsPinned:(BOOL)a3 noteTitle:(id)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = v6;
  if (v4)
    v8 = CFSTR("Pinned note with title, %@");
  else
    v8 = CFSTR("Unpinned note with title, %@");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1005704B8, 0));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v5));
  return v10;
}

- (id)lockOrUnlockAccessibilityLabelForNoteIsLocked:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = v4;
  if (v3)
    v6 = CFSTR("Remove lock from note");
  else
    v6 = CFSTR("Add lock to note");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1005704B8, 0));

  return v7;
}

- (id)collaborationAccessibilityLabelForCloudSyncingObject:(id)a3
{
  return objc_msgSend(a3, "shareViaICloudManageActionTitle");
}

- (id)deleteFolderAccessibilityLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Delete folder"), &stru_1005704B8, 0));

  return v3;
}

- (id)moveFolderAccessibilityLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Move folder"), &stru_1005704B8, 0));

  return v3;
}

- (id)renameFolderAccessibilityLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Rename folder"), &stru_1005704B8, 0));

  return v3;
}

- (id)showFolderActivityAccessibilityLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Show Folder Activity"), &stru_1005704B8, 0));

  return v3;
}

- (id)removeInvitationAccessibilityLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Remove invitation"), &stru_1005704B8, 0));

  return v3;
}

- (id)replyToInvitationAccessibilityLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Reply to invitation"), &stru_1005704B8, 0));

  return v3;
}

- (ICNAViewController)presentingViewController
{
  return (ICNAViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (NSManagedObjectContext)legacyManagedObjectContext
{
  return self->_legacyManagedObjectContext;
}

- (NSManagedObjectContext)modernManagedObjectContext
{
  return self->_modernManagedObjectContext;
}

- (ICViewControllerManager)viewControllerManager
{
  return (ICViewControllerManager *)objc_loadWeakRetained((id *)&self->_viewControllerManager);
}

- (id)optimisticallyAppliedSnapshotHandler
{
  return self->_optimisticallyAppliedSnapshotHandler;
}

- (ICRenameFolderActivity)renameFolderActivity
{
  return self->_renameFolderActivity;
}

- (void)setRenameFolderActivity:(id)a3
{
  objc_storeStrong((id *)&self->_renameFolderActivity, a3);
}

- (ICImportArchiveActivity)importArchiveActivity
{
  return self->_importArchiveActivity;
}

- (void)setImportArchiveActivity:(id)a3
{
  objc_storeStrong((id *)&self->_importArchiveActivity, a3);
}

- (ICLockNoteActivity)lockNoteActivity
{
  return self->_lockNoteActivity;
}

- (void)setLockNoteActivity:(id)a3
{
  objc_storeStrong((id *)&self->_lockNoteActivity, a3);
}

- (ICMoveDecisionController)moveDecisionController
{
  return self->_moveDecisionController;
}

- (void)setMoveDecisionController:(id)a3
{
  objc_storeStrong((id *)&self->_moveDecisionController, a3);
}

- (ICDragSessionContext)currentDragSessionContext
{
  return self->_currentDragSessionContext;
}

- (void)setCurrentDragSessionContext:(id)a3
{
  objc_storeStrong((id *)&self->_currentDragSessionContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDragSessionContext, 0);
  objc_storeStrong((id *)&self->_moveDecisionController, 0);
  objc_storeStrong((id *)&self->_lockNoteActivity, 0);
  objc_storeStrong((id *)&self->_importArchiveActivity, 0);
  objc_storeStrong((id *)&self->_renameFolderActivity, 0);
  objc_storeStrong(&self->_optimisticallyAppliedSnapshotHandler, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_destroyWeak((id *)&self->_viewControllerManager);
  objc_storeStrong((id *)&self->_modernManagedObjectContext, 0);
  objc_storeStrong((id *)&self->_legacyManagedObjectContext, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
}

@end
