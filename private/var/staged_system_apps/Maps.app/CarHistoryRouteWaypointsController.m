@implementation CarHistoryRouteWaypointsController

- (CarHistoryRouteWaypointsController)initWithHistoryItem:(id)a3
{
  id v5;
  CarHistoryRouteWaypointsController *v6;
  CarHistoryRouteWaypointsController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CarHistoryRouteWaypointsController;
  v6 = -[CarHistoryRouteWaypointsController init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_historyItem, a3);

  return v7;
}

- (id)destinationSearchResultIfAvailable
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  SearchResult *v6;
  void *v7;
  SearchResult *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSPHistoryEntryRoute endWaypoint](self->_historyItem, "endWaypoint"));
  v4 = objc_opt_class(GEOComposedWaypointToRoute);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
  {
    v6 = [SearchResult alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSPHistoryEntryRoute endWaypoint](self->_historyItem, "endWaypoint"));
    v8 = -[SearchResult initWithComposedWaypoint:](v6, "initWithComposedWaypoint:", v7);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarHistoryRouteWaypointsController searchFieldItems](self, "searchFieldItems"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "waypoint"));
    v8 = (SearchResult *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pin"));

  }
  return v8;
}

- (id)searchFieldItems
{
  NSArray *searchFieldItems;
  NSArray *v4;
  NSArray *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;

  searchFieldItems = self->super._searchFieldItems;
  if (!searchFieldItems)
  {
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemsForRouteHistoryEntry:](SearchFieldItem, "searchFieldItemsForRouteHistoryEntry:", self->_historyItem));
    v5 = self->super._searchFieldItems;
    self->super._searchFieldItems = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->super._searchFieldItems, "firstObject"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchResult"));
    v8 = objc_msgSend(v7, "isDynamicCurrentLocation");

    if ((v8 & 1) == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
      objc_msgSend(v6, "setSearchResult:", v9);

    }
    searchFieldItems = self->super._searchFieldItems;
  }
  return searchFieldItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historyItem, 0);
}

@end
