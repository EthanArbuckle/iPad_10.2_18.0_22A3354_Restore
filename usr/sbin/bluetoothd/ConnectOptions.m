@implementation ConnectOptions

+ (id)alertOptionsWithConnectionAlerts:(BOOL)a3 disconnectionAlerts:(BOOL)a4 notificationAlerts:(BOOL)a5 delay:(int64_t)a6 bridgeTransport:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  ConnectOptions *v12;
  void *v13;
  void *v14;

  v7 = a7;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = objc_alloc_init(ConnectOptions);
  -[ConnectOptions setConnectionAlerts:](v12, "setConnectionAlerts:", v11);
  -[ConnectOptions setDisconnectionAlerts:](v12, "setDisconnectionAlerts:", v10);
  -[ConnectOptions setNotificationAlerts:](v12, "setNotificationAlerts:", v9);
  -[ConnectOptions setDelay:](v12, "setDelay:", a6);
  -[ConnectOptions setEnableTransportBridging:](v12, "setEnableTransportBridging:", v7);
  -[ConnectOptions setDisableLeGATT:](v12, "setDisableLeGATT:", 0);
  -[ConnectOptions setCtkdChosenTransport:](v12, "setCtkdChosenTransport:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
  -[ConnectOptions setTemporaryLTK:](v12, "setTemporaryLTK:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  -[ConnectOptions setConnectingClients:](v12, "setConnectingClients:", v14);

  -[ConnectOptions setOpportunistic:](v12, "setOpportunistic:", 0);
  -[ConnectOptions setEnableAutoReconnect:](v12, "setEnableAutoReconnect:", 0);
  -[ConnectOptions setRequiresLowLatency:](v12, "setRequiresLowLatency:", 0);
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ConnectOptions *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = -[ConnectOptions init](+[ConnectOptions allocWithZone:](ConnectOptions, "allocWithZone:", a3), "init");
  -[ConnectOptions setPHYOptions:](v4, "setPHYOptions:", -[ConnectOptions PHYOptions](self, "PHYOptions"));
  -[ConnectOptions setAncsRequired:](v4, "setAncsRequired:", -[ConnectOptions ancsRequired](self, "ancsRequired"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectOptions clientBundleID](self, "clientBundleID"));
  -[ConnectOptions setClientBundleID:](v4, "setClientBundleID:", v5);

  -[ConnectOptions setConnectionAlerts:](v4, "setConnectionAlerts:", -[ConnectOptions connectionAlerts](self, "connectionAlerts"));
  -[ConnectOptions setDisconnectionAlerts:](v4, "setDisconnectionAlerts:", -[ConnectOptions disconnectionAlerts](self, "disconnectionAlerts"));
  -[ConnectOptions setNotificationAlerts:](v4, "setNotificationAlerts:", -[ConnectOptions notificationAlerts](self, "notificationAlerts"));
  -[ConnectOptions setDelay:](v4, "setDelay:", -[ConnectOptions delay](self, "delay"));
  -[ConnectOptions setWantsObjectDiscoveryData:](v4, "setWantsObjectDiscoveryData:", -[ConnectOptions wantsObjectDiscoveryData](self, "wantsObjectDiscoveryData"));
  -[ConnectOptions setEnableTransportBridging:](v4, "setEnableTransportBridging:", -[ConnectOptions enableTransportBridging](self, "enableTransportBridging"));
  -[ConnectOptions setDisableLeGATT:](v4, "setDisableLeGATT:", -[ConnectOptions disableLeGATT](self, "disableLeGATT"));
  -[ConnectOptions setHideFromBTSettings:](v4, "setHideFromBTSettings:", -[ConnectOptions hideFromBTSettings](self, "hideFromBTSettings"));
  -[ConnectOptions setInitPHYs:](v4, "setInitPHYs:", -[ConnectOptions initPHYs](self, "initPHYs"));
  -[ConnectOptions setEnableControllerBTClockUpdates:](v4, "setEnableControllerBTClockUpdates:", -[ConnectOptions enableControllerBTClockUpdates](self, "enableControllerBTClockUpdates"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectOptions clientProcessID](self, "clientProcessID"));
  -[ConnectOptions setClientProcessID:](v4, "setClientProcessID:", v6);

  -[ConnectOptions setConnectionUseCase:](v4, "setConnectionUseCase:", -[ConnectOptions connectionUseCase](self, "connectionUseCase"));
  -[ConnectOptions setMaxAllowedConnectionDelay:](v4, "setMaxAllowedConnectionDelay:", -[ConnectOptions maxAllowedConnectionDelay](self, "maxAllowedConnectionDelay"));
  -[ConnectOptions setWaitForConnectionPoll:](v4, "setWaitForConnectionPoll:", -[ConnectOptions waitForConnectionPoll](self, "waitForConnectionPoll"));
  -[ConnectOptions setMinRSSILevelForConnection:](v4, "setMinRSSILevelForConnection:", -[ConnectOptions minRSSILevelForConnection](self, "minRSSILevelForConnection"));
  -[ConnectOptions setEnableScanCore:](v4, "setEnableScanCore:", -[ConnectOptions enableScanCore](self, "enableScanCore"));
  -[ConnectOptions setIsLatencyCritical:](v4, "setIsLatencyCritical:", -[ConnectOptions isLatencyCritical](self, "isLatencyCritical"));
  -[ConnectOptions setCtkdChosenTransport:](v4, "setCtkdChosenTransport:", -[ConnectOptions ctkdChosenTransport](self, "ctkdChosenTransport"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectOptions temporaryLTK](self, "temporaryLTK"));
  -[ConnectOptions setTemporaryLTK:](v4, "setTemporaryLTK:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectOptions connectingClients](self, "connectingClients"));
  -[ConnectOptions setConnectingClients:](v4, "setConnectingClients:", v8);

  -[ConnectOptions setOpportunistic:](v4, "setOpportunistic:", -[ConnectOptions opportunistic](self, "opportunistic"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ConnectOptions useCaseList](self, "useCaseList"));
  -[ConnectOptions setUseCaseList:](v4, "setUseCaseList:", v9);

  -[ConnectOptions setRequiresLowLatency:](v4, "setRequiresLowLatency:", -[ConnectOptions requiresLowLatency](self, "requiresLowLatency"));
  -[ConnectOptions setTxPowerConnectInd:](v4, "setTxPowerConnectInd:", -[ConnectOptions txPowerConnectInd](self, "txPowerConnectInd"));
  -[ConnectOptions setTxPowerAuxConnectReq:](v4, "setTxPowerAuxConnectReq:", -[ConnectOptions txPowerAuxConnectReq](self, "txPowerAuxConnectReq"));
  -[ConnectOptions setMrcEnable:](v4, "setMrcEnable:", -[ConnectOptions mrcEnable](self, "mrcEnable"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", self->_connectionAlerts, CFSTR("connectionAlerts"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_disconnectionAlerts, CFSTR("disconnectionAlerts"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_notificationAlerts, CFSTR("notificationAlerts"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_delay, CFSTR("delay"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_enableTransportBridging, CFSTR("enableTransportBridging"));

}

- (ConnectOptions)initWithCoder:(id)a3
{
  id v4;
  ConnectOptions *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ConnectOptions;
  v5 = -[ConnectOptions init](&v7, "init");
  if (v5)
  {
    v5->_connectionAlerts = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("connectionAlerts"));
    v5->_disconnectionAlerts = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("disconnectionAlerts"));
    v5->_notificationAlerts = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("notificationAlerts"));
    v5->_delay = (int64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("delay"));
    v5->_enableTransportBridging = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enableTransportBridging"));
  }

  return v5;
}

- (id)description
{
  uint64_t v3;
  int v4;
  _BOOL8 connectionAlerts;
  _BOOL8 disconnectionAlerts;
  _BOOL8 notificationAlerts;
  int64_t delay;
  _BOOL8 wantsObjectDiscoveryData;
  _BOOL8 enableTransportBridging;
  _BOOL8 disableLeGATT;
  _BOOL8 ancsRequired;
  _BOOL8 hideFromBTSettings;
  int64_t PHYOptions;
  int64_t initPHYs;
  _BOOL8 enableControllerBTClockUpdates;
  unint64_t connectionUseCase;
  _BOOL8 waitForConnectionPoll;
  int64_t minRSSILevelForConnection;
  unint64_t ctkdChosenTransport;
  NSArray *connectingClients;
  _BOOL8 opportunistic;
  const __CFString *v23;
  NSString *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v3 = sub_100027F68();
  v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  connectionAlerts = self->_connectionAlerts;
  disconnectionAlerts = self->_disconnectionAlerts;
  notificationAlerts = self->_notificationAlerts;
  delay = self->_delay;
  wantsObjectDiscoveryData = self->_wantsObjectDiscoveryData;
  enableTransportBridging = self->_enableTransportBridging;
  disableLeGATT = self->_disableLeGATT;
  ancsRequired = self->_ancsRequired;
  if (v4)
  {
    hideFromBTSettings = self->_hideFromBTSettings;
    initPHYs = self->_initPHYs;
    PHYOptions = self->_PHYOptions;
    enableControllerBTClockUpdates = self->_enableControllerBTClockUpdates;
    connectionUseCase = self->_connectionUseCase;
    waitForConnectionPoll = self->_waitForConnectionPoll;
    minRSSILevelForConnection = self->_minRSSILevelForConnection;
    ctkdChosenTransport = self->_ctkdChosenTransport;
    connectingClients = self->_connectingClients;
    opportunistic = self->_opportunistic;
    if (self->_requiresLowLatency)
      v23 = CFSTR("YES");
    else
      v23 = CFSTR("NO");
    v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(connect:%d disconnect:%d notify:%d delay:%ld wantsObjectDiscoverData:%d transportBridging:%d disableLeGATT:%d ancsRequired:%d hideFromBTSettings:%d initPHYs:%ld PHYoptions:%ld enableControllerBTClockUpdates:%d connectionUseCase:%ld _minRSSILevelForConnection:%ld _waitForConnectionPoll:%d ctkdChosenTransport:%lu) connectingBundles:%@ opportunistic:%d requiresLowLatency:%@"), connectionAlerts, disconnectionAlerts, notificationAlerts, delay, wantsObjectDiscoveryData, enableTransportBridging, disableLeGATT, ancsRequired, hideFromBTSettings, initPHYs, PHYOptions, enableControllerBTClockUpdates, connectionUseCase, minRSSILevelForConnection, waitForConnectionPoll, ctkdChosenTransport,
            connectingClients,
            opportunistic,
            v23);
  }
  else
  {
    v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(connect:%d disconnect:%d notify:%d delay:%ld wantsObjectDiscoverData:%d transportBridging:%d disableLeGATT:%d ancsRequired:%d)"), connectionAlerts, disconnectionAlerts, notificationAlerts, delay, wantsObjectDiscoveryData, enableTransportBridging, self->_disableLeGATT, ancsRequired, v26, v27, v28, v29, v30, v31, v32, v33,
            v34,
            v35,
            v36);
  }
  return (id)objc_claimAutoreleasedReturnValue(v24);
}

- (BOOL)connectionAlerts
{
  return self->_connectionAlerts;
}

- (void)setConnectionAlerts:(BOOL)a3
{
  self->_connectionAlerts = a3;
}

- (BOOL)disconnectionAlerts
{
  return self->_disconnectionAlerts;
}

- (void)setDisconnectionAlerts:(BOOL)a3
{
  self->_disconnectionAlerts = a3;
}

- (BOOL)notificationAlerts
{
  return self->_notificationAlerts;
}

- (void)setNotificationAlerts:(BOOL)a3
{
  self->_notificationAlerts = a3;
}

- (int64_t)delay
{
  return self->_delay;
}

- (void)setDelay:(int64_t)a3
{
  self->_delay = a3;
}

- (BOOL)wantsObjectDiscoveryData
{
  return self->_wantsObjectDiscoveryData;
}

- (void)setWantsObjectDiscoveryData:(BOOL)a3
{
  self->_wantsObjectDiscoveryData = a3;
}

- (BOOL)enableTransportBridging
{
  return self->_enableTransportBridging;
}

- (void)setEnableTransportBridging:(BOOL)a3
{
  self->_enableTransportBridging = a3;
}

- (BOOL)disableLeGATT
{
  return self->_disableLeGATT;
}

- (void)setDisableLeGATT:(BOOL)a3
{
  self->_disableLeGATT = a3;
}

- (BOOL)ancsRequired
{
  return self->_ancsRequired;
}

- (void)setAncsRequired:(BOOL)a3
{
  self->_ancsRequired = a3;
}

- (BOOL)hideFromBTSettings
{
  return self->_hideFromBTSettings;
}

- (void)setHideFromBTSettings:(BOOL)a3
{
  self->_hideFromBTSettings = a3;
}

- (int64_t)initPHYs
{
  return self->_initPHYs;
}

- (void)setInitPHYs:(int64_t)a3
{
  self->_initPHYs = a3;
}

- (int64_t)PHYOptions
{
  return self->_PHYOptions;
}

- (void)setPHYOptions:(int64_t)a3
{
  self->_PHYOptions = a3;
}

- (BOOL)enableControllerBTClockUpdates
{
  return self->_enableControllerBTClockUpdates;
}

- (void)setEnableControllerBTClockUpdates:(BOOL)a3
{
  self->_enableControllerBTClockUpdates = a3;
}

- (NSString)clientBundleID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setClientBundleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)clientProcessID
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setClientProcessID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (unint64_t)connectionUseCase
{
  return self->_connectionUseCase;
}

- (void)setConnectionUseCase:(unint64_t)a3
{
  self->_connectionUseCase = a3;
}

- (int64_t)maxAllowedConnectionDelay
{
  return self->_maxAllowedConnectionDelay;
}

- (void)setMaxAllowedConnectionDelay:(int64_t)a3
{
  self->_maxAllowedConnectionDelay = a3;
}

- (BOOL)waitForConnectionPoll
{
  return self->_waitForConnectionPoll;
}

- (void)setWaitForConnectionPoll:(BOOL)a3
{
  self->_waitForConnectionPoll = a3;
}

- (int64_t)minRSSILevelForConnection
{
  return self->_minRSSILevelForConnection;
}

- (void)setMinRSSILevelForConnection:(int64_t)a3
{
  self->_minRSSILevelForConnection = a3;
}

- (BOOL)enableScanCore
{
  return self->_enableScanCore;
}

- (void)setEnableScanCore:(BOOL)a3
{
  self->_enableScanCore = a3;
}

- (BOOL)isLatencyCritical
{
  return self->_isLatencyCritical;
}

- (void)setIsLatencyCritical:(BOOL)a3
{
  self->_isLatencyCritical = a3;
}

- (unint64_t)ctkdChosenTransport
{
  return self->_ctkdChosenTransport;
}

- (void)setCtkdChosenTransport:(unint64_t)a3
{
  self->_ctkdChosenTransport = a3;
}

- (NSData)temporaryLTK
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setTemporaryLTK:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSString)temporaryIdentityAddress
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setTemporaryIdentityAddress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSData)temporaryIRK
{
  return (NSData *)objc_getProperty(self, a2, 120, 1);
}

- (void)setTemporaryIRK:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (BOOL)resetDisconnectionHistory
{
  return self->_resetDisconnectionHistory;
}

- (void)setResetDisconnectionHistory:(BOOL)a3
{
  self->_resetDisconnectionHistory = a3;
}

- (BOOL)connectingToPANServices
{
  return self->_connectingToPANServices;
}

- (void)setConnectingToPANServices:(BOOL)a3
{
  self->_connectingToPANServices = a3;
}

- (NSArray)connectingClients
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (void)setConnectingClients:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSArray)useCaseList
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (void)setUseCaseList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (BOOL)opportunistic
{
  return self->_opportunistic;
}

- (void)setOpportunistic:(BOOL)a3
{
  self->_opportunistic = a3;
}

- (BOOL)enableAutoReconnect
{
  return self->_enableAutoReconnect;
}

- (void)setEnableAutoReconnect:(BOOL)a3
{
  self->_enableAutoReconnect = a3;
}

- (BOOL)requiresLowLatency
{
  return self->_requiresLowLatency;
}

- (void)setRequiresLowLatency:(BOOL)a3
{
  self->_requiresLowLatency = a3;
}

- (int64_t)txPowerConnectInd
{
  return self->_txPowerConnectInd;
}

- (void)setTxPowerConnectInd:(int64_t)a3
{
  self->_txPowerConnectInd = a3;
}

- (int64_t)txPowerAuxConnectReq
{
  return self->_txPowerAuxConnectReq;
}

- (void)setTxPowerAuxConnectReq:(int64_t)a3
{
  self->_txPowerAuxConnectReq = a3;
}

- (int64_t)mrcEnable
{
  return self->_mrcEnable;
}

- (void)setMrcEnable:(int64_t)a3
{
  self->_mrcEnable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_useCaseList, 0);
  objc_storeStrong((id *)&self->_connectingClients, 0);
  objc_storeStrong((id *)&self->_temporaryIRK, 0);
  objc_storeStrong((id *)&self->_temporaryIdentityAddress, 0);
  objc_storeStrong((id *)&self->_temporaryLTK, 0);
  objc_storeStrong((id *)&self->_clientProcessID, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
}

@end
