@implementation WRM_IdsMetricsController

- (WRM_IdsMetricsController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WRM_IdsMetricsController;
  return -[WCM_Controller init](&v3, "init");
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WRM_IdsMetricsController;
  -[WCM_Controller dealloc](&v2, "dealloc");
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("IDSMetrics iRAT Manager Controller"));
}

+ (id)WRM_IdsMetricsControllerSingleton
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100063710;
  block[3] = &unk_1002019E8;
  block[4] = a1;
  if (qword_100271168 != -1)
    dispatch_once(&qword_100271168, block);
  return (id)qword_100271160;
}

- (void)resetIDSMetrics
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("Resetting IDS  metrics report"));
  -[WRM_IdsMetricsController setMStreamingReportBytesSent:](self, "setMStreamingReportBytesSent:", 0);
  -[WRM_IdsMetricsController setMStreamingReportPacketsSent:](self, "setMStreamingReportPacketsSent:", 0);
  -[WRM_IdsMetricsController setMStreamingReportBytesReceived:](self, "setMStreamingReportBytesReceived:", 0);
  -[WRM_IdsMetricsController setMStreamingReportPacketsReceived:](self, "setMStreamingReportPacketsReceived:", 0);
  -[WRM_IdsMetricsController setMLocalDeliveryMessageSentMessageSize:](self, "setMLocalDeliveryMessageSentMessageSize:", 0);
  -[WRM_IdsMetricsController setMLocalDeliveryMessageDeliveredMessageSize:](self, "setMLocalDeliveryMessageDeliveredMessageSize:", 0);
  -[WRM_IdsMetricsController setMLocalDeliveryMessageDeliveredRTT:](self, "setMLocalDeliveryMessageDeliveredRTT:", 0);
  -[WRM_IdsMetricsController setMLocalDeliveryMessageReceivedMessageSize:](self, "setMLocalDeliveryMessageReceivedMessageSize:", 0);
  -[WRM_IdsMetricsController setMLocalDeliveryMessageSent:](self, "setMLocalDeliveryMessageSent:", 0);
  -[WRM_IdsMetricsController setMLocalDeliveryMessageDelivered:](self, "setMLocalDeliveryMessageDelivered:", 0);
  -[WRM_IdsMetricsController setMLocalDeliveryMessageDeliveredDeliveryError:](self, "setMLocalDeliveryMessageDeliveredDeliveryError:", 0);
  -[WRM_IdsMetricsController setMLocalDeliveryMessageReceived:](self, "setMLocalDeliveryMessageReceived:", 0);
  -[WRM_IdsMetricsController setMLocalDeliveryMessageDeliveredMessageSizeMovAvg:](self, "setMLocalDeliveryMessageDeliveredMessageSizeMovAvg:", 0.0);
  -[WRM_IdsMetricsController setMLocalDeliveryMessageDeliveredRTTMovAvg:](self, "setMLocalDeliveryMessageDeliveredRTTMovAvg:", 0.0);
  -[WRM_IdsMetricsController setMLocalDeliveryMessageReceivedMessageSizeMovAvg:](self, "setMLocalDeliveryMessageReceivedMessageSizeMovAvg:", 0.0);
  -[WRM_IdsMetricsController setMLocalDeliveryMessageSentMovAvg:](self, "setMLocalDeliveryMessageSentMovAvg:", 0.0);
  -[WRM_IdsMetricsController setMLocalDeliveryMessageDeliveredMovAvg:](self, "setMLocalDeliveryMessageDeliveredMovAvg:", 0.0);
  -[WRM_IdsMetricsController setMLocalDeliveryMessageDeliveredDeliveryErrorMovAvg:](self, "setMLocalDeliveryMessageDeliveredDeliveryErrorMovAvg:", 0.0);
  -[WRM_IdsMetricsController setMLocalDeliveryMessageReceivedMovAvg:](self, "setMLocalDeliveryMessageReceivedMovAvg:", 0.0);
  -[WRM_IdsMetricsController setMLocalDeliveryCumulativeMessageSent:](self, "setMLocalDeliveryCumulativeMessageSent:", 0);
  -[WRM_IdsMetricsController setMLocalDeliveryCumulativeMessageDelivered:](self, "setMLocalDeliveryCumulativeMessageDelivered:", 0);
  -[WRM_IdsMetricsController setMMetricsConsiderationPeriod:](self, "setMMetricsConsiderationPeriod:", 0);
}

- (void)configureIDSMetricsReporting
{
  xpc_object_t v3;
  void *v4;
  id v5;
  void *v6;
  const __CFString *v7;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("Configuring IDS  metrics report"));
  -[WRM_IdsMetricsController setMReportDuration:](self, "setMReportDuration:", objc_msgSend(objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getiRATConfigController"), "idsPeriodicReportInterval"));
  v3 = xpc_dictionary_create(0, 0, 0);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(+[WRM_IDSLinkEvalManager WRM_IDSLinkEvalManagerSingleton](WRM_IDSLinkEvalManager, "WRM_IDSLinkEvalManagerSingleton"), "getiRATClientFromList:", 4);
    if (v5)
    {
      v6 = v5;
      xpc_dictionary_set_uint64(v4, "PeriodRptInval", -[WRM_IdsMetricsController mReportDuration](self, "mReportDuration"));
      objc_msgSend(v6, "sendMessage:withArgs:", 1103, v4);
      v7 = CFSTR("Sending IDS  metrics Configure request");
    }
    else
    {
      v7 = CFSTR("Not sending IDS  metrics Configure request, IDS not registered");
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, v7);
    xpc_release(v4);
  }
}

- (void)handlePeriodicIDSMetrics:(id)a3
{
  xpc_object_t value;
  double v5;
  double v6;
  double v7;
  uint64_t uint64;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;

  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Periodic IDS metrics received from IDS Controller "));
  if (value)
  {
    if (xpc_dictionary_get_value(value, "StrmBytesSnt"))
      -[WRM_IdsMetricsController setMStreamingReportBytesSent:](self, "setMStreamingReportBytesSent:", xpc_dictionary_get_uint64(value, "StrmBytesSnt"));
    if (xpc_dictionary_get_value(value, "StrmPktsSnt"))
      -[WRM_IdsMetricsController setMStreamingReportPacketsSent:](self, "setMStreamingReportPacketsSent:", xpc_dictionary_get_uint64(value, "StrmPktsSnt"));
    if (xpc_dictionary_get_value(value, "StrmBytesRcvd"))
      -[WRM_IdsMetricsController setMStreamingReportBytesReceived:](self, "setMStreamingReportBytesReceived:", xpc_dictionary_get_uint64(value, "StrmBytesRcvd"));
    if (xpc_dictionary_get_value(value, "StrmPktRcvd"))
      -[WRM_IdsMetricsController setMStreamingReportPacketsReceived:](self, "setMStreamingReportPacketsReceived:", xpc_dictionary_get_uint64(value, "StrmPktRcvd"));
    if (xpc_dictionary_get_value(value, "LocMsgSntSz"))
      -[WRM_IdsMetricsController setMLocalDeliveryMessageSentMessageSize:](self, "setMLocalDeliveryMessageSentMessageSize:", xpc_dictionary_get_uint64(value, "LocMsgSntSz"));
    if (xpc_dictionary_get_value(value, "DeliveredMsgSz"))
    {
      -[WRM_IdsMetricsController setMLocalDeliveryMessageDeliveredMessageSize:](self, "setMLocalDeliveryMessageDeliveredMessageSize:", xpc_dictionary_get_uint64(value, "DeliveredMsgSz"));
      -[WRM_IdsMetricsController mLocalDeliveryMessageDeliveredMessageSizeMovAvg](self, "mLocalDeliveryMessageDeliveredMessageSizeMovAvg");
      -[WRM_IdsMetricsController setMLocalDeliveryMessageDeliveredMessageSizeMovAvg:](self, "setMLocalDeliveryMessageDeliveredMessageSizeMovAvg:", ((double)-[WRM_IdsMetricsController mLocalDeliveryMessageDeliveredMessageSize](self, "mLocalDeliveryMessageDeliveredMessageSize")+ v5 * 11.0)/ 12.0);
    }
    if (xpc_dictionary_get_value(value, "LocMsgDeliveredRTT"))
    {
      -[WRM_IdsMetricsController setMLocalDeliveryMessageDeliveredRTT:](self, "setMLocalDeliveryMessageDeliveredRTT:", xpc_dictionary_get_uint64(value, "LocMsgDeliveredRTT"));
      -[WRM_IdsMetricsController mLocalDeliveryMessageDeliveredRTTMovAvg](self, "mLocalDeliveryMessageDeliveredRTTMovAvg");
      -[WRM_IdsMetricsController setMLocalDeliveryMessageDeliveredRTTMovAvg:](self, "setMLocalDeliveryMessageDeliveredRTTMovAvg:", ((double)-[WRM_IdsMetricsController mLocalDeliveryMessageDeliveredRTT](self, "mLocalDeliveryMessageDeliveredRTT")+ v6 * 11.0)/ 12.0);
    }
    if (xpc_dictionary_get_value(value, "LocMsgRcvdMgSz"))
    {
      -[WRM_IdsMetricsController setMLocalDeliveryMessageReceivedMessageSize:](self, "setMLocalDeliveryMessageReceivedMessageSize:", xpc_dictionary_get_uint64(value, "LocMsgRcvdMgSz"));
      -[WRM_IdsMetricsController mLocalDeliveryMessageReceivedMessageSizeMovAvg](self, "mLocalDeliveryMessageReceivedMessageSizeMovAvg");
      -[WRM_IdsMetricsController setMLocalDeliveryMessageReceivedMessageSizeMovAvg:](self, "setMLocalDeliveryMessageReceivedMessageSizeMovAvg:", ((double)-[WRM_IdsMetricsController mLocalDeliveryMessageReceivedMessageSize](self, "mLocalDeliveryMessageReceivedMessageSize")+ v7 * 11.0)/ 12.0);
    }
    if (xpc_dictionary_get_value(value, "LocMsgSnt"))
    {
      uint64 = xpc_dictionary_get_uint64(value, "LocMsgSnt");
      -[WRM_IdsMetricsController setMLocalDeliveryMessageSent:](self, "setMLocalDeliveryMessageSent:", uint64);
      -[WRM_IdsMetricsController setMLocalDeliveryCumulativeMessageSent:](self, "setMLocalDeliveryCumulativeMessageSent:", (char *)-[WRM_IdsMetricsController mLocalDeliveryCumulativeMessageSent](self, "mLocalDeliveryCumulativeMessageSent")+ uint64);
      -[WRM_IdsMetricsController mLocalDeliveryMessageSentMovAvg](self, "mLocalDeliveryMessageSentMovAvg");
      -[WRM_IdsMetricsController setMLocalDeliveryMessageSentMovAvg:](self, "setMLocalDeliveryMessageSentMovAvg:", ((double)-[WRM_IdsMetricsController mLocalDeliveryMessageSent](self, "mLocalDeliveryMessageSent") + v9 * 11.0)/ 12.0);
      -[WRM_IdsMetricsController setMMetricsConsiderationPeriod:](self, "setMMetricsConsiderationPeriod:", -[WRM_IdsMetricsController mMetricsConsiderationPeriod](self, "mMetricsConsiderationPeriod") + 1);
      -[WRM_IdsMetricsController setMMetricsConsiderationPeriod:](self, "setMMetricsConsiderationPeriod:", (-[WRM_IdsMetricsController mMetricsConsiderationPeriod](self, "mMetricsConsiderationPeriod") % 12));
      if (!-[WRM_IdsMetricsController mMetricsConsiderationPeriod](self, "mMetricsConsiderationPeriod"))
        -[WRM_IdsMetricsController resetIDSMetrics](self, "resetIDSMetrics");
    }
    if (xpc_dictionary_get_value(value, "LocMsgDelivered"))
    {
      v10 = xpc_dictionary_get_uint64(value, "LocMsgDelivered");
      -[WRM_IdsMetricsController setMLocalDeliveryMessageDelivered:](self, "setMLocalDeliveryMessageDelivered:", v10);
      -[WRM_IdsMetricsController setMLocalDeliveryCumulativeMessageDelivered:](self, "setMLocalDeliveryCumulativeMessageDelivered:", (char *)-[WRM_IdsMetricsController mLocalDeliveryCumulativeMessageDelivered](self, "mLocalDeliveryCumulativeMessageDelivered")+ v10);
      -[WRM_IdsMetricsController mLocalDeliveryMessageDeliveredMovAvg](self, "mLocalDeliveryMessageDeliveredMovAvg");
      -[WRM_IdsMetricsController setMLocalDeliveryMessageDeliveredMovAvg:](self, "setMLocalDeliveryMessageDeliveredMovAvg:", ((double)-[WRM_IdsMetricsController mLocalDeliveryMessageDelivered](self, "mLocalDeliveryMessageDelivered")+ v11 * 11.0)/ 12.0);
    }
    if (xpc_dictionary_get_value(value, "LocMsgDeliveryEr"))
    {
      -[WRM_IdsMetricsController setMLocalDeliveryMessageDeliveredDeliveryError:](self, "setMLocalDeliveryMessageDeliveredDeliveryError:", xpc_dictionary_get_uint64(value, "LocMsgDeliveryEr"));
      -[WRM_IdsMetricsController mLocalDeliveryMessageDeliveredDeliveryErrorMovAvg](self, "mLocalDeliveryMessageDeliveredDeliveryErrorMovAvg");
      -[WRM_IdsMetricsController setMLocalDeliveryMessageDeliveredDeliveryErrorMovAvg:](self, "setMLocalDeliveryMessageDeliveredDeliveryErrorMovAvg:", ((double)-[WRM_IdsMetricsController mLocalDeliveryMessageDeliveredDeliveryError](self, "mLocalDeliveryMessageDeliveredDeliveryError")+ v12 * 11.0)/ 12.0);
    }
    if (xpc_dictionary_get_value(value, "LocMsgRcvd"))
    {
      -[WRM_IdsMetricsController setMLocalDeliveryMessageReceived:](self, "setMLocalDeliveryMessageReceived:", xpc_dictionary_get_uint64(value, "LocMsgRcvd"));
      -[WRM_IdsMetricsController mLocalDeliveryMessageReceivedMovAvg](self, "mLocalDeliveryMessageReceivedMovAvg");
      -[WRM_IdsMetricsController setMLocalDeliveryMessageReceivedMovAvg:](self, "setMLocalDeliveryMessageReceivedMovAvg:", ((double)-[WRM_IdsMetricsController mLocalDeliveryMessageReceived](self, "mLocalDeliveryMessageReceived")+ v13 * 11.0)/ 12.0);
    }
  }
}

- (double)evaluateDLThroughput
{
  unint64_t v3;
  unint64_t v4;
  double v5;

  v3 = -[WRM_IdsMetricsController mStreamingReportBytesReceived](self, "mStreamingReportBytesReceived");
  v4 = -[WRM_IdsMetricsController mLocalDeliveryMessageReceived](self, "mLocalDeliveryMessageReceived");
  v5 = (double)(v3
              + -[WRM_IdsMetricsController mLocalDeliveryMessageReceivedMessageSize](self, "mLocalDeliveryMessageReceivedMessageSize")* v4)* 8.0;
  return v5 / ((double)-[WRM_IdsMetricsController mReportDuration](self, "mReportDuration") + 0.000001);
}

- (double)evaluateULThroughput
{
  unint64_t v3;
  unint64_t v4;
  double v5;

  v3 = -[WRM_IdsMetricsController mStreamingReportBytesSent](self, "mStreamingReportBytesSent");
  v4 = -[WRM_IdsMetricsController mLocalDeliveryMessageDelivered](self, "mLocalDeliveryMessageDelivered");
  v5 = (double)(v3
              + -[WRM_IdsMetricsController mLocalDeliveryMessageDeliveredMessageSize](self, "mLocalDeliveryMessageDeliveredMessageSize")* v4)* 8.0;
  return v5 / ((double)-[WRM_IdsMetricsController mReportDuration](self, "mReportDuration") + 0.000001);
}

- (int)getRTT
{
  return -[WRM_IdsMetricsController mLocalDeliveryMessageDeliveredRTT](self, "mLocalDeliveryMessageDeliveredRTT");
}

- (int)getAvgRxPDUSize
{
  return -[WRM_IdsMetricsController mLocalDeliveryMessageReceivedMessageSize](self, "mLocalDeliveryMessageReceivedMessageSize");
}

- (int)getAvgTxPDUSize
{
  return -[WRM_IdsMetricsController mLocalDeliveryMessageDeliveredMessageSize](self, "mLocalDeliveryMessageDeliveredMessageSize");
}

- (double)getTxPer
{
  double v3;
  double v4;

  v3 = (double)-[WRM_IdsMetricsController mLocalDeliveryMessageDeliveredDeliveryError](self, "mLocalDeliveryMessageDeliveredDeliveryError");
  v4 = (double)-[WRM_IdsMetricsController mLocalDeliveryMessageDelivered](self, "mLocalDeliveryMessageDelivered");
  return v3
       / (v4
        + (double)-[WRM_IdsMetricsController mLocalDeliveryMessageDeliveredDeliveryError](self, "mLocalDeliveryMessageDeliveredDeliveryError")+ 0.000001);
}

- (BOOL)getTxPerValid
{
  unint64_t v3;

  v3 = -[WRM_IdsMetricsController mLocalDeliveryMessageDelivered](self, "mLocalDeliveryMessageDelivered");
  return -[WRM_IdsMetricsController mLocalDeliveryMessageDeliveredDeliveryError](self, "mLocalDeliveryMessageDeliveredDeliveryError")+ v3 > 0x22;
}

- (int)getRTTMovAvg
{
  double v2;

  -[WRM_IdsMetricsController mLocalDeliveryMessageDeliveredRTTMovAvg](self, "mLocalDeliveryMessageDeliveredRTTMovAvg");
  return (int)v2;
}

- (int)getAvgRxPDUSizeMovAvg
{
  double v2;

  -[WRM_IdsMetricsController mLocalDeliveryMessageReceivedMessageSizeMovAvg](self, "mLocalDeliveryMessageReceivedMessageSizeMovAvg");
  return (int)v2;
}

- (int)getAvgTxPDUSizeMovAvg
{
  double v2;

  -[WRM_IdsMetricsController mLocalDeliveryMessageDeliveredMessageSizeMovAvg](self, "mLocalDeliveryMessageDeliveredMessageSizeMovAvg");
  return (int)v2;
}

- (double)getTxPerMovAvg
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[WRM_IdsMetricsController mLocalDeliveryMessageDeliveredDeliveryErrorMovAvg](self, "mLocalDeliveryMessageDeliveredDeliveryErrorMovAvg");
  v4 = v3;
  -[WRM_IdsMetricsController mLocalDeliveryMessageDeliveredMovAvg](self, "mLocalDeliveryMessageDeliveredMovAvg");
  v6 = v5;
  -[WRM_IdsMetricsController mLocalDeliveryMessageDeliveredDeliveryErrorMovAvg](self, "mLocalDeliveryMessageDeliveredDeliveryErrorMovAvg");
  return v4 / (v6 + v7 + 0.000001);
}

- (BOOL)getTxPerMovAvgValid
{
  unint64_t v3;

  v3 = -[WRM_IdsMetricsController mLocalDeliveryCumulativeMessageSent](self, "mLocalDeliveryCumulativeMessageSent");
  return -[WRM_IdsMetricsController mLocalDeliveryCumulativeMessageDelivered](self, "mLocalDeliveryCumulativeMessageDelivered")+ v3 > 0x22;
}

- (double)getAnticipiatedTxPer
{
  double v3;
  double v4;
  double v5;

  v3 = (double)-[WRM_IdsMetricsController mLocalDeliveryCumulativeMessageSent](self, "mLocalDeliveryCumulativeMessageSent");
  v4 = v3
     - (double)-[WRM_IdsMetricsController mLocalDeliveryCumulativeMessageDelivered](self, "mLocalDeliveryCumulativeMessageDelivered");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("getAnticipiatedTxPer: Sent: %ld, Delivered: %ld, Pkt Loss: %.2f"), -[WRM_IdsMetricsController mLocalDeliveryCumulativeMessageSent](self, "mLocalDeliveryCumulativeMessageSent"), -[WRM_IdsMetricsController mLocalDeliveryCumulativeMessageDelivered](self, "mLocalDeliveryCumulativeMessageDelivered"), *(_QWORD *)&v4);
  v5 = 0.0;
  if (v4 > 0.0
    && -[WRM_IdsMetricsController mLocalDeliveryCumulativeMessageSent](self, "mLocalDeliveryCumulativeMessageSent"))
  {
    v5 = v4
       / ((double)-[WRM_IdsMetricsController mLocalDeliveryCumulativeMessageSent](self, "mLocalDeliveryCumulativeMessageSent")+ 0.000001);
  }
  if (v5 > 1.0 || v5 < 0.0)
  {
    -[WRM_IdsMetricsController setMLocalDeliveryCumulativeMessageSent:](self, "setMLocalDeliveryCumulativeMessageSent:", 0);
    -[WRM_IdsMetricsController setMLocalDeliveryCumulativeMessageDelivered:](self, "setMLocalDeliveryCumulativeMessageDelivered:", 0);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("getAnticipiatedTxPer diacard bad value"));
    return 0.0;
  }
  return v5;
}

- (BOOL)getAnticipiatedTxPerValid
{
  unint64_t v3;
  char *v4;

  v3 = -[WRM_IdsMetricsController mLocalDeliveryCumulativeMessageSent](self, "mLocalDeliveryCumulativeMessageSent");
  v4 = (char *)-[WRM_IdsMetricsController mLocalDeliveryCumulativeMessageDelivered](self, "mLocalDeliveryCumulativeMessageDelivered")+ v3;
  return (char *)-[WRM_IdsMetricsController mLocalDeliveryMessageDeliveredDeliveryError](self, "mLocalDeliveryMessageDeliveredDeliveryError")+ (unint64_t)v4 > (char *)0x45;
}

- (double)getTxPerAnticipatedMovAvg
{
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  -[WRM_IdsMetricsController mLocalDeliveryMessageSentMovAvg](self, "mLocalDeliveryMessageSentMovAvg");
  v4 = v3;
  -[WRM_IdsMetricsController mLocalDeliveryMessageDeliveredMovAvg](self, "mLocalDeliveryMessageDeliveredMovAvg");
  v6 = v4 - v5;
  -[WRM_IdsMetricsController mLocalDeliveryMessageSentMovAvg](self, "mLocalDeliveryMessageSentMovAvg");
  v8 = v7;
  -[WRM_IdsMetricsController mLocalDeliveryMessageDeliveredMovAvg](self, "mLocalDeliveryMessageDeliveredMovAvg");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("getTxPerAnticipatedMovAvg: Sent: %.2f, Delivered: %.2f, Pkt Loss: %.2f"), v8, v9, *(_QWORD *)&v6);
  v10 = 0.0;
  if (v6 > 0.0)
  {
    -[WRM_IdsMetricsController mLocalDeliveryMessageSentMovAvg](self, "mLocalDeliveryMessageSentMovAvg");
    if (v11 >= 1.0)
    {
      -[WRM_IdsMetricsController mLocalDeliveryMessageSentMovAvg](self, "mLocalDeliveryMessageSentMovAvg");
      v10 = v6 / (v12 + 0.000001);
      if (v10 > 1.0)
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("getTxPerAnticipatedMovAvg diacard bad value"));
    }
  }
  return v10;
}

- (BOOL)getTxPerAnticipatedMovAvgValid
{
  unint64_t v3;
  char *v4;

  v3 = -[WRM_IdsMetricsController mLocalDeliveryCumulativeMessageSent](self, "mLocalDeliveryCumulativeMessageSent");
  v4 = (char *)-[WRM_IdsMetricsController mLocalDeliveryCumulativeMessageDelivered](self, "mLocalDeliveryCumulativeMessageDelivered")+ v3;
  return (char *)-[WRM_IdsMetricsController mLocalDeliveryMessageDeliveredDeliveryError](self, "mLocalDeliveryMessageDeliveredDeliveryError")+ (unint64_t)v4 > (char *)0x45;
}

- (BOOL)isIDSTransportMetricsGoodEnough:(int)a3 :(BOOL)a4
{
  uint64_t v5;
  double v6;
  double v7;
  unsigned int v8;
  double v9;
  double v10;
  unsigned int v11;
  double v12;
  double v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  BOOL result;
  char v27;
  char v28;
  unsigned int v29;
  id v30;

  v30 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton", *(_QWORD *)&a3, a4), "getiRATConfigController");
  v5 = -[WRM_IdsMetricsController getRTT](self, "getRTT");
  -[WRM_IdsMetricsController getTxPer](self, "getTxPer");
  v7 = v6 * 100.0;
  v8 = -[WRM_IdsMetricsController getTxPerValid](self, "getTxPerValid");
  -[WRM_IdsMetricsController getAnticipiatedTxPer](self, "getAnticipiatedTxPer");
  v10 = v9 * 100.0;
  v11 = -[WRM_IdsMetricsController getAnticipiatedTxPerValid](self, "getAnticipiatedTxPerValid");
  -[WRM_IdsMetricsController getTxPerAnticipatedMovAvg](self, "getTxPerAnticipatedMovAvg");
  v13 = v12 * 100.0;
  v14 = -[WRM_IdsMetricsController getTxPerAnticipatedMovAvgValid](self, "getTxPerAnticipatedMovAvgValid");
  v15 = -[WRM_IdsMetricsController getAvgTxPDUSize](self, "getAvgTxPDUSize");
  v16 = -[WRM_IdsMetricsController getAvgRxPDUSize](self, "getAvgRxPDUSize");
  -[WRM_IdsMetricsController evaluateDLThroughput](self, "evaluateDLThroughput");
  v18 = v17;
  -[WRM_IdsMetricsController evaluateDLThroughput](self, "evaluateDLThroughput");
  v20 = v19;
  v21 = -[WRM_IdsMetricsController getRTTMovAvg](self, "getRTTMovAvg");
  -[WRM_IdsMetricsController getTxPerMovAvg](self, "getTxPerMovAvg");
  v23 = v22 * 100.0;
  v24 = -[WRM_IdsMetricsController getAvgTxPDUSizeMovAvg](self, "getAvgTxPDUSizeMovAvg");
  v25 = -[WRM_IdsMetricsController getAvgRxPDUSizeMovAvg](self, "getAvgRxPDUSizeMovAvg");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("Ant PER: %.2f,  Ant PER Valid: %d, Ant Mov PER: %.2f, Ant Mov PER Valid:%d"), *(_QWORD *)&v10, v11, *(_QWORD *)&v13, v14);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("IDS Metrics For Cell/WiFi Eval, RTT: %d, M_avg RTT: %d, TX PER: %.2f, Tx PER Valid: %d, M_avg TX PER: %.2f, Rx Size: %d, MAvgRx Size: %d, DL Thr: %.2f, Tx Size: %d, MAvgTx Size: %d,  UL Thr: %.2f"), v5, v21, *(_QWORD *)&v7, v8, *(_QWORD *)&v23, v16, v25, v18, v15, v24, *(_QWORD *)&v20);
  result = 1;
  if (a3 == 1 && v20 < 1000.0)
  {
    result = 0;
    if ((uint64_t)objc_msgSend(v30, "idsWiFiMinRttTh1") > (int)v5)
    {
      v27 = v10 >= (double)(uint64_t)objc_msgSend(v30, "idsWiFiMinPerTh1") ? v11 : 0;
      if ((v27 & 1) == 0)
      {
        v28 = v13 >= (double)(uint64_t)objc_msgSend(v30, "idsMovAvgWiFiMinPerTh1") ? v14 : 0;
        if ((v28 & 1) == 0)
        {
          v29 = v7 >= (double)(uint64_t)objc_msgSend(v30, "idsAvgWiFiMinPerTh1") ? v8 : 0;
          if (v29 != 1)
            return 1;
        }
      }
    }
  }
  return result;
}

- (int)mReportDuration
{
  return *(&self->super.mProcessId + 1);
}

- (void)setMReportDuration:(int)a3
{
  *(&self->super.mProcessId + 1) = a3;
}

- (int)mMetricsConsiderationPeriod
{
  return self->_mReportDuration;
}

- (void)setMMetricsConsiderationPeriod:(int)a3
{
  self->_mReportDuration = a3;
}

- (unint64_t)mStreamingReportBytesSent
{
  return *(_QWORD *)&self->_mMetricsConsiderationPeriod;
}

- (void)setMStreamingReportBytesSent:(unint64_t)a3
{
  *(_QWORD *)&self->_mMetricsConsiderationPeriod = a3;
}

- (unint64_t)mStreamingReportPacketsSent
{
  return *(unint64_t *)((char *)&self->_mStreamingReportBytesSent + 4);
}

- (void)setMStreamingReportPacketsSent:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mStreamingReportBytesSent + 4) = a3;
}

- (unint64_t)mStreamingReportBytesReceived
{
  return *(unint64_t *)((char *)&self->_mStreamingReportPacketsSent + 4);
}

- (void)setMStreamingReportBytesReceived:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mStreamingReportPacketsSent + 4) = a3;
}

- (unint64_t)mStreamingReportPacketsReceived
{
  return *(unint64_t *)((char *)&self->_mStreamingReportBytesReceived + 4);
}

- (void)setMStreamingReportPacketsReceived:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mStreamingReportBytesReceived + 4) = a3;
}

- (unint64_t)mLocalDeliveryMessageSentMessageSize
{
  return *(unint64_t *)((char *)&self->_mStreamingReportPacketsReceived + 4);
}

- (void)setMLocalDeliveryMessageSentMessageSize:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mStreamingReportPacketsReceived + 4) = a3;
}

- (unint64_t)mLocalDeliveryMessageDeliveredMessageSize
{
  return *(unint64_t *)((char *)&self->_mLocalDeliveryMessageSentMessageSize + 4);
}

- (void)setMLocalDeliveryMessageDeliveredMessageSize:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mLocalDeliveryMessageSentMessageSize + 4) = a3;
}

- (unint64_t)mLocalDeliveryMessageDeliveredRTT
{
  return *(unint64_t *)((char *)&self->_mLocalDeliveryMessageDeliveredMessageSize + 4);
}

- (void)setMLocalDeliveryMessageDeliveredRTT:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mLocalDeliveryMessageDeliveredMessageSize + 4) = a3;
}

- (unint64_t)mLocalDeliveryMessageReceivedMessageSize
{
  return *(unint64_t *)((char *)&self->_mLocalDeliveryMessageDeliveredRTT + 4);
}

- (void)setMLocalDeliveryMessageReceivedMessageSize:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mLocalDeliveryMessageDeliveredRTT + 4) = a3;
}

- (unint64_t)mLocalDeliveryMessageSent
{
  return *(unint64_t *)((char *)&self->_mLocalDeliveryMessageReceivedMessageSize + 4);
}

- (void)setMLocalDeliveryMessageSent:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mLocalDeliveryMessageReceivedMessageSize + 4) = a3;
}

- (unint64_t)mLocalDeliveryMessageDelivered
{
  return *(unint64_t *)((char *)&self->_mLocalDeliveryMessageSent + 4);
}

- (void)setMLocalDeliveryMessageDelivered:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mLocalDeliveryMessageSent + 4) = a3;
}

- (unint64_t)mLocalDeliveryMessageDeliveredDeliveryError
{
  return *(unint64_t *)((char *)&self->_mLocalDeliveryMessageDelivered + 4);
}

- (void)setMLocalDeliveryMessageDeliveredDeliveryError:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mLocalDeliveryMessageDelivered + 4) = a3;
}

- (unint64_t)mLocalDeliveryMessageReceived
{
  return *(unint64_t *)((char *)&self->_mLocalDeliveryMessageDeliveredDeliveryError + 4);
}

- (void)setMLocalDeliveryMessageReceived:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mLocalDeliveryMessageDeliveredDeliveryError + 4) = a3;
}

- (double)mLocalDeliveryMessageDeliveredMessageSizeMovAvg
{
  return *(double *)((char *)&self->_mLocalDeliveryMessageReceived + 4);
}

- (void)setMLocalDeliveryMessageDeliveredMessageSizeMovAvg:(double)a3
{
  *(double *)((char *)&self->_mLocalDeliveryMessageReceived + 4) = a3;
}

- (double)mLocalDeliveryMessageDeliveredRTTMovAvg
{
  return *(double *)((char *)&self->_mLocalDeliveryMessageDeliveredMessageSizeMovAvg + 4);
}

- (void)setMLocalDeliveryMessageDeliveredRTTMovAvg:(double)a3
{
  *(double *)((char *)&self->_mLocalDeliveryMessageDeliveredMessageSizeMovAvg + 4) = a3;
}

- (double)mLocalDeliveryMessageReceivedMessageSizeMovAvg
{
  return *(double *)((char *)&self->_mLocalDeliveryMessageDeliveredRTTMovAvg + 4);
}

- (void)setMLocalDeliveryMessageReceivedMessageSizeMovAvg:(double)a3
{
  *(double *)((char *)&self->_mLocalDeliveryMessageDeliveredRTTMovAvg + 4) = a3;
}

- (double)mLocalDeliveryMessageSentMovAvg
{
  return *(double *)((char *)&self->_mLocalDeliveryMessageReceivedMessageSizeMovAvg + 4);
}

- (void)setMLocalDeliveryMessageSentMovAvg:(double)a3
{
  *(double *)((char *)&self->_mLocalDeliveryMessageReceivedMessageSizeMovAvg + 4) = a3;
}

- (double)mLocalDeliveryMessageDeliveredMovAvg
{
  return *(double *)((char *)&self->_mLocalDeliveryMessageSentMovAvg + 4);
}

- (void)setMLocalDeliveryMessageDeliveredMovAvg:(double)a3
{
  *(double *)((char *)&self->_mLocalDeliveryMessageSentMovAvg + 4) = a3;
}

- (double)mLocalDeliveryMessageDeliveredDeliveryErrorMovAvg
{
  return *(double *)((char *)&self->_mLocalDeliveryMessageDeliveredMovAvg + 4);
}

- (void)setMLocalDeliveryMessageDeliveredDeliveryErrorMovAvg:(double)a3
{
  *(double *)((char *)&self->_mLocalDeliveryMessageDeliveredMovAvg + 4) = a3;
}

- (double)mLocalDeliveryMessageReceivedMovAvg
{
  return *(double *)((char *)&self->_mLocalDeliveryMessageDeliveredDeliveryErrorMovAvg + 4);
}

- (void)setMLocalDeliveryMessageReceivedMovAvg:(double)a3
{
  *(double *)((char *)&self->_mLocalDeliveryMessageDeliveredDeliveryErrorMovAvg + 4) = a3;
}

- (unint64_t)mLocalDeliveryCumulativeMessageSent
{
  return *(_QWORD *)((char *)&self->_mLocalDeliveryMessageReceivedMovAvg + 4);
}

- (void)setMLocalDeliveryCumulativeMessageSent:(unint64_t)a3
{
  *(_QWORD *)((char *)&self->_mLocalDeliveryMessageReceivedMovAvg + 4) = a3;
}

- (unint64_t)mLocalDeliveryCumulativeMessageDelivered
{
  return *(unint64_t *)((char *)&self->_mLocalDeliveryCumulativeMessageSent + 4);
}

- (void)setMLocalDeliveryCumulativeMessageDelivered:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_mLocalDeliveryCumulativeMessageSent + 4) = a3;
}

@end
