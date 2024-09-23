@implementation WRM_iRATClientControllerTerminus

- (WRM_iRATClientControllerTerminus)init
{
  WRM_iRATClientControllerTerminus *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WRM_iRATClientControllerTerminus;
  v2 = -[WRM_iRATClientController init](&v4, "init");
  if (v2)
  {
    -[WRM_iRATClientControllerTerminus setQueue:](v2, "setQueue:", dispatch_queue_create("com.apple.WirelessRadioManager.iRATClientTerminus", 0));
    -[WRM_iRATClientControllerTerminus setMTerminusContext:](v2, "setMTerminusContext:", objc_alloc_init(WRM_TerminusContext));
    -[WRM_iRATClientControllerTerminus setRxClientType:](v2, "setRxClientType:", 0);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("WRM_iRATClientControllerTerminus: dealloc!!!"));
  if (-[WRM_iRATClientControllerTerminus queue](self, "queue"))
    dispatch_release((dispatch_object_t)-[WRM_iRATClientControllerTerminus queue](self, "queue"));
  -[WRM_iRATClientControllerTerminus setQueue:](self, "setQueue:", 0);
  if (-[WRM_iRATClientControllerTerminus mTerminusContext](self, "mTerminusContext"))
  {

    -[WRM_iRATClientControllerTerminus setMTerminusContext:](self, "setMTerminusContext:", 0);
  }
  -[WRM_iRATClientControllerTerminus setRxClientType:](self, "setRxClientType:", 0);
  v3.receiver = self;
  v3.super_class = (Class)WRM_iRATClientControllerTerminus;
  -[WRM_iRATClientController dealloc](&v3, "dealloc");
}

- (void)handleMessage:(id)a3
{
  int64_t uint64;

  uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  if (uint64 > 420)
  {
    if (uint64 != 421)
    {
      if (uint64 == 2500)
      {
        -[WRM_iRATClientController setLowPowerModePeriodicWakeUpNotificationSubscribed:](self, "setLowPowerModePeriodicWakeUpNotificationSubscribed:", 1);
        return;
      }
      goto LABEL_8;
    }
    objc_msgSend(+[WRM_IDSLinkEvalManager WRM_IDSLinkEvalManagerSingleton](WRM_IDSLinkEvalManager, "WRM_IDSLinkEvalManagerSingleton"), "updateControllerState:", a3);
  }
  else
  {
    if (uint64 != 413)
    {
      if (uint64 == 414)
      {
        -[WRM_iRATClientControllerTerminus handleSubscribeStatusUpdateTerminus:](self, "handleSubscribeStatusUpdateTerminus:", a3);
        return;
      }
LABEL_8:
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("Received unsupported iRAT client message"));
      return;
    }
    -[WRM_iRATClientControllerTerminus handleLinkPrefSubscribeTerminus:](self, "handleLinkPrefSubscribeTerminus:", a3);
  }
}

- (void)handleLinkPrefSubscribeTerminus:(id)a3
{
  xpc_dictionary_set_uint64(a3, "kClientType", -[WRM_iRATClientController getMyClientType](self, "getMyClientType"));
  if (xpc_dictionary_get_value(a3, "kMessageArgs"))
    objc_msgSend(+[WRM_IDSLinkEvalManager WRM_IDSLinkEvalManagerSingleton](WRM_IDSLinkEvalManager, "WRM_IDSLinkEvalManagerSingleton"), "updateControllerState:", a3);
  else
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("Discarding invalid Subscribe message from Terminus client"));
}

- (void)handleSubscribeStatusUpdateTerminus:(id)a3
{
  xpc_object_t value;
  void *v5;
  uint64_t uint64;

  xpc_dictionary_set_uint64(a3, "kClientType", -[WRM_iRATClientController getMyClientType](self, "getMyClientType"));
  value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value)
  {
    v5 = value;
    uint64 = xpc_dictionary_get_uint64(value, "kWRMProximityLinkRecommendationType");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("Application link preference %d active %d"), uint64, xpc_dictionary_get_BOOL(v5, "kWRMProximityAppLinkPreferenceActive"));
    objc_msgSend(+[WRM_IDSLinkEvalManager WRM_IDSLinkEvalManagerSingleton](WRM_IDSLinkEvalManager, "WRM_IDSLinkEvalManagerSingleton"), "updateControllerState:", a3);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("Discarding invalid status update message from Terminus client"));
  }
}

- (void)handleLinkPreferenceNotificationTerminus
{
  xpc_object_t v3;
  BOOL v4;
  xpc_object_t v5;
  BOOL v6;
  xpc_object_t v7;
  BOOL v8;
  xpc_object_t v9;
  size_t count;
  size_t v11;
  xpc_object_t v12;
  size_t v13;
  size_t v14;
  size_t i;
  xpc_object_t value;

  v3 = xpc_array_create(0, 0);
  if (-[WRM_TerminusContext mBtLinkRecommendationUpdateNeeded](-[WRM_iRATClientControllerTerminus mTerminusContext](self, "mTerminusContext"), "mBtLinkRecommendationUpdateNeeded")|| -[WRM_TerminusContext mForceUpdateNeeded](-[WRM_iRATClientControllerTerminus mTerminusContext](self, "mTerminusContext"), "mForceUpdateNeeded"))
  {
    v4 = -[WRM_TerminusContext mBtLinkIsRecommended](-[WRM_iRATClientControllerTerminus mTerminusContext](self, "mTerminusContext"), "mBtLinkIsRecommended");
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v5, "kWRMProximityLinkRecommendationType", 1uLL);
    xpc_dictionary_set_BOOL(v5, "kWRMProximityLinkisRecommended", v4);
    xpc_array_append_value(v3, v5);
    -[WRM_TerminusContext setMBtLinkRecommendationUpdateNeeded:](-[WRM_iRATClientControllerTerminus mTerminusContext](self, "mTerminusContext"), "setMBtLinkRecommendationUpdateNeeded:", 0);
  }
  if (-[WRM_TerminusContext mCompanionWifiLinkRecommendationUpdateNeeded](-[WRM_iRATClientControllerTerminus mTerminusContext](self, "mTerminusContext"), "mCompanionWifiLinkRecommendationUpdateNeeded"))
  {
    v6 = -[WRM_TerminusContext mCompanionWifiLinkIsRecommended](-[WRM_iRATClientControllerTerminus mTerminusContext](self, "mTerminusContext"), "mCompanionWifiLinkIsRecommended");
    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v7, "kWRMProximityLinkRecommendationType", 0);
    xpc_dictionary_set_BOOL(v7, "kWRMProximityLinkisRecommended", v6);
    xpc_array_append_value(v3, v7);
    -[WRM_TerminusContext setMCompanionWifiLinkRecommendationUpdateNeeded:](-[WRM_iRATClientControllerTerminus mTerminusContext](self, "mTerminusContext"), "setMCompanionWifiLinkRecommendationUpdateNeeded:", 0);
  }
  if (-[WRM_TerminusContext mDirectWifiLinkRecommendationUpdateNeeded](-[WRM_iRATClientControllerTerminus mTerminusContext](self, "mTerminusContext"), "mDirectWifiLinkRecommendationUpdateNeeded")|| -[WRM_TerminusContext mForceUpdateNeeded](-[WRM_iRATClientControllerTerminus mTerminusContext](self, "mTerminusContext"), "mForceUpdateNeeded"))
  {
    v8 = -[WRM_TerminusContext mDirectWifiLinkIsRecommended](-[WRM_iRATClientControllerTerminus mTerminusContext](self, "mTerminusContext"), "mDirectWifiLinkIsRecommended");
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v9, "kWRMProximityLinkRecommendationType", 2uLL);
    xpc_dictionary_set_BOOL(v9, "kWRMProximityLinkisRecommended", v8);
    xpc_dictionary_set_uint64(v9, "kWRMProximityBtRssi", -[WRM_TerminusContext btMovingAvgRSSI](-[WRM_iRATClientControllerTerminus mTerminusContext](self, "mTerminusContext"), "btMovingAvgRSSI"));
    xpc_dictionary_set_int64(v9, "kWRMProximityBtRetransmissionRateTx", -[WRM_TerminusContext btRetransmissionRateTx](-[WRM_iRATClientControllerTerminus mTerminusContext](self, "mTerminusContext"), "btRetransmissionRateTx"));
    xpc_dictionary_set_int64(v9, "kWRMProximityBtRetransmissionRateRx", -[WRM_TerminusContext btRetransmissionRateRx](-[WRM_iRATClientControllerTerminus mTerminusContext](self, "mTerminusContext"), "btRetransmissionRateRx"));
    xpc_dictionary_set_int64(v9, "kWRMProximityBtTech", -[WRM_TerminusContext btTech](-[WRM_iRATClientControllerTerminus mTerminusContext](self, "mTerminusContext"), "btTech"));
    xpc_dictionary_set_int64(v9, "kWRMProximityWifiRssi", -[WRM_TerminusContext wifiRSSI](-[WRM_iRATClientControllerTerminus mTerminusContext](self, "mTerminusContext"), "wifiRSSI"));
    xpc_dictionary_set_int64(v9, "kWRMProximityWifiSnr", -[WRM_TerminusContext wifiSNR](-[WRM_iRATClientControllerTerminus mTerminusContext](self, "mTerminusContext"), "wifiSNR"));
    xpc_dictionary_set_int64(v9, "kWRMProximityWifiBeaconPer", -[WRM_TerminusContext beaconPER](-[WRM_iRATClientControllerTerminus mTerminusContext](self, "mTerminusContext"), "beaconPER"));
    xpc_dictionary_set_int64(v9, "kWRMProximityWifiNwType", -[WRM_TerminusContext nwType](-[WRM_iRATClientControllerTerminus mTerminusContext](self, "mTerminusContext"), "nwType"));
    xpc_dictionary_set_int64(v9, "kWRMProximityWifiLSMBeRecommendation", -[WRM_TerminusContext lsmRecommendationBe](-[WRM_iRATClientControllerTerminus mTerminusContext](self, "mTerminusContext"), "lsmRecommendationBe"));
    xpc_dictionary_set_int64(v9, "kWRMProximityWifiExpectedThroughputVIBE", -[WRM_TerminusContext expectedThroughputVIBE](-[WRM_iRATClientControllerTerminus mTerminusContext](self, "mTerminusContext"), "expectedThroughputVIBE"));
    xpc_dictionary_set_int64(v9, "kWRMProximityWifiPacketLifetimeVIBE", -[WRM_TerminusContext packetLifetimeVIBE](-[WRM_iRATClientControllerTerminus mTerminusContext](self, "mTerminusContext"), "packetLifetimeVIBE"));
    xpc_dictionary_set_int64(v9, "kWRMProximityWifiPacketLossRateVIBE", -[WRM_TerminusContext packetLossRateVIBE](-[WRM_iRATClientControllerTerminus mTerminusContext](self, "mTerminusContext"), "packetLossRateVIBE"));
    xpc_array_append_value(v3, v9);
    -[WRM_TerminusContext setMDirectWifiLinkRecommendationUpdateNeeded:](-[WRM_iRATClientControllerTerminus mTerminusContext](self, "mTerminusContext"), "setMDirectWifiLinkRecommendationUpdateNeeded:", 0);
  }
  count = xpc_array_get_count(v3);
  if (count)
  {
    v11 = count;
    v12 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v12, "kWRMApplicationTypeList", v3);
    -[WCM_Controller sendMessage:withArgs:](self, "sendMessage:withArgs:", 1305, v12);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("Sending Proximity Link Preference Notification having %d recommendation(s)"), v11);
    v13 = xpc_array_get_count(v3);
    if (v13)
    {
      v14 = v13;
      for (i = 0; i != v14; ++i)
      {
        value = xpc_array_get_value(v3, i);
        xpc_release(value);
      }
    }
    xpc_release(v12);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("No need to send link preference notification as no change in recommendation"));
  }
  xpc_release(v3);
  -[WRM_TerminusContext setMForceUpdateNeeded:](-[WRM_iRATClientControllerTerminus mTerminusContext](self, "mTerminusContext"), "setMForceUpdateNeeded:", 0);
  -[WRM_TerminusContext setMIsRetry:](-[WRM_iRATClientControllerTerminus mTerminusContext](self, "mTerminusContext"), "setMIsRetry:", 0);
}

- (OS_dispatch_queue)queue
{
  return *(OS_dispatch_queue **)(&self->super.mLowPowerModePeriodicWakeUpNotificationSubscribed + 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 81);
}

- (WRM_TerminusContext)mTerminusContext
{
  return *(WRM_TerminusContext **)((char *)&self->_rxClientType + 1);
}

- (void)setMTerminusContext:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 89);
}

- (int)rxClientType
{
  return *(_DWORD *)((char *)&self->super.mActiveSlot + 5);
}

- (void)setRxClientType:(int)a3
{
  *(_DWORD *)((char *)&self->super.mActiveSlot + 5) = a3;
}

@end
