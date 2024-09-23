@implementation OfflineMapsManagementSearchAutocompleteDataSource

- (OfflineMapsManagementSearchAutocompleteDataSource)initWithCollectionView:(id)a3 updateLocation:(BOOL)a4
{
  OfflineMapsManagementSearchAutocompleteDataSource *v4;
  OfflineMapsManagementSearchAutocompleteDataSource *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)OfflineMapsManagementSearchAutocompleteDataSource;
  v4 = -[DataSource initWithCollectionView:updateLocation:](&v7, "initWithCollectionView:updateLocation:", a3, a4);
  v5 = v4;
  if (v4)
    -[OfflineMapsManagementSearchAutocompleteDataSource commonInit](v4, "commonInit");
  return v5;
}

- (void)commonInit
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  id v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  RecentsDataFilter *v21;
  RecentsDataProvider *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
  objc_msgSend(v3, "setDelegate:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
  v5 = objc_opt_class(TwoLineCollectionViewListCell);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLineCollectionViewListCell identifier](TwoLineCollectionViewListCell, "identifier"));
  objc_msgSend(v4, "registerClass:forCellWithReuseIdentifier:", v5, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
  v8 = objc_opt_class(SectionHeaderCollectionReusableView);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SectionHeaderCollectionReusableView reuseIdentifier](SectionHeaderCollectionReusableView, "reuseIdentifier"));
  objc_msgSend(v7, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v8, UICollectionElementKindSectionHeader, v9);

  v10 = objc_alloc((Class)UICollectionViewDiffableDataSource);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
  v12 = sub_10046DA38(self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = objc_msgSend(v10, "initWithCollectionView:cellProvider:", v11, v13);
  -[OfflineMapsManagementSearchAutocompleteDataSource setDiffableDataSource:](self, "setDiffableDataSource:", v14);

  v15 = sub_10046DBB0(self);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteDataSource diffableDataSource](self, "diffableDataSource"));
  objc_msgSend(v17, "setSupplementaryViewProvider:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
  -[OfflineMapsManagementSearchAutocompleteDataSource setCurrentLocationSearchResult:](self, "setCurrentLocationSearchResult:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CustomLocationManager sharedManager](CustomLocationManager, "sharedManager"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteDataSource currentLocationSearchResult](self, "currentLocationSearchResult"));
  objc_msgSend(v19, "processSearchResult:traits:", v20, 0);

  v28 = (id)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_1011E83B0));
  v21 = -[RecentsDataFilter initWithSearchMode:filterPredicate:]([RecentsDataFilter alloc], "initWithSearchMode:filterPredicate:", 1, v28);
  -[OfflineMapsManagementSearchAutocompleteDataSource setRecentsDataFilter:](self, "setRecentsDataFilter:", v21);

  v22 = objc_alloc_init(RecentsDataProvider);
  -[OfflineMapsManagementSearchAutocompleteDataSource setRecentsDataProvider:](self, "setRecentsDataProvider:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteDataSource recentsDataProvider](self, "recentsDataProvider"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "observers"));
  objc_msgSend(v24, "registerObserver:", self);

  v25 = objc_alloc_init((Class)MKLocalSearchCompleter);
  -[OfflineMapsManagementSearchAutocompleteDataSource setSearchCompleter:](self, "setSearchCompleter:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteDataSource searchCompleter](self, "searchCompleter"));
  objc_msgSend(v26, "setDelegate:", self);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteDataSource searchCompleter](self, "searchCompleter"));
  objc_msgSend(v27, "_setPrivateFilterType:", 1003);

}

- (void)updateForSearchQuery:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteDataSource searchCompleter](self, "searchCompleter"));
  objc_msgSend(v5, "setQueryFragment:", v4);

}

- (void)setActive:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  if (-[DataSource active](self, "active") != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)OfflineMapsManagementSearchAutocompleteDataSource;
    -[DataSource setActive:](&v6, "setActive:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteDataSource recentsDataProvider](self, "recentsDataProvider"));
    objc_msgSend(v5, "setActive:", v3);

    if (v3)
      -[OfflineMapsManagementSearchAutocompleteDataSource _updateContentAnimated:](self, "_updateContentAnimated:", 0);
  }
}

- (id)sectionForSectionIndex:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteDataSource sections](self, "sections"));
  v6 = objc_msgSend(v5, "count");

  if ((unint64_t)v6 >= a3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteDataSource sections](self, "sections"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", a3));

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (int64_t)numberOfItemsInSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteDataSource diffableDataSource](self, "diffableDataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "snapshot"));
  v7 = objc_msgSend(v6, "numberOfItemsInSection:", v4);

  return (int64_t)v7;
}

- (void)_updateContentAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  void *v7;
  id v8;
  OfflineMapsManagementSearchAutocompleteSection *v9;
  OfflineMapsManagementSearchAutocompleteSection *v10;
  void *v11;
  OfflineMapsManagementSearchAutocompleteSection *v12;
  OfflineMapsManagementSearchAutocompleteSection *v13;
  void *v14;
  OfflineMapsManagementSearchAutocompleteSection *v15;
  OfflineMapsManagementSearchAutocompleteSection *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  OfflineMapsManagementSearchAutocompleteSection *v26;
  void *v27;
  OfflineMapsManagementSearchAutocompleteSection *v28;
  OfflineMapsManagementSearchAutocompleteSection *v29;

  v3 = a3;
  v5 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteDataSource searchCompleter](self, "searchCompleter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "queryFragment"));
  v8 = objc_msgSend(v7, "length");

  v9 = [OfflineMapsManagementSearchAutocompleteSection alloc];
  if (v8)
  {
    v10 = -[OfflineMapsManagementSearchAutocompleteSection initWithSectionType:](v9, "initWithSectionType:", 2);
    v29 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
    objc_msgSend(v5, "appendSectionsWithIdentifiers:", v11);

    v12 = (OfflineMapsManagementSearchAutocompleteSection *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteDataSource searchCompleter](self, "searchCompleter"));
    v13 = (OfflineMapsManagementSearchAutocompleteSection *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteSection results](v12, "results"));
    v14 = v5;
    v15 = v13;
    v16 = v10;
LABEL_5:
    objc_msgSend(v14, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v15, v16);

    goto LABEL_6;
  }
  v10 = -[OfflineMapsManagementSearchAutocompleteSection initWithSectionType:](v9, "initWithSectionType:", 0);
  v28 = v10;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
  objc_msgSend(v5, "appendSectionsWithIdentifiers:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteDataSource currentLocationSearchResult](self, "currentLocationSearchResult"));
  v27 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
  objc_msgSend(v5, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v19, v10);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteDataSource recentsDataFilter](self, "recentsDataFilter"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteDataSource recentsDataProvider](self, "recentsDataProvider"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "recents"));
  v12 = (OfflineMapsManagementSearchAutocompleteSection *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "filteredRecents:excludingDuplicatesOfEntries:", v22, &__NSArray0__struct));

  if (-[OfflineMapsManagementSearchAutocompleteSection count](v12, "count"))
  {
    v13 = -[OfflineMapsManagementSearchAutocompleteSection initWithSectionType:]([OfflineMapsManagementSearchAutocompleteSection alloc], "initWithSectionType:", 1);
    v26 = v13;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
    objc_msgSend(v5, "appendSectionsWithIdentifiers:", v23);

    v14 = v5;
    v15 = v12;
    v16 = v13;
    goto LABEL_5;
  }
LABEL_6:

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sectionIdentifiers"));
  -[OfflineMapsManagementSearchAutocompleteDataSource setSections:](self, "setSections:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteDataSource diffableDataSource](self, "diffableDataSource"));
  objc_msgSend(v25, "applySnapshot:animatingDifferences:", v5, v3);

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_opt_class(MKLocalSearchCompletion);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
  {
    v11 = v9;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLineCollectionViewListCell identifier](TwoLineCollectionViewListCell, "identifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v12, v8));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForOfflineRegionLocalSearchCompletion:](TwoLinesContentViewModelComposer, "cellModelForOfflineRegionLocalSearchCompletion:", v11));
  }
  else
  {
    v15 = objc_opt_class(SearchResult);
    if ((objc_opt_isKindOfClass(v9, v15) & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLineCollectionViewListCell identifier](TwoLineCollectionViewListCell, "identifier"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v16, v8));

      v17 = objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForOfflineSearchResult:](TwoLinesContentViewModelComposer, "cellModelForOfflineSearchResult:", v9));
    }
    else
    {
      v18 = objc_opt_class(HistoryEntryRecentsItem);
      if ((objc_opt_isKindOfClass(v9, v18) & 1) == 0)
      {
        v13 = 0;
        goto LABEL_9;
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLineCollectionViewListCell identifier](TwoLineCollectionViewListCell, "identifier"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v19, v8));

      v17 = objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForHistoryEntryRecentsItem:showAutocompleteClientSource:showPlaceContext:](TwoLinesContentViewModelComposer, "cellModelForHistoryEntryRecentsItem:showAutocompleteClientSource:showPlaceContext:", v9, 0, 0));
    }
    v14 = (void *)v17;
  }
  objc_msgSend(v13, "setViewModel:", v14);

LABEL_9:
  return v13;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteDataSource sectionForSectionIndex:](self, "sectionForSectionIndex:", objc_msgSend(v9, "section")));
  LODWORD(self) = objc_msgSend(v10, "isEqualToString:", UICollectionElementKindSectionHeader);

  if ((_DWORD)self)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "headerText"));
    if (objc_msgSend(v12, "length"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[SectionHeaderCollectionReusableView reuseIdentifier](SectionHeaderCollectionReusableView, "reuseIdentifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", UICollectionElementKindSectionHeader, v13, v9));

      objc_msgSend(v14, "setTitle:", v12);
      objc_msgSend(v14, "setShowsBottomHairline:", 0);
      objc_msgSend(v14, "setFirstNonEmptySection:", 1);
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unsigned __int8 isKindOfClass;
  uint64_t v10;
  char v11;
  uint64_t v12;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteDataSource diffableDataSource](self, "diffableDataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemIdentifierForIndexPath:", v5));

  v8 = objc_opt_class(MKLocalSearchCompletion);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    isKindOfClass = objc_msgSend(v7, "_supportsOfflineDownload");
LABEL_6:
    v11 = isKindOfClass;
    goto LABEL_7;
  }
  v10 = objc_opt_class(SearchResult);
  if ((objc_opt_isKindOfClass(v7, v10) & 1) == 0)
  {
    v12 = objc_opt_class(HistoryEntryRecentsItem);
    isKindOfClass = objc_opt_isKindOfClass(v7, v12);
    goto LABEL_6;
  }
  v11 = 1;
LABEL_7:

  return v11 & 1;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unsigned __int8 isKindOfClass;
  uint64_t v10;
  char v11;
  uint64_t v12;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteDataSource diffableDataSource](self, "diffableDataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "itemIdentifierForIndexPath:", v5));

  v8 = objc_opt_class(MKLocalSearchCompletion);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    isKindOfClass = objc_msgSend(v7, "_supportsOfflineDownload");
LABEL_6:
    v11 = isKindOfClass;
    goto LABEL_7;
  }
  v10 = objc_opt_class(SearchResult);
  if ((objc_opt_isKindOfClass(v7, v10) & 1) == 0)
  {
    v12 = objc_opt_class(HistoryEntryRecentsItem);
    isKindOfClass = objc_opt_isKindOfClass(v7, v12);
    goto LABEL_6;
  }
  v11 = 1;
LABEL_7:

  return v11 & 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  objc_msgSend(a3, "deselectItemAtIndexPath:animated:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapsManagementSearchAutocompleteDataSource diffableDataSource](self, "diffableDataSource"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemIdentifierForIndexPath:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  objc_msgSend(v8, "dataSource:itemTapped:", self, v9);

}

- (void)completerDidUpdateResults:(id)a3
{
  -[OfflineMapsManagementSearchAutocompleteDataSource _updateContentAnimated:](self, "_updateContentAnimated:", 0);
}

- (void)homeDataProvidingObjectDidUpdate:(id)a3
{
  -[OfflineMapsManagementSearchAutocompleteDataSource _updateContentAnimated:](self, "_updateContentAnimated:", 0);
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_diffableDataSource, a3);
}

- (SearchResult)currentLocationSearchResult
{
  return self->_currentLocationSearchResult;
}

- (void)setCurrentLocationSearchResult:(id)a3
{
  objc_storeStrong((id *)&self->_currentLocationSearchResult, a3);
}

- (RecentsDataFilter)recentsDataFilter
{
  return self->_recentsDataFilter;
}

- (void)setRecentsDataFilter:(id)a3
{
  objc_storeStrong((id *)&self->_recentsDataFilter, a3);
}

- (RecentsDataProvider)recentsDataProvider
{
  return self->_recentsDataProvider;
}

- (void)setRecentsDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_recentsDataProvider, a3);
}

- (MKLocalSearchCompleter)searchCompleter
{
  return self->_searchCompleter;
}

- (void)setSearchCompleter:(id)a3
{
  objc_storeStrong((id *)&self->_searchCompleter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchCompleter, 0);
  objc_storeStrong((id *)&self->_recentsDataProvider, 0);
  objc_storeStrong((id *)&self->_recentsDataFilter, 0);
  objc_storeStrong((id *)&self->_currentLocationSearchResult, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
