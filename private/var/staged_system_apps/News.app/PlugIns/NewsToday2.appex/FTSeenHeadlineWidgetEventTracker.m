@implementation FTSeenHeadlineWidgetEventTracker

- (FTSeenHeadlineWidgetEventTracker)init
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
    v6 = "-[FTSeenHeadlineWidgetEventTracker init]";
    v7 = 2080;
    v8 = "FTSeenHeadlineWidgetEventTracker.m";
    v9 = 1024;
    v10 = 30;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FTSeenHeadlineWidgetEventTracker init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (FTSeenHeadlineWidgetEventTracker)initWithTodayEventTracker:(id)a3 documentsDirectory:(id)a4
{
  id v7;
  id v8;
  FTSeenHeadlineWidgetEventTracker *v9;
  FTSeenHeadlineWidgetEventTracker *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSSet *v19;
  void *v20;
  FCFileCoordinatedDictionary *v21;
  FCFileCoordinatedDictionary *fileCoordinatedFIFOHost;
  dispatch_group_t v23;
  OS_dispatch_group *submissionGroup;
  objc_super v26;

  v7 = a3;
  v8 = a4;
  if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100094B20();
    if (v8)
      goto LABEL_6;
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100094A68();
LABEL_6:
  v26.receiver = self;
  v26.super_class = (Class)FTSeenHeadlineWidgetEventTracker;
  v9 = -[FTSeenHeadlineWidgetEventTracker init](&v26, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_todayEventTracker, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", CFSTR("seen-headline-storage"), 0));
    v13 = objc_opt_class(NSOrderedSet, v12);
    v15 = objc_opt_class(NSDictionary, v14);
    v17 = objc_opt_class(NSString, v16);
    v19 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, v15, v17, objc_opt_class(NSNumber, v18), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = (FCFileCoordinatedDictionary *)objc_msgSend(objc_alloc((Class)FCFileCoordinatedDictionary), "initWithFileURL:allowedClasses:", v11, v20);
    fileCoordinatedFIFOHost = v10->_fileCoordinatedFIFOHost;
    v10->_fileCoordinatedFIFOHost = v21;

    v23 = dispatch_group_create();
    submissionGroup = v10->_submissionGroup;
    v10->_submissionGroup = (OS_dispatch_group *)v23;

  }
  return v10;
}

- (void)visibleItemsDidChangeAtDate:(id)a3 withTriggerEvent:(unint64_t)a4 trackableWidgetState:(id)a5
{
  id v8;
  id v9;
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
  char *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v8 = a3;
  v9 = a5;
  if (a4 == 4)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FTSeenHeadlineWidgetEventTracker visibleHeadlines](self, "visibleHeadlines"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FTSeenHeadlineWidgetEventTracker visibleHeadlinesAppearanceDate](self, "visibleHeadlinesAppearanceDate"));
    v12 = objc_msgSend(v11, "copy");

    if (!v10 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100094C90();
    v13 = v12;
    if (!v12 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100094BD8();
    v27 = v10;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fc_arrayOfObjectsPassingTest:", &stru_1000C6F28));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v16 = objc_msgSend(v15, "userInterfaceIdiom");

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "keyWindow"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "windowScene"));
    v20 = (char *)objc_msgSend(v19, "interfaceOrientation");

    if ((v16 != (id)1 || (unint64_t)(v20 - 3) >= 2)
      && objc_msgSend(v9, "stackLocation") == (id)1
      && objc_msgSend(v14, "count")
      && !-[FTSeenHeadlineWidgetEventTracker sessionHasEngagement](self, "sessionHasEngagement"))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v22 = FCSecondsToMilliseconds(objc_msgSend(v21, "timeIntervalSinceDate:", v13));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fetchInfoForVisibleResults"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "widgetConfig"));

      if (v22 >= (unint64_t)objc_msgSend(v24, "minimumArticleExposureDurationToBePreseen"))
        -[FTSeenHeadlineWidgetEventTracker _registerOnceVisibleHeadlines:withLastSeenDate:minimumNumberOfTimesPreseenToBeSeen:](self, "_registerOnceVisibleHeadlines:withLastSeenDate:minimumNumberOfTimesPreseenToBeSeen:", v14, v21, objc_msgSend(v24, "minimumNumberOfTimesPreseenToBeSeen"));

    }
    -[FTSeenHeadlineWidgetEventTracker setSessionHasEngagement:](self, "setSessionHasEngagement:", 0);

  }
  -[FTSeenHeadlineWidgetEventTracker setVisibleHeadlinesAppearanceDate:](self, "setVisibleHeadlinesAppearanceDate:", v8);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "visibleItems"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "fc_arrayByTransformingWithBlock:", &stru_1000C6F68));
  -[FTSeenHeadlineWidgetEventTracker setVisibleHeadlines:](self, "setVisibleHeadlines:", v26);

}

- (void)userEngagedWithWidgetAtDate:(id)a3 actionURL:(id)a4 trackableWidgetState:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100094D48();
  -[FTSeenHeadlineWidgetEventTracker setSessionHasEngagement:](self, "setSessionHasEngagement:", 1);

}

- (void)submitEventsIfNeededWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[FTSeenHeadlineWidgetEventTracker submissionGroup](self, "submissionGroup"));
  dispatch_group_notify(v5, (dispatch_queue_t)&_dispatch_main_q, v4);

}

- (void)_registerOnceVisibleHeadlines:(id)a3 withLastSeenDate:(id)a4 minimumNumberOfTimesPreseenToBeSeen:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  FTSeenHeadlineWidgetEventTracker *v19;
  id v20;
  id v21;
  unint64_t v22;

  v8 = a3;
  v9 = a4;
  +[NSThread isMainThread](NSThread, "isMainThread");
  if (!v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100094E00();
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FTSeenHeadlineWidgetEventTracker todayEventTracker](self, "todayEventTracker"));
  v11 = objc_claimAutoreleasedReturnValue(-[FTSeenHeadlineWidgetEventTracker submissionGroup](self, "submissionGroup"));
  dispatch_group_enter(v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FTSeenHeadlineWidgetEventTracker fileCoordinatedFIFOHost](self, "fileCoordinatedFIFOHost"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001322C;
  v17[3] = &unk_1000C6FB8;
  v21 = v9;
  v22 = a5;
  v18 = v8;
  v19 = self;
  v20 = v10;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100013710;
  v16[3] = &unk_1000C6FE0;
  v16[4] = self;
  v13 = v9;
  v14 = v10;
  v15 = v8;
  objc_msgSend(v12, "writeWithAccessor:completion:", v17, v16);

}

- (NTTodayEventTracker)todayEventTracker
{
  return self->_todayEventTracker;
}

- (void)setTodayEventTracker:(id)a3
{
  objc_storeStrong((id *)&self->_todayEventTracker, a3);
}

- (FCFileCoordinatedDictionary)fileCoordinatedFIFOHost
{
  return self->_fileCoordinatedFIFOHost;
}

- (void)setFileCoordinatedFIFOHost:(id)a3
{
  objc_storeStrong((id *)&self->_fileCoordinatedFIFOHost, a3);
}

- (NSArray)visibleHeadlines
{
  return self->_visibleHeadlines;
}

- (void)setVisibleHeadlines:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)visibleHeadlinesAppearanceDate
{
  return self->_visibleHeadlinesAppearanceDate;
}

- (void)setVisibleHeadlinesAppearanceDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)sessionHasEngagement
{
  return self->_sessionHasEngagement;
}

- (void)setSessionHasEngagement:(BOOL)a3
{
  self->_sessionHasEngagement = a3;
}

- (OS_dispatch_group)submissionGroup
{
  return self->_submissionGroup;
}

- (void)setSubmissionGroup:(id)a3
{
  objc_storeStrong((id *)&self->_submissionGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submissionGroup, 0);
  objc_storeStrong((id *)&self->_visibleHeadlinesAppearanceDate, 0);
  objc_storeStrong((id *)&self->_visibleHeadlines, 0);
  objc_storeStrong((id *)&self->_fileCoordinatedFIFOHost, 0);
  objc_storeStrong((id *)&self->_todayEventTracker, 0);
}

@end
