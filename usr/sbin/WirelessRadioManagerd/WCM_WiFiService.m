@implementation WCM_WiFiService

- (void)getMinMaxAvailableRxBandwidth:(id *)a3
{
  float v5;
  float v6;
  float v7;
  int v8;
  uint64_t v9;
  float v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  float v20;
  float v21;
  float v22;
  double v23;
  double v24;
  float v25;
  float v26;
  float v27;
  float v28;

  -[WCM_WiFiService getRxPhyRate](self, "getRxPhyRate");
  v6 = v5;
  if (-[WCM_WiFiService isQBSSLoadValid](self, "isQBSSLoadValid"))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("QBSS load valid, load: %lld \n"), -[WCM_WiFiService getChannelUtlization](self, "getChannelUtlization"));
    v7 = (float)(v6 * (float)(100 - -[WCM_WiFiService getChannelUtlization](self, "getChannelUtlization"))) / 100.0;
    v8 = -[WCM_WiFiService getConnectedStationCount](self, "getConnectedStationCount");
    v9 = (v8 / 3);
    if (v8 >= 9)
    {
      v10 = v7 / (float)(int)v9;
      goto LABEL_6;
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("QBSS load not valid, CCA: %lld \n"), -[WCM_WiFiService getCCA](self, "getCCA"));
    v9 = 0;
    v7 = (float)(v6 * (float)(100 - -[WCM_WiFiService getCCA](self, "getCCA"))) / 100.0;
  }
  v10 = v7 * 0.5;
LABEL_6:
  -[WCM_WiFiService getRxRetryPercent](self, "getRxRetryPercent");
  v12 = v11;
  -[WCM_WiFiService getTxRetryPercent](self, "getTxRetryPercent");
  v14 = v13;
  v15 = -[WCM_WiFiService getRxPacket](self, "getRxPacket");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("getCalculatedAvailableRxPhyBandwidth: RX PER %.2f, TX PER : %.2f RX Packet Count: %lld,Station Count: %d"), *(_QWORD *)&v12, *(_QWORD *)&v14, v15, v9);
  if (v15)
    v16 = v12;
  else
    v16 = v14;
  v17 = 1.0 - v16;
  v18 = v17 * v7;
  v19 = v17 * v10;
  v20 = v19;
  *(float *)&v19 = v18;
  LODWORD(v18) = 1152319488;
  -[WCM_WiFiService getL3Bandwidth::](self, "getL3Bandwidth::", v18, v19);
  v22 = v21;
  LODWORD(v23) = 1152319488;
  *(float *)&v24 = v20;
  -[WCM_WiFiService getL3Bandwidth::](self, "getL3Bandwidth::", v23, v24);
  v26 = v25;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("Estimated Min Bandwitdh: %.2f, Max Bandwidth: %.2f, Rate: %.2f"), v25, v22, v6);
  v27 = (float)(v26 + (float)(self->m_minMovAvgBW * 11.0)) / 12.0;
  self->m_minMovAvgBW = v27;
  v28 = (float)(v22 + (float)(self->m_maxMovAvgBW * 11.0)) / 12.0;
  self->m_maxMovAvgBW = v28;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("Estimated Min AVG Bandwitdh: %.2f, Max AVG Bandwidth: %.2f"), v27, v28);
  *(uint64x2_t *)&a3->var2 = vcvtq_u64_f64(vcvtq_f64_f32(vmul_f32(*(float32x2_t *)&self->m_minMovAvgBW, (float32x2_t)vdup_n_s32(0x447A0000u))));
  a3->var0 = (unint64_t)(float)(v26 * 1000.0);
  a3->var1 = (unint64_t)(float)(v22 * 1000.0);
}

- (unsigned)getWghtAverageRXPhyRate
{
  return self->m_wghtAvgRXPhyRate;
}

- (int)getWghtAverageSNR
{
  return self->m_wghtAvgSNR;
}

- (int)getWghtAverageRSSI
{
  return self->m_wghtAvgRSSI;
}

- (double)getTxPer
{
  return self->m_txPer;
}

- (int64_t)getCCA
{
  return self->m_cca;
}

- (void)updateWeightedAverageMetrics:(int)a3 :(int)a4 :(unsigned int)a5 :(unsigned int)a6
{
  self->m_wghtAvgMetricsValid = 1;
  self->m_wghtAvgRSSI = a3;
  self->m_wghtAvgSNR = a4;
  self->m_wghtAvgTXPhyRate = a5;
  self->m_wghtAvgRXPhyRate = a6;
  -[WCM_WiFiDelegate updateWeightAvgLQM:txRate:](self->mDelegate, "updateWeightAvgLQM:txRate:", *(_QWORD *)&a6, *(_QWORD *)&a5);
}

- (void)updateTxStats:(int64_t)a3 :(int64_t)a4 :(int64_t)a5
{
  int64_t m_cumulative_txFrame;
  int64_t v7;
  int64x2_t v8;

  if (a3 != -600 && a4 != -600 && a5 != -600)
  {
    self->m_txFrame = a3;
    self->m_txRetrans = a4;
    m_cumulative_txFrame = self->m_cumulative_txFrame;
    v7 = self->m_cumulative_txRetrans + a4;
    self->m_txFail = a5;
    self->m_cumulative_txFrame = m_cumulative_txFrame + a3;
    self->m_cumulative_txRetrans = v7;
    self->m_cumulative_txFail += a5;
    v8.i64[0] = a3;
    v8.i64[1] = a5;
    __asm
    {
      FMOV            V2.2D, #5.0
      FMOV            V1.2D, #6.0
    }
    *(float64x2_t *)&self->m_movingAverage_txFrame = vdivq_f64(vmlaq_f64(vcvtq_f64_s64(v8), _Q2, *(float64x2_t *)&self->m_movingAverage_txFrame), _Q1);
    -[WCM_WiFiService updateTxPer](self, "updateTxPer");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 19, CFSTR("WiFi TX Stats: TX Fail %lld, Tx Frame %lld, Cum Tx Fail %lld, Cum TX Frame %lld, M-AVG TxFrame %f, M-AVG TxFail %f, M-AVG TX PER %f"), self->m_txFail, self->m_txFrame, self->m_cumulative_txFail, self->m_cumulative_txFrame, *(_QWORD *)&self->m_movingAverage_txFrame, *(_QWORD *)&self->m_movingAverage_txFail, *(_QWORD *)&self->m_movingAverageTxPer);
  }
}

- (void)updateTxPer
{
  double v3;
  double v5;

  v3 = (double)self->m_txFail / ((double)self->m_txFrame + 0.000001);
  if (v3 < 0.0 || v3 > 1.0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("Invalid TX per number! %lf"), *(_QWORD *)&v3);
    v3 = -600.0;
  }
  else
  {
    v5 = self->m_movingAverage_txFail / (self->m_movingAverage_txFrame + 0.000001);
    self->m_cumulative_txPer = (double)self->m_cumulative_txFail / ((double)self->m_cumulative_txFrame + 0.000001);
    self->m_movingAverageTxPer = v5;
  }
  self->m_txPer = v3;
}

- (void)updateStationCount:(int)a3
{
  self->m_connectedStationCount = a3;
  self->m_apSupportsQbssLoad = 1;
}

- (void)updateRxStats:(int64_t)a3 :(int64_t)a4
{
  int64_t m_movingAvgRxRetrans;
  int64_t v5;

  if (a3 != -600 && a4 != -600)
  {
    m_movingAvgRxRetrans = self->m_movingAvgRxRetrans;
    v5 = (a3 + 11 * self->m_movingAvgRxFrame) / 12;
    self->m_rxFrame = a3;
    self->m_rxRetrans = a4;
    self->m_movingAvgRxFrame = v5;
    self->m_movingAvgRxRetrans = (a4 + 11 * m_movingAvgRxRetrans) / 12;
  }
}

- (void)updateRxRatio
{
  int64_t m_rxRetrans;
  int64_t m_rxFrame;
  double v4;
  int64_t m_movingAvgRxRetrans;
  double v6;
  uint64_t v7;
  double v8;
  double v9;

  m_rxFrame = self->m_rxFrame;
  m_rxRetrans = self->m_rxRetrans;
  self->m_rxRetryRatio = (double)m_rxRetrans / ((double)m_rxFrame + 0.000001);
  v4 = (double)m_rxRetrans / ((double)(m_rxFrame + m_rxRetrans) + 0.000001);
  m_movingAvgRxRetrans = self->m_movingAvgRxRetrans;
  v6 = (double)m_movingAvgRxRetrans;
  v7 = self->m_movingAvgRxFrame + m_movingAvgRxRetrans;
  self->m_rxRetryPercent = v4;
  self->m_rxMovingAvgRetryPercent = v6 / ((double)v7 + 0.000001);
  v8 = 1.0;
  if (v4 != 0.0)
  {
    v9 = (self->m_rxPrevRetryPercent - v4) * 100.0;
    if (v9 != 0.0)
      v8 = v9 / (v4 * -100.0 + 1.0 + 0.000001) + 1.0;
  }
  self->m_rxScalingFactor = v8;
  self->m_rxPrevRetryPercent = v4;
}

- (void)updateRxBeacons:(int64_t)a3 :(int64_t)a4
{
  BOOL v4;

  v4 = 0;
  if (a3 <= a4 && a4 && a3 != -600 && a4 != -600)
  {
    self->m_rxBeacons = a3;
    self->m_rxBeaconSched = a4;
    v4 = 1;
  }
  self->m_valid_beacon_per = v4;
}

- (void)updateRxBeaconPer
{
  id v3;
  int64_t m_rxBeacons;
  int64_t m_rxBeaconSched;
  double v6;
  double v8;

  v3 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getiRATConfigController");
  m_rxBeacons = self->m_rxBeacons;
  m_rxBeaconSched = self->m_rxBeaconSched;
  if (m_rxBeacons >= m_rxBeaconSched)
    m_rxBeacons = self->m_rxBeaconSched;
  v6 = 1.0 - (double)m_rxBeacons / ((double)m_rxBeaconSched + 0.000001);
  if (v6 < 0.0 || v6 > 1.0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("Invalid Beacon per number! %lf"), *(_QWORD *)&v6);
    m_rxBeaconSched = self->m_rxBeaconSched;
  }
  else
  {
    v8 = v6 * 0.2 + self->m_beaconPer * 0.8;
    self->m_beaconPer = v6;
    self->m_movAvg_beaconPer = v8;
  }
  self->m_beaconPerIsValid = m_rxBeaconSched > (uint64_t)objc_msgSend(v3, "dataWifiMinBeaconCount");
}

- (void)updatePhyRates:(int64_t)a3 :(int64_t)a4 :(int64_t)a5
{
  if (a5 <= 989999 && a4 >= 1000 && a3 >= 1000 && a5 >= 1000)
  {
    self->m_prevRxPhyRate = self->m_rxPhyRate;
    self->m_txPhyRate = (float)a3 / 1000.0;
    self->m_txFBPhyRate = (float)a4 / 1000.0;
    self->m_rxPhyRate = (float)a5 / 1000.0;
  }
}

- (void)updateFwTxStats:(int64_t)a3 :(int64_t)a4 :(int64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;

  if (a3 != -600 && a4 != -600 && a5 != -600)
  {
    self->m_fw_txFrame = a3;
    self->m_fw_txRetrans = a4;
    self->m_fw_txFail = a5;
    v7 = self->m_cumulative_fw_txFrame + a3;
    v8 = self->m_cumulative_fw_txRetrans + a4;
    self->m_cumulative_fw_txFrame = v7;
    self->m_cumulative_fw_txRetrans = v8;
    v9 = self->m_cumulative_fw_txFail + a5;
    self->m_cumulative_fw_txFail = v9;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("WiFi Stats: FW TX Fail %lld, FW Tx Frame %lld FW Cum TX Fail %lld,FW  Cum Tx Frame %lld"), a5, a3, v9, v7, v5, v6);
  }
}

- (void)updateFwTxPer
{
  double v3;

  v3 = (double)self->m_fw_txFail / ((double)self->m_fw_txFrame + 0.000001);
  if (v3 < 0.0 || v3 > 1.0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("Invalid FW TX per number! %lf"), *(_QWORD *)&v3);
    v3 = -600.0;
  }
  else
  {
    self->m_cumulative_fw_txPer = (double)self->m_cumulative_fw_txFail
                                / ((double)self->m_cumulative_fw_txFrame + 0.000001);
  }
  self->m_fw_txPer = v3;
}

- (void)updateChanUtilization:(int)a3
{
  self->m_channelUtilization = (int)(float)((float)((float)a3 * 100.0) / 255.0);
}

- (void)updateCCA:(int64_t)a3
{
  if (a3 != -600)
    self->m_cca = a3;
}

- (void)setSNR:(int64_t)a3
{
  _BOOL4 m_valid_snr_measurement;

  if (a3 != -600)
  {
    m_valid_snr_measurement = self->m_valid_snr_measurement;
    self->m_Snr = a3;
    if (!m_valid_snr_measurement)
      self->m_valid_snr_measurement = 1;
  }
}

- (void)setRSSI:(int64_t)a3
{
  int64_t v3;
  int64_t v4;

  if (a3 != -600)
  {
    if (!self->m_valid_rssi_measurement)
      self->m_valid_rssi_measurement = 1;
    self->m_rawRssi = a3;
    v3 = self->m_sample_Size + 1;
    v4 = self->m_cumRawRssi + a3;
    self->m_sample_Size = v3;
    self->m_cumRawRssi = v4;
    self->m_avgRawRssi = (uint64_t)((double)v4 / ((double)v3 + 0.000001));
  }
}

- (void)resetWghtAverageMetricsFlag
{
  self->m_wghtAvgMetricsValid = 0;
}

- (void)resetStationCount:(int)a3
{
  self->m_connectedStationCount = a3;
  self->m_apSupportsQbssLoad = 0;
}

- (BOOL)isTxPerValid
{
  BOOL v2;

  v2 = self->m_txFail + self->m_txFrame >= 30 && self->m_txPer != -600.0;
  self->m_valid_tx_error_measurements = v2;
  return v2;
}

- (BOOL)isSideCarInProgress
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCM_WiFiService isSideCarInProgress default implementation"));
  return 0;
}

- (BOOL)isQBSSLoadValid
{
  return self->m_apSupportsQbssLoad;
}

- (BOOL)isFwTxPerValid
{
  BOOL v2;

  v2 = self->m_fw_txFrame >= 15 && self->m_fw_txPer != -600.0;
  self->m_valid_fw_tx_error_measurements = v2;
  return v2;
}

- (BOOL)isEnsembleInProgress
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCM_WiFiService isEnsembleInProgress default implementation"));
  return 0;
}

- (BOOL)isCumulativeFwTxPerValid
{
  return self->m_cumulative_txFrame > 99;
}

- (BOOL)isBeaconPerValid
{
  return self->m_valid_beacon_per;
}

- (BOOL)isAutoUnlockRangingInProgress
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCM_WiFiService isAutoUnlockRangingInProgress default implementation"));
  return 0;
}

- (unsigned)getWghtAverageTXPhyRate
{
  return self->m_wghtAvgTXPhyRate;
}

- (BOOL)getWghtAverageMetricsValid
{
  return self->m_wghtAvgMetricsValid;
}

- (double)getTxRetryPercent
{
  int64_t v2;
  double result;

  v2 = self->m_fw_txRetrans + self->m_txRetrans;
  result = (double)v2 / ((double)(v2 + self->m_txFrame + self->m_fw_txFrame) + 0.000001);
  self->m_txRetryPercent = result;
  return result;
}

- (double)getTxFail
{
  return (double)self->m_txFail;
}

- (int64_t)getSNR
{
  return self->m_Snr;
}

- (double)getRxRetryPercent
{
  return self->m_rxRetryPercent;
}

- (double)getRxRatio
{
  return self->m_rxRetryRatio;
}

- (float)getRxPhyRate
{
  return self->m_rxPhyRate;
}

- (int64_t)getRxPacket
{
  return self->m_rxRetrans + self->m_rxFrame;
}

- (int64_t)getRSSI
{
  return self->m_rawRssi;
}

- (double)getMovingAvgOfRxRetryPercent
{
  return self->m_rxMovingAvgRetryPercent;
}

- (float)getL3Bandwidth:(float)a3 :(float)a4
{
  float v4;
  double v5;
  float v6;

  v4 = ceil((float)((float)((float)(a3 + 38.0) * 8.0) + 6.0) / a4) + 36.0;
  v5 = v4;
  v6 = a3 * 8.0 / v5;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("iRAT: WIFI L3 Pkt Time: %.2f, L3 Throughput : %.2f"), *(_QWORD *)&v5, v6);
  return v6;
}

- (double)getFwTxPer
{
  return self->m_fw_txPer;
}

- (double)getCumulativeTxPer
{
  return self->m_cumulative_txPer;
}

- (double)getCumulativeFwTxPer
{
  return self->m_cumulative_fw_txPer;
}

- (int)getConnectedStationCount
{
  if (self->m_connectedStationCount >= 50)
    return 0;
  else
    return self->m_connectedStationCount;
}

- (int)getChannelUtlization
{
  return self->m_channelUtilization;
}

- (double)getBeaconPer
{
  return self->m_beaconPer;
}

- (WCM_WiFiService)init
{
  WCM_WiFiService *v3;
  WCM_WiFiService *v4;
  objc_super v6;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WCM_WiFiService init"));
  v6.receiver = self;
  v6.super_class = (Class)WCM_WiFiService;
  v3 = -[WCM_WiFiService init](&v6, "init");
  v4 = v3;
  if (v3)
  {
    v3->mDelegate = 0;
    -[WCM_WiFiService initializeiRATMetrics](v3, "initializeiRATMetrics");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WCM_WiFiService dealloc"));
  v3.receiver = self;
  v3.super_class = (Class)WCM_WiFiService;
  -[WCM_WiFiService dealloc](&v3, "dealloc");
}

- (void)registerWiFiCallbacks
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCM_WiFiService registerWiFiCallbacks default implementation"));
}

- (void)unregisterWiFiCallbacks
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCM_WiFiService unregisterWiFiCallbacks default implementation"));
}

- (BOOL)isAssociated
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCM_WiFiService isAssociated default implementation"));
  return 0;
}

- (BOOL)isAWDLInProgress
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCM_WiFiService isAWDLInProgress default implementation"));
  return 0;
}

- (BOOL)isCarPlaySessionInProgress
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCM_WiFiService isCarPlaySessionInProgress default implementation"));
  return 0;
}

- (void)updateCarPlaySessionState:(BOOL)a3 reason:(int)a4
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCM_WiFiService updateCarPlaySessionState default implementation"));
}

- (int)getCarPlayScanRelaxReason
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCM_WiFiService getCarPlayScanRelaxReason default implementation"));
  return 4;
}

- (void)updateContentionFreeWiFiInfoToRC2:(unsigned int)a3 count:(unsigned int)a4
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCM_WiFiService updateContentionFreeWiFiInfoToRC2 default implementation"));
}

- (id)getLeastCongestedWifiParam
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCM_WiFiService getLeastCongestedWifiParam default implementation"));
  return 0;
}

- (BOOL)didWiFiDeviceReset
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCM_WiFiService didWiFiDeviceReset default implementation"));
  return 0;
}

- (int)getPhyMode
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCM_WiFiService getPhyMode default implementation"));
  return 0;
}

- (BOOL)isCoPresenceInProgress
{
  return 0;
}

- (int64_t)getNumberOfSpatialStream
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCM_WiFiService getNumberOfSpatialStream default implementation"));
  return 0;
}

- (int64_t)getNumberOfSpatialStreamOnAccessPoint
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCM_WiFiService getNumberOfSpatialStreamOnAccessPoint default implementation"));
  return 0;
}

- (void)setDelegate:(id)a3
{
  self->mDelegate = (WCM_WiFiDelegate *)a3;
}

- (void)updateCurrentHostAPState:(BOOL)a3 channel:(int)a4 centerFreq:(unsigned int)a5 bandwidth:(unsigned int)a6 apState:(int)a7
{
  WCM_WiFiDelegate *mDelegate;
  WCM_WiFiDelegate *v10;
  _BOOL8 v11;

  mDelegate = self->mDelegate;
  if (a3)
  {
    -[WCM_WiFiDelegate updateWiFiState:channel:centerFreq:bandwidth:hostAp:](mDelegate, "updateWiFiState:channel:centerFreq:bandwidth:hostAp:", *(_QWORD *)&a7, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, 1);
    v10 = self->mDelegate;
    v11 = a7 > 2;
  }
  else
  {
    -[WCM_WiFiDelegate updateWiFiState:channel:centerFreq:bandwidth:hostAp:](mDelegate, "updateWiFiState:channel:centerFreq:bandwidth:hostAp:", *(_QWORD *)&a7, 0, 0, 0, 0);
    v10 = self->mDelegate;
    v11 = 0;
  }
  -[WCM_WiFiDelegate update5GHzHostAPState:](v10, "update5GHzHostAPState:", v11);
}

- (BOOL)setWiFiBTCoexProfile:(id)a3 atIndex:(int64_t)a4
{
  return 0;
}

- (void)initializeiRATMetrics
{
  int64_t *p_m_txFrame;

  *(_OWORD *)&self->m_txFrame = 0u;
  p_m_txFrame = &self->m_txFrame;
  *(_OWORD *)(p_m_txFrame - 5) = xmmword_1001DF010;
  *((_OWORD *)p_m_txFrame + 1) = 0u;
  *((_OWORD *)p_m_txFrame + 2) = 0u;
  *((_OWORD *)p_m_txFrame + 3) = 0u;
  *((_OWORD *)p_m_txFrame + 4) = 0u;
  *((_OWORD *)p_m_txFrame + 5) = 0u;
  *((_OWORD *)p_m_txFrame + 6) = 0u;
  *((_OWORD *)p_m_txFrame + 7) = 0u;
  *((_OWORD *)p_m_txFrame + 8) = 0u;
  *((_OWORD *)p_m_txFrame + 9) = 0u;
  *((_OWORD *)p_m_txFrame + 10) = 0u;
  *((_OWORD *)p_m_txFrame + 11) = 0u;
  *((_OWORD *)p_m_txFrame + 12) = 0u;
  *((_OWORD *)p_m_txFrame + 13) = 0u;
  *(_OWORD *)((char *)p_m_txFrame + 217) = 0u;
  p_m_txFrame[30] = 0;
  p_m_txFrame[31] = 0;
  p_m_txFrame[32] = 0;
  p_m_txFrame[33] = 0x3FF0000000000000;
  *(int64_t *)((char *)p_m_txFrame + 292) = 0x477DE800477DE800;
  *((_DWORD *)p_m_txFrame + 76) = 1199433728;
  *((_DWORD *)p_m_txFrame + 80) = 0;
  *((_BYTE *)p_m_txFrame + 324) = 0;
  *((_BYTE *)p_m_txFrame + 288) = 0;
  *((_DWORD *)p_m_txFrame - 12) = 0;
  *((_BYTE *)p_m_txFrame - 44) = 0;
  *(int64_t *)((char *)p_m_txFrame + 308) = 0;
  *((_BYTE *)p_m_txFrame + 316) = 0;
  p_m_txFrame[41] = 0;
  p_m_txFrame[42] = 0;
  *((_OWORD *)p_m_txFrame + 25) = 0u;
  *((_OWORD *)p_m_txFrame + 26) = 0u;
  p_m_txFrame[54] = 0;
}

- (BOOL)setLQMReportInterval:(int)a3
{
  return 1;
}

- (int64_t)getAvgRSSI
{
  return self->m_avgRawRssi;
}

- (float)calculatePhyRate
{
  float result;

  result = (double)self->m_Snr * 2.692 + -0.4397;
  if (result < 0.0)
    return 1.0;
  return result;
}

- (float)getTxPhyRate
{
  return self->m_txPhyRate;
}

- (float)getprevRxPhyRate
{
  return self->m_prevRxPhyRate;
}

- (float)getEstimatedAvailableRxPhyBandwidth
{
  float v3;
  float v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int64_t v9;
  uint64_t v10;
  double v11;

  -[WCM_WiFiService calculatePhyRate](self, "calculatePhyRate");
  v4 = v3;
  -[WCM_WiFiService getRxRetryPercent](self, "getRxRetryPercent");
  v6 = v5;
  -[WCM_WiFiService getTxRetryPercent](self, "getTxRetryPercent");
  v8 = v7;
  v9 = -[WCM_WiFiService getRxPacket](self, "getRxPacket");
  v10 = -[WCM_WiFiService getStationCountWithPendingData](self, "getStationCountWithPendingData");
  if ((int)v10 >= 2)
    v4 = v4 / (float)(int)v10;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("getEstimatedAvailableRxPhyBandwidth: RX PER %.2f, TX PER : %.2f, RX Packet Count: %lld,Station Count: %d"), *(_QWORD *)&v6, *(_QWORD *)&v8, v9, v10);
  if (v9)
    v11 = v6;
  else
    v11 = v8;
  return (1.0 - v11) * v4;
}

- (float)getCalculatedAvailableRxPhyBandwidth
{
  float v3;
  float v4;
  float v5;
  float v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int64_t v11;
  uint64_t v12;
  double v13;

  -[WCM_WiFiService getRxPhyRate](self, "getRxPhyRate");
  v4 = v3;
  -[WCM_WiFiService getprevRxPhyRate](self, "getprevRxPhyRate");
  v6 = (float)(v4 + v5) * 0.5;
  -[WCM_WiFiService getRxRetryPercent](self, "getRxRetryPercent");
  v8 = v7;
  -[WCM_WiFiService getTxRetryPercent](self, "getTxRetryPercent");
  v10 = v9;
  v11 = -[WCM_WiFiService getRxPacket](self, "getRxPacket");
  v12 = -[WCM_WiFiService getConnectedStationCount](self, "getConnectedStationCount");
  if ((int)v12 >= 2)
    v6 = v6 / (float)(int)v12;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("getCalculatedAvailableRxPhyBandwidth: RX PER %.2f, TX PER : %.2f RX Packet Count: %lld,Station Count: %d"), *(_QWORD *)&v8, *(_QWORD *)&v10, v11, v12);
  if (v11)
    v13 = v8;
  else
    v13 = v10;
  return (1.0 - v13) * v6;
}

- (float)getBWScallingFactor
{
  return self->m_rxScalingFactor;
}

- (float)getCalculatedAvailableTxPhyBandwidth
{
  float v3;
  float v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int64_t v9;
  uint64_t v10;
  double v11;

  -[WCM_WiFiService getTxPhyRate](self, "getTxPhyRate");
  v4 = v3;
  -[WCM_WiFiService getRxRetryPercent](self, "getRxRetryPercent");
  v6 = v5;
  -[WCM_WiFiService getTxRetryPercent](self, "getTxRetryPercent");
  v8 = v7;
  v9 = -[WCM_WiFiService getRxPacket](self, "getRxPacket");
  v10 = -[WCM_WiFiService getStationCountWithPendingData](self, "getStationCountWithPendingData");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 28, CFSTR("getCalculatedAvailableTxPhyBandwidth: RX PER %.2f, TX PER : %.2f RX Packet Count: %lld,Station Count: %d"), *(_QWORD *)&v6, *(_QWORD *)&v8, v9, v10);
  if ((int)v10 >= 2)
    v4 = v4 / (float)(int)v10;
  if (self->m_txFrame + self->m_fw_txFrame)
    v11 = v8;
  else
    v11 = v6;
  return (1.0 - v11) * v4;
}

- (int)getStationCountWithPendingData
{
  return self->m_connectedStationCount;
}

- (double)getMovingAverageTxPer
{
  return self->m_movingAverageTxPer;
}

- (BOOL)isMovingAverageTxPerValid
{
  return self->m_movingAverage_txFrame + self->m_movingAverage_txFail >= 180.0;
}

- (double)getAdjustedBeaconPer
{
  uint64_t v2;

  v2 = 280;
  if (self->m_rxBeaconSched > 19)
    v2 = 272;
  return *(double *)((char *)&self->super.isa + v2);
}

- (BOOL)isBeaconSchedValid
{
  return self->m_beaconPerIsValid;
}

- (BOOL)isRetryValid
{
  return self->m_txRetrans + self->m_txFrame >= 180 && self->m_txPer != -600.0;
}

- (BOOL)isCumulativeTxPerValid
{
  return self->m_cumulative_txFrame > 199;
}

- (void)resetCumulativeCounters
{
  self->m_movingAverageTxPer = 0.0;
  *(_OWORD *)&self->m_movingAverage_txFrame = 0u;
  *(_OWORD *)&self->m_cumulative_txFail = 0u;
  *(_OWORD *)&self->m_cumulative_txFrame = 0u;
  *(_OWORD *)&self->m_cumulative_fw_txFrame = 0u;
  *(_OWORD *)&self->m_cumulative_fw_txFail = 0u;
}

- (void)resetWiFiBWEstimationState
{
  self->m_rxRetryRatio = 0.0;
  *(_QWORD *)&self->m_minMovAvgBW = 0;
  self->m_movingAvgRxFrame = 0;
  self->m_movingAvgRxRetrans = 0;
  *(_OWORD *)&self->m_rxRetryPercent = 0u;
  *(_OWORD *)&self->m_rxMovingAvgRetryPercent = 0u;
}

- (BOOL)isRxPacketLossObserved
{
  return self->m_rxRetrans > 0;
}

- (BOOL)isRxRatioValid
{
  int64_t m_rxRetrans;
  BOOL v3;
  BOOL v4;

  m_rxRetrans = self->m_rxRetrans;
  if (m_rxRetrans)
    v3 = self->m_rxFrame + m_rxRetrans <= 29;
  else
    v3 = 1;
  v4 = !v3;
  self->m_valid_rx_error_measurements = v4;
  return v4;
}

- (BOOL)isWiFiNetworkCaptive
{
  return 0;
}

- (BOOL)isWoWEnabled
{
  return self->m_WoWEnabled != 0;
}

- (void)setWoWState:(unsigned __int8)a3
{
  self->m_WoWEnabled = a3;
}

- (BOOL)isWiFiConnected
{
  return 1;
}

- (BOOL)isWiFiPrimaryInterface
{
  return 1;
}

- (int)getTxLossRateBE
{
  return self->m_txPacketLossBE;
}

- (int)getTxLossRateBK
{
  return self->m_txPacketLossBK;
}

- (int)getTxLossRateVI
{
  return self->m_txPacketLossVI;
}

- (int)getTxLossRateVO
{
  return self->m_txPacketLossVO;
}

- (void)updateTxLossRateBE:(int)a3
{
  self->m_txPacketLossBE = a3;
}

- (void)updateTxLossRateBK:(int)a3
{
  self->m_txPacketLossBK = a3;
}

- (void)updateTxLossRateVI:(int)a3
{
  self->m_txPacketLossVI = a3;
}

- (void)updateTxLossRateVO:(int)a3
{
  self->m_txPacketLossVO = a3;
}

- (int)getTxThroughputBE
{
  return self->m_txThroughputEstBE;
}

- (int)getTxThroughputBK
{
  return self->m_txThroughputEstBK;
}

- (int)getTxThroughputVI
{
  return self->m_txThroughputEstVI;
}

- (int)getTxThroughputVO
{
  return self->m_txThroughputEstVO;
}

- (void)updateTxThroughputBE:(int)a3
{
  self->m_txThroughputEstBE = a3;
}

- (void)updateTxThroughputBK:(int)a3
{
  self->m_txThroughputEstBK = a3;
}

- (void)updateTxThroughputVI:(int)a3
{
  self->m_txThroughputEstVI = a3;
}

- (void)updateTxThroughputVO:(int)a3
{
  self->m_txThroughputEstVO = a3;
}

- (int)getLifeTimeBE
{
  return self->m_txPacketLifetimeBE;
}

- (int)getLifeTimeBK
{
  return self->m_txPacketLifetimeBK;
}

- (int)getLifeTimeVI
{
  return self->m_txPacketLifetimeVI;
}

- (int)getLifeTimeVO
{
  return self->m_txPacketLifetimeVO;
}

- (void)updateLifeTimeBE:(int)a3
{
  self->m_txPacketLifetimeBE = a3;
}

- (void)updateLifeTimeBK:(int)a3
{
  self->m_txPacketLifetimeBK = a3;
}

- (void)updateLifeTimeVI:(int)a3
{
  self->m_txPacketLifetimeVI = a3;
}

- (void)updateLifeTimeVO:(int)a3
{
  self->m_txPacketLifetimeVO = a3;
}

- (int)getBadVoiceCounter
{
  int v2;

  v2 = self->m_currentBadVoiceCounter - self->m_prevBadVoiceCounter;
  return v2 & ~(v2 >> 31);
}

- (int)getGoodVoiceCounter
{
  int v2;

  v2 = self->m_currentGoodVoiceCounter - self->m_prevGoodVoiceCounter;
  return v2 & ~(v2 >> 31);
}

- (int)getBadVideoCounter
{
  int v2;

  v2 = self->m_currentBadVideoCounter - self->m_prevBadVideoCounter;
  return v2 & ~(v2 >> 31);
}

- (int)getGoodVideoCounter
{
  int v2;

  v2 = self->m_currentGoodVoideoCounter - self->m_prevGoodVideoCounter;
  return v2 & ~(v2 >> 31);
}

- (int)getInvalidCounter
{
  int v2;

  v2 = self->m_currentInvalidCounter - self->m_prevInvalidCounter;
  return v2 & ~(v2 >> 31);
}

- (void)updateBadVoiceCounter:(int)a3
{
  self->m_prevBadVoiceCounter = self->m_currentBadVoiceCounter;
  self->m_currentBadVoiceCounter = a3;
}

- (void)updateGoodVoiceCounter:(int)a3
{
  self->m_prevGoodVoiceCounter = self->m_currentGoodVoiceCounter;
  self->m_currentGoodVoiceCounter = a3;
}

- (void)updateBadVideoCounter:(int)a3
{
  self->m_prevBadVideoCounter = self->m_currentBadVideoCounter;
  self->m_currentBadVideoCounter = a3;
}

- (void)updateGoodVideoCounter:(int)a3
{
  self->m_prevGoodVideoCounter = self->m_currentGoodVoideoCounter;
  self->m_currentGoodVoideoCounter = a3;
}

- (void)updateInvalidCounter:(int)a3
{
  self->m_prevInvalidCounter = self->m_currentInvalidCounter;
  self->m_currentInvalidCounter = a3;
}

- (void)updateVoiceDecision:(int)a3
{
  self->m_decisionVO = a3;
}

- (int)getVoiceDecision
{
  return self->m_decisionVO;
}

- (int)getBEDecision
{
  return self->m_decisionVI_BE;
}

- (void)updateBEDecision:(int)a3
{
  self->m_decisionVI_BE = a3;
}

- (BOOL)deviceAssociatedOnPreferredNetwork
{
  return 1;
}

- (int)getPointOfInterest
{
  return 3;
}

- (BOOL)getAirplayStatus
{
  return 0;
}

- (BOOL)getP2pRCU2CoexEventStatus
{
  return 0;
}

- (BOOL)isWiFiQualityGoodForProximityMode
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  unsigned int v7;
  id v8;
  unsigned int v9;
  BOOL result;

  v3 = -[WCM_WiFiService getRSSI](self, "getRSSI");
  v4 = -[WCM_WiFiService getSNR](self, "getSNR");
  -[WCM_WiFiService getBeaconPer](self, "getBeaconPer");
  v6 = v5;
  v7 = -[WCM_WiFiService isAssociated](self, "isAssociated");
  v8 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getiRATConfigController");
  v9 = -[WCM_WiFiService isWiFiPrimaryInterface](self, "isWiFiPrimaryInterface");
  result = 0;
  if (v9 && v7)
    return v4 >= 11
        && v3 > (uint64_t)objc_msgSend(v8, "dataMinWifiRssiTh0")
        && v6 * 100.0 < (double)(uint64_t)objc_msgSend(v8, "dataMinWifiBeaconPerTh0")
        && -[WCM_WiFiService isLSMWiFiQualityGood](self, "isLSMWiFiQualityGood");
  return result;
}

- (BOOL)isLSMWiFiQualityGood
{
  int m_decisionVI_BE;

  m_decisionVI_BE = self->m_decisionVI_BE;
  if (m_decisionVI_BE == 1)
    return 1;
  if (m_decisionVI_BE)
    return self->m_txPacketLossVI < 16;
  return 0;
}

- (BOOL)isSlowWiFi
{
  return 0;
}

- (unsigned)getWiFiBW
{
  return 0;
}

- (unsigned)getChannelType
{
  return 0;
}

@end
