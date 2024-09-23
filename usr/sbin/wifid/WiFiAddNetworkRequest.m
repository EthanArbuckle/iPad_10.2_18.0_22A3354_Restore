@implementation WiFiAddNetworkRequest

- (WiFiAddNetworkRequest)init
{
  objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, CFSTR("-[WiFiAddNetworkRequest init] unavailable"), 0));
}

- (WiFiAddNetworkRequest)initWithClient:(__WiFiClient *)a3 network:(__WiFiNetwork *)a4 bundleId:(id)a5 localizedAppName:(id)a6 originator:(int)a7 poweredOff:(BOOL)a8 wapi:(BOOL)a9 sessionBased:(BOOL)a10 useSSIDPrefix:(BOOL)a11 callback:(void *)a12 context:(void *)a13 bypassPrompt:(BOOL)a14
{
  void *v21;
  WiFiAddNetworkRequest *v22;
  WiFiAddNetworkRequest *v23;
  __CFDictionary *v24;
  __WiFiClient *client;
  void *v27;
  objc_super v28;

  v21 = objc_autoreleasePoolPush();
  v28.receiver = self;
  v28.super_class = (Class)WiFiAddNetworkRequest;
  v22 = -[WiFiAddNetworkRequest init](&v28, "init");
  if (!v22 || (v23 = v22, v22->_client = a3, !a4) || (v22->_network = a4, !a5))
  {
LABEL_13:
    v23 = 0;
    goto LABEL_9;
  }
  if (a7)
    v22->_localizedApplicationName = (NSString *)objc_msgSend(a6, "copy");
  v23->_originator = a7;
  v23->_bundleId = (NSString *)objc_msgSend(a5, "copy");
  v23->_poweredOff = a8;
  v23->_wapi = a9;
  v23->_sessionBased = a10;
  v23->_callback = a12;
  v23->_context = a13;
  v23->_usingPrefix = a11;
  v23->_bypassPrompt = a14;
  v24 = -[WiFiAddNetworkRequest _createAlertDictionary](v23, "_createAlertDictionary");
  if (!v24)
  {
    v27 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "Failed to create alert dictionary for %@ identifier", a5);
    objc_autoreleasePoolPop(v27);
    goto LABEL_13;
  }
  v23->_alertDictionary = (NSDictionary *)v24;
  CFRetain(v23->_network);
  client = v23->_client;
  if (client)
    CFRetain(client);
LABEL_9:
  objc_autoreleasePoolPop(v21);
  return v23;
}

- (__CFDictionary)_createAlertDictionary
{
  void *v3;
  __CFDictionary *Mutable;
  CFMutableStringRef v5;
  __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  __CFString *v9;
  const __CFString *v10;
  const void *v11;
  CFStringRef v12;
  CFMutableStringRef v13;
  int originator;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v24;

  v3 = objc_autoreleasePoolPush();
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable && sub_10015B920())
  {
    if (sub_10002DA5C((_BOOL8)self->_network))
    {
      v5 = CFStringCreateMutable(kCFAllocatorDefault, 0);
      if (v5)
      {
        v6 = v5;
        if (self->_wapi)
          v7 = CFSTR("WIFI_CONFIGURE_NETWORK_TITLE_CH");
        else
          v7 = CFSTR("WIFI_CONFIGURE_NETWORK_TITLE");
        v8 = (const __CFString *)sub_10015B934((uint64_t)v7);
        CFStringAppendFormat(v6, 0, v8, self->_localizedApplicationName, 0);
        CFDictionarySetValue(Mutable, kCFUserNotificationAlertHeaderKey, v6);
        v9 = 0;
        v10 = CFSTR("WIFI_JOIN_NETWORK_ALLOW");
        goto LABEL_27;
      }
    }
    else
    {
      v11 = sub_10002B088(self->_network);
      v12 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%c%@%c"), 8, v11, 127);
      if (v12)
      {
        v9 = (__CFString *)v12;
        v13 = CFStringCreateMutable(kCFAllocatorDefault, 0);
        if (!v13)
        {
          v6 = v9;
LABEL_31:
          CFRelease(v6);
          goto LABEL_32;
        }
        v6 = v13;
        originator = self->_originator;
        if (originator == 6 || originator == 1)
        {
          if (self->_wapi)
            v15 = CFSTR("WIFI_JOIN_NETWORK_TITLE_CH");
          else
            v15 = CFSTR("WIFI_JOIN_NETWORK_TITLE");
          v16 = (const __CFString *)sub_10015B934((uint64_t)v15);
          CFStringAppendFormat(v6, 0, v16, self->_localizedApplicationName, v9);
        }
        else
        {
          if (self->_wapi)
            v17 = CFSTR("WIFI_USER_JOIN_NETWORK_TITLE_CH");
          else
            v17 = CFSTR("WIFI_USER_JOIN_NETWORK_TITLE");
          v18 = (const __CFString *)sub_10015B934((uint64_t)v17);
          CFStringAppendFormat(v6, 0, v18, v9, v24);
        }
        CFDictionarySetValue(Mutable, kCFUserNotificationAlertHeaderKey, v6);
        if (self->_poweredOff)
        {
          if (self->_wapi)
            v19 = CFSTR("WIFI_JOIN_NETWORK_MSG_POWER_OFF_CH");
          else
            v19 = CFSTR("WIFI_JOIN_NETWORK_MSG_POWER_OFF");
          v20 = sub_10015B934((uint64_t)v19);
          CFDictionarySetValue(Mutable, kCFUserNotificationAlertMessageKey, v20);
        }
        v10 = CFSTR("WIFI_JOIN_NETWORK_JOIN");
LABEL_27:
        v21 = sub_10015B934((uint64_t)v10);
        CFDictionarySetValue(Mutable, kCFUserNotificationDefaultButtonTitleKey, v21);
        if (SBUserNotificationDismissOnLock)
        {
          CFDictionarySetValue(Mutable, SBUserNotificationDismissOnLock, kCFBooleanTrue);
          CFDictionarySetValue(Mutable, SBUserNotificationAlertMessageDelimiterKey, &stru_100238178);
          CFDictionarySetValue(Mutable, SBUserNotificationForcesModalAlertAppearance, kCFBooleanTrue);
          CFDictionarySetValue(Mutable, SBUserNotificationDisplayActionButtonOnLockScreen, kCFBooleanTrue);
        }
        CFDictionarySetValue(Mutable, kCFUserNotificationAlertTopMostKey, kCFBooleanTrue);
        v22 = sub_10015B934((uint64_t)CFSTR("WIFI_JOIN_NETWORK_CANCEL"));
        CFDictionarySetValue(Mutable, kCFUserNotificationAlternateButtonTitleKey, v22);
        if (v9)
          CFRelease(v9);
        goto LABEL_31;
      }
    }
  }
LABEL_32:
  objc_autoreleasePoolPop(v3);
  return Mutable;
}

- (void)dealloc
{
  __WiFiNetwork *network;
  __WiFiClient *client;
  objc_super v5;

  network = self->_network;
  if (network)
  {
    CFRelease(network);
    self->_network = 0;
  }
  client = self->_client;
  if (client)
  {
    CFRelease(client);
    self->_client = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)WiFiAddNetworkRequest;
  -[WiFiAddNetworkRequest dealloc](&v5, "dealloc");
}

- (void)setNetworkMatchingPrefix:(__WiFiNetwork *)a3
{
  __WiFiNetwork *network;
  const void *v6;
  __WiFiNetwork *v7;
  const __CFString *v8;

  if (self->_usingPrefix)
  {
    network = self->_network;
    v6 = sub_10002B088(a3);
    sub_10002C478((uint64_t)network, CFSTR("SSID_STR"), v6);
    v7 = self->_network;
    v8 = sub_10003149C(a3);
    sub_10002C478((uint64_t)v7, CFSTR("SSID"), v8);

    self->_alertDictionary = (NSDictionary *)-[WiFiAddNetworkRequest _createAlertDictionary](self, "_createAlertDictionary");
    self->_usingPrefix = 0;
  }
}

- (int)originator
{
  return self->_originator;
}

- (void)setOriginator:(int)a3
{
  self->_originator = a3;
}

- (NSString)localizedApplicationName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLocalizedApplicationName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)bundleId
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBundleId:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (__WiFiClient)client
{
  return self->_client;
}

- (void)setClient:(__WiFiClient *)a3
{
  self->_client = a3;
}

- (__WiFiNetwork)network
{
  return self->_network;
}

- (void)setNetwork:(__WiFiNetwork *)a3
{
  self->_network = a3;
}

- (NSDictionary)alertDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAlertDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)sessionBased
{
  return self->_sessionBased;
}

- (void)setSessionBased:(BOOL)a3
{
  self->_sessionBased = a3;
}

- (BOOL)usingPrefix
{
  return self->_usingPrefix;
}

- (void)setUsingPrefix:(BOOL)a3
{
  self->_usingPrefix = a3;
}

- (void)callback
{
  return self->_callback;
}

- (void)setCallback:(void *)a3
{
  self->_callback = a3;
}

- (void)context
{
  return self->_context;
}

- (void)setContext:(void *)a3
{
  self->_context = a3;
}

- (BOOL)bypassPrompt
{
  return self->_bypassPrompt;
}

- (void)setBypassPrompt:(BOOL)a3
{
  self->_bypassPrompt = a3;
}

- (BOOL)poweredOff
{
  return self->_poweredOff;
}

- (void)setPoweredOff:(BOOL)a3
{
  self->_poweredOff = a3;
}

- (BOOL)wapi
{
  return self->_wapi;
}

- (void)setWapi:(BOOL)a3
{
  self->_wapi = a3;
}

@end
