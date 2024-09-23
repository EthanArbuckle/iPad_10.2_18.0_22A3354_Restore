@implementation MZUPPAsynchronousTask

- (MZUPPAsynchronousTask)initWithHandlerQueue:(id)a3 taskTimeout:(double)a4 assertionTimeout:(double)a5 debugDescription:(id)a6 reportMetrics:(BOOL)a7
{
  _BOOL8 v7;
  MZUPPAsynchronousTask *v8;
  MZUPPMetrics *v9;
  objc_super v11;

  v7 = a7;
  v11.receiver = self;
  v11.super_class = (Class)MZUPPAsynchronousTask;
  v8 = -[MZAsynchronousTask initWithHandlerQueue:taskTimeout:assertionTimeout:debugDescription:](&v11, "initWithHandlerQueue:taskTimeout:assertionTimeout:debugDescription:", a3, a6, a4, a5);
  if (v8)
  {
    v9 = objc_alloc_init(MZUPPMetrics);
    -[MZUPPAsynchronousTask setMetrics:](v8, "setMetrics:", v9);

    -[MZUPPAsynchronousTask setReportMetrics:](v8, "setReportMetrics:", v7);
  }
  return v8;
}

- (void)beginTaskOperation
{
  double v3;
  double v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MZUPPAsynchronousTask;
  -[MZAsynchronousTask beginTaskOperation](&v6, "beginTaskOperation");
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZUPPAsynchronousTask metrics](self, "metrics"));
  objc_msgSend(v5, "setSyncTaskStartTime:", v4);

}

- (void)finishTaskOperationWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  unsigned int v23;
  const __CFString *v24;
  id v25;
  objc_super v26;
  uint8_t buf[4];
  const __CFString *v28;
  __int16 v29;
  void *v30;

  v6 = a4;
  v26.receiver = self;
  v26.super_class = (Class)MZUPPAsynchronousTask;
  v7 = a3;
  -[MZAsynchronousTask finishTaskOperationWithResult:error:](&v26, "finishTaskOperationWithResult:error:", v7, v6);
  v8 = objc_msgSend(v7, "BOOLValue", v26.receiver, v26.super_class);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZUPPAsynchronousTask metrics](self, "metrics"));
  objc_msgSend(v9, "setSuccess:", v8);

  if (v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MZUPPAsynchronousTask metrics](self, "metrics"));
    objc_msgSend(v11, "setErrorDomain:", v10);

    v12 = objc_msgSend(v6, "code");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MZUPPAsynchronousTask metrics](self, "metrics"));
    objc_msgSend(v13, "setErrorCode:", v12);

  }
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MZUPPAsynchronousTask metrics](self, "metrics"));
  objc_msgSend(v16, "setSyncTaskEndTime:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MZUPPAsynchronousTask metrics](self, "metrics"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "metricsDictionary"));

  v21 = _MTLogCategoryUPPSync(v19, v20);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = -[MZUPPAsynchronousTask reportMetrics](self, "reportMetrics");
    v24 = CFSTR("not ");
    if (v23)
      v24 = &stru_1004C6D40;
    *(_DWORD *)buf = 138412546;
    v28 = v24;
    v29 = 2112;
    v30 = v18;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Will %@report UPP metrics %@", buf, 0x16u);
  }

  if (-[MZUPPAsynchronousTask reportMetrics](self, "reportMetrics"))
  {
    v25 = objc_alloc_init((Class)IMAMSMetricsEvent);
    objc_msgSend(v25, "setEventType:", CFSTR("uppsync"));
    objc_msgSend(v25, "im_addPropertiesWithDictionary:", v18);
    +[IMMetrics recordEvent:topic:](IMMetrics, "recordEvent:topic:", v25, CFSTR("xp_amp_podcasts_log"));

  }
}

- (MZUPPMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (BOOL)reportMetrics
{
  return self->_reportMetrics;
}

- (void)setReportMetrics:(BOOL)a3
{
  self->_reportMetrics = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
}

@end
