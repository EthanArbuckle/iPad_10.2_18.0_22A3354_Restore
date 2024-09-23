@implementation RouteNoQueryDataSource

- (RouteNoQueryDataSource)initWithTableView:(id)a3 filterPredicate:(id)a4
{
  id v6;
  id v7;
  RouteNoQueryDataSource *v8;
  RouteNoQueryDataSource *v9;
  RecentsDataFilter *v10;
  RecentsDataFilter *recentsDataFilter;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];

  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)RouteNoQueryDataSource;
  v8 = -[DataSource initWithTableView:updateLocation:](&v26, "initWithTableView:updateLocation:", v6, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_filterPredicate, a4);
    v10 = -[RecentsDataFilter initWithSearchMode:filterPredicate:]([RecentsDataFilter alloc], "initWithSearchMode:filterPredicate:", 2, v7);
    recentsDataFilter = v9->_recentsDataFilter;
    v9->_recentsDataFilter = v10;

    -[RouteNoQueryDataSource _createDataProviders](v9, "_createDataProviders");
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RouteNoQueryDataSource _allDataProviders](v9, "_allDataProviders", 0));
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v23;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v16), "observers"));
          objc_msgSend(v17, "registerObserver:", v9);

          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v14);
    }

    v18 = objc_opt_class(TwoLinesTableViewCell);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesTableViewCell identifier](TwoLinesTableViewCell, "identifier"));
    objc_msgSend(v6, "registerClass:forCellReuseIdentifier:", v18, v19);

    if (sub_1002A8AA0(v6) == 5)
    {
      v20 = objc_msgSend(objc_alloc((Class)UIHoverGestureRecognizer), "initWithTarget:action:", v9, "_hoverGestureRecognizerStateDidChange:");
      objc_msgSend(v6, "addGestureRecognizer:", v20);

    }
  }

  return v9;
}

- (void)updateTableViewHeader:(BOOL)a3
{
  void *v4;
  SectionHeaderTableViewHeaderFooterView *v5;
  void *v6;
  double Width;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  CGRect v15;
  CGRect v16;

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("[Offline Route Planning] Recents"), CFSTR("localized string not found"), 0));

    v5 = -[SectionHeaderTableViewHeaderFooterView initWithTitle:isFirstNonEmptySection:]([SectionHeaderTableViewHeaderFooterView alloc], "initWithTitle:isFirstNonEmptySection:", v14, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
    objc_msgSend(v6, "frame");
    Width = CGRectGetWidth(v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "traitCollection"));
    +[SectionHeaderTableViewHeaderFooterView heightWhenFirstNonEmptySection:title:actionTitle:availableWidth:traitCollection:](SectionHeaderTableViewHeaderFooterView, "heightWhenFirstNonEmptySection:title:actionTitle:availableWidth:traitCollection:", 1, v14, 0, v9, Width);
    v11 = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
    objc_msgSend(v12, "frame");
    -[SectionHeaderTableViewHeaderFooterView setBounds:](v5, "setBounds:", 0.0, 0.0, CGRectGetWidth(v16), v11);

    -[SectionHeaderTableViewHeaderFooterView layoutIfNeeded](v5, "layoutIfNeeded");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
    objc_msgSend(v13, "setTableHeaderView:", v5);

  }
  else
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
    objc_msgSend(v14, "setTableHeaderView:", 0);
  }

}

- (void)_hoverGestureRecognizerStateDidChange:(id)a3
{
  void *v4;
  RouteNoQueryDataSource *v5;
  unsigned int v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSIndexPath *v16;
  NSIndexPath *v17;
  NSIndexPath *v18;
  char v19;
  NSIndexPath *lastSelectedIndexPath;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  CGPoint v27;
  CGRect v28;

  v26 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v5 = (RouteNoQueryDataSource *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataSource"));
  if (v5 == self)
  {
    v6 = objc_msgSend(v26, "_maps_isHovering");

    if (!v6)
      goto LABEL_9;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
    objc_msgSend(v26, "locationInView:", v7);
    v9 = v8;
    v11 = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "indexPathForRowAtPoint:", v9, v11));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "cellForRowAtIndexPath:", v13));

    if (v15 && (objc_msgSend(v15, "frame"), v27.x = v9, v27.y = v11, CGRectContainsPoint(v28, v27)))
    {
      if (v13)
      {
        if ((objc_msgSend(v13, "isEqual:", self->_lastSelectedIndexPath) & 1) != 0)
        {
          v16 = 0;
LABEL_15:
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
          objc_msgSend(v21, "selectRowAtIndexPath:animated:scrollPosition:", v13, 0, 0);

          objc_storeStrong((id *)&self->_lastSelectedIndexPath, v13);
          if (v15)
          {
            v22 = objc_opt_class(SearchLoadingTableViewCell);
            if ((objc_opt_isKindOfClass(v15, v22) & 1) == 0)
              objc_msgSend(v15, "canBecomeFirstResponder");
          }
          objc_msgSend(v15, "becomeFirstResponder");
LABEL_19:

          if (v16)
            goto LABEL_20;
          goto LABEL_21;
        }
        v19 = 0;
LABEL_14:
        v16 = self->_lastSelectedIndexPath;
        lastSelectedIndexPath = self->_lastSelectedIndexPath;
        self->_lastSelectedIndexPath = 0;

        if ((v19 & 1) != 0)
          goto LABEL_19;
        goto LABEL_15;
      }
    }
    else
    {

      v13 = 0;
    }
    v19 = 1;
    goto LABEL_14;
  }

LABEL_9:
  if (objc_msgSend(v26, "state") == (id)3)
  {
    v17 = self->_lastSelectedIndexPath;
    if (v17)
    {
      v16 = v17;
      v18 = self->_lastSelectedIndexPath;
      self->_lastSelectedIndexPath = 0;

LABEL_20:
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "cellForRowAtIndexPath:", v16));

      objc_msgSend(v24, "resignFirstResponder");
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
      objc_msgSend(v25, "deselectRowAtIndexPath:animated:", v16, 0);

    }
  }
LABEL_21:

}

- (void)_createDataProviders
{
  MarkedLocationDataProvider *v3;
  MarkedLocationDataProvider *markedLocationDataProvider;
  RecentsDataProvider *v5;
  RecentsDataProvider *recentsDataProvider;

  v3 = objc_alloc_init(MarkedLocationDataProvider);
  markedLocationDataProvider = self->_markedLocationDataProvider;
  self->_markedLocationDataProvider = v3;

  v5 = objc_alloc_init(RecentsDataProvider);
  recentsDataProvider = self->_recentsDataProvider;
  self->_recentsDataProvider = v5;

}

- (id)_allDataProviders
{
  RecentsDataProvider *recentsDataProvider;
  _QWORD v4[2];

  recentsDataProvider = self->_recentsDataProvider;
  v4[0] = self->_markedLocationDataProvider;
  v4[1] = recentsDataProvider;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v4, 2));
}

- (void)_buildContents
{
  void *v3;
  void *v4;
  NSArray *v5;
  NSArray *contents;
  NSArray *v7;
  NSArray *v8;

  if (-[DataSource active](self, "active"))
  {
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    if (self->_userLocationSearchResult)
      -[NSArray addObject:](v8, "addObject:");
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MarkedLocationDataProvider markedLocation](self->_markedLocationDataProvider, "markedLocation"));
    if (v3)
      -[NSArray addObject:](v8, "addObject:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RecentsDataProvider recents](self->_recentsDataProvider, "recents"));
    -[NSArray addObjectsFromArray:](v8, "addObjectsFromArray:", v4);

    v5 = (NSArray *)objc_claimAutoreleasedReturnValue(-[RecentsDataFilter filteredRecents:excludingDuplicatesOfEntries:](self->_recentsDataFilter, "filteredRecents:excludingDuplicatesOfEntries:", v8, &__NSArray0__struct));
    contents = self->_contents;
    self->_contents = v5;

    v7 = v8;
  }
  else
  {
    v7 = self->_contents;
    self->_contents = (NSArray *)&__NSArray0__struct;
  }

}

- (void)_updateContents
{
  id v3;

  -[RouteNoQueryDataSource _buildContents](self, "_buildContents");
  -[RouteNoQueryDataSource _addAnalyticsInfo](self, "_addAnalyticsInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  objc_msgSend(v3, "dataSourceUpdated:", self);

}

- (void)setActive:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];

  v3 = a3;
  if (-[DataSource active](self, "active") != a3)
  {
    v15.receiver = self;
    v15.super_class = (Class)RouteNoQueryDataSource;
    -[DataSource setActive:](&v15, "setActive:", v3);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteNoQueryDataSource _allDataProviders](self, "_allDataProviders"));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), "setActive:", v3);
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v7);
    }

    -[RouteNoQueryDataSource _updateContents](self, "_updateContents");
    if (!v3)
    {
      LOBYTE(v10) = 0;
      -[DataSource sendAnalyticsForDataAtIndexPath:object:childPlaceIndexPath:childPlaceObject:action:eventValue:populateSearchTapEvent:](self, "sendAnalyticsForDataAtIndexPath:object:childPlaceIndexPath:childPlaceObject:action:eventValue:populateSearchTapEvent:", 0, 0, 0, 0, 0, 0, v10);
    }
  }
}

- (void)setUserLocationSearchResult:(id)a3
{
  UserLocationSearchResult *v5;
  UserLocationSearchResult *v6;

  v5 = (UserLocationSearchResult *)a3;
  if (self->_userLocationSearchResult != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_userLocationSearchResult, a3);
    -[RouteNoQueryDataSource _updateContents](self, "_updateContents");
    v5 = v6;
  }

}

- (id)objectAtIndexPath:(id)a3
{
  id v4;
  void *v5;

  v4 = objc_msgSend(a3, "row");
  if (v4 >= (id)-[NSArray count](self->_contents, "count"))
    v5 = 0;
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_contents, "objectAtIndexedSubscript:", v4));
  return v5;
}

- (id)analyticsContext
{
  return self->_analyticsContext;
}

- (void)_addAnalyticsInfo
{
  AutocompleteContext *v3;
  AutocompleteContext *analyticsContext;
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = -[AutocompleteContext initWithQueryString:]([AutocompleteContext alloc], "initWithQueryString:", &stru_1011EB268);
  analyticsContext = self->_analyticsContext;
  self->_analyticsContext = v3;

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_contents;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[AutocompleteMatchInfo matchInfoWithType:](AutocompleteMatchInfo, "matchInfoWithType:", 0, (_QWORD)v13));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[RouteNoQueryDataSource analyticsContext](self, "analyticsContext"));
        objc_msgSend(v12, "setMatchInfo:forObject:", v11, v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (void)_sendNoTypingACAnalyticsForSelectedAtIndexPath:(id)a3
{
  void *v4;
  NSArray *contents;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource objectsForAnalytics](self, "objectsForAnalytics"));
  if (v4)
  {
    contents = self->_contents;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteNoQueryDataSource analyticsContext](self, "analyticsContext"));
    v7 = -[RouteNoQueryDataSource newTraits](self, "newTraits");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MapsAnalyticsHelper acSuggestionEntriesFromAutoCompleteObjects:context:mapsSuggestionsInsights:skipReportASearchItems:traits:](MapsAnalyticsHelper, "acSuggestionEntriesFromAutoCompleteObjects:context:mapsSuggestionsInsights:skipReportASearchItems:traits:", contents, v6, 0, 1, v7));

  }
  else
  {
    v8 = 0;
  }
  if (v10)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v10, "row")));
    +[GEOAPPortal captureClientACSuggestionWithQuery:queryTokens:entries:selectedIndex:selectedSectionIndex:withinSectionSelectedIndex:isRetainedQuery:isRerankerTriggered:shouldDifferentiateClientAndServerResults:](GEOAPPortal, "captureClientACSuggestionWithQuery:queryTokens:entries:selectedIndex:selectedSectionIndex:withinSectionSelectedIndex:isRetainedQuery:isRerankerTriggered:shouldDifferentiateClientAndServerResults:", &stru_1011EB268, 0, v8, v9, 0, 0, 0, 0, 0);

  }
  else
  {
    +[GEOAPPortal captureClientACSuggestionWithQuery:queryTokens:entries:selectedIndex:selectedSectionIndex:withinSectionSelectedIndex:isRetainedQuery:isRerankerTriggered:shouldDifferentiateClientAndServerResults:](GEOAPPortal, "captureClientACSuggestionWithQuery:queryTokens:entries:selectedIndex:selectedSectionIndex:withinSectionSelectedIndex:isRetainedQuery:isRerankerTriggered:shouldDifferentiateClientAndServerResults:", &stru_1011EB268, 0, v8, 0, 0, 0, 0, 0, 0);
  }

}

- (int)targetForDragAnalytics
{
  return 8;
}

- (id)newTraits
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  if (objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___RouteNoQueryDataSourceDelegate))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = objc_msgSend(v4, "newTraits");
  if (v5)
    v6 = v5;
  else
    v6 = objc_alloc_init((Class)GEOMapServiceTraits);
  v7 = v6;

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_contents, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteNoQueryDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v7));
  v9 = objc_opt_class(HistoryEntryRecentsItem);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesTableViewCell identifier](TwoLinesTableViewCell, "identifier"));
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v10, v7));

    v12 = objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForHistoryEntryRecentsItem:showAutocompleteClientSource:showPlaceContext:](TwoLinesContentViewModelComposer, "cellModelForHistoryEntryRecentsItem:showAutocompleteClientSource:showPlaceContext:", v8, 0, 0));
LABEL_5:
    v15 = (void *)v12;
    objc_msgSend(v11, "setViewModel:", v12);

    goto LABEL_6;
  }
  v13 = objc_opt_class(CRRecentContact);
  if ((objc_opt_isKindOfClass(v8, v13) & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesTableViewCell identifier](TwoLinesTableViewCell, "identifier"));
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v14, v7));

    v12 = objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForRecentContact:](TwoLinesContentViewModelComposer, "cellModelForRecentContact:", v8));
    goto LABEL_5;
  }
  v17 = objc_opt_class(SearchResult);
  if ((objc_opt_isKindOfClass(v8, v17) & 1) != 0)
  {
    v18 = v8;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesTableViewCell identifier](TwoLinesTableViewCell, "identifier"));
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v19, v7));

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForSearchResult:](TwoLinesContentViewModelComposer, "cellModelForSearchResult:", v18));
    objc_msgSend(v11, "setViewModel:", v20);

  }
  else
  {
    v11 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, 0);
  }
LABEL_6:

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[RouteNoQueryDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v6));
  -[DataSource sendAnalyticsForDataAtIndexPath:object:action:](self, "sendAnalyticsForDataAtIndexPath:object:action:", v6, v9, 2007);
  -[RouteNoQueryDataSource _sendNoTypingACAnalyticsForSelectedAtIndexPath:](self, "_sendNoTypingACAnalyticsForSelectedAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  objc_msgSend(v8, "dataSource:itemTapped:", self, v9);

  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  double result;

  +[TwoLinesTableViewCell cellHeight](TwoLinesTableViewCell, "cellHeight", a3, a4);
  return result;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  double result;

  +[TwoLinesTableViewCell estimatedCellHeight](TwoLinesTableViewCell, "estimatedCellHeight", a3, a4);
  return result;
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  NSIndexPath *lastSelectedIndexPath;
  id v8;
  id v9;
  void *v10;
  NSIndexPath *v11;
  NSIndexPath *v12;

  lastSelectedIndexPath = self->_lastSelectedIndexPath;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "deselectRowAtIndexPath:animated:", lastSelectedIndexPath, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nextFocusedIndexPath"));
  objc_msgSend(v9, "selectRowAtIndexPath:animated:scrollPosition:", v10, 0, 0);

  v11 = (NSIndexPath *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nextFocusedIndexPath"));
  v12 = self->_lastSelectedIndexPath;
  self->_lastSelectedIndexPath = v11;

}

- (NSPredicate)filterPredicate
{
  return self->_filterPredicate;
}

- (UserLocationSearchResult)userLocationSearchResult
{
  return self->_userLocationSearchResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userLocationSearchResult, 0);
  objc_storeStrong((id *)&self->_filterPredicate, 0);
  objc_storeStrong((id *)&self->_lastSelectedIndexPath, 0);
  objc_storeStrong((id *)&self->_analyticsContext, 0);
  objc_storeStrong((id *)&self->_contents, 0);
  objc_storeStrong((id *)&self->_recentsDataFilter, 0);
  objc_storeStrong((id *)&self->_recentsDataProvider, 0);
  objc_storeStrong((id *)&self->_markedLocationDataProvider, 0);
}

@end
