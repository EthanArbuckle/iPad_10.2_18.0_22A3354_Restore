@implementation BCAMSUIBannerMessageViewController

- (BCAMSUIBannerMessageViewController)initWithRequest:(id)a3 placement:(id)a4
{
  id v6;
  id v7;
  BCAMSUIBannerMessageViewController *v8;
  BCAMSUIBannerMessageViewController *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[BCAMSUIBannerMessageViewController initWithRequest:](self, "initWithRequest:", v6);
  v9 = v8;
  if (v8)
  {
    -[BCAMSUIBannerMessageViewController setPlacement:](v8, "setPlacement:", v7);
    -[BCAMSUIBannerMessageViewController setBc_request:](v9, "setBc_request:", v6);
    v9->_isOnScreen = 1;
  }

  return v9;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BCAMSUIBannerMessageViewController;
  -[BCAMSUIBannerMessageViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[BCAMSUIBannerMessageViewController bc_analyticsVisibilityUpdateSubtree](self, "bc_analyticsVisibilityUpdateSubtree");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BCAMSUIBannerMessageViewController;
  -[BCAMSUIBannerMessageViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[BCAMSUIBannerMessageViewController bc_analyticsVisibilityUpdateSubtree](self, "bc_analyticsVisibilityUpdateSubtree");
}

- (void)setIsOnScreen:(BOOL)a3
{
  if (-[BCAMSUIBannerMessageViewController isOnScreen](self, "isOnScreen") != a3)
  {
    self->_isOnScreen = a3;
    if (-[BCAMSUIBannerMessageViewController bc_analyticsVisibility](self, "bc_analyticsVisibility"))
    {
      if (!self->_isOnScreen
        || (-[BCAMSUIBannerMessageViewController bc_startImpressionEventTracking](self, "bc_startImpressionEventTracking"), !self->_isOnScreen))
      {
        -[BCAMSUIBannerMessageViewController bc_submitImpressionEvent](self, "bc_submitImpressionEvent");
      }
    }
  }
}

- (void)reportActionTriggered:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  id v16;

  v16 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCAMSUIBannerMessageViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCAMSUIBannerMessageViewController bc_request](self, "bc_request"));
    v6 = sub_A9794(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "deepLink"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "absoluteString"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCAMSUIBannerMessageViewController presentingViewController](self, "presentingViewController"));
    if (v11)
      v12 = 2;
    else
      v12 = 3;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCAMSUIBannerMessageViewController messageId](self, "messageId"));
    v14 = objc_msgSend(v7, "count") != 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BCAMSUIBannerMessageViewController placement](self, "placement"));
    objc_msgSend(v8, "emitUnifiedMessageActionEventWithTracker:startDate:messageType:messageIdentifier:hasActionable:actionIdentifier:placementName:", v4, v10, v12, v13, v14, v7, v15);

  }
}

- (void)bc_analyticsVisibilityDidAppear
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BCAMSUIBannerMessageViewController;
  -[BCAMSUIBannerMessageViewController bc_analyticsVisibilityDidAppear](&v3, "bc_analyticsVisibilityDidAppear");
  if (-[BCAMSUIBannerMessageViewController isOnScreen](self, "isOnScreen"))
    -[BCAMSUIBannerMessageViewController bc_startImpressionEventTracking](self, "bc_startImpressionEventTracking");
}

- (void)bc_analyticsVisibilityDidDisappear
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BCAMSUIBannerMessageViewController;
  -[BCAMSUIBannerMessageViewController bc_analyticsVisibilityDidDisappear](&v3, "bc_analyticsVisibilityDidDisappear");
  if (-[BCAMSUIBannerMessageViewController isOnScreen](self, "isOnScreen"))
    -[BCAMSUIBannerMessageViewController bc_submitImpressionEvent](self, "bc_submitImpressionEvent");
}

- (void)bc_startImpressionEventTracking
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  -[BCAMSUIBannerMessageViewController setImpressionStartTime:](self, "setImpressionStartTime:", v3);

}

- (void)bc_submitImpressionEvent
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  id v14;

  v14 = (id)objc_claimAutoreleasedReturnValue(-[BCAMSUIBannerMessageViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
  if (v14)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCAMSUIBannerMessageViewController impressionStartTime](self, "impressionStartTime"));

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCAMSUIBannerMessageViewController bc_request](self, "bc_request"));
      v5 = sub_A9794(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCAMSUIBannerMessageViewController impressionStartTime](self, "impressionStartTime"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCAMSUIBannerMessageViewController presentingViewController](self, "presentingViewController"));
      if (v9)
        v10 = 2;
      else
        v10 = 3;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCAMSUIBannerMessageViewController messageId](self, "messageId"));
      v12 = objc_msgSend(v6, "count") != 0;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCAMSUIBannerMessageViewController placement](self, "placement"));
      objc_msgSend(v7, "emitUnifiedMessageExposureEventWithTracker:startDate:messageType:messageIdentifier:hasActionable:actionIdentifier:placementName:", v14, v8, v10, v11, v12, v6, v13);

    }
  }
  -[BCAMSUIBannerMessageViewController setImpressionStartTime:](self, "setImpressionStartTime:", 0);

}

- (id)messageId
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCAMSUIBannerMessageViewController bc_request](self, "bc_request"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "metricsEvent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "underlyingDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("messageId")));

  return v5;
}

- (id)messagePlacement
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCAMSUIBannerMessageViewController bc_request](self, "bc_request"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "metricsEvent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "underlyingDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("placement")));

  return v5;
}

- (BOOL)isOnScreen
{
  return self->_isOnScreen;
}

- (AMSDialogRequest)bc_request
{
  return self->_bc_request;
}

- (void)setBc_request:(id)a3
{
  objc_storeStrong((id *)&self->_bc_request, a3);
}

- (NSString)placement
{
  return self->_placement;
}

- (void)setPlacement:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)impressionStartTime
{
  return self->_impressionStartTime;
}

- (void)setImpressionStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_impressionStartTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impressionStartTime, 0);
  objc_storeStrong((id *)&self->_placement, 0);
  objc_storeStrong((id *)&self->_bc_request, 0);
}

@end
