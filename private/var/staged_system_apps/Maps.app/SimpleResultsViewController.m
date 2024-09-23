@implementation SimpleResultsViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (SimpleResultsViewController)initWithShareDelegate:(id)a3
{
  return -[SimpleResultsViewController initWithShareDelegate:visualEffectDisabled:](self, "initWithShareDelegate:visualEffectDisabled:", a3, 0);
}

- (SimpleResultsViewController)initWithShareDelegate:(id)a3 visualEffectDisabled:(BOOL)a4
{
  id v5;
  SimpleResultsViewController *v6;
  SimpleResultsViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SimpleResultsViewController;
  v6 = -[SimpleResultsViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_shareDelegate, v5);
    v7->_displayDistance = 1;
  }

  return v7;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SimpleResultsViewController;
  -[ContaineeViewController viewDidLayoutSubviews](&v4, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController impressionsCalculator](self, "impressionsCalculator"));
  objc_msgSend(v3, "logImpressions");

}

- (void)didChangeLayout:(unint64_t)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SimpleResultsViewController;
  -[ContaineeViewController didChangeLayout:](&v5, "didChangeLayout:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController impressionsCalculator](self, "impressionsCalculator"));
  objc_msgSend(v4, "logImpressions");

}

- (void)didResignCurrent
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SimpleResultsViewController;
  -[ContaineeViewController didResignCurrent](&v4, "didResignCurrent");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController impressionsCalculator](self, "impressionsCalculator"));
  objc_msgSend(v3, "setActive:", 0);

}

- (void)didBecomeCurrent
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SimpleResultsViewController;
  -[ContaineeViewController didBecomeCurrent](&v7, "didBecomeCurrent");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController impressionsCalculator](self, "impressionsCalculator"));
  objc_msgSend(v3, "setActive:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController impressionsCalculator](self, "impressionsCalculator"));
  v5 = objc_msgSend(v4, "hasImpressionElements");

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController impressionsCalculator](self, "impressionsCalculator"));
    objc_msgSend(v6, "logImpressions");

  }
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SimpleResultsViewController;
  -[ContaineeViewController scrollViewDidScroll:](&v5, "scrollViewDidScroll:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController impressionsCalculator](self, "impressionsCalculator"));
  objc_msgSend(v4, "logImpressions");

}

- (void)setHeaderTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)updateTitle:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;
  NSString *title;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSString *v24;
  NSString *v25;
  NSString *v26;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource content](self->_resultsDataSource, "content"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objects"));
  v7 = objc_msgSend(v6, "count");

  if (sub_1002A8AA0(self) == 5)
  {
    title = self->_title;
    if (v3)
    {
      if (!title)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v10 = v9;
        v11 = CFSTR("Stops [Marzipan Cluster Card]");
LABEL_12:
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", v11, CFSTR("localized string not found"), 0));
        v25 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v17, v7));

        v14 = v25;
        goto LABEL_13;
      }
    }
    else if (!title)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v10 = v9;
      v11 = CFSTR("Places [Marzipan Cluster Card]");
      goto LABEL_12;
    }
    v14 = title;
LABEL_13:
    v26 = v14;
    -[SimpleResultTitleView setTitle:](self->_macResultsTitleView, "setTitle:", v14);
    goto LABEL_21;
  }
  if (v3)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Stops [Cluster Card]"), CFSTR("localized string not found"), 0));

    v24 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v7));
  }
  else
  {
    v15 = self->_title;
    if (v15)
    {
      v16 = v15;
      goto LABEL_16;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Places [Cluster Card]"), CFSTR("localized string not found"), 0));
    v24 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v18, v7));

  }
  v16 = v24;
LABEL_16:
  v26 = v16;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v16));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SearchInfo headerDisplayName](self->_originalSearchInfo, "headerDisplayName"));
  if (objc_msgSend(v20, "length") && -[SearchInfo isChainResults](self->_originalSearchInfo, "isChainResults"))
  {
    v21 = 0;
    v22 = v20;
    v23 = v19;
  }
  else
  {
    v23 = 0;
    v21 = 1;
    v22 = v19;
  }
  -[ResultsTitleView setTitle:](self->_resultsTitleView, "setTitle:", v22);
  -[ResultsTitleView setSubtitle:](self->_resultsTitleView, "setSubtitle:", v23);
  -[ResultsTitleView centerTitleVertically:](self->_resultsTitleView, "centerTitleVertically:", v21);

LABEL_21:
}

- (void)updatePreferredContentSize
{
  CGRect v3;

  if (sub_1002A8AA0(self) == 5)
  {
    -[UITableView contentSize](self->_tableView, "contentSize");
    -[ContainerHeaderView frame](self->_titleHeaderView, "frame");
    CGRectGetHeight(v3);
    -[ContaineeViewController macContaineeWidth](self, "macContaineeWidth");
    -[SimpleResultsViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  }
}

- (void)updateCurrentLocation:(id)a3 isClusterResult:(BOOL)a4
{
  objc_storeStrong((id *)&self->_approxLocation, a3);
  self->_isClusterResult = a4;
}

- (BOOL)containsMapItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VKLabelMarker clusterFeatureAnnotations](self->_cluster, "clusterFeatureAnnotations"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "searchResult", (_QWORD)v13));
        v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapItem"));

        if (v11 == v4)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v7;
}

- (void)setSearchResults:(id)a3 sortAlphabetically:(BOOL)a4 originalSearchInfo:(id)a5
{
  _BOOL4 v6;
  id v9;
  void *v10;
  void *v11;
  SearchInfo **p_originalSearchInfo;
  __objc2_class **v13;
  id v14;
  void *v15;
  SearchResultsDataSourceContent *v16;
  void *v17;
  void *v18;
  id v19;

  v6 = a4;
  v19 = a5;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController impressionsCalculator](self, "impressionsCalculator"));
  objc_msgSend(v11, "setSessionIdentifier:", v10);

  p_originalSearchInfo = &self->_originalSearchInfo;
  objc_storeStrong((id *)&self->_originalSearchInfo, a5);
  v13 = off_101195E18;
  if (!v6)
    v13 = off_101196DA0;
  v14 = objc_msgSend(objc_alloc(*v13), "initWithObjects:", v9);

  if (self->_cluster && self->_isClusterResult)
  {
    -[SearchResultsDataSource setApproxLocation:](self->_resultsDataSource, "setApproxLocation:", self->_approxLocation);
    -[SearchResultsDataSource setIsShowingClusterResults:](self->_resultsDataSource, "setIsShowingClusterResults:", self->_isClusterResult);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SearchInfo placeSummaryMetadata](*p_originalSearchInfo, "placeSummaryMetadata"));
  -[SearchResultsDataSource setPlaceSummaryMetadata:](self->_resultsDataSource, "setPlaceSummaryMetadata:", v15);

  v16 = -[SearchResultsDataSourceContent initWithOrderedDataSource:]([SearchResultsDataSourceContent alloc], "initWithOrderedDataSource:", v14);
  -[SearchResultsDataSource setContent:](self->_resultsDataSource, "setContent:", v16);

  -[SearchResultsDataSource setDisplaysAsChainResult:](self->_resultsDataSource, "setDisplaysAsChainResult:", -[SearchInfo isChainResults](*p_originalSearchInfo, "isChainResults"));
  -[SearchResultsDataSource setPrefersAddressOverCategory:](self->_resultsDataSource, "setPrefersAddressOverCategory:", -[SearchInfo prefersAddressOverCategory](*p_originalSearchInfo, "prefersAddressOverCategory"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController impressionsCalculator](self, "impressionsCalculator"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "sessionIdentifier"));
  -[SearchResultsDataSource setImpressionsSessionIdentifier:](self->_resultsDataSource, "setImpressionsSessionIdentifier:", v18);

  -[SimpleResultsViewController updateTitle:](self, "updateTitle:", 0);
}

- (void)clearCluster
{
  -[SimpleResultsViewController setCluster:sortAlphabetically:originalSearchInfo:](self, "setCluster:sortAlphabetically:originalSearchInfo:", 0, 0, 0);
}

- (void)_updatePopoverCoordinate
{
  void *v3;
  id v4;
  double v5;
  CLLocationDegrees v6;
  CLLocationDegrees v7;
  CLLocationCoordinate2D v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == (id)5)
  {
    -[VKLabelMarker coordinate](self->_cluster, "coordinate");
    v6 = v5;
    -[VKLabelMarker coordinate](self->_cluster, "coordinate");
    v8 = CLLocationCoordinate2DMake(v6, v7);
    v9 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController macPopoverPresentationController](self, "macPopoverPresentationController"));
    objc_msgSend(v9, "setCoordinate:", v8.latitude, v8.longitude);

  }
}

- (void)setCluster:(id)a3 sortAlphabetically:(BOOL)a4 originalSearchInfo:(id)a5
{
  _BOOL4 v6;
  VKLabelMarker *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  uint64_t v20;
  void *v21;
  SearchResultsDataSource *resultsDataSource;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v6 = a4;
  v9 = (VKLabelMarker *)a3;
  v10 = a5;
  v11 = v10;
  if (self->_cluster != v9)
  {
    v24 = v10;
    objc_storeStrong((id *)&self->_cluster, a3);
    -[SimpleResultsViewController _updatePopoverCoordinate](self, "_updatePopoverCoordinate");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[VKLabelMarker clusterFeatureAnnotations](self->_cluster, "clusterFeatureAnnotations"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v12, "count")));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v14 = v12;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v19, "searchResult") & 1) != 0)
          {
            v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "searchResult"));
            if (v20)
            {
              v21 = (void *)v20;
              objc_msgSend(v13, "addObject:", v20);

            }
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v16);
    }

    v11 = v24;
    -[SimpleResultsViewController setSearchResults:sortAlphabetically:originalSearchInfo:](self, "setSearchResults:sortAlphabetically:originalSearchInfo:", v13, v6, v24);
    if (v9)
    {
      resultsDataSource = self->_resultsDataSource;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource impressionsSessionIdentifier](resultsDataSource, "impressionsSessionIdentifier"));
      +[SearchResultsAnalyticsManager didShowClusterWithDataSource:impressionsSessionIdentifier:](SearchResultsAnalyticsManager, "didShowClusterWithDataSource:impressionsSessionIdentifier:", resultsDataSource, v23);

    }
  }

}

- (void)setCluster:(id)a3 sortAlphabetically:(BOOL)a4 originalSearchInfo:(id)a5 searchResults:(id)a6
{
  _BOOL8 v8;
  VKLabelMarker *v11;
  id v12;
  id v13;
  SearchResultsDataSource *resultsDataSource;
  void *v15;
  VKLabelMarker *v16;

  v8 = a4;
  v11 = (VKLabelMarker *)a3;
  if (self->_cluster != v11)
  {
    v16 = v11;
    objc_storeStrong((id *)&self->_cluster, a3);
    v12 = a6;
    v13 = a5;
    -[SimpleResultsViewController setSearchResults:sortAlphabetically:originalSearchInfo:](self, "setSearchResults:sortAlphabetically:originalSearchInfo:", v12, v8, v13);

    if (v16)
    {
      resultsDataSource = self->_resultsDataSource;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource impressionsSessionIdentifier](resultsDataSource, "impressionsSessionIdentifier"));
      +[SearchResultsAnalyticsManager didShowClusterWithDataSource:impressionsSessionIdentifier:](SearchResultsAnalyticsManager, "didShowClusterWithDataSource:impressionsSessionIdentifier:", resultsDataSource, v15);

    }
    -[SimpleResultsViewController updateTitle:](self, "updateTitle:", 1);
    v11 = v16;
  }

}

- (void)setDisplayDistance:(BOOL)a3
{
  if (self->_displayDistance != a3)
  {
    self->_displayDistance = a3;
    -[SearchResultsDataSource setDisplayDistance:](self->_resultsDataSource, "setDisplayDistance:");
  }
}

- (void)setSearchResults:(id)a3
{
  -[SimpleResultsViewController setSearchResults:sortAlphabetically:originalSearchInfo:](self, "setSearchResults:sortAlphabetically:originalSearchInfo:", a3, 0, 0);
}

- (void)setIsPresentingSearchAlongTheRouteResults:(BOOL)a3
{
  id v4;
  void *v5;
  id v6;

  self->_isPresentingSearchAlongTheRouteResults = a3;
  -[SearchResultsDataSource setIsPresentingSearchAlongTheRouteResults:](self->_resultsDataSource, "setIsPresentingSearchAlongTheRouteResults:");
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v4 = objc_msgSend(v6, "containerStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController traitCollection](self, "traitCollection"));
  -[SimpleResultsViewController _updateHeaderWithContainerStyle:traitCollection:](self, "_updateHeaderWithContainerStyle:traitCollection:", v4, v5);

}

- (void)setSearchAlongTheRouteCellDelegate:(id)a3
{
  SARSearchResultTableViewCellDelegate **p_searchAlongTheRouteCellDelegate;
  id v5;

  p_searchAlongTheRouteCellDelegate = &self->_searchAlongTheRouteCellDelegate;
  v5 = a3;
  objc_storeWeak((id *)p_searchAlongTheRouteCellDelegate, v5);
  -[SearchResultsDataSource setSearchAlongTheRouteCellDelegate:](self->_resultsDataSource, "setSearchAlongTheRouteCellDelegate:", v5);

}

- (void)_updateHeaderWithContainerStyle:(unint64_t)a3 traitCollection:(id)a4
{
  double v6;
  uint64_t v7;
  id v8;

  v8 = a4;
  -[ContainerHeaderView setShouldCenterButtonVertically:](self->_titleHeaderView, "setShouldCenterButtonVertically:", -[SimpleResultsViewController isPresentingSearchAlongTheRouteResults](self, "isPresentingSearchAlongTheRouteResults"));
  if (-[SimpleResultsViewController isPresentingSearchAlongTheRouteResults](self, "isPresentingSearchAlongTheRouteResults"))
  {
    -[SimpleResultsViewController _searchAlongRouteHeaderHeightForStyle:traitCollection:](self, "_searchAlongRouteHeaderHeightForStyle:traitCollection:", a3, v8);
  }
  else
  {
    v7 = sub_1002A8AA0(self);
    v6 = 68.0;
    if (v7 == 5)
      v6 = 54.0;
  }
  -[NSLayoutConstraint setConstant:](self->_titleHeaderViewHeightConstraint, "setConstant:", v6);

}

- (double)_searchAlongRouteHeaderHeightForStyle:(unint64_t)a3 traitCollection:(id)a4
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  if (sub_1006E6664(a3, a4))
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[ModalCardHeaderConfiguration navigationModalCardHeaderCompactConfiguration](ModalCardHeaderConfiguration, "navigationModalCardHeaderCompactConfiguration"));
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[ModalCardHeaderConfiguration navigationModalCardHeaderConfiguration](ModalCardHeaderConfiguration, "navigationModalCardHeaderConfiguration"));
  v5 = v4;
  objc_msgSend(v4, "topToTitleBaselineUnscaledDistance");
  v7 = v6;
  objc_msgSend(v5, "baselineToBottomDistance");
  v9 = v7 + v8;

  return v9;
}

- (void)setIsPresentingVenueClusterResults:(BOOL)a3
{
  self->_isPresentingVenueClusterResults = a3;
  -[SearchResultsDataSource setIsPresentingVenueClusterResults:](self->_resultsDataSource, "setIsPresentingVenueClusterResults:");
}

- (void)dataSourceUpdated:(id)a3
{
  -[UITableView reloadData](self->_tableView, "reloadData", a3);
  -[UITableView layoutIfNeeded](self->_tableView, "layoutIfNeeded");
  -[SimpleResultsViewController updateTitle:](self, "updateTitle:", 0);
  -[SimpleResultsViewController updatePreferredContentSize](self, "updatePreferredContentSize");
}

- (void)dataSource:(id)a3 itemFocused:(id)a4
{
  uint64_t v5;
  void *v6;
  id lastItemTapped;
  id v8;

  v8 = a4;
  if (sub_1002A8AA0(self) != 5)
  {
    v5 = objc_opt_class(SearchResult);
    if ((objc_opt_isKindOfClass(v8, v5) & 1) != 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController coordinator](self, "coordinator"));
      objc_msgSend(v6, "viewController:focusSearchResult:", self, v8);

      lastItemTapped = self->_lastItemTapped;
      self->_lastItemTapped = 0;
LABEL_6:

      goto LABEL_7;
    }
    if (!self->_lastItemTapped)
    {
      lastItemTapped = (id)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController coordinator](self, "coordinator"));
      objc_msgSend(lastItemTapped, "viewControllerRemoveSearchResultFocus:", self);
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = objc_opt_class(SearchResult);
  if ((objc_opt_isKindOfClass(v8, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController resultsDelegate](self, "resultsDelegate"));
    objc_msgSend(v7, "simpleResultsViewContoller:selectSearchResult:", self, v8);

    -[SimpleResultsViewController _captureTapActionWithSearchResult:](self, "_captureTapActionWithSearchResult:", v8);
    objc_storeStrong(&self->_lastItemTapped, a4);
  }

}

- (void)searchDataSource:(id)a3 didTapOnPlaceContextWithViewModel:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  v5 = objc_msgSend(v9, "type");
  if (v5 == (id)3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController resultsDelegate](self, "resultsDelegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userGeneratedCollection"));
    objc_msgSend(v6, "simpleResultsViewContoller:showUserGeneratedCollection:", self, v7);
    goto LABEL_7;
  }
  if (v5 == (id)2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController resultsDelegate](self, "resultsDelegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "placeCollections"));
    objc_msgSend(v6, "simpleResultsViewContoller:showCuratedCollectionsList:title:", self, v7, 0);
    goto LABEL_7;
  }
  if (v5 == (id)1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController resultsDelegate](self, "resultsDelegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "placeCollections"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
    objc_msgSend(v6, "simpleResultsViewContoller:showCuratedCollection:", self, v8);

LABEL_7:
  }

}

- (void)didTapOnUserGeneratedGuide:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController resultsDelegate](self, "resultsDelegate"));
  v5 = objc_opt_respondsToSelector(v4, "simpleResultsViewContoller:showUserGeneratedCollection:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController resultsDelegate](self, "resultsDelegate"));
    objc_msgSend(v6, "simpleResultsViewContoller:showUserGeneratedCollection:", self, v7);

  }
}

- (void)didTapOnCuratedGuide:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController resultsDelegate](self, "resultsDelegate"));
  v5 = objc_opt_respondsToSelector(v4, "simpleResultsViewContoller:showCuratedCollection:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController resultsDelegate](self, "resultsDelegate"));
    objc_msgSend(v6, "simpleResultsViewContoller:showCuratedCollection:", self, v7);

  }
}

- (void)didTapOnCuratedGuides:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController resultsDelegate](self, "resultsDelegate"));
  v5 = objc_opt_respondsToSelector(v4, "simpleResultsViewContoller:showCuratedCollectionsList:title:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController resultsDelegate](self, "resultsDelegate"));
    objc_msgSend(v6, "simpleResultsViewContoller:showCuratedCollectionsList:title:", self, v7, 0);

  }
}

- (void)didTapOnDirectionsWithSearchResult:(id)a3
{
  id v4;
  void *v5;
  char v6;
  SearchFieldItem *v7;
  void *v8;
  void *v9;
  DirectionItem *v10;
  void *v11;
  DirectionItem *v12;
  void *v13;
  _QWORD v14[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController resultsDelegate](self, "resultsDelegate"));
  v6 = objc_opt_respondsToSelector(v5, "simpleResultsViewContoller:selectDirectionItem:");

  if ((v6 & 1) != 0)
  {
    v7 = objc_alloc_init(SearchFieldItem);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
    -[SearchFieldItem setSearchResult:](v7, "setSearchResult:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v4));
    v10 = [DirectionItem alloc];
    v14[0] = v7;
    v14[1] = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
    v12 = -[DirectionItem initWithItems:ignoreMapType:transportType:](v10, "initWithItems:ignoreMapType:transportType:", v11, 0, 0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController resultsDelegate](self, "resultsDelegate"));
    objc_msgSend(v13, "simpleResultsViewContoller:selectDirectionItem:", self, v12);

  }
}

- (void)didTapOnLookAroundWithSearchResult:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController resultsDelegate](self, "resultsDelegate"));
  v5 = objc_opt_respondsToSelector(v4, "simpleResultsViewContoller:didTapOnLookAroundWithSearchResult:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController resultsDelegate](self, "resultsDelegate"));
    objc_msgSend(v6, "simpleResultsViewContoller:didTapOnLookAroundWithSearchResult:", self, v7);

  }
}

- (void)didTapOnCallWithSearchResult:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController resultsDelegate](self, "resultsDelegate"));
  v5 = objc_opt_respondsToSelector(v4, "simpleResultsViewContoller:didTapOnCallWithSearchResult:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController resultsDelegate](self, "resultsDelegate"));
    objc_msgSend(v6, "simpleResultsViewContoller:didTapOnCallWithSearchResult:", self, v7);

  }
}

- (void)didTapOnWebsiteWithSearchResult:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController resultsDelegate](self, "resultsDelegate"));
  v5 = objc_opt_respondsToSelector(v4, "simpleResultsViewContoller:didTapOnWebsiteWithSearchResult:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController resultsDelegate](self, "resultsDelegate"));
    objc_msgSend(v6, "simpleResultsViewContoller:didTapOnWebsiteWithSearchResult:", self, v7);

  }
}

- (void)didTapOnFlyoverWithSearchResult:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController resultsDelegate](self, "resultsDelegate"));
  v5 = objc_opt_respondsToSelector(v4, "simpleResultsViewContoller:didTapOnFlyoverWithSearchResult:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController resultsDelegate](self, "resultsDelegate"));
    objc_msgSend(v6, "simpleResultsViewContoller:didTapOnFlyoverWithSearchResult:", self, v7);

  }
}

- (void)didTapOnContainmentParentMapItem:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController resultsDelegate](self, "resultsDelegate"));
  v5 = objc_opt_respondsToSelector(v4, "simpleResultsViewContoller:selectContainmentParentMapItem:resultsList:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController resultsDelegate](self, "resultsDelegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchInfo results](self->_originalSearchInfo, "results"));
    objc_msgSend(v6, "simpleResultsViewContoller:selectContainmentParentMapItem:resultsList:", self, v8, v7);

  }
}

- (void)didTapOnTappableEntry:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController resultsDelegate](self, "resultsDelegate"));
  v5 = objc_opt_respondsToSelector(v4, "simpleResultsViewContoller:selectTappableEntry:resultsList:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController resultsDelegate](self, "resultsDelegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchInfo results](self->_originalSearchInfo, "results"));
    objc_msgSend(v6, "simpleResultsViewContoller:selectTappableEntry:resultsList:", self, v8, v7);

  }
}

- (void)didTapOnAddStopWithSearchResult:(id)a3 atIndexPath:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController resultsDelegate](self, "resultsDelegate"));
  v6 = objc_opt_respondsToSelector(v5, "simpleResultsViewContoller:didStapOnAddStopWithSearchResult:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController resultsDelegate](self, "resultsDelegate"));
    objc_msgSend(v7, "simpleResultsViewContoller:didStapOnAddStopWithSearchResult:", self, v8);

  }
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  objc_super v10;
  uint8_t buf[4];
  SimpleResultsViewController *v12;
  __int16 v13;
  id v14;

  v5 = a3;
  v6 = sub_10043222C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10.receiver = self;
    v10.super_class = (Class)SimpleResultsViewController;
    v8 = -[SimpleResultsViewController class](&v10, "class");
    *(_DWORD *)buf = 138412546;
    v12 = self;
    v13 = 2112;
    v14 = v8;
    v9 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Header view close button tapped. Self : %@, Super class: %@", buf, 0x16u);

  }
  -[SimpleResultsViewController handleDismissAction:](self, "handleDismissAction:", v5);

}

- (void)viewDidLoad
{
  void *v3;
  ContainerHeaderView *v4;
  double y;
  double width;
  double height;
  ContainerHeaderView *v8;
  ContainerHeaderView *titleHeaderView;
  SimpleResultTitleView *v10;
  _QWORD *p_macResultsTitleView;
  SimpleResultTitleView *macResultsTitleView;
  ResultsTitleView *v13;
  ResultsTitleView *resultsTitleView;
  int IsEnabled_SearchAndDiscovery;
  double v16;
  MapsThemeTableView *v17;
  UITableView *tableView;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSLayoutConstraint *v23;
  NSLayoutConstraint *titleHeaderViewHeightConstraint;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  SearchResultsDataSource *v35;
  SearchResultsDataSource *resultsDataSource;
  id WeakRetained;
  void *v38;
  uint64_t v39;
  void *v40;
  unsigned int v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
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
  objc_super v60;
  _QWORD v61[8];

  v60.receiver = self;
  v60.super_class = (Class)SimpleResultsViewController;
  -[ContaineeViewController viewDidLoad](&v60, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("SimpleResultsView"));
  v4 = [ContainerHeaderView alloc];
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v8 = -[ContainerHeaderView initWithFrame:](v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  titleHeaderView = self->_titleHeaderView;
  self->_titleHeaderView = v8;

  -[ContainerHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_titleHeaderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ContainerHeaderView setDelegate:](self->_titleHeaderView, "setDelegate:", self);
  objc_msgSend(v3, "addSubview:", self->_titleHeaderView);
  if (sub_1002A8AA0(self) == 5)
  {
    -[ContainerHeaderView setButtonHidden:](self->_titleHeaderView, "setButtonHidden:", 1);
    -[ContainerHeaderView setHairLineAlpha:](self->_titleHeaderView, "setHairLineAlpha:", 0.0);
    v10 = -[SimpleResultTitleView initWithFrame:]([SimpleResultTitleView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    p_macResultsTitleView = &self->_macResultsTitleView;
    macResultsTitleView = self->_macResultsTitleView;
    self->_macResultsTitleView = v10;

    -[SimpleResultTitleView setTranslatesAutoresizingMaskIntoConstraints:](self->_macResultsTitleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }
  else
  {
    v13 = -[ResultsTitleView initWithFrame:]([ResultsTitleView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    p_macResultsTitleView = &self->_resultsTitleView;
    resultsTitleView = self->_resultsTitleView;
    self->_resultsTitleView = v13;

    -[ResultsTitleView setTranslatesAutoresizingMaskIntoConstraints:](self->_resultsTitleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    IsEnabled_SearchAndDiscovery = MapsFeature_IsEnabled_SearchAndDiscovery(-[ResultsTitleView setEditButtonHidden:](self->_resultsTitleView, "setEditButtonHidden:", 1));
    v16 = 1.0;
    if (IsEnabled_SearchAndDiscovery)
      v16 = 0.0;
    -[ContainerHeaderView setHairLineAlpha:](self->_titleHeaderView, "setHairLineAlpha:", v16);
  }
  -[ContainerHeaderView setTitleView:](self->_titleHeaderView, "setTitleView:", *p_macResultsTitleView);
  v17 = -[MapsThemeTableView initWithFrame:]([MapsThemeTableView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  tableView = self->_tableView;
  self->_tableView = &v17->super;

  -[UITableView setAccessibilityIdentifier:](self->_tableView, "setAccessibilityIdentifier:", CFSTR("SimpleResultsTableView"));
  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UITableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v19);

  -[UITableView setSectionHeaderTopPadding:](self->_tableView, "setSectionHeaderTopPadding:", 0.0);
  objc_msgSend(v3, "addSubview:", self->_tableView);
  v20 = sub_1002A8AA0(self);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView heightAnchor](self->_titleHeaderView, "heightAnchor"));
  v22 = v21;
  if (v20 == 5)
    v23 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToConstant:", 54.0));
  else
    v23 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintGreaterThanOrEqualToConstant:", 54.0));
  titleHeaderViewHeightConstraint = self->_titleHeaderViewHeightConstraint;
  self->_titleHeaderViewHeightConstraint = v23;

  if (sub_1002A8AA0(self) == 5)
    v25 = 10.0;
  else
    v25 = 0.0;
  v61[0] = self->_titleHeaderViewHeightConstraint;
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView topAnchor](self->_titleHeaderView, "topAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:", v57));
  v61[1] = v56;
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView leadingAnchor](self->_titleHeaderView, "leadingAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:", v54));
  v61[2] = v53;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView trailingAnchor](self->_titleHeaderView, "trailingAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v51));
  v61[3] = v50;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView leadingAnchor](self->_tableView, "leadingAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:constant:", v48, v25));
  v61[4] = v47;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView trailingAnchor](self->_tableView, "trailingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v45));
  v61[5] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView topAnchor](self->_tableView, "topAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView bottomAnchor](self->_titleHeaderView, "bottomAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v28));
  v61[6] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView bottomAnchor](self->_tableView, "bottomAnchor"));
  v59 = v3;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, -16.0));
  v61[7] = v32;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v61, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController view](self, "view"));
  objc_msgSend(v34, "layoutIfNeeded");

  v35 = -[SearchResultsDataSource initWithTableView:]([SearchResultsDataSource alloc], "initWithTableView:", self->_tableView);
  resultsDataSource = self->_resultsDataSource;
  self->_resultsDataSource = v35;

  -[DataSource setActive:](self->_resultsDataSource, "setActive:", 1);
  -[DataSource setDelegate:](self->_resultsDataSource, "setDelegate:", self);
  -[SearchResultsDataSource setDisplayDistance:](self->_resultsDataSource, "setDisplayDistance:", self->_displayDistance);
  WeakRetained = objc_loadWeakRetained((id *)&self->_shareDelegate);
  -[SearchResultsDataSource setShareDelegate:](self->_resultsDataSource, "setShareDelegate:", WeakRetained);

  -[SearchResultsDataSource setIsPresentingSearchAlongTheRouteResults:](self->_resultsDataSource, "setIsPresentingSearchAlongTheRouteResults:", -[SimpleResultsViewController isPresentingSearchAlongTheRouteResults](self, "isPresentingSearchAlongTheRouteResults"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController searchAlongTheRouteCellDelegate](self, "searchAlongTheRouteCellDelegate"));
  -[SearchResultsDataSource setSearchAlongTheRouteCellDelegate:](self->_resultsDataSource, "setSearchAlongTheRouteCellDelegate:", v38);

  -[SearchResultsDataSource setIsPresentingVenueClusterResults:](self->_resultsDataSource, "setIsPresentingVenueClusterResults:", -[SimpleResultsViewController isPresentingVenueClusterResults](self, "isPresentingVenueClusterResults"));
  if (sub_1008974F8()
    && !-[SimpleResultsViewController isPresentingSearchAlongTheRouteResults](self, "isPresentingSearchAlongTheRouteResults"))
  {
    v39 = -[SimpleResultsViewController isPresentingVenueClusterResults](self, "isPresentingVenueClusterResults") ^ 1;
  }
  else
  {
    v39 = 0;
  }
  -[SearchResultsDataSource setUsePlaceSummary:](self->_resultsDataSource, "setUsePlaceSummary:", v39);
  if (sub_1002A8AA0(self) == 5)
    -[SearchResultsDataSource setIsSimpleSearchResults:](self->_resultsDataSource, "setIsSimpleSearchResults:", 1);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self->_resultsDataSource);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self->_resultsDataSource);
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[MapsDragAndDropManager sharedManager](MapsDragAndDropManager, "sharedManager"));
  v41 = objc_msgSend(v40, "deviceSupportsDragAndDrop");

  if (v41)
    -[UITableView setDragDelegate:](self->_tableView, "setDragDelegate:", self->_resultsDataSource);
  -[UITableView reloadData](self->_tableView, "reloadData");
  -[SimpleResultsViewController updateTitle:](self, "updateTitle:", 0);
  -[SimpleResultsViewController updatePreferredContentSize](self, "updatePreferredContentSize");
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v43 = objc_msgSend(v42, "containerStyle");
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController traitCollection](self, "traitCollection"));
  -[SimpleResultsViewController _updateHeaderWithContainerStyle:traitCollection:](self, "_updateHeaderWithContainerStyle:traitCollection:", v43, v44);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  SearchResultQuickActionMenuPresenter *v7;
  SearchResultQuickActionMenuPresenter *quickActionMenuPresenter;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SimpleResultsViewController;
  -[ContaineeViewController viewWillAppear:](&v9, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v5 = objc_msgSend(v4, "containerStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController traitCollection](self, "traitCollection"));
  -[SimpleResultsViewController _updateHeaderWithContainerStyle:traitCollection:](self, "_updateHeaderWithContainerStyle:traitCollection:", v5, v6);

  if (!self->_quickActionMenuPresenter)
  {
    v7 = -[SearchResultQuickActionMenuPresenter initWithTableView:]([SearchResultQuickActionMenuPresenter alloc], "initWithTableView:", self->_tableView);
    quickActionMenuPresenter = self->_quickActionMenuPresenter;
    self->_quickActionMenuPresenter = v7;

    -[QuickActionMenuPresenter setDelegate:](self->_quickActionMenuPresenter, "setDelegate:", self);
  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SimpleResultsViewController;
  v6 = a3;
  -[SimpleResultsViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v8, "willTransitionToTraitCollection:withTransitionCoordinator:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController", v8.receiver, v8.super_class));
  -[SimpleResultsViewController _updateHeaderWithContainerStyle:traitCollection:](self, "_updateHeaderWithContainerStyle:traitCollection:", objc_msgSend(v7, "containerStyle"), v6);

}

- (id)headerView
{
  return self->_titleHeaderView;
}

- (void)applyAlphaToContent:(double)a3
{
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SimpleResultsViewController;
  -[ContaineeViewController applyAlphaToContent:](&v6, "applyAlphaToContent:");
  v5 = sub_1002A8AA0(self);
  if (v5 != 5 && (MapsFeature_IsEnabled_SearchAndDiscovery(v5) & 1) == 0)
    -[ContainerHeaderView setHairLineAlpha:](self->_titleHeaderView, "setHairLineAlpha:", a3);
}

- (id)contentView
{
  return self->_tableView;
}

- (void)willBecomeCurrent:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SimpleResultsViewController;
  -[ContaineeViewController willBecomeCurrent:](&v5, "willBecomeCurrent:", a3);
  if (self->_cluster)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController resultsDelegate](self, "resultsDelegate"));
    objc_msgSend(v4, "simpleResultsViewContoller:selectClusteredLabelMarker:", self, self->_cluster);

  }
}

- (void)willChangeContainerStyle:(unint64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SimpleResultsViewController;
  -[ContaineeViewController willChangeContainerStyle:](&v6, "willChangeContainerStyle:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController traitCollection](self, "traitCollection"));
  -[SimpleResultsViewController _updateHeaderWithContainerStyle:traitCollection:](self, "_updateHeaderWithContainerStyle:traitCollection:", a3, v5);

}

- (double)heightForLayout:(unint64_t)a3
{
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double result;
  double v11;
  double v12;
  double v13;
  CGRect v14;

  if (a3 - 3 < 2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v8, "availableHeight");
    v4 = v9;

    return v4;
  }
  if (a3 != 2)
  {
    v4 = -1.0;
    if (a3 == 1)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v5, "bottomSafeOffset");
      v7 = v6;
      -[ContainerHeaderView frame](self->_titleHeaderView, "frame");
      v4 = v7 + CGRectGetHeight(v14);

    }
    return v4;
  }
  if (-[SimpleResultsViewController isPresentingSearchAlongTheRouteResults](self, "isPresentingSearchAlongTheRouteResults"))
  {
    return 192.0;
  }
  if (sub_1002A8AA0(self) == 5)
  {
    -[UITableView contentSize](self->_tableView, "contentSize");
    v12 = v11;
    -[ContainerHeaderView frame](self->_titleHeaderView, "frame");
    return fmin(v12 + v13, 610.0);
  }
  else
  {
    sub_1005EC2E4();
  }
  return result;
}

- (void)handleDismissAction:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SimpleResultsViewController;
  -[ContaineeViewController handleDismissAction:](&v4, "handleDismissAction:", a3);
  -[SimpleResultsViewController _captureCloseAction](self, "_captureCloseAction");
  +[SearchResultsAnalyticsManager didCloseCluster](SearchResultsAnalyticsManager, "didCloseCluster");
}

- (void)quickActionMenuPresenter:(id)a3 selectedDirectionsTo:(id)a4
{
  void *v5;
  SearchFieldItem *v6;
  void *v7;
  SearchFieldItem *v8;
  DirectionItem *v9;
  void *v10;
  DirectionItem *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  _UNKNOWN **v15;
  _QWORD v16[2];

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "searchResult", a3));
  if (v5)
  {
    v6 = objc_alloc_init(SearchFieldItem);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
    -[SearchFieldItem setSearchResult:](v6, "setSearchResult:", v7);

    v8 = objc_alloc_init(SearchFieldItem);
    -[SearchFieldItem setSearchResult:](v8, "setSearchResult:", v5);
    v9 = [DirectionItem alloc];
    v16[0] = v6;
    v16[1] = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2));
    v11 = -[DirectionItem initWithItems:transportType:](v9, "initWithItems:transportType:", v10, 0);

    v14 = CFSTR("DirectionsSessionInitiatorKey");
    v15 = &off_10126E638;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController coordinator](self, "coordinator"));
    objc_msgSend(v13, "viewController:doDirectionItem:withUserInfo:", 0, v11, v12);

  }
}

- (void)quickActionMenuPresenter:(id)a3 selectedCall:(id)a4
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "searchResult", a3));
  if (v6)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController coordinator](self, "coordinator"));
    objc_msgSend(v5, "viewController:doAudioCallToSearchResult:", 0, v6);

  }
}

- (void)quickActionMenuPresenter:(id)a3 selectedViewWebsiteFor:(id)a4
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "searchResult", a3));
  if (v6)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController coordinator](self, "coordinator"));
    objc_msgSend(v5, "viewController:openWebsiteForSearchResult:", 0, v6);

  }
}

- (void)quickActionMenuPresenter:(id)a3 selectedShareLocationOf:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "searchResult", a3));
  if (v5)
  {
    v9 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contactForSharingToMessages"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ShareItem shareItemWithSearchResult:contact:includePrintActivity:](ShareItem, "shareItemWithSearchResult:contact:includePrintActivity:", v9, v6, 0));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController coordinator](self, "coordinator"));
    objc_msgSend(v8, "viewController:doShareSheetForShareItem:completion:", 0, v7, 0);

    v5 = v9;
  }

}

- (void)quickActionMenuPresenter:(id)a3 selectedShowPlaceCard:(id)a4
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "searchResult", a3));
  if (v6)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController resultsDelegate](self, "resultsDelegate"));
    objc_msgSend(v5, "simpleResultsViewContoller:selectSearchResult:", self, v6);

  }
}

- (BOOL)shouldQuickActionMenuPresenter:(id)a3 presentAtLocation:(CGPoint)a4 inView:(id)a5
{
  return -[SimpleResultsViewController enableQuickActionMenu](self, "enableQuickActionMenu", a3, a5, a4.x, a4.y);
}

- (BOOL)quickActionMenuPresenter:(id)a3 isPopularNearbyAtIndexPath:(id)a4
{
  return 0;
}

- (int)uiTargetForQuickActionMenu
{
  return 2;
}

- (id)mapServiceTraitsForQuickActionPresenter:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController coordinator](self, "coordinator", a3));
  v4 = objc_msgSend(v3, "newTraits");

  return v4;
}

- (void)quickActionMenuPresenter:(id)a3 selectedRemoveDroppedPinOf:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController coordinator](self, "coordinator"));
  objc_msgSend(v6, "viewController:removeDroppedPin:", 0, v5);

}

- (BOOL)shouldQuickActionMenuPresenter:(id)a3 showDirectionsToPlace:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SimpleResultsViewController coordinator](self, "coordinator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "venuesManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));

  LOBYTE(v5) = objc_msgSend(v7, "isUserAtSameVenueAsMapItem:", v8) ^ 1;
  return (char)v5;
}

- (MUScrollViewImpressionsCalculator)impressionsCalculator
{
  MUScrollViewImpressionsCalculator *impressionsCalculator;
  SearchResultsImpressionsLogger *v4;
  id v5;
  UITableView *tableView;
  id v7;
  id v8;
  MUScrollViewImpressionsCalculator *v9;
  MUScrollViewImpressionsCalculator *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void **v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  if (MapsFeature_IsEnabled_SearchResultsImpressions(self, a2) && self->_resultsDataSource)
  {
    impressionsCalculator = self->_impressionsCalculator;
    if (impressionsCalculator)
      return impressionsCalculator;
    v4 = objc_alloc_init(SearchResultsImpressionsLogger);
    objc_initWeak(&location, self);
    v5 = objc_alloc((Class)MUImpressionsCalculatorConfiguration);
    tableView = self->_tableView;
    v15 = _NSConcreteStackBlock;
    v16 = 3221225472;
    v17 = sub_1006A47D8;
    v18 = &unk_1011BFFB0;
    objc_copyWeak(&v19, &location);
    v7 = objc_msgSend(v5, "initWithLogger:contentScrollView:containerViewProvider:", v4, tableView, &v15);
    v8 = objc_alloc((Class)MUScrollViewImpressionsCalculator);
    v9 = (MUScrollViewImpressionsCalculator *)objc_msgSend(v8, "initWithConfiguration:visibleItemsProvider:", v7, self->_resultsDataSource, v15, v16, v17, v18);
    v10 = self->_impressionsCalculator;
    self->_impressionsCalculator = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
    if (objc_msgSend(v11, "isInternalInstall"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v13 = objc_msgSend(v12, "BOOLForKey:", CFSTR("EnableSearchResultsImpressionLoggingVisualization"));

      if (!v13)
      {
LABEL_9:

        objc_destroyWeak(&v19);
        objc_destroyWeak(&location);

        impressionsCalculator = self->_impressionsCalculator;
        return impressionsCalculator;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[MapsImpressionsSearchResultsFloatingDebugViewController sharedInstance](MapsImpressionsSearchResultsFloatingDebugViewController, "sharedInstance"));
      objc_msgSend(v11, "setCalculator:", self->_impressionsCalculator);
      if ((objc_msgSend(v11, "isAttached") & 1) == 0)
        objc_msgSend(v11, "attach");
    }

    goto LABEL_9;
  }
  return (MUScrollViewImpressionsCalculator *)0;
}

- (int)currentUITargetForAnalytics
{
  return 105;
}

- (int)currentMapViewTargetForAnalytics
{
  return 503;
}

- (VKLabelMarker)cluster
{
  return self->_cluster;
}

- (ActionCoordination)coordinator
{
  return (ActionCoordination *)objc_loadWeakRetained((id *)&self->_coordinator);
}

- (void)setCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_coordinator, a3);
}

- (SimpleResultsViewControllerDelegate)resultsDelegate
{
  return (SimpleResultsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_resultsDelegate);
}

- (void)setResultsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_resultsDelegate, a3);
}

- (BOOL)enableQuickActionMenu
{
  return self->_enableQuickActionMenu;
}

- (void)setEnableQuickActionMenu:(BOOL)a3
{
  self->_enableQuickActionMenu = a3;
}

- (BOOL)isPresentingSearchAlongTheRouteResults
{
  return self->_isPresentingSearchAlongTheRouteResults;
}

- (SARSearchResultTableViewCellDelegate)searchAlongTheRouteCellDelegate
{
  return (SARSearchResultTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_searchAlongTheRouteCellDelegate);
}

- (BOOL)isPresentingVenueClusterResults
{
  return self->_isPresentingVenueClusterResults;
}

- (ContainerHeaderView)titleHeaderView
{
  return self->_titleHeaderView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleHeaderView, 0);
  objc_destroyWeak((id *)&self->_searchAlongTheRouteCellDelegate);
  objc_destroyWeak((id *)&self->_resultsDelegate);
  objc_destroyWeak((id *)&self->_coordinator);
  objc_storeStrong((id *)&self->_approxLocation, 0);
  objc_storeStrong((id *)&self->_impressionsCalculator, 0);
  objc_storeStrong(&self->_lastItemTapped, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_titleHeaderViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_cluster, 0);
  objc_storeStrong((id *)&self->_quickActionMenuPresenter, 0);
  objc_storeStrong((id *)&self->_resultsDataSource, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_originalSearchInfo, 0);
  objc_storeStrong((id *)&self->_macResultsTitleView, 0);
  objc_storeStrong((id *)&self->_resultsTitleView, 0);
  objc_destroyWeak((id *)&self->_shareDelegate);
}

@end
