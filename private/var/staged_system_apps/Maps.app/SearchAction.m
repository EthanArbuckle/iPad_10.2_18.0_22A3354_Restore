@implementation SearchAction

- (SearchAction)initWithSearchItem:(id)a3 alongRoute:(BOOL)isMPREnabled
{
  id v7;
  SearchAction *v8;
  SearchAction *v9;
  void *v10;
  id v11;
  uint64_t v12;
  int IsNavigating;
  void *v14;
  uint64_t v15;
  unsigned int v16;
  char IsEnabled_Maps182;
  objc_super v19;

  v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SearchAction;
  v8 = -[SearchAction init](&v19, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_searchItem, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v11 = objc_msgSend(v10, "state");
    IsNavigating = MNNavigationServiceStateIsNavigating(v11, v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v16 = objc_msgSend(v14, "navigationTransportType") - 1;
    IsEnabled_Maps182 = 0;
    switch(v16)
    {
      case 0u:
      case 5u:
        break;
      case 1u:
        IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182(0);
        break;
      case 2u:
        IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps420(0);
        break;
      default:
        IsEnabled_Maps182 = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(0, v15);
        break;
    }
    v9->_isMPREnabled = IsEnabled_Maps182;

    if (IsNavigating)
      isMPREnabled = v9->_isMPREnabled;
    v9->_searchAlongRoute = isMPREnabled;
  }

  return v9;
}

- (BOOL)isCompatibleWithNavigation
{
  return self->_isMPREnabled;
}

- (BOOL)isCompatibleWithRestorationTask
{
  return 0;
}

- (int)analyticsLaunchActionType
{
  return 28;
}

- (SearchFieldItem)searchItem
{
  return self->_searchItem;
}

- (void)setSearchItem:(id)a3
{
  objc_storeStrong((id *)&self->_searchItem, a3);
}

- (BOOL)searchAlongRoute
{
  return self->_searchAlongRoute;
}

- (void)setSearchAlongRoute:(BOOL)a3
{
  self->_searchAlongRoute = a3;
}

- (BOOL)isMPREnabled
{
  return self->_isMPREnabled;
}

- (void)setIsMPREnabled:(BOOL)a3
{
  self->_isMPREnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchItem, 0);
}

@end
