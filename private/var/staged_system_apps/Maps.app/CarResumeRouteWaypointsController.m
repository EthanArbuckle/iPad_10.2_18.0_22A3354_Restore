@implementation CarResumeRouteWaypointsController

- (CarResumeRouteWaypointsController)initWithEntry:(id)a3
{
  id v5;
  CarResumeRouteWaypointsController *v6;
  CarResumeRouteWaypointsController *v7;
  CarResumeRouteWaypointsController *v8;
  objc_super v10;

  v5 = a3;
  if (objc_msgSend(v5, "type") == (id)11)
  {
    v10.receiver = self;
    v10.super_class = (Class)CarResumeRouteWaypointsController;
    v6 = -[CarResumeRouteWaypointsController init](&v10, "init");
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_entry, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)destinationSearchResultIfAvailable
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarResumeRouteWaypointsController searchFieldItems](self, "searchFieldItems"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "waypoint"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pin"));

  return v5;
}

- (id)searchFieldItems
{
  NSArray *searchFieldItems;
  id v4;
  SearchFieldItem *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *v9;

  searchFieldItems = self->super._searchFieldItems;
  if (!searchFieldItems)
  {
    v4 = objc_alloc_init((Class)NSMutableArray);
    v5 = objc_alloc_init(SearchFieldItem);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
    -[SearchFieldItem setSearchResult:](v5, "setSearchResult:", v6);

    objc_msgSend(v4, "addObject:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemsForRouteInSuggestionsEntry:](SearchFieldItem, "searchFieldItemsForRouteInSuggestionsEntry:", self->_entry));
    objc_msgSend(v4, "addObjectsFromArray:", v7);
    v8 = (NSArray *)objc_msgSend(v4, "copy");
    v9 = self->super._searchFieldItems;
    self->super._searchFieldItems = v8;

    searchFieldItems = self->super._searchFieldItems;
  }
  return searchFieldItems;
}

- (void)configureDirectionItemForLoad:(id)a3
{
  id v4;
  void *v5;
  DrivePreferences *v6;
  void *v7;
  void *v8;
  DrivePreferences *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CarResumeRouteWaypointsController;
  -[CarWaypointsController configureDirectionItemForLoad:](&v10, "configureDirectionItemForLoad:", v4);
  if (-[MapsSuggestionsEntry containsKey:](self->_entry, "containsKey:", CFSTR("MapsSuggestionsResumeRouteRouteRequestStorage")))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry routeRequestStorageForKey:](self->_entry, "routeRequestStorageForKey:", CFSTR("MapsSuggestionsResumeRouteRouteRequestStorage")));
    v6 = [DrivePreferences alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "automobileOptions"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v9 = -[DrivePreferences initWithAutomobileOptions:defaults:](v6, "initWithAutomobileOptions:defaults:", v7, v8);
    objc_msgSend(v4, "setDrivePreferences:", v9);

  }
}

- (void)configureUserInfoForLoad:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CarResumeRouteWaypointsController;
  v4 = a3;
  -[CarWaypointsController configureUserInfoForLoad:](&v6, "configureUserInfoForLoad:", v4);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("DirectionsIsResumedNavigationSessionKey"), v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsEntry sharingContacts](self->_entry, "sharingContacts"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("DirectionsPreviousContactsForTripSharing"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entry, 0);
}

@end
