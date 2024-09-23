@implementation ShowSearchInfoAction

- (ShowSearchInfoAction)initWithSearchInfo:(id)a3
{
  id v5;
  ShowSearchInfoAction *v6;
  ShowSearchInfoAction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ShowSearchInfoAction;
  v6 = -[ShowSearchInfoAction init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_searchInfo, a3);

  return v7;
}

- (BOOL)isCompatibleWithNavigation
{
  void *v2;
  id v3;
  uint64_t v4;
  BOOL v5;
  char IsEnabled_Maps182;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v3 = objc_msgSend(v2, "navigationTransportType");
  v5 = 0;
  switch((int)v3)
  {
    case 1:
    case 6:
      goto LABEL_6;
    case 2:
      IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182(v3);
      goto LABEL_5;
    case 3:
      IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps420(v3);
      goto LABEL_5;
    default:
      IsEnabled_Maps182 = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v3, v4);
LABEL_5:
      v5 = IsEnabled_Maps182;
LABEL_6:

      return v5;
  }
}

- (BOOL)isCompatibleWithRestorationTask
{
  return 0;
}

- (int)analyticsLaunchActionType
{
  return 32;
}

- (SearchInfo)searchInfo
{
  return self->_searchInfo;
}

- (void)setSearchInfo:(id)a3
{
  objc_storeStrong((id *)&self->_searchInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchInfo, 0);
}

@end
