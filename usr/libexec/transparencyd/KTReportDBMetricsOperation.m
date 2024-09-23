@implementation KTReportDBMetricsOperation

- (KTReportDBMetricsOperation)initWithDependencies:(id)a3
{
  id v5;
  KTReportDBMetricsOperation *v6;
  KTReportDBMetricsOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KTReportDBMetricsOperation;
  v6 = -[KTGroupOperation init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_deps, a3);

  return v7;
}

- (void)groupStart
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  if (qword_1002A45B0 != -1)
    dispatch_once(&qword_1002A45B0, &stru_10023E460);
  v3 = qword_1002A45B8;
  if (os_log_type_enabled((os_log_t)qword_1002A45B8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "ReportDBMetrics: start", buf, 2u);
  }
  -[KTReportDBMetricsOperation logSharedMetrics](self, "logSharedMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTReportDBMetricsOperation deps](self, "deps"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataStore"));
  objc_msgSend(v5, "logMetricsForApplication:error:", kKTApplicationIdentifierIDS, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTReportDBMetricsOperation deps](self, "deps"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataStore"));
  objc_msgSend(v7, "logMetricsForApplication:error:", kKTApplicationIdentifierIDSFaceTime, 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTReportDBMetricsOperation deps](self, "deps"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataStore"));
  objc_msgSend(v9, "logMetricsForApplication:error:", kKTApplicationIdentifierIDSMultiplex, 0);

  if (qword_1002A45B0 != -1)
    dispatch_once(&qword_1002A45B0, &stru_10023E480);
  v10 = qword_1002A45B8;
  if (os_log_type_enabled((os_log_t)qword_1002A45B8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "ReportDBMetrics: end", v11, 2u);
  }
}

- (void)logSharedMetrics
{
  int64_t v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;

  v13 = 0;
  v3 = +[TransparencyFileSupport directorySizeInKB:](TransparencyFileSupport, "directorySizeInKB:", &v13);
  v4 = v13;
  if (v3 < 0)
  {
    if (qword_1002A45B0 != -1)
      dispatch_once(&qword_1002A45B0, &stru_10023E4A0);
    v5 = qword_1002A45B8;
    if (os_log_type_enabled((os_log_t)qword_1002A45B8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "failed to get support directory size: %@", buf, 0xCu);
    }
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTReportDBMetricsOperation deps](self, "deps"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "logger"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v3));
  objc_msgSend(v7, "logMetric:withName:", v8, CFSTR("ktTotalStorageSize"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTReportDBMetricsOperation deps](self, "deps"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dataStore"));
  v12 = v4;
  objc_msgSend(v10, "logSTHMetricsForApplication:error:", kKTApplicationIdentifierTLT, &v12);
  v11 = v12;

}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deps, 0);
}

@end
