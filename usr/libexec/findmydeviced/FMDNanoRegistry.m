@implementation FMDNanoRegistry

- (FMDNanoRegistry)init
{
  FMDNanoRegistry *v2;
  FMDNanoRegistry *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FMDNanoRegistry;
  v2 = -[FMDNanoRegistry init](&v5, "init");
  v3 = v2;
  if (v2)
    -[FMDNanoRegistry addObservers](v2, "addObservers");
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)FMDNanoRegistry;
  -[FMDNanoRegistry dealloc](&v4, "dealloc");
}

- (void)addObservers
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "deviceDidPair:", CFSTR("nano.devicedidpair"), 0);

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "deviceDidUnpair:", CFSTR("nano.devicedidunpair"), 0);

}

- (void)getAccessoriesWithCompletion:(id)a3
{
  id v5;
  id v6;

  if (a3)
  {
    v5 = a3;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[FMDNanoRegistry allAccessories](self, "allAccessories"));
    (*((void (**)(id, id, _QWORD))a3 + 2))(v5, v6, 0);

  }
}

- (id)activePairedDevice
{
  void *v2;
  void *v3;
  FMDNanoRegistryAccessory *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "getActivePairedDevice"));

  v4 = -[FMDNanoRegistryAccessory initWithNRDevice:]([FMDNanoRegistryAccessory alloc], "initWithNRDevice:", v3);
  return v4;
}

- (id)allAccessories
{
  id v3;
  NSObject *v4;
  uint8_t v6[16];

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMDNanoRegistry allAccessories", v6, 2u);
  }

  return (id)objc_claimAutoreleasedReturnValue(-[FMDNanoRegistry accessoriesWithProperty:](self, "accessoriesWithProperty:", 0));
}

- (id)pairedAccessories
{
  id v3;
  NSObject *v4;
  uint8_t v6[16];

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMDNanoRegistry pairedAccessories", v6, 2u);
  }

  return (id)objc_claimAutoreleasedReturnValue(-[FMDNanoRegistry accessoriesWithProperty:](self, "accessoriesWithProperty:", NRDevicePropertyIsPaired));
}

- (id)migratableAccessories
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoRegistry migratableAccessoriesByIdentifier](self, "migratableAccessoriesByIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));

  return v3;
}

- (id)migratableAccessoriesByIdentifier
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v15[4];
  id v16;
  uint8_t buf[16];

  v2 = sub_1000031B8();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FMDNanoRegistry migratedAccessories", buf, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NRMigrator sharedMigrator](NRMigrator, "sharedMigrator"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "migratableDevices"));
  v7 = (void *)v6;
  v8 = &__NSArray0__struct;
  if (v6)
    v8 = (void *)v6;
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NRMigrator sharedMigrator](NRMigrator, "sharedMigrator"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "migratableDevicesRequiringConsent"));

  if (v11)
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v11));

    v9 = (id)v12;
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002AD10;
  v15[3] = &unk_1002C22A8;
  v13 = v4;
  v16 = v13;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v15);

  return v13;
}

- (id)accessoriesWithProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDNanoRegistry migratableAccessoriesByIdentifier](self, "migratableAccessoriesByIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getAllDevices"));

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002AEAC;
  v14[3] = &unk_1002C22D0;
  v15 = v4;
  v16 = v5;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v17 = v8;
  v9 = v5;
  v10 = v4;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v14);
  v11 = v17;
  v12 = v8;

  return v12;
}

- (void)deviceDidPair:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FMDNanoRegistry delegate](self, "delegate", a3));
  if ((objc_opt_respondsToSelector(v4, "companionRegistryDidUpdateAccessories:") & 1) != 0)
    objc_msgSend(v4, "companionRegistryDidUpdateAccessories:", self);

}

- (void)deviceDidUnpair:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[FMDNanoRegistry delegate](self, "delegate", a3));
  if ((objc_opt_respondsToSelector(v4, "companionRegistryDidUpdateAccessories:") & 1) != 0)
    objc_msgSend(v4, "companionRegistryDidUpdateAccessories:", self);

}

- (FMDCompanionRegistryDelegate)delegate
{
  return (FMDCompanionRegistryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
