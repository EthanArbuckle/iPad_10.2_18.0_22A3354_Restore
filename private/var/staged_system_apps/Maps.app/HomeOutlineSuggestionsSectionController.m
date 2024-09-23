@implementation HomeOutlineSuggestionsSectionController

- (HomeOutlineSuggestionsSectionController)initWithConfiguration:(id)a3 suggestionsDataProvider:(id)a4
{
  id v7;
  HomeOutlineSuggestionsSectionController *v8;
  CurrentLocationDataProvider *v9;
  CurrentLocationDataProvider *currentLocationDataProvider;
  DistanceUnitDataProvider *v11;
  DistanceUnitDataProvider *distanceUnitDataProvider;
  SharedCollectionsDataProvider *v13;
  SharedCollectionsDataProvider *sharedCollectionsDataProvider;
  SharedTripsDataProvider *v15;
  SharedTripsDataProvider *sharedTripsDataProvider;
  uint64_t v17;
  NSMutableDictionary *sortItems;
  objc_super v20;

  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HomeOutlineSuggestionsSectionController;
  v8 = -[HomeOutlineSectionController initWithConfiguration:](&v20, "initWithConfiguration:", a3);
  if (v8)
  {
    v9 = objc_alloc_init(CurrentLocationDataProvider);
    currentLocationDataProvider = v8->_currentLocationDataProvider;
    v8->_currentLocationDataProvider = v9;

    v11 = objc_alloc_init(DistanceUnitDataProvider);
    distanceUnitDataProvider = v8->_distanceUnitDataProvider;
    v8->_distanceUnitDataProvider = v11;

    v13 = objc_alloc_init(SharedCollectionsDataProvider);
    sharedCollectionsDataProvider = v8->_sharedCollectionsDataProvider;
    v8->_sharedCollectionsDataProvider = v13;

    v15 = -[SharedTripsDataProvider initWithCombineAllTrips:]([SharedTripsDataProvider alloc], "initWithCombineAllTrips:", 0);
    sharedTripsDataProvider = v8->_sharedTripsDataProvider;
    v8->_sharedTripsDataProvider = v15;

    objc_storeStrong((id *)&v8->_suggestionsDataProvider, a4);
    v17 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    sortItems = v8->_sortItems;
    v8->_sortItems = (NSMutableDictionary *)v17;

  }
  return v8;
}

- (NSArray)dataProviders
{
  DistanceUnitDataProvider *distanceUnitDataProvider;
  SharedTripsDataProvider *sharedTripsDataProvider;
  _QWORD v5[5];

  distanceUnitDataProvider = self->_distanceUnitDataProvider;
  v5[0] = self->_currentLocationDataProvider;
  v5[1] = distanceUnitDataProvider;
  sharedTripsDataProvider = self->_sharedTripsDataProvider;
  v5[2] = self->_sharedCollectionsDataProvider;
  v5[3] = sharedTripsDataProvider;
  v5[4] = self->_suggestionsDataProvider;
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 5));
}

- (MapsUIDiffableDataSourceViewModel)sectionHeaderViewModel
{
  unsigned int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  SectionHeaderBasicOutlineCellModel *v7;

  v2 = +[MapsSuggestionsSiri isEnabled](MapsSuggestionsSiri, "isEnabled");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = v3;
  if (v2)
    v5 = CFSTR("[Proactive Tray] Suggestion Section");
  else
    v5 = CFSTR("[Proactive Tray] Shared with Me Section");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));

  v7 = -[SectionHeaderBasicOutlineCellModel initWithTitle:]([SectionHeaderBasicOutlineCellModel alloc], "initWithTitle:", v6);
  return (MapsUIDiffableDataSourceViewModel *)v7;
}

- (BOOL)_canDisplaySuggestionsEntry:(id)a3
{
  if (objc_msgSend(a3, "type") == (id)21)
    return +[RatingRequestHomeAvailability shouldShowRatingRequestSuggestionsOnProactiveTray](RatingRequestHomeAvailability, "shouldShowRatingRequestSuggestionsOnProactiveTray");
  else
    return 1;
}

- (NSArray)itemSnapshots
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  id v25;
  id v26;
  int64_t v27;
  _QWORD v28[5];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CurrentLocationDataProvider currentLocation](self->_currentLocationDataProvider, "currentLocation"));
  v4 = -[DistanceUnitDataProvider distanceUnit](self->_distanceUnitDataProvider, "distanceUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController selectedIdentifierPaths](self, "selectedIdentifierPaths"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SharedCollectionsDataProvider sharedCollections](self->_sharedCollectionsDataProvider, "sharedCollections"));
  objc_msgSend(v6, "addObjectsFromArray:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsDataProvider sharedTripSummaries](self->_sharedTripsDataProvider, "sharedTripSummaries"));
  objc_msgSend(v6, "addObjectsFromArray:", v8);

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SuggestionsDataProvider suggestions](self->_suggestionsDataProvider, "suggestions"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        if (-[HomeOutlineSuggestionsSectionController _canDisplaySuggestionsEntry:](self, "_canDisplaySuggestionsEntry:", v14))
        {
          objc_msgSend(v6, "addObject:", v14);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v11);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sectionIdentifier"));
  v17 = -[HomeOutlineSectionController expanded](self, "expanded");
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1002F001C;
  v28[3] = &unk_1011ACD28;
  v28[4] = self;
  v23[4] = self;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1002F0074;
  v24[3] = &unk_1011ACD50;
  v24[4] = self;
  v25 = v5;
  v26 = v3;
  v27 = v4;
  v22[4] = self;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1002F0964;
  v23[3] = &unk_1011ACD78;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1002F09CC;
  v22[3] = &unk_1011ACDA0;
  v18 = v3;
  v19 = v5;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[HomeOutlineSectionBuilder itemSnapshotsWithItems:sectionIdentifier:sectionExpanded:itemIdentifierBlock:viewModelBlock:childItemsBlock:expandedBlock:](HomeOutlineSectionBuilder, "itemSnapshotsWithItems:sectionIdentifier:sectionExpanded:itemIdentifierBlock:viewModelBlock:childItemsBlock:expandedBlock:", v6, v16, v17, v28, v24, v23, v22));

  -[HomeOutlineSuggestionsSectionController _scrubSortItems](self, "_scrubSortItems");
  return (NSArray *)v20;
}

- (id)contextMenuForSnapshot:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t isKindOfClass;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id location;
  void *v21;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewModel"));
  v6 = objc_opt_class(TwoLinesMapsSuggestionsEntryOutlineCellModel);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewModel"));
    v10 = objc_opt_class(TwoLinesSharedTripSummaryOutlineCellModel);
    isKindOfClass = objc_opt_isKindOfClass(v9, v10);

    if ((isKindOfClass & (v9 != 0)) != 1)
    {
      v15 = 0;
      goto LABEL_8;
    }
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1002F0C44;
  v17[3] = &unk_1011AD1E8;
  objc_copyWeak(&v19, &location);
  v18 = v4;
  v12 = HomeDeleteAction(v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v21 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", &stru_1011EB268, v14));

  objc_destroyWeak(&v19);
LABEL_8:
  objc_destroyWeak(&location);

  return v15;
}

- (BOOL)persistsExpansions
{
  return 1;
}

- (BOOL)shouldPersistExpandedIdentifierPath:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController sectionIdentifierPath](self, "sectionIdentifierPath"));
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

- (void)showSharedCollection:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "handlerType") == (id)3)
    -[SharedCollectionsDataProvider addSharedCollection:](self->_sharedCollectionsDataProvider, "addSharedCollection:", v4);

}

- (id)contentInjectorForSnapshot:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  HomeCollectionContentInjector *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewModel"));
  v6 = objc_opt_class(TwoLinesCollectionOutlineCellModel);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  v8 = 0;
  if ((isKindOfClass & 1) != 0 && v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewModel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "collection"));
    v8 = -[HomeCollectionContentInjector initWithCollection:]([HomeCollectionContentInjector alloc], "initWithCollection:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "actionCoordinator"));
    -[HomeCollectionContentInjector setActionCoordinator:](v8, "setActionCoordinator:", v12);

  }
  return v8;
}

- (id)_childItemsInCollection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "content"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSuggestionsSectionController _sortItemForCollection:](self, "_sortItemForCollection:", v4));
    objc_msgSend(v7, "addObject:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "content"));
    objc_msgSend(v7, "addObjectsFromArray:", v9);

    v10 = objc_msgSend(v7, "copy");
  }
  else
  {
    v10 = &__NSArray0__struct;
  }

  return v10;
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
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SharedCollectionsDataProvider sharedCollections](self->_sharedCollectionsDataProvider, "sharedCollections", 0));
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
  SharedCollectionsDataProvider *sharedCollectionsDataProvider;
  id v7;
  void *v8;
  id v9;

  sharedCollectionsDataProvider = self->_sharedCollectionsDataProvider;
  v7 = a3;
  -[SharedCollectionsDataProvider setActive:](sharedCollectionsDataProvider, "setActive:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collection"));

  objc_msgSend(v8, "setSortType:", a4);
  -[SharedCollectionsDataProvider setActive:](self->_sharedCollectionsDataProvider, "setActive:", 1);
  v9 = (id)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
  objc_msgSend(v9, "sectionController:setNeedsApplySnapshotAnimated:", self, 0);

}

- (void)_deleteSnapshot:(id)a3
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
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;

  v20 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController deletions](self, "deletions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "identifierPath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "viewModel"));
    v8 = objc_opt_class(TwoLinesSharedTripSummaryOutlineCellModel);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
      v9 = v7;
    else
      v9 = 0;
    v10 = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sharedTripSummary"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "viewModel"));
    v13 = objc_opt_class(TwoLinesMapsSuggestionsEntryOutlineCellModel);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
      v14 = v12;
    else
      v14 = 0;
    v15 = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "entry"));
    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController deletionWithSnapshot:](self, "deletionWithSnapshot:", v20));
      -[HomeOutlineSuggestionsSectionController _processDeletion:forMapsSuggestionsEntry:](self, "_processDeletion:forMapsSuggestionsEntry:", v17, v16);
    }
    else
    {
      if (!v11)
        goto LABEL_11;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sharedTrips"));
      v19 = objc_msgSend(v18, "count");

      if ((unint64_t)v19 > 1)
        goto LABEL_11;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController deletionWithSnapshot:](self, "deletionWithSnapshot:", v20));
      -[HomeOutlineSuggestionsSectionController _processDeletion:forSharedTripSummary:](self, "_processDeletion:forSharedTripSummary:", v17, v11);
    }

LABEL_11:
  }

}

- (void)_processDeletion:(id)a3 forMapsSuggestionsEntry:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "actionCoordinator"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1002F14EC;
  v15[3] = &unk_1011AD1E8;
  objc_copyWeak(&v17, &location);
  v10 = v6;
  v16 = v10;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1002F1584;
  v12[3] = &unk_1011B0E68;
  objc_copyWeak(&v14, &location);
  v11 = v10;
  v13 = v11;
  objc_msgSend(v9, "viewController:removeMapsSuggestionsEntry:sourceView:sourceRect:startBlock:completionBlock:", 0, v7, 0, v15, v12, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)_processDeletion:(id)a3 forSharedTripSummary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sharedTrips"));
  if (objc_msgSend(v8, "count") == (id)1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sharedTrips"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastObject"));

  }
  else
  {
    v10 = 0;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "groupIdentifier"));
  if (v11)
  {
    objc_initWeak(&location, self);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "actionCoordinator"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1002F17D0;
    v14[3] = &unk_1011B0E90;
    objc_copyWeak(&v17, &location);
    v15 = v6;
    v16 = v11;
    objc_msgSend(v13, "confirmDeleteSharedTripWithSummary:sourceView:sourceRect:completion:", v7, 0, v14, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

}

- (void)twoLinesOutlineCell:(id)a3 accessoryViewTapped:(id)a4 accessoryModel:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  char v18;
  void *v19;
  void *v20;
  uint64_t v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "cellModel"));
  v9 = objc_opt_class(TwoLinesMapsSuggestionsEntryOutlineCellModel);
  isKindOfClass = objc_opt_isKindOfClass(v8, v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "cellModel"));
  v12 = v11;
  if ((isKindOfClass & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "entry"));
    if (objc_msgSend(v13, "type") != (id)21
      && !GEOConfigGetBOOL(MapsConfig_ARPForceAllMapsHomeSuggestionsAsRatingSuggestions, off_1014B3A78))
    {
      goto LABEL_9;
    }
    +[HomeAnalyticsManager captureTapActionWithEntry:](HomeAnalyticsManager, "captureTapActionWithEntry:", v13);
    +[HomeAnalyticsManager captureRatingSuggestionTapAction](HomeAnalyticsManager, "captureRatingSuggestionTapAction");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "actionCoordinator"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "geoMapItem"));
    objc_msgSend(v15, "addRatingsForMapItem:", v16);
  }
  else
  {
    v17 = objc_opt_class(TwoLinesSharedTripSummaryOutlineCellModel);
    v18 = objc_opt_isKindOfClass(v12, v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "cellModel"));
    v12 = v19;
    if ((v18 & 1) == 0)
    {
      v21 = objc_opt_class(TwoLinesCollectionOutlineCellModel);
      v22 = objc_opt_isKindOfClass(v12, v21);

      if ((v22 & 1) == 0)
        goto LABEL_10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "cellModel"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "collection"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController sectionIdentifierPath](self, "sectionIdentifierPath"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController identifierCache](self, "identifierCache"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "identifierForObject:", v13));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifierPathByAppendingIdentifier:", v25));

      -[HomeOutlineSectionController toggleElementAtIdentifierPath:](self, "toggleElementAtIdentifierPath:", v14);
      goto LABEL_8;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "sharedTripSummary"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sharedTrips"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "firstObject"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "actionCoordinator"));
    objc_msgSend(v16, "presentSharedTrip:inPopoverFromView:", v14, v7);
  }

LABEL_8:
LABEL_9:

LABEL_10:
}

- (void)twoLinesOutlineCell:(id)a3 tappedActionButtonAtIndex:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellModel"));
  v7 = objc_opt_class(TwoLinesCollectionOutlineCellModel);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    v8 = v6;
  else
    v8 = 0;
  v12 = v8;

  v9 = v12;
  if (v12)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "collection"));
    v11 = v10;
    if (!a4)
    {
      objc_msgSend(v10, "createCollection:", &stru_1011B0EB0);
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2071, 256, 0);
    }
    -[SharedCollectionsDataProvider removeSharedCollection:](self->_sharedCollectionsDataProvider, "removeSharedCollection:", v11);

    v9 = v12;
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
    v15.super_class = (Class)HomeOutlineSuggestionsSectionController;
    v13 = -[HomeOutlineSectionController collectionView:shouldSelectItemAtIndexPath:](&v15, "collectionView:shouldSelectItemAtIndexPath:", v6, v7);
  }

  return v13;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  void *v21;
  uint64_t v22;
  char v23;
  void *v24;
  objc_super v25;

  v6 = a4;
  v25.receiver = self;
  v25.super_class = (Class)HomeOutlineSuggestionsSectionController;
  -[HomeOutlineSectionController collectionView:didSelectItemAtIndexPath:](&v25, "collectionView:didSelectItemAtIndexPath:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
  objc_msgSend(v7, "sectionController:setNeedsApplySnapshotAnimated:", self, 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sectionController:nodeSnapshotAtIndexPath:", self, v6));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewModel"));
  v11 = objc_opt_class(TwoLinesMapsSuggestionsEntryOutlineCellModel);
  isKindOfClass = objc_opt_isKindOfClass(v10, v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewModel"));
  v14 = v13;
  if ((isKindOfClass & 1) != 0 && v10)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "entry"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "analyticsGrouping"));
    v17 = 2039;
    v18 = 8;
LABEL_7:
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v17, v18, v16);
LABEL_8:

    goto LABEL_9;
  }
  v19 = objc_opt_class(TwoLinesCollectionMapItemOutlineCellModel);
  v20 = objc_opt_isKindOfClass(v14, v19);

  if ((v20 & 1) != 0 && v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v6, "row")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringValue"));
    v17 = 2068;
    v18 = 256;
    goto LABEL_7;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewModel"));
  v22 = objc_opt_class(TwoLinesSharedTripSummaryOutlineCellModel);
  v23 = objc_opt_isKindOfClass(v21, v22);

  if ((v23 & 1) != 0 && v21)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewModel"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sharedTripSummary"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_transportTypeStringForAnalytics"));
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 9003, 737, v24);

    goto LABEL_8;
  }
LABEL_9:

}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HomeOutlineSuggestionsSectionController;
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
  v15.super_class = (Class)HomeOutlineSuggestionsSectionController;
  -[HomeOutlineSectionController collectionView:didUpdateFocusInContext:withAnimationCoordinator:](&v15, "collectionView:didUpdateFocusInContext:withAnimationCoordinator:", v10, v9, v8);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
  LODWORD(v10) = objc_msgSend(v13, "isCollectionViewFocusedWithSectionController:", self);

  if (v12 != (_DWORD)v10)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
    objc_msgSend(v14, "sectionController:setNeedsApplySnapshotAnimated:", self, 1);

  }
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  char isKindOfClass;
  void *v16;
  void *v17;
  id v18;

  v6 = a5;
  v7 = objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController delegate](self, "delegate"));
  v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v7, "sectionController:nodeSnapshotAtIndexPath:", self, v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "viewModel"));
  v9 = objc_opt_class(TwoLinesMapsSuggestionsEntryOutlineCellModel);
  LOBYTE(v7) = objc_opt_isKindOfClass(v8, v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "viewModel"));
  v11 = v10;
  if ((v7 & 1) != 0 && v8)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "entry"));
    v13 = objc_msgSend(v12, "type");

    if (v13 == (id)21)
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 339, 8, 0);
    goto LABEL_8;
  }
  v14 = objc_opt_class(TwoLinesSharedTripSummaryOutlineCellModel);
  isKindOfClass = objc_opt_isKindOfClass(v11, v14);

  if ((isKindOfClass & 1) != 0 && v11)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "viewModel"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sharedTripSummary"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_transportTypeStringForAnalytics"));
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 9002, 737, v17);

LABEL_8:
  }

}

- (SuggestionsDataProvider)suggestionsDataProvider
{
  return self->_suggestionsDataProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortItems, 0);
  objc_storeStrong((id *)&self->_suggestionsDataProvider, 0);
  objc_storeStrong((id *)&self->_sharedTripsDataProvider, 0);
  objc_storeStrong((id *)&self->_sharedCollectionsDataProvider, 0);
  objc_storeStrong((id *)&self->_distanceUnitDataProvider, 0);
  objc_storeStrong((id *)&self->_currentLocationDataProvider, 0);
}

@end
