@implementation CRLLogHelper

+ (id)sharedInstance
{
  if (qword_10006DAA8 != -1)
    dispatch_once(&qword_10006DAA8, &stru_1000619E0);
  return (id)qword_10006DAA0;
}

- (BOOL)incrementThrottleCountAndCheckThottleMax:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  NSObject *v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  BOOL v12;
  void *v13;
  uint8_t v15[16];
  uint8_t buf[16];

  v5 = -[CRLLogHelper throttleCount](self, "throttleCount");
  -[CRLLogHelper setThrottleCount:](self, "setThrottleCount:", (char *)-[CRLLogHelper throttleCount](self, "throttleCount") + 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLogHelper lastThrottleCheck](self, "lastThrottleCheck"));
  if (v5 == a3)
  {
    if (CRLPerformanceCat_init_token != -1)
      dispatch_once(&CRLPerformanceCat_init_token, &stru_100061A00);
    v7 = CRLPerformanceCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLPerformanceCat_log_t, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Start throttling logging", buf, 2u);
    }
  }
  if (v5 < a3 || !v6)
    goto LABEL_16;
  objc_msgSend(v6, "timeIntervalSinceNow");
  v9 = v8;
  objc_msgSend(v6, "timeIntervalSinceNow");
  if (v10 < -300.0)
  {
    if (CRLPerformanceCat_init_token != -1)
      dispatch_once(&CRLPerformanceCat_init_token, &stru_100061A20);
    v11 = CRLPerformanceCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLPerformanceCat_log_t, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "End throttling logging", v15, 2u);
    }
    -[CRLLogHelper setThrottleCount:](self, "setThrottleCount:", 0);
  }
  if (v9 >= -60.0)
  {
    v12 = 1;
  }
  else
  {
LABEL_16:
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[CRLLogHelper setLastThrottleCheck:](self, "setLastThrottleCheck:", v13);

    v12 = 0;
  }

  return v12;
}

- (unint64_t)throttleCount
{
  return self->_throttleCount;
}

- (void)setThrottleCount:(unint64_t)a3
{
  self->_throttleCount = a3;
}

- (NSDate)lastThrottleCheck
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLastThrottleCheck:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastThrottleCheck, 0);
}

@end
