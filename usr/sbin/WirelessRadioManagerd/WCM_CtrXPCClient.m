@implementation WCM_CtrXPCClient

- (BOOL)getRCU2Status
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  CFTypeID TypeID;
  CFComparisonResult v8;
  BOOL v9;
  const char *v10;
  const __CFString *v11;
  uint64_t v12;
  const __CFString *v13;
  void *value;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activeCoexFeatures"));
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("RCU2SupportIntegrated"));

  if ((v4 & 1) != 0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR(" RCU2: In getRCU2Status - Reading value"));
    v5 = (const __CFDictionary *)CFPreferencesCopyAppValue(CFSTR("previousRCU2State"), CFSTR("com.apple.WirelessRadioManager.debug"));
    if (v5)
    {
      v6 = v5;
      TypeID = CFDictionaryGetTypeID();
      if (TypeID == CFGetTypeID(v6))
      {
        value = 0;
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR(" RCU2: In getRCU2Status - for RCU2 state info %@"), v6);
        if (CFDictionaryGetValueIfPresent(v6, CFSTR("state"), (const void **)&value))
        {
          v8 = CFStringCompare(CFSTR("TRUE"), (CFStringRef)value, 0);
          v9 = v8 == kCFCompareEqualTo;
          v10 = "FALSE";
          if (v8 == kCFCompareEqualTo)
            v10 = "TRUE";
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR(" RCU2: In getRCU2Status - Reading value %s"), v10);
          goto LABEL_14;
        }
        v13 = CFSTR(" RCU2: In getRCU2Status - Reading value FAILED");
      }
      else
      {
        v13 = CFSTR(" RCU2: In getRCU2Status - previousRCU2State not found");
      }
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, v13);
      v9 = 0;
LABEL_14:
      CFRelease(v6);
      return v9;
    }
    v11 = CFSTR(" RCU2: In getRCU2Status - previousRCU2State not found");
    v12 = 4;
  }
  else
  {
    v11 = CFSTR("RCU2 Controller - RCU2_SUPPORT_INTEGRATED - Feature not enabled - return from getRCU2Status");
    v12 = 2;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", v12, v11);
  return 0;
}

- (void)updateWiFiBand:(unsigned __int8)a3
{
  uint64_t wifiBandLoad;
  uint64_t v4;

  wifiBandLoad = self->wifiBandLoad;
  if ((_DWORD)wifiBandLoad == a3)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("RCU2 Controller No Change in WiFi Band - Not Updataing"));
  }
  else
  {
    v4 = a3;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("RCU2 Controller WiFi band changed from %d to %d"), wifiBandLoad, a3);
    self->wifiBandLoad = v4;
    -[WCM_CtrXPCClient sendFullWirelessLoad:wifiBandInfo:AWDLRealTimeModeInfo:](self, "sendFullWirelessLoad:wifiBandInfo:AWDLRealTimeModeInfo:", self->btWirelessLoad, v4, self->AWDLRealTimeModeEnabled);
  }
}

- (BOOL)threadCOEXStatus
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("RCU2 Controller COEX status - ENTER"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("RCU2 Controller COEX status- %d EXIT"), 1);
  return 1;
}

- (BOOL)setChannel:(int)a3
{
  return 0;
}

- (BOOL)storeRCU2Status:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  __CFString **v7;
  const __CFString *v8;
  CFDictionaryRef v9;
  const __CFString *v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeCoexFeatures"));
  v6 = objc_msgSend(v5, "containsObject:", CFSTR("RCU2SupportIntegrated"));

  if ((v6 & 1) != 0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, CFSTR(" RCU2: In storeRCU2Status.."));
    if (v3)
      v7 = off_100270C38;
    else
      v7 = &off_100270C40;
    if (v3)
      v8 = CFSTR(" RCU2: In storeRCU2Status.. - Writing value TRUE");
    else
      v8 = CFSTR(" RCU2: In storeRCU2Status.. - Writing value FALSE");
    v9 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)off_100270C30, (const void **)v7, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 4, v8);
    CFPreferencesSetAppValue(CFSTR("previousRCU2State"), v9, CFSTR("com.apple.WirelessRadioManager.debug"));
    if (CFPreferencesAppSynchronize(CFSTR("com.apple.WirelessRadioManager.debug")))
      v10 = CFSTR(" RCU2: In storeRCU2Status.. - Actual write:- passed");
    else
      v10 = CFSTR(" RCU2: In storeRCU2Status.. - Actual write:- failed");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 1, v10);
    CFRelease(v9);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("RCU2 Controller - RCU2_SUPPORT_INTEGRATED - Feature not enabled - return from storeRCU2Status"));
  }
  return v6;
}

- (void)setWirelessLoad:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeCoexFeatures"));
  v7 = objc_msgSend(v6, "containsObject:", CFSTR("RCU2SupportIntegrated"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"));
    objc_msgSend(v8, "sendWirelessBtLoad:", v3);

    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("RCU2 Controller updating btWirelessLoad from %d to %d"), self->btWirelessLoad, v3);
    self->btWirelessLoad = v3;
    -[WCM_CtrXPCClient sendFullWirelessLoad:wifiBandInfo:AWDLRealTimeModeInfo:](self, "sendFullWirelessLoad:wifiBandInfo:AWDLRealTimeModeInfo:", v3, self->wifiBandLoad, self->AWDLRealTimeModeEnabled);
  }
}

- (void)updateAWDLRealTimeMode:(BOOL)a3
{
  _BOOL8 AWDLRealTimeModeEnabled;
  _BOOL8 v4;

  AWDLRealTimeModeEnabled = self->AWDLRealTimeModeEnabled;
  if (a3 == AWDLRealTimeModeEnabled)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("RCU2 Controller No Change in AWDLRealTime state - not updating"));
  }
  else
  {
    v4 = a3;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("RCU2 Controller AWDLRealTime status changed from %d to %d"), AWDLRealTimeModeEnabled, a3);
    self->AWDLRealTimeModeEnabled = v4;
    -[WCM_CtrXPCClient sendFullWirelessLoad:wifiBandInfo:AWDLRealTimeModeInfo:](self, "sendFullWirelessLoad:wifiBandInfo:AWDLRealTimeModeInfo:", self->btWirelessLoad, self->wifiBandLoad, v4);
  }
}

- (BOOL)sendFullWirelessLoad:(unsigned int)a3 wifiBandInfo:(unsigned __int8)a4 AWDLRealTimeModeInfo:(BOOL)a5
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  CtrClient *CtrClientPtr;
  const __CFString *v12;
  BOOL v13;
  int v15;
  void *__p;
  char v17;

  v6 = 0x800000000;
  if (!a5)
    v6 = 0;
  self->wifi_bt_cellular_load = (a3 | ((unint64_t)a4 << 32)) + v6;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("RCU2 Controller - sendFullWirelessLoad with BT load %d WiFiBand %d AWDLRealTime:%d FullValue: %llu"), *(_QWORD *)&a3, a4, a5, (a3 | ((unint64_t)a4 << 32)) + v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->wifi_bt_cellular_load));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));

  v9 = objc_retainAutorelease(v8);
  v10 = objc_msgSend(v9, "UTF8String");
  CtrClientPtr = self->CtrClientPtr;
  if (CtrClientPtr)
  {
    if (self->threadRadioUp)
    {
      -[CtrClient setProperty:prperty_val:](CtrClientPtr, "setProperty:prperty_val:", "vendor:coex:radioload", v10);
      if (v15)
        v12 = CFSTR("RCU2 Controller - setWirelessLoad Failure - Load set to %llu ");
      else
        v12 = CFSTR("RCU2 Controller - setWirelessLoad Success - Load set to %llu");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, v12, self->wifi_bt_cellular_load);
      if (v17 < 0)
      {
        operator delete(__p);
        if (!v15)
        {
LABEL_16:
          v13 = 1;
          goto LABEL_15;
        }
      }
      else if (!v15)
      {
        goto LABEL_16;
      }
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("RCU2 Controller - Thread radio not enabled"));
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("RCU2 Controller - CtrClientPtr is nil"));
  }
  v13 = 0;
LABEL_15:

  return v13;
}

- (int64_t)getChannel
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("RCU2 Controller - getChannel - %d EXIT"), 25);
  return 25;
}

- (int64_t)getChannelActivity
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("RCU2 Controller - getChannelActivity - %lld "), self->threadChannelActivity);
  return self->threadChannelActivity;
}

- (void)HandleThreadStart
{
  id v3;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("RCU2 Controller - Threadradio started - enabling sending messages - Current value = %d"), self->threadRadioUp);
  self->threadRadioUp = 1;
  -[WCM_CtrXPCClient RCU2Init](self, "RCU2Init");
  -[WCM_CtrXPCClient setWirelessLoad:](self, "setWirelessLoad:", LODWORD(self->wifi_bt_cellular_load));
  -[WCM_CtrXPCClient storeRCU2Status:](self, "storeRCU2Status:", self->threadRadioUp);
  v3 = (id)objc_claimAutoreleasedReturnValue(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"));
  objc_msgSend(v3, "handleWiFiBTCoexChange");

}

- (void)RCU2Init
{
  CtrClient *v3;
  CtrClient *CtrClientPtr;

  v3 = (CtrClient *)objc_msgSend(objc_alloc((Class)CtrClient), "init:", "client.xpc.WirelessRadioManager");
  CtrClientPtr = self->CtrClientPtr;
  self->CtrClientPtr = v3;

}

- (void)HandleThreadStop
{
  void *v3;
  CtrClient *CtrClientPtr;

  self->threadRadioUp = 0;
  -[WCM_CtrXPCClient storeRCU2Status:](self, "storeRCU2Status:", 0);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("RCU2 Controller - Threadradio Stopped - Disabling sending messages- Current value = %d"), self->threadRadioUp);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"));
  objc_msgSend(v3, "handleWiFiBTCoexChange");

  CtrClientPtr = self->CtrClientPtr;
  self->CtrClientPtr = 0;

}

- (WCM_CtrXPCClient)init
{
  char *v2;
  unsigned int v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WCM_CtrXPCClient;
  v2 = -[WCM_CtrXPCClient init](&v5, "init");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("RCU2 Controller - Initilization"));
  *((_QWORD *)v2 + 2) = 0;
  v2[24] = 0;
  *((_QWORD *)v2 + 4) = 0;
  *((_QWORD *)v2 + 5) = 0;
  *(_QWORD *)(v2 + 46) = 0;
  v3 = objc_msgSend(v2, "getRCU2Status");
  v2[25] = v3;
  if (v3)
    objc_msgSend(v2, "RCU2Init");
  return (WCM_CtrXPCClient *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->CtrClientPtr, 0);
}

@end
