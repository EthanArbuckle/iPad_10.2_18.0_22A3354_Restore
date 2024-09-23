@implementation XBLaunchImageProviderServer

- (void)_removeTransactionWorkForClient:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v5;

  p_accessLock = &self->_accessLock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_accessLock);
  os_unfair_lock_lock(p_accessLock);
  -[NSMapTable removeObjectForKey:](self->_accessLock_clientTransactionWorkMap, "removeObjectForKey:", v5);

  os_unfair_lock_unlock(p_accessLock);
}

- (id)_transactionWorkForClient:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v5;
  void *v6;

  p_accessLock = &self->_accessLock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_accessLock);
  os_unfair_lock_lock(p_accessLock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_accessLock_clientTransactionWorkMap, "objectForKey:", v5));

  os_unfair_lock_unlock(p_accessLock);
  return v6;
}

- (void)queue_clientRemoved:(id)a3
{
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;
  dispatch_semaphore_t v8;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000026EC;
  block[3] = &unk_10000C758;
  block[4] = self;
  v7 = a3;
  v8 = dispatch_semaphore_create(0);
  v4 = v8;
  v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  -[XBLaunchImageProviderServer _removeTransactionWorkForClient:](self, "_removeTransactionWorkForClient:", v5);

}

- (void)queue_clientAdded:(id)a3
{
  id v4;
  XBLaunchImageClientTransactionWork *v5;

  v4 = a3;
  v5 = objc_alloc_init(XBLaunchImageClientTransactionWork);
  -[XBLaunchImageProviderServer _setTransactionWork:forClient:](self, "_setTransactionWork:forClient:", v5, v4);

}

- (void)queue_handleMessage:(id)a3 client:(id)a4
{
  id v6;
  int64_t int64;
  xpc_object_t xdict;

  xdict = a3;
  v6 = a4;
  int64 = xpc_dictionary_get_int64(xdict, XBLaunchImageProviderMessageKeyMessageType);
  if (int64 == 1)
  {
    -[XBLaunchImageProviderServer _handlePreheat:forClient:](self, "_handlePreheat:forClient:", xdict, v6);
  }
  else if (!int64)
  {
    -[XBLaunchImageProviderServer _queue_handleGetLaunchImage:forClient:](self, "_queue_handleGetLaunchImage:forClient:", xdict, v6);
  }

}

- (void)_setTransactionWork:(id)a3 forClient:(id)a4
{
  os_unfair_lock_s *p_accessLock;
  id v7;
  id v8;

  p_accessLock = &self->_accessLock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_assert_not_owner(p_accessLock);
  os_unfair_lock_lock(p_accessLock);
  -[NSMapTable setObject:forKey:](self->_accessLock_clientTransactionWorkMap, "setObject:forKey:", v8, v7);

  os_unfair_lock_unlock(p_accessLock);
}

+ (id)sharedInstance
{
  if (qword_1000115B0 != -1)
    dispatch_once(&qword_1000115B0, &stru_10000C6C8);
  return (id)qword_1000115A8;
}

- (XBLaunchImageProviderServer)init
{
  XBLaunchImageProviderServer *v2;
  _XBMemoryMonitor *v3;
  _XBMemoryMonitor *memoryMonitor;
  uint64_t v5;
  NSMapTable *accessLock_clientTransactionWorkMap;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)XBLaunchImageProviderServer;
  v2 = -[XBLaunchImageProviderServer initWithServiceName:](&v8, "initWithServiceName:", XBApplicationLaunchImageServiceName);
  if (v2)
  {
    v3 = objc_alloc_init(_XBMemoryMonitor);
    memoryMonitor = v2->_memoryMonitor;
    v2->_memoryMonitor = v3;

    v2->_accessLock._os_unfair_lock_opaque = 0;
    v5 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
    accessLock_clientTransactionWorkMap = v2->_accessLock_clientTransactionWorkMap;
    v2->_accessLock_clientTransactionWorkMap = (NSMapTable *)v5;

  }
  return v2;
}

- (void)run
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[16];

  v3 = sub_100002C4C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Running", buf, 2u);
  }

  if (qword_1000115B8 != -1)
    dispatch_once(&qword_1000115B8, &stru_10000C6E8);
  v5 = objc_claimAutoreleasedReturnValue(-[XBLaunchImageProviderServer queue](self, "queue"));
  dispatch_async(v5, &stru_10000C708);

  v6.receiver = self;
  v6.super_class = (Class)XBLaunchImageProviderServer;
  -[XBLaunchImageProviderServer run](&v6, "run");
}

- (void)_queue_handleGetLaunchImage:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  __CFRunLoop *Main;
  __CFRunLoop *v23;
  _XBMemoryMonitor *memoryMonitor;
  void *v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  id v42;
  void *v43;
  id v44;
  NSObject *v45;
  id v46;
  void *v47;
  void *v48;
  xpc_object_t xdict;
  _QWORD v50[7];
  char v51;
  _QWORD block[5];
  id v53;
  id v54;
  id v55;
  _QWORD *v56;
  _QWORD *v57;
  _BYTE *v58;
  _BYTE *v59;
  char v60;
  char v61;
  _BYTE v62[32];
  _QWORD v63[5];
  id v64;
  _QWORD v65[3];
  int v66;
  _BYTE v67[22];
  _BYTE buf[24];
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)&self->BSBaseXPCServer_opaque[OBJC_IVAR___BSBaseXPCServer__queue]);
  xdict = v6;
  v8 = BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey(v6, XBLaunchImageProviderMessageKeyCompatibilityInfo);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey(v6, XBLaunchImageProviderMessageKeyLaunchRequest);
  v48 = (void *)objc_claimAutoreleasedReturnValue(v10);
  LODWORD(v11) = xpc_dictionary_get_BOOL(v6, XBLaunchImageProviderMessageKeyCreateCaptureInfo);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "connection"));
  v13 = BSPIDForXPCConnection();
  v14 = BSProcessDescriptionForPID(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  v16 = sub_100002CBC();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleIdentifier"));
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Running image request from %{public}@ for %@", buf, 0x16u);

  }
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x2020000000;
  v66 = XBInvalidContextId;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v69 = sub_100006310;
  v70 = sub_100006320;
  v71 = 0;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x3032000000;
  v63[3] = sub_100006310;
  v63[4] = sub_100006320;
  v64 = 0;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "connection"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[BSAuditToken tokenFromXPCConnection:](BSAuditToken, "tokenFromXPCConnection:", v19));

  if ((objc_msgSend(v20, "hasEntitlement:", XBApplicationLaunchImageCaptureEntitlement) & 1) != 0)
    goto LABEL_8;
  if (v20)
    objc_msgSend(v20, "realToken");
  else
    memset(v62, 0, sizeof(v62));
  if (BSAuditTokenRepresentsPlatformBinary(v62))
  {
LABEL_8:
    v21 = (char)v11;
    if ((_DWORD)v11)
      LOBYTE(v11) = objc_msgSend(v20, "hasEntitlement:", XBApplicationLaunchImageCaarCaptureEntitlement);
    *(_QWORD *)v67 = 0;
    *(_QWORD *)&v67[8] = 0;
    pthread_dependency_init_np(v67, qword_1000115C0, 0);
    Main = CFRunLoopGetMain();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006328;
    block[3] = &unk_10000C780;
    v60 = v21;
    v61 = (char)v11;
    v56 = v65;
    block[4] = self;
    v53 = v7;
    v54 = v48;
    v11 = v9;
    v55 = v11;
    v57 = v63;
    v58 = buf;
    v59 = v67;
    CFRunLoopPerformBlock(Main, kCFRunLoopCommonModes, block);
    v23 = CFRunLoopGetMain();
    CFRunLoopWakeUp(v23);
    pthread_dependency_wait_np(v67);
    memoryMonitor = self->_memoryMonitor;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleIdentifier"));
    -[_XBMemoryMonitor recordMemoryForBundleID:](memoryMonitor, "recordMemoryForBundleID:", v25);

    LOBYTE(v11) = v21;
  }
  else
  {
    v26 = sub_100002CBC();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      sub_100007114((uint64_t)v15, v27, v28, v29, v30, v31, v32, v33);

    v34 = objc_alloc((Class)XBLaunchImageError);
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleIdentifier"));
    v36 = objc_msgSend(v34, "initWithCode:bundleID:reason:fatal:", 10, v35, CFSTR("The client is unentitled"), 0);
    v37 = *(void **)(*(_QWORD *)&buf[8] + 40);
    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v36;

  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[BSXPCReply replyForMessage:](BSXPCReply, "replyForMessage:", xdict));
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_1000063EC;
  v50[3] = &unk_10000C7A8;
  v50[4] = v65;
  v50[5] = buf;
  v51 = (char)v11;
  v50[6] = v63;
  objc_msgSend(v38, "sendReply:", v50);
  v39 = *(void **)(*(_QWORD *)&buf[8] + 40);
  if (v39)
  {
    if (objc_msgSend(v39, "isFatal"))
    {
      v44 = sub_100002CBC();
      v45 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        v46 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "code");
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleIdentifier"));
        *(_DWORD *)v67 = 134218242;
        *(_QWORD *)&v67[4] = v46;
        *(_WORD *)&v67[12] = 2114;
        *(_QWORD *)&v67[14] = v47;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "XBLaunchImageProviderServer encountered a fatal error with code: %ld during launch image generation for bundleID: %{public}@", v67, 0x16u);

      }
      exit(0);
    }
    v40 = sub_100002CBC();
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "code");
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleIdentifier"));
      *(_DWORD *)v67 = 134218242;
      *(_QWORD *)&v67[4] = v42;
      *(_WORD *)&v67[12] = 2114;
      *(_QWORD *)&v67[14] = v43;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "XBLaunchImageProviderServer encountered an error with code: %ld during launch image generation for bundleID: %{public}@", v67, 0x16u);

    }
  }

  _Block_object_dispose(v63, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v65, 8);
}

- (unsigned)_onMain_createLaunchWindowForClient:(id)a3 withLaunchRequest:(id)a4 appInfo:(id)a5 captureInfo:(id *)a6 captureOptions:(int64_t)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  unsigned int v28;
  id v29;
  NSObject *v30;
  void *v31;
  double v32;
  int v34;
  _BYTE v35[10];
  double v36;

  v14 = a4;
  v15 = a5;
  v16 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v17 = sub_100002CBC();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v34 = 67109376;
    *(_DWORD *)v35 = qos_class_self();
    *(_WORD *)&v35[4] = 1024;
    *(_DWORD *)&v35[6] = BSPthreadGetCurrentPriority();
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Running on main thread at QoS %d with priority %d.", (uint8_t *)&v34, 0xEu);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[XBLaunchImageProviderServer _transactionWorkForClient:](self, "_transactionWorkForClient:", v16));

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "contextWrapper"));
  if (!v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[XBLaunchImageContextWrapper contextWrapperForApplicationWithCompatibilityInfo:launchRequest:captureOptions:](XBLaunchImageContextWrapper, "contextWrapperForApplicationWithCompatibilityInfo:launchRequest:captureOptions:", v15, v14, a7));
    objc_msgSend(v20, "setContextWrapper:", v22);
    if (!a6)
      goto LABEL_6;
    goto LABEL_5;
  }
  v22 = v21;
  objc_msgSend(v21, "updateLaunchRequest:", v14);
  if (a6)
LABEL_5:
    *a6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "captureInformation"));
LABEL_6:
  v23 = XBInvalidContextId;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "error"));
  if (v24 || (v28 = objc_msgSend(v22, "contextID")) == 0 || v23 == v28)
  {
    objc_msgSend(v22, "invalidate");
    objc_msgSend(v20, "setContextWrapper:", 0);
    v25 = sub_100002CBC();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bundleIdentifier"));
      v34 = 138412546;
      *(_QWORD *)v35 = v27;
      *(_WORD *)&v35[8] = 2112;
      v36 = *(double *)&v24;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[%@] launch image generation failed with error: %@", (uint8_t *)&v34, 0x16u);

    }
    if (a8 && v24)
      *a8 = objc_retainAutorelease(v24);
  }
  else
  {
    v23 = objc_msgSend(v22, "contextID");
    v29 = sub_100002CBC();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bundleIdentifier"));
      objc_msgSend(v19, "timeIntervalSinceNow");
      v34 = 138412546;
      *(_QWORD *)v35 = v31;
      *(_WORD *)&v35[8] = 2048;
      v36 = -v32;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "[%@] launch image generation completed after %.3fs", (uint8_t *)&v34, 0x16u);

    }
  }

  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessLock_clientTransactionWorkMap, 0);
  objc_storeStrong((id *)&self->_memoryMonitor, 0);
}

@end
