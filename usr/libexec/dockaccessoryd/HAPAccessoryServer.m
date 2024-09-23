@implementation HAPAccessoryServer

- (HAPAccessoryServer)init
{
  NSString *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v3));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v4, 0));

  objc_exception_throw(v5);
}

- (HAPAccessoryServer)initWithKeystore:(id)a3
{
  id v4;
  HAPAccessoryServer *v5;
  HAPAccessoryServer *v6;
  const char *v7;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *clientQueue;
  const char *v12;
  dispatch_queue_attr_t v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *internalDelegateQueue;
  uint64_t v17;
  NSHashTable *internalDelegates;
  uint64_t v19;
  NSHashTable *notificationClients;
  NSString *reachabilityChangedReason;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HAPAccessoryServer;
  v5 = -[HAPAccessoryServer init](&v23, "init");
  v6 = v5;
  if (v5)
  {
    v7 = (const char *)sub_100015E90(v5, CFSTR("clientQueue"));
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_create(v7, v9);
    clientQueue = v6->_clientQueue;
    v6->_clientQueue = (OS_dispatch_queue *)v10;

    v12 = (const char *)sub_100015E90(v6, CFSTR("delegateQueue"));
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = dispatch_queue_create(v12, v14);
    internalDelegateQueue = v6->_internalDelegateQueue;
    v6->_internalDelegateQueue = (OS_dispatch_queue *)v15;

    objc_storeWeak((id *)&v6->_keyStore, v4);
    v17 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    internalDelegates = v6->_internalDelegates;
    v6->_internalDelegates = (NSHashTable *)v17;

    *(_WORD *)&v6->_reachable = 1;
    v6->_authMethod = 5;
    v6->_reachabilityPingEnabled = 0;
    v6->_sessionRestoreActive = 0;
    v19 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 0));
    notificationClients = v6->_notificationClients;
    v6->_notificationClients = (NSHashTable *)v19;

    v6->_shouldDisconnectOnIdle = 0;
    v6->_successfulPingCount = 0;
    v6->_failedPingCount = 0;
    v6->_hasAdvertisement = 1;
    reachabilityChangedReason = v6->_reachabilityChangedReason;
    v6->_reachabilityChangedReason = (NSString *)CFSTR("Unknown");

    v6->_supportsUnreachablePing = 0;
  }

  return v6;
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6;
  HAPAccessoryServerDelegate **p_delegate;
  OS_dispatch_queue *v8;
  OS_dispatch_queue *delegateQueue;
  id obj;

  obj = a3;
  v6 = a4;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  p_delegate = &self->_delegate;
  if (obj && v6)
  {
    objc_storeWeak((id *)p_delegate, obj);
    v8 = (OS_dispatch_queue *)v6;
    delegateQueue = self->_delegateQueue;
    self->_delegateQueue = v8;
  }
  else
  {
    objc_storeWeak((id *)p_delegate, 0);
    delegateQueue = self->_delegateQueue;
    self->_delegateQueue = 0;
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (HAPAccessoryServerDelegate)delegate
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return (HAPAccessoryServerDelegate *)WeakRetained;
}

- (OS_dispatch_queue)delegateQueue
{
  os_unfair_lock_s *p_lock;
  OS_dispatch_queue *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  v4 = self->_delegateQueue;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)isReachable
{
  HAPAccessoryServer *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  LOBYTE(v2) = v2->_reachable;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setReachable:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_lock;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  if (self->_reachable == v3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_reachable = v3;
    os_unfair_lock_unlock(p_lock);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer accessories](self, "accessories", 0));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), "setReachable:", v3);
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)setShouldDisconnectOnIdle:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  if (self->_shouldDisconnectOnIdle == v3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_shouldDisconnectOnIdle = v3;
    os_unfair_lock_unlock(p_lock);
    -[HAPAccessoryServer disconnectOnIdleUpdated](self, "disconnectOnIdleUpdated");
  }
}

- (BOOL)shouldDisconnectOnIdle
{
  HAPAccessoryServer *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  LOBYTE(v2) = v2->_shouldDisconnectOnIdle;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setAccessories:(id)a3
{
  NSArray *v4;
  NSArray *accessories;

  v4 = (NSArray *)a3;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  accessories = self->_accessories;
  self->_accessories = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)accessories
{
  os_unfair_lock_s *p_lock;
  id v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  v4 = -[NSArray copy](self->_accessories, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (BOOL)reachabilityPingEnabled
{
  HAPAccessoryServer *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  LOBYTE(v2) = v2->_reachabilityPingEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setReachabilityPingEnabled:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  self->_reachabilityPingEnabled = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isSessionRestoreActive
{
  HAPAccessoryServer *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  LOBYTE(v2) = v2->_sessionRestoreActive;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSessionRestoreActive:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  self->_sessionRestoreActive = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isSecuritySessionOpen
{
  HAPAccessoryServer *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  LOBYTE(v2) = v2->_securitySessionOpen;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSecuritySessionOpen:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  self->_securitySessionOpen = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)pendingRemovePairing
{
  os_unfair_lock_s *p_lock;
  unint64_t pendingRemovePairing;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  pendingRemovePairing = self->_pendingRemovePairing;
  os_unfair_lock_unlock(p_lock);
  return pendingRemovePairing;
}

- (void)setPendingRemovePairing:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  self->_pendingRemovePairing = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)hasPairings
{
  HAPAccessoryServer *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  LOBYTE(v2) = v2->_hasPairings;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setHasPairings:(BOOL)a3
{
  int v3;
  os_unfair_lock_s *p_lock;
  int hasPairings;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  HAPAccessoryServer *v12;
  char v13;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  hasPairings = self->_hasPairings;
  if (hasPairings != v3)
    self->_hasPairings = v3;
  if (self->_pendingRemovePairing)
  {
    self->_pendingRemovePairing = 0;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
    if (hasPairings == v3)
      return;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer delegate](self, "delegate"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer delegateQueue](self, "delegateQueue"));

    if (v8)
    {
      v9 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer delegateQueue](self, "delegateQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100083048;
      block[3] = &unk_100236BE0;
      v11 = v7;
      v12 = self;
      v13 = v3;
      dispatch_async(v9, block);

    }
  }

}

- (HAPDeviceID)deviceID
{
  HAPDeviceID *v3;
  void *v4;
  HAPDeviceID *v5;

  v3 = [HAPDeviceID alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer identifier](self, "identifier"));
  v5 = -[HAPDeviceID initWithDeviceIDString:](v3, "initWithDeviceIDString:", v4);

  return v5;
}

- (NSString)identifier
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  v4 = self->_identifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  v4 = (NSString *)objc_msgSend(v6, "copy");
  identifier = self->_identifier;
  self->_identifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSData)setupHash
{
  os_unfair_lock_s *p_lock;
  NSData *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  v4 = self->_setupHash;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSetupHash:(id)a3
{
  NSData *v4;
  NSData *setupHash;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  v4 = (NSData *)objc_msgSend(v6, "copy");
  setupHash = self->_setupHash;
  self->_setupHash = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (unint64_t)authMethod
{
  os_unfair_lock_s *p_lock;
  unint64_t authMethod;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  authMethod = self->_authMethod;
  os_unfair_lock_unlock(p_lock);
  return authMethod;
}

- (void)setAuthMethod:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  self->_authMethod = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSString)name
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  v4 = self->_name;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setName:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  HAPAccessoryServer *v11;
  id v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "copy");
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  if (-[NSString isEqualToString:](self->_name, "isEqualToString:", v4))
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    objc_storeStrong((id *)&self->_name, v5);
    os_unfair_lock_unlock(&self->_lock);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer delegate](self, "delegate"));
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer delegateQueue](self, "delegateQueue"));

      if (v7)
      {
        v8 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer delegateQueue](self, "delegateQueue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100083494;
        block[3] = &unk_100236EA8;
        v10 = v6;
        v11 = self;
        v12 = v5;
        dispatch_async(v8, block);

      }
    }

  }
}

- (NSNumber)category
{
  os_unfair_lock_s *p_lock;
  NSNumber *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  v4 = self->_category;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setCategory:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  HAPAccessoryServer *v11;
  id v12;

  v5 = a3;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  if ((-[NSNumber isEqual:](self->_category, "isEqual:", v5) & 1) != 0)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    objc_storeStrong((id *)&self->_category, a3);
    os_unfair_lock_unlock(&self->_lock);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer delegate](self, "delegate"));
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer delegateQueue](self, "delegateQueue"));

      if (v7)
      {
        v8 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer delegateQueue](self, "delegateQueue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100083640;
        block[3] = &unk_100236EA8;
        v10 = v6;
        v11 = self;
        v12 = v5;
        dispatch_async(v8, block);

      }
    }

  }
}

- (void)setProductData:(id)a3
{
  NSString *v4;
  NSString *productData;

  v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  productData = self->_productData;
  self->_productData = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)productData
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  v4 = self->_productData;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setConfigNumber:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  self->_configNumber = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)configNumber
{
  os_unfair_lock_s *p_lock;
  unint64_t configNumber;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  configNumber = self->_configNumber;
  os_unfair_lock_unlock(p_lock);
  return configNumber;
}

- (void)setWakeNumber:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  self->_wakeNumber = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)wakeNumber
{
  os_unfair_lock_s *p_lock;
  unint64_t wakeNumber;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  wakeNumber = self->_wakeNumber;
  os_unfair_lock_unlock(p_lock);
  return wakeNumber;
}

- (void)setStateNumber:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  self->_stateNumber = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)stateNumber
{
  os_unfair_lock_s *p_lock;
  unint64_t stateNumber;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  stateNumber = self->_stateNumber;
  os_unfair_lock_unlock(p_lock);
  return stateNumber;
}

- (void)setCompatibilityFeatures:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  self->_compatibilityFeatures = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)compatibilityFeatures
{
  os_unfair_lock_s *p_lock;
  unint64_t compatibilityFeatures;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  compatibilityFeatures = self->_compatibilityFeatures;
  os_unfair_lock_unlock(p_lock);
  return compatibilityFeatures;
}

- (void)setVersion:(id)a3
{
  HMFVersion *v4;
  HMFVersion *version;

  v4 = (HMFVersion *)a3;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  version = self->_version;
  self->_version = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMFVersion)version
{
  os_unfair_lock_s *p_lock;
  id v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  v4 = -[HMFVersion copy](self->_version, "copy");
  os_unfair_lock_unlock(p_lock);
  return (HMFVersion *)v4;
}

- (void)setPairSetupType:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  self->_pairSetupType = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)pairSetupType
{
  os_unfair_lock_s *p_lock;
  unint64_t pairSetupType;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  pairSetupType = self->_pairSetupType;
  os_unfair_lock_unlock(p_lock);
  return pairSetupType;
}

- (int64_t)communicationProtocol
{
  return 1;
}

- (BOOL)hasAdvertisement
{
  HAPAccessoryServer *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  LOBYTE(v2) = v2->_hasAdvertisement;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setHasAdvertisement:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  self->_hasAdvertisement = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSString)reachabilityChangedReason
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  v4 = self->_reachabilityChangedReason;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setReachabilityChangedReason:(id)a3
{
  NSString *v4;
  NSString *reachabilityChangedReason;

  v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  reachabilityChangedReason = self->_reachabilityChangedReason;
  self->_reachabilityChangedReason = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setConnectionStartTime:(id)a3
{
  NSDate *v4;
  NSDate *connectionStartTime;

  v4 = (NSDate *)a3;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  connectionStartTime = self->_connectionStartTime;
  self->_connectionStartTime = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSDate)connectionStartTime
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  v4 = self->_connectionStartTime;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)tryEstablishSecuritySession
{
  NSString *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v3));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v4, 0));

  objc_exception_throw(v5);
}

- (void)writeWithoutResponse:(id)a3 toCharacteristic:(id)a4
{
  id v6;
  id v7;
  NSString *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  v7 = a4;
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v9));
  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v10, 0));

  objc_exception_throw(v11);
}

- (void)writeRawWithResponse:(id)a3 toCharacteristic:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSString *v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = NSStringFromSelector(a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v12));
  v14 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v13, 0));

  objc_exception_throw(v14);
}

- (id)shortDescription
{
  _BOOL4 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = sub_1000160B8();
  v5 = objc_opt_class(self, v4);
  v6 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer identifier](self, "identifier"));
  v7 = (void *)v6;
  if (v3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer name](self, "name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@ %@"), v5, v7, v8));

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v5, v6));
  }

  return v9;
}

- (void)authenticateAccessory
{
  NSString *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v3));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v4, 0));

  objc_exception_throw(v5);
}

- (void)continueAuthAfterValidation:(BOOL)a3
{
  NSString *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v4));
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v5, 0));

  objc_exception_throw(v6);
}

- (void)provisionToken:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v6));
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v7, 0));

  objc_exception_throw(v8);
}

- (void)tearDownSessionOnAuthCompletion
{
  NSString *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v3));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v4, 0));

  objc_exception_throw(v5);
}

- (BOOL)isPaired
{
  NSString *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v3));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v4, 0));

  objc_exception_throw(v5);
}

- (BOOL)matchesSetupID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer setupHash](self, "setupHash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer identifier](self, "identifier"));
  v7 = sub_100015F70(v5, v6, v4);

  return v7;
}

- (BOOL)matchesSetupID:(id)a3 serverIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    if (v7)
      goto LABEL_6;
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  if (!-[HAPAccessoryServer matchesSetupID:](self, "matchesSetupID:", v6))
    goto LABEL_7;
  if (v8)
  {
LABEL_6:
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer identifier](self, "identifier"));
    v9 = HMFEqualObjects(v10, v8);

    goto LABEL_8;
  }
  v9 = 1;
LABEL_8:

  return v9;
}

- (void)continuePairingAfterAuthPrompt
{
  NSString *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v3));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v4, 0));

  objc_exception_throw(v5);
}

- (void)continuePairingUsingWAC
{
  NSString *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v3));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v4, 0));

  objc_exception_throw(v5);
}

- (void)startPairingWithRequest:(id)a3
{
  -[HAPAccessoryServer startPairingWithConsentRequired:config:ownershipToken:](self, "startPairingWithConsentRequired:config:ownershipToken:", 0, 0, 0);
}

- (void)startPairingWithConsentRequired:(BOOL)a3 config:(id)a4 ownershipToken:(id)a5
{
  id v7;
  id v8;
  NSString *v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a4;
  v8 = a5;
  v9 = NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v10));
  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v11, 0));

  objc_exception_throw(v12);
}

- (BOOL)tryPairingPassword:(id)a3 error:(id *)a4
{
  id v5;
  NSString *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v7));
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v8, 0));

  objc_exception_throw(v9);
}

- (BOOL)stopPairingWithError:(id *)a3
{
  NSString *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v4));
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v5, 0));

  objc_exception_throw(v6);
}

- (void)addPairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSString *v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = NSStringFromSelector(a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v12));
  v14 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v13, 0));

  objc_exception_throw(v14);
}

- (void)removePairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSString *v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = NSStringFromSelector(a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v12));
  v14 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v13, 0));

  objc_exception_throw(v14);
}

- (BOOL)removePairingForCurrentControllerOnQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSString *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  v7 = a4;
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v9));
  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v10, 0));

  objc_exception_throw(v11);
}

- (void)listPairingsWithCompletionQueue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSString *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  v7 = a4;
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v9));
  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v10, 0));

  objc_exception_throw(v11);
}

- (void)removePairingIdentifier:(id)a3 pairingPublicKey:(id)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  id v19;
  void ***v20;
  id v21;
  id v22;
  HAPPairingIdentity *v23;
  void **v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  HAPAccessoryServer *v29;
  id v30;
  unsigned __int8 v31;

  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer keyBag](self, "keyBag"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentIdentity"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
  v17 = objc_msgSend(v16, "isEqualToString:", v13);

  v24 = _NSConcreteStackBlock;
  v25 = 3221225472;
  v26 = sub_100084A14;
  v27 = &unk_100238120;
  v29 = self;
  v30 = v11;
  v31 = v17;
  v28 = v10;
  v18 = v11;
  v19 = v10;
  v20 = objc_retainBlock(&v24);
  v21 = objc_alloc((Class)HMFPairingKey);
  v22 = objc_msgSend(v21, "initWithPairingKeyData:", v12, v24, v25, v26, v27);

  v23 = -[HAPPairingIdentity initWithIdentifier:publicKey:privateKey:permissions:]([HAPPairingIdentity alloc], "initWithIdentifier:publicKey:privateKey:permissions:", v13, v22, 0, 0);
  -[HAPAccessoryServer removePairing:completionQueue:completionHandler:](self, "removePairing:completionQueue:completionHandler:", v23, v19, v20);

}

- (void)discoverAccessories
{
  NSString *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v3));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v4, 0));

  objc_exception_throw(v5);
}

- (void)readCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSString *v12;
  void *v13;
  void *v14;
  id v15;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v13));
  v15 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v14, 0));

  objc_exception_throw(v15);
}

- (void)writeCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSString *v12;
  void *v13;
  void *v14;
  id v15;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v13));
  v15 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v14, 0));

  objc_exception_throw(v15);
}

- (void)enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSString *v12;
  void *v13;
  void *v14;
  id v15;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v13));
  v15 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v14, 0));

  objc_exception_throw(v15);
}

- (void)identifyWithCompletion:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v6));
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v7, 0));

  objc_exception_throw(v8);
}

- (void)handleUpdatesForCharacteristics:(id)a3 stateNumber:(id)a4
{
  id v6;
  id v7;
  NSString *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  v7 = a4;
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v9));
  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v10, 0));

  objc_exception_throw(v11);
}

- (BOOL)requiresTimedWrite:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v17;
  HAPAccessoryServer *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  __CFString *v22;
  void *v23;
  id v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];

  v4 = a3;
  if (-[HAPAccessoryServer supportsTimedWrite](self, "supportsTimedWrite"))
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = v4;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    if (v5)
    {
      v6 = v5;
      v25 = v4;
      v7 = 0;
      v8 = 0;
      v9 = *(_QWORD *)v28;
LABEL_4:
      v10 = 0;
      v11 = v7;
      v12 = v8;
      while (1)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "characteristic", v25));

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "service"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "accessory"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "instanceID"));

        if (!v8 || v7 == 0)
          break;
        if ((objc_msgSend(v13, "timedWrite") & 1) != 0
          || (objc_msgSend(v8, "properties") & 0x20) != 0)
        {
          v17 = 1;
LABEL_18:
          v4 = v25;
          goto LABEL_23;
        }
        v10 = (char *)v10 + 1;
        v11 = v7;
        v12 = v8;
        if (v6 == v10)
        {
          v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
          if (v6)
            goto LABEL_4;
          v17 = 0;
          goto LABEL_18;
        }
      }
      v18 = self;
      v20 = sub_10007CCE4((uint64_t)v18, v19);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      v4 = v25;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = sub_10007CD2C(v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        *(_DWORD *)buf = 138543874;
        v32 = v23;
        v33 = 2112;
        v34 = v8;
        v35 = 2112;
        v36 = v7;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to check prepare characteristic write requests for characteristic '%@' with an accessory instance ID of '%@'", buf, 0x20u);

      }
      v17 = 0;
LABEL_23:

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)addInternalDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer internalDelegateQueue](self, "internalDelegateQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100085114;
  v7[3] = &unk_100236AD0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)removeInternalDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer internalDelegateQueue](self, "internalDelegateQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000851EC;
  v7[3] = &unk_100236AD0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)enumerateInternalDelegatesUsingBlock:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer internalDelegateQueue](self, "internalDelegateQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000852C4;
  v7[3] = &unk_1002369C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (BOOL)pingSupported
{
  return 0;
}

- (void)startPing
{
  HAPAccessoryServer *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  __CFString *v6;
  void *v7;
  int v8;
  void *v9;

  v2 = self;
  v4 = sub_10007CCE4((uint64_t)v2, v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = sub_10007CD2C(v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = 138543362;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@Ping called -- NOP", (uint8_t *)&v8, 0xCu);

  }
}

- (void)stopPing
{
  HAPAccessoryServer *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  __CFString *v6;
  void *v7;
  int v8;
  void *v9;

  v2 = self;
  v4 = sub_10007CCE4((uint64_t)v2, v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = sub_10007CD2C(v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = 138543362;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@Stop ping called -- NOP", (uint8_t *)&v8, 0xCu);

  }
}

- (BOOL)isPinging
{
  return 0;
}

- (void)registerForNotifications:(id)a3
{
  id v4;
  NSHashTable *notificationClients;
  HAPAccessoryServer *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  __CFString *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;

  v4 = a3;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  notificationClients = self->_notificationClients;
  if (notificationClients)
  {
    -[NSHashTable addObject:](notificationClients, "addObject:", v4);
    os_unfair_lock_unlock(&self->_lock);
    v6 = self;
    v8 = sub_10007CCE4((uint64_t)v6, v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = sub_10007CD2C(v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = 138543618;
      v13 = v11;
      v14 = 2112;
      v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%{public}@Registering client for accessory server notification %@", (uint8_t *)&v12, 0x16u);

    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (void)unregisterForNotifications:(id)a3
{
  id v4;
  NSHashTable *notificationClients;
  HAPAccessoryServer *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  __CFString *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;

  v4 = a3;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  notificationClients = self->_notificationClients;
  if (notificationClients)
    -[NSHashTable removeObject:](notificationClients, "removeObject:", v4);
  os_unfair_lock_unlock(&self->_lock);
  v6 = self;
  v8 = sub_10007CCE4((uint64_t)v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = sub_10007CD2C(v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = 138543618;
    v13 = v11;
    v14 = 2112;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%{public}@Removing client from accessory server notification %@", (uint8_t *)&v12, 0x16u);

  }
}

- (BOOL)notifyClients:(unint64_t)a3 withDictionary:(id)a4
{
  NSHashTable *notificationClients;
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  __CFString *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  __CFString *v17;
  void *v18;
  id v19;
  __int128 v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  HAPAccessoryServer *v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  __CFString *v29;
  void *v30;
  _BOOL4 v31;
  unsigned int v32;
  __int128 v34;
  HAPAccessoryServer *obj;
  char v37;
  id v38;
  HAPAccessoryServer *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  NSObject *v48;
  __int16 v49;
  void *v50;

  v38 = a4;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  notificationClients = self->_notificationClients;
  if (notificationClients)
  {
    v6 = -[NSHashTable copy](notificationClients, "copy");
    os_unfair_lock_unlock(&self->_lock);
    if (v6)
    {
      v39 = self;
      v8 = sub_10007CCE4((uint64_t)v39, v7);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = sub_10007CD2C(v39);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        v12 = objc_msgSend(v6, "count");
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[HAPNotification typeToString:](HAPNotification, "typeToString:", a3));
        *(_DWORD *)buf = 138543874;
        v46 = v11;
        v47 = 2048;
        v48 = v12;
        v49 = 2112;
        v50 = v13;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%{public}@Notifying %ld clients for %@", buf, 0x20u);

      }
      if (v38)
        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "hmf_numberForKey:", CFSTR("HAPAccessoryInstanceID")));
      else
        v14 = 0;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      obj = (HAPAccessoryServer *)v6;
      v19 = -[HAPAccessoryServer countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (v19)
      {
        v37 = 0;
        v21 = *(_QWORD *)v41;
        *(_QWORD *)&v20 = 138543874;
        v34 = v20;
        do
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(_QWORD *)v41 != v21)
              objc_enumerationMutation(obj);
            v23 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
            if ((objc_opt_respondsToSelector(v23, "hapInstanceId") & 1) != 0)
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "hapInstanceId"));
            else
              v24 = 0;
            v25 = v39;
            v27 = sub_10007CCE4((uint64_t)v25, v26);
            v28 = objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              v29 = sub_10007CD2C(v25);
              v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
              *(_DWORD *)buf = v34;
              v46 = v30;
              v47 = 2112;
              v48 = v14;
              v49 = 2112;
              v50 = v24;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%{public}@Attempt to notify client dictionary instanceID %@ clientInstanceId %@", buf, 0x20u);

            }
            if (v24)
              v31 = v14 != 0;
            else
              v31 = 0;
            if (!v31
              || (v32 = objc_msgSend(v24, "intValue"),
                  v32 == -[NSObject intValue](v14, "intValue")))
            {
              objc_msgSend(v23, "indicateNotificationFromServer:notifyType:withDictionary:", v25, a3, v38, v34);
              v37 = 1;
            }

          }
          v19 = -[HAPAccessoryServer countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        }
        while (v19);
      }
      else
      {
        v37 = 0;
      }

      goto LABEL_33;
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  obj = self;
  v16 = sub_10007CCE4((uint64_t)obj, v15);
  v14 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v17 = sub_10007CD2C(obj);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    *(_DWORD *)buf = 138543362;
    v46 = v18;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%{public}@Notification client does not exist", buf, 0xCu);

  }
  v37 = 0;
LABEL_33:

  return v37 & 1;
}

- (id)buildReachabilityNotificationDictionary:(id)a3 reachable:(BOOL)a4 linkType:(int64_t)a5 withError:(int64_t)a6
{
  _BOOL8 v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[6];
  _QWORD v18[6];

  v8 = a4;
  v17[0] = CFSTR("HAPAccessoryReachable");
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v8));
  v18[0] = v10;
  v18[1] = v9;
  v17[1] = CFSTR("HAPAccessoryInstance");
  v17[2] = CFSTR("HAPAccessoryIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  v18[2] = v11;
  v17[3] = CFSTR("HAPAccessoryLinkType");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a5));
  v18[3] = v12;
  v17[4] = CFSTR("HAPAccessoryInstanceID");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "instanceID"));
  v18[4] = v13;
  v17[5] = CFSTR("HAPAccessoryError");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a6));
  v18[5] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 6));

  return v15;
}

- (void)incrementSuccessfulPing
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  ++self->_successfulPingCount;
  os_unfair_lock_unlock(p_lock);
}

- (void)incrementFailedPing
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  ++self->_failedPingCount;
  os_unfair_lock_unlock(p_lock);
}

- (void)updateAccessoryInfoDictionary:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  void *v7;
  NSNumber *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  if (-[NSArray count](self->_accessories, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_accessories, "objectAtIndexedSubscript:", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "manufacturer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "productData"));
    v8 = self->_category;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firmwareVersion"));

    os_unfair_lock_unlock(p_lock);
    if (v6)
      objc_msgSend(v11, "setObject:forKey:", v6, CFSTR("manufacturer"));
    v10 = v11;
    if (v7)
    {
      objc_msgSend(v11, "setObject:forKey:", v7, CFSTR("product"));
      v10 = v11;
    }
    if (v9)
    {
      objc_msgSend(v11, "setObject:forKey:", v9, CFSTR("firmwareVersion"));
      v10 = v11;
    }
    if (v8)
      objc_msgSend(v10, "setObject:forKey:", v8, CFSTR("category"));
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    v8 = 0;
    v9 = 0;
    v7 = 0;
    v6 = 0;
  }

}

- (void)submitPairVerifyMetricWithError:(id)a3
{
  void *v4;
  HAPMetricsPairVerifyEvent *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  HAPMetricsPairVerifyEvent *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (-[HAPAccessoryServer metric_pairVerifyDurationInMS](self, "metric_pairVerifyDurationInMS"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer metric_pairVerifyReason](self, "metric_pairVerifyReason"));

    if (v4)
    {
      v5 = [HAPMetricsPairVerifyEvent alloc];
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[HAPAccessoryServer linkType](self, "linkType")));
      v7 = -[HAPAccessoryServer metric_pairVerifyDurationInMS](self, "metric_pairVerifyDurationInMS");
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer metric_pairVerifyReason](self, "metric_pairVerifyReason"));
      v9 = -[HAPMetricsPairVerifyEvent initWithAccessory:forLinkType:durationInMS:reason:pvError:](v5, "initWithAccessory:forLinkType:durationInMS:reason:pvError:", self, v6, v7, v8, v11);

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[HAPMetricsDispatcher sharedInstance](HAPMetricsDispatcher, "sharedInstance"));
      objc_msgSend(v10, "submitLogEvent:", v9);

    }
  }
  -[HAPAccessoryServer setMetric_pairVerifyDurationInMS:](self, "setMetric_pairVerifyDurationInMS:", 0);
  -[HAPAccessoryServer setMetric_pairVerifyReason:](self, "setMetric_pairVerifyReason:", 0);

}

- (void)disconnectWithError:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v6));
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v7, 0));

  objc_exception_throw(v8);
}

- (void)disconnect
{
  NSString *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v3));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v4, 0));

  objc_exception_throw(v5);
}

- (id)getControllerUserName
{
  void *v3;
  void *v4;
  id v5;
  HAPAccessoryServer *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  HAPAccessoryServer *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  __CFString *v22;
  void *v23;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer keyBag](self, "keyBag"));

  if (v3
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer keyBag](self, "keyBag")),
        v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentIdentity")),
        v4,
        v5))
  {
    v6 = self;
    v8 = sub_10007CCE4((uint64_t)v6, v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = sub_10007CD2C(v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
      *(_DWORD *)buf = 138543618;
      v28 = v11;
      v29 = 2112;
      v30 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%{public}@Using controller username : %@", buf, 0x16u);

    }
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer keyStore](self, "keyStore"));
    v26 = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer identifier](self, "identifier"));
    v25 = 0;
    objc_msgSend(v14, "getControllerPublicKey:secretKey:username:allowCreation:forAccessory:error:", 0, 0, &v26, 0, v15, &v25);
    v16 = v26;
    v5 = v25;

    if (v5)
      v17 = 0;
    else
      v17 = v16;
    v13 = v17;

    v18 = self;
    v20 = sub_10007CCE4((uint64_t)v18, v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = sub_10007CD2C(v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      *(_DWORD *)buf = 138543618;
      v28 = v23;
      v29 = 2112;
      v30 = v13;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%{public}@Using default controller username : %@", buf, 0x16u);

    }
  }

  return v13;
}

- (void)initializeKeyBagIfNecessary
{
  os_unfair_lock_s *p_lock;
  HAPKeyBag *v4;
  NSString *identifier;
  id WeakRetained;
  HAPKeyBag *v7;
  HAPKeyBag *keyBag;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0);
  if (self->_keyBag)
    goto LABEL_4;
  if (self->_identifier)
  {
    v4 = [HAPKeyBag alloc];
    identifier = self->_identifier;
    WeakRetained = objc_loadWeakRetained((id *)&self->_keyStore);
    v7 = -[HAPKeyBag initWithAccessoryIdentifier:keyStore:](v4, "initWithAccessoryIdentifier:keyStore:", identifier, WeakRetained);
    keyBag = self->_keyBag;
    self->_keyBag = v7;

LABEL_4:
    os_unfair_lock_unlock(p_lock);
    return;
  }
  _HMFPreconditionFailure(CFSTR("_identifier"));
  __break(1u);
}

- (void)refreshKeyBag
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer keyBag](self, "keyBag"));
  objc_msgSend(v2, "refreshKeys");

}

- (BOOL)shouldRetryPVDueToAuthenticationError:(id)a3
{
  id v4;
  unsigned int v5;
  BOOL v6;
  HAPAccessoryServer *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  HAPAccessoryServer *v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  _BOOL4 v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  __CFString *v34;
  void *v35;
  int v36;
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;

  v4 = a3;
  v5 = -[HAPAccessoryServer useHH2](self, "useHH2");
  v6 = 0;
  if (v4 && v5)
  {
    v7 = self;
    v9 = sub_10007CCE4((uint64_t)v7, v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = sub_10007CD2C(v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v36 = 138543618;
      v37 = v12;
      v38 = 2112;
      v39 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@PV failed with error: %@", (uint8_t *)&v36, 0x16u);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

    v16 = objc_opt_class(NSError, v15);
    if ((objc_opt_isKindOfClass(v14, v16) & 1) != 0)
      v17 = v14;
    else
      v17 = 0;
    v18 = v17;

    if (v18
      && (v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "domain")),
          v20 = HMFEqualObjects(v19, NSOSStatusErrorDomain),
          v19,
          v20)
      && objc_msgSend(v18, "code") == (id)-6754)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer identifier](v7, "identifier"));
      -[HAPAccessoryServer disassociateAccessoryWithControllerKeyUsingAccessoryIdentifier:](v7, "disassociateAccessoryWithControllerKeyUsingAccessoryIdentifier:", v21);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer keyBag](v7, "keyBag"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "nextIdentity"));

      v6 = v23 != 0;
      v24 = v7;
      v26 = sub_10007CCE4((uint64_t)v24, v25);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      v28 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);
      if (v23)
      {
        if (v28)
        {
          v29 = sub_10007CD2C(v24);
          v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer keyBag](v24, "keyBag"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v31, "getCurrentIndexInBag")));
          v36 = 138543874;
          v37 = v30;
          v38 = 2112;
          v39 = v32;
          v40 = 2112;
          v41 = v23;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%{public}@Going to retry PV with next pairing Identity [%@]: %@", (uint8_t *)&v36, 0x20u);

        }
      }
      else
      {
        if (v28)
        {
          v34 = sub_10007CD2C(v24);
          v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
          v36 = 138543362;
          v37 = v35;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%{public}@Not retrying PV as exhausted all the keys from the key bag.", (uint8_t *)&v36, 0xCu);

        }
        -[HAPAccessoryServer refreshKeyBag](v24, "refreshKeyBag");
      }

    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (BOOL)isAccessoryAssociatedWithControllerKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  unsigned __int8 v9;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer keyStore](self, "keyStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer identifier](self, "identifier"));
  v11 = 0;
  v7 = objc_msgSend(v5, "isAccessoryAssociatedWithControllerKey:controllerID:", v6, &v11);
  v8 = v11;

  if (v7)
    v9 = objc_msgSend(v4, "isEqualToString:", v8);
  else
    v9 = 0;

  return v9;
}

- (void)associateAccessoryWithControllerKey:(id)a3 usingAccessoryPublicKey:(id)a4
{
  HAPPairingIdentity *v6;
  id v7;
  HAPAccessoryServer *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  __CFString *v12;
  void *v13;
  HAPPairingIdentity *v14;
  void *v15;
  id v16;
  HAPPairingIdentity *v17;
  void *v18;
  unsigned int v19;
  id v20;
  void *v21;
  HAPAccessoryServer *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  __CFString *v26;
  void *v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  HAPPairingIdentity *v32;

  v6 = (HAPPairingIdentity *)a3;
  v7 = a4;
  if (-[HAPAccessoryServer useHH2](self, "useHH2"))
  {
    -[HAPAccessoryServer initializeKeyBagIfNecessary](self, "initializeKeyBagIfNecessary");
    v8 = self;
    v10 = sub_10007CCE4((uint64_t)v8, v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = sub_10007CD2C(v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 138543618;
      v30 = v13;
      v31 = 2112;
      v32 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}@Establishing relationship with controller key: [%@]", buf, 0x16u);

    }
    v14 = [HAPPairingIdentity alloc];
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer identifier](v8, "identifier"));
    v16 = objc_msgSend(objc_alloc((Class)HMFPairingKey), "initWithPairingKeyData:", v7);
    v17 = -[HAPPairingIdentity initWithIdentifier:controllerKeyIdentifier:publicKey:privateKey:permissions:](v14, "initWithIdentifier:controllerKeyIdentifier:publicKey:privateKey:permissions:", v15, v6, v16, 0, 0);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer keyStore](v8, "keyStore"));
    v28 = 0;
    v19 = objc_msgSend(v18, "establishRelationshipBetweenAccessoryAndControllerKey:error:", v17, &v28);
    v20 = v28;

    if (!v19 || v20)
    {
      v22 = v8;
      v24 = sub_10007CCE4((uint64_t)v22, v23);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = sub_10007CD2C(v22);
        v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        *(_DWORD *)buf = 138543618;
        v30 = v27;
        v31 = 2112;
        v32 = v17;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%{public}@Unable to save the accessory public key inside KeyChain: %@", buf, 0x16u);

      }
    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer pairingRequest](v8, "pairingRequest"));

      if (v21)
        -[HAPAccessoryServer refreshKeyBag](v8, "refreshKeyBag");
    }

  }
}

- (void)associateAccessoryWithControllerKeyUsingAccessoryPublicKey:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[HAPAccessoryServer useHH2](self, "useHH2"))
  {
    -[HAPAccessoryServer initializeKeyBagIfNecessary](self, "initializeKeyBagIfNecessary");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer pairingRequest](self, "pairingRequest"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pairingIdentity"));
    if (v5)
    {
      v6 = (void *)v5;

LABEL_5:
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
      -[HAPAccessoryServer associateAccessoryWithControllerKey:usingAccessoryPublicKey:](self, "associateAccessoryWithControllerKey:usingAccessoryPublicKey:", v8, v9);

      goto LABEL_6;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer keyBag](self, "keyBag"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentIdentity"));

    if (v6)
      goto LABEL_5;
  }
LABEL_6:

}

- (void)associateAccessoryWithControllerKeyUsingAccessoryIdentifier:(id)a3
{
  id v4;
  HAPAccessoryServer *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  id v19;
  HAPAccessoryServer *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  __CFString *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;

  v4 = a3;
  if (-[HAPAccessoryServer useHH2](self, "useHH2"))
  {
    -[HAPAccessoryServer initializeKeyBagIfNecessary](self, "initializeKeyBagIfNecessary");
    v5 = self;
    v7 = sub_10007CCE4((uint64_t)v5, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = sub_10007CD2C(v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer keyBag](v5, "keyBag"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentIdentity"));
      *(_DWORD *)buf = 138543618;
      v28 = v10;
      v29 = 2112;
      v30 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@PV Succeeded using [%@]", buf, 0x16u);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer keyBag](v5, "keyBag"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "currentIdentity"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
    v16 = -[HAPAccessoryServer isAccessoryAssociatedWithControllerKey:](v5, "isAccessoryAssociatedWithControllerKey:", v15);

    if ((v16 & 1) == 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer keyStore](v5, "keyStore"));
      v26 = 0;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "readPublicKeyForAccessoryName:registeredWithHomeKit:error:", v4, 0, &v26));
      v19 = v26;

      if (!v18 || v19)
      {
        v20 = v5;
        v22 = sub_10007CCE4((uint64_t)v20, v21);
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = sub_10007CD2C(v20);
          v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
          *(_DWORD *)buf = 138543618;
          v28 = v25;
          v29 = 2112;
          v30 = v19;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch accessory public key for accessory with error: %@", buf, 0x16u);

        }
      }
      else
      {
        -[HAPAccessoryServer associateAccessoryWithControllerKeyUsingAccessoryPublicKey:](v5, "associateAccessoryWithControllerKeyUsingAccessoryPublicKey:", v18);
      }

    }
  }

}

- (void)disassociateAccessoryWithControllerKeyUsingAccessoryIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  id v11;
  HAPAccessoryServer *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  __CFString *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;

  v4 = a3;
  if (-[HAPAccessoryServer useHH2](self, "useHH2"))
  {
    -[HAPAccessoryServer initializeKeyBagIfNecessary](self, "initializeKeyBagIfNecessary");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer keyBag](self, "keyBag"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentIdentity"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v8 = -[HAPAccessoryServer isAccessoryAssociatedWithControllerKey:](self, "isAccessoryAssociatedWithControllerKey:", v7);

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer keyStore](self, "keyStore"));
      v18 = 0;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "readPublicKeyForAccessoryName:registeredWithHomeKit:error:", v4, 0, &v18));
      v11 = v18;

      if (!v10 || v11)
      {
        v12 = self;
        v14 = sub_10007CCE4((uint64_t)v12, v13);
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = sub_10007CD2C(v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          *(_DWORD *)buf = 138543618;
          v20 = v17;
          v21 = 2112;
          v22 = v11;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@Unable to fetch accessory public key for accessory with error: %@", buf, 0x16u);

        }
      }
      else
      {
        -[HAPAccessoryServer associateAccessoryWithControllerKey:usingAccessoryPublicKey:](self, "associateAccessoryWithControllerKey:usingAccessoryPublicKey:", 0, v10);
        -[HAPAccessoryServer refreshKeyBag](self, "refreshKeyBag");
      }

    }
  }

}

- (void)securitySessionWillCloseWithResponseData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  HAPAccessoryServer *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  __CFString *v16;
  void *v17;
  id v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;

  v6 = a3;
  v7 = v6;
  if (a4 && objc_msgSend(v6, "length"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a4, "domain"));
    if (!objc_msgSend(v8, "isEqualToString:", NSOSStatusErrorDomain))
    {
LABEL_13:

      goto LABEL_14;
    }
    v9 = objc_msgSend(*a4, "code");

    if (v9 == (id)-6727)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[HAPTLVParser parserWithData:](HAPTLVParser, "parserWithData:", v7));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "parseResponseForNumber:", 6));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "parseResponseForNumber:", 7));
      if ((!v10 || objc_msgSend(v10, "unsignedIntValue") == 4)
        && (objc_msgSend(v11, "unsignedIntValue") == 2
         || objc_msgSend(v11, "unsignedIntValue") == 1))
      {
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithOSStatus:](NSError, "errorWithOSStatus:", 4294960542));
        v12 = self;
        v14 = sub_10007CCE4((uint64_t)v12, v13);
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v16 = sub_10007CD2C(v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          v18 = *a4;
          v19 = 138543618;
          v20 = v17;
          v21 = 2112;
          v22 = v18;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%{public}@Overwriting the security session error code: %@", (uint8_t *)&v19, 0x16u);

        }
      }

      goto LABEL_13;
    }
  }
LABEL_14:

}

- (BOOL)useHH2
{
  return -[HAPAccessoryServer unitTest_useHH2](self, "unitTest_useHH2");
}

- (NSHashTable)notificationClients
{
  return self->_notificationClients;
}

- (void)setNotificationClients:(id)a3
{
  objc_storeStrong((id *)&self->_notificationClients, a3);
}

- (int)successfulPingCount
{
  return self->_successfulPingCount;
}

- (void)setSuccessfulPingCount:(int)a3
{
  self->_successfulPingCount = a3;
}

- (int)failedPingCount
{
  return self->_failedPingCount;
}

- (void)setFailedPingCount:(int)a3
{
  self->_failedPingCount = a3;
}

- (BOOL)supportsUnreachablePing
{
  return self->_supportsUnreachablePing;
}

- (void)setSupportsUnreachablePing:(BOOL)a3
{
  self->_supportsUnreachablePing = a3;
}

- (HAPAccessory)primaryAccessory
{
  return self->_primaryAccessory;
}

- (void)setPrimaryAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_primaryAccessory, a3);
}

- (int64_t)linkType
{
  return self->_linkType;
}

- (BOOL)supportsTimedWrite
{
  return self->_supportsTimedWrite;
}

- (void)setSupportsTimedWrite:(BOOL)a3
{
  self->_supportsTimedWrite = a3;
}

- (BOOL)isBLELinkConnected
{
  return self->_bleLinkConnected;
}

- (NSHashTable)internalDelegates
{
  return self->_internalDelegates;
}

- (OS_dispatch_queue)internalDelegateQueue
{
  return self->_internalDelegateQueue;
}

- (BOOL)unitTest_useHH2
{
  return self->_unitTest_useHH2;
}

- (void)setUnitTest_useHH2:(BOOL)a3
{
  self->_unitTest_useHH2 = a3;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (HAPSuspendedAccessory)suspendedAccessory
{
  return self->_suspendedAccessory;
}

- (BOOL)isIncompatibleUpdate
{
  return self->_incompatibleUpdate;
}

- (void)setIncompatibleUpdate:(BOOL)a3
{
  self->_incompatibleUpdate = a3;
}

- (HAPKeyStore)keyStore
{
  return (HAPKeyStore *)objc_loadWeakRetained((id *)&self->_keyStore);
}

- (HAPKeyBag)keyBag
{
  return self->_keyBag;
}

- (void)setKeyBag:(id)a3
{
  objc_storeStrong((id *)&self->_keyBag, a3);
}

- (HAPAccessoryPairingRequest)pairingRequest
{
  return self->_pairingRequest;
}

- (void)setPairingRequest:(id)a3
{
  objc_storeStrong((id *)&self->_pairingRequest, a3);
}

- (HMFActivity)pairingActivity
{
  return (HMFActivity *)objc_loadWeakRetained((id *)&self->_pairingActivity);
}

- (void)setPairingActivity:(id)a3
{
  objc_storeWeak((id *)&self->_pairingActivity, a3);
}

- (unint64_t)metric_pairVerifyDurationInMS
{
  return self->_metric_pairVerifyDurationInMS;
}

- (void)setMetric_pairVerifyDurationInMS:(unint64_t)a3
{
  self->_metric_pairVerifyDurationInMS = a3;
}

- (NSString)metric_pairVerifyReason
{
  return self->_metric_pairVerifyReason;
}

- (void)setMetric_pairVerifyReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metric_pairVerifyReason, 0);
  objc_destroyWeak((id *)&self->_pairingActivity);
  objc_storeStrong((id *)&self->_pairingRequest, 0);
  objc_storeStrong((id *)&self->_keyBag, 0);
  objc_destroyWeak((id *)&self->_keyStore);
  objc_storeStrong((id *)&self->_suspendedAccessory, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_internalDelegateQueue, 0);
  objc_storeStrong((id *)&self->_internalDelegates, 0);
  objc_storeStrong((id *)&self->_primaryAccessory, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_connectionStartTime, 0);
  objc_storeStrong((id *)&self->_reachabilityChangedReason, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_notificationClients, 0);
  objc_storeStrong((id *)&self->_productData, 0);
  objc_storeStrong((id *)&self->_setupHash, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
