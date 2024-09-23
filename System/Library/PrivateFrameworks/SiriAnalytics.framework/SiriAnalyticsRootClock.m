@implementation SiriAnalyticsRootClock

- (SiriAnalyticsRootClock)initWithClockIdentifier:(id)a3 timestampOffset:(unint64_t)a4 startedOn:(unint64_t)a5 metastore:(id)a6
{
  id v10;
  id v11;
  SiriAnalyticsRootClock *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *derivativeClocksByStreamUUID;
  SiriAnalyticsSensitiveConditionsLedger *v15;
  SiriAnalyticsSensitiveConditionsLedger *sensitiveConditionsLedger;
  objc_super v18;

  v10 = a3;
  v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SiriAnalyticsRootClock;
  v12 = -[SiriAnalyticsLogicalClock initWithClockIdentifier:timestampOffset:startedOn:](&v18, sel_initWithClockIdentifier_timestampOffset_startedOn_, v10, a4, a5);
  if (v12)
  {
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    derivativeClocksByStreamUUID = v12->_derivativeClocksByStreamUUID;
    v12->_derivativeClocksByStreamUUID = v13;

    v15 = -[SiriAnalyticsSensitiveConditionsLedger initWithClockIdentifier:metastore:]([SiriAnalyticsSensitiveConditionsLedger alloc], "initWithClockIdentifier:metastore:", v10, v11);
    sensitiveConditionsLedger = v12->_sensitiveConditionsLedger;
    v12->_sensitiveConditionsLedger = v15;

  }
  return v12;
}

- (BOOL)isTrackingDerivativeClockByStreamUUID:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKey:](self->_derivativeClocksByStreamUUID, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)derivativeClockForStreamUUID:(id)a3
{
  id v4;
  SiriAnalyticsDerivativeClock *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  SiriAnalyticsDerivativeClock *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  SiriAnalyticsRootClock *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_derivativeClocksByStreamUUID, "objectForKey:", v4);
  v5 = (SiriAnalyticsDerivativeClock *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3A28];
    -[SiriAnalyticsLogicalClock clockIdentifier](self, "clockIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sa_deterministicUUIDv5ForNamespaceUUID:sourceUUID:", v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = -[SiriAnalyticsDerivativeClock initWithClockIdentifier:isolatedStreamUUID:timestampOffset:rootClock:]([SiriAnalyticsDerivativeClock alloc], "initWithClockIdentifier:isolatedStreamUUID:timestampOffset:rootClock:", v8, v4, -[SiriAnalyticsLogicalClock timestampOffset](self, "timestampOffset"), self);
    if (SiriAnalyticsLoggingInit_once != -1)
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
    v9 = SiriAnalyticsLogContextTime;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextTime, OS_LOG_TYPE_INFO))
    {
      v11 = 136316162;
      v12 = "-[SiriAnalyticsRootClock derivativeClockForStreamUUID:]";
      v13 = 2112;
      v14 = v5;
      v15 = 2112;
      v16 = v8;
      v17 = 2112;
      v18 = v4;
      v19 = 2112;
      v20 = self;
      _os_log_impl(&dword_1A025F000, v9, OS_LOG_TYPE_INFO, "%s Created derivative clock: %@ with identifer: %@ for streamUUID: %@ with parent clock: %@", (uint8_t *)&v11, 0x34u);
    }
    -[NSMutableDictionary setObject:forKey:](self->_derivativeClocksByStreamUUID, "setObject:forKey:", v5, v4);

  }
  return v5;
}

- (id)derivativeClocks
{
  return (id)-[NSMutableDictionary allValues](self->_derivativeClocksByStreamUUID, "allValues");
}

- (void)sensitiveCondition:(int)a3 startedAt:(unint64_t)a4
{
  uint64_t v5;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  SiriAnalyticsRootClock *v13;
  uint64_t v14;

  v5 = *(_QWORD *)&a3;
  v14 = *MEMORY[0x1E0C80C00];
  if (-[SiriAnalyticsLogicalClock containsTimestamp:](self, "containsTimestamp:", a4))
  {
    -[SiriAnalyticsSensitiveConditionsLedger startWithSensitiveCondition:at:](self->_sensitiveConditionsLedger, "startWithSensitiveCondition:at:", v5, a4);
  }
  else
  {
    if (SiriAnalyticsLoggingInit_once != -1)
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
    v7 = SiriAnalyticsLogContextTime;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextTime, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315650;
      v9 = "-[SiriAnalyticsRootClock sensitiveCondition:startedAt:]";
      v10 = 2048;
      v11 = (int)v5;
      v12 = 2112;
      v13 = self;
      _os_log_error_impl(&dword_1A025F000, v7, OS_LOG_TYPE_ERROR, "%s Attempted to track begin for sensitive condition %lu outside scope of clock: %@", (uint8_t *)&v8, 0x20u);
    }
  }
}

- (void)sensitiveCondition:(int)a3 endedAt:(unint64_t)a4
{
  uint64_t v5;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  SiriAnalyticsRootClock *v13;
  uint64_t v14;

  v5 = *(_QWORD *)&a3;
  v14 = *MEMORY[0x1E0C80C00];
  if (-[SiriAnalyticsLogicalClock containsTimestamp:](self, "containsTimestamp:", a4))
  {
    -[SiriAnalyticsSensitiveConditionsLedger endWithSensitiveCondition:at:](self->_sensitiveConditionsLedger, "endWithSensitiveCondition:at:", v5, a4);
  }
  else
  {
    if (SiriAnalyticsLoggingInit_once != -1)
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_713);
    v7 = SiriAnalyticsLogContextTime;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextTime, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315650;
      v9 = "-[SiriAnalyticsRootClock sensitiveCondition:endedAt:]";
      v10 = 2048;
      v11 = (int)v5;
      v12 = 2112;
      v13 = self;
      _os_log_error_impl(&dword_1A025F000, v7, OS_LOG_TYPE_ERROR, "%s Attempted to track end for sensitive condition %lu outside scope of clock: %@", (uint8_t *)&v8, 0x20u);
    }
  }
}

- (SiriAnalyticsSensitiveConditionsLedger)sensitiveConditionsLedger
{
  return self->_sensitiveConditionsLedger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sensitiveConditionsLedger, 0);
  objc_storeStrong((id *)&self->_derivativeClocksByStreamUUID, 0);
}

@end
