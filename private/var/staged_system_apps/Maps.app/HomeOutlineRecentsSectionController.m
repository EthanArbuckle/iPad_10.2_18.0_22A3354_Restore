@implementation HomeOutlineRecentsSectionController

- (HomeOutlineRecentsSectionController)initWithConfiguration:(id)a3
{
  HomeOutlineRecentsSectionController *v3;
  MarkedLocationDataProvider *v4;
  MarkedLocationDataProvider *markedLocationDataProvider;
  RecentsDataProvider *v6;
  RecentsDataProvider *recentsDataProvider;
  RecentsDataFilter *v8;
  RecentsDataFilter *recentsDataFilter;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HomeOutlineRecentsSectionController;
  v3 = -[HomeOutlineSectionController initWithConfiguration:](&v11, "initWithConfiguration:", a3);
  if (v3)
  {
    v4 = objc_alloc_init(MarkedLocationDataProvider);
    markedLocationDataProvider = v3->_markedLocationDataProvider;
    v3->_markedLocationDataProvider = v4;

    v6 = objc_alloc_init(RecentsDataProvider);
    recentsDataProvider = v3->_recentsDataProvider;
    v3->_recentsDataProvider = v6;

    v8 = -[RecentsDataFilter initWithSearchMode:filterPredicate:]([RecentsDataFilter alloc], "initWithSearchMode:filterPredicate:", 1, 0);
    recentsDataFilter = v3->_recentsDataFilter;
    v3->_recentsDataFilter = v8;

  }
  return v3;
}

- (NSArray)dataProviders
{
  RecentsDataProvider *recentsDataProvider;
  _QWORD v4[2];

  recentsDataProvider = self->_recentsDataProvider;
  v4[0] = self->_markedLocationDataProvider;
  v4[1] = recentsDataProvider;
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v4, 2));
}

- (MapsUIDiffableDataSourceViewModel)sectionHeaderViewModel
{
  SectionHeaderBasicOutlineCellModel *v2;
  void *v3;
  void *v4;
  SectionHeaderBasicOutlineCellModel *v5;

  v2 = [SectionHeaderBasicOutlineCellModel alloc];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[Proactive Tray] Recents Section"), CFSTR("localized string not found"), 0));
  v5 = -[SectionHeaderBasicOutlineCellModel initWithTitle:](v2, "initWithTitle:", v4);

  return (MapsUIDiffableDataSourceViewModel *)v5;
}

- (NSArray)itemSnapshots
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SmallButtonOutlineCellModel *v10;
  void *v11;
  void *v12;
  SmallButtonOutlineCellModel *v13;
  MapsUIDiffableDataSourceOutlineNodeSnapshot *v14;
  void *v15;
  void *v16;
  MapsUIDiffableDataSourceOutlineNodeSnapshot *v17;
  uint64_t v18;
  _QWORD v20[5];
  _QWORD v21[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MarkedLocationDataProvider markedLocation](self->_markedLocationDataProvider, "markedLocation"));
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RecentsDataProvider recents](self->_recentsDataProvider, "recents"));
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RecentsDataFilter filteredRecents:excludingDuplicatesOfEntries:](self->_recentsDataFilter, "filteredRecents:excludingDuplicatesOfEntries:", v3, &__NSArray0__struct));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sectionIdentifier"));
  v20[4] = self;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100A266D8;
  v21[3] = &unk_1011ACD28;
  v21[4] = self;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100A26730;
  v20[3] = &unk_1011DC068;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[HomeOutlineSectionBuilder itemSnapshotsWithItems:sectionIdentifier:sectionExpanded:itemIdentifierBlock:viewModelBlock:childItemsBlock:expandedBlock:](HomeOutlineSectionBuilder, "itemSnapshotsWithItems:sectionIdentifier:sectionExpanded:itemIdentifierBlock:viewModelBlock:childItemsBlock:expandedBlock:", v6, v8, -[HomeOutlineSectionController expanded](self, "expanded"), v21, v20, &stru_1011DFEA8, &stru_1011DFEC8));

  if (-[HomeOutlineRecentsSectionController _shouldShowClearButtonForItemSnapshots:](self, "_shouldShowClearButtonForItemSnapshots:", v9))
  {
    v10 = [SmallButtonOutlineCellModel alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("[Proactive Tray] Clear Recents"), CFSTR("localized string not found"), 0));
    v13 = -[SmallButtonOutlineCellModel initWithStyle:title:image:hoverImage:delegate:](v10, "initWithStyle:title:image:hoverImage:delegate:", 0, v12, 0, 0, self);

    v14 = [MapsUIDiffableDataSourceOutlineNodeSnapshot alloc];
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController sectionIdentifierPath](self, "sectionIdentifierPath"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifierPathByAppendingIdentifier:", CFSTR("ClearRecents")));
    v17 = -[MapsUIDiffableDataSourceOutlineNodeSnapshot initWithIdentifierPath:viewModel:childSnapshots:expanded:](v14, "initWithIdentifierPath:viewModel:childSnapshots:expanded:", v16, v13, &__NSArray0__struct, 0);

    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "arrayByAddingObject:", v17));
    v9 = (void *)v18;
  }

  return (NSArray *)v9;
}

- (id)contextMenuForSnapshot:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  unsigned int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;
  void *v17;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewModel"));
  v6 = objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL___TwoLinesOutlineCellModel);

  if (v5)
    v7 = v6;
  else
    v7 = 0;
  if (v7 == 1)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100A26BCC;
    v13[3] = &unk_1011AD1E8;
    objc_copyWeak(&v15, &location);
    v14 = v4;
    v8 = HomeDeleteAction(v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v17 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", &stru_1011EB268, v10));

    objc_destroyWeak(&v15);
  }
  else
  {
    v11 = 0;
  }
  objc_destroyWeak(&location);

  return v11;
}

- (BOOL)persistsExpansions
{
  return 1;
}

- (BOOL)_shouldShowClearButtonForItemSnapshots:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned int v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewModel", (_QWORD)v18));
        v11 = objc_msgSend(v10, "conformsToProtocol:", &OBJC_PROTOCOL___HomeRecentsItemCellModel);

        if (v10)
          v12 = v11 == 0;
        else
          v12 = 1;
        if (!v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController deletions](self, "deletions"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifierPath"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v14));

          if (!v15)
          {
            v16 = 1;
            goto LABEL_15;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v6)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_15:

  return v16;
}

- (void)_deleteSnapshot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char isKindOfClass;
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController deletions](self, "deletions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifierPath"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));

  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewModel"));
    v9 = objc_msgSend(v8, "conformsToProtocol:", &OBJC_PROTOCOL___HomeRecentsItemCellModel);

    if (v8 && v9)
    {
      v14 = v4;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
      -[HomeOutlineRecentsSectionController _deleteRecentsSnapshots:deleteAll:](self, "_deleteRecentsSnapshots:deleteAll:", v10, 0);

    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewModel"));
      v12 = objc_opt_class(TwoLinesSearchResultOutlineCellModel);
      isKindOfClass = objc_opt_isKindOfClass(v11, v12);

      if ((isKindOfClass & 1) != 0 && v11)
        -[HomeOutlineRecentsSectionController _deleteMarkedLocationSnapshot:](self, "_deleteMarkedLocationSnapshot:", v4);
    }
  }

}

- (void)_deleteMarkedLocationSnapshot:(id)a3
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

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewModel"));
  v6 = objc_opt_class(TwoLinesSearchResultOutlineCellModel);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "searchResult"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController deletionWithSnapshot:](self, "deletionWithSnapshot:", v4));
    v14 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
    -[HomeOutlineSectionController beginDeletions:](self, "beginDeletions:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "actionCoordinator"));
    objc_msgSend(v13, "deleteMarkedLocation:", v9);

  }
}

- (void)_deleteRecentsSnapshots:(id)a3 deleteAll:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  RecentsDataProvider *recentsDataProvider;
  _QWORD *v12;
  id *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;
  id location;
  _QWORD v19[5];

  v4 = a4;
  v6 = a3;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100A271C0;
  v19[3] = &unk_1011DFEF0;
  v19[4] = self;
  v7 = sub_10039DCD4(v6, v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = sub_10039DCD4(v8, &stru_1011DFF30);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_initWeak(&location, self);
  -[HomeOutlineSectionController beginDeletions:](self, "beginDeletions:", v8);
  recentsDataProvider = self->_recentsDataProvider;
  if (v4)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100A2730C;
    v16[3] = &unk_1011B2260;
    v12 = v16;
    v13 = &v17;
    objc_copyWeak(&v17, &location);
    v16[4] = v8;
    -[RecentsDataProvider deleteAllRecentsWithCompletion:](recentsDataProvider, "deleteAllRecentsWithCompletion:", v16);
  }
  else
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100A27368;
    v14[3] = &unk_1011B2260;
    v12 = v14;
    v13 = &v15;
    objc_copyWeak(&v15, &location);
    v14[4] = v8;
    -[RecentsDataProvider deleteRecents:completion:](recentsDataProvider, "deleteRecents:completion:", v10, v14);
  }

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);

}

- (void)smallButtonOutlineCellTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  unsigned int v13;
  BOOL v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array", a3));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController sectionSnapshot](self, "sectionSnapshot", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "childSnapshots"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "viewModel"));
        v13 = objc_msgSend(v12, "conformsToProtocol:", &OBJC_PROTOCOL___HomeRecentsItemCellModel);

        if (v12)
          v14 = v13 == 0;
        else
          v14 = 1;
        if (!v14)
          objc_msgSend(v4, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  -[HomeOutlineRecentsSectionController _deleteRecentsSnapshots:deleteAll:](self, "_deleteRecentsSnapshots:deleteAll:", v4, 1);
}

- (void)twoLinesOutlineCell:(id)a3 accessoryViewTapped:(id)a4 accessoryModel:(id)a5
{
  void *v7;
  void *v8;
  id v9;
  id v10;
  __objc2_prot *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  unsigned int v17;
  id v18;
  void *v19;
  void *v20;
  IncompleteTransitLineItem *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellModel"));
  if (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___HomeRecentsItemCellModel))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "homeRecentsItem"));
    v11 = &OBJC_PROTOCOL___MSPHistoryEntryTransitLineItem;
    v12 = objc_opt_class(HistoryEntryRecentsItem);
    v13 = v10;
    if ((objc_opt_isKindOfClass(v13, v12) & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    if (v15
      && (v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "historyEntry")),
          v17 = objc_msgSend(v16, "conformsToProtocol:", v11),
          v16,
          v17))
    {
      v18 = v13;
    }
    else
    {
      v18 = 0;
    }

    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "historyEntry"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lineItem"));

      v21 = -[IncompleteTransitLineItem initWithTransitLine:]([IncompleteTransitLineItem alloc], "initWithTransitLine:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "actionCoordinator"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "homeActionDelegate"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "homeContaineeViewController"));
      objc_msgSend(v27, "bounds");
      objc_msgSend(v23, "viewController:openTransitLineCard:sourceView:sourceRect:", v26, v21, v27);

    }
  }

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2064, 8, 0);
  v8.receiver = self;
  v8.super_class = (Class)HomeOutlineRecentsSectionController;
  -[HomeOutlineSectionController collectionView:didSelectItemAtIndexPath:](&v8, "collectionView:didSelectItemAtIndexPath:", v7, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentsDataFilter, 0);
  objc_storeStrong((id *)&self->_recentsDataProvider, 0);
  objc_storeStrong((id *)&self->_markedLocationDataProvider, 0);
}

@end
