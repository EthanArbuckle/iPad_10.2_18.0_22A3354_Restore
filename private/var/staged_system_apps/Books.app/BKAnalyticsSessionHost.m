@implementation BKAnalyticsSessionHost

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (BKAnalyticsSessionHost)initWithAnalyticsManager:(id)a3
{
  id v4;
  BKAnalyticsSessionHost *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BKAnalyticsSessionHost;
  v5 = -[BKAnalyticsSessionHost init](&v7, "init");
  if (v5)
  {
    if (!v4)
      BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKAnalyticsSessionHost.m", 30, "-[BKAnalyticsSessionHost initWithAnalyticsManager:]", "manager", CFSTR("You need to initialize BKAnalyticsSessionHost with an App Analytics Manager."));
    -[BKAnalyticsSessionHost setAnalyticsManager:](v5, "setAnalyticsManager:", v4);
  }

  return v5;
}

- (id)primaryAnalyticsController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "primaryAnalyticsController"));

  return v3;
}

- (id)keyWindowAnalyticsTracker
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "keyWindowAnalyticsTracker"));

  return v3;
}

- (void)listeningSessionWillEnd
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v4 = objc_msgSend(v3, "applicationState");

  if (v4 == (id)2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAnalyticsSessionHost analyticsManager](self, "analyticsManager"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "analyticsController"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "applicationTracker"));
    objc_msgSend(v6, "pushSessionEndReasonDataWithReason:file:line:", 2, CFSTR("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKAnalyticsSessionHost.m"), 56);

  }
}

- (void)playSessionDidEnd:(id)a3 playTime:(double)a4
{
  void *v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(v10, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAnalyticsSessionHost analyticsManager](self, "analyticsManager"));
    objc_msgSend(v6, "analyticsAccumulatedListenTime");
    objc_msgSend(v6, "setAnalyticsAccumulatedListenTime:", v7 + a4);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAnalyticsSessionHost analyticsManager](self, "analyticsManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "analyticsAccumulatedListenIDs"));
    objc_msgSend(v9, "addObject:", v10);

  }
}

- (void)readSessionDidEnd:(id)a3 readTime:(double)a4
{
  void *v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(v10, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAnalyticsSessionHost analyticsManager](self, "analyticsManager"));
    objc_msgSend(v6, "analyticsAccumulatedReadTime");
    objc_msgSend(v6, "setAnalyticsAccumulatedReadTime:", v7 + a4);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAnalyticsSessionHost analyticsManager](self, "analyticsManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "analyticsAccumulatedReadIDs"));
    objc_msgSend(v9, "addObject:", v10);

  }
}

- (id)contentPrivateIDForContentID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAnalyticsSessionHost analyticsManager](self, "analyticsManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "analyticsController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentPrivateIDForContentID:", v4));

  return v7;
}

- (id)contentUserIDForContentID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAnalyticsSessionHost analyticsManager](self, "analyticsManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "analyticsController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentUserIDForContentID:", v4));

  return v7;
}

- (BKAppAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsManager, 0);
}

@end
