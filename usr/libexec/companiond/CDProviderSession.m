@implementation CDProviderSession

- (CDProviderSession)initWithDeviceIdentifier:(id)a3 discoveryType:(int64_t)a4
{
  id v6;
  CDProviderSession *v7;
  uint64_t v8;
  OS_os_transaction *transaction;
  NSString *v10;
  NSString *deviceIdentifier;
  uint64_t v12;
  NSDictionary *rapportOptions;
  objc_super v15;
  uint64_t v16;
  void *v17;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CDProviderSession;
  v7 = -[CDProviderSession init](&v15, "init");
  if (v7)
  {
    v8 = os_transaction_create("companion authentication session");
    transaction = v7->_transaction;
    v7->_transaction = (OS_os_transaction *)v8;

    objc_storeStrong((id *)&v7->_dispatchQueue, &_dispatch_main_q);
    v7->_activateCalledAtomic = 0;
    v10 = (NSString *)objc_msgSend(v6, "copy");
    deviceIdentifier = v7->_deviceIdentifier;
    v7->_deviceIdentifier = v10;

    v7->_discoveryType = a4;
    v16 = RPOptionBTHighPriority;
    v17 = &__kCFBooleanTrue;
    v12 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
    rapportOptions = v7->_rapportOptions;
    v7->_rapportOptions = (NSDictionary *)v12;

  }
  return v7;
}

- (CDProviderSession)initWithLocalAuthenticationRequest:(id)a3
{
  id v5;
  CDProviderSession *v6;
  CDProviderSession *v7;
  uint64_t v8;
  OS_os_transaction *transaction;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CDProviderSession;
  v6 = -[CDProviderSession init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_localAuthenticationRequest, a3);
    v8 = os_transaction_create("companion authentication session");
    transaction = v7->_transaction;
    v7->_transaction = (OS_os_transaction *)v8;

    objc_storeStrong((id *)&v7->_dispatchQueue, &_dispatch_main_q);
    v7->_activateCalledAtomic = 0;
  }

  return v7;
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
  block[2] = sub_1000052F0;
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
  block[2] = sub_1000053E8;
  block[3] = &unk_1000307A0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (int64_t)discoveryType
{
  return self->_discoveryType;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)sessionFinishedHandler
{
  return self->_sessionFinishedHandler;
}

- (void)setSessionFinishedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (id)sessionFailedHandler
{
  return self->_sessionFailedHandler;
}

- (void)setSessionFailedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_sessionFailedHandler, 0);
  objc_storeStrong(&self->_sessionFinishedHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_localAuthenticationRequest, 0);
  objc_storeStrong((id *)&self->_viewService, 0);
  objc_storeStrong((id *)&self->_purchaseTask, 0);
  objc_storeStrong((id *)&self->_rapportOptions, 0);
  objc_storeStrong((id *)&self->_storeAccount, 0);
  objc_storeStrong((id *)&self->_authenticationServicesProxy, 0);
  objc_storeStrong((id *)&self->_appleAccount, 0);
  objc_storeStrong((id *)&self->_screenSleepTimer, 0);
  objc_storeStrong((id *)&self->_nearbyActionDiscovery, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_alertSession, 0);
  objc_storeStrong((id *)&self->_notificationSession, 0);
  objc_storeStrong((id *)&self->_rapportClient, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
