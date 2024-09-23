@implementation ShortcutsRowCellProvider

- (ShortcutsRowCellProvider)initWithCollectionView:(id)a3
{
  id v4;
  ShortcutsRowCellProvider *v5;
  ShortcutsRowCellProvider *v6;
  id v7;
  void *v8;
  id WeakRetained;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  _QWORD *v15;
  void *v16;
  UICollectionViewDiffableDataSource *v17;
  UICollectionViewDiffableDataSource *diffableDataSource;
  id v19;
  void *v20;
  uint64_t v21;
  NSLayoutConstraint *heightConstraint;
  ShortcutsRowBackgroundView *v23;
  id v24;
  ShortcutsRowBackgroundView *v25;
  ShortcutsRowBackgroundView *backgroundView;
  ShortcutsRowBackgroundView *v27;
  id v28;
  uint64_t v29;
  NSDate *lastCellTappedTimestamp;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)ShortcutsRowCellProvider;
  v5 = -[ShortcutsRowCellProvider init](&v32, "init");
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_collectionView, v4);
    objc_msgSend(v4, "setDelegate:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCellProvider _collectionViewLayout](v6, "_collectionViewLayout"));
    WeakRetained = objc_loadWeakRetained((id *)&v6->_collectionView);
    objc_msgSend(WeakRetained, "setCollectionViewLayout:", v8);

    v10 = objc_loadWeakRetained((id *)&v6->_collectionView);
    v11 = objc_opt_class(ShortcutsRowCollectionViewCell);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutsRowCollectionViewCell cellReuseIdentifier](ShortcutsRowCollectionViewCell, "cellReuseIdentifier"));
    objc_msgSend(v10, "registerClass:forCellWithReuseIdentifier:", v11, v12);

    v13 = objc_alloc((Class)UICollectionViewDiffableDataSource);
    v14 = objc_loadWeakRetained((id *)&v6->_collectionView);
    v15 = sub_10046DA38(v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (UICollectionViewDiffableDataSource *)objc_msgSend(v13, "initWithCollectionView:cellProvider:", v14, v16);
    diffableDataSource = v6->_diffableDataSource;
    v6->_diffableDataSource = v17;

    v19 = objc_loadWeakRetained((id *)&v6->_collectionView);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "heightAnchor"));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToConstant:", 0.0));
    heightConstraint = v6->_heightConstraint;
    v6->_heightConstraint = (NSLayoutConstraint *)v21;

    v23 = [ShortcutsRowBackgroundView alloc];
    v24 = objc_loadWeakRetained((id *)&v6->_collectionView);
    v25 = -[ShortcutsRowBackgroundView initWithCollectionView:](v23, "initWithCollectionView:", v24);
    backgroundView = v6->_backgroundView;
    v6->_backgroundView = v25;

    v27 = v6->_backgroundView;
    v28 = objc_loadWeakRetained((id *)&v6->_collectionView);
    objc_msgSend(v28, "setBackgroundView:", v27);

    v29 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
    lastCellTappedTimestamp = v6->_lastCellTappedTimestamp;
    v6->_lastCellTappedTimestamp = (NSDate *)v29;

  }
  return v6;
}

- (void)setFavoritesDataProvider:(id)a3
{
  _TtC4Maps20MapsFavoritesManager *v5;
  _TtC4Maps20MapsFavoritesManager *favoritesDataProvider;
  _TtC4Maps20MapsFavoritesManager *v7;

  v5 = (_TtC4Maps20MapsFavoritesManager *)a3;
  favoritesDataProvider = self->_favoritesDataProvider;
  if (favoritesDataProvider != v5)
  {
    v7 = v5;
    -[MapsFavoritesManager unregisterObserver:](favoritesDataProvider, "unregisterObserver:", self);
    objc_storeStrong((id *)&self->_favoritesDataProvider, a3);
    -[MapsFavoritesManager registerObserver:](self->_favoritesDataProvider, "registerObserver:", self);
    -[ShortcutsRowCellProvider _updateContentAnimated:](self, "_updateContentAnimated:", 0);
    v5 = v7;
  }

}

- (void)setSuggestionsDataProvider:(id)a3
{
  SuggestionsDataProvider *v5;
  SuggestionsDataProvider *suggestionsDataProvider;
  void *v7;
  void *v8;
  SuggestionsDataProvider *v9;

  v5 = (SuggestionsDataProvider *)a3;
  suggestionsDataProvider = self->_suggestionsDataProvider;
  if (suggestionsDataProvider != v5)
  {
    v9 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SuggestionsDataProvider observers](suggestionsDataProvider, "observers"));
    objc_msgSend(v7, "unregisterObserver:", self);

    objc_storeStrong((id *)&self->_suggestionsDataProvider, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SuggestionsDataProvider observers](self->_suggestionsDataProvider, "observers"));
    objc_msgSend(v8, "registerObserver:", self);

    -[ShortcutsRowCellProvider _updateContentAnimated:](self, "_updateContentAnimated:", 0);
    v5 = v9;
  }

}

- (void)setTraitCollection:(id)a3
{
  UITraitCollection *v5;
  UITraitCollection *v6;
  unsigned __int8 v7;
  UITraitCollection *v8;

  v5 = (UITraitCollection *)a3;
  v6 = v5;
  if (self->_traitCollection != v5)
  {
    v8 = v5;
    v7 = -[UITraitCollection isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_traitCollection, a3);
      -[ShortcutsRowCellProvider _updateHeightConstraint](self, "_updateHeightConstraint");
      v6 = v8;
    }
  }

}

- (void)fetchMissingImages
{
  NSArray *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_cellModels;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "fetchImageIfMissing", (_QWORD)v7);
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_updateHeightConstraint
{
  double v3;
  double v4;
  NSString *v5;
  _BOOL4 IsAccessibilityCategory;
  double v7;

  +[ShortcutsRowCollectionViewCell cellSizeWithTraitCollection:](ShortcutsRowCollectionViewCell, "cellSizeWithTraitCollection:", self->_traitCollection);
  v4 = v3;
  v5 = (NSString *)objc_claimAutoreleasedReturnValue(-[UITraitCollection preferredContentSizeCategory](self->_traitCollection, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  v7 = v4 + v4;
  if (!IsAccessibilityCategory)
    v7 = v4;
  -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:", v7);
}

- (id)_collectionViewLayout
{
  UICollectionViewCompositionalLayout *collectionViewLayout;
  id v4;
  id v5;
  UICollectionViewCompositionalLayout *v6;
  UICollectionViewCompositionalLayout *v7;
  _QWORD v9[4];
  id v10;
  id location;

  collectionViewLayout = self->_collectionViewLayout;
  if (!collectionViewLayout)
  {
    v4 = objc_alloc_init((Class)UICollectionViewCompositionalLayoutConfiguration);
    objc_msgSend(v4, "setScrollDirection:", 1);
    objc_initWeak(&location, self);
    v5 = objc_alloc((Class)UICollectionViewCompositionalLayout);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100823808;
    v9[3] = &unk_1011B5F50;
    objc_copyWeak(&v10, &location);
    v6 = (UICollectionViewCompositionalLayout *)objc_msgSend(v5, "initWithSectionProvider:configuration:", v9, v4);
    v7 = self->_collectionViewLayout;
    self->_collectionViewLayout = v6;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);

    collectionViewLayout = self->_collectionViewLayout;
  }
  return collectionViewLayout;
}

- (void)_updateContentAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  unsigned __int8 v6;
  NSArray *v7;
  NSArray *shortcuts;
  NSArray *v9;
  void *v10;
  UICollectionViewDiffableDataSource *diffableDataSource;
  id *v12;
  void *v13;
  unsigned __int8 v14;
  NSArray *v15;
  NSArray *shortcutsLegacy;
  UICollectionViewDiffableDataSource *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;

  v3 = a3;
  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFavoritesManager shortcutsForMapsHome](self->_favoritesDataProvider, "shortcutsForMapsHome"));
    v6 = objc_msgSend(v5, "isEqual:", self->_shortcuts);

    if ((v6 & 1) != 0)
      return;
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue(-[MapsFavoritesManager shortcutsForMapsHome](self->_favoritesDataProvider, "shortcutsForMapsHome"));
    shortcuts = self->_shortcuts;
    self->_shortcuts = v7;

    v9 = self->_cellModels;
    -[ShortcutsRowCellProvider _buildModels](self, "_buildModels");
    objc_initWeak(&location, self);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDiffableDataSourceSnapshot _maps_singleSectionSnapshotWithIdentifiersForItems:reloadingChangesFromPreviousItems:](NSDiffableDataSourceSnapshot, "_maps_singleSectionSnapshotWithIdentifiersForItems:reloadingChangesFromPreviousItems:", self->_cellModels, v9));
    diffableDataSource = self->_diffableDataSource;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100823DC8;
    v20[3] = &unk_1011AD260;
    v12 = &v21;
    objc_copyWeak(&v21, &location);
    -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:completion:](diffableDataSource, "applySnapshot:animatingDifferences:completion:", v10, v3, v20);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SuggestionsDataProvider shortcuts](self->_suggestionsDataProvider, "shortcuts"));
    v14 = objc_msgSend(v13, "isEqual:", self->_shortcuts);

    if ((v14 & 1) != 0)
      return;
    v15 = (NSArray *)objc_claimAutoreleasedReturnValue(-[SuggestionsDataProvider shortcuts](self->_suggestionsDataProvider, "shortcuts"));
    shortcutsLegacy = self->_shortcutsLegacy;
    self->_shortcutsLegacy = v15;

    v9 = self->_cellModels;
    -[ShortcutsRowCellProvider _buildModels](self, "_buildModels");
    objc_initWeak(&location, self);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDiffableDataSourceSnapshot _maps_singleSectionSnapshotWithIdentifiersForItems:reloadingChangesFromPreviousItems:](NSDiffableDataSourceSnapshot, "_maps_singleSectionSnapshotWithIdentifiersForItems:reloadingChangesFromPreviousItems:", self->_cellModels, v9));
    v17 = self->_diffableDataSource;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100823DF4;
    v18[3] = &unk_1011AD260;
    v12 = &v19;
    objc_copyWeak(&v19, &location);
    -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:completion:](v17, "applySnapshot:animatingDifferences:completion:", v10, v3, v18);
  }
  objc_destroyWeak(v12);

  objc_destroyWeak(&location);
}

- (void)_buildModels
{
  void *v3;
  void *v4;
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  SuggestionShortcutsRowCellModel *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  uint64_t v17;
  SuggestionShortcutsRowCellModel *v18;
  SuggestionShortcutsRowCellModel *v19;
  id v20;
  void *v21;
  AddShortcutsRowCellModel *v22;
  NSArray *v23;
  NSArray *cellModels;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v31 = 0uLL;
    v32 = 0uLL;
    v29 = 0uLL;
    v30 = 0uLL;
    v5 = self->_shortcuts;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v8)
            objc_enumerationMutation(v5);
          v10 = -[SuggestionShortcutsRowCellModel initWithMapsFavoriteItem:]([SuggestionShortcutsRowCellModel alloc], "initWithMapsFavoriteItem:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i));
          v11 = sub_10046DCCC(v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
          if (v12 && (objc_msgSend(v4, "containsObject:", v12) & 1) == 0)
          {
            objc_msgSend(v3, "addObject:", v10);
            objc_msgSend(v4, "addObject:", v12);
          }

        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v7);
    }
  }
  else
  {
    v27 = 0uLL;
    v28 = 0uLL;
    v25 = 0uLL;
    v26 = 0uLL;
    v5 = self->_shortcutsLegacy;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v14; j = (char *)j + 1)
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(v5);
          v17 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)j);
          v18 = [SuggestionShortcutsRowCellModel alloc];
          v19 = -[SuggestionShortcutsRowCellModel initWithMapsSuggestionsEntry:](v18, "initWithMapsSuggestionsEntry:", v17, (_QWORD)v25);
          v20 = sub_10046DCCC(v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          if (v21 && (objc_msgSend(v4, "containsObject:", v21) & 1) == 0)
          {
            objc_msgSend(v3, "addObject:", v19);
            objc_msgSend(v4, "addObject:", v21);
          }

        }
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v14);
    }
  }

  v22 = objc_alloc_init(AddShortcutsRowCellModel);
  objc_msgSend(v3, "addObject:", v22);

  v23 = (NSArray *)objc_msgSend(v3, "copy");
  cellModels = self->_cellModels;
  self->_cellModels = v23;

}

- (void)_updateBackgroundView
{
  -[ShortcutsRowBackgroundView invalidateLayout](self->_backgroundView, "invalidateLayout");
}

- (id)_modelAtIndexPath:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (((unint64_t)objc_msgSend(v4, "row") & 0x8000000000000000) != 0
    || (v5 = objc_msgSend(v4, "row"), v5 >= (id)-[NSArray count](self->_cellModels, "count")))
  {
    v6 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_cellModels, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));
  }

  return v6;
}

- (void)homeDataProvidingObjectDidUpdate:(id)a3
{
  -[ShortcutsRowCellProvider _updateContentAnimated:](self, "_updateContentAnimated:", 1);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSArray *cellModels;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void **v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, uint64_t, _BYTE *);
  void *v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_1008242C8;
  v27 = sub_1008242D8;
  v28 = 0;
  cellModels = self->_cellModels;
  v17 = _NSConcreteStackBlock;
  v18 = 3221225472;
  v19 = sub_1008242E0;
  v20 = &unk_1011CA308;
  v12 = v10;
  v21 = v12;
  v22 = &v23;
  -[NSArray enumerateObjectsUsingBlock:](cellModels, "enumerateObjectsUsingBlock:", &v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutsRowCollectionViewCell cellReuseIdentifier](ShortcutsRowCollectionViewCell, "cellReuseIdentifier", v17, v18, v19, v20));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v13, v9));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCellProvider _modelAtIndexPath:](self, "_modelAtIndexPath:", v24[5]));
  objc_msgSend(v14, "setModel:", v15);

  objc_msgSend(v14, "setAccessibilityIdentifier:", CFSTR("ShortcutsRowCell"));
  _Block_object_dispose(&v23, 8);

  return v14;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a4;
  v7 = a5;
  v8 = objc_opt_class(ShortcutsRowCollectionViewCell);
  if ((objc_opt_isKindOfClass(v14, v8) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "model"));
    objc_msgSend(v9, "fetchImageIfMissing");

  }
  -[NSDate timeIntervalSinceNow](self->_lastCellTappedTimestamp, "timeIntervalSinceNow");
  if (v10 < -1.0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCellProvider _modelAtIndexPath:](self, "_modelAtIndexPath:", v7));
    v12 = objc_opt_class(SuggestionShortcutsRowCellModel);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    {
      if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "entry"));
        +[HomeAnalyticsManager captureDisplayActionWithFavorite:](HomeAnalyticsManager, "captureDisplayActionWithFavorite:", v13);
      }
      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "entryLegacy"));
        +[HomeAnalyticsManager captureDisplayActionWithEntry:](HomeAnalyticsManager, "captureDisplayActionWithEntry:", v13);
      }

    }
  }

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  unsigned int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSDate *v14;
  NSDate *lastCellTappedTimestamp;
  id v16;

  v16 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCellProvider _modelAtIndexPath:](self, "_modelAtIndexPath:", v6));
  v8 = objc_opt_class(SuggestionShortcutsRowCellModel);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    v9 = v7;
    v10 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCellProvider delegate](self, "delegate"));
    if (v10)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "entry"));
      objc_msgSend(v11, "shortcutsRowCellProvider:openFavorite:", self, v12);
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "entryLegacy"));
      objc_msgSend(v11, "shortcutsRowCellProvider:openShortcut:", self, v12);
    }

    goto LABEL_8;
  }
  v13 = objc_opt_class(AddShortcutsRowCellModel);
  if ((objc_opt_isKindOfClass(v7, v13) & 1) != 0)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCellProvider delegate](self, "delegate"));
    objc_msgSend(v9, "shortcutsRowCellProviderAddNewShortcut:", self);
LABEL_8:

  }
  objc_msgSend(v16, "deselectItemAtIndexPath:animated:", v6, 1);
  -[ShortcutsRowCellProvider _captureTapActionWithModel:](self, "_captureTapActionWithModel:", v7);
  v14 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  lastCellTappedTimestamp = self->_lastCellTappedTimestamp;
  self->_lastCellTappedTimestamp = v14;

}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  unsigned __int8 v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[5];
  id v16;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "firstObject", a3, a5.x, a5.y));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ShortcutsRowCellProvider _modelAtIndexPath:](self, "_modelAtIndexPath:", v6));

  v8 = objc_opt_class(SuggestionShortcutsRowCellModel);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    v9 = v7;
    if (!+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
    {

      v10 = 0;
LABEL_8:
      v13 = 0;
      goto LABEL_9;
    }
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "entry"));
    v11 = objc_msgSend(v10, "isShortcutForSetup");

    if ((v11 & 1) != 0)
      goto LABEL_8;
    goto LABEL_6;
  }
  v12 = objc_opt_class(AddShortcutsRowCellModel);
  v10 = 0;
  v13 = 0;
  if ((objc_opt_isKindOfClass(v7, v12) & 1) == 0)
  {
LABEL_6:
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100824754;
    v15[3] = &unk_1011CA330;
    v15[4] = self;
    v10 = v10;
    v16 = v10;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v15));

  }
LABEL_9:

  return v13;
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellForItemAtIndexPath:", a5, a4));
  if (v5)
  {
    v6 = objc_alloc_init((Class)UIPreviewParameters);
    objc_msgSend(v5, "bounds");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:"));
    objc_msgSend(v6, "setVisiblePath:", v7);

    v8 = objc_msgSend(objc_alloc((Class)UITargetedPreview), "initWithView:parameters:", v5, v6);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_captureTapActionWithModel:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2007, 8, 0);
  v3 = objc_opt_class(SuggestionShortcutsRowCellModel);
  if ((objc_opt_isKindOfClass(v7, v3) & 1) != 0)
  {
    v4 = v7;
    if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "entry"));
      +[HomeAnalyticsManager captureTapActionWithFavorite:](HomeAnalyticsManager, "captureTapActionWithFavorite:", v5);
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "entryLegacy"));
      +[HomeAnalyticsManager captureTapActionWithEntry:](HomeAnalyticsManager, "captureTapActionWithEntry:", v5);
    }

  }
  else
  {
    v6 = objc_opt_class(AddShortcutsRowCellModel);
    if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0)
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2044, 8, 0);
  }

}

- (UICollectionView)collectionView
{
  return (UICollectionView *)objc_loadWeakRetained((id *)&self->_collectionView);
}

- (ShortcutsRowCellProviderDelegate)delegate
{
  return (ShortcutsRowCellProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (SuggestionsDataProvider)suggestionsDataProvider
{
  return self->_suggestionsDataProvider;
}

- (_TtC4Maps20MapsFavoritesManager)favoritesDataProvider
{
  return self->_favoritesDataProvider;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_favoritesDataProvider, 0);
  objc_storeStrong((id *)&self->_suggestionsDataProvider, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_storeStrong((id *)&self->_lastCellTappedTimestamp, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_cellModels, 0);
  objc_storeStrong((id *)&self->_shortcutsLegacy, 0);
  objc_storeStrong((id *)&self->_shortcuts, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
}

@end
