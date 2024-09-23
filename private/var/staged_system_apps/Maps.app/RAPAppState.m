@implementation RAPAppState

- (RAPAppState)initWithTraits:(id)a3 placecardImageryContext:(id)a4
{
  id v7;
  RAPAppState *v8;
  RAPAppState *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RAPAppState;
  v8 = -[RAPMapState initWithTraits:](&v11, "initWithTraits:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_placecardImageryContext, a4);

  return v9;
}

- (RAPAppState)initWithMapView:(id)a3 traits:(id)a4 searchHistory:(id)a5 directionHistory:(id)a6 place:(id)a7 searchDataSource:(id)a8 directionsDataSource:(id)a9 currentlyConnectedAuxiliaryControls:(id)a10
{
  id v17;
  id v18;
  id v19;
  RAPAppState *v20;
  uint64_t v21;
  GEOComposedRoute *activeComposedRoute;
  uint64_t v23;
  RAPDisplayedRouteState *currentDirections;
  uint64_t v25;
  NSString *currentSearchString;
  uint64_t v27;
  NSString *currentUserTypedSearchString;
  uint64_t v29;
  RAPDisplayedDirectionsPlan *displayedDirectionsPlan;
  id v32;
  id v33;
  objc_super v34;

  v33 = a5;
  v32 = a6;
  v17 = a8;
  v18 = a9;
  v19 = a10;
  v34.receiver = self;
  v34.super_class = (Class)RAPAppState;
  v20 = -[RAPMapState initWithMapView:traits:place:](&v34, "initWithMapView:traits:place:", a3, a4, a7);
  if (v20)
  {
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "activeComposedRoute", v32, v33));
    activeComposedRoute = v20->_activeComposedRoute;
    v20->_activeComposedRoute = (GEOComposedRoute *)v21;

    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "currentDirections"));
    currentDirections = v20->_currentDirections;
    v20->_currentDirections = (RAPDisplayedRouteState *)v23;

    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "currentSearchString"));
    currentSearchString = v20->_currentSearchString;
    v20->_currentSearchString = (NSString *)v25;

    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "currentUserTypedSearchString"));
    currentUserTypedSearchString = v20->_currentUserTypedSearchString;
    v20->_currentUserTypedSearchString = (NSString *)v27;

    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "displayedDirectionsPlan"));
    displayedDirectionsPlan = v20->_displayedDirectionsPlan;
    v20->_displayedDirectionsPlan = (RAPDisplayedDirectionsPlan *)v29;

    v20->_isShowingDirections = objc_msgSend(v18, "isShowingDirections");
    objc_storeStrong((id *)&v20->_currentlyConnectedAuxiliaryControls, a10);
    objc_storeStrong((id *)&v20->_searchesHistory, a5);
    objc_storeStrong((id *)&v20->_directionsHistory, a6);
  }

  return v20;
}

- (RAPAppState)initWithMapView:(id)a3 traits:(id)a4 searchHistory:(id)a5 directionHistory:(id)a6 place:(id)a7 searchDataSource:(id)a8 directionsDataSource:(id)a9 currentlyConnectedAuxiliaryControls:(id)a10 homeShortuts:(id)a11 workShorcuts:(id)a12 schoolShorcuts:(id)a13
{
  id v18;
  id v19;
  id v20;
  void *v21;
  RAPAppState *v22;
  NSArray *v23;
  NSArray *homeShortcuts;
  NSArray *v25;
  NSArray *workShortcuts;
  NSArray *v27;
  NSArray *schoolShortcuts;

  v18 = a11;
  v19 = a12;
  v20 = a13;
  v21 = v19;
  v22 = -[RAPAppState initWithMapView:traits:searchHistory:directionHistory:place:searchDataSource:directionsDataSource:currentlyConnectedAuxiliaryControls:](self, "initWithMapView:traits:searchHistory:directionHistory:place:searchDataSource:directionsDataSource:currentlyConnectedAuxiliaryControls:", a3, a4, a5, a6, a7, a8, a9, a10);
  if (v22)
  {
    v23 = (NSArray *)objc_msgSend(v18, "copy");
    homeShortcuts = v22->_homeShortcuts;
    v22->_homeShortcuts = v23;

    v25 = (NSArray *)objc_msgSend(v21, "copy");
    workShortcuts = v22->_workShortcuts;
    v22->_workShortcuts = v25;

    v27 = (NSArray *)objc_msgSend(v20, "copy");
    schoolShortcuts = v22->_schoolShortcuts;
    v22->_schoolShortcuts = v27;

  }
  return v22;
}

- (RAPAppState)initWithMapView:(id)a3 lookAroundContext:(id)a4 traits:(id)a5
{
  id v9;
  RAPAppState *v10;
  RAPAppState *v11;

  v9 = a4;
  v10 = -[RAPAppState initWithMapView:traits:searchHistory:directionHistory:place:searchDataSource:directionsDataSource:currentlyConnectedAuxiliaryControls:](self, "initWithMapView:traits:searchHistory:directionHistory:place:searchDataSource:directionsDataSource:currentlyConnectedAuxiliaryControls:", a3, a5, &__NSArray0__struct, &__NSArray0__struct, 0, 0, 0, 0);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_reportedLookAroundContext, a4);

  return v11;
}

- (RAPAppState)initWithTraits:(id)a3 curatedCollectionContext:(id)a4
{
  id v7;
  RAPAppState *v8;
  RAPAppState *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RAPAppState;
  v8 = -[RAPMapState initWithTraits:](&v11, "initWithTraits:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_curatedCollectionContext, a4);

  return v9;
}

- (NSString)debugDescription
{
  id v3;
  void *v4;
  const __CFString *v5;
  const __CFString *currentSearchString;
  const __CFString *currentUserTypedSearchString;
  NSString *v8;
  void *v9;
  id v10;
  objc_super v12;

  v3 = objc_alloc_init((Class)NSMutableString);
  v4 = v3;
  if (self->_isShowingDirections)
    v5 = CFSTR("\nis showing directions");
  else
    v5 = CFSTR("\nis not showing directions");
  objc_msgSend(v3, "appendString:", v5);
  currentSearchString = (const __CFString *)self->_currentSearchString;
  if (!currentSearchString)
    currentSearchString = CFSTR("<none>");
  objc_msgSend(v4, "appendFormat:", CFSTR("\ncurrent search string: %@"), currentSearchString);
  currentUserTypedSearchString = (const __CFString *)self->_currentUserTypedSearchString;
  if (!currentUserTypedSearchString)
    currentUserTypedSearchString = CFSTR("<none>");
  objc_msgSend(v4, "appendFormat:", CFSTR("\ncurrent user typed search string: %@"), currentUserTypedSearchString);
  v12.receiver = self;
  v12.super_class = (Class)RAPAppState;
  v8 = -[RAPMapState debugDescription](&v12, "debugDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v4, "appendString:", v9);

  if (self->_currentDirections)
    objc_msgSend(v4, "appendFormat:", CFSTR("\ncurrent directions: %@"), self->_currentDirections);
  if (self->_displayedDirectionsPlan)
    objc_msgSend(v4, "appendFormat:", CFSTR("\ndisplayed directions plan: %@"), self->_displayedDirectionsPlan);
  if (self->_activeComposedRoute)
    objc_msgSend(v4, "appendFormat:", CFSTR("\nactive composed route: %@"), self->_activeComposedRoute);
  if (self->_searchesHistory)
    objc_msgSend(v4, "appendFormat:", CFSTR("\nsearch history: %@"), self->_searchesHistory);
  if (self->_directionsHistory)
    objc_msgSend(v4, "appendFormat:", CFSTR("\ndirections history: %@"), self->_directionsHistory);
  if (self->_currentlyConnectedAuxiliaryControls)
    objc_msgSend(v4, "appendFormat:", CFSTR("\ncurrently connected auxiliary controls: %@"), self->_currentlyConnectedAuxiliaryControls);
  v10 = objc_msgSend(v4, "copy");

  return (NSString *)v10;
}

- (BOOL)isShowingDirections
{
  return self->_isShowingDirections;
}

- (RAPDisplayedRouteState)currentDirections
{
  return self->_currentDirections;
}

- (RAPDisplayedDirectionsPlan)displayedDirectionsPlan
{
  return self->_displayedDirectionsPlan;
}

- (RAPDirectionsRecording)directionsRecording
{
  return self->_directionsRecording;
}

- (NSString)currentSearchString
{
  return self->_currentSearchString;
}

- (NSString)currentUserTypedSearchString
{
  return self->_currentUserTypedSearchString;
}

- (NSArray)searchesHistory
{
  return self->_searchesHistory;
}

- (NSArray)directionsHistory
{
  return self->_directionsHistory;
}

- (RAPAuxiliaryControlsRecording)currentlyConnectedAuxiliaryControls
{
  return self->_currentlyConnectedAuxiliaryControls;
}

- (GEOComposedRoute)activeComposedRoute
{
  return self->_activeComposedRoute;
}

- (NSArray)workShortcuts
{
  return self->_workShortcuts;
}

- (NSArray)homeShortcuts
{
  return self->_homeShortcuts;
}

- (NSArray)schoolShortcuts
{
  return self->_schoolShortcuts;
}

- (RAPLookAroundContext)reportedLookAroundContext
{
  return self->_reportedLookAroundContext;
}

- (RAPPlacecardImageryContext)placecardImageryContext
{
  return self->_placecardImageryContext;
}

- (RAPCuratedCollectionContext)curatedCollectionContext
{
  return self->_curatedCollectionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curatedCollectionContext, 0);
  objc_storeStrong((id *)&self->_placecardImageryContext, 0);
  objc_storeStrong((id *)&self->_reportedLookAroundContext, 0);
  objc_storeStrong((id *)&self->_schoolShortcuts, 0);
  objc_storeStrong((id *)&self->_homeShortcuts, 0);
  objc_storeStrong((id *)&self->_workShortcuts, 0);
  objc_storeStrong((id *)&self->_activeComposedRoute, 0);
  objc_storeStrong((id *)&self->_currentlyConnectedAuxiliaryControls, 0);
  objc_storeStrong((id *)&self->_directionsHistory, 0);
  objc_storeStrong((id *)&self->_searchesHistory, 0);
  objc_storeStrong((id *)&self->_currentUserTypedSearchString, 0);
  objc_storeStrong((id *)&self->_currentSearchString, 0);
  objc_storeStrong((id *)&self->_directionsRecording, 0);
  objc_storeStrong((id *)&self->_displayedDirectionsPlan, 0);
  objc_storeStrong((id *)&self->_currentDirections, 0);
}

@end
