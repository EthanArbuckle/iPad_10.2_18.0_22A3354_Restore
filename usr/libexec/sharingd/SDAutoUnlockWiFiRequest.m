@implementation SDAutoUnlockWiFiRequest

- (SDAutoUnlockWiFiRequest)initWithAwdlInfo:(id)a3 isRangingInitiator:(BOOL)a4 rangingPeer:(id)a5 queueAvailableHandler:(id)a6 awdlStartedHandler:(id)a7 peerFoundHandler:(id)a8 rangingStartedHandler:(id)a9 rangingCompletedHandler:(id)a10 invalidationHandler:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  SDAutoUnlockWiFiRequest *v23;
  void *v24;
  uint64_t v25;
  NSString *identifier;
  id v27;
  id queueAvailableHandler;
  id v29;
  id awdlStartedHandler;
  id v31;
  id peerFoundHandler;
  id v33;
  id rangingStartedHandler;
  id v35;
  id rangingCompletedHandler;
  id v37;
  id invalidationHandler;
  id v41;
  id v42;
  objc_super v43;

  v42 = a3;
  v41 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  v43.receiver = self;
  v43.super_class = (Class)SDAutoUnlockWiFiRequest;
  v23 = -[SDAutoUnlockWiFiRequest init](&v43, "init");
  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "UUIDString"));
    identifier = v23->_identifier;
    v23->_identifier = (NSString *)v25;

    objc_storeStrong((id *)&v23->_awdlInfo, a3);
    v23->_isRangingInitiator = a4;
    objc_storeStrong((id *)&v23->_rangingPeer, a5);
    v27 = objc_msgSend(v17, "copy");
    queueAvailableHandler = v23->_queueAvailableHandler;
    v23->_queueAvailableHandler = v27;

    v29 = objc_msgSend(v18, "copy");
    awdlStartedHandler = v23->_awdlStartedHandler;
    v23->_awdlStartedHandler = v29;

    v31 = objc_msgSend(v19, "copy");
    peerFoundHandler = v23->_peerFoundHandler;
    v23->_peerFoundHandler = v31;

    v33 = objc_msgSend(v20, "copy");
    rangingStartedHandler = v23->_rangingStartedHandler;
    v23->_rangingStartedHandler = v33;

    v35 = objc_msgSend(v21, "copy");
    rangingCompletedHandler = v23->_rangingCompletedHandler;
    v23->_rangingCompletedHandler = v35;

    v37 = objc_msgSend(v22, "copy");
    invalidationHandler = v23->_invalidationHandler;
    v23->_invalidationHandler = v37;

  }
  return v23;
}

- (void)_invalidate
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void (**v6)(void);
  int v7;
  const char *v8;
  __int16 v9;
  SDAutoUnlockWiFiRequest *v10;

  v3 = auto_unlock_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[SDAutoUnlockWiFiRequest _invalidate]";
    v9 = 2112;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v7, 0x16u);
  }

  -[SDAutoUnlockWiFiRequest setInvalidated:](self, "setInvalidated:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiRequest invalidationHandler](self, "invalidationHandler"));

  if (v5)
  {
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiRequest invalidationHandler](self, "invalidationHandler"));
    v6[2]();

  }
  -[SDAutoUnlockWiFiRequest setInvalidationHandler:](self, "setInvalidationHandler:", 0);
  -[SDAutoUnlockWiFiRequest setQueueAvailableHandler:](self, "setQueueAvailableHandler:", 0);
  -[SDAutoUnlockWiFiRequest setAwdlStartedHandler:](self, "setAwdlStartedHandler:", 0);
  -[SDAutoUnlockWiFiRequest setPeerFoundHandler:](self, "setPeerFoundHandler:", 0);
  -[SDAutoUnlockWiFiRequest setRangingStartedHandler:](self, "setRangingStartedHandler:", 0);
  -[SDAutoUnlockWiFiRequest setRangingCompletedHandler:](self, "setRangingCompletedHandler:", 0);
}

- (BOOL)isEqual:(id)a3
{
  return self == a3;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockWiFiRequest identifier](self, "identifier"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (NSDictionary)awdlInfo
{
  return self->_awdlInfo;
}

- (BOOL)isRangingInitiator
{
  return self->_isRangingInitiator;
}

- (SDAutoUnlockRangingPeer)rangingPeer
{
  return self->_rangingPeer;
}

- (void)setRangingPeer:(id)a3
{
  objc_storeStrong((id *)&self->_rangingPeer, a3);
}

- (int64_t)rangingTimeout
{
  return self->_rangingTimeout;
}

- (void)setRangingTimeout:(int64_t)a3
{
  self->_rangingTimeout = a3;
}

- (NSError)wifiRangingError
{
  return self->_wifiRangingError;
}

- (void)setWifiRangingError:(id)a3
{
  objc_storeStrong((id *)&self->_wifiRangingError, a3);
}

- (NSArray)wifiRangingResults
{
  return self->_wifiRangingResults;
}

- (void)setWifiRangingResults:(id)a3
{
  objc_storeStrong((id *)&self->_wifiRangingResults, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)queueAvailableHandler
{
  return self->_queueAvailableHandler;
}

- (void)setQueueAvailableHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)awdlStartedHandler
{
  return self->_awdlStartedHandler;
}

- (void)setAwdlStartedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)peerFoundHandler
{
  return self->_peerFoundHandler;
}

- (void)setPeerFoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)rangingStartedHandler
{
  return self->_rangingStartedHandler;
}

- (void)setRangingStartedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)rangingCompletedHandler
{
  return self->_rangingCompletedHandler;
}

- (void)setRangingCompletedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)activateCalled
{
  return self->_activateCalled;
}

- (void)setActivateCalled:(BOOL)a3
{
  self->_activateCalled = a3;
}

- (BOOL)invalidateCalled
{
  return self->_invalidateCalled;
}

- (void)setInvalidateCalled:(BOOL)a3
{
  self->_invalidateCalled = a3;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (BOOL)rangeable
{
  return self->_rangeable;
}

- (void)setRangeable:(BOOL)a3
{
  self->_rangeable = a3;
}

- (BOOL)calledAWDLStarted
{
  return self->_calledAWDLStarted;
}

- (void)setCalledAWDLStarted:(BOOL)a3
{
  self->_calledAWDLStarted = a3;
}

- (BOOL)rangingStarted
{
  return self->_rangingStarted;
}

- (void)setRangingStarted:(BOOL)a3
{
  self->_rangingStarted = a3;
}

- (BOOL)waitingForNetworkToDisable
{
  return self->_waitingForNetworkToDisable;
}

- (void)setWaitingForNetworkToDisable:(BOOL)a3
{
  self->_waitingForNetworkToDisable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_rangingCompletedHandler, 0);
  objc_storeStrong(&self->_rangingStartedHandler, 0);
  objc_storeStrong(&self->_peerFoundHandler, 0);
  objc_storeStrong(&self->_awdlStartedHandler, 0);
  objc_storeStrong(&self->_queueAvailableHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_wifiRangingResults, 0);
  objc_storeStrong((id *)&self->_wifiRangingError, 0);
  objc_storeStrong((id *)&self->_rangingPeer, 0);
  objc_storeStrong((id *)&self->_awdlInfo, 0);
}

@end
