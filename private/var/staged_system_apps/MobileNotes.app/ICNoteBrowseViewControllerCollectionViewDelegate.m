@implementation ICNoteBrowseViewControllerCollectionViewDelegate

- (ICNoteBrowseViewControllerCollectionViewDelegate)initWithNoteBrowseViewController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICNoteBrowseViewControllerCollectionViewDelegate;
  return -[ICNoteResultsViewControllerCollectionViewDelegate initWithNoteResultsViewController:](&v4, "initWithNoteResultsViewController:", a3);
}

- (ICNoteBrowseViewController)noteBrowseViewController
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_opt_class(ICNoteBrowseViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewControllerCollectionViewDelegate noteResultsViewController](self, "noteResultsViewController"));
  v5 = ICDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (ICNoteBrowseViewController *)v6;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewControllerCollectionViewDelegate noteBrowseViewController](self, "noteBrowseViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "noteDataSource"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "collectionViewDiffableDataSource"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "itemIdentifierForIndexPath:", v7));

  v12 = objc_opt_class(NSManagedObjectID);
  v13 = ICDynamicCast(v12, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if (v14)
  {
    if (objc_msgSend(v6, "allowsMultipleSelection"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathsForSelectedItems"));
      v16 = objc_msgSend(v15, "count") != 0;

    }
    else
    {
      v16 = 0;
    }
    if ((objc_msgSend(v14, "ic_isNoteType") & 1) != 0)
      v22 = 1;
    else
      v22 = objc_msgSend(v14, "ic_isInvitationType");
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewControllerCollectionViewDelegate noteBrowseViewController](self, "noteBrowseViewController"));
    LODWORD(self) = (objc_msgSend(v19, "isEditing") | v16) ^ 1 | v22;
  }
  else
  {
    v17 = objc_opt_class(ICTagAllTagsItemIdentifier);
    v18 = ICDynamicCast(v17, v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewControllerCollectionViewDelegate noteBrowseViewController](self, "noteBrowseViewController"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "tagSelection"));
      LOBYTE(self) = objc_msgSend(v21, "mode") != (id)1;

    }
    else
    {
      LOBYTE(self) = 0;
    }
  }

  return (char)self;
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewControllerCollectionViewDelegate noteBrowseViewController](self, "noteBrowseViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionView"));
  v8 = objc_msgSend(v7, "canFocusItemAtIndexPath:", v5);

  return v8;
}

- (BOOL)collectionView:(id)a3 canPerformPrimaryActionForItemAtIndexPath:(id)a4
{
  return objc_msgSend(a3, "isEditing") ^ 1;
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewControllerCollectionViewDelegate noteBrowseViewController](self, "noteBrowseViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "noteDataSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionViewDiffableDataSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "itemIdentifierForIndexPath:", v5));

  v12 = v9;
  if (objc_msgSend(v12, "ic_isNoteType"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewControllerCollectionViewDelegate noteBrowseViewController](self, "noteBrowseViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "viewControllerManager"));
    objc_msgSend(v11, "ensureNoteEditorPresentedAnimated:startEditing:", 1, 0);
LABEL_7:

    goto LABEL_8;
  }
  if (objc_msgSend(v12, "ic_isContainerType"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewControllerCollectionViewDelegate noteBrowseViewController](self, "noteBrowseViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "viewControllerManager"));
    objc_msgSend(v11, "selectContainerWithIdentifier:usingRootViewController:deferUntilDataLoaded:animated:", v12, 0, 1, 1);
    goto LABEL_7;
  }
  if (objc_msgSend(v12, "ic_isInvitationType"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewControllerCollectionViewDelegate noteBrowseViewController](self, "noteBrowseViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "viewControllerManager"));
    objc_msgSend(v11, "selectInvitationWithObjectID:animated:", v12, 1);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;

  v23 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewControllerCollectionViewDelegate noteBrowseViewController](self, "noteBrowseViewController"));
  v8 = objc_msgSend(v7, "isEditing");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewControllerCollectionViewDelegate noteBrowseViewController](self, "noteBrowseViewController"));
    objc_msgSend(v9, "updateBarButtonItemsAnimated:", 0);
LABEL_14:

    goto LABEL_15;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "indexPathsForSelectedItems"));
  v11 = objc_msgSend(v10, "count");

  if (v11 == (id)1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewControllerCollectionViewDelegate noteBrowseViewController](self, "noteBrowseViewController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "noteDataSource"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "collectionViewDiffableDataSource"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "itemIdentifierForIndexPath:", v6));

    v15 = objc_opt_class(NSManagedObjectID);
    v16 = ICDynamicCast(v15, v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    if (+[ICTagCoreDataIndexer isTagItemIdentifier:](ICTagCoreDataIndexer, "isTagItemIdentifier:", v9))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewControllerCollectionViewDelegate noteBrowseViewController](self, "noteBrowseViewController"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "tagSelection"));

      v20 = objc_opt_class(ICTagAllTagsItemIdentifier);
      if ((objc_opt_isKindOfClass(v9, v20) & 1) != 0)
      {
        objc_msgSend(v19, "setMode:", 1);
      }
      else
      {
        v22 = objc_opt_class(NSManagedObjectID);
        if ((objc_opt_isKindOfClass(v9, v22) & 1) != 0)
        {
          objc_msgSend(v19, "setMode:", 0);
          objc_msgSend(v19, "addObjectID:toExcluded:", v9, 0);
        }
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewControllerCollectionViewDelegate noteBrowseViewController](self, "noteBrowseViewController"));
      objc_msgSend(v21, "setTagSelection:", v19);
    }
    else
    {
      if (!objc_msgSend(v17, "ic_isNoteType"))
      {
LABEL_13:

        goto LABEL_14;
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewControllerCollectionViewDelegate noteBrowseViewController](self, "noteBrowseViewController"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "viewControllerManager"));
      objc_msgSend(v21, "selectNoteWithObjectID:scrollState:startEditing:animated:ensurePresented:", v17, 0, 0, 1, 1);
    }

    goto LABEL_13;
  }
LABEL_15:

}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewControllerCollectionViewDelegate noteBrowseViewController](self, "noteBrowseViewController"));
  v6 = objc_msgSend(v5, "isEditing");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewControllerCollectionViewDelegate noteBrowseViewController](self, "noteBrowseViewController"));
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "updateBarButtonItemsAnimated:", 0);
    v9 = v8;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "noteDataSource"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "collectionViewDiffableDataSource"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "itemIdentifierForIndexPath:", v15));

    if (+[ICTagCoreDataIndexer isTagItemIdentifier:](ICTagCoreDataIndexer, "isTagItemIdentifier:", v9))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewControllerCollectionViewDelegate noteBrowseViewController](self, "noteBrowseViewController"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tagSelection"));

      objc_msgSend(v13, "removeObjectID:fromExcluded:", v9, 0);
      if (objc_msgSend(v13, "isEmpty"))
        objc_msgSend(v13, "setMode:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewControllerCollectionViewDelegate noteBrowseViewController](self, "noteBrowseViewController"));
      objc_msgSend(v14, "setTagSelection:", v13);

    }
  }

}

- (BOOL)collectionView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  return 1;
}

- (void)collectionView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewControllerCollectionViewDelegate noteBrowseViewController](self, "noteBrowseViewController"));
  v6 = objc_msgSend(v5, "isEditing");

  objc_msgSend(v7, "setEditing:animated:", v6, 1);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  v6 = objc_opt_class(ICTagDetailCell);
  if ((objc_opt_isKindOfClass(v14, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewControllerCollectionViewDelegate noteBrowseViewController](self, "noteBrowseViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewControllerManager"));
    objc_msgSend(v14, "setShowOperatorMenuButton:", objc_msgSend(v8, "hasCompactWidth"));
LABEL_5:

    goto LABEL_6;
  }
  v9 = objc_opt_class(ICTagContainerCell);
  if ((objc_opt_isKindOfClass(v14, v9) & 1) != 0)
  {
    v10 = objc_opt_class(ICTagContainerCell);
    v11 = ICDynamicCast(v10, v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewControllerCollectionViewDelegate noteBrowseViewController](self, "noteBrowseViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewControllerManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tagSelection"));
    objc_msgSend(v7, "selectTagsWithTagSelection:animated:", v13, 0);

    goto LABEL_5;
  }
LABEL_6:

}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  if (objc_msgSend(a5, "isEqualToString:", UICollectionElementKindSectionFooter))
  {
    v8 = objc_opt_class(ICToolbarSummaryView);
    if ((objc_opt_isKindOfClass(v11, v8) & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewControllerCollectionViewDelegate noteBrowseViewController](self, "noteBrowseViewController"));
      objc_msgSend(v9, "setSummaryView:", v11);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewControllerCollectionViewDelegate noteBrowseViewController](self, "noteBrowseViewController"));
      objc_msgSend(v10, "updateSummaryView");

    }
  }

}

- (id)_indexPathOfReferenceItemForLayoutTransitionInCollectionView:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  id v15;
  CGRect v17;
  CGRect v18;

  v3 = a3;
  if (objc_msgSend(v3, "numberOfSections") && objc_msgSend(v3, "numberOfItemsInSection:", 0))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layoutAttributesForItemAtIndexPath:", v4));
    objc_msgSend(v5, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(v3, "visibleBounds");
    v18.origin.x = v7;
    v18.origin.y = v9;
    v18.size.width = v11;
    v18.size.height = v13;
    if (CGRectContainsRect(v17, v18))
      v14 = v4;
    else
      v14 = 0;
    v15 = v14;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)collectionView:(id)a3 sceneActivationConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v23[7];
  _QWORD v24[7];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewControllerCollectionViewDelegate noteBrowseViewController](self, "noteBrowseViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "noteDataSource"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "collectionViewDiffableDataSource"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "itemIdentifierForIndexPath:", v8));

  v13 = objc_opt_class(NSManagedObjectID);
  v14 = ICDynamicCast(v13, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_10008FE80;
  v29 = sub_10008FE90;
  v30 = 0;
  if (objc_msgSend(v15, "ic_isModernNoteType"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewControllerCollectionViewDelegate noteBrowseViewController](self, "noteBrowseViewController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "modernViewContext"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10008FE98;
    v24[3] = &unk_1005502C0;
    v18 = v24;
    v24[4] = self;
    v24[5] = v15;
    v24[6] = &v25;
    objc_msgSend(v17, "performBlockAndWait:", v24);
  }
  else
  {
    if (!objc_msgSend(v15, "ic_isLegacyNoteType"))
      goto LABEL_6;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteBrowseViewControllerCollectionViewDelegate noteBrowseViewController](self, "noteBrowseViewController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "legacyViewContext"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10008FF54;
    v23[3] = &unk_1005502C0;
    v18 = v23;
    v23[4] = self;
    v23[5] = v15;
    v23[6] = &v25;
    objc_msgSend(v17, "performBlockAndWait:", v23);
  }

LABEL_6:
  if (v26[5])
  {
    v19 = objc_msgSend(objc_alloc((Class)NSUserActivity), "initWithActivityType:", CFSTR("com.apple.notes.open.object"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v26[5], "absoluteString"));
    objc_msgSend(v19, "setTargetContentIdentifier:", v20);

    objc_msgSend(v19, "setUserInfo:", &off_10057C7D8);
    v21 = objc_msgSend(objc_alloc((Class)UIWindowSceneActivationConfiguration), "initWithUserActivity:", v19);

  }
  else
  {
    v21 = 0;
  }
  _Block_object_dispose(&v25, 8);

  return v21;
}

@end
