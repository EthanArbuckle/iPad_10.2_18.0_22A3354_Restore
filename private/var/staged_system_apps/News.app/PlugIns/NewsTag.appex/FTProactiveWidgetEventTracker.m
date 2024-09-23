@implementation FTProactiveWidgetEventTracker

- (FTProactiveWidgetEventTracker)init
{
  id v2;
  void *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v6 = "-[FTProactiveWidgetEventTracker init]";
    v7 = 2080;
    v8 = "FTProactiveWidgetEventTracker.m";
    v9 = 1024;
    v10 = 31;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FTProactiveWidgetEventTracker init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (FTProactiveWidgetEventTracker)initWithMaxRowCount:(unint64_t)a3 trackedEvents:(unint64_t)a4
{
  FTProactiveWidgetEventTracker *v6;
  FTProactiveWidgetEventTracker *v7;
  NTHeadlineEngagementEventTracker *v8;
  NTHeadlineEngagementEventTracker *headlineEngagementEventTracker;
  FTWidgetAppearanceEventTracker *v10;
  FTWidgetAppearanceEventTracker *widgetAppearanceEventTracker;
  FTWidgetUpdateEventTracker *v12;
  FTWidgetUpdateEventTracker *widgetUpdateEventTracker;
  FTWidgetLingerEventTracker *v14;
  FTWidgetLingerEventTracker *widgetLingerEventTracker;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)FTProactiveWidgetEventTracker;
  v6 = -[FTProactiveWidgetEventTracker init](&v17, "init");
  v7 = v6;
  if (v6)
  {
    v6->_trackedEvents = a4;
    v8 = -[NTHeadlineEngagementEventTracker initWithMaxRowCount:]([NTHeadlineEngagementEventTracker alloc], "initWithMaxRowCount:", a3);
    headlineEngagementEventTracker = v7->_headlineEngagementEventTracker;
    v7->_headlineEngagementEventTracker = v8;

    v10 = -[FTWidgetAppearanceEventTracker initWithMaxRowCount:]([FTWidgetAppearanceEventTracker alloc], "initWithMaxRowCount:", a3);
    widgetAppearanceEventTracker = v7->_widgetAppearanceEventTracker;
    v7->_widgetAppearanceEventTracker = v10;

    v12 = objc_opt_new(FTWidgetUpdateEventTracker);
    widgetUpdateEventTracker = v7->_widgetUpdateEventTracker;
    v7->_widgetUpdateEventTracker = v12;

    v14 = objc_opt_new(FTWidgetLingerEventTracker);
    widgetLingerEventTracker = v7->_widgetLingerEventTracker;
    v7->_widgetLingerEventTracker = v14;

  }
  return v7;
}

- (void)widgetDidAppearAtDate:(id)a3 withTrackableWidgetState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100082CA0();
  if ((-[FTProactiveWidgetEventTracker trackedEvents](self, "trackedEvents") & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fetchInfoForVisibleResults"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "todaySourceIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "appConfigTreatmentID"));
    v11 = objc_msgSend(v7, "appearanceType");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FTProactiveWidgetEventTracker widgetAppearanceEventTracker](self, "widgetAppearanceEventTracker"));
    objc_msgSend(v12, "trackAppearanceAtDate:withHeadlineSource:appConfigTreatmentID:appearanceType:allItemsCount:", v6, v9, v10, v11, objc_msgSend(v7, "allItemsCount"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FTProactiveWidgetEventTracker widgetLingerEventTracker](self, "widgetLingerEventTracker"));
    objc_msgSend(v13, "trackWidgetLingerEventExtremity:atDate:withTodaySource:appConfigTreatmentID:widgetDisplayMode:appearanceType:", 0, v6, v9, v10, objc_msgSend(v7, "activeDisplayMode"), v11);

  }
}

- (void)widgetDidDisappearAtDate:(id)a3 withTrackableWidgetState:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if ((-[FTProactiveWidgetEventTracker trackedEvents](self, "trackedEvents") & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FTProactiveWidgetEventTracker widgetAppearanceEventTracker](self, "widgetAppearanceEventTracker"));
    objc_msgSend(v7, "trackDisappearance");

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fetchInfoForVisibleResults"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FTProactiveWidgetEventTracker widgetLingerEventTracker](self, "widgetLingerEventTracker"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "todaySourceIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "appConfigTreatmentID"));
    objc_msgSend(v9, "trackWidgetLingerEventExtremity:atDate:withTodaySource:appConfigTreatmentID:widgetDisplayMode:appearanceType:", 1, v12, v10, v11, objc_msgSend(v6, "activeDisplayMode"), objc_msgSend(v6, "appearanceType"));

  }
}

- (void)widgetPerformedUpdateWithTodayResults:(id)a3 fetchInfo:(id)a4 error:(id)a5 updateFetchDuration:(double)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v9 = a5;
  if ((-[FTProactiveWidgetEventTracker trackedEvents](self, "trackedEvents") & 2) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FTProactiveWidgetEventTracker widgetUpdateEventTracker](self, "widgetUpdateEventTracker"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "todaySourceIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "appConfigTreatmentID"));
    objc_msgSend(v10, "trackUpdateWithTodaySource:appConfigTreatmentID:error:updateFetchDuration:wifiReachable:cellularRadioAccessTechnology:", v11, v12, v9, objc_msgSend(v13, "wifiReachable"), objc_msgSend(v13, "cellularRadioAccessTechnology"), a6);

  }
}

- (NTHeadlineEngagementEventTracker)headlineEngagementEventTracker
{
  return self->_headlineEngagementEventTracker;
}

- (void)setHeadlineEngagementEventTracker:(id)a3
{
  objc_storeStrong((id *)&self->_headlineEngagementEventTracker, a3);
}

- (FTWidgetAppearanceEventTracker)widgetAppearanceEventTracker
{
  return self->_widgetAppearanceEventTracker;
}

- (void)setWidgetAppearanceEventTracker:(id)a3
{
  objc_storeStrong((id *)&self->_widgetAppearanceEventTracker, a3);
}

- (FTWidgetLingerEventTracker)widgetLingerEventTracker
{
  return self->_widgetLingerEventTracker;
}

- (void)setWidgetLingerEventTracker:(id)a3
{
  objc_storeStrong((id *)&self->_widgetLingerEventTracker, a3);
}

- (FTWidgetUpdateEventTracker)widgetUpdateEventTracker
{
  return self->_widgetUpdateEventTracker;
}

- (void)setWidgetUpdateEventTracker:(id)a3
{
  objc_storeStrong((id *)&self->_widgetUpdateEventTracker, a3);
}

- (unint64_t)trackedEvents
{
  return self->_trackedEvents;
}

- (void)setTrackedEvents:(unint64_t)a3
{
  self->_trackedEvents = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetUpdateEventTracker, 0);
  objc_storeStrong((id *)&self->_widgetLingerEventTracker, 0);
  objc_storeStrong((id *)&self->_widgetAppearanceEventTracker, 0);
  objc_storeStrong((id *)&self->_headlineEngagementEventTracker, 0);
}

@end
