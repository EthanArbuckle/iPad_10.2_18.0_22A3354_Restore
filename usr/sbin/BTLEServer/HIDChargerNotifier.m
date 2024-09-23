@implementation HIDChargerNotifier

+ (id)stateToStr:(unsigned __int8)a3
{
  if (a3 > 3u)
    return CFSTR("unknown");
  else
    return *(&off_1000ADEE0 + (char)a3);
}

- (HIDChargerNotifier)initWithQueue:(id)a3
{
  id v5;
  HIDChargerNotifier *v6;
  HIDChargerNotifier *v7;
  HIDChargerNotifier *v8;
  NSLock *v9;
  NSLock *lock;
  uint64_t v11;
  NSBundle *pairingProviderBundle;
  uint64_t v13;
  Class ACCBLEPairingProvider;
  void *v15;
  uint64_t v16;
  NSString *accConnIdentifier;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  objc_super v38;

  v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)HIDChargerNotifier;
  v6 = -[HIDChargerNotifier init](&v38, "init");
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    v9 = objc_opt_new(NSLock);
    lock = v7->_lock;
    v7->_lock = v9;

    if (v7->_lock)
    {
      objc_storeStrong((id *)&v7->_queue, a3);
      v11 = objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/AccessoryBLEPairing.framework")));
      pairingProviderBundle = v7->_pairingProviderBundle;
      v7->_pairingProviderBundle = (NSBundle *)v11;

      v13 = objc_claimAutoreleasedReturnValue(-[NSBundle classNamed:](v7->_pairingProviderBundle, "classNamed:", CFSTR("ACCBLEPairingProvider")));
      ACCBLEPairingProvider = v7->_ACCBLEPairingProvider;
      v7->_ACCBLEPairingProvider = (Class)v13;

      if (v7->_ACCBLEPairingProvider)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](ACCTransportClient, "sharedClient"));
        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "createConnectionWithType:andIdentifier:", 2, CFSTR("chargerNotifier")));
        accConnIdentifier = v7->_accConnIdentifier;
        v7->_accConnIdentifier = (NSString *)v16;

        if (v7->_accConnIdentifier)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](ACCTransportClient, "sharedClient"));
          v19 = kACCProperties_Connection_HideFromUI;
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
          objc_msgSend(v18, "setProperty:value:forEndpointWithUUID:", v19, v20, v7->_accConnIdentifier);

          v8 = v7;
          goto LABEL_12;
        }
        v29 = qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
          sub_10006E3E4(v29, v30, v31, v32, v33, v34, v35, v36);
      }
      else
      {
        v21 = qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
          sub_10006E3B4(v21, v22, v23, v24, v25, v26, v27, v28);
      }
    }
    v8 = 0;
  }
LABEL_12:

  return v8;
}

- (void)start
{
  ACCBLEPairingProvider *v3;
  ACCBLEPairingProvider *pairingProvider;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = (ACCBLEPairingProvider *)objc_msgSend(objc_alloc(self->_ACCBLEPairingProvider), "initWithDelegate:", self);
  pairingProvider = self->_pairingProvider;
  self->_pairingProvider = v3;

  if (!self->_pairingProvider)
  {
    v5 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006E414(v5, v6, v7, v8, v9, v10, v11, v12);
  }
}

- (void)stop
{
  id v3;

  if (self->_accConnIdentifier)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](ACCTransportClient, "sharedClient"));
    objc_msgSend(v3, "destroyConnectionWithUUID:", self->_accConnIdentifier);

  }
}

- (void)changeState:(unsigned __int8)a3
{
  NSObject *queue;
  _QWORD block[5];
  id v7;
  id location;

  -[NSLock lock](self->_lock, "lock");
  self->_state = a3;
  self->_pending = 1;
  -[NSLock unlock](self->_lock, "unlock");
  location = 0;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000402A8;
  block[3] = &unk_1000AD208;
  objc_copyWeak(&v7, &location);
  block[4] = self;
  dispatch_async(queue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)setBTAuthState:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  _DWORD v7[2];

  v3 = a3;
  v5 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting auth state (%u)", (uint8_t *)v7, 8u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](ACCTransportClient, "sharedClient"));
  objc_msgSend(v6, "setConnectionAuthenticated:state:", self->_accConnIdentifier, v3);

}

- (void)setPairingData:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  v5 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting pairing data", v7, 2u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportClient sharedClient](ACCTransportClient, "sharedClient"));
  objc_msgSend(v6, "setProperty:value:forConnectionWithUUID:", kACCProperties_Endpoint_OOBPairingData, v4, self->_accConnIdentifier);

}

- (void)blePairing:(id)a3 accessoryAttached:(id)a4 blePairingUUID:(id)a5 accInfoDict:(id)a6 supportedPairTypes:(id)a7
{
  id v8;
  NSObject *v9;
  int v10;
  id v11;

  v8 = a4;
  v9 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Accessory %@ attached to charger", (uint8_t *)&v10, 0xCu);
  }
  -[HIDChargerNotifier changeState:](self, "changeState:", 1);

}

- (void)blePairing:(id)a3 accessoryDetached:(id)a4 blePairingUUID:(id)a5
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;

  v6 = a4;
  v7 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Accessory %@ detached from charger", (uint8_t *)&v8, 0xCu);
  }
  -[HIDChargerNotifier changeState:](self, "changeState:", 0);

}

- (void)blePairingNoAccessories:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  v4 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "No accessories on charger", v5, 2u);
  }
  -[HIDChargerNotifier changeState:](self, "changeState:", 3);
}

- (void)blePairing:(id)a3 pairingFinished:(id)a4 blePairingUUID:(id)a5
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004077C;
  block[3] = &unk_1000AD230;
  block[4] = self;
  dispatch_async(queue, block);
}

- (HIDChargerNotifierDelegate)delegate
{
  return (HIDChargerNotifierDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ACCBLEPairingProvider)pairingProvider
{
  return self->_pairingProvider;
}

- (void)setPairingProvider:(id)a3
{
  objc_storeStrong((id *)&self->_pairingProvider, a3);
}

- (NSBundle)pairingProviderBundle
{
  return self->_pairingProviderBundle;
}

- (void)setPairingProviderBundle:(id)a3
{
  objc_storeStrong((id *)&self->_pairingProviderBundle, a3);
}

- (Class)ACCBLEPairingProvider
{
  return self->_ACCBLEPairingProvider;
}

- (void)setACCBLEPairingProvider:(Class)a3
{
  objc_storeStrong((id *)&self->_ACCBLEPairingProvider, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (unsigned)state
{
  return self->_state;
}

- (void)setState:(unsigned __int8)a3
{
  self->_state = a3;
}

- (BOOL)pending
{
  return self->_pending;
}

- (void)setPending:(BOOL)a3
{
  self->_pending = a3;
}

- (NSString)accConnIdentifier
{
  return self->_accConnIdentifier;
}

- (void)setAccConnIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accConnIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accConnIdentifier, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_ACCBLEPairingProvider, 0);
  objc_storeStrong((id *)&self->_pairingProviderBundle, 0);
  objc_storeStrong((id *)&self->_pairingProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
