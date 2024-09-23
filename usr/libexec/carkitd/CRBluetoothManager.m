@implementation CRBluetoothManager

+ (id)addressStringForData:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v11;
  __int16 v12;
  _BYTE v13[248];

  v3 = a3;
  v4 = v3;
  v12 = 0;
  v11 = 0;
  if (v3 && objc_msgSend(v3, "length") == (id)6)
  {
    objc_msgSend(v4, "getBytes:length:", &v11, 6);
    v5 = BTDeviceAddressToString(&v11, v13, 248);
    if (!(_DWORD)v5)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v13));
      goto LABEL_8;
    }
    v6 = v5;
    v7 = CarGeneralLogging(v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10006EA58((uint64_t)v4, v6, v8);

  }
  v9 = 0;
LABEL_8:

  return v9;
}

+ (id)_sanitizeName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  id v13;
  void *v14;
  id v16;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet illegalCharacterSet](NSCharacterSet, "illegalCharacterSet"));
  objc_msgSend(v4, "setCharactersToBeSkipped:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  while (1)
  {
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
    v16 = v7;
    v10 = objc_msgSend(v4, "scanUpToCharactersFromSet:intoString:", v9, &v16);
    v7 = v16;

    if (!v10)
      break;
    objc_msgSend(v6, "appendString:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
    v12 = objc_msgSend(v4, "scanCharactersFromSet:intoString:", v11, 0);

    if (v12)
      objc_msgSend(v6, "appendString:", CFSTR(" "));
  }
  if ((unint64_t)objc_msgSend(v6, "length") < 0x33)
    v13 = v6;
  else
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringToIndex:", 50));
  v14 = v13;

  return v14;
}

- (CRBluetoothManager)init
{
  CRBluetoothManager *v2;
  id v3;
  CARObserverHashTable *v4;
  CARObserverHashTable *observers;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CRBluetoothManager;
  v2 = -[CRBluetoothManager init](&v13, "init");
  if (v2)
  {
    v3 = +[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance");
    v4 = (CARObserverHashTable *)objc_msgSend(objc_alloc((Class)CARObserverHashTable), "initWithProtocol:", &OBJC_PROTOCOL___CRBluetoothManagerObserving);
    observers = v2->_observers;
    v2->_observers = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, "bluetoothPowerStateChanged:", BluetoothPowerChangedNotification, 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, "pairingFailureHandler:", BluetoothPairingPINResultFailedNotification, 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, "pairingSuccessHandler:", BluetoothPairingPINResultSuccessNotification, 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, "numericComparisonRequestHandler:", BluetoothPairingPassKeyDisplayNotification, 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, "numericComparisonRequestHandler:", BluetoothPairingUserConfirmationNotification, 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, "numericComparisonRequestHandler:", BluetoothPairingUserNumericComparisionNotification, 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CRBluetoothManager;
  -[CRBluetoothManager dealloc](&v4, "dealloc");
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRBluetoothManager observers](self, "observers"));
  objc_msgSend(v5, "addObserver:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRBluetoothManager observers](self, "observers"));
  objc_msgSend(v5, "removeObserver:", v4);

}

- (id)connectedBluetoothAddresses
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  _BYTE v33[128];
  _BYTE v34[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectedDevices"));

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v9), "address"));
        if (v10)
          objc_msgSend(v2, "addObject:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "connectingDevices"));

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v17), "address", (_QWORD)v23));
        if (v18)
          objc_msgSend(v2, "addObject:", v18);

        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    }
    while (v15);
  }

  v20 = CarGeneralLogging(v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v2;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "connected BT Classic addresses: %@", buf, 0xCu);
  }

  return v2;
}

- (id)_deviceForBluetoothAddress:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  unsigned int v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pairedDevices"));

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v28;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "address"));
        v13 = objc_msgSend(v3, "isEqualToString:", v12);

        if ((v13 & 1) != 0)
          break;
        if (v8 == (id)++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
          if (v8)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v14 = v11;

      if (v14)
        goto LABEL_24;
    }
    else
    {
LABEL_10:

    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance", 0));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "connectingDevices"));

    v14 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v14)
    {
      v17 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v17)
            objc_enumerationMutation(v16);
          v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "address"));
          v21 = objc_msgSend(v3, "isEqualToString:", v20);

          if (v21)
          {
            v14 = v19;
            goto LABEL_23;
          }
        }
        v14 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v14)
          continue;
        break;
      }
    }
LABEL_23:

LABEL_24:
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)pairWithBluetoothAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  id v18;

  v4 = a3;
  -[CRBluetoothManager setCurrentlyPairingAddress:](self, "setCurrentlyPairingAddress:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceFromAddressString:", v4));

  v8 = CarPairingLogging(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 141558275;
      v16 = 1752392040;
      v17 = 2113;
      v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "starting pairing for device address %{private, mask.hash}@", (uint8_t *)&v15, 0x16u);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"));
    objc_msgSend(v11, "setDevicePairingEnabled:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"));
    objc_msgSend(v12, "setConnectable:", 1);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"));
    objc_msgSend(v13, "connectDevice:", v6);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10006EAD8();

    v14 = objc_claimAutoreleasedReturnValue(-[CRBluetoothManager pairingDelegate](self, "pairingDelegate"));
    v13 = (void *)v14;
    if (v14
      && (objc_opt_respondsToSelector(v14, "bluetoothManager:failedPairingForDeviceAddress:name:didTimeout:") & 1) != 0)
    {
      objc_msgSend(v13, "bluetoothManager:failedPairingForDeviceAddress:name:didTimeout:", self, v4, 0, 0);
    }
  }

}

- (void)confirmPairingWithBluetoothAddress:(id)a3 numericCode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  id v21;

  v6 = a3;
  v7 = a4;
  -[CRBluetoothManager setCurrentlyPairingAddress:](self, "setCurrentlyPairingAddress:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceFromAddressString:", v6));

  v11 = CarPairingLogging(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 141558275;
      v19 = 1752392040;
      v20 = 2113;
      v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "confirming pairing for device address %{private, mask.hash}@", (uint8_t *)&v18, 0x16u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"));
    objc_msgSend(v14, "setDevicePairingEnabled:", 1);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"));
    objc_msgSend(v15, "setConnectable:", 1);

    -[CRBluetoothManager _requestConfirmationForDevice:numericCode:](self, "_requestConfirmationForDevice:numericCode:", v9, v7);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10006EAD8();

    v16 = objc_claimAutoreleasedReturnValue(-[CRBluetoothManager pairingDelegate](self, "pairingDelegate"));
    v17 = (void *)v16;
    if (v16
      && (objc_opt_respondsToSelector(v16, "bluetoothManager:failedPairingForDeviceAddress:name:didTimeout:") & 1) != 0)
    {
      objc_msgSend(v17, "bluetoothManager:failedPairingForDeviceAddress:name:didTimeout:", self, v6, 0, 0);
    }

  }
}

- (BOOL)unpairWithBluetoothAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRBluetoothManager _deviceForBluetoothAddress:](self, "_deviceForBluetoothAddress:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"));
  objc_msgSend(v6, "setDevicePairingEnabled:", 1);

  objc_msgSend(v5, "unpair");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"));
  objc_msgSend(v7, "setDevicePairingEnabled:", 0);

  v9 = CarPairingLogging(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v5)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "address"));
      v14 = 141558275;
      v15 = 1752392040;
      v16 = 2113;
      v17 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "unpaired device: %{private, mask.hash}@", (uint8_t *)&v14, 0x16u);

    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    sub_10006EB38();
  }

  return v5 != 0;
}

- (unint64_t)connectedServicesCountForBluetoothAddress:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRBluetoothManager _deviceForBluetoothAddress:](self, "_deviceForBluetoothAddress:", a3));
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "connectedServicesCount");
  else
    v5 = 0;

  return (unint64_t)v5;
}

- (void)setContactsSyncEnabled:(BOOL)a3 forBluetoothAddress:(id)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const __CFString *v13;
  uint64_t v14;
  int v15;
  const __CFString *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;

  v4 = a3;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "deviceFromAddressString:", v5));

  if (v7)
  {
    v9 = (unint64_t)objc_msgSend(v7, "syncSettings") & 0xFFFF00FF;
    v10 = (unint64_t)&_mh_execute_header;
    if (v4)
      v10 = 0x100000100;
    v11 = CarGeneralLogging(objc_msgSend(v7, "setSyncSettings:", v10 | v9));
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = CFSTR("NO");
      v15 = 138543875;
      if (v4)
        v13 = CFSTR("YES");
      v16 = v13;
      v17 = 2160;
      v18 = 1752392040;
      v19 = 2113;
      v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "set contacts sync enabled: %{public}@ for device (%{private, mask.hash}@)", (uint8_t *)&v15, 0x20u);
    }
  }
  else
  {
    v14 = CarGeneralLogging(v8);
    v12 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10006EB98();
  }

}

+ (BOOL)hasPairingSupportingCarPlayWithAddress:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pairedDevices"));

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100059860;
  v8[3] = &unk_1000B7580;
  v9 = v3;
  v6 = v3;
  LOBYTE(v4) = objc_msgSend(v5, "indexOfObjectPassingTest:", v8) != (id)0x7FFFFFFFFFFFFFFFLL;

  return (char)v4;
}

+ (BOOL)hasPairingWithAddress:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pairedDevices"));

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100059980;
  v8[3] = &unk_1000B7580;
  v9 = v3;
  v6 = v3;
  LOBYTE(v4) = objc_msgSend(v5, "indexOfObjectPassingTest:", v8) != (id)0x7FFFFFFFFFFFFFFFLL;

  return (char)v4;
}

- (void)connectWithBluetoothAddress:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRBluetoothManager _deviceForBluetoothAddress:](self, "_deviceForBluetoothAddress:", a3));
  objc_msgSend(v3, "connect");

}

- (void)setPowered:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"));
  objc_msgSend(v4, "setPowered:", v3);

}

- (BOOL)isPowered
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"));
  v3 = objc_msgSend(v2, "powered");

  return v3;
}

- (void)_requestConfirmationForDevice:(id)a3 numericCode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "address"));
  v9 = (void *)objc_opt_class(self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_sanitizeName:", v10));

  v13 = CarPairingLogging(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 141558275;
    v21 = 1752392040;
    v22 = 2113;
    v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "requesting numeric comparison confirmation for device %{private, mask.hash}@", buf, 0x16u);
  }

  v15 = objc_claimAutoreleasedReturnValue(-[CRBluetoothManager pairingDelegate](self, "pairingDelegate"));
  v16 = (void *)v15;
  if (v15
    && (objc_opt_respondsToSelector(v15, "bluetoothManager:requestsConfirmationForDeviceAddress:name:numericCode:responseHandler:") & 1) != 0)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100059C30;
    v17[3] = &unk_1000B75A8;
    v17[4] = self;
    v18 = v6;
    v19 = v8;
    objc_msgSend(v16, "bluetoothManager:requestsConfirmationForDeviceAddress:name:numericCode:responseHandler:", self, v19, v11, v7, v17);

  }
}

- (void)_pairingFailedForDevice:(id)a3 didTimeout:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "address"));
  v8 = (void *)objc_opt_class(self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_sanitizeName:", v9));
  v12 = CarPairingLogging(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 141558275;
    v19 = 1752392040;
    v20 = 2113;
    v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "pairing failed for device %{private, mask.hash}@", (uint8_t *)&v18, 0x16u);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"));
  objc_msgSend(v14, "setDevicePairingEnabled:", 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"));
  objc_msgSend(v15, "setConnectable:", 0);

  v16 = objc_claimAutoreleasedReturnValue(-[CRBluetoothManager pairingDelegate](self, "pairingDelegate"));
  v17 = (void *)v16;
  if (v16
    && (objc_opt_respondsToSelector(v16, "bluetoothManager:failedPairingForDeviceAddress:name:didTimeout:") & 1) != 0)
  {
    objc_msgSend(v17, "bluetoothManager:failedPairingForDeviceAddress:name:didTimeout:", self, v7, v10, v4);
  }

}

- (void)_pairingCompletedForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "address"));
  v6 = (void *)objc_opt_class(self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_sanitizeName:", v7));
  v10 = CarPairingLogging(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 141558275;
    v17 = 1752392040;
    v18 = 2113;
    v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "pairing completed for device %{private, mask.hash}@", (uint8_t *)&v16, 0x16u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"));
  objc_msgSend(v12, "setDevicePairingEnabled:", 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"));
  objc_msgSend(v13, "setConnectable:", 0);

  v14 = objc_claimAutoreleasedReturnValue(-[CRBluetoothManager pairingDelegate](self, "pairingDelegate"));
  v15 = (void *)v14;
  if (v14
    && (objc_opt_respondsToSelector(v14, "bluetoothManager:completedPairingForDeviceAddress:deviceName:") & 1) != 0)
  {
    objc_msgSend(v15, "bluetoothManager:completedPairingForDeviceAddress:deviceName:", self, v5, v8);
  }

}

- (void)bluetoothPowerStateChanged:(id)a3
{
  _BOOL8 v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v4 = -[CRBluetoothManager isPowered](self, "isPowered", a3);
  v5 = CarGeneralLogging(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
    v9 = 138412290;
    v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "BT power state changed: %@", (uint8_t *)&v9, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRBluetoothManager observers](self, "observers"));
  objc_msgSend(v8, "bluetoothManager:didChangePowerState:", self, v4);

}

- (void)pairingFailureHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _BOOL8 v8;
  id v9;

  v4 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", BluetoothErrorKey));
  v8 = v6
    && (v7 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    && objc_msgSend(v6, "intValue") == 316;
  -[CRBluetoothManager _pairingFailedForDevice:didTimeout:](self, "_pairingFailedForDevice:didTimeout:", v9, v8);

}

- (void)pairingSuccessHandler:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  -[CRBluetoothManager _pairingCompletedForDevice:](self, "_pairingCompletedForDevice:", v4);

}

- (void)numericComparisonRequestHandler:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;

  v4 = a3;
  v5 = CarPairingLogging(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
    *(_DWORD *)buf = 138412546;
    v19 = v7;
    v20 = 2112;
    v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "numericComparisonRequestHandler received %@ for %@", buf, 0x16u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v10 = objc_msgSend(v9, "isEqualToString:", BluetoothPairingUserNumericComparisionNotification);

  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "valueForKey:", CFSTR("device")));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKey:", CFSTR("value")));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%06u"), objc_msgSend(v15, "unsignedIntValue")));
    -[CRBluetoothManager _requestConfirmationForDevice:numericCode:](self, "_requestConfirmationForDevice:numericCode:", v13, v16);

  }
  else
  {
    v17 = CarPairingLogging(v11);
    v13 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10006EC60(v4, v13);
  }

}

- (CRBluetoothManagerPairingDelegate)pairingDelegate
{
  return (CRBluetoothManagerPairingDelegate *)objc_loadWeakRetained((id *)&self->_pairingDelegate);
}

- (void)setPairingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_pairingDelegate, a3);
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (NSString)currentlyPairingAddress
{
  return self->_currentlyPairingAddress;
}

- (void)setCurrentlyPairingAddress:(id)a3
{
  objc_storeStrong((id *)&self->_currentlyPairingAddress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentlyPairingAddress, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_pairingDelegate);
}

@end
