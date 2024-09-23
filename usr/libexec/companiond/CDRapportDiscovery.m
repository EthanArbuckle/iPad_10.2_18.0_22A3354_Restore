@implementation CDRapportDiscovery

- (CDRapportDiscovery)init
{
  CDRapportDiscovery *v2;
  CDRapportDiscovery *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CDRapportDiscovery;
  v2 = -[CDRapportDiscovery init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v3->_activateCalledAtomic = 0;
  }
  return v3;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (void)activate
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  atomic_store(1u, (unsigned __int8 *)&self->_activateCalledAtomic);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011940;
  block[3] = &unk_1000307A0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)invalidate
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000119AC;
  block[3] = &unk_1000307A0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)resetDiscoveryTimer
{
  -[BSContinuousMachTimer cancel](self->_discoveryTimer, "cancel");
  -[CDRapportDiscovery _startDiscoveryTimer](self, "_startDiscoveryTimer");
}

- (void)_activated
{
  RPCompanionLinkClient *v3;
  RPCompanionLinkClient *rapportClient;
  RPCompanionLinkClient *v5;
  RPCompanionLinkClient *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = (RPCompanionLinkClient *)objc_alloc_init((Class)RPCompanionLinkClient);
  rapportClient = self->_rapportClient;
  self->_rapportClient = v3;

  -[RPCompanionLinkClient setRssiThreshold:](self->_rapportClient, "setRssiThreshold:", -75);
  v5 = self->_rapportClient;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100011ABC;
  v8[3] = &unk_100030E28;
  v8[4] = self;
  -[RPCompanionLinkClient setDeviceFoundHandler:](v5, "setDeviceFoundHandler:", v8);
  -[RPCompanionLinkClient setDispatchQueue:](self->_rapportClient, "setDispatchQueue:", self->_dispatchQueue);
  -[RPCompanionLinkClient setControlFlags:](self->_rapportClient, "setControlFlags:", 0x82004113800);
  v6 = self->_rapportClient;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100011AC8;
  v7[3] = &unk_100030840;
  v7[4] = self;
  -[RPCompanionLinkClient activateWithCompletion:](v6, "activateWithCompletion:", v7);
}

- (void)_invalidated
{
  RPCompanionLinkClient *rapportClient;
  BSContinuousMachTimer *discoveryTimer;
  id deviceFoundHandler;
  void (**invalidationHandler)(void);
  id v7;
  id v8;
  NSObject *v9;
  uint8_t v10[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    -[RPCompanionLinkClient invalidate](self->_rapportClient, "invalidate");
    rapportClient = self->_rapportClient;
    self->_rapportClient = 0;

    -[BSContinuousMachTimer invalidate](self->_discoveryTimer, "invalidate");
    discoveryTimer = self->_discoveryTimer;
    self->_discoveryTimer = 0;

    deviceFoundHandler = self->_deviceFoundHandler;
    self->_deviceFoundHandler = 0;

    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2]();
      v7 = self->_invalidationHandler;
      self->_invalidationHandler = 0;

    }
    self->_invalidateDone = 1;
    v8 = sub_100011B90();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Discovery invalidated.", v10, 2u);
    }

  }
}

- (void)_handleDeviceFound:(id)a3
{
  id v4;
  void *v5;
  void (*v6)(void);
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsDeviceIdentifier"));
  if (v5)
  {
    if (self->_deviceFoundHandler)
    {
      if ((objc_msgSend(v4, "statusFlags") & 0x40000000) != 0)
      {
        v6 = (void (*)(void))*((_QWORD *)self->_deviceFoundHandler + 2);
        goto LABEL_10;
      }
      if ((objc_msgSend(v4, "statusFlags") & 0x200000) != 0)
      {
        v6 = (void (*)(void))*((_QWORD *)self->_deviceFoundHandler + 2);
LABEL_10:
        v6();
      }
    }
  }
  else
  {
    v7 = sub_100011B90();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10001EBB8((uint64_t)v4, v8, v9, v10, v11, v12, v13, v14);

  }
}

- (void)_startDiscoveryTimer
{
  id v3;
  NSObject *v4;
  BSContinuousMachTimer *discoveryTimer;
  BSContinuousMachTimer *v6;
  BSContinuousMachTimer *v7;
  OS_dispatch_queue *dispatchQueue;
  _QWORD v9[5];
  uint8_t buf[16];

  v3 = sub_100011B90();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting discovery timer.", buf, 2u);
  }

  discoveryTimer = self->_discoveryTimer;
  if (!discoveryTimer)
  {
    v6 = (BSContinuousMachTimer *)objc_msgSend(objc_alloc((Class)BSContinuousMachTimer), "initWithIdentifier:", CFSTR("CDRapportDiscovery.discoveryTimer"));
    v7 = self->_discoveryTimer;
    self->_discoveryTimer = v6;

    discoveryTimer = self->_discoveryTimer;
  }
  dispatchQueue = self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100011E44;
  v9[3] = &unk_100030A00;
  v9[4] = self;
  -[BSContinuousMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](discoveryTimer, "scheduleWithFireInterval:leewayInterval:queue:handler:", dispatchQueue, v9, 30.0, 1.0);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_discoveryTimer, 0);
  objc_storeStrong((id *)&self->_rapportClient, 0);
}

@end
