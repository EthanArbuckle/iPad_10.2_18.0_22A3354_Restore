@implementation WCM_WiFiController

- (BOOL)powerState
{
  return *((_BYTE *)&self->super.mProcessId + 4);
}

- (WCM_WiFiService)wifiService
{
  return *(WCM_WiFiService **)(&self->_leScanGrantDuration + 1);
}

- (int)wifiState
{
  return *(_DWORD *)&self->_powerState;
}

- (void)updateCatsState:(unsigned __int8)a3 bitmap:(unint64_t)a4
{
  _QWORD v4[5];
  unsigned __int8 v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000C180;
  v4[3] = &unk_100205818;
  v5 = a3;
  v4[4] = a4;
  dispatch_async((dispatch_queue_t)objc_msgSend(+[WCM_Server singleton](WCM_Server, "singleton"), "getQueue"), v4);
}

- (void)setCatsAppPriority:(unsigned __int8)a3
{
  *((_BYTE *)&self->super.mProcessId + 7) = a3;
}

- (void)setCatsAppBitmap:(unint64_t)a3
{
  *(WCM_WiFiService **)((char *)&self->_wifiService + 4) = (WCM_WiFiService *)a3;
}

- (BOOL)isSideCarInProgress
{
  return -[WCM_WiFiService isSideCarInProgress](-[WCM_WiFiController wifiService](self, "wifiService"), "isSideCarInProgress");
}

- (BOOL)isEnsembleInProgress
{
  return -[WCM_WiFiService isEnsembleInProgress](-[WCM_WiFiController wifiService](self, "wifiService"), "isEnsembleInProgress");
}

- (BOOL)isAutoUnlockRangingInProgress
{
  return -[WCM_WiFiService isAutoUnlockRangingInProgress](-[WCM_WiFiController wifiService](self, "wifiService"), "isAutoUnlockRangingInProgress");
}

- (BOOL)hostAP
{
  return *((_BYTE *)&self->super.mProcessId + 5);
}

- (int)getPhyMode
{
  return -[WCM_WiFiService getPhyMode](-[WCM_WiFiController wifiService](self, "wifiService"), "getPhyMode");
}

- (unsigned)catsAppPriority
{
  return *((_BYTE *)&self->super.mProcessId + 7);
}

- (unint64_t)catsAppBitmap
{
  return *(unint64_t *)((char *)&self->_wifiService + 4);
}

- (WCM_WiFiController)init
{
  char *v3;
  WCM_WiFiController *v4;
  _QWORD block[5];
  objc_super v7;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WiFi controller init"));
  v7.receiver = self;
  v7.super_class = (Class)WCM_WiFiController;
  v3 = -[WCM_Controller init](&v7, "init");
  v4 = (WCM_WiFiController *)v3;
  if (v3)
  {
    v3[20] = 0;
    *((_DWORD *)v3 + 6) = 0;
    v3[21] = 0;
    *((_DWORD *)v3 + 7) = 0;
    *((_DWORD *)v3 + 8) = 0;
    *((_DWORD *)v3 + 9) = 0;
    *((_DWORD *)v3 + 10) = 0;
    *((_DWORD *)v3 + 11) = 0;
    v3[23] = 0;
    *(_QWORD *)(v3 + 68) = 0;
    *((_DWORD *)v3 + 13) = 10;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000CF40C;
    block[3] = &unk_1002019E8;
    block[4] = v3;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  _QWORD block[5];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WiFi controller dealloc"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CF4F8;
  block[3] = &unk_1002019E8;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  v3.receiver = self;
  v3.super_class = (Class)WCM_WiFiController;
  -[WCM_Controller dealloc](&v3, "dealloc");
}

- (void)handlePowerState:(BOOL)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 5, CFSTR("WiFi powerState(%d -> %d)"), *((unsigned __int8 *)&self->super.mProcessId + 4), a3);
  *((_BYTE *)&self->super.mProcessId + 4) = a3;
}

- (id)getWiFiServiceSingletone
{
  const char *v3;
  unsigned int v4;

  if (-[WCM_Controller getProcessId](self, "getProcessId"))
  {
    if (-[WCM_Controller getProcessId](self, "getProcessId") == 1)
    {
      v3 = "WCMWiFi";
    }
    else if (-[WCM_Controller getProcessId](self, "getProcessId") == 2)
    {
      v3 = "WCMFaceTime";
    }
    else if (-[WCM_Controller getProcessId](self, "getProcessId") == 3)
    {
      v3 = "WCMCellular";
    }
    else if (-[WCM_Controller getProcessId](self, "getProcessId") == 4)
    {
      v3 = "WCMBT";
    }
    else
    {
      if (-[WCM_Controller getProcessId](self, "getProcessId") == 5)
        goto LABEL_12;
      if (-[WCM_Controller getProcessId](self, "getProcessId") == 29)
      {
        v3 = "WCMRCU1";
        goto LABEL_82;
      }
      if (-[WCM_Controller getProcessId](self, "getProcessId") == 30)
      {
        v3 = "WCMRCU2";
        goto LABEL_82;
      }
      if (-[WCM_Controller getProcessId](self, "getProcessId") == 31)
      {
        v3 = "WRMAirPlay";
        goto LABEL_82;
      }
      if (-[WCM_Controller getProcessId](self, "getProcessId") == 38)
      {
        v3 = "WCMP2PAWDL";
        goto LABEL_82;
      }
      if (-[WCM_Controller getProcessId](self, "getProcessId") == 39)
      {
        v3 = "WCMP2PNAN";
        goto LABEL_82;
      }
      if (-[WCM_Controller getProcessId](self, "getProcessId") == 6)
      {
        v3 = "WRMCommander";
        goto LABEL_82;
      }
      if (-[WCM_Controller getProcessId](self, "getProcessId") == 7)
      {
        v3 = "WRMCommCenter";
        goto LABEL_82;
      }
      if (-[WCM_Controller getProcessId](self, "getProcessId") == 8)
      {
        v3 = "WRMNetworkd";
        goto LABEL_82;
      }
      if (-[WCM_Controller getProcessId](self, "getProcessId") == 9)
      {
        v3 = "WRMWiFiCalling";
        goto LABEL_82;
      }
      if (-[WCM_Controller getProcessId](self, "getProcessId") == 10)
      {
        v3 = "WRMIPTelephony";
        goto LABEL_82;
      }
      if (-[WCM_Controller getProcessId](self, "getProcessId") == 11)
      {
        v3 = "WRMIdsClient";
        goto LABEL_82;
      }
      if (-[WCM_Controller getProcessId](self, "getProcessId") == 12)
      {
        v3 = "WRMIdsTool";
        goto LABEL_82;
      }
      if (-[WCM_Controller getProcessId](self, "getProcessId") == 13)
      {
        v3 = "WRMIMGVideo";
        goto LABEL_82;
      }
      if (-[WCM_Controller getProcessId](self, "getProcessId") == 14)
      {
        v3 = "WRMFaceTimeCalling";
        goto LABEL_82;
      }
      if (-[WCM_Controller getProcessId](self, "getProcessId") == 15)
      {
        v3 = "WRMCallKitTelephony";
        goto LABEL_82;
      }
      if (-[WCM_Controller getProcessId](self, "getProcessId") == 16)
      {
        v3 = "WRMLocationd";
        goto LABEL_82;
      }
      if (-[WCM_Controller getProcessId](self, "getProcessId") == 17)
      {
        v3 = "WRMCarousel";
        goto LABEL_82;
      }
      if (-[WCM_Controller getProcessId](self, "getProcessId") == 18)
      {
        v3 = "WRMMusic";
        goto LABEL_82;
      }
      if (-[WCM_Controller getProcessId](self, "getProcessId") == 19)
      {
        v3 = "WRMTerminus";
        goto LABEL_82;
      }
      if (-[WCM_Controller getProcessId](self, "getProcessId") == 20)
      {
        v3 = "WRMIMGVideoTest";
        goto LABEL_82;
      }
      if (-[WCM_Controller getProcessId](self, "getProcessId") == 21)
      {
        v3 = "WRMCommCenter1";
        goto LABEL_82;
      }
      if (-[WCM_Controller getProcessId](self, "getProcessId") == 22)
      {
        v3 = "WRMSiri";
        goto LABEL_82;
      }
      if (-[WCM_Controller getProcessId](self, "getProcessId") == 23)
      {
        v3 = "WRMWebkit";
        goto LABEL_82;
      }
      if (-[WCM_Controller getProcessId](self, "getProcessId") == 24)
      {
        v3 = "WRMWebkitMail";
        goto LABEL_82;
      }
      if (-[WCM_Controller getProcessId](self, "getProcessId") == 25)
      {
        v3 = "WRMWebkitNotification";
        goto LABEL_82;
      }
      if (-[WCM_Controller getProcessId](self, "getProcessId") == 26)
      {
        v3 = "WRMWirelessStress";
        goto LABEL_82;
      }
      if (-[WCM_Controller getProcessId](self, "getProcessId") == 33)
      {
        v3 = "WRMNPT";
        goto LABEL_82;
      }
      if (-[WCM_Controller getProcessId](self, "getProcessId") == 34)
      {
        v3 = "WRMCoreMediaStreaming";
        goto LABEL_82;
      }
      if (-[WCM_Controller getProcessId](self, "getProcessId") == 35)
      {
        v3 = "WCMSharing";
        goto LABEL_82;
      }
      if (-[WCM_Controller getProcessId](self, "getProcessId") == 37)
      {
        v3 = "WCMFrequencyTool";
        goto LABEL_82;
      }
      if (-[WCM_Controller getProcessId](self, "getProcessId") == 27)
      {
        v3 = "WRMTest";
        goto LABEL_82;
      }
      if (-[WCM_Controller getProcessId](self, "getProcessId") == 5)
      {
LABEL_12:
        v3 = "WCMTest";
      }
      else if (-[WCM_Controller getProcessId](self, "getProcessId") == 40)
      {
        v3 = "WRMHomeKit";
      }
      else if (-[WCM_Controller getProcessId](self, "getProcessId") == 41)
      {
        v3 = "WRMMIC";
      }
      else
      {
        v4 = -[WCM_Controller getProcessId](self, "getProcessId");
        v3 = "INVALID_PROC_ID!!!";
        if (v4 == 42)
          v3 = "WRMSOS";
      }
    }
  }
  else
  {
    v3 = "WCMUnknown";
  }
LABEL_82:
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCM_WiFiController(%s) getWiFiServiceSingletone default implementation"), v3);
  return 0;
}

- (BOOL)isAssociated
{
  return -[WCM_WiFiService isAssociated](-[WCM_WiFiController wifiService](self, "wifiService"), "isAssociated");
}

- (BOOL)isAWDLInProgress
{
  return -[WCM_WiFiService isAWDLInProgress](-[WCM_WiFiController wifiService](self, "wifiService"), "isAWDLInProgress");
}

- (BOOL)isCarPlaySessionInProgress
{
  return -[WCM_WiFiService isCarPlaySessionInProgress](-[WCM_WiFiController wifiService](self, "wifiService"), "isCarPlaySessionInProgress");
}

- (int)getCarPlayScanRelaxReason
{
  return -[WCM_WiFiService getCarPlayScanRelaxReason](-[WCM_WiFiController wifiService](self, "wifiService"), "getCarPlayScanRelaxReason");
}

- (id)getLeastCongestedWifiParam
{
  return -[WCM_WiFiService getLeastCongestedWifiParam](-[WCM_WiFiController wifiService](self, "wifiService"), "getLeastCongestedWifiParam");
}

- (BOOL)didWiFiDeviceReset
{
  return -[WCM_WiFiService didWiFiDeviceReset](-[WCM_WiFiController wifiService](self, "wifiService"), "didWiFiDeviceReset");
}

- (void)handleWiFiResetFlag
{
  -[WCM_WiFiService setWiFiResetFlag](-[WCM_WiFiController wifiService](self, "wifiService"), "setWiFiResetFlag");
}

- (BOOL)isCoPresenceInProgress
{
  return -[WCM_WiFiService isCoPresenceInProgress](-[WCM_WiFiController wifiService](self, "wifiService"), "isCoPresenceInProgress");
}

- (int64_t)getNumberOfSpatialStream
{
  return -[WCM_WiFiService getNumberOfSpatialStream](-[WCM_WiFiController wifiService](self, "wifiService"), "getNumberOfSpatialStream");
}

- (int64_t)getNumberOfSpatialStreamOnAccessPoint
{
  return -[WCM_WiFiService getNumberOfSpatialStreamOnAccessPoint](-[WCM_WiFiController wifiService](self, "wifiService"), "getNumberOfSpatialStreamOnAccessPoint");
}

- (void)toggleWiFiLQMIfNeeded:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000CFBC4;
  v3[3] = &unk_100201E38;
  v4 = a3;
  v3[4] = self;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)updatePowerState:(BOOL)a3
{
  _QWORD block[4];
  BOOL v4;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CFD04;
  block[3] = &unk_100201FF0;
  v4 = a3;
  dispatch_async((dispatch_queue_t)objc_msgSend(+[WCM_Server singleton](WCM_Server, "singleton"), "getQueue"), block);
}

- (void)updateCarPlaySessionState:(BOOL)a3 reason:(int)a4
{
  _QWORD block[4];
  int v5;
  BOOL v6;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CFDB8;
  block[3] = &unk_1002057F8;
  v6 = a3;
  v5 = a4;
  dispatch_async((dispatch_queue_t)objc_msgSend(+[WCM_Server singleton](WCM_Server, "singleton"), "getQueue"), block);
}

- (void)updateContentionFreeWiFiInfoToRC2:(unsigned int)a3 count:(unsigned int)a4
{
  _QWORD block[4];
  unsigned int v5;
  unsigned int v6;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CFEC4;
  block[3] = &unk_100203228;
  v5 = a3;
  v6 = a4;
  dispatch_async((dispatch_queue_t)objc_msgSend(+[WCM_Server singleton](WCM_Server, "singleton"), "getQueue"), block);
}

- (void)updateCatsStateWrapper:(unsigned __int8)a3 bitmap:(unint64_t)a4 scanGrantDuration:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v7;
  id v9;

  v5 = *(_QWORD *)&a5;
  v7 = a3;
  v9 = objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "wifiController");
  if (v9)
  {
    objc_msgSend(v9, "setLeScanGrantDuration:", v5);
    -[WCM_WiFiController updateCatsState:bitmap:](self, "updateCatsState:bitmap:", v7, a4);
  }
}

- (void)updateWiFiState:(int)a3 channel:(unsigned int)a4 centerFreq:(unsigned int)a5 bandwidth:(unsigned int)a6 hostAp:(BOOL)a7
{
  _QWORD block[4];
  int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  BOOL v12;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D0058;
  block[3] = &unk_100205838;
  v8 = a3;
  v9 = a4;
  v12 = a7;
  v10 = a5;
  v11 = a6;
  dispatch_async((dispatch_queue_t)objc_msgSend(+[WCM_Server singleton](WCM_Server, "singleton"), "getQueue"), block);
}

- (void)update5GHzHostAPState:(BOOL)a3
{
  _QWORD block[4];
  BOOL v4;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D047C;
  block[3] = &unk_100201FF0;
  v4 = a3;
  dispatch_async((dispatch_queue_t)objc_msgSend(+[WCM_Server singleton](WCM_Server, "singleton"), "getQueue"), block);
}

- (void)updateWeightAvgLQM:(unsigned int)a3 txRate:(unsigned int)a4
{
  _QWORD block[4];
  unsigned int v5;
  unsigned int v6;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D05A4;
  block[3] = &unk_100203228;
  v5 = a4;
  v6 = a3;
  dispatch_async((dispatch_queue_t)objc_msgSend(+[WCM_Server singleton](WCM_Server, "singleton"), "getQueue"), block);
}

- (void)updateTxPowerCapForHead:(unsigned int)a3 forBody:(unsigned int)a4
{
  uint64_t v4;

  v4 = *(_QWORD *)&a4;
  -[WCM_WiFiController setHeadTxPowerCapdBm:](self, "setHeadTxPowerCapdBm:", *(_QWORD *)&a3);
  -[WCM_WiFiController setBodyTxPowerCapdBm:](self, "setBodyTxPowerCapdBm:", v4);
}

- (void)reportWiFiError
{
  dispatch_async((dispatch_queue_t)objc_msgSend(+[WCM_Server singleton](WCM_Server, "singleton"), "getQueue"), &stru_100205858);
}

- (int64_t)getWiFiBTActiveProfileFor2G
{
  return 0;
}

- (BOOL)getWiFiBTSharedAntennaDisabledStatus
{
  return 0;
}

- (void)handleDisconnection:(id)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("WiFiController handleDisconnection"));
  objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "handleBTCoexWiFiStateEvent:wifiChannel:", 0, 0);
  objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "handleWiFiBTCatsChange:", 1);
  objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "bspMonitor"), "handleWiFiStatusUpdateEvent:", 0);
}

- (void)handleMessage:(id)a3
{
  uint64_t uint64;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  xpc_object_t value;
  const char *string;
  const char *v12;
  xpc_object_t v13;
  id v14;
  xpc_object_t array;
  id v16;
  size_t count;
  size_t v18;
  size_t i;
  xpc_object_t v20;
  _QWORD applier[5];

  uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("In WCMWIFI Controller handleMessage messageId = %lld"), uint64);
  if (uint64 == 2602)
  {
    value = xpc_dictionary_get_value(a3, "kMessageArgs");
    string = xpc_dictionary_get_string(value, "kWCM_WLMWS_TestName");
    v12 = xpc_dictionary_get_string(value, "kWCM_WLMWS_TestKey");
    if (!strcmp(string, "antenna_selection"))
    {
      array = xpc_dictionary_get_array(value, "kWCM_WLMWS_TestAntennaSelectionArray");
      v16 = +[NSMutableArray array](NSMutableArray, "array");
      count = xpc_array_get_count(array);
      if (count)
      {
        v18 = count;
        for (i = 0; i != v18; ++i)
        {
          v20 = xpc_array_get_value(array, i);
          objc_msgSend(v16, "addObject:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", xpc_uint64_get_value(v20)));
        }
      }
      -[WCM_WiFiController setAntennaSelectionWiFiEnh:](self, "setAntennaSelectionWiFiEnh:", v16);
    }
    else
    {
      v13 = xpc_dictionary_get_value(value, "kWCM_WLMWS_TestChannelBitmap");
      v14 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
      applier[0] = _NSConcreteStackBlock;
      applier[1] = 3221225472;
      applier[2] = sub_1000D0AEC;
      applier[3] = &unk_100205880;
      applier[4] = v14;
      xpc_dictionary_apply(v13, applier);
      -[WCM_WiFiController setCoexParams:withValue:](self, "setCoexParams:withValue:", v12, v14);
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCMTestWifiCoexConfiguration controller dropping message-id %lld"), 2602);
  }
  else if (uint64 == 2601)
  {
    v6 = xpc_dictionary_get_uint64(a3, "kWCMTestWiFiNetworkConfiguration_Band");
    v7 = xpc_dictionary_get_uint64(a3, "kWCMTestWiFiNetworkConfiguration_Channel");
    v8 = xpc_dictionary_get_uint64(a3, "kWCMTestWiFiNetworkConfiguration_CenterFrequency");
    v9 = xpc_dictionary_get_uint64(a3, "kWCMTestWiFiNetworkConfiguration_Bandwidth");
    -[WCM_WiFiController updateWiFiState:channel:centerFreq:bandwidth:hostAp:](self, "updateWiFiState:channel:centerFreq:bandwidth:hostAp:", v6, v7, v8, v9, xpc_dictionary_get_BOOL(a3, "kWCMTestWiFiNetworkConfiguration_Mode"));
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("WCMTestWiFiNetworkConfiguration controller dropping message-id %lld"), 2601);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("RCU1 controller dropping message-id %lld"), uint64);
  }
}

- (void)setCoexParams:(void *)a3 withValue:(void *)a4
{
  id v6;

  v6 = objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "wifiController");
  if (v6)
    objc_msgSend(v6, "setCoexParams:withValue:", a3, a4);
}

- (void)setAntennaSelectionWiFiEnh:(id)a3
{
  id v4;

  v4 = objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "wifiController");
  if (v4)
    objc_msgSend(v4, "setAntennaSelectionWiFiEnh:", a3);
}

- (void)setPowerState:(BOOL)a3
{
  *((_BYTE *)&self->super.mProcessId + 4) = a3;
}

- (void)setWifiState:(int)a3
{
  *(_DWORD *)&self->_powerState = a3;
}

- (unsigned)wifiChannel
{
  return self->_wifiState;
}

- (void)setWifiChannel:(unsigned int)a3
{
  self->_wifiState = a3;
}

- (void)setHostAP:(BOOL)a3
{
  *((_BYTE *)&self->super.mProcessId + 5) = a3;
}

- (BOOL)hostAP5GHzActive
{
  return *((_BYTE *)&self->super.mProcessId + 6);
}

- (void)setHostAP5GHzActive:(BOOL)a3
{
  *((_BYTE *)&self->super.mProcessId + 6) = a3;
}

- (unsigned)channelCenterFreqMHz
{
  return self->_wifiChannel;
}

- (void)setChannelCenterFreqMHz:(unsigned int)a3
{
  self->_wifiChannel = a3;
}

- (unsigned)channelBandwidthMHz
{
  return self->_channelCenterFreqMHz;
}

- (void)setChannelBandwidthMHz:(unsigned int)a3
{
  self->_channelCenterFreqMHz = a3;
}

- (unsigned)headTxPowerCapdBm
{
  return self->_channelBandwidthMHz;
}

- (void)setHeadTxPowerCapdBm:(unsigned int)a3
{
  self->_channelBandwidthMHz = a3;
}

- (unsigned)bodyTxPowerCapdBm
{
  return self->_headTxPowerCapdBm;
}

- (void)setBodyTxPowerCapdBm:(unsigned int)a3
{
  self->_headTxPowerCapdBm = a3;
}

- (unsigned)reportedChannelCenterFreqMHz
{
  return self->_bodyTxPowerCapdBm;
}

- (void)setReportedChannelCenterFreqMHz:(unsigned int)a3
{
  self->_bodyTxPowerCapdBm = a3;
}

- (unsigned)leScanGrantDuration
{
  return self->_reportedChannelCenterFreqMHz;
}

- (void)setLeScanGrantDuration:(unsigned int)a3
{
  self->_reportedChannelCenterFreqMHz = a3;
}

@end
