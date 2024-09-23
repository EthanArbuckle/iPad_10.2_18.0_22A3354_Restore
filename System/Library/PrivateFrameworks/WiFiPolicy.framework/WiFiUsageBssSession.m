@implementation WiFiUsageBssSession

- (void)scanningStateDidChange:(BOOL)a3 client:(unint64_t)a4 neighborBSS:(id)a5 otherBSS:(id)a6
{
  _BOOL4 v7;
  void *v9;
  void *v10;
  double v11;
  NSDate *lastPoorCoverageEntryTimestamp;
  double v13;
  double inScanDuration;
  void *v15;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date", a3, a4, a5, a6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v7)
  {
    if (!self->_scanningActiveTime)
      goto LABEL_14;
    v15 = v9;
    objc_msgSend(v9, "timeIntervalSinceDate:");
    self->_inScanDuration = v11 + self->_inScanDuration;
    lastPoorCoverageEntryTimestamp = self->_lastPoorCoverageEntryTimestamp;
    if (lastPoorCoverageEntryTimestamp)
    {
      -[NSDate timeIntervalSinceDate:](lastPoorCoverageEntryTimestamp, "timeIntervalSinceDate:", self->_scanningActiveTime);
      if (v13 <= 0.0)
        inScanDuration = self->_inScanDuration;
      else
        objc_msgSend(v15, "timeIntervalSinceDate:", self->_lastPoorCoverageEntryTimestamp);
      self->_poorCoverageAndScanDuration = inScanDuration + self->_poorCoverageAndScanDuration;
    }
    -[WiFiUsageBssSession setScanningActiveTime:](self, "setScanningActiveTime:", 0);
LABEL_13:
    v10 = v15;
    goto LABEL_14;
  }
  v15 = v9;
  -[WiFiUsageBssSession setScanningActiveTime:](self, "setScanningActiveTime:", v9);
  ++self->_inScanEventCount;
  if (a4 == 17)
  {
    ++self->_indoorScanCount;
    goto LABEL_13;
  }
  v10 = v15;
  if (a4 == 16)
    ++self->_locationScanCount;
LABEL_14:

}

- (void)setScanningActiveTime:(id)a3
{
  objc_storeStrong((id *)&self->_scanningActiveTime, a3);
}

- (void)linkQualityDidChange:(id)a3
{
  void *v4;
  void *v5;
  NSDate *lastLqmUpdateTimestamp;
  double v7;
  double v8;
  id v9;

  v9 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  lastLqmUpdateTimestamp = self->_lastLqmUpdateTimestamp;
  if (!lastLqmUpdateTimestamp)
    lastLqmUpdateTimestamp = self->_joinedTimestamp;
  objc_msgSend(v4, "timeIntervalSinceDate:", lastLqmUpdateTimestamp);
  v8 = v7;
  if (!self->_lastLqmUpdateTimestamp || v7 >= 1.0)
  {
    -[WiFiUsageBssSession setLastLqmUpdateTimestamp:](self, "setLastLqmUpdateTimestamp:", v5);
    -[WiFiUsageBssSession updateRssi:timeSinceLastUpdate:](self, "updateRssi:timeSinceLastUpdate:", objc_msgSend(v9, "rssi"), v8);
  }

}

- (void)updateRssi:(int64_t)a3 timeSinceLastUpdate:(double)a4
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t minLinkRssi;
  int64_t maxLinkRssi;
  int64_t v18;
  int64_t v19;
  int64_t v20;
  int64_t v21;
  int64_t avgLinkRssi;
  uint64_t v23;
  NSDate *lastPoorCoverageEntryTimestamp;
  void *v25;
  uint64_t v26;
  double v27;
  double v28;
  uint64_t v29;
  double v30;
  double v31;
  uint64_t v32;
  double v33;
  double v34;
  void *v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  void *v40;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (a3)
  {
    v40 = (void *)v7;
    -[WiFiUsageBssSession setLastLinkRssi:](self, "setLastLinkRssi:", a3);
    if (a3 <= -41)
    {
      if ((unint64_t)a3 <= 0xFFFFFFFFFFFFFFCDLL)
      {
        v9 = 528;
        v10 = 536;
        v11 = 544;
        v12 = 552;
        v13 = 560;
        v14 = 568;
        v15 = 584;
        if ((unint64_t)a3 > 0xFFFFFFFFFFFFFFA5)
          v15 = 576;
        if ((unint64_t)a3 <= 0xFFFFFFFFFFFFFFAALL)
          v14 = v15;
        if ((unint64_t)a3 <= 0xFFFFFFFFFFFFFFAFLL)
          v13 = v14;
        if ((unint64_t)a3 <= 0xFFFFFFFFFFFFFFB4)
          v12 = v13;
        if ((unint64_t)a3 <= 0xFFFFFFFFFFFFFFB9)
          v11 = v12;
        if ((unint64_t)a3 <= 0xFFFFFFFFFFFFFFBELL)
          v10 = v11;
        if ((unint64_t)a3 <= 0xFFFFFFFFFFFFFFC3)
          v9 = v10;
      }
      else
      {
        v9 = 520;
      }
    }
    else
    {
      v9 = 512;
    }
    v8 = v40;
    *(Class *)((char *)&self->super.isa + v9) = (Class)(uint64_t)((double)*(uint64_t *)((char *)&self->super.isa + v9) + a4);
    maxLinkRssi = self->_maxLinkRssi;
    minLinkRssi = self->_minLinkRssi;
    if (minLinkRssi >= a3)
      v18 = a3;
    else
      v18 = self->_minLinkRssi;
    if (minLinkRssi)
      v19 = v18;
    else
      v19 = a3;
    if (maxLinkRssi <= a3)
      v20 = a3;
    else
      v20 = self->_maxLinkRssi;
    if (maxLinkRssi)
      v21 = v20;
    else
      v21 = a3;
    self->_maxLinkRssi = v21;
    self->_minLinkRssi = v19;
    avgLinkRssi = self->_avgLinkRssi;
    if (avgLinkRssi)
      v23 = (uint64_t)((double)(avgLinkRssi + a3) * 0.5);
    else
      v23 = a3;
    self->_avgLinkRssi = v23;
    lastPoorCoverageEntryTimestamp = self->_lastPoorCoverageEntryTimestamp;
    if (self->_roamConfigTriggerRssi <= a3)
    {
      if (lastPoorCoverageEntryTimestamp)
      {
        if (self->_a2dpActiveTime)
        {
          -[NSDate timeIntervalSinceDate:](lastPoorCoverageEntryTimestamp, "timeIntervalSinceDate:");
          v26 = 928;
          if (v27 > 0.0)
            v26 = 416;
          objc_msgSend(v40, "timeIntervalSinceDate:", *(Class *)((char *)&self->super.isa + v26));
          self->_poorCoverageAndA2dpDuration = v28 + self->_poorCoverageAndA2dpDuration;
        }
        if (self->_scoActiveTime)
        {
          -[NSDate timeIntervalSinceDate:](self->_lastPoorCoverageEntryTimestamp, "timeIntervalSinceDate:");
          v29 = 936;
          if (v30 > 0.0)
            v29 = 416;
          objc_msgSend(v40, "timeIntervalSinceDate:", *(Class *)((char *)&self->super.isa + v29));
          self->_poorCoverageAndScoDuration = v31 + self->_poorCoverageAndScoDuration;
        }
        if (self->_awdlActiveTime)
        {
          -[NSDate timeIntervalSinceDate:](self->_lastPoorCoverageEntryTimestamp, "timeIntervalSinceDate:");
          v32 = 952;
          if (v33 > 0.0)
            v32 = 416;
          objc_msgSend(v40, "timeIntervalSinceDate:", *(Class *)((char *)&self->super.isa + v32));
          self->_poorCoverageAndAwdlDuration = v34 + self->_poorCoverageAndAwdlDuration;
        }
        v35 = v40;
        if (self->_scanningActiveTime)
        {
          -[NSDate timeIntervalSinceDate:](self->_lastPoorCoverageEntryTimestamp, "timeIntervalSinceDate:");
          v36 = 968;
          if (v37 > 0.0)
            v36 = 416;
          objc_msgSend(v40, "timeIntervalSinceDate:", *(Class *)((char *)&self->super.isa + v36));
          v35 = v40;
          self->_poorCoverageAndScanDuration = v38 + self->_poorCoverageAndScanDuration;
        }
        objc_msgSend(v35, "timeIntervalSinceDate:", self->_lastPoorCoverageEntryTimestamp);
        v25 = 0;
        self->_inPoorCoverageDuration = v39 + self->_inPoorCoverageDuration;
        goto LABEL_56;
      }
    }
    else
    {
      v25 = v40;
      if (!lastPoorCoverageEntryTimestamp)
      {
LABEL_56:
        -[WiFiUsageBssSession setLastPoorCoverageEntryTimestamp:](self, "setLastPoorCoverageEntryTimestamp:", v25);
        v8 = v40;
      }
    }
  }

}

- (void)setLastLqmUpdateTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_lastLqmUpdateTimestamp, a3);
}

- (void)setLastLinkRssi:(int64_t)a3
{
  self->_lastLinkRssi = a3;
}

- (void)updateWithRoamingSuppression:(unsigned __int8)a3
{
  int v3;
  void *v5;
  double v6;
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
LABEL_6:
      obja = v5;
      ++self->_inRoamSuppressionEnabledCount;
      objc_storeStrong((id *)&self->_lastRoamSuppressionToggled, v5);
      self->_roamsAfterSupprLifted = 0;
      self->_lastRoamSuppressionWaitForRoamStart = 0.0;
      self->_lastRoamSuppressionWaitForRoamEnd = 0.0;
      NSLog(CFSTR("%s - RoamSuppression is started: reset _roamsAfterSupprLifted,_lastRoamSuppressionWaitForRoamStart/End. incrementing _inRoamSuppressionEnabledCount:%lu"), "-[WiFiUsageBssSession updateWithRoamingSuppression:]", self->_inRoamSuppressionEnabledCount);
      v5 = obja;
    }
  }
  else if (self->_isRoamSuppressionEnabled)
  {
    obj = v5;
    objc_msgSend(v5, "timeIntervalSinceDate:", self->_lastRoamSuppressionToggled);
    v7 = v6 + self->_inRoamSuppressionEnabledDuration;
    self->_inRoamSuppressionEnabledDuration = v7;
    NSLog(CFSTR("%s - RoamSuppression is lifted: incrementing inRoamSuppressionEnabled:%fs"), "-[WiFiUsageBssSession updateWithRoamingSuppression:]", *(_QWORD *)&v7);
    v5 = obj;
    if (self->_isRoamSuppressionEnabled)
      goto LABEL_6;
  }
  self->_isRoamSuppressionEnabled = v3 != 0;

}

- (void)roamingARConfigurationDidChange:(id *)a3
{
  __int128 v3;

  self->_supportsAdaptiveRoaming = a3->var0;
  v3 = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_roamConfigCriteria.networkOfInterestType = *(_OWORD *)&a3->var5;
  *(_OWORD *)&self->_roamConfigCriteria.isAllowed = v3;
}

- (WiFiUsageBssSession)initWithInterfaceName:(id)a3 bssEnvironment:(id)a4 andBssDetails:(id)a5 andNetworkDetails:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  WiFiUsageBssSession *v15;
  void *v16;
  WiFiUsageBssSession *v17;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19.receiver = self;
    v19.super_class = (Class)WiFiUsageBssSession;
    v15 = -[WiFiUsageBssSession init](&v19, sel_init);
    -[WiFiUsageBssSession setInterfaceName:](v15, "setInterfaceName:", v10);
    v16 = (void *)objc_opt_new();
    -[WiFiUsageBssSession setRoamNeighborsByBand:](v15, "setRoamNeighborsByBand:", v16);

    -[WiFiUsageBssSession reset](v15, "reset");
    -[WiFiUsageBssSession setBssEnvironment:](v15, "setBssEnvironment:", v11);
    -[WiFiUsageBssSession setOriginBssDetails:](v15, "setOriginBssDetails:", v12);
    -[WiFiUsageBssSession setTargetBssDetails:](v15, "setTargetBssDetails:", 0);
    -[WiFiUsageBssSession setNetworkDetails:](v15, "setNetworkDetails:", v13);
    -[WiFiUsageBssSession setJoinRssi:](v15, "setJoinRssi:", objc_msgSend(v12, "rssi"));
    -[WiFiUsageBssSession setCurrentBand:](v15, "setCurrentBand:", objc_msgSend(v12, "band"));
    -[WiFiUsageBssSession setCurrentChannel:](v15, "setCurrentChannel:", objc_msgSend(v12, "channel"));
    -[WiFiUsageBssSession setLastLinkRssi:](v15, "setLastLinkRssi:", objc_msgSend(v12, "rssi"));
    -[WiFiUsageBssSession setJoinedTimestamp:](v15, "setJoinedTimestamp:", v14);
    self = v15;

    v17 = self;
  }
  else
  {
    NSLog(CFSTR("%s - Cannot init Session (invalid interfaceName: %@)"), "-[WiFiUsageBssSession initWithInterfaceName:bssEnvironment:andBssDetails:andNetworkDetails:]", 0);
    v17 = 0;
  }

  return v17;
}

- (void)reset
{
  id v3;

  *(_OWORD *)&self->_faultReasonCount[30] = 0u;
  *(_OWORD *)&self->_faultReasonCount[28] = 0u;
  *(_OWORD *)&self->_faultReasonCount[26] = 0u;
  *(_OWORD *)&self->_faultReasonCount[24] = 0u;
  *(_OWORD *)&self->_faultReasonCount[22] = 0u;
  *(_OWORD *)&self->_faultReasonCount[20] = 0u;
  *(_OWORD *)&self->_faultReasonCount[18] = 0u;
  *(_OWORD *)&self->_faultReasonCount[16] = 0u;
  *(_OWORD *)&self->_faultReasonCount[14] = 0u;
  *(_OWORD *)&self->_faultReasonCount[12] = 0u;
  *(_OWORD *)&self->_faultReasonCount[10] = 0u;
  *(_OWORD *)&self->_faultReasonCount[8] = 0u;
  *(_OWORD *)&self->_faultReasonCount[6] = 0u;
  *(_OWORD *)&self->_faultReasonCount[4] = 0u;
  *(_OWORD *)&self->_faultReasonCount[2] = 0u;
  *(_OWORD *)self->_faultReasonCount = 0u;
  *(_OWORD *)&self->_faultReasonCount[32] = 0u;
  -[WiFiUsageBssSession setJoinedTimestamp:](self, "setJoinedTimestamp:", 0);
  -[WiFiUsageBssSession setLastLqmUpdateTimestamp:](self, "setLastLqmUpdateTimestamp:", 0);
  -[WiFiUsageBssSession setLastPoorCoverageEntryTimestamp:](self, "setLastPoorCoverageEntryTimestamp:", 0);
  -[WiFiUsageBssSession setOriginBssDetails:](self, "setOriginBssDetails:", 0);
  -[WiFiUsageBssSession setTargetBssDetails:](self, "setTargetBssDetails:", 0);
  -[WiFiUsageBssSession setCellularFallbackEnabled:](self, "setCellularFallbackEnabled:", 0);
  -[WiFiUsageBssSession setCellularOutrankingEnabled:](self, "setCellularOutrankingEnabled:", 0);
  -[WiFiUsageBssSession setBssEnvironment:](self, "setBssEnvironment:", 0);
  -[WiFiUsageBssSession setSupportsFastlane:](self, "setSupportsFastlane:", 0);
  -[WiFiUsageBssSession setSupportsFastTransition:](self, "setSupportsFastTransition:", 0);
  -[WiFiUsageBssSession setSupportsNeighborReport:](self, "setSupportsNeighborReport:", 0);
  -[WiFiUsageBssSession setSupportsBssTransitionManagement:](self, "setSupportsBssTransitionManagement:", 0);
  -[WiFiUsageBssSession setSupportsAdaptiveFastTransition:](self, "setSupportsAdaptiveFastTransition:", 0);
  -[WiFiUsageBssSession setSupportsAdaptiveRoaming:](self, "setSupportsAdaptiveRoaming:", 0);
  -[WiFiUsageBssSession setSupportsNetworkAssurance:](self, "setSupportsNetworkAssurance:", 0);
  -[WiFiUsageBssSession setRoamConfigTriggerRssi:](self, "setRoamConfigTriggerRssi:", -75);
  *(_OWORD *)&self->_roamConfigChannels.valueByBand[2] = 0u;
  *(_OWORD *)self->_roamConfigChannels.valueByBand = 0u;
  *(_OWORD *)&self->_roamConfigCriteria.isAllowed = 0u;
  *(_OWORD *)&self->_roamConfigCriteria.networkOfInterestType = 0u;
  -[WiFiUsageBssSession setJoinRssi:](self, "setJoinRssi:", 0);
  -[WiFiUsageBssSession setNewRssi:](self, "setNewRssi:", 0);
  -[WiFiUsageBssSession setLastLinkRssi:](self, "setLastLinkRssi:", 0);
  -[WiFiUsageBssSession setLastRoamScanRssi:](self, "setLastRoamScanRssi:", 0);
  -[WiFiUsageBssSession setCurrentBand:](self, "setCurrentBand:", 3);
  -[WiFiUsageBssSession setNewBand:](self, "setNewBand:", 3);
  -[WiFiUsageBssSession setCurrentChannel:](self, "setCurrentChannel:", 0);
  -[WiFiUsageBssSession setNewChannel:](self, "setNewChannel:", 0);
  -[WiFiUsageBssSession setLinkRssiGt40:](self, "setLinkRssiGt40:", 0);
  -[WiFiUsageBssSession setLinkRssi40to50:](self, "setLinkRssi40to50:", 0);
  -[WiFiUsageBssSession setLinkRssi50to60:](self, "setLinkRssi50to60:", 0);
  -[WiFiUsageBssSession setLinkRssi60to65:](self, "setLinkRssi60to65:", 0);
  -[WiFiUsageBssSession setLinkRssi65to70:](self, "setLinkRssi65to70:", 0);
  -[WiFiUsageBssSession setLinkRssi70to75:](self, "setLinkRssi70to75:", 0);
  -[WiFiUsageBssSession setLinkRssi75to80:](self, "setLinkRssi75to80:", 0);
  -[WiFiUsageBssSession setLinkRssi80to85:](self, "setLinkRssi80to85:", 0);
  -[WiFiUsageBssSession setLinkRssi85to90:](self, "setLinkRssi85to90:", 0);
  -[WiFiUsageBssSession setLinkRssiLt90:](self, "setLinkRssiLt90:", 0);
  -[WiFiUsageBssSession setRoamReasonInitialAssociationCount:](self, "setRoamReasonInitialAssociationCount:", 0);
  -[WiFiUsageBssSession setRoamReasonLowRssiCount:](self, "setRoamReasonLowRssiCount:", 0);
  -[WiFiUsageBssSession setRoamReasonDeauthDisassocCount:](self, "setRoamReasonDeauthDisassocCount:", 0);
  -[WiFiUsageBssSession setRoamReasonBeaconLostCount:](self, "setRoamReasonBeaconLostCount:", 0);
  -[WiFiUsageBssSession setRoamReasonSteeredByApCount:](self, "setRoamReasonSteeredByApCount:", 0);
  -[WiFiUsageBssSession setRoamReasonSteeredByBtmCount:](self, "setRoamReasonSteeredByBtmCount:", 0);
  -[WiFiUsageBssSession setRoamReasonSteeredByCsaCount:](self, "setRoamReasonSteeredByCsaCount:", 0);
  -[WiFiUsageBssSession setRoamReasonReassocRequestedCount:](self, "setRoamReasonReassocRequestedCount:", 0);
  -[WiFiUsageBssSession setRoamReasonHostTriggeredCount:](self, "setRoamReasonHostTriggeredCount:", 0);
  -[WiFiUsageBssSession setRoamReasonBetterCandidateCount:](self, "setRoamReasonBetterCandidateCount:", 0);
  -[WiFiUsageBssSession setRoamReasonBetterConditionCount:](self, "setRoamReasonBetterConditionCount:", 0);
  -[WiFiUsageBssSession setRoamReasonMiscCount:](self, "setRoamReasonMiscCount:", 0);
  -[WiFiUsageBssSession setRoamStatusSucceededCount:](self, "setRoamStatusSucceededCount:", 0);
  -[WiFiUsageBssSession setRoamStatusFailedCount:](self, "setRoamStatusFailedCount:", 0);
  -[WiFiUsageBssSession setRoamStatusNoCandidateCount:](self, "setRoamStatusNoCandidateCount:", 0);
  -[WiFiUsageBssSession setRoamStatusNoQualifiedCandidateCount:](self, "setRoamStatusNoQualifiedCandidateCount:", 0);
  -[WiFiUsageBssSession setRoamIsWNMScoreUsedCount:](self, "setRoamIsWNMScoreUsedCount:", 0);
  -[WiFiUsageBssSession setRoamPingPongNth:](self, "setRoamPingPongNth:", 0);
  -[WiFiUsageBssSession setIsRoamSuppressionEnabled:](self, "setIsRoamSuppressionEnabled:", 0);
  -[WiFiUsageBssSession setRoamsAfterSupprLifted:](self, "setRoamsAfterSupprLifted:", 0);
  -[WiFiUsageBssSession setLastRoamSuppressionToggled:](self, "setLastRoamSuppressionToggled:", 0);
  -[WiFiUsageBssSession setInRoamSuppressionEnabledCount:](self, "setInRoamSuppressionEnabledCount:", 0);
  -[WiFiUsageBssSession setInRoamSuppressionEnabledDuration:](self, "setInRoamSuppressionEnabledDuration:", 0.0);
  -[WiFiUsageBssSession setLastRoamSuppressionWaitForRoamStart:](self, "setLastRoamSuppressionWaitForRoamStart:", 0.0);
  -[WiFiUsageBssSession setLastRoamSuppressionWaitForRoamEnd:](self, "setLastRoamSuppressionWaitForRoamEnd:", 0.0);
  -[WiFiUsageBssSession setBssTransitionRequestCount:](self, "setBssTransitionRequestCount:", 0);
  -[WiFiUsageBssSession setBssTransitionAcceptedCount:](self, "setBssTransitionAcceptedCount:", 0);
  -[WiFiUsageBssSession setBssTransitionRejectedCount:](self, "setBssTransitionRejectedCount:", 0);
  -[WiFiUsageBssSession setMinCandidatesCount:](self, "setMinCandidatesCount:", 0);
  -[WiFiUsageBssSession setMaxCandidatesCount:](self, "setMaxCandidatesCount:", 0);
  -[WiFiUsageBssSession setCurrentRSSIStrongestCount:](self, "setCurrentRSSIStrongestCount:", 0);
  -[NSMutableDictionary removeAllObjects](self->_roamNeighborsByBand, "removeAllObjects");
  *(_OWORD *)&self->_strongestRSSICountByBand.valueByBand[2] = 0u;
  *(_OWORD *)self->_strongestRSSICountByBand.valueByBand = 0u;
  *(_OWORD *)self->_strongestRSSIByBand.valueByBand = 0u;
  *(_OWORD *)&self->_strongestRSSIByBand.valueByBand[2] = 0u;
  *(_OWORD *)self->_roamNeighsSmllstCurrentToBestRssiByBand.valueByBand = 0u;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBand.valueByBand[2] = 0u;
  *(_OWORD *)self->_roamNeighsLrgstCurrentToBestRssiByBand.valueByBand = 0u;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBand.valueByBand[2] = 0u;
  *(_OWORD *)self->_roamNeighsSmllstCurrentToNextBestRssiByBand.valueByBand = 0u;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBand.valueByBand[2] = 0u;
  *(_OWORD *)self->_roamNeighsLrgstCurrentToNextBestRssiByBand.valueByBand = 0u;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBand.valueByBand[2] = 0u;
  -[WiFiUsageBssSession setHighRssiRoamScanCount:](self, "setHighRssiRoamScanCount:", 0);
  -[WiFiUsageBssSession setLowRssiRoamScanCount:](self, "setLowRssiRoamScanCount:", 0);
  -[WiFiUsageBssSession setUnexpectedBeaconLostRoamScanCount:](self, "setUnexpectedBeaconLostRoamScanCount:", 0);
  -[WiFiUsageBssSession setPoorCoverageAndA2dpDuration:](self, "setPoorCoverageAndA2dpDuration:", 0.0);
  -[WiFiUsageBssSession setPoorCoverageAndScoDuration:](self, "setPoorCoverageAndScoDuration:", 0.0);
  -[WiFiUsageBssSession setPoorCoverageAndAwdlDuration:](self, "setPoorCoverageAndAwdlDuration:", 0.0);
  -[WiFiUsageBssSession setPoorCoverageAndScanDuration:](self, "setPoorCoverageAndScanDuration:", 0.0);
  -[WiFiUsageBssSession setMinRoamLatency:](self, "setMinRoamLatency:", 0.0);
  -[WiFiUsageBssSession setMaxRoamLatency:](self, "setMaxRoamLatency:", 0.0);
  -[WiFiUsageBssSession setPartialScanCount:](self, "setPartialScanCount:", 0);
  -[WiFiUsageBssSession setFullScanCount:](self, "setFullScanCount:", 0);
  -[WiFiUsageBssSession setCallStartedTime:](self, "setCallStartedTime:", 0);
  -[WiFiUsageBssSession setInVehicleEntryTime:](self, "setInVehicleEntryTime:", 0);
  -[WiFiUsageBssSession setInMotionStartedTime:](self, "setInMotionStartedTime:", 0);
  -[WiFiUsageBssSession setA2dpActiveTime:](self, "setA2dpActiveTime:", 0);
  -[WiFiUsageBssSession setScoActiveTime:](self, "setScoActiveTime:", 0);
  -[WiFiUsageBssSession setHidPresentTime:](self, "setHidPresentTime:", 0);
  -[WiFiUsageBssSession setAwdlActiveTime:](self, "setAwdlActiveTime:", 0);
  -[WiFiUsageBssSession setRoamingActiveTime:](self, "setRoamingActiveTime:", 0);
  -[WiFiUsageBssSession setScanningActiveTime:](self, "setScanningActiveTime:", 0);
  -[WiFiUsageBssSession setLastCellularFallbackStateChangedTime:](self, "setLastCellularFallbackStateChangedTime:", 0);
  -[WiFiUsageBssSession setLastCellularOutrankingStateChangedTime:](self, "setLastCellularOutrankingStateChangedTime:", 0);
  -[WiFiUsageBssSession setInCallDuration:](self, "setInCallDuration:", 0.0);
  -[WiFiUsageBssSession setInVehicleDuration:](self, "setInVehicleDuration:", 0.0);
  -[WiFiUsageBssSession setInMotionDuration:](self, "setInMotionDuration:", 0.0);
  -[WiFiUsageBssSession setInA2dpDuration:](self, "setInA2dpDuration:", 0.0);
  -[WiFiUsageBssSession setInScoDuration:](self, "setInScoDuration:", 0.0);
  -[WiFiUsageBssSession setInHidPresentDuration:](self, "setInHidPresentDuration:", 0.0);
  -[WiFiUsageBssSession setInAwdlDuration:](self, "setInAwdlDuration:", 0.0);
  -[WiFiUsageBssSession setInRoamDuration:](self, "setInRoamDuration:", 0.0);
  -[WiFiUsageBssSession setInScanDuration:](self, "setInScanDuration:", 0.0);
  -[WiFiUsageBssSession setInCellularFallbackDuration:](self, "setInCellularFallbackDuration:", 0.0);
  -[WiFiUsageBssSession setInCellularOutrankingDuration:](self, "setInCellularOutrankingDuration:", 0.0);
  -[WiFiUsageBssSession setInPoorCoverageDuration:](self, "setInPoorCoverageDuration:", 0.0);
  -[WiFiUsageBssSession setInCallEventCount:](self, "setInCallEventCount:", 0);
  -[WiFiUsageBssSession setInVehicleEventCount:](self, "setInVehicleEventCount:", 0);
  -[WiFiUsageBssSession setInMotionEventCount:](self, "setInMotionEventCount:", 0);
  -[WiFiUsageBssSession setInA2dpEventCount:](self, "setInA2dpEventCount:", 0);
  -[WiFiUsageBssSession setInScoEventCount:](self, "setInScoEventCount:", 0);
  -[WiFiUsageBssSession setInHidPresentCount:](self, "setInHidPresentCount:", 0);
  -[WiFiUsageBssSession setInAwdlEventCount:](self, "setInAwdlEventCount:", 0);
  -[WiFiUsageBssSession setInRoamEventCount:](self, "setInRoamEventCount:", 0);
  -[WiFiUsageBssSession setInScanEventCount:](self, "setInScanEventCount:", 0);
  -[WiFiUsageBssSession setCellularFallbackStateChangedCount:](self, "setCellularFallbackStateChangedCount:", 0);
  -[WiFiUsageBssSession setCellularOutrankingStateChangedCount:](self, "setCellularOutrankingStateChangedCount:", 0);
  -[WiFiUsageBssSession setLocationScanCount:](self, "setLocationScanCount:", 0);
  -[WiFiUsageBssSession setIndoorScanCount:](self, "setIndoorScanCount:", 0);
  -[WiFiUsageBssSession setTriggerDisconnectAlertedCount:](self, "setTriggerDisconnectAlertedCount:", 0);
  -[WiFiUsageBssSession setTriggerDisconnectConfirmedCount:](self, "setTriggerDisconnectConfirmedCount:", 0);
  -[WiFiUsageBssSession setTriggerDisconnectExecutedCount:](self, "setTriggerDisconnectExecutedCount:", 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageBssSession setLastCompatibilityModeChangedTime:](self, "setLastCompatibilityModeChangedTime:", v3);

}

- (void)setJoinRssi:(int64_t)a3
{
  self->_joinRssi = a3;
  self->_leftRssi = a3;
  self->_maxLinkRssi = a3;
  self->_minLinkRssi = a3;
  self->_avgLinkRssi = a3;
}

- (void)bssDidChange:(id)a3 withDetails:(id)a4
{
  id v6;
  void *v7;
  int64_t lastLinkRssi;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  lastLinkRssi = self->_lastLinkRssi;
  if (lastLinkRssi >= self->_lastRoamScanRssi)
    lastLinkRssi = self->_lastRoamScanRssi;
  self->_leftRssi = lastLinkRssi;
  if (v6
    && (-[WiFiUsageBssSession setNewBand:](self, "setNewBand:", objc_msgSend(v6, "band")),
        -[WiFiUsageBssSession setNewChannel:](self, "setNewChannel:", objc_msgSend(v6, "channel")),
        -[WiFiUsageBssSession setNewRssi:](self, "setNewRssi:", objc_msgSend(v6, "rssi")),
        -[WiFiUsageBssSession setTargetBssDetails:](self, "setTargetBssDetails:", v6),
        self->_roamingActiveTime))
  {
    NSLog(CFSTR("%s: in roaming state, skipping BSS session end"), "-[WiFiUsageBssSession bssDidChange:withDetails:]");
  }
  else
  {
    if (self->_originBssDetails)
    {
      NSLog(CFSTR("%s: BSS session ended"), "-[WiFiUsageBssSession bssDidChange:withDetails:]");
      -[WiFiUsageBssSession updateActivityDurations:](self, "updateActivityDurations:", v7);
      -[WiFiUsageBssSession submitAnalytics](self, "submitAnalytics");
      -[WiFiUsageBssSession reset](self, "reset");
    }
    if (v6)
    {
      -[WiFiUsageBssSession setOriginBssDetails:](self, "setOriginBssDetails:", v6);
      -[WiFiUsageBssSession setTargetBssDetails:](self, "setTargetBssDetails:", 0);
      -[WiFiUsageBssSession setJoinRssi:](self, "setJoinRssi:", objc_msgSend(v6, "rssi"));
      -[WiFiUsageBssSession setCurrentBand:](self, "setCurrentBand:", objc_msgSend(v6, "band"));
      -[WiFiUsageBssSession setCurrentChannel:](self, "setCurrentChannel:", objc_msgSend(v6, "channel"));
      -[WiFiUsageBssSession setLastLinkRssi:](self, "setLastLinkRssi:", objc_msgSend(v6, "rssi"));
      -[WiFiUsageBssSession setJoinedTimestamp:](self, "setJoinedTimestamp:", v7);
      -[WiFiUsageBssSession setBssEnvironment:](self, "setBssEnvironment:", v9);
    }
  }

}

- (void)updateActivityDurations:(id)a3
{
  id v4;
  NSDate *lastLqmUpdateTimestamp;
  NSDate *lastPoorCoverageEntryTimestamp;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  NSDate *lastRoamSuppressionToggled;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;

  v4 = a3;
  lastLqmUpdateTimestamp = self->_lastLqmUpdateTimestamp;
  v36 = v4;
  if (!lastLqmUpdateTimestamp)
    lastLqmUpdateTimestamp = self->_joinedTimestamp;
  objc_msgSend(v4, "timeIntervalSinceDate:", lastLqmUpdateTimestamp);
  -[WiFiUsageBssSession updateRssi:timeSinceLastUpdate:](self, "updateRssi:timeSinceLastUpdate:", self->_lastLinkRssi);
  lastPoorCoverageEntryTimestamp = self->_lastPoorCoverageEntryTimestamp;
  if (lastPoorCoverageEntryTimestamp)
  {
    if (self->_a2dpActiveTime)
    {
      -[NSDate timeIntervalSinceDate:](lastPoorCoverageEntryTimestamp, "timeIntervalSinceDate:");
      v7 = 928;
      if (v8 > 0.0)
        v7 = 416;
      objc_msgSend(v36, "timeIntervalSinceDate:", *(Class *)((char *)&self->super.isa + v7));
      self->_poorCoverageAndA2dpDuration = v9 + self->_poorCoverageAndA2dpDuration;
    }
    if (self->_scoActiveTime)
    {
      -[NSDate timeIntervalSinceDate:](self->_lastPoorCoverageEntryTimestamp, "timeIntervalSinceDate:");
      v10 = 936;
      if (v11 > 0.0)
        v10 = 416;
      objc_msgSend(v36, "timeIntervalSinceDate:", *(Class *)((char *)&self->super.isa + v10));
      self->_poorCoverageAndScoDuration = v12 + self->_poorCoverageAndScoDuration;
    }
    if (self->_awdlActiveTime)
    {
      -[NSDate timeIntervalSinceDate:](self->_lastPoorCoverageEntryTimestamp, "timeIntervalSinceDate:");
      v13 = 952;
      if (v14 > 0.0)
        v13 = 416;
      objc_msgSend(v36, "timeIntervalSinceDate:", *(Class *)((char *)&self->super.isa + v13));
      self->_poorCoverageAndAwdlDuration = v15 + self->_poorCoverageAndAwdlDuration;
    }
    v16 = v36;
    if (self->_scanningActiveTime)
    {
      -[NSDate timeIntervalSinceDate:](self->_lastPoorCoverageEntryTimestamp, "timeIntervalSinceDate:");
      v17 = 968;
      if (v18 > 0.0)
        v17 = 416;
      objc_msgSend(v36, "timeIntervalSinceDate:", *(Class *)((char *)&self->super.isa + v17));
      v16 = v36;
      self->_poorCoverageAndScanDuration = v19 + self->_poorCoverageAndScanDuration;
    }
    objc_msgSend(v16, "timeIntervalSinceDate:", self->_lastPoorCoverageEntryTimestamp);
    self->_inPoorCoverageDuration = v20 + self->_inPoorCoverageDuration;
    -[WiFiUsageBssSession setLastPoorCoverageEntryTimestamp:](self, "setLastPoorCoverageEntryTimestamp:", 0);
  }
  if (self->_inMotionStartedTime)
  {
    objc_msgSend(v36, "timeIntervalSinceDate:");
    self->_inMotionDuration = v21 + self->_inMotionDuration;
    -[WiFiUsageBssSession setInMotionStartedTime:](self, "setInMotionStartedTime:", 0);
  }
  v22 = v36;
  if (self->_inVehicleEntryTime)
  {
    objc_msgSend(v36, "timeIntervalSinceDate:");
    self->_inVehicleDuration = v23 + self->_inVehicleDuration;
    -[WiFiUsageBssSession setInVehicleEntryTime:](self, "setInVehicleEntryTime:", 0);
    v22 = v36;
  }
  if (self->_callStartedTime)
  {
    objc_msgSend(v36, "timeIntervalSinceDate:");
    self->_inCallDuration = v24 + self->_inCallDuration;
    -[WiFiUsageBssSession setCallStartedTime:](self, "setCallStartedTime:", 0);
    v22 = v36;
  }
  if (self->_a2dpActiveTime)
  {
    objc_msgSend(v36, "timeIntervalSinceDate:");
    self->_inA2dpDuration = v25 + self->_inA2dpDuration;
    -[WiFiUsageBssSession setA2dpActiveTime:](self, "setA2dpActiveTime:", 0);
    v22 = v36;
  }
  if (self->_scoActiveTime)
  {
    objc_msgSend(v36, "timeIntervalSinceDate:");
    self->_inScoDuration = v26 + self->_inScoDuration;
    -[WiFiUsageBssSession setScoActiveTime:](self, "setScoActiveTime:", 0);
    v22 = v36;
  }
  if (self->_hidPresentTime)
  {
    objc_msgSend(v36, "timeIntervalSinceDate:");
    self->_inHidPresentDuration = v27 + self->_inHidPresentDuration;
    -[WiFiUsageBssSession setHidPresentTime:](self, "setHidPresentTime:", 0);
    v22 = v36;
  }
  if (self->_awdlActiveTime)
  {
    objc_msgSend(v36, "timeIntervalSinceDate:");
    self->_inAwdlDuration = v28 + self->_inAwdlDuration;
    -[WiFiUsageBssSession setAwdlActiveTime:](self, "setAwdlActiveTime:", 0);
    v22 = v36;
  }
  if (self->_roamingActiveTime)
  {
    objc_msgSend(v36, "timeIntervalSinceDate:");
    self->_inRoamDuration = v29 + self->_inRoamDuration;
    -[WiFiUsageBssSession setRoamingActiveTime:](self, "setRoamingActiveTime:", 0);
    v22 = v36;
  }
  if (self->_lastRoamSuppressionToggled && self->_isRoamSuppressionEnabled)
  {
    objc_msgSend(v36, "timeIntervalSinceDate:");
    self->_inRoamSuppressionEnabledDuration = v30 + self->_inRoamSuppressionEnabledDuration;
    lastRoamSuppressionToggled = self->_lastRoamSuppressionToggled;
    self->_lastRoamSuppressionToggled = 0;

    v22 = v36;
  }
  if (self->_scanningActiveTime)
  {
    objc_msgSend(v36, "timeIntervalSinceDate:");
    self->_inScanDuration = v32 + self->_inScanDuration;
    -[WiFiUsageBssSession setScanningActiveTime:](self, "setScanningActiveTime:", 0);
    v22 = v36;
  }
  if (self->_lastCellularFallbackStateChangedTime)
  {
    objc_msgSend(v36, "timeIntervalSinceDate:");
    self->_inCellularFallbackDuration = v33 + self->_inCellularFallbackDuration;
    -[WiFiUsageBssSession setLastCellularFallbackStateChangedTime:](self, "setLastCellularFallbackStateChangedTime:", 0);
    v22 = v36;
  }
  if (self->_lastCellularOutrankingStateChangedTime)
  {
    objc_msgSend(v36, "timeIntervalSinceDate:");
    self->_inCellularOutrankingDuration = v34 + self->_inCellularOutrankingDuration;
    -[WiFiUsageBssSession setLastCellularOutrankingStateChangedTime:](self, "setLastCellularOutrankingStateChangedTime:", 0);
    v22 = v36;
  }
  if (self->_isCompatibilityModeEnabled)
  {
    objc_msgSend(v36, "timeIntervalSinceDate:", self->_lastCompatibilityModeChangedTime);
    self->_inCompatibilityModeEnabledDuration = v35 + self->_inCompatibilityModeEnabledDuration;
    -[WiFiUsageBssSession setLastCompatibilityModeChangedTime:](self, "setLastCompatibilityModeChangedTime:", 0);
    v22 = v36;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;

  v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithInterfaceName:bssEnvironment:andBssDetails:andNetworkDetails:", self->_interfaceName, self->_bssEnvironment, self->_originBssDetails, self->_networkDetails);
  v5 = -[NSMutableDictionary mutableCopy](self->_sessionInfo, "mutableCopy");
  v6 = *(void **)(v4 + 344);
  *(_QWORD *)(v4 + 344) = v5;

  v7 = -[NSDate copy](self->_joinedTimestamp, "copy");
  v8 = *(void **)(v4 + 400);
  *(_QWORD *)(v4 + 400) = v7;

  v9 = -[NSDate copy](self->_lastLqmUpdateTimestamp, "copy");
  v10 = *(void **)(v4 + 408);
  *(_QWORD *)(v4 + 408) = v9;

  v11 = -[NSDate copy](self->_lastPoorCoverageEntryTimestamp, "copy");
  v12 = *(void **)(v4 + 416);
  *(_QWORD *)(v4 + 416) = v11;

  v13 = -[NSDate copy](self->_lastCellularFallbackStateChangedTime, "copy");
  v14 = *(void **)(v4 + 424);
  *(_QWORD *)(v4 + 424) = v13;

  v15 = -[NSDate copy](self->_lastCellularOutrankingStateChangedTime, "copy");
  v16 = *(void **)(v4 + 432);
  *(_QWORD *)(v4 + 432) = v15;

  v17 = -[WiFiUsageBssDetails copy](self->_targetBssDetails, "copy");
  v18 = *(void **)(v4 + 448);
  *(_QWORD *)(v4 + 448) = v17;

  *(_BYTE *)(v4 + 320) = self->_cellularFallbackEnabled;
  *(_BYTE *)(v4 + 321) = self->_cellularOutrankingEnabled;
  *(_BYTE *)(v4 + 322) = self->_supportsNeighborReport;
  *(_BYTE *)(v4 + 323) = self->_supportsFastTransition;
  *(_BYTE *)(v4 + 324) = self->_supportsBssTransitionManagement;
  *(_BYTE *)(v4 + 325) = self->_supportsAdaptiveFastTransition;
  *(_BYTE *)(v4 + 326) = self->_supportsFastlane;
  *(_BYTE *)(v4 + 327) = self->_supportsNetworkAssurance;
  *(_BYTE *)(v4 + 328) = self->_supportsAdaptiveRoaming;
  *(_QWORD *)(v4 + 352) = self->_roamConfigTriggerRssi;
  v19 = *(_OWORD *)self->_roamConfigChannels.valueByBand;
  *(_OWORD *)(v4 + 1232) = *(_OWORD *)&self->_roamConfigChannels.valueByBand[2];
  *(_OWORD *)(v4 + 1216) = v19;
  v20 = *(_OWORD *)&self->_roamConfigCriteria.isAllowed;
  *(_OWORD *)(v4 + 1264) = *(_OWORD *)&self->_roamConfigCriteria.networkOfInterestType;
  *(_OWORD *)(v4 + 1248) = v20;
  *(_QWORD *)(v4 + 472) = self->_newRssi;
  *(_QWORD *)(v4 + 480) = self->_lastLinkRssi;
  *(_QWORD *)(v4 + 488) = self->_lastRoamScanRssi;
  *(_DWORD *)(v4 + 336) = self->_currentBand;
  *(_DWORD *)(v4 + 340) = self->_newBand;
  *(_QWORD *)(v4 + 496) = self->_currentChannel;
  *(_QWORD *)(v4 + 504) = self->_newChannel;
  *(_QWORD *)(v4 + 512) = self->_linkRssiGt40;
  *(_QWORD *)(v4 + 520) = self->_linkRssi40to50;
  *(_QWORD *)(v4 + 528) = self->_linkRssi50to60;
  *(_QWORD *)(v4 + 536) = self->_linkRssi60to65;
  *(_QWORD *)(v4 + 544) = self->_linkRssi65to70;
  *(_QWORD *)(v4 + 552) = self->_linkRssi70to75;
  *(_QWORD *)(v4 + 560) = self->_linkRssi75to80;
  *(_QWORD *)(v4 + 568) = self->_linkRssi80to85;
  *(_QWORD *)(v4 + 576) = self->_linkRssi85to90;
  *(_QWORD *)(v4 + 584) = self->_linkRssiLt90;
  *(_QWORD *)(v4 + 592) = self->_roamReasonInitialAssociationCount;
  *(_QWORD *)(v4 + 600) = self->_roamReasonLowRssiCount;
  *(_QWORD *)(v4 + 608) = self->_roamReasonDeauthDisassocCount;
  *(_QWORD *)(v4 + 616) = self->_roamReasonBeaconLostCount;
  *(_QWORD *)(v4 + 624) = self->_roamReasonSteeredByApCount;
  *(_QWORD *)(v4 + 632) = self->_roamReasonSteeredByBtmCount;
  *(_QWORD *)(v4 + 640) = self->_roamReasonSteeredByCsaCount;
  *(_QWORD *)(v4 + 648) = self->_roamReasonReassocRequestedCount;
  *(_QWORD *)(v4 + 656) = self->_roamReasonHostTriggeredCount;
  *(_QWORD *)(v4 + 664) = self->_roamReasonBetterCandidateCount;
  *(_QWORD *)(v4 + 672) = self->_roamReasonBetterConditionCount;
  *(_QWORD *)(v4 + 680) = self->_roamReasonMiscCount;
  *(_QWORD *)(v4 + 688) = self->_roamStatusSucceededCount;
  *(_QWORD *)(v4 + 696) = self->_roamStatusFailedCount;
  *(_QWORD *)(v4 + 704) = self->_roamStatusNoCandidateCount;
  *(_QWORD *)(v4 + 712) = self->_roamStatusNoCandidateCount;
  *(_QWORD *)(v4 + 728) = self->_roamPingPongNth;
  *(_BYTE *)(v4 + 331) = self->_roamInMotion;
  *(_QWORD *)(v4 + 760) = self->_bssTransitionRequestCount;
  *(_QWORD *)(v4 + 768) = self->_bssTransitionAcceptedCount;
  *(_QWORD *)(v4 + 776) = self->_bssTransitionRejectedCount;
  *(_QWORD *)(v4 + 784) = self->_minCandidatesCount;
  *(_QWORD *)(v4 + 792) = self->_maxCandidatesCount;
  *(_QWORD *)(v4 + 800) = self->_currentRSSIStrongestCount;
  v21 = -[NSMutableDictionary copy](self->_roamNeighborsByBand, "copy");
  v22 = *(void **)(v4 + 808);
  *(_QWORD *)(v4 + 808) = v21;

  v23 = *(_OWORD *)self->_strongestRSSICountByBand.valueByBand;
  *(_OWORD *)(v4 + 1296) = *(_OWORD *)&self->_strongestRSSICountByBand.valueByBand[2];
  *(_OWORD *)(v4 + 1280) = v23;
  v24 = *(_OWORD *)self->_strongestRSSIByBand.valueByBand;
  *(_OWORD *)(v4 + 1328) = *(_OWORD *)&self->_strongestRSSIByBand.valueByBand[2];
  *(_OWORD *)(v4 + 1312) = v24;
  v25 = *(_OWORD *)self->_roamNeighsSmllstCurrentToBestRssiByBand.valueByBand;
  *(_OWORD *)(v4 + 1360) = *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBand.valueByBand[2];
  *(_OWORD *)(v4 + 1344) = v25;
  v26 = *(_OWORD *)self->_roamNeighsLrgstCurrentToBestRssiByBand.valueByBand;
  *(_OWORD *)(v4 + 1392) = *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBand.valueByBand[2];
  *(_OWORD *)(v4 + 1376) = v26;
  v27 = *(_OWORD *)self->_roamNeighsSmllstCurrentToNextBestRssiByBand.valueByBand;
  *(_OWORD *)(v4 + 1424) = *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBand.valueByBand[2];
  *(_OWORD *)(v4 + 1408) = v27;
  v28 = *(_OWORD *)self->_roamNeighsLrgstCurrentToNextBestRssiByBand.valueByBand;
  *(_OWORD *)(v4 + 1456) = *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBand.valueByBand[2];
  *(_OWORD *)(v4 + 1440) = v28;
  *(_QWORD *)(v4 + 816) = self->_highRssiRoamScanCount;
  *(_QWORD *)(v4 + 824) = self->_lowRssiRoamScanCount;
  *(_QWORD *)(v4 + 832) = self->_unexpectedBeaconLostRoamScanCount;
  *(double *)(v4 + 840) = self->_poorCoverageAndA2dpDuration;
  *(double *)(v4 + 848) = self->_poorCoverageAndScoDuration;
  *(double *)(v4 + 856) = self->_poorCoverageAndAwdlDuration;
  *(double *)(v4 + 864) = self->_poorCoverageAndScanDuration;
  *(double *)(v4 + 872) = self->_minRoamLatency;
  *(double *)(v4 + 880) = self->_maxRoamLatency;
  *(_QWORD *)(v4 + 888) = self->_partialScanCount;
  *(_QWORD *)(v4 + 896) = self->_fullScanCount;
  v29 = -[NSDate copy](self->_callStartedTime, "copy");
  v30 = *(void **)(v4 + 904);
  *(_QWORD *)(v4 + 904) = v29;

  v31 = -[NSDate copy](self->_inVehicleEntryTime, "copy");
  v32 = *(void **)(v4 + 912);
  *(_QWORD *)(v4 + 912) = v31;

  v33 = -[NSDate copy](self->_inMotionStartedTime, "copy");
  v34 = *(void **)(v4 + 920);
  *(_QWORD *)(v4 + 920) = v33;

  v35 = -[NSDate copy](self->_a2dpActiveTime, "copy");
  v36 = *(void **)(v4 + 928);
  *(_QWORD *)(v4 + 928) = v35;

  v37 = -[NSDate copy](self->_scoActiveTime, "copy");
  v38 = *(void **)(v4 + 936);
  *(_QWORD *)(v4 + 936) = v37;

  v39 = -[NSDate copy](self->_hidPresentTime, "copy");
  v40 = *(void **)(v4 + 944);
  *(_QWORD *)(v4 + 944) = v39;

  v41 = -[NSDate copy](self->_awdlActiveTime, "copy");
  v42 = *(void **)(v4 + 952);
  *(_QWORD *)(v4 + 952) = v41;

  v43 = -[NSDate copy](self->_roamingActiveTime, "copy");
  v44 = *(void **)(v4 + 960);
  *(_QWORD *)(v4 + 960) = v43;

  v45 = -[NSDate copy](self->_scanningActiveTime, "copy");
  v46 = *(void **)(v4 + 968);
  *(_QWORD *)(v4 + 968) = v45;

  *(double *)(v4 + 976) = self->_inCallDuration;
  *(double *)(v4 + 984) = self->_inVehicleDuration;
  *(double *)(v4 + 992) = self->_inMotionDuration;
  *(double *)(v4 + 1000) = self->_inA2dpDuration;
  *(double *)(v4 + 1008) = self->_inScoDuration;
  *(double *)(v4 + 1016) = self->_inHidPresentDuration;
  *(double *)(v4 + 1024) = self->_inAwdlDuration;
  *(double *)(v4 + 1032) = self->_inRoamDuration;
  *(double *)(v4 + 1040) = self->_inScanDuration;
  *(double *)(v4 + 1048) = self->_inCellularFallbackDuration;
  *(double *)(v4 + 1056) = self->_inCellularOutrankingDuration;
  *(double *)(v4 + 1064) = self->_inPoorCoverageDuration;
  *(_QWORD *)(v4 + 1080) = self->_inCallEventCount;
  *(_QWORD *)(v4 + 1088) = self->_inVehicleEventCount;
  *(_QWORD *)(v4 + 1096) = self->_inMotionEventCount;
  *(_QWORD *)(v4 + 1104) = self->_inA2dpEventCount;
  *(_QWORD *)(v4 + 1112) = self->_inScoEventCount;
  *(_QWORD *)(v4 + 1120) = self->_inHidPresentCount;
  *(_QWORD *)(v4 + 1128) = self->_inAwdlEventCount;
  *(_QWORD *)(v4 + 1136) = self->_inRoamEventCount;
  *(_QWORD *)(v4 + 1144) = self->_inScanEventCount;
  *(_QWORD *)(v4 + 1152) = self->_cellularFallbackStateChangedCount;
  *(_QWORD *)(v4 + 1160) = self->_cellularOutrankingStateChangedCount;
  *(_QWORD *)(v4 + 1168) = self->_locationScanCount;
  *(_QWORD *)(v4 + 1176) = self->_indoorScanCount;
  *(_QWORD *)(v4 + 1192) = self->_triggerDisconnectAlertedCount;
  *(_QWORD *)(v4 + 1200) = self->_triggerDisconnectConfirmedCount;
  *(_QWORD *)(v4 + 1208) = self->_triggerDisconnectExecutedCount;
  *(_BYTE *)(v4 + 330) = self->_isCompatibilityModeEnabled;
  *(_QWORD *)(v4 + 1184) = self->_compatibilityModeChangeCount;
  objc_storeStrong((id *)(v4 + 440), self->_lastCompatibilityModeChangedTime);
  *(double *)(v4 + 1072) = self->_inCompatibilityModeEnabledDuration;
  return (id)v4;
}

- (BOOL)submitAnalytics
{
  void *v3;
  void *v4;
  double v5;
  double v6;
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
  _BOOL8 v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  void *v22;
  __int128 v23;
  void *v24;
  __int128 v25;
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
  unint64_t roamReasonLowRssiCount;
  void *v38;
  __int128 v39;
  void *v40;
  __int128 v41;
  void *v42;
  __int128 v43;
  void *v44;
  __int128 v45;
  void *v46;
  __int128 v47;
  void *v48;
  __int128 v49;
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
  double lastRoamSuppressionWaitForRoamStart;
  void *v79;
  double lastRoamSuppressionWaitForRoamEnd;
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
  void *v98;
  void *v99;
  void *v100;
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
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  WiFiUsageAppleWiFiNameBlocks *v146;
  WiFiUsageAppleWiFiNameBlocks *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  WiFiUsageAppleWiFiNameBlocks *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  int64_t linkRssiGt40;
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
  objc_class *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  id v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t i;
  uint64_t v185;
  void *v186;
  void *v187;
  objc_class *v188;
  void *v189;
  void *v190;
  id v191;
  void *context;
  void *v194;
  WiFiUsageBssSession *v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  _BYTE v202[128];
  uint64_t v203;

  v203 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageBssSession joinedTimestamp](self, "joinedTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v194 = v3;
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("BSS"), CFSTR("SessionName"));
  +[WiFiUsagePrivacyFilter numberWithDuration:](WiFiUsagePrivacyFilter, "numberWithDuration:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("SessionDuration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsNeighborReport);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("SupportsNeighborReport"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsFastTransition);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("SupportsFastTransition"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsBssTransitionManagement);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("SupportsBssTransitionManagement"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsAdaptiveFastTransition);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("SupportsAdaptiveFastTransition"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsFastlane);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("SupportsFastlane"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsNetworkAssurance);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, CFSTR("SupportsNetworkAssurance"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsAdaptiveRoaming);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, CFSTR("SupportsAdaptiveRoaming"));

  objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_bssEnvironment, CFSTR("NetworkBssEnvironment"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_bssEnvironment, CFSTR("NetworkBssEnvironmentString"));
  v16 = (void *)MEMORY[0x1E0CB37E8];
  v17 = -[WiFiUsageNetworkDetails hasEnterpriseSecurity](self->_networkDetails, "hasEnterpriseSecurity")
     || -[WiFiUsageNetworkDetails isWidelyDeployed](self->_networkDetails, "isWidelyDeployed");
  objc_msgSend(v16, "numberWithBool:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, CFSTR("NetworkIsEnterprise"));

  v19 = (void *)MEMORY[0x1E0CB37E8];
  v20 = -[WiFiUsageNetworkDetails isWidelyDeployed](self->_networkDetails, "isWidelyDeployed")
     || -[WiFiUsageNetworkDetails isPublic](self->_networkDetails, "isPublic");
  objc_msgSend(v19, "numberWithBool:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, CFSTR("NetworkIsPublic"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_roamConfigTriggerRssi);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, CFSTR("RoamConfigTriggerRssi"));

  v23 = *(_OWORD *)&self->_roamConfigChannels.valueByBand[2];
  v200 = *(_OWORD *)self->_roamConfigChannels.valueByBand;
  v201 = v23;
  +[WiFiUsagePrivacyFilter getLabelForIntegerByBand:](WiFiUsagePrivacyFilter, "getLabelForIntegerByBand:", &v200);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v24, CFSTR("RoamConfigChannelCountByBand"));

  v25 = *(_OWORD *)&self->_roamConfigChannels.valueByBand[2];
  v200 = *(_OWORD *)self->_roamConfigChannels.valueByBand;
  v201 = v25;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[WiFiUsagePrivacyFilter getSumAllBands:](WiFiUsagePrivacyFilter, "getSumAllBands:", &v200));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v26, CFSTR("RoamConfigChannelCountTotal"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_roamConfigCriteria.forceApply);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v27, CFSTR("RoamConfigARIsForceApplied"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_roamConfigCriteria.deviceSupport);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v28, CFSTR("RoamConfigARdeviceSupport"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_roamConfigCriteria.isEAP);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v29, CFSTR("RoamConfigARIsEAP"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_roamConfigCriteria.environment);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v30, CFSTR("RoamConfigAREnv"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_roamConfigCriteria.networkOfInterestType);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v31, CFSTR("RoamConfigARNetworkType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_roamConfigCriteria.LOIType);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v32, CFSTR("RoamConfigARLOIType"));

  +[WiFiUsagePrivacyFilter getLabelForNeighborsByBand:](WiFiUsagePrivacyFilter, "getLabelForNeighborsByBand:", self->_roamNeighborsByBand);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v33, CFSTR("RoamNeighborsCountByBand"));

  +[WiFiUsagePrivacyFilter getSumArrayCountAllBand:](WiFiUsagePrivacyFilter, "getSumArrayCountAllBand:", self->_roamNeighborsByBand);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v34, CFSTR("RoamNeighborsCountTotal"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_minCandidatesCount);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v35, CFSTR("RoamCandidatesCountMin"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_maxCandidatesCount);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v36, CFSTR("RoamCandidatesCountMax"));

  roamReasonLowRssiCount = self->_roamReasonLowRssiCount;
  if (roamReasonLowRssiCount)
  {
    +[WiFiUsagePrivacyFilter getBinEvery10Over100:As:](WiFiUsagePrivacyFilter, "getBinEvery10Over100:As:", 100 * self->_currentRSSIStrongestCount / roamReasonLowRssiCount, 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v38, CFSTR("RoamCandidatesLowRssiCurrentBSSIsBestPerc"));

  }
  else
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, CFSTR("RoamCandidatesLowRssiCurrentBSSIsBestPerc"));
  }
  v39 = *(_OWORD *)&self->_strongestRSSICountByBand.valueByBand[2];
  v200 = *(_OWORD *)self->_strongestRSSICountByBand.valueByBand;
  v201 = v39;
  +[WiFiUsagePrivacyFilter getLabelForPercIntegerByBand:](WiFiUsagePrivacyFilter, "getLabelForPercIntegerByBand:", &v200);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v40, CFSTR("RoamCandidatesStrongestRssiByBandPerc"));

  v41 = *(_OWORD *)&self->_strongestRSSIByBand.valueByBand[2];
  v200 = *(_OWORD *)self->_strongestRSSIByBand.valueByBand;
  v201 = v41;
  +[WiFiUsagePrivacyFilter getLabelForRssiByBand:](WiFiUsagePrivacyFilter, "getLabelForRssiByBand:", &v200);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v42, CFSTR("RoamCandidatesStrongestRssiByBand"));

  v43 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBand.valueByBand[2];
  v200 = *(_OWORD *)self->_roamNeighsSmllstCurrentToNextBestRssiByBand.valueByBand;
  v201 = v43;
  +[WiFiUsagePrivacyFilter getLabelForRssiDeltaByBand:](WiFiUsagePrivacyFilter, "getLabelForRssiDeltaByBand:", &v200);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v44, CFSTR("RoamCandidatesSmallestDiffCurrentToNextBestRSSIByBand"));

  v45 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBand.valueByBand[2];
  v200 = *(_OWORD *)self->_roamNeighsLrgstCurrentToNextBestRssiByBand.valueByBand;
  v201 = v45;
  +[WiFiUsagePrivacyFilter getLabelForRssiDeltaByBand:](WiFiUsagePrivacyFilter, "getLabelForRssiDeltaByBand:", &v200);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v46, CFSTR("RoamCandidatesLargestDiffCurrentToNextBestRSSIByBand"));

  v47 = *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBand.valueByBand[2];
  v200 = *(_OWORD *)self->_roamNeighsSmllstCurrentToBestRssiByBand.valueByBand;
  v201 = v47;
  +[WiFiUsagePrivacyFilter getLabelForRssiDeltaByBand:](WiFiUsagePrivacyFilter, "getLabelForRssiDeltaByBand:", &v200);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v48, CFSTR("RoamCandidatesSmallestDiffCurrentToBestRSSIByBand"));

  v49 = *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBand.valueByBand[2];
  v200 = *(_OWORD *)self->_roamNeighsLrgstCurrentToBestRssiByBand.valueByBand;
  v201 = v49;
  +[WiFiUsagePrivacyFilter getLabelForRssiDeltaByBand:](WiFiUsagePrivacyFilter, "getLabelForRssiDeltaByBand:", &v200);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v50, CFSTR("RoamCandidatesLargestDiffCurrentToBestRSSIByBand"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamReasonInitialAssociationCount);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v51, CFSTR("RoamReasonInitialAssociationCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamReasonLowRssiCount);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v52, CFSTR("RoamReasonLowRssiCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamReasonDeauthDisassocCount);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v53, CFSTR("RoamReasonDeauthDisassocCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamReasonBeaconLostCount);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v54, CFSTR("RoamReasonBeaconLostCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamReasonSteeredByApCount);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v55, CFSTR("RoamReasonSteeredByApCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamReasonSteeredByBtmCount);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v56, CFSTR("RoamReasonSteeredByBtmCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamReasonSteeredByCsaCount);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v57, CFSTR("RoamReasonSteeredByCsaCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamReasonReassocRequestedCount);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v58, CFSTR("RoamReasonReassocRequestedCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamReasonHostTriggeredCount);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v59, CFSTR("RoamReasonHostTriggeredCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamReasonBetterCandidateCount);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v60, CFSTR("RoamReasonBetterCandidateCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamReasonBetterConditionCount);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v61, CFSTR("RoamReasonBetterConditionCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamReasonMiscCount);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v62, CFSTR("RoamReasonMiscCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamStatusSucceededCount);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v63, CFSTR("RoamStatusSucceededCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamStatusFailedCount);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v64, CFSTR("RoamStatusFailedCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamStatusNoCandidateCount);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v65, CFSTR("RoamStatusNoCandidateCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamStatusNoQualifiedCandidateCount);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v66, CFSTR("RoamStatusNoQualifiedCandidateCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamIsWNMScoreUsedCount);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v67, CFSTR("RoamWNMScoreUsedCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_roamPingPongNth);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v68, CFSTR("RoamPingPongNth"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_roamInMotion);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v69, CFSTR("RoamInMotion"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_bssTransitionRequestCount);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v70, CFSTR("RoamBssTransitionRequestCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_bssTransitionAcceptedCount);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v71, CFSTR("RoamBssTransitionAcceptedCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_bssTransitionRejectedCount);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v72, CFSTR("RoamBssTransitionRejectedCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_highRssiRoamScanCount);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v73, CFSTR("RoamScanCountHighRssi"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_lowRssiRoamScanCount);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v74, CFSTR("RoamScanCountLowRssi"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_unexpectedBeaconLostRoamScanCount);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v75, CFSTR("RoamScanCountUnexpectedBeaconLost"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_inRoamSuppressionEnabledCount);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v76, CFSTR("WiFiInRoamSuppressedCount"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inRoamSuppressionEnabledDuration, v6);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v77, CFSTR("WiFiInRoamSuppressedDuration"));

  lastRoamSuppressionWaitForRoamStart = self->_lastRoamSuppressionWaitForRoamStart;
  *(float *)&lastRoamSuppressionWaitForRoamStart = lastRoamSuppressionWaitForRoamStart;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", lastRoamSuppressionWaitForRoamStart);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v79, CFSTR("WiFiInRoamSuppressedWaitForRoamStart"));

  lastRoamSuppressionWaitForRoamEnd = self->_lastRoamSuppressionWaitForRoamEnd;
  *(float *)&lastRoamSuppressionWaitForRoamEnd = lastRoamSuppressionWaitForRoamEnd;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", lastRoamSuppressionWaitForRoamEnd);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v81, CFSTR("WiFiInRoamSuppressedWaitForRoamEnd"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_inCallEventCount);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v82, CFSTR("SystemInCallCount"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inCallDuration, v6);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v83, CFSTR("SystemInCallDuration"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_inVehicleEventCount);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v84, CFSTR("SystemInVehicleCount"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inVehicleDuration, v6);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v85, CFSTR("SystemInVehicleDuration"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_inMotionEventCount);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v86, CFSTR("SystemInMotionCount"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inMotionDuration, v6);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v87, CFSTR("SystemInMotionDuration"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_triggerDisconnectAlertedCount);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v88, CFSTR("TriggerDisconnectAlertedCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_triggerDisconnectConfirmedCount);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v89, CFSTR("TriggerDisconnectConfirmedCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_triggerDisconnectExecutedCount);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v90, CFSTR("TriggerDisconnectExecutedCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_inA2dpEventCount);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v91, CFSTR("BluetoothInA2dpCount"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inA2dpDuration, v6);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v92, CFSTR("BluetoothInA2dpDuration"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_inScoEventCount);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v93, CFSTR("BluetoothInScoCount"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inScoDuration, v6);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v94, CFSTR("BluetoothInScoDuration"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_inHidPresentCount);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v95, CFSTR("BluetoothInHidCount"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inHidPresentDuration, v6);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v96, CFSTR("BluetoothInHidDuration"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_inAwdlEventCount);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v97, CFSTR("WiFiInAwdlCount"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inAwdlDuration, v6);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v98, CFSTR("WiFiInAwdlDuration"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_inRoamEventCount);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v99, CFSTR("WiFiInRoamCount"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inRoamDuration, v6);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v100, CFSTR("WiFiInRoamDuration"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_inScanEventCount);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v101, CFSTR("WiFiInScanCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_locationScanCount);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v102, CFSTR("WiFiInLocationScanCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_indoorScanCount);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v103, CFSTR("WiFiInIndoorScanCount"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inScanDuration, v6);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v104, CFSTR("WiFiInScanDuration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inCellularFallbackDuration, v6);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v105, CFSTR("WiFiInCellularFallbackDuration"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_cellularFallbackStateChangedCount);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v106, CFSTR("WiFiCellularFallbackStateChangedCount"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inCellularOutrankingDuration, v6);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v107, CFSTR("WiFiInCellularOutrankingDuration"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_cellularOutrankingStateChangedCount);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v108, CFSTR("WiFiCellularOutrankingStateChangedCount"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inPoorCoverageDuration, v6);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v109, CFSTR("PoorCoverageDuration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_poorCoverageAndA2dpDuration, v6);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v110, CFSTR("PoorCoverageAndA2dpDuration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_poorCoverageAndScoDuration, v6);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v111, CFSTR("PoorCoverageAndScoDuration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_poorCoverageAndAwdlDuration, v6);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v112, CFSTR("PoorCoverageAndAwdlDuration"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_poorCoverageAndScanDuration, v6);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v113, CFSTR("PoorCoverageAndScanDuration"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[1]);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v114, CFSTR("FaultReasonDnsFailureCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[2]);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v115, CFSTR("FaultReasonArpFailureCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[4]);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v116, CFSTR("FaultReasonShortFlowCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[5]);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v117, CFSTR("FaultReasonRTTFailureCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[3]);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v118, CFSTR("FaultReasonSymptomDataStallCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[6]);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v119, CFSTR("FaultReasonL2DatapathStallCount"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[10]);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v120, CFSTR("FaultReasonSlowWiFi"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[19]);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v121, CFSTR("FaultReasonSlowWiFiDUT"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[13]);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v122, CFSTR("FaultReasonDhcpFailure"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[14]);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v123, CFSTR("FaultReasonLinkTestLocalCheckFailure"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[15]);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v124, CFSTR("FaultReasonLinkTestInternetCheckFailure"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[16]);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v125, CFSTR("FaultReasonLinkTestDNSCheckFailure"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[20]);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v126, CFSTR("FaultReasonUserOverridesCellularOutranking"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[25]);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v127, CFSTR("FaultReasonSiriTimedOut"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[26]);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v128, CFSTR("FaultReasonApsdTimedOut"));

  +[WiFiUsagePrivacyFilter numberWithInstances:](WiFiUsagePrivacyFilter, "numberWithInstances:", self->_faultReasonCount[27]);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v129, CFSTR("FaultReasonBrokenBackhaulLinkFailed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_joinRssi);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v130, CFSTR("RssiAtJoin"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_leftRssi);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v131, CFSTR("RssiAtLeave"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_newRssi);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v132, CFSTR("RssiAfterRoam"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_lastLinkRssi);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v133, CFSTR("RssiLastLink"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_lastRoamScanRssi);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v134, CFSTR("RssiLastRoamScan"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_maxLinkRssi);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v135, CFSTR("RssiMax"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_minLinkRssi);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v136, CFSTR("RssiMin"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_avgLinkRssi);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v137, CFSTR("RssiAvg"));

  +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:", self->_currentBand);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v138, CFSTR("BandAtJoin"));

  +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:", self->_newBand);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v139, CFSTR("BandAfterRoam"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_currentChannel);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v140, CFSTR("ChannelAtJoin"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_newChannel);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v141, CFSTR("ChannelAfterRoam"));

  if (+[WiFiUsagePrivacyFilter isInternalInstall](WiFiUsagePrivacyFilter, "isInternalInstall")
    && -[WiFiUsageNetworkDetails isInternal](self->_networkDetails, "isInternal"))
  {
    -[WiFiUsageNetworkDetails networkName](self->_networkDetails, "networkName");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v142, CFSTR("NetworkName"));

    -[WiFiUsageBssDetails bssid](self->_originBssDetails, "bssid");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v143, CFSTR("RoamBssidOrigin"));

    -[WiFiUsageBssDetails bssid](self->_originBssDetails, "bssid");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    +[WiFiUsageAccessPointProfile apNameForBSSID:](WiFiUsageAccessPointProfile, "apNameForBSSID:", v144);
    v145 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setObject:forKeyedSubscript:", v145, CFSTR("RoamOriginAPName"));
    v146 = -[WiFiUsageAppleWiFiNameBlocks initWithAPName:]([WiFiUsageAppleWiFiNameBlocks alloc], "initWithAPName:", v145);
    v147 = v146;
    if (v146)
    {
      -[WiFiUsageAppleWiFiNameBlocks building](v146, "building");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v148, CFSTR("RoamOriginAPNamePortionA"));

      -[WiFiUsageAppleWiFiNameBlocks section](v147, "section");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v149, CFSTR("RoamOriginAPNamePortionB"));

      -[WiFiUsageAppleWiFiNameBlocks floor](v147, "floor");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v150, CFSTR("RoamOriginAPNamePortionC"));

      -[WiFiUsageAppleWiFiNameBlocks pod](v147, "pod");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v151, CFSTR("RoamOriginAPNamePortionD"));

      -[WiFiUsageAppleWiFiNameBlocks other](v147, "other");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v152, CFSTR("RoamOriginAPNamePortionE"));

    }
    -[WiFiUsageBssDetails bssid](self->_targetBssDetails, "bssid");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v153, CFSTR("RoamBssidTarget"));

    -[WiFiUsageBssDetails bssid](self->_targetBssDetails, "bssid");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    +[WiFiUsageAccessPointProfile apNameForBSSID:](WiFiUsageAccessPointProfile, "apNameForBSSID:", v154);
    v155 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setObject:forKeyedSubscript:", v155, CFSTR("RoamTargetAPName"));
    v156 = -[WiFiUsageAppleWiFiNameBlocks initWithAPName:]([WiFiUsageAppleWiFiNameBlocks alloc], "initWithAPName:", v155);

    if (v156)
    {
      -[WiFiUsageAppleWiFiNameBlocks building](v156, "building");
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v157, CFSTR("RoamTargetAPNamePortionA"));

      -[WiFiUsageAppleWiFiNameBlocks section](v156, "section");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v158, CFSTR("RoamTargetAPNamePortionB"));

      -[WiFiUsageAppleWiFiNameBlocks floor](v156, "floor");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v159, CFSTR("RoamTargetAPNamePortionC"));

      -[WiFiUsageAppleWiFiNameBlocks pod](v156, "pod");
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v160, CFSTR("RoamTargetAPNamePortionD"));

      -[WiFiUsageAppleWiFiNameBlocks other](v156, "other");
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v161, CFSTR("RoamTargetAPNamePortionE"));

    }
  }
  if (self->_linkRssiGt40 < 0)
  {
    linkRssiGt40 = 0;
  }
  else
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("Gt40"), CFSTR("RssiMode"));
    linkRssiGt40 = self->_linkRssiGt40;
  }
  if (self->_linkRssi40to50 >= linkRssiGt40)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("40to50"), CFSTR("RssiMode"));
    linkRssiGt40 = self->_linkRssi40to50;
  }
  if (self->_linkRssi50to60 >= linkRssiGt40)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("50to60"), CFSTR("RssiMode"));
    linkRssiGt40 = self->_linkRssi50to60;
  }
  if (self->_linkRssi60to65 >= linkRssiGt40)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("60to65"), CFSTR("RssiMode"));
    linkRssiGt40 = self->_linkRssi60to65;
  }
  if (self->_linkRssi65to70 >= linkRssiGt40)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("65to70"), CFSTR("RssiMode"));
    linkRssiGt40 = self->_linkRssi65to70;
  }
  if (self->_linkRssi70to75 >= linkRssiGt40)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("70to75"), CFSTR("RssiMode"));
    linkRssiGt40 = self->_linkRssi70to75;
  }
  if (self->_linkRssi75to80 >= linkRssiGt40)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("75to80"), CFSTR("RssiMode"));
    linkRssiGt40 = self->_linkRssi75to80;
  }
  if (self->_linkRssi80to85 >= linkRssiGt40)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("80to85"), CFSTR("RssiMode"));
    linkRssiGt40 = self->_linkRssi80to85;
  }
  if (self->_linkRssi85to90 >= linkRssiGt40)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("85to90"), CFSTR("RssiMode"));
    linkRssiGt40 = self->_linkRssi85to90;
  }
  if (self->_linkRssiLt90 >= linkRssiGt40)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("Lt90"), CFSTR("RssiMode"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)self->_minRoamLatency);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v163, CFSTR("RoamLatencyMin"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)self->_maxRoamLatency);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v164, CFSTR("RoamLatencyMax"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_partialScanCount);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v165, CFSTR("PartialScanCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_fullScanCount);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v166, CFSTR("FullScanCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isCompatibilityModeEnabledAtStart);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v167, CFSTR("WiFiCompatibilityModeEnabledAtStart"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isCompatibilityModeEnabled);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v168, CFSTR("WiFiCompatibilityModeEnabledAtEnd"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_compatibilityModeChangeCount);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v169, CFSTR("WiFiCompatibilityModeChangeCount"));

  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", self->_inCompatibilityModeEnabledDuration, v6);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v170, CFSTR("WiFiCompatibilityModeChangeDuration"));

  -[WiFiUsageBssSession originBssDetails](self, "originBssDetails");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v171, "eventDictionary:", 1);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEntriesFromDictionary:", v172);

  context = (void *)MEMORY[0x1D17AC818]();
  v173 = (void *)MEMORY[0x1E0CB37A0];
  v195 = self;
  v174 = (objc_class *)objc_opt_class();
  NSStringFromClass(v174);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "stringWithFormat:", CFSTR("%@:: "), v175);
  v176 = (void *)objc_claimAutoreleasedReturnValue();

  v177 = v7;
  objc_msgSend(v7, "allKeys");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "sortedArrayUsingSelector:", sel_compare_);
  v179 = (void *)objc_claimAutoreleasedReturnValue();

  v198 = 0u;
  v199 = 0u;
  v196 = 0u;
  v197 = 0u;
  v180 = v179;
  v181 = objc_msgSend(v180, "countByEnumeratingWithState:objects:count:", &v196, v202, 16);
  if (v181)
  {
    v182 = v181;
    v183 = *(_QWORD *)v197;
    do
    {
      for (i = 0; i != v182; ++i)
      {
        if (*(_QWORD *)v197 != v183)
          objc_enumerationMutation(v180);
        v185 = *(_QWORD *)(*((_QWORD *)&v196 + 1) + 8 * i);
        objc_msgSend(v177, "objectForKey:", v185);
        v186 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v176, "appendFormat:", CFSTR("%@=%@; "), v185, v186, context);

        if ((unint64_t)objc_msgSend(v176, "length") >= 0xB5)
        {
          NSLog(CFSTR("%@"), v176);
          v187 = (void *)MEMORY[0x1E0CB3940];
          v188 = (objc_class *)objc_opt_class();
          NSStringFromClass(v188);
          v189 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v187, "stringWithFormat:", CFSTR("%@:: "), v189);
          v190 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v176, "setString:", v190);

        }
      }
      v182 = objc_msgSend(v180, "countByEnumeratingWithState:objects:count:", &v196, v202, 16);
    }
    while (v182);
  }

  NSLog(CFSTR("%@"), v176);
  NSLog(CFSTR("%s:Total BSS session fields: %d"), "-[WiFiUsageBssSession submitAnalytics]", objc_msgSend(v180, "count"));

  objc_autoreleasePoolPop(context);
  v191 = v177;
  AnalyticsSendEventLazy();

  -[WiFiUsageBssSession setSessionInfo:](v195, "setSessionInfo:", v191);
  return 1;
}

id __38__WiFiUsageBssSession_submitAnalytics__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)motionStateDidChange:(BOOL)a3 andVehicularState:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  double v8;
  void *v9;
  double v10;
  id v11;

  v4 = a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  if (v5)
  {
    -[WiFiUsageBssSession setInMotionStartedTime:](self, "setInMotionStartedTime:", v7);
    ++self->_inMotionEventCount;
  }
  else if (self->_inMotionStartedTime)
  {
    objc_msgSend(v7, "timeIntervalSinceDate:");
    self->_inMotionDuration = v8 + self->_inMotionDuration;
    -[WiFiUsageBssSession setInMotionStartedTime:](self, "setInMotionStartedTime:", 0);
  }
  if (v4)
  {
    -[WiFiUsageBssSession setInVehicleEntryTime:](self, "setInVehicleEntryTime:", v11);
    v9 = v11;
    ++self->_inVehicleEventCount;
  }
  else
  {
    v9 = v11;
    if (self->_inVehicleEntryTime)
    {
      objc_msgSend(v11, "timeIntervalSinceDate:");
      self->_inVehicleDuration = v10 + self->_inVehicleDuration;
      -[WiFiUsageBssSession setInVehicleEntryTime:](self, "setInVehicleEntryTime:", 0);
      v9 = v11;
    }
  }

}

- (void)callStateDidChange:(BOOL)a3
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
    -[WiFiUsageBssSession setCallStartedTime:](self, "setCallStartedTime:", v5);
    v6 = v8;
    ++self->_inCallEventCount;
  }
  else if (self->_callStartedTime)
  {
    v9 = v5;
    objc_msgSend(v5, "timeIntervalSinceDate:");
    self->_inCallDuration = v7 + self->_inCallDuration;
    -[WiFiUsageBssSession setCallStartedTime:](self, "setCallStartedTime:", 0);
    v6 = v9;
  }

}

- (void)bluetoothStateDidChange:(BOOL)a3 connectedDeviceCount:(unint64_t)a4 inA2dp:(BOOL)a5 inSco:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  void *v10;
  double v11;
  NSDate *lastPoorCoverageEntryTimestamp;
  double v13;
  double inA2dpDuration;
  void *v15;
  double v16;
  NSDate *v17;
  double v18;
  double inScoDuration;
  double v20;
  void *v21;

  v6 = a6;
  v7 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "date", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v10;
  if (v7)
  {
    -[WiFiUsageBssSession setA2dpActiveTime:](self, "setA2dpActiveTime:", v10);
    ++self->_inA2dpEventCount;
  }
  else if (self->_a2dpActiveTime)
  {
    objc_msgSend(v10, "timeIntervalSinceDate:");
    self->_inA2dpDuration = v11 + self->_inA2dpDuration;
    lastPoorCoverageEntryTimestamp = self->_lastPoorCoverageEntryTimestamp;
    if (lastPoorCoverageEntryTimestamp)
    {
      -[NSDate timeIntervalSinceDate:](lastPoorCoverageEntryTimestamp, "timeIntervalSinceDate:", self->_a2dpActiveTime);
      if (v13 <= 0.0)
        inA2dpDuration = self->_inA2dpDuration;
      else
        objc_msgSend(v21, "timeIntervalSinceDate:", self->_lastPoorCoverageEntryTimestamp);
      self->_poorCoverageAndA2dpDuration = inA2dpDuration + self->_poorCoverageAndA2dpDuration;
    }
    -[WiFiUsageBssSession setA2dpActiveTime:](self, "setA2dpActiveTime:", 0);
  }
  if (v6)
  {
    -[WiFiUsageBssSession setScoActiveTime:](self, "setScoActiveTime:", v21);
    v15 = v21;
    ++self->_inScoEventCount;
  }
  else
  {
    v15 = v21;
    if (self->_scoActiveTime)
    {
      objc_msgSend(v21, "timeIntervalSinceDate:");
      self->_inScoDuration = v16 + self->_inScoDuration;
      v17 = self->_lastPoorCoverageEntryTimestamp;
      if (v17)
      {
        -[NSDate timeIntervalSinceDate:](v17, "timeIntervalSinceDate:", self->_scoActiveTime);
        if (v18 <= 0.0)
          inScoDuration = self->_inScoDuration;
        else
          objc_msgSend(v21, "timeIntervalSinceDate:", self->_lastPoorCoverageEntryTimestamp);
        self->_poorCoverageAndScoDuration = inScoDuration + self->_poorCoverageAndScoDuration;
      }
      -[WiFiUsageBssSession setScoActiveTime:](self, "setScoActiveTime:", 0);
      v15 = v21;
    }
  }
  if (a4)
  {
    -[WiFiUsageBssSession setHidPresentTime:](self, "setHidPresentTime:", v15);
    v15 = v21;
    ++self->_inHidPresentCount;
  }
  else if (self->_hidPresentTime)
  {
    objc_msgSend(v15, "timeIntervalSinceDate:");
    self->_inHidPresentDuration = v20 + self->_inHidPresentDuration;
    -[WiFiUsageBssSession setHidPresentTime:](self, "setHidPresentTime:", 0);
    v15 = v21;
  }

}

- (void)awdlStateDidChange:(BOOL)a3 inMode:(int64_t)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  double v8;
  NSDate *lastPoorCoverageEntryTimestamp;
  double v10;
  double inAwdlDuration;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    v12 = v6;
    -[WiFiUsageBssSession setAwdlActiveTime:](self, "setAwdlActiveTime:", v6);
    v7 = v12;
    ++self->_inAwdlEventCount;
  }
  else if (self->_awdlActiveTime)
  {
    v13 = v6;
    objc_msgSend(v6, "timeIntervalSinceDate:");
    self->_inAwdlDuration = v8 + self->_inAwdlDuration;
    lastPoorCoverageEntryTimestamp = self->_lastPoorCoverageEntryTimestamp;
    if (lastPoorCoverageEntryTimestamp)
    {
      -[NSDate timeIntervalSinceDate:](lastPoorCoverageEntryTimestamp, "timeIntervalSinceDate:", self->_awdlActiveTime);
      if (v10 <= 0.0)
        inAwdlDuration = self->_inAwdlDuration;
      else
        objc_msgSend(v13, "timeIntervalSinceDate:", self->_lastPoorCoverageEntryTimestamp);
      self->_poorCoverageAndAwdlDuration = inAwdlDuration + self->_poorCoverageAndAwdlDuration;
    }
    -[WiFiUsageBssSession setAwdlActiveTime:](self, "setAwdlActiveTime:", 0);
    v7 = v13;
  }

}

- (void)roamingStateDidChange:(BOOL)a3 reason:(unint64_t)a4 andStatus:(unint64_t)a5 andLatency:(unint64_t)a6 andRoamData:(id)a7 andPingPongNth:(BOOL)a8
{
  _BOOL4 v8;
  int v10;
  int v11;
  _BOOL4 v12;
  void *v14;
  void *v15;
  double v16;
  int64_t lastLinkRssi;
  double v18;
  double minRoamLatency;
  double maxRoamLatency;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  unint64_t v32;
  uint64_t v33;
  double v34;
  unint64_t roamsAfterSupprLifted;
  unint64_t v36;
  double lastRoamSuppressionWaitForRoamEnd;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  char v42;
  id v43;

  v8 = a8;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v43 = a7;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v12)
  {
    -[WiFiUsageBssSession setRoamingActiveTime:](self, "setRoamingActiveTime:", v14);
    ++self->_inRoamEventCount;
    if (self->_lastRoamSuppressionToggled && !self->_isRoamSuppressionEnabled && !self->_roamsAfterSupprLifted)
    {
      objc_msgSend(v15, "timeIntervalSinceDate:");
      self->_lastRoamSuppressionWaitForRoamStart = v16;
      NSLog(CFSTR("%s - lastRoamSuppressionWaitForRoamStart:%fs"), "-[WiFiUsageBssSession roamingStateDidChange:reason:andStatus:andLatency:andRoamData:andPingPongNth:]", *(_QWORD *)&v16);
    }
    lastLinkRssi = self->_lastLinkRssi;
    self->_lastRoamScanRssi = lastLinkRssi;
    if (lastLinkRssi > self->_roamConfigTriggerRssi)
    {
      ++self->_highRssiRoamScanCount;
      switch(v11)
      {
        case -528348160:
          goto LABEL_42;
        case -528348159:
          goto LABEL_43;
        case -528348158:
        case -528348157:
          goto LABEL_41;
        case -528348156:
          ++self->_unexpectedBeaconLostRoamScanCount;
          goto LABEL_50;
        case -528348154:
          goto LABEL_45;
        case -528348152:
          goto LABEL_46;
        case -528348151:
        case -528348150:
        case -528348148:
        case -528348145:
          goto LABEL_31;
        case -528348149:
          goto LABEL_47;
        case -528348146:
          goto LABEL_48;
        case -528348141:
          goto LABEL_51;
        case -528348139:
          goto LABEL_49;
        default:
          goto LABEL_44;
      }
    }
    ++self->_lowRssiRoamScanCount;
    switch(v11)
    {
      case -528348160:
LABEL_42:
        ++self->_roamReasonInitialAssociationCount;
        break;
      case -528348159:
LABEL_43:
        ++self->_roamReasonLowRssiCount;
        break;
      case -528348158:
      case -528348157:
LABEL_41:
        ++self->_roamReasonDeauthDisassocCount;
        break;
      case -528348156:
LABEL_50:
        ++self->_roamReasonBeaconLostCount;
        break;
      case -528348154:
LABEL_45:
        ++self->_roamReasonSteeredByApCount;
        break;
      case -528348152:
LABEL_46:
        ++self->_roamReasonBetterCandidateCount;
        break;
      case -528348151:
      case -528348150:
      case -528348148:
      case -528348145:
LABEL_31:
        ++self->_roamReasonBetterConditionCount;
        break;
      case -528348149:
LABEL_47:
        ++self->_roamReasonSteeredByBtmCount;
        break;
      case -528348146:
LABEL_48:
        ++self->_roamReasonSteeredByCsaCount;
        break;
      case -528348141:
LABEL_51:
        ++self->_roamReasonReassocRequestedCount;
        break;
      case -528348139:
LABEL_49:
        ++self->_roamReasonHostTriggeredCount;
        break;
      default:
LABEL_44:
        ++self->_roamReasonMiscCount;
        break;
    }
  }
  else if (self->_roamingActiveTime)
  {
    if (!a6)
    {
      objc_msgSend(v14, "timeIntervalSinceDate:");
      a6 = (unint64_t)(v18 * 1000.0);
    }
    minRoamLatency = self->_minRoamLatency;
    if (minRoamLatency >= (double)a6 || minRoamLatency == 0.0)
      minRoamLatency = (double)a6;
    self->_minRoamLatency = minRoamLatency;
    maxRoamLatency = self->_maxRoamLatency;
    if (maxRoamLatency <= (double)a6 || maxRoamLatency == 0.0)
      maxRoamLatency = (double)a6;
    self->_maxRoamLatency = maxRoamLatency;
    objc_msgSend(v43, "objectForKey:", CFSTR("ROAM_SCAN_SUMMARY"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23
      && (objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("ROAM_NUM_FULL_BAND_SCANS")),
          v25 = (void *)objc_claimAutoreleasedReturnValue(),
          v25,
          v25))
    {
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("ROAM_NUM_FULL_BAND_SCANS"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "integerValue");

      if (v27 >= 1)
        ++self->_fullScanCount;
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("ROAM_NUM_PARTIAL_SCANS"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "integerValue");

      if (v29 >= 1)
        ++self->_partialScanCount;
    }
    else
    {
      objc_msgSend(v43, "objectForKey:", CFSTR("ROAMEDEVENT_CHANNELS_SCANNED_COUNT"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (v30)
      {
        v32 = objc_msgSend(v30, "unsignedIntegerValue");
        v33 = 888;
        if (v32 > 0xD)
          v33 = 896;
        ++*(Class *)((char *)&self->super.isa + v33);
      }

    }
    objc_msgSend(v15, "timeIntervalSinceDate:", self->_roamingActiveTime);
    self->_inRoamDuration = v34 + self->_inRoamDuration;
    -[WiFiUsageBssSession setRoamingActiveTime:](self, "setRoamingActiveTime:", 0);
    if (self->_lastRoamSuppressionToggled && !self->_isRoamSuppressionEnabled)
    {
      roamsAfterSupprLifted = self->_roamsAfterSupprLifted;
      v36 = roamsAfterSupprLifted + 1;
      self->_roamsAfterSupprLifted = roamsAfterSupprLifted + 1;
      if (roamsAfterSupprLifted)
      {
        lastRoamSuppressionWaitForRoamEnd = self->_lastRoamSuppressionWaitForRoamEnd;
      }
      else
      {
        objc_msgSend(v15, "timeIntervalSinceDate:");
        self->_lastRoamSuppressionWaitForRoamEnd = lastRoamSuppressionWaitForRoamEnd;
        v36 = self->_roamsAfterSupprLifted;
      }
      NSLog(CFSTR("%s - roamsAfterSupprLifted:%lu lastRoamSuppressionWaitForRoamEnd :%fs"), "-[WiFiUsageBssSession roamingStateDidChange:reason:andStatus:andLatency:andRoamData:andPingPongNth:]", v36, *(_QWORD *)&lastRoamSuppressionWaitForRoamEnd);
    }
    if (v10 == -528350205)
    {
      ++self->_roamStatusNoCandidateCount;
    }
    else if (v10 == -528350133)
    {
      ++self->_roamStatusNoQualifiedCandidateCount;
    }
    else if (v10)
    {
      ++self->_roamStatusFailedCount;
    }
    else
    {
      ++self->_roamStatusSucceededCount;
      self->_roamPingPongNth = v8;
      self->_roamInMotion = self->_inMotionStartedTime != 0;
    }
    objc_msgSend(v43, "objectForKey:", CFSTR("ROAMEDEVENT_FLAGS"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (v38)
      self->_roamIsWNMScoreUsedCount += ((unint64_t)objc_msgSend(v38, "unsignedIntegerValue") >> 6) & 1;
    if (self->_targetBssDetails)
    {
      NSLog(CFSTR("%s: BSS session ended"), "-[WiFiUsageBssSession roamingStateDidChange:reason:andStatus:andLatency:andRoamData:andPingPongNth:]");
      -[WiFiUsageBssSession updateActivityDurations:](self, "updateActivityDurations:", v15);
      -[WiFiUsageBssSession submitAnalytics](self, "submitAnalytics");
      -[WiFiUsageBssSession reset](self, "reset");
      -[WiFiUsageBssSession setOriginBssDetails:](self, "setOriginBssDetails:", self->_targetBssDetails);
      -[WiFiUsageBssSession setJoinRssi:](self, "setJoinRssi:", -[WiFiUsageBssDetails rssi](self->_targetBssDetails, "rssi"));
      -[WiFiUsageBssSession setCurrentBand:](self, "setCurrentBand:", -[WiFiUsageBssDetails band](self->_targetBssDetails, "band"));
      -[WiFiUsageBssSession setCurrentChannel:](self, "setCurrentChannel:", -[WiFiUsageBssDetails channel](self->_targetBssDetails, "channel"));
      -[WiFiUsageBssSession setLastLinkRssi:](self, "setLastLinkRssi:", -[WiFiUsageBssDetails rssi](self->_targetBssDetails, "rssi"));
      -[WiFiUsageBssSession setTargetBssDetails:](self, "setTargetBssDetails:", 0);
      -[WiFiUsageBssSession setJoinedTimestamp:](self, "setJoinedTimestamp:", v15);
    }

  }
  objc_msgSend(v43, "objectForKey:", CFSTR("ROAMEDEVENT_FLAGS"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v40;
  if (!v40)
    goto LABEL_74;
  v42 = objc_msgSend(v40, "unsignedIntegerValue");
  if ((v42 & 1) != 0)
  {
    self->_supportsNeighborReport = 1;
    if ((v42 & 2) == 0)
    {
LABEL_69:
      if ((v42 & 4) == 0)
        goto LABEL_70;
      goto LABEL_77;
    }
  }
  else if ((v42 & 2) == 0)
  {
    goto LABEL_69;
  }
  self->_supportsFastTransition = 1;
  if ((v42 & 4) == 0)
  {
LABEL_70:
    if ((v42 & 8) == 0)
      goto LABEL_71;
    goto LABEL_78;
  }
LABEL_77:
  self->_supportsBssTransitionManagement = 1;
  if ((v42 & 8) == 0)
  {
LABEL_71:
    if ((v42 & 0x10) == 0)
      goto LABEL_72;
LABEL_79:
    self->_supportsFastlane = 1;
    if ((v42 & 0x20) == 0)
      goto LABEL_74;
    goto LABEL_73;
  }
LABEL_78:
  self->_supportsAdaptiveFastTransition = 1;
  if ((v42 & 0x10) != 0)
    goto LABEL_79;
LABEL_72:
  if ((v42 & 0x20) != 0)
LABEL_73:
    self->_supportsNetworkAssurance = 1;
LABEL_74:

}

- (void)roamingConfigurationDidChange:(int64_t)a3 withChannelList:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int v10;
  id obj;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  self->_roamConfigTriggerRssi = a3;
  *(_OWORD *)self->_roamConfigChannels.valueByBand = 0u;
  *(_OWORD *)&self->_roamConfigChannels.valueByBand[2] = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a4, "allObjects");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "objectForKey:", CFSTR("IO80211ChannelFlags"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = +[WiFiUsagePrivacyFilter bandFromFlags:](WiFiUsagePrivacyFilter, "bandFromFlags:", objc_msgSend(v9, "integerValue"));

        ++self->_roamConfigChannels.valueByBand[v10];
        self->_roamConfigChannels.valid[v10] = 1;
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

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
  uint64_t var5;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int64_t v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  v6 = a4;
  var3 = a3->var3;
  var0 = a3->var0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("roamNeighsSmllst%@RssiByBand"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  -[WiFiUsageBssSession valueForKey:](self, "valueForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "integerByBandValue");
  }
  else
  {
    v28 = 0u;
    v29 = 0u;
  }
  v12 = var3 - var0;

  var5 = a3->var5;
  if (!*((_BYTE *)&v29 + var5 + 8) || v12 < *((_QWORD *)&v28 + var5))
  {
    *((_QWORD *)&v28 + var5) = v12;
    *((_BYTE *)&v29 + var5 + 8) = 1;
    v26 = v28;
    v27 = v29;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valuewithIntegerByBand:", &v26);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiUsageBssSession setValue:forKey:](self, "setValue:forKey:", v14, v9);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("roamNeighsLrgst%@RssiByBand"), v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  -[WiFiUsageBssSession valueForKey:](self, "valueForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "integerByBandValue");
  }
  else
  {
    v26 = 0u;
    v27 = 0u;
  }

  v18 = a3->var5;
  if (!*((_BYTE *)&v27 + v18 + 8) || v12 > *((_QWORD *)&v26 + v18))
  {
    *((_QWORD *)&v26 + v18) = v12;
    *((_BYTE *)&v27 + v18 + 8) = 1;
    v24 = v26;
    v25 = v27;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valuewithIntegerByBand:", &v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiUsageBssSession setValue:forKey:](self, "setValue:forKey:", v19, v15);

    v18 = a3->var5;
  }
  v20 = a3->var3;
  +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:", v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v28;
  v25 = v29;
  +[WiFiUsagePrivacyFilter getLabelForRssiDeltaByBand:](WiFiUsagePrivacyFilter, "getLabelForRssiDeltaByBand:", &v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v26;
  v25 = v27;
  +[WiFiUsagePrivacyFilter getLabelForRssiDeltaByBand:](WiFiUsagePrivacyFilter, "getLabelForRssiDeltaByBand:", &v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%s - strongestRssiExcludingCurrent:%lddBm currentToBestRSSIdiff:%lddB strongestRSSIbandExcludingCurrent:%@Ghz -->\nsmallestDiff:%@ largestDiff:%@"), "-[WiFiUsageBssSession updateRssiDiffStats:For:]", v20, v12, v21, v22, v23);

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
  unint64_t currentRSSIStrongestCount;
  uint64_t var4;
  Class *v21;
  char *v22;
  int64_t var0;
  int64_t var3;
  char *v25;
  const __CFString *v26;
  __int128 v27;
  char v28;
  char v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(a3->var7, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
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
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
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
  NSLog(CFSTR("%s - stats.candidatesCount:%lu --> _minCandidatesCount:%lu _maxCandidatesCount:%lu"), "-[WiFiUsageBssSession roamCandidatesStatsDidUpdate:]", a3->var6, v15, v18);
  currentRSSIStrongestCount = self->_currentRSSIStrongestCount;
  if (a3->var2 == a3->var0)
    self->_currentRSSIStrongestCount = ++currentRSSIStrongestCount;
  var4 = a3->var4;
  v21 = &self->super.isa + var4;
  v21[160] = (Class)((char *)v21[160] + 1);
  v22 = (char *)self + var4;
  v22[1304] = 1;
  v21[164] = (Class)a3->var2;
  v22[1336] = 1;
  NSLog(CFSTR("%s - stats.strongestRSSI:%lddBm stats.currentBssRSSI:%lddBm --> _currentRSSIStrongestCount:%lu"), "-[WiFiUsageBssSession roamCandidatesStatsDidUpdate:]", a3->var2, a3->var0, currentRSSIStrongestCount);
  var0 = a3->var0;
  if (a3->var0 >= -94)
  {
    var3 = a3->var3;
    if (var3 >= -94)
    {
      if (var3 >= var0)
        v25 = &v28;
      else
        v25 = &v29;
      if (var3 >= var0)
        v26 = CFSTR("CurrentToBest");
      else
        v26 = CFSTR("CurrentToNextBest");
      v27 = *(_OWORD *)&a3->var2;
      *(_OWORD *)v25 = *(_OWORD *)&a3->var0;
      *((_OWORD *)v25 + 1) = v27;
      *((_OWORD *)v25 + 2) = *(_OWORD *)&a3->var4;
      *((_QWORD *)v25 + 6) = a3->var7;
      *((_QWORD *)v25 + 7) = a3->var8;
      v25[64] = a3->var9;
      -[WiFiUsageBssSession updateRssiDiffStats:For:](self, "updateRssiDiffStats:For:", v25, v26);
    }
  }

}

- (void)cellularFallbackStateDidChange:(BOOL)a3
{
  void *v5;
  void *v6;
  double v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_cellularFallbackEnabled = a3;
  if (a3)
  {
    ++self->_cellularFallbackStateChangedCount;
    v8 = v5;
    v6 = v5;
LABEL_5:
    -[WiFiUsageBssSession setLastCellularFallbackStateChangedTime:](self, "setLastCellularFallbackStateChangedTime:", v6);
    v5 = v8;
    goto LABEL_6;
  }
  if (self->_lastCellularFallbackStateChangedTime)
  {
    v8 = v5;
    objc_msgSend(v5, "timeIntervalSinceDate:");
    v6 = 0;
    self->_inCellularFallbackDuration = v7 + self->_inCellularFallbackDuration;
    goto LABEL_5;
  }
LABEL_6:

}

- (void)cellularOutrankingStateDidChange:(BOOL)a3
{
  void *v5;
  void *v6;
  double v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_cellularOutrankingEnabled = a3;
  if (a3)
  {
    ++self->_cellularOutrankingStateChangedCount;
    v8 = v5;
    v6 = v5;
LABEL_5:
    -[WiFiUsageBssSession setLastCellularOutrankingStateChangedTime:](self, "setLastCellularOutrankingStateChangedTime:", v6);
    v5 = v8;
    goto LABEL_6;
  }
  if (self->_lastCellularOutrankingStateChangedTime)
  {
    v8 = v5;
    objc_msgSend(v5, "timeIntervalSinceDate:");
    v6 = 0;
    self->_inCellularOutrankingDuration = v7 + self->_inCellularOutrankingDuration;
    goto LABEL_5;
  }
LABEL_6:

}

- (void)faultEventDetected:(unint64_t)a3
{
  if (a3 - 1 <= 0x20)
    ++self->_faultReasonCount[a3];
}

- (void)triggerDisconnectAlerted:(BOOL)a3 confirmed:(BOOL)a4 executed:(BOOL)a5
{
  if (a3)
  {
    ++self->_triggerDisconnectAlertedCount;
    if (!a4)
    {
LABEL_3:
      if (!a5)
        return;
LABEL_7:
      ++self->_triggerDisconnectExecutedCount;
      return;
    }
  }
  else if (!a4)
  {
    goto LABEL_3;
  }
  ++self->_triggerDisconnectConfirmedCount;
  if (a5)
    goto LABEL_7;
}

- (void)receivedBssTransitionRequestWithCandidateListIncluded:(BOOL)a3 isAbridged:(BOOL)a4 disassociationImminent:(BOOL)a5 bssTerminationIncluded:(BOOL)a6 essDisassociationImminent:(BOOL)a7
{
  ++self->_bssTransitionRequestCount;
}

- (void)sentBssTransitionResponseWithStatus:(int64_t)a3 terminationDelayRequested:(BOOL)a4
{
  uint64_t v4;

  v4 = 776;
  if (!a3)
    v4 = 768;
  ++*(Class *)((char *)&self->super.isa + v4);
}

- (unint64_t)inRoamSuppressionEnabledDurationPerc
{
  void *v3;
  void *v4;
  double inRoamSuppressionEnabledDuration;
  double v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  unint64_t v11;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  inRoamSuppressionEnabledDuration = self->_inRoamSuppressionEnabledDuration;
  if (self->_lastRoamSuppressionToggled && self->_isRoamSuppressionEnabled)
  {
    objc_msgSend(v3, "timeIntervalSinceDate:");
    inRoamSuppressionEnabledDuration = inRoamSuppressionEnabledDuration + v6;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageBssSession joinedTimestamp](self, "joinedTimestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", inRoamSuppressionEnabledDuration, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  return v11;
}

- (void)updateWithCompatibilityMode:(unsigned __int8)a3
{
  int v3;
  int isCompatibilityModeEnabled;
  double v6;
  id v7;

  v3 = a3;
  isCompatibilityModeEnabled = self->_isCompatibilityModeEnabled;
  if (!a3 && self->_isCompatibilityModeEnabled)
  {
    -[NSDate timeIntervalSinceNow](self->_lastCompatibilityModeChangedTime, "timeIntervalSinceNow");
    self->_inCompatibilityModeEnabledDuration = self->_inCompatibilityModeEnabledDuration - v6;
    isCompatibilityModeEnabled = self->_isCompatibilityModeEnabled;
  }
  if (isCompatibilityModeEnabled != v3)
  {
    -[WiFiUsageBssSession setIsCompatibilityModeEnabled:](self, "setIsCompatibilityModeEnabled:", v3 != 0);
    ++self->_compatibilityModeChangeCount;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[WiFiUsageBssSession setLastCompatibilityModeChangedTime:](self, "setLastCompatibilityModeChangedTime:", v7);

  }
}

- (NSMutableDictionary)sessionInfo
{
  return self->_sessionInfo;
}

- (void)setSessionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_sessionInfo, a3);
}

- (int64_t)roamConfigTriggerRssi
{
  return self->_roamConfigTriggerRssi;
}

- (void)setRoamConfigTriggerRssi:(int64_t)a3
{
  self->_roamConfigTriggerRssi = a3;
}

- ($FEE1510A43A03BFC9F45CB2D5A0A197D)roamConfigChannels
{
  __int128 v3;

  v3 = *(_OWORD *)&self[38].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)self[38].var0;
  *(_OWORD *)&retstr->var0[2] = v3;
  return self;
}

- (void)setRoamConfigChannels:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_roamConfigChannels.valueByBand[2] = *(_OWORD *)&a3->var0[2];
  *(_OWORD *)self->_roamConfigChannels.valueByBand = v3;
}

- ($6E47B81FEB72AA1B248A20B58E3F028F)roamConfigCriteria
{
  __int128 v3;

  v3 = *(_OWORD *)&self[39].var5;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[39].var0;
  *(_OWORD *)&retstr->var5 = v3;
  return self;
}

- (void)setRoamConfigCriteria:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_roamConfigCriteria.networkOfInterestType = *(_OWORD *)&a3->var5;
  *(_OWORD *)&self->_roamConfigCriteria.isAllowed = v3;
}

- (WiFiUsageBssDetails)originBssDetails
{
  return self->_originBssDetails;
}

- (void)setOriginBssDetails:(id)a3
{
  objc_storeStrong((id *)&self->_originBssDetails, a3);
}

- (unint64_t)roamsAfterSupprLifted
{
  return self->_roamsAfterSupprLifted;
}

- (void)setRoamsAfterSupprLifted:(unint64_t)a3
{
  self->_roamsAfterSupprLifted = a3;
}

- (double)lastRoamSuppressionWaitForRoamStart
{
  return self->_lastRoamSuppressionWaitForRoamStart;
}

- (void)setLastRoamSuppressionWaitForRoamStart:(double)a3
{
  self->_lastRoamSuppressionWaitForRoamStart = a3;
}

- (double)lastRoamSuppressionWaitForRoamEnd
{
  return self->_lastRoamSuppressionWaitForRoamEnd;
}

- (void)setLastRoamSuppressionWaitForRoamEnd:(double)a3
{
  self->_lastRoamSuppressionWaitForRoamEnd = a3;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
  objc_storeStrong((id *)&self->_interfaceName, a3);
}

- (NSDate)joinedTimestamp
{
  return self->_joinedTimestamp;
}

- (void)setJoinedTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_joinedTimestamp, a3);
}

- (NSDate)lastLqmUpdateTimestamp
{
  return self->_lastLqmUpdateTimestamp;
}

- (NSDate)lastPoorCoverageEntryTimestamp
{
  return self->_lastPoorCoverageEntryTimestamp;
}

- (void)setLastPoorCoverageEntryTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_lastPoorCoverageEntryTimestamp, a3);
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

- (NSDate)lastCompatibilityModeChangedTime
{
  return self->_lastCompatibilityModeChangedTime;
}

- (void)setLastCompatibilityModeChangedTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastCompatibilityModeChangedTime, a3);
}

- (WiFiUsageBssDetails)targetBssDetails
{
  return self->_targetBssDetails;
}

- (void)setTargetBssDetails:(id)a3
{
  objc_storeStrong((id *)&self->_targetBssDetails, a3);
}

- (WiFiUsageNetworkDetails)networkDetails
{
  return self->_networkDetails;
}

- (void)setNetworkDetails:(id)a3
{
  objc_storeStrong((id *)&self->_networkDetails, a3);
}

- (NSString)bssEnvironment
{
  return self->_bssEnvironment;
}

- (void)setBssEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_bssEnvironment, a3);
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

- (BOOL)supportsNeighborReport
{
  return self->_supportsNeighborReport;
}

- (void)setSupportsNeighborReport:(BOOL)a3
{
  self->_supportsNeighborReport = a3;
}

- (BOOL)supportsFastTransition
{
  return self->_supportsFastTransition;
}

- (void)setSupportsFastTransition:(BOOL)a3
{
  self->_supportsFastTransition = a3;
}

- (BOOL)supportsBssTransitionManagement
{
  return self->_supportsBssTransitionManagement;
}

- (void)setSupportsBssTransitionManagement:(BOOL)a3
{
  self->_supportsBssTransitionManagement = a3;
}

- (BOOL)supportsAdaptiveFastTransition
{
  return self->_supportsAdaptiveFastTransition;
}

- (void)setSupportsAdaptiveFastTransition:(BOOL)a3
{
  self->_supportsAdaptiveFastTransition = a3;
}

- (BOOL)supportsFastlane
{
  return self->_supportsFastlane;
}

- (void)setSupportsFastlane:(BOOL)a3
{
  self->_supportsFastlane = a3;
}

- (BOOL)supportsNetworkAssurance
{
  return self->_supportsNetworkAssurance;
}

- (void)setSupportsNetworkAssurance:(BOOL)a3
{
  self->_supportsNetworkAssurance = a3;
}

- (BOOL)supportsAdaptiveRoaming
{
  return self->_supportsAdaptiveRoaming;
}

- (void)setSupportsAdaptiveRoaming:(BOOL)a3
{
  self->_supportsAdaptiveRoaming = a3;
}

- (BOOL)isCompatibilityModeEnabledAtStart
{
  return self->_isCompatibilityModeEnabledAtStart;
}

- (void)setIsCompatibilityModeEnabledAtStart:(BOOL)a3
{
  self->_isCompatibilityModeEnabledAtStart = a3;
}

- (BOOL)isCompatibilityModeEnabled
{
  return self->_isCompatibilityModeEnabled;
}

- (void)setIsCompatibilityModeEnabled:(BOOL)a3
{
  self->_isCompatibilityModeEnabled = a3;
}

- (int64_t)newRssi
{
  return self->_newRssi;
}

- (void)setNewRssi:(int64_t)a3
{
  self->_newRssi = a3;
}

- (int64_t)lastLinkRssi
{
  return self->_lastLinkRssi;
}

- (int64_t)lastRoamScanRssi
{
  return self->_lastRoamScanRssi;
}

- (void)setLastRoamScanRssi:(int64_t)a3
{
  self->_lastRoamScanRssi = a3;
}

- (int)currentBand
{
  return self->_currentBand;
}

- (void)setCurrentBand:(int)a3
{
  self->_currentBand = a3;
}

- (int)newBand
{
  return self->_newBand;
}

- (void)setNewBand:(int)a3
{
  self->_newBand = a3;
}

- (unint64_t)currentChannel
{
  return self->_currentChannel;
}

- (void)setCurrentChannel:(unint64_t)a3
{
  self->_currentChannel = a3;
}

- (unint64_t)newChannel
{
  return self->_newChannel;
}

- (void)setNewChannel:(unint64_t)a3
{
  self->_newChannel = a3;
}

- (int64_t)linkRssiGt40
{
  return self->_linkRssiGt40;
}

- (void)setLinkRssiGt40:(int64_t)a3
{
  self->_linkRssiGt40 = a3;
}

- (int64_t)linkRssi40to50
{
  return self->_linkRssi40to50;
}

- (void)setLinkRssi40to50:(int64_t)a3
{
  self->_linkRssi40to50 = a3;
}

- (int64_t)linkRssi50to60
{
  return self->_linkRssi50to60;
}

- (void)setLinkRssi50to60:(int64_t)a3
{
  self->_linkRssi50to60 = a3;
}

- (int64_t)linkRssi60to65
{
  return self->_linkRssi60to65;
}

- (void)setLinkRssi60to65:(int64_t)a3
{
  self->_linkRssi60to65 = a3;
}

- (int64_t)linkRssi65to70
{
  return self->_linkRssi65to70;
}

- (void)setLinkRssi65to70:(int64_t)a3
{
  self->_linkRssi65to70 = a3;
}

- (int64_t)linkRssi70to75
{
  return self->_linkRssi70to75;
}

- (void)setLinkRssi70to75:(int64_t)a3
{
  self->_linkRssi70to75 = a3;
}

- (int64_t)linkRssi75to80
{
  return self->_linkRssi75to80;
}

- (void)setLinkRssi75to80:(int64_t)a3
{
  self->_linkRssi75to80 = a3;
}

- (int64_t)linkRssi80to85
{
  return self->_linkRssi80to85;
}

- (void)setLinkRssi80to85:(int64_t)a3
{
  self->_linkRssi80to85 = a3;
}

- (int64_t)linkRssi85to90
{
  return self->_linkRssi85to90;
}

- (void)setLinkRssi85to90:(int64_t)a3
{
  self->_linkRssi85to90 = a3;
}

- (int64_t)linkRssiLt90
{
  return self->_linkRssiLt90;
}

- (void)setLinkRssiLt90:(int64_t)a3
{
  self->_linkRssiLt90 = a3;
}

- (unint64_t)roamReasonInitialAssociationCount
{
  return self->_roamReasonInitialAssociationCount;
}

- (void)setRoamReasonInitialAssociationCount:(unint64_t)a3
{
  self->_roamReasonInitialAssociationCount = a3;
}

- (unint64_t)roamReasonLowRssiCount
{
  return self->_roamReasonLowRssiCount;
}

- (void)setRoamReasonLowRssiCount:(unint64_t)a3
{
  self->_roamReasonLowRssiCount = a3;
}

- (unint64_t)roamReasonDeauthDisassocCount
{
  return self->_roamReasonDeauthDisassocCount;
}

- (void)setRoamReasonDeauthDisassocCount:(unint64_t)a3
{
  self->_roamReasonDeauthDisassocCount = a3;
}

- (unint64_t)roamReasonBeaconLostCount
{
  return self->_roamReasonBeaconLostCount;
}

- (void)setRoamReasonBeaconLostCount:(unint64_t)a3
{
  self->_roamReasonBeaconLostCount = a3;
}

- (unint64_t)roamReasonSteeredByApCount
{
  return self->_roamReasonSteeredByApCount;
}

- (void)setRoamReasonSteeredByApCount:(unint64_t)a3
{
  self->_roamReasonSteeredByApCount = a3;
}

- (unint64_t)roamReasonSteeredByBtmCount
{
  return self->_roamReasonSteeredByBtmCount;
}

- (void)setRoamReasonSteeredByBtmCount:(unint64_t)a3
{
  self->_roamReasonSteeredByBtmCount = a3;
}

- (unint64_t)roamReasonSteeredByCsaCount
{
  return self->_roamReasonSteeredByCsaCount;
}

- (void)setRoamReasonSteeredByCsaCount:(unint64_t)a3
{
  self->_roamReasonSteeredByCsaCount = a3;
}

- (unint64_t)roamReasonReassocRequestedCount
{
  return self->_roamReasonReassocRequestedCount;
}

- (void)setRoamReasonReassocRequestedCount:(unint64_t)a3
{
  self->_roamReasonReassocRequestedCount = a3;
}

- (unint64_t)roamReasonHostTriggeredCount
{
  return self->_roamReasonHostTriggeredCount;
}

- (void)setRoamReasonHostTriggeredCount:(unint64_t)a3
{
  self->_roamReasonHostTriggeredCount = a3;
}

- (unint64_t)roamReasonBetterCandidateCount
{
  return self->_roamReasonBetterCandidateCount;
}

- (void)setRoamReasonBetterCandidateCount:(unint64_t)a3
{
  self->_roamReasonBetterCandidateCount = a3;
}

- (unint64_t)roamReasonBetterConditionCount
{
  return self->_roamReasonBetterConditionCount;
}

- (void)setRoamReasonBetterConditionCount:(unint64_t)a3
{
  self->_roamReasonBetterConditionCount = a3;
}

- (unint64_t)roamReasonMiscCount
{
  return self->_roamReasonMiscCount;
}

- (void)setRoamReasonMiscCount:(unint64_t)a3
{
  self->_roamReasonMiscCount = a3;
}

- (unint64_t)roamStatusSucceededCount
{
  return self->_roamStatusSucceededCount;
}

- (void)setRoamStatusSucceededCount:(unint64_t)a3
{
  self->_roamStatusSucceededCount = a3;
}

- (unint64_t)roamStatusFailedCount
{
  return self->_roamStatusFailedCount;
}

- (void)setRoamStatusFailedCount:(unint64_t)a3
{
  self->_roamStatusFailedCount = a3;
}

- (unint64_t)roamStatusNoCandidateCount
{
  return self->_roamStatusNoCandidateCount;
}

- (void)setRoamStatusNoCandidateCount:(unint64_t)a3
{
  self->_roamStatusNoCandidateCount = a3;
}

- (unint64_t)roamStatusNoQualifiedCandidateCount
{
  return self->_roamStatusNoQualifiedCandidateCount;
}

- (void)setRoamStatusNoQualifiedCandidateCount:(unint64_t)a3
{
  self->_roamStatusNoQualifiedCandidateCount = a3;
}

- (unint64_t)roamIsWNMScoreUsedCount
{
  return self->_roamIsWNMScoreUsedCount;
}

- (void)setRoamIsWNMScoreUsedCount:(unint64_t)a3
{
  self->_roamIsWNMScoreUsedCount = a3;
}

- (unint64_t)roamPingPongNth
{
  return self->_roamPingPongNth;
}

- (void)setRoamPingPongNth:(unint64_t)a3
{
  self->_roamPingPongNth = a3;
}

- (BOOL)roamInMotion
{
  return self->_roamInMotion;
}

- (void)setRoamInMotion:(BOOL)a3
{
  self->_roamInMotion = a3;
}

- (BOOL)isRoamSuppressionEnabled
{
  return self->_isRoamSuppressionEnabled;
}

- (void)setIsRoamSuppressionEnabled:(BOOL)a3
{
  self->_isRoamSuppressionEnabled = a3;
}

- (NSDate)lastRoamSuppressionToggled
{
  return self->_lastRoamSuppressionToggled;
}

- (void)setLastRoamSuppressionToggled:(id)a3
{
  objc_storeStrong((id *)&self->_lastRoamSuppressionToggled, a3);
}

- (unint64_t)inRoamSuppressionEnabledCount
{
  return self->_inRoamSuppressionEnabledCount;
}

- (void)setInRoamSuppressionEnabledCount:(unint64_t)a3
{
  self->_inRoamSuppressionEnabledCount = a3;
}

- (double)inRoamSuppressionEnabledDuration
{
  return self->_inRoamSuppressionEnabledDuration;
}

- (void)setInRoamSuppressionEnabledDuration:(double)a3
{
  self->_inRoamSuppressionEnabledDuration = a3;
}

- (unint64_t)bssTransitionRequestCount
{
  return self->_bssTransitionRequestCount;
}

- (void)setBssTransitionRequestCount:(unint64_t)a3
{
  self->_bssTransitionRequestCount = a3;
}

- (unint64_t)bssTransitionAcceptedCount
{
  return self->_bssTransitionAcceptedCount;
}

- (void)setBssTransitionAcceptedCount:(unint64_t)a3
{
  self->_bssTransitionAcceptedCount = a3;
}

- (unint64_t)bssTransitionRejectedCount
{
  return self->_bssTransitionRejectedCount;
}

- (void)setBssTransitionRejectedCount:(unint64_t)a3
{
  self->_bssTransitionRejectedCount = a3;
}

- (unint64_t)minCandidatesCount
{
  return self->_minCandidatesCount;
}

- (void)setMinCandidatesCount:(unint64_t)a3
{
  self->_minCandidatesCount = a3;
}

- (unint64_t)maxCandidatesCount
{
  return self->_maxCandidatesCount;
}

- (void)setMaxCandidatesCount:(unint64_t)a3
{
  self->_maxCandidatesCount = a3;
}

- (unint64_t)currentRSSIStrongestCount
{
  return self->_currentRSSIStrongestCount;
}

- (void)setCurrentRSSIStrongestCount:(unint64_t)a3
{
  self->_currentRSSIStrongestCount = a3;
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

  v3 = *(_OWORD *)&self[40].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)self[40].var0;
  *(_OWORD *)&retstr->var0[2] = v3;
  return self;
}

- (void)setStrongestRSSICountByBand:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_strongestRSSICountByBand.valueByBand[2] = *(_OWORD *)&a3->var0[2];
  *(_OWORD *)self->_strongestRSSICountByBand.valueByBand = v3;
}

- ($FEE1510A43A03BFC9F45CB2D5A0A197D)strongestRSSIByBand
{
  __int128 v3;

  v3 = *(_OWORD *)&self[41].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)self[41].var0;
  *(_OWORD *)&retstr->var0[2] = v3;
  return self;
}

- (void)setStrongestRSSIByBand:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_strongestRSSIByBand.valueByBand[2] = *(_OWORD *)&a3->var0[2];
  *(_OWORD *)self->_strongestRSSIByBand.valueByBand = v3;
}

- ($FEE1510A43A03BFC9F45CB2D5A0A197D)roamNeighsSmllstCurrentToBestRssiByBand
{
  __int128 v3;

  v3 = *(_OWORD *)&self[42].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)self[42].var0;
  *(_OWORD *)&retstr->var0[2] = v3;
  return self;
}

- (void)setRoamNeighsSmllstCurrentToBestRssiByBand:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToBestRssiByBand.valueByBand[2] = *(_OWORD *)&a3->var0[2];
  *(_OWORD *)self->_roamNeighsSmllstCurrentToBestRssiByBand.valueByBand = v3;
}

- ($FEE1510A43A03BFC9F45CB2D5A0A197D)roamNeighsLrgstCurrentToBestRssiByBand
{
  __int128 v3;

  v3 = *(_OWORD *)&self[43].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)self[43].var0;
  *(_OWORD *)&retstr->var0[2] = v3;
  return self;
}

- (void)setRoamNeighsLrgstCurrentToBestRssiByBand:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToBestRssiByBand.valueByBand[2] = *(_OWORD *)&a3->var0[2];
  *(_OWORD *)self->_roamNeighsLrgstCurrentToBestRssiByBand.valueByBand = v3;
}

- ($FEE1510A43A03BFC9F45CB2D5A0A197D)roamNeighsSmllstCurrentToNextBestRssiByBand
{
  __int128 v3;

  v3 = *(_OWORD *)&self[44].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)self[44].var0;
  *(_OWORD *)&retstr->var0[2] = v3;
  return self;
}

- (void)setRoamNeighsSmllstCurrentToNextBestRssiByBand:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_roamNeighsSmllstCurrentToNextBestRssiByBand.valueByBand[2] = *(_OWORD *)&a3->var0[2];
  *(_OWORD *)self->_roamNeighsSmllstCurrentToNextBestRssiByBand.valueByBand = v3;
}

- ($FEE1510A43A03BFC9F45CB2D5A0A197D)roamNeighsLrgstCurrentToNextBestRssiByBand
{
  __int128 v3;

  v3 = *(_OWORD *)&self[45].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)self[45].var0;
  *(_OWORD *)&retstr->var0[2] = v3;
  return self;
}

- (void)setRoamNeighsLrgstCurrentToNextBestRssiByBand:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_roamNeighsLrgstCurrentToNextBestRssiByBand.valueByBand[2] = *(_OWORD *)&a3->var0[2];
  *(_OWORD *)self->_roamNeighsLrgstCurrentToNextBestRssiByBand.valueByBand = v3;
}

- (unint64_t)highRssiRoamScanCount
{
  return self->_highRssiRoamScanCount;
}

- (void)setHighRssiRoamScanCount:(unint64_t)a3
{
  self->_highRssiRoamScanCount = a3;
}

- (unint64_t)lowRssiRoamScanCount
{
  return self->_lowRssiRoamScanCount;
}

- (void)setLowRssiRoamScanCount:(unint64_t)a3
{
  self->_lowRssiRoamScanCount = a3;
}

- (unint64_t)unexpectedBeaconLostRoamScanCount
{
  return self->_unexpectedBeaconLostRoamScanCount;
}

- (void)setUnexpectedBeaconLostRoamScanCount:(unint64_t)a3
{
  self->_unexpectedBeaconLostRoamScanCount = a3;
}

- (double)poorCoverageAndA2dpDuration
{
  return self->_poorCoverageAndA2dpDuration;
}

- (void)setPoorCoverageAndA2dpDuration:(double)a3
{
  self->_poorCoverageAndA2dpDuration = a3;
}

- (double)poorCoverageAndScoDuration
{
  return self->_poorCoverageAndScoDuration;
}

- (void)setPoorCoverageAndScoDuration:(double)a3
{
  self->_poorCoverageAndScoDuration = a3;
}

- (double)poorCoverageAndAwdlDuration
{
  return self->_poorCoverageAndAwdlDuration;
}

- (void)setPoorCoverageAndAwdlDuration:(double)a3
{
  self->_poorCoverageAndAwdlDuration = a3;
}

- (double)poorCoverageAndScanDuration
{
  return self->_poorCoverageAndScanDuration;
}

- (void)setPoorCoverageAndScanDuration:(double)a3
{
  self->_poorCoverageAndScanDuration = a3;
}

- (double)minRoamLatency
{
  return self->_minRoamLatency;
}

- (void)setMinRoamLatency:(double)a3
{
  self->_minRoamLatency = a3;
}

- (double)maxRoamLatency
{
  return self->_maxRoamLatency;
}

- (void)setMaxRoamLatency:(double)a3
{
  self->_maxRoamLatency = a3;
}

- (unint64_t)partialScanCount
{
  return self->_partialScanCount;
}

- (void)setPartialScanCount:(unint64_t)a3
{
  self->_partialScanCount = a3;
}

- (unint64_t)fullScanCount
{
  return self->_fullScanCount;
}

- (void)setFullScanCount:(unint64_t)a3
{
  self->_fullScanCount = a3;
}

- (NSDate)callStartedTime
{
  return self->_callStartedTime;
}

- (void)setCallStartedTime:(id)a3
{
  objc_storeStrong((id *)&self->_callStartedTime, a3);
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

- (double)inCallDuration
{
  return self->_inCallDuration;
}

- (void)setInCallDuration:(double)a3
{
  self->_inCallDuration = a3;
}

- (double)inVehicleDuration
{
  return self->_inVehicleDuration;
}

- (void)setInVehicleDuration:(double)a3
{
  self->_inVehicleDuration = a3;
}

- (double)inMotionDuration
{
  return self->_inMotionDuration;
}

- (void)setInMotionDuration:(double)a3
{
  self->_inMotionDuration = a3;
}

- (double)inA2dpDuration
{
  return self->_inA2dpDuration;
}

- (void)setInA2dpDuration:(double)a3
{
  self->_inA2dpDuration = a3;
}

- (double)inScoDuration
{
  return self->_inScoDuration;
}

- (void)setInScoDuration:(double)a3
{
  self->_inScoDuration = a3;
}

- (double)inHidPresentDuration
{
  return self->_inHidPresentDuration;
}

- (void)setInHidPresentDuration:(double)a3
{
  self->_inHidPresentDuration = a3;
}

- (double)inAwdlDuration
{
  return self->_inAwdlDuration;
}

- (void)setInAwdlDuration:(double)a3
{
  self->_inAwdlDuration = a3;
}

- (double)inRoamDuration
{
  return self->_inRoamDuration;
}

- (void)setInRoamDuration:(double)a3
{
  self->_inRoamDuration = a3;
}

- (double)inScanDuration
{
  return self->_inScanDuration;
}

- (void)setInScanDuration:(double)a3
{
  self->_inScanDuration = a3;
}

- (double)inCellularFallbackDuration
{
  return self->_inCellularFallbackDuration;
}

- (void)setInCellularFallbackDuration:(double)a3
{
  self->_inCellularFallbackDuration = a3;
}

- (double)inCellularOutrankingDuration
{
  return self->_inCellularOutrankingDuration;
}

- (void)setInCellularOutrankingDuration:(double)a3
{
  self->_inCellularOutrankingDuration = a3;
}

- (double)inPoorCoverageDuration
{
  return self->_inPoorCoverageDuration;
}

- (void)setInPoorCoverageDuration:(double)a3
{
  self->_inPoorCoverageDuration = a3;
}

- (double)inCompatibilityModeEnabledDuration
{
  return self->_inCompatibilityModeEnabledDuration;
}

- (void)setInCompatibilityModeEnabledDuration:(double)a3
{
  self->_inCompatibilityModeEnabledDuration = a3;
}

- (unint64_t)inCallEventCount
{
  return self->_inCallEventCount;
}

- (void)setInCallEventCount:(unint64_t)a3
{
  self->_inCallEventCount = a3;
}

- (unint64_t)inVehicleEventCount
{
  return self->_inVehicleEventCount;
}

- (void)setInVehicleEventCount:(unint64_t)a3
{
  self->_inVehicleEventCount = a3;
}

- (unint64_t)inMotionEventCount
{
  return self->_inMotionEventCount;
}

- (void)setInMotionEventCount:(unint64_t)a3
{
  self->_inMotionEventCount = a3;
}

- (unint64_t)inA2dpEventCount
{
  return self->_inA2dpEventCount;
}

- (void)setInA2dpEventCount:(unint64_t)a3
{
  self->_inA2dpEventCount = a3;
}

- (unint64_t)inScoEventCount
{
  return self->_inScoEventCount;
}

- (void)setInScoEventCount:(unint64_t)a3
{
  self->_inScoEventCount = a3;
}

- (unint64_t)inHidPresentCount
{
  return self->_inHidPresentCount;
}

- (void)setInHidPresentCount:(unint64_t)a3
{
  self->_inHidPresentCount = a3;
}

- (unint64_t)inAwdlEventCount
{
  return self->_inAwdlEventCount;
}

- (void)setInAwdlEventCount:(unint64_t)a3
{
  self->_inAwdlEventCount = a3;
}

- (unint64_t)inRoamEventCount
{
  return self->_inRoamEventCount;
}

- (void)setInRoamEventCount:(unint64_t)a3
{
  self->_inRoamEventCount = a3;
}

- (unint64_t)inScanEventCount
{
  return self->_inScanEventCount;
}

- (void)setInScanEventCount:(unint64_t)a3
{
  self->_inScanEventCount = a3;
}

- (unint64_t)cellularFallbackStateChangedCount
{
  return self->_cellularFallbackStateChangedCount;
}

- (void)setCellularFallbackStateChangedCount:(unint64_t)a3
{
  self->_cellularFallbackStateChangedCount = a3;
}

- (unint64_t)cellularOutrankingStateChangedCount
{
  return self->_cellularOutrankingStateChangedCount;
}

- (void)setCellularOutrankingStateChangedCount:(unint64_t)a3
{
  self->_cellularOutrankingStateChangedCount = a3;
}

- (unint64_t)locationScanCount
{
  return self->_locationScanCount;
}

- (void)setLocationScanCount:(unint64_t)a3
{
  self->_locationScanCount = a3;
}

- (unint64_t)indoorScanCount
{
  return self->_indoorScanCount;
}

- (void)setIndoorScanCount:(unint64_t)a3
{
  self->_indoorScanCount = a3;
}

- (unint64_t)compatibilityModeChangeCount
{
  return self->_compatibilityModeChangeCount;
}

- (void)setCompatibilityModeChangeCount:(unint64_t)a3
{
  self->_compatibilityModeChangeCount = a3;
}

- (unint64_t)triggerDisconnectAlertedCount
{
  return self->_triggerDisconnectAlertedCount;
}

- (void)setTriggerDisconnectAlertedCount:(unint64_t)a3
{
  self->_triggerDisconnectAlertedCount = a3;
}

- (unint64_t)triggerDisconnectConfirmedCount
{
  return self->_triggerDisconnectConfirmedCount;
}

- (void)setTriggerDisconnectConfirmedCount:(unint64_t)a3
{
  self->_triggerDisconnectConfirmedCount = a3;
}

- (unint64_t)triggerDisconnectExecutedCount
{
  return self->_triggerDisconnectExecutedCount;
}

- (void)setTriggerDisconnectExecutedCount:(unint64_t)a3
{
  self->_triggerDisconnectExecutedCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scanningActiveTime, 0);
  objc_storeStrong((id *)&self->_roamingActiveTime, 0);
  objc_storeStrong((id *)&self->_awdlActiveTime, 0);
  objc_storeStrong((id *)&self->_hidPresentTime, 0);
  objc_storeStrong((id *)&self->_scoActiveTime, 0);
  objc_storeStrong((id *)&self->_a2dpActiveTime, 0);
  objc_storeStrong((id *)&self->_inMotionStartedTime, 0);
  objc_storeStrong((id *)&self->_inVehicleEntryTime, 0);
  objc_storeStrong((id *)&self->_callStartedTime, 0);
  objc_storeStrong((id *)&self->_roamNeighborsByBand, 0);
  objc_storeStrong((id *)&self->_lastRoamSuppressionToggled, 0);
  objc_storeStrong((id *)&self->_bssEnvironment, 0);
  objc_storeStrong((id *)&self->_networkDetails, 0);
  objc_storeStrong((id *)&self->_targetBssDetails, 0);
  objc_storeStrong((id *)&self->_lastCompatibilityModeChangedTime, 0);
  objc_storeStrong((id *)&self->_lastCellularOutrankingStateChangedTime, 0);
  objc_storeStrong((id *)&self->_lastCellularFallbackStateChangedTime, 0);
  objc_storeStrong((id *)&self->_lastPoorCoverageEntryTimestamp, 0);
  objc_storeStrong((id *)&self->_lastLqmUpdateTimestamp, 0);
  objc_storeStrong((id *)&self->_joinedTimestamp, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_originBssDetails, 0);
  objc_storeStrong((id *)&self->_sessionInfo, 0);
}

@end
