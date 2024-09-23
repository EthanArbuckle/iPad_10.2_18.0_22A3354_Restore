@implementation _ReportIncidentIntentHandlingTask

- (void)performTask
{
  void *v3;
  void *v4;
  void *v5;
  ReportIncidentAction *v6;
  MapsActivity *v7;
  id v8;
  void *v9;
  RichMapsActivity *v10;
  id v11;
  NSObject *v12;
  uint8_t v13[16];

  -[RichMapsActivityCreatingTaskImpl taskStarted](self, "taskStarted");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityHandlingTask userActivity](self, "userActivity"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "interaction"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "intent"));

  if (v5)
  {
    v6 = -[ReportIncidentAction initWithIncidentIntent:]([ReportIncidentAction alloc], "initWithIncidentIntent:", v5);
    -[MapsAction setUserLocationAccuracy:](v6, "setUserLocationAccuracy:", kCLLocationAccuracyBest);
    v7 = objc_alloc_init(MapsActivity);
    v8 = objc_alloc_init((Class)GEOURLOptions);
    -[MapsActivity setDisplayOptions:](v7, "setDisplayOptions:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity displayOptions](v7, "displayOptions"));
    objc_msgSend(v9, "setUserTrackingMode:", 1);

    v10 = -[RichMapsActivity initWithMapsActivity:mapsAction:]([RichMapsActivity alloc], "initWithMapsActivity:mapsAction:", v7, v6);
    -[UserActivityHandlingTask taskFinished:](self, "taskFinished:", v10);

  }
  else
  {
    v11 = sub_100431A4C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "_ReportIncidentIntentHandlingTask missing intent", v13, 2u);
    }

    -[RichMapsActivityCreatingTaskImpl taskFailed](self, "taskFailed");
  }

}

@end
