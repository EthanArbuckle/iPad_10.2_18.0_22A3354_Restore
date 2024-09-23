@implementation SDTaskContainer

- (void)applyContainerOverride:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("timeout")));
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "doubleValue");
    -[SDTaskContainer setTimeout:](self, "setTimeout:");
    v4 = v5;
  }

}

- (void)resetTimeout:(int64_t)a3
{
  dispatch_time_t v4;
  NSObject *source;

  source = objc_claimAutoreleasedReturnValue(-[SDTaskContainer timeoutSource](self, "timeoutSource"));
  v4 = dispatch_time(0, 1000000000 * a3);
  dispatch_source_set_timer(source, v4, 0xFFFFFFFFFFFFFFFFLL, 0);

}

- (void)startTimeout:(double)a3 withHandler:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  dispatch_source_t v9;
  NSObject *v10;
  NSObject *v11;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "taskQueue"));
  v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v8);
  -[SDTaskContainer setTimeoutSource:](self, "setTimeoutSource:", v9);

  -[SDTaskContainer resetTimeout:](self, "resetTimeout:", (uint64_t)a3);
  v10 = objc_claimAutoreleasedReturnValue(-[SDTaskContainer timeoutSource](self, "timeoutSource"));
  dispatch_source_set_event_handler(v10, v6);

  v11 = objc_claimAutoreleasedReturnValue(-[SDTaskContainer timeoutSource](self, "timeoutSource"));
  dispatch_resume(v11);

}

- (BOOL)_execute
{
  __assert_rtn("-[SDTaskContainer _execute]", "SDTaskContainer.m", 40, "0 && \"Must use a concrete subclass.\");
}

- (double)elapsedTime
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskContainer startDate](self, "startDate"));
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  return v6;
}

- (BOOL)setStartDate:(id)a3 AndExecuteFromCallback:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id *v19;
  BOOL v20;
  _QWORD block[5];
  _QWORD v23[2];
  _QWORD v24[5];
  _QWORD v25[2];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint8_t buf[4];
  double v31;
  __int16 v32;
  void *v33;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v8 = sub_100026C34();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
    *(_DWORD *)buf = 138412290;
    v31 = *(double *)&v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Executing task container: %@", buf, 0xCu);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
  objc_msgSend(v11, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Executing task container: %@"), v12);

  if (v4)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000411E4;
    v24[3] = &unk_1000991F0;
    v24[4] = self;
    v25[0] = v6;
    v25[1] = &v26;
    v13 = sub_1000272CC(v24);
    v14 = sub_100026C34();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
      *(_DWORD *)buf = 134218242;
      v31 = v13;
      v32 = 2112;
      v33 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "taskQueue thread spent %.1f seconds blocked waiting for %@ to finish", buf, 0x16u);

    }
    v17 = objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
    -[NSObject logWithSubsystem:category:msg:](v17, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("taskQueue thread spent %.1f seconds blocked waiting for %@ to finish"), *(_QWORD *)&v13, v18);

    v19 = (id *)v25;
  }
  else
  {
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "taskQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004121C;
    block[3] = &unk_1000991F0;
    block[4] = self;
    v19 = (id *)v23;
    v23[0] = v6;
    v23[1] = &v26;
    dispatch_sync(v17, block);
  }

  v20 = *((_BYTE *)v27 + 24) != 0;
  _Block_object_dispose(&v26, 8);

  return v20;
}

- (BOOL)executeFromCallback
{
  unsigned __int8 v3;
  unsigned int v4;
  void *v5;
  BOOL v6;
  unsigned __int8 v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;

  v3 = -[SDTaskContainer blockUntilFinished](self, "blockUntilFinished");
  v4 = -[SDTaskContainer runByItself](self, "runByItself");
  if ((v3 & 1) != 0 || v4)
    sub_1000613EC();
  -[SDContainer updateContainerWithOverride](self, "updateContainerWithOverride");
  if (!-[SDContainer evaluateCollectionFlags](self, "evaluateCollectionFlags"))
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v6 = 1;
  v7 = -[SDTaskContainer setStartDate:AndExecuteFromCallback:](self, "setStartDate:AndExecuteFromCallback:", v5, 1);

  if ((v7 & 1) == 0)
  {
    v8 = sub_100026C34();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100061414(self);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
    objc_msgSend(v10, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Failed to execute %@"), v11);

    return 0;
  }
  return v6;
}

- (BOOL)execute
{
  SDTaskContainer *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[SDContainer executionActivity](self, "executionActivity"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100041424;
  v5[3] = &unk_100098FB0;
  v5[4] = v2;
  v5[5] = &v6;
  os_activity_apply(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (NSMutableArray)directories
{
  return (NSMutableArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDirectories:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (OS_dispatch_source)timeoutSource
{
  return self->_timeoutSource;
}

- (void)setTimeoutSource:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutSource, a3);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (BOOL)runByItself
{
  return self->_runByItself;
}

- (void)setRunByItself:(BOOL)a3
{
  self->_runByItself = a3;
}

- (BOOL)blockUntilFinished
{
  return self->_blockUntilFinished;
}

- (void)setBlockUntilFinished:(BOOL)a3
{
  self->_blockUntilFinished = a3;
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_timeoutSource, 0);
  objc_storeStrong((id *)&self->_directories, 0);
}

@end
