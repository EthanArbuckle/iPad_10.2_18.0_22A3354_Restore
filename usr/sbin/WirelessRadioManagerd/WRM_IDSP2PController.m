@implementation WRM_IDSP2PController

+ (id)wrm_IDSP2PControllerSingleton
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100047940;
  block[3] = &unk_1002019E8;
  block[4] = a1;
  if (qword_1002710F8 != -1)
    dispatch_once(&qword_1002710F8, block);
  return (id)qword_100271100;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return objc_msgSend(a1, "wrm_IDSP2PControllerSingleton", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("WRM_IDSP2PController: Inside Copy with Zone "));
  return self;
}

- (unint64_t)retainCount
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("WRM_IDSP2PController: retain count:%lu "), -1);
  return -1;
}

- (WRM_IDSP2PController)init
{
  WRM_IDSP2PController *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WRM_IDSP2PController;
  v2 = -[WRM_IDSP2PController init](&v4, "init");
  if (v2)
  {
    -[WRM_IDSP2PController setQueue:](v2, "setQueue:", dispatch_queue_create("com.apple.WirelessRadioManager.P2PIDS", 0));
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("IDSP2PSync: P2PSync module initialized"));
    -[WRM_IDSP2PController setServiceInitDone:](v2, "setServiceInitDone:", 0);
    -[WRM_IDSP2PController setConnectedDevices:](v2, "setConnectedDevices:", objc_alloc_init((Class)NSArray));
    -[WRM_IDSP2PController setCompanionWifiStatus:](v2, "setCompanionWifiStatus:", objc_alloc_init((Class)NSString));
    -[WRM_IDSP2PController setCompanionWifiStatus:](v2, "setCompanionWifiStatus:", CFSTR("LinkUP"));
    -[WRM_IDSP2PController setDevicePaired:](v2, "setDevicePaired:", 0);
    -[WRM_IDSP2PController setCompanionBTVersusWiFiRecommendation:](v2, "setCompanionBTVersusWiFiRecommendation:", objc_alloc_init((Class)NSString));
    -[WRM_IDSP2PController setCompanionBTVersusWiFiRecommendation:](v2, "setCompanionBTVersusWiFiRecommendation:", CFSTR("WIFI"));
    -[WRM_IDSP2PController setCompanionInternetConnectionAvailable:](v2, "setCompanionInternetConnectionAvailable:", objc_alloc_init((Class)NSString));
    -[WRM_IDSP2PController setCompanionInternetConnectionAvailable:](v2, "setCompanionInternetConnectionAvailable:", CFSTR("YES"));
    -[WRM_IDSP2PController setCompanionBTRssi:](v2, "setCompanionBTRssi:", objc_alloc_init((Class)NSString));
    -[WRM_IDSP2PController setCompanionBTRssi:](v2, "setCompanionBTRssi:", CFSTR("-40"));
    -[WRM_IDSP2PController setCompanionWIFIRssi:](v2, "setCompanionWIFIRssi:", objc_alloc_init((Class)NSString));
    -[WRM_IDSP2PController setCompanionWIFIRssi:](v2, "setCompanionWIFIRssi:", CFSTR("-50"));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("IDSP2PSync: Dealloc called for P2P IDS Manager"));
  if (-[WRM_IDSP2PController ConnectedDevices](self, "ConnectedDevices"))

  if (-[WRM_IDSP2PController CompanionWifiStatus](self, "CompanionWifiStatus"))
  v3.receiver = self;
  v3.super_class = (Class)WRM_IDSP2PController;
  -[WRM_IDSP2PController dealloc](&v3, "dealloc");
}

- (void)WrmSendp2pMessage:(id)a3 MessageBody:(id)a4 withOptions:(id)a5
{
  NSDictionary *v9;
  _QWORD block[7];
  _QWORD v11[2];
  _QWORD v12[2];

  v11[0] = CFSTR("msg.name");
  v11[1] = CFSTR("msg.body");
  v12[0] = a3;
  v12[1] = a4;
  v9 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("IDSP2PSync: Sending hint to Gizmo '%s' having contents %s"), objc_msgSend(a3, "UTF8String"), objc_msgSend(a4, "UTF8String"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100047D30;
  block[3] = &unk_100201EB0;
  block[4] = self;
  block[5] = v9;
  block[6] = a5;
  dispatch_async((dispatch_queue_t)-[WRM_IDSP2PController queue](self, "queue"), block);
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("IDSP2PSync: Incoming message received"), a5, a6, a7);
  v10 = objc_msgSend(a5, "objectForKey:", CFSTR("msg.body"));
  v11 = objc_msgSend(a5, "objectForKey:", CFSTR("msg.name"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR(" IDSP2PSync <= Incoming message '%s' with contents %@: %lu keys; from device '%s'"),
    objc_msgSend(v11, "UTF8String"),
    v10,
    objc_msgSend(a5, "count"),
    objc_msgSend(a6, "UTF8String"));
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("WiFi status")))
  {
    if (-[WRM_IDSP2PController CompanionWifiStatus](self, "CompanionWifiStatus"))

    -[WRM_IDSP2PController setCompanionWifiStatus:](self, "setCompanionWifiStatus:", objc_msgSend(v10, "copy"));
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR(" IDSP2PSync Companion Wifi Status is %@"), -[WRM_IDSP2PController CompanionWifiStatus](self, "CompanionWifiStatus"));
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("BT versus WiFi pref")))
  {
    if (-[WRM_IDSP2PController CompanionBTVersusWiFiRecommendation](self, "CompanionBTVersusWiFiRecommendation"))

    -[WRM_IDSP2PController setCompanionWifiStatus:](self, "setCompanionWifiStatus:", objc_msgSend(v10, "copy"));
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR(" IDSP2PSync Companion BT versus WiFi recommendation is %@"), -[WRM_IDSP2PController CompanionBTVersusWiFiRecommendation](self, "CompanionBTVersusWiFiRecommendation"));
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("Internet Available")))
  {
    if (-[WRM_IDSP2PController CompanionInternetConnectionAvailable](self, "CompanionInternetConnectionAvailable"))

    -[WRM_IDSP2PController setCompanionInternetConnectionAvailable:](self, "setCompanionInternetConnectionAvailable:", objc_msgSend(v10, "copy"));
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR(" IDSP2PSync Companion Internet available %@"), -[WRM_IDSP2PController CompanionInternetConnectionAvailable](self, "CompanionInternetConnectionAvailable"));
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("BT RSSI")))
  {
    if (-[WRM_IDSP2PController CompanionBTRssi](self, "CompanionBTRssi"))

    -[WRM_IDSP2PController setCompanionBTRssi:](self, "setCompanionBTRssi:", objc_msgSend(v10, "copy"));
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR(" IDSP2PSync Companion BT RSSI %@"), -[WRM_IDSP2PController CompanionBTRssi](self, "CompanionBTRssi"));
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("WIFI RSSI")))
  {
    if (-[WRM_IDSP2PController CompanionWIFIRssi](self, "CompanionWIFIRssi"))

    -[WRM_IDSP2PController setCompanionWIFIRssi:](self, "setCompanionWIFIRssi:", objc_msgSend(v10, "copy"));
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR(" IDSP2PSync Companion Wifi RSSI %@"), -[WRM_IDSP2PController CompanionWIFIRssi](self, "CompanionWIFIRssi"));
  }
  objc_msgSend(+[WRM_IDSLinkEvalManager WRM_IDSLinkEvalManagerSingleton](WRM_IDSLinkEvalManager, "WRM_IDSLinkEvalManagerSingleton"), "evaluateBTWiFiLinkForTerminus");
}

- (BOOL)isRemoteWiFiGood
{
  return -[NSString isEqualToString:](-[WRM_IDSP2PController CompanionWifiStatus](self, "CompanionWifiStatus"), "isEqualToString:", CFSTR("LinkUP"));
}

- (BOOL)isDevicePaired
{
  return -[WRM_IDSP2PController DevicePaired](self, "DevicePaired");
}

- (BOOL)updateDevicePairingState
{
  NSArray *v2;
  id v3;
  id v4;
  uint64_t v5;
  const __CFString *v6;
  void *i;
  void *v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = -[WRM_IDSP2PController ConnectedDevices](self, "ConnectedDevices");
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    v6 = CFSTR("%s: Device is Paired!");
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (v8 && (objc_msgSend(v8, "isLocallyPaired") & 1) != 0)
        {
          v9 = 1;
          goto LABEL_13;
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
    v9 = 0;
    v6 = CFSTR("%s: Device is NOT Paired!");
  }
  else
  {
    v9 = 0;
    v6 = CFSTR("%s: Device is NOT Paired!");
  }
LABEL_13:
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, v6, "-[WRM_IDSP2PController updateDevicePairingState]");
  return v9;
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v6;
  NSObject *queue;
  _QWORD v8[6];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("IDSP2PSync: devicesChanged called"));
  v6 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004853C;
  v8[3] = &unk_100201B18;
  v8[4] = a4;
  v8[5] = self;
  dispatch_async(queue, v8);
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  id v6;
  NSObject *queue;
  _QWORD block[5];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("IDSP2PSync: connectedDevicesChanged called"));
  v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100048748;
  block[3] = &unk_1002019E8;
  block[4] = a4;
  dispatch_async(queue, block);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  const char *v9;
  id v10;
  uint64_t v11;

  if (a6)
    v9 = "true";
  else
    v9 = "false";
  v10 = objc_msgSend(a5, "UTF8String", a3, a4);
  if (a7)
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("IDSP2PSync: -- didSendWithSuccess: %s identifier: %s error: %s"), v9, v10, objc_msgSend(objc_msgSend(a7, "description"), "UTF8String"));
  else
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("IDSP2PSync:   -- didSendWithSuccess: %s identifier: %s"), v9, v10, v11);
}

- (unsigned)IsIDSInitDone
{
  return -[WRM_IDSP2PController ServiceInitDone](self, "ServiceInitDone");
}

- (void)InitService
{
  NSObject *queue;
  _QWORD block[5];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, CFSTR("IDSP2PSync: InitService called"));
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000488B8;
  block[3] = &unk_1002019E8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (IDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSArray)ConnectedDevices
{
  return self->_ConnectedDevices;
}

- (void)setConnectedDevices:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (BOOL)ServiceInitDone
{
  return self->_ServiceInitDone;
}

- (void)setServiceInitDone:(BOOL)a3
{
  self->_ServiceInitDone = a3;
}

- (BOOL)DevicePaired
{
  return self->_DevicePaired;
}

- (void)setDevicePaired:(BOOL)a3
{
  self->_DevicePaired = a3;
}

- (NSString)CompanionWifiStatus
{
  return self->_CompanionWifiStatus;
}

- (void)setCompanionWifiStatus:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSString)CompanionBTVersusWiFiRecommendation
{
  return self->_CompanionBTVersusWiFiRecommendation;
}

- (void)setCompanionBTVersusWiFiRecommendation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSString)CompanionInternetConnectionAvailable
{
  return self->_CompanionInternetConnectionAvailable;
}

- (void)setCompanionInternetConnectionAvailable:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSString)CompanionBTRssi
{
  return self->_CompanionBTRssi;
}

- (void)setCompanionBTRssi:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSString)CompanionWIFIRssi
{
  return self->_CompanionWIFIRssi;
}

- (void)setCompanionWIFIRssi:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

@end
