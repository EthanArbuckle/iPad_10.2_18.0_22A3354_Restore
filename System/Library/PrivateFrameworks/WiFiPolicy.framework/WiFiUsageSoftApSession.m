@implementation WiFiUsageSoftApSession

- (WiFiUsageSoftApSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4
{
  WiFiUsageSoftApSession *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WiFiUsageSoftApSession;
  v4 = -[WiFiUsageSession initWithSessionType:andInterfaceName:andCapabilities:](&v6, sel_initWithSessionType_andInterfaceName_andCapabilities_, 6, a3, a4);
  -[WiFiUsageSoftApSession setTwoFourGHzDeniedChannelCount:](v4, "setTwoFourGHzDeniedChannelCount:", 0);
  -[WiFiUsageSoftApSession setFiveGHzDeniedUnii1ChannelCount:](v4, "setFiveGHzDeniedUnii1ChannelCount:", 0);
  -[WiFiUsageSoftApSession setFiveGHzDeniedUnii2aChannelCount:](v4, "setFiveGHzDeniedUnii2aChannelCount:", 0);
  -[WiFiUsageSoftApSession setFiveGHzDeniedUnii2cChannelCount:](v4, "setFiveGHzDeniedUnii2cChannelCount:", 0);
  -[WiFiUsageSoftApSession setFiveGHzDeniedUnii3ChannelCount:](v4, "setFiveGHzDeniedUnii3ChannelCount:", 0);
  return v4;
}

- (void)linkStateDidChange:(BOOL)a3 isInvoluntary:(BOOL)a4 linkChangeReason:(int64_t)a5 linkChangeSubreason:(int64_t)a6 withNetworkDetails:(id)a7
{
  _BOOL4 v7;
  void *v9;
  void *v10;
  NSDate *lastInfraActiveTime;
  double v12;
  void *v13;
  void *v14;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date", a3, a4, a5, a6, a7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  lastInfraActiveTime = self->_lastInfraActiveTime;
  if (v7)
  {
    if (!lastInfraActiveTime)
    {
      v13 = v9;
      -[WiFiUsageSoftApSession setLastInfraActiveTime:](self, "setLastInfraActiveTime:", v9);
      v10 = v13;
      ++self->_infraStateChangedCount;
    }
  }
  else if (lastInfraActiveTime)
  {
    v14 = v9;
    objc_msgSend(v9, "timeIntervalSinceDate:");
    self->_infraActiveDuration = v12 + self->_infraActiveDuration;
    -[WiFiUsageSoftApSession setLastInfraActiveTime:](self, "setLastInfraActiveTime:", 0);
    v10 = v14;
  }

}

- (void)awdlStateDidChange:(BOOL)a3 inMode:(int64_t)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    v9 = v6;
    -[WiFiUsageSoftApSession setLastAwdlActiveTime:](self, "setLastAwdlActiveTime:", v6);
    v7 = v9;
    ++self->_awdlStateChangedCount;
  }
  else if (self->_lastAwdlActiveTime)
  {
    v10 = v6;
    objc_msgSend(v6, "timeIntervalSinceDate:");
    self->_awdlActiveDuration = v8 + self->_awdlActiveDuration;
    -[WiFiUsageSoftApSession setLastAwdlActiveTime:](self, "setLastAwdlActiveTime:", 0);
    v7 = v10;
  }

}

- (void)softApStateDidChange:(BOOL)a3 requester:(id)a4 status:(id)a5 changeReason:(id)a6 channelNumber:(unint64_t)a7 countryCode:(unint64_t)a8 isHidden:(BOOL)a9 isInfraConnected:(BOOL)a10 isAwdlUp:(BOOL)a11 lowPowerModeDuration:(double)a12 compatibilityMode:(BOOL)a13 requestToUpLatency:(double)a14
{
  _BOOL8 v19;
  id v21;
  id v22;
  id v23;
  NSMutableSet *connectedClients;
  char v25;
  int64_t v26;
  int *v27;
  NSMutableSet *v28;
  NSMutableSet *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  objc_super v34;

  v19 = a3;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v21;
  if (-[WiFiUsageSession isSessionActive](self, "isSessionActive") == v19)
  {
LABEL_6:
    v25 = 0;
    if (!v22)
      goto LABEL_8;
    goto LABEL_7;
  }
  if (!v19)
  {
    NSLog(CFSTR("%s: softAP session ended"), "-[WiFiUsageSoftApSession softApStateDidChange:requester:status:changeReason:channelNumber:countryCode:isHidden:isInfraConnected:isAwdlUp:lowPowerModeDuration:compatibilityMode:requestToUpLatency:]");
    -[WiFiUsageSoftApSession setLowPowerModeDuration:](self, "setLowPowerModeDuration:", a12);
    -[WiFiUsageSoftApSession setTearDownReason:](self, "setTearDownReason:", v23);
    -[WiFiUsageSession sessionDidEnd](self, "sessionDidEnd");
    -[NSMutableSet removeAllObjects](self->_connectedClients, "removeAllObjects");
    goto LABEL_6;
  }
  NSLog(CFSTR("%s: softAP session started"), "-[WiFiUsageSoftApSession softApStateDidChange:requester:status:changeReason:channelNumber:countryCode:isHidden:isInfraConnected:isAwdlUp:lowPowerModeDuration:compatibilityMode:requestToUpLatency:]");
  -[WiFiUsageSession sessionDidStart](self, "sessionDidStart");
  -[WiFiUsageSoftApSession setRequester:](self, "setRequester:", v21);
  -[WiFiUsageSoftApSession setCompatibilityEnabled:](self, "setCompatibilityEnabled:", a13);
  -[WiFiUsageSoftApSession setLowPowerModeDuration:](self, "setLowPowerModeDuration:", 0.0);
  -[WiFiUsageSoftApSession setInfraActiveDuration:](self, "setInfraActiveDuration:", 0.0);
  -[WiFiUsageSoftApSession setAwdlActiveDuration:](self, "setAwdlActiveDuration:", 0.0);
  -[WiFiUsageSoftApSession setRequestToUpLatency:](self, "setRequestToUpLatency:", 0.0);
  -[WiFiUsageSoftApSession setAppleClientConnectCount:](self, "setAppleClientConnectCount:", 0);
  -[WiFiUsageSoftApSession setOtherClientConnectCount:](self, "setOtherClientConnectCount:", 0);
  -[WiFiUsageSoftApSession setHiddenClientConnectCount:](self, "setHiddenClientConnectCount:", 0);
  -[WiFiUsageSoftApSession setBroadcastClientConnectCount:](self, "setBroadcastClientConnectCount:", 0);
  -[WiFiUsageSoftApSession setTwoFourGHzClientConnectCount:](self, "setTwoFourGHzClientConnectCount:", 0);
  -[WiFiUsageSoftApSession setFiveGHzClientConnectCount:](self, "setFiveGHzClientConnectCount:", 0);
  -[WiFiUsageSoftApSession setClientDisconnectCount:](self, "setClientDisconnectCount:", 0);
  -[WiFiUsageSoftApSession setMaxConnectedClientCount:](self, "setMaxConnectedClientCount:", 0);
  -[WiFiUsageSoftApSession setInstantHotspotClientConnectCount:](self, "setInstantHotspotClientConnectCount:", 0);
  -[WiFiUsageSoftApSession setAutoHotspotClientConnectCount:](self, "setAutoHotspotClientConnectCount:", 0);
  -[WiFiUsageSoftApSession setLastAwdlActiveTime:](self, "setLastAwdlActiveTime:", 0);
  -[WiFiUsageSoftApSession setLastInfraActiveTime:](self, "setLastInfraActiveTime:", 0);
  -[WiFiUsageSoftApSession setTwoFourGHzChannelCount:](self, "setTwoFourGHzChannelCount:", 0);
  -[WiFiUsageSoftApSession setFiveGHzChannelCount:](self, "setFiveGHzChannelCount:", 0);
  -[WiFiUsageSoftApSession setInfraStateChangedCount:](self, "setInfraStateChangedCount:", 0);
  -[WiFiUsageSoftApSession setAwdlStateChangedCount:](self, "setAwdlStateChangedCount:", 0);
  -[WiFiUsageSoftApSession setKnownNetworkScanCount:](self, "setKnownNetworkScanCount:", 0);
  -[WiFiUsageSoftApSession setHiddenTransitionCount:](self, "setHiddenTransitionCount:", 0);
  -[WiFiUsageSoftApSession setBandTransitionCount:](self, "setBandTransitionCount:", 0);
  connectedClients = self->_connectedClients;
  if (connectedClients)
  {
    -[NSMutableSet removeAllObjects](connectedClients, "removeAllObjects");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v28 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v29 = self->_connectedClients;
    self->_connectedClients = v28;

  }
  v25 = 1;
  if (v22)
LABEL_7:
    -[WiFiUsageSoftApSession setStatus:](self, "setStatus:", v22);
LABEL_8:
  if (a8)
    -[WiFiUsageSoftApSession setAppliedCountryCode:](self, "setAppliedCountryCode:", a8);
  if (a14 > 0.0)
    -[WiFiUsageSoftApSession setRequestToUpLatency:](self, "setRequestToUpLatency:", a14);
  if (v19)
  {
    if ((v25 & 1) == 0)
    {
      v26 = a7 - self->_lastChannel;
      if (v26)
      {
        if (v26 < 0)
          v26 = self->_lastChannel - a7;
        if ((unint64_t)v26 >= 0x65)
          ++self->_bandTransitionCount;
      }
      if (self->_lastHiddenState != a9)
        ++self->_hiddenTransitionCount;
    }
    if (!self->_lastInfraActiveTime && a10)
      -[WiFiUsageSoftApSession setLastInfraActiveTime:](self, "setLastInfraActiveTime:", v32);
    if (!self->_lastAwdlActiveTime && a11)
      -[WiFiUsageSoftApSession setLastAwdlActiveTime:](self, "setLastAwdlActiveTime:", v32);
    if (a7 && self->_lastChannel != a7)
    {
      v27 = &OBJC_IVAR___WiFiUsageSoftApSession__fiveGHzChannelCount;
      if (a7 < 0xE)
        v27 = &OBJC_IVAR___WiFiUsageSoftApSession__twoFourGHzChannelCount;
      ++*(Class *)((char *)&self->super.super.isa + *v27);
    }
    -[WiFiUsageSoftApSession setLastHiddenState:](self, "setLastHiddenState:", a9);
    -[WiFiUsageSoftApSession setLastChannel:](self, "setLastChannel:", a7);
  }
  v34.receiver = self;
  v34.super_class = (Class)WiFiUsageSoftApSession;
  BYTE3(v30) = a13;
  BYTE2(v30) = a11;
  LOWORD(v30) = __PAIR16__(a10, a9);
  -[WiFiUsageSession softApStateDidChange:requester:status:changeReason:channelNumber:countryCode:isHidden:isInfraConnected:isAwdlUp:lowPowerModeDuration:compatibilityMode:requestToUpLatency:](&v34, sel_softApStateDidChange_requester_status_changeReason_channelNumber_countryCode_isHidden_isInfraConnected_isAwdlUp_lowPowerModeDuration_compatibilityMode_requestToUpLatency_, v19, v31, v22, v23, a7, a8, a12, a14, v30);

}

- (void)addSoftApClientEvent:(BOOL)a3 identifier:(id)a4 isAppleClient:(BOOL)a5 isInstantHotspot:(BOOL)a6 isAutoHotspot:(BOOL)a7 isHidden:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  id v14;
  void *v15;
  int *v16;
  int *v17;
  int *v18;
  unint64_t v19;
  void *v20;
  id v21;

  v8 = a8;
  v9 = a7;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  v14 = a4;
  v15 = v14;
  if (v12)
  {
    if (self->_lastChannel >= 0xE)
      v16 = &OBJC_IVAR___WiFiUsageSoftApSession__fiveGHzClientConnectCount;
    else
      v16 = &OBJC_IVAR___WiFiUsageSoftApSession__twoFourGHzClientConnectCount;
    ++*(Class *)((char *)&self->super.super.isa + *v16);
    v17 = &OBJC_IVAR___WiFiUsageSoftApSession__broadcastClientConnectCount;
    if (v8)
      v17 = &OBJC_IVAR___WiFiUsageSoftApSession__hiddenClientConnectCount;
    ++*(Class *)((char *)&self->super.super.isa + *v17);
    v18 = &OBJC_IVAR___WiFiUsageSoftApSession__otherClientConnectCount;
    if (v11)
      v18 = &OBJC_IVAR___WiFiUsageSoftApSession__appleClientConnectCount;
    ++*(Class *)((char *)&self->super.super.isa + *v18);
    if (v10)
      ++self->_instantHotspotClientConnectCount;
    if (v9)
      ++self->_autoHotspotClientConnectCount;
    v20 = v14;
    if (v14)
      -[NSMutableSet addObject:](self->_connectedClients, "addObject:", v14);
    v19 = -[NSMutableSet count](self->_connectedClients, "count");
    v15 = v20;
    if (v19 > self->_maxConnectedClientCount)
    {
      self->_maxConnectedClientCount = -[NSMutableSet count](self->_connectedClients, "count");

      return;
    }
  }
  else
  {
    ++self->_clientDisconnectCount;
    if (v14)
    {
      v21 = v14;
      -[NSMutableSet removeObject:](self->_connectedClients, "removeObject:", v14);
      v15 = v21;
    }
  }

}

- (void)addSoftApCoexEvent:(unint64_t)a3 deniedUnii1ChannelMap:(unint64_t)a4 deniedUnii2aChannelMap:(unint64_t)a5 deniedUnii2cChannelMap:(unint64_t)a6 deniedUnii3ChannelMap:(unint64_t)a7
{
  -[WiFiUsageSoftApSession setTwoFourGHzDeniedChannelCount:](self, "setTwoFourGHzDeniedChannelCount:", a3);
  -[WiFiUsageSoftApSession setFiveGHzDeniedUnii1ChannelCount:](self, "setFiveGHzDeniedUnii1ChannelCount:", a4);
  -[WiFiUsageSoftApSession setFiveGHzDeniedUnii2aChannelCount:](self, "setFiveGHzDeniedUnii2aChannelCount:", a5);
  -[WiFiUsageSoftApSession setFiveGHzDeniedUnii2cChannelCount:](self, "setFiveGHzDeniedUnii2cChannelCount:", a6);
  -[WiFiUsageSoftApSession setFiveGHzDeniedUnii3ChannelCount:](self, "setFiveGHzDeniedUnii3ChannelCount:", a7);
}

- (id)eventDictionary:(BOOL)a3
{
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
  void *v21;
  void *v22;
  void *v23;
  double lowPowerModeDuration;
  double v25;
  void *v26;
  double infraActiveDuration;
  double v28;
  void *v29;
  double awdlActiveDuration;
  double v31;
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
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageSession sessionName](self, "sessionName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("SessionName"));

  -[WiFiUsageSession sessionDuration](self, "sessionDuration");
  +[WiFiUsagePrivacyFilter numberWithDuration:](WiFiUsagePrivacyFilter, "numberWithDuration:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("SessionDuration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[WiFiUsageSession sessionPid](self, "sessionPid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("SessionPid"));

  -[WiFiUsageSession sessionTimeSinceLastSession](self, "sessionTimeSinceLastSession");
  +[WiFiUsagePrivacyFilter numberWithDuration:](WiFiUsagePrivacyFilter, "numberWithDuration:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("SessionTimeSinceLastSession"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_requester, CFSTR("Requester"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_status, CFSTR("Status"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_tearDownReason, CFSTR("TearDownReason"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_lastHiddenState);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("LastHiddenState"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_lastChannel);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("LastChannel"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_twoFourGHzChannelCount);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("TwoFourGHzChannelCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_fiveGHzChannelCount);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("FiveGHzChannelCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_appleClientConnectCount);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("AppleClientConnectCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_otherClientConnectCount);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("OtherClientConnectCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_hiddenClientConnectCount);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("HiddenClientConnectCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_broadcastClientConnectCount);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("BroadcastClientConnectCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_autoHotspotClientConnectCount);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("AutoHotspotClientConnectCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_instantHotspotClientConnectCount);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("InstantHotspotClientConnectCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_twoFourGHzClientConnectCount);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("TwoFourGHzClientConnectCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_fiveGHzClientConnectCount);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("FiveGHzClientConnectCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_clientDisconnectCount);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, CFSTR("ClientDisconnectCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_maxConnectedClientCount);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, CFSTR("MaxConnectedClientCount"));

  lowPowerModeDuration = self->_lowPowerModeDuration;
  -[WiFiUsageSession sessionDuration](self, "sessionDuration");
  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", lowPowerModeDuration, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v26, CFSTR("LowPowerModeDuration"));

  infraActiveDuration = self->_infraActiveDuration;
  -[WiFiUsageSession sessionDuration](self, "sessionDuration");
  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", infraActiveDuration, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, CFSTR("InfraActiveDuration"));

  awdlActiveDuration = self->_awdlActiveDuration;
  -[WiFiUsageSession sessionDuration](self, "sessionDuration");
  +[WiFiUsagePrivacyFilter timePercentage:overTotalDuration:](WiFiUsagePrivacyFilter, "timePercentage:overTotalDuration:", awdlActiveDuration, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v32, CFSTR("AwdlActiveDuration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_requestToUpLatency);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v33, CFSTR("RequestToUpLatency"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_infraStateChangedCount);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v34, CFSTR("InfraStateChangedCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_awdlStateChangedCount);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v35, CFSTR("AwdlStateChangedCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_knownNetworkScanCount);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v36, CFSTR("KnownNetworkScanCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_hiddenTransitionCount);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v37, CFSTR("HiddenTransitionCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_bandTransitionCount);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v38, CFSTR("BandTransitionCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_twoFourGHzDeniedChannelCount);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v39, CFSTR("TwoFourGHzDeniedChannelCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_fiveGHzDeniedUnii1ChannelCount);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v40, CFSTR("FiveGHzDeniedUnii1ChannelCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_fiveGHzDeniedUnii2aChannelCount);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v41, CFSTR("FiveGHzDeniedUnii2aChannelCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_fiveGHzDeniedUnii2cChannelCount);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v42, CFSTR("FiveGHzDeniedUnii2cChannelCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_fiveGHzDeniedUnii3ChannelCount);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v43, CFSTR("FiveGHzDeniedUnii3ChannelCount"));

  v48[0] = self->_appliedCountryCode;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v48, 4);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v44, CFSTR("CountryCodeApplied"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_compatibilityEnabled);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v45, CFSTR("MaximizeCompatibilityEnabled"));

  if (!a3)
  {
    -[WiFiUsageSession sessionStartTime](self, "sessionStartTime");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v46, CFSTR("SessionStartTimestamp"));

  }
  return v5;
}

- (void)summarizeSession
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_lastInfraActiveTime)
  {
    objc_msgSend(v3, "timeIntervalSinceDate:");
    self->_infraActiveDuration = v5 + self->_infraActiveDuration;
    -[WiFiUsageSoftApSession setLastInfraActiveTime:](self, "setLastInfraActiveTime:", 0);
  }
  if (self->_lastAwdlActiveTime)
  {
    objc_msgSend(v4, "timeIntervalSinceDate:");
    self->_awdlActiveDuration = v6 + self->_awdlActiveDuration;
    -[WiFiUsageSoftApSession setLastAwdlActiveTime:](self, "setLastAwdlActiveTime:", 0);
  }
  v7.receiver = self;
  v7.super_class = (Class)WiFiUsageSoftApSession;
  -[WiFiUsageSession summarizeSession](&v7, sel_summarizeSession);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = objc_alloc((Class)objc_opt_class());
  v5 = -[WiFiUsageSession type](self, "type");
  -[WiFiUsageSession interfaceName](self, "interfaceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageSession capabilities](self, "capabilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithSessionType:andInterfaceName:andCapabilities:", v5, v6, v7);

  -[WiFiUsageSession completionQueue](self, "completionQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCompletionQueue:", v9);

  -[WiFiUsageSession completionContext](self, "completionContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCompletionContext:", v10);

  -[WiFiUsageSession completionHandler](self, "completionHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCompletionHandler:", v11);

  -[WiFiUsageSession sessionDuration](self, "sessionDuration");
  objc_msgSend(v8, "setSessionDuration:");
  -[WiFiUsageSession sessionStartTime](self, "sessionStartTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSessionStartTime:", v12);

  objc_msgSend(v8, "setIsSessionActive:", -[WiFiUsageSession isSessionActive](self, "isSessionActive"));
  objc_msgSend(v8, "setSessionPid:", -[WiFiUsageSession sessionPid](self, "sessionPid"));
  objc_msgSend(v8, "setRequester:", self->_requester);
  objc_msgSend(v8, "setStatus:", self->_status);
  objc_msgSend(v8, "setLastAwdlActiveTime:", self->_lastAwdlActiveTime);
  objc_msgSend(v8, "setLastInfraActiveTime:", self->_lastInfraActiveTime);
  objc_msgSend(v8, "setAppleClientConnectCount:", self->_appleClientConnectCount);
  objc_msgSend(v8, "setOtherClientConnectCount:", self->_otherClientConnectCount);
  objc_msgSend(v8, "setHiddenClientConnectCount:", self->_hiddenClientConnectCount);
  objc_msgSend(v8, "setBroadcastClientConnectCount:", self->_broadcastClientConnectCount);
  objc_msgSend(v8, "setTwoFourGHzClientConnectCount:", self->_twoFourGHzClientConnectCount);
  objc_msgSend(v8, "setFiveGHzClientConnectCount:", self->_fiveGHzChannelCount);
  objc_msgSend(v8, "setClientDisconnectCount:", self->_clientDisconnectCount);
  objc_msgSend(v8, "setMaxConnectedClientCount:", self->_maxConnectedClientCount);
  objc_msgSend(v8, "setInstantHotspotClientConnectCount:", self->_instantHotspotClientConnectCount);
  objc_msgSend(v8, "setAutoHotspotClientConnectCount:", self->_autoHotspotClientConnectCount);
  objc_msgSend(v8, "setLastHiddenState:", self->_lastHiddenState);
  objc_msgSend(v8, "setLastChannel:", self->_lastChannel);
  objc_msgSend(v8, "setTwoFourGHzChannelCount:", self->_twoFourGHzChannelCount);
  objc_msgSend(v8, "setFiveGHzChannelCount:", self->_fiveGHzChannelCount);
  objc_msgSend(v8, "setLowPowerModeDuration:", self->_lowPowerModeDuration);
  objc_msgSend(v8, "setInfraActiveDuration:", self->_infraActiveDuration);
  objc_msgSend(v8, "setAwdlActiveDuration:", self->_awdlActiveDuration);
  objc_msgSend(v8, "setRequestToUpLatency:", self->_requestToUpLatency);
  objc_msgSend(v8, "setCompatibilityEnabled:", self->_compatibilityEnabled);
  objc_msgSend(v8, "setInfraStateChangedCount:", self->_infraStateChangedCount);
  objc_msgSend(v8, "setAwdlStateChangedCount:", self->_awdlStateChangedCount);
  objc_msgSend(v8, "setKnownNetworkScanCount:", self->_knownNetworkScanCount);
  objc_msgSend(v8, "setHiddenTransitionCount:", self->_hiddenTransitionCount);
  objc_msgSend(v8, "setBandTransitionCount:", self->_bandTransitionCount);
  objc_msgSend(v8, "setTwoFourGHzDeniedChannelCount:", self->_twoFourGHzDeniedChannelCount);
  objc_msgSend(v8, "setFiveGHzDeniedUnii1ChannelCount:", self->_fiveGHzDeniedUnii1ChannelCount);
  objc_msgSend(v8, "setFiveGHzDeniedUnii2aChannelCount:", self->_fiveGHzDeniedUnii2aChannelCount);
  objc_msgSend(v8, "setFiveGHzDeniedUnii2cChannelCount:", self->_fiveGHzDeniedUnii2cChannelCount);
  objc_msgSend(v8, "setFiveGHzDeniedUnii3ChannelCount:", self->_fiveGHzDeniedUnii3ChannelCount);
  objc_msgSend(v8, "setAppliedCountryCode:", self->_appliedCountryCode);
  objc_msgSend(v8, "setConnectedClients:", self->_connectedClients);
  objc_msgSend(v8, "setTearDownReason:", self->_tearDownReason);
  return v8;
}

- (id)metricName
{
  return CFSTR("com.apple.wifi.softapsession");
}

- (NSString)requester
{
  return self->_requester;
}

- (void)setRequester:(id)a3
{
  objc_storeStrong((id *)&self->_requester, a3);
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (NSString)tearDownReason
{
  return self->_tearDownReason;
}

- (void)setTearDownReason:(id)a3
{
  objc_storeStrong((id *)&self->_tearDownReason, a3);
}

- (NSDate)lastAwdlActiveTime
{
  return self->_lastAwdlActiveTime;
}

- (void)setLastAwdlActiveTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastAwdlActiveTime, a3);
}

- (NSDate)lastInfraActiveTime
{
  return self->_lastInfraActiveTime;
}

- (void)setLastInfraActiveTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastInfraActiveTime, a3);
}

- (BOOL)compatibilityEnabled
{
  return self->_compatibilityEnabled;
}

- (void)setCompatibilityEnabled:(BOOL)a3
{
  self->_compatibilityEnabled = a3;
}

- (unint64_t)appleClientConnectCount
{
  return self->_appleClientConnectCount;
}

- (void)setAppleClientConnectCount:(unint64_t)a3
{
  self->_appleClientConnectCount = a3;
}

- (unint64_t)otherClientConnectCount
{
  return self->_otherClientConnectCount;
}

- (void)setOtherClientConnectCount:(unint64_t)a3
{
  self->_otherClientConnectCount = a3;
}

- (unint64_t)hiddenClientConnectCount
{
  return self->_hiddenClientConnectCount;
}

- (void)setHiddenClientConnectCount:(unint64_t)a3
{
  self->_hiddenClientConnectCount = a3;
}

- (unint64_t)broadcastClientConnectCount
{
  return self->_broadcastClientConnectCount;
}

- (void)setBroadcastClientConnectCount:(unint64_t)a3
{
  self->_broadcastClientConnectCount = a3;
}

- (unint64_t)twoFourGHzClientConnectCount
{
  return self->_twoFourGHzClientConnectCount;
}

- (void)setTwoFourGHzClientConnectCount:(unint64_t)a3
{
  self->_twoFourGHzClientConnectCount = a3;
}

- (unint64_t)fiveGHzClientConnectCount
{
  return self->_fiveGHzClientConnectCount;
}

- (void)setFiveGHzClientConnectCount:(unint64_t)a3
{
  self->_fiveGHzClientConnectCount = a3;
}

- (unint64_t)autoHotspotClientConnectCount
{
  return self->_autoHotspotClientConnectCount;
}

- (void)setAutoHotspotClientConnectCount:(unint64_t)a3
{
  self->_autoHotspotClientConnectCount = a3;
}

- (unint64_t)instantHotspotClientConnectCount
{
  return self->_instantHotspotClientConnectCount;
}

- (void)setInstantHotspotClientConnectCount:(unint64_t)a3
{
  self->_instantHotspotClientConnectCount = a3;
}

- (unint64_t)clientDisconnectCount
{
  return self->_clientDisconnectCount;
}

- (void)setClientDisconnectCount:(unint64_t)a3
{
  self->_clientDisconnectCount = a3;
}

- (unint64_t)maxConnectedClientCount
{
  return self->_maxConnectedClientCount;
}

- (void)setMaxConnectedClientCount:(unint64_t)a3
{
  self->_maxConnectedClientCount = a3;
}

- (BOOL)lastHiddenState
{
  return self->_lastHiddenState;
}

- (void)setLastHiddenState:(BOOL)a3
{
  self->_lastHiddenState = a3;
}

- (unint64_t)lastChannel
{
  return self->_lastChannel;
}

- (void)setLastChannel:(unint64_t)a3
{
  self->_lastChannel = a3;
}

- (unint64_t)twoFourGHzChannelCount
{
  return self->_twoFourGHzChannelCount;
}

- (void)setTwoFourGHzChannelCount:(unint64_t)a3
{
  self->_twoFourGHzChannelCount = a3;
}

- (unint64_t)fiveGHzChannelCount
{
  return self->_fiveGHzChannelCount;
}

- (void)setFiveGHzChannelCount:(unint64_t)a3
{
  self->_fiveGHzChannelCount = a3;
}

- (double)lowPowerModeDuration
{
  return self->_lowPowerModeDuration;
}

- (void)setLowPowerModeDuration:(double)a3
{
  self->_lowPowerModeDuration = a3;
}

- (double)infraActiveDuration
{
  return self->_infraActiveDuration;
}

- (void)setInfraActiveDuration:(double)a3
{
  self->_infraActiveDuration = a3;
}

- (double)awdlActiveDuration
{
  return self->_awdlActiveDuration;
}

- (void)setAwdlActiveDuration:(double)a3
{
  self->_awdlActiveDuration = a3;
}

- (double)requestToUpLatency
{
  return self->_requestToUpLatency;
}

- (void)setRequestToUpLatency:(double)a3
{
  self->_requestToUpLatency = a3;
}

- (unint64_t)infraStateChangedCount
{
  return self->_infraStateChangedCount;
}

- (void)setInfraStateChangedCount:(unint64_t)a3
{
  self->_infraStateChangedCount = a3;
}

- (unint64_t)awdlStateChangedCount
{
  return self->_awdlStateChangedCount;
}

- (void)setAwdlStateChangedCount:(unint64_t)a3
{
  self->_awdlStateChangedCount = a3;
}

- (unint64_t)knownNetworkScanCount
{
  return self->_knownNetworkScanCount;
}

- (void)setKnownNetworkScanCount:(unint64_t)a3
{
  self->_knownNetworkScanCount = a3;
}

- (unint64_t)hiddenTransitionCount
{
  return self->_hiddenTransitionCount;
}

- (void)setHiddenTransitionCount:(unint64_t)a3
{
  self->_hiddenTransitionCount = a3;
}

- (unint64_t)bandTransitionCount
{
  return self->_bandTransitionCount;
}

- (void)setBandTransitionCount:(unint64_t)a3
{
  self->_bandTransitionCount = a3;
}

- (unint64_t)twoFourGHzDeniedChannelCount
{
  return self->_twoFourGHzDeniedChannelCount;
}

- (void)setTwoFourGHzDeniedChannelCount:(unint64_t)a3
{
  self->_twoFourGHzDeniedChannelCount = a3;
}

- (unint64_t)fiveGHzDeniedUnii1ChannelCount
{
  return self->_fiveGHzDeniedUnii1ChannelCount;
}

- (void)setFiveGHzDeniedUnii1ChannelCount:(unint64_t)a3
{
  self->_fiveGHzDeniedUnii1ChannelCount = a3;
}

- (unint64_t)fiveGHzDeniedUnii2aChannelCount
{
  return self->_fiveGHzDeniedUnii2aChannelCount;
}

- (void)setFiveGHzDeniedUnii2aChannelCount:(unint64_t)a3
{
  self->_fiveGHzDeniedUnii2aChannelCount = a3;
}

- (unint64_t)fiveGHzDeniedUnii2cChannelCount
{
  return self->_fiveGHzDeniedUnii2cChannelCount;
}

- (void)setFiveGHzDeniedUnii2cChannelCount:(unint64_t)a3
{
  self->_fiveGHzDeniedUnii2cChannelCount = a3;
}

- (unint64_t)fiveGHzDeniedUnii3ChannelCount
{
  return self->_fiveGHzDeniedUnii3ChannelCount;
}

- (void)setFiveGHzDeniedUnii3ChannelCount:(unint64_t)a3
{
  self->_fiveGHzDeniedUnii3ChannelCount = a3;
}

- (unint64_t)appliedCountryCode
{
  return self->_appliedCountryCode;
}

- (void)setAppliedCountryCode:(unint64_t)a3
{
  self->_appliedCountryCode = a3;
}

- (NSMutableSet)connectedClients
{
  return self->_connectedClients;
}

- (void)setConnectedClients:(id)a3
{
  objc_storeStrong((id *)&self->_connectedClients, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectedClients, 0);
  objc_storeStrong((id *)&self->_lastInfraActiveTime, 0);
  objc_storeStrong((id *)&self->_lastAwdlActiveTime, 0);
  objc_storeStrong((id *)&self->_tearDownReason, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_requester, 0);
}

@end
