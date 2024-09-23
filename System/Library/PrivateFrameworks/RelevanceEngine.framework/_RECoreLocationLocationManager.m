@implementation _RECoreLocationLocationManager

- (_RECoreLocationLocationManager)initWithEffectiveBundlePath:(id)a3
{
  id v4;
  id v5;
  dispatch_queue_t v6;
  void *v7;
  _QWORD *v8;
  id v9;
  void *v10;
  NSObject *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  objc_super v16;
  uint8_t buf[4];
  _QWORD *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_RECoreLocationLocationManager;
  v5 = -[_RECoreLocationLocationManager init](&v16, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.relevanceengine.corelocationmanager", 0);
    v7 = (void *)*((_QWORD *)v5 + 5);
    *((_QWORD *)v5 + 5) = v6;

    dispatch_suspend(*((dispatch_object_t *)v5 + 5));
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __62___RECoreLocationLocationManager_initWithEffectiveBundlePath___block_invoke;
    v13[3] = &unk_24CF8AB18;
    v14 = v4;
    v8 = v5;
    v15 = v8;
    dispatch_async(MEMORY[0x24BDAC9B8], v13);
    v9 = objc_alloc_init(MEMORY[0x24BDD1648]);
    v10 = (void *)v8[2];
    v8[2] = v9;

    RELogForDomain(5);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v8;
      _os_log_impl(&dword_2132F7000, v11, OS_LOG_TYPE_DEFAULT, "_RECoreLocationLocationManager initialized. %@", buf, 0xCu);
    }

  }
  return (_RECoreLocationLocationManager *)v5;
}

- (void)dealloc
{
  objc_super v3;
  _QWORD block[5];
  _QWORD v5[5];
  CLLocationManager *v6;

  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy__15;
  v5[4] = __Block_byref_object_dispose__15;
  v6 = self->_locationManager;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41___RECoreLocationLocationManager_dealloc__block_invoke;
  block[3] = &unk_24CF8AC38;
  block[4] = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  _Block_object_dispose(v5, 8);

  v3.receiver = self;
  v3.super_class = (Class)_RECoreLocationLocationManager;
  -[_RECoreLocationLocationManager dealloc](&v3, sel_dealloc);
}

- (id)currentLocation
{
  CLLocation *v3;

  -[NSLock lock](self->_locationAccessLock, "lock");
  v3 = self->_currentLocation;
  -[NSLock unlock](self->_locationAccessLock, "unlock");
  return v3;
}

- (void)startLocationUpdatesWithHandler:(id)a3
{
  id v4;
  NSObject *queue;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD block[5];
  id v12;

  v4 = a3;
  queue = self->_queue;
  v6 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66___RECoreLocationLocationManager_startLocationUpdatesWithHandler___block_invoke;
  block[3] = &unk_24CF8AA78;
  block[4] = self;
  v7 = v4;
  v12 = v7;
  dispatch_async(queue, block);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __66___RECoreLocationLocationManager_startLocationUpdatesWithHandler___block_invoke_24;
  v9[3] = &unk_24CF8B2E0;
  v9[4] = self;
  v10 = v7;
  v8 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

}

- (void)stopLocationUpdates
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53___RECoreLocationLocationManager_stopLocationUpdates__block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  _RECoreLocationLocationManager *v10;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __69___RECoreLocationLocationManager_locationManager_didUpdateLocations___block_invoke;
  v8[3] = &unk_24CF8AB18;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __67___RECoreLocationLocationManager_locationManager_didFailWithError___block_invoke;
  v8[3] = &unk_24CF8AB18;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)_updateLocation:(id)a3
{
  CLLocation *v4;
  CLLocation *currentLocation;
  CLLocation *v6;

  v4 = (CLLocation *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSLock lock](self->_locationAccessLock, "lock");
  currentLocation = self->_currentLocation;
  self->_currentLocation = v4;
  v6 = v4;

  -[NSLock unlock](self->_locationAccessLock, "unlock");
}

- (void)_notifyUpdateHandlersWithError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)MEMORY[0x2199B2434](self->_handler);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65___RECoreLocationLocationManager__notifyUpdateHandlersWithError___block_invoke;
  block[3] = &unk_24CF8D900;
  v9 = v4;
  v10 = v5;
  block[4] = self;
  v6 = v4;
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_locationAccessLock, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
}

@end
