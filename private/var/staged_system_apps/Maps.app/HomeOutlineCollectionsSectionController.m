@implementation HomeOutlineCollectionsSectionController

- (HomeOutlineCollectionsSectionController)initWithConfiguration:(id)a3
{
  HomeOutlineCollectionsSectionController *v3;
  CurrentLocationDataProvider *v4;
  CurrentLocationDataProvider *currentLocationDataProvider;
  CollectionsDataProvider *v6;
  CollectionsDataProvider *collectionsDataProvider;
  DistanceUnitDataProvider *v8;
  DistanceUnitDataProvider *distanceUnitDataProvider;
  uint64_t v10;
  NSMutableDictionary *sortItems;
  uint64_t v12;
  NSMutableArray *dropCollectionEditSessions;
  uint64_t v14;
  NSMutableArray *deleteCollectionEditSessions;
  uint64_t v16;
  NSMutableArray *moveCollectionEditSessions;
  uint64_t v18;
  NSMutableArray *duplicateCollectionEditSessions;
  uint64_t v20;
  NSMutableDictionary *shortcutEditSessions;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)HomeOutlineCollectionsSectionController;
  v3 = -[HomeOutlineSectionController initWithConfiguration:](&v23, "initWithConfiguration:", a3);
  if (v3)
  {
    v4 = objc_alloc_init(CurrentLocationDataProvider);
    currentLocationDataProvider = v3->_currentLocationDataProvider;
    v3->_currentLocationDataProvider = v4;

    v6 = -[CollectionsDataProvider initWithContext:observeInfo:observeContents:]([CollectionsDataProvider alloc], "initWithContext:observeInfo:observeContents:", 1, 0, 1);
    collectionsDataProvider = v3->_collectionsDataProvider;
    v3->_collectionsDataProvider = v6;

    v8 = objc_alloc_init(DistanceUnitDataProvider);
    distanceUnitDataProvider = v3->_distanceUnitDataProvider;
    v3->_distanceUnitDataProvider = v8;

    v10 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    sortItems = v3->_sortItems;
    v3->_sortItems = (NSMutableDictionary *)v10;

    v12 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    dropCollectionEditSessions = v3->_dropCollectionEditSessions;
    v3->_dropCollectionEditSessions = (NSMutableArray *)v12;

    v14 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    deleteCollectionEditSessions = v3->_deleteCollectionEditSessions;
    v3->_deleteCollectionEditSessions = (NSMutableArray *)v14;

    v16 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    moveCollectionEditSessions = v3->_moveCollectionEditSessions;
    v3->_moveCollectionEditSessions = (NSMutableArray *)v16;

    v18 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    duplicateCollectionEditSessions = v3->_duplicateCollectionEditSessions;
    v3->_duplicateCollectionEditSessions = (NSMutableArray *)v18;

    v20 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    shortcutEditSessions = v3->_shortcutEditSessions;
    v3->_shortcutEditSessions = (NSMutableDictionary *)v20;

  }
  return v3;
}

- (NSArray)dataProviders
{
  CollectionsDataProvider *collectionsDataProvider;
  _QWORD v4[3];

  collectionsDataProvider = self->_collectionsDataProvider;
  v4[0] = self->_currentLocationDataProvider;
  v4[1] = collectionsDataProvider;
  v4[2] = self->_distanceUnitDataProvider;
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v4, 3));
}

- (void)homeDataProvidingObjectDidUpdate:(id)a3
{
  CollectionsDataProvider *v4;
  CollectionsDataProvider *collectionsDataProvider;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HomeOutlineCollectionsSectionController;
  v4 = (CollectionsDataProvider *)a3;
  -[HomeOutlineSectionController homeDataProvidingObjectDidUpdate:](&v6, "homeDataProvidingObjectDidUpdate:", v4);
  collectionsDataProvider = self->_collectionsDataProvider;

  if (collectionsDataProvider == v4)
    -[HomeOutlineCollectionsSectionController _performPendingCollectionOperationIfAvailable](self, "_performPendingCollectionOperationIfAvailable", v6.receiver, v6.super_class);
}

- (void)didApplyInitialSectionSnapshot
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HomeOutlineCollectionsSectionController;
  -[HomeOutlineSectionController didApplyInitialSectionSnapshot](&v3, "didApplyInitialSectionSnapshot");
  -[HomeOutlineCollectionsSectionController _performPendingCollectionOperationIfAvailable](self, "_performPendingCollectionOperationIfAvailable");
}

- (MapsUIDiffableDataSourceViewModel)sectionHeaderViewModel
{
  SectionHeaderAddOutlineCellModel *v3;
  void *v4;
  void *v5;
  SectionHeaderAddOutlineCellModel *v6;

  v3 = [SectionHeaderAddOutlineCellModel alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("[Proactive Tray] Guides Section"), CFSTR("localized string not found"), 0));
  v6 = -[SectionHeaderAddOutlineCellModel initWithTitle:accessoryDelegate:](v3, "initWithTitle:accessoryDelegate:", v5, self);

  return (MapsUIDiffableDataSourceViewModel *)v6;
}

- (NSArray)itemSnapshots
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  SmallButtonOutlineCellModel *v15;
  void *v16;
  void *v17;
  SmallButtonOutlineCellModel *v18;
  MapsUIDiffableDataSourceOutlineNodeSnapshot *v19;
  void *v20;
  void *v21;
  MapsUIDiffableDataSourceOutlineNodeSnapshot *v22;
  uint64_t v23;
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[4];
  id v28;
  HomeOutlineCollectionsSectionController *v29;
  id v30;
  int64_t v31;
  _QWORD v32[6];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CurrentLocationDataProvider currentLocation](self->_currentLocationDataProvider, "currentLocation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsDataProvider collections](self->_collectionsDataProvider, "collections"));
  v5 = -[DistanceUnitDataProvider distanceUnit](self->_distanceUnitDataProvider, "distanceUnit");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController selectedIdentifierPaths](self, "selectedIdentifierPaths"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sectionIdentifier"));
  v9 = -[HomeOutlineSectionController expanded](self, "expanded");
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100B88384;
  v32[3] = &unk_1011ACD28;
  v32[4] = self;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100B88390;
  v27[3] = &unk_1011ACD50;
  v10 = v6;
  v28 = v10;
  v29 = self;
  v11 = v3;
  v30 = v11;
  v31 = v5;
  v25[4] = self;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100B88BE8;
  v26[3] = &unk_1011ACD78;
  v26[4] = self;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100B88C54;
  v25[3] = &unk_1011ACDA0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[HomeOutlineSectionBuilder itemSnapshotsWithItems:sectionIdentifier:sectionExpanded:itemIdentifierBlock:viewModelBlock:childItemsBlock:expandedBlock:](HomeOutlineSectionBuilder, "itemSnapshotsWithItems:sectionIdentifier:sectionExpanded:itemIdentifierBlock:viewModelBlock:childItemsBlock:expandedBlock:", v4, v8, v9, v32, v27, v26, v25));

  if (-[HomeOutlineCollectionsSectionController _shouldShowAddButtonForItemSnapshots:](self, "_shouldShowAddButtonForItemSnapshots:", v12))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("[Proactive Tray] Add Guide"), CFSTR("localized string not found"), 0));

    v15 = [SmallButtonOutlineCellModel alloc];
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("plus.circle")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("plus.circle.fill")));
    v18 = -[SmallButtonOutlineCellModel initWithStyle:title:image:hoverImage:delegate:](v15, "initWithStyle:title:image:hoverImage:delegate:", 1, v14, v16, v17, self);

    v19 = [MapsUIDiffableDataSourceOutlineNodeSnapshot alloc];
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController sectionIdentifierPath](self, "sectionIdentifierPath"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "identifierPathByAppendingIdentifier:", CFSTR("AddButtonIdentifier")));
    v22 = -[MapsUIDiffableDataSourceOutlineNodeSnapshot initWithIdentifierPath:viewModel:childSnapshots:expanded:](v19, "initWithIdentifierPath:viewModel:childSnapshots:expanded:", v21, v18, &__NSArray0__struct, 0);

    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "arrayByAddingObject:", v22));
    v12 = (void *)v23;
  }
  -[HomeOutlineCollectionsSectionController _scrubSortItems](self, "_scrubSortItems");

  return (NSArray *)v12;
}

- (int64_t)_accessoryVisibilityForCollection:(id)a3 withAccessoryType:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  CollectionHandler *editingCollection;

  if ((unint64_t)(a4 - 1) > 1)
    return 0;
  editingCollection = self->_editingCollection;
  if (editingCollection == a3)
    return 0;
  else
    return objc_msgSend(a3, "isEqual:", editingCollection, v4, v5) ^ 1;
}

- (id)contentInjectorForSnapshot:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  HomeCollectionContentInjector *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewModel"));
  v6 = objc_opt_class(TwoLinesCollectionOutlineCellModel);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewModel"));
  v9 = v8;
  if ((isKindOfClass & 1) != 0 && v5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collection"));
    v11 = 0;
    goto LABEL_7;
  }
  v12 = objc_opt_class(TwoLinesCollectionMapItemOutlineCellModel);
  v13 = objc_opt_isKindOfClass(v9, v12);

  v10 = 0;
  if ((v13 & 1) == 0)
  {
    v11 = 0;
    v14 = 0;
    goto LABEL_11;
  }
  v11 = 0;
  v14 = 0;
  if (v9)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifierPath"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineCollectionsSectionController _collectionContainingIdentifierPath:](self, "_collectionContainingIdentifierPath:", v15));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewModel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapItem"));
LABEL_7:

    if (v10)
    {
      v14 = -[HomeCollectionContentInjector initWithCollection:selectedMapItem:]([HomeCollectionContentInjector alloc], "initWithCollection:selectedMapItem:", v10, v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "actionCoordinator"));
      -[HomeCollectionContentInjector setActionCoordinator:](v14, "setActionCoordinator:", v17);

    }
    else
    {
      v14 = 0;
    }
  }
LABEL_11:

  return v14;
}

- (id)shareItemSourceForSnapshot:(id)a3
{
  void *v4;
  void *v5;
  PersonalCollectionShareItemSource *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifierPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineCollectionsSectionController _collectionContainingIdentifierPath:](self, "_collectionContainingIdentifierPath:", v4));

  if (v5)
    v6 = -[PersonalCollectionShareItemSource initWithCollectionHandlerInfo:]([PersonalCollectionShareItemSource alloc], "initWithCollectionHandlerInfo:", v5);
  else
    v6 = 0;

  return v6;
}

- (void)showCollection:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100B88FD4;
  v6[3] = &unk_1011AD1E8;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[HomeOutlineCollectionsSectionController _waitForCollection:thenPerformOperation:](self, "_waitForCollection:thenPerformOperation:", v5, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)editCollection:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100B890E8;
  v6[3] = &unk_1011AD1E8;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[HomeOutlineCollectionsSectionController _waitForCollection:thenPerformOperation:](self, "_waitForCollection:thenPerformOperation:", v5, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (id)sourceViewForProfileTipPopover
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController sectionIdentifierPath](self, "sectionIdentifierPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sectionController:indexPathForIdentifierPath:", self, v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellForItemAtIndexPath:", v5));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController sectionIdentifierPath](self, "sectionIdentifierPath"));
    -[HomeOutlineSectionController expandElementAtIdentifierPath:](self, "expandElementAtIdentifierPath:", v9);

    v10 = v8;
  }

  return v8;
}

- (BOOL)shouldClearSelectionWithReason:(id)a3
{
  return (char *)objc_msgSend(a3, "action") - 3 < (char *)0xFFFFFFFFFFFFFFFELL;
}

- (BOOL)persistsExpansions
{
  return 1;
}

- (void)_clearPendingCollection
{
  CollectionHandler *pendingCollection;
  id pendingCollectionOperation;
  NSTimer *pendingCollectionTimer;

  pendingCollection = self->_pendingCollection;
  self->_pendingCollection = 0;

  pendingCollectionOperation = self->_pendingCollectionOperation;
  self->_pendingCollectionOperation = 0;

  -[NSTimer invalidate](self->_pendingCollectionTimer, "invalidate");
  pendingCollectionTimer = self->_pendingCollectionTimer;
  self->_pendingCollectionTimer = 0;

}

- (void)_waitForCollection:(id)a3 thenPerformOperation:(id)a4
{
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  unsigned int v10;
  void (**v11)(_QWORD);
  id pendingCollectionOperation;
  NSTimer *v13;
  NSTimer *pendingCollectionTimer;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v7 = a3;
  v8 = (void (**)(_QWORD))a4;
  -[HomeOutlineCollectionsSectionController _clearPendingCollection](self, "_clearPendingCollection");
  if (-[HomeOutlineCollectionsSectionController _dataProviderContainsCollection:](self, "_dataProviderContainsCollection:", v7)&& (v9 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate")), v10 = objc_msgSend(v9, "applySnapshotIfNeededWithSectionController:", self), v9, v10))
  {
    if (v8)
      v8[2](v8);
  }
  else
  {
    objc_initWeak(&location, self);
    objc_storeStrong((id *)&self->_pendingCollection, a3);
    v11 = objc_retainBlock(v8);
    pendingCollectionOperation = self->_pendingCollectionOperation;
    self->_pendingCollectionOperation = v11;

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100B89408;
    v15[3] = &unk_1011E7510;
    v16 = v7;
    objc_copyWeak(&v17, &location);
    v13 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v15, 10.0));
    pendingCollectionTimer = self->_pendingCollectionTimer;
    self->_pendingCollectionTimer = v13;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

}

- (void)_performPendingCollectionOperationIfAvailable
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;

  if (self->_pendingCollection)
  {
    if (-[HomeOutlineCollectionsSectionController _dataProviderContainsCollection:](self, "_dataProviderContainsCollection:"))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
      v4 = objc_msgSend(v3, "applySnapshotIfNeededWithSectionController:", self);

      if (v4)
      {
        v6 = objc_retainBlock(self->_pendingCollectionOperation);
        -[HomeOutlineCollectionsSectionController _clearPendingCollection](self, "_clearPendingCollection");
        v5 = v6;
        if (v6)
        {
          (*((void (**)(id))v6 + 2))(v6);
          v5 = v6;
        }

      }
    }
  }
}

- (void)_showCollection:(id)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineCollectionsSectionController _identifierForItem:](self, "_identifierForItem:", a3));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController sectionIdentifierPath](self, "sectionIdentifierPath"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifierPathByAppendingIdentifier:", v6));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController sectionSnapshot](self, "sectionSnapshot"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifierPathByRemovingFirstIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nodeSnapshotAtIdentifierPath:", v10));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController sectionIdentifierPath](self, "sectionIdentifierPath"));
      -[HomeOutlineSectionController expandElementAtIdentifierPath:](self, "expandElementAtIdentifierPath:", v12);

      -[HomeOutlineSectionController expandElementAtIdentifierPath:](self, "expandElementAtIdentifierPath:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
      objc_msgSend(v13, "sectionController:selectItemAtIdentifierPath:completion:", self, v8, v14);

    }
  }

}

- (void)_showAndEditCollection:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100B89760;
  v6[3] = &unk_1011AC888;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[HomeOutlineCollectionsSectionController _showCollection:completion:](self, "_showCollection:completion:", v5, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)_editCollection:(id)a3
{
  void *v5;
  void *v6;
  CollectionHandler *editingCollection;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_storeStrong((id *)&self->_editingCollection, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
  objc_msgSend(v5, "sectionController:setNeedsApplySnapshotAnimated:", self, 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
  objc_msgSend(v6, "applySnapshotIfNeededWithSectionController:", self);

  editingCollection = self->_editingCollection;
  self->_editingCollection = 0;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineCollectionsSectionController _identifierForItem:](self, "_identifierForItem:", v11));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController sectionSnapshot](self, "sectionSnapshot"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "childSnapshotWithIdentifier:", v8));

    if (v10)
      -[HomeOutlineCollectionsSectionController _editCollectionSnapshot:](self, "_editCollectionSnapshot:", v10);

  }
}

- (void)_editCollectionSnapshot:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewModel"));
  v6 = objc_opt_class(TwoLinesCollectionOutlineCellModel);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collection"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifierPath"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sectionController:indexPathForIdentifierPath:", self, v11));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "collectionView"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "cellForItemAtIndexPath:", v12));

      v16 = objc_opt_class(TwoLinesOutlineCell);
      if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
        v17 = v15;
      else
        v17 = 0;
      v18 = v17;

      if (v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAccessoryConfigurations"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "firstObject"));

        v21 = objc_opt_class(_UICellAccessoryConfigurationCustomView);
        if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
          v22 = v20;
        else
          v22 = 0;
        v23 = v22;

        if (v23)
        {
          objc_storeStrong((id *)&self->_editingCollection, v9);
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
          objc_msgSend(v24, "sectionController:setNeedsApplySnapshotAnimated:", self, 1);

          objc_initWeak(&location, self);
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "actionCoordinator"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "homeActionDelegate"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "homeContaineeViewController"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "customView"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "customView"));
          objc_msgSend(v27, "bounds");
          v29 = v28;
          v31 = v30;
          v33 = v32;
          v35 = v34;
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472;
          v40[2] = sub_100B89BF0;
          v40[3] = &unk_1011AD1E8;
          objc_copyWeak(&v42, &location);
          v41 = v9;
          objc_msgSend(v38, "viewController:editCollection:sourceView:sourceRect:completion:", v37, v41, v36, v40, v29, v31, v33, v35);

          objc_destroyWeak(&v42);
          objc_destroyWeak(&location);
        }

      }
    }

  }
}

- (BOOL)_dataProviderContainsCollection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsDataProvider collections](self->_collectionsDataProvider, "collections", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i) == v4
          || (objc_msgSend(v4, "isEqual:") & 1) != 0)
        {
          v10 = 1;
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v10 = 0;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v10 = 0;
  }
LABEL_13:

  return v10;
}

- (id)_identifierForItem:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___GEOTransitLine);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController identifierCache](self, "identifierCache"));
  if (v5)
  {
    v7 = MKMapItemIdentifierFromGEOTransitLine(v4);
    v8 = objc_claimAutoreleasedReturnValue(v7);

    v4 = (id)v8;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifierForObject:", v4));

  return v9;
}

- (id)_childItemsInCollection:(id)a3 excludeDeletions:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *i;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *j;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  _BOOL4 v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "content"));
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController sectionIdentifierPath](self, "sectionIdentifierPath"));
    v10 = objc_claimAutoreleasedReturnValue(-[HomeOutlineCollectionsSectionController _identifierForItem:](self, "_identifierForItem:", v6));
    v11 = (void *)v10;
    if (v10)
      v12 = (const __CFString *)v10;
    else
      v12 = &stru_1011EB268;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifierPathByAppendingIdentifier:", v12));

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "content"));
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    if (v15)
    {
      v16 = v15;
      v42 = v4;
      v17 = v14;
      v41 = v6;
      v18 = *(_QWORD *)v49;
      v19 = &__NSArray0__struct;
      while (2)
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v49 != v18)
            objc_enumerationMutation(v17);
          v21 = objc_claimAutoreleasedReturnValue(-[HomeOutlineCollectionsSectionController _identifierForItem:](self, "_identifierForItem:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i), v41));
          v22 = (void *)v21;
          if (v21)
            v23 = (const __CFString *)v21;
          else
            v23 = &stru_1011EB268;
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifierPathByAppendingIdentifier:", v23));

          v25 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController deletions](self, "deletions"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", v24));

          if (!v26)
          {

            v6 = v41;
            v27 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineCollectionsSectionController _sortItemForCollection:](self, "_sortItemForCollection:", v41));
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v27));

            if (v42)
            {
              v46 = 0u;
              v47 = 0u;
              v44 = 0u;
              v45 = 0u;
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "content"));
              v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
              if (v29)
              {
                v30 = v29;
                v43 = v14;
                v31 = *(_QWORD *)v45;
                do
                {
                  for (j = 0; j != v30; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v45 != v31)
                      objc_enumerationMutation(v28);
                    v33 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)j);
                    v34 = objc_claimAutoreleasedReturnValue(-[HomeOutlineCollectionsSectionController _identifierForItem:](self, "_identifierForItem:", v33));
                    v35 = (void *)v34;
                    if (v34)
                      v36 = (const __CFString *)v34;
                    else
                      v36 = &stru_1011EB268;
                    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifierPathByAppendingIdentifier:", v36));

                    v38 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController deletions](self, "deletions"));
                    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", v37));

                    if (!v39)
                      objc_msgSend(v43, "addObject:", v33);

                  }
                  v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
                }
                while (v30);
                v6 = v41;
                v14 = v43;
              }
            }
            else
            {
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "content"));
              objc_msgSend(v14, "addObjectsFromArray:", v28);
            }

            v19 = objc_msgSend(v14, "copy");
            goto LABEL_35;
          }
        }
        v16 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
        if (v16)
          continue;
        break;
      }
      v6 = v41;
      v14 = v17;
    }
    else
    {
      v19 = &__NSArray0__struct;
    }
LABEL_35:

  }
  else
  {
    v19 = &__NSArray0__struct;
  }

  return v19;
}

- (BOOL)_shouldShowAddButtonForItemSnapshots:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController deletions](self, "deletions", (_QWORD)v15));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifierPath"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v11));

        if (!v12)
        {
          v13 = 0;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_11:

  return v13;
}

- (id)_sortItemForCollection:(id)a3
{
  id v4;
  NSMutableDictionary *sortItems;
  void *v6;
  HomeCollectionSortItem *v7;
  NSMutableDictionary *v8;
  void *v9;

  v4 = a3;
  sortItems = self->_sortItems;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v7 = (HomeCollectionSortItem *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](sortItems, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    v7 = -[HomeCollectionSortItem initWithCollection:delegate:]([HomeCollectionSortItem alloc], "initWithCollection:delegate:", v4, self);
    v8 = self->_sortItems;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v7, v9);

  }
  return v7;
}

- (void)_scrubSortItems
{
  NSMutableDictionary *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  NSMutableDictionary *sortItems;
  void *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsDataProvider collections](self->_collectionsDataProvider, "collections", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        sortItems = self->_sortItems;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](sortItems, "objectForKeyedSubscript:", v11));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v12, v13);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  v14 = self->_sortItems;
  self->_sortItems = v3;

}

- (void)collectionSortItem:(id)a3 didSelectSortType:(int64_t)a4
{
  CollectionsDataProvider *collectionsDataProvider;
  id v7;
  void *v8;
  id v9;

  collectionsDataProvider = self->_collectionsDataProvider;
  v7 = a3;
  -[CollectionsDataProvider setActive:](collectionsDataProvider, "setActive:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collection"));

  objc_msgSend(v8, "setSortType:", a4);
  -[CollectionsDataProvider setActive:](self->_collectionsDataProvider, "setActive:", 1);
  v9 = (id)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
  objc_msgSend(v9, "sectionController:setNeedsApplySnapshotAnimated:", self, 0);

}

- (id)contextMenuForSnapshot:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  char v11;
  void *v12;
  uint64_t v13;
  char v14;
  void *v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewModel"));
  v6 = objc_opt_class(TwoLinesCollectionOutlineCellModel);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  if ((isKindOfClass & 1) != 0 && v5)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[HomeOutlineCollectionsSectionController _contextMenuForCollectionSnapshot:](self, "_contextMenuForCollectionSnapshot:", v4));
LABEL_10:
    v15 = (void *)v8;
    goto LABEL_11;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewModel"));
  v10 = objc_opt_class(TwoLinesCollectionMapItemOutlineCellModel);
  v11 = objc_opt_isKindOfClass(v9, v10);

  if ((v11 & 1) != 0 && v9)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[HomeOutlineCollectionsSectionController _contextMenuForMapItemSnapshot:](self, "_contextMenuForMapItemSnapshot:", v4));
    goto LABEL_10;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewModel"));
  v13 = objc_opt_class(TwoLinesTransitLineOutlineCellModel);
  v14 = objc_opt_isKindOfClass(v12, v13);

  v15 = 0;
  if ((v14 & 1) != 0 && v12)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[HomeOutlineCollectionsSectionController _contextMenuForTransitLineSnapshot:](self, "_contextMenuForTransitLineSnapshot:", v4));
    goto LABEL_10;
  }
LABEL_11:

  return v15;
}

- (id)_contextMenuForCollectionSnapshot:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id location;
  void *v60;
  _QWORD v61[2];
  void *v62;
  void *v63;
  void *v64;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewModel"));
  v6 = objc_opt_class(TwoLinesCollectionOutlineCellModel);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collection"));
  v10 = v9;
  if (v9
    && (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier")),
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("__internal_CollectionSavedLinesIdentifier")),
        v11,
        (v12 & 1) == 0))
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    objc_initWeak(&location, self);
    if (!objc_msgSend(v10, "handlerType"))
    {
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_100B8ADE0;
      v56[3] = &unk_1011AD1E8;
      objc_copyWeak(&v58, &location);
      v57 = v4;
      v14 = HomeEditCollectionAction(v56);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v64 = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v64, 1));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 1, v16));

      objc_msgSend(v40, "addObject:", v17);
      objc_destroyWeak(&v58);
    }
    if (!objc_msgSend(v10, "handlerType"))
    {
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_100B8AE1C;
      v53[3] = &unk_1011AD1E8;
      objc_copyWeak(&v55, &location);
      v54 = v4;
      v18 = HomeAddToCollectionAction(v53);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v63 = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v63, 1));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 1, v20));

      objc_msgSend(v40, "addObject:", v21);
      objc_destroyWeak(&v55);
    }
    if (!objc_msgSend(v10, "handlerType"))
    {
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_100B8AE58;
      v50[3] = &unk_1011AD1E8;
      objc_copyWeak(&v52, &location);
      v51 = v4;
      v22 = HomeDuplicateCollectionAction(v50);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      v62 = v23;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v62, 1));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 1, v24));

      objc_msgSend(v40, "addObject:", v25);
      objc_destroyWeak(&v52);
    }
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_100B8AE94;
    v47[3] = &unk_1011AD1E8;
    objc_copyWeak(&v49, &location);
    v26 = v4;
    v48 = v26;
    v27 = HomeOpenInNewTabAction(v47);
    v39 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100B8AED4;
    v44[3] = &unk_1011AD1E8;
    objc_copyWeak(&v46, &location);
    v28 = v26;
    v45 = v28;
    v29 = HomeOpenInNewWindowAction(v44);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v61[0] = v39;
    v61[1] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v61, 2));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 1, v31));

    objc_msgSend(v40, "addObject:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[MapsMenuBuilder sendToDeviceAndShareMenuWithSendToDeviceEnabled:](MapsMenuBuilder, "sendToDeviceAndShareMenuWithSendToDeviceEnabled:", 0));
    objc_msgSend(v40, "addObject:", v33);
    if (objc_msgSend(v10, "canDelete"))
    {
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_100B8AF14;
      v41[3] = &unk_1011AD1E8;
      objc_copyWeak(&v43, &location);
      v42 = v28;
      v34 = HomeDeleteCollectionAction(v41);
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      v60 = v35;
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v60, 1));
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 1, v36));

      objc_msgSend(v40, "addObject:", v37);
      objc_destroyWeak(&v43);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", &stru_1011EB268, v40));

    objc_destroyWeak(&v46);
    objc_destroyWeak(&v49);
    objc_destroyWeak(&location);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_contextMenuForMapItemSnapshot:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD *v36;
  id *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id obj;
  void *v61;
  id v62;
  _QWORD v63[4];
  id v64;
  id v65;
  _QWORD v66[5];
  id v67;
  id v68;
  _QWORD v69[5];
  id v70;
  _QWORD v71[4];
  id v72;
  id v73;
  _QWORD v74[4];
  id v75;
  id v76;
  _QWORD v77[4];
  id v78;
  id v79;
  _QWORD v80[4];
  id v81;
  id v82;
  _QWORD v83[4];
  id v84;
  void *v85;
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  id location;
  void *v92;
  void *v93;
  _QWORD v94[2];
  void *v95;
  void *v96;
  _BYTE v97[128];

  v62 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "viewModel"));
  v5 = objc_opt_class(TwoLinesCollectionMapItemOutlineCellModel);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;

  v57 = v7;
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapItem"));
  if (v58)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    objc_initWeak(&location, self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionManager sharedManager](CollectionManager, "sharedManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionsNotContainingMapItem:", v58));

    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    obj = v9;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v88;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v88 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * (_QWORD)i);
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "title"));
          v15 = (void *)v14;
          v83[0] = _NSConcreteStackBlock;
          if (v14)
            v16 = (const __CFString *)v14;
          else
            v16 = &stru_1011EB268;
          v83[1] = 3221225472;
          v83[2] = sub_100B8B924;
          v83[3] = &unk_1011E7538;
          objc_copyWeak(&v86, &location);
          v84 = v62;
          v85 = v13;
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v16, 0, 0, v83));

          objc_msgSend(v61, "addObject:", v17);
          objc_destroyWeak(&v86);
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
      }
      while (v10);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("[Maps Home] New Guide"), CFSTR("localized string not found"), 0));

    v80[0] = _NSConcreteStackBlock;
    v80[1] = 3221225472;
    v80[2] = sub_100B8B960;
    v80[3] = &unk_1011ACEC0;
    objc_copyWeak(&v82, &location);
    v19 = v62;
    v81 = v19;
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v56, 0, 0, v80));
    v96 = v50;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v96, 1));
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 1, v20));

    objc_msgSend(v61, "addObject:", v55);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("[Maps Home] Move to"), CFSTR("localized string not found"), 0));
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", v22, v61));

    objc_msgSend(v59, "addObject:", v54);
    if (objc_msgSend(v58, "_maps_canRenameCollectionItem"))
    {
      v77[0] = _NSConcreteStackBlock;
      v77[1] = 3221225472;
      v77[2] = sub_100B8BA20;
      v77[3] = &unk_1011AD1E8;
      objc_copyWeak(&v79, &location);
      v78 = v19;
      v23 = HomeRenameCollectionMapItemAction(v77);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v95 = v24;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v95, 1));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 1, v25));

      objc_msgSend(v59, "addObject:", v26);
      objc_destroyWeak(&v79);
    }
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = sub_100B8BA5C;
    v74[3] = &unk_1011AD1E8;
    objc_copyWeak(&v76, &location);
    v27 = v19;
    v75 = v27;
    v28 = HomeOpenInNewTabAction(v74);
    v53 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472;
    v71[2] = sub_100B8BA9C;
    v71[3] = &unk_1011AD1E8;
    objc_copyWeak(&v73, &location);
    v29 = v27;
    v72 = v29;
    v30 = HomeOpenInNewWindowAction(v71);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    v94[0] = v53;
    v49 = (void *)v31;
    v94[1] = v31;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v94, 2));
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 1, v32));

    objc_msgSend(v59, "addObject:", v52);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[MapsMenuBuilder sendToDeviceAndShareMenuWithSendToDeviceEnabled:](MapsMenuBuilder, "sendToDeviceAndShareMenuWithSendToDeviceEnabled:", 0));
    objc_msgSend(v59, "addObject:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutManager sharedManager](ShortcutManager, "sharedManager"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "meCard"));

    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "_maps_shortcutForMapItem:", v58));
    if (v35)
    {
      v66[0] = _NSConcreteStackBlock;
      v66[1] = 3221225472;
      v66[2] = sub_100B8BB18;
      v66[3] = &unk_1011AFF10;
      v36 = v66;
      v37 = &v68;
      objc_copyWeak(&v68, &location);
      v66[4] = v29;
      v67 = v35;
      v38 = HomeRemoveFromFavoritesAction(v66);
      v39 = (void *)objc_claimAutoreleasedReturnValue(v38);

    }
    else
    {
      v69[0] = _NSConcreteStackBlock;
      v69[1] = 3221225472;
      v69[2] = sub_100B8BADC;
      v69[3] = &unk_1011AD1E8;
      v36 = v69;
      v37 = &v70;
      objc_copyWeak(&v70, &location);
      v69[4] = v29;
      v41 = HomeAddToFavoritesAction(v69);
      v39 = (void *)objc_claimAutoreleasedReturnValue(v41);
    }

    objc_destroyWeak(v37);
    v93 = v39;
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v93, 1));
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 1, v42));

    objc_msgSend(v59, "addObject:", v43);
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_100B8BB54;
    v63[3] = &unk_1011AD1E8;
    objc_copyWeak(&v65, &location);
    v64 = v29;
    v44 = HomeRemoveFromCollectionAction(v63);
    v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
    v92 = v45;
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v92, 1));
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 1, v46));

    objc_msgSend(v59, "addObject:", v47);
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", &stru_1011EB268, v59));

    objc_destroyWeak(&v65);
    objc_destroyWeak(&v73);

    objc_destroyWeak(&v76);
    objc_destroyWeak(&v82);

    objc_destroyWeak(&location);
  }
  else
  {
    v40 = 0;
  }

  return v40;
}

- (id)_contextMenuForTransitLineSnapshot:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id location;
  void *v31;
  _QWORD v32[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_initWeak(&location, self);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100B8BEA0;
  v27[3] = &unk_1011AD1E8;
  objc_copyWeak(&v29, &location);
  v6 = v4;
  v28 = v6;
  v7 = HomeOpenInNewTabAction(v27);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100B8BEE0;
  v24[3] = &unk_1011AD1E8;
  objc_copyWeak(&v26, &location);
  v8 = v6;
  v25 = v8;
  v9 = HomeOpenInNewWindowAction(v24);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v32[0] = v20;
  v32[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 2));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 1, v11));

  objc_msgSend(v5, "addObject:", v12);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100B8BF20;
  v21[3] = &unk_1011AD1E8;
  objc_copyWeak(&v23, &location);
  v13 = v8;
  v22 = v13;
  v14 = HomeRemoveFromCollectionAction(v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v31 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v31, 1));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 1, v16));

  objc_msgSend(v5, "addObject:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", &stru_1011EB268, v5));

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v26);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

  return v18;
}

- (void)_addPlacesToCollectionSnapshot:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  CollectionSaveSession *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "viewModel"));
  v5 = objc_opt_class(TwoLinesCollectionOutlineCellModel);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;

  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collection"));
  if (v14)
  {
    v8 = -[CollectionEditSession initWithCollection:]([CollectionSaveSession alloc], "initWithCollection:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "actionCoordinator"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "homeActionDelegate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "homeContaineeViewController"));
    objc_msgSend(v10, "viewController:addItemsFromACToCollection:", v13, v8);

  }
}

- (void)_duplicateCollectionSnapshot:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "viewModel"));
  v5 = objc_opt_class(TwoLinesCollectionOutlineCellModel);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collection"));
  v8 = v9;
  if (v9)
  {
    -[HomeOutlineCollectionsSectionController _duplicateCollection:](self, "_duplicateCollection:", v9);
    v8 = v9;
  }

}

- (void)_moveMapItemSnapshot:(id)a3 toCollection:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  id v15;

  v15 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewModel"));
  v8 = objc_opt_class(TwoLinesCollectionMapItemOutlineCellModel);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapItem"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifierPath"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineCollectionsSectionController _collectionContainingIdentifierPath:](self, "_collectionContainingIdentifierPath:", v12));
  if (v11)
    v14 = v13 == 0;
  else
    v14 = 1;
  if (!v14)
    -[HomeOutlineCollectionsSectionController _moveMapItem:fromCollection:toCollection:](self, "_moveMapItem:fromCollection:toCollection:", v11, v13, v15);

}

- (void)_renameMapItemSnapshot:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewModel"));
  v6 = objc_opt_class(TwoLinesCollectionMapItemOutlineCellModel);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapItem"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifierPath"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineCollectionsSectionController _collectionContainingIdentifierPath:](self, "_collectionContainingIdentifierPath:", v10));
  if (v9)
    v12 = v11 == 0;
  else
    v12 = 1;
  if (!v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "actionCoordinator"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "homeActionDelegate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "homeContaineeViewController"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100B8C37C;
    v18[3] = &unk_1011B5288;
    v19 = v11;
    v20 = v9;
    objc_msgSend(v14, "viewController:editNameOfMapItem:saveHandler:cancelHandler:", v17, v20, v18, 0);

  }
}

- (void)_addMapItemSnapshotToFavorites:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewModel"));
  v6 = objc_opt_class(TwoLinesCollectionMapItemOutlineCellModel);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapItem"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifierPath"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastIdentifier"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_shortcutEditSessions, "objectForKeyedSubscript:", v11));
    if (!v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutEditSession addSessionWithType:mapItem:](ShortcutEditSession, "addSessionWithType:mapItem:", 1, v9));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_shortcutEditSessions, "setObject:forKeyedSubscript:", v13, v11);
      objc_initWeak(&location, self);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100B8C5E8;
      v14[3] = &unk_1011AC888;
      objc_copyWeak(&v16, &location);
      v15 = v11;
      objc_msgSend(v13, "saveWithCompletion:", v14);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);

    }
  }

}

- (void)_removeMapItemSnapshotFromFavorites:(id)a3 shortcut:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *shortcutEditSessions;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewModel"));
  v9 = objc_opt_class(TwoLinesCollectionMapItemOutlineCellModel);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    v10 = v8;
  else
    v10 = 0;
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mapItem"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifierPath"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastIdentifier"));

    shortcutEditSessions = self->_shortcutEditSessions;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifierPath"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "lastIdentifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](shortcutEditSessions, "objectForKeyedSubscript:", v17));

    if (!v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutEditSession editSessionWithShortcut:](ShortcutEditSession, "editSessionWithShortcut:", v7));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_shortcutEditSessions, "setObject:forKeyedSubscript:", v19, v14);
      objc_initWeak(&location, self);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100B8C874;
      v20[3] = &unk_1011AC888;
      objc_copyWeak(&v22, &location);
      v21 = v14;
      objc_msgSend(v19, "removeFromShortcutsWithCompletion:", v20);

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);

    }
  }

}

- (void)_openSnapshot:(id)a3 inNewTab:(BOOL)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
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
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;

  v5 = a3;
  v6 = objc_alloc_init((Class)UISceneActivationRequestOptions);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifierPath"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineCollectionsSectionController _collectionContainingIdentifierPath:](self, "_collectionContainingIdentifierPath:", v7));
  v9 = objc_msgSend(v8, "handlerType");
  if (v9)
  {
    if (v9 != (id)4)
    {
      v10 = 0;
      goto LABEL_9;
    }
    v10 = objc_msgSend(objc_alloc((Class)NSUserActivity), "initWithActivityType:", NSUserActivityTypeBrowsingWeb);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sharingURL"));
    objc_msgSend(v10, "setWebpageURL:", v11);
  }
  else
  {
    v10 = objc_msgSend(objc_alloc((Class)NSUserActivity), "initWithActivityType:", CFSTR("com.apple.Maps.NewWindow"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "homeActionDelegate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "homeContaineeViewController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_maps_mapsSceneDelegate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mapsActivityWithFidelity:", 2));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
    objc_msgSend(v11, "setUserCreatedCollectionID:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "data"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bzip2CompressedData"));

    if (v18)
    {
      v25 = CFSTR("bs");
      v26 = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
      objc_msgSend(v10, "setUserInfo:", v19);

    }
  }

LABEL_9:
  objc_msgSend(v10, "setEligibleForHandoff:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "homeActionDelegate"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "homeContaineeViewController"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "_maps_uiScene"));
  objc_msgSend(v6, "setRequestingScene:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v24, "requestSceneSessionActivation:userActivity:options:errorHandler:", 0, v10, v6, 0);

}

- (void)_moveMapItem:(id)a3 fromCollection:(id)a4 toCollection:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  unsigned __int8 v12;
  CollectionAddOrRemoveSession *v13;
  CollectionAddOrRemoveSession *v14;
  CollectionAddOrRemoveSession *v15;
  CollectionAddOrRemoveSession *v16;
  _QWORD v17[4];
  id v18;
  CollectionAddOrRemoveSession *v19;
  id v20;
  CollectionAddOrRemoveSession *v21;
  id v22;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (v8)
    {
      if (v10)
      {
        if (objc_msgSend(v10, "contentType") == (id)1)
        {
          v12 = objc_msgSend(v11, "containsItem:", v8);
          if (v11 != v9 && (v12 & 1) == 0 && (objc_msgSend(v11, "isEqual:", v9) & 1) == 0)
          {
            v13 = -[CollectionEditSession initWithCollection:]([CollectionAddOrRemoveSession alloc], "initWithCollection:", v11);
            v14 = -[CollectionEditSession initWithCollection:]([CollectionAddOrRemoveSession alloc], "initWithCollection:", v9);
            -[CollectionEditSession addSelectedObject:](v13, "addSelectedObject:", v8);
            -[CollectionEditSession addSelectedObject:](v14, "addSelectedObject:", v8);
            objc_initWeak(&location, self);
            -[NSMutableArray addObject:](self->_moveCollectionEditSessions, "addObject:", v13);
            v17[0] = _NSConcreteStackBlock;
            v17[1] = 3221225472;
            v17[2] = sub_100B8CD9C;
            v17[3] = &unk_1011E7580;
            objc_copyWeak(&v22, &location);
            v18 = v11;
            v15 = v14;
            v19 = v15;
            v20 = v9;
            v16 = v13;
            v21 = v16;
            -[CollectionAddOrRemoveSession applyToCollection:completion:](v16, "applyToCollection:completion:", v18, v17);

            objc_destroyWeak(&v22);
            objc_destroyWeak(&location);

          }
        }
      }
    }
  }

}

- (void)_duplicateCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  CollectionAddOrRemoveSession *v12;
  void *v13;
  CollectionAddOrRemoveSession *v14;
  _QWORD v15[4];
  id v16;
  CollectionAddOrRemoveSession *v17;
  id v18;
  id location;

  v4 = a3;
  if (objc_msgSend(v4, "contentType") == (id)1 && !objc_msgSend(v4, "handlerType"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("[Maps Home] Duplicated Collection Name"), CFSTR("localized string not found"), 0));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
    v8 = (void *)v7;
    v9 = &stru_1011EB268;
    if (v7)
      v9 = (const __CFString *)v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v9));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionHandler collection](CollectionHandler, "collection"));
    objc_msgSend(v11, "updateTitle:", v10);
    v12 = -[CollectionEditSession initWithCollection:]([CollectionAddOrRemoveSession alloc], "initWithCollection:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "content"));
    -[CollectionEditSession addSelectedObjects:](v12, "addSelectedObjects:", v13);

    objc_initWeak(&location, self);
    -[NSMutableArray addObject:](self->_duplicateCollectionEditSessions, "addObject:", v12);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100B8D280;
    v15[3] = &unk_1011AE5B8;
    objc_copyWeak(&v18, &location);
    v16 = v4;
    v14 = v12;
    v17 = v14;
    -[CollectionAddOrRemoveSession applyToCollection:completion:](v14, "applyToCollection:completion:", v11, v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

  }
}

- (void)_createCollection
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionHandler collection](CollectionHandler, "collection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("[Collections] New Guide"), CFSTR("localized string not found"), 0));

  objc_msgSend(v3, "updateTitle:", v5);
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100B8D4C4;
  v7[3] = &unk_1011B2260;
  objc_copyWeak(&v9, &location);
  v6 = v3;
  v8 = v6;
  objc_msgSend(v6, "createCollection:", v7);
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2072, 8, 0);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)sectionHeaderOutlineCell:(id)a3 accessoryTypeTapped:(int64_t)a4
{
  if (a4 == 2)
    -[HomeOutlineCollectionsSectionController _createCollection](self, "_createCollection", a3);
}

- (void)smallButtonOutlineCellTapped:(id)a3
{
  -[HomeOutlineCollectionsSectionController _createCollection](self, "_createCollection", a3);
}

- (BOOL)_isMoveOperationWithDropSession:(id)a3 destinationIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "items"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localObject"));

  v11 = objc_opt_class(HomeDragLocalContext);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    v12 = v10;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController mapItemForDropSession:](self, "mapItemForDropSession:", v6));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineCollectionsSectionController _collectionContainingIndexPath:](self, "_collectionContainingIndexPath:", v7));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "itemSnapshot"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifierPath"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineCollectionsSectionController _collectionContainingIdentifierPath:](self, "_collectionContainingIdentifierPath:", v16));

    LOBYTE(v18) = 0;
    if (v14 && v15 && v17)
    {
      if (objc_msgSend(v15, "contentType") == (id)1)
      {
        LOBYTE(v18) = 0;
        if ((objc_msgSend(v15, "containsItem:", v14) & 1) == 0 && v15 != v17)
          LODWORD(v18) = objc_msgSend(v15, "isEqual:", v17) ^ 1;
      }
      else
      {
        LOBYTE(v18) = 0;
      }
    }

  }
  else
  {
    LOBYTE(v18) = 0;
  }

  return (char)v18;
}

- (void)_performMoveWithDropCoordinator:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "items"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dragItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localObject"));

  v8 = objc_opt_class(HomeDragLocalContext);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "session"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController mapItemForDropSession:](self, "mapItemForDropSession:", v11));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "destinationIndexPath"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineCollectionsSectionController _collectionContainingIndexPath:](self, "_collectionContainingIndexPath:", v13));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "itemSnapshot"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifierPath"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineCollectionsSectionController _collectionContainingIdentifierPath:](self, "_collectionContainingIdentifierPath:", v16));

    -[HomeOutlineCollectionsSectionController _moveMapItem:fromCollection:toCollection:](self, "_moveMapItem:fromCollection:toCollection:", v12, v17, v14);
  }

}

- (BOOL)_isCopyOperationWithDropSession:(id)a3 destinationIndexPath:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController mapItemForDropSession:](self, "mapItemForDropSession:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineCollectionsSectionController _collectionContainingIndexPath:](self, "_collectionContainingIndexPath:", v8));

  LOBYTE(v8) = 0;
  if (v6 && v7)
  {
    if (objc_msgSend(v7, "contentType") == (id)1)
      LODWORD(v8) = objc_msgSend(v7, "containsItem:", v6) ^ 1;
    else
      LOBYTE(v8) = 0;
  }

  return (char)v8;
}

- (void)_performCopyWithDropCoordinator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CollectionAddOrRemoveSession *v9;
  CollectionAddOrRemoveSession *v10;
  _QWORD v11[4];
  id v12;
  CollectionAddOrRemoveSession *v13;
  id v14;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "session"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController mapItemForDropSession:](self, "mapItemForDropSession:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "destinationIndexPath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineCollectionsSectionController _collectionContainingIndexPath:](self, "_collectionContainingIndexPath:", v7));

  if (v6
    && v8
    && objc_msgSend(v8, "contentType") == (id)1
    && (objc_msgSend(v8, "containsItem:", v6) & 1) == 0)
  {
    v9 = -[CollectionEditSession initWithCollection:]([CollectionAddOrRemoveSession alloc], "initWithCollection:", v8);
    -[CollectionEditSession addSelectedObject:](v9, "addSelectedObject:", v6);
    -[NSMutableArray addObject:](self->_dropCollectionEditSessions, "addObject:", v9);
    objc_initWeak(&location, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100B8DAC8;
    v11[3] = &unk_1011AE5B8;
    objc_copyWeak(&v14, &location);
    v12 = v8;
    v10 = v9;
    v13 = v10;
    -[CollectionAddOrRemoveSession applyToCollection:completion:](v10, "applyToCollection:completion:", v12, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

  }
}

- (id)_collectionContainingIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sectionController:nodeSnapshotAtIndexPath:", self, v4));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifierPath"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineCollectionsSectionController _collectionContainingIdentifierPath:](self, "_collectionContainingIdentifierPath:", v7));

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)_collectionContainingIdentifierPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "length") >= 2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifiers"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 1));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController sectionSnapshot](self, "sectionSnapshot"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "childSnapshotWithIdentifier:", v7));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewModel"));
    v11 = objc_opt_class(TwoLinesCollectionOutlineCellModel);
    if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
      v12 = v10;
    else
      v12 = 0;
    v13 = v12;

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "collection"));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_deleteSnapshot:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  char isKindOfClass;
  id v13;

  v13 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController deletions](self, "deletions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifierPath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  v7 = v13;
  if (!v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "viewModel"));
    v9 = objc_msgSend(v8, "conformsToProtocol:", &OBJC_PROTOCOL___HomeCollectionItemCellModel);

    if (v8 && v9)
    {
      -[HomeOutlineCollectionsSectionController _deleteCollectionItemSnapshot:](self, "_deleteCollectionItemSnapshot:", v13);
LABEL_8:
      v7 = v13;
      goto LABEL_9;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "viewModel"));
    v11 = objc_opt_class(TwoLinesCollectionOutlineCellModel);
    isKindOfClass = objc_opt_isKindOfClass(v10, v11);

    v7 = v13;
    if ((isKindOfClass & 1) != 0 && v10)
    {
      -[HomeOutlineCollectionsSectionController _deleteCollectionSnapshot:](self, "_deleteCollectionSnapshot:", v13);
      goto LABEL_8;
    }
  }
LABEL_9:

}

- (void)_deleteCollectionSnapshot:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id location;
  void *v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewModel"));
  v6 = objc_opt_class(TwoLinesCollectionOutlineCellModel);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collection"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController deletionWithSnapshot:](self, "deletionWithSnapshot:", v4));
    objc_initWeak(&location, self);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "actionCoordinator"));
    v20 = v9;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100B8E05C;
    v15[3] = &unk_1011B0E90;
    objc_copyWeak(&v18, &location);
    v16 = v9;
    v14 = v10;
    v17 = v14;
    objc_msgSend(v12, "viewController:confirmDeleteCollections:sourceView:sourceRect:completion:", 0, v13, 0, v15, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

  }
}

- (void)_didConfirmDeleteCollection:(id)a3 deletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;
  id v14;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v14 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  -[HomeOutlineSectionController beginDeletions:](self, "beginDeletions:", v8);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100B8E1EC;
  v10[3] = &unk_1011B2260;
  objc_copyWeak(&v12, &location);
  v9 = v7;
  v11 = v9;
  objc_msgSend(v6, "deleteCollection:", v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)_deleteCollectionItemSnapshot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  CollectionAddOrRemoveSession *v13;
  void *v14;
  id v15;
  CollectionAddOrRemoveSession *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  CollectionAddOrRemoveSession *v20;
  id v21;
  id location;
  void *v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifierPath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineCollectionsSectionController _collectionContainingIdentifierPath:](self, "_collectionContainingIdentifierPath:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewModel"));
  if (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___HomeCollectionItemCellModel))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "homeCollectionItem"));
  v11 = (void *)v10;
  if (v6 && v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController deletionWithSnapshot:](self, "deletionWithSnapshot:", v4));
    v13 = -[CollectionEditSession initWithCollection:]([CollectionAddOrRemoveSession alloc], "initWithCollection:", v6);
    -[CollectionEditSession addSelectedObject:](v13, "addSelectedObject:", v11);
    -[NSMutableArray addObject:](self->_deleteCollectionEditSessions, "addObject:", v13);
    objc_initWeak(&location, self);
    v23 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
    -[HomeOutlineSectionController beginDeletions:](self, "beginDeletions:", v14);

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100B8E4DC;
    v17[3] = &unk_1011D9380;
    objc_copyWeak(&v21, &location);
    v18 = v6;
    v15 = v12;
    v19 = v15;
    v16 = v13;
    v20 = v16;
    -[CollectionAddOrRemoveSession applyToCollection:completion:](v16, "applyToCollection:completion:", v18, v17);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char isKindOfClass;
  BOOL v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sectionController:nodeSnapshotAtIndexPath:", self, v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewModel"));
  v11 = objc_opt_class(TwoLinesCollectionOutlineCellModel);
  isKindOfClass = objc_opt_isKindOfClass(v10, v11);

  if ((isKindOfClass & 1) != 0 && v10)
  {
    v13 = 1;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)HomeOutlineCollectionsSectionController;
    v13 = -[HomeOutlineSectionController collectionView:shouldSelectItemAtIndexPath:](&v15, "collectionView:shouldSelectItemAtIndexPath:", v6, v7);
  }

  return v13;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  __objc2_class_ro **p_info;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  char v25;
  void *v26;
  uint64_t v27;
  char v28;
  void *v29;
  objc_super v30;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sectionController:nodeSnapshotAtIndexPath:", self, v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewModel"));
  v11 = objc_opt_class(TwoLinesCollectionOutlineCellModel);
  isKindOfClass = objc_opt_isKindOfClass(v10, v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewModel"));
  v14 = v13;
  p_info = &OBJC_METACLASS___HomeAnalyticsManager.info;
  if ((isKindOfClass & 1) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "collection"));
    if (objc_msgSend(v16, "handlerType") == (id)4)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "actionCoordinator"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "collection"));
      objc_msgSend(v18, "viewController:showCollection:", 0, v19);

      +[HomeAnalyticsManager captureCuratedCollectionAction:withCollectionHandler:verticalIndex:](HomeAnalyticsManager, "captureCuratedCollectionAction:withCollectionHandler:verticalIndex:", 2099, v16, objc_msgSend(v7, "row"));
    }
    if (!objc_msgSend(v16, "handlerType"))
    {
      v20 = objc_msgSend(v16, "showAction");
      if (objc_msgSend(v16, "handlerType") == (id)3)
        v21 = 256;
      else
        v21 = 8;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "bucketedNumberOfItems")));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v22));

      p_info = (__objc2_class_ro **)(&OBJC_METACLASS___HomeAnalyticsManager + 32);
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v20, v21, v23);

    }
  }
  else
  {
    v24 = objc_opt_class(TwoLinesCollectionMapItemOutlineCellModel);
    v25 = objc_opt_isKindOfClass(v14, v24);

    if ((v25 & 1) == 0)
      goto LABEL_12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v7, "row")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringValue"));
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2068, 252, v16);
  }

LABEL_12:
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewModel"));
  v27 = objc_opt_class(p_info + 186);
  v28 = objc_opt_isKindOfClass(v26, v27);

  if ((v28 & 1) == 0)
  {
    v30.receiver = self;
    v30.super_class = (Class)HomeOutlineCollectionsSectionController;
    -[HomeOutlineSectionController collectionView:didSelectItemAtIndexPath:](&v30, "collectionView:didSelectItemAtIndexPath:", v6, v7);
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
  objc_msgSend(v29, "sectionController:setNeedsApplySnapshotAnimated:", self, 1);

}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HomeOutlineCollectionsSectionController;
  -[HomeOutlineSectionController collectionView:didDeselectItemAtIndexPath:](&v6, "collectionView:didDeselectItemAtIndexPath:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
  objc_msgSend(v5, "sectionController:setNeedsApplySnapshotAnimated:", self, 1);

}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  objc_super v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
  v12 = objc_msgSend(v11, "isCollectionViewFocusedWithSectionController:", self);

  v15.receiver = self;
  v15.super_class = (Class)HomeOutlineCollectionsSectionController;
  -[HomeOutlineSectionController collectionView:didUpdateFocusInContext:withAnimationCoordinator:](&v15, "collectionView:didUpdateFocusInContext:withAnimationCoordinator:", v10, v9, v8);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
  LODWORD(v10) = objc_msgSend(v13, "isCollectionViewFocusedWithSectionController:", self);

  if (v12 != (_DWORD)v10)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
    objc_msgSend(v14, "sectionController:setNeedsApplySnapshotAnimated:", self, 1);

  }
}

- (void)collectionView:(id)a3 dropSessionDidEnter:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate", a3, a4));
  objc_msgSend(v5, "sectionController:setNeedsApplySnapshotAnimated:", self, 1);

}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  IdentifierPath *v14;
  char v15;
  void *v16;
  id v17;
  void *v18;

  v7 = a4;
  v8 = a5;
  if (-[HomeOutlineCollectionsSectionController _isMoveOperationWithDropSession:destinationIndexPath:](self, "_isMoveOperationWithDropSession:destinationIndexPath:", v7, v8))
  {
    v9 = 3;
  }
  else
  {
    if (!-[HomeOutlineCollectionsSectionController _isCopyOperationWithDropSession:destinationIndexPath:](self, "_isCopyOperationWithDropSession:destinationIndexPath:", v7, v8))
    {
      v12 = 0;
      v10 = 0;
      goto LABEL_11;
    }
    v9 = 2;
  }
  v10 = objc_msgSend(objc_alloc((Class)UICollectionViewDropProposal), "initWithDropOperation:intent:", v9, 2);
  if (!v10)
  {
    v12 = 0;
LABEL_11:
    v11 = 0;
    v14 = 0;
    v15 = 1;
    goto LABEL_14;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineCollectionsSectionController _collectionContainingIndexPath:](self, "_collectionContainingIndexPath:", v8));
  if (!v11)
  {
    v12 = 0;
    goto LABEL_13;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineCollectionsSectionController _identifierForItem:](self, "_identifierForItem:", v11));
  if (!v12)
  {
LABEL_13:
    v15 = 0;
    v14 = 0;
    goto LABEL_14;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController sectionIdentifierPath](self, "sectionIdentifierPath"));
  v14 = (IdentifierPath *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifierPathByAppendingIdentifier:", v12));

  v15 = 0;
LABEL_14:
  if (v14 != self->_dropDestinationIdentifierPath && !-[IdentifierPath isEqual:](v14, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_dropDestinationIdentifierPath, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
    objc_msgSend(v16, "sectionController:setNeedsApplySnapshotAnimated:", self, 1);

  }
  if ((v15 & 1) != 0)
    v17 = objc_msgSend(objc_alloc((Class)UICollectionViewDropProposal), "initWithDropOperation:", 0);
  else
    v17 = v10;
  v18 = v17;

  return v18;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;

  v11 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "session"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "destinationIndexPath"));
  v7 = -[HomeOutlineCollectionsSectionController _isMoveOperationWithDropSession:destinationIndexPath:](self, "_isMoveOperationWithDropSession:destinationIndexPath:", v5, v6);

  if (v7)
  {
    -[HomeOutlineCollectionsSectionController _performMoveWithDropCoordinator:](self, "_performMoveWithDropCoordinator:", v11);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "session"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "destinationIndexPath"));
    v10 = -[HomeOutlineCollectionsSectionController _isCopyOperationWithDropSession:destinationIndexPath:](self, "_isCopyOperationWithDropSession:destinationIndexPath:", v8, v9);

    if (v10)
      -[HomeOutlineCollectionsSectionController _performCopyWithDropCoordinator:](self, "_performCopyWithDropCoordinator:", v11);
  }

}

- (void)collectionView:(id)a3 dropSessionDidExit:(id)a4
{
  IdentifierPath *dropDestinationIdentifierPath;
  id v6;

  dropDestinationIdentifierPath = self->_dropDestinationIdentifierPath;
  self->_dropDestinationIdentifierPath = 0;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
  objc_msgSend(v6, "sectionController:setNeedsApplySnapshotAnimated:", self, 1);

}

- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4
{
  IdentifierPath *dropDestinationIdentifierPath;
  id v6;

  dropDestinationIdentifierPath = self->_dropDestinationIdentifierPath;
  self->_dropDestinationIdentifierPath = 0;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
  objc_msgSend(v6, "sectionController:setNeedsApplySnapshotAnimated:", self, 1);

}

- (void)twoLinesOutlineCell:(id)a3 accessoryViewTapped:(id)a4 accessoryModel:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  IncompleteTransitLineItem *v16;
  void *v17;
  IncompleteTransitLineItem *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  char v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  v36 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "cellModel"));
  v11 = objc_opt_class(TwoLinesTransitLineOutlineCellModel);
  isKindOfClass = objc_opt_isKindOfClass(v10, v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "cellModel"));
  v14 = v13;
  if ((isKindOfClass & 1) == 0)
  {
    v24 = objc_opt_class(TwoLinesCollectionOutlineCellModel);
    v25 = objc_opt_isKindOfClass(v14, v24);

    if ((v25 & 1) == 0)
      goto LABEL_11;
    v26 = objc_msgSend(v9, "accessoryType");
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "cellModel"));
    v18 = (IncompleteTransitLineItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "collection"));
    v27 = -[IncompleteTransitLineItem handlerType](v18, "handlerType");
    if (v26 == (id)1)
    {
      if (v27 == (id)4)
        goto LABEL_5;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController sectionIdentifierPath](self, "sectionIdentifierPath"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineCollectionsSectionController _identifierForItem:](self, "_identifierForItem:", v18));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "identifierPathByAppendingIdentifier:", v29));

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController sectionSnapshot](self, "sectionSnapshot"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifierPathByRemovingFirstIdentifier"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "nodeSnapshotAtIdentifierPath:", v31));

      v33 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
      objc_msgSend(v33, "sectionController:setNeedsApplySnapshotAnimated:", self, 1);

      -[HomeOutlineCollectionsSectionController _editCollectionSnapshot:](self, "_editCollectionSnapshot:", v32);
    }
    else
    {
      if (v27 == (id)4)
        goto LABEL_5;
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController sectionIdentifierPath](self, "sectionIdentifierPath"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineCollectionsSectionController _identifierForItem:](self, "_identifierForItem:", v18));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "identifierPathByAppendingIdentifier:", v35));

      -[HomeOutlineSectionController toggleElementAtIdentifierPath:](self, "toggleElementAtIdentifierPath:", v19);
    }
LABEL_4:

LABEL_5:
    goto LABEL_6;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "transitLine"));

  if (v15)
  {
    v16 = [IncompleteTransitLineItem alloc];
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "transitLine"));
    v18 = -[IncompleteTransitLineItem initWithTransitLine:](v16, "initWithTransitLine:", v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "actionCoordinator"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "homeActionDelegate"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "homeContaineeViewController"));
    objc_msgSend(v8, "bounds");
    objc_msgSend(v20, "viewController:openTransitLineCard:sourceView:sourceRect:", v23, v18, v8);

    goto LABEL_4;
  }
LABEL_6:

LABEL_11:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingCollectionTimer, 0);
  objc_storeStrong(&self->_pendingCollectionOperation, 0);
  objc_storeStrong((id *)&self->_pendingCollection, 0);
  objc_storeStrong((id *)&self->_editingCollection, 0);
  objc_storeStrong((id *)&self->_dropDestinationIdentifierPath, 0);
  objc_storeStrong((id *)&self->_shortcutEditSessions, 0);
  objc_storeStrong((id *)&self->_duplicateCollectionEditSessions, 0);
  objc_storeStrong((id *)&self->_moveCollectionEditSessions, 0);
  objc_storeStrong((id *)&self->_deleteCollectionEditSessions, 0);
  objc_storeStrong((id *)&self->_dropCollectionEditSessions, 0);
  objc_storeStrong((id *)&self->_sortItems, 0);
  objc_storeStrong((id *)&self->_distanceUnitDataProvider, 0);
  objc_storeStrong((id *)&self->_collectionsDataProvider, 0);
  objc_storeStrong((id *)&self->_currentLocationDataProvider, 0);
}

@end
