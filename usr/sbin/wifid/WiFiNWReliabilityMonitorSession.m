@implementation WiFiNWReliabilityMonitorSession

- (WiFiNWReliabilityMonitorSession)initWithNetworkRecord:(void *)a3 withMetrics:(unint64_t)a4 withMaxSamples:(unint64_t)a5 withMinSampleThresh:(int)a6
{
  WiFiNWReliabilityMonitorSession *v10;
  const void *v11;
  uint64_t v12;
  NSString *connectedBSSID;
  const void *v14;
  uint64_t v15;
  NSString *connectedSSID;
  void *v17;
  WiFiNWReliabilityMonitorDataStore *v18;
  WiFiNWReliabilityMonitorDataStore *rssiStore;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)WiFiNWReliabilityMonitorSession;
  v10 = -[WiFiNWReliabilityMonitorSession init](&v22, "init");
  if (!v10)
    goto LABEL_14;
  if (!a3)
  {
    v21 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s without networkRecord", "-[WiFiNWReliabilityMonitorSession initWithNetworkRecord:withMetrics:withMaxSamples:withMinSampleThresh:]");
    objc_autoreleasePoolPop(v21);
    goto LABEL_14;
  }
  v11 = sub_10002BE64((uint64_t)a3, CFSTR("BSSID"));
  v12 = objc_claimAutoreleasedReturnValue(v11);
  connectedBSSID = v10->_connectedBSSID;
  v10->_connectedBSSID = (NSString *)v12;

  v14 = sub_10002B088(a3);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  connectedSSID = v10->_connectedSSID;
  v10->_connectedSSID = (NSString *)v15;

  v17 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s session created for BSSID:%@ SSID:%@", "-[WiFiNWReliabilityMonitorSession initWithNetworkRecord:withMetrics:withMaxSamples:withMinSampleThresh:]", v10->_connectedBSSID, v10->_connectedSSID);
  objc_autoreleasePoolPop(v17);
  v10->_maxSamples = a5;
  if (!a5
    || (v10->_minSampleThresh = a6) == 0
    || (v10->_metrics = a4) == 0
    || (a4 & 1) != 0
    && (v18 = -[WiFiNWReliabilityMonitorDataStore initWithMetric:withMaxSamples:]([WiFiNWReliabilityMonitorDataStore alloc], "initWithMetric:withMaxSamples:", 1, v10->_maxSamples), rssiStore = v10->_rssiStore, v10->_rssiStore = v18, rssiStore, !v10->_rssiStore))
  {
LABEL_14:

    return 0;
  }
  return v10;
}

- (void)dealloc
{
  WiFiNWReliabilityMonitorDataStore *rssiStore;
  objc_super v4;

  rssiStore = self->_rssiStore;
  if (rssiStore)
  {
    self->_rssiStore = 0;

  }
  v4.receiver = self;
  v4.super_class = (Class)WiFiNWReliabilityMonitorSession;
  -[WiFiNWReliabilityMonitorSession dealloc](&v4, "dealloc");
}

- (void)ingestLQMUpdate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v12 = v4;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RSSI")));
    v6 = objc_msgSend(v5, "intValue");

    v7 = -[WiFiNWReliabilitDataStoreSampleType init:withTimestamp:]([WiFiNWReliabilitDataStoreSampleType alloc], "init:withTimestamp:", v6, objc_msgSend(v12, "objectForKey:", CFSTR("LQMTIMESTAMP")));
    -[WiFiNWReliabilityMonitorDataStore addSample:](self->_rssiStore, "addSample:", v7);
    v8 = objc_autoreleasePoolPush();
    v9 = (void *)qword_10026DD20;
    if (qword_10026DD20)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiNWReliabilityMonitorSession description](self, "description"));
      objc_msgSend(v9, "WFLog:message:", 3, "%s: Session:%@ received LQM update, RSSI:%d", "-[WiFiNWReliabilityMonitorSession ingestLQMUpdate:]", v10, v6);

    }
    objc_autoreleasePoolPop(v8);

  }
  else
  {
    v11 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s without argument!", "-[WiFiNWReliabilityMonitorSession ingestLQMUpdate:]");
    objc_autoreleasePoolPop(v11);
  }

}

- (BOOL)isSessionReliable:(int)a3
{
  BOOL v3;
  WiFiNWReliabilityMonitorDataStore *rssiStore;
  _QWORD v6[6];
  int v7;
  _QWORD v8[3];
  int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v3 = 1;
  v13 = 1;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v9 = 0;
  rssiStore = self->_rssiStore;
  if (rssiStore)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000337B4;
    v6[3] = &unk_10022E948;
    v6[4] = &v10;
    v6[5] = v8;
    v7 = a3;
    -[WiFiNWReliabilityMonitorDataStore getSamples:](rssiStore, "getSamples:", v6);
    v3 = *((_BYTE *)v11 + 24) != 0;
  }
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v10, 8);
  return v3;
}

- (unint64_t)getSampleCount:(unint64_t)a3
{
  void *v4;

  if (a3 == 1)
    return -[WiFiNWReliabilityMonitorDataStore getCount](self->_rssiStore, "getCount");
  v4 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s Unsupported metric: %lu", "-[WiFiNWReliabilityMonitorSession getSampleCount:]", a3);
  objc_autoreleasePoolPop(v4);
  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiNWReliabilityMonitorSession connectedBSSID](self, "connectedBSSID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiNWReliabilityMonitorSession connectedSSID](self, "connectedSSID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[BSSID:%@ SSID:%@]"), v3, v4));

  return v5;
}

- (unint64_t)metrics
{
  return self->_metrics;
}

- (unint64_t)maxSamples
{
  return self->_maxSamples;
}

- (int)minSampleThresh
{
  return self->_minSampleThresh;
}

- (NSString)connectedBSSID
{
  return self->_connectedBSSID;
}

- (void)setConnectedBSSID:(id)a3
{
  objc_storeStrong((id *)&self->_connectedBSSID, a3);
}

- (NSString)connectedSSID
{
  return self->_connectedSSID;
}

- (void)setConnectedSSID:(id)a3
{
  objc_storeStrong((id *)&self->_connectedSSID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectedSSID, 0);
  objc_storeStrong((id *)&self->_connectedBSSID, 0);
  objc_storeStrong((id *)&self->_rssiStore, 0);
}

@end
