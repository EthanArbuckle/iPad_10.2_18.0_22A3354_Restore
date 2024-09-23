@implementation FTOpenArbitraryURLEngagementDescriptor

- (FTOpenArbitraryURLEngagementDescriptor)init
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
    v6 = "-[FTOpenArbitraryURLEngagementDescriptor init]";
    v7 = 2080;
    v8 = "FTOpenArbitraryURLEngagementDescriptor.m";
    v9 = 1024;
    v10 = 24;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FTOpenArbitraryURLEngagementDescriptor init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (FTOpenArbitraryURLEngagementDescriptor)initWithURL:(id)a3 engagementReporter:(id)a4
{
  id v6;
  id v7;
  FTOpenArbitraryURLEngagementDescriptor *v8;
  NSURL *v9;
  NSURL *targetURL;
  id v11;
  id reporter;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100091AE8();
    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100091A30();
LABEL_6:
  v14.receiver = self;
  v14.super_class = (Class)FTOpenArbitraryURLEngagementDescriptor;
  v8 = -[FTOpenArbitraryURLEngagementDescriptor init](&v14, "init");
  if (v8)
  {
    v9 = (NSURL *)objc_msgSend(v6, "copy");
    targetURL = v8->_targetURL;
    v8->_targetURL = v9;

    v11 = objc_msgSend(v7, "copy");
    reporter = v8->_reporter;
    v8->_reporter = v11;

  }
  return v8;
}

- (id)userEngagementWithWidgetEventTracker:(id)a3 trackableWidgetState:(id)a4
{
  id v6;
  id v7;
  uint64_t (**v8)(_QWORD, _QWORD, _QWORD);
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100091C58();
    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100091BA0();
LABEL_6:
  v8 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[FTOpenArbitraryURLEngagementDescriptor reporter](self, "reporter"));
  v9 = ((uint64_t (**)(_QWORD, id, id))v8)[2](v8, v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

- (NSURL)baseNewsURL
{
  return -[FTOpenArbitraryURLEngagementDescriptor targetURL](self, "targetURL");
}

- (id)openInNewsReferralItemWithTrackableWidgetState:(id)a3 assetHandlesByRemoteURL:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100091D10();

  return 0;
}

- (NSURL)targetURL
{
  return self->_targetURL;
}

- (id)reporter
{
  return self->_reporter;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reporter, 0);
  objc_storeStrong((id *)&self->_targetURL, 0);
}

@end
