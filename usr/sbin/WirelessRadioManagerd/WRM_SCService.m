@implementation WRM_SCService

- (BOOL)isWiFiPrimary
{
  return objc_msgSend(-[NWPathEvaluator path](self->mWiFiPathEvaluator, "path"), "usesInterfaceType:", 1);
}

- (int)getCellularDataLQM
{
  return self->mDataLQM;
}

+ (id)WRM_SCServiceControllerSingleton
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100076298;
  block[3] = &unk_1002019E8;
  block[4] = a1;
  if (qword_1002711A0 != -1)
    dispatch_once(&qword_1002711A0, block);
  return (id)qword_100271198;
}

- (WRM_SCService)init
{
  WRM_SCService *v2;
  NWParameters *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WRM_SCService;
  v2 = -[WRM_SCService init](&v5, "init");
  if (v2)
  {
    v2->mQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.WirelessRadioManager.SCDClient", 0);
    v2->mStore = 0;
    v2->mValidDataLqm = 0;
    v2->mWiFiEnabled = 0;
    v2->mTelephonyRef = 0;
    v2->mWiFiRef = 0;
    v2->mAirplaneRef = 0;
    *(_WORD *)&v2->mAirPlaneModeEnabled = 256;
    v2->mBackHaulBroken = 0;
    v3 = (NWParameters *)objc_alloc_init((Class)NWParameters);
    v2->mParams = v3;
    -[NWParameters setRequiredInterfaceType:](v3, "setRequiredInterfaceType:", 2);
    v2->mCellPathEvaluator = (NWPathEvaluator *)objc_msgSend(objc_alloc((Class)NWPathEvaluator), "initWithEndpoint:parameters:", 0, v2->mParams);
    v2->mWiFiPathEvaluator = (NWPathEvaluator *)objc_msgSend(objc_alloc((Class)NWPathEvaluator), "initWithEndpoint:parameters:", 0, 0);
    -[WRM_SCService configureAirplaneNotification](v2, "configureAirplaneNotification");
    -[WRM_SCService configureTelephonyNotification](v2, "configureTelephonyNotification");
    -[WRM_SCService configureWiFiNotification](v2, "configureWiFiNotification");
  }
  return v2;
}

- (void)dealloc
{
  __SCDynamicStore *mStore;
  __SCPreferences *mAirplaneRef;
  __SCPreferences *mTelephonyRef;
  __CFString *mifnameCf;
  NWParameters *mParams;
  NWPathEvaluator *mCellPathEvaluator;
  NWPathEvaluator *mWiFiPathEvaluator;
  NSObject *mQueue;
  objc_super v11;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("WRM_SCService dealloc"));
  mStore = self->mStore;
  if (mStore)
    CFRelease(mStore);
  self->mStore = 0;
  self->mValidDataLqm = 0;
  mAirplaneRef = self->mAirplaneRef;
  if (mAirplaneRef)
  {
    SCPreferencesSetDispatchQueue(mAirplaneRef, 0);
    CFRelease(self->mAirplaneRef);
  }
  self->mAirplaneRef = 0;
  mTelephonyRef = self->mTelephonyRef;
  if (mTelephonyRef)
  {
    SCPreferencesSetDispatchQueue(mTelephonyRef, 0);
    CFRelease(self->mTelephonyRef);
  }
  mifnameCf = self->mifnameCf;
  if (mifnameCf)
    CFRelease(mifnameCf);
  mParams = self->mParams;
  if (mParams)
    CFRelease(mParams);
  mCellPathEvaluator = self->mCellPathEvaluator;
  if (mCellPathEvaluator)
    CFRelease(mCellPathEvaluator);
  mWiFiPathEvaluator = self->mWiFiPathEvaluator;
  if (mWiFiPathEvaluator)
    CFRelease(mWiFiPathEvaluator);
  mQueue = self->mQueue;
  if (mQueue)
  {
    dispatch_release(mQueue);
    self->mQueue = 0;
  }
  self->mTelephonyRef = 0;
  v11.receiver = self;
  v11.super_class = (Class)WRM_SCService;
  -[WRM_SCService dealloc](&v11, "dealloc");
}

- (void)registerForCellularDataLQM
{
  __SCDynamicStore *v3;
  const void *v4;
  const __CFString *NetworkInterfaceEntity;
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  CFTypeID v8;
  const __CFNumber *Value;
  const __CFNumber *v10;
  CFTypeID v11;
  __CFArray *Mutable;
  const __CFArray *v13;
  uint64_t v14;
  unsigned int valuePtr;

  valuePtr = -[WRM_SCService getCellularDataLQM](self, "getCellularDataLQM");
  v3 = SCDynamicStoreCreate(0, CFSTR("com.apple.WirelessRadioManagerd"), (SCDynamicStoreCallBack)sub_10007669C, 0);
  self->mStore = v3;
  if (v3)
  {
    v4 = (const void *)kSCEntNetLinkQuality;
    NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, CFSTR("pdp_ip0"), kSCEntNetLinkQuality);
    v6 = (const __CFDictionary *)SCDynamicStoreCopyValue(self->mStore, NetworkInterfaceEntity);
    v7 = v6;
    if (v6)
    {
      v8 = CFGetTypeID(v6);
      if (v8 == CFDictionaryGetTypeID())
      {
        Value = (const __CFNumber *)CFDictionaryGetValue(v7, v4);
        if (Value)
        {
          v10 = Value;
          v11 = CFGetTypeID(Value);
          if (v11 == CFNumberGetTypeID())
            CFNumberGetValue(v10, kCFNumberIntType, &valuePtr);
        }
      }
    }
    Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 1, &kCFTypeArrayCallBacks);
    if (Mutable)
    {
      v13 = Mutable;
      CFArrayAppendValue(Mutable, NetworkInterfaceEntity);
      if (!SCDynamicStoreSetNotificationKeys(self->mStore, v13, 0))
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("SCDynamicStoreSetNotificationKeys failed"));
      if (!SCDynamicStoreSetDispatchQueue(self->mStore, (dispatch_queue_t)objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getQueue")))+[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("SCDynamicStoreSetDispatchQueue failed"));
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("registerForCellularDataLQM passed"));
      CFRelease(v13);
      if (NetworkInterfaceEntity)
        CFRelease(NetworkInterfaceEntity);
      if (v7)
        CFRelease(v7);
      -[WRM_SCService setCellularDataLQM:](self, "setCellularDataLQM:", valuePtr);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("SCDynamicStoreCreate succesful, data LQM: %d"), valuePtr);
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CFArrayCreateMutable failed"), v14);
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("SCDynamicStoreCreate failed"));
  }
}

- (void)setCellularDataLQM:(int)a3
{
  self->mDataLQM = a3;
  self->mValidDataLqm = 1;
}

- (void)resetCellularDataLQM
{
  self->mValidDataLqm = 0;
}

- (BOOL)isDataLQMValid
{
  return self->mValidDataLqm;
}

- (__SCPreferences)getAPMHandle
{
  return self->mAirplaneRef;
}

- (__SCPreferences)getTelephonyHandle
{
  return self->mTelephonyRef;
}

- (__SCPreferences)getWiFiHandle
{
  return self->mWiFiRef;
}

- (BOOL)isAirPlaneModeEnabled
{
  return self->mAirPlaneModeEnabled;
}

- (BOOL)isWiFiEnabled
{
  return self->mWiFiEnabled;
}

- (void)updateAirPlaneModeStatus:(BOOL)a3
{
  self->mAirPlaneModeEnabled = a3;
}

- (BOOL)isTelephonyEnabled
{
  return self->mTelephonyEnabled;
}

- (void)updateTelephonyStatus:(BOOL)a3
{
  self->mTelephonyEnabled = a3;
}

- (void)getAirPlaneMode
{
  CFPropertyListRef Value;
  CFTypeID v4;

  objc_sync_enter(self);
  Value = SCPreferencesGetValue(-[WRM_SCService getAPMHandle](self, "getAPMHandle"), CFSTR("AirplaneMode"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("Inside getAirPlaneMode"));
  if (Value)
  {
    v4 = CFGetTypeID(Value);
    if (v4 == CFBooleanGetTypeID())
      self->mAirPlaneModeEnabled = CFBooleanGetValue((CFBooleanRef)Value) != 0;
    else
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("AirplaneMode is not BOOLean"));
    objc_sync_exit(self);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, CFSTR("getAirPlaneMode: %d"), self->mAirPlaneModeEnabled);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("getAirPlaneMode: plistRef is NULL"));
    objc_sync_exit(self);
  }
}

- (void)getWiFiMode
{
  objc_sync_enter(self);
  self->mWiFiEnabled = objc_msgSend((id)SCPreferencesGetValue(self->mWiFiRef, CFSTR("AllowEnable")), "intValue") != 0;
  objc_sync_exit(self);
}

- (void)getTelephonyMode
{
  CFPropertyListRef Value;
  CFTypeID v4;
  const __CFBoolean *v5;
  int v6;
  const __CFString *v7;

  objc_sync_enter(self);
  Value = SCPreferencesGetValue(-[WRM_SCService getTelephonyHandle](self, "getTelephonyHandle"), CFSTR("TelephonyState"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("Inside getTelephonyMode"));
  if (Value)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("getTelephonyMode: current telephony state %d"), self->mTelephonyEnabled);
    v4 = CFGetTypeID(Value);
    if (v4 == CFDictionaryGetTypeID())
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("getTelephonyMode processing: TelephonyState key"));
      v5 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)Value, CFSTR("TelephonyEnabled"));
      if (!v5)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("getTelephonyMode: telephonyState is NULL"));
        goto LABEL_11;
      }
      v6 = CFBooleanGetValue(v5);
      if (v6)
        v7 = CFSTR("getTelephonyMode: mTelephonyEnabled: TRUE");
      else
        v7 = CFSTR("getTelephonyMode: mTelephonyEnabled: FALSE");
      self->mTelephonyEnabled = v6 != 0;
    }
    else
    {
      v7 = CFSTR("Error: TelephonyState plist is not dictionary");
    }
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, v7);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("getTelephonyMode: Updated state: %d"), self->mTelephonyEnabled);
  }
  else
  {
    self->mTelephonyEnabled = 1;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("getTelephonyMode: plistRef is NULL"));
  }
LABEL_11:
  objc_sync_exit(self);
}

- (void)configureAirplaneNotification
{
  __SCPreferences *v3;
  int v4;
  SCPreferencesContext context;

  *(_OWORD *)&context.version = unk_1002033E0;
  memset(&context.retain, 0, 24);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("Inside configureAirplaneNotification"));
  v3 = SCPreferencesCreateWithAuthorization(0, CFSTR("com.apple.WirelessRadioManager:registerForAirplaneModeNotifications"), CFSTR("com.apple.radios.plist"), 0);
  self->mAirplaneRef = v3;
  if (v3)
  {
    SCPreferencesSetCallback(v3, (SCPreferencesCallBack)sub_100076BF4, &context);
    SCPreferencesSetDispatchQueue(self->mAirplaneRef, (dispatch_queue_t)self->mQueue);
  }
  else
  {
    v4 = SCError();
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("Failed to create airplane mode preference handle: %d"), SCErrorString(v4));
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("configureAirplaneNotification, calling getAirPlaneMode modification"));
  -[WRM_SCService getAirPlaneMode](self, "getAirPlaneMode");
}

- (void)configureTelephonyNotification
{
  __SCPreferences *v3;
  int v4;
  SCPreferencesContext context;

  *(_OWORD *)&context.version = unk_100203408;
  memset(&context.retain, 0, 24);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("Inside configureTelephonyNotification"));
  v3 = SCPreferencesCreateWithAuthorization(0, CFSTR("com.apple.WirelessRadioManager:registerForAirplaneModeNotifications"), CFSTR("com.apple.radios.plist"), 0);
  self->mTelephonyRef = v3;
  if (v3)
  {
    SCPreferencesSetCallback(v3, (SCPreferencesCallBack)sub_100076BF4, &context);
    SCPreferencesSetDispatchQueue(self->mTelephonyRef, (dispatch_queue_t)self->mQueue);
  }
  else
  {
    v4 = SCError();
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("Failed to create telephony preference handle: %d"), SCErrorString(v4));
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("configureTelephonyNotification, calling getTelephonyMode notification"));
  -[WRM_SCService getTelephonyMode](self, "getTelephonyMode");
}

- (void)configureWiFiNotification
{
  __SCPreferences *v3;
  int v4;
  dispatch_time_t v5;
  _QWORD block[5];
  SCPreferencesContext context;

  *(_OWORD *)&context.version = unk_100203430;
  memset(&context.retain, 0, 24);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("Inside configureWiFiNotification"));
  v3 = SCPreferencesCreateWithAuthorization(0, CFSTR("com.apple.WirelessRadioManager:registerForWiFiNotifications"), CFSTR("com.apple.wifi.plist"), 0);
  self->mWiFiRef = v3;
  if (v3)
  {
    SCPreferencesSetCallback(v3, (SCPreferencesCallBack)sub_100076BF4, &context);
    SCPreferencesSetDispatchQueue(self->mWiFiRef, (dispatch_queue_t)self->mQueue);
  }
  else
  {
    v4 = SCError();
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("Failed to create WiFi preference handle: %d"), SCErrorString(v4));
  }
  -[WRM_SCService getWiFiMode](self, "getWiFiMode");
  v5 = dispatch_time(0, 3000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100077004;
  block[3] = &unk_1002019E8;
  block[4] = self;
  dispatch_after(v5, (dispatch_queue_t)objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getQueue"), block);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("configureWiFiNotification, calling getWiFiMode notification"));
}

- (BOOL)isCellDataActive
{
  return objc_msgSend(-[NWPathEvaluator path](self->mCellPathEvaluator, "path"), "status") == (id)1;
}

@end
