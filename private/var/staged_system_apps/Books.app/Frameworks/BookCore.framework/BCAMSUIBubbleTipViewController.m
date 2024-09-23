@implementation BCAMSUIBubbleTipViewController

- (BCAMSUIBubbleTipViewController)initWithRequest:(id)a3 placement:(id)a4
{
  return -[BCAMSUIBubbleTipViewController initWithRequest:placement:messageType:](self, "initWithRequest:placement:messageType:", a3, a4, 6);
}

- (BCAMSUIBubbleTipViewController)initWithRequest:(id)a3 placement:(id)a4 messageType:(int64_t)a5
{
  id v8;
  id v9;
  BCAMSUIBubbleTipViewController *v10;
  BCAMSUIBubbleTipViewController *v11;

  v8 = a3;
  v9 = a4;
  v10 = -[BCAMSUIBubbleTipViewController initWithRequest:](self, "initWithRequest:", v8);
  v11 = v10;
  if (v10)
  {
    -[BCAMSUIBubbleTipViewController setPlacement:](v10, "setPlacement:", v9);
    -[BCAMSUIBubbleTipViewController setBc_request:](v11, "setBc_request:", v8);
    -[BCAMSUIBubbleTipViewController setMessageType:](v11, "setMessageType:", a5);
    v11->_isOnScreen = 1;
  }

  return v11;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BCAMSUIBubbleTipViewController;
  -[BCAMSUIBubbleTipViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[BCAMSUIBubbleTipViewController bc_analyticsVisibilityUpdateSubtree](self, "bc_analyticsVisibilityUpdateSubtree");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BCAMSUIBubbleTipViewController;
  -[BCAMSUIBubbleTipViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[BCAMSUIBubbleTipViewController bc_analyticsVisibilityUpdateSubtree](self, "bc_analyticsVisibilityUpdateSubtree");
}

- (void)setIsOnScreen:(BOOL)a3
{
  if (-[BCAMSUIBubbleTipViewController isOnScreen](self, "isOnScreen") != a3)
  {
    self->_isOnScreen = a3;
    if (-[BCAMSUIBubbleTipViewController bc_analyticsVisibility](self, "bc_analyticsVisibility"))
    {
      if (!self->_isOnScreen
        || (-[BCAMSUIBubbleTipViewController bc_startImpressionEventTracking](self, "bc_startImpressionEventTracking"),
            !self->_isOnScreen))
      {
        -[BCAMSUIBubbleTipViewController bc_submitImpressionEvent](self, "bc_submitImpressionEvent");
      }
    }
  }
}

- (void)reportActionTriggered:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  id v16;

  v16 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCAMSUIBubbleTipViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
  if (v4)
  {
    if ((char *)-[BCAMSUIBubbleTipViewController messageType](self, "messageType") == (char *)&dword_4 + 2)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCAMSUIBubbleTipViewController presentingViewController](self, "presentingViewController"));
      -[BCAMSUIBubbleTipViewController setMessageType:](self, "setMessageType:", v5 == 0);

    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCAMSUIBubbleTipViewController bc_request](self, "bc_request"));
    v7 = sub_A9794(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "deepLink"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "absoluteString"));
    v12 = -[BCAMSUIBubbleTipViewController messageType](self, "messageType");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCAMSUIBubbleTipViewController messageId](self, "messageId"));
    v14 = objc_msgSend(v8, "count") != 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BCAMSUIBubbleTipViewController placement](self, "placement"));
    objc_msgSend(v9, "emitUnifiedMessageActionEventWithTracker:startDate:messageType:messageIdentifier:hasActionable:actionIdentifier:placementName:", v4, v11, v12, v13, v14, v8, v15);

  }
}

- (void)bc_analyticsVisibilityDidAppear
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BCAMSUIBubbleTipViewController;
  -[BCAMSUIBubbleTipViewController bc_analyticsVisibilityDidAppear](&v3, "bc_analyticsVisibilityDidAppear");
  if (-[BCAMSUIBubbleTipViewController isOnScreen](self, "isOnScreen"))
    -[BCAMSUIBubbleTipViewController bc_startImpressionEventTracking](self, "bc_startImpressionEventTracking");
}

- (void)bc_analyticsVisibilityDidDisappear
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BCAMSUIBubbleTipViewController;
  -[BCAMSUIBubbleTipViewController bc_analyticsVisibilityDidDisappear](&v3, "bc_analyticsVisibilityDidDisappear");
  if (-[BCAMSUIBubbleTipViewController isOnScreen](self, "isOnScreen"))
    -[BCAMSUIBubbleTipViewController bc_submitImpressionEvent](self, "bc_submitImpressionEvent");
}

- (void)bc_startImpressionEventTracking
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  -[BCAMSUIBubbleTipViewController setImpressionStartTime:](self, "setImpressionStartTime:", v3);

}

- (void)bc_submitImpressionEvent
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  id v13;

  v13 = (id)objc_claimAutoreleasedReturnValue(-[BCAMSUIBubbleTipViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
  if (v13)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCAMSUIBubbleTipViewController impressionStartTime](self, "impressionStartTime"));

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCAMSUIBubbleTipViewController bc_request](self, "bc_request"));
      v5 = sub_A9794(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCAMSUIBubbleTipViewController impressionStartTime](self, "impressionStartTime"));
      v9 = -[BCAMSUIBubbleTipViewController messageType](self, "messageType");
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BCAMSUIBubbleTipViewController messageId](self, "messageId"));
      v11 = objc_msgSend(v6, "count") != 0;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCAMSUIBubbleTipViewController placement](self, "placement"));
      objc_msgSend(v7, "emitUnifiedMessageExposureEventWithTracker:startDate:messageType:messageIdentifier:hasActionable:actionIdentifier:placementName:", v13, v8, v9, v10, v11, v6, v12);

    }
  }
  -[BCAMSUIBubbleTipViewController setImpressionStartTime:](self, "setImpressionStartTime:", 0);

}

- (id)messageId
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCAMSUIBubbleTipViewController bc_request](self, "bc_request"));
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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCAMSUIBubbleTipViewController bc_request](self, "bc_request"));
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

- (int64_t)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(int64_t)a3
{
  self->_messageType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impressionStartTime, 0);
  objc_storeStrong((id *)&self->_placement, 0);
  objc_storeStrong((id *)&self->_bc_request, 0);
}

@end
