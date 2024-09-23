@implementation WiFiUsageLQMUserSample

- (NSString)fgApp
{
  return self->_fgApp;
}

- (unint64_t)txL3Packets
{
  return self->_txL3Packets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bssDetails, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_mloSamples, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_motionState, 0);
  objc_storeStrong((id *)&self->_fgApp, 0);
  objc_storeStrong((id *)&self->_networkDetails, 0);
}

- (void)updateWithChQualScore:(unint64_t)a3 txLatencyScore:(unint64_t)a4 rxLatencyScore:(unint64_t)a5 txLossScore:(unint64_t)a6 rxLossScore:(unint64_t)a7 txLatencyP95:(unint64_t)a8 linkRecommendationFlags:(unint64_t)a9 rtTrafficStatus:(unint64_t)a10
{
  unint64_t v16;

  -[WiFiUsageLQMUserSample setChanQualScore:](self, "setChanQualScore:", a3);
  -[WiFiUsageLQMUserSample setTxLatencyScore:](self, "setTxLatencyScore:", a4);
  -[WiFiUsageLQMUserSample setRxLatencyScore:](self, "setRxLatencyScore:", a5);
  -[WiFiUsageLQMUserSample setTxLossScore:](self, "setTxLossScore:", a6);
  -[WiFiUsageLQMUserSample setRxLossScore:](self, "setRxLossScore:", a7);
  -[WiFiUsageLQMUserSample setTxLatencyP95:](self, "setTxLatencyP95:", a8);
  if (a9 == 0x7FFFFFFFFFFFFFFFLL)
    v16 = 0;
  else
    v16 = (a9 >> 1) & 1;
  -[WiFiUsageLQMUserSample setDriverRoamRecommended:](self, "setDriverRoamRecommended:", (a9 != 0x7FFFFFFFFFFFFFFFLL) & a9);
  -[WiFiUsageLQMUserSample setDriverTDrecommended:](self, "setDriverTDrecommended:", v16);
  -[WiFiUsageLQMUserSample setTrafficState:](self, "setTrafficState:", a10);
}

- (void)setTxLossScore:(unint64_t)a3
{
  self->_txLossScore = a3;
}

- (void)setTxLatencyScore:(unint64_t)a3
{
  self->_txLatencyScore = a3;
}

- (void)setTxLatencyP95:(unint64_t)a3
{
  self->_txLatencyP95 = a3;
}

- (void)setTrafficState:(unint64_t)a3
{
  self->_trafficState = a3;
}

- (void)setRxLossScore:(unint64_t)a3
{
  self->_rxLossScore = a3;
}

- (void)setRxLatencyScore:(unint64_t)a3
{
  self->_rxLatencyScore = a3;
}

- (void)setDriverTDrecommended:(unint64_t)a3
{
  self->_driverTDrecommended = a3;
}

- (void)setDriverRoamRecommended:(unint64_t)a3
{
  self->_driverRoamRecommended = a3;
}

- (void)setChanQualScore:(unint64_t)a3
{
  self->_chanQualScore = a3;
}

- (unint64_t)txRateOverDeviceTheoreticalMaxPercentage
{
  return self->_txRateOverDeviceTheoreticalMaxPercentage;
}

- (unint64_t)rxRateOverDeviceTheoreticalMaxPercentage
{
  return self->_rxRateOverDeviceTheoreticalMaxPercentage;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (WiFiUsageNetworkDetails)networkDetails
{
  return self->_networkDetails;
}

- (unint64_t)driverTDrecommended
{
  return self->_driverTDrecommended;
}

- (int64_t)rssi
{
  return self->_rssi;
}

- (unint64_t)rxStartOverDecodingAttemptsPercentage
{
  return self->_rxStartOverDecodingAttemptsPercentage;
}

- (unint64_t)decodingAttempts
{
  return self->_decodingAttempts;
}

- (int64_t)rssi_core0
{
  return self->_rssi_core0;
}

- (int64_t)rssi_core1
{
  return self->_rssi_core1;
}

- (unint64_t)txRetriesOverTxFrames
{
  return self->_txRetriesOverTxFrames;
}

- (unint64_t)txRate
{
  return self->_txRate;
}

- (unint64_t)txFrames
{
  return self->_txFrames;
}

- (unint64_t)txFailsOverTxFrames
{
  return self->_txFailsOverTxFrames;
}

- (unint64_t)txBytesOverTxFrames
{
  return self->_txBytesOverTxFrames;
}

- (unint64_t)totalReportedCca
{
  return self->_totalReportedCca;
}

- (int64_t)snr
{
  return self->_snr;
}

- (unint64_t)selfCca
{
  return self->_selfCca;
}

- (unint64_t)rxRetriesOverRxFrames
{
  return self->_rxRetriesOverRxFrames;
}

- (unint64_t)rxRate
{
  return self->_rxRate;
}

- (unint64_t)rxFrames
{
  return self->_rxFrames;
}

- (unint64_t)rxBytesOverRxFrames
{
  return self->_rxBytesOverRxFrames;
}

- (unint64_t)otherCca
{
  return self->_otherCca;
}

- (int64_t)noise
{
  return self->_noise;
}

- (unint64_t)interference
{
  return self->_interference;
}

- (unint64_t)beaconPer
{
  return self->_beaconPer;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
  objc_storeStrong((id *)&self->_interfaceName, a3);
}

- (void)setFgApp:(id)a3
{
  objc_storeStrong((id *)&self->_fgApp, a3);
}

- (void)updateWithTxBytes:(unint64_t)a3 RxBytes:(unint64_t)a4 TxL3Packets:(unint64_t)a5 RxL3Packets:(unint64_t)a6 txBytesSecondary:(unint64_t)a7 rxBytesSecondary:(unint64_t)a8
{
  -[WiFiUsageLQMUserSample setTxBytesOverTxFrames:](self, "setTxBytesOverTxFrames:", +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", a3, self->_txFrames, +[WiFiUsageLQMTransformations byteScale](WiFiUsageLQMTransformations, "byteScale") == 1));
  -[WiFiUsageLQMUserSample setRxBytesOverRxFrames:](self, "setRxBytesOverRxFrames:", +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", a4, self->_rxFrames, +[WiFiUsageLQMTransformations byteScale](WiFiUsageLQMTransformations, "byteScale") == 1));
  -[WiFiUsageLQMUserSample setTxBytesOverTxL3Packets:](self, "setTxBytesOverTxL3Packets:", +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", a3, a5, +[WiFiUsageLQMTransformations byteScale](WiFiUsageLQMTransformations, "byteScale") == 1));
  -[WiFiUsageLQMUserSample setRxBytesOverRxL3Packets:](self, "setRxBytesOverRxL3Packets:", +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", a4, a6, +[WiFiUsageLQMTransformations byteScale](WiFiUsageLQMTransformations, "byteScale") == 1));
  -[WiFiUsageLQMUserSample setTxL3Packets:](self, "setTxL3Packets:", a5);
  -[WiFiUsageLQMUserSample setRxL3Packets:](self, "setRxL3Packets:", a6);
  -[WiFiUsageLQMUserSample setTxBytes:](self, "setTxBytes:", a3);
  -[WiFiUsageLQMUserSample setRxBytes:](self, "setRxBytes:", a4);
  -[WiFiUsageLQMUserSample setTxBytesSecondary:](self, "setTxBytesSecondary:", a7);
  -[WiFiUsageLQMUserSample setRxBytesSecondary:](self, "setRxBytesSecondary:", a8);
}

- (void)updateWithInterfaceCapabilities:(id)a3 AndNetworkDetails:(id)a4
{
  id v6;
  id v7;
  void *v8;
  WiFiUsageBssDetails *bssDetails;

  v6 = a3;
  v7 = a4;
  -[WiFiUsageLQMUserSample setNetworkDetails:](self, "setNetworkDetails:", v7);
  objc_msgSend(v7, "connectedBss");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WiFiUsageLQMUserSample setBssDetails:](self, "setBssDetails:", v8);
  if (v6 && -[WiFiUsageBssDetails nSS](self->_bssDetails, "nSS") == 0x7FFFFFFFFFFFFFFFLL)
    -[WiFiUsageBssDetails setNSS:](self->_bssDetails, "setNSS:", objc_msgSend(v6, "currentNumberOfSpatialStreams"));
  -[WiFiUsageLQMUserSample setCapabilities:](self, "setCapabilities:", v6);
  if (v6)
  {
    bssDetails = self->_bssDetails;
    if (bssDetails)
    {
      +[WiFiUsageLQMTransformations ratePercentagesWithTxRate:rxRate:txFallbackRate:txFrames:rxFrames:nss:bw:phyMode:band:deviceMaxRate:](WiFiUsageLQMTransformations, "ratePercentagesWithTxRate:rxRate:txFallbackRate:txFrames:rxFrames:nss:bw:phyMode:band:deviceMaxRate:", self->_txRate, self->_rxRate, 0, self->_txFrames, self->_rxFrames, -[WiFiUsageBssDetails nSS](bssDetails, "nSS"), -[WiFiUsageBssDetails channelWidth](self->_bssDetails, "channelWidth"), __PAIR64__(-[WiFiUsageBssDetails band](self->_bssDetails, "band"), -[WiFiUsageBssDetails phyMode](self->_bssDetails, "phyMode")), objc_msgSend(v6, "maxInterfacePHYRate"));
      self->_txRateOverLinkTheoreticalMaxPercentage = 0;
      self->_rxRateOverLinkTheoreticalMaxPercentage = 0;
      self->_linkTheoreticalMaxRate = 0;
      self->_txRateOverDeviceTheoreticalMaxPercentage = 0;
      self->_rxRateOverDeviceTheoreticalMaxPercentage = 0;
    }
  }

}

- (void)setTxL3Packets:(unint64_t)a3
{
  self->_txL3Packets = a3;
}

- (void)setTxBytesSecondary:(unint64_t)a3
{
  self->_txBytesSecondary = a3;
}

- (void)setTxBytesOverTxL3Packets:(unint64_t)a3
{
  self->_txBytesOverTxL3Packets = a3;
}

- (void)setTxBytesOverTxFrames:(unint64_t)a3
{
  self->_txBytesOverTxFrames = a3;
}

- (void)setTxBytes:(unint64_t)a3
{
  self->_txBytes = a3;
}

- (void)setRxL3Packets:(unint64_t)a3
{
  self->_rxL3Packets = a3;
}

- (void)setRxBytesSecondary:(unint64_t)a3
{
  self->_rxBytesSecondary = a3;
}

- (void)setRxBytesOverRxL3Packets:(unint64_t)a3
{
  self->_rxBytesOverRxL3Packets = a3;
}

- (void)setRxBytesOverRxFrames:(unint64_t)a3
{
  self->_rxBytesOverRxFrames = a3;
}

- (void)setRxBytes:(unint64_t)a3
{
  self->_rxBytes = a3;
}

- (void)setNetworkDetails:(id)a3
{
  objc_storeStrong((id *)&self->_networkDetails, a3);
}

- (void)setCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_capabilities, a3);
}

- (void)populateWithTxFrames:(unint64_t)a3 RxFrames:(unint64_t)a4 TxFails:(unint64_t)a5 TxRetries:(unint64_t)a6 RxRetries:(unint64_t)a7 TxRate:(unint64_t)a8 RxRate:(unint64_t)a9 txRTS:(unint64_t)a10 txRTSFail:(unint64_t)a11 txMpdu:(unint64_t)a12 txAMPDU:(unint64_t)a13
{
  -[WiFiUsageLQMUserSample setTxFrames:](self, "setTxFrames:");
  -[WiFiUsageLQMUserSample setRxFrames:](self, "setRxFrames:", a4);
  -[WiFiUsageLQMUserSample setTxRetriesOverTxFrames:](self, "setTxRetriesOverTxFrames:", +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", a6, a3, +[WiFiUsageLQMTransformations ratioScale](WiFiUsageLQMTransformations, "ratioScale")));
  -[WiFiUsageLQMUserSample setRxRetriesOverRxFrames:](self, "setRxRetriesOverRxFrames:", +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", a7, a4, +[WiFiUsageLQMTransformations ratioScale](WiFiUsageLQMTransformations, "ratioScale")));
  -[WiFiUsageLQMUserSample setTxFailsOverTxFrames:](self, "setTxFailsOverTxFrames:", +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", a5, a3, +[WiFiUsageLQMTransformations ratioScale](WiFiUsageLQMTransformations, "ratioScale")));
  -[WiFiUsageLQMUserSample setTxRate:](self, "setTxRate:", +[WiFiUsageLQMTransformations validateRate:frames:](WiFiUsageLQMTransformations, "validateRate:frames:", a8, a3));
  -[WiFiUsageLQMUserSample setRxRate:](self, "setRxRate:", +[WiFiUsageLQMTransformations validateRate:frames:](WiFiUsageLQMTransformations, "validateRate:frames:", a9, a4));
  -[WiFiUsageLQMUserSample setTxRTS:](self, "setTxRTS:", a10);
  -[WiFiUsageLQMUserSample setTxRTSFailOvertxRTS:](self, "setTxRTSFailOvertxRTS:", +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", a11, a10, +[WiFiUsageLQMTransformations ratioScale](WiFiUsageLQMTransformations, "ratioScale")));
  -[WiFiUsageLQMUserSample setTxMpduDensity:](self, "setTxMpduDensity:", +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", a12, a13, 1));
}

- (void)setTxRetriesOverTxFrames:(unint64_t)a3
{
  self->_txRetriesOverTxFrames = a3;
}

- (void)setTxRateOverLinkTheoreticalMaxPercentage:(unint64_t)a3
{
  self->_txRateOverLinkTheoreticalMaxPercentage = a3;
}

- (void)setTxRTSFailOvertxRTS:(unint64_t)a3
{
  self->_txRTSFailOvertxRTS = a3;
}

- (void)setTxRTS:(unint64_t)a3
{
  self->_txRTS = a3;
}

- (void)setTxFrames:(unint64_t)a3
{
  self->_txFrames = a3;
}

- (void)setTxFailsOverTxFrames:(unint64_t)a3
{
  self->_txFailsOverTxFrames = a3;
}

- (void)setRxRetriesOverRxFrames:(unint64_t)a3
{
  self->_rxRetriesOverRxFrames = a3;
}

- (void)setRxRateOverLinkTheoreticalMaxPercentage:(unint64_t)a3
{
  self->_rxRateOverLinkTheoreticalMaxPercentage = a3;
}

- (void)setRxFrames:(unint64_t)a3
{
  self->_rxFrames = a3;
}

- (void)setTxMpduDensity:(unint64_t)a3
{
  self->_txMpduDensity = a3;
}

- (void)setIsFTactive:(BOOL)a3
{
  self->_isFTactive = a3;
}

- (void)populateWithMotionState:(id)a3 andAppState:(id)a4
{
  int v4;

  v4 = *(_DWORD *)&a4.var0;
  -[WiFiUsageLQMUserSample setMotionState:](self, "setMotionState:", a3);
  -[WiFiUsageLQMUserSample setIsTimeSensitiveAppRunning:](self, "setIsTimeSensitiveAppRunning:", (*(_QWORD *)&v4 & 0xFF0000) != 0);
  -[WiFiUsageLQMUserSample setIsAnyAppInFG:](self, "setIsAnyAppInFG:", v4 != 0);
  -[WiFiUsageLQMUserSample setIsFTactive:](self, "setIsFTactive:", (v4 & 0xFF00) != 0);
}

- (void)setMotionState:(id)a3
{
  objc_storeStrong((id *)&self->_motionState, a3);
}

- (void)setIsTimeSensitiveAppRunning:(BOOL)a3
{
  self->_isTimeSensitiveAppRunning = a3;
}

- (void)setIsAnyAppInFG:(BOOL)a3
{
  self->_isAnyAppInFG = a3;
}

- (void)populateWithRssi:(int64_t)a3 rssi0:(int64_t)a4 rssi1:(int64_t)a5 rssiMode:(unint64_t)a6 noise:(int64_t)a7 noise0:(int64_t)a8 noise1:(int64_t)a9 snr:(int64_t)a10 selfCca:(unint64_t)a11 otherCca:(unint64_t)a12 interference:(unint64_t)a13 totalReportedCca:(unint64_t)a14 beaconPer:(unint64_t)a15 rxCrsGlitch:(unint64_t)a16 rxBadPLCP:(unint64_t)a17 rxStart:(unint64_t)a18 rxBphyCrsGlitch:(unint64_t)a19 rxBphyBadPLCP:(unint64_t)a20 sampleDuration:(unint64_t)a21
{
  int64_t v25;
  int64_t v26;
  int64_t v27;
  int64_t v28;
  objc_super v29;
  objc_super v30;
  objc_super v31;
  objc_super v32;
  objc_super v33;
  objc_super v34;

  -[WiFiUsageLQMUserSample populateWithRssi:noise:snr:selfCca:otherCca:interference:totalReportedCca:beaconPer:rxCrsGlitch:rxBadPLCP:rxStart:sampleDuration:](self, "populateWithRssi:noise:snr:selfCca:otherCca:interference:totalReportedCca:beaconPer:rxCrsGlitch:rxBadPLCP:rxStart:sampleDuration:", a3, a7, a10, a11, a12, a13, a14, a15, a16, a17, a18, a21);
  if (a4)
    v25 = a4;
  else
    v25 = 0x7FFFFFFFFFFFFFFFLL;
  self->_rssi_core0 = v25;
  if (a5)
    v26 = a5;
  else
    v26 = 0x7FFFFFFFFFFFFFFFLL;
  self->_rssi_core1 = v26;
  v34.receiver = self;
  v34.super_class = (Class)WiFiUsageLQMUserSample;
  self->_diff_rssi_core0 = objc_msgSend(-[WiFiUsageLQMUserSample class](&v34, sel_class), "subtract:From:", self->_rssi_core0, self->_rssi);
  v33.receiver = self;
  v33.super_class = (Class)WiFiUsageLQMUserSample;
  self->_diff_rssi_core1 = objc_msgSend(-[WiFiUsageLQMUserSample class](&v33, sel_class), "subtract:From:", self->_rssi_core1, self->_rssi);
  v32.receiver = self;
  v32.super_class = (Class)WiFiUsageLQMUserSample;
  self->_diff_rssicore1_rssicore0 = objc_msgSend(-[WiFiUsageLQMUserSample class](&v32, sel_class), "subtract:From:", self->_rssi_core0, self->_rssi_core1);
  if (a8)
    v27 = a8;
  else
    v27 = 0x7FFFFFFFFFFFFFFFLL;
  self->_noise_core0 = v27;
  if (a9)
    v28 = a9;
  else
    v28 = 0x7FFFFFFFFFFFFFFFLL;
  self->_noise_core1 = v28;
  v31.receiver = self;
  v31.super_class = (Class)WiFiUsageLQMUserSample;
  self->_diff_noise_core0 = objc_msgSend(-[WiFiUsageLQMUserSample class](&v31, sel_class), "subtract:From:", self->_noise_core0, self->_noise);
  v30.receiver = self;
  v30.super_class = (Class)WiFiUsageLQMUserSample;
  self->_diff_noise_core1 = objc_msgSend(-[WiFiUsageLQMUserSample class](&v30, sel_class), "subtract:From:", self->_noise_core1, self->_noise);
  v29.receiver = self;
  v29.super_class = (Class)WiFiUsageLQMUserSample;
  self->_diff_noisecore1_noisecore0 = objc_msgSend(-[WiFiUsageLQMUserSample class](&v29, sel_class), "subtract:From:", self->_noise_core0, self->_noise_core1);
  if (a16 == 0x7FFFFFFFFFFFFFFFLL || a17 == 0x7FFFFFFFFFFFFFFFLL || a18 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[WiFiUsageLQMUserSample setDecodingAttempts:](self, "setDecodingAttempts:", 0x7FFFFFFFFFFFFFFFLL);
    -[WiFiUsageLQMUserSample setRxStartOverDecodingAttemptsPercentage:](self, "setRxStartOverDecodingAttemptsPercentage:", 0x7FFFFFFFFFFFFFFFLL);
    -[WiFiUsageLQMUserSample setRxBadPlcpOverDecodingAttemptsPercentage:](self, "setRxBadPlcpOverDecodingAttemptsPercentage:", 0x7FFFFFFFFFFFFFFFLL);
    -[WiFiUsageLQMUserSample setRxCrsGlitchOverDecodingAttemptsPercentage:](self, "setRxCrsGlitchOverDecodingAttemptsPercentage:", 0x7FFFFFFFFFFFFFFFLL);
  }
  else
  {
    +[WiFiUsageLQMTransformations decodingAttemptsWithRxCrsGlitch:rxBadPLCP:RxBphyCrsGlitch:rxBphyBadPLCP:rxStart:](WiFiUsageLQMTransformations, "decodingAttemptsWithRxCrsGlitch:rxBadPLCP:RxBphyCrsGlitch:rxBphyBadPLCP:rxStart:");
    -[WiFiUsageLQMUserSample setDecodingAttempts:](self, "setDecodingAttempts:", 0);
    -[WiFiUsageLQMUserSample setRxStartOverDecodingAttemptsPercentage:](self, "setRxStartOverDecodingAttemptsPercentage:", 0);
    -[WiFiUsageLQMUserSample setRxCrsGlitchOverDecodingAttemptsPercentage:](self, "setRxCrsGlitchOverDecodingAttemptsPercentage:", 0);
    -[WiFiUsageLQMUserSample setRxBadPlcpOverDecodingAttemptsPercentage:](self, "setRxBadPlcpOverDecodingAttemptsPercentage:", 0);
  }
}

- (void)populateWithRssi:(int64_t)a3 noise:(int64_t)a4 snr:(int64_t)a5 selfCca:(unint64_t)a6 otherCca:(unint64_t)a7 interference:(unint64_t)a8 totalReportedCca:(unint64_t)a9 beaconPer:(unint64_t)a10 rxCrsGlitch:(unint64_t)a11 rxBadPLCP:(unint64_t)a12 rxStart:(unint64_t)a13 sampleDuration:(unint64_t)a14
{
  int64_t v21;
  int64_t v22;
  int64_t v23;

  -[WiFiUsageLQMUserSample setDuration:](self, "setDuration:", a14);
  if (a3)
    v21 = a3;
  else
    v21 = 0x7FFFFFFFFFFFFFFFLL;
  -[WiFiUsageLQMUserSample setRssi:](self, "setRssi:", v21);
  if (a4)
    v22 = a4;
  else
    v22 = 0x7FFFFFFFFFFFFFFFLL;
  -[WiFiUsageLQMUserSample setNoise:](self, "setNoise:", v22);
  if (a5)
    v23 = a5;
  else
    v23 = 0x7FFFFFFFFFFFFFFFLL;
  -[WiFiUsageLQMUserSample setSnr:](self, "setSnr:", v23);
  -[WiFiUsageLQMUserSample setSelfCca:](self, "setSelfCca:", a6);
  -[WiFiUsageLQMUserSample setOtherCca:](self, "setOtherCca:", a7);
  -[WiFiUsageLQMUserSample setInterference:](self, "setInterference:", a8);
  -[WiFiUsageLQMUserSample setTotalReportedCca:](self, "setTotalReportedCca:", a9);
  -[WiFiUsageLQMUserSample setBeaconPer:](self, "setBeaconPer:", a10);
  if (a11 == 0x7FFFFFFFFFFFFFFFLL || a12 == 0x7FFFFFFFFFFFFFFFLL || a13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[WiFiUsageLQMUserSample setDecodingAttempts:](self, "setDecodingAttempts:", 0x7FFFFFFFFFFFFFFFLL, a12);
    -[WiFiUsageLQMUserSample setRxStartOverDecodingAttemptsPercentage:](self, "setRxStartOverDecodingAttemptsPercentage:", 0x7FFFFFFFFFFFFFFFLL);
    -[WiFiUsageLQMUserSample setRxBadPlcpOverDecodingAttemptsPercentage:](self, "setRxBadPlcpOverDecodingAttemptsPercentage:", 0x7FFFFFFFFFFFFFFFLL);
    -[WiFiUsageLQMUserSample setRxCrsGlitchOverDecodingAttemptsPercentage:](self, "setRxCrsGlitchOverDecodingAttemptsPercentage:", 0x7FFFFFFFFFFFFFFFLL);
  }
  else
  {
    +[WiFiUsageLQMTransformations decodingAttemptsWithRxCrsGlitch:rxBadPLCP:RxBphyCrsGlitch:rxBphyBadPLCP:rxStart:](WiFiUsageLQMTransformations, "decodingAttemptsWithRxCrsGlitch:rxBadPLCP:RxBphyCrsGlitch:rxBphyBadPLCP:rxStart:");
    -[WiFiUsageLQMUserSample setDecodingAttempts:](self, "setDecodingAttempts:", 0);
    -[WiFiUsageLQMUserSample setRxStartOverDecodingAttemptsPercentage:](self, "setRxStartOverDecodingAttemptsPercentage:", 0);
    -[WiFiUsageLQMUserSample setRxBadPlcpOverDecodingAttemptsPercentage:](self, "setRxBadPlcpOverDecodingAttemptsPercentage:", 0);
    -[WiFiUsageLQMUserSample setRxCrsGlitchOverDecodingAttemptsPercentage:](self, "setRxCrsGlitchOverDecodingAttemptsPercentage:", 0);
  }
}

- (void)setRxStartOverDecodingAttemptsPercentage:(unint64_t)a3
{
  self->_rxStartOverDecodingAttemptsPercentage = a3;
}

- (void)setRxCrsGlitchOverDecodingAttemptsPercentage:(unint64_t)a3
{
  self->_rxCrsGlitchOverDecodingAttemptsPercentage = a3;
}

- (void)setRxBadPlcpOverDecodingAttemptsPercentage:(unint64_t)a3
{
  self->_rxBadPlcpOverDecodingAttemptsPercentage = a3;
}

- (void)setDecodingAttempts:(unint64_t)a3
{
  self->_decodingAttempts = a3;
}

- (void)setDuration:(unint64_t)a3
{
  self->_duration = a3;
}

- (void)setTotalReportedCca:(unint64_t)a3
{
  self->_totalReportedCca = a3;
}

- (void)setSnr:(int64_t)a3
{
  self->_snr = a3;
}

- (void)setSelfCca:(unint64_t)a3
{
  self->_selfCca = a3;
}

- (void)setRssi:(int64_t)a3
{
  self->_rssi = a3;
}

- (void)setOtherCca:(unint64_t)a3
{
  self->_otherCca = a3;
}

- (void)setNoise:(int64_t)a3
{
  self->_noise = a3;
}

- (void)setInterference:(unint64_t)a3
{
  self->_interference = a3;
}

- (void)setBeaconPer:(unint64_t)a3
{
  self->_beaconPer = a3;
}

- (WiFiUsageLQMUserSample)initWithInterfaceName:(id)a3
{
  id v4;
  WiFiUsageLQMUserSample *v5;
  uint64_t v6;
  NSString *interfaceName;
  uint64_t v8;
  NSDate *timestamp;
  NSMutableArray *mloSamples;
  WiFiUsageLQMUserSample *v11;
  objc_super v13;

  v4 = a3;
  if (v4)
  {
    v13.receiver = self;
    v13.super_class = (Class)WiFiUsageLQMUserSample;
    v5 = -[WiFiUsageLQMUserSample init](&v13, sel_init);
    v6 = objc_msgSend(v4, "copy");
    interfaceName = v5->_interfaceName;
    v5->_interfaceName = (NSString *)v6;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v8;

    v5->_rssi = 0x7FFFFFFFFFFFFFFFLL;
    v5->_noise = 0x7FFFFFFFFFFFFFFFLL;
    v5->_snr = 0x7FFFFFFFFFFFFFFFLL;
    v5->_rssi_core0 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_rssi_core1 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_diff_rssi_core0 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_diff_rssi_core1 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_diff_rssicore1_rssicore0 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_noise_core0 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_noise_core1 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_diff_noise_core0 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_diff_noise_core1 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_diff_noisecore1_noisecore0 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_selfCca = 0x7FFFFFFFFFFFFFFFLL;
    v5->_otherCca = 0x7FFFFFFFFFFFFFFFLL;
    v5->_interference = 0x7FFFFFFFFFFFFFFFLL;
    v5->_totalReportedCca = 0x7FFFFFFFFFFFFFFFLL;
    v5->_beaconPer = 0x7FFFFFFFFFFFFFFFLL;
    v5->_decodingAttempts = 0x7FFFFFFFFFFFFFFFLL;
    v5->_txFrames = 0x7FFFFFFFFFFFFFFFLL;
    v5->_rxFrames = 0x7FFFFFFFFFFFFFFFLL;
    v5->_txL3Packets = 0x7FFFFFFFFFFFFFFFLL;
    v5->_rxL3Packets = 0x7FFFFFFFFFFFFFFFLL;
    v5->_txRate = 0x7FFFFFFFFFFFFFFFLL;
    v5->_rxRate = 0x7FFFFFFFFFFFFFFFLL;
    v5->_linkTheoreticalMaxRate = 0x7FFFFFFFFFFFFFFFLL;
    v5->_txRateOverLinkTheoreticalMaxPercentage = 0x7FFFFFFFFFFFFFFFLL;
    v5->_rxRateOverLinkTheoreticalMaxPercentage = 0x7FFFFFFFFFFFFFFFLL;
    v5->_txRateOverDeviceTheoreticalMaxPercentage = 0x7FFFFFFFFFFFFFFFLL;
    v5->_rxRateOverDeviceTheoreticalMaxPercentage = 0x7FFFFFFFFFFFFFFFLL;
    v5->_txRTS = 0x7FFFFFFFFFFFFFFFLL;
    v5->_txMpduDensity = 0x7FFFFFFFFFFFFFFFLL;
    v5->_chanQualScore = 0x7FFFFFFFFFFFFFFFLL;
    v5->_txLatencyScore = 0x7FFFFFFFFFFFFFFFLL;
    v5->_rxLatencyScore = 0x7FFFFFFFFFFFFFFFLL;
    v5->_txLossScore = 0x7FFFFFFFFFFFFFFFLL;
    v5->_rxLossScore = 0x7FFFFFFFFFFFFFFFLL;
    v5->_txLatencyP95 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_driverRoamRecommended = 0x7FFFFFFFFFFFFFFFLL;
    v5->_driverTDrecommended = 0x7FFFFFFFFFFFFFFFLL;
    v5->_trafficState = 0x7FFFFFFFFFFFFFFFLL;
    v5->_isBSPActive = 0;
    v5->_bspTimeToTST = 0x7FFFFFFFFFFFFFFFLL;
    v5->_isScanActiveBSP = 0;
    v5->_isP2PActiveBSP = 0;
    v5->_bspTriggerCount = 0x7FFFFFFFFFFFFFFFLL;
    v5->_bspMutePercentage = 0x7FFFFFFFFFFFFFFFLL;
    v5->_bspMaxMuteMS = 0x7FFFFFFFFFFFFFFFLL;
    v5->_bspAvgMuteMS = 0x7FFFFFFFFFFFFFFFLL;
    v5->_bspErrorPercentage = 0x7FFFFFFFFFFFFFFFLL;
    v5->_bspTimeOutPercentageOfTriggers = 0x7FFFFFFFFFFFFFFFLL;
    v5->_bspRejectOrFailPercentageOfTriggers = 0x7FFFFFFFFFFFFFFFLL;
    v5->_bspMaxConsecutiveFails = 0x7FFFFFFFFFFFFFFFLL;
    mloSamples = v5->_mloSamples;
    v5->_mloSamples = 0;

    self = v5;
    v11 = self;
  }
  else
  {
    NSLog(CFSTR("%s - Invalid interfaceName:%@"), "-[WiFiUsageLQMUserSample initWithInterfaceName:]", 0);
    v11 = 0;
  }

  return v11;
}

- (BOOL)isBspSampleDurationExpected:(unint64_t)a3
{
  unint64_t v4;
  unint64_t v5;
  BOOL v6;

  v4 = -[WiFiUsageLQMUserSample duration](self, "duration");
  v5 = 1000 * v4 - a3;
  if (1000 * v4 < a3)
    v5 = a3 - 1000 * v4;
  if (a3)
    v6 = v5 >= 20000 * v4 / 0x64;
  else
    v6 = 1;
  return !v6;
}

- (void)populateWithBspOverflowed:(BOOL)a3 IsBSPActive:(BOOL)a4 BspTimeToTST:(unint64_t)a5 BspSampleDurationMS:(unint64_t)a6 IsScanActiveBSP:(BOOL)a7 IsP2PActiveBSP:(BOOL)a8 BspTriggerCount:(unint64_t)a9 BspMutePercentage:(unint64_t)a10 BspMaxMuteMS:(unint64_t)a11 BspAvgMuteMS:(unint64_t)a12 BspErrorPercentage:(unint64_t)a13 BspTimeOutPercentageOfTriggers:(unint64_t)a14 BspRejectOrFailPercentageOfTriggers:(unint64_t)a15 BspMaxConsecutiveFails:(unint64_t)a16
{
  _BOOL8 v16;
  _BOOL8 v17;
  _BOOL4 v20;

  v16 = a8;
  v17 = a7;
  v20 = a4;
  -[WiFiUsageLQMUserSample setIsBSPActive:](self, "setIsBSPActive:", a4);
  if (v20 && !a3)
  {
    if (-[WiFiUsageLQMUserSample isBspSampleDurationExpected:](self, "isBspSampleDurationExpected:", a6))
    {
      -[WiFiUsageLQMUserSample setBspTimeToTST:](self, "setBspTimeToTST:", a5);
      -[WiFiUsageLQMUserSample setIsScanActiveBSP:](self, "setIsScanActiveBSP:", v17);
      -[WiFiUsageLQMUserSample setIsP2PActiveBSP:](self, "setIsP2PActiveBSP:", v16);
      -[WiFiUsageLQMUserSample setBspTriggerCount:](self, "setBspTriggerCount:", a9);
      -[WiFiUsageLQMUserSample setBspMutePercentage:](self, "setBspMutePercentage:", a10);
      -[WiFiUsageLQMUserSample setBspMaxMuteMS:](self, "setBspMaxMuteMS:", a11);
      -[WiFiUsageLQMUserSample setBspAvgMuteMS:](self, "setBspAvgMuteMS:", a12);
      -[WiFiUsageLQMUserSample setBspErrorPercentage:](self, "setBspErrorPercentage:", a13);
      -[WiFiUsageLQMUserSample setBspTimeOutPercentageOfTriggers:](self, "setBspTimeOutPercentageOfTriggers:", a14);
      -[WiFiUsageLQMUserSample setBspRejectOrFailPercentageOfTriggers:](self, "setBspRejectOrFailPercentageOfTriggers:", a15);
      -[WiFiUsageLQMUserSample setBspMaxConsecutiveFails:](self, "setBspMaxConsecutiveFails:", a16);
    }
  }
}

- (void)populateWithPerMLOLinkStats:(apple_mlo_link_lqm *)a3
{
  WiFiUsageLQMMLOSample *v5;
  unint64_t duration;
  __int128 v7;
  WiFiUsageLQMMLOSample *v8;
  NSMutableArray *mloSamples;
  NSMutableArray *v10;
  NSMutableArray *v11;
  _OWORD v12[2];
  uint64_t v13;

  v5 = [WiFiUsageLQMMLOSample alloc];
  duration = self->_duration;
  v7 = *(_OWORD *)&a3->var4;
  v12[0] = *(_OWORD *)&a3->var0;
  v12[1] = v7;
  v13 = *(_QWORD *)&a3->var8;
  v8 = -[WiFiUsageLQMMLOSample initWith:andDuration:](v5, "initWith:andDuration:", v12, duration);
  if (v8)
  {
    mloSamples = self->_mloSamples;
    if (!mloSamples)
    {
      v10 = (NSMutableArray *)objc_opt_new();
      v11 = self->_mloSamples;
      self->_mloSamples = v10;

      mloSamples = self->_mloSamples;
    }
    -[NSMutableArray addObject:](mloSamples, "addObject:", v8);
  }

}

- (int64_t)rssiForTD
{
  unint64_t perCoreRssiInUse;

  perCoreRssiInUse = self->_perCoreRssiInUse;
  if (perCoreRssiInUse > 2)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return *(int64_t *)((char *)&self->super.super.isa + *off_1E881D7E8[perCoreRssiInUse]);
}

- (id)description
{
  void *v2;
  WiFiUsageNetworkDetails *networkDetails;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v2 = (void *)MEMORY[0x1E0CB37A0];
  networkDetails = self->_networkDetails;
  v8.receiver = self;
  v8.super_class = (Class)WiFiUsageLQMUserSample;
  -[WiFiUsageLQMSample description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@{%@}"), networkDetails, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)appendNetworkDetailsToDict:(id)a3
{
  WiFiUsageNetworkDetails *networkDetails;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  networkDetails = self->_networkDetails;
  v5 = a3;
  +[WiFiUsagePrivacyFilter getLabelsForNetworkProperties:](WiFiUsagePrivacyFilter, "getLabelsForNetworkProperties:", networkDetails);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v6);

  -[WiFiUsageNetworkDetails bssEnvironment](self->_networkDetails, "bssEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("bssEnvironment"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WiFiUsageNetworkDetails isPersonalHotspot](self->_networkDetails, "isPersonalHotspot"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("isPersonalHotspot"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WiFiUsageNetworkDetails hasEnterpriseSecurity](self->_networkDetails, "hasEnterpriseSecurity"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("isEnterprise"));

}

- (void)appendBSSDetailsToDict:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  WiFiUsageBssDetails *bssDetails;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:", -[WiFiUsageBssDetails band](self->_bssDetails, "band"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v4, CFSTR("band"));

  +[WiFiUsagePrivacyFilter subBandForBSPAsStringFromChannel:andBand:](WiFiUsagePrivacyFilter, "subBandForBSPAsStringFromChannel:andBand:", -[WiFiUsageBssDetails channel](self->_bssDetails, "channel"), -[WiFiUsageBssDetails band](self->_bssDetails, "band"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v5, CFSTR("bandForBSP"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", -[WiFiUsageBssDetails channel](self->_bssDetails, "channel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v7, CFSTR("channel"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", -[WiFiUsageBssDetails channelWidth](self->_bssDetails, "channelWidth"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v9, CFSTR("channelWidth"));

  -[WiFiUsageBssDetails apProfile](self->_bssDetails, "apProfile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v10, CFSTR("apProfile"));

  bssDetails = self->_bssDetails;
  if (bssDetails)
  {
    -[WiFiUsageBssDetails currentMloLinks](bssDetails, "currentMloLinks");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "componentsJoinedByString:", CFSTR("|"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, CFSTR("MLOConfiguration"));

    -[WiFiUsageBssDetails mloTrafficSwitchEnabled](self->_bssDetails, "mloTrafficSwitchEnabled");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, CFSTR("isMloTrafficSwitchEnabled"));

    +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:", -[WiFiUsageBssDetails currentMloPreferredBand](self->_bssDetails, "currentMloPreferredBand"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, CFSTR("mloPreferredBand"));

  }
}

- (id)asDictionaryInto:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  -[WiFiUsageLQMUserSample appendBSSDetailsToDict:](self, "appendBSSDetailsToDict:", v4);
  -[WiFiUsageLQMUserSample appendNetworkDetailsToDict:](self, "appendNetworkDetailsToDict:", v4);
  v7.receiver = self;
  v7.super_class = (Class)WiFiUsageLQMUserSample;
  -[WiFiUsageLQMSample asDictionaryInto:](&v7, sel_asDictionaryInto_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)allLQMProperties
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v2 = (void *)MEMORY[0x1E0C99E20];
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___WiFiUsageLQMUserSample;
  objc_msgSendSuper2(&v7, sel_allLQMProperties);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObject:", CFSTR("fgApp"));
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

+ (id)featureFromFieldName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;

  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", CFSTR("chanQualScore"), CFSTR("minimum"), CFSTR("txLatencyScore"), CFSTR("minimum"), CFSTR("rxLatencyScore"), CFSTR("minimum"), CFSTR("txLossScore"), CFSTR("minimum"), CFSTR("rxLossScore"), CFSTR("maximum"), CFSTR("txLatencyP95"), CFSTR("maximum"), CFSTR("isAnyAppInFG"), CFSTR("maximum"), CFSTR("isFTactive"), CFSTR("maximum"), CFSTR("isTimeSensitiveAppRunning"),
    CFSTR("mode"),
    CFSTR("driverRoamRecommended"),
    CFSTR("mode"),
    CFSTR("driverTDrecommended"),
    CFSTR("mode"),
    CFSTR("trafficState"),
    CFSTR("mode"),
    CFSTR("duration"),
    0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = CFSTR("median");

  return v7;
}

- (NSString)motionState
{
  return self->_motionState;
}

- (BOOL)isAnyAppInFG
{
  return self->_isAnyAppInFG;
}

- (BOOL)isFTactive
{
  return self->_isFTactive;
}

- (BOOL)isTimeSensitiveAppRunning
{
  return self->_isTimeSensitiveAppRunning;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (void)setRssi_core0:(int64_t)a3
{
  self->_rssi_core0 = a3;
}

- (void)setRssi_core1:(int64_t)a3
{
  self->_rssi_core1 = a3;
}

- (int64_t)diff_rssi_core0
{
  return self->_diff_rssi_core0;
}

- (void)setDiff_rssi_core0:(int64_t)a3
{
  self->_diff_rssi_core0 = a3;
}

- (int64_t)diff_rssi_core1
{
  return self->_diff_rssi_core1;
}

- (void)setDiff_rssi_core1:(int64_t)a3
{
  self->_diff_rssi_core1 = a3;
}

- (int64_t)diff_rssicore1_rssicore0
{
  return self->_diff_rssicore1_rssicore0;
}

- (void)setDiff_rssicore1_rssicore0:(int64_t)a3
{
  self->_diff_rssicore1_rssicore0 = a3;
}

- (unint64_t)perCoreRssiInUse
{
  return self->_perCoreRssiInUse;
}

- (void)setPerCoreRssiInUse:(unint64_t)a3
{
  self->_perCoreRssiInUse = a3;
}

- (int64_t)noise_core0
{
  return self->_noise_core0;
}

- (void)setNoise_core0:(int64_t)a3
{
  self->_noise_core0 = a3;
}

- (int64_t)noise_core1
{
  return self->_noise_core1;
}

- (void)setNoise_core1:(int64_t)a3
{
  self->_noise_core1 = a3;
}

- (int64_t)diff_noise_core0
{
  return self->_diff_noise_core0;
}

- (void)setDiff_noise_core0:(int64_t)a3
{
  self->_diff_noise_core0 = a3;
}

- (int64_t)diff_noise_core1
{
  return self->_diff_noise_core1;
}

- (void)setDiff_noise_core1:(int64_t)a3
{
  self->_diff_noise_core1 = a3;
}

- (int64_t)diff_noisecore1_noisecore0
{
  return self->_diff_noisecore1_noisecore0;
}

- (void)setDiff_noisecore1_noisecore0:(int64_t)a3
{
  self->_diff_noisecore1_noisecore0 = a3;
}

- (unint64_t)rxCrsGlitchOverDecodingAttemptsPercentage
{
  return self->_rxCrsGlitchOverDecodingAttemptsPercentage;
}

- (unint64_t)rxBadPlcpOverDecodingAttemptsPercentage
{
  return self->_rxBadPlcpOverDecodingAttemptsPercentage;
}

- (unint64_t)txBytes
{
  return self->_txBytes;
}

- (unint64_t)rxBytes
{
  return self->_rxBytes;
}

- (unint64_t)txBytesSecondary
{
  return self->_txBytesSecondary;
}

- (unint64_t)rxBytesSecondary
{
  return self->_rxBytesSecondary;
}

- (unint64_t)rxL3Packets
{
  return self->_rxL3Packets;
}

- (unint64_t)txBytesOverTxL3Packets
{
  return self->_txBytesOverTxL3Packets;
}

- (unint64_t)rxBytesOverRxL3Packets
{
  return self->_rxBytesOverRxL3Packets;
}

- (unint64_t)linkTheoreticalMaxRate
{
  return self->_linkTheoreticalMaxRate;
}

- (void)setLinkTheoreticalMaxRate:(unint64_t)a3
{
  self->_linkTheoreticalMaxRate = a3;
}

- (void)setRxRate:(unint64_t)a3
{
  self->_rxRate = a3;
}

- (void)setTxRate:(unint64_t)a3
{
  self->_txRate = a3;
}

- (unint64_t)txRateOverLinkTheoreticalMaxPercentage
{
  return self->_txRateOverLinkTheoreticalMaxPercentage;
}

- (unint64_t)rxRateOverLinkTheoreticalMaxPercentage
{
  return self->_rxRateOverLinkTheoreticalMaxPercentage;
}

- (void)setTxRateOverDeviceTheoreticalMaxPercentage:(unint64_t)a3
{
  self->_txRateOverDeviceTheoreticalMaxPercentage = a3;
}

- (void)setRxRateOverDeviceTheoreticalMaxPercentage:(unint64_t)a3
{
  self->_rxRateOverDeviceTheoreticalMaxPercentage = a3;
}

- (unint64_t)txRTS
{
  return self->_txRTS;
}

- (unint64_t)txRTSFailOvertxRTS
{
  return self->_txRTSFailOvertxRTS;
}

- (unint64_t)txMpduDensity
{
  return self->_txMpduDensity;
}

- (unint64_t)chanQualScore
{
  return self->_chanQualScore;
}

- (unint64_t)txLatencyScore
{
  return self->_txLatencyScore;
}

- (unint64_t)rxLatencyScore
{
  return self->_rxLatencyScore;
}

- (unint64_t)txLossScore
{
  return self->_txLossScore;
}

- (unint64_t)rxLossScore
{
  return self->_rxLossScore;
}

- (unint64_t)txLatencyP95
{
  return self->_txLatencyP95;
}

- (unint64_t)driverRoamRecommended
{
  return self->_driverRoamRecommended;
}

- (unint64_t)trafficState
{
  return self->_trafficState;
}

- (NSMutableArray)mloSamples
{
  return self->_mloSamples;
}

- (void)setMloSamples:(id)a3
{
  objc_storeStrong((id *)&self->_mloSamples, a3);
}

- (BOOL)isBSPActive
{
  return self->_isBSPActive;
}

- (void)setIsBSPActive:(BOOL)a3
{
  self->_isBSPActive = a3;
}

- (unint64_t)bspTimeToTST
{
  return self->_bspTimeToTST;
}

- (void)setBspTimeToTST:(unint64_t)a3
{
  self->_bspTimeToTST = a3;
}

- (BOOL)isScanActiveBSP
{
  return self->_isScanActiveBSP;
}

- (void)setIsScanActiveBSP:(BOOL)a3
{
  self->_isScanActiveBSP = a3;
}

- (BOOL)isP2PActiveBSP
{
  return self->_isP2PActiveBSP;
}

- (void)setIsP2PActiveBSP:(BOOL)a3
{
  self->_isP2PActiveBSP = a3;
}

- (unint64_t)bspTriggerCount
{
  return self->_bspTriggerCount;
}

- (void)setBspTriggerCount:(unint64_t)a3
{
  self->_bspTriggerCount = a3;
}

- (unint64_t)bspMutePercentage
{
  return self->_bspMutePercentage;
}

- (void)setBspMutePercentage:(unint64_t)a3
{
  self->_bspMutePercentage = a3;
}

- (unint64_t)bspMaxMuteMS
{
  return self->_bspMaxMuteMS;
}

- (void)setBspMaxMuteMS:(unint64_t)a3
{
  self->_bspMaxMuteMS = a3;
}

- (unint64_t)bspAvgMuteMS
{
  return self->_bspAvgMuteMS;
}

- (void)setBspAvgMuteMS:(unint64_t)a3
{
  self->_bspAvgMuteMS = a3;
}

- (unint64_t)bspErrorPercentage
{
  return self->_bspErrorPercentage;
}

- (void)setBspErrorPercentage:(unint64_t)a3
{
  self->_bspErrorPercentage = a3;
}

- (unint64_t)bspTimeOutPercentageOfTriggers
{
  return self->_bspTimeOutPercentageOfTriggers;
}

- (void)setBspTimeOutPercentageOfTriggers:(unint64_t)a3
{
  self->_bspTimeOutPercentageOfTriggers = a3;
}

- (unint64_t)bspRejectOrFailPercentageOfTriggers
{
  return self->_bspRejectOrFailPercentageOfTriggers;
}

- (void)setBspRejectOrFailPercentageOfTriggers:(unint64_t)a3
{
  self->_bspRejectOrFailPercentageOfTriggers = a3;
}

- (unint64_t)bspMaxConsecutiveFails
{
  return self->_bspMaxConsecutiveFails;
}

- (void)setBspMaxConsecutiveFails:(unint64_t)a3
{
  self->_bspMaxConsecutiveFails = a3;
}

- (WiFiUsageInterfaceCapabilities)capabilities
{
  return self->_capabilities;
}

- (WiFiUsageBssDetails)bssDetails
{
  return self->_bssDetails;
}

- (void)setBssDetails:(id)a3
{
  objc_storeStrong((id *)&self->_bssDetails, a3);
}

@end
