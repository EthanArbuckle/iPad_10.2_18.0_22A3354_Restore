@implementation PPSCollectionOperator

void __49__PPSCollectionOperator_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a4;
  v8 = a5;
  PPSLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __49__PPSCollectionOperator_initOperatorDependancies__block_invoke_cold_2((uint64_t)v7, (uint64_t)v8, v9);

  objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("::"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count") != 2)
  {
    PPSLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __49__PPSCollectionOperator_initOperatorDependancies__block_invoke_cold_1(v11);

  }
  v12 = *(void **)(a1 + 32);
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "monitorMetricsForSubsystem:category:payload:", v13, v14, v8);

  v15 = *(void **)(a1 + 32);
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "logForSubsystem:category:data:", v16, v17, v8);

}

- (void)monitorMetricsForSubsystem:(id)a3 category:(id)a4 payload:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[PPSCollectionOperator monitor](self, "monitor"))
  {
    -[PPSCollectionOperator monitoredSubsystem](self, "monitoredSubsystem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", v8) & 1) != 0)
    {
      -[PPSCollectionOperator monitoredCategory](self, "monitoredCategory");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", v9);

      if (v13)
      {
        PPSDataStreamLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = 138412290;
          v16 = v10;
          _os_log_impl(&dword_1B6AB6000, v14, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v15, 0xCu);
        }

      }
    }
    else
    {

    }
  }

}

- (BOOL)monitor
{
  return self->_monitor;
}

- (PPSCollectionOperator)init
{
  PPSCollectionOperator *v3;
  objc_super v5;

  if (+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PPSCollectionOperator;
    self = -[PLOperator init](&v5, sel_init);
    v3 = self;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  PLXPCListenerOperatorComposition *v3;
  uint64_t v4;
  PLXPCListenerOperatorComposition *v5;
  PLXPCListenerOperatorComposition *metricListener;
  PLXPCResponderOperatorComposition *v7;
  PLXPCResponderOperatorComposition *allowlistResponder;
  PLCFNotificationOperatorComposition *v9;
  void *v10;
  PLCFNotificationOperatorComposition *v11;
  PLCFNotificationOperatorComposition *startMonitor;
  PLCFNotificationOperatorComposition *v13;
  void *v14;
  PLCFNotificationOperatorComposition *v15;
  PLCFNotificationOperatorComposition *stopMonitor;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];

  v3 = [PLXPCListenerOperatorComposition alloc];
  v4 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __49__PPSCollectionOperator_initOperatorDependancies__block_invoke;
  v19[3] = &unk_1E6A54AD8;
  v19[4] = self;
  v5 = -[PLXPCListenerOperatorComposition initWithOperator:withRegistration:withBlock:](v3, "initWithOperator:withRegistration:withBlock:", self, &unk_1E6AF7548, v19);
  metricListener = self->_metricListener;
  self->_metricListener = v5;

  if (+[PLPlatform internalBuild](PLPlatform, "internalBuild"))
  {
    v7 = -[PLXPCResponderOperatorComposition initWithOperator:withRegistration:withBlock:]([PLXPCResponderOperatorComposition alloc], "initWithOperator:withRegistration:withBlock:", self, &unk_1E6AF7570, &__block_literal_global_28);
    allowlistResponder = self->_allowlistResponder;
    self->_allowlistResponder = v7;

    v9 = [PLCFNotificationOperatorComposition alloc];
    -[PLOperator workQueue](self, "workQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v4;
    v18[1] = 3221225472;
    v18[2] = __49__PPSCollectionOperator_initOperatorDependancies__block_invoke_29;
    v18[3] = &unk_1E6A52118;
    v18[4] = self;
    v11 = -[PLCFNotificationOperatorComposition initWithWorkQueue:forNotification:requireState:withBlock:](v9, "initWithWorkQueue:forNotification:requireState:withBlock:", v10, CFSTR("com.apple.powerlog.dataStreamStartMonitor"), 0, v18);
    startMonitor = self->_startMonitor;
    self->_startMonitor = v11;

    v13 = [PLCFNotificationOperatorComposition alloc];
    -[PLOperator workQueue](self, "workQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v4;
    v17[1] = 3221225472;
    v17[2] = __49__PPSCollectionOperator_initOperatorDependancies__block_invoke_40;
    v17[3] = &unk_1E6A52118;
    v17[4] = self;
    v15 = -[PLCFNotificationOperatorComposition initWithWorkQueue:forNotification:requireState:withBlock:](v13, "initWithWorkQueue:forNotification:requireState:withBlock:", v14, CFSTR("com.apple.powerlog.dataStreamStopMonitor"), 0, v17);
    stopMonitor = self->_stopMonitor;
    self->_stopMonitor = v15;

  }
}

id __49__PPSCollectionOperator_initOperatorDependancies__block_invoke_23()
{
  NSObject *v0;
  uint8_t v2[16];

  PPSLogCommon();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1B6AB6000, v0, OS_LOG_TYPE_DEFAULT, "Received request to query allowlist", v2, 2u);
  }

  +[PPSCoreUtilities getAllowlist](PPSCoreUtilities, "getAllowlist");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __49__PPSCollectionOperator_initOperatorDependancies__block_invoke_29(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setMonitor:", 1);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("PerfPowerServicesDataStream"));
  objc_msgSend(v2, "stringForKey:", CFSTR("MonitorSubsystem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setMonitoredSubsystem:", v3);

  objc_msgSend(v2, "stringForKey:", CFSTR("MonitorCategory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setMonitoredCategory:", v4);

  PPSLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "monitoredSubsystem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "monitoredCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1B6AB6000, v5, OS_LOG_TYPE_DEFAULT, "Starting monitoring for subsystem: %@ category: %@", (uint8_t *)&v8, 0x16u);

  }
}

uint64_t __49__PPSCollectionOperator_initOperatorDependancies__block_invoke_40(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PPSLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B6AB6000, v2, OS_LOG_TYPE_DEFAULT, "Stopping monitoring", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setMonitor:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setMonitoredSubsystem:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setMonitoredCategory:", 0);
}

- (PLXPCListenerOperatorComposition)metricListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMetricListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PLXPCResponderOperatorComposition)allowlistResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAllowlistResponder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (PLCFNotificationOperatorComposition)startMonitor
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setStartMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (PLCFNotificationOperatorComposition)stopMonitor
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setStopMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void)setMonitor:(BOOL)a3
{
  self->_monitor = a3;
}

- (NSString)monitoredSubsystem
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setMonitoredSubsystem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)monitoredCategory
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setMonitoredCategory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitoredCategory, 0);
  objc_storeStrong((id *)&self->_monitoredSubsystem, 0);
  objc_storeStrong((id *)&self->_stopMonitor, 0);
  objc_storeStrong((id *)&self->_startMonitor, 0);
  objc_storeStrong((id *)&self->_allowlistResponder, 0);
  objc_storeStrong((id *)&self->_metricListener, 0);
}

void __49__PPSCollectionOperator_initOperatorDependancies__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B6AB6000, log, OS_LOG_TYPE_ERROR, "Malformed client message received", v1, 2u);
}

void __49__PPSCollectionOperator_initOperatorDependancies__block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_1B6AB6000, log, OS_LOG_TYPE_DEBUG, "Metric Key: %@ Payload: %@", (uint8_t *)&v3, 0x16u);
}

@end
