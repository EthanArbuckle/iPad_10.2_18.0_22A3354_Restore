@implementation PLNetworkUsageSnapshot

- (PLNetworkUsageSnapshot)initWithInfo:(id)a3
{
  id v4;
  PLNetworkUsageSnapshot *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLNetworkUsageSnapshot;
  v5 = -[PLNetworkUsageSnapshot init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLNetworkUsageSnapshot setTimestamp:](v5, "setTimestamp:", v6);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cell"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLNetworkUsageSnapshot setCellType:](v5, "setCellType:", v7);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("quality"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLNetworkUsageSnapshot setQuality:](v5, "setQuality:", v8);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wifi"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLNetworkUsageSnapshot setWifi:](v5, "setWifi:", v9);

  }
  return v5;
}

- (void)snapshotNetworkState
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PLNetworkUsageSnapshot setTimestamp:](self, "setTimestamp:", v3);

}

- (double)computeEnergyDiffUntilNow:(BOOL)a3
{
  _BOOL4 v3;
  PLNetworkUsageSnapshot *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  NSObject *v13;

  v3 = a3;
  v5 = objc_alloc_init(PLNetworkUsageSnapshot);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLNetworkUsageSnapshot setTimestamp:](v5, "setTimestamp:", v6);

  -[PLNetworkUsageSnapshot cellType](self, "cellType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLNetworkUsageSnapshot setCellType:](v5, "setCellType:", v7);

  -[PLNetworkUsageSnapshot quality](self, "quality");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLNetworkUsageSnapshot setQuality:](v5, "setQuality:", v8);

  -[PLNetworkUsageSnapshot wifi](self, "wifi");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLNetworkUsageSnapshot setWifi:](v5, "setWifi:", v9);

  -[PLNetworkUsageSnapshot computeEnergyDiff:](v5, "computeEnergyDiff:", self);
  v11 = v10;
  if (v3)
  {
    PLLogDiscretionaryEnergyMonitor();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[PLNetworkUsageSnapshot computeEnergyDiffUntilNow:].cold.2();

    -[PLNetworkUsageSnapshot snapshotNetworkState](self, "snapshotNetworkState");
    PLLogDiscretionaryEnergyMonitor();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[PLNetworkUsageSnapshot computeEnergyDiffUntilNow:].cold.1();

  }
  return v11;
}

- (double)computeEnergyDiff:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  int v17;
  double v18;

  v4 = a3;
  PLLogDiscretionaryEnergyMonitor();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[PLNetworkUsageSnapshot computeEnergyDiff:].cold.1();

  -[PLNetworkUsageSnapshot timestamp](self, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v9 = v8;

  -[PLNetworkUsageSnapshot wifi](self, "wifi");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = 15.3333333;
  }
  else
  {
    -[PLNetworkUsageSnapshot cellType](self, "cellType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("5G"));

    if ((v13 & 1) != 0)
    {
      v11 = 47.3333333;
    }
    else
    {
      -[PLNetworkUsageSnapshot cellType](self, "cellType");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("LTE"));

      if ((v15 & 1) != 0)
      {
        v11 = 38.0;
      }
      else
      {
        -[PLNetworkUsageSnapshot cellType](self, "cellType");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("PreLTE"));

        v11 = 0.0;
        if (v17)
          v11 = 30.0;
      }
    }
  }
  v18 = v9 / 3600.0 * v11;

  return v18;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PLNetworkUsageSnapshot timestamp](self, "timestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLNetworkUsageSnapshot cellType](self, "cellType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLNetworkUsageSnapshot quality](self, "quality");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLNetworkUsageSnapshot wifi](self, "wifi");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("timestamp=%@, cellType=%@, quality=%@, WiFi=%@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)cellType
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCellType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)quality
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setQuality:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)wifi
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setWifi:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifi, 0);
  objc_storeStrong((id *)&self->_quality, 0);
  objc_storeStrong((id *)&self->_cellType, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

- (void)computeEnergyDiffUntilNow:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_19EA99000, v0, v1, "after adjusting networkEnergySnapshot=%@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)computeEnergyDiffUntilNow:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_19EA99000, v0, v1, "adjusting networkEnergySnapshot=%@ to now", v2);
  OUTLINED_FUNCTION_1();
}

- (void)computeEnergyDiff:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19EA99000, v0, v1, "computing network energy diff between self=%@ and otherSnapshot=%@");
  OUTLINED_FUNCTION_1();
}

@end
