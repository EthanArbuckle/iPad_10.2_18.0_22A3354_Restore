@implementation SNConnectionMetrics

- (id)getConnectionMetricsDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SNConnectionMetrics connectionMethod](self, "connectionMethod");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SNConnectionMetrics connectionEdgeID](self, "connectionEdgeID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SNConnectionMetrics tcpInfoMetricsByInterfaceName](self, "tcpInfoMetricsByInterfaceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ConnectionMethod: %@ on Edge: %@ TCP_INFO: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (SNConnectionMetrics)remoteMetrics
{
  return self->_remoteMetrics;
}

- (void)setRemoteMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_remoteMetrics, a3);
}

- (NSString)snapshotTriggerReason
{
  return self->_snapshotTriggerReason;
}

- (void)setSnapshotTriggerReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)providerStyle
{
  return self->_providerStyle;
}

- (void)setProviderStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)metricsCount
{
  return self->_metricsCount;
}

- (void)setMetricsCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)policyId
{
  return self->_policyId;
}

- (void)setPolicyId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)timeUntilOpen
{
  return self->_timeUntilOpen;
}

- (void)setTimeUntilOpen:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)timeUntilFirstByteRead
{
  return self->_timeUntilFirstByteRead;
}

- (void)setTimeUntilFirstByteRead:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)attemptCount
{
  return self->_attemptCount;
}

- (void)setAttemptCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)dnsResolutionTime
{
  return self->_dnsResolutionTime;
}

- (void)setDnsResolutionTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)connectionStartTimeToDNSResolutionTimeMsec
{
  return self->_connectionStartTimeToDNSResolutionTimeMsec;
}

- (void)setConnectionStartTimeToDNSResolutionTimeMsec:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)connectionEstablishmentTimeMsec
{
  return self->_connectionEstablishmentTimeMsec;
}

- (void)setConnectionEstablishmentTimeMsec:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)connectionStartTimeToConnectionEstablishmentTimeMsec
{
  return self->_connectionStartTimeToConnectionEstablishmentTimeMsec;
}

- (void)setConnectionStartTimeToConnectionEstablishmentTimeMsec:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)connectionStartTimeToTLSHandshakeTimeMsec
{
  return self->_connectionStartTimeToTLSHandshakeTimeMsec;
}

- (void)setConnectionStartTimeToTLSHandshakeTimeMsec:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)tlsVersion
{
  return self->_tlsVersion;
}

- (void)setTlsVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)tlsHandshakeTimeMsec
{
  return self->_tlsHandshakeTimeMsec;
}

- (void)setTlsHandshakeTimeMsec:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)pingCount
{
  return self->_pingCount;
}

- (void)setPingCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSNumber)meanPing
{
  return self->_meanPing;
}

- (void)setMeanPing:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSNumber)unacknowledgedPingCount
{
  return self->_unacknowledgedPingCount;
}

- (void)setUnacknowledgedPingCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSDictionary)flowNetworkInterfaceType
{
  return self->_flowNetworkInterfaceType;
}

- (void)setFlowNetworkInterfaceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSDictionary)tcpInfoMetricsByInterfaceName
{
  return self->_tcpInfoMetricsByInterfaceName;
}

- (void)setTCPInfoMetricsByInterfaceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSNumber)subflowCount
{
  return self->_subflowCount;
}

- (void)setSubflowCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSNumber)connectedSubflowCount
{
  return self->_connectedSubflowCount;
}

- (void)setConnectedSubflowCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSDictionary)subflowSwitchCounts
{
  return self->_subflowSwitchCounts;
}

- (void)setSubflowSwitchCounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSString)primarySubflowInterfaceName
{
  return self->_primarySubflowInterfaceName;
}

- (void)setPrimarySubflowInterfaceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)connectionMethod
{
  return self->_connectionMethod;
}

- (void)setConnectionMethod:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)connectionEdgeID
{
  return self->_connectionEdgeID;
}

- (void)setConnectionEdgeID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSString)connectionEdgeType
{
  return self->_connectionEdgeType;
}

- (void)setConnectionEdgeType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSArray)connectionMethodHistory
{
  return self->_connectionMethodHistory;
}

- (void)setConnectionMethodHistory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSNumber)connectionFallbackReason
{
  return self->_connectionFallbackReason;
}

- (void)setConnectionFallbackReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSNumber)connectionDelay
{
  return self->_connectionDelay;
}

- (void)setConnectionDelay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSNumber)firstTxByteDelay
{
  return self->_firstTxByteDelay;
}

- (void)setFirstTxByteDelay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSString)carrierName
{
  return self->_carrierName;
}

- (void)setCarrierName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSNumber)signalStrengthBars
{
  return self->_signalStrengthBars;
}

- (void)setSignalStrengthBars:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSNumber)simSubscriptions
{
  return self->_simSubscriptions;
}

- (void)setSimSubscriptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSString)wifiPhyMode
{
  return self->_wifiPhyMode;
}

- (void)setWifiPhyMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSString)wifiChannelInfo
{
  return self->_wifiChannelInfo;
}

- (void)setWifiChannelInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSNumber)rssi
{
  return self->_rssi;
}

- (void)setRssi:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSNumber)snr
{
  return self->_snr;
}

- (void)setSnr:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (NSNumber)cca
{
  return self->_cca;
}

- (void)setCca:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (NSNumber)isCaptive
{
  return self->_isCaptive;
}

- (void)setIsCaptive:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (NSDictionary)symptomsBasedNetworkQuality
{
  return self->_symptomsBasedNetworkQuality;
}

- (void)setSymptomsBasedNetworkQuality:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (NSNumber)idsLastMessageDelay
{
  return self->_idsLastMessageDelay;
}

- (void)setIdsLastMessageDelay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (NSNumber)idsLastSocketDelay
{
  return self->_idsLastSocketDelay;
}

- (void)setIdsLastSocketDelay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (NSNumber)idsLastSocketOpenError
{
  return self->_idsLastSocketOpenError;
}

- (void)setIdsLastSocketOpenError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (NETSchemaNETSessionConnectionSnapshotCaptured)connectionSnapshot
{
  return self->_connectionSnapshot;
}

- (void)setConnectionSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_connectionSnapshot, a3);
}

- (NETSchemaNETDebugSessionConnectionSnapshotCaptured)debugConnectionSnapshot
{
  return self->_debugConnectionSnapshot;
}

- (void)setDebugConnectionSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_debugConnectionSnapshot, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugConnectionSnapshot, 0);
  objc_storeStrong((id *)&self->_connectionSnapshot, 0);
  objc_storeStrong((id *)&self->_idsLastSocketOpenError, 0);
  objc_storeStrong((id *)&self->_idsLastSocketDelay, 0);
  objc_storeStrong((id *)&self->_idsLastMessageDelay, 0);
  objc_storeStrong((id *)&self->_symptomsBasedNetworkQuality, 0);
  objc_storeStrong((id *)&self->_isCaptive, 0);
  objc_storeStrong((id *)&self->_cca, 0);
  objc_storeStrong((id *)&self->_snr, 0);
  objc_storeStrong((id *)&self->_rssi, 0);
  objc_storeStrong((id *)&self->_wifiChannelInfo, 0);
  objc_storeStrong((id *)&self->_wifiPhyMode, 0);
  objc_storeStrong((id *)&self->_simSubscriptions, 0);
  objc_storeStrong((id *)&self->_signalStrengthBars, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_firstTxByteDelay, 0);
  objc_storeStrong((id *)&self->_connectionDelay, 0);
  objc_storeStrong((id *)&self->_connectionFallbackReason, 0);
  objc_storeStrong((id *)&self->_connectionMethodHistory, 0);
  objc_storeStrong((id *)&self->_connectionEdgeType, 0);
  objc_storeStrong((id *)&self->_connectionEdgeID, 0);
  objc_storeStrong((id *)&self->_connectionMethod, 0);
  objc_storeStrong((id *)&self->_primarySubflowInterfaceName, 0);
  objc_storeStrong((id *)&self->_subflowSwitchCounts, 0);
  objc_storeStrong((id *)&self->_connectedSubflowCount, 0);
  objc_storeStrong((id *)&self->_subflowCount, 0);
  objc_storeStrong((id *)&self->_tcpInfoMetricsByInterfaceName, 0);
  objc_storeStrong((id *)&self->_flowNetworkInterfaceType, 0);
  objc_storeStrong((id *)&self->_unacknowledgedPingCount, 0);
  objc_storeStrong((id *)&self->_meanPing, 0);
  objc_storeStrong((id *)&self->_pingCount, 0);
  objc_storeStrong((id *)&self->_tlsHandshakeTimeMsec, 0);
  objc_storeStrong((id *)&self->_tlsVersion, 0);
  objc_storeStrong((id *)&self->_connectionStartTimeToTLSHandshakeTimeMsec, 0);
  objc_storeStrong((id *)&self->_connectionStartTimeToConnectionEstablishmentTimeMsec, 0);
  objc_storeStrong((id *)&self->_connectionEstablishmentTimeMsec, 0);
  objc_storeStrong((id *)&self->_connectionStartTimeToDNSResolutionTimeMsec, 0);
  objc_storeStrong((id *)&self->_dnsResolutionTime, 0);
  objc_storeStrong((id *)&self->_attemptCount, 0);
  objc_storeStrong((id *)&self->_timeUntilFirstByteRead, 0);
  objc_storeStrong((id *)&self->_timeUntilOpen, 0);
  objc_storeStrong((id *)&self->_policyId, 0);
  objc_storeStrong((id *)&self->_metricsCount, 0);
  objc_storeStrong((id *)&self->_providerStyle, 0);
  objc_storeStrong((id *)&self->_snapshotTriggerReason, 0);
  objc_storeStrong((id *)&self->_remoteMetrics, 0);
}

@end
