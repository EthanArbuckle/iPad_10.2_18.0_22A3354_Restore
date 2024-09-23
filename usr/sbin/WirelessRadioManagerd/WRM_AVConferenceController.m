@implementation WRM_AVConferenceController

- (WRM_AVConferenceController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WRM_AVConferenceController;
  return -[WCM_Controller init](&v3, "init");
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WRM_AVConferenceController;
  -[WCM_Controller dealloc](&v2, "dealloc");
}

- (void)handleMessage:(id)a3
{
  uint64_t uint64;

  uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  if (!uint64)
  {
    uint64 = xpc_dictionary_get_int64(a3, "kMessageId");
    if (!uint64)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 23, CFSTR("Received AVConference Message  message-id: %lld"), 0);
      return;
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 17, CFSTR("Got a message with a INT64 instead of a UINT64. Please file a radar in Purple Radio Manager"));
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 23, CFSTR("Received AVConference Message  message-id: %lld"), uint64);
  if (uint64 == 201)
  {
    -[WRM_AVConferenceController handleRTPEvent:](self, "handleRTPEvent:", a3);
  }
  else if (uint64 == 202)
  {
    -[WRM_AVConferenceController handlePeriodicRTPMetrics:](self, "handlePeriodicRTPMetrics:", a3);
  }
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("AVConference Controller"));
}

- (void)resetPeriodicRTPStats
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[WRM_AVConferenceController setTotalErasures:](self, "setTotalErasures:", 0);
  -[WRM_AVConferenceController setTotalPlayBacks:](self, "setTotalPlayBacks:", 0);
  -[WRM_AVConferenceController setTotalPlayBacksInSpeech:](self, "setTotalPlayBacksInSpeech:", 0);
  -[WRM_AVConferenceController setErasuresInSpeech:](self, "setErasuresInSpeech:", 0);
  -[WRM_AVConferenceController setErasuresInSilence:](self, "setErasuresInSilence:", 0);
  -[WRM_AVConferenceController setTotalPacketsReceived:](self, "setTotalPacketsReceived:", 0);
  -[WRM_AVConferenceController setSpeechPacketsReceived:](self, "setSpeechPacketsReceived:", 0);
  -[WRM_AVConferenceController setSidPacketsReceived:](self, "setSidPacketsReceived:", 0);
  -[WRM_AVConferenceController setSilencePlayed:](self, "setSilencePlayed:", 0);
  -[WRM_AVConferenceController setPeriodicRtt:](self, "setPeriodicRtt:", 0);
  -[WRM_AVConferenceController setFrameCountSinceRttReported:](self, "setFrameCountSinceRttReported:", 0);
  -[WRM_AVConferenceController setTxPacketsCount:](self, "setTxPacketsCount:", 0);
  -[WRM_AVConferenceController setFrameCountCountSinceTxPacketLossReported:](self, "setFrameCountCountSinceTxPacketLossReported:", 0);
  -[WRM_AVConferenceController setRxJitter:](self, "setRxJitter:", 0);
  -[WRM_AVConferenceController setTxJitter:](self, "setTxJitter:", 0);
  -[WRM_AVConferenceController setFrameCountSinceTxJitterUpdated:](self, "setFrameCountSinceTxJitterUpdated:", 0);
  -[WRM_AVConferenceController setNominalJitterBufferQueueSize:](self, "setNominalJitterBufferQueueSize:", 0);
  -[WRM_AVConferenceController setTargetJitterBufferQueueSize:](self, "setTargetJitterBufferQueueSize:", 0);
  -[WRM_AVConferenceController setTimeStampRTPMetrics:](self, "setTimeStampRTPMetrics:", 0);
  LODWORD(v3) = 0;
  -[WRM_AVConferenceController setPrimaryVideoPacketLossRate:](self, "setPrimaryVideoPacketLossRate:", v3);
  LODWORD(v4) = 0;
  -[WRM_AVConferenceController setPrimaryAudioPacketLossRate:](self, "setPrimaryAudioPacketLossRate:", v4);
  LODWORD(v5) = 0;
  -[WRM_AVConferenceController setTotalVideoPacketLossRate:](self, "setTotalVideoPacketLossRate:", v5);
  LODWORD(v6) = 0;
  -[WRM_AVConferenceController setTotalAudioPacketLossRate:](self, "setTotalAudioPacketLossRate:", v6);
  -[WRM_AVConferenceController setPoorConnectionDetected:](self, "setPoorConnectionDetected:", 0);
  -[WRM_AVConferenceController setMediaStallDetected:](self, "setMediaStallDetected:", 0);
  LODWORD(v7) = 0;
  -[WRM_AVConferenceController setDeltaVideoErasure:](self, "setDeltaVideoErasure:", v7);
  LODWORD(v8) = 0;
  -[WRM_AVConferenceController setTotalVideoErasure:](self, "setTotalVideoErasure:", v8);
}

- (void)resetRTPMetrics
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[WRM_AVConferenceController setCallType:](self, "setCallType:", 0);
  -[WRM_AVConferenceController setRxPktLoss:](self, "setRxPktLoss:", 0);
  -[WRM_AVConferenceController setRxSpeechPktLoss:](self, "setRxSpeechPktLoss:", 0);
  -[WRM_AVConferenceController setRtt:](self, "setRtt:", 0);
  LODWORD(v3) = 0;
  -[WRM_AVConferenceController setPrimaryVideoPacketLossRate:](self, "setPrimaryVideoPacketLossRate:", v3);
  LODWORD(v4) = 0;
  -[WRM_AVConferenceController setPrimaryAudioPacketLossRate:](self, "setPrimaryAudioPacketLossRate:", v4);
  LODWORD(v5) = 0;
  -[WRM_AVConferenceController setTotalVideoPacketLossRate:](self, "setTotalVideoPacketLossRate:", v5);
  LODWORD(v6) = 0;
  -[WRM_AVConferenceController setTotalAudioPacketLossRate:](self, "setTotalAudioPacketLossRate:", v6);
  -[WRM_AVConferenceController setPoorConnectionDetected:](self, "setPoorConnectionDetected:", 0);
  -[WRM_AVConferenceController setMediaStallDetected:](self, "setMediaStallDetected:", 0);
  LODWORD(v7) = 0;
  -[WRM_AVConferenceController setDeltaVideoErasure:](self, "setDeltaVideoErasure:", v7);
}

- (void)resetCumulativeRTPMetrics
{
  -[WRM_AVConferenceController setCumRxPktLoss:](self, "setCumRxPktLoss:", 0);
  -[WRM_AVConferenceController setAvgRxPktLoss:](self, "setAvgRxPktLoss:", 0);
  -[WRM_AVConferenceController setMovAvgRxPktLoss:](self, "setMovAvgRxPktLoss:", 0.0);
  -[WRM_AVConferenceController setMovAvgIdleRxPktLoss:](self, "setMovAvgIdleRxPktLoss:", 0.0);
  -[WRM_AVConferenceController setMovAvgNominalJitterBufferDelay:](self, "setMovAvgNominalJitterBufferDelay:", 0);
  -[WRM_AVConferenceController setCumulativeNominalJitterBufferDelay:](self, "setCumulativeNominalJitterBufferDelay:", 0);
  -[WRM_AVConferenceController setAveragedNominalJitterBufferDelay:](self, "setAveragedNominalJitterBufferDelay:", 0);
  -[WRM_AVConferenceController setRxRtpMetricsSampleCount:](self, "setRxRtpMetricsSampleCount:", 0);
}

- (void)configureRTPMetricsReporting
{
  xpc_object_t v3;
  void *v4;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 23, CFSTR("Configuring AVConference RTP metrics report"));
  v3 = xpc_dictionary_create(0, 0, 0);
  if (v3)
  {
    v4 = v3;
    -[WRM_AVConferenceController setCallIdPrimaryLatteCall:](self, "setCallIdPrimaryLatteCall:", 0);
    -[WRM_AVConferenceController setRtpMetricsReportingStarted:](self, "setRtpMetricsReportingStarted:", 0);
    -[WRM_AVConferenceController setIsActiveClientFaceTime:](self, "setIsActiveClientFaceTime:", 0);
    xpc_dictionary_set_uint64(v4, "kWRMAVConferenceMetricsConfig_PeriodicReportInterval", (uint64_t)objc_msgSend(objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getiRATConfigController"), "periodicReportInterval"));
    -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1102, v4);
    xpc_release(v4);
  }
}

- (void)configureFaceTimeRTPMetricsReporting
{
  xpc_object_t v3;
  void *v4;
  id v5;
  void *v6;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 23, CFSTR("Configuring AVConference RTP metrics report"));
  v3 = xpc_dictionary_create(0, 0, 0);
  if (v3)
  {
    v4 = v3;
    -[WRM_AVConferenceController setCallIdPrimaryLatteCall:](self, "setCallIdPrimaryLatteCall:", 0);
    -[WRM_AVConferenceController setRtpMetricsReportingStarted:](self, "setRtpMetricsReportingStarted:", 0);
    -[WRM_AVConferenceController setIsActiveClientFaceTime:](self, "setIsActiveClientFaceTime:", 1);
    v5 = objc_msgSend(+[WRM_FT_HandoverManager WRM_FT_HandoverManagerSingleton](WRM_FT_HandoverManager, "WRM_FT_HandoverManagerSingleton"), "getiRATClientFromList:", 7);
    if (v5)
    {
      v6 = v5;
      xpc_dictionary_set_uint64(v4, "kWRMAVConferenceMetricsConfig_PeriodicReportInterval", (uint64_t)objc_msgSend(objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getiRATConfigController"), "periodicReportInterval"));
      objc_msgSend(v6, "sendMessage:withArgs:", 1102, v4);
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, CFSTR("Not sending FaceTimeCalling  metrics Configure request, FaceTimeCalling client not registered"));
    }
    xpc_release(v4);
  }
}

- (void)handleTelephonyRTPMetrics:(id)a3
{
  xpc_object_t value;
  void *v6;
  void *uint64;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  double v17;
  unint64_t v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 23, CFSTR("Received message from AVConference client, params are %@"), a3);
  -[WRM_AVConferenceController setRxRtpMetricsSampleCount:](self, "setRxRtpMetricsSampleCount:", (char *)-[WRM_AVConferenceController rxRtpMetricsSampleCount](self, "rxRtpMetricsSampleCount") + 1);
  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (!value)
  {
    v8 = CFSTR("Unable to extract content of IMG message, nothing to report");
    goto LABEL_6;
  }
  v6 = value;
  uint64 = (void *)xpc_dictionary_get_uint64(value, "kWRMAVConferencePeriodicReport_CallID");
  if (-[WRM_AVConferenceController rtpMetricsReportingStarted](self, "rtpMetricsReportingStarted"))
  {
    if (uint64 != (void *)-[WRM_AVConferenceController callIdPrimaryLatteCall](self, "callIdPrimaryLatteCall"))
    {
      v8 = CFSTR("handleTelephonyRTPMetrics: discard WIFI RTP metrics call id not matching");
LABEL_6:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 23, v8);
      return;
    }
  }
  else
  {
    -[WRM_AVConferenceController setCallIdPrimaryLatteCall:](self, "setCallIdPrimaryLatteCall:", uint64);
    -[WRM_AVConferenceController setRtpMetricsReportingStarted:](self, "setRtpMetricsReportingStarted:", 1);
  }
  v9 = xpc_dictionary_get_uint64(v6, "kWRMAVConferencePeriodicReport_ErasuresInSpeech");
  v10 = v9 - -[WRM_AVConferenceController erasuresInSpeech](self, "erasuresInSpeech");
  -[WRM_AVConferenceController setErasuresInSpeech:](self, "setErasuresInSpeech:", v9);
  v11 = xpc_dictionary_get_uint64(v6, "kWRMAVConferencePeriodicReport_TotalPlaybacks");
  v12 = v11 - -[WRM_AVConferenceController totalPlayBacks](self, "totalPlayBacks");
  -[WRM_AVConferenceController setTotalPlayBacks:](self, "setTotalPlayBacks:", v11);
  -[WRM_AVConferenceController setRxSpeechPktLoss:](self, "setRxSpeechPktLoss:", (unint64_t)((double)v10 * 100.0 / (double)v12));
  if (xpc_dictionary_get_value(v6, "kWRMAVConferencePeriodicReport_LinkType")
    && !xpc_dictionary_get_uint64(v6, "kWRMAVConferencePeriodicReport_LinkType"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 23, CFSTR("handleTelephonyRTPMetrics: Cellular RTP metrics"));
    objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "updateAVCRTPMetric:", (unint64_t)((double)v10 * 100.0 / (double)v12));
    -[WRM_AVConferenceController resetRTPMetrics](self, "resetRTPMetrics");
    objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "evaluateHandover");
  }
  else
  {
    v13 = xpc_dictionary_get_uint64(v6, "kWRMAVConferencePeriodicReport_TotalErasures");
    v26 = v13 - -[WRM_AVConferenceController totalErasures](self, "totalErasures");
    -[WRM_AVConferenceController setTotalErasures:](self, "setTotalErasures:", v13);
    v14 = xpc_dictionary_get_uint64(v6, "kWRMMAVConferencePeriodicReport_SIDPacketsReceived");
    v27 = v14 - -[WRM_AVConferenceController sidPacketsReceived](self, "sidPacketsReceived");
    -[WRM_AVConferenceController setSidPacketsReceived:](self, "setSidPacketsReceived:", v14);
    v15 = (-7 * v27 + v26) & ~((uint64_t)(-7 * v27 + v26) >> 63);
    v25 = v10;
    v16 = (unint64_t)((double)v15 * 100.0 / (double)v12);
    -[WRM_AVConferenceController setRxPktLoss:](self, "setRxPktLoss:", v16);
    -[WRM_AVConferenceController setCumRxPktLoss:](self, "setCumRxPktLoss:", (char *)-[WRM_AVConferenceController cumRxPktLoss](self, "cumRxPktLoss") + v16);
    v17 = (double)-[WRM_AVConferenceController cumRxPktLoss](self, "cumRxPktLoss");
    v24 = v12;
    v18 = (unint64_t)(v17
                           / ((double)-[WRM_AVConferenceController rxRtpMetricsSampleCount](self, "rxRtpMetricsSampleCount")+ 0.000001));
    -[WRM_AVConferenceController setAvgRxPktLoss:](self, "setAvgRxPktLoss:", v18);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 23, CFSTR("Rx periodic Average RTP packet loss=%lld"), v18);
    -[WRM_AVConferenceController movAvgRxPktLoss](self, "movAvgRxPktLoss");
    v20 = ((double)-[WRM_AVConferenceController rxSpeechPktLoss](self, "rxSpeechPktLoss") + v19 * 19.0) / 20.0;
    -[WRM_AVConferenceController setMovAvgRxPktLoss:](self, "setMovAvgRxPktLoss:", v20);
    -[WRM_AVConferenceController movAvgIdleRxPktLoss](self, "movAvgIdleRxPktLoss");
    -[WRM_AVConferenceController setMovAvgIdleRxPktLoss:](self, "setMovAvgIdleRxPktLoss:", ((double)-[WRM_AVConferenceController rxPktLoss](self, "rxPktLoss") + v21 * 19.0) / 20.0);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 23, CFSTR("Rx periodic RTP metrics, Total Erasure=%lld, Total SID=%lld Total Played=%lld"), v13, v14, v11);
    -[WRM_AVConferenceController movAvgRxPktLoss](self, "movAvgRxPktLoss");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 23, CFSTR("Delta Erasure=%lld, Delta SID=%lld, RxPktLoss=%lld, Mov Avg=%f, Delta Erasure in Speech=%lld, Delta Played=%lld Per Pkt=%lld, MovAvg total:%f"), v26, v27, v15, *(_QWORD *)&v20, v25, v24, v16, v22);
    v23 = xpc_dictionary_get_uint64(v6, "kWRMAVConferencePeriodicReport_NominalJitterBufferQueueSize");
    -[WRM_AVConferenceController setNominalJitterBufferDelay:](self, "setNominalJitterBufferDelay:", v23);
    -[WRM_AVConferenceController setMovAvgNominalJitterBufferDelay:](self, "setMovAvgNominalJitterBufferDelay:", (v23 + 19 * -[WRM_AVConferenceController movAvgNominalJitterBufferDelay](self, "movAvgNominalJitterBufferDelay"))/ 0x14);
    -[WRM_AVConferenceController setCumulativeNominalJitterBufferDelay:](self, "setCumulativeNominalJitterBufferDelay:", (char *)-[WRM_AVConferenceController cumulativeNominalJitterBufferDelay](self, "cumulativeNominalJitterBufferDelay")+ v23);
    -[WRM_AVConferenceController setAveragedNominalJitterBufferDelay:](self, "setAveragedNominalJitterBufferDelay:", (unint64_t)((double)-[WRM_AVConferenceController cumulativeNominalJitterBufferDelay](self, "cumulativeNominalJitterBufferDelay")/ ((double)-[WRM_AVConferenceController rxRtpMetricsSampleCount](self, "rxRtpMetricsSampleCount")+ 0.000001)));
    objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "updateControllerState:", a3);
  }
}

- (void)handleFaceTimeRTPMetrics:(id)a3
{
  id v5;
  xpc_object_t value;
  double v7;
  void *v8;
  const __CFString *v9;
  int uint64;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  float v17;
  double v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  double v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  float v27;
  double v28;
  uint64_t v29;
  unint64_t v30;
  double v31;
  float v32;
  float v33;
  double v34;
  double v35;
  float v36;
  double v37;
  float v38;
  double v39;
  float v40;
  double v41;
  float v42;
  double v43;
  float v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  uint64_t v51;
  unint64_t v52;
  double v53;
  unint64_t v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  uint64_t v66;

  v5 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getiRATConfigController");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 23, CFSTR("Received message from AVConference client, params are %@"), a3);
  -[WRM_AVConferenceController setRxRtpMetricsSampleCount:](self, "setRxRtpMetricsSampleCount:", (char *)-[WRM_AVConferenceController rxRtpMetricsSampleCount](self, "rxRtpMetricsSampleCount") + 1);
  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (!value)
  {
    LODWORD(v7) = 0;
    -[WRM_AVConferenceController setDeltaVideoErasure:](self, "setDeltaVideoErasure:", v7);
    v9 = CFSTR("Unable to extract content of IMG message, nothing to report");
    goto LABEL_5;
  }
  v8 = value;
  if (xpc_dictionary_get_uint64(value, "kWRMAVConferencePeriodicReport_VideoPause"))
  {
    v9 = CFSTR("handleFaceTimeRTPMetrics: discard RTP metrics, video Paused");
LABEL_5:
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 23, v9);
    return;
  }
  if (xpc_dictionary_get_value(v8, "kWRMAVConferencePeriodicReport_LinkType"))
    uint64 = xpc_dictionary_get_uint64(v8, "kWRMAVConferencePeriodicReport_LinkType");
  else
    uint64 = 1;
  v11 = (void *)xpc_dictionary_get_uint64(v8, "kWRMAVConferencePeriodicReport_CallID");
  if (-[WRM_AVConferenceController rtpMetricsReportingStarted](self, "rtpMetricsReportingStarted"))
  {
    if (v11 != (void *)-[WRM_AVConferenceController callIdPrimaryLatteCall](self, "callIdPrimaryLatteCall"))
    {
      v9 = CFSTR("handleFaceTimeRTPMetrics: discard WIFI RTP metrics call id not matching");
      goto LABEL_5;
    }
  }
  else
  {
    -[WRM_AVConferenceController setCallIdPrimaryLatteCall:](self, "setCallIdPrimaryLatteCall:", v11);
    -[WRM_AVConferenceController setRtpMetricsReportingStarted:](self, "setRtpMetricsReportingStarted:", 1);
  }
  v65 = uint64;
  -[WRM_AVConferenceController setCallType:](self, "setCallType:", xpc_dictionary_get_uint64(v8, "kWRMAVConferencePeriodicReport_CallType"));
  -[WRM_AVConferenceController setReportedBandwitdh:](self, "setReportedBandwitdh:", xpc_dictionary_get_uint64(v8, "kWRMAVConferencePeriodicReport_BWEstimation"));
  -[WRM_AVConferenceController setTargetBitRate:](self, "setTargetBitRate:", xpc_dictionary_get_uint64(v8, "kWRMAVConferencePeriodicReport_TargetBitRate"));
  -[WRM_AVConferenceController setOneWayDealy:](self, "setOneWayDealy:", xpc_dictionary_get_uint64(v8, "kWRMAVConferencePeriodicReport_OneWayRelativeDelay"));
  -[WRM_AVConferenceController setAdaptationPaceketLoss:](self, "setAdaptationPaceketLoss:", xpc_dictionary_get_uint64(v8, "kWRMAVConferencePeriodicReport_AdaptationPacketLoss"));
  v12 = xpc_dictionary_get_uint64(v8, "PriVidRxCnt");
  v13 = -[WRM_AVConferenceController primaryVideoPacketReceived](self, "primaryVideoPacketReceived");
  -[WRM_AVConferenceController setPrimaryVideoPacketReceived:](self, "setPrimaryVideoPacketReceived:", v12);
  v14 = xpc_dictionary_get_uint64(v8, "TotVidRxExpCnt");
  v15 = -[WRM_AVConferenceController videoPacketExpected](self, "videoPacketExpected");
  -[WRM_AVConferenceController setVideoPacketExpected:](self, "setVideoPacketExpected:", v14);
  v16 = -[WRM_AVConferenceController callType](self, "callType");
  v17 = 0.0;
  LODWORD(v18) = 0;
  if (v16 == 2 && v14 != v15 && v12 != v13)
  {
    v18 = 1.0 - (double)(v12 - v13) / ((double)(v14 - v15) + 0.000001);
    *(float *)&v18 = v18;
  }
  -[WRM_AVConferenceController setPrimaryVideoPacketLossRate:](self, "setPrimaryVideoPacketLossRate:", v18);
  v19 = xpc_dictionary_get_uint64(v8, "PriAudRxCnt");
  v20 = -[WRM_AVConferenceController primaryAudioPacketReceived](self, "primaryAudioPacketReceived");
  -[WRM_AVConferenceController setPrimaryAudioPacketReceived:](self, "setPrimaryAudioPacketReceived:", v19);
  v21 = xpc_dictionary_get_uint64(v8, "TotAudRxExpCnt");
  v22 = v21 - -[WRM_AVConferenceController audioPacketExpected](self, "audioPacketExpected");
  -[WRM_AVConferenceController setAudioPacketExpected:](self, "setAudioPacketExpected:", v21);
  if (v19 != v20)
  {
    v23 = 1.0 - (double)(v19 - v20) / ((double)v22 + 0.000001);
    v17 = v23;
  }
  *(float *)&v23 = v17;
  -[WRM_AVConferenceController setPrimaryAudioPacketLossRate:](self, "setPrimaryAudioPacketLossRate:", v23);
  v24 = xpc_dictionary_get_uint64(v8, "TotVidRxCnt");
  v25 = -[WRM_AVConferenceController totalVideoPacketReceived](self, "totalVideoPacketReceived");
  -[WRM_AVConferenceController setTotalVideoPacketReceived:](self, "setTotalVideoPacketReceived:", v24);
  v26 = -[WRM_AVConferenceController callType](self, "callType");
  v27 = 0.0;
  LODWORD(v28) = 0;
  if (v26 == 2 && v14 != v15 && v24 != v25)
  {
    v28 = 1.0 - (double)(v24 - v25) / ((double)(v14 - v15) + 0.000001);
    *(float *)&v28 = v28;
  }
  -[WRM_AVConferenceController setTotalVideoPacketLossRate:](self, "setTotalVideoPacketLossRate:", v28);
  v29 = xpc_dictionary_get_uint64(v8, "TotAudRxCnt");
  v30 = -[WRM_AVConferenceController totalAudioPacketReceived](self, "totalAudioPacketReceived");
  -[WRM_AVConferenceController setTotalAudioPacketReceived:](self, "setTotalAudioPacketReceived:", v29);
  if (v29 != v30)
  {
    v31 = 1.0 - (double)(v29 - v30) / ((double)v22 + 0.000001);
    v27 = v31;
  }
  *(float *)&v31 = v27;
  -[WRM_AVConferenceController setTotalAudioPacketLossRate:](self, "setTotalAudioPacketLossRate:", v31);
  if (xpc_dictionary_get_value(v8, "VidErasure"))
  {
    -[WRM_AVConferenceController setVideoErasureSupported:](self, "setVideoErasureSupported:", 1);
    v32 = (float)xpc_dictionary_get_uint64(v8, "VidErasure");
    -[WRM_AVConferenceController totalVideoErasure](self, "totalVideoErasure");
    *(float *)&v34 = v32 - v33;
    -[WRM_AVConferenceController setDeltaVideoErasure:](self, "setDeltaVideoErasure:", v34);
    -[WRM_AVConferenceController deltaVideoErasure](self, "deltaVideoErasure");
    if (*(float *)&v35 > 10000.0)
    {
      LODWORD(v35) = 0;
      -[WRM_AVConferenceController setDeltaVideoErasure:](self, "setDeltaVideoErasure:", v35);
    }
    *(float *)&v35 = v32;
    -[WRM_AVConferenceController setTotalVideoErasure:](self, "setTotalVideoErasure:", v35);
  }
  else
  {
    -[WRM_AVConferenceController setVideoErasureSupported:](self, "setVideoErasureSupported:", 0);
  }
  -[WRM_AVConferenceController primaryVideoPacketLossRate](self, "primaryVideoPacketLossRate");
  v37 = v36;
  -[WRM_AVConferenceController primaryAudioPacketLossRate](self, "primaryAudioPacketLossRate");
  v39 = v38;
  -[WRM_AVConferenceController totalAudioPacketLossRate](self, "totalAudioPacketLossRate");
  v41 = v40;
  -[WRM_AVConferenceController totalVideoPacketLossRate](self, "totalVideoPacketLossRate");
  v43 = v42;
  -[WRM_AVConferenceController deltaVideoErasure](self, "deltaVideoErasure");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 23, CFSTR("Primary Video packet loss rate: %f, primary Audio packet loss rate: %f, total audio packet loss rate: %f, total video packet loss rate: %f, video erasure: %f"), *(_QWORD *)&v37, *(_QWORD *)&v39, *(_QWORD *)&v41, *(_QWORD *)&v43, v44);
  if (v65)
  {
    v45 = xpc_dictionary_get_uint64(v8, "kWRMAVConferencePeriodicReport_ErasuresInSpeech");
    v62 = v45 - -[WRM_AVConferenceController erasuresInSpeech](self, "erasuresInSpeech");
    -[WRM_AVConferenceController setErasuresInSpeech:](self, "setErasuresInSpeech:", v45);
    v66 = xpc_dictionary_get_uint64(v8, "kWRMAVConferencePeriodicReport_TotalPlaybacks");
    v46 = v66 - -[WRM_AVConferenceController totalPlayBacks](self, "totalPlayBacks");
    -[WRM_AVConferenceController setTotalPlayBacks:](self, "setTotalPlayBacks:", v66);
    v47 = xpc_dictionary_get_uint64(v8, "kWRMAVConferencePeriodicReport_TotalErasures");
    v63 = v47 - -[WRM_AVConferenceController totalErasures](self, "totalErasures");
    -[WRM_AVConferenceController setTotalErasures:](self, "setTotalErasures:", v47);
    v48 = xpc_dictionary_get_uint64(v8, "kWRMMAVConferencePeriodicReport_SIDPacketsReceived");
    v64 = v48 - -[WRM_AVConferenceController sidPacketsReceived](self, "sidPacketsReceived");
    -[WRM_AVConferenceController setSidPacketsReceived:](self, "setSidPacketsReceived:", v48);
    v49 = (-7 * v64 + v63) & ~((uint64_t)(-7 * v64 + v63) >> 63);
    v50 = (double)v46;
    v51 = v46;
    v52 = (unint64_t)((double)v49 * 100.0 / (double)v46);
    -[WRM_AVConferenceController setRxPktLoss:](self, "setRxPktLoss:", v52);
    -[WRM_AVConferenceController setRxSpeechPktLoss:](self, "setRxSpeechPktLoss:", (unint64_t)((double)v62 * 100.0 / v50));
    -[WRM_AVConferenceController setCumRxPktLoss:](self, "setCumRxPktLoss:", (char *)-[WRM_AVConferenceController cumRxPktLoss](self, "cumRxPktLoss") + v52);
    v53 = (double)-[WRM_AVConferenceController cumRxPktLoss](self, "cumRxPktLoss");
    v54 = (unint64_t)(v53
                           / ((double)-[WRM_AVConferenceController rxRtpMetricsSampleCount](self, "rxRtpMetricsSampleCount")+ 0.000001));
    -[WRM_AVConferenceController setAvgRxPktLoss:](self, "setAvgRxPktLoss:", v54);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 23, CFSTR("Rx periodic Average RTP packet loss=%lld"), v54);
    v55 = (double)((unint64_t)objc_msgSend(v5, "faceTimeMovingAverageWindow") - 1);
    -[WRM_AVConferenceController movAvgRxPktLoss](self, "movAvgRxPktLoss");
    v57 = (double)-[WRM_AVConferenceController rxSpeechPktLoss](self, "rxSpeechPktLoss") + v55 * v56;
    v58 = v57 / (double)(uint64_t)objc_msgSend(v5, "faceTimeMovingAverageWindow");
    -[WRM_AVConferenceController setMovAvgRxPktLoss:](self, "setMovAvgRxPktLoss:", v58);
    -[WRM_AVConferenceController movAvgIdleRxPktLoss](self, "movAvgIdleRxPktLoss");
    -[WRM_AVConferenceController setMovAvgIdleRxPktLoss:](self, "setMovAvgIdleRxPktLoss:", ((double)-[WRM_AVConferenceController rxPktLoss](self, "rxPktLoss") + v59 * 19.0) / 20.0);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 23, CFSTR("Rx periodic RTP metrics, Total Erasure=%lld, Total SID=%lld Total Played=%lld"), v47, v48, v66);
    -[WRM_AVConferenceController movAvgRxPktLoss](self, "movAvgRxPktLoss");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 23, CFSTR("Delta Erasure=%lld, Delta SID=%lld, RxPktLoss=%lld, Mov Avg=%f, Delta Erasure in Speech=%lld, Delta Played=%lld Per Pkt=%lld, MovAvg total:%f"), v63, v64, v49, *(_QWORD *)&v58, v62, v51, v52, v60);
    v61 = xpc_dictionary_get_uint64(v8, "kWRMAVConferencePeriodicReport_NominalJitterBufferQueueSize");
    -[WRM_AVConferenceController setNominalJitterBufferDelay:](self, "setNominalJitterBufferDelay:", v61);
    -[WRM_AVConferenceController setMovAvgNominalJitterBufferDelay:](self, "setMovAvgNominalJitterBufferDelay:", (v61 + 19 * -[WRM_AVConferenceController movAvgNominalJitterBufferDelay](self, "movAvgNominalJitterBufferDelay"))/ 0x14);
    -[WRM_AVConferenceController setCumulativeNominalJitterBufferDelay:](self, "setCumulativeNominalJitterBufferDelay:", (char *)-[WRM_AVConferenceController cumulativeNominalJitterBufferDelay](self, "cumulativeNominalJitterBufferDelay")+ v61);
    -[WRM_AVConferenceController setAveragedNominalJitterBufferDelay:](self, "setAveragedNominalJitterBufferDelay:", (unint64_t)((double)-[WRM_AVConferenceController cumulativeNominalJitterBufferDelay](self, "cumulativeNominalJitterBufferDelay")/ ((double)-[WRM_AVConferenceController rxRtpMetricsSampleCount](self, "rxRtpMetricsSampleCount")+ 0.000001)));
  }
}

- (void)handleRTPEvent:(id)a3
{
  xpc_object_t value;
  void *v5;

  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value)
  {
    v5 = value;
    -[WRM_AVConferenceController setPoorConnectionDetected:](self, "setPoorConnectionDetected:", xpc_dictionary_get_uint64(value, "AnyPoorCon") != 0);
    -[WRM_AVConferenceController setMediaStallDetected:](self, "setMediaStallDetected:", xpc_dictionary_get_uint64(v5, "IsMedStall") != 0);
  }
}

- (void)handlePeriodicRTPMetrics:(id)a3
{
  if (-[WRM_AVConferenceController isActiveClientFaceTime](self, "isActiveClientFaceTime"))
    -[WRM_AVConferenceController handleFaceTimeRTPMetrics:](self, "handleFaceTimeRTPMetrics:", a3);
  else
    -[WRM_AVConferenceController handleTelephonyRTPMetrics:](self, "handleTelephonyRTPMetrics:", a3);
}

- (BOOL)isActiveClientFaceTime
{
  return *((_BYTE *)&self->super.mProcessId + 4);
}

- (void)setIsActiveClientFaceTime:(BOOL)a3
{
  *((_BYTE *)&self->super.mProcessId + 4) = a3;
}

- (unint64_t)rxPktLoss
{
  return *(_QWORD *)&self->_deltaVideoErasure;
}

- (void)setRxPktLoss:(unint64_t)a3
{
  *(_QWORD *)&self->_deltaVideoErasure = a3;
}

- (unint64_t)rxSpeechPktLoss
{
  return *(unint64_t *)((char *)&self->_rxPktLoss + 4);
}

- (void)setRxSpeechPktLoss:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_rxPktLoss + 4) = a3;
}

- (unint64_t)cumRxPktLoss
{
  return *(unint64_t *)((char *)&self->_rxSpeechPktLoss + 4);
}

- (void)setCumRxPktLoss:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_rxSpeechPktLoss + 4) = a3;
}

- (unint64_t)avgRxPktLoss
{
  return *(unint64_t *)((char *)&self->_cumRxPktLoss + 4);
}

- (void)setAvgRxPktLoss:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_cumRxPktLoss + 4) = a3;
}

- (unint64_t)rtt
{
  return *(unint64_t *)((char *)&self->_avgRxPktLoss + 4);
}

- (void)setRtt:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_avgRxPktLoss + 4) = a3;
}

- (unint64_t)nominalJitterBufferDelay
{
  return *(unint64_t *)((char *)&self->_rtt + 4);
}

- (void)setNominalJitterBufferDelay:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_rtt + 4) = a3;
}

- (unint64_t)cumulativeNominalJitterBufferDelay
{
  return *(unint64_t *)((char *)&self->_nominalJitterBufferDelay + 4);
}

- (void)setCumulativeNominalJitterBufferDelay:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_nominalJitterBufferDelay + 4) = a3;
}

- (unint64_t)averagedNominalJitterBufferDelay
{
  return *(unint64_t *)((char *)&self->_cumulativeNominalJitterBufferDelay + 4);
}

- (void)setAveragedNominalJitterBufferDelay:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_cumulativeNominalJitterBufferDelay + 4) = a3;
}

- (unint64_t)rxRtpMetricsSampleCount
{
  return *(unint64_t *)((char *)&self->_averagedNominalJitterBufferDelay + 4);
}

- (void)setRxRtpMetricsSampleCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_averagedNominalJitterBufferDelay + 4) = a3;
}

- (unint64_t)movAvgNominalJitterBufferDelay
{
  return *(unint64_t *)((char *)&self->_rxRtpMetricsSampleCount + 4);
}

- (void)setMovAvgNominalJitterBufferDelay:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_rxRtpMetricsSampleCount + 4) = a3;
}

- (double)movAvgRxPktLoss
{
  return *(double *)((char *)&self->_movAvgNominalJitterBufferDelay + 4);
}

- (void)setMovAvgRxPktLoss:(double)a3
{
  *(double *)((char *)&self->_movAvgNominalJitterBufferDelay + 4) = a3;
}

- (double)movAvgIdleRxPktLoss
{
  return *(double *)((char *)&self->_movAvgRxPktLoss + 4);
}

- (void)setMovAvgIdleRxPktLoss:(double)a3
{
  *(double *)((char *)&self->_movAvgRxPktLoss + 4) = a3;
}

- (unint64_t)totalErasures
{
  return *(_QWORD *)((char *)&self->_movAvgIdleRxPktLoss + 4);
}

- (void)setTotalErasures:(unint64_t)a3
{
  *(_QWORD *)((char *)&self->_movAvgIdleRxPktLoss + 4) = a3;
}

- (unint64_t)totalPlayBacks
{
  return *(unint64_t *)((char *)&self->_totalErasures + 4);
}

- (void)setTotalPlayBacks:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_totalErasures + 4) = a3;
}

- (unint64_t)totalPlayBacksInSpeech
{
  return *(unint64_t *)((char *)&self->_totalPlayBacks + 4);
}

- (void)setTotalPlayBacksInSpeech:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_totalPlayBacks + 4) = a3;
}

- (unint64_t)erasuresInSpeech
{
  return *(unint64_t *)((char *)&self->_totalPlayBacksInSpeech + 4);
}

- (void)setErasuresInSpeech:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_totalPlayBacksInSpeech + 4) = a3;
}

- (unint64_t)erasuresInSilence
{
  return *(unint64_t *)((char *)&self->_erasuresInSpeech + 4);
}

- (void)setErasuresInSilence:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_erasuresInSpeech + 4) = a3;
}

- (unint64_t)totalPacketsReceived
{
  return *(unint64_t *)((char *)&self->_erasuresInSilence + 4);
}

- (void)setTotalPacketsReceived:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_erasuresInSilence + 4) = a3;
}

- (unint64_t)speechPacketsReceived
{
  return *(unint64_t *)((char *)&self->_totalPacketsReceived + 4);
}

- (void)setSpeechPacketsReceived:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_totalPacketsReceived + 4) = a3;
}

- (unint64_t)sidPacketsReceived
{
  return *(unint64_t *)((char *)&self->_speechPacketsReceived + 4);
}

- (void)setSidPacketsReceived:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_speechPacketsReceived + 4) = a3;
}

- (unint64_t)silencePlayed
{
  return *(unint64_t *)((char *)&self->_sidPacketsReceived + 4);
}

- (void)setSilencePlayed:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_sidPacketsReceived + 4) = a3;
}

- (unint64_t)periodicRtt
{
  return *(unint64_t *)((char *)&self->_silencePlayed + 4);
}

- (void)setPeriodicRtt:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_silencePlayed + 4) = a3;
}

- (unint64_t)frameCountSinceRttReported
{
  return *(unint64_t *)((char *)&self->_periodicRtt + 4);
}

- (void)setFrameCountSinceRttReported:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_periodicRtt + 4) = a3;
}

- (unint64_t)txPacketsCount
{
  return *(unint64_t *)((char *)&self->_frameCountSinceRttReported + 4);
}

- (void)setTxPacketsCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_frameCountSinceRttReported + 4) = a3;
}

- (unint64_t)txPacketLoss
{
  return *(unint64_t *)((char *)&self->_txPacketsCount + 4);
}

- (void)setTxPacketLoss:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_txPacketsCount + 4) = a3;
}

- (unint64_t)frameCountCountSinceTxPacketLossReported
{
  return *(unint64_t *)((char *)&self->_txPacketLoss + 4);
}

- (void)setFrameCountCountSinceTxPacketLossReported:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_txPacketLoss + 4) = a3;
}

- (unint64_t)rxJitter
{
  return *(unint64_t *)((char *)&self->_frameCountCountSinceTxPacketLossReported + 4);
}

- (void)setRxJitter:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_frameCountCountSinceTxPacketLossReported + 4) = a3;
}

- (unint64_t)txJitter
{
  return *(unint64_t *)((char *)&self->_rxJitter + 4);
}

- (void)setTxJitter:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_rxJitter + 4) = a3;
}

- (unint64_t)frameCountSinceTxJitterUpdated
{
  return *(unint64_t *)((char *)&self->_txJitter + 4);
}

- (void)setFrameCountSinceTxJitterUpdated:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_txJitter + 4) = a3;
}

- (unint64_t)nominalJitterBufferQueueSize
{
  return *(unint64_t *)((char *)&self->_frameCountSinceTxJitterUpdated + 4);
}

- (void)setNominalJitterBufferQueueSize:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_frameCountSinceTxJitterUpdated + 4) = a3;
}

- (unint64_t)targetJitterBufferQueueSize
{
  return *(unint64_t *)((char *)&self->_nominalJitterBufferQueueSize + 4);
}

- (void)setTargetJitterBufferQueueSize:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_nominalJitterBufferQueueSize + 4) = a3;
}

- (unint64_t)timeStampRTPMetrics
{
  return *(unint64_t *)((char *)&self->_targetJitterBufferQueueSize + 4);
}

- (void)setTimeStampRTPMetrics:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_targetJitterBufferQueueSize + 4) = a3;
}

- (unint64_t)callIdPrimaryLatteCall
{
  return *(unint64_t *)((char *)&self->_timeStampRTPMetrics + 4);
}

- (void)setCallIdPrimaryLatteCall:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_timeStampRTPMetrics + 4) = a3;
}

- (BOOL)rtpMetricsReportingStarted
{
  return *((_BYTE *)&self->super.mProcessId + 5);
}

- (void)setRtpMetricsReportingStarted:(BOOL)a3
{
  *((_BYTE *)&self->super.mProcessId + 5) = a3;
}

- (unint64_t)primaryVideoPacketReceived
{
  return *(unint64_t *)((char *)&self->_callIdPrimaryLatteCall + 4);
}

- (void)setPrimaryVideoPacketReceived:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_callIdPrimaryLatteCall + 4) = a3;
}

- (unint64_t)primaryAudioPacketReceived
{
  return *(unint64_t *)((char *)&self->_primaryVideoPacketReceived + 4);
}

- (void)setPrimaryAudioPacketReceived:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_primaryVideoPacketReceived + 4) = a3;
}

- (unint64_t)totalVideoPacketReceived
{
  return *(unint64_t *)((char *)&self->_primaryAudioPacketReceived + 4);
}

- (void)setTotalVideoPacketReceived:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_primaryAudioPacketReceived + 4) = a3;
}

- (unint64_t)totalAudioPacketReceived
{
  return *(unint64_t *)((char *)&self->_totalVideoPacketReceived + 4);
}

- (void)setTotalAudioPacketReceived:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_totalVideoPacketReceived + 4) = a3;
}

- (unint64_t)audioPacketExpected
{
  return *(unint64_t *)((char *)&self->_totalAudioPacketReceived + 4);
}

- (void)setAudioPacketExpected:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_totalAudioPacketReceived + 4) = a3;
}

- (unint64_t)videoPacketExpected
{
  return *(unint64_t *)((char *)&self->_audioPacketExpected + 4);
}

- (void)setVideoPacketExpected:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_audioPacketExpected + 4) = a3;
}

- (float)primaryVideoPacketLossRate
{
  return *(float *)&self->_videoErasureSupported;
}

- (void)setPrimaryVideoPacketLossRate:(float)a3
{
  *(float *)&self->_videoErasureSupported = a3;
}

- (float)primaryAudioPacketLossRate
{
  return self->_primaryVideoPacketLossRate;
}

- (void)setPrimaryAudioPacketLossRate:(float)a3
{
  self->_primaryVideoPacketLossRate = a3;
}

- (float)totalVideoPacketLossRate
{
  return self->_primaryAudioPacketLossRate;
}

- (void)setTotalVideoPacketLossRate:(float)a3
{
  self->_primaryAudioPacketLossRate = a3;
}

- (float)totalAudioPacketLossRate
{
  return self->_totalVideoPacketLossRate;
}

- (void)setTotalAudioPacketLossRate:(float)a3
{
  self->_totalVideoPacketLossRate = a3;
}

- (BOOL)poorConnectionDetected
{
  return *((_BYTE *)&self->super.mProcessId + 6);
}

- (void)setPoorConnectionDetected:(BOOL)a3
{
  *((_BYTE *)&self->super.mProcessId + 6) = a3;
}

- (BOOL)mediaStallDetected
{
  return *((_BYTE *)&self->super.mProcessId + 7);
}

- (void)setMediaStallDetected:(BOOL)a3
{
  *((_BYTE *)&self->super.mProcessId + 7) = a3;
}

- (BOOL)videoErasureSupported
{
  return self->_isActiveClientFaceTime;
}

- (void)setVideoErasureSupported:(BOOL)a3
{
  self->_isActiveClientFaceTime = a3;
}

- (float)totalVideoErasure
{
  return self->_totalAudioPacketLossRate;
}

- (void)setTotalVideoErasure:(float)a3
{
  self->_totalAudioPacketLossRate = a3;
}

- (float)deltaVideoErasure
{
  return self->_totalVideoErasure;
}

- (void)setDeltaVideoErasure:(float)a3
{
  self->_totalVideoErasure = a3;
}

- (unint64_t)callType
{
  return *(unint64_t *)((char *)&self->_videoPacketExpected + 4);
}

- (void)setCallType:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_videoPacketExpected + 4) = a3;
}

- (unint64_t)reportedBandwitdh
{
  return *(unint64_t *)((char *)&self->_callType + 4);
}

- (void)setReportedBandwitdh:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_callType + 4) = a3;
}

- (unint64_t)targetBitRate
{
  return *(unint64_t *)((char *)&self->_reportedBandwitdh + 4);
}

- (void)setTargetBitRate:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_reportedBandwitdh + 4) = a3;
}

- (unint64_t)oneWayDealy
{
  return *(unint64_t *)((char *)&self->_targetBitRate + 4);
}

- (void)setOneWayDealy:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_targetBitRate + 4) = a3;
}

- (unint64_t)adaptationPaceketLoss
{
  return *(unint64_t *)((char *)&self->_oneWayDealy + 4);
}

- (void)setAdaptationPaceketLoss:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_oneWayDealy + 4) = a3;
}

@end
