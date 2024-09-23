@implementation EndpointManager

+ (id)instance
{
  if (qword_1000C9030 != -1)
    dispatch_once(&qword_1000C9030, &stru_1000AD370);
  return (id)qword_1000C9028;
}

- (void)setPersist:(BOOL)a3
{
  -[EndpointManager setShouldPersist:](self, "setShouldPersist:", a3);
  -[EndpointManager refreshPersistanceAssertion](self, "refreshPersistanceAssertion");
}

- (void)connectDevice:(id)a3 quickDisconnectEnabled:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[EndpointManager deviceManagementEndpoint](self, "deviceManagementEndpoint"));
  objc_msgSend(v8, "connectDevice:quickDisconnectEnabled:", v7, v6);

}

- (void)disconnectDevice:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[EndpointManager deviceManagementEndpoint](self, "deviceManagementEndpoint"));
  objc_msgSend(v5, "disconnectDevice:", v4);

}

- (void)unexpectedDisconnection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[EndpointManager deviceManagementEndpoint](self, "deviceManagementEndpoint"));
  objc_msgSend(v5, "unexpectedDisconnection:", v4);

}

- (void)requestVersionInfo:(id)a3 cloudAccount:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[EndpointManager deviceManagementEndpoint](self, "deviceManagementEndpoint"));
  objc_msgSend(v8, "requestVersionInfo:cloudAccount:", v7, v6);

}

- (void)respondVersionInfo:(id)a3 cloudAccount:(id)a4 easyPairingStatus:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[EndpointManager deviceManagementEndpoint](self, "deviceManagementEndpoint"));
  objc_msgSend(v11, "respondVersionInfo:cloudAccount:easyPairingStatus:", v10, v9, v8);

}

- (void)requestPairStateForDevice:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[EndpointManager deviceManagementEndpoint](self, "deviceManagementEndpoint"));
  objc_msgSend(v5, "requestPairStateForDevice:", v4);

}

- (void)respondToPairState:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[EndpointManager deviceManagementEndpoint](self, "deviceManagementEndpoint"));
  objc_msgSend(v8, "respondToPairState:device:", v7, v6);

}

- (void)requestStoreLinkKey:(id)a3 name:(id)a4 device:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[EndpointManager deviceManagementEndpoint](self, "deviceManagementEndpoint"));
  objc_msgSend(v11, "requestStoreLinkKey:name:device:", v10, v9, v8);

}

- (void)requestStoreLinkKeyExtended:(id)a3 name:(id)a4 device:(id)a5 deviceServiceMask:(id)a6 classOfDevice:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (id)objc_claimAutoreleasedReturnValue(-[EndpointManager deviceManagementEndpoint](self, "deviceManagementEndpoint"));
  objc_msgSend(v17, "requestStoreLinkKeyExtended:name:device:deviceServiceMask:classOfDevice:", v16, v15, v14, v13, v12);

}

- (void)respondToStoreLinkKey:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[EndpointManager deviceManagementEndpoint](self, "deviceManagementEndpoint"));
  objc_msgSend(v8, "respondToStoreLinkKey:device:", v7, v6);

}

- (void)storeDeviceSettings:(id)a3 inEarEnable:(id)a4 doubleTapMode:(id)a5 deviceSettings:(id)a6 deviceName:(id)a7 device:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = (id)objc_claimAutoreleasedReturnValue(-[EndpointManager deviceManagementEndpoint](self, "deviceManagementEndpoint"));
  objc_msgSend(v20, "storeDeviceSettings:inEarEnable:doubleTapMode:deviceSettings:deviceName:device:", v19, v18, v17, v16, v15, v14);

}

- (void)notifyPrimaryBudSide:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[EndpointManager deviceManagementEndpoint](self, "deviceManagementEndpoint"));
  objc_msgSend(v8, "notifyPrimaryBudSide:device:", v7, v6);

}

- (void)requestLeaEasyPair:(id)a3 deviceIdentifier:(id)a4 deviceTags:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[EndpointManager deviceManagementEndpoint](self, "deviceManagementEndpoint"));
  objc_msgSend(v11, "requestLeaEasyPair:deviceIdentifier:deviceTags:", v10, v9, v8);

}

- (void)respondToLeaEasyPair:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[EndpointManager deviceManagementEndpoint](self, "deviceManagementEndpoint"));
  objc_msgSend(v8, "respondToLeaEasyPair:device:", v7, v6);

}

- (void)requestLeaStoreBondingInfo:(id)a3 rand:(id)a4 ltk:(id)a5 irk:(id)a6 name:(id)a7 device:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = (id)objc_claimAutoreleasedReturnValue(-[EndpointManager deviceManagementEndpoint](self, "deviceManagementEndpoint"));
  objc_msgSend(v20, "requestLeaStoreBondingInfo:rand:ltk:irk:name:device:", v19, v18, v17, v16, v15, v14);

}

- (void)respondToLeaStoreBondingInfo:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[EndpointManager deviceManagementEndpoint](self, "deviceManagementEndpoint"));
  objc_msgSend(v8, "respondToLeaStoreBondingInfo:device:", v7, v6);

}

- (EndpointManager)init
{
  EndpointManager *v2;
  CBScalablePipeManager *v3;
  CBScalablePipeManager *pipeManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EndpointManager;
  v2 = -[EndpointManager init](&v6, "init");
  if (v2)
  {
    v3 = (CBScalablePipeManager *)objc_msgSend(objc_alloc((Class)CBScalablePipeManager), "initWithDelegate:queue:", v2, &_dispatch_main_q);
    pipeManager = v2->_pipeManager;
    v2->_pipeManager = v3;

  }
  return v2;
}

- (void)refreshPersistanceAssertion
{
  void *v3;
  unsigned int v4;
  void *v5;
  uint64_t v6;
  NSString *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointManager pipeManager](self, "pipeManager"));
  if (objc_msgSend(v3, "state") == (id)4)
  {

LABEL_6:
    -[EndpointManager setPersistanceAssertion:](self, "setPersistanceAssertion:", 0);
    return;
  }
  v4 = -[EndpointManager shouldPersist](self, "shouldPersist");

  if (!v4)
    goto LABEL_6;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointManager persistanceAssertion](self, "persistanceAssertion"));

  if (!v5)
  {
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.%@"), objc_opt_class(self, v6));
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v7));
    v8 = (void *)os_transaction_create(objc_msgSend(v9, "UTF8String"));
    -[EndpointManager setPersistanceAssertion:](self, "setPersistanceAssertion:", v8);

  }
}

- (void)scalablePipeManagerDidUpdateState:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  DeviceManagementEndpoint *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  void *v18;

  v4 = a3;
  v5 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointManager scalablePipeManagerStateString](self, "scalablePipeManagerStateString"));
    v17 = 138412290;
    v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ScalablePipeManager state is now %@", (uint8_t *)&v17, 0xCu);

  }
  -[EndpointManager refreshPersistanceAssertion](self, "refreshPersistanceAssertion");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointManager pipeManager](self, "pipeManager"));
  v9 = objc_msgSend(v8, "state");

  if (v9 == (id)5)
  {
    v10 = objc_alloc_init(DeviceManagementEndpoint);
    -[EndpointManager setDeviceManagementEndpoint:](self, "setDeviceManagementEndpoint:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointManager pipeManager](self, "pipeManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointManager deviceManagementEndpoint](self, "deviceManagementEndpoint"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointManager deviceManagementEndpoint](self, "deviceManagementEndpoint"));
    v15 = objc_msgSend(v14, "type");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointManager deviceManagementEndpoint](self, "deviceManagementEndpoint"));
    objc_msgSend(v11, "registerEndpoint:type:priority:", v13, v15, objc_msgSend(v16, "priority"));

  }
  else
  {
    -[EndpointManager setDeviceManagementEndpoint:](self, "setDeviceManagementEndpoint:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointManager pipeManager](self, "pipeManager"));
    objc_msgSend(v11, "unregisterAllEndpoints");
  }

}

- (void)scalablePipeManager:(id)a3 didRegisterEndpoint:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = qword_1000C9178;
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006A89C((uint64_t)v8, (uint64_t)v9, v10);
  }
  else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Successfully registered endpoint \"%@\", (uint8_t *)&v11, 0xCu);
  }

}

- (void)scalablePipeManager:(id)a3 didUnregisterEndpoint:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;

  v4 = a4;
  v5 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Unregistered endpoint \"%@\", (uint8_t *)&v6, 0xCu);
  }

}

- (void)scalablePipeManager:(id)a3 pipeDidConnect:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointManager endpointForPipe:](self, "endpointForPipe:", v5));
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "addPipe:", v5);
  }
  else
  {
    v8 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006A91C((uint64_t)v5, v8, v9, v10, v11, v12, v13, v14);
  }

}

- (void)scalablePipeManager:(id)a3 pipeDidDisconnect:(id)a4 error:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointManager endpointForPipe:](self, "endpointForPipe:", v6));
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "removePipe:", v6);
  }
  else
  {
    v9 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006A980((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
  }

}

- (id)endpointForPipe:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointManager deviceManagementEndpoint](self, "deviceManagementEndpoint"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));

  LODWORD(v4) = objc_msgSend(v6, "isEqualToString:", v7);
  if ((_DWORD)v4)
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointManager deviceManagementEndpoint](self, "deviceManagementEndpoint"));
  else
    v8 = 0;
  return v8;
}

- (id)scalablePipeManagerStateString
{
  void *v2;
  char *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[EndpointManager pipeManager](self, "pipeManager"));
  v3 = (char *)objc_msgSend(v2, "state");

  if ((unint64_t)(v3 - 1) > 4)
    return CFSTR("unknown");
  else
    return off_1000AD390[(_QWORD)(v3 - 1)];
}

- (CBScalablePipeManager)pipeManager
{
  return self->_pipeManager;
}

- (void)setPipeManager:(id)a3
{
  objc_storeStrong((id *)&self->_pipeManager, a3);
}

- (DeviceManagementEndpoint)deviceManagementEndpoint
{
  return self->_deviceManagementEndpoint;
}

- (void)setDeviceManagementEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_deviceManagementEndpoint, a3);
}

- (BOOL)shouldPersist
{
  return self->_shouldPersist;
}

- (void)setShouldPersist:(BOOL)a3
{
  self->_shouldPersist = a3;
}

- (OS_os_transaction)persistanceAssertion
{
  return self->_persistanceAssertion;
}

- (void)setPersistanceAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_persistanceAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistanceAssertion, 0);
  objc_storeStrong((id *)&self->_deviceManagementEndpoint, 0);
  objc_storeStrong((id *)&self->_pipeManager, 0);
}

@end
