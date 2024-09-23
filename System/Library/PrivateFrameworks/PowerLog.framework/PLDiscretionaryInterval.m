@implementation PLDiscretionaryInterval

- (PLDiscretionaryInterval)initWithIdentifier:(id)a3 andInfo:(id)a4 andSnapshottingEnabled:(BOOL)a5 andMockData:(id)a6
{
  id v10;
  id v11;
  id v12;
  PLDiscretionaryInterval *v13;
  void *v14;
  void *v15;
  PLNetworkUsageSnapshot *v16;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PLDiscretionaryInterval;
  v13 = -[PLDiscretionaryInterval init](&v18, sel_init);
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDiscretionaryInterval setOriginalStartDate:](v13, "setOriginalStartDate:", v14);

    -[PLDiscretionaryInterval originalStartDate](v13, "originalStartDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDiscretionaryInterval setCurrentStartDate:](v13, "setCurrentStartDate:", v15);

    -[PLDiscretionaryInterval setOpenCount:](v13, "setOpenCount:", 1.0);
    -[PLDiscretionaryInterval setStartCount:](v13, "setStartCount:", 1.0);
    if (a5)
    {
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("discretionaryNetworkTasks")))
      {
        v16 = -[PLNetworkUsageSnapshot initWithInfo:]([PLNetworkUsageSnapshot alloc], "initWithInfo:", v11);
        -[PLDiscretionaryInterval setNetworkEnergySnapshot:](v13, "setNetworkEnergySnapshot:", v16);
      }
      else
      {
        v16 = -[PLCPUEnergySnapshot initWithIdentifier:andMockData:]([PLCPUEnergySnapshot alloc], "initWithIdentifier:andMockData:", v10, v12);
        -[PLDiscretionaryInterval setCpuEnergySnapshot:](v13, "setCpuEnergySnapshot:", v16);
      }
    }
    else
    {
      PLLogDiscretionaryEnergyMonitor();
      v16 = (PLNetworkUsageSnapshot *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v16->super, OS_LOG_TYPE_DEBUG))
        -[PLDiscretionaryInterval initWithIdentifier:andInfo:andSnapshottingEnabled:andMockData:].cold.1();
    }

  }
  return v13;
}

- (BOOL)shouldClose
{
  double v2;

  -[PLDiscretionaryInterval openCount](self, "openCount");
  return v2 < 1.0;
}

- (BOOL)isClosed
{
  void *v2;
  BOOL v3;

  -[PLDiscretionaryInterval endDate](self, "endDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)closeInterval
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "openCount");
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_10(&dword_19EA99000, a2, v3, "Attempted to close interval with openCount=%f", v4);
  OUTLINED_FUNCTION_8();
}

- (double)checkOpenIntervalDuration:(id)a3
{
  id v4;
  NSObject *v5;
  double v6;
  void *v7;
  double v8;
  NSObject *v9;
  NSObject *v10;
  void *v12;
  int v13;
  double v14;
  __int16 v15;
  PLDiscretionaryInterval *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PLDiscretionaryInterval isClosed](self, "isClosed"))
  {
    PLLogDiscretionaryEnergyMonitor();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = 0.0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[PLDiscretionaryInterval checkOpenIntervalDuration:].cold.1();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = objc_claimAutoreleasedReturnValue();
    -[PLDiscretionaryInterval originalStartDate](self, "originalStartDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject timeIntervalSinceDate:](v5, "timeIntervalSinceDate:", v7);
    v6 = v8;

    PLLogDiscretionaryEnergyMonitor();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      -[PLDiscretionaryInterval originalStartDate](self, "originalStartDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 134218498;
      v14 = v6;
      v15 = 2112;
      v16 = (PLDiscretionaryInterval *)v5;
      v17 = 2112;
      v18 = v12;
      _os_log_debug_impl(&dword_19EA99000, v9, OS_LOG_TYPE_DEBUG, "timeSinceIntervalStart=%f, now=%@, intervalStartDate=%@", (uint8_t *)&v13, 0x20u);

    }
    if (v6 > 600.0)
    {
      PLLogDiscretionaryEnergyMonitor();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v13 = 134218498;
        v14 = v6;
        v15 = 2112;
        v16 = self;
        v17 = 2112;
        v18 = v4;
        _os_log_error_impl(&dword_19EA99000, v10, OS_LOG_TYPE_ERROR, "Interval open for %f seconds, potential unclosed interval=%@ for identifier=%@", (uint8_t *)&v13, 0x20u);
      }

    }
  }

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PLDiscretionaryInterval originalStartDate](self, "originalStartDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDiscretionaryInterval currentStartDate](self, "currentStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDiscretionaryInterval endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDiscretionaryInterval cpuEnergySnapshot](self, "cpuEnergySnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDiscretionaryInterval networkEnergySnapshot](self, "networkEnergySnapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDiscretionaryInterval openCount](self, "openCount");
  v10 = v9;
  -[PLDiscretionaryInterval startCount](self, "startCount");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("originalStartDate=%@, currentStartDate=%@, endDate=%@, cpuEnergySnapshot=%@, networkEnergySnapshot=%@, openCount=%f, startCount=%f"), v4, v5, v6, v7, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSDate)originalStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setOriginalStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDate)currentStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCurrentStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (PLCPUEnergySnapshot)cpuEnergySnapshot
{
  return (PLCPUEnergySnapshot *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCpuEnergySnapshot:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (PLNetworkUsageSnapshot)networkEnergySnapshot
{
  return (PLNetworkUsageSnapshot *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNetworkEnergySnapshot:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (double)startCount
{
  return self->_startCount;
}

- (void)setStartCount:(double)a3
{
  self->_startCount = a3;
}

- (double)openCount
{
  return self->_openCount;
}

- (void)setOpenCount:(double)a3
{
  self->_openCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkEnergySnapshot, 0);
  objc_storeStrong((id *)&self->_cpuEnergySnapshot, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_currentStartDate, 0);
  objc_storeStrong((id *)&self->_originalStartDate, 0);
}

- (void)initWithIdentifier:andInfo:andSnapshottingEnabled:andMockData:.cold.1()
{
  os_log_t v0;
  uint8_t v1[12];
  __int16 v2;
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  v2 = 1024;
  v3 = 0;
  _os_log_debug_impl(&dword_19EA99000, v0, OS_LOG_TYPE_DEBUG, "Initializing discretionary interval without snapshotting for identifier=%@, snapshottingEnabled=%d", v1, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)checkOpenIntervalDuration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_12(&dword_19EA99000, v0, v1, "Attempting to check open interval duration for a closed interval", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

@end
