@implementation CloudPairing

+ (id)sharedInstance
{
  if (qword_1009931F8 != -1)
    dispatch_once(&qword_1009931F8, &stru_100934050);
  return (id)qword_1009931F0;
}

- (BTCloudServicesClient)cloudClient
{
  if (qword_100993208 != -1)
    dispatch_once(&qword_100993208, &stru_100934070);
  return (BTCloudServicesClient *)(id)qword_100993200;
}

- (CloudPairing)init
{
  CloudPairing *v2;
  CloudPairing *v3;
  NSObject *v4;
  uint64_t v5;
  NSArray *cloudLocalUUIDs;
  uint64_t v7;
  NSArray *cloudidsIdentifiers;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *serialQueue;
  NSArray *v15;
  NSArray *requestedKeyTypes;
  uint64_t v17;
  NSString *localDeviceName;
  NSObject *v19;
  uint64_t v20;
  NSMutableArray *cloudDevices;
  uint64_t v22;
  NSMutableArray *cloudUploadedKeys;
  uint64_t v24;
  id v25;
  uint8_t *v26;
  NSString *v27;
  NSString *publicAddress;
  NSMutableDictionary *idsMultiUsersDictionary;
  NSString *currentIDSUser;
  NSString *currentUserRandomAddress;
  id v32;
  uint64_t v33;
  NSObject *v34;
  int v35;
  NSObject *v36;
  CloudPairing *v37;
  NSObject *v38;
  uint32_t v39;
  NSObject *v40;
  uint8_t v42[8];
  _QWORD handler[4];
  id v44;
  int out_token;
  char v46;
  int v47;
  __int16 v48;
  objc_super v49;
  uint8_t buf[8];
  char v51;
  char v52[24];

  v49.receiver = self;
  v49.super_class = (Class)CloudPairing;
  v2 = -[CloudPairing init](&v49, "init");
  v3 = v2;
  if (!v2)
  {
LABEL_31:
    v37 = v3;
    goto LABEL_32;
  }
  v4 = qword_1009997F8;
  if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CloudPairing init", buf, 2u);
  }
  if ((MGGetBoolAnswer(CFSTR("bluetooth-le")) & 1) != 0)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
    cloudLocalUUIDs = v2->_cloudLocalUUIDs;
    v2->_cloudLocalUUIDs = (NSArray *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
    cloudidsIdentifiers = v2->_cloudidsIdentifiers;
    v2->_cloudidsIdentifiers = (NSArray *)v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_DEFAULT, -1);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_create("com.apple.bluetoothd.cloudpairing.serial", v12);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v13;

    v15 = (NSArray *)objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", CFSTR("EncryptionKeys"), CFSTR("IdentityKeys"), 0);
    requestedKeyTypes = v2->_requestedKeyTypes;
    v2->_requestedKeyTypes = v15;

    v2->_keyLength = 16;
    v17 = objc_claimAutoreleasedReturnValue(-[CloudPairing deviceName](v2, "deviceName"));
    localDeviceName = v2->_localDeviceName;
    v2->_localDeviceName = (NSString *)v17;

    if (!v2->_localDeviceName)
    {
      v2->_localDeviceName = (NSString *)CFSTR("iOS Device");

      v19 = (id)qword_1009997F8;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_1006FC3A4((uint64_t)-[NSString UTF8String](v2->_localDeviceName, "UTF8String"), (uint64_t)v52, v19);

    }
    v20 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 1));
    cloudDevices = v2->_cloudDevices;
    v2->_cloudDevices = (NSMutableArray *)v20;

    v22 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 1));
    cloudUploadedKeys = v2->_cloudUploadedKeys;
    v2->_cloudUploadedKeys = (NSMutableArray *)v22;

    v48 = 0;
    v47 = 0;
    v24 = sub_10034D3CC();
    if (!(*(unsigned int (**)(uint64_t, int *))(*(_QWORD *)v24 + 32))(v24, &v47))
    {
      v25 = objc_alloc((Class)NSString);
      sub_10046E9BC((unsigned __int8 *)&v47, buf);
      v26 = v51 >= 0 ? buf : *(uint8_t **)buf;
      v27 = (NSString *)objc_msgSend(v25, "initWithUTF8String:", v26);
      publicAddress = v3->_publicAddress;
      v3->_publicAddress = v27;

      if (v51 < 0)
        operator delete(*(void **)buf);
    }
    if (v3->_publicAddress)
    {
      *(_WORD *)&v3->_keysGenerated = 0;
      -[CloudPairing setServerConnection:](v3, "setServerConnection:", 0);
      v3->_needsCloudKitPush = 0;
      v3->_updatingCloudKit = 0;
      v3->_supportsVirtualAddress = 0;
      idsMultiUsersDictionary = v3->_idsMultiUsersDictionary;
      v3->_idsMultiUsersDictionary = 0;

      currentIDSUser = v3->_currentIDSUser;
      v3->_currentIDSUser = 0;

      currentUserRandomAddress = v3->_currentUserRandomAddress;
      v3->_currentUserRandomAddress = 0;

      v3->_multipleAdvInitialized = 0;
      v32 = -[CloudPairing cloudClient](v3, "cloudClient");
      v3->_accessibilityHeadTrackingEnabled = 1;
      v46 = 0;
      v33 = sub_100038E50();
      (*(void (**)(uint64_t, char *))(*(_QWORD *)v33 + 104))(v33, &v46);
      if (v46)
      {
        v34 = (id)qword_1009997F8;
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v35 = MKBDeviceUnlockedSinceBoot();
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v35;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Already first unlocked: %d", buf, 8u);
        }

        -[CloudPairing startUpServices](v3, "startUpServices");
      }
      else
      {
        out_token = -1;
        *(_QWORD *)buf = 0;
        objc_initWeak((id *)buf, v3);
        v38 = *(id *)(sub_10006BBEC() + 8);
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_1004E9B88;
        handler[3] = &unk_10092BDF8;
        objc_copyWeak(&v44, (id *)buf);
        v39 = notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &out_token, v38, handler);

        v40 = qword_1009997F8;
        if (v39)
        {
          if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_ERROR))
            sub_1006FC344();
        }
        else if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v42 = 0;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Successfully registered for MKB first unlock notification", v42, 2u);
        }
        objc_destroyWeak(&v44);
        objc_destroyWeak((id *)buf);
      }
      goto LABEL_31;
    }
    if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_FAULT))
      sub_1006FC30C();
  }
  else
  {
    v36 = qword_1009997F8;
    if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "CloudPairing not supported on this platform (LE)", buf, 2u);
    }
  }
  v37 = 0;
LABEL_32:

  return v37;
}

- (void)startUpServices
{
  uint64_t v3;
  const char *v4;
  NSObject *serialQueue;
  uint32_t v6;
  NSObject *v7;
  _BOOL4 v8;
  _QWORD handler[5];
  uint8_t buf[4];
  uint32_t v11;

  v3 = sub_100350078();
  (*(void (**)(uint64_t))(*(_QWORD *)v3 + 200))(v3);
  if (_os_feature_enabled_impl("PowerUI", "audioAccessoryOBC")
    && NSClassFromString(CFSTR("PowerUISmartChargeClientAudioAccessories")))
  {
    -[CloudPairing startListeningToPowerUIStatusChanges](self, "startListeningToPowerUIStatusChanges");
  }
  if (_os_feature_enabled_impl("BluetoothFeatures", "CustomHRTFSupport") && sub_1004F9720())
  {
    self->_cloudSoundProfileChangedNotifyToken = -1;
    v4 = (const char *)objc_msgSend(BTCloudSoundProfileChangedNotification, "UTF8String");
    serialQueue = self->_serialQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1004E9E2C;
    handler[3] = &unk_1009172C8;
    handler[4] = self;
    v6 = notify_register_dispatch(v4, &self->_cloudSoundProfileChangedNotifyToken, serialQueue, handler);
    v7 = qword_1009997F8;
    v8 = os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        *(_DWORD *)buf = 67109120;
        v11 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "BTAudioCloudSyncMonitor: Failed registration for CloudSoundProfileChangedNotification with error : %u", buf, 8u);
      }
    }
    else
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "BTAudioCloudSyncMonitor: Successfully registered for CloudSoundProfileChangedNotification", buf, 2u);
      }
      -[CloudPairing fetchSoundProfile](self, "fetchSoundProfile");
    }
  }
}

- (void)multipleAdvInstancesInitialized:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  _DWORD v11[2];
  __int16 v12;
  unsigned int v13;
  __int16 v14;
  void *v15;

  v3 = a3;
  v5 = (id)qword_1009997F8;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[CloudPairing multipleAdvInitialized](self, "multipleAdvInitialized");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing currentUserRandomAddress](self, "currentUserRandomAddress"));
    v11[0] = 67109634;
    v11[1] = v3;
    v12 = 1024;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MUC - multiple adv instances initialized? %d, stored %d, RSA %@", (uint8_t *)v11, 0x18u);

  }
  if (-[CloudPairing multipleAdvInitialized](self, "multipleAdvInitialized") != v3)
  {
    -[CloudPairing setMultipleAdvInitialized:](self, "setMultipleAdvInitialized:", v3);
    if (-[CloudPairing multipleAdvInitialized](self, "multipleAdvInitialized"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing currentUserRandomAddress](self, "currentUserRandomAddress"));
      v9 = v8 == 0;

      if (!v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing currentUserRandomAddress](self, "currentUserRandomAddress"));
        -[CloudPairing updateRandomAddressContinuityAdvInstance:](self, "updateRandomAddressContinuityAdvInstance:", v10);

      }
    }
  }
}

- (id)deviceName
{
  return (id)MGCopyAnswer(CFSTR("UserAssignedDeviceName"), 0);
}

- (BOOL)isRunningInRecovery
{
  return 0;
}

- (BOOL)generateKeys
{
  uint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v3 = sub_1000419F4();
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1004EA0EC;
  v5[3] = &unk_100929128;
  v5[4] = self;
  v5[5] = &v6;
  sub_100475D40(v3, v5);
  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

- (BOOL)_generateKeys
{
  uint64_t v3;
  _OWORD *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  int v20;
  void *v21;

  if (qword_1009778B8 != -1)
    dispatch_once(&qword_1009778B8, &stru_100934270);
  v3 = sub_10068D26C(qword_1009778B0);
  if ((v3 & 1) == 0)
  {
    if (qword_1009778B8 != -1)
      dispatch_once(&qword_1009778B8, &stru_100934270);
    v3 = sub_10068DBE8(qword_1009778B0);
  }
  if (qword_1009778B8 != -1)
    dispatch_once(&qword_1009778B8, &stru_100934270);
  *(_OWORD *)self->_encryptionRootKey = *(_OWORD *)(qword_1009778B0 + 168);
  *(_OWORD *)self->_identityResolvingKey = *(_OWORD *)(qword_1009778B0 + 184);
  v4 = (_OWORD *)(qword_1009778B0 + 312);
  v5 = *(_OWORD *)(qword_1009778B0 + 328);
  *(_OWORD *)self->_cloudPrivateKey = *(_OWORD *)(qword_1009778B0 + 312);
  *(_OWORD *)&self->_cloudPrivateKey[16] = v5;
  v6 = v4[4];
  v7 = v4[5];
  v8 = v4[3];
  *(_OWORD *)&self->_cloudPrivateKey[32] = v4[2];
  *(_OWORD *)&self->_cloudPrivateKey[80] = v7;
  *(_OWORD *)&self->_cloudPrivateKey[64] = v6;
  *(_OWORD *)&self->_cloudPrivateKey[48] = v8;
  v9 = *(_OWORD *)(qword_1009778B0 + 264);
  v10 = *(_OWORD *)(qword_1009778B0 + 280);
  v11 = *(_OWORD *)(qword_1009778B0 + 296);
  *(_OWORD *)self->_cloudPublicKey = *(_OWORD *)(qword_1009778B0 + 248);
  *(_OWORD *)&self->_cloudPublicKey[48] = v11;
  *(_OWORD *)&self->_cloudPublicKey[32] = v10;
  *(_OWORD *)&self->_cloudPublicKey[16] = v9;
  *(_OWORD *)self->_cloudNonce = *(_OWORD *)(qword_1009778B0 + 408);
  if (IsAppleInternalBuild(v3))
  {
    v12 = (id)qword_1009997F8;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", self->_cloudPrivateKey, 96));
      v20 = 138412290;
      v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "_cloudPrivateKey: [ %@ ]", (uint8_t *)&v20, 0xCu);

    }
    v14 = (id)qword_1009997F8;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", self->_cloudPublicKey, 64));
      v20 = 138412290;
      v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "_cloudPublicKey: [ %@ ]", (uint8_t *)&v20, 0xCu);

    }
    v16 = (id)qword_1009997F8;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", self->_cloudNonce, 16));
      v20 = 138412290;
      v21 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "_cloudNonce: [ %@ ]", (uint8_t *)&v20, 0xCu);

    }
  }
  if (qword_1009778B8 != -1)
    dispatch_once(&qword_1009778B8, &stru_100934270);
  v18 = sub_100184E88((__int128 *)(qword_1009778B0 + 136), 3, 0, self->_diversifierHidingKey);
  if (v18)
  {
    if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_FAULT))
      sub_1006FC3E0();
  }
  else
  {
    self->_keysGenerated = 1;
  }
  return v18 == 0;
}

- (void)_handleConnectionEvent:(id)a3
{
  id v4;
  xpc_type_t type;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD handler[4];
  id v21;
  _BYTE buf[24];

  v4 = a3;
  type = xpc_get_type(v4);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    if (v4 != &_xpc_error_connection_invalid)
    {
      *(_QWORD *)buf = 0;
      objc_initWeak((id *)buf, self);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1004EA70C;
      handler[3] = &unk_1009340D8;
      objc_copyWeak(&v21, (id *)buf);
      xpc_connection_set_event_handler((xpc_connection_t)v4, handler);
      v8 = objc_claimAutoreleasedReturnValue(-[CloudPairing serialQueue](self, "serialQueue"));
      xpc_connection_set_target_queue((xpc_connection_t)v4, v8);

      xpc_connection_resume((xpc_connection_t)v4);
      objc_destroyWeak(&v21);
      objc_destroyWeak((id *)buf);
      goto LABEL_16;
    }
    v11 = qword_1009997F8;
    if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_ERROR))
      sub_1006FC44C(v11, v12, v13, v14, v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing serverConnection](self, "serverConnection"));
    v10 = v19 == 0;

    goto LABEL_14;
  }
  v6 = qword_1009997F8;
  v7 = os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT);
  if (type != (xpc_type_t)&_xpc_type_error)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Cloudpairing Unexpected XPC server event: %@", buf, 0xCu);
    }
    goto LABEL_16;
  }
  if (v7)
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Cloudpairing XPC server error: %@", buf, 0xCu);
  }
  if (v4 == &_xpc_error_connection_invalid)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing serverConnection](self, "serverConnection"));
    v10 = v9 == 0;

LABEL_14:
    if (!v10)
      -[CloudPairing setServerConnection:](self, "setServerConnection:", 0);
  }
LABEL_16:

}

- (void)_handleMsg:(id)a3
{
  id v4;
  const char *string;
  NSObject *v6;
  xpc_object_t value;
  void *v8;
  void *v9;
  NSObject *v10;
  const _xpc_type_s *type;
  const char *name;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  void *v19;
  unsigned int v20;
  void *v21;
  BOOL v22;
  void *v23;
  int v24;
  NSObject *v25;
  const char *v26;
  void *v27;
  BOOL v28;
  void *v29;
  id v30;
  __CFString *v31;
  uint64_t v32;
  uint64_t v33;
  __CFString *v34;
  void *v35;
  BOOL v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  void *v42;
  BOOL v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  void *v49;
  BOOL v50;
  void *v51;
  id v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  void *v58;
  BOOL v59;
  void *v60;
  id v61;
  uint64_t v62;
  char *v63;
  id v64;
  uint64_t v65;
  void *v66;
  BOOL v67;
  void *v68;
  unsigned int v69;
  uint64_t v70;
  const char *v71;
  NSObject *v72;
  os_log_type_t v73;
  uint32_t v74;
  NSObject *v75;
  void *v76;
  BOOL v77;
  void *v78;
  unsigned int v79;
  uint64_t v80;
  NSObject *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  NSObject *v86;
  _BOOL8 v87;
  int v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  NSObject *v93;
  void *v94;
  NSObject *v95;
  void *v96;
  void *v97;
  void *v98;
  NSObject *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  NSObject *v104;
  NSObject *v105;
  void *v106;
  BOOL v107;
  void *v108;
  void *v109;
  NSObject *v110;
  void *v111;
  uint64_t v112;
  void *v113;
  NSObject *v114;
  uint64_t v115;
  id v116;
  NSObject *v117;
  void *v118;
  uint64_t v119;
  NSObject *v120;
  id v121;
  uint64_t v122;
  void *v123;
  uint64_t v124;
  NSObject *v125;
  uint64_t v126;
  void *v127;
  void *v128;
  uint64_t v129;
  id v130;
  id v131;
  uint64_t v132;
  void *i;
  void *v134;
  uint64_t v135;
  uint64_t v136;
  id v137;
  NSObject *v138;
  NSObject *v139;
  void *v140;
  void *v141;
  NSObject *v142;
  void *v143;
  uint64_t v144;
  NSObject *v145;
  void *v146;
  void *v147;
  BOOL v148;
  void *v149;
  NSObject *v150;
  void *v151;
  NSObject *v152;
  uint64_t v153;
  void *v154;
  void *v155;
  uint64_t v156;
  id v157;
  id v158;
  __int128 v159;
  uint64_t v160;
  void *j;
  std::string::size_type v162;
  uint64_t v163;
  NSObject *v164;
  NSObject *v165;
  id v166;
  id v167;
  uint64_t v168;
  void *v169;
  void *v170;
  uint64_t v171;
  __int128 v172;
  uint64_t v173;
  void *v174;
  uint64_t v175;
  id v176;
  unsigned __int8 *v177;
  uint64_t v178;
  id v179;
  id v180;
  unsigned int v181;
  int v182;
  unsigned int v183;
  unsigned __int32 v184;
  std::string *v185;
  void *v186;
  int v187;
  void *v188;
  id v189;
  int v190;
  NSObject *v191;
  std::string *v192;
  void *v193;
  void *v194;
  std::string::size_type v195;
  char v196;
  _BOOL4 v197;
  uint64_t v198;
  uint64_t v200;
  NSObject *v201;
  const char *v202;
  uint64_t v203;
  NSObject *v204;
  std::string *v205;
  NSObject *v206;
  id v207;
  id v208;
  uint64_t v209;
  void *v210;
  void *v211;
  uint64_t v212;
  __int128 v213;
  uint64_t v214;
  void *v215;
  uint64_t v216;
  void *v217;
  unint64_t v218;
  uint64_t v219;
  uint64_t v220;
  NSObject *v221;
  std::string *v222;
  void *v223;
  void *v224;
  void *v225;
  id v226;
  void *v227;
  BOOL v228;
  void *v229;
  id v230;
  void *v231;
  _BOOL4 v232;
  id v233;
  unint64_t v234;
  unint64_t v235;
  char v237;
  int v238;
  __int16 v239;
  NSObject *v240;
  unsigned int v241;
  unsigned int v242;
  uint64_t v243;
  void *v244;
  void *v245;
  uint64_t v246;
  id v247;
  __int128 v248;
  uint64_t v249;
  void *v250;
  void *v251;
  uint64_t v252;
  NSObject *v253;
  id v254;
  std::string *v255;
  unsigned __int8 *v256;
  _QWORD *v257;
  NSObject *v258;
  NSObject *v259;
  void **v260;
  uint64_t v261;
  NSObject *v263;
  void **v264;
  id v265;
  NSObject *v266;
  id v267;
  id v268;
  unsigned int v269;
  unsigned int v270;
  uint64_t v271;
  void *v272;
  void *v273;
  uint64_t v274;
  __int128 v275;
  uint64_t v276;
  NSObject *v277;
  id v278;
  unsigned __int8 *v279;
  NSObject *v280;
  unsigned int v281;
  int v282;
  int v283;
  int v284;
  std::string *v285;
  void *v286;
  int v287;
  void *v288;
  id v289;
  int v290;
  NSObject *v291;
  std::string *v292;
  void *v293;
  void *v294;
  std::string::size_type size;
  char v296;
  _BOOL4 v297;
  uint64_t v298;
  NSObject *v300;
  std::string *v301;
  void *v302;
  BOOL v303;
  NSObject *v304;
  std::string *v305;
  id v306;
  id v307;
  void *v308;
  uint64_t v309;
  id v310;
  void *v311;
  std::string::size_type v312;
  NSObject *v313;
  std::string *v314;
  void *v315;
  void *v316;
  void *v317;
  BOOL v318;
  id v319;
  int v320;
  BOOL v321;
  NSObject *v323;
  void **v324;
  void *v325;
  BOOL v326;
  id v327;
  unint64_t v328;
  NSObject *v329;
  void **v330;
  void *v331;
  void *v332;
  void *v333;
  void *v334;
  void *v335;
  id v336;
  id v337;
  void *v338;
  void *v339;
  _BOOL4 v340;
  NSObject *v341;
  void *v342;
  NSObject *v343;
  void *v344;
  id v345;
  id v346;
  NSObject *v348;
  std::string *v349;
  NSObject *v350;
  id v351;
  int v352;
  id v353;
  id v354;
  int k;
  void *v356;
  BOOL v357;
  NSObject *v358;
  void **v359;
  NSObject *v360;
  _QWORD *v361;
  NSObject *v362;
  _BOOL4 v363;
  void **v364;
  __int128 v365;
  void **v366;
  void *v367;
  NSObject *v368;
  void *v369;
  NSObject *v370;
  void *v371;
  NSObject *v372;
  void *v373;
  NSObject *v374;
  NSObject *v375;
  void *v376;
  unsigned __int8 v377;
  NSObject *v378;
  int v379;
  NSObject *v380;
  int v381;
  int v382;
  unsigned int v383;
  unsigned int v384;
  NSObject *v385;
  uint64_t v386;
  NSObject *v387;
  int v388;
  std::string::size_type v389;
  int v390;
  std::string *v391;
  unsigned int v392;
  NSObject *v393;
  int v394;
  std::string::size_type v395;
  int v396;
  std::string *v397;
  const char *v398;
  const char *v399;
  NSObject *v400;
  std::string *v401;
  unsigned int v402;
  uint64_t v403;
  NSObject *v404;
  int v405;
  std::string::size_type v406;
  int v407;
  std::string *v408;
  NSObject *v409;
  id v410;
  NSObject *v411;
  NSObject *v412;
  int v413;
  std::string::size_type v414;
  int v415;
  std::string *v416;
  NSObject *v417;
  int v418;
  std::string::size_type v419;
  int v420;
  std::string *v421;
  uint64_t v422;
  NSObject *v423;
  int v424;
  std::string::size_type v425;
  int v426;
  std::string *v427;
  char v428;
  char v429;
  NSObject *v430;
  int v431;
  std::string::size_type v432;
  int v433;
  std::string *v434;
  NSObject *v435;
  std::string *v436;
  int v437;
  int v438;
  const char *v439;
  NSObject *v440;
  int v441;
  std::string::size_type v442;
  int v443;
  std::string *v444;
  NSObject *v445;
  std::string *v446;
  void *v447;
  void *v448;
  void *v449;
  BOOL v450;
  void *v451;
  id v452;
  void *v453;
  BOOL v454;
  void *v455;
  void *v456;
  void *v457;
  id v458;
  void *v459;
  void *v460;
  id v461;
  double v462;
  NSObject *v463;
  std::string *v464;
  int v465;
  std::string::size_type v466;
  int v467;
  std::string *v468;
  std::string *v469;
  NSObject *v470;
  uint64_t v471;
  _BOOL8 v472;
  NSObject *v473;
  const char *v474;
  uint64_t v475;
  __int128 v476;
  __int128 v477;
  __int128 v478;
  __int128 v479;
  _BOOL4 v480;
  __int128 v481;
  id v482;
  id v483;
  __int128 v484;
  id v485;
  id v486;
  id v487;
  __int128 v488;
  __int128 v489;
  id v490;
  __int128 v491;
  __int128 v492;
  __int128 v493;
  __int128 v494;
  __int128 v495;
  __int128 v496;
  __int128 v497;
  __int128 v498;
  __int128 v499;
  __int128 v500;
  std::string *v501;
  __int128 v502;
  __int128 v503;
  __int128 v504;
  id v505;
  void *v506[2];
  char v507;
  void *v508[2];
  char v509;
  uint64_t v510;
  unsigned int v511;
  int v512;
  char v513;
  _BYTE v514[7];
  unsigned int v515;
  __int16 v516;
  __int128 v517;
  __int128 v518;
  __int128 v519;
  __int128 v520;
  __int128 v521;
  __int128 v522;
  __int128 v523;
  __int128 v524;
  std::string v525;
  std::string v526;
  _QWORD v527[6];
  __int128 v528;
  __int128 v529;
  __int128 v530;
  __int128 v531;
  __int128 v532;
  __int128 v533;
  __int128 v534;
  __int128 v535;
  void *v536[2];
  char v537;
  void *v538[2];
  char v539;
  __int128 v540;
  __int128 v541;
  __int128 v542;
  __int128 v543;
  void *v544[2];
  char v545;
  __int128 v546;
  __int128 v547;
  __int128 v548;
  __int128 v549;
  _QWORD v550[4];
  id v551;
  _QWORD v552[4];
  id v553;
  _QWORD v554[5];
  NSObject *v555;
  std::string *v556;
  void *v557[2];
  char v558;
  int v559;
  std::string *v560;
  __int128 v561;
  __n128 v562;
  __int128 v563;
  __int128 v564;
  _BYTE v565[128];
  _QWORD v566[3];
  _BYTE v567[128];
  _QWORD v568[3];
  std::string v569[2];
  uint64_t v570;
  _BYTE v571[128];
  _QWORD v572[3];
  _BYTE v573[128];
  _QWORD v574[3];
  std::string v575;
  void *v576[3];
  _BYTE v577[128];
  _QWORD v578[3];
  _BYTE v579[128];
  _QWORD v580[3];
  const __CFString *v581;
  void *v582;
  const __CFString *v583;
  void *v584;
  const __CFString *v585;
  void *v586;

  v4 = a3;
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
  {
    string = xpc_dictionary_get_string(v4, "kMsgId");
    v6 = (id)qword_1009997F8;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v569[0].__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)string;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Cloudpairing got msg: %s", (uint8_t *)v569, 0xCu);
    }

    value = xpc_dictionary_get_value(v4, "kMsgArgs");
    v8 = (void *)objc_claimAutoreleasedReturnValue(value);
    v9 = v8;
    if (!v8)
    {
      if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_ERROR))
        sub_1006FC4BC();
      goto LABEL_118;
    }
    if (xpc_get_type(v8) != (xpc_type_t)&_xpc_type_dictionary)
    {
      v10 = (id)qword_1009997F8;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        type = xpc_get_type(v9);
        name = xpc_type_get_name(type);
        sub_1006FC6DC((uint64_t)name, (uint64_t)v569, v10);
      }

      goto LABEL_118;
    }
    if (!strcmp(string, "manateeUdpateStatus"))
    {
      v13 = _CFXPCCreateCFObjectFromXPCMessage(v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v13, "objectForKey:", CFSTR("kUploadStatus")));
      v18 = v17 == 0;

      if (!v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v13, "objectForKey:", CFSTR("kUploadStatus")));
        v20 = objc_msgSend(v19, "BOOLValue");

        if (v20)
          -[CloudPairing cloudpairdMsg:args:](self, "cloudpairdMsg:args:", CFSTR("deleteOldContainer"), 0);
      }
      goto LABEL_117;
    }
    if (!strcmp(string, "smartRoutingCapable"))
    {
      v13 = _CFXPCCreateCFObjectFromXPCMessage(v9);
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v13, "objectForKey:", CFSTR("srCapable")));
      v22 = v21 == 0;

      if (!v22)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v13, "objectForKey:", CFSTR("srCapable")));
        v24 = objc_msgSend(v23, "BOOLValue");

        v25 = qword_1009997F8;
        if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
        {
          v26 = "No";
          if (v24)
            v26 = "Yes";
          LODWORD(v569[0].__r_.__value_.__l.__data_) = 136315138;
          *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v26;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Smart Route Support: Set to %s", (uint8_t *)v569, 0xCu);
        }
        if (qword_1009778E8 != -1)
          dispatch_once(&qword_1009778E8, &stru_100934290);
        sub_100471E74((uint64_t)off_1009778E0, v24);
      }
      goto LABEL_117;
    }
    if (!strcmp(string, "SignInStatusChanged"))
    {
      v13 = _CFXPCCreateCFObjectFromXPCMessage(v9);
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v13, "objectForKey:", CFSTR("kSignInStatus")));
      v28 = v27 == 0;

      if (!v28)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v13, "objectForKey:", CFSTR("kSignInStatus")));
        v30 = objc_msgSend(v29, "BOOLValue");

        v31 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v13, "objectForKey:", CFSTR("kSignInAppleID")));
        -[CloudPairing setICloudSignedIn:](self, "setICloudSignedIn:", v30);
        v32 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v31, v32) & 1) == 0)
        {

          v31 = &stru_100941758;
        }
        v33 = sub_100350078();
        v34 = objc_retainAutorelease(v31);
        sub_100091AE8(v557, (char *)-[__CFString UTF8String](v34, "UTF8String"));
        (*(void (**)(uint64_t, id, void **))(*(_QWORD *)v33 + 80))(v33, v30, v557);
        if (v558 < 0)
          operator delete(v557[0]);

      }
      goto LABEL_117;
    }
    if (!strcmp(string, "MasterKeysAvailable"))
    {
      v13 = _CFXPCCreateCFObjectFromXPCMessage(v9);
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v13, "objectForKey:", CFSTR("kMasterKeyBlob")));
      v36 = v35 == 0;

      if (!v36)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v13, "objectForKey:", CFSTR("kMasterKeyBlob")));
        v38 = objc_msgSend(v37, "length");
        v39 = objc_retainAutorelease(v37);
        v40 = objc_msgSend(v39, "bytes");
        v41 = sub_100350078();
        (*(void (**)(uint64_t, id, id))(*(_QWORD *)v41 + 88))(v41, v40, v38);

      }
      goto LABEL_117;
    }
    if (!strcmp(string, "MasterKeysNotAvailable"))
    {
      v13 = _CFXPCCreateCFObjectFromXPCMessage(v9);
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v13, "objectForKey:", CFSTR("kMasterKeyBlob")));
      v43 = v42 == 0;

      if (!v43)
      {
        v44 = sub_100350078();
        (*(void (**)(uint64_t))(*(_QWORD *)v44 + 96))(v44);
      }
      goto LABEL_117;
    }
    if (!strcmp(string, "DeviceInfoAvailable"))
    {
      v13 = _CFXPCCreateCFObjectFromXPCMessage(v9);
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v13, "objectForKey:", CFSTR("kDeviceInfoBlob")));
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("loginID")));
      v575.__r_.__value_.__s.__data_[0] = 0;
      memset(v569, 0, 24);
      if (qword_100977A68 != -1)
        dispatch_once(&qword_100977A68, &stru_1009342B0);
      sub_1004668F4((uint64_t)off_100977A60, &v575, (uint64_t)v569);
      if (objc_msgSend(v46, "length"))
      {
        v47 = objc_retainAutorelease(v46);
        if (std::string::compare(v569, (const std::string::value_type *)objc_msgSend(v47, "UTF8String")))
        {
          v48 = qword_100999870;
          if (os_log_type_enabled((os_log_t)qword_100999870, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(v576[0]) = 138412546;
            *(void **)((char *)v576 + 4) = v47;
            WORD2(v576[1]) = 2112;
            *(void **)((char *)&v576[1] + 6) = v45;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Cloud: Dropping other user's legacy magic info message: %@ - %@", (uint8_t *)v576, 0x16u);
          }
          if (SHIBYTE(v569[0].__r_.__value_.__r.__words[2]) < 0)
            operator delete(v569[0].__r_.__value_.__l.__data_);

          goto LABEL_118;
        }
      }
      if (v45)
      {
        v54 = objc_msgSend(v45, "length");
        v56 = (char *)&v476 - ((__chkstk_darwin(v54, v55) + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v56, (size_t)v54);
        memmove(v56, objc_msgSend(objc_retainAutorelease(v45), "bytes"), (size_t)v54);
        v57 = sub_100350078();
        (*(void (**)(uint64_t, char *, id))(*(_QWORD *)v57 + 104))(v57, v56, v54);
      }
      if (SHIBYTE(v569[0].__r_.__value_.__r.__words[2]) < 0)
        operator delete(v569[0].__r_.__value_.__l.__data_);

      goto LABEL_117;
    }
    if (!strcmp(string, "DeviceInfoUploadStatus"))
    {
      v13 = _CFXPCCreateCFObjectFromXPCMessage(v9);
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v13, "objectForKey:", CFSTR("kUploadStatus")));
      v50 = v49 == 0;

      if (!v50)
      {
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v13, "objectForKey:", CFSTR("kUploadStatus")));
        v52 = objc_msgSend(v51, "BOOLValue");

        v53 = sub_100350078();
        (*(void (**)(uint64_t, id))(*(_QWORD *)v53 + 112))(v53, v52);
      }
      goto LABEL_117;
    }
    if (!strcmp(string, "ManateeBlobUpdate"))
    {
      v13 = _CFXPCCreateCFObjectFromXPCMessage(v9);
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v13, "objectForKey:", CFSTR("kDeviceInfoBlob")));
      v59 = v58 == 0;

      if (!v59)
      {
        v60 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v13, "objectForKey:", CFSTR("kDeviceInfoBlob")));
        v61 = objc_msgSend(v60, "length");
        v63 = (char *)&v476 - ((__chkstk_darwin(v61, v62) + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v63, (size_t)v61);
        v64 = objc_retainAutorelease(v60);
        memmove(v63, objc_msgSend(v64, "bytes"), (size_t)v61);
        v65 = sub_100350078();
        (*(void (**)(uint64_t, char *, id))(*(_QWORD *)v65 + 160))(v65, v63, v61);

      }
      goto LABEL_117;
    }
    if (!strcmp(string, "oldContainerDeleted"))
    {
      v13 = _CFXPCCreateCFObjectFromXPCMessage(v9);
      v66 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v13, "objectForKey:", CFSTR("kDeleteSuccess")));
      v67 = v66 == 0;

      if (v67)
        goto LABEL_117;
      v68 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v13, "objectForKey:", CFSTR("kDeleteSuccess")));
      v69 = objc_msgSend(v68, "BOOLValue");

      v70 = qword_1009997F8;
      if (!os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
        goto LABEL_117;
      LODWORD(v569[0].__r_.__value_.__l.__data_) = 67109120;
      HIDWORD(v569[0].__r_.__value_.__r.__words[0]) = v69;
      v71 = "Status for old container deletion %d";
      v72 = v70;
      v73 = OS_LOG_TYPE_DEFAULT;
      v74 = 8;
    }
    else
    {
      if (!strcmp(string, "forceManateeUpgrade"))
      {
        v13 = _CFXPCCreateCFObjectFromXPCMessage(v9);
        v75 = qword_1009997F8;
        if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_INFO))
        {
          LODWORD(v569[0].__r_.__value_.__l.__data_) = 138412290;
          *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v13;
          _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_INFO, "Process forceManateeUpgrade: %@", (uint8_t *)v569, 0xCu);
        }
        v76 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v13, "objectForKey:", CFSTR("kEncryptionSupport")));
        v77 = v76 == 0;

        if (!v77)
        {
          v78 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v13, "objectForKey:", CFSTR("kEncryptionSupport")));
          v79 = objc_msgSend(v78, "BOOLValue");

          if (v79)
          {
            v80 = sub_100350078();
            (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v80 + 136))(v80, 1);
          }
        }
        goto LABEL_117;
      }
      if (!strcmp(string, "GenerateCloudPairingKeys"))
      {
        v81 = qword_1009997F8;
        if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_INFO))
        {
          LOWORD(v569[0].__r_.__value_.__l.__data_) = 0;
          _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_INFO, "Process GenerateCloudPairingKeys", (uint8_t *)v569, 2u);
        }
        v13 = _CFXPCCreateCFObjectFromXPCObject(v9);
        *(_QWORD *)&v504 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v13, "objectForKey:", CFSTR("kCloudPairingKeyTypes")));
        v82 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v13, "objectForKey:", CFSTR("kCloudPairingKeyLength")));
        v83 = objc_msgSend(v82, "unsignedIntegerValue");

        v84 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("kLocalRandomAddress")));
        v85 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing generateKeyDictForTypes:keyLength:forAddress:](self, "generateKeyDictForTypes:keyLength:forAddress:", (_QWORD)v504, v83, v84));
        v86 = (id)qword_1009997F8;
        v87 = os_log_type_enabled(v86, OS_LOG_TYPE_INFO);
        if (v87)
        {
          v88 = IsAppleInternalBuild(v87);
          v89 = v85;
          if (!v88)
            v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v85, "count")));
          LODWORD(v569[0].__r_.__value_.__l.__data_) = 138412290;
          *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v89;
          _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_INFO, "Replying GenerateCloudPairingKeys: %@", (uint8_t *)v569, 0xCu);
          if (!v88)

        }
        -[CloudPairing cloudpairdReplyMsg:args:](self, "cloudpairdReplyMsg:args:", v4, v85);

        goto LABEL_117;
      }
      if (!strcmp(string, "CloudPairingComplete"))
      {
        v13 = _CFXPCCreateCFObjectFromXPCObject(v9);
        v90 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v13, "objectForKey:", CFSTR("kCloudPairingCompleteResponse")));
        v91 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v13, "objectForKey:", CFSTR("kCloudPairingLocalKeys")));
        *(_QWORD *)&v503 = v91;
        *(_QWORD *)&v504 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v13, "objectForKey:", CFSTR("kCloudDeviceUniqueID")));
        v92 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v13, "objectForKey:", CFSTR("kCloudPairingProtocolID")));
        v93 = qword_1009997F8;
        if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(v569[0].__r_.__value_.__l.__data_) = 138412290;
          *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v13;
          _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "MUC - Args for CloudPairingComplete: %@", (uint8_t *)v569, 0xCu);
        }
        v94 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing generateCloudPairingIDWithResponse:localKeys:from:forProtocolID:](self, "generateCloudPairingIDWithResponse:localKeys:from:forProtocolID:", v90, v91, (_QWORD)v504, v92));
        v95 = qword_1009997F8;
        v96 = (void *)v90;
        if (v94)
        {
          if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(v569[0].__r_.__value_.__l.__data_) = 138412290;
            *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v94;
            _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "Got pairingID: %@", (uint8_t *)v569, 0xCu);
          }
          v585 = CFSTR("kCloudPairingID");
          v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "UUIDString"));
          v586 = v97;
          v98 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v586, &v585, 1));
          -[CloudPairing cloudpairdReplyMsg:args:](self, "cloudpairdReplyMsg:args:", v4, v98);

        }
        else
        {
          if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_ERROR))
            sub_1006FC4E8();
          -[CloudPairing cloudpairdReplyMsg:args:](self, "cloudpairdReplyMsg:args:", v4, &__NSDictionary0__struct);
        }

        goto LABEL_117;
      }
      if (!strcmp(string, "UnpairCloudDevice"))
      {
        v99 = qword_1009997F8;
        if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_INFO))
        {
          LOWORD(v569[0].__r_.__value_.__l.__data_) = 0;
          _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_INFO, "Process UnpairCloudDevice", (uint8_t *)v569, 2u);
        }
        v100 = (void *)_CFXPCCreateCFObjectFromXPCObject(v9);
        v569[0].__r_.__value_.__r.__words[0] = 0;
        v569[0].__r_.__value_.__l.__size_ = (std::string::size_type)v569;
        v569[0].__r_.__value_.__r.__words[2] = 0x2020000000;
        v569[1].__r_.__value_.__s.__data_[0] = 0;
        v101 = sub_1000419F4();
        v554[0] = _NSConcreteStackBlock;
        v554[1] = 3221225472;
        v554[2] = sub_1004F10B4;
        v554[3] = &unk_100934100;
        v556 = v569;
        v554[4] = self;
        v13 = v100;
        v555 = v13;
        sub_100475D40(v101, v554);
        v583 = CFSTR("kSuccess");
        v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(v569[0].__r_.__value_.__l.__size_ + 24)));
        v584 = v102;
        v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v584, &v583, 1));
        -[CloudPairing cloudpairdReplyMsg:args:](self, "cloudpairdReplyMsg:args:", v4, v103);

        v104 = qword_1009997F8;
        if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_INFO))
        {
          LOWORD(v576[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_INFO, "Replying UnpairCloudDevice", (uint8_t *)v576, 2u);
        }

        _Block_object_dispose(v569, 8);
        goto LABEL_117;
      }
      if (!strcmp(string, "FetchPublicAddress"))
      {
        v105 = qword_1009997F8;
        if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_INFO))
        {
          LOWORD(v569[0].__r_.__value_.__l.__data_) = 0;
          _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_INFO, "Process FetchPublicAddress", (uint8_t *)v569, 2u);
        }
        v106 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing publicAddress](self, "publicAddress"));
        v107 = v106 == 0;

        if (v107)
        {
          -[CloudPairing cloudpairdReplyMsg:args:](self, "cloudpairdReplyMsg:args:", v4, &__NSDictionary0__struct);
        }
        else
        {
          v581 = CFSTR("kPublicAddress");
          v108 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing publicAddress](self, "publicAddress"));
          v582 = v108;
          v109 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v582, &v581, 1));
          -[CloudPairing cloudpairdReplyMsg:args:](self, "cloudpairdReplyMsg:args:", v4, v109);

        }
        v13 = (id)qword_1009997F8;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v123 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing publicAddress](self, "publicAddress"));
          LODWORD(v569[0].__r_.__value_.__l.__data_) = 138412290;
          *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v123;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Replying FetchPublicAddress: %@", (uint8_t *)v569, 0xCu);

        }
        goto LABEL_117;
      }
      if (strcmp(string, "RemoveCloudPairedDevice"))
      {
        if (!strcmp(string, "RemoveStaleLEPairedDevice"))
        {
          v13 = _CFXPCCreateCFObjectFromXPCMessage(v9);
          v117 = qword_1009997F8;
          if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(v569[0].__r_.__value_.__l.__data_) = 138412290;
            *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v13;
            _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_DEFAULT, "MUC - Process RemoveCloudPairedDevice: %@", (uint8_t *)v569, 0xCu);
          }
          v118 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v13, "objectForKey:", CFSTR("kCloudDeviceID")));
          if (v118 && (v119 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v118, v119) & 1) != 0))
          {
            v120 = qword_1009997F8;
            if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(v569[0].__r_.__value_.__l.__data_) = 138412290;
              *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v118;
              _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_DEFAULT, "MUC - Removing Stale CloudPairedDevice: %@", (uint8_t *)v569, 0xCu);
            }
            v121 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v118);
            if (v121)
            {
              v122 = sub_1000419F4();
              v550[0] = _NSConcreteStackBlock;
              v550[1] = 3221225472;
              v550[2] = sub_1004F118C;
              v550[3] = &unk_1009172A0;
              v551 = v121;
              sub_100041A34(v122, v550);

            }
            else if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_ERROR))
            {
              sub_1006FC574();
            }

          }
          else if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_ERROR))
          {
            sub_1006FC514();
          }

          goto LABEL_117;
        }
        if (!strcmp(string, "checkIn"))
        {
          v138 = qword_1009997F8;
          if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_INFO))
          {
            LOWORD(v569[0].__r_.__value_.__l.__data_) = 0;
            _os_log_impl((void *)&_mh_execute_header, v138, OS_LOG_TYPE_INFO, "Process checkIn", (uint8_t *)v569, 2u);
          }
          v13 = _CFXPCCreateCFObjectFromXPCObject(v9);
          v139 = qword_1009997F8;
          if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_INFO))
          {
            LODWORD(v569[0].__r_.__value_.__l.__data_) = 138412290;
            *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v13;
            _os_log_impl((void *)&_mh_execute_header, v139, OS_LOG_TYPE_INFO, "Process checkIn: %@", (uint8_t *)v569, 0xCu);
          }
          v140 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v13, "objectForKey:", CFSTR("kCheckInVersion")));
          v141 = v140;
          if (v140)
          {
            if ((objc_msgSend(v140, "isEqualToNumber:", &off_1009607F0) & 1) == 0)
            {
              v142 = qword_1009997F8;
              if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_FAULT))
                sub_1006FC5D4((uint64_t)v141, v142);
            }
            v143 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v13, "objectForKey:", CFSTR("kIDSLocalDeviceUniqueID")));
            v144 = objc_opt_class(NSString);
            if ((objc_opt_isKindOfClass(v143, v144) & 1) != 0)
              *(_QWORD *)&v504 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v13, "objectForKey:", CFSTR("kIDSLocalDeviceUniqueID")));
            else
              *(_QWORD *)&v504 = 0;

            *(_QWORD *)&v503 = objc_claimAutoreleasedReturnValue(-[CloudPairing getPairedDeviceForIDSIdentifier:](self, "getPairedDeviceForIDSIdentifier:", (_QWORD)v504));
            v145 = qword_1009997F8;
            if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(v569[0].__r_.__value_.__l.__data_) = 138412546;
              *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words + 4) = v503;
              WORD2(v569[0].__r_.__value_.__r.__words[1]) = 2112;
              *(std::string::size_type *)((char *)&v569[0].__r_.__value_.__r.__words[1] + 6) = v504;
              _os_log_impl((void *)&_mh_execute_header, v145, OS_LOG_TYPE_DEFAULT, "MUC - sending BTUUID-IDS device mapping %@ for local IDS %@", (uint8_t *)v569, 0x16u);
            }
            v146 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
            v147 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing publicAddress](self, "publicAddress"));
            v148 = v147 == 0;

            if (!v148)
            {
              v149 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing publicAddress](self, "publicAddress"));
              objc_msgSend(v146, "setObject:forKey:", v149, CFSTR("kPublicAddress"));

            }
            v150 = (id)qword_1009997F8;
            if (os_log_type_enabled(v150, OS_LOG_TYPE_INFO))
            {
              v151 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing publicAddress](self, "publicAddress"));
              LODWORD(v569[0].__r_.__value_.__l.__data_) = 138412290;
              *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v151;
              _os_log_impl((void *)&_mh_execute_header, v150, OS_LOG_TYPE_INFO, "Check in replying with Public Address: %@", (uint8_t *)v569, 0xCu);

            }
            objc_msgSend(v146, "setObject:forKey:", (_QWORD)v503, CFSTR("kCachedLEDevices"));
            objc_msgSend(v146, "setObject:forKey:", &off_1009607F0, CFSTR("kCheckInVersion"));
            -[CloudPairing cloudpairdReplyMsg:args:](self, "cloudpairdReplyMsg:args:", v4, v146);

          }
          goto LABEL_117;
        }
        if (!strcmp(string, "AllDevicesRemovedWithRecords") || !strcmp(string, "DevicesRemovedWithRecords"))
        {
          v13 = _CFXPCCreateCFObjectFromXPCMessage(v9);
          v125 = qword_100999870;
          if (os_log_type_enabled((os_log_t)qword_100999870, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v569[0].__r_.__value_.__l.__data_) = 0;
            _os_log_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_DEFAULT, "Devices majestic info removed", (uint8_t *)v569, 2u);
          }
          if (sub_100350078() && v13)
          {
            *(_QWORD *)&v504 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("devices")));
            v126 = objc_opt_class(NSData);
            if ((objc_opt_isKindOfClass(v504, v126) & 1) != 0)
            {
              v580[0] = objc_opt_class(NSArray);
              v580[1] = objc_opt_class(NSString);
              v580[2] = objc_opt_class(BTCloudDevice);
              v127 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v580, 3));
              v128 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v127));
              *(_QWORD *)&v503 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v128, (_QWORD)v504, 0));

              if ((_QWORD)v503)
              {
                v129 = objc_opt_class(NSArray);
                if ((objc_opt_isKindOfClass(v503, v129) & 1) != 0)
                {
                  v548 = 0u;
                  v549 = 0u;
                  v546 = 0u;
                  v547 = 0u;
                  v130 = (id)v503;
                  v131 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v546, v579, 16);
                  if (v131)
                  {
                    v132 = *(_QWORD *)v547;
                    do
                    {
                      for (i = 0; i != v131; i = (char *)i + 1)
                      {
                        if (*(_QWORD *)v547 != v132)
                          objc_enumerationMutation(v130);
                        v134 = *(void **)(*((_QWORD *)&v546 + 1) + 8 * (_QWORD)i);
                        v135 = objc_opt_class(BTCloudDevice);
                        if ((objc_opt_isKindOfClass(v134, v135) & 1) != 0)
                        {
                          v136 = sub_100350078();
                          v137 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "bluetoothAddress")));
                          sub_100091AE8(v544, (char *)objc_msgSend(v137, "UTF8String"));
                          (*(void (**)(uint64_t, void **))(*(_QWORD *)v136 + 184))(v136, v544);
                          if (v545 < 0)
                            operator delete(v544[0]);

                        }
                      }
                      v131 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v546, v579, 16);
                    }
                    while (v131);
                  }

                }
              }

            }
          }
          goto LABEL_117;
        }
        if (strcmp(string, "DevicesUpdatedWithRecords"))
        {
          if (!strcmp(string, "AllDeviceSupportInformationRecordsRemoved")
            || !strcmp(string, "DeviceSupportInformationRecordsRemoved"))
          {
            v13 = _CFXPCCreateCFObjectFromXPCMessage(v9);
            v152 = qword_100999870;
            if (os_log_type_enabled((os_log_t)qword_100999870, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v569[0].__r_.__value_.__l.__data_) = 0;
              _os_log_impl((void *)&_mh_execute_header, v152, OS_LOG_TYPE_DEFAULT, "Devices support info removed", (uint8_t *)v569, 2u);
            }
            if (sub_100350078() && v13)
            {
              *(_QWORD *)&v503 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("records")));
              v153 = objc_opt_class(NSData);
              if ((objc_opt_isKindOfClass(v503, v153) & 1) != 0)
              {
                v574[0] = objc_opt_class(NSArray);
                v574[1] = objc_opt_class(NSString);
                v574[2] = objc_opt_class(BTCloudDeviceSupportInformation);
                v154 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v574, 3));
                v155 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v154));
                *(_QWORD *)&v502 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v155, (_QWORD)v503, 0));

                if ((_QWORD)v502)
                {
                  v156 = objc_opt_class(NSArray);
                  if ((objc_opt_isKindOfClass(v502, v156) & 1) != 0)
                  {
                    v534 = 0u;
                    v535 = 0u;
                    v532 = 0u;
                    v533 = 0u;
                    v157 = (id)v502;
                    v158 = objc_msgSend(v157, "countByEnumeratingWithState:objects:count:", &v532, v573, 16);
                    if (v158)
                    {
                      v160 = *(_QWORD *)v533;
                      *(_QWORD *)&v159 = 138412290;
                      v504 = v159;
                      do
                      {
                        for (j = 0; j != v158; j = (char *)j + 1)
                        {
                          if (*(_QWORD *)v533 != v160)
                            objc_enumerationMutation(v157);
                          v162 = *(_QWORD *)(*((_QWORD *)&v532 + 1) + 8 * (_QWORD)j);
                          v163 = objc_opt_class(BTCloudDeviceSupportInformation);
                          if ((objc_opt_isKindOfClass(v162, v163) & 1) != 0)
                          {
                            v164 = qword_100999870;
                            if (os_log_type_enabled((os_log_t)qword_100999870, OS_LOG_TYPE_DEFAULT))
                            {
                              LODWORD(v569[0].__r_.__value_.__l.__data_) = v504;
                              *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words + 4) = v162;
                              _os_log_impl((void *)&_mh_execute_header, v164, OS_LOG_TYPE_DEFAULT, "Device Support Info to be removed: %@", (uint8_t *)v569, 0xCu);
                            }
                          }
                        }
                        v158 = objc_msgSend(v157, "countByEnumeratingWithState:objects:count:", &v532, v573, 16);
                      }
                      while (v158);
                    }

                  }
                }

              }
            }
            goto LABEL_117;
          }
          if (strcmp(string, "DeviceSupportInformationRecordsUpdated"))
          {
            if (strcmp(string, "MagicPairingRecordsRemoved"))
            {
              if (strcmp(string, "MagicPairingRecordsUpdated"))
              {
                if (!strcmp(string, "ManateeIdentityLost"))
                {
                  v470 = qword_100999870;
                  if (os_log_type_enabled((os_log_t)qword_100999870, OS_LOG_TYPE_DEFAULT))
                  {
                    LOWORD(v569[0].__r_.__value_.__l.__data_) = 0;
                    _os_log_impl((void *)&_mh_execute_header, v470, OS_LOG_TYPE_DEFAULT, "ManateeIdentityLost in cloudkit. Push local data again to resync.", (uint8_t *)v569, 2u);
                  }
                  if (sub_100350078())
                  {
                    v471 = sub_100350078();
                    (*(void (**)(uint64_t))(*(_QWORD *)v471 + 192))(v471);
                  }
                  goto LABEL_118;
                }
                if (!strcmp(string, "OnlineStatusChanged"))
                {
                  v472 = xpc_dictionary_get_BOOL(v9, "kOnlineStatus");
                  if (sub_100350078())
                  {
                    v473 = qword_100999870;
                    if (os_log_type_enabled((os_log_t)qword_100999870, OS_LOG_TYPE_DEFAULT))
                    {
                      v474 = "no";
                      if (v472)
                        v474 = "yes";
                      LODWORD(v569[0].__r_.__value_.__l.__data_) = 136315138;
                      *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v474;
                      _os_log_impl((void *)&_mh_execute_header, v473, OS_LOG_TYPE_DEFAULT, "Network changed to %s. Push local data if any to cloud.", (uint8_t *)v569, 0xCu);
                    }
                    v475 = sub_100350078();
                    (*(void (**)(uint64_t, _BOOL8))(*(_QWORD *)v475 + 72))(v475, v472);
                  }
                  goto LABEL_118;
                }
                if (strcmp(string, "kBTAccessHeadTrackUpdate"))
                {
LABEL_118:

                  goto LABEL_119;
                }
                v13 = _CFXPCCreateCFObjectFromXPCMessage(v9);
                v14 = qword_1009997F8;
                if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
                {
                  LOWORD(v569[0].__r_.__value_.__l.__data_) = 0;
                  _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Received kBTAccessHeadTrackUpdate for call", (uint8_t *)v569, 2u);
                }
                v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v13, "objectForKey:", CFSTR("kAccessHeadTracking")));
                -[CloudPairing setAccessibilityHeadTrackingEnabled:](self, "setAccessibilityHeadTrackingEnabled:", objc_msgSend(v15, "BOOLValue"));

                v16 = sub_100038E50();
                (*(void (**)(uint64_t))(*(_QWORD *)v16 + 232))(v16);
                goto LABEL_117;
              }
              v13 = _CFXPCCreateCFObjectFromXPCMessage(v9);
              v266 = (id)qword_100999870;
              if (os_log_type_enabled(v266, OS_LOG_TYPE_DEFAULT))
              {
                v267 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSObject debugDescription](v13, "debugDescription")));
                v268 = objc_msgSend(v267, "UTF8String");
                LODWORD(v569[0].__r_.__value_.__l.__data_) = 136446210;
                *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v268;
                _os_log_impl((void *)&_mh_execute_header, v266, OS_LOG_TYPE_DEFAULT, "Devices magic info updated from cloudkit = %{public}s", (uint8_t *)v569, 0xCu);

              }
              if (qword_100977A68 != -1)
                dispatch_once(&qword_100977A68, &stru_1009342B0);
              if (!sub_10045D35C() || !sub_100350078())
                goto LABEL_117;
              v269 = -[CloudPairing iCloudSignedIn](self, "iCloudSignedIn");
              v270 = v13 ? v269 : 0;
              if (v270 != 1)
                goto LABEL_117;
              v490 = (id)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("records")));
              v271 = objc_opt_class(NSData);
              if ((objc_opt_isKindOfClass(v490, v271) & 1) != 0)
              {
                v566[0] = objc_opt_class(NSArray);
                v566[1] = objc_opt_class(NSString);
                v566[2] = objc_opt_class(BTMagicPairingSettings);
                v272 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v566, 3));
                v273 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v272));
                v486 = (id)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v273, v490, 0));

                if (v486)
                {
                  v274 = objc_opt_class(NSArray);
                  if ((objc_opt_isKindOfClass(v486, v274) & 1) != 0)
                  {
                    v520 = 0u;
                    v518 = 0u;
                    v519 = 0u;
                    v517 = 0u;
                    *(_QWORD *)&v499 = v486;
                    v501 = (std::string *)objc_msgSend((id)v499, "countByEnumeratingWithState:objects:count:", &v517, v565, 16);
                    if (!v501)
                      goto LABEL_755;
                    *(_QWORD *)&v496 = v514;
                    *(_QWORD *)&v500 = *(_QWORD *)v518;
                    *(_QWORD *)&v275 = 138412290;
                    v498 = v275;
                    *(_QWORD *)&v275 = 67110146;
                    v495 = v275;
                    *(_QWORD *)&v275 = 67109890;
                    v493 = v275;
                    *(_QWORD *)&v275 = 136315138;
                    v489 = v275;
                    *(_QWORD *)&v275 = 136446210;
                    v484 = v275;
                    *(_QWORD *)&v275 = 68158466;
                    v478 = v275;
                    *(_QWORD *)&v275 = 68158722;
                    v477 = v275;
                    *(_QWORD *)&v275 = 67109120;
                    v481 = v275;
                    *(_QWORD *)&v275 = 136446722;
                    v492 = v275;
                    *(_QWORD *)&v275 = 136446466;
                    v479 = v275;
                    *(_QWORD *)&v275 = 67109376;
                    v476 = v275;
                    *(_QWORD *)&v275 = 136315394;
                    v491 = v275;
                    *(_QWORD *)&v275 = 136315650;
                    v488 = v275;
                    *(_QWORD *)&v275 = 136446467;
                    v494 = v275;
                    while (1)
                    {
                      *(_QWORD *)&v503 = 0;
                      do
                      {
                        if (*(_QWORD *)v518 != (_QWORD)v500)
                          objc_enumerationMutation((id)v499);
                        *(_QWORD *)&v504 = *(_QWORD *)(*((_QWORD *)&v517 + 1) + 8 * v503);
                        v276 = objc_opt_class(BTMagicPairingSettings);
                        if ((objc_opt_isKindOfClass(v504, v276) & 1) != 0)
                        {
                          v277 = (id)qword_100999870;
                          if (os_log_type_enabled(v277, OS_LOG_TYPE_DEFAULT))
                          {
                            LODWORD(v569[0].__r_.__value_.__l.__data_) = v498;
                            *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words + 4) = v504;
                            _os_log_impl((void *)&_mh_execute_header, v277, OS_LOG_TYPE_DEFAULT, "Cloud: Device magic pairing records to be updated: %@", (uint8_t *)v569, 0xCu);
                          }

                          v516 = 0;
                          v515 = 0;
                          memset(v576, 0, sizeof(v576));
                          v278 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "bluetoothAddress")));
                          sub_100091AE8(v576, (char *)objc_msgSend(v278, "UTF8String"));

                          if (SHIBYTE(v576[2]) >= 0)
                            v279 = (unsigned __int8 *)v576;
                          else
                            v279 = (unsigned __int8 *)v576[0];
                          if (sub_10006D80C((uint64_t)&v515, v279))
                          {
                            if ((_BYTE)v515)
                            {
LABEL_423:
                              if (qword_1009778E8 != -1)
                                dispatch_once(&qword_1009778E8, &stru_100934290);
                              *(_QWORD *)&v502 = sub_1004704A8((uint64_t)off_1009778E0, (uint64_t)&v515, 1);
                              v512 = 1;
                              v511 = 0;
                              v510 = 0;
                              sub_100444BF0(v502, &v510, &v511, (_DWORD *)&v510 + 1, &v512);
                              v280 = (id)qword_100999870;
                              if (os_log_type_enabled(v280, OS_LOG_TYPE_DEFAULT))
                              {
                                v281 = v511;
                                v282 = HIDWORD(v510);
                                v283 = v510;
                                v284 = v512;
                                sub_10043E5F8(v502, &v575);
                                v285 = &v575;
                                if ((v575.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                                  v285 = (std::string *)v575.__r_.__value_.__r.__words[0];
                                v569[0].__r_.__value_.__r.__words[0] = __PAIR64__(v281, v495);
                                LOWORD(v569[0].__r_.__value_.__r.__words[1]) = 1024;
                                *(_DWORD *)((char *)&v569[0].__r_.__value_.__r.__words[1] + 2) = v282;
                                HIWORD(v569[0].__r_.__value_.__r.__words[1]) = 1024;
                                LODWORD(v569[0].__r_.__value_.__r.__words[2]) = v283;
                                WORD2(v569[0].__r_.__value_.__r.__words[2]) = 1024;
                                *(_DWORD *)((char *)&v569[0].__r_.__value_.__r.__words[2] + 6) = v284;
                                *(_WORD *)&v569[1].__r_.__value_.__s.__data_[2] = 2082;
                                *(std::string::size_type *)((char *)v569[1].__r_.__value_.__r.__words + 4) = (std::string::size_type)v285;
                                _os_log_impl((void *)&_mh_execute_header, v280, OS_LOG_TYPE_DEFAULT, "[MP] Local Device ID; vid: %x, pid: %x, vidSrc: %d, version: %d for device: %{public}s",
                                  (uint8_t *)v569,
                                  0x24u);
                                if (SHIBYTE(v575.__r_.__value_.__r.__words[2]) < 0)
                                  operator delete(v575.__r_.__value_.__l.__data_);
                              }

                              v286 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "vendorID"));
                              v287 = objc_msgSend(v286, "integerValue");

                              v288 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "productID"));
                              v289 = objc_msgSend(v288, "integerValue");

                              if (v287 && (_DWORD)v289)
                              {
                                if (v510 <= 1)
                                  v290 = 1;
                                else
                                  v290 = v510;
                                v291 = (id)qword_100999870;
                                if (os_log_type_enabled(v291, OS_LOG_TYPE_DEFAULT))
                                {
                                  sub_10043E5F8(v502, &v575);
                                  v292 = &v575;
                                  if ((v575.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                                    v292 = (std::string *)v575.__r_.__value_.__r.__words[0];
                                  v569[0].__r_.__value_.__r.__words[0] = __PAIR64__(v287, v493);
                                  LOWORD(v569[0].__r_.__value_.__r.__words[1]) = 1024;
                                  *(_DWORD *)((char *)&v569[0].__r_.__value_.__r.__words[1] + 2) = (_DWORD)v289;
                                  HIWORD(v569[0].__r_.__value_.__r.__words[1]) = 1024;
                                  LODWORD(v569[0].__r_.__value_.__r.__words[2]) = v290;
                                  WORD2(v569[0].__r_.__value_.__r.__words[2]) = 2082;
                                  *(std::string::size_type *)((char *)&v569[0].__r_.__value_.__r.__words[2] + 6) = (std::string::size_type)v292;
                                  _os_log_impl((void *)&_mh_execute_header, v291, OS_LOG_TYPE_DEFAULT, "[MP] Updating Device ID from cloud; vid: %x, cloud pid: %x, vidSrc: %x for device: %{public}s",
                                    (uint8_t *)v569,
                                    0x1Eu);
                                  if (SHIBYTE(v575.__r_.__value_.__r.__words[2]) < 0)
                                    operator delete(v575.__r_.__value_.__l.__data_);
                                }

                                sub_100445BAC(v502, v290, v287, (int)v289, v512);
                                sub_1004468B0(v502);
                              }
                              v293 = (void *)objc_claimAutoreleasedReturnValue(+[CBProductInfo productInfoWithProductID:](CBProductInfo, "productInfoWithProductID:", v289, (_QWORD)v476, *((_QWORD *)&v476 + 1)));
                              v294 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v293, "productName"));

                              if (v294
                                && (objc_msgSend(v294, "isEqualToString:", CFSTR("Unknown")) & 1) == 0
                                && objc_msgSend(v294, "length"))
                              {
                                sub_10043F6EC(v502, (uint64_t)v569);
                                size = HIBYTE(v569[0].__r_.__value_.__r.__words[2]);
                                v296 = HIBYTE(v569[0].__r_.__value_.__r.__words[2]);
                                if ((v569[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                                  size = v569[0].__r_.__value_.__l.__size_;
                                if (size)
                                {
                                  sub_10043F6EC(v502, (uint64_t)&v575);
                                  v297 = std::string::compare(&v575, (const std::string::value_type *)objc_msgSend(objc_retainAutorelease(v294), "UTF8String")) != 0;
                                  if (SHIBYTE(v575.__r_.__value_.__r.__words[2]) < 0)
                                    operator delete(v575.__r_.__value_.__l.__data_);
                                  v296 = HIBYTE(v569[0].__r_.__value_.__r.__words[2]);
                                }
                                else
                                {
                                  v297 = 1;
                                }
                                if (v296 < 0)
                                  operator delete(v569[0].__r_.__value_.__l.__data_);
                                if (v297)
                                {
                                  sub_100091AE8(v569, (char *)objc_msgSend(v294, "utf8ValueSafe"));
                                  *(_QWORD *)&v564 = 0;
                                  *(_OWORD *)&v575.__r_.__value_.__l.__data_ = 0uLL;
                                  sub_10004AD30((uint64_t)&v564);
                                  v575.__r_.__value_.__r.__words[0] = (int)v564;
                                  v575.__r_.__value_.__l.__size_ = SWORD2(v564);
                                  sub_10044054C(v502, (uint64_t)v569, &v575);
                                  if (SHIBYTE(v569[0].__r_.__value_.__r.__words[2]) < 0)
                                    operator delete(v569[0].__r_.__value_.__l.__data_);
                                  v300 = (id)qword_100999870;
                                  if (os_log_type_enabled(v300, OS_LOG_TYPE_DEFAULT))
                                  {
                                    sub_10043E5F8(v502, v569);
                                    v301 = v569;
                                    if ((v569[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                                      v301 = (std::string *)v569[0].__r_.__value_.__r.__words[0];
                                    LODWORD(v575.__r_.__value_.__l.__data_) = v484;
                                    *(std::string::size_type *)((char *)v575.__r_.__value_.__r.__words + 4) = (std::string::size_type)v301;
                                    _os_log_impl((void *)&_mh_execute_header, v300, OS_LOG_TYPE_DEFAULT, "Cloud: Magic Settings updated productname %{public}s", (uint8_t *)&v575, 0xCu);
                                    if (SHIBYTE(v569[0].__r_.__value_.__r.__words[2]) < 0)
                                      operator delete(v569[0].__r_.__value_.__l.__data_);
                                  }

                                }
                              }

                              v302 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "name"));
                              v303 = objc_msgSend(v302, "length") == 0;

                              if (!v303)
                              {
                                v304 = (id)qword_100999870;
                                if (os_log_type_enabled(v304, OS_LOG_TYPE_DEFAULT))
                                {
                                  sub_10043E5F8(v502, v569);
                                  v305 = (v569[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
                                       ? v569
                                       : (std::string *)v569[0].__r_.__value_.__r.__words[0];
                                  v306 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "name")));
                                  v307 = objc_msgSend(v306, "UTF8String");
                                  LODWORD(v575.__r_.__value_.__l.__data_) = v494;
                                  *(std::string::size_type *)((char *)v575.__r_.__value_.__r.__words + 4) = (std::string::size_type)v305;
                                  WORD2(v575.__r_.__value_.__r.__words[1]) = 2081;
                                  *(std::string::size_type *)((char *)&v575.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v307;
                                  _os_log_impl((void *)&_mh_execute_header, v304, OS_LOG_TYPE_DEFAULT, "Cloud: Magic Settings updating %{public}s username to -> %{private}s", (uint8_t *)&v575, 0x16u);

                                  if (SHIBYTE(v569[0].__r_.__value_.__r.__words[2]) < 0)
                                    operator delete(v569[0].__r_.__value_.__l.__data_);
                                }

                                v308 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "name"));
                                sub_100091AE8(v569, (char *)objc_msgSend(v308, "utf8ValueSafe"));
                                sub_100440D9C(v502, (uint64_t)v569, 0);
                                if (SHIBYTE(v569[0].__r_.__value_.__r.__words[2]) < 0)
                                  operator delete(v569[0].__r_.__value_.__l.__data_);

                                v309 = sub_100350078();
                                v310 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "bluetoothAddress")));
                                sub_100091AE8(v508, (char *)objc_msgSend(v310, "UTF8String"));
                                v311 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "name"));
                                sub_100091AE8(v506, (char *)objc_msgSend(v311, "utf8ValueSafe"));
                                (*(void (**)(uint64_t, void **, void **))(*(_QWORD *)v309 + 176))(v309, v508, v506);
                                if (v507 < 0)
                                  operator delete(v506[0]);

                                if (v509 < 0)
                                  operator delete(v508[0]);

                              }
                              sub_10043F6EC(v502, (uint64_t)v569);
                              if (SHIBYTE(v569[0].__r_.__value_.__r.__words[2]) < 0)
                              {
                                v312 = v569[0].__r_.__value_.__l.__size_;
                                operator delete(v569[0].__r_.__value_.__l.__data_);
                                if (!v312)
                                  goto LABEL_486;
                              }
                              else if (!*((_BYTE *)&v569[0].__r_.__value_.__s + 23))
                              {
LABEL_486:
                                v313 = (id)qword_100999870;
                                if (os_log_type_enabled(v313, OS_LOG_TYPE_DEFAULT))
                                {
                                  sub_10043E5F8(v502, v569);
                                  v314 = v569;
                                  if ((v569[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                                    v314 = (std::string *)v569[0].__r_.__value_.__r.__words[0];
                                  LODWORD(v575.__r_.__value_.__l.__data_) = v489;
                                  *(std::string::size_type *)((char *)v575.__r_.__value_.__r.__words + 4) = (std::string::size_type)v314;
                                  _os_log_impl((void *)&_mh_execute_header, v313, OS_LOG_TYPE_DEFAULT, "Cloud: Magic Settings No Name for device: %s", (uint8_t *)&v575, 0xCu);
                                  if (SHIBYTE(v569[0].__r_.__value_.__r.__words[2]) < 0)
                                    operator delete(v569[0].__r_.__value_.__l.__data_);
                                }

                                v315 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing cloudClient](self, "cloudClient"));
                                v316 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "bluetoothAddress"));
                                objc_msgSend(v315, "deviceRecord:completion:", v316, &stru_100934120);

                              }
                              v317 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "deviceIDFeatureBitsV1"));
                              v318 = objc_msgSend(v317, "length") == 0;

                              if (!v318)
                              {
                                LODWORD(v575.__r_.__value_.__l.__data_) = 0;
                                v319 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "deviceIDFeatureBitsV1")));
                                sub_100091AE8(v569, (char *)objc_msgSend(v319, "UTF8String"));
                                v320 = std::stoul(v569, 0, 0);
                                if (SHIBYTE(v569[0].__r_.__value_.__r.__words[2]) < 0)
                                  operator delete(v569[0].__r_.__value_.__l.__data_);

                                v321 = sub_1004466D8(v502, &v575);
                                if (LODWORD(v575.__r_.__value_.__l.__data_) != v320 || !v321)
                                {
                                  v323 = (id)qword_100999870;
                                  if (os_log_type_enabled(v323, OS_LOG_TYPE_DEFAULT))
                                  {
                                    v324 = v576;
                                    if (SHIBYTE(v576[2]) < 0)
                                      v324 = (void **)v576[0];
                                    LODWORD(v569[0].__r_.__value_.__l.__data_) = v491;
                                    *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v324;
                                    WORD2(v569[0].__r_.__value_.__r.__words[1]) = 1024;
                                    *(_DWORD *)((char *)&v569[0].__r_.__value_.__r.__words[1] + 6) = v320;
                                    _os_log_impl((void *)&_mh_execute_header, v323, OS_LOG_TYPE_DEFAULT, "Cloud: Received iCloud update for DID supported feature bits version 1, address: %s, supported feature bits 0x%x", (uint8_t *)v569, 0x12u);
                                  }

                                  sub_100445F58(v502, v320, 1);
                                }
                              }
                              v325 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "deviceIDFeatureBitsV2"));
                              v326 = objc_msgSend(v325, "length") == 0;

                              if (!v326)
                              {
                                v575.__r_.__value_.__r.__words[0] = 0;
                                v327 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "deviceIDFeatureBitsV2")));
                                sub_100091AE8(v569, (char *)objc_msgSend(v327, "UTF8String"));
                                v328 = std::stoull(v569, 0, 0);
                                if (SHIBYTE(v569[0].__r_.__value_.__r.__words[2]) < 0)
                                  operator delete(v569[0].__r_.__value_.__l.__data_);

                                if ((!sub_100446790(v502, &v575)
                                   || v575.__r_.__value_.__r.__words[0] != (HIDWORD(v328) | (v328 << 32)))
                                  && (_DWORD)v328 != -1)
                                {
                                  v329 = (id)qword_100999870;
                                  if (os_log_type_enabled(v329, OS_LOG_TYPE_DEFAULT))
                                  {
                                    v330 = v576;
                                    if (SHIBYTE(v576[2]) < 0)
                                      v330 = (void **)v576[0];
                                    LODWORD(v569[0].__r_.__value_.__l.__data_) = v488;
                                    *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v330;
                                    WORD2(v569[0].__r_.__value_.__r.__words[1]) = 1024;
                                    *(_DWORD *)((char *)&v569[0].__r_.__value_.__r.__words[1] + 6) = HIDWORD(v328);
                                    WORD1(v569[0].__r_.__value_.__r.__words[2]) = 1024;
                                    HIDWORD(v569[0].__r_.__value_.__r.__words[2]) = v328;
                                    _os_log_impl((void *)&_mh_execute_header, v329, OS_LOG_TYPE_DEFAULT, "Cloud: Apply Received iCloud update for DID extended supported feature bits version 2, address: %s, extended supported feature bits I1: 0x%x, I2: 0x%x", (uint8_t *)v569, 0x18u);
                                  }

                                  HIDWORD(v575.__r_.__value_.__r.__words[0]) |= v328;
                                  sub_100446234(v502, v575.__r_.__value_.__r.__words[0], 1);
                                }
                              }
                              v331 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "accessoryKey"));
                              if (objc_msgSend(v331, "length") == (id)16)
                              {
                                v332 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "accessoryHint"));
                                if (objc_msgSend(v332, "length") == (id)16)
                                {
                                  v333 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "encryptionKey"));
                                  if (objc_msgSend(v333, "length") == (id)16)
                                  {
                                    v334 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "irk"));
                                    if (objc_msgSend(v334, "length") == (id)16)
                                    {
                                      *(_QWORD *)&v497 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "ratchet"));
                                      if (objc_msgSend((id)v497, "length"))
                                      {
                                        v487 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "settingsMask"));
                                        if (objc_msgSend(v487, "length"))
                                        {
                                          v485 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "supportedServices"));
                                          if (objc_msgSend(v485, "length"))
                                          {
                                            v483 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "buttonModes"));
                                            if (objc_msgSend(v483, "length"))
                                            {
                                              v482 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "color"));
                                              if (objc_msgSend(v482, "length"))
                                              {
                                                v335 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "listeningServices"));
                                                v480 = objc_msgSend(v335, "length") == 0;

                                                if (!v480)
                                                {
                                                  v564 = 0uLL;
                                                  v563 = 0uLL;
                                                  v336 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "accessoryKey")));
                                                  v564 = *(_OWORD *)objc_msgSend(v336, "bytes");

                                                  v337 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "accessoryHint")));
                                                  v563 = *(_OWORD *)objc_msgSend(v337, "bytes");

                                                  v338 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "masterKey"));
                                                  if (objc_msgSend(v338, "length") == (id)16)
                                                  {
                                                    v339 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "masterHint"));
                                                    v340 = objc_msgSend(v339, "length") == (id)16;

                                                    if (v340)
                                                    {
                                                      *(_OWORD *)&v575.__r_.__value_.__l.__data_ = 0uLL;
                                                      v562 = 0uLL;
                                                      v341 = (id)qword_100999870;
                                                      if (os_log_type_enabled(v341, OS_LOG_TYPE_DEFAULT))
                                                      {
                                                        v342 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "masterKey"));
                                                        LODWORD(v569[0].__r_.__value_.__l.__data_) = v498;
                                                        *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words
                                                                                  + 4) = (std::string::size_type)v342;
                                                        _os_log_impl((void *)&_mh_execute_header, v341, OS_LOG_TYPE_DEFAULT, "Cloud: Retrieved Master Key: %@", (uint8_t *)v569, 0xCu);

                                                      }
                                                      v343 = (id)qword_100999870;
                                                      if (os_log_type_enabled(v343, OS_LOG_TYPE_DEFAULT))
                                                      {
                                                        v344 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "masterHint"));
                                                        LODWORD(v569[0].__r_.__value_.__l.__data_) = v498;
                                                        *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words
                                                                                  + 4) = (std::string::size_type)v344;
                                                        _os_log_impl((void *)&_mh_execute_header, v343, OS_LOG_TYPE_DEFAULT, "Cloud: Retrieved Master Hint: %@", (uint8_t *)v569, 0xCu);

                                                      }
                                                      v345 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "masterKey")));
                                                      *(_OWORD *)&v575.__r_.__value_.__l.__data_ = *(_OWORD *)objc_msgSend(v345, "bytes");

                                                      v346 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "masterHint")));
                                                      v562 = *(__n128 *)objc_msgSend(v346, "bytes");

                                                      v561 = 0uLL;
                                                      if (!sub_10022A6A4((uint64_t)&v562, (uint64_t)&v563, (uint64_t)&v561, 0x10uLL)&& (_DWORD)v561 == *(_DWORD *)(v502 + 128)&& WORD2(v561) == *(unsigned __int16 *)(v502 + 132))
                                                      {
                                                        v348 = (id)qword_100999870;
                                                        if (os_log_type_enabled(v348, OS_LOG_TYPE_INFO))
                                                        {
                                                          sub_10043E5F8(v502, v569);
                                                          v349 = v569;
                                                          if ((v569[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                                                            v349 = (std::string *)v569[0].__r_.__value_.__r.__words[0];
                                                          v559 = v484;
                                                          v560 = v349;
                                                          _os_log_impl((void *)&_mh_execute_header, v348, OS_LOG_TYPE_INFO, "Valid Main Account Keys from cloud magic device %{public}s", (uint8_t *)&v559, 0xCu);
                                                          if (SHIBYTE(v569[0].__r_.__value_.__r.__words[2]) < 0)
                                                            operator delete(v569[0].__r_.__value_.__l.__data_);
                                                        }

                                                        if (qword_100977A68 != -1)
                                                          dispatch_once(&qword_100977A68, &stru_1009342B0);
                                                        (*(void (**)(void *, std::string *, __n128 *))(*(_QWORD *)off_100977A60 + 56))(off_100977A60, &v575, &v562);
                                                      }
                                                    }
                                                  }
                                                  else
                                                  {

                                                  }
                                                  v350 = (id)qword_100999870;
                                                  if (os_log_type_enabled(v350, OS_LOG_TYPE_DEBUG))
                                                  {
                                                    v569[0].__r_.__value_.__r.__words[0] = v478 | 0x1000000000;
                                                    LOWORD(v569[0].__r_.__value_.__r.__words[1]) = 2096;
                                                    *(std::string::size_type *)((char *)&v569[0].__r_.__value_.__r.__words[1]
                                                                              + 2) = (std::string::size_type)&v564;
                                                    WORD1(v569[0].__r_.__value_.__r.__words[2]) = 1040;
                                                    HIDWORD(v569[0].__r_.__value_.__r.__words[2]) = 16;
                                                    LOWORD(v569[1].__r_.__value_.__l.__data_) = 2096;
                                                    *(std::string::size_type *)((char *)v569[1].__r_.__value_.__r.__words
                                                                              + 2) = (std::string::size_type)&v563;
                                                    _os_log_debug_impl((void *)&_mh_execute_header, v350, OS_LOG_TYPE_DEBUG, "Cloud keys AccKeyPtr %.16P, HintPtr %.16P", (uint8_t *)v569, 0x22u);
                                                  }

                                                  v562 = 0uLL;
                                                  v561 = 0uLL;
                                                  v351 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "ratchet")));
                                                  v352 = atol((const char *)objc_msgSend(v351, "UTF8String"));

                                                  v353 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "irk")));
                                                  v562 = *(__n128 *)objc_msgSend(v353, "bytes");

                                                  v354 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "encryptionKey")));
                                                  v561 = *(_OWORD *)objc_msgSend(v354, "bytes");

                                                  for (k = 0; k != 31; ++k)
                                                  {
                                                    v356 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "supportedServices"));
                                                    v357 = ((unint64_t)objc_msgSend(v356, "integerValue") & (1 << k)) == 0;

                                                    if (!v357)
                                                    {
                                                      v358 = (id)qword_100999870;
                                                      if (os_log_type_enabled(v358, OS_LOG_TYPE_DEFAULT))
                                                      {
                                                        v359 = v576;
                                                        if (SHIBYTE(v576[2]) < 0)
                                                          v359 = (void **)v576[0];
                                                        LODWORD(v569[0].__r_.__value_.__l.__data_) = v491;
                                                        *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words
                                                                                  + 4) = (std::string::size_type)v359;
                                                        WORD2(v569[0].__r_.__value_.__r.__words[1]) = 1024;
                                                        *(_DWORD *)((char *)&v569[0].__r_.__value_.__r.__words[1] + 6) = 1 << k;
                                                        _os_log_impl((void *)&_mh_execute_header, v358, OS_LOG_TYPE_DEFAULT, "Cloud: Magic Paired Device with address: %s, ServiceID: %d", (uint8_t *)v569, 0x12u);
                                                      }

                                                      v575.__r_.__value_.__r.__words[0] = 0;
                                                      *(_OWORD *)&v569[0].__r_.__value_.__l.__data_ = 0uLL;
                                                      sub_10004AD30((uint64_t)&v575);
                                                      v569[0].__r_.__value_.__r.__words[0] = SLODWORD(v575.__r_.__value_.__l.__data_);
                                                      v569[0].__r_.__value_.__l.__size_ = SWORD2(v575.__r_.__value_.__r.__words[0]);
                                                      sub_1004415B0(v502, 1 << k, 4, v569, 0);
                                                    }
                                                  }
                                                  v360 = (id)qword_100999870;
                                                  if (os_log_type_enabled(v360, OS_LOG_TYPE_DEBUG))
                                                  {
                                                    v569[0].__r_.__value_.__r.__words[0] = v477 | 0x1000000000;
                                                    LOWORD(v569[0].__r_.__value_.__r.__words[1]) = 2096;
                                                    *(std::string::size_type *)((char *)&v569[0].__r_.__value_.__r.__words[1]
                                                                              + 2) = (std::string::size_type)&v562;
                                                    WORD1(v569[0].__r_.__value_.__r.__words[2]) = 1040;
                                                    HIDWORD(v569[0].__r_.__value_.__r.__words[2]) = 16;
                                                    LOWORD(v569[1].__r_.__value_.__l.__data_) = 2096;
                                                    *(std::string::size_type *)((char *)v569[1].__r_.__value_.__r.__words
                                                                              + 2) = (std::string::size_type)&v561;
                                                    WORD1(v569[1].__r_.__value_.__r.__words[1]) = 1024;
                                                    HIDWORD(v569[1].__r_.__value_.__r.__words[1]) = v352;
                                                    _os_log_debug_impl((void *)&_mh_execute_header, v360, OS_LOG_TYPE_DEBUG, "Cloud IRK %.16P, EncKey %.16P, Ratchet: %d", (uint8_t *)v569, 0x28u);
                                                  }

                                                  if (qword_100977A68 != -1)
                                                    dispatch_once(&qword_100977A68, &stru_1009342B0);
                                                  v361 = sub_10045E8B4((uint64_t)off_100977A60, v502);
                                                  v362 = (id)qword_100999870;
                                                  v363 = os_log_type_enabled(v362, OS_LOG_TYPE_DEFAULT);
                                                  if (!v361)
                                                  {
                                                    if (v363)
                                                    {
                                                      v366 = v576;
                                                      if (SHIBYTE(v576[2]) < 0)
                                                        v366 = (void **)v576[0];
                                                      LODWORD(v569[0].__r_.__value_.__l.__data_) = v489;
                                                      *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words
                                                                                + 4) = (std::string::size_type)v366;
                                                      _os_log_impl((void *)&_mh_execute_header, v362, OS_LOG_TYPE_DEFAULT, "Cloud: Create new Magic Paired Device with address: %s", (uint8_t *)v569, 0xCu);
                                                    }

                                                    operator new();
                                                  }
                                                  if (v363)
                                                  {
                                                    v364 = v576;
                                                    if (SHIBYTE(v576[2]) < 0)
                                                      v364 = (void **)v576[0];
                                                    LODWORD(v569[0].__r_.__value_.__l.__data_) = v489;
                                                    *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words
                                                                              + 4) = (std::string::size_type)v364;
                                                    _os_log_impl((void *)&_mh_execute_header, v362, OS_LOG_TYPE_DEFAULT, "Cloud: Update new Magic Paired Device with address: %s", (uint8_t *)v569, 0xCu);
                                                  }

                                                  v365 = v563;
                                                  *(_OWORD *)(v361 + 5) = v564;
                                                  *(_OWORD *)(v361 + 7) = v365;
                                                  if (v352)
                                                    *((_DWORD *)v361 + 18) = v352;
                                                  sub_100462028(v361, &v562);
                                                  *(_OWORD *)(v361 + 3) = v561;
                                                  if (qword_100977A68 != -1)
                                                    dispatch_once(&qword_100977A68, &stru_1009342B0);
                                                  sub_100462DB0((uint64_t)off_100977A60, (uint64_t)v361);
                                                  v367 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "settingsMask"));
                                                  LODWORD(v487) = objc_msgSend(v367, "intValue");

                                                  v368 = (id)qword_100999870;
                                                  if (os_log_type_enabled(v368, OS_LOG_TYPE_DEFAULT))
                                                  {
                                                    LODWORD(v569[0].__r_.__value_.__l.__data_) = v481;
                                                    HIDWORD(v569[0].__r_.__value_.__r.__words[0]) = v487;
                                                    _os_log_impl((void *)&_mh_execute_header, v368, OS_LOG_TYPE_DEFAULT, "Cloud: Retrieved settings mask from cloud: %d", (uint8_t *)v569, 8u);
                                                  }

                                                  v369 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "color"));
                                                  LODWORD(v483) = objc_msgSend(v369, "intValue");

                                                  v370 = (id)qword_100999870;
                                                  if (os_log_type_enabled(v370, OS_LOG_TYPE_DEFAULT))
                                                  {
                                                    LODWORD(v569[0].__r_.__value_.__l.__data_) = v481;
                                                    HIDWORD(v569[0].__r_.__value_.__r.__words[0]) = v483;
                                                    _os_log_impl((void *)&_mh_execute_header, v370, OS_LOG_TYPE_DEFAULT, "Cloud: Retrieved color from cloud: %d", (uint8_t *)v569, 8u);
                                                  }

                                                  v371 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "listeningServices"));
                                                  *(_QWORD *)&v497 = objc_msgSend(v371, "integerValue");

                                                  v372 = (id)qword_100999870;
                                                  if (os_log_type_enabled(v372, OS_LOG_TYPE_DEFAULT))
                                                  {
                                                    LODWORD(v569[0].__r_.__value_.__l.__data_) = v481;
                                                    HIDWORD(v569[0].__r_.__value_.__r.__words[0]) = (unsigned __int16)v497;
                                                    _os_log_impl((void *)&_mh_execute_header, v372, OS_LOG_TYPE_DEFAULT, "Cloud: Retrieved listening services from cloud: %d", (uint8_t *)v569, 8u);
                                                  }

                                                  v373 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "listeningServicesV2"));
                                                  v485 = objc_msgSend(v373, "integerValue");

                                                  v374 = (id)qword_100999870;
                                                  if (os_log_type_enabled(v374, OS_LOG_TYPE_DEFAULT))
                                                  {
                                                    v569[0].__r_.__value_.__r.__words[0] = __PAIR64__(v485, v481);
                                                    _os_log_impl((void *)&_mh_execute_header, v374, OS_LOG_TYPE_DEFAULT, "Cloud: Retrieved listening services V2 from cloud: %d", (uint8_t *)v569, 8u);
                                                  }

                                                  if ((v497 & 2) != 0 && !sub_100447C64(v502))
                                                  {
                                                    v375 = (id)qword_100999870;
                                                    if (os_log_type_enabled(v375, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      v569[0].__r_.__value_.__r.__words[0] = v481 | 0x100000000;
                                                      _os_log_impl((void *)&_mh_execute_header, v375, OS_LOG_TYPE_DEFAULT, "Cloud: Retrieved GAPA from cloud: %d", (uint8_t *)v569, 8u);
                                                    }

                                                    sub_100447CA8(v502, 1, 1);
                                                  }
                                                  v376 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "buttonModes"));
                                                  v377 = objc_msgSend(v376, "intValue");

                                                  v378 = (id)qword_100999870;
                                                  if (os_log_type_enabled(v378, OS_LOG_TYPE_DEFAULT))
                                                  {
                                                    LODWORD(v569[0].__r_.__value_.__l.__data_) = v481;
                                                    HIDWORD(v569[0].__r_.__value_.__r.__words[0]) = v377;
                                                    _os_log_impl((void *)&_mh_execute_header, v378, OS_LOG_TYPE_DEFAULT, "Cloud: Retrieved button Modes from cloud: %d", (uint8_t *)v569, 8u);
                                                  }

                                                  v379 = v377 & 0xF | (v377 >> 4 << 8);
                                                  v380 = (id)qword_100999870;
                                                  if (os_log_type_enabled(v380, OS_LOG_TYPE_DEFAULT))
                                                  {
                                                    LODWORD(v569[0].__r_.__value_.__l.__data_) = v481;
                                                    v569[0].__r_.__value_.__s.__data_[4] = v377 & 0xF;
                                                    v569[0].__r_.__value_.__s.__data_[5] = v377 >> 4;
                                                    _os_log_impl((void *)&_mh_execute_header, v380, OS_LOG_TYPE_DEFAULT, "Cloud: Retrieved double tap from cloud: %d", (uint8_t *)v569, 8u);
                                                  }

                                                  if (qword_100977A88 != -1)
                                                    dispatch_once(&qword_100977A88, &stru_1009342D0);
                                                  v381 = sub_100282EAC((uint64_t)off_100977A80, v502, v377 & 0xF | ((v377 >> 4) << 8), (v487 >> 4) & 1);
                                                  v382 = v377 >> 4;
                                                  if (v379 == v381)
                                                    v383 = v377 & 0xF;
                                                  else
                                                    v383 = v381;
                                                  if (v379 == v381)
                                                    v384 = v382;
                                                  else
                                                    v384 = BYTE1(v381);
                                                  if (sub_1004459D0(v502) != v381)
                                                  {
                                                    v385 = (id)qword_100999870;
                                                    if (os_log_type_enabled(v385, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      LOWORD(v569[0].__r_.__value_.__l.__data_) = 0;
                                                      _os_log_impl((void *)&_mh_execute_header, v385, OS_LOG_TYPE_DEFAULT, "Cloud: Updating double tap settings from cloud", (uint8_t *)v569, 2u);
                                                    }

                                                    if ((v487 & 8) != 0)
                                                    {
                                                      if (qword_100977A88 != -1)
                                                        dispatch_once(&qword_100977A88, &stru_1009342D0);
                                                      sub_100285094((uint64_t)off_100977A80, v502, v384, v383, 4);
                                                    }
                                                  }
                                                  if ((v487 & 3) == 2)
                                                    v386 = 2;
                                                  else
                                                    v386 = (v487 & 3) == 1;
                                                  if (sub_10044F5D0(v502) != (_DWORD)v386)
                                                  {
                                                    if (qword_100977A88 != -1)
                                                      dispatch_once(&qword_100977A88, &stru_1009342D0);
                                                    sub_100284E30((uint64_t)off_100977A80, v502, v386, 4u);
                                                  }
                                                  if ((_BYTE)v483)
                                                  {
                                                    sub_100451298(v502, v483);
                                                    v387 = (id)qword_100999870;
                                                    if (os_log_type_enabled(v387, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      sub_10043E5F8(v502, v569);
                                                      v388 = SHIBYTE(v569[0].__r_.__value_.__r.__words[2]);
                                                      v389 = v569[0].__r_.__value_.__r.__words[0];
                                                      v390 = sub_1004512E8(v502);
                                                      LODWORD(v575.__r_.__value_.__l.__data_) = v479;
                                                      v391 = v569;
                                                      if (v388 < 0)
                                                        v391 = (std::string *)v389;
                                                      *(std::string::size_type *)((char *)v575.__r_.__value_.__r.__words
                                                                                + 4) = (std::string::size_type)v391;
                                                      WORD2(v575.__r_.__value_.__r.__words[1]) = 1024;
                                                      *(_DWORD *)((char *)&v575.__r_.__value_.__r.__words[1] + 6) = v390;
                                                      _os_log_impl((void *)&_mh_execute_header, v387, OS_LOG_TYPE_DEFAULT, "Cloud: Color info updated for device %{public}s ,color code %d", (uint8_t *)&v575, 0x12u);
                                                      if (SHIBYTE(v569[0].__r_.__value_.__r.__words[2]) < 0)
                                                        operator delete(v569[0].__r_.__value_.__l.__data_);
                                                    }

                                                  }
                                                  v392 = v487 & 4;
                                                  v393 = (id)qword_100999870;
                                                  if (os_log_type_enabled(v393, OS_LOG_TYPE_DEFAULT))
                                                  {
                                                    sub_10043E5F8(v502, &v575);
                                                    v394 = SHIBYTE(v575.__r_.__value_.__r.__words[2]);
                                                    v395 = v575.__r_.__value_.__r.__words[0];
                                                    v396 = sub_10044F614(v502);
                                                    v397 = &v575;
                                                    if (v394 < 0)
                                                      v397 = (std::string *)v395;
                                                    if ((v487 & 4) != 0)
                                                      v398 = "Enabled";
                                                    else
                                                      v398 = "Disabled";
                                                    LODWORD(v569[0].__r_.__value_.__l.__data_) = v492;
                                                    *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words
                                                                              + 4) = (std::string::size_type)v397;
                                                    WORD2(v569[0].__r_.__value_.__r.__words[1]) = 2080;
                                                    if (v396)
                                                      v399 = "Enabled";
                                                    else
                                                      v399 = "Disabled";
                                                    *(std::string::size_type *)((char *)&v569[0].__r_.__value_.__r.__words[1]
                                                                              + 6) = (std::string::size_type)v398;
                                                    HIWORD(v569[0].__r_.__value_.__r.__words[2]) = 2080;
                                                    v569[1].__r_.__value_.__r.__words[0] = (std::string::size_type)v399;
                                                    _os_log_impl((void *)&_mh_execute_header, v393, OS_LOG_TYPE_DEFAULT, "Cloud: In Ear Detection state update from cloud for device %{public}s is %s, local state %s", (uint8_t *)v569, 0x20u);
                                                    if (SHIBYTE(v575.__r_.__value_.__r.__words[2]) < 0)
                                                      operator delete(v575.__r_.__value_.__l.__data_);
                                                  }

                                                  if (sub_10044F614(v502) != v392 >> 2)
                                                  {
                                                    if (qword_100977A88 != -1)
                                                      dispatch_once(&qword_100977A88, &stru_1009342D0);
                                                    sub_100285264((uint64_t)off_100977A80, v502, v392 != 0, 4u);
                                                  }
                                                  v400 = (id)qword_100999870;
                                                  if (os_log_type_enabled(v400, OS_LOG_TYPE_DEFAULT))
                                                  {
                                                    sub_10043E5F8(v502, v569);
                                                    v401 = v569;
                                                    if ((v569[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                                                      v401 = (std::string *)v569[0].__r_.__value_.__r.__words[0];
                                                    LODWORD(v575.__r_.__value_.__l.__data_) = v479;
                                                    *(std::string::size_type *)((char *)v575.__r_.__value_.__r.__words
                                                                              + 4) = (std::string::size_type)v401;
                                                    WORD2(v575.__r_.__value_.__r.__words[1]) = 1024;
                                                    *(_DWORD *)((char *)&v575.__r_.__value_.__r.__words[1] + 6) = (unsigned __int16)v497;
                                                    _os_log_impl((void *)&_mh_execute_header, v400, OS_LOG_TYPE_DEFAULT, "Cloud: Update listening mode services for device %{public}s with service - %d", (uint8_t *)&v575, 0x12u);
                                                    if (SHIBYTE(v569[0].__r_.__value_.__r.__words[2]) < 0)
                                                      operator delete(v569[0].__r_.__value_.__l.__data_);
                                                  }

                                                  v402 = (v497 >> 10) & 7;
                                                  v403 = v402 | ((unsigned __int16)v497 >> 13 << 8);
                                                  v404 = (id)qword_100999870;
                                                  if (os_log_type_enabled(v404, OS_LOG_TYPE_DEFAULT))
                                                  {
                                                    sub_10043E5F8(v502, &v575);
                                                    v405 = SHIBYTE(v575.__r_.__value_.__r.__words[2]);
                                                    v406 = v575.__r_.__value_.__r.__words[0];
                                                    v407 = sub_10044F8A0(v502);
                                                    LODWORD(v569[0].__r_.__value_.__l.__data_) = v492;
                                                    v408 = &v575;
                                                    if (v405 < 0)
                                                      v408 = (std::string *)v406;
                                                    *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words
                                                                              + 4) = (std::string::size_type)v408;
                                                    WORD2(v569[0].__r_.__value_.__r.__words[1]) = 1024;
                                                    *(_DWORD *)((char *)&v569[0].__r_.__value_.__r.__words[1] + 6) = v407;
                                                    WORD1(v569[0].__r_.__value_.__r.__words[2]) = 1024;
                                                    HIDWORD(v569[0].__r_.__value_.__r.__words[2]) = v402 | ((unsigned __int16)v497 >> 13 << 8);
                                                    _os_log_impl((void *)&_mh_execute_header, v404, OS_LOG_TYPE_DEFAULT, "Cloud: Click Hold mode info update for device %{public}s, current value: %d, cloud value %d", (uint8_t *)v569, 0x18u);
                                                    if (SHIBYTE(v575.__r_.__value_.__r.__words[2]) < 0)
                                                      operator delete(v575.__r_.__value_.__l.__data_);
                                                  }

                                                  if ((unsigned __int16)v497 >> 13
                                                    && v402
                                                    && sub_10044F8A0(v502) != (_DWORD)v403
                                                    && (sub_100442118(v502, 38) & 1) == 0)
                                                  {
                                                    if (qword_100977A88 != -1)
                                                      dispatch_once(&qword_100977A88, &stru_1009342D0);
                                                    sub_100279E6C((uint64_t)off_100977A80, v502, 22, v403, 4u);
                                                    v409 = (id)qword_100999870;
                                                    if (os_log_type_enabled(v409, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      sub_10043E5F8(v502, v569);
                                                      v465 = SHIBYTE(v569[0].__r_.__value_.__r.__words[2]);
                                                      v466 = v569[0].__r_.__value_.__r.__words[0];
                                                      v467 = sub_10044F8A0(v502);
                                                      LODWORD(v575.__r_.__value_.__l.__data_) = v479;
                                                      v468 = v569;
                                                      if (v465 < 0)
                                                        v468 = (std::string *)v466;
                                                      *(std::string::size_type *)((char *)v575.__r_.__value_.__r.__words
                                                                                + 4) = (std::string::size_type)v468;
                                                      WORD2(v575.__r_.__value_.__r.__words[1]) = 1024;
                                                      *(_DWORD *)((char *)&v575.__r_.__value_.__r.__words[1] + 6) = v467;
                                                      _os_log_impl((void *)&_mh_execute_header, v409, OS_LOG_TYPE_DEFAULT, "Cloud: Click Hold mode info updated for device %{public}s, new mode %d", (uint8_t *)&v575, 0x12u);
                                                      if (SHIBYTE(v569[0].__r_.__value_.__r.__words[2]) < 0)
                                                        operator delete(v569[0].__r_.__value_.__l.__data_);
                                                    }
LABEL_663:

                                                  }
                                                  else if (!((unsigned __int16)v497 >> 13) || !v402)
                                                  {
                                                    v409 = &_os_log_default;
                                                    v410 = &_os_log_default;
                                                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
                                                    {
                                                      LODWORD(v569[0].__r_.__value_.__l.__data_) = v476;
                                                      HIDWORD(v569[0].__r_.__value_.__r.__words[0]) = (unsigned __int16)v497 >> 13;
                                                      LOWORD(v569[0].__r_.__value_.__r.__words[1]) = 1024;
                                                      *(_DWORD *)((char *)&v569[0].__r_.__value_.__r.__words[1] + 2) = (v497 >> 10) & 7;
                                                      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "CloudPairing: Unknown value caught for Press and Hold configs. Left: %d, Right %d", (uint8_t *)v569, 0xEu);
                                                    }
                                                    goto LABEL_663;
                                                  }
                                                  if (sub_10044FE34(v502, 176))
                                                  {
                                                    v411 = (id)qword_100999870;
                                                    if (os_log_type_enabled(v411, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      LOWORD(v569[0].__r_.__value_.__l.__data_) = 0;
                                                      _os_log_impl((void *)&_mh_execute_header, v411, OS_LOG_TYPE_DEFAULT, "Cloud: autoANC is supported", (uint8_t *)v569, 2u);
                                                    }

                                                  }
                                                  else
                                                  {
                                                    v485 = (id)((v497 >> 7) & 7);
                                                  }
                                                  v412 = (id)qword_100999870;
                                                  if (os_log_type_enabled(v412, OS_LOG_TYPE_DEFAULT))
                                                  {
                                                    sub_10043E5F8(v502, &v575);
                                                    v413 = SHIBYTE(v575.__r_.__value_.__r.__words[2]);
                                                    v414 = v575.__r_.__value_.__r.__words[0];
                                                    v415 = sub_10044F74C(v502);
                                                    LODWORD(v569[0].__r_.__value_.__l.__data_) = v492;
                                                    v416 = &v575;
                                                    if (v413 < 0)
                                                      v416 = (std::string *)v414;
                                                    *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words
                                                                              + 4) = (std::string::size_type)v416;
                                                    WORD2(v569[0].__r_.__value_.__r.__words[1]) = 1024;
                                                    *(_DWORD *)((char *)&v569[0].__r_.__value_.__r.__words[1] + 6) = v415;
                                                    WORD1(v569[0].__r_.__value_.__r.__words[2]) = 1024;
                                                    HIDWORD(v569[0].__r_.__value_.__r.__words[2]) = (_DWORD)v485;
                                                    _os_log_impl((void *)&_mh_execute_header, v412, OS_LOG_TYPE_DEFAULT, "Cloud: Listening mode config update for device %{public}s, current value: %d, cloud configs: %d", (uint8_t *)v569, 0x18u);
                                                    if (SHIBYTE(v575.__r_.__value_.__r.__words[2]) < 0)
                                                      operator delete(v575.__r_.__value_.__l.__data_);
                                                  }

                                                  if ((_DWORD)v485 && sub_10044F74C(v502) != (_DWORD)v485)
                                                  {
                                                    if (qword_100977A88 != -1)
                                                      dispatch_once(&qword_100977A88, &stru_1009342D0);
                                                    sub_100279E6C((uint64_t)off_100977A80, v502, 26, (uint64_t)v485, 4u);
                                                    v417 = (id)qword_100999870;
                                                    if (os_log_type_enabled(v417, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      sub_10043E5F8(v502, v569);
                                                      v418 = SHIBYTE(v569[0].__r_.__value_.__r.__words[2]);
                                                      v419 = v569[0].__r_.__value_.__r.__words[0];
                                                      v420 = sub_10044F74C(v502);
                                                      LODWORD(v575.__r_.__value_.__l.__data_) = v479;
                                                      v421 = v569;
                                                      if (v418 < 0)
                                                        v421 = (std::string *)v419;
                                                      *(std::string::size_type *)((char *)v575.__r_.__value_.__r.__words
                                                                                + 4) = (std::string::size_type)v421;
                                                      WORD2(v575.__r_.__value_.__r.__words[1]) = 1024;
                                                      *(_DWORD *)((char *)&v575.__r_.__value_.__r.__words[1] + 6) = v420;
                                                      _os_log_impl((void *)&_mh_execute_header, v417, OS_LOG_TYPE_DEFAULT, "Cloud: Listening mode config updated for device %{public}s, new configs %d", (uint8_t *)&v575, 0x12u);
                                                      if (SHIBYTE(v569[0].__r_.__value_.__r.__words[2]) < 0)
                                                        operator delete(v569[0].__r_.__value_.__l.__data_);
                                                    }

                                                  }
                                                  v422 = (v497 >> 2) & 3;
                                                  v423 = (id)qword_100999870;
                                                  if (os_log_type_enabled(v423, OS_LOG_TYPE_DEFAULT))
                                                  {
                                                    sub_10043E5F8(v502, &v575);
                                                    v424 = SHIBYTE(v575.__r_.__value_.__r.__words[2]);
                                                    v425 = v575.__r_.__value_.__r.__words[0];
                                                    v426 = sub_10044F96C(v502);
                                                    LODWORD(v569[0].__r_.__value_.__l.__data_) = v492;
                                                    v427 = &v575;
                                                    if (v424 < 0)
                                                      v427 = (std::string *)v425;
                                                    *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words
                                                                              + 4) = (std::string::size_type)v427;
                                                    WORD2(v569[0].__r_.__value_.__r.__words[1]) = 1024;
                                                    *(_DWORD *)((char *)&v569[0].__r_.__value_.__r.__words[1] + 6) = v426;
                                                    WORD1(v569[0].__r_.__value_.__r.__words[2]) = 1024;
                                                    HIDWORD(v569[0].__r_.__value_.__r.__words[2]) = (v497 >> 2) & 3;
                                                    _os_log_impl((void *)&_mh_execute_header, v423, OS_LOG_TYPE_DEFAULT, "Cloud: One Bud ANC mode update for device %{public}s, current value: %d, cloud value %d", (uint8_t *)v569, 0x18u);
                                                    if (SHIBYTE(v575.__r_.__value_.__r.__words[2]) < 0)
                                                      operator delete(v575.__r_.__value_.__l.__data_);
                                                  }

                                                  v428 = sub_100442118(v502, 43);
                                                  if ((_DWORD)v422)
                                                    v429 = v428;
                                                  else
                                                    v429 = 1;
                                                  if ((v429 & 1) == 0
                                                    && sub_10044F96C(v502) != (_DWORD)v422)
                                                  {
                                                    if (qword_100977A88 != -1)
                                                      dispatch_once(&qword_100977A88, &stru_1009342D0);
                                                    sub_100279E6C((uint64_t)off_100977A80, v502, 27, v422, 4u);
                                                    v430 = (id)qword_100999870;
                                                    if (os_log_type_enabled(v430, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      sub_10043E5F8(v502, v569);
                                                      v431 = SHIBYTE(v569[0].__r_.__value_.__r.__words[2]);
                                                      v432 = v569[0].__r_.__value_.__r.__words[0];
                                                      v433 = sub_10044F96C(v502);
                                                      LODWORD(v575.__r_.__value_.__l.__data_) = v479;
                                                      v434 = v569;
                                                      if (v431 < 0)
                                                        v434 = (std::string *)v432;
                                                      *(std::string::size_type *)((char *)v575.__r_.__value_.__r.__words
                                                                                + 4) = (std::string::size_type)v434;
                                                      WORD2(v575.__r_.__value_.__r.__words[1]) = 1024;
                                                      *(_DWORD *)((char *)&v575.__r_.__value_.__r.__words[1] + 6) = v433;
                                                      _os_log_impl((void *)&_mh_execute_header, v430, OS_LOG_TYPE_DEFAULT, "Cloud: One Bud ANC mode updated for device %{public}s, new mode %d", (uint8_t *)&v575, 0x12u);
                                                      if (SHIBYTE(v569[0].__r_.__value_.__r.__words[2]) < 0)
                                                        operator delete(v569[0].__r_.__value_.__l.__data_);
                                                    }

                                                  }
                                                  if (sub_100442118(v502, 32)
                                                    && !sub_10044F658(v502))
                                                  {
                                                    v435 = (id)qword_100999870;
                                                    if (os_log_type_enabled(v435, OS_LOG_TYPE_DEFAULT))
                                                    {
                                                      sub_10043E5F8(v502, &v575);
                                                      if ((v575.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                                                        v436 = &v575;
                                                      else
                                                        v436 = (std::string *)v575.__r_.__value_.__r.__words[0];
                                                      v437 = sub_100442118(v502, 32);
                                                      v438 = sub_10044F658(v502);
                                                      LODWORD(v569[0].__r_.__value_.__l.__data_) = v492;
                                                      v439 = "No";
                                                      if (v437)
                                                        v439 = "Yes";
                                                      *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words
                                                                                + 4) = (std::string::size_type)v436;
                                                      WORD2(v569[0].__r_.__value_.__r.__words[1]) = 2080;
                                                      *(std::string::size_type *)((char *)&v569[0].__r_.__value_.__r.__words[1]
                                                                                + 6) = (std::string::size_type)v439;
                                                      HIWORD(v569[0].__r_.__value_.__r.__words[2]) = 1024;
                                                      LODWORD(v569[1].__r_.__value_.__l.__data_) = v438;
                                                      _os_log_impl((void *)&_mh_execute_header, v435, OS_LOG_TYPE_DEFAULT, "Cloud: %{public}s Initialize setSmartRouteMode via cloud Tipi Support = %s current SR Mode =%d", (uint8_t *)v569, 0x1Cu);
                                                      if (SHIBYTE(v575.__r_.__value_.__r.__words[2]) < 0)
                                                        operator delete(v575.__r_.__value_.__l.__data_);
                                                    }

                                                    sub_10044D524(v502, 1);
                                                  }
                                                  v440 = (id)qword_100999870;
                                                  if (os_log_type_enabled(v440, OS_LOG_TYPE_DEFAULT))
                                                  {
                                                    sub_10043E5F8(v502, &v575);
                                                    v441 = SHIBYTE(v575.__r_.__value_.__r.__words[2]);
                                                    v442 = v575.__r_.__value_.__r.__words[0];
                                                    v443 = sub_100442118(v502, 32);
                                                    LODWORD(v569[0].__r_.__value_.__l.__data_) = v492;
                                                    v444 = &v575;
                                                    if (v441 < 0)
                                                      v444 = (std::string *)v442;
                                                    *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words
                                                                              + 4) = (std::string::size_type)v444;
                                                    WORD2(v569[0].__r_.__value_.__r.__words[1]) = 1024;
                                                    *(_DWORD *)((char *)&v569[0].__r_.__value_.__r.__words[1] + 6) = v443;
                                                    WORD1(v569[0].__r_.__value_.__r.__words[2]) = 1024;
                                                    HIDWORD(v569[0].__r_.__value_.__r.__words[2]) = (v497 & 0x40) >> 6;
                                                    _os_log_impl((void *)&_mh_execute_header, v440, OS_LOG_TYPE_DEFAULT, "Cloud: TiPi supported flag update from listeningServices mask %{public}s, current local value: %d, listeningServices mask value: %d", (uint8_t *)v569, 0x18u);
                                                    if (SHIBYTE(v575.__r_.__value_.__r.__words[2]) < 0)
                                                      operator delete(v575.__r_.__value_.__l.__data_);
                                                  }

                                                  if ((v497 & 0x40) != 0 && (sub_100442118(v502, 32) & 1) == 0)
                                                  {
                                                    sub_1004467AC(v502, 32, 1);
                                                    if (!sub_10044F658(v502))
                                                      sub_10044D524(v502, 1);
                                                  }
                                                }
                                              }
                                              else
                                              {

                                              }
                                            }
                                            else
                                            {

                                            }
                                          }
                                          else
                                          {

                                          }
                                        }
                                        else
                                        {

                                        }
                                      }
                                      else
                                      {

                                      }
                                    }
                                    else
                                    {

                                    }
                                  }
                                  else
                                  {

                                  }
                                }
                                else
                                {

                                }
                              }
                              else
                              {

                              }
                              if (_os_feature_enabled_impl("PowerUI", "audioAccessoryOBC")
                                && NSClassFromString(CFSTR("PowerUISmartChargeClientAudioAccessories")))
                              {
                                v445 = (id)qword_100999870;
                                if (os_log_type_enabled(v445, OS_LOG_TYPE_DEFAULT))
                                {
                                  sub_10043E5F8(v502, &v575);
                                  v446 = (v575.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
                                       ? &v575
                                       : (std::string *)v575.__r_.__value_.__r.__words[0];
                                  v447 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "optimizedBatteryCharging"));
                                  v448 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "optimizedBatteryFullChargeDeadline"));
                                  LODWORD(v569[0].__r_.__value_.__l.__data_) = v492;
                                  *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v446;
                                  WORD2(v569[0].__r_.__value_.__r.__words[1]) = 2112;
                                  *(std::string::size_type *)((char *)&v569[0].__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v447;
                                  HIWORD(v569[0].__r_.__value_.__r.__words[2]) = 2112;
                                  v569[1].__r_.__value_.__r.__words[0] = (std::string::size_type)v448;
                                  _os_log_impl((void *)&_mh_execute_header, v445, OS_LOG_TYPE_DEFAULT, "Cloud: OBC PowerUI values updated for device %{public}s, optimizedBatteryCharging %@, optimizedBatteryFullChargeDeadline %@", (uint8_t *)v569, 0x20u);

                                  if (SHIBYTE(v575.__r_.__value_.__r.__words[2]) < 0)
                                    operator delete(v575.__r_.__value_.__l.__data_);
                                }

                                v449 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "optimizedBatteryCharging"));
                                v450 = objc_msgSend(v449, "length") == 0;

                                if (!v450)
                                {
                                  v451 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "optimizedBatteryCharging"));
                                  v452 = objc_msgSend(v451, "longLongValue");

                                  sub_100451548(v502, (uint64_t)v452);
                                  -[CloudPairing audioAccessorySmartChargeStatusHasChangedFromCloud:](self, "audioAccessorySmartChargeStatusHasChangedFromCloud:", (_QWORD)v502);
                                }
                                v453 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "optimizedBatteryFullChargeDeadline"));
                                v454 = objc_msgSend(v453, "length") == 0;

                                if (!v454)
                                {
                                  *(_QWORD *)&v497 = objc_alloc_init((Class)NSDateFormatter);
                                  v455 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone"));
                                  objc_msgSend((id)v497, "setTimeZone:", v455);

                                  objc_msgSend((id)v497, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss.SSSSSSSZZZZZ"));
                                  v456 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "optimizedBatteryFullChargeDeadline"));
                                  v457 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v497, "dateFromString:", v456));

                                  v458 = objc_msgSend(objc_alloc((Class)PowerUISmartChargeClientAudioAccessories), "initWithClientName:", CFSTR("com.apple.bluetooth"));
                                  v459 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v504, "bluetoothAddress"));
                                  v505 = 0;
                                  v460 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v458, "unfilteredDeadlineForDevice:withError:", v459, &v505));
                                  v461 = v505;

                                  if (v460 && (objc_msgSend(v457, "timeIntervalSinceDate:", v460), v462 <= 0.0))
                                  {
                                    v463 = (id)qword_100999870;
                                    if (os_log_type_enabled(v463, OS_LOG_TYPE_INFO))
                                    {
                                      sub_10043E5F8(v502, &v575);
                                      v464 = &v575;
                                      if ((v575.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                                        v464 = (std::string *)v575.__r_.__value_.__r.__words[0];
                                      LODWORD(v569[0].__r_.__value_.__l.__data_) = v492;
                                      *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v464;
                                      WORD2(v569[0].__r_.__value_.__r.__words[1]) = 2112;
                                      *(std::string::size_type *)((char *)&v569[0].__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v457;
                                      HIWORD(v569[0].__r_.__value_.__r.__words[2]) = 2112;
                                      v569[1].__r_.__value_.__r.__words[0] = (std::string::size_type)v460;
                                      _os_log_impl((void *)&_mh_execute_header, v463, OS_LOG_TYPE_INFO, "Cloud: Skip OBC PowerUI values updated for device %{public}s with older deadline %@ to keep newer deadline %@", (uint8_t *)v569, 0x20u);
                                      if (SHIBYTE(v575.__r_.__value_.__r.__words[2]) < 0)
                                        operator delete(v575.__r_.__value_.__l.__data_);
                                    }

                                  }
                                  else
                                  {
                                    sub_100451628(v502, v457);
                                    -[CloudPairing audioAccessorySmartChargeDeadlineHasChangedFromCloud:](self, "audioAccessorySmartChargeDeadlineHasChangedFromCloud:", (_QWORD)v502);
                                  }

                                }
                              }
LABEL_743:
                              if (SHIBYTE(v576[2]) < 0)
                                operator delete(v576[0]);
                              goto LABEL_745;
                            }
                            v298 = 1;
                            while (v298 != 6)
                            {
                              if (*((unsigned __int8 *)&v515 + v298++))
                              {
                                if ((unint64_t)(v298 - 2) < 5)
                                  goto LABEL_423;
                                break;
                              }
                            }
                          }
                          if (os_log_type_enabled((os_log_t)qword_100999870, OS_LOG_TYPE_ERROR))
                            sub_1006FC6B0(&v513, (_BYTE *)v496);
                          goto LABEL_743;
                        }
LABEL_745:
                        *(_QWORD *)&v503 = v503 + 1;
                      }
                      while ((std::string *)v503 != v501);
                      v469 = (std::string *)objc_msgSend((id)v499, "countByEnumeratingWithState:objects:count:", &v517, v565, 16);
                      v501 = v469;
                      if (!v469)
                      {
LABEL_755:

                        break;
                      }
                    }
                  }
                }

              }
              goto LABEL_117;
            }
            v13 = _CFXPCCreateCFObjectFromXPCMessage(v9);
            v240 = qword_1009997F8;
            if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v569[0].__r_.__value_.__l.__data_) = 0;
              _os_log_impl((void *)&_mh_execute_header, v240, OS_LOG_TYPE_DEFAULT, "Devices magic info removed", (uint8_t *)v569, 2u);
            }
            if (!sub_100350078())
              goto LABEL_117;
            v241 = -[CloudPairing iCloudSignedIn](self, "iCloudSignedIn");
            v242 = v13 ? v241 : 0;
            if (v242 != 1)
              goto LABEL_117;
            v501 = (std::string *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("records")));
            v243 = objc_opt_class(NSData);
            if ((objc_opt_isKindOfClass(v501, v243) & 1) != 0)
            {
              v568[0] = objc_opt_class(NSArray);
              v568[1] = objc_opt_class(NSString);
              v568[2] = objc_opt_class(BTMagicPairingSettings);
              v244 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v568, 3));
              v245 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v244));
              *(_QWORD *)&v499 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v245, v501, 0));

              if ((_QWORD)v499)
              {
                v246 = objc_opt_class(NSArray);
                if ((objc_opt_isKindOfClass(v499, v246) & 1) != 0)
                {
                  v523 = 0u;
                  v524 = 0u;
                  v521 = 0u;
                  v522 = 0u;
                  *(_QWORD *)&v504 = (id)v499;
                  v247 = objc_msgSend((id)v504, "countByEnumeratingWithState:objects:count:", &v521, v567, 16);
                  if (!v247)
                    goto LABEL_394;
                  v249 = *(_QWORD *)v522;
                  *(_QWORD *)&v248 = 138412290;
                  v503 = v248;
                  *(_QWORD *)&v248 = 136446210;
                  v502 = v248;
                  *(_QWORD *)&v248 = 136315138;
                  v500 = v248;
                  while (1)
                  {
                    v250 = 0;
                    do
                    {
                      if (*(_QWORD *)v522 != v249)
                        objc_enumerationMutation((id)v504);
                      v251 = *(void **)(*((_QWORD *)&v521 + 1) + 8 * (_QWORD)v250);
                      v252 = objc_opt_class(BTMagicPairingSettings);
                      if ((objc_opt_isKindOfClass(v251, v252) & 1) != 0)
                      {
                        v253 = qword_100999870;
                        if (os_log_type_enabled((os_log_t)qword_100999870, OS_LOG_TYPE_DEFAULT))
                        {
                          LODWORD(v569[0].__r_.__value_.__l.__data_) = v503;
                          *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v251;
                          _os_log_impl((void *)&_mh_execute_header, v253, OS_LOG_TYPE_DEFAULT, "Device magic Info to be removed: %@", (uint8_t *)v569, 0xCu);
                        }
                        WORD2(v564) = 0;
                        LODWORD(v564) = 0;
                        memset(v569, 0, 24);
                        v254 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v251, "bluetoothAddress")));
                        sub_100091AE8(v569, (char *)objc_msgSend(v254, "UTF8String"));

                        if ((v569[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                          v255 = v569;
                        else
                          v255 = (std::string *)v569[0].__r_.__value_.__r.__words[0];
                        if (sub_10006D80C((uint64_t)&v564, (unsigned __int8 *)v255))
                        {
                          if ((_BYTE)v564)
                          {
LABEL_363:
                            if (qword_1009778E8 != -1)
                              dispatch_once(&qword_1009778E8, &stru_100934290);
                            v256 = (unsigned __int8 *)sub_1004704A8((uint64_t)off_1009778E0, (uint64_t)&v564, 0);
                            if (v256)
                            {
                              if (qword_100977A68 != -1)
                                dispatch_once(&qword_100977A68, &stru_1009342B0);
                              v257 = sub_10045E8B4((uint64_t)off_100977A60, (uint64_t)v256);
                              v258 = (id)qword_100999870;
                              v259 = v258;
                              if (v257)
                              {
                                if (os_log_type_enabled(v258, OS_LOG_TYPE_DEFAULT))
                                {
                                  sub_10043E5F8((uint64_t)v256, v576);
                                  v260 = v576;
                                  if (SHIBYTE(v576[2]) < 0)
                                    v260 = (void **)v576[0];
                                  LODWORD(v575.__r_.__value_.__l.__data_) = v502;
                                  *(std::string::size_type *)((char *)v575.__r_.__value_.__r.__words + 4) = (std::string::size_type)v260;
                                  _os_log_impl((void *)&_mh_execute_header, v259, OS_LOG_TYPE_DEFAULT, "Remove magic paired device: %{public}s", (uint8_t *)&v575, 0xCu);
                                  if (SHIBYTE(v576[2]) < 0)
                                    operator delete(v576[0]);
                                }

                                if (qword_100977A68 != -1)
                                  dispatch_once(&qword_100977A68, &stru_1009342B0);
                                sub_10045E9C0((uint64_t)off_100977A60, v256, 0);
                              }
                              else
                              {
                                if (os_log_type_enabled(v258, OS_LOG_TYPE_INFO))
                                {
                                  sub_10043E5F8((uint64_t)v256, v576);
                                  v264 = v576;
                                  if (SHIBYTE(v576[2]) < 0)
                                    v264 = (void **)v576[0];
                                  LODWORD(v575.__r_.__value_.__l.__data_) = v502;
                                  *(std::string::size_type *)((char *)v575.__r_.__value_.__r.__words + 4) = (std::string::size_type)v264;
                                  _os_log_impl((void *)&_mh_execute_header, v259, OS_LOG_TYPE_INFO, "Cannot find magic paired device to remove: %{public}s", (uint8_t *)&v575, 0xCu);
                                  if (SHIBYTE(v576[2]) < 0)
                                    operator delete(v576[0]);
                                }

                              }
                            }
LABEL_383:
                            if (SHIBYTE(v569[0].__r_.__value_.__r.__words[2]) < 0)
                              operator delete(v569[0].__r_.__value_.__l.__data_);
                            goto LABEL_385;
                          }
                          v261 = 1;
                          while (v261 != 6)
                          {
                            if (v565[v261++ - 16])
                            {
                              if ((unint64_t)(v261 - 2) < 5)
                                goto LABEL_363;
                              break;
                            }
                          }
                        }
                        v263 = qword_100999870;
                        if (os_log_type_enabled((os_log_t)qword_100999870, OS_LOG_TYPE_ERROR))
                        {
                          LODWORD(v576[0]) = v500;
                          *(void **)((char *)v576 + 4) = v255;
                          _os_log_error_impl((void *)&_mh_execute_header, v263, OS_LOG_TYPE_ERROR, "Received invalid device address for device record: %s", (uint8_t *)v576, 0xCu);
                        }
                        goto LABEL_383;
                      }
LABEL_385:
                      v250 = (char *)v250 + 1;
                    }
                    while (v250 != v247);
                    v265 = objc_msgSend((id)v504, "countByEnumeratingWithState:objects:count:", &v521, v567, 16);
                    v247 = v265;
                    if (!v265)
                    {
LABEL_394:

                      break;
                    }
                  }
                }
              }

            }
            goto LABEL_117;
          }
          v13 = _CFXPCCreateCFObjectFromXPCMessage(v9);
          v206 = (id)qword_100999870;
          if (os_log_type_enabled(v206, OS_LOG_TYPE_DEFAULT))
          {
            v207 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSObject debugDescription](v13, "debugDescription")));
            v208 = objc_msgSend(v207, "UTF8String");
            LODWORD(v569[0].__r_.__value_.__l.__data_) = 136446210;
            *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v208;
            _os_log_impl((void *)&_mh_execute_header, v206, OS_LOG_TYPE_DEFAULT, "Device support info updated from cloudkit = %{public}s", (uint8_t *)v569, 0xCu);

          }
          if (!sub_100350078() || !v13)
            goto LABEL_117;
          *(_QWORD *)&v494 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("records")));
          v209 = objc_opt_class(NSData);
          if ((objc_opt_isKindOfClass(v494, v209) & 1) != 0)
          {
            v572[0] = objc_opt_class(NSArray);
            v572[1] = objc_opt_class(NSString);
            v572[2] = objc_opt_class(BTCloudDeviceSupportInformation);
            v210 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v572, 3));
            v211 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v210));
            *(_QWORD *)&v493 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v211, (_QWORD)v494, 0));

            if ((_QWORD)v493)
            {
              v212 = objc_opt_class(NSArray);
              if ((objc_opt_isKindOfClass(v493, v212) & 1) != 0)
              {
                v530 = 0u;
                v531 = 0u;
                v528 = 0u;
                v529 = 0u;
                *(_QWORD *)&v502 = (id)v493;
                *(_QWORD *)&v504 = objc_msgSend((id)v502, "countByEnumeratingWithState:objects:count:", &v528, v571, 16);
                if (!(_QWORD)v504)
                  goto LABEL_337;
                v501 = (std::string *)&v569[1].__r_.__value_.__r.__words[1];
                *(_QWORD *)&v496 = (char *)&v564 + 1;
                *(_QWORD *)&v503 = *(_QWORD *)v529;
                *(_QWORD *)&v497 = (char *)v575.__r_.__value_.__r.__words + 1;
                *(_QWORD *)&v213 = 136446210;
                v495 = v213;
                while (1)
                {
                  v214 = 0;
                  do
                  {
                    if (*(_QWORD *)v529 != (_QWORD)v503)
                      objc_enumerationMutation((id)v502);
                    v215 = *(void **)(*((_QWORD *)&v528 + 1) + 8 * v214);
                    v216 = objc_opt_class(BTCloudDeviceSupportInformation);
                    if ((objc_opt_isKindOfClass(v215, v216) & 1) != 0)
                    {
                      v217 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v215, "bluetoothAddress"));
                      v218 = sub_100649C7C(v217);

                      if (v218)
                      {
                        if (qword_1009778E8 != -1)
                          dispatch_once(&qword_1009778E8, &stru_100934290);
                        v219 = sub_10006D488((uint64_t)off_1009778E0, v218, 0);
                        v220 = v219;
                        if (v219)
                        {
                          if (*(_BYTE *)(v219 + 128))
                          {
LABEL_304:
                            v221 = (id)qword_100999870;
                            if (os_log_type_enabled(v221, OS_LOG_TYPE_DEFAULT))
                            {
                              sub_10043E5F8(v220, v569);
                              v222 = v569;
                              if ((v569[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                                v222 = (std::string *)v569[0].__r_.__value_.__r.__words[0];
                              LODWORD(v576[0]) = v495;
                              *(void **)((char *)v576 + 4) = v222;
                              _os_log_impl((void *)&_mh_execute_header, v221, OS_LOG_TYPE_DEFAULT, "DeviceSupportInformationRecordsUpdated for %{public}s", (uint8_t *)v576, 0xCu);
                              if (SHIBYTE(v569[0].__r_.__value_.__r.__words[2]) < 0)
                                operator delete(v569[0].__r_.__value_.__l.__data_);
                            }

                            v223 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing cloudClient](self, "cloudClient"));
                            v224 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v215, "bluetoothAddress"));
                            v527[0] = _NSConcreteStackBlock;
                            v527[1] = 3221225472;
                            v527[2] = sub_1004F11DC;
                            v527[3] = &unk_10092FAA0;
                            v527[5] = v220;
                            v527[4] = v215;
                            objc_msgSend(v223, "deviceRecord:completion:", v224, v527);

                            v225 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v215, "ancAssetVersion"));
                            LODWORD(v223) = (unint64_t)objc_msgSend(v225, "length") > 1;

                            if ((_DWORD)v223)
                            {
                              v226 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v215, "ancAssetVersion")));
                              sub_100091AE8(&v526, (char *)objc_msgSend(v226, "UTF8String"));
                              sub_1004494EC(v220, &v526);
                              if (SHIBYTE(v526.__r_.__value_.__r.__words[2]) < 0)
                                operator delete(v526.__r_.__value_.__l.__data_);

                            }
                            v570 = 0;
                            memset(v569, 0, sizeof(v569));
                            sub_100091AE8(v501, "");
                            sub_1004495CC(v220, (uint64_t)v569);
                            v227 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v215, "caseFirmwareVersion"));
                            v228 = v227 == 0;

                            if (v228
                              || (v229 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v215, "caseFirmwareVersion")),
                                  v230 = objc_msgSend(v229, "longLongValue"),
                                  v229,
                                  !v230))
                            {
                              LODWORD(v500) = 0;
                            }
                            else
                            {
                              v569[0].__r_.__value_.__r.__words[2] = (std::string::size_type)v230;
                              LODWORD(v500) = 1;
                            }
                            v231 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v215, "caseName"));
                            v232 = (unint64_t)objc_msgSend(v231, "length") > 1;

                            if (v232)
                            {
                              v233 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v215, "caseName")));
                              std::string::assign(v501, (const std::string::value_type *)objc_msgSend(v233, "UTF8String"));

LABEL_328:
                              v237 = v569[0].__r_.__value_.__s.__data_[0];
                              LODWORD(v500) = *(unsigned __int16 *)&v569[0].__r_.__value_.__s.__data_[2];
                              v238 = HIDWORD(v569[0].__r_.__value_.__r.__words[0]);
                              v239 = v569[0].__r_.__value_.__r.__words[1];
                              LODWORD(v499) = v569[0].__r_.__value_.__s.__data_[10];
                              *(_QWORD *)&v498 = *((_QWORD *)&v569[0].__r_.__value_.__l + 2);
                              if (SHIBYTE(v570) < 0)
                                sub_10003430C(&v525, (void *)v569[1].__r_.__value_.__l.__size_, v569[1].__r_.__value_.__r.__words[2]);
                              else
                                v525 = *v501;
                              sub_10044965C(v220, v237, v500, v238, v239, v499, v498, 0, &v525);
                              if (SHIBYTE(v525.__r_.__value_.__r.__words[2]) < 0)
                                operator delete(v525.__r_.__value_.__l.__data_);
                            }
                            else if ((_DWORD)v500)
                            {
                              goto LABEL_328;
                            }
                            if (SHIBYTE(v570) < 0)
                              operator delete((void *)v569[1].__r_.__value_.__l.__size_);
                            goto LABEL_335;
                          }
                          v234 = 0;
                          while (v234 != 5)
                          {
                            v235 = v234;
                            if (*(unsigned __int8 *)(v219 + 129 + v234++))
                            {
                              if (v235 < 5)
                                goto LABEL_304;
                              break;
                            }
                          }
                        }
                        if (os_log_type_enabled((os_log_t)qword_100999870, OS_LOG_TYPE_ERROR))
                          sub_1006FC684(&v564, (_BYTE *)v496);
                      }
                      else if (os_log_type_enabled((os_log_t)qword_100999870, OS_LOG_TYPE_ERROR))
                      {
                        sub_1006FC658(&v575, (_BYTE *)v497);
                      }
                    }
LABEL_335:
                    ++v214;
                  }
                  while (v214 != (_QWORD)v504);
                  *(_QWORD *)&v504 = objc_msgSend((id)v502, "countByEnumeratingWithState:objects:count:", &v528, v571, 16);
                  if (!(_QWORD)v504)
                  {
LABEL_337:

                    break;
                  }
                }
              }
            }

          }
          goto LABEL_117;
        }
        v13 = _CFXPCCreateCFObjectFromXPCMessage(v9);
        v165 = (id)qword_100999870;
        if (os_log_type_enabled(v165, OS_LOG_TYPE_DEFAULT))
        {
          v166 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSObject debugDescription](v13, "debugDescription")));
          v167 = objc_msgSend(v166, "UTF8String");
          LODWORD(v569[0].__r_.__value_.__l.__data_) = 141558275;
          *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words + 4) = 1752392040;
          WORD2(v569[0].__r_.__value_.__r.__words[1]) = 2081;
          *(std::string::size_type *)((char *)&v569[0].__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v167;
          _os_log_impl((void *)&_mh_execute_header, v165, OS_LOG_TYPE_DEFAULT, "Devices nickname info updated from cloudkit = %{private, mask.hash}s", (uint8_t *)v569, 0x16u);

        }
        if (!sub_100350078() || !v13)
          goto LABEL_117;
        *(_QWORD *)&v498 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", CFSTR("devices")));
        v168 = objc_opt_class(NSData);
        if ((objc_opt_isKindOfClass(v498, v168) & 1) != 0)
        {
          v578[0] = objc_opt_class(NSArray);
          v578[1] = objc_opt_class(NSString);
          v578[2] = objc_opt_class(BTCloudDevice);
          v169 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v578, 3));
          v170 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v169));
          *(_QWORD *)&v495 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v170, (_QWORD)v498, 0));

          if ((_QWORD)v495)
          {
            v171 = objc_opt_class(NSArray);
            if ((objc_opt_isKindOfClass(v495, v171) & 1) != 0)
            {
              v542 = 0u;
              v543 = 0u;
              v540 = 0u;
              v541 = 0u;
              v501 = (std::string *)(id)v495;
              *(_QWORD *)&v504 = unk_10099DD40(v501, "countByEnumeratingWithState:objects:count:", &v540, v577, 16);
              if (!(_QWORD)v504)
                goto LABEL_279;
              *(_QWORD *)&v503 = *(_QWORD *)v541;
              *(_QWORD *)&v172 = 136315138;
              v496 = v172;
              *(_QWORD *)&v172 = 67110146;
              v499 = v172;
              *(_QWORD *)&v172 = 67109890;
              v497 = v172;
              *(_QWORD *)&v172 = 136446210;
              v494 = v172;
              while (1)
              {
                v173 = 0;
                do
                {
                  if (*(_QWORD *)v541 != (_QWORD)v503)
                    objc_enumerationMutation(v501);
                  v174 = *(void **)(*((_QWORD *)&v540 + 1) + 8 * v173);
                  v175 = objc_opt_class(BTCloudDevice);
                  if ((objc_opt_isKindOfClass(v174, v175) & 1) != 0)
                  {
                    WORD2(v563) = 0;
                    LODWORD(v563) = 0;
                    memset(v576, 0, sizeof(v576));
                    v176 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v174, "bluetoothAddress")));
                    sub_100091AE8(v576, (char *)objc_msgSend(v176, "UTF8String"));

                    if (SHIBYTE(v576[2]) >= 0)
                      v177 = (unsigned __int8 *)v576;
                    else
                      v177 = (unsigned __int8 *)v576[0];
                    if (sub_10006D80C((uint64_t)&v563, v177))
                    {
                      if ((_BYTE)v563)
                      {
LABEL_221:
                        if (qword_1009778E8 != -1)
                          dispatch_once(&qword_1009778E8, &stru_100934290);
                        *(_QWORD *)&v502 = sub_1004704A8((uint64_t)off_1009778E0, (uint64_t)&v563, 0);
                        if ((_QWORD)v502)
                        {
                          v178 = sub_100350078();
                          v179 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v174, "bluetoothAddress")));
                          sub_100091AE8(v538, (char *)objc_msgSend(v179, "UTF8String"));
                          v180 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v174, "nickname")));
                          sub_100091AE8(v536, (char *)objc_msgSend(v180, "UTF8String"));
                          (*(void (**)(uint64_t, void **, void **))(*(_QWORD *)v178 + 176))(v178, v538, v536);
                          if (v537 < 0)
                            operator delete(v536[0]);

                          if (v539 < 0)
                            operator delete(v538[0]);

                          v562.n128_u32[0] = 1;
                          LODWORD(v561) = 0;
                          v559 = 0;
                          v515 = 0;
                          sub_100444BF0(v502, &v515, &v561, &v559, &v562);
                          *(_QWORD *)&v500 = (id)qword_100999870;
                          if (os_log_type_enabled((os_log_t)v500, OS_LOG_TYPE_DEFAULT))
                          {
                            v181 = v561;
                            v182 = v559;
                            v183 = v515;
                            v184 = v562.n128_u32[0];
                            sub_10043E5F8(v502, &v575);
                            v185 = &v575;
                            if ((v575.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                              v185 = (std::string *)v575.__r_.__value_.__r.__words[0];
                            v569[0].__r_.__value_.__r.__words[0] = __PAIR64__(v181, v499);
                            LOWORD(v569[0].__r_.__value_.__r.__words[1]) = 1024;
                            *(_DWORD *)((char *)&v569[0].__r_.__value_.__r.__words[1] + 2) = v182;
                            HIWORD(v569[0].__r_.__value_.__r.__words[1]) = 1024;
                            LODWORD(v569[0].__r_.__value_.__r.__words[2]) = v183;
                            WORD2(v569[0].__r_.__value_.__r.__words[2]) = 1024;
                            *(_DWORD *)((char *)&v569[0].__r_.__value_.__r.__words[2] + 6) = v184;
                            *(_WORD *)&v569[1].__r_.__value_.__s.__data_[2] = 2082;
                            *(std::string::size_type *)((char *)v569[1].__r_.__value_.__r.__words + 4) = (std::string::size_type)v185;
                            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v500, OS_LOG_TYPE_DEFAULT, "Local Device ID; vid: %x, pid: %x, vidSrc: %d, version: %d for device: %{public}s",
                              (uint8_t *)v569,
                              0x24u);
                            if (SHIBYTE(v575.__r_.__value_.__r.__words[2]) < 0)
                              operator delete(v575.__r_.__value_.__l.__data_);
                          }

                          v186 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v174, "vendorID"));
                          v187 = objc_msgSend(v186, "integerValue");

                          v188 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v174, "productID"));
                          v189 = objc_msgSend(v188, "integerValue");

                          if (v187 && (_DWORD)v189)
                          {
                            if (v515 <= 1)
                              v190 = 1;
                            else
                              v190 = v515;
                            v191 = (id)qword_100999870;
                            if (os_log_type_enabled(v191, OS_LOG_TYPE_DEFAULT))
                            {
                              sub_10043E5F8(v502, &v575);
                              v192 = &v575;
                              if ((v575.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                                v192 = (std::string *)v575.__r_.__value_.__r.__words[0];
                              v569[0].__r_.__value_.__r.__words[0] = __PAIR64__(v187, v497);
                              LOWORD(v569[0].__r_.__value_.__r.__words[1]) = 1024;
                              *(_DWORD *)((char *)&v569[0].__r_.__value_.__r.__words[1] + 2) = (_DWORD)v189;
                              HIWORD(v569[0].__r_.__value_.__r.__words[1]) = 1024;
                              LODWORD(v569[0].__r_.__value_.__r.__words[2]) = v190;
                              WORD2(v569[0].__r_.__value_.__r.__words[2]) = 2082;
                              *(std::string::size_type *)((char *)&v569[0].__r_.__value_.__r.__words[2] + 6) = (std::string::size_type)v192;
                              _os_log_impl((void *)&_mh_execute_header, v191, OS_LOG_TYPE_DEFAULT, "Updating Device ID from cloud; vid: %x, cloud pid: %x, vidSrc: %x for device: %{public}s",
                                (uint8_t *)v569,
                                0x1Eu);
                              if (SHIBYTE(v575.__r_.__value_.__r.__words[2]) < 0)
                                operator delete(v575.__r_.__value_.__l.__data_);
                            }

                            sub_100445BAC(v502, v190, v187, (int)v189, v562.n128_i32[0]);
                            sub_1004468B0(v502);
                          }
                          v193 = (void *)objc_claimAutoreleasedReturnValue(+[CBProductInfo productInfoWithProductID:](CBProductInfo, "productInfoWithProductID:", v189));
                          v194 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v193, "productName"));

                          if (v194
                            && (objc_msgSend(v194, "isEqualToString:", CFSTR("Unknown")) & 1) == 0
                            && objc_msgSend(v194, "length"))
                          {
                            sub_10043F6EC(v502, (uint64_t)v569);
                            v195 = HIBYTE(v569[0].__r_.__value_.__r.__words[2]);
                            v196 = HIBYTE(v569[0].__r_.__value_.__r.__words[2]);
                            if ((v569[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                              v195 = v569[0].__r_.__value_.__l.__size_;
                            if (v195)
                            {
                              sub_10043F6EC(v502, (uint64_t)&v575);
                              v197 = std::string::compare(&v575, (const std::string::value_type *)objc_msgSend(objc_retainAutorelease(v194), "UTF8String")) != 0;
                              if (SHIBYTE(v575.__r_.__value_.__r.__words[2]) < 0)
                                operator delete(v575.__r_.__value_.__l.__data_);
                              v196 = HIBYTE(v569[0].__r_.__value_.__r.__words[2]);
                            }
                            else
                            {
                              v197 = 1;
                            }
                            if (v196 < 0)
                              operator delete(v569[0].__r_.__value_.__l.__data_);
                            if (v197)
                            {
                              sub_100091AE8(v569, (char *)objc_msgSend(v194, "utf8ValueSafe"));
                              *(_QWORD *)&v564 = 0;
                              *(_OWORD *)&v575.__r_.__value_.__l.__data_ = 0uLL;
                              sub_10004AD30((uint64_t)&v564);
                              v575.__r_.__value_.__r.__words[0] = (int)v564;
                              v575.__r_.__value_.__l.__size_ = SWORD2(v564);
                              sub_10044054C(v502, (uint64_t)v569, &v575);
                              if (SHIBYTE(v569[0].__r_.__value_.__r.__words[2]) < 0)
                                operator delete(v569[0].__r_.__value_.__l.__data_);
                              v204 = (id)qword_100999870;
                              if (os_log_type_enabled(v204, OS_LOG_TYPE_DEFAULT))
                              {
                                sub_10043E5F8(v502, v569);
                                v205 = v569;
                                if ((v569[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                                  v205 = (std::string *)v569[0].__r_.__value_.__r.__words[0];
                                LODWORD(v575.__r_.__value_.__l.__data_) = v494;
                                *(std::string::size_type *)((char *)v575.__r_.__value_.__r.__words + 4) = (std::string::size_type)v205;
                                _os_log_impl((void *)&_mh_execute_header, v204, OS_LOG_TYPE_DEFAULT, "Cloud: Magic Settings updated productname %{public}s", (uint8_t *)&v575, 0xCu);
                                if (SHIBYTE(v569[0].__r_.__value_.__r.__words[2]) < 0)
                                  operator delete(v569[0].__r_.__value_.__l.__data_);
                              }

                            }
                          }

                          goto LABEL_275;
                        }
                        v203 = qword_100999870;
                        if (os_log_type_enabled((os_log_t)qword_100999870, OS_LOG_TYPE_ERROR))
                        {
                          LODWORD(v569[0].__r_.__value_.__l.__data_) = v496;
                          *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v177;
                          v201 = v203;
                          v202 = "[DeviceRecord] No device record for device address: %s";
LABEL_259:
                          _os_log_error_impl((void *)&_mh_execute_header, v201, OS_LOG_TYPE_ERROR, v202, (uint8_t *)v569, 0xCu);
                        }
                        goto LABEL_275;
                      }
                      v198 = 1;
                      while (v198 != 6)
                      {
                        if (*((unsigned __int8 *)&v563 + v198++))
                        {
                          if ((unint64_t)(v198 - 2) < 5)
                            goto LABEL_221;
                          break;
                        }
                      }
                    }
                    v200 = qword_100999870;
                    if (os_log_type_enabled((os_log_t)qword_100999870, OS_LOG_TYPE_ERROR))
                    {
                      LODWORD(v569[0].__r_.__value_.__l.__data_) = v496;
                      *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v177;
                      v201 = v200;
                      v202 = "Received invalid device address for device record: %s";
                      goto LABEL_259;
                    }
LABEL_275:
                    if (SHIBYTE(v576[2]) < 0)
                      operator delete(v576[0]);
                  }
                  ++v173;
                }
                while (v173 != (_QWORD)v504);
                *(_QWORD *)&v504 = unk_10099DD48(v501, "countByEnumeratingWithState:objects:count:", &v540, v577, 16);
                if (!(_QWORD)v504)
                {
LABEL_279:

                  break;
                }
              }
            }
          }

        }
        goto LABEL_117;
      }
      v13 = _CFXPCCreateCFObjectFromXPCMessage(v9);
      v110 = qword_1009997F8;
      if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_INFO))
      {
        LODWORD(v569[0].__r_.__value_.__l.__data_) = 138412290;
        *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v13;
        _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_INFO, "Process RemoveCloudPairedDevice: %@", (uint8_t *)v569, 0xCu);
      }
      v111 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v13, "objectForKey:", CFSTR("kCloudDeviceUniqueID")));
      v112 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v111, v112) & 1) != 0)
      {
        v113 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v13, "objectForKey:", CFSTR("kCloudDeviceUniqueID")));

        if (v113)
        {
          v114 = qword_1009997F8;
          if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(v569[0].__r_.__value_.__l.__data_) = 138412290;
            *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v113;
            _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "Removing CloudPairedDevice value: %@", (uint8_t *)v569, 0xCu);
          }
          v115 = sub_1000419F4();
          v552[0] = _NSConcreteStackBlock;
          v552[1] = 3221225472;
          v552[2] = sub_1004F10E8;
          v552[3] = &unk_1009172A0;
          v116 = v113;
          v553 = v116;
          sub_100041A34(v115, v552);

          goto LABEL_117;
        }
      }
      else
      {

      }
      v124 = qword_1009997F8;
      if (!os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_INFO))
      {
LABEL_117:

        goto LABEL_118;
      }
      LODWORD(v569[0].__r_.__value_.__l.__data_) = 138412290;
      *(std::string::size_type *)((char *)v569[0].__r_.__value_.__r.__words + 4) = 0;
      v71 = "Invalid RemoveCloudPairedDevice value: %@";
      v72 = v124;
      v73 = OS_LOG_TYPE_INFO;
      v74 = 12;
    }
    _os_log_impl((void *)&_mh_execute_header, v72, v73, v71, (uint8_t *)v569, v74);
    goto LABEL_117;
  }
LABEL_119:

}

- (void)fetchSoundProfile
{
  NSObject *v3;
  id v4;
  uint8_t buf[16];

  if (_os_feature_enabled_impl("BluetoothFeatures", "CustomHRTFSupport") && (sub_1004F9720() & 1) != 0)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[CloudPairing cloudClient](self, "cloudClient"));
    objc_msgSend(v4, "fetchSoundProfileRecordWithCompletion:", &stru_100934160);

  }
  else
  {
    v3 = qword_1009997F8;
    if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "BTAudioCloudSyncMonitor: Spatial Profile Not supported hardware ", buf, 2u);
    }
  }
}

- (void)resetServerConnection
{
  void *v3;
  _xpc_connection_s *v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  xpc_connection_t mach_service;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  _xpc_connection_s *v11;
  _xpc_connection_s *v12;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t buf[16];
  uint8_t v16[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing serverConnection](self, "serverConnection"));

  if (v3)
  {
    v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[CloudPairing serverConnection](self, "serverConnection"));
    xpc_connection_cancel(v4);

    -[CloudPairing setServerConnection:](self, "setServerConnection:", 0);
  }
  global_queue = dispatch_get_global_queue(2, 0);
  v6 = objc_claimAutoreleasedReturnValue(global_queue);
  mach_service = xpc_connection_create_mach_service("com.apple.BTServer.cloudpairing", v6, 0);
  -[CloudPairing setServerConnection:](self, "setServerConnection:", mach_service);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing serverConnection](self, "serverConnection"));
  v9 = qword_1009997F8;
  v10 = os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Connected to cloudpaird", buf, 2u);
    }
    v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[CloudPairing serverConnection](self, "serverConnection"));
    xpc_connection_set_event_handler(v11, &stru_1009341A0);

    v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[CloudPairing serverConnection](self, "serverConnection"));
    xpc_connection_resume(v12);

    if (-[NSMutableDictionary count](self->_idsMultiUsersDictionary, "count"))
    {
      v13 = qword_1009997F8;
      if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "MUC - Connected to cloudpaird - send getIDSLocalDeviceInfo", v14, 2u);
      }
      -[CloudPairing cloudpairdMsg:args:](self, "cloudpairdMsg:args:", CFSTR("getIDSLocalDeviceInfo"), &__NSDictionary0__struct);
    }
  }
  else if (v10)
  {
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Failed to connect to cloudpaird", v16, 2u);
  }
}

- (void)cloudpairdReplyMsg:(id)a3 args:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  xpc_object_t reply;
  void *v10;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v12;
  uint8_t v13[16];

  v6 = a3;
  v7 = a4;
  if (-[CloudPairing isRunningInRecovery](self, "isRunningInRecovery"))
  {
    v8 = qword_1009997F8;
    if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CP: Not Available in this layer", v13, 2u);
    }
  }
  else
  {
    reply = xpc_dictionary_create_reply(v6);
    if (v7)
    {
      v10 = (void *)_CFXPCCreateXPCObjectFromCFObject(v7);
      xpc_dictionary_set_value(reply, "kMsgArgs", v10);

    }
    remote_connection = xpc_dictionary_get_remote_connection(v6);
    v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
    xpc_connection_send_message(v12, reply);

  }
}

- (void)cloudpairdMsg:(id)a3 args:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  xpc_object_t v12;
  void *v13;
  _xpc_connection_s *v14;
  int v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;

  v6 = a3;
  v7 = a4;
  if (-[CloudPairing isRunningInRecovery](self, "isRunningInRecovery"))
  {
    v8 = qword_1009997F8;
    if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CP: Not Available in this layer", (uint8_t *)&v15, 2u);
    }
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing serverConnection](self, "serverConnection"));

    if (!v9)
      -[CloudPairing resetServerConnection](self, "resetServerConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing serverConnection](self, "serverConnection"));

    v11 = qword_1009997F8;
    if (v10)
    {
      if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412803;
        v16 = v6;
        v17 = 2160;
        v18 = 1752392040;
        v19 = 2113;
        v20 = v7;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CloudPairing: Send message: %@ - %{private, mask.hash}@", (uint8_t *)&v15, 0x20u);
      }
      v12 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v12, "kMsgId", (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
      if (v7)
      {
        v13 = (void *)_CFXPCCreateXPCMessageWithCFObject(v7);
        xpc_dictionary_set_value(v12, "kMsgArgs", v13);

      }
      v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[CloudPairing serverConnection](self, "serverConnection"));
      xpc_connection_send_message(v14, v12);

    }
    else if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_ERROR))
    {
      sub_1006FC778();
    }
  }

}

- (void)registerWithCloudPairedDevices:(id)a3 identifiers:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  NSArray *v13;
  NSArray *cloudLocalUUIDs;
  NSArray *v15;
  NSArray *cloudidsIdentifiers;
  NSObject *v17;
  _QWORD block[4];
  id v19;
  _BYTE buf[24];

  v6 = a3;
  v7 = a4;
  v8 = (id)qword_1009997F8;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "))));
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = objc_msgSend(v9, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Locally paired iCloud identifiers: [ %s ]", buf, 0xCu);

  }
  v10 = (id)qword_1009997F8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "))));
    v12 = objc_msgSend(v11, "UTF8String");
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Locally paired iCloud BTUUIDs: [ %s ]", buf, 0xCu);

  }
  v13 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v6));
  cloudLocalUUIDs = self->_cloudLocalUUIDs;
  self->_cloudLocalUUIDs = v13;

  v15 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v7));
  cloudidsIdentifiers = self->_cloudidsIdentifiers;
  self->_cloudidsIdentifiers = v15;

  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  v17 = objc_claimAutoreleasedReturnValue(-[CloudPairing serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004F3038;
  block[3] = &unk_100920120;
  objc_copyWeak(&v19, (id *)buf);
  dispatch_async(v17, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);

}

- (void)printDebug
{
  id v2;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  NSString *publicAddress;
  int v15;
  void *v16;

  v4 = qword_1009997F8;
  if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "statedump: ------------------ IDS Multi Users -------------------", (uint8_t *)&v15, 2u);
  }
  v5 = qword_1009997F8;
  if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_supportsVirtualAddress)
      v6 = "YES";
    else
      v6 = "NO";
    v15 = 136315138;
    v16 = (void *)v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "statedump: Virtual address supported: %s", (uint8_t *)&v15, 0xCu);
  }
  v7 = (id)qword_1009997F8;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing currentIDSUser](self, "currentIDSUser"));
    if (v8)
    {
      v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[CloudPairing currentIDSUser](self, "currentIDSUser")));
      v9 = (const char *)objc_msgSend(v2, "UTF8String");
    }
    else
    {
      v9 = "none";
    }
    v15 = 136315138;
    v16 = (void *)v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "statedump: Current IDS user: %s", (uint8_t *)&v15, 0xCu);
    if (v8)

  }
  v10 = (id)qword_1009997F8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing currentUserRandomAddress](self, "currentUserRandomAddress"));
    if (v11)
    {
      v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[CloudPairing currentUserRandomAddress](self, "currentUserRandomAddress")));
      v12 = (const char *)objc_msgSend(v2, "UTF8String");
    }
    else
    {
      v12 = "none";
    }
    v15 = 136315138;
    v16 = (void *)v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "statedump: Current user's RSA: %s", (uint8_t *)&v15, 0xCu);
    if (v11)

  }
  v13 = qword_1009997F8;
  if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
  {
    publicAddress = self->_publicAddress;
    v15 = 138412290;
    v16 = publicAddress;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "statedump: IDS Multi users dictionary for local address: %@", (uint8_t *)&v15, 0xCu);
  }
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_idsMultiUsersDictionary, "enumerateKeysAndObjectsUsingBlock:", &stru_1009341E0);
  -[CloudPairing cloudpairdMsg:args:](self, "cloudpairdMsg:args:", CFSTR("printDebug"), &__NSDictionary0__struct);
}

- (void)sendCloudKitPush
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = qword_1009997F8;
  if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "sendCloudKitPush", v4, 2u);
  }
  -[CloudPairing cloudpairdMsg:args:](self, "cloudpairdMsg:args:", CFSTR("sendCloudKitPush"), 0);
}

- (BOOL)getAccountStatus
{
  NSObject *v3;
  _DWORD v5[2];

  v3 = (id)qword_1009997F8;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = -[CloudPairing iCloudSignedIn](self, "iCloudSignedIn");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "getAccountStatus : iCloud Account: %i", (uint8_t *)v5, 8u);
  }

  return -[CloudPairing iCloudSignedIn](self, "iCloudSignedIn");
}

- (void)fetchManateeStatus
{
  -[CloudPairing cloudpairdMsg:args:](self, "cloudpairdMsg:args:", CFSTR("manateeZoneAvailabe"), 0);
}

- (BOOL)getAccessibilityHeadtrackingEnabled
{
  return -[CloudPairing accessibilityHeadTrackingEnabled](self, "accessibilityHeadTrackingEnabled");
}

- (BOOL)handleXPCUnpairCommand:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void **v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  char v25;
  char v26;
  NSObject *v27;
  id v28;
  void *v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  id v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v38[2];
  char v39;
  unsigned __int8 src[4];
  void *v41;
  uuid_t uu;
  void *__p[2];
  char v44;
  _BYTE v45[32];
  uint8_t buf[4];
  id v47;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PublicAddress")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Public %@"), v4));
  v6 = sub_100649C7C(v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("RandomAddress")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Random %@"), v7));
  v9 = sub_100649C7C(v8);

  v10 = (v6 | v9) != 0;
  if (v6 | v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kCloudDeviceUniqueID")));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kCloudPairingID")));
    v13 = (void *)v12;
    if (v11 && v12)
    {
      if (qword_1009778C8 != -1)
        dispatch_once(&qword_1009778C8, &stru_100934310);
      if (!sub_100656AA4((uint64_t)off_1009778C0, v13))
      {
        v14 = (id)qword_1009997F8;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
          sub_1006FC8A8((uint64_t)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"), (uint64_t)v13, (uint64_t)buf);

      }
      if (qword_1009778B8 != -1)
        dispatch_once(&qword_1009778B8, &stru_100934270);
      if (!sub_100030864(qword_1009778B0, v13))
      {
        v15 = (id)qword_1009997F8;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          sub_1006FC870((uint64_t)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"), (uint64_t)v13, (uint64_t)v45);

      }
      if (qword_1009778C8 != -1)
        dispatch_once(&qword_1009778C8, &stru_100934310);
      sub_1006594CC((uint64_t)off_1009778C0, v13, (uint64_t)__p);
      if (v44 >= 0)
        v16 = __p;
      else
        v16 = (void **)__p[0];
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v16));
      v18 = objc_msgSend(v11, "isEqualToString:", v17);

      if (v44 < 0)
      {
        operator delete(__p[0]);
        if ((v18 & 1) != 0)
          goto LABEL_30;
      }
      else if ((v18 & 1) != 0)
      {
        goto LABEL_30;
      }
      v23 = (id)qword_1009997F8;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        sub_1006FC838((uint64_t)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"), (uint64_t)v13, (uint64_t)__p);

    }
LABEL_30:
    if (qword_1009778B8 != -1)
      dispatch_once(&qword_1009778B8, &stru_100934270);
    v24 = qword_1009778B0;
    v21 = objc_retainAutorelease(v11);
    sub_100091AE8(v38, (char *)objc_msgSend(v21, "UTF8String"));
    v25 = sub_10069939C(v24, (unsigned __int8 *)v38);
    v26 = v25;
    if (v39 < 0)
    {
      operator delete(v38[0]);
      if ((v26 & 1) != 0)
      {
LABEL_53:

        goto LABEL_54;
      }
    }
    else if ((v25 & 1) != 0)
    {
      goto LABEL_53;
    }
    memset(uu, 0, sizeof(uu));
    uuid_clear(uu);
    if (qword_1009778C8 != -1)
      dispatch_once(&qword_1009778C8, &stru_100934310);
    sub_10003F924((uint64_t)off_1009778C0, v9, 0, 1u, 0, 0, src);
    uuid_copy(uu, src);
    if (uuid_is_null(uu))
    {
      v27 = (id)qword_1009997F8;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = sub_100021770(v9);
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        *(_DWORD *)src = 138412290;
        v41 = v29;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "No static random device found with address %@", src, 0xCu);

      }
    }
    else
    {
      if (qword_1009778B8 != -1)
        dispatch_once(&qword_1009778B8, &stru_100934270);
      v30 = qword_1009778B0;
      v31 = sub_100030DF4(uu);
      v27 = objc_claimAutoreleasedReturnValue(v31);
      sub_100699674(v30, v27);
    }

    if (qword_1009778C8 != -1)
      dispatch_once(&qword_1009778C8, &stru_100934310);
    sub_10003F924((uint64_t)off_1009778C0, v6, 0, 1u, 0, 0, src);
    uuid_copy(uu, src);
    if (uuid_is_null(uu))
    {
      v32 = (id)qword_1009997F8;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = sub_100021770(v6);
        v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
        *(_DWORD *)src = 138412290;
        v41 = v34;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "No local device found with address %@", src, 0xCu);

      }
    }
    else
    {
      if (qword_1009778B8 != -1)
        dispatch_once(&qword_1009778B8, &stru_100934270);
      v35 = qword_1009778B0;
      v36 = sub_100030DF4(uu);
      v32 = objc_claimAutoreleasedReturnValue(v36);
      sub_100699674(v35, v32);
    }

    goto LABEL_53;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PublicAddress")));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("RandomAddress")));
  v21 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid public address \"%@\" and Invalid random address \"%@\"), v19, v20));

  v22 = qword_1009997F8;
  if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v47 = v21;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Error unpairing Cloud Device: %@", buf, 0xCu);
  }
LABEL_54:

  return v10;
}

- (id)generateKeyDictForTypes:(id)a3 keyLength:(unint64_t)a4 forAddress:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  __int16 v28;
  int __buf;
  _QWORD v30[2];
  _QWORD v31[2];
  uint64_t v32;

  v8 = a3;
  v9 = a5;
  if (!self->_keysGenerated)
  {
    v10 = -[CloudPairing generateKeys](self, "generateKeys");
    v11 = qword_1009997F8;
    if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_ERROR))
      sub_1006FCA2C(v10, v11, v12, v13, v14, v15, v16, v17);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (objc_msgSend(v8, "containsObject:", CFSTR("EncryptionKeys")))
  {
    __buf = 0;
    v28 = 0;
    v31[1] = 0;
    v32 = 0;
    v30[1] = 0;
    v31[0] = 0;
    v30[0] = 0;
    arc4random_buf((char *)&__buf + 2, 2uLL);
    arc4random_buf(&v32, 8uLL);
    if (sub_1001847A4((__int128 *)self->_diversifierHidingKey, &v32, &v28))
    {
      if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_ERROR))
        sub_1006FC9CC();
LABEL_28:
      v26 = 0;
      goto LABEL_29;
    }
    LOWORD(__buf) = HIWORD(__buf) ^ v28;
    if (sub_100184E88((__int128 *)self->_encryptionRootKey, SHIWORD(__buf), 0, v31))
    {
      if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_ERROR))
        sub_1006FC96C();
      goto LABEL_28;
    }
    if (a4 != 16)
      bzero((char *)v31 + a4, 16 - a4);
    if (sub_100184E88((__int128 *)self->_encryptionRootKey, SHIWORD(__buf), 1, v30))
    {
      if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_ERROR))
        sub_1006FC90C();
      goto LABEL_28;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v31, 16));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("LTK"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, CFSTR("LTKLength"));

    objc_msgSend(v18, "setObject:forKeyedSubscript:", &off_100960808, CFSTR("LTKType"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &__buf, 2));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("EDIV"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v32, 8));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v22, CFSTR("RAND"));

  }
  if (objc_msgSend(v8, "containsObject:", CFSTR("PublicKeys")))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", self->_cloudPublicKey, 64));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v23, CFSTR("CloudPublicKey"));

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", self->_cloudNonce, 16));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v24, CFSTR("CloudNonce"));

  }
  if (objc_msgSend(v8, "containsObject:", CFSTR("IdentityKeys")))
  {
    if (v9)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing getIRKForRandomStaticAddress:](self, "getIRKForRandomStaticAddress:", v9));
      if (!v25)
      {
        if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_ERROR))
          sub_1006FC8E0();
        goto LABEL_28;
      }
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v25, CFSTR("IRK"));
    }
    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", self->_identityResolvingKey, 16));
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v25, CFSTR("IRK"));
    }

  }
  v26 = v18;
LABEL_29:

  return v26;
}

- (void)launchCloudPair
{
  -[CloudPairing cloudpairdMsg:args:](self, "cloudpairdMsg:args:", CFSTR("checkIn"), &off_1009610A0);
}

- (id)generateCloudPairingIDWithResponse:(id)a3 localKeys:(id)a4 from:(id)a5 forProtocolID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_100062654;
  v31 = sub_1000623E0;
  v32 = 0;
  v14 = sub_1000419F4();
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1004F4518;
  v21[3] = &unk_100934208;
  v26 = &v27;
  v21[4] = self;
  v15 = v10;
  v22 = v15;
  v16 = v11;
  v23 = v16;
  v17 = v12;
  v24 = v17;
  v18 = v13;
  v25 = v18;
  sub_100475D40(v14, v21);
  v19 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  return v19;
}

- (id)_generateCloudPairingIDWithResponse:(id)a3 localKeys:(id)a4 from:(id)a5 forProtocolID:(id)a6
{
  id v10;
  NSObject *v11;
  id v13;
  id v14;
  id v15;
  uint8_t buf[8];

  v10 = a3;
  v14 = a4;
  v13 = a5;
  v15 = a6;
  if (self->_keysGenerated || -[CloudPairing _generateKeys](self, "_generateKeys"))
  {
    v11 = (id)qword_1009997F8;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Keys available or generated", buf, 2u);
    }

    objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DeviceName")));
    objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RequestedKeyType")));
    objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RequestedKeys")));
    objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("IDSLocalRandomAddress")));
    operator new();
  }
  if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_ERROR))
    sub_1006FCAC0();

  return 0;
}

- (id)readUserPreference:(id)a3
{
  return (id)(id)CFPreferencesCopyValue((CFStringRef)a3, CFSTR("com.apple.CoreBluetooth.cloud"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
}

- (void)setuserPreference:(id)a3 value:(id)a4 sync:(BOOL)a5
{
  __CFString *v7;
  id v8;
  NSObject *v9;
  uint8_t v10[16];

  v7 = (__CFString *)a3;
  v8 = a4;
  CFPreferencesSetValue(v7, v8, CFSTR("com.apple.CoreBluetooth.cloud"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (a5
    && !CFPreferencesSynchronize(CFSTR("com.apple.CoreBluetooth.cloud"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost))
  {
    v9 = qword_1009997F8;
    if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[setSystemPreference] syncs returns false\n", v10, 2u);
    }
  }

}

- (void)removeuserPreference:(id)a3 sync:(BOOL)a4
{
  __CFString *v5;
  NSObject *v6;
  uint8_t v7[16];

  v5 = (__CFString *)a3;
  CFPreferencesSetValue(v5, 0, CFSTR("com.apple.CoreBluetooth.cloud"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (a4
    && !CFPreferencesSynchronize(CFSTR("com.apple.CoreBluetooth.cloud"), kCFPreferencesCurrentUser, kCFPreferencesAnyHost))
  {
    v6 = qword_1009997F8;
    if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[setSystemPreference] syncs returns false\n", v7, 2u);
    }
  }

}

- (id)createBluetoothAddressForIDSLocalDevice:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableDictionary *idsMultiUsersDictionary;
  NSMutableDictionary *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *v19;
  NSObject *v20;
  NSString *publicAddress;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  _BOOL8 v26;
  int v27;
  NSMutableDictionary *v28;
  int __buf;
  __int16 v30;
  _QWORD v31[4];
  id v32;
  _BYTE *v33;
  uint8_t v34[4];
  NSMutableDictionary *v35;
  __int16 v36;
  void *v37;
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  __int128 v41;
  _BYTE buf[24];
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v4 = a3;
  v5 = qword_1009997F8;
  if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
  {
    idsMultiUsersDictionary = self->_idsMultiUsersDictionary;
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = idsMultiUsersDictionary;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MUC - create RSA for local IDS device: %@, current users: %@", buf, 0x16u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v43 = sub_100062654;
  v44 = sub_1000623E0;
  v45 = 0;
  if (!self->_supportsVirtualAddress)
  {
    v9 = 0;
    goto LABEL_7;
  }
  v7 = self->_idsMultiUsersDictionary;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1004F6A5C;
  v31[3] = &unk_100934230;
  v8 = v4;
  v32 = v8;
  v33 = buf;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v7, "enumerateKeysAndObjectsUsingBlock:", v31);
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
LABEL_5:

    v9 = *(void **)(*(_QWORD *)&buf[8] + 40);
LABEL_7:
    v10 = v9;
    goto LABEL_8;
  }
  v30 = 0;
  __buf = 0;
  arc4random_buf(&__buf, 6uLL);
  v12 = __buf | 0xC0;
  LOBYTE(__buf) = __buf | 0xC0;
  v13 = sub_100649588((v12 << 40) | ((unint64_t)BYTE1(__buf) << 32) | ((unint64_t)BYTE2(__buf) << 24) | ((unint64_t)HIBYTE(__buf) << 16) | ((unint64_t)v30 << 8) | HIBYTE(v30));
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = *(void **)(*(_QWORD *)&buf[8] + 40);
  *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v14;

  v16 = qword_1009997F8;
  if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
  {
    v17 = *(NSMutableDictionary **)(*(_QWORD *)&buf[8] + 40);
    *(_DWORD *)v34 = 138412290;
    v35 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "MUC - RSA generated: %@", v34, 0xCu);
  }
  v41 = 0uLL;
  arc4random_buf(&v41, 0x10uLL);
  v40[0] = 0;
  v40[1] = 0;
  if (!sub_100184E88(&v41, 1, 0, v40))
  {
    if (!self->_idsMultiUsersDictionary)
    {
      v18 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 1));
      v19 = self->_idsMultiUsersDictionary;
      self->_idsMultiUsersDictionary = v18;

    }
    v20 = qword_1009997F8;
    if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
    {
      publicAddress = self->_publicAddress;
      *(_DWORD *)v34 = 138412290;
      v35 = (NSMutableDictionary *)publicAddress;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "MUC - local public address %@", v34, 0xCu);
    }
    v38[0] = CFSTR("IDSLocalID");
    v38[1] = CFSTR("IRK");
    v39[0] = v8;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v40, 16));
    v39[1] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v39, v38, 2));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_idsMultiUsersDictionary, "setObject:forKeyedSubscript:", v23, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", self->_idsMultiUsersDictionary, self->_publicAddress));
    -[CloudPairing removeuserPreference:sync:](self, "removeuserPreference:sync:", CFSTR("IDSMultiUsers"), 1);
    -[CloudPairing setuserPreference:value:sync:](self, "setuserPreference:value:sync:", CFSTR("IDSMultiUsers"), v24, 1);
    v25 = (id)qword_1009997F8;
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
    if (v26)
    {
      v27 = IsAppleInternalBuild(v26);
      v28 = v27
          ? self->_idsMultiUsersDictionary
          : (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSMutableDictionary count](self->_idsMultiUsersDictionary, "count")));
      *(_DWORD *)v34 = 138412546;
      v35 = v28;
      v36 = 2112;
      v37 = v24;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "MUC - MUC dictionary = %@, dictToStore %@", v34, 0x16u);
      if (!v27)

    }
    goto LABEL_5;
  }
  if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_ERROR))
    sub_1006FCAEC();

  v10 = 0;
LABEL_8:
  _Block_object_dispose(buf, 8);

  return v10;
}

- (void)resetDataForIDSLocalDevice:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableDictionary *idsMultiUsersDictionary;
  NSMutableDictionary *v7;
  char v8;
  _QWORD v9[4];
  id v10;
  _BYTE *v11;
  _BYTE buf[24];
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v5 = qword_1009997F8;
  if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
  {
    idsMultiUsersDictionary = self->_idsMultiUsersDictionary;
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = idsMultiUsersDictionary;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MUC - Reset data for local IDS device: %@, current users: %@", buf, 0x16u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v13 = sub_100062654;
  v14 = sub_1000623E0;
  v15 = 0;
  if (self->_supportsVirtualAddress)
  {
    v7 = self->_idsMultiUsersDictionary;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1004F6DA0;
    v9[3] = &unk_100934230;
    v10 = v4;
    v11 = buf;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v7, "enumerateKeysAndObjectsUsingBlock:", v9);
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      if (qword_100977C30 != -1)
        dispatch_once(&qword_100977C30, &stru_100934350);
      *((_BYTE *)off_100977C28 + 17000) = 0;
      v8 = 0;
      sub_100043758(&v8);
      sub_100237BCC(0);
      sub_100043728(&v8);
    }

  }
  _Block_object_dispose(buf, 8);

}

- (id)getIRKForRandomStaticAddress:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *idsMultiUsersDictionary;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = sub_100062654;
    v16 = sub_1000623E0;
    v17 = 0;
    idsMultiUsersDictionary = self->_idsMultiUsersDictionary;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1004F6FF4;
    v9[3] = &unk_100934230;
    v10 = v4;
    v11 = &v12;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](idsMultiUsersDictionary, "enumerateKeysAndObjectsUsingBlock:", v9);
    v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)updateRandomAddressContinuityAdvInstance:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  char v8;
  char v9;
  uint8_t buf[4];
  int v11;

  v4 = a3;
  if (v4)
  {
    if (-[CloudPairing multipleAdvInitialized](self, "multipleAdvInitialized"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing getIRKForRandomStaticAddress:](self, "getIRKForRandomStaticAddress:", v4));
      if (v5)
      {
        v9 = 0;
        sub_100043758(&v9);
        sub_100237BCC((__int128 *)objc_msgSend(objc_retainAutorelease(v5), "bytes"));
        v6 = sub_1002241E0();
        v7 = qword_1009997F8;
        if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          v11 = v6;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "MUC - updated RSA adv instance with status: %d", buf, 8u);
        }
        if (v6)
        {
          if (qword_100977C30 != -1)
            dispatch_once(&qword_100977C30, &stru_100934350);
          v8 = 0;
        }
        else
        {
          if (qword_100977C30 != -1)
            dispatch_once(&qword_100977C30, &stru_100934350);
          v8 = 1;
        }
        *((_BYTE *)off_100977C28 + 17000) = v8;
        sub_100043728(&v9);
      }
      else if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_ERROR))
      {
        sub_1006FCB78();
      }

    }
    else if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_ERROR))
    {
      sub_1006FCBD8();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_ERROR))
  {
    sub_1006FCB4C();
  }

}

- (void)updateCurrentIDSUserInfo:(id)a3
{
  unint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  unsigned __int8 v10;
  NSObject *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  NSObject *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  unint64_t v22;

  v4 = (unint64_t)a3;
  v5 = (id)qword_1009997F8;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing currentUserRandomAddress](self, "currentUserRandomAddress"));
    *(_DWORD *)buf = 138412546;
    v20 = v6;
    v21 = 2112;
    v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MUC - update current -> new RSA (%@ - %@)", buf, 0x16u);

  }
  v7 = objc_claimAutoreleasedReturnValue(-[CloudPairing currentUserRandomAddress](self, "currentUserRandomAddress"));
  v8 = (v4 | v7) == 0;

  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing currentUserRandomAddress](self, "currentUserRandomAddress"));
    v10 = objc_msgSend(v9, "isEqualToString:", v4);

    if ((v10 & 1) != 0)
    {
      v11 = qword_1009997F8;
      if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "MUC - same user - don't update", buf, 2u);
      }
    }
    else
    {
      -[CloudPairing setCurrentUserRandomAddress:](self, "setCurrentUserRandomAddress:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing currentUserRandomAddress](self, "currentUserRandomAddress"));
      v13 = v12 == 0;

      if (v13)
      {
        v18 = qword_1009997F8;
        if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "MUC - user has signed out", buf, 2u);
        }
        if (qword_1009778B8 != -1)
          dispatch_once(&qword_1009778B8, &stru_100934270);
        nullsub_90(qword_1009778B0, 0);
        if (qword_100977C30 != -1)
          dispatch_once(&qword_100977C30, &stru_100934350);
        *((_BYTE *)off_100977C28 + 17000) = 0;
        buf[0] = 0;
        sub_100043758(buf);
        sub_100237BCC(0);
        sub_100043728(buf);
      }
      else
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing currentUserRandomAddress](self, "currentUserRandomAddress"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Random %@"), v14));
        v16 = sub_100649C7C(v15);

        if (qword_1009778B8 != -1)
          dispatch_once(&qword_1009778B8, &stru_100934270);
        nullsub_90(qword_1009778B0, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing currentUserRandomAddress](self, "currentUserRandomAddress"));
        -[CloudPairing updateRandomAddressContinuityAdvInstance:](self, "updateRandomAddressContinuityAdvInstance:", v17);

      }
    }
  }

}

- (id)getPairedDeviceForIDSIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_100062654;
  v16 = sub_1000623E0;
  v17 = 0;
  v17 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
  v5 = sub_1000419F4();
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1004F7820;
  v9[3] = &unk_100934100;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  sub_100475D40(v5, v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)_getPairedDeviceForIDSIdentifier:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  NSArray *cloudLocalUUIDs;
  NSMutableDictionary *idsMultiUsersDictionary;
  void *v8;
  const void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _BYTE *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int v24;
  int v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  void *v31;
  id v32;
  id v33;
  id obj;
  void *__p[2];
  char v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  id v43;
  _BYTE *v44;
  uint8_t v45[128];
  uint8_t v46[4];
  void *v47;
  _BYTE buf[24];
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;

  v32 = a3;
  v33 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (qword_1009778B8 != -1)
    dispatch_once(&qword_1009778B8, &stru_100934270);
  v3 = sub_10006A768(qword_1009778B0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v4));

  v5 = qword_1009997F8;
  if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
  {
    cloudLocalUUIDs = self->_cloudLocalUUIDs;
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v31;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = cloudLocalUUIDs;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MUC - Paired devices: %@, cloud local paired %@", buf, 0x16u);
  }
  if (v32 && self->_supportsVirtualAddress)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v49 = sub_100062654;
    v50 = sub_1000623E0;
    v51 = 0;
    idsMultiUsersDictionary = self->_idsMultiUsersDictionary;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_1004F7FA8;
    v42[3] = &unk_100934230;
    v43 = v32;
    v44 = buf;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](idsMultiUsersDictionary, "enumerateKeysAndObjectsUsingBlock:", v42);
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Random %@"), *(_QWORD *)(*(_QWORD *)&buf[8] + 40)));
      v9 = (const void *)sub_100649C7C(v8);

      v10 = sub_1002FC5A4(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allKeys"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v12));
      objc_msgSend(v31, "unionSet:", v13);

      v14 = qword_1009997F8;
      if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v46 = 138412290;
        v47 = v31;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "MUC - All paired devices: %@", v46, 0xCu);
      }

    }
    _Block_object_dispose(buf, 8);

  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v31;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v39;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v39 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)v17);
        v19 = qword_1009997F8;
        if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v18;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "MUC - Checking %@", buf, 0xCu);
        }
        if (qword_1009778C8 != -1)
          dispatch_once(&qword_1009778C8, &stru_100934310);
        sub_1006594CC((uint64_t)off_1009778C0, v18, (uint64_t)buf);
        if ((buf[23] & 0x80000000) != 0)
        {
          v27 = *(_QWORD *)&buf[8];
          operator delete(*(void **)buf);
          if (v27)
          {
LABEL_23:
            if (qword_1009778C8 != -1)
              dispatch_once(&qword_1009778C8, &stru_100934310);
            sub_1006594CC((uint64_t)off_1009778C0, v18, (uint64_t)buf);
            if (buf[23] >= 0)
              v20 = buf;
            else
              v20 = *(_BYTE **)buf;
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v20));
            if ((buf[23] & 0x80000000) != 0)
              operator delete(*(void **)buf);
            v22 = qword_1009997F8;
            if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v21;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "MUC - Cloud identifier %@", buf, 0xCu);
            }
            if (self->_supportsVirtualAddress)
            {
              if (qword_1009778C8 != -1)
                dispatch_once(&qword_1009778C8, &stru_100934310);
              v23 = off_1009778C0;
              sub_100091AE8(__p, "PairingAttemptedUsingRSA");
              v24 = sub_10000628C((uint64_t)v23, v18, (uint64_t)__p);
              v25 = v24;
              if ((v37 & 0x80000000) == 0)
              {
                if (v24)
                  goto LABEL_37;
LABEL_43:
                v29 = qword_1009997F8;
                if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  *(_QWORD *)&buf[4] = v18;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v21;
                  _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "MUC - Upgrade keys for BTUUID %@ iCloud %@ using RSA", buf, 0x16u);
                }
LABEL_45:

                goto LABEL_46;
              }
              operator delete(__p[0]);
              if (!v25)
                goto LABEL_43;
            }
LABEL_37:
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "UUIDString"));
            objc_msgSend(v33, "setObject:forKey:", v21, v26);

            goto LABEL_45;
          }
        }
        else if (buf[23])
        {
          goto LABEL_23;
        }
        v28 = qword_1009997F8;
        if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v18;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "MUC - Not a cloud paired device %@", buf, 0xCu);
        }
LABEL_46:
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    }
    while (v15);
  }

  return v33;
}

- (void)sendCloudpairingRetry:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  xpc_object_t v10;
  void *v11;
  _xpc_connection_s *v12;
  int v13;
  id v14;

  v4 = a3;
  if (-[CloudPairing isRunningInRecovery](self, "isRunningInRecovery"))
  {
    v5 = qword_1009997F8;
    if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CP: Not Available to retry", (uint8_t *)&v13, 2u);
    }
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing serverConnection](self, "serverConnection"));

    if (!v6)
      -[CloudPairing resetServerConnection](self, "resetServerConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudPairing serverConnection](self, "serverConnection"));
    if (v7)
    {
      v8 = objc_msgSend(v4, "count");

      if (v8)
      {
        v9 = qword_1009997F8;
        if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
        {
          v13 = 138477827;
          v14 = v4;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Send Cloud Pairing Retry for %{private}@", (uint8_t *)&v13, 0xCu);
        }
        v10 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_string(v10, "kMsgId", "cloudpairingRetry");
        v11 = (void *)_CFXPCCreateXPCObjectFromCFObject(v4);
        xpc_dictionary_set_value(v10, "kMsgArgs", v11);
        v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[CloudPairing serverConnection](self, "serverConnection"));
        xpc_connection_send_message(v12, v10);

      }
    }
  }

}

- (void)startListeningToPowerUIStatusChanges
{
  id v3;
  id v4;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "audioAccessorySmartChargeStatusHasChangedFromNotification:", PowerUIAudioAccessorySmartChargeStatusHasChangedNote, 0);

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "audioAccessorySmartChargeDeadlineHasChangedFromNotification:", PowerUIAudioAccessorySmartChargeDeadlineHasChangedNote, 0);

}

- (void)stopListeningToPowerUIStatusChanges
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)audioAccessorySmartChargeStatusHasChangedFromNotification:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "object"));
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc((Class)PowerUISmartChargeClientAudioAccessories), "initWithClientName:", CFSTR("com.apple.bluetooth"));
    v13 = 0;
    v6 = objc_msgSend(v5, "isSmartChargingCurrentlyEnabledForDevice:withError:", v4, &v13);
    v7 = v13;
    v8 = qword_1009997F8;
    if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v15 = v4;
      v16 = 2048;
      v17 = v6;
      v18 = 2112;
      v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PowerUI config values changed for device %@, isSmartChargingCurrentlyEnabledForDevice %lu, error %@", buf, 0x20u);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Public %@"), v4));
    v10 = sub_100649C7C(v9);

    if (qword_1009778E8 != -1)
      dispatch_once(&qword_1009778E8, &stru_100934290);
    v11 = sub_10006D488((uint64_t)off_1009778E0, v10, 1);
    v12 = v11;
    if (v11)
    {
      if ((id)sub_100451750(v11) != v6)
      {
        sub_100451548(v12, (uint64_t)v6);
        if (qword_100977A68 != -1)
          dispatch_once(&qword_100977A68, &stru_1009342B0);
        (*(void (**)(void *, uint64_t, uint64_t))(*(_QWORD *)off_100977A60 + 112))(off_100977A60, v12, 4101);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_ERROR))
    {
      sub_1006FCC30();
    }

  }
  else if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_ERROR))
  {
    sub_1006FCC04();
  }

}

- (void)audioAccessorySmartChargeDeadlineHasChangedFromNotification:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  double v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "object"));
  v5 = objc_msgSend(objc_alloc((Class)PowerUISmartChargeClientAudioAccessories), "initWithClientName:", CFSTR("com.apple.bluetooth"));
  v16 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "unfilteredDeadlineForDevice:withError:", v4, &v16));
  v7 = v16;
  v8 = qword_1009997F8;
  if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v18 = v4;
    v19 = 2112;
    v20 = v6;
    v21 = 2112;
    v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PowerUI config values changed for device %@, fullChargeDeadlineForDevice %@ error %@", buf, 0x20u);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Public %@"), v4));
  v10 = sub_100649C7C(v9);

  if (qword_1009778E8 != -1)
    dispatch_once(&qword_1009778E8, &stru_100934290);
  v11 = sub_10006D488((uint64_t)off_1009778E0, v10, 1);
  v12 = v11;
  if (v11)
  {
    v13 = sub_100451794(v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (!v14 || (objc_msgSend(v6, "timeIntervalSinceDate:", v14), v15 > 0.0))
    {
      sub_100451628(v12, v6);
      if (qword_100977A68 != -1)
        dispatch_once(&qword_100977A68, &stru_1009342B0);
      (*(void (**)(void *, uint64_t, uint64_t))(*(_QWORD *)off_100977A60 + 112))(off_100977A60, v12, 4101);
    }

  }
  else if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_ERROR))
  {
    sub_1006FCC30();
  }

}

- (void)audioAccessorySmartChargeStatusHasChangedFromCloud:(void *)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;

  if (_os_feature_enabled_impl("PowerUI", "audioAccessoryOBC")
    && NSClassFromString(CFSTR("PowerUISmartChargeClientAudioAccessories")))
  {
    v4 = objc_msgSend(objc_alloc((Class)PowerUISmartChargeClientAudioAccessories), "initWithClientName:", CFSTR("com.apple.bluetooth"));
    v5 = sub_100649588(((unint64_t)*((unsigned __int8 *)a3 + 128) << 40) | ((unint64_t)*((unsigned __int8 *)a3 + 129) << 32) | ((unint64_t)*((unsigned __int8 *)a3 + 130) << 24) | ((unint64_t)*((unsigned __int8 *)a3 + 131) << 16) | ((unint64_t)*((unsigned __int8 *)a3 + 132) << 8) | *((unsigned __int8 *)a3 + 133));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = sub_100451750((uint64_t)a3);
    switch(v7)
    {
      case 0:
        v14 = 0;
        objc_msgSend(v4, "disableSmartChargingForDevice:withError:", v6, &v14);
        v8 = v14;
        goto LABEL_11;
      case 1:
        v13 = 0;
        objc_msgSend(v4, "enableSmartChargingForDevice:withError:", v6, &v13);
        v8 = v13;
        goto LABEL_11;
      case 2:
        v12 = 0;
        objc_msgSend(v4, "temporarilyEnableChargingForDevice:withError:", v6, &v12);
        v8 = v12;
        goto LABEL_11;
      case 3:
        v11 = 0;
        objc_msgSend(v4, "temporarilyDisableSmartChargingForDevice:withError:", v6, &v11);
        v8 = v11;
LABEL_11:
        v9 = v8;
        break;
      default:
        if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_ERROR))
          sub_1006FCC90();
        v9 = 0;
        break;
    }
    v10 = qword_1009997F8;
    if (os_log_type_enabled((os_log_t)qword_1009997F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v16 = v6;
      v17 = 2048;
      v18 = v7;
      v19 = 2112;
      v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "audioAccessorySmartChargeStatusHasChangedFromCloud for %@ to state %lu with error %@", buf, 0x20u);
    }

  }
}

- (void)audioAccessorySmartChargeDeadlineHasChangedFromCloud:(void *)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;

  if (_os_feature_enabled_impl("PowerUI", "audioAccessoryOBC")
    && NSClassFromString(CFSTR("PowerUISmartChargeClientAudioAccessories")))
  {
    v4 = objc_msgSend(objc_alloc((Class)PowerUISmartChargeClientAudioAccessories), "initWithClientName:", CFSTR("com.apple.bluetooth"));
    v5 = sub_100649588(((unint64_t)*((unsigned __int8 *)a3 + 128) << 40) | ((unint64_t)*((unsigned __int8 *)a3 + 129) << 32) | ((unint64_t)*((unsigned __int8 *)a3 + 130) << 24) | ((unint64_t)*((unsigned __int8 *)a3 + 131) << 16) | ((unint64_t)*((unsigned __int8 *)a3 + 132) << 8) | *((unsigned __int8 *)a3 + 133));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = sub_100451794((uint64_t)a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v13 = 0;
    objc_msgSend(v4, "updateOBCDeadline:forDevice:withError:", v8, v6, &v13);
    v9 = v13;

    v10 = (id)qword_1009997F8;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = sub_100451794((uint64_t)a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      *(_DWORD *)buf = 138412802;
      v15 = v6;
      v16 = 2112;
      v17 = v12;
      v18 = 2112;
      v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "audioAccessorySmartChargeDeadlineHasChangedFromCloud for %@ to date %@ with error %@", buf, 0x20u);

    }
  }
}

- (NSArray)associatedDevices
{
  return self->_associatedDevices;
}

- (void)setAssociatedDevices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSMutableArray)cloudDevices
{
  return self->_cloudDevices;
}

- (void)setCloudDevices:(id)a3
{
  objc_storeStrong((id *)&self->_cloudDevices, a3);
}

- (NSMutableArray)cloudUploadedKeys
{
  return self->_cloudUploadedKeys;
}

- (void)setCloudUploadedKeys:(id)a3
{
  objc_storeStrong((id *)&self->_cloudUploadedKeys, a3);
}

- (NSString)publicAddress
{
  return self->_publicAddress;
}

- (void)setPublicAddress:(id)a3
{
  objc_storeStrong((id *)&self->_publicAddress, a3);
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

- (unint64_t)keyLength
{
  return self->_keyLength;
}

- (NSArray)cloudLocalUUIDs
{
  return self->_cloudLocalUUIDs;
}

- (NSArray)cloudidsIdentifiers
{
  return self->_cloudidsIdentifiers;
}

- (OS_xpc_object)serverConnection
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 336, 1);
}

- (void)setServerConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (OS_dispatch_queue)serialQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 344, 1);
}

- (void)setSerialQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (BOOL)iCloudSignedIn
{
  return self->_iCloudSignedIn;
}

- (void)setICloudSignedIn:(BOOL)a3
{
  self->_iCloudSignedIn = a3;
}

- (BOOL)accessibilityHeadTrackingEnabled
{
  return self->_accessibilityHeadTrackingEnabled;
}

- (void)setAccessibilityHeadTrackingEnabled:(BOOL)a3
{
  self->_accessibilityHeadTrackingEnabled = a3;
}

- (BOOL)supportsVirtualAddress
{
  return self->_supportsVirtualAddress;
}

- (void)setSupportsVirtualAddress:(BOOL)a3
{
  self->_supportsVirtualAddress = a3;
}

- (NSMutableDictionary)idsMultiUsersDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 352, 1);
}

- (void)setIdsMultiUsersDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (NSString)currentIDSUser
{
  return (NSString *)objc_getProperty(self, a2, 360, 1);
}

- (void)setCurrentIDSUser:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 360);
}

- (NSString)currentUserRandomAddress
{
  return (NSString *)objc_getProperty(self, a2, 368, 1);
}

- (void)setCurrentUserRandomAddress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 368);
}

- (BOOL)multipleAdvInitialized
{
  return self->_multipleAdvInitialized;
}

- (void)setMultipleAdvInitialized:(BOOL)a3
{
  self->_multipleAdvInitialized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUserRandomAddress, 0);
  objc_storeStrong((id *)&self->_currentIDSUser, 0);
  objc_storeStrong((id *)&self->_idsMultiUsersDictionary, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_storeStrong((id *)&self->_cloudidsIdentifiers, 0);
  objc_storeStrong((id *)&self->_cloudLocalUUIDs, 0);
  objc_storeStrong((id *)&self->_requestedKeyTypes, 0);
  objc_storeStrong((id *)&self->_localDeviceName, 0);
  objc_storeStrong((id *)&self->_publicAddress, 0);
  objc_storeStrong((id *)&self->_cloudUploadedKeys, 0);
  objc_storeStrong((id *)&self->_cloudDevices, 0);
  objc_storeStrong((id *)&self->_associatedDevices, 0);
  objc_storeStrong((id *)&self->_cloudKitConnection, 0);
}

@end
