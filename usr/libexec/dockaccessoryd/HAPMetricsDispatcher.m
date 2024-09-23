@implementation HAPMetricsDispatcher

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000286B8;
  block[3] = &unk_100236D58;
  block[4] = a1;
  if (qword_100271680 != -1)
    dispatch_once(&qword_100271680, block);
  return (id)qword_100271678;
}

- (void)submitLogEvent:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetricsDispatcher logDispatcher](self, "logDispatcher"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPMetricsDispatcher logDispatcher](self, "logDispatcher"));
    objc_msgSend(v5, "submitLogEvent:", v6);

  }
}

- (DKMLogEventSubmitting)logDispatcher
{
  return self->_logDispatcher;
}

- (void)setLogDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_logDispatcher, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logDispatcher, 0);
}

@end
