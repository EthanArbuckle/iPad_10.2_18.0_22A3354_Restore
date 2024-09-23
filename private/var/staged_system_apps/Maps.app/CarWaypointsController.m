@implementation CarWaypointsController

- (BOOL)canGoNext
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[CarWaypointsController indexOfCurrentDestination](self, "indexOfCurrentDestination");
  v4 = -[CarWaypointsController totalDestinations](self, "totalDestinations");
  return v3 < v4 - 1 && v4 != 0;
}

- (BOOL)canGoPrevious
{
  unint64_t v3;
  unint64_t v4;
  BOOL v5;

  v3 = -[CarWaypointsController indexOfCurrentDestination](self, "indexOfCurrentDestination");
  v4 = -[CarWaypointsController totalDestinations](self, "totalDestinations");
  if (v3)
    v5 = v4 == 0;
  else
    v5 = 1;
  return !v5;
}

- (NSDictionary)userInfo
{
  NSDictionary *userInfo;
  NSDictionary *v4;
  NSDictionary *v5;

  userInfo = self->_userInfo;
  if (!userInfo)
  {
    v4 = (NSDictionary *)objc_alloc_init((Class)NSDictionary);
    v5 = self->_userInfo;
    self->_userInfo = v4;

    userInfo = self->_userInfo;
  }
  return userInfo;
}

- (NSString)titleForCurrentDestination
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarWaypointsController searchFieldItems](self, "searchFieldItems"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "waypointName"));

  return (NSString *)v4;
}

- (unint64_t)indexOfCurrentDestination
{
  return 0;
}

- (unint64_t)totalDestinations
{
  return 1;
}

- (BOOL)shouldStartLoadWhenBecomingCurrent
{
  return 1;
}

- (NSArray)searchFieldItems
{
  NSArray *searchFieldItems;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *v9;
  _QWORD v11[2];

  searchFieldItems = self->_searchFieldItems;
  if (!searchFieldItems)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarWaypointsController originSearchResult](self, "originSearchResult"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v4));

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarWaypointsController destinationSearchResultIfAvailable](self, "destinationSearchResultIfAvailable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v6));

    v11[0] = v5;
    v11[1] = v7;
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
    v9 = self->_searchFieldItems;
    self->_searchFieldItems = v8;

    searchFieldItems = self->_searchFieldItems;
  }
  return searchFieldItems;
}

- (SearchResult)originSearchResult
{
  SearchResult *originSearchResult;
  SearchResult *v4;
  SearchResult *v5;

  originSearchResult = self->_originSearchResult;
  if (!originSearchResult)
  {
    v4 = (SearchResult *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
    v5 = self->_originSearchResult;
    self->_originSearchResult = v4;

    originSearchResult = self->_originSearchResult;
  }
  return originSearchResult;
}

- (void)startLoadWithTraits:(id)a3
{
  id v4;
  DirectionItem *v5;
  void *v6;
  void *v7;
  id v8;
  RoutePlanningSession *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char isKindOfClass;
  void *v16;
  void *v17;
  void *v18;
  DirectionItem *v19;

  v4 = a3;
  v5 = [DirectionItem alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarWaypointsController searchFieldItems](self, "searchFieldItems"));
  v19 = -[DirectionItem initWithItems:transportType:](v5, "initWithItems:transportType:", v6, 1);

  -[CarWaypointsController configureDirectionItemForLoad:](self, "configureDirectionItemForLoad:", v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarWaypointsController userInfo](self, "userInfo"));
  v8 = objc_msgSend(v7, "mutableCopy");

  -[CarWaypointsController configureUserInfoForLoad:](self, "configureUserInfoForLoad:", v8);
  v9 = sub_1009C26BC(v19, v4, 0, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "platformController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentSession"));
  v14 = objc_opt_class(RoutePlanningSession);
  isKindOfClass = objc_opt_isKindOfClass(v13, v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "platformController"));
  v18 = v17;
  if ((isKindOfClass & 1) != 0)
    objc_msgSend(v17, "replaceCurrentSessionWithSession:", v10);
  else
    objc_msgSend(v17, "pushSession:", v10);

}

- (void)configureUserInfoForLoad:(id)a3
{
  objc_msgSend(a3, "setObject:forKeyedSubscript:", &off_10126EB48, CFSTR("DirectionsSessionInitiatorKey"));
}

- (BOOL)allowLooping
{
  return self->_allowLooping;
}

- (void)setAllowLooping:(BOOL)a3
{
  self->_allowLooping = a3;
}

- (SearchResult)destinationSearchResultIfAvailable
{
  return self->_destinationSearchResultIfAvailable;
}

- (NSString)subtitleForCurrentDestination
{
  return self->_subtitleForCurrentDestination;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_subtitleForCurrentDestination, 0);
  objc_storeStrong((id *)&self->_destinationSearchResultIfAvailable, 0);
  objc_storeStrong((id *)&self->_originSearchResult, 0);
  objc_storeStrong((id *)&self->_searchFieldItems, 0);
}

@end
