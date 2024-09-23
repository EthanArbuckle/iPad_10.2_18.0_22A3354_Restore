@implementation SearchDataSource

- (SearchDataSource)initWithTableView:(id)a3
{
  id v4;
  SearchDataSource *v5;
  AutocompleteAnalyticsManager *v6;
  AutocompleteAnalyticsManager *analyticsManager;
  id v8;
  SearchDataProvider *v9;
  SearchDataProvider *searchDataProvider;
  NSMutableDictionary *v11;
  NSMutableDictionary *placeSummaryTemplateViewModels;
  _TtC4Maps28PlaceSummaryAsyncDataManager *v13;
  _TtC4Maps28PlaceSummaryAsyncDataManager *placeSummaryAsyncDataManager;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SearchDataSource;
  v5 = -[DataSource initWithTableView:updateLocation:](&v23, "initWithTableView:updateLocation:", v4, 1);
  if (v5)
  {
    v6 = objc_alloc_init(AutocompleteAnalyticsManager);
    analyticsManager = v5->_analyticsManager;
    v5->_analyticsManager = v6;

    v8 = objc_storeWeak((id *)&v5->_contentTableView, v4);
    v5->_originalHeaderAndFooterViewsFloat = objc_msgSend(v4, "_headerAndFooterViewsFloat");

    v9 = objc_alloc_init(SearchDataProvider);
    searchDataProvider = v5->_searchDataProvider;
    v5->_searchDataProvider = v9;

    -[SearchDataProvider setDelegate:](v5->_searchDataProvider, "setDelegate:", v5);
    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    placeSummaryTemplateViewModels = v5->_placeSummaryTemplateViewModels;
    v5->_placeSummaryTemplateViewModels = v11;

    v13 = objc_alloc_init(_TtC4Maps28PlaceSummaryAsyncDataManager);
    placeSummaryAsyncDataManager = v5->_placeSummaryAsyncDataManager;
    v5->_placeSummaryAsyncDataManager = v13;

    v15 = objc_opt_class(SearchNoResultsTableViewCell);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SearchNoResultsTableViewCell identifier](SearchNoResultsTableViewCell, "identifier"));
    objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v15, v16);

    v17 = objc_opt_class(SearchLoadingTableViewCell);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[SearchLoadingTableViewCell identifier](SearchLoadingTableViewCell, "identifier"));
    objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v17, v18);

    v19 = objc_opt_class(_TtC4Maps25PlaceSummaryTableViewCell);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[PlaceSummaryTableViewCell reuseIdentifier](_TtC4Maps25PlaceSummaryTableViewCell, "reuseIdentifier"));
    objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v19, v20);

    if (sub_1002A8AA0(v4) == 5)
    {
      v21 = objc_msgSend(objc_alloc((Class)UIHoverGestureRecognizer), "initWithTarget:action:", v5, "_hoverGestureRecognizerStateDidChange:");
      objc_msgSend(v4, "addGestureRecognizer:", v21);
      objc_msgSend(v4, "setContentInset:", 8.5, 0.0, 8.5, 0.0);

    }
  }

  return v5;
}

- (void)_hoverGestureRecognizerStateDidChange:(id)a3
{
  void *v4;
  SearchDataSource *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSIndexPath *v17;
  NSIndexPath *v18;
  NSIndexPath *v19;
  char v20;
  NSIndexPath *lastSelectedIndexPath;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  CGPoint v28;
  CGRect v29;

  v27 = a3;
  if (-[SearchDataSource shouldShowNoResultsCell](self, "shouldShowNoResultsCell")
    || -[SearchDataSource shouldShowLoadingIndicator](self, "shouldShowLoadingIndicator"))
  {
    goto LABEL_23;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v5 = (SearchDataSource *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataSource"));
  if (v5 == self)
  {
    v7 = objc_msgSend(v27, "_maps_isHovering");

    v6 = v27;
    if (!v7)
      goto LABEL_11;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
    objc_msgSend(v27, "locationInView:", v8);
    v10 = v9;
    v12 = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "indexPathForRowAtPoint:", v10, v12));

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "cellForRowAtIndexPath:", v14));

    if (v16 && (objc_msgSend(v16, "frame"), v28.x = v10, v28.y = v12, CGRectContainsPoint(v29, v28)))
    {
      if (v14)
      {
        if ((objc_msgSend(v14, "isEqual:", self->_lastSelectedIndexPath) & 1) != 0)
        {
          v17 = 0;
LABEL_17:
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
          objc_msgSend(v22, "selectRowAtIndexPath:animated:scrollPosition:", v14, 0, 0);

          objc_storeStrong((id *)&self->_lastSelectedIndexPath, v14);
          if (v16)
          {
            v23 = objc_opt_class(SearchLoadingTableViewCell);
            if ((objc_opt_isKindOfClass(v16, v23) & 1) == 0)
              objc_msgSend(v16, "canBecomeFirstResponder");
          }
          objc_msgSend(v16, "becomeFirstResponder");
LABEL_21:

          if (v17)
            goto LABEL_22;
          goto LABEL_23;
        }
        v20 = 0;
LABEL_16:
        v17 = self->_lastSelectedIndexPath;
        lastSelectedIndexPath = self->_lastSelectedIndexPath;
        self->_lastSelectedIndexPath = 0;

        if ((v20 & 1) != 0)
          goto LABEL_21;
        goto LABEL_17;
      }
    }
    else
    {

      v14 = 0;
    }
    v20 = 1;
    goto LABEL_16;
  }

  v6 = v27;
LABEL_11:
  if (objc_msgSend(v6, "state") == (id)3)
  {
    v18 = self->_lastSelectedIndexPath;
    if (v18)
    {
      v17 = v18;
      v19 = self->_lastSelectedIndexPath;
      self->_lastSelectedIndexPath = 0;

LABEL_22:
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "cellForRowAtIndexPath:", v17));

      objc_msgSend(v25, "resignFirstResponder");
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
      objc_msgSend(v26, "deselectRowAtIndexPath:animated:", v17, 0);

    }
  }
LABEL_23:

}

- (void)invalidateDataForFilterChange
{
  id v3;

  -[SearchDataSource _invalidateFilteredContent](self, "_invalidateFilteredContent");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  objc_msgSend(v3, "dataSourceUpdated:", self);

}

- (BOOL)shouldReloadOnHeightChange
{
  if (-[SearchDataSource shouldShowNoResultsCell](self, "shouldShowNoResultsCell"))
    return 1;
  else
    return -[SearchDataSource shouldShowLoadingIndicator](self, "shouldShowLoadingIndicator");
}

- (unsigned)searchMode
{
  return -[SearchDataProvider searchMode](self->_searchDataProvider, "searchMode");
}

- (void)setSearchMode:(unsigned int)a3
{
  -[SearchDataProvider setSearchMode:](self->_searchDataProvider, "setSearchMode:", *(_QWORD *)&a3);
}

- (UserLocationSearchResult)userLocationSearchResult
{
  return -[SearchDataProvider userLocationSearchResult](self->_searchDataProvider, "userLocationSearchResult");
}

- (void)setUserLocationSearchResult:(id)a3
{
  -[SearchDataProvider setUserLocationSearchResult:](self->_searchDataProvider, "setUserLocationSearchResult:", a3);
}

- (GEORetainedSearchMetadata)retainedSearchMetadata
{
  return -[SearchDataProvider retainedSearchMetadata](self->_searchDataProvider, "retainedSearchMetadata");
}

- (void)setRetainedSearchMetadata:(id)a3
{
  -[SearchDataProvider setRetainedSearchMetadata:](self->_searchDataProvider, "setRetainedSearchMetadata:", a3);
}

- (PersonalizedItemManager)mapPersonalizedItems
{
  return -[SearchDataProvider mapPersonalizedItems](self->_searchDataProvider, "mapPersonalizedItems");
}

- (void)setSearchCompletionFilterType:(int64_t)a3
{
  -[SearchDataProvider setSearchCompletionFilterType:](self->_searchDataProvider, "setSearchCompletionFilterType:", a3);
}

- (void)setMapPersonalizedItems:(id)a3
{
  -[SearchDataProvider setMapPersonalizedItems:](self->_searchDataProvider, "setMapPersonalizedItems:", a3);
}

- (void)setResultTypes:(unint64_t)a3
{
  if (self->_resultTypes != a3)
  {
    self->_resultTypes = a3;
    -[SearchDataProvider setResultTypes:](self->_searchDataProvider, "setResultTypes:");
  }
}

- (BOOL)hasResults
{
  return -[SearchDataProvider hasResults](self->_searchDataProvider, "hasResults");
}

- (void)setActive:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  _BOOL8 originalHeaderAndFooterViewsFloat;
  id v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SearchDataSource;
  -[DataSource setActive:](&v8, "setActive:");
  if (v3)
  {
    self->_isLoadingData = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_contentTableView);
    objc_msgSend(WeakRetained, "_setHeaderAndFooterViewsFloat:", 0);

  }
  else
  {
    originalHeaderAndFooterViewsFloat = self->_originalHeaderAndFooterViewsFloat;
    v7 = objc_loadWeakRetained((id *)&self->_contentTableView);
    objc_msgSend(v7, "_setHeaderAndFooterViewsFloat:", originalHeaderAndFooterViewsFloat);

    -[SearchDataSource reset](self, "reset");
  }
  -[SearchDataProvider setActive:](self->_searchDataProvider, "setActive:", v3);
}

- (void)searchDataProviderDidUpdate:(id)a3
{
  id WeakRetained;
  uint64_t v5;
  id v6;
  id v7;

  if (-[DataSource active](self, "active", a3))
  {
    self->_isLoadingData = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_contentTableView);
    v5 = sub_1002A8AA0(WeakRetained);

    if (v5 != 5)
    {
      v6 = objc_loadWeakRetained((id *)&self->_contentTableView);
      objc_msgSend(v6, "setContentOffset:", CGPointZero.x, CGPointZero.y);

    }
  }
  -[NSMutableDictionary removeAllObjects](self->_placeSummaryTemplateViewModels, "removeAllObjects");
  -[SearchDataSource _invalidateFilteredContent](self, "_invalidateFilteredContent");
  v7 = (id)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  objc_msgSend(v7, "dataSourceUpdated:", self);

}

- (void)clearAutocompleteResults
{
  -[SearchDataProvider clearAutocompleteResults](self->_searchDataProvider, "clearAutocompleteResults");
}

- (void)setInputText:(id)a3 traits:(id)a4 source:(int)a5
{
  -[SearchDataSource setInputText:tappedQuerySuggestionCompletion:isRetainQuery:traits:source:](self, "setInputText:tappedQuerySuggestionCompletion:isRetainQuery:traits:source:", a3, 0, 0, a4, *(_QWORD *)&a5);
}

- (void)setInputText:(id)a3 tappedQuerySuggestionCompletion:(id)a4 isRetainQuery:(BOOL)a5 traits:(id)a6 source:(int)a7
{
  uint64_t v7;
  _BOOL8 v9;
  id v13;
  id v14;
  unsigned __int8 v15;
  void *v16;
  id v17;
  id WeakRetained;
  id v19;

  v7 = *(_QWORD *)&a7;
  v9 = a5;
  v19 = a3;
  v13 = a4;
  v14 = a6;
  v15 = objc_msgSend(v19, "isEqualToString:", self->_searchText);
  if (v13 || (v15 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_searchText, a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSString _maps_stringByTrimmingLeadingWhitespace](self->_searchText, "_maps_stringByTrimmingLeadingWhitespace"));
    v17 = objc_msgSend(v16, "length");

    if (v17 && -[SearchDataSource shouldShowLoadingIndicator](self, "shouldShowLoadingIndicator"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_contentTableView);
      objc_msgSend(WeakRetained, "reloadData");

    }
    -[SearchDataSource configureAutocompleteOriginationTypeFromSource:inTraits:](self, "configureAutocompleteOriginationTypeFromSource:inTraits:", v7, v14);
    -[SearchDataProvider setInputText:tappedQuerySuggestionCompletion:isRetainQuery:traits:source:](self->_searchDataProvider, "setInputText:tappedQuerySuggestionCompletion:isRetainQuery:traits:source:", v19, v13, v9, v14, v7);
  }

}

- (void)configureAutocompleteOriginationTypeFromSource:(int)a3 inTraits:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a4;
  v7 = v5;
  if ((a3 - 13) > 3)
  {
    if (a3 == 21)
    {
      v6 = 3;
    }
    else if (a3 == 11)
    {
      if (objc_msgSend(v5, "navigating"))
        v6 = 2;
      else
        v6 = 0;
    }
    else
    {
      v6 = 0;
    }
  }
  else if (objc_msgSend(v5, "navigating"))
  {
    v6 = 2;
  }
  else
  {
    v6 = 1;
  }
  objc_msgSend(v7, "setAutocompleteOriginationType:", v6);

}

- (void)reset
{
  uint64_t v3;

  if (-[SearchDataSource searchAlongRoute](self, "searchAlongRoute"))
    v3 = 14;
  else
    v3 = 11;
  -[SearchDataSource setInputText:traits:source:](self, "setInputText:traits:source:", 0, 0, v3);
  -[SearchDataSource _invalidateFilteredContent](self, "_invalidateFilteredContent");
  -[SearchDataProvider reset](self->_searchDataProvider, "reset");
  -[NSMutableDictionary removeAllObjects](self->_placeSummaryTemplateViewModels, "removeAllObjects");
}

- (id)objectAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (!objc_msgSend(v4, "row")
    && (-[SearchDataSource shouldShowNoResultsCell](self, "shouldShowNoResultsCell")
     || -[SearchDataSource shouldShowLoadingIndicator](self, "shouldShowLoadingIndicator")))
  {
    v10 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource sectionAtIndex:](self, "sectionAtIndex:", objc_msgSend(v4, "section")));
    if (((unint64_t)objc_msgSend(v4, "row") & 0x8000000000000000) != 0
      || (v6 = objc_msgSend(v4, "row"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "items")),
          v8 = objc_msgSend(v7, "count"),
          v7,
          v6 >= v8))
    {
      v10 = 0;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "items"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));

    }
  }

  return v10;
}

- (id)autocompleteObjectAtIndexPath:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource objectAtIndexPath:](self, "objectAtIndexPath:", a3));
  v4 = objc_opt_class(PersonalizedCompoundItem);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "autocompleteObject"));

    v3 = (void *)v5;
  }
  return v3;
}

- (id)sectionAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;

  if (-[SearchDataSource shouldShowNoResultsCell](self, "shouldShowNoResultsCell")
    || -[SearchDataSource shouldShowLoadingIndicator](self, "shouldShowLoadingIndicator"))
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource _contentFilteredIfNeeded](self, "_contentFilteredIfNeeded"));
    if ((unint64_t)objc_msgSend(v6, "count") <= a3)
      v5 = 0;
    else
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", a3));

  }
  return v5;
}

- (BOOL)shouldShowNoResultsCell
{
  BOOL v3;
  void *v4;
  void *v5;

  if (-[SearchDataSource hasResults](self, "hasResults"))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource searchDataProvider](self, "searchDataProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "autocompleteContext"));
  v3 = v5 != 0;

  return v3;
}

- (BOOL)shouldShowLoadingIndicator
{
  id WeakRetained;
  BOOL v4;

  if (-[SearchDataSource hasResults](self, "hasResults") || !self->_isLoadingData)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_contentTableView);
  v4 = sub_1002A8AA0(WeakRetained) == 5;

  return v4;
}

- (double)rowHeight
{
  double result;
  objc_super v4;

  if (-[SearchDataSource hasResults](self, "hasResults")
    || -[SearchDataSource shouldShowNoResultsCell](self, "shouldShowNoResultsCell")
    || -[SearchDataSource shouldShowLoadingIndicator](self, "shouldShowLoadingIndicator"))
  {
    v4.receiver = self;
    v4.super_class = (Class)SearchDataSource;
    -[DataSource rowHeight](&v4, "rowHeight");
  }
  else
  {
    +[TwoLinesTableViewCell cellHeight](TwoLinesTableViewCell, "cellHeight");
  }
  return result;
}

- (void)didTapOnAccessoryView:(id)a3 withType:(int64_t)a4 object:(id)a5
{
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v8 = a5;
  switch(a4)
  {
    case 4:
      goto LABEL_4;
    case 2:
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "indexPathForCell:", v23));

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource flattenedIndexPath:](self, "flattenedIndexPath:", v12));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource flattenedArray](self, "flattenedArray"));
      -[SearchDataSource _sendAnalyticsForDataSelectedAtIndexPath:fromContent:childPlaceIndexPath:childItem:resultRefinement:containmentParent:tappableEntryIdentifier:tappedAccessoryViewType:](self, "_sendAnalyticsForDataSelectedAtIndexPath:fromContent:childPlaceIndexPath:childItem:resultRefinement:containmentParent:tappableEntryIdentifier:tappedAccessoryViewType:", v17, v18, 0, 0, 0, 0, 0, 2);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataProvider sections](self->_searchDataProvider, "sections"));
      v20 = objc_claimAutoreleasedReturnValue(-[SearchDataProvider autocompleteContext](self->_searchDataProvider, "autocompleteContext"));
      -[SearchDataSource _sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:indexPathInSection:sections:context:](self, "_sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:indexPathInSection:sections:context:", v17, v12, v19, v20);

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
      LOBYTE(v20) = objc_opt_respondsToSelector(v21, "searchDataSource:replaceQueryWithItem:");

      if ((v20 & 1) != 0)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
        objc_msgSend(v22, "searchDataSource:replaceQueryWithItem:", self, v8);

      }
      goto LABEL_10;
    case 1:
LABEL_4:
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
      v10 = objc_opt_respondsToSelector(v9, "searchDataSource:addItem:");

      if ((v10 & 1) != 0)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
        objc_msgSend(v11, "searchDataSource:addItem:", self, v8);

      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
      objc_msgSend(v12, "setBounds:", 0.0, 0.0, 30.0, 30.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("checkmark")));
      objc_msgSend(v12, "setImage:forState:", v13, 0);

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 20.0));
      objc_msgSend(v12, "setPreferredSymbolConfiguration:forImageInState:", v14, 0);

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      objc_msgSend(v12, "setTintColor:", v15);

      objc_msgSend(v12, "setAccessibilityIdentifier:", CFSTR("AccessoryCheckmarkButton"));
      objc_msgSend(v23, "setAccessoryView:", v12);
LABEL_10:

      break;
  }

}

- (void)didTapOnPlaceContextWithViewModel:(id)a3 parentView:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  AutocompleteAnalyticsManager *analyticsManager;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *i;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_contentTableView);
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "indexPathForCell:", v7));

  v42 = (void *)v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource flattenedIndexPath:](self, "flattenedIndexPath:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource flattenedArray](self, "flattenedArray"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MapsAnalyticsHelper analyticsResultsInfoArrayFromAutoCompleteResultsArray:selectedIndex:](MapsAnalyticsHelper, "analyticsResultsInfoArrayFromAutoCompleteResultsArray:selectedIndex:", v11, objc_msgSend(v10, "row")));

  +[MapsAnalyticStateProvider updateSuggestionSearchInformation:searchText:searchIndex:searchfieldType:suggestionsAcSequenceNumber:](MapsAnalyticStateProvider, "updateSuggestionSearchInformation:searchText:searchIndex:searchfieldType:suggestionsAcSequenceNumber:", v12, self->_searchText, objc_msgSend(v10, "row"), 1, -[SearchDataProvider searchRequestAnalyticsSequenceNumber](self->_searchDataProvider, "searchRequestAnalyticsSequenceNumber"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  v14 = objc_opt_respondsToSelector(v13, "searchDataSource:didTapOnPlaceContextWithViewModel:");

  if ((v14 & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    objc_msgSend(v15, "searchDataSource:didTapOnPlaceContextWithViewModel:", self, v6);

  }
  if (objc_msgSend(v6, "type") == (id)1)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "placeCollections"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "collectionIdentifier"));
    v19 = objc_msgSend(v18, "muid");

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
    v21 = v7;
    v22 = objc_msgSend(v20, "collectionIsSaved:", v17);

    analyticsManager = self->_analyticsManager;
    v24 = objc_msgSend(v10, "row");
    v25 = v22;
    v7 = v21;
    -[AutocompleteAnalyticsManager placeContextSingleCollectionTappedWithMuid:isCurrentlySaved:verticalIndex:](analyticsManager, "placeContextSingleCollectionTappedWithMuid:isCurrentlySaved:verticalIndex:", v19, v25, v24);

    v26 = (void *)v9;
  }
  else if (objc_msgSend(v6, "type") == (id)2)
  {
    v40 = v7;
    v27 = objc_alloc((Class)NSMutableArray);
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "placeCollections"));
    v29 = objc_msgSend(v27, "initWithCapacity:", objc_msgSend(v28, "count"));

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = v6;
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "placeCollections"));
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v32; i = (char *)i + 1)
        {
          if (*(_QWORD *)v44 != v33)
            objc_enumerationMutation(v30);
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i), "collectionIdentifier"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v35, "muid")));
          objc_msgSend(v29, "addObject:", v36);

        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v32);
    }

    -[AutocompleteAnalyticsManager placeContextMultipleCollectionsTappedWithMuids:verticalIndex:](self->_analyticsManager, "placeContextMultipleCollectionsTappedWithMuids:verticalIndex:", v29, objc_msgSend(v10, "row"));
    v7 = v40;
    v6 = v41;
    v26 = v42;
  }
  else
  {
    v26 = (void *)v9;
    if (objc_msgSend(v6, "type") == (id)3)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      objc_msgSend(v37, "captureUserAction:onTarget:eventValue:", 73, 11, 0);

      v10 = 0;
      v26 = 0;
    }
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataProvider sections](self->_searchDataProvider, "sections"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataProvider autocompleteContext](self->_searchDataProvider, "autocompleteContext"));
  -[SearchDataSource _sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:indexPathInSection:sections:context:](self, "_sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:indexPathInSection:sections:context:", v10, v26, v38, v39);

}

- (id)placeSummaryTemplateForObject:(id)a3 autocompleteClientSourceType:(int64_t)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  double Width;
  _TtC4Maps29PlaceSummaryTextHighlightType *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  uint64_t v25;
  void *v26;
  _TtC4Maps38PlaceSummaryTextHighlightConfiguration *v27;
  void *v28;
  void *v29;
  void *v30;
  _TtC4Maps38PlaceSummaryTextHighlightConfiguration *v31;
  id v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  id v47;
  uint64_t v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  id v53;
  uint64_t v54;
  void *v55;
  id v56;
  uint64_t v57;
  void *v58;
  id v59;
  void *v60;
  uint64_t v61;
  void *v62;
  id v63;
  uint64_t v64;
  void *v65;
  id v66;
  uint64_t v67;
  void *v68;
  id v69;
  uint64_t v70;
  void *v71;
  id v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v77;
  void *v78;
  id v79;
  void *v80;
  _TtC4Maps29PlaceSummaryTextHighlightType *v81;
  _QWORD v82[4];
  _TtC4Maps38PlaceSummaryTextHighlightConfiguration *v83;
  SearchDataSource *v84;
  uint64_t *v85;
  double v86;
  _QWORD v87[4];
  _TtC4Maps38PlaceSummaryTextHighlightConfiguration *v88;
  SearchDataSource *v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t (*v94)(uint64_t, uint64_t);
  void (*v95)(uint64_t);
  id v96;
  CGRect v97;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_placeSummaryTemplateViewModels, "objectForKeyedSubscript:", v9));

  if (v10)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_placeSummaryTemplateViewModels, "objectForKeyedSubscript:", v9));
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
    objc_msgSend(v12, "frame");
    Width = CGRectGetWidth(v97);

    v14 = [_TtC4Maps29PlaceSummaryTextHighlightType alloc];
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource searchDataProvider](self, "searchDataProvider"));
    v81 = -[PlaceSummaryTextHighlightType initWithHighlightType:](v14, "initWithHighlightType:", objc_msgSend(v15, "highlightType"));

    v91 = 0;
    v92 = &v91;
    v93 = 0x3032000000;
    v94 = sub_1003D93D4;
    v95 = sub_1003D93E4;
    v96 = 0;
    v16 = v8;
    v17 = objc_opt_class(MKLocalSearchCompletion);
    if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
      v18 = v16;
    else
      v18 = 0;
    v19 = v18;

    v79 = v8;
    v80 = v19;
    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource searchDataProvider](self, "searchDataProvider"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "placeSummaryMetadata"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource currentLocation](self, "currentLocation"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource userLocationSearchResult](self, "userLocationSearchResult"));
      if (-[SearchDataSource searchAlongRoute](self, "searchAlongRoute"))
        v24 = 0;
      else
        v24 = !-[SearchDataSource isRoutePlanning](self, "isRoutePlanning");
      BYTE1(v77) = -[SearchDataSource searchAlongRoute](self, "searchAlongRoute");
      LOBYTE(v77) = v24;
      v25 = objc_claimAutoreleasedReturnValue(+[PlaceSummaryViewModelTemplateFactory viewModelWithCompletion:metadata:currentLocation:userLocationSearchResult:highlightType:availableWidth:clientSourceType:allowsTappableUnits:searchAlongRoute:](_TtC4Maps36PlaceSummaryViewModelTemplateFactory, "viewModelWithCompletion:metadata:currentLocation:userLocationSearchResult:highlightType:availableWidth:clientSourceType:allowsTappableUnits:searchAlongRoute:", v80, v21, v22, v23, v81, a4, Width, v77));
      v26 = (void *)v92[5];
      v92[5] = v25;

    }
    v27 = [_TtC4Maps38PlaceSummaryTextHighlightConfiguration alloc];
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource searchDataProvider](self, "searchDataProvider"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "autocompleteContext"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "queryString"));
    v31 = -[PlaceSummaryTextHighlightConfiguration initWithTypedAutocompleteQuery:type:](v27, "initWithTypedAutocompleteQuery:type:", v30, v81);

    v32 = v16;
    v33 = objc_opt_class(HistoryEntryRecentsItem);
    if ((objc_opt_isKindOfClass(v32, v33) & 1) != 0)
      v34 = v32;
    else
      v34 = 0;
    v35 = v34;

    if (v35)
    {
      v36 = (void *)v92[5];
      v92[5] = 0;

      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "historyEntry"));
      v87[0] = _NSConcreteStackBlock;
      v87[1] = 3221225472;
      v87[2] = sub_1003D93EC;
      v87[3] = &unk_1011B47E0;
      v90 = &v91;
      v88 = v31;
      v89 = self;
      v82[0] = _NSConcreteStackBlock;
      v82[1] = 3221225472;
      v82[2] = sub_1003D9464;
      v82[3] = &unk_1011B4808;
      v85 = &v91;
      v86 = Width;
      v83 = v88;
      v84 = self;
      objc_msgSend(v37, "ifSearch:ifRoute:ifPlaceDisplay:ifTransitLineItem:", v87, 0, v82, 0);

    }
    v38 = v32;
    v39 = objc_opt_class(AddressBookAddress);
    if ((objc_opt_isKindOfClass(v38, v39) & 1) != 0)
      v40 = v38;
    else
      v40 = 0;
    v41 = v40;

    if (v41)
    {
      v42 = objc_claimAutoreleasedReturnValue(+[PlaceSummaryViewModelTemplateFactory viewModelWithAddressBookAddress:highlightConfiguration:searchAlongRoute:](_TtC4Maps36PlaceSummaryViewModelTemplateFactory, "viewModelWithAddressBookAddress:highlightConfiguration:searchAlongRoute:", v41, v31, -[SearchDataSource searchAlongRoute](self, "searchAlongRoute")));
      v43 = (void *)v92[5];
      v92[5] = v42;

    }
    v78 = v35;
    v44 = v38;
    v45 = objc_opt_class(_TtC4Maps22MapsAutocompletePerson);
    if ((objc_opt_isKindOfClass(v44, v45) & 1) != 0)
      v46 = v44;
    else
      v46 = 0;
    v47 = v46;

    if (v47)
    {
      v48 = objc_claimAutoreleasedReturnValue(+[PlaceSummaryViewModelTemplateFactory viewModelWithAutocompletePerson:highlightConfiguration:searchAlongRoute:](_TtC4Maps36PlaceSummaryViewModelTemplateFactory, "viewModelWithAutocompletePerson:highlightConfiguration:searchAlongRoute:", v47, v31, -[SearchDataSource searchAlongRoute](self, "searchAlongRoute")));
      v49 = (void *)v92[5];
      v92[5] = v48;

    }
    v50 = v44;
    v51 = objc_opt_class(CRRecentContact);
    if ((objc_opt_isKindOfClass(v50, v51) & 1) != 0)
      v52 = v50;
    else
      v52 = 0;
    v53 = v52;

    if (v53)
    {
      v54 = objc_claimAutoreleasedReturnValue(+[PlaceSummaryViewModelTemplateFactory viewModelWithCoreRecentContact:highlightConfiguration:searchAlongRoute:](_TtC4Maps36PlaceSummaryViewModelTemplateFactory, "viewModelWithCoreRecentContact:highlightConfiguration:searchAlongRoute:", v53, v31, -[SearchDataSource searchAlongRoute](self, "searchAlongRoute")));
      v55 = (void *)v92[5];
      v92[5] = v54;

    }
    v56 = v50;
    v57 = objc_opt_class(SearchResult);
    if ((objc_opt_isKindOfClass(v56, v57) & 1) != 0)
      v58 = v56;
    else
      v58 = 0;
    v59 = v58;

    if (v59)
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource currentLocation](self, "currentLocation"));
      v61 = objc_claimAutoreleasedReturnValue(+[PlaceSummaryViewModelTemplateFactory viewModelWithSearchResult:highlightConfiguration:currentLocation:availableWidth:searchAlongRoute:](_TtC4Maps36PlaceSummaryViewModelTemplateFactory, "viewModelWithSearchResult:highlightConfiguration:currentLocation:availableWidth:searchAlongRoute:", v59, v31, v60, -[SearchDataSource searchAlongRoute](self, "searchAlongRoute"), Width));
      v62 = (void *)v92[5];
      v92[5] = v61;

    }
    v63 = v56;
    v64 = objc_opt_class(MapsSuggestionsEntry);
    if ((objc_opt_isKindOfClass(v63, v64) & 1) != 0)
      v65 = v63;
    else
      v65 = 0;
    v66 = v65;

    if (v66)
    {
      -[DataSource addEKAnalyticsForEntry:tapped:](self, "addEKAnalyticsForEntry:tapped:", v66, 0);
      v67 = objc_claimAutoreleasedReturnValue(+[PlaceSummaryViewModelTemplateFactory viewModelWithMapsSuggestionsEntry:highlightConfiguration:searchAlongRoute:](_TtC4Maps36PlaceSummaryViewModelTemplateFactory, "viewModelWithMapsSuggestionsEntry:highlightConfiguration:searchAlongRoute:", v66, v31, -[SearchDataSource searchAlongRoute](self, "searchAlongRoute")));
      v68 = (void *)v92[5];
      v92[5] = v67;

    }
    v69 = v63;
    v70 = objc_opt_class(ReportASearchAutocompleteResult);
    if ((objc_opt_isKindOfClass(v69, v70) & 1) != 0)
      v71 = v69;
    else
      v71 = 0;
    v72 = v71;

    if (v72)
    {
      v73 = objc_claimAutoreleasedReturnValue(+[PlaceSummaryViewModelTemplateFactory addAPlaceAutocompleteViewModel](_TtC4Maps36PlaceSummaryViewModelTemplateFactory, "addAPlaceAutocompleteViewModel"));
      v74 = (void *)v92[5];
      v92[5] = v73;

    }
    v75 = v92[5];
    if (v75)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_placeSummaryTemplateViewModels, "setObject:forKeyedSubscript:", v75, v9);
      v11 = (id)v92[5];
    }
    else
    {
      v11 = 0;
    }

    _Block_object_dispose(&v91, 8);
    v8 = v79;
  }

  return v11;
}

- (void)didTapOnCuratedGuide:(id)a3 cell:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_contentTableView);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "indexPathForCell:", v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource flattenedIndexPath:](self, "flattenedIndexPath:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource flattenedArray](self, "flattenedArray"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MapsAnalyticsHelper analyticsResultsInfoArrayFromAutoCompleteResultsArray:selectedIndex:](MapsAnalyticsHelper, "analyticsResultsInfoArrayFromAutoCompleteResultsArray:selectedIndex:", v10, objc_msgSend(v9, "row")));

  +[MapsAnalyticStateProvider updateSuggestionSearchInformation:searchText:searchIndex:searchfieldType:suggestionsAcSequenceNumber:](MapsAnalyticStateProvider, "updateSuggestionSearchInformation:searchText:searchIndex:searchfieldType:suggestionsAcSequenceNumber:", v11, self->_searchText, objc_msgSend(v9, "row"), 1, -[SearchDataProvider searchRequestAnalyticsSequenceNumber](self->_searchDataProvider, "searchRequestAnalyticsSequenceNumber"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  v13 = objc_opt_respondsToSelector(v12, "didTapOnCuratedGuide:");

  if ((v13 & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    objc_msgSend(v14, "didTapOnCuratedGuide:", v21);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "collectionIdentifier"));
  v16 = objc_msgSend(v15, "muid");

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
  v18 = objc_msgSend(v17, "collectionIsSaved:", v21);

  -[AutocompleteAnalyticsManager placeContextSingleCollectionTappedWithMuid:isCurrentlySaved:verticalIndex:](self->_analyticsManager, "placeContextSingleCollectionTappedWithMuid:isCurrentlySaved:verticalIndex:", v16, v18, objc_msgSend(v9, "row"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataProvider sections](self->_searchDataProvider, "sections"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataProvider autocompleteContext](self->_searchDataProvider, "autocompleteContext"));
  -[SearchDataSource _sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:indexPathInSection:sections:context:](self, "_sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:indexPathInSection:sections:context:", v9, v8, v19, v20);

}

- (void)didTapOnCuratedGuides:(id)a3 cell:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_contentTableView);
  v27 = v7;
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "indexPathForCell:", v7));

  v26 = (void *)v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource flattenedIndexPath:](self, "flattenedIndexPath:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource flattenedArray](self, "flattenedArray"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MapsAnalyticsHelper analyticsResultsInfoArrayFromAutoCompleteResultsArray:selectedIndex:](MapsAnalyticsHelper, "analyticsResultsInfoArrayFromAutoCompleteResultsArray:selectedIndex:", v11, objc_msgSend(v10, "row")));

  +[MapsAnalyticStateProvider updateSuggestionSearchInformation:searchText:searchIndex:searchfieldType:suggestionsAcSequenceNumber:](MapsAnalyticStateProvider, "updateSuggestionSearchInformation:searchText:searchIndex:searchfieldType:suggestionsAcSequenceNumber:", v12, self->_searchText, objc_msgSend(v10, "row"), 1, -[SearchDataProvider searchRequestAnalyticsSequenceNumber](self->_searchDataProvider, "searchRequestAnalyticsSequenceNumber"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  v14 = objc_opt_respondsToSelector(v13, "didTapOnCuratedGuides:");

  if ((v14 & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    objc_msgSend(v15, "didTapOnCuratedGuides:", v6);

  }
  v16 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v17 = v6;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i), "collectionIdentifier"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v22, "muid")));
        objc_msgSend(v16, "addObject:", v23);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v19);
  }

  -[AutocompleteAnalyticsManager placeContextMultipleCollectionsTappedWithMuids:verticalIndex:](self->_analyticsManager, "placeContextMultipleCollectionsTappedWithMuids:verticalIndex:", v16, objc_msgSend(v10, "row"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataProvider sections](self->_searchDataProvider, "sections"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataProvider autocompleteContext](self->_searchDataProvider, "autocompleteContext"));
  -[SearchDataSource _sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:indexPathInSection:sections:context:](self, "_sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:indexPathInSection:sections:context:", v10, v26, v24, v25);

}

- (void)didTapOnUserGeneratedGuide:(id)a3 cell:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_contentTableView);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "indexPathForCell:", v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource flattenedIndexPath:](self, "flattenedIndexPath:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource flattenedArray](self, "flattenedArray"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MapsAnalyticsHelper analyticsResultsInfoArrayFromAutoCompleteResultsArray:selectedIndex:](MapsAnalyticsHelper, "analyticsResultsInfoArrayFromAutoCompleteResultsArray:selectedIndex:", v10, objc_msgSend(v9, "row")));

  +[MapsAnalyticStateProvider updateSuggestionSearchInformation:searchText:searchIndex:searchfieldType:suggestionsAcSequenceNumber:](MapsAnalyticStateProvider, "updateSuggestionSearchInformation:searchText:searchIndex:searchfieldType:suggestionsAcSequenceNumber:", v11, self->_searchText, objc_msgSend(v9, "row"), 1, -[SearchDataProvider searchRequestAnalyticsSequenceNumber](self->_searchDataProvider, "searchRequestAnalyticsSequenceNumber"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  v13 = objc_opt_respondsToSelector(v12, "didTapOnUserGeneratedGuide:");

  if ((v13 & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    objc_msgSend(v14, "didTapOnUserGeneratedGuide:", v17);

    -[AutocompleteAnalyticsManager userGeneratedGuideUnitTapped](self->_analyticsManager, "userGeneratedGuideUnitTapped");
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataProvider sections](self->_searchDataProvider, "sections"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataProvider autocompleteContext](self->_searchDataProvider, "autocompleteContext"));
  -[SearchDataSource _sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:indexPathInSection:sections:context:](self, "_sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:indexPathInSection:sections:context:", 0, 0, v15, v16);

}

- (void)didTapOnItemInChildItems:(id)a3 cell:(id)a4 buttonIndex:(int64_t)a5
{
  UITableView **p_contentTableView;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  p_contentTableView = &self->_contentTableView;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_contentTableView);
  v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "indexPathForCell:", v9));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource flattenedIndexPath:](self, "flattenedIndexPath:", v22));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", a5, 0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "childItems"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", a5));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource flattenedArray](self, "flattenedArray"));
  -[SearchDataSource _sendAnalyticsForDataSelectedAtIndexPath:fromContent:childPlaceIndexPath:childItem:resultRefinement:containmentParent:tappableEntryIdentifier:tappedAccessoryViewType:](self, "_sendAnalyticsForDataSelectedAtIndexPath:fromContent:childPlaceIndexPath:childItem:resultRefinement:containmentParent:tappableEntryIdentifier:tappedAccessoryViewType:", v12, v16, v13, v15, 0, 0, 0, 0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataProvider sections](self->_searchDataProvider, "sections"));
  v18 = objc_claimAutoreleasedReturnValue(-[SearchDataProvider autocompleteContext](self->_searchDataProvider, "autocompleteContext"));
  -[SearchDataSource _sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:indexPathInSection:sections:context:selectedChildItemIndexPath:indexOfResultWithSelectedChildItem:](self, "_sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:indexPathInSection:sections:context:selectedChildItemIndexPath:indexOfResultWithSelectedChildItem:", v12, v22, v17, v18, v13, v22);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  LOBYTE(v18) = objc_opt_respondsToSelector(v19, "dataSource:itemTapped:childItemParent:");

  if ((v18 & 1) != 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource autocompleteObjectAtIndexPath:](self, "autocompleteObjectAtIndexPath:", v22));
    objc_msgSend(v20, "dataSource:itemTapped:childItemParent:", self, v15, v21);

  }
}

- (void)didTapOnAccessoryEntityQueryAcceleratorWithCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForCell:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource flattenedIndexPath:](self, "flattenedIndexPath:", v13));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource autocompleteObjectAtIndexPath:](self, "autocompleteObjectAtIndexPath:", v13));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource flattenedArray](self, "flattenedArray"));
  -[SearchDataSource _sendAnalyticsForDataSelectedAtIndexPath:fromContent:childPlaceIndexPath:childItem:resultRefinement:containmentParent:tappableEntryIdentifier:tappedAccessoryViewType:](self, "_sendAnalyticsForDataSelectedAtIndexPath:fromContent:childPlaceIndexPath:childItem:resultRefinement:containmentParent:tappableEntryIdentifier:tappedAccessoryViewType:", v6, v8, 0, 0, 0, 0, 0, 2);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataProvider sections](self->_searchDataProvider, "sections"));
  v10 = objc_claimAutoreleasedReturnValue(-[SearchDataProvider autocompleteContext](self->_searchDataProvider, "autocompleteContext"));
  -[SearchDataSource _sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:indexPathInSection:sections:context:](self, "_sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:indexPathInSection:sections:context:", v6, v13, v9, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  LOBYTE(v10) = objc_opt_respondsToSelector(v11, "searchDataSource:replaceQueryWithItem:");

  if ((v10 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    objc_msgSend(v12, "searchDataSource:replaceQueryWithItem:", self, v7);

  }
}

- (void)didTapOnContainmentParentMapItem:(id)a3 cell:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "indexPathForCell:", v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource flattenedIndexPath:](self, "flattenedIndexPath:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource flattenedArray](self, "flattenedArray"));
  -[SearchDataSource _sendAnalyticsForDataSelectedAtIndexPath:fromContent:childPlaceIndexPath:childItem:resultRefinement:containmentParent:tappableEntryIdentifier:tappedAccessoryViewType:](self, "_sendAnalyticsForDataSelectedAtIndexPath:fromContent:childPlaceIndexPath:childItem:resultRefinement:containmentParent:tappableEntryIdentifier:tappedAccessoryViewType:", v9, v10, 0, 0, 0, v15, 0, 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataProvider sections](self->_searchDataProvider, "sections"));
  v12 = objc_claimAutoreleasedReturnValue(-[SearchDataProvider autocompleteContext](self->_searchDataProvider, "autocompleteContext"));
  -[SearchDataSource _sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:indexPathInSection:sections:context:](self, "_sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:indexPathInSection:sections:context:", v9, v8, v11, v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  LOBYTE(v12) = objc_opt_respondsToSelector(v13, "dataSource:itemTapped:childItemParent:");

  if ((v12 & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    objc_msgSend(v14, "dataSource:itemTapped:childItemParent:", self, v15, 0);

  }
}

- (void)didTapOnResultRefinement:(id)a3 cell:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "indexPathForCell:", v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource flattenedIndexPath:](self, "flattenedIndexPath:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource flattenedArray](self, "flattenedArray"));
  -[SearchDataSource _sendAnalyticsForDataSelectedAtIndexPath:fromContent:childPlaceIndexPath:childItem:resultRefinement:containmentParent:tappableEntryIdentifier:tappedAccessoryViewType:](self, "_sendAnalyticsForDataSelectedAtIndexPath:fromContent:childPlaceIndexPath:childItem:resultRefinement:containmentParent:tappableEntryIdentifier:tappedAccessoryViewType:", v9, v10, 0, 0, v16, 0, 0, 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataProvider sections](self->_searchDataProvider, "sections"));
  v12 = objc_claimAutoreleasedReturnValue(-[SearchDataProvider autocompleteContext](self->_searchDataProvider, "autocompleteContext"));
  -[SearchDataSource _sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:indexPathInSection:sections:context:](self, "_sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:indexPathInSection:sections:context:", v9, v8, v11, v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  LOBYTE(v12) = objc_opt_respondsToSelector(v13, "dataSource:itemTapped:childItemParent:");

  if ((v12 & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource autocompleteObjectAtIndexPath:](self, "autocompleteObjectAtIndexPath:", v8));
    objc_msgSend(v14, "dataSource:itemTapped:childItemParent:", self, v16, v15);

  }
}

- (void)didTapOnTappableEntryWithMapItemIdentifier:(id)a3 cell:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "indexPathForCell:", v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource flattenedIndexPath:](self, "flattenedIndexPath:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource flattenedArray](self, "flattenedArray"));
  -[SearchDataSource _sendAnalyticsForDataSelectedAtIndexPath:fromContent:childPlaceIndexPath:childItem:resultRefinement:containmentParent:tappableEntryIdentifier:tappedAccessoryViewType:](self, "_sendAnalyticsForDataSelectedAtIndexPath:fromContent:childPlaceIndexPath:childItem:resultRefinement:containmentParent:tappableEntryIdentifier:tappedAccessoryViewType:", v9, v10, 0, 0, 0, 0, v16, 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataProvider sections](self->_searchDataProvider, "sections"));
  v12 = objc_claimAutoreleasedReturnValue(-[SearchDataProvider autocompleteContext](self->_searchDataProvider, "autocompleteContext"));
  -[SearchDataSource _sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:indexPathInSection:sections:context:](self, "_sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:indexPathInSection:sections:context:", v9, v8, v11, v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  LOBYTE(v12) = objc_opt_respondsToSelector(v13, "dataSource:itemTapped:childItemParent:");

  if ((v12 & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource autocompleteObjectAtIndexPath:](self, "autocompleteObjectAtIndexPath:", v8));
    objc_msgSend(v14, "dataSource:itemTapped:childItemParent:", self, v16, v15);

  }
}

- (id)personalizedItemForQuickActionMenuWithCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SearchResult *v7;
  uint64_t v8;
  SearchResult *v9;
  SearchResult *v10;
  SearchResultMapItem *v11;
  SearchResult *v12;
  SearchResult *v13;
  uint64_t v14;
  SearchResult *v15;
  SearchResult *v16;
  void *v17;
  SearchResult *v18;
  void *v19;
  SearchResult *v20;
  uint64_t v21;
  SearchResult *v22;
  SearchResult *v23;
  id v24;
  __objc2_prot *v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  unsigned int v31;
  id v32;
  SearchResultMapItem *v33;
  uint64_t v34;
  SearchResultMapItem *v35;
  SearchResultMapItem *v36;
  SearchResultMapItem *v37;
  SearchResultMapItem *v38;
  void *v39;
  id v40;
  void *v41;
  SearchResult *v42;
  SearchResult *v43;
  __objc2_prot *v44;
  uint64_t v45;
  SearchResult *v46;
  SearchResult *v47;
  SearchResult *v48;
  void *v49;
  unsigned int v50;
  void *v51;
  uint64_t v53;
  SearchResultMapItem *v54;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForCell:", v4));

  v7 = (SearchResult *)objc_claimAutoreleasedReturnValue(-[SearchDataSource autocompleteObjectAtIndexPath:](self, "autocompleteObjectAtIndexPath:", v6));
  v8 = objc_opt_class(SearchResult);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;
  if (!v10)
  {
    v13 = v7;
    v14 = objc_opt_class(MKLocalSearchCompletion);
    if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
      v15 = v13;
    else
      v15 = 0;
    v16 = v15;

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](v16, "mapItem"));

      if (v17)
      {
        v18 = [SearchResult alloc];
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](v16, "mapItem"));
        v12 = -[SearchResult initWithMapItem:](v18, "initWithMapItem:", v19);

        v11 = -[SearchResultMapItemBase initWithSearchResult:]([SearchResultMapItem alloc], "initWithSearchResult:", v12);
LABEL_46:

        goto LABEL_47;
      }
    }
    v20 = v13;
    v21 = objc_opt_class(HistoryEntryRecentsItem);
    if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
      v22 = v20;
    else
      v22 = 0;
    v23 = v22;

    if (v23)
    {
      v24 = (id)objc_claimAutoreleasedReturnValue(-[SearchResult historyEntry](v23, "historyEntry"));
      v25 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
      v26 = objc_opt_class(HistoryEntryRecentsItem);
      v27 = v24;
      if ((objc_opt_isKindOfClass(v27, v26) & 1) != 0)
        v28 = v27;
      else
        v28 = 0;
      v29 = v28;

      if (v29)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "historyEntry"));
        v31 = objc_msgSend(v30, "conformsToProtocol:", v25);

        if (v31)
          v32 = v27;
        else
          v32 = 0;
      }
      else
      {
        v32 = 0;
      }

      if (!v32)
      {
        v12 = 0;
        v11 = 0;
        goto LABEL_45;
      }
      v43 = v20;
      v44 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
      v45 = objc_opt_class(HistoryEntryRecentsItem);
      v46 = v43;
      if ((objc_opt_isKindOfClass(v46, v45) & 1) != 0)
        v47 = v46;
      else
        v47 = 0;
      v48 = v47;

      if (v48
        && (v49 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult historyEntry](v48, "historyEntry")),
            v50 = objc_msgSend(v49, "conformsToProtocol:", v44),
            v49,
            v50))
      {
        v33 = v46;
      }
      else
      {
        v33 = 0;
      }

      v51 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItem historyEntry](v33, "historyEntry"));
      v38 = (SearchResultMapItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "geoMapItem"));

      v42 = -[SearchResult initWithGEOMapItem:]([SearchResult alloc], "initWithGEOMapItem:", v38);
    }
    else
    {
      v33 = v20;
      v34 = objc_opt_class(AddressBookAddress);
      if ((objc_opt_isKindOfClass(v33, v34) & 1) != 0)
        v35 = v33;
      else
        v35 = 0;
      v36 = v35;

      if (!v36)
      {
        v38 = v33;
        v53 = objc_opt_class(MapsSuggestionsEntry);
        if ((objc_opt_isKindOfClass(v38, v53) & 1) != 0)
          v54 = v38;
        else
          v54 = 0;
        v33 = v54;

        if (v33)
        {
          if ((-[SearchResultMapItem BOOLeanForKey:is:](v33, "BOOLeanForKey:is:", CFSTR("MapsSuggestionsIsNotADestinationKey"), 1) & 1) == 0)
          {
            v11 = -[SuggestionsItem initWithSuggestion:order:sourceType:sourceSubtype:hasPriorityOverride:priorityOverride:]([SuggestionsItem alloc], "initWithSuggestion:order:sourceType:sourceSubtype:hasPriorityOverride:priorityOverride:", v33, 0, 9, 0, 0, 0);
            v33 = 0;
            v12 = 0;
            goto LABEL_42;
          }
          v33 = 0;
        }
        else
        {
          v38 = 0;
        }
        v12 = 0;
        v11 = 0;
LABEL_42:

LABEL_43:
LABEL_45:

        goto LABEL_46;
      }
      v37 = (SearchResultMapItem *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItem geocodedMapItem](v36, "geocodedMapItem"));
      v38 = v37;
      if (!v37
        || (v39 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItem _geoMapItem](v37, "_geoMapItem")),
            v39,
            !v39))
      {
        v40 = objc_alloc((Class)MKMapItem);
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultMapItem addressDictionary](v36, "addressDictionary"));
        v11 = (SearchResultMapItem *)objc_msgSend(v40, "initWithAddressDictionary:", v41);

        v38 = v11;
        if (!v11)
        {
          v12 = 0;
          goto LABEL_43;
        }
      }
      v42 = -[SearchResult initWithMapItem:searchResultType:addressBookAddress:retainedSearchMetadata:resultIndex:]([SearchResult alloc], "initWithMapItem:searchResultType:addressBookAddress:retainedSearchMetadata:resultIndex:", v38, 0, v36, 0, 0);
    }
    v12 = v42;
    v11 = -[SearchResultMapItemBase initWithSearchResult:]([SearchResultMapItem alloc], "initWithSearchResult:", v42);
    goto LABEL_42;
  }
  v11 = -[SearchResultMapItemBase initWithSearchResult:]([SearchResultMapItem alloc], "initWithSearchResult:", v10);
  v12 = v7;
LABEL_47:

  return v11;
}

- (id)objectsForAnalytics
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource _contentFilteredIfNeeded](self, "_contentFilteredIfNeeded"));
  v3 = objc_msgSend(v2, "copy");

  return v3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[SearchDataSource numberOfRowsInSection:](self, "numberOfRowsInSection:", a4);
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  SectionHeaderTableViewHeaderFooterView *v7;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  SectionHeaderTableViewHeaderFooterView *v13;
  void *v14;

  v6 = a3;
  if (-[SearchDataSource shouldShowNoResultsCell](self, "shouldShowNoResultsCell")
    || !-[DataSource active](self, "active")
    || -[SearchDataSource shouldShowLoadingIndicator](self, "shouldShowLoadingIndicator"))
  {
    v7 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource sectionAtIndex:](self, "sectionAtIndex:", a4));
    if ((objc_msgSend(v9, "isQuerySuggestionsSection") & 1) != 0
      || (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title")),
          v11 = objc_msgSend(v10, "length"),
          v10,
          !v11))
    {
      v7 = 0;
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
      if (objc_msgSend(v12, "length"))
      {
        v13 = [SectionHeaderTableViewHeaderFooterView alloc];
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
        v7 = -[SectionHeaderTableViewHeaderFooterView initWithTitle:isFirstNonEmptySection:](v13, "initWithTitle:isFirstNonEmptySection:", v14, objc_msgSend(v6, "_maps_indexOfFirstNonEmptySection") == (id)a4);

        -[SectionHeaderTableViewHeaderFooterView setAccessibilityIdentifiersWithBaseString:](v7, "setAccessibilityIdentifiersWithBaseString:", CFSTR("Autocomplete"));
        -[SectionHeaderTableViewHeaderFooterView setShowsBottomHairline:](v7, "setShowsBottomHairline:", 0);
      }
      else
      {
        v7 = 0;
      }

    }
  }

  return v7;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  double v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  double Width;
  void *v12;
  double v13;
  CGRect v15;

  v6 = a3;
  v7 = 0.0;
  if (!-[SearchDataSource shouldShowNoResultsCell](self, "shouldShowNoResultsCell")
    && -[DataSource active](self, "active")
    && !-[SearchDataSource shouldShowLoadingIndicator](self, "shouldShowLoadingIndicator"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource sectionAtIndex:](self, "sectionAtIndex:", a4));
    if ((objc_msgSend(v8, "isQuerySuggestionsSection") & 1) == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
      if (objc_msgSend(v9, "length"))
      {
        v10 = objc_msgSend(v6, "_maps_indexOfFirstNonEmptySection") == (id)a4;
        objc_msgSend(v6, "bounds");
        Width = CGRectGetWidth(v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "traitCollection"));
        +[SectionHeaderTableViewHeaderFooterView heightWhenFirstNonEmptySection:title:actionTitle:availableWidth:traitCollection:](SectionHeaderTableViewHeaderFooterView, "heightWhenFirstNonEmptySection:title:actionTitle:availableWidth:traitCollection:", v10, v9, 0, v12, Width);
        v7 = v13;

      }
    }

  }
  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  int64_t v12;
  void *v13;
  AcSearchResultTableViewCell *v14;
  double v15;
  uint64_t v16;
  int64_t accessoryType;
  uint64_t v18;
  unsigned int v19;
  void *v20;
  QuerySuggestionTableViewCell *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  DirectionIntentCellViewModel *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  unsigned int v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  unsigned int v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  NSString *v52;
  uint64_t v53;
  id v54;
  __CFString *v55;
  void **p_cache;
  uint64_t v57;
  void *v58;
  id v59;
  __objc2_prot *v60;
  uint64_t v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  unsigned int v66;
  id v67;
  uint64_t v68;
  id v69;
  void *v70;
  int64_t v71;
  id v72;
  __objc2_prot *v73;
  uint64_t v74;
  id v75;
  void *v76;
  id v77;
  void *v78;
  unsigned int v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  uint64_t v86;
  void *v87;
  void *v88;
  _BOOL8 v89;
  TwoLinesTableViewCell *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  id v95;
  id v96;
  void *v97;
  void *v98;
  id v99;
  __objc2_prot *v100;
  uint64_t v101;
  id v102;
  void *v103;
  id v104;
  void **v105;
  void *v106;
  unsigned int v107;
  id v108;
  id v109;
  __objc2_prot *v110;
  uint64_t v111;
  id v112;
  void *v113;
  id v114;
  void *v115;
  unsigned int v116;
  id v117;
  void *v118;
  void *v119;
  void *v120;
  id v121;
  void *v122;
  void *v123;
  id v124;
  uint64_t v125;
  uint64_t v126;
  int64_t v127;
  id v128;
  void *v129;
  unsigned __int8 v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  double v140;
  double v141;
  uint64_t v142;
  __objc2_class **v143;
  void *v144;
  ChildItemsViewModel *v145;
  double v146;
  double v147;
  void *v148;
  double v149;
  double v150;
  double v151;
  double v152;
  ChildItemsViewModel *v153;
  PlaceContextViewModel *v154;
  void *v155;
  void *v156;
  uint64_t v157;
  void *v158;
  void *v159;
  id v160;
  void *v161;
  void *v162;
  uint64_t v163;
  void *v164;
  TwoLinesTableViewCell *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v174;
  void *v175;
  void *v176;
  id v177;
  void *v178;
  int64_t v179;
  void *v180;
  int64_t v181;
  void *v182;
  id v183;
  void *v184;
  int64_t v185;
  void *v186;
  CGRect v187;

  v6 = a3;
  v7 = a4;
  if (-[SearchDataSource shouldShowLoadingIndicator](self, "shouldShowLoadingIndicator") && !objc_msgSend(v7, "row"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SearchLoadingTableViewCell identifier](SearchLoadingTableViewCell, "identifier"));
    v14 = (AcSearchResultTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v13, v7));

  }
  else
  {
    if (!-[SearchDataSource shouldShowNoResultsCell](self, "shouldShowNoResultsCell") || objc_msgSend(v7, "row"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v7));
      v9 = objc_opt_class(PersonalizedCompoundItem);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource searchDataProvider](self, "searchDataProvider"));
        v11 = objc_msgSend(v10, "showAutocompleteClientSource");

        if (v11)
          v12 = +[AutocompleteClientSource autocompleteClientSourceTypeWithItem:](AutocompleteClientSource, "autocompleteClientSourceTypeWithItem:", v8);
        else
          v12 = 0;
        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "autocompleteObject"));

        v8 = (void *)v16;
      }
      else
      {
        v12 = 0;
      }
      if (self->_showAddAccessory)
      {
        accessoryType = self->_accessoryType;
      }
      else
      {
        v18 = objc_opt_class(MKLocalSearchCompletion);
        if ((objc_opt_isKindOfClass(v8, v18) & 1) == 0
          || !objc_msgSend(v8, "hasQueryAcceleratorAffordanceEnabled"))
        {
          v185 = 0;
LABEL_21:
          v186 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource sectionAtIndex:](self, "sectionAtIndex:", objc_msgSend(v7, "section")));
          if (objc_msgSend(v186, "isQuerySuggestionsSection"))
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(+[QuerySuggestionTableViewCell identifier](QuerySuggestionTableViewCell, "identifier"));
            v14 = (AcSearchResultTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v20));

            if (!v14)
            {
              v21 = [QuerySuggestionTableViewCell alloc];
              v22 = (void *)objc_claimAutoreleasedReturnValue(+[QuerySuggestionTableViewCell identifier](QuerySuggestionTableViewCell, "identifier"));
              v14 = -[QuerySuggestionTableViewCell initWithStyle:reuseIdentifier:](v21, "initWithStyle:reuseIdentifier:", 0, v22);

            }
            v23 = v6;
            v24 = v8;
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "directionIntent"));

            if (v25)
            {
              v26 = -[DirectionIntentCellViewModel initWithLocalSearchCompletion:]([DirectionIntentCellViewModel alloc], "initWithLocalSearchCompletion:", v24);
              v27 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionIntentCellViewModel titleCellString](v26, "titleCellString"));
              v28 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionIntentCellViewModel subtitleCellString](v26, "subtitleCellString"));
              if (objc_msgSend(v28, "length"))
              {
                v29 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v27, v28));

                v27 = (void *)v29;
              }
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "titleHighlightRanges"));
              -[AcSearchResultTableViewCell setTitle:highlightTitleRanges:detailText:style:](v14, "setTitle:highlightTitleRanges:detailText:style:", v27, v30, 0, 0);

            }
            else
            {
              v26 = (DirectionIntentCellViewModel *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "title"));
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "titleHighlightRanges"));
              -[AcSearchResultTableViewCell setTitle:highlightTitleRanges:detailText:style:](v14, "setTitle:highlightTitleRanges:detailText:style:", v26, v27, 0, 0);
            }

            -[_SearchResultTableViewCell setAccessoryViewDelegate:](v14, "setAccessoryViewDelegate:", self);
            -[_SearchResultTableViewCell setAccessoryViewObject:](v14, "setAccessoryViewObject:", v24);
            -[AcSearchResultTableViewCell setAccessoryViewType:](v14, "setAccessoryViewType:", v185);
            v6 = v23;
            goto LABEL_152;
          }
          if (-[SearchDataSource usePlaceSummary](self, "usePlaceSummary"))
          {
            v31 = v8;
            v32 = objc_opt_class(MKLocalSearchCompletion);
            if ((objc_opt_isKindOfClass(v31, v32) & 1) != 0)
              v33 = v31;
            else
              v33 = 0;
            v24 = v33;

            v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "clientResolved"));
            if (v34)
            {
              v35 = (void *)v34;
              v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "clientResolved"));
              v37 = objc_msgSend(v36, "itemType");

              if (v37 == 4)
              {
                v38 = (void *)objc_claimAutoreleasedReturnValue(+[CustomLocationManager sharedManager](CustomLocationManager, "sharedManager"));
                v39 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource userLocationSearchResult](self, "userLocationSearchResult"));
                objc_msgSend(v38, "processSearchResult:traits:", v39, 0);

              }
            }
            v40 = objc_claimAutoreleasedReturnValue(-[SearchDataSource placeSummaryTemplateForObject:autocompleteClientSourceType:atIndexPath:](self, "placeSummaryTemplateForObject:autocompleteClientSourceType:atIndexPath:", v31, v12, v7));
            if (v40)
            {
              v41 = (void *)v40;
              v42 = (void *)objc_claimAutoreleasedReturnValue(+[PlaceSummaryTableViewCell reuseIdentifier](_TtC4Maps25PlaceSummaryTableViewCell, "reuseIdentifier"));
              v14 = (AcSearchResultTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v42));

              -[AcSearchResultTableViewCell setViewModel:delegate:asyncDataManager:](v14, "setViewModel:delegate:asyncDataManager:", v41, self, self->_placeSummaryAsyncDataManager);
LABEL_152:
              v155 = v186;
LABEL_153:

              goto LABEL_154;
            }

          }
          v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
          v47 = objc_msgSend(v46, "BOOLForKey:", CFSTR("EnableSearchDebug"));

          v24 = 0;
          if (!v47 || !v8)
          {
LABEL_59:
            p_cache = &OBJC_METACLASS____LookAroundFloatingButtonsView.cache;
            v57 = objc_opt_class(HistoryEntryRecentsItem);
            v183 = v24;
            v184 = v6;
            if ((objc_opt_isKindOfClass(v8, v57) & 1) != 0)
            {
              v179 = v12;
              v58 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForHistoryEntryRecentsItem:showAutocompleteClientSource:showPlaceContext:](TwoLinesContentViewModelComposer, "cellModelForHistoryEntryRecentsItem:showAutocompleteClientSource:showPlaceContext:", v8, (unint64_t)(v12 - 1) < 2, -[SearchDataSource showPlaceContext](self, "showPlaceContext")));
              v59 = v8;
              v60 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
              v61 = objc_opt_class(HistoryEntryRecentsItem);
              v62 = v59;
              if ((objc_opt_isKindOfClass(v62, v61) & 1) != 0)
                v63 = v62;
              else
                v63 = 0;
              v64 = v63;

              if (v64
                && (v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "historyEntry")),
                    v66 = objc_msgSend(v65, "conformsToProtocol:", v60),
                    v65,
                    v66))
              {
                v67 = v62;
              }
              else
              {
                v67 = 0;
              }

              if (v67)
              {
                v72 = v62;
                v73 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
                v74 = objc_opt_class(HistoryEntryRecentsItem);
                v75 = v72;
                if ((objc_opt_isKindOfClass(v75, v74) & 1) != 0)
                  v76 = v75;
                else
                  v76 = 0;
                v77 = v76;

                if (v77
                  && (v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "historyEntry")),
                      v79 = objc_msgSend(v78, "conformsToProtocol:", v73),
                      v78,
                      v79))
                {
                  v69 = v75;
                }
                else
                {
                  v69 = 0;
                }

                v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "historyEntry"));
                v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "geoMapItem"));
                v84 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapItem _itemWithGeoMapItem:](MKMapItem, "_itemWithGeoMapItem:", v83));

                if (objc_msgSend(v84, "_isMapItemTypeBusiness"))
                {
                  v85 = v75;

                  v58 = 0;
                }
                else
                {
                  v85 = 0;
                }
                v12 = v179;
                v24 = v183;
                p_cache = (void **)(&OBJC_METACLASS____LookAroundFloatingButtonsView + 16);

                goto LABEL_91;
              }
              v85 = 0;
              v12 = v179;
LABEL_83:
              p_cache = (void **)(&OBJC_METACLASS____LookAroundFloatingButtonsView + 16);
              goto LABEL_92;
            }
            v68 = objc_opt_class(MKLocalSearchCompletion);
            if ((objc_opt_isKindOfClass(v8, v68) & 1) != 0)
            {
              v69 = v8;
              v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "mapItem"));
              v71 = v12;
              if (v70)
              {

              }
              else
              {
                v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "publisherResult"));

                if (!v87)
                {
                  v156 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource userLocationSearchResult](self, "userLocationSearchResult"));
                  v12 = v71;
                  v58 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForLocalSearchCompletion:userLocationSearchResult:autocompleteClientSourceType:](TwoLinesContentViewModelComposer, "cellModelForLocalSearchCompletion:userLocationSearchResult:autocompleteClientSourceType:", v69, v156, v71));

                  v157 = objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "clientResolved"));
                  if (v157)
                  {
                    v158 = (void *)v157;
                    v182 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "clientResolved"));
                    if (objc_msgSend(v182, "itemType") == 4)
                    {
                      v159 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "subtitle"));
                      v160 = objc_msgSend(v159, "length");

                      if (!v160)
                      {
                        v161 = (void *)objc_claimAutoreleasedReturnValue(+[CustomLocationManager sharedManager](CustomLocationManager, "sharedManager"));
                        v162 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource userLocationSearchResult](self, "userLocationSearchResult"));
                        objc_msgSend(v161, "processSearchResult:traits:", v162, 0);

                      }
                      v24 = v183;
                      v12 = v71;
                    }
                    else
                    {

                    }
                  }
                  p_cache = &OBJC_METACLASS____LookAroundFloatingButtonsView.cache;
                  v85 = 0;
                  goto LABEL_91;
                }
              }
              v58 = 0;
              v12 = v71;
              p_cache = &OBJC_METACLASS____LookAroundFloatingButtonsView.cache;
              v85 = v69;
LABEL_91:

LABEL_92:
              if (v58)
              {
                objc_msgSend(v58, "setDebugString:", v24);
                objc_msgSend(v58, "setShouldEnableGrayscaleHighlighting:", -[SearchDataProvider shouldEnableGrayscaleHighlighting](self->_searchDataProvider, "shouldEnableGrayscaleHighlighting"));
                v88 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesTableViewCell identifier](TwoLinesTableViewCell, "identifier"));
                v14 = (AcSearchResultTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v184, "dequeueReusableCellWithIdentifier:", v88));

                if (!v14)
                {
                  v89 = sub_1002A8AA0(v184) == 5;
                  v90 = [TwoLinesTableViewCell alloc];
                  v91 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesTableViewCell identifier](TwoLinesTableViewCell, "identifier"));
                  v14 = -[TwoLinesTableViewCell initWithStyle:reuseIdentifier:contentViewType:](v90, "initWithStyle:reuseIdentifier:contentViewType:", 0, v91, v89);

                }
                v92 = objc_opt_class(MKLocalSearchCompletion);
                if ((objc_opt_isKindOfClass(v8, v92) & 1) == 0)
                {
                  v180 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "titleText"));
                  v93 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource searchDataProvider](self, "searchDataProvider"));
                  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "autocompleteContext"));
                  v95 = v7;
                  v96 = v85;
                  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "queryString"));
                  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v180, "_maps_prefixMatchesForSearchString:", v97));
                  objc_msgSend(v58, "setTitleHighlightRanges:", v98);

                  v85 = v96;
                  v7 = v95;

                }
                -[AcSearchResultTableViewCell setViewModel:](v14, "setViewModel:", v58);
                -[_SearchResultTableViewCell setAccessoryViewDelegate:](v14, "setAccessoryViewDelegate:", self);
                -[_SearchResultTableViewCell setAccessoryViewObject:](v14, "setAccessoryViewObject:", v8);
                -[AcSearchResultTableViewCell setAccessoryViewType:](v14, "setAccessoryViewType:", v185);
                -[_SearchResultTableViewCell setPlaceContextViewModelDelegate:](v14, "setPlaceContextViewModelDelegate:", self);

                v24 = v183;
                v6 = v184;
                goto LABEL_152;
              }
              if (v85)
              {
                v181 = v12;
                v99 = v85;
                v100 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
                v101 = objc_opt_class(p_cache + 398);
                v102 = v99;
                if ((objc_opt_isKindOfClass(v102, v101) & 1) != 0)
                  v103 = v102;
                else
                  v103 = 0;
                v104 = v103;

                v105 = p_cache;
                if (v104)
                {
                  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "historyEntry"));
                  v107 = objc_msgSend(v106, "conformsToProtocol:", v100);

                  if (v107)
                    v108 = v102;
                  else
                    v108 = 0;
                }
                else
                {
                  v108 = 0;
                }

                if (v108)
                {
                  v109 = v102;
                  v110 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
                  v111 = objc_opt_class(v105 + 398);
                  v112 = v109;
                  if ((objc_opt_isKindOfClass(v112, v111) & 1) != 0)
                    v113 = v112;
                  else
                    v113 = 0;
                  v114 = v113;

                  if (v114
                    && (v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "historyEntry")),
                        v116 = objc_msgSend(v115, "conformsToProtocol:", v110),
                        v115,
                        v116))
                  {
                    v117 = v112;
                  }
                  else
                  {
                    v117 = 0;
                  }

                  v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "historyEntry"));
                  v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "geoMapItem"));
                  v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "_childItems"));

                  v121 = objc_alloc((Class)MKMapItem);
                  v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "historyEntry"));
                  v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "geoMapItem"));
                  v177 = objc_msgSend(v121, "initWithGeoMapItem:isPlaceHolderPlace:", v123, 0);

                  v124 = v183;
                }
                else
                {
                  v125 = objc_opt_class(MKLocalSearchCompletion);
                  v124 = v183;
                  if ((objc_opt_isKindOfClass(v102, v125) & 1) != 0)
                  {
                    v117 = v102;
                    v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "childItems"));
                    v177 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "mapItem"));
                  }
                  else
                  {
                    v131 = objc_opt_class(SearchResult);
                    if ((objc_opt_isKindOfClass(v102, v131) & 1) == 0)
                    {
                      v120 = 0;
                      v177 = 0;
                      goto LABEL_126;
                    }
                    v177 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "mapItem"));
                    v117 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v177, "_geoMapItem"));
                    v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "_childItems"));
                  }
                }

LABEL_126:
                v132 = objc_claimAutoreleasedReturnValue(+[AcSearchResultTableViewCell identifierWithChildItemsCount:](AcSearchResultTableViewCell, "identifierWithChildItemsCount:", objc_msgSend(v120, "count")));
                v14 = (AcSearchResultTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v184, "dequeueReusableCellWithIdentifier:", v132));
                if (!v14)
                  v14 = -[AcSearchResultTableViewCell initWithStyle:reuseIdentifier:]([AcSearchResultTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, v132);
                v178 = (void *)v132;
                -[AcSearchResultTableViewCell setDelegate:](v14, "setDelegate:", self);
                v133 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource currentLocation](self, "currentLocation"));
                -[_SearchResultTableViewCell setCurrentLocation:](v14, "setCurrentLocation:", v133);

                -[_SearchResultTableViewCell setDebugString:](v14, "setDebugString:", v124);
                -[_SearchResultTableViewCell setAccessoryViewDelegate:](v14, "setAccessoryViewDelegate:", self);
                -[_SearchResultTableViewCell setAccessoryViewObject:](v14, "setAccessoryViewObject:", v102);
                -[AcSearchResultTableViewCell setAccessoryViewType:](v14, "setAccessoryViewType:", v185);
                -[AcSearchResultTableViewCell setShouldEnableGrayscaleHighlighting:](v14, "setShouldEnableGrayscaleHighlighting:", -[SearchDataProvider shouldEnableGrayscaleHighlighting](self->_searchDataProvider, "shouldEnableGrayscaleHighlighting"));
                v134 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource searchDataProvider](self, "searchDataProvider"));
                v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "autocompleteContext"));
                v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "queryString"));
                -[AcSearchResultTableViewCell setSearchQuery:](v14, "setSearchQuery:", v136);

                v137 = objc_opt_class(MKLocalSearchCompletion);
                if ((objc_opt_isKindOfClass(v102, v137) & 1) != 0)
                  v138 = (uint64_t)objc_msgSend(v102, "autocompleteCellType");
                else
                  v138 = 3;
                -[AcSearchResultTableViewCell setAutocompleteCellType:](v14, "setAutocompleteCellType:", v138);
                -[AcSearchResultTableViewCell setAutocompleteClientSourceType:](v14, "setAutocompleteClientSourceType:", v181);
                if (objc_msgSend(v120, "count"))
                {
                  v139 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
                  objc_msgSend(v139, "frame");
                  -[AcSearchResultTableViewCell estimatedChildItemsStackViewWidthWithContentViewWidth:](v14, "estimatedChildItemsStackViewWidthWithContentViewWidth:", CGRectGetWidth(v187));
                  v141 = v140;

                  v142 = sub_1002A8AA0(v184);
                  v143 = off_1011960E0;
                  if (v142 != 5)
                    v143 = off_1011960D8;
                  v144 = (void *)objc_opt_class(*v143);
                  v145 = [ChildItemsViewModel alloc];
                  +[AcSearchResultTableViewCell childItemRowSpacing](AcSearchResultTableViewCell, "childItemRowSpacing");
                  v147 = v146;
                  v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "buttonTitleFont"));
                  objc_msgSend(v144, "contentEdgeInsets");
                  v153 = -[ChildItemsViewModel initWithChildItems:childItemsSpacing:font:maxWidth:buttonContentEdgeInsets:](v145, "initWithChildItems:childItemsSpacing:font:maxWidth:buttonContentEdgeInsets:", v120, v148, v147, v141, v149, v150, v151, v152);

                }
                else
                {
                  v153 = 0;
                }
                v24 = v183;
                -[AcSearchResultTableViewCell setChildItems:viewModel:](v14, "setChildItems:viewModel:", v120, v153);
                -[_SearchResultTableViewCell setPlaceContextViewModelDelegate:](v14, "setPlaceContextViewModelDelegate:", self);
                if (-[SearchDataSource showPlaceContext](self, "showPlaceContext") && v177)
                {
                  v154 = -[PlaceContextViewModel initWithMapItem:context:]([PlaceContextViewModel alloc], "initWithMapItem:context:", v177, 1);
                  -[_SearchResultTableViewCell setPlaceContextViewModel:](v14, "setPlaceContextViewModel:", v154);

                }
                else
                {
                  -[_SearchResultTableViewCell setPlaceContextViewModel:](v14, "setPlaceContextViewModel:", 0);
                }
                v155 = v186;
                -[AcSearchResultTableViewCell setObject:](v14, "setObject:", v102);

                v6 = v184;
                goto LABEL_153;
              }
              goto LABEL_150;
            }
            v80 = objc_opt_class(AddressBookAddress);
            if ((objc_opt_isKindOfClass(v8, v80) & 1) != 0)
            {
              v81 = objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForAddressBookAddress:](TwoLinesContentViewModelComposer, "cellModelForAddressBookAddress:", v8));
            }
            else
            {
              v86 = objc_opt_class(CRRecentContact);
              if ((objc_opt_isKindOfClass(v8, v86) & 1) == 0)
              {
                v126 = objc_opt_class(SearchResult);
                if ((objc_opt_isKindOfClass(v8, v126) & 1) == 0)
                {
                  v163 = objc_opt_class(MapsSuggestionsEntry);
                  if ((objc_opt_isKindOfClass(v8, v163) & 1) != 0)
                  {
                    -[DataSource addEKAnalyticsForEntry:tapped:](self, "addEKAnalyticsForEntry:tapped:", v8, 0);
                    v164 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesTableViewCell identifier](TwoLinesTableViewCell, "identifier"));
                    v14 = (AcSearchResultTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v164));

                    if (!v14)
                    {
                      v165 = [TwoLinesTableViewCell alloc];
                      v166 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesTableViewCell identifier](TwoLinesTableViewCell, "identifier"));
                      v14 = -[TwoLinesTableViewCell initWithStyle:reuseIdentifier:contentViewType:](v165, "initWithStyle:reuseIdentifier:contentViewType:", 0, v166, 0);

                    }
                    v167 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForMapsSuggestionEntry:](TwoLinesContentViewModelComposer, "cellModelForMapsSuggestionEntry:", v8));
                    objc_msgSend(v167, "setDebugString:", v24);
                    v168 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v167, "titleText"));
                    v169 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource searchDataProvider](self, "searchDataProvider"));
                    v170 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "autocompleteContext"));
                    v171 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v170, "queryString"));
                    v172 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v168, "_maps_prefixMatchesForSearchString:", v171));
                    objc_msgSend(v167, "setTitleHighlightRanges:", v172);

                    v24 = v183;
                    objc_msgSend(v167, "setShouldEnableGrayscaleHighlighting:", -[SearchDataProvider shouldEnableGrayscaleHighlighting](self->_searchDataProvider, "shouldEnableGrayscaleHighlighting"));
                    -[AcSearchResultTableViewCell setViewModel:](v14, "setViewModel:", v167);

                    goto LABEL_151;
                  }
LABEL_150:
                  v14 = (AcSearchResultTableViewCell *)objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, 0);
LABEL_151:
                  v6 = v184;
                  goto LABEL_152;
                }
                v127 = v12;
                v128 = v8;
                if (objc_msgSend(v128, "type") == 3
                  || (objc_msgSend(v128, "isDynamicCurrentLocation") & 1) != 0
                  || (v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "mapItem")),
                      v130 = objc_msgSend(v129, "_hasMUID"),
                      v129,
                      (v130 & 1) == 0))
                {
                  v174 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource searchDataProvider](self, "searchDataProvider"));
                  v175 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v174, "autocompleteInputContext"));
                  v176 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v175, "queryString"));
                  v58 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForSearchResult:typedACQuery:showAutocompleteClientSource:](TwoLinesContentViewModelComposer, "cellModelForSearchResult:typedACQuery:showAutocompleteClientSource:", v128, v176, v127 == 5));

                  v24 = v183;
                  v85 = 0;
                }
                else
                {
                  v85 = v128;
                  v58 = 0;
                }

                v12 = v127;
                goto LABEL_83;
              }
              v81 = objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForRecentContact:showAutocompleteClientSource:autocompleteClientSourceType:](TwoLinesContentViewModelComposer, "cellModelForRecentContact:showAutocompleteClientSource:autocompleteClientSourceType:", v8, (unint64_t)(v12 - 3) < 2, v12));
            }
            v58 = (void *)v81;
            v85 = 0;
            goto LABEL_92;
          }
          v48 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource searchDataProvider](self, "searchDataProvider"));
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "autocompleteContext"));
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "matchInfoForObject:", v8));

          if (v50)
          {
            if (objc_msgSend(v50, "hasClientRankingDebug"))
            {
              objc_msgSend(v50, "clientRankingDebug");
              v52 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Client ranking: %f"), v51);
LABEL_51:
              v24 = (id)objc_claimAutoreleasedReturnValue(v52);
LABEL_53:
              v53 = objc_opt_class(MKLocalSearchCompletion);
              if ((objc_opt_isKindOfClass(v8, v53) & 1) != 0)
              {
                v54 = v8;
                if (v24)
                {
                  v55 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "stringByAppendingString:", CFSTR("; ")));

                }
                else
                {
                  v55 = &stru_1011EB268;
                }
                v24 = (id)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingFormat:](v55, "stringByAppendingFormat:", CFSTR("Server index = %lu:%lu"), objc_msgSend(v54, "serverSectionIndex"), objc_msgSend(v54, "serverItemIndexInSection")));

              }
              goto LABEL_59;
            }
            if (objc_msgSend(v50, "hasSortPriorityDebug"))
            {
              v52 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Priority: %ld"), objc_msgSend(v50, "sortPriorityDebug"));
              goto LABEL_51;
            }
          }
          v24 = 0;
          goto LABEL_53;
        }
        v19 = -[SearchDataSource canShowQueryAccelerator](self, "canShowQueryAccelerator");
        accessoryType = 2;
        if (!v19)
          accessoryType = 0;
      }
      v185 = accessoryType;
      goto LABEL_21;
    }
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[SearchNoResultsTableViewCell identifier](SearchNoResultsTableViewCell, "identifier"));
    v14 = (AcSearchResultTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v43, v7));

    -[AcSearchResultTableViewCell setDelegate:](v14, "setDelegate:", self);
    -[AcSearchResultTableViewCell setEnableStructuredRAPAffordance:](v14, "setEnableStructuredRAPAffordance:", -[SearchDataProvider shouldEnableRAPForNoResults](self->_searchDataProvider, "shouldEnableRAPForNoResults"));
    if (sub_1002A8AA0(v6) != 5)
    {
      objc_msgSend(v6, "frame");
      v44 = v45;
      goto LABEL_42;
    }
  }
  v44 = 40.0;
LABEL_42:
  LODWORD(v15) = 1144750080;
  -[AcSearchResultTableViewCell setHeightConstraint:withPriority:](v14, "setHeightConstraint:withPriority:", v44, v15);
LABEL_154:

  return v14;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v7, "row")
    && (-[SearchDataSource shouldShowNoResultsCell](self, "shouldShowNoResultsCell")
     || -[SearchDataSource shouldShowLoadingIndicator](self, "shouldShowLoadingIndicator")))
  {
    v9 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForRowAtIndexPath:", v7));
    v9 = !objc_msgSend(v8, "conformsToProtocol:", &OBJC_PROTOCOL___AutocompleteCellAccessoryView)
      || objc_msgSend(v8, "accessoryViewType") != (id)3;

  }
  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v16 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "row")
    || !-[SearchDataSource shouldShowNoResultsCell](self, "shouldShowNoResultsCell")
    && !-[SearchDataSource shouldShowLoadingIndicator](self, "shouldShowLoadingIndicator"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource autocompleteObjectAtIndexPath:](self, "autocompleteObjectAtIndexPath:", v6));
    if (v7)
    {
      v8 = objc_opt_class(MapsSuggestionsEntry);
      if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
        -[DataSource addEKAnalyticsForEntry:tapped:](self, "addEKAnalyticsForEntry:tapped:", v7, 1);
      -[SearchDataSource sendMapsSuggestionsInsightsAnalyticsWithEntry:](self, "sendMapsSuggestionsInsightsAnalyticsWithEntry:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource flattenedArray](self, "flattenedArray"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource flattenedIndexPath:](self, "flattenedIndexPath:", v6));
      -[SearchDataSource _sendAnalyticsForDataSelectedAtIndexPath:fromContent:](self, "_sendAnalyticsForDataSelectedAtIndexPath:fromContent:", v10, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataProvider sections](self->_searchDataProvider, "sections"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataProvider autocompleteContext](self->_searchDataProvider, "autocompleteContext"));
      -[SearchDataSource _sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:indexPathInSection:sections:context:](self, "_sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:indexPathInSection:sections:context:", v10, v6, v11, v12);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
      objc_msgSend(v13, "dataSource:itemTapped:", self, v7);

    }
    objc_msgSend(v16, "deselectRowAtIndexPath:animated:", v6, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "cellForRowAtIndexPath:", v6));
    if (objc_msgSend(v14, "conformsToProtocol:", &OBJC_PROTOCOL___AutocompleteCellAccessoryView))
    {
      v15 = v14;
      if (objc_msgSend(v15, "accessoryViewType") == (id)1)
        objc_msgSend(v15, "setAccessoryViewType:", 3);

    }
  }

}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v7, "row")
    && (-[SearchDataSource shouldShowNoResultsCell](self, "shouldShowNoResultsCell")
     || -[SearchDataSource shouldShowLoadingIndicator](self, "shouldShowLoadingIndicator")))
  {
    objc_msgSend(v6, "frame");
    v11 = v10;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource sectionAtIndex:](self, "sectionAtIndex:", objc_msgSend(v7, "section")));
    if (objc_msgSend(v8, "isQuerySuggestionsSection"))
    {
      +[QuerySuggestionTableViewCell estimatedCellHeight](QuerySuggestionTableViewCell, "estimatedCellHeight");
    }
    else if (-[SearchDataSource usePlaceSummary](self, "usePlaceSummary"))
    {
      +[PlaceSummaryTableViewCell autocompleteResultEstimatedHeight](_TtC4Maps25PlaceSummaryTableViewCell, "autocompleteResultEstimatedHeight");
    }
    else
    {
      +[TwoLinesTableViewCell cellHeight](TwoLinesTableViewCell, "cellHeight");
    }
    v11 = v9;

  }
  return v11;
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v7;
  void *v8;
  NSIndexPath *v9;
  NSIndexPath *lastSelectedIndexPath;
  id v11;

  v11 = a3;
  v7 = a4;
  if (sub_1002A8AA0(v11) == 5)
  {
    objc_msgSend(v11, "deselectRowAtIndexPath:animated:", self->_lastSelectedIndexPath, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nextFocusedIndexPath"));
    objc_msgSend(v11, "selectRowAtIndexPath:animated:scrollPosition:", v8, 0, 0);

  }
  v9 = (NSIndexPath *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nextFocusedIndexPath"));
  lastSelectedIndexPath = self->_lastSelectedIndexPath;
  self->_lastSelectedIndexPath = v9;

}

- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4
{
  return sub_1002A8AA0(a3) == 5;
}

- (id)analyticsContext
{
  return -[SearchDataProvider autocompleteContext](self->_searchDataProvider, "autocompleteContext");
}

- (id)_contentFilteredIfNeeded
{
  id *p_filteredContent;
  NSArray *filteredContent;
  NSArray *v4;
  void *v6;
  void *v7;
  char v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v22;
  id obj;
  void *v24;
  _QWORD v25[5];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  p_filteredContent = (id *)&self->_filteredContent;
  filteredContent = self->_filteredContent;
  if (filteredContent)
  {
    v4 = filteredContent;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataProvider sections](self->_searchDataProvider, "sections"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    v8 = objc_opt_respondsToSelector(v7, "searchDataSource:shouldFilterItem:");

    if ((v8 & 1) != 0)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v6, "count")));
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v22 = v6;
      obj = v6;
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v27 != v11)
              objc_enumerationMutation(obj);
            v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "items"));
            v25[0] = _NSConcreteStackBlock;
            v25[1] = 3221225472;
            v25[2] = sub_1003DC588;
            v25[3] = &unk_1011B0CC8;
            v25[4] = self;
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v25));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "filteredArrayUsingPredicate:", v15));

            if (objc_msgSend(v16, "count"))
            {
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "title"));
              v18 = (void *)objc_claimAutoreleasedReturnValue(+[AutocompleteSection sectionWithTitle:items:isQuerySuggestionsSection:](AutocompleteSection, "sectionWithTitle:items:isQuerySuggestionsSection:", v17, v16, objc_msgSend(v13, "isQuerySuggestionsSection")));
              objc_msgSend(v24, "addObject:", v18);

            }
          }
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v10);
      }

      v19 = objc_msgSend(v24, "copy");
      v20 = *p_filteredContent;
      *p_filteredContent = v19;

      v6 = v22;
    }
    else
    {
      objc_storeStrong(p_filteredContent, v6);
    }
    v4 = (NSArray *)*p_filteredContent;

  }
  return v4;
}

- (void)_invalidateFilteredContent
{
  NSArray *filteredContent;

  filteredContent = self->_filteredContent;
  self->_filteredContent = 0;

}

- (int64_t)numberOfSections
{
  void *v4;
  id v5;

  if (-[SearchDataSource shouldShowNoResultsCell](self, "shouldShowNoResultsCell")
    || -[SearchDataSource shouldShowLoadingIndicator](self, "shouldShowLoadingIndicator"))
  {
    return 1;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource _contentFilteredIfNeeded](self, "_contentFilteredIfNeeded"));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  void *v6;
  void *v7;
  id v8;

  if (-[SearchDataSource shouldShowNoResultsCell](self, "shouldShowNoResultsCell")
    || -[SearchDataSource shouldShowLoadingIndicator](self, "shouldShowLoadingIndicator"))
  {
    return 1;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource sectionAtIndex:](self, "sectionAtIndex:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "items"));
  v8 = objc_msgSend(v7, "count");

  return (int64_t)v8;
}

- (void)didTapItemInChildItems:(id)a3 atIndexPath:(id)a4 forCell:(id)a5
{
  UITableView **p_contentTableView;
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  p_contentTableView = &self->_contentTableView;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_contentTableView);
  v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "indexPathForCell:", v9));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource flattenedIndexPath:](self, "flattenedIndexPath:", v21));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v10, "row")));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource flattenedArray](self, "flattenedArray"));
  -[SearchDataSource _sendAnalyticsForDataSelectedAtIndexPath:fromContent:childPlaceIndexPath:childItem:resultRefinement:containmentParent:tappableEntryIdentifier:tappedAccessoryViewType:](self, "_sendAnalyticsForDataSelectedAtIndexPath:fromContent:childPlaceIndexPath:childItem:resultRefinement:containmentParent:tappableEntryIdentifier:tappedAccessoryViewType:", v13, v15, v10, v14, 0, 0, 0, 0);

  v16 = objc_claimAutoreleasedReturnValue(-[SearchDataProvider sections](self->_searchDataProvider, "sections"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataProvider autocompleteContext](self->_searchDataProvider, "autocompleteContext"));
  -[SearchDataSource _sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:indexPathInSection:sections:context:selectedChildItemIndexPath:indexOfResultWithSelectedChildItem:](self, "_sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:indexPathInSection:sections:context:selectedChildItemIndexPath:indexOfResultWithSelectedChildItem:", v13, v21, v16, v17, v10, v21);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  LOBYTE(v16) = objc_opt_respondsToSelector(v18, "dataSource:itemTapped:childItemParent:");

  if ((v16 & 1) != 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataSource autocompleteObjectAtIndexPath:](self, "autocompleteObjectAtIndexPath:", v21));
    objc_msgSend(v19, "dataSource:itemTapped:childItemParent:", self, v14, v20);

  }
}

- (void)didTapOnReportAnIssue
{
  ReportASearchAutocompleteResult *v3;
  void *v4;
  void *v5;
  void *v6;
  ReportASearchAutocompleteResult *v7;

  -[AutocompleteAnalyticsManager addAPlaceTappedWithNumberOfResults:](self->_analyticsManager, "addAPlaceTappedWithNumberOfResults:", 0);
  v3 = [ReportASearchAutocompleteResult alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataProvider autocompleteContext](self->_searchDataProvider, "autocompleteContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "queryString"));
  v7 = -[ReportASearchAutocompleteResult initWithTitle:](v3, "initWithTitle:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  objc_msgSend(v6, "dataSource:itemTapped:", self, v7);

}

- (id)flattenedIndexPath:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (char *)objc_msgSend(v4, "row");
  if ((uint64_t)objc_msgSend(v4, "section") >= 1)
  {
    v6 = 0;
    do
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
      v5 = &v5[-[SearchDataSource tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v7, v6)];

      ++v6;
    }
    while ((uint64_t)objc_msgSend(v4, "section") > v6);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v5, 0));

  return v8;
}

- (id)flattenedArray
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataProvider sections](self->_searchDataProvider, "sections", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8), "items"));
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = objc_msgSend(v3, "copy");
  return v10;
}

- (void)_sendAnalyticsForDataSelectedAtIndexPath:(id)a3 fromContent:(id)a4
{
  -[SearchDataSource _sendAnalyticsForDataSelectedAtIndexPath:fromContent:childPlaceIndexPath:childItem:resultRefinement:containmentParent:tappableEntryIdentifier:tappedAccessoryViewType:](self, "_sendAnalyticsForDataSelectedAtIndexPath:fromContent:childPlaceIndexPath:childItem:resultRefinement:containmentParent:tappableEntryIdentifier:tappedAccessoryViewType:", a3, a4, 0, 0, 0, 0, 0, 0);
}

- (void)_sendAnalyticsForDataSelectedAtIndexPath:(id)a3 fromContent:(id)a4 childPlaceIndexPath:(id)a5 childItem:(id)a6 resultRefinement:(id)a7 containmentParent:(id)a8 tappableEntryIdentifier:(id)a9 tappedAccessoryViewType:(int64_t)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  NSString *searchText;
  void *v32;
  void *v33;
  void *v34;
  unsigned int v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  AutocompleteAnalyticsManager *analyticsManager;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  unsigned int v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  void *v56;
  void *v57;
  unsigned int v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  AutocompleteAnalyticsManager *v65;
  void *v66;
  id v67;
  id v68;
  id v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  AutocompleteAnalyticsManager *v77;
  void *v78;
  id v79;
  id v80;
  id v81;
  void *v82;
  AutocompleteAnalyticsManager *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  id v95;
  uint8_t buf[4];
  id v97;
  __int16 v98;
  id v99;
  __int16 v100;
  NSString *v101;
  __int16 v102;
  void *v103;
  __int16 v104;
  id v105;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v95 = a8;
  v21 = a9;
  v22 = objc_msgSend(v16, "row");
  if (v22 < objc_msgSend(v17, "count"))
  {
    v90 = v19;
    v91 = v21;
    v94 = v20;
    if (-[SearchDataProvider searchMode](self->_searchDataProvider, "searchMode") == 1)
    {
      v23 = 1;
    }
    else if (-[SearchDataProvider searchMode](self->_searchDataProvider, "searchMode") == 2)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
      v35 = objc_msgSend(v34, "conformsToProtocol:", &OBJC_PROTOCOL___GEOLogContextDelegate);

      if (v35)
      {
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
        if ((objc_opt_respondsToSelector(v36, "searchFieldTypeForAnalytics") & 1) != 0)
          v23 = (uint64_t)objc_msgSend(v36, "searchFieldTypeForAnalytics");
        else
          v23 = 2;

      }
      else
      {
        v23 = 2;
      }
    }
    else
    {
      v23 = 0;
    }
    v37 = objc_claimAutoreleasedReturnValue(+[MapsAnalyticsHelper analyticsResultsInfoArrayFromAutoCompleteResultsArray:selectedIndex:](MapsAnalyticsHelper, "analyticsResultsInfoArrayFromAutoCompleteResultsArray:selectedIndex:", v17, objc_msgSend(v16, "row")));
    v38 = (void *)v37;
    +[MapsAnalyticStateProvider updateSuggestionSearchInformation:searchText:searchIndex:searchfieldType:suggestionsAcSequenceNumber:](MapsAnalyticStateProvider, "updateSuggestionSearchInformation:searchText:searchIndex:searchfieldType:suggestionsAcSequenceNumber:", v37, self->_searchText, objc_msgSend(v16, "row"), v23, -[SearchDataProvider searchRequestAnalyticsSequenceNumber](self->_searchDataProvider, "searchRequestAnalyticsSequenceNumber"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v16, "row")));
    v40 = objc_opt_class(PersonalizedCompoundItem);
    if ((objc_opt_isKindOfClass(v39, v40) & 1) != 0)
    {
      v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "autocompleteObject"));

      v39 = (void *)v41;
    }
    v42 = objc_opt_class(ReportASearchAutocompleteResult);
    if ((objc_opt_isKindOfClass(v39, v42) & 1) != 0)
    {
      -[AutocompleteAnalyticsManager addAPlaceTappedWithNumberOfResults:](self->_analyticsManager, "addAPlaceTappedWithNumberOfResults:", objc_msgSend(v17, "count"));
LABEL_21:
      v33 = v19;
      v21 = v91;
LABEL_22:
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
      objc_msgSend(v43, "clearSuggestionsData");

      v20 = v94;
      goto LABEL_23;
    }
    if (v95)
    {
      -[AutocompleteAnalyticsManager containmentParentUnitTappedWithMuid:](self->_analyticsManager, "containmentParentUnitTappedWithMuid:", objc_msgSend(v95, "_muid"));
      goto LABEL_21;
    }
    v88 = (void *)v37;
    if (v94)
    {
      analyticsManager = self->_analyticsManager;
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "toggle"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "refinementKey"));
      -[AutocompleteAnalyticsManager resultRefinementTappedWithKey:](analyticsManager, "resultRefinementTappedWithKey:", v46);

      v33 = v19;
      v21 = v91;
LABEL_28:
      v38 = v88;
      goto LABEL_22;
    }
    v21 = v91;
    if (v91)
    {
      -[AutocompleteAnalyticsManager tappableEntryUnitTappedWithMuid:](self->_analyticsManager, "tappableEntryUnitTappedWithMuid:", objc_msgSend(v91, "muid"));
      v33 = v19;
      goto LABEL_28;
    }
    v33 = v19;
    if (v19)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "childItemAction"));

      if (v47)
      {
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "childItemAction"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "childItemAction"));
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "childActionTypeAsString:", objc_msgSend(v49, "childActionType")));

      }
      else
      {
        v50 = 0;
      }
      v21 = 0;
      v38 = v88;
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "childItemPlace"));
      LOBYTE(v84) = 0;
      -[DataSource sendAnalyticsForDataAtIndexPath:object:childPlaceIndexPath:childPlaceObject:action:eventValue:populateSearchTapEvent:](self, "sendAnalyticsForDataAtIndexPath:object:childPlaceIndexPath:childPlaceObject:action:eventValue:populateSearchTapEvent:", v16, v39, v18, v61, 2031, v50, v84);

      v62 = objc_opt_class(MKLocalSearchCompletion);
      if ((objc_opt_isKindOfClass(v39, v62) & 1) != 0)
      {
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "publisherResult"));
        v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "publisher"));

        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "childItemAction"));
        v89 = objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "guideLocation"));

        if (v93)
        {
          v65 = self->_analyticsManager;
          v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "identifier"));
          v67 = objc_msgSend(v66, "muid");
          v68 = objc_msgSend(v16, "row");
          v69 = v67;
          v33 = v90;
          -[AutocompleteAnalyticsManager publisherChildItemButtonTappedWithPublisherMuid:verticalIndex:](v65, "publisherChildItemButtonTappedWithPublisherMuid:verticalIndex:", v69, v68);

          v38 = v88;
          v70 = (void *)v89;
        }
        else
        {
          v70 = (void *)v89;
          if (v89)
          {
            -[AutocompleteAnalyticsManager guidesHomeChildItemButtonTappedWithVerticalIndex:](self->_analyticsManager, "guidesHomeChildItemButtonTappedWithVerticalIndex:", objc_msgSend(v16, "row"));
            v70 = (void *)v89;
          }
        }

      }
      goto LABEL_22;
    }
    v51 = objc_opt_class(MKSearchCompletion);
    v52 = 2007;
    if ((objc_opt_isKindOfClass(v39, v51) & 1) != 0)
    {
      if (objc_msgSend(v39, "entryTapBehavior") == (id)1)
        v52 = 2087;
      else
        v52 = 2007;
    }
    if (a10 == 2)
      v53 = 2032;
    else
      v53 = v52;
    v54 = objc_opt_class(MKLocalSearchCompletion);
    if ((objc_opt_isKindOfClass(v39, v54) & 1) != 0)
    {
      v55 = v39;
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "mapItem"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "_hikeAssociatedInfo"));
      v58 = objc_msgSend(v57, "hasEncryptedTourMuid");

      if (v58)
      {
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "mapItem"));
        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "_hikeAssociatedInfo"));
        v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v60, "encryptedTourMuid")));

      }
      else
      {
        v87 = 0;
      }
      v38 = v88;

      -[DataSource sendAnalyticsForDataAtIndexPath:object:action:eventValue:](self, "sendAnalyticsForDataAtIndexPath:object:action:eventValue:", v16, v39, v53, v87);
    }
    else
    {
      v87 = 0;
      v38 = v88;
      -[DataSource sendAnalyticsForDataAtIndexPath:object:action:eventValue:](self, "sendAnalyticsForDataAtIndexPath:object:action:eventValue:", v16, v39, v53, 0);
    }
    v71 = objc_opt_class(MKLocalSearchCompletion);
    v33 = 0;
    v21 = 0;
    if ((objc_opt_isKindOfClass(v39, v71) & 1) == 0)
    {
LABEL_60:

      goto LABEL_22;
    }
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "collectionResult"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "collection"));

    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "publisherResult"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "publisher"));

    if (v73)
    {
      v75 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
      v76 = objc_msgSend(v75, "collectionIsSaved:", v73);

      v77 = self->_analyticsManager;
      v85 = v73;
      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "collectionIdentifier"));
      v79 = objc_msgSend(v78, "muid");
      v80 = objc_msgSend(v16, "row");
      v81 = v79;
      v33 = v90;
      -[AutocompleteAnalyticsManager curatedCollectionTappedWithMUID:isCurrentlySaved:verticalIndex:](v77, "curatedCollectionTappedWithMUID:isCurrentlySaved:verticalIndex:", v81, v76, v80);
    }
    else
    {
      v82 = v86;
      if (!v86)
      {
LABEL_59:

        goto LABEL_60;
      }
      v85 = 0;
      v83 = self->_analyticsManager;
      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "identifier"));
      -[AutocompleteAnalyticsManager publisherTappedWithMuid:verticalIndex:](v83, "publisherTappedWithMuid:verticalIndex:", objc_msgSend(v78, "muid"), objc_msgSend(v16, "row"));
    }

    v38 = v88;
    v73 = v85;
    v82 = v86;
    goto LABEL_59;
  }
  v24 = sub_10043222C();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v26 = objc_msgSend(v16, "row");
    v92 = v16;
    v27 = v20;
    v28 = v26;
    v29 = objc_msgSend(v17, "count");
    v30 = v18;
    searchText = self->_searchText;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[ChildItemButton buttonTitleWithChildItem:](ChildItemButton, "buttonTitleWithChildItem:", v19));
    *(_DWORD *)buf = 134219010;
    v97 = v28;
    v20 = v27;
    v16 = v92;
    v98 = 2048;
    v99 = v29;
    v100 = 2112;
    v101 = searchText;
    v18 = v30;
    v102 = 2112;
    v103 = v32;
    v104 = 2048;
    v105 = objc_msgSend(v30, "row");
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Logging out of bounds tap. IndexPath %ld. Content count: %lu. Query: %@. ChildItem title: %@. ChildPlaceIndexPath: %ld", buf, 0x34u);

  }
  v33 = v19;
LABEL_23:

}

- (void)_sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:(id)a3 indexPathInSection:(id)a4 sections:(id)a5 context:(id)a6
{
  -[SearchDataSource _sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:indexPathInSection:sections:context:selectedChildItemIndexPath:indexOfResultWithSelectedChildItem:](self, "_sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:indexPathInSection:sections:context:selectedChildItemIndexPath:indexOfResultWithSelectedChildItem:", a3, a4, a5, a6, 0, 0);
}

- (void)_sendSessionlessAnalyticsForSelectedAtFlattenedIndexPath:(id)a3 indexPathInSection:(id)a4 sections:(id)a5 context:(id)a6 selectedChildItemIndexPath:(id)a7 indexOfResultWithSelectedChildItem:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  v32 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (v15)
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[SearchDataProvider autocompleteAnalyticsSuggestionsFromSections:context:selectedChildItemIndexPath:indexOfResultWithSelectedChildItem:](self->_searchDataProvider, "autocompleteAnalyticsSuggestionsFromSections:context:selectedChildItemIndexPath:indexOfResultWithSelectedChildItem:", v15, v16, v17, v18));
  else
    v29 = 0;
  v30 = v18;
  if (-[SearchDataProvider hasShowAutocompleteClientSource](self->_searchDataProvider, "hasShowAutocompleteClientSource"))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SearchDataProvider showAutocompleteClientSource](self->_searchDataProvider, "showAutocompleteClientSource")));
  }
  else
  {
    v26 = 0;
  }
  if (v32)
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v32, "row")));
  else
    v19 = 0;
  v31 = v17;
  v28 = v14;
  if (v14)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v14, "section")));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v14, "row")));
  }
  else
  {
    v21 = 0;
    v20 = 0;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "queryString"));
  v27 = v16;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "query"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "queryTerms"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SearchDataProvider lastRequestIsRetainQuery](self->_searchDataProvider, "lastRequestIsRetainQuery")));
  +[GEOAPPortal captureClientACSuggestionWithQuery:queryTokens:entries:selectedIndex:selectedSectionIndex:withinSectionSelectedIndex:isRetainedQuery:isRerankerTriggered:shouldDifferentiateClientAndServerResults:](GEOAPPortal, "captureClientACSuggestionWithQuery:queryTokens:entries:selectedIndex:selectedSectionIndex:withinSectionSelectedIndex:isRetainedQuery:isRerankerTriggered:shouldDifferentiateClientAndServerResults:", v22, v24, v29, v19, v20, v21, v25, 0, v26);

}

- (id)searchTextForAnalyics
{
  return self->_searchText;
}

- (int)targetForDragAnalytics
{
  return 11;
}

- (void)sendMapsSuggestionsInsightsAnalyticsWithEntry:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  __objc2_prot *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  unsigned int v14;
  id v15;
  id v16;
  __objc2_prot *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  unsigned int v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  id v34;

  v34 = a3;
  v3 = objc_opt_class(AddressBookAddress);
  if ((objc_opt_isKindOfClass(v34, v3) & 1) == 0)
  {
    v7 = v34;
    v8 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
    v9 = objc_opt_class(HistoryEntryRecentsItem);
    v10 = v7;
    if ((objc_opt_isKindOfClass(v10, v9) & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    if (v12
      && (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "historyEntry")),
          v14 = objc_msgSend(v13, "conformsToProtocol:", v8),
          v13,
          v14))
    {
      v15 = v10;
    }
    else
    {
      v15 = 0;
    }

    if (v15)
    {
      v16 = v10;
      v17 = &OBJC_PROTOCOL___MSPHistoryEntryPlaceDisplay;
      v18 = objc_opt_class(HistoryEntryRecentsItem);
      v19 = v16;
      if ((objc_opt_isKindOfClass(v19, v18) & 1) != 0)
        v20 = v19;
      else
        v20 = 0;
      v21 = v20;

      if (v21
        && (v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "historyEntry")),
            v23 = objc_msgSend(v22, "conformsToProtocol:", v17),
            v22,
            v23))
      {
        v24 = v19;
      }
      else
      {
        v24 = 0;
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "historyEntry"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "geoMapItem"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapItem _itemWithGeoMapItem:](MKMapItem, "_itemWithGeoMapItem:", v26));

    }
    else
    {
      v27 = objc_opt_class(MKLocalSearchCompletion);
      if ((objc_opt_isKindOfClass(v10, v27) & 1) != 0
        || (v28 = objc_opt_class(SearchResult), (objc_opt_isKindOfClass(v10, v28) & 1) != 0))
      {
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapItem"));
      }
      else
      {
        v4 = 0;
      }
    }
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_geoMapItem"));
    v6 = (void *)v29;
    if (v29)
    {
      v30 = MapsSuggestionsMapItemConvertIfNeeded(v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      if (v31)
      {
        v32 = sub_100B3A5D4();
        v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
        objc_msgSend(v33, "feedbackForMapItem:action:", v31, 1);

      }
    }
    goto LABEL_28;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "contact"));
  if (v4)
  {
    v5 = sub_100B3A5D4();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_msgSend(v6, "feedbackForContact:action:", v4, 1);
LABEL_28:

  }
}

- (SearchDataProvider)searchDataProvider
{
  return self->_searchDataProvider;
}

- (BOOL)showAddAccessory
{
  return self->_showAddAccessory;
}

- (void)setShowAddAccessory:(BOOL)a3
{
  self->_showAddAccessory = a3;
}

- (int64_t)accessoryType
{
  return self->_accessoryType;
}

- (void)setAccessoryType:(int64_t)a3
{
  self->_accessoryType = a3;
}

- (BOOL)canShowQueryAccelerator
{
  return self->_canShowQueryAccelerator;
}

- (void)setCanShowQueryAccelerator:(BOOL)a3
{
  self->_canShowQueryAccelerator = a3;
}

- (BOOL)showPlaceContext
{
  return self->_showPlaceContext;
}

- (void)setShowPlaceContext:(BOOL)a3
{
  self->_showPlaceContext = a3;
}

- (BOOL)usePlaceSummary
{
  return self->_usePlaceSummary;
}

- (void)setUsePlaceSummary:(BOOL)a3
{
  self->_usePlaceSummary = a3;
}

- (BOOL)searchAlongRoute
{
  return self->_searchAlongRoute;
}

- (void)setSearchAlongRoute:(BOOL)a3
{
  self->_searchAlongRoute = a3;
}

- (BOOL)isRoutePlanning
{
  return self->_routePlanning;
}

- (void)setRoutePlanning:(BOOL)a3
{
  self->_routePlanning = a3;
}

- (unint64_t)resultTypes
{
  return self->_resultTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchDataProvider, 0);
  objc_storeStrong((id *)&self->_placeSummaryAsyncDataManager, 0);
  objc_storeStrong((id *)&self->_placeSummaryTemplateViewModels, 0);
  objc_storeStrong((id *)&self->_lastSelectedIndexPath, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_filteredContent, 0);
  objc_destroyWeak((id *)&self->_contentTableView);
}

@end
