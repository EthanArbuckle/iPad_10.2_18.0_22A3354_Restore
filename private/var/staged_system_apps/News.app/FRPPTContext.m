@implementation FRPPTContext

+ (id)sharedContext
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018984;
  block[3] = &unk_1000DBA48;
  block[4] = a1;
  if (qword_10010A988 != -1)
    dispatch_once(&qword_10010A988, block);
  return (id)qword_10010A990;
}

- (void)d_logState
{
  unsigned int v3;
  NSObject *v4;
  _BOOL4 v5;
  _BOOL8 runningPPT;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;

  v3 = -[FRPPTContext isRunningPPT](self, "isRunningPPT");
  v4 = FCPPTLog;
  v5 = os_log_type_enabled(FCPPTLog, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PPT Reported as Running", (uint8_t *)&v13, 2u);
    }
  }
  else if (v5)
  {
    runningPPT = self->_runningPPT;
    v7 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", runningPPT));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v9, "launchedToTest")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v11, "isRunningTest")));
    v13 = 138412802;
    v14 = v8;
    v15 = 2112;
    v16 = v10;
    v17 = 2112;
    v18 = v12;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PPT Reported as Not Running. _runningPPT : %@, launchedToTest : %@, isRunningTest : %@", (uint8_t *)&v13, 0x20u);

  }
}

- (BOOL)isRunningPPT
{
  return self->_runningPPT;
}

- (void)setRunningPPT:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_runningPPT = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount"));
  objc_msgSend(v4, "setRunningPPT:", v3);

}

- (BOOL)isPrefetchDisabled
{
  return self->_prefetchDisabled;
}

- (NSString)testName
{
  return self->_testName;
}

- (void)setTestName:(id)a3
{
  objc_storeStrong((id *)&self->_testName, a3);
}

- (void)setPrefetchDisabled:(BOOL)a3
{
  self->_prefetchDisabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testName, 0);
}

@end
