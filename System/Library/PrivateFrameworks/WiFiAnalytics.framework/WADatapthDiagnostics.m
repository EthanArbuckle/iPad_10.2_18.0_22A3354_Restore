@implementation WADatapthDiagnostics

- (WADatapthDiagnostics)initWithWADatapthDiagnosticsReport:(const void *)a3 length:(unint64_t)a4
{
  WADatapthDiagnostics *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  PBCodable *awdReport;
  BOOL v12;
  NSObject *v13;
  WADatapthDiagnostics *v14;
  NSObject *v16;
  id v18;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  NSObject *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)WADatapthDiagnostics;
  v6 = -[WADatapthDiagnostics init](&v19, sel_init);
  v7 = (void *)MEMORY[0x212BEF45C]();
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    WALogCategoryDefaultHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v21 = "-[WADatapthDiagnostics initWithWADatapthDiagnosticsReport:length:]";
      v22 = 1024;
      v23 = 50;
      _os_log_impl(&dword_212581000, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:resultData failed", buf, 0x12u);
    }
    goto LABEL_16;
  }
  v6->_action = 2;
  v18 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v8, &v18);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v18;
  awdReport = v6->_awdReport;
  v6->_awdReport = (PBCodable *)v9;

  if (v6->_awdReport)
    v12 = v10 == 0;
  else
    v12 = 0;
  if (!v12)
  {
    WALogCategoryDefaultHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v21 = "-[WADatapthDiagnostics initWithWADatapthDiagnosticsReport:length:]";
      v22 = 1024;
      v23 = 56;
      v24 = 2112;
      v25 = v10;
      _os_log_impl(&dword_212581000, v16, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive WAMessage: %@", buf, 0x1Cu);
    }

LABEL_16:
    objc_autoreleasePoolPop(v7);
    v14 = 0;
    goto LABEL_10;
  }

  objc_autoreleasePoolPop(v7);
  WALogCategoryDefaultHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446466;
    v21 = "-[WADatapthDiagnostics initWithWADatapthDiagnosticsReport:length:]";
    v22 = 1024;
    v23 = 58;
    _os_log_impl(&dword_212581000, v13, OS_LOG_TYPE_INFO, "%{public}s::%d:Success", buf, 0x12u);
  }

  v14 = v6;
LABEL_10:

  return v14;
}

- (unsigned)awdMetricID
{
  if (self->_awdMetricID)
    return self->_awdMetricID;
  else
    return 589928;
}

- (PBCodable)awdReport
{
  PBCodable *awdReport;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  PBCodable *v7;
  NSObject *v9;
  const char *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  PBCodable *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  awdReport = self->_awdReport;
  if (!awdReport)
  {
    WALogCategoryDefaultHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 136446466;
      v12 = "-[WADatapthDiagnostics awdReport]";
      v13 = 1024;
      v14 = 75;
      v10 = "%{public}s::%d:_awdReport missing";
LABEL_11:
      _os_log_impl(&dword_212581000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v11, 0x12u);
    }
LABEL_12:

    return (PBCodable *)0;
  }
  -[PBCodable stallNotifications](awdReport, "stallNotifications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    WALogCategoryDefaultHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 136446466;
      v12 = "-[WADatapthDiagnostics awdReport]";
      v13 = 1024;
      v14 = 78;
      v10 = "%{public}s::%d:_awdReport 0 stallNotifications";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  -[WADatapthDiagnostics setAwdMetricID:](self, "setAwdMetricID:", 589928);
  WALogCategoryDefaultHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = self->_awdReport;
    v11 = 136446722;
    v12 = "-[WADatapthDiagnostics awdReport]";
    v13 = 1024;
    v14 = 85;
    v15 = 2114;
    v16 = v7;
    _os_log_impl(&dword_212581000, v6, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Generated wifi datapath diagnostics report: %{public}@", (uint8_t *)&v11, 0x1Cu);
  }

  return self->_awdReport;
}

- (void)setAwdReport:(id)a3
{
  objc_storeStrong((id *)&self->_awdReport, a3);
}

- (void)setAwdMetricID:(unsigned int)a3
{
  self->_awdMetricID = a3;
}

- (int)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_awdReport, 0);
}

@end
