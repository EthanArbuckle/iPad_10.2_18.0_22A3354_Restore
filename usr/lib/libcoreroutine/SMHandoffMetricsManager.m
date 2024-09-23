@implementation SMHandoffMetricsManager

- (SMHandoffMetricsManager)init
{
  SMHandoffMetricsManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SMHandoffMetricsManager;
  v2 = -[RTMetric init](&v4, sel_init);
  -[SMHandoffMetricsManager resetMetrics](v2, "resetMetrics");
  return v2;
}

- (void)addMetricHandoffReason:(int64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("handoffReason"));

}

- (void)addMetricErrorCode:(int64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("errorCodeForDomain"));

}

- (void)addMetricErrorDomain:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[RTMetric metrics](self, "metrics");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("errorDomain"));

}

- (void)addMetricForLatencyEligibilityChecks:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", round(a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "binForNumber:bins:", v6, &unk_1E932C058);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[RTMetric metrics](self, "metrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("latencyEligibilityChecks"));

}

- (void)addMetricForLatencyFetchActiveSessionDetailsCK:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", round(a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "binForNumber:bins:", v6, &unk_1E932C070);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[RTMetric metrics](self, "metrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("latencyFetchActiveSessionDetailsCK"));

}

- (void)addMetricForLatencyHandoffCriteria:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", round(a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "binForNumber:bins:", v6, &unk_1E932C088);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[RTMetric metrics](self, "metrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("latencyHandoffCriteria"));

}

- (void)addMetricForLatencyHandoffEndToEnd:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", round(a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "binForNumber:bins:", v6, &unk_1E932C0A0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[RTMetric metrics](self, "metrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("latencyHandoffEndToEnd"));

}

- (void)addMetricForLatencyWriteActiveSessionDetailsCK:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", round(a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "binForNumber:bins:", v6, &unk_1E932C0B8);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[RTMetric metrics](self, "metrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("latencyWriteActiveSessionDetailsCK"));

}

- (void)addMetricSucceeded:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[RTMetric metrics](self, "metrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("succeeded"));

}

+ ($E278B6834D55977C8D8083A775B4AB36)event
{
  return ($E278B6834D55977C8D8083A775B4AB36)RTAnalyticsEventSafetyMonitorMultiDeviceHandoffSessionMetrics;
}

+ (id)supportedMetricKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("handoffReason"), CFSTR("errorCodeForDomain"), CFSTR("errorDomain"), CFSTR("latencyEligibilityChecks"), CFSTR("latencyFetchActiveSessionDetailsCK"), CFSTR("latencyHandoffCriteria"), CFSTR("latencyHandoffEndToEnd"), CFSTR("latencyWriteActiveSessionDetailsCK"), CFSTR("succeeded"), 0);
}

- (void)resetMetrics
{
  void *v3;

  -[RTMetric metrics](self, "metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E9326768, CFSTR("handoffReason"));

  -[SMHandoffMetricsManager addMetricErrorCode:](self, "addMetricErrorCode:", 0);
  -[SMHandoffMetricsManager addMetricErrorDomain:](self, "addMetricErrorDomain:", CFSTR("Unknown"));
  -[SMHandoffMetricsManager addMetricForLatencyEligibilityChecks:](self, "addMetricForLatencyEligibilityChecks:", -1.0);
  -[SMHandoffMetricsManager addMetricForLatencyFetchActiveSessionDetailsCK:](self, "addMetricForLatencyFetchActiveSessionDetailsCK:", -1.0);
  -[SMHandoffMetricsManager addMetricForLatencyHandoffCriteria:](self, "addMetricForLatencyHandoffCriteria:", -1.0);
  -[SMHandoffMetricsManager addMetricForLatencyHandoffEndToEnd:](self, "addMetricForLatencyHandoffEndToEnd:", -1.0);
  -[SMHandoffMetricsManager addMetricForLatencyWriteActiveSessionDetailsCK:](self, "addMetricForLatencyWriteActiveSessionDetailsCK:", -1.0);
  -[SMHandoffMetricsManager addMetricSucceeded:](self, "addMetricSucceeded:", 0);
}

@end
