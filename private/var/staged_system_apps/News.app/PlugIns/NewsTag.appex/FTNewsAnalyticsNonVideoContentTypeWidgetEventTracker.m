@implementation FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker

- (FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker)init
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
    v6 = "-[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker init]";
    v7 = 2080;
    v8 = "FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker.m";
    v9 = 1024;
    v10 = 72;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker)initWithSessionManager:(id)a3 userIDProvider:(id)a4
{
  id v6;
  id v7;
  FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker *v8;
  NSSNewsAnalyticsEventAnnotator *v9;
  NSSNewsAnalyticsEventAnnotator *eventAnnotator;
  NSMutableArray *v11;
  NSMutableArray *lastVisibleItemsChangePairs;
  NSMutableArray *v13;
  NSMutableArray *outstandingItemExposureEvents;
  id v15;
  NSSNewsAnalyticsPBEventAccumulator *v16;
  NSSNewsAnalyticsPBEventAccumulator *accumulator;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000806B8();
    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100080600();
LABEL_6:
  v19.receiver = self;
  v19.super_class = (Class)FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker;
  v8 = -[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker init](&v19, "init");
  if (v8)
  {
    v9 = (NSSNewsAnalyticsEventAnnotator *)objc_msgSend(objc_alloc((Class)NSSNewsAnalyticsEventAnnotator), "initWithSessionManager:userIDProvider:", v6, v7);
    eventAnnotator = v8->_eventAnnotator;
    v8->_eventAnnotator = v9;

    v11 = objc_opt_new(NSMutableArray);
    lastVisibleItemsChangePairs = v8->_lastVisibleItemsChangePairs;
    v8->_lastVisibleItemsChangePairs = v11;

    v13 = objc_opt_new(NSMutableArray);
    outstandingItemExposureEvents = v8->_outstandingItemExposureEvents;
    v8->_outstandingItemExposureEvents = v13;

    v15 = objc_msgSend(objc_alloc((Class)NSSNewsAnalyticsEnvelopeDescriptor), "initWithContentType:contentTypeVersion:contentTypeMinorVersion:contentTypePatchVersion:", 3, 1, 0, 0);
    v16 = (NSSNewsAnalyticsPBEventAccumulator *)objc_msgSend(objc_alloc((Class)NSSNewsAnalyticsPBEventAccumulator), "initWithEnvelopeDescriptor:sessionManager:", v15, v6);
    accumulator = v8->_accumulator;
    v8->_accumulator = v16;

    objc_storeStrong((id *)&v8->_userIDProvider, a4);
  }

  return v8;
}

- (void)visibleItemsDidChangeAtDate:(id)a3 withTriggerEvent:(unint64_t)a4 trackableWidgetState:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[5];
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;

  v8 = a3;
  v9 = a5;
  if (!v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100080828();
    if (v9)
      goto LABEL_6;
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100080770();
LABEL_6:
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker lastVisibleItemsChangeDate](self, "lastVisibleItemsChangeDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker outstandingItemExposureEvents](self, "outstandingItemExposureEvents"));
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_10000DEDC;
  v52[3] = &unk_1000AA4C8;
  v12 = v10;
  v53 = v12;
  v13 = v8;
  v54 = v13;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v52);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker accumulator](self, "accumulator"));
  objc_msgSend(v14, "observeEvents:", v11);

  -[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker setItemExposuresSinceLastWidgetAppearance:](self, "setItemExposuresSinceLastWidgetAppearance:", (char *)objc_msgSend(v11, "count")+ -[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker itemExposuresSinceLastWidgetAppearance](self, "itemExposuresSinceLastWidgetAppearance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "visibleItems"));
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_10000DF38;
  v49[3] = &unk_1000AA4F0;
  v49[4] = self;
  v16 = v9;
  v50 = v16;
  v17 = v15;
  v51 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fc_arrayByTransformingWithBlock:", v49));
  v19 = objc_msgSend(v18, "mutableCopy");
  -[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker setOutstandingItemExposureEvents:](self, "setOutstandingItemExposureEvents:", v19);

  if (a4 == 4)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker widgetAppearanceDate](self, "widgetAppearanceDate"));
    if (v20)
    {
      v21 = (void *)objc_opt_new(NTPBTodayWidgetExposure);
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "entryID"));
      objc_msgSend(v21, "setEntryId:", v22);

      v23 = objc_msgSend(v16, "appearanceType");
      if ((unint64_t)v23 < 4)
        v24 = ((_DWORD)v23 + 1);
      else
        v24 = 0;
      objc_msgSend(v21, "setWidgetAppearanceType:", v24);
      objc_msgSend(v21, "setWidgetArticleCount:", -[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker lastVisibleItemsChangeArticleCount](self, "lastVisibleItemsChangeArticleCount"));
      objc_msgSend(v21, "setWidgetHeadlineExposureCount:", -[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker itemExposuresSinceLastWidgetAppearance](self, "itemExposuresSinceLastWidgetAppearance"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker lastVisibleItemsChangePairs](self, "lastVisibleItemsChangePairs"));
      v26 = objc_msgSend(v25, "mutableCopy");
      objc_msgSend(v21, "setWidgetSectionsArticleCountPairs:", v26);

      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "contentID"));
      objc_msgSend(v21, "setContentId:", v27);

      objc_msgSend(v21, "setWidgetType:", -[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker _pbWidgetTypeWithStackKind:](self, "_pbWidgetTypeWithStackKind:", objc_msgSend(v16, "stackKind")));
      objc_msgSend(v21, "setWidgetExposureStackLocation:", -[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker _pbStackLocationWithStackLocation:](self, "_pbStackLocationWithStackLocation:", objc_msgSend(v16, "stackLocation")));
      v43 = (void *)objc_opt_new(NTPBEventObject);
      objc_msgSend(v43, "setTodayWidgetExposure:", v21);
      v44 = v12;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NTPBEvent nss_eventWithIdentifier](NTPBEvent, "nss_eventWithIdentifier"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v28, "ft_setTemporalBoundsBySanitizingStartDate:endDate:", v20, v29);

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker eventAnnotator](self, "eventAnnotator"));
      objc_msgSend(v30, "annotateEvent:withOptions:", v28, 47);

      -[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker _annotateEvent:withTrackableWidgetState:](self, "_annotateEvent:withTrackableWidgetState:", v28, v16);
      objc_msgSend(v28, "setEventObject:", v43);
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fetchInfoForVisibleResults"));
      v32 = v13;
      v33 = v20;
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "CTRByPersonalizationFeatureID"));
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_10000E1C8;
      v47[3] = &unk_1000AA518;
      v48 = v21;
      v35 = v21;
      objc_msgSend(v34, "enumerateKeysAndObjectsUsingBlock:", v47);

      v36 = (void *)objc_claimAutoreleasedReturnValue(-[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker accumulator](self, "accumulator"));
      objc_msgSend(v36, "observeEvent:", v28);

      v20 = v33;
      v13 = v32;
      -[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker setWidgetAppearanceDate:](self, "setWidgetAppearanceDate:", 0);
      -[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker setItemExposuresSinceLastWidgetAppearance:](self, "setItemExposuresSinceLastWidgetAppearance:", 0);

      v12 = v44;
    }

  }
  -[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker setLastVisibleItemsChangeDate:](self, "setLastVisibleItemsChangeDate:", v13);
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "visibleSections"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "extentsOfSections:", v37));

  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "visibleSections"));
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_10000E25C;
  v45[3] = &unk_1000AA540;
  v46 = v38;
  v40 = v38;
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "fc_arrayByTransformingWithBlock:", v45));
  v42 = objc_msgSend(v41, "mutableCopy");
  -[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker setLastVisibleItemsChangePairs:](self, "setLastVisibleItemsChangePairs:", v42);

  -[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker setLastVisibleItemsChangeArticleCount:](self, "setLastVisibleItemsChangeArticleCount:", objc_msgSend(v17, "count"));
}

- (id)engagementWithRowAtDate:(id)a3 forHeadline:(id)a4 withTrackableWidgetState:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = a4;
  v8 = a5;
  v9 = (void *)NTNewsSourceIdentifier;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fetchInfoForVisibleResults"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "todaySourceIdentifier"));
  LODWORD(v9) = objc_msgSend(v9, "isEqualToString:", v11);

  if ((_DWORD)v9
    && (v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "analyticsElement")), v12, v12))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sectionForItem:", v7));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker _widgetEngagementForHeadline:inSection:withTrackableWidgetState:](self, "_widgetEngagementForHeadline:inSection:withTrackableWidgetState:", v7, v13, v8));
    objc_msgSend(v14, "setWidgetEngagementType:", 1);
    v15 = (void *)objc_opt_new(NTPBEventObject);
    objc_msgSend(v15, "setWidgetEngagement:", v14);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)engagementWithEmbedTapTargetAtDate:(id)a3 withEmbedURL:(id)a4 targetURL:(id)a5 trackableWidgetState:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = (void *)NTNewsSourceIdentifier;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fetchInfoForVisibleResults"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "todaySourceIdentifier"));
  LODWORD(v12) = objc_msgSend(v12, "isEqualToString:", v14);

  if ((_DWORD)v12)
  {
    v15 = -[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker _newWidgetEngagementWithTrackableWidgetState:](self, "_newWidgetEngagementWithTrackableWidgetState:", v11);
    objc_msgSend(v15, "setWidgetEngagementType:", 5);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "absoluteString"));
    objc_msgSend(v15, "setWebEmbedId:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "absoluteString"));
    objc_msgSend(v15, "setEngagementTargetUrl:", v17);

    objc_msgSend(v15, "setWidgetContentType:", 2);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)engagementWithHeaderAtDate:(id)a3 withTargetURL:(id)a4 trackableWidgetState:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v7 = a4;
  v8 = a5;
  v9 = (void *)NTNewsSourceIdentifier;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fetchInfoForVisibleResults"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "todaySourceIdentifier"));
  LODWORD(v9) = objc_msgSend(v9, "isEqualToString:", v11);

  if ((_DWORD)v9)
  {
    v12 = -[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker _newWidgetEngagementWithTrackableWidgetState:](self, "_newWidgetEngagementWithTrackableWidgetState:", v8);
    objc_msgSend(v12, "setWidgetEngagementType:", 9);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "absoluteString"));
    objc_msgSend(v12, "setEngagementTargetUrl:", v13);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)engagementWithPlaceholderAtDate:(id)a3 withTargetURL:(id)a4 trackableWidgetState:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v7 = a4;
  v8 = a5;
  v9 = (void *)NTNewsSourceIdentifier;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fetchInfoForVisibleResults"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "todaySourceIdentifier"));
  LODWORD(v9) = objc_msgSend(v9, "isEqualToString:", v11);

  if ((_DWORD)v9)
  {
    v12 = -[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker _newWidgetEngagementWithTrackableWidgetState:](self, "_newWidgetEngagementWithTrackableWidgetState:", v8);
    objc_msgSend(v12, "setWidgetEngagementType:", 10);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "absoluteString"));
    objc_msgSend(v12, "setEngagementTargetUrl:", v13);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)engagementWithBackgroundAtDate:(id)a3 withTargetURL:(id)a4 trackableWidgetState:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v7 = a4;
  v8 = a5;
  v9 = (void *)NTNewsSourceIdentifier;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fetchInfoForVisibleResults"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "todaySourceIdentifier"));
  LODWORD(v9) = objc_msgSend(v9, "isEqualToString:", v11);

  if ((_DWORD)v9)
  {
    v12 = -[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker _newWidgetEngagementWithTrackableWidgetState:](self, "_newWidgetEngagementWithTrackableWidgetState:", v8);
    objc_msgSend(v12, "setWidgetEngagementType:", 8);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "absoluteString"));
    objc_msgSend(v12, "setEngagementTargetUrl:", v13);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_widgetEngagementEventAtDate:(id)a3 withEngagement:(id)a4 trackableWidgetState:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100080B08();
    if (v9)
      goto LABEL_6;
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100080A50();
LABEL_6:
  if (!v10 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100080998();
  v11 = (void *)objc_opt_new(NTPBEventObject);
  objc_msgSend(v11, "setWidgetEngagement:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NTPBEvent nss_eventWithIdentifier](NTPBEvent, "nss_eventWithIdentifier"));
  objc_msgSend(v12, "nss_setStartDate:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker eventAnnotator](self, "eventAnnotator"));
  objc_msgSend(v13, "annotateEvent:withOptions:", v12, 47);

  -[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker _annotateEvent:withTrackableWidgetState:](self, "_annotateEvent:withTrackableWidgetState:", v12, v10);
  objc_msgSend(v12, "setGestureType:", 1);
  objc_msgSend(v12, "setEventObject:", v11);

  return v12;
}

- (void)_annotateEvent:(id)a3 withTrackableWidgetState:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100080C78();
    if (v6)
      goto LABEL_6;
  }
  else if (v6)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100080BC0();
LABEL_6:
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fetchInfoForVisibleResults"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "appConfigTreatmentID"));

  if (v8)
    objc_msgSend(v5, "setAppConfigTreatmentId:", objc_msgSend(v8, "integerValue"));

}

- (id)_widgetEngagementForHeadline:(id)a3 inSection:(id)a4 withTrackableWidgetState:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v26[4];
  id v27;

  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "analyticsElement"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sectionForItem:", v7));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "visibleSections"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10000EC28;
    v26[3] = &unk_1000AA568;
    v12 = v10;
    v27 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fc_arrayByTransformingWithBlock:", v26));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "analyticsElement"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "articleID"));

    v16 = -[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker _newWidgetEngagementWithTrackableWidgetState:](self, "_newWidgetEngagementWithTrackableWidgetState:", v8);
    objc_msgSend(v16, "setArticleId:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "analyticsElement"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "channelID"));
    objc_msgSend(v16, "setSourceChannelId:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
    objc_msgSend(v16, "setWidgetSectionId:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "subidentifier"));
    objc_msgSend(v16, "setWidgetSectionSubid:", v20);

    objc_msgSend(v16, "setWidgetSectionDisplayRank:", objc_msgSend(v8, "absoluteOrderOfSection:", v12));
    objc_msgSend(v16, "setWidgetArticleRank:", objc_msgSend(v8, "absoluteOrderOfItem:", v7));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "items"));
    objc_msgSend(v16, "setWidgetArticleRankInSection:", objc_msgSend(v21, "indexOfObject:", v7));

    objc_msgSend(v16, "setWidgetArticleCount:", objc_msgSend(v8, "absoluteItemCountForCurrentDisplayMode"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "items"));
    objc_msgSend(v16, "setWidgetArticleCountInSection:", objc_msgSend(v22, "count"));

    v23 = objc_msgSend(v13, "copy");
    objc_msgSend(v16, "setOtherVisibleSections:", v23);

    objc_msgSend(v16, "setWidgetContentType:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "storyType"));
    objc_msgSend(v16, "setStoryType:", v24);

    if (!objc_msgSend(v7, "itemType"))
      objc_msgSend(v16, "setWidgetContentType:", 1);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)_newWidgetEngagementWithTrackableWidgetState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_opt_new(NTPBWidgetEngagement);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker userIDProvider](self, "userIDProvider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userID"));
  objc_msgSend(v5, "setWidgetUserId:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fetchDate"));
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v5, "setContentFetchDate:", (uint64_t)v9);

  objc_msgSend(v5, "setWidgetDisplayMode:", -[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker _pbDisplayModeWithDisplayMode:](self, "_pbDisplayModeWithDisplayMode:", objc_msgSend(v4, "activeDisplayMode")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentID"));
  objc_msgSend(v5, "setContentId:", v10);

  objc_msgSend(v5, "setWidgetType:", -[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker _pbWidgetTypeWithStackKind:](self, "_pbWidgetTypeWithStackKind:", objc_msgSend(v4, "stackKind")));
  objc_msgSend(v5, "setWidgetExposureStackLocation:", -[FTNewsAnalyticsNonVideoContentTypeWidgetEventTracker _pbStackLocationWithStackLocation:](self, "_pbStackLocationWithStackLocation:", objc_msgSend(v4, "stackLocation")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "entryID"));

  objc_msgSend(v5, "setEntryId:", v11);
  return v5;
}

- (int)_pbDisplayModeWithDisplayMode:(unint64_t)a3
{
  if (a3 - 1 < 7)
    return a3;
  else
    return 0;
}

- (int)_pbWidgetTypeWithStackKind:(unint64_t)a3
{
  if (a3 - 1 < 3)
    return a3;
  else
    return 0;
}

- (int)_pbStackLocationWithStackLocation:(unint64_t)a3
{
  if (a3 - 1 < 5)
    return a3;
  else
    return 0;
}

- (NSSNewsAnalyticsPBEventAccumulator)accumulator
{
  return self->_accumulator;
}

- (NSSNewsAnalyticsEventAnnotator)eventAnnotator
{
  return self->_eventAnnotator;
}

- (void)setEventAnnotator:(id)a3
{
  objc_storeStrong((id *)&self->_eventAnnotator, a3);
}

- (NSDate)widgetAppearanceDate
{
  return self->_widgetAppearanceDate;
}

- (void)setWidgetAppearanceDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)lastVisibleItemsChangeDate
{
  return self->_lastVisibleItemsChangeDate;
}

- (void)setLastVisibleItemsChangeDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSMutableArray)lastVisibleItemsChangePairs
{
  return self->_lastVisibleItemsChangePairs;
}

- (void)setLastVisibleItemsChangePairs:(id)a3
{
  objc_storeStrong((id *)&self->_lastVisibleItemsChangePairs, a3);
}

- (int)lastVisibleItemsChangeArticleCount
{
  return self->_lastVisibleItemsChangeArticleCount;
}

- (void)setLastVisibleItemsChangeArticleCount:(int)a3
{
  self->_lastVisibleItemsChangeArticleCount = a3;
}

- (NSMutableArray)outstandingItemExposureEvents
{
  return self->_outstandingItemExposureEvents;
}

- (void)setOutstandingItemExposureEvents:(id)a3
{
  objc_storeStrong((id *)&self->_outstandingItemExposureEvents, a3);
}

- (unint64_t)itemExposuresSinceLastWidgetAppearance
{
  return self->_itemExposuresSinceLastWidgetAppearance;
}

- (void)setItemExposuresSinceLastWidgetAppearance:(unint64_t)a3
{
  self->_itemExposuresSinceLastWidgetAppearance = a3;
}

- (NSSNewsAnalyticsUserIDProvider)userIDProvider
{
  return self->_userIDProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIDProvider, 0);
  objc_storeStrong((id *)&self->_outstandingItemExposureEvents, 0);
  objc_storeStrong((id *)&self->_lastVisibleItemsChangePairs, 0);
  objc_storeStrong((id *)&self->_lastVisibleItemsChangeDate, 0);
  objc_storeStrong((id *)&self->_widgetAppearanceDate, 0);
  objc_storeStrong((id *)&self->_eventAnnotator, 0);
  objc_storeStrong((id *)&self->_accumulator, 0);
}

@end
