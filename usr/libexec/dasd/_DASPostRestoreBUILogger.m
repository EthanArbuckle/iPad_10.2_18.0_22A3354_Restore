@implementation _DASPostRestoreBUILogger

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000924C0;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001ABC38 != -1)
    dispatch_once(&qword_1001ABC38, block);
  return (id)qword_1001ABC30;
}

- (_DASPostRestoreBUILogger)init
{
  _DASPostRestoreBUILogger *v2;
  uint64_t v3;
  OS_os_log *log;
  uint64_t v5;
  _DASRuntimeLimiter *runtimeLimiter;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_DASPostRestoreBUILogger;
  v2 = -[_DASPostRestoreBUILogger init](&v8, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("postRestoreBUILogger")));
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[_DASRuntimeLimiter sharedLimiter](_DASRuntimeLimiter, "sharedLimiter"));
    runtimeLimiter = v2->_runtimeLimiter;
    v2->_runtimeLimiter = (_DASRuntimeLimiter *)v5;

  }
  return v2;
}

- (void)reportState:(unint64_t)a3 forActivity:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *log;
  void *v14;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fastPass"));

  if (v7
    && (a3 != 10
     || !-[_DASRuntimeLimiter featureHasNoRemainingRuntimeForActivity:](self->_runtimeLimiter, "featureHasNoRemainingRuntimeForActivity:", v6)))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serviceName"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "featureCodes"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "serviceName"));
      v14 = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
      -[_DASPostRestoreBUILogger reportState:forTaskName:featureCode:involvedProcesses:](self, "reportState:forTaskName:featureCode:involvedProcesses:", a3, v9, v10, v12);

    }
    else
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        sub_1000E78B8(log, v6);
    }
  }

}

- (void)reportState:(unint64_t)a3 forTaskName:(id)a4 featureCode:(id)a5 involvedProcesses:(id)a6
{
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  void *v14;
  void *v15;
  NSObject *log;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if ((uint64_t)a3 > 29)
  {
    if (a3 != 30 && a3 != 50)
      goto LABEL_15;
    v13 = 30;
  }
  else
  {
    v13 = a3;
    if (a3 != 10)
    {
      if (a3 != 20)
        goto LABEL_15;
      v13 = 20;
    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, CFSTR("fastPassName"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, CFSTR("featureCodes"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v13));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("state"));

  objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, CFSTR("processName"));
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138412290;
    v21 = v14;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Reporting %@ for BUI via PPS", (uint8_t *)&v20, 0xCu);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](_DASPPSDataManager, "sharedInstance"));
  objc_msgSend(v17, "sendDataToPPS:subsystem:category:", v14, CFSTR("XPCMetrics"), CFSTR("OngoingRestore"));

  if (a3 == 30)
  {
    objc_msgSend(v14, "setObject:forKeyedSubscript:", &off_10016EC78, CFSTR("state"));
    v18 = self->_log;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Reporting %@ for BUI via PPS", (uint8_t *)&v20, 0xCu);
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](_DASPPSDataManager, "sharedInstance"));
    objc_msgSend(v19, "sendDataToPPS:subsystem:category:", v14, CFSTR("XPCMetrics"), CFSTR("OngoingRestore"));

  }
LABEL_15:

}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (_DASRuntimeLimiter)runtimeLimiter
{
  return self->_runtimeLimiter;
}

- (void)setRuntimeLimiter:(id)a3
{
  objc_storeStrong((id *)&self->_runtimeLimiter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runtimeLimiter, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
