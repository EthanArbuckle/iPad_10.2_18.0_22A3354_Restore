@implementation ServerService

- (void)start
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[ServerServiceManager instance](ServerServiceManager, "instance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServerService service](self, "service"));
  objc_msgSend(v4, "addService:", v3);

}

- (void)stop
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[ServerServiceManager instance](ServerServiceManager, "instance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ServerService service](self, "service"));
  objc_msgSend(v4, "removeService:", v3);

}

- (void)respondToRequest:(id)a3 withResult:(int64_t)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[ServerServiceManager instance](ServerServiceManager, "instance"));
  objc_msgSend(v6, "respondToRequest:withResult:", v5, a4);

}

- (void)updateValue:(id)a3 forCharacteristic:(id)a4 onSubscribedCentrals:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[ServerServiceManager instance](ServerServiceManager, "instance"));
  objc_msgSend(v10, "updateValue:forCharacteristic:onSubscribedCentrals:", v9, v8, v7);

}

- (void)peripheralManagerDidUpdateState:(id)a3
{
  NSObject *v4;
  BOOL v5;

  if (objc_msgSend(a3, "state") == (id)10)
  {
    v4 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
      sub_10006FEB4(v4);
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  self->_restrictedMode = v5;
}

- (void)peripheralManager:(id)a3 didAddService:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)qword_1000C9178;
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006FEF4(v10, v8, (uint64_t)v9);
  }
  else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUID"));
    v13 = 138412290;
    v14 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Service \"%@\" has been published", (uint8_t *)&v13, 0xCu);

  }
}

- (CBMutableService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (BOOL)restrictedMode
{
  return self->_restrictedMode;
}

- (void)setRestrictedMode:(BOOL)a3
{
  self->_restrictedMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
}

@end
