@implementation MagicSwitchEnablerCompanion

- (MagicSwitchEnablerCompanion)init
{
  MagicSwitchEnablerCompanion *v2;
  MagicSwitchEnablerCompanion *v3;
  NSObject *v4;
  _QWORD block[4];
  MagicSwitchEnablerCompanion *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MagicSwitchEnablerCompanion;
  v2 = -[MagicSwitchEnabler init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[MagicSwitchEnabler workQueue](v2, "workQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000062C0;
    block[3] = &unk_100018538;
    v7 = v3;
    dispatch_async(v4, block);

  }
  return v3;
}

- (void)registerNanoRegistryObservers
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id obj;
  uint8_t buf[16];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  _QWORD v19[4];

  v19[0] = NRPairedDeviceRegistryDeviceIsSetupNotification;
  v19[1] = NRPairedDeviceRegistryDeviceDidUnpairNotification;
  v19[2] = NRPairedDeviceRegistryDeviceDidEnterCompatibilityStateNotification;
  v19[3] = NRPairedDeviceRegistryRemoteUnpairingDidBeginNotification;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 4));
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
        objc_msgSend(v8, "addObserver:selector:name:object:", self, "handleNanoRegistryNotification:", v7, v9);

        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NRActiveDeviceAssertionMonitor sharedInstance](NRActiveDeviceAssertionMonitor, "sharedInstance"));
  objc_msgSend(v10, "addObserver:", self);

  v11 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "MagicSwitchEnabler --- Registered NanoRegistry observers", buf, 2u);
  }

}

- (void)handleNanoRegistryNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  MagicSwitchEnablerCompanion *v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", NRPairedDeviceRegistryDevice));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MagicSwitchEnabler sharedInstance](MagicSwitchEnabler, "sharedInstance"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006708;
  block[3] = &unk_100018560;
  v12 = v4;
  v13 = v6;
  v14 = self;
  v9 = v6;
  v10 = v4;
  dispatch_async(v8, block);

}

- (void)updateState
{
  void *v3;
  unsigned int v4;
  const char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *i;
  void *v19;
  id v20;
  unsigned int v21;
  void *v22;
  void *v23;
  unsigned int v24;
  id v25;
  void *v26;
  unsigned __int8 v27;
  NSObject *v28;
  MagicSwitchManagerCompanion *magicSwitchManager;
  NSObject *v30;
  _BOOL4 v31;
  uint64_t v32;
  MagicSwitchManagerCompanion *v33;
  void *v34;
  MagicSwitchManagerCompanion *v35;
  NSObject *v36;
  uint64_t v37;
  MagicSwitchManagerCompanion *v38;
  MagicSwitchManagerCompanion *v39;
  void *v40;
  void *v41;
  void *v42;
  MagicSwitchEnablerCompanion *v43;
  void *v44;
  uint64_t v45;
  char v46;
  void *v47;
  NSMutableArray *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  const char *v54;
  _BYTE v55[128];

  v48 = objc_opt_new(NSMutableArray);
  if (self->_isSwitchingActivePairedDevice)
  {
    v3 = 0;
    v4 = 0;
    v5 = "Switching device";
LABEL_38:
    magicSwitchManager = self->_magicSwitchManager;
    v30 = qword_100021A50;
    v31 = os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT);
    if (magicSwitchManager)
    {
      if (v31)
      {
        *(_DWORD *)buf = 136315138;
        v54 = v5;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "MagicSwitchEnabler --- Disabling MagicSwitch for reason: %s", buf, 0xCu);
      }
      -[MagicSwitchManagerCompanion invalidate](self->_magicSwitchManager, "invalidate", v41);
      v33 = self->_magicSwitchManager;
      self->_magicSwitchManager = 0;

    }
    else if (v31)
    {
      *(_DWORD *)buf = 136315138;
      v54 = v5;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "MagicSwitchEnabler --- Not enabling MagicSwitch for reason: %s", buf, 0xCu);
    }
    v34 = (void *)objc_opt_class(KeepAliveManager, v32);
    if (v4)
      objc_msgSend(v34, "createMagicSwitchPathFile");
    else
      objc_msgSend(v34, "deleteMagicSwitchPathFile");
    goto LABEL_47;
  }
  if (!-[MagicSwitchEnabler isSettingEnabled](self, "isSettingEnabled"))
  {
    v3 = 0;
    v4 = 0;
    v5 = "Setting disabled";
    goto LABEL_38;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getActivePairedDevice"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForProperty:", NRDevicePropertyIsSetup));
  if ((objc_msgSend(v8, "BOOLValue") & 1) == 0)
  {
    v28 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "MagicSwitchEnabler --- Active device isn't setup yet, ignoring", buf, 2u);
    }

    goto LABEL_31;
  }
  if (!v7)
  {
LABEL_31:

    v3 = 0;
    v4 = 0;
    v5 = "No active + setup completed paired device";
    goto LABEL_38;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "getSetupCompletedDevices"));

  if ((unint64_t)objc_msgSend(v10, "count") < 2)
  {
    v4 = 0;
    v3 = 0;
    v5 = "Less than two paired devices";
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
    v12 = objc_msgSend(v11, "compatibilityState");

    if (v12 == 4)
    {
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v44 = v10;
      v13 = v10;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      if (v14)
      {
        v15 = v14;
        v41 = v8;
        v42 = v7;
        v43 = self;
        v47 = 0;
        v16 = *(_QWORD *)v50;
        v45 = _NRDevicePropertyBluetoothIdentifier;
        v17 = NRDevicePropertyIsActive;
        v46 = 1;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(_QWORD *)v50 != v16)
              objc_enumerationMutation(v13);
            v19 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
            v20 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("B8365B0F-C979-491B-86E3-EBAE195F1755"));
            v21 = objc_msgSend(v19, "supportsCapability:", v20);

            if (v21)
            {
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "valueForProperty:", v45));
              if (v22)
                -[NSMutableArray addObject:](v48, "addObject:", v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "valueForProperty:", v17, v41));
              v24 = objc_msgSend(v23, "BOOLValue");

              if (v24)
              {
                v25 = v22;

                v47 = v25;
              }

            }
            else
            {
              v46 = 0;
            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
        }
        while (v15);

        v7 = v42;
        if ((v46 & 1) != 0)
        {
          self = v43;
          v10 = v44;
          v3 = v47;
          v8 = v41;
          if (v47 && (unint64_t)-[NSMutableArray count](v48, "count") >= 2)
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "valueForProperty:", _NRDevicePropertyRemoteUnpairingStarted));
            v27 = objc_msgSend(v26, "BOOLValue");

            if ((v27 & 1) != 0)
            {
              v4 = 0;
              v5 = "Remote unpairing has started";
            }
            else
            {
              buf[0] = 0;
              if (-[InitialSyncCompletionMonitor hasCachedInitialSyncCompletionStateForDevice:state:](v43->_initialSyncMonitor, "hasCachedInitialSyncCompletionStateForDevice:state:", v42, buf))
              {
                if (buf[0])
                {
                  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NRActiveDeviceAssertionMonitor sharedInstance](NRActiveDeviceAssertionMonitor, "sharedInstance"));
                  v4 = objc_msgSend(v40, "hasActiveAssertion");

                  if (v4)
                    v5 = "An Active Device Assertion is active";
                  else
                    v5 = 0;
                }
                else
                {
                  -[InitialSyncCompletionMonitor registerObserver:device:](v43->_initialSyncMonitor, "registerObserver:device:", v43, v42);
                  v4 = 0;
                  v5 = "Initial Sync not complete yet";
                }
              }
              else
              {
                -[InitialSyncCompletionMonitor registerObserver:device:](v43->_initialSyncMonitor, "registerObserver:device:", v43, v42);
                v4 = 1;
                v5 = "Initial Sync state for active device unknown";
              }
            }
          }
          else
          {
            v4 = 0;
            v5 = "A paired device has a missing Bluetooth ID";
          }
        }
        else
        {
          v4 = 0;
          v5 = "Not all paired watches have capability";
          self = v43;
          v10 = v44;
          v3 = v47;
          v8 = v41;
        }
      }
      else
      {

        v4 = 0;
        v3 = 0;
        v5 = "A paired device has a missing Bluetooth ID";
      }
    }
    else
    {
      v4 = 0;
      v3 = 0;
      v5 = "Not in Normal Compatibility state";
    }
  }

  if (v5)
    goto LABEL_38;
  v35 = self->_magicSwitchManager;
  if (!v35)
  {
    v36 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "MagicSwitchEnabler --- Enabling MagicSwitch", buf, 2u);
    }
    objc_msgSend((id)objc_opt_class(KeepAliveManager, v37), "createMagicSwitchPathFile");
    v38 = -[MagicSwitchManagerCompanion initWithDelegate:]([MagicSwitchManagerCompanion alloc], "initWithDelegate:", self);
    v39 = self->_magicSwitchManager;
    self->_magicSwitchManager = v38;

    v35 = self->_magicSwitchManager;
  }
  -[MagicSwitchManagerCompanion updatePairedDeviceList:activeDevice:](v35, "updatePairedDeviceList:activeDevice:", v48, v3, v41);
LABEL_47:

}

- (void)activePairedDeviceSwitchForDevice:(id)a3 completedWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  _BYTE v17[24];

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    v8 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No device", v17, 2u);
    }
  }
  self->_isSwitchingActivePairedDevice = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForProperty:", NRDevicePropertyPairingID));
  v10 = (void *)qword_100021A50;
  v11 = os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v11)
    {
      v12 = v10;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
      *(_DWORD *)v17 = 138412546;
      *(_QWORD *)&v17[4] = v13;
      *(_WORD *)&v17[12] = 2112;
      *(_QWORD *)&v17[14] = v7;
      v14 = "MagicSwitchEnabler --- MagicSwitch failed for device (%@); error: (%@)";
      v15 = v12;
      v16 = 22;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, v17, v16);

    }
  }
  else if (v11)
  {
    v12 = v10;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
    *(_DWORD *)v17 = 138412290;
    *(_QWORD *)&v17[4] = v13;
    v14 = "MagicSwitchEnabler --- MagicSwitch completed with success for device (%@)";
    v15 = v12;
    v16 = 12;
    goto LABEL_9;
  }
  -[MagicSwitchEnablerCompanion updateState](self, "updateState", *(_OWORD *)v17, *(_QWORD *)&v17[16]);

}

- (void)magicSwitchManager:(id)a3 requestActiveDeviceSwitch:(id)a4
{
  MagicSwitchManagerCompanion *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;

  v6 = (MagicSwitchManagerCompanion *)a3;
  v7 = a4;
  if (!v7)
  {
    v8 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No deviceID", buf, 2u);
    }
  }
  if (self->_magicSwitchManager != v6)
  {
    v9 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unknown manager", buf, 2u);
    }
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceForBluetoothID:", v7));

  if (!self->_isSwitchingActivePairedDevice)
  {
    if (v11)
    {
      objc_initWeak((id *)buf, self);
      self->_isSwitchingActivePairedDevice = 1;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
      v16 = _NSConcreteStackBlock;
      v17 = 3221225472;
      v18 = sub_10000727C;
      v19 = &unk_100018588;
      objc_copyWeak(&v21, (id *)buf);
      v20 = v11;
      objc_msgSend(v12, "setActivePairedDevice:isMagicSwitch:operationHasCompleted:", v20, 1, &v16);

      -[MagicSwitchEnablerCompanion updateState](self, "updateState", v16, v17, v18, v19);
      objc_destroyWeak(&v21);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v13 = (void *)qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        v14 = v13;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
        *(_DWORD *)buf = 138412290;
        v23 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "MagicSwitchEnabler --- Failed to resolve the NRDevice associated with Bluetooth ID: (%@)", buf, 0xCu);

      }
    }
  }

}

- (void)initialSyncDidCompleteForDevice:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;

  v4 = a3;
  if (!v4)
  {
    v5 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No device", (uint8_t *)&v10, 2u);
    }
  }
  v6 = (void *)qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    v7 = NRDevicePropertyPairingID;
    v8 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForProperty:", v7));
    v10 = 138412290;
    v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "MagicSwitchEnabler --- Received initial sync did complete callback for device: (%@)", (uint8_t *)&v10, 0xCu);

  }
  -[MagicSwitchEnablerCompanion updateState](self, "updateState");

}

- (void)activeDeviceAssertionStateDidChange
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MagicSwitchEnabler sharedInstance](MagicSwitchEnabler, "sharedInstance"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007520;
  block[3] = &unk_100018538;
  block[4] = self;
  dispatch_async(v4, block);

}

- (InitialSyncCompletionMonitor)initialSyncMonitor
{
  return self->_initialSyncMonitor;
}

- (void)setInitialSyncMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_initialSyncMonitor, a3);
}

- (MagicSwitchManagerCompanion)magicSwitchManager
{
  return self->_magicSwitchManager;
}

- (void)setMagicSwitchManager:(id)a3
{
  objc_storeStrong((id *)&self->_magicSwitchManager, a3);
}

- (BOOL)isSwitchingActivePairedDevice
{
  return self->_isSwitchingActivePairedDevice;
}

- (void)setIsSwitchingActivePairedDevice:(BOOL)a3
{
  self->_isSwitchingActivePairedDevice = a3;
}

- (OS_dispatch_source)sigtermSource
{
  return self->_sigtermSource;
}

- (void)setSigtermSource:(id)a3
{
  objc_storeStrong((id *)&self->_sigtermSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sigtermSource, 0);
  objc_storeStrong((id *)&self->_magicSwitchManager, 0);
  objc_storeStrong((id *)&self->_initialSyncMonitor, 0);
}

@end
