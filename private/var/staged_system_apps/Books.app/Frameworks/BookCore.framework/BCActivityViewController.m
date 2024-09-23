@implementation BCActivityViewController

- (BCActivityViewController)initWithRootActivityItems:(id)a3 expandedActivityItems:(id)a4 applicationActivities:(id)a5 sharingStyle:(int64_t)a6 customActivityTypeOrder:(id)a7 customShareActivityTitle:(id)a8 appAnalyticsProvider:(id)a9 tracker:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  BCActivityViewController *v21;
  BCActivityViewController *v22;
  NSString *v23;
  NSString *customShareActivityTitle;
  uint64_t v25;
  _TtC13BookAnalytics9BATracker *tracker;
  uint64_t v27;
  id v29;
  id v30;
  objc_super v31;

  v30 = a3;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  v29 = a9;
  v20 = a10;
  v31.receiver = self;
  v31.super_class = (Class)BCActivityViewController;
  v21 = -[BCActivityViewController initWithActivityItems:applicationActivities:](&v31, "initWithActivityItems:applicationActivities:", a4, v17);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_rootActivityItems, a3);
    v23 = (NSString *)objc_msgSend(v19, "copy", v29, v30);
    customShareActivityTitle = v22->_customShareActivityTitle;
    v22->_customShareActivityTitle = v23;

    objc_storeStrong((id *)&v22->_applicationActivities, a5);
    objc_storeStrong((id *)&v22->_appAnalyticsProvider, a9);
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "chainWithName:", CFSTR("ContextualActionSheet")));
    tracker = v22->_tracker;
    v22->_tracker = (_TtC13BookAnalytics9BATracker *)v25;

    -[BCActivityViewController setActivityTypeOrder:](v22, "setActivityTypeOrder:", v18);
    if (a6 == 1)
      v27 = 1;
    else
      v27 = 2 * (a6 != 0);
    -[BCActivityViewController setSharingStyle:](v22, "setSharingStyle:", v27);
  }

  return v22;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BCActivityViewController;
  -[BCActivityViewController viewWillAppear:](&v3, "viewWillAppear:", a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  NSDate *v4;
  NSDate *analyticsAppearDate;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _TtC13BookAnalytics9BATracker *v12;
  _TtC13BookAnalytics9BATracker *tracker;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)BCActivityViewController;
  -[BCActivityViewController viewDidAppear:](&v17, "viewDidAppear:", a3);
  v4 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  analyticsAppearDate = self->_analyticsAppearDate;
  self->_analyticsAppearDate = v4;

  if (!self->_tracker)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCActivityViewController presentingViewController](self, "presentingViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewIfLoaded"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rootViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bc_deepestVisibleChildViewControllerIncludePresented:", 1));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ba_effectiveAnalyticsTracker"));
    v12 = (_TtC13BookAnalytics9BATracker *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "chainWithName:", CFSTR("ContextualActionSheet")));
    tracker = self->_tracker;
    self->_tracker = v12;

  }
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_CB4D0;
  v14[3] = &unk_2909F8;
  objc_copyWeak(&v15, &location);
  -[BCActivityViewController setPreCompletionHandler:](self, "setPreCompletionHandler:", v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BCActivityViewController;
  -[BCActivityViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  if (self->_tracker && self->_analyticsAppearDate)
  {
    if (self->_appAnalyticsProvider)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
      objc_msgSend(v4, "emitShareSheetExposureEventWithTracker:startDate:propertyProvider:", self->_tracker, self->_analyticsAppearDate, self->_appAnalyticsProvider);

    }
  }
}

- (id)_titleForActivity:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "isEqualToString:", UIActivityTypeShare))
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCActivityViewController customShareActivityTitle](self, "customShareActivityTitle"));
  else
    v4 = 0;
  return v4;
}

- (void)_performActivity:(id)a3
{
  UIActivity *v4;
  UIActivity *selectedActivity;
  objc_super v6;

  v4 = (UIActivity *)a3;
  v6.receiver = self;
  v6.super_class = (Class)BCActivityViewController;
  -[BCActivityViewController _performActivity:](&v6, "_performActivity:", v4);
  selectedActivity = self->_selectedActivity;
  self->_selectedActivity = v4;

}

- (BOOL)isContentManaged
{
  return self->_managedBook;
}

- (int64_t)overrideUserInterfaceStyle
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCActivityViewController presentingViewController](self, "presentingViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "traitCollection"));
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  return (int64_t)v4;
}

- (NSArray)applicationActivities
{
  return self->_applicationActivities;
}

- (UIActivity)selectedActivity
{
  return self->_selectedActivity;
}

- (BOOL)isManagedBook
{
  return self->_managedBook;
}

- (void)setManagedBook:(BOOL)a3
{
  self->_managedBook = a3;
}

- (NSArray)rootActivityItems
{
  return self->_rootActivityItems;
}

- (void)setRootActivityItems:(id)a3
{
  objc_storeStrong((id *)&self->_rootActivityItems, a3);
}

- (NSString)customShareActivityTitle
{
  return self->_customShareActivityTitle;
}

- (void)setCustomShareActivityTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customShareActivityTitle, 0);
  objc_storeStrong((id *)&self->_rootActivityItems, 0);
  objc_storeStrong((id *)&self->_selectedActivity, 0);
  objc_storeStrong((id *)&self->_applicationActivities, 0);
  objc_storeStrong((id *)&self->_appAnalyticsProvider, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_analyticsAppearDate, 0);
}

@end
