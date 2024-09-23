@implementation BKMousePointerServiceServer

- (id)_pointerDevicesFromIOHIDServices:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "bs_compactMap:", &stru_1000E9A90));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v3));

  return v4;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  BKMousePointerServiceServer *v16;
  id v17;
  uint8_t buf[4];
  id v19;

  v6 = a4;
  v9 = BKLogMousePointer(v6, v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received Connection: %{public}@", buf, 0xCu);
  }

  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_100003774;
  v15 = &unk_1000E9CD8;
  v16 = self;
  v17 = v6;
  v11 = v6;
  objc_msgSend(v11, "configureConnection:", &v12);
  objc_msgSend(v11, "activate", v12, v13, v14, v15, v16);

}

- (id)setMousePointerDeviceObservationEnabled:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  NSMutableSet *deviceObservingConnections;
  NSMutableSet *v8;
  NSMutableSet *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceConnection currentContext](BSServiceConnection, "currentContext"));
  v6 = objc_msgSend(v4, "BOOLValue");

  if (v6 == -[NSMutableSet containsObject:](self->_deviceObservingConnections, "containsObject:", v5))
    goto LABEL_7;
  deviceObservingConnections = self->_deviceObservingConnections;
  if (!v6)
  {
    -[NSMutableSet removeObject:](deviceObservingConnections, "removeObject:", v5);
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  if (!deviceObservingConnections)
  {
    v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v9 = self->_deviceObservingConnections;
    self->_deviceObservingConnections = v8;

    deviceObservingConnections = self->_deviceObservingConnections;
  }
  -[NSMutableSet addObject:](deviceObservingConnections, "addObject:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKMousePointerController availableDevices](self->_mousePointerController, "availableDevices"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKMousePointerServiceServer _pointerDevicesFromIOHIDServices:](self, "_pointerDevicesFromIOHIDServices:", v10));

LABEL_8:
  return v11;
}

- (void)dealloc
{
  void *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  BKMousePointerServiceServer *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;

  if (self->_connectionListener)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("must invoke invalidate before deallocating BKMousePointerServiceServer")));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v5 = NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      v8 = (objc_class *)objc_opt_class(self, v7);
      v9 = NSStringFromClass(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      *(_DWORD *)buf = 138544642;
      v13 = v6;
      v14 = 2114;
      v15 = v10;
      v16 = 2048;
      v17 = self;
      v18 = 2114;
      v19 = CFSTR("BKMousePointerServiceServer.m");
      v20 = 1024;
      v21 = 112;
      v22 = 2114;
      v23 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    _bs_set_crash_log_message(objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
    __break(0);
    JUMPOUT(0x10001C5B8);
  }
  v11.receiver = self;
  v11.super_class = (Class)BKMousePointerServiceServer;
  -[BKMousePointerServiceServer dealloc](&v11, "dealloc");
}

- (void)activateWithMousePointerController:(id)a3
{
  OS_dispatch_queue *v5;
  OS_dispatch_queue *queue;
  BSServiceConnectionListener *v7;
  BSServiceConnectionListener *connectionListener;
  id v9;
  _QWORD v10[5];

  objc_storeStrong((id *)&self->_mousePointerController, a3);
  v9 = a3;
  v5 = (OS_dispatch_queue *)BSDispatchQueueCreateWithQualityOfService("com.apple.backboardd.BKMousePointerServiceServer", 0, 21, 0);
  queue = self->_queue;
  self->_queue = v5;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001F130;
  v10[3] = &unk_1000ECEE0;
  v10[4] = self;
  v7 = (BSServiceConnectionListener *)objc_claimAutoreleasedReturnValue(+[BSServiceConnectionListener listenerWithConfigurator:](BSServiceConnectionListener, "listenerWithConfigurator:", v10));
  connectionListener = self->_connectionListener;
  self->_connectionListener = v7;

  -[BSServiceConnectionListener activate](self->_connectionListener, "activate");
}

- (void)pointingDevicesDidChange:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F000;
  block[3] = &unk_1000ECD80;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (id)globalPointerPosition
{
  NSString *v3;
  void *v4;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x3010000000;
  v12 = 0;
  v13 = 0;
  v11 = &unk_1000D4F2B;
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001EFCC;
  v7[3] = &unk_1000E98E8;
  v7[4] = self;
  v7[5] = &v8;
  -[BKMousePointerServiceServer _accessStateForReason:entitlement:logEntitlementOnFailure:usingBlock:](self, "_accessStateForReason:entitlement:logEntitlementOnFailure:usingBlock:", v4, BKPointerAutomationEntitlement, 0, v7);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue bs_valueWithCGPoint:](NSValue, "bs_valueWithCGPoint:", v9[4], v9[5]));
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)normalizedGlobalPointerPosition
{
  NSString *v3;
  void *v4;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x3010000000;
  v12 = 0;
  v13 = 0;
  v11 = &unk_1000D4F2B;
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001EF98;
  v7[3] = &unk_1000E98E8;
  v7[4] = self;
  v7[5] = &v8;
  -[BKMousePointerServiceServer _accessStateForReason:entitlement:logEntitlementOnFailure:usingBlock:](self, "_accessStateForReason:entitlement:logEntitlementOnFailure:usingBlock:", v4, BKPointerAutomationEntitlement, 0, v7);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue bs_valueWithCGPoint:](NSValue, "bs_valueWithCGPoint:", v9[4], v9[5]));
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)setGlobalPointerPosition:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  void *v10;
  _QWORD v11[6];

  objc_msgSend(a3, "bs_CGPointValue");
  v6 = v5;
  v8 = v7;
  v9 = NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001EF38;
  v11[3] = &unk_1000E9908;
  v11[4] = v6;
  v11[5] = v8;
  -[BKMousePointerServiceServer _accessStateForReason:entitlement:logEntitlementOnFailure:usingBlock:](self, "_accessStateForReason:entitlement:logEntitlementOnFailure:usingBlock:", v10, BKPointerAutomationEntitlement, 0, v11);

}

- (void)setPointerPosition:(id)a3 onDisplay:(id)a4 withAnimationParameters:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSString *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = BKPointerRepositioningEntitlement;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10001EE70;
  v18[3] = &unk_1000E9930;
  v19 = v10;
  v20 = v9;
  v21 = v11;
  v15 = v11;
  v16 = v9;
  v17 = v10;
  -[BKMousePointerServiceServer _accessStateForReason:entitlement:logEntitlementOnFailure:usingBlock:](self, "_accessStateForReason:entitlement:logEntitlementOnFailure:usingBlock:", v13, v14, 1, v18);

}

- (void)setContextRelativePointerPosition:(id)a3 onDisplay:(id)a4 withAnimationParameters:(id)a5 restrictingToPID:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSString *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = NSStringFromSelector(a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = BKPointerRepositioningEntitlement;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10001EDDC;
  v22[3] = &unk_1000E9958;
  v23 = v14;
  v24 = v11;
  v25 = v12;
  v26 = v13;
  v18 = v13;
  v19 = v12;
  v20 = v11;
  v21 = v14;
  -[BKMousePointerServiceServer _accessStateForReason:entitlement:logEntitlementOnFailure:usingBlock:](self, "_accessStateForReason:entitlement:logEntitlementOnFailure:usingBlock:", v16, v17, 1, v22);

}

- (void)setContextRelativePointerPosition:(id)a3 withInitialVelocity:(id)a4 onDisplay:(id)a5 withDecelerationRate:(id)a6 restrictingToPID:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSString *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = NSStringFromSelector(a2);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = BKPointerRepositioningEntitlement;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10001ED34;
  v26[3] = &unk_1000E9980;
  v27 = v17;
  v28 = v13;
  v29 = v14;
  v30 = v15;
  v31 = v16;
  v21 = v16;
  v22 = v15;
  v23 = v14;
  v24 = v13;
  v25 = v17;
  -[BKMousePointerServiceServer _accessStateForReason:entitlement:logEntitlementOnFailure:usingBlock:](self, "_accessStateForReason:entitlement:logEntitlementOnFailure:usingBlock:", v19, v20, 1, v26);

}

- (void)applyAssertionParametersOnDisplay:(id)a3 withOptionsMask:(id)a4
{
  id v6;
  unint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a3;
  v7 = (unint64_t)objc_msgSend(a4, "unsignedIntegerValue");
  v8 = v6;
  v9 = objc_msgSend(v8, "length");
  v10 = (void *)BKSDisplayUUIDMainKey;
  if (v9)
    v10 = v8;
  v12 = v10;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKMousePointerServiceServer _perDisplayClientInfoForCurrentConnectionWithDisplayUUID:createIfNeeded:](self, "_perDisplayClientInfoForCurrentConnectionWithDisplayUUID:createIfNeeded:", v12, 1));
  -[BKMousePointerServiceServer _assertModelUpdatesSuppressed:displayUUID:clientDisplayInfo:](self, "_assertModelUpdatesSuppressed:displayUUID:clientDisplayInfo:", (v7 >> 1) & 1, v12, v11);

}

- (void)setSuppressAllEvents:(id)a3
{
  id v5;
  NSString *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v6 = NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = BKPointerGlobalEventRoutingEntitlement;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001EC38;
  v10[3] = &unk_1000E99A8;
  v11 = v5;
  v9 = v5;
  -[BKMousePointerServiceServer _accessStateForReason:entitlement:logEntitlementOnFailure:usingBlock:](self, "_accessStateForReason:entitlement:logEntitlementOnFailure:usingBlock:", v7, v8, 1, v10);

}

- (void)acquireButtonDownPointerRepositionAssertionWithUniqueIdentifier:(id)a3 forReason:(id)a4 contextRelativePointerPosition:(id)a5 onDisplay:(id)a6 restrictingToPID:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  NSString *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  _QWORD v25[4];
  NSObject *v26;
  id v27;
  id v28;
  BKMousePointerServiceServer *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v19 = v17;
  if (v14 && v13 && v15)
  {
    v20 = NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = BKPointerRepositioningEntitlement;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10001EADC;
    v25[3] = &unk_1000E99D0;
    v26 = v19;
    v27 = v16;
    v28 = v13;
    v29 = self;
    v30 = v14;
    v31 = v15;
    -[BKMousePointerServiceServer _accessStateForReason:entitlement:logEntitlementOnFailure:usingBlock:](self, "_accessStateForReason:entitlement:logEntitlementOnFailure:usingBlock:", v21, v22, 1, v25);

    v23 = v26;
  }
  else
  {
    v24 = BKLogMousePointer(v17, v18);
    v23 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v33 = v13;
      v34 = 2114;
      v35 = v15;
      v36 = 2114;
      v37 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "nil arguments to acquireButtonDownPointerRepositionAssertionWithUniqueIdentifier: %{public}@ %{public}@ %{public}@", buf, 0x20u);
    }
  }

}

- (void)invalidateButtonDownPointerRepositionAssertionWithUniqueIdentifier:(id)a3 onDisplay:(id)a4
{
  id v7;
  id v8;
  NSString *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v9 = NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = BKPointerRepositioningEntitlement;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10001E9F4;
    v12[3] = &unk_1000E99F8;
    v13 = v8;
    v14 = v7;
    -[BKMousePointerServiceServer _accessStateForReason:entitlement:logEntitlementOnFailure:usingBlock:](self, "_accessStateForReason:entitlement:logEntitlementOnFailure:usingBlock:", v10, v11, 1, v12);

  }
}

- (void)setGlobalPointerEventRoutes:(id)a3 forDisplay:(id)a4
{
  id v7;
  id v8;
  NSString *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = BKPointerGlobalEventRoutingEntitlement;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001E954;
  v14[3] = &unk_1000E99F8;
  v15 = v8;
  v16 = v7;
  v12 = v7;
  v13 = v8;
  -[BKMousePointerServiceServer _accessStateForReason:entitlement:logEntitlementOnFailure:usingBlock:](self, "_accessStateForReason:entitlement:logEntitlementOnFailure:usingBlock:", v10, v11, 1, v14);

}

- (void)getHitTestContextsAtPoint:(id)a3 withAdditionalContexts:(id)a4 onDisplay:(id)a5 withCompletion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSString *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  unsigned __int8 v22;
  void *v23;
  void *v24;
  void *v25;
  void **v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, void *, void *);
  void *v29;
  BKMousePointerServiceServer *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  SEL v35;
  NSErrorUserInfoKey v36;
  void *v37;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = NSStringFromSelector(a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = BKPointerHitTestingEntitlement;
  v26 = _NSConcreteStackBlock;
  v27 = 3221225472;
  v28 = sub_10001E7C8;
  v29 = &unk_1000E9A20;
  v35 = a2;
  v30 = self;
  v18 = v11;
  v31 = v18;
  v19 = v12;
  v32 = v19;
  v20 = v13;
  v33 = v20;
  v21 = v14;
  v34 = v21;
  v22 = -[BKMousePointerServiceServer _accessStateForReason:entitlement:logEntitlementOnFailure:usingBlock:](self, "_accessStateForReason:entitlement:logEntitlementOnFailure:usingBlock:", v16, v17, 1, &v26);

  if (v21 && (v22 & 1) == 0)
  {
    v36 = NSLocalizedFailureReasonErrorKey;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("missing entitlement: %@"), v17, v26, v27, v28, v29, v30, v31, v32, v33));
    v37 = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 1, v24));

    (*((void (**)(id, _QWORD, _QWORD, void *))v21 + 2))(v21, 0, 0, v25);
  }

}

- (void)setMousePointerPreferenceObservationEnabled:(id)a3
{
  id v5;
  NSString *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  BKMousePointerServiceServer *v12;

  v5 = a3;
  v6 = NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = BKPointerPreferencesEntitlement;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001E6CC;
  v10[3] = &unk_1000E99F8;
  v11 = v5;
  v12 = self;
  v9 = v5;
  -[BKMousePointerServiceServer _accessStateForReason:entitlement:logEntitlementOnFailure:usingBlock:](self, "_accessStateForReason:entitlement:logEntitlementOnFailure:usingBlock:", v7, v8, 1, v10);

}

- (id)preferencesForDevice:(id)a3
{
  id v5;
  NSString *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_10001E630;
  v19 = sub_10001E640;
  v20 = 0;
  v6 = NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = BKPointerPreferencesEntitlement;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001E690;
  v12[3] = &unk_1000E9A48;
  v14 = &v15;
  v12[4] = self;
  v9 = v5;
  v13 = v9;
  -[BKMousePointerServiceServer _accessStateForReason:entitlement:logEntitlementOnFailure:usingBlock:](self, "_accessStateForReason:entitlement:logEntitlementOnFailure:usingBlock:", v7, v8, 1, v12);

  v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

- (void)setPreferences:(id)a3 forDevice:(id)a4
{
  id v7;
  id v8;
  NSString *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = BKPointerPreferencesEntitlement;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001E684;
  v14[3] = &unk_1000E99F8;
  v15 = v7;
  v16 = v8;
  v12 = v8;
  v13 = v7;
  -[BKMousePointerServiceServer _accessStateForReason:entitlement:logEntitlementOnFailure:usingBlock:](self, "_accessStateForReason:entitlement:logEntitlementOnFailure:usingBlock:", v10, v11, 1, v14);

}

- (id)globalDevicePreferences
{
  NSString *v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_10001E630;
  v12 = sub_10001E640;
  v13 = 0;
  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001E648;
  v7[3] = &unk_1000E98E8;
  v7[4] = self;
  v7[5] = &v8;
  -[BKMousePointerServiceServer _accessStateForReason:entitlement:logEntitlementOnFailure:usingBlock:](self, "_accessStateForReason:entitlement:logEntitlementOnFailure:usingBlock:", v4, BKPointerPreferencesEntitlement, 1, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)setGlobalDevicePreferences:(id)a3
{
  id v5;
  NSString *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v6 = NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = BKPointerPreferencesEntitlement;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001E624;
  v10[3] = &unk_1000E99A8;
  v11 = v5;
  v9 = v5;
  -[BKMousePointerServiceServer _accessStateForReason:entitlement:logEntitlementOnFailure:usingBlock:](self, "_accessStateForReason:entitlement:logEntitlementOnFailure:usingBlock:", v7, v8, 1, v10);

}

- (void)mousePointerGlobalDevicePreferencesDidChange:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001E510;
  v7[3] = &unk_1000ECD80;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_queue_removeConnection:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  id v21;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = BKLogMousePointer(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138543362;
    v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Connection: Remove: %{public}@", (uint8_t *)&v20, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceConnection currentContext](BSServiceConnection, "currentContext"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "remoteProcess"));
  v11 = objc_msgSend(v10, "pid");

  -[BKMousePointerController stopRoutingGlobalEventsForPID:](self->_mousePointerController, "stopRoutingGlobalEventsForPID:", v11);
  -[BKMousePointerController setEventsDisabled:pid:](self->_mousePointerController, "setEventsDisabled:pid:", 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userInfo"));
  v14 = objc_opt_class(_BKMousePointerServerClientRecord, v13);
  v15 = v12;
  v16 = v15;
  if (v14)
  {
    if ((objc_opt_isKindOfClass(v15, v14) & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
  }
  else
  {
    v17 = 0;
  }
  v18 = v17;

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "perDisplayUUIDInfo"));
    objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", &stru_1000E9AD0);

  }
  -[NSMutableSet removeObject:](self->_deviceObservingConnections, "removeObject:", v4);
  -[NSMutableSet removeObject:](self->_preferenceObservingConnections, "removeObject:", v4);

}

- (id)_perDisplayClientInfoForCurrentConnectionWithDisplayUUID:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceConnection currentContext](BSServiceConnection, "currentContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v9 = objc_opt_class(_BKMousePointerServerClientRecord, v8);
  v10 = v7;
  v11 = v10;
  if (v9)
  {
    if ((objc_opt_isKindOfClass(v10, v9) & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "infoForDisplayUUID:createIfNeeded:", v5, v4));
  return v14;
}

- (void)_assertModelUpdatesSuppressed:(BOOL)a3 displayUUID:(id)a4 clientDisplayInfo:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  _BOOL4 v20;
  BKMousePointerController *mousePointerController;
  void *v22;
  void *v23;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  _BYTE v27[14];

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceConnection currentContext](BSServiceConnection, "currentContext"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "remoteProcess"));
  v12 = objc_msgSend(v11, "pid");

  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "modelUpdateAssertion"));
  v15 = (void *)v13;
  if (v6 || !v13)
  {
    v18 = BKLogMousePointer(v13, v14);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (!v6 || v15)
    {
      if (v20)
      {
        *(_DWORD *)buf = 67109634;
        v25 = v6;
        v26 = 1024;
        *(_DWORD *)v27 = (_DWORD)v12;
        *(_WORD *)&v27[4] = 2114;
        *(_QWORD *)&v27[6] = v8;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Assert model updates suppression change no-op (%{BOOL}u}) by pid:%d for displayUUID: %{public}@", buf, 0x18u);
      }

    }
    else
    {
      if (v20)
      {
        *(_DWORD *)buf = 67109378;
        v25 = (int)v12;
        v26 = 2114;
        *(_QWORD *)v27 = v8;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Assert model updates suppressed by pid:%d for displayUUID: %{public}@", buf, 0x12u);
      }

      mousePointerController = self->_mousePointerController;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("pid %d"), v12));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKMousePointerController suppressPointerModelUpdatesAssertionForDisplay:reason:](mousePointerController, "suppressPointerModelUpdatesAssertionForDisplay:reason:", v8, v22));

      objc_msgSend(v9, "setModelUpdateAssertion:", v23);
    }
  }
  else
  {
    v16 = BKLogMousePointer(v13, v14);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      v25 = (int)v12;
      v26 = 2114;
      *(_QWORD *)v27 = v8;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Assert model updates no longer suppressed by pid:%d for displayUUID: %{public}@", buf, 0x12u);
    }

    objc_msgSend(v15, "invalidate");
    objc_msgSend(v9, "setModelUpdateAssertion:", 0);
  }

}

- (BOOL)_accessStateForReason:(id)a3 entitlement:(id)a4 logEntitlementOnFailure:(BOOL)a5 usingBlock:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void (**v12)(id, BKMousePointerController *, id, void *);
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  int v32;
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, BKMousePointerController *, id, void *))a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[BSServiceConnection currentContext](BSServiceConnection, "currentContext"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "userInfo"));
  v16 = objc_opt_class(_BKMousePointerServerClientRecord, v15);
  v17 = v14;
  v18 = v17;
  if (v16)
  {
    if ((objc_opt_isKindOfClass(v17, v16) & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
  }
  else
  {
    v19 = 0;
  }
  v20 = v19;

  v21 = objc_msgSend(v20, "hasEntitlement:", v11);
  v23 = (char)v21;
  if (!(_DWORD)v21)
  {
    v24 = BKLogMousePointer(v21, v22);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v26)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "remoteProcess"));
        v32 = 138543874;
        v33 = v27;
        v34 = 2114;
        v35 = v10;
        v36 = 2114;
        v37 = v11;
        v28 = "process %{public}@ attempted to %{public}@ but does not have the %{public}@ entitlement";
        v29 = v25;
        v30 = 32;
LABEL_15:
        _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, v28, (uint8_t *)&v32, v30);

      }
    }
    else if (v26)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "remoteProcess"));
      v32 = 138543618;
      v33 = v27;
      v34 = 2114;
      v35 = v10;
      v28 = "process %{public}@ attempted to %{public}@ but is not allowed";
      v29 = v25;
      v30 = 22;
      goto LABEL_15;
    }

    goto LABEL_13;
  }
  v12[2](v12, self->_mousePointerController, v20, v13);
LABEL_13:

  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_preferenceObservingConnections, 0);
  objc_storeStrong((id *)&self->_deviceObservingConnections, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_mousePointerController, 0);
}

@end
