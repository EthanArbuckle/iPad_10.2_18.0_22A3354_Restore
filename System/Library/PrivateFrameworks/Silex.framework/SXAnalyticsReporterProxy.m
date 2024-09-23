@implementation SXAnalyticsReporterProxy

- (SXAnalyticsReporterProxy)initWithAnalyticsReporter:(id)a3
{
  id v4;
  SXAnalyticsReporterProxy *v5;
  SXAnalyticsReporterProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SXAnalyticsReporterProxy;
  v5 = -[SXAnalyticsReporterProxy init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_analyticsReporter, v4);

  return v6;
}

- (void)reportEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = SXAnalyticsLog;
  if (os_log_type_enabled((os_log_t)SXAnalyticsLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_217023000, v5, OS_LOG_TYPE_DEFAULT, "Reporting analytics event, event=%{public}@", (uint8_t *)&v7, 0xCu);
  }
  -[SXAnalyticsReporterProxy analyticsReporter](self, "analyticsReporter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reportEvent:", v4);

}

- (SXAnalyticsReporting)analyticsReporter
{
  return (SXAnalyticsReporting *)objc_loadWeakRetained((id *)&self->_analyticsReporter);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_analyticsReporter);
}

@end
