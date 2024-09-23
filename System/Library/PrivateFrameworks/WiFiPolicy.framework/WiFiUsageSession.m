@implementation WiFiUsageSession

- (void)applicationStateDidChange:(id)a3 withAttributes:(id)a4
{
  BOOL *p_xctest;
  id v7;
  char v8;
  id v9;
  char v10;
  NSMutableSet *activeApplications;
  NSMutableSet *v12;
  NSMutableSet *v13;
  void *v14;
  void *v15;
  id v16;

  p_xctest = &self->_xctest;
  v16 = a3;
  v7 = a4;
  if (v16 && (v8 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.springboard")), v9 = v16, (v8 & 1) == 0))
  {
    ++self->_applicationStateChangedCount;
    activeApplications = self->_activeApplications;
    if (!activeApplications)
    {
      v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v13 = self->_activeApplications;
      self->_activeApplications = v12;

      v9 = v16;
      activeApplications = self->_activeApplications;
    }
    -[NSMutableSet addObject:](activeApplications, "addObject:", v9);
    v10 = 0;
  }
  else
  {
    -[WiFiUsageSession setActiveApplications:](self, "setActiveApplications:", 0);
    v10 = 1;
  }
  p_xctest[3] = v10;
  if (*p_xctest)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("applicationStateDidChange"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotification:", v15);

  }
}

- (NSMutableSet)activeApplications
{
  return self->_activeApplications;
}

- (void)sessionDidStart
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableDictionary *disconnectReasonMap;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  WiFiUsageSessionLQM *lqm;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  WiFiUsageSession *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[WiFiUsageSession isSessionActive](self, "isSessionActive")
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315394;
    v14 = "-[WiFiUsageSession sessionDidStart]";
    v15 = 2112;
    v16 = self;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s on %@ -- Warning! active session is being RE-started", (uint8_t *)&v13, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageSession setSessionDuration:](self, "setSessionDuration:", 0.0);
  -[WiFiUsageSession setSystemAwakeDuration:](self, "setSystemAwakeDuration:", 0.0);
  -[WiFiUsageSession setMediaPlaybackDuration:](self, "setMediaPlaybackDuration:", 0.0);
  -[WiFiUsageSession setChargingDuration:](self, "setChargingDuration:", 0.0);
  -[WiFiUsageSession setInCallDuration:](self, "setInCallDuration:", 0.0);
  -[WiFiUsageSession setInVehicleDuration:](self, "setInVehicleDuration:", 0.0);
  -[WiFiUsageSession setInMotionDuration:](self, "setInMotionDuration:", 0.0);
  -[WiFiUsageSession setInA2dpDuration:](self, "setInA2dpDuration:", 0.0);
  -[WiFiUsageSession setInScoDuration:](self, "setInScoDuration:", 0.0);
  -[WiFiUsageSession setInHidPresentDuration:](self, "setInHidPresentDuration:", 0.0);
  -[WiFiUsageSession setInAwdlDuration:](self, "setInAwdlDuration:", 0.0);
  -[WiFiUsageSession setInRoamDuration:](self, "setInRoamDuration:", 0.0);
  -[WiFiUsageSession setInScanDuration:](self, "setInScanDuration:", 0.0);
  -[WiFiUsageSession setPoweredOnDuration:](self, "setPoweredOnDuration:", 0.0);
  -[WiFiUsageSession setAssociatedDuration:](self, "setAssociatedDuration:", 0.0);
  -[WiFiUsageSession setAssociatedSleepDuration:](self, "setAssociatedSleepDuration:", 0.0);
  -[WiFiUsageSession setInCellularFallbackDuration:](self, "setInCellularFallbackDuration:", 0.0);
  -[WiFiUsageSession setInCellularOutrankingDuration:](self, "setInCellularOutrankingDuration:", 0.0);
  -[WiFiUsageSession setInSoftApDuration:](self, "setInSoftApDuration:", 0.0);
  *(_OWORD *)self->_bandUsageDuration.valueByBand = 0u;
  *(_OWORD *)&self->_bandUsageDuration.valueByBand[2] = 0u;
  -[WiFiUsageSession setInControlCenterAutoJoinDisabledDuration:](self, "setInControlCenterAutoJoinDisabledDuration:", 0.0);
  -[WiFiUsageSession setCompanionConnectedDuration:](self, "setCompanionConnectedDuration:", 0.0);
  -[WiFiUsageSession setInWowStateDuration:](self, "setInWowStateDuration:", 0.0);
  -[WiFiUsageSession setInLpasStateDuration:](self, "setInLpasStateDuration:", 0.0);
  -[WiFiUsageSession setInLowPowerStateDuration:](self, "setInLowPowerStateDuration:", 0.0);
  -[WiFiUsageSession setInBatterySaverStateDuration:](self, "setInBatterySaverStateDuration:", 0.0);
  -[WiFiUsageSession setLinkRecoveryDisabledDuration:](self, "setLinkRecoveryDisabledDuration:", 0.0);
  -[WiFiUsageSession setSleepPowerStatsTotalDuration:](self, "setSleepPowerStatsTotalDuration:", 0.0);
  -[WiFiUsageSession setSleepPowerStatsUnassociatedDuration:](self, "setSleepPowerStatsUnassociatedDuration:", 0.0);
  -[WiFiUsageSession setSleepPowerStatsAssociatedDuration:](self, "setSleepPowerStatsAssociatedDuration:", 0.0);
  -[WiFiUsageSession setSleepPowerStatsRoamingDuration:](self, "setSleepPowerStatsRoamingDuration:", 0.0);
  -[WiFiUsageSession setMediaPlaybackEventCount:](self, "setMediaPlaybackEventCount:", 0);
  -[WiFiUsageSession setChargingEventCount:](self, "setChargingEventCount:", 0);
  -[WiFiUsageSession setInCallEventCount:](self, "setInCallEventCount:", 0);
  -[WiFiUsageSession setInVehicleEventCount:](self, "setInVehicleEventCount:", 0);
  -[WiFiUsageSession setInMotionEventCount:](self, "setInMotionEventCount:", 0);
  -[WiFiUsageSession setInA2dpEventCount:](self, "setInA2dpEventCount:", 0);
  -[WiFiUsageSession setInScoEventCount:](self, "setInScoEventCount:", 0);
  -[WiFiUsageSession setInHidPresentCount:](self, "setInHidPresentCount:", 0);
  -[WiFiUsageSession setInAwdlEventCount:](self, "setInAwdlEventCount:", 0);
  -[WiFiUsageSession setInRoamEventCount:](self, "setInRoamEventCount:", 0);
  -[WiFiUsageSession setInScanEventCount:](self, "setInScanEventCount:", 0);
  -[WiFiUsageSession setRangingEventCount:](self, "setRangingEventCount:", 0);
  -[WiFiUsageSession setCompanionConnectionStateChangedCount:](self, "setCompanionConnectionStateChangedCount:", 0);
  -[WiFiUsageSession setLinkRecoveryDisabledCount:](self, "setLinkRecoveryDisabledCount:", 0);
  -[WiFiUsageSession setWowStateChangedCount:](self, "setWowStateChangedCount:", 0);
  -[WiFiUsageSession setLpasStateChangedCount:](self, "setLpasStateChangedCount:", 0);
  -[WiFiUsageSession setLowPowerStateChangedCount:](self, "setLowPowerStateChangedCount:", 0);
  -[WiFiUsageSession setBatterySaverStateChangedCount:](self, "setBatterySaverStateChangedCount:", 0);
  -[WiFiUsageSession setSystemWakeStateChangedCount:](self, "setSystemWakeStateChangedCount:", 0);
  -[WiFiUsageSession setSystemWokenByWiFiCount:](self, "setSystemWokenByWiFiCount:", 0);
  -[WiFiUsageSession setLockStateChangedCount:](self, "setLockStateChangedCount:", 0);
  -[WiFiUsageSession setDisplayStateChangedCount:](self, "setDisplayStateChangedCount:", 0);
  -[WiFiUsageSession setJoinStateChangedCount:](self, "setJoinStateChangedCount:", 0);
  -[WiFiUsageSession setNetworkChangedCount:](self, "setNetworkChangedCount:", 0);
  -[WiFiUsageSession setLinkStateChangedCount:](self, "setLinkStateChangedCount:", 0);
  -[WiFiUsageSession setRapidLinkTransitionCount:](self, "setRapidLinkTransitionCount:", 0);
  -[WiFiUsageSession setPrimaryInterfaceStateChangeCount:](self, "setPrimaryInterfaceStateChangeCount:", 0);
  -[WiFiUsageSession setApplicationStateChangedCount:](self, "setApplicationStateChangedCount:", 0);
  -[WiFiUsageSession setPowerStateChangedCount:](self, "setPowerStateChangedCount:", 0);
  -[WiFiUsageSession setPowerToggleEventCount:](self, "setPowerToggleEventCount:", 0);
  -[WiFiUsageSession setControlCenterStateChangedCount:](self, "setControlCenterStateChangedCount:", 0);
  -[WiFiUsageSession setControlCenterToggleEventCount:](self, "setControlCenterToggleEventCount:", 0);
  -[WiFiUsageSession setCellularFallbackStateChangedCount:](self, "setCellularFallbackStateChangedCount:", 0);
  -[WiFiUsageSession setCellularOutrankingStateChangedCount:](self, "setCellularOutrankingStateChangedCount:", 0);
  -[WiFiUsageSession setSmartCoverStateChangedCount:](self, "setSmartCoverStateChangedCount:", 0);
  -[WiFiUsageSession setNeighborBssCount:](self, "setNeighborBssCount:", 0);
  -[WiFiUsageSession setOtherBssCount:](self, "setOtherBssCount:", 0);
  +[WiFiUsageInterfaceStats statsForInterfaceName:](WiFiUsageInterfaceStats, "statsForInterfaceName:", self->_interfaceName);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageSession setIfStatsAtStart:](self, "setIfStatsAtStart:", v4);

  +[WiFiUsageInterfaceStats statsForInterfaceName:](WiFiUsageInterfaceStats, "statsForInterfaceName:", self->_secondaryInterfaceName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageSession setSecondaryIfStatsAtStart:](self, "setSecondaryIfStatsAtStart:", v5);

  -[WiFiUsageSession setActiveApplications:](self, "setActiveApplications:", 0);
  -[WiFiUsageSession setTriggerDisconnectAlertedCount:](self, "setTriggerDisconnectAlertedCount:", 0);
  -[WiFiUsageSession setTriggerDisconnectConfirmedCount:](self, "setTriggerDisconnectConfirmedCount:", 0);
  -[WiFiUsageSession setTriggerDisconnectExecutedCount:](self, "setTriggerDisconnectExecutedCount:", 0);
  -[WiFiUsageSession setIsInTDEval:](self, "setIsInTDEval:", 0);
  self->_perClientScanCount[26] = 0;
  *(_OWORD *)&self->_perClientScanCount[24] = 0u;
  *(_OWORD *)&self->_perClientScanCount[22] = 0u;
  *(_OWORD *)&self->_perClientScanCount[20] = 0u;
  *(_OWORD *)&self->_perClientScanCount[18] = 0u;
  *(_OWORD *)&self->_perClientScanCount[16] = 0u;
  *(_OWORD *)&self->_perClientScanCount[14] = 0u;
  *(_OWORD *)&self->_perClientScanCount[12] = 0u;
  *(_OWORD *)&self->_perClientScanCount[10] = 0u;
  *(_OWORD *)&self->_perClientScanCount[8] = 0u;
  *(_OWORD *)&self->_perClientScanCount[6] = 0u;
  *(_OWORD *)&self->_perClientScanCount[4] = 0u;
  *(_OWORD *)&self->_perClientScanCount[2] = 0u;
  *(_OWORD *)self->_perClientScanCount = 0u;
  *(_OWORD *)self->_faultReasonCount = 0u;
  *(_OWORD *)&self->_faultReasonCount[2] = 0u;
  *(_OWORD *)&self->_faultReasonCount[4] = 0u;
  *(_OWORD *)&self->_faultReasonCount[6] = 0u;
  *(_OWORD *)&self->_faultReasonCount[8] = 0u;
  *(_OWORD *)&self->_faultReasonCount[10] = 0u;
  *(_OWORD *)&self->_faultReasonCount[12] = 0u;
  *(_OWORD *)&self->_faultReasonCount[14] = 0u;
  *(_OWORD *)&self->_faultReasonCount[16] = 0u;
  *(_OWORD *)&self->_faultReasonCount[18] = 0u;
  *(_OWORD *)&self->_faultReasonCount[20] = 0u;
  *(_OWORD *)&self->_faultReasonCount[22] = 0u;
  *(_OWORD *)&self->_faultReasonCount[24] = 0u;
  *(_OWORD *)&self->_faultReasonCount[26] = 0u;
  *(_OWORD *)&self->_faultReasonCount[28] = 0u;
  *(_OWORD *)&self->_faultReasonCount[30] = 0u;
  self->_joinReasonCount[14] = 0;
  *(_OWORD *)&self->_joinReasonCount[10] = 0u;
  *(_OWORD *)&self->_joinReasonCount[12] = 0u;
  *(_OWORD *)&self->_joinReasonCount[6] = 0u;
  *(_OWORD *)&self->_joinReasonCount[8] = 0u;
  *(_OWORD *)&self->_joinReasonCount[2] = 0u;
  *(_OWORD *)&self->_joinReasonCount[4] = 0u;
  *(_OWORD *)&self->_faultReasonCount[32] = 0u;
  *(_OWORD *)self->_joinReasonCount = 0u;
  disconnectReasonMap = self->_disconnectReasonMap;
  if (disconnectReasonMap)
  {
    -[NSMutableDictionary removeAllObjects](disconnectReasonMap, "removeAllObjects");
  }
  else
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = self->_disconnectReasonMap;
    self->_disconnectReasonMap = v7;

  }
  -[WiFiUsageSession setIsSessionActive:](self, "setIsSessionActive:", 1);
  -[WiFiUsageSession setLastPowerBudgetChangedTime:](self, "setLastPowerBudgetChangedTime:", v3);
  -[WiFiUsageSession setPowerBudgetMaxDuration:](self, "setPowerBudgetMaxDuration:", 0.0);
  -[WiFiUsageSession setPowerBudget90Duration:](self, "setPowerBudget90Duration:", 0.0);
  -[WiFiUsageSession setPowerBudget80Duration:](self, "setPowerBudget80Duration:", 0.0);
  -[WiFiUsageSession setPowerBudget70Duration:](self, "setPowerBudget70Duration:", 0.0);
  -[WiFiUsageSession setPowerBudget60Duration:](self, "setPowerBudget60Duration:", 0.0);
  -[WiFiUsageSession setPowerBudget50Duration:](self, "setPowerBudget50Duration:", 0.0);
  -[WiFiUsageSession setPowerBudget40Duration:](self, "setPowerBudget40Duration:", 0.0);
  -[WiFiUsageSession setPowerBudget30Duration:](self, "setPowerBudget30Duration:", 0.0);
  -[WiFiUsageSession setPowerBudget20Duration:](self, "setPowerBudget20Duration:", 0.0);
  -[WiFiUsageSession setPowerBudget10Duration:](self, "setPowerBudget10Duration:", 0.0);
  -[WiFiUsageSession setPowerBudgetMinDuration:](self, "setPowerBudgetMinDuration:", 0.0);
  -[WiFiUsageSession setThermalIndexMaxDuration:](self, "setThermalIndexMaxDuration:", 0.0);
  -[WiFiUsageSession setThermalIndex90Duration:](self, "setThermalIndex90Duration:", 0.0);
  -[WiFiUsageSession setThermalIndex80Duration:](self, "setThermalIndex80Duration:", 0.0);
  -[WiFiUsageSession setThermalIndex70Duration:](self, "setThermalIndex70Duration:", 0.0);
  -[WiFiUsageSession setThermalIndex60Duration:](self, "setThermalIndex60Duration:", 0.0);
  -[WiFiUsageSession setThermalIndex50Duration:](self, "setThermalIndex50Duration:", 0.0);
  -[WiFiUsageSession setThermalIndex40Duration:](self, "setThermalIndex40Duration:", 0.0);
  -[WiFiUsageSession setThermalIndex30Duration:](self, "setThermalIndex30Duration:", 0.0);
  -[WiFiUsageSession setThermalIndex20Duration:](self, "setThermalIndex20Duration:", 0.0);
  -[WiFiUsageSession setThermalIndex10Duration:](self, "setThermalIndex10Duration:", 0.0);
  -[WiFiUsageSession setThermalIndexMinDuration:](self, "setThermalIndexMinDuration:", 0.0);
  -[WiFiUsageSession setRoamReasonInitialAssociationCount:](self, "setRoamReasonInitialAssociationCount:", 0);
  -[WiFiUsageSession setRoamReasonLowRssiCount:](self, "setRoamReasonLowRssiCount:", 0);
  -[WiFiUsageSession setRoamReasonDeauthDisassocCount:](self, "setRoamReasonDeauthDisassocCount:", 0);
  -[WiFiUsageSession setRoamReasonBeaconLostCount:](self, "setRoamReasonBeaconLostCount:", 0);
  -[WiFiUsageSession setRoamReasonSteeredByApCount:](self, "setRoamReasonSteeredByApCount:", 0);
  -[WiFiUsageSession setRoamReasonSteeredByBtmCount:](self, "setRoamReasonSteeredByBtmCount:", 0);
  -[WiFiUsageSession setRoamReasonSteeredByCsaCount:](self, "setRoamReasonSteeredByCsaCount:", 0);
  -[WiFiUsageSession setRoamReasonReassocRequestedCount:](self, "setRoamReasonReassocRequestedCount:", 0);
  -[WiFiUsageSession setRoamReasonHostTriggeredCount:](self, "setRoamReasonHostTriggeredCount:", 0);
  -[WiFiUsageSession setRoamReasonBetterCandidateCount:](self, "setRoamReasonBetterCandidateCount:", 0);
  -[WiFiUsageSession setRoamReasonBetterConditionCount:](self, "setRoamReasonBetterConditionCount:", 0);
  -[WiFiUsageSession setRoamReasonMiscCount:](self, "setRoamReasonMiscCount:", 0);
  -[WiFiUsageSession setRoamStatusSucceededCount:](self, "setRoamStatusSucceededCount:", 0);
  -[WiFiUsageSession setRoamStatusFailedCount:](self, "setRoamStatusFailedCount:", 0);
  -[WiFiUsageSession setRoamStatusNoCandidateCount:](self, "setRoamStatusNoCandidateCount:", 0);
  -[WiFiUsageSession setRoamStatusNoQualifiedCandidateCount:](self, "setRoamStatusNoQualifiedCandidateCount:", 0);
  -[WiFiUsageSession setRoamStatusFailedNoScan:](self, "setRoamStatusFailedNoScan:", 0);
  -[WiFiUsageSession setRoamIsWNMScoreUsedCount:](self, "setRoamIsWNMScoreUsedCount:", 0);
  -[WiFiUsageSession setRoamPingPongAboveThresholdCount:](self, "setRoamPingPongAboveThresholdCount:", 0);
  -[WiFiUsageSession setRoamPingPongAboveThresholdCount:](self, "setRoamPingPongAboveThresholdCount:", 0);
  -[WiFiUsageSession setRoamPingPongAboveThresholdCountLowRssiOnly:](self, "setRoamPingPongAboveThresholdCountLowRssiOnly:", 0);
  -[WiFiUsageSession setRoamPingPongLowRssiAndReassocOnly:](self, "setRoamPingPongLowRssiAndReassocOnly:", 0);
  -[WiFiUsageSession setRoamPingPongReassocOnly:](self, "setRoamPingPongReassocOnly:", 0);
  -[WiFiUsageSession setRoamsAfterSupprLifted:](self, "setRoamsAfterSupprLifted:", 0);
  -[WiFiUsageSession setIsRoamSuppressionEnabled:](self, "setIsRoamSuppressionEnabled:", 0);
  -[WiFiUsageSession setLastRoamSuppressionToggled:](self, "setLastRoamSuppressionToggled:", 0);
  -[WiFiUsageSession setInRoamSuppressionEnabled:](self, "setInRoamSuppressionEnabled:", 0.0);
  -[WiFiUsageSession setInRoamSuppressionEnabledCount:](self, "setInRoamSuppressionEnabledCount:", 0);
  -[WiFiUsageSession setInRoamSuppressionWaitForRoamStart:](self, "setInRoamSuppressionWaitForRoamStart:", 0.0);
  -[WiFiUsageSession setInRoamSuppressionWaitForRoamEnd:](self, "setInRoamSuppressionWaitForRoamEnd:", 0.0);
  -[WiFiUsageSession setMinCandidatesCount:](self, "setMinCandidatesCount:", 0);
  -[WiFiUsageSession setMaxCandidatesCount:](self, "setMaxCandidatesCount:", 0);
  -[WiFiUsageSession setCurrentRSSIStrongestCount:](self, "setCurrentRSSIStrongestCount:", 0);
  -[NSMutableDictionary removeAllObjects](self->_roamNeighborsByBand, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_roamCandidatesPerBandWhenSuccessful, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_roamCandidatesPerBandWhenUnSuccessful, "removeAllObjects");
  *(_OWORD *)self->_strongestRSSICountByBand.valueByBand = 0u;
  *(_OWORD *)&self->_strongestRSSICountByBand.valueByBand[2] = 0u;
  *(_OWORD *)self->_strongestRSSIByBand.valueByBand = 0u;
  *(_OWORD *)&self->_strongestRSSIByBand.valueByBand[2] = 0u;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[0][0] = 0u;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[0][2] = 0u;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[1][1] = 0u;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[2][0] = 0u;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[2][2] = 0u;
  *(_QWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valid[2][2] = 0;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[0][0] = 0u;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[0][2] = 0u;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[1][1] = 0u;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[2][0] = 0u;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[2][2] = 0u;
  *(_QWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valid[2][2] = 0;
  *(_QWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valid[2][2] = 0;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[2][0] = 0u;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[2][2] = 0u;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[0][2] = 0u;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[1][1] = 0u;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[0][0] = 0u;
  *(_QWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valid[2][2] = 0;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[2][2] = 0u;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[2][0] = 0u;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[1][1] = 0u;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[0][2] = 0u;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[0][0] = 0u;
  if (self->_sessionEndTime)
  {
    objc_msgSend(v3, "timeIntervalSinceDate:");
    -[WiFiUsageSession setSessionTimeSinceLastSession:](self, "setSessionTimeSinceLastSession:");
  }
  lqm = self->_lqm;
  if (lqm)
    -[WiFiUsageSessionLQM reset](lqm, "reset");
  -[WiFiUsageSession setSessionStartTime:](self, "setSessionStartTime:", v3);
  -[WiFiUsageSession setSessionEndTime:](self, "setSessionEndTime:", 0);
  -[WiFiUsageSession setDriverUnavailabilityCount:](self, "setDriverUnavailabilityCount:", 0);
  -[WiFiUsageSession trackEventLatencies](self, "trackEventLatencies");
  -[WiFiUsageSession setIsCompatibilityModeEnabledAtStart:](self, "setIsCompatibilityModeEnabledAtStart:", self->_isCompatibilityModeEnabled);
  -[WiFiUsageSession setLastCompatibilityModeChangedTime:](self, "setLastCompatibilityModeChangedTime:", v3);
  -[WiFiUsageSession setCompatibilityModeChangeCount:](self, "setCompatibilityModeChangeCount:", 0);
  -[WiFiUsageSession setInCompatibilityModeEnabledDuration:](self, "setInCompatibilityModeEnabledDuration:", 0.0);
  -[WiFiUsageSession setNetworkDetailsAtEnd:](self, "setNetworkDetailsAtEnd:", 0);
  -[WiFiUsageSession setIpV4DetailsPrevSession:](self, "setIpV4DetailsPrevSession:", self->_ipV4Details);
  -[WiFiUsageSession setIpV4Details:](self, "setIpV4Details:", 0);
  -[WiFiUsageSession setIpV6DetailsPrevSession:](self, "setIpV6DetailsPrevSession:", self->_ipV6Details);
  -[WiFiUsageSession setIpV6Details:](self, "setIpV6Details:", 0);
  -[WiFiUsageSession setBandAtSessionStart:](self, "setBandAtSessionStart:", self->_currentBand);
  -[WiFiUsageSession setIsAssociatedAtSessionStart:](self, "setIsAssociatedAtSessionStart:", self->_isAssociated);
  -[WiFiUsageSession setInCoexRealTimeAtSessionStart:](self, "setInCoexRealTimeAtSessionStart:", self->_inCoexRealTime);
  -[WiFiUsageSession setRssiAtSessionStart:](self, "setRssiAtSessionStart:", 0x7FFFFFFFFFFFFFFFLL);
  -[WiFiUsageSession setCountRoamScan:](self, "setCountRoamScan:", 0);
  -[WiFiUsageSession setLastRoamScanFoundSSIDTransitionTarget:](self, "setLastRoamScanFoundSSIDTransitionTarget:", 0);
  -[WiFiUsageSession setCountSSIDTransitionTargetInLastRoamScan:](self, "setCountSSIDTransitionTargetInLastRoamScan:", 0);
  -[WiFiUsageSession setCountRoamScanThatFoundSSIDTransitionTarget:](self, "setCountRoamScanThatFoundSSIDTransitionTarget:", 0);
  -[WiFiUsageSession setLastRoamScanFoundSSIDTransitionPotentialCandidate:](self, "setLastRoamScanFoundSSIDTransitionPotentialCandidate:", 0);
  -[WiFiUsageSession setCountSSIDTransitionPotentialCandidatesInLastRoamScan:](self, "setCountSSIDTransitionPotentialCandidatesInLastRoamScan:", 0);
  -[WiFiUsageSession setCountSSIDTransitionPotentialCandidatesInLastRoamScanNotInTransitionableSet:](self, "setCountSSIDTransitionPotentialCandidatesInLastRoamScanNotInTransitionableSet:", 0);
  -[WiFiUsageSession setCountRoamScanThatFoundSSIDTransitionPotentialCandidate:](self, "setCountRoamScanThatFoundSSIDTransitionPotentialCandidate:", 0);
  -[WiFiUsageSession setLastRoamScanContainsRoamCandidateCount:](self, "setLastRoamScanContainsRoamCandidateCount:", 0);
  -[WiFiUsageSession setLastRoamScanUniqueChannelsCount:](self, "setLastRoamScanUniqueChannelsCount:", 0);
  -[WiFiUsageSession setLastRoamScanUniqueBandsCount:](self, "setLastRoamScanUniqueBandsCount:", 0);
  -[WiFiUsageSession setLastSSIDdisable6eModeAtStart:](self, "setLastSSIDdisable6eModeAtStart:", 0);
  -[WiFiUsageSession setLastSSIDdisabled6eModeChangeCount:](self, "setLastSSIDdisabled6eModeChangeCount:", 0);
  -[WiFiUsageSession setLastSSIDIn6eModeOffDuration:](self, "setLastSSIDIn6eModeOffDuration:", 0.0);
  -[WiFiUsageNetworkDetails disable6eMode](self->_networkDetails, "disable6eMode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageSession setNetworkDisable6eModeAtStart:](self, "setNetworkDisable6eModeAtStart:", v10);

  -[WiFiUsageNetworkDetails disable6eMode](self->_networkDetails, "disable6eMode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v12 = v3;
  else
    v12 = 0;
  -[WiFiUsageSession setLastNetwork6eDisableModeChangedTime:](self, "setLastNetwork6eDisableModeChangedTime:", v12);

  -[WiFiUsageSession setInNetwork6eModeOffDuration:](self, "setInNetwork6eModeOffDuration:", 0.0);
  -[WiFiUsageSession setNetwork6eDisabledModeChangeCount:](self, "setNetwork6eDisabledModeChangeCount:", 0);
  -[WiFiUsageSession setInPoorLinkSessionCount:](self, "setInPoorLinkSessionCount:", 0);
  -[WiFiUsageSession setInPoorLinkSessionDuration:](self, "setInPoorLinkSessionDuration:", 0.0);
  -[WiFiUsageSession setTdAfterJoinAfterTDCount:](self, "setTdAfterJoinAfterTDCount:", 0);
  -[WiFiUsageSession setCurrent_subsequentTdAfterJoinAfterTDCount:](self, "setCurrent_subsequentTdAfterJoinAfterTDCount:", 0);
  -[WiFiUsageSession setMin_subsequentTdAfterJoinAfterTDCount:](self, "setMin_subsequentTdAfterJoinAfterTDCount:", 0x7FFFFFFFFFFFFFFFLL);
  -[WiFiUsageSession setMax_subsequentTdAfterJoinAfterTDCount:](self, "setMax_subsequentTdAfterJoinAfterTDCount:", 0);
  -[WiFiUsageSession setTdSessionStartedByBadRSSICount:](self, "setTdSessionStartedByBadRSSICount:", 0);
  -[WiFiUsageSession setTdSessionStartedByTDRecommendedCount:](self, "setTdSessionStartedByTDRecommendedCount:", 0);
  -[WiFiUsageSession setTdSessionStartedBySymptomDNSFailureCount:](self, "setTdSessionStartedBySymptomDNSFailureCount:", 0);
  -[WiFiUsageSession setTdEvalEndedCount:](self, "setTdEvalEndedCount:", 0);
  -[WiFiUsageSession setTdEvalCumulativeDuration:](self, "setTdEvalCumulativeDuration:", 0.0);
  -[WiFiUsageSession setTdEvalStartedCount:](self, "setTdEvalStartedCount:", 0);
  -[WiFiUsageSession setTdEvalStartedByBadRSSICount:](self, "setTdEvalStartedByBadRSSICount:", 0);
  -[WiFiUsageSession setTdEvalStartedBySymptomsARPFailureCount:](self, "setTdEvalStartedBySymptomsARPFailureCount:", 0);
  -[WiFiUsageSession setTdEvalStartedBySymptomsDNSFailCount:](self, "setTdEvalStartedBySymptomsDNSFailCount:", 0);
  -[WiFiUsageSession setTdEvalStartedBySymptomsShortFlowCount:](self, "setTdEvalStartedBySymptomsShortFlowCount:", 0);
  -[WiFiUsageSession setTdEvalStartedBySymptomsDataStallCount:](self, "setTdEvalStartedBySymptomsDataStallCount:", 0);
  -[WiFiUsageSession setTdEvalStartedBySymptomsDNSStallCount:](self, "setTdEvalStartedBySymptomsDNSStallCount:", 0);
  -[WiFiUsageSession setTdEvalStartedBySymptomsDNSFailCount:](self, "setTdEvalStartedBySymptomsDNSFailCount:", 0);
  -[WiFiUsageSession setTdEvalStartedByActiveProbingCount:](self, "setTdEvalStartedByActiveProbingCount:", 0);
  -[WiFiUsageSession setTdEvalStartedByFGNetwAppChangeCount:](self, "setTdEvalStartedByFGNetwAppChangeCount:", 0);
  -[WiFiUsageSession setTdEvalStartedByUserNotificationCount:](self, "setTdEvalStartedByUserNotificationCount:", 0);
  -[WiFiUsageSession setTdEvalStartedByCheckReassocCount:](self, "setTdEvalStartedByCheckReassocCount:", 0);
  -[WiFiUsageSession setLastUsbStatusChange:](self, "setLastUsbStatusChange:", 0);
  -[WiFiUsageSession setUsbDeviceEventCount:](self, "setUsbDeviceEventCount:", 0);
  -[WiFiUsageSession setUsbInsertedDuration:](self, "setUsbInsertedDuration:", 0.0);
  -[WiFiUsageSession setLastAWDLSequenceUpdate:](self, "setLastAWDLSequenceUpdate:", 0);
  -[WiFiUsageSession setInAWDL_BestInfraScoreDuration:](self, "setInAWDL_BestInfraScoreDuration:", 0.0);
  -[WiFiUsageSession setInAWDL_BestP2PScoreDuration:](self, "setInAWDL_BestP2PScoreDuration:", 0.0);
  -[WiFiUsageSession setInAWDL_WorstInfraScoreDuration:](self, "setInAWDL_WorstInfraScoreDuration:", 0.0);
  -[WiFiUsageSession setInAWDL_WorstP2PScoreDuration:](self, "setInAWDL_WorstP2PScoreDuration:", 0.0);
  -[WiFiUsageSession setJoinLinkUpLatencyFromSessionStart:](self, "setJoinLinkUpLatencyFromSessionStart:", 0.0);
  -[WiFiUsageSession setLongestUnassociatedDuration:](self, "setLongestUnassociatedDuration:", 0.0);
  -[WiFiUsageSession setAirplaneModeStateChangedCount:](self, "setAirplaneModeStateChangedCount:", 0);
  -[WiFiUsageSession setMaxPhyMode:](self, "setMaxPhyMode:", 0);

}

- (void)setTdEvalStartedBySymptomsDNSFailCount:(unint64_t)a3
{
  self->_tdEvalStartedBySymptomsDNSFailCount = a3;
}

- (void)setRoamPingPongAboveThresholdCount:(unint64_t)a3
{
  self->_roamPingPongAboveThresholdCount = a3;
}

- (void)setSessionDuration:(double)a3
{
  self->_sessionDuration = a3;
}

- (void)trackEventLatencies
{
  -[WiFiUsageSession setDriverAvailabilityLatencyFromChipReset:](self, "setDriverAvailabilityLatencyFromChipReset:", 0.0);
  -[WiFiUsageSession setDriverAvailabilityLatencyFromTermination:](self, "setDriverAvailabilityLatencyFromTermination:", 0.0);
  -[WiFiUsageSession setJoinScanLatencyFromDriverAvailability:](self, "setJoinScanLatencyFromDriverAvailability:", 0.0);
  -[WiFiUsageSession setJoinStartedLatencyFromDriverAvailability:](self, "setJoinStartedLatencyFromDriverAvailability:", 0.0);
  -[WiFiUsageSession setJoinLinkUpLatencyFromDriverAvailability:](self, "setJoinLinkUpLatencyFromDriverAvailability:", 0.0);
  -[WiFiUsageSession setJoinIpConfigurationLatencyFromDriverAvailability:](self, "setJoinIpConfigurationLatencyFromDriverAvailability:", 0.0);
  -[WiFiUsageSession setJoinInterfaceRankingLatencyFromDriverAvailability:](self, "setJoinInterfaceRankingLatencyFromDriverAvailability:", 0.0);
  -[WiFiUsageSession setLastDriverUnavailableReason:](self, "setLastDriverUnavailableReason:", 0);
}

- (void)setWowStateChangedCount:(unint64_t)a3
{
  self->_wowStateChangedCount = a3;
}

- (void)setUsbInsertedDuration:(double)a3
{
  self->_usbInsertedDuration = a3;
}

- (void)setUsbDeviceEventCount:(unint64_t)a3
{
  self->_usbDeviceEventCount = a3;
}

- (void)setTriggerDisconnectExecutedCount:(unint64_t)a3
{
  self->_triggerDisconnectExecutedCount = a3;
}

- (void)setTriggerDisconnectConfirmedCount:(unint64_t)a3
{
  self->_triggerDisconnectConfirmedCount = a3;
}

- (void)setTriggerDisconnectAlertedCount:(unint64_t)a3
{
  self->_triggerDisconnectAlertedCount = a3;
}

- (void)setThermalIndexMinDuration:(double)a3
{
  self->_thermalIndexMinDuration = a3;
}

- (void)setThermalIndexMaxDuration:(double)a3
{
  self->_thermalIndexMaxDuration = a3;
}

- (void)setThermalIndex90Duration:(double)a3
{
  self->_thermalIndex90Duration = a3;
}

- (void)setThermalIndex80Duration:(double)a3
{
  self->_thermalIndex80Duration = a3;
}

- (void)setThermalIndex70Duration:(double)a3
{
  self->_thermalIndex70Duration = a3;
}

- (void)setThermalIndex60Duration:(double)a3
{
  self->_thermalIndex60Duration = a3;
}

- (void)setThermalIndex50Duration:(double)a3
{
  self->_thermalIndex50Duration = a3;
}

- (void)setThermalIndex40Duration:(double)a3
{
  self->_thermalIndex40Duration = a3;
}

- (void)setThermalIndex30Duration:(double)a3
{
  self->_thermalIndex30Duration = a3;
}

- (void)setThermalIndex20Duration:(double)a3
{
  self->_thermalIndex20Duration = a3;
}

- (void)setThermalIndex10Duration:(double)a3
{
  self->_thermalIndex10Duration = a3;
}

- (void)setTdSessionStartedByTDRecommendedCount:(unint64_t)a3
{
  self->_tdSessionStartedByTDRecommendedCount = a3;
}

- (void)setTdSessionStartedBySymptomDNSFailureCount:(unint64_t)a3
{
  self->_tdSessionStartedBySymptomDNSFailureCount = a3;
}

- (void)setTdSessionStartedByBadRSSICount:(unint64_t)a3
{
  self->_tdSessionStartedByBadRSSICount = a3;
}

- (void)setTdEvalStartedCount:(unint64_t)a3
{
  self->_tdEvalStartedCount = a3;
}

- (void)setTdEvalStartedByUserNotificationCount:(unint64_t)a3
{
  self->_tdEvalStartedByUserNotificationCount = a3;
}

- (void)setTdEvalStartedBySymptomsShortFlowCount:(unint64_t)a3
{
  self->_tdEvalStartedBySymptomsShortFlowCount = a3;
}

- (void)setTdEvalStartedBySymptomsDataStallCount:(unint64_t)a3
{
  self->_tdEvalStartedBySymptomsDataStallCount = a3;
}

- (void)setTdEvalStartedBySymptomsDNSStallCount:(unint64_t)a3
{
  self->_tdEvalStartedBySymptomsDNSStallCount = a3;
}

- (void)setTdEvalStartedBySymptomsARPFailureCount:(unint64_t)a3
{
  self->_tdEvalStartedBySymptomsARPFailureCount = a3;
}

- (void)setTdEvalStartedByFGNetwAppChangeCount:(unint64_t)a3
{
  self->_tdEvalStartedByFGNetwAppChangeCount = a3;
}

- (void)setTdEvalStartedByCheckReassocCount:(unint64_t)a3
{
  self->_tdEvalStartedByCheckReassocCount = a3;
}

- (void)setTdEvalStartedByBadRSSICount:(unint64_t)a3
{
  self->_tdEvalStartedByBadRSSICount = a3;
}

- (void)setTdEvalStartedByActiveProbingCount:(unint64_t)a3
{
  self->_tdEvalStartedByActiveProbingCount = a3;
}

- (void)setTdEvalEndedCount:(unint64_t)a3
{
  self->_tdEvalEndedCount = a3;
}

- (void)setTdEvalCumulativeDuration:(double)a3
{
  self->_tdEvalCumulativeDuration = a3;
}

- (void)setTdAfterJoinAfterTDCount:(unint64_t)a3
{
  self->_tdAfterJoinAfterTDCount = a3;
}

- (void)setSystemWokenByWiFiCount:(unint64_t)a3
{
  self->_systemWokenByWiFiCount = a3;
}

- (void)setSystemWakeStateChangedCount:(unint64_t)a3
{
  self->_systemWakeStateChangedCount = a3;
}

- (void)setSystemAwakeDuration:(double)a3
{
  self->_systemAwakeDuration = a3;
}

- (void)setSmartCoverStateChangedCount:(unint64_t)a3
{
  self->_smartCoverStateChangedCount = a3;
}

- (void)setSleepPowerStatsUnassociatedDuration:(double)a3
{
  self->_sleepPowerStatsUnassociatedDuration = a3;
}

- (void)setSleepPowerStatsTotalDuration:(double)a3
{
  self->_sleepPowerStatsTotalDuration = a3;
}

- (void)setSleepPowerStatsRoamingDuration:(double)a3
{
  self->_sleepPowerStatsRoamingDuration = a3;
}

- (void)setSleepPowerStatsAssociatedDuration:(double)a3
{
  self->_sleepPowerStatsAssociatedDuration = a3;
}

- (void)setSessionTimeSinceLastSession:(double)a3
{
  self->_sessionTimeSinceLastSession = a3;
}

- (void)setSessionStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_sessionStartTime, a3);
}

- (void)setSessionEndTime:(id)a3
{
  objc_storeStrong((id *)&self->_sessionEndTime, a3);
}

- (void)setSecondaryIfStatsAtStart:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryIfStatsAtStart, a3);
}

- (void)setRssiAtSessionStart:(int64_t)a3
{
  self->_rssiAtSessionStart = a3;
}

- (void)setRoamsAfterSupprLifted:(unint64_t)a3
{
  self->_roamsAfterSupprLifted = a3;
}

- (void)setRoamStatusSucceededCount:(unint64_t)a3
{
  self->_roamStatusSucceededCount = a3;
}

- (void)setRoamStatusNoQualifiedCandidateCount:(unint64_t)a3
{
  self->_roamStatusNoQualifiedCandidateCount = a3;
}

- (void)setRoamStatusNoCandidateCount:(unint64_t)a3
{
  self->_roamStatusNoCandidateCount = a3;
}

- (void)setRoamStatusFailedNoScan:(unint64_t)a3
{
  self->_roamStatusFailedNoScan = a3;
}

- (void)setRoamStatusFailedCount:(unint64_t)a3
{
  self->_roamStatusFailedCount = a3;
}

- (void)setRoamReasonSteeredByCsaCount:(unint64_t)a3
{
  self->_roamReasonSteeredByCsaCount = a3;
}

- (void)setRoamReasonSteeredByBtmCount:(unint64_t)a3
{
  self->_roamReasonSteeredByBtmCount = a3;
}

- (void)setRoamReasonSteeredByApCount:(unint64_t)a3
{
  self->_roamReasonSteeredByApCount = a3;
}

- (void)setRoamReasonReassocRequestedCount:(unint64_t)a3
{
  self->_roamReasonReassocRequestedCount = a3;
}

- (void)setRoamReasonMiscCount:(unint64_t)a3
{
  self->_roamReasonMiscCount = a3;
}

- (void)setRoamReasonLowRssiCount:(unint64_t)a3
{
  self->_roamReasonLowRssiCount = a3;
}

- (void)setRoamReasonInitialAssociationCount:(unint64_t)a3
{
  self->_roamReasonInitialAssociationCount = a3;
}

- (void)setRoamReasonHostTriggeredCount:(unint64_t)a3
{
  self->_roamReasonHostTriggeredCount = a3;
}

- (void)setRoamReasonDeauthDisassocCount:(unint64_t)a3
{
  self->_roamReasonDeauthDisassocCount = a3;
}

- (void)setRoamReasonBetterConditionCount:(unint64_t)a3
{
  self->_roamReasonBetterConditionCount = a3;
}

- (void)setRoamReasonBetterCandidateCount:(unint64_t)a3
{
  self->_roamReasonBetterCandidateCount = a3;
}

- (void)setRoamReasonBeaconLostCount:(unint64_t)a3
{
  self->_roamReasonBeaconLostCount = a3;
}

- (void)setRoamPingPongReassocOnly:(unint64_t)a3
{
  self->_roamPingPongReassocOnly = a3;
}

- (void)setRoamPingPongLowRssiAndReassocOnly:(unint64_t)a3
{
  self->_roamPingPongLowRssiAndReassocOnly = a3;
}

- (void)setRoamPingPongAboveThresholdCountLowRssiOnly:(unint64_t)a3
{
  self->_roamPingPongAboveThresholdCountLowRssiOnly = a3;
}

- (void)setRoamIsWNMScoreUsedCount:(unint64_t)a3
{
  self->_roamIsWNMScoreUsedCount = a3;
}

- (void)setRapidLinkTransitionCount:(unint64_t)a3
{
  self->_rapidLinkTransitionCount = a3;
}

- (void)setRangingEventCount:(unint64_t)a3
{
  self->_rangingEventCount = a3;
}

- (void)setPrimaryInterfaceStateChangeCount:(unint64_t)a3
{
  self->_primaryInterfaceStateChangeCount = a3;
}

- (void)setPoweredOnDuration:(double)a3
{
  self->_poweredOnDuration = a3;
}

- (void)setPowerToggleEventCount:(unint64_t)a3
{
  self->_powerToggleEventCount = a3;
}

- (void)setPowerStateChangedCount:(unint64_t)a3
{
  self->_powerStateChangedCount = a3;
}

- (void)setPowerBudgetMinDuration:(double)a3
{
  self->_powerBudgetMinDuration = a3;
}

- (void)setPowerBudgetMaxDuration:(double)a3
{
  self->_powerBudgetMaxDuration = a3;
}

- (void)setPowerBudget90Duration:(double)a3
{
  self->_powerBudget90Duration = a3;
}

- (void)setPowerBudget80Duration:(double)a3
{
  self->_powerBudget80Duration = a3;
}

- (void)setPowerBudget70Duration:(double)a3
{
  self->_powerBudget70Duration = a3;
}

- (void)setPowerBudget60Duration:(double)a3
{
  self->_powerBudget60Duration = a3;
}

- (void)setPowerBudget50Duration:(double)a3
{
  self->_powerBudget50Duration = a3;
}

- (void)setPowerBudget40Duration:(double)a3
{
  self->_powerBudget40Duration = a3;
}

- (void)setPowerBudget30Duration:(double)a3
{
  self->_powerBudget30Duration = a3;
}

- (void)setPowerBudget20Duration:(double)a3
{
  self->_powerBudget20Duration = a3;
}

- (void)setPowerBudget10Duration:(double)a3
{
  self->_powerBudget10Duration = a3;
}

- (void)setOtherBssCount:(unint64_t)a3
{
  self->_otherBssCount = a3;
}

- (void)setNetworkDisable6eModeAtStart:(id)a3
{
  objc_storeStrong((id *)&self->_networkDisable6eModeAtStart, a3);
}

- (void)setNetworkDetailsAtEnd:(id)a3
{
  objc_storeStrong((id *)&self->_networkDetailsAtEnd, a3);
}

- (void)setNetworkChangedCount:(unint64_t)a3
{
  self->_networkChangedCount = a3;
}

- (void)setNetwork6eDisabledModeChangeCount:(unint64_t)a3
{
  self->_network6eDisabledModeChangeCount = a3;
}

- (void)setNeighborBssCount:(unint64_t)a3
{
  self->_neighborBssCount = a3;
}

- (void)setMin_subsequentTdAfterJoinAfterTDCount:(unint64_t)a3
{
  self->_min_subsequentTdAfterJoinAfterTDCount = a3;
}

- (void)setMinCandidatesCount:(unint64_t)a3
{
  self->_minCandidatesCount = a3;
}

- (void)setMediaPlaybackEventCount:(unint64_t)a3
{
  self->_mediaPlaybackEventCount = a3;
}

- (void)setMediaPlaybackDuration:(double)a3
{
  self->_mediaPlaybackDuration = a3;
}

- (void)setMax_subsequentTdAfterJoinAfterTDCount:(unint64_t)a3
{
  self->_max_subsequentTdAfterJoinAfterTDCount = a3;
}

- (void)setMaxCandidatesCount:(unint64_t)a3
{
  self->_maxCandidatesCount = a3;
}

- (void)setLpasStateChangedCount:(unint64_t)a3
{
  self->_lpasStateChangedCount = a3;
}

- (void)setLowPowerStateChangedCount:(unint64_t)a3
{
  self->_lowPowerStateChangedCount = a3;
}

- (void)setLongestUnassociatedDuration:(double)a3
{
  self->_longestUnassociatedDuration = a3;
}

- (void)setLockStateChangedCount:(unint64_t)a3
{
  self->_lockStateChangedCount = a3;
}

- (void)setLinkStateChangedCount:(unint64_t)a3
{
  self->_linkStateChangedCount = a3;
}

- (void)setLinkRecoveryDisabledDuration:(double)a3
{
  self->_linkRecoveryDisabledDuration = a3;
}

- (void)setLinkRecoveryDisabledCount:(unint64_t)a3
{
  self->_linkRecoveryDisabledCount = a3;
}

- (void)setLastUsbStatusChange:(id)a3
{
  objc_storeStrong((id *)&self->_lastUsbStatusChange, a3);
}

- (void)setLastSSIDdisabled6eModeChangeCount:(unint64_t)a3
{
  self->_lastSSIDdisabled6eModeChangeCount = a3;
}

- (void)setLastSSIDdisable6eModeAtStart:(id)a3
{
  objc_storeStrong((id *)&self->_lastSSIDdisable6eModeAtStart, a3);
}

- (void)setLastSSIDIn6eModeOffDuration:(double)a3
{
  self->_lastSSIDIn6eModeOffDuration = a3;
}

- (void)setLastRoamSuppressionToggled:(id)a3
{
  objc_storeStrong((id *)&self->_lastRoamSuppressionToggled, a3);
}

- (void)setLastRoamScanUniqueChannelsCount:(unint64_t)a3
{
  self->_lastRoamScanUniqueChannelsCount = a3;
}

- (void)setLastRoamScanUniqueBandsCount:(unint64_t)a3
{
  self->_lastRoamScanUniqueBandsCount = a3;
}

- (void)setLastRoamScanFoundSSIDTransitionTarget:(BOOL)a3
{
  self->_lastRoamScanFoundSSIDTransitionTarget = a3;
}

- (void)setLastRoamScanFoundSSIDTransitionPotentialCandidate:(BOOL)a3
{
  self->_lastRoamScanFoundSSIDTransitionPotentialCandidate = a3;
}

- (void)setLastRoamScanContainsRoamCandidateCount:(BOOL)a3
{
  self->_lastRoamScanContainsRoamCandidateCount = a3;
}

- (void)setLastPowerBudgetChangedTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastPowerBudgetChangedTime, a3);
}

- (void)setLastNetwork6eDisableModeChangedTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastNetwork6eDisableModeChangedTime, a3);
}

- (void)setLastDriverUnavailableReason:(id)a3
{
  objc_storeStrong((id *)&self->_lastDriverUnavailableReason, a3);
}

- (void)setLastCompatibilityModeChangedTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastCompatibilityModeChangedTime, a3);
}

- (void)setLastAWDLSequenceUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_lastAWDLSequenceUpdate, a3);
}

- (void)setJoinStateChangedCount:(unint64_t)a3
{
  self->_joinStateChangedCount = a3;
}

- (void)setJoinStartedLatencyFromDriverAvailability:(double)a3
{
  self->_joinStartedLatencyFromDriverAvailability = a3;
}

- (void)setJoinScanLatencyFromDriverAvailability:(double)a3
{
  self->_joinScanLatencyFromDriverAvailability = a3;
}

- (void)setJoinLinkUpLatencyFromSessionStart:(double)a3
{
  self->_joinLinkUpLatencyFromSessionStart = a3;
}

- (void)setJoinLinkUpLatencyFromDriverAvailability:(double)a3
{
  self->_joinLinkUpLatencyFromDriverAvailability = a3;
}

- (void)setJoinIpConfigurationLatencyFromDriverAvailability:(double)a3
{
  self->_joinIpConfigurationLatencyFromDriverAvailability = a3;
}

- (void)setJoinInterfaceRankingLatencyFromDriverAvailability:(double)a3
{
  self->_joinInterfaceRankingLatencyFromDriverAvailability = a3;
}

- (void)setIsSessionActive:(BOOL)a3
{
  self->_isSessionActive = a3;
}

- (void)setIsRoamSuppressionEnabled:(BOOL)a3
{
  self->_isRoamSuppressionEnabled = a3;
}

- (void)setIsInTDEval:(BOOL)a3
{
  self->_isInTDEval = a3;
}

- (void)setIsCompatibilityModeEnabledAtStart:(BOOL)a3
{
  self->_isCompatibilityModeEnabledAtStart = a3;
}

- (void)setIsAssociatedAtSessionStart:(BOOL)a3
{
  self->_isAssociatedAtSessionStart = a3;
}

- (void)setIpV6DetailsPrevSession:(id)a3
{
  objc_storeStrong((id *)&self->_ipV6DetailsPrevSession, a3);
}

- (void)setIpV6Details:(id)a3
{
  objc_storeStrong((id *)&self->_ipV6Details, a3);
}

- (void)setIpV4DetailsPrevSession:(id)a3
{
  objc_storeStrong((id *)&self->_ipV4DetailsPrevSession, a3);
}

- (void)setIpV4Details:(id)a3
{
  objc_storeStrong((id *)&self->_ipV4Details, a3);
}

- (void)setInWowStateDuration:(double)a3
{
  self->_inWowStateDuration = a3;
}

- (void)setInVehicleEventCount:(unint64_t)a3
{
  self->_inVehicleEventCount = a3;
}

- (void)setInVehicleDuration:(double)a3
{
  self->_inVehicleDuration = a3;
}

- (void)setInSoftApDuration:(double)a3
{
  self->_inSoftApDuration = a3;
}

- (void)setInScoEventCount:(unint64_t)a3
{
  self->_inScoEventCount = a3;
}

- (void)setInScoDuration:(double)a3
{
  self->_inScoDuration = a3;
}

- (void)setInScanEventCount:(unint64_t)a3
{
  self->_inScanEventCount = a3;
}

- (void)setInScanDuration:(double)a3
{
  self->_inScanDuration = a3;
}

- (void)setInRoamSuppressionWaitForRoamStart:(double)a3
{
  self->_inRoamSuppressionWaitForRoamStart = a3;
}

- (void)setInRoamSuppressionWaitForRoamEnd:(double)a3
{
  self->_inRoamSuppressionWaitForRoamEnd = a3;
}

- (void)setInRoamSuppressionEnabledCount:(unint64_t)a3
{
  self->_inRoamSuppressionEnabledCount = a3;
}

- (void)setInRoamSuppressionEnabled:(double)a3
{
  self->_inRoamSuppressionEnabled = a3;
}

- (void)setInRoamEventCount:(unint64_t)a3
{
  self->_inRoamEventCount = a3;
}

- (void)setInRoamDuration:(double)a3
{
  self->_inRoamDuration = a3;
}

- (void)setInPoorLinkSessionDuration:(double)a3
{
  self->_inPoorLinkSessionDuration = a3;
}

- (void)setInPoorLinkSessionCount:(unint64_t)a3
{
  self->_inPoorLinkSessionCount = a3;
}

- (void)setInNetwork6eModeOffDuration:(double)a3
{
  self->_inNetwork6eModeOffDuration = a3;
}

- (void)setInMotionEventCount:(unint64_t)a3
{
  self->_inMotionEventCount = a3;
}

- (void)setInMotionDuration:(double)a3
{
  self->_inMotionDuration = a3;
}

- (void)setInLpasStateDuration:(double)a3
{
  self->_inLpasStateDuration = a3;
}

- (void)setInLowPowerStateDuration:(double)a3
{
  self->_inLowPowerStateDuration = a3;
}

- (void)setInHidPresentDuration:(double)a3
{
  self->_inHidPresentDuration = a3;
}

- (void)setInHidPresentCount:(unint64_t)a3
{
  self->_inHidPresentCount = a3;
}

- (void)setInControlCenterAutoJoinDisabledDuration:(double)a3
{
  self->_inControlCenterAutoJoinDisabledDuration = a3;
}

- (void)setInCompatibilityModeEnabledDuration:(double)a3
{
  self->_inCompatibilityModeEnabledDuration = a3;
}

- (void)setInCoexRealTimeAtSessionStart:(BOOL)a3
{
  self->_inCoexRealTimeAtSessionStart = a3;
}

- (void)setInCellularOutrankingDuration:(double)a3
{
  self->_inCellularOutrankingDuration = a3;
}

- (void)setInCellularFallbackDuration:(double)a3
{
  self->_inCellularFallbackDuration = a3;
}

- (void)setInCallEventCount:(unint64_t)a3
{
  self->_inCallEventCount = a3;
}

- (void)setInCallDuration:(double)a3
{
  self->_inCallDuration = a3;
}

- (void)setInBatterySaverStateDuration:(double)a3
{
  self->_inBatterySaverStateDuration = a3;
}

- (void)setInAwdlEventCount:(unint64_t)a3
{
  self->_inAwdlEventCount = a3;
}

- (void)setInAwdlDuration:(double)a3
{
  self->_inAwdlDuration = a3;
}

- (void)setInAWDL_WorstP2PScoreDuration:(double)a3
{
  self->_inAWDL_WorstP2PScoreDuration = a3;
}

- (void)setInAWDL_WorstInfraScoreDuration:(double)a3
{
  self->_inAWDL_WorstInfraScoreDuration = a3;
}

- (void)setInAWDL_BestP2PScoreDuration:(double)a3
{
  self->_inAWDL_BestP2PScoreDuration = a3;
}

- (void)setInAWDL_BestInfraScoreDuration:(double)a3
{
  self->_inAWDL_BestInfraScoreDuration = a3;
}

- (void)setInA2dpEventCount:(unint64_t)a3
{
  self->_inA2dpEventCount = a3;
}

- (void)setInA2dpDuration:(double)a3
{
  self->_inA2dpDuration = a3;
}

- (void)setIfStatsAtStart:(id)a3
{
  objc_storeStrong((id *)&self->_ifStatsAtStart, a3);
}

- (void)setDriverUnavailabilityCount:(unint64_t)a3
{
  self->_driverUnavailabilityCount = a3;
}

- (void)setDriverAvailabilityLatencyFromTermination:(double)a3
{
  self->_driverAvailabilityLatencyFromTermination = a3;
}

- (void)setDriverAvailabilityLatencyFromChipReset:(double)a3
{
  self->_driverAvailabilityLatencyFromChipReset = a3;
}

- (void)setDisplayStateChangedCount:(unint64_t)a3
{
  self->_displayStateChangedCount = a3;
}

- (void)setCurrent_subsequentTdAfterJoinAfterTDCount:(unint64_t)a3
{
  self->_current_subsequentTdAfterJoinAfterTDCount = a3;
}

- (void)setCurrentRSSIStrongestCount:(unint64_t)a3
{
  self->_currentRSSIStrongestCount = a3;
}

- (void)setCountSSIDTransitionTargetInLastRoamScan:(unint64_t)a3
{
  self->_countSSIDTransitionTargetInLastRoamScan = a3;
}

- (void)setCountSSIDTransitionPotentialCandidatesInLastRoamScanNotInTransitionableSet:(unint64_t)a3
{
  self->_countSSIDTransitionPotentialCandidatesInLastRoamScanNotInTransitionableSet = a3;
}

- (void)setCountSSIDTransitionPotentialCandidatesInLastRoamScan:(unint64_t)a3
{
  self->_countSSIDTransitionPotentialCandidatesInLastRoamScan = a3;
}

- (void)setCountRoamScanThatFoundSSIDTransitionTarget:(unint64_t)a3
{
  self->_countRoamScanThatFoundSSIDTransitionTarget = a3;
}

- (void)setCountRoamScanThatFoundSSIDTransitionPotentialCandidate:(unint64_t)a3
{
  self->_countRoamScanThatFoundSSIDTransitionPotentialCandidate = a3;
}

- (void)setCountRoamScan:(unint64_t)a3
{
  self->_countRoamScan = a3;
}

- (void)setControlCenterToggleEventCount:(unint64_t)a3
{
  self->_controlCenterToggleEventCount = a3;
}

- (void)setControlCenterStateChangedCount:(unint64_t)a3
{
  self->_controlCenterStateChangedCount = a3;
}

- (void)setCompatibilityModeChangeCount:(unint64_t)a3
{
  self->_compatibilityModeChangeCount = a3;
}

- (void)setCompanionConnectionStateChangedCount:(unint64_t)a3
{
  self->_companionConnectionStateChangedCount = a3;
}

- (void)setCompanionConnectedDuration:(double)a3
{
  self->_companionConnectedDuration = a3;
}

- (void)setChargingEventCount:(unint64_t)a3
{
  self->_chargingEventCount = a3;
}

- (void)setChargingDuration:(double)a3
{
  self->_chargingDuration = a3;
}

- (void)setCellularOutrankingStateChangedCount:(unint64_t)a3
{
  self->_cellularOutrankingStateChangedCount = a3;
}

- (void)setCellularFallbackStateChangedCount:(unint64_t)a3
{
  self->_cellularFallbackStateChangedCount = a3;
}

- (void)setBatterySaverStateChangedCount:(unint64_t)a3
{
  self->_batterySaverStateChangedCount = a3;
}

- (void)setBandAtSessionStart:(int)a3
{
  self->_bandAtSessionStart = a3;
}

- (void)setAssociatedSleepDuration:(double)a3
{
  self->_associatedSleepDuration = a3;
}

- (void)setAssociatedDuration:(double)a3
{
  self->_associatedDuration = a3;
}

- (void)setApplicationStateChangedCount:(unint64_t)a3
{
  self->_applicationStateChangedCount = a3;
}

- (void)setAirplaneModeStateChangedCount:(unint64_t)a3
{
  self->_airplaneModeStateChangedCount = a3;
}

- (void)setActiveApplications:(id)a3
{
  objc_storeStrong((id *)&self->_activeApplications, a3);
}

- (BOOL)isSessionActive
{
  return self->_isSessionActive;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)linkQualityDidChange:(id)a3
{
  WiFiUsageSessionLQM *lqm;
  WiFiUsageSessionLQM *v5;
  WiFiUsageSessionLQM *v6;
  int64_t v7;
  id v8;

  v8 = a3;
  if (-[WiFiUsageSession isSessionActive](self, "isSessionActive"))
  {
    lqm = self->_lqm;
    if (lqm)
    {
      -[WiFiUsageSessionLQM updateLinkQuality:forSession:](lqm, "updateLinkQuality:forSession:", v8, self->_type);
    }
    else
    {
      v5 = -[WiFiUsageSessionLQM initWithLQMSample:forInterface:]([WiFiUsageSessionLQM alloc], "initWithLQMSample:forInterface:", v8, self->_interfaceName);
      v6 = self->_lqm;
      self->_lqm = v5;

    }
    if (self->_rssiAtSessionStart == 0x7FFFFFFFFFFFFFFFLL)
      v7 = 1;
    else
      v7 = objc_msgSend(v8, "rssi");
    self->_rssiAtSessionStart = v7;
    -[WiFiUsageBssSession linkQualityDidChange:](self->_currentBssSession, "linkQualityDidChange:", v8);
  }

}

- (void)scanningStateDidChange:(BOOL)a3 client:(unint64_t)a4 neighborBSS:(id)a5 otherBSS:(id)a6
{
  _BOOL8 v8;
  id v10;
  void *v11;
  void *v12;
  double v13;
  id v14;

  v8 = a3;
  v14 = a5;
  v10 = a6;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
  {
    -[WiFiUsageSession setScanningActiveTime:](self, "setScanningActiveTime:", v11);
    ++self->_inScanEventCount;
    if (a4 - 1 <= 0x19)
      ++self->_perClientScanCount[a4];
    if ((a4 - 1 < 7 || a4 - 20 <= 1)
      && self->_joinScanLatencyFromDriverAvailability == 0.0
      && self->_lastDriverAvailableTime)
    {
      objc_msgSend(v12, "timeIntervalSinceDate:");
      -[WiFiUsageSession setJoinScanLatencyFromDriverAvailability:](self, "setJoinScanLatencyFromDriverAvailability:");
    }
  }
  else if (self->_scanningActiveTime)
  {
    objc_msgSend(v11, "timeIntervalSinceDate:");
    self->_inScanDuration = v13 + self->_inScanDuration;
    -[WiFiUsageSession setScanningActiveTime:](self, "setScanningActiveTime:", 0);
  }
  -[WiFiUsageBssSession scanningStateDidChange:client:neighborBSS:otherBSS:](self->_currentBssSession, "scanningStateDidChange:client:neighborBSS:otherBSS:", v8, a4, v14, v10);

}

- (void)setScanningActiveTime:(id)a3
{
  objc_storeStrong((id *)&self->_scanningActiveTime, a3);
}

- (WiFiUsageNetworkDetails)networkDetails
{
  return self->_networkDetails;
}

- (NSDate)sessionStartTime
{
  return self->_sessionStartTime;
}

- (void)updateWithRoamingSuppression:(unsigned __int8)a3
{
  int v3;
  void *v5;
  NSDate **p_lastRoamSuppressionToggled;
  double v7;
  id obj;
  id obja;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (!self->_isRoamSuppressionEnabled)
    {
      ++self->_inRoamSuppressionEnabledCount;
      p_lastRoamSuppressionToggled = &self->_lastRoamSuppressionToggled;
LABEL_6:
      obja = v5;
      objc_storeStrong((id *)p_lastRoamSuppressionToggled, v5);
      v5 = obja;
    }
  }
  else if (self->_isRoamSuppressionEnabled)
  {
    self->_roamsAfterSupprLifted = 0;
    p_lastRoamSuppressionToggled = &self->_lastRoamSuppressionToggled;
    obj = v5;
    objc_msgSend(v5, "timeIntervalSinceDate:", self->_lastRoamSuppressionToggled);
    v5 = obj;
    self->_inRoamSuppressionEnabled = v7 + self->_inRoamSuppressionEnabled;
    goto LABEL_6;
  }
  self->_isRoamSuppressionEnabled = v3 != 0;

}

- (void)roamingARConfigurationDidChange:(id *)a3
{
  WiFiUsageBssSession *currentBssSession;
  __int128 v4;
  _OWORD v5[2];

  currentBssSession = self->_currentBssSession;
  v4 = *(_OWORD *)&a3->var5;
  v5[0] = *(_OWORD *)&a3->var0;
  v5[1] = v4;
  -[WiFiUsageBssSession roamingARConfigurationDidChange:](currentBssSession, "roamingARConfigurationDidChange:", v5);
}

- (WiFiUsageBssSession)currentBssSession
{
  return self->_currentBssSession;
}

- (WiFiUsageSession)initWithSessionType:(unint64_t)a3 andInterfaceName:(id)a4 andCapabilities:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char *v11;
  void *v12;
  WiFiUsageSession *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v21.receiver = self;
    v21.super_class = (Class)WiFiUsageSession;
    v11 = -[WiFiUsageSession init](&v21, sel_init);
    objc_msgSend(v11, "setSessionInitTime:", v10);
    objc_msgSend(v11, "setSessionPid:", getpid());
    objc_msgSend(v11, "setType:", a3);
    objc_msgSend(v11, "setInterfaceName:", v8);
    objc_msgSend(v11, "setCapabilities:", v9);
    objc_msgSend(v11, "setSessionTimeSinceLastSession:", -1.0);
    objc_msgSend(v11, "setIsSessionActive:", 0);
    objc_msgSend(v11, "setLastSystemWakeTime:", v10);
    objc_msgSend(v11, "setLastPowerBudget:", -1);
    objc_msgSend(v11, "setLastThermalIndex:", -1);
    objc_msgSend(v11, "setLastJoinReason:", -1);
    objc_msgSend(v11, "setPrevJoinReason:", -1);
    objc_msgSend(v11, "setSavedLastJoinReason:", -1);
    objc_msgSend(v11, "setLastJoinFailure:", -1);
    objc_msgSend(v11, "setSavedLastJoinFailure:", -1);
    objc_msgSend(v11, "setLastDisconnectReason:", -1);
    objc_msgSend(v11, "setPreviousDisconnectReason:", -1);
    objc_msgSend(v11, "setSavedPreviousDisconnectReason:", -1);
    objc_msgSend(v11, "setLastDisconnectSubreason:", -1);
    objc_msgSend(v11, "setSmartCoverStateChangedCount:", 0);
    objc_msgSend(v11, "setNetworkDetailsAtEnd:", 0);
    objc_msgSend(v11, "setCurrentBssSession:", 0);
    objc_msgSend(v11, "setResponsivenessScore:", 0);
    *((_QWORD *)v11 + 27) = 0;
    *(_OWORD *)(v11 + 200) = 0u;
    *(_OWORD *)(v11 + 184) = 0u;
    *(_OWORD *)(v11 + 168) = 0u;
    *(_OWORD *)(v11 + 152) = 0u;
    *(_OWORD *)(v11 + 136) = 0u;
    *(_OWORD *)(v11 + 120) = 0u;
    *(_OWORD *)(v11 + 104) = 0u;
    *(_OWORD *)(v11 + 88) = 0u;
    *(_OWORD *)(v11 + 72) = 0u;
    *(_OWORD *)(v11 + 56) = 0u;
    *(_OWORD *)(v11 + 40) = 0u;
    *(_OWORD *)(v11 + 24) = 0u;
    *(_OWORD *)(v11 + 8) = 0u;
    *((_OWORD *)v11 + 14) = 0u;
    *((_OWORD *)v11 + 15) = 0u;
    *((_OWORD *)v11 + 16) = 0u;
    *((_OWORD *)v11 + 17) = 0u;
    *((_OWORD *)v11 + 18) = 0u;
    *((_OWORD *)v11 + 19) = 0u;
    *((_OWORD *)v11 + 20) = 0u;
    *((_OWORD *)v11 + 21) = 0u;
    *((_OWORD *)v11 + 22) = 0u;
    *((_OWORD *)v11 + 23) = 0u;
    *((_OWORD *)v11 + 24) = 0u;
    *((_OWORD *)v11 + 25) = 0u;
    *((_OWORD *)v11 + 26) = 0u;
    *((_OWORD *)v11 + 27) = 0u;
    *((_OWORD *)v11 + 28) = 0u;
    *((_OWORD *)v11 + 29) = 0u;
    *((_QWORD *)v11 + 76) = 0;
    *((_OWORD *)v11 + 36) = 0u;
    *((_OWORD *)v11 + 37) = 0u;
    *((_OWORD *)v11 + 34) = 0u;
    *((_OWORD *)v11 + 35) = 0u;
    *((_OWORD *)v11 + 32) = 0u;
    *((_OWORD *)v11 + 33) = 0u;
    *((_OWORD *)v11 + 30) = 0u;
    *((_OWORD *)v11 + 31) = 0u;
    v12 = (void *)*((_QWORD *)v11 + 1126);
    if (v12)
    {
      objc_msgSend(v12, "removeAllObjects");
    }
    else
    {
      v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v15 = (void *)*((_QWORD *)v11 + 1126);
      *((_QWORD *)v11 + 1126) = v14;

    }
    objc_msgSend(v11, "setLastDriverUnavailableReason:", 0);
    objc_msgSend(v11, "setLastDriverTerminationTime:", 0);
    objc_msgSend(v11, "setLastChipResetTime:", 0);
    objc_msgSend(v11, "setDriverProcessLifespan:", 0.0);
    objc_msgSend(v11, "setDriverAvailabilityLifespan:", 0.0);
    objc_msgSend(v11, "setIsDriverAvailable:", 1);
    objc_msgSend(v11, "setDriverUnavailabilityCount:", 0);
    objc_msgSend(v11, "setLastDriverAvailableTime:", v10);
    objc_msgSend(v11, "trackEventLatencies");
    v16 = (void *)objc_opt_new();
    objc_msgSend(v11, "setRoamNeighborsByBand:", v16);

    v17 = (void *)objc_opt_new();
    objc_msgSend(v11, "setRoamCandidatesPerBandWhenSuccessful:", v17);

    v18 = (void *)objc_opt_new();
    objc_msgSend(v11, "setRoamCandidatesPerBandWhenUnSuccessful:", v18);

    v19 = (void *)objc_opt_new();
    objc_msgSend(v11, "setPrevNetworkNames:", v19);

    objc_msgSend(v11, "setLastCoexRealTimeOn:", 0);
    objc_msgSend(v11, "setLastCoexRealTimeOff:", 0);
    objc_msgSend(v11, "setConsecutiveJoinFailureCount:", 0);
    v11[9019] = 0;
    self = v11;
    v13 = self;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[WiFiUsageSession initWithSessionType:andInterfaceName:andCapabilities:]";
      v24 = 2112;
      v25 = 0;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - Cannot create Session (invalid interfaceName: %@)", buf, 0x16u);
    }
    v13 = 0;
  }

  return v13;
}

- (void)setCompletionHandler:(id)a3 withContext:(id)a4 onQueue:(id)a5
{
  id v8;
  id v9;

  v9 = a5;
  v8 = a4;
  -[WiFiUsageSession setCompletionHandler:](self, "setCompletionHandler:", a3);
  -[WiFiUsageSession setCompletionContext:](self, "setCompletionContext:", v8);

  -[WiFiUsageSession setCompletionQueue:](self, "setCompletionQueue:", v9);
}

- (void)setLastDisconnectReason:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *disconnectReasonMap;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;

  +[WiFiUsageSession disconnectReasonString:](WiFiUsageSession, "disconnectReasonString:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_lastDisconnectReason = a3;
  if (v5)
  {
    v13 = v5;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WiFiDisconnectReason%@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_disconnectReasonMap, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    disconnectReasonMap = self->_disconnectReasonMap;
    if (v7)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](disconnectReasonMap, "objectForKeyedSubscript:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "integerValue");

      v11 = self->_disconnectReasonMap;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10 + 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v12, v6);

    }
    else
    {
      -[NSMutableDictionary setObject:forKey:](disconnectReasonMap, "setObject:forKey:", &unk_1E8862BC8, v6);
    }

    v5 = v13;
  }

}

- (void)systemWakeStateDidChange:(BOOL)a3 wokenByWiFi:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  NSDate *v7;
  NSDate *lastSystemSleepTime;
  double v9;
  double v10;
  NSDate *v11;

  v4 = a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  if (v5)
  {
    ++self->_systemWakeStateChangedCount;
    if (v4)
      ++self->_systemWokenByWiFiCount;
    -[WiFiUsageSession setLastSystemWakeTime:](self, "setLastSystemWakeTime:", v7);
    lastSystemSleepTime = self->_lastSystemSleepTime;
    if (lastSystemSleepTime)
    {
      if (self->_lastLinkStateChangedTime)
      {
        -[NSDate timeIntervalSinceDate:](v11, "timeIntervalSinceDate:");
        lastSystemSleepTime = 0;
        self->_associatedSleepDuration = v9 + self->_associatedSleepDuration;
      }
      else
      {
        lastSystemSleepTime = 0;
      }
    }
  }
  else
  {
    lastSystemSleepTime = v7;
    if (self->_lastSystemWakeTime)
    {
      -[NSDate timeIntervalSinceDate:](v7, "timeIntervalSinceDate:", self->_lastSystemWakeTime);
      self->_systemAwakeDuration = v10 + self->_systemAwakeDuration;
      -[WiFiUsageSession setLastSystemWakeTime:](self, "setLastSystemWakeTime:", v11);
      lastSystemSleepTime = v11;
    }
  }
  -[WiFiUsageSession setLastSystemSleepTime:](self, "setLastSystemSleepTime:", lastSystemSleepTime);

}

- (void)lockStateDidChange:(BOOL)a3
{
  if (a3)
    ++self->_lockStateChangedCount;
  self->_isUnlocked = !a3;
}

- (void)displayStateDidChange:(BOOL)a3
{
  if (a3)
    ++self->_displayStateChangedCount;
  self->_isDisplayOn = a3;
}

- (void)motionStateDidChange:(id)a3
{
  void *v4;
  id v5;
  int v6;
  uint64_t v7;
  int v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "date");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("Stationary"));
  v7 = objc_msgSend(v5, "containsString:", CFSTR("Driving"));
  v8 = objc_msgSend(v5, "isEqualToString:", CFSTR("Walking"));

  if ((v6 & 1) != 0)
  {
    if (self->_inMotionStartedTime)
    {
      objc_msgSend(v12, "timeIntervalSinceDate:");
      self->_inMotionDuration = v9 + self->_inMotionDuration;
      -[WiFiUsageSession setInMotionStartedTime:](self, "setInMotionStartedTime:", 0);
    }
    if ((_DWORD)v7)
      goto LABEL_5;
  }
  else
  {
    -[WiFiUsageSession setInMotionStartedTime:](self, "setInMotionStartedTime:", v12);
    ++self->_inMotionEventCount;
    if ((_DWORD)v7)
    {
LABEL_5:
      -[WiFiUsageSession setInVehicleEntryTime:](self, "setInVehicleEntryTime:", v12);
      ++self->_inVehicleEventCount;
      goto LABEL_9;
    }
  }
  if (self->_inVehicleEntryTime)
  {
    objc_msgSend(v12, "timeIntervalSinceDate:");
    self->_inVehicleDuration = v10 + self->_inVehicleDuration;
    -[WiFiUsageSession setInVehicleEntryTime:](self, "setInVehicleEntryTime:", 0);
  }
LABEL_9:
  if (v8)
  {
    -[WiFiUsageSession setInWalkingEntryTime:](self, "setInWalkingEntryTime:", v12);
    ++self->_inWalkingEventCount;
  }
  else if (self->_inWalkingEntryTime)
  {
    objc_msgSend(v12, "timeIntervalSinceDate:");
    self->_inWalkingDuration = v11 + self->_inWalkingDuration;
    -[WiFiUsageSession setInWalkingEntryTime:](self, "setInWalkingEntryTime:", 0);
  }
  -[WiFiUsageBssSession motionStateDidChange:andVehicularState:](self->_currentBssSession, "motionStateDidChange:andVehicularState:", v6 ^ 1u, v7);

}

- (void)callStateDidChange:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  id v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (v3)
  {
    -[WiFiUsageSession setCallStartedTime:](self, "setCallStartedTime:", v5);
    ++self->_inCallEventCount;
  }
  else if (self->_callStartedTime)
  {
    objc_msgSend(v5, "timeIntervalSinceDate:");
    self->_inCallDuration = v6 + self->_inCallDuration;
    -[WiFiUsageSession setCallStartedTime:](self, "setCallStartedTime:", 0);
  }
  -[WiFiUsageBssSession callStateDidChange:](self->_currentBssSession, "callStateDidChange:", v3);

}

- (void)smartCoverStateDidChange:(id)a3
{
  objc_storeStrong((id *)&self->_lastSmartCoverState, a3);
  ++self->_smartCoverStateChangedCount;
}

- (void)mediaStateDidChange:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    v8 = v5;
    -[WiFiUsageSession setMediaStartedTime:](self, "setMediaStartedTime:", v5);
    v6 = v8;
    ++self->_mediaPlaybackEventCount;
  }
  else if (self->_mediaStartedTime)
  {
    v9 = v5;
    objc_msgSend(v5, "timeIntervalSinceDate:");
    self->_mediaPlaybackDuration = v7 + self->_mediaPlaybackDuration;
    -[WiFiUsageSession setMediaStartedTime:](self, "setMediaStartedTime:", 0);
    v6 = v9;
  }

}

- (void)chargingStateDidChange:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    v8 = v5;
    -[WiFiUsageSession setChargingStartedTime:](self, "setChargingStartedTime:", v5);
    v6 = v8;
    ++self->_chargingEventCount;
  }
  else if (self->_chargingStartedTime)
  {
    v9 = v5;
    objc_msgSend(v5, "timeIntervalSinceDate:");
    self->_chargingDuration = v7 + self->_chargingDuration;
    -[WiFiUsageSession setChargingStartedTime:](self, "setChargingStartedTime:", 0);
    v6 = v9;
  }

}

- (void)companionStateDidChange:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    v8 = v5;
    -[WiFiUsageSession setCompanionConnectionTime:](self, "setCompanionConnectionTime:", v5);
    v6 = v8;
    ++self->_companionConnectionStateChangedCount;
  }
  else if (self->_companionConnectionTime)
  {
    v9 = v5;
    objc_msgSend(v5, "timeIntervalSinceDate:");
    self->_companionConnectedDuration = v7 + self->_companionConnectedDuration;
    -[WiFiUsageSession setCompanionConnectionTime:](self, "setCompanionConnectionTime:", 0);
    v6 = v9;
  }

}

- (void)updateWowState:(BOOL)a3 lpasState:(BOOL)a4 lowPowerState:(BOOL)a5 batterySaverState:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  NSDate *wowStateEntryTime;
  double v12;
  NSDate *lpasStateEntryTime;
  double v14;
  NSDate *lowPowerStateEntryTime;
  double v16;
  NSDate *batterySaverStateEntryTime;
  double v18;
  id v19;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  wowStateEntryTime = self->_wowStateEntryTime;
  if (v9)
  {
    if (!wowStateEntryTime)
    {
      -[WiFiUsageSession setWowStateEntryTime:](self, "setWowStateEntryTime:", v19);
      ++self->_wowStateChangedCount;
    }
  }
  else if (wowStateEntryTime)
  {
    objc_msgSend(v19, "timeIntervalSinceDate:");
    self->_inWowStateDuration = v12 + self->_inWowStateDuration;
    -[WiFiUsageSession setWowStateEntryTime:](self, "setWowStateEntryTime:", 0);
  }
  lpasStateEntryTime = self->_lpasStateEntryTime;
  if (v8)
  {
    if (!lpasStateEntryTime)
    {
      -[WiFiUsageSession setLpasStateEntryTime:](self, "setLpasStateEntryTime:", v19);
      ++self->_lpasStateChangedCount;
    }
  }
  else if (lpasStateEntryTime)
  {
    objc_msgSend(v19, "timeIntervalSinceDate:");
    self->_inLpasStateDuration = v14 + self->_inLpasStateDuration;
    -[WiFiUsageSession setLpasStateEntryTime:](self, "setLpasStateEntryTime:", 0);
  }
  lowPowerStateEntryTime = self->_lowPowerStateEntryTime;
  if (v7)
  {
    if (!lowPowerStateEntryTime)
    {
      -[WiFiUsageSession setLowPowerStateEntryTime:](self, "setLowPowerStateEntryTime:", v19);
      ++self->_lowPowerStateChangedCount;
    }
  }
  else if (lowPowerStateEntryTime)
  {
    objc_msgSend(v19, "timeIntervalSinceDate:");
    self->_inLowPowerStateDuration = v16 + self->_inLowPowerStateDuration;
    -[WiFiUsageSession setLowPowerStateEntryTime:](self, "setLowPowerStateEntryTime:", 0);
  }
  batterySaverStateEntryTime = self->_batterySaverStateEntryTime;
  if (v6)
  {
    if (!batterySaverStateEntryTime)
    {
      -[WiFiUsageSession setBatterySaverStateEntryTime:](self, "setBatterySaverStateEntryTime:", v19);
      ++self->_batterySaverStateChangedCount;
    }
  }
  else if (batterySaverStateEntryTime)
  {
    objc_msgSend(v19, "timeIntervalSinceDate:");
    self->_inBatterySaverStateDuration = v18 + self->_inBatterySaverStateDuration;
    -[WiFiUsageSession setBatterySaverStateEntryTime:](self, "setBatterySaverStateEntryTime:", 0);
  }

}

- (void)updateSleepPowerStats:(double)a3 unassociatedDuration:(double)a4 associatedDuration:(double)a5 roamingDuration:(double)a6
{
  self->_sleepPowerStatsTotalDuration = self->_sleepPowerStatsTotalDuration + a3;
  self->_sleepPowerStatsUnassociatedDuration = self->_sleepPowerStatsUnassociatedDuration + a4;
  self->_sleepPowerStatsAssociatedDuration = self->_sleepPowerStatsAssociatedDuration + a5;
  self->_sleepPowerStatsRoamingDuration = self->_sleepPowerStatsRoamingDuration + a6;
}

- (void)updateBandUsageFor:(int)a3 With:(id)a4
{
  id v6;
  NSDate *lastBssChangedTime;
  uint64_t v8;
  double v9;
  void *v10;
  $67BF009755BA36E02ED2DA1B93294EBF *p_bandUsageDuration;
  BOOL *valid;
  uint64_t v13;
  id v14;
  double v15;
  void *v16;

  v6 = a4;
  if (a3 <= 2)
  {
    lastBssChangedTime = self->_lastBssChangedTime;
    if (lastBssChangedTime)
    {
      v16 = v6;
      -[NSDate timeIntervalSinceDate:](lastBssChangedTime, "timeIntervalSinceDate:", self->_sessionStartTime);
      v8 = 9256;
      if (v9 > 0.0)
        v8 = 9456;
      v10 = *(Class *)((char *)&self->super.isa + v8);
      p_bandUsageDuration = &self->_bandUsageDuration;
      valid = self->_bandUsageDuration.valid;
      v13 = a3;
      if (!valid[a3])
        p_bandUsageDuration->valueByBand[a3] = 0.0;
      v14 = v10;
      objc_msgSend(v16, "timeIntervalSinceDate:", v14);
      p_bandUsageDuration->valueByBand[v13] = v15 + p_bandUsageDuration->valueByBand[v13];
      valid[v13] = 1;

      v6 = v16;
    }
  }

}

- (BOOL)useSavedJoinStats
{
  return 0;
}

- (void)joinStateDidChange:(id)a3 withReason:(unint64_t)a4 lastDisconnectReason:(int64_t)a5 lastJoinFailure:(int64_t)a6 andNetworkDetails:(id)a7
{
  void *v12;
  unint64_t lastJoinReason;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;

  v20 = a7;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    if (-[WiFiUsageSession useSavedJoinStats](self, "useSavedJoinStats"))
    {
      lastJoinReason = self->_lastJoinReason;
      if (lastJoinReason != -1)
      {
        v14 = *(_OWORD *)&self->_joinReasonCount[10];
        *(_OWORD *)&self->_savedJoinReasonCount[8] = *(_OWORD *)&self->_joinReasonCount[8];
        *(_OWORD *)&self->_savedJoinReasonCount[10] = v14;
        *(_OWORD *)&self->_savedJoinReasonCount[12] = *(_OWORD *)&self->_joinReasonCount[12];
        self->_savedJoinReasonCount[14] = self->_joinReasonCount[14];
        v15 = *(_OWORD *)&self->_joinReasonCount[2];
        *(_OWORD *)self->_savedJoinReasonCount = *(_OWORD *)self->_joinReasonCount;
        *(_OWORD *)&self->_savedJoinReasonCount[2] = v15;
        v16 = *(_OWORD *)&self->_joinReasonCount[6];
        *(_OWORD *)&self->_savedJoinReasonCount[4] = *(_OWORD *)&self->_joinReasonCount[4];
        *(_OWORD *)&self->_savedJoinReasonCount[6] = v16;
        self->_savedJoinStateChangedCount = self->_joinStateChangedCount;
        self->_savedPrevJoinReason = self->_prevJoinReason;
        self->_savedTimeSincePrevJoin = self->_timeSincePrevJoin;
        self->_savedInCoexRealTimeAtLastJoin = self->_inCoexRealTimeAtLastJoin;
        self->_savedLastJoinReason = lastJoinReason;
        self->_savedPreviousDisconnectReason = self->_previousDisconnectReason;
        self->_savedLastJoinFailure = self->_lastJoinFailure;
      }
    }
    if (!self->_lastJoinFailure)
      -[WiFiUsageSession setConsecutiveJoinFailureCount:](self, "setConsecutiveJoinFailureCount:", 0);
    ++self->_joinStateChangedCount;
    ++self->_joinReasonCount[a4];
    -[WiFiUsageSession setPrevJoinReason:](self, "setPrevJoinReason:", self->_lastJoinReason);
    objc_msgSend(v12, "timeIntervalSinceDate:", self->_lastJoinTime);
    -[WiFiUsageSession setTimeSincePrevJoin:](self, "setTimeSincePrevJoin:");
    -[WiFiUsageSession setLastJoinTime:](self, "setLastJoinTime:", v12);
    -[WiFiUsageSession setInCoexRealTimeAtLastJoin:](self, "setInCoexRealTimeAtLastJoin:", self->_inCoexRealTime);
    -[WiFiUsageSession setLastJoinReason:](self, "setLastJoinReason:", a4);
    -[WiFiUsageSession setPreviousDisconnectReason:](self, "setPreviousDisconnectReason:", self->_lastDisconnectReason);
    -[WiFiUsageSession setLastDisconnectReason:](self, "setLastDisconnectReason:", 0);
    -[WiFiUsageSession setLastDisconnectSubreason:](self, "setLastDisconnectSubreason:", 0);
    -[WiFiUsageSession setLastJoinFailure:](self, "setLastJoinFailure:", 0);
    if (self->_joinStartedLatencyFromDriverAvailability == 0.0 && self->_lastDriverAvailableTime)
    {
      objc_msgSend(v12, "timeIntervalSinceDate:");
      -[WiFiUsageSession setJoinStartedLatencyFromDriverAvailability:](self, "setJoinStartedLatencyFromDriverAvailability:");
    }
  }
  else
  {
    -[WiFiUsageSession setPreviousDisconnectReason:](self, "setPreviousDisconnectReason:", self->_lastDisconnectReason);
    -[WiFiUsageSession setLastDisconnectReason:](self, "setLastDisconnectReason:", a5);
    -[WiFiUsageSession setLastJoinFailure:](self, "setLastJoinFailure:", a6);
    if (-[WiFiUsageSession useSavedJoinStats](self, "useSavedJoinStats") && self->_lastJoinReason != -1)
    {
      self->_savedPreviousDisconnectReason = self->_previousDisconnectReason;
      self->_savedLastJoinFailure = self->_lastJoinFailure;
    }
    if (a6)
      ++self->_consecutiveJoinFailureCount;
  }
  if (self->_rssiAtSessionStart == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v20, "connectedBss");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "rssi") == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_19:

      goto LABEL_20;
    }
    objc_msgSend(v20, "connectedBss");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "rssi");

    if (v19)
    {
      objc_msgSend(v20, "connectedBss");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      self->_rssiAtSessionStart = objc_msgSend(v17, "rssi");
      goto LABEL_19;
    }
  }
LABEL_20:

}

- (void)linkStateDidChange:(BOOL)a3 isInvoluntary:(BOOL)a4 linkChangeReason:(int64_t)a5 linkChangeSubreason:(int64_t)a6 withNetworkDetails:(id)a7
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  BOOL *p_isAssociated;
  void *v25;
  WiFiUsageNetworkDetails *networkDetails;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  WiFiUsageBssSession *currentBssSession;
  void *v34;
  void *v35;
  void *v36;
  WiFiUsageNetworkDetails *v37;
  void *v38;
  WiFiUsageBssSession *v39;
  void *v40;
  NSMutableArray *prevNetworkNames;
  WiFiUsageBssSession *v42;
  NSString *interfaceName;
  void *v44;
  void *v45;
  WiFiUsageBssSession *v46;
  double v47;
  double v48;
  void *v49;
  unsigned int v50;
  _BOOL4 v53;
  unsigned int v54;
  _BOOL4 v55;
  void *v56;
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  int v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  int v74;
  __int16 v75;
  void *v76;
  uint64_t v77;

  v53 = a4;
  v55 = a3;
  v77 = *MEMORY[0x1E0C80C00];
  v8 = a7;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageBssSession originBssDetails](self->_currentBssSession, "originBssDetails");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bssid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "connectedBss");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bssid");
  v13 = objc_claimAutoreleasedReturnValue();

  -[WiFiUsageNetworkDetails connectedBss](self->_networkDetails, "connectedBss");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v14, "band");

  objc_msgSend(v8, "connectedBss");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  self->_currentBand = objc_msgSend(v15, "band");

  -[WiFiUsageNetworkDetails connectedBss](self->_networkDetails, "connectedBss");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "channel");

  objc_msgSend(v8, "connectedBss");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "channel");

  objc_msgSend(v8, "connectedBss");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[WiFiUsageAccessPointProfile profileForBSSID:](WiFiUsageAccessPointProfile, "profileForBSSID:", v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setApProfile:", v21);

  v22 = v11;
  v56 = (void *)v13;
  v23 = 1;
  if (objc_msgSend(v11, "isEqual:", v13) && v17 == v19)
    v23 = v54 != self->_currentBand;
  p_isAssociated = &self->_isAssociated;
  v25 = v9;
  if (v55)
  {
    if (!*p_isAssociated)
    {
      objc_msgSend(v9, "timeIntervalSinceDate:", self->_sessionStartTime);
      -[WiFiUsageSession setJoinLinkUpLatencyFromSessionStart:](self, "setJoinLinkUpLatencyFromSessionStart:");
    }
    *p_isAssociated = 1;
    networkDetails = self->_networkDetails;
    if (networkDetails
      && (-[WiFiUsageNetworkDetails networkName](networkDetails, "networkName"),
          v27 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v8, "networkName"),
          v28 = (void *)objc_claimAutoreleasedReturnValue(),
          v29 = objc_msgSend(v27, "isEqualToString:", v28),
          v28,
          v27,
          (v29 & 1) == 0))
    {
      ++self->_networkChangedCount;
      if (-[NSMutableArray count](self->_prevNetworkNames, "count")
        && (unint64_t)-[NSMutableArray count](self->_prevNetworkNames, "count") >= 2)
      {
        -[NSMutableArray removeObjectAtIndex:](self->_prevNetworkNames, "removeObjectAtIndex:", 0);
      }
      -[WiFiUsageNetworkDetails networkName](self->_networkDetails, "networkName");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v40)
        goto LABEL_38;
      prevNetworkNames = self->_prevNetworkNames;
      -[WiFiUsageNetworkDetails networkName](self->_networkDetails, "networkName");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](prevNetworkNames, "addObject:", v34);
    }
    else
    {
      if (v22 && (!v23 || !self->_lastBssChangedTime || !self->_networkDetails))
        goto LABEL_38;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        -[WiFiUsageSession sessionName](self, "sessionName");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:", v54);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:", self->_currentBand);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136317442;
        v58 = "-[WiFiUsageSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:]";
        v59 = 2112;
        v60 = v30;
        v61 = 2160;
        v62 = 1752392040;
        v63 = 2112;
        v64 = v22;
        v65 = 1024;
        v66 = v17;
        v67 = 2112;
        v68 = v31;
        v69 = 2160;
        v70 = 1752392040;
        v71 = 2112;
        v72 = v56;
        v73 = 1024;
        v74 = v19;
        v75 = 2112;
        v76 = v32;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: %@: roamed from BSSID %{mask.hash}@ on channel %d(%@Ghz) to BSSID %{mask.hash}@ on channel %d(%@Ghz)", buf, 0x5Eu);

      }
      if (-[WiFiUsageSession isSessionActive](self, "isSessionActive") && self->_lastBssChangedTime)
        -[WiFiUsageSession updateBandUsageFor:With:](self, "updateBandUsageFor:With:", v54, v25);
      -[WiFiUsageSession setLastBssChangedTime:](self, "setLastBssChangedTime:", v25);
      currentBssSession = self->_currentBssSession;
      objc_msgSend(v8, "bssEnvironment");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "connectedBss");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageBssSession bssDidChange:withDetails:](currentBssSession, "bssDidChange:withDetails:", v34, v35);

    }
LABEL_38:
    if (v8 && !self->_currentBssSession && self->_type == 4)
    {
      v42 = [WiFiUsageBssSession alloc];
      interfaceName = self->_interfaceName;
      objc_msgSend(v8, "bssEnvironment");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "connectedBss");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = -[WiFiUsageBssSession initWithInterfaceName:bssEnvironment:andBssDetails:andNetworkDetails:](v42, "initWithInterfaceName:bssEnvironment:andBssDetails:andNetworkDetails:", interfaceName, v44, v45, v8);
      -[WiFiUsageSession setCurrentBssSession:](self, "setCurrentBssSession:", v46);

    }
    ++self->_linkStateChangedCount;
    if (self->_lastLinkStateChangedTime)
    {
      objc_msgSend(v25, "timeIntervalSinceDate:");
      if (v47 > self->_longestUnassociatedDuration)
        self->_longestUnassociatedDuration = v47;
    }
    if (self->_lastUnexpectedLinkDownTime)
    {
      objc_msgSend(v25, "timeIntervalSinceDate:");
      if (v48 < 20.0)
        ++self->_rapidLinkTransitionCount;
    }
    -[WiFiUsageSession setLastUnexpectedLinkDownTime:](self, "setLastUnexpectedLinkDownTime:", 0);
    if (!self->_lastLinkStateChangedTime)
      -[WiFiUsageSession setLastLinkStateChangedTime:](self, "setLastLinkStateChangedTime:", v25);
    if (!self->_lastBssChangedTime)
      -[WiFiUsageSession setLastBssChangedTime:](self, "setLastBssChangedTime:", v25);
    if (self->_joinLinkUpLatencyFromDriverAvailability == 0.0 && self->_lastDriverAvailableTime)
    {
      objc_msgSend(v25, "timeIntervalSinceDate:");
      -[WiFiUsageSession setJoinLinkUpLatencyFromDriverAvailability:](self, "setJoinLinkUpLatencyFromDriverAvailability:");
    }
    objc_msgSend(v8, "connectedBss");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = +[WiFiUsageLQMTransformations maxPhyModeFrom:](WiFiUsageLQMTransformations, "maxPhyModeFrom:", objc_msgSend(v49, "phyMode"));

    if (v50 > self->_maxPhyMode)
      self->_maxPhyMode = v50;
    goto LABEL_57;
  }
  *p_isAssociated = 0;
  if (!-[WiFiUsageSession lastDisconnectReason](self, "lastDisconnectReason"))
  {
    -[WiFiUsageSession setLastDisconnectReason:](self, "setLastDisconnectReason:", a5);
    -[WiFiUsageSession setLastDisconnectSubreason:](self, "setLastDisconnectSubreason:", a6);
  }
  if (v53)
    v36 = v9;
  else
    v36 = 0;
  -[WiFiUsageSession setLastUnexpectedLinkDownTime:](self, "setLastUnexpectedLinkDownTime:", v36);
  -[WiFiUsageSession tallyAssociatedDuration:](self, "tallyAssociatedDuration:", v9);
  if (self->_lastBssChangedTime)
  {
    v37 = self->_networkDetails;
    if (v37)
    {
      -[WiFiUsageNetworkDetails connectedBss](v37, "connectedBss");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageSession updateBandUsageFor:With:](self, "updateBandUsageFor:With:", objc_msgSend(v38, "band"), v9);

    }
    -[WiFiUsageSession setLastBssChangedTime:](self, "setLastBssChangedTime:", 0);
  }
  v39 = self->_currentBssSession;
  if (v39)
    -[WiFiUsageBssSession bssDidChange:withDetails:](v39, "bssDidChange:withDetails:", 0, 0);
  if (self->_lastAWDLSequenceUpdate)
  {
    -[WiFiUsageSession tallyInfraScoreDuration:until:](self, "tallyInfraScoreDuration:until:", 0, v9);
    -[WiFiUsageSession tallyP2PScoreDuration:until:](self, "tallyP2PScoreDuration:until:", v9, self->_inAWDL_lastP2PScore);
    objc_storeStrong((id *)&self->_lastAWDLSequenceUpdate, v9);
  }
LABEL_57:
  -[WiFiUsageSession setIsInstantHotspot:](self, "setIsInstantHotspot:", objc_msgSend(v8, "isInstantHotspot"));
  -[WiFiUsageSession setIsAutoHotspot:](self, "setIsAutoHotspot:", objc_msgSend(v8, "isAutoHotspot"));
  -[WiFiUsageSession updateAssociatedNetworkDetails:](self, "updateAssociatedNetworkDetails:", v8);

}

- (void)updateApProfile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_networkDetails)
  {
    objc_msgSend(v4, "bssid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiUsageNetworkDetails connectedBss](self->_networkDetails, "connectedBss");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bssid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == v8)
    {
      -[WiFiUsageNetworkDetails connectedBss](self->_networkDetails, "connectedBss");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "apProfile");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setApProfile:", v10);

      goto LABEL_6;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      -[WiFiUsageSession sessionName](self, "sessionName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136315394;
      v12 = "-[WiFiUsageSession updateApProfile:]";
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - mismatched BSSID between beaconData and connectedBss - not updating session %@", (uint8_t *)&v11, 0x16u);
LABEL_6:

    }
  }

}

- (void)powerBudgetDidChange:(int64_t)a3 andThermalIndex:(int64_t)a4
{
  void *v7;
  int64_t lastPowerBudget;
  uint64_t v9;
  double v10;
  int64_t lastThermalIndex;
  uint64_t v12;
  double v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  lastPowerBudget = self->_lastPowerBudget;
  v14 = v7;
  if (lastPowerBudget <= 99)
  {
    if (lastPowerBudget <= 89)
    {
      if (lastPowerBudget <= 79)
      {
        if (lastPowerBudget <= 69)
        {
          if (lastPowerBudget <= 59)
          {
            if (lastPowerBudget <= 49)
            {
              if (lastPowerBudget <= 39)
              {
                if (lastPowerBudget <= 29)
                {
                  if (lastPowerBudget <= 19)
                  {
                    if (lastPowerBudget <= 9)
                    {
                      if (lastPowerBudget < 0)
                        goto LABEL_24;
                      v9 = 10112;
                    }
                    else
                    {
                      v9 = 10104;
                    }
                  }
                  else
                  {
                    v9 = 10096;
                  }
                }
                else
                {
                  v9 = 10088;
                }
              }
              else
              {
                v9 = 10080;
              }
            }
            else
            {
              v9 = 10072;
            }
          }
          else
          {
            v9 = 10064;
          }
        }
        else
        {
          v9 = 10056;
        }
      }
      else
      {
        v9 = 10048;
      }
    }
    else
    {
      v9 = 10040;
    }
  }
  else
  {
    v9 = 10032;
  }
  objc_msgSend(v7, "timeIntervalSinceDate:", self->_lastPowerBudgetChangedTime);
  v7 = v14;
  *(double *)((char *)&self->super.isa + v9) = v10 + *(double *)((char *)&self->super.isa + v9);
LABEL_24:
  lastThermalIndex = self->_lastThermalIndex;
  if (lastThermalIndex > 99)
  {
    v12 = 10120;
LABEL_46:
    objc_msgSend(v7, "timeIntervalSinceDate:", self->_lastPowerBudgetChangedTime);
    *(double *)((char *)&self->super.isa + v12) = v13 + *(double *)((char *)&self->super.isa + v12);
    goto LABEL_47;
  }
  if (lastThermalIndex > 89)
  {
    v12 = 10128;
    goto LABEL_46;
  }
  if (lastThermalIndex > 79)
  {
    v12 = 10136;
    goto LABEL_46;
  }
  if (lastThermalIndex > 69)
  {
    v12 = 10144;
    goto LABEL_46;
  }
  if (lastThermalIndex > 59)
  {
    v12 = 10152;
    goto LABEL_46;
  }
  if (lastThermalIndex > 49)
  {
    v12 = 10160;
    goto LABEL_46;
  }
  if (lastThermalIndex > 39)
  {
    v12 = 10168;
    goto LABEL_46;
  }
  if (lastThermalIndex > 29)
  {
    v12 = 10176;
    goto LABEL_46;
  }
  if (lastThermalIndex > 19)
  {
    v12 = 10184;
    goto LABEL_46;
  }
  if (lastThermalIndex > 9)
  {
    v12 = 10192;
    goto LABEL_46;
  }
  if ((lastThermalIndex & 0x8000000000000000) == 0)
  {
    v12 = 10200;
    v7 = v14;
    goto LABEL_46;
  }
LABEL_47:
  -[WiFiUsageSession setLastPowerBudget:](self, "setLastPowerBudget:", a3);
  -[WiFiUsageSession setLastThermalIndex:](self, "setLastThermalIndex:", a4);
  -[WiFiUsageSession setLastPowerBudgetChangedTime:](self, "setLastPowerBudgetChangedTime:", v14);

}

- (void)bluetoothStateDidChange:(BOOL)a3 connectedDeviceCount:(unint64_t)a4 inA2dp:(BOOL)a5 inSco:(BOOL)a6 inUniAoS:(BOOL)a7 inBiAoS:(BOOL)a8 btAudioBand:(BOOL)a9
{
  _BOOL8 v11;
  _BOOL8 v12;
  _BOOL8 v14;
  void *v16;
  double v17;
  double v18;
  double v19;
  __CFString *v20;
  id v21;

  v11 = a6;
  v12 = a5;
  v14 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v16;
  if (v12)
  {
    -[WiFiUsageSession setA2dpActiveTime:](self, "setA2dpActiveTime:", v16);
    ++self->_inA2dpEventCount;
  }
  else if (self->_a2dpActiveTime)
  {
    objc_msgSend(v16, "timeIntervalSinceDate:");
    self->_inA2dpDuration = v17 + self->_inA2dpDuration;
    -[WiFiUsageSession setA2dpActiveTime:](self, "setA2dpActiveTime:", 0);
  }
  if (v11)
  {
    -[WiFiUsageSession setScoActiveTime:](self, "setScoActiveTime:", v21);
    ++self->_inScoEventCount;
  }
  else if (self->_scoActiveTime)
  {
    objc_msgSend(v21, "timeIntervalSinceDate:");
    self->_inScoDuration = v18 + self->_inScoDuration;
    -[WiFiUsageSession setScoActiveTime:](self, "setScoActiveTime:", 0);
  }
  if (a4)
  {
    -[WiFiUsageSession setHidPresentTime:](self, "setHidPresentTime:", v21);
    ++self->_inHidPresentCount;
  }
  else if (self->_hidPresentTime)
  {
    objc_msgSend(v21, "timeIntervalSinceDate:");
    self->_inHidPresentDuration = v19 + self->_inHidPresentDuration;
    -[WiFiUsageSession setHidPresentTime:](self, "setHidPresentTime:", 0);
  }
  self->_isA2DPActive = v12;
  self->_isSCOActive = v11;
  self->_isUniAoSActive = a7;
  self->_isBiAoSActive = a8;
  if (a9)
    v20 = CFSTR("5");
  else
    v20 = CFSTR("2.4");
  objc_storeStrong((id *)&self->_btAudioBand, v20);
  -[WiFiUsageBssSession bluetoothStateDidChange:connectedDeviceCount:inA2dp:inSco:](self->_currentBssSession, "bluetoothStateDidChange:connectedDeviceCount:inA2dp:inSco:", v14, a4, v12, v11);

}

- (void)awdlStateDidChange:(BOOL)a3 inMode:(int64_t)a4
{
  _BOOL8 v5;
  void *v7;
  double v8;
  id v9;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  if (v5)
  {
    -[WiFiUsageSession setAwdlActiveTime:](self, "setAwdlActiveTime:", v7);
    ++self->_inAwdlEventCount;
  }
  else if (self->_awdlActiveTime)
  {
    objc_msgSend(v7, "timeIntervalSinceDate:");
    self->_inAwdlDuration = v8 + self->_inAwdlDuration;
    -[WiFiUsageSession setAwdlActiveTime:](self, "setAwdlActiveTime:", 0);
  }
  -[WiFiUsageBssSession awdlStateDidChange:inMode:](self->_currentBssSession, "awdlStateDidChange:inMode:", v5, a4);

}

- (void)softApStateDidChange:(BOOL)a3 requester:(id)a4 status:(id)a5 changeReason:(id)a6 channelNumber:(unint64_t)a7 countryCode:(unint64_t)a8 isHidden:(BOOL)a9 isInfraConnected:(BOOL)a10 isAwdlUp:(BOOL)a11 lowPowerModeDuration:(double)a12 compatibilityMode:(BOOL)a13 requestToUpLatency:(double)a14
{
  _BOOL4 v14;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;

  v14 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date", a3, a4, a5, a6, a7, a8, a12, a14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v14)
  {
    v19 = v16;
    -[WiFiUsageSession setSoftApActiveTime:](self, "setSoftApActiveTime:", v16);
    v17 = v19;
    ++self->_inSoftApEventCount;
  }
  else if (self->_softApActiveTime)
  {
    v20 = v16;
    objc_msgSend(v16, "timeIntervalSinceDate:");
    self->_inSoftApDuration = v18 + self->_inSoftApDuration;
    -[WiFiUsageSession setSoftApActiveTime:](self, "setSoftApActiveTime:", 0);
    v17 = v20;
  }

}

- (void)roamingStateDidChange:(BOOL)a3 reason:(unint64_t)a4 andStatus:(unint64_t)a5 andLatency:(unint64_t)a6 andRoamData:(id)a7 andPingPongStats:(id)a8
{
  _BOOL4 v11;
  id v13;
  id v14;
  void *v15;
  void *v16;
  double v17;
  double inRoamSuppressionWaitForRoamStart;
  double v19;
  double v20;
  unint64_t roamsAfterSupprLifted;
  double inRoamSuppressionWaitForRoamEnd;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  const char *v28;
  __int16 v29;
  double v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v11 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  v13 = a7;
  v14 = a8;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v11)
  {
    -[WiFiUsageSession setRoamingActiveTime:](self, "setRoamingActiveTime:", v15);
    ++self->_inRoamEventCount;
    if (self->_lastRoamSuppressionToggled)
    {
      if (!self->_isRoamSuppressionEnabled && !self->_roamsAfterSupprLifted)
      {
        objc_msgSend(v16, "timeIntervalSinceDate:");
        self->_inRoamSuppressionWaitForRoamStart = v17 + self->_inRoamSuppressionWaitForRoamStart;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          inRoamSuppressionWaitForRoamStart = self->_inRoamSuppressionWaitForRoamStart;
          v27 = 136315394;
          v28 = "-[WiFiUsageSession roamingStateDidChange:reason:andStatus:andLatency:andRoamData:andPingPongStats:]";
          v29 = 2048;
          v30 = inRoamSuppressionWaitForRoamStart;
          _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - incremented inRoamSuppressionWaitForRoamStart:%fs", (uint8_t *)&v27, 0x16u);
        }
      }
    }
    switch(a4)
    {
      case 0xE0820C00uLL:
        ++self->_roamReasonInitialAssociationCount;
        break;
      case 0xE0820C01uLL:
        ++self->_roamReasonLowRssiCount;
        break;
      case 0xE0820C02uLL:
      case 0xE0820C03uLL:
        ++self->_roamReasonDeauthDisassocCount;
        break;
      case 0xE0820C04uLL:
        ++self->_roamReasonBeaconLostCount;
        break;
      case 0xE0820C06uLL:
        ++self->_roamReasonSteeredByApCount;
        break;
      case 0xE0820C08uLL:
        ++self->_roamReasonBetterCandidateCount;
        break;
      case 0xE0820C09uLL:
      case 0xE0820C0AuLL:
      case 0xE0820C0CuLL:
      case 0xE0820C0FuLL:
        ++self->_roamReasonBetterConditionCount;
        break;
      case 0xE0820C0BuLL:
        ++self->_roamReasonSteeredByBtmCount;
        break;
      case 0xE0820C0EuLL:
        ++self->_roamReasonSteeredByCsaCount;
        break;
      case 0xE0820C13uLL:
        ++self->_roamReasonReassocRequestedCount;
        break;
      case 0xE0820C15uLL:
        ++self->_roamReasonHostTriggeredCount;
        break;
      default:
        ++self->_roamReasonMiscCount;
        break;
    }
    goto LABEL_25;
  }
  if (!self->_roamingActiveTime)
    goto LABEL_25;
  objc_msgSend(v15, "timeIntervalSinceDate:");
  self->_inRoamDuration = v19 + self->_inRoamDuration;
  -[WiFiUsageSession setRoamingActiveTime:](self, "setRoamingActiveTime:", 0);
  if (self->_lastRoamSuppressionToggled)
  {
    if (!self->_isRoamSuppressionEnabled && !self->_roamsAfterSupprLifted)
    {
      self->_roamsAfterSupprLifted = 1;
      objc_msgSend(v16, "timeIntervalSinceDate:");
      self->_inRoamSuppressionWaitForRoamEnd = v20 + self->_inRoamSuppressionWaitForRoamEnd;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        roamsAfterSupprLifted = self->_roamsAfterSupprLifted;
        inRoamSuppressionWaitForRoamEnd = self->_inRoamSuppressionWaitForRoamEnd;
        v27 = 136315650;
        v28 = "-[WiFiUsageSession roamingStateDidChange:reason:andStatus:andLatency:andRoamData:andPingPongStats:]";
        v29 = 2048;
        v30 = *(double *)&roamsAfterSupprLifted;
        v31 = 2048;
        v32 = inRoamSuppressionWaitForRoamEnd;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - roamsAfterSupprLifted:%lu. incremented inRoamSuppressionWaitForRoamEnd :%fs", (uint8_t *)&v27, 0x20u);
      }
    }
  }
  if (a5 - 3766617153u > 0xA)
    goto LABEL_19;
  if (((1 << (a5 - 65)) & 0x1CF) != 0)
  {
LABEL_21:
    v23 = 1;
    v24 = 9896;
    goto LABEL_22;
  }
  if (a5 != 3766617163)
  {
LABEL_19:
    if (a5 - 3766617091u <= 0xC)
    {
      if (((1 << (a5 - 3)) & 0x1702) != 0)
        goto LABEL_21;
      if (a5 == 3766617091)
      {
        v23 = 1;
        v24 = 9880;
        goto LABEL_22;
      }
    }
    if (a5)
    {
      v23 = 1;
      v24 = 9872;
    }
    else
    {
      ++self->_roamStatusSucceededCount;
      if (!self->_inMotionStartedTime)
      {
        if ((unint64_t)objc_msgSend(v14, "pingPongNth") >= 3)
        {
          ++self->_roamPingPongAboveThresholdCount;
          self->_roamPingPongAboveThresholdCountLowRssiOnly += objc_msgSend(v14, "pingPongSequenceIsLowRssiOnly");
        }
        self->_roamPingPongLowRssiAndReassocOnly += objc_msgSend(v14, "pingPongSequenceIsReassocOrLowRSSIOnly");
      }
      v23 = objc_msgSend(v14, "pingPongSequenceIsReassocOnly");
      v24 = 9936;
    }
    goto LABEL_22;
  }
  v23 = 1;
  v24 = 9888;
LABEL_22:
  *(Class *)((char *)&self->super.isa + v24) = (Class)(*(char **)((char *)&self->super.isa + v24) + v23);
  objc_msgSend(v13, "objectForKey:", CFSTR("ROAMEDEVENT_FLAGS"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
    self->_roamIsWNMScoreUsedCount += ((unint64_t)objc_msgSend(v25, "unsignedIntegerValue") >> 6) & 1;

LABEL_25:
}

- (void)roamingConfigurationDidChange:(int64_t)a3 withChannelList:(id)a4
{
  -[WiFiUsageBssSession roamingConfigurationDidChange:withChannelList:](self->_currentBssSession, "roamingConfigurationDidChange:withChannelList:", a3, a4);
}

- (void)updateRssiDiffStats:(id *)a3 For:(id)a4
{
  id v6;
  int64_t var3;
  int64_t var0;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  uint64_t var1;
  uint64_t var5;
  char *v15;
  _BYTE *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  _BYTE *v25;
  int v26;
  void *v27;
  _OWORD v28[5];
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v6 = a4;
  var3 = a3->var3;
  var0 = a3->var0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("roamNeighsSmllst%@RssiByBandTransition"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v36 = 0u;
  -[WiFiUsageSession valueForKey:](self, "valueForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "integerByBandTransitionValue");
  }
  else
  {
    v41 = 0;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v36 = 0u;
  }
  v12 = var3 - var0;

  var1 = a3->var1;
  var5 = a3->var5;
  v15 = (char *)&v36 + 3 * var1 + var5;
  v17 = v15[72];
  v16 = v15 + 72;
  if (!v17 || v12 < *((_QWORD *)&v36 + 3 * var1 + var5))
  {
    *((_QWORD *)&v36 + 3 * var1 + var5) = v12;
    *v16 = 1;
    v32 = v38;
    v33 = v39;
    v34 = v40;
    v35 = v41;
    v30 = v36;
    v31 = v37;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valuewithIntegerByBandTransition:", &v30);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiUsageSession setValue:forKey:](self, "setValue:forKey:", v18, v9);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("roamNeighsLrgst%@RssiByBandTransition"), v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v30 = 0u;
  -[WiFiUsageSession valueForKey:](self, "valueForKey:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    objc_msgSend(v20, "integerByBandTransitionValue");
  }
  else
  {
    v35 = 0;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v30 = 0u;
  }

  v22 = a3->var1;
  v23 = a3->var5;
  v24 = (char *)&v30 + 3 * v22 + v23;
  v26 = v24[72];
  v25 = v24 + 72;
  if (!v26 || v12 > *((_QWORD *)&v30 + 3 * v22 + v23))
  {
    *((_QWORD *)&v30 + 3 * v22 + v23) = v12;
    *v25 = 1;
    v28[2] = v32;
    v28[3] = v33;
    v28[4] = v34;
    v29 = v35;
    v28[0] = v30;
    v28[1] = v31;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valuewithIntegerByBandTransition:", v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiUsageSession setValue:forKey:](self, "setValue:forKey:", v27, v19);

  }
}

- (void)roamCandidatesStatsDidUpdate:(id *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t minCandidatesCount;
  unint64_t var6;
  unint64_t v15;
  unint64_t maxCandidatesCount;
  unint64_t v17;
  unint64_t v18;
  uint64_t var4;
  Class *v20;
  char *v21;
  int64_t var0;
  int64_t var3;
  char *v24;
  const __CFString *v25;
  __int128 v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  WiFiUsageBssSession *currentBssSession;
  __int128 v39;
  id v40;
  id v41;
  void *v42;
  _OWORD v43[3];
  id v44;
  id v45;
  BOOL var9;
  _OWORD v47[2];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  char v54;
  char v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  objc_msgSend(a3->var7, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v57 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_roamNeighborsByBand, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          v10 = (void *)objc_opt_new();
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_roamNeighborsByBand, "setObject:forKeyedSubscript:", v10, v9);
        }
        objc_msgSend(a3->var7, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "allObjects");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObjectsFromArray:", v12);

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    }
    while (v6);
  }

  minCandidatesCount = self->_minCandidatesCount;
  if (minCandidatesCount >= a3->var6)
    var6 = a3->var6;
  else
    var6 = self->_minCandidatesCount;
  if (minCandidatesCount)
    v15 = var6;
  else
    v15 = a3->var6;
  self->_minCandidatesCount = v15;
  maxCandidatesCount = self->_maxCandidatesCount;
  if (maxCandidatesCount <= a3->var6)
    v17 = a3->var6;
  else
    v17 = self->_maxCandidatesCount;
  if (maxCandidatesCount)
    v18 = v17;
  else
    v18 = a3->var6;
  self->_maxCandidatesCount = v18;
  if (a3->var2 == a3->var0)
    ++self->_currentRSSIStrongestCount;
  var4 = a3->var4;
  v20 = &self->super.isa + var4;
  v20[1439] = (Class)((char *)v20[1439] + 1);
  v21 = (char *)self + var4;
  v21[11536] = 1;
  v20[1443] = (Class)a3->var2;
  v21[11568] = 1;
  var0 = a3->var0;
  if (a3->var0 >= -94)
  {
    var3 = a3->var3;
    if (var3 >= -94)
    {
      if (var3 <= var0)
        v24 = &v55;
      else
        v24 = &v54;
      if (var3 <= var0)
        v25 = CFSTR("CurrentToNextBest");
      else
        v25 = CFSTR("CurrentToBest");
      v26 = *(_OWORD *)&a3->var2;
      *(_OWORD *)v24 = *(_OWORD *)&a3->var0;
      *((_OWORD *)v24 + 1) = v26;
      *((_OWORD *)v24 + 2) = *(_OWORD *)&a3->var4;
      *((_QWORD *)v24 + 6) = a3->var7;
      *((_QWORD *)v24 + 7) = a3->var8;
      v24[64] = a3->var9;
      -[WiFiUsageSession updateRssiDiffStats:For:](self, "updateRssiDiffStats:For:", v24, v25);
    }
  }
  v52 = 0u;
  v53 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(a3->var7, "allKeys");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v49;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v49 != v29)
          objc_enumerationMutation(v27);
        v31 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
        v32 = objc_msgSend(v31, "unsignedIntegerValue");
        if (v32 <= 3)
        {
          objc_msgSend(a3->var7, "objectForKeyedSubscript:", v31);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *((_QWORD *)&v52 + v32) = objc_msgSend(v33, "count");

          *((_BYTE *)&v53 + v32 + 8) = 1;
        }
      }
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
    }
    while (v28);
  }

  v47[0] = v52;
  v47[1] = v53;
  +[IntegerByBandObj integerByBandWith:withCap:](IntegerByBandObj, "integerByBandWith:withCap:", v47, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 10016;
  if (!a3->var9)
    v35 = 10024;
  v36 = *(id *)((char *)&self->super.isa + v35);
  objc_msgSend(v36, "objectForKeyedSubscript:", v34);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v37)
  {
    v37 = (void *)objc_opt_new();
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v37, v34);
  }
  objc_msgSend(v37, "increment");
  currentBssSession = self->_currentBssSession;
  v39 = *(_OWORD *)&a3->var2;
  v43[0] = *(_OWORD *)&a3->var0;
  v43[1] = v39;
  v43[2] = *(_OWORD *)&a3->var4;
  v40 = a3->var7;
  v44 = v40;
  v41 = a3->var8;
  v45 = v41;
  var9 = a3->var9;
  if (currentBssSession)
  {
    -[WiFiUsageBssSession roamCandidatesStatsDidUpdate:](currentBssSession, "roamCandidatesStatsDidUpdate:", v43);
  }
  else
  {
    v42 = v41;

  }
}

- (void)roamCacheDidUpdate:(id)a3
{
  -[WiFiUsageBssSession roamCacheDidUpdate:](self->_currentBssSession, "roamCacheDidUpdate:", a3);
}

- (void)powerStateDidChange:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSDate *lastPowerStateChangedTime;
  id v7;
  double v8;
  double v9;
  id v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_poweredOn = v3;
  ++self->_powerStateChangedCount;
  lastPowerStateChangedTime = self->_lastPowerStateChangedTime;
  v10 = v5;
  if (v3)
  {
    objc_msgSend(v5, "timeIntervalSinceDate:", lastPowerStateChangedTime);
    v7 = v10;
    if (v8 < 5.0)
      ++self->_powerToggleEventCount;
  }
  else
  {
    v7 = v5;
    if (lastPowerStateChangedTime)
    {
      objc_msgSend(v5, "timeIntervalSinceDate:");
      v7 = v10;
      self->_poweredOnDuration = v9 + self->_poweredOnDuration;
    }
  }
  -[WiFiUsageSession setLastPowerStateChangedTime:](self, "setLastPowerStateChangedTime:", v7);

}

- (void)controlCenterStateDidChange:(BOOL)a3 withKnownLocation:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;
  double v8;
  double v9;
  id v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  self->_controlCenterEnabled = v4;
  ++self->_controlCenterStateChangedCount;
  v10 = v6;
  if (v4)
  {
    objc_msgSend(v6, "timeIntervalSinceDate:", self->_lastControlCenterStateChangedTime);
    if (v8 < 5.0)
      ++self->_controlCenterToggleEventCount;
    v7 = v10;
    if (self->_lastControlCenterStateChangedTime)
    {
      objc_msgSend(v10, "timeIntervalSinceDate:");
      v7 = v10;
      self->_inControlCenterAutoJoinDisabledDuration = v9 + self->_inControlCenterAutoJoinDisabledDuration;
    }
  }
  -[WiFiUsageSession setLastControlCenterStateChangedTime:](self, "setLastControlCenterStateChangedTime:", v7);

}

- (void)cellularDataStatusDidChange:(id)a3 inAirplaneMode:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  if (self->_airplaneModeEnabled != a4)
    ++self->_airplaneModeStateChangedCount;
  v6 = a3;
  -[WiFiUsageSession setAirplaneModeEnabled:](self, "setAirplaneModeEnabled:", v4);
  -[WiFiUsageSession setCellularDataStatus:](self, "setCellularDataStatus:", v6);

}

- (void)cellularFallbackStateDidChange:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  double v7;
  id v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  self->_cellularFallbackEnabled = v3;
  ++self->_cellularFallbackStateChangedCount;
  v8 = v5;
  if (!v3 && self->_lastCellularFallbackStateChangedTime)
  {
    objc_msgSend(v5, "timeIntervalSinceDate:");
    v6 = v8;
    self->_inCellularFallbackDuration = v7 + self->_inCellularFallbackDuration;
  }
  -[WiFiUsageSession setLastCellularFallbackStateChangedTime:](self, "setLastCellularFallbackStateChangedTime:", v6);
  -[WiFiUsageBssSession cellularFallbackStateDidChange:](self->_currentBssSession, "cellularFallbackStateDidChange:", v3);

}

- (void)cellularOutrankingStateDidChange:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  double v7;
  id v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  self->_cellularOutrankingEnabled = v3;
  v8 = v5;
  if (!v3)
  {
    ++self->_cellularOutrankingStateChangedCount;
    if (self->_lastCellularOutrankingStateChangedTime)
    {
      objc_msgSend(v5, "timeIntervalSinceDate:");
      v6 = v8;
      self->_inCellularOutrankingDuration = v7 + self->_inCellularOutrankingDuration;
    }
  }
  -[WiFiUsageSession setLastCellularOutrankingStateChangedTime:](self, "setLastCellularOutrankingStateChangedTime:", v6);
  -[WiFiUsageBssSession cellularOutrankingStateDidChange:](self->_currentBssSession, "cellularOutrankingStateDidChange:", v3);

}

- (void)faultEventDetected:(unint64_t)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (a3 - 1 <= 0x20)
    ++self->_faultReasonCount[a3];
  if (a3 == 7)
  {
LABEL_6:
    -[WiFiUsageSession setLastChipResetTime:](self, "setLastChipResetTime:", v5);
    if (self->_driverAvailabilityLifespan == 0.0)
    {
      objc_msgSend(v5, "timeIntervalSinceDate:", self->_lastDriverAvailableTime);
      -[WiFiUsageSession setDriverAvailabilityLifespan:](self, "setDriverAvailabilityLifespan:");
    }
    goto LABEL_10;
  }
  if (a3 != 24)
  {
    if (a3 != 21)
      goto LABEL_10;
    goto LABEL_6;
  }
  -[WiFiUsageSession setLastDriverTerminationTime:](self, "setLastDriverTerminationTime:", v5);
  if (self->_driverProcessLifespan == 0.0)
  {
    objc_msgSend(v5, "timeIntervalSinceDate:", self->_lastDriverAvailableTime);
    -[WiFiUsageSession setDriverProcessLifespan:](self, "setDriverProcessLifespan:");
  }
LABEL_10:
  -[WiFiUsageBssSession faultEventDetected:](self->_currentBssSession, "faultEventDetected:", a3);

}

- (void)triggerDisconnectAlerted:(BOOL)a3 confirmed:(BOOL)a4 executed:(BOOL)a5
{
  if (!a3)
  {
    if (!a4)
      goto LABEL_3;
LABEL_7:
    ++self->_triggerDisconnectConfirmedCount;
    if (!a5)
      goto LABEL_5;
    goto LABEL_4;
  }
  ++self->_triggerDisconnectAlertedCount;
  if (a4)
    goto LABEL_7;
LABEL_3:
  if (a5)
LABEL_4:
    ++self->_triggerDisconnectExecutedCount;
LABEL_5:
  -[WiFiUsageBssSession triggerDisconnectAlerted:confirmed:executed:](self->_currentBssSession, "triggerDisconnectAlerted:confirmed:executed:");
}

- (void)tdLogic_alertedBy:(int)a3
{
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  WiFiUsageSession *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!self->_isInTDEval)
  {
    ++self->_tdEvalStartedCount;
    +[WiFiUsagePrivacyFilter getLabelForTDTrigger:](WiFiUsagePrivacyFilter, "getLabelForTDTrigger:", *(_QWORD *)&a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[WiFiUsageSession incrementCountWithPrefix:name:](self, "incrementCountWithPrefix:name:", CFSTR("tdEvalStartedBy"), v4)&& os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = "-[WiFiUsageSession tdLogic_alertedBy:]";
      v7 = 2112;
      v8 = v4;
      v9 = 2112;
      v10 = self;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - tdEval started by %@ but no counter for this trigger in %@", (uint8_t *)&v5, 0x20u);
    }
    -[WiFiUsageSession setIsInTDEval:](self, "setIsInTDEval:", 1);

  }
}

- (void)tdLogic_end:(int)a3 evalTime:(double)a4 rssi:(int64_t)a5 roamTime:(double)a6
{
  void *v9;
  void *v10;
  id v11;

  +[WiFiUsagePrivacyFilter getLabelForTDTrigger:](WiFiUsagePrivacyFilter, "getLabelForTDTrigger:", *(_QWORD *)&a3, a4, a6);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%s: TDEval ended upon %@ (evalTime:%@s, rssi:%@)"), "-[WiFiUsageSession tdLogic_end:evalTime:rssi:roamTime:]", v11, v9, v10);

  -[WiFiUsageSession setIsInTDEval:](self, "setIsInTDEval:", 0);
  ++self->_tdEvalEndedCount;
  self->_tdEvalCumulativeDuration = self->_tdEvalCumulativeDuration + a4;

}

- (BOOL)incrementCountWithPrefix:(id)a3 name:(id)a4
{
  __CFString *v6;
  id v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;

  v6 = (__CFString *)a3;
  v7 = a4;
  if (v7)
  {
    v8 = &stru_1E881F240;
    if (v6)
      v8 = v6;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@Count"), v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiUsageSession valueForKey:](self, "valueForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = objc_msgSend(v10, "unsignedIntegerValue");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11 + 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageSession setValue:forKey:](self, "setValue:forKey:", v12, v9);

    }
    v13 = 1;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)countWithPrefix:(id)a3 name:(id)a4
{
  __CFString *v6;
  id v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = (__CFString *)a3;
  v7 = a4;
  if (v7)
  {
    v8 = &stru_1E881F240;
    if (v6)
      v8 = v6;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@Count"), v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiUsageSession valueForKey:](self, "valueForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)poorLinkSessionStats:(id)a3
{
  id v4;
  id v5;
  double v6;
  unint64_t v7;
  unint64_t current_subsequentTdAfterJoinAfterTDCount;
  void *v9;
  BOOL v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  WiFiUsageSession *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    ++self->_inPoorLinkSessionCount;
    objc_msgSend(v5, "sessionDuration");
    self->_inPoorLinkSessionDuration = v6 + self->_inPoorLinkSessionDuration;
    if (self->_lastJoinWhileDeferForTD && objc_msgSend(v5, "tdExecuted"))
    {
      ++self->_tdAfterJoinAfterTDCount;
      v7 = self->_current_subsequentTdAfterJoinAfterTDCount + 1;
      self->_current_subsequentTdAfterJoinAfterTDCount = v7;
      if (self->_max_subsequentTdAfterJoinAfterTDCount < v7)
        self->_max_subsequentTdAfterJoinAfterTDCount = v7;
    }
    else
    {
      current_subsequentTdAfterJoinAfterTDCount = self->_current_subsequentTdAfterJoinAfterTDCount;
      if (current_subsequentTdAfterJoinAfterTDCount)
      {
        if (self->_min_subsequentTdAfterJoinAfterTDCount > current_subsequentTdAfterJoinAfterTDCount)
          self->_min_subsequentTdAfterJoinAfterTDCount = current_subsequentTdAfterJoinAfterTDCount;
        self->_current_subsequentTdAfterJoinAfterTDCount = 0;
      }
    }
    +[WiFiUsagePoorLinkSession sessionStartedBy:](WiFiUsagePoorLinkSession, "sessionStartedBy:", objc_msgSend(v5, "sessionStartedBy"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[WiFiUsageSession incrementCountWithPrefix:name:](self, "incrementCountWithPrefix:name:", CFSTR("tdSessionStartedBy"), v9);

    if (!v10 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      +[WiFiUsagePoorLinkSession sessionStartedBy:](WiFiUsagePoorLinkSession, "sessionStartedBy:", objc_msgSend(v5, "sessionStartedBy"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136315906;
      v13 = "-[WiFiUsageSession poorLinkSessionStats:]";
      v14 = 2112;
      v15 = v11;
      v16 = 1024;
      v17 = objc_msgSend(v5, "sessionStartedBy");
      v18 = 2112;
      v19 = self;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - tdSession started by %@ (%u) but no counter for this trigger in %@", (uint8_t *)&v12, 0x26u);

    }
    self->_lastJoinWhileDeferForTD = objc_msgSend(v5, "nextJoinWhileDeferJoin");

  }
}

- (void)rangingCompleted
{
  ++self->_rangingEventCount;
}

- (void)summarizeSession
{
  NSDate *v3;
  NSDate *sessionEndTime;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  WiFiUsageNetworkDetails *networkDetails;
  void *v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  NSObject *v35;
  id v36;
  unint64_t compatibilityModeChangeCount;
  void *v38;
  NSDate *lastNetwork6eDisableModeChangedTime;
  double v40;
  NSObject *v41;
  id v42;
  double inNetwork6eModeOffDuration;
  NSDate *v44;
  double sessionDuration;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  NSObject *v49;
  id v50;
  NSDate *v51;
  double v52;
  int v53;
  const char *v54;
  __int16 v55;
  WiFiUsageSession *v56;
  __int16 v57;
  double v58;
  __int16 v59;
  NSDate *v60;
  __int16 v61;
  double v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  if (self->_sessionStartTime)
  {
    sessionEndTime = self->_sessionEndTime;
    if (!sessionEndTime)
      sessionEndTime = v3;
    -[NSDate timeIntervalSinceDate:](sessionEndTime, "timeIntervalSinceDate:");
    self->_sessionDuration = v5;
  }
  if (self->_mediaStartedTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_mediaPlaybackDuration = v6 + self->_mediaPlaybackDuration;
  }
  if (self->_chargingStartedTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_chargingDuration = v7 + self->_chargingDuration;
  }
  if (self->_companionConnectionTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_companionConnectedDuration = v8 + self->_companionConnectedDuration;
  }
  if (self->_wowStateEntryTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inWowStateDuration = v9 + self->_inWowStateDuration;
  }
  if (self->_lpasStateEntryTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inLpasStateDuration = v10 + self->_inLpasStateDuration;
  }
  if (self->_lowPowerStateEntryTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inLowPowerStateDuration = v11 + self->_inLowPowerStateDuration;
  }
  if (self->_batterySaverStateEntryTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inBatterySaverStateDuration = v12 + self->_inBatterySaverStateDuration;
  }
  if (self->_callStartedTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inCallDuration = v13 + self->_inCallDuration;
  }
  if (self->_inVehicleEntryTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inVehicleDuration = v14 + self->_inVehicleDuration;
  }
  if (self->_inMotionStartedTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inMotionDuration = v15 + self->_inMotionDuration;
  }
  if (self->_a2dpActiveTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inA2dpDuration = v16 + self->_inA2dpDuration;
  }
  if (self->_scoActiveTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inScoDuration = v17 + self->_inScoDuration;
  }
  if (self->_hidPresentTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inHidPresentDuration = v18 + self->_inHidPresentDuration;
  }
  if (self->_awdlActiveTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inAwdlDuration = v19 + self->_inAwdlDuration;
  }
  if (self->_roamingActiveTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inRoamDuration = v20 + self->_inRoamDuration;
  }
  if (self->_lastRoamSuppressionToggled && self->_isRoamSuppressionEnabled)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inRoamSuppressionEnabled = v21 + self->_inRoamSuppressionEnabled;
  }
  if (self->_scanningActiveTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inScanDuration = v22 + self->_inScanDuration;
  }
  if (self->_softApActiveTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_inSoftApDuration = v23 + self->_inSoftApDuration;
  }
  if (self->_lastSystemWakeTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_systemAwakeDuration = v24 + self->_systemAwakeDuration;
    -[WiFiUsageSession setLastSystemWakeTime:](self, "setLastSystemWakeTime:", v3);
  }
  if (self->_poweredOn)
  {
    if (self->_lastPowerStateChangedTime)
    {
      -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
      self->_poweredOnDuration = v25 + self->_poweredOnDuration;
    }
    -[WiFiUsageSession setLastPowerStateChangedTime:](self, "setLastPowerStateChangedTime:", v3);
  }
  if (self->_linkRecoveryDisabledTime)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
    self->_linkRecoveryDisabledDuration = v26 + self->_linkRecoveryDisabledDuration;
  }
  -[WiFiUsageSession tallyAssociatedDuration:](self, "tallyAssociatedDuration:", v3);
  if (self->_lastBssChangedTime)
  {
    networkDetails = self->_networkDetails;
    if (networkDetails)
    {
      -[WiFiUsageNetworkDetails connectedBss](networkDetails, "connectedBss");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageSession updateBandUsageFor:With:](self, "updateBandUsageFor:With:", objc_msgSend(v28, "band"), v3);

    }
    -[WiFiUsageSession setLastBssChangedTime:](self, "setLastBssChangedTime:", v3);
  }
  if (self->_cellularFallbackEnabled)
  {
    if (self->_lastCellularFallbackStateChangedTime)
    {
      -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
      self->_inCellularFallbackDuration = v29 + self->_inCellularFallbackDuration;
    }
    -[WiFiUsageSession setLastCellularFallbackStateChangedTime:](self, "setLastCellularFallbackStateChangedTime:", v3);
  }
  if (self->_cellularOutrankingEnabled)
  {
    if (self->_lastCellularOutrankingStateChangedTime)
    {
      -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
      self->_inCellularOutrankingDuration = v30 + self->_inCellularOutrankingDuration;
    }
    -[WiFiUsageSession setLastCellularOutrankingStateChangedTime:](self, "setLastCellularOutrankingStateChangedTime:", v3);
  }
  if (!self->_controlCenterEnabled)
  {
    if (self->_lastControlCenterStateChangedTime)
    {
      -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
      self->_inControlCenterAutoJoinDisabledDuration = v31 + self->_inControlCenterAutoJoinDisabledDuration;
    }
    -[WiFiUsageSession setLastControlCenterStateChangedTime:](self, "setLastControlCenterStateChangedTime:", v3);
  }
  +[WiFiUsageInterfaceStats statsForInterfaceName:](WiFiUsageInterfaceStats, "statsForInterfaceName:", self->_interfaceName);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[WiFiUsageInterfaceStats statsForInterfaceName:](WiFiUsageInterfaceStats, "statsForInterfaceName:", self->_secondaryInterfaceName);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageSession setNetInterfaceTxBytes:](self, "setNetInterfaceTxBytes:", objc_msgSend(v32, "txBytes") - -[WiFiUsageInterfaceStats txBytes](self->_ifStatsAtStart, "txBytes"));
  -[WiFiUsageSession setNetInterfaceRxBytes:](self, "setNetInterfaceRxBytes:", objc_msgSend(v32, "rxBytes") - -[WiFiUsageInterfaceStats rxBytes](self->_ifStatsAtStart, "rxBytes"));
  -[WiFiUsageSession setSecondaryInterfaceTxBytes:](self, "setSecondaryInterfaceTxBytes:", objc_msgSend(v33, "txBytes") - -[WiFiUsageInterfaceStats txBytes](self->_secondaryIfStatsAtStart, "txBytes"));
  -[WiFiUsageSession setSecondaryInterfaceRxBytes:](self, "setSecondaryInterfaceRxBytes:", objc_msgSend(v33, "rxBytes") - -[WiFiUsageInterfaceStats rxBytes](self->_secondaryIfStatsAtStart, "rxBytes"));
  if (-[NSDate isEqualToDate:](self->_lastPowerBudgetChangedTime, "isEqualToDate:", self->_sessionStartTime))
    -[WiFiUsageSession powerBudgetDidChange:andThermalIndex:](self, "powerBudgetDidChange:andThermalIndex:", self->_lastPowerBudget, self->_lastThermalIndex);
  if (self->_isCompatibilityModeEnabled)
  {
    -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:", self->_lastCompatibilityModeChangedTime);
    self->_inCompatibilityModeEnabledDuration = v34 + self->_inCompatibilityModeEnabledDuration;
    v35 = MEMORY[0x1E0C81028];
    v36 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      compatibilityModeChangeCount = self->_compatibilityModeChangeCount;
      v53 = 136315394;
      v54 = "-[WiFiUsageSession summarizeSession]";
      v55 = 2048;
      v56 = (WiFiUsageSession *)compatibilityModeChangeCount;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - _compatibilityModeChangeCount:%lu", (uint8_t *)&v53, 0x16u);
    }

  }
  -[WiFiUsageNetworkDetails disable6eMode](self->_networkDetails, "disable6eMode");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v38, "isEqualToString:", CFSTR("off")))
  {
    lastNetwork6eDisableModeChangedTime = self->_lastNetwork6eDisableModeChangedTime;

    if (lastNetwork6eDisableModeChangedTime)
    {
      -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:", self->_lastNetwork6eDisableModeChangedTime);
      self->_inNetwork6eModeOffDuration = v40 + self->_inNetwork6eModeOffDuration;
    }
  }
  else
  {

  }
  v41 = MEMORY[0x1E0C81028];
  v42 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    inNetwork6eModeOffDuration = self->_inNetwork6eModeOffDuration;
    v44 = self->_lastNetwork6eDisableModeChangedTime;
    sessionDuration = self->_sessionDuration;
    v53 = 136316162;
    v54 = "-[WiFiUsageSession summarizeSession]";
    v55 = 2112;
    v56 = self;
    v57 = 2048;
    v58 = inNetwork6eModeOffDuration;
    v59 = 2112;
    v60 = v44;
    v61 = 2048;
    v62 = sessionDuration;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s on %@ - _inNetwork6eModeOffDuration:%fs (lastNetwork6eDisableModedChangedTime:%@ sessionDuration:%fs)", (uint8_t *)&v53, 0x34u);
  }

  if (-[WiFiUsageSession useSavedJoinStats](self, "useSavedJoinStats") && self->_savedLastJoinReason != -1)
  {
    -[WiFiUsageSession setJoinStateChangedCount:](self, "setJoinStateChangedCount:", self->_savedJoinStateChangedCount);
    -[WiFiUsageSession setLastJoinReason:](self, "setLastJoinReason:", self->_savedLastJoinReason);
    -[WiFiUsageSession setLastJoinFailure:](self, "setLastJoinFailure:", self->_savedLastJoinFailure);
    -[WiFiUsageSession setPreviousDisconnectReason:](self, "setPreviousDisconnectReason:", self->_savedPreviousDisconnectReason);
    -[WiFiUsageSession setInCoexRealTimeAtLastJoin:](self, "setInCoexRealTimeAtLastJoin:", self->_savedInCoexRealTimeAtLastJoin);
    -[WiFiUsageSession setPrevJoinReason:](self, "setPrevJoinReason:", self->_savedPrevJoinReason);
    -[WiFiUsageSession setTimeSincePrevJoin:](self, "setTimeSincePrevJoin:", self->_savedTimeSincePrevJoin);
    v46 = *(_OWORD *)&self->_savedJoinReasonCount[10];
    *(_OWORD *)&self->_joinReasonCount[8] = *(_OWORD *)&self->_savedJoinReasonCount[8];
    *(_OWORD *)&self->_joinReasonCount[10] = v46;
    *(_OWORD *)&self->_joinReasonCount[12] = *(_OWORD *)&self->_savedJoinReasonCount[12];
    self->_joinReasonCount[14] = self->_savedJoinReasonCount[14];
    v47 = *(_OWORD *)&self->_savedJoinReasonCount[2];
    *(_OWORD *)self->_joinReasonCount = *(_OWORD *)self->_savedJoinReasonCount;
    *(_OWORD *)&self->_joinReasonCount[2] = v47;
    v48 = *(_OWORD *)&self->_savedJoinReasonCount[6];
    *(_OWORD *)&self->_joinReasonCount[4] = *(_OWORD *)&self->_savedJoinReasonCount[4];
    *(_OWORD *)&self->_joinReasonCount[6] = v48;
    v49 = v41;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)objc_opt_class(), "joinReasonString:", self->_lastJoinReason);
      v50 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "joinReasonString:", self->_savedLastJoinReason);
      v51 = (NSDate *)(id)objc_claimAutoreleasedReturnValue();
      v53 = 136315906;
      v54 = "-[WiFiUsageSession summarizeSession]";
      v55 = 2112;
      v56 = self;
      v57 = 2112;
      v58 = *(double *)&v50;
      v59 = 2112;
      v60 = v51;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s on %@ _lastJoinReason:%@ _savedLastJoinReason:%@", (uint8_t *)&v53, 0x2Au);

    }
  }
  if (self->_anyUsbDeviceConnected)
    -[WiFiUsageSession updateUsbInsertedDuration:](self, "updateUsbInsertedDuration:", self->_sessionEndTime);
  if (self->_lastAWDLSequenceUpdate)
  {
    -[WiFiUsageSession tallyInfraScoreDuration:until:](self, "tallyInfraScoreDuration:until:", self->_inAWDL_lastInfraScore, v3);
    -[WiFiUsageSession tallyP2PScoreDuration:until:](self, "tallyP2PScoreDuration:until:", v3, self->_inAWDL_lastP2PScore);
    objc_storeStrong((id *)&self->_lastAWDLSequenceUpdate, v3);
  }
  if (self->_lastLinkStateChangedTime)
  {
    if (!self->_isAssociated)
    {
      -[NSDate timeIntervalSinceDate:](v3, "timeIntervalSinceDate:");
      if (v52 > self->_longestUnassociatedDuration)
        self->_longestUnassociatedDuration = v52;
    }
  }

}

- (void)summarizeBandUsage
{
  NSDate *v3;
  NSDate *sessionEndTime;
  double v5;
  WiFiUsageNetworkDetails *networkDetails;
  void *v7;
  NSDate *v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  v8 = v3;
  if (self->_sessionStartTime)
  {
    sessionEndTime = self->_sessionEndTime;
    if (!sessionEndTime)
      sessionEndTime = v3;
    -[NSDate timeIntervalSinceDate:](sessionEndTime, "timeIntervalSinceDate:");
    self->_sessionDuration = v5;
    v3 = v8;
  }
  if (self->_lastBssChangedTime)
  {
    networkDetails = self->_networkDetails;
    if (networkDetails)
    {
      -[WiFiUsageNetworkDetails connectedBss](networkDetails, "connectedBss");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageSession updateBandUsageFor:With:](self, "updateBandUsageFor:With:", objc_msgSend(v7, "band"), v8);

      v3 = v8;
    }
    -[WiFiUsageSession setLastBssChangedTime:](self, "setLastBssChangedTime:", v3);
    v3 = v8;
  }

}

- (void)sessionDidEnd
{
  void *v3;
  double v4;
  _QWORD *v5;
  NSObject *v6;
  _QWORD *v7;
  _QWORD block[4];
  id v9;

  if (self->_isSessionActive)
  {
    -[WiFiUsageSession setIsSessionActive:](self, "setIsSessionActive:", 0);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiUsageSession setSessionEndTime:](self, "setSessionEndTime:", v3);

    if (self->_sessionStartTime)
    {
      -[NSDate timeIntervalSinceDate:](self->_sessionEndTime, "timeIntervalSinceDate:");
      self->_sessionDuration = v4;
    }
    if (self->_completionHandler)
    {
      if (self->_completionQueue)
      {
        v5 = (_QWORD *)-[WiFiUsageSession copy](self, "copy");
        objc_msgSend(v5, "summarizeBandUsage");
        v6 = v5[1434];
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __33__WiFiUsageSession_sessionDidEnd__block_invoke;
        block[3] = &unk_1E881C8E8;
        v9 = v5;
        v7 = v5;
        dispatch_async(v6, block);

      }
    }
  }
}

uint64_t __33__WiFiUsageSession_sessionDidEnd__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 11456) + 16))();
}

- (id)sessionName
{
  unint64_t type;

  type = self->_type;
  if (type > 0xA)
    return CFSTR("Unknown");
  else
    return off_1E881E370[type];
}

+ (id)joinReasonString:(unint64_t)a3
{
  if (a3 + 1 < 0x10)
    return off_1E881E3C8[a3 + 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown=%u"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)disconnectReasonString:(unint64_t)a3
{
  __CFString *v3;
  id result;

  switch(a3)
  {
    case 0x3E8uLL:
      v3 = CFSTR("TriggerDisconnect");
LABEL_3:
      result = v3;
      break;
    case 0x3E9uLL:
      result = CFSTR("Application");
      break;
    case 0x3EAuLL:
      result = CFSTR("TemporarilyDisabled");
      break;
    case 0x3EBuLL:
      result = CFSTR("PreferenceChanged");
      break;
    case 0x3ECuLL:
      result = CFSTR("DecryptFailure");
      break;
    case 0x3EDuLL:
      result = CFSTR("NotPrimary");
      break;
    case 0x3EEuLL:
      result = CFSTR("Thermal");
      break;
    case 0x3EFuLL:
      result = CFSTR("InternetSharing");
      break;
    case 0x3F0uLL:
      result = CFSTR("Settings");
      break;
    case 0x3F1uLL:
      result = CFSTR("Misc");
      break;
    case 0x3F2uLL:
      result = CFSTR("EapRestart");
      break;
    case 0x3F3uLL:
      result = CFSTR("ControlCenter");
      break;
    case 0x3F4uLL:
      result = CFSTR("EapFailure");
      break;
    case 0x3F5uLL:
      result = CFSTR("Transition");
      break;
    case 0x3F6uLL:
      result = CFSTR("AutoUnlock");
      break;
    case 0x3F7uLL:
      result = CFSTR("Captive");
      break;
    case 0x3F8uLL:
      result = CFSTR("UserNotification");
      break;
    case 0x3F9uLL:
      result = CFSTR("BssSteering");
      break;
    case 0x3FAuLL:
      result = CFSTR("HotspotAssociation");
      break;
    case 0x3FBuLL:
      result = CFSTR("HotspotTransition");
      break;
    case 0x3FCuLL:
      result = CFSTR("BssChanged");
      break;
    case 0x3FDuLL:
      result = CFSTR("CarPlayDisabled");
      break;
    case 0x3FEuLL:
      result = CFSTR("BatterySaverMode");
      break;
    case 0x3FFuLL:
      result = CFSTR("AirPlay");
      break;
    case 0x400uLL:
      result = CFSTR("6EEnabled");
      break;
    case 0x401uLL:
      result = CFSTR("6EDisabled");
      break;
    case 0x402uLL:
      result = CFSTR("ColocatedUserJoin");
      break;
    case 0x403uLL:
      result = CFSTR("InfraRelayDisconnect");
      break;
    case 0x404uLL:
      result = CFSTR("P2PRealTimeInitiated");
      break;
    case 0x405uLL:
      result = CFSTR("SleepOnCaptive");
      break;
    case 0x406uLL:
      result = CFSTR("ShortLease");
      break;
    case 0x407uLL:
      result = CFSTR("AutoJoinDisabled");
      break;
    case 0x408uLL:
      result = CFSTR("SleepDenylisted");
      break;
    case 0x409uLL:
      result = CFSTR("UnspecifiedClientDisconnect");
      break;
    default:
      v3 = CFSTR("Uninitialized");
      switch(a3)
      {
        case 0xFFFFFFFFFFFFFFFFLL:
          goto LABEL_3;
        case 0uLL:
          result = CFSTR("None");
          break;
        case 1uLL:
          result = CFSTR("Deauth");
          break;
        case 2uLL:
          result = CFSTR("BeaconLoss");
          break;
        case 3uLL:
          result = CFSTR("Internal");
          break;
        case 4uLL:
          result = CFSTR("SystemSleep");
          break;
        case 5uLL:
          result = CFSTR("PoweredOff");
          break;
        case 6uLL:
          result = CFSTR("JoinFailure");
          break;
        case 7uLL:
          result = CFSTR("ColocatedNetworkTransition");
          break;
        default:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown=%u"), a3);
          v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_3;
      }
      break;
  }
  return result;
}

- (id)eventDictionary:(BOOL)a3
{
  _BOOL8 v3;
  BOOL *p_isSessionActive;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
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
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _BOOL8 v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  double inRoamSuppressionWaitForRoamStart;
  void *v99;
  double inRoamSuppressionWaitForRoamEnd;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  double sessionDuration;
  __int128 v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  unint64_t roamReasonLowRssiCount;
  void *v245;
  __int128 v246;
  void *v247;
  __int128 v248;
  void *v249;
  __int128 v250;
  __int128 v251;
  void *v252;
  __int128 v253;
  __int128 v254;
  void *v255;
  __int128 v256;
  __int128 v257;
  void *v258;
  __int128 v259;
  __int128 v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  double v276;
  void *v277;
  void *v278;
  double v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  void *v313;
  void *v314;
  void *v315;
  void *v316;
  void *v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  void *v324;
  void *v325;
  void *v326;
  void *v327;
  void *v328;
  void *v329;
  void *v330;
  void *v331;
  double inAWDL_BestP2PScore;
  void *v333;
  double inAWDL_WorstP2PScore;
  void *v335;
  void *v336;
  void *v337;
  void *v338;
  void *v339;
  double inAWDL_BestInfraScoreDuration;
  void *v341;
  double inAWDL_WorstInfraScoreDuration;
  void *v343;
  double inAWDL_BestP2PScoreDuration;
  void *v345;
  double inAWDL_WorstP2PScoreDuration;
  void *v347;
  void *v348;
  void *v349;
  void *v350;
  void *v351;
  void *v352;
  void *v353;
  void *v354;
  void *v355;
  WiFiUsageInterfaceCapabilities *capabilities;
  WiFiUsageInterfaceCapabilities *v357;
  WiFiUsageInterfaceCapabilities *v358;
  void *v359;
  WiFiUsageSessionLQM *lqm;
  void *v361;
  WiFiUsageNetworkDetails *networkDetails;
  void *v363;
  void *v364;
  void *v365;
  void *v366;
  void *v367;
  void *v368;
  void *v369;
  void *v370;
  void *v371;
  void *v372;
  void *v373;
  void *v374;
  void *v375;
  void *v376;
  void *v377;
  void *v378;
  void *v379;
  void *v380;
  void *v381;
  void *v382;
  void *v383;
  uint64_t v385;
  _BYTE v386[32];
  __int128 v387;
  __int128 v388;
  __int128 v389;
  __int128 v390;
  __int128 v391;
  uint64_t v392;

  v3 = a3;
  p_isSessionActive = &self->_isSessionActive;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageSession sessionName](self, "sessionName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("SessionName"));

  +[WiFiUsagePrivacyFilter numberWithDuration:](WiFiUsagePrivacyFilter, "numberWithDuration:", self->_sessionDuration);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("SessionDuration"));

  +[WiFiUsagePrivacyFilter getBinTimeInterval:As:](WiFiUsagePrivacyFilter, "getBinTimeInterval:As:", 1, self->_sessionDuration);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("SessionDurationAsString"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_sessionPid);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("SessionPid"));

  +[WiFiUsagePrivacyFilter numberWithDuration:](WiFiUsagePrivacyFilter, "numberWithDuration:", self->_sessionTimeSinceLastSession);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("SessionTimeSinceLastSession"));

  objc_msgSend(v6, "setObject:forKeyedSubscript:", self->_interfaceName, CFSTR("SessionInterfaceName"));
  +[WiFiUsagePrivacyFilter timeSinceBootInSeconds](WiFiUsagePrivacyFilter, "timeSinceBootInSeconds");
  +[WiFiUsagePrivacyFilter numberWithDuration:](WiFiUsagePrivacyFilter, "numberWithDuration:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("SessionDeviceUptime"));

  if (v3)
  {
    if (-[WiFiUsageSession type](self, "type") != 5)
      goto LABEL_10;
  }
  else
  {
    if (*p_isSessionActive)
      v13 = CFSTR("Y");
    else
      v13 = CFSTR("N");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("SessionIsActive"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", self->_secondaryInterfaceName, CFSTR("SessionSecondaryInterfaceName"));
    +[WiFiUsagePrivacyFilter localTimestamp:](WiFiUsagePrivacyFilter, "localTimestamp:", self->_sessionStartTime);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("SessionStartTimestamp"));

  }
  -[WiFiUsageSession activeApplications](self, "activeApplications");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    -[WiFiUsageSession activeApplications](self, "activeApplications");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lastObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, CFSTR("ApplicationBundleId"));

  }
LABEL_10:
  +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:", -[WiFiUsageSession bandAtSessionStart](self, "bandAtSessionStart"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("NetworkBssBandAtSessionStart"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WiFiUsageSession isAssociatedAtSessionStart](self, "isAssociatedAtSessionStart"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, CFSTR("isAssociatedAtSessionStart"));

  +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:](WiFiUsageLQMTransformations, "numberForKeyPath:ofObject:", CFSTR("rssiAtSessionStart"), self);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v22, CFSTR("RssiAtSessionStart"));

  +[WiFiUsagePrivacyFilter numberWithByteCount:](WiFiUsagePrivacyFilter, "numberWithByteCount:", self->_netInterfaceTxBytes);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v23, CFSTR("NetIfWiFiTxBytes"));

  +[WiFiUsagePrivacyFilter numberWithByteCount:](WiFiUsagePrivacyFilter, "numberWithByteCount:", self->_netInterfaceRxBytes);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, CFSTR("NetIfWiFiRxBytes"));

  +[WiFiUsagePrivacyFilter numberWithByteCount:](WiFiUsagePrivacyFilter, "numberWithByteCount:", self->_secondaryInterfaceTxBytes);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v25, CFSTR("NetIfSecondaryTxBytes"));

  +[WiFiUsagePrivacyFilter numberWithByteCount:](WiFiUsagePrivacyFilter, "numberWithByteCount:", self->_secondaryInterfaceRxBytes);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v26, CFSTR("NetIfSecondaryRxBytes"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_systemWakeStateChangedCount);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v27, CFSTR("SystemWakeStateChangedCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_systemWokenByWiFiCount);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v28, CFSTR("SystemWokenByWiFiCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_lockStateChangedCount);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v29, CFSTR("SystemLockStateChangedCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_displayStateChangedCount);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v30, CFSTR("SystemDisplayStateChangedCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_applicationStateChangedCount);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v31, CFSTR("SystemApplicationStateChangedCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_mediaPlaybackEventCount);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v32, CFSTR("SystemMediaPlaybackCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_chargingEventCount);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v33, CFSTR("SystemChargingCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_inCallEventCount);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v34, CFSTR("SystemInCallCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_inVehicleEventCount);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v35, CFSTR("SystemInVehicleCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_inMotionEventCount);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v36, CFSTR("SystemInMotionCount"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_mediaPlaybackDuration, self->_sessionDuration);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v37, CFSTR("SystemMediaPlaybackDuration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_chargingDuration, self->_sessionDuration);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v38, CFSTR("SystemChargingDuration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inCallDuration, self->_sessionDuration);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v39, CFSTR("SystemInCallDuration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inWalkingDuration, self->_sessionDuration);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v40, CFSTR("SystemInWalkingDuration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inVehicleDuration, self->_sessionDuration);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v41, CFSTR("SystemInVehicleDuration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inMotionDuration, self->_sessionDuration);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v42, CFSTR("SystemInMotionDuration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_systemAwakeDuration, self->_sessionDuration);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v43, CFSTR("SystemAwakeDuration"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_companionConnectionStateChangedCount);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v44, CFSTR("SystemCompanionConnectionStateChangedCount"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_companionConnectedDuration, self->_sessionDuration);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v45, CFSTR("SystemCompanionConnectedStateDuration"));

  objc_msgSend(v6, "setObject:forKeyedSubscript:", self->_lastSmartCoverState, CFSTR("SystemSmartCoverLastState"));
  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_smartCoverStateChangedCount);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v46, CFSTR("SystemSmartCoverStateChangedCount"));

  v47 = p_isSessionActive[4] && p_isSessionActive[5];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v48, CFSTR("SystemIsUserInteractive"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", p_isSessionActive[6]);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v49, CFSTR("SystemIsInHomeScreen"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_powerBudgetMaxDuration, self->_sessionDuration);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v50, CFSTR("SystemPowerBudgetMaxDuration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_powerBudget90Duration, self->_sessionDuration);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v51, CFSTR("SystemPowerBudget90Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_powerBudget80Duration, self->_sessionDuration);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v52, CFSTR("SystemPowerBudget80Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_powerBudget70Duration, self->_sessionDuration);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v53, CFSTR("SystemPowerBudget70Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_powerBudget60Duration, self->_sessionDuration);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v54, CFSTR("SystemPowerBudget60Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_powerBudget50Duration, self->_sessionDuration);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v55, CFSTR("SystemPowerBudget50Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_powerBudget40Duration, self->_sessionDuration);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v56, CFSTR("SystemPowerBudget40Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_powerBudget30Duration, self->_sessionDuration);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v57, CFSTR("SystemPowerBudget30Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_powerBudget20Duration, self->_sessionDuration);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v58, CFSTR("SystemPowerBudget20Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_powerBudget10Duration, self->_sessionDuration);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v59, CFSTR("SystemPowerBudget10Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_powerBudgetMinDuration, self->_sessionDuration);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v60, CFSTR("SystemPowerBudgetMinDuration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_thermalIndexMaxDuration, self->_sessionDuration);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v61, CFSTR("SystemThermalIndexMaxDuration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_thermalIndex90Duration, self->_sessionDuration);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v62, CFSTR("SystemThermalIndex90Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_thermalIndex80Duration, self->_sessionDuration);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v63, CFSTR("SystemThermalIndex80Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_thermalIndex70Duration, self->_sessionDuration);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v64, CFSTR("SystemThermalIndex70Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_thermalIndex60Duration, self->_sessionDuration);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v65, CFSTR("SystemThermalIndex60Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_thermalIndex50Duration, self->_sessionDuration);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v66, CFSTR("SystemThermalIndex50Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_thermalIndex40Duration, self->_sessionDuration);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v67, CFSTR("SystemThermalIndex40Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_thermalIndex30Duration, self->_sessionDuration);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v68, CFSTR("SystemThermalIndex30Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_thermalIndex20Duration, self->_sessionDuration);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v69, CFSTR("SystemThermalIndex20Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_thermalIndex10Duration, self->_sessionDuration);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v70, CFSTR("SystemThermalIndex10Duration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_thermalIndexMinDuration, self->_sessionDuration);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v71, CFSTR("SystemThermalIndexMinDuration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_usbInsertedDuration, self->_sessionDuration);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v72, CFSTR("SystemUSBInsertedDurationPerc"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_usbDeviceEventCount);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v73, CFSTR("SystemUSBEventCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_inA2dpEventCount);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v74, CFSTR("BluetoothInA2dpCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_inScoEventCount);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v75, CFSTR("BluetoothInScoCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_inHidPresentCount);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v76, CFSTR("BluetoothInHidCount"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inA2dpDuration, self->_sessionDuration);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v77, CFSTR("BluetoothInA2dpDuration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inScoDuration, self->_sessionDuration);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v78, CFSTR("BluetoothInScoDuration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inHidPresentDuration, self->_sessionDuration);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v79, CFSTR("BluetoothInHidDuration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", p_isSessionActive[24]);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v80, CFSTR("isA2dpActive"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", p_isSessionActive[25]);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v81, CFSTR("isSCOActive"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", p_isSessionActive[26]);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v82, CFSTR("isUniAoSActive"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", p_isSessionActive[27]);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v83, CFSTR("isBiAoSActive"));

  objc_msgSend(v6, "setObject:forKeyedSubscript:", self->_btAudioBand, CFSTR("BTBand"));
  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_linkStateChangedCount);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v84, CFSTR("WiFiLinkStateChangedCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_joinStateChangedCount);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v85, CFSTR("WiFiJoinStateChangedCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_networkChangedCount);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v86, CFSTR("WiFiNetworkChangedCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_rapidLinkTransitionCount);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v87, CFSTR("WiFiRapidLinkTransitionCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_powerToggleEventCount);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v88, CFSTR("WiFiPowerToggleEventCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_powerStateChangedCount);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v89, CFSTR("WiFiPowerStateChangedCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_inAwdlEventCount);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v90, CFSTR("WiFiInAwdlCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_inRoamEventCount);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v91, CFSTR("WiFiInRoamCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_inScanEventCount);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v92, CFSTR("WiFiInScanCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_inSoftApEventCount);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v93, CFSTR("WiFiInSoftApCount"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inAwdlDuration, self->_sessionDuration);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v94, CFSTR("WiFiInAwdlDuration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inRoamDuration, self->_sessionDuration);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v95, CFSTR("WiFiInRoamDuration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inRoamSuppressionEnabled, self->_sessionDuration);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v96, CFSTR("WiFiInRoamSuppressedDuration"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_inRoamSuppressionEnabledCount);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v97, CFSTR("WiFiInRoamSuppressedCount"));

  inRoamSuppressionWaitForRoamStart = self->_inRoamSuppressionWaitForRoamStart;
  *(float *)&inRoamSuppressionWaitForRoamStart = inRoamSuppressionWaitForRoamStart;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", inRoamSuppressionWaitForRoamStart);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v99, CFSTR("WiFiInRoamSuppressedWaitForRoamStart"));

  inRoamSuppressionWaitForRoamEnd = self->_inRoamSuppressionWaitForRoamEnd;
  *(float *)&inRoamSuppressionWaitForRoamEnd = inRoamSuppressionWaitForRoamEnd;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", inRoamSuppressionWaitForRoamEnd);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v101, CFSTR("WiFiInRoamSuppressedWaitForRoamEnd"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inScanDuration, self->_sessionDuration);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v102, CFSTR("WiFiInScanDuration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inSoftApDuration, self->_sessionDuration);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v103, CFSTR("WiFiInSoftApDuration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", p_isSessionActive[8]);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v104, CFSTR("WiFiIsPoweredOn"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_neighborBssCount);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v105, CFSTR("WiFiBssNeighborCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_otherBssCount);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v106, CFSTR("WiFiBssOtherCount"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_poweredOnDuration, self->_sessionDuration);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v107, CFSTR("WiFiPoweredOnDuration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_associatedDuration, self->_sessionDuration);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v108, CFSTR("WiFiAssociatedDuration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_associatedSleepDuration, self->_sessionDuration);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v109, CFSTR("WiFiAssociatedSleepDuration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inCellularFallbackDuration, self->_sessionDuration);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v110, CFSTR("WiFiInCellularFallbackDuration"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_cellularFallbackStateChangedCount);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v111, CFSTR("WiFiCellularFallbackStateChangedCount"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inCellularOutrankingDuration, self->_sessionDuration);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v112, CFSTR("WiFiInCellularOutrankingDuration"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_cellularOutrankingStateChangedCount);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v113, CFSTR("WiFiCellularOutrankingStateChangedCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_controlCenterStateChangedCount);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v114, CFSTR("WiFiControlCenterStateChangedCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_controlCenterToggleEventCount);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v115, CFSTR("WiFiControlCenterToggleEventCount"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inControlCenterAutoJoinDisabledDuration, self->_sessionDuration);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v116, CFSTR("WiFiControlCenterAutoJoinDisabledDuration"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_rangingEventCount);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v117, CFSTR("WiFiRangingEventCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", p_isSessionActive[15]);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v118, CFSTR("SystemInAirplaneMode"));

  objc_msgSend(v6, "setObject:forKeyedSubscript:", self->_cellularDataStatus, CFSTR("SystemCellularDataStatus"));
  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_airplaneModeStateChangedCount);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v119, CFSTR("SystemAirplaneModeStateChangedCount"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_linkRecoveryDisabledDuration, self->_sessionDuration);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v120, CFSTR("WiFiLinkRecoveryDisabledDuration"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_linkRecoveryDisabledCount);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v121, CFSTR("WiFiLinkRecoveryDisabledCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_wowStateChangedCount);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v122, CFSTR("WiFiWoWStateChangedCount"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inWowStateDuration, self->_sessionDuration);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v123, CFSTR("WiFiWoWStateDuration"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_lpasStateChangedCount);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v124, CFSTR("WiFiLPASStateChangedCount"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inLpasStateDuration, self->_sessionDuration);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v125, CFSTR("WiFiLPASStateDuration"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_lowPowerStateChangedCount);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v126, CFSTR("WiFiLowPowerStateChangedCount"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inLowPowerStateDuration, self->_sessionDuration);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v127, CFSTR("WiFiLowPowerStateDuration"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_batterySaverStateChangedCount);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v128, CFSTR("WiFiBatterySaverStateChangedCount"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inBatterySaverStateDuration, self->_sessionDuration);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v129, CFSTR("WiFiBatterySaverStateDuration"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_consecutiveJoinFailureCount);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v130, CFSTR("WiFiConsecutiveJoinFailureCount"));

  +[WiFiUsagePrivacyFilter numberWithDuration:](WiFiUsagePrivacyFilter, "numberWithDuration:", self->_longestUnassociatedDuration);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v131, CFSTR("WiFiLongestUnassociatedDuration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)(self->_sleepPowerStatsTotalDuration / 1000.0));
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v132, CFSTR("WiFiSleepPowerStatsDurationTotal"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)(self->_sleepPowerStatsUnassociatedDuration / 1000.0));
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v133, CFSTR("WiFiSleepPowerStatsDurationUnassociated"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)(self->_sleepPowerStatsAssociatedDuration / 1000.0));
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v134, CFSTR("WiFiSleepPowerStatsDurationAssociated"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)(self->_sleepPowerStatsRoamingDuration / 1000.0));
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v135, CFSTR("WiFiSleepPowerStatsDurationRoaming"));

  sessionDuration = self->_sessionDuration;
  v137 = *(_OWORD *)&self->_bandUsageDuration.valueByBand[2];
  v387 = *(_OWORD *)self->_bandUsageDuration.valueByBand;
  v388 = v137;
  +[WiFiUsagePrivacyFilter getLabelForBandUsageDuration:overTotalDuration:binned:](WiFiUsagePrivacyFilter, "getLabelForBandUsageDuration:overTotalDuration:binned:", &v387, 1, sessionDuration);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v138, CFSTR("WiFiBandUsageDuration"));

  objc_msgSend((id)objc_opt_class(), "joinReasonString:", self->_lastJoinReason);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v139, CFSTR("WiFiNetworkJoinReason"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_lastJoinFailure);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v140, CFSTR("WiFiNetworkJoinFailure"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_lastJoinFailure == 0);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v141, CFSTR("WiFiNetworkJoinResult"));

  objc_msgSend((id)objc_opt_class(), "disconnectReasonString:", self->_lastDisconnectReason);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v142, CFSTR("WiFiNetworkDisconnectReason"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_lastDisconnectSubreason);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v143, CFSTR("WiFiNetworkDisconnectSubreason"));

  objc_msgSend((id)objc_opt_class(), "disconnectReasonString:", self->_previousDisconnectReason);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v144, CFSTR("WiFiNetworkPreviousDisconnectReason"));

  -[WiFiUsageSession responsivenessScore](self, "responsivenessScore");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v145, CFSTR("WiFiNetworkResponsivenessScore"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_perClientScanCount[1]);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v146, CFSTR("ScanCountForAutoJoinPrevChannel"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_perClientScanCount[2]);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v147, CFSTR("ScanCountForAutoJoinMruChannels"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_perClientScanCount[3]);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v148, CFSTR("ScanCountForAutoJoinRemChannels"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_perClientScanCount[4]);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v149, CFSTR("ScanCountForAutoJoin2GHz"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_perClientScanCount[5]);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v150, CFSTR("ScanCountForAutoJoin5GHz"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_perClientScanCount[7]);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v151, CFSTR("ScanCountForAutoJoinHiddenNetwork"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_perClientScanCount[6]);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v152, CFSTR("ScanCountForAutoJoinAllChannels"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_perClientScanCount[20]);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v153, CFSTR("ScanCountForUnifiedAutoJoinNoSSIDList"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_perClientScanCount[21]);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v154, CFSTR("ScanCountForUnifiedAutoJoinSSIDList"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_perClientScanCount[21] + self->_perClientScanCount[20]);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v155, CFSTR("ScanCountForUnifiedAutoJoin"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_perClientScanCount[8]);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v156, CFSTR("ScanCountForSettings"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_perClientScanCount[9]);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v157, CFSTR("ScanCountForATJ"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_perClientScanCount[10]);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v158, CFSTR("ScanCountForControlCenter"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_perClientScanCount[11]);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v159, CFSTR("ScanCountForApp"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_perClientScanCount[12]);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v160, CFSTR("ScanCountForHomeKit"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_perClientScanCount[13]);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v161, CFSTR("ScanCountForConfigd"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_perClientScanCount[26]);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v162, CFSTR("ScanCountForMilod"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_perClientScanCount[14]);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v163, CFSTR("ScanCountForOtherClient"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_perClientScanCount[15]);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v164, CFSTR("ScanCountForNetworkTransition"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_perClientScanCount[16]);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v165, CFSTR("ScanCountForLocation"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_perClientScanCount[17]);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v166, CFSTR("ScanCountForIndoor"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_perClientScanCount[18]);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v167, CFSTR("ScanCountForAutoHotspot"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_perClientScanCount[19]);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v168, CFSTR("ScanCountForPersonalHotspot"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[1]);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v169, CFSTR("FaultReasonDnsFailureCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[2]);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v170, CFSTR("FaultReasonArpFailureCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[4]);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v171, CFSTR("FaultReasonShortFlowCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[5]);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v172, CFSTR("FaultReasonRTTFailureCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[3]);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v173, CFSTR("FaultReasonSymptomDataStallCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[6]);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v174, CFSTR("FaultReasonL2DatapathStallCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[7]);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v175, CFSTR("FaultReasonWatchdogResetCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[8]);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v176, CFSTR("FaultReasonBlocklistedSsidCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[9]);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v177, CFSTR("FaultReasonBlocklistedBssidCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[21]);
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v178, CFSTR("FaultReasonFirmwareTrapCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[24]);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v179, CFSTR("FaultReasonDextCrashed"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[10]);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v180, CFSTR("FaultReasonSlowWiFi"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[11]);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v181, CFSTR("FaultReasonPrivateMACFallback"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[12]);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v182, CFSTR("FaultReasonDelayedAutoJoin"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[13]);
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v183, CFSTR("FaultReasonDhcpFailure"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[14]);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v184, CFSTR("FaultReasonLinkTestLocalCheckFailure"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[15]);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v185, CFSTR("FaultReasonLinkTestInternetCheckFailure"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[16]);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v186, CFSTR("FaultReasonLinkTestDNSCheckFailure"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[17]);
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v187, CFSTR("FaultReasonArpFailure"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[18]);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v188, CFSTR("FaultReasonSlowWiFiDnsFailure"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[19]);
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v189, CFSTR("FaultReasonSlowWiFiDUT"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[20]);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v190, CFSTR("FaultReasonUserOverridesCellularOutranking"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[22]);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v191, CFSTR("FaultReasonSleepPowerBudgetExceeded"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[23]);
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v192, CFSTR("FaultReasonLowPowerBudgetExceeded"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[25]);
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v193, CFSTR("FaultReasonSiriTimedOut"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[26]);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v194, CFSTR("FaultReasonApsdTimedOut"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[27]);
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v195, CFSTR("FaultReasonBrokenBackhaulLinkFailed"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_triggerDisconnectAlertedCount);
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v196, CFSTR("TriggerDisconnectAlertedCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_triggerDisconnectConfirmedCount);
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v197, CFSTR("TriggerDisconnectConfirmedCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_triggerDisconnectExecutedCount);
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v198, CFSTR("TriggerDisconnectExecutedCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamReasonInitialAssociationCount);
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v199, CFSTR("RoamReasonInitialAssociationCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamReasonLowRssiCount);
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v200, CFSTR("RoamReasonLowRssiCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamReasonDeauthDisassocCount);
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v201, CFSTR("RoamReasonDeauthDisassocCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamReasonBeaconLostCount);
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v202, CFSTR("RoamReasonBeaconLostCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamReasonSteeredByApCount);
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v203, CFSTR("RoamReasonSteeredByApCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamReasonSteeredByBtmCount);
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v204, CFSTR("RoamReasonSteeredByBtmCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamReasonSteeredByCsaCount);
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v205, CFSTR("RoamReasonSteeredByCsaCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamReasonReassocRequestedCount);
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v206, CFSTR("RoamReasonReassocRequestedCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamReasonHostTriggeredCount);
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v207, CFSTR("RoamReasonHostTriggeredCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamReasonBetterCandidateCount);
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v208, CFSTR("RoamReasonBetterCandidateCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamReasonBetterConditionCount);
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v209, CFSTR("RoamReasonBetterConditionCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamReasonMiscCount);
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v210, CFSTR("RoamReasonMiscCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamStatusSucceededCount);
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v211, CFSTR("RoamStatusSucceededCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamStatusFailedCount);
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v212, CFSTR("RoamStatusFailedCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamStatusNoCandidateCount);
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v213, CFSTR("RoamStatusNoCandidateCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamStatusNoQualifiedCandidateCount);
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v214, CFSTR("RoamStatusNoQualifiedCandidateCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamStatusFailedNoScan);
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v215, CFSTR("RoamStatusFailedNoScan"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamIsWNMScoreUsedCount);
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v216, CFSTR("RoamWNMScoreUsedCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamPingPongAboveThresholdCount);
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v217, CFSTR("RoamPingPongAboveThresholdCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamPingPongAboveThresholdCountLowRssiOnly);
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v218, CFSTR("RoamPingPongAboveThresholdCountLowRssiOnly"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamPingPongLowRssiAndReassocOnly);
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v219, CFSTR("RoamPingPongLowRssiAndReassocOnly"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamPingPongReassocOnly);
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v220, CFSTR("RoamPingPongReassocOnly"));

  objc_msgSend(v6, "setObject:forKeyedSubscript:", self->_lastDriverUnavailableReason, CFSTR("LastDriverUnavailableReason"));
  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_driverUnavailabilityCount);
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v221, CFSTR("DriverUnavailabilityCount"));

  +[WiFiUsagePrivacyFilter numberWithDuration:](WiFiUsagePrivacyFilter, "numberWithDuration:", self->_driverProcessLifespan);
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v222, CFSTR("DriverProcessLifespan"));

  +[WiFiUsagePrivacyFilter numberWithDuration:](WiFiUsagePrivacyFilter, "numberWithDuration:", self->_driverAvailabilityLifespan);
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v223, CFSTR("DriverAvailabilityLifespan"));

  -[NSDate timeIntervalSinceDate:](self->_sessionInitTime, "timeIntervalSinceDate:", self->_processInitTime);
  +[WiFiUsagePrivacyFilter numberWithDurationMillisecond:](WiFiUsagePrivacyFilter, "numberWithDurationMillisecond:");
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v224, CFSTR("DriverAvailabilityLatencyFromProcessInit"));

  +[WiFiUsagePrivacyFilter numberWithDurationMillisecond:](WiFiUsagePrivacyFilter, "numberWithDurationMillisecond:", self->_driverAvailabilityLatencyFromChipReset);
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v225, CFSTR("DriverAvailableLatencyFromChipReset"));

  +[WiFiUsagePrivacyFilter numberWithDurationMillisecond:](WiFiUsagePrivacyFilter, "numberWithDurationMillisecond:", self->_driverAvailabilityLatencyFromTermination);
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v226, CFSTR("DriverAvailableLatencyFromTermination"));

  +[WiFiUsagePrivacyFilter numberWithDurationMillisecond:](WiFiUsagePrivacyFilter, "numberWithDurationMillisecond:", self->_joinScanLatencyFromDriverAvailability);
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v227, CFSTR("JoinScanLatencyFromDriverAvailability"));

  +[WiFiUsagePrivacyFilter numberWithDurationMillisecond:](WiFiUsagePrivacyFilter, "numberWithDurationMillisecond:", self->_joinStartedLatencyFromDriverAvailability);
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v228, CFSTR("JoinStartedLatencyFromDriverAvailability"));

  +[WiFiUsagePrivacyFilter numberWithDurationMillisecond:](WiFiUsagePrivacyFilter, "numberWithDurationMillisecond:", self->_joinLinkUpLatencyFromDriverAvailability);
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v229, CFSTR("JoinLinkUpLatencyFromDriverAvailability"));

  +[WiFiUsagePrivacyFilter numberWithDurationMillisecond:](WiFiUsagePrivacyFilter, "numberWithDurationMillisecond:", self->_joinIpConfigurationLatencyFromDriverAvailability);
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v230, CFSTR("JoinIpConfigurationLatencyFromDriverAvailability"));

  +[WiFiUsagePrivacyFilter numberWithDurationMillisecond:](WiFiUsagePrivacyFilter, "numberWithDurationMillisecond:", self->_joinInterfaceRankingLatencyFromDriverAvailability);
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v231, CFSTR("JoinInterfaceRankingLatencyFromDriverAvailability"));

  +[WiFiUsagePrivacyFilter numberWithDurationMillisecond:](WiFiUsagePrivacyFilter, "numberWithDurationMillisecond:", self->_joinLinkUpLatencyFromSessionStart);
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v232, CFSTR("JoinLinkUpLatencySinceSessionStart"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", p_isSessionActive[12]);
  v233 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v233, CFSTR("WiFiCompatibilityModeEnabledAtStart"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", p_isSessionActive[13]);
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v234, CFSTR("WiFiCompatibilityModeEnabledAtEnd"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_compatibilityModeChangeCount);
  v235 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v235, CFSTR("WiFiCompatibilityModeChangeCount"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inCompatibilityModeEnabledDuration, self->_sessionDuration);
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v236, CFSTR("WiFiCompatibilityModeEnabledDuration"));

  objc_msgSend(v6, "setObject:forKeyedSubscript:", self->_networkDisable6eModeAtStart, CFSTR("NetworkDisable6EModeAtStart"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_network6eDisabledModeChangeCount);
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v237, CFSTR("NetworkDisable6EModeChangeCount"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inNetwork6eModeOffDuration, self->_sessionDuration);
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v238, CFSTR("NetworkIn6EModeOffDuration"));

  if (-[WiFiUsageSession bandAtSessionStart](self, "bandAtSessionStart") == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WiFiUsageSession infraIsPartOfSplitSSID](self, "infraIsPartOfSplitSSID"));
    v239 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v239, CFSTR("infraIsPartOfSplitSSID"));

  }
  +[WiFiUsagePrivacyFilter getLabelForNeighborsByBand:](WiFiUsagePrivacyFilter, "getLabelForNeighborsByBand:", self->_roamNeighborsByBand);
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v240, CFSTR("RoamNeighborsCountByBand"));

  +[WiFiUsagePrivacyFilter getSumArrayCountAllBand:](WiFiUsagePrivacyFilter, "getSumArrayCountAllBand:", self->_roamNeighborsByBand);
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v241, CFSTR("RoamNeighborsCountTotal"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_minCandidatesCount);
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v242, CFSTR("RoamCandidatesCountMin"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_maxCandidatesCount);
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v243, CFSTR("RoamCandidatesCountMax"));

  roamReasonLowRssiCount = self->_roamReasonLowRssiCount;
  if (roamReasonLowRssiCount)
  {
    +[WiFiUsagePrivacyFilter getBinEvery10Over100:As:](WiFiUsagePrivacyFilter, "getBinEvery10Over100:As:", 100 * self->_currentRSSIStrongestCount / roamReasonLowRssiCount, 0);
    v245 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v245, CFSTR("RoamCandidatesLowRssiCurrentBSSIsBestPerc"));

  }
  else
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, CFSTR("RoamCandidatesLowRssiCurrentBSSIsBestPerc"));
  }
  v246 = *(_OWORD *)&self->_strongestRSSICountByBand.valueByBand[2];
  v387 = *(_OWORD *)self->_strongestRSSICountByBand.valueByBand;
  v388 = v246;
  +[WiFiUsagePrivacyFilter getLabelForPercIntegerByBand:](WiFiUsagePrivacyFilter, "getLabelForPercIntegerByBand:", &v387);
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v247, CFSTR("RoamCandidatesStrongestRssiByBandPerc"));

  v248 = *(_OWORD *)&self->_strongestRSSIByBand.valueByBand[2];
  v387 = *(_OWORD *)self->_strongestRSSIByBand.valueByBand;
  v388 = v248;
  +[WiFiUsagePrivacyFilter getLabelForRssiByBand:](WiFiUsagePrivacyFilter, "getLabelForRssiByBand:", &v387);
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v249, CFSTR("RoamCandidatesStrongestRssiByBand"));

  v250 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[2][0];
  v389 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[1][1];
  v390 = v250;
  v391 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[2][2];
  v392 = *(_QWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valid[2][2];
  v251 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[0][2];
  v387 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[0][0];
  v388 = v251;
  +[WiFiUsagePrivacyFilter getLabelForRssiDeltaByBandTransition:](WiFiUsagePrivacyFilter, "getLabelForRssiDeltaByBandTransition:", &v387);
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v252, CFSTR("RoamCandidatesSmallestDiffCurrentToNextBestRSSIByBand"));

  v253 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[2][0];
  v389 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[1][1];
  v390 = v253;
  v391 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[2][2];
  v392 = *(_QWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valid[2][2];
  v254 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[0][2];
  v387 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[0][0];
  v388 = v254;
  +[WiFiUsagePrivacyFilter getLabelForRssiDeltaByBandTransition:](WiFiUsagePrivacyFilter, "getLabelForRssiDeltaByBandTransition:", &v387);
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v255, CFSTR("RoamCandidatesLargestDiffCurrentToNextBestRSSIByBand"));

  v256 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[2][0];
  v389 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[1][1];
  v390 = v256;
  v391 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[2][2];
  v392 = *(_QWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valid[2][2];
  v257 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[0][2];
  v387 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[0][0];
  v388 = v257;
  +[WiFiUsagePrivacyFilter getLabelForRssiDeltaByBandTransition:](WiFiUsagePrivacyFilter, "getLabelForRssiDeltaByBandTransition:", &v387);
  v258 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v258, CFSTR("RoamCandidatesSmallestDiffCurrentToBestRSSIByBand"));

  v259 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[2][0];
  v389 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[1][1];
  v390 = v259;
  v391 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[2][2];
  v392 = *(_QWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valid[2][2];
  v260 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[0][2];
  v387 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[0][0];
  v388 = v260;
  +[WiFiUsagePrivacyFilter getLabelForRssiDeltaByBandTransition:](WiFiUsagePrivacyFilter, "getLabelForRssiDeltaByBandTransition:", &v387);
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v261, CFSTR("RoamCandidatesLargestDiffCurrentToBestRSSIByBand"));

  +[WiFiUsagePrivacyFilter getModeCountersByCandidatesByBand:](WiFiUsagePrivacyFilter, "getModeCountersByCandidatesByBand:", self->_roamCandidatesPerBandWhenSuccessful);
  +[WiFiUsagePrivacyFilter getLabelForIntegerByBand:withCap:](WiFiUsagePrivacyFilter, "getLabelForIntegerByBand:withCap:", v386, 1);
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v262, CFSTR("RoamCandidatesModeSuccessfulRoams"));

  +[WiFiUsagePrivacyFilter getModeCountersByCandidatesByBand:](WiFiUsagePrivacyFilter, "getModeCountersByCandidatesByBand:", self->_roamCandidatesPerBandWhenUnSuccessful);
  +[WiFiUsagePrivacyFilter getLabelForIntegerByBand:withCap:](WiFiUsagePrivacyFilter, "getLabelForIntegerByBand:withCap:", &v385, 1);
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v263, CFSTR("RoamCandidatesModeUnsuccessfulRoams"));

  if (self->_ipV4DetailsPrevSession)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", p_isSessionActive[19]);
    v264 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v264, CFSTR("ipv4ParamChange"));

  }
  if (self->_ipV6DetailsPrevSession)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", p_isSessionActive[20]);
    v265 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v265, CFSTR("ipv6ParamChange"));

  }
  if (-[NSMutableArray count](self->_prevNetworkNames, "count") == 2)
  {
    v266 = (void *)MEMORY[0x1E0CB37E8];
    -[WiFiUsageNetworkDetails networkName](self->_networkDetails, "networkName");
    v267 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray objectAtIndex:](self->_prevNetworkNames, "objectAtIndex:", 0);
    v268 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v266, "numberWithBool:", objc_msgSend(v267, "isEqualToString:", v268));
    v269 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v269, CFSTR("PrevJoinLeftSameSSID"));

  }
  if (self->_prevJoinReason != -1)
  {
    objc_msgSend((id)objc_opt_class(), "joinReasonString:", self->_prevJoinReason);
    v270 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v270, CFSTR("PrevJoinReason"));

    +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:](WiFiUsagePrivacyFilter, "getBinFor:In:WithLowestEdge:As:", (unint64_t)self->_timeSincePrevJoin, &unk_1E8864190, CFSTR("0"), 1);
    v271 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v271, CFSTR("timeSincePrevJoin"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", p_isSessionActive[23]);
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v272, CFSTR("inCoexRealTimeAtJoin"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", p_isSessionActive[22]);
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v273, CFSTR("inCoexRealTimeAtSessionStart"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", p_isSessionActive[21]);
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v274, CFSTR("inCoexRealTimeAtSessionEnd"));

  if (self->_lastCoexRealTimeOn)
  {
    v275 = (void *)MEMORY[0x1E0CB37E8];
    -[NSDate timeIntervalSinceDate:](self->_sessionEndTime, "timeIntervalSinceDate:");
    objc_msgSend(v275, "numberWithInteger:", (unint64_t)v276);
    v277 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v277, CFSTR("timeSinceLastRTCoexStarted"));

  }
  if (self->_lastCoexRealTimeOff)
  {
    v278 = (void *)MEMORY[0x1E0CB37E8];
    -[NSDate timeIntervalSinceDate:](self->_sessionEndTime, "timeIntervalSinceDate:");
    objc_msgSend(v278, "numberWithInteger:", (unint64_t)v279);
    v280 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v280, CFSTR("timeSinceLastRTCoexEnded"));

  }
  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_joinReasonCount[1]);
  v281 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v281, CFSTR("JoinReasonAutoCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_joinReasonCount[2]);
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v282, CFSTR("JoinReasonSettingsCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_joinReasonCount[3]);
  v283 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v283, CFSTR("JoinReasonAskToJoinCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_joinReasonCount[4]);
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v284, CFSTR("JoinReasonRecommendationCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_joinReasonCount[5]);
  v285 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v285, CFSTR("JoinReasonApplicationCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_joinReasonCount[6]);
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v286, CFSTR("JoinReasonHomeKitCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_joinReasonCount[7]);
  v287 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v287, CFSTR("JoinReasonControlCenterCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_joinReasonCount[8]);
  v288 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v288, CFSTR("JoinReasonOtherClientCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_joinReasonCount[9]);
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v289, CFSTR("JoinReasonLegacyTransitionCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_joinReasonCount[10]);
  v290 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v290, CFSTR("JoinReasonAutoHotspotCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_joinReasonCount[11]);
  v291 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v291, CFSTR("JoinReasonUserOverridesAutoJoinDenyListCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_joinReasonCount[12]);
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v292, CFSTR("JoinReasonSeamlessTransitionCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_joinReasonCount[13]);
  v293 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v293, CFSTR("JoinReasonSetupCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_joinReasonCount[14]);
  v294 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v294, CFSTR("JoinReasonSharingCount"));

  if (self->_countRoamScan)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", p_isSessionActive[28]);
    v295 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v295, CFSTR("LastRoamScanFoundSSIDTransitionTarget"));

    +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_countSSIDTransitionTargetInLastRoamScan);
    v296 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v296, CFSTR("LastRoamScanFoundSSIDTransitionTargetCount"));

    +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_countRoamScanThatFoundSSIDTransitionTarget);
    v297 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v297, CFSTR("FoundSSIDTransitionTargetRoamScanCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (uint64_t)(float)((float)((float)self->_countRoamScanThatFoundSSIDTransitionTarget * 100.0)/ (float)self->_countRoamScan));
    v298 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v298, CFSTR("RoamScanFoundSSIDTransitionTargetAsPercOfFailedRoam"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", p_isSessionActive[29]);
    v299 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v299, CFSTR("LastRoamScanFoundPotentialSSIDTransitionCandidate"));

    +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_countSSIDTransitionPotentialCandidatesInLastRoamScan);
    v300 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v300, CFSTR("LastRoamScanPotentialSSIDTransitionCandidateCount"));

    +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_countSSIDTransitionPotentialCandidatesInLastRoamScanNotInTransitionableSet);
    v301 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v301, CFSTR("LastRoamScanPotentialSSIDTransitionCandidateNotSSIDTransitionTargetCount"));

    +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_countRoamScanThatFoundSSIDTransitionPotentialCandidate);
    v302 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v302, CFSTR("FoundPotentialSSIDTransitionCandidateRoamScanCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (uint64_t)(float)((float)((float)self->_countRoamScanThatFoundSSIDTransitionPotentialCandidate * 100.0)/ (float)self->_countRoamScan));
    v303 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v303, CFSTR("RoamScanFoundPotentialSSIDTransitionCandidateAsPercOfFailedRoam"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", p_isSessionActive[30]);
    v304 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v304, CFSTR("LastRoamScanContainsRoamCandidate"));

    +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", p_isSessionActive[30]);
    v305 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v305, CFSTR("LastRoamScanContainsRoamCandidateCount"));

    +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_lastRoamScanUniqueChannelsCount);
    v306 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v306, CFSTR("LastRoamScanUniqueChannelsCount"));

    +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_lastRoamScanUniqueBandsCount);
    v307 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v307, CFSTR("LastRoamScanUniqueBandsCount"));

  }
  if (self->_type != 9)
  {
    +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_inPoorLinkSessionCount);
    v308 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v308, CFSTR("WiFiInPoorLinkSessionCount"));

    +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inPoorLinkSessionDuration, self->_sessionDuration);
    v309 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v309, CFSTR("WiFiInPoorLinkSessionDurationPerc"));

    +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inPoorLinkSessionDuration, self->_associatedDuration);
    v310 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v310, CFSTR("WiFiInPoorLinkAssocPerc"));

    +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_tdAfterJoinAfterTDCount);
    v311 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v311, CFSTR("TDAfterJoinAfterTDCount"));

    if (self->_min_subsequentTdAfterJoinAfterTDCount == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, CFSTR("TDAfterJoinAfterTDMinSequenceLen"));
    }
    else
    {
      +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:");
      v312 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v312, CFSTR("TDAfterJoinAfterTDMinSequenceLen"));

    }
    +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_max_subsequentTdAfterJoinAfterTDCount);
    v313 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v313, CFSTR("TDAfterJoinAfterTDMaxSequenceLen"));

    +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_tdSessionStartedByBadRSSICount);
    v314 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v314, CFSTR("PoorLinkSessionStartedByBadRSSICount"));

    +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_tdSessionStartedByTDRecommendedCount);
    v315 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v315, CFSTR("PoorLinkSessionStartedByTDRecommendedCount"));

    +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_tdSessionStartedBySymptomDNSFailureCount);
    v316 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v316, CFSTR("PoorLinkSessionStartedBySymptomDNSFailureCount"));

  }
  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_tdEvalEndedCount);
  v317 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v317, CFSTR("TDEvalEndedCount"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_tdEvalCumulativeDuration, self->_sessionDuration);
  v318 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v318, CFSTR("TDEvalDurationPerc"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_tdEvalStartedCount);
  v319 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v319, CFSTR("TDEvalStartedCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_tdEvalStartedByBadRSSICount);
  v320 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v320, CFSTR("TDEvalStartedByBadRSSICount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_tdEvalStartedBySymptomsARPFailureCount);
  v321 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v321, CFSTR("TDEvalStartedBySymptomsARPFailureCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_tdEvalStartedBySymptomsShortFlowCount);
  v322 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v322, CFSTR("TDEvalStartedBySymptomsShortFlowCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_tdEvalStartedBySymptomsDataStallCount);
  v323 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v323, CFSTR("TDEvalStartedBySymptomsDataStallCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_tdEvalStartedBySymptomsDNSStallCount);
  v324 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v324, CFSTR("TDEvalStartedBySymptomsDNSStallCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_tdEvalStartedBySymptomsDNSFailCount);
  v325 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v325, CFSTR("TDEvalStartedBySymptomsDNSFailCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_tdEvalStartedByActiveProbingCount);
  v326 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v326, CFSTR("TDEvalStartedByActiveProbingCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_tdEvalStartedByFGNetwAppChangeCount);
  v327 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v327, CFSTR("TDEvalStartedByFGNetwAppChangeCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_tdEvalStartedByUserNotificationCount);
  v328 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v328, CFSTR("TDEvalStartedByUserNotificationCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_tdEvalStartedByCheckReassocCount);
  v329 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v329, CFSTR("TDEvalStartedByCheckReassocCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_inAWDL_BestInfraScore);
  v330 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v330, CFSTR("inAWDL_bestInfraScore"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_inAWDL_WorstInfraScore);
  v331 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v331, CFSTR("inAWDL_worstInfraScore"));

  inAWDL_BestP2PScore = self->_inAWDL_BestP2PScore;
  *(float *)&inAWDL_BestP2PScore = inAWDL_BestP2PScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", inAWDL_BestP2PScore);
  v333 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v333, CFSTR("inAWDL_bestP2PScore"));

  inAWDL_WorstP2PScore = self->_inAWDL_WorstP2PScore;
  *(float *)&inAWDL_WorstP2PScore = inAWDL_WorstP2PScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", inAWDL_WorstP2PScore);
  v335 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v335, CFSTR("inAWDL_worstP2PScore"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inAWDL_BestInfraScoreDuration, self->_sessionDuration);
  v336 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v336, CFSTR("inAWDL_bestInfraScoreDurationPerc"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inAWDL_WorstInfraScoreDuration, self->_sessionDuration);
  v337 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v337, CFSTR("inAWDL_worstInfraScoreDurationPerc"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inAWDL_BestP2PScoreDuration, self->_sessionDuration);
  v338 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v338, CFSTR("inAWDL_bestP2PScoreDurationPerc"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inAWDL_WorstP2PScoreDuration, self->_sessionDuration);
  v339 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v339, CFSTR("inAWDL_worstP2PScoreDurationPerc"));

  inAWDL_BestInfraScoreDuration = self->_inAWDL_BestInfraScoreDuration;
  *(float *)&inAWDL_BestInfraScoreDuration = inAWDL_BestInfraScoreDuration;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", inAWDL_BestInfraScoreDuration);
  v341 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v341, CFSTR("inAWDL_bestInfraScoreDuration"));

  inAWDL_WorstInfraScoreDuration = self->_inAWDL_WorstInfraScoreDuration;
  *(float *)&inAWDL_WorstInfraScoreDuration = inAWDL_WorstInfraScoreDuration;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", inAWDL_WorstInfraScoreDuration);
  v343 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v343, CFSTR("inAWDL_worstInfraScoreDuration"));

  inAWDL_BestP2PScoreDuration = self->_inAWDL_BestP2PScoreDuration;
  *(float *)&inAWDL_BestP2PScoreDuration = inAWDL_BestP2PScoreDuration;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", inAWDL_BestP2PScoreDuration);
  v345 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v345, CFSTR("inAWDL_bestP2PScoreDuration"));

  inAWDL_WorstP2PScoreDuration = self->_inAWDL_WorstP2PScoreDuration;
  *(float *)&inAWDL_WorstP2PScoreDuration = inAWDL_WorstP2PScoreDuration;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", inAWDL_WorstP2PScoreDuration);
  v347 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v347, CFSTR("inAWDL_worstP2PScoreDuration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_maxPhyMode == 512);
  v348 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v348, CFSTR("hasAssocToWiFi7"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_maxPhyMode == 1024);
  v349 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v349, CFSTR("hasAssocToWiFi6E"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_maxPhyMode == 256);
  v350 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v350, CFSTR("hasAssocToWiFi6"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_maxPhyMode == 128);
  v351 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v351, CFSTR("hasAssocToWiFi5"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_maxPhyMode == 16);
  v352 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v352, CFSTR("hasAssocToWiFi4"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_maxPhyMode == 8);
  v353 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v353, CFSTR("hasAssocToWiFi3"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_maxPhyMode == 2);
  v354 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v354, CFSTR("hasAssocToWiFi2"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_maxPhyMode == 4);
  v355 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v355, CFSTR("hasAssocToWiFi1"));

  capabilities = self->_capabilities;
  if (!capabilities)
  {
    v357 = -[WiFiUsageInterfaceCapabilities initWithInterfaceName:]([WiFiUsageInterfaceCapabilities alloc], "initWithInterfaceName:", self->_interfaceName);
    v358 = self->_capabilities;
    self->_capabilities = v357;

    capabilities = self->_capabilities;
  }
  +[WiFiUsagePrivacyFilter getLabelForPhyModes:](WiFiUsagePrivacyFilter, "getLabelForPhyModes:", +[WiFiUsageLQMTransformations maxPhyModeFrom:](WiFiUsageLQMTransformations, "maxPhyModeFrom:", -[WiFiUsageInterfaceCapabilities supportedPhyModes](capabilities, "supportedPhyModes")));
  v359 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v359, CFSTR("WiFiRadioTechCapable"));

  if (self->_disconnectReasonMap)
    objc_msgSend(v6, "addEntriesFromDictionary:");
  lqm = self->_lqm;
  if (lqm)
  {
    -[WiFiUsageSessionLQM eventDictionary:](lqm, "eventDictionary:", v3);
    v361 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addEntriesFromDictionary:", v361);

  }
  networkDetails = self->_networkDetails;
  if (networkDetails)
  {
    -[WiFiUsageNetworkDetails eventDictionary:](networkDetails, "eventDictionary:", v3);
    v363 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addEntriesFromDictionary:", v363);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_awdlActiveTime != 0);
  v364 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v364, CFSTR("WiFiIsAwdlActive"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", p_isSessionActive[14]);
  v365 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v365, CFSTR("WiFiIsLinkRecoveryDisabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_forwardedBssInwakeCount);
  v366 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v366, CFSTR("forwardedBssInwakeCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_forwardedBssInSleepCount);
  v367 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v367, CFSTR("forwardedBssInSleepCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_hostScanTriggersCount);
  v368 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v368, CFSTR("hostScanTriggersCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_roamScanTriggersCount);
  v369 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v369, CFSTR("roamScanTriggersCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_pnoScanTriggersCount);
  v370 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v370, CFSTR("pnoScanTriggersCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_epnoScanTriggersCount);
  v371 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v371, CFSTR("epnoScanTriggersCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_currentBssMsgInWakeCount);
  v372 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v372, CFSTR("currentBssMsgInWakeCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_currentBssMsgInSleepCount);
  v373 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v373, CFSTR("currentBssMsgInSleepCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_scanDataMsgInWakeCount);
  v374 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v374, CFSTR("scanDataMsgInWakeCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_scanDataMsgInSleepCount);
  v375 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v375, CFSTR("scanDataMsgInSleepCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_spmiMsgInAwakeCount);
  v376 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v376, CFSTR("spmiMsgInAwakeCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_spmiMsgInSleepCount);
  v377 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v377, CFSTR("spmiMsgInSleepCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_spmiMsgDropRssiFilterCount);
  v378 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v378, CFSTR("spmiMsgDropRssiFilterCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_spmiMsgDropMaxFilterCount);
  v379 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v379, CFSTR("spmiMsgDropMaxFilterCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_spmiMsgDropSpmiFailCount);
  v380 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v380, CFSTR("spmiMsgDropSpmiFailCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_bssDropLowMemoryCount);
  v381 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v381, CFSTR("bssDropLowMemoryCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", p_isSessionActive[35]);
  v382 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v382, CFSTR("NetworkIsInstantHotspot"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", p_isSessionActive[36]);
  v383 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v383, CFSTR("NetworkIsAutoHotspot"));

  return v6;
}

- (id)eventDictionaryByBand:(int)a3 isFirst:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  void *v7;
  double sessionDuration;
  __int128 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double associatedDuration;
  __int128 v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _OWORD v27[6];
  __int128 v28;
  __int128 v29;
  _OWORD v30[2];

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v30, 0, sizeof(v30));
  sessionDuration = self->_sessionDuration;
  v9 = *(_OWORD *)&self->_bandUsageDuration.valueByBand[2];
  v28 = *(_OWORD *)self->_bandUsageDuration.valueByBand;
  v29 = v9;
  +[WiFiUsagePrivacyFilter getPercForFloatByBand:Over:](WiFiUsagePrivacyFilter, "getPercForFloatByBand:Over:", &v28, sessionDuration);
  -[WiFiUsageSession sessionName](self, "sessionName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("SessionName"));

  +[WiFiUsagePrivacyFilter numberWithDuration:](WiFiUsagePrivacyFilter, "numberWithDuration:", self->_sessionDuration);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("SessionDuration"));

  +[WiFiUsagePrivacyFilter getBinTimeInterval:As:](WiFiUsagePrivacyFilter, "getBinTimeInterval:As:", 1, self->_sessionDuration);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("SessionDurationAsString"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("firstEvent"));

  +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, CFSTR("band"));

  -[WiFiUsageSession bandUsageDuration](self, "bandUsageDuration");
  v15 = v5;
  if (*((_BYTE *)&v27[5] + v5 + 8))
  {
    -[WiFiUsageSession bandUsageDuration](self, "bandUsageDuration");
    v16 = *((double *)&v27[2] + v5);
  }
  else
  {
    v16 = 0.0;
  }
  +[WiFiUsagePrivacyFilter getBinTimeInterval:As:](WiFiUsagePrivacyFilter, "getBinTimeInterval:As:", 1, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, CFSTR("durationOnBand"));

  if (*((_BYTE *)&v30[1] + v15 + 8))
    v18 = *((_QWORD *)v30 + v15);
  else
    v18 = 0;
  +[WiFiUsagePrivacyFilter getBinEvery10Over100:As:](WiFiUsagePrivacyFilter, "getBinEvery10Over100:As:", v18, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, CFSTR("durationOnBandPerc"));

  v28 = 0u;
  v29 = 0u;
  associatedDuration = self->_associatedDuration;
  v21 = *(_OWORD *)&self->_bandUsageDuration.valueByBand[2];
  v27[0] = *(_OWORD *)self->_bandUsageDuration.valueByBand;
  v27[1] = v21;
  +[WiFiUsagePrivacyFilter getPercForFloatByBand:Over:](WiFiUsagePrivacyFilter, "getPercForFloatByBand:Over:", v27, associatedDuration);
  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_associatedDuration, self->_sessionDuration);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, CFSTR("WiFiAssociatedDuration"));

  +[WiFiUsagePrivacyFilter getBinTimeInterval:As:](WiFiUsagePrivacyFilter, "getBinTimeInterval:As:", 1, self->_associatedDuration);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v23, CFSTR("WiFiAssociatedDurationAsString"));

  if (*((_BYTE *)&v29 + v15 + 8))
    v24 = *((_QWORD *)&v28 + v15);
  else
    v24 = 0;
  +[WiFiUsagePrivacyFilter getBinEvery10Over100:As:](WiFiUsagePrivacyFilter, "getBinEvery10Over100:As:", v24, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v25, CFSTR("durationOnBandPercOfAssoc"));

  return v7;
}

- (id)sessionSummary:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)-[WiFiUsageSession copy](self, "copy");
  objc_msgSend(v4, "summarizeSession");
  objc_msgSend(v4, "eventDictionary:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)totalRxFrames
{
  void *v2;
  unint64_t v3;

  -[WiFiUsageSession lqm](self, "lqm");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "totalRxFrames");

  return v3;
}

- (unint64_t)totalTxFrames
{
  void *v2;
  unint64_t v3;

  -[WiFiUsageSession lqm](self, "lqm");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "totalTxFrames");

  return v3;
}

- (int64_t)averageCca
{
  void *v2;
  int64_t v3;

  -[WiFiUsageSession lqm](self, "lqm");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "avgTotalCca");

  return v3;
}

- (int64_t)averageRssi
{
  void *v2;
  int64_t v3;

  -[WiFiUsageSession lqm](self, "lqm");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "avgRssi");

  return v3;
}

- (int64_t)averageSnr
{
  void *v2;
  int64_t v3;

  -[WiFiUsageSession lqm](self, "lqm");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "avgSnr");

  return v3;
}

- (id)lastBssSessionInfo
{
  return -[WiFiUsageBssSession sessionInfo](self->_currentBssSession, "sessionInfo");
}

- (int64_t)lastRssi
{
  void *v2;
  int64_t v3;

  -[WiFiUsageSession lqm](self, "lqm");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lastRssi");

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL *p_isSessionActive;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  __int128 v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  void *v118;
  uint64_t v119;
  void *v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  uint64_t v137;
  void *v138;
  WiFiUsageNetworkDetails *networkDetailsAtEnd;
  WiFiUsageNetworkDetails *v140;
  uint64_t v141;
  NSDate *lastNetwork6eDisableModeChangedTime;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;

  p_isSessionActive = &self->_isSessionActive;
  v5 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSessionType:andInterfaceName:andCapabilities:", self->_type, self->_interfaceName, self->_capabilities);
  objc_msgSend((id)v5, "setCompletionQueue:", self->_completionQueue);
  objc_msgSend((id)v5, "setCompletionContext:", self->_completionContext);
  objc_msgSend((id)v5, "setCompletionHandler:", self->_completionHandler);
  objc_storeStrong((id *)(v5 + 9152), self->_ca_config);
  objc_msgSend((id)v5, "setSessionStartTime:", self->_sessionStartTime);
  objc_msgSend((id)v5, "setSessionEndTime:", self->_sessionEndTime);
  v6 = -[WiFiUsageBssSession copy](self->_currentBssSession, "copy");
  v7 = *(void **)(v5 + 9104);
  *(_QWORD *)(v5 + 9104) = v6;

  *(_BYTE *)(v5 + 9020) = p_isSessionActive[4];
  *(_BYTE *)(v5 + 9021) = p_isSessionActive[5];
  *(_BYTE *)(v5 + 9022) = p_isSessionActive[6];
  *(_BYTE *)(v5 + 9023) = p_isSessionActive[7];
  *(_QWORD *)(v5 + 9136) = self->_driverUnavailabilityCount;
  *(_QWORD *)(v5 + 10776) = self->_lastThermalIndex;
  *(_QWORD *)(v5 + 10768) = self->_lastPowerBudget;
  v8 = -[NSMutableSet copy](self->_activeApplications, "copy");
  v9 = *(void **)(v5 + 10760);
  *(_QWORD *)(v5 + 10760) = v8;

  v10 = -[WiFiUsageSessionLQM copy](self->_lqm, "copy");
  v11 = *(void **)(v5 + 10752);
  *(_QWORD *)(v5 + 10752) = v10;

  *(_QWORD *)(v5 + 10608) = self->_triggerDisconnectAlertedCount;
  *(_QWORD *)(v5 + 10616) = self->_triggerDisconnectConfirmedCount;
  *(_QWORD *)(v5 + 10624) = self->_triggerDisconnectExecutedCount;
  *(_QWORD *)(v5 + 10576) = self->_netInterfaceTxBytes;
  *(_QWORD *)(v5 + 10584) = self->_netInterfaceRxBytes;
  *(_QWORD *)(v5 + 10592) = self->_secondaryInterfaceTxBytes;
  *(_QWORD *)(v5 + 10600) = self->_secondaryInterfaceRxBytes;
  v12 = -[WiFiUsageInterfaceStats copy](self->_ifStatsAtStart, "copy");
  v13 = *(void **)(v5 + 10560);
  *(_QWORD *)(v5 + 10560) = v12;

  v14 = -[WiFiUsageInterfaceStats copy](self->_secondaryIfStatsAtStart, "copy");
  v15 = *(void **)(v5 + 10568);
  *(_QWORD *)(v5 + 10568) = v14;

  *(_QWORD *)(v5 + 10544) = self->_neighborBssCount;
  *(_QWORD *)(v5 + 10552) = self->_otherBssCount;
  *(_QWORD *)(v5 + 10368) = self->_systemWakeStateChangedCount;
  *(_QWORD *)(v5 + 10376) = self->_systemWokenByWiFiCount;
  *(_QWORD *)(v5 + 10384) = self->_lockStateChangedCount;
  *(_QWORD *)(v5 + 10392) = self->_displayStateChangedCount;
  *(_QWORD *)(v5 + 10400) = self->_networkChangedCount;
  *(_QWORD *)(v5 + 10408) = self->_joinStateChangedCount;
  *(_QWORD *)(v5 + 10424) = self->_linkStateChangedCount;
  *(_QWORD *)(v5 + 10432) = self->_applicationStateChangedCount;
  *(_QWORD *)(v5 + 10440) = self->_powerStateChangedCount;
  *(_QWORD *)(v5 + 10448) = self->_powerToggleEventCount;
  *(_QWORD *)(v5 + 10504) = self->_rapidLinkTransitionCount;
  *(_QWORD *)(v5 + 10512) = self->_primaryInterfaceStateChangeCount;
  *(_QWORD *)(v5 + 10480) = self->_controlCenterToggleEventCount;
  *(_QWORD *)(v5 + 10472) = self->_controlCenterStateChangedCount;
  *(_QWORD *)(v5 + 10488) = self->_cellularFallbackStateChangedCount;
  *(_QWORD *)(v5 + 10496) = self->_cellularOutrankingStateChangedCount;
  *(_QWORD *)(v5 + 10208) = self->_mediaPlaybackEventCount;
  *(_QWORD *)(v5 + 10216) = self->_chargingEventCount;
  *(_QWORD *)(v5 + 10224) = self->_inCallEventCount;
  *(_QWORD *)(v5 + 10240) = self->_inVehicleEventCount;
  *(_QWORD *)(v5 + 10248) = self->_inMotionEventCount;
  *(_QWORD *)(v5 + 10256) = self->_inA2dpEventCount;
  *(_QWORD *)(v5 + 10264) = self->_inScoEventCount;
  *(_QWORD *)(v5 + 10272) = self->_inHidPresentCount;
  *(_QWORD *)(v5 + 10280) = self->_inAwdlEventCount;
  *(_QWORD *)(v5 + 10288) = self->_inRoamEventCount;
  *(_QWORD *)(v5 + 10296) = self->_inScanEventCount;
  *(_QWORD *)(v5 + 10304) = self->_inSoftApEventCount;
  *(_QWORD *)(v5 + 10312) = self->_rangingEventCount;
  *(_QWORD *)(v5 + 10320) = self->_companionConnectionStateChangedCount;
  *(_QWORD *)(v5 + 10456) = self->_smartCoverStateChangedCount;
  v16 = -[NSString copy](self->_lastSmartCoverState, "copy");
  v17 = *(void **)(v5 + 10464);
  *(_QWORD *)(v5 + 10464) = v16;

  *(_QWORD *)(v5 + 10528) = self->_consecutiveJoinFailureCount;
  *(_QWORD *)(v5 + 10328) = self->_linkRecoveryDisabledCount;
  *(_BYTE *)(v5 + 9040) = p_isSessionActive[24];
  *(_BYTE *)(v5 + 9041) = p_isSessionActive[25];
  *(_BYTE *)(v5 + 9042) = p_isSessionActive[26];
  *(_BYTE *)(v5 + 9043) = p_isSessionActive[27];
  objc_storeStrong((id *)(v5 + 10928), self->_btAudioBand);
  *(_QWORD *)(v5 + 10336) = self->_wowStateChangedCount;
  *(_QWORD *)(v5 + 10344) = self->_lpasStateChangedCount;
  *(_QWORD *)(v5 + 10352) = self->_lowPowerStateChangedCount;
  *(_QWORD *)(v5 + 10360) = self->_batterySaverStateChangedCount;
  *(double *)(v5 + 10120) = self->_thermalIndexMaxDuration;
  *(double *)(v5 + 10128) = self->_thermalIndex90Duration;
  *(double *)(v5 + 10136) = self->_thermalIndex80Duration;
  *(double *)(v5 + 10144) = self->_thermalIndex70Duration;
  *(double *)(v5 + 10152) = self->_thermalIndex60Duration;
  *(double *)(v5 + 10160) = self->_thermalIndex50Duration;
  *(double *)(v5 + 10168) = self->_thermalIndex40Duration;
  *(double *)(v5 + 10176) = self->_thermalIndex30Duration;
  *(double *)(v5 + 10184) = self->_thermalIndex20Duration;
  *(double *)(v5 + 10192) = self->_thermalIndex10Duration;
  *(double *)(v5 + 10200) = self->_thermalIndexMinDuration;
  *(double *)(v5 + 10032) = self->_powerBudgetMaxDuration;
  *(double *)(v5 + 10040) = self->_powerBudget90Duration;
  *(double *)(v5 + 10048) = self->_powerBudget80Duration;
  *(double *)(v5 + 10056) = self->_powerBudget70Duration;
  *(double *)(v5 + 10064) = self->_powerBudget60Duration;
  *(double *)(v5 + 10072) = self->_powerBudget50Duration;
  *(double *)(v5 + 10080) = self->_powerBudget40Duration;
  *(double *)(v5 + 10088) = self->_powerBudget30Duration;
  *(double *)(v5 + 10096) = self->_powerBudget20Duration;
  *(double *)(v5 + 10104) = self->_powerBudget10Duration;
  *(double *)(v5 + 10112) = self->_powerBudgetMinDuration;
  *(_QWORD *)(v5 + 9768) = self->_roamReasonInitialAssociationCount;
  *(_QWORD *)(v5 + 9776) = self->_roamReasonLowRssiCount;
  *(_QWORD *)(v5 + 9784) = self->_roamReasonDeauthDisassocCount;
  *(_QWORD *)(v5 + 9792) = self->_roamReasonBeaconLostCount;
  *(_QWORD *)(v5 + 9800) = self->_roamReasonSteeredByApCount;
  *(_QWORD *)(v5 + 9808) = self->_roamReasonSteeredByBtmCount;
  *(_QWORD *)(v5 + 9816) = self->_roamReasonSteeredByCsaCount;
  *(_QWORD *)(v5 + 9824) = self->_roamReasonReassocRequestedCount;
  *(_QWORD *)(v5 + 9832) = self->_roamReasonHostTriggeredCount;
  *(_QWORD *)(v5 + 9840) = self->_roamReasonBetterCandidateCount;
  *(_QWORD *)(v5 + 9848) = self->_roamReasonBetterConditionCount;
  *(_QWORD *)(v5 + 9856) = self->_roamReasonMiscCount;
  *(_QWORD *)(v5 + 9864) = self->_roamStatusSucceededCount;
  *(_QWORD *)(v5 + 9872) = self->_roamStatusFailedCount;
  *(_QWORD *)(v5 + 9880) = self->_roamStatusNoCandidateCount;
  *(_QWORD *)(v5 + 9888) = self->_roamStatusNoQualifiedCandidateCount;
  *(_QWORD *)(v5 + 9896) = self->_roamStatusFailedNoScan;
  *(_QWORD *)(v5 + 9904) = self->_roamIsWNMScoreUsedCount;
  *(_QWORD *)(v5 + 9912) = self->_roamPingPongAboveThresholdCount;
  *(_QWORD *)(v5 + 9920) = self->_roamPingPongAboveThresholdCountLowRssiOnly;
  *(_QWORD *)(v5 + 9928) = self->_roamPingPongLowRssiAndReassocOnly;
  *(_QWORD *)(v5 + 9936) = self->_roamPingPongReassocOnly;
  *(_BYTE *)(v5 + 9033) = p_isSessionActive[17];
  v18 = -[NSDate copy](self->_lastRoamSuppressionToggled, "copy");
  v19 = *(void **)(v5 + 9944);
  *(_QWORD *)(v5 + 9944) = v18;

  *(double *)(v5 + 9960) = self->_inRoamSuppressionEnabled;
  *(double *)(v5 + 9968) = self->_inRoamSuppressionWaitForRoamStart;
  *(double *)(v5 + 9976) = self->_inRoamSuppressionWaitForRoamEnd;
  *(_QWORD *)(v5 + 9984) = self->_minCandidatesCount;
  *(_QWORD *)(v5 + 9992) = self->_maxCandidatesCount;
  *(_QWORD *)(v5 + 10000) = self->_currentRSSIStrongestCount;
  v20 = -[NSMutableDictionary copy](self->_roamNeighborsByBand, "copy");
  v21 = *(void **)(v5 + 10008);
  *(_QWORD *)(v5 + 10008) = v20;

  v22 = *(_OWORD *)&self->_strongestRSSICountByBand.valueByBand[2];
  *(_OWORD *)(v5 + 11512) = *(_OWORD *)self->_strongestRSSICountByBand.valueByBand;
  *(_OWORD *)(v5 + 11528) = v22;
  v23 = *(_OWORD *)&self->_strongestRSSIByBand.valueByBand[2];
  *(_OWORD *)(v5 + 11544) = *(_OWORD *)self->_strongestRSSIByBand.valueByBand;
  *(_OWORD *)(v5 + 11560) = v23;
  v25 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[2][0];
  v24 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[2][2];
  v26 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[1][1];
  *(_QWORD *)(v5 + 11656) = *(_QWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valid[2][2];
  *(_OWORD *)(v5 + 11624) = v25;
  *(_OWORD *)(v5 + 11640) = v24;
  *(_OWORD *)(v5 + 11608) = v26;
  v27 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[0][2];
  *(_OWORD *)(v5 + 11576) = *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[0][0];
  *(_OWORD *)(v5 + 11592) = v27;
  v28 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[2][0];
  v29 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[2][2];
  v30 = *(_QWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valid[2][2];
  *(_OWORD *)(v5 + 11696) = *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[1][1];
  *(_QWORD *)(v5 + 11744) = v30;
  *(_OWORD *)(v5 + 11728) = v29;
  *(_OWORD *)(v5 + 11712) = v28;
  v31 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[0][0];
  *(_OWORD *)(v5 + 11680) = *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[0][2];
  *(_OWORD *)(v5 + 11664) = v31;
  v32 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[0][2];
  *(_OWORD *)(v5 + 11752) = *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[0][0];
  *(_OWORD *)(v5 + 11768) = v32;
  v33 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[1][1];
  v34 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[2][0];
  v35 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[2][2];
  *(_QWORD *)(v5 + 11832) = *(_QWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valid[2][2];
  *(_OWORD *)(v5 + 11800) = v34;
  *(_OWORD *)(v5 + 11816) = v35;
  *(_OWORD *)(v5 + 11784) = v33;
  v36 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[0][0];
  *(_OWORD *)(v5 + 11856) = *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[0][2];
  *(_OWORD *)(v5 + 11840) = v36;
  v37 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[1][1];
  v38 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[2][0];
  v39 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[2][2];
  *(_QWORD *)(v5 + 11920) = *(_QWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valid[2][2];
  *(_OWORD *)(v5 + 11904) = v39;
  *(_OWORD *)(v5 + 11888) = v38;
  *(_OWORD *)(v5 + 11872) = v37;
  v40 = -[NSMutableDictionary copy](self->_roamCandidatesPerBandWhenSuccessful, "copy");
  v41 = *(void **)(v5 + 10016);
  *(_QWORD *)(v5 + 10016) = v40;

  v42 = -[NSMutableDictionary copy](self->_roamCandidatesPerBandWhenUnSuccessful, "copy");
  v43 = *(void **)(v5 + 10024);
  *(_QWORD *)(v5 + 10024) = v42;

  *(double *)(v5 + 9080) = self->_sessionDuration;
  *(double *)(v5 + 9520) = self->_systemAwakeDuration;
  *(double *)(v5 + 9528) = self->_mediaPlaybackDuration;
  *(double *)(v5 + 9536) = self->_chargingDuration;
  *(double *)(v5 + 9552) = self->_inCallDuration;
  *(double *)(v5 + 9568) = self->_inVehicleDuration;
  *(double *)(v5 + 9576) = self->_inMotionDuration;
  *(double *)(v5 + 9584) = self->_inA2dpDuration;
  *(double *)(v5 + 9592) = self->_inScoDuration;
  *(double *)(v5 + 9600) = self->_inHidPresentDuration;
  *(double *)(v5 + 9608) = self->_inAwdlDuration;
  *(double *)(v5 + 9616) = self->_inRoamDuration;
  *(double *)(v5 + 9624) = self->_inScanDuration;
  *(double *)(v5 + 9632) = self->_inSoftApDuration;
  *(double *)(v5 + 9640) = self->_poweredOnDuration;
  *(double *)(v5 + 9648) = self->_associatedDuration;
  *(_BYTE *)(v5 + 9018) = p_isSessionActive[2];
  *(double *)(v5 + 9656) = self->_associatedSleepDuration;
  *(double *)(v5 + 9664) = self->_inCellularFallbackDuration;
  *(double *)(v5 + 9672) = self->_inCellularOutrankingDuration;
  v44 = *(_OWORD *)&self->_bandUsageDuration.valueByBand[2];
  *(_OWORD *)(v5 + 11480) = *(_OWORD *)self->_bandUsageDuration.valueByBand;
  *(_OWORD *)(v5 + 11496) = v44;
  *(double *)(v5 + 9680) = self->_inControlCenterAutoJoinDisabledDuration;
  *(double *)(v5 + 9544) = self->_companionConnectedDuration;
  *(double *)(v5 + 9696) = self->_linkRecoveryDisabledDuration;
  *(double *)(v5 + 10744) = self->_longestUnassociatedDuration;
  *(double *)(v5 + 9704) = self->_inWowStateDuration;
  *(double *)(v5 + 9712) = self->_inLpasStateDuration;
  *(double *)(v5 + 9720) = self->_inLowPowerStateDuration;
  *(double *)(v5 + 9728) = self->_inBatterySaverStateDuration;
  *(double *)(v5 + 9736) = self->_sleepPowerStatsTotalDuration;
  *(double *)(v5 + 9744) = self->_sleepPowerStatsUnassociatedDuration;
  *(double *)(v5 + 9752) = self->_sleepPowerStatsAssociatedDuration;
  *(double *)(v5 + 9760) = self->_sleepPowerStatsRoamingDuration;
  v45 = -[NSDate copy](self->_sessionInitTime, "copy");
  v46 = *(void **)(v5 + 9248);
  *(_QWORD *)(v5 + 9248) = v45;

  v47 = -[NSDate copy](self->_sessionStartTime, "copy");
  v48 = *(void **)(v5 + 9256);
  *(_QWORD *)(v5 + 9256) = v47;

  v49 = -[NSDate copy](self->_sessionEndTime, "copy");
  v50 = *(void **)(v5 + 9264);
  *(_QWORD *)(v5 + 9264) = v49;

  v51 = -[NSDate copy](self->_mediaStartedTime, "copy");
  v52 = *(void **)(v5 + 9272);
  *(_QWORD *)(v5 + 9272) = v51;

  v53 = -[NSDate copy](self->_chargingStartedTime, "copy");
  v54 = *(void **)(v5 + 9280);
  *(_QWORD *)(v5 + 9280) = v53;

  v55 = -[NSDate copy](self->_companionConnectionTime, "copy");
  v56 = *(void **)(v5 + 9288);
  *(_QWORD *)(v5 + 9288) = v55;

  v57 = -[NSDate copy](self->_callStartedTime, "copy");
  v58 = *(void **)(v5 + 9296);
  *(_QWORD *)(v5 + 9296) = v57;

  v59 = -[NSDate copy](self->_inVehicleEntryTime, "copy");
  v60 = *(void **)(v5 + 9312);
  *(_QWORD *)(v5 + 9312) = v59;

  v61 = -[NSDate copy](self->_inMotionStartedTime, "copy");
  v62 = *(void **)(v5 + 9320);
  *(_QWORD *)(v5 + 9320) = v61;

  v63 = -[NSDate copy](self->_a2dpActiveTime, "copy");
  v64 = *(void **)(v5 + 9328);
  *(_QWORD *)(v5 + 9328) = v63;

  v65 = -[NSDate copy](self->_scoActiveTime, "copy");
  v66 = *(void **)(v5 + 9336);
  *(_QWORD *)(v5 + 9336) = v65;

  v67 = -[NSDate copy](self->_hidPresentTime, "copy");
  v68 = *(void **)(v5 + 9344);
  *(_QWORD *)(v5 + 9344) = v67;

  v69 = -[NSDate copy](self->_awdlActiveTime, "copy");
  v70 = *(void **)(v5 + 9352);
  *(_QWORD *)(v5 + 9352) = v69;

  v71 = -[NSDate copy](self->_roamingActiveTime, "copy");
  v72 = *(void **)(v5 + 9360);
  *(_QWORD *)(v5 + 9360) = v71;

  v73 = -[NSDate copy](self->_scanningActiveTime, "copy");
  v74 = *(void **)(v5 + 9368);
  *(_QWORD *)(v5 + 9368) = v73;

  v75 = -[NSDate copy](self->_softApActiveTime, "copy");
  v76 = *(void **)(v5 + 9376);
  *(_QWORD *)(v5 + 9376) = v75;

  v77 = -[NSDate copy](self->_lastPowerStateChangedTime, "copy");
  v78 = *(void **)(v5 + 9384);
  *(_QWORD *)(v5 + 9384) = v77;

  v79 = -[NSDate copy](self->_lastCellularFallbackStateChangedTime, "copy");
  v80 = *(void **)(v5 + 9400);
  *(_QWORD *)(v5 + 9400) = v79;

  v81 = -[NSDate copy](self->_lastCellularOutrankingStateChangedTime, "copy");
  v82 = *(void **)(v5 + 9408);
  *(_QWORD *)(v5 + 9408) = v81;

  v83 = -[NSDate copy](self->_lastControlCenterStateChangedTime, "copy");
  v84 = *(void **)(v5 + 9392);
  *(_QWORD *)(v5 + 9392) = v83;

  v85 = -[NSDate copy](self->_lastSystemWakeTime, "copy");
  v86 = *(void **)(v5 + 9416);
  *(_QWORD *)(v5 + 9416) = v85;

  v87 = -[NSDate copy](self->_lastSystemSleepTime, "copy");
  v88 = *(void **)(v5 + 9424);
  *(_QWORD *)(v5 + 9424) = v87;

  v89 = -[NSDate copy](self->_lastUnexpectedLinkDownTime, "copy");
  v90 = *(void **)(v5 + 9432);
  *(_QWORD *)(v5 + 9432) = v89;

  v91 = -[NSDate copy](self->_lastLinkStateChangedTime, "copy");
  v92 = *(void **)(v5 + 9440);
  *(_QWORD *)(v5 + 9440) = v91;

  v93 = -[NSDate copy](self->_lastPowerBudgetChangedTime, "copy");
  v94 = *(void **)(v5 + 9448);
  *(_QWORD *)(v5 + 9448) = v93;

  v95 = -[NSDate copy](self->_lastBssChangedTime, "copy");
  v96 = *(void **)(v5 + 9456);
  *(_QWORD *)(v5 + 9456) = v95;

  v97 = -[NSDate copy](self->_linkRecoveryDisabledTime, "copy");
  v98 = *(void **)(v5 + 9472);
  *(_QWORD *)(v5 + 9472) = v97;

  *(_BYTE *)(v5 + 9030) = p_isSessionActive[14];
  v99 = -[NSDate copy](self->_wowStateEntryTime, "copy");
  v100 = *(void **)(v5 + 9480);
  *(_QWORD *)(v5 + 9480) = v99;

  v101 = -[NSDate copy](self->_lpasStateEntryTime, "copy");
  v102 = *(void **)(v5 + 9488);
  *(_QWORD *)(v5 + 9488) = v101;

  v103 = -[NSDate copy](self->_lowPowerStateEntryTime, "copy");
  v104 = *(void **)(v5 + 9496);
  *(_QWORD *)(v5 + 9496) = v103;

  v105 = -[NSDate copy](self->_batterySaverStateEntryTime, "copy");
  v106 = *(void **)(v5 + 9504);
  *(_QWORD *)(v5 + 9504) = v105;

  *(_QWORD *)(v5 + 9184) = self->_lastJoinReason;
  *(_QWORD *)(v5 + 9192) = self->_lastJoinFailure;
  *(_QWORD *)(v5 + 9200) = self->_lastDisconnectReason;
  *(_QWORD *)(v5 + 9208) = self->_lastDisconnectSubreason;
  *(_QWORD *)(v5 + 9216) = self->_previousDisconnectReason;
  *(_QWORD *)(v5 + 10416) = self->_savedJoinStateChangedCount;
  *(_QWORD *)(v5 + 9224) = self->_savedLastJoinReason;
  *(_QWORD *)(v5 + 9232) = self->_savedLastJoinFailure;
  *(_QWORD *)(v5 + 9240) = self->_savedPreviousDisconnectReason;
  *(_BYTE *)(v5 + 9032) = p_isSessionActive[16];
  v107 = -[NSString copy](self->_secondaryInterfaceName, "copy");
  v108 = *(void **)(v5 + 9144);
  *(_QWORD *)(v5 + 9144) = v107;

  *(_BYTE *)(v5 + 9016) = *p_isSessionActive;
  *(_BYTE *)(v5 + 9024) = p_isSessionActive[8];
  *(_BYTE *)(v5 + 9025) = p_isSessionActive[9];
  *(_BYTE *)(v5 + 9026) = p_isSessionActive[10];
  *(_BYTE *)(v5 + 9027) = p_isSessionActive[11];
  *(_QWORD *)(v5 + 9168) = self->_sessionPid;
  v109 = -[NSDate copy](self->_processInitTime, "copy");
  v110 = *(void **)(v5 + 9120);
  *(_QWORD *)(v5 + 9120) = v109;

  v111 = -[NSString copy](self->_cellularDataStatus, "copy");
  v112 = *(void **)(v5 + 9160);
  *(_QWORD *)(v5 + 9160) = v111;

  *(_BYTE *)(v5 + 9031) = p_isSessionActive[15];
  *(_QWORD *)(v5 + 10536) = self->_airplaneModeStateChangedCount;
  v113 = -[NSString copy](self->_lastDriverUnavailableReason, "copy");
  v114 = *(void **)(v5 + 10656);
  *(_QWORD *)(v5 + 10656) = v113;

  v115 = -[NSDate copy](self->_lastDriverTerminationTime, "copy");
  v116 = *(void **)(v5 + 10632);
  *(_QWORD *)(v5 + 10632) = v115;

  v117 = -[NSDate copy](self->_lastChipResetTime, "copy");
  v118 = *(void **)(v5 + 10640);
  *(_QWORD *)(v5 + 10640) = v117;

  v119 = -[NSDate copy](self->_lastDriverAvailableTime, "copy");
  v120 = *(void **)(v5 + 10648);
  *(_QWORD *)(v5 + 10648) = v119;

  *(double *)(v5 + 10664) = self->_driverProcessLifespan;
  *(double *)(v5 + 10672) = self->_driverAvailabilityLifespan;
  *(double *)(v5 + 10688) = self->_driverAvailabilityLatencyFromTermination;
  *(double *)(v5 + 10696) = self->_joinScanLatencyFromDriverAvailability;
  *(double *)(v5 + 10704) = self->_joinStartedLatencyFromDriverAvailability;
  *(double *)(v5 + 10712) = self->_joinLinkUpLatencyFromDriverAvailability;
  *(double *)(v5 + 10720) = self->_joinIpConfigurationLatencyFromDriverAvailability;
  *(double *)(v5 + 10728) = self->_joinInterfaceRankingLatencyFromDriverAvailability;
  *(double *)(v5 + 10736) = self->_joinLinkUpLatencyFromSessionStart;
  v121 = *(_OWORD *)self->_perClientScanCount;
  *(_OWORD *)(v5 + 24) = *(_OWORD *)&self->_perClientScanCount[2];
  *(_OWORD *)(v5 + 8) = v121;
  v122 = *(_OWORD *)&self->_perClientScanCount[4];
  v123 = *(_OWORD *)&self->_perClientScanCount[6];
  v124 = *(_OWORD *)&self->_perClientScanCount[8];
  *(_OWORD *)(v5 + 88) = *(_OWORD *)&self->_perClientScanCount[10];
  *(_OWORD *)(v5 + 72) = v124;
  *(_OWORD *)(v5 + 56) = v123;
  *(_OWORD *)(v5 + 40) = v122;
  v125 = *(_OWORD *)&self->_perClientScanCount[12];
  v126 = *(_OWORD *)&self->_perClientScanCount[14];
  v127 = *(_OWORD *)&self->_perClientScanCount[16];
  *(_OWORD *)(v5 + 152) = *(_OWORD *)&self->_perClientScanCount[18];
  *(_OWORD *)(v5 + 136) = v127;
  *(_OWORD *)(v5 + 120) = v126;
  *(_OWORD *)(v5 + 104) = v125;
  v128 = *(_OWORD *)&self->_perClientScanCount[20];
  v129 = *(_OWORD *)&self->_perClientScanCount[22];
  v130 = *(_OWORD *)&self->_perClientScanCount[24];
  *(_QWORD *)(v5 + 216) = self->_perClientScanCount[26];
  *(_OWORD *)(v5 + 200) = v130;
  *(_OWORD *)(v5 + 184) = v129;
  *(_OWORD *)(v5 + 168) = v128;
  memcpy((void *)(v5 + 224), self->_faultReasonCount, 0x110uLL);
  v131 = *(_OWORD *)&self->_joinReasonCount[6];
  v133 = *(_OWORD *)self->_joinReasonCount;
  v132 = *(_OWORD *)&self->_joinReasonCount[2];
  *(_OWORD *)(v5 + 528) = *(_OWORD *)&self->_joinReasonCount[4];
  *(_OWORD *)(v5 + 544) = v131;
  *(_OWORD *)(v5 + 496) = v133;
  *(_OWORD *)(v5 + 512) = v132;
  v135 = *(_OWORD *)&self->_joinReasonCount[10];
  v134 = *(_OWORD *)&self->_joinReasonCount[12];
  v136 = *(_OWORD *)&self->_joinReasonCount[8];
  *(_QWORD *)(v5 + 608) = self->_joinReasonCount[14];
  *(_OWORD *)(v5 + 576) = v135;
  *(_OWORD *)(v5 + 592) = v134;
  *(_OWORD *)(v5 + 560) = v136;
  v137 = -[NSMutableDictionary mutableCopy](self->_disconnectReasonMap, "mutableCopy");
  v138 = *(void **)(v5 + 9008);
  *(_QWORD *)(v5 + 9008) = v137;

  *(_BYTE *)(v5 + 9028) = p_isSessionActive[12];
  *(_BYTE *)(v5 + 9029) = p_isSessionActive[13];
  *(_QWORD *)(v5 + 10520) = self->_compatibilityModeChangeCount;
  objc_storeStrong((id *)(v5 + 9464), self->_lastCompatibilityModeChangedTime);
  *(double *)(v5 + 9688) = self->_inCompatibilityModeEnabledDuration;
  *(_DWORD *)(v5 + 9060) = self->_bandAtSessionStart;
  *(_BYTE *)(v5 + 9034) = p_isSessionActive[18];
  *(_QWORD *)(v5 + 10784) = self->_rssiAtSessionStart;
  *(double *)(v5 + 9512) = self->_sessionTimeSinceLastSession;
  networkDetailsAtEnd = self->_networkDetailsAtEnd;
  v140 = networkDetailsAtEnd;
  if (!networkDetailsAtEnd)
    v140 = (WiFiUsageNetworkDetails *)-[WiFiUsageNetworkDetails copy](self->_networkDetails, "copy");
  objc_storeStrong((id *)(v5 + 9096), v140);
  if (!networkDetailsAtEnd)

  v141 = 10816;
  if (!self->_networkDetailsAtEnd)
    v141 = 10808;
  objc_storeStrong((id *)(v5 + 10808), *(id *)((char *)&self->super.isa + v141));
  if (self->_networkDetailsAtEnd)
    lastNetwork6eDisableModeChangedTime = 0;
  else
    lastNetwork6eDisableModeChangedTime = self->_lastNetwork6eDisableModeChangedTime;
  objc_storeStrong((id *)(v5 + 10824), lastNetwork6eDisableModeChangedTime);
  v143 = 10840;
  if (!self->_networkDetailsAtEnd)
    v143 = 10832;
  *(_QWORD *)(v5 + 10832) = *(Class *)((char *)&self->super.isa + v143);
  v144 = 10800;
  if (!self->_networkDetailsAtEnd)
    v144 = 10792;
  *(_QWORD *)(v5 + 10792) = *(Class *)((char *)&self->super.isa + v144);
  objc_storeStrong((id *)(v5 + 10864), self->_ipV4DetailsPrevSession);
  *(_BYTE *)(v5 + 9035) = p_isSessionActive[19];
  objc_storeStrong((id *)(v5 + 10872), self->_ipV6DetailsPrevSession);
  *(_BYTE *)(v5 + 9036) = p_isSessionActive[20];
  *(_BYTE *)(v5 + 9037) = p_isSessionActive[21];
  v145 = -[NSMutableArray copy](self->_prevNetworkNames, "copy");
  v146 = *(void **)(v5 + 10896);
  *(_QWORD *)(v5 + 10896) = v145;

  *(_BYTE *)(v5 + 9039) = p_isSessionActive[23];
  *(_BYTE *)(v5 + 9038) = p_isSessionActive[22];
  *(_QWORD *)(v5 + 10904) = self->_prevJoinReason;
  *(double *)(v5 + 10920) = self->_timeSincePrevJoin;
  objc_storeStrong((id *)(v5 + 10880), self->_lastCoexRealTimeOn);
  objc_storeStrong((id *)(v5 + 10888), self->_lastCoexRealTimeOff);
  *(_BYTE *)(v5 + 9047) = p_isSessionActive[31];
  *(_QWORD *)(v5 + 11000) = self->_savedPrevJoinReason;
  *(double *)(v5 + 11016) = self->_savedTimeSincePrevJoin;
  *(_QWORD *)(v5 + 10936) = self->_countRoamScan;
  *(_BYTE *)(v5 + 9044) = p_isSessionActive[28];
  *(_QWORD *)(v5 + 10944) = self->_countSSIDTransitionTargetInLastRoamScan;
  *(_QWORD *)(v5 + 10952) = self->_countRoamScanThatFoundSSIDTransitionTarget;
  *(_BYTE *)(v5 + 9045) = p_isSessionActive[29];
  *(_QWORD *)(v5 + 10960) = self->_countSSIDTransitionPotentialCandidatesInLastRoamScan;
  *(_QWORD *)(v5 + 10968) = self->_countSSIDTransitionPotentialCandidatesInLastRoamScanNotInTransitionableSet;
  *(_BYTE *)(v5 + 9046) = p_isSessionActive[30];
  *(_QWORD *)(v5 + 10984) = self->_lastRoamScanUniqueChannelsCount;
  *(_QWORD *)(v5 + 10992) = self->_lastRoamScanUniqueBandsCount;
  *(_QWORD *)(v5 + 10976) = self->_countRoamScanThatFoundSSIDTransitionPotentialCandidate;
  *(_QWORD *)(v5 + 11024) = self->_inPoorLinkSessionCount;
  *(double *)(v5 + 11032) = self->_inPoorLinkSessionDuration;
  *(_QWORD *)(v5 + 11040) = self->_tdAfterJoinAfterTDCount;
  *(_QWORD *)(v5 + 11056) = self->_min_subsequentTdAfterJoinAfterTDCount;
  *(_QWORD *)(v5 + 11064) = self->_max_subsequentTdAfterJoinAfterTDCount;
  *(_QWORD *)(v5 + 11072) = self->_tdSessionStartedByBadRSSICount;
  *(_QWORD *)(v5 + 11080) = self->_tdSessionStartedByTDRecommendedCount;
  *(_QWORD *)(v5 + 11088) = self->_tdSessionStartedBySymptomDNSFailureCount;
  *(_QWORD *)(v5 + 11096) = self->_tdEvalEndedCount;
  *(double *)(v5 + 11104) = self->_tdEvalCumulativeDuration;
  *(_QWORD *)(v5 + 11112) = self->_tdEvalStartedCount;
  *(_QWORD *)(v5 + 11120) = self->_tdEvalStartedByBadRSSICount;
  *(_QWORD *)(v5 + 11128) = self->_tdEvalStartedBySymptomsARPFailureCount;
  *(_QWORD *)(v5 + 11136) = self->_tdEvalStartedBySymptomsDNSFailCount;
  *(_QWORD *)(v5 + 11144) = self->_tdEvalStartedBySymptomsShortFlowCount;
  *(_QWORD *)(v5 + 11160) = self->_tdEvalStartedBySymptomsDataStallCount;
  *(_QWORD *)(v5 + 11168) = self->_tdEvalStartedBySymptomsDNSStallCount;
  *(_QWORD *)(v5 + 11136) = self->_tdEvalStartedBySymptomsDNSFailCount;
  *(_QWORD *)(v5 + 11176) = self->_tdEvalStartedByActiveProbingCount;
  *(_QWORD *)(v5 + 11184) = self->_tdEvalStartedByFGNetwAppChangeCount;
  *(_QWORD *)(v5 + 11192) = self->_tdEvalStartedByUserNotificationCount;
  *(_QWORD *)(v5 + 11200) = self->_tdEvalStartedByCheckReassocCount;
  objc_storeStrong((id *)(v5 + 11216), self->_lastUsbStatusChange);
  *(_BYTE *)(v5 + 9050) = p_isSessionActive[34];
  *(_QWORD *)(v5 + 11208) = self->_usbDeviceEventCount;
  *(double *)(v5 + 11224) = self->_usbInsertedDuration;
  objc_storeStrong((id *)(v5 + 11232), self->_lastAWDLSequenceUpdate);
  *(_QWORD *)(v5 + 11240) = self->_inAWDL_BestInfraScore;
  *(_QWORD *)(v5 + 11248) = self->_inAWDL_WorstInfraScore;
  *(double *)(v5 + 11256) = self->_inAWDL_BestP2PScore;
  *(double *)(v5 + 11264) = self->_inAWDL_WorstP2PScore;
  *(_QWORD *)(v5 + 11272) = self->_inAWDL_lastInfraScore;
  *(double *)(v5 + 11280) = self->_inAWDL_lastP2PScore;
  *(double *)(v5 + 11288) = self->_inAWDL_BestInfraScoreDuration;
  *(double *)(v5 + 11296) = self->_inAWDL_BestP2PScoreDuration;
  *(double *)(v5 + 11304) = self->_inAWDL_WorstInfraScoreDuration;
  *(double *)(v5 + 11312) = self->_inAWDL_WorstP2PScoreDuration;
  *(_QWORD *)(v5 + 11320) = self->_forwardedBssInwakeCount;
  *(_QWORD *)(v5 + 11328) = self->_forwardedBssInSleepCount;
  *(_QWORD *)(v5 + 11336) = self->_hostScanTriggersCount;
  *(_QWORD *)(v5 + 11344) = self->_roamScanTriggersCount;
  *(_QWORD *)(v5 + 11352) = self->_pnoScanTriggersCount;
  *(_QWORD *)(v5 + 11360) = self->_epnoScanTriggersCount;
  *(_QWORD *)(v5 + 11368) = self->_currentBssMsgInWakeCount;
  *(_QWORD *)(v5 + 11376) = self->_currentBssMsgInSleepCount;
  *(_QWORD *)(v5 + 11384) = self->_scanDataMsgInWakeCount;
  *(_QWORD *)(v5 + 11392) = self->_scanDataMsgInSleepCount;
  *(_QWORD *)(v5 + 11400) = self->_spmiMsgInAwakeCount;
  *(_QWORD *)(v5 + 11408) = self->_spmiMsgInSleepCount;
  *(_QWORD *)(v5 + 11416) = self->_spmiMsgDropRssiFilterCount;
  *(_QWORD *)(v5 + 11424) = self->_spmiMsgDropMaxFilterCount;
  *(_QWORD *)(v5 + 11432) = self->_spmiMsgDropSpmiFailCount;
  *(_QWORD *)(v5 + 11440) = self->_bssDropLowMemoryCount;
  *(_DWORD *)(v5 + 9064) = self->_maxPhyMode;
  *(_BYTE *)(v5 + 9051) = p_isSessionActive[35];
  *(_BYTE *)(v5 + 9052) = p_isSessionActive[36];
  return (id)v5;
}

- (unint64_t)faultReasonCount:(unint64_t)a3
{
  if (a3 - 1 > 0x20)
    return 0;
  else
    return self->_faultReasonCount[a3];
}

- (id)metricName
{
  return 0;
}

- (void)enableXCTestNotifications
{
  self->_xctest = 1;
}

- (void)receivedBssTransitionRequestWithCandidateListIncluded:(BOOL)a3 isAbridged:(BOOL)a4 disassociationImminent:(BOOL)a5 bssTerminationIncluded:(BOOL)a6 essDisassociationImminent:(BOOL)a7
{
  -[WiFiUsageBssSession receivedBssTransitionRequestWithCandidateListIncluded:isAbridged:disassociationImminent:bssTerminationIncluded:essDisassociationImminent:](self->_currentBssSession, "receivedBssTransitionRequestWithCandidateListIncluded:isAbridged:disassociationImminent:bssTerminationIncluded:essDisassociationImminent:", a3, a4, a5, a6, a7);
}

- (void)sentBssTransitionResponseWithStatus:(int64_t)a3 terminationDelayRequested:(BOOL)a4
{
  -[WiFiUsageBssSession sentBssTransitionResponseWithStatus:terminationDelayRequested:](self->_currentBssSession, "sentBssTransitionResponseWithStatus:terminationDelayRequested:", a3, a4);
}

- (void)processIPv4Changes:(id)a3
{
  id v4;
  void *v5;
  int v6;
  BOOL v7;
  int v8;
  id v9;

  v4 = a3;
  v5 = v4;
  v9 = v4;
  if (v4 && self->_ipV4DetailsPrevSession)
  {
    v6 = objc_msgSend(v4, "isValid");
    v5 = v9;
    if (v6)
    {
      v7 = -[WiFiUsageNetworkIPv4Details isEqual:](self->_ipV4DetailsPrevSession, "isEqual:", v9);
      v5 = v9;
      self->_hasDifferentIpv4DetailsThanPrevSession = !v7;
    }
  }
  else if (!v4)
  {
    goto LABEL_8;
  }
  v8 = objc_msgSend(v5, "isValid");
  v5 = v9;
  if (v8)
  {
    -[WiFiUsageSession setIpV4Details:](self, "setIpV4Details:", v9);
    v5 = v9;
  }
LABEL_8:

}

- (void)processIPv6Changes:(id)a3
{
  id v4;
  void *v5;
  int v6;
  char v7;
  int v8;
  id v9;

  v4 = a3;
  v5 = v4;
  v9 = v4;
  if (v4 && self->_ipV6DetailsPrevSession)
  {
    v6 = objc_msgSend(v4, "isValid");
    v5 = v9;
    if (v6)
    {
      v7 = -[WiFiUsageNetworkIPv6Details isEqual:](self->_ipV6DetailsPrevSession, "isEqual:", v9);
      v5 = v9;
      self->_hasDifferentIpv6DetailsThanPrevSession = v7 ^ 1;
    }
  }
  else if (!v4)
  {
    goto LABEL_8;
  }
  v8 = objc_msgSend(v5, "isValid");
  v5 = v9;
  if (v8)
  {
    -[WiFiUsageSession setIpV6Details:](self, "setIpV6Details:", v9);
    v5 = v9;
  }
LABEL_8:

}

- (void)setRealtimeCoexStarted:(BOOL)a3 type:(unint64_t)a4 reasons:(id)a5
{
  _BOOL4 v5;
  BOOL *p_inCoexRealTime;
  _BOOL4 inCoexRealTime;
  NSDate *v10;
  NSDate *lastCoexRealTimeOn;
  NSDate *v12;
  NSDate *lastCoexRealTimeOff;
  id v14;

  v5 = a3;
  v14 = a5;
  p_inCoexRealTime = &self->_inCoexRealTime;
  inCoexRealTime = self->_inCoexRealTime;
  if (!self->_inCoexRealTime && v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v10 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastCoexRealTimeOn = self->_lastCoexRealTimeOn;
    self->_lastCoexRealTimeOn = v10;

    inCoexRealTime = *p_inCoexRealTime;
  }
  if (inCoexRealTime && !v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v12 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastCoexRealTimeOff = self->_lastCoexRealTimeOff;
    self->_lastCoexRealTimeOff = v12;

  }
  *p_inCoexRealTime = v5;

}

- (void)setAwdlSequence:(id)a3 infraScore:(unint64_t)a4 p2pScore:(double)a5
{
  NSDate *v8;
  unint64_t v9;
  NSDate *lastAWDLSequenceUpdate;

  objc_msgSend(MEMORY[0x1E0C99D68], "now", a3);
  v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
  if (self->_isAssociated)
    v9 = a4;
  else
    v9 = 0;
  -[WiFiUsageSession tallyInfraScoreDuration:until:](self, "tallyInfraScoreDuration:until:", v9, v8);
  -[WiFiUsageSession tallyP2PScoreDuration:until:](self, "tallyP2PScoreDuration:until:", v8, a5);
  lastAWDLSequenceUpdate = self->_lastAWDLSequenceUpdate;
  self->_lastAWDLSequenceUpdate = v8;

}

- (void)updateLinkRecoveryDisabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (!self->_linkRecoveryDisabled)
    {
      v8 = v5;
      -[WiFiUsageSession setLinkRecoveryDisabledTime:](self, "setLinkRecoveryDisabledTime:", v5);
      v6 = v8;
      ++self->_linkRecoveryDisabledCount;
    }
  }
  else if (self->_linkRecoveryDisabledTime)
  {
    v9 = v5;
    objc_msgSend(v5, "timeIntervalSinceDate:");
    self->_linkRecoveryDisabledDuration = v7 + self->_linkRecoveryDisabledDuration;
    -[WiFiUsageSession setLinkRecoveryDisabledTime:](self, "setLinkRecoveryDisabledTime:", 0);
    v6 = v9;
  }
  self->_linkRecoveryDisabled = v3;

}

- (BOOL)infraIsPartOfSplitSSID
{
  return -[WiFiUsageSession bandAtSessionStart](self, "bandAtSessionStart") == 2
      && -[WiFiUsageNetworkDetails isStandalone6E](self->_networkDetails, "isStandalone6E");
}

- (void)processDriverAvailability:(id)a3 available:(unint64_t)a4 version:(unint64_t)a5 flags:(unint64_t)a6 eventID:(unint64_t)a7 reason:(unint64_t)a8 subReason:(unint64_t)a9 minorReason:(unint64_t)a10 reasonString:(id)a11
{
  void *v13;
  _BOOL4 v14;
  unint64_t driverUnavailabilityCount;
  id v16;

  v16 = a11;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[WiFiUsageSession isDriverAvailable](self, "isDriverAvailable");
  if (a4)
  {
    if (!v14)
    {
      -[WiFiUsageSession setLastDriverAvailableTime:](self, "setLastDriverAvailableTime:", v13);
      if (self->_lastChipResetTime && self->_driverAvailabilityLatencyFromChipReset == 0.0)
      {
        objc_msgSend(v13, "timeIntervalSinceDate:");
        -[WiFiUsageSession setDriverAvailabilityLatencyFromChipReset:](self, "setDriverAvailabilityLatencyFromChipReset:");
      }
      if (self->_lastDriverTerminationTime && self->_driverAvailabilityLatencyFromTermination == 0.0)
      {
        objc_msgSend(v13, "timeIntervalSinceDate:");
        -[WiFiUsageSession setDriverAvailabilityLatencyFromTermination:](self, "setDriverAvailabilityLatencyFromTermination:");
      }
    }
  }
  else if (v14)
  {
    driverUnavailabilityCount = self->_driverUnavailabilityCount;
    if (!driverUnavailabilityCount)
    {
      -[WiFiUsageSession trackEventLatencies](self, "trackEventLatencies");
      driverUnavailabilityCount = self->_driverUnavailabilityCount;
    }
    self->_driverUnavailabilityCount = driverUnavailabilityCount + 1;
  }
  if (v16 && !self->_lastDriverUnavailableReason && objc_msgSend(v16, "length"))
    -[WiFiUsageSession setLastDriverUnavailableReason:](self, "setLastDriverUnavailableReason:", v16);
  -[WiFiUsageSession setIsDriverAvailable:](self, "setIsDriverAvailable:", a4 != 0);

}

- (void)ipConfigurationDidChangeWithMethod:(BOOL)a3 dhcpLeaseDuration:(double)a4 hasRoutableIpV4:(BOOL)a5 hasRoutableIpV6:(BOOL)a6
{
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0C99D68], "date", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_joinIpConfigurationLatencyFromDriverAvailability == 0.0
    && self->_lastDriverAvailableTime
    && (a5 || a6 || self->_lastInterfacePrimaryState))
  {
    v10 = v9;
    objc_msgSend(v9, "timeIntervalSinceDate:");
    -[WiFiUsageSession setJoinIpConfigurationLatencyFromDriverAvailability:](self, "setJoinIpConfigurationLatencyFromDriverAvailability:");
    v9 = v10;
  }

}

- (void)interfaceRankingDidChange:(BOOL)a3
{
  _BOOL8 v3;
  BOOL v5;
  id v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_joinInterfaceRankingLatencyFromDriverAvailability == 0.0)
  {
    if (self->_lastDriverAvailableTime)
      v5 = !v3;
    else
      v5 = 1;
    if (!v5)
    {
      objc_msgSend(v6, "timeIntervalSinceDate:");
      -[WiFiUsageSession setJoinInterfaceRankingLatencyFromDriverAvailability:](self, "setJoinInterfaceRankingLatencyFromDriverAvailability:");
    }
  }
  -[WiFiUsageSession setLastInterfacePrimaryState:](self, "setLastInterfacePrimaryState:", v3);

}

- (void)updateWithCompatibilityMode:(unsigned __int8)a3
{
  int v3;
  BOOL *p_isCompatibilityModeEnabled;
  int isCompatibilityModeEnabled;
  double v7;
  id v8;

  v3 = a3;
  p_isCompatibilityModeEnabled = &self->_isCompatibilityModeEnabled;
  isCompatibilityModeEnabled = self->_isCompatibilityModeEnabled;
  if (!a3 && self->_isCompatibilityModeEnabled)
  {
    -[NSDate timeIntervalSinceNow](self->_lastCompatibilityModeChangedTime, "timeIntervalSinceNow");
    self->_inCompatibilityModeEnabledDuration = self->_inCompatibilityModeEnabledDuration - v7;
    isCompatibilityModeEnabled = *p_isCompatibilityModeEnabled;
  }
  if (isCompatibilityModeEnabled != v3)
  {
    -[WiFiUsageSession setIsCompatibilityModeEnabled:](self, "setIsCompatibilityModeEnabled:", v3 != 0);
    ++self->_compatibilityModeChangeCount;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[WiFiUsageSession setLastCompatibilityModeChangedTime:](self, "setLastCompatibilityModeChangedTime:", v8);

  }
}

- (void)updateAssociatedNetworkDetails:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  id v18;

  v4 = a3;
  if (v4)
  {
    v18 = v4;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_networkDetails)
    {
      objc_msgSend(v18, "networkName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageNetworkDetails networkName](self->_networkDetails, "networkName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

      objc_msgSend(v18, "disable6eMode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        -[WiFiUsageSession update6eModeStats:](self, "update6eModeStats:", v9);
      else
        -[WiFiUsageSession summarizeAndReset6eModeStats:](self, "summarizeAndReset6eModeStats:", v9);
    }
    else
    {
      objc_msgSend(v18, "disable6eMode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageSession setNetworkDisable6eModeAtStart:](self, "setNetworkDisable6eModeAtStart:", v10);

      objc_msgSend(v18, "disable6eMode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        v11 = v5;
      else
        v11 = 0;
      -[WiFiUsageSession setLastNetwork6eDisableModeChangedTime:](self, "setLastNetwork6eDisableModeChangedTime:", v11);
    }

    if (!-[WiFiUsageSession isSessionActive](self, "isSessionActive") || !self->_networkDetails)
      goto LABEL_17;
    objc_msgSend(v18, "networkName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiUsageNetworkDetails networkName](self->_networkDetails, "networkName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqualToString:", v13) & 1) != 0)
    {
      -[WiFiUsageNetworkDetails connectedBss](self->_networkDetails, "connectedBss");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "band");
      objc_msgSend(v18, "connectedBss");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "band");

      if (v15 == v17)
      {
LABEL_17:
        -[WiFiUsageSession setNetworkDetails:](self, "setNetworkDetails:", v18);

        v4 = v18;
        goto LABEL_18;
      }
      -[WiFiUsageNetworkDetails connectedBss](self->_networkDetails, "connectedBss");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageSession updateBandUsageFor:With:](self, "updateBandUsageFor:With:", objc_msgSend(v12, "band"), v5);
    }
    else
    {

    }
    goto LABEL_17;
  }
LABEL_18:

}

- (void)update6eModeStats:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[WiFiUsageNetworkDetails disable6eMode](self->_networkDetails, "disable6eMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v14);

  if ((v5 & 1) == 0)
  {
    -[WiFiUsageNetworkDetails disable6eMode](self->_networkDetails, "disable6eMode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("off"));

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (self->_lastNetwork6eDisableModeChangedTime)
      {
        objc_msgSend(v8, "timeIntervalSinceDate:");
        self->_inNetwork6eModeOffDuration = v10 + self->_inNetwork6eModeOffDuration;
      }

    }
    -[WiFiUsageNetworkDetails disable6eMode](self->_networkDetails, "disable6eMode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      ++self->_network6eDisabledModeChangeCount;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageSession setLastNetwork6eDisableModeChangedTime:](self, "setLastNetwork6eDisableModeChangedTime:", v12);

    }
    else
    {
      -[WiFiUsageSession setLastNetwork6eDisableModeChangedTime:](self, "setLastNetwork6eDisableModeChangedTime:", self->_sessionStartTime);
    }
  }
  -[WiFiUsageSession networkDisable6eModeAtStart](self, "networkDisable6eModeAtStart");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    -[WiFiUsageSession setNetworkDisable6eModeAtStart:](self, "setNetworkDisable6eModeAtStart:", v14);

}

- (void)summarizeAndReset6eModeStats:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSDate *lastNetwork6eDisableModeChangedTime;
  double v8;
  id v9;
  id v10;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "now");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageNetworkDetails disable6eMode](self->_networkDetails, "disable6eMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("off")))
  {
    lastNetwork6eDisableModeChangedTime = self->_lastNetwork6eDisableModeChangedTime;

    if (lastNetwork6eDisableModeChangedTime)
    {
      objc_msgSend(v10, "timeIntervalSinceDate:", self->_lastNetwork6eDisableModeChangedTime);
      self->_inNetwork6eModeOffDuration = v8 + self->_inNetwork6eModeOffDuration;
    }
  }
  else
  {

  }
  -[WiFiUsageSession setLastSSIDdisable6eModeAtStart:](self, "setLastSSIDdisable6eModeAtStart:", self->_networkDisable6eModeAtStart);
  -[WiFiUsageSession setLastSSIDdisabled6eModeChangeCount:](self, "setLastSSIDdisabled6eModeChangeCount:", self->_network6eDisabledModeChangeCount);
  -[WiFiUsageSession setLastSSIDIn6eModeOffDuration:](self, "setLastSSIDIn6eModeOffDuration:", self->_inNetwork6eModeOffDuration);
  -[WiFiUsageSession setNetworkDisable6eModeAtStart:](self, "setNetworkDisable6eModeAtStart:", v5);

  if (v5)
    v9 = v10;
  else
    v9 = 0;
  -[WiFiUsageSession setLastNetwork6eDisableModeChangedTime:](self, "setLastNetwork6eDisableModeChangedTime:", v9);

}

- (void)setSSIDTransitionCandidates:(id)a3 SSIDTransitionPotentialCandidates:(id)a4 potentialCandidatesMinusCandidates:(id)a5 roamCandidates:(unint64_t)a6 uniqueChannels:(unint64_t)a7 uniqueBands:(unint64_t)a8
{
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t countRoamScanThatFoundSSIDTransitionTarget;
  unint64_t countRoamScanThatFoundSSIDTransitionPotentialCandidate;
  id v20;

  v20 = a3;
  v14 = a4;
  v15 = a5;
  if (-[WiFiUsageSession isSessionActive](self, "isSessionActive"))
  {
    ++self->_countRoamScan;
    v16 = objc_msgSend(v20, "count");
    v17 = objc_msgSend(v14, "count");
    -[WiFiUsageSession setLastRoamScanFoundSSIDTransitionTarget:](self, "setLastRoamScanFoundSSIDTransitionTarget:", v16 != 0);
    -[WiFiUsageSession setCountSSIDTransitionTargetInLastRoamScan:](self, "setCountSSIDTransitionTargetInLastRoamScan:", v16);
    countRoamScanThatFoundSSIDTransitionTarget = self->_countRoamScanThatFoundSSIDTransitionTarget;
    if (v16)
      ++countRoamScanThatFoundSSIDTransitionTarget;
    self->_countRoamScanThatFoundSSIDTransitionTarget = countRoamScanThatFoundSSIDTransitionTarget;
    -[WiFiUsageSession setLastRoamScanFoundSSIDTransitionPotentialCandidate:](self, "setLastRoamScanFoundSSIDTransitionPotentialCandidate:", v17 != 0);
    -[WiFiUsageSession setCountSSIDTransitionPotentialCandidatesInLastRoamScan:](self, "setCountSSIDTransitionPotentialCandidatesInLastRoamScan:", v17);
    countRoamScanThatFoundSSIDTransitionPotentialCandidate = self->_countRoamScanThatFoundSSIDTransitionPotentialCandidate;
    if (v17)
      ++countRoamScanThatFoundSSIDTransitionPotentialCandidate;
    self->_countRoamScanThatFoundSSIDTransitionPotentialCandidate = countRoamScanThatFoundSSIDTransitionPotentialCandidate;
    self->_countSSIDTransitionPotentialCandidatesInLastRoamScanNotInTransitionableSet = objc_msgSend(v15, "count");
    self->_lastRoamScanContainsRoamCandidateCount = a6 != 0;
    self->_lastRoamScanUniqueChannelsCount = a7;
    self->_lastRoamScanUniqueBandsCount = a8;
  }

}

- (void)updateUsbInsertedDuration:(id)a3
{
  NSDate *v4;
  NSDate *v5;
  NSDate *lastUsbStatusChange;
  double v7;
  NSDate *v8;

  v4 = (NSDate *)a3;
  v5 = v4;
  lastUsbStatusChange = self->_lastUsbStatusChange;
  if (!lastUsbStatusChange)
    lastUsbStatusChange = self->_sessionStartTime;
  -[NSDate timeIntervalSinceDate:](v4, "timeIntervalSinceDate:", lastUsbStatusChange);
  self->_usbInsertedDuration = v7 + self->_usbInsertedDuration;
  v8 = self->_lastUsbStatusChange;
  self->_lastUsbStatusChange = v5;

}

- (void)updateUsbStatus:(BOOL)a3 currentDevices:(id)a4
{
  void *v5;
  uint64_t v6;
  id v9;

  v9 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v9, "count");
  if (!self->_lastUsbStatusChange)
  {
    if (!objc_msgSend(v9, "count"))
      goto LABEL_14;
    goto LABEL_13;
  }
  if (!self->_anyUsbDeviceConnected && v6 != 0)
  {
    objc_storeStrong((id *)&self->_lastUsbStatusChange, v5);
    goto LABEL_14;
  }
  if (self->_anyUsbDeviceConnected && v6 == 0)
LABEL_13:
    -[WiFiUsageSession updateUsbInsertedDuration:](self, "updateUsbInsertedDuration:", v5);
LABEL_14:
  self->_anyUsbDeviceConnected = objc_msgSend(v9, "count") != 0;
  ++self->_usbDeviceEventCount;

}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  NSDate *sessionStartTime;
  NSDate *sessionEndTime;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[WiFiUsageSession sessionName](self, "sessionName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_isSessionActive)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  sessionStartTime = self->_sessionStartTime;
  sessionEndTime = self->_sessionEndTime;
  -[WiFiUsageNetworkDetails networkName](self->_networkDetails, "networkName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ session (active:%@ start:%@ end:%@ network:%@)"), v4, v5, sessionStartTime, sessionEndTime, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)redactedDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[WiFiUsageSession sessionName](self, "sessionName");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (self->_isSessionActive)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ session (active:%@ start:%@ end:%@ network:<REDACTED>)"), v4, v6, self->_sessionStartTime, self->_sessionEndTime);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)tallyAssociatedDuration:(id)a3
{
  NSDate *lastLinkStateChangedTime;
  NSDate *sessionStartTime;
  id v6;
  void *v7;
  double v8;
  double v9;

  lastLinkStateChangedTime = self->_lastLinkStateChangedTime;
  if (lastLinkStateChangedTime)
  {
    sessionStartTime = self->_sessionStartTime;
    v6 = a3;
    -[NSDate laterDate:](lastLinkStateChangedTime, "laterDate:", sessionStartTime);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v7);
    v9 = v8;

    self->_associatedDuration = v9 + self->_associatedDuration;
    -[WiFiUsageSession setLastLinkStateChangedTime:](self, "setLastLinkStateChangedTime:", 0);
  }
}

- (void)tallyInfraScoreDuration:(unint64_t)a3 until:(id)a4
{
  id v6;
  unint64_t inAWDL_BestInfraScore;
  double v8;
  unint64_t inAWDL_WorstInfraScore;
  double v10;
  id v11;
  id v12;

  v6 = a4;
  inAWDL_BestInfraScore = self->_inAWDL_BestInfraScore;
  if (self->_inAWDL_lastInfraScore == inAWDL_BestInfraScore)
  {
    if (self->_lastAWDLSequenceUpdate)
    {
      v11 = v6;
      objc_msgSend(v6, "timeIntervalSinceDate:");
      v6 = v11;
      self->_inAWDL_BestInfraScoreDuration = v8 + self->_inAWDL_BestInfraScoreDuration;
      inAWDL_BestInfraScore = self->_inAWDL_BestInfraScore;
    }
    else
    {
      inAWDL_BestInfraScore = self->_inAWDL_lastInfraScore;
    }
  }
  if (inAWDL_BestInfraScore < a3 || !self->_lastAWDLSequenceUpdate)
  {
    self->_inAWDL_BestInfraScore = a3;
    self->_inAWDL_BestInfraScoreDuration = 0.0;
  }
  inAWDL_WorstInfraScore = self->_inAWDL_WorstInfraScore;
  if (self->_inAWDL_lastInfraScore == inAWDL_WorstInfraScore)
  {
    if (self->_lastAWDLSequenceUpdate)
    {
      v12 = v6;
      objc_msgSend(v6, "timeIntervalSinceDate:");
      v6 = v12;
      self->_inAWDL_WorstInfraScoreDuration = v10 + self->_inAWDL_WorstInfraScoreDuration;
      inAWDL_WorstInfraScore = self->_inAWDL_WorstInfraScore;
    }
    else
    {
      inAWDL_WorstInfraScore = self->_inAWDL_lastInfraScore;
    }
  }
  if (inAWDL_WorstInfraScore > a3 || !self->_lastAWDLSequenceUpdate)
  {
    self->_inAWDL_WorstInfraScore = a3;
    self->_inAWDL_WorstInfraScoreDuration = 0.0;
  }
  self->_inAWDL_lastInfraScore = a3;

}

- (void)tallyP2PScoreDuration:(double)a3 until:(id)a4
{
  id v6;
  double inAWDL_BestP2PScore;
  double v8;
  double inAWDL_WorstP2PScore;
  double v10;
  id v11;
  id v12;

  v6 = a4;
  inAWDL_BestP2PScore = self->_inAWDL_BestP2PScore;
  if (self->_inAWDL_lastP2PScore == inAWDL_BestP2PScore && self->_lastAWDLSequenceUpdate)
  {
    v11 = v6;
    objc_msgSend(v6, "timeIntervalSinceDate:");
    v6 = v11;
    self->_inAWDL_BestP2PScoreDuration = v8 + self->_inAWDL_BestP2PScoreDuration;
    inAWDL_BestP2PScore = self->_inAWDL_BestP2PScore;
  }
  if (inAWDL_BestP2PScore < a3 || !self->_lastAWDLSequenceUpdate)
  {
    self->_inAWDL_BestP2PScore = a3;
    self->_inAWDL_BestP2PScoreDuration = 0.0;
  }
  inAWDL_WorstP2PScore = self->_inAWDL_WorstP2PScore;
  if (self->_inAWDL_lastP2PScore == inAWDL_WorstP2PScore && self->_lastAWDLSequenceUpdate)
  {
    v12 = v6;
    objc_msgSend(v6, "timeIntervalSinceDate:");
    v6 = v12;
    self->_inAWDL_WorstP2PScoreDuration = v10 + self->_inAWDL_WorstP2PScoreDuration;
    inAWDL_WorstP2PScore = self->_inAWDL_WorstP2PScore;
  }
  if (inAWDL_WorstP2PScore > a3 || !self->_lastAWDLSequenceUpdate)
  {
    self->_inAWDL_WorstP2PScore = a3;
    self->_inAWDL_WorstP2PScoreDuration = 0.0;
  }
  self->_inAWDL_lastP2PScore = a3;

}

- (void)updateScanForwardStats:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  objc_msgSend(v21, "objectForKey:", CFSTR("SCAN_FWD_STATS_BSS_AWAKE_CNT"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    self->_forwardedBssInwakeCount += objc_msgSend(v4, "unsignedIntegerValue");
  objc_msgSend(v21, "objectForKey:", CFSTR("SCAN_FWD_STATS_BSS_SLEEP_CNT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    self->_forwardedBssInSleepCount += objc_msgSend(v6, "unsignedIntegerValue");
  objc_msgSend(v21, "objectForKey:", CFSTR("SCAN_FWD_STATS_HOST_SCAN_CNT"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    self->_hostScanTriggersCount += objc_msgSend(v7, "unsignedIntegerValue");
  objc_msgSend(v21, "objectForKey:", CFSTR("SCAN_FWD_STATS_ROAM_SCAN_CNT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    self->_roamScanTriggersCount += objc_msgSend(v8, "unsignedIntegerValue");
  objc_msgSend(v21, "objectForKey:", CFSTR("SCAN_FWD_STATS_PNO_SCAN_CNT"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    self->_pnoScanTriggersCount += objc_msgSend(v9, "unsignedIntegerValue");
  objc_msgSend(v21, "objectForKey:", CFSTR("SCAN_FWD_STATS_EPNO_SCAN_CNT"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    self->_epnoScanTriggersCount += objc_msgSend(v10, "unsignedIntegerValue");
  objc_msgSend(v21, "objectForKey:", CFSTR("SCAN_FWD_STATS_CUR_BSS_AWAKE_CNT"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    self->_currentBssMsgInWakeCount += objc_msgSend(v11, "unsignedIntegerValue");
  objc_msgSend(v21, "objectForKey:", CFSTR("SCAN_FWD_STATS_CUR_BSS_SLEEP_CNT"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    self->_currentBssMsgInSleepCount += objc_msgSend(v12, "unsignedIntegerValue");
  objc_msgSend(v21, "objectForKey:", CFSTR("SCAN_FWD_STATS_SCAN_DATA_AWAKE_CNT"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    self->_scanDataMsgInWakeCount += objc_msgSend(v13, "unsignedIntegerValue");
  objc_msgSend(v21, "objectForKey:", CFSTR("SCAN_FWD_STATS_SCAN_DATA_SLEEP_CNT"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    self->_scanDataMsgInSleepCount += objc_msgSend(v14, "unsignedIntegerValue");
  objc_msgSend(v21, "objectForKey:", CFSTR("SCAN_FWD_STATS_SPMI_MSG_AWAKE_CNT"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    self->_spmiMsgInAwakeCount += objc_msgSend(v15, "unsignedIntegerValue");
  objc_msgSend(v21, "objectForKey:", CFSTR("SCAN_FWD_STATS_SPMI_MSG_SLEEP_CNT"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    self->_spmiMsgInSleepCount += objc_msgSend(v16, "unsignedIntegerValue");
  objc_msgSend(v21, "objectForKey:", CFSTR("SCAN_FWD_STATS_SPMI_MSG_DROP_RSSI_CNT"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    self->_spmiMsgDropRssiFilterCount += objc_msgSend(v17, "unsignedIntegerValue");
  objc_msgSend(v21, "objectForKey:", CFSTR("SCAN_FWD_STATS_SPMI_MSG_DROP_MAX_CNT"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    self->_spmiMsgDropMaxFilterCount += objc_msgSend(v18, "unsignedIntegerValue");
  objc_msgSend(v21, "objectForKey:", CFSTR("SCAN_FWD_STATS_SPMI_MSG_DROP_FAIL_CNT"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    self->_spmiMsgDropSpmiFailCount += objc_msgSend(v19, "unsignedIntegerValue");
  objc_msgSend(v21, "objectForKey:", CFSTR("SCAN_FWD_STATS_BSS_DROP_LOW_MEM_CNT"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    self->_bssDropLowMemoryCount += objc_msgSend(v20, "unsignedIntegerValue");

}

- (BOOL)canSubmitToCA
{
  WiFiUsageSessionCAConfig *ca_config;
  BOOL result;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  ca_config = self->_ca_config;
  if (!ca_config || -[WiFiUsageSessionCAConfig canSubmit](ca_config, "canSubmit"))
    return 1;
  v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v5)
  {
    -[WiFiUsageSession sessionName](self, "sessionName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiUsageSession metricName](self, "metricName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiUsageSession ca_config](self, "ca_config");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138413058;
    v10 = v6;
    v11 = 2080;
    v12 = "-[WiFiUsageSession canSubmitToCA]";
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@ %s - skipping %@ submission (%@)", (uint8_t *)&v9, 0x2Au);

    return 0;
  }
  return result;
}

- (id)describeCAConfig
{
  return -[WiFiUsageSessionCAConfig description](self->_ca_config, "description");
}

- (void)recordCAsubmission
{
  -[WiFiUsageSessionCAConfig countSubmission](self->_ca_config, "countSubmission");
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (double)sessionDuration
{
  return self->_sessionDuration;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
  objc_storeStrong((id *)&self->_interfaceName, a3);
}

- (void)setNetworkDetails:(id)a3
{
  objc_storeStrong((id *)&self->_networkDetails, a3);
}

- (BOOL)privacyRestrictionDisabled
{
  return self->_privacyRestrictionDisabled;
}

- (void)setPrivacyRestrictionDisabled:(BOOL)a3
{
  self->_privacyRestrictionDisabled = a3;
}

- (void)setCurrentBssSession:(id)a3
{
  objc_storeStrong((id *)&self->_currentBssSession, a3);
}

- (NSNumber)responsivenessScore
{
  return self->_responsivenessScore;
}

- (void)setResponsivenessScore:(id)a3
{
  self->_responsivenessScore = (NSNumber *)a3;
}

- (NSDate)processInitTime
{
  return self->_processInitTime;
}

- (void)setProcessInitTime:(id)a3
{
  objc_storeStrong((id *)&self->_processInitTime, a3);
}

- (BOOL)isAssociated
{
  return self->_isAssociated;
}

- ($06992ED503081CE345EDB9EEA121564E)bandUsageDuration
{
  __int128 v3;

  v3 = *(_OWORD *)&self[359].var0[1];
  *(_OWORD *)retstr->var0 = *(_OWORD *)self[358].var1;
  *(_OWORD *)&retstr->var0[2] = v3;
  return self;
}

- (void)setBandUsageDuration:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0[2];
  *(_OWORD *)self->_bandUsageDuration.valueByBand = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_bandUsageDuration.valueByBand[2] = v3;
}

- (BOOL)xctest
{
  return self->_xctest;
}

- (void)setXctest:(BOOL)a3
{
  self->_xctest = a3;
}

- (BOOL)isDisplayOn
{
  return self->_isDisplayOn;
}

- (void)setIsDisplayOn:(BOOL)a3
{
  self->_isDisplayOn = a3;
}

- (BOOL)isUnlocked
{
  return self->_isUnlocked;
}

- (void)setIsUnlocked:(BOOL)a3
{
  self->_isUnlocked = a3;
}

- (BOOL)isInHomeScreen
{
  return self->_isInHomeScreen;
}

- (void)setIsInHomeScreen:(BOOL)a3
{
  self->_isInHomeScreen = a3;
}

- (unint64_t)roamsAfterSupprLifted
{
  return self->_roamsAfterSupprLifted;
}

- (BOOL)isDriverAvailable
{
  return self->_isDriverAvailable;
}

- (void)setIsDriverAvailable:(BOOL)a3
{
  self->_isDriverAvailable = a3;
}

- (unint64_t)driverUnavailabilityCount
{
  return self->_driverUnavailabilityCount;
}

- (int)currentBand
{
  return self->_currentBand;
}

- (void)setCurrentBand:(int)a3
{
  self->_currentBand = a3;
}

- (NSString)secondaryInterfaceName
{
  return self->_secondaryInterfaceName;
}

- (void)setSecondaryInterfaceName:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryInterfaceName, a3);
}

- (WiFiUsageSessionCAConfig)ca_config
{
  return self->_ca_config;
}

- (void)setCa_config:(id)a3
{
  objc_storeStrong((id *)&self->_ca_config, a3);
}

- (BOOL)poweredOn
{
  return self->_poweredOn;
}

- (void)setPoweredOn:(BOOL)a3
{
  self->_poweredOn = a3;
}

- (BOOL)controlCenterEnabled
{
  return self->_controlCenterEnabled;
}

- (void)setControlCenterEnabled:(BOOL)a3
{
  self->_controlCenterEnabled = a3;
}

- (BOOL)cellularFallbackEnabled
{
  return self->_cellularFallbackEnabled;
}

- (void)setCellularFallbackEnabled:(BOOL)a3
{
  self->_cellularFallbackEnabled = a3;
}

- (BOOL)cellularOutrankingEnabled
{
  return self->_cellularOutrankingEnabled;
}

- (void)setCellularOutrankingEnabled:(BOOL)a3
{
  self->_cellularOutrankingEnabled = a3;
}

- (BOOL)isCompatibilityModeEnabledAtStart
{
  return self->_isCompatibilityModeEnabledAtStart;
}

- (BOOL)isCompatibilityModeEnabled
{
  return self->_isCompatibilityModeEnabled;
}

- (void)setIsCompatibilityModeEnabled:(BOOL)a3
{
  self->_isCompatibilityModeEnabled = a3;
}

- (BOOL)linkRecoveryDisabled
{
  return self->_linkRecoveryDisabled;
}

- (void)setLinkRecoveryDisabled:(BOOL)a3
{
  self->_linkRecoveryDisabled = a3;
}

- (NSString)cellularDataStatus
{
  return self->_cellularDataStatus;
}

- (void)setCellularDataStatus:(id)a3
{
  objc_storeStrong((id *)&self->_cellularDataStatus, a3);
}

- (BOOL)airplaneModeEnabled
{
  return self->_airplaneModeEnabled;
}

- (void)setAirplaneModeEnabled:(BOOL)a3
{
  self->_airplaneModeEnabled = a3;
}

- (unint64_t)sessionPid
{
  return self->_sessionPid;
}

- (void)setSessionPid:(unint64_t)a3
{
  self->_sessionPid = a3;
}

- (WiFiUsageNetworkDetails)networkDetailsAtEnd
{
  return self->_networkDetailsAtEnd;
}

- (unint64_t)lastJoinReason
{
  return self->_lastJoinReason;
}

- (void)setLastJoinReason:(unint64_t)a3
{
  self->_lastJoinReason = a3;
}

- (int64_t)lastJoinFailure
{
  return self->_lastJoinFailure;
}

- (void)setLastJoinFailure:(int64_t)a3
{
  self->_lastJoinFailure = a3;
}

- (int64_t)lastDisconnectReason
{
  return self->_lastDisconnectReason;
}

- (int64_t)lastDisconnectSubreason
{
  return self->_lastDisconnectSubreason;
}

- (void)setLastDisconnectSubreason:(int64_t)a3
{
  self->_lastDisconnectSubreason = a3;
}

- (int64_t)previousDisconnectReason
{
  return self->_previousDisconnectReason;
}

- (void)setPreviousDisconnectReason:(int64_t)a3
{
  self->_previousDisconnectReason = a3;
}

- (unint64_t)savedLastJoinReason
{
  return self->_savedLastJoinReason;
}

- (void)setSavedLastJoinReason:(unint64_t)a3
{
  self->_savedLastJoinReason = a3;
}

- (int64_t)savedLastJoinFailure
{
  return self->_savedLastJoinFailure;
}

- (void)setSavedLastJoinFailure:(int64_t)a3
{
  self->_savedLastJoinFailure = a3;
}

- (int64_t)savedPreviousDisconnectReason
{
  return self->_savedPreviousDisconnectReason;
}

- (void)setSavedPreviousDisconnectReason:(int64_t)a3
{
  self->_savedPreviousDisconnectReason = a3;
}

- (BOOL)lastInterfacePrimaryState
{
  return self->_lastInterfacePrimaryState;
}

- (void)setLastInterfacePrimaryState:(BOOL)a3
{
  self->_lastInterfacePrimaryState = a3;
}

- (NSDate)sessionInitTime
{
  return self->_sessionInitTime;
}

- (void)setSessionInitTime:(id)a3
{
  objc_storeStrong((id *)&self->_sessionInitTime, a3);
}

- (NSDate)sessionEndTime
{
  return self->_sessionEndTime;
}

- (NSDate)mediaStartedTime
{
  return self->_mediaStartedTime;
}

- (void)setMediaStartedTime:(id)a3
{
  objc_storeStrong((id *)&self->_mediaStartedTime, a3);
}

- (NSDate)chargingStartedTime
{
  return self->_chargingStartedTime;
}

- (void)setChargingStartedTime:(id)a3
{
  objc_storeStrong((id *)&self->_chargingStartedTime, a3);
}

- (NSDate)companionConnectionTime
{
  return self->_companionConnectionTime;
}

- (void)setCompanionConnectionTime:(id)a3
{
  objc_storeStrong((id *)&self->_companionConnectionTime, a3);
}

- (NSDate)callStartedTime
{
  return self->_callStartedTime;
}

- (void)setCallStartedTime:(id)a3
{
  objc_storeStrong((id *)&self->_callStartedTime, a3);
}

- (NSDate)inWalkingEntryTime
{
  return self->_inWalkingEntryTime;
}

- (void)setInWalkingEntryTime:(id)a3
{
  objc_storeStrong((id *)&self->_inWalkingEntryTime, a3);
}

- (NSDate)inVehicleEntryTime
{
  return self->_inVehicleEntryTime;
}

- (void)setInVehicleEntryTime:(id)a3
{
  objc_storeStrong((id *)&self->_inVehicleEntryTime, a3);
}

- (NSDate)inMotionStartedTime
{
  return self->_inMotionStartedTime;
}

- (void)setInMotionStartedTime:(id)a3
{
  objc_storeStrong((id *)&self->_inMotionStartedTime, a3);
}

- (NSDate)a2dpActiveTime
{
  return self->_a2dpActiveTime;
}

- (void)setA2dpActiveTime:(id)a3
{
  objc_storeStrong((id *)&self->_a2dpActiveTime, a3);
}

- (NSDate)scoActiveTime
{
  return self->_scoActiveTime;
}

- (void)setScoActiveTime:(id)a3
{
  objc_storeStrong((id *)&self->_scoActiveTime, a3);
}

- (NSDate)hidPresentTime
{
  return self->_hidPresentTime;
}

- (void)setHidPresentTime:(id)a3
{
  objc_storeStrong((id *)&self->_hidPresentTime, a3);
}

- (NSDate)awdlActiveTime
{
  return self->_awdlActiveTime;
}

- (void)setAwdlActiveTime:(id)a3
{
  objc_storeStrong((id *)&self->_awdlActiveTime, a3);
}

- (NSDate)roamingActiveTime
{
  return self->_roamingActiveTime;
}

- (void)setRoamingActiveTime:(id)a3
{
  objc_storeStrong((id *)&self->_roamingActiveTime, a3);
}

- (NSDate)scanningActiveTime
{
  return self->_scanningActiveTime;
}

- (NSDate)softApActiveTime
{
  return self->_softApActiveTime;
}

- (void)setSoftApActiveTime:(id)a3
{
  objc_storeStrong((id *)&self->_softApActiveTime, a3);
}

- (NSDate)lastPowerStateChangedTime
{
  return self->_lastPowerStateChangedTime;
}

- (void)setLastPowerStateChangedTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastPowerStateChangedTime, a3);
}

- (NSDate)lastControlCenterStateChangedTime
{
  return self->_lastControlCenterStateChangedTime;
}

- (void)setLastControlCenterStateChangedTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastControlCenterStateChangedTime, a3);
}

- (NSDate)lastCellularFallbackStateChangedTime
{
  return self->_lastCellularFallbackStateChangedTime;
}

- (void)setLastCellularFallbackStateChangedTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastCellularFallbackStateChangedTime, a3);
}

- (NSDate)lastCellularOutrankingStateChangedTime
{
  return self->_lastCellularOutrankingStateChangedTime;
}

- (void)setLastCellularOutrankingStateChangedTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastCellularOutrankingStateChangedTime, a3);
}

- (NSDate)lastSystemWakeTime
{
  return self->_lastSystemWakeTime;
}

- (void)setLastSystemWakeTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastSystemWakeTime, a3);
}

- (NSDate)lastSystemSleepTime
{
  return self->_lastSystemSleepTime;
}

- (void)setLastSystemSleepTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastSystemSleepTime, a3);
}

- (NSDate)lastUnexpectedLinkDownTime
{
  return self->_lastUnexpectedLinkDownTime;
}

- (void)setLastUnexpectedLinkDownTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastUnexpectedLinkDownTime, a3);
}

- (NSDate)lastLinkStateChangedTime
{
  return self->_lastLinkStateChangedTime;
}

- (void)setLastLinkStateChangedTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastLinkStateChangedTime, a3);
}

- (NSDate)lastPowerBudgetChangedTime
{
  return self->_lastPowerBudgetChangedTime;
}

- (NSDate)lastBssChangedTime
{
  return self->_lastBssChangedTime;
}

- (void)setLastBssChangedTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastBssChangedTime, a3);
}

- (NSDate)lastCompatibilityModeChangedTime
{
  return self->_lastCompatibilityModeChangedTime;
}

- (NSDate)linkRecoveryDisabledTime
{
  return self->_linkRecoveryDisabledTime;
}

- (void)setLinkRecoveryDisabledTime:(id)a3
{
  objc_storeStrong((id *)&self->_linkRecoveryDisabledTime, a3);
}

- (NSDate)wowStateEntryTime
{
  return self->_wowStateEntryTime;
}

- (void)setWowStateEntryTime:(id)a3
{
  objc_storeStrong((id *)&self->_wowStateEntryTime, a3);
}

- (NSDate)lpasStateEntryTime
{
  return self->_lpasStateEntryTime;
}

- (void)setLpasStateEntryTime:(id)a3
{
  objc_storeStrong((id *)&self->_lpasStateEntryTime, a3);
}

- (NSDate)lowPowerStateEntryTime
{
  return self->_lowPowerStateEntryTime;
}

- (void)setLowPowerStateEntryTime:(id)a3
{
  objc_storeStrong((id *)&self->_lowPowerStateEntryTime, a3);
}

- (NSDate)batterySaverStateEntryTime
{
  return self->_batterySaverStateEntryTime;
}

- (void)setBatterySaverStateEntryTime:(id)a3
{
  objc_storeStrong((id *)&self->_batterySaverStateEntryTime, a3);
}

- (double)sessionTimeSinceLastSession
{
  return self->_sessionTimeSinceLastSession;
}

- (double)systemAwakeDuration
{
  return self->_systemAwakeDuration;
}

- (double)mediaPlaybackDuration
{
  return self->_mediaPlaybackDuration;
}

- (double)chargingDuration
{
  return self->_chargingDuration;
}

- (double)companionConnectedDuration
{
  return self->_companionConnectedDuration;
}

- (double)inCallDuration
{
  return self->_inCallDuration;
}

- (double)inWalkingDuration
{
  return self->_inWalkingDuration;
}

- (void)setInWalkingDuration:(double)a3
{
  self->_inWalkingDuration = a3;
}

- (double)inVehicleDuration
{
  return self->_inVehicleDuration;
}

- (double)inMotionDuration
{
  return self->_inMotionDuration;
}

- (double)inA2dpDuration
{
  return self->_inA2dpDuration;
}

- (double)inScoDuration
{
  return self->_inScoDuration;
}

- (double)inHidPresentDuration
{
  return self->_inHidPresentDuration;
}

- (double)inAwdlDuration
{
  return self->_inAwdlDuration;
}

- (double)inRoamDuration
{
  return self->_inRoamDuration;
}

- (double)inScanDuration
{
  return self->_inScanDuration;
}

- (double)inSoftApDuration
{
  return self->_inSoftApDuration;
}

- (double)poweredOnDuration
{
  return self->_poweredOnDuration;
}

- (double)associatedDuration
{
  return self->_associatedDuration;
}

- (double)associatedSleepDuration
{
  return self->_associatedSleepDuration;
}

- (double)inCellularFallbackDuration
{
  return self->_inCellularFallbackDuration;
}

- (double)inCellularOutrankingDuration
{
  return self->_inCellularOutrankingDuration;
}

- (double)inControlCenterAutoJoinDisabledDuration
{
  return self->_inControlCenterAutoJoinDisabledDuration;
}

- (double)inCompatibilityModeEnabledDuration
{
  return self->_inCompatibilityModeEnabledDuration;
}

- (double)linkRecoveryDisabledDuration
{
  return self->_linkRecoveryDisabledDuration;
}

- (double)inWowStateDuration
{
  return self->_inWowStateDuration;
}

- (double)inLpasStateDuration
{
  return self->_inLpasStateDuration;
}

- (double)inLowPowerStateDuration
{
  return self->_inLowPowerStateDuration;
}

- (double)inBatterySaverStateDuration
{
  return self->_inBatterySaverStateDuration;
}

- (double)sleepPowerStatsTotalDuration
{
  return self->_sleepPowerStatsTotalDuration;
}

- (double)sleepPowerStatsUnassociatedDuration
{
  return self->_sleepPowerStatsUnassociatedDuration;
}

- (double)sleepPowerStatsAssociatedDuration
{
  return self->_sleepPowerStatsAssociatedDuration;
}

- (double)sleepPowerStatsRoamingDuration
{
  return self->_sleepPowerStatsRoamingDuration;
}

- (unint64_t)roamReasonInitialAssociationCount
{
  return self->_roamReasonInitialAssociationCount;
}

- (unint64_t)roamReasonLowRssiCount
{
  return self->_roamReasonLowRssiCount;
}

- (unint64_t)roamReasonDeauthDisassocCount
{
  return self->_roamReasonDeauthDisassocCount;
}

- (unint64_t)roamReasonBeaconLostCount
{
  return self->_roamReasonBeaconLostCount;
}

- (unint64_t)roamReasonSteeredByApCount
{
  return self->_roamReasonSteeredByApCount;
}

- (unint64_t)roamReasonSteeredByBtmCount
{
  return self->_roamReasonSteeredByBtmCount;
}

- (unint64_t)roamReasonSteeredByCsaCount
{
  return self->_roamReasonSteeredByCsaCount;
}

- (unint64_t)roamReasonReassocRequestedCount
{
  return self->_roamReasonReassocRequestedCount;
}

- (unint64_t)roamReasonHostTriggeredCount
{
  return self->_roamReasonHostTriggeredCount;
}

- (unint64_t)roamReasonBetterCandidateCount
{
  return self->_roamReasonBetterCandidateCount;
}

- (unint64_t)roamReasonBetterConditionCount
{
  return self->_roamReasonBetterConditionCount;
}

- (unint64_t)roamReasonMiscCount
{
  return self->_roamReasonMiscCount;
}

- (unint64_t)roamStatusSucceededCount
{
  return self->_roamStatusSucceededCount;
}

- (unint64_t)roamStatusFailedCount
{
  return self->_roamStatusFailedCount;
}

- (unint64_t)roamStatusNoCandidateCount
{
  return self->_roamStatusNoCandidateCount;
}

- (unint64_t)roamStatusNoQualifiedCandidateCount
{
  return self->_roamStatusNoQualifiedCandidateCount;
}

- (unint64_t)roamStatusFailedNoScan
{
  return self->_roamStatusFailedNoScan;
}

- (unint64_t)roamIsWNMScoreUsedCount
{
  return self->_roamIsWNMScoreUsedCount;
}

- (unint64_t)roamPingPongAboveThresholdCount
{
  return self->_roamPingPongAboveThresholdCount;
}

- (unint64_t)roamPingPongAboveThresholdCountLowRssiOnly
{
  return self->_roamPingPongAboveThresholdCountLowRssiOnly;
}

- (unint64_t)roamPingPongLowRssiAndReassocOnly
{
  return self->_roamPingPongLowRssiAndReassocOnly;
}

- (unint64_t)roamPingPongReassocOnly
{
  return self->_roamPingPongReassocOnly;
}

- (BOOL)isRoamSuppressionEnabled
{
  return self->_isRoamSuppressionEnabled;
}

- (NSDate)lastRoamSuppressionToggled
{
  return self->_lastRoamSuppressionToggled;
}

- (unint64_t)inRoamSuppressionEnabledCount
{
  return self->_inRoamSuppressionEnabledCount;
}

- (double)inRoamSuppressionEnabled
{
  return self->_inRoamSuppressionEnabled;
}

- (double)inRoamSuppressionWaitForRoamStart
{
  return self->_inRoamSuppressionWaitForRoamStart;
}

- (double)inRoamSuppressionWaitForRoamEnd
{
  return self->_inRoamSuppressionWaitForRoamEnd;
}

- (unint64_t)minCandidatesCount
{
  return self->_minCandidatesCount;
}

- (unint64_t)maxCandidatesCount
{
  return self->_maxCandidatesCount;
}

- (unint64_t)currentRSSIStrongestCount
{
  return self->_currentRSSIStrongestCount;
}

- (NSMutableDictionary)roamNeighborsByBand
{
  return self->_roamNeighborsByBand;
}

- (void)setRoamNeighborsByBand:(id)a3
{
  objc_storeStrong((id *)&self->_roamNeighborsByBand, a3);
}

- ($FEE1510A43A03BFC9F45CB2D5A0A197D)strongestRSSICountByBand
{
  __int128 v3;

  v3 = *(_OWORD *)&self[360].var0[1];
  *(_OWORD *)retstr->var0 = *(_OWORD *)self[359].var1;
  *(_OWORD *)&retstr->var0[2] = v3;
  return self;
}

- (void)setStrongestRSSICountByBand:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0[2];
  *(_OWORD *)self->_strongestRSSICountByBand.valueByBand = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_strongestRSSICountByBand.valueByBand[2] = v3;
}

- ($FEE1510A43A03BFC9F45CB2D5A0A197D)strongestRSSIByBand
{
  __int128 v3;

  v3 = *(_OWORD *)&self[361].var0[1];
  *(_OWORD *)retstr->var0 = *(_OWORD *)self[360].var1;
  *(_OWORD *)&retstr->var0[2] = v3;
  return self;
}

- (void)setStrongestRSSIByBand:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0[2];
  *(_OWORD *)self->_strongestRSSIByBand.valueByBand = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_strongestRSSIByBand.valueByBand[2] = v3;
}

- ($13477CEFC6EEA4B326536BBEC35DF1AE)roamNeighsSmllstCurrentToBestRssiByBandTransition
{
  __int128 v3;
  __int128 v4;

  *(_QWORD *)&retstr->var1[2][2] = self[132].var0[1][2];
  v3 = *(_OWORD *)&self[132].var0[0][1];
  *(_OWORD *)&retstr->var0[1][1] = *(_OWORD *)&self[131].var1[2][2];
  *(_OWORD *)&retstr->var0[2][0] = v3;
  *(_OWORD *)&retstr->var0[2][2] = *(_OWORD *)&self[132].var0[1][0];
  v4 = *(_OWORD *)&self[131].var0[2][2];
  *(_OWORD *)&retstr->var0[0][0] = *(_OWORD *)&self[131].var0[2][0];
  *(_OWORD *)&retstr->var0[0][2] = v4;
  return self;
}

- (void)setRoamNeighsSmllstCurrentToBestRssiByBandTransition:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&a3->var0[1][1];
  v4 = *(_OWORD *)&a3->var0[2][0];
  v5 = *(_OWORD *)&a3->var0[2][2];
  *(_QWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valid[2][2] = *(_QWORD *)&a3->var1[2][2];
  v6 = *(_OWORD *)&a3->var0[0][2];
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[0][0] = *(_OWORD *)&a3->var0[0][0];
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[0][2] = v6;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[2][0] = v4;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[2][2] = v5;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBandTransition.valueByBands[1][1] = v3;
}

- ($13477CEFC6EEA4B326536BBEC35DF1AE)roamNeighsLrgstCurrentToBestRssiByBandTransition
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[133].var0[0][1];
  *(_OWORD *)&retstr->var0[1][1] = *(_OWORD *)&self[132].var1[2][2];
  *(_OWORD *)&retstr->var0[2][0] = v3;
  *(_OWORD *)&retstr->var0[2][2] = *(_OWORD *)&self[133].var0[1][0];
  *(_QWORD *)&retstr->var1[2][2] = self[133].var0[1][2];
  v4 = *(_OWORD *)&self[132].var0[2][2];
  *(_OWORD *)&retstr->var0[0][0] = *(_OWORD *)&self[132].var0[2][0];
  *(_OWORD *)&retstr->var0[0][2] = v4;
  return self;
}

- (void)setRoamNeighsLrgstCurrentToBestRssiByBandTransition:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&a3->var0[0][0];
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[0][2] = *(_OWORD *)&a3->var0[0][2];
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[0][0] = v3;
  v4 = *(_OWORD *)&a3->var0[1][1];
  v5 = *(_OWORD *)&a3->var0[2][0];
  v6 = *(_OWORD *)&a3->var0[2][2];
  *(_QWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valid[2][2] = *(_QWORD *)&a3->var1[2][2];
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[2][2] = v6;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[2][0] = v5;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBandTransition.valueByBands[1][1] = v4;
}

- ($13477CEFC6EEA4B326536BBEC35DF1AE)roamNeighsSmllstCurrentToNextBestRssiByBandTransition
{
  __int128 v3;
  __int128 v4;

  *(_QWORD *)&retstr->var1[2][2] = self[134].var0[1][2];
  v3 = *(_OWORD *)&self[134].var0[0][1];
  *(_OWORD *)&retstr->var0[1][1] = *(_OWORD *)&self[133].var1[2][2];
  *(_OWORD *)&retstr->var0[2][0] = v3;
  *(_OWORD *)&retstr->var0[2][2] = *(_OWORD *)&self[134].var0[1][0];
  v4 = *(_OWORD *)&self[133].var0[2][2];
  *(_OWORD *)&retstr->var0[0][0] = *(_OWORD *)&self[133].var0[2][0];
  *(_OWORD *)&retstr->var0[0][2] = v4;
  return self;
}

- (void)setRoamNeighsSmllstCurrentToNextBestRssiByBandTransition:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&a3->var0[1][1];
  v4 = *(_OWORD *)&a3->var0[2][0];
  v5 = *(_OWORD *)&a3->var0[2][2];
  *(_QWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valid[2][2] = *(_QWORD *)&a3->var1[2][2];
  v6 = *(_OWORD *)&a3->var0[0][2];
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[0][0] = *(_OWORD *)&a3->var0[0][0];
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[0][2] = v6;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[2][0] = v4;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[2][2] = v5;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBandTransition.valueByBands[1][1] = v3;
}

- ($13477CEFC6EEA4B326536BBEC35DF1AE)roamNeighsLrgstCurrentToNextBestRssiByBandTransition
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[135].var0[0][1];
  *(_OWORD *)&retstr->var0[1][1] = *(_OWORD *)&self[134].var1[2][2];
  *(_OWORD *)&retstr->var0[2][0] = v3;
  *(_OWORD *)&retstr->var0[2][2] = *(_OWORD *)&self[135].var0[1][0];
  *(_QWORD *)&retstr->var1[2][2] = self[135].var0[1][2];
  v4 = *(_OWORD *)&self[134].var0[2][2];
  *(_OWORD *)&retstr->var0[0][0] = *(_OWORD *)&self[134].var0[2][0];
  *(_OWORD *)&retstr->var0[0][2] = v4;
  return self;
}

- (void)setRoamNeighsLrgstCurrentToNextBestRssiByBandTransition:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&a3->var0[0][0];
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[0][2] = *(_OWORD *)&a3->var0[0][2];
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[0][0] = v3;
  v4 = *(_OWORD *)&a3->var0[1][1];
  v5 = *(_OWORD *)&a3->var0[2][0];
  v6 = *(_OWORD *)&a3->var0[2][2];
  *(_QWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valid[2][2] = *(_QWORD *)&a3->var1[2][2];
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[2][2] = v6;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[2][0] = v5;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBandTransition.valueByBands[1][1] = v4;
}

- (NSMutableDictionary)roamCandidatesPerBandWhenSuccessful
{
  return self->_roamCandidatesPerBandWhenSuccessful;
}

- (void)setRoamCandidatesPerBandWhenSuccessful:(id)a3
{
  objc_storeStrong((id *)&self->_roamCandidatesPerBandWhenSuccessful, a3);
}

- (NSMutableDictionary)roamCandidatesPerBandWhenUnSuccessful
{
  return self->_roamCandidatesPerBandWhenUnSuccessful;
}

- (void)setRoamCandidatesPerBandWhenUnSuccessful:(id)a3
{
  objc_storeStrong((id *)&self->_roamCandidatesPerBandWhenUnSuccessful, a3);
}

- (double)powerBudgetMaxDuration
{
  return self->_powerBudgetMaxDuration;
}

- (double)powerBudget90Duration
{
  return self->_powerBudget90Duration;
}

- (double)powerBudget80Duration
{
  return self->_powerBudget80Duration;
}

- (double)powerBudget70Duration
{
  return self->_powerBudget70Duration;
}

- (double)powerBudget60Duration
{
  return self->_powerBudget60Duration;
}

- (double)powerBudget50Duration
{
  return self->_powerBudget50Duration;
}

- (double)powerBudget40Duration
{
  return self->_powerBudget40Duration;
}

- (double)powerBudget30Duration
{
  return self->_powerBudget30Duration;
}

- (double)powerBudget20Duration
{
  return self->_powerBudget20Duration;
}

- (double)powerBudget10Duration
{
  return self->_powerBudget10Duration;
}

- (double)powerBudgetMinDuration
{
  return self->_powerBudgetMinDuration;
}

- (double)thermalIndexMaxDuration
{
  return self->_thermalIndexMaxDuration;
}

- (double)thermalIndex90Duration
{
  return self->_thermalIndex90Duration;
}

- (double)thermalIndex80Duration
{
  return self->_thermalIndex80Duration;
}

- (double)thermalIndex70Duration
{
  return self->_thermalIndex70Duration;
}

- (double)thermalIndex60Duration
{
  return self->_thermalIndex60Duration;
}

- (double)thermalIndex50Duration
{
  return self->_thermalIndex50Duration;
}

- (double)thermalIndex40Duration
{
  return self->_thermalIndex40Duration;
}

- (double)thermalIndex30Duration
{
  return self->_thermalIndex30Duration;
}

- (double)thermalIndex20Duration
{
  return self->_thermalIndex20Duration;
}

- (double)thermalIndex10Duration
{
  return self->_thermalIndex10Duration;
}

- (double)thermalIndexMinDuration
{
  return self->_thermalIndexMinDuration;
}

- (unint64_t)mediaPlaybackEventCount
{
  return self->_mediaPlaybackEventCount;
}

- (unint64_t)chargingEventCount
{
  return self->_chargingEventCount;
}

- (unint64_t)inCallEventCount
{
  return self->_inCallEventCount;
}

- (unint64_t)inWalkingEventCount
{
  return self->_inWalkingEventCount;
}

- (void)setInWalkingEventCount:(unint64_t)a3
{
  self->_inWalkingEventCount = a3;
}

- (unint64_t)inVehicleEventCount
{
  return self->_inVehicleEventCount;
}

- (unint64_t)inMotionEventCount
{
  return self->_inMotionEventCount;
}

- (unint64_t)inA2dpEventCount
{
  return self->_inA2dpEventCount;
}

- (unint64_t)inScoEventCount
{
  return self->_inScoEventCount;
}

- (unint64_t)inHidPresentCount
{
  return self->_inHidPresentCount;
}

- (unint64_t)inAwdlEventCount
{
  return self->_inAwdlEventCount;
}

- (unint64_t)inRoamEventCount
{
  return self->_inRoamEventCount;
}

- (unint64_t)inScanEventCount
{
  return self->_inScanEventCount;
}

- (unint64_t)inSoftApEventCount
{
  return self->_inSoftApEventCount;
}

- (void)setInSoftApEventCount:(unint64_t)a3
{
  self->_inSoftApEventCount = a3;
}

- (unint64_t)rangingEventCount
{
  return self->_rangingEventCount;
}

- (unint64_t)companionConnectionStateChangedCount
{
  return self->_companionConnectionStateChangedCount;
}

- (unint64_t)linkRecoveryDisabledCount
{
  return self->_linkRecoveryDisabledCount;
}

- (unint64_t)wowStateChangedCount
{
  return self->_wowStateChangedCount;
}

- (unint64_t)lpasStateChangedCount
{
  return self->_lpasStateChangedCount;
}

- (unint64_t)lowPowerStateChangedCount
{
  return self->_lowPowerStateChangedCount;
}

- (unint64_t)batterySaverStateChangedCount
{
  return self->_batterySaverStateChangedCount;
}

- (unint64_t)systemWakeStateChangedCount
{
  return self->_systemWakeStateChangedCount;
}

- (unint64_t)systemWokenByWiFiCount
{
  return self->_systemWokenByWiFiCount;
}

- (unint64_t)lockStateChangedCount
{
  return self->_lockStateChangedCount;
}

- (unint64_t)displayStateChangedCount
{
  return self->_displayStateChangedCount;
}

- (unint64_t)networkChangedCount
{
  return self->_networkChangedCount;
}

- (unint64_t)joinStateChangedCount
{
  return self->_joinStateChangedCount;
}

- (unint64_t)savedJoinStateChangedCount
{
  return self->_savedJoinStateChangedCount;
}

- (void)setSavedJoinStateChangedCount:(unint64_t)a3
{
  self->_savedJoinStateChangedCount = a3;
}

- (unint64_t)linkStateChangedCount
{
  return self->_linkStateChangedCount;
}

- (unint64_t)applicationStateChangedCount
{
  return self->_applicationStateChangedCount;
}

- (unint64_t)powerStateChangedCount
{
  return self->_powerStateChangedCount;
}

- (unint64_t)powerToggleEventCount
{
  return self->_powerToggleEventCount;
}

- (unint64_t)smartCoverStateChangedCount
{
  return self->_smartCoverStateChangedCount;
}

- (NSString)lastSmartCoverState
{
  return self->_lastSmartCoverState;
}

- (void)setLastSmartCoverState:(id)a3
{
  objc_storeStrong((id *)&self->_lastSmartCoverState, a3);
}

- (unint64_t)controlCenterStateChangedCount
{
  return self->_controlCenterStateChangedCount;
}

- (unint64_t)controlCenterToggleEventCount
{
  return self->_controlCenterToggleEventCount;
}

- (unint64_t)cellularFallbackStateChangedCount
{
  return self->_cellularFallbackStateChangedCount;
}

- (unint64_t)cellularOutrankingStateChangedCount
{
  return self->_cellularOutrankingStateChangedCount;
}

- (unint64_t)rapidLinkTransitionCount
{
  return self->_rapidLinkTransitionCount;
}

- (unint64_t)primaryInterfaceStateChangeCount
{
  return self->_primaryInterfaceStateChangeCount;
}

- (unint64_t)compatibilityModeChangeCount
{
  return self->_compatibilityModeChangeCount;
}

- (unint64_t)consecutiveJoinFailureCount
{
  return self->_consecutiveJoinFailureCount;
}

- (void)setConsecutiveJoinFailureCount:(unint64_t)a3
{
  self->_consecutiveJoinFailureCount = a3;
}

- (unint64_t)airplaneModeStateChangedCount
{
  return self->_airplaneModeStateChangedCount;
}

- (unint64_t)neighborBssCount
{
  return self->_neighborBssCount;
}

- (unint64_t)otherBssCount
{
  return self->_otherBssCount;
}

- (WiFiUsageInterfaceStats)ifStatsAtStart
{
  return self->_ifStatsAtStart;
}

- (WiFiUsageInterfaceStats)secondaryIfStatsAtStart
{
  return self->_secondaryIfStatsAtStart;
}

- (unint64_t)netInterfaceTxBytes
{
  return self->_netInterfaceTxBytes;
}

- (void)setNetInterfaceTxBytes:(unint64_t)a3
{
  self->_netInterfaceTxBytes = a3;
}

- (unint64_t)netInterfaceRxBytes
{
  return self->_netInterfaceRxBytes;
}

- (void)setNetInterfaceRxBytes:(unint64_t)a3
{
  self->_netInterfaceRxBytes = a3;
}

- (unint64_t)secondaryInterfaceTxBytes
{
  return self->_secondaryInterfaceTxBytes;
}

- (void)setSecondaryInterfaceTxBytes:(unint64_t)a3
{
  self->_secondaryInterfaceTxBytes = a3;
}

- (unint64_t)secondaryInterfaceRxBytes
{
  return self->_secondaryInterfaceRxBytes;
}

- (void)setSecondaryInterfaceRxBytes:(unint64_t)a3
{
  self->_secondaryInterfaceRxBytes = a3;
}

- (unint64_t)triggerDisconnectAlertedCount
{
  return self->_triggerDisconnectAlertedCount;
}

- (unint64_t)triggerDisconnectConfirmedCount
{
  return self->_triggerDisconnectConfirmedCount;
}

- (unint64_t)triggerDisconnectExecutedCount
{
  return self->_triggerDisconnectExecutedCount;
}

- (NSDate)lastDriverTerminationTime
{
  return self->_lastDriverTerminationTime;
}

- (void)setLastDriverTerminationTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastDriverTerminationTime, a3);
}

- (NSDate)lastChipResetTime
{
  return self->_lastChipResetTime;
}

- (void)setLastChipResetTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastChipResetTime, a3);
}

- (NSDate)lastDriverAvailableTime
{
  return self->_lastDriverAvailableTime;
}

- (void)setLastDriverAvailableTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastDriverAvailableTime, a3);
}

- (NSString)lastDriverUnavailableReason
{
  return self->_lastDriverUnavailableReason;
}

- (double)driverProcessLifespan
{
  return self->_driverProcessLifespan;
}

- (void)setDriverProcessLifespan:(double)a3
{
  self->_driverProcessLifespan = a3;
}

- (double)driverAvailabilityLifespan
{
  return self->_driverAvailabilityLifespan;
}

- (void)setDriverAvailabilityLifespan:(double)a3
{
  self->_driverAvailabilityLifespan = a3;
}

- (double)driverAvailabilityLatencyFromChipReset
{
  return self->_driverAvailabilityLatencyFromChipReset;
}

- (double)driverAvailabilityLatencyFromTermination
{
  return self->_driverAvailabilityLatencyFromTermination;
}

- (double)joinScanLatencyFromDriverAvailability
{
  return self->_joinScanLatencyFromDriverAvailability;
}

- (double)joinStartedLatencyFromDriverAvailability
{
  return self->_joinStartedLatencyFromDriverAvailability;
}

- (double)joinLinkUpLatencyFromDriverAvailability
{
  return self->_joinLinkUpLatencyFromDriverAvailability;
}

- (double)joinIpConfigurationLatencyFromDriverAvailability
{
  return self->_joinIpConfigurationLatencyFromDriverAvailability;
}

- (double)joinInterfaceRankingLatencyFromDriverAvailability
{
  return self->_joinInterfaceRankingLatencyFromDriverAvailability;
}

- (double)joinLinkUpLatencyFromSessionStart
{
  return self->_joinLinkUpLatencyFromSessionStart;
}

- (double)longestUnassociatedDuration
{
  return self->_longestUnassociatedDuration;
}

- (WiFiUsageSessionLQM)lqm
{
  return self->_lqm;
}

- (void)setLqm:(id)a3
{
  objc_storeStrong((id *)&self->_lqm, a3);
}

- (int64_t)lastPowerBudget
{
  return self->_lastPowerBudget;
}

- (void)setLastPowerBudget:(int64_t)a3
{
  self->_lastPowerBudget = a3;
}

- (int64_t)lastThermalIndex
{
  return self->_lastThermalIndex;
}

- (void)setLastThermalIndex:(int64_t)a3
{
  self->_lastThermalIndex = a3;
}

- (int)bandAtSessionStart
{
  return self->_bandAtSessionStart;
}

- (BOOL)isAssociatedAtSessionStart
{
  return self->_isAssociatedAtSessionStart;
}

- (int64_t)rssiAtSessionStart
{
  return self->_rssiAtSessionStart;
}

- (unint64_t)network6eDisabledModeChangeCount
{
  return self->_network6eDisabledModeChangeCount;
}

- (unint64_t)lastSSIDdisabled6eModeChangeCount
{
  return self->_lastSSIDdisabled6eModeChangeCount;
}

- (NSString)networkDisable6eModeAtStart
{
  return self->_networkDisable6eModeAtStart;
}

- (NSString)lastSSIDdisable6eModeAtStart
{
  return self->_lastSSIDdisable6eModeAtStart;
}

- (NSDate)lastNetwork6eDisableModeChangedTime
{
  return self->_lastNetwork6eDisableModeChangedTime;
}

- (double)inNetwork6eModeOffDuration
{
  return self->_inNetwork6eModeOffDuration;
}

- (double)lastSSIDIn6eModeOffDuration
{
  return self->_lastSSIDIn6eModeOffDuration;
}

- (WiFiUsageNetworkIPv4Details)ipV4Details
{
  return self->_ipV4Details;
}

- (WiFiUsageNetworkIPv6Details)ipV6Details
{
  return self->_ipV6Details;
}

- (WiFiUsageNetworkIPv4Details)ipV4DetailsPrevSession
{
  return self->_ipV4DetailsPrevSession;
}

- (WiFiUsageNetworkIPv6Details)ipV6DetailsPrevSession
{
  return self->_ipV6DetailsPrevSession;
}

- (BOOL)hasDifferentIpv4DetailsThanPrevSession
{
  return self->_hasDifferentIpv4DetailsThanPrevSession;
}

- (void)setHasDifferentIpv4DetailsThanPrevSession:(BOOL)a3
{
  self->_hasDifferentIpv4DetailsThanPrevSession = a3;
}

- (BOOL)hasDifferentIpv6DetailsThanPrevSession
{
  return self->_hasDifferentIpv6DetailsThanPrevSession;
}

- (void)setHasDifferentIpv6DetailsThanPrevSession:(BOOL)a3
{
  self->_hasDifferentIpv6DetailsThanPrevSession = a3;
}

- (BOOL)inCoexRealTime
{
  return self->_inCoexRealTime;
}

- (void)setInCoexRealTime:(BOOL)a3
{
  self->_inCoexRealTime = a3;
}

- (BOOL)inCoexRealTimeAtSessionStart
{
  return self->_inCoexRealTimeAtSessionStart;
}

- (BOOL)inCoexRealTimeAtLastJoin
{
  return self->_inCoexRealTimeAtLastJoin;
}

- (void)setInCoexRealTimeAtLastJoin:(BOOL)a3
{
  self->_inCoexRealTimeAtLastJoin = a3;
}

- (NSDate)lastCoexRealTimeOn
{
  return self->_lastCoexRealTimeOn;
}

- (void)setLastCoexRealTimeOn:(id)a3
{
  objc_storeStrong((id *)&self->_lastCoexRealTimeOn, a3);
}

- (NSDate)lastCoexRealTimeOff
{
  return self->_lastCoexRealTimeOff;
}

- (void)setLastCoexRealTimeOff:(id)a3
{
  objc_storeStrong((id *)&self->_lastCoexRealTimeOff, a3);
}

- (NSMutableArray)prevNetworkNames
{
  return self->_prevNetworkNames;
}

- (void)setPrevNetworkNames:(id)a3
{
  objc_storeStrong((id *)&self->_prevNetworkNames, a3);
}

- (unint64_t)prevJoinReason
{
  return self->_prevJoinReason;
}

- (void)setPrevJoinReason:(unint64_t)a3
{
  self->_prevJoinReason = a3;
}

- (NSDate)lastJoinTime
{
  return self->_lastJoinTime;
}

- (void)setLastJoinTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastJoinTime, a3);
}

- (double)timeSincePrevJoin
{
  return self->_timeSincePrevJoin;
}

- (void)setTimeSincePrevJoin:(double)a3
{
  self->_timeSincePrevJoin = a3;
}

- (BOOL)isA2DPActive
{
  return self->_isA2DPActive;
}

- (void)setIsA2DPActive:(BOOL)a3
{
  self->_isA2DPActive = a3;
}

- (BOOL)isSCOActive
{
  return self->_isSCOActive;
}

- (void)setIsSCOActive:(BOOL)a3
{
  self->_isSCOActive = a3;
}

- (BOOL)isUniAoSActive
{
  return self->_isUniAoSActive;
}

- (void)setIsUniAoSActive:(BOOL)a3
{
  self->_isUniAoSActive = a3;
}

- (BOOL)isBiAoSActive
{
  return self->_isBiAoSActive;
}

- (void)setIsBiAoSActive:(BOOL)a3
{
  self->_isBiAoSActive = a3;
}

- (NSString)btAudioBand
{
  return self->_btAudioBand;
}

- (void)setBtAudioBand:(id)a3
{
  objc_storeStrong((id *)&self->_btAudioBand, a3);
}

- (unint64_t)countRoamScan
{
  return self->_countRoamScan;
}

- (BOOL)lastRoamScanFoundSSIDTransitionTarget
{
  return self->_lastRoamScanFoundSSIDTransitionTarget;
}

- (unint64_t)countSSIDTransitionTargetInLastRoamScan
{
  return self->_countSSIDTransitionTargetInLastRoamScan;
}

- (unint64_t)countRoamScanThatFoundSSIDTransitionTarget
{
  return self->_countRoamScanThatFoundSSIDTransitionTarget;
}

- (BOOL)lastRoamScanFoundSSIDTransitionPotentialCandidate
{
  return self->_lastRoamScanFoundSSIDTransitionPotentialCandidate;
}

- (unint64_t)countSSIDTransitionPotentialCandidatesInLastRoamScan
{
  return self->_countSSIDTransitionPotentialCandidatesInLastRoamScan;
}

- (unint64_t)countSSIDTransitionPotentialCandidatesInLastRoamScanNotInTransitionableSet
{
  return self->_countSSIDTransitionPotentialCandidatesInLastRoamScanNotInTransitionableSet;
}

- (unint64_t)countRoamScanThatFoundSSIDTransitionPotentialCandidate
{
  return self->_countRoamScanThatFoundSSIDTransitionPotentialCandidate;
}

- (BOOL)lastRoamScanContainsRoamCandidateCount
{
  return self->_lastRoamScanContainsRoamCandidateCount;
}

- (unint64_t)lastRoamScanUniqueChannelsCount
{
  return self->_lastRoamScanUniqueChannelsCount;
}

- (unint64_t)lastRoamScanUniqueBandsCount
{
  return self->_lastRoamScanUniqueBandsCount;
}

- (BOOL)savedInCoexRealTimeAtLastJoin
{
  return self->_savedInCoexRealTimeAtLastJoin;
}

- (void)setSavedInCoexRealTimeAtLastJoin:(BOOL)a3
{
  self->_savedInCoexRealTimeAtLastJoin = a3;
}

- (unint64_t)savedPrevJoinReason
{
  return self->_savedPrevJoinReason;
}

- (void)setSavedPrevJoinReason:(unint64_t)a3
{
  self->_savedPrevJoinReason = a3;
}

- (NSDate)savedLastJoinTime
{
  return self->_savedLastJoinTime;
}

- (void)setSavedLastJoinTime:(id)a3
{
  objc_storeStrong((id *)&self->_savedLastJoinTime, a3);
}

- (double)savedTimeSincePrevJoin
{
  return self->_savedTimeSincePrevJoin;
}

- (void)setSavedTimeSincePrevJoin:(double)a3
{
  self->_savedTimeSincePrevJoin = a3;
}

- (BOOL)lastJoinWhileDeferForTD
{
  return self->_lastJoinWhileDeferForTD;
}

- (void)setLastJoinWhileDeferForTD:(BOOL)a3
{
  self->_lastJoinWhileDeferForTD = a3;
}

- (unint64_t)inPoorLinkSessionCount
{
  return self->_inPoorLinkSessionCount;
}

- (double)inPoorLinkSessionDuration
{
  return self->_inPoorLinkSessionDuration;
}

- (unint64_t)tdAfterJoinAfterTDCount
{
  return self->_tdAfterJoinAfterTDCount;
}

- (unint64_t)current_subsequentTdAfterJoinAfterTDCount
{
  return self->_current_subsequentTdAfterJoinAfterTDCount;
}

- (unint64_t)min_subsequentTdAfterJoinAfterTDCount
{
  return self->_min_subsequentTdAfterJoinAfterTDCount;
}

- (unint64_t)max_subsequentTdAfterJoinAfterTDCount
{
  return self->_max_subsequentTdAfterJoinAfterTDCount;
}

- (unint64_t)tdSessionStartedByBadRSSICount
{
  return self->_tdSessionStartedByBadRSSICount;
}

- (unint64_t)tdSessionStartedByTDRecommendedCount
{
  return self->_tdSessionStartedByTDRecommendedCount;
}

- (unint64_t)tdSessionStartedBySymptomDNSFailureCount
{
  return self->_tdSessionStartedBySymptomDNSFailureCount;
}

- (BOOL)isInTDEval
{
  return self->_isInTDEval;
}

- (unint64_t)tdEvalEndedCount
{
  return self->_tdEvalEndedCount;
}

- (double)tdEvalCumulativeDuration
{
  return self->_tdEvalCumulativeDuration;
}

- (unint64_t)tdEvalStartedCount
{
  return self->_tdEvalStartedCount;
}

- (unint64_t)tdEvalStartedByBadRSSICount
{
  return self->_tdEvalStartedByBadRSSICount;
}

- (unint64_t)tdEvalStartedBySymptomsARPFailureCount
{
  return self->_tdEvalStartedBySymptomsARPFailureCount;
}

- (unint64_t)tdEvalStartedBySymptomsDNSFailCount
{
  return self->_tdEvalStartedBySymptomsDNSFailCount;
}

- (unint64_t)tdEvalStartedBySymptomsShortFlowCount
{
  return self->_tdEvalStartedBySymptomsShortFlowCount;
}

- (unint64_t)tdEvalStartedBySymptomsRTTFailCount
{
  return self->_tdEvalStartedBySymptomsRTTFailCount;
}

- (void)setTdEvalStartedBySymptomsRTTFailCount:(unint64_t)a3
{
  self->_tdEvalStartedBySymptomsRTTFailCount = a3;
}

- (unint64_t)tdEvalStartedBySymptomsDataStallCount
{
  return self->_tdEvalStartedBySymptomsDataStallCount;
}

- (unint64_t)tdEvalStartedBySymptomsDNSStallCount
{
  return self->_tdEvalStartedBySymptomsDNSStallCount;
}

- (unint64_t)tdEvalStartedByActiveProbingCount
{
  return self->_tdEvalStartedByActiveProbingCount;
}

- (unint64_t)tdEvalStartedByFGNetwAppChangeCount
{
  return self->_tdEvalStartedByFGNetwAppChangeCount;
}

- (unint64_t)tdEvalStartedByUserNotificationCount
{
  return self->_tdEvalStartedByUserNotificationCount;
}

- (unint64_t)tdEvalStartedByCheckReassocCount
{
  return self->_tdEvalStartedByCheckReassocCount;
}

- (BOOL)anyUsbDeviceConnected
{
  return self->_anyUsbDeviceConnected;
}

- (void)setAnyUsbDeviceConnected:(BOOL)a3
{
  self->_anyUsbDeviceConnected = a3;
}

- (unint64_t)usbDeviceEventCount
{
  return self->_usbDeviceEventCount;
}

- (NSDate)lastUsbStatusChange
{
  return self->_lastUsbStatusChange;
}

- (double)usbInsertedDuration
{
  return self->_usbInsertedDuration;
}

- (NSDate)lastAWDLSequenceUpdate
{
  return self->_lastAWDLSequenceUpdate;
}

- (unint64_t)inAWDL_BestInfraScore
{
  return self->_inAWDL_BestInfraScore;
}

- (void)setInAWDL_BestInfraScore:(unint64_t)a3
{
  self->_inAWDL_BestInfraScore = a3;
}

- (unint64_t)inAWDL_WorstInfraScore
{
  return self->_inAWDL_WorstInfraScore;
}

- (void)setInAWDL_WorstInfraScore:(unint64_t)a3
{
  self->_inAWDL_WorstInfraScore = a3;
}

- (double)inAWDL_BestP2PScore
{
  return self->_inAWDL_BestP2PScore;
}

- (void)setInAWDL_BestP2PScore:(double)a3
{
  self->_inAWDL_BestP2PScore = a3;
}

- (double)inAWDL_WorstP2PScore
{
  return self->_inAWDL_WorstP2PScore;
}

- (void)setInAWDL_WorstP2PScore:(double)a3
{
  self->_inAWDL_WorstP2PScore = a3;
}

- (unint64_t)inAWDL_lastInfraScore
{
  return self->_inAWDL_lastInfraScore;
}

- (void)setInAWDL_lastInfraScore:(unint64_t)a3
{
  self->_inAWDL_lastInfraScore = a3;
}

- (double)inAWDL_lastP2PScore
{
  return self->_inAWDL_lastP2PScore;
}

- (void)setInAWDL_lastP2PScore:(double)a3
{
  self->_inAWDL_lastP2PScore = a3;
}

- (double)inAWDL_BestInfraScoreDuration
{
  return self->_inAWDL_BestInfraScoreDuration;
}

- (double)inAWDL_BestP2PScoreDuration
{
  return self->_inAWDL_BestP2PScoreDuration;
}

- (double)inAWDL_WorstInfraScoreDuration
{
  return self->_inAWDL_WorstInfraScoreDuration;
}

- (double)inAWDL_WorstP2PScoreDuration
{
  return self->_inAWDL_WorstP2PScoreDuration;
}

- (unint64_t)forwardedBssInwakeCount
{
  return self->_forwardedBssInwakeCount;
}

- (void)setForwardedBssInwakeCount:(unint64_t)a3
{
  self->_forwardedBssInwakeCount = a3;
}

- (unint64_t)forwardedBssInSleepCount
{
  return self->_forwardedBssInSleepCount;
}

- (void)setForwardedBssInSleepCount:(unint64_t)a3
{
  self->_forwardedBssInSleepCount = a3;
}

- (unint64_t)hostScanTriggersCount
{
  return self->_hostScanTriggersCount;
}

- (void)setHostScanTriggersCount:(unint64_t)a3
{
  self->_hostScanTriggersCount = a3;
}

- (unint64_t)roamScanTriggersCount
{
  return self->_roamScanTriggersCount;
}

- (void)setRoamScanTriggersCount:(unint64_t)a3
{
  self->_roamScanTriggersCount = a3;
}

- (unint64_t)pnoScanTriggersCount
{
  return self->_pnoScanTriggersCount;
}

- (void)setPnoScanTriggersCount:(unint64_t)a3
{
  self->_pnoScanTriggersCount = a3;
}

- (unint64_t)epnoScanTriggersCount
{
  return self->_epnoScanTriggersCount;
}

- (void)setEpnoScanTriggersCount:(unint64_t)a3
{
  self->_epnoScanTriggersCount = a3;
}

- (unint64_t)currentBssMsgInWakeCount
{
  return self->_currentBssMsgInWakeCount;
}

- (void)setCurrentBssMsgInWakeCount:(unint64_t)a3
{
  self->_currentBssMsgInWakeCount = a3;
}

- (unint64_t)currentBssMsgInSleepCount
{
  return self->_currentBssMsgInSleepCount;
}

- (void)setCurrentBssMsgInSleepCount:(unint64_t)a3
{
  self->_currentBssMsgInSleepCount = a3;
}

- (unint64_t)scanDataMsgInWakeCount
{
  return self->_scanDataMsgInWakeCount;
}

- (void)setScanDataMsgInWakeCount:(unint64_t)a3
{
  self->_scanDataMsgInWakeCount = a3;
}

- (unint64_t)scanDataMsgInSleepCount
{
  return self->_scanDataMsgInSleepCount;
}

- (void)setScanDataMsgInSleepCount:(unint64_t)a3
{
  self->_scanDataMsgInSleepCount = a3;
}

- (unint64_t)spmiMsgInAwakeCount
{
  return self->_spmiMsgInAwakeCount;
}

- (void)setSpmiMsgInAwakeCount:(unint64_t)a3
{
  self->_spmiMsgInAwakeCount = a3;
}

- (unint64_t)spmiMsgInSleepCount
{
  return self->_spmiMsgInSleepCount;
}

- (void)setSpmiMsgInSleepCount:(unint64_t)a3
{
  self->_spmiMsgInSleepCount = a3;
}

- (unint64_t)spmiMsgDropRssiFilterCount
{
  return self->_spmiMsgDropRssiFilterCount;
}

- (void)setSpmiMsgDropRssiFilterCount:(unint64_t)a3
{
  self->_spmiMsgDropRssiFilterCount = a3;
}

- (unint64_t)spmiMsgDropMaxFilterCount
{
  return self->_spmiMsgDropMaxFilterCount;
}

- (void)setSpmiMsgDropMaxFilterCount:(unint64_t)a3
{
  self->_spmiMsgDropMaxFilterCount = a3;
}

- (unint64_t)spmiMsgDropSpmiFailCount
{
  return self->_spmiMsgDropSpmiFailCount;
}

- (void)setSpmiMsgDropSpmiFailCount:(unint64_t)a3
{
  self->_spmiMsgDropSpmiFailCount = a3;
}

- (unint64_t)bssDropLowMemoryCount
{
  return self->_bssDropLowMemoryCount;
}

- (void)setBssDropLowMemoryCount:(unint64_t)a3
{
  self->_bssDropLowMemoryCount = a3;
}

- (BOOL)isInstantHotspot
{
  return self->_isInstantHotspot;
}

- (void)setIsInstantHotspot:(BOOL)a3
{
  self->_isInstantHotspot = a3;
}

- (BOOL)isAutoHotspot
{
  return self->_isAutoHotspot;
}

- (void)setIsAutoHotspot:(BOOL)a3
{
  self->_isAutoHotspot = a3;
}

- (int)maxPhyMode
{
  return self->_maxPhyMode;
}

- (void)setMaxPhyMode:(int)a3
{
  self->_maxPhyMode = a3;
}

- (WiFiUsageInterfaceCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_capabilities, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 11456);
}

- (id)completionContext
{
  return self->_completionContext;
}

- (void)setCompletionContext:(id)a3
{
  objc_storeStrong(&self->_completionContext, a3);
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_completionQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong(&self->_completionContext, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_lastAWDLSequenceUpdate, 0);
  objc_storeStrong((id *)&self->_lastUsbStatusChange, 0);
  objc_storeStrong((id *)&self->_savedLastJoinTime, 0);
  objc_storeStrong((id *)&self->_btAudioBand, 0);
  objc_storeStrong((id *)&self->_lastJoinTime, 0);
  objc_storeStrong((id *)&self->_prevNetworkNames, 0);
  objc_storeStrong((id *)&self->_lastCoexRealTimeOff, 0);
  objc_storeStrong((id *)&self->_lastCoexRealTimeOn, 0);
  objc_storeStrong((id *)&self->_ipV6DetailsPrevSession, 0);
  objc_storeStrong((id *)&self->_ipV4DetailsPrevSession, 0);
  objc_storeStrong((id *)&self->_ipV6Details, 0);
  objc_storeStrong((id *)&self->_ipV4Details, 0);
  objc_storeStrong((id *)&self->_lastNetwork6eDisableModeChangedTime, 0);
  objc_storeStrong((id *)&self->_lastSSIDdisable6eModeAtStart, 0);
  objc_storeStrong((id *)&self->_networkDisable6eModeAtStart, 0);
  objc_storeStrong((id *)&self->_activeApplications, 0);
  objc_storeStrong((id *)&self->_lqm, 0);
  objc_storeStrong((id *)&self->_lastDriverUnavailableReason, 0);
  objc_storeStrong((id *)&self->_lastDriverAvailableTime, 0);
  objc_storeStrong((id *)&self->_lastChipResetTime, 0);
  objc_storeStrong((id *)&self->_lastDriverTerminationTime, 0);
  objc_storeStrong((id *)&self->_secondaryIfStatsAtStart, 0);
  objc_storeStrong((id *)&self->_ifStatsAtStart, 0);
  objc_storeStrong((id *)&self->_lastSmartCoverState, 0);
  objc_storeStrong((id *)&self->_roamCandidatesPerBandWhenUnSuccessful, 0);
  objc_storeStrong((id *)&self->_roamCandidatesPerBandWhenSuccessful, 0);
  objc_storeStrong((id *)&self->_roamNeighborsByBand, 0);
  objc_storeStrong((id *)&self->_lastRoamSuppressionToggled, 0);
  objc_storeStrong((id *)&self->_batterySaverStateEntryTime, 0);
  objc_storeStrong((id *)&self->_lowPowerStateEntryTime, 0);
  objc_storeStrong((id *)&self->_lpasStateEntryTime, 0);
  objc_storeStrong((id *)&self->_wowStateEntryTime, 0);
  objc_storeStrong((id *)&self->_linkRecoveryDisabledTime, 0);
  objc_storeStrong((id *)&self->_lastCompatibilityModeChangedTime, 0);
  objc_storeStrong((id *)&self->_lastBssChangedTime, 0);
  objc_storeStrong((id *)&self->_lastPowerBudgetChangedTime, 0);
  objc_storeStrong((id *)&self->_lastLinkStateChangedTime, 0);
  objc_storeStrong((id *)&self->_lastUnexpectedLinkDownTime, 0);
  objc_storeStrong((id *)&self->_lastSystemSleepTime, 0);
  objc_storeStrong((id *)&self->_lastSystemWakeTime, 0);
  objc_storeStrong((id *)&self->_lastCellularOutrankingStateChangedTime, 0);
  objc_storeStrong((id *)&self->_lastCellularFallbackStateChangedTime, 0);
  objc_storeStrong((id *)&self->_lastControlCenterStateChangedTime, 0);
  objc_storeStrong((id *)&self->_lastPowerStateChangedTime, 0);
  objc_storeStrong((id *)&self->_softApActiveTime, 0);
  objc_storeStrong((id *)&self->_scanningActiveTime, 0);
  objc_storeStrong((id *)&self->_roamingActiveTime, 0);
  objc_storeStrong((id *)&self->_awdlActiveTime, 0);
  objc_storeStrong((id *)&self->_hidPresentTime, 0);
  objc_storeStrong((id *)&self->_scoActiveTime, 0);
  objc_storeStrong((id *)&self->_a2dpActiveTime, 0);
  objc_storeStrong((id *)&self->_inMotionStartedTime, 0);
  objc_storeStrong((id *)&self->_inVehicleEntryTime, 0);
  objc_storeStrong((id *)&self->_inWalkingEntryTime, 0);
  objc_storeStrong((id *)&self->_callStartedTime, 0);
  objc_storeStrong((id *)&self->_companionConnectionTime, 0);
  objc_storeStrong((id *)&self->_chargingStartedTime, 0);
  objc_storeStrong((id *)&self->_mediaStartedTime, 0);
  objc_storeStrong((id *)&self->_sessionEndTime, 0);
  objc_storeStrong((id *)&self->_sessionStartTime, 0);
  objc_storeStrong((id *)&self->_sessionInitTime, 0);
  objc_storeStrong((id *)&self->_networkDetailsAtEnd, 0);
  objc_storeStrong((id *)&self->_cellularDataStatus, 0);
  objc_storeStrong((id *)&self->_ca_config, 0);
  objc_storeStrong((id *)&self->_secondaryInterfaceName, 0);
  objc_storeStrong((id *)&self->_processInitTime, 0);
  objc_storeStrong((id *)&self->_currentBssSession, 0);
  objc_storeStrong((id *)&self->_networkDetails, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_disconnectReasonMap, 0);
}

@end
