@implementation CHRemoteLineWrappingRequestHandler

- (CHRemoteLineWrappingRequestHandler)initWithServerQueue:(id)a3 lowPriorityQueue:(id)a4 highPriorityQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  CHRemoteLineWrappingRequestHandler *v11;
  CHRemoteLineWrappingRequestHandler *v12;
  double v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CHRemoteLineWrappingRequestHandler;
  v11 = -[CHRemoteRequestHandlerBase initWithServerQueue:lowPriorityQueue:highPriorityQueue:](&v15, "initWithServerQueue:lowPriorityQueue:highPriorityQueue:", v8, v9, v10);
  v12 = v11;
  if (v11)
  {
    v11->_activeRequestCount = 0;
    v11->_targetIdleLifetime = 120.0;
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v12->_lastActiveTimestamp = v13;
  }

  return v12;
}

- (BOOL)_hasIdleLifetimeElapsed:(double)a3
{
  return +[CHRemoteRequestHandlerBase _hasIdleLifetimeElapsed:targetIdleLifetime:](CHRemoteRequestHandlerBase, "_hasIdleLifetimeElapsed:targetIdleLifetime:", self->_lastActiveTimestamp, a3);
}

- (void)_stageEvictionOfLineWrapperWithTargetIdleLifetime:(double)a3
{
  NSObject *v5;
  _QWORD v6[6];
  uint8_t buf[4];
  double v8;

  if (qword_10002AE88 != -1)
    dispatch_once(&qword_10002AE88, &stru_1000249F0);
  v5 = (id)qword_10002AE70;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Line wrapper for eviction with idle lifetime=%1.2f", buf, 0xCu);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100016884;
  v6[3] = &unk_100024BB0;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  -[CHRemoteRequestHandlerBase _stageEvictionOfResourceWithTargetLifetime:block:](self, "_stageEvictionOfResourceWithTargetLifetime:block:", v6, a3);
}

- (void)_checkOutLineWrapper
{
  CHLineWrapper *v3;
  CHLineWrapper *lineWrapper;
  NSObject *v5;
  NSObject *v6;
  int64_t activeRequestCount;
  int v8;
  int64_t v9;

  ++self->_activeRequestCount;
  if (!self->_lineWrapper)
  {
    v3 = (CHLineWrapper *)objc_alloc_init((Class)CHLineWrapper);
    lineWrapper = self->_lineWrapper;
    self->_lineWrapper = v3;

    if (qword_10002AE88 == -1)
    {
      v5 = (id)qword_10002AE70;
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
LABEL_5:

        goto LABEL_6;
      }
    }
    else
    {
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
      v5 = (id)qword_10002AE70;
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        goto LABEL_5;
    }
    LOWORD(v8) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Loaded line wrapper", (uint8_t *)&v8, 2u);
    goto LABEL_5;
  }
LABEL_6:
  if (qword_10002AE88 != -1)
  {
    dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v6 = (id)qword_10002AE70;
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      goto LABEL_9;
    goto LABEL_8;
  }
  v6 = (id)qword_10002AE70;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
LABEL_8:
    activeRequestCount = self->_activeRequestCount;
    v8 = 134217984;
    v9 = activeRequestCount;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Currently active line wrapping requests: %li", (uint8_t *)&v8, 0xCu);
  }
LABEL_9:

}

- (void)_checkInLineWrapper
{
  double v3;
  NSObject *v4;
  uint8_t v5[16];

  --self->_activeRequestCount;
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  self->_lastActiveTimestamp = v3;
  if (self->_activeRequestCount < 0)
  {
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v4 = (id)qword_10002AE18[0];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "Line wrapper is already fully checked in.", v5, 2u);
    }

  }
  -[CHRemoteLineWrappingRequestHandler _stageEvictionOfLineWrapperWithTargetIdleLifetime:](self, "_stageEvictionOfLineWrapperWithTargetIdleLifetime:", self->_targetIdleLifetime);
}

- (BOOL)_isValidRemoteLineWrappingRequest:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("The line wrapping request is invalid"), &stru_100025708, 0));

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Remote line wrapping cannot process an empty request"), &stru_100025708, 0));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Submit a new valid line wrapping request"), &stru_100025708, 0));

    v18 = objc_msgSend((id)objc_opt_class(self), "_invalidInputErrorWithDescription:failureReason:recoverySuggestion:errorCode:", v13, v15, v17, -1002);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v18);

    if (!a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  v10 = 0;
  if (a5)
LABEL_3:
    *a5 = objc_retainAutorelease(v10);
LABEL_4:

  return v8 != 0;
}

- (void)handleRequest:(id)a3 withReply:(id)a4 bundleIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[CHRemoteRequestHandlerBase serverQueue](self, "serverQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016FA8;
  block[3] = &unk_100024B60;
  block[4] = self;
  v16 = v8;
  v17 = v10;
  v18 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_sync(v11, block);

}

- (void)optimizeResourceUsage
{
  -[CHRemoteLineWrappingRequestHandler _stageEvictionOfLineWrapperWithTargetIdleLifetime:](self, "_stageEvictionOfLineWrapperWithTargetIdleLifetime:", 5.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineWrapper, 0);
}

@end
