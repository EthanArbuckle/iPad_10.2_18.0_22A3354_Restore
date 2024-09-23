@implementation PXPeopleRelatedWidget

- (PXPeopleRelatedWidget)initWithViewType:(unint64_t)a3
{
  PXPeopleRelatedWidget *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXPeopleRelatedWidget;
  result = -[PXPeopleRelatedWidget init](&v5, sel_init);
  if (result)
  {
    result->_viewType = a3;
    *(_WORD *)&result->_isSummaryMode = 1;
    result->_startedLoadingDataSource = 0;
    result->_contentViewAnchoringType = 1;
    result->_contentSize = (CGSize)*MEMORY[0x1E0C9D820];
    result->_cellSize = (CGSize)vdupq_n_s64(0x4052000000000000uLL);
  }
  return result;
}

- (void)_handleTap:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v4 = a3;
  -[PXPeopleRelatedWidget collectionViewController](self, "collectionViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "locationInView:", v6);
  objc_msgSend(v6, "indexPathForItemAtPoint:");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  -[PXPeopleRelatedWidget memberTappedAtIndexPath:atPoint:forPeopleStripController:](self, "memberTappedAtIndexPath:atPoint:forPeopleStripController:", v11, self->_collectionViewController, v8, v10);
}

- (void)setShowFooter:(BOOL)a3
{
  id v4;

  if (self->_showFooter != a3)
  {
    self->_showFooter = a3;
    -[PXPeopleRelatedWidget widgetDelegate](self, "widgetDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "widgetLocalizedDisclosureTitleDidChange:", self);

  }
}

- (void)setIsSummaryMode:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int64_t v6;
  id v7;

  if (self->_isSummaryMode != a3)
  {
    v3 = a3;
    self->_isSummaryMode = a3;
    -[PXPeopleRelatedWidget widgetDelegate](self, "widgetDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    v6 = 1;
    if (v3)
      v6 = 2;
    self->_contentViewAnchoringType = v6;
    objc_msgSend(v5, "widgetInvalidateContentViewAnchoringType:", self);
    objc_msgSend(v7, "widgetLocalizedDisclosureTitleDidChange:", self);

  }
}

- (void)loadContentData
{
  id v3;

  -[PXPeopleRelatedWidget _prepareDataSource](self, "_prepareDataSource");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_contentSizeCategoryChanged_, *MEMORY[0x1E0DC48E8], 0);

}

- (void)unloadContentData
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[PXPeopleRelatedWidget dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopListeningForChanges");

  -[PXPeopleRelatedWidget setCollectionViewController:](self, "setCollectionViewController:", 0);
  -[PXPeopleRelatedWidget setDataSource:](self, "setDataSource:", 0);
  self->_startedLoadingDataSource = 0;
}

- (BOOL)hasContentForCurrentInput
{
  PXPeopleRelatedWidget *v2;
  void *v3;

  v2 = self;
  -[PXPeopleRelatedWidget widgetUnlockDelegate](self, "widgetUnlockDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "widgetDeviceIsUnlocked:", v2);

  return (char)v2;
}

- (void)setContentSize:(CGSize)a3
{
  CGFloat height;
  double width;
  double v6;
  id v7;

  height = a3.height;
  width = a3.width;
  -[PXPeopleRelatedWidget collectionViewController](self, "collectionViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPeopleRelatedWidget contentSize](self, "contentSize");
  if (width != v6)
  {
    -[PXPeopleRelatedWidget _resetControllerLayoutInfosForWidth:](self, "_resetControllerLayoutInfosForWidth:", width);
    objc_msgSend(v7, "contentWidthChanged");
  }
  self->_contentSize.width = width;
  self->_contentSize.height = height;

}

- (void)setSpec:(id)a3
{
  PXWidgetSpec *v5;
  void *v6;
  PXWidgetSpec *v7;

  v5 = (PXWidgetSpec *)a3;
  if (self->_spec != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    -[PXPeopleRelatedWidget widgetDelegate](self, "widgetDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "widgetPreferredContentHeightForWidthDidChange:", self);

    v5 = v7;
  }

}

- (double)preferredContentHeightForWidth:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  uint64_t v13;
  double v14;

  -[PXPeopleRelatedWidget setTargetPrefetchWidth:](self, "setTargetPrefetchWidth:");
  -[PXPeopleRelatedWidget _prepareDataSource](self, "_prepareDataSource");
  -[PXPeopleRelatedWidget _realContentInset](self, "_realContentInset");
  v6 = v5;
  v8 = v7;
  -[PXPeopleRelatedWidget dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if (objc_msgSend(v9, "numberOfMembers"))
    {
      v13 = 0;
      v14 = 0.0;
      -[PXPeopleRelatedWidget _calculateLayoutInfosForWidth:cellSize:interitemSpacing:](self, "_calculateLayoutInfosForWidth:cellSize:interitemSpacing:", &v13, 0, a3);
      v11 = v8 + v6 + v14;
    }
    else
    {
      v11 = 0.0;
    }
  }
  else
  {
    v11 = v6 + v8;
  }

  return v11;
}

- (PXAnonymousView)contentView
{
  void *v3;
  void *v4;

  -[PXPeopleRelatedWidget _loadContainerView](self, "_loadContainerView");
  -[PXPeopleRelatedWidget collectionViewController](self, "collectionViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXAnonymousView *)v4;
}

- (NSString)localizedTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PXPeopleRelatedWidget dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[PXPeopleWidgetUtilities localizedTitleStringForWidgetDataSource:photoLibrary:](PXPeopleWidgetUtilities, "localizedTitleStringForWidgetDataSource:photoLibrary:", v2, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)contentSizeCategoryChanged:(id)a3
{
  double v4;
  double v5;
  void *v6;
  id v7;

  -[PXPeopleRelatedWidget contentSize](self, "contentSize", a3);
  if (v5 != 0.0 && v4 != 0.0)
  {
    -[PXPeopleRelatedWidget _resetControllerLayoutInfosForWidth:](self, "_resetControllerLayoutInfosForWidth:");
    -[PXPeopleRelatedWidget collectionViewController](self, "collectionViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentWidthChanged");

    -[PXPeopleRelatedWidget widgetDelegate](self, "widgetDelegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "widgetPreferredContentHeightForWidthDidChange:", self);

  }
}

- (UIEdgeInsets)sectionInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[PXPeopleRelatedWidget _realContentInset](self, "_realContentInset");
  v4 = 0.0;
  v5 = 0.0;
  result.right = v3;
  result.bottom = v5;
  result.left = v2;
  result.top = v4;
  return result;
}

- (void)memberTappedAtIndexPath:(id)a3 atPoint:(CGPoint)a4 forPeopleStripController:(id)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  PXPeopleDetailViewController *v13;
  NSObject *p_super;
  void *v15;
  uint8_t v16[16];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return;
  v6 = a3;
  -[PXPeopleRelatedWidget dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "item");

  objc_msgSend(v7, "memberAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
LABEL_6:
    v11 = v10;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v11 = 0;
LABEL_8:
  +[PXAggdLogHelper sharedInstance](PXAggdLogHelper, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "logAddValueForScalarKey:forKey:", 1, *MEMORY[0x1E0D725F0]);

  if (v11
    && (v13 = -[PXPeopleDetailViewController initWithPeople:ignoreSharedLibraryFilters:]([PXPeopleDetailViewController alloc], "initWithPeople:ignoreSharedLibraryFilters:", v11, 0)) != 0)
  {
    p_super = &v13->super.super.super.super;
    -[PXPeopleRelatedWidget widgetDelegate](self, "widgetDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "widget:transitionToViewController:withTransitionType:", self, p_super, 1);

  }
  else
  {
    PLUIGetLog();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1A6789000, p_super, OS_LOG_TYPE_DEFAULT, "PXPeopleDetailViewController failed to init, can't transition to view controller.", v16, 2u);
    }
  }

}

- (void)peopleDataSourceMembersChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  __int128 v14;

  -[PXPeopleRelatedWidget _loadContainerView](self, "_loadContainerView", a3);
  -[PXPeopleRelatedWidget collectionViewController](self, "collectionViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

  -[PXPeopleRelatedWidget widgetDelegate](self, "widgetDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "widgetLocalizedTitleDidChange:", self);

  v14 = *MEMORY[0x1E0C9D820];
  -[PXPeopleRelatedWidget contentSize](self, "contentSize");
  if (v7 != 0.0 && v8 != 0.0)
  {
    v9 = v7;
    -[PXPeopleRelatedWidget _calculateLayoutInfosForWidth:cellSize:interitemSpacing:](self, "_calculateLayoutInfosForWidth:cellSize:interitemSpacing:", &v14, 0);
    -[PXPeopleRelatedWidget cellSize](self, "cellSize");
    if (*(double *)&v14 != v11 || *((double *)&v14 + 1) != v10)
    {
      -[PXPeopleRelatedWidget _resetControllerLayoutInfosForWidth:](self, "_resetControllerLayoutInfosForWidth:", v9);
      -[PXPeopleRelatedWidget collectionViewController](self, "collectionViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "contentWidthChanged");

      -[PXPeopleRelatedWidget widgetDelegate](self, "widgetDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "widgetPreferredContentHeightForWidthDidChange:", self);

    }
  }
}

- (void)peopleDataSource:(id)a3 didApplyIncrementalChanges:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  PXPeopleRelatedWidget *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;

  v5 = a4;
  -[PXPeopleRelatedWidget collectionViewController](self, "collectionViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v5, "hasMoves");
  v9 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    objc_msgSend(v7, "reloadData");
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB36B0];
    objc_msgSend(v5, "insertedIndexes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "px_indexPathsForItems:inSection:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0CB36B0];
    objc_msgSend(v5, "removedIndexes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "px_indexPathsForItems:inSection:", v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0CB36B0];
    objc_msgSend(v5, "changedIndexes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "px_indexPathsForItems:inSection:", v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v28[0] = v9;
    v28[1] = 3221225472;
    v28[2] = __69__PXPeopleRelatedWidget_peopleDataSource_didApplyIncrementalChanges___block_invoke;
    v28[3] = &unk_1E513DD48;
    v29 = v15;
    v30 = v7;
    v31 = v12;
    v32 = v18;
    v19 = v18;
    v20 = v12;
    v21 = v15;
    objc_msgSend(v30, "performBatchUpdates:completion:", v28, 0);

  }
  -[PXPeopleRelatedWidget collectionViewController](self, "collectionViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "collectionView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "reloadData");

  -[PXPeopleRelatedWidget widgetDelegate](self, "widgetDelegate");
  v25[0] = v9;
  v25[1] = 3221225472;
  v25[2] = __69__PXPeopleRelatedWidget_peopleDataSource_didApplyIncrementalChanges___block_invoke_2;
  v25[3] = &unk_1E5148D08;
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v27 = self;
  v24 = v26;
  objc_msgSend(v24, "widget:animateChanges:withAnimationOptions:", self, v25, 0);

}

- (void)peopleDataSource:(id)a3 didAddMembersAtIndexPaths:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB36B0], "px_indexPathsForItems:inSection:", a4, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPeopleRelatedWidget collectionViewController](self, "collectionViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertItemsAtIndexPaths:", v7);

}

- (void)peopleDataSource:(id)a3 didRemoveMembersAtIndexPaths:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB36B0], "px_indexPathsForItems:inSection:", a4, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPeopleRelatedWidget collectionViewController](self, "collectionViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteItemsAtIndexPaths:", v7);

}

- (void)peopleDataSource:(id)a3 didUpdateMembersAtIndexPaths:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB36B0], "px_indexPathsForItems:inSection:", a4, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPeopleRelatedWidget collectionViewController](self, "collectionViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadItemsAtIndexPaths:", v7);

}

- (void)_prepareDataSource
{
  void *v3;
  void *v4;
  void *v5;
  PXPeopleWidgetDataSource *v6;
  void *v7;
  void *v8;
  PXPeopleWidgetDataSource *v9;
  char isKindOfClass;
  uint64_t v11;
  char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  PXPeopleWidgetDataSource *v25;
  _QWORD v26[4];
  PXPeopleWidgetDataSource *v27;
  PXPeopleRelatedWidget *v28;
  uint64_t v29;
  uint64_t v30;
  id (*v31)(uint64_t);
  void *v32;
  id v33;
  PXPeopleRelatedWidget *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!-[PXPeopleRelatedWidget hasStartedLoadingDataSource](self, "hasStartedLoadingDataSource"))
  {
    -[PXPeopleRelatedWidget setStartedLoadingDataSource:](self, "setStartedLoadingDataSource:", 1);
    -[PXPeopleRelatedWidget context](self, "context");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "assetCollections");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = [PXPeopleWidgetDataSource alloc];
      objc_msgSend(v3, "photosDataSource");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "photoLibrary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[PXPeopleWidgetDataSource initWithPhotoLibrary:name:objectsReloadBlock:](v6, "initWithPhotoLibrary:name:objectsReloadBlock:", v8, CFSTR("People Widget"), &__block_literal_global_141_220250);

      if (-[PXPeopleRelatedWidget viewType](self, "viewType") == 1)
        -[PXPeopleWidgetDataSource setIsForOneUp:](v9, "setIsForOneUp:", 1);
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v11 = MEMORY[0x1E0C809B0];
      v12 = "LemonadeProfileButtonFactory" + 16;
      if ((isKindOfClass & 1) != 0)
      {
        -[PXPeopleWidgetDataSource setContext:](v9, "setContext:", v3);
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        objc_msgSend(v3, "people");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v39;
          do
          {
            v18 = 0;
            do
            {
              if (*(_QWORD *)v39 != v17)
                objc_enumerationMutation(v14);
              objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v18), "localIdentifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObject:", v19);

              ++v18;
            }
            while (v16 != v18);
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
          }
          while (v16);
        }

        v20 = (void *)MEMORY[0x1E0CB3880];
        v11 = MEMORY[0x1E0C809B0];
        v36[0] = MEMORY[0x1E0C809B0];
        v12 = "uttonFactory";
        v36[1] = 3221225472;
        v36[2] = __43__PXPeopleRelatedWidget__prepareDataSource__block_invoke_2;
        v36[3] = &unk_1E5138110;
        v37 = v13;
        v21 = v13;
        objc_msgSend(v20, "predicateWithBlock:", v36);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXPeopleDataSource setFilterPredicate:](v9, "setFilterPredicate:", v22);

      }
      -[PXPeopleDataSource setDelegate:](v9, "setDelegate:", self);
      v29 = v11;
      v30 = *((_QWORD *)v12 + 7);
      v23 = v30;
      v31 = __43__PXPeopleRelatedWidget__prepareDataSource__block_invoke_3;
      v32 = &unk_1E5138138;
      v33 = v5;
      v34 = self;
      v35 = v3;
      -[PXPeopleDataSource setReloadBlock:](v9, "setReloadBlock:", &v29);
      -[PXPeopleRelatedWidget setDataSource:](self, "setDataSource:", v9);
      objc_msgSend((id)objc_opt_class(), "_deferredDataSourceLoadingQueue");
      v24 = objc_claimAutoreleasedReturnValue();
      v26[0] = v11;
      v26[1] = v23;
      v26[2] = __43__PXPeopleRelatedWidget__prepareDataSource__block_invoke_4;
      v26[3] = &unk_1E5148D08;
      v27 = v9;
      v28 = self;
      v25 = v9;
      dispatch_async(v24, v26);

    }
  }
}

- (UIEdgeInsets)_realContentInset
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIEdgeInsets result;

  -[PXPeopleRelatedWidget spec](self, "spec");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentGuideInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(v2, "distanceBetweenHeaderBaselineAndWidgetContentTop");
  if (v11 > v4)
  {
    v12 = v11;
    if (objc_msgSend(v2, "userInterfaceIdiom") != 3)
      v4 = v12;
  }

  v13 = v4;
  v14 = v6;
  v15 = v8;
  v16 = v10;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (void)_loadContainerView
{
  void *v3;
  PXPeopleStripCollectionViewController *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  PXUITapGestureRecognizer *v12;
  PXUITapGestureRecognizer *tapGestureRecognizer;
  PXUITapGestureRecognizer *v14;
  PXUITapGestureRecognizer *pressGestureRecognizer;
  id v16;

  -[PXPeopleRelatedWidget _prepareDataSource](self, "_prepareDataSource");
  -[PXPeopleRelatedWidget dataSource](self, "dataSource");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPeopleRelatedWidget collectionViewController](self, "collectionViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && v16)
  {
    v4 = -[PXPeopleStripCollectionViewController initWithDataSource:delegate:]([PXPeopleStripCollectionViewController alloc], "initWithDataSource:delegate:", v16, self);
    -[PXPeopleStripCollectionViewController collectionView](v4, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleRelatedWidget setCollectionViewController:](self, "setCollectionViewController:", v4);
    -[PXPeopleRelatedWidget _realContentInset](self, "_realContentInset");
    objc_msgSend(v5, "setFrame:", 0.0, 0.0, v6 + v7, v8 + v9);
    objc_msgSend(v5, "setShowsVerticalScrollIndicator:", 0);
    objc_msgSend(v5, "setShowsHorizontalScrollIndicator:", 0);

  }
  -[PXPeopleRelatedWidget widgetDelegate](self, "widgetDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "widgetViewHostingGestureRecognizers:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PXUITapGestureRecognizer initWithTarget:action:]([PXUITapGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleTap_);
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v12;

  -[PXUITapGestureRecognizer setDelegate:](self->_tapGestureRecognizer, "setDelegate:", self);
  -[PXUITapGestureRecognizer setCancelsTouchesInView:](self->_tapGestureRecognizer, "setCancelsTouchesInView:", 0);
  objc_msgSend(v11, "addGestureRecognizer:", self->_tapGestureRecognizer);
  v14 = -[PXUITapGestureRecognizer initWithTarget:action:]([PXUITapGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleTap_);
  pressGestureRecognizer = self->_pressGestureRecognizer;
  self->_pressGestureRecognizer = v14;

  -[PXUITapGestureRecognizer setAllowedPressTypes:](self->_pressGestureRecognizer, "setAllowedPressTypes:", &unk_1E53EA818);
  -[PXUITapGestureRecognizer setDelegate:](self->_pressGestureRecognizer, "setDelegate:", self);
  objc_msgSend(v11, "addGestureRecognizer:", self->_pressGestureRecognizer);

}

- (BOOL)_calculateLayoutInfosForWidth:(double)a3 cellSize:(CGSize *)a4 interitemSpacing:(double *)a5
{
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;

  -[PXPeopleRelatedWidget _realContentInset](self, "_realContentInset");
  if (a3 <= 1200.0)
  {
    v10 = 28.0;
    if (a3 < 1024.0)
    {
      v10 = 24.0;
      if (a3 < 730.0)
      {
        v10 = 12.0;
        if (a3 >= 414.0)
          v10 = 20.0;
      }
    }
  }
  else
  {
    v10 = 32.0;
  }
  v11 = v9 + -4.0;
  if (v11 < v10)
    v10 = v11;
  v12 = fmax(v10, 12.0);
  -[PXPeopleRelatedWidget _sizeForItemWithWidth:withInterItemSpacing:](self, "_sizeForItemWithWidth:withInterItemSpacing:", a3, v12);
  if (a4)
  {
    a4->width = v13;
    a4->height = v14;
  }
  if (a5)
    *a5 = v12;
  return 1;
}

- (CGSize)_sizeForItemWithWidth:(double)a3 withInterItemSpacing:(double)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  double v12;
  double v13;
  CGSize result;

  -[PXPeopleRelatedWidget _realContentInset](self, "_realContentInset");
  v8 = v7;
  v10 = v9;
  v11 = -[PXPeopleRelatedWidget _numberOfVisibleFacesForWidth:](self, "_numberOfVisibleFacesForWidth:", a3);
  v12 = (double)(((unint64_t)((a3 - v8 - v10 - (double)v11 * a4) / (double)v11) + 1) & 0xFFFFFFFFFFFFFFFELL);
  v13 = v12;
  result.height = v13;
  result.width = v12;
  return result;
}

- (id)traitCollection
{
  void *v3;
  void *v4;
  void *v5;

  -[PXPeopleRelatedWidget widgetDelegate](self, "widgetDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "widgetExtendedTraitCollection:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)_numberOfVisibleFacesForWidth:(double)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v10;
  unint64_t v11;

  -[PXPeopleRelatedWidget traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "horizontalSizeClass");
  v7 = 3;
  if (a3 > 321.0)
    v7 = 4;
  v8 = 7;
  if (a3 <= 1200.0)
    v8 = 5;
  if (v6 != 1 && a3 > 768.0)
    v10 = v8;
  else
    v10 = v7;
  if (-[PXFeatureSpec userInterfaceIdiom](self->_spec, "userInterfaceIdiom") == 3)
    v11 = 5;
  else
    v11 = v10;

  return v11;
}

- (void)_resetControllerLayoutInfosForWidth:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;

  if (a3 != 0.0)
  {
    v9 = v3;
    v10 = v4;
    v7 = 0.0;
    v8 = 0.0;
    v6 = 0.0;
    -[PXPeopleRelatedWidget _calculateLayoutInfosForWidth:cellSize:interitemSpacing:](self, "_calculateLayoutInfosForWidth:cellSize:interitemSpacing:", &v7, &v6);
    -[PXPeopleRelatedWidget setCellSize:](self, "setCellSize:", v7, v8);
    -[PXPeopleRelatedWidget setCellMinLineSpacing:](self, "setCellMinLineSpacing:", v6);
    -[PXPeopleRelatedWidget setCellMinInteritemSpacing:](self, "setCellMinInteritemSpacing:", 0.0);
  }
}

- (void)_setHasLoadedContentData:(BOOL)a3
{
  id v4;

  if (self->_hasLoadedContentData != a3)
  {
    self->_hasLoadedContentData = a3;
    -[PXPeopleRelatedWidget widgetDelegate](self, "widgetDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "widgetHasLoadedContentDataDidChange:", self);

  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  PXUITapGestureRecognizer *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (PXUITapGestureRecognizer *)a3;
  if (-[PXPeopleRelatedWidget isUserInteractionEnabled](self, "isUserInteractionEnabled")
    && (self->_tapGestureRecognizer == v4 || self->_pressGestureRecognizer == v4))
  {
    -[PXPeopleRelatedWidget collectionViewController](self, "collectionViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXUITapGestureRecognizer locationInView:](v4, "locationInView:", v7);
    objc_msgSend(v7, "indexPathForItemAtPoint:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (PXWidgetDelegate)widgetDelegate
{
  return (PXWidgetDelegate *)objc_loadWeakRetained((id *)&self->_widgetDelegate);
}

- (void)setWidgetDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_widgetDelegate, a3);
}

- (PXPhotosDetailsContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (PXWidgetSpec)spec
{
  return self->_spec;
}

- (int64_t)contentViewAnchoringType
{
  return self->_contentViewAnchoringType;
}

- (BOOL)isUserInteractionEnabled
{
  return self->_userInteractionEnabled;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  self->_userInteractionEnabled = a3;
}

- (PXWidgetUnlockDelegate)widgetUnlockDelegate
{
  return (PXWidgetUnlockDelegate *)objc_loadWeakRetained((id *)&self->_widgetUnlockDelegate);
}

- (void)setWidgetUnlockDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_widgetUnlockDelegate, a3);
}

- (PXPeopleStripCollectionViewController)collectionViewController
{
  return self->_collectionViewController;
}

- (void)setCollectionViewController:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewController, a3);
}

- (BOOL)isSummaryMode
{
  return self->_isSummaryMode;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)cellSize
{
  double width;
  double height;
  CGSize result;

  width = self->_cellSize.width;
  height = self->_cellSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCellSize:(CGSize)a3
{
  self->_cellSize = a3;
}

- (double)cellMinInteritemSpacing
{
  return self->_cellMinInteritemSpacing;
}

- (void)setCellMinInteritemSpacing:(double)a3
{
  self->_cellMinInteritemSpacing = a3;
}

- (double)cellMinLineSpacing
{
  return self->_cellMinLineSpacing;
}

- (void)setCellMinLineSpacing:(double)a3
{
  self->_cellMinLineSpacing = a3;
}

- (BOOL)showFooter
{
  return self->_showFooter;
}

- (PXPeopleWidgetDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (BOOL)hasStartedLoadingDataSource
{
  return self->_startedLoadingDataSource;
}

- (void)setStartedLoadingDataSource:(BOOL)a3
{
  self->_startedLoadingDataSource = a3;
}

- (unint64_t)viewType
{
  return self->_viewType;
}

- (void)setViewType:(unint64_t)a3
{
  self->_viewType = a3;
}

- (double)targetPrefetchWidth
{
  return self->_targetPrefetchWidth;
}

- (void)setTargetPrefetchWidth:(double)a3
{
  self->_targetPrefetchWidth = a3;
}

- (BOOL)hasLoadedContentData
{
  return self->_hasLoadedContentData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionViewController, 0);
  objc_destroyWeak((id *)&self->_widgetUnlockDelegate);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_widgetDelegate);
  objc_storeStrong((id *)&self->_pressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
}

uint64_t __43__PXPeopleRelatedWidget__prepareDataSource__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "localIdentifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);
LABEL_11:

    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "localIdentifier", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }
    goto LABEL_11;
  }
LABEL_12:
  v11 = objc_msgSend(*(id *)(a1 + 32), "isEqualToSet:", v4, (_QWORD)v13);

  return v11 ^ 1u;
}

id __43__PXPeopleRelatedWidget__prepareDataSource__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CD1570], "fetchOptionsWithPhotoLibrary:orObject:", 0, *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIncludedDetectionTypes:", v3);

  if (objc_msgSend(*(id *)(a1 + 40), "viewType") == 1)
    v4 = 4;
  else
    v4 = 3;
  objc_msgSend(v2, "setPersonContext:", v4);
  objc_msgSend(*(id *)(a1 + 48), "assetsByCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsInAssetsFetchResult:options:", v6, v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __43__PXPeopleRelatedWidget__prepareDataSource__block_invoke_4(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__PXPeopleRelatedWidget__prepareDataSource__block_invoke_5;
  v4[3] = &unk_1E5148D08;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = v2;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v4);

}

void __43__PXPeopleRelatedWidget__prepareDataSource__block_invoke_5(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__PXPeopleRelatedWidget__prepareDataSource__block_invoke_6;
  v5[3] = &unk_1E5148D08;
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v3, "loadObjectsAndUpdateMembersWithCompletion:", v5);

}

void __43__PXPeopleRelatedWidget__prepareDataSource__block_invoke_6(uint64_t a1)
{
  double v2;
  double v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  _QWORD block[5];
  double v11;
  double v12;

  objc_msgSend(*(id *)(a1 + 32), "loadMembersWithCompletionBlock:", 0);
  objc_msgSend(*(id *)(a1 + 40), "targetPrefetchWidth");
  if (v2 > 0.0)
  {
    v3 = v2;
    v4 = objc_msgSend(*(id *)(a1 + 40), "_numberOfVisibleFacesForWidth:");
    v11 = 0.0;
    v12 = 0.0;
    objc_msgSend(*(id *)(a1 + 40), "_calculateLayoutInfosForWidth:cellSize:interitemSpacing:", &v11, 0, v3);
    v2 = v11;
    if (v11 > 0.0)
    {
      v2 = v12;
      if (v12 > 0.0)
      {
        v5 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "collectionViewController", v12);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "collectionView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "traitCollection");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "displayScale");
        objc_msgSend(v5, "prefetchThumbnailsForTargetSize:displayScale:maxFetchCount:", v4 + 1, v11, v12, v9);

      }
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "startListeningForChanges", v2);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__PXPeopleRelatedWidget__prepareDataSource__block_invoke_7;
  block[3] = &unk_1E5149198;
  block[4] = *(_QWORD *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __43__PXPeopleRelatedWidget__prepareDataSource__block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setHasLoadedContentData:", 1);
}

uint64_t __43__PXPeopleRelatedWidget__prepareDataSource__block_invoke()
{
  return 0;
}

uint64_t __69__PXPeopleRelatedWidget_peopleDataSource_didApplyIncrementalChanges___block_invoke(id *a1)
{
  uint64_t result;

  if (objc_msgSend(a1[4], "count"))
    objc_msgSend(a1[5], "deleteItemsAtIndexPaths:", a1[4]);
  if (objc_msgSend(a1[6], "count"))
    objc_msgSend(a1[5], "insertItemsAtIndexPaths:", a1[6]);
  result = objc_msgSend(a1[7], "count");
  if (result)
    return objc_msgSend(a1[5], "reloadItemsAtIndexPaths:", a1[7]);
  return result;
}

uint64_t __69__PXPeopleRelatedWidget_peopleDataSource_didApplyIncrementalChanges___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "widgetLocalizedTitleDidChange:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "widgetPreferredContentHeightForWidthDidChange:", *(_QWORD *)(a1 + 40));
}

+ (id)_deferredDataSourceLoadingQueue
{
  if (_deferredDataSourceLoadingQueue_onceToken != -1)
    dispatch_once(&_deferredDataSourceLoadingQueue_onceToken, &__block_literal_global_220271);
  return (id)_deferredDataSourceLoadingQueue_deferDataSourceLoadingQueue;
}

void __56__PXPeopleRelatedWidget__deferredDataSourceLoadingQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.photos.people.peopleRelatedWidgetDeferredLoading", v2);
  v1 = (void *)_deferredDataSourceLoadingQueue_deferDataSourceLoadingQueue;
  _deferredDataSourceLoadingQueue_deferDataSourceLoadingQueue = (uint64_t)v0;

}

@end
