@implementation FTAggregateWidgetEventTracker

- (FTAggregateWidgetEventTracker)init
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
    v6 = "-[FTAggregateWidgetEventTracker init]";
    v7 = 2080;
    v8 = "FTAggregateWidgetEventTracker.m";
    v9 = 1024;
    v10 = 22;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FTAggregateWidgetEventTracker init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (FTAggregateWidgetEventTracker)initWithEventTrackers:(id)a3
{
  id v4;
  FTAggregateWidgetEventTracker *v5;
  NSArray *v6;
  NSArray *eventTrackers;
  dispatch_group_t v8;
  OS_dispatch_group *submissionGroup;
  objc_super v11;

  v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100081A1C();
  v11.receiver = self;
  v11.super_class = (Class)FTAggregateWidgetEventTracker;
  v5 = -[FTAggregateWidgetEventTracker init](&v11, "init");
  if (v5)
  {
    v6 = (NSArray *)objc_msgSend(v4, "copy");
    eventTrackers = v5->_eventTrackers;
    v5->_eventTrackers = v6;

    v8 = dispatch_group_create();
    submissionGroup = v5->_submissionGroup;
    v5->_submissionGroup = (OS_dispatch_group *)v8;

  }
  return v5;
}

- (void)widgetDidAppearAtDate:(id)a3 withTrackableWidgetState:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v7 = a3;
  v8 = a4;
  if (!v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100081AE4();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FTAggregateWidgetEventTracker _eventTrackersRespondingToSelector:](self, "_eventTrackersRespondingToSelector:", a2, 0));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "widgetDidAppearAtDate:withTrackableWidgetState:", v7, v8);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)widgetDidDisappearAtDate:(id)a3 withTrackableWidgetState:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v7 = a3;
  v8 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FTAggregateWidgetEventTracker _eventTrackersRespondingToSelector:](self, "_eventTrackersRespondingToSelector:", a2, 0));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v13), "widgetDidDisappearAtDate:withTrackableWidgetState:", v7, v8);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)widgetPerformedUpdateWithTodayResults:(id)a3 fetchInfo:(id)a4 error:(id)a5 updateFetchDuration:(double)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FTAggregateWidgetEventTracker _eventTrackersRespondingToSelector:](self, "_eventTrackersRespondingToSelector:", a2, 0));
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v18), "widgetPerformedUpdateWithTodayResults:fetchInfo:error:updateFetchDuration:", v11, v12, v13, a6);
        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v16);
  }

}

- (void)visibleItemsDidChangeAtDate:(id)a3 withTriggerEvent:(unint64_t)a4 trackableWidgetState:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v9 = a3;
  v10 = a5;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FTAggregateWidgetEventTracker _eventTrackersRespondingToSelector:](self, "_eventTrackersRespondingToSelector:", a2, 0));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v15), "visibleItemsDidChangeAtDate:withTriggerEvent:trackableWidgetState:", v9, a4, v10);
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

- (void)userEngagedWithWidgetAtDate:(id)a3 actionURL:(id)a4 trackableWidgetState:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FTAggregateWidgetEventTracker _eventTrackersRespondingToSelector:](self, "_eventTrackersRespondingToSelector:", a2, 0));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v16), "userEngagedWithWidgetAtDate:actionURL:trackableWidgetState:", v9, v10, v11);
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

}

- (void)submitEventsIfNeededWithCompletion:(id)a3
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_block_t block;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  block = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FTAggregateWidgetEventTracker _eventTrackersRespondingToSelector:](self, "_eventTrackersRespondingToSelector:", a2));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v9);
        v11 = objc_claimAutoreleasedReturnValue(-[FTAggregateWidgetEventTracker submissionGroup](self, "submissionGroup"));
        dispatch_group_enter(v11);

        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_100015670;
        v14[3] = &unk_1000AABC8;
        v14[4] = self;
        objc_msgSend(v10, "submitEventsIfNeededWithCompletion:", v14);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v12 = objc_claimAutoreleasedReturnValue(-[FTAggregateWidgetEventTracker submissionGroup](self, "submissionGroup"));
  dispatch_group_notify(v12, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (id)_eventTrackersRespondingToSelector:(SEL)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FTAggregateWidgetEventTracker eventTrackers](self, "eventTrackers"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001571C;
  v7[3] = &unk_1000AABE8;
  v7[4] = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fc_arrayOfObjectsPassingTest:", v7));

  return v5;
}

- (NSArray)eventTrackers
{
  return self->_eventTrackers;
}

- (void)setEventTrackers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
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
  objc_storeStrong((id *)&self->_eventTrackers, 0);
}

@end
