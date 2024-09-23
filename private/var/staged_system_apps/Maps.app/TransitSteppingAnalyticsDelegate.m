@implementation TransitSteppingAnalyticsDelegate

- (void)recordSwipeToNextSignWithRouteDetails:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:routeDetails:", 6, 618, 0, v3);

}

- (void)recordSwipeToPreviousSignWithRouteDetails:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:routeDetails:", 5, 618, 0, v3);

}

- (void)recordTapToNextSignWithRouteDetails:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:routeDetails:", 16, 618, 0, v3);

}

- (void)recordTapToPreviousSignWithRouteDetails:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:routeDetails:", 15, 618, 0, v3);

}

- (void)recordTapOnTransitStationPOI
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v2, "captureUserAction:onTarget:eventValue:", 1011, 505, 0);

}

- (void)recordEnterGuidanceWithRouteDetails:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:routeDetails:", 3065, 618, 0, v3);

}

- (void)recordSignAutoAdvanceWithRouteDetails:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:routeDetails:", 3066, 618, 0, v3);

}

- (void)recordOpenRouteClusterActionSheet
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v2, "captureUserAction:onTarget:eventValue:", 3037, 618, 0);

}

- (void)recordOverviewTapOnTray
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v2, "captureUserAction:onTarget:eventValue:", 3050, 403, 0);

}

- (void)recordResumeFromOverviewTapOnTray
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v2, "captureUserAction:onTarget:eventValue:", 3051, 403, 0);

}

- (void)recordDetailsTapOnTray
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v2, "captureUserAction:onTarget:eventValue:", 3004, 403, 0);

}

- (void)recordEndSteppingTapOnTray
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v2, "captureUserAction:onTarget:eventValue:", 3002, 403, 0);

}

@end
