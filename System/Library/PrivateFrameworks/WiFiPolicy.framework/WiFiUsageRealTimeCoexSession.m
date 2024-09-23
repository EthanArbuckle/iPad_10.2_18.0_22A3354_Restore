@implementation WiFiUsageRealTimeCoexSession

- (void)setRealtimeCoexStarted:(BOOL)a3 type:(unint64_t)a4 reasons:(id)a5
{
  _BOOL4 v6;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSString *v14;
  NSString *rtCoexSubType;
  id v16;

  v6 = a3;
  v16 = a5;
  if (-[WiFiUsageSession isSessionActive](self, "isSessionActive") && !v6)
  {
    -[WiFiUsageSession sessionName](self, "sessionName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s - %@ session ended"), "-[WiFiUsageRealTimeCoexSession setRealtimeCoexStarted:type:reasons:]", v8);

    -[WiFiUsageSession sessionDidEnd](self, "sessionDidEnd");
  }
  if (v6)
  {
    v9 = -[WiFiUsageSession isSessionActive](self, "isSessionActive");
    -[WiFiUsageSession sessionName](self, "sessionName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[WiFiUsagePrivacyFilter getLabelForRTCoexType:](WiFiUsagePrivacyFilter, "getLabelForRTCoexType:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "componentsJoinedByString:", CFSTR("&"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v9)
    {
      NSLog(CFSTR("%s - %@ session already active (%@:%@)"), "-[WiFiUsageRealTimeCoexSession setRealtimeCoexStarted:type:reasons:]", v10, v11, v12);

    }
    else
    {
      NSLog(CFSTR("%s - %@ session started for %@ (%@)"), "-[WiFiUsageRealTimeCoexSession setRealtimeCoexStarted:type:reasons:]", v10, v11, v12);

      self->_rtCoexType = a4;
      objc_msgSend(v16, "componentsJoinedByString:", CFSTR("&"));
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      rtCoexSubType = self->_rtCoexSubType;
      self->_rtCoexSubType = v14;

      -[WiFiUsageRealTimeCoexSession sessionDidStart](self, "sessionDidStart");
    }
  }

}

- (void)setSteeringRequest:(unint64_t)a3 preferredChannel:(unint64_t)a4 preferredBand:(int)a5 preferredSSID:(id)a6 targetSSIDDiffersFromCurrent:(BOOL)a7 preferredBSS:(id)a8 ssidIsSplit:(BOOL)a9 transitionCandidates:(BOOL)a10
{
  _BOOL4 v11;
  uint64_t v12;
  NSString *v15;
  NSString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  NSString *lastRequestPreferredSSID;
  NSString *v24;
  NSString *lastRequestPreferredBSS;
  uint64_t v26;
  BOOL v28;

  v11 = a7;
  v12 = *(_QWORD *)&a5;
  v15 = (NSString *)a6;
  v16 = (NSString *)a8;
  +[WiFiUsagePrivacyFilter getLabelForSteeringRequest:](WiFiUsagePrivacyFilter, "getLabelForSteeringRequest:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:", v12);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  v20 = CFSTR("NO");
  v28 = v11;
  if (v11)
    v21 = CFSTR("YES");
  else
    v21 = CFSTR("NO");
  if (a9)
    v22 = CFSTR("YES");
  else
    v22 = CFSTR("NO");
  if (a10)
    v20 = CFSTR("YES");
  NSLog(CFSTR("%s - type:'%@'(%lu) preferredChannel:%lu preferredBand:%@ preferredSSID:%@ isDifferentSSID:%@ preferredBSS:%@ isSplitSSID:%@ hasCandidates:%@"), "-[WiFiUsageRealTimeCoexSession setSteeringRequest:preferredChannel:preferredBand:preferredSSID:targetSSIDDiffersFromCurrent:preferredBSS:ssidIsSplit:transitionCandidates:]", v17, a3, a4, v18, v15, v21, v16, v22, v20);

  self->_lastRequestType = a3;
  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
    self->_lastRequestPreferredChannel = a4;
  if ((_DWORD)v12 != 3)
    self->_lastRequestPreferredBand = v12;
  lastRequestPreferredSSID = self->_lastRequestPreferredSSID;
  self->_lastRequestPreferredSSID = v15;
  v24 = v15;

  self->_lastRequestDifferentSSID = v28;
  lastRequestPreferredBSS = self->_lastRequestPreferredBSS;
  self->_lastRequestPreferredBSS = v16;

  self->_isSplitSSID = a9;
  self->_hasCandidates = a10;
  if (a3 <= 2)
  {
    v26 = *off_1E881E9B8[a3];
    ++*(Class *)((char *)&self->super.super.isa + v26);
  }
}

- (void)updateRtCoexInOptimalDuration:(BOOL)a3
{
  BOOL v3;
  double v5;
  id v6;

  if (self->_lastRtCoexOptimalStatusChange)
    v3 = !a3;
  else
    v3 = 1;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", self->_lastRtCoexOptimalStatusChange);
    self->_rtCoexInOptimalDuration = v5 + self->_rtCoexInOptimalDuration;

  }
}

- (void)setRealTimeCoexStatus:(BOOL)a3 type:(unint64_t)a4
{
  _BOOL8 v5;
  void *v7;
  BOOL v8;
  BOOL v9;
  objc_super v10;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((!self->_lastRtCoexOptimalStatusChange || self->_isRtCoexOptimal && !v5)
    && (-[WiFiUsageRealTimeCoexSession updateRtCoexInOptimalDuration:](self, "updateRtCoexInOptimalDuration:", v5),
        -[WiFiUsageRealTimeCoexSession setLastRtCoexOptimalStatusChange:](self, "setLastRtCoexOptimalStatusChange:", v7),
        !self->_lastRtCoexOptimalStatusChange)
    || (!self->_isRtCoexOptimal ? (v8 = !v5) : (v8 = 1), !v8))
  {
    -[WiFiUsageRealTimeCoexSession setLastRtCoexOptimalStatusChange:](self, "setLastRtCoexOptimalStatusChange:", v7);
  }
  self->_isRtCoexOptimal = v5;
  if (self->_firstRtCoexOptimal)
    v9 = 1;
  else
    v9 = !v5;
  if (!v9)
    objc_storeStrong((id *)&self->_firstRtCoexOptimal, v7);
  v10.receiver = self;
  v10.super_class = (Class)WiFiUsageRealTimeCoexSession;
  -[WiFiUsageSession setRealTimeCoexStatus:type:](&v10, sel_setRealTimeCoexStatus_type_, v5, a4);

}

- (void)linkStateDidChange:(BOOL)a3 isInvoluntary:(BOOL)a4 linkChangeReason:(int64_t)a5 linkChangeSubreason:(int64_t)a6 withNetworkDetails:(id)a7
{
  _BOOL8 v9;
  _BOOL8 v10;
  void *v12;
  id v13;
  void *v14;
  objc_super v15;

  v9 = a4;
  v10 = a3;
  v12 = (void *)MEMORY[0x1E0C99D68];
  v13 = a7;
  objc_msgSend(v12, "now");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageRealTimeCoexSession updatePreferredChannelAndBandUsageWithReferenceDate:](self, "updatePreferredChannelAndBandUsageWithReferenceDate:", v14);
  v15.receiver = self;
  v15.super_class = (Class)WiFiUsageRealTimeCoexSession;
  -[WiFiUsageSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:](&v15, sel_linkStateDidChange_isInvoluntary_linkChangeReason_linkChangeSubreason_withNetworkDetails_, v10, v9, a5, a6, v13);

  -[WiFiUsageRealTimeCoexSession setPreferredChannelAndBandUsageWithReferenceDate:](self, "setPreferredChannelAndBandUsageWithReferenceDate:", v14);
}

- (void)joinStateDidChange:(id)a3 withReason:(unint64_t)a4 lastDisconnectReason:(int64_t)a5 lastJoinFailure:(int64_t)a6 andNetworkDetails:(id)a7
{
  id v12;
  id v13;
  NSDate *v14;
  NSDate *firstSSIDTransition;
  NSDate *v16;
  NSDate *firstManualJoin;
  NSDate *v18;
  objc_super v19;

  v12 = a3;
  v13 = a7;
  if (v12 && a4 == 12)
  {
    if (!self->_firstSSIDTransition)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
      firstSSIDTransition = self->_firstSSIDTransition;
      self->_firstSSIDTransition = v14;
LABEL_12:

    }
  }
  else if (v12 && a4 == 2)
  {
    if (!self->_firstManualJoin)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v16 = (NSDate *)objc_claimAutoreleasedReturnValue();
      firstManualJoin = self->_firstManualJoin;
      self->_firstManualJoin = v16;

    }
    if (self->_firstSSIDTransition && !self->_firstManualJoinAfterSSIDTransition)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v18 = (NSDate *)objc_claimAutoreleasedReturnValue();
      firstSSIDTransition = self->_firstManualJoinAfterSSIDTransition;
      self->_firstManualJoinAfterSSIDTransition = v18;
      goto LABEL_12;
    }
  }
  NSLog(CFSTR("%s - firstSSIDTransition:%@ firstManualJoinAfterSSIDTransition:%@ firstManualJoin:%@"), "-[WiFiUsageRealTimeCoexSession joinStateDidChange:withReason:lastDisconnectReason:lastJoinFailure:andNetworkDetails:]", self->_firstSSIDTransition, self->_firstManualJoinAfterSSIDTransition, self->_firstManualJoin);
  v19.receiver = self;
  v19.super_class = (Class)WiFiUsageRealTimeCoexSession;
  -[WiFiUsageSession joinStateDidChange:withReason:lastDisconnectReason:lastJoinFailure:andNetworkDetails:](&v19, sel_joinStateDidChange_withReason_lastDisconnectReason_lastJoinFailure_andNetworkDetails_, v12, a4, a5, a6, v13);

}

- (void)processIPv4Changes:(id)a3
{
  id v4;
  void *v5;
  NSDate *v6;
  NSDate *firstIPUpdateAfterSSIDTransition;
  void *v8;
  objc_super v9;
  objc_super v10;

  v4 = a3;
  if (-[WiFiUsageSession lastJoinReason](self, "lastJoinReason") == 12)
  {
    -[WiFiUsageSession ipV4Details](self, "ipV4Details");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_hasDifferentIpv4DetailsAfterSSIDTransition = objc_msgSend(v5, "isEqual:", v4) ^ 1;

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    firstIPUpdateAfterSSIDTransition = self->_firstIPUpdateAfterSSIDTransition;
    self->_firstIPUpdateAfterSSIDTransition = v6;

  }
  v10.receiver = self;
  v10.super_class = (Class)WiFiUsageRealTimeCoexSession;
  objc_msgSend(-[WiFiUsageRealTimeCoexSession class](&v10, sel_class), "joinReasonString:", -[WiFiUsageSession lastJoinReason](self, "lastJoinReason"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%s - lastJoinReason:%@ firstIPUpdateAfterSSIDTransition:%@"), "-[WiFiUsageRealTimeCoexSession processIPv4Changes:]", v8, self->_firstIPUpdateAfterSSIDTransition);

  v9.receiver = self;
  v9.super_class = (Class)WiFiUsageRealTimeCoexSession;
  -[WiFiUsageSession processIPv4Changes:](&v9, sel_processIPv4Changes_, v4);

}

- (void)processIPv6Changes:(id)a3
{
  id v4;
  void *v5;
  NSDate *v6;
  NSDate *firstIPUpdateAfterSSIDTransition;
  void *v8;
  objc_super v9;
  objc_super v10;

  v4 = a3;
  if (-[WiFiUsageSession lastJoinReason](self, "lastJoinReason") == 12)
  {
    -[WiFiUsageSession ipV6Details](self, "ipV6Details");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_hasDifferentIpv6DetailsAfterSSIDTransition = objc_msgSend(v5, "isEqual:", v4) ^ 1;

  }
  if (!self->_firstIPUpdateAfterSSIDTransition)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    firstIPUpdateAfterSSIDTransition = self->_firstIPUpdateAfterSSIDTransition;
    self->_firstIPUpdateAfterSSIDTransition = v6;

    v10.receiver = self;
    v10.super_class = (Class)WiFiUsageRealTimeCoexSession;
    objc_msgSend(-[WiFiUsageRealTimeCoexSession class](&v10, sel_class), "joinReasonString:", -[WiFiUsageSession lastJoinReason](self, "lastJoinReason"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s - lastJoinReason:%@ firstIPUpdateAfterSSIDTransition:%@"), "-[WiFiUsageRealTimeCoexSession processIPv6Changes:]", v8, self->_firstIPUpdateAfterSSIDTransition);

  }
  v9.receiver = self;
  v9.super_class = (Class)WiFiUsageRealTimeCoexSession;
  -[WiFiUsageSession processIPv6Changes:](&v9, sel_processIPv6Changes_, v4);

}

- (void)summarizeSession
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageRealTimeCoexSession updateRtCoexInOptimalDuration:](self, "updateRtCoexInOptimalDuration:", self->_isRtCoexOptimal);
  -[WiFiUsageRealTimeCoexSession updatePreferredChannelAndBandUsageWithReferenceDate:](self, "updatePreferredChannelAndBandUsageWithReferenceDate:", v3);
  -[WiFiUsageRealTimeCoexSession setPreferredChannelAndBandUsageWithReferenceDate:](self, "setPreferredChannelAndBandUsageWithReferenceDate:", v3);
  v4.receiver = self;
  v4.super_class = (Class)WiFiUsageRealTimeCoexSession;
  -[WiFiUsageSession summarizeSession](&v4, sel_summarizeSession);

}

- (id)eventDictionary:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSDate *firstSSIDTransition;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSDate *firstManualJoin;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int lastRequestPreferredBand;
  void *v28;
  void *v29;
  void *v30;
  double preferredBandDuration;
  double v32;
  void *v33;
  void *v34;
  double preferredChannelDuration;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSString *lastRequestPreferredSSID;
  void *v42;
  void *v43;
  void *v44;
  NSString *lastRequestPreferredBSS;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _BOOL8 v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSDate *firstRtCoexOptimal;
  void *v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  double v62;
  void *v63;
  double rtCoexInOptimalDuration;
  double v65;
  void *v66;
  void *v67;
  id v68;
  objc_super v70;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v70.receiver = self;
  v70.super_class = (Class)WiFiUsageRealTimeCoexSession;
  -[WiFiUsageSession eventDictionary:](&v70, sel_eventDictionary_, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    firstSSIDTransition = self->_firstSSIDTransition;
    -[WiFiUsageSession sessionStartTime](self, "sessionStartTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDate timeIntervalSinceDate:](firstSSIDTransition, "timeIntervalSinceDate:", v8);
    v10 = v9;

    -[NSDate timeIntervalSinceDate:](self->_firstIPUpdateAfterSSIDTransition, "timeIntervalSinceDate:", self->_firstSSIDTransition);
    v12 = v11;
    firstManualJoin = self->_firstManualJoin;
    -[WiFiUsageSession sessionStartTime](self, "sessionStartTime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDate timeIntervalSinceDate:](firstManualJoin, "timeIntervalSinceDate:", v14);
    v16 = v15;

    -[NSDate timeIntervalSinceDate:](self->_firstManualJoinAfterSSIDTransition, "timeIntervalSinceDate:", self->_firstSSIDTransition);
    v18 = v17;
    +[WiFiUsagePrivacyFilter getLabelForRTCoexType:](WiFiUsagePrivacyFilter, "getLabelForRTCoexType:", self->_rtCoexType);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, CFSTR("coexSessionTrigger"));

    objc_msgSend(v6, "setObject:forKeyedSubscript:", self->_rtCoexSubType, CFSTR("coexSessionReason"));
    +[WiFiUsagePrivacyFilter getLabelForSteeringRequest:](WiFiUsagePrivacyFilter, "getLabelForSteeringRequest:", self->_lastRequestType);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("coexSteeringLastRequestType"));

    if (self->_firstSSIDTransition)
    {
      +[WiFiUsagePrivacyFilter getBinTimeInterval:As:](WiFiUsagePrivacyFilter, "getBinTimeInterval:As:", 1, v10);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, CFSTR("timeToSSIDTransition"));

    }
    if (self->_firstIPUpdateAfterSSIDTransition)
    {
      +[WiFiUsagePrivacyFilter getBinTimeInterval:As:](WiFiUsagePrivacyFilter, "getBinTimeInterval:As:", 1, v12);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v22, CFSTR("timeToCompleteDHCP"));

    }
    if (self->_firstManualJoin)
    {
      +[WiFiUsagePrivacyFilter getBinTimeInterval:As:](WiFiUsagePrivacyFilter, "getBinTimeInterval:As:", 1, v16);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v23, CFSTR("timeToManualJoinAttempt"));

    }
    if (self->_firstManualJoinAfterSSIDTransition)
    {
      +[WiFiUsagePrivacyFilter getBinTimeInterval:As:](WiFiUsagePrivacyFilter, "getBinTimeInterval:As:", 1, v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, CFSTR("timeSSIDTransitionToManualJoinAttempt"));

    }
    if (self->_lastRequestPreferredBand != 3)
    {
      +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v25, CFSTR("coexSteeringRequestLastPreferredBand"));

      v26 = (void *)MEMORY[0x1E0CB37E8];
      lastRequestPreferredBand = self->_lastRequestPreferredBand;
      -[WiFiUsageSession networkDetails](self, "networkDetails");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "connectedBss");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "numberWithBool:", lastRequestPreferredBand == objc_msgSend(v29, "band"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v30, CFSTR("bandAtEndIsTargetBand"));

      preferredBandDuration = self->_preferredBandDuration;
      -[WiFiUsageSession sessionDuration](self, "sessionDuration");
      +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", preferredBandDuration, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v33, CFSTR("durationOnPreferredBandPerc"));

      if (self->_lastRequestPreferredChannel != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WiFiUsageRealTimeCoexSession isCurrentChannelPreferredChannel](self, "isCurrentChannelPreferredChannel"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v34, CFSTR("channelAtEndIsTargetChannel"));

        preferredChannelDuration = self->_preferredChannelDuration;
        -[WiFiUsageSession sessionDuration](self, "sessionDuration");
        +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", preferredChannelDuration, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v37, CFSTR("durationOnPreferredChannelPerc"));

      }
    }
    if (self->_lastRequestType != 3)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_lastRequestPreferredSSID != 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v38, CFSTR("coexSteeringLastRequestHasPreferredSSID"));

      if (self->_lastRequestPreferredSSID)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_lastRequestDifferentSSID);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v39, CFSTR("coexSteeringLastRequestPreferredSSIDDiffers"));

        v40 = (void *)MEMORY[0x1E0CB37E8];
        lastRequestPreferredSSID = self->_lastRequestPreferredSSID;
        -[WiFiUsageSession networkDetails](self, "networkDetails");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "networkName");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "numberWithBool:", -[NSString isEqualToString:](lastRequestPreferredSSID, "isEqualToString:", v43));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v44, CFSTR("ssidAtEndIsTargetSSID"));

      }
      lastRequestPreferredBSS = self->_lastRequestPreferredBSS;
      if (lastRequestPreferredBSS)
      {
        v46 = (void *)MEMORY[0x1E0CB37E8];
        -[WiFiUsageSession networkDetails](self, "networkDetails");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "connectedBss");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "bssid");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "numberWithBool:", -[NSString isEqualToString:](lastRequestPreferredBSS, "isEqualToString:", v49));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v50, CFSTR("bssAtEndIsTargetBSS"));

        v51 = self->_lastRequestPreferredBSS != 0;
      }
      else
      {
        v51 = 0;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v52, CFSTR("coexSteeringLastRequestHasPreferredBSS"));

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_requestSteerToPreferredChannelCount);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v53, CFSTR("requestSteerToPreferredChannelCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_requestSteerCount);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v54, CFSTR("requestSteerCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_requestDisconnectCount);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v55, CFSTR("requestDisconnect"));

    firstRtCoexOptimal = self->_firstRtCoexOptimal;
    if (firstRtCoexOptimal)
    {
      -[WiFiUsageSession sessionStartTime](self, "sessionStartTime");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDate timeIntervalSinceDate:](firstRtCoexOptimal, "timeIntervalSinceDate:", v57);
      v59 = v58;

      +[WiFiUsagePrivacyFilter getBinFor:In:WithLowestEdge:As:](WiFiUsagePrivacyFilter, "getBinFor:In:WithLowestEdge:As:", (unint64_t)v59, &unk_1E88641D8, CFSTR("0"), 1);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v60, CFSTR("timeToOptimalCoex"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v59);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v61, CFSTR("timeToOptimalCoex_raw"));

      -[WiFiUsageSession sessionDuration](self, "sessionDuration");
      +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", v59, v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v63, CFSTR("timeToOptimalCoexPercSession"));

      rtCoexInOptimalDuration = self->_rtCoexInOptimalDuration;
      -[WiFiUsageSession sessionDuration](self, "sessionDuration");
      +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", rtCoexInOptimalDuration, v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v66, CFSTR("inOptimalCoexPercSession"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_rtCoexInOptimalDuration);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v67, CFSTR("inOptimalCoexDuration"));

    }
    v68 = v6;
  }

  return v6;
}

- (id)eventDictionaryByBand:(int)a3 isFirst:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v10.receiver = self;
  v10.super_class = (Class)WiFiUsageRealTimeCoexSession;
  -[WiFiUsageSession eventDictionaryByBand:isFirst:](&v10, sel_eventDictionaryByBand_isFirst_, *(_QWORD *)&a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WiFiUsageRealTimeCoexSession eventDictionary:](self, "eventDictionary:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEntriesFromDictionary:", v8);

  return v7;
}

- (WiFiUsageRealTimeCoexSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WiFiUsageRealTimeCoexSession;
  return -[WiFiUsageSession initWithSessionType:andInterfaceName:andCapabilities:](&v5, sel_initWithSessionType_andInterfaceName_andCapabilities_, 8, a3, a4);
}

- (void)sessionDidStart
{
  NSString *lastRequestPreferredSSID;
  NSString *lastRequestPreferredBSS;
  NSDate *firstRtCoexOptimal;
  NSDate *lastRtCoexOptimalStatusChange;
  NSDate *lastEnterPreferredChannel;
  NSDate *lastEnterPreferredBand;
  NSDate *firstSSIDTransition;
  NSDate *firstManualJoin;
  NSDate *firstManualJoinAfterSSIDTransition;
  NSDate *firstIPUpdateAfterSSIDTransition;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WiFiUsageRealTimeCoexSession;
  -[WiFiUsageSession sessionDidStart](&v13, sel_sessionDidStart);
  self->_lastRequestType = 3;
  self->_lastRequestPreferredChannel = 0x7FFFFFFFFFFFFFFFLL;
  self->_lastRequestPreferredBand = 3;
  lastRequestPreferredSSID = self->_lastRequestPreferredSSID;
  self->_lastRequestPreferredSSID = 0;

  self->_lastRequestDifferentSSID = 0;
  lastRequestPreferredBSS = self->_lastRequestPreferredBSS;
  self->_lastRequestPreferredBSS = 0;

  self->_isSplitSSID = 0;
  self->_hasCandidates = 0;
  self->_isRtCoexOptimal = 1;
  firstRtCoexOptimal = self->_firstRtCoexOptimal;
  self->_firstRtCoexOptimal = 0;

  lastRtCoexOptimalStatusChange = self->_lastRtCoexOptimalStatusChange;
  self->_lastRtCoexOptimalStatusChange = 0;

  self->_rtCoexInOptimalDuration = 0.0;
  self->_requestSteerToPreferredChannelCount = 0;
  self->_requestSteerCount = 0;
  self->_requestDisconnectCount = 0;
  lastEnterPreferredChannel = self->_lastEnterPreferredChannel;
  self->_lastEnterPreferredChannel = 0;

  self->_preferredChannelDuration = 0.0;
  lastEnterPreferredBand = self->_lastEnterPreferredBand;
  self->_lastEnterPreferredBand = 0;

  self->_preferredBandDuration = 0.0;
  firstSSIDTransition = self->_firstSSIDTransition;
  self->_firstSSIDTransition = 0;

  firstManualJoin = self->_firstManualJoin;
  self->_firstManualJoin = 0;

  firstManualJoinAfterSSIDTransition = self->_firstManualJoinAfterSSIDTransition;
  self->_firstManualJoinAfterSSIDTransition = 0;

  firstIPUpdateAfterSSIDTransition = self->_firstIPUpdateAfterSSIDTransition;
  self->_firstIPUpdateAfterSSIDTransition = 0;

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  id *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WiFiUsageRealTimeCoexSession;
  v4 = -[WiFiUsageSession copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    v4[1493] = (id)self->_rtCoexType;
    objc_storeStrong(v4 + 1494, self->_rtCoexSubType);
    v5[1495] = (id)self->_lastRequestType;
    v5[1496] = (id)self->_lastRequestPreferredChannel;
    *((_DWORD *)v5 + 2984) = self->_lastRequestPreferredBand;
    objc_storeStrong(v5 + 1497, self->_lastRequestPreferredSSID);
    objc_storeStrong(v5 + 1498, self->_lastRequestPreferredBSS);
    *((_BYTE *)v5 + 11929) = self->_isSplitSSID;
    *((_BYTE *)v5 + 11930) = self->_hasCandidates;
    *((_BYTE *)v5 + 11933) = self->_isRtCoexOptimal;
    objc_storeStrong(v5 + 1499, self->_firstRtCoexOptimal);
    objc_storeStrong(v5 + 1500, self->_lastRtCoexOptimalStatusChange);
    v5[1501] = *(id *)&self->_rtCoexInOptimalDuration;
    v5[1510] = (id)self->_requestSteerToPreferredChannelCount;
    v5[1511] = (id)self->_requestSteerCount;
    v5[1512] = (id)self->_requestDisconnectCount;
    objc_storeStrong(v5 + 1502, self->_lastEnterPreferredChannel);
    v5[1503] = *(id *)&self->_preferredChannelDuration;
    objc_storeStrong(v5 + 1504, self->_lastEnterPreferredBand);
    v5[1505] = *(id *)&self->_preferredBandDuration;
    objc_storeStrong(v5 + 1506, self->_firstSSIDTransition);
    objc_storeStrong(v5 + 1507, self->_firstIPUpdateAfterSSIDTransition);
    objc_storeStrong(v5 + 1508, self->_firstManualJoin);
    objc_storeStrong(v5 + 1509, self->_firstManualJoinAfterSSIDTransition);
    v6 = v5;
  }

  return v5;
}

- (id)metricName
{
  return CFSTR("com.apple.wifi.InfraRealTimeCoexSession");
}

- (BOOL)isCurrentChannelPreferredChannel
{
  unint64_t lastRequestPreferredChannel;
  BOOL v4;
  void *v5;
  void *v6;
  int lastRequestPreferredBand;
  void *v8;
  void *v9;

  if (self->_lastRequestPreferredBand == 3)
    return 0;
  lastRequestPreferredChannel = self->_lastRequestPreferredChannel;
  if (lastRequestPreferredChannel == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  -[WiFiUsageSession networkDetails](self, "networkDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connectedBss");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (lastRequestPreferredChannel == objc_msgSend(v6, "channel"))
  {
    lastRequestPreferredBand = self->_lastRequestPreferredBand;
    -[WiFiUsageSession networkDetails](self, "networkDetails");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "connectedBss");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = lastRequestPreferredBand == objc_msgSend(v9, "band");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isCurrentBandPreferredBand
{
  int lastRequestPreferredBand;
  BOOL v3;
  void *v4;
  void *v5;

  lastRequestPreferredBand = self->_lastRequestPreferredBand;
  if (lastRequestPreferredBand == 3)
    return 0;
  -[WiFiUsageSession networkDetails](self, "networkDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectedBss");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = lastRequestPreferredBand == objc_msgSend(v5, "band");

  return v3;
}

- (void)updateAssociatedNetworkDetails:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageRealTimeCoexSession updatePreferredChannelAndBandUsageWithReferenceDate:](self, "updatePreferredChannelAndBandUsageWithReferenceDate:", v6);
  v7.receiver = self;
  v7.super_class = (Class)WiFiUsageRealTimeCoexSession;
  -[WiFiUsageSession updateAssociatedNetworkDetails:](&v7, sel_updateAssociatedNetworkDetails_, v5);

  -[WiFiUsageRealTimeCoexSession setPreferredChannelAndBandUsageWithReferenceDate:](self, "setPreferredChannelAndBandUsageWithReferenceDate:", v6);
}

- (void)updatePreferredChannelAndBandUsageWithReferenceDate:(id)a3
{
  double v4;
  NSDate *lastEnterPreferredChannel;
  double v6;
  NSDate *lastEnterPreferredBand;
  id v8;

  v8 = a3;
  if (-[WiFiUsageRealTimeCoexSession isCurrentChannelPreferredChannel](self, "isCurrentChannelPreferredChannel")
    && self->_lastEnterPreferredChannel)
  {
    objc_msgSend(v8, "timeIntervalSinceDate:");
    self->_preferredChannelDuration = v4 + self->_preferredChannelDuration;
    lastEnterPreferredChannel = self->_lastEnterPreferredChannel;
    self->_lastEnterPreferredChannel = 0;

  }
  if (-[WiFiUsageRealTimeCoexSession isCurrentBandPreferredBand](self, "isCurrentBandPreferredBand")
    && self->_lastEnterPreferredBand)
  {
    objc_msgSend(v8, "timeIntervalSinceDate:");
    self->_preferredBandDuration = v6 + self->_preferredBandDuration;
    lastEnterPreferredBand = self->_lastEnterPreferredBand;
    self->_lastEnterPreferredBand = 0;

  }
}

- (void)setPreferredChannelAndBandUsageWithReferenceDate:(id)a3
{
  id v5;

  v5 = a3;
  if (-[WiFiUsageRealTimeCoexSession isCurrentChannelPreferredChannel](self, "isCurrentChannelPreferredChannel"))
    objc_storeStrong((id *)&self->_lastEnterPreferredChannel, a3);
  if (-[WiFiUsageRealTimeCoexSession isCurrentBandPreferredBand](self, "isCurrentBandPreferredBand"))
    objc_storeStrong((id *)&self->_lastEnterPreferredBand, a3);

}

- (BOOL)infraIsPartOfSplitSSID
{
  return -[WiFiUsageSession bandAtSessionStart](self, "bandAtSessionStart") == 2 && self->_isSplitSSID;
}

- (unint64_t)rtCoexType
{
  return self->_rtCoexType;
}

- (void)setRtCoexType:(unint64_t)a3
{
  self->_rtCoexType = a3;
}

- (NSString)rtCoexSubType
{
  return (NSString *)objc_getProperty(self, a2, 11952, 1);
}

- (void)setRtCoexSubType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 11952);
}

- (unint64_t)lastRequestType
{
  return self->_lastRequestType;
}

- (void)setLastRequestType:(unint64_t)a3
{
  self->_lastRequestType = a3;
}

- (unint64_t)lastRequestPreferredChannel
{
  return self->_lastRequestPreferredChannel;
}

- (void)setLastRequestPreferredChannel:(unint64_t)a3
{
  self->_lastRequestPreferredChannel = a3;
}

- (int)lastRequestPreferredBand
{
  return self->_lastRequestPreferredBand;
}

- (void)setLastRequestPreferredBand:(int)a3
{
  self->_lastRequestPreferredBand = a3;
}

- (BOOL)lastRequestDifferentSSID
{
  return self->_lastRequestDifferentSSID;
}

- (void)setLastRequestDifferentSSID:(BOOL)a3
{
  self->_lastRequestDifferentSSID = a3;
}

- (NSString)lastRequestPreferredSSID
{
  return (NSString *)objc_getProperty(self, a2, 11976, 1);
}

- (void)setLastRequestPreferredSSID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 11976);
}

- (NSString)lastRequestPreferredBSS
{
  return (NSString *)objc_getProperty(self, a2, 11984, 1);
}

- (void)setLastRequestPreferredBSS:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 11984);
}

- (BOOL)isSplitSSID
{
  return self->_isSplitSSID;
}

- (void)setIsSplitSSID:(BOOL)a3
{
  self->_isSplitSSID = a3;
}

- (BOOL)hasCandidates
{
  return self->_hasCandidates;
}

- (void)setHasCandidates:(BOOL)a3
{
  self->_hasCandidates = a3;
}

- (BOOL)hasDifferentIpv4DetailsAfterSSIDTransition
{
  return self->_hasDifferentIpv4DetailsAfterSSIDTransition;
}

- (void)setHasDifferentIpv4DetailsAfterSSIDTransition:(BOOL)a3
{
  self->_hasDifferentIpv4DetailsAfterSSIDTransition = a3;
}

- (BOOL)hasDifferentIpv6DetailsAfterSSIDTransition
{
  return self->_hasDifferentIpv6DetailsAfterSSIDTransition;
}

- (void)setHasDifferentIpv6DetailsAfterSSIDTransition:(BOOL)a3
{
  self->_hasDifferentIpv6DetailsAfterSSIDTransition = a3;
}

- (BOOL)isRtCoexOptimal
{
  return self->_isRtCoexOptimal;
}

- (void)setIsRtCoexOptimal:(BOOL)a3
{
  self->_isRtCoexOptimal = a3;
}

- (NSDate)firstRtCoexOptimal
{
  return (NSDate *)objc_getProperty(self, a2, 11992, 1);
}

- (void)setFirstRtCoexOptimal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 11992);
}

- (NSDate)lastRtCoexOptimalStatusChange
{
  return (NSDate *)objc_getProperty(self, a2, 12000, 1);
}

- (void)setLastRtCoexOptimalStatusChange:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 12000);
}

- (double)rtCoexInOptimalDuration
{
  return self->_rtCoexInOptimalDuration;
}

- (void)setRtCoexInOptimalDuration:(double)a3
{
  self->_rtCoexInOptimalDuration = a3;
}

- (NSDate)lastEnterPreferredChannel
{
  return (NSDate *)objc_getProperty(self, a2, 12016, 1);
}

- (void)setLastEnterPreferredChannel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 12016);
}

- (double)preferredChannelDuration
{
  return self->_preferredChannelDuration;
}

- (void)setPreferredChannelDuration:(double)a3
{
  self->_preferredChannelDuration = a3;
}

- (NSDate)lastEnterPreferredBand
{
  return (NSDate *)objc_getProperty(self, a2, 12032, 1);
}

- (void)setLastEnterPreferredBand:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 12032);
}

- (double)preferredBandDuration
{
  return self->_preferredBandDuration;
}

- (void)setPreferredBandDuration:(double)a3
{
  self->_preferredBandDuration = a3;
}

- (NSDate)firstSSIDTransition
{
  return (NSDate *)objc_getProperty(self, a2, 12048, 1);
}

- (void)setFirstSSIDTransition:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 12048);
}

- (NSDate)firstIPUpdateAfterSSIDTransition
{
  return (NSDate *)objc_getProperty(self, a2, 12056, 1);
}

- (void)setFirstIPUpdateAfterSSIDTransition:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 12056);
}

- (NSDate)firstManualJoin
{
  return (NSDate *)objc_getProperty(self, a2, 12064, 1);
}

- (void)setFirstManualJoin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 12064);
}

- (NSDate)firstManualJoinAfterSSIDTransition
{
  return (NSDate *)objc_getProperty(self, a2, 12072, 1);
}

- (void)setFirstManualJoinAfterSSIDTransition:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 12072);
}

- (unint64_t)requestSteerToPreferredChannelCount
{
  return self->_requestSteerToPreferredChannelCount;
}

- (void)setRequestSteerToPreferredChannelCount:(unint64_t)a3
{
  self->_requestSteerToPreferredChannelCount = a3;
}

- (unint64_t)requestSteerCount
{
  return self->_requestSteerCount;
}

- (void)setRequestSteerCount:(unint64_t)a3
{
  self->_requestSteerCount = a3;
}

- (unint64_t)requestDisconnectCount
{
  return self->_requestDisconnectCount;
}

- (void)setRequestDisconnectCount:(unint64_t)a3
{
  self->_requestDisconnectCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstManualJoinAfterSSIDTransition, 0);
  objc_storeStrong((id *)&self->_firstManualJoin, 0);
  objc_storeStrong((id *)&self->_firstIPUpdateAfterSSIDTransition, 0);
  objc_storeStrong((id *)&self->_firstSSIDTransition, 0);
  objc_storeStrong((id *)&self->_lastEnterPreferredBand, 0);
  objc_storeStrong((id *)&self->_lastEnterPreferredChannel, 0);
  objc_storeStrong((id *)&self->_lastRtCoexOptimalStatusChange, 0);
  objc_storeStrong((id *)&self->_firstRtCoexOptimal, 0);
  objc_storeStrong((id *)&self->_lastRequestPreferredBSS, 0);
  objc_storeStrong((id *)&self->_lastRequestPreferredSSID, 0);
  objc_storeStrong((id *)&self->_rtCoexSubType, 0);
}

@end
