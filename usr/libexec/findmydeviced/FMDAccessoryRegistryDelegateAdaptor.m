@implementation FMDAccessoryRegistryDelegateAdaptor

- (FMDAccessoryRegistryDelegateAdaptor)initWithAccessoryRegistry:(id)a3
{
  id v4;
  FMDAccessoryRegistryDelegateAdaptor *v5;
  FMDAccessoryRegistryDelegateAdaptor *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FMDAccessoryRegistryDelegateAdaptor;
  v5 = -[FMDAccessoryRegistryDelegateAdaptor init](&v8, "init");
  v6 = v5;
  if (v5)
    -[FMDAccessoryRegistryDelegateAdaptor setRegistry:](v5, "setRegistry:", v4);

  return v6;
}

- (void)companionRegistryDidUpdateAccessories:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistryDelegateAdaptor registry](self, "registry", a3));
  objc_msgSend(v3, "reloadData");

}

- (void)bluetoothManagerDidConnectDevice:(id)a3
{
  id v4;
  id v5;
  FMDBluetoothAccessory *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;

  v4 = a3;
  if (objc_msgSend(v4, "isTemporaryPaired"))
  {
    v5 = sub_1000031B8();
    v6 = (FMDBluetoothAccessory *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, &v6->super, OS_LOG_TYPE_DEFAULT, "BluetoothManager.DidConnectDevice Ignoring shared device %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    v6 = -[FMDBluetoothAccessory initWithBluetoothManagerDevice:]([FMDBluetoothAccessory alloc], "initWithBluetoothManagerDevice:", v4);
    v7 = sub_1000031B8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory accessoryIdentifier](v6, "accessoryIdentifier"));
      v11 = 138412290;
      v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FMDAccessoryRegistry bluetoothManagerDidConnectDevice %@", (uint8_t *)&v11, 0xCu);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistryDelegateAdaptor registry](self, "registry"));
    objc_msgSend(v10, "updateAccessory:", v6);

  }
}

- (void)bluetoothManagerDidDisconnectDevice:(id)a3
{
  id v4;
  id v5;
  FMDBluetoothAccessory *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;

  v4 = a3;
  if (objc_msgSend(v4, "isTemporaryPaired"))
  {
    v5 = sub_1000031B8();
    v6 = (FMDBluetoothAccessory *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, &v6->super, OS_LOG_TYPE_DEFAULT, "BluetoothManager.DidDisconnectDevice Ignoring shared device %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    v6 = -[FMDBluetoothAccessory initWithBluetoothManagerDevice:]([FMDBluetoothAccessory alloc], "initWithBluetoothManagerDevice:", v4);
    v7 = sub_1000031B8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory accessoryIdentifier](v6, "accessoryIdentifier"));
      v11 = 138412290;
      v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FMDAccessoryRegistry bluetoothManagerDidDisconnectDevice %@", (uint8_t *)&v11, 0xCu);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistryDelegateAdaptor registry](self, "registry"));
    objc_msgSend(v10, "updateAccessory:", v6);

  }
}

- (void)bluetoothManagerDidUnpairDevice:(id)a3
{
  id v4;
  id v5;
  FMDBluetoothAccessory *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;

  v4 = a3;
  if (objc_msgSend(v4, "isTemporaryPaired"))
  {
    v5 = sub_1000031B8();
    v6 = (FMDBluetoothAccessory *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, &v6->super, OS_LOG_TYPE_DEFAULT, "BluetoothManager.DidUnpairDevice Ignoring shared device %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    v6 = -[FMDBluetoothAccessory initWithBluetoothManagerDevice:]([FMDBluetoothAccessory alloc], "initWithBluetoothManagerDevice:", v4);
    v7 = sub_1000031B8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory accessoryIdentifier](v6, "accessoryIdentifier"));
      v11 = 138412290;
      v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FMDAccessoryRegistry bluetoothManagerDidUnpairDevice %@", (uint8_t *)&v11, 0xCu);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistryDelegateAdaptor registry](self, "registry"));
    objc_msgSend(v10, "removeAccessory:", v6);

  }
}

- (void)bluetoothManagerDidUpdateDevice:(id)a3
{
  id v4;
  id v5;
  FMDBluetoothAccessory *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;

  v4 = a3;
  if (objc_msgSend(v4, "isTemporaryPaired"))
  {
    v5 = sub_1000031B8();
    v6 = (FMDBluetoothAccessory *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, &v6->super, OS_LOG_TYPE_DEFAULT, "BluetoothManager.DidUpdateDevice Ignoring shared device %@", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    v6 = -[FMDBluetoothAccessory initWithBluetoothManagerDevice:]([FMDBluetoothAccessory alloc], "initWithBluetoothManagerDevice:", v4);
    v7 = sub_1000031B8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_opt_self(v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v11 = objc_opt_self(v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBluetoothAccessory accessoryIdentifier](v6, "accessoryIdentifier"));
      v15 = 134218498;
      v16 = v10;
      v17 = 2048;
      v18 = v12;
      v19 = 2112;
      v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FMDAccessoryRegistry FMDBluetoothManagerDevice(0x%lX) bluetoothManagerDidUpdateDevice FMDInternalAccessory(0x%lX) %@", (uint8_t *)&v15, 0x20u);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistryDelegateAdaptor registry](self, "registry"));
    objc_msgSend(v14, "updateAccessory:", v6);

  }
}

- (void)beaconsChanged
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[FMDAccessoryRegistryDelegateAdaptor registry](self, "registry"));
  objc_msgSend(v2, "reloadData");

}

- (FMDAccessoryRegistry)registry
{
  return self->_registry;
}

- (void)setRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_registry, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registry, 0);
}

@end
