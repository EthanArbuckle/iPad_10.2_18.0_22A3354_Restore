@implementation PPXWelcomeGDPRViewController

- (id)ba_setupNewAnalyticsTrackerWithName:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PPXWelcomeGDPRViewController;
  v5 = -[PPXWelcomeGDPRViewController ba_setupNewAnalyticsTrackerWithName:](&v14, "ba_setupNewAnalyticsTrackerWithName:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[PPXJSAWindowProvider sharedProvider](PPXJSAWindowProvider, "sharedProvider"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rootViewController"));
    v10 = objc_msgSend(v9, "bc_firstVisibleChildViewControllerOfClass:includePresented:", objc_opt_class(_TtC25BooksProductPageExtension29ProductPageRootViewController), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ba_effectiveAnalyticsTracker"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "chainWithName:", v4));
    -[PPXWelcomeGDPRViewController ba_setAnalyticsTracker:](self, "ba_setAnalyticsTracker:", v6);

  }
  return v6;
}

@end
