@implementation CRWiFiCarManager

- (CRWiFiCarManager)init
{
  CRWiFiCarManager *v2;
  NSRecursiveLock *v3;
  NSRecursiveLock *lock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRWiFiCarManager;
  v2 = -[CRWiFiCarManager init](&v6, "init");
  if (v2)
  {
    v3 = (NSRecursiveLock *)objc_alloc_init((Class)NSRecursiveLock);
    lock = v2->_lock;
    v2->_lock = v3;

    -[NSRecursiveLock lock](v2->_lock, "lock");
    -[CRWiFiCarManager _lock_wifiManager](v2, "_lock_wifiManager");
    -[NSRecursiveLock unlock](v2->_lock, "unlock");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[CRWiFiCarManager invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CRWiFiCarManager;
  -[CRWiFiCarManager dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  __WiFiManagerClient *wifiManager;
  __WiFiDeviceClient *device;

  -[NSRecursiveLock lock](self->_lock, "lock");
  wifiManager = self->_wifiManager;
  if (wifiManager)
  {
    WiFiManagerClientRegisterServerRestartCallback(wifiManager, 0, 0);
    WiFiManagerClientRegisterDeviceAttachmentCallback(self->_wifiManager, 0, 0);
    CFRelease(self->_wifiManager);
    self->_wifiManager = 0;
  }
  device = self->_device;
  if (device)
  {
    WiFiDeviceClientRegisterPowerCallback(device, 0, 0);
    CFRelease(self->_device);
    self->_device = 0;
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (BOOL)isPowered
{
  BOOL powered;

  -[NSRecursiveLock lock](self->_lock, "lock");
  if (!self->_poweredHasBeenSet)
    self->_poweredHasBeenSet = 1;
  powered = self->_powered;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return powered;
}

- (void)setPowered:(BOOL)a3
{
  _BOOL8 v3;
  __WiFiManagerClient *v5;

  v3 = a3;
  -[NSRecursiveLock lock](self->_lock, "lock");
  if (!self->_poweredHasBeenSet)
    self->_poweredHasBeenSet = 1;
  v5 = -[CRWiFiCarManager _lock_wifiManager](self, "_lock_wifiManager");
  if (v5)
    WiFiManagerClientSetPower(v5, v3);
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (BOOL)hasCredentialsForCarPlayUUID:(id)a3
{
  return -[CRWiFiCarManager networkForCarPlayUUID:](self, "networkForCarPlayUUID:", a3) != 0;
}

- (id)_uuidForNetwork:(__WiFiNetwork *)a3
{
  return (id)WiFiNetworkGetProperty(a3, CFSTR("CARPLAY_UUID"));
}

- (__WiFiNetwork)firstNetworkPassingTest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  const void *v7;
  __WiFiNetwork *v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[NSRecursiveLock lock](self->_lock, "lock");
  v5 = (void *)WiFiManagerClientCopyNetworks(-[CRWiFiCarManager _lock_wifiManager](self, "_lock_wifiManager"));
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100061AE4;
  v10[3] = &unk_1000B79B0;
  v6 = v4;
  v11 = v6;
  v12 = &v13;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
  v7 = (const void *)v14[3];
  if (v7)
  {
    CFAutorelease(v7);
    v8 = (__WiFiNetwork *)v14[3];
  }
  else
  {
    v8 = 0;
  }

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (__WiFiNetwork)networkForCarPlayUUID:(id)a3
{
  id v3;
  __WiFiNetwork *v4;
  _QWORD v6[4];
  CRWiFiCarManager *v7;
  id v8;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100061BF0;
  v6[3] = &unk_1000B79D8;
  v7 = self;
  v8 = a3;
  v3 = v8;
  v4 = -[CRWiFiCarManager firstNetworkPassingTest:](v7, "firstNetworkPassingTest:", v6);

  return v4;
}

- (__WiFiNetwork)networkForSSID:(id)a3
{
  id v4;
  __WiFiNetwork *v5;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100061CB8;
  v7[3] = &unk_1000B7A00;
  v8 = a3;
  v4 = v8;
  v5 = -[CRWiFiCarManager firstNetworkPassingTest:](self, "firstNetworkPassingTest:", v7);

  return v5;
}

- (void)updateExistingNetwork:(__WiFiNetwork *)a3 password:(id)a4 securityType:(id)a5 channel:(id)a6 carPlayUUID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t Channel;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t Property;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = WiFiNetworkCopyPassword(a3);
  v36 = (void *)v16;
  if (v12 && v16)
  {
    v16 = (uint64_t)objc_msgSend((id)v16, "isEqual:", v12);
    if ((v16 & 1) != 0)
    {
LABEL_4:
      v17 = 0;
      goto LABEL_9;
    }
  }
  else if (!v12)
  {
    goto LABEL_4;
  }
  v18 = CarGeneralLogging(v16);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v15;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "updating password for existing network %@", buf, 0xCu);
  }

  WiFiNetworkSetProperty(a3, kWiFiNetworkPasswordStringKey, v12);
  v17 = 1;
LABEL_9:
  v20 = objc_claimAutoreleasedReturnValue(-[CRWiFiCarManager _getSecurityTypeForNetwork:](self, "_getSecurityTypeForNetwork:", a3));
  v21 = (void *)v20;
  if (v13 && v20)
  {
    v20 = (uint64_t)objc_msgSend((id)v20, "isEqual:", v13);
    if ((v20 & 1) != 0)
      goto LABEL_17;
  }
  else if (!v13)
  {
    goto LABEL_17;
  }
  v22 = CarGeneralLogging(v20);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v38 = v21;
    v39 = 2112;
    v40 = v13;
    v41 = 2112;
    v42 = v15;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "updating securityType from %@ to %@ for existing network %@", buf, 0x20u);
  }

  -[CRWiFiCarManager _setSecurityType:forNetwork:](self, "_setSecurityType:forNetwork:", v13, a3);
  v17 = 1;
LABEL_17:
  Channel = WiFiNetworkGetChannel(a3);
  v25 = objc_claimAutoreleasedReturnValue(Channel);
  v26 = (void *)v25;
  if (v14 && v25)
  {
    v25 = (uint64_t)objc_msgSend((id)v25, "isEqual:", v14);
    if ((v25 & 1) != 0)
      goto LABEL_25;
  }
  else if (!v14)
  {
    goto LABEL_25;
  }
  v27 = CarGeneralLogging(v25);
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v38 = v26;
    v39 = 2112;
    v40 = v14;
    v41 = 2112;
    v42 = v15;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "updating channel from %@ to %@ for existing network %@", buf, 0x20u);
  }

  WiFiNetworkSetProperty(a3, CFSTR("CHANNEL"), v14);
  v17 = 1;
LABEL_25:
  Property = WiFiNetworkGetProperty(a3, CFSTR("CARPLAY_NETWORK"));
  if (!Property || (Property = CFEqual((CFTypeRef)Property, kCFBooleanTrue), !(_DWORD)Property))
  {
    v30 = CarGeneralLogging(Property);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "updating network type to CarPlay for existing network", buf, 2u);
    }

    WiFiNetworkSetProperty(a3, CFSTR("CARPLAY_NETWORK"), kCFBooleanTrue);
    v17 = 1;
  }
  v32 = objc_claimAutoreleasedReturnValue(-[CRWiFiCarManager _uuidForNetwork:](self, "_uuidForNetwork:", a3));
  v33 = (void *)v32;
  if (v15 && v32)
  {
    v32 = (uint64_t)objc_msgSend((id)v32, "isEqual:", v15);
    if ((v32 & 1) != 0)
      goto LABEL_33;
  }
  else if (!v15)
  {
LABEL_33:
    if (!v17)
      goto LABEL_40;
    goto LABEL_39;
  }
  v34 = CarGeneralLogging(v32);
  v35 = objc_claimAutoreleasedReturnValue(v34);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v38 = v15;
    v39 = 2112;
    v40 = v33;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "updating CarPlay UUID to %@ for existing network %@", buf, 0x16u);
  }

  WiFiNetworkSetProperty(a3, CFSTR("CARPLAY_UUID"), v15);
LABEL_39:
  -[NSRecursiveLock lock](self->_lock, "lock");
  WiFiManagerClientUpdateNetwork(-[CRWiFiCarManager _lock_wifiManager](self, "_lock_wifiManager"), a3);
  -[NSRecursiveLock unlock](self->_lock, "unlock");
LABEL_40:

}

- (BOOL)saveNetworkCredentials:(id)a3 forCarPlayUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  __WiFiNetwork *v16;
  __WiFiNetwork *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t SSID;
  uint64_t v21;
  void *v22;
  BOOL v23;
  __WiFiNetwork *v24;
  __WiFiNetwork *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  const void *v38;
  id v39;
  uint64_t v40;
  NSObject *v41;
  int v43;
  id v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;

  v6 = a4;
  if (v6)
  {
    v7 = a3;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("SSID_STR")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("password")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("CHANNEL")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("securityType")));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CARAnalytics sharedInstance](CARAnalytics, "sharedInstance"));
    objc_msgSend(v12, "setWifiChannel:", v10);

    v14 = CarGeneralLogging(v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v43 = 138412802;
      v44 = v8;
      v45 = 2112;
      v46 = v10;
      v47 = 2112;
      v48 = v11;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "received network credentials SSID: %@, channel: %@, securityType: %@", (uint8_t *)&v43, 0x20u);
    }

    v16 = -[CRWiFiCarManager networkForCarPlayUUID:](self, "networkForCarPlayUUID:", v6);
    if (v16)
    {
      v17 = v16;
      v18 = CarGeneralLogging(v16);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        LOWORD(v43) = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "network already exists, checking if updates are required", (uint8_t *)&v43, 2u);
      }

      SSID = WiFiNetworkGetSSID(v17);
      v21 = objc_claimAutoreleasedReturnValue(SSID);
      v22 = (void *)v21;
      if (v8 && v21)
      {
        v21 = (uint64_t)objc_msgSend((id)v21, "isEqual:", v8);
        if ((v21 & 1) != 0)
        {
LABEL_10:
          -[CRWiFiCarManager updateExistingNetwork:password:securityType:channel:carPlayUUID:](self, "updateExistingNetwork:password:securityType:channel:carPlayUUID:", v17, v9, v11, v10, v6);

LABEL_17:
          v23 = 1;
LABEL_38:

          goto LABEL_39;
        }
      }
      else if (!v8)
      {
        goto LABEL_10;
      }
      v30 = CarGeneralLogging(v21);
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v43 = 138412290;
        v44 = v6;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "updated SSID, removing network %@, will be re-added", (uint8_t *)&v43, 0xCu);
      }

      -[CRWiFiCarManager removeNetworkCredentialsForCarPlayNetwork:](self, "removeNetworkCredentialsForCarPlayNetwork:", v17);
    }
    else
    {
      v24 = -[CRWiFiCarManager networkForSSID:](self, "networkForSSID:", v8);
      if (v24)
      {
        v25 = v24;
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRWiFiCarManager _uuidForNetwork:](self, "_uuidForNetwork:", v24));

        if (!v26)
        {
          v28 = CarGeneralLogging(v27);
          v29 = objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            LOWORD(v43) = 0;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "network already exists as internet-only, updating", (uint8_t *)&v43, 2u);
          }

          -[CRWiFiCarManager updateExistingNetwork:password:securityType:channel:carPlayUUID:](self, "updateExistingNetwork:password:securityType:channel:carPlayUUID:", v25, v9, v11, v10, v6);
          goto LABEL_17;
        }
      }
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v32, "setObject:forKey:", v6, CFSTR("CARPLAY_UUID"));
    objc_msgSend(v32, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("CARPLAY_NETWORK"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2));
    objc_msgSend(v32, "setObject:forKey:", v33, CFSTR("AP_MODE"));

    if (v8)
      v34 = objc_msgSend(v32, "setObject:forKey:", v8, CFSTR("SSID_STR"));
    if (v10)
    {
      objc_msgSend(v32, "setValue:forKey:", v10, CFSTR("CHANNEL"));
    }
    else
    {
      v35 = CarGeneralLogging(v34);
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v43 = 138412290;
        v44 = v8;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Channel information not present for CarPlay network %@", (uint8_t *)&v43, 0xCu);
      }

    }
    v37 = WiFiNetworkCreate(0, v32);
    v23 = v37 != 0;
    if (v37)
    {
      v38 = (const void *)v37;
      if (v9)
      {
        WiFiNetworkSetPasswordSyncable(v37, 0);
        WiFiNetworkSetProperty(v38, kWiFiNetworkPasswordStringKey, v9);
      }
      v39 = -[CRWiFiCarManager _setSecurityType:forNetwork:](self, "_setSecurityType:forNetwork:", v11, v38);
      if (v10)
        v39 = (id)WiFiNetworkSetProperty(v38, CFSTR("CHANNEL_FLAGS"), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
      v40 = CarGeneralLogging(v39);
      v41 = objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        v43 = 138412290;
        v44 = v6;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "adding network %@", (uint8_t *)&v43, 0xCu);
      }

      -[NSRecursiveLock lock](self->_lock, "lock");
      WiFiManagerClientAddNetwork(-[CRWiFiCarManager _lock_wifiManager](self, "_lock_wifiManager"), v38);
      -[NSRecursiveLock unlock](self->_lock, "unlock");
      CFRelease(v38);
    }

    goto LABEL_38;
  }
  v23 = 0;
LABEL_39:

  return v23;
}

- (id)_getSecurityTypeForNetwork:(__WiFiNetwork *)a3
{
  if (!WiFiNetworkSupportsWPA3(a3, a2))
    return &off_1000BE800;
  if (WiFiNetworkSupportsWPA2(a3))
    return &off_1000BE7D0;
  return &off_1000BE7E8;
}

- (void)_setSecurityType:(id)a3 forNetwork:(__WiFiNetwork *)a4
{
  id v5;
  __WiFiNetwork *v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  v8 = v5;
  if (!v5)
    goto LABEL_7;
  if (!objc_msgSend(v5, "isEqualToNumber:", &off_1000BE7E8))
  {
    if (objc_msgSend(v8, "isEqualToNumber:", &off_1000BE7D0))
    {
      v6 = a4;
      v7 = 1;
      goto LABEL_6;
    }
LABEL_7:
    WiFiNetworkSetWPA(a4, 1);
    goto LABEL_8;
  }
  v6 = a4;
  v7 = 0;
LABEL_6:
  WiFiNetworkSetSAE(v6, 1, v7);
LABEL_8:

}

- (BOOL)removeNetworkCredentialsForCarPlayUUID:(id)a3
{
  __WiFiNetwork *v4;

  v4 = -[CRWiFiCarManager networkForCarPlayUUID:](self, "networkForCarPlayUUID:", a3);
  if (v4)
    -[CRWiFiCarManager removeNetworkCredentialsForCarPlayNetwork:](self, "removeNetworkCredentialsForCarPlayNetwork:", v4);
  return v4 != 0;
}

- (void)removeNetworkCredentialsForCarPlayNetwork:(__WiFiNetwork *)a3
{
  uint64_t Type;
  uint64_t v6;
  NSObject *v7;
  uint8_t v8[16];

  Type = WiFiNetworkGetType(a3, a2);
  if ((_DWORD)Type == 1)
  {
    v6 = CarGeneralLogging(Type);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "removing password for CarPlay-only network", v8, 2u);
    }

    WiFiNetworkRemovePassword(a3);
  }
  -[NSRecursiveLock lock](self->_lock, "lock");
  WiFiManagerClientRemoveNetworkWithReason(-[CRWiFiCarManager _lock_wifiManager](self, "_lock_wifiManager"), a3, 7);
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)setInCar:(BOOL)a3 carPlayUUID:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  id v10;

  v4 = a3;
  v6 = a4;
  v7 = CarGeneralLogging(v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "setting WiFiManager to in-car %@", (uint8_t *)&v9, 0xCu);
  }

  -[NSRecursiveLock lock](self->_lock, "lock");
  WiFiManagerClientSetInCarState(-[CRWiFiCarManager _lock_wifiManager](self, "_lock_wifiManager"), v4, v6);
  -[NSRecursiveLock unlock](self->_lock, "unlock");

}

- (void)_updateWiFiDevice
{
  CFIndex Count;
  const __CFArray *v4;
  const void *ValueAtIndex;
  const void *v6;
  __WiFiDeviceClient *device;
  uint64_t v8;
  NSObject *v9;

  -[NSRecursiveLock lock](self->_lock, "lock");
  Count = WiFiManagerClientCopyDevices(-[CRWiFiCarManager _lock_wifiManager](self, "_lock_wifiManager"));
  v4 = (const __CFArray *)Count;
  if (Count)
  {
    Count = CFArrayGetCount((CFArrayRef)Count);
    if (Count >= 1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v4, 0);
      if (ValueAtIndex)
      {
        v6 = ValueAtIndex;
        device = self->_device;
        if (!device || !CFEqual(ValueAtIndex, device))
          -[CRWiFiCarManager _lock_setWiFiDevice:](self, "_lock_setWiFiDevice:", v6);
      }
LABEL_12:
      CFRelease(v4);
      goto LABEL_13;
    }
  }
  if (!self->_device)
  {
    v8 = CarGeneralLogging(Count);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10006F558(v9);

  }
  if (v4)
    goto LABEL_12;
LABEL_13:
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (void)_powerStateDidChange
{
  _BOOL4 powered;
  _BOOL4 v4;
  uint64_t v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  _BOOL4 v9;

  -[NSRecursiveLock lock](self->_lock, "lock");
  powered = self->_powered;
  if (self->_device)
    v4 = WiFiDeviceClientGetPower() != 0;
  else
    v4 = 0;
  self->_powered = v4;
  self->_poweredHasBeenSet = 1;
  v5 = CarGeneralLogging(-[NSRecursiveLock unlock](self->_lock, "unlock"));
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109376;
    v7[1] = powered;
    v8 = 1024;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "WiFi _powerStateDidChange from %d to %d", (uint8_t *)v7, 0xEu);
  }

}

- (__WiFiManagerClient)_lock_wifiManager
{
  __WiFiManagerClient *result;
  __WiFiManagerClient *wifiManager;
  CFRunLoopRef Current;
  __CFRunLoop *v6;

  result = self->_wifiManager;
  if (!result)
  {
    if (MobileWiFiContainsRadio(0, a2))
    {
      wifiManager = (__WiFiManagerClient *)WiFiManagerClientCreate(kCFAllocatorDefault, 1);
      self->_wifiManager = wifiManager;
      if (wifiManager)
      {
LABEL_4:
        Current = CFRunLoopGetCurrent();
        WiFiManagerClientScheduleWithRunLoop(wifiManager, Current, kCFRunLoopDefaultMode);
        v6 = CFRunLoopGetCurrent();
        CFRunLoopWakeUp(v6);
        WiFiManagerClientRegisterServerRestartCallback(self->_wifiManager, sub_100061648, self);
        WiFiManagerClientRegisterDeviceAttachmentCallback(self->_wifiManager, sub_1000616C8, self);
        -[CRWiFiCarManager _updateWiFiDevice](self, "_updateWiFiDevice");
        return self->_wifiManager;
      }
    }
    else
    {
      wifiManager = self->_wifiManager;
      if (wifiManager)
        goto LABEL_4;
    }
    return 0;
  }
  return result;
}

- (void)_lock_setWiFiDevice:(__WiFiDeviceClient *)a3
{
  __WiFiDeviceClient *device;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  __WiFiDeviceClient *v9;
  __WiFiDeviceClient *v10;
  __WiFiDeviceClient *v11;
  int v12;
  __WiFiDeviceClient *v13;
  __int16 v14;
  __WiFiDeviceClient *v15;

  if (a3)
  {
    device = self->_device;
    if (device)
    {
      v6 = CFEqual(a3, device);
      if ((_DWORD)v6)
        return;
      if (self->_device)
      {
        v7 = CarGeneralLogging(v6);
        v8 = objc_claimAutoreleasedReturnValue(v7);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v9 = self->_device;
          v12 = 138543618;
          v13 = v9;
          v14 = 2114;
          v15 = a3;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Unexpected WiFi device change from %{public}@ -> %{public}@", (uint8_t *)&v12, 0x16u);
        }

        v10 = self->_device;
        if (v10)
        {
          WiFiDeviceClientRegisterPowerCallback(v10, 0, 0);
          CFRelease(self->_device);
          self->_device = 0;
        }
      }
    }
    v11 = (__WiFiDeviceClient *)CFRetain(a3);
    self->_device = v11;
    WiFiDeviceClientRegisterPowerCallback(v11, sub_100061740, self);
    -[CRWiFiCarManager _powerStateDidChange](self, "_powerStateDidChange");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
