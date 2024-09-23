@implementation OfflineMapSectionController

- (OfflineMapSectionController)initWithSubscriptionInfo:(id)a3
{
  id v5;
  OfflineMapSectionController *v6;
  OfflineMapSectionController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OfflineMapSectionController;
  v6 = -[OfflineMapSectionController init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_subscriptionInfo, a3);

  return v7;
}

- (UIView)sectionView
{
  UIView *sectionView;
  UIView *v4;
  UIView *v5;

  sectionView = self->_sectionView;
  if (!sectionView)
  {
    v4 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_sectionView;
    self->_sectionView = v4;

    sectionView = self->_sectionView;
  }
  return sectionView;
}

- (NSArray)sectionViews
{
  void *v2;
  void *v3;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSectionController sectionView](self, "sectionView"));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));

  return (NSArray *)v3;
}

- (UIViewController)sectionViewController
{
  return 0;
}

- (id)draggableContent
{
  return 0;
}

- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel
{
  return 0;
}

- (MUPlaceSectionFooterViewModel)sectionFooterViewModel
{
  return 0;
}

- (BOOL)hasContent
{
  return 1;
}

- (id)infoCardChildPossibleActions
{
  return &__NSArray0__struct;
}

- (id)infoCardChildUnactionableUIElements
{
  return &__NSArray0__struct;
}

- (id)analyticsModule
{
  return (id)objc_opt_new(GEOAPPlaceCardModule);
}

- (id)revealedAnalyticsModule
{
  return 0;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (MUPlaceCallToActionAppearance)submissionStatus
{
  return self->_submissionStatus;
}

- (void)setSubmissionStatus:(id)a3
{
  objc_storeStrong((id *)&self->_submissionStatus, a3);
}

- (MUInfoCardAnalyticsDelegate)analyticsDelegate
{
  return (MUInfoCardAnalyticsDelegate *)objc_loadWeakRetained((id *)&self->_analyticsDelegate);
}

- (void)setAnalyticsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_analyticsDelegate, a3);
}

- (MapDataSubscriptionInfo)subscriptionInfo
{
  return self->_subscriptionInfo;
}

- (void)setSubscriptionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionInfo, 0);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_storeStrong((id *)&self->_submissionStatus, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
}

@end
