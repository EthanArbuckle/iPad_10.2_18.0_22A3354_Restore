@implementation DownloadThroughputDelegate

- (id)createTaskWithRequest:(id)a3 session:(id)a4
{
  return (id)objc_msgSend(a4, "dataTaskWithRequest:", a3);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  if (!*(_WORD *)&self->super._canceled)
  {
    if (-[NSMutableArray indexOfObject:](self->super._probeSessions, "indexOfObject:", v10) == 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableArray addObject:](self->super._probeSessions, "addObject:", v10);
    -[ThroughputDelegate addNewThroughputMeasurement:](self, "addNewThroughputMeasurement:", objc_msgSend(v9, "length"));
  }

}

- (void)updateResultsWithFlowCount
{
  id v3;

  if (!self->super._canceled)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[NSMutableArray count](self->super._tasks, "count"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[NetworkQualityResult setDownlinkFlows:](self->super._results, "setDownlinkFlows:", v3);

  }
}

- (void)updateResultsWithByteCount
{
  id v3;

  if (!self->super._canceled)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->super._currentBytesTransferred);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[NetworkQualityResult setDownlinkBytesTransferred:](self->super._results, "setDownlinkBytesTransferred:", v3);

  }
}

- (void)updateResultsWithThroughput:(int64_t)a3 confidence:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (!self->super._canceled)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NetworkQualityResult downlinkCapacity](self->super._results, "downlinkCapacity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:", v6);

    -[NetworkQualityResult downlinkCapacity](self->super._results, "downlinkCapacity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateConfidence:", a4);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->super._currentBytesTransferred);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[NetworkQualityResult setDownlinkBytesTransferred:](self->super._results, "setDownlinkBytesTransferred:", v9);

  }
}

- (BOOL)checkLimits
{
  int64_t currentBytesTransferred;
  void *v4;
  int64_t v5;
  NetworkQualityConfiguration *nqConfig;
  NSObject *v7;
  BOOL v8;
  float v9;
  float v11;
  void *v12;
  NetworkQualityConfiguration *v13;
  NSObject *v14;
  float v15;
  void (**saturationHandler)(void);
  id v17;
  void *v18;
  NSError *v19;
  NSError *error;
  uint64_t v21;
  const __CFString *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  double v28;
  __int16 v29;
  double v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (-[NetworkQualityConfiguration maxDownlinkData](self->super._nqConfig, "maxDownlinkData"))
  {
    currentBytesTransferred = self->super._currentBytesTransferred;
    if (currentBytesTransferred > -[NetworkQualityConfiguration maxDownlinkData](self->super._nqConfig, "maxDownlinkData"))
    {
      netqual_log_init();
      v4 = (void *)os_log_netqual;
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
      {
        v5 = self->super._currentBytesTransferred;
        nqConfig = self->super._nqConfig;
        v7 = v4;
        *(_DWORD *)buf = 136315906;
        v24 = "-[DownloadThroughputDelegate checkLimits]";
        v25 = 1024;
        v26 = 530;
        v27 = 2048;
        v28 = *(double *)&v5;
        v29 = 2048;
        v30 = COERCE_DOUBLE(-[NetworkQualityConfiguration maxDownlinkData](nqConfig, "maxDownlinkData"));
        _os_log_impl(&dword_20E622000, v7, OS_LOG_TYPE_DEFAULT, "%s:%u - Downloaded too many bytes: %ld max: %ld", buf, 0x26u);

      }
      if (!self->super._canceled)
      {
        v17 = objc_alloc(MEMORY[0x24BDD1540]);
        v21 = *MEMORY[0x24BDD0FC8];
        v22 = CFSTR("Datalimit exceeded");
        v8 = 1;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (NSError *)objc_msgSend(v17, "initWithDomain:code:userInfo:", CFSTR("NetworkQualityErrorDomain"), 1005, v18);
        error = self->super._error;
        self->super._error = v19;

        (*((void (**)(void))self->super._completionHandler + 2))();
        return v8;
      }
      return 1;
    }
  }
  -[SaturationDetection getAverage](self->super._saturation, "getAverage");
  if (self->super._exitCriteriaMet)
    return 0;
  v11 = v9;
  if (!-[NetworkQualityConfiguration maxDownlinkThroughput](self->super._nqConfig, "maxDownlinkThroughput")
    || -[NetworkQualityConfiguration maxDownlinkThroughput](self->super._nqConfig, "maxDownlinkThroughput") >= (uint64_t)v11)
  {
    return 0;
  }
  netqual_log_init();
  v12 = (void *)os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    v13 = self->super._nqConfig;
    v14 = v12;
    *(_DWORD *)buf = 136315906;
    v24 = "-[DownloadThroughputDelegate checkLimits]";
    v25 = 1024;
    v26 = 549;
    v27 = 2048;
    v28 = (double)(uint64_t)v11 * 0.000000953674316;
    v29 = 2048;
    v30 = (double)-[NetworkQualityConfiguration maxDownlinkThroughput](v13, "maxDownlinkThroughput") * 0.000000953674316;
    _os_log_impl(&dword_20E622000, v14, OS_LOG_TYPE_DEFAULT, "%s:%u - Downlink throughput exceeded: %.3f Mbps max: %.3f Mbps", buf, 0x26u);

  }
  -[SaturationDetection getAverage](self->super._saturation, "getAverage");
  -[DownloadThroughputDelegate updateResultsWithThroughput:confidence:](self, "updateResultsWithThroughput:confidence:", (uint64_t)v15, 2);
  v8 = 1;
  self->super._exitCriteriaMet = 1;
  if (!self->super._saturation_reached)
  {
    saturationHandler = (void (**)(void))self->super._saturationHandler;
    if (saturationHandler)
      saturationHandler[2]();
    return 1;
  }
  return v8;
}

- (unint64_t)minFlows
{
  return -[NetworkQualityConfiguration minDownloadFlows](self->super._nqConfig, "minDownloadFlows");
}

- (unint64_t)maxFlows
{
  return -[NetworkQualityConfiguration maxDownloadFlows](self->super._nqConfig, "maxDownloadFlows");
}

@end
