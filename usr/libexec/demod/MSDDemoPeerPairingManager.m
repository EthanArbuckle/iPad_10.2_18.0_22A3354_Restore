@implementation MSDDemoPeerPairingManager

+ (id)sharedInstance
{
  if (qword_1001752E0 != -1)
    dispatch_once(&qword_1001752E0, &stru_10013E718);
  return (id)qword_1001752E8;
}

- (void)preservePairedPeersData
{
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  unsigned __int8 v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerPairingManager: Preserving paired peers data from system.", buf, 2u);
  }

  if (objc_msgSend(v3, "fileExistsAtPath:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/PairingRecords.data")))
  {
    v6 = sub_1000604F0();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerPairingManager: Deleting existing pairing data file.", buf, 2u);
    }

    v22 = 0;
    v8 = objc_msgSend(v3, "removeItemAtPath:error:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/PairingRecords.data"), &v22);
    v9 = v22;
    if ((v8 & 1) == 0)
    {
      v10 = sub_1000604F0();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_1000BD82C();

    }
  }
  else
  {
    v9 = 0;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerPairingManager _readPairedPeersIntoData](self, "_readPairedPeersIntoData"));
  if (!v12)
  {
    v17 = sub_1000604F0();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1000BD774();
    goto LABEL_19;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MSDCryptoHandler sharedInstance](MSDCryptoHandler, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "performCryptoWithSecretKeyOnData:isDecipher:", v12, 0));

  if (!v14)
  {
    v19 = sub_1000604F0();
    v18 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1000BD7A0();
LABEL_19:
    v14 = 0;
LABEL_23:

    v16 = v9;
    goto LABEL_14;
  }
  v21 = v9;
  v15 = objc_msgSend(v14, "writeToFile:options:error:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/PairingRecords.data"), 0, &v21);
  v16 = v21;

  if ((v15 & 1) == 0)
  {
    v20 = sub_1000604F0();
    v18 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1000BD7CC();
    v9 = v16;
    goto LABEL_23;
  }
LABEL_14:

}

- (void)restorePairedPeersDataIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerPairingManager: Restoring paired peers data to system.", buf, 2u);
  }

  if ((objc_msgSend(v4, "fileExistsAtPath:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/PairingRecords.data")) & 1) == 0)
  {
    v15 = sub_1000604F0();
    v14 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerPairingManager: No encrypted paired peers data file found.", buf, 2u);
    }
    v12 = 0;
    v10 = 0;
    v7 = 0;
    goto LABEL_13;
  }
  v20 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/PairingRecords.data"), 0, &v20));
  v8 = v20;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDCryptoHandler sharedInstance](MSDCryptoHandler, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "performCryptoWithSecretKeyOnData:isDecipher:", v7, 1));

    if (v10)
    {
      -[MSDDemoPeerPairingManager _restorePairedPeersFromData:](self, "_restorePairedPeersFromData:", v10);
      goto LABEL_7;
    }
    v18 = sub_1000604F0();
    v17 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1000BD8EC();
  }
  else
  {
    v16 = sub_1000604F0();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_1000BD88C();
  }

  v10 = 0;
LABEL_7:
  v19 = v8;
  v11 = objc_msgSend(v4, "removeItemAtPath:error:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/PairingRecords.data"), &v19);
  v12 = v19;

  if ((v11 & 1) == 0)
  {
    v13 = sub_1000604F0();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1000BD82C();
LABEL_13:

  }
}

- (void)updateDeviceNameForPairedPeerOfUUID:(id)a3 withNewName:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = sub_1000604F0();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543618;
    v15 = v7;
    v16 = 2114;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerPairingManager: Assign new name '%{public}@' to paired peer '%{public}@'", (uint8_t *)&v14, 0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerPairingManager _findPairedPeerWithUUID:](self, "_findPairedPeerWithUUID:", v6));
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "setName:", v7);
    -[MSDDemoPeerPairingManager _savePairedPeer:](self, "_savePairedPeer:", v11);
  }
  else
  {
    v12 = sub_1000604F0();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000BD918();

  }
}

- (void)removePairedPeer:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  id v8;
  NSObject *v9;
  void *v10;
  dispatch_semaphore_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  dispatch_time_t v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  id *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  id obj;
  _QWORD v27[4];
  id v28;
  NSObject *v29;
  __int128 *p_buf;
  id v31;
  __int128 buf;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = sub_1000604F0();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerPairingManager: Remove paired peer with ID '%{public}@'", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v33 = 0x3032000000;
  v34 = sub_10003E850;
  v35 = sub_10003E860;
  v36 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerPairingManager _findPairedPeerWithUUID:](self, "_findPairedPeerWithUUID:", v6));
  if (v10)
  {
    v11 = dispatch_semaphore_create(0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerPairingManager pairingManager](self, "pairingManager"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10003E868;
    v27[3] = &unk_10013E740;
    p_buf = &buf;
    v13 = v10;
    v28 = v13;
    v14 = v11;
    v29 = v14;
    objc_msgSend(v12, "removePairedPeer:options:completion:", v13, 4, v27);

    v15 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v14, v15))
    {
      v16 = sub_1000604F0();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_1000BD9A4((uint64_t)v13, v17, v18);

      v19 = (id *)(*((_QWORD *)&buf + 1) + 40);
      obj = *(id *)(*((_QWORD *)&buf + 1) + 40);
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Timeout 5 seconds to remove peer '%@'"), v13));
      sub_1000B63E4(&obj, 3727741111, (uint64_t)CFSTR("Peer removal timeout"), (uint64_t)v20);
      objc_storeStrong(v19, obj);

    }
    v21 = v28;
  }
  else
  {
    v22 = sub_1000604F0();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_1000BD944();

    v24 = *((_QWORD *)&buf + 1);
    v31 = *(id *)(*((_QWORD *)&buf + 1) + 40);
    v14 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to find peer with ID '%@'"), v6));
    sub_1000B63E4(&v31, 3727741104, (uint64_t)CFSTR("Cannot find specified demo peer."), (uint64_t)v14);
    v25 = v31;
    v21 = *(void **)(v24 + 40);
    *(_QWORD *)(v24 + 40) = v25;
  }

  v7[2](v7, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
  _Block_object_dispose(&buf, 8);

}

- (BOOL)_setupPairingManagerIfNeeded
{
  void *v3;
  BOOL v4;
  id v5;
  dispatch_queue_global_t global_queue;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerPairingManager pairingManager](self, "pairingManager"));

  if (v3)
    return 1;
  objc_initWeak(&location, self);
  v5 = objc_alloc_init((Class)CUPairingManager);
  -[MSDDemoPeerPairingManager setPairingManager:](self, "setPairingManager:", v5);

  global_queue = dispatch_get_global_queue(21, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerPairingManager pairingManager](self, "pairingManager"));
  objc_msgSend(v8, "setDispatchQueue:", v7);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003EAB0;
  v15[3] = &unk_10013D840;
  objc_copyWeak(&v16, &location);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerPairingManager pairingManager](self, "pairingManager"));
  objc_msgSend(v9, "setInterruptionHandler:", v15);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003EB18;
  v13[3] = &unk_10013D840;
  objc_copyWeak(&v14, &location);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerPairingManager pairingManager](self, "pairingManager"));
  objc_msgSend(v10, "setInvalidationHandler:", v13);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerPairingManager pairingManager](self, "pairingManager"));
  v4 = v11 != 0;

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  return v4;
}

- (id)_getAllPairedPeers
{
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  id v7;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  NSObject *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v3 = dispatch_semaphore_create(0);
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_10003E850;
  v31 = sub_10003E860;
  v32 = 0;
  v24 = 0;
  v25[0] = &v24;
  v25[1] = 0x3032000000;
  v25[2] = sub_10003E850;
  v25[3] = sub_10003E860;
  v26 = 0;
  if (!-[MSDDemoPeerPairingManager _setupPairingManagerIfNeeded](self, "_setupPairingManagerIfNeeded"))
  {
    v9 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1000BDB8C();

    goto LABEL_14;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerPairingManager pairingManager](self, "pairingManager"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10003ED94;
  v20[3] = &unk_10013E768;
  v22 = &v27;
  v23 = &v24;
  v5 = v3;
  v21 = v5;
  objc_msgSend(v4, "getPairedPeersWithOptions:completion:", 134, v20);

  v6 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    v11 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1000BDB60();
    goto LABEL_13;
  }
  if (!v28[5])
  {
    v13 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1000BDAF4((uint64_t)v25, v12, v14, v15, v16, v17, v18, v19);
LABEL_13:

LABEL_14:
    v7 = 0;
    goto LABEL_5;
  }

  v7 = (id)v28[5];
LABEL_5:
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v27, 8);
  return v7;
}

- (BOOL)_savePairedPeer:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  BOOL v9;
  NSObject *v10;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  _QWORD v16[4];
  NSObject *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_10003E850;
  v23 = sub_10003E860;
  v24 = 0;
  if (-[MSDDemoPeerPairingManager _setupPairingManagerIfNeeded](self, "_setupPairingManagerIfNeeded"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerPairingManager pairingManager](self, "pairingManager"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10003F00C;
    v16[3] = &unk_10013DA58;
    v18 = &v19;
    v7 = v5;
    v17 = v7;
    objc_msgSend(v6, "savePairedPeer:options:completion:", v4, 5, v16);

    v8 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v7, v8))
    {
      v13 = sub_1000604F0();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_1000BDC34();
    }
    else
    {
      if (!v20[5])
      {
        v9 = 1;
LABEL_5:
        v10 = v17;
        goto LABEL_6;
      }
      v15 = sub_1000604F0();
      v14 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_1000BDBB8();
    }

    v9 = 0;
    goto LABEL_5;
  }
  v12 = sub_1000604F0();
  v10 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_1000BDB8C();
  v9 = 0;
LABEL_6:

  _Block_object_dispose(&v19, 8);
  return v9;
}

- (id)_findPairedPeerWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerPairingManager _getAllPairedPeers](self, "_getAllPairedPeers"));
  v6 = v5;
  if (v5)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier", (_QWORD)v16));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
          v14 = objc_msgSend(v13, "isEqualToString:", v4);

          if (v14)
          {
            v8 = v11;
            goto LABEL_12;
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_readPairedPeersIntoData
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  id v9;
  id v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoPeerPairingManager _getAllPairedPeers](self, "_getAllPairedPeers"));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "enumerateObjectsUsingBlock:", &stru_10013E7A8);
    v10 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v10));
    v5 = v10;
    if (v4)
    {
      v6 = v4;
      v7 = v5;
      v5 = v6;
    }
    else
    {
      v9 = sub_1000604F0();
      v7 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_1000BDC60();
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_restorePairedPeersFromData:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];

  v22 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchiveTopLevelObjectWithData:error:](NSKeyedUnarchiver, "unarchiveTopLevelObjectWithData:error:", a3, &v22));
  v5 = v22;
  if (v4)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = v4;
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
    if (v7)
    {
      v8 = v7;
      v16 = v5;
      v17 = v4;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          v12 = sub_1000604F0();
          v13 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "detailedDescription"));
            *(_DWORD *)buf = 138543362;
            v24 = v14;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "MSDDemoPeerPairingManager: Saving paired peer: %{public}@", buf, 0xCu);

          }
          -[MSDDemoPeerPairingManager _savePairedPeer:](self, "_savePairedPeer:", v11);
        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
      }
      while (v8);
      v5 = v16;
      v4 = v17;
    }
  }
  else
  {
    v15 = sub_1000604F0();
    v6 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1000BDCC0();
  }

}

- (CUPairingManager)pairingManager
{
  return self->_pairingManager;
}

- (void)setPairingManager:(id)a3
{
  objc_storeStrong((id *)&self->_pairingManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingManager, 0);
}

@end
