@implementation CBIDSManager

+ (id)sharedInstance
{
  if (qword_1002125B8 != -1)
    dispatch_once(&qword_1002125B8, &stru_1001E3F28);
  return (id)qword_1002125B0;
}

- (CBIDSManager)init
{
  CBIDSManager *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  os_log_t v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id buf[2];
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CBIDSManager;
  v2 = -[CBIDSManager init](&v14, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.bluetooth.cloudpairing", v4);
    -[CBIDSManager setCloudPairingQueue:](v2, "setCloudPairingQueue:", v5);

    LODWORD(v5) = +[BTSystemConfiguration isBuddyComplete](BTSystemConfiguration, "isBuddyComplete");
    v6 = sub_1000681B8("CloudPairing");
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v5)
    {
      if (v8)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "IDS BYSetupAssistantNeedsToRun : false ", (uint8_t *)buf, 2u);
      }

      -[CBIDSManager checkFirstUnlockForIDS](v2, "checkFirstUnlockForIDS");
    }
    else
    {
      if (v8)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "IDS BYSetupAssistantNeedsToRun : true ", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, v2);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100058450;
      v11[3] = &unk_1001E3F50;
      objc_copyWeak(&v12, buf);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[BTStateWatcher monitorBuddyStateWithAction:](BTStateWatcher, "monitorBuddyStateWithAction:", v11));
      -[CBIDSManager setBuddyStateWatcher:](v2, "setBuddyStateWatcher:", v9);

      objc_destroyWeak(&v12);
      objc_destroyWeak(buf);
    }
  }
  return v2;
}

- (void)checkFirstUnlockForIDS
{
  os_log_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  _QWORD block[5];
  id buf;

  v3 = sub_1000681B8("CloudPairing");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = +[BTSystemConfiguration isFirstUnlocked](BTSystemConfiguration, "isFirstUnlocked");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "First Unlock Check: %i", (uint8_t *)&buf, 8u);
  }

  if (+[BTSystemConfiguration isFirstUnlocked](BTSystemConfiguration, "isFirstUnlocked"))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudPairingQueue](self, "cloudPairingQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000586F4;
    block[3] = &unk_1001E20E8;
    block[4] = self;
    dispatch_async(v5, block);

  }
  else
  {
    objc_initWeak(&buf, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000586FC;
    v7[3] = &unk_1001E3F78;
    v7[4] = self;
    objc_copyWeak(&v8, &buf);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BTStateWatcher monitorFirstUnlockWithAction:](BTStateWatcher, "monitorFirstUnlockWithAction:", v7));
    -[CBIDSManager setFirstUnlockStateWatcher:](self, "setFirstUnlockStateWatcher:", v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&buf);
  }
}

- (void)initializeIDS
{
  void *v3;
  os_log_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  os_log_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  os_log_t v21;
  NSObject *v22;
  _QWORD v23[5];
  _QWORD v24[2];
  _QWORD v25[2];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  _UNKNOWN **v29;
  __int16 v30;
  void *v31;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager service](self, "service"));

  if (v3)
  {
    v4 = sub_1000681B8("CloudPairing");
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Already initialized IDS", buf, 2u);
    }

  }
  else
  {
    -[CBIDSManager setLocalDeviceRandomAddress:](self, "setLocalDeviceRandomAddress:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    -[CBIDSManager setUnpairedIDSCloudIdentifiers:](self, "setUnpairedIDSCloudIdentifiers:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CBPreferencesManager deviceName](CBPreferencesManager, "deviceName"));
    -[CBIDSManager setLocalDeviceName:](self, "setLocalDeviceName:", v7);

    v8 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", CFSTR("EncryptionKeys"), CFSTR("IdentityKeys"), 0);
    -[CBIDSManager setRequestedKeyTypes:](self, "setRequestedKeyTypes:", v8);

    v9 = (void *)IDSCopyLocalDeviceUniqueID();
    -[CBIDSManager setCloudIdentifier:](self, "setCloudIdentifier:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[CBIDSManager setMessageIdentifiersWaitingForAck:](self, "setMessageIdentifiersWaitingForAck:", v10);

    v11 = sub_1000681B8("CloudPairing");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudIdentifier](self, "cloudIdentifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager localDeviceName](self, "localDeviceName"));
      *(_DWORD *)buf = 138412802;
      v27 = v13;
      v28 = 2112;
      v29 = &off_1001F45D8;
      v30 = 2112;
      v31 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "initializeIDS (%@) checkIn version: %@, local name: %@", buf, 0x20u);

    }
    v15 = objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudIdentifier](self, "cloudIdentifier"));
    if (v15
      && (v16 = (void *)v15,
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager localDeviceName](self, "localDeviceName")),
          v17,
          v16,
          v17))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
      v24[0] = CFSTR("kCheckInVersion");
      v24[1] = CFSTR("kIDSLocalDeviceUniqueID");
      v25[0] = &off_1001F45D8;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudIdentifier](self, "cloudIdentifier"));
      v25[1] = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 2));
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100058B94;
      v23[3] = &unk_1001E3FA0;
      v23[4] = self;
      objc_msgSend(v18, "sendCloudKitMsg:args:withReply:", CFSTR("checkIn"), v20, v23);

    }
    else
    {
      v21 = sub_1000681B8("CloudPairing");
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_10016B9C8();

      -[CBIDSManager retryIDSSetup](self, "retryIDSSetup");
    }
  }
}

- (void)retryIDSSetup
{
  dispatch_time_t v3;
  NSObject *v4;
  _QWORD block[5];

  v3 = dispatch_time(0, 30000000000);
  v4 = objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudPairingQueue](self, "cloudPairingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100059320;
  block[3] = &unk_1001E20E8;
  block[4] = self;
  dispatch_after(v3, v4, block);

}

- (void)validateCloudPairing:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  os_log_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  os_log_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  os_log_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  id obj;
  CBIDSManager *v57;
  _QWORD v58[5];
  NSObject *v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  void *v65;
  const __CFString *v66;
  void *v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  NSObject *v71;
  _BYTE v72[128];

  v4 = a3;
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager associatedDevices](self, "associatedDevices"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v5));

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v57 = self;
  obj = (id)objc_claimAutoreleasedReturnValue(-[CBIDSManager associatedDevices](self, "associatedDevices"));
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v62;
    v55 = *(_QWORD *)v62;
    v51 = v4;
    do
    {
      v9 = 0;
      v54 = v7;
      do
      {
        if (*(_QWORD *)v62 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "idsDevice"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nsuuid"));

        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "idsDevice"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "nsuuid"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v15));

          if (-[NSObject length](v16, "length")
            && (v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "idsDevice")),
                v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "uniqueID")),
                v19 = -[NSObject isEqualToString:](v16, "isEqualToString:", v18),
                v18,
                v17,
                v19))
          {
            v20 = sub_1000681B8("CloudPairing");
            v21 = objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "idsDevice"));
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "nsuuid"));
              *(_DWORD *)buf = 138412546;
              v69 = v23;
              v70 = 2112;
              v71 = v16;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@ is already cloud paired with IDS Device: %@", buf, 0x16u);

            }
            objc_msgSend(v52, "addObject:", v16);
          }
          else
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "idsDevice"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "nsuuid"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager _fetchArrayOfCloudDevicesForPeripheral:](v57, "_fetchArrayOfCloudDevicesForPeripheral:", v25));

            if (-[NSObject length](v16, "length") && (unint64_t)objc_msgSend(v26, "count") >= 2)
            {
              v58[0] = _NSConcreteStackBlock;
              v58[1] = 3221225472;
              v58[2] = sub_100059A18;
              v58[3] = &unk_1001E3FC8;
              v58[4] = v10;
              v16 = v16;
              v59 = v16;
              v60 = v53;
              objc_msgSend(v26, "enumerateObjectsUsingBlock:", v58);

            }
            else
            {
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "idsDevice"));
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "nsuuid"));
              v32 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager _fetchCloudPairingIdentifierForPeripheral:](v57, "_fetchCloudPairingIdentifierForPeripheral:", v31));

              if (v32)
              {
                v33 = sub_1000681B8("CloudPairing");
                v34 = objc_claimAutoreleasedReturnValue(v33);
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                {
                  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "idsDevice"));
                  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "nsuuid"));
                  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "idsDevice"));
                  v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "uniqueID"));
                  *(_DWORD *)buf = 138412546;
                  v69 = v36;
                  v70 = 2112;
                  v71 = v38;
                  _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Removing stale LE Cloud Paired Device %@ is already cloud paired with IDS Device: %@", buf, 0x16u);

                }
                v39 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
                v66 = CFSTR("kCloudDeviceID");
                v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "idsDevice"));
                v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "nsuuid"));
                v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "UUIDString"));
                v67 = v42;
                v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1));
                objc_msgSend(v39, "sendCloudKitMsg:args:", CFSTR("RemoveStaleLEPairedDevice"), v43);

                v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "idsDevice"));
                objc_msgSend(v44, "setNSUUID:", 0);

                objc_msgSend(v53, "removeObject:", v10);
                v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "idsDevice"));
                v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "uniqueID"));
                v65 = v46;
                v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v65, 1));
                v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
                v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "bundleIdentifier"));
                -[CBIDSManager sendRePairRequest:forBundleID:](v57, "sendRePairRequest:forBundleID:", v47, v49);

                v4 = v51;
                v8 = v55;
              }

              v7 = v54;
            }
          }
        }
        else
        {
          v27 = sub_1000681B8("CloudPairing");
          v16 = objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "idsDevice"));
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "uniqueID"));
            *(_DWORD *)buf = 138412290;
            v69 = v29;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@ is not cloud paired with IDS Device", buf, 0xCu);

            v8 = v55;
          }
        }

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v72, 16);
    }
    while (v7);
  }

  v50 = -[CBIDSManager _statedumpAndRecordDailyMetric](v57, "_statedumpAndRecordDailyMetric");
  -[CBIDSManager updateCloudPairings:newDevices:](v57, "updateCloudPairings:newDevices:", v52, v53);

}

- (void)fetchPublicAddressWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  os_log_t v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  void (**v12)(id, _QWORD);
  uint8_t buf[4];
  void *v14;

  v4 = (void (**)(id, _QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager publicAddress](self, "publicAddress"));

  v6 = sub_1000681B8("CloudPairing");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager publicAddress](self, "publicAddress"));
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "have public address: %@", buf, 0xCu);

    }
    if (v4)
      v4[2](v4, 0);
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "fetch public address", buf, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100059D60;
    v11[3] = &unk_1001E3FF0;
    v11[4] = self;
    v12 = v4;
    objc_msgSend(v10, "sendCloudKitMsg:args:withReply:", CFSTR("FetchPublicAddress"), &__NSDictionary0__struct, v11);

  }
}

- (void)xpcUpdateCloudPairings:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudPairingQueue](self, "cloudPairingQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005A068;
  v7[3] = &unk_1001E23E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)connectionUpdatedForBluetoothIdentifier:(id)a3 connected:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  os_log_t v16;
  NSObject *v17;
  const char *v18;
  _BOOL4 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  const char *v27;
  _BYTE v28[128];

  v19 = a4;
  v5 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager associatedDevices](self, "associatedDevices"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "idsDevice"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "nsuuid"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUIDString"));
        v15 = objc_msgSend(v14, "isEqualToString:", v5);

        if (v15)
        {
          v16 = sub_1000681B8("CloudPairing");
          v17 = objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v18 = "no";
            if (v19)
              v18 = "yes";
            *(_DWORD *)buf = 138412546;
            v25 = v11;
            v26 = 2080;
            v27 = v18;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Connection updated for device: %@, connected: %s", buf, 0x16u);
          }

          objc_msgSend(v11, "setIsConnected:", v19);
          goto LABEL_15;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_15:

}

- (void)updateCloudPairings:(id)a3 newDevices:(id)a4
{
  id v6;
  id v7;
  os_log_t v8;
  NSObject *v9;
  void *v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v30;
  os_log_t v31;
  NSObject *v32;
  _BOOL4 v33;
  const char *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  os_log_t v39;
  NSObject *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  os_log_t v45;
  NSObject *v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  unsigned int v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  unint64_t v55;
  id v56;
  void *v57;
  id v58;
  _UNKNOWN **v59;
  id v60;
  uint64_t v61;
  void *j;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  id v69;
  BOOL v70;
  os_log_t v71;
  NSObject *v72;
  void *v73;
  id v74;
  id v75;
  uint64_t v76;
  void *k;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  unsigned int v82;
  void *v83;
  void *v84;
  void *v85;
  os_log_t v86;
  NSObject *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  uint64_t v97;
  char isKindOfClass;
  os_log_t v99;
  NSObject *v100;
  void *v101;
  void *v102;
  os_log_t v103;
  NSObject *v104;
  void *v106;
  id v107;
  uint64_t v108;
  void *v109;
  void *v110;
  unsigned int v111;
  NSObject *v112;
  os_log_t v113;
  NSObject *v114;
  os_log_t v115;
  id v116;
  void *v117;
  void *v118;
  id v119;
  id obj;
  id v121;
  void *v122;
  void *v123;
  uint64_t v124;
  id v125;
  _BOOL4 v126;
  id v127;
  id v128;
  CBIDSManager *v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  _QWORD v138[4];
  id v139;
  unint64_t v140;
  _QWORD v141[6];
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  const __CFString *v146;
  NSObject *v147;
  _BYTE v148[128];
  uint8_t v149[128];
  uint8_t buf[4];
  _BYTE v151[10];
  _BYTE v152[24];
  _BYTE v153[128];

  v6 = a3;
  v7 = a4;
  v8 = sub_1000681B8("CloudPairing");
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v151 = v6;
    *(_WORD *)&v151[8] = 2112;
    *(_QWORD *)v152 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "MUC - updateCloudPairings, ids: %@, devices: %@", buf, 0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager publicAddress](self, "publicAddress"));
  if (v10)
  {
    v144 = 0u;
    v145 = 0u;
    v142 = 0u;
    v143 = 0u;
    v116 = v7;
    obj = v7;
    v119 = v6;
    v129 = self;
    v125 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v142, v153, 16);
    if (!v125)
      goto LABEL_38;
    v124 = *(_QWORD *)v143;
    while (1)
    {
      for (i = 0; i != v125; i = (char *)i + 1)
      {
        if (*(_QWORD *)v143 != v124)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "idsDevice"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uniqueID"));
        v15 = objc_msgSend(v6, "indexOfObject:", v14);

        v16 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager messageIdentifiersWaitingForAck](self, "messageIdentifiersWaitingForAck"));
        v141[0] = _NSConcreteStackBlock;
        v141[1] = 3221225472;
        v141[2] = sub_10005B2A4;
        v141[3] = &unk_1001E4018;
        v141[4] = v12;
        v141[5] = self;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "keysOfEntriesPassingTest:", v141));

        if (objc_msgSend(v17, "count"))
          v18 = (unint64_t)objc_msgSend(v17, "count") < 3;
        else
          v18 = 0;
        v126 = v18;
        if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_20:
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager service](self, "service"));
          v27 = objc_msgSend(v26, "canSend");

          if (v27)
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager unpairedIDSCloudIdentifiers](self, "unpairedIDSCloudIdentifiers"));
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "idsDevice"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "uniqueID"));
            objc_msgSend(v28, "addObject:", v30);

            v31 = sub_1000681B8("CloudPairing");
            v32 = objc_claimAutoreleasedReturnValue(v31);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              v33 = v15 == (id)0x7FFFFFFFFFFFFFFFLL;
              if (objc_msgSend(v17, "count"))
                v34 = "again ";
              else
                v34 = "";
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "idsDevice"));
              v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "nsuuid"));
              v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description")));
              v38 = objc_msgSend(v37, "UTF8String");
              *(_DWORD *)buf = 136315907;
              *(_QWORD *)v151 = v34;
              *(_WORD *)&v151[8] = 1024;
              *(_DWORD *)v152 = v33;
              *(_WORD *)&v152[4] = 2112;
              *(_QWORD *)&v152[6] = v36;
              *(_WORD *)&v152[14] = 2081;
              *(_QWORD *)&v152[16] = v38;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Initiating pairing %swith unpaired IDS device [New: %i] (BT UUID: %@) %{private}s", buf, 0x26u);

            }
            self = v129;
            if (v126)
              -[CBIDSManager initiatePairingAgainIfNoAckReceived:attempt:](v129, "initiatePairingAgainIfNoAckReceived:attempt:", v12, objc_msgSend(v17, "count"));
            else
              -[CBIDSManager initiatePairing:](v129, "initiatePairing:", v12);
          }
          else
          {
            v39 = sub_1000681B8("CloudPairing");
            v40 = objc_claimAutoreleasedReturnValue(v39);
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "idsDevice"));
              v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "nsuuid"));
              v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description")));
              v44 = objc_msgSend(v43, "UTF8String");
              *(_DWORD *)buf = 138412547;
              *(_QWORD *)v151 = v42;
              *(_WORD *)&v151[8] = 2081;
              *(_QWORD *)v152 = v44;
              _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "IDS not ready cannot initiate pairing with IDS device (BT UUID: %@) %{private}s", buf, 0x16u);

              self = v129;
            }

          }
          goto LABEL_36;
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "idsDevice"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "nsuuid"));
        if (v20)
        {
          v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "idsDevice"));
          v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "uniqueID"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager publicAddressForIDSDevice:](self, "publicAddressForIDSDevice:"));
          if (v21)
          {
            LOBYTE(v22) = 0;
            goto LABEL_19;
          }
          v121 = 0;
        }
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager unpairedIDSCloudIdentifiers](self, "unpairedIDSCloudIdentifiers"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "idsDevice"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "uniqueID"));
        v22 = objc_msgSend(v23, "containsObject:", v25) ^ 1 | v18;

        if (v20)
        {
          v6 = v119;
          self = v129;
          v21 = v121;
LABEL_19:
          v121 = v21;

          if ((v22 & 1) != 0)
            goto LABEL_20;
          goto LABEL_33;
        }

        v6 = v119;
        self = v129;
        if (v22)
          goto LABEL_20;
LABEL_33:
        v45 = sub_1000681B8("CloudPairing");
        v46 = objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          v127 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "idsDevice"));
          v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "uniqueID"));
          v47 = objc_msgSend(v6, "indexOfObject:", v118) != (id)0x7FFFFFFFFFFFFFFFLL;
          v117 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager unpairedIDSCloudIdentifiers](self, "unpairedIDSCloudIdentifiers"));
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "idsDevice"));
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "uniqueID"));
          v50 = objc_msgSend(v117, "containsObject:", v49);
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "idsDevice"));
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "nsuuid"));
          v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description")));
          v54 = objc_msgSend(v53, "UTF8String");
          *(_DWORD *)buf = 67109891;
          *(_DWORD *)v151 = v47;
          *(_WORD *)&v151[4] = 1024;
          *(_DWORD *)&v151[6] = v50;
          *(_WORD *)v152 = 2112;
          *(_QWORD *)&v152[2] = v52;
          *(_WORD *)&v152[10] = 2081;
          *(_QWORD *)&v152[12] = v54;
          _os_log_debug_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "Device paired or deffered pairing for IDS device [Old: %i - Cached: %i] (BT UUID: %@) %{private}s", buf, 0x22u);

          v6 = v119;
          self = v129;

        }
LABEL_36:

      }
      v125 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v142, v153, 16);
      if (!v125)
      {
LABEL_38:

        if (objc_msgSend(v6, "count"))
        {
          v55 = 0;
          do
          {
            v138[0] = _NSConcreteStackBlock;
            v138[1] = 3221225472;
            v138[2] = sub_10005B3BC;
            v138[3] = &unk_1001E4040;
            v56 = v6;
            v139 = v56;
            v140 = v55;
            if (objc_msgSend(obj, "indexOfObjectPassingTest:", v138) == (id)0x7FFFFFFFFFFFFFFFLL)
            {
              v136 = 0u;
              v137 = 0u;
              v134 = 0u;
              v135 = 0u;
              v57 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager associatedDevices](v129, "associatedDevices"));
              v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v134, v149, 16);
              v59 = &MRAVOutputContextGetSharedAudioPresentationContext_ptr;
              if (v58)
              {
                v60 = v58;
                v61 = *(_QWORD *)v135;
                while (2)
                {
                  for (j = 0; j != v60; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v135 != v61)
                      objc_enumerationMutation(v57);
                    v63 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * (_QWORD)j);
                    v64 = objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectAtIndexedSubscript:", v55));
                    if (v64)
                    {
                      v65 = (void *)v64;
                      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectAtIndexedSubscript:", v55));
                      v67 = objc_opt_class(v59[150]);
                      if ((objc_opt_isKindOfClass(v66, v67) & 1) != 0
                        && (objc_msgSend(v63, "isConnected") & 1) != 0)
                      {
                        v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "idsDevice"));
                        v69 = objc_msgSend(v68, "deviceType");

                        v70 = v69 == (id)5;
                        v59 = &MRAVOutputContextGetSharedAudioPresentationContext_ptr;
                        if (v70)
                        {
                          v103 = sub_1000681B8("CloudPairing");
                          v104 = objc_claimAutoreleasedReturnValue(v103);
                          if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
                          {
                            v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectAtIndexedSubscript:", v55));
                            *(_DWORD *)buf = 138412290;
                            *(_QWORD *)v151 = v106;
                            _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "Skip telling btd to remove ATV that maybe in setup: %@", buf, 0xCu);

                          }
                          v6 = v119;
                          goto LABEL_78;
                        }
                      }
                      else
                      {

                      }
                    }
                  }
                  v60 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v134, v149, 16);
                  if (v60)
                    continue;
                  break;
                }
              }

              v71 = sub_1000681B8("CloudPairing");
              v72 = objc_claimAutoreleasedReturnValue(v71);
              if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
              {
                v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectAtIndexedSubscript:", v55));
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)v151 = v73;
                _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "Unpairing IDS device \"%@\" as it is no longer signed into our iCloud account", buf, 0xCu);

              }
              v132 = 0u;
              v133 = 0u;
              v130 = 0u;
              v131 = 0u;
              v128 = (id)objc_claimAutoreleasedReturnValue(-[CBIDSManager associatedDevices](v129, "associatedDevices"));
              v74 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v130, v148, 16);
              if (v74)
              {
                v75 = v74;
                v76 = *(_QWORD *)v131;
                do
                {
                  for (k = 0; k != v75; k = (char *)k + 1)
                  {
                    if (*(_QWORD *)v131 != v76)
                      objc_enumerationMutation(v128);
                    v78 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * (_QWORD)k);
                    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "idsDevice"));
                    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "uniqueID"));
                    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectAtIndexedSubscript:", v55));
                    v82 = objc_msgSend(v80, "isEqualToIgnoringCase:", v81);

                    if (v82)
                    {
                      objc_msgSend(v78, "setState:", 0);
                      v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "idsDevice"));
                      v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "uniqueID"));
                      v85 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager publicAddressForIDSDevice:](v129, "publicAddressForIDSDevice:", v84));

                      if (v85)
                      {
                        v86 = sub_1000681B8("CloudPairing");
                        v87 = objc_claimAutoreleasedReturnValue(v86);
                        if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
                        {
                          v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "idsDevice"));
                          v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "uniqueID"));
                          *(_DWORD *)buf = 138412546;
                          *(_QWORD *)v151 = v85;
                          *(_WORD *)&v151[8] = 2112;
                          *(_QWORD *)v152 = v89;
                          _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "Removing address \"%@\" for IDS device \"%@\" as it is no longer signed into our iCloud account", buf, 0x16u);

                        }
                        v90 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager CPAddressMapping](v129, "CPAddressMapping"));
                        v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "idsDevice"));
                        v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "uniqueID"));
                        objc_msgSend(v90, "removeObjectForKey:", v92);

                        v93 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager CPAddressMapping](v129, "CPAddressMapping"));
                        +[CBPreferencesManager setuserPreference:value:sync:](CBPreferencesManager, "setuserPreference:value:sync:", CFSTR("AddressMapping"), v93, 1);

                      }
                    }
                  }
                  v75 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v130, v148, 16);
                }
                while (v75);
              }

              v94 = objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectAtIndexedSubscript:", v55));
              v6 = v119;
              if (v94)
              {
                v95 = (void *)v94;
                v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectAtIndexedSubscript:", v55));
                v97 = objc_opt_class(NSString);
                isKindOfClass = objc_opt_isKindOfClass(v96, v97);

                if ((isKindOfClass & 1) != 0)
                {
                  v99 = sub_1000681B8("CloudPairing");
                  v100 = objc_claimAutoreleasedReturnValue(v99);
                  if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
                  {
                    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectAtIndexedSubscript:", v55));
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)v151 = v101;
                    _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_DEFAULT, "Tell btd to remove this device: %@", buf, 0xCu);

                  }
                  v57 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
                  v146 = CFSTR("kCloudDeviceUniqueID");
                  v104 = objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectAtIndexedSubscript:", v55));
                  v147 = v104;
                  v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v147, &v146, 1));
                  objc_msgSend(v57, "sendCloudKitMsg:args:", CFSTR("RemoveCloudPairedDevice"), v102);

LABEL_78:
                }
              }
            }

            ++v55;
          }
          while (v55 < (unint64_t)objc_msgSend(v56, "count"));
        }
        v107 = objc_msgSend(v6, "count");
        v7 = v116;
        if (v107 != objc_msgSend(obj, "count"))
        {
          v108 = objc_claimAutoreleasedReturnValue(-[CBIDSManager account](v129, "account"));
          if (v108)
          {
            v109 = (void *)v108;
            v110 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager account](v129, "account"));
            v111 = objc_msgSend(v110, "isActive");

            if (v111)
            {
              v112 = objc_claimAutoreleasedReturnValue(-[CBIDSManager _statedumpAndRecordDailyMetric](v129, "_statedumpAndRecordDailyMetric"));
              if (IsAppleInternalBuild(v112))
              {
                v113 = sub_1000681B8("CloudPairing");
                v114 = objc_claimAutoreleasedReturnValue(v113);
                if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)v151 = v112;
                  _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
                }

              }
              goto LABEL_89;
            }
          }
        }
        goto LABEL_90;
      }
    }
  }
  v115 = sub_1000681B8("CloudPairing");
  v112 = objc_claimAutoreleasedReturnValue(v115);
  if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
    sub_10016BBCC();
LABEL_89:

LABEL_90:
}

- (void)updateActiveAccount:(id)a3
{
  id v4;
  os_log_t v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  os_log_t v18;
  os_log_t v19;
  os_log_t v20;
  os_log_t v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  NSObject *v26;
  void *v27;
  os_log_t v28;
  _BOOL4 v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  int *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[4];
  int v46;
  _BYTE v47[16];
  _BYTE v48[16];
  uint8_t v49[128];
  uint8_t buf[4];
  id v51;
  __int16 v52;
  id v53;

  v4 = a3;
  v5 = sub_1000681B8("CloudPairing");
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description")));
    *(_DWORD *)buf = 136315394;
    v51 = objc_msgSend(v7, "UTF8String");
    v52 = 2048;
    v53 = objc_msgSend(v4, "count");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "MUC - updateActiveAccount - %s, count %lu", buf, 0x16u);

  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v8 = v4;
  v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v42;
    v40 = &v46;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v14, "isActive", v40) & 1) != 0)
        {
          if ((objc_msgSend(v14, "canSend") & 1) != 0)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "loginID"));

            if (v15)
            {
              v16 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager account](self, "account"));

              if (v14 == v16)
              {
                v21 = sub_1000681B8("CloudPairing");
                v22 = objc_claimAutoreleasedReturnValue(v21);
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager account](self, "account"));
                  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "loginID")));
                  v25 = objc_msgSend(v24, "UTF8String");
                  *(_DWORD *)buf = 136380675;
                  v51 = v25;
                  _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Local device is still associated with iCloud account \"%{private}s\", buf, 0xCu);

                }
                v26 = v8;
                goto LABEL_32;
              }
              v17 = v11;
              v11 = v14;
            }
            else
            {
              v20 = sub_1000681B8("CloudPairing");
              v17 = objc_claimAutoreleasedReturnValue(v20);
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                sub_10016BBF8((uint64_t)v45, (uint64_t)v14);
            }
          }
          else
          {
            v19 = sub_1000681B8("CloudPairing");
            v17 = objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              sub_10016BC58((uint64_t)v47, (uint64_t)v14);
          }
        }
        else
        {
          v18 = sub_1000681B8("CloudPairing");
          v17 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            sub_10016BCB8((uint64_t)v48, (uint64_t)v14);
        }

      }
      v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      if (v10)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }

  -[CBIDSManager setAccount:](self, "setAccount:", v11);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager account](self, "account"));

  v28 = sub_1000681B8("CloudPairing");
  v26 = objc_claimAutoreleasedReturnValue(v28);
  v29 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
  if (v27)
  {
    if (v29)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager account](self, "account"));
      v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "loginID")));
      v32 = objc_msgSend(v31, "UTF8String");
      v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudIdentifier](self, "cloudIdentifier")));
      v34 = objc_msgSend(v33, "UTF8String");
      *(_DWORD *)buf = 136380931;
      v51 = v32;
      v52 = 2080;
      v53 = v34;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "MUC - Local device is now associated with iCloud account \"%{private}s\" and identifier %s", buf, 0x16u);

    }
  }
  else
  {
    if (v29)
    {
      v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudIdentifier](self, "cloudIdentifier")));
      v36 = objc_msgSend(v35, "UTF8String");
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager localDeviceRandomAddress](self, "localDeviceRandomAddress"));
      *(_DWORD *)buf = 136315394;
      v51 = v36;
      v52 = 2112;
      v53 = v37;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "MUC - Local device %s is not associated with any iCloud accounts with RSA %@", buf, 0x16u);

    }
    -[CBIDSManager setTotalCloudDeviceCount:](self, "setTotalCloudDeviceCount:", 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager unpairedIDSCloudIdentifiers](self, "unpairedIDSCloudIdentifiers"));
    objc_msgSend(v38, "removeAllObjects");

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager messageIdentifiersWaitingForAck](self, "messageIdentifiersWaitingForAck"));
    objc_msgSend(v39, "removeAllObjects");

    v26 = objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    -[NSObject postNotificationName:object:userInfo:](v26, "postNotificationName:object:userInfo:", CFSTR("BTTotalIDSDeviceCountChanged"), 0, &off_1001F4278);
  }
LABEL_32:

}

- (unint64_t)keyLength
{
  return 16;
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v5;
  os_log_t v6;
  NSObject *v7;
  id v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;

  v5 = a4;
  v6 = sub_1000681B8("CloudPairing");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description")));
    v9 = 136315394;
    v10 = objc_msgSend(v8, "UTF8String");
    v11 = 2048;
    v12 = objc_msgSend(v5, "count");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "MUC - Active service accounts changed - %s, accounts %lu", (uint8_t *)&v9, 0x16u);

  }
  -[CBIDSManager updateActiveAccount:](self, "updateActiveAccount:", v5);

}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v6;
  id v7;
  os_log_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  os_log_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  os_log_t v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[2];
  _QWORD v41[2];
  uint8_t v42[128];
  uint8_t buf[4];
  id v44;

  v6 = a3;
  v7 = a4;
  v8 = sub_1000681B8("CloudPairing");
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v44 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "MUC - devicesChanged - %@", buf, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudIdentifier](self, "cloudIdentifier"));
  if (v10
    || (v11 = (void *)IDSCopyLocalDeviceUniqueID(),
        -[CBIDSManager setCloudIdentifier:](self, "setCloudIdentifier:", v11),
        v11,
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudIdentifier](self, "cloudIdentifier")),
        v12,
        v12))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager account](self, "account"));
    if (!v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accounts"));
      v15 = objc_msgSend(v14, "count");

      if (!v15)
      {
LABEL_11:
        v35 = v6;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
        objc_msgSend(v19, "beginTransaction:", CFSTR("IDSdevicesChanged"));

        v20 = objc_claimAutoreleasedReturnValue(-[CBIDSManager filteredDevicesForIDSDevices:](self, "filteredDevicesForIDSDevices:", v7));
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager associatedDevices](self, "associatedDevices"));
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v37;
          do
          {
            v26 = 0;
            do
            {
              if (*(_QWORD *)v37 != v25)
                objc_enumerationMutation(v22);
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1)
                                                                                 + 8 * (_QWORD)v26), "idsDevice"));
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "uniqueID"));
              objc_msgSend(v21, "addObject:", v28);

              v26 = (char *)v26 + 1;
            }
            while (v24 != v26);
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
          }
          while (v24);
        }

        -[CBIDSManager updateCloudPairings:newDevices:](self, "updateCloudPairings:newDevices:", v21, v20);
        -[CBIDSManager setAssociatedDevices:](self, "setAssociatedDevices:", v20);
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
        objc_msgSend(v29, "endTransaction:", CFSTR("IDSdevicesChanged"));

        -[CBIDSManager setTotalCloudDeviceCount:](self, "setTotalCloudDeviceCount:", (char *)objc_msgSend(v7, "count") + 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        if (v7)
          v31 = v7;
        else
          v31 = &__NSArray0__struct;
        v40[0] = CFSTR("IDSDevices");
        v40[1] = CFSTR("TotalIDSDevices");
        v41[0] = v31;
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[CBIDSManager totalCloudDeviceCount](self, "totalCloudDeviceCount")));
        v41[1] = v32;
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v41, v40, 2));
        objc_msgSend(v30, "postNotificationName:object:userInfo:", CFSTR("BTTotalIDSDeviceCountChanged"), 0, v33);

        v6 = v35;
        goto LABEL_22;
      }
      v16 = sub_1000681B8("CloudPairing");
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accounts"));
        *(_DWORD *)buf = 138412290;
        v44 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "No account but got devicesChanged, update account status - %@", buf, 0xCu);

      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accounts"));
      -[CBIDSManager service:activeAccountsChanged:](self, "service:activeAccountsChanged:", v6, v13);
    }

    goto LABEL_11;
  }
  v34 = sub_1000681B8("CloudPairing");
  v20 = objc_claimAutoreleasedReturnValue(v34);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    sub_10016BD18();
LABEL_22:

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  _BOOL4 v8;
  id v10;
  id v11;
  os_log_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;

  v8 = a6;
  v10 = a5;
  v11 = a7;
  v12 = sub_1000681B8("CloudPairing");
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if (v8)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 136315138;
      v20 = objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Message %s sent successfully", (uint8_t *)&v19, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10016BD44();

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager messageIdentifiersWaitingForAck](self, "messageIdentifiersWaitingForAck"));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", v10));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject idsDevice](v14, "idsDevice"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager deviceForIDSDevice:createNew:](self, "deviceForIDSDevice:createNew:", v16, 0));

    objc_msgSend(v17, "setState:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager messageIdentifiersWaitingForAck](self, "messageIdentifiersWaitingForAck"));
    objc_msgSend(v18, "removeObjectForKey:", v10);

  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  os_log_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  unsigned int v18;
  os_log_t v19;
  NSObject *v20;
  os_log_t v21;
  NSObject *v22;
  int v23;
  NSObject *v24;
  __int16 v25;
  id v26;

  v8 = a5;
  v9 = a6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  objc_msgSend(v10, "beginTransaction:", CFSTR("IDSincomingMessage"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager service](self, "service"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "deviceForFromID:", v9));

  if (v12)
  {
    v13 = objc_claimAutoreleasedReturnValue(-[CBIDSManager deviceForIDSDevice:createNew:](self, "deviceForIDSDevice:createNew:", v12, 0));
    v14 = sub_1000681B8("CloudPairing");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = v15;
    if (v13)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v23 = 138478083;
        v24 = v13;
        v25 = 2113;
        v26 = v8;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Received message from IDS device %{private}@: %{private}@", (uint8_t *)&v23, 0x16u);
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MessageType")));
      v18 = objc_msgSend(CFSTR("CloudPairing"), "isEqualToString:", v17);

      if (v18)
      {
        -[CBIDSManager handleCloudPairingMessage:from:](self, "handleCloudPairingMessage:from:", v8, v13);
      }
      else
      {
        v21 = sub_1000681B8("CloudPairing");
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          sub_10016BE5C(v8);

      }
      v16 = objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
      -[NSObject endTransaction:](v16, "endTransaction:", CFSTR("IDSincomingMessage"));
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      sub_10016BDDC(v8);
    }
    goto LABEL_15;
  }
  v19 = sub_1000681B8("CloudPairing");
  v13 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v20 = objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description")));
    v23 = 136315394;
    v24 = v20;
    v25 = 2080;
    v26 = -[NSObject UTF8String](v16, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Failed to retrieve IDS device from destination \"%s\" - ignoring message %s", (uint8_t *)&v23, 0x16u);
LABEL_15:

  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 fromID:(id)a6 hasBeenDeliveredWithContext:(id)a7
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  os_log_t v20;
  NSObject *v21;
  id v22;
  id v23;
  const char *v24;
  os_log_t v25;
  id v26;
  os_log_t v27;
  _BOOL4 v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;

  v9 = a5;
  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager service](self, "service"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "deviceForFromID:", v10));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager messageIdentifiersWaitingForAck](self, "messageIdentifiersWaitingForAck"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v9));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "idsDevice"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager deviceForIDSDevice:createNew:](self, "deviceForIDSDevice:createNew:", v15, 0));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "idsDevice"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "uniqueID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-RePairingRequest-%@"), v9, v18));

  if (objc_msgSend(v16, "state") == (id)2)
  {
    objc_msgSend(v16, "setState:", 3);
    v20 = sub_1000681B8("CloudPairing");
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uniqueID")));
      *(_DWORD *)buf = 136315394;
      v34 = v22;
      v35 = 2080;
      v36 = objc_msgSend(v23, "UTF8String");
      v24 = "Pairing Request Message %s has been delivered to: %s";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v24, buf, 0x16u);

    }
  }
  else if (objc_msgSend(v16, "state") == (id)4)
  {
    objc_msgSend(v16, "setState:", 5);
    v25 = sub_1000681B8("CloudPairing");
    v21 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v26 = objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uniqueID")));
      *(_DWORD *)buf = 136315394;
      v34 = v26;
      v35 = 2080;
      v36 = objc_msgSend(v23, "UTF8String");
      v24 = "Pairing Response Message %s has been delivered to: %s";
      goto LABEL_12;
    }
  }
  else
  {
    v27 = sub_1000681B8("CloudPairing");
    v21 = objc_claimAutoreleasedReturnValue(v27);
    v28 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v19)
    {
      if (v28)
      {
        v29 = objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
        v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uniqueID")));
        *(_DWORD *)buf = 136315394;
        v34 = v29;
        v35 = 2080;
        v36 = objc_msgSend(v23, "UTF8String");
        v24 = "RePairing Message %s has been delivered to: %s";
        goto LABEL_12;
      }
    }
    else if (v28)
    {
      v30 = objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uniqueID")));
      *(_DWORD *)buf = 136315394;
      v34 = v30;
      v35 = 2080;
      v36 = objc_msgSend(v23, "UTF8String");
      v24 = "Message %s has been delivered to: %s";
      goto LABEL_12;
    }
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager messageIdentifiersWaitingForAck](self, "messageIdentifiersWaitingForAck"));
  objc_msgSend(v31, "removeObjectForKey:", v9);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager messageIdentifiersWaitingForAck](self, "messageIdentifiersWaitingForAck"));
  objc_msgSend(v32, "removeObjectForKey:", v19);

}

- (id)filteredDevicesForIDSDevices:(id)a3
{
  id v4;
  void *v5;
  os_log_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  unsigned int v14;
  unsigned int v15;
  os_log_t v16;
  NSObject *v17;
  os_log_t v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v25[5];
  id v26;
  char v27;
  char v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  _BYTE v32[10];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = sub_1000681B8("CloudPairing");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager account](self, "account"));
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "loginID")));
    v10 = objc_msgSend(v9, "UTF8String");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudIdentifier](self, "cloudIdentifier")));
    *(_DWORD *)buf = 136380931;
    v30 = v10;
    v31 = 2080;
    *(_QWORD *)v32 = objc_msgSend(v11, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Local device is associated with iCloud account \"%{private}s\" and identifier %s", buf, 0x16u);

  }
  v12 = objc_autoreleasePoolPush();
  v13 = (void *)MGCopyAnswer(CFSTR("DeviceClass"), 0);
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("iPhone"));
  v15 = objc_msgSend(v13, "isEqualToString:", CFSTR("Watch"));
  v16 = sub_1000681B8("CloudPairing");
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v30 = v13;
    v31 = 1024;
    *(_DWORD *)v32 = v14;
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Local device is %@ isLocalDevicePhone=%d isLocalDeviceWatch=%d", buf, 0x18u);
  }

  objc_autoreleasePoolPop(v12);
  v18 = sub_1000681B8("CloudPairing");
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager CPAddressMapping](self, "CPAddressMapping"));
    *(_DWORD *)buf = 138412290;
    v30 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "PublicAddressForIDSDevice: current mapping :%@", buf, 0xCu);

  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10005C918;
  v25[3] = &unk_1001E4068;
  v25[4] = self;
  v27 = v15;
  v28 = v14;
  v21 = v5;
  v26 = v21;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v25);
  v22 = v26;
  v23 = v21;

  return v23;
}

- (id)deviceForIDSDevice:(id)a3 createNew:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  os_log_t v10;
  NSObject *v11;
  os_log_t v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  os_log_t v16;
  NSObject *v17;
  void *v18;
  uint8_t v20[8];
  _QWORD v21[4];
  id v22;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager associatedDevices](self, "associatedDevices"));

  if (!v7)
    goto LABEL_3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager associatedDevices](self, "associatedDevices"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10005D388;
  v21[3] = &unk_1001E4090;
  v22 = v6;
  v9 = objc_msgSend(v8, "indexOfObjectPassingTest:", v21);

  if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v16 = sub_1000681B8("CloudPairing");
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "CloudPaired Device found, returning it", v20, 2u);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager associatedDevices](self, "associatedDevices"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", v9));

  }
  else
  {
LABEL_3:
    v10 = sub_1000681B8("CloudPairing");
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CloudPaired Device not found", v20, 2u);
    }

    v12 = sub_1000681B8("CloudPairing");
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v14)
      {
        *(_WORD *)v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "New CloudPaired Device created and returned", v20, 2u);
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[CloudDevice deviceWithIDSDevice:](CloudDevice, "deviceWithIDSDevice:", v6));
    }
    else
    {
      if (v14)
      {
        *(_WORD *)v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "New CloudPaired Device will not be created", v20, 2u);
      }

      v15 = 0;
    }
  }

  return v15;
}

- (void)handleCloudPairingMessage:(id)a3 from:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  os_log_t v15;
  NSObject *v16;
  dispatch_time_t v17;
  unsigned int v18;
  os_log_t v19;
  NSObject *v20;
  NSObject *v21;
  uint8_t v22[8];
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("Version 3")));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Version 3")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MessageType")));
    if (objc_msgSend(CFSTR("InitiatorPairingKeys"), "isEqualToString:", v10))
    {
      v11 = CFSTR("Version 3");
LABEL_7:
      -[CBIDSManager handleInitiatorPairingKeys:from:forProtocolID:](self, "handleInitiatorPairingKeys:from:forProtocolID:", v9, v7, v11);
LABEL_16:

      goto LABEL_17;
    }
    if (!objc_msgSend(CFSTR("ResponderPairingKeys"), "isEqualToString:", v10))
      goto LABEL_16;
    v13 = CFSTR("Version 3");
    goto LABEL_15;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("Version 2")));

  if (v12)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Version 2")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MessageType")));
    if (objc_msgSend(CFSTR("InitiatorPairingKeys"), "isEqualToString:", v10))
    {
      v11 = CFSTR("Version 2");
      goto LABEL_7;
    }
    if (!objc_msgSend(CFSTR("ResponderPairingKeys"), "isEqualToString:", v10))
      goto LABEL_16;
    v13 = CFSTR("Version 2");
LABEL_15:
    -[CBIDSManager handleResponderPairingKeys:from:forProtocolID:](self, "handleResponderPairingKeys:from:forProtocolID:", v9, v7, v13);
    goto LABEL_16;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("Version 1")));

  if (v14)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Version 1")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MessageType")));
    if (objc_msgSend(CFSTR("SecurityRequest"), "isEqualToString:", v10))
    {
      -[CBIDSManager handleSecurityRequest:from:](self, "handleSecurityRequest:from:", v9, v7);
    }
    else if (objc_msgSend(CFSTR("RepairRequest"), "isEqualToString:", v10))
    {
      -[CBIDSManager handleRepairRequest:from:](self, "handleRepairRequest:from:", v9, v7);
    }
    else if (objc_msgSend(CFSTR("PairingRequest"), "isEqualToString:", v10))
    {
      -[CBIDSManager handlePairingRequest:from:](self, "handlePairingRequest:from:", v9, v7);
    }
    else if (objc_msgSend(CFSTR("PairingResponse"), "isEqualToString:", v10))
    {
      -[CBIDSManager handlePairingResponse:from:](self, "handlePairingResponse:from:", v9, v7);
    }
    else if (objc_msgSend(CFSTR("KeyDistribution"), "isEqualToString:", v10))
    {
      -[CBIDSManager handleKeyDistribution:from:](self, "handleKeyDistribution:from:", v9, v7);
    }
    else if (objc_msgSend(CFSTR("PairingFailure"), "isEqualToString:", v10))
    {
      -[CBIDSManager handlePairingFailure:from:](self, "handlePairingFailure:from:", v9, v7);
    }
    else if (objc_msgSend(CFSTR("UnpairCommand"), "isEqualToString:", v10))
    {
      -[CBIDSManager handleUnpairCommand:from:](self, "handleUnpairCommand:from:", v9, v7);
    }
    else if (objc_msgSend(CFSTR("CloudKitFetch"), "isEqualToString:", v10))
    {
      v17 = dispatch_time(0, 2000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10005D814;
      block[3] = &unk_1001E20E8;
      block[4] = self;
      dispatch_after(v17, (dispatch_queue_t)&_dispatch_main_q, block);
    }
    else
    {
      v18 = objc_msgSend(CFSTR("ManateeKeysUpdated"), "isEqualToString:", v10);
      v19 = sub_1000681B8("CloudPairing");
      v20 = objc_claimAutoreleasedReturnValue(v19);
      v21 = v20;
      if (v18)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v22 = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "IDS: Manatee keys updated", v22, 2u);
        }
      }
      else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        sub_10016BF58();
      }

    }
    goto LABEL_16;
  }
  v15 = sub_1000681B8("CloudPairing");
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    sub_10016BEDC(v7);

LABEL_17:
}

- (void)handleInitiatorPairingKeys:(id)a3 from:(id)a4 forProtocolID:(id)a5
{
  id v8;
  os_log_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  double v21;
  void *i;
  void *v23;
  void *v24;
  void *v25;
  float v26;
  float v27;
  _BOOL4 v28;
  os_log_t v29;
  _BOOL4 v30;
  id v31;
  id v32;
  NSObject *v33;
  unint64_t v34;
  NSString *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  void *j;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  unint64_t v59;
  void *v60;
  id *v61;
  unint64_t v62;
  id *v63;
  id *v64;
  id *v65;
  unint64_t v66;
  id v67;
  void *v68;
  void *v69;
  NSObject *v70;
  id v71;
  id v72;
  void *v73;
  _QWORD v74[10];
  _QWORD v75[5];
  id v76;
  id v77;
  _QWORD v78[2];
  _QWORD v79[10];
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _QWORD v84[4];
  id v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _QWORD v90[4];
  id v91;
  _QWORD v92[7];
  _QWORD v93[7];
  __int128 buf;
  uint64_t v95;
  uint64_t (*v96)(uint64_t, uint64_t);
  void (*v97)(uint64_t);
  id v98;
  _BYTE v99[128];
  _BYTE v100[128];

  v72 = a3;
  v8 = a4;
  v71 = a5;
  v73 = v8;
  LOBYTE(a5) = (id)-[CBIDSManager roleWithDevice:](self, "roleWithDevice:", v8) == (id)2;
  v9 = sub_1000681B8("CloudPairing");
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if ((a5 & 1) != 0)
  {
    v12 = v10;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "description")));
      LODWORD(buf) = 136380675;
      *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v13, "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "MUC - Received 'InitiatorPairingKeys' message from IDS device %{private}s", (uint8_t *)&buf, 0xCu);

      v12 = v11;
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "idsDevice"));
    v70 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uniqueID"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", -[NSObject length](v70, "length")));
    v16 = -[NSObject length](v70, "length");
    v90[0] = _NSConcreteStackBlock;
    v90[1] = 3221225472;
    v90[2] = sub_10005E474;
    v90[3] = &unk_1001E40B8;
    v17 = v15;
    v91 = v17;
    -[NSObject enumerateSubstringsInRange:options:usingBlock:](v70, "enumerateSubstringsInRange:options:usingBlock:", 0, v16, 258, v90);
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    v18 = objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudDevices](self, "cloudDevices"));
    v19 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v86, v100, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v87;
      v21 = 0.0;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v87 != v20)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * (_QWORD)i);
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", v17));

          if (v24)
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", v17));
            objc_msgSend(v25, "floatValue");
            v27 = v26;

            v21 = v27;
          }
        }
        v19 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v86, v100, 16);
      }
      while (v19);

      if (v21 == 0.0)
      {
LABEL_22:
        v18 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        v35 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), mach_absolute_time());
        v68 = (void *)objc_claimAutoreleasedReturnValue(v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "idsDevice"));
        v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "uniqueID"));

        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", objc_msgSend(v69, "length")));
        v38 = objc_msgSend(v69, "length");
        v84[0] = _NSConcreteStackBlock;
        v84[1] = 3221225472;
        v84[2] = sub_10005E480;
        v84[3] = &unk_1001E40B8;
        v39 = v37;
        v85 = v39;
        objc_msgSend(v69, "enumerateSubstringsInRange:options:usingBlock:", 0, v38, 258, v84);
        -[NSObject setObject:forKey:](v18, "setObject:forKey:", v68, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudDevices](self, "cloudDevices"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v40));

        v82 = 0u;
        v83 = 0u;
        v80 = 0u;
        v81 = 0u;
        v42 = v41;
        v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v80, v99, 16);
        if (v43)
        {
          v44 = *(_QWORD *)v81;
          do
          {
            for (j = 0; j != v43; j = (char *)j + 1)
            {
              if (*(_QWORD *)v81 != v44)
                objc_enumerationMutation(v42);
              v46 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)j);
              v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectForKey:", v39));

              if (v47)
              {
                v48 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudDevices](self, "cloudDevices"));
                objc_msgSend(v48, "removeObject:", v46);

              }
            }
            v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v80, v99, 16);
          }
          while (v43);
        }

        v49 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudDevices](self, "cloudDevices"));
        objc_msgSend(v49, "addObject:", v18);

        v50 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudDevices](self, "cloudDevices"));
        +[CBPreferencesManager setuserPreference:value:sync:](CBPreferencesManager, "setuserPreference:value:sync:", CFSTR("CloudDevice"), v50, 1);

        v67 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", CFSTR("PublicKeys"), CFSTR("IdentityKeys"), 0);
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v95 = 0x3032000000;
        v96 = sub_10005E48C;
        v97 = sub_10005E49C;
        v93[0] = CFSTR("ResponderPairingKeys");
        v92[0] = CFSTR("MessageType");
        v92[1] = CFSTR("DeviceName");
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager localDeviceName](self, "localDeviceName"));
        v93[1] = v51;
        v92[2] = CFSTR("PublicAddress");
        v52 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager publicAddress](self, "publicAddress"));
        v93[2] = v52;
        v92[3] = CFSTR("TimeStamp");
        v92[4] = CFSTR("EncryptionType");
        v93[3] = v68;
        v93[4] = CFSTR("ECDH");
        v92[5] = CFSTR("RequestedKeyLength");
        v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CBIDSManager keyLength](self, "keyLength")));
        v93[5] = v53;
        v92[6] = CFSTR("RequestedKeyType");
        v93[6] = v67;
        v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v93, v92, 7));
        v98 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v54));

        v55 = objc_msgSend(v72, "mutableCopy");
        v56 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager localDeviceRandomAddress](self, "localDeviceRandomAddress"));

        if (v56)
        {
          v57 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager localDeviceRandomAddress](self, "localDeviceRandomAddress"));
          objc_msgSend(v55, "setObject:forKey:", v57, CFSTR("IDSLocalRandomAddress"));

        }
        if (objc_msgSend(v71, "isEqualToString:", CFSTR("Version 3")))
        {
          v58 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager localDeviceRandomAddress](self, "localDeviceRandomAddress"));

          if (!v58)
          {
            v66 = -[CBIDSManager keyLength](self, "keyLength");
            v75[0] = _NSConcreteStackBlock;
            v75[1] = 3221225472;
            v75[2] = sub_10005E628;
            v75[3] = &unk_1001E4108;
            v78[1] = &buf;
            v75[4] = self;
            v76 = v73;
            v77 = v72;
            v78[0] = v71;
            -[CBIDSManager generateKeyDictForTypes:keyLength:forAddress:withCompletion:](self, "generateKeyDictForTypes:keyLength:forAddress:withCompletion:", v67, v66, 0, v75);
            v63 = &v76;
            v64 = &v77;
            v65 = (id *)v78;
            goto LABEL_38;
          }
          v59 = -[CBIDSManager keyLength](self, "keyLength");
          v60 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager localDeviceRandomAddress](self, "localDeviceRandomAddress"));
          v79[0] = _NSConcreteStackBlock;
          v79[1] = 3221225472;
          v79[2] = sub_10005E4A4;
          v79[3] = &unk_1001E40E0;
          v61 = (id *)v79;
          v79[9] = &buf;
          v79[4] = self;
          v79[5] = v73;
          v79[6] = v72;
          v79[7] = v55;
          v79[8] = v71;
          -[CBIDSManager generateKeyDictForTypes:keyLength:forAddress:withCompletion:](self, "generateKeyDictForTypes:keyLength:forAddress:withCompletion:", v67, v59, v60, v79);

        }
        else
        {
          v62 = -[CBIDSManager keyLength](self, "keyLength");
          v74[0] = _NSConcreteStackBlock;
          v74[1] = 3221225472;
          v74[2] = sub_10005E77C;
          v74[3] = &unk_1001E40E0;
          v61 = (id *)v74;
          v74[9] = &buf;
          v74[4] = self;
          v74[5] = v73;
          v74[6] = v72;
          v74[7] = v55;
          v74[8] = v71;
          -[CBIDSManager generateKeyDictForTypes:keyLength:forAddress:withCompletion:](self, "generateKeyDictForTypes:keyLength:forAddress:withCompletion:", v67, v62, 0, v74);
        }
        v63 = v61 + 5;
        v64 = v61 + 6;
        v65 = v61 + 7;

LABEL_38:
        _Block_object_dispose(&buf, 8);

LABEL_39:
        v33 = v70;
        goto LABEL_40;
      }
      v28 = (double)-[CBIDSManager timeStamp](self, "timeStamp") - v21 < 0.0;
      v29 = sub_1000681B8("CloudPairing");
      v18 = objc_claimAutoreleasedReturnValue(v29);
      v30 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      if (v28)
      {
        if (v30)
        {
          v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "description")));
          v32 = objc_msgSend(v31, "UTF8String");
          LODWORD(buf) = 136380675;
          *(_QWORD *)((char *)&buf + 4) = v32;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Received 'InitiatorPairingKeys' local Timestamp saved is newer than received message: %{private}s", (uint8_t *)&buf, 0xCu);

        }
        goto LABEL_39;
      }
      if (v30)
      {
        v34 = -[CBIDSManager timeStamp](self, "timeStamp");
        LODWORD(buf) = 134217984;
        *(double *)((char *)&buf + 4) = (double)v34 - v21;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Received 'InitiatorPairingKeys' Time to receive message: %f", (uint8_t *)&buf, 0xCu);
      }
    }

    goto LABEL_22;
  }
  v33 = v10;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    sub_10016BFE4(v73, self);
    v33 = v11;
  }
LABEL_40:

}

- (void)generateKeyDictForTypes:(id)a3 keyLength:(unint64_t)a4 forAddress:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  os_log_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = sub_1000681B8("CloudPairing");
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = v10;
    v23 = 2112;
    v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "MUC - generateKeyDictForTypes: %@ for local address: %@", buf, 0x16u);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v10, CFSTR("kCloudPairingKeyTypes"), v15, CFSTR("kCloudPairingKeyLength"), 0));

  if (v11)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v11, CFSTR("kLocalRandomAddress"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10005EAA8;
  v19[3] = &unk_1001E4130;
  v19[4] = self;
  v20 = v12;
  v18 = v12;
  objc_msgSend(v17, "sendCloudKitMsg:args:withReply:", CFSTR("GenerateCloudPairingKeys"), v16, v19);

}

- (void)cloudPairingCompletedWithResponse:(id)a3 localKeys:(id)a4 from:(id)a5 forProtocolID:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  os_log_t v19;
  NSObject *v20;
  void *v21;
  id v22;
  _QWORD v24[5];
  id v25;
  uint8_t buf[4];
  void *v27;

  v9 = a5;
  if (a4)
    v10 = a4;
  else
    v10 = &__NSDictionary0__struct;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "idsDevice"));
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uniqueID"));
  v16 = (void *)v15;
  if (v15)
    v17 = (void *)v15;
  else
    v17 = &__NSDictionary0__struct;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v13, CFSTR("kCloudPairingCompleteResponse"), v10, CFSTR("kCloudPairingLocalKeys"), v17, CFSTR("kCloudDeviceUniqueID"), v11, CFSTR("kCloudPairingProtocolID"), 0));

  v19 = sub_1000681B8("CloudPairing");
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v27 = v18;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Sending args for cloudPairingCompletedWithResponse: %{private}@", buf, 0xCu);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10005EE88;
  v24[3] = &unk_1001E4158;
  v24[4] = self;
  v25 = v9;
  v22 = v9;
  objc_msgSend(v21, "sendCloudKitMsg:args:withReply:", CFSTR("CloudPairingComplete"), v18, v24);

}

- (unint64_t)roleWithDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  os_log_t v12;
  NSObject *v13;
  os_log_t v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudIdentifier](self, "cloudIdentifier"));

  if (!v5)
  {
    v12 = sub_1000681B8("CloudPairing");
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10016C1E8(v4);
    goto LABEL_11;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsDevice"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueID"));

  if (!v7)
  {
    v14 = sub_1000681B8("CloudPairing");
    v13 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10016C264(v4);
LABEL_11:

    v11 = 0;
    goto LABEL_12;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudIdentifier](self, "cloudIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsDevice"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueID"));
  if (objc_msgSend(v8, "compare:", v10) == (id)1)
    v11 = 1;
  else
    v11 = 2;

LABEL_12:
  return v11;
}

- (void)handleResponderPairingKeys:(id)a3 from:(id)a4 forProtocolID:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  os_log_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[CBIDSManager roleWithDevice:](self, "roleWithDevice:", v9);
  v12 = sub_1000681B8("CloudPairing");
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if (v11 == 1)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description")));
      v19 = 136380675;
      v20 = objc_msgSend(v15, "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Received 'ResponderPairingKeys' message from IDS device %{private}s", (uint8_t *)&v19, 0xCu);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "idsDevice"));
    -[CBIDSManager storePublicAddressMapping:message:](self, "storePublicAddressMapping:message:", v16, v8);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager localDeviceRandomAddress](self, "localDeviceRandomAddress"));
    if (!v17)
    {
      -[CBIDSManager cloudPairingCompletedWithResponse:localKeys:from:forProtocolID:](self, "cloudPairingCompletedWithResponse:localKeys:from:forProtocolID:", v8, 0, v9, v10);
      goto LABEL_9;
    }
    v14 = objc_msgSend(v8, "mutableCopy");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager localDeviceRandomAddress](self, "localDeviceRandomAddress"));
    -[NSObject setObject:forKey:](v14, "setObject:forKey:", v18, CFSTR("IDSLocalRandomAddress"));

    -[CBIDSManager cloudPairingCompletedWithResponse:localKeys:from:forProtocolID:](self, "cloudPairingCompletedWithResponse:localKeys:from:forProtocolID:", v14, 0, v9, v10);
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    sub_10016C2E0();
  }

LABEL_9:
}

- (void)handleSecurityRequest:(id)a3 from:(id)a4
{
  id v5;
  os_log_t v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  os_log_t v11;
  NSObject *v12;
  os_log_t v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;

  v5 = a4;
  if ((id)-[CBIDSManager roleWithDevice:](self, "roleWithDevice:", v5) == (id)1)
  {
    if (objc_msgSend(v5, "state") && objc_msgSend(v5, "state") != (id)6)
    {
      v13 = sub_1000681B8("CloudPairing");
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description")));
        v16 = objc_msgSend(v15, "UTF8String");
        v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stateString")));
        v18 = 136380931;
        v19 = v16;
        v20 = 2080;
        v21 = objc_msgSend(v17, "UTF8String");
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Dropping 'security request' message from IDS device %{private}s as our state is '%s'", (uint8_t *)&v18, 0x16u);

      }
    }
    else
    {
      v6 = sub_1000681B8("CloudPairing");
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description")));
        v9 = objc_msgSend(v8, "UTF8String");
        v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stateString")));
        v18 = 136380931;
        v19 = v9;
        v20 = 2080;
        v21 = objc_msgSend(v10, "UTF8String");
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received 'security request' message from IDS device %{private}s with current state is '%s'", (uint8_t *)&v18, 0x16u);

      }
      -[CBIDSManager initiatePairing:](self, "initiatePairing:", v5);
    }
  }
  else
  {
    v11 = sub_1000681B8("CloudPairing");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10016C378();

  }
}

- (void)handleRepairRequest:(id)a3 from:(id)a4
{
  id v5;
  os_log_t v6;
  NSObject *v7;
  id v8;
  int v9;
  id v10;

  v5 = a4;
  v6 = sub_1000681B8("CloudPairing");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description")));
    v9 = 136380675;
    v10 = objc_msgSend(v8, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received 'Repair request' message from IDS device %{private}s", (uint8_t *)&v9, 0xCu);

  }
  -[CBIDSManager initiatePairing:](self, "initiatePairing:", v5);

}

- (void)handlePairingRequest:(id)a3 from:(id)a4
{
  id v6;
  id v7;
  os_log_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  os_log_t v14;
  NSObject *v15;
  os_log_t v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;

  v6 = a3;
  v7 = a4;
  if (-[CBIDSManager validateMessage:from:](self, "validateMessage:from:", v6, v7))
  {
    if ((id)-[CBIDSManager roleWithDevice:](self, "roleWithDevice:", v7) == (id)2)
    {
      if (objc_msgSend(v7, "state") && objc_msgSend(v7, "state") != (id)1)
      {
        v16 = sub_1000681B8("CloudPairing");
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description")));
          v19 = objc_msgSend(v18, "UTF8String");
          v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stateString")));
          *(_DWORD *)buf = 136380931;
          v25 = v19;
          v26 = 2080;
          v27 = objc_msgSend(v20, "UTF8String");
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Dropping 'pairing request' message from IDS device %{private}s as our state is '%s'", buf, 0x16u);

        }
      }
      else
      {
        v8 = sub_1000681B8("CloudPairing");
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description")));
          *(_DWORD *)buf = 136380675;
          v25 = objc_msgSend(v10, "UTF8String");
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received 'pairing request' message from IDS device %{private}s", buf, 0xCu);

        }
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RequestedKeyType")));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RequestedKeyLength")));
        v13 = objc_msgSend(v12, "unsignedIntegerValue");
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_10005FD20;
        v21[3] = &unk_1001E4180;
        v21[4] = self;
        v22 = v6;
        v23 = v7;
        -[CBIDSManager generateKeyDictForTypes:keyLength:forAddress:withCompletion:](self, "generateKeyDictForTypes:keyLength:forAddress:withCompletion:", v11, v13, 0, v21);

      }
    }
    else
    {
      v14 = sub_1000681B8("CloudPairing");
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_10016C410();

    }
  }

}

- (void)handlePairingResponse:(id)a3 from:(id)a4
{
  id v6;
  id v7;
  os_log_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  os_log_t v16;
  os_log_t v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;

  v6 = a3;
  v7 = a4;
  if (-[CBIDSManager validateMessage:from:](self, "validateMessage:from:", v6, v7))
  {
    if ((id)-[CBIDSManager roleWithDevice:](self, "roleWithDevice:", v7) == (id)1)
    {
      if (objc_msgSend(v7, "state") == (id)2 && objc_msgSend(v7, "state") == (id)3)
      {
        v8 = sub_1000681B8("CloudPairing");
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description")));
          *(_DWORD *)buf = 136380675;
          v26 = objc_msgSend(v10, "UTF8String");
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received 'pairing response' message from IDS device %{private}s", buf, 0xCu);

        }
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RequestedKeys")));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RequestedKeyType")));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RequestedKeyLength")));
        v14 = objc_msgSend(v13, "unsignedIntegerValue");
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_1000601AC;
        v21[3] = &unk_1001E41A8;
        v21[4] = self;
        v22 = v6;
        v23 = v11;
        v24 = v7;
        v15 = v11;
        -[CBIDSManager generateKeyDictForTypes:keyLength:forAddress:withCompletion:](self, "generateKeyDictForTypes:keyLength:forAddress:withCompletion:", v12, v14, 0, v21);

      }
      else
      {
        v17 = sub_1000681B8("CloudPairing");
        v15 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description")));
          v19 = objc_msgSend(v18, "UTF8String");
          v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stateString")));
          *(_DWORD *)buf = 136380931;
          v26 = v19;
          v27 = 2080;
          v28 = objc_msgSend(v20, "UTF8String");
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Dropping 'pairing response' message from IDS device %{private}s as our state is '%s'", buf, 0x16u);

        }
      }
    }
    else
    {
      v16 = sub_1000681B8("CloudPairing");
      v15 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_10016C4A8();
    }

  }
}

- (void)handleKeyDistribution:(id)a3 from:(id)a4
{
  id v6;
  id v7;
  os_log_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  id v17;
  unint64_t v18;
  void *v19;
  NSObject *v20;
  os_log_t v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  NSString *v27;
  void *v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;

  v6 = a3;
  v7 = a4;
  if (-[CBIDSManager validateMessage:from:](self, "validateMessage:from:", v6, v7))
  {
    if (objc_msgSend(v7, "state") != (id)4 || objc_msgSend(v7, "state") != (id)5)
    {
      v21 = sub_1000681B8("CloudPairing");
      v20 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description")));
        v23 = objc_msgSend(v22, "UTF8String");
        v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stateString")));
        *(_DWORD *)buf = 136380931;
        v30 = v23;
        v31 = 2080;
        v32 = objc_msgSend(v24, "UTF8String");
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Dropping 'key distribution' message from IDS device %{private}s as our state is '%s'", buf, 0x16u);

      }
      goto LABEL_14;
    }
    v8 = sub_1000681B8("CloudPairing");
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description")));
      *(_DWORD *)buf = 136380675;
      v30 = objc_msgSend(v10, "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received 'key distribution' message from IDS device %{private}s", buf, 0xCu);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LocalKeys")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("LTKLength")));
    v13 = objc_msgSend(v12, "unsignedIntegerValue");
    v14 = -[CBIDSManager keyLength](self, "keyLength");

    if (v13 == (id)v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RequestedKeys")));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("LTKLength")));
      v17 = objc_msgSend(v16, "unsignedIntegerValue");
      v18 = -[CBIDSManager keyLength](self, "keyLength");

      if (v17 == (id)v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LocalKeys")));
        -[CBIDSManager cloudPairingCompletedWithResponse:localKeys:from:forProtocolID:](self, "cloudPairingCompletedWithResponse:localKeys:from:forProtocolID:", v6, v19, v7, CFSTR("Version 1"));

        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "idsDevice"));
        -[CBIDSManager storePublicAddressMapping:message:](self, "storePublicAddressMapping:message:", v20, v6);
LABEL_14:

        goto LABEL_15;
      }
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "idsDevice"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RequestedKeys")));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("LTKLength")));
      v27 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid requested key length (%@)"), v26);
    }
    else
    {
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "idsDevice"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LocalKeys")));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("LTKLength")));
      v27 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid local key length (%@)"), v26);
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    -[CBIDSManager sendErrorMessageToDevice:reason:](self, "sendErrorMessageToDevice:reason:", v20, v28);

    goto LABEL_14;
  }
LABEL_15:

}

- (void)handlePairingFailure:(id)a3 from:(id)a4
{
  id v5;
  id v6;
  os_log_t v7;
  NSObject *v8;

  v5 = a3;
  v6 = a4;
  v7 = sub_1000681B8("CloudPairing");
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    sub_10016C540();

}

- (void)initiatePairingAgainIfNoAckReceived:(id)a3 attempt:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  os_log_t v17;
  NSObject *v18;
  const char *v19;
  id v20;
  dispatch_time_t v21;
  NSObject *v22;
  NSObject *v23;
  os_log_t v24;
  os_log_t v25;
  unint64_t v26;
  const char *v27;
  id v28;
  _QWORD block[4];
  NSObject *v30;
  CBIDSManager *v31;
  double v32;
  unint64_t v33;
  unint64_t v34;
  uint8_t buf[4];
  unint64_t v36;
  __int16 v37;
  unint64_t v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  id v42;

  v6 = a3;
  v7 = -[CBIDSManager roleWithDevice:](self, "roleWithDevice:", v6);
  if (v7)
  {
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager messageIdentifiersWaitingForAck](self, "messageIdentifiersWaitingForAck"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "idsDevice"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uniqueID"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v11));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager messageIdentifiersWaitingForAck](self, "messageIdentifiersWaitingForAck"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "idsDevice"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uniqueID"));
    objc_msgSend(v13, "setObject:forKey:", v6, v15);

    if (v12)
    {
      v25 = sub_1000681B8("CloudPairing");
      v23 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v26 = a4 - 1;
        if (v8 == 1)
          v27 = "pairing";
        else
          v27 = "security";
        v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description")));
        *(_DWORD *)buf = 134218499;
        v36 = v26;
        v37 = 2080;
        v38 = (unint64_t)v27;
        v39 = 2081;
        v40 = (const char *)objc_msgSend(v28, "UTF8String");
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "MUC - Dropping delay sending again attempt (%lu) '%s request' message to IDS device %{private}s", buf, 0x20u);

      }
    }
    else
    {
      v16 = (double)arc4random_uniform(0xB4u) + 60.0;
      v17 = sub_1000681B8("CloudPairing");
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        if (v8 == 1)
          v19 = "pairing";
        else
          v19 = "security";
        v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description")));
        *(_DWORD *)buf = 134218755;
        v36 = (unint64_t)v16;
        v37 = 2048;
        v38 = a4;
        v39 = 2080;
        v40 = v19;
        v41 = 2081;
        v42 = objc_msgSend(v20, "UTF8String");
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "MUC - Delaying (%lu) seconds to send (%lu) attempt '%s request' message to IDS device %{private}s", buf, 0x2Au);

      }
      v21 = dispatch_time(0, (uint64_t)(v16 * (double)a4 * 1000000000.0));
      v22 = objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudPairingQueue](self, "cloudPairingQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100060B1C;
      block[3] = &unk_1001E41F8;
      v32 = v16;
      v33 = a4;
      v34 = v8;
      v30 = v6;
      v31 = self;
      dispatch_after(v21, v22, block);

      v23 = v30;
    }

  }
  else
  {
    v24 = sub_1000681B8("CloudPairing");
    v12 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10016C5E4(v6);
  }

}

- (void)initiatePairing:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  NSString *v7;
  os_log_t v8;
  NSObject *v9;
  const char *v10;
  id v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  os_log_t v31;
  NSObject *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  _BOOL4 v40;
  id v41;
  id v42;
  id v43;
  os_log_t v44;
  NSObject *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  id v53;
  CBIDSManager *v54;
  id v55;
  id v56;
  id v57[2];
  _BOOL4 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[7];
  _QWORD v64[7];
  _BYTE v65[128];
  _QWORD v66[6];
  _QWORD v67[6];
  uint8_t buf[4];
  const char *v69;
  __int16 v70;
  id v71;

  v4 = a3;
  v5 = -[CBIDSManager roleWithDevice:](self, "roleWithDevice:", v4);
  if (v5)
  {
    v6 = v5;
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), mach_absolute_time());
    v48 = objc_claimAutoreleasedReturnValue(v7);
    v8 = sub_1000681B8("CloudPairing");
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (v6 == 1)
        v10 = "pairing";
      else
        v10 = "security";
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description")));
      *(_DWORD *)buf = 136315395;
      v69 = v10;
      v70 = 2081;
      v71 = objc_msgSend(v11, "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "MUC - Sending '%s request' message to IDS device %{private}s", buf, 0x16u);

    }
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v12 = CFSTR("SecurityRequest");
    if (v6 == 1)
      v12 = CFSTR("PairingRequest");
    v67[0] = v12;
    v66[0] = CFSTR("MessageType");
    v66[1] = CFSTR("DeviceName");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager localDeviceName](self, "localDeviceName"));
    v67[1] = v13;
    v66[2] = CFSTR("PublicAddress");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager publicAddress](self, "publicAddress"));
    v67[2] = v14;
    v67[3] = CFSTR("Basic");
    v66[3] = CFSTR("EncryptionType");
    v66[4] = CFSTR("RequestedKeyType");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager requestedKeyTypes](self, "requestedKeyTypes"));
    v67[4] = v15;
    v66[5] = CFSTR("RequestedKeyLength");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CBIDSManager keyLength](self, "keyLength")));
    v67[5] = v16;
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v67, v66, 6));

    objc_msgSend(v50, "setObject:forKey:", v47, CFSTR("Version 1"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "idsDevice"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "uniqueID"));

    objc_msgSend(v49, "setObject:forKey:", v48, v18);
    v19 = objc_alloc((Class)NSMutableArray);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudDevices](self, "cloudDevices"));
    v21 = objc_msgSend(v19, "initWithArray:", v20);

    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v22 = v21;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(_QWORD *)v60 != v24)
            objc_enumerationMutation(v22);
          v26 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i);
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKey:", v18));

          if (v27)
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudDevices](self, "cloudDevices"));
            objc_msgSend(v28, "removeObject:", v26);

          }
        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
      }
      while (v23);
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudDevices](self, "cloudDevices"));
    objc_msgSend(v29, "addObject:", v49);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudDevices](self, "cloudDevices"));
    +[CBPreferencesManager setuserPreference:value:sync:](CBPreferencesManager, "setuserPreference:value:sync:", CFSTR("CloudDevice"), v30, 1);

    if (v6 == 1)
    {
      v31 = sub_1000681B8("CloudPairing");
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "CloudPairingRoleInitator starting", buf, 2u);
      }

      v33 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", CFSTR("PublicKeys"), CFSTR("IdentityKeys"), 0);
      v64[0] = CFSTR("InitiatorPairingKeys");
      v63[0] = CFSTR("MessageType");
      v63[1] = CFSTR("DeviceName");
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager localDeviceName](self, "localDeviceName"));
      v64[1] = v34;
      v63[2] = CFSTR("PublicAddress");
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager publicAddress](self, "publicAddress"));
      v64[2] = v35;
      v63[3] = CFSTR("TimeStamp");
      v63[4] = CFSTR("EncryptionType");
      v64[3] = v48;
      v64[4] = CFSTR("ECDH");
      v64[5] = v33;
      v63[5] = CFSTR("RequestedKeyType");
      v63[6] = CFSTR("RequestedKeyLength");
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CBIDSManager keyLength](self, "keyLength")));
      v64[6] = v36;
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v64, v63, 7));

      objc_initWeak((id *)buf, self);
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager localDeviceRandomAddress](self, "localDeviceRandomAddress"));

      v39 = -[CBIDSManager keyLength](self, "keyLength");
      v40 = v38 != 0;
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_100061660;
      v51[3] = &unk_1001E4248;
      objc_copyWeak(v57, (id *)buf);
      v41 = v37;
      v52 = v41;
      v42 = v50;
      v58 = v40;
      v53 = v42;
      v54 = self;
      v55 = v4;
      v57[1] = (id)1;
      v43 = v33;
      v56 = v43;
      -[CBIDSManager generateKeyDictForTypes:keyLength:forAddress:withCompletion:](self, "generateKeyDictForTypes:keyLength:forAddress:withCompletion:", v43, v39, 0, v51);

      objc_destroyWeak(v57);
      objc_destroyWeak((id *)buf);

    }
    else
    {
      objc_msgSend(v50, "setObject:forKey:", CFSTR("CloudPairing"), CFSTR("MessageType"));
      -[CBIDSManager sendInitialPairingIDSMessage:forDevice:withRole:](self, "sendInitialPairingIDSMessage:forDevice:withRole:", v50, v4, v6);
    }

    v46 = (void *)v48;
  }
  else
  {
    v44 = sub_1000681B8("CloudPairing");
    v45 = objc_claimAutoreleasedReturnValue(v44);
    v46 = v45;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      sub_10016C660(v4);
      v46 = v45;
    }
  }

}

- (void)sendInitialPairingIDSMessage:(id)a3 forDevice:(id)a4 withRole:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  os_log_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  os_log_t v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[3];
  _QWORD v37[3];
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  id v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  id v45;

  v8 = a3;
  v9 = a4;
  v10 = objc_autoreleasePoolPush();
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "idsDevice"));
  v12 = (void *)IDSCopyForDevice();

  v13 = sub_1000681B8("CloudPairing");
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = v14;
  if (v12)
  {
    v31 = a5;
    v32 = v10;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 141558787;
      v39 = 1752392040;
      v40 = 2113;
      v41 = v9;
      v42 = 2160;
      v43 = 1752392040;
      v44 = 2113;
      v45 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Attempting to send message to %{private, mask.hash}@ : %{private, mask.hash}@", buf, 0x2Au);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MessageType")));
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "idsDevice"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v17, "uniqueID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Initial-%@-%@"), v16, v18));

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager service](self, "service"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", v12));
    v36[0] = IDSSendMessageOptionTimeoutKey;
    v36[1] = IDSSendMessageOptionWantsClientAcknowledgementKey;
    v37[0] = &off_1001F4608;
    v37[1] = &__kCFBooleanTrue;
    v36[2] = IDSSendMessageOptionQueueOneIdentifierKey;
    v37[2] = v19;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, v36, 3));
    v34 = 0;
    v35 = 0;
    LOBYTE(v17) = objc_msgSend(v20, "sendMessage:fromAccount:toDestinations:priority:options:identifier:error:", v8, 0, v21, 300, v22, &v35, &v34);
    v15 = v35;
    v33 = v34;

    v23 = sub_1000681B8("CloudPairing");
    v24 = objc_claimAutoreleasedReturnValue(v23);
    v25 = v24;
    if ((v17 & 1) != 0)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v26 = -[NSObject UTF8String](objc_retainAutorelease(v15), "UTF8String");
        *(_DWORD *)buf = 136315138;
        v39 = (uint64_t)v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Successfully sent message %s", buf, 0xCu);
      }

      if (v31 == 1)
        v27 = 2;
      else
        v27 = 1;
      objc_msgSend(v9, "setState:", v27);
      v25 = objc_claimAutoreleasedReturnValue(-[CBIDSManager messageIdentifiersWaitingForAck](self, "messageIdentifiersWaitingForAck"));
      -[NSObject setObject:forKey:](v25, "setObject:forKey:", v9, v15);
    }
    else if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      sub_10016C7B4(v33);
    }
    v10 = v32;

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager messageIdentifiersWaitingForAck](self, "messageIdentifiersWaitingForAck"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "idsDevice"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "uniqueID"));
    objc_msgSend(v28, "removeObjectForKey:", v30);

  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    sub_10016C6E0(v9, v8, v15);
  }

  objc_autoreleasePoolPop(v10);
}

- (void)sendRePairRequest:(id)a3 forBundleID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudPairingQueue](self, "cloudPairingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100061F7C;
  block[3] = &unk_1001E2570;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)_sendRePairRequest:(id)a3 forBundleID:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  os_log_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  os_log_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  os_log_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  double v34;
  os_log_t v35;
  NSObject *v36;
  dispatch_time_t v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  void *v44;
  id v45;
  id v46;
  id obj;
  _QWORD block[7];
  id v49;
  id v50;
  _QWORD v51[5];
  uint8_t v52;
  _BYTE v53[15];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[2];
  _QWORD v63[2];
  uint8_t buf[4];
  unint64_t v65;
  __int16 v66;
  uint64_t v67;
  _BYTE v68[128];
  _BYTE v69[128];

  v6 = a3;
  v46 = a4;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v7 = v6;
  v42 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
  if (v42)
  {
    v8 = *(_QWORD *)v59;
    v44 = v7;
    v41 = *(_QWORD *)v59;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v59 != v8)
          objc_enumerationMutation(v7);
        v43 = v9;
        v10 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * v9);
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager service](self, "service"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "devices"));

        obj = v12;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v55;
          while (2)
          {
            v16 = 0;
            v45 = v14;
            do
            {
              if (*(_QWORD *)v55 != v15)
                objc_enumerationMutation(obj);
              v17 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)v16);
              v18 = sub_1000681B8("CloudPairing");
              v19 = objc_claimAutoreleasedReturnValue(v18);
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "nsuuid"));
                *(_DWORD *)buf = 138412546;
                v65 = (unint64_t)v20;
                v66 = 2112;
                v67 = v10;
                _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "cloudpaird: sendRePairRequest: BTUUID: %@ peerUUID %@", buf, 0x16u);

              }
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "uniqueID"));
              v22 = objc_msgSend(v21, "isEqualToString:", v10);

              if (v22)
              {
                v23 = sub_1000681B8("CloudPairing");
                v24 = objc_claimAutoreleasedReturnValue(v23);
                if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                {
                  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "uniqueID"));
                  *(_DWORD *)buf = 138412290;
                  v65 = (unint64_t)v25;
                  _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "cloudpaird: sendRePairRequest: IDS to repair is a valid device %@", buf, 0xCu);

                }
                v26 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager deviceForIDSDevice:createNew:](self, "deviceForIDSDevice:createNew:", v17, 0));
                v27 = v26;
                if (v26)
                {
                  objc_msgSend(v26, "setState:", 0);
                }
                else
                {
                  v28 = sub_1000681B8("CloudPairing");
                  v29 = objc_claimAutoreleasedReturnValue(v28);
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                    sub_10016C830(&v52, v53, v29);

                }
                v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("RePairingRequest-%@"), v10));
                v31 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager messageIdentifiersWaitingForAck](self, "messageIdentifiersWaitingForAck"));
                v51[0] = _NSConcreteStackBlock;
                v51[1] = 3221225472;
                v51[2] = sub_100062544;
                v51[3] = &unk_1001E4270;
                v51[4] = v30;
                v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "keysOfEntriesPassingTest:", v51));

                v33 = objc_msgSend(v32, "count");
                if (v33)
                {
                  v34 = (double)arc4random_uniform(0xB4u) + 60.0;
                  v35 = sub_1000681B8("CloudPairing");
                  v36 = objc_claimAutoreleasedReturnValue(v35);
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 134218242;
                    v65 = (unint64_t)v34;
                    v66 = 2112;
                    v67 = v10;
                    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Deferring (%lu) seconds sendRePairRequest: %@ as we already sent one", buf, 0x16u);
                  }

                  v37 = dispatch_time(0, (uint64_t)(v34 * 1000000000.0));
                  v38 = objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudPairingQueue](self, "cloudPairingQueue"));
                  block[0] = _NSConcreteStackBlock;
                  block[1] = 3221225472;
                  block[2] = sub_100062550;
                  block[3] = &unk_1001E4298;
                  block[4] = self;
                  block[5] = v30;
                  block[6] = v10;
                  v49 = v27;
                  v50 = v46;
                  dispatch_after(v37, v38, block);

                }
                else
                {
                  v62[0] = CFSTR("MessageType");
                  v62[1] = CFSTR("DeviceName");
                  v63[0] = CFSTR("RepairRequest");
                  v39 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager localDeviceName](self, "localDeviceName"));
                  v63[1] = v39;
                  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v63, v62, 2));
                  -[CBIDSManager sendRePairCloudPairingMessage:toDevice:bundleID:](self, "sendRePairCloudPairingMessage:toDevice:bundleID:", v40, v27, v46);

                }
                v14 = v45;
                if (v33)
                {

                  v7 = v44;
                  goto LABEL_33;
                }
              }
              v16 = (char *)v16 + 1;
            }
            while (v14 != v16);
            v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
            if (v14)
              continue;
            break;
          }
        }

        v9 = v43 + 1;
        v7 = v44;
        v8 = v41;
      }
      while ((id)(v43 + 1) != v42);
      v42 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
    }
    while (v42);
  }
LABEL_33:

}

- (void)sendRePairCloudPairingMessage:(id)a3 toDevice:(id)a4 bundleID:(id)a5
{
  id v8;
  id v9;
  __CFString *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  NSObject *v25;
  os_log_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  os_log_t v35;
  os_log_t v36;
  void *v37;
  void *v38;
  os_log_t v39;
  NSObject *v40;
  id v41;
  const __CFString *v42;
  id v43;
  id v44;
  _QWORD v45[2];
  _QWORD v46[2];
  uint8_t buf[4];
  id v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  NSObject *v52;
  __int16 v53;
  NSObject *v54;

  v8 = a3;
  v9 = a4;
  v10 = (__CFString *)a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager service](self, "service"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "accounts"));
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "idsDevice"));
    v15 = IDSCopyIDForDevice();

    if (!v15)
    {
      v39 = sub_1000681B8("CloudPairing");
      v25 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        sub_10016C898();
      goto LABEL_17;
    }
    v42 = v10;
    v16 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v16, "setObject:forKey:", CFSTR("CloudPairing"), CFSTR("MessageType"));
    v41 = v8;
    objc_msgSend(v16, "setObject:forKey:", v8, CFSTR("Version 1"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 2592000.0));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v17, IDSSendMessageOptionTimeoutKey, 0));

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "idsDevice"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "uniqueID"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("RePairingRequest-%@"), v20));

    objc_msgSend(v18, "setObject:forKey:", v21, IDSSendMessageOptionQueueOneIdentifierKey);
    objc_msgSend(v18, "setObject:forKey:", &__kCFBooleanTrue, IDSSendMessageOptionWantsClientAcknowledgementKey);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager service](self, "service"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", v15));
    v43 = 0;
    v44 = 0;
    v24 = objc_msgSend(v22, "sendMessage:fromAccount:toDestinations:priority:options:identifier:error:", v16, 0, v23, 300, v18, &v44, &v43);
    v25 = v44;
    v40 = v43;

    if ((v24 & 1) != 0)
    {
      v8 = v41;
      if (!v25)
      {
LABEL_16:

        v10 = (__CFString *)v42;
LABEL_17:

        goto LABEL_18;
      }
      v26 = sub_1000681B8("CloudPairing");
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "idsDevice"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "name"));
        *(_DWORD *)buf = 138413058;
        v48 = v16;
        v49 = 2112;
        v50 = v29;
        v51 = 2112;
        v52 = v15;
        v53 = 2112;
        v54 = v25;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "cloudpaird: sendRePairCloudPairingMessage: Sending message :%@ to device %@ of account :%@ with GUID :%@", buf, 0x2Au);

        v8 = v41;
      }

      v30 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v25, v21));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager messageIdentifiersWaitingForAck](self, "messageIdentifiersWaitingForAck"));
      objc_msgSend(v31, "setObject:forKey:", v9, v30);

      v45[0] = CFSTR("MessageType");
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:"));
      v45[1] = CFSTR("BundleID");
      v46[0] = v32;
      v33 = CFSTR("Unknown");
      if (v42)
        v33 = v42;
      v46[1] = v33;
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v46, v45, 2));
      CUMetricsLog(CFSTR("com.apple.Bluetooth.CloudPairingMessage"), v34);

    }
    else
    {
      v36 = sub_1000681B8("CloudPairing");
      v30 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "idsDevice"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "name"));
        *(_DWORD *)buf = 138413058;
        v48 = v16;
        v49 = 2112;
        v50 = v38;
        v51 = 2112;
        v52 = v15;
        v53 = 2112;
        v54 = v40;
        _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "cloudpaird: sendRePairCloudPairingMessage: Sending message failed  :%@ to device %@ of account :%@ with error %@", buf, 0x2Au);

      }
      v8 = v41;
    }

    goto LABEL_16;
  }
  v35 = sub_1000681B8("CloudPairing");
  v15 = objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    sub_10016C86C();
LABEL_18:

}

- (void)sendCloudPairingResponseMessage:(id)a3 toDevice:(id)a4 version:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  os_log_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  id v28;
  os_log_t v29;
  NSObject *v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  void *v40;
  void *v41;
  unsigned __int8 v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v48;
  id v49;
  _QWORD v50[3];
  _QWORD v51[3];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[2];
  uint8_t buf[4];
  id v59;
  __int16 v60;
  id v61;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_autoreleasePoolPush();
  v11 = (void *)IDSCopyForDevice(v8);
  v12 = sub_1000681B8("CloudPairing");
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if (v11)
  {
    v45 = v10;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cpDescription")));
      v16 = objc_msgSend(v15, "UTF8String");
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description")));
      *(_DWORD *)buf = 136380931;
      v59 = v16;
      v60 = 2080;
      v61 = objc_msgSend(v17, "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Sending message to IDS device %{private}s: %s", buf, 0x16u);

    }
    v46 = v9;
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("Version 1")))
    {
      v56[0] = CFSTR("MessageType");
      v56[1] = CFSTR("Version 1");
      v57[0] = CFSTR("CloudPairing");
      v57[1] = v7;
      v18 = v57;
      v19 = v56;
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("Version 2")))
    {
      v54[0] = CFSTR("MessageType");
      v54[1] = CFSTR("Version 2");
      v55[0] = CFSTR("CloudPairing");
      v55[1] = v7;
      v18 = v55;
      v19 = v54;
    }
    else
    {
      if (!objc_msgSend(v9, "isEqualToString:", CFSTR("Version 3")))
      {
        v20 = 0;
LABEL_13:
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MessageType")));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueID"));
        v23 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v21, v22));

        v24 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager service](self, "service"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", v11));
        v50[0] = IDSSendMessageOptionTimeoutKey;
        v50[1] = IDSSendMessageOptionWantsClientAcknowledgementKey;
        v51[0] = &off_1001F4608;
        v51[1] = &__kCFBooleanTrue;
        v50[2] = IDSSendMessageOptionQueueOneIdentifierKey;
        v43 = (void *)v23;
        v51[2] = v23;
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v51, v50, 3));
        v48 = 0;
        v49 = 0;
        v44 = (void *)v20;
        v27 = objc_msgSend(v24, "sendMessage:fromAccount:toDestinations:priority:options:identifier:error:", v20, 0, v25, 300, v26, &v49, &v48);
        v14 = v49;
        v28 = v48;

        v29 = sub_1000681B8("CloudPairing");
        v30 = objc_claimAutoreleasedReturnValue(v29);
        v31 = v30;
        if ((v27 & 1) == 0)
        {
          v35 = v28;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            sub_10016C7B4(v28);
          goto LABEL_24;
        }
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v32 = -[NSObject UTF8String](objc_retainAutorelease(v14), "UTF8String");
          *(_DWORD *)buf = 136315138;
          v59 = v32;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Successfully sent message %s", buf, 0xCu);
        }

        v31 = objc_claimAutoreleasedReturnValue(-[CBIDSManager deviceForIDSDevice:createNew:](self, "deviceForIDSDevice:createNew:", v8, 0));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MessageType")));
        if ((objc_msgSend(CFSTR("ResponderPairingKeys"), "isEqualToString:", v33) & 1) == 0)
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MessageType")));
          if (!objc_msgSend(CFSTR("PairingResponse"), "isEqualToString:", v34))
          {
            v35 = v28;
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MessageType")));
            v42 = objc_msgSend(CFSTR("KeyDistribution"), "isEqualToString:", v41);

            if ((v42 & 1) == 0)
            {
LABEL_24:
              v10 = v45;
              v9 = v46;

              goto LABEL_25;
            }
LABEL_20:
            v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject idsDevice](v31, "idsDevice"));
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "uniqueID"));
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueID"));
            v39 = objc_msgSend(v37, "isEqualToString:", v38);

            if (v39)
            {
              -[NSObject setState:](v31, "setState:", 4);
              v40 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager messageIdentifiersWaitingForAck](self, "messageIdentifiersWaitingForAck"));
              objc_msgSend(v40, "setObject:forKey:", v31, v14);

            }
            goto LABEL_24;
          }

        }
        v35 = v28;

        goto LABEL_20;
      }
      v52[0] = CFSTR("MessageType");
      v52[1] = CFSTR("Version 3");
      v53[0] = CFSTR("CloudPairing");
      v53[1] = v7;
      v18 = v53;
      v19 = v52;
    }
    v20 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v19, 2));
    goto LABEL_13;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    sub_10016C8C4();
LABEL_25:

  objc_autoreleasePoolPop(v10);
}

- (void)sendErrorMessageToDevice:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  os_log_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[2];
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = sub_1000681B8("CloudPairing");
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cpDescription")));
    *(_DWORD *)buf = 136380931;
    v15 = objc_msgSend(v10, "UTF8String");
    v16 = 2080;
    v17 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Rejecting pairing attempt from IDS device %{private}s - %s", buf, 0x16u);

  }
  v12[0] = CFSTR("MessageType");
  v12[1] = CFSTR("FailureReason");
  v13[0] = CFSTR("PairingFailure");
  v13[1] = v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));
  -[CBIDSManager sendCloudPairingResponseMessage:toDevice:version:](self, "sendCloudPairingResponseMessage:toDevice:version:", v11, v6, CFSTR("Version 1"));

}

- (void)handleUnpairCommand:(id)a3 from:(id)a4
{
  id v6;
  id v7;
  os_log_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  os_log_t v20;
  NSObject *v21;
  void *v22;
  os_log_t v23;
  NSObject *v24;
  id v25;
  id v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;

  v6 = a3;
  v7 = a4;
  v8 = sub_1000681B8("CloudPairing");
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unpair Cloud Device: %@", buf, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DeviceName")));
  if (!objc_msgSend(v10, "length"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "idsDevice"));
    -[CBIDSManager sendErrorMessageToDevice:reason:](self, "sendErrorMessageToDevice:reason:", v19, CFSTR("No friendly name specified"));
LABEL_9:

    goto LABEL_13;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PublicAddress")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Public %@"), v11));
  v13 = sub_100058080(v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RandomAddress")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Random %@"), v14));
  v16 = sub_100058080(v15);

  if (!(v13 | v16))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PublicAddress")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RandomAddress")));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid public address \"%@\" and Invalid random address \"%@\"), v17, v18));

    v20 = sub_1000681B8("CloudPairing");
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_10016C95C();

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "idsDevice"));
    -[CBIDSManager sendErrorMessageToDevice:reason:](self, "sendErrorMessageToDevice:reason:", v22, v19);

    goto LABEL_9;
  }
  v23 = sub_1000681B8("CloudPairing");
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description")));
    v26 = objc_msgSend(v25, "UTF8String");
    *(_DWORD *)buf = 136380675;
    v32 = v26;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Received 'unpair command' message from IDS device %{private}s", buf, 0xCu);

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100063644;
  v28[3] = &unk_1001E4180;
  v28[4] = self;
  v29 = v7;
  v30 = v10;
  objc_msgSend(v27, "sendCloudKitMsg:args:withReply:", CFSTR("UnpairCloudDevice"), v6, v28);

LABEL_13:
}

- (BOOL)validateMessage:(id)a3 from:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  id v22;
  unint64_t v23;
  void *v24;
  _BOOL4 v25;
  void *v26;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MessageType")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DeviceName")));
  if (!objc_msgSend(v9, "length"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "idsDevice"));
    -[CBIDSManager sendErrorMessageToDevice:reason:](self, "sendErrorMessageToDevice:reason:", v16, CFSTR("No friendly name specified"));
LABEL_18:

    LOBYTE(v25) = 0;
    goto LABEL_19;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PublicAddress")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Public %@"), v10));
  v12 = sub_100058080(v11);

  if (!v12)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "idsDevice"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PublicAddress")));
    v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid public address (%@)"), v17);
LABEL_17:
    v26 = (void *)objc_claimAutoreleasedReturnValue(v18);
    -[CBIDSManager sendErrorMessageToDevice:reason:](self, "sendErrorMessageToDevice:reason:", v16, v26);

    goto LABEL_18;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("EncryptionType")));
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("Basic"));

  if ((v14 & 1) == 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "idsDevice"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("EncryptionType")));
    v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid encryption type (%@)"), v17);
    goto LABEL_17;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RequestedKeyType")));
  if (objc_msgSend(v15, "containsObject:", CFSTR("EncryptionKeys")))
  {

  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RequestedKeyType")));
    v20 = objc_msgSend(v19, "containsObject:", CFSTR("IdentityKeys"));

    if ((v20 & 1) == 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "idsDevice"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RequestedKeyType")));
      v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid requested keys (%@)"), v17);
      goto LABEL_17;
    }
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RequestedKeyLength")));
  v22 = objc_msgSend(v21, "integerValue");
  v23 = -[CBIDSManager keyLength](self, "keyLength");

  if (v22 != (id)v23)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "idsDevice"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RequestedKeyLength")));
    v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid requested key length (%@)"), v17);
    goto LABEL_17;
  }
  if ((objc_msgSend(CFSTR("PairingResponse"), "isEqualToString:", v8) & 1) == 0
    && !objc_msgSend(CFSTR("KeyDistribution"), "isEqualToString:", v8)
    || (v24 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager requestedKeyTypes](self, "requestedKeyTypes")),
        v25 = -[CBIDSManager validateKeys:requestedTypes:from:](self, "validateKeys:requestedTypes:from:", v6, v24, v7),
        v24,
        v25))
  {
    LOBYTE(v25) = 1;
  }
LABEL_19:

  return v25;
}

- (BOOL)validateKeys:(id)a3 requestedTypes:(id)a4 from:(id)a5
{
  id v8;
  id v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  char isKindOfClass;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  char v27;
  void *v28;
  id v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  BOOL v43;
  void *v44;
  __CFString *v45;
  const __CFString *v46;
  void *v47;
  uint64_t v49;
  const __CFString *v50;
  const __CFString *v51;
  void *v52;

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RequestedKeys")));
  if (!objc_msgSend(v8, "containsObject:", CFSTR("EncryptionKeys")))
    goto LABEL_16;
  v11 = CFSTR("LTK");
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("LTK")));
  if (!v12)
    goto LABEL_22;
  v13 = (void *)v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("LTK")));
  v15 = objc_opt_class(NSData);
  if ((objc_opt_isKindOfClass(v14, v15) & 1) == 0)
  {
LABEL_21:

    goto LABEL_22;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("LTK")));
  v17 = objc_msgSend(v16, "length");

  if (v17 != (id)16)
  {
LABEL_22:
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "idsDevice"));
    v45 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v11));
    v51 = v11;
    v52 = v45;
    v46 = CFSTR("%@ not specified or invalid (%@)");
LABEL_23:
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v46, v51, v52));
    -[CBIDSManager sendErrorMessageToDevice:reason:](self, "sendErrorMessageToDevice:reason:", v44, v47);

    v43 = 0;
    goto LABEL_24;
  }
  v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("LTKType")));
  if (!v18
    || (v19 = (void *)v18,
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("LTKType"))),
        v21 = objc_opt_class(NSNumber),
        isKindOfClass = objc_opt_isKindOfClass(v20, v21),
        v20,
        v19,
        (isKindOfClass & 1) == 0))
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "idsDevice"));
    v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("LTKType")));
    v45 = (__CFString *)v49;
    v50 = CFSTR("LTK type");
LABEL_27:
    v51 = v50;
    v52 = (void *)v49;
    v46 = CFSTR("%@ not specified or invalid (%@)");
    goto LABEL_23;
  }
  v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("LTKLength")));
  if (!v23
    || (v24 = (void *)v23,
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("LTKLength"))),
        v26 = objc_opt_class(NSNumber),
        v27 = objc_opt_isKindOfClass(v25, v26),
        v25,
        v24,
        (v27 & 1) == 0))
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "idsDevice"));
    v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("LTKLength")));
    v45 = (__CFString *)v49;
    v50 = CFSTR("LTK length");
    goto LABEL_27;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("LTKLength")));
  v29 = objc_msgSend(v28, "unsignedIntegerValue");
  v30 = -[CBIDSManager keyLength](self, "keyLength");

  if (v29 != (id)v30)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "idsDevice"));
    v45 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("LTKLength")));
    v51 = v45;
    v46 = CFSTR("Invalid LTK key length (%@)");
    goto LABEL_23;
  }
  v11 = CFSTR("EDIV");
  v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("EDIV")));
  if (!v31)
    goto LABEL_22;
  v13 = (void *)v31;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("EDIV")));
  v32 = objc_opt_class(NSData);
  if ((objc_opt_isKindOfClass(v14, v32) & 1) == 0)
    goto LABEL_21;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("EDIV")));
  v34 = objc_msgSend(v33, "length");

  if (v34 != (id)2)
    goto LABEL_22;
  v11 = CFSTR("RAND");
  v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RAND")));
  if (!v35)
    goto LABEL_22;
  v13 = (void *)v35;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RAND")));
  v36 = objc_opt_class(NSData);
  if ((objc_opt_isKindOfClass(v14, v36) & 1) == 0)
    goto LABEL_21;
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RAND")));
  v38 = objc_msgSend(v37, "length");

  if (v38 != (id)8)
    goto LABEL_22;
LABEL_16:
  if (objc_msgSend(v8, "containsObject:", CFSTR("IdentityKeys")))
  {
    v11 = CFSTR("IRK");
    v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("IRK")));
    if (v39)
    {
      v13 = (void *)v39;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("IRK")));
      v40 = objc_opt_class(NSData);
      if ((objc_opt_isKindOfClass(v14, v40) & 1) != 0)
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("IRK")));
        v42 = objc_msgSend(v41, "length");

        if (v42 == (id)16)
          goto LABEL_20;
        goto LABEL_22;
      }
      goto LABEL_21;
    }
    goto LABEL_22;
  }
LABEL_20:
  v43 = 1;
LABEL_24:

  return v43;
}

- (id)statedumpAndRecordDailyMetric
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  __CFString *v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_10005E48C;
  v11 = sub_10005E49C;
  v12 = &stru_1001ED4C0;
  v3 = objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudPairingQueue](self, "cloudPairingQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000641C0;
  v6[3] = &unk_1001E24F8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)_statedumpAndRecordDailyMetric
{
  id v2;
  id v3;
  id *v4;
  id *v5;
  const char *v6;
  id *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  int v11;
  id *v12;
  void *v13;
  const char *v14;
  id *v15;
  unsigned int v16;
  const char *v17;
  id *v18;
  void *v19;
  const char *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  _UNKNOWN **v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  unsigned int v44;
  const char *v45;
  id v46;
  const char *v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  const char *v53;
  id v54;
  const char *v55;
  id v56;
  const char *v57;
  id v58;
  id v59;
  void *v60;
  void *v61;
  id *v62;
  void *v63;
  id *v64;
  void *v65;
  void *v66;
  id v67;
  id *v68;
  void *v69;
  uint64_t v70;
  id *v71;
  void *v72;
  void *v73;
  id v74;
  id v76;
  id v77;
  uint64_t v78;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *i;
  void *v85;
  _QWORD v86[5];
  id v87;
  _QWORD v88[5];
  id v89;
  _QWORD v90[4];
  id v91;
  uint64_t *v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id obj;
  uint64_t v114;
  uint64_t *v115;
  uint64_t v116;
  uint64_t (*v117)(uint64_t, uint64_t);
  void (*v118)(uint64_t);
  id v119;
  const __CFString *v120;
  void *v121;
  _BYTE v122[128];

  v114 = 0;
  v115 = &v114;
  v116 = 0x3032000000;
  v117 = sub_10005E48C;
  v118 = sub_10005E49C;
  v119 = 0;
  obj = 0;
  NSAppendPrintF_safe(&obj, "\n");
  objc_storeStrong(&v119, obj);
  v4 = (id *)(v115 + 5);
  v112 = (id)v115[5];
  NSAppendPrintF_safe(&v112, "---------- Cloud Pairing Manager ----------\n\n");
  objc_storeStrong(v4, v112);
  v76 = (id)objc_claimAutoreleasedReturnValue(+[CBPreferencesManager deviceName](CBPreferencesManager, "deviceName"));
  if (IsAppleInternalBuild(v76))
  {
    v5 = (id *)(v115 + 5);
    v111 = (id)v115[5];
    if (v76)
      v6 = (const char *)objc_msgSend(objc_retainAutorelease(v76), "UTF8String");
    else
      v6 = "none";
    NSAppendPrintF_safe(&v111, "%s\n", v6);
    objc_storeStrong(v5, v111);
  }
  v7 = (id *)(v115 + 5);
  v110 = (id)v115[5];
  v8 = objc_claimAutoreleasedReturnValue(-[CBIDSManager account](self, "account"));
  v9 = (void *)v8;
  if (v8)
  {
    if (IsAppleInternalBuild(v8))
    {
      v2 = (id)objc_claimAutoreleasedReturnValue(-[CBIDSManager account](self, "account"));
      v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "loginID")));
      v10 = (const char *)objc_msgSend(v3, "UTF8String");
      v11 = 1;
    }
    else
    {
      v11 = 0;
      v10 = "<redacted>";
    }
  }
  else
  {
    v11 = 0;
    v10 = "none";
  }
  NSAppendPrintF_safe(&v110, "iCloud: %s\n", v10);
  objc_storeStrong(v7, v110);
  if (v11)
  {

  }
  v12 = (id *)(v115 + 5);
  v109 = (id)v115[5];
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudIdentifier](self, "cloudIdentifier"));
  if (v13)
  {
    v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudIdentifier](self, "cloudIdentifier")));
    v14 = (const char *)objc_msgSend(v2, "UTF8String");
  }
  else
  {
    v14 = "none";
  }
  NSAppendPrintF_safe(&v109, "IDS: %s\n", v14);
  objc_storeStrong(v12, v109);
  if (v13)

  v15 = (id *)(v115 + 5);
  v108 = (id)v115[5];
  v16 = -[CBIDSManager supportsVirtualAddress](self, "supportsVirtualAddress");
  v17 = "NO";
  if (v16)
    v17 = "YES";
  NSAppendPrintF_safe(&v108, "Virtual address supported: %s\n", v17);
  objc_storeStrong(v15, v108);
  v18 = (id *)(v115 + 5);
  v107 = (id)v115[5];
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager localDeviceRandomAddress](self, "localDeviceRandomAddress"));
  if (v19)
  {
    v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[CBIDSManager localDeviceRandomAddress](self, "localDeviceRandomAddress")));
    v20 = (const char *)objc_msgSend(v2, "UTF8String");
  }
  else
  {
    v20 = "none";
  }
  NSAppendPrintF_safe(&v107, "Random static address: %s\n\n", v20);
  objc_storeStrong(v18, v107);
  if (v19)

  v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager associatedDevices](self, "associatedDevices"));
  v77 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "sortedArrayUsingComparator:", &stru_1001E42D8));

  v80 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v103, v122, 16);
  if (v80)
  {
    v78 = *(_QWORD *)v104;
    do
    {
      for (i = 0; i != v80; i = (char *)i + 1)
      {
        if (*(_QWORD *)v104 != v78)
          objc_enumerationMutation(v77);
        v22 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * (_QWORD)i);
        v23 = -[CBIDSManager roleWithDevice:](self, "roleWithDevice:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "idsDevice"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "productName"));
        v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "objectForKeyedSubscript:", v25));

        if (!v85)
          v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "deviceTypeToString"));
        v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "objectForKeyedSubscript:", v26));

        if (v27)
          v28 = (_UNKNOWN **)v27;
        else
          v28 = &off_1001F45F0;
        v81 = v28;
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v28, "intValue") + 1));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "deviceTypeToString"));
        objc_msgSend(v85, "setObject:forKeyedSubscript:", v29, v30);

        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "productName"));
        objc_msgSend(v83, "setObject:forKeyedSubscript:", v85, v31);

        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "productName"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "objectForKeyedSubscript:", v32));

        if (!v33)
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "deviceTypeToString"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", v34));

        v102 = v35;
        NSAppendPrintF_safe(&v102, "-");
        v36 = v102;

        v101 = v36;
        v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "name")));
        NSAppendPrintF_safe(&v101, "  %s,", (const char *)objc_msgSend(v37, "UTF8String"));
        v38 = v101;

        v100 = v38;
        v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "uniqueID")));
        NSAppendPrintF_safe(&v100, " IDS: %s", (const char *)objc_msgSend(v39, "UTF8String"));
        v40 = v100;

        v99 = v40;
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "nsuuid"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "UUIDString"));
        NSAppendPrintF_safe(&v99, ", BT: %@", v42);
        v43 = v99;

        v98 = v43;
        v44 = objc_msgSend(v22, "isConnected");
        v45 = "no";
        if (v44)
          v45 = "yes";
        NSAppendPrintF_safe(&v98, ", Cn: %s", v45);
        v46 = v98;

        v97 = v46;
        v47 = "Unknown";
        if (v23 == 2)
          v47 = "Responder";
        if (v23 == 1)
          v47 = "Initiator";
        NSAppendPrintF_safe(&v97, ", %s", v47);
        v48 = v97;

        v96 = v48;
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stateString"));
        v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "capitalizedString")));
        NSAppendPrintF_safe(&v96, ", %s", (const char *)objc_msgSend(v50, "UTF8String"));
        v51 = v96;

        v95 = v51;
        v52 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "deviceTypeToString")));
        v53 = (const char *)objc_msgSend(v52, "UTF8String");
        v54 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "productName")));
        v55 = (const char *)objc_msgSend(v54, "UTF8String");
        v56 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "productVersion")));
        v57 = (const char *)objc_msgSend(v56, "UTF8String");
        v58 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "productBuildVersion")));
        NSAppendPrintF_safe(&v95, ", %s-%s-%s-%s\n", v53, v55, v57, (const char *)objc_msgSend(v58, "UTF8String"));
        v59 = v95;

        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "deviceTypeToString"));
        objc_msgSend(v33, "setObject:forKeyedSubscript:", v59, v60);

        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "productName"));
        objc_msgSend(v82, "setObject:forKeyedSubscript:", v33, v61);

      }
      v80 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v103, v122, 16);
    }
    while (v80);
  }

  v62 = (id *)(v115 + 5);
  v94 = (id)v115[5];
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager associatedDevices](self, "associatedDevices"));
  NSAppendPrintF_safe(&v94, "IDS Devices    : %lu\n", objc_msgSend(v63, "count"));
  objc_storeStrong(v62, v94);

  v64 = (id *)(v115 + 5);
  v93 = (id)v115[5];
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager associatedDevices](self, "associatedDevices"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "cuFilteredArrayUsingBlock:", &stru_1001E4318));
  NSAppendPrintF_safe(&v93, "Paired Devices : %lu\n\n", objc_msgSend(v66, "count"));
  objc_storeStrong(v64, v93);

  v90[0] = _NSConcreteStackBlock;
  v90[1] = 3221225472;
  v90[2] = sub_100064E7C;
  v90[3] = &unk_1001E4368;
  v67 = v82;
  v91 = v67;
  v92 = &v114;
  objc_msgSend(v83, "enumerateKeysAndObjectsUsingBlock:", v90);
  v68 = (id *)(v115 + 5);
  v89 = (id)v115[5];
  NSAppendPrintF_safe(&v89, "\nIDS Public Address Mapping:\n");
  objc_storeStrong(v68, v89);
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager CPAddressMapping](self, "CPAddressMapping"));
  v88[0] = _NSConcreteStackBlock;
  v88[1] = 3221225472;
  v88[2] = sub_100065140;
  v88[3] = &unk_1001E4390;
  v88[4] = &v114;
  objc_msgSend(v69, "enumerateKeysAndObjectsUsingBlock:", v88);

  if (IsAppleInternalBuild(v70))
  {
    v71 = (id *)(v115 + 5);
    v87 = (id)v115[5];
    NSAppendPrintF_safe(&v87, "\nPending Client Ack Message Identifier from IDS Device:\n");
    objc_storeStrong(v71, v87);
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager messageIdentifiersWaitingForAck](self, "messageIdentifiersWaitingForAck"));
    v86[0] = _NSConcreteStackBlock;
    v86[1] = 3221225472;
    v86[2] = sub_100065190;
    v86[3] = &unk_1001E43B8;
    v86[4] = &v114;
    objc_msgSend(v72, "enumerateKeysAndObjectsUsingBlock:", v86);

  }
  v120 = CFSTR("Stats");
  v121 = v83;
  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v121, &v120, 1));
  CUMetricsLog(CFSTR("com.apple.Bluetooth.CloudPairing"), v73);

  v74 = (id)v115[5];
  _Block_object_dispose(&v114, 8);

  return v74;
}

- (BOOL)shouldUpgradeToManatee
{
  os_log_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  __int128 v8;
  id v9;
  char v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  unsigned int v17;
  os_log_t v18;
  NSObject *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  unsigned int v24;
  os_log_t v25;
  NSObject *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  os_log_t v30;
  NSObject *v31;
  const char *v32;
  void *v33;
  const char *v34;
  NSObject *v35;
  os_log_t v36;
  const char *v37;
  os_log_t v38;
  os_log_t v39;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  const char *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  const char *v58;
  __int16 v59;
  uint64_t v60;
  _BYTE v61[128];

  v3 = sub_1000681B8("MagicPairing");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Manatee available, Check for allDevicesJazzKon", buf, 2u);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager service](self, "service"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "devices"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
  if (v7)
  {
    v9 = v7;
    v10 = 0;
    v11 = *(_QWORD *)v52;
    *(_QWORD *)&v8 = 134218496;
    v41 = v8;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v52 != v11)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "isHSATrusted", v41))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "productName"));
          v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("Apple TVOS"));

          if (v15)
          {
            v36 = sub_1000681B8("MagicPairing");
            v35 = objc_claimAutoreleasedReturnValue(v36);
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v37 = "allDevicesJazzKon: checkManateeZoneUpgrade: account has AppleTV";
              goto LABEL_50;
            }
            goto LABEL_51;
          }
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "productName"));
          v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("iPhone OS"));

          if (v17)
          {
            v18 = sub_1000681B8("MagicPairing");
            v19 = objc_claimAutoreleasedReturnValue(v18);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              if (v13)
              {
                objc_msgSend(v13, "operatingSystemVersion");
                v20 = v50;
                objc_msgSend(v13, "operatingSystemVersion");
                v21 = v49;
                objc_msgSend(v13, "operatingSystemVersion");
                v22 = v48;
              }
              else
              {
                v22 = 0;
                v21 = 0;
                v20 = 0;
                v50 = 0;
                v49 = 0;
                v48 = 0;
              }
              *(_DWORD *)buf = v41;
              v56 = v20;
              v57 = 2048;
              v58 = v21;
              v59 = 2048;
              v60 = v22;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "allDevicesJazzKon: checkManateeZoneUpgrade: account has iOS, majorVersion %ld, minorVersion %ld, patchVersion %ld", buf, 0x20u);
            }

            if (!v13 || (objc_msgSend(v13, "operatingSystemVersion"), v47 <= 12))
            {
              v38 = sub_1000681B8("MagicPairing");
              v35 = objc_claimAutoreleasedReturnValue(v38);
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                v37 = "allDevicesJazzKon: iOS checkManateeZoneUpgrade: account not eligible";
                goto LABEL_50;
              }
              goto LABEL_51;
            }
          }
          else
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "modelIdentifier"));
            v24 = objc_msgSend(v23, "containsString:", CFSTR("Mac"));

            if (v24)
            {
              v25 = sub_1000681B8("MagicPairing");
              v26 = objc_claimAutoreleasedReturnValue(v25);
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                if (v13)
                {
                  objc_msgSend(v13, "operatingSystemVersion");
                  v27 = v46;
                  objc_msgSend(v13, "operatingSystemVersion");
                  v28 = v45;
                  objc_msgSend(v13, "operatingSystemVersion");
                  v29 = v44;
                }
                else
                {
                  v29 = 0;
                  v28 = 0;
                  v27 = 0;
                  v46 = 0;
                  v45 = 0;
                  v44 = 0;
                }
                *(_DWORD *)buf = v41;
                v56 = v27;
                v57 = 2048;
                v58 = v28;
                v59 = 2048;
                v60 = v29;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "allDevicesJazzKon: checkManateeZoneUpgrade: account has macOS, majorVersion %ld, minorVersion %ld, patchVersion %ld", buf, 0x20u);
              }

              if (!v13
                || (objc_msgSend(v13, "operatingSystemVersion"), v43 < 11)
                && (objc_msgSend(v13, "operatingSystemVersion"), v42 <= 14))
              {
                v39 = sub_1000681B8("MagicPairing");
                v35 = objc_claimAutoreleasedReturnValue(v39);
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  v37 = "allDevicesJazzKon: macOS checkManateeZoneUpgrade: account not eligible";
LABEL_50:
                  _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, v37, buf, 2u);
                }
LABEL_51:

                LOBYTE(v35) = 0;
                goto LABEL_52;
              }
            }
          }
          v10 = 1;
        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v10 = 0;
  }

  v30 = sub_1000681B8("MagicPairing");
  v31 = objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    if ((v10 & 1) != 0)
      v32 = "yes";
    else
      v32 = "no";
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    if (objc_msgSend(v33, "manateeZoneUpgraded"))
      v34 = "yes";
    else
      v34 = "no";
    *(_DWORD *)buf = 136315394;
    v56 = v32;
    v57 = 2080;
    v58 = v34;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "allDevicesJazzKon? - %s, current manatee state - %s", buf, 0x16u);

  }
  if ((v10 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CloudXPCService sharedInstance](CloudXPCService, "sharedInstance"));
    LODWORD(v35) = objc_msgSend(v6, "manateeZoneUpgraded") ^ 1;
LABEL_52:

  }
  else
  {
    LOBYTE(v35) = 0;
  }
  return (char)v35;
}

- (BOOL)isLegacyDevice:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v4 = a3;
  if (v4 && !-[CBIDSManager allDevicesStarSky](self, "allDevicesStarSky"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager service](self, "service"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "devices"));

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v13, "isHSATrusted"))
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
            v15 = objc_msgSend(v14, "isEqualToString:", v4);

            if (v15)
            {
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "modelIdentifier"));
              if (objc_msgSend(v16, "containsString:", CFSTR("Mac")))
              {
                v17 = &v22;
                if (!v13)
                  goto LABEL_24;
                objc_msgSend(v13, "operatingSystemVersion");
                v18 = v22;

                if (v18 < 12)
                  goto LABEL_25;
              }
              else
              {

              }
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "productName"));
              if (objc_msgSend(v16, "isEqualToString:", CFSTR("iPhone OS")))
              {
                v17 = &v21;
                if (!v13)
                {
LABEL_24:
                  *v17 = 0;
                  v17[1] = 0;
                  v17[2] = 0;

LABEL_25:
                  v5 = 1;
                  goto LABEL_26;
                }
                objc_msgSend(v13, "operatingSystemVersion");
                v19 = v21;

                if (v19 < 14)
                  goto LABEL_25;
              }
              else
              {

              }
            }
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v10)
          continue;
        break;
      }
    }
    v5 = 0;
LABEL_26:

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)allDevicesStarSky
{
  void *v2;
  void *v3;
  os_log_t v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  os_log_t v15;
  NSObject *v16;
  void *v17;
  unsigned int v18;
  BOOL v19;
  os_log_t v20;
  NSObject *v21;
  const char *v22;
  os_log_t v23;
  NSObject *v24;
  uint32_t v25;
  os_log_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  os_log_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  _BYTE v54[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "devices"));

  v4 = sub_1000681B8("MagicPairing");
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v49 = objc_msgSend(v3, "count");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Check for allDevicesStarSky, count: %lu", buf, 0xCu);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v6 = v3;
  v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v45;
LABEL_5:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v45 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v10);
      if (!objc_msgSend(v11, "isHSATrusted"))
        break;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "modelIdentifier"));
      if (objc_msgSend(v12, "hasPrefix:", CFSTR("AppleTV")))
      {
        if (!v11)
        {

LABEL_32:
          v23 = sub_1000681B8("CloudPairing");
          v21 = objc_claimAutoreleasedReturnValue(v23);
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            goto LABEL_49;
          *(_WORD *)buf = 0;
          v22 = "allDevicesJazzKon: checkManateeZoneUpgrade: account has AppleTV";
LABEL_34:
          v24 = v21;
          v25 = 2;
          goto LABEL_48;
        }
        objc_msgSend(v11, "operatingSystemVersion");

        if (v43 <= 14)
          goto LABEL_32;
      }
      else
      {

      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "modelIdentifier"));
      if (objc_msgSend(v13, "hasPrefix:", CFSTR("iPhone")))
      {
        if (!v11)
        {

LABEL_36:
          v26 = sub_1000681B8("CloudPairing");
          v21 = objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            if (v11)
            {
              objc_msgSend(v11, "operatingSystemVersion");
              v27 = v41;
              objc_msgSend(v11, "operatingSystemVersion");
              v28 = v40;
              objc_msgSend(v11, "operatingSystemVersion");
              v29 = v39;
            }
            else
            {
              v29 = 0;
              v28 = 0;
              v27 = 0;
            }
            *(_DWORD *)buf = 134218496;
            v49 = v27;
            v50 = 2048;
            v51 = v28;
            v52 = 2048;
            v53 = v29;
            v22 = "allDevicesJazzKon: checkManateeZoneUpgrade: account has iOS, majorVersion %ld, minorVersion %ld, patchVersion %ld";
            goto LABEL_47;
          }
          goto LABEL_49;
        }
        objc_msgSend(v11, "operatingSystemVersion");

        if (v42 <= 14)
          goto LABEL_36;
      }
      else
      {

      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "modelIdentifier"));
      if (objc_msgSend(v14, "containsString:", CFSTR("Mac")))
      {
        if (!v11)
        {

LABEL_40:
          v30 = sub_1000681B8("CloudPairing");
          v21 = objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            if (v11)
            {
              objc_msgSend(v11, "operatingSystemVersion");
              v31 = v37;
              objc_msgSend(v11, "operatingSystemVersion");
              v32 = v36;
              objc_msgSend(v11, "operatingSystemVersion");
              v33 = v35;
            }
            else
            {
              v33 = 0;
              v32 = 0;
              v31 = 0;
            }
            *(_DWORD *)buf = 134218496;
            v49 = v31;
            v50 = 2048;
            v51 = v32;
            v52 = 2048;
            v53 = v33;
            v22 = "allDevicesJazzKon: checkManateeZoneUpgrade: account has macOS, majorVersion %ld, minorVersion %ld, patchVersion %ld";
LABEL_47:
            v24 = v21;
            v25 = 32;
LABEL_48:
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v22, buf, v25);
          }
LABEL_49:

          v19 = 0;
          v16 = v6;
          goto LABEL_50;
        }
        objc_msgSend(v11, "operatingSystemVersion");

        if (v38 <= 11)
          goto LABEL_40;
      }
      else
      {

      }
      if (v8 == (id)++v10)
      {
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
        if (v8)
          goto LABEL_5;
        goto LABEL_26;
      }
    }
    v20 = sub_1000681B8("MagicPairing");
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      goto LABEL_49;
    *(_WORD *)buf = 0;
    v22 = "allDevicesStarSky, but not HSA trusted";
    goto LABEL_34;
  }
LABEL_26:

  v15 = sub_1000681B8("MagicPairing");
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[MPCloudKit_Manatee sharedInstance](MPCloudKit_Manatee, "sharedInstance"));
    v18 = objc_msgSend(v17, "manateeZoneUpgraded");
    *(_DWORD *)buf = 67109120;
    LODWORD(v49) = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "allDevicesStarSky, current manatee state - %d", buf, 8u);

  }
  v19 = 1;
LABEL_50:

  return v19;
}

- (void)storePublicAddressMapping:(id)a3 message:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  os_log_t v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  os_log_t v18;
  const char *v19;
  os_log_t v20;
  os_log_t v21;
  int v22;
  void *v23;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "objectForKey:", CFSTR("PublicAddress")));
  if (!v7)
  {
    v18 = sub_1000681B8("CloudPairing");
    v17 = objc_claimAutoreleasedReturnValue(v18);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    LOWORD(v22) = 0;
    v19 = "cloudpaird: storePublicAddressMapping: Ignoring unpair becasue the address passed in is nil";
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v22, 2u);
    goto LABEL_16;
  }
  if (!v6)
  {
    v20 = sub_1000681B8("CloudPairing");
    v17 = objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    LOWORD(v22) = 0;
    v19 = "cloudpaird: storePublicAddressMapping: Ignoring request becasue the device is nil";
    goto LABEL_15;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueID"));

  if (!v8)
  {
    v21 = sub_1000681B8("CloudPairing");
    v17 = objc_claimAutoreleasedReturnValue(v21);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    LOWORD(v22) = 0;
    v19 = "cloudpaird: storePublicAddressMapping: Device uniqueID is nil so throw this request out";
    goto LABEL_15;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager CPAddressMapping](self, "CPAddressMapping"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager CPAddressMapping](self, "CPAddressMapping"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueID"));
  if (v11)
  {
    objc_msgSend(v12, "removeObjectForKey:", v13);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager CPAddressMapping](self, "CPAddressMapping"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueID"));
  }
  objc_msgSend(v12, "setObject:forKey:", v7, v13);

  v14 = sub_1000681B8("CloudPairing");
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager CPAddressMapping](self, "CPAddressMapping"));
    v22 = 138412290;
    v23 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "cloudpaird: storePublicAddressMapping: current mapping :%@", (uint8_t *)&v22, 0xCu);

  }
  +[CBPreferencesManager removeuserPreference:sync:](CBPreferencesManager, "removeuserPreference:sync:", CFSTR("AddressMapping"), 1);
  v17 = objc_claimAutoreleasedReturnValue(-[CBIDSManager CPAddressMapping](self, "CPAddressMapping"));
  +[CBPreferencesManager setuserPreference:value:sync:](CBPreferencesManager, "setuserPreference:value:sync:", CFSTR("AddressMapping"), v17, 1);
LABEL_16:

}

- (id)publicAddressForIDSDevice:(id)a3
{
  id v4;
  os_log_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = sub_1000681B8("CloudPairing");
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_10016CACC();

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager CPAddressMapping](self, "CPAddressMapping"));
  v8 = objc_msgSend(v7, "count");

  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CBPreferencesManager readUserPreference:](CBPreferencesManager, "readUserPreference:", CFSTR("AddressMapping")));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[CBPreferencesManager readUserPreference:](CBPreferencesManager, "readUserPreference:", CFSTR("AddressMapping")));
      v11 = objc_msgSend(v10, "mutableCopy");
      -[CBIDSManager setCPAddressMapping:](self, "setCPAddressMapping:", v11);

    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager CPAddressMapping](self, "CPAddressMapping"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v4));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager CPAddressMapping](self, "CPAddressMapping"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v4));

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_fetchArrayOfCloudDevicesForPeripheral:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  os_log_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  __int128 v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  os_log_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  os_log_t v23;
  NSObject *v24;
  id v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudPairingQueue](self, "cloudPairingQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 2));
  v7 = sub_1000681B8("CloudPairing");
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Find cloud pairing identifier for peripheral: %@", buf, 0xCu);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CBIDSManager associatedDevices](self, "associatedDevices"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v29;
    *(_QWORD *)&v11 = 138412546;
    v27 = v11;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "idsDevice", v27));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "nsuuid"));
        v18 = objc_msgSend(v17, "isEqual:", v4);

        if (v18)
        {
          v19 = sub_1000681B8("CloudPairing");
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "idsDevice"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "uniqueID"));
            *(_DWORD *)buf = v27;
            v33 = v4;
            v34 = 2112;
            v35 = v22;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Found cloud pairing identifier for peripheral: %@ as %@", buf, 0x16u);

          }
          objc_msgSend(v6, "addObject:", v15);
        }
      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v12);
  }

  v23 = sub_1000681B8("CloudPairing");
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v33 = v4;
    v34 = 2112;
    v35 = v6;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Cloud Devices for peripheral: %@ - %@", buf, 0x16u);
  }

  v25 = objc_msgSend(v6, "copy");
  return v25;
}

- (id)_fetchCloudPairingIdentifierForPeripheral:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  os_log_t v17;
  void *v18;
  os_log_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudPairingQueue](self, "cloudPairingQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = sub_1000681B8("CloudPairing");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Find cloud pairing identifier for peripheral: %@", buf, 0xCu);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = objc_claimAutoreleasedReturnValue(-[CBIDSManager associatedDevices](self, "associatedDevices", 0));
  v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "idsDevice"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "nsuuid"));
        v16 = objc_msgSend(v15, "isEqual:", v4);

        if (v16)
        {
          v19 = sub_1000681B8("CloudPairing");
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "idsDevice"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "uniqueID"));
            *(_DWORD *)buf = 138412546;
            v30 = v4;
            v31 = 2112;
            v32 = v22;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Found cloud pairing identifier for peripheral: %@ as %@", buf, 0x16u);

          }
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "idsDevice"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "uniqueID"));

          goto LABEL_17;
        }
      }
      v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v10)
        continue;
      break;
    }
  }

  v17 = sub_1000681B8("CloudPairing");
  v8 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No cloud pairing identifier FOUND for peripheral: %@", buf, 0xCu);
  }
  v18 = 0;
LABEL_17:

  return v18;
}

- (void)fetchCloudPairingIdentifierForPeripheral:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  os_log_t v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = sub_1000681B8("CloudPairing");
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Find cloud pairing identifier for peripheral: %@", buf, 0xCu);
  }

  v10 = objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudPairingQueue](self, "cloudPairingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000669FC;
  block[3] = &unk_1001E22B0;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async(v10, block);

}

- (void)fetchIDSDevicesWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[CBIDSManager cloudPairingQueue](self, "cloudPairingQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100066AE0;
  v7[3] = &unk_1001E2048;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (BOOL)isReady
{
  return self->_isReady;
}

- (void)setIsReady:(BOOL)a3
{
  self->_isReady = a3;
}

- (int64_t)totalCloudDeviceCount
{
  return self->_totalCloudDeviceCount;
}

- (void)setTotalCloudDeviceCount:(int64_t)a3
{
  self->_totalCloudDeviceCount = a3;
}

- (NSMutableDictionary)CPAddressMapping
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCPAddressMapping:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BTStateWatcher)buddyStateWatcher
{
  return self->_buddyStateWatcher;
}

- (void)setBuddyStateWatcher:(id)a3
{
  objc_storeStrong((id *)&self->_buddyStateWatcher, a3);
}

- (BTStateWatcher)firstUnlockStateWatcher
{
  return self->_firstUnlockStateWatcher;
}

- (void)setFirstUnlockStateWatcher:(id)a3
{
  objc_storeStrong((id *)&self->_firstUnlockStateWatcher, a3);
}

- (IDSAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (IDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (NSString)cloudIdentifier
{
  return self->_cloudIdentifier;
}

- (void)setCloudIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cloudIdentifier, a3);
}

- (NSString)publicAddress
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPublicAddress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)localDeviceName
{
  return self->_localDeviceName;
}

- (void)setLocalDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_localDeviceName, a3);
}

- (NSArray)requestedKeyTypes
{
  return self->_requestedKeyTypes;
}

- (void)setRequestedKeyTypes:(id)a3
{
  objc_storeStrong((id *)&self->_requestedKeyTypes, a3);
}

- (NSMutableArray)cloudDevices
{
  return (NSMutableArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCloudDevices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSArray)associatedDevices
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAssociatedDevices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSMutableSet)unpairedIDSCloudIdentifiers
{
  return (NSMutableSet *)objc_getProperty(self, a2, 112, 1);
}

- (void)setUnpairedIDSCloudIdentifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (BOOL)processingIDSPush
{
  return self->_processingIDSPush;
}

- (void)setProcessingIDSPush:(BOOL)a3
{
  self->_processingIDSPush = a3;
}

- (OS_dispatch_queue)cloudPairingQueue
{
  return self->_cloudPairingQueue;
}

- (void)setCloudPairingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_cloudPairingQueue, a3);
}

- (NSString)localDeviceRandomAddress
{
  return self->_localDeviceRandomAddress;
}

- (void)setLocalDeviceRandomAddress:(id)a3
{
  objc_storeStrong((id *)&self->_localDeviceRandomAddress, a3);
}

- (BOOL)supportsVirtualAddress
{
  return self->_supportsVirtualAddress;
}

- (void)setSupportsVirtualAddress:(BOOL)a3
{
  self->_supportsVirtualAddress = a3;
}

- (NSMutableDictionary)messageIdentifiersWaitingForAck
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (void)setMessageIdentifiersWaitingForAck:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageIdentifiersWaitingForAck, 0);
  objc_storeStrong((id *)&self->_localDeviceRandomAddress, 0);
  objc_storeStrong((id *)&self->_cloudPairingQueue, 0);
  objc_storeStrong((id *)&self->_unpairedIDSCloudIdentifiers, 0);
  objc_storeStrong((id *)&self->_associatedDevices, 0);
  objc_storeStrong((id *)&self->_cloudDevices, 0);
  objc_storeStrong((id *)&self->_requestedKeyTypes, 0);
  objc_storeStrong((id *)&self->_localDeviceName, 0);
  objc_storeStrong((id *)&self->_publicAddress, 0);
  objc_storeStrong((id *)&self->_cloudIdentifier, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_firstUnlockStateWatcher, 0);
  objc_storeStrong((id *)&self->_buddyStateWatcher, 0);
  objc_storeStrong((id *)&self->_CPAddressMapping, 0);
}

@end
