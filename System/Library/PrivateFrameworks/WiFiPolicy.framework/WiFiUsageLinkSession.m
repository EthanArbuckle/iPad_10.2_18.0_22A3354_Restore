@implementation WiFiUsageLinkSession

- (void)applicationStateDidChange:(id)a3 withAttributes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.springboard")) & 1) == 0)
    {
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.appleseed.FeedbackAssistant")))
      {
        if (!self->_lastFaultIndicationTime || (objc_msgSend(v8, "timeIntervalSinceDate:"), v9 > 60.0))
        {
          if (self->_linkUp && self->_didBecomePrimary)
          {
            objc_storeStrong((id *)&self->_lastFaultIndicationTime, v8);
            -[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:](self, "performLinkTestFor:isTriggeredByFault:", CFSTR("FeedbackAssistant"), 0);
          }
        }
      }
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)WiFiUsageLinkSession;
  -[WiFiUsageSession applicationStateDidChange:withAttributes:](&v10, sel_applicationStateDidChange_withAttributes_, v6, v7);

}

- (void)linkQualityDidChange:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WiFiUsageLinkSession;
  -[WiFiUsageSession linkQualityDidChange:](&v3, sel_linkQualityDidChange_, a3);
}

- (WiFiUsageLinkSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4
{
  WiFiUsageLinkSession *v4;
  NSDate *lastLinkTest;
  NSDate *lastFaultEventHandled;
  NSMutableDictionary *linkTestResult;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WiFiUsageLinkSession;
  v4 = -[WiFiUsageSession initWithSessionType:andInterfaceName:andCapabilities:](&v9, sel_initWithSessionType_andInterfaceName_andCapabilities_, 4, a3, a4);
  v4->_linkUp = 0;
  lastLinkTest = v4->_lastLinkTest;
  v4->_lastLinkTest = 0;

  v4->_numLinkTestFailures = 0;
  v4->_didHandleFaultEvent = 0;
  v4->_didBecomePrimary = 0;
  v4->_foundSuccessfulLinkTest = 0;
  v4->_numLinkRecoverySkips = 0;
  v4->_periodicLinkTestInterval = 60;
  lastFaultEventHandled = v4->_lastFaultEventHandled;
  v4->_lastFaultEventHandled = 0;

  v4->_band = 3;
  -[WiFiUsageSession setLinkRecoveryDisabled:](v4, "setLinkRecoveryDisabled:", 0);
  linkTestResult = v4->_linkTestResult;
  v4->_linkTestResult = 0;

  return v4;
}

- (void)joinStateDidChange:(id)a3 withReason:(unint64_t)a4 lastDisconnectReason:(int64_t)a5 lastJoinFailure:(int64_t)a6 andNetworkDetails:(id)a7
{
  id v12;
  id v13;
  objc_super v14;
  objc_super v15;

  v12 = a3;
  v13 = a7;
  if (a6 && !-[WiFiUsageSession isSessionActive](self, "isSessionActive"))
  {
    -[WiFiUsageSession sessionDidStart](self, "sessionDidStart");
    v15.receiver = self;
    v15.super_class = (Class)WiFiUsageLinkSession;
    -[WiFiUsageSession joinStateDidChange:withReason:lastDisconnectReason:lastJoinFailure:andNetworkDetails:](&v15, sel_joinStateDidChange_withReason_lastDisconnectReason_lastJoinFailure_andNetworkDetails_, v12, a4, a5, a6, v13);
    v14.receiver = self;
    v14.super_class = (Class)WiFiUsageLinkSession;
    -[WiFiUsageSession updateAssociatedNetworkDetails:](&v14, sel_updateAssociatedNetworkDetails_, v13);
    -[WiFiUsageSession sessionDidEnd](self, "sessionDidEnd");
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)WiFiUsageLinkSession;
    -[WiFiUsageSession joinStateDidChange:withReason:lastDisconnectReason:lastJoinFailure:andNetworkDetails:](&v15, sel_joinStateDidChange_withReason_lastDisconnectReason_lastJoinFailure_andNetworkDetails_, v12, a4, a5, a6, v13);
  }

}

- (void)linkStateDidChange:(BOOL)a3 isInvoluntary:(BOOL)a4 linkChangeReason:(int64_t)a5 linkChangeSubreason:(int64_t)a6 withNetworkDetails:(id)a7
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v12;
  void *v13;
  _BOOL4 v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSString *v23;
  NSString *bssid;
  NSString *v25;
  NSString *ssid;
  void *v27;
  NSDate *lastLinkTest;
  NSString *v29;
  objc_super v30;
  objc_super v31;
  objc_super v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v9 = a4;
  v10 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  v12 = a7;
  v13 = v12;
  v14 = !self->_linkUp && v10;
  v15 = !self->_linkUp || v10;
  objc_msgSend(v12, "connectedBss");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  self->_band = objc_msgSend(v16, "band");

  if ((v15 & 1) == 0 && -[WiFiUsageSession isAssociated](self, "isAssociated"))
  {
    -[WiFiUsageSession networkDetails](self, "networkDetails");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");
    -[WiFiUsageSession setNetworkDetailsAtEnd:](self, "setNetworkDetailsAtEnd:", v18);

  }
  v32.receiver = self;
  v32.super_class = (Class)WiFiUsageLinkSession;
  -[WiFiUsageSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:](&v32, sel_linkStateDidChange_isInvoluntary_linkChangeReason_linkChangeSubreason_withNetworkDetails_, v10, v9, a5, a6, v13);
  if (v14)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      -[WiFiUsageSession networkDetails](self, "networkDetails");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315395;
      v34 = "-[WiFiUsageLinkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:]";
      v35 = 2113;
      v36 = v19;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: link session started for %{private}@", buf, 0x16u);

    }
    -[WiFiUsageSession sessionDidStart](self, "sessionDidStart");
    self->_linkUp = 1;
    objc_msgSend(v13, "connectedBss");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = +[WiFiUsageLQMTransformations maxPhyModeFrom:](WiFiUsageLQMTransformations, "maxPhyModeFrom:", objc_msgSend(v20, "phyMode"));

    v31.receiver = self;
    v31.super_class = (Class)WiFiUsageLinkSession;
    if (v21 > -[WiFiUsageSession maxPhyMode](&v31, sel_maxPhyMode))
    {
      v30.receiver = self;
      v30.super_class = (Class)WiFiUsageLinkSession;
      -[WiFiUsageSession setMaxPhyMode:](&v30, sel_setMaxPhyMode_, v21);
    }
    objc_msgSend(v13, "connectedBss");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bssid");
    v23 = (NSString *)objc_claimAutoreleasedReturnValue();
    bssid = self->_bssid;
    self->_bssid = v23;

    objc_msgSend(v13, "networkName");
    v25 = (NSString *)objc_claimAutoreleasedReturnValue();
    ssid = self->_ssid;
    self->_ssid = v25;
LABEL_20:

    goto LABEL_21;
  }
  if ((v15 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      -[WiFiUsageSession networkDetails](self, "networkDetails");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315395;
      v34 = "-[WiFiUsageLinkSession linkStateDidChange:isInvoluntary:linkChangeReason:linkChangeSubreason:withNetworkDetails:]";
      v35 = 2113;
      v36 = v27;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: link session ended for %{private}@", buf, 0x16u);

    }
    -[WiFiUsageSession sessionDidEnd](self, "sessionDidEnd");
    self->_linkUp = 0;
    lastLinkTest = self->_lastLinkTest;
    self->_lastLinkTest = 0;

    self->_didBecomePrimary = 0;
    self->_foundSuccessfulLinkTest = 0;
    self->_numLinkTestFailures = 0;
    self->_numLinkRecoverySkips = 0;
    v29 = self->_bssid;
    self->_bssid = 0;

    ssid = self->_ssid;
    self->_ssid = 0;
    goto LABEL_20;
  }
LABEL_21:

}

- (void)interfaceRankingDidChange:(BOOL)a3
{
  self->_didBecomePrimary = a3;
}

- (BOOL)useSavedJoinStats
{
  return 1;
}

- (id)metricName
{
  return CFSTR("com.apple.wifi.linksession");
}

- (void)lockStateDidChange:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  double v7;
  objc_super v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!self->_lastLinkTest || (objc_msgSend(v5, "timeIntervalSinceDate:"), v7 > 600.0))
  {
    if (!v3)
      -[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:](self, "performLinkTestFor:isTriggeredByFault:", CFSTR("LockStateChanged"), 0);
  }
  v8.receiver = self;
  v8.super_class = (Class)WiFiUsageLinkSession;
  -[WiFiUsageSession lockStateDidChange:](&v8, sel_lockStateDidChange_, v3);

}

- (void)displayStateDidChange:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  double v7;
  objc_super v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!self->_lastLinkTest)
  {
    if (!v3)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(v5, "timeIntervalSinceDate:");
  if (v7 > 600.0 && v3)
LABEL_4:
    -[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:](self, "performLinkTestFor:isTriggeredByFault:", CFSTR("DisplayStateChanged"), 0);
LABEL_5:
  v8.receiver = self;
  v8.super_class = (Class)WiFiUsageLinkSession;
  -[WiFiUsageSession displayStateDidChange:](&v8, sel_displayStateDidChange_, v3);

}

- (void)handleFaultEventWithReason:(id)a3
{
  NSLog(CFSTR("%s:%u: Handling fault event is not supported for %@\n"), a2, "-[WiFiUsageLinkSession handleFaultEventWithReason:]", 282, a3);
  self->_numLinkTestFailures = 0;
}

- (void)retryLinkTestInOneMinute
{
  dispatch_time_t v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id location;

  NSLog(CFSTR("%s:%u: Waiting 1 minute before trying to perform another link test\n"), a2, "-[WiFiUsageLinkSession retryLinkTestInOneMinute]", 291);
  objc_initWeak(&location, self);
  v3 = dispatch_time(0, 60000000000);
  -[WiFiUsageSession completionQueue](self, "completionQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__WiFiUsageLinkSession_retryLinkTestInOneMinute__block_invoke;
  block[3] = &unk_1E881CBD0;
  objc_copyWeak(&v6, &location);
  dispatch_after(v3, v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __48__WiFiUsageLinkSession_retryLinkTestInOneMinute__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  const __CFString *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained[11984])
    v2 = CFSTR("didHandleFaultEvent");
  else
    v2 = CFSTR("retryLinkTest");
  objc_msgSend(WeakRetained, "performLinkTestFor:isTriggeredByFault:", v2, 0);

}

- (void)faultEventDetected:(unint64_t)a3
{
  void *v5;
  const __CFString *v6;
  double v7;
  _BOOL8 v8;
  WiFiUsageLinkSession *v9;
  const __CFString *v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)WiFiUsageLinkSession;
  -[WiFiUsageSession faultEventDetected:](&v16, sel_faultEventDetected_, a3);
  v6 = CFSTR("Arp Failure");
  switch(a3)
  {
    case 0x11uLL:
      goto LABEL_6;
    case 0x12uLL:
      v6 = CFSTR("SlowWiFiDnsFailure");
      goto LABEL_6;
    case 0x13uLL:
      v6 = CFSTR("SlowWiFiDUT");
      goto LABEL_6;
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
      goto LABEL_29;
    case 0x19uLL:
      if (self->_lastFaultIndicationTime && (objc_msgSend(v5, "timeIntervalSinceDate:"), v12 <= 60.0))
      {
        objc_msgSend(v5, "timeIntervalSinceDate:", self->_lastFaultIndicationTime);
        NSLog(CFSTR("%s kWiFiUsageFaultReasonSiriTimedOut Rejected since _lastFaultIndicationTime %f ago\n"), "-[WiFiUsageLinkSession faultEventDetected:]", v14);
      }
      else
      {
        if (self->_linkUp && self->_didBecomePrimary)
        {
          objc_storeStrong((id *)&self->_lastFaultIndicationTime, v5);
          v10 = CFSTR("Siri Timed Out");
          goto LABEL_23;
        }
        NSLog(CFSTR("%s kWiFiUsageFaultReasonSiriTimedOut Rejected _linkUp %d _didBecomePrimary %d\n"), "-[WiFiUsageLinkSession faultEventDetected:]", self->_linkUp, self->_didBecomePrimary);
      }
      goto LABEL_29;
    case 0x1AuLL:
      if (self->_lastFaultIndicationTime)
      {
        objc_msgSend(v5, "timeIntervalSinceDate:");
        if (v13 <= 600.0)
        {
          objc_msgSend(v5, "timeIntervalSinceDate:", self->_lastFaultIndicationTime);
          NSLog(CFSTR("%s kWiFiUsageFaultReasonApsdTimedOut Rejected since _lastFaultIndicationTime %f ago\n"), "-[WiFiUsageLinkSession faultEventDetected:]", v15);
          goto LABEL_29;
        }
      }
      if (!self->_linkUp || !self->_didBecomePrimary)
      {
        NSLog(CFSTR("%s kWiFiUsageFaultReasonApsdTimedOut Rejected _linkUp %d _didBecomePrimary %d\n"), "-[WiFiUsageLinkSession faultEventDetected:]", self->_linkUp, self->_didBecomePrimary);
        goto LABEL_29;
      }
      objc_storeStrong((id *)&self->_lastFaultIndicationTime, v5);
      v10 = CFSTR("Apsd Timed Out");
LABEL_23:
      v9 = self;
      v8 = 1;
      goto LABEL_24;
    default:
      if (a3 != 10)
        goto LABEL_29;
      v6 = CFSTR("SlowWiFiAP");
LABEL_6:
      if (self->_lastFaultIndicationTime && (objc_msgSend(v5, "timeIntervalSinceDate:"), v7 <= 60.0))
      {
        objc_msgSend(v5, "timeIntervalSinceDate:", self->_lastFaultIndicationTime);
        NSLog(CFSTR("%s fault type %lu %@ Rejected since _lastFaultIndicationTime %f ago\n"), "-[WiFiUsageLinkSession faultEventDetected:]", a3, v6, v11);
      }
      else if (self->_linkUp && self->_didBecomePrimary)
      {
        objc_storeStrong((id *)&self->_lastFaultIndicationTime, v5);
        v8 = a3 == 18;
        v9 = self;
        v10 = v6;
LABEL_24:
        -[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:](v9, "performLinkTestFor:isTriggeredByFault:", v10, v8);
      }
      else
      {
        NSLog(CFSTR("%s fault type %lu %@ Rejected _linkUp %d _didBecomePrimary %d\n"), "-[WiFiUsageLinkSession faultEventDetected:]", a3, v6, self->_linkUp, self->_didBecomePrimary);
      }
LABEL_29:

      return;
  }
}

- (void)performLinkTestFor:(id)a3 isTriggeredByFault:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  NSMutableDictionary *linkTestResult;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  WFMeasure *v15;
  unint64_t lastFaultEventHandledOptions;
  void *v17;
  WFMeasure *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  const __CFString *v23;
  void *v24;
  NSMutableDictionary *v25;
  NSString *lastFaultEventHandledReason;
  _QWORD v27[4];
  id v28;
  WiFiUsageLinkSession *v29;
  BOOL v30;

  v6 = a3;
  v7 = v6;
  if (self->_linkUp && self->_didBecomePrimary)
  {
    NSLog(CFSTR("%s:%u: reason[%@], internal:%u\n"), "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]", 419, v6, +[WiFiUsagePrivacyFilter isInternalInstall](WiFiUsagePrivacyFilter, "isInternalInstall"));
    if (+[WiFiUsagePrivacyFilter isInternalInstall](WiFiUsagePrivacyFilter, "isInternalInstall"))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&self->_lastLinkTest, v8);
      +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing](WiFiPolicyNetworkActivityTracing, "sharedNetworkActivityTracing");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "hasActivitiesRunning");

      if ((v10 & 1) == 0)
      {
        +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing](WiFiPolicyNetworkActivityTracing, "sharedNetworkActivityTracing");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "networkActivityStart:activate:", 1, 1);

        linkTestResult = self->_linkTestResult;
        self->_linkTestResult = 0;

        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        v14 = self->_linkTestResult;
        self->_linkTestResult = v13;

      }
      v15 = [WFMeasure alloc];
      lastFaultEventHandledOptions = self->_lastFaultEventHandledOptions;
      -[WiFiUsageSession interfaceName](self, "interfaceName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[WFMeasure initWithType:andReason:prevTestedOptions:andInterfaceName:](v15, "initWithType:andReason:prevTestedOptions:andInterfaceName:", 2, v7, lastFaultEventHandledOptions, v17);

      if (v18)
      {
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __62__WiFiUsageLinkSession_performLinkTestFor_isTriggeredByFault___block_invoke;
        v27[3] = &unk_1E881CBF8;
        v30 = a4;
        v28 = v7;
        v29 = self;
        -[WiFiUsageSession completionQueue](self, "completionQueue");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFMeasure start:withCompletionQueue:](v18, "start:withCompletionQueue:", v27, v19);

      }
    }
    else
    {
      NSLog(CFSTR("%s Rejected due to [WiFiUsagePrivacyFilter isInternalInstall]\n"), "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]");
    }
  }
  else if (self->_didHandleFaultEvent
         && objc_msgSend(v6, "isEqualToString:", CFSTR("didHandleFaultEvent")))
  {
    NSLog(CFSTR("%s:%u: Link not ready after handling fault event %@, resetting parameters...\n"), "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]", 802, self->_lastFaultEventHandledReason);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (self->_didBecomePrimary)
      v22 = CFSTR("YES");
    else
      v22 = CFSTR("NO");
    objc_msgSend(v20, "setObject:forKey:", v22, CFSTR("DidBecomePrimary"));
    if (self->_linkUp)
      v23 = CFSTR("YES");
    else
      v23 = CFSTR("NO");
    objc_msgSend(v21, "setObject:forKey:", v23, CFSTR("LinkUp"));
    -[WiFiUsageLinkSession addDictionary:withKeysPrefix:toFlatDictionary:](self, "addDictionary:withKeysPrefix:toFlatDictionary:", v21, CFSTR("FinalResults_"), self->_linkTestResult);
    +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing](WiFiPolicyNetworkActivityTracing, "sharedNetworkActivityTracing");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "networkActivityStop:withReason:withClientMetric:withClientDict:andError:", 1, 3, "linkTestResults", self->_linkTestResult, 0);

    v25 = self->_linkTestResult;
    self->_linkTestResult = 0;

    self->_didHandleFaultEvent = 0;
    lastFaultEventHandledReason = self->_lastFaultEventHandledReason;
    self->_lastFaultEventHandledReason = 0;

    self->_lastFaultEventHandledOptions = 0;
    self->_numLinkTestFailures = 0;

  }
}

void __62__WiFiUsageLinkSession_performLinkTestFor_isTriggeredByFault___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString **v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  int v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  __CFString *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  BOOL v37;
  uint64_t v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  __CFString *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  __CFString *v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  _QWORD *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
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
  uint64_t v81;
  const __CFString *v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  const __CFString *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  _BOOL8 v100;
  int v101;
  uint64_t v102;
  void *v103;
  void *v104;
  NSObject *v105;
  id v106;
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
  uint64_t *v126;
  _BOOL4 v127;
  void *v128;
  _BOOL4 v129;
  void *v130;
  int v131;
  int v132;
  __CFString *v133;
  __CFString *v134;
  __CFString *v135;
  __CFString *v136;
  __CFString *v137;
  uint64_t v138;
  void *v139;
  uint64_t v140;
  __CFString *v141;
  uint64_t v142;
  __CFString *v143;
  uint64_t v144;
  __CFString *v145;
  uint64_t v146;
  __CFString *v147;
  uint64_t v148;
  __CFString *v149;
  _QWORD v150[26];
  _QWORD v151[26];
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  _QWORD v156[2];
  _QWORD v157[2];
  _QWORD v158[2];
  _QWORD v159[2];
  _QWORD v160[2];
  _QWORD v161[2];
  _QWORD v162[2];
  _QWORD v163[2];
  _QWORD v164[2];
  _QWORD v165[4];

  v165[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "statusForDNS");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "statusForLocal");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "statusForInternet");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dnsServers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v3, "dnsServers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = objc_msgSend(v8, "count") == 0;

  }
  else
  {
    v129 = 1;
  }

  objc_msgSend(v3, "gatewayAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v3, "gatewayAddress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = objc_msgSend(v10, "length") == 0;

  }
  else
  {
    v127 = 1;
  }

  objc_msgSend(v3, "statusForSiriTCP");
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "statusForSiriTLS");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("LinkTestFailure"));
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "appendFormat:", CFSTR("_%@"), *(_QWORD *)(a1 + 32));
  objc_msgSend(v13, "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("Invoke"));
  if (v4)
    objc_msgSend(v13, "setObject:forKey:", v4, CFSTR("DNS"));
  if (v5)
    objc_msgSend(v13, "setObject:forKey:", v5, CFSTR("Local"));
  if (v6)
    objc_msgSend(v13, "setObject:forKey:", v6, CFSTR("Internet"));
  v133 = (__CFString *)v12;
  v126 = (uint64_t *)(a1 + 32);
  if (v11)
  {
    objc_msgSend(v13, "setObject:forKey:", v11, CFSTR("SiriTCP"));
    if (!v12)
    {
      v131 = 0;
LABEL_18:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "siriTrafficClass"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v13;
      objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("SiriTrafficClass"));

      goto LABEL_19;
    }
LABEL_17:
    objc_msgSend(v13, "setObject:forKey:", v12, CFSTR("SiriTLS"));
    v131 = 1;
    goto LABEL_18;
  }
  if (v12)
    goto LABEL_17;
  v15 = v13;
  v131 = 0;
LABEL_19:
  if (objc_msgSend(v3, "backhaulResultsValid"))
  {
    objc_msgSend(v3, "downloadError");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      v17 = &kWFMeasureStatusBroken;
    else
      v17 = &kWFMeasureStatusOK;
    objc_msgSend(v15, "setObject:forKey:", *v17, CFSTR("Backhaul"));
  }
  if (*(_BYTE *)(a1 + 48) && objc_msgSend(v3, "seenSpecificAcFailure"))
  {
    objc_msgSend(v3, "statusForAcFailure");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v18, CFSTR("FltBadAC"));

  }
  v134 = v4;
  v135 = v6;
  v136 = v5;
  v137 = v11;
  if (v4 == kWFMeasureStatusOK)
  {
    v132 = 0;
    v30 = v4;
  }
  else
  {
    v19 = kWFMeasureStatusBroken;
    if (v4 == kWFMeasureStatusBroken)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(void **)(a1 + 40);
      v165[0] = &unk_1E8861F68;
      v164[0] = CFSTR("SessionNotificationFaultType");
      v164[1] = CFSTR("SessionNotificationInterfaceName");
      objc_msgSend(v21, "interfaceName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v165[1] = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v165, v164, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v21;
      v5 = v136;
      objc_msgSend(v20, "postNotificationName:object:userInfo:", CFSTR("SessionNotificationFaultEventDetected"), v24, v23);

      v4 = v134;
      v6 = v135;

      v19 = kWFMeasureStatusBroken;
    }
    if (v4)
      v25 = v4 == v19;
    else
      v25 = 1;
    v26 = v25;
    v132 = v26;
    if (v25)
    {
      v27 = CFSTR("_DNSNil");
      if (v127)
        v27 = CFSTR("_DNSNoG");
      if (v129)
        v27 = CFSTR("_DNSNoDNS");
      if (v129 && v127)
        v28 = CFSTR("_DNSNoGDNS");
      else
        v28 = v27;
      if (v4)
        v29 = CFSTR("_DNS");
      else
        v29 = v28;
      objc_msgSend(v139, "appendString:", v29);
    }
    NSLog(CFSTR("%s: statusForDNS - %@ linkTestFailureReasonString %@"), "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", v4, v139);
    v30 = kWFMeasureStatusOK;
  }
  if (v6 == v30)
  {
    v138 = 0;
  }
  else
  {
    v31 = kWFMeasureStatusBroken;
    if (v6 == kWFMeasureStatusBroken)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = *(void **)(a1 + 40);
      v163[0] = &unk_1E8861F80;
      v162[0] = CFSTR("SessionNotificationFaultType");
      v162[1] = CFSTR("SessionNotificationInterfaceName");
      objc_msgSend(v33, "interfaceName");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v163[1] = v34;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v163, v162, 2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v33;
      v5 = v136;
      objc_msgSend(v32, "postNotificationName:object:userInfo:", CFSTR("SessionNotificationFaultEventDetected"), v36, v35);

      v4 = v134;
      v6 = v135;

      v31 = kWFMeasureStatusBroken;
    }
    if (v6)
      v37 = v6 == v31;
    else
      v37 = 1;
    v38 = v37;
    v138 = v38;
    if (v37)
    {
      v39 = CFSTR("_IntNil");
      if (v127)
        v39 = CFSTR("_IntNoG");
      if (v129)
        v39 = CFSTR("_IntNoDNS");
      if (v129 && v127)
        v40 = CFSTR("_IntNoGDNS");
      else
        v40 = v39;
      if (v6)
        v41 = CFSTR("_Int");
      else
        v41 = v40;
      objc_msgSend(v139, "appendString:", v41);
    }
    NSLog(CFSTR("%s: statusForInternet - %@ linkTestFailureReasonString %@"), "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", v6, v139);
    v6 = kWFMeasureStatusOK;
  }
  if (v5 != v6)
  {
    v42 = kWFMeasureStatusBroken;
    if (v5 == kWFMeasureStatusBroken)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = *(void **)(a1 + 40);
      v161[0] = &unk_1E8861F98;
      v160[0] = CFSTR("SessionNotificationFaultType");
      v160[1] = CFSTR("SessionNotificationInterfaceName");
      objc_msgSend(v44, "interfaceName");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v161[1] = v45;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v161, v160, 2);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v44;
      v5 = v136;
      objc_msgSend(v43, "postNotificationName:object:userInfo:", CFSTR("SessionNotificationFaultEventDetected"), v47, v46);

      v4 = v134;
      v42 = kWFMeasureStatusBroken;
      if (!v136)
        goto LABEL_81;
    }
    else if (!v5)
    {
      goto LABEL_81;
    }
    if (v5 != v42)
    {
LABEL_84:
      NSLog(CFSTR("%s: statusForLocal - %@ linkTestFailureReasonString %@"), "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", v5, v139);
      goto LABEL_85;
    }
LABEL_81:
    if ((v138 & 1) == 0)
      NSLog(CFSTR("%s: WARNING - Local test failed while internet test passed"), "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke");
    objc_msgSend(v139, "appendString:", CFSTR("_Loc"));
    goto LABEL_84;
  }
LABEL_85:
  if (*(_BYTE *)(a1 + 48) && objc_msgSend(v3, "seenSpecificAcFailure"))
  {
    objc_msgSend(v3, "statusForAcFailure");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "appendFormat:", CFSTR("_FltBadAC %@"), v48);

    NSLog(CFSTR("%s: Fault with seenSpecificAcFailure - %@ linkTestFailureReasonString %@"), "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", v3, v139);
    NSLog(CFSTR("%s: statusForLocal - %@ linkTestFailureReasonString %@ results %@"), "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", v5, v139, v15);
  }
  v49 = kWFMeasureStatusOK;
  if (v11 && v11 != kWFMeasureStatusOK)
  {
    if (v11 == kWFMeasureStatusBroken)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = *(void **)(a1 + 40);
      v159[0] = &unk_1E8861FB0;
      v158[0] = CFSTR("SessionNotificationFaultType");
      v158[1] = CFSTR("SessionNotificationInterfaceName");
      objc_msgSend(v51, "interfaceName");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v159[1] = v52;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v159, v158, 2);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "postNotificationName:object:userInfo:", CFSTR("SessionNotificationFaultEventDetected"), v51, v53);

      v4 = v134;
    }
    objc_msgSend(v139, "appendString:", CFSTR("_SiriTCP"));
    NSLog(CFSTR("%s: statusForSiriTCP - %@ linkTestFailureReasonString %@ results %@"), "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", v11, v139, v15);
    v49 = kWFMeasureStatusOK;
    v138 = 1;
  }
  v54 = v133;
  v25 = v133 == v49;
  v55 = v131;
  if (v25)
    v55 = 0;
  if (v55 == 1)
  {
    if (v133 == kWFMeasureStatusBroken)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = *(void **)(a1 + 40);
      v157[0] = &unk_1E8861FC8;
      v156[0] = CFSTR("SessionNotificationFaultType");
      v156[1] = CFSTR("SessionNotificationInterfaceName");
      objc_msgSend(v57, "interfaceName");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v157[1] = v58;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v157, v156, 2);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "postNotificationName:object:userInfo:", CFSTR("SessionNotificationFaultEventDetected"), v57, v59);

      v4 = v134;
    }
    objc_msgSend(v139, "appendString:", CFSTR("_SiriTLS"));
    NSLog(CFSTR("%s: statusForSiriTLS - %@ linkTestFailureReasonString %@ results %@"), "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", v133, v139, v15);
    v138 = 1;
  }
  if (*(_BYTE *)(a1 + 48) && objc_msgSend(v3, "seenSpecificAcFailure"))
  {
    objc_msgSend(v139, "appendFormat:", CFSTR("_FltBadAC"));
    NSLog(CFSTR("%s: Fault with seenSpecificAcFailure - %@ linkTestFailureReasonString %@ results %@"), "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", v3, v139, v15);
  }
  NSLog(CFSTR("%s: LQM-WiFi:%@"), "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", v3);
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x1E0DD9960], "sharedAnalyticsProcessor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (v60)
    {
      v61 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v62 = *(_QWORD *)(a1 + 40);
      v63 = (_QWORD *)MEMORY[0x1E0DD9980];
      if (*(_QWORD *)(v62 + 11968))
      {
        v154 = *(_QWORD *)(MEMORY[0x1E0DD9980] + 16);
        v155 = *(_QWORD *)(v62 + 11968);
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v155, &v154, 1);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "addEntriesFromDictionary:", v64);

        v62 = *(_QWORD *)(a1 + 40);
      }
      v124 = v15;
      if (*(_QWORD *)(v62 + 11960))
      {
        v152 = v63[3];
        v153 = *(_QWORD *)(v62 + 11960);
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v153, &v152, 1);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "addEntriesFromDictionary:", v65);

      }
      v150[0] = v63[1];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      v151[0] = v123;
      v150[1] = v63[4];
      v125 = v61;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v129);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      v151[1] = v130;
      v150[2] = v63[5];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v127);
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      v151[2] = v128;
      v150[3] = v63[6];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "dnsResultsValid"));
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      v151[3] = v122;
      v150[4] = v63[7];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "dnsSuccess"));
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      v151[4] = v121;
      v150[5] = v63[8];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v138);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v151[5] = v120;
      v150[6] = v63[9];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "gatewayMaxRTT"));
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v151[6] = v119;
      v150[7] = v63[10];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "gatewayMinRTT"));
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      v151[7] = v118;
      v150[8] = v63[11];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "gatewayPacketLoss"));
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      v151[8] = v117;
      v150[9] = v63[12];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "gatewayResultsValid"));
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = *(_QWORD *)(a1 + 32);
      v151[9] = v116;
      v151[10] = v66;
      v67 = v63[14];
      v150[10] = v63[13];
      v150[11] = v67;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v151[11] = v115;
      v150[12] = v63[15];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "localDNSMaxRTT"));
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v151[12] = v114;
      v150[13] = v63[16];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "localDNSMinRTT"));
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v151[13] = v113;
      v150[14] = v63[17];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "localDNSPacketLoss"));
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v151[14] = v112;
      v150[15] = v63[18];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "localResultsValid"));
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v151[15] = v111;
      v150[16] = v63[19];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "publicDNSMaxRTT"));
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v151[16] = v110;
      v150[17] = v63[20];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "publicDNSMinRTT"));
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v151[17] = v109;
      v150[18] = v63[21];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "publicDNSPacketLoss"));
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v151[18] = v108;
      v150[19] = v63[22];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "publicResultsValid"));
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v151[19] = v107;
      v150[20] = v63[23];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "seenSpecificAcFailure"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v151[20] = v68;
      v150[21] = v63[24];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "siriTCPResultsValid"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v151[21] = v69;
      v150[22] = v63[25];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "siriTCPSuccess"));
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v151[22] = v70;
      v150[23] = v63[26];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "siriTLSResultsValid"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v151[23] = v71;
      v150[24] = v63[27];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "siriTLSSuccess"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v151[24] = v72;
      v150[25] = v63[28];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "siriTrafficClass"));
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v151[25] = v73;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v151, v150, 26);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "addEntriesFromDictionary:", v74);

      v4 = v134;
      if (v134)
      {
        v148 = v63[29];
        v149 = v134;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v149, &v148, 1);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "addEntriesFromDictionary:", v75);

      }
      v54 = v133;
      if (v135)
      {
        v146 = v63[30];
        v147 = v135;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v147, &v146, 1);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "addEntriesFromDictionary:", v76);

      }
      v15 = v124;
      if (v136)
      {
        v144 = v63[31];
        v145 = v136;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v145, &v144, 1);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "addEntriesFromDictionary:", v77);

      }
      if (v137)
      {
        v142 = v63[32];
        v143 = v137;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v143, &v142, 1);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "addEntriesFromDictionary:", v78);

      }
      if (v131)
      {
        v140 = v63[33];
        v141 = v133;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v141, &v140, 1);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "addEntriesFromDictionary:", v79);

      }
      objc_msgSend(MEMORY[0x1E0DD9960], "sharedAnalyticsProcessor");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "processWAMessageMetric:data:", *v63, v125);

    }
  }
  v81 = *(_QWORD *)(a1 + 40);
  if ((v132 | v138) == 1)
  {
    ++*(_QWORD *)(v81 + 11976);
    NSLog(CFSTR("%s:%u: Link test failed (total = %lu) reasonString: %@\n"), "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", 678, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 11976), v139);
    v82 = CFSTR("FoundFailure");
  }
  else
  {
    *(_BYTE *)(v81 + 11985) = 1;
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 11976) = 0;
    NSLog(CFSTR("%s:%u: Link test passed\n"), "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", 684);
    v82 = CFSTR("SuccessfulLinkTest");
  }
  objc_msgSend(v15, "setObject:forKey:", CFSTR("YES"), v82);
  v83 = *(_QWORD *)(a1 + 40);
  if (!*(_BYTE *)(v83 + 11984))
  {
    if (*(_BYTE *)(v83 + 11985) || (v85 = *(_QWORD *)(v83 + 11992), v85 >= 2))
    {
      *(_QWORD *)(v83 + 11992) = 0;
      v86 = *(_QWORD *)(a1 + 40);
      if (!*(_BYTE *)(v86 + 11985))
        NSLog(CFSTR("%s:%u: Link test has not passed in last _numLinkRecoverySkips %lu link tests\n"), "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", 718, *(_QWORD *)(v86 + 11992));
      if ((v138 & 1) != 0)
      {
        if (!v132 || *(_QWORD *)(*(_QWORD *)(a1 + 40) + 11976) < 2uLL)
          goto LABEL_149;
LABEL_138:
        NSLog(CFSTR("%s:%u: linkTestFailureReasonString adding _MaxNonCrit\n"), "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", 726);
        objc_msgSend(v139, "appendFormat:", CFSTR("_MaxNonCrit"));
        goto LABEL_149;
      }
      if (v132)
      {
        if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 11976) > 1uLL)
          goto LABEL_138;
        if (!*(_BYTE *)(a1 + 48))
        {
          NSLog(CFSTR("%s:%u: Found Non Critical Failure, attemping retest\n"), "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", 748);
          objc_msgSend(v15, "setObject:forKey:", CFSTR("YES"), CFSTR("WillAttemptRetest"));
          objc_msgSend(*(id *)(a1 + 40), "addDictionary:withKeysPrefix:toFlatDictionary:", v15, CFSTR("BeforeNonCriticalFailureRetest_"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 12040));
          *(_QWORD *)(*(_QWORD *)(a1 + 40) + 12024) = objc_msgSend(v3, "options");
          objc_msgSend(*(id *)(a1 + 40), "retryLinkTestInOneMinute");
          goto LABEL_157;
        }
LABEL_149:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LinkTestFailure_%@"), *v126);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v139, "isEqualToString:", v99))
        {
          NSLog(CFSTR("%s:%u: Attempting to reset chip with vague reason %@, linkTestIniated %@\n"), "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", 733, v139, *v126);
          v105 = MEMORY[0x1E0C81028];
          v106 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v105, OS_LOG_TYPE_FAULT))
            __62__WiFiUsageLinkSession_performLinkTestFor_isTriggeredByFault___block_invoke_cold_1((uint64_t)v139, v126);

          __assert_rtn("-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", "WiFiUsageLinkSession.m", 735, "false");
        }
        if (v132)
        {
          v100 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 11976) > 1uLL;
        }
        else if ((v138 & 1) != 0)
        {
          v100 = 0;
        }
        else
        {
          v101 = objc_msgSend(v3, "seenSpecificAcFailure");
          v100 = 0;
          v102 = 0;
          if (!v101)
          {
LABEL_156:
            NSLog(CFSTR("%s:%u: Will induce fault recovery with reason: %@  :foundCriticalFailure %d foundNonCriticalFailure %d foundFailure w seenSpecificAcFailure %d\n"), "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", 739, v139, v138, v100, v102);
            objc_msgSend(v15, "setObject:forKey:", CFSTR("YES"), CFSTR("WillInduceFaultEvent"));
            objc_msgSend(*(id *)(a1 + 40), "addDictionary:withKeysPrefix:toFlatDictionary:", v15, CFSTR("BeforeInduceingFault_"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 12040));
            *(_QWORD *)(*(_QWORD *)(a1 + 40) + 12024) = objc_msgSend(v3, "options");
            v103 = *(void **)(a1 + 40);
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v139);
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v103, "handleFaultEventWithReason:", v104);

            goto LABEL_157;
          }
        }
        v102 = *(unsigned __int8 *)(a1 + 48);
        goto LABEL_156;
      }
      if (((v138 & 1) != 0 || objc_msgSend(v3, "seenSpecificAcFailure")) && *(_BYTE *)(a1 + 48))
        goto LABEL_149;
      if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 11985))
      {
        NSLog(CFSTR("%s:%u: Found successful linktest\n"), "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", 757);
        objc_msgSend(*(id *)(a1 + 40), "addDictionary:withKeysPrefix:toFlatDictionary:", v15, CFSTR("FinalResults_"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 12040));
        +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing](WiFiPolicyNetworkActivityTracing, "sharedNetworkActivityTracing");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v93 = v92;
        v94 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 12040);
        v95 = 2;
LABEL_147:
        objc_msgSend(v92, "networkActivityStop:withReason:withClientMetric:withClientDict:andError:", 1, v95, "linkTestResults", v94, 0);

        *(_QWORD *)(*(_QWORD *)(a1 + 40) + 12024) = 0;
        v97 = *(_QWORD *)(a1 + 40);
        v98 = *(void **)(v97 + 12040);
        *(_QWORD *)(v97 + 12040) = 0;

        goto LABEL_157;
      }
      NSLog(CFSTR("%s:%u: Not proceeding with linktest\n"), "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", 769);
      v96 = CFSTR("LinkRecoverySkips");
    }
    else
    {
      *(_QWORD *)(v83 + 11992) = v85 + 1;
      NSLog(CFSTR("%s:%u: Link test did not pass, skipping recovery (skips = %lu)\n"), "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", 784, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 11992));
      v96 = CFSTR("SkippingRecovery");
    }
    objc_msgSend(v15, "setObject:forKey:", CFSTR("YES"), v96);
    objc_msgSend(*(id *)(a1 + 40), "addDictionary:withKeysPrefix:toFlatDictionary:", v15, CFSTR("FinalResults_"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 12040));
    +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing](WiFiPolicyNetworkActivityTracing, "sharedNetworkActivityTracing");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = v92;
    v94 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 12040);
    v95 = 4;
    goto LABEL_147;
  }
  NSLog(CFSTR("%s:%u: Link test completed after _didHandleFaultEvent, %@\n"), "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", 690, *v126);
  if (objc_msgSend((id)*v126, "isEqualToString:", CFSTR("didHandleFaultEvent")))
  {
    if (((v132 | v138) & 1) != 0)
    {
      objc_msgSend(v15, "setObject:forKey:", CFSTR("YES"), CFSTR("FaultEventLinkNotRecovered"));
      NSLog(CFSTR("%s:%u: Link test failed after handling fault event %@, not trying to handle fault event again\n"), "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", 699, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 12016));
      v84 = 3;
    }
    else
    {
      objc_msgSend(v15, "setObject:forKey:", CFSTR("YES"), CFSTR("FaultEventRecoveredLink"));
      NSLog(CFSTR("%s:%u: Link test passed after handling fault event %@\n"), "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke", 696, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 12016));
      v84 = 2;
    }
    objc_msgSend(*(id *)(a1 + 40), "addDictionary:withKeysPrefix:toFlatDictionary:", v15, CFSTR("FinalResults_"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 12040));
    +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing](WiFiPolicyNetworkActivityTracing, "sharedNetworkActivityTracing");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "networkActivityStop:withReason:withClientMetric:withClientDict:andError:", 1, v84, "linkTestResults", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 12040), 0);

    v88 = *(_QWORD *)(a1 + 40);
    v89 = *(void **)(v88 + 12040);
    *(_QWORD *)(v88 + 12040) = 0;

    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 11984) = 0;
    v90 = *(_QWORD *)(a1 + 40);
    v91 = *(void **)(v90 + 12016);
    *(_QWORD *)(v90 + 12016) = 0;

    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 12024) = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 11976) = 0;
    v54 = v133;
    v4 = v134;
  }
LABEL_157:

}

- (void)systemWakeStateDidChange:(BOOL)a3 wokenByWiFi:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WiFiUsageLinkSession;
  -[WiFiUsageSession systemWakeStateDidChange:wokenByWiFi:](&v4, sel_systemWakeStateDidChange_wokenByWiFi_, a3, a4);
}

- (void)processIPv4Changes:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WiFiUsageLinkSession;
  -[WiFiUsageSession processIPv4Changes:](&v3, sel_processIPv4Changes_, a3);
}

- (void)processIPv6Changes:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WiFiUsageLinkSession;
  -[WiFiUsageSession processIPv6Changes:](&v3, sel_processIPv6Changes_, a3);
}

- (void)processDHCPChanges:(id)a3
{
  _BOOL8 linkUp;
  id v5;
  objc_super v6;

  linkUp = self->_linkUp;
  v5 = a3;
  NSLog(CFSTR("%s:%d, _linkUp[%d], dictionary: %@"), "-[WiFiUsageLinkSession processDHCPChanges:]", 897, linkUp, v5);
  v6.receiver = self;
  v6.super_class = (Class)WiFiUsageLinkSession;
  -[WiFiUsageSession processDHCPChanges:](&v6, sel_processDHCPChanges_, v5);

}

- (void)rangingCompleted
{
  objc_super v3;

  NSLog(CFSTR("%s:%d, _linkUp[%d]"), a2, "-[WiFiUsageLinkSession rangingCompleted]", 918, self->_linkUp);
  v3.receiver = self;
  v3.super_class = (Class)WiFiUsageLinkSession;
  -[WiFiUsageSession rangingCompleted](&v3, sel_rangingCompleted);
}

- (void)processDriverAvailability:(id)a3 available:(unint64_t)a4 version:(unint64_t)a5 flags:(unint64_t)a6 eventID:(unint64_t)a7 reason:(unint64_t)a8 subReason:(unint64_t)a9 minorReason:(unint64_t)a10 reasonString:(id)a11
{
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WiFiUsageLinkSession;
  -[WiFiUsageSession processDriverAvailability:available:version:flags:eventID:reason:subReason:minorReason:reasonString:](&v11, sel_processDriverAvailability_available_version_flags_eventID_reason_subReason_minorReason_reasonString_, a3, a4, a5, a6, a7, a8, a9, a10, a11);
}

- (void)updateLinkRecoveryDisabled:(BOOL)a3
{
  -[WiFiUsageSession setLinkRecoveryDisabled:](self, "setLinkRecoveryDisabled:", a3);
  NSLog(CFSTR("%s Link recovery disabled = %u"), "-[WiFiUsageLinkSession updateLinkRecoveryDisabled:]", -[WiFiUsageSession linkRecoveryDisabled](self, "linkRecoveryDisabled"));
}

- (void)updateLinkTestInterval:(unint64_t)a3
{
  self->_periodicLinkTestInterval = a3;
  NSLog(CFSTR("%s New interval = %lu min"), a2, "-[WiFiUsageLinkSession updateLinkTestInterval:]", a3);
}

- (void)getLazyNSNumberPreference:(id)a3 exists:(id)a4
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = (void (**)(id, void *))a4;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persistentDomainForName:", CFSTR("com.apple.wifipolicy.usagelinksession"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    NSLog(CFSTR("%s: Found preference value in domain: %@ key: %@"), "-[WiFiUsageLinkSession getLazyNSNumberPreference:exists:]", CFSTR("com.apple.wifipolicy.usagelinksession"), v9);
    v5[2](v5, v8);
  }

}

- (void)addDictionary:(id)a3 withKeysPrefix:(id)a4 toFlatDictionary:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__WiFiUsageLinkSession_addDictionary_withKeysPrefix_toFlatDictionary___block_invoke;
  v11[3] = &unk_1E881CC20;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v11);

}

void __70__WiFiUsageLinkSession_addDictionary_withKeysPrefix_toFlatDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "valueForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(void **)(a1 + 40);
  if (v6)
  {
    objc_msgSend(v7, "valueForKey:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s: keyWithPrefix already exists in dictionary: keyWithPrefix: %@ existing value %@ objValue %@"), "-[WiFiUsageLinkSession addDictionary:withKeysPrefix:toFlatDictionary:]_block_invoke", v5, v8, v9);

  }
  else
  {
    objc_msgSend(v7, "setObject:forKey:", v9, v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkTestResult, 0);
  objc_storeStrong((id *)&self->_lastFaultEventHandledReason, 0);
  objc_storeStrong((id *)&self->_lastFaultEventHandled, 0);
  objc_storeStrong((id *)&self->_bssid, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_lastFaultIndicationTime, 0);
  objc_storeStrong((id *)&self->_lastLinkTest, 0);
}

void __62__WiFiUsageLinkSession_performLinkTestFor_isTriggeredByFault___block_invoke_cold_1(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *a2;
  v3 = 136315906;
  v4 = "-[WiFiUsageLinkSession performLinkTestFor:isTriggeredByFault:]_block_invoke";
  v5 = 1024;
  v6 = 734;
  v7 = 2112;
  v8 = a1;
  v9 = 2112;
  v10 = v2;
  _os_log_fault_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "%s:%u: Attempting to reset chip with vague reason %@, linkTestIniated %@\n", (uint8_t *)&v3, 0x26u);
}

@end
