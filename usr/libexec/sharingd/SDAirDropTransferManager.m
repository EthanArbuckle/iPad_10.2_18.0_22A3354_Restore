@implementation SDAirDropTransferManager

- (SDAirDropTransferManager)init
{
  SDAirDropTransferManager *v2;
  NSString *v3;
  void *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  NSArray *kvoObservingKeys;
  NSMutableDictionary *v9;
  NSMutableDictionary *transferIdentifierToTransfer;
  NSMutableDictionary *v11;
  NSMutableDictionary *transferIdentifierToHandler;
  objc_super v14;
  _QWORD v15[2];

  v14.receiver = self;
  v14.super_class = (Class)SDAirDropTransferManager;
  v2 = -[SDXPCDaemon init](&v14, "init");
  if (v2)
  {
    v3 = NSStringFromSelector("userResponse");
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v15[0] = v4;
    v5 = NSStringFromSelector("needsAction");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v15[1] = v6;
    v7 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
    kvoObservingKeys = v2->_kvoObservingKeys;
    v2->_kvoObservingKeys = (NSArray *)v7;

    v9 = objc_opt_new(NSMutableDictionary);
    transferIdentifierToTransfer = v2->_transferIdentifierToTransfer;
    v2->_transferIdentifierToTransfer = v9;

    v11 = objc_opt_new(NSMutableDictionary);
    transferIdentifierToHandler = v2->_transferIdentifierToHandler;
    v2->_transferIdentifierToHandler = v11;

    -[SDAirDropTransferManager loadAllPersistedTransfers](v2, "loadAllPersistedTransfers");
  }
  return v2;
}

- (void)activate
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SDAirDropTransferManager;
  -[SDXPCDaemon _activate](&v2, "_activate");
}

- (void)invalidate
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SDAirDropTransferManager;
  -[SDXPCDaemon _invalidate](&v2, "_invalidate");
}

- (void)_remoteObjectProxyForConnection:(id)a3 usingBlock:(id)a4
{
  -[SDXPCDaemon remoteObjectProxyForConnection:usingBlock:](self, "remoteObjectProxyForConnection:usingBlock:", a3, a4);
}

- (void)_enumerateRemoteObjectProxiesUsingBlock:(id)a3
{
  -[SDXPCDaemon enumerateRemoteObjectProxiesUsingBlock:](self, "enumerateRemoteObjectProxiesUsingBlock:", a3);
}

- (void)notifyObserversOfUpdatedTransfer:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000830A4;
    v6[3] = &unk_100715CB8;
    v7 = v4;
    -[SDAirDropTransferManager _enumerateRemoteObjectProxiesUsingBlock:](self, "_enumerateRemoteObjectProxiesUsingBlock:", v6);

  }
}

- (void)notifyObserversOfRemovedTransfer:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10008312C;
  v5[3] = &unk_100715CB8;
  v6 = objc_msgSend(a3, "copy");
  v4 = v6;
  -[SDAirDropTransferManager _enumerateRemoteObjectProxiesUsingBlock:](self, "_enumerateRemoteObjectProxiesUsingBlock:", v5);

}

- (void)removeTransfer:(id)a3 shouldCleanup:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;

  v4 = a4;
  v6 = a3;
  v7 = airdrop_log(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v15 = 138412290;
    v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Removing transfer with id %@", (uint8_t *)&v15, 0xCu);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager transferIdentifierToHandler](self, "transferIdentifierToHandler"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager transferIdentifierToTransfer](self, "transferIdentifierToTransfer"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager kvoObservingKeys](self, "kvoObservingKeys"));
  objc_msgSend(v6, "removeObserver:forKeyPaths:context:", self, v14, off_1007B0D28);

  -[SDAirDropTransferManager notifyObserversOfRemovedTransfer:](self, "notifyObserversOfRemovedTransfer:", v6);
  if (v4)
    -[SDAirDropTransferManager cleanUpTransfer:](self, "cleanUpTransfer:", v6);

}

- (void)cleanUpTransfer:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v4 = a3;
  v5 = airdrop_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v9 = 138412290;
    v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Cleaning up transfer with id %@", (uint8_t *)&v9, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDAirDropHandler transferURLForTransfer:](SDAirDropHandler, "transferURLForTransfer:", v4));
  -[SDAirDropTransferManager cleanUpURL:](self, "cleanUpURL:", v8);

}

- (void)askEventForRecordID:(id)a3 withResults:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  char isKindOfClass;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  int v29;
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(objc_alloc((Class)SFAirDropTransfer), "initWithIdentifier:initialInformation:", v6, v7);
  objc_msgSend(v8, "updateWithInformation:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager itemTypesForTransfer:](self, "itemTypesForTransfer:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "metaData"));
  objc_msgSend(v10, "setItems:", v9);

  v12 = airdrop_log(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "metaData"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "items"));
    v29 = 138543874;
    v30 = v14;
    v31 = 2112;
    v32 = v8;
    v33 = 2112;
    v34 = v16;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[Transfer: %{public}@]: New incoming transfer %@ with items: %@", (uint8_t *)&v29, 0x20u);

  }
  v17 = +[SFAirDropTransferTestingSnapshot writeSnapshotForTransfer:initialInfo:name:error:](SFAirDropTransferTestingSnapshot, "writeSnapshotForTransfer:initialInfo:name:error:", v8, v7, CFSTR("before_handler"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager transferIdentifierToTransfer](self, "transferIdentifierToTransfer"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v8, v6);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDAirDropHandlerFactory handlerForTransfer:](SDAirDropHandlerFactory, "handlerForTransfer:", v8));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager kvoObservingKeys](self, "kvoObservingKeys"));
  objc_msgSend(v8, "addObserver:forKeyPaths:options:context:", self, v20, 0, off_1007B0D28);

  if (v19)
  {
    -[SDAirDropTransferManager setHandler:forTransfer:](self, "setHandler:forTransfer:", v19, v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "metaData"));
    if (objc_msgSend(v21, "canAutoAccept"))
    {
      v23 = objc_opt_class(SDAirDropHandlerUnsupportedType, v22);
      isKindOfClass = objc_opt_isKindOfClass(v19, v23);

      if ((isKindOfClass & 1) == 0)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "metaData"));
        objc_msgSend(v25, "setDidAutoAccept:", 1);

        -[SDAirDropTransferManager setTransferState:forTransfer:shouldNotify:](self, "setTransferState:forTransfer:shouldNotify:", 1, v8, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "possibleActions"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "firstObject"));
        -[SDAirDropTransferManager transfer:actionTriggeredForAction:](self, "transfer:actionTriggeredForAction:", v8, v27);

LABEL_10:
        v28 = +[SFAirDropTransferTestingSnapshot writeSnapshotForTransfer:initialInfo:name:error:](SFAirDropTransferTestingSnapshot, "writeSnapshotForTransfer:initialInfo:name:error:", v8, v7, CFSTR("after_handler"), 0);
        goto LABEL_11;
      }
    }
    else
    {

    }
    -[SDAirDropTransferManager setTransferState:forTransfer:shouldNotify:](self, "setTransferState:forTransfer:shouldNotify:", 1, v8, 1);
    goto LABEL_10;
  }
  -[SDAirDropTransferManager failTransfer:withState:failureReason:](self, "failTransfer:withState:failureReason:", v8, 9, 2);
LABEL_11:

}

- (void)progressEventForRecordID:(id)a3 withResults:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager transferIdentifierToTransfer](self, "transferIdentifierToTransfer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v6));

  if (v9)
  {
    objc_msgSend(v9, "updateWithInformation:", v7);
    if (objc_msgSend(v9, "transferState") == (id)1)
      -[SDAirDropTransferManager setTransferState:forTransfer:shouldNotify:](self, "setTransferState:forTransfer:shouldNotify:", 2, v9, 1);
  }
  else
  {
    v11 = airdrop_log(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100085494();

  }
}

- (void)cancelEventForRecordID:(id)a3 withResults:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager transferIdentifierToTransfer](self, "transferIdentifierToTransfer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v6));

  if (v9)
  {
    objc_msgSend(v9, "updateWithInformation:", v7);
    -[SDAirDropTransferManager failTransfer:withState:failureReason:](self, "failTransfer:withState:failureReason:", v9, 3, 1);
  }
  else
  {
    v11 = airdrop_log(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1000854F4();

  }
}

- (void)errorEventForRecordID:(id)a3 withResults:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager transferIdentifierToTransfer](self, "transferIdentifierToTransfer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v6));

  v11 = airdrop_log(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
  if (v9)
  {
    if (v13)
      sub_1000855B4();

    objc_msgSend(v9, "updateWithInformation:", v7);
    -[SDAirDropTransferManager failTransfer:withState:failureReason:](self, "failTransfer:withState:failureReason:", v9, 9, 1);
  }
  else
  {
    if (v13)
      sub_100085554();

  }
}

- (void)finishedEventForRecordID:(id)a3 withResults:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager transferIdentifierToTransfer](self, "transferIdentifierToTransfer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v6));

  if (v9)
  {
    objc_msgSend(v9, "updateWithInformation:", v7);
    -[SDAirDropTransferManager setTransferState:forTransfer:shouldNotify:](self, "setTransferState:forTransfer:shouldNotify:", 4, v9, 1);
  }
  else
  {
    v11 = airdrop_log(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10008564C();

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  NSString *v14;
  void *v15;
  unsigned int v16;
  NSString *v17;
  void *v18;
  unsigned int v19;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (off_1007B0D28 == a6)
  {
    v13 = v11;
    v14 = NSStringFromSelector("userResponse");
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = objc_msgSend(v10, "isEqual:", v15);

    if (v16)
    {
      -[SDAirDropTransferManager transferUserResponseUpdated:](self, "transferUserResponseUpdated:", v13);
    }
    else
    {
      v17 = NSStringFromSelector("needsAction");
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = objc_msgSend(v10, "isEqual:", v18);

      if (v19)
        -[SDAirDropTransferManager notifyObserversOfUpdatedTransfer:](self, "notifyObserversOfUpdatedTransfer:", v13);
    }

  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)SDAirDropTransferManager;
    -[SDAirDropTransferManager observeValueForKeyPath:ofObject:change:context:](&v20, "observeValueForKeyPath:ofObject:change:context:", v10, v11, a5, a6);
  }

}

- (void)transferUserResponseUpdated:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  unsigned int v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;

  v4 = a3;
  v5 = objc_msgSend(v4, "userResponse");
  v6 = airdrop_log(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = SFAirDropTransferUserResponseToString(v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    *(_DWORD *)buf = 138412546;
    v36 = v9;
    v37 = 2112;
    v38 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "User response: %@ for transfer with id %@", buf, 0x16u);

  }
  switch((unint64_t)v5)
  {
    case 0uLL:
      break;
    case 1uLL:
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager transferIdentifierToHandler](self, "transferIdentifierToHandler"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v13));

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "customDestinationURL"));
      if ((objc_opt_respondsToSelector(v14, "shouldExtractMediaFromPhotosBundles") & 1) != 0)
        v16 = objc_msgSend(v14, "shouldExtractMediaFromPhotosBundles");
      else
        v16 = 0;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager delegate](self, "delegate"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
      objc_msgSend(v23, "alertManager:acceptingTransferWithRecordID:withDestinationURL:shouldExtractMediaFromPhotosBundlesForRecordID:", self, v24, v15, v16);

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager classroomDelegate](self, "classroomDelegate"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
      objc_msgSend(v25, "alertManager:acceptingTransferWithRecordID:withDestinationURL:shouldExtractMediaFromPhotosBundlesForRecordID:", self, v26, v15, v16);

      -[SDAirDropTransferManager notifyObserversOfUpdatedTransfer:](self, "notifyObserversOfUpdatedTransfer:", v4);
      break;
    case 2uLL:
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager delegate](self, "delegate"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
      objc_msgSend(v19, "alertManager:cancelingTransferWithRecordID:withFailureReason:", self, v20, objc_msgSend(v4, "failureReason"));

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager classroomDelegate](self, "classroomDelegate"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
      objc_msgSend(v21, "alertManager:cancelingTransferWithRecordID:withFailureReason:", self, v22, objc_msgSend(v4, "failureReason"));

      -[SDAirDropTransferManager removeTransfer:shouldCleanup:](self, "removeTransfer:shouldCleanup:", v4, 1);
      break;
    case 3uLL:
      if (objc_msgSend(v4, "transferState") == (id)7)
        -[SDAirDropTransferManager setTransferState:forTransfer:shouldNotify:shouldCleanup:](self, "setTransferState:forTransfer:shouldNotify:shouldCleanup:", 8, v4, 1, 1);
      break;
    default:
      v17 = airdrop_log(v11);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_1000856AC(v18);

      break;
  }
  v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metaData"));
  if (v27)
  {
    v28 = (void *)v27;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "metaData"));
    v30 = objc_msgSend(v29, "transferTypes");

    if ((v30 & 0x40000) != 0)
    {
      if (objc_msgSend(v4, "userResponse"))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "userResponse", CFSTR("response"))));
        v34 = v31;
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));

        SFMetricsLog(CFSTR("com.apple.sharing.AirDropCredentialResponse"), v32);
      }
    }
  }

}

- (void)transfer:(id)a3 actionTriggeredForAction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager transferIdentifierToHandler](self, "transferIdentifierToHandler"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v9));

  if (v10)
  {
    objc_msgSend(v10, "actionSelected:", v7);
  }
  else
  {
    v12 = airdrop_log(v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000856EC();

  }
}

- (id)machServiceName
{
  return CFSTR("com.apple.sharing.transfer-observer");
}

- (id)exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SDAirDropTransferManagerProtocol);
}

- (id)remoteObjectInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SFAirDropTransferObserverProtocol);
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  return 1;
}

- (void)connectionEstablished:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  void *v10;

  v4 = a3;
  v5 = airdrop_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sd_description"));
    *(_DWORD *)buf = 138412290;
    v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "New connection established %@", buf, 0xCu);

  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10008411C;
  v8[3] = &unk_100715CE0;
  v8[4] = self;
  -[SDAirDropTransferManager _remoteObjectProxyForConnection:usingBlock:](self, "_remoteObjectProxyForConnection:usingBlock:", v4, v8);

}

- (void)connectionInvalidated:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = a3;
  v4 = airdrop_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sd_description"));
    v7 = 138412290;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Connection invalidated %@", (uint8_t *)&v7, 0xCu);

  }
}

- (void)setHandler:(id)a3 forTransfer:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t, char, char, char);
  void *v22;
  SDAirDropTransferManager *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;

  v6 = a3;
  v7 = a4;
  v8 = airdrop_log(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    v12 = (objc_class *)objc_opt_class(v6, v11);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    *(_DWORD *)buf = 138543618;
    v28 = v10;
    v29 = 2112;
    v30 = v14;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[Transfer: %{public}@] Setting handler of class %@", buf, 0x16u);

  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000844CC;
  v25[3] = &unk_100715D30;
  v25[4] = self;
  v15 = v7;
  v26 = v15;
  objc_msgSend(v6, "setUpdateTransferStateHandler:", v25);
  v19 = _NSConcreteStackBlock;
  v20 = 3221225472;
  v21 = sub_100084578;
  v22 = &unk_100715DA8;
  v23 = self;
  v24 = v15;
  v16 = v15;
  objc_msgSend(v6, "setCompletionHandler:", &v19);
  objc_msgSend(v6, "activate", v19, v20, v21, v22, v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager transferIdentifierToHandler](self, "transferIdentifierToHandler"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v6, v18);

}

- (void)handlerFailedForTransfer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  SDAirDropHandleriCloudDrive *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager transferIdentifierToHandler](self, "transferIdentifierToHandler"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));

  v9 = airdrop_log(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_100085768((uint64_t)v7, v4);

  v11 = -[SDAirDropHandleriCloudDrive initWithTransfer:]([SDAirDropHandleriCloudDrive alloc], "initWithTransfer:", v4);
  v13 = objc_opt_class(SDAirDropHandleriCloudDrive, v12);
  if ((objc_opt_isKindOfClass(v7, v13) & 1) != 0
    || !-[SDAirDropHandleriCloudDrive canHandleTransfer](v11, "canHandleTransfer"))
  {
    -[SDAirDropTransferManager failTransfer:withState:failureReason:](self, "failTransfer:withState:failureReason:", v4, 9, 3);
  }
  else
  {
    -[SDAirDropTransferManager setHandler:forTransfer:](self, "setHandler:forTransfer:", v11, v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager transferIdentifierToHandler](self, "transferIdentifierToHandler"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v15));
    objc_msgSend(v16, "transferUpdated");

    -[SDAirDropTransferManager notifyObserversOfUpdatedTransfer:](self, "notifyObserversOfUpdatedTransfer:", v4);
  }

}

- (void)failTransfer:(id)a3 withState:(unint64_t)a4 failureReason:(unint64_t)a5
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  __objc2_class **v16;
  id v17;

  v9 = a3;
  v10 = v9;
  if (a4 != 3 && a4 != 9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v12 = SFAirDropTransferStateToString(a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SDAirDropTransferManager.m"), 364, CFSTR("Failing transfer with invalid state: %@"), v13);

  }
  v14 = airdrop_log(v9);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    sub_1000857FC();

  objc_msgSend(v10, "setFailureReason:", a5);
  v16 = off_100711298;
  if (a5 != 2)
    v16 = off_100711290;
  v17 = objc_msgSend(objc_alloc(*v16), "initWithTransfer:", v10);
  -[SDAirDropTransferManager setHandler:forTransfer:](self, "setHandler:forTransfer:", v17, v10);
  objc_msgSend(v17, "setCompletionHandler:", &stru_100715DE8);
  -[SDAirDropTransferManager setTransferState:forTransfer:shouldNotify:](self, "setTransferState:forTransfer:shouldNotify:", a4, v10, 1);

}

- (void)setTransferState:(unint64_t)a3 forTransfer:(id)a4 shouldNotify:(BOOL)a5
{
  -[SDAirDropTransferManager setTransferState:forTransfer:shouldNotify:shouldCleanup:](self, "setTransferState:forTransfer:shouldNotify:shouldCleanup:", a3, a4, a5, 0);
}

- (void)setTransferState:(unint64_t)a3 forTransfer:(id)a4 shouldNotify:(BOOL)a5 shouldCleanup:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a6;
  v7 = a5;
  v10 = a4;
  v11 = airdrop_log(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    sub_10008589C();

  objc_msgSend(v10, "setTransferState:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropTransferManager transferIdentifierToHandler](self, "transferIdentifierToHandler"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v14));
  objc_msgSend(v15, "transferUpdated");

  if (v7)
    -[SDAirDropTransferManager notifyObserversOfUpdatedTransfer:](self, "notifyObserversOfUpdatedTransfer:", v10);
  if (v6)
    -[SDAirDropTransferManager removeTransfer:shouldCleanup:](self, "removeTransfer:shouldCleanup:", v10, 1);

}

- (void)cleanUpURL:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  void *v16;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = airdrop_log(v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
      *(_DWORD *)buf = 138412290;
      v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Cleaning up URL %@", buf, 0xCu);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v14 = 0;
    v9 = objc_msgSend(v8, "removeItemAtURL:error:", v4, &v14);
    v10 = v14;

    if ((v9 & 1) == 0)
    {
      v12 = airdrop_log(v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10008597C();

    }
  }

}

- (void)loadAllPersistedTransfers
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  _BYTE v30[128];
  _QWORD v31[2];

  v2 = airdrop_log(self);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Loading all persisted transfers", buf, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAirDropHandler persistedTransfersBaseURL](SDAirDropHandler, "persistedTransfersBaseURL"));
  if (v5)
  {
    v31[0] = NSURLIsDirectoryKey;
    v31[1] = NSURLIsReadableKey;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 2));
    v19 = v5;
    v20 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v5, v6, 7, 0));

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v25;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v12);
          v23 = 0;
          objc_msgSend(v13, "getResourceValue:forKey:error:", &v23, NSURLIsDirectoryKey, 0);
          v14 = v23;
          v22 = 0;
          objc_msgSend(v13, "getResourceValue:forKey:error:", &v22, NSURLIsReadableKey, 0);
          v15 = v22;
          if (objc_msgSend(v14, "BOOLValue"))
          {
            v16 = objc_msgSend(v15, "BOOLValue");
            if ((_DWORD)v16)
            {
              v17 = airdrop_log(v16);
              v18 = objc_claimAutoreleasedReturnValue(v17);
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v29 = v13;
                _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Receive data at %@ is not valid", buf, 0xCu);
              }

              -[SDAirDropTransferManager cleanUpURL:](self, "cleanUpURL:", v13);
            }
          }

          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      }
      while (v10);
    }

    v5 = v19;
    v4 = v20;
  }

}

- (id)itemTypesForTransfer:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSMutableDictionary *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  NSMutableDictionary *v43;
  _BYTE v44[128];
  _BYTE v45[128];

  v3 = a3;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100085258;
  v42[3] = &unk_100715E10;
  v32 = objc_opt_new(NSMutableDictionary);
  v43 = v32;
  v4 = objc_retainBlock(v42);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metaData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rawFiles"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v39;
    v10 = kSFOperationFileTypeKey;
    v11 = kSFOperationtFileSubTypeKey;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v9)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v10, v32));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v11));
        ((void (*)(_QWORD *, void *, void *, uint64_t))v4[2])(v4, v14, v15, 1);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    }
    while (v8);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v33 = v3;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "completedURLs"));
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(_QWORD *)v35 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)j);
        if ((objc_msgSend(v21, "isFileURL", v32) & 1) == 0)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "URLOverrideForURL:", v21));

          v24 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "applicationsAvailableForOpeningURL:", v21));

          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "firstObject"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "applicationIdentifier"));

          if (v27)
          {
            ((void (*)(_QWORD *, void *, _QWORD, _QWORD))v4[2])(v4, v27, 0, 0);
          }
          else
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "scheme"));
            ((void (*)(_QWORD *, void *, _QWORD, _QWORD))v4[2])(v4, v28, 0, 0);

          }
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    }
    while (v18);
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v32, "allValues"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v29));

  return v30;
}

- (SDAirDropAlertManagerDelegate)delegate
{
  return (SDAirDropAlertManagerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (SDAirDropAlertManagerDelegate)classroomDelegate
{
  return (SDAirDropAlertManagerDelegate *)objc_loadWeakRetained((id *)&self->_classroomDelegate);
}

- (void)setClassroomDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_classroomDelegate, a3);
}

- (NSMutableDictionary)transferIdentifierToTransfer
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTransferIdentifierToTransfer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSMutableDictionary)transferIdentifierToHandler
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTransferIdentifierToHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSArray)kvoObservingKeys
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setKvoObservingKeys:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kvoObservingKeys, 0);
  objc_storeStrong((id *)&self->_transferIdentifierToHandler, 0);
  objc_storeStrong((id *)&self->_transferIdentifierToTransfer, 0);
  objc_destroyWeak((id *)&self->_classroomDelegate);
  objc_destroyWeak((id *)&self->delegate);
}

@end
