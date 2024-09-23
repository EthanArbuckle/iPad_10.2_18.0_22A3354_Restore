@implementation FTNewsAnalyticsWidgetEventTracker

- (FTNewsAnalyticsWidgetEventTracker)init
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
    v6 = "-[FTNewsAnalyticsWidgetEventTracker init]";
    v7 = 2080;
    v8 = "FTNewsAnalyticsWidgetEventTracker.m";
    v9 = 1024;
    v10 = 36;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FTNewsAnalyticsWidgetEventTracker init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (FTNewsAnalyticsWidgetEventTracker)initWithUserIDProvider:(id)a3
{
  id v4;
  FTNewsAnalyticsWidgetEventTracker *v5;
  NSSNewsAnalyticsSessionAnnotator *v6;
  NSSNewsAnalyticsSessionAnnotator *sessionAnnotator;
  FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker *v8;
  FTAggregateWidgetEventTracker *v9;
  void *v10;
  FTAggregateWidgetEventTracker *v11;
  FTConditionalWidgetEventTracker *v12;
  FTWidgetEventTracker *eventTrackersProxy;
  void *v14;
  uint64_t v15;
  NSArray *eventAccumulators;
  FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker *nonVideoContentEventTracker;
  FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker *v18;
  uint64_t v19;
  NSHashTable *observers;
  dispatch_group_t v21;
  OS_dispatch_group *submissionGroup;
  objc_super v24;
  void *v25;
  FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker *v26;

  v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100093614();
  v24.receiver = self;
  v24.super_class = (Class)FTNewsAnalyticsWidgetEventTracker;
  v5 = -[FTNewsAnalyticsWidgetEventTracker init](&v24, "init");
  if (v5)
  {
    v6 = objc_opt_new(NSSNewsAnalyticsSessionAnnotator);
    sessionAnnotator = v5->_sessionAnnotator;
    v5->_sessionAnnotator = v6;

    v8 = -[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker initWithSessionManager:userIDProvider:]([FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker alloc], "initWithSessionManager:userIDProvider:", v5, v4);
    v9 = [FTAggregateWidgetEventTracker alloc];
    v26 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
    v11 = -[FTAggregateWidgetEventTracker initWithEventTrackers:](v9, "initWithEventTrackers:", v10);

    v12 = -[FTConditionalWidgetEventTracker initWithWidgetEventTracker:predicate:]([FTConditionalWidgetEventTracker alloc], "initWithWidgetEventTracker:predicate:", v11, &stru_1000C6C28);
    eventTrackersProxy = v5->_eventTrackersProxy;
    v5->_eventTrackersProxy = (FTWidgetEventTracker *)v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker accumulator](v8, "accumulator"));
    v25 = v14;
    v15 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
    eventAccumulators = v5->_eventAccumulators;
    v5->_eventAccumulators = (NSArray *)v15;

    nonVideoContentEventTracker = v5->_nonVideoContentEventTracker;
    v5->_nonVideoContentEventTracker = v8;
    v18 = v8;

    v19 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 517));
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v19;

    v21 = dispatch_group_create();
    submissionGroup = v5->_submissionGroup;
    v5->_submissionGroup = (OS_dispatch_group *)v21;

  }
  return v5;
}

- (void)widgetDidAppearAtDate:(id)a3 withTrackableWidgetState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NTPBSession *v19;

  v6 = a4;
  v7 = a3;
  v19 = objc_opt_new(NTPBSession);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FTNewsAnalyticsWidgetEventTracker sessionAnnotator](self, "sessionAnnotator"));
  objc_msgSend(v8, "annotateSession:withOptions:", v19, 30719);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fetchInfoForVisibleResults"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "appConfigTreatmentID"));
  -[NTPBSession setAppConfigTreatmentId:](v19, "setAppConfigTreatmentId:", objc_msgSend(v12, "integerValue"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userID"));
  -[NTPBSession setUserId:](v19, "setUserId:", v13);

  -[NTPBSession setWidgetDisplayMode:](v19, "setWidgetDisplayMode:", -[FTNewsAnalyticsWidgetEventTracker _pbDisplayModeWithDisplayMode:](self, "_pbDisplayModeWithDisplayMode:", objc_msgSend(v6, "activeDisplayMode")));
  v14 = FCUUIDStringToUUIDBytes(v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  -[NTPBSession setWidgetSessionId:](v19, "setWidgetSessionId:", v15);

  -[NTPBSession setRunningObsolete:](v19, "setRunningObsolete:", 0);
  -[NTPBSession setUserSegmentationSegmentSetIds:count:](v19, "setUserSegmentationSegmentSetIds:count:", objc_msgSend(v9, "userSegmentationSegmentSetIds"), objc_msgSend(v9, "userSegmentationSegmentSetIdsCount"));
  -[NTPBSession setUserSegmentationTreatmentIds:count:](v19, "setUserSegmentationTreatmentIds:count:", objc_msgSend(v9, "userSegmentationTreatmentIds"), objc_msgSend(v9, "userSegmentationTreatmentIdsCount"));
  -[FTNewsAnalyticsWidgetEventTracker setCurrentSession:](self, "setCurrentSession:", v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FTNewsAnalyticsWidgetEventTracker observers](self, "observers"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allObjects"));
  objc_msgSend(v17, "makeObjectsPerformSelector:withObject:", "sessionDidStartWithSessionID:", v11);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FTNewsAnalyticsWidgetEventTracker eventTrackersProxy](self, "eventTrackersProxy"));
  objc_msgSend(v18, "widgetDidAppearAtDate:withTrackableWidgetState:", v7, v6);

}

- (void)widgetDidDisappearAtDate:(id)a3 withTrackableWidgetState:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[5];

  v6 = a4;
  v7 = a3;
  v8 = -[FTNewsAnalyticsWidgetEventTracker _pbDisplayModeWithDisplayMode:](self, "_pbDisplayModeWithDisplayMode:", objc_msgSend(v6, "activeDisplayMode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FTNewsAnalyticsWidgetEventTracker currentSession](self, "currentSession"));
  objc_msgSend(v9, "setWidgetDisplayModeSessionEnd:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FTNewsAnalyticsWidgetEventTracker eventTrackersProxy](self, "eventTrackersProxy"));
  objc_msgSend(v10, "widgetDidDisappearAtDate:withTrackableWidgetState:", v7, v6);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FTNewsAnalyticsWidgetEventTracker observers](self, "observers"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allObjects"));
  objc_msgSend(v12, "makeObjectsPerformSelector:", "sessionWillEnd");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FTNewsAnalyticsWidgetEventTracker eventAccumulators](self, "eventAccumulators"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fc_arrayByTransformingWithBlock:", &stru_1000C6C68));

  if (objc_msgSend(v14, "count"))
  {
    v15 = objc_claimAutoreleasedReturnValue(-[FTNewsAnalyticsWidgetEventTracker submissionGroup](self, "submissionGroup"));
    dispatch_group_enter(v15);

    v16 = (void *)objc_opt_new(NSSNewsAnalyticsSubmitEnvelopesOperation);
    objc_msgSend(v16, "setEnvelopes:", v14);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000DB4C;
    v17[3] = &unk_1000C6C90;
    v17[4] = self;
    objc_msgSend(v16, "setSubmissionCompletion:", v17);
    objc_msgSend(v16, "start");

  }
  -[FTNewsAnalyticsWidgetEventTracker setCurrentSession:](self, "setCurrentSession:", 0);

}

- (void)widgetPerformedUpdateWithTodayResults:(id)a3 fetchInfo:(id)a4 error:(id)a5 updateFetchDuration:(double)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[FTNewsAnalyticsWidgetEventTracker eventTrackersProxy](self, "eventTrackersProxy"));
  objc_msgSend(v13, "widgetPerformedUpdateWithTodayResults:fetchInfo:error:updateFetchDuration:", v12, v11, v10, a6);

}

- (void)visibleItemsDidChangeAtDate:(id)a3 withTriggerEvent:(unint64_t)a4 trackableWidgetState:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[FTNewsAnalyticsWidgetEventTracker eventTrackersProxy](self, "eventTrackersProxy"));
  objc_msgSend(v10, "visibleItemsDidChangeAtDate:withTriggerEvent:trackableWidgetState:", v9, a4, v8);

}

- (void)userEngagedWithWidgetAtDate:(id)a3 actionURL:(id)a4 trackableWidgetState:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[FTNewsAnalyticsWidgetEventTracker eventTrackersProxy](self, "eventTrackersProxy"));
  objc_msgSend(v11, "userEngagedWithWidgetAtDate:actionURL:trackableWidgetState:", v10, v9, v8);

}

- (void)submitEventsIfNeededWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[FTNewsAnalyticsWidgetEventTracker submissionGroup](self, "submissionGroup"));
  dispatch_group_notify(v5, (dispatch_queue_t)&_dispatch_main_q, v4);

}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[NSThread isMainThread](NSThread, "isMainThread");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FTNewsAnalyticsWidgetEventTracker observers](self, "observers"));
  objc_msgSend(v5, "addObject:", v4);

}

- (int)_pbDisplayModeWithDisplayMode:(unint64_t)a3
{
  if (a3 - 1 < 7)
    return a3;
  else
    return 0;
}

- (FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker)nonVideoContentEventTracker
{
  return self->_nonVideoContentEventTracker;
}

- (NSArray)eventAccumulators
{
  return self->_eventAccumulators;
}

- (void)setEventAccumulators:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (FTWidgetEventTracker)eventTrackersProxy
{
  return self->_eventTrackersProxy;
}

- (void)setEventTrackersProxy:(id)a3
{
  objc_storeStrong((id *)&self->_eventTrackersProxy, a3);
}

- (NSSNewsAnalyticsSessionAnnotator)sessionAnnotator
{
  return self->_sessionAnnotator;
}

- (void)setSessionAnnotator:(id)a3
{
  objc_storeStrong((id *)&self->_sessionAnnotator, a3);
}

- (NTPBSession)currentSession
{
  return self->_currentSession;
}

- (void)setCurrentSession:(id)a3
{
  objc_storeStrong((id *)&self->_currentSession, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (OS_dispatch_group)submissionGroup
{
  return self->_submissionGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submissionGroup, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_sessionAnnotator, 0);
  objc_storeStrong((id *)&self->_eventTrackersProxy, 0);
  objc_storeStrong((id *)&self->_eventAccumulators, 0);
  objc_storeStrong((id *)&self->_nonVideoContentEventTracker, 0);
}

@end
