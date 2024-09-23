@implementation WiFiUsageLQMWindowAnalysisRoaming

- (WiFiUsageLQMWindowAnalysisRoaming)initWithRollingWindow:(id)a3 WithRoamingState:(BOOL)a4 andReasonString:(id)a5 andStatus:(unint64_t)a6 asString:(id)a7 andLatency:(unint64_t)a8 andRoamData:(id)a9 andCurrentBSSSession:(id)a10 andContext:(context)a11 andPingPongStats:(id)a12 andTimestamp:(id)a13 onQueue:(id)a14
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  WiFiUsageLQMWindowAnalysisRoaming *v22;
  WiFiUsageLQMWindowAnalysisRoaming *v23;
  uint64_t v24;
  id v25;
  _BOOL8 v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  WiFiUsageLQMWindowAnalysisRoaming *v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v55;
  __int16 v56;
  void *v57;
  _OWORD v58[2];
  objc_super v59[2];
  objc_super v60;

  v56 = a6;
  v17 = a5;
  v18 = a7;
  v19 = a9;
  v20 = a10;
  v21 = a12;
  v60.receiver = self;
  v60.super_class = (Class)WiFiUsageLQMWindowAnalysisRoaming;
  v22 = -[WiFiUsageLQMWindowAnalysis initWithRollingWindow:andReason:andContext:andTimestamp:onQueue:](&v60, sel_initWithRollingWindow_andReason_andContext_andTimestamp_onQueue_, a3, CFSTR("Roaming"), *(_QWORD *)&a11.var0 & 0xFFFFFFLL, a13, a14);
  v23 = v22;
  if (v22)
  {
    -[WiFiUsageLQMWindowAnalysisRoaming setRoamingReason:](v22, "setRoamingReason:", v17);
    -[WiFiUsageLQMWindowAnalysisRoaming setRoamingStatus:](v23, "setRoamingStatus:", v18);
    -[WiFiUsageLQMWindowAnalysisRoaming setLatency:](v23, "setLatency:", a8);
    objc_msgSend(v19, "objectForKey:", CFSTR("ROAMEDEVENT_FLAGS"));
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v18;
    if ((v56 & 0x1FF) != 0)
    {
      -[WiFiUsageLQMWindowAnalysisRoaming setRoamBssSupports:](v23, "setRoamBssSupports:", 0);
      -[WiFiUsageLQMWindowAnalysisRoaming setIsWNMScoreRoam:](v23, "setIsWNMScoreRoam:", 0);
      v26 = 0;
    }
    else
    {
      +[WiFiUsageLQMWindowAnalysisRoaming bssSupportWithFlags:](WiFiUsageLQMWindowAnalysisRoaming, "bssSupportWithFlags:", v24);
      v27 = v19;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageLQMWindowAnalysisRoaming setRoamBssSupports:](v23, "setRoamBssSupports:", v28);

      v19 = v27;
      -[WiFiUsageLQMWindowAnalysisRoaming setIsWNMScoreRoam:](v23, "setIsWNMScoreRoam:", +[WiFiUsageLQMWindowAnalysisRoaming isWNMRoam:](WiFiUsageLQMWindowAnalysisRoaming, "isWNMRoam:", v24));
      v26 = +[WiFiUsageLQMWindowAnalysisRoaming isColocatedRoam:](WiFiUsageLQMWindowAnalysisRoaming, "isColocatedRoam:", v24);
    }
    -[WiFiUsageLQMWindowAnalysisRoaming setIsColocatedRoam:](v23, "setIsColocatedRoam:", v26);
    if (v20)
    {
      -[WiFiUsageLQMWindowAnalysisRoaming setRoamConfigTriggerRssi:](v23, "setRoamConfigTriggerRssi:", objc_msgSend(v20, "roamConfigTriggerRssi"));
      objc_msgSend(v20, "roamConfigChannels");
      -[WiFiUsageLQMWindowAnalysisRoaming setRoamConfigChannels:](v23, "setRoamConfigChannels:", v59);
      objc_msgSend(v20, "roamConfigCriteria");
    }
    else
    {
      -[WiFiUsageLQMWindowAnalysisRoaming setRoamConfigTriggerRssi:](v23, "setRoamConfigTriggerRssi:", 0x7FFFFFFFFFFFFFFFLL);
      memset(v59, 0, sizeof(v59));
      -[WiFiUsageLQMWindowAnalysisRoaming setRoamConfigChannels:](v23, "setRoamConfigChannels:", v59);
      memset(v58, 0, sizeof(v58));
    }
    -[WiFiUsageLQMWindowAnalysisRoaming setRoamConfigCriteria:](v23, "setRoamConfigCriteria:", v58);
    objc_msgSend(v19, "objectForKey:", CFSTR("ROAMEDEVENT_ORIGIN_RSSI"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v29;
    if (v29)
      v30 = objc_msgSend(v29, "integerValue");
    else
      v30 = 0x7FFFFFFFFFFFFFFFLL;
    -[WiFiUsageLQMWindowAnalysisRoaming setOriginRssi:](v23, "setOriginRssi:", v30);
    objc_msgSend(v19, "objectForKey:", CFSTR("ROAMEDEVENT_TARGET_RSSI"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v31;
    if (v31)
      v32 = objc_msgSend(v31, "integerValue");
    else
      v32 = 0x7FFFFFFFFFFFFFFFLL;
    v55 = v17;
    -[WiFiUsageLQMWindowAnalysisRoaming setTargetRssi:](v23, "setTargetRssi:", v32);
    v53 = v21;
    -[WiFiUsageLQMWindowAnalysisRoaming setPingPongStats:](v23, "setPingPongStats:", v21);
    -[WiFiUsageLQMWindowAnalysisRoaming setRoamSuppressionEnabledPerc:](v23, "setRoamSuppressionEnabledPerc:", objc_msgSend(v20, "inRoamSuppressionEnabledDurationPerc"));
    -[WiFiUsageLQMWindowAnalysisRoaming setFirstRoamAfterRoamRecommLifted:](v23, "setFirstRoamAfterRoamRecommLifted:", objc_msgSend(v20, "roamsAfterSupprLifted") == 1);
    if (v23->_firstRoamAfterRoamRecommLifted)
    {
      objc_msgSend(v20, "lastRoamSuppressionWaitForRoamStart");
      -[WiFiUsageLQMWindowAnalysisRoaming setRoamSuppressionWaitForRoamStart:](v23, "setRoamSuppressionWaitForRoamStart:");
      objc_msgSend(v20, "lastRoamSuppressionWaitForRoamEnd");
      -[WiFiUsageLQMWindowAnalysisRoaming setRoamSuppressionWaitForRoamEnd:](v23, "setRoamSuppressionWaitForRoamEnd:");
    }
    objc_msgSend(v19, "objectForKey:", CFSTR("ROAM_SCAN_SUMMARY"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v19;
    objc_msgSend(v19, "objectForKey:", CFSTR("ROAMEDEVENT_CHANNELS_SCANNED_COUNT"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKey:", CFSTR("ROAM_SCAN_DURATION"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKey:", CFSTR("ROAM_NUM_FULL_BAND_SCANS"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectForKey:", CFSTR("ROAM_NUM_PARTIAL_SCANS"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
      v38 = objc_msgSend(v34, "unsignedIntegerValue");
    else
      v38 = 0x7FFFFFFFFFFFFFFFLL;
    -[WiFiUsageLQMWindowAnalysisRoaming setRoamScannedChannelCount:](v23, "setRoamScannedChannelCount:", v38);
    if (v35)
      v39 = objc_msgSend(v35, "unsignedIntegerValue");
    else
      v39 = 0x7FFFFFFFFFFFFFFFLL;
    -[WiFiUsageLQMWindowAnalysisRoaming setScanDuration:](v23, "setScanDuration:", v39);
    if (v36)
      v40 = objc_msgSend(v36, "unsignedIntegerValue");
    else
      v40 = 0x7FFFFFFFFFFFFFFFLL;
    -[WiFiUsageLQMWindowAnalysisRoaming setRoamFullBandScanCount:](v23, "setRoamFullBandScanCount:", v40);
    v52 = v25;
    v49 = (void *)v24;
    if (v37)
      v41 = objc_msgSend(v37, "unsignedIntegerValue");
    else
      v41 = 0x7FFFFFFFFFFFFFFFLL;
    -[WiFiUsageLQMWindowAnalysisRoaming setRoamPartialBandScanCount:](v23, "setRoamPartialBandScanCount:", v41);
    objc_msgSend(v57, "objectForKey:", CFSTR("ROAM_PKT_LOSS_INFO"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "objectForKey:", CFSTR("ROAM_PKTS_PENDING_AQM"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "objectForKey:", CFSTR("ROAM_PKTS_PENDING_TXSUBQ"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
      v45 = objc_msgSend(v43, "unsignedIntegerValue");
    else
      v45 = 0x7FFFFFFFFFFFFFFFLL;
    -[WiFiUsageLQMWindowAnalysisRoaming setRoamPktsPendingAqm:](v23, "setRoamPktsPendingAqm:", v45);
    if (v44)
      v46 = objc_msgSend(v44, "unsignedIntegerValue");
    else
      v46 = 0x7FFFFFFFFFFFFFFFLL;
    -[WiFiUsageLQMWindowAnalysisRoaming setRoamPktsPendingTxSubQ:](v23, "setRoamPktsPendingTxSubQ:", v46);
    v47 = v23;

    v17 = v55;
    v19 = v57;
    v18 = v52;
    v21 = v53;
  }

  return v23;
}

+ (BOOL)isColocatedRoam:(id)a3
{
  _BOOL8 v3;

  if (a3)
    return ((unint64_t)objc_msgSend(a3, "unsignedIntegerValue") >> 7) & 1;
  else
    LOBYTE(v3) = 0;
  return v3;
}

+ (BOOL)isWNMRoam:(id)a3
{
  _BOOL8 v3;

  if (a3)
    return ((unint64_t)objc_msgSend(a3, "unsignedIntegerValue") >> 6) & 1;
  else
    LOBYTE(v3) = 0;
  return v3;
}

+ (id)bssSupportWithFlags:(id)a3
{
  id v3;
  void *v4;
  char v5;
  char v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (!v3)
    goto LABEL_9;
  v5 = objc_msgSend(v3, "unsignedIntegerValue");
  v6 = v5;
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v4, "appendString:", CFSTR("NR&"));
    if ((v6 & 2) == 0)
    {
LABEL_4:
      if ((v6 & 4) == 0)
        goto LABEL_5;
      goto LABEL_12;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(v4, "appendString:", CFSTR("FT&"));
  if ((v6 & 4) == 0)
  {
LABEL_5:
    if ((v6 & 8) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(v4, "appendString:", CFSTR("BTM&"));
  if ((v6 & 8) == 0)
  {
LABEL_6:
    if ((v6 & 0x10) == 0)
      goto LABEL_7;
LABEL_14:
    objc_msgSend(v4, "appendString:", CFSTR("fastlane&"));
    if ((v6 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_13:
  objc_msgSend(v4, "appendString:", CFSTR("adaptiveFBT&"));
  if ((v6 & 0x10) != 0)
    goto LABEL_14;
LABEL_7:
  if ((v6 & 0x20) != 0)
LABEL_8:
    objc_msgSend(v4, "appendString:", CFSTR("ntwAssurance&"));
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)addDimensionsTo:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  __int128 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int64_t originRssi;
  void *v19;
  int64_t targetRssi;
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
  int64_t latency;
  void *v47;
  int64_t scanDuration;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  unint64_t roamPktsPendingAqm;
  void *v56;
  unint64_t roamPktsPendingTxSubQ;
  void *v58;
  objc_super v60;
  objc_super v61;
  objc_super v62;
  _OWORD v63[2];
  objc_super v64;

  v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)WiFiUsageLQMWindowAnalysisRoaming;
  v5 = -[WiFiUsageLQMWindowAnalysis addDimensionsTo:](&v64, sel_addDimensionsTo_, v4);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_roamingReason, CFSTR("roamingReason"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_roamingStatus, CFSTR("roamingStatus"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isWNMScoreRoam);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("roamIsWNMScoreRoam"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isColocatedRoam);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("roamIsColocatedRoam"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_roamBssSupports, CFSTR("roamTargetBssSupports"));
  +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:](WiFiUsageLQMTransformations, "numberForKeyPath:ofObject:", CFSTR("roamConfigTriggerRssi"), self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("roamConfigTriggerRssi"));

  v9 = *(_OWORD *)&self->_roamConfigChannels.valueByBand[2];
  v63[0] = *(_OWORD *)self->_roamConfigChannels.valueByBand;
  v63[1] = v9;
  +[WiFiUsagePrivacyFilter getLabelForIntegerByBand:](WiFiUsagePrivacyFilter, "getLabelForIntegerByBand:", v63);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("roamConfigChannelsByBand"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_roamConfigCriteria.isAllowed);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("roamConfigIsARAllowed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_roamConfigCriteria.forceApply);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("roamConfigIsARForceApplied"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_roamConfigCriteria.deviceSupport);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("roamConfigDeviceSupportsAR"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_roamConfigCriteria.isEAP);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("roamConfigIsEAP"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_roamConfigCriteria.environment);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("roamConfigEnv"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_roamConfigCriteria.networkOfInterestType);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("roamConfigNetworkType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_roamConfigCriteria.LOIType);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("roamConfigARLOIType"));

  originRssi = self->_originRssi;
  if (originRssi == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("roamOriginRssi"));
  }
  else
  {
    +[WiFiUsageLQMTransformations getBinRssi:As:](WiFiUsageLQMTransformations, "getBinRssi:As:", originRssi, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("roamOriginRssi"));

  }
  targetRssi = self->_targetRssi;
  if (targetRssi == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("roamTargetRssi"));
  }
  else
  {
    +[WiFiUsageLQMTransformations getBinRssi:As:](WiFiUsageLQMTransformations, "getBinRssi:As:", targetRssi, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("roamTargetRssi"));

  }
  v62.receiver = self;
  v62.super_class = (Class)WiFiUsageLQMWindowAnalysisRoaming;
  -[WiFiUsageLQMWindowAnalysis windowBeforeTrigger](&v62, sel_windowBeforeTrigger);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "samples");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "lastObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:](WiFiUsageLQMTransformations, "numberForKeyPath:ofObject:", CFSTR("driverRoamRecommended"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, CFSTR("roamingRecommended"));

  v61.receiver = self;
  v61.super_class = (Class)WiFiUsageLQMWindowAnalysisRoaming;
  -[WiFiUsageLQMWindowAnalysis windowBeforeTrigger](&v61, sel_windowBeforeTrigger);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "samples");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "lastObject");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:](WiFiUsageLQMTransformations, "numberForKeyPath:ofObject:", CFSTR("driverTDrecommended"), v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, CFSTR("tdRecommended"));

  v60.receiver = self;
  v60.super_class = (Class)WiFiUsageLQMWindowAnalysisRoaming;
  -[WiFiUsageLQMWindowAnalysis windowBeforeTrigger](&v60, sel_windowBeforeTrigger);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "samples");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "lastObject");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:](WiFiUsageLQMTransformations, "numberForKeyPath:ofObject:", CFSTR("chanQualScore"), v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v33, CFSTR("last_chanQualScore_before"));

  +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:](WiFiUsageLQMTransformations, "numberForKeyPath:ofObject:", CFSTR("txLatencyScore"), v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v34, CFSTR("last_txLatencyScore_before"));

  +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:](WiFiUsageLQMTransformations, "numberForKeyPath:ofObject:", CFSTR("rxLatencyScore"), v32);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v35, CFSTR("last_rxLatencyScore_before"));

  +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:](WiFiUsageLQMTransformations, "numberForKeyPath:ofObject:", CFSTR("txLossScore"), v32);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v36, CFSTR("last_txLossScore_before"));

  +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:](WiFiUsageLQMTransformations, "numberForKeyPath:ofObject:", CFSTR("rxLossScore"), v32);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v37, CFSTR("last_rxLossScore_before"));

  +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:](WiFiUsageLQMTransformations, "numberForKeyPath:ofObject:", CFSTR("txLatencyP95"), v32);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (v38)
  {
    +[WiFiUsageLQMSample binLabelfromFieldName:value:](WiFiUsageLQMUserSample, "binLabelfromFieldName:value:", CFSTR("txLatencyP95"), objc_msgSend(v38, "unsignedIntegerValue"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v40, CFSTR("last_txLatencyP95_before"));

  }
  else
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("last_txLatencyP95_before"));
  }
  +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:](WiFiUsageLQMTransformations, "numberForKeyPath:ofObject:", CFSTR("pingPongNth"), self->_pingPongStats);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v41, CFSTR("roamPingPongNth"));

  +[WiFiUsageLQMTransformations getLabelPingPongStats:](WiFiUsageLQMTransformations, "getLabelPingPongStats:", self->_pingPongStats);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v42, CFSTR("roamPingPongSequence"));

  +[WiFiUsagePrivacyFilter getBinEvery10Over100:As:](WiFiUsagePrivacyFilter, "getBinEvery10Over100:As:", self->_roamSuppressionEnabledPerc, 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v43, CFSTR("roamSuppressedEnabledPerc"));

  if (self->_firstRoamAfterRoamRecommLifted)
  {
    +[WiFiUsageLQMTransformations getBinForRoamingLatency:As:](WiFiUsageLQMTransformations, "getBinForRoamingLatency:As:", (unint64_t)(self->_roamSuppressionWaitForRoamStart * 1000.0), 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v44, CFSTR("roamSuppressionWaitForRoamStart"));

    +[WiFiUsageLQMTransformations getBinForRoamingLatency:As:](WiFiUsageLQMTransformations, "getBinForRoamingLatency:As:", (unint64_t)(self->_roamSuppressionWaitForRoamEnd * 1000.0), 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v45, CFSTR("roamSuppressionWaitForRoamEnd"));

  }
  latency = self->_latency;
  if (latency == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("roamingLatencyms"));
  }
  else
  {
    +[WiFiUsageLQMTransformations getBinForRoamingLatency:As:](WiFiUsageLQMTransformations, "getBinForRoamingLatency:As:", latency, 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v47, CFSTR("roamingLatencyms"));

  }
  scanDuration = self->_scanDuration;
  if (scanDuration == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("roamScanDuration"));
  }
  else
  {
    +[WiFiUsageLQMTransformations getBinForRoamingLatency:As:](WiFiUsageLQMTransformations, "getBinForRoamingLatency:As:", scanDuration, 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v49, CFSTR("roamScanDuration"));

  }
  +[WiFiUsageLQMTransformations getBinScannedChannels:As:](WiFiUsageLQMTransformations, "getBinScannedChannels:As:", self->_roamScannedChannelCount, 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v50, CFSTR("roamScannedChannelCountAsString"));

  +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:](WiFiUsageLQMTransformations, "numberForKeyPath:ofObject:", CFSTR("roamFullBandScanCount"), self);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "description");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v52, CFSTR("roamFullBandScanCount"));

  +[WiFiUsageLQMTransformations numberForKeyPath:ofObject:](WiFiUsageLQMTransformations, "numberForKeyPath:ofObject:", CFSTR("roamPartialBandScanCount"), self);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "description");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v54, CFSTR("roamPartialBandScanCount"));

  roamPktsPendingAqm = self->_roamPktsPendingAqm;
  if (roamPktsPendingAqm == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("roamPktsPendingAqm"));
  }
  else
  {
    +[WiFiUsageLQMTransformations getBinFrames:As:](WiFiUsageLQMTransformations, "getBinFrames:As:", roamPktsPendingAqm, 0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v56, CFSTR("roamPktsPendingAqm"));

  }
  roamPktsPendingTxSubQ = self->_roamPktsPendingTxSubQ;
  if (roamPktsPendingTxSubQ == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("roamPktsPendingTxSubQ"));
  }
  else
  {
    +[WiFiUsageLQMTransformations getBinFrames:As:](WiFiUsageLQMTransformations, "getBinFrames:As:", roamPktsPendingTxSubQ, 0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v58, CFSTR("roamPktsPendingTxSubQ"));

  }
  return v4;
}

- (NSString)roamingReason
{
  return self->_roamingReason;
}

- (void)setRoamingReason:(id)a3
{
  objc_storeStrong((id *)&self->_roamingReason, a3);
}

- (NSString)roamingStatus
{
  return self->_roamingStatus;
}

- (void)setRoamingStatus:(id)a3
{
  objc_storeStrong((id *)&self->_roamingStatus, a3);
}

- (int64_t)latency
{
  return self->_latency;
}

- (void)setLatency:(int64_t)a3
{
  self->_latency = a3;
}

- (BOOL)isWNMScoreRoam
{
  return self->_isWNMScoreRoam;
}

- (void)setIsWNMScoreRoam:(BOOL)a3
{
  self->_isWNMScoreRoam = a3;
}

- (BOOL)isColocatedRoam
{
  return self->_isColocatedRoam;
}

- (void)setIsColocatedRoam:(BOOL)a3
{
  self->_isColocatedRoam = a3;
}

- (NSString)roamBssSupports
{
  return self->_roamBssSupports;
}

- (void)setRoamBssSupports:(id)a3
{
  objc_storeStrong((id *)&self->_roamBssSupports, a3);
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

  v3 = *(_OWORD *)self[9].var1;
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[9].var0[1];
  *(_OWORD *)&retstr->var0[2] = v3;
  return self;
}

- (void)setRoamConfigChannels:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0[2];
  *(_OWORD *)self->_roamConfigChannels.valueByBand = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_roamConfigChannels.valueByBand[2] = v3;
}

- ($6E47B81FEB72AA1B248A20B58E3F028F)roamConfigCriteria
{
  __int128 v3;

  v3 = *(_OWORD *)&self[10].var6;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[10].var4;
  *(_OWORD *)&retstr->var5 = v3;
  return self;
}

- (void)setRoamConfigCriteria:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var5;
  *(_OWORD *)&self->_roamConfigCriteria.isAllowed = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_roamConfigCriteria.networkOfInterestType = v3;
}

- (int64_t)originRssi
{
  return self->_originRssi;
}

- (void)setOriginRssi:(int64_t)a3
{
  self->_originRssi = a3;
}

- (int64_t)targetRssi
{
  return self->_targetRssi;
}

- (void)setTargetRssi:(int64_t)a3
{
  self->_targetRssi = a3;
}

- (WiFiUsageSessionPingPongStats)pingPongStats
{
  return self->_pingPongStats;
}

- (void)setPingPongStats:(id)a3
{
  objc_storeStrong((id *)&self->_pingPongStats, a3);
}

- (unint64_t)roamSuppressionEnabledPerc
{
  return self->_roamSuppressionEnabledPerc;
}

- (void)setRoamSuppressionEnabledPerc:(unint64_t)a3
{
  self->_roamSuppressionEnabledPerc = a3;
}

- (BOOL)firstRoamAfterRoamRecommLifted
{
  return self->_firstRoamAfterRoamRecommLifted;
}

- (void)setFirstRoamAfterRoamRecommLifted:(BOOL)a3
{
  self->_firstRoamAfterRoamRecommLifted = a3;
}

- (double)roamSuppressionWaitForRoamStart
{
  return self->_roamSuppressionWaitForRoamStart;
}

- (void)setRoamSuppressionWaitForRoamStart:(double)a3
{
  self->_roamSuppressionWaitForRoamStart = a3;
}

- (double)roamSuppressionWaitForRoamEnd
{
  return self->_roamSuppressionWaitForRoamEnd;
}

- (void)setRoamSuppressionWaitForRoamEnd:(double)a3
{
  self->_roamSuppressionWaitForRoamEnd = a3;
}

- (int64_t)scanDuration
{
  return self->_scanDuration;
}

- (void)setScanDuration:(int64_t)a3
{
  self->_scanDuration = a3;
}

- (unint64_t)roamScannedChannelCount
{
  return self->_roamScannedChannelCount;
}

- (void)setRoamScannedChannelCount:(unint64_t)a3
{
  self->_roamScannedChannelCount = a3;
}

- (unint64_t)roamFullBandScanCount
{
  return self->_roamFullBandScanCount;
}

- (void)setRoamFullBandScanCount:(unint64_t)a3
{
  self->_roamFullBandScanCount = a3;
}

- (unint64_t)roamPartialBandScanCount
{
  return self->_roamPartialBandScanCount;
}

- (void)setRoamPartialBandScanCount:(unint64_t)a3
{
  self->_roamPartialBandScanCount = a3;
}

- (unint64_t)roamPktsPendingAqm
{
  return self->_roamPktsPendingAqm;
}

- (void)setRoamPktsPendingAqm:(unint64_t)a3
{
  self->_roamPktsPendingAqm = a3;
}

- (unint64_t)roamPktsPendingTxSubQ
{
  return self->_roamPktsPendingTxSubQ;
}

- (void)setRoamPktsPendingTxSubQ:(unint64_t)a3
{
  self->_roamPktsPendingTxSubQ = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pingPongStats, 0);
  objc_storeStrong((id *)&self->_roamBssSupports, 0);
  objc_storeStrong((id *)&self->_roamingStatus, 0);
  objc_storeStrong((id *)&self->_roamingReason, 0);
}

@end
