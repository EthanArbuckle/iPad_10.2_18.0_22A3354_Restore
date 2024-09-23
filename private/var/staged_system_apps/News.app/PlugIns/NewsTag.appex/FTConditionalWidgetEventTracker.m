@implementation FTConditionalWidgetEventTracker

- (FTConditionalWidgetEventTracker)init
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
    v6 = "-[FTConditionalWidgetEventTracker init]";
    v7 = 2080;
    v8 = "FTConditionalWidgetEventTracker.m";
    v9 = 1024;
    v10 = 22;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FTConditionalWidgetEventTracker init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (FTConditionalWidgetEventTracker)initWithWidgetEventTracker:(id)a3 predicate:(id)a4
{
  id v7;
  id v8;
  FTConditionalWidgetEventTracker *v9;
  id v10;
  id predicate;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100082498();
    if (v8)
      goto LABEL_6;
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_1000823E0();
LABEL_6:
  v13.receiver = self;
  v13.super_class = (Class)FTConditionalWidgetEventTracker;
  v9 = -[FTConditionalWidgetEventTracker init](&v13, "init");
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    predicate = v9->_predicate;
    v9->_predicate = v10;

    objc_storeStrong((id *)&v9->_widgetEventTracker, a3);
  }

  return v9;
}

- (void)widgetDidAppearAtDate:(id)a3 withTrackableWidgetState:(id)a4
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100082608();
    if (v8)
      goto LABEL_6;
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100082550();
LABEL_6:
  if (-[FTConditionalWidgetEventTracker _shouldReportEventWithTrackableWidgetState:](self, "_shouldReportEventWithTrackableWidgetState:", v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FTConditionalWidgetEventTracker widgetEventTracker](self, "widgetEventTracker"));
    v10 = objc_opt_respondsToSelector(v9, a2);

    if ((v10 & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[FTConditionalWidgetEventTracker widgetEventTracker](self, "widgetEventTracker"));
      objc_msgSend(v11, "widgetDidAppearAtDate:withTrackableWidgetState:", v7, v8);

    }
  }

}

- (void)widgetDidDisappearAtDate:(id)a3 withTrackableWidgetState:(id)a4
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  if (-[FTConditionalWidgetEventTracker _shouldReportEventWithTrackableWidgetState:](self, "_shouldReportEventWithTrackableWidgetState:", v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FTConditionalWidgetEventTracker widgetEventTracker](self, "widgetEventTracker"));
    v9 = objc_opt_respondsToSelector(v8, a2);

    if ((v9 & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[FTConditionalWidgetEventTracker widgetEventTracker](self, "widgetEventTracker"));
      objc_msgSend(v10, "widgetDidDisappearAtDate:withTrackableWidgetState:", v11, v7);

    }
  }

}

- (void)widgetPerformedUpdateWithTodayResults:(id)a3 fetchInfo:(id)a4 error:(id)a5 updateFetchDuration:(double)a6
{
  id v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  id v16;

  v16 = a3;
  v11 = a4;
  v12 = a5;
  if (-[FTConditionalWidgetEventTracker _shouldReportEventWithTodayResults:fetchInfo:](self, "_shouldReportEventWithTodayResults:fetchInfo:", v16, v11))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FTConditionalWidgetEventTracker widgetEventTracker](self, "widgetEventTracker"));
    v14 = objc_opt_respondsToSelector(v13, a2);

    if ((v14 & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[FTConditionalWidgetEventTracker widgetEventTracker](self, "widgetEventTracker"));
      objc_msgSend(v15, "widgetPerformedUpdateWithTodayResults:fetchInfo:error:updateFetchDuration:", v16, v11, v12, a6);

    }
  }

}

- (void)visibleItemsDidChangeAtDate:(id)a3 withTriggerEvent:(unint64_t)a4 trackableWidgetState:(id)a5
{
  id v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v13 = a3;
  v9 = a5;
  if (-[FTConditionalWidgetEventTracker _shouldReportEventWithTrackableWidgetState:](self, "_shouldReportEventWithTrackableWidgetState:", v9))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FTConditionalWidgetEventTracker widgetEventTracker](self, "widgetEventTracker"));
    v11 = objc_opt_respondsToSelector(v10, a2);

    if ((v11 & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[FTConditionalWidgetEventTracker widgetEventTracker](self, "widgetEventTracker"));
      objc_msgSend(v12, "visibleItemsDidChangeAtDate:withTriggerEvent:trackableWidgetState:", v13, a4, v9);

    }
  }

}

- (void)userEngagedWithWidgetAtDate:(id)a3 actionURL:(id)a4 trackableWidgetState:(id)a5
{
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  id v14;

  v14 = a3;
  v9 = a4;
  v10 = a5;
  if (-[FTConditionalWidgetEventTracker _shouldReportEventWithTrackableWidgetState:](self, "_shouldReportEventWithTrackableWidgetState:", v10))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FTConditionalWidgetEventTracker widgetEventTracker](self, "widgetEventTracker"));
    v12 = objc_opt_respondsToSelector(v11, a2);

    if ((v12 & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[FTConditionalWidgetEventTracker widgetEventTracker](self, "widgetEventTracker"));
      objc_msgSend(v13, "userEngagedWithWidgetAtDate:actionURL:trackableWidgetState:", v14, v9, v10);

    }
  }

}

- (void)submitEventsIfNeededWithCompletion:(id)a3
{
  void *v5;
  void *v6;
  void (**v7)(void);

  v7 = (void (**)(void))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FTConditionalWidgetEventTracker widgetEventTracker](self, "widgetEventTracker"));
  LOBYTE(a2) = objc_opt_respondsToSelector(v5, a2);

  if ((a2 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FTConditionalWidgetEventTracker widgetEventTracker](self, "widgetEventTracker"));
    objc_msgSend(v6, "submitEventsIfNeededWithCompletion:", v7);

  }
  else
  {
    v7[2]();
  }

}

- (BOOL)_shouldReportEventWithTrackableWidgetState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_1000826C0();
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "todayResults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fetchInfoForVisibleResults"));
  v7 = -[FTConditionalWidgetEventTracker _shouldReportEventWithTodayResults:fetchInfo:](self, "_shouldReportEventWithTodayResults:fetchInfo:", v5, v6);

  return v7;
}

- (BOOL)_shouldReportEventWithTodayResults:(id)a3 fetchInfo:(id)a4
{
  id v6;
  id v7;
  uint64_t (**v8)(_QWORD, _QWORD, _QWORD);
  char v9;

  v6 = a3;
  v7 = a4;
  if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100082778();
  v8 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[FTConditionalWidgetEventTracker predicate](self, "predicate"));
  v9 = ((uint64_t (**)(_QWORD, id, id))v8)[2](v8, v6, v7);

  return v9;
}

- (id)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (FTSelectiveWidgetEventTracker)widgetEventTracker
{
  return self->_widgetEventTracker;
}

- (void)setWidgetEventTracker:(id)a3
{
  objc_storeStrong((id *)&self->_widgetEventTracker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetEventTracker, 0);
  objc_storeStrong(&self->_predicate, 0);
}

@end
