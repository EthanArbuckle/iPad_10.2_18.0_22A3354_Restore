@implementation RBHistoricalStatistics

- (void)notifyMonitorCount:(unint64_t)a3
{
  self->_currentMonitors = a3;
  if (self->_peakMonitors < a3)
  {
    self->_peakMonitors = a3;
    -[RBHistoricalStatistics logStatisticsWithLabel:](self, CFSTR("Monitor HWM "));
  }
}

- (void)notifyAssertionCount:(unint64_t)a3
{
  self->_currentAsserions = a3;
  if (self->_peakAssertions < a3)
  {
    self->_peakAssertions = a3;
    -[RBHistoricalStatistics logStatisticsWithLabel:](self, CFSTR("Assertion HWM "));
  }
}

- (void)notifyProcessCount:(unint64_t)a3
{
  self->_currentProcesses = a3;
  if (self->_peakProcesses < a3)
  {
    self->_peakProcesses = a3;
    -[RBHistoricalStatistics logStatisticsWithLabel:](self, CFSTR("Process HWM "));
  }
}

- (void)notifyClientCount:(unint64_t)a3
{
  self->_currentClients = a3;
  if (self->_peakClients < a3)
  {
    self->_peakClients = a3;
    -[RBHistoricalStatistics logStatisticsWithLabel:](self, CFSTR("Client HWM "));
  }
}

- (void)logStatisticsWithLabel:(_QWORD *)a1
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    rbs_general_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = a1[2];
      v6 = a1[3];
      v7 = a1[4];
      v8 = a1[5];
      v9 = a1[6];
      v10 = a1[7];
      v11 = a1[8];
      v12 = a1[9];
      v13 = 138414338;
      v14 = v3;
      v15 = 2048;
      v16 = v5;
      v17 = 2048;
      v18 = v6;
      v19 = 2048;
      v20 = v7;
      v21 = 2048;
      v22 = v8;
      v23 = 2048;
      v24 = v9;
      v25 = 2048;
      v26 = v10;
      v27 = 2048;
      v28 = v11;
      v29 = 2048;
      v30 = v12;
      _os_log_impl(&dword_21A8B4000, v4, OS_LOG_TYPE_DEFAULT, "%@C %lu(%lu) P %lu(%lu) A %lu(%lu) M %lu(%lu)", (uint8_t *)&v13, 0x5Cu);
    }

  }
}

- (void)logStatisticsPeriodically
{
  _QWORD block[5];

  if (a1)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__RBHistoricalStatistics_logStatisticsPeriodically__block_invoke;
    block[3] = &unk_24DD46160;
    block[4] = a1;
    if (logStatisticsPeriodically_onceToken != -1)
      dispatch_once(&logStatisticsPeriodically_onceToken, block);
  }
}

void __51__RBHistoricalStatistics_logStatisticsPeriodically__block_invoke(uint64_t a1)
{
  NSObject *v2;
  dispatch_queue_t v3;
  void *v4;
  dispatch_source_t v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  _QWORD handler[5];

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_queue_create("RBHistoricalStatistics", v2);
  v4 = (void *)logStatisticsPeriodically_periodicQueue;
  logStatisticsPeriodically_periodicQueue = (uint64_t)v3;

  v5 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)logStatisticsPeriodically_periodicQueue);
  v6 = (void *)logStatisticsPeriodically_periodicSource;
  logStatisticsPeriodically_periodicSource = (uint64_t)v5;

  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __51__RBHistoricalStatistics_logStatisticsPeriodically__block_invoke_2;
  handler[3] = &unk_24DD46160;
  handler[4] = *(_QWORD *)(a1 + 32);
  dispatch_source_set_event_handler((dispatch_source_t)logStatisticsPeriodically_periodicSource, handler);
  dispatch_activate((dispatch_object_t)logStatisticsPeriodically_periodicSource);
  v7 = logStatisticsPeriodically_periodicSource;
  v8 = dispatch_time(0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  dispatch_source_set_timer(v7, v8, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) / 0xAuLL);
}

void __51__RBHistoricalStatistics_logStatisticsPeriodically__block_invoke_2(uint64_t a1)
{
  -[RBHistoricalStatistics logStatisticsWithLabel:](*(_QWORD **)(a1 + 32), CFSTR("HWM Stats "));
}

- (RBHistoricalStatistics)initWithReportFrequency:(unint64_t)a3
{
  RBHistoricalStatistics *v4;
  RBHistoricalStatistics *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RBHistoricalStatistics;
  v4 = -[RBHistoricalStatistics init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_frequency = a3;
    v4->_period = 60000000000 * a3;
    -[RBHistoricalStatistics logStatisticsPeriodically]((uint64_t)v4);
  }
  return v5;
}

@end
