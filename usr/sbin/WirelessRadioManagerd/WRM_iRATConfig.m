@implementation WRM_iRATConfig

- (int64_t)ctServiceType
{
  return self->_ctServiceType;
}

- (BOOL)symtompsMetricsEnabled
{
  return self->_symtompsMetricsEnabled;
}

- (int64_t)pingPongAvoidanceThresholdStationary
{
  return self->_pingPongAvoidanceThresholdStationary;
}

- (int64_t)minWiFiBeaconPerTh1
{
  return self->_minWiFiBeaconPerTh1;
}

- (int64_t)minMovSigBarTh0
{
  return self->_minMovSigBarTh0;
}

- (int64_t)minIdleWiFiTxPktLossRateTh1
{
  return self->_minIdleWiFiTxPktLossRateTh1;
}

- (int64_t)minIdleWiFiSnrTh1
{
  return self->_minIdleWiFiSnrTh1;
}

- (int64_t)minIdleWiFiRssiTh1
{
  return self->_minIdleWiFiRssiTh1;
}

- (int64_t)minIdleWiFiCcaTh1
{
  return self->_minIdleWiFiCcaTh1;
}

- (int64_t)minActiveWiFiTxPktLossRateTh1
{
  return self->_minActiveWiFiTxPktLossRateTh1;
}

- (int64_t)dataWifiMinBeaconCount
{
  return self->_dataWifiMinBeaconCount;
}

- (WRM_iRATConfig)init
{
  WRM_iRATConfig *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WRM_iRATConfig;
  v2 = -[WRM_iRATConfig init](&v4, "init");
  -[WRM_iRATConfig loadDefaultsParam](v2, "loadDefaultsParam");
  -[WRM_iRATConfig loadiRATConfigurablePolicy](v2, "loadiRATConfigurablePolicy");
  return v2;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WRM_iRATConfig;
  -[WRM_iRATConfig dealloc](&v2, "dealloc");
}

- (void)loadDefaultsParam
{
  -[WRM_iRATConfig setHandoverAlgorithmType:](self, "setHandoverAlgorithmType:", 0);
  -[WRM_iRATConfig setCtServiceType:](self, "setCtServiceType:", 0);
  -[WRM_iRATConfig setHandoverAlgorithmSettingDynamic:](self, "setHandoverAlgorithmSettingDynamic:", 1);
  -[WRM_iRATConfig setPingPongAvoidanceThresholdStationary:](self, "setPingPongAvoidanceThresholdStationary:", 5000);
  -[WRM_iRATConfig setPingPongAvoidanceThresholdWalking:](self, "setPingPongAvoidanceThresholdWalking:", 1000);
  -[WRM_iRATConfig setPingPongAvoidanceThresholdRunning:](self, "setPingPongAvoidanceThresholdRunning:", 200);
  -[WRM_iRATConfig setCellularStickinessThreaholdIdle:](self, "setCellularStickinessThreaholdIdle:", 5000);
  -[WRM_iRATConfig setCellularStickinessThreaholdActive:](self, "setCellularStickinessThreaholdActive:", 5000);
  -[WRM_iRATConfig setCellularStickinessThreaholdStationary:](self, "setCellularStickinessThreaholdStationary:", 5000);
  -[WRM_iRATConfig setCellularStickinessThreaholdStationaryActive:](self, "setCellularStickinessThreaholdStationaryActive:", 5000);
  -[WRM_iRATConfig setRtpMetricsEnabled:](self, "setRtpMetricsEnabled:", 1);
  -[WRM_iRATConfig setWifiMetricsEnabled:](self, "setWifiMetricsEnabled:", 1);
  -[WRM_iRATConfig setCellularMetricsEnabled:](self, "setCellularMetricsEnabled:", 1);
  -[WRM_iRATConfig setSymtompsMetricsEnabled:](self, "setSymtompsMetricsEnabled:", 1);
  -[WRM_iRATConfig setIdsMetricsEnabled:](self, "setIdsMetricsEnabled:", 1);
  -[WRM_iRATConfig setP2pAssistanceEnabled:](self, "setP2pAssistanceEnabled:", 0);
  -[WRM_iRATConfig setBtMetricsEnabled:](self, "setBtMetricsEnabled:", 1);
  -[WRM_iRATConfig setMobilityStateAwarenessEnabled:](self, "setMobilityStateAwarenessEnabled:", 1);
  -[WRM_iRATConfig setQmiClientEnabled:](self, "setQmiClientEnabled:", 1);
  -[WRM_iRATConfig setPeriodicReportInterval:](self, "setPeriodicReportInterval:", 40);
  -[WRM_iRATConfig setHandoverRTThreshold:](self, "setHandoverRTThreshold:", 300);
  -[WRM_iRATConfig setHandoverRxJitterThreshold:](self, "setHandoverRxJitterThreshold:", 200);
  -[WRM_iRATConfig setHandoverRxPktLossThreshold:](self, "setHandoverRxPktLossThreshold:", 2);
  -[WRM_iRATConfig setHandoverAvgRxPktLossThreshold:](self, "setHandoverAvgRxPktLossThreshold:", 10);
  -[WRM_iRATConfig setHandoverAvgIdleRxPktLossThreshold:](self, "setHandoverAvgIdleRxPktLossThreshold:", 30);
  -[WRM_iRATConfig setHandoverTxPktLossThreshold:](self, "setHandoverTxPktLossThreshold:", 2);
  -[WRM_iRATConfig setHandoverNominalJitterBufferThreshold:](self, "setHandoverNominalJitterBufferThreshold:", 1000);
  -[WRM_iRATConfig setMinActiveWiFiSnrTh0:](self, "setMinActiveWiFiSnrTh0:", 16);
  -[WRM_iRATConfig setMinActiveWiFiSnrTh1:](self, "setMinActiveWiFiSnrTh1:", 16);
  -[WRM_iRATConfig setMinActiveWiFiRssiTh0:](self, "setMinActiveWiFiRssiTh0:", -85);
  -[WRM_iRATConfig setMinActiveWiFiRssiTh1:](self, "setMinActiveWiFiRssiTh1:", -85);
  -[WRM_iRATConfig setMinActiveWiFiCcaTh0:](self, "setMinActiveWiFiCcaTh0:", 20);
  -[WRM_iRATConfig setMinActiveWiFiCcaTh1:](self, "setMinActiveWiFiCcaTh1:", 20);
  -[WRM_iRATConfig setMinIdleWiFiSnrTh0:](self, "setMinIdleWiFiSnrTh0:", 16);
  -[WRM_iRATConfig setMinIdleWiFiSnrTh1:](self, "setMinIdleWiFiSnrTh1:", 16);
  -[WRM_iRATConfig setMinIdleWiFiRssiTh0:](self, "setMinIdleWiFiRssiTh0:", -85);
  -[WRM_iRATConfig setMinIdleWiFiRssiTh1:](self, "setMinIdleWiFiRssiTh1:", -85);
  -[WRM_iRATConfig setMinIdleWiFiCcaTh0:](self, "setMinIdleWiFiCcaTh0:", 20);
  -[WRM_iRATConfig setMinIdleWiFiCcaTh1:](self, "setMinIdleWiFiCcaTh1:", 20);
  -[WRM_iRATConfig setIdsMinWiFiRssiTh0:](self, "setIdsMinWiFiRssiTh0:", -70);
  -[WRM_iRATConfig setIdsMinWiFiRssiTh1:](self, "setIdsMinWiFiRssiTh1:", -80);
  -[WRM_iRATConfig setIdsMinWiFiSnrTh0:](self, "setIdsMinWiFiSnrTh0:", 15);
  -[WRM_iRATConfig setIdsMinWiFiSnrTh1:](self, "setIdsMinWiFiSnrTh1:", 5);
  -[WRM_iRATConfig setIdsMinAvgWiFiTxPktLossRateTh0:](self, "setIdsMinAvgWiFiTxPktLossRateTh0:", 0);
  -[WRM_iRATConfig setIdsMinAvgWiFiTxPktLossRateTh1:](self, "setIdsMinAvgWiFiTxPktLossRateTh1:", 20);
  -[WRM_iRATConfig setIdsMinWiFiThroughputTh0:](self, "setIdsMinWiFiThroughputTh0:", 3);
  -[WRM_iRATConfig setIdsMinWiFiThroughputTh1:](self, "setIdsMinWiFiThroughputTh1:", 1);
  -[WRM_iRATConfig setIdsMinWiFiEffectivePhyRateTh0:](self, "setIdsMinWiFiEffectivePhyRateTh0:", 12);
  -[WRM_iRATConfig setIdsMinWiFiEffectivePhyRateTh1:](self, "setIdsMinWiFiEffectivePhyRateTh1:", 6);
  -[WRM_iRATConfig setIdsPeriodicReportInterval:](self, "setIdsPeriodicReportInterval:", 5000);
  -[WRM_iRATConfig setIdsWiFiMinRttTh1:](self, "setIdsWiFiMinRttTh1:", 5000);
  -[WRM_iRATConfig setIdsBTMinRttTh1:](self, "setIdsBTMinRttTh1:", 3000);
  -[WRM_iRATConfig setIdsWiFiMinPerTh1:](self, "setIdsWiFiMinPerTh1:", 40);
  -[WRM_iRATConfig setIdsAvgWiFiMinPerTh1:](self, "setIdsAvgWiFiMinPerTh1:", 40);
  -[WRM_iRATConfig setIdsMovAvgWiFiMinPerTh1:](self, "setIdsMovAvgWiFiMinPerTh1:", 40);
  -[WRM_iRATConfig setIdsBTMinPerTh1:](self, "setIdsBTMinPerTh1:", 40);
  -[WRM_iRATConfig setMinActiveWiFiTxPktLossRateTh0:](self, "setMinActiveWiFiTxPktLossRateTh0:", 30);
  -[WRM_iRATConfig setMinActiveWiFiTxPktLossRateTh1:](self, "setMinActiveWiFiTxPktLossRateTh1:", 30);
  -[WRM_iRATConfig setMinActiveWiFiAvgTxPktLossRateTh:](self, "setMinActiveWiFiAvgTxPktLossRateTh:", 10);
  -[WRM_iRATConfig setMinIdleWiFiTxPktLossRateTh0:](self, "setMinIdleWiFiTxPktLossRateTh0:", 30);
  -[WRM_iRATConfig setMinIdleWiFiTxPktLossRateTh1:](self, "setMinIdleWiFiTxPktLossRateTh1:", 30);
  -[WRM_iRATConfig setMinIdleWiFiFwTxPktLossRateTh0:](self, "setMinIdleWiFiFwTxPktLossRateTh0:", 30);
  -[WRM_iRATConfig setMinIdleWiFiFwTxPktLossRateTh1:](self, "setMinIdleWiFiFwTxPktLossRateTh1:", 30);
  -[WRM_iRATConfig setMinWiFiBeaconPerTh0:](self, "setMinWiFiBeaconPerTh0:", 80);
  -[WRM_iRATConfig setMinWiFiBeaconPerTh1:](self, "setMinWiFiBeaconPerTh1:", 80);
  -[WRM_iRATConfig setSnrHysterisisWalking:](self, "setSnrHysterisisWalking:", 3);
  -[WRM_iRATConfig setSnrHysterisisRunning:](self, "setSnrHysterisisRunning:", 6);
  -[WRM_iRATConfig setRssiHysterisisWalking:](self, "setRssiHysterisisWalking:", 3);
  -[WRM_iRATConfig setRssiHysterisisRunning:](self, "setRssiHysterisisRunning:", 6);
  -[WRM_iRATConfig setDataMinBtRssiTh0:](self, "setDataMinBtRssiTh0:", -60);
  -[WRM_iRATConfig setDataMinBtRssiTh1:](self, "setDataMinBtRssiTh1:", -80);
  -[WRM_iRATConfig setDataBtMovingAvgAlphaDenum:](self, "setDataBtMovingAvgAlphaDenum:", 30);
  -[WRM_iRATConfig setDataBtStickinessTimeThreshMs:](self, "setDataBtStickinessTimeThreshMs:", 30000);
  -[WRM_iRATConfig setDataMinWifiRssiTh0:](self, "setDataMinWifiRssiTh0:", -70);
  -[WRM_iRATConfig setDataMinWifiSnrTh0:](self, "setDataMinWifiSnrTh0:", 10);
  -[WRM_iRATConfig setDataMinWifiRssiTh1:](self, "setDataMinWifiRssiTh1:", -85);
  -[WRM_iRATConfig setDataMinWifiSnrTh1:](self, "setDataMinWifiSnrTh1:", 5);
  -[WRM_iRATConfig setDataMinWifiBeaconPerTh0:](self, "setDataMinWifiBeaconPerTh0:", 51);
  -[WRM_iRATConfig setDataWifiMinBeaconCount:](self, "setDataWifiMinBeaconCount:", 2);
  -[WRM_iRATConfig setMinSigBarTh0:](self, "setMinSigBarTh0:", 4);
  -[WRM_iRATConfig setMinMovSigBarTh0:](self, "setMinMovSigBarTh0:", 35);
  -[WRM_iRATConfig setMinSigBarTh1:](self, "setMinSigBarTh1:", 1);
  -[WRM_iRATConfig setMinSigBarTh2:](self, "setMinSigBarTh2:", 3);
  -[WRM_iRATConfig setSosWaypointRSRPTh:](self, "setSosWaypointRSRPTh:", -115);
  -[WRM_iRATConfig setTransportMetricsRateLimitingThreshold:](self, "setTransportMetricsRateLimitingThreshold:", 5000);
  -[WRM_iRATConfig setTcpJitterThreshold:](self, "setTcpJitterThreshold:", 100);
  -[WRM_iRATConfig setTcpRttThreshold:](self, "setTcpRttThreshold:", 200);
  -[WRM_iRATConfig setTcpIdleConnSuccessThreshold:](self, "setTcpIdleConnSuccessThreshold:", 50);
  -[WRM_iRATConfig setTcpActiveConnSuccessThreshold:](self, "setTcpActiveConnSuccessThreshold:", 80);
  -[WRM_iRATConfig setHistoricalAgeOfConnectedLinkInDays:](self, "setHistoricalAgeOfConnectedLinkInDays:", 1);
  -[WRM_iRATConfig setFaceTimeCellularStickinessThreaholdActive:](self, "setFaceTimeCellularStickinessThreaholdActive:", 20000);
  -[WRM_iRATConfig setFaceTimeMinActiveWiFiAvgTxPktLossRateTh:](self, "setFaceTimeMinActiveWiFiAvgTxPktLossRateTh:", 10);
  -[WRM_iRATConfig setFaceTimeHandoverAvgRxPktLossThreshold:](self, "setFaceTimeHandoverAvgRxPktLossThreshold:", 10);
  -[WRM_iRATConfig setFaceTimeHandoverRxPktLossThreshold:](self, "setFaceTimeHandoverRxPktLossThreshold:", 2);
  -[WRM_iRATConfig setFaceTimeMinActiveWiFiRssiTh1:](self, "setFaceTimeMinActiveWiFiRssiTh1:", -85);
  -[WRM_iRATConfig setFaceTimeMinActiveWiFiRssiTh0:](self, "setFaceTimeMinActiveWiFiRssiTh0:", -70);
  -[WRM_iRATConfig setFaceTimeEnhancedVideoMetricsEnabled:](self, "setFaceTimeEnhancedVideoMetricsEnabled:", 0);
  -[WRM_iRATConfig setFaceTimeMovingAverageWindow:](self, "setFaceTimeMovingAverageWindow:", 20);
  -[WRM_iRATConfig setFaceTimeVideoPacketLoss:](self, "setFaceTimeVideoPacketLoss:", 2);
  -[WRM_iRATConfig setFaceTimeAleratedModeRssiTh1:](self, "setFaceTimeAleratedModeRssiTh1:", -75);
  -[WRM_iRATConfig setFaceTimeAleratedModeRssiTh0:](self, "setFaceTimeAleratedModeRssiTh0:", -70);
  -[WRM_iRATConfig setFaceTimeAleratedModeCCATh1:](self, "setFaceTimeAleratedModeCCATh1:", 80);
  -[WRM_iRATConfig setFaceTimeAleratedModeCCATh0:](self, "setFaceTimeAleratedModeCCATh0:", 70);
  -[WRM_iRATConfig setFaceTimeAleratedModeStationCount:](self, "setFaceTimeAleratedModeStationCount:", 15);
  -[WRM_iRATConfig setFaceTimeAleratedModeVideoErasures:](self, "setFaceTimeAleratedModeVideoErasures:", 5);
  -[WRM_iRATConfig setFaceTimeAleratedModeTxPer1:](self, "setFaceTimeAleratedModeTxPer1:", 15);
  -[WRM_iRATConfig setFaceTimeAleratedModeTxPer0:](self, "setFaceTimeAleratedModeTxPer0:", 0);
  -[WRM_iRATConfig setCommCenterStickinessThreasholdWiFiProximity:](self, "setCommCenterStickinessThreasholdWiFiProximity:", 60000);
  -[WRM_iRATConfig setCommCenterStickinessThreasholdNotinWiFiProximity:](self, "setCommCenterStickinessThreasholdNotinWiFiProximity:", 20000);
  -[WRM_iRATConfig setCommCenterThumperStickinessThreasholdNotinBTProximity:](self, "setCommCenterThumperStickinessThreasholdNotinBTProximity:", 15000);
  -[WRM_iRATConfig setCommCenterBTlpmThreasholdBTProximity:](self, "setCommCenterBTlpmThreasholdBTProximity:", 40);
  -[WRM_iRATConfig setCommCenterAppDebouncingTimer:](self, "setCommCenterAppDebouncingTimer:", 2);
  -[WRM_iRATConfig setCommCenterPeriodicBreadCrumTimer:](self, "setCommCenterPeriodicBreadCrumTimer:", 58);
  -[WRM_iRATConfig setCommCenterBreadCrumProcTimer:](self, "setCommCenterBreadCrumProcTimer:", 2);
  -[WRM_iRATConfig setCbrsEnterRsrpMin:](self, "setCbrsEnterRsrpMin:", -111);
  -[WRM_iRATConfig setCbrsEnterRsrqMin:](self, "setCbrsEnterRsrqMin:", -16);
  -[WRM_iRATConfig setCbrsExitRsrpMin:](self, "setCbrsExitRsrpMin:", -119);
  -[WRM_iRATConfig setCbrsExitRsrqMin:](self, "setCbrsExitRsrqMin:", -18);
  -[WRM_iRATConfig setNonCbrsEnterRsrpMin:](self, "setNonCbrsEnterRsrpMin:", -116);
  -[WRM_iRATConfig setNonCbrsEnterRsrqMin:](self, "setNonCbrsEnterRsrqMin:", -18);
  -[WRM_iRATConfig setNonCbrsExitRsrpMin:](self, "setNonCbrsExitRsrpMin:", -119);
  -[WRM_iRATConfig setNonCbrsExitRsrqMin:](self, "setNonCbrsExitRsrqMin:", -30);
  -[WRM_iRATConfig setCbrsEnterRsrpOffset:](self, "setCbrsEnterRsrpOffset:", 6);
  -[WRM_iRATConfig setCbrsEnterRsrqOffset:](self, "setCbrsEnterRsrqOffset:", 1);
  -[WRM_iRATConfig setCbrsExitRsrpOffset:](self, "setCbrsExitRsrpOffset:", 11);
  -[WRM_iRATConfig setCbrsExitRsrqOffset:](self, "setCbrsExitRsrqOffset:", 1);
}

- (void)printiRATConfig
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Handover Algorithm Type  : %lld"), -[WRM_iRATConfig handoverAlgorithmType](self, "handoverAlgorithmType"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Handover Algorithm Type Setting Dynamic : %d"), -[WRM_iRATConfig handoverAlgorithmSettingDynamic](self, "handoverAlgorithmSettingDynamic"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("PingPongAvoidanceThresholdStationary : %lld"), -[WRM_iRATConfig pingPongAvoidanceThresholdStationary](self, "pingPongAvoidanceThresholdStationary"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("PingPongAvoidanceThresholdWalking : %lld"), -[WRM_iRATConfig pingPongAvoidanceThresholdWalking](self, "pingPongAvoidanceThresholdWalking"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("PingPongAvoidanceThresholdRunning : %lld"), -[WRM_iRATConfig pingPongAvoidanceThresholdRunning](self, "pingPongAvoidanceThresholdRunning"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("CellularStickinessThreaholdIdle : %lld"), -[WRM_iRATConfig cellularStickinessThreaholdIdle](self, "cellularStickinessThreaholdIdle"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("CellularStickinessThreaholdActive : %lld"), -[WRM_iRATConfig cellularStickinessThreaholdActive](self, "cellularStickinessThreaholdActive"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("CellularStickinessThreaholdStationary : %lld"), -[WRM_iRATConfig cellularStickinessThreaholdStationary](self, "cellularStickinessThreaholdStationary"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("CellularStickinessThreaholdStationaryActive : %lld"), -[WRM_iRATConfig cellularStickinessThreaholdStationaryActive](self, "cellularStickinessThreaholdStationaryActive"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("RTP metrics Enabled status  : %d"), -[WRM_iRATConfig rtpMetricsEnabled](self, "rtpMetricsEnabled"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("WiFi metrics enabled status : %d"), -[WRM_iRATConfig wifiMetricsEnabled](self, "wifiMetricsEnabled"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Cellular metrics enabled status  : %d"), -[WRM_iRATConfig cellularMetricsEnabled](self, "cellularMetricsEnabled"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Symtomps Metrics Enabled status  : %d"), -[WRM_iRATConfig symtompsMetricsEnabled](self, "symtompsMetricsEnabled"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("IDS Metrics Enabled status  : %d"), -[WRM_iRATConfig idsMetricsEnabled](self, "idsMetricsEnabled"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("BT Metrics Enabled status  : %d"), -[WRM_iRATConfig btMetricsEnabled](self, "btMetricsEnabled"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Mobility State Use State Enabled  : %d"), -[WRM_iRATConfig mobilityStateAwarenessEnabled](self, "mobilityStateAwarenessEnabled"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("QMI Client Enabled : %d"), -[WRM_iRATConfig qmiClientEnabled](self, "qmiClientEnabled"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("p2p assistance info enabled status : %d"), -[WRM_iRATConfig p2pAssistanceEnabled](self, "p2pAssistanceEnabled"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("RTP metrics reporting Period : %lld"), -[WRM_iRATConfig periodicReportInterval](self, "periodicReportInterval"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Min handover RTP RTT Threshold  : %lld"), -[WRM_iRATConfig handoverRTThreshold](self, "handoverRTThreshold"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Min handover rx Jitter Threshold  : %lld"), -[WRM_iRATConfig handoverRxJitterThreshold](self, "handoverRxJitterThreshold"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Min handover rx Pkt Loss Threshold  : %lld"), -[WRM_iRATConfig handoverRxPktLossThreshold](self, "handoverRxPktLossThreshold"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Min handover avg rx Pkt Loss Threshold  : %lld"), -[WRM_iRATConfig handoverAvgRxPktLossThreshold](self, "handoverAvgRxPktLossThreshold"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Min handover avg total rx Pkt Loss Threshold  : %lld"), -[WRM_iRATConfig handoverAvgIdleRxPktLossThreshold](self, "handoverAvgIdleRxPktLossThreshold"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Min Handover tx Pky Loss Threshold  : %lld"), -[WRM_iRATConfig handoverTxPktLossThreshold](self, "handoverTxPktLossThreshold"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Min Handover nominal jitter buffer Threshold  : %lld"), -[WRM_iRATConfig handoverNominalJitterBufferThreshold](self, "handoverNominalJitterBufferThreshold"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Min active WiFi SNR Th0  : %lld"), -[WRM_iRATConfig minActiveWiFiSnrTh0](self, "minActiveWiFiSnrTh0"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Min active WiFi SNR Th1  : %lld"), -[WRM_iRATConfig minActiveWiFiSnrTh1](self, "minActiveWiFiSnrTh1"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Min active WiFi RSSI Th0  : %lld"), -[WRM_iRATConfig minActiveWiFiRssiTh0](self, "minActiveWiFiRssiTh0"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Min active WiFi RSSI Th1  : %lld"), -[WRM_iRATConfig minActiveWiFiRssiTh1](self, "minActiveWiFiRssiTh1"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Min active WiFi CCA Th0 : %lld"), -[WRM_iRATConfig minActiveWiFiCcaTh0](self, "minActiveWiFiCcaTh0"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Min active WiFi CCA Th1 : %lld"), -[WRM_iRATConfig minActiveWiFiCcaTh1](self, "minActiveWiFiCcaTh1"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Min idle WiFi SNR Th0  : %lld"), -[WRM_iRATConfig minIdleWiFiSnrTh0](self, "minIdleWiFiSnrTh0"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Min idle WiFi SNR Th1  : %lld"), -[WRM_iRATConfig minIdleWiFiSnrTh1](self, "minIdleWiFiSnrTh1"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Min idle WiFi RSSI Th0  : %lld"), -[WRM_iRATConfig minIdleWiFiRssiTh0](self, "minIdleWiFiRssiTh0"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Min idle WiFi RSSI Th1  : %lld"), -[WRM_iRATConfig minIdleWiFiRssiTh1](self, "minIdleWiFiRssiTh1"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Min idle WiFi CCA Th0 : %lld"), -[WRM_iRATConfig minIdleWiFiCcaTh0](self, "minIdleWiFiCcaTh0"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Min idle WiFi CCA Th1 : %lld"), -[WRM_iRATConfig minIdleWiFiCcaTh1](self, "minIdleWiFiCcaTh1"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Min Active WiFiTxPktLossRate Th0  : %lld"), -[WRM_iRATConfig minActiveWiFiTxPktLossRateTh0](self, "minActiveWiFiTxPktLossRateTh0"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Min Active WiFiTxPktLossRate Th1  : %lld"), -[WRM_iRATConfig minActiveWiFiTxPktLossRateTh1](self, "minActiveWiFiTxPktLossRateTh1"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Min Active WiFiAvgTxPktLossRateTh : %lld"), -[WRM_iRATConfig minActiveWiFiAvgTxPktLossRateTh](self, "minActiveWiFiAvgTxPktLossRateTh"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Min Idle WiFiTxPktLossRate Th0  : %lld"), -[WRM_iRATConfig minIdleWiFiTxPktLossRateTh0](self, "minIdleWiFiTxPktLossRateTh0"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Min Idle WiFiTxPktLossRate Th1  : %lld"), -[WRM_iRATConfig minIdleWiFiTxPktLossRateTh1](self, "minIdleWiFiTxPktLossRateTh1"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Min Idle WiFiFwTxPktLossRate Th0  : %lld"), -[WRM_iRATConfig minIdleWiFiFwTxPktLossRateTh0](self, "minIdleWiFiFwTxPktLossRateTh0"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Min Idle WiFiFwTxPktLossRate Th1  : %lld"), -[WRM_iRATConfig minIdleWiFiFwTxPktLossRateTh1](self, "minIdleWiFiFwTxPktLossRateTh1"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Min Active WiFi Beacon Per Th0  : %lld"), -[WRM_iRATConfig minWiFiBeaconPerTh0](self, "minWiFiBeaconPerTh0"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Min Active WiFi Beacon Per Th1  : %lld"), -[WRM_iRATConfig minWiFiBeaconPerTh1](self, "minWiFiBeaconPerTh1"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Snr Hysterisis Walking : %lld"), -[WRM_iRATConfig snrHysterisisWalking](self, "snrHysterisisWalking"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("SNR Hysterisis Running  : %lld"), -[WRM_iRATConfig snrHysterisisRunning](self, "snrHysterisisRunning"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("RSSI Hysterisis Walking  : %lld"), -[WRM_iRATConfig rssiHysterisisWalking](self, "rssiHysterisisWalking"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("RSSI Hysterisis Running  : %lld"), -[WRM_iRATConfig rssiHysterisisRunning](self, "rssiHysterisisRunning"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Min BT RSSI Th0 %lld"), -[WRM_iRATConfig dataMinBtRssiTh0](self, "dataMinBtRssiTh0"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Min BT RSSI Th1 %lld"), -[WRM_iRATConfig dataMinBtRssiTh1](self, "dataMinBtRssiTh1"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("BT Moving Avg Alpha Denum %lld"), -[WRM_iRATConfig dataBtMovingAvgAlphaDenum](self, "dataBtMovingAvgAlphaDenum"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("BT Stickiness Time threshold %lld ms"), -[WRM_iRATConfig dataBtStickinessTimeThreshMs](self, "dataBtStickinessTimeThreshMs"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Wifi RSSI Th0 %lld"), -[WRM_iRATConfig dataMinWifiRssiTh0](self, "dataMinWifiRssiTh0"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Wifi SNR Th0 %lld"), -[WRM_iRATConfig dataMinWifiSnrTh0](self, "dataMinWifiSnrTh0"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Min Wifi RSSI Th0 %lld"), -[WRM_iRATConfig dataMinWifiRssiTh1](self, "dataMinWifiRssiTh1"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Min Wifi SNR Th0 %lld"), -[WRM_iRATConfig dataMinWifiSnrTh1](self, "dataMinWifiSnrTh1"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Min Wifi Beacon Per Th0 %lld"), -[WRM_iRATConfig dataMinWifiBeaconPerTh0](self, "dataMinWifiBeaconPerTh0"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Min Wifi valid Beacon count %lld"), -[WRM_iRATConfig dataWifiMinBeaconCount](self, "dataWifiMinBeaconCount"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Min Cellular Sigal Bar Th0  :%lld"), -[WRM_iRATConfig minSigBarTh0](self, "minSigBarTh0"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Min Mov Cell Sigal Bar Th0  :%lld"), -[WRM_iRATConfig minMovSigBarTh0](self, "minMovSigBarTh0"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Min Cellular Sigal Bar Th1  : %lld"), -[WRM_iRATConfig minSigBarTh1](self, "minSigBarTh1"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Min Cellular Sigal Bar Th2  : %lld"), -[WRM_iRATConfig minSigBarTh2](self, "minSigBarTh2"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("SOS Waypoint RSRP Th  : %lld"), -[WRM_iRATConfig sosWaypointRSRPTh](self, "sosWaypointRSRPTh"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Transport metrics rate limiting threshold: %lld"), -[WRM_iRATConfig transportMetricsRateLimitingThreshold](self, "transportMetricsRateLimitingThreshold"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("TCP Jitter threshold: %lld"), -[WRM_iRATConfig tcpJitterThreshold](self, "tcpJitterThreshold"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("TCP Rtt threshold: %lld"), -[WRM_iRATConfig tcpRttThreshold](self, "tcpRttThreshold"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("TCP Idle Conn Success threshold: %lld"), -[WRM_iRATConfig tcpIdleConnSuccessThreshold](self, "tcpIdleConnSuccessThreshold"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("TCP Active Conn Sucess threshold: %lld"), -[WRM_iRATConfig tcpActiveConnSuccessThreshold](self, "tcpActiveConnSuccessThreshold"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("TCP Histrocial Age of Connected link: %lld"), -[WRM_iRATConfig historicalAgeOfConnectedLinkInDays](self, "historicalAgeOfConnectedLinkInDays"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("IDS Min WIFI RSSI TH0 %lld"), -[WRM_iRATConfig idsMinWiFiRssiTh0](self, "idsMinWiFiRssiTh0"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("IDS Min WIFI RSSI TH1 %lld"), -[WRM_iRATConfig idsMinWiFiRssiTh1](self, "idsMinWiFiRssiTh1"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("IDS Min WIFI SNR TH0 %lld"), -[WRM_iRATConfig idsMinWiFiSnrTh0](self, "idsMinWiFiSnrTh0"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("IDS Min WIFI SNR TH1 %lld"), -[WRM_iRATConfig idsMinWiFiSnrTh1](self, "idsMinWiFiSnrTh1"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("IDS Min AVG TX PER TH0 %lld"), -[WRM_iRATConfig idsMinAvgWiFiTxPktLossRateTh0](self, "idsMinAvgWiFiTxPktLossRateTh0"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("IDS Min AVG TX PER TH1 %lld"), -[WRM_iRATConfig idsMinAvgWiFiTxPktLossRateTh1](self, "idsMinAvgWiFiTxPktLossRateTh1"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("IDS Min WIFI THROUGHPUT TH0 %lld"), -[WRM_iRATConfig idsMinWiFiThroughputTh0](self, "idsMinWiFiThroughputTh0"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("IDS Min WIFI THROUGHPUT TH1 %lld"), -[WRM_iRATConfig idsMinWiFiThroughputTh1](self, "idsMinWiFiThroughputTh1"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("IDS Min WIFI PHYRATE TH0 %lld"), -[WRM_iRATConfig idsMinWiFiEffectivePhyRateTh0](self, "idsMinWiFiEffectivePhyRateTh0"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("IDS Min WIFI PHYRATE TH1 %lld"), -[WRM_iRATConfig idsMinWiFiEffectivePhyRateTh1](self, "idsMinWiFiEffectivePhyRateTh1"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("IDS Periodic Reporting Timer %lld"), -[WRM_iRATConfig idsPeriodicReportInterval](self, "idsPeriodicReportInterval"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("IDS WIFI RTT Th1 %lld"), -[WRM_iRATConfig idsWiFiMinRttTh1](self, "idsWiFiMinRttTh1"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("IDS BT RTT TH1  %lld"), -[WRM_iRATConfig idsBTMinRttTh1](self, "idsBTMinRttTh1"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("IDS WIFI PER Th1 %lld"), -[WRM_iRATConfig idsWiFiMinPerTh1](self, "idsWiFiMinPerTh1"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("IDS WIFI AVG PER Th1 %lld"), -[WRM_iRATConfig idsAvgWiFiMinPerTh1](self, "idsAvgWiFiMinPerTh1"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("IDS WIFI Mov AVG PER Th1 %lld"), -[WRM_iRATConfig idsMovAvgWiFiMinPerTh1](self, "idsMovAvgWiFiMinPerTh1"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("IDS BT PER TH1 %lld"), -[WRM_iRATConfig idsBTMinPerTh1](self, "idsBTMinPerTh1"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Facetime Cellular Stickiness Timer %lld"), -[WRM_iRATConfig faceTimeCellularStickinessThreaholdActive](self, "faceTimeCellularStickinessThreaholdActive"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Facetime Average TX PER th %lld"), -[WRM_iRATConfig faceTimeMinActiveWiFiAvgTxPktLossRateTh](self, "faceTimeMinActiveWiFiAvgTxPktLossRateTh"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Facetime Average RX PER th %lld"), -[WRM_iRATConfig faceTimeHandoverAvgRxPktLossThreshold](self, "faceTimeHandoverAvgRxPktLossThreshold"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Facetime Handover RX PER th %lld"), -[WRM_iRATConfig faceTimeHandoverRxPktLossThreshold](self, "faceTimeHandoverRxPktLossThreshold"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Facetime Handover RSSI TH1 %lld"), -[WRM_iRATConfig faceTimeMinActiveWiFiRssiTh1](self, "faceTimeMinActiveWiFiRssiTh1"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Facetime Handover RSSI TH0 %lld"), -[WRM_iRATConfig faceTimeMinActiveWiFiRssiTh0](self, "faceTimeMinActiveWiFiRssiTh0"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Facetime Enhanced Video RTP metrics enabled %lld"), -[WRM_iRATConfig faceTimeEnhancedVideoMetricsEnabled](self, "faceTimeEnhancedVideoMetricsEnabled"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Facetime moving average window size %lld"), -[WRM_iRATConfig faceTimeMovingAverageWindow](self, "faceTimeMovingAverageWindow"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Facetime video packet loss thld %lld"), -[WRM_iRATConfig faceTimeVideoPacketLoss](self, "faceTimeVideoPacketLoss"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Facetime alerated mode entry RSSI %lld"), -[WRM_iRATConfig faceTimeAleratedModeRssiTh1](self, "faceTimeAleratedModeRssiTh1"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Facetime alerated mode exit RSSI %lld"), -[WRM_iRATConfig faceTimeAleratedModeRssiTh0](self, "faceTimeAleratedModeRssiTh0"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Facetime alerated mode entry CCA %lld"), -[WRM_iRATConfig faceTimeAleratedModeCCATh1](self, "faceTimeAleratedModeCCATh1"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Facetime alerated mode exit CCA %lld"), -[WRM_iRATConfig faceTimeAleratedModeCCATh0](self, "faceTimeAleratedModeCCATh0"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Facetime alerated mode entry station count %lld"), -[WRM_iRATConfig faceTimeAleratedModeStationCount](self, "faceTimeAleratedModeStationCount"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Facetime alerated mode entry video erasures %lld"), -[WRM_iRATConfig faceTimeAleratedModeVideoErasures](self, "faceTimeAleratedModeVideoErasures"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Facetime alerated mode entry TXPER %lld"), -[WRM_iRATConfig faceTimeAleratedModeTxPer1](self, "faceTimeAleratedModeTxPer1"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Facetime alerated mode exit  TXPER %lld"), -[WRM_iRATConfig faceTimeAleratedModeTxPer0](self, "faceTimeAleratedModeTxPer0"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("CommCenter Stickiness Threashold WiFiProximity %lld"), -[WRM_iRATConfig commCenterStickinessThreasholdWiFiProximity](self, "commCenterStickinessThreasholdWiFiProximity"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("CommCenter Stickiness Threashold NotinWiFiProximity %lld"), -[WRM_iRATConfig commCenterStickinessThreasholdNotinWiFiProximity](self, "commCenterStickinessThreasholdNotinWiFiProximity"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("CommCenter Thumper Stickiness Threashold NotinBTProximity %lld"), -[WRM_iRATConfig commCenterThumperStickinessThreasholdNotinBTProximity](self, "commCenterThumperStickinessThreasholdNotinBTProximity"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("CommCenter BT LPM Threashold BT Proximity %lld"), -[WRM_iRATConfig commCenterBTlpmThreasholdBTProximity](self, "commCenterBTlpmThreasholdBTProximity"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("CommCenter AppDebouncingTimer %lld"), -[WRM_iRATConfig commCenterAppDebouncingTimer](self, "commCenterAppDebouncingTimer"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("CommCenter PeriodicBreadCrumTimer %lld"), -[WRM_iRATConfig commCenterPeriodicBreadCrumTimer](self, "commCenterPeriodicBreadCrumTimer"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("CommCenter BreadCrumProcTimer %lld"), -[WRM_iRATConfig commCenterBreadCrumProcTimer](self, "commCenterBreadCrumProcTimer"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("cbrsEnterRsrpMin %lld"), -[WRM_iRATConfig cbrsEnterRsrpMin](self, "cbrsEnterRsrpMin"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("cbrsEnterRsrqMin %lld"), -[WRM_iRATConfig cbrsEnterRsrqMin](self, "cbrsEnterRsrqMin"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("cbrsExitRsrpMin %lld"), -[WRM_iRATConfig cbrsExitRsrpMin](self, "cbrsExitRsrpMin"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("cbrsExitRsrqMin %lld"), -[WRM_iRATConfig cbrsExitRsrqMin](self, "cbrsExitRsrqMin"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("nonCbrsEnterRsrpMin %lld"), -[WRM_iRATConfig nonCbrsEnterRsrpMin](self, "nonCbrsEnterRsrpMin"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("nonCbrsEnterRsrqMin %lld"), -[WRM_iRATConfig nonCbrsEnterRsrqMin](self, "nonCbrsEnterRsrqMin"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("nonCbrsExitRsrpMin %lld"), -[WRM_iRATConfig nonCbrsExitRsrpMin](self, "nonCbrsExitRsrpMin"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("nonCbrsExitRsrqMin %lld"), -[WRM_iRATConfig nonCbrsExitRsrqMin](self, "nonCbrsExitRsrqMin"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("cbrsEnterRsrpOffset %lld"), -[WRM_iRATConfig cbrsEnterRsrpOffset](self, "cbrsEnterRsrpOffset"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("cbrsEnterRsrqOffset %lld"), -[WRM_iRATConfig cbrsEnterRsrqOffset](self, "cbrsEnterRsrqOffset"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("cbrsExitRsrpOffset %lld"), -[WRM_iRATConfig cbrsExitRsrpOffset](self, "cbrsExitRsrpOffset"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("cbrsExitRsrqOffset %lld"), -[WRM_iRATConfig cbrsExitRsrqOffset](self, "cbrsExitRsrqOffset"));
}

- (void)loadiRATConfigurablePolicy
{
  NSData *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  const __CFString *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;

  v31 = 0;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("===== Loading iRAT Configuration Policies"));
  v3 = sub_1000896B4((uint64_t)CFSTR("WRM_iRAT"), (uint64_t)CFSTR("plist"));
  if (v3)
  {
    v30 = 0;
    v4 = +[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v3, 2, &v30, &v31);
    if (v4)
    {
      v5 = objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iRATPolicy"));
      if (v5)
      {
        v6 = v5;
        v7 = objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ActivePolicies"));
        if (v7)
        {
          v8 = v7;
          -[WRM_iRATConfig setHandoverAlgorithmType:](self, "setHandoverAlgorithmType:", objc_msgSend(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HandoverAlgorithmType")), "longLongValue"));
          -[WRM_iRATConfig setHandoverAlgorithmSettingDynamic:](self, "setHandoverAlgorithmSettingDynamic:", objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("HandoverAlgorithmSettingDynamic")), "BOOLValue"));
          -[WRM_iRATConfig setPingPongAvoidanceThresholdStationary:](self, "setPingPongAvoidanceThresholdStationary:", objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PingPongAvoidanceThresholdStationary")), "longLongValue"));
          -[WRM_iRATConfig setPingPongAvoidanceThresholdWalking:](self, "setPingPongAvoidanceThresholdWalking:", objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PingPongAvoidanceThresholdWalking")), "longLongValue"));
          -[WRM_iRATConfig setPingPongAvoidanceThresholdRunning:](self, "setPingPongAvoidanceThresholdRunning:", objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PingPongAvoidanceThresholdRunning")), "longLongValue"));
          -[WRM_iRATConfig setCellularStickinessThreaholdIdle:](self, "setCellularStickinessThreaholdIdle:", objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CellularStickinessThreaholdIdle")), "longLongValue"));
          -[WRM_iRATConfig setCellularStickinessThreaholdActive:](self, "setCellularStickinessThreaholdActive:", objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CellularStickinessThreaholdActive")), "longLongValue"));
          -[WRM_iRATConfig setCellularStickinessThreaholdStationary:](self, "setCellularStickinessThreaholdStationary:", objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CellularStickinessThreaholdStationary")), "longLongValue"));
          -[WRM_iRATConfig setCellularStickinessThreaholdStationaryActive:](self, "setCellularStickinessThreaholdStationaryActive:", objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CellularStickinessThreaholdStationaryActive")), "longLongValue"));
          -[WRM_iRATConfig setRtpMetricsEnabled:](self, "setRtpMetricsEnabled:", objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("RTPMetricsEnabled")), "BOOLValue"));
          -[WRM_iRATConfig setWifiMetricsEnabled:](self, "setWifiMetricsEnabled:", objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("WiFiMetricsEnabled")), "BOOLValue"));
          -[WRM_iRATConfig setCellularMetricsEnabled:](self, "setCellularMetricsEnabled:", objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CellularMetricsEnabled")), "BOOLValue"));
          -[WRM_iRATConfig setSymtompsMetricsEnabled:](self, "setSymtompsMetricsEnabled:", objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SymtompsMetricsEnabled")), "BOOLValue"));
          -[WRM_iRATConfig setP2pAssistanceEnabled:](self, "setP2pAssistanceEnabled:", objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("P2PAssistanceEnabled")), "BOOLValue"));
          -[WRM_iRATConfig setIdsMetricsEnabled:](self, "setIdsMetricsEnabled:", objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("IDSMetricsEnabled")), "BOOLValue"));
          -[WRM_iRATConfig setBtMetricsEnabled:](self, "setBtMetricsEnabled:", objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BTMetricsEnabled")), "BOOLValue"));
          -[WRM_iRATConfig setMobilityStateAwarenessEnabled:](self, "setMobilityStateAwarenessEnabled:", objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MobilityStateAwarenessEnabled")), "BOOLValue"));
          -[WRM_iRATConfig setQmiClientEnabled:](self, "setQmiClientEnabled:", objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("QMIClientEnabled")), "BOOLValue"));
          v9 = objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RTPMetrics"));
          if (v9)
          {
            v10 = v9;
            -[WRM_iRATConfig setPeriodicReportInterval:](self, "setPeriodicReportInterval:", objc_msgSend(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PeriodicReportInterval")), "longLongValue"));
            -[WRM_iRATConfig setHandoverRTThreshold:](self, "setHandoverRTThreshold:", objc_msgSend(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HandoverRTThreshold")), "longLongValue"));
            -[WRM_iRATConfig setHandoverRxJitterThreshold:](self, "setHandoverRxJitterThreshold:", objc_msgSend(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HandoverRxJitterThreshold")), "longLongValue"));
            -[WRM_iRATConfig setHandoverRxPktLossThreshold:](self, "setHandoverRxPktLossThreshold:", objc_msgSend(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HandoverRxPktLossThreshold")), "longLongValue"));
            -[WRM_iRATConfig setHandoverAvgRxPktLossThreshold:](self, "setHandoverAvgRxPktLossThreshold:", objc_msgSend(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HandoverAvgRxPktLossThreshold")), "longLongValue"));
            -[WRM_iRATConfig setHandoverAvgIdleRxPktLossThreshold:](self, "setHandoverAvgIdleRxPktLossThreshold:", objc_msgSend(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HandoverTotalAvgRxPktLossThreshold")), "longLongValue"));
            -[WRM_iRATConfig setHandoverTxPktLossThreshold:](self, "setHandoverTxPktLossThreshold:", objc_msgSend(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HandoverTxPktLossThreshold")), "longLongValue"));
            -[WRM_iRATConfig setHandoverNominalJitterBufferThreshold:](self, "setHandoverNominalJitterBufferThreshold:", objc_msgSend(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HandoverNominalJitterBufferThreshold")), "longLongValue"));
          }
          else
          {
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("No RTP metrics config"));
          }
          v12 = objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("WiFiMetrics"));
          if (v12)
          {
            v13 = v12;
            -[WRM_iRATConfig setMinActiveWiFiSnrTh0:](self, "setMinActiveWiFiSnrTh0:", objc_msgSend(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("MinActiveWiFiSnrTh0")), "longLongValue"));
            -[WRM_iRATConfig setMinActiveWiFiSnrTh1:](self, "setMinActiveWiFiSnrTh1:", objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MinActiveWiFiSnrTh1")), "longLongValue"));
            -[WRM_iRATConfig setMinActiveWiFiRssiTh0:](self, "setMinActiveWiFiRssiTh0:", objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MinActiveWiFiRssiTh0")), "longLongValue"));
            -[WRM_iRATConfig setMinActiveWiFiRssiTh1:](self, "setMinActiveWiFiRssiTh1:", objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MinActiveWiFiRssiTh1")), "longLongValue"));
            -[WRM_iRATConfig setMinIdleWiFiSnrTh0:](self, "setMinIdleWiFiSnrTh0:", objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MinIdleWiFiSnrTh0")), "longLongValue"));
            -[WRM_iRATConfig setMinIdleWiFiSnrTh1:](self, "setMinIdleWiFiSnrTh1:", objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MinIdleWiFiSnrTh1")), "longLongValue"));
            -[WRM_iRATConfig setMinIdleWiFiRssiTh0:](self, "setMinIdleWiFiRssiTh0:", objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MinIdleWiFiRssiTh0")), "longLongValue"));
            -[WRM_iRATConfig setMinIdleWiFiRssiTh1:](self, "setMinIdleWiFiRssiTh1:", objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MinIdleWiFiRssiTh1")), "longLongValue"));
            -[WRM_iRATConfig setSnrHysterisisWalking:](self, "setSnrHysterisisWalking:", objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("SnrHysterisisWalking")), "longLongValue"));
            -[WRM_iRATConfig setSnrHysterisisRunning:](self, "setSnrHysterisisRunning:", objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("SnrHysterisisRunning")), "longLongValue"));
            -[WRM_iRATConfig setRssiHysterisisWalking:](self, "setRssiHysterisisWalking:", objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("RssiHysterisisWalking")), "longLongValue"));
            -[WRM_iRATConfig setRssiHysterisisRunning:](self, "setRssiHysterisisRunning:", objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("RssiHysterisisRunning")), "longLongValue"));
            -[WRM_iRATConfig setMinActiveWiFiCcaTh0:](self, "setMinActiveWiFiCcaTh0:", objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MinActiveWiFiCcaTh0")), "longLongValue"));
            -[WRM_iRATConfig setMinActiveWiFiCcaTh1:](self, "setMinActiveWiFiCcaTh1:", objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MinActiveWiFiCcaTh1")), "longLongValue"));
            -[WRM_iRATConfig setMinIdleWiFiCcaTh0:](self, "setMinIdleWiFiCcaTh0:", objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MinIdleWiFiCcaTh0")), "longLongValue"));
            -[WRM_iRATConfig setMinIdleWiFiCcaTh1:](self, "setMinIdleWiFiCcaTh1:", objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MinIdleWiFiCcaTh1")), "longLongValue"));
            -[WRM_iRATConfig setMinActiveWiFiTxPktLossRateTh0:](self, "setMinActiveWiFiTxPktLossRateTh0:", objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MinActiveWiFiTxPktLossRateTh0")), "longLongValue"));
            -[WRM_iRATConfig setMinActiveWiFiTxPktLossRateTh1:](self, "setMinActiveWiFiTxPktLossRateTh1:", objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MinActiveWiFiTxPktLossRateTh1")), "longLongValue"));
            -[WRM_iRATConfig setMinActiveWiFiAvgTxPktLossRateTh:](self, "setMinActiveWiFiAvgTxPktLossRateTh:", objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MinActiveWiFiAvgTxPktLossRateTh")), "longLongValue"));
            -[WRM_iRATConfig setMinIdleWiFiTxPktLossRateTh0:](self, "setMinIdleWiFiTxPktLossRateTh0:", objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MinIdleWiFiTxPktLossRateTh0")), "longLongValue"));
            -[WRM_iRATConfig setMinIdleWiFiTxPktLossRateTh1:](self, "setMinIdleWiFiTxPktLossRateTh1:", objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MinIdleWiFiTxPktLossRateTh1")), "longLongValue"));
            -[WRM_iRATConfig setMinIdleWiFiFwTxPktLossRateTh0:](self, "setMinIdleWiFiFwTxPktLossRateTh0:", objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MinIdleWiFiFwTxPktLossRateTh0")), "longLongValue"));
            -[WRM_iRATConfig setMinIdleWiFiFwTxPktLossRateTh1:](self, "setMinIdleWiFiFwTxPktLossRateTh1:", objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MinIdleWiFiFwTxPktLossRateTh1")), "longLongValue"));
            -[WRM_iRATConfig setMinWiFiBeaconPerTh0:](self, "setMinWiFiBeaconPerTh0:", objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MinWiFiBeaconPerTh0")), "longLongValue"));
            objc_msgSend((id)objc_opt_self(self), "setMinWiFiBeaconPerTh1:", objc_msgSend(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MinWiFiBeaconPerTh1")), "longLongValue"));
          }
          else
          {
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("No WiFi specific config"));
          }
          v14 = objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DataMetrics"));
          if (v14)
          {
            v15 = v14;
            -[WRM_iRATConfig setDataMinBtRssiTh0:](self, "setDataMinBtRssiTh0:", objc_msgSend(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("BTMinRssiTh0")), "longLongValue"));
            -[WRM_iRATConfig setDataMinBtRssiTh1:](self, "setDataMinBtRssiTh1:", objc_msgSend(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("BTMinRssiTh1")), "longLongValue"));
            -[WRM_iRATConfig setDataBtMovingAvgAlphaDenum:](self, "setDataBtMovingAvgAlphaDenum:", objc_msgSend(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("BtMovingAvgAlphaDenum")), "longLongValue"));
            -[WRM_iRATConfig setDataBtStickinessTimeThreshMs:](self, "setDataBtStickinessTimeThreshMs:", objc_msgSend(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("BtStickinessTimeThreshMs")), "longLongValue"));
            -[WRM_iRATConfig setDataMinWifiRssiTh0:](self, "setDataMinWifiRssiTh0:", objc_msgSend(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("WifiMinRssiTh0")), "longLongValue"));
            -[WRM_iRATConfig setDataMinWifiSnrTh0:](self, "setDataMinWifiSnrTh0:", objc_msgSend(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("WifiMinSnrTh0")), "longLongValue"));
            -[WRM_iRATConfig setDataMinWifiRssiTh1:](self, "setDataMinWifiRssiTh1:", objc_msgSend(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("WifiMinRssiTh1")), "longLongValue"));
            -[WRM_iRATConfig setDataMinWifiSnrTh1:](self, "setDataMinWifiSnrTh1:", objc_msgSend(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("WifiMinSnrTh1")), "longLongValue"));
            -[WRM_iRATConfig setDataMinWifiBeaconPerTh0:](self, "setDataMinWifiBeaconPerTh0:", objc_msgSend(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("WifiMinBeaconPerTh0")), "longLongValue"));
            -[WRM_iRATConfig setDataWifiMinBeaconCount:](self, "setDataWifiMinBeaconCount:", objc_msgSend(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("WifiMinValidBeaconCount")), "longLongValue"));
          }
          else
          {
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("No Data specific config"));
          }
          v16 = objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("IDSWiFiMetrics"));
          if (v16)
          {
            v17 = v16;
            -[WRM_iRATConfig setIdsMinWiFiRssiTh0:](self, "setIdsMinWiFiRssiTh0:", objc_msgSend(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("IDSMinWiFiRssiTh0")), "longLongValue"));
            -[WRM_iRATConfig setIdsMinWiFiRssiTh1:](self, "setIdsMinWiFiRssiTh1:", objc_msgSend(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("IDSMinWiFiRssiTh1")), "longLongValue"));
            -[WRM_iRATConfig setIdsMinWiFiSnrTh0:](self, "setIdsMinWiFiSnrTh0:", objc_msgSend(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("IDSMinWiFiSnrTh0")), "longLongValue"));
            -[WRM_iRATConfig setIdsMinWiFiSnrTh1:](self, "setIdsMinWiFiSnrTh1:", objc_msgSend(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("IDSMinWiFiSnrTh1")), "longLongValue"));
            -[WRM_iRATConfig setIdsMinAvgWiFiTxPktLossRateTh0:](self, "setIdsMinAvgWiFiTxPktLossRateTh0:", objc_msgSend(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("IDSMinAvgWiFiTxPktLossRateTh0")), "longLongValue"));
            -[WRM_iRATConfig setIdsMinAvgWiFiTxPktLossRateTh1:](self, "setIdsMinAvgWiFiTxPktLossRateTh1:", objc_msgSend(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("IDSMinAvgWiFiTxPktLossRateTh1")), "longLongValue"));
            -[WRM_iRATConfig setIdsMinWiFiThroughputTh0:](self, "setIdsMinWiFiThroughputTh0:", objc_msgSend(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("IDSMinWiFiThroughputTh0")), "longLongValue"));
            -[WRM_iRATConfig setIdsMinWiFiThroughputTh1:](self, "setIdsMinWiFiThroughputTh1:", objc_msgSend(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("IDSMinWiFiThroughputTh1")), "longLongValue"));
            -[WRM_iRATConfig setIdsMinWiFiEffectivePhyRateTh0:](self, "setIdsMinWiFiEffectivePhyRateTh0:", objc_msgSend(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("IDSMinWiFiEffectivePhyRateTh0")), "longLongValue"));
            -[WRM_iRATConfig setIdsMinWiFiEffectivePhyRateTh1:](self, "setIdsMinWiFiEffectivePhyRateTh1:", objc_msgSend(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("IDSMinWiFiEffectivePhyRateTh1")), "longLongValue"));
          }
          else
          {
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("No IDS WiFi specific config"));
          }
          v18 = objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("IDSMetricsIdsClient"));
          if (v18)
          {
            v19 = v18;
            -[WRM_iRATConfig setIdsPeriodicReportInterval:](self, "setIdsPeriodicReportInterval:", objc_msgSend(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("IDSPeriodicReportInterval")), "longLongValue"));
            -[WRM_iRATConfig setIdsWiFiMinRttTh1:](self, "setIdsWiFiMinRttTh1:", objc_msgSend(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("IDSWiFiMinRttTh1")), "longLongValue"));
            -[WRM_iRATConfig setIdsBTMinRttTh1:](self, "setIdsBTMinRttTh1:", objc_msgSend(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("IDSBTiMinRttTh1")), "longLongValue"));
            -[WRM_iRATConfig setIdsWiFiMinPerTh1:](self, "setIdsWiFiMinPerTh1:", objc_msgSend(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("IDSWiFiMinPerTh1")), "longLongValue"));
            -[WRM_iRATConfig setIdsAvgWiFiMinPerTh1:](self, "setIdsAvgWiFiMinPerTh1:", objc_msgSend(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("IDSAvgWiFiMinPerTh1")), "longLongValue"));
            -[WRM_iRATConfig setIdsMovAvgWiFiMinPerTh1:](self, "setIdsMovAvgWiFiMinPerTh1:", objc_msgSend(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("IDSMovAvgWiFiMinPerTh1")), "longLongValue"));
            -[WRM_iRATConfig setIdsBTMinPerTh1:](self, "setIdsBTMinPerTh1:", objc_msgSend(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("IDSBTMinPerTh1")), "longLongValue"));
          }
          else
          {
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("No IDS Client specific config"));
          }
          v20 = objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CellularMetrics"));
          if (v20)
          {
            v21 = v20;
            -[WRM_iRATConfig setMinSigBarTh0:](self, "setMinSigBarTh0:", objc_msgSend(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("MinSigBarTh0")), "longLongValue"));
            -[WRM_iRATConfig setMinMovSigBarTh0:](self, "setMinMovSigBarTh0:", objc_msgSend(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("MinMovSigBarTh0")), "longLongValue"));
            -[WRM_iRATConfig setMinSigBarTh1:](self, "setMinSigBarTh1:", objc_msgSend(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("MinSigBarTh1")), "longLongValue"));
            -[WRM_iRATConfig setMinSigBarTh2:](self, "setMinSigBarTh2:", objc_msgSend(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("MinSigBarTh2")), "longLongValue"));
            -[WRM_iRATConfig setSosWaypointRSRPTh:](self, "setSosWaypointRSRPTh:", objc_msgSend(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("SOSWaypointRSRPTh")), "longLongValue"));
          }
          else
          {
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("No Cellular specific config"));
          }
          v22 = objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SymtompsMetrics"));
          if (v22)
          {
            v23 = v22;
            -[WRM_iRATConfig setTransportMetricsRateLimitingThreshold:](self, "setTransportMetricsRateLimitingThreshold:", objc_msgSend(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("TransportMetricsRateLimitingThreshold")), "longLongValue"));
            -[WRM_iRATConfig setTcpJitterThreshold:](self, "setTcpJitterThreshold:", objc_msgSend(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("TcpJitterThreshold")), "longLongValue"));
            -[WRM_iRATConfig setTcpRttThreshold:](self, "setTcpRttThreshold:", objc_msgSend(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("TcpRttThreshold")), "longLongValue"));
            -[WRM_iRATConfig setTcpIdleConnSuccessThreshold:](self, "setTcpIdleConnSuccessThreshold:", objc_msgSend(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("TcpIdleConnSuccessThreshold")), "longLongValue"));
            -[WRM_iRATConfig setTcpActiveConnSuccessThreshold:](self, "setTcpActiveConnSuccessThreshold:", objc_msgSend(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("TcpActiveConnSuccessThreshold")), "longLongValue"));
            -[WRM_iRATConfig setHistoricalAgeOfConnectedLinkInDays:](self, "setHistoricalAgeOfConnectedLinkInDays:", objc_msgSend(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("HistoricalAgeOfConnectedLinkInDays")), "longLongValue"));
          }
          else
          {
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("No Symtomps specific config"));
          }
          v24 = objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("FaceTimeMetrics"));
          if (v24)
          {
            v25 = v24;
            -[WRM_iRATConfig setFaceTimeCellularStickinessThreaholdActive:](self, "setFaceTimeCellularStickinessThreaholdActive:", objc_msgSend(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("FaceTimeCellularStickinessThreaholdActive")), "longLongValue"));
            -[WRM_iRATConfig setFaceTimeMinActiveWiFiAvgTxPktLossRateTh:](self, "setFaceTimeMinActiveWiFiAvgTxPktLossRateTh:", objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("FaceTimeMinActiveWiFiAvgTxPktLossRateTh")), "longLongValue"));
            -[WRM_iRATConfig setFaceTimeHandoverAvgRxPktLossThreshold:](self, "setFaceTimeHandoverAvgRxPktLossThreshold:", objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("FaceTimeHandoverAvgRxPktLossThreshold")), "longLongValue"));
            -[WRM_iRATConfig setFaceTimeHandoverRxPktLossThreshold:](self, "setFaceTimeHandoverRxPktLossThreshold:", objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("FaceTimeHandoverRxPktLossThreshold")), "longLongValue"));
            -[WRM_iRATConfig setFaceTimeMinActiveWiFiRssiTh0:](self, "setFaceTimeMinActiveWiFiRssiTh0:", objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("FaceTimeMinActiveWiFiRssiTh0")), "longLongValue"));
            -[WRM_iRATConfig setFaceTimeMinActiveWiFiRssiTh1:](self, "setFaceTimeMinActiveWiFiRssiTh1:", objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("FaceTimeMinActiveWiFiRssiTh1")), "longLongValue"));
            -[WRM_iRATConfig setFaceTimeEnhancedVideoMetricsEnabled:](self, "setFaceTimeEnhancedVideoMetricsEnabled:", objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("FaceTimeEnhancedVideoMetricsEnabled")), "longLongValue"));
            -[WRM_iRATConfig setFaceTimeMovingAverageWindow:](self, "setFaceTimeMovingAverageWindow:", objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("FaceTimeMovAvgWindow")), "longLongValue"));
            -[WRM_iRATConfig setFaceTimeVideoPacketLoss:](self, "setFaceTimeVideoPacketLoss:", objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("FaceTimeVideoPktLoss")), "longLongValue"));
            -[WRM_iRATConfig setFaceTimeAleratedModeRssiTh1:](self, "setFaceTimeAleratedModeRssiTh1:", objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("FaceTimeAleratedRssiTh1")), "longLongValue"));
            -[WRM_iRATConfig setFaceTimeAleratedModeRssiTh0:](self, "setFaceTimeAleratedModeRssiTh0:", objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("FaceTimeAleratedRssiTh0")), "longLongValue"));
            -[WRM_iRATConfig setFaceTimeAleratedModeCCATh1:](self, "setFaceTimeAleratedModeCCATh1:", objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("FaceTimeAleratedCcaTh1")), "longLongValue"));
            -[WRM_iRATConfig setFaceTimeAleratedModeCCATh0:](self, "setFaceTimeAleratedModeCCATh0:", objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("FaceTimeAleratedCcaTh0")), "longLongValue"));
            -[WRM_iRATConfig setFaceTimeAleratedModeStationCount:](self, "setFaceTimeAleratedModeStationCount:", objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("FaceTimeAleratedStationCount")), "longLongValue"));
            -[WRM_iRATConfig setFaceTimeAleratedModeVideoErasures:](self, "setFaceTimeAleratedModeVideoErasures:", objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("FaceTimeAleratedVidErasureTh1")), "longLongValue"));
            -[WRM_iRATConfig setFaceTimeAleratedModeTxPer1:](self, "setFaceTimeAleratedModeTxPer1:", objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("FaceTimeAleratedTxPerTh1")), "longLongValue"));
            -[WRM_iRATConfig setFaceTimeAleratedModeTxPer0:](self, "setFaceTimeAleratedModeTxPer0:", objc_msgSend(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("FaceTimeAleratedTxPerTh0")), "longLongValue"));
          }
          else
          {
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("No FaceTime specific config"));
          }
          v26 = objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CommCenterManagerMetrics"));
          if (v26)
          {
            v27 = v26;
            -[WRM_iRATConfig setCommCenterStickinessThreasholdWiFiProximity:](self, "setCommCenterStickinessThreasholdWiFiProximity:", objc_msgSend(objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("CommCenterStickinessThreasholdWiFiProximity")), "longLongValue"));
            -[WRM_iRATConfig setCommCenterStickinessThreasholdNotinWiFiProximity:](self, "setCommCenterStickinessThreasholdNotinWiFiProximity:", objc_msgSend(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("CommCenterStickinessThreasholdNotinWiFiProximity")), "longLongValue"));
            -[WRM_iRATConfig setCommCenterThumperStickinessThreasholdNotinBTProximity:](self, "setCommCenterThumperStickinessThreasholdNotinBTProximity:", objc_msgSend(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("CommCenterThumperStickinessThreasholdNotinBTProximity")), "longLongValue"));
            -[WRM_iRATConfig setCommCenterThumperStickinessThreasholdNotinBTProximity:](self, "setCommCenterThumperStickinessThreasholdNotinBTProximity:", objc_msgSend(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("commCenterBTlpmThreasholdBTProximity")), "longLongValue"));
            -[WRM_iRATConfig setCommCenterAppDebouncingTimer:](self, "setCommCenterAppDebouncingTimer:", objc_msgSend(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("CommCenterAppDeboucingTimer")), "longLongValue"));
            -[WRM_iRATConfig setCommCenterPeriodicBreadCrumTimer:](self, "setCommCenterPeriodicBreadCrumTimer:", objc_msgSend(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("CommCenterPeriodicBreadCrumTimer")), "longLongValue"));
            -[WRM_iRATConfig setCommCenterBreadCrumProcTimer:](self, "setCommCenterBreadCrumProcTimer:", objc_msgSend(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("CommCenterBreadCrumProcTimer")), "longLongValue"));
          }
          else
          {
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("No CommCenterManager specific config"));
          }
          v28 = objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CBRSMetrics"));
          if (v28)
          {
            v29 = v28;
            -[WRM_iRATConfig setCbrsEnterRsrpMin:](self, "setCbrsEnterRsrpMin:", objc_msgSend(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("CBRSEnterRsrpMin")), "longLongValue"));
            -[WRM_iRATConfig setCbrsEnterRsrqMin:](self, "setCbrsEnterRsrqMin:", objc_msgSend(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("CBRSEnterRsrqMin")), "longLongValue"));
            -[WRM_iRATConfig setCbrsExitRsrpMin:](self, "setCbrsExitRsrpMin:", objc_msgSend(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("CBRSExitRsrpMin")), "longLongValue"));
            -[WRM_iRATConfig setCbrsExitRsrqMin:](self, "setCbrsExitRsrqMin:", objc_msgSend(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("CBRSExitRsrqMin")), "longLongValue"));
            -[WRM_iRATConfig setNonCbrsEnterRsrpMin:](self, "setNonCbrsEnterRsrpMin:", objc_msgSend(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("NonCBRSEnterRsrpMin")), "longLongValue"));
            -[WRM_iRATConfig setNonCbrsEnterRsrqMin:](self, "setNonCbrsEnterRsrqMin:", objc_msgSend(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("NonCBRSEnterRsrqMin")), "longLongValue"));
            -[WRM_iRATConfig setNonCbrsExitRsrpMin:](self, "setNonCbrsExitRsrpMin:", objc_msgSend(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("nonCBRSExitRsrpMin")), "longLongValue"));
            -[WRM_iRATConfig setNonCbrsExitRsrqMin:](self, "setNonCbrsExitRsrqMin:", objc_msgSend(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("nonCBRSExitRsrqMin")), "longLongValue"));
            -[WRM_iRATConfig setCbrsEnterRsrpOffset:](self, "setCbrsEnterRsrpOffset:", objc_msgSend(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("CBRSEnterRsrpOffset")), "longLongValue"));
            -[WRM_iRATConfig setCbrsEnterRsrqOffset:](self, "setCbrsEnterRsrqOffset:", objc_msgSend(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("CBRSEnterRsrqOffset")), "longLongValue"));
            -[WRM_iRATConfig setCbrsExitRsrpOffset:](self, "setCbrsExitRsrpOffset:", objc_msgSend(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("CBRSExitRsrpOffset")), "longLongValue"));
            -[WRM_iRATConfig setCbrsExitRsrqOffset:](self, "setCbrsExitRsrqOffset:", objc_msgSend(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("CBRSExitRsrqOffset")), "longLongValue"));
          }
          else
          {
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("No cbrsConfig specific config"));
          }
          -[WRM_iRATConfig printiRATConfig](self, "printiRATConfig");
          v11 = CFSTR("===== Loading iRAT Configuration Policies completes. ");
        }
        else
        {
          v11 = CFSTR("No iRAT active config");
        }
      }
      else
      {
        v11 = CFSTR("No iRAT specific config found");
      }
    }
    else
    {
      v11 = CFSTR("No Policy found");
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, v11);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("No Policy resource path found"));
  }
}

- (void)updateFaceTimeRSSITh:(int64_t)a3
{
  -[WRM_iRATConfig setFaceTimeMinActiveWiFiRssiTh1:](self, "setFaceTimeMinActiveWiFiRssiTh1:");
  -[WRM_iRATConfig setFaceTimeMinActiveWiFiRssiTh0:](self, "setFaceTimeMinActiveWiFiRssiTh0:", a3 + 10);
}

- (void)revertFaceTimeThToAzul
{
  -[WRM_iRATConfig setFaceTimeMinActiveWiFiRssiTh1:](self, "setFaceTimeMinActiveWiFiRssiTh1:", -80);
  -[WRM_iRATConfig setFaceTimeMinActiveWiFiRssiTh0:](self, "setFaceTimeMinActiveWiFiRssiTh0:", -70);
}

- (int64_t)handoverAlgorithmType
{
  return self->_handoverAlgorithmType;
}

- (void)setHandoverAlgorithmType:(int64_t)a3
{
  self->_handoverAlgorithmType = a3;
}

- (void)setCtServiceType:(int64_t)a3
{
  self->_ctServiceType = a3;
}

- (BOOL)handoverAlgorithmSettingDynamic
{
  return self->_handoverAlgorithmSettingDynamic;
}

- (void)setHandoverAlgorithmSettingDynamic:(BOOL)a3
{
  self->_handoverAlgorithmSettingDynamic = a3;
}

- (void)setPingPongAvoidanceThresholdStationary:(int64_t)a3
{
  self->_pingPongAvoidanceThresholdStationary = a3;
}

- (int64_t)pingPongAvoidanceThresholdWalking
{
  return self->_pingPongAvoidanceThresholdWalking;
}

- (void)setPingPongAvoidanceThresholdWalking:(int64_t)a3
{
  self->_pingPongAvoidanceThresholdWalking = a3;
}

- (int64_t)pingPongAvoidanceThresholdRunning
{
  return self->_pingPongAvoidanceThresholdRunning;
}

- (void)setPingPongAvoidanceThresholdRunning:(int64_t)a3
{
  self->_pingPongAvoidanceThresholdRunning = a3;
}

- (int64_t)cellularStickinessThreaholdIdle
{
  return self->_cellularStickinessThreaholdIdle;
}

- (void)setCellularStickinessThreaholdIdle:(int64_t)a3
{
  self->_cellularStickinessThreaholdIdle = a3;
}

- (int64_t)cellularStickinessThreaholdActive
{
  return self->_cellularStickinessThreaholdActive;
}

- (void)setCellularStickinessThreaholdActive:(int64_t)a3
{
  self->_cellularStickinessThreaholdActive = a3;
}

- (int64_t)cellularStickinessThreaholdStationary
{
  return self->_cellularStickinessThreaholdStationary;
}

- (void)setCellularStickinessThreaholdStationary:(int64_t)a3
{
  self->_cellularStickinessThreaholdStationary = a3;
}

- (int64_t)cellularStickinessThreaholdStationaryActive
{
  return self->_cellularStickinessThreaholdStationaryActive;
}

- (void)setCellularStickinessThreaholdStationaryActive:(int64_t)a3
{
  self->_cellularStickinessThreaholdStationaryActive = a3;
}

- (BOOL)rtpMetricsEnabled
{
  return self->_rtpMetricsEnabled;
}

- (void)setRtpMetricsEnabled:(BOOL)a3
{
  self->_rtpMetricsEnabled = a3;
}

- (BOOL)wifiMetricsEnabled
{
  return self->_wifiMetricsEnabled;
}

- (void)setWifiMetricsEnabled:(BOOL)a3
{
  self->_wifiMetricsEnabled = a3;
}

- (BOOL)cellularMetricsEnabled
{
  return self->_cellularMetricsEnabled;
}

- (void)setCellularMetricsEnabled:(BOOL)a3
{
  self->_cellularMetricsEnabled = a3;
}

- (void)setSymtompsMetricsEnabled:(BOOL)a3
{
  self->_symtompsMetricsEnabled = a3;
}

- (BOOL)idsMetricsEnabled
{
  return self->_idsMetricsEnabled;
}

- (void)setIdsMetricsEnabled:(BOOL)a3
{
  self->_idsMetricsEnabled = a3;
}

- (BOOL)btMetricsEnabled
{
  return self->_btMetricsEnabled;
}

- (void)setBtMetricsEnabled:(BOOL)a3
{
  self->_btMetricsEnabled = a3;
}

- (BOOL)mobilityStateAwarenessEnabled
{
  return self->_mobilityStateAwarenessEnabled;
}

- (void)setMobilityStateAwarenessEnabled:(BOOL)a3
{
  self->_mobilityStateAwarenessEnabled = a3;
}

- (BOOL)qmiClientEnabled
{
  return self->_qmiClientEnabled;
}

- (void)setQmiClientEnabled:(BOOL)a3
{
  self->_qmiClientEnabled = a3;
}

- (BOOL)p2pAssistanceEnabled
{
  return self->_p2pAssistanceEnabled;
}

- (void)setP2pAssistanceEnabled:(BOOL)a3
{
  self->_p2pAssistanceEnabled = a3;
}

- (int64_t)periodicReportInterval
{
  return self->_periodicReportInterval;
}

- (void)setPeriodicReportInterval:(int64_t)a3
{
  self->_periodicReportInterval = a3;
}

- (int64_t)handoverRTThreshold
{
  return self->_handoverRTThreshold;
}

- (void)setHandoverRTThreshold:(int64_t)a3
{
  self->_handoverRTThreshold = a3;
}

- (int64_t)handoverRxJitterThreshold
{
  return self->_handoverRxJitterThreshold;
}

- (void)setHandoverRxJitterThreshold:(int64_t)a3
{
  self->_handoverRxJitterThreshold = a3;
}

- (int64_t)handoverRxPktLossThreshold
{
  return self->_handoverRxPktLossThreshold;
}

- (void)setHandoverRxPktLossThreshold:(int64_t)a3
{
  self->_handoverRxPktLossThreshold = a3;
}

- (int64_t)handoverAvgRxPktLossThreshold
{
  return self->_handoverAvgRxPktLossThreshold;
}

- (void)setHandoverAvgRxPktLossThreshold:(int64_t)a3
{
  self->_handoverAvgRxPktLossThreshold = a3;
}

- (int64_t)handoverAvgIdleRxPktLossThreshold
{
  return self->_handoverAvgIdleRxPktLossThreshold;
}

- (void)setHandoverAvgIdleRxPktLossThreshold:(int64_t)a3
{
  self->_handoverAvgIdleRxPktLossThreshold = a3;
}

- (int64_t)handoverTxPktLossThreshold
{
  return self->_handoverTxPktLossThreshold;
}

- (void)setHandoverTxPktLossThreshold:(int64_t)a3
{
  self->_handoverTxPktLossThreshold = a3;
}

- (int64_t)handoverNominalJitterBufferThreshold
{
  return self->_handoverNominalJitterBufferThreshold;
}

- (void)setHandoverNominalJitterBufferThreshold:(int64_t)a3
{
  self->_handoverNominalJitterBufferThreshold = a3;
}

- (int64_t)minActiveWiFiSnrTh0
{
  return self->_minActiveWiFiSnrTh0;
}

- (void)setMinActiveWiFiSnrTh0:(int64_t)a3
{
  self->_minActiveWiFiSnrTh0 = a3;
}

- (int64_t)minActiveWiFiSnrTh1
{
  return self->_minActiveWiFiSnrTh1;
}

- (void)setMinActiveWiFiSnrTh1:(int64_t)a3
{
  self->_minActiveWiFiSnrTh1 = a3;
}

- (int64_t)minActiveWiFiRssiTh0
{
  return self->_minActiveWiFiRssiTh0;
}

- (void)setMinActiveWiFiRssiTh0:(int64_t)a3
{
  self->_minActiveWiFiRssiTh0 = a3;
}

- (int64_t)minActiveWiFiRssiTh1
{
  return self->_minActiveWiFiRssiTh1;
}

- (void)setMinActiveWiFiRssiTh1:(int64_t)a3
{
  self->_minActiveWiFiRssiTh1 = a3;
}

- (int64_t)minActiveWiFiCcaTh0
{
  return self->_minActiveWiFiCcaTh0;
}

- (void)setMinActiveWiFiCcaTh0:(int64_t)a3
{
  self->_minActiveWiFiCcaTh0 = a3;
}

- (int64_t)minActiveWiFiCcaTh1
{
  return self->_minActiveWiFiCcaTh1;
}

- (void)setMinActiveWiFiCcaTh1:(int64_t)a3
{
  self->_minActiveWiFiCcaTh1 = a3;
}

- (int64_t)minIdleWiFiSnrTh0
{
  return self->_minIdleWiFiSnrTh0;
}

- (void)setMinIdleWiFiSnrTh0:(int64_t)a3
{
  self->_minIdleWiFiSnrTh0 = a3;
}

- (void)setMinIdleWiFiSnrTh1:(int64_t)a3
{
  self->_minIdleWiFiSnrTh1 = a3;
}

- (int64_t)minIdleWiFiRssiTh0
{
  return self->_minIdleWiFiRssiTh0;
}

- (void)setMinIdleWiFiRssiTh0:(int64_t)a3
{
  self->_minIdleWiFiRssiTh0 = a3;
}

- (void)setMinIdleWiFiRssiTh1:(int64_t)a3
{
  self->_minIdleWiFiRssiTh1 = a3;
}

- (int64_t)minIdleWiFiCcaTh0
{
  return self->_minIdleWiFiCcaTh0;
}

- (void)setMinIdleWiFiCcaTh0:(int64_t)a3
{
  self->_minIdleWiFiCcaTh0 = a3;
}

- (void)setMinIdleWiFiCcaTh1:(int64_t)a3
{
  self->_minIdleWiFiCcaTh1 = a3;
}

- (int64_t)minActiveWiFiTxPktLossRateTh0
{
  return self->_minActiveWiFiTxPktLossRateTh0;
}

- (void)setMinActiveWiFiTxPktLossRateTh0:(int64_t)a3
{
  self->_minActiveWiFiTxPktLossRateTh0 = a3;
}

- (void)setMinActiveWiFiTxPktLossRateTh1:(int64_t)a3
{
  self->_minActiveWiFiTxPktLossRateTh1 = a3;
}

- (int64_t)minActiveWiFiAvgTxPktLossRateTh
{
  return self->_minActiveWiFiAvgTxPktLossRateTh;
}

- (void)setMinActiveWiFiAvgTxPktLossRateTh:(int64_t)a3
{
  self->_minActiveWiFiAvgTxPktLossRateTh = a3;
}

- (int64_t)minIdleWiFiTxPktLossRateTh0
{
  return self->_minIdleWiFiTxPktLossRateTh0;
}

- (void)setMinIdleWiFiTxPktLossRateTh0:(int64_t)a3
{
  self->_minIdleWiFiTxPktLossRateTh0 = a3;
}

- (void)setMinIdleWiFiTxPktLossRateTh1:(int64_t)a3
{
  self->_minIdleWiFiTxPktLossRateTh1 = a3;
}

- (int64_t)minIdleWiFiFwTxPktLossRateTh0
{
  return self->_minIdleWiFiFwTxPktLossRateTh0;
}

- (void)setMinIdleWiFiFwTxPktLossRateTh0:(int64_t)a3
{
  self->_minIdleWiFiFwTxPktLossRateTh0 = a3;
}

- (int64_t)minIdleWiFiFwTxPktLossRateTh1
{
  return self->_minIdleWiFiFwTxPktLossRateTh1;
}

- (void)setMinIdleWiFiFwTxPktLossRateTh1:(int64_t)a3
{
  self->_minIdleWiFiFwTxPktLossRateTh1 = a3;
}

- (int64_t)minWiFiBeaconPerTh0
{
  return self->_minWiFiBeaconPerTh0;
}

- (void)setMinWiFiBeaconPerTh0:(int64_t)a3
{
  self->_minWiFiBeaconPerTh0 = a3;
}

- (void)setMinWiFiBeaconPerTh1:(int64_t)a3
{
  self->_minWiFiBeaconPerTh1 = a3;
}

- (int64_t)snrHysterisisWalking
{
  return self->_snrHysterisisWalking;
}

- (void)setSnrHysterisisWalking:(int64_t)a3
{
  self->_snrHysterisisWalking = a3;
}

- (int64_t)snrHysterisisRunning
{
  return self->_snrHysterisisRunning;
}

- (void)setSnrHysterisisRunning:(int64_t)a3
{
  self->_snrHysterisisRunning = a3;
}

- (int64_t)rssiHysterisisWalking
{
  return self->_rssiHysterisisWalking;
}

- (void)setRssiHysterisisWalking:(int64_t)a3
{
  self->_rssiHysterisisWalking = a3;
}

- (int64_t)rssiHysterisisRunning
{
  return self->_rssiHysterisisRunning;
}

- (void)setRssiHysterisisRunning:(int64_t)a3
{
  self->_rssiHysterisisRunning = a3;
}

- (int64_t)dataMinBtRssiTh0
{
  return self->_dataMinBtRssiTh0;
}

- (void)setDataMinBtRssiTh0:(int64_t)a3
{
  self->_dataMinBtRssiTh0 = a3;
}

- (int64_t)dataMinBtRssiTh1
{
  return self->_dataMinBtRssiTh1;
}

- (void)setDataMinBtRssiTh1:(int64_t)a3
{
  self->_dataMinBtRssiTh1 = a3;
}

- (int64_t)dataMinBtTxPerTh0
{
  return self->_dataMinBtTxPerTh0;
}

- (void)setDataMinBtTxPerTh0:(int64_t)a3
{
  self->_dataMinBtTxPerTh0 = a3;
}

- (int64_t)dataMinBtTxPerTh1
{
  return self->_dataMinBtTxPerTh1;
}

- (void)setDataMinBtTxPerTh1:(int64_t)a3
{
  self->_dataMinBtTxPerTh1 = a3;
}

- (int64_t)dataMinBtRxPerTh0
{
  return self->_dataMinBtRxPerTh0;
}

- (void)setDataMinBtRxPerTh0:(int64_t)a3
{
  self->_dataMinBtRxPerTh0 = a3;
}

- (int64_t)dataMinBtRxPerTh1
{
  return self->_dataMinBtRxPerTh1;
}

- (void)setDataMinBtRxPerTh1:(int64_t)a3
{
  self->_dataMinBtRxPerTh1 = a3;
}

- (int64_t)dataBtMovingAvgAlphaDenum
{
  return self->_dataBtMovingAvgAlphaDenum;
}

- (void)setDataBtMovingAvgAlphaDenum:(int64_t)a3
{
  self->_dataBtMovingAvgAlphaDenum = a3;
}

- (int64_t)dataBtStickinessTimeThreshMs
{
  return self->_dataBtStickinessTimeThreshMs;
}

- (void)setDataBtStickinessTimeThreshMs:(int64_t)a3
{
  self->_dataBtStickinessTimeThreshMs = a3;
}

- (int64_t)dataMinWifiRssiTh0
{
  return self->_dataMinWifiRssiTh0;
}

- (void)setDataMinWifiRssiTh0:(int64_t)a3
{
  self->_dataMinWifiRssiTh0 = a3;
}

- (int64_t)dataMinWifiSnrTh0
{
  return self->_dataMinWifiSnrTh0;
}

- (void)setDataMinWifiSnrTh0:(int64_t)a3
{
  self->_dataMinWifiSnrTh0 = a3;
}

- (int64_t)dataMinWifiRssiTh1
{
  return self->_dataMinWifiRssiTh1;
}

- (void)setDataMinWifiRssiTh1:(int64_t)a3
{
  self->_dataMinWifiRssiTh1 = a3;
}

- (int64_t)dataMinWifiSnrTh1
{
  return self->_dataMinWifiSnrTh1;
}

- (void)setDataMinWifiSnrTh1:(int64_t)a3
{
  self->_dataMinWifiSnrTh1 = a3;
}

- (int64_t)dataMinWifiBeaconPerTh0
{
  return self->_dataMinWifiBeaconPerTh0;
}

- (void)setDataMinWifiBeaconPerTh0:(int64_t)a3
{
  self->_dataMinWifiBeaconPerTh0 = a3;
}

- (void)setDataWifiMinBeaconCount:(int64_t)a3
{
  self->_dataWifiMinBeaconCount = a3;
}

- (int64_t)idsMinWiFiRssiTh0
{
  return self->_idsMinWiFiRssiTh0;
}

- (void)setIdsMinWiFiRssiTh0:(int64_t)a3
{
  self->_idsMinWiFiRssiTh0 = a3;
}

- (int64_t)idsMinWiFiRssiTh1
{
  return self->_idsMinWiFiRssiTh1;
}

- (void)setIdsMinWiFiRssiTh1:(int64_t)a3
{
  self->_idsMinWiFiRssiTh1 = a3;
}

- (int64_t)idsMinWiFiSnrTh0
{
  return self->_idsMinWiFiSnrTh0;
}

- (void)setIdsMinWiFiSnrTh0:(int64_t)a3
{
  self->_idsMinWiFiSnrTh0 = a3;
}

- (int64_t)idsMinWiFiSnrTh1
{
  return self->_idsMinWiFiSnrTh1;
}

- (void)setIdsMinWiFiSnrTh1:(int64_t)a3
{
  self->_idsMinWiFiSnrTh1 = a3;
}

- (int64_t)idsMinAvgWiFiTxPktLossRateTh0
{
  return self->_idsMinAvgWiFiTxPktLossRateTh0;
}

- (void)setIdsMinAvgWiFiTxPktLossRateTh0:(int64_t)a3
{
  self->_idsMinAvgWiFiTxPktLossRateTh0 = a3;
}

- (int64_t)idsMinAvgWiFiTxPktLossRateTh1
{
  return self->_idsMinAvgWiFiTxPktLossRateTh1;
}

- (void)setIdsMinAvgWiFiTxPktLossRateTh1:(int64_t)a3
{
  self->_idsMinAvgWiFiTxPktLossRateTh1 = a3;
}

- (int64_t)idsMinWiFiThroughputTh0
{
  return self->_idsMinWiFiThroughputTh0;
}

- (void)setIdsMinWiFiThroughputTh0:(int64_t)a3
{
  self->_idsMinWiFiThroughputTh0 = a3;
}

- (int64_t)idsMinWiFiThroughputTh1
{
  return self->_idsMinWiFiThroughputTh1;
}

- (void)setIdsMinWiFiThroughputTh1:(int64_t)a3
{
  self->_idsMinWiFiThroughputTh1 = a3;
}

- (int64_t)idsMinWiFiEffectivePhyRateTh0
{
  return self->_idsMinWiFiEffectivePhyRateTh0;
}

- (void)setIdsMinWiFiEffectivePhyRateTh0:(int64_t)a3
{
  self->_idsMinWiFiEffectivePhyRateTh0 = a3;
}

- (int64_t)idsMinWiFiEffectivePhyRateTh1
{
  return self->_idsMinWiFiEffectivePhyRateTh1;
}

- (void)setIdsMinWiFiEffectivePhyRateTh1:(int64_t)a3
{
  self->_idsMinWiFiEffectivePhyRateTh1 = a3;
}

- (int64_t)idsPeriodicReportInterval
{
  return self->_idsPeriodicReportInterval;
}

- (void)setIdsPeriodicReportInterval:(int64_t)a3
{
  self->_idsPeriodicReportInterval = a3;
}

- (int64_t)idsWiFiMinRttTh1
{
  return self->_idsWiFiMinRttTh1;
}

- (void)setIdsWiFiMinRttTh1:(int64_t)a3
{
  self->_idsWiFiMinRttTh1 = a3;
}

- (int64_t)idsBTMinRttTh1
{
  return self->_idsBTMinRttTh1;
}

- (void)setIdsBTMinRttTh1:(int64_t)a3
{
  self->_idsBTMinRttTh1 = a3;
}

- (int64_t)idsWiFiMinPerTh1
{
  return self->_idsWiFiMinPerTh1;
}

- (void)setIdsWiFiMinPerTh1:(int64_t)a3
{
  self->_idsWiFiMinPerTh1 = a3;
}

- (int64_t)idsAvgWiFiMinPerTh1
{
  return self->_idsAvgWiFiMinPerTh1;
}

- (void)setIdsAvgWiFiMinPerTh1:(int64_t)a3
{
  self->_idsAvgWiFiMinPerTh1 = a3;
}

- (int64_t)idsMovAvgWiFiMinPerTh1
{
  return self->_idsMovAvgWiFiMinPerTh1;
}

- (void)setIdsMovAvgWiFiMinPerTh1:(int64_t)a3
{
  self->_idsMovAvgWiFiMinPerTh1 = a3;
}

- (int64_t)idsBTMinPerTh1
{
  return self->_idsBTMinPerTh1;
}

- (void)setIdsBTMinPerTh1:(int64_t)a3
{
  self->_idsBTMinPerTh1 = a3;
}

- (int64_t)minSigBarTh0
{
  return self->_minSigBarTh0;
}

- (void)setMinSigBarTh0:(int64_t)a3
{
  self->_minSigBarTh0 = a3;
}

- (void)setMinMovSigBarTh0:(int64_t)a3
{
  self->_minMovSigBarTh0 = a3;
}

- (int64_t)minSigBarTh1
{
  return self->_minSigBarTh1;
}

- (void)setMinSigBarTh1:(int64_t)a3
{
  self->_minSigBarTh1 = a3;
}

- (int64_t)minSigBarTh2
{
  return self->_minSigBarTh2;
}

- (void)setMinSigBarTh2:(int64_t)a3
{
  self->_minSigBarTh2 = a3;
}

- (int64_t)sosWaypointRSRPTh
{
  return self->_sosWaypointRSRPTh;
}

- (void)setSosWaypointRSRPTh:(int64_t)a3
{
  self->_sosWaypointRSRPTh = a3;
}

- (int64_t)transportMetricsRateLimitingThreshold
{
  return self->_transportMetricsRateLimitingThreshold;
}

- (void)setTransportMetricsRateLimitingThreshold:(int64_t)a3
{
  self->_transportMetricsRateLimitingThreshold = a3;
}

- (int64_t)tcpJitterThreshold
{
  return self->_tcpJitterThreshold;
}

- (void)setTcpJitterThreshold:(int64_t)a3
{
  self->_tcpJitterThreshold = a3;
}

- (int64_t)tcpRttThreshold
{
  return self->_tcpRttThreshold;
}

- (void)setTcpRttThreshold:(int64_t)a3
{
  self->_tcpRttThreshold = a3;
}

- (int64_t)tcpIdleConnSuccessThreshold
{
  return self->_tcpIdleConnSuccessThreshold;
}

- (void)setTcpIdleConnSuccessThreshold:(int64_t)a3
{
  self->_tcpIdleConnSuccessThreshold = a3;
}

- (int64_t)tcpActiveConnSuccessThreshold
{
  return self->_tcpActiveConnSuccessThreshold;
}

- (void)setTcpActiveConnSuccessThreshold:(int64_t)a3
{
  self->_tcpActiveConnSuccessThreshold = a3;
}

- (int64_t)historicalAgeOfConnectedLinkInDays
{
  return self->_historicalAgeOfConnectedLinkInDays;
}

- (void)setHistoricalAgeOfConnectedLinkInDays:(int64_t)a3
{
  self->_historicalAgeOfConnectedLinkInDays = a3;
}

- (int64_t)faceTimeCellularStickinessThreaholdActive
{
  return self->_faceTimeCellularStickinessThreaholdActive;
}

- (void)setFaceTimeCellularStickinessThreaholdActive:(int64_t)a3
{
  self->_faceTimeCellularStickinessThreaholdActive = a3;
}

- (int64_t)faceTimeMinActiveWiFiAvgTxPktLossRateTh
{
  return self->_faceTimeMinActiveWiFiAvgTxPktLossRateTh;
}

- (void)setFaceTimeMinActiveWiFiAvgTxPktLossRateTh:(int64_t)a3
{
  self->_faceTimeMinActiveWiFiAvgTxPktLossRateTh = a3;
}

- (int64_t)faceTimeHandoverAvgRxPktLossThreshold
{
  return self->_faceTimeHandoverAvgRxPktLossThreshold;
}

- (void)setFaceTimeHandoverAvgRxPktLossThreshold:(int64_t)a3
{
  self->_faceTimeHandoverAvgRxPktLossThreshold = a3;
}

- (int64_t)faceTimeHandoverRxPktLossThreshold
{
  return self->_faceTimeHandoverRxPktLossThreshold;
}

- (void)setFaceTimeHandoverRxPktLossThreshold:(int64_t)a3
{
  self->_faceTimeHandoverRxPktLossThreshold = a3;
}

- (int64_t)faceTimeMinActiveWiFiRssiTh1
{
  return self->_faceTimeMinActiveWiFiRssiTh1;
}

- (void)setFaceTimeMinActiveWiFiRssiTh1:(int64_t)a3
{
  self->_faceTimeMinActiveWiFiRssiTh1 = a3;
}

- (int64_t)faceTimeMinActiveWiFiRssiTh0
{
  return self->_faceTimeMinActiveWiFiRssiTh0;
}

- (void)setFaceTimeMinActiveWiFiRssiTh0:(int64_t)a3
{
  self->_faceTimeMinActiveWiFiRssiTh0 = a3;
}

- (int64_t)faceTimeEnhancedVideoMetricsEnabled
{
  return self->_faceTimeEnhancedVideoMetricsEnabled;
}

- (void)setFaceTimeEnhancedVideoMetricsEnabled:(int64_t)a3
{
  self->_faceTimeEnhancedVideoMetricsEnabled = a3;
}

- (int64_t)faceTimeMovingAverageWindow
{
  return self->_faceTimeMovingAverageWindow;
}

- (void)setFaceTimeMovingAverageWindow:(int64_t)a3
{
  self->_faceTimeMovingAverageWindow = a3;
}

- (int64_t)faceTimeVideoPacketLoss
{
  return self->_faceTimeVideoPacketLoss;
}

- (void)setFaceTimeVideoPacketLoss:(int64_t)a3
{
  self->_faceTimeVideoPacketLoss = a3;
}

- (int64_t)faceTimeAleratedModeRssiTh1
{
  return self->_faceTimeAleratedModeRssiTh1;
}

- (void)setFaceTimeAleratedModeRssiTh1:(int64_t)a3
{
  self->_faceTimeAleratedModeRssiTh1 = a3;
}

- (int64_t)faceTimeAleratedModeRssiTh0
{
  return self->_faceTimeAleratedModeRssiTh0;
}

- (void)setFaceTimeAleratedModeRssiTh0:(int64_t)a3
{
  self->_faceTimeAleratedModeRssiTh0 = a3;
}

- (int64_t)faceTimeAleratedModeCCATh1
{
  return self->_faceTimeAleratedModeCCATh1;
}

- (void)setFaceTimeAleratedModeCCATh1:(int64_t)a3
{
  self->_faceTimeAleratedModeCCATh1 = a3;
}

- (int64_t)faceTimeAleratedModeCCATh0
{
  return self->_faceTimeAleratedModeCCATh0;
}

- (void)setFaceTimeAleratedModeCCATh0:(int64_t)a3
{
  self->_faceTimeAleratedModeCCATh0 = a3;
}

- (int64_t)faceTimeAleratedModeStationCount
{
  return self->_faceTimeAleratedModeStationCount;
}

- (void)setFaceTimeAleratedModeStationCount:(int64_t)a3
{
  self->_faceTimeAleratedModeStationCount = a3;
}

- (int64_t)faceTimeAleratedModeVideoErasures
{
  return self->_faceTimeAleratedModeVideoErasures;
}

- (void)setFaceTimeAleratedModeVideoErasures:(int64_t)a3
{
  self->_faceTimeAleratedModeVideoErasures = a3;
}

- (int64_t)faceTimeAleratedModeTxPer1
{
  return self->_faceTimeAleratedModeTxPer1;
}

- (void)setFaceTimeAleratedModeTxPer1:(int64_t)a3
{
  self->_faceTimeAleratedModeTxPer1 = a3;
}

- (int64_t)faceTimeAleratedModeTxPer0
{
  return self->_faceTimeAleratedModeTxPer0;
}

- (void)setFaceTimeAleratedModeTxPer0:(int64_t)a3
{
  self->_faceTimeAleratedModeTxPer0 = a3;
}

- (int64_t)commCenterStickinessThreasholdWiFiProximity
{
  return self->_commCenterStickinessThreasholdWiFiProximity;
}

- (void)setCommCenterStickinessThreasholdWiFiProximity:(int64_t)a3
{
  self->_commCenterStickinessThreasholdWiFiProximity = a3;
}

- (int64_t)commCenterStickinessThreasholdNotinWiFiProximity
{
  return self->_commCenterStickinessThreasholdNotinWiFiProximity;
}

- (void)setCommCenterStickinessThreasholdNotinWiFiProximity:(int64_t)a3
{
  self->_commCenterStickinessThreasholdNotinWiFiProximity = a3;
}

- (int64_t)commCenterThumperStickinessThreasholdNotinBTProximity
{
  return self->_commCenterThumperStickinessThreasholdNotinBTProximity;
}

- (void)setCommCenterThumperStickinessThreasholdNotinBTProximity:(int64_t)a3
{
  self->_commCenterThumperStickinessThreasholdNotinBTProximity = a3;
}

- (int64_t)commCenterBTlpmThreasholdBTProximity
{
  return self->_commCenterBTlpmThreasholdBTProximity;
}

- (void)setCommCenterBTlpmThreasholdBTProximity:(int64_t)a3
{
  self->_commCenterBTlpmThreasholdBTProximity = a3;
}

- (int64_t)commCenterAppDebouncingTimer
{
  return self->_commCenterAppDebouncingTimer;
}

- (void)setCommCenterAppDebouncingTimer:(int64_t)a3
{
  self->_commCenterAppDebouncingTimer = a3;
}

- (int64_t)commCenterPeriodicBreadCrumTimer
{
  return self->_commCenterPeriodicBreadCrumTimer;
}

- (void)setCommCenterPeriodicBreadCrumTimer:(int64_t)a3
{
  self->_commCenterPeriodicBreadCrumTimer = a3;
}

- (int64_t)commCenterBreadCrumProcTimer
{
  return self->_commCenterBreadCrumProcTimer;
}

- (void)setCommCenterBreadCrumProcTimer:(int64_t)a3
{
  self->_commCenterBreadCrumProcTimer = a3;
}

- (int64_t)cbrsEnterRsrpMin
{
  return self->_cbrsEnterRsrpMin;
}

- (void)setCbrsEnterRsrpMin:(int64_t)a3
{
  self->_cbrsEnterRsrpMin = a3;
}

- (int64_t)cbrsEnterRsrqMin
{
  return self->_cbrsEnterRsrqMin;
}

- (void)setCbrsEnterRsrqMin:(int64_t)a3
{
  self->_cbrsEnterRsrqMin = a3;
}

- (int64_t)cbrsExitRsrpMin
{
  return self->_cbrsExitRsrpMin;
}

- (void)setCbrsExitRsrpMin:(int64_t)a3
{
  self->_cbrsExitRsrpMin = a3;
}

- (int64_t)cbrsExitRsrqMin
{
  return self->_cbrsExitRsrqMin;
}

- (void)setCbrsExitRsrqMin:(int64_t)a3
{
  self->_cbrsExitRsrqMin = a3;
}

- (int64_t)nonCbrsEnterRsrpMin
{
  return self->_nonCbrsEnterRsrpMin;
}

- (void)setNonCbrsEnterRsrpMin:(int64_t)a3
{
  self->_nonCbrsEnterRsrpMin = a3;
}

- (int64_t)nonCbrsEnterRsrqMin
{
  return self->_nonCbrsEnterRsrqMin;
}

- (void)setNonCbrsEnterRsrqMin:(int64_t)a3
{
  self->_nonCbrsEnterRsrqMin = a3;
}

- (int64_t)nonCbrsExitRsrpMin
{
  return self->_nonCbrsExitRsrpMin;
}

- (void)setNonCbrsExitRsrpMin:(int64_t)a3
{
  self->_nonCbrsExitRsrpMin = a3;
}

- (int64_t)nonCbrsExitRsrqMin
{
  return self->_nonCbrsExitRsrqMin;
}

- (void)setNonCbrsExitRsrqMin:(int64_t)a3
{
  self->_nonCbrsExitRsrqMin = a3;
}

- (int64_t)cbrsEnterRsrpOffset
{
  return self->_cbrsEnterRsrpOffset;
}

- (void)setCbrsEnterRsrpOffset:(int64_t)a3
{
  self->_cbrsEnterRsrpOffset = a3;
}

- (int64_t)cbrsEnterRsrqOffset
{
  return self->_cbrsEnterRsrqOffset;
}

- (void)setCbrsEnterRsrqOffset:(int64_t)a3
{
  self->_cbrsEnterRsrqOffset = a3;
}

- (int64_t)cbrsExitRsrpOffset
{
  return self->_cbrsExitRsrpOffset;
}

- (void)setCbrsExitRsrpOffset:(int64_t)a3
{
  self->_cbrsExitRsrpOffset = a3;
}

- (int64_t)cbrsExitRsrqOffset
{
  return self->_cbrsExitRsrqOffset;
}

- (void)setCbrsExitRsrqOffset:(int64_t)a3
{
  self->_cbrsExitRsrqOffset = a3;
}

@end
