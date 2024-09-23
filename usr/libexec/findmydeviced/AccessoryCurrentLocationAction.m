@implementation AccessoryCurrentLocationAction

- (AccessoryCurrentLocationAction)initWithAccessory:(id)a3 locator:(id)a4 event:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  AccessoryCurrentLocationAction *v13;
  AccessoryCurrentLocationAction *v14;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)AccessoryCurrentLocationAction;
  v13 = -[AccessoryCurrentLocationAction init](&v16, "init");
  v14 = v13;
  if (v13)
  {
    -[AccessoryCurrentLocationAction setAccessory:](v13, "setAccessory:", v10);
    -[AccessoryCurrentLocationAction setLocator:](v14, "setLocator:", v11);
    -[AccessoryCurrentLocationAction setEvent:](v14, "setEvent:", a5);
    -[AccessoryCurrentLocationAction setActionCompletion:](v14, "setActionCompletion:", v12);
  }

  return v14;
}

- (id)actionType
{
  return CFSTR("AccessoryCurrentLocationAction");
}

- (void)willCancelAction
{
  -[AccessoryCurrentLocationAction _stopLocator](self, "_stopLocator");
  -[AccessoryCurrentLocationAction _finishAction](self, "_finishAction");
}

- (void)runWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  -[AccessoryCurrentLocationAction setCompletion:](self, "setCompletion:", a3);
  v4 = sub_1000031B8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Accessory current location : accessory is connected.", v6, 2u);
  }

  -[AccessoryCurrentLocationAction _retrieveLocationNow](self, "_retrieveLocationNow");
}

- (BOOL)shouldCancelAction:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryCurrentLocationAction accessory](self, "accessory"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessoryIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessory"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accessoryIdentifier"));
    v11 = objc_msgSend(v8, "isEqual:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)shouldWaitForAction:(id)a3
{
  return 0;
}

- (void)_retrieveLocationNow
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22[2];
  id location;
  id buf[2];

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Accessory current location requesting location.", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryCurrentLocationAction locator](self, "locator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryCurrentLocationAction accessory](self, "accessory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessoryIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));

  v9 = -[AccessoryCurrentLocationAction event](self, "event");
  objc_initWeak(&location, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "locatorPublisher"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000B974;
  v19[3] = &unk_1002C1300;
  objc_copyWeak(&v21, buf);
  v11 = v8;
  v20 = v11;
  v22[1] = v9;
  objc_copyWeak(v22, &location);
  objc_msgSend(v10, "startPublishingWithBlock:", v19);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000BAB0;
  v16[3] = &unk_1002C11E8;
  objc_copyWeak(&v18, buf);
  v12 = v11;
  v17 = v12;
  objc_msgSend(v5, "setStoppedLocatorBlock:", v16);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000BBBC;
  v14[3] = &unk_1002C1328;
  v15 = v5;
  v13 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(v22);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  objc_destroyWeak(buf);
}

- (void)_finishAction
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void (**v9)(_QWORD);
  uint8_t v10[16];

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Accessory current location terminating.", v10, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryCurrentLocationAction discoveryWaitTimer](self, "discoveryWaitTimer"));
  objc_msgSend(v5, "cancel");

  -[AccessoryCurrentLocationAction setDiscoveryWaitTimer:](self, "setDiscoveryWaitTimer:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryCurrentLocationAction actionCompletion](self, "actionCompletion"));

  if (v6)
  {
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[AccessoryCurrentLocationAction actionCompletion](self, "actionCompletion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryCurrentLocationAction location](self, "location"));
    ((void (**)(_QWORD, void *))v7)[2](v7, v8);

    -[AccessoryCurrentLocationAction setActionCompletion:](self, "setActionCompletion:", 0);
  }
  v9 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue(-[AccessoryCurrentLocationAction completion](self, "completion"));
  -[AccessoryCurrentLocationAction setCompletion:](self, "setCompletion:", 0);
  if (v9)
    v9[2](v9);

}

- (void)_completeLocate
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  v3 = objc_alloc_init((Class)FMFuture);
  -[AccessoryCurrentLocationAction setAccessoryUpdateFuture:](self, "setAccessoryUpdateFuture:", v3);

  objc_initWeak(&location, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryCurrentLocationAction accessoryUpdateFuture](self, "accessoryUpdateFuture"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000BEA8;
  v12[3] = &unk_1002C1350;
  objc_copyWeak(&v13, &location);
  v5 = objc_msgSend(v4, "addCompletionBlock:", v12);

  v6 = objc_alloc((Class)FMDispatchTimer);
  v7 = &_dispatch_main_q;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000BED4;
  v10[3] = &unk_1002C1378;
  objc_copyWeak(&v11, &location);
  v8 = objc_msgSend(v6, "initWithQueue:timeout:completion:", &_dispatch_main_q, v10, 3.0);
  -[AccessoryCurrentLocationAction setDiscoveryWaitTimer:](self, "setDiscoveryWaitTimer:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryCurrentLocationAction discoveryWaitTimer](self, "discoveryWaitTimer"));
  objc_msgSend(v9, "start");

  -[AccessoryCurrentLocationAction validateAccessoryDiscoveryDate](self, "validateAccessoryDiscoveryDate");
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_stopLocator
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[AccessoryCurrentLocationAction locator](self, "locator"));
  -[AccessoryCurrentLocationAction setLocator:](self, "setLocator:", 0);
  objc_msgSend(v3, "stopLocator");

}

- (void)validateAccessoryDiscoveryDate
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryCurrentLocationAction accessory](self, "accessory"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastDiscoveryDate"));

  objc_msgSend(v7, "timeIntervalSinceNow");
  if (v4 >= -60.0)
  {
    -[AccessoryCurrentLocationAction updateLocationMetaData](self, "updateLocationMetaData");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryCurrentLocationAction accessoryUpdateFuture](self, "accessoryUpdateFuture"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryCurrentLocationAction location](self, "location"));
    objc_msgSend(v5, "finishWithResult:", v6);

  }
}

- (void)updateLocationMetaData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryCurrentLocationAction accessory](self, "accessory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastKnownLocationDeviceInfo"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryCurrentLocationAction location](self, "location"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metaDataRecord"));
  v8 = CFSTR("deviceInfo");
  v9 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
  objc_msgSend(v6, "appendMetaData:", v7);

}

- (void)accessoryDidUpdate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accessoryIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AccessoryCurrentLocationAction accessory](self, "accessory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accessoryIdentifier"));
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if (v7)
  {
    -[AccessoryCurrentLocationAction setAccessory:](self, "setAccessory:", v8);
    -[AccessoryCurrentLocationAction validateAccessoryDiscoveryDate](self, "validateAccessoryDiscoveryDate");
  }

}

- (FMDInternalAccessory)accessory
{
  return (FMDInternalAccessory *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccessory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (FMDLocator)locator
{
  return self->_locator;
}

- (void)setLocator:(id)a3
{
  objc_storeStrong((id *)&self->_locator, a3);
}

- (int64_t)event
{
  return self->_event;
}

- (void)setEvent:(int64_t)a3
{
  self->_event = a3;
}

- (id)actionCompletion
{
  return self->_actionCompletion;
}

- (void)setActionCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (FMDLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (FMFuture)accessoryUpdateFuture
{
  return self->_accessoryUpdateFuture;
}

- (void)setAccessoryUpdateFuture:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryUpdateFuture, a3);
}

- (FMDispatchTimer)discoveryWaitTimer
{
  return self->_discoveryWaitTimer;
}

- (void)setDiscoveryWaitTimer:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryWaitTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveryWaitTimer, 0);
  objc_storeStrong((id *)&self->_accessoryUpdateFuture, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong(&self->_actionCompletion, 0);
  objc_storeStrong((id *)&self->_locator, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
}

@end
