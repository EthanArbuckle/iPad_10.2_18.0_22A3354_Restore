@implementation MSDSessionTimingData

- (MSDSessionTimingData)initWithData:(id)a3
{
  return -[MSDSessionTimingData initWithData:forServerType:](self, "initWithData:forServerType:", a3, 0);
}

- (MSDSessionTimingData)initWithData:(id)a3 forServerType:(id)a4
{
  id v6;
  id v7;
  MSDSessionTimingData *v8;
  MSDSessionTimingData *v9;
  id v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MSDSessionTimingData;
  v8 = -[MSDSessionTimingData init](&v12, "init");
  v9 = v8;
  if (v8)
  {
    -[MSDSessionTimingData setAvgRTT:](v8, "setAvgRTT:", -1);
    -[MSDSessionTimingData setDownloadSpeed:](v9, "setDownloadSpeed:", -1);
    -[MSDSessionTimingData setPacketLoss:](v9, "setPacketLoss:", -1);
    -[MSDSessionTimingData setRetryCount:](v9, "setRetryCount:", -1);
    v10 = objc_alloc_init((Class)NSMutableDictionary);
    -[MSDSessionTimingData setRawTimingData:](v9, "setRawTimingData:", v10);

    -[MSDSessionTimingData extractTimingData:forServerType:](v9, "extractTimingData:forServerType:", v6, v7);
  }

  return v9;
}

- (void)extractTimingData:(id)a3 forServerType:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;

  v40 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKey:", CFSTR("_kCFNTimingDataConnectionStopTimeCounts")));
  -[MSDSessionTimingData setServerType:](self, "setServerType:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("_kCFNTimingDataNStatAvgRTT")));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("_kCFNTimingDataNStatAvgRTT")));
    -[MSDSessionTimingData setAvgRTT:](self, "setAvgRTT:", objc_msgSend(v9, "integerValue"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTimingData rawTimingData](self, "rawTimingData"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[MSDSessionTimingData avgRTT](self, "avgRTT")));
    objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("_kCFNTimingDataNStatAvgRTT"));

  }
  -[MSDSessionTimingData setRetransmitBytes:](self, "setRetransmitBytes:", -[MSDSessionTimingData getCountStat:inTimingData:](self, "getCountStat:inTimingData:", CFSTR("_kCFNTimingDataNStatTXRetransmit"), v40));
  -[MSDSessionTimingData setTotalBytesSent:](self, "setTotalBytesSent:", -[MSDSessionTimingData getCountStat:inTimingData:](self, "getCountStat:inTimingData:", CFSTR("_kCFNTimingDataNStatTXBytes"), v40));
  if ((-[MSDSessionTimingData retransmitBytes](self, "retransmitBytes") & 0x8000000000000000) == 0
    && -[MSDSessionTimingData totalBytesSent](self, "totalBytesSent") >= 1)
  {
    -[MSDSessionTimingData setPacketLoss:](self, "setPacketLoss:", 100* -[MSDSessionTimingData retransmitBytes](self, "retransmitBytes")/ -[MSDSessionTimingData totalBytesSent](self, "totalBytesSent"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTimingData rawTimingData](self, "rawTimingData"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[MSDSessionTimingData retransmitBytes](self, "retransmitBytes")));
    objc_msgSend(v12, "setObject:forKey:", v13, CFSTR("_kCFNTimingDataNStatTXRetransmit"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTimingData rawTimingData](self, "rawTimingData"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[MSDSessionTimingData totalBytesSent](self, "totalBytesSent")));
    objc_msgSend(v14, "setObject:forKey:", v15, CFSTR("_kCFNTimingDataNStatTXBytes"));

  }
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKey:", CFSTR("_kCFNTimingDataResponseEnd")));
  v17 = -1.0;
  if (v16)
  {
    v18 = (void *)v16;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKey:", CFSTR("_kCFNTimingDataResponseStart")));

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKey:", CFSTR("_kCFNTimingDataResponseEnd")));
      objc_msgSend(v20, "doubleValue");
      -[MSDSessionTimingData setResponseEnd:](self, "setResponseEnd:");

      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKey:", CFSTR("_kCFNTimingDataResponseStart")));
      objc_msgSend(v21, "doubleValue");
      -[MSDSessionTimingData setResponseStart:](self, "setResponseStart:");

      -[MSDSessionTimingData responseEnd](self, "responseEnd");
      v23 = v22;
      -[MSDSessionTimingData responseStart](self, "responseStart");
      v17 = v23 - v24;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTimingData rawTimingData](self, "rawTimingData"));
      -[MSDSessionTimingData responseEnd](self, "responseEnd");
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      objc_msgSend(v25, "setObject:forKey:", v26, CFSTR("_kCFNTimingDataResponseEnd"));

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTimingData rawTimingData](self, "rawTimingData"));
      -[MSDSessionTimingData responseStart](self, "responseStart");
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      objc_msgSend(v27, "setObject:forKey:", v28, CFSTR("_kCFNTimingDataResponseStart"));

    }
  }
  v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKey:", CFSTR("_kCFNTimingDataRequestEnd")));
  if (v29)
  {
    v30 = (void *)v29;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKey:", CFSTR("_kCFNTimingDataRequestStart")));

    if (v31)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKey:", CFSTR("_kCFNTimingDataRequestEnd")));
      objc_msgSend(v32, "doubleValue");
      -[MSDSessionTimingData setRequestEnd:](self, "setRequestEnd:");

      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKey:", CFSTR("_kCFNTimingDataRequestStart")));
      objc_msgSend(v33, "doubleValue");
      -[MSDSessionTimingData setRequestStart:](self, "setRequestStart:");

      v34 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTimingData rawTimingData](self, "rawTimingData"));
      -[MSDSessionTimingData requestEnd](self, "requestEnd");
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      objc_msgSend(v34, "setObject:forKey:", v35, CFSTR("_kCFNTimingDataRequestEnd"));

      v36 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTimingData rawTimingData](self, "rawTimingData"));
      -[MSDSessionTimingData requestStart](self, "requestStart");
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      objc_msgSend(v36, "setObject:forKey:", v37, CFSTR("_kCFNTimingDataRequestStart"));

    }
  }
  -[MSDSessionTimingData setTotalBytesReceived:](self, "setTotalBytesReceived:", -[MSDSessionTimingData getCountStat:inTimingData:](self, "getCountStat:inTimingData:", CFSTR("_kCFNTimingDataNStatRXBytes"), v40));
  if ((-[MSDSessionTimingData totalBytesReceived](self, "totalBytesReceived") & 0x8000000000000000) == 0)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTimingData rawTimingData](self, "rawTimingData"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[MSDSessionTimingData totalBytesReceived](self, "totalBytesReceived")));
    objc_msgSend(v38, "setObject:forKey:", v39, CFSTR("_kCFNTimingDataNStatRXBytes"));

    if (v17 > 10.0)
      -[MSDSessionTimingData setDownloadSpeed:](self, "setDownloadSpeed:", (uint64_t)((double)(8 * -[MSDSessionTimingData totalBytesReceived](self, "totalBytesReceived")) / v17));
  }

}

- (void)uploadTimingData
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  if (-[MSDSessionTimingData avgRTT](self, "avgRTT") != -1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalyticsEventHandler sharedInstance](MSDAnalyticsEventHandler, "sharedInstance"));
    v4 = -[MSDSessionTimingData avgRTT](self, "avgRTT");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTimingData serverType](self, "serverType"));
    objc_msgSend(v3, "sendNetworkAverageRTTEvent:forServerType:", v4, v5);

  }
  if (-[MSDSessionTimingData packetLoss](self, "packetLoss") != -1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalyticsEventHandler sharedInstance](MSDAnalyticsEventHandler, "sharedInstance"));
    v7 = -[MSDSessionTimingData packetLoss](self, "packetLoss");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTimingData serverType](self, "serverType"));
    objc_msgSend(v6, "sendNetworkPacketLossEvent:forServerType:", v7, v8);

  }
  if (-[MSDSessionTimingData downloadSpeed](self, "downloadSpeed") != -1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAnalyticsEventHandler sharedInstance](MSDAnalyticsEventHandler, "sharedInstance"));
    v10 = -[MSDSessionTimingData downloadSpeed](self, "downloadSpeed");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTimingData serverType](self, "serverType"));
    objc_msgSend(v9, "sendNetworkAverageBandwidthEvent:forServerType:", v10, v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTimingData rawTimingData](self, "rawTimingData"));
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    v16 = (id)objc_claimAutoreleasedReturnValue(+[MSDAnalyticsEventHandler sharedInstance](MSDAnalyticsEventHandler, "sharedInstance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTimingData rawTimingData](self, "rawTimingData"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTimingData serverType](self, "serverType"));
    objc_msgSend(v16, "sendNetworkRawDataEvent:forServerType:", v14, v15);

  }
}

- (int64_t)getCountStat:(id)a3 inTimingData:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _BYTE *v13;
  void *v14;
  _BYTE *v15;
  int64_t v16;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("_kCFNTimingDataConnectionStopTimeCounts")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("_kCFNTimingDataConnectionStartTimeCounts")));

  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v5));
  if (v9
    && (v10 = (void *)v9,
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v5)),
        v11,
        v10,
        v11))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v5));
    v13 = objc_msgSend(v12, "integerValue");

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v5));
    v15 = objc_msgSend(v14, "integerValue");

    v16 = v15 - v13;
  }
  else
  {
    v16 = -1;
  }

  return v16;
}

- (int64_t)avgRTT
{
  return self->_avgRTT;
}

- (void)setAvgRTT:(int64_t)a3
{
  self->_avgRTT = a3;
}

- (int64_t)downloadSpeed
{
  return self->_downloadSpeed;
}

- (void)setDownloadSpeed:(int64_t)a3
{
  self->_downloadSpeed = a3;
}

- (int64_t)packetLoss
{
  return self->_packetLoss;
}

- (void)setPacketLoss:(int64_t)a3
{
  self->_packetLoss = a3;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (int64_t)totalBytesReceived
{
  return self->_totalBytesReceived;
}

- (void)setTotalBytesReceived:(int64_t)a3
{
  self->_totalBytesReceived = a3;
}

- (int64_t)totalBytesSent
{
  return self->_totalBytesSent;
}

- (void)setTotalBytesSent:(int64_t)a3
{
  self->_totalBytesSent = a3;
}

- (int64_t)retransmitBytes
{
  return self->_retransmitBytes;
}

- (void)setRetransmitBytes:(int64_t)a3
{
  self->_retransmitBytes = a3;
}

- (double)responseStart
{
  return self->_responseStart;
}

- (void)setResponseStart:(double)a3
{
  self->_responseStart = a3;
}

- (double)responseEnd
{
  return self->_responseEnd;
}

- (void)setResponseEnd:(double)a3
{
  self->_responseEnd = a3;
}

- (double)requestStart
{
  return self->_requestStart;
}

- (void)setRequestStart:(double)a3
{
  self->_requestStart = a3;
}

- (double)requestEnd
{
  return self->_requestEnd;
}

- (void)setRequestEnd:(double)a3
{
  self->_requestEnd = a3;
}

- (NSString)serverType
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setServerType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSMutableDictionary)rawTimingData
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setRawTimingData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawTimingData, 0);
  objc_storeStrong((id *)&self->_serverType, 0);
}

@end
