@implementation ICNoteResultsViewControllerCollectionViewDelegate

- (ICNoteResultsViewControllerCollectionViewDelegate)initWithNoteResultsViewController:(id)a3
{
  id v4;
  ICNoteResultsViewControllerCollectionViewDelegate *v5;
  ICNoteResultsViewControllerCollectionViewDelegate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICNoteResultsViewControllerCollectionViewDelegate;
  v5 = -[ICNoteResultsViewControllerCollectionViewDelegate init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_noteResultsViewController, v4);

  return v6;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  id v24;
  void *v25;
  id v26;

  v26 = a4;
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewControllerCollectionViewDelegate noteResultsViewController](self, "noteResultsViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewControllerManager"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewControllerCollectionViewDelegate noteResultsViewController](self, "noteResultsViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dataSource"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "collectionViewDiffableDataSource"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "itemIdentifierForIndexPath:", v7));

  if (!objc_msgSend(v9, "isAutomaticallySelectingNotes"))
  {
    if (!objc_msgSend(v9, "isTagSelected"))
      goto LABEL_31;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tagSelection"));
    v17 = objc_opt_class(ICTagCell);
    v18 = ICDynamicCast(v17, v26);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = objc_msgSend(v14, "mode");
    if (v20 == (id)1
      && (v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICTagAllTagsItemIdentifier sharedItemIdentifier](ICTagAllTagsItemIdentifier, "sharedItemIdentifier")), v13 == v10))
    {
      objc_msgSend(v19, "setSelected:", 1);
      v10 = v13;
    }
    else
    {
      if (objc_msgSend(v14, "mode"))
      {
        objc_msgSend(v19, "setSelected:", 0);
      }
      else
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "includedObjectIDs"));
        objc_msgSend(v19, "setSelected:", objc_msgSend(v21, "containsObject:", v13));

      }
      if (v20 != (id)1)
      {
LABEL_20:
        v24 = objc_msgSend(v14, "mode");
        if (v24 == (id)2
          && (v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICTagAllTagsItemIdentifier sharedItemIdentifier](ICTagAllTagsItemIdentifier, "sharedItemIdentifier")), v13 == v10))
        {
          objc_msgSend(v19, "setIsExcluded:", 1);
          v10 = v13;
        }
        else
        {
          if (objc_msgSend(v14, "mode"))
          {
            objc_msgSend(v19, "setIsExcluded:", 0);
          }
          else
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "excludedObjectIDs"));
            objc_msgSend(v19, "setIsExcluded:", objc_msgSend(v25, "containsObject:", v13));

          }
          if (v24 != (id)2)
            goto LABEL_29;
        }

LABEL_29:
        goto LABEL_30;
      }
    }

    goto LABEL_20;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICNoteResultsViewControllerCollectionViewDelegate noteResultsViewController](self, "noteResultsViewController"));
  if (objc_msgSend(v14, "isEditing"))
  {
LABEL_30:

    goto LABEL_31;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectedNoteObjectID"));
  if ((objc_msgSend(v13, "isEqual:", v15) & 1) == 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectedInvitationObjectID"));
    if (!objc_msgSend(v13, "isEqual:", v16))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectedSearchResult"));
      v23 = objc_msgSend(v13, "isEqual:", v22);

      if ((v23 & 1) == 0)
        goto LABEL_31;
      goto LABEL_7;
    }

  }
LABEL_7:
  objc_msgSend(v26, "setSelected:", 1);
LABEL_31:

}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_class(ICCollectionView);
  v9 = ICDynamicCast(v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contextMenuConfigurationForItemsAtIndexPaths:", v6));
  return v11;
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_opt_class(ICCollectionView);
  v11 = ICDynamicCast(v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "contextMenuPreviewForHighlightingMenuWithConfiguration:indexPath:", v8, v7));
  return v13;
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 dismissalPreviewForItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_opt_class(ICCollectionView);
  v11 = ICDynamicCast(v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "contextMenuPreviewForDismissingContextMenuWithConfiguration:indexPath:", v8, v7));
  return v13;
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_opt_class(ICCollectionView);
  v11 = ICDynamicCast(v10, v9);
  v12 = (id)objc_claimAutoreleasedReturnValue(v11);

  objc_msgSend(v12, "contextMenuWillPerformPreviewActionForMenuWithConfiguration:animator:", v8, v7);
}

- (id)_dci_collectionView:(id)a3 contextMenuConfiguration:(id)a4 previewForHighlightingItemAtIndexPath:(id)a5
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v6 = a5;
  v7 = a3;
  v8 = objc_opt_class(ICCollectionView);
  v9 = ICDynamicCast(v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "multiSelectionContextMenuPreviewForHighlightingItemAtIndexPath:", v6));
  return v11;
}

- (id)_dci_collectionView:(id)a3 contextMenuConfiguration:(id)a4 previewForDismissingToItemAtIndexPath:(id)a5
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v6 = a5;
  v7 = a3;
  v8 = objc_opt_class(ICCollectionView);
  v9 = ICDynamicCast(v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "multiSelectionContextMenuPreviewForHighlightingItemAtIndexPath:", v6));
  return v11;
}

- (ICNoteResultsViewController)noteResultsViewController
{
  return (ICNoteResultsViewController *)objc_loadWeakRetained((id *)&self->_noteResultsViewController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_noteResultsViewController);
}

@end
