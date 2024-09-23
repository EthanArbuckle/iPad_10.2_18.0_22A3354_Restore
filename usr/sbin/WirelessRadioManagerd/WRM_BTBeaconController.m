@implementation WRM_BTBeaconController

+ (id)WRM_BTBeaconControllerSingleton
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100070558;
  block[3] = &unk_100203228;
  block[4] = a1;
  if (qword_100271190 != -1)
    dispatch_once(&qword_100271190, block);
  return (id)qword_100271188;
}

- (WRM_BTBeaconController)init
{
  WRM_BTBeaconController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *mBTQueue;
  CBDiscovery *v5;
  CBDiscovery *mDiscovery;
  WRM_BTBeaconController *v7;
  CBDiscovery *v8;
  WRM_BTBeaconController *v9;
  void **v11;
  uint64_t v12;
  id (*v13)(uint64_t, uint64_t);
  void *v14;
  WRM_BTBeaconController *v15;
  _QWORD v16[4];
  WRM_BTBeaconController *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)WRM_BTBeaconController;
  v2 = -[WRM_BTBeaconController init](&v18, "init");
  v2->mRSSI = -1;
  v3 = dispatch_queue_create("com.apple.WirelessRadioManager.BT", 0);
  mBTQueue = v2->mBTQueue;
  v2->mBTQueue = (OS_dispatch_queue *)v3;

  v5 = (CBDiscovery *)objc_alloc_init((Class)CBDiscovery);
  mDiscovery = v2->mDiscovery;
  v2->mDiscovery = v5;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("BTBeacon Controller::CBDiscovery: object initialized"));
  -[CBDiscovery setDiscoveryFlags:](v2->mDiscovery, "setDiscoveryFlags:", 0x100000000040);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000706F0;
  v16[3] = &unk_100203250;
  v7 = v2;
  v17 = v7;
  -[CBDiscovery setDeviceFoundHandler:](v2->mDiscovery, "setDeviceFoundHandler:", v16);
  -[CBDiscovery setDeviceLostHandler:](v2->mDiscovery, "setDeviceLostHandler:", &stru_100203290);
  -[CBDiscovery setDispatchQueue:](v2->mDiscovery, "setDispatchQueue:", v2->mBTQueue);
  v8 = v2->mDiscovery;
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_10007077C;
  v14 = &unk_1002032B8;
  v9 = v7;
  v15 = v9;
  -[CBDiscovery activateWithCompletion:](v8, "activateWithCompletion:", &v11);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("BTBeacon Controller Initialized"), v11, v12, v13, v14);

  return v9;
}

- (void)onBleBeaconReceived:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  id v11;

  v11 = a3;
  if ((objc_msgSend(v11, "deviceFlags") & 0x80) != 0)
  {
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "idsDeviceID")));
    v5 = objc_msgSend(v4, "UTF8String");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier")));
    v7 = objc_msgSend(v6, "UTF8String");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "model")));
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("BTBeacon Controller::onBleBeaconReceived: IDS ID %s, BT identifier %s, Model %s, RSSI %d"), v5, v7, objc_msgSend(v8, "UTF8String"), objc_msgSend(v11, "bleRSSI"));

    self->mRSSI = objc_msgSend(v11, "bleRSSI");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[WRM_BTBeaconController clientCBDeviceHandler](self, "clientCBDeviceHandler"));

    if (v9)
    {
      v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[WRM_BTBeaconController clientCBDeviceHandler](self, "clientCBDeviceHandler"));
      ((void (**)(_QWORD, id))v10)[2](v10, v11);

    }
  }

}

- (int)getRSSI
{
  int result;

  result = self->mRSSI;
  if (result == -1)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, CFSTR("BTBeacon Controller::getRSSI: RSSI Value has not been initialized."));
    return self->mRSSI;
  }
  return result;
}

- (id)clientCBDeviceHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setClientCBDeviceHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clientCBDeviceHandler, 0);
  objc_storeStrong((id *)&self->mBTQueue, 0);
  objc_storeStrong((id *)&self->mDiscovery, 0);
}

@end
