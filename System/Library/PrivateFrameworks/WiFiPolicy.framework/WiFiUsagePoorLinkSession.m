@implementation WiFiUsagePoorLinkSession

- (void)linkQualityDidChange:(id)a3
{
  id v4;
  unint64_t v5;
  int *v6;
  WiFiUsagePoorLinkSession *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int64_t goodLinkRssi;
  __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  __CFString *v17;
  const __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  objc_super v23;
  objc_super v24;

  v4 = a3;
  if (-[WiFiUsageSession isSessionActive](self, "isSessionActive"))
  {
    if (!self->_waitingOnLinkUp && !self->_toBeClosedAfterLQM)
    {
      v5 = objc_msgSend(v4, "perCoreRssiInUse");
      if (v5 <= 2)
      {
        v6 = off_1E881E018[v5];
        *(double *)((char *)&self->super.super.isa + *v6) = *(double *)((char *)&self->super.super.isa + *v6)
                                                          + (double)(unint64_t)objc_msgSend(v4, "duration");
      }
      v24.receiver = self;
      v24.super_class = (Class)WiFiUsagePoorLinkSession;
      -[WiFiUsageSession linkQualityDidChange:](&v24, sel_linkQualityDidChange_, v4);
    }
    if (self->_toBeClosedAfterLQM)
    {
      NSLog(CFSTR("%s: BadLink session ended due to linkUp"), "-[WiFiUsagePoorLinkSession linkQualityDidChange:]");
      -[WiFiUsagePoorLinkSession setRssiAtNextLinkUp:](self, "setRssiAtNextLinkUp:", objc_msgSend(v4, "rssi"));
      if (objc_msgSend(v4, "driverTDrecommended") != 0x7FFFFFFFFFFFFFFFLL)
        -[WiFiUsagePoorLinkSession setTdRecommendAtNextLinkUp:](self, "setTdRecommendAtNextLinkUp:", objc_msgSend(v4, "driverTDrecommended") != 0);
      v7 = self;
      v8 = 1;
LABEL_11:
      -[WiFiUsagePoorLinkSession sessionDidEnd:](v7, "sessionDidEnd:", v8);
      goto LABEL_38;
    }
    if (!self->_waitingOnLinkUp
      && -[WiFiUsagePoorLinkSession isGoodRssi:](self, "isGoodRssi:", objc_msgSend(v4, "rssi"))
      && -[WiFiUsagePoorLinkSession driverDoesNotRecommendTd:](self, "driverDoesNotRecommendTd:", objc_msgSend(v4, "driverTDrecommended")))
    {
      -[WiFiUsagePoorLinkSession lastTdEval_EndedBy](self, "lastTdEval_EndedBy");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {

LABEL_18:
        self->_toBeClosedAfterTdLogicEnd = 0;
        v10 = objc_msgSend(v4, "rssi");
        goodLinkRssi = self->_goodLinkRssi;
        if (goodLinkRssi == 0x7FFFFFFFFFFFFFFFLL)
        {
          v12 = CFSTR("N/A");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_goodLinkRssi);
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        if (objc_msgSend(v4, "driverTDrecommended") == 0x7FFFFFFFFFFFFFFFLL)
        {
          v13 = CFSTR("N/A");
        }
        else
        {
          v14 = objc_msgSend(v4, "driverTDrecommended");
          v13 = CFSTR("YES");
          if (!v14)
            v13 = CFSTR("NO");
        }
        NSLog(CFSTR("%s: BadLink session ended due to rssi (%lddBm) crossing GoodLink Threshold (%@dBm) or tdRecommended(%@)"), "-[WiFiUsagePoorLinkSession linkQualityDidChange:]", v10, v12, v13);
        if (goodLinkRssi != 0x7FFFFFFFFFFFFFFFLL)

        v7 = self;
        v8 = 0;
        goto LABEL_11;
      }
      if (self->_toBeClosedAfterTdLogicEnd)
        goto LABEL_18;
      v15 = objc_msgSend(v4, "rssi");
      v16 = self->_goodLinkRssi;
      if (v16 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v17 = CFSTR("N/A");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_goodLinkRssi);
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      if (objc_msgSend(v4, "driverTDrecommended") == 0x7FFFFFFFFFFFFFFFLL)
      {
        v18 = CFSTR("N/A");
      }
      else
      {
        v19 = objc_msgSend(v4, "driverTDrecommended");
        v18 = CFSTR("YES");
        if (!v19)
          v18 = CFSTR("NO");
      }
      NSLog(CFSTR("%s: BadLink session will end after receiving tdLogic_end from LQMManager due to rssi (%lddBm) crossing GoodLink Threshold (%@dBm) or tdRecommended(%@)"), "-[WiFiUsagePoorLinkSession linkQualityDidChange:]", v15, v17, v18);
      if (v16 != 0x7FFFFFFFFFFFFFFFLL)

      self->_toBeClosedAfterTdLogicEnd = 1;
    }
  }
LABEL_38:
  if (!-[WiFiUsageSession isSessionActive](self, "isSessionActive") || self->_sessionStartedBy == 4)
  {
    if (-[WiFiUsagePoorLinkSession isBadRssi:](self, "isBadRssi:", objc_msgSend(v4, "rssi")))
    {
      v20 = objc_msgSend(v4, "rssi");
      v21 = v20;
      if (self->_badLinkRssi == 0x7FFFFFFFFFFFFFFFLL)
      {
        NSLog(CFSTR("%s: rssi (%lddBm) crossing BadLink Threshold (%@dBm)"), "-[WiFiUsagePoorLinkSession linkQualityDidChange:]", v20, CFSTR("N/A"));
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("%s: rssi (%lddBm) crossing BadLink Threshold (%@dBm)"), "-[WiFiUsagePoorLinkSession linkQualityDidChange:]", v21, v22);

      }
      if (-[WiFiUsageSession isSessionActive](self, "isSessionActive"))
        self->_sessionStartedBy = 1;
      else
        -[WiFiUsagePoorLinkSession sessionDidStart:](self, "sessionDidStart:", 1);
    }
    if (objc_msgSend(v4, "driverTDrecommended") != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v4, "driverTDrecommended"))
    {
      NSLog(CFSTR("%s: BadLink session started due to driver TD Recommendation (%@)"), "-[WiFiUsagePoorLinkSession linkQualityDidChange:]", v4);
      -[WiFiUsagePoorLinkSession sessionDidStart:](self, "sessionDidStart:", 2);
    }
    v23.receiver = self;
    v23.super_class = (Class)WiFiUsagePoorLinkSession;
    -[WiFiUsageSession linkQualityDidChange:](&v23, sel_linkQualityDidChange_, v4);
  }
  if (self->_justJoined)
  {
    -[WiFiUsagePoorLinkSession setRssiAtJoin:](self, "setRssiAtJoin:", objc_msgSend(v4, "rssi"));
    if (objc_msgSend(v4, "driverTDrecommended") != 0x7FFFFFFFFFFFFFFFLL)
      -[WiFiUsagePoorLinkSession setTdRecommendAtJoin:](self, "setTdRecommendAtJoin:", objc_msgSend(v4, "driverTDrecommended") != 0);
    self->_justJoined = 0;
  }
  if (objc_msgSend(v4, "driverTDrecommended") != 0x7FFFFFFFFFFFFFFFLL)
    self->_lastTdRecommended = objc_msgSend(v4, "driverTDrecommended") != 0;

}

- (BOOL)isBadRssi:(int64_t)a3
{
  return self->_badLinkRssi >= a3;
}

- (BOOL)expectsLQMUpdates
{
  return 1;
}

- (BOOL)isGoodRssi:(int64_t)a3
{
  return self->_goodLinkRssi <= a3;
}

- (BOOL)driverDoesNotRecommendTd:(unint64_t)a3
{
  _BOOL4 lastTdRecommended;
  BOOL v4;
  BOOL result;

  lastTdRecommended = self->_lastTdRecommended;
  if (self->_lastTdRecommended || (result = 1, a3) && a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3)
      v4 = 1;
    else
      v4 = !lastTdRecommended;
    return !v4;
  }
  return result;
}

- (void)faultEventDetected:(unint64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WiFiUsagePoorLinkSession;
  -[WiFiUsageSession faultEventDetected:](&v5, sel_faultEventDetected_);
  if (a3 == 1 && !-[WiFiUsageSession isSessionActive](self, "isSessionActive"))
  {
    NSLog(CFSTR("%s: BadLink session started due to LowRssiDNSFailure"), "-[WiFiUsagePoorLinkSession faultEventDetected:]");
    -[WiFiUsagePoorLinkSession sessionDidStart:](self, "sessionDidStart:", 3);
  }
}

- (void)linkStateDidChange:(BOOL)a3 isInvoluntary:(BOOL)a4 linkChangeReason:(int64_t)a5 linkChangeSubreason:(int64_t)a6 withNetworkDetails:(id)a7
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v12;
  _BOOL4 linkIsUp;
  NSDate *v14;
  NSDate *lastLinkDownAt;
  _BOOL4 v16;
  NSObject *endSessionTimer;
  unint64_t perSSID_deferJoin;
  dispatch_time_t v19;
  unint64_t perBSSID_deferJoin;
  BOOL v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  double v27;
  double v28;
  _BOOL8 v29;
  void *v30;
  objc_super v31;

  v9 = a4;
  v10 = a3;
  v12 = a7;
  linkIsUp = self->_linkIsUp;
  v31.receiver = self;
  v31.super_class = (Class)WiFiUsagePoorLinkSession;
  -[WiFiUsageSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:](&v31, sel_linkStateDidChange_isInvoluntary_linkChangeReason_linkChangeSubreason_withNetworkDetails_, v10, v9, a5, a6, v12);
  if (!linkIsUp || v10)
  {
    v22 = linkIsUp || !self->_waitingOnLinkUp || !v10;
    if (v22 || !-[WiFiUsageSession isSessionActive](self, "isSessionActive"))
      goto LABEL_32;
    self->_waitingOnLinkUp = 0;
    objc_msgSend(v12, "connectedBss");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bssid");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isEqualToString:", self->_bssidAtTD);

    if (!v25)
    {
LABEL_31:
      self->_toBeClosedAfterLQM = 1;
      NSLog(CFSTR("%s: BadLink session will end due to linkUp (waiting on LQM update)"), "-[WiFiUsagePoorLinkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:]");
      goto LABEL_32;
    }
    if (self->_lastLinkDownAt)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "timeIntervalSinceDate:", self->_lastLinkDownAt);
      v28 = v27;

      -[WiFiUsagePoorLinkSession setNextLinkUpIsSameBSSID:](self, "setNextLinkUpIsSameBSSID:", 1);
      if (v28 != 9.22337204e18)
      {
        v29 = v28 < (double)self->_perBSSID_deferJoin;
LABEL_30:
        -[WiFiUsagePoorLinkSession setNextJoinWhileDeferJoin:](self, "setNextJoinWhileDeferJoin:", v29);
        goto LABEL_31;
      }
    }
    else
    {
      -[WiFiUsagePoorLinkSession setNextLinkUpIsSameBSSID:](self, "setNextLinkUpIsSameBSSID:", 1);
    }
    v29 = 0;
    goto LABEL_30;
  }
  self->_linkIsUp = 0;
  if (!self->_lastLinkDownAt)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastLinkDownAt = self->_lastLinkDownAt;
    self->_lastLinkDownAt = v14;

  }
  v16 = -[WiFiUsageSession isSessionActive](self, "isSessionActive");
  if (a5 == 1000)
  {
    if (!v16 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[WiFiUsagePoorLinkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:].cold.1((uint64_t)self);
    self->_waitingOnLinkUp = 1;
    endSessionTimer = self->_endSessionTimer;
    perSSID_deferJoin = self->_perSSID_deferJoin;
    if (perSSID_deferJoin <= self->_perBSSID_deferJoin)
      perSSID_deferJoin = self->_perBSSID_deferJoin;
    v19 = dispatch_time(0, 1000000000 * perSSID_deferJoin + 30000000000);
    dispatch_source_set_timer(endSessionTimer, v19, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_activate((dispatch_object_t)self->_endSessionTimer);
    perBSSID_deferJoin = self->_perSSID_deferJoin;
    if (perBSSID_deferJoin <= self->_perBSSID_deferJoin)
      perBSSID_deferJoin = self->_perBSSID_deferJoin;
    NSLog(CFSTR("%s: Link went down, waiting on linkUp for up to %ds"), "-[WiFiUsagePoorLinkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:]", (perBSSID_deferJoin + 30));
  }
  else if (v16)
  {
    +[WiFiUsageSession disconnectReasonString:](WiFiUsageSession, "disconnectReasonString:", a5);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s: Link went down due to %@, ending session"), "-[WiFiUsagePoorLinkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:]", v30);

    -[WiFiUsagePoorLinkSession sessionDidEnd:](self, "sessionDidEnd:", 3);
  }
LABEL_32:
  self->_linkIsUp = v10;

}

- (void)joinStateDidChange:(id)a3 withReason:(unint64_t)a4 lastDisconnectReason:(int64_t)a5 lastJoinFailure:(int64_t)a6 andNetworkDetails:(id)a7
{
  id v12;
  void *v13;
  void *v14;
  double timeToNextJoin;
  _BOOL8 v16;
  NSDate *v17;
  NSDate *lastJoinAt;
  objc_super v19;

  v12 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WiFiUsagePoorLinkSession;
  -[WiFiUsageSession joinStateDidChange:withReason:lastDisconnectReason:lastJoinFailure:andNetworkDetails:](&v19, sel_joinStateDidChange_withReason_lastDisconnectReason_lastJoinFailure_andNetworkDetails_, v12, a4, a5, a6, a7);
  if (v12)
  {
    if (-[WiFiUsageSession isSessionActive](self, "isSessionActive") && self->_tdExecuted)
    {
      if (self->_lastLinkDownAt)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", self->_lastLinkDownAt);
        -[WiFiUsagePoorLinkSession setTimeToNextJoin:](self, "setTimeToNextJoin:");

      }
      +[WiFiUsageSession joinReasonString:](WiFiUsageSession, "joinReasonString:", a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsagePoorLinkSession setNextJoinReason:](self, "setNextJoinReason:", v14);

      if (objc_msgSend(v12, "isEqualToString:", self->_ssidAtTD))
      {
        -[WiFiUsagePoorLinkSession setNextJoinIsSameSSID:](self, "setNextJoinIsSameSSID:", 1);
        timeToNextJoin = self->_timeToNextJoin;
        v16 = timeToNextJoin != 9.22337204e18 && timeToNextJoin < (double)self->_perSSID_deferJoin;
        -[WiFiUsagePoorLinkSession setNextJoinWhileDeferJoin:](self, "setNextJoinWhileDeferJoin:", v16);
      }
    }
    if (!-[WiFiUsageSession isSessionActive](self, "isSessionActive"))
    {
      self->_justJoined = 1;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v17 = (NSDate *)objc_claimAutoreleasedReturnValue();
      lastJoinAt = self->_lastJoinAt;
      self->_lastJoinAt = v17;

    }
  }

}

- (void)roamingStateDidChange:(BOOL)a3 reason:(unint64_t)a4 andStatus:(unint64_t)a5 andLatency:(unint64_t)a6 andRoamData:(id)a7 andPingPongStats:(id)a8
{
  int *v8;
  int *v9;
  int *v10;
  objc_super v11;

  if (!a3)
  {
    if (self->_tdConfirmed)
    {
      switch(a5)
      {
        case 0uLL:
          v10 = &OBJC_IVAR___WiFiUsagePoorLinkSession__roamStatus_Succeeded_Count_WhileTDWait;
LABEL_19:
          ++*(Class *)((char *)&self->super.super.isa + *v10);
          goto LABEL_20;
        case 0xE0820403uLL:
          v8 = &OBJC_IVAR___WiFiUsagePoorLinkSession__roamStatus_FailedNotFound_Count_WhileTDWait;
          break;
        case 0xE082044BuLL:
          v8 = &OBJC_IVAR___WiFiUsagePoorLinkSession__roamStatus_FailedFilteredOut_Count_WhileTDWait;
          break;
        default:
LABEL_14:
          v10 = &OBJC_IVAR___WiFiUsagePoorLinkSession__roamStatus_Failed_Count_WhileTDWait;
          goto LABEL_19;
      }
      ++*(Class *)((char *)&self->super.super.isa + *v8);
      goto LABEL_14;
    }
    switch(a5)
    {
      case 0uLL:
        v10 = &OBJC_IVAR___WiFiUsagePoorLinkSession__roamStatus_Succeeded_Count_BeforeTDWait;
        goto LABEL_19;
      case 0xE0820403uLL:
        v9 = &OBJC_IVAR___WiFiUsagePoorLinkSession__roamStatus_FailedNotFound_Count_BeforeTDWait;
        break;
      case 0xE082044BuLL:
        v9 = &OBJC_IVAR___WiFiUsagePoorLinkSession__roamStatus_FailedFilteredOut_Count_BeforeTDWait;
        break;
      default:
LABEL_18:
        v10 = &OBJC_IVAR___WiFiUsagePoorLinkSession__roamStatus_Failed_Count_BeforeTDWait;
        goto LABEL_19;
    }
    ++*(Class *)((char *)&self->super.super.isa + *v9);
    goto LABEL_18;
  }
LABEL_20:
  v11.receiver = self;
  v11.super_class = (Class)WiFiUsagePoorLinkSession;
  -[WiFiUsageSession roamingStateDidChange:reason:andStatus:andLatency:andRoamData:andPingPongStats:](&v11, sel_roamingStateDidChange_reason_andStatus_andLatency_andRoamData_andPingPongStats_);
}

- (void)triggerDisconnectAlerted:(BOOL)a3 confirmed:(BOOL)a4 executed:(BOOL)a5
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  void *v9;
  NSString *lastTdEval_EndedBy;
  const __CFString *v11;
  void *v12;
  void *v13;
  NSString *v14;
  NSString *bssidAtTD;
  void *v16;
  NSString *v17;
  NSString *ssidAtTD;
  const __CFString *v19;
  const __CFString *v20;
  objc_super v21;

  if (!self->_waitingOnLinkUp && !self->_toBeClosedAfterLQM)
  {
    v6 = a5;
    v7 = a4;
    v8 = a3;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (!self->_alerted || self->_lastTdEval_EndedBy))
    {
      if (!-[WiFiUsageSession isSessionActive](self, "isSessionActive"))
        -[WiFiUsagePoorLinkSession sessionDidStart:](self, "sessionDidStart:", 4);
      self->_alerted = 1;
      self->_tdConfirmed = 0;
      self->_tdExecuted = 0;
      lastTdEval_EndedBy = self->_lastTdEval_EndedBy;
      self->_lastTdEval_EndedBy = 0;

      -[WiFiUsagePoorLinkSession setLastTDEval_AlertedAt:](self, "setLastTDEval_AlertedAt:", v9);
    }
    if (v7 && !self->_tdConfirmed)
    {
      -[WiFiUsagePoorLinkSession setTdConfirmed:](self, "setTdConfirmed:", 1);
      -[WiFiUsagePoorLinkSession setLastTDEval_ConfirmedAt:](self, "setLastTDEval_ConfirmedAt:", v9);
    }
    v11 = &stru_1E881F240;
    if (v6)
    {
      if (!self->_tdExecuted)
      {
        self->_tdExecuted = 1;
        -[WiFiUsagePoorLinkSession setLastTDEval_ExecutedAt:](self, "setLastTDEval_ExecutedAt:", v9);
        -[WiFiUsageSession networkDetails](self, "networkDetails");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "connectedBss");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "bssid");
        v14 = (NSString *)objc_claimAutoreleasedReturnValue();
        bssidAtTD = self->_bssidAtTD;
        self->_bssidAtTD = v14;

        -[WiFiUsageSession networkDetails](self, "networkDetails");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "networkName");
        v17 = (NSString *)objc_claimAutoreleasedReturnValue();
        ssidAtTD = self->_ssidAtTD;
        self->_ssidAtTD = v17;

      }
      v11 = CFSTR("Executed");
    }
    v19 = CFSTR("Alerted");
    if (!v8)
      v19 = &stru_1E881F240;
    v20 = CFSTR("Confirmed");
    if (!v7)
      v20 = &stru_1E881F240;
    NSLog(CFSTR("%s - %@ %@ %@"), "-[WiFiUsagePoorLinkSession triggerDisconnectAlerted:confirmed:executed:]", v19, v20, v11);
    v21.receiver = self;
    v21.super_class = (Class)WiFiUsagePoorLinkSession;
    -[WiFiUsageSession triggerDisconnectAlerted:confirmed:executed:](&v21, sel_triggerDisconnectAlerted_confirmed_executed_, v8, v7, v6);

  }
}

- (void)tdLogic_alertedBy:(int)a3
{
  uint64_t v3;
  void *v5;
  objc_super v6;

  v3 = *(_QWORD *)&a3;
  if (!self->_lastTdEval_StartedBy || self->_lastTdEval_EndedBy)
  {
    +[WiFiUsagePrivacyFilter getLabelForTDTrigger:](WiFiUsagePrivacyFilter, "getLabelForTDTrigger:", *(_QWORD *)&a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiUsagePoorLinkSession setLastTdEval_StartedBy:](self, "setLastTdEval_StartedBy:", v5);

  }
  v6.receiver = self;
  v6.super_class = (Class)WiFiUsagePoorLinkSession;
  -[WiFiUsageSession tdLogic_alertedBy:](&v6, sel_tdLogic_alertedBy_, v3);
}

- (void)tdLogic_decisionState:(id *)a3
{
  NSDate *v5;
  NSDate *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSDate *lastDecisionAt;
  __int128 v16;
  _OWORD v17[2];

  ++a3->var8;
  if (!self->_waitingOnLinkUp && !self->_toBeClosedAfterLQM)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (self->_lastDecisionAt)
    {
      -[NSDate timeIntervalSinceDate:](v5, "timeIntervalSinceDate:");
      if (self->_last_DecisionState.decision_TxPER)
        v8 = v7;
      else
        v8 = 0.0;
      self->_decision_TxPER_Duration = self->_decision_TxPER_Duration + v8;
      if (self->_last_DecisionState.decision_FWTxPER)
        v9 = v7;
      else
        v9 = 0.0;
      self->_decision_FWTxPER_Duration = self->_decision_FWTxPER_Duration + v9;
      if (self->_last_DecisionState.decision_BeaconPER)
        v10 = v7;
      else
        v10 = 0.0;
      self->_decision_BeaconPER_Duration = self->_decision_BeaconPER_Duration + v10;
      if (self->_last_DecisionState.decision_GatewayARPFailure)
        v11 = v7;
      else
        v11 = 0.0;
      self->_decision_GatewayARPFailure_Duration = self->_decision_GatewayARPFailure_Duration + v11;
      if (self->_last_DecisionState.decision_SymptomsDNSError)
        v12 = v7;
      else
        v12 = 0.0;
      self->_decision_SymptomsDNSError_Duration = self->_decision_SymptomsDNSError_Duration + v12;
      if (self->_last_DecisionState.decision_AutoLeave)
        v13 = v7;
      else
        v13 = 0.0;
      self->_decision_AutoLeave_Duration = self->_decision_AutoLeave_Duration + v13;
      if (self->_last_DecisionState.decision_ActiveProbe)
        v14 = v7;
      else
        v14 = 0.0;
      self->_decision_ActiveProbe_Duration = self->_decision_ActiveProbe_Duration + v14;
      if (!self->_last_DecisionState.decision_FastTD)
        v7 = 0.0;
      self->_decision_FastTD_Duration = self->_decision_FastTD_Duration + v7;
    }
    lastDecisionAt = self->_lastDecisionAt;
    self->_lastDecisionAt = v6;

    v16 = *(_OWORD *)&a3->var13;
    v17[0] = *(_OWORD *)&a3->var0;
    v17[1] = v16;
    -[WiFiUsagePoorLinkSession setLast_DecisionState:](self, "setLast_DecisionState:", v17);
    -[WiFiUsagePoorLinkSession setIsLastDecisionStateValid:](self, "setIsLastDecisionStateValid:", 1);
  }
}

- (void)tdLogic_end:(int)a3 evalTime:(double)a4 rssi:(int64_t)a5 roamTime:(double)a6
{
  uint64_t v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v9 = *(_QWORD *)&a3;
  +[WiFiUsagePrivacyFilter getLabelForTDTrigger:](WiFiUsagePrivacyFilter, "getLabelForTDTrigger:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[WiFiUsagePrivacyFilter getLabelForTDTrigger:](WiFiUsagePrivacyFilter, "getLabelForTDTrigger:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%s: TDEval ended upon %@ (evalTime:%@s, rssi:%@, roamTime:%.2fs)"), "-[WiFiUsagePoorLinkSession tdLogic_end:evalTime:rssi:roamTime:]", v12, v13, v14, *(_QWORD *)&a6);

  -[WiFiUsagePoorLinkSession setLastTdEval_EndedBy:](self, "setLastTdEval_EndedBy:", v11);
  -[WiFiUsagePoorLinkSession setLastTDEval_TDEvalDuration:](self, "setLastTDEval_TDEvalDuration:", a4);
  -[WiFiUsagePoorLinkSession setLastTDEval_rssiAtTD:](self, "setLastTDEval_rssiAtTD:", a5);
  v15.receiver = self;
  v15.super_class = (Class)WiFiUsagePoorLinkSession;
  -[WiFiUsageSession tdLogic_end:evalTime:rssi:roamTime:](&v15, sel_tdLogic_end_evalTime_rssi_roamTime_, v9, a5, a4, a6);
  self->_lastTDEval_waitOnRoamStatusDuration = a6;
  self->_waitOnRoamStatusDurationCumulative = (unint64_t)((double)self->_waitOnRoamStatusDurationCumulative + a6);
  if (self->_toBeClosedAfterTdLogicEnd)
    -[WiFiUsagePoorLinkSession sessionDidEnd:](self, "sessionDidEnd:", 0);

}

- (void)tdLogic_execState:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  NSDate *v6;
  NSDate *v7;
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
  NSDate *lastSuppressAt;

  v3 = *(_QWORD *)&a3.var8;
  v4 = *(_QWORD *)&a3.var0;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (self->_lastSuppressAt)
  {
    -[NSDate timeIntervalSinceDate:](v6, "timeIntervalSinceDate:");
    if (self->_last_SuppressState.suppress_SymptomDataStallScoreGood)
      v9 = v8;
    else
      v9 = 0.0;
    self->_suppress_SymptomsNODataStall_Duration = self->_suppress_SymptomsNODataStall_Duration + v9;
    if (self->_last_SuppressState.suppress_SymptomAppPolicyScore)
      v10 = v8;
    else
      v10 = 0.0;
    self->_suppress_SymptomsAppPolicy_Duration = self->_suppress_SymptomsAppPolicy_Duration + v10;
    if (self->_last_SuppressState.suppress_FastCheapCellular)
      v11 = v8;
    else
      v11 = 0.0;
    self->_suppress_FastCheapCellular_Duration = self->_suppress_FastCheapCellular_Duration + v11;
    if (self->_last_SuppressState.suppress_2dBGuard)
      v12 = v8;
    else
      v12 = 0.0;
    self->_suppress_2dBGuard = self->_suppress_2dBGuard + v12;
    if (self->_last_SuppressState.suppress_NoFGnetwApp)
      v13 = v8;
    else
      v13 = 0.0;
    self->_suppress_NoFgNetwApp_Duration = self->_suppress_NoFgNetwApp_Duration + v13;
    if (self->_last_SuppressState.suppress_TTR)
      v14 = v8;
    else
      v14 = 0.0;
    self->_suppress_TTR_Duration = self->_suppress_TTR_Duration + v14;
    if (self->_last_SuppressState.suppress_UserInput)
      v15 = v8;
    else
      v15 = 0.0;
    self->_suppress_UserInput_Duration = self->_suppress_UserInput_Duration + v15;
    if (self->_last_SuppressState.suppress_GoodAfterRoam)
      v16 = v8;
    else
      v16 = 0.0;
    self->_suppress_GoodAfterRoam_Duration = self->_suppress_GoodAfterRoam_Duration + v16;
    if (self->_last_SuppressState.defer_roaming)
      v17 = v8;
    else
      v17 = 0.0;
    self->_suppress_Roam_Duration = self->_suppress_Roam_Duration + v17;
    if (!self->_last_SuppressState.defer_activeProbing)
      v8 = 0.0;
    self->_suppress_ActiveProbing = self->_suppress_ActiveProbing + v8;
  }
  lastSuppressAt = self->_lastSuppressAt;
  self->_lastSuppressAt = v7;

  -[WiFiUsagePoorLinkSession setLast_SuppressState:](self, "setLast_SuppressState:", v4, v3 & 0xFFFFFFFFFFLL);
  -[WiFiUsagePoorLinkSession setIsLastSuppressStateValid:](self, "setIsLastSuppressStateValid:", 1);
}

- (void)tdLogic_fastTdState:(id)a3
{
  uint64_t v3;
  unint64_t var0;
  NSDate *v6;
  NSDate *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSDate *lastFastTDVotesAt;

  v3 = *(_QWORD *)&a3.var1;
  var0 = a3.var0;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (self->_lastFastTDVotesAt)
  {
    -[NSDate timeIntervalSinceDate:](v6, "timeIntervalSinceDate:");
    if (self->_last_FastTdVotes.fastTD_vote_recommendation)
      v9 = v8;
    else
      v9 = 0.0;
    self->_vote_FastTD_Recommendation_Duration = self->_vote_FastTD_Recommendation_Duration + v9;
    if (self->_last_FastTdVotes.fastTD_vote_TxPER)
      v10 = v8;
    else
      v10 = 0.0;
    self->_vote_FastTD_TXPER_Duration = self->_vote_FastTD_TXPER_Duration + v10;
    if (self->_last_FastTdVotes.fastTD_vote_FWTxPER)
      v11 = v8;
    else
      v11 = 0.0;
    self->_vote_FastTD_FWTxPER_Duration = self->_vote_FastTD_FWTxPER_Duration + v11;
    if (!self->_last_FastTdVotes.fastTD_vote_BeaconPER)
      v8 = 0.0;
    self->_vote_FastTD_BeaconPER_Duration = self->_vote_FastTD_BeaconPER_Duration + v8;
  }
  lastFastTDVotesAt = self->_lastFastTDVotesAt;
  self->_lastFastTDVotesAt = v7;

  -[WiFiUsagePoorLinkSession setLast_FastTdVotes:](self, "setLast_FastTdVotes:", var0, v3);
  -[WiFiUsagePoorLinkSession setIsLastFastTdVotesValid:](self, "setIsLastFastTdVotesValid:", 1);
}

- (void)summarizeSession
{
  NSDate *lastTDEval_ExecutedAt;
  double v4;
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

  lastTDEval_ExecutedAt = self->_lastTDEval_ExecutedAt;
  if (lastTDEval_ExecutedAt)
  {
    -[NSDate timeIntervalSinceDate:](lastTDEval_ExecutedAt, "timeIntervalSinceDate:", self->_lastDecisionAt);
    if (self->_last_DecisionState.decision_TxPER)
      v5 = v4;
    else
      v5 = 0.0;
    self->_decision_TxPER_Duration = self->_decision_TxPER_Duration + v5;
    if (self->_last_DecisionState.decision_FWTxPER)
      v6 = v4;
    else
      v6 = 0.0;
    self->_decision_FWTxPER_Duration = self->_decision_FWTxPER_Duration + v6;
    if (self->_last_DecisionState.decision_BeaconPER)
      v7 = v4;
    else
      v7 = 0.0;
    self->_decision_BeaconPER_Duration = self->_decision_BeaconPER_Duration + v7;
    if (self->_last_DecisionState.decision_GatewayARPFailure)
      v8 = v4;
    else
      v8 = 0.0;
    self->_decision_GatewayARPFailure_Duration = self->_decision_GatewayARPFailure_Duration + v8;
    if (self->_last_DecisionState.decision_SymptomsDNSError)
      v9 = v4;
    else
      v9 = 0.0;
    self->_decision_SymptomsDNSError_Duration = self->_decision_SymptomsDNSError_Duration + v9;
    if (self->_last_DecisionState.decision_AutoLeave)
      v10 = v4;
    else
      v10 = 0.0;
    self->_decision_AutoLeave_Duration = self->_decision_AutoLeave_Duration + v10;
    if (self->_last_DecisionState.decision_ActiveProbe)
      v11 = v4;
    else
      v11 = 0.0;
    self->_decision_ActiveProbe_Duration = self->_decision_ActiveProbe_Duration + v11;
    if (!self->_last_DecisionState.decision_FastTD)
      v4 = 0.0;
    self->_decision_FastTD_Duration = self->_decision_FastTD_Duration + v4;
    -[NSDate timeIntervalSinceDate:](self->_lastTDEval_ExecutedAt, "timeIntervalSinceDate:", self->_lastFastTDVotesAt);
    if (self->_last_FastTdVotes.fastTD_vote_recommendation)
      v13 = v12;
    else
      v13 = 0.0;
    self->_vote_FastTD_Recommendation_Duration = self->_vote_FastTD_Recommendation_Duration + v13;
    if (self->_last_FastTdVotes.fastTD_vote_TxPER)
      v14 = v12;
    else
      v14 = 0.0;
    self->_vote_FastTD_TXPER_Duration = self->_vote_FastTD_TXPER_Duration + v14;
    if (self->_last_FastTdVotes.fastTD_vote_FWTxPER)
      v15 = v12;
    else
      v15 = 0.0;
    self->_vote_FastTD_FWTxPER_Duration = self->_vote_FastTD_FWTxPER_Duration + v15;
    if (!self->_last_FastTdVotes.fastTD_vote_BeaconPER)
      v12 = 0.0;
    self->_vote_FastTD_BeaconPER_Duration = self->_vote_FastTD_BeaconPER_Duration + v12;
    -[NSDate timeIntervalSinceDate:](self->_lastTDEval_ExecutedAt, "timeIntervalSinceDate:", self->_lastSuppressAt);
    if (self->_last_SuppressState.suppress_SymptomDataStallScoreGood)
      v17 = v16;
    else
      v17 = 0.0;
    self->_suppress_SymptomsNODataStall_Duration = self->_suppress_SymptomsNODataStall_Duration + v17;
    if (self->_last_SuppressState.suppress_SymptomAppPolicyScore)
      v18 = v16;
    else
      v18 = 0.0;
    self->_suppress_SymptomsAppPolicy_Duration = self->_suppress_SymptomsAppPolicy_Duration + v18;
    if (self->_last_SuppressState.suppress_FastCheapCellular)
      v19 = v16;
    else
      v19 = 0.0;
    self->_suppress_FastCheapCellular_Duration = self->_suppress_FastCheapCellular_Duration + v19;
    if (self->_last_SuppressState.suppress_2dBGuard)
      v20 = v16;
    else
      v20 = 0.0;
    self->_suppress_2dBGuard = self->_suppress_2dBGuard + v20;
    if (self->_last_SuppressState.suppress_NoFGnetwApp)
      v21 = v16;
    else
      v21 = 0.0;
    self->_suppress_NoFgNetwApp_Duration = self->_suppress_NoFgNetwApp_Duration + v21;
    if (self->_last_SuppressState.suppress_TTR)
      v22 = v16;
    else
      v22 = 0.0;
    self->_suppress_TTR_Duration = self->_suppress_TTR_Duration + v22;
    if (self->_last_SuppressState.suppress_UserInput)
      v23 = v16;
    else
      v23 = 0.0;
    self->_suppress_UserInput_Duration = self->_suppress_UserInput_Duration + v23;
    if (self->_last_SuppressState.suppress_GoodAfterRoam)
      v24 = v16;
    else
      v24 = 0.0;
    self->_suppress_GoodAfterRoam_Duration = self->_suppress_GoodAfterRoam_Duration + v24;
    if (self->_last_SuppressState.defer_roaming)
      v25 = v16;
    else
      v25 = 0.0;
    self->_suppress_Roam_Duration = self->_suppress_Roam_Duration + v25;
    if (!self->_last_SuppressState.defer_activeProbing)
      v16 = 0.0;
    self->_suppress_ActiveProbing = self->_suppress_ActiveProbing + v16;
  }
}

- (void)sessionDidEnd:(int)a3
{
  uint64_t v3;
  void *v5;
  objc_super v6;

  v3 = *(_QWORD *)&a3;
  +[WiFiUsagePoorLinkSession sessionEndedBy:](WiFiUsagePoorLinkSession, "sessionEndedBy:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%s (%@): %@"), "-[WiFiUsagePoorLinkSession sessionDidEnd:]", self, v5);

  -[WiFiUsagePoorLinkSession setSessionEndedBy:](self, "setSessionEndedBy:", v3);
  v6.receiver = self;
  v6.super_class = (Class)WiFiUsagePoorLinkSession;
  -[WiFiUsageSession sessionDidEnd](&v6, sel_sessionDidEnd);
}

- (void)sessionDidStart:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  NSString *bssidAtTD;
  NSString *ssidAtTD;
  NSDate *lastDecisionAt;
  NSDate *lastFastTDVotesAt;
  NSDate *lastSuppressAt;
  NSDate *lastLinkDownAt;
  objc_super v13;

  v3 = *(_QWORD *)&a3;
  +[WiFiUsagePoorLinkSession sessionStartedBy:](WiFiUsagePoorLinkSession, "sessionStartedBy:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%s: %@"), "-[WiFiUsagePoorLinkSession sessionDidStart:]", v5);

  v13.receiver = self;
  v13.super_class = (Class)WiFiUsagePoorLinkSession;
  -[WiFiUsageSession sessionDidStart](&v13, sel_sessionDidStart);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsagePoorLinkSession setSessionStartedBy:](self, "setSessionStartedBy:", v3);
  if (self->_lastJoinAt)
  {
    objc_msgSend(v6, "timeIntervalSinceDate:");
    -[WiFiUsagePoorLinkSession setTimeSinceJoinATStart:](self, "setTimeSinceJoinATStart:");
  }
  self->_perSSID_deferJoin = 0x7FFFFFFFFFFFFFFFLL;
  self->_perBSSID_deferJoin = 0x7FFFFFFFFFFFFFFFLL;
  self->_lastTdRecommended = 0;
  self->_alerted = 0;
  self->_tdExecuted = 0;
  self->_tdConfirmed = 0;
  self->_toBeClosedAfterLQM = 0;
  self->_toBeClosedAfterTdLogicEnd = 0;
  bssidAtTD = self->_bssidAtTD;
  self->_bssidAtTD = 0;

  ssidAtTD = self->_ssidAtTD;
  self->_ssidAtTD = 0;

  self->_waitingOnLinkUp = 0;
  lastDecisionAt = self->_lastDecisionAt;
  self->_lastDecisionAt = 0;

  lastFastTDVotesAt = self->_lastFastTDVotesAt;
  self->_lastFastTDVotesAt = 0;

  lastSuppressAt = self->_lastSuppressAt;
  self->_lastSuppressAt = 0;

  lastLinkDownAt = self->_lastLinkDownAt;
  self->_lastLinkDownAt = 0;

  *(_OWORD *)&self->_last_DecisionState.decision_TxPER = 0u;
  *(_OWORD *)&self->_last_DecisionState.appsUsingWiFi = 0u;
  *(_QWORD *)&self->_last_SuppressState.aggressiveTDEnabled = 0;
  *(_QWORD *)&self->_last_SuppressState.suppress_FastCheapCellular = 0;
  self->_last_FastTdVotes.fastTD_voteCount = 0;
  *(_QWORD *)&self->_last_FastTdVotes.fastTD_vote_recommendation = 0;
  self->_isLastDecisionStateValid = 0;
  self->_isLastSuppressStateValid = 0;
  self->_isLastFastTdVotesValid = 0;
  -[WiFiUsagePoorLinkSession setLast_RSSIMode:](self, "setLast_RSSIMode:", 0);
  -[WiFiUsagePoorLinkSession setLastTDEval_ConfirmedAt:](self, "setLastTDEval_ConfirmedAt:", 0);
  -[WiFiUsagePoorLinkSession setLastTDEval_ExecutedAt:](self, "setLastTDEval_ExecutedAt:", 0);
  -[WiFiUsagePoorLinkSession setLastTdEval_StartedBy:](self, "setLastTdEval_StartedBy:", 0);
  -[WiFiUsagePoorLinkSession setLastTdEval_EndedBy:](self, "setLastTdEval_EndedBy:", 0);
  -[WiFiUsagePoorLinkSession setLastTDEval_TDEvalDuration:](self, "setLastTDEval_TDEvalDuration:", 0.0);
  -[WiFiUsagePoorLinkSession setLastTDEval_rssiAtTD:](self, "setLastTDEval_rssiAtTD:", 0x7FFFFFFFFFFFFFFFLL);
  -[WiFiUsagePoorLinkSession setLastTDEval_waitOnRoamStatusDuration:](self, "setLastTDEval_waitOnRoamStatusDuration:", 9.22337204e18);
  -[WiFiUsagePoorLinkSession setTdEvalDurationCumulative:](self, "setTdEvalDurationCumulative:", 0.0);
  -[WiFiUsagePoorLinkSession setWaitOnRoamStatusDurationCumulative:](self, "setWaitOnRoamStatusDurationCumulative:", 0);
  -[WiFiUsagePoorLinkSession setNextJoinReason:](self, "setNextJoinReason:", 0);
  -[WiFiUsagePoorLinkSession setNextJoinIsSameSSID:](self, "setNextJoinIsSameSSID:", 0);
  -[WiFiUsagePoorLinkSession setNextJoinWhileDeferJoin:](self, "setNextJoinWhileDeferJoin:", 0);
  -[WiFiUsagePoorLinkSession setTimeToNextJoin:](self, "setTimeToNextJoin:", 9.22337204e18);
  -[WiFiUsagePoorLinkSession setNextLinkUpIsSameBSSID:](self, "setNextLinkUpIsSameBSSID:", 0);
  -[WiFiUsagePoorLinkSession setRssiAtNextLinkUp:](self, "setRssiAtNextLinkUp:", 0x7FFFFFFFFFFFFFFFLL);
  -[WiFiUsagePoorLinkSession setTdRecommendAtNextLinkUp:](self, "setTdRecommendAtNextLinkUp:", 0);
  objc_msgSend(v6, "timeIntervalSinceDate:", self->_lastJoinAt);
  -[WiFiUsagePoorLinkSession setTimeSinceJoinATStart:](self, "setTimeSinceJoinATStart:");
  -[WiFiUsagePoorLinkSession setDecision_TxPER_Duration:](self, "setDecision_TxPER_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setDecision_FWTxPER_Duration:](self, "setDecision_FWTxPER_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setDecision_BeaconPER_Duration:](self, "setDecision_BeaconPER_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setDecision_GatewayARPFailure_Duration:](self, "setDecision_GatewayARPFailure_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setDecision_SymptomsDNSError_Duration:](self, "setDecision_SymptomsDNSError_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setDecision_AutoLeave_Duration:](self, "setDecision_AutoLeave_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setDecision_ActiveProbe_Duration:](self, "setDecision_ActiveProbe_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setDecision_FastTD_Duration:](self, "setDecision_FastTD_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setVote_FastTD_TXPER_Duration:](self, "setVote_FastTD_TXPER_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setVote_FastTD_BeaconPER_Duration:](self, "setVote_FastTD_BeaconPER_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setVote_FastTD_FWTxPER_Duration:](self, "setVote_FastTD_FWTxPER_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setVote_FastTD_Recommendation_Duration:](self, "setVote_FastTD_Recommendation_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setSuppress_SymptomsNODataStall_Duration:](self, "setSuppress_SymptomsNODataStall_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setSuppress_SymptomsAppPolicy_Duration:](self, "setSuppress_SymptomsAppPolicy_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setSuppress_FastCheapCellular_Duration:](self, "setSuppress_FastCheapCellular_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setSuppress_2dBGuard:](self, "setSuppress_2dBGuard:", 0.0);
  -[WiFiUsagePoorLinkSession setSuppress_NoFgNetwApp_Duration:](self, "setSuppress_NoFgNetwApp_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setSuppress_TTR_Duration:](self, "setSuppress_TTR_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setSuppress_UserInput_Duration:](self, "setSuppress_UserInput_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setSuppress_GoodAfterRoam_Duration:](self, "setSuppress_GoodAfterRoam_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setSuppress_Roam_Duration:](self, "setSuppress_Roam_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setSuppress_ActiveProbing:](self, "setSuppress_ActiveProbing:", 0.0);
  -[WiFiUsagePoorLinkSession setPerCoreRSSI_NotUsed_Duration:](self, "setPerCoreRSSI_NotUsed_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setPerCoreRSSI_Core0_Duration:](self, "setPerCoreRSSI_Core0_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setPerCoreRSSI_Core1_Duration:](self, "setPerCoreRSSI_Core1_Duration:", 0.0);
  -[WiFiUsagePoorLinkSession setRoamStatus_Succeeded_Count_WhileTDWait:](self, "setRoamStatus_Succeeded_Count_WhileTDWait:", 0);
  -[WiFiUsagePoorLinkSession setRoamStatus_Failed_Count_WhileTDWait:](self, "setRoamStatus_Failed_Count_WhileTDWait:", 0);
  -[WiFiUsagePoorLinkSession setRoamStatus_FailedFilteredOut_Count_WhileTDWait:](self, "setRoamStatus_FailedFilteredOut_Count_WhileTDWait:", 0);
  -[WiFiUsagePoorLinkSession setRoamStatus_FailedNotFound_Count_WhileTDWait:](self, "setRoamStatus_FailedNotFound_Count_WhileTDWait:", 0);
  -[WiFiUsagePoorLinkSession setRoamStatus_Succeeded_Count_BeforeTDWait:](self, "setRoamStatus_Succeeded_Count_BeforeTDWait:", 0);
  -[WiFiUsagePoorLinkSession setRoamStatus_Failed_Count_BeforeTDWait:](self, "setRoamStatus_Failed_Count_BeforeTDWait:", 0);
  -[WiFiUsagePoorLinkSession setRoamStatus_FailedFilteredOut_Count_BeforeTDWait:](self, "setRoamStatus_FailedFilteredOut_Count_BeforeTDWait:", 0);
  -[WiFiUsagePoorLinkSession setRoamStatus_FailedNotFound_Count_BeforeTDWait:](self, "setRoamStatus_FailedNotFound_Count_BeforeTDWait:", 0);

}

- (id)eventDictionary:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  NSDate *lastJoinAt;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
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
  void *v47;
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
  char v66;
  void *v67;
  void *v68;
  unint64_t v69;
  void *v70;
  void *v71;
  unint64_t v72;
  void *v73;
  void *v74;
  unint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  unint64_t v79;
  void *v80;
  void *v81;
  unint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  double v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  char v95;
  void *v96;
  void *v97;
  unint64_t v98;
  void *v99;
  void *v100;
  unint64_t v101;
  void *v102;
  void *v103;
  unint64_t v104;
  void *v105;
  void *v106;
  unint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  NSDate *lastTDEval_ExecutedAt;
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
  double v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  double v133;
  void *v134;
  NSDate *v135;
  uint64_t v136;
  void *v137;
  void *v138;
  uint64_t v139;
  void *v140;
  void *v141;
  uint64_t v142;
  void *v143;
  void *v144;
  uint64_t v145;
  void *v146;
  void *v147;
  uint64_t v148;
  void *v149;
  void *v150;
  uint64_t v151;
  void *v152;
  void *v153;
  uint64_t v154;
  void *v155;
  void *v156;
  uint64_t v157;
  void *v158;
  void *v159;
  uint64_t v160;
  void *v161;
  void *v162;
  uint64_t v163;
  void *v164;
  void *v165;
  uint64_t v166;
  void *v167;
  void *v168;
  uint64_t v169;
  void *v170;
  void *v171;
  uint64_t v172;
  void *v173;
  void *v174;
  uint64_t v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  double v182;
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
  objc_super v199;
  unsigned __int8 v200;
  unsigned __int8 v201;
  unsigned __int8 v202;
  unsigned __int8 v203;
  unsigned __int8 v204;
  unsigned __int8 v205;
  unsigned int v206;
  uint64_t v207;
  unsigned __int8 v208;
  unsigned __int8 v209;
  unsigned __int8 v210;
  unsigned __int8 v211;
  unsigned __int8 v212;
  unsigned __int8 v213;
  unsigned __int8 v214;
  unsigned __int8 v215;
  objc_super v216;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v216.receiver = self;
  v216.super_class = (Class)WiFiUsagePoorLinkSession;
  -[WiFiUsageSession eventDictionary:](&v216, sel_eventDictionary_, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_badLinkRssi != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("BadLinkRssiThreshold"));

  }
  if (self->_goodLinkRssi != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("GoodLinkRssiThreshold"));

  }
  if (self->_perSSID_deferJoin != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("PerSsidDeferJoinSeconds"));

  }
  if (self->_perBSSID_deferJoin != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("PerBssidDeferJoinSeconds"));

  }
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[WiFiUsagePoorLinkSession timeSinceJoinATStart](self, "timeSinceJoinATStart");
  *(float *)&v12 = v12;
  objc_msgSend(v11, "numberWithFloat:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("timeSinceJoinAtSessionStart"));

  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[WiFiUsageSession sessionDuration](self, "sessionDuration");
  *(float *)&v15 = v15;
  objc_msgSend(v14, "numberWithFloat:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("SessionDuration"));

  +[WiFiUsagePoorLinkSession sessionStartedBy:](WiFiUsagePoorLinkSession, "sessionStartedBy:", -[WiFiUsagePoorLinkSession sessionStartedBy](self, "sessionStartedBy"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, CFSTR("TD_SessionStartedBy"));

  +[WiFiUsagePoorLinkSession sessionEndedBy:](WiFiUsagePoorLinkSession, "sessionEndedBy:", -[WiFiUsagePoorLinkSession sessionEndedBy](self, "sessionEndedBy"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("TD_SessionEndedBy"));

  if (self->_alerted)
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  -[WiFiUsagePoorLinkSession lastTDEval_AlertedAt](self, "lastTDEval_AlertedAt");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  lastJoinAt = self->_lastJoinAt;
  -[WiFiUsagePoorLinkSession lastTdEval_StartedBy](self, "lastTdEval_StartedBy");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsagePoorLinkSession lastTdEval_EndedBy](self, "lastTdEval_EndedBy");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%s - alerted:%@ lastTDEval_AlertedAt:%@ lastJoin:%@ TDEvalStartedBy:%@ TDEvalEndedBy:%@"), "-[WiFiUsagePoorLinkSession eventDictionary:]", v19, v20, lastJoinAt, v22, v23);

  if (self->_alerted)
  {
    v24 = (void *)MEMORY[0x1E0CB37E8];
    -[WiFiUsagePoorLinkSession lastTDEval_AlertedAt](self, "lastTDEval_AlertedAt");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "timeIntervalSinceDate:", self->_lastJoinAt);
    objc_msgSend(v24, "numberWithInteger:", (unint64_t)v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v27, CFSTR("TD_LastTDEval_TimeToAlert"));

    v28 = (void *)MEMORY[0x1E0CB37E8];
    -[WiFiUsagePoorLinkSession lastTDEval_TDEvalDuration](self, "lastTDEval_TDEvalDuration");
    objc_msgSend(v28, "numberWithInteger:", (unint64_t)v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v30, CFSTR("TD_LastTDEval_EvalDuration"));

    -[WiFiUsagePoorLinkSession lastTdEval_StartedBy](self, "lastTdEval_StartedBy");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v31, CFSTR("TD_LastTDEval_StartedBy"));

    -[WiFiUsagePoorLinkSession lastTdEval_EndedBy](self, "lastTdEval_EndedBy");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v32, CFSTR("TD_LastTDEval_EvalEndedBy"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WiFiUsagePoorLinkSession tdConfirmed](self, "tdConfirmed"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v33, CFSTR("TD_LastTDEval_Confirmed"));

  if (self->_isLastDecisionStateValid)
  {
    v34 = (void *)MEMORY[0x1E0CB37E8];
    -[WiFiUsagePoorLinkSession last_DecisionState](self, "last_DecisionState");
    objc_msgSend(v34, "numberWithBool:", v215);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v35, CFSTR("TD_Decision_TxPER"));

    v36 = (void *)MEMORY[0x1E0CB37E8];
    -[WiFiUsagePoorLinkSession last_DecisionState](self, "last_DecisionState");
    objc_msgSend(v36, "numberWithBool:", v214);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v37, CFSTR("TD_Decision_FWTxPER"));

    v38 = (void *)MEMORY[0x1E0CB37E8];
    -[WiFiUsagePoorLinkSession last_DecisionState](self, "last_DecisionState");
    objc_msgSend(v38, "numberWithBool:", v213);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v39, CFSTR("TD_Decision_BeaconPER"));

    v40 = (void *)MEMORY[0x1E0CB37E8];
    -[WiFiUsagePoorLinkSession last_DecisionState](self, "last_DecisionState");
    objc_msgSend(v40, "numberWithBool:", v212);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v41, CFSTR("TD_Decision_GatewayARPFailure"));

    v42 = (void *)MEMORY[0x1E0CB37E8];
    -[WiFiUsagePoorLinkSession last_DecisionState](self, "last_DecisionState");
    objc_msgSend(v42, "numberWithBool:", v211);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v43, CFSTR("TD_Decision_SymptomsDNSError"));

    v44 = (void *)MEMORY[0x1E0CB37E8];
    -[WiFiUsagePoorLinkSession last_DecisionState](self, "last_DecisionState");
    objc_msgSend(v44, "numberWithBool:", v210);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v45, CFSTR("TD_Decision_AutoLeave"));

    v46 = (void *)MEMORY[0x1E0CB37E8];
    -[WiFiUsagePoorLinkSession last_DecisionState](self, "last_DecisionState");
    objc_msgSend(v46, "numberWithBool:", v209);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v47, CFSTR("TD_Decision_ActiveProbe"));

    v48 = (void *)MEMORY[0x1E0CB37E8];
    -[WiFiUsagePoorLinkSession last_DecisionState](self, "last_DecisionState");
    objc_msgSend(v48, "numberWithBool:", v208);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v49, CFSTR("TD_Decision_FastTD"));

    v50 = (void *)MEMORY[0x1E0CB37E8];
    -[WiFiUsagePoorLinkSession last_DecisionState](self, "last_DecisionState");
    objc_msgSend(v50, "numberWithInteger:", v207);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v51, CFSTR("TD_AutoLeaveRSSIthreshold"));

    -[WiFiUsagePoorLinkSession last_DecisionState](self, "last_DecisionState");
    +[WiFiUsagePrivacyFilter getLabelForTDMode:](WiFiUsagePrivacyFilter, "getLabelForTDMode:", v206);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v52, CFSTR("TD_Mode"));

    v53 = (void *)MEMORY[0x1E0CB37E8];
    -[WiFiUsagePoorLinkSession last_DecisionState](self, "last_DecisionState");
    objc_msgSend(v53, "numberWithBool:", v205);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v54, CFSTR("TD_EdgeBSS"));

    v55 = (void *)MEMORY[0x1E0CB37E8];
    -[WiFiUsagePoorLinkSession last_DecisionState](self, "last_DecisionState");
    objc_msgSend(v55, "numberWithBool:", v204);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v56, CFSTR("TD_MotionDetected"));

    v57 = (void *)MEMORY[0x1E0CB37E8];
    -[WiFiUsagePoorLinkSession last_DecisionState](self, "last_DecisionState");
    objc_msgSend(v57, "numberWithBool:", v203);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v58, CFSTR("TD_WalkoutDetected"));

    v59 = (void *)MEMORY[0x1E0CB37E8];
    -[WiFiUsagePoorLinkSession last_DecisionState](self, "last_DecisionState");
    objc_msgSend(v59, "numberWithBool:", v202);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v60, CFSTR("TD_WaitForRoam"));

    v61 = (void *)MEMORY[0x1E0CB37E8];
    -[WiFiUsagePoorLinkSession last_DecisionState](self, "last_DecisionState");
    objc_msgSend(v61, "numberWithBool:", v201);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v62, CFSTR("TD_AppsUsingWiFi"));

    v63 = (void *)MEMORY[0x1E0CB37E8];
    -[WiFiUsagePoorLinkSession last_DecisionState](self, "last_DecisionState");
    objc_msgSend(v63, "numberWithBool:", v200);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v64, CFSTR("TD_monitorOnly"));

  }
  if (self->_isLastFastTdVotesValid)
  {
    v65 = (void *)MEMORY[0x1E0CB37E8];
    -[WiFiUsagePoorLinkSession last_FastTdVotes](self, "last_FastTdVotes");
    objc_msgSend(v65, "numberWithBool:", v66 & 1);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v67, CFSTR("TD_VoteFastTD_LinkRecommendation"));

    v68 = (void *)MEMORY[0x1E0CB37E8];
    -[WiFiUsagePoorLinkSession last_FastTdVotes](self, "last_FastTdVotes");
    objc_msgSend(v68, "numberWithBool:", (v69 >> 8) & 1);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v70, CFSTR("TD_VoteFastTD_TXPER"));

    v71 = (void *)MEMORY[0x1E0CB37E8];
    -[WiFiUsagePoorLinkSession last_FastTdVotes](self, "last_FastTdVotes");
    objc_msgSend(v71, "numberWithBool:", (v72 >> 24) & 1);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v73, CFSTR("TD_VoteFastTD_FWTXPER"));

    v74 = (void *)MEMORY[0x1E0CB37E8];
    -[WiFiUsagePoorLinkSession last_FastTdVotes](self, "last_FastTdVotes");
    objc_msgSend(v74, "numberWithBool:", (v75 >> 16) & 1);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v76, CFSTR("TD_VoteFastTD_BeaconPER"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[WiFiUsagePoorLinkSession last_FastTdVotes](self, "last_FastTdVotes"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v77, CFSTR("TD_VoteFastTD_VoteCount"));

    v78 = (void *)MEMORY[0x1E0CB37E8];
    -[WiFiUsagePoorLinkSession last_FastTdVotes](self, "last_FastTdVotes");
    objc_msgSend(v78, "numberWithBool:", HIDWORD(v79) & 1);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v80, CFSTR("TD_StateFastTD_RTApp"));

    v81 = (void *)MEMORY[0x1E0CB37E8];
    -[WiFiUsagePoorLinkSession last_FastTdVotes](self, "last_FastTdVotes");
    objc_msgSend(v81, "numberWithBool:", (v82 >> 40) & 1);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v83, CFSTR("TD_StateFastTD_Cheap5G"));

  }
  if (self->_lastTDEval_ConfirmedAt)
  {
    v84 = (void *)MEMORY[0x1E0CB37E8];
    -[WiFiUsagePoorLinkSession lastTDEval_ConfirmedAt](self, "lastTDEval_ConfirmedAt");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiUsagePoorLinkSession lastTDEval_AlertedAt](self, "lastTDEval_AlertedAt");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "timeIntervalSinceDate:", v86);
    objc_msgSend(v84, "numberWithInteger:", (unint64_t)v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v88, CFSTR("TD_LastTDEval_TimeToConfirm"));

    if (self->_isLastSuppressStateValid)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", ((unint64_t)-[WiFiUsagePoorLinkSession last_SuppressState](self, "last_SuppressState") >> 24) & 1);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v89, CFSTR("TD_Suppress_SymptomsNODataStall"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", ((unint64_t)-[WiFiUsagePoorLinkSession last_SuppressState](self, "last_SuppressState") >> 32) & 1);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v90, CFSTR("TD_Suppress_SymptomsAppPolicy"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", ((unint64_t)-[WiFiUsagePoorLinkSession last_SuppressState](self, "last_SuppressState") >> 40) & 1);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v91, CFSTR("TD_Suppress_FastCheapCellular"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", ((unint64_t)-[WiFiUsagePoorLinkSession last_SuppressState](self, "last_SuppressState") >> 48) & 1);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v92, CFSTR("TD_Suppress_2dBGuard"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", ((unint64_t)-[WiFiUsagePoorLinkSession last_SuppressState](self, "last_SuppressState") >> 56) & 1);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v93, CFSTR("TD_Suppress_NoFGnetwApp"));

      v94 = (void *)MEMORY[0x1E0CB37E8];
      -[WiFiUsagePoorLinkSession last_SuppressState](self, "last_SuppressState");
      objc_msgSend(v94, "numberWithBool:", v95 & 1);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v96, CFSTR("TD_Suppress_TTR"));

      v97 = (void *)MEMORY[0x1E0CB37E8];
      -[WiFiUsagePoorLinkSession last_SuppressState](self, "last_SuppressState");
      objc_msgSend(v97, "numberWithBool:", (v98 >> 8) & 1);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v99, CFSTR("TD_Suppress_UserInput"));

      v100 = (void *)MEMORY[0x1E0CB37E8];
      -[WiFiUsagePoorLinkSession last_SuppressState](self, "last_SuppressState");
      objc_msgSend(v100, "numberWithBool:", (v101 >> 16) & 1);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v102, CFSTR("TD_Suppress_GoodAfterRoam"));

      v103 = (void *)MEMORY[0x1E0CB37E8];
      -[WiFiUsagePoorLinkSession last_SuppressState](self, "last_SuppressState");
      objc_msgSend(v103, "numberWithBool:", (v104 >> 24) & 1);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v105, CFSTR("TD_Suppress_ActiveProbing"));

      v106 = (void *)MEMORY[0x1E0CB37E8];
      -[WiFiUsagePoorLinkSession last_SuppressState](self, "last_SuppressState");
      objc_msgSend(v106, "numberWithBool:", HIDWORD(v107) & 1);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v108, CFSTR("TD_Suppress_Roam"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", ((unint64_t)-[WiFiUsagePoorLinkSession last_SuppressState](self, "last_SuppressState") >> 16) & 1);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v109, CFSTR("TD_FastTDEvaluation"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WiFiUsagePoorLinkSession last_SuppressState](self, "last_SuppressState") & 1);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v110, CFSTR("TD_AggressiveTD"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", ((unint64_t)-[WiFiUsagePoorLinkSession last_SuppressState](self, "last_SuppressState") >> 8) & 1);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v111, CFSTR("TD_RNF_allowed"));

    }
    v199.receiver = self;
    v199.super_class = (Class)WiFiUsagePoorLinkSession;
    -[WiFiUsageSession sessionEndTime](&v199, sel_sessionEndTime);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "timeIntervalSinceDate:", self->_lastTDEval_ConfirmedAt);

    lastTDEval_ExecutedAt = self->_lastTDEval_ExecutedAt;
    if (lastTDEval_ExecutedAt)
      -[NSDate timeIntervalSinceDate:](lastTDEval_ExecutedAt, "timeIntervalSinceDate:", self->_lastTDEval_ConfirmedAt);
    -[WiFiUsagePoorLinkSession suppress_SymptomsNODataStall_Duration](self, "suppress_SymptomsNODataStall_Duration");
    +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v114, CFSTR("TD_Suppress_SymptomsNODataStall_PercTimeToExecute"));

    -[WiFiUsagePoorLinkSession suppress_SymptomsAppPolicy_Duration](self, "suppress_SymptomsAppPolicy_Duration");
    +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v115, CFSTR("TD_Suppress_SymptomsAppPolicy_PercTimeToExecute"));

    -[WiFiUsagePoorLinkSession suppress_FastCheapCellular_Duration](self, "suppress_FastCheapCellular_Duration");
    +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v116, CFSTR("TD_Suppress_FastCheapCellular_PercTimeToExecute"));

    -[WiFiUsagePoorLinkSession suppress_2dBGuard](self, "suppress_2dBGuard");
    +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v117, CFSTR("TD_Suppress_2dBGuard_PercTimeToExecute"));

    -[WiFiUsagePoorLinkSession suppress_NoFgNetwApp_Duration](self, "suppress_NoFgNetwApp_Duration");
    +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v118, CFSTR("TD_Suppress_NoFGnetwApp_PercTimeToExecute"));

    -[WiFiUsagePoorLinkSession suppress_TTR_Duration](self, "suppress_TTR_Duration");
    +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v119, CFSTR("TD_Suppress_TTR_PercTimeToExecute"));

    -[WiFiUsagePoorLinkSession suppress_UserInput_Duration](self, "suppress_UserInput_Duration");
    +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v120, CFSTR("TD_Suppress_UserInput_PercTimeToExecute"));

    -[WiFiUsagePoorLinkSession suppress_GoodAfterRoam_Duration](self, "suppress_GoodAfterRoam_Duration");
    +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v121, CFSTR("TD_Suppress_GoodAfterRoam_PercTimeToExecute"));

    -[WiFiUsagePoorLinkSession suppress_ActiveProbing](self, "suppress_ActiveProbing");
    +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v122, CFSTR("TD_Suppress_ActiveProbing_PercTimeToExecute"));

    -[WiFiUsagePoorLinkSession suppress_Roam_Duration](self, "suppress_Roam_Duration");
    +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v123, CFSTR("TD_Suppress_Roam_PercTimeToExecute"));

  }
  +[WiFiUsagePrivacyFilter getLabelForCoreRssiMode:](WiFiUsagePrivacyFilter, "getLabelForCoreRssiMode:", -[WiFiUsagePoorLinkSession last_RSSIMode](self, "last_RSSIMode"));
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v124, CFSTR("TD_perCoreRSSIinUse"));

  if (self->_lastTDEval_waitOnRoamStatusDuration != 9.22337204e18)
  {
    v125 = (void *)MEMORY[0x1E0CB37E8];
    -[WiFiUsagePoorLinkSession lastTDEval_waitOnRoamStatusDuration](self, "lastTDEval_waitOnRoamStatusDuration");
    objc_msgSend(v125, "numberWithUnsignedInteger:", (unint64_t)v126);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v127, CFSTR("TD_LastTDEval_WaitOnRoamStatusDuration"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[WiFiUsagePoorLinkSession waitOnRoamStatusDurationCumulative](self, "waitOnRoamStatusDurationCumulative"));
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v128, CFSTR("TD_WaitOnRoamStatus_CumulativeDuration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WiFiUsagePoorLinkSession tdExecuted](self, "tdExecuted"));
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v129, CFSTR("TD_LastTDEval_Executed"));

  if (self->_tdExecuted)
  {
    v130 = (void *)MEMORY[0x1E0CB37E8];
    -[WiFiUsagePoorLinkSession lastTDEval_ExecutedAt](self, "lastTDEval_ExecutedAt");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiUsagePoorLinkSession lastTDEval_ConfirmedAt](self, "lastTDEval_ConfirmedAt");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "timeIntervalSinceDate:", v132);
    objc_msgSend(v130, "numberWithInteger:", vcvtpd_u64_f64(v133));
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v134, CFSTR("TD_LastTDEval_TimeToExecute"));

  }
  v135 = self->_lastTDEval_ExecutedAt;
  if (v135)
    -[NSDate timeIntervalSinceDate:](v135, "timeIntervalSinceDate:", self->_lastTDEval_AlertedAt);
  -[WiFiUsagePoorLinkSession decision_TxPER_Duration](self, "decision_TxPER_Duration");
  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:");
  v136 = objc_claimAutoreleasedReturnValue();
  v137 = (void *)v136;
  if (v136)
    v138 = (void *)v136;
  else
    v138 = &unk_1E8862BB0;
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v138, CFSTR("TD_Decision_TxPER_PercTDEvalDuration"));

  -[WiFiUsagePoorLinkSession decision_FWTxPER_Duration](self, "decision_FWTxPER_Duration");
  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:");
  v139 = objc_claimAutoreleasedReturnValue();
  v140 = (void *)v139;
  if (v139)
    v141 = (void *)v139;
  else
    v141 = &unk_1E8862BB0;
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v141, CFSTR("TD_Decision_FWTxPER_PercTDEvalDuration"));

  -[WiFiUsagePoorLinkSession decision_BeaconPER_Duration](self, "decision_BeaconPER_Duration");
  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:");
  v142 = objc_claimAutoreleasedReturnValue();
  v143 = (void *)v142;
  if (v142)
    v144 = (void *)v142;
  else
    v144 = &unk_1E8862BB0;
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v144, CFSTR("TD_Decision_BeaconPER_PercTDEvalDuration"));

  -[WiFiUsagePoorLinkSession decision_GatewayARPFailure_Duration](self, "decision_GatewayARPFailure_Duration");
  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:");
  v145 = objc_claimAutoreleasedReturnValue();
  v146 = (void *)v145;
  if (v145)
    v147 = (void *)v145;
  else
    v147 = &unk_1E8862BB0;
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v147, CFSTR("TD_Decision_GatewayARPFailure_PercTDEvalDuration"));

  -[WiFiUsagePoorLinkSession decision_SymptomsDNSError_Duration](self, "decision_SymptomsDNSError_Duration");
  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:");
  v148 = objc_claimAutoreleasedReturnValue();
  v149 = (void *)v148;
  if (v148)
    v150 = (void *)v148;
  else
    v150 = &unk_1E8862BB0;
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v150, CFSTR("TD_Decision_SymptomsDNSError_PercTDEvalDuration"));

  -[WiFiUsagePoorLinkSession decision_AutoLeave_Duration](self, "decision_AutoLeave_Duration");
  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:");
  v151 = objc_claimAutoreleasedReturnValue();
  v152 = (void *)v151;
  if (v151)
    v153 = (void *)v151;
  else
    v153 = &unk_1E8862BB0;
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v153, CFSTR("TD_Decision_AutoLeave_PercTDEvalDuration"));

  -[WiFiUsagePoorLinkSession decision_ActiveProbe_Duration](self, "decision_ActiveProbe_Duration");
  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:");
  v154 = objc_claimAutoreleasedReturnValue();
  v155 = (void *)v154;
  if (v154)
    v156 = (void *)v154;
  else
    v156 = &unk_1E8862BB0;
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v156, CFSTR("TD_Decision_ActiveProbe_PercTDEvalDuration"));

  -[WiFiUsagePoorLinkSession decision_FastTD_Duration](self, "decision_FastTD_Duration");
  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:");
  v157 = objc_claimAutoreleasedReturnValue();
  v158 = (void *)v157;
  if (v157)
    v159 = (void *)v157;
  else
    v159 = &unk_1E8862BB0;
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v159, CFSTR("TD_Decision_FastTD_PercTDEvalDuration"));

  -[WiFiUsagePoorLinkSession vote_FastTD_Recommendation_Duration](self, "vote_FastTD_Recommendation_Duration");
  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:");
  v160 = objc_claimAutoreleasedReturnValue();
  v161 = (void *)v160;
  if (v160)
    v162 = (void *)v160;
  else
    v162 = &unk_1E8862BB0;
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v162, CFSTR("TD_VoteFastTD_LinkRecommendation_PercTDEvalDuration"));

  -[WiFiUsagePoorLinkSession vote_FastTD_TXPER_Duration](self, "vote_FastTD_TXPER_Duration");
  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:");
  v163 = objc_claimAutoreleasedReturnValue();
  v164 = (void *)v163;
  if (v163)
    v165 = (void *)v163;
  else
    v165 = &unk_1E8862BB0;
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v165, CFSTR("TD_VoteFastTD_TXPER_PercTDEvalDuration"));

  -[WiFiUsagePoorLinkSession vote_FastTD_FWTxPER_Duration](self, "vote_FastTD_FWTxPER_Duration");
  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:");
  v166 = objc_claimAutoreleasedReturnValue();
  v167 = (void *)v166;
  if (v166)
    v168 = (void *)v166;
  else
    v168 = &unk_1E8862BB0;
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v168, CFSTR("TD_VoteFastTD_FWTXPER_PercTDEvalDuration"));

  -[WiFiUsagePoorLinkSession vote_FastTD_BeaconPER_Duration](self, "vote_FastTD_BeaconPER_Duration");
  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:");
  v169 = objc_claimAutoreleasedReturnValue();
  v170 = (void *)v169;
  if (v169)
    v171 = (void *)v169;
  else
    v171 = &unk_1E8862BB0;
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v171, CFSTR("TD_VoteFastTD_BeaconPER_PercTDEvalDuration"));

  -[WiFiUsagePoorLinkSession perCoreRSSI_Core0_Duration](self, "perCoreRSSI_Core0_Duration");
  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:");
  v172 = objc_claimAutoreleasedReturnValue();
  v173 = (void *)v172;
  if (v172)
    v174 = (void *)v172;
  else
    v174 = &unk_1E8862BB0;
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v174, CFSTR("TD_perCoreRSSICore0_PercTDEvalDuration"));

  -[WiFiUsagePoorLinkSession perCoreRSSI_Core1_Duration](self, "perCoreRSSI_Core1_Duration");
  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:");
  v175 = objc_claimAutoreleasedReturnValue();
  v176 = (void *)v175;
  if (v175)
    v177 = (void *)v175;
  else
    v177 = &unk_1E8862BB0;
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v177, CFSTR("TD_perCoreRSSICore1_PercTDEvalDuration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[WiFiUsagePoorLinkSession rssiAtJoin](self, "rssiAtJoin"));
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v178, CFSTR("TD_rssiAtJoin"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WiFiUsagePoorLinkSession tdRecommendAtNextLinkUp](self, "tdRecommendAtNextLinkUp"));
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v179, CFSTR("TD_TDRecommendAtJoin"));

  if (self->_tdExecuted && self->_lastTDEval_rssiAtTD != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[WiFiUsagePoorLinkSession lastTDEval_rssiAtTD](self, "lastTDEval_rssiAtTD"));
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v180, CFSTR("TD_rssiAtLastTD"));

  }
  if (self->_nextJoinReason)
  {
    v181 = (void *)MEMORY[0x1E0CB37E8];
    -[WiFiUsagePoorLinkSession timeToNextJoin](self, "timeToNextJoin");
    *(float *)&v182 = v182;
    objc_msgSend(v181, "numberWithFloat:", v182);
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v183, CFSTR("TD_timeToNextJoin"));

    -[WiFiUsagePoorLinkSession nextJoinReason](self, "nextJoinReason");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v184, CFSTR("TD_nextJoinReason"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WiFiUsagePoorLinkSession nextJoinIsSameSSID](self, "nextJoinIsSameSSID"));
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v185, CFSTR("TD_nextLinkUpWasSameSSID"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WiFiUsagePoorLinkSession nextLinkUpIsSameBSSID](self, "nextLinkUpIsSameBSSID"));
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v186, CFSTR("TD_nextLinkUpWasSameBSSID"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WiFiUsagePoorLinkSession nextJoinWhileDeferJoin](self, "nextJoinWhileDeferJoin"));
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v187, CFSTR("TD_nextJoinWhileDeferJoin"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[WiFiUsagePoorLinkSession rssiAtNextLinkUp](self, "rssiAtNextLinkUp"));
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v188, CFSTR("TD_RSSIatNextLinkUp"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WiFiUsagePoorLinkSession tdRecommendAtNextLinkUp](self, "tdRecommendAtNextLinkUp"));
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v189, CFSTR("TD_TDRecommendAtNextLinkUp"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[WiFiUsagePoorLinkSession roamStatus_Succeeded_Count_WhileTDWait](self, "roamStatus_Succeeded_Count_WhileTDWait"));
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v190, CFSTR("TD_roamStatus_Succeeded_Count_WhileTDWait"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[WiFiUsagePoorLinkSession roamStatus_Failed_Count_WhileTDWait](self, "roamStatus_Failed_Count_WhileTDWait"));
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v191, CFSTR("TD_roamStatus_Failed_Count_WhileTDWait"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[WiFiUsagePoorLinkSession roamStatus_FailedFilteredOut_Count_WhileTDWait](self, "roamStatus_FailedFilteredOut_Count_WhileTDWait"));
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v192, CFSTR("TD_roamStatus_FailedFilteredOut_Count_WhileTDWait"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[WiFiUsagePoorLinkSession roamStatus_FailedNotFound_Count_WhileTDWait](self, "roamStatus_FailedNotFound_Count_WhileTDWait"));
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v193, CFSTR("TD_roamStatus_FailedNotFound_Count_WhileTDWait"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[WiFiUsagePoorLinkSession roamStatus_Succeeded_Count_BeforeTDWait](self, "roamStatus_Succeeded_Count_BeforeTDWait"));
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v194, CFSTR("TD_roamStatus_Succeeded_Count_BeforeTDWait"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[WiFiUsagePoorLinkSession roamStatus_Failed_Count_BeforeTDWait](self, "roamStatus_Failed_Count_BeforeTDWait"));
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v195, CFSTR("TD_roamStatus_Failed_Count_BeforeTDWait"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[WiFiUsagePoorLinkSession roamStatus_FailedFilteredOut_Count_BeforeTDWait](self, "roamStatus_FailedFilteredOut_Count_BeforeTDWait"));
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v196, CFSTR("TD_roamStatus_FailedFilteredOut_Count_BeforeTDWait"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[WiFiUsagePoorLinkSession roamStatus_FailedNotFound_Count_BeforeTDWait](self, "roamStatus_FailedNotFound_Count_BeforeTDWait"));
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v197, CFSTR("TD_roamStatus_FailedNotFound_Count_BeforeTDWait"));

  return v6;
}

- (WiFiUsagePoorLinkSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4 onQueue:(id)a5
{
  NSString *v8;
  NSObject *v9;
  WiFiUsagePoorLinkSession *v10;
  WiFiUsageSessionCAConfig *v11;
  dispatch_source_t v12;
  OS_dispatch_source *endSessionTimer;
  OS_dispatch_queue *queue;
  NSObject *v15;
  NSString *interface;
  NSString *v17;
  NSDate *lastJoinAt;
  NSString *bssidAtTD;
  NSString *ssidAtTD;
  NSObject *v21;
  WiFiUsagePoorLinkSession *v22;
  _QWORD handler[4];
  WiFiUsagePoorLinkSession *v25;
  id v26;
  id location;
  objc_super v28;

  v8 = (NSString *)a3;
  v9 = a5;
  v28.receiver = self;
  v28.super_class = (Class)WiFiUsagePoorLinkSession;
  v10 = -[WiFiUsageSession initWithSessionType:andInterfaceName:andCapabilities:](&v28, sel_initWithSessionType_andInterfaceName_andCapabilities_, 9, v8, a4);
  v11 = -[WiFiUsageSessionCAConfig initWithSampling:minInterval:]([WiFiUsageSessionCAConfig alloc], "initWithSampling:minInterval:", 2, 86400.0);
  -[WiFiUsageSession setCa_config:](v10, "setCa_config:", v11);

  v12 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v9);
  endSessionTimer = v10->_endSessionTimer;
  v10->_endSessionTimer = (OS_dispatch_source *)v12;

  queue = v10->_queue;
  v10->_queue = (OS_dispatch_queue *)v9;
  v15 = v9;

  interface = v10->_interface;
  v10->_interface = v8;
  v17 = v8;

  v10->_badLinkRssi = 0x7FFFFFFFFFFFFFFFLL;
  v10->_goodLinkRssi = 0x7FFFFFFFFFFFFFFFLL;
  v10->_perSSID_deferJoin = 0x7FFFFFFFFFFFFFFFLL;
  v10->_perBSSID_deferJoin = 0x7FFFFFFFFFFFFFFFLL;
  v10->_linkIsUp = 0;
  lastJoinAt = v10->_lastJoinAt;
  v10->_lastJoinAt = 0;

  v10->_justJoined = 0;
  v10->_alerted = 0;
  v10->_tdExecuted = 0;
  v10->_toBeClosedAfterLQM = 0;
  v10->_waitingOnLinkUp = 0;
  bssidAtTD = v10->_bssidAtTD;
  v10->_bssidAtTD = 0;

  ssidAtTD = v10->_ssidAtTD;
  v10->_ssidAtTD = 0;

  objc_initWeak(&location, v10);
  v21 = v10->_endSessionTimer;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __74__WiFiUsagePoorLinkSession_initWithInterfaceName_andCapabilities_onQueue___block_invoke;
  handler[3] = &unk_1E881DFF8;
  objc_copyWeak(&v26, &location);
  v22 = v10;
  v25 = v22;
  dispatch_source_set_event_handler(v21, handler);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
  return v22;
}

void __74__WiFiUsagePoorLinkSession_initWithInterfaceName_andCapabilities_onQueue___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 12020))
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "sessionDidEnd:", 2);
    WeakRetained = v3;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;
  __int128 v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WiFiUsagePoorLinkSession;
  v4 = -[WiFiUsageSession copyWithZone:](&v8, sel_copyWithZone_, a3);
  *((_QWORD *)v4 + 1494) = self->_badLinkRssi;
  *((_QWORD *)v4 + 1495) = self->_goodLinkRssi;
  *((_QWORD *)v4 + 1496) = self->_perSSID_deferJoin;
  *((_QWORD *)v4 + 1497) = self->_perBSSID_deferJoin;
  *((_DWORD *)v4 + 3019) = self->_sessionStartedBy;
  *((_DWORD *)v4 + 3020) = self->_sessionEndedBy;
  v4[11984] = self->_linkIsUp;
  objc_storeStrong((id *)v4 + 1499, self->_lastJoinAt);
  v4[12000] = self->_justJoined;
  objc_storeStrong((id *)v4 + 1501, self->_lastLinkDownAt);
  v4[12016] = self->_lastTdRecommended;
  v4[12017] = self->_alerted;
  v4[12064] = self->_tdExecuted;
  v4[12018] = self->_toBeClosedAfterLQM;
  v4[12019] = self->_toBeClosedAfterTdLogicEnd;
  v4[12020] = self->_waitingOnLinkUp;
  objc_storeStrong((id *)v4 + 1503, self->_bssidAtTD);
  objc_storeStrong((id *)v4 + 1504, self->_ssidAtTD);
  objc_storeStrong((id *)v4 + 1505, self->_lastDecisionAt);
  objc_storeStrong((id *)v4 + 1506, self->_lastFastTDVotesAt);
  objc_storeStrong((id *)v4 + 1507, self->_lastSuppressAt);
  v4[12066] = self->_tdConfirmed;
  v4[12067] = self->_isLastDecisionStateValid;
  v4[12068] = self->_isLastSuppressStateValid;
  v4[12069] = self->_isLastFastTdVotesValid;
  v5 = *(_OWORD *)&self->_last_DecisionState.appsUsingWiFi;
  *((_OWORD *)v4 + 782) = *(_OWORD *)&self->_last_DecisionState.decision_TxPER;
  *((_OWORD *)v4 + 783) = v5;
  v6 = *(_QWORD *)&self->_last_SuppressState.suppress_FastCheapCellular;
  *((_QWORD *)v4 + 1560) = *(_QWORD *)&self->_last_SuppressState.aggressiveTDEnabled;
  *(_QWORD *)(v4 + 12485) = v6;
  *((_OWORD *)v4 + 781) = self->_last_FastTdVotes;
  *((_QWORD *)v4 + 1511) = self->_last_RSSIMode;
  objc_storeStrong((id *)v4 + 1512, self->_lastTdEval_StartedBy);
  objc_storeStrong((id *)v4 + 1513, self->_lastTdEval_EndedBy);
  objc_storeStrong((id *)v4 + 1514, self->_lastTDEval_AlertedAt);
  objc_storeStrong((id *)v4 + 1515, self->_lastTDEval_ConfirmedAt);
  objc_storeStrong((id *)v4 + 1516, self->_lastTDEval_ExecutedAt);
  *((_QWORD *)v4 + 1517) = *(_QWORD *)&self->_lastTDEval_TDEvalDuration;
  *((_QWORD *)v4 + 1518) = self->_lastTDEval_rssiAtTD;
  *((_QWORD *)v4 + 1519) = *(_QWORD *)&self->_lastTDEval_waitOnRoamStatusDuration;
  *((_QWORD *)v4 + 1520) = *(_QWORD *)&self->_tdEvalDurationCumulative;
  *((_QWORD *)v4 + 1521) = self->_waitOnRoamStatusDurationCumulative;
  objc_storeStrong((id *)v4 + 1522, self->_nextJoinReason);
  v4[12070] = self->_nextJoinIsSameSSID;
  v4[12065] = self->_nextJoinWhileDeferJoin;
  *((_QWORD *)v4 + 1523) = *(_QWORD *)&self->_timeToNextJoin;
  v4[12071] = self->_nextLinkUpIsSameBSSID;
  *((_QWORD *)v4 + 1524) = self->_rssiAtNextLinkUp;
  v4[12072] = self->_tdRecommendAtNextLinkUp;
  *((_QWORD *)v4 + 1525) = self->_rssiAtJoin;
  v4[12073] = self->_tdRecommendAtJoin;
  *((_QWORD *)v4 + 1526) = *(_QWORD *)&self->_timeSinceJoinATStart;
  *((_DWORD *)v4 + 3019) = self->_sessionStartedBy;
  *((_DWORD *)v4 + 3020) = self->_sessionEndedBy;
  *((_QWORD *)v4 + 1527) = *(_QWORD *)&self->_decision_TxPER_Duration;
  *((_QWORD *)v4 + 1528) = *(_QWORD *)&self->_decision_FWTxPER_Duration;
  *((_QWORD *)v4 + 1529) = *(_QWORD *)&self->_decision_BeaconPER_Duration;
  *((_QWORD *)v4 + 1530) = *(_QWORD *)&self->_decision_GatewayARPFailure_Duration;
  *((_QWORD *)v4 + 1531) = *(_QWORD *)&self->_decision_SymptomsDNSError_Duration;
  *((_QWORD *)v4 + 1532) = *(_QWORD *)&self->_decision_AutoLeave_Duration;
  *((_QWORD *)v4 + 1533) = *(_QWORD *)&self->_decision_ActiveProbe_Duration;
  *((_QWORD *)v4 + 1534) = *(_QWORD *)&self->_decision_FastTD_Duration;
  *((_QWORD *)v4 + 1535) = *(_QWORD *)&self->_vote_FastTD_Recommendation_Duration;
  *((_QWORD *)v4 + 1536) = *(_QWORD *)&self->_vote_FastTD_TXPER_Duration;
  *((_QWORD *)v4 + 1537) = *(_QWORD *)&self->_vote_FastTD_FWTxPER_Duration;
  *((_QWORD *)v4 + 1538) = *(_QWORD *)&self->_vote_FastTD_BeaconPER_Duration;
  *((_QWORD *)v4 + 1539) = *(_QWORD *)&self->_suppress_SymptomsNODataStall_Duration;
  *((_QWORD *)v4 + 1540) = *(_QWORD *)&self->_suppress_SymptomsAppPolicy_Duration;
  *((_QWORD *)v4 + 1541) = *(_QWORD *)&self->_suppress_FastCheapCellular_Duration;
  *((_QWORD *)v4 + 1542) = *(_QWORD *)&self->_suppress_2dBGuard;
  *((_QWORD *)v4 + 1543) = *(_QWORD *)&self->_suppress_NoFgNetwApp_Duration;
  *((_QWORD *)v4 + 1544) = *(_QWORD *)&self->_suppress_TTR_Duration;
  *((_QWORD *)v4 + 1545) = *(_QWORD *)&self->_suppress_UserInput_Duration;
  *((_QWORD *)v4 + 1546) = *(_QWORD *)&self->_suppress_GoodAfterRoam_Duration;
  *((_QWORD *)v4 + 1547) = *(_QWORD *)&self->_suppress_Roam_Duration;
  *((_QWORD *)v4 + 1548) = *(_QWORD *)&self->_suppress_ActiveProbing;
  *((_QWORD *)v4 + 1549) = *(_QWORD *)&self->_perCoreRSSI_NotUsed_Duration;
  *((_QWORD *)v4 + 1550) = *(_QWORD *)&self->_perCoreRSSI_Core0_Duration;
  *((_QWORD *)v4 + 1551) = *(_QWORD *)&self->_perCoreRSSI_Core1_Duration;
  *((_QWORD *)v4 + 1552) = self->_roamStatus_Succeeded_Count_WhileTDWait;
  *((_QWORD *)v4 + 1553) = self->_roamStatus_Failed_Count_WhileTDWait;
  *((_QWORD *)v4 + 1554) = self->_roamStatus_FailedFilteredOut_Count_WhileTDWait;
  *((_QWORD *)v4 + 1555) = self->_roamStatus_FailedNotFound_Count_WhileTDWait;
  *((_QWORD *)v4 + 1556) = self->_roamStatus_Succeeded_Count_BeforeTDWait;
  *((_QWORD *)v4 + 1557) = self->_roamStatus_Failed_Count_BeforeTDWait;
  *((_QWORD *)v4 + 1558) = self->_roamStatus_FailedFilteredOut_Count_BeforeTDWait;
  *((_QWORD *)v4 + 1559) = self->_roamStatus_FailedNotFound_Count_BeforeTDWait;
  return v4;
}

- (void)tdLogic_badRssi:(int64_t)a3 goodRSSI:(int64_t)goodLinkRssi
{
  int64_t badLinkRssi;
  __CFString *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WiFiUsagePoorLinkSession;
  -[WiFiUsageSession tdLogic_badRssi:goodRSSI:](&v10, sel_tdLogic_badRssi_goodRSSI_);
  self->_badLinkRssi = a3;
  self->_goodLinkRssi = goodLinkRssi;
  badLinkRssi = self->_badLinkRssi;
  if (badLinkRssi == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = CFSTR("N/A");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_badLinkRssi);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goodLinkRssi = self->_goodLinkRssi;
  }
  if (goodLinkRssi == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSLog(CFSTR("%s - badRssiThreshold:%@ goodRSSIThreshold:%@"), "-[WiFiUsagePoorLinkSession tdLogic_badRssi:goodRSSI:]", v8, CFSTR("N/A"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", goodLinkRssi);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s - badRssiThreshold:%@ goodRSSIThreshold:%@"), "-[WiFiUsagePoorLinkSession tdLogic_badRssi:goodRSSI:]", v8, v9);

  }
  if (badLinkRssi != 0x7FFFFFFFFFFFFFFFLL)

}

- (void)tdLogic_deferJoin:(unint64_t)a3 perBSSID:(unint64_t)perBSSID_deferJoin
{
  unint64_t perSSID_deferJoin;
  __CFString *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WiFiUsagePoorLinkSession;
  -[WiFiUsageSession tdLogic_deferJoin:perBSSID:](&v10, sel_tdLogic_deferJoin_perBSSID_);
  self->_perSSID_deferJoin = a3;
  self->_perBSSID_deferJoin = perBSSID_deferJoin;
  perSSID_deferJoin = self->_perSSID_deferJoin;
  if (perSSID_deferJoin == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = CFSTR("N/A");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_perSSID_deferJoin);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    perBSSID_deferJoin = self->_perBSSID_deferJoin;
  }
  if (perBSSID_deferJoin == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSLog(CFSTR("%s - deferPerSSID:%@ deferPerBSSID:%@"), "-[WiFiUsagePoorLinkSession tdLogic_deferJoin:perBSSID:]", v8, CFSTR("N/A"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", perBSSID_deferJoin);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s - deferPerSSID:%@ deferPerBSSID:%@"), "-[WiFiUsagePoorLinkSession tdLogic_deferJoin:perBSSID:]", v8, v9);

  }
  if (perSSID_deferJoin != 0x7FFFFFFFFFFFFFFFLL)

}

- (id)metricName
{
  return CFSTR("com.apple.wifi.badlinksession");
}

+ (id)sessionStartedBy:(int)a3
{
  if ((a3 - 1) > 3)
    return CFSTR("Unknown");
  else
    return off_1E881E030[a3 - 1];
}

+ (id)sessionEndedBy:(int)a3
{
  if (a3 > 3)
    return CFSTR("Unknown");
  else
    return off_1E881E050[a3];
}

+ (id)describeWiFiUsageMonitor_tdDecisionState:(id *)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;

  v4 = (void *)MEMORY[0x1E0CB3940];
  +[WiFiUsagePrivacyFilter getLabelForTDMode:](WiFiUsagePrivacyFilter, "getLabelForTDMode:", a3->var8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = &stru_1E881F240;
  if (a3->var0)
    v7 = CFSTR("decision_TxPER & ");
  else
    v7 = &stru_1E881F240;
  if (a3->var1)
    v8 = CFSTR("decision_BeaconPER & ");
  else
    v8 = &stru_1E881F240;
  if (a3->var2)
    v9 = CFSTR("decision_FWTxPER & ");
  else
    v9 = &stru_1E881F240;
  v10 = CFSTR("decision_GatewayARPFailure & ");
  if (!a3->var3)
    v10 = &stru_1E881F240;
  if (a3->var4)
    v11 = CFSTR("decision_SymptomsDNSError & ");
  else
    v11 = &stru_1E881F240;
  if (a3->var5)
    v12 = CFSTR("decision_AutoLeave & ");
  else
    v12 = &stru_1E881F240;
  if (a3->var6)
    v13 = CFSTR("decision_ActiveProbe & ");
  else
    v13 = &stru_1E881F240;
  if (a3->var7)
    v14 = CFSTR("decision_FastTD & ");
  else
    v14 = &stru_1E881F240;
  if (a3->var9)
    v15 = CFSTR("motionbasedAggressiveTDEnabled & ");
  else
    v15 = &stru_1E881F240;
  v16 = CFSTR("walkoutDetected & ");
  if (!a3->var10)
    v16 = &stru_1E881F240;
  if (a3->var11)
    v17 = CFSTR("waitForRoam & ");
  else
    v17 = &stru_1E881F240;
  if (a3->var12)
    v18 = CFSTR("edgeBSS & ");
  else
    v18 = &stru_1E881F240;
  if (a3->var13)
    v19 = CFSTR("appsUsingWiFi & ");
  else
    v19 = &stru_1E881F240;
  if (a3->var14)
    v6 = CFSTR("monitorMode & ");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("tdMode:%@ & %@%@%@%@%@%@%@%@%@%@%@%@%@%@autoLeaveRSSIthreshold:%ld"), v5, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v6, a3->var15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)describeWiFiUsageMonitor_tdFastTDState:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;

  v3 = CFSTR("YES");
  if ((*(_QWORD *)&a3.var1 & 0x100000000) != 0)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  if ((*(_QWORD *)&a3.var1 & 0x10000000000) == 0)
    v3 = CFSTR("NO");
  v5 = CFSTR("Recommend & ");
  v6 = &stru_1E881F240;
  if (!a3.var1)
    v5 = &stru_1E881F240;
  v7 = CFSTR("TxPER & ");
  if ((*(_WORD *)&a3.var1 & 0x100) == 0)
    v7 = &stru_1E881F240;
  v8 = CFSTR("BeaconPER & ");
  if ((*(_QWORD *)&a3.var1 & 0x10000) == 0)
    v8 = &stru_1E881F240;
  if ((*(_DWORD *)&a3.var1 & 0x1000000) != 0)
    v6 = CFSTR("FWTxPER & ");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fastTD (RTApp:%@ Cheap5G:%@) votes:%lu %@%@%@%@"), v4, v3, a3.var0, v5, v7, v8, v6);
}

+ (id)describeWiFiUsageMonitor_tdExecState:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;

  v3 = CFSTR("aggressiveTDEnabled & ");
  v4 = &stru_1E881F240;
  if (!a3.var0)
    v3 = &stru_1E881F240;
  v5 = CFSTR("rnfAllowed & ");
  if ((*(_WORD *)&a3.var0 & 0x100) == 0)
    v5 = &stru_1E881F240;
  v6 = CFSTR("fastTD & ");
  if ((*(_QWORD *)&a3.var0 & 0x10000) == 0)
    v6 = &stru_1E881F240;
  v7 = CFSTR("suppress_SymptomDataStallScoreGood & ");
  if ((*(_DWORD *)&a3.var0 & 0x1000000) == 0)
    v7 = &stru_1E881F240;
  v8 = CFSTR("suppress_SymptomAppPolicyScore & ");
  if ((*(_QWORD *)&a3.var0 & 0x100000000) == 0)
    v8 = &stru_1E881F240;
  v9 = CFSTR("suppress_FastCheapCellular & ");
  if ((*(_QWORD *)&a3.var0 & 0x10000000000) == 0)
    v9 = &stru_1E881F240;
  v10 = CFSTR("suppress_2dBGuard & ");
  if ((*(_QWORD *)&a3.var0 & 0x1000000000000) == 0)
    v10 = &stru_1E881F240;
  v11 = CFSTR("suppress_NoFGnetwApp & ");
  if ((*(_QWORD *)&a3.var0 & 0x100000000000000) == 0)
    v11 = &stru_1E881F240;
  v12 = CFSTR("suppress_TTR & ");
  if (!a3.var8)
    v12 = &stru_1E881F240;
  v13 = CFSTR("suppress_UserInput & ");
  if ((*(_WORD *)&a3.var8 & 0x100) == 0)
    v13 = &stru_1E881F240;
  *(_QWORD *)&a3.var0 = CFSTR("suppress_GoodAfterRoam & ");
  if ((*(_QWORD *)&a3.var8 & 0x10000) == 0)
    *(_QWORD *)&a3.var0 = &stru_1E881F240;
  v14 = CFSTR("defer_activeProbing & ");
  if ((*(_DWORD *)&a3.var8 & 0x1000000) == 0)
    v14 = &stru_1E881F240;
  if ((*(_QWORD *)&a3.var8 & 0x100000000) != 0)
    v4 = CFSTR("defer_roaming & ");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%@%@%@%@%@%@%@%@%@%@"), v3, v5, v6, v7, v8, v9, v10, v11, v12, v13, *(_QWORD *)&a3.var0, v14, v4);
}

- (int)sessionStartedBy
{
  return self->_sessionStartedBy;
}

- (void)setSessionStartedBy:(int)a3
{
  self->_sessionStartedBy = a3;
}

- (BOOL)tdExecuted
{
  return self->_tdExecuted;
}

- (void)setTdExecuted:(BOOL)a3
{
  self->_tdExecuted = a3;
}

- (BOOL)nextJoinWhileDeferJoin
{
  return self->_nextJoinWhileDeferJoin;
}

- (void)setNextJoinWhileDeferJoin:(BOOL)a3
{
  self->_nextJoinWhileDeferJoin = a3;
}

- (BOOL)tdConfirmed
{
  return self->_tdConfirmed;
}

- (void)setTdConfirmed:(BOOL)a3
{
  self->_tdConfirmed = a3;
}

- (BOOL)isLastDecisionStateValid
{
  return self->_isLastDecisionStateValid;
}

- (void)setIsLastDecisionStateValid:(BOOL)a3
{
  self->_isLastDecisionStateValid = a3;
}

- (BOOL)isLastSuppressStateValid
{
  return self->_isLastSuppressStateValid;
}

- (void)setIsLastSuppressStateValid:(BOOL)a3
{
  self->_isLastSuppressStateValid = a3;
}

- (BOOL)isLastFastTdVotesValid
{
  return self->_isLastFastTdVotesValid;
}

- (void)setIsLastFastTdVotesValid:(BOOL)a3
{
  self->_isLastFastTdVotesValid = a3;
}

- ($F459DE10F772475887923C84DB189A08)last_DecisionState
{
  __int128 v3;

  v3 = *(_OWORD *)&self[391].var13;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[391].var0;
  *(_OWORD *)&retstr->var13 = v3;
  return self;
}

- (void)setLast_DecisionState:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var13;
  *(_OWORD *)&self->_last_DecisionState.decision_TxPER = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_last_DecisionState.appsUsingWiFi = v3;
}

- ($CA18CBBE7683B0106BED709705F86C47)last_SuppressState
{
  $06B5CD52C6C1251F2085B2FC3F10BF25 *p_last_SuppressState;
  uint64_t v3;
  unint64_t v4;
  $CA18CBBE7683B0106BED709705F86C47 result;

  p_last_SuppressState = &self->_last_SuppressState;
  v3 = *(_QWORD *)&self->_last_SuppressState.aggressiveTDEnabled;
  v4 = *(unsigned int *)&p_last_SuppressState->suppress_TTR | ((unint64_t)p_last_SuppressState->defer_roaming << 32);
  result.var8 = v4;
  result.var9 = BYTE1(v4);
  result.var10 = BYTE2(v4);
  result.var11 = BYTE3(v4);
  result.var12 = BYTE4(v4);
  result.var0 = v3;
  result.var1 = BYTE1(v3);
  result.var2 = BYTE2(v3);
  result.var3 = BYTE3(v3);
  result.var4 = BYTE4(v3);
  result.var5 = BYTE5(v3);
  result.var6 = BYTE6(v3);
  result.var7 = HIBYTE(v3);
  return result;
}

- (void)setLast_SuppressState:(id)a3
{
  self->_last_SuppressState = ($06B5CD52C6C1251F2085B2FC3F10BF25)a3;
}

- ($72F98887023D296F816C717954FA291A)last_FastTdVotes
{
  $82273F0F3EEBC739DF43245EDC9A2399 *p_last_FastTdVotes;
  unint64_t fastTD_voteCount;
  uint64_t v4;
  $72F98887023D296F816C717954FA291A result;

  p_last_FastTdVotes = &self->_last_FastTdVotes;
  fastTD_voteCount = self->_last_FastTdVotes.fastTD_voteCount;
  v4 = *(_QWORD *)&p_last_FastTdVotes->fastTD_vote_recommendation;
  result.var1 = v4;
  result.var2 = BYTE1(v4);
  result.var3 = BYTE2(v4);
  result.var4 = BYTE3(v4);
  result.var5 = BYTE4(v4);
  result.var6 = BYTE5(v4);
  result.var0 = fastTD_voteCount;
  return result;
}

- (void)setLast_FastTdVotes:(id)a3
{
  self->_last_FastTdVotes = ($82273F0F3EEBC739DF43245EDC9A2399)a3;
}

- (unint64_t)last_RSSIMode
{
  return self->_last_RSSIMode;
}

- (void)setLast_RSSIMode:(unint64_t)a3
{
  self->_last_RSSIMode = a3;
}

- (NSString)lastTdEval_StartedBy
{
  return self->_lastTdEval_StartedBy;
}

- (void)setLastTdEval_StartedBy:(id)a3
{
  objc_storeStrong((id *)&self->_lastTdEval_StartedBy, a3);
}

- (NSString)lastTdEval_EndedBy
{
  return self->_lastTdEval_EndedBy;
}

- (void)setLastTdEval_EndedBy:(id)a3
{
  objc_storeStrong((id *)&self->_lastTdEval_EndedBy, a3);
}

- (NSDate)lastTDEval_AlertedAt
{
  return self->_lastTDEval_AlertedAt;
}

- (void)setLastTDEval_AlertedAt:(id)a3
{
  objc_storeStrong((id *)&self->_lastTDEval_AlertedAt, a3);
}

- (NSDate)lastTDEval_ConfirmedAt
{
  return self->_lastTDEval_ConfirmedAt;
}

- (void)setLastTDEval_ConfirmedAt:(id)a3
{
  objc_storeStrong((id *)&self->_lastTDEval_ConfirmedAt, a3);
}

- (NSDate)lastTDEval_ExecutedAt
{
  return self->_lastTDEval_ExecutedAt;
}

- (void)setLastTDEval_ExecutedAt:(id)a3
{
  objc_storeStrong((id *)&self->_lastTDEval_ExecutedAt, a3);
}

- (double)lastTDEval_TDEvalDuration
{
  return self->_lastTDEval_TDEvalDuration;
}

- (void)setLastTDEval_TDEvalDuration:(double)a3
{
  self->_lastTDEval_TDEvalDuration = a3;
}

- (int64_t)lastTDEval_rssiAtTD
{
  return self->_lastTDEval_rssiAtTD;
}

- (void)setLastTDEval_rssiAtTD:(int64_t)a3
{
  self->_lastTDEval_rssiAtTD = a3;
}

- (double)lastTDEval_waitOnRoamStatusDuration
{
  return self->_lastTDEval_waitOnRoamStatusDuration;
}

- (void)setLastTDEval_waitOnRoamStatusDuration:(double)a3
{
  self->_lastTDEval_waitOnRoamStatusDuration = a3;
}

- (double)tdEvalDurationCumulative
{
  return self->_tdEvalDurationCumulative;
}

- (void)setTdEvalDurationCumulative:(double)a3
{
  self->_tdEvalDurationCumulative = a3;
}

- (unint64_t)waitOnRoamStatusDurationCumulative
{
  return self->_waitOnRoamStatusDurationCumulative;
}

- (void)setWaitOnRoamStatusDurationCumulative:(unint64_t)a3
{
  self->_waitOnRoamStatusDurationCumulative = a3;
}

- (NSString)nextJoinReason
{
  return self->_nextJoinReason;
}

- (void)setNextJoinReason:(id)a3
{
  objc_storeStrong((id *)&self->_nextJoinReason, a3);
}

- (BOOL)nextJoinIsSameSSID
{
  return self->_nextJoinIsSameSSID;
}

- (void)setNextJoinIsSameSSID:(BOOL)a3
{
  self->_nextJoinIsSameSSID = a3;
}

- (double)timeToNextJoin
{
  return self->_timeToNextJoin;
}

- (void)setTimeToNextJoin:(double)a3
{
  self->_timeToNextJoin = a3;
}

- (BOOL)nextLinkUpIsSameBSSID
{
  return self->_nextLinkUpIsSameBSSID;
}

- (void)setNextLinkUpIsSameBSSID:(BOOL)a3
{
  self->_nextLinkUpIsSameBSSID = a3;
}

- (int64_t)rssiAtNextLinkUp
{
  return self->_rssiAtNextLinkUp;
}

- (void)setRssiAtNextLinkUp:(int64_t)a3
{
  self->_rssiAtNextLinkUp = a3;
}

- (BOOL)tdRecommendAtNextLinkUp
{
  return self->_tdRecommendAtNextLinkUp;
}

- (void)setTdRecommendAtNextLinkUp:(BOOL)a3
{
  self->_tdRecommendAtNextLinkUp = a3;
}

- (int64_t)rssiAtJoin
{
  return self->_rssiAtJoin;
}

- (void)setRssiAtJoin:(int64_t)a3
{
  self->_rssiAtJoin = a3;
}

- (BOOL)tdRecommendAtJoin
{
  return self->_tdRecommendAtJoin;
}

- (void)setTdRecommendAtJoin:(BOOL)a3
{
  self->_tdRecommendAtJoin = a3;
}

- (double)timeSinceJoinATStart
{
  return self->_timeSinceJoinATStart;
}

- (void)setTimeSinceJoinATStart:(double)a3
{
  self->_timeSinceJoinATStart = a3;
}

- (int)sessionEndedBy
{
  return self->_sessionEndedBy;
}

- (void)setSessionEndedBy:(int)a3
{
  self->_sessionEndedBy = a3;
}

- (double)decision_TxPER_Duration
{
  return self->_decision_TxPER_Duration;
}

- (void)setDecision_TxPER_Duration:(double)a3
{
  self->_decision_TxPER_Duration = a3;
}

- (double)decision_FWTxPER_Duration
{
  return self->_decision_FWTxPER_Duration;
}

- (void)setDecision_FWTxPER_Duration:(double)a3
{
  self->_decision_FWTxPER_Duration = a3;
}

- (double)decision_BeaconPER_Duration
{
  return self->_decision_BeaconPER_Duration;
}

- (void)setDecision_BeaconPER_Duration:(double)a3
{
  self->_decision_BeaconPER_Duration = a3;
}

- (double)decision_GatewayARPFailure_Duration
{
  return self->_decision_GatewayARPFailure_Duration;
}

- (void)setDecision_GatewayARPFailure_Duration:(double)a3
{
  self->_decision_GatewayARPFailure_Duration = a3;
}

- (double)decision_SymptomsDNSError_Duration
{
  return self->_decision_SymptomsDNSError_Duration;
}

- (void)setDecision_SymptomsDNSError_Duration:(double)a3
{
  self->_decision_SymptomsDNSError_Duration = a3;
}

- (double)decision_AutoLeave_Duration
{
  return self->_decision_AutoLeave_Duration;
}

- (void)setDecision_AutoLeave_Duration:(double)a3
{
  self->_decision_AutoLeave_Duration = a3;
}

- (double)decision_ActiveProbe_Duration
{
  return self->_decision_ActiveProbe_Duration;
}

- (void)setDecision_ActiveProbe_Duration:(double)a3
{
  self->_decision_ActiveProbe_Duration = a3;
}

- (double)decision_FastTD_Duration
{
  return self->_decision_FastTD_Duration;
}

- (void)setDecision_FastTD_Duration:(double)a3
{
  self->_decision_FastTD_Duration = a3;
}

- (double)vote_FastTD_Recommendation_Duration
{
  return self->_vote_FastTD_Recommendation_Duration;
}

- (void)setVote_FastTD_Recommendation_Duration:(double)a3
{
  self->_vote_FastTD_Recommendation_Duration = a3;
}

- (double)vote_FastTD_TXPER_Duration
{
  return self->_vote_FastTD_TXPER_Duration;
}

- (void)setVote_FastTD_TXPER_Duration:(double)a3
{
  self->_vote_FastTD_TXPER_Duration = a3;
}

- (double)vote_FastTD_FWTxPER_Duration
{
  return self->_vote_FastTD_FWTxPER_Duration;
}

- (void)setVote_FastTD_FWTxPER_Duration:(double)a3
{
  self->_vote_FastTD_FWTxPER_Duration = a3;
}

- (double)vote_FastTD_BeaconPER_Duration
{
  return self->_vote_FastTD_BeaconPER_Duration;
}

- (void)setVote_FastTD_BeaconPER_Duration:(double)a3
{
  self->_vote_FastTD_BeaconPER_Duration = a3;
}

- (double)suppress_SymptomsNODataStall_Duration
{
  return self->_suppress_SymptomsNODataStall_Duration;
}

- (void)setSuppress_SymptomsNODataStall_Duration:(double)a3
{
  self->_suppress_SymptomsNODataStall_Duration = a3;
}

- (double)suppress_SymptomsAppPolicy_Duration
{
  return self->_suppress_SymptomsAppPolicy_Duration;
}

- (void)setSuppress_SymptomsAppPolicy_Duration:(double)a3
{
  self->_suppress_SymptomsAppPolicy_Duration = a3;
}

- (double)suppress_FastCheapCellular_Duration
{
  return self->_suppress_FastCheapCellular_Duration;
}

- (void)setSuppress_FastCheapCellular_Duration:(double)a3
{
  self->_suppress_FastCheapCellular_Duration = a3;
}

- (double)suppress_2dBGuard
{
  return self->_suppress_2dBGuard;
}

- (void)setSuppress_2dBGuard:(double)a3
{
  self->_suppress_2dBGuard = a3;
}

- (double)suppress_NoFgNetwApp_Duration
{
  return self->_suppress_NoFgNetwApp_Duration;
}

- (void)setSuppress_NoFgNetwApp_Duration:(double)a3
{
  self->_suppress_NoFgNetwApp_Duration = a3;
}

- (double)suppress_TTR_Duration
{
  return self->_suppress_TTR_Duration;
}

- (void)setSuppress_TTR_Duration:(double)a3
{
  self->_suppress_TTR_Duration = a3;
}

- (double)suppress_UserInput_Duration
{
  return self->_suppress_UserInput_Duration;
}

- (void)setSuppress_UserInput_Duration:(double)a3
{
  self->_suppress_UserInput_Duration = a3;
}

- (double)suppress_GoodAfterRoam_Duration
{
  return self->_suppress_GoodAfterRoam_Duration;
}

- (void)setSuppress_GoodAfterRoam_Duration:(double)a3
{
  self->_suppress_GoodAfterRoam_Duration = a3;
}

- (double)suppress_Roam_Duration
{
  return self->_suppress_Roam_Duration;
}

- (void)setSuppress_Roam_Duration:(double)a3
{
  self->_suppress_Roam_Duration = a3;
}

- (double)suppress_ActiveProbing
{
  return self->_suppress_ActiveProbing;
}

- (void)setSuppress_ActiveProbing:(double)a3
{
  self->_suppress_ActiveProbing = a3;
}

- (double)perCoreRSSI_NotUsed_Duration
{
  return self->_perCoreRSSI_NotUsed_Duration;
}

- (void)setPerCoreRSSI_NotUsed_Duration:(double)a3
{
  self->_perCoreRSSI_NotUsed_Duration = a3;
}

- (double)perCoreRSSI_Core0_Duration
{
  return self->_perCoreRSSI_Core0_Duration;
}

- (void)setPerCoreRSSI_Core0_Duration:(double)a3
{
  self->_perCoreRSSI_Core0_Duration = a3;
}

- (double)perCoreRSSI_Core1_Duration
{
  return self->_perCoreRSSI_Core1_Duration;
}

- (void)setPerCoreRSSI_Core1_Duration:(double)a3
{
  self->_perCoreRSSI_Core1_Duration = a3;
}

- (unint64_t)roamStatus_Succeeded_Count_WhileTDWait
{
  return self->_roamStatus_Succeeded_Count_WhileTDWait;
}

- (void)setRoamStatus_Succeeded_Count_WhileTDWait:(unint64_t)a3
{
  self->_roamStatus_Succeeded_Count_WhileTDWait = a3;
}

- (unint64_t)roamStatus_Failed_Count_WhileTDWait
{
  return self->_roamStatus_Failed_Count_WhileTDWait;
}

- (void)setRoamStatus_Failed_Count_WhileTDWait:(unint64_t)a3
{
  self->_roamStatus_Failed_Count_WhileTDWait = a3;
}

- (unint64_t)roamStatus_FailedFilteredOut_Count_WhileTDWait
{
  return self->_roamStatus_FailedFilteredOut_Count_WhileTDWait;
}

- (void)setRoamStatus_FailedFilteredOut_Count_WhileTDWait:(unint64_t)a3
{
  self->_roamStatus_FailedFilteredOut_Count_WhileTDWait = a3;
}

- (unint64_t)roamStatus_FailedNotFound_Count_WhileTDWait
{
  return self->_roamStatus_FailedNotFound_Count_WhileTDWait;
}

- (void)setRoamStatus_FailedNotFound_Count_WhileTDWait:(unint64_t)a3
{
  self->_roamStatus_FailedNotFound_Count_WhileTDWait = a3;
}

- (unint64_t)roamStatus_Succeeded_Count_BeforeTDWait
{
  return self->_roamStatus_Succeeded_Count_BeforeTDWait;
}

- (void)setRoamStatus_Succeeded_Count_BeforeTDWait:(unint64_t)a3
{
  self->_roamStatus_Succeeded_Count_BeforeTDWait = a3;
}

- (unint64_t)roamStatus_Failed_Count_BeforeTDWait
{
  return self->_roamStatus_Failed_Count_BeforeTDWait;
}

- (void)setRoamStatus_Failed_Count_BeforeTDWait:(unint64_t)a3
{
  self->_roamStatus_Failed_Count_BeforeTDWait = a3;
}

- (unint64_t)roamStatus_FailedFilteredOut_Count_BeforeTDWait
{
  return self->_roamStatus_FailedFilteredOut_Count_BeforeTDWait;
}

- (void)setRoamStatus_FailedFilteredOut_Count_BeforeTDWait:(unint64_t)a3
{
  self->_roamStatus_FailedFilteredOut_Count_BeforeTDWait = a3;
}

- (unint64_t)roamStatus_FailedNotFound_Count_BeforeTDWait
{
  return self->_roamStatus_FailedNotFound_Count_BeforeTDWait;
}

- (void)setRoamStatus_FailedNotFound_Count_BeforeTDWait:(unint64_t)a3
{
  self->_roamStatus_FailedNotFound_Count_BeforeTDWait = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextJoinReason, 0);
  objc_storeStrong((id *)&self->_lastTDEval_ExecutedAt, 0);
  objc_storeStrong((id *)&self->_lastTDEval_ConfirmedAt, 0);
  objc_storeStrong((id *)&self->_lastTDEval_AlertedAt, 0);
  objc_storeStrong((id *)&self->_lastTdEval_EndedBy, 0);
  objc_storeStrong((id *)&self->_lastTdEval_StartedBy, 0);
  objc_storeStrong((id *)&self->_lastSuppressAt, 0);
  objc_storeStrong((id *)&self->_lastFastTDVotesAt, 0);
  objc_storeStrong((id *)&self->_lastDecisionAt, 0);
  objc_storeStrong((id *)&self->_ssidAtTD, 0);
  objc_storeStrong((id *)&self->_bssidAtTD, 0);
  objc_storeStrong((id *)&self->_lastLinkDownAt, 0);
  objc_storeStrong((id *)&self->_lastJoinAt, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_endSessionTimer, 0);
}

- (void)linkStateDidChange:(uint64_t)a1 isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:.cold.1(uint64_t a1)
{
  void *v2;
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[WiFiUsageSession disconnectReasonString:](WiFiUsageSession, "disconnectReasonString:", 1000);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 136315650;
  v4 = "-[WiFiUsagePoorLinkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:]";
  v5 = 2112;
  v6 = a1;
  v7 = 2112;
  v8 = v2;
  _os_log_error_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s on %@ - Unexpected ifDown due to %@ while session is inactive", (uint8_t *)&v3, 0x20u);

}

@end
