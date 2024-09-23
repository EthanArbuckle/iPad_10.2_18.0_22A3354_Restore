@implementation UploadThroughputDelegate

- (id)createTaskWithRequest:(id)a3 session:(id)a4
{
  return (id)objc_msgSend(a4, "uploadTaskWithStreamedRequest:", a3);
}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  void (**v6)(id, UploadDataStream *);
  UploadDataStream *v7;

  v6 = (void (**)(id, UploadDataStream *))a5;
  v7 = -[UploadDataStream initWithLength:andThroughputDelegate:]([UploadDataStream alloc], "initWithLength:andThroughputDelegate:", 0x400000000, self);
  -[NSMutableArray addObject:](self->super._uploadStream, "addObject:", v7);
  v6[2](v6, v7);

}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v10;
  id v11;
  NSDate *v12;
  NSDate *lastUpdate;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  if (!*(_WORD *)&self->super._canceled)
  {
    if (-[NSMutableArray indexOfObject:](self->super._probeSessions, "indexOfObject:", v10) == 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableArray addObject:](self->super._probeSessions, "addObject:", v10);
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v12 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastUpdate = self->super._lastUpdate;
    self->super._lastUpdate = v12;

    -[ThroughputDelegate addNewThroughputMeasurement:](self, "addNewThroughputMeasurement:", a5);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v14 = self->super._uploadStream;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "signalProgress", (_QWORD)v19);
        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v16);
    }

  }
}

- (id)amendRequest:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lld"), 0x400000000);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forHTTPHeaderField:", v4, CFSTR("Content-Length"));

  return v3;
}

- (void)updateResultsWithFlowCount
{
  id v3;

  if (!self->super._canceled)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[NSMutableArray count](self->super._tasks, "count"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[NetworkQualityResult setUplinkFlows:](self->super._results, "setUplinkFlows:", v3);

  }
}

- (void)updateResultsWithByteCount
{
  id v3;

  if (!self->super._canceled)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->super._currentBytesTransferred);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[NetworkQualityResult setUplinkBytesTransferred:](self->super._results, "setUplinkBytesTransferred:", v3);

  }
}

- (void)updateResultsWithThroughput:(int64_t)a3 confidence:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  if (!self->super._canceled)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NetworkQualityResult uplinkCapacity](self->super._results, "uplinkCapacity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:", v6);

    -[NetworkQualityResult uplinkCapacity](self->super._results, "uplinkCapacity");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateConfidence:", a4);

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
  if (-[NetworkQualityConfiguration maxUplinkData](self->super._nqConfig, "maxUplinkData"))
  {
    currentBytesTransferred = self->super._currentBytesTransferred;
    if (currentBytesTransferred > -[NetworkQualityConfiguration maxUplinkData](self->super._nqConfig, "maxUplinkData"))
    {
      netqual_log_init();
      v4 = (void *)os_log_netqual;
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
      {
        v5 = self->super._currentBytesTransferred;
        nqConfig = self->super._nqConfig;
        v7 = v4;
        *(_DWORD *)buf = 136315906;
        v24 = "-[UploadThroughputDelegate checkLimits]";
        v25 = 1024;
        v26 = 655;
        v27 = 2048;
        v28 = *(double *)&v5;
        v29 = 2048;
        v30 = COERCE_DOUBLE(-[NetworkQualityConfiguration maxUplinkData](nqConfig, "maxUplinkData"));
        _os_log_impl(&dword_20E622000, v7, OS_LOG_TYPE_DEFAULT, "%s:%u - Uploaded too many bytes: %ld max: %ld", buf, 0x26u);

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
  if (!-[NetworkQualityConfiguration maxUplinkThroughput](self->super._nqConfig, "maxUplinkThroughput")
    || -[NetworkQualityConfiguration maxUplinkThroughput](self->super._nqConfig, "maxUplinkThroughput") >= (uint64_t)v11)
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
    v24 = "-[UploadThroughputDelegate checkLimits]";
    v25 = 1024;
    v26 = 673;
    v27 = 2048;
    v28 = (double)(uint64_t)v11 * 0.000000953674316;
    v29 = 2048;
    v30 = (double)-[NetworkQualityConfiguration maxUplinkThroughput](v13, "maxUplinkThroughput") * 0.000000953674316;
    _os_log_impl(&dword_20E622000, v14, OS_LOG_TYPE_DEFAULT, "%s:%u - Uplink throughput exceeded: %.3f Mbps max: %.3f Mbps", buf, 0x26u);

  }
  -[SaturationDetection getAverage](self->super._saturation, "getAverage");
  -[UploadThroughputDelegate updateResultsWithThroughput:confidence:](self, "updateResultsWithThroughput:confidence:", (uint64_t)v15, 2);
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
  return -[NetworkQualityConfiguration minUploadFlows](self->super._nqConfig, "minUploadFlows");
}

- (unint64_t)maxFlows
{
  return -[NetworkQualityConfiguration maxUploadFlows](self->super._nqConfig, "maxUploadFlows");
}

@end
