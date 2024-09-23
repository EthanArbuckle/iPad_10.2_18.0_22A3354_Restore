@implementation ICRemoteCameraDevice

- (ICRemoteCameraDevice)initWithDeviceContext:(id)a3
{
  id v4;
  ICRemoteCameraDevice *v5;
  ICSessionManager *v6;
  ICSessionManager *sessionManager;
  NSMutableDictionary *v8;
  NSMutableDictionary *cameraDictionary;
  NSMutableArray *v10;
  NSMutableArray *deniedBundles;
  NSMutableArray *v12;
  NSMutableArray *addedBundles;
  dispatch_queue_attr_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *deviceOperationUnderlyingQueue;
  NSOperationQueue *v20;
  NSOperationQueue *deviceOperationQueue;
  void *v22;
  void *v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)ICRemoteCameraDevice;
  v5 = -[ICRemoteCameraDevice init](&v25, "init");
  if (v5)
  {
    v6 = -[ICSessionManager initWithDelegate:]([ICSessionManager alloc], "initWithDelegate:", v5);
    sessionManager = v5->_sessionManager;
    v5->_sessionManager = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    cameraDictionary = v5->_cameraDictionary;
    v5->_cameraDictionary = v8;

    v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    deniedBundles = v5->_deniedBundles;
    v5->_deniedBundles = v10;

    v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    addedBundles = v5->_addedBundles;
    v5->_addedBundles = v12;

    v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICDeviceName")));
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), CFSTR("ICDeviceUnderlyingQueue"), v16)));
    v18 = dispatch_queue_create((const char *)objc_msgSend(v17, "UTF8String"), v15);
    deviceOperationUnderlyingQueue = v5->_deviceOperationUnderlyingQueue;
    v5->_deviceOperationUnderlyingQueue = (OS_dispatch_queue *)v18;

    v20 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    deviceOperationQueue = v5->_deviceOperationQueue;
    v5->_deviceOperationQueue = v20;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v5->_deviceOperationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v5->_deviceOperationQueue, "setQualityOfService:", 25);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICDeviceName")));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), CFSTR("ICDeviceOperationQueue"), v22));
    -[NSOperationQueue setName:](v5->_deviceOperationQueue, "setName:", v23);

    -[NSOperationQueue setUnderlyingQueue:](v5->_deviceOperationQueue, "setUnderlyingQueue:", v5->_deviceOperationUnderlyingQueue);
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak(&self->_delegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)ICRemoteCameraDevice;
  -[ICRemoteCameraDevice dealloc](&v3, "dealloc");
}

- (NSXPCListenerEndpoint)endpoint
{
  return -[NSXPCListener endpoint](self->_listener, "endpoint");
}

- (NSString)internalUUID
{
  return (NSString *)-[NSMutableDictionary objectForKeyedSubscript:](self->_cameraDictionary, "objectForKeyedSubscript:", CFSTR("ICInternalDeviceUUID"));
}

- (void)startListening
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener anonymousListener](NSXPCListener, "anonymousListener"));
  -[ICRemoteCameraDevice setListener:](self, "setListener:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDevice listener](self, "listener"));
  objc_msgSend(v4, "setDelegate:", self);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDevice listener](self, "listener"));
  objc_msgSend(v5, "resume");

}

- (BOOL)acceptConnection:(id)a3
{
  return sub_10002BFF8(a3);
}

- (BOOL)evaulateCommonTCC:(id)a3
{
  id v4;
  void *v5;
  id v6;
  __SecTask *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  unsigned __int8 v14;
  BOOL v15;
  void *v17;
  void *v18;
  audit_token_t token;
  CFErrorRef error[5];

  v4 = a3;
  v5 = v4;
  memset(&error[1], 0, 32);
  if (v4)
    objc_msgSend(v4, "auditToken");
  error[0] = 0;
  v6 = objc_msgSend(v5, "processIdentifier");
  token = *(audit_token_t *)&error[1];
  v7 = SecTaskCreateWithAuditToken(0, &token);
  v8 = (__CFString *)SecTaskCopySigningIdentifier(v7, error);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%d"), v8, v6));
  if (v7)
    CFRelease(v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceAccessManager sharedAccessManager](ICDeviceAccessManager, "sharedAccessManager"));
  if (!v10
    || (v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDevice addedBundles](self, "addedBundles")),
        v12 = objc_msgSend(v11, "containsObject:", v9),
        v11,
        (v12 & 1) != 0)
    || (v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDevice deniedBundles](self, "deniedBundles")),
        v14 = objc_msgSend(v13, "containsObject:", v9),
        v13,
        (v14 & 1) != 0))
  {
    v15 = 0;
  }
  else
  {
    v15 = objc_msgSend(v10, "bundleIdentifier:stateForAccessType:", v8, CFSTR("read_access")) == (id)2;
    if (v15)
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDevice addedBundles](self, "addedBundles"));
    else
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDevice deniedBundles](self, "deniedBundles"));
    v18 = v17;
    objc_msgSend(v17, "addObject:", v9);

  }
  return v15;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  NSObject *v14;
  void *v15;
  unsigned int v16;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;

  v5 = a4;
  if (-[ICRemoteCameraDevice acceptConnection:](self, "acceptConnection:", v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___ICCameraDeviceProtocol));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___ICCameraDeviceProtocol));
    -[ICRemoteCameraDevice addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v6, CFSTR("imageCaptureEventNotification:completion:"), 1);
    -[ICRemoteCameraDevice addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v6, CFSTR("postNotification:"), 0);
    -[ICRemoteCameraDevice addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v6, CFSTR("notifyAddedItems:"), 0);
    -[ICRemoteCameraDevice addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v6, CFSTR("notifyRemovedItems:"), 0);
    -[ICRemoteCameraDevice addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v6, CFSTR("notifyUpdatedItems:"), 0);
    -[ICRemoteCameraDevice addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v6, CFSTR("notifyStatus:"), 0);
    -[ICRemoteCameraDevice addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v6, CFSTR("notifyPtpEvent:"), 0);
    -[ICRemoteCameraDevice addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v6, CFSTR("registerInterestedEventNotifications:"), 0);
    -[ICRemoteCameraDevice addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v6, CFSTR("unregisterInterestedEventNotifications:"), 0);
    -[ICRemoteCameraDevice addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v6, CFSTR("requestThumbnailDataForObjectHandle:options:withReply:"), 1);
    -[ICRemoteCameraDevice addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v6, CFSTR("requestMetadataForObjectHandle:options:withReply:"), 1);
    -[ICRemoteCameraDevice addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v6, CFSTR("requestDownloadObjectHandle:options:withReply:"), 1);
    -[ICRemoteCameraDevice addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v6, CFSTR("requestDeleteObjectHandle:options:withReply:"), 1);
    -[ICRemoteCameraDevice addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v6, CFSTR("requestReadDataFromObjectHandle:options:withReply:"), 1);
    -[ICRemoteCameraDevice addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v6, CFSTR("requestSecurityScopedURLForObjectHandle:withReply:"), 1);
    -[ICRemoteCameraDevice addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v6, CFSTR("requestFingerprintForObjectHandle:withReply:"), 1);
    -[ICRemoteCameraDevice addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v6, CFSTR("requestRefreshObjectHandleInfo:withReply:"), 1);
    -[ICRemoteCameraDevice addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v7, CFSTR("imageCaptureEventNotification:completion:"), 1);
    -[ICRemoteCameraDevice addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v7, CFSTR("postNotification:"), 0);
    -[ICRemoteCameraDevice addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v7, CFSTR("notifyAddedItems:"), 0);
    -[ICRemoteCameraDevice addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v7, CFSTR("notifyRemovedItems:"), 0);
    -[ICRemoteCameraDevice addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v7, CFSTR("notifyUpdatedItems:"), 0);
    -[ICRemoteCameraDevice addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v7, CFSTR("notifyStatus:"), 0);
    -[ICRemoteCameraDevice addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v7, CFSTR("notifyPtpEvent:"), 0);
    -[ICRemoteCameraDevice addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v7, CFSTR("registerInterestedEventNotifications:"), 0);
    -[ICRemoteCameraDevice addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v7, CFSTR("unregisterInterestedEventNotifications:"), 0);
    -[ICRemoteCameraDevice addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v7, CFSTR("requestThumbnailDataForObjectHandle:options:withReply:"), 1);
    -[ICRemoteCameraDevice addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v7, CFSTR("requestMetadataForObjectHandle:options:withReply:"), 1);
    -[ICRemoteCameraDevice addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v7, CFSTR("requestDownloadObjectHandle:options:withReply:"), 1);
    -[ICRemoteCameraDevice addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v7, CFSTR("requestDeleteObjectHandle:options:withReply:"), 1);
    -[ICRemoteCameraDevice addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v7, CFSTR("requestReadDataFromObjectHandle:options:withReply:"), 1);
    -[ICRemoteCameraDevice addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v7, CFSTR("requestSecurityScopedURLForObjectHandle:withReply:"), 1);
    -[ICRemoteCameraDevice addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v7, CFSTR("requestFingerprintForObjectHandle:withReply:"), 1);
    -[ICRemoteCameraDevice addSelectorToInterface:selectorString:origin:](self, "addSelectorToInterface:selectorString:origin:", v7, CFSTR("requestRefreshObjectHandleInfo:withReply:"), 1);
    objc_msgSend(v5, "setExportedInterface:", v6);
    objc_msgSend(v5, "setRemoteObjectInterface:", v7);
    objc_msgSend(v5, "setExportedObject:", self);
    __ICOSLogCreate();
    v8 = CFSTR("sessionManager");
    if ((unint64_t)objc_msgSend(CFSTR("sessionManager"), "length") >= 0x15)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("sessionManager"), "substringWithRange:", 0, 18));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingString:", CFSTR("..")));

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDevice sessionManager](self, "sessionManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v10));

    v12 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_retainAutorelease(v8);
      v14 = v12;
      *(_DWORD *)buf = 136446466;
      v19 = -[__CFString UTF8String](v13, "UTF8String");
      v20 = 2114;
      v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDevice sessionManager](self, "sessionManager"));
    v16 = objc_msgSend(v15, "createSessionWithConnection:", v5);

    if (v16)
      objc_msgSend(v5, "resume");

  }
  else
  {
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (id)additionalProperties
{
  return 0;
}

- (void)addSelectorToInterface:(id)a3 selectorString:(id)a4 origin:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v7;
  NSString *v8;
  uint64_t v9;
  SEL v10;
  id v11;

  v5 = a5;
  v7 = qword_10005F4E0;
  v8 = (NSString *)a4;
  v11 = a3;
  if (v7 != -1)
    dispatch_once(&qword_10005F4E0, &stru_100049078);
  v9 = qword_10005F4D8;
  v10 = NSSelectorFromString(v8);

  objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v9, v10, 0, v5);
}

- (void)removeAllSessions
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDevice sessionManager](self, "sessionManager"));
  objc_msgSend(v2, "removeAllSessions");

}

- (void)removeSessionsWithProcessIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDevice sessionManager](self, "sessionManager"));
  objc_msgSend(v5, "removeSessionsWithProcessIdentifier:", v4);

}

- (NSArray)allConnections
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDevice sessionManager](self, "sessionManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "connections"));

  return (NSArray *)v3;
}

- (void)addInitiatedOperation:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDevice deviceOperationQueue](self, "deviceOperationQueue"));

  if (v4)
  {
    objc_msgSend(v6, "setQueuePriority:", 0);
    objc_msgSend(v6, "setQualityOfService:", 25);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDevice deviceOperationQueue](self, "deviceOperationQueue"));
    objc_msgSend(v5, "addOperation:", v6);

  }
}

- (void)addInteractiveOperation:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDevice deviceOperationQueue](self, "deviceOperationQueue"));

  if (v4)
  {
    objc_msgSend(v6, "setQueuePriority:", 4);
    objc_msgSend(v6, "setQualityOfService:", 33);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDevice deviceOperationQueue](self, "deviceOperationQueue"));
    objc_msgSend(v5, "addOperation:", v6);

  }
}

- (void)holdPowerAssertion
{
  void *v3;
  id v4;

  if (!self->_cpPowerAssertion)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDevice cameraDictionary](self, "cameraDictionary"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICDeviceName")));
    self->_cpPowerAssertion = (void *)CPPowerAssertionCreate(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.mscamerad-xpc+%@"), v3), 120.0);

  }
}

- (void)releasePowerAssertion
{
  void *cpPowerAssertion;

  cpPowerAssertion = self->_cpPowerAssertion;
  if (cpPowerAssertion)
  {
    CFRelease(cpPowerAssertion);
    self->_cpPowerAssertion = 0;
  }
}

- (void)registerInterestedEventNotifications:(id)a3
{
  id v4;
  void *v5;
  void **v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  ICRemoteCameraDevice *v10;
  id v11;

  v6 = _NSConcreteStackBlock;
  v7 = 3221225472;
  v8 = sub_100029C9C;
  v9 = &unk_1000489E8;
  v10 = self;
  v11 = a3;
  v4 = v11;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &v6));
  -[ICRemoteCameraDevice addInteractiveOperation:](self, "addInteractiveOperation:", v5, v6, v7, v8, v9, v10);

}

- (void)unregisterInterestedEventNotifications:(id)a3
{
  id v4;
  void *v5;
  void **v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  ICRemoteCameraDevice *v10;
  id v11;

  v6 = _NSConcreteStackBlock;
  v7 = 3221225472;
  v8 = sub_100029DA0;
  v9 = &unk_1000489E8;
  v10 = self;
  v11 = a3;
  v4 = v11;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &v6));
  -[ICRemoteCameraDevice addInteractiveOperation:](self, "addInteractiveOperation:", v5, v6, v7, v8, v9, v10);

}

- (void)sendAddedItemsNotification:(id)a3 toConnections:(id)a4
{
  -[ICRemoteCameraDevice sendNotification:toConnections:selector:](self, "sendNotification:toConnections:selector:", a3, a4, "notifyAddedItems:");
}

- (void)sendUpdatedItemsNotification:(id)a3 toConnections:(id)a4
{
  -[ICRemoteCameraDevice sendNotification:toConnections:selector:](self, "sendNotification:toConnections:selector:", a3, a4, "notifyUpdatedItems:");
}

- (void)sendStatusNotification:(id)a3 toConnections:(id)a4
{
  -[ICRemoteCameraDevice sendNotification:toConnections:selector:](self, "sendNotification:toConnections:selector:", a3, a4, "notifyStatus:");
}

- (void)sendRemovedItemsNotification:(id)a3 toConnections:(id)a4
{
  -[ICRemoteCameraDevice sendNotification:toConnections:selector:](self, "sendNotification:toConnections:selector:", a3, a4, "notifyRemovedItems:");
}

- (void)sendPTPEventNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDevice sessionManager](self, "sessionManager"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "connectionsMonitoringNotification:", CFSTR("ICNotificationTypeDeviceForwardPTPEvents")));

  -[ICRemoteCameraDevice sendNotification:toConnections:selector:](self, "sendNotification:toConnections:selector:", v4, v6, "notifyPtpEvent:");
}

- (void)sendNotification:(id)a3 toConnections:(id)a4 selector:(SEL)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  id v22;
  NSString *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  NSObject *v28;
  id v29;
  void *v30;
  id obj;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];

  v8 = a3;
  v9 = a4;
  v10 = v8;
  v11 = v9;
  v32 = v10;
  if (!a5)
  {
    v12 = objc_msgSend(v10, "mutableCopy");
    a5 = NSSelectorFromString(CFSTR("postNotification:"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDevice internalUUID](self, "internalUUID"));
    v32 = v12;
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("ICInternalDeviceUUID"));

  }
  v30 = v10;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v11;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "remoteObjectProxyWithErrorHandler:", &stru_1000490B8));
        __ICOSLogCreate();
        if (__ICLogTypeEnabled(4))
        {
          v20 = CFSTR("sendNote");
          if ((unint64_t)objc_msgSend(CFSTR("sendNote"), "length") >= 0x15)
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("sendNote"), "substringWithRange:", 0, 18));
            v20 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringByAppendingString:", CFSTR("..")));

          }
          v22 = objc_msgSend(v18, "processIdentifier");
          v23 = NSStringFromSelector(a5);
          v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%05d] --> %@"), v22, v24));

          v26 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            v27 = objc_retainAutorelease(v20);
            v28 = v26;
            v29 = -[__CFString UTF8String](v27, "UTF8String");
            *(_DWORD *)buf = 136446466;
            v38 = v29;
            v39 = 2114;
            v40 = v25;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

          }
        }
        objc_msgSend(v19, "performSelector:withObject:", a5, v32);

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v15);
  }

}

- (NSOperationQueue)deviceOperationQueue
{
  return self->_deviceOperationQueue;
}

- (void)setDeviceOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_deviceOperationQueue, a3);
}

- (NSMutableDictionary)cameraDictionary
{
  return self->_cameraDictionary;
}

- (void)setCameraDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_cameraDictionary, a3);
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (NSMutableArray)deniedBundles
{
  return self->_deniedBundles;
}

- (void)setDeniedBundles:(id)a3
{
  objc_storeStrong((id *)&self->_deniedBundles, a3);
}

- (NSMutableArray)addedBundles
{
  return self->_addedBundles;
}

- (void)setAddedBundles:(id)a3
{
  objc_storeStrong((id *)&self->_addedBundles, a3);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (ICSessionManager)sessionManager
{
  return self->_sessionManager;
}

- (void)setSessionManager:(id)a3
{
  objc_storeStrong((id *)&self->_sessionManager, a3);
}

- (OS_dispatch_queue)deviceOperationUnderlyingQueue
{
  return self->_deviceOperationUnderlyingQueue;
}

- (void)setDeviceOperationUnderlyingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_deviceOperationUnderlyingQueue, a3);
}

- (void)cpPowerAssertion
{
  return self->_cpPowerAssertion;
}

- (void)setCpPowerAssertion:(void *)a3
{
  self->_cpPowerAssertion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceOperationUnderlyingQueue, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_addedBundles, 0);
  objc_storeStrong((id *)&self->_deniedBundles, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_cameraDictionary, 0);
  objc_storeStrong((id *)&self->_deviceOperationQueue, 0);
}

@end
