@implementation _DASChargeRateAnalyzer

- (_DASChargeRateAnalyzer)initWithQueueLimit:(unint64_t)a3 reader:(id)a4 monitoringInterval:(unint64_t)a5 analyzeToMonitorRatio:(unint64_t)a6
{
  id v11;
  _DASChargeRateAnalyzer *v12;
  _DASSignalQueue *v13;
  _DASSignalQueue *chargeRateQueue;
  uint64_t v15;
  _CDContext *context;
  dispatch_queue_attr_t v17;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *executionQueue;
  _DASChargeRateAnalyzer *v21;
  uint64_t v22;
  _DASTimer *monitoringTimer;
  _QWORD v25[4];
  _DASChargeRateAnalyzer *v26;
  objc_super v27;

  v11 = a4;
  v27.receiver = self;
  v27.super_class = (Class)_DASChargeRateAnalyzer;
  v12 = -[_DASChargeRateAnalyzer init](&v27, "init");
  if (v12)
  {
    v13 = -[_DASSignalQueue initWithCount:]([_DASSignalQueue alloc], "initWithCount:", a3);
    chargeRateQueue = v12->_chargeRateQueue;
    v12->_chargeRateQueue = v13;

    objc_storeStrong((id *)&v12->_analyzerName, off_1001AA370);
    v15 = objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
    context = v12->_context;
    v12->_context = (_CDContext *)v15;

    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = dispatch_queue_create("com.apple.das.clas.chargeRateQueue", v18);
    executionQueue = v12->_executionQueue;
    v12->_executionQueue = (OS_dispatch_queue *)v19;

    objc_storeStrong((id *)&v12->_reader, a4);
    v12->_monitorInterval = a5;
    v12->_analyzeToMonitorRatio = a6;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100034588;
    v25[3] = &unk_10015D4E0;
    v21 = v12;
    v26 = v21;
    v22 = objc_claimAutoreleasedReturnValue(+[_DASTimer timerWithCallback:](_DASTimer, "timerWithCallback:", v25));
    monitoringTimer = v21->_monitoringTimer;
    v21->_monitoringTimer = (_DASTimer *)v22;

  }
  return v12;
}

- (void)start
{
  OS_dispatch_queue *executionQueue;
  _QWORD block[5];

  executionQueue = self->_executionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003466C;
  block[3] = &unk_10015D4E0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)executionQueue, block);
}

- (void)stop
{
  OS_dispatch_queue *executionQueue;
  _QWORD block[5];

  executionQueue = self->_executionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000346F4;
  block[3] = &unk_10015D4E0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)executionQueue, block);
}

- (void)recordValue
{
  OS_dispatch_queue *executionQueue;
  _QWORD block[5];

  executionQueue = self->_executionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100034760;
  block[3] = &unk_10015D4E0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)executionQueue, block);
}

- (double)getReferenceChargeRateForContext:(id)a3 reader:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  double v10;
  BOOL v11;
  double v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForBatteryLevel](_CDContextQueries, "keyPathForBatteryLevel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));
  v7 = (unint64_t)objc_msgSend(v6, "integerValue");

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForBatteryStateDataDictionary](_CDContextQueries, "keyPathForBatteryStateDataDictionary"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v8));

  if (+[_DASRequiresPluggedInPolicy isWirelessCharger:](_DASRequiresPluggedInPolicy, "isWirelessCharger:", v9))
  {
    v10 = 0.75;
    if ((uint64_t)v7 >= 50)
    {
      v10 = 0.375;
      if (v7 >= 0x3C)
      {
        if (v7 >= 0x50)
        {
          if (v7 < 0x5A)
          {
            v10 = 0.15;
            goto LABEL_18;
          }
          v11 = v7 >= 0x5F;
          v12 = 0.1125;
          goto LABEL_15;
        }
        goto LABEL_12;
      }
    }
  }
  else
  {
    if ((uint64_t)v7 < 50)
    {
      v10 = 0.9;
      goto LABEL_18;
    }
    v10 = 0.75;
    if (v7 >= 0x3C)
    {
      v10 = 0.375;
      if (v7 >= 0x50)
      {
        if (v7 >= 0x5A)
        {
          v11 = v7 >= 0x5F;
          v12 = 0.15;
LABEL_15:
          if (v11)
            v10 = 0.0;
          else
            v10 = v12;
          goto LABEL_18;
        }
LABEL_12:
        v10 = 0.225;
      }
    }
  }
LABEL_18:

  return v10;
}

- (NSMutableDictionary)analyticsStatus
{
  OS_dispatch_queue *executionQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1000349B4;
  v10 = sub_1000349C4;
  v11 = 0;
  executionQueue = self->_executionQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000349CC;
  v5[3] = &unk_10015D580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)executionQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSMutableDictionary *)v3;
}

- (void)analyzeValues:(id)a3 currentContext:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *executionQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  executionQueue = self->_executionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100034AAC;
  block[3] = &unk_10015D530;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync((dispatch_queue_t)executionQueue, block);

}

- (BOOL)encounteredTLC
{
  return self->_encounteredTLC;
}

- (void)setEncounteredTLC:(BOOL)a3
{
  self->_encounteredTLC = a3;
}

- (unint64_t)controlEffortResult
{
  return self->_controlEffortResult;
}

- (void)setControlEffortResult:(unint64_t)a3
{
  self->_controlEffortResult = a3;
}

- (_DASSignalReader)reader
{
  return self->_reader;
}

- (void)setReader:(id)a3
{
  objc_storeStrong((id *)&self->_reader, a3);
}

- (unint64_t)analyzeToMonitorRatio
{
  return self->_analyzeToMonitorRatio;
}

- (void)setAnalyzeToMonitorRatio:(unint64_t)a3
{
  self->_analyzeToMonitorRatio = a3;
}

- (_CDContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (_DASSignalQueue)chargeRateQueue
{
  return self->_chargeRateQueue;
}

- (void)setChargeRateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_chargeRateQueue, a3);
}

- (OS_dispatch_queue)executionQueue
{
  return self->_executionQueue;
}

- (void)setExecutionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_executionQueue, a3);
}

- (_DASTimer)monitoringTimer
{
  return self->_monitoringTimer;
}

- (void)setMonitoringTimer:(id)a3
{
  objc_storeStrong((id *)&self->_monitoringTimer, a3);
}

- (unint64_t)monitorInterval
{
  return self->_monitorInterval;
}

- (void)setMonitorInterval:(unint64_t)a3
{
  self->_monitorInterval = a3;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (unint64_t)monitorCount
{
  return self->_monitorCount;
}

- (void)setMonitorCount:(unint64_t)a3
{
  self->_monitorCount = a3;
}

- (NSString)analyzerName
{
  return self->_analyzerName;
}

- (void)setAnalyzerName:(id)a3
{
  objc_storeStrong((id *)&self->_analyzerName, a3);
}

- (void)setAnalyticsStatus:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsStatus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsStatus, 0);
  objc_storeStrong((id *)&self->_analyzerName, 0);
  objc_storeStrong((id *)&self->_monitoringTimer, 0);
  objc_storeStrong((id *)&self->_executionQueue, 0);
  objc_storeStrong((id *)&self->_chargeRateQueue, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
