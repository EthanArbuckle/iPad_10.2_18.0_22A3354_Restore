@implementation BMSyncSessionMetricsAggregator

- (BMSyncSessionMetricsAggregator)initWithDatabase:(id)a3 activity:(id)a4
{
  id v7;
  id v8;
  BMSyncSessionMetricsAggregator *v9;
  BMSyncSessionMetricsAggregator *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMSyncSessionMetricsAggregator;
  v9 = -[BMSyncSessionMetricsAggregator init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_database, a3);
    objc_storeStrong((id *)&v10->_activity, a4);
  }

  return v10;
}

- (void)computeAndSendAggregatedMetrics
{
  -[BMSyncSessionMetricsAggregator computeAggregatedSessionLogsWithHandlerBlock:](self, "computeAggregatedSessionLogsWithHandlerBlock:", &stru_100068AF8);
}

- (void)computeAggregatedSessionLogsWithHandlerBlock:(id)a3
{
  -[BMSyncDatabase computeAggregatedSessionLogsWithHandlerBlock:](self->_database, "computeAggregatedSessionLogsWithHandlerBlock:", a3);
}

- (void)enforceMaxSessionLogPrunePolicy
{
  -[BMSyncDatabase enforceMaxSessionLogPrunePolicy](self->_database, "enforceMaxSessionLogPrunePolicy");
}

- (void)compactAndDeleteSessionLogs
{
  -[BMSyncDatabase compactAndDeleteSessionLogs](self->_database, "compactAndDeleteSessionLogs");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
