@implementation CDDeviceDiscovery

- (CDDeviceDiscovery)init
{
  CDDeviceDiscovery *v2;
  CDDeviceDiscovery *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CDDeviceDiscovery;
  v2 = -[CDDeviceDiscovery init](&v5, "init");
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
  block[2] = sub_1000113A4;
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
  block[2] = sub_100011410;
  block[3] = &unk_1000307A0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)startDiscovery
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011470;
  block[3] = &unk_1000307A0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_activated
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[CDDeviceDiscovery _startRapportListener](self, "_startRapportListener");
  v3 = sub_1000114F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Device discovery activated.", v5, 2u);
  }

}

- (void)_invalidated
{
  id deviceFoundHandler;
  CDRapportListener *rapportListener;
  CDRapportDiscovery *rapportDiscovery;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    deviceFoundHandler = self->_deviceFoundHandler;
    self->_deviceFoundHandler = 0;

    -[CDRapportListener invalidate](self->_rapportListener, "invalidate");
    rapportListener = self->_rapportListener;
    self->_rapportListener = 0;

    -[CDRapportDiscovery invalidate](self->_rapportDiscovery, "invalidate");
    rapportDiscovery = self->_rapportDiscovery;
    self->_rapportDiscovery = 0;

    self->_invalidateDone = 1;
    v6 = sub_1000114F0();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Device discovery invalidated.", v8, 2u);
    }

  }
}

- (void)_startRapportListener
{
  CDRapportListener *v3;
  CDRapportListener *rapportListener;
  CDRapportListener *v5;
  _QWORD v6[5];

  v3 = objc_alloc_init(CDRapportListener);
  rapportListener = self->_rapportListener;
  self->_rapportListener = v3;

  -[CDRapportListener setDispatchQueue:](self->_rapportListener, "setDispatchQueue:", self->_dispatchQueue);
  v5 = self->_rapportListener;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001166C;
  v6[3] = &unk_100030DE0;
  v6[4] = self;
  -[CDRapportListener setDeviceFoundHandler:](v5, "setDeviceFoundHandler:", v6);
  -[CDRapportListener activate](self->_rapportListener, "activate");
}

- (void)_startRapportDiscovery
{
  CDRapportDiscovery *rapportDiscovery;
  CDRapportDiscovery *v4;
  CDRapportDiscovery *v5;
  CDRapportDiscovery *v6;
  CDRapportDiscovery *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  rapportDiscovery = self->_rapportDiscovery;
  if (rapportDiscovery)
  {
    -[CDRapportDiscovery resetDiscoveryTimer](rapportDiscovery, "resetDiscoveryTimer");
  }
  else
  {
    v4 = objc_alloc_init(CDRapportDiscovery);
    v5 = self->_rapportDiscovery;
    self->_rapportDiscovery = v4;

    -[CDRapportDiscovery setDispatchQueue:](self->_rapportDiscovery, "setDispatchQueue:", self->_dispatchQueue);
    v6 = self->_rapportDiscovery;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100011768;
    v9[3] = &unk_100030DE0;
    v9[4] = self;
    -[CDRapportDiscovery setDeviceFoundHandler:](v6, "setDeviceFoundHandler:", v9);
    v7 = self->_rapportDiscovery;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000117D4;
    v8[3] = &unk_1000307A0;
    v8[4] = self;
    -[CDRapportDiscovery setInvalidationHandler:](v7, "setInvalidationHandler:", v8);
    -[CDRapportDiscovery activate](self->_rapportDiscovery, "activate");
  }
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

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_rapportListener, 0);
  objc_storeStrong((id *)&self->_rapportDiscovery, 0);
}

@end
