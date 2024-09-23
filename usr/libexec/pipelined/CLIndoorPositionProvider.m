@implementation CLIndoorPositionProvider

- (CLIndoorPositionProvider)initWithApiKey:(id)a3
{
  CLIndoorPositionProvider *v3;
  NSObject *v4;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLIndoorPositionProvider;
  v3 = -[CLIndoorXPCProvider init](&v7, "init", a3);
  if (qword_100417EE8 != -1)
  {
    dispatch_once(&qword_100417EE8, &stru_1003EE9A0);
    v4 = qword_100417EF0;
    if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_INFO))
      return v3;
    goto LABEL_3;
  }
  v4 = qword_100417EF0;
  if (os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Deprecated API.  Please call regular -init instead", v6, 2u);
  }
  return v3;
}

- (CLIndoorPositionProvider)initWithApiKey:(id)a3 onServer:(id)a4
{
  CLIndoorPositionProvider *v4;
  NSObject *v5;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLIndoorPositionProvider;
  v4 = -[CLIndoorXPCProvider init](&v8, "init", a3, a4);
  if (qword_100417EE8 != -1)
  {
    dispatch_once(&qword_100417EE8, &stru_1003EE9A0);
    v5 = qword_100417EF0;
    if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_INFO))
      return v4;
    goto LABEL_3;
  }
  v5 = qword_100417EF0;
  if (os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Deprecated API.  Please call regular -init instead", v7, 2u);
  }
  return v4;
}

- (CLIndoorPositionProvider)initWithConnection:(id)a3
{
  id v4;
  CLIndoorPositionProvider *v5;
  ServiceState *v6;
  ServiceState *state;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLIndoorPositionProvider;
  v5 = -[CLIndoorXPCProvider initWithConnection:](&v9, "initWithConnection:", v4);
  if (v5)
  {
    v6 = objc_alloc_init(ServiceState);
    state = v5->_state;
    v5->_state = v6;

  }
  return v5;
}

- (id)remoteObjectProtocol
{
  return &OBJC_PROTOCOL___CLIndoorProtocolPrivate;
}

- (id)endpointName
{
  return CFSTR("com.apple.pipelined");
}

- (id)withinQueuePermanentShutdownReason
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceState delegateProxy](self->_state, "delegateProxy"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "shutdownReason"));

  return v3;
}

- (BOOL)withinQueueCanReinitializeRemoteState
{
  return self->_state != 0;
}

- (void)withinQueueInvalidateState
{
  -[CLIndoorPositionProvider setState:](self, "setState:", 0);
}

- (void)withinQueueReinitializeRemoteState
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CLIndoorPositionProvider state](self, "state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegateProxy"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
  -[CLIndoorPositionProvider withinQueueSetDelegate:](self, "withinQueueSetDelegate:", v4);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[CLIndoorPositionProvider state](self, "state"));
  LODWORD(v3) = objc_msgSend(v7, "updateLocation");

  if ((_DWORD)v3)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[CLIndoorPositionProvider state](self, "state"));
    objc_msgSend(v8, "setUpdateLocation:", 0);

    v9 = (id)objc_claimAutoreleasedReturnValue(-[CLIndoorPositionProvider state](self, "state"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastLocation"));
    -[CLIndoorPositionProvider startUpdatingLocationAtLocation:](self, "startUpdatingLocationAtLocation:", v5);

  }
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *frameworkQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  frameworkQueue = self->super._frameworkQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000DE590;
  v7[3] = &unk_1003EE800;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(frameworkQueue, v7);

}

- (void)withinQueueSetDelegate:(id)a3
{
  IndoorProtocolProxy *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = -[IndoorProtocolProxy initWithDelegate:]([IndoorProtocolProxy alloc], "initWithDelegate:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorPositionProvider state](self, "state"));
  objc_msgSend(v5, "setDelegateProxy:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CLIndoorDelegateProtocolInternal));
  -[NSXPCConnection setExportedInterface:](self->super._connection, "setExportedInterface:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorPositionProvider state](self, "state"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "delegateProxy"));
  -[NSXPCConnection setExportedObject:](self->super._connection, "setExportedObject:", v8);

}

- (void)setApiKey:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a3;
  if (qword_100417EE8 != -1)
  {
    dispatch_once(&qword_100417EE8, &stru_1003EE9A0);
    v4 = qword_100417EF0;
    if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_ERROR))
      goto LABEL_4;
    goto LABEL_3;
  }
  v4 = qword_100417EF0;
  if (os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_ERROR))
  {
LABEL_3:
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "This API is deprecated. Please stop using", v5, 2u);
  }
LABEL_4:

}

- (void)setApiKey:(id)a3 onServer:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  v6 = a4;
  if (qword_100417EE8 != -1)
  {
    dispatch_once(&qword_100417EE8, &stru_1003EE9A0);
    v7 = qword_100417EF0;
    if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_ERROR))
      goto LABEL_4;
    goto LABEL_3;
  }
  v7 = qword_100417EF0;
  if (os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_ERROR))
  {
LABEL_3:
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "This API is deprecated. Please stop using", v8, 2u);
  }
LABEL_4:

}

- (void)playbackDatarun:(id)a3
{
  id v4;
  NSObject *frameworkQueue;
  CLIndoorPositionProvider *v6;
  id v7;
  CLIndoorPositionProvider *v8;
  _QWORD v9[4];
  CLIndoorPositionProvider *v10;
  id v11;

  v4 = a3;
  frameworkQueue = self->super._frameworkQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3321888768;
  v9[2] = sub_1000DE910;
  v9[3] = &unk_1003EE820;
  v6 = self;
  v7 = v4;
  v10 = v6;
  v11 = v7;
  v8 = v6;
  dispatch_async(frameworkQueue, v9);

}

- (void)startUpdatingLocationAtLocation:(id)a3
{
  id v4;
  NSObject *frameworkQueue;
  CLIndoorPositionProvider *v6;
  id v7;
  CLIndoorPositionProvider *v8;
  _QWORD v9[4];
  CLIndoorPositionProvider *v10;
  id v11;

  v4 = a3;
  frameworkQueue = self->super._frameworkQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3321888768;
  v9[2] = sub_1000DEB78;
  v9[3] = &unk_1003EE850;
  v6 = self;
  v7 = v4;
  v10 = v6;
  v11 = v7;
  v8 = v6;
  dispatch_async(frameworkQueue, v9);

}

- (void)stopUpdatingLocation
{
  NSObject *frameworkQueue;
  CLIndoorPositionProvider *v3;
  _QWORD block[4];
  CLIndoorPositionProvider *v5;

  frameworkQueue = self->super._frameworkQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_1000DF000;
  block[3] = &unk_1003EE880;
  v5 = self;
  v3 = v5;
  dispatch_async(frameworkQueue, block);

}

- (void)outdoorLocationAvailable:(id)a3
{
  id v4;
  NSObject *frameworkQueue;
  CLIndoorPositionProvider *v6;
  id v7;
  CLIndoorPositionProvider *v8;
  _QWORD v9[4];
  CLIndoorPositionProvider *v10;
  id v11;

  v4 = a3;
  frameworkQueue = self->super._frameworkQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3321888768;
  v9[2] = sub_1000DF318;
  v9[3] = &unk_1003EE8B0;
  v6 = self;
  v7 = v4;
  v10 = v6;
  v11 = v7;
  v8 = v6;
  dispatch_async(frameworkQueue, v9);

}

- (void)gpsEstimateAvailable:(id)a3
{
  id v4;
  NSObject *frameworkQueue;
  CLIndoorPositionProvider *v6;
  CLIndoorPositionProvider *v7;
  id v8;
  _QWORD block[4];
  CLIndoorPositionProvider *v10;
  id v11;

  v4 = a3;
  frameworkQueue = self->super._frameworkQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_1000DF7A0;
  block[3] = &unk_1003EE8E0;
  v6 = self;
  v8 = v4;
  v10 = v6;
  v11 = v8;
  v7 = v6;
  dispatch_sync(frameworkQueue, block);

}

- (void)gpsSignalQualityAvailable:(id)a3
{
  id v4;
  NSObject *frameworkQueue;
  CLIndoorPositionProvider *v6;
  CLIndoorPositionProvider *v7;
  id v8;
  _QWORD block[4];
  CLIndoorPositionProvider *v10;
  id v11;

  v4 = a3;
  frameworkQueue = self->super._frameworkQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_1000DF9CC;
  block[3] = &unk_1003EE910;
  v6 = self;
  v8 = v4;
  v10 = v6;
  v11 = v8;
  v7 = v6;
  dispatch_sync(frameworkQueue, block);

}

- (void)clVisionNotificationAvailable:(id)a3
{
  id v4;
  NSObject *frameworkQueue;
  CLIndoorPositionProvider *v6;
  CLIndoorPositionProvider *v7;
  id v8;
  _QWORD block[4];
  CLIndoorPositionProvider *v10;
  id v11;

  v4 = a3;
  frameworkQueue = self->super._frameworkQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_1000DFBF8;
  block[3] = &unk_1003EE940;
  v6 = self;
  v8 = v4;
  v10 = v6;
  v11 = v8;
  v7 = v6;
  dispatch_sync(frameworkQueue, block);

}

- (void)clpOutdoorEstimatorLogEntryNotificationAvailable:(id)a3
{
  id v4;
  NSObject *frameworkQueue;
  CLIndoorPositionProvider *v6;
  CLIndoorPositionProvider *v7;
  id v8;
  _QWORD block[4];
  CLIndoorPositionProvider *v10;
  id v11;

  v4 = a3;
  frameworkQueue = self->super._frameworkQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_1000DFE24;
  block[3] = &unk_1003EE970;
  v6 = self;
  v8 = v4;
  v10 = v6;
  v11 = v8;
  v7 = v6;
  dispatch_sync(frameworkQueue, block);

}

- (ServiceState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
}

@end
