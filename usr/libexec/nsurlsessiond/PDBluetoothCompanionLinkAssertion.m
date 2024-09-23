@implementation PDBluetoothCompanionLinkAssertion

- (PDBluetoothCompanionLinkAssertion)init
{
  PDBluetoothCompanionLinkAssertion *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *bluetoothSerialQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PDBluetoothCompanionLinkAssertion;
  v2 = -[PDBluetoothCompanionLinkAssertion init](&v8, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.nsurlsessiond.PDBluetoothCompanionLinkAssertion.bluetoothSerialQueue", v4);
    bluetoothSerialQueue = v2->_bluetoothSerialQueue;
    v2->_bluetoothSerialQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)dealloc
{
  CBScalablePipeManager *pipeManager;
  NSUUID *companionPeerIdentifier;
  NSObject *v5;
  NSObject *v6;
  CBScalablePipeManager *v7;
  objc_super v8;
  uint8_t buf[4];
  PDBluetoothCompanionLinkAssertion *v10;
  __int16 v11;
  void *v12;

  pipeManager = self->_pipeManager;
  if (pipeManager)
  {
    -[CBScalablePipeManager setDelegate:](pipeManager, "setDelegate:", 0);
    companionPeerIdentifier = self->_companionPeerIdentifier;
    if (companionPeerIdentifier && self->_isActive && self->_hasSetLinkRequirements)
    {
      v5 = qword_1000C7120;
      if (os_log_type_enabled((os_log_t)qword_1000C7120, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v10 = self;
        v11 = 2112;
        v12 = companionPeerIdentifier;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Relinquishing link requirements for %@", buf, 0x16u);
        companionPeerIdentifier = self->_companionPeerIdentifier;
      }
      -[CBScalablePipeManager setLinkRequirementsForPeer:packetsPerSecond:inputBytesPerSecond:outputBytesPerSecond:](self->_pipeManager, "setLinkRequirementsForPeer:packetsPerSecond:inputBytesPerSecond:outputBytesPerSecond:", companionPeerIdentifier, 0, 0, 0);
    }
    v6 = qword_1000C7120;
    if (os_log_type_enabled((os_log_t)qword_1000C7120, OS_LOG_TYPE_DEFAULT))
    {
      v7 = self->_pipeManager;
      *(_DWORD *)buf = 138543618;
      v10 = self;
      v11 = 2114;
      v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Releasing %{public}@", buf, 0x16u);
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)PDBluetoothCompanionLinkAssertion;
  -[PDBluetoothCompanionLinkAssertion dealloc](&v8, "dealloc");
}

- (void)acquire
{
  NSObject *bluetoothSerialQueue;
  _QWORD block[5];

  bluetoothSerialQueue = self->_bluetoothSerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025AAC;
  block[3] = &unk_1000B23A0;
  block[4] = self;
  dispatch_async(bluetoothSerialQueue, block);
}

- (void)invalidate
{
  NSObject *bluetoothSerialQueue;
  _QWORD block[5];

  bluetoothSerialQueue = self->_bluetoothSerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000259F4;
  block[3] = &unk_1000B23A0;
  block[4] = self;
  dispatch_async(bluetoothSerialQueue, block);
}

- (void)_updateState
{
  void *v3;
  void *v4;
  NSUUID *v5;
  NSUUID *companionPeerIdentifier;
  CBScalablePipeManager *v7;
  CBScalablePipeManager *pipeManager;
  CBScalablePipeManager *v9;
  CBScalablePipeManager *v10;
  NSUUID *v11;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_bluetoothSerialQueue);
  if (self->_isActive)
  {
    if (!self->_hasLoadedCompanionPeerIdentifier)
    {
      self->_hasLoadedCompanionPeerIdentifier = 1;
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getActivePairedDevice"));
      v5 = (NSUUID *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "deviceIDForNRDevice:", v4));
      companionPeerIdentifier = self->_companionPeerIdentifier;
      self->_companionPeerIdentifier = v5;

    }
    if (self->_companionPeerIdentifier)
    {
      if (!self->_pipeManager)
      {
        v7 = (CBScalablePipeManager *)objc_msgSend(objc_alloc((Class)CBScalablePipeManager), "initWithDelegate:queue:", self, self->_bluetoothSerialQueue);
        pipeManager = self->_pipeManager;
        self->_pipeManager = v7;

      }
      if (!self->_hasSetLinkRequirements && -[CBScalablePipeManager state](self->_pipeManager, "state") == (id)5)
      {
        self->_hasSetLinkRequirements = 1;
        -[CBScalablePipeManager setLinkRequirementsForPeer:packetsPerSecond:inputBytesPerSecond:outputBytesPerSecond:](self->_pipeManager, "setLinkRequirementsForPeer:packetsPerSecond:inputBytesPerSecond:outputBytesPerSecond:", self->_companionPeerIdentifier, 200, 0, 0);
      }
    }
  }
  else
  {
    v9 = self->_pipeManager;
    if (v9)
    {
      -[CBScalablePipeManager setDelegate:](v9, "setDelegate:", 0);
      if (self->_companionPeerIdentifier && self->_hasSetLinkRequirements)
        -[CBScalablePipeManager setLinkRequirementsForPeer:packetsPerSecond:inputBytesPerSecond:outputBytesPerSecond:](self->_pipeManager, "setLinkRequirementsForPeer:packetsPerSecond:inputBytesPerSecond:outputBytesPerSecond:");
      v10 = self->_pipeManager;
      self->_pipeManager = 0;

    }
    v11 = self->_companionPeerIdentifier;
    self->_companionPeerIdentifier = 0;

    self->_hasLoadedCompanionPeerIdentifier = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipeManager, 0);
  objc_storeStrong((id *)&self->_companionPeerIdentifier, 0);
  objc_storeStrong((id *)&self->_bluetoothSerialQueue, 0);
}

@end
