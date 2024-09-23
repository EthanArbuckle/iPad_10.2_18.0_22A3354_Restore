@implementation DMDPayloadActionOperation

+ (id)sharedDeclarationOperationQueue
{
  if (qword_1000EBA08 != -1)
    dispatch_once(&qword_1000EBA08, &stru_1000BBA60);
  return (id)qword_1000EBA00;
}

- (void)dealloc
{
  OS_os_transaction *v3;
  dispatch_time_t v4;
  OS_os_transaction *v5;
  objc_super v6;
  _QWORD block[4];
  OS_os_transaction *v8;

  -[DMDDeviceStateProvider removeObserver:forKeyPath:](self->_deviceStateProvider, "removeObserver:forKeyPath:", self, CFSTR("isNetworkTethered"));
  -[DMDDeviceStateProvider removeObserver:forKeyPath:](self->_deviceStateProvider, "removeObserver:forKeyPath:", self, CFSTR("isKeychainUnlocked"));
  v3 = self->_transaction;
  v4 = dispatch_time(0, 5000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = nullsub_3;
  block[3] = &unk_1000BA4B0;
  v8 = v3;
  v5 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);

  v6.receiver = self;
  v6.super_class = (Class)DMDPayloadActionOperation;
  -[DMDPayloadActionOperation dealloc](&v6, "dealloc");
}

- (DMDPayloadActionOperation)init
{
  DMDPayloadActionOperation *v2;
  DMDPayloadActionOperation *v3;
  id v4;
  uint64_t v5;
  OS_os_transaction *transaction;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DMDPayloadActionOperation;
  v2 = -[DMDPayloadActionOperation init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[DMDPayloadActionOperation description](v2, "description")));
    v5 = os_transaction_create(objc_msgSend(v4, "UTF8String"));
    transaction = v3->_transaction;
    v3->_transaction = (OS_os_transaction *)v5;

  }
  return v3;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isReady
{
  void *v3;
  unsigned int v4;
  void *v5;
  unsigned __int8 v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DMDPayloadActionOperation;
  if (!-[DMDPayloadActionOperation isReady](&v8, "isReady"))
    return 0;
  if (-[DMDPayloadActionOperation requiresUnlockedKeychain](self, "requiresUnlockedKeychain"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPayloadActionOperation deviceStateProvider](self, "deviceStateProvider"));
    v4 = objc_msgSend(v3, "isKeychainUnlocked");

    if (!v4)
      return 0;
  }
  if (!-[DMDPayloadActionOperation requiresNetworkTether](self, "requiresNetworkTether"))
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPayloadActionOperation deviceStateProvider](self, "deviceStateProvider"));
  v6 = objc_msgSend(v5, "isNetworkTethered");

  return v6;
}

- (void)operationWillStart
{
  objc_super v3;

  -[DMDPayloadActionOperation setDeviceStateProvider:](self, "setDeviceStateProvider:", 0);
  v3.receiver = self;
  v3.super_class = (Class)DMDPayloadActionOperation;
  -[DMDPayloadActionOperation operationWillStart](&v3, "operationWillStart");
}

- (void)setDeviceStateProvider:(id)a3
{
  DMDDeviceStateProvider *v4;
  DMDDeviceStateProvider *deviceStateProvider;
  DMDDeviceStateProvider *v6;

  v4 = (DMDDeviceStateProvider *)a3;
  -[DMDDeviceStateProvider removeObserver:forKeyPath:](self->_deviceStateProvider, "removeObserver:forKeyPath:", self, CFSTR("isNetworkTethered"));
  -[DMDDeviceStateProvider removeObserver:forKeyPath:](self->_deviceStateProvider, "removeObserver:forKeyPath:", self, CFSTR("isKeychainUnlocked"));
  deviceStateProvider = self->_deviceStateProvider;
  self->_deviceStateProvider = v4;
  v6 = v4;

  -[DMDDeviceStateProvider addObserver:forKeyPath:options:context:](self->_deviceStateProvider, "addObserver:forKeyPath:options:context:", self, CFSTR("isKeychainUnlocked"), 0, "DMDPayloadActionOperationObservationContext");
  -[DMDDeviceStateProvider addObserver:forKeyPath:options:context:](self->_deviceStateProvider, "addObserver:forKeyPath:options:context:", self, CFSTR("isNetworkTethered"), 0, "DMDPayloadActionOperationObservationContext");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v7;

  if (a6 == "DMDPayloadActionOperationObservationContext")
  {
    -[DMDPayloadActionOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isReady"), a4, a5);
    -[DMDPayloadActionOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isReady"));
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)DMDPayloadActionOperation;
    -[DMDPayloadActionOperation observeValueForKeyPath:ofObject:change:context:](&v7, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (DMDPayloadActionOperation)initWithDatabase:(id)a3 payloadMetadataObjectID:(id)a4 payloadIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  DMDPayloadActionOperation *v12;
  DMDPayloadActionOperation *v13;
  NSManagedObjectID *v14;
  NSManagedObjectID *payloadMetadataObjectID;
  NSString *v16;
  NSString *payloadIdentifier;
  NSMutableDictionary *v18;
  NSMutableDictionary *stateDictionary;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)DMDPayloadActionOperation;
  v12 = -[DMDPayloadActionOperation init](&v21, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_database, a3);
    v14 = (NSManagedObjectID *)objc_msgSend(v10, "copy");
    payloadMetadataObjectID = v13->_payloadMetadataObjectID;
    v13->_payloadMetadataObjectID = v14;

    v16 = (NSString *)objc_msgSend(v11, "copy");
    payloadIdentifier = v13->_payloadIdentifier;
    v13->_payloadIdentifier = v16;

    v18 = objc_opt_new(NSMutableDictionary);
    stateDictionary = v13->_stateDictionary;
    v13->_stateDictionary = v18;

  }
  return v13;
}

- (DMDPayloadContext)payloadContext
{
  DMDPayloadContext *payloadContext;
  DMDPayloadContext *v4;
  DMDPayloadContext *v5;

  payloadContext = self->_payloadContext;
  if (!payloadContext)
  {
    v4 = objc_opt_new(DMDPayloadContext);
    v5 = self->_payloadContext;
    self->_payloadContext = v4;

    payloadContext = self->_payloadContext;
  }
  return payloadContext;
}

- (void)performBackgroundContextBlock:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  if (!v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDPayloadActionOperation.m"), 123, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPayloadActionOperation database](self, "database"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100058DBC;
  v9[3] = &unk_1000BA740;
  v10 = v5;
  v7 = v5;
  objc_msgSend(v6, "performBackgroundTask:", v9);

}

- (void)enqueueOperation:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPayloadActionOperation subOperations](self, "subOperations"));

  if (!v5)
  {
    v6 = objc_opt_new(NSMutableArray);
    -[DMDPayloadActionOperation setSubOperations:](self, "setSubOperations:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPayloadActionOperation subOperations](self, "subOperations"));
  objc_msgSend(v7, "addObject:", v4);

  v8 = objc_msgSend((id)objc_opt_class(self), "sharedDeclarationOperationQueue");
  v9 = (id)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v9, "addOperation:", v4);

}

- (void)addStatusEntriesFromDictionary:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DMDPayloadActionOperation stateDictionary](self, "stateDictionary"));
  objc_msgSend(v5, "addEntriesFromDictionary:", v4);

}

- (void)endOperationMarkingPayloadMetadata:(id)a3 failedWithError:(id)a4
{
  NSString *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3, a4));
  v6 = NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDPayloadActionOperation.m"), 142, CFSTR("%@ must be implemented by subclasses"), v7);

}

- (void)endOperationWithPayloadMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  uint64_t v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPayloadActionOperation stateDictionary](self, "stateDictionary"));
  objc_msgSend(v4, "setStateDictionary:", v5);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "incomingPayloadMetadataReferences"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v12 = objc_opt_class(DMDActivationPayloadMetadata);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
          objc_msgSend(v11, "updateStateDictionaryIfNeeded");
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));
  v16 = 0;
  v14 = objc_msgSend(v13, "save:", &v16);
  v15 = v16;

  if ((v14 & 1) != 0)
    -[DMDPayloadActionOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
  else
    -[DMDPayloadActionOperation endOperationWithError:](self, "endOperationWithError:", v15);

}

- (BOOL)requiresNetworkTether
{
  return self->_requiresNetworkTether;
}

- (void)setRequiresNetworkTether:(BOOL)a3
{
  self->_requiresNetworkTether = a3;
}

- (BOOL)requiresUnlockedKeychain
{
  return self->_requiresUnlockedKeychain;
}

- (void)setRequiresUnlockedKeychain:(BOOL)a3
{
  self->_requiresUnlockedKeychain = a3;
}

- (DMDDeviceStateProvider)deviceStateProvider
{
  return self->_deviceStateProvider;
}

- (DMDTaskOperationProvider)taskOperationProvider
{
  return self->_taskOperationProvider;
}

- (void)setTaskOperationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_taskOperationProvider, a3);
}

- (DMDConfigurationDatabase)database
{
  return self->_database;
}

- (NSManagedObjectID)payloadMetadataObjectID
{
  return self->_payloadMetadataObjectID;
}

- (NSString)payloadIdentifier
{
  return self->_payloadIdentifier;
}

- (void)setPayloadContext:(id)a3
{
  objc_storeStrong((id *)&self->_payloadContext, a3);
}

- (NSMutableArray)subOperations
{
  return self->_subOperations;
}

- (void)setSubOperations:(id)a3
{
  objc_storeStrong((id *)&self->_subOperations, a3);
}

- (NSMutableDictionary)stateDictionary
{
  return self->_stateDictionary;
}

- (void)setStateDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_stateDictionary, a3);
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_stateDictionary, 0);
  objc_storeStrong((id *)&self->_subOperations, 0);
  objc_storeStrong((id *)&self->_payloadContext, 0);
  objc_storeStrong((id *)&self->_payloadIdentifier, 0);
  objc_storeStrong((id *)&self->_payloadMetadataObjectID, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_taskOperationProvider, 0);
  objc_storeStrong((id *)&self->_deviceStateProvider, 0);
}

@end
