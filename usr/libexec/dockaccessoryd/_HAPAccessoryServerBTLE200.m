@implementation _HAPAccessoryServerBTLE200

- (_HAPAccessoryServerBTLE200)initWithPeripheral:(id)a3 name:(id)a4 pairingUsername:(id)a5 statusFlags:(id)a6 stateNumber:(id)a7 enhancedEncryption:(BOOL)a8 connectReason:(unsigned __int8)a9 configNumber:(id)a10 category:(id)a11 setupHash:(id)a12 connectionIdleTime:(unsigned __int8)a13 browser:(id)a14 keyStore:(id)a15 whbStableIdentifier:(id)a16
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  _HAPAccessoryServerBTLE200 *v32;
  uint64_t v33;
  HAPCharacteristic *pairingsCharacteristic;
  uint64_t v35;
  NSOperationQueue *requestOperationQueue;
  uint64_t v37;
  NSMutableArray *pendingResponses;
  uint64_t v39;
  NSMapTable *characteristicWriteCompletionHandlers;
  uint64_t v41;
  NSMapTable *characteristicEnableEventCompletionHandlers;
  id v43;
  id v44;
  NSString *v45;
  void *v46;
  id v47;
  id v48;
  NSString *v49;
  void *v50;
  id v51;
  id connectionCompletionHandler;
  id v53;
  void *v54;
  void *v55;
  HAPBLEPeripheralInfo *v56;
  void *v57;
  double Current;
  void *v59;
  HAPBLEPeripheralInfo *v60;
  HAPBLEAccessoryCache *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  HAPBLEPeripheralInfo *v67;
  void *v68;
  unsigned __int8 v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  char v75;
  HAPBLEAccessoryCache *v76;
  HAPBLEAccessoryCache *v77;
  void *connectionState;
  HAPBLEAccessoryCache *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  id v84;
  id v85;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  id v91;
  void *v92;
  void *v93;
  id v94;
  void *v96;
  void *v97;
  _BOOL4 v98;
  id v99;
  void *v100;
  _QWORD v101[4];
  id v102;
  id location;
  objc_super v104;

  v98 = a8;
  v20 = a3;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  v24 = a7;
  v25 = a10;
  v26 = v23;
  v27 = a11;
  v28 = a12;
  v29 = a14;
  v30 = v27;
  v31 = a15;
  v104.receiver = self;
  v104.super_class = (Class)_HAPAccessoryServerBTLE200;
  v94 = a16;
  v96 = v31;
  v100 = v20;
  v32 = -[HAPAccessoryServerBTLE initWithPeripheral:name:pairingUsername:statusFlags:stateNumber:enhancedEncryption:connectReason:configNumber:category:setupHash:connectionIdleTime:browser:keyStore:whbStableIdentifier:](&v104, "initWithPeripheral:name:pairingUsername:statusFlags:stateNumber:enhancedEncryption:connectReason:configNumber:category:setupHash:connectionIdleTime:browser:keyStore:whbStableIdentifier:", v20, v21, v22, v26, v24, v98, a9, v25, v30, v28, a13, v29, v31, v94);
  if (!v32)
    goto LABEL_13;
  v90 = v21;
  v91 = v28;
  v97 = v30;
  v33 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  pairingsCharacteristic = v32->_pairingsCharacteristic;
  v32->_pairingsCharacteristic = (HAPCharacteristic *)v33;

  v35 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  requestOperationQueue = v32->_requestOperationQueue;
  v32->_requestOperationQueue = (NSOperationQueue *)v35;

  v37 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
  pendingResponses = v32->_pendingResponses;
  v32->_pendingResponses = (NSMutableArray *)v37;

  v39 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
  characteristicWriteCompletionHandlers = v32->_characteristicWriteCompletionHandlers;
  v32->_characteristicWriteCompletionHandlers = (NSMapTable *)v39;

  v41 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  characteristicEnableEventCompletionHandlers = v32->_characteristicEnableEventCompletionHandlers;
  v32->_characteristicEnableEventCompletionHandlers = (NSMapTable *)v41;

  v32->_badPairSetupCode = v98;
  v32->_hasBeenDiscovered = 0;
  v32->_verified = 0;
  v43 = objc_alloc_init((Class)NSOperationQueue);
  v99 = v22;
  v93 = v29;
  v44 = v25;
  v45 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), sub_100015E90(v32, CFSTR("requestOperationQueue")));
  v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
  objc_msgSend(v43, "setName:", v46);

  objc_msgSend(v43, "setMaxConcurrentOperationCount:", 1);
  objc_msgSend(v43, "setQualityOfService:", 25);
  v87 = v43;
  objc_storeStrong((id *)&v32->_pendingRequests, v43);
  v47 = objc_alloc_init((Class)NSOperationQueue);
  v48 = v24;
  v49 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), sub_100015E90(v32, CFSTR("securitySessionOperationQueue")));
  v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
  objc_msgSend(v47, "setName:", v50);

  objc_msgSend(v47, "setMaxConcurrentOperationCount:", 1);
  objc_msgSend(v47, "setQualityOfService:", 25);
  objc_storeStrong((id *)&v32->_pairVerifyCharacteristic, v47);
  v51 = objc_msgSend(objc_alloc((Class)HMFTimer), "initWithTimeInterval:options:", 0, 15.0);
  connectionCompletionHandler = v32->_connectionCompletionHandler;
  v32->_connectionCompletionHandler = v51;

  objc_msgSend(v32->_connectionCompletionHandler, "setDelegate:", v32);
  v53 = v32->_connectionCompletionHandler;
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](v32, "clientQueue"));
  objc_msgSend(v53, "setDelegateQueue:", v54);

  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "cbPeripheral"));
  objc_msgSend(v55, "setDelegate:", v32);

  v56 = [HAPBLEPeripheralInfo alloc];
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "uniqueBTIdentifier"));
  Current = CFAbsoluteTimeGetCurrent();
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "name"));
  v92 = v44;
  v88 = v48;
  v89 = v26;
  v60 = -[HAPBLEPeripheralInfo initWithPeripheralInfo:advertisedProtocolVersion:previousProtocolVersion:resumeSessionId:lastSeen:statusFlags:stateNumber:configNumber:categoryIdentifier:accessoryName:](v56, "initWithPeripheralInfo:advertisedProtocolVersion:previousProtocolVersion:resumeSessionId:lastSeen:statusFlags:stateNumber:configNumber:categoryIdentifier:accessoryName:", v57, 2, 2, 0, v26, v48, Current, v44, v30, v59);

  v61 = (HAPBLEAccessoryCache *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "cachedAccessoryForIdentifier:", v22));
  v62 = objc_claimAutoreleasedReturnValue(-[HAPBLEAccessoryCache metadataVersion](v61, "metadataVersion"));
  if (!v62)
    goto LABEL_8;
  v63 = (void *)v62;
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEAccessoryCache cachedServices](v61, "cachedServices"));
  v65 = objc_msgSend(v64, "count");
  if (!v92 || !v65)
  {

    goto LABEL_8;
  }
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEAccessoryCache peripheralInfo](v61, "peripheralInfo"));
  v67 = v60;
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "configNumber"));
  v69 = objc_msgSend(v68, "isEqual:", v92);

  v60 = v67;
  v22 = v99;

  if ((v69 & 1) == 0)
  {
LABEL_8:
    objc_initWeak(&location, v32);
    v76 = [HAPBLEAccessoryCache alloc];
    v101[0] = _NSConcreteStackBlock;
    v101[1] = 3221225472;
    v101[2] = sub_100049A90;
    v101[3] = &unk_100237310;
    objc_copyWeak(&v102, &location);
    v28 = v91;
    v77 = -[HAPBLEAccessoryCache initWithPairingIdentifier:saveBlock:](v76, "initWithPairingIdentifier:saveBlock:", v22, v101);

    objc_destroyWeak(&v102);
    objc_destroyWeak(&location);
    v75 = 0;
    v61 = v77;
    goto LABEL_9;
  }
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEAccessoryCache peripheralInfo](v61, "peripheralInfo"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "broadcastKey"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEAccessoryCache peripheralInfo](v61, "peripheralInfo"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "keyUpdatedStateNumber"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEAccessoryCache peripheralInfo](v61, "peripheralInfo"));
  objc_msgSend(v74, "keyUpdatedTime");
  -[HAPBLEPeripheralInfo saveBroadcastKey:keyUpdatedStateNumber:updatedTime:](v67, "saveBroadcastKey:keyUpdatedStateNumber:updatedTime:", v71, v73);

  v60 = v67;
  v75 = 1;
  v28 = v91;
LABEL_9:
  -[HAPBLEAccessoryCache updateWithPeripheralInfo:](v61, "updateWithPeripheralInfo:", v60);
  BYTE4(v32->super._blePeripheral) = v75;
  connectionState = (void *)v32->_connectionState;
  v32->_connectionState = (int64_t)v61;
  v79 = v61;

  v80 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEAccessoryCache peripheralInfo](v79, "peripheralInfo"));
  v81 = objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "accessoryName"));
  v82 = (void *)v81;
  v21 = v90;
  if (v81)
    v83 = (void *)v81;
  else
    v83 = v90;
  objc_storeStrong((id *)&v32->super.super._name, v83);

  v84 = objc_alloc((Class)HMFVersion);
  v85 = objc_msgSend(v84, "initWithMajorVersion:minorVersion:updateVersion:", 2, 0, 0);
  -[HAPAccessoryServer setVersion:](v32, "setVersion:", v85);

  -[_HAPAccessoryServerBTLE200 _createPrimaryAccessoryFromAdvertisementData](v32, "_createPrimaryAccessoryFromAdvertisementData");
  v30 = v97;
  v22 = v99;
  v24 = v88;
  v26 = v89;
  v25 = v92;
  v29 = v93;
LABEL_13:

  return v32;
}

- (void)_resetWithError:(id)a3
{
  id v4;
  _HAPAccessoryServerBTLE200 *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  void (**v23)(_QWORD, _QWORD);
  _HAPAccessoryServerBTLE200 *v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  void *j;
  void *v37;
  void *v38;
  void (**v39)(_QWORD, _QWORD);
  _HAPAccessoryServerBTLE200 *v40;
  uint64_t v41;
  id v42;
  NSObject *v43;
  __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id obj;
  id obja;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t v60[128];
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  id v64;
  __int16 v65;
  void *v66;
  _BYTE v67[128];

  v4 = a3;
  v5 = self;
  v7 = sub_10007CCE4((uint64_t)v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = sub_10007CD2C(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    *(_DWORD *)buf = 138543618;
    v62 = v10;
    v63 = 2112;
    v64 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@Resetting server with error: %@", buf, 0x16u);

  }
  -[HAPAccessoryServerBTLE setNotifyingCharacteristicUpdated:](v5, "setNotifyingCharacteristicUpdated:", 0);
  v11 = v4;
  v12 = v11;
  if (!v11)
  {
    if (-[_HAPAccessoryServerBTLE200 isPairing](v5, "isPairing")
      && (v13 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 pairingDisconnectionError](v5, "pairingDisconnectionError")),
          v13,
          v13))
    {
      v14 = objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 pairingDisconnectionError](v5, "pairingDisconnectionError"));
    }
    else
    {
      v14 = objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 2, CFSTR("Cancelled."), CFSTR("Resetting the server."), 0, 0));
    }
    v12 = (void *)v14;
  }
  v49 = v11;
  -[_HAPAccessoryServerBTLE200 _cancelAllQueuedOperationsWithError:](v5, "_cancelAllQueuedOperationsWithError:", v12);
  -[_HAPAccessoryServerBTLE200 _resumeAllOperations](v5, "_resumeAllOperations");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 characteristicWriteCompletionHandlers](v5, "characteristicWriteCompletionHandlers"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "keyEnumerator"));

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v16;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v57 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)i);
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 characteristicWriteCompletionHandlers](v5, "characteristicWriteCompletionHandlers"));
        v23 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", v21));

        if (v12)
        {
          v24 = v5;
          v26 = sub_10007CCE4((uint64_t)v24, v25);
          v27 = objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            v28 = sub_10007CD2C(v24);
            v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
            *(_DWORD *)buf = 138543874;
            v62 = v29;
            v63 = 2112;
            v64 = v21;
            v65 = 2112;
            v66 = v12;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Calling write completion handler for %@ with error: %@", buf, 0x20u);

          }
        }
        ((void (**)(_QWORD, void *))v23)[2](v23, v12);

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
    }
    while (v18);
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 characteristicWriteCompletionHandlers](v5, "characteristicWriteCompletionHandlers"));
  objc_msgSend(v30, "removeAllObjects");

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 characteristicEnableEventCompletionHandlers](v5, "characteristicEnableEventCompletionHandlers"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "keyEnumerator"));

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  obja = v32;
  v33 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v53;
    do
    {
      for (j = 0; j != v34; j = (char *)j + 1)
      {
        if (*(_QWORD *)v53 != v35)
          objc_enumerationMutation(obja);
        v37 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)j);
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 characteristicEnableEventCompletionHandlers](v5, "characteristicEnableEventCompletionHandlers"));
        v39 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKey:", v37));

        if (v12)
        {
          v40 = v5;
          v42 = sub_10007CCE4((uint64_t)v40, v41);
          v43 = objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            v44 = sub_10007CD2C(v40);
            v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
            *(_DWORD *)buf = 138543874;
            v62 = v45;
            v63 = 2112;
            v64 = v37;
            v65 = 2112;
            v66 = v12;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%{public}@Calling enable event completion handler for %@ with error: %@", buf, 0x20u);

          }
        }
        ((void (**)(_QWORD, void *))v39)[2](v39, v12);

      }
      v34 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    }
    while (v34);
  }

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 characteristicEnableEventCompletionHandlers](v5, "characteristicEnableEventCompletionHandlers"));
  objc_msgSend(v46, "removeAllObjects");

  -[_HAPAccessoryServerBTLE200 _cancelDiscoveryWithError:](v5, "_cancelDiscoveryWithError:", v49);
  if (-[_HAPAccessoryServerBTLE200 isPairing](v5, "isPairing"))
    -[_HAPAccessoryServerBTLE200 _pairingCompletedWithError:](v5, "_pairingCompletedWithError:", v12);
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 pairSetupSession](v5, "pairSetupSession"));
  -[_HAPAccessoryServerBTLE200 setPairSetupSession:](v5, "setPairSetupSession:", 0);
  objc_msgSend(v47, "stop");
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 securitySession](v5, "securitySession"));
  -[_HAPAccessoryServerBTLE200 setSecuritySession:](v5, "setSecuritySession:", 0);
  objc_msgSend(v48, "close");
  -[_HAPAccessoryServerBTLE200 setDiscoveryRetries:](v5, "setDiscoveryRetries:", 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServerBTLE peripheral](self, "peripheral"));
  objc_msgSend(v3, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)_HAPAccessoryServerBTLE200;
  -[_HAPAccessoryServerBTLE200 dealloc](&v4, "dealloc");
}

- (id)descriptionWithPointer:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServerBTLE shortDescription](self, "shortDescription"));
  if (v3)
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %p"), self));
  else
    v6 = &stru_10023F210;
  v7 = HMFBooleanToString(-[HAPAccessoryServer hasPairings](self, "hasPairings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServerBTLE peripheral](self, "peripheral"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@%@, hasPairings = %@, Peripheral = %@>"), v5, v6, v8, v9));

  if (v3)
  return v10;
}

- (NSString)debugDescription
{
  return (NSString *)-[_HAPAccessoryServerBTLE200 descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (NSString)description
{
  return (NSString *)-[_HAPAccessoryServerBTLE200 descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (BOOL)hasValidCache
{
  _HAPAccessoryServerBTLE200 *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options(&self->super.super._lock, 0);
  LOBYTE(v2) = BYTE4(v2->super._blePeripheral);
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setHasValidCache:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options(&self->super.super._lock, 0);
  BYTE4(self->super._blePeripheral) = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)hasBeenDiscovered
{
  _HAPAccessoryServerBTLE200 *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options(&self->super.super._lock, 0);
  LOBYTE(v2) = BYTE5(v2->super._blePeripheral);
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setHasBeenDiscovered:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options(&self->super.super._lock, 0);
  BYTE5(self->super._blePeripheral) = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)hapBLEProtocolVersion
{
  return 2;
}

- (void)_createPrimaryAccessoryFromAdvertisementData
{
  HAPAccessory *v3;
  void *v4;
  HAPAccessory *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HAPAccessory *v10;

  v3 = [HAPAccessory alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 1));
  v5 = -[HAPAccessory initWithServer:instanceID:](v3, "initWithServer:instanceID:", self, v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer name](self, "name"));
  -[HAPAccessory setName:](v5, "setName:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer identifier](self, "identifier"));
  -[HAPAccessory setIdentifier:](v5, "setIdentifier:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer identifier](self, "identifier"));
  -[HAPAccessory setServerIdentifier:](v5, "setServerIdentifier:", v8);

  -[HAPAccessoryServer setPrimaryAccessory:](self, "setPrimaryAccessory:", v5);
  v10 = v5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  -[HAPAccessoryServer setAccessories:](self, "setAccessories:", v9);

}

- (BOOL)_delegateRespondsToSelector:(SEL)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer delegate](self, "delegate"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer delegateQueue](self, "delegateQueue"));
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer delegate](self, "delegate"));
      v8 = objc_opt_respondsToSelector(v7, a3);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8 & 1;
}

- (id)_serviceForCBService:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *j;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  uint64_t v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];

  v4 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer accessories](self, "accessories"));
  v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v20)
  {
    v6 = *(_QWORD *)v26;
    v19 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v5);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "services", v19));
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v22;
          while (2)
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(_QWORD *)v22 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)j);
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "cbService"));
              v16 = objc_msgSend(v15, "isEqual:", v4);

              if ((v16 & 1) != 0)
              {
                v17 = v14;

                goto LABEL_19;
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v11)
              continue;
            break;
          }
        }

        v6 = v19;
      }
      v17 = 0;
      v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v20);
  }
  else
  {
    v17 = 0;
  }
LABEL_19:

  return v17;
}

- (id)_characteristicForCBCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "service"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 _serviceForCBService:](self, "_serviceForCBService:", v5));

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "characteristics", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cbCharacteristic"));
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if ((v13 & 1) != 0)
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)_removePairingOfAccessoryServerCancelledMidPairing
{
  _QWORD *v3;
  void *v4;
  _QWORD *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[5];

  if ((id)-[HAPAccessoryServer pendingRemovePairing](self, "pendingRemovePairing") == (id)1)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10004A8A0;
    v8[3] = &unk_100237150;
    v8[4] = self;
    v3 = objc_retainBlock(v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004A9D0;
    v6[3] = &unk_100236EF0;
    v7 = v3;
    v5 = v3;
    -[_HAPAccessoryServerBTLE200 removePairingForCurrentControllerOnQueue:completion:serverPairingCompletion:](self, "removePairingForCurrentControllerOnQueue:completion:serverPairingCompletion:", v4, v6, v5);

  }
}

- (void)discoverAccessories
{
  -[_HAPAccessoryServerBTLE200 discoverAccessoriesAndReadCharacteristicTypes:](self, "discoverAccessoriesAndReadCharacteristicTypes:", 0);
}

- (void)discoverAccessoriesAndReadCharacteristicTypes:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004AA84;
  v7[3] = &unk_100236AD0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_readPendingDiscoveredCharacteritiscTypesWithCompletion:(id)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _HAPAccessoryServerBTLE200 *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  __CFString *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *j;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  id obj;
  void (**v31)(_QWORD);
  _QWORD v32[4];
  id v33;
  uint64_t v34;
  void (**v35)(_QWORD);
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];

  v31 = (void (**)(_QWORD))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveredAccessoryCharacteriticsPendingRead](self, "discoveredAccessoryCharacteriticsPendingRead"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v41;
    v29 = CFSTR("FED3");
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v41 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("00000023-0000-1000-8000-4D69736D6574"), v29);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer primaryAccessory](self, "primaryAccessory"));
        v12 = v11;
        if (!v10)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "characteristicsOfType:", v9));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));

LABEL_10:
          if (!v13)
            continue;
          goto LABEL_11;
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "characteristicOfType:serviceType:", v9, CFSTR("0000003E-0000-1000-8000-4D69736D6574")));

        if (!v13)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer primaryAccessory](self, "primaryAccessory"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "characteristicOfType:serviceType:", v9, v29));
          goto LABEL_10;
        }
LABEL_11:
        objc_msgSend(v4, "addObject:", v13);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    }
    while (v6);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveredAccessoryCharacteriticsPendingRead](self, "discoveredAccessoryCharacteriticsPendingRead"));
  objc_msgSend(v15, "removeAllObjects");

  if (objc_msgSend(v4, "count"))
  {
    v16 = self;
    v18 = sub_10007CCE4((uint64_t)v16, v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = sub_10007CD2C(v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      *(_DWORD *)buf = 138543618;
      v46 = v21;
      v47 = 2112;
      v48 = v4;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%{public}@Reading pending discovered characteristics with types: %@", buf, 0x16u);

    }
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v22 = objc_msgSend(v4, "copy");
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(_QWORD *)v37 != v25)
            objc_enumerationMutation(v22);
          v27 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)j);
          v32[0] = _NSConcreteStackBlock;
          v32[1] = 3221225472;
          v32[2] = sub_10004B624;
          v32[3] = &unk_1002373B0;
          v33 = v4;
          v34 = v27;
          v35 = v31;
          -[_HAPAccessoryServerBTLE200 _readValueForCharacteristic:options:completionHandler:](v16, "_readValueForCharacteristic:options:completionHandler:", v27, 1, v32);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v24);
    }

    v28 = v31;
  }
  else
  {
    v28 = v31;
    v31[2](v31);
  }

}

- (void)_discoverWithType:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD *v10;
  void *v11;
  unsigned int v12;
  _HAPAccessoryServerBTLE200 *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  __CFString *v17;
  id v18;
  void *v19;
  void *v20;
  _HAPBTLEDiscoveryContext *v21;
  _HAPBTLEDiscoveryContext *v22;
  _QWORD v23[5];
  _HAPBTLEDiscoveryContext *v24;
  int64_t v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29[2];
  id location;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_initWeak(&location, self);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10004B95C;
  v26[3] = &unk_100237400;
  objc_copyWeak(v29, &location);
  v8 = v7;
  v27 = v8;
  v29[1] = (id)a3;
  v9 = v6;
  v28 = v9;
  v10 = objc_retainBlock(v26);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext"));
  v12 = objc_msgSend(v11, "isDiscovering");

  if (v12)
  {
    v13 = self;
    v15 = sub_10007CCE4((uint64_t)v13, v14);
    v16 = (id)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = sub_10007CD2C(v13);
      v18 = (id)objc_claimAutoreleasedReturnValue(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](v13, "discoveryContext"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v19, "discoveryType")));
      *(_DWORD *)buf = 138543618;
      v32 = v18;
      v33 = 2112;
      v34 = v20;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@The server already has a discovery in progress for type: %@", buf, 0x16u);

    }
    v21 = (_HAPBTLEDiscoveryContext *)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:](NSError, "hapErrorWithcode:", 4));
    ((void (*)(_QWORD *, _HAPBTLEDiscoveryContext *))v10[2])(v10, v21);
  }
  else
  {
    v22 = -[_HAPBTLEDiscoveryContext initWithDiscoveryType:]([_HAPBTLEDiscoveryContext alloc], "initWithDiscoveryType:", a3);
    -[_HAPBTLEDiscoveryContext setCompletionHandler:](v22, "setCompletionHandler:", v10);
    -[_HAPBTLEDiscoveryContext setDiscovering:](v22, "setDiscovering:", 1);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10004BC38;
    v23[3] = &unk_100237428;
    v23[4] = self;
    v25 = a3;
    v21 = v22;
    v24 = v21;
    -[_HAPAccessoryServerBTLE200 connectWithCompletionHandler:](self, "connectWithCompletionHandler:", v23);

  }
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);

}

- (BOOL)_cancelDiscoveryWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  int v12;
  unsigned int v13;
  _HAPAccessoryServerBTLE200 *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  _BOOL4 v18;
  __CFString *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  _HAPAccessoryServerBTLE200 *v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  BOOL v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void **v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t);
  void *v45;
  id v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  __int16 v54;
  int v55;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext"));

  if (!v5)
  {
LABEL_25:
    v35 = 0;
    goto LABEL_26;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 accessoryCache](self, "accessoryCache"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastKeyBagIdentityIndexFailingPV"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer keyBag](self, "keyBag"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 accessoryCache](self, "accessoryCache"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastKeyBagIdentityIndexFailingPV"));
    v11 = objc_msgSend(v8, "isValidIndex:", (char *)objc_msgSend(v10, "integerValue") + 1);

  }
  else
  {
    v11 = 0;
  }

  if (-[_HAPAccessoryServerBTLE200 discoveryRetries](self, "discoveryRetries") < 2)
    v12 = 1;
  else
    v12 = v11;
  v13 = -[_HAPAccessoryServerBTLE200 _shouldIgnoreRetryDiscoveryError:](self, "_shouldIgnoreRetryDiscoveryError:", v4);
  v14 = self;
  v16 = sub_10007CCE4((uint64_t)v14, v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
  if (v13 && v12)
  {
    if (v18)
    {
      v19 = sub_10007CD2C(v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      *(_DWORD *)buf = 138543618;
      v49 = v20;
      v50 = 2112;
      v51 = v4;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%{public}@Ignoring cancel discovery request due to BTLE sudden disconnection: %@", buf, 0x16u);

    }
    goto LABEL_25;
  }
  if (v18)
  {
    v21 = sub_10007CD2C(v14);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](v14, "discoveryContext"));
    *(_DWORD *)buf = 138543874;
    v49 = v22;
    v50 = 2048;
    v51 = objc_msgSend(v23, "discoveryType");
    v52 = 2112;
    v53 = v4;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%{public}@Attribute database discovery type: %tu cancelled with error: %@", buf, 0x20u);

  }
  if (!v4)
  {
    v36 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 2, CFSTR("Discovery failed."), CFSTR("Cancelled."), 0, 0));
LABEL_22:
    v37 = v36;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](v14, "discoveryContext"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "completionHandler"));

    if (v39)
    {
      v40 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](v14, "clientQueue"));
      v42 = _NSConcreteStackBlock;
      v43 = 3221225472;
      v44 = sub_10004C36C;
      v45 = &unk_100236E80;
      v47 = v39;
      v46 = v37;
      dispatch_async(v40, &v42);

    }
    -[_HAPAccessoryServerBTLE200 setDiscoveryContext:](v14, "setDiscoveryContext:", 0, v42, v43, v44, v45);

    goto LABEL_25;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
  v25 = objc_msgSend(v24, "isEqualToString:", CBErrorDomain) & v12;

  if (v25 != 1)
  {
    -[_HAPAccessoryServerBTLE200 setHasValidCache:](v14, "setHasValidCache:", 0);
    v36 = v4;
    goto LABEL_22;
  }
  v26 = v14;
  v28 = sub_10007CCE4((uint64_t)v26, v27);
  v29 = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    v30 = sub_10007CD2C(v26);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](v26, "discoveryContext"));
    v33 = objc_msgSend(v32, "discoveryType");
    v34 = -[_HAPAccessoryServerBTLE200 discoveryRetries](v26, "discoveryRetries");
    *(_DWORD *)buf = 138544130;
    v49 = v31;
    v50 = 2048;
    v51 = v33;
    v52 = 2048;
    v53 = v34;
    v54 = 1024;
    v55 = 2;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%{public}@Reconnecting and restarting attribute database discovery type: %tu due to a connection error. Current retries, %tu, max retries, %d.", buf, 0x26u);

  }
  -[_HAPAccessoryServerBTLE200 _retryDiscovery](v26, "_retryDiscovery");
  v35 = 1;
LABEL_26:

  return v35;
}

- (void)_retryDiscovery
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext"));
    objc_msgSend(v4, "reset");

    -[_HAPAccessoryServerBTLE200 setDiscoveryRetries:](self, "setDiscoveryRetries:", (char *)-[_HAPAccessoryServerBTLE200 discoveryRetries](self, "discoveryRetries") + 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 pairVerifyOperationQueue](self, "pairVerifyOperationQueue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:](NSError, "hapErrorWithcode:", 27));
    objc_msgSend(v5, "cancelAllOperationsWithError:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:](NSError, "hapErrorWithcode:", 27));
    -[_HAPAccessoryServerBTLE200 _cancelAllQueuedOperationsWithError:](self, "_cancelAllQueuedOperationsWithError:", v7);

    -[_HAPAccessoryServerBTLE200 _resumeAllOperations](self, "_resumeAllOperations");
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10004C4B0;
    v8[3] = &unk_100236AA8;
    v8[4] = self;
    sub_10004C4B0((uint64_t)v8);
    -[_HAPAccessoryServerBTLE200 setDiscoveryContext:](self, "setDiscoveryContext:", 0);
    -[_HAPAccessoryServerBTLE200 discoverAccessoriesAndReadCharacteristicTypes:](self, "discoverAccessoriesAndReadCharacteristicTypes:", 0);
  }
}

- (void)_handleCompletedDiscovery
{
  void *v3;
  _HAPAccessoryServerBTLE200 *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  _HAPAccessoryServerBTLE200 *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  __CFString *v17;
  void *v18;
  void *v19;
  _HAPAccessoryServerBTLE200 *v20;
  _HAPAccessoryServerBTLE200 *v21;
  _HAPAccessoryServerBTLE200 *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  __CFString *v26;
  void *v27;
  int64_t v28;
  void *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  void *v41;
  _HAPAccessoryServerBTLE200 *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  unsigned __int8 v49;
  _HAPAccessoryServerBTLE200 *v50;
  uint64_t v51;
  id v52;
  NSObject *v53;
  __CFString *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  _HAPAccessoryServerBTLE200 *v61;
  uint64_t v62;
  id v63;
  NSObject *v64;
  __CFString *v65;
  void *v66;
  void *v67;
  _HAPAccessoryServerBTLE200 *v68;
  void *v69;
  uint64_t v70;
  id v71;
  __CFString *v72;
  void *v73;
  id v74;
  _HAPAccessoryServerBTLE200 *v75;
  id v76;
  _HAPAccessoryServerBTLE200 *v77;
  uint64_t v78;
  id v79;
  NSObject *v80;
  NSObject *v81;
  __CFString *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  id v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  _HAPAccessoryServerBTLE200 *v96;
  uint64_t v97;
  id v98;
  NSObject *v99;
  __CFString *v100;
  void *v101;
  _HAPAccessoryServerBTLE200 *v102;
  _HAPAccessoryServerBTLE200 *v103;
  id v104;
  void *v105;
  void *v106;
  void *v107;
  NSObject *v108;
  __CFString *v109;
  void *v110;
  unsigned __int8 v111;
  _HAPAccessoryServerBTLE200 *v112;
  _HAPAccessoryServerBTLE200 *v113;
  uint64_t v114;
  _QWORD block[4];
  id v116;
  id v117;
  id v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  _QWORD v123[2];
  _QWORD v124[2];
  uint8_t buf[4];
  void *v126;
  __int16 v127;
  _HAPAccessoryServerBTLE200 *v128;
  __int16 v129;
  id v130;
  _BYTE v131[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext"));

  if (!v3)
    return;
  v4 = self;
  v6 = sub_10007CCE4((uint64_t)v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = sub_10007CD2C(v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](v4, "discoveryContext"));
    *(_DWORD *)buf = 138543618;
    v126 = v9;
    v127 = 2048;
    v128 = (_HAPAccessoryServerBTLE200 *)objc_msgSend(v10, "discoveryType");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@Attribute database discovery type: %tu completed.", buf, 0x16u);

  }
  v11 = -[_HAPAccessoryServerBTLE200 hasValidCache](v4, "hasValidCache");
  v12 = v4;
  v14 = sub_10007CCE4((uint64_t)v12, v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if ((v11 & 1) != 0)
  {
    if (v16)
    {
      v17 = sub_10007CD2C(v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 accessoryCache](v12, "accessoryCache"));
      v20 = (_HAPAccessoryServerBTLE200 *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "peripheralInfo"));
      *(_DWORD *)buf = 138543618;
      v126 = v18;
      v127 = 2112;
      v128 = v20;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%{public}@HAPBLECache: Constructing attribute database from cache %@", buf, 0x16u);

    }
    v21 = (_HAPAccessoryServerBTLE200 *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 _hapServicesFromCache](v12, "_hapServicesFromCache"));
    v22 = v12;
    v24 = sub_10007CCE4((uint64_t)v22, v23);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = sub_10007CD2C(v22);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      *(_DWORD *)buf = 138543618;
      v126 = v27;
      v127 = 2112;
      v128 = v21;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%{public}@Completed attribute database with cached services: %@", buf, 0x16u);

    }
    if (v21 && -[_HAPAccessoryServerBTLE200 count](v21, "count"))
    {
      v28 = +[HAPBLEAccessoryCache currentDiscoveryVersion](HAPBLEAccessoryCache, "currentDiscoveryVersion");
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 accessoryCache](v22, "accessoryCache"));
      objc_msgSend(v29, "setDiscoveryVersion:", v28);

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServerBTLE browser](v22, "browser"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 accessoryCache](v22, "accessoryCache"));
      objc_msgSend(v30, "saveCacheToDisk:", v31);
    }
    else
    {
      v123[0] = NSLocalizedDescriptionKey;
      v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed att-db construction from cache")));
      v124[0] = v90;
      v123[1] = NSLocalizedFailureReasonErrorKey;
      v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "localizedStringForKey:value:table:", CFSTR("Unable to find matching CB service / characteristic"), &stru_10023F210, 0));
      v124[1] = v92;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v124, v123, 2));

      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6727, v30));
      -[_HAPAccessoryServerBTLE200 _cancelDiscoveryWithError:](v22, "_cancelDiscoveryWithError:", v31);
      v93 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServerBTLE browser](v22, "browser"));
      v94 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 accessoryCache](v22, "accessoryCache"));
      v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "pairingIdentifier"));
      objc_msgSend(v93, "removeCachedAccessoryWithIdentifier:", v95);

      -[_HAPAccessoryServerBTLE200 setHasValidCache:](v22, "setHasValidCache:", 0);
      v96 = v22;
      v98 = sub_10007CCE4((uint64_t)v96, v97);
      v99 = objc_claimAutoreleasedReturnValue(v98);
      if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
      {
        v100 = sub_10007CD2C(v96);
        v101 = (void *)objc_claimAutoreleasedReturnValue(v100);
        v102 = v12;
        v103 = (_HAPAccessoryServerBTLE200 *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 accessoryCache](v96, "accessoryCache"));
        *(_DWORD *)buf = 138543618;
        v126 = v101;
        v127 = 2112;
        v128 = v103;
        _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_INFO, "%{public}@HAPBLECache: Att-db mismatch removing the cached accessory: %@", buf, 0x16u);

        v12 = v102;
      }

    }
    v75 = (_HAPAccessoryServerBTLE200 *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer primaryAccessory](v22, "primaryAccessory"));
    v104 = -[_HAPAccessoryServerBTLE200 copy](v21, "copy");
    -[_HAPAccessoryServerBTLE200 setServices:](v75, "setServices:", v104);

    goto LABEL_52;
  }
  if (v16)
  {
    v32 = sub_10007CD2C(v12);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    *(_DWORD *)buf = 138543362;
    v126 = v33;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%{public}@Starting attribute database parsing", buf, 0xCu);

  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServerBTLE peripheral](v12, "peripheral"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "services"));
  v36 = objc_msgSend(v35, "copy");

  v112 = (_HAPAccessoryServerBTLE200 *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v36, "count")));
  v119 = 0u;
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v21 = (_HAPAccessoryServerBTLE200 *)v36;
  v37 = -[_HAPAccessoryServerBTLE200 countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v119, v131, 16);
  if (v37)
  {
    v39 = v37;
    v40 = *(_QWORD *)v120;
    v113 = v21;
    v114 = *(_QWORD *)v120;
    do
    {
      v41 = 0;
      do
      {
        if (*(_QWORD *)v120 != v40)
          objc_enumerationMutation(v21);
        v42 = *(_HAPAccessoryServerBTLE200 **)(*((_QWORD *)&v119 + 1) + 8 * (_QWORD)v41);
        if (objc_msgSend((id)objc_opt_class(v12, v38), "isHAPService:", v42))
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](v12, "discoveryContext"));
          v44 = objc_msgSend(v43, "discoveryType");

          if (v44 == (id)1)
          {
            v45 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 UUID](v42, "UUID"));
            v46 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("FED3")));
            if ((objc_msgSend(v45, "isEqual:", v46) & 1) == 0)
            {
              v47 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 UUID](v42, "UUID"));
              v48 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("0000003E-0000-1000-8000-4D69736D6574")));
              v49 = objc_msgSend(v47, "isEqual:", v48);

              v21 = v113;
              if ((v49 & 1) == 0)
              {
                v50 = v12;
                v52 = sub_10007CCE4((uint64_t)v50, v51);
                v53 = objc_claimAutoreleasedReturnValue(v52);
                if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
                {
                  v54 = sub_10007CD2C(v50);
                  v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
                  *(_DWORD *)buf = 138543618;
                  v126 = v55;
                  v127 = 2112;
                  v128 = v42;
                  _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "%{public}@Skipping parsing service during Identify discovery: %@", buf, 0x16u);

                }
                goto LABEL_36;
              }
LABEL_30:
              v118 = 0;
              v53 = objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 _parseService:error:](v12, "_parseService:error:", v42, &v118));
              v50 = (_HAPAccessoryServerBTLE200 *)v118;
              if (v53)
              {
                v60 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer primaryAccessory](v12, "primaryAccessory"));
                -[NSObject setAccessory:](v53, "setAccessory:", v60);

                -[_HAPAccessoryServerBTLE200 addObject:](v112, "addObject:", v53);
              }
              else
              {
                v61 = v12;
                v63 = sub_10007CCE4((uint64_t)v61, v62);
                v64 = objc_claimAutoreleasedReturnValue(v63);
                if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
                {
                  v65 = sub_10007CD2C(v61);
                  v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
                  *(_DWORD *)buf = 138543618;
                  v126 = v66;
                  v127 = 2112;
                  v128 = v50;
                  _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to parse service with error: %@", buf, 0x16u);

                }
                v21 = v113;
              }
LABEL_35:
              v40 = v114;
              goto LABEL_36;
            }
          }
          else
          {
            v56 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](v12, "discoveryContext"));
            v57 = objc_msgSend(v56, "discoveryType");

            if (v57 != (id)2)
              goto LABEL_30;
            v45 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 UUID](v42, "UUID"));
            v46 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("FED4")));
            if ((objc_msgSend(v45, "isEqual:", v46) & 1) == 0)
            {
              v58 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 UUID](v42, "UUID"));
              v59 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("00000010-0000-1000-8000-4D69736D6574")));
              if ((objc_msgSend(v58, "isEqual:", v59) & 1) == 0)
              {
                v67 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 UUID](v42, "UUID"));
                v68 = v12;
                v69 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("000000A2-0000-1000-8000-4D69736D6574")));
                v111 = objc_msgSend(v67, "isEqual:", v69);

                v12 = v68;
                v40 = v114;

                v21 = v113;
                if ((v111 & 1) != 0)
                  goto LABEL_30;
                v50 = v12;
                v71 = sub_10007CCE4((uint64_t)v50, v70);
                v53 = objc_claimAutoreleasedReturnValue(v71);
                if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
                {
                  v72 = sub_10007CD2C(v50);
                  v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
                  *(_DWORD *)buf = 138543618;
                  v126 = v73;
                  v127 = 2112;
                  v128 = v42;
                  _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "%{public}@Skipping parsing service during Pairing discovery: %@", buf, 0x16u);

                  goto LABEL_35;
                }
LABEL_36:

                goto LABEL_37;
              }

              v21 = v113;
            }
          }

          goto LABEL_30;
        }
LABEL_37:
        v41 = (char *)v41 + 1;
      }
      while (v39 != v41);
      v74 = -[_HAPAccessoryServerBTLE200 countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v119, v131, 16);
      v39 = v74;
    }
    while (v74);
  }

  v75 = v112;
  v76 = -[_HAPAccessoryServerBTLE200 count](v112, "count");
  v77 = v12;
  v79 = sub_10007CCE4((uint64_t)v77, v78);
  v80 = objc_claimAutoreleasedReturnValue(v79);
  v81 = v80;
  if (!v76)
  {
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
    {
      v109 = sub_10007CD2C(v77);
      v110 = (void *)objc_claimAutoreleasedReturnValue(v109);
      *(_DWORD *)buf = 138543362;
      v126 = v110;
      _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "%{public}@Attribute database parsing failed due to missing compatible services", buf, 0xCu);

    }
    v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 3, CFSTR("Peripheral missing services"), 0, 0, 0));
    goto LABEL_53;
  }
  if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
  {
    v82 = sub_10007CD2C(v77);
    v83 = (void *)objc_claimAutoreleasedReturnValue(v82);
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](v77, "discoveryContext"));
    v85 = objc_msgSend(v84, "discoveryType");
    *(_DWORD *)buf = 138543874;
    v126 = v83;
    v127 = 2112;
    v128 = v112;
    v129 = 2048;
    v130 = v85;
    _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_INFO, "%{public}@Completed attribute database parsing with parsed services: %@, type: %tu", buf, 0x20u);

  }
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer primaryAccessory](v77, "primaryAccessory"));
  v87 = -[_HAPAccessoryServerBTLE200 copy](v112, "copy");
  objc_msgSend(v86, "setServices:", v87);

  v88 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](v77, "discoveryContext"));
  v89 = objc_msgSend(v88, "discoveryType");

  if (!v89)
  {
    -[_HAPAccessoryServerBTLE200 setVerified:](v77, "setVerified:", 1);
    -[_HAPAccessoryServerBTLE200 _cacheServices:](v77, "_cacheServices:", v112);
  }
LABEL_52:
  v105 = 0;
LABEL_53:

  v106 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](v12, "discoveryContext"));
  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "completionHandler"));

  if (v107)
  {
    v108 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](v12, "clientQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004D218;
    block[3] = &unk_100236E80;
    v117 = v107;
    v116 = v105;
    dispatch_async(v108, block);

  }
  -[_HAPAccessoryServerBTLE200 setDiscoveryContext:](v12, "setDiscoveryContext:", 0);

}

- (id)_getCBCharacteristic:(id)a3 instanceId:(id)a4 service:(id)a5
{
  id v7;
  id v8;
  void *v9;
  _HAPAccessoryServerBTLE200 *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  id v24;
  _HAPAccessoryServerBTLE200 *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  _BYTE v38[128];

  v26 = self;
  v7 = a3;
  v27 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithNSUUID:](CBUUID, "UUIDWithNSUUID:", v7));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v10 = (_HAPAccessoryServerBTLE200 *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "characteristics"));
  v11 = -[_HAPAccessoryServerBTLE200 countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUID", v26));
        v17 = objc_msgSend(v16, "isEqual:", v9);

        if ((v17 & 1) != 0)
        {
          v24 = v15;
          v21 = v27;
          goto LABEL_13;
        }
      }
      v12 = -[_HAPAccessoryServerBTLE200 countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
      if (v12)
        continue;
      break;
    }
  }

  v10 = v26;
  v19 = sub_10007CCE4((uint64_t)v10, v18);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  v21 = v27;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v22 = sub_10007CD2C(v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    *(_DWORD *)buf = 138543874;
    v33 = v23;
    v34 = 2112;
    v35 = v7;
    v36 = 2112;
    v37 = v27;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}@HAPBLECache: NO CB Characteristic for : %@/%@", buf, 0x20u);

  }
  v24 = 0;
LABEL_13:

  return v24;
}

- (id)_getCBService:(id)a3 instanceOrder:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *i;
  void *v16;
  unsigned int v17;
  void *v18;
  unsigned int v19;
  id v20;
  void *v21;
  unsigned int v22;
  BOOL v23;
  id v24;
  void *v25;
  _HAPAccessoryServerBTLE200 *v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  __CFString *v30;
  void *v31;
  id v33;
  id obj;
  _HAPAccessoryServerBTLE200 *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  unint64_t v48;
  _BYTE v49[128];

  v33 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithNSUUID:](CBUUID, "UUIDWithNSUUID:"));
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v36 = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServerBTLE peripheral](self, "peripheral"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "services"));
  v8 = objc_msgSend(v7, "copy");

  obj = v8;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
  if (v9)
  {
    v11 = v9;
    v12 = 0;
    v13 = 0;
    v14 = *(_QWORD *)v38;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v38 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
        v17 = objc_msgSend((id)objc_opt_class(v36, v10), "isHAPService:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUID"));
        v19 = objc_msgSend(v18, "isEqual:", v5);

        if (v19)
        {
          v20 = v16;

          v12 = v20;
        }
        v13 += v17;
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUID"));
        v22 = objc_msgSend(v21, "isEqual:", v5);

        if (v22)
          v23 = v13 == a4;
        else
          v23 = 0;
        if (v23)
        {
          v24 = v16;

          v25 = v33;
          goto LABEL_20;
        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
      if (v11)
        continue;
      break;
    }
  }
  else
  {
    v12 = 0;
  }

  v26 = v36;
  v28 = sub_10007CCE4((uint64_t)v26, v27);
  v29 = objc_claimAutoreleasedReturnValue(v28);
  v25 = v33;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    v30 = sub_10007CD2C(v26);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    *(_DWORD *)buf = 138544130;
    v42 = v31;
    v43 = 2112;
    v44 = v12;
    v45 = 2112;
    v46 = v33;
    v47 = 2048;
    v48 = a4;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%{public}@HAPBLECache: Returning first instance %@ Service for : %@/%tu", buf, 0x2Au);

  }
  v12 = v12;
  v24 = v12;
LABEL_20:

  return v24;
}

- (id)_getCachedService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 accessoryCache](self, "accessoryCache", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cachedServices"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "serviceUUID"));
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if ((v12 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)_hapServicesFromCache
{
  _UNKNOWN **v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  __CFString **v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _HAPAccessoryServerBTLE200 *v20;
  NSObject *v21;
  void *i;
  void *v23;
  HAPCharacteristic *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  HAPCharacteristic *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  HAPService *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  HAPService *v42;
  void *v43;
  id v44;
  _HAPAccessoryServerBTLE200 *v45;
  uint64_t v46;
  id v47;
  NSObject *v48;
  NSObject *v49;
  __CFString *v50;
  void *v51;
  uint64_t v53;
  id v54;
  __CFString *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  id obj;
  uint64_t v65;
  NSObject *v66;
  _HAPAccessoryServerBTLE200 *v67;
  id v68;
  _HAPAccessoryServerBTLE200 *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint8_t v78[128];
  uint8_t buf[4];
  void *v80;
  __int16 v81;
  void *v82;
  _BYTE v83[128];

  v3 = &_s16CryptoKitPrivate6SPAKE2O6ProverVMn_ptr;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v69 = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext"));
  v7 = objc_msgSend(v6, "discoveryType");

  if (v7 == (id)2)
  {
    v10 = objc_alloc((Class)NSUUID);
    v11 = &off_100238018;
  }
  else
  {
    if (v7 != (id)1)
    {
      if (v7)
        goto LABEL_10;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 accessoryCache](v69, "accessoryCache"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cachedServices"));
      objc_msgSend(v4, "addObjectsFromArray:", v9);

      goto LABEL_9;
    }
    v10 = objc_alloc((Class)NSUUID);
    v11 = &off_100238010;
  }
  v12 = objc_msgSend(v10, "initWithUUIDString:", *v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 _getCachedService:](v69, "_getCachedService:", v12));

  if (!v8)
    goto LABEL_10;
  objc_msgSend(v4, "addObject:", v8);
LABEL_9:

LABEL_10:
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v13 = v4;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v75;
    v62 = v13;
    v63 = v5;
    v58 = *(_QWORD *)v75;
    while (2)
    {
      v17 = 0;
      v59 = v15;
      do
      {
        if (*(_QWORD *)v75 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "serviceUUID"));
        v20 = (_HAPAccessoryServerBTLE200 *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 _getCBService:instanceOrder:](v69, "_getCBService:instanceOrder:", v19, objc_msgSend(v18, "serviceInstanceOrder")));

        if (!v20)
        {
          v20 = v69;
          v54 = sub_10007CCE4((uint64_t)v20, v53);
          v49 = objc_claimAutoreleasedReturnValue(v54);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            v55 = sub_10007CD2C(v20);
            v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
            *(_DWORD *)buf = 138543618;
            v80 = v56;
            v81 = 2112;
            v82 = v18;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "%{public}@HAPBLECache: No matching cb service for %@", buf, 0x16u);

          }
LABEL_32:

          v44 = 0;
          goto LABEL_33;
        }
        v61 = v17;
        v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3[492], "array"));
        v70 = 0u;
        v71 = 0u;
        v72 = 0u;
        v73 = 0u;
        v60 = v18;
        obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "cachedCharacteristics"));
        v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
        if (v68)
        {
          v65 = *(_QWORD *)v71;
          v66 = v21;
          v67 = v20;
          while (2)
          {
            for (i = 0; i != v68; i = (char *)i + 1)
            {
              if (*(_QWORD *)v71 != v65)
                objc_enumerationMutation(obj);
              v23 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)i);
              v24 = [HAPCharacteristic alloc];
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "characteristicUUID"));
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "UUIDString"));
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "characteristicInstanceId"));
              v28 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServerBTLE stateNumber](v69, "stateNumber"));
              v29 = objc_msgSend(v23, "characteristicProperties");
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "characteristicMetadata"));
              LOBYTE(v57) = 1;
              v31 = -[HAPCharacteristic initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:implicitWriteWithResponse:metadata:](v24, "initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:implicitWriteWithResponse:metadata:", v26, v27, 0, v28, v29, 0, v57, v30);

              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "characteristicUUID"));
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "characteristicInstanceId"));
              v20 = v67;
              v34 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 _getCBCharacteristic:instanceId:service:](v69, "_getCBCharacteristic:instanceId:service:", v32, v33, v67));

              if (!v31)
              {
                v45 = v69;
                v47 = sub_10007CCE4((uint64_t)v45, v46);
                v48 = objc_claimAutoreleasedReturnValue(v47);
                v49 = v66;
                if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                {
                  v50 = sub_10007CD2C(v45);
                  v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
                  *(_DWORD *)buf = 138543618;
                  v80 = v51;
                  v81 = 2112;
                  v82 = v23;
                  _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%{public}@HAPBLECache: No matching cb characteristic for %@", buf, 0x16u);

                }
                v13 = v62;
                v5 = v63;
                goto LABEL_32;
              }
              v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
              -[HAPCharacteristic setValueUpdatedTime:](v31, "setValueUpdatedTime:", v35);

              -[HAPCharacteristic setCBCharacteristic:](v31, "setCBCharacteristic:", v34);
              v21 = v66;
              -[NSObject addObject:](v66, "addObject:", v31);

            }
            v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
            if (v68)
              continue;
            break;
          }
        }

        v36 = [HAPService alloc];
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "serviceUUID"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "UUIDString"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "serviceInstanceId"));
        v40 = objc_msgSend(v60, "serviceProperties");
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "linkedServices"));
        v42 = -[HAPService initWithType:instanceID:parsedCharacteristics:serviceProperties:linkedServices:](v36, "initWithType:instanceID:parsedCharacteristics:serviceProperties:linkedServices:", v38, v39, v21, v40, v41);

        v5 = v63;
        if (v42)
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer primaryAccessory](v69, "primaryAccessory"));
          -[HAPService setAccessory:](v42, "setAccessory:", v43);

          -[HAPService setCBService:](v42, "setCBService:", v20);
          objc_msgSend(v63, "addObject:", v42);
        }

        v13 = v62;
        v17 = v61 + 1;
        v16 = v58;
        v3 = &_s16CryptoKitPrivate6SPAKE2O6ProverVMn_ptr;
      }
      while ((id)(v61 + 1) != v59);
      v15 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
      if (v15)
        continue;
      break;
    }
  }

  v44 = v5;
LABEL_33:

  return v44;
}

- (id)_serviceCacheFromHAPService:(id)a3 serviceOrder:(unint64_t)a4
{
  id v5;
  HAPBLEServiceCache *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  HAPBLEServiceCache *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  HAPBLECharacteristicCache *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  HAPBLECharacteristicCache *v26;
  void *v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v5 = a3;
  v6 = [HAPBLEServiceCache alloc];
  v7 = objc_alloc((Class)NSUUID);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "type"));
  v9 = objc_msgSend(v7, "initWithUUIDString:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "instanceID"));
  v11 = objc_msgSend(v5, "serviceProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "linkedServices"));
  v13 = -[HAPBLEServiceCache initWithServiceUUID:instanceId:instanceOrder:serviceProperties:linkedServices:](v6, "initWithServiceUUID:instanceId:instanceOrder:serviceProperties:linkedServices:", v9, v10, a4, v11, v12);

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = v5;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "characteristics"));
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v31;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v31 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v17);
        v19 = [HAPBLECharacteristicCache alloc];
        v20 = objc_alloc((Class)NSUUID);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "type"));
        v22 = objc_msgSend(v20, "initWithUUIDString:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "instanceID"));
        v24 = objc_msgSend(v18, "properties");
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "accessoryMetadata"));
        v26 = -[HAPBLECharacteristicCache initWithCharacteristicUUID:instanceId:characteristicProperties:characteristicMetadata:](v19, "initWithCharacteristicUUID:instanceId:characteristicProperties:characteristicMetadata:", v22, v23, v24, v25);

        -[HAPBLEServiceCache updateWithCharacteristic:](v13, "updateWithCharacteristic:", v26);
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v15);
  }

  return v13;
}

- (void)_cacheServices:(id)a3
{
  id v4;
  _HAPAccessoryServerBTLE200 *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _HAPAccessoryServerBTLE200 *v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;

  v4 = a3;
  v5 = self;
  v7 = sub_10007CCE4((uint64_t)v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = sub_10007CD2C(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 accessoryCache](v5, "accessoryCache"));
    *(_DWORD *)buf = 138543618;
    v37 = v10;
    v38 = 2112;
    v39 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@HAPBLECache: current Cache : %@", buf, 0x16u);

  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v32;
    v16 = 1;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 _serviceCacheFromHAPService:serviceOrder:](v5, "_serviceCacheFromHAPService:serviceOrder:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v17), (char *)v17 + v16, (_QWORD)v31));
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 accessoryCache](v5, "accessoryCache"));
        objc_msgSend(v19, "updateWithService:", v18);

        v17 = (char *)v17 + 1;
      }
      while (v14 != v17);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      v16 += (uint64_t)v17;
    }
    while (v14);
  }

  v20 = +[HAPBLEAccessoryCache currentDiscoveryVersion](HAPBLEAccessoryCache, "currentDiscoveryVersion");
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 accessoryCache](v5, "accessoryCache"));
  objc_msgSend(v21, "setDiscoveryVersion:", v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServerBTLE browser](v5, "browser"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 accessoryCache](v5, "accessoryCache"));
  objc_msgSend(v22, "saveCacheToDisk:", v23);

  -[_HAPAccessoryServerBTLE200 setHasValidCache:](v5, "setHasValidCache:", 1);
  v24 = v5;
  v26 = sub_10007CCE4((uint64_t)v24, v25);
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    v28 = sub_10007CD2C(v24);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 accessoryCache](v24, "accessoryCache"));
    *(_DWORD *)buf = 138543618;
    v37 = v29;
    v38 = 2112;
    v39 = v30;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%{public}@HAPBLECache: Saved Valid Cache : %@", buf, 0x16u);

  }
}

- (void)_discoverServices
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServerBTLE peripheral](self, "peripheral"));
  objc_msgSend(v2, "discoverServices:", 0);

}

- (void)_handleDiscoveredServices:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  unsigned __int8 v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v6 = a3;
  if (!a4)
  {
    -[_HAPAccessoryServerBTLE200 _kickConnectionIdleTimer](self, "_kickConnectionIdleTimer");
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v29 = v6;
    obj = v6;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (!v7)
      goto LABEL_27;
    v9 = v7;
    v10 = *(_QWORD *)v34;
    while (1)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v11);
        if (objc_msgSend((id)objc_opt_class(self, v8), "isHAPService:", v12))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext"));
          v14 = objc_msgSend(v13, "discoveryType");

          if (v14 == (id)1)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUID"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("FED3")));
            if (objc_msgSend(v15, "isEqual:", v16))
            {

LABEL_26:
              -[_HAPAccessoryServerBTLE200 _discoverCharacteristicsForService:](self, "_discoverCharacteristicsForService:", v12);
              goto LABEL_27;
            }
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUID"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("0000003E-0000-1000-8000-4D69736D6574")));
            v19 = objc_msgSend(v17, "isEqual:", v18);

            if (v19)
              goto LABEL_26;
          }
          else
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext"));
            v21 = objc_msgSend(v20, "discoveryType");

            if (v21 != (id)2)
              goto LABEL_18;
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUID"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("FED4")));
            if ((objc_msgSend(v22, "isEqual:", v23) & 1) != 0)
              goto LABEL_17;
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUID"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("00000010-0000-1000-8000-4D69736D6574")));
            if ((objc_msgSend(v24, "isEqual:", v25) & 1) != 0)
            {

LABEL_17:
LABEL_18:
              -[_HAPAccessoryServerBTLE200 _discoverCharacteristicsForService:](self, "_discoverCharacteristicsForService:", v12);
              goto LABEL_19;
            }
            v30 = v24;
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUID"));
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("000000A2-0000-1000-8000-4D69736D6574")));
            v31 = objc_msgSend(v26, "isEqual:", v27);

            if ((v31 & 1) != 0)
              goto LABEL_18;
          }
        }
LABEL_19:
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      v9 = v28;
      if (!v28)
      {
LABEL_27:

        v6 = v29;
        goto LABEL_28;
      }
    }
  }
  -[_HAPAccessoryServerBTLE200 _cancelDiscoveryWithError:](self, "_cancelDiscoveryWithError:", a4);
LABEL_28:

}

- (void)_discoverCharacteristicsForService:(id)a3
{
  id v4;
  _HAPAccessoryServerBTLE200 *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;

  v4 = a3;
  v5 = self;
  v7 = sub_10007CCE4((uint64_t)v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = sub_10007CD2C(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v14 = 138543618;
    v15 = v10;
    v16 = 2112;
    v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}@Discovering service: %@", (uint8_t *)&v14, 0x16u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](v5, "discoveryContext"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "discoveringServices"));
  objc_msgSend(v12, "addObject:", v4);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServerBTLE peripheral](v5, "peripheral"));
  objc_msgSend(v13, "discoverCharacteristics:forService:", 0, v4);

}

- (void)_handleDiscoveredCharacteristicsForService:(id)a3 error:(id)a4
{
  id v6;
  uint64_t v7;
  _HAPAccessoryServerBTLE200 *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  unsigned int v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  _BYTE v33[128];

  v6 = a3;
  if (a4)
  {
    -[_HAPAccessoryServerBTLE200 _cancelDiscoveryWithError:](self, "_cancelDiscoveryWithError:", a4);
  }
  else
  {
    -[_HAPAccessoryServerBTLE200 _kickConnectionIdleTimer](self, "_kickConnectionIdleTimer");
    if (objc_msgSend((id)objc_opt_class(self, v7), "isHAPService:", v6)
      && !-[_HAPAccessoryServerBTLE200 hasValidCache](self, "hasValidCache"))
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "characteristics", 0));
      v20 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v26;
        while (2)
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(_QWORD *)v26 != v22)
              objc_enumerationMutation(v14);
            v24 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
            if (sub_10004EAB8(v24))
            {
              -[_HAPAccessoryServerBTLE200 _readCharacteristicValue:](self, "_readCharacteristicValue:", v24);
              goto LABEL_8;
            }
          }
          v21 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v21)
            continue;
          break;
        }
      }
    }
    else
    {
      v8 = self;
      v10 = sub_10007CCE4((uint64_t)v8, v9);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v12 = sub_10007CD2C(v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        *(_DWORD *)buf = 138543618;
        v30 = v13;
        v31 = 2112;
        v32 = v6;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{public}@Removing Service: %@ from discovery context", buf, 0x16u);

      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](v8, "discoveryContext"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "discoveringServices"));
      objc_msgSend(v15, "removeObject:", v6);

    }
LABEL_8:

    if (!-[_HAPAccessoryServerBTLE200 hasValidCache](self, "hasValidCache"))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext"));
      v17 = objc_msgSend(v16, "isComplete");

      if (v17)
        -[_HAPAccessoryServerBTLE200 _readCharacteristicSignatures](self, "_readCharacteristicSignatures");
    }
    if (-[_HAPAccessoryServerBTLE200 hasValidCache](self, "hasValidCache"))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext"));
      v19 = objc_msgSend(v18, "isComplete");

      if (v19)
        -[_HAPAccessoryServerBTLE200 _handleCompletedDiscovery](self, "_handleCompletedDiscovery");
    }
  }

}

- (void)_handleReadServiceInstanceId:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(self, v5), "isHAPService:", v4))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "characteristics", 0));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          if ((sub_10004EAB8(v11) & 1) == 0
            && -[_HAPAccessoryServerBTLE200 isHAPCharacteristic:](self, "isHAPCharacteristic:", v11))
          {
            -[_HAPAccessoryServerBTLE200 _discoverCharacteristic:](self, "_discoverCharacteristic:", v11);
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "discoveringServices"));
  objc_msgSend(v13, "removeObject:", v4);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext"));
  LODWORD(v13) = objc_msgSend(v14, "isComplete");

  if ((_DWORD)v13)
    -[_HAPAccessoryServerBTLE200 _readCharacteristicSignatures](self, "_readCharacteristicSignatures");

}

- (void)_discoverCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _HAPAccessoryServerBTLE200 *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "discoveringCharacteristics"));
  objc_msgSend(v6, "addObject:", v4);

  v7 = self;
  v9 = sub_10007CCE4((uint64_t)v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = sub_10007CD2C(v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v14 = 138543618;
    v15 = v12;
    v16 = 2112;
    v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}@Discovering characteristic: %@", (uint8_t *)&v14, 0x16u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServerBTLE peripheral](v7, "peripheral"));
  objc_msgSend(v13, "discoverDescriptorsForCharacteristic:", v4);

}

- (void)_handleDiscoveredCharactersitic:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  _HAPAccessoryServerBTLE200 *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v10 = sub_10007CCE4((uint64_t)v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = sub_10007CD2C(v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "descriptors"));
    v19 = 138544130;
    v20 = v13;
    v21 = 2112;
    v22 = v14;
    v23 = 2112;
    v24 = v6;
    v25 = 2112;
    v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{public}@Discovered descriptors: %@ for characteristic: %@ with error: %@", (uint8_t *)&v19, 0x2Au);

  }
  if (v7)
  {
    -[_HAPAccessoryServerBTLE200 _cancelDiscoveryWithError:](v8, "_cancelDiscoveryWithError:", v7);
  }
  else
  {
    -[_HAPAccessoryServerBTLE200 _kickConnectionIdleTimer](v8, "_kickConnectionIdleTimer");
    if (-[_HAPAccessoryServerBTLE200 isHAPCharacteristic:](v8, "isHAPCharacteristic:", v6))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "descriptors"));
      -[_HAPAccessoryServerBTLE200 _handleDiscoveredDescriptors:](v8, "_handleDiscoveredDescriptors:", v15);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](v8, "discoveryContext"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "discoveringCharacteristics"));
    objc_msgSend(v17, "removeObject:", v6);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](v8, "discoveryContext"));
    LODWORD(v17) = objc_msgSend(v18, "isComplete");

    if ((_DWORD)v17)
      -[_HAPAccessoryServerBTLE200 _readCharacteristicSignatures](v8, "_readCharacteristicSignatures");
  }

}

- (void)_handleDiscoveredDescriptors:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9);
        if (objc_msgSend((id)objc_opt_class(self, v6), "isHAPDescriptor:", v10))
          -[_HAPAccessoryServerBTLE200 _readDescriptorValue:](self, "_readDescriptorValue:", v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_readCharacteristicValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _HAPAccessoryServerBTLE200 *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "readingCharacteristics"));
  objc_msgSend(v6, "addObject:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "value"));
  if (v7)
  {
    -[_HAPAccessoryServerBTLE200 _handleReadCharacteristicValue:error:](self, "_handleReadCharacteristicValue:error:", v4, 0);
  }
  else
  {
    v8 = self;
    v10 = sub_10007CCE4((uint64_t)v8, v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = sub_10007CD2C(v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v17 = 138543618;
      v18 = v13;
      v19 = 2112;
      v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{public}@Reading value of characteristic: %@", (uint8_t *)&v17, 0x16u);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServerBTLE peripheral](v8, "peripheral"));
    objc_msgSend(v14, "readValueForCharacteristic:", v4);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext"));
  v16 = objc_msgSend(v15, "isComplete");

  if (v16)
    -[_HAPAccessoryServerBTLE200 _readCharacteristicSignatures](self, "_readCharacteristicSignatures");

}

- (void)_handleReadCharacteristicValue:(id)a3 error:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (a4)
  {
    -[_HAPAccessoryServerBTLE200 _cancelDiscoveryWithError:](self, "_cancelDiscoveryWithError:", a4);
LABEL_7:
    v10 = v12;
    goto LABEL_8;
  }
  -[_HAPAccessoryServerBTLE200 _kickConnectionIdleTimer](self, "_kickConnectionIdleTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "readingCharacteristics"));
  objc_msgSend(v7, "removeObject:", v12);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext"));
  LODWORD(v7) = objc_msgSend(v8, "isComplete");

  if ((_DWORD)v7)
    -[_HAPAccessoryServerBTLE200 _readCharacteristicSignatures](self, "_readCharacteristicSignatures");
  v9 = sub_10004EAB8(v12);
  v10 = v12;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "service"));
    -[_HAPAccessoryServerBTLE200 _handleReadServiceInstanceId:](self, "_handleReadServiceInstanceId:", v11);

    goto LABEL_7;
  }
LABEL_8:

}

- (void)_readDescriptorValue:(id)a3
{
  id v4;
  void *v5;
  _HAPAccessoryServerBTLE200 *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "value"));

  if (!v5)
  {
    v6 = self;
    v8 = sub_10007CCE4((uint64_t)v6, v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = sub_10007CD2C(v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v17 = 138543618;
      v18 = v11;
      v19 = 2112;
      v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%{public}@Reading value of descriptor: %@", (uint8_t *)&v17, 0x16u);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](v6, "discoveryContext"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "readingDescriptors"));
    objc_msgSend(v13, "addObject:", v4);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServerBTLE peripheral](v6, "peripheral"));
    objc_msgSend(v14, "readValueForDescriptor:", v4);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext"));
  v16 = objc_msgSend(v15, "isComplete");

  if (v16)
    -[_HAPAccessoryServerBTLE200 _readCharacteristicSignatures](self, "_readCharacteristicSignatures");

}

- (void)_handleReadDescriptorValue:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  _HAPAccessoryServerBTLE200 *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v10 = sub_10007CCE4((uint64_t)v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = sub_10007CD2C(v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "characteristic"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "value"));
    v19 = 138544130;
    v20 = v13;
    v21 = 2112;
    v22 = v6;
    v23 = 2112;
    v24 = v14;
    v25 = 2112;
    v26 = v15;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}@Read value of descriptor: %@ for characteristic: %@ value: %@", (uint8_t *)&v19, 0x2Au);

  }
  if (v7)
  {
    -[_HAPAccessoryServerBTLE200 _cancelDiscoveryWithError:](v8, "_cancelDiscoveryWithError:", v7);
  }
  else
  {
    -[_HAPAccessoryServerBTLE200 _kickConnectionIdleTimer](v8, "_kickConnectionIdleTimer");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](v8, "discoveryContext"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "readingDescriptors"));
    objc_msgSend(v17, "removeObject:", v6);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](v8, "discoveryContext"));
    LODWORD(v17) = objc_msgSend(v18, "isComplete");

    if ((_DWORD)v17)
      -[_HAPAccessoryServerBTLE200 _readCharacteristicSignatures](v8, "_readCharacteristicSignatures");
  }

}

- (void)_handleUpdateValueForCharacteristic:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  _HAPAccessoryServerBTLE200 *v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  __CFString *v27;
  void *v28;
  _HAPAccessoryServerBTLE200 *v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  __CFString *v34;
  void *v35;
  void *v36;
  __CFString *v37;
  void *v38;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "readingCharacteristics"));
  v10 = objc_msgSend(v9, "containsObject:", v6);

  if (!v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "value"));
    if (objc_msgSend(v11, "length"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 pendingRequests](self, "pendingRequests"));
      v13 = objc_msgSend(v12, "count");

      if (v13)
      {
        v39 = v11;
        v40 = v7;
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 pendingRequests](self, "pendingRequests"));
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v42;
          while (2)
          {
            for (i = 0; i != v16; i = (char *)i + 1)
            {
              if (*(_QWORD *)v42 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "characteristic"));
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "cbCharacteristic"));
              v22 = objc_msgSend(v21, "isEqual:", v6);

              if (v22)
              {
                v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "characteristic"));
                v11 = v39;
                v7 = v40;
                -[_HAPAccessoryServerBTLE200 _handleResponseData:fromCharacteristic:error:](self, "_handleResponseData:fromCharacteristic:error:", v39, v36, v40);

                goto LABEL_25;
              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
            if (v16)
              continue;
            break;
          }
        }

        v23 = self;
        v25 = sub_10007CCE4((uint64_t)v23, v24);
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v27 = sub_10007CD2C(v23);
          v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
          *(_DWORD *)buf = 138543618;
          v47 = v28;
          v48 = 2112;
          v49 = v6;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%{public}@Received unexpected response from characteristic: %@", buf, 0x16u);

        }
        v11 = v39;
        v7 = v40;
        goto LABEL_26;
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 _characteristicForCBCharacteristic:](self, "_characteristicForCBCharacteristic:", v6));
      -[_HAPAccessoryServerBTLE200 _handleRawResponseData:fromCharacteristic:error:](self, "_handleRawResponseData:fromCharacteristic:error:", v11, v14, v7);
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 _characteristicForCBCharacteristic:](self, "_characteristicForCBCharacteristic:", v6));
      v29 = self;
      v31 = sub_10007CCE4((uint64_t)v29, v30);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      v33 = v32;
      if (v14)
      {
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          v34 = sub_10007CD2C(v29);
          v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
          *(_DWORD *)buf = 138543618;
          v47 = v35;
          v48 = 2112;
          v49 = v6;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "%{public}@Received zero-length value for characteristic: %@", buf, 0x16u);

        }
        -[_HAPAccessoryServerBTLE200 _handleEventIndicationForCharacteristic:](v29, "_handleEventIndicationForCharacteristic:", v14);
      }
      else
      {
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v37 = sub_10007CD2C(v29);
          v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
          *(_DWORD *)buf = 138543618;
          v47 = v38;
          v48 = 2112;
          v49 = v6;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%{public}@Received characteristic indication from unmapped characteristic: %@", buf, 0x16u);

        }
      }
    }
LABEL_25:

LABEL_26:
    goto LABEL_27;
  }
  -[_HAPAccessoryServerBTLE200 _handleReadCharacteristicValue:error:](self, "_handleReadCharacteristicValue:error:", v6, v7);
LABEL_27:

}

- (void)_readCharacteristicSignatures
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  void *v16;
  void *v17;
  unsigned int v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];

  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServerBTLE peripheral](self, "peripheral"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "services"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend((id)objc_opt_class(self, v6), "isHAPService:", v10))
        {
          v21 = 0u;
          v22 = 0u;
          v19 = 0u;
          v20 = 0u;
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "characteristics", 0));
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v20;
            do
            {
              for (j = 0; j != v13; j = (char *)j + 1)
              {
                if (*(_QWORD *)v20 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)j);
                if (sub_10004FC48(v16))
                  -[_HAPAccessoryServerBTLE200 _readServiceSignature:](self, "_readServiceSignature:", v16);
                if (-[_HAPAccessoryServerBTLE200 isHAPCharacteristic:](self, "isHAPCharacteristic:", v16))
                  -[_HAPAccessoryServerBTLE200 _readCharacteristicSignature:](self, "_readCharacteristicSignature:", v16);
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            }
            while (v13);
          }

        }
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext"));
  v18 = objc_msgSend(v17, "isComplete");

  if (v18)
    -[_HAPAccessoryServerBTLE200 _handleCompletedDiscovery](self, "_handleCompletedDiscovery");
}

- (id)_getCharacteristicInstanceID:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  id v14;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "descriptors"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUID"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("DC46F0FE-81D2-4616-B5D9-6ABDD796939A")));
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if ((v12 & 1) != 0)
        {
          v14 = sub_10004FE68(v9, a4);
          v13 = (void *)objc_claimAutoreleasedReturnValue(v14);

          goto LABEL_12;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v6)
        continue;
      break;
    }
  }

  v13 = 0;
  if (a4)
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 1, CFSTR("Characteristic missing the characteristic instance ID descriptor"), 0, 0, 0));
LABEL_12:

  return v13;
}

- (id)_getServiceInstanceID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  _HAPAccessoryServerBTLE200 *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  __CFString *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];

  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "characteristics", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if (sub_10004EAB8(v9))
        {
          v10 = sub_1000500F4(v9, 0);
          v6 = (id)objc_claimAutoreleasedReturnValue(v10);
          if (!v6)
          {
            v11 = self;
            v13 = sub_10007CCE4((uint64_t)v11, v12);
            v14 = objc_claimAutoreleasedReturnValue(v13);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              v15 = sub_10007CD2C(v11);
              v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
              *(_DWORD *)buf = 138543874;
              v23 = v16;
              v24 = 2112;
              v25 = v4;
              v26 = 2112;
              v27 = v9;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to get Service Instance ID for Service: %@, Characteristic: %@", buf, 0x20u);

            }
            v6 = 0;
          }
          goto LABEL_14;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_14:

  return v6;
}

- (id)_getProtocolInfoService
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 _hapServicesFromCache](self, "_hapServicesFromCache"));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "type", (_QWORD)v12));
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("000000A2-0000-1000-8000-4D69736D6574"));

        if ((v9 & 1) != 0)
        {
          v10 = v7;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)_readCharacteristicSignature:(id)a3
{
  __CFString *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  unsigned int v11;
  _HAPAccessoryServerBTLE200 *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  _HAPAccessoryServerBTLE200 *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  __CFString *v23;
  void *v24;
  _HAPAccessoryServerBTLE200 *v25;
  __CFString *v26;
  __CFString *v27;
  _HAPAccessoryServerBTLE200 *v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  __CFString *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  _HAPAccessoryServerBTLE200 *v37;
  uint64_t v38;
  id v39;
  NSObject *v40;
  __CFString *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  HAPBTLECharacteristicSignature *v53;
  HAPBTLECharacteristicSignature *v54;
  void *v55;
  void *v56;
  _HAPAccessoryServerBTLE200 *v57;
  uint64_t v58;
  id v59;
  NSObject *v60;
  __CFString *v61;
  void *v62;
  _HAPAccessoryServerBTLE200 *v63;
  uint64_t v64;
  id v65;
  NSObject *v66;
  __CFString *v67;
  void *v68;
  HAPBTLECharacteristicSignature *v69;
  void *v70;
  uint64_t v71;
  HAPCharacteristic *v72;
  void *v73;
  void *v74;
  HAPCharacteristic *v75;
  void *v76;
  _BOOL8 v77;
  uint64_t v78;
  id v79;
  __CFString *v80;
  __CFString *v81;
  _QWORD *v82;
  void *v83;
  void *v84;
  __CFString *v85;
  void *v86;
  _HAPAccessoryServerBTLE200 *v87;
  uint64_t v88;
  id v89;
  NSObject *v90;
  __CFString *v91;
  void *v92;
  _HAPAccessoryServerBTLE200 *v93;
  __CFString *v94;
  __CFString *v95;
  _HAPAccessoryServerBTLE200 *v96;
  uint64_t v97;
  id v98;
  NSObject *v99;
  __CFString *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  HAPBTLECharacteristicSignature *v104;
  void *v105;
  void *v106;
  __CFString *v107;
  _HAPAccessoryServerBTLE200 *v108;
  HAPBTLECharacteristicSignature *v109;
  __CFString *v110;
  __CFString *v111;
  __CFString *v112;
  __CFString *v113;
  _QWORD v114[5];
  __CFString *v115;
  id v116;
  id v117;
  uint8_t buf[4];
  void *v119;
  __int16 v120;
  const __CFString *v121;
  __int16 v122;
  __CFString *v123;

  v4 = (__CFString *)a3;
  if (-[_HAPAccessoryServerBTLE200 isHAPCharacteristic:](self, "isHAPCharacteristic:", v4))
  {
    v6 = (void *)objc_opt_class(self, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString UUID](v4, "UUID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hapUUIDFromBTLEUUID:", v7));

    if (v8)
    {
      v117 = 0;
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 _getCharacteristicInstanceID:error:](self, "_getCharacteristicInstanceID:error:", v4, &v117));
      v10 = (__CFString *)v117;
      if (v9)
      {
        if (-[_HAPAccessoryServerBTLE200 isVerified](self, "isVerified"))
        {
          v11 = 0;
        }
        else
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext"));
          if (objc_msgSend(v34, "discoveryType"))
            v11 = 0;
          else
            v11 = -[_HAPAccessoryServerBTLE200 shouldVerifyHAPCharacteristic:](self, "shouldVerifyHAPCharacteristic:", v4);

        }
        v35 = objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 _characteristicForCBCharacteristic:](self, "_characteristicForCBCharacteristic:", v4));
        v36 = (void *)v35;
        if ((v11 & 1) == 0 && v35)
        {
          v105 = v8;
          v110 = v9;
          v112 = v10;
          v37 = self;
          v39 = sub_10007CCE4((uint64_t)v37, v38);
          v40 = objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          {
            v41 = sub_10007CD2C(v37);
            v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
            *(_DWORD *)buf = 138543618;
            v119 = v42;
            v120 = 2112;
            v121 = v4;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "%{public}@Found cached signature, skipping reading characteristic signature for characteristic: %@", buf, 0x16u);

          }
          v104 = [HAPBTLECharacteristicSignature alloc];
          v108 = v37;
          v43 = objc_alloc((Class)NSUUID);
          v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "type"));
          v44 = objc_msgSend(v43, "initWithUUIDString:", v106);
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "service"));
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "instanceID"));
          v47 = objc_alloc((Class)NSUUID);
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "service"));
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "type"));
          v50 = objc_msgSend(v47, "initWithUUIDString:", v49);
          v51 = objc_msgSend(v36, "properties");
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "metadata"));
          v53 = -[HAPBTLECharacteristicSignature initWithCharacteristicType:serviceInstanceID:serviceType:characteristicProperties:characteristicMetadata:authenticated:](v104, "initWithCharacteristicType:serviceInstanceID:serviceType:characteristicProperties:characteristicMetadata:authenticated:", v44, v46, v50, v51, v52, 0);

          v54 = v53;
          v55 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](v108, "discoveryContext"));
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "characteristicSignatures"));
          objc_msgSend(v56, "setObject:forKey:", v54, v4);

          v9 = v110;
          v10 = v112;
          v8 = v105;
          goto LABEL_46;
        }
        if (v11 && objc_msgSend(0, "isAuthenticated"))
        {
          v57 = self;
          v59 = sub_10007CCE4((uint64_t)v57, v58);
          v60 = objc_claimAutoreleasedReturnValue(v59);
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
          {
            v61 = sub_10007CD2C(v57);
            v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
            *(_DWORD *)buf = 138543618;
            v119 = v62;
            v120 = 2112;
            v121 = v4;
            _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEBUG, "%{public}@Found authenitcated cached signature, skipping reading characteristic signature for characteristic: %@", buf, 0x16u);

          }
          v54 = (HAPBTLECharacteristicSignature *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](v57, "discoveryContext"));
          v55 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLECharacteristicSignature characteristicSignatures](v54, "characteristicSignatures"));
          objc_msgSend(v55, "setObject:forKey:", 0, v4);
          goto LABEL_46;
        }
        v63 = self;
        v65 = sub_10007CCE4((uint64_t)v63, v64);
        v66 = objc_claimAutoreleasedReturnValue(v65);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
        {
          v67 = sub_10007CD2C(v63);
          v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
          *(_DWORD *)buf = 138543618;
          v119 = v68;
          v120 = 2112;
          v121 = v4;
          _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEBUG, "%{public}@Reading signature for characteristic: %@", buf, 0x16u);

        }
        v69 = (HAPBTLECharacteristicSignature *)objc_claimAutoreleasedReturnValue(+[HAPMetadata getSharedInstance](HAPMetadata, "getSharedInstance"));
        v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLECharacteristicSignature getDefaultCharacteristicProperties:](v69, "getDefaultCharacteristicProperties:", v70));

        v113 = v10;
        v103 = v36;
        v109 = v69;
        if (v55)
          v71 = (uint64_t)objc_msgSend(v55, "unsignedLongLongValue");
        else
          v71 = 2;
        v72 = [HAPCharacteristic alloc];
        v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
        v74 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServerBTLE stateNumber](v63, "stateNumber"));
        LOBYTE(v102) = 1;
        v75 = -[HAPCharacteristic initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:implicitWriteWithResponse:metadata:](v72, "initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:implicitWriteWithResponse:metadata:", v73, v9, 0, v74, v71, 0, v102, 0);

        v111 = v9;
        if (v75)
        {
          -[HAPCharacteristic setCBCharacteristic:](v75, "setCBCharacteristic:", v4);
          v76 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](v63, "discoveryContext"));
          v77 = objc_msgSend(v76, "discoveryType") == 0;

          v116 = 0;
          v79 = objc_msgSend((id)objc_opt_class(v63, v78), "signatureRequestForCharacteristic:requiresAuthentication:error:", v75, v77, &v116);
          v80 = (__CFString *)objc_claimAutoreleasedReturnValue(v79);
          v107 = (__CFString *)v116;
          if (v80)
          {
            v114[0] = _NSConcreteStackBlock;
            v114[1] = 3221225472;
            v114[2] = sub_100050D28;
            v114[3] = &unk_100237450;
            v114[4] = v63;
            v81 = v4;
            v115 = v81;
            v82 = objc_retainBlock(v114);
            -[_HAPAccessoryServerBTLE200 _sendRequest:shouldPrioritize:responseHandler:](v63, "_sendRequest:shouldPrioritize:responseHandler:", v80, 0, v82);
            v83 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](v63, "discoveryContext"));
            v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "readingSignatureCharacteristics"));
            objc_msgSend(v84, "addObject:", v81);

            v36 = v103;
            v85 = v107;
LABEL_45:

            v9 = v111;
            v10 = v113;
            v54 = v109;
LABEL_46:

            goto LABEL_47;
          }
          v96 = v63;
          v98 = sub_10007CCE4((uint64_t)v96, v97);
          v99 = objc_claimAutoreleasedReturnValue(v98);
          if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
          {
            v100 = sub_10007CD2C(v96);
            v101 = (void *)objc_claimAutoreleasedReturnValue(v100);
            *(_DWORD *)buf = 138543874;
            v119 = v101;
            v120 = 2112;
            v121 = v4;
            v122 = 2112;
            v123 = v107;
            _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_ERROR, "%{public}@Failed to create signature request for characteristic, %@, with error: %@", buf, 0x20u);

          }
          v93 = v96;
          v94 = v4;
          v85 = v107;
          v95 = v107;
        }
        else
        {
          v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
          v85 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to create characteristic with type, %@, characteristic instance ID, %@, properties, %tu"), v86, v9, v71));

          v87 = v63;
          v89 = sub_10007CCE4((uint64_t)v87, v88);
          v90 = objc_claimAutoreleasedReturnValue(v89);
          if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
          {
            v91 = sub_10007CD2C(v87);
            v92 = (void *)objc_claimAutoreleasedReturnValue(v91);
            *(_DWORD *)buf = 138543618;
            v119 = v92;
            v120 = 2112;
            v121 = v85;
            _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

          }
          v80 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 3, v85, 0, 0, 0));
          v93 = v87;
          v94 = v4;
          v95 = v80;
        }
        -[_HAPAccessoryServerBTLE200 _handleReadCharacteristicSignature:error:](v93, "_handleReadCharacteristicSignature:error:", v94, v95);
        v36 = v103;
        goto LABEL_45;
      }
      v28 = self;
      v30 = sub_10007CCE4((uint64_t)v28, v29);
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = sub_10007CD2C(v28);
        v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
        *(_DWORD *)buf = 138543874;
        v119 = v33;
        v120 = 2112;
        v121 = v4;
        v122 = 2112;
        v123 = v10;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to get characteristic, %@, instance ID with error: %@", buf, 0x20u);

      }
      v25 = v28;
      v26 = v4;
      v27 = v10;
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString UUID](v4, "UUID"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to convert UUID '%@' to HAP UUID"), v18));

      v19 = self;
      v21 = sub_10007CCE4((uint64_t)v19, v20);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = sub_10007CD2C(v19);
        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        *(_DWORD *)buf = 138543618;
        v119 = v24;
        v120 = 2112;
        v121 = v10;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

      }
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 3, v10, 0, 0, 0));
      v25 = v19;
      v26 = v4;
      v27 = v9;
    }
    -[_HAPAccessoryServerBTLE200 _handleReadCharacteristicSignature:error:](v25, "_handleReadCharacteristicSignature:error:", v26, v27);
LABEL_47:

    goto LABEL_48;
  }
  v12 = self;
  v14 = sub_10007CCE4((uint64_t)v12, v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v16 = sub_10007CD2C(v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    *(_DWORD *)buf = 138543618;
    v119 = v17;
    v120 = 2112;
    v121 = CFSTR("Characteristic does not support HAP");
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 3, CFSTR("Characteristic does not support HAP"), 0, 0, 0));
  -[_HAPAccessoryServerBTLE200 _handleReadCharacteristicSignature:error:](v12, "_handleReadCharacteristicSignature:error:", v4, v8);
LABEL_48:

}

- (void)_readServiceSignature:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
  unsigned int v14;
  _HAPAccessoryServerBTLE200 *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  _HAPAccessoryServerBTLE200 *v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  __CFString *v27;
  void *v28;
  _HAPAccessoryServerBTLE200 *v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  __CFString *v33;
  void *v34;
  __CFString *v35;
  __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  _HAPAccessoryServerBTLE200 *v40;
  uint64_t v41;
  id v42;
  NSObject *v43;
  __CFString *v44;
  void *v45;
  __CFString *v46;
  HAPBTLEServiceSignature *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  HAPBTLEServiceSignature *v54;
  void *v55;
  HAPService *v56;
  void *v57;
  _HAPAccessoryServerBTLE200 *v58;
  uint64_t v59;
  id v60;
  NSObject *v61;
  __CFString *v62;
  __CFString *v63;
  uint64_t v64;
  void *v65;
  __CFString *v66;
  _HAPAccessoryServerBTLE200 *v67;
  uint64_t v68;
  id v69;
  NSObject *v70;
  __CFString *v71;
  void *v72;
  __CFString *v73;
  HAPBTLEServiceSignature *v74;
  void *v75;
  id v76;
  HAPService *v77;
  void *v78;
  HAPService *v79;
  void *v80;
  HAPCharacteristic *v81;
  void *v82;
  void *v83;
  void *v84;
  HAPCharacteristic *v85;
  void *v86;
  _BOOL8 v87;
  uint64_t v88;
  id v89;
  uint64_t v90;
  id v91;
  id v92;
  _QWORD *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  _HAPAccessoryServerBTLE200 *v100;
  uint64_t v101;
  id v102;
  NSObject *v103;
  __CFString *v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  _HAPAccessoryServerBTLE200 *v109;
  uint64_t v110;
  id v111;
  NSObject *v112;
  __CFString *v113;
  void *v114;
  uint64_t v115;
  id v116;
  void *v117;
  HAPCharacteristic *v118;
  HAPService *v119;
  const __CFString *v120;
  void *v121;
  HAPBTLEServiceSignature *v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  _QWORD v126[4];
  id v127;
  _HAPAccessoryServerBTLE200 *v128;
  id v129;
  id v130;
  id v131;
  id v132;
  uint8_t buf[4];
  void *v134;
  __int16 v135;
  const __CFString *v136;
  __int16 v137;
  id v138;
  __int16 v139;
  __CFString *v140;

  v4 = a3;
  if (-[_HAPAccessoryServerBTLE200 isHAPCharacteristic:](self, "isHAPCharacteristic:", v4))
  {
    v6 = (void *)objc_opt_class(self, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "service"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hapUUIDFromBTLEUUID:", v8));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "service"));
      v11 = objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 _getServiceInstanceID:](self, "_getServiceInstanceID:", v10));

      v132 = 0;
      v12 = objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 _getCharacteristicInstanceID:error:](self, "_getCharacteristicInstanceID:error:", v4, &v132));
      v13 = (__CFString *)v132;
      if (v11 | v12)
      {
        if (-[_HAPAccessoryServerBTLE200 isVerified](self, "isVerified"))
        {
          v14 = 0;
        }
        else
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext"));
          if (objc_msgSend(v37, "discoveryType"))
          {
            v14 = 0;
          }
          else
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "service"));
            v14 = -[_HAPAccessoryServerBTLE200 shouldVerifyHAPService:](self, "shouldVerifyHAPService:", v38);

          }
        }
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "service"));
        v36 = (__CFString *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 _serviceForCBService:](self, "_serviceForCBService:", v39));

        v125 = (void *)v11;
        if ((v14 & 1) != 0 || !v36)
        {
          if (v14 && objc_msgSend(0, "isAuthenticated"))
          {
            v58 = self;
            v60 = sub_10007CCE4((uint64_t)v58, v59);
            v61 = objc_claimAutoreleasedReturnValue(v60);
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
            {
              v62 = sub_10007CD2C(v58);
              v63 = v36;
              v64 = v12;
              v65 = (void *)objc_claimAutoreleasedReturnValue(v62);
              v66 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "service"));
              *(_DWORD *)buf = 138543618;
              v134 = v65;
              v135 = 2112;
              v136 = v66;
              _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEBUG, "%{public}@Found authenticated cached signature, skipping reading service signature for service: %@", buf, 0x16u);

              v12 = v64;
              v36 = v63;
            }

            v54 = (HAPBTLEServiceSignature *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](v58, "discoveryContext"));
            v55 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEServiceSignature serviceSignatures](v54, "serviceSignatures"));
            v56 = (HAPService *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "service"));
            objc_msgSend(v55, "setObject:forKey:", 0, v56);
          }
          else
          {
            v124 = v12;
            v67 = self;
            v69 = sub_10007CCE4((uint64_t)v67, v68);
            v70 = objc_claimAutoreleasedReturnValue(v69);
            if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
            {
              v71 = sub_10007CD2C(v67);
              v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
              v73 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "service"));
              *(_DWORD *)buf = 138543618;
              v134 = v72;
              v135 = 2112;
              v136 = v73;
              _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEBUG, "%{public}@Reading signature for service: %@", buf, 0x16u);

            }
            v74 = (HAPBTLEServiceSignature *)objc_claimAutoreleasedReturnValue(+[HAPMetadata getSharedInstance](HAPMetadata, "getSharedInstance"));
            v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
            v55 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEServiceSignature getDefaultServiceProperties:](v74, "getDefaultServiceProperties:", v75));

            v120 = v36;
            v122 = v74;
            if (v55)
              v76 = objc_msgSend(v55, "unsignedLongLongValue");
            else
              v76 = 0;
            v77 = [HAPService alloc];
            v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
            v79 = -[HAPService initWithType:instanceID:parsedCharacteristics:serviceProperties:linkedServices:](v77, "initWithType:instanceID:parsedCharacteristics:serviceProperties:linkedServices:", v78, v125, 0, v76, 0);

            v119 = v79;
            if (v79)
            {
              v117 = v55;
              v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "service"));
              -[HAPService setCBService:](v79, "setCBService:", v80);

              v81 = [HAPCharacteristic alloc];
              v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUID"));
              v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "UUIDString"));
              v84 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServerBTLE stateNumber](v67, "stateNumber"));
              LOBYTE(v115) = 1;
              v85 = -[HAPCharacteristic initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:implicitWriteWithResponse:metadata:](v81, "initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:implicitWriteWithResponse:metadata:", v83, v124, 0, v84, 2, 0, v115, 0);

              -[HAPCharacteristic setCBCharacteristic:](v85, "setCBCharacteristic:", v4);
              -[HAPCharacteristic setService:](v85, "setService:", v79);
              v86 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](v67, "discoveryContext"));
              v87 = objc_msgSend(v86, "discoveryType") == 0;

              v131 = 0;
              v118 = v85;
              v89 = objc_msgSend((id)objc_opt_class(v67, v88), "signatureRequestForService:characteristic:requiresAuthentication:error:", v79, v85, v87, &v131);
              v90 = objc_claimAutoreleasedReturnValue(v89);
              v91 = v131;
              v116 = v91;
              if (v90)
              {
                v126[0] = _NSConcreteStackBlock;
                v126[1] = 3221225472;
                v126[2] = sub_100051B3C;
                v126[3] = &unk_100237478;
                v127 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "service"));
                v128 = v67;
                v129 = v125;
                v130 = v9;
                v92 = v127;
                v93 = objc_retainBlock(v126);
                -[_HAPAccessoryServerBTLE200 _sendRequest:shouldPrioritize:responseHandler:](v67, "_sendRequest:shouldPrioritize:responseHandler:", v90, 0, v93);
                v94 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](v67, "discoveryContext"));
                v95 = (void *)v90;
                v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "readingSignatureServices"));
                v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "service"));
                objc_msgSend(v96, "addObject:", v97);

                v36 = (__CFString *)v120;
                v54 = v122;
                v55 = v117;
              }
              else
              {
                v108 = v91;
                v109 = v67;
                v111 = sub_10007CCE4((uint64_t)v109, v110);
                v112 = objc_claimAutoreleasedReturnValue(v111);
                v36 = (__CFString *)v120;
                if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
                {
                  v113 = sub_10007CD2C(v109);
                  v114 = (void *)objc_claimAutoreleasedReturnValue(v113);
                  *(_DWORD *)buf = 138543874;
                  v134 = v114;
                  v135 = 2112;
                  v136 = v120;
                  v137 = 2112;
                  v138 = v108;
                  _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_ERROR, "%{public}@Failed to create signature request for service, %@, with error: %@", buf, 0x20u);

                }
                v92 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "service"));
                -[_HAPAccessoryServerBTLE200 _handleReadServiceSignature:error:](v109, "_handleReadServiceSignature:error:", v92, v108);
                v54 = v122;
                v55 = v117;
                v95 = 0;
              }

              v12 = v124;
              v11 = (uint64_t)v125;
              v107 = v118;
              v106 = v116;
            }
            else
            {
              v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
              v99 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to create service with type, %@, instance ID, %@, properties, %tu"), v98, v125, v76));

              v100 = v67;
              v102 = sub_10007CCE4((uint64_t)v100, v101);
              v103 = objc_claimAutoreleasedReturnValue(v102);
              if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
              {
                v104 = sub_10007CD2C(v100);
                v105 = (void *)objc_claimAutoreleasedReturnValue(v104);
                *(_DWORD *)buf = 138543618;
                v134 = v105;
                v135 = 2112;
                v136 = (const __CFString *)v99;
                _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

              }
              v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 3, v99, 0, 0, 0));
              -[_HAPAccessoryServerBTLE200 _handleReadCharacteristicSignature:error:](v100, "_handleReadCharacteristicSignature:error:", v4, v106);
              v12 = v124;
              v11 = (uint64_t)v125;
              v107 = (void *)v99;
              v36 = (__CFString *)v120;
              v54 = v122;
            }

            v56 = v119;
          }
        }
        else
        {
          v121 = v9;
          v123 = v12;
          v40 = self;
          v42 = sub_10007CCE4((uint64_t)v40, v41);
          v43 = objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            v44 = sub_10007CD2C(v40);
            v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
            v46 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "service"));
            *(_DWORD *)buf = 138543618;
            v134 = v45;
            v135 = 2112;
            v136 = v46;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "%{public}@Found cached service signature, skipping reading service signature for service: %@", buf, 0x16u);

          }
          v47 = [HAPBTLEServiceSignature alloc];
          v48 = objc_alloc((Class)NSUUID);
          v49 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString type](v36, "type"));
          v50 = objc_msgSend(v48, "initWithUUIDString:", v49);
          v51 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString instanceID](v36, "instanceID"));
          v52 = -[__CFString serviceProperties](v36, "serviceProperties");
          v53 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString linkedServices](v36, "linkedServices"));
          v54 = -[HAPBTLEServiceSignature initWithServiceType:serviceInstanceID:serviceProperties:linkedServices:authenticated:](v47, "initWithServiceType:serviceInstanceID:serviceProperties:linkedServices:authenticated:", v50, v51, v52, v53, 0);

          v55 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](v40, "discoveryContext"));
          v56 = (HAPService *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "serviceSignatures"));
          v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "service"));
          -[HAPService setObject:forKey:](v56, "setObject:forKey:", v54, v57);

          v12 = v123;
          v11 = (uint64_t)v125;
          v9 = v121;
        }

      }
      else
      {
        v29 = self;
        v31 = sub_10007CCE4((uint64_t)v29, v30);
        v32 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v33 = sub_10007CD2C(v29);
          v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
          v35 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "service"));
          *(_DWORD *)buf = 138544130;
          v134 = v34;
          v135 = 2112;
          v136 = v35;
          v137 = 2112;
          v138 = v4;
          v139 = 2112;
          v140 = v13;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to get service/characteristic, %@/%@, instance ID with error: %@", buf, 0x2Au);

        }
        v36 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "service"));
        -[_HAPAccessoryServerBTLE200 _handleReadServiceSignature:error:](v29, "_handleReadServiceSignature:error:", v36, v13);
      }

    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "service"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "UUID"));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to convert UUID '%@' to HAP UUID"), v22));

      v23 = self;
      v25 = sub_10007CCE4((uint64_t)v23, v24);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = sub_10007CD2C(v23);
        v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        *(_DWORD *)buf = 138543618;
        v134 = v28;
        v135 = 2112;
        v136 = v13;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

      }
      v11 = objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 3, v13, 0, 0, 0));
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "service"));
      -[_HAPAccessoryServerBTLE200 _handleReadServiceSignature:error:](v23, "_handleReadServiceSignature:error:", v12, v11);
    }

  }
  else
  {
    v15 = self;
    v17 = sub_10007CCE4((uint64_t)v15, v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = sub_10007CD2C(v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      *(_DWORD *)buf = 138543618;
      v134 = v20;
      v135 = 2112;
      v136 = CFSTR("Service Properties Characteristic does not support HAP");
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 3, CFSTR("Service Properties Characteristic does not support HAP"), 0, 0, 0));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "service"));
    -[_HAPAccessoryServerBTLE200 _handleReadServiceSignature:error:](v15, "_handleReadServiceSignature:error:", v13, v9);
  }

}

+ (id)signatureRequestForCharacteristic:(id)a3 requiresAuthentication:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v5;
  id v6;
  HAPBTLERequest *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HAPBTLERequest initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:]([HAPBTLERequest alloc], "initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:", v6, 1, 0, v5, 10.0);

  return v7;
}

+ (id)signatureRequestForService:(id)a3 characteristic:(id)a4 requiresAuthentication:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v6;
  id v7;
  HAPBTLERequest *v8;

  v6 = a5;
  v7 = a4;
  v8 = -[HAPBTLERequest initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:]([HAPBTLERequest alloc], "initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:", v7, 6, 0, v6, 10.0);

  return v8;
}

+ (id)parseSignatureResponse:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  char *v9;
  void *v10;
  unsigned int v11;
  char *v12;
  uint64_t v13;
  HAPCharacteristicMetadata *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  char *v19;
  char v20;
  uint64_t v21;
  char *v22;
  char v23;
  uint64_t UInt64;
  id v25;
  void *v26;
  HAPBTLECharacteristicSignature *v27;
  id v29;
  id v30;
  HAPMetadataConstraints *v31;
  int v32;
  id v33;
  id v34;
  id v35;
  int v36;
  void *v37;
  id v38;
  char v39;
  id v40;
  uint64_t v41;
  id v42;
  NSObject *v43;
  __CFString *v44;
  int v45;
  void *v46;
  id v47;
  int v48;
  void *v49;
  id v50;
  void *v51;
  int v52;
  void *v53;
  id v54;
  int v55;
  int v56;
  id v57;
  void *v58;
  HAPCharacteristicMetadata *v59;
  __CFString *v60;
  void *v61;
  __CFString *v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  int v67;
  int v68;
  id v69;
  id v70;
  id v71;
  void *v72;
  _BOOL4 v73;
  _BOOL4 v74;
  _BOOL4 v75;
  void *v76;
  HAPMetadataConstraints *v77;
  HAPMetadataConstraints *v78;
  id v79;
  void *v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  int v94;
  uint8_t buf[4];
  void *v96;
  __int16 v97;
  id v98;
  _BYTE v99[16];

  v5 = a3;
  v94 = 0;
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "body")));
  v7 = objc_msgSend(v6, "bytes");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "body"));
  v9 = (char *)objc_msgSend(v8, "length");

  v92 = 0;
  v93 = 0;
  v91 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "request"));
  v11 = objc_msgSend(v10, "type");

  if (v11 != 1)
  {
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v25 = 0;
    v65 = -6705;
    goto LABEL_91;
  }
  v12 = &v9[(_QWORD)v7];
  v94 = TLV8GetOrCopyCoalesced(v7, &v9[(_QWORD)v7], 4, &v93, &v92, &v91, 0);
  if (!v94)
  {
    if (v92 == 16)
    {
      v18 = 0;
      v19 = (char *)(v93 + 15);
      do
      {
        v20 = *v19--;
        v99[v18++] = v20;
      }
      while (v18 != 16);
      v17 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", v99);
      if (!v17)
      {
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
LABEL_90:
        v25 = 0;
        v65 = -6737;
        goto LABEL_91;
      }
      v94 = TLV8GetOrCopyCoalesced(v7, v12, 6, &v93, &v92, &v91, 0);
      if (v94)
      {
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        goto LABEL_18;
      }
      if (v92 == 16)
      {
        v21 = 0;
        v22 = (char *)(v93 + 15);
        do
        {
          v23 = *v22--;
          v99[v21++] = v23;
        }
        while (v21 != 16);
        v16 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", v99);
        if (v16)
        {
          UInt64 = TLV8GetUInt64(v7, v12, 7, &v94, 0);
          if (v94)
          {
            v13 = 0;
            v14 = 0;
            v15 = 0;
            goto LABEL_18;
          }
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", UInt64));
          v94 = TLV8GetOrCopyCoalesced(v7, v12, 10, &v93, &v92, &v91, 0);
          if (v94)
          {
            v13 = 0;
            v14 = 0;
            goto LABEL_18;
          }
          v13 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v93, v92));
          if (v91)
          {
            free(v91);
            v91 = 0;
          }
          v76 = (void *)v13;
          if (v13)
          {
            v29 = (id)v13;
            v79 = objc_msgSend(v29, "length");
            if (v79)
            {
              *(_WORD *)buf = 0;
              objc_msgSend(v29, "getBytes:length:", buf, 2);
              v30 = 0;
              v13 = buf[0] & 0x40 | (16 * ((*(unsigned __int16 *)buf >> 2) & 3)) | (*(unsigned __int16 *)buf >> 6) & 8 | (*(unsigned __int16 *)buf >> 2) & 0x100 | ((2 * *(unsigned __int16 *)buf) | (*(unsigned __int16 *)buf >> 3)) & 6 | ((~*(unsigned __int16 *)buf & 0x180) == 0);
            }
            else
            {
              v30 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 12, CFSTR("The characteristic properties descriptor value is missing."), 0, 0, 0));
              v13 = 0;
            }

            v25 = v30;
            if (v79)
            {

              v89 = 0;
              v90 = 0;
              v31 = objc_alloc_init(HAPMetadataConstraints);
              v32 = TLV8GetOrCopyCoalesced(v7, v12, 11, &v93, &v92, &v91, 0);
              v94 = v32;
              if (v32 == -6727)
              {
                v80 = 0;
              }
              else
              {
                if (v32)
                {
                  v80 = 0;
                  goto LABEL_82;
                }
                v33 = objc_alloc((Class)NSString);
                v34 = objc_msgSend(v33, "initWithBytes:length:encoding:", v93, v92, 4);
                if (v91)
                {
                  v77 = v31;
                  v35 = v34;
                  free(v91);
                  v34 = v35;
                  v31 = v77;
                  v91 = 0;
                }
                v80 = v34;
                if (!v34)
                {
                  v78 = v31;
                  v80 = 0;
LABEL_40:
                  v14 = 0;
LABEL_41:
                  v36 = -6737;
                  goto LABEL_42;
                }
              }
              v94 = 0;
              v94 = TLV8GetOrCopyCoalesced(v7, v12, 12, &v93, &v92, &v91, 0);
              if (!v94)
              {
                v88 = 0;
                v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v93, v92));
                v72 = v37;
                if (v91)
                {
                  free(v91);
                  v37 = v72;
                  v91 = 0;
                }
                v78 = v31;
                if (v37)
                {
                  v87 = v25;
                  v67 = sub_1000528EC(v37, (uint64_t)&v88, &v87);
                  v38 = v87;

                  if (v67)
                  {
                    v86 = v38;
                    v68 = sub_100052A00(v88, &v90, &v86);
                    v25 = v86;

                    if (v68)
                    {
                      v85 = 0;
                      v39 = sub_100052AC0(v88, &v89, &v85);
                      v40 = v85;
                      if ((v39 & 1) == 0)
                      {
                        v69 = v40;
                        v42 = sub_10007CCE4(0, v41);
                        v43 = objc_claimAutoreleasedReturnValue(v42);
                        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                        {
                          v44 = sub_10007CD2C(0);
                          v66 = (void *)objc_claimAutoreleasedReturnValue(v44);
                          *(_DWORD *)buf = 138543618;
                          v96 = v66;
                          v97 = 2112;
                          v98 = v69;
                          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%{public}@[HAPBTLE] Failed to parse characteristic unit type with error: %@", buf, 0x16u);

                        }
                        v89 = 0;
                        v40 = v69;
                      }

                      v45 = TLV8GetOrCopyCoalesced(v7, v12, 13, &v93, &v92, &v91, 0);
                      v94 = v45;
                      if (v45 == -6727)
                        goto LABEL_100;
                      if (!v45)
                      {
                        v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v93, v92));
                        if (v91)
                        {
                          free(v91);
                          v91 = 0;
                        }
                        if (!v46)
                          goto LABEL_40;
                        v84 = v25;
                        v73 = sub_100052BE4(v46, v90, v78, &v84);
                        v70 = v46;
                        v47 = v84;

                        v25 = v47;
                        if (v73)
                        {
LABEL_100:
                          v94 = 0;
                          v48 = TLV8GetOrCopyCoalesced(v7, v12, 14, &v93, &v92, &v91, 0);
                          v94 = v48;
                          if (v48 == -6727)
                            goto LABEL_66;
                          if (!v48)
                          {
                            v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v93, v92));
                            if (v91)
                            {
                              free(v91);
                              v91 = 0;
                            }
                            if (!v49)
                              goto LABEL_40;
                            v83 = v25;
                            v74 = sub_100053030(v49, v90, v78, &v83);
                            v50 = v83;
                            v51 = v25;
                            v25 = v50;

                            if (v74)
                            {
LABEL_66:
                              v94 = 0;
                              v52 = TLV8GetOrCopyCoalesced(v7, v12, 17, &v93, &v92, &v91, 0);
                              v94 = v52;
                              if (v52 == -6727)
                                goto LABEL_72;
                              if (!v52)
                              {
                                v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v93, v92));
                                if (v91)
                                {
                                  free(v91);
                                  v91 = 0;
                                }
                                if (!v53)
                                  goto LABEL_40;
                                v82 = v25;
                                v75 = sub_10005329C(v53, v90, v78, &v82);
                                v71 = v53;
                                v54 = v82;

                                v25 = v54;
                                if (v75)
                                {
LABEL_72:
                                  v94 = 0;
                                  v55 = TLV8GetOrCopyCoalesced(v7, v12, 18, &v93, &v92, &v91, 0);
                                  v94 = v55;
                                  if (v55 == -6727)
                                    goto LABEL_78;
                                  v31 = v78;
                                  if (v55)
                                    goto LABEL_82;
                                  v14 = (HAPCharacteristicMetadata *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v93, v92));
                                  if (v91)
                                  {
                                    free(v91);
                                    v91 = 0;
                                  }
                                  if (!v14)
                                    goto LABEL_41;
                                  v81 = v25;
                                  v56 = sub_100053604(v14, v90, v78, &v81);
                                  v57 = v81;
                                  v58 = v25;
                                  v25 = v57;

                                  if (v56)
                                  {
LABEL_78:
                                    v94 = 0;
                                    v59 = [HAPCharacteristicMetadata alloc];
                                    v60 = sub_1000741FC(v90);
                                    v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
                                    v62 = sub_100074438(v89);
                                    v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
                                    v14 = -[HAPCharacteristicMetadata initWithConstraints:description:format:units:](v59, "initWithConstraints:description:format:units:", v78, v80, v61, v63);

                                    if (v14)
                                      goto LABEL_79;
                                    v36 = -6705;
LABEL_42:
                                    v94 = v36;
LABEL_79:

                                    goto LABEL_19;
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                      v31 = v78;
                      goto LABEL_82;
                    }
                  }
                  else
                  {
                    v25 = v38;
                  }
                }
                else
                {
                  v94 = -6737;
                }

                v14 = 0;
                goto LABEL_79;
              }
LABEL_82:

              v64 = v80;
LABEL_83:

              v14 = 0;
              goto LABEL_19;
            }
          }
          else
          {
            v25 = 0;
            v94 = -6737;
          }
          v64 = v76;
          goto LABEL_83;
        }
        v13 = 0;
        v14 = 0;
        v15 = 0;
        goto LABEL_90;
      }
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
    }
    else
    {
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 0;
    }
    v25 = 0;
    v65 = -6743;
LABEL_91:
    v94 = v65;
    goto LABEL_19;
  }
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
LABEL_18:
  v25 = 0;
LABEL_19:
  if (!v25 && v94)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithOSStatus:](NSError, "errorWithOSStatus:"));
    v25 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 12, CFSTR("Signature request failed."), CFSTR("Failed to parse signature response body."), 0, v26));

  }
  if (v25)
  {
    v27 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v25);
  }
  else
  {
    v27 = -[HAPBTLECharacteristicSignature initWithCharacteristicType:serviceInstanceID:serviceType:characteristicProperties:characteristicMetadata:authenticated:]([HAPBTLECharacteristicSignature alloc], "initWithCharacteristicType:serviceInstanceID:serviceType:characteristicProperties:characteristicMetadata:authenticated:", v17, v15, v16, v13, v14, objc_msgSend(v5, "isEncrypted"));
  }

  return v27;
}

+ (id)parseServiceSignatureResponse:(id)a3 serviceInstanceID:(id)a4 serviceType:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  char *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  char *v19;
  int v20;
  id v21;
  void *v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  HAPBTLEServiceSignature *v27;
  HAPBTLEServiceSignature *v28;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "body")));
  v13 = objc_msgSend(v12, "bytes");

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "body"));
  v15 = (char *)objc_msgSend(v14, "length");

  v34 = 0;
  v35 = 0;
  v32 = 0;
  v33 = 0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "request"));
  v18 = objc_msgSend(v17, "type");

  if (v18 == 6)
  {
    v19 = &v15[(_QWORD)v13];
    v20 = TLV8GetOrCopyCoalesced(v13, &v15[(_QWORD)v13], 15, &v35, &v34, &v33, 0);
    v21 = 0;
    if (!v20)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v35, v34));
      if (v33)
      {
        free(v33);
        v33 = 0;
      }
      if (!v22)
      {
        v21 = 0;
LABEL_19:
        v25 = 4294960559;
LABEL_22:

        goto LABEL_23;
      }
      v31 = 0;
      v23 = sub_100053E84(v22, &v32, &v31);
      v21 = v31;
      if (!v23)
      {
        v25 = 0;
        goto LABEL_22;
      }

    }
    v24 = TLV8GetOrCopyCoalesced(v13, v19, 16, &v35, &v34, &v33, 0);
    if ((_DWORD)v24 == -6727)
      goto LABEL_27;
    v25 = v24;
    if (!(_DWORD)v24)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v35, v34));
      if (v33)
      {
        free(v33);
        v33 = 0;
      }
      if (v22)
      {
        if (!objc_msgSend(v22, "length"))
        {
          v26 = v21;
          goto LABEL_26;
        }
        v30 = v21;
        v25 = sub_100053F38(v22, v16, &v30);
        v26 = v30;

        if ((_DWORD)v25)
        {
          objc_msgSend(v16, "removeObject:", v10);
LABEL_26:

          v21 = v26;
          goto LABEL_27;
        }
        v21 = v26;
        goto LABEL_22;
      }
      goto LABEL_19;
    }
  }
  else
  {
    v21 = 0;
    v25 = 4294960591;
  }
LABEL_23:
  if (!v21 && (_DWORD)v25)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithOSStatus:](NSError, "errorWithOSStatus:", v25));
    v26 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 12, CFSTR("Service Signature response failed."), CFSTR("Failed to parse service signature response body."), 0, v22));
    goto LABEL_26;
  }
LABEL_27:
  if (v21)
  {
    v27 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v21);
  }
  else
  {
    v28 = [HAPBTLEServiceSignature alloc];
    v27 = -[HAPBTLEServiceSignature initWithServiceType:serviceInstanceID:serviceProperties:linkedServices:authenticated:](v28, "initWithServiceType:serviceInstanceID:serviceProperties:linkedServices:authenticated:", v11, v10, v32, v16, objc_msgSend(v9, "isEncrypted"));
  }

  return v27;
}

- (void)_handleReadCharacteristicSignature:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12[7];

  v11 = a3;
  v6 = a4;
  if (v6)
  {
    if (!-[_HAPAccessoryServerBTLE200 _shouldIgnoreRetryDiscoveryError:](self, "_shouldIgnoreRetryDiscoveryError:", v6))
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = (id)3221225472;
      v12[2] = sub_100054178;
      v12[3] = &unk_100236EA8;
      v12[4] = self;
      v12[5] = v11;
      v12[6] = v6;
      v7 = v6;
      sub_100054178(v12);
      -[_HAPAccessoryServerBTLE200 _cancelDiscoveryWithError:](self, "_cancelDiscoveryWithError:", v7);

    }
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "readingSignatureCharacteristics"));
    objc_msgSend(v9, "removeObject:", v11);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext"));
    LODWORD(v9) = objc_msgSend(v10, "isComplete");

    if ((_DWORD)v9)
      -[_HAPAccessoryServerBTLE200 _handleCompletedDiscovery](self, "_handleCompletedDiscovery");
  }

}

- (void)_handleReadServiceSignature:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12[7];

  v11 = a3;
  v6 = a4;
  if (v6)
  {
    if (!-[_HAPAccessoryServerBTLE200 _shouldIgnoreRetryDiscoveryError:](self, "_shouldIgnoreRetryDiscoveryError:", v6))
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = (id)3221225472;
      v12[2] = sub_1000543CC;
      v12[3] = &unk_100236EA8;
      v12[4] = self;
      v12[5] = v11;
      v12[6] = v6;
      v7 = v6;
      sub_1000543CC(v12);
      -[_HAPAccessoryServerBTLE200 _cancelDiscoveryWithError:](self, "_cancelDiscoveryWithError:", v7);

    }
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "readingSignatureServices"));
    objc_msgSend(v9, "removeObject:", v11);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext"));
    LODWORD(v9) = objc_msgSend(v10, "isComplete");

    if ((_DWORD)v9)
      -[_HAPAccessoryServerBTLE200 _handleCompletedDiscovery](self, "_handleCompletedDiscovery");
  }

}

+ (BOOL)isHAPService:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDGenericAccessProfileString));
  if (objc_msgSend(v4, "isEqual:", v5))
    goto LABEL_10;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDGenericAttributeProfileString));
  if ((objc_msgSend(v6, "isEqual:", v7) & 1) != 0)
  {
LABEL_9:

LABEL_10:
    goto LABEL_11;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDContinuityServiceString));
  if ((objc_msgSend(v8, "isEqual:", v9) & 1) != 0)
  {
LABEL_8:

    goto LABEL_9;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDAppleNotificationCenterServiceString));
  if ((objc_msgSend(v10, "isEqual:", v11) & 1) != 0)
  {

    goto LABEL_8;
  }
  v33 = v11;
  v34 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDAppleMediaServiceString));
  if ((objc_msgSend(v12, "isEqual:", v13) & 1) != 0)
  {

    goto LABEL_8;
  }
  v32 = v13;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUID"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDAppleAccessoryReconnectServiceString));
  v31 = v16;
  if ((objc_msgSend(v16, "isEqual:") & 1) != 0)
  {
    v17 = 1;
    v18 = v32;
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUID"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDDeviceInformationServiceString));
    v29 = v19;
    if ((objc_msgSend(v19, "isEqual:") & 1) != 0)
    {
      v17 = 1;
    }
    else
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUID"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CBUUIDBatteryServiceString));
      v17 = objc_msgSend(v27, "isEqual:");

    }
    v18 = v32;

  }
  if ((v17 & 1) != 0)
    goto LABEL_12;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "characteristics"));
  v22 = objc_msgSend(v21, "count");

  if (!v22)
  {
LABEL_32:
    v14 = 1;
    goto LABEL_13;
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "characteristics"));
  v23 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v36;
    while (2)
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v25)
          objc_enumerationMutation(v4);
        if ((sub_10004EAB8(*(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i)) & 1) != 0)
        {

          goto LABEL_32;
        }
      }
      v24 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v24)
        continue;
      break;
    }
  }
LABEL_11:

LABEL_12:
  v14 = 0;
LABEL_13:

  return v14;
}

- (BOOL)isHAPCharacteristic:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = a3;
  if ((sub_10004EAB8(v3) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "descriptors"));
    if (objc_msgSend(v5, "count"))
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v6 = v5;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
      {
        v8 = v7;
        v15 = v5;
        v9 = *(_QWORD *)v17;
        while (2)
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(_QWORD *)v17 != v9)
              objc_enumerationMutation(v6);
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "UUID"));
            v12 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("DC46F0FE-81D2-4616-B5D9-6ABDD796939A")));
            v13 = objc_msgSend(v11, "isEqual:", v12);

            if ((v13 & 1) != 0)
            {
              v4 = 1;
              goto LABEL_14;
            }
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v8)
            continue;
          break;
        }
        v4 = 0;
LABEL_14:
        v5 = v15;
      }
      else
      {
        v4 = 0;
      }

    }
    else
    {
      v4 = 1;
    }

  }
  return v4;
}

- (BOOL)shouldVerifyHAPCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  void *v24;
  _HAPAccessoryServerBTLE200 *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v30;
  void *v31;
  void *v32;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "service"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("FED4")));
  if (objc_msgSend(v6, "isEqual:", v7))
  {

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "service"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("00000010-0000-1000-8000-4D69736D6574")));
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_10;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("00000011-0000-1000-8000-4D69736D6574")));
  if (!objc_msgSend(v12, "isEqual:", v13))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("00000012-0000-1000-8000-4D69736D6574")));
    if ((objc_msgSend(v14, "isEqual:", v9) & 1) != 0)
    {

      goto LABEL_7;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("00000013-0000-1000-8000-4D69736D6574")));
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if ((v18 & 1) != 0)
      goto LABEL_8;
LABEL_10:
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "service"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "UUID"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("FED3")));
    v22 = objc_msgSend(v20, "isEqual:", v21);
    if ((v22 & 1) == 0)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "service"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "UUID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("0000003E-0000-1000-8000-4D69736D6574")));
      if (!objc_msgSend(v24, "isEqual:", v9))
      {
        LOBYTE(v28) = 0;
LABEL_19:

LABEL_20:
        v15 = v28 ^ 1;
        goto LABEL_21;
      }
      v30 = v24;
      v32 = v23;
    }
    v25 = self;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUID", v30));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("00000014-0000-1000-8000-4D69736D6574")));
    if (objc_msgSend(v26, "isEqual:", v27))
      v28 = !-[HAPAccessoryServerBTLE isPaired](v25, "isPaired");
    else
      LOBYTE(v28) = 0;
    v24 = v31;

    v23 = v32;
    if ((v22 & 1) != 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_7:

LABEL_8:
  v15 = 0;
LABEL_21:

  return v15;
}

- (BOOL)shouldVerifyHAPService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  char v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("FED4")));
  if (objc_msgSend(v5, "isEqual:", v6))
  {

LABEL_4:
    v10 = 0;
    goto LABEL_12;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("00000010-0000-1000-8000-4D69736D6574")));
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if ((v9 & 1) != 0)
    goto LABEL_4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("FED3")));
  if ((objc_msgSend(v11, "isEqual:", v12) & 1) != 0)
  {
    v13 = !-[HAPAccessoryServerBTLE isPaired](self, "isPaired");
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("0000003E-0000-1000-8000-4D69736D6574")));
    if (objc_msgSend(v14, "isEqual:", v15))
      v13 = !-[HAPAccessoryServerBTLE isPaired](self, "isPaired");
    else
      LOBYTE(v13) = 0;

  }
  v10 = v13 ^ 1;
LABEL_12:

  return v10;
}

+ (BOOL)isHAPDescriptor:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "UUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("DC46F0FE-81D2-4616-B5D9-6ABDD796939A")));
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (id)_parseService:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  __CFString *v14;
  uint64_t v15;
  void *i;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  id v20;
  id v21;
  _HAPAccessoryServerBTLE200 *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  __CFString *v26;
  void *v27;
  _HAPAccessoryServerBTLE200 *v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  __CFString *v32;
  void *v33;
  HAPService *v34;
  void *v35;
  _HAPAccessoryServerBTLE200 *v36;
  uint64_t v37;
  id v38;
  NSObject *v39;
  __CFString *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  unsigned __int8 v57;
  void *v58;
  unsigned __int8 v59;
  void *v60;
  void *v61;
  void *v62;
  HAPService *v63;
  void *v64;
  id v65;
  id v66;
  void *v67;
  id v68;
  HAPService *v69;
  _HAPAccessoryServerBTLE200 *v70;
  uint64_t v71;
  id v72;
  NSObject *v73;
  __CFString *v74;
  void *v75;
  _HAPAccessoryServerBTLE200 *v76;
  uint64_t v77;
  id v78;
  NSObject *v79;
  __CFString *v81;
  void *v82;
  __CFString *v83;
  _HAPAccessoryServerBTLE200 *v84;
  uint64_t v85;
  id v86;
  NSObject *v87;
  __CFString *v88;
  void *v89;
  void *v90;
  __CFString *v91;
  _HAPAccessoryServerBTLE200 *v92;
  uint64_t v93;
  id v94;
  NSObject *v95;
  void *v96;
  __CFString *v97;
  _HAPAccessoryServerBTLE200 *v98;
  uint64_t v99;
  id v100;
  NSObject *v101;
  __CFString *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  id v110;
  __CFString *v111;
  void *v112;
  id v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  id *v120;
  _HAPAccessoryServerBTLE200 *v121;
  void *v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  id v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  uint8_t v132[128];
  uint8_t buf[4];
  void *v134;
  __int16 v135;
  const __CFString *v136;
  __int16 v137;
  id v138;
  _BYTE v139[128];

  v6 = a3;
  v120 = a4;
  if ((objc_msgSend((id)objc_opt_class(self, v7), "isHAPService:", v6) & 1) == 0)
  {
    v28 = self;
    v30 = sub_10007CCE4((uint64_t)v28, v29);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = sub_10007CD2C(v28);
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      *(_DWORD *)buf = 138543618;
      v134 = v33;
      v135 = 2112;
      v136 = CFSTR("Service does not support HAP");
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

      a4 = v120;
    }

    v34 = 0;
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 3, CFSTR("Service does not support HAP"), 0, 0, 0));
    goto LABEL_77;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[HAPAccessoryServerBTLE hapUUIDFromBTLEUUID:](HAPAccessoryServerBTLE, "hapUUIDFromBTLEUUID:", v8));

  if (!v9)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUID"));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to convert UUID '%@' to HAP UUID"), v35));

    v36 = self;
    v38 = sub_10007CCE4((uint64_t)v36, v37);
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v40 = sub_10007CD2C(v36);
      v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      *(_DWORD *)buf = 138543618;
      v134 = v41;
      v135 = 2112;
      v136 = v14;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

      a4 = v120;
    }

    v34 = 0;
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 3, v14, 0, 0, 0));
    goto LABEL_76;
  }
  v117 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "characteristics"));
  v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v10, "count")));

  v130 = 0u;
  v131 = 0u;
  v128 = 0u;
  v129 = 0u;
  v114 = v6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "characteristics"));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v128, v139, 16);
  v121 = self;
  if (!v12)
  {
    v14 = 0;
    goto LABEL_33;
  }
  v13 = v12;
  v14 = 0;
  v15 = *(_QWORD *)v129;
  v118 = v11;
  do
  {
    for (i = 0; i != v13; i = (char *)i + 1)
    {
      v17 = v14;
      if (*(_QWORD *)v129 != v15)
        objc_enumerationMutation(v11);
      v18 = *(__CFString **)(*((_QWORD *)&v128 + 1) + 8 * (_QWORD)i);
      if (-[_HAPAccessoryServerBTLE200 isHAPCharacteristic:](self, "isHAPCharacteristic:", v18))
      {
        v127 = 0;
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 _parseCharacteristic:error:](self, "_parseCharacteristic:error:", v18, &v127));
        v20 = v127;
        if (v19)
        {
          objc_msgSend(v122, "addObject:", v19);
        }
        else
        {
          v22 = self;
          v24 = sub_10007CCE4((uint64_t)v22, v23);
          v25 = objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v26 = sub_10007CD2C(v22);
            v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
            *(_DWORD *)buf = 138543874;
            v134 = v27;
            v135 = 2112;
            v136 = v18;
            v137 = 2112;
            v138 = v20;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to parse characteristic, %@, with error: %@", buf, 0x20u);

            a4 = v120;
          }

          v11 = v118;
          self = v121;
        }

LABEL_19:
        v14 = v17;
        continue;
      }
      if (!sub_10004EAB8(v18))
        goto LABEL_19;
      if (v17)
      {
        v70 = self;
        v72 = sub_10007CCE4((uint64_t)v70, v71);
        v73 = objc_claimAutoreleasedReturnValue(v72);
        v9 = v117;
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
          v74 = sub_10007CD2C(v70);
          v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
          *(_DWORD *)buf = 138543618;
          v134 = v75;
          v135 = 2112;
          v136 = CFSTR("Invalid service, multiple Service Instance ID characteristics.");
          _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

          a4 = v120;
        }

        v34 = 0;
        if (a4)
          *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 9, CFSTR("Invalid service, multiple Service Instance ID characteristics."), 0, 0, 0));
        v14 = v17;
        v6 = v114;
        goto LABEL_75;
      }
      v21 = sub_1000500F4(v18, a4);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue(v21);
      if (!v14)
      {
        v76 = self;
        v78 = sub_10007CCE4((uint64_t)v76, v77);
        v79 = objc_claimAutoreleasedReturnValue(v78);
        if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
        {
          v81 = sub_10007CD2C(v76);
          v82 = (void *)objc_claimAutoreleasedReturnValue(v81);
          *(_DWORD *)buf = 138543362;
          v134 = v82;
          _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse Service Instance ID", buf, 0xCu);

        }
        v34 = 0;
        v14 = 0;
        v6 = v114;
        goto LABEL_74;
      }
    }
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v128, v139, 16);
  }
  while (v13);
LABEL_33:

  v125 = 0u;
  v126 = 0u;
  v123 = 0u;
  v124 = 0u;
  v42 = v122;
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v123, v132, 16);
  v9 = v117;
  if (!v43)
    goto LABEL_45;
  v44 = v43;
  v115 = *(_QWORD *)v124;
  while (2)
  {
    v45 = 0;
    while (2)
    {
      if (*(_QWORD *)v124 != v115)
        objc_enumerationMutation(v42);
      v46 = v42;
      v47 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * (_QWORD)v45);
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "characteristicSignatures"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "cbCharacteristic"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKey:", v50));

      if (!v51)
      {
        v83 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Missing characteristic signature for characteristic: %@"), v47));
        v84 = v121;
        v86 = sub_10007CCE4((uint64_t)v84, v85);
        v87 = objc_claimAutoreleasedReturnValue(v86);
        if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
        {
          v88 = sub_10007CD2C(v84);
          v89 = (void *)objc_claimAutoreleasedReturnValue(v88);
          *(_DWORD *)buf = 138543618;
          v134 = v89;
          v135 = 2112;
          v136 = v83;
          _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

        }
        v6 = v114;
        v11 = v46;
        if (v120)
          *v120 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 9, v83, 0, 0, 0));

        v34 = 0;
LABEL_74:
        v9 = v117;
        goto LABEL_75;
      }
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "serviceType"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "UUIDString"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", v53));

      v55 = (void *)objc_claimAutoreleasedReturnValue(+[HAPAccessoryServerBTLE hapUUIDFromBTLEUUID:](HAPAccessoryServerBTLE, "hapUUIDFromBTLEUUID:", v54));
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "serviceType"));
      if ((objc_msgSend(v56, "isEqual:", v117) & 1) != 0)
      {

        goto LABEL_42;
      }
      v57 = objc_msgSend(v55, "isEqual:", v117);

      if ((v57 & 1) == 0)
      {
        v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "serviceType"));
        v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "UUIDString"));
        v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "UUIDString"));
        v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "UUIDString"));
        v108 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("The authenticated service type, %@, does not match the service type, %@ or %@, for characteristic: %@"), v105, v106, v107, v47));

        v91 = (__CFString *)v108;
        v92 = v121;
        v110 = sub_10007CCE4((uint64_t)v92, v109);
        v95 = objc_claimAutoreleasedReturnValue(v110);
        if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
        {
LABEL_70:
          v111 = sub_10007CD2C(v92);
          v112 = (void *)objc_claimAutoreleasedReturnValue(v111);
          *(_DWORD *)buf = 138543618;
          v134 = v112;
          v135 = 2112;
          v136 = v91;
          _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

        }
LABEL_71:

        v6 = v114;
        if (v120)
          *v120 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 9, v91, 0, 0, 0));

        v34 = 0;
        v11 = v46;
        goto LABEL_74;
      }
LABEL_42:
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "serviceInstanceID"));
      v59 = objc_msgSend(v58, "isEqualToNumber:", v14);

      if ((v59 & 1) == 0)
      {
        v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "serviceInstanceID"));
        v91 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("The authenticated service instance ID, %@, does not match the service instance ID, %@, for characteristic: %@"), v90, v14, v47));

        v92 = v121;
        v94 = sub_10007CCE4((uint64_t)v92, v93);
        v95 = objc_claimAutoreleasedReturnValue(v94);
        if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
          goto LABEL_70;
        goto LABEL_71;
      }

      v45 = (char *)v45 + 1;
      v42 = v46;
      self = v121;
      if (v44 != v45)
        continue;
      break;
    }
    v44 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v123, v132, 16);
    v9 = v117;
    if (v44)
      continue;
    break;
  }
LABEL_45:
  v119 = v42;

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "serviceSignatures"));
  v6 = v114;
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "objectForKey:", v114));

  v63 = [HAPService alloc];
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
  v65 = objc_msgSend(v42, "copy");
  v66 = objc_msgSend(v62, "serviceProperties");
  v116 = v62;
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "linkedServices"));
  v68 = objc_msgSend(v67, "copy");
  v34 = -[HAPService initWithType:instanceID:parsedCharacteristics:serviceProperties:linkedServices:](v63, "initWithType:instanceID:parsedCharacteristics:serviceProperties:linkedServices:", v64, v14, v65, v66, v68);

  if (v34)
  {
    -[HAPService setCBService:](v34, "setCBService:", v114);
    v69 = v34;
  }
  else
  {
    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
    v97 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to create service with type, %@, service instance ID, %@, characteristics, %@"), v96, v14, v119));

    v98 = v121;
    v100 = sub_10007CCE4((uint64_t)v98, v99);
    v101 = objc_claimAutoreleasedReturnValue(v100);
    if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
    {
      v102 = sub_10007CD2C(v98);
      v103 = (void *)objc_claimAutoreleasedReturnValue(v102);
      *(_DWORD *)buf = 138543618;
      v134 = v103;
      v135 = 2112;
      v136 = v97;
      _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    if (v120)
      *v120 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 3, v97, 0, 0, 0));

    v6 = v114;
  }

  v11 = v116;
LABEL_75:

LABEL_76:
LABEL_77:

  return v34;
}

- (id)_parseCharacteristic:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _HAPAccessoryServerBTLE200 *v23;
  void *v24;
  unsigned __int8 v25;
  HAPCharacteristic *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  NSObject *v31;
  void *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  _HAPAccessoryServerBTLE200 *v37;
  uint64_t v38;
  id v39;
  NSObject *v40;
  __CFString *v41;
  void *v42;
  NSObject *v43;
  _HAPAccessoryServerBTLE200 *v44;
  uint64_t v45;
  id v46;
  NSObject *v47;
  __CFString *v48;
  void *v49;
  NSObject *v50;
  _HAPAccessoryServerBTLE200 *v51;
  uint64_t v52;
  id v53;
  NSObject *v54;
  __CFString *v55;
  void *v56;
  void *v57;
  _HAPAccessoryServerBTLE200 *v58;
  uint64_t v59;
  id v60;
  NSObject *v61;
  __CFString *v62;
  id *v63;
  void *v64;
  uint64_t v65;
  id v66;
  __CFString *v67;
  void *v68;
  _HAPAccessoryServerBTLE200 *v69;
  uint64_t v70;
  id v71;
  NSObject *v72;
  __CFString *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  _HAPAccessoryServerBTLE200 *v78;
  uint64_t v79;
  id v80;
  NSObject *v81;
  __CFString *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  uint64_t v87;
  _HAPAccessoryServerBTLE200 *v88;
  uint64_t v89;
  id v90;
  NSObject *v91;
  __CFString *v92;
  void *v93;
  uint64_t v95;
  _HAPAccessoryServerBTLE200 *v96;
  void *v97;
  id *v98;
  id v99;
  __CFString *obj;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  uint8_t v105[128];
  uint8_t buf[4];
  void *v107;
  __int16 v108;
  const __CFString *v109;

  v6 = a3;
  if (-[_HAPAccessoryServerBTLE200 isHAPCharacteristic:](self, "isHAPCharacteristic:", v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[HAPAccessoryServerBTLE hapUUIDFromBTLEUUID:](HAPAccessoryServerBTLE, "hapUUIDFromBTLEUUID:", v7));

    if (v8)
    {
      v98 = a4;
      v99 = v6;
      v101 = 0u;
      v102 = 0u;
      v103 = 0u;
      v104 = 0u;
      obj = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "descriptors"));
      v9 = -[__CFString countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v101, v105, 16);
      if (v9)
      {
        v10 = v9;
        v96 = self;
        v97 = v8;
        v11 = 0;
        v12 = *(_QWORD *)v102;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v102 != v12)
              objc_enumerationMutation(obj);
            v14 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * (_QWORD)i);
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUID"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("DC46F0FE-81D2-4616-B5D9-6ABDD796939A")));
            v17 = objc_msgSend(v15, "isEqual:", v16);

            if (v17)
            {
              v18 = v14;

              v11 = v18;
            }
          }
          v10 = -[__CFString countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v101, v105, 16);
        }
        while (v10);
        v8 = v97;
        if (v11)
        {
          v19 = sub_10004FE68(v11, v98);
          v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          if (v20)
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](self, "discoveryContext"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "characteristicSignatures"));
            v23 = (_HAPAccessoryServerBTLE200 *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", v99));

            if (!v23)
            {
              v31 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Missing characteristic signature for characteristic: %@"), v99));
              v69 = self;
              v71 = sub_10007CCE4((uint64_t)v69, v70);
              v72 = objc_claimAutoreleasedReturnValue(v71);
              if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
              {
                v73 = sub_10007CD2C(v69);
                v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
                *(_DWORD *)buf = 138543618;
                v107 = v74;
                v108 = 2112;
                v109 = (const __CFString *)v31;
                _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

              }
              v50 = 0;
              if (v98)
                *v98 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 9, v31, 0, 0, 0));
              v8 = v97;
              goto LABEL_56;
            }
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 characteristicType](v23, "characteristicType"));
            v8 = v97;
            v25 = objc_msgSend(v24, "isEqual:", v97);

            if ((v25 & 1) != 0)
            {
              v26 = [HAPCharacteristic alloc];
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "UUIDString"));
              v28 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServerBTLE stateNumber](self, "stateNumber"));
              v29 = -[_HAPAccessoryServerBTLE200 characteristicProperties](v23, "characteristicProperties");
              v30 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 characteristicMetadata](v23, "characteristicMetadata"));
              LOBYTE(v95) = 1;
              v31 = -[HAPCharacteristic initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:implicitWriteWithResponse:metadata:](v26, "initWithType:instanceID:value:stateNumber:properties:eventNotificationsEnabled:implicitWriteWithResponse:metadata:", v27, v20, 0, v28, v29, 0, v95, v30);

              if (v31)
              {
                v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
                -[NSObject setValueUpdatedTime:](v31, "setValueUpdatedTime:", v32);

                -[NSObject setCBCharacteristic:](v31, "setCBCharacteristic:", v99);
                v33 = (__CFString *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 _characteristicForCBCharacteristic:](v96, "_characteristicForCBCharacteristic:", v99));
                if (-[__CFString isEqualToCharacteristic:](v33, "isEqualToCharacteristic:", v31)
                  && (v34 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString metadata](v33, "metadata")),
                      v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject metadata](v31, "metadata")),
                      v36 = objc_msgSend(v34, "isEqualToCharacteristicMetadata:", v35),
                      v35,
                      v34,
                      v36))
                {
                  v37 = v96;
                  v39 = sub_10007CCE4((uint64_t)v37, v38);
                  v40 = objc_claimAutoreleasedReturnValue(v39);
                  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
                  {
                    v41 = sub_10007CD2C(v37);
                    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
                    *(_DWORD *)buf = 138543618;
                    v107 = v42;
                    v108 = 2112;
                    v109 = v33;
                    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "%{public}@Using existing characteristic: %@", buf, 0x16u);

                  }
                  v43 = v33;
                  v33 = (__CFString *)v43;
                }
                else
                {
                  v43 = v31;
                }
                v50 = v43;
                v8 = v97;
              }
              else
              {
                v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "UUIDString"));
                v85 = -[_HAPAccessoryServerBTLE200 characteristicProperties](v23, "characteristicProperties");
                v86 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 characteristicMetadata](v23, "characteristicMetadata"));
                v87 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to create characteristic with type, %@, characteristic instance ID, %@, properties, %tu, metadata, %@"), v84, v20, v85, v86));

                v88 = v96;
                v90 = sub_10007CCE4((uint64_t)v88, v89);
                v91 = objc_claimAutoreleasedReturnValue(v90);
                if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
                {
                  v92 = sub_10007CD2C(v88);
                  v93 = (void *)objc_claimAutoreleasedReturnValue(v92);
                  *(_DWORD *)buf = 138543618;
                  v107 = v93;
                  v108 = 2112;
                  v109 = (const __CFString *)v87;
                  _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

                }
                if (v98)
                {
                  v33 = (__CFString *)v87;
                  v50 = 0;
                  *v98 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 3, v87, 0, 0, 0));
                }
                else
                {
                  v50 = 0;
                  v33 = (__CFString *)v87;
                }
              }

              goto LABEL_56;
            }
            v75 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 characteristicType](v23, "characteristicType"));
            v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "UUIDString"));
            v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "UUIDString"));
            v31 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("The authenticated characteristic type, %@, does not match the characteristic type, %@"), v76, v77));

            v78 = v96;
            v80 = sub_10007CCE4((uint64_t)v78, v79);
            v81 = objc_claimAutoreleasedReturnValue(v80);
            if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
            {
              v82 = sub_10007CD2C(v78);
              v83 = (void *)objc_claimAutoreleasedReturnValue(v82);
              *(_DWORD *)buf = 138543618;
              v107 = v83;
              v108 = 2112;
              v109 = (const __CFString *)v31;
              _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

            }
            if (v98)
            {
              v50 = 0;
              *v98 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 9, v31, 0, 0, 0));
LABEL_56:

              v6 = v99;
              goto LABEL_57;
            }
          }
          else
          {
            v23 = self;
            v66 = sub_10007CCE4((uint64_t)v23, v65);
            v31 = objc_claimAutoreleasedReturnValue(v66);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              v67 = sub_10007CD2C(v23);
              v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
              *(_DWORD *)buf = 138543362;
              v107 = v68;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse Characteristic Instance ID", buf, 0xCu);

            }
          }
          v50 = 0;
          goto LABEL_56;
        }
      }
      v51 = self;
      v53 = sub_10007CCE4((uint64_t)v51, v52);
      v54 = objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        v55 = sub_10007CD2C(v51);
        v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
        *(_DWORD *)buf = 138543618;
        v107 = v56;
        v108 = 2112;
        v109 = CFSTR("Characteristic missing characteristic instance ID descriptor");
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

      }
      v6 = v99;
      if (v98)
      {
        v50 = 0;
        *v98 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 9, CFSTR("Characteristic missing characteristic instance ID descriptor"), 0, 0, 0));
LABEL_57:

        goto LABEL_58;
      }
    }
    else
    {
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUID"));
      obj = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to convert UUID '%@' to HAP UUID"), v57));

      v58 = self;
      v60 = sub_10007CCE4((uint64_t)v58, v59);
      v61 = objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        v62 = sub_10007CD2C(v58);
        v63 = a4;
        v64 = (void *)objc_claimAutoreleasedReturnValue(v62);
        *(_DWORD *)buf = 138543618;
        v107 = v64;
        v108 = 2112;
        v109 = obj;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

        a4 = v63;
      }

      if (a4)
      {
        v50 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 3, obj, 0, 0, 0));
        goto LABEL_57;
      }
    }
    v50 = 0;
    goto LABEL_57;
  }
  v44 = self;
  v46 = sub_10007CCE4((uint64_t)v44, v45);
  v47 = objc_claimAutoreleasedReturnValue(v46);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
  {
    v48 = sub_10007CD2C(v44);
    v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
    *(_DWORD *)buf = 138543618;
    v107 = v49;
    v108 = 2112;
    v109 = CFSTR("Characteristic does not support HAP");
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

  }
  v50 = 0;
  if (a4)
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 3, CFSTR("Characteristic does not support HAP"), 0, 0, 0));
LABEL_58:

  return v50;
}

- (void)readCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD block[4];
  id v25;
  _HAPAccessoryServerBTLE200 *v26;
  id v27;
  id v28;
  id v29;
  double v30;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc((Class)HMFActivity);
  v15 = HMFMethodDescription(self, a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, %s:%ld"), v16, "/Library/Caches/com.apple.xbs/Sources/DockKit/dockaccessoryd/dockaccessoryd/HAP/CoreHAP/Servers/_HAPAccessoryServerBTLE200.m", 4214));
  v18 = objc_msgSend(v14, "initWithName:", v17);

  v19 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005695C;
  block[3] = &unk_100237508;
  v25 = v11;
  v26 = self;
  v28 = v12;
  v29 = v13;
  v30 = a4;
  v27 = v18;
  v20 = v12;
  v21 = v13;
  v22 = v18;
  v23 = v11;
  dispatch_async(v19, block);

}

- (void)_readCharacteristicValues:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *i;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  __CFString *v20;
  void *v21;
  void (*v22)(uint64_t, void *, void *);
  _HAPAccessoryServerBTLE200 *v23;
  NSObject *v24;
  id v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  id obj;
  _QWORD block[5];
  id v37;
  id v38;
  id v39;
  _QWORD v40[5];
  id v41;
  NSObject *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];

  v8 = a3;
  v33 = a4;
  v32 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v8, "count")));
  v10 = dispatch_group_create();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v8;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v44;
    v14 = sub_100057290;
    v34 = v9;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v44 != v13)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
        dispatch_group_enter(v10);
        v18 = sub_10007CCE4(0, v17);
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = sub_10007CD2C(0);
          v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          v22 = v14;
          v23 = self;
          v24 = v10;
          v25 = v12;
          v26 = v13;
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "instanceID"));
          *(_DWORD *)buf = 138543618;
          v48 = v21;
          v49 = 2112;
          v50 = v27;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Sending read for characteristic %{key:characteristicId}@", buf, 0x16u);

          v13 = v26;
          v12 = v25;
          v10 = v24;
          self = v23;
          v14 = v22;

          v9 = v34;
        }

        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = v14;
        v40[3] = &unk_100237530;
        v40[4] = self;
        v41 = v9;
        v42 = v10;
        -[_HAPAccessoryServerBTLE200 _readValueForCharacteristic:options:completionHandler:](self, "_readValueForCharacteristic:options:completionHandler:", v16, 1, v40);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    }
    while (v12);
  }

  v28 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100057404;
  block[3] = &unk_100237558;
  block[4] = self;
  v37 = v33;
  v38 = v9;
  v39 = v32;
  v29 = v9;
  v30 = v32;
  v31 = v33;
  dispatch_group_notify(v10, v28, block);

}

- (void)_updatePropertiesFromCharacteristic:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer primaryAccessory](self, "primaryAccessory"));
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("00000220-0000-1000-8000-4D69736D6574")))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "value"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[HAPAccessory productDataStringFromData:](HAPAccessory, "productDataStringFromData:", v6));
    -[HAPAccessoryServer setProductData:](self, "setProductData:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer productData](self, "productData"));
    objc_msgSend(v5, "setProductData:", v8);

  }
}

- (void)_readValueForCharacteristic:(id)a3 options:(int64_t)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  _HAPAccessoryServerBTLE200 *v13;
  uint64_t v14;
  _HAPAccessoryServerBTLE200 *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  __CFString *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _QWORD *v28;
  _HAPAccessoryServerBTLE200 *v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  __CFString *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id location;
  id v40;
  _BYTE buf[12];
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;

  v9 = a3;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "service"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "accessory"));
  v13 = (_HAPAccessoryServerBTLE200 *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "server"));

  if (v13 == self)
  {
    v40 = 0;
    v22 = objc_msgSend((id)objc_opt_class(self, v14), "readRequestForCharacteristic:options:error:", v9, a4, &v40);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v21 = v40;
    if (v23)
    {
      v24 = objc_alloc((Class)HMFActivity);
      v25 = HMFMethodDescription(self, a2);
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, %s:%ld"), v26, "/Library/Caches/com.apple.xbs/Sources/DockKit/dockaccessoryd/dockaccessoryd/HAP/CoreHAP/Servers/_HAPAccessoryServerBTLE200.m", 4352));
      *(_QWORD *)buf = objc_msgSend(v24, "initWithName:", v27);

      objc_initWeak(&location, self);
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_100057AF8;
      v35[3] = &unk_100237580;
      objc_copyWeak(&v38, &location);
      v36 = v9;
      v37 = v10;
      v28 = objc_retainBlock(v35);
      -[_HAPAccessoryServerBTLE200 _sendRequest:shouldPrioritize:responseHandler:](self, "_sendRequest:shouldPrioritize:responseHandler:", v23, ((unint64_t)a4 >> 1) & 1, v28);

      objc_destroyWeak(&v38);
      objc_destroyWeak(&location);
      __HMFActivityScopeLeave(buf);

    }
    else
    {
      v29 = self;
      v31 = sub_10007CCE4((uint64_t)v29, v30);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = sub_10007CD2C(v29);
        v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v34;
        v42 = 2112;
        v43 = v9;
        v44 = 2112;
        v45 = v21;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%{public}@Read failed, failed to create request for characteristic, %@, with error: %@", buf, 0x20u);

      }
      sub_1000579E0(v9, v10, 1, v21, CFSTR("Failed to create request."));
    }

  }
  else
  {
    v15 = self;
    v17 = sub_10007CCE4((uint64_t)v15, v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = sub_10007CD2C(v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v20;
      v42 = 2112;
      v43 = v9;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}@Read failed, characteristic is not part of server: %@", buf, 0x16u);

    }
    v21 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:](NSError, "hapErrorWithcode:", 11));
    sub_1000579E0(v9, v10, 1, v21, CFSTR("Characteristic is not part of server."));
  }

}

+ (id)readRequestForCharacteristic:(id)a3 options:(int64_t)a4 error:(id *)a5
{
  char v6;
  id v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;

  v6 = a4;
  v7 = a3;
  if ((objc_msgSend(v7, "properties") & 2) != 0)
  {
    a5 = -[HAPBTLERequest initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:]([HAPBTLERequest alloc], "initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:", v7, 3, 0, v6 & 1, 10.0);
  }
  else
  {
    v9 = sub_10007CCE4(0, v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = sub_10007CD2C(0);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      v17 = 2112;
      v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@[HAPBTLERequest] Read failed, characteristic does not support secured reads: %@", buf, 0x16u);

    }
    if (a5)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to read from characteristic %@."), v7));
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 11, v13, CFSTR("Characteristic does not support secured reads."), 0, 0));

      a5 = 0;
    }
  }

  return a5;
}

+ (BOOL)parseReadResponse:(id)a3 value:(id *)a4 notificationContext:(id *)a5 error:(id *)a6
{
  id v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  unsigned __int16 v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  __CFString *v32;
  void *v33;
  BOOL v34;
  uint64_t v36;
  id *v38;
  id v39;
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;

  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "request"));
  v11 = objc_msgSend(v10, "type");

  v38 = a5;
  if (v11 != 3)
  {
    v36 = 4294960591;
LABEL_25:
    v28 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithOSStatus:](NSError, "errorWithOSStatus:", v36));
    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 1, CFSTR("Read failed."), CFSTR("Failed to parse read request body."), 0, v28));
    v13 = 0;
    v26 = 0;
    v21 = 0;
    goto LABEL_9;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "body"));
  v41 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "extractSerializedRequestValueFromBodyData:error:", v12, &v41));
  v14 = v41;

  if (!v13)
  {
    if (v14)
    {
      v21 = 0;
      v26 = 0;
      v13 = 0;
      goto LABEL_10;
    }
    v36 = 4294960559;
    goto LABEL_25;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "request"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "characteristic"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "metadata"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "format"));
  v19 = sub_100074234(v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[HAPDataValueTransformer defaultDataValueTransformer](HAPDataValueTransformer, "defaultDataValueTransformer"));
  v40 = v14;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "reverseTransformedValue:format:error:", v13, v19, &v40));
  v22 = v40;

  if (v22)
  {
    v26 = 0;
    v14 = v22;
    goto LABEL_10;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "request"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "characteristic"));
  v25 = (unsigned __int16)objc_msgSend(v24, "properties");

  if ((v25 & 0x100) != 0)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "body"));
    v39 = 0;
    v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "extractNotificationContextFromBodyData:error:", v27, &v39));
    v14 = v39;

    v28 = a1;
    v30 = sub_10007CCE4((uint64_t)v28, v29);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = sub_10007CD2C(v28);
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      *(_DWORD *)buf = 138543874;
      v43 = v33;
      v44 = 2112;
      v45 = v26;
      v46 = 2112;
      v47 = v14;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "%{public}@Parsed read response notification context: %@ with error: %@", buf, 0x20u);

    }
LABEL_9:

    if (!v14)
      goto LABEL_12;
LABEL_10:
    if (a6)
    {
      v14 = objc_retainAutorelease(v14);
      v34 = 0;
      *a6 = v14;
    }
    else
    {
      v34 = 0;
    }
    goto LABEL_18;
  }
  v26 = 0;
LABEL_12:
  if (a4)
    *a4 = objc_retainAutorelease(v21);
  if (v26)
  {
    v26 = objc_retainAutorelease(v26);
    v14 = 0;
    *v38 = v26;
  }
  else
  {
    v14 = 0;
  }
  v34 = 1;
LABEL_18:

  return v34;
}

+ (id)extractSerializedRequestValueFromBodyData:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  char *v7;
  uint64_t v8;
  void *v9;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = objc_retainAutorelease(a3);
  v6 = objc_msgSend(v5, "bytes");
  v7 = (char *)objc_msgSend(v5, "length");

  v12 = 0;
  v13 = 0;
  v11 = 0;
  v8 = TLV8GetOrCopyCoalesced(v6, &v7[(_QWORD)v6], 1, &v13, &v12, &v11, 0);
  if ((_DWORD)v8)
  {
    if (a4)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithOSStatus:](NSError, "errorWithOSStatus:", v8));
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 12, CFSTR("Parse failed."), CFSTR("Failed to parse request body."), 0, v9));

      return 0;
    }
  }
  else
  {
    a4 = (id *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v13, v12));
    if (v11)
    {
      free(v11);
      v11 = 0;
    }
  }
  return a4;
}

+ (id)extractNotificationContextFromBodyData:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = objc_retainAutorelease(a3);
  v6 = objc_msgSend(v5, "bytes");
  v7 = (char *)objc_msgSend(v5, "length");

  v13 = 0;
  v14 = 0;
  v12 = 0;
  v8 = TLV8GetOrCopyCoalesced(v6, &v7[(_QWORD)v6], 27, &v14, &v13, &v12, 0);
  if ((_DWORD)v8)
  {
    v9 = 0;
    if (a4 && (_DWORD)v8 != -6727)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithOSStatus:](NSError, "errorWithOSStatus:", v8));
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 12, CFSTR("Parse failed."), CFSTR("Failed to parse notification context."), 0, v10));

      return 0;
    }
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v14, v13));
    if (v12)
    {
      free(v12);
      v12 = 0;
    }
  }
  return v9;
}

- (void)writeCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD block[5];
  id v25;
  id v26;
  id v27;
  id v28;
  double v29;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc((Class)HMFActivity);
  v15 = HMFMethodDescription(self, a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, %s:%ld"), v16, "/Library/Caches/com.apple.xbs/Sources/DockKit/dockaccessoryd/dockaccessoryd/HAP/CoreHAP/Servers/_HAPAccessoryServerBTLE200.m", 4574));
  v18 = objc_msgSend(v14, "initWithName:", v17);

  v19 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100058834;
  block[3] = &unk_1002375D0;
  v29 = a4;
  block[4] = self;
  v25 = v11;
  v26 = v18;
  v27 = v12;
  v28 = v13;
  v20 = v13;
  v21 = v12;
  v22 = v18;
  v23 = v11;
  dispatch_async(v19, block);

}

- (void)_writeValue:(id)a3 toCharacteristic:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(id, id, void *);
  void *v19;
  void *v20;
  _HAPAccessoryServerBTLE200 *v21;
  _HAPAccessoryServerBTLE200 *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  _HAPAccessoryServerBTLE200 *v30;
  uint64_t v31;
  id v32;
  NSObject *v33;
  __CFString *v34;
  void *v35;
  _HAPAccessoryServerBTLE200 *v36;
  uint64_t v37;
  id v38;
  NSObject *v39;
  __CFString *v40;
  void *v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = (void (**)(id, id, void *))a8;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "service"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "accessory"));
  v21 = (_HAPAccessoryServerBTLE200 *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "server"));

  if (v21 == self)
  {
    if ((a7 & 4) != 0 || (objc_msgSend(v15, "properties") & 0x20) != 0)
    {
      v36 = self;
      v38 = sub_10007CCE4((uint64_t)v36, v37);
      v39 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        v40 = sub_10007CD2C(v36);
        v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
        *(_DWORD *)buf = 138543618;
        v43 = v41;
        v44 = 2112;
        v45 = v15;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "%{public}@Performing timed write for characteristic %@", buf, 0x16u);

      }
      -[_HAPAccessoryServerBTLE200 _performTimedWriteValue:toCharacteristic:authorizationData:contextData:options:completionHandler:](v36, "_performTimedWriteValue:toCharacteristic:authorizationData:contextData:options:completionHandler:", v14, v15, v16, v17, a7, v18);
    }
    else
    {
      v30 = self;
      v32 = sub_10007CCE4((uint64_t)v30, v31);
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        v34 = sub_10007CD2C(v30);
        v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
        *(_DWORD *)buf = 138543618;
        v43 = v35;
        v44 = 2112;
        v45 = v15;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "%{public}@Performing write for characteristic %@", buf, 0x16u);

      }
      -[_HAPAccessoryServerBTLE200 _performWriteValue:toCharacteristic:authorizationData:contextData:options:completionHandler:](v30, "_performWriteValue:toCharacteristic:authorizationData:contextData:options:completionHandler:", v14, v15, v16, v17, a7, v18);
    }
  }
  else
  {
    v22 = self;
    v24 = sub_10007CCE4((uint64_t)v22, v23);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = sub_10007CD2C(v22);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      *(_DWORD *)buf = 138543618;
      v43 = v27;
      v44 = 2112;
      v45 = v15;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%{public}@Write failed, characteristic is not part of server: %@", buf, 0x16u);

    }
    if (v18)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to write to characteristic %@."), v15));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 10, v28, CFSTR("Characteristic is not part of server."), 0, 0));

      v18[2](v18, v15, v29);
    }
  }

}

- (void)_performWriteValue:(id)a3 toCharacteristic:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  _QWORD *v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  _HAPAccessoryServerBTLE200 *v30;
  uint64_t v31;
  id v32;
  NSObject *v33;
  __CFString *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id v43[2];
  id location;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;

  v15 = a3;
  v16 = a4;
  v36 = a5;
  v37 = a6;
  v17 = a8;
  v18 = objc_alloc((Class)HMFActivity);
  v19 = HMFMethodDescription(self, a2);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, %s:%ld"), v20, "/Library/Caches/com.apple.xbs/Sources/DockKit/dockaccessoryd/dockaccessoryd/HAP/CoreHAP/Servers/_HAPAccessoryServerBTLE200.m", 4711));
  v45 = objc_msgSend(v18, "initWithName:", v21);

  objc_initWeak(&location, self);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100059678;
  v39[3] = &unk_1002375F8;
  objc_copyWeak(v43, &location);
  v22 = v16;
  v40 = v22;
  v23 = v17;
  v42 = v23;
  v24 = v15;
  v41 = v24;
  v43[1] = (id)a7;
  v25 = objc_retainBlock(v39);
  v38 = 0;
  v27 = objc_msgSend((id)objc_opt_class(self, v26), "writeRequestForCharacteristic:value:authorizationData:contextData:options:error:", v22, v24, v36, v37, a7, &v38);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  v29 = v38;
  if (v28)
  {
    -[_HAPAccessoryServerBTLE200 _sendRequest:shouldPrioritize:responseHandler:](self, "_sendRequest:shouldPrioritize:responseHandler:", v28, ((unint64_t)a7 >> 4) & 1, v25);
  }
  else
  {
    v30 = self;
    v32 = sub_10007CCE4((uint64_t)v30, v31);
    v33 = (id)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = sub_10007CD2C(v30);
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      *(_DWORD *)buf = 138543874;
      v47 = v35;
      v48 = 2112;
      v49 = v22;
      v50 = 2112;
      v51 = v29;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%{public}@Write failed, failed to create request for characteristic, %@, with error: %@", buf, 0x20u);

    }
    sub_1000579E0(v22, v23, 2, v29, CFSTR("Failed to create request."));
  }

  objc_destroyWeak(v43);
  objc_destroyWeak(&location);
  __HMFActivityScopeLeave(&v45);

}

- (void)_performTimedWriteValue:(id)a3 toCharacteristic:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  int64_t v25;

  v14 = a3;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100059C10;
  v21[3] = &unk_100237620;
  v21[4] = self;
  v22 = a4;
  v23 = v14;
  v24 = a8;
  v25 = a7;
  v15 = v14;
  v16 = v22;
  v17 = v24;
  v18 = a6;
  v19 = a5;
  v20 = objc_retainBlock(v21);
  -[_HAPAccessoryServerBTLE200 _performTimedWritePrepareWithValue:toCharacteristic:authorizationData:contextData:options:completionHandler:](self, "_performTimedWritePrepareWithValue:toCharacteristic:authorizationData:contextData:options:completionHandler:", v15, v16, v19, v18, a7, v20);

}

- (void)_performTimedWritePrepareWithValue:(id)a3 toCharacteristic:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD *v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  __CFString *v32;
  id v33;
  void *v34;
  _HAPAccessoryServerBTLE200 *v35;
  uint64_t v36;
  id v37;
  NSObject *v38;
  __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  _QWORD v45[5];
  id v46;
  id v47;
  id v48;
  id v49;
  uint8_t buf[4];
  id v51;
  __int16 v52;
  id v53;
  __int16 v54;
  id v55;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v49 = 0;
  v42 = v15;
  v43 = v17;
  v21 = objc_msgSend((id)objc_opt_class(self, v20), "prepareWriteRequestForCharacteristic:value:authorizationData:contextData:options:error:", v16, v15, v17, v18, a7, &v49);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v44 = v49;
  if (v22)
  {
    v23 = objc_alloc((Class)HMFActivity);
    v24 = HMFMethodDescription(self, a2);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, %s:%ld"), v25, "/Library/Caches/com.apple.xbs/Sources/DockKit/dockaccessoryd/dockaccessoryd/HAP/CoreHAP/Servers/_HAPAccessoryServerBTLE200.m", 4850));
    v48 = objc_msgSend(v23, "initWithName:", v26);

    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_10005A068;
    v45[3] = &unk_100237648;
    v45[4] = self;
    v27 = v16;
    v46 = v27;
    v47 = v19;
    v28 = objc_retainBlock(v45);
    v30 = sub_10007CCE4(0, v29);
    v31 = (id)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = sub_10007CD2C(0);
      v33 = (id)objc_claimAutoreleasedReturnValue(v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "instanceID"));
      *(_DWORD *)buf = 138543618;
      v51 = v33;
      v52 = 2112;
      v53 = v34;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Sending timed write for characteristic %{key:characteristicId}@", buf, 0x16u);

    }
    -[_HAPAccessoryServerBTLE200 _sendRequest:shouldPrioritize:responseHandler:](self, "_sendRequest:shouldPrioritize:responseHandler:", v22, ((unint64_t)a7 >> 4) & 1, v28);

    __HMFActivityScopeLeave(&v48);
  }
  else
  {
    v35 = self;
    v37 = sub_10007CCE4((uint64_t)v35, v36);
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = sub_10007CD2C(v35);
      v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
      *(_DWORD *)buf = 138543874;
      v51 = v40;
      v52 = 2112;
      v53 = v16;
      v54 = 2112;
      v55 = v44;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%{public}@Timed write prepare failed, failed to create request for characteristic, %@, with error: %@", buf, 0x20u);

    }
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:](NSError, "hapErrorWithcode:", 10));
    sub_1000579E0(v16, v19, 2, v41, CFSTR("Failed to create prepare-write request."));

  }
}

- (void)_performTimedWriteExecuteForCharacteristic:(id)a3 value:(id)a4 options:(int64_t)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD *v22;
  _HAPAccessoryServerBTLE200 *v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  __CFString *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33[2];
  id v34;
  id v35;
  _BYTE location[12];
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v35 = 0;
  v15 = objc_msgSend((id)objc_opt_class(self, v14), "executeWriteRequestForCharacteristic:options:error:", v11, a5, &v35);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = v35;
  if (v16)
  {
    objc_initWeak((id *)location, self);
    v18 = objc_alloc((Class)HMFActivity);
    v19 = HMFMethodDescription(self, a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, %s:%ld"), v20, "/Library/Caches/com.apple.xbs/Sources/DockKit/dockaccessoryd/dockaccessoryd/HAP/CoreHAP/Servers/_HAPAccessoryServerBTLE200.m", 4916));
    v34 = objc_msgSend(v18, "initWithName:", v21);

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10005A6CC;
    v29[3] = &unk_1002375F8;
    objc_copyWeak(v33, (id *)location);
    v30 = v11;
    v32 = v13;
    v31 = v12;
    v33[1] = (id)a5;
    v22 = objc_retainBlock(v29);
    -[_HAPAccessoryServerBTLE200 _sendRequest:shouldPrioritize:responseHandler:](self, "_sendRequest:shouldPrioritize:responseHandler:", v16, 1, v22);

    objc_destroyWeak(v33);
    __HMFActivityScopeLeave(&v34);

    objc_destroyWeak((id *)location);
  }
  else
  {
    v23 = self;
    v25 = sub_10007CCE4((uint64_t)v23, v24);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = sub_10007CD2C(v23);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      *(_DWORD *)location = 138543874;
      *(_QWORD *)&location[4] = v28;
      v37 = 2112;
      v38 = v11;
      v39 = 2112;
      v40 = v17;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%{public}@Timed write execute failed, failed to create request for characteristic, %@, with error: %@", location, 0x20u);

    }
    sub_1000579E0(v11, v13, 2, v17, CFSTR("Failed to create execute-write request."));
  }

}

+ (id)writeRequestForCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  HAPBTLERequest *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  double v31;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  if ((objc_msgSend(v14, "properties") & 4) != 0)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "metadata"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "format"));
    v28 = sub_100074234(v27);

    v29 = sub_10005AE8C(v15, v28, v16, ((unint64_t)a7 >> 1) & 1, v17, a8, 0.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    if (v30)
    {
      if ((a7 & 8) != 0)
        v31 = 60.0;
      else
        v31 = 10.0;
      v25 = -[HAPBTLERequest initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:]([HAPBTLERequest alloc], "initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:", v14, 2, v30, a7 & 1, v31);
    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    v18 = a1;
    v20 = sub_10007CCE4((uint64_t)v18, v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = sub_10007CD2C(v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      *(_DWORD *)buf = 138543618;
      v34 = v23;
      v35 = 2112;
      v36 = v14;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}@[HAPBTLERequest] Write failed, characteristic does not support secured writes: %@", buf, 0x16u);

    }
    if (a8)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to write to characteristic %@."), v14));
      *a8 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 10, v24, CFSTR("Characteristic does not support secured writes."), 0, 0));

    }
    v25 = 0;
  }

  return v25;
}

+ (id)prepareWriteRequestForCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 contextData:(id)a6 options:(int64_t)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  if ((objc_msgSend(v14, "properties") & 4) != 0)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "metadata"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "format"));
    v27 = sub_100074234(v26);

    v28 = sub_10005AE8C(v15, v27, v16, ((unint64_t)a7 >> 1) & 1, v17, a8, 2.5);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    if (v29)
      a8 = -[HAPBTLERequest initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:]([HAPBTLERequest alloc], "initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:", v14, 4, v29, a7 & 1, 2.5);
    else
      a8 = 0;

  }
  else
  {
    v18 = a1;
    v20 = sub_10007CCE4((uint64_t)v18, v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = sub_10007CD2C(v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      *(_DWORD *)buf = 138543618;
      v32 = v23;
      v33 = 2112;
      v34 = v14;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}@[HAPBTLERequest] Write failed, characteristic does not support secured writes: %@", buf, 0x16u);

    }
    if (a8)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to write to characteristic %@."), v14));
      *a8 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 10, v24, CFSTR("Characteristic does not support secured writes."), 0, 0));

      a8 = 0;
    }
  }

  return a8;
}

+ (id)executeWriteRequestForCharacteristic:(id)a3 options:(int64_t)a4 error:(id *)a5
{
  char v6;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;

  v6 = a4;
  v8 = a3;
  if ((objc_msgSend(v8, "properties") & 4) != 0)
  {
    a5 = -[HAPBTLERequest initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:]([HAPBTLERequest alloc], "initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:", v8, 5, 0, v6 & 1, 10.0);
  }
  else
  {
    v9 = a1;
    v11 = sub_10007CCE4((uint64_t)v9, v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = sub_10007CD2C(v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      *(_DWORD *)buf = 138543618;
      v18 = v14;
      v19 = 2112;
      v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@[HAPBTLERequest] Write failed, characteristic does not support secured writes: %@", buf, 0x16u);

    }
    if (a5)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to write to characteristic %@."), v8));
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 11, v15, CFSTR("Characteristic does not support secured writes."), 0, 0));

      a5 = 0;
    }
  }

  return a5;
}

+ (BOOL)parseWriteResponse:(id)a3 value:(id *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  unsigned int v10;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  BOOL v24;
  id v26;
  id v27;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "request"));
  v10 = objc_msgSend(v9, "type");

  if (v10 == 5 || v10 == 2)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "body"));
    v27 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "extractSerializedRequestValueFromBodyData:error:", v12, &v27));
    v14 = v27;

    if (v13)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "request"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "characteristic"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "metadata"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "format"));
      v19 = sub_100074234(v18);

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[HAPDataValueTransformer defaultDataValueTransformer](HAPDataValueTransformer, "defaultDataValueTransformer"));
      v26 = v14;
      v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "reverseTransformedValue:format:error:", v13, v19, &v26));
      v22 = v26;

      v14 = v22;
      goto LABEL_9;
    }
    if (v14)
    {
      v13 = 0;
      v21 = 0;
      if (a5)
        goto LABEL_11;
      goto LABEL_18;
    }
    v23 = 4294960559;
  }
  else
  {
    v23 = 4294960591;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithOSStatus:](NSError, "errorWithOSStatus:", v23));
  v14 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 12, CFSTR("Write failed."), CFSTR("Failed to parse write request body."), 0, v20));
  v21 = 0;
  v13 = 0;
LABEL_9:

  if (v14)
  {
    if (a5)
    {
LABEL_11:
      v14 = objc_retainAutorelease(v14);
      v24 = 0;
      *a5 = v14;
      goto LABEL_19;
    }
LABEL_18:
    v24 = 0;
    goto LABEL_19;
  }
  if (a4)
  {
    v21 = objc_retainAutorelease(v21);
    v14 = 0;
    *a4 = v21;
  }
  else
  {
    v14 = 0;
  }
  v24 = 1;
LABEL_19:

  return v24;
}

- (void)markNotifyingCharacteristicUpdatedforCharacteristic:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned __int16 v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if ((objc_msgSend(v10, "properties") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServerBTLE browser](self, "browser"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer identifier](self, "identifier"));
    objc_msgSend(v4, "markNotifyingCharacteristicUpdatedForIdentifier:", v5);

    if (!-[HAPAccessoryServerBTLE notifyingCharacteristicUpdated](self, "notifyingCharacteristicUpdated"))
    {
      -[HAPAccessoryServerBTLE setNotifyingCharacteristicUpdated:](self, "setNotifyingCharacteristicUpdated:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServerBTLE stateNumber](self, "stateNumber"));
      v7 = (unsigned __int16)objc_msgSend(v6, "unsignedShortValue");

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", (unsigned __int16)(v7 + 1)));
      -[HAPAccessoryServerBTLE setStateNumber:](self, "setStateNumber:", v8);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServerBTLE stateNumber](self, "stateNumber"));
    objc_msgSend(v10, "setStateNumber:", v9);

  }
}

- (void)enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id *v14;
  id *v15;
  id *v16;
  id v17;
  id v18;
  id v19;
  _HAPAccessoryServerBTLE200 *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  __CFString *v24;
  void *v25;
  dispatch_time_t v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  BOOL v34;
  _QWORD block[5];
  id v36;
  id v37;
  id v38;
  BOOL v39;
  uint8_t buf[4];
  void *v41;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (-[HAPAccessoryServerBTLE stateChanged](self, "stateChanged"))
  {
    v13 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005BA38;
    block[3] = &unk_100237670;
    v39 = a3;
    v14 = &v36;
    block[4] = self;
    v36 = v10;
    v15 = &v38;
    v16 = &v37;
    v37 = v12;
    v38 = v11;
    v17 = v12;
    v18 = v11;
    v19 = v10;
    dispatch_async(v13, block);
  }
  else
  {
    v20 = self;
    v22 = sub_10007CCE4((uint64_t)v20, v21);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v24 = sub_10007CD2C(v20);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      *(_DWORD *)buf = 138543362;
      v41 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%{public}@Deferring enable events to prioritize local commands", buf, 0xCu);

    }
    v26 = dispatch_time(0, 1000000000);
    v13 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](v20, "clientQueue"));
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10005BA4C;
    v30[3] = &unk_100237670;
    v34 = a3;
    v14 = &v31;
    v30[4] = v20;
    v31 = v10;
    v15 = &v33;
    v16 = &v32;
    v32 = v12;
    v33 = v11;
    v27 = v12;
    v28 = v11;
    v29 = v10;
    dispatch_after(v26, v13, v30);
  }

}

- (void)_enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6
{
  _BOOL8 v8;
  uint64_t v10;
  id v11;
  NSObject *v12;
  __CFString *v13;
  void *v14;
  const __CFString *v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  _HAPAccessoryServerBTLE200 *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  __CFString *v25;
  void *v26;
  _HAPAccessoryServerBTLE200 *v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  __CFString *v31;
  void *v32;
  int64_t v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *j;
  void *v40;
  _QWORD *v41;
  NSObject *v42;
  id v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  id v45;
  void *k;
  void *v47;
  void *v48;
  _HAPAccessoryServerBTLE200 *v49;
  uint64_t v50;
  id v51;
  NSObject *v52;
  __CFString *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  _HAPAccessoryServerBTLE200 *v63;
  uint64_t v64;
  id v65;
  NSObject *v66;
  __CFString *v67;
  void *v68;
  void *v69;
  NSObject *v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  id v72;
  id v73;
  uint64_t v74;
  id v75;
  NSObject *v76;
  NSObject *group;
  char *obj;
  uint64_t (*obja)(uint64_t, uint64_t);
  _HAPAccessoryServerBTLE200 *v80;
  _QWORD v81[4];
  NSObject *v82;
  id v83;
  _BYTE *v84;
  _QWORD v85[4];
  NSObject *v86;
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _QWORD v92[5];
  id v93;
  NSObject *v94;
  id v95;
  id v96;
  _BYTE *v97;
  _QWORD v98[5];
  id v99;
  NSObject *v100;
  BOOL v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _QWORD block[4];
  uint64_t (*v111)(uint64_t, uint64_t);
  id v112;
  NSObject *v113;
  _QWORD v114[2];
  _QWORD v115[2];
  uint8_t v116[4];
  id v117;
  __int16 v118;
  void *v119;
  __int16 v120;
  void *v121;
  __int16 v122;
  void *v123;
  _BYTE v124[128];
  uint8_t v125[128];
  _BYTE buf[24];
  uint64_t (*v127)(uint64_t, uint64_t);
  void (*v128)(uint64_t);
  id v129;
  _BYTE v130[128];

  v8 = a3;
  v71 = (uint64_t (*)(uint64_t, uint64_t))a4;
  v72 = a5;
  v76 = a6;
  v80 = self;
  v11 = sub_10007CCE4((uint64_t)v80, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = sub_10007CD2C(v80);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = CFSTR("Disabling");
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    if (v8)
      v15 = CFSTR("Enabling");
    *(_QWORD *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2112;
    v127 = v71;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@%@ events for characteristics: %@", buf, 0x20u);

  }
  if ((id)-[_HAPAccessoryServerBTLE200 connectionState](v80, "connectionState") == (id)2)
  {
    v73 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v108 = 0u;
    v109 = 0u;
    v106 = 0u;
    v107 = 0u;
    v16 = v71;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v106, v130, 16);
    if (v17)
    {
      obj = 0;
      v18 = *(_QWORD *)v107;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v107 != v18)
            objc_enumerationMutation(v16);
          v20 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v20, "eventNotificationsEnabled") == v8)
          {
            v21 = v80;
            v23 = sub_10007CCE4((uint64_t)v21, v22);
            v24 = objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              v25 = sub_10007CD2C(v21);
              v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v26;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v20;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "%{public}@Events already enabled for %@", buf, 0x16u);

            }
            ++obj;
          }
          else if ((objc_msgSend(v20, "properties") & 1) != 0)
          {
            objc_msgSend(v73, "addObject:", v20);
          }
        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v106, v130, 16);
      }
      while (v17);
    }
    else
    {
      obj = 0;
    }

    v35 = dispatch_group_create();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v127 = sub_10005C614;
    v128 = sub_10005C624;
    v129 = 0;
    v70 = v35;
    if (objc_msgSend(v73, "count"))
    {
      dispatch_group_enter(v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      group = dispatch_group_create();
      v102 = 0u;
      v103 = 0u;
      v104 = 0u;
      v105 = 0u;
      obja = v16;
      v37 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v102, v125, 16);
      if (v37)
      {
        v38 = *(_QWORD *)v103;
        do
        {
          for (j = 0; j != v37; j = (char *)j + 1)
          {
            if (*(_QWORD *)v103 != v38)
              objc_enumerationMutation(obja);
            v40 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * (_QWORD)j);
            dispatch_group_enter(group);
            v98[0] = _NSConcreteStackBlock;
            v98[1] = 3221225472;
            v98[2] = sub_10005C62C;
            v98[3] = &unk_100237698;
            v101 = v8;
            v98[4] = v80;
            v99 = v36;
            v100 = group;
            v41 = objc_retainBlock(v98);
            -[_HAPAccessoryServerBTLE200 _enableEvent:forCharacteristic:withCompletionHandler:queue:](v80, "_enableEvent:forCharacteristic:withCompletionHandler:queue:", v8, v40, v41, v76);
            objc_msgSend(v40, "setEventNotificationsEnabled:", v8);

          }
          v37 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v102, v125, 16);
        }
        while (v37);
      }

      dispatch_group_leave(v70);
      v42 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](v80, "clientQueue"));
      v92[0] = _NSConcreteStackBlock;
      v92[1] = 3221225472;
      v92[2] = sub_10005C800;
      v92[3] = &unk_1002376E8;
      v92[4] = v80;
      v93 = v73;
      v94 = v76;
      v97 = buf;
      v95 = v36;
      v96 = v72;
      v43 = v36;
      dispatch_group_notify(v70, v42, v92);

    }
    else
    {
      group = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v16, "count")));
      v90 = 0u;
      v91 = 0u;
      v88 = 0u;
      v89 = 0u;
      v44 = v16;
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v88, v124, 16);
      if (v45)
      {
        v74 = *(_QWORD *)v89;
        do
        {
          v75 = v45;
          for (k = 0; k != v75; k = (char *)k + 1)
          {
            if (*(_QWORD *)v89 != v74)
              objc_enumerationMutation(v44);
            v47 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * (_QWORD)k);
            if (objc_msgSend(v47, "eventNotificationsEnabled") == v8)
            {
              v48 = 0;
            }
            else
            {
              v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6711, 0));
              v49 = v80;
              v51 = sub_10007CCE4((uint64_t)v49, v50);
              v52 = (id)objc_claimAutoreleasedReturnValue(v51);
              if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
              {
                v53 = sub_10007CD2C(v49);
                v54 = (id)objc_claimAutoreleasedReturnValue(v53);
                v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "instanceID"));
                v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "type"));
                *(_DWORD *)v116 = 138544130;
                v117 = v54;
                v118 = 2112;
                v119 = v55;
                v120 = 2112;
                v121 = v56;
                v122 = 2112;
                v123 = v48;
                _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%{public}@Enable event response for characteristic %@/%@ with error: %@", v116, 0x2Au);

              }
            }
            v57 = (void *)objc_claimAutoreleasedReturnValue(+[HAPCharacteristicResponseTuple responseTupleForCharacteristic:error:](HAPCharacteristicResponseTuple, "responseTupleForCharacteristic:error:", v47, v48));
            if (v57)
              -[NSObject addObject:](group, "addObject:", v57);

          }
          v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v88, v124, 16);
        }
        while (v45);
      }

      if (obj == objc_msgSend(v44, "count"))
      {
        if (!v72 || !v76)
          goto LABEL_36;
        v85[0] = _NSConcreteStackBlock;
        v85[1] = 3221225472;
        v85[2] = sub_10005CD88;
        v85[3] = &unk_100236E80;
        v87 = v72;
        group = group;
        v86 = group;
        dispatch_async(v76, v85);

        v43 = v87;
      }
      else
      {
        v114[0] = NSLocalizedDescriptionKey;
        v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to enable events for characteristic %@"), v44));
        v115[0] = v58;
        v114[1] = NSLocalizedFailureReasonErrorKey;
        v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "localizedStringForKey:value:table:", CFSTR("No Characteristics support notify property"), &stru_10023F210, 0));
        v115[1] = v60;
        v43 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v115, v114, 2));

        v61 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6735, v43));
        v62 = *(void **)(*(_QWORD *)&buf[8] + 40);
        *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v61;

        v63 = v80;
        v65 = sub_10007CCE4((uint64_t)v63, v64);
        v66 = (id)objc_claimAutoreleasedReturnValue(v65);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        {
          v67 = sub_10007CD2C(v63);
          v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
          v69 = *(void **)(*(_QWORD *)&buf[8] + 40);
          *(_DWORD *)v116 = 138543618;
          v117 = v68;
          v118 = 2112;
          v119 = v69;
          _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "%{public}@Failed to enable events for characteristic with error: %@", v116, 0x16u);

        }
        if (v72 && v76)
        {
          v81[0] = _NSConcreteStackBlock;
          v81[1] = 3221225472;
          v81[2] = sub_10005CD9C;
          v81[3] = &unk_100237710;
          v83 = v72;
          group = group;
          v82 = group;
          v84 = buf;
          dispatch_async(v76, v81);

        }
      }
    }

LABEL_36:
    _Block_object_dispose(buf, 8);

    v34 = v70;
    goto LABEL_37;
  }
  v27 = v80;
  v29 = sub_10007CCE4((uint64_t)v27, v28);
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    v31 = sub_10007CD2C(v27);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v33 = -[_HAPAccessoryServerBTLE200 connectionState](v27, "connectionState");
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v32;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v33;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%{public}@Rejecting enabling events on server that is not connected, current state: %tu", buf, 0x16u);

  }
  v73 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 2, 0));
  if (v72 && v76)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005C600;
    block[3] = &unk_100236E08;
    v113 = v72;
    v111 = v71;
    v73 = v73;
    v112 = v73;
    dispatch_async(v76, block);

    v34 = v113;
LABEL_37:

  }
}

- (void)_enableEvent:(BOOL)a3 forCharacteristic:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  _HAPAccessoryServerBTLE200 *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD *v29;
  _QWORD v30[5];
  NSObject *v31;
  id v32;
  BOOL v33;
  _QWORD block[4];
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[2];
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  _BOOL4 v49;
  __int16 v50;
  id v51;

  v8 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cbCharacteristic"));
  v14 = self;
  v16 = sub_10007CCE4((uint64_t)v14, v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = sub_10007CD2C(v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    *(_DWORD *)buf = 138543874;
    v47 = v19;
    v48 = 1024;
    v49 = v8;
    v50 = 2112;
    v51 = v10;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%{public}@Enable Events :%d for Characteristics: %@", buf, 0x1Cu);

  }
  if (!v13)
  {
    v44[0] = NSLocalizedDescriptionKey;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to enable events for characteristic %@"), v10));
    v45[0] = v26;
    v44[1] = NSLocalizedFailureReasonErrorKey;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Unable to find matching BTLE characteristic"), &stru_10023F210, 0));
    v45[1] = v28;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v45, v44, 2));

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6727, v23));
    if (!v11 || !v12)
      goto LABEL_12;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10005D20C;
    v38[3] = &unk_100236E08;
    v41 = v11;
    v39 = v10;
    v40 = v24;
    dispatch_async(v12, v38);

    v25 = v41;
    goto LABEL_11;
  }
  if ((objc_msgSend(v13, "properties") & 0x20) != 0)
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10005D234;
    v30[3] = &unk_100237738;
    v33 = v8;
    v30[4] = v14;
    v32 = v11;
    v31 = v12;
    v29 = objc_retainBlock(v30);
    -[_HAPAccessoryServerBTLE200 _performEnableEvent:toCharacteristic:completionHandler:](v14, "_performEnableEvent:toCharacteristic:completionHandler:", v8, v10, v29);

    goto LABEL_14;
  }
  v42[0] = NSLocalizedDescriptionKey;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to enable events for characteristic %@"), v10));
  v43[0] = v20;
  v42[1] = NSLocalizedFailureReasonErrorKey;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("BTLE characteristic does not support indication"), &stru_10023F210, 0));
  v43[1] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, v42, 2));

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6735, v23));
  if (v11 && v12)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005D220;
    block[3] = &unk_100236E08;
    v37 = v11;
    v35 = v10;
    v36 = v24;
    dispatch_async(v12, block);

    v25 = v37;
LABEL_11:

  }
LABEL_12:

LABEL_14:
}

- (void)_performEnableEvent:(BOOL)a3 toCharacteristic:(id)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void **v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void *v16;
  id v17;
  id v18;

  v6 = a3;
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_10005D4EC;
  v16 = &unk_1002371A0;
  v17 = a4;
  v18 = a5;
  v8 = v17;
  v9 = v18;
  -[_HAPAccessoryServerBTLE200 _enableEvent:toCharacteristic:completionHandler:](self, "_enableEvent:toCharacteristic:completionHandler:", v6, v8, &v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 securitySession](self, "securitySession", v13, v14, v15, v16));
  if (objc_msgSend(v10, "isOpen"))
  {

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 securitySession](self, "securitySession"));
    v12 = objc_msgSend(v11, "isOpening");

    if ((v12 & 1) == 0)
    {
      -[_HAPAccessoryServerBTLE200 _suspendAllOperations](self, "_suspendAllOperations");
      -[HAPAccessoryServer setMetric_pairVerifyReason:](self, "setMetric_pairVerifyReason:", CFSTR("noSession.event"));
      -[_HAPAccessoryServerBTLE200 _establishSecureSession](self, "_establishSecureSession");
    }
  }

}

- (void)_enableEvent:(BOOL)a3 toCharacteristic:(id)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _HAPAccessoryServerBTLE200 *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cbCharacteristic"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 characteristicEnableEventCompletionHandlers](self, "characteristicEnableEventCompletionHandlers"));
    v12 = objc_msgSend(v9, "copy");
    v13 = objc_retainBlock(v12);
    objc_msgSend(v11, "setObject:forKey:", v13, v8);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServerBTLE peripheral](self, "peripheral"));
    objc_msgSend(v14, "setNotifyValue:forCharacteristic:", v6, v10);

  }
  else
  {
    v15 = self;
    v17 = sub_10007CCE4((uint64_t)v15, v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = sub_10007CD2C(v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v22 = 138543618;
      v23 = v20;
      v24 = 2112;
      v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}@Missing mapped characteristic for characteristic: %@", (uint8_t *)&v22, 0x16u);

    }
    if (v9)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 1, CFSTR("Missing mapped characteristic"), 0, 0, 0));
      (*((void (**)(id, void *))v9 + 2))(v9, v21);

    }
  }

}

- (void)_handleHAPNotificationStateUpdateForCharacteristic:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  _HAPAccessoryServerBTLE200 *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  __CFString *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 characteristicEnableEventCompletionHandlers](self, "characteristicEnableEventCompletionHandlers"));
  v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v6));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 characteristicEnableEventCompletionHandlers](self, "characteristicEnableEventCompletionHandlers"));
    objc_msgSend(v10, "removeObjectForKey:", v6);

    -[_HAPAccessoryServerBTLE200 _kickConnectionIdleTimer](self, "_kickConnectionIdleTimer");
    ((void (**)(_QWORD, id))v9)[2](v9, v7);
  }
  else
  {
    v11 = self;
    v13 = sub_10007CCE4((uint64_t)v11, v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = sub_10007CD2C(v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v17 = 138543618;
      v18 = v16;
      v19 = 2112;
      v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%{public}@Received unexpected notification updated completion from characteristic, %@, dropping", (uint8_t *)&v17, 0x16u);

    }
  }

}

- (void)_handleEventIndicationForCharacteristic:(id)a3
{
  id v4;
  _HAPAccessoryServerBTLE200 *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;

  v4 = a3;
  if ((objc_msgSend(v4, "properties") & 1) != 0)
  {
    v5 = self;
    v7 = sub_10007CCE4((uint64_t)v5, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = sub_10007CD2C(v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      *(_DWORD *)buf = 138543618;
      v15 = v10;
      v16 = 2112;
      v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@Reading value on Indication for characteristic %@", buf, 0x16u);

    }
    -[_HAPAccessoryServerBTLE200 markNotifyingCharacteristicUpdatedforCharacteristic:](v5, "markNotifyingCharacteristicUpdatedforCharacteristic:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v4));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](v5, "clientQueue"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10005D994;
    v13[3] = &unk_100236E58;
    v13[4] = v5;
    -[_HAPAccessoryServerBTLE200 _readCharacteristicValues:queue:completionHandler:](v5, "_readCharacteristicValues:queue:completionHandler:", v11, v12, v13);

  }
}

+ (id)configurationRequestForService:(id)a3 configRequestType:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  id v21;
  HAPBTLERequest *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _OWORD v29[21];

  v6 = a4;
  v7 = a3;
  memset(v29, 0, sizeof(v29));
  TLV8BufferInit(v29, 0xFFFFLL);
  if ((_DWORD)v6 != 2 && (v8 = TLV8BufferAppend(v29, v6, 0, 0), (_DWORD)v8)
    || (v8 = TLV8BufferAppend(v29, 2, 0, 0), (_DWORD)v8))
  {
    v10 = v8;
    v11 = 0;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v29[0]));
    if (v11)
      v10 = 0;
    else
      v10 = 4294960568;
  }
  TLV8BufferFree(v29, v9);
  if (a5 && (_DWORD)v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithOSStatus:](NSError, "errorWithOSStatus:", v10));
    *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 12, CFSTR("Protocol configuration failed"), CFSTR("Failed to create protocol configuration body"), 0, v12));

  }
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "characteristics", 0));
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (!v14)
  {
LABEL_21:

    goto LABEL_24;
  }
  v15 = v14;
  v16 = *(_QWORD *)v25;
LABEL_12:
  v17 = 0;
  while (1)
  {
    if (*(_QWORD *)v25 != v16)
      objc_enumerationMutation(v13);
    v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "cbCharacteristic"));
    if (!sub_10004FC48(v19))
    {

      goto LABEL_19;
    }
    v20 = objc_msgSend(v7, "serviceProperties");

    if ((v20 & 4) != 0)
      break;
LABEL_19:
    if (v15 == (id)++v17)
    {
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v15)
        goto LABEL_12;
      goto LABEL_21;
    }
  }
  v21 = v18;

  if (v21)
  {
    v22 = -[HAPBTLERequest initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:]([HAPBTLERequest alloc], "initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:", v21, 8, v11, 1, 10.0);

    goto LABEL_26;
  }
LABEL_24:
  v22 = 0;
  if (a5)
    *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 3, CFSTR("Protocol configuration request create failed"), CFSTR("Service is missing service signature charactersitic or support for configuration"), 0, 0));
LABEL_26:

  return v22;
}

+ (BOOL)parseProtocolConfigurationResponse:(id)a3 key:(id *)a4 stateNumber:(id *)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  char *v14;
  void *v15;
  char *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  BOOL v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  __CFString *v29;
  void *v30;
  id v31;
  uint64_t v32;
  id v33;
  NSObject *v34;
  __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  id v41;
  NSObject *v42;
  __CFString *v43;
  void *v44;
  int __s;
  __int16 v47;
  unsigned __int8 v48;
  unsigned __int16 v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  _BYTE v56[10];
  __int16 v57;
  int v58;
  __int16 v59;
  int v60;
  __int16 v61;
  int v62;
  __int16 v63;
  int v64;
  __int16 v65;
  int v66;
  __int16 v67;
  int v68;
  _BYTE v69[32];

  v10 = a3;
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "body")));
  v12 = objc_msgSend(v11, "bytes");

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "body"));
  v14 = (char *)objc_msgSend(v13, "length");

  v51 = 0;
  v52 = 0;
  v50 = 0;
  v49 = 0;
  v48 = 0;
  v47 = 0;
  __s = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "request"));

  LODWORD(v10) = objc_msgSend(v15, "type");
  if ((_DWORD)v10 == 8)
  {
    v16 = &v14[(_QWORD)v12];
    v17 = 0;
    if (!TLV8GetOrCopyCoalesced(v12, v16, 1, &v52, &v51, &v50, 0))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v52, v51));
      if (v50)
      {
        free(v50);
        v50 = 0;
      }
      if (v51 == 2)
      {
        objc_msgSend(v17, "getBytes:range:", &v49, 0, 2);
        if (a5)
          *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", (__int16)v49));
      }
    }
    if (TLV8GetOrCopyCoalesced(v12, v16, 2, &v52, &v51, &v50, 0))
    {
      v18 = v17;
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v52, v51));

      if (v50)
      {
        free(v50);
        v50 = 0;
      }
      if (v51 == 1)
        objc_msgSend(v18, "getBytes:range:", &v48, 0, 1);
    }
    if (TLV8GetOrCopyCoalesced(v12, v16, 3, &v52, &v51, &v50, 0))
    {
      v19 = v18;
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v52, v51));

      if (v50)
      {
        free(v50);
        v50 = 0;
      }
      memset_s(&__s, 6uLL, 0, 6uLL);
      if (v51 == 6)
        objc_msgSend(v19, "getBytes:range:", &__s, 0, 6);
    }
    if (TLV8GetOrCopyCoalesced(v12, v16, 4, &v52, &v51, &v50, 0))
      goto LABEL_21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v52, v51));

    if (v50)
    {
      free(v50);
      v50 = 0;
    }
    if (v22)
    {
      memset_s(v69, 0x20uLL, 0, 0x20uLL);
      v23 = v51;
      if (v51 == 32)
      {
        objc_msgSend(v22, "getBytes:range:", v69, 0, 32);
        v24 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v69, 32));
      }
      else
      {
        v24 = 4294960591;
      }
      v25 = a1;
      v27 = sub_10007CCE4((uint64_t)v25, v26);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        v29 = sub_10007CD2C(v25);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        *(_DWORD *)buf = 138545410;
        v54 = v30;
        v55 = 1024;
        *(_DWORD *)v56 = v49;
        *(_WORD *)&v56[4] = 1024;
        *(_DWORD *)&v56[6] = v48;
        v57 = 1024;
        v58 = __s;
        v59 = 1024;
        v60 = BYTE1(__s);
        v61 = 1024;
        v62 = BYTE2(__s);
        v63 = 1024;
        v64 = HIBYTE(__s);
        v65 = 1024;
        v66 = v47;
        v67 = 1024;
        v68 = HIBYTE(v47);
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "%{public}@Parsed protocol configuration response GSN: %d, C#: %d, advId: %02X:%02X:%02X:%02X:%02X:%02X", buf, 0x3Cu);

      }
      v31 = v25;
      v33 = sub_10007CCE4((uint64_t)v31, v32);
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        v35 = sub_10007CD2C(v31);
        v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v69, 32));
        *(_DWORD *)buf = 138543618;
        v54 = v36;
        v55 = 2112;
        *(_QWORD *)v56 = v37;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "%{public}@Broadcast Key: %@", buf, 0x16u);

      }
      if (v23 == 32)
      {
        v20 = 0;
      }
      else
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithOSStatus:](NSError, "errorWithOSStatus:", v24));
        v20 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 12, CFSTR("Configuration response failed."), CFSTR("Failed to parse configuraton response body."), 0, v38));

        if (v20)
        {
          v39 = v31;
          v41 = sub_10007CCE4((uint64_t)v39, v40);
          v42 = objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          {
            v43 = sub_10007CD2C(v39);
            v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
            *(_DWORD *)buf = 138543618;
            v54 = v44;
            v55 = 2112;
            *(_QWORD *)v56 = v20;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "%{public}@Failed parsing protocol configuration response with error: %@", buf, 0x16u);

          }
          if (a6)
          {
            v20 = objc_retainAutorelease(v20);
            v21 = 0;
            *a6 = v20;
          }
          else
          {
            v21 = 0;
          }
          goto LABEL_40;
        }
      }
      v21 = 1;
LABEL_40:
      v19 = v22;
      goto LABEL_41;
    }
  }
  v19 = 0;
LABEL_21:
  v20 = 0;
  v21 = 1;
LABEL_41:

  return v21;
}

- (void)_configureBroadcastKeyGeneration:(unsigned __int8)a3 service:(id)a4 withCompletion:(id)a5
{
  int v6;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  _HAPAccessoryServerBTLE200 *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  char v31;
  id location;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  objc_initWeak(&location, self);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10005E73C;
  v27[3] = &unk_100237760;
  objc_copyWeak(&v30, &location);
  v31 = v6;
  v10 = v9;
  v29 = v10;
  v11 = v8;
  v28 = v11;
  v12 = objc_retainBlock(v27);
  v14 = (void *)objc_opt_class(self, v13);
  v26 = 0;
  if (v6 == 2)
    v15 = 2;
  else
    v15 = 1;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "configurationRequestForService:configRequestType:error:", v11, v15, &v26));
  v17 = v26;
  if (v16)
  {
    -[_HAPAccessoryServerBTLE200 _sendRequest:shouldPrioritize:responseHandler:](self, "_sendRequest:shouldPrioritize:responseHandler:", v16, 0, v12);
  }
  else
  {
    v18 = self;
    v20 = sub_10007CCE4((uint64_t)v18, v19);
    v21 = (id)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = sub_10007CD2C(v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      *(_DWORD *)buf = 138543874;
      v34 = v23;
      v35 = 2112;
      v36 = v11;
      v37 = 2112;
      v38 = v17;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to create configuration request for service, %@, with error: %@", buf, 0x20u);

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to configure service %@."), v11));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 1, v24, CFSTR("Failed to create request."), 0, v17));

    (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *, double))v10 + 2))(v10, 0, 0, 0, v25, 0.0);
  }

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

}

+ (id)configurationRequestForCharacteristic:(id)a3 isBroadcasted:(BOOL)a4 interval:(unint64_t)a5 error:(id *)a6
{
  _BOOL4 v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  HAPBTLERequest *v17;
  char v19;
  __int16 v20;
  _OWORD v21[21];

  v8 = a4;
  memset(v21, 0, sizeof(v21));
  v9 = a3;
  TLV8BufferInit(v21, 0xFFFFLL);
  v20 = v8;
  v10 = TLV8BufferAppend(v21, 1, &v20, 2);
  if ((_DWORD)v10)
    goto LABEL_2;
  v19 = 2;
  if (!v8)
  {
LABEL_10:
    v15 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v21[0]));
    if (v15)
      v13 = (void *)v15;
    else
      v13 = 0;
    if (v15)
      v12 = 0;
    else
      v12 = 4294960568;
    goto LABEL_16;
  }
  if (a5 == 3)
  {
    v14 = 3;
  }
  else
  {
    if (a5 != 1)
      goto LABEL_9;
    v14 = 1;
  }
  v19 = v14;
LABEL_9:
  v10 = TLV8BufferAppend(v21, 2, &v19, 1);
  if (!(_DWORD)v10)
    goto LABEL_10;
LABEL_2:
  v12 = v10;
  v13 = 0;
LABEL_16:
  TLV8BufferFree(v21, v11);
  if (a6 && (_DWORD)v12)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithOSStatus:](NSError, "errorWithOSStatus:", v12));
    *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 1, CFSTR("Characteristic configuration failed."), CFSTR("Failed to create characteristic configuration request body."), 0, v16));

  }
  v17 = -[HAPBTLERequest initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:]([HAPBTLERequest alloc], "initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:", v9, 7, v13, 1, 10.0);

  return v17;
}

+ (BOOL)parseCharacteristicConfigurationResponse:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  char *v10;
  void *v11;
  char *v12;
  BOOL v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  unsigned __int8 v26;
  unsigned __int16 v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;

  v6 = a3;
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "body")));
  v8 = objc_msgSend(v7, "bytes");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "body"));
  v10 = (char *)objc_msgSend(v9, "length");

  v29 = 0;
  v30 = 0;
  v28 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "request"));

  LODWORD(v6) = objc_msgSend(v11, "type");
  if ((_DWORD)v6 != 7)
  {
    v14 = 0;
LABEL_27:
    v15 = 0;
    goto LABEL_28;
  }
  v12 = &v10[(_QWORD)v8];
  v13 = 1;
  if (TLV8GetOrCopyCoalesced(v8, v12, 1, &v30, &v29, &v28, 0))
    goto LABEL_3;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v30, v29));
  if (v28)
  {
    free(v28);
    v28 = 0;
  }
  if (!v16)
  {
LABEL_3:
    v14 = 0;
    v15 = 0;
    goto LABEL_29;
  }
  v27 = 0;
  if (v29 == 2)
  {
    objc_msgSend(v16, "getBytes:range:", &v27, 0, 2);
    v17 = 0;
  }
  else
  {
    v17 = 4294960591;
  }
  if (TLV8GetOrCopyCoalesced(v8, v12, 2, &v30, &v29, &v28, 0))
  {
    v14 = v16;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v30, v29));

    if (v28)
    {
      free(v28);
      v28 = 0;
    }
    if (v14)
    {
      v26 = 0;
      if (v29 == 1)
        objc_msgSend(v14, "getBytes:range:", &v26, 0, 1);
      else
        v17 = 4294960591;
      v18 = a1;
      v20 = sub_10007CCE4((uint64_t)v18, v19);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        v22 = sub_10007CD2C(v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        *(_DWORD *)buf = 138543874;
        v32 = v23;
        v33 = 1024;
        v34 = v27;
        v35 = 1024;
        v36 = v26;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%{public}@Parsed configuration response properties: %0xX, Interval: %d", buf, 0x18u);

      }
    }
  }
  if (!(_DWORD)v17)
    goto LABEL_27;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithOSStatus:](NSError, "errorWithOSStatus:", v17));
  v15 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 12, CFSTR("Configuration response failed."), CFSTR("Failed to parse configuraton response body."), 0, v24));

  if (!v15)
  {
LABEL_28:
    v13 = 1;
    goto LABEL_29;
  }
  if (a4)
  {
    v15 = objc_retainAutorelease(v15);
    v13 = 0;
    *a4 = v15;
  }
  else
  {
    v13 = 0;
  }
LABEL_29:

  return v13;
}

- (void)configureCharacteristics:(id)a3 queue:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10005F12C;
  v15[3] = &unk_100237208;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)_configureCharacteristics:(id)a3 queue:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  _HAPAccessoryServerBTLE200 *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  NSObject *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id obj;
  _QWORD block[4];
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[5];
  id v40;
  NSObject *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];

  v8 = a3;
  v31 = a4;
  v30 = a5;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v8, "count")));
  v9 = dispatch_group_create();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v43 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "characteristic"));
        v15 = objc_msgSend(v14, "properties");

        if ((v15 & 8) != 0)
        {
          dispatch_group_enter(v9);
          v23 = objc_msgSend(v13, "broadcastEnable");
          v24 = objc_msgSend(v13, "broadcastInterval");
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "characteristic"));
          v39[0] = _NSConcreteStackBlock;
          v39[1] = 3221225472;
          v39[2] = sub_10005F7B8;
          v39[3] = &unk_100237530;
          v39[4] = self;
          v40 = v32;
          v41 = v9;
          -[_HAPAccessoryServerBTLE200 _enableBroadcastEvent:interval:forCharacteristic:completionHandler:](self, "_enableBroadcastEvent:interval:forCharacteristic:completionHandler:", v23, v24, v25, v39);

        }
        else
        {
          v16 = self;
          v18 = sub_10007CCE4((uint64_t)v16, v17);
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            v20 = sub_10007CD2C(v16);
            v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "characteristic"));
            *(_DWORD *)buf = 138543618;
            v47 = v21;
            v48 = 2112;
            v49 = v22;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%{public}@Characteristic %@ does not support broadcast notification", buf, 0x16u);

          }
        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    }
    while (v10);
  }

  objc_initWeak((id *)buf, self);
  v26 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005F92C;
  block[3] = &unk_1002377B0;
  objc_copyWeak(&v38, (id *)buf);
  v35 = v31;
  v36 = v32;
  v37 = v30;
  v27 = v32;
  v28 = v30;
  v29 = v31;
  dispatch_group_notify(v9, v26, block);

  objc_destroyWeak(&v38);
  objc_destroyWeak((id *)buf);

}

- (void)_enableBroadcastEvent:(BOOL)a3 interval:(unint64_t)a4 forCharacteristic:(id)a5 completionHandler:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _HAPAccessoryServerBTLE200 *v14;
  _HAPAccessoryServerBTLE200 *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  __CFString *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  _HAPAccessoryServerBTLE200 *v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  __CFString *v32;
  void *v33;
  void *v34;
  id *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id location;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;

  v8 = a3;
  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "service"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accessory"));
  v14 = (_HAPAccessoryServerBTLE200 *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "server"));

  if (v14 == self)
  {
    objc_initWeak(&location, self);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10005FDC8;
    v37[3] = &unk_100237580;
    objc_copyWeak(&v40, &location);
    v21 = v10;
    v38 = v21;
    v22 = v11;
    v39 = v22;
    v23 = objc_retainBlock(v37);
    v36 = 0;
    v25 = objc_msgSend((id)objc_opt_class(self, v24), "configurationRequestForCharacteristic:isBroadcasted:interval:error:", v21, v8, a4, &v36);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v27 = v36;
    if (v26)
    {
      -[_HAPAccessoryServerBTLE200 _sendRequest:shouldPrioritize:responseHandler:](self, "_sendRequest:shouldPrioritize:responseHandler:", v26, 0, v23, &v40);
    }
    else
    {
      v28 = self;
      v30 = sub_10007CCE4((uint64_t)v28, v29);
      v31 = (id)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = sub_10007CD2C(v28);
        v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
        *(_DWORD *)buf = 138543874;
        v43 = v33;
        v44 = 2112;
        v45 = v21;
        v46 = 2112;
        v47 = v27;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to create configuration request for characteristic, %@, with error: %@", buf, 0x20u);

      }
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:](NSError, "hapErrorWithcode:", 9, &v40));
      sub_1000579E0(v21, v22, 3, v34, CFSTR("Failed to create configuration request."));

    }
    objc_destroyWeak(v35);
    objc_destroyWeak(&location);
  }
  else
  {
    v15 = self;
    v17 = sub_10007CCE4((uint64_t)v15, v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = sub_10007CD2C(v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      *(_DWORD *)buf = 138543618;
      v43 = v20;
      v44 = 2112;
      v45 = v10;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}@Configure characteristic failed, characteristic is not part of server: %@", buf, 0x16u);

    }
    sub_1000579E0(v10, v11, 3, 0, CFSTR("Characteristic is not part of server."));
  }

}

- (void)startPairingWithRequest:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;

  v5 = a3;
  v6 = objc_alloc((Class)HMFActivity);
  v7 = HMFMethodDescription(self, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, %s:%ld"), v8, "/Library/Caches/com.apple.xbs/Sources/DockKit/dockaccessoryd/dockaccessoryd/HAP/CoreHAP/Servers/_HAPAccessoryServerBTLE200.m", 6214));
  v10 = objc_msgSend(v6, "initWithName:", v9);

  v11 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100060204;
  block[3] = &unk_100236EA8;
  block[4] = self;
  v15 = v10;
  v16 = v5;
  v12 = v5;
  v13 = v10;
  dispatch_async(v11, block);

}

- (void)_checkForAuthPrompt:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000605D8;
  v3[3] = &unk_100237828;
  v3[4] = self;
  v4 = a3;
  -[_HAPAccessoryServerBTLE200 _discoverWithType:completionHandler:](self, "_discoverWithType:completionHandler:", 2, v3);
}

- (void)_getPairingFeaturesWithCompletionHandler:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _HAPAccessoryServerBTLE200 *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  __CFString *v14;
  void *v15;
  id v16;
  _QWORD *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD *v21;
  _QWORD v22[5];
  id v23;
  uint8_t buf[24];

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100060FE0;
  v22[3] = &unk_100237850;
  v22[4] = self;
  v4 = a3;
  v23 = v4;
  v5 = objc_retainBlock(v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 pairingFeaturesCharacteristic](self, "pairingFeaturesCharacteristic"));
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "value"));

    if (!v8)
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000611F0;
      v19[3] = &unk_100237878;
      v19[4] = self;
      v21 = v5;
      v16 = v7;
      v20 = v16;
      v17 = objc_retainBlock(v19);
      -[_HAPAccessoryServerBTLE200 _readValueForCharacteristic:options:completionHandler:](self, "_readValueForCharacteristic:options:completionHandler:", v16, 2, v17);

      goto LABEL_9;
    }
    *(_QWORD *)buf = 0;
    v18 = 0;
    -[_HAPAccessoryServerBTLE200 _parsePairingFeaturesCharacteristic:authMethod:error:](self, "_parsePairingFeaturesCharacteristic:authMethod:error:", v7, buf, &v18);
    v9 = v18;
    ((void (*)(_QWORD *, _QWORD, id))v5[2])(v5, *(_QWORD *)buf, v9);
  }
  else
  {
    v10 = self;
    v12 = sub_10007CCE4((uint64_t)v10, v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = sub_10007CD2C(v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@Pairing failed, missing the Pairing Features characteristic", buf, 0xCu);

    }
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 7, CFSTR("Pairing Failed."), CFSTR("Missing Pairing Features characteristic."), 0, 0));
    ((void (*)(_QWORD *, _QWORD, id))v5[2])(v5, 0, v9);
  }

LABEL_9:
}

- (BOOL)_parsePairingFeaturesCharacteristic:(id)a3 authMethod:(unint64_t *)a4 error:(id *)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char isKindOfClass;
  _HAPAccessoryServerBTLE200 *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  __CFString *v16;
  void *v17;
  int v19;
  void *v20;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "value"));
  v10 = objc_opt_class(NSNumber, v9);
  isKindOfClass = objc_opt_isKindOfClass(v8, v10);
  if ((isKindOfClass & 1) != 0)
  {
    -[_HAPAccessoryServerBTLE200 setFeatureFlags:](self, "setFeatureFlags:", objc_msgSend(v8, "unsignedCharValue"));
    -[HAPAccessoryServer setAuthMethod:](self, "setAuthMethod:", sub_10002093C(-[_HAPAccessoryServerBTLE200 featureFlags](self, "featureFlags")));
    if ((id)-[HAPAccessoryServer authMethod](self, "authMethod") == (id)6)
      -[HAPAccessoryServer setAuthMethod:](self, "setAuthMethod:", 4);
    if (a4)
      *a4 = -[HAPAccessoryServer authMethod](self, "authMethod");
  }
  else
  {
    v12 = self;
    v14 = sub_10007CCE4((uint64_t)v12, v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = sub_10007CD2C(v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v19 = 138543362;
      v20 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@Pairing failed, the Pairing Features characteristic value is invalid", (uint8_t *)&v19, 0xCu);

    }
    if (a5)
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 12, CFSTR("Pairing Failed."), CFSTR("The Pairing Features characteristic value is missing"), 0, 0));
  }

  return isKindOfClass & 1;
}

- (void)continuePairingAfterAuthPrompt
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006155C;
  block[3] = &unk_100236AA8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (BOOL)stopPairingWithError:(id *)a3
{
  NSObject *v4;
  _QWORD block[5];

  v4 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100061998;
  block[3] = &unk_100236AA8;
  block[4] = self;
  dispatch_async(v4, block);

  return 1;
}

- (void)_handlePairSetupSessionExchangeData:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  _HAPAccessoryServerBTLE200 *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD *v17;
  _QWORD v18[4];
  id v19;
  _HAPAccessoryServerBTLE200 *v20;
  uint8_t buf[4];
  void *v22;

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100061D1C;
  v18[3] = &unk_1002378A0;
  v4 = a3;
  v19 = v4;
  v20 = self;
  v5 = objc_retainBlock(v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 pairSetupCharacteristic](self, "pairSetupCharacteristic"));
  if (v6)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100061F04;
    v15[3] = &unk_100237878;
    v15[4] = self;
    v17 = v5;
    v16 = v6;
    -[_HAPAccessoryServerBTLE200 _writeValue:toCharacteristic:authorizationData:contextData:options:completionHandler:](self, "_writeValue:toCharacteristic:authorizationData:contextData:options:completionHandler:", v4, v16, 0, 0, 26, v15);

  }
  else
  {
    v7 = self;
    v9 = sub_10007CCE4((uint64_t)v7, v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = sub_10007CD2C(v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      *(_DWORD *)buf = 138543362;
      v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@Pairing failed, missing the Pair Setup characteristic", buf, 0xCu);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 7, CFSTR("Pairing Failed."), CFSTR("Missing Pair Setup characteristic."), 0, 0));
    ((void (*)(_QWORD *, void *))v5[2])(v5, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 pairSetupSession](v7, "pairSetupSession"));
    objc_msgSend(v14, "receivedSetupExchangeData:error:", 0, v13);

  }
}

- (void)_handlePairingSetupCodeRequestWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  NSObject *v6;
  _QWORD *v7;
  _HAPAccessoryServerBTLE200 *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  __CFString *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  uint8_t buf[4];
  void *v17;

  v4 = (void (**)(id, _QWORD, void *))a3;
  if (-[_HAPAccessoryServerBTLE200 isBadSetupCode](self, "isBadSetupCode")
    && -[_HAPAccessoryServerBTLE200 _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", "accessoryServer:didReceiveBadPasswordThrottleAttemptsWithDelay:"))
  {
    -[_HAPAccessoryServerBTLE200 _suspendConnectionIdleTimer](self, "_suspendConnectionIdleTimer");
    -[_HAPAccessoryServerBTLE200 setSetupCodeCompletionHandler:](self, "setSetupCodeCompletionHandler:", v4);
    v5 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer delegateQueue](self, "delegateQueue"));
    v6 = v5;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100062348;
    v15[3] = &unk_100236AA8;
    v15[4] = self;
    v7 = v15;
LABEL_6:
    dispatch_async(v5, v7);
    goto LABEL_10;
  }
  if (-[_HAPAccessoryServerBTLE200 _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", "accessoryServer:promptUserForPasswordWithType:"))
  {
    -[_HAPAccessoryServerBTLE200 _suspendConnectionIdleTimer](self, "_suspendConnectionIdleTimer");
    -[_HAPAccessoryServerBTLE200 setSetupCodeCompletionHandler:](self, "setSetupCodeCompletionHandler:", v4);
    v5 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer delegateQueue](self, "delegateQueue"));
    v6 = v5;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10006239C;
    v14[3] = &unk_100236AA8;
    v14[4] = self;
    v7 = v14;
    goto LABEL_6;
  }
  v8 = self;
  v10 = sub_10007CCE4((uint64_t)v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = sub_10007CD2C(v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    *(_DWORD *)buf = 138543362;
    v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}@The delegate does not support prompting the user for a passcode", buf, 0xCu);

  }
  v6 = objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 9, CFSTR("Pairing Failed."), CFSTR("The delegate is missing."), 0, 0));
  v4[2](v4, 0, v6);
  -[_HAPAccessoryServerBTLE200 setSetupCodeCompletionHandler:](v8, "setSetupCodeCompletionHandler:", 0);
LABEL_10:

}

- (BOOL)tryPairingPassword:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10006247C;
  v9[3] = &unk_100236AD0;
  v9[4] = self;
  v10 = v5;
  v7 = v5;
  dispatch_async(v6, v9);

  return 0;
}

- (void)_pairingCompletedWithError:(id)a3
{
  id v4;
  _HAPAccessoryServerBTLE200 *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  id v11;
  void *v12;
  HAPAuthSession *v13;
  void *v14;
  void *v15;
  HAPAuthSession *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[4];
  id v25;
  _HAPAccessoryServerBTLE200 *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;

  v4 = a3;
  v5 = self;
  v7 = sub_10007CCE4((uint64_t)v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = sub_10007CD2C(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    *(_DWORD *)buf = 138543618;
    v28 = v10;
    v29 = 2112;
    v30 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@Pair Setup completed with error: %@", buf, 0x16u);

  }
  if (v4)
  {
    -[_HAPAccessoryServerBTLE200 setPairing:](v5, "setPairing:", 0);
    -[_HAPAccessoryServerBTLE200 setPairingDisconnectionError:](v5, "setPairingDisconnectionError:", 0);
    -[_HAPAccessoryServerBTLE200 setBadPairSetupCode:](v5, "setBadPairSetupCode:", 0);
    -[_HAPAccessoryServerBTLE200 setPairSetupBackoffTimeInterval:](v5, "setPairSetupBackoffTimeInterval:", 0.0);
    -[_HAPAccessoryServerBTLE200 setPairSetupSession:](v5, "setPairSetupSession:", 0);
    -[_HAPAccessoryServerBTLE200 disconnectWithCompletionHandler:disconnectionError:](v5, "disconnectWithCompletionHandler:disconnectionError:", 0, v4);
  }
  -[_HAPAccessoryServerBTLE200 setWaitingForAuth:](v5, "setWaitingForAuth:", 0);
  v11 = -[_HAPAccessoryServerBTLE200 _getPairSetupType](v5, "_getPairSetupType");
  if (v11 == (id)5)
  {
    if (-[_HAPAccessoryServerBTLE200 _delegateRespondsToSelector:](v5, "_delegateRespondsToSelector:", "accessoryServer:validateCert:model:"))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 pairSetupSession](v5, "pairSetupSession"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "getCertificate"));

      v20 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer delegateQueue](v5, "delegateQueue"));
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100062AD4;
      v22[3] = &unk_100236AD0;
      v22[4] = v5;
      v23 = v19;
      v21 = v19;
      dispatch_async(v20, v22);

    }
  }
  else if (v11 == (id)3)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 pairSetupSession](v5, "pairSetupSession"));
    objc_msgSend(v12, "generateSessionKeys");

    v13 = [HAPAuthSession alloc];
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 protocolInfoServiceSignatureCharacteristics](v5, "protocolInfoServiceSignatureCharacteristics"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "instanceID"));
    v16 = -[HAPAuthSession initWithRole:instanceId:delegate:](v13, "initWithRole:instanceId:delegate:", 0, v15, v5);
    -[_HAPAccessoryServerBTLE200 setAuthSession:](v5, "setAuthSession:", v16);

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10006283C;
    v24[3] = &unk_1002378A0;
    v25 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v26 = v5;
    v17 = v25;
    -[_HAPAccessoryServerBTLE200 getAccessoryInfo:](v5, "getAccessoryInfo:", v24);

  }
  else
  {
    -[_HAPAccessoryServerBTLE200 setPairing:](v5, "setPairing:", 0);
    -[_HAPAccessoryServerBTLE200 setBadPairSetupCode:](v5, "setBadPairSetupCode:", 0);
    -[_HAPAccessoryServerBTLE200 setPairSetupBackoffTimeInterval:](v5, "setPairSetupBackoffTimeInterval:", 0.0);
    -[_HAPAccessoryServerBTLE200 setPairSetupSession:](v5, "setPairSetupSession:", 0);
    -[HAPAccessoryServer setPairingRequest:](v5, "setPairingRequest:", 0);
    -[_HAPAccessoryServerBTLE200 _notifyDelegatesPairingStopped:](v5, "_notifyDelegatesPairingStopped:", v4);
  }

}

- (HAPCharacteristic)pairingFeaturesCharacteristic
{
  HAPAccessoryProtocolInfo **p_authenticatedProtocolInfo;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  p_authenticatedProtocolInfo = &self->_authenticatedProtocolInfo;
  WeakRetained = objc_loadWeakRetained((id *)&self->_authenticatedProtocolInfo);

  if (!WeakRetained)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer primaryAccessory](self, "primaryAccessory"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "servicesOfType:", CFSTR("00000010-0000-1000-8000-4D69736D6574")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "characteristicsOfType:", CFSTR("00000013-0000-1000-8000-4D69736D6574")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    objc_storeWeak((id *)p_authenticatedProtocolInfo, v9);

  }
  return (HAPCharacteristic *)objc_loadWeakRetained((id *)p_authenticatedProtocolInfo);
}

- (HAPCharacteristic)pairSetupCharacteristic
{
  HAPCharacteristic **p_pairingFeaturesCharacteristic;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  p_pairingFeaturesCharacteristic = &self->_pairingFeaturesCharacteristic;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pairingFeaturesCharacteristic);

  if (!WeakRetained)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer primaryAccessory](self, "primaryAccessory"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "servicesOfType:", CFSTR("00000010-0000-1000-8000-4D69736D6574")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "characteristicsOfType:", CFSTR("00000011-0000-1000-8000-4D69736D6574")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    objc_storeWeak((id *)p_pairingFeaturesCharacteristic, v9);

  }
  return (HAPCharacteristic *)objc_loadWeakRetained((id *)p_pairingFeaturesCharacteristic);
}

- (HAPCharacteristic)pairingsCharacteristic
{
  NSOperationQueue **p_pairVerifyOperationQueue;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  p_pairVerifyOperationQueue = &self->_pairVerifyOperationQueue;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pairVerifyOperationQueue);

  if (!WeakRetained)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer primaryAccessory](self, "primaryAccessory"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "servicesOfType:", CFSTR("00000010-0000-1000-8000-4D69736D6574")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "characteristicsOfType:", CFSTR("00000014-0000-1000-8000-4D69736D6574")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    objc_storeWeak((id *)p_pairVerifyOperationQueue, v9);

  }
  return (HAPCharacteristic *)objc_loadWeakRetained((id *)p_pairVerifyOperationQueue);
}

- (void)addPairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _HAPAccessoryServerBTLE200 *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100062E8C;
  v15[3] = &unk_100237208;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)removePairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000635B4;
  v15[3] = &unk_100237208;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (BOOL)removePairingForCurrentControllerOnQueue:(id)a3 completion:(id)a4
{
  return -[_HAPAccessoryServerBTLE200 removePairingForCurrentControllerOnQueue:completion:serverPairingCompletion:](self, "removePairingForCurrentControllerOnQueue:completion:serverPairingCompletion:", a3, a4, 0);
}

- (BOOL)removePairingForCurrentControllerOnQueue:(id)a3 completion:(id)a4 serverPairingCompletion:(id)a5
{
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _HAPAccessoryServerBTLE200 *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  _QWORD v26[4];
  NSObject *v27;
  id v28;
  id v29;
  id v30;
  _QWORD block[4];
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer keyStore](self, "keyStore"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer identifier](self, "identifier"));
  v34 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "readControllerPairingKeyForAccessory:error:", v12, &v34));
  v14 = v34;

  v15 = self;
  v17 = sub_10007CCE4((uint64_t)v15, v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  v19 = v18;
  if (v13)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v20 = sub_10007CD2C(v15);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      *(_DWORD *)buf = 138543362;
      v36 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%{public}@Received request to remove pairing for the current controller", buf, 0xCu);

    }
    objc_initWeak((id *)buf, v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](v15, "clientQueue"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100063F80;
    v26[3] = &unk_100237918;
    objc_copyWeak(&v30, (id *)buf);
    v27 = v8;
    v28 = v9;
    v29 = v10;
    -[_HAPAccessoryServerBTLE200 removePairing:completionQueue:completionHandler:](v15, "removePairing:completionQueue:completionHandler:", v13, v22, v26);

    -[_HAPAccessoryServerBTLE200 setHasValidCache:](v15, "setHasValidCache:", 0);
    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v23 = sub_10007CD2C(v15);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      *(_DWORD *)buf = 138543618;
      v36 = v24;
      v37 = 2112;
      v38 = v14;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}@Remove current pairing failed, failed to get the current controller with error: %@", buf, 0x16u);

    }
    if (v8 && v9)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100063F70;
      block[3] = &unk_100236E80;
      v33 = v9;
      v32 = v14;
      dispatch_async(v8, block);

    }
  }

  return v13 != 0;
}

- (void)listPairingsWithCompletionQueue:(id)a3 completionHandler:(id)a4
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
  v8 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000644A0;
  block[3] = &unk_100236B98;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)_sendPairingRequestData:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void ***v9;
  _HAPAccessoryServerBTLE200 *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void **v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *);
  void *v20;
  id v21;
  id v22;
  id location[3];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 pairingsCharacteristic](self, "pairingsCharacteristic"));
  if (v8)
  {
    objc_initWeak(location, self);
    v17 = _NSConcreteStackBlock;
    v18 = 3221225472;
    v19 = sub_100064C50;
    v20 = &unk_100237968;
    objc_copyWeak(&v22, location);
    v21 = v7;
    v9 = objc_retainBlock(&v17);
    -[_HAPAccessoryServerBTLE200 _writeValue:toCharacteristic:authorizationData:contextData:options:completionHandler:](self, "_writeValue:toCharacteristic:authorizationData:contextData:options:completionHandler:", v6, v8, 0, 0, 7, v9, v17, v18, v19, v20);

    objc_destroyWeak(&v22);
    objc_destroyWeak(location);
  }
  else
  {
    v10 = self;
    v12 = sub_10007CCE4((uint64_t)v10, v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = sub_10007CD2C(v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@Pairing operation failed, missing the Pairings characteristic", (uint8_t *)location, 0xCu);

    }
    if (v7)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 12, CFSTR("Pairing operation failed."), CFSTR("Missing Pairings characteristic."), 0, 0));
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v16);

    }
  }

}

- (id)getLocalPairingIdentityWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer keyStore](self, "keyStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer identifier](self, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "readControllerPairingKeyForAccessory:error:", v6, a3));

  return v7;
}

- (unint64_t)_getPairSetupType
{
  unint64_t result;

  result = -[HAPAccessoryServer authMethod](self, "authMethod");
  if (result != 1)
  {
    if ((id)-[HAPAccessoryServer authMethod](self, "authMethod") == (id)2)
    {
      if (-[_HAPAccessoryServerBTLE200 authenticated](self, "authenticated"))
        return 4;
      else
        return 3;
    }
    else if ((id)-[HAPAccessoryServer authMethod](self, "authMethod") == (id)4)
    {
      return 5;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)identifyWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10006505C;
  v6[3] = &unk_100237388;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[_HAPAccessoryServerBTLE200 _discoverWithType:completionHandler:](self, "_discoverWithType:completionHandler:", 1, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (HAPCharacteristic)identifyCharacteristic
{
  int64_t *p_discoveryRetries;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  p_discoveryRetries = &self->_discoveryRetries;
  WeakRetained = objc_loadWeakRetained((id *)&self->_discoveryRetries);

  if (!WeakRetained)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer primaryAccessory](self, "primaryAccessory"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "servicesOfType:", CFSTR("0000003E-0000-1000-8000-4D69736D6574")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "characteristicsOfType:", CFSTR("00000014-0000-1000-8000-4D69736D6574")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    objc_storeWeak((id *)p_discoveryRetries, v9);

  }
  return (HAPCharacteristic *)objc_loadWeakRetained((id *)p_discoveryRetries);
}

- (id)_pendingRequestForCharacteristic:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 pendingRequests](self, "pendingRequests", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "characteristic"));
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_pendingResponseForRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 pendingResponses](self, "pendingResponses", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "request"));
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_sendRequest:(id)a3 shouldPrioritize:(BOOL)a4 responseHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  int64_t v10;
  _HAPAccessoryServerBTLE200 *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  __CFString *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id location;
  uint8_t buf[4];
  void *v30;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = -[_HAPAccessoryServerBTLE200 connectionState](self, "connectionState");
  if (v10 != 3 && v10)
  {
    v11 = (_HAPAccessoryServerBTLE200 *)objc_alloc_init((Class)HMFBlockOperation);
    objc_initWeak((id *)buf, self);
    objc_initWeak(&location, v11);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100065AEC;
    v24[3] = &unk_1002379E0;
    objc_copyWeak(&v26, &location);
    v24[4] = self;
    v17 = v8;
    v25 = v17;
    objc_copyWeak(&v27, (id *)buf);
    -[_HAPAccessoryServerBTLE200 addExecutionBlock:](v11, "addExecutionBlock:", v24);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100065CA0;
    v19[3] = &unk_100237A08;
    objc_copyWeak(&v22, (id *)buf);
    objc_copyWeak(&v23, &location);
    v18 = v17;
    v20 = v18;
    v21 = v9;
    -[_HAPAccessoryServerBTLE200 setCompletionBlock:](v11, "setCompletionBlock:", v19);
    objc_msgSend(v18, "setOperation:", v11);
    -[_HAPAccessoryServerBTLE200 _enqueueRequest:shouldPrioritize:](self, "_enqueueRequest:shouldPrioritize:", v18, v6);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v27);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v11 = self;
    v13 = sub_10007CCE4((uint64_t)v11, v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = sub_10007CD2C(v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      *(_DWORD *)buf = 138543362;
      v30 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%{public}@Skipping request, accessory has disconnected or is about to disconnect", buf, 0xCu);

    }
  }

}

- (void)_reallySendRequest:(id)a3 completionHandler:(id)a4
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
  v8 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100066104;
  block[3] = &unk_100236B98;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (unint64_t)_maximumControlWriteLengthForRequest:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  _HAPAccessoryServerBTLE200 *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  __CFString *v13;
  void *v14;
  _HAPAccessoryServerBTLE200 *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  __CFString *v19;
  void *v20;
  unsigned int v21;
  unint64_t v22;
  _HAPAccessoryServerBTLE200 *v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  __CFString *v27;
  void *v28;
  _HAPAccessoryServerBTLE200 *v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  __CFString *v33;
  void *v34;
  int v36;
  void *v37;
  __int16 v38;
  unint64_t v39;
  __int16 v40;
  int v41;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServerBTLE peripheral](self, "peripheral"));
  v6 = (unint64_t)objc_msgSend(v5, "maximumWriteValueLengthForType:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServerBTLE peripheral](self, "peripheral"));
  v8 = (unint64_t)objc_msgSend(v7, "maximumWriteValueLengthForType:", 1);

  if (!v6)
  {
    v9 = self;
    v11 = sub_10007CCE4((uint64_t)v9, v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = sub_10007CD2C(v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v36 = 138543362;
      v37 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%{public}@Overriding the maximum write length to 512", (uint8_t *)&v36, 0xCu);

    }
    v6 = 512;
    if (!v8)
      goto LABEL_8;
LABEL_7:
    if (v8 != -3)
      goto LABEL_11;
    goto LABEL_8;
  }
  if (v8)
    goto LABEL_7;
LABEL_8:
  v15 = self;
  v17 = sub_10007CCE4((uint64_t)v15, v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v19 = sub_10007CD2C(v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v36 = 138543362;
    v37 = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%{public}@Overriding the peripheral's mtu length to 23", (uint8_t *)&v36, 0xCu);

  }
  v8 = 23;
LABEL_11:
  v21 = objc_msgSend(v4, "isEncrypted");
  v22 = 25;
  if (!v21)
    v22 = 1;
  if (v8 / v22 >= 4)
  {
    v23 = self;
    v25 = sub_10007CCE4((uint64_t)v23, v24);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      v27 = sub_10007CD2C(v23);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      v36 = 138543618;
      v37 = v28;
      v38 = 2048;
      v39 = v8;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "%{public}@Electing to write as reduced size payload of length %tu", (uint8_t *)&v36, 0x16u);

    }
    v6 = v8;
  }
  if (objc_msgSend(v4, "isEncrypted"))
  {
    if (v6 > 0x17)
    {
      v6 -= 24;
    }
    else
    {
      v29 = self;
      v31 = sub_10007CCE4((uint64_t)v29, v30);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = sub_10007CD2C(v29);
        v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
        v36 = 138543874;
        v37 = v34;
        v38 = 2048;
        v39 = v6;
        v40 = 1024;
        v41 = 24;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%{public}@The maximum write length, %tu, is less than the nonce and auth tag length, %d", (uint8_t *)&v36, 0x1Cu);

      }
      v6 = 0;
    }
  }

  return v6;
}

- (void)writeWithoutResponse:(id)a3 toCharacteristic:(id)a4
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
  v8 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100066940;
  block[3] = &unk_100236EA8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)writeRawWithResponse:(id)a3 toCharacteristic:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, id);
  void *v10;
  id v11;
  _HAPAccessoryServerBTLE200 *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  __CFString *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;

  v8 = a4;
  v9 = (void (**)(id, id))a5;
  v18 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 _encryptDataAndGenerateAuthTag:error:](self, "_encryptDataAndGenerateAuthTag:error:", a3, &v18));
  v11 = v18;
  if (v10)
  {
    -[_HAPAccessoryServerBTLE200 _sendData:toCharacteristic:completionHandler:](self, "_sendData:toCharacteristic:completionHandler:", v10, v8, v9);
  }
  else
  {
    v12 = self;
    v14 = sub_10007CCE4((uint64_t)v12, v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = sub_10007CD2C(v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      *(_DWORD *)buf = 138543618;
      v20 = v17;
      v21 = 2112;
      v22 = v11;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to encrypt raw write payload with error: %@", buf, 0x16u);

    }
    if (v9)
      v9[2](v9, v11);
  }

}

- (void)_sendControlPacket:(id)a3 forRequest:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, id);
  void *v10;
  uint64_t v11;
  id v12;
  _HAPAccessoryServerBTLE200 *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  __CFString *v17;
  void *v18;
  id v19;
  _HAPAccessoryServerBTLE200 *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  _HAPAccessoryServerBTLE200 *v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  __CFString *v31;
  void *v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;

  v8 = a4;
  v9 = (void (**)(id, id))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "serialize"));
  if (!objc_msgSend(v8, "isEncrypted"))
  {
    v12 = 0;
    goto LABEL_5;
  }
  v33 = 0;
  v11 = objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 _encryptDataAndGenerateAuthTag:error:](self, "_encryptDataAndGenerateAuthTag:error:", v10, &v33));
  v12 = v33;

  if (v11)
  {
    v10 = (void *)v11;
LABEL_5:
    v13 = self;
    v15 = sub_10007CCE4((uint64_t)v13, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = sub_10007CD2C(v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = objc_msgSend(v10, "length");
      *(_DWORD *)buf = 138543874;
      v35 = v18;
      v36 = 2048;
      v37 = v19;
      v38 = 2112;
      v39 = v8;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%{public}@Sending %tu bytes of control payload for request: %@", buf, 0x20u);

    }
    v20 = v13;
    v22 = sub_10007CCE4((uint64_t)v20, v21);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v24 = sub_10007CD2C(v20);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      *(_DWORD *)buf = 138543874;
      v35 = v25;
      v36 = 2112;
      v37 = v8;
      v38 = 2112;
      v39 = v10;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%{public}@Sending control payload for request, %@, to accessory: %@", buf, 0x20u);

    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "characteristic"));
    -[_HAPAccessoryServerBTLE200 _sendData:toCharacteristic:completionHandler:](v20, "_sendData:toCharacteristic:completionHandler:", v10, v26, v9);

    goto LABEL_10;
  }
  v27 = self;
  v29 = sub_10007CCE4((uint64_t)v27, v28);
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    v31 = sub_10007CD2C(v27);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    *(_DWORD *)buf = 138543618;
    v35 = v32;
    v36 = 2112;
    v37 = v12;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to encrypt control payload with error: %@", buf, 0x16u);

  }
  if (v9)
    v9[2](v9, v12);
LABEL_10:

}

- (void)_sendData:(id)a3 toCharacteristic:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _HAPAccessoryServerBTLE200 *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  _HAPAccessoryServerBTLE200 *v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  __int16 v33;
  id v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 characteristicWriteCompletionHandlers](self, "characteristicWriteCompletionHandlers"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v9));

  if (!v12)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cbCharacteristic"));
    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 characteristicWriteCompletionHandlers](self, "characteristicWriteCompletionHandlers"));
      v21 = objc_msgSend(v10, "copy");
      v22 = objc_retainBlock(v21);
      objc_msgSend(v20, "setObject:forKey:", v22, v9);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServerBTLE peripheral](self, "peripheral"));
      objc_msgSend(v23, "writeValue:forCharacteristic:type:", v8, v19, 0);

      -[_HAPAccessoryServerBTLE200 _kickConnectionIdleTimer](self, "_kickConnectionIdleTimer");
    }
    else
    {
      v24 = self;
      v26 = sub_10007CCE4((uint64_t)v24, v25);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = sub_10007CD2C(v24);
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        v31 = 138543618;
        v32 = v29;
        v33 = 2112;
        v34 = v9;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%{public}@Missing mapped characteristic for characteristic: %@", (uint8_t *)&v31, 0x16u);

      }
      if (v10)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 1, CFSTR("Missing mapped characteristic"), 0, 0, 0));
        (*((void (**)(id, void *))v10 + 2))(v10, v30);

      }
    }
    goto LABEL_12;
  }
  v13 = self;
  v15 = sub_10007CCE4((uint64_t)v13, v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v17 = sub_10007CD2C(v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v31 = 138543618;
    v32 = v18;
    v33 = 2112;
    v34 = v9;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@A write operation for '%@' is already is progress.", (uint8_t *)&v31, 0x16u);

  }
  if (v10)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 4, CFSTR("Operation in progress."), CFSTR("A write operation is already in progress."), 0, 0));
    (*((void (**)(id, void *))v10 + 2))(v10, v19);
LABEL_12:

  }
}

- (void)_handleWriteCompletionForCharacteristic:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  _HAPAccessoryServerBTLE200 *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  __CFString *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 characteristicWriteCompletionHandlers](self, "characteristicWriteCompletionHandlers"));
  v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v6));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 characteristicWriteCompletionHandlers](self, "characteristicWriteCompletionHandlers"));
    objc_msgSend(v10, "removeObjectForKey:", v6);

    -[_HAPAccessoryServerBTLE200 _kickConnectionIdleTimer](self, "_kickConnectionIdleTimer");
    ((void (**)(_QWORD, id))v9)[2](v9, v7);
  }
  else
  {
    v11 = self;
    v13 = sub_10007CCE4((uint64_t)v11, v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = sub_10007CD2C(v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v17 = 138543618;
      v18 = v16;
      v19 = 2112;
      v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@Received unexpected write completion from characteristic, %@, dropping", (uint8_t *)&v17, 0x16u);

    }
  }

}

- (void)_requestResponseForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _HAPAccessoryServerBTLE200 *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  __CFString *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "characteristic"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cbCharacteristic"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "responseTimer"));
    objc_msgSend(v7, "resume");

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServerBTLE peripheral](self, "peripheral"));
    objc_msgSend(v8, "readValueForCharacteristic:", v6);
  }
  else
  {
    v9 = self;
    v11 = sub_10007CCE4((uint64_t)v9, v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = sub_10007CD2C(v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = 138543618;
      v16 = v14;
      v17 = 2112;
      v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@Missing mapped characteristic for request: %@", (uint8_t *)&v15, 0x16u);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 1, CFSTR("Missing mapped characteristic"), 0, 0, 0));
    objc_msgSend(v4, "cancelWithError:", v8);
  }

}

- (void)_handleRawResponseData:(id)a3 fromCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  _HAPAccessoryServerBTLE200 *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  __CFString *v15;
  _HAPAccessoryServerBTLE200 *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  __CFString *v21;
  _HAPAccessoryServerBTLE200 *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _HAPAccessoryServerBTLE200 *v33;
  uint64_t v34;
  id v35;
  NSObject *v36;
  __CFString *v37;
  _HAPAccessoryServerBTLE200 *v38;
  NSObject *v39;
  __CFString *v40;
  _HAPAccessoryServerBTLE200 *v41;
  const char *v42;
  NSObject *v43;
  uint32_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  unsigned __int8 v49;
  void *v50;
  void *v51;
  uint64_t v52;
  id v53;
  __CFString *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  _QWORD block[5];
  id v71;
  _HAPAccessoryServerBTLE200 *v72;
  id v73;
  uint8_t buf[4];
  _HAPAccessoryServerBTLE200 *v75;
  __int16 v76;
  id v77;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    v73 = 0;
    v11 = (_HAPAccessoryServerBTLE200 *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 _decryptData:error:](self, "_decryptData:error:", v8, &v73));
    v14 = v73;
    v16 = self;
    v18 = sub_10007CCE4((uint64_t)v16, v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    v20 = v19;
    if (v11)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v21 = sub_10007CD2C(v16);
        v22 = (_HAPAccessoryServerBTLE200 *)objc_claimAutoreleasedReturnValue(v21);
        *(_DWORD *)buf = 138543618;
        v75 = v22;
        v76 = 2112;
        v77 = v11;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%{public}@Decrypted Response: %@", buf, 0x16u);

      }
      if (!v9)
        goto LABEL_24;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cbCharacteristic"));

      if (!v23)
        goto LABEL_24;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cbCharacteristic"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "UUID"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("00000104-0000-1000-8000-4D69736D6574")));
      if ((objc_msgSend(v25, "isEqual:", v26) & 1) != 0)
        goto LABEL_14;
      v68 = v25;
      v69 = v24;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cbCharacteristic"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "UUID"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("00000105-0000-1000-8000-4D69736D6574")));
      if ((objc_msgSend(v28, "isEqual:", v29) & 1) != 0)
      {
LABEL_13:

        v25 = v68;
        v24 = v69;
LABEL_14:

        goto LABEL_15;
      }
      v66 = v28;
      v67 = v26;
      v65 = v29;
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cbCharacteristic"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "UUID"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("00000108-0000-1000-8000-4D69736D6574")));
      if ((objc_msgSend(v31, "isEqual:", v32) & 1) != 0)
      {

        v29 = v65;
        v28 = v66;
        v26 = v67;
        goto LABEL_13;
      }
      v62 = v32;
      v63 = v31;
      v64 = v30;
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cbCharacteristic"));
      v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "UUID"));
      v46 = objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("00000110-0000-1000-8000-4D69736D6574")));
      v60 = (void *)v45;
      v47 = (void *)v45;
      v48 = (void *)v46;
      if ((objc_msgSend(v47, "isEqual:", v46) & 1) != 0)
      {
        v49 = 1;
      }
      else
      {
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cbCharacteristic"));
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "UUID"));
        v57 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("00000109-0000-1000-8000-4D69736D6574")));
        v58 = v50;
        if ((objc_msgSend(v50, "isEqual:") & 1) != 0)
        {
          v49 = 1;
        }
        else
        {
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cbCharacteristic"));
          v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "UUID"));
          v51 = (void *)objc_claimAutoreleasedReturnValue(+[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", CFSTR("0000010A-0000-1000-8000-4D69736D6574")));
          v49 = objc_msgSend(v55, "isEqual:", v51);

        }
      }

      if ((v49 & 1) != 0)
      {
LABEL_15:
        v33 = v16;
        v35 = sub_10007CCE4((uint64_t)v33, v34);
        v36 = objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          v37 = sub_10007CD2C(v33);
          v38 = (_HAPAccessoryServerBTLE200 *)objc_claimAutoreleasedReturnValue(v37);
          *(_DWORD *)buf = 138543362;
          v75 = v38;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "%{public}@RAW notify received!", buf, 0xCu);

        }
        if (-[_HAPAccessoryServerBTLE200 _delegateRespondsToSelector:](v33, "_delegateRespondsToSelector:", "accessoryServer:didUpdateValuesForCharacteristic:value:"))
        {
          v39 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer delegateQueue](v33, "delegateQueue"));
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100067B28;
          block[3] = &unk_100236EA8;
          block[4] = v33;
          v71 = v9;
          v11 = v11;
          v72 = v11;
          dispatch_async(v39, block);

        }
        goto LABEL_24;
      }
      v16 = v16;
      v53 = sub_10007CCE4((uint64_t)v16, v52);
      v20 = objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v54 = sub_10007CD2C(v16);
        v41 = (_HAPAccessoryServerBTLE200 *)objc_claimAutoreleasedReturnValue(v54);
        *(_DWORD *)buf = 138543362;
        v75 = v41;
        v42 = "%{public}@RAW read data not allowed on this characteristic!";
        v43 = v20;
        v44 = 12;
        goto LABEL_21;
      }
    }
    else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v40 = sub_10007CD2C(v16);
      v41 = (_HAPAccessoryServerBTLE200 *)objc_claimAutoreleasedReturnValue(v40);
      *(_DWORD *)buf = 138543618;
      v75 = v41;
      v76 = 2112;
      v77 = v14;
      v42 = "%{public}@Failed to decrypt read data with error: %@";
      v43 = v20;
      v44 = 22;
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, v42, buf, v44);

    }
    goto LABEL_23;
  }
  v11 = self;
  v13 = sub_10007CCE4((uint64_t)v11, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v15 = sub_10007CD2C(v11);
    v16 = (_HAPAccessoryServerBTLE200 *)objc_claimAutoreleasedReturnValue(v15);
    *(_DWORD *)buf = 138543618;
    v75 = v16;
    v76 = 2112;
    v77 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to get read data with error: %@", buf, 0x16u);
LABEL_23:

  }
LABEL_24:

}

- (void)_handleResponseData:(id)a3 fromCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  _HAPAccessoryServerBTLE200 *v9;
  id v10;
  _HAPAccessoryServerBTLE200 *v11;
  _HAPAccessoryServerBTLE200 *v12;
  _HAPAccessoryServerBTLE200 *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  __CFString *v17;
  void *v18;
  _HAPAccessoryServerBTLE200 *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  _HAPAccessoryServerBTLE200 *v26;
  uint64_t v27;
  _HAPAccessoryServerBTLE200 *v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  __CFString *v32;
  void *v33;
  void *v34;
  _HAPAccessoryServerBTLE200 *v35;
  void *v36;
  void *v37;
  unsigned __int8 v38;
  uint64_t v39;
  _HAPAccessoryServerBTLE200 *v40;
  uint64_t v41;
  id v42;
  NSObject *v43;
  NSObject *v44;
  __CFString *v45;
  void *v46;
  HAPBTLEResponse *v47;
  _HAPAccessoryServerBTLE200 *v48;
  uint64_t v49;
  id v50;
  NSObject *v51;
  __CFString *v52;
  void *v53;
  _HAPAccessoryServerBTLE200 *v54;
  uint64_t v55;
  id v56;
  NSObject *v57;
  __CFString *v58;
  void *v59;
  unsigned int v60;
  _HAPAccessoryServerBTLE200 *v61;
  uint64_t v62;
  id v63;
  NSObject *v64;
  __CFString *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  unint64_t v70;
  HAPBTLEResponse *v71;
  _HAPAccessoryServerBTLE200 *v72;
  uint64_t v73;
  id v74;
  NSObject *v75;
  __CFString *v76;
  void *v77;
  void *v78;
  _HAPAccessoryServerBTLE200 *v79;
  uint64_t v80;
  id v81;
  NSObject *v82;
  __CFString *v83;
  _HAPAccessoryServerBTLE200 *v84;
  uint64_t v85;
  void *v86;
  _HAPAccessoryServerBTLE200 *v87;
  uint64_t v88;
  id v89;
  NSObject *v90;
  __CFString *v91;
  void *v92;
  const __CFString *v93;
  const __CFString *v94;
  id v95;
  _HAPAccessoryServerBTLE200 *v96;
  uint64_t v97;
  id v98;
  NSObject *v99;
  __CFString *v100;
  void *v101;
  __CFString *v102;
  void *v103;
  _HAPAccessoryServerBTLE200 *v104;
  uint64_t v105;
  id v106;
  NSObject *v107;
  __CFString *v108;
  void *v109;
  HAPBTLEResponse *v110;
  id v111;
  void *v112;
  _HAPAccessoryServerBTLE200 *v113;
  id v114;
  id v115;
  id v116;
  uint8_t buf[4];
  void *v118;
  __int16 v119;
  _HAPAccessoryServerBTLE200 *v120;
  __int16 v121;
  uint64_t v122;

  v8 = a3;
  v9 = (_HAPAccessoryServerBTLE200 *)a4;
  v10 = a5;
  v11 = (_HAPAccessoryServerBTLE200 *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 _pendingRequestForCharacteristic:](self, "_pendingRequestForCharacteristic:", v9));
  v12 = v11;
  if (!v11)
  {
    v19 = self;
    v21 = sub_10007CCE4((uint64_t)v19, v20);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = sub_10007CD2C(v19);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      *(_DWORD *)buf = 138543618;
      v118 = v24;
      v119 = 2112;
      v120 = v9;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}@Received unexpected response from characteristic, %@, dropping", buf, 0x16u);

    }
    goto LABEL_64;
  }
  if (!v10)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 responseTimer](v11, "responseTimer"));
    objc_msgSend(v25, "suspend");

    -[_HAPAccessoryServerBTLE200 _kickConnectionIdleTimer](self, "_kickConnectionIdleTimer");
    v26 = (_HAPAccessoryServerBTLE200 *)v8;
    if (-[_HAPAccessoryServerBTLE200 isEncrypted](v12, "isEncrypted"))
    {
      v116 = 0;
      v27 = objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 _decryptData:error:](self, "_decryptData:error:", v26, &v116));
      v19 = (_HAPAccessoryServerBTLE200 *)v116;

      if (!v27)
      {
        v61 = self;
        v63 = sub_10007CCE4((uint64_t)v61, v62);
        v64 = objc_claimAutoreleasedReturnValue(v63);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          v65 = sub_10007CD2C(v61);
          v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
          *(_DWORD *)buf = 138543874;
          v118 = v66;
          v119 = 2112;
          v120 = v12;
          v121 = 2112;
          v122 = (uint64_t)v19;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "%{public}@Failed to decrypt response to request %@ with error: %@", buf, 0x20u);

        }
        -[_HAPAccessoryServerBTLE200 cancelWithError:](v12, "cancelWithError:", v19);
        goto LABEL_64;
      }

      v19 = (_HAPAccessoryServerBTLE200 *)v27;
    }
    else
    {
      v19 = v26;
    }
    v28 = self;
    v30 = sub_10007CCE4((uint64_t)v28, v29);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      v32 = sub_10007CD2C(v28);
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      *(_DWORD *)buf = 138543618;
      v118 = v33;
      v119 = 2112;
      v120 = v19;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "%{public}@Decrypted Response: %@", buf, 0x16u);

    }
    v115 = 0;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[HAPBTLEControlPacket packetWithSerializedData:error:](HAPBTLEControlPacket, "packetWithSerializedData:error:", v19, &v115));
    v35 = (_HAPAccessoryServerBTLE200 *)v115;
    if (!v34)
    {
      v48 = v28;
      v50 = sub_10007CCE4((uint64_t)v48, v49);
      v51 = objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        v52 = sub_10007CD2C(v48);
        v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
        *(_DWORD *)buf = 138543618;
        v118 = v53;
        v119 = 2112;
        v120 = v35;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse control field with error: %@", buf, 0x16u);

      }
      -[_HAPAccessoryServerBTLE200 cancelWithError:](v12, "cancelWithError:", v35);
      goto LABEL_63;
    }
    if (objc_msgSend(v34, "type") != 1)
    {
      v54 = v28;
      v56 = sub_10007CCE4((uint64_t)v54, v55);
      v57 = objc_claimAutoreleasedReturnValue(v56);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        v58 = sub_10007CD2C(v54);
        v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
        v60 = objc_msgSend(v34, "type");
        *(_DWORD *)buf = 138543618;
        v118 = v59;
        v119 = 1024;
        LODWORD(v120) = v60;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "%{public}@Invalid response type control type: %u", buf, 0x12u);

      }
      v47 = (HAPBTLEResponse *)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 3, CFSTR("Request failed."), CFSTR("Invalid response control type."), 0, 0));
      -[_HAPAccessoryServerBTLE200 cancelWithError:](v12, "cancelWithError:", v47);
      goto LABEL_62;
    }
    v113 = v35;
    if (objc_msgSend(v34, "isContinuationPacket"))
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer identifier](v12, "identifier"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "transactionIdentifier"));
      v38 = objc_msgSend(v36, "isEqual:", v37);

      if ((v38 & 1) == 0)
      {
        v79 = v28;
        v81 = sub_10007CCE4((uint64_t)v79, v80);
        v82 = objc_claimAutoreleasedReturnValue(v81);
        if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
        {
          v83 = sub_10007CD2C(v79);
          v112 = (void *)objc_claimAutoreleasedReturnValue(v83);
          v84 = (_HAPAccessoryServerBTLE200 *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "transactionIdentifier"));
          v85 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer identifier](v12, "identifier"));
          *(_DWORD *)buf = 138543874;
          v118 = v112;
          v119 = 2112;
          v120 = v84;
          v121 = 2112;
          v122 = v85;
          v86 = (void *)v85;
          _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_ERROR, "%{public}@The continuation response payload transaction identifier, %@, does not match the request's transaction identifier, %@.", buf, 0x20u);

        }
        -[_HAPAccessoryServerBTLE200 cancelWithError:](v12, "cancelWithError:", 0);
        v35 = v113;
        goto LABEL_63;
      }
    }
    if (objc_msgSend(v34, "isContinuationPacket"))
    {
      v39 = objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 _pendingResponseForRequest:](v28, "_pendingResponseForRequest:", v12));
      v40 = v28;
      v42 = sub_10007CCE4((uint64_t)v40, v41);
      v43 = objc_claimAutoreleasedReturnValue(v42);
      v44 = v43;
      v110 = (HAPBTLEResponse *)v39;
      if (!v39)
      {
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          v102 = sub_10007CD2C(v40);
          v103 = (void *)objc_claimAutoreleasedReturnValue(v102);
          *(_DWORD *)buf = 138543618;
          v118 = v103;
          v119 = 2112;
          v120 = v12;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve the response for the continued request: %@", buf, 0x16u);

        }
        v47 = (HAPBTLEResponse *)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 3, CFSTR("Request failed."), CFSTR("Failed to handle continued response."), 0, 0));
        -[_HAPAccessoryServerBTLE200 cancelWithError:](v12, "cancelWithError:", v47);
        v35 = v113;
        goto LABEL_62;
      }
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        v45 = sub_10007CD2C(v40);
        v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
        *(_DWORD *)buf = 138543618;
        v118 = v46;
        v119 = 2112;
        v120 = (_HAPAccessoryServerBTLE200 *)v110;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "%{public}@Received data for continued response: %@", buf, 0x16u);

      }
      v47 = v110;
    }
    else
    {
      v47 = -[HAPBTLEResponse initWithRequest:]([HAPBTLEResponse alloc], "initWithRequest:", v12);
      v67 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 pendingResponses](v28, "pendingResponses"));
      objc_msgSend(v67, "addObject:", v47);

      v40 = (_HAPAccessoryServerBTLE200 *)objc_msgSend(objc_alloc((Class)HMFTimer), "initWithTimeInterval:options:", 1, 4.0);
      -[_HAPAccessoryServerBTLE200 setDelegate:](v40, "setDelegate:", v28);
      v68 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](v28, "clientQueue"));
      -[_HAPAccessoryServerBTLE200 setDelegateQueue:](v40, "setDelegateQueue:", v68);

      -[_HAPAccessoryServerBTLE200 setResponseTimer:](v12, "setResponseTimer:", v40);
    }

    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "payload"));
    v114 = 0;
    v70 = -[HAPBTLEResponse appendData:error:](v47, "appendData:error:", v69, &v114);
    v111 = v114;

    if (v70)
    {
      if (!-[HAPBTLEResponse isComplete](v47, "isComplete"))
      {
        v71 = v47;
        v96 = v28;
        v98 = sub_10007CCE4((uint64_t)v96, v97);
        v99 = objc_claimAutoreleasedReturnValue(v98);
        if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
        {
          v100 = sub_10007CD2C(v96);
          v101 = (void *)objc_claimAutoreleasedReturnValue(v100);
          *(_DWORD *)buf = 138543618;
          v118 = v101;
          v119 = 2112;
          v120 = (_HAPAccessoryServerBTLE200 *)v71;
          _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEBUG, "%{public}@Requesting additional data for response: %@", buf, 0x16u);

        }
        -[_HAPAccessoryServerBTLE200 _requestResponseForRequest:](v96, "_requestResponseForRequest:", v12);
        goto LABEL_60;
      }
      v35 = v113;
      if (-[HAPBTLEResponse isValid](v47, "isValid"))
      {
        if ((-[_HAPAccessoryServerBTLE200 isFinished](v12, "isFinished") & 1) != 0)
        {
LABEL_61:

LABEL_62:
LABEL_63:

LABEL_64:
          goto LABEL_65;
        }
        v71 = v47;
        v72 = v28;
        v74 = sub_10007CCE4((uint64_t)v72, v73);
        v75 = objc_claimAutoreleasedReturnValue(v74);
        if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
        {
          v76 = sub_10007CD2C(v72);
          v77 = (void *)objc_claimAutoreleasedReturnValue(v76);
          *(_DWORD *)buf = 138543618;
          v118 = v77;
          v119 = 2112;
          v120 = (_HAPAccessoryServerBTLE200 *)v71;
          _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_INFO, "%{public}@Handling completed response: %@", buf, 0x16u);

        }
        if (-[_HAPAccessoryServerBTLE200 type](v12, "type") == 4)
          -[_HAPAccessoryServerBTLE200 _suspendAllOperations](v72, "_suspendAllOperations");
        v78 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 operation](v12, "operation"));
        objc_msgSend(v78, "finish");
        goto LABEL_59;
      }
      v71 = v47;
      v104 = v28;
      v106 = sub_10007CCE4((uint64_t)v104, v105);
      v107 = objc_claimAutoreleasedReturnValue(v106);
      if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
      {
        v108 = sub_10007CD2C(v104);
        v109 = (void *)objc_claimAutoreleasedReturnValue(v108);
        *(_DWORD *)buf = 138543874;
        v118 = v109;
        v119 = 2112;
        v120 = (_HAPAccessoryServerBTLE200 *)v71;
        v121 = 2112;
        v122 = (uint64_t)v12;
        _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_ERROR, "%{public}@Received invalid response, %@, to request: %@", buf, 0x20u);

      }
      v93 = CFSTR("Invalid response.");
      v94 = CFSTR("The response could not be validated against the reuqest.");
      v95 = 0;
    }
    else
    {
      v71 = v47;
      v87 = v28;
      v89 = sub_10007CCE4((uint64_t)v87, v88);
      v90 = objc_claimAutoreleasedReturnValue(v89);
      if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
      {
        v91 = sub_10007CD2C(v87);
        v92 = (void *)objc_claimAutoreleasedReturnValue(v91);
        *(_DWORD *)buf = 138543618;
        v118 = v92;
        v119 = 2112;
        v120 = (_HAPAccessoryServerBTLE200 *)v71;
        _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_ERROR, "%{public}@Failed to deserialize the response data for response: %@", buf, 0x16u);

      }
      v93 = CFSTR("Failed to deserialize response.");
      v94 = 0;
      v95 = v111;
    }
    v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 15, v93, v94, 0, v95));
    -[_HAPAccessoryServerBTLE200 cancelWithError:](v12, "cancelWithError:", v78);
LABEL_59:

LABEL_60:
    v35 = v113;
    v47 = v71;
    goto LABEL_61;
  }
  v13 = self;
  v15 = sub_10007CCE4((uint64_t)v13, v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v17 = sub_10007CD2C(v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    *(_DWORD *)buf = 138543874;
    v118 = v18;
    v119 = 2112;
    v120 = v12;
    v121 = 2112;
    v122 = (uint64_t)v10;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to get response for request, %@, with error: %@", buf, 0x20u);

  }
  -[_HAPAccessoryServerBTLE200 cancelWithError:](v12, "cancelWithError:", v10);
LABEL_65:

}

- (void)_sendProtocolInfoServiceExchangeData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  _HAPAccessoryServerBTLE200 *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD *v17;
  HAPBTLERequest *v18;
  _HAPAccessoryServerBTLE200 *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  _HAPAccessoryServerBTLE200 *v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id location;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;

  v6 = a3;
  v7 = a4;
  if ((unint64_t)objc_msgSend(v6, "length") >= 2)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subdataWithRange:", 1, (char *)objc_msgSend(v6, "length") - 1));

    v6 = (id)v8;
  }
  v9 = self;
  v11 = sub_10007CCE4((uint64_t)v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = sub_10007CD2C(v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    *(_DWORD *)buf = 138543618;
    v38 = v14;
    v39 = 2112;
    v40 = v6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%{public}@Sending Protocol Exchange for data: %@", buf, 0x16u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 protocolInfoServiceSignatureCharacteristics](v9, "protocolInfoServiceSignatureCharacteristics"));
  if (v15)
  {
    objc_initWeak(&location, v9);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100068A30;
    v33[3] = &unk_100237A58;
    objc_copyWeak(&v35, &location);
    v16 = v7;
    v34 = v16;
    v17 = objc_retainBlock(v33);
    v18 = -[HAPBTLERequest initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:]([HAPBTLERequest alloc], "initWithCharacteristic:requestType:bodyData:shouldEncrypt:timeoutInterval:", v15, 255, v6, 1, 10.0);
    if (v18)
    {
      -[_HAPAccessoryServerBTLE200 _sendRequest:shouldPrioritize:responseHandler:](v9, "_sendRequest:shouldPrioritize:responseHandler:", v18, 0, v17);
      -[_HAPAccessoryServerBTLE200 _kickConnectionIdleTimer](v9, "_kickConnectionIdleTimer");
    }
    else
    {
      v26 = v9;
      v28 = sub_10007CCE4((uint64_t)v26, v27);
      v29 = (id)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = sub_10007CD2C(v26);
        v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
        *(_DWORD *)buf = 138543618;
        v38 = v31;
        v39 = 2112;
        v40 = v15;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to create exchange request for characteristic, %@", buf, 0x16u);

      }
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:](NSError, "hapErrorWithcode:", 9));
      (*((void (**)(id, void *, _QWORD))v16 + 2))(v16, v32, 0);

    }
    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }
  else
  {
    v19 = v9;
    v21 = sub_10007CCE4((uint64_t)v19, v20);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = sub_10007CD2C(v19);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      *(_DWORD *)buf = 138543362;
      v38 = v24;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed, missing the Service Signature Characteristic for Protocol Info Service", buf, 0xCu);

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 3, 0));
    (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v25, 0);

  }
}

- (void)tryEstablishSecuritySession
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  id v6;

  -[_HAPAccessoryServerBTLE200 _suspendConnectionIdleTimer](self, "_suspendConnectionIdleTimer");
  -[HAPAccessoryServerBTLE enterTrackingMode](self, "enterTrackingMode");
  v6 = (id)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 securitySession](self, "securitySession"));
  if (objc_msgSend(v6, "isOpen"))
    goto LABEL_4;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 securitySession](self, "securitySession"));
  if (objc_msgSend(v3, "isOpening"))
  {

LABEL_4:
    return;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 pairSetupSession](self, "pairSetupSession"));
  v5 = objc_msgSend(v4, "isSecureSession");

  if ((v5 & 1) == 0)
  {
    -[_HAPAccessoryServerBTLE200 _suspendAllOperations](self, "_suspendAllOperations");
    -[HAPAccessoryServer setMetric_pairVerifyReason:](self, "setMetric_pairVerifyReason:", CFSTR("noSession.tracking"));
    -[_HAPAccessoryServerBTLE200 _establishSecureSession](self, "_establishSecureSession");
  }
}

- (void)_enqueueRequest:(id)a3 shouldPrioritize:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _HAPAccessoryServerBTLE200 *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;

  v4 = a4;
  v6 = a3;
  v7 = self;
  v9 = sub_10007CCE4((uint64_t)v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = sub_10007CD2C(v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v24 = 138543618;
    v25 = v12;
    v26 = 2112;
    v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}@Queueing request: %@", (uint8_t *)&v24, 0x16u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "characteristic"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 pairVerifyCharacteristic](v7, "pairVerifyCharacteristic"));
  if (objc_msgSend(v13, "isEqual:", v14))
  {
    v15 = objc_msgSend(v6, "type");

    if (v15 != 1)
    {
      v16 = objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 pairVerifyOperationQueue](v7, "pairVerifyOperationQueue"));
      goto LABEL_13;
    }
  }
  else
  {

  }
  if (objc_msgSend(v6, "isEncrypted"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 securitySession](v7, "securitySession"));
    if (!objc_msgSend(v17, "isOpen"))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 securitySession](v7, "securitySession"));
      if (!objc_msgSend(v18, "isOpening"))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 pairSetupSession](v7, "pairSetupSession"));
        v23 = objc_msgSend(v22, "isSecureSession");

        if ((v23 & 1) == 0)
        {
          -[_HAPAccessoryServerBTLE200 _suspendAllOperations](v7, "_suspendAllOperations");
          -[HAPAccessoryServer setMetric_pairVerifyReason:](v7, "setMetric_pairVerifyReason:", CFSTR("noSession.request"));
          -[_HAPAccessoryServerBTLE200 _establishSecureSession](v7, "_establishSecureSession");
        }
        goto LABEL_12;
      }

    }
  }
LABEL_12:
  v16 = objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 requestOperationQueue](v7, "requestOperationQueue"));
LABEL_13:
  v19 = (void *)v16;
  if (v4)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "operation"));
    objc_msgSend(v20, "setQueuePriority:", 4);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "operation"));
  objc_msgSend(v19, "addOperation:", v21);

}

- (unint64_t)_outstandingRequests
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 requestOperationQueue](self, "requestOperationQueue", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "operations"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 += objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "isFinished") ^ 1;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_suspendAllOperations
{
  void *v3;
  unsigned __int8 v4;
  _HAPAccessoryServerBTLE200 *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 requestOperationQueue](self, "requestOperationQueue"));
  v4 = objc_msgSend(v3, "isSuspended");

  if ((v4 & 1) == 0)
  {
    v5 = self;
    v7 = sub_10007CCE4((uint64_t)v5, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = sub_10007CD2C(v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v12 = 138543362;
      v13 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}@Suspending all request operations", (uint8_t *)&v12, 0xCu);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 requestOperationQueue](v5, "requestOperationQueue"));
    objc_msgSend(v11, "setSuspended:", 1);

  }
}

- (void)_resumeAllOperations
{
  void *v3;
  unsigned int v4;
  _HAPAccessoryServerBTLE200 *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 requestOperationQueue](self, "requestOperationQueue"));
  v4 = objc_msgSend(v3, "isSuspended");

  if (v4)
  {
    v5 = self;
    v7 = sub_10007CCE4((uint64_t)v5, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = sub_10007CD2C(v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v12 = 138543362;
      v13 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}@Resuming all request operations", (uint8_t *)&v12, 0xCu);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 requestOperationQueue](v5, "requestOperationQueue"));
    objc_msgSend(v11, "setSuspended:", 0);

  }
}

- (void)_cancelAllQueuedOperationsWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _HAPAccessoryServerBTLE200 *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 requestOperationQueue](self, "requestOperationQueue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "operations"));
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v8 = self;
      v10 = sub_10007CCE4((uint64_t)v8, v9);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v12 = sub_10007CD2C(v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 requestOperationQueue](v8, "requestOperationQueue"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "operations"));
        v17 = 138543618;
        v18 = v13;
        v19 = 2112;
        v20 = v15;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{public}@Cancelling all queued operations: %@", (uint8_t *)&v17, 0x16u);

      }
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 requestOperationQueue](self, "requestOperationQueue"));
    objc_msgSend(v16, "cancelAllOperationsWithError:", v4);

  }
}

- (HAPSecuritySession)securitySession
{
  os_unfair_lock_s *p_lock;
  id v4;

  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options(&self->super.super._lock, 0);
  v4 = *(id *)&self->_featureFlags;
  os_unfair_lock_unlock(p_lock);
  return (HAPSecuritySession *)v4;
}

- (void)setSecuritySession:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  os_unfair_lock_lock_with_options(&self->super.super._lock, 0);
  v5 = *(void **)&self->_featureFlags;
  *(_QWORD *)&self->_featureFlags = v4;

  os_unfair_lock_unlock(&self->super.super._lock);
}

- (BOOL)isSecuritySessionOpen
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 securitySession](self, "securitySession"));
  v3 = objc_msgSend(v2, "isOpen");

  return v3;
}

- (void)setSecuritySessionOpen:(BOOL)a3
{
  NSString *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ is unavailable"), v4));
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v5, 0));

  objc_exception_throw(v6);
}

- (void)_establishSecureSession
{
  void *v3;
  _HAPAccessoryServerBTLE200 *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned int v13;
  _HAPAccessoryServerBTLE200 *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  __CFString *v18;
  void *v19;
  HAPSecuritySession *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  const __CFString *v24;

  if (-[HAPAccessoryServerBTLE isPaired](self, "isPaired"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 securitySession](self, "securitySession"));
    if (objc_msgSend(v3, "isOpen"))
    {

    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 securitySession](self, "securitySession"));
      v13 = objc_msgSend(v12, "isOpening");

      if (!v13)
      {
        v20 = -[HAPSecuritySession initWithRole:resumeSessionID:enhancedEncryption:delegate:]([HAPSecuritySession alloc], "initWithRole:resumeSessionID:enhancedEncryption:delegate:", 0, -[HAPAccessoryServerBTLE resumeSessionID](self, "resumeSessionID"), self->_badPairSetupCode, self);
        -[_HAPAccessoryServerBTLE200 setSecuritySession:](self, "setSecuritySession:", v20);
        -[HAPSecuritySession open](v20, "open");

        return;
      }
    }
    v14 = self;
    v16 = sub_10007CCE4((uint64_t)v14, v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = sub_10007CD2C(v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      *(_DWORD *)buf = 138543362;
      v22 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%{public}@A security session is already established.", buf, 0xCu);

    }
  }
  else
  {
    v4 = self;
    v6 = sub_10007CCE4((uint64_t)v4, v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = sub_10007CD2C(v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      *(_DWORD *)buf = 138543618;
      v22 = v9;
      v23 = 2112;
      v24 = CFSTR("Unable to establish a secure session because the accessory isn't paired.");
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    v10 = objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 3, CFSTR("Unable to establish a secure session because the accessory isn't paired."), 0, 0, 0));
    if (v10)
    {
      v11 = (void *)v10;
      -[_HAPAccessoryServerBTLE200 disconnectWithCompletionHandler:disconnectionError:](v4, "disconnectWithCompletionHandler:disconnectionError:", 0, v10);

    }
  }
}

- (void)_handleSecuritySessionSetupExchangeData:(id)a3
{
  id v4;
  void *v5;
  _HAPAccessoryServerBTLE200 *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location[3];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 pairVerifyCharacteristic](self, "pairVerifyCharacteristic"));
  if (v5)
  {
    objc_initWeak(location, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000699C0;
    v14[3] = &unk_100237A80;
    objc_copyWeak(&v16, location);
    v15 = v5;
    -[_HAPAccessoryServerBTLE200 _writeValue:toCharacteristic:authorizationData:contextData:options:completionHandler:](self, "_writeValue:toCharacteristic:authorizationData:contextData:options:completionHandler:", v4, v15, 0, 0, 18, v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak(location);
  }
  else
  {
    v6 = self;
    v8 = sub_10007CCE4((uint64_t)v6, v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = sub_10007CD2C(v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@Security session setup exchange failed, missing the Pair Verify characteristic", (uint8_t *)location, 0xCu);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 9, CFSTR("Security session setup exchange failed."), CFSTR("Missing Pair Verify characteristic."), 0, 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 securitySession](v6, "securitySession"));
    objc_msgSend(v13, "receivedSetupExchangeData:error:", 0, v12);

  }
}

- (HAPCharacteristic)pairVerifyCharacteristic
{
  HAPCharacteristic **p_pairSetupCharacteristic;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  p_pairSetupCharacteristic = &self->_pairSetupCharacteristic;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pairSetupCharacteristic);

  if (!WeakRetained)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer primaryAccessory](self, "primaryAccessory"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "servicesOfType:", CFSTR("00000010-0000-1000-8000-4D69736D6574")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "characteristicsOfType:", CFSTR("00000012-0000-1000-8000-4D69736D6574")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    objc_storeWeak((id *)p_pairSetupCharacteristic, v9);

  }
  return (HAPCharacteristic *)objc_loadWeakRetained((id *)p_pairSetupCharacteristic);
}

- (id)protocolInfoServiceSignatureCharacteristics
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer primaryAccessory](self, "primaryAccessory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "servicesOfType:", CFSTR("000000A2-0000-1000-8000-4D69736D6574")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "characteristicsOfType:", CFSTR("000000A5-0000-1000-8000-4D69736D6574")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  return v6;
}

- (id)_encryptDataAndGenerateAuthTag:(id)a3 error:(id *)a4
{
  id v6;
  _HAPAccessoryServerBTLE200 *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  id v23;

  v6 = a3;
  v7 = self;
  v9 = sub_10007CCE4((uint64_t)v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = sub_10007CD2C(v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v20 = 138543618;
    v21 = v12;
    v22 = 2112;
    v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}@Encrypting plaintext data: %@", (uint8_t *)&v20, 0x16u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 securitySession](v7, "securitySession"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 securitySession](v7, "securitySession"));
LABEL_7:
    v17 = v14;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "encryptData:additionalAuthenticatedData:error:", v6, 0, a4));

    goto LABEL_8;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 pairSetupSession](v7, "pairSetupSession"));
  v16 = objc_msgSend(v15, "isSecureSession");

  if (v16)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 pairSetupSession](v7, "pairSetupSession"));
    goto LABEL_7;
  }
  v18 = 0;
  if (a4)
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 3, CFSTR("Missing security session."), 0, 0, 0));
LABEL_8:

  return v18;
}

- (id)_decryptData:(id)a3 error:(id *)a4
{
  id v6;
  _HAPAccessoryServerBTLE200 *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  id v23;

  v6 = a3;
  v7 = self;
  v9 = sub_10007CCE4((uint64_t)v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = sub_10007CD2C(v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v20 = 138543618;
    v21 = v12;
    v22 = 2048;
    v23 = objc_msgSend(v6, "length");
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}@Decrypting data with length %lu", (uint8_t *)&v20, 0x16u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 securitySession](v7, "securitySession"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 securitySession](v7, "securitySession"));
LABEL_7:
    v17 = v14;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "decryptData:additionalAuthenticatedData:error:", v6, 0, a4));

    goto LABEL_8;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 pairSetupSession](v7, "pairSetupSession"));
  v16 = objc_msgSend(v15, "isSecureSession");

  if (v16)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 pairSetupSession](v7, "pairSetupSession"));
    goto LABEL_7;
  }
  v18 = 0;
  if (a4)
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 3, CFSTR("Missing security session."), 0, 0, 0));
LABEL_8:

  return v18;
}

- (void)connectWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006A138;
  v7[3] = &unk_1002369C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_cancelConnectionWithError:(id)a3
{
  id v4;
  void *v5;
  _HAPAccessoryServerBTLE200 *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  _HAPAccessoryServerBTLE200 *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;

  v4 = a3;
  v5 = v4;
  if ((id)-[_HAPAccessoryServerBTLE200 connectionState](self, "connectionState") == (id)1)
  {
    v6 = self;
    v8 = sub_10007CCE4((uint64_t)v6, v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = sub_10007CD2C(v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      *(_DWORD *)buf = 138543618;
      v26 = v11;
      v27 = 2112;
      v28 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%{public}@Cancelling connection with error: %@", buf, 0x16u);

    }
    v5 = v4;
    if (!v4)
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 2, CFSTR("Connection failed."), CFSTR("Connection was cancelled."), 0, 0));
    v12 = objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 connectionCompletionHandler](v6, "connectionCompletionHandler"));
    v13 = (void *)v12;
    if (v12)
      (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v5);
    -[_HAPAccessoryServerBTLE200 setConnectionCompletionHandler:](v6, "setConnectionCompletionHandler:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 discoveryContext](v6, "discoveryContext"));

    if (v14)
      -[_HAPAccessoryServerBTLE200 _cancelDiscoveryWithError:](v6, "_cancelDiscoveryWithError:", v5);
    if (-[_HAPAccessoryServerBTLE200 isPairing](v6, "isPairing"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
      v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

      if (!v16)
        v16 = v5;
      v19 = _NSConcreteStackBlock;
      v20 = 3221225472;
      v21 = sub_10006A874;
      v22 = &unk_100236AD0;
      v23 = v6;
      v24 = v16;
      v17 = v16;
      sub_10006A874((uint64_t)&v19);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServerBTLE browser](v6, "browser", v19, v20, v21, v22, v23));
    objc_msgSend(v18, "disconnectFromBTLEAccessoryServer:", v6);

  }
}

- (void)disconnectWithCompletionHandler:(id)a3
{
  -[_HAPAccessoryServerBTLE200 disconnectWithCompletionHandler:disconnectionError:](self, "disconnectWithCompletionHandler:disconnectionError:", a3, 0);
}

- (void)disconnectWithCompletionHandler:(id)a3 disconnectionError:(id)a4
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
  v8 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006AA4C;
  block[3] = &unk_100237AD0;
  v12 = v7;
  v13 = v6;
  block[4] = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)updateConnectionIdleTime:(unsigned __int8)a3
{
  NSObject *v5;
  _QWORD v6[5];
  unsigned __int8 v7;

  v5 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10006AE5C;
  v6[3] = &unk_100236C08;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

- (void)_updateConnectionIdleTime:(unsigned __int8)a3
{
  int v3;
  double v5;

  v3 = a3;
  -[HAPAccessoryServerBTLE setConnectionIdleTime:](self, "setConnectionIdleTime:");
  v5 = 5.0;
  if (v3 == 1)
    v5 = 2.0;
  if (v3 == 2)
    v5 = 15.0;
  -[_HAPAccessoryServerBTLE200 _restartConnectionIdleTimer:](self, "_restartConnectionIdleTimer:", v5);
}

- (void)_restartConnectionIdleTimer:(double)a3
{
  _HAPAccessoryServerBTLE200 *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  double v19;

  -[_HAPAccessoryServerBTLE200 _suspendConnectionIdleTimer](self, "_suspendConnectionIdleTimer");
  v5 = self;
  v7 = sub_10007CCE4((uint64_t)v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = sub_10007CD2C(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v16 = 138543618;
    v17 = v10;
    v18 = 2048;
    v19 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}@Updating connectionIdle time to: %f", (uint8_t *)&v16, 0x16u);

  }
  v11 = objc_msgSend(objc_alloc((Class)HMFTimer), "initWithTimeInterval:options:", 0, a3);
  -[_HAPAccessoryServerBTLE200 setConnectionIdleTimer:](v5, "setConnectionIdleTimer:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 connectionIdleTimer](v5, "connectionIdleTimer"));
  objc_msgSend(v12, "setDelegate:", v5);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 connectionIdleTimer](v5, "connectionIdleTimer"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](v5, "clientQueue"));
  objc_msgSend(v13, "setDelegateQueue:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 connectionIdleTimer](v5, "connectionIdleTimer"));
  objc_msgSend(v15, "resume");

}

- (void)handleConnectionWithPeripheral:(id)a3 withError:(id)a4
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
  v8 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006B0E4;
  block[3] = &unk_100236EA8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)_handleConnectionWithError:(id)a3
{
  id v4;
  _HAPAccessoryServerBTLE200 *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;

  v4 = a3;
  v5 = self;
  v7 = sub_10007CCE4((uint64_t)v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = sub_10007CD2C(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v15 = 138543618;
    v16 = v10;
    v17 = 2112;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@Connection completed with error: %@", (uint8_t *)&v15, 0x16u);

  }
  if (v4)
  {
    -[_HAPAccessoryServerBTLE200 setConnectionState:](v5, "setConnectionState:", 0);
    -[_HAPAccessoryServerBTLE200 _suspendConnectionIdleTimer](v5, "_suspendConnectionIdleTimer");
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServerBTLE browser](v5, "browser"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServerBTLE peripheral](v5, "peripheral"));
    objc_msgSend(v11, "setConnectionLatency:forPeripheral:", 1, v12);

    -[_HAPAccessoryServerBTLE200 setConnectionState:](v5, "setConnectionState:", 2);
    -[_HAPAccessoryServerBTLE200 _updateConnectionIdleTime:](v5, "_updateConnectionIdleTime:", -[HAPAccessoryServerBTLE connectionIdleTime](v5, "connectionIdleTime"));
    -[_HAPAccessoryServerBTLE200 _kickConnectionIdleTimer](v5, "_kickConnectionIdleTimer");
    -[HAPAccessoryServerBTLE incrementHAPBTLEMetricsConnectionCount](v5, "incrementHAPBTLEMetricsConnectionCount");
  }
  v13 = objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 connectionCompletionHandler](v5, "connectionCompletionHandler"));
  v14 = (void *)v13;
  if (v13)
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v4);
  -[_HAPAccessoryServerBTLE200 setConnectionCompletionHandler:](v5, "setConnectionCompletionHandler:", 0);

}

- (void)handleDisconnectionWithError:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _HAPAccessoryServerBTLE200 *v18;
  id v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer connectionStartTime](self, "connectionStartTime"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer connectionStartTime](self, "connectionStartTime"));
    objc_msgSend(v9, "timeIntervalSinceDate:", v10);
    v12 = v11;

  }
  else
  {
    v12 = 0;
  }

  -[HAPAccessoryServer setConnectionStartTime:](self, "setConnectionStartTime:", 0);
  v13 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10006B414;
  v16[3] = &unk_100237AF8;
  v17 = v6;
  v18 = self;
  v20 = v12;
  v19 = v7;
  v14 = v7;
  v15 = v6;
  dispatch_async(v13, v16);

}

- (BOOL)_shouldResumeConnectionIdletimer
{
  if (-[HAPAccessoryServerBTLE connectReason](self, "connectReason") == 8)
    return 0;
  else
    return !-[_HAPAccessoryServerBTLE200 waitingForAuth](self, "waitingForAuth");
}

- (void)_kickConnectionIdleTimer
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 connectionIdleTimer](self, "connectionIdleTimer"));
  objc_msgSend(v2, "kick");

}

- (void)_resumeConnectionIdleTimer
{
  _HAPAccessoryServerBTLE200 *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  if (-[_HAPAccessoryServerBTLE200 _shouldResumeConnectionIdletimer](self, "_shouldResumeConnectionIdletimer"))
  {
    v3 = self;
    v5 = sub_10007CCE4((uint64_t)v3, v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = sub_10007CD2C(v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v10 = 138543362;
      v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}@Resuming the connection idle timer...", (uint8_t *)&v10, 0xCu);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 connectionIdleTimer](v3, "connectionIdleTimer"));
    objc_msgSend(v9, "resume");

  }
}

- (void)_suspendConnectionIdleTimer
{
  _HAPAccessoryServerBTLE200 *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v2 = self;
  v4 = sub_10007CCE4((uint64_t)v2, v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = sub_10007CD2C(v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v9 = 138543362;
    v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%{public}@Suspending the connection idle timer...", (uint8_t *)&v9, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 connectionIdleTimer](v2, "connectionIdleTimer"));
  objc_msgSend(v8, "suspend");

}

- (void)_handleConnectionIdleTimeout
{
  void *v3;
  int64_t v4;
  _HAPAccessoryServerBTLE200 *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 24, 0));
  if (-[_HAPAccessoryServerBTLE200 isPairing](self, "isPairing"))
    -[_HAPAccessoryServerBTLE200 setPairingDisconnectionError:](self, "setPairingDisconnectionError:", v3);
  v4 = -[_HAPAccessoryServerBTLE200 connectionState](self, "connectionState");
  v5 = self;
  v7 = sub_10007CCE4((uint64_t)v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v4 == 1)
  {
    if (v9)
    {
      v10 = sub_10007CD2C(v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServerBTLE peripheral](v5, "peripheral"));
      v16 = 138543618;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@The connection idle timer fired, cancelling connection to the peripheral: %@", (uint8_t *)&v16, 0x16u);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 8, CFSTR("Connection Failed"), CFSTR("Connection request timed out"), 0, v3));
    -[_HAPAccessoryServerBTLE200 _cancelConnectionWithError:](v5, "_cancelConnectionWithError:", v13);

  }
  else
  {
    if (v9)
    {
      v14 = sub_10007CD2C(v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = 138543362;
      v17 = v15;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@The connection idle timer fired, disconnecting from peripheral", (uint8_t *)&v16, 0xCu);

    }
    -[_HAPAccessoryServerBTLE200 disconnectWithCompletionHandler:disconnectionError:](v5, "disconnectWithCompletionHandler:disconnectionError:", 0, v3);
  }

}

- (BOOL)isBLELinkConnected
{
  return (id)-[_HAPAccessoryServerBTLE200 connectionState](self, "connectionState") == (id)2;
}

- (void)generateBroadcastKey:(unsigned __int8)a3 queue:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unsigned __int8 v16;

  v8 = a4;
  v9 = a5;
  v10 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10006BD78;
  v13[3] = &unk_100237B48;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)_generateBroadcastKey:(unsigned __int8)a3 queue:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  char v16;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 _getProtocolInfoService](self, "_getProtocolInfoService"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10006C2F8;
  v13[3] = &unk_100237B98;
  v16 = v6;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  -[_HAPAccessoryServerBTLE200 _configureBroadcastKeyGeneration:service:withCompletion:](self, "_configureBroadcastKeyGeneration:service:withCompletion:", v6, v10, v13);

}

- (BOOL)_validateGeneratedBroadcastKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  BOOL v15;
  _HAPAccessoryServerBTLE200 *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  __CFString *v20;
  void *v21;
  _HAPAccessoryServerBTLE200 *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer keyStore](self, "keyStore"));
    v33 = 0;
    v34 = 0;
    v32 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer identifier](self, "identifier"));
    v31 = 0;
    v7 = objc_msgSend(v5, "getControllerPublicKey:secretKey:username:allowCreation:forAccessory:error:", &v34, &v33, &v32, 0, v6, &v31);
    v8 = v34;
    v9 = v33;
    v10 = v32;
    v11 = v31;

    if (v7)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 securitySession](self, "securitySession"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "broadcastKey"));
      v14 = objc_msgSend(v13, "isEqualToData:", v4);

      if ((v14 & 1) != 0)
      {
        v15 = 1;
LABEL_12:

        goto LABEL_13;
      }
      v16 = self;
      v18 = sub_10007CCE4((uint64_t)v16, v17);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = sub_10007CD2C(v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        *(_DWORD *)buf = 138543362;
        v36 = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}@Generated Broadcast key does not match", buf, 0xCu);

      }
    }
    v22 = self;
    v24 = sub_10007CCE4((uint64_t)v22, v23);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      v26 = sub_10007CD2C(v22);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 securitySession](v22, "securitySession"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "broadcastKey"));
      *(_DWORD *)buf = 138544642;
      v36 = v27;
      v37 = 2112;
      v38 = v8;
      v39 = 2112;
      v40 = v10;
      v41 = 2112;
      v42 = v29;
      v43 = 2112;
      v44 = v4;
      v45 = 2112;
      v46 = v11;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "%{public}@Controller Public Key: %@, Controller Identifier: %@, \n\tGenerated Broadcast Key: %@, \n\tAccessory Broadcast Key: %@. Error: %@", buf, 0x3Eu);

    }
    v15 = 0;
    goto LABEL_12;
  }
  v15 = 0;
LABEL_13:

  return v15;
}

- (void)_notifyDelegateOfReceivedEncryptedAuthenticatedData:(id)a3 forCharacteristic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer delegate](self, "delegate"));
  if ((objc_msgSend(v8, "conformsToProtocol:", &OBJC_PROTOCOL___HAPAccessoryServerDelegatePrivate) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer delegate](self, "delegate"));
    v10 = objc_opt_respondsToSelector(v9, "accessoryServerBTLE:didReceiveEncryptedAndAuthenticatedPayload:forCharacteristic:");

    if ((v10 & 1) != 0)
    {
      v11 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer delegateQueue](self, "delegateQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10006CB2C;
      block[3] = &unk_100236EA8;
      block[4] = self;
      v13 = v6;
      v14 = v7;
      dispatch_async(v11, block);

    }
  }
  else
  {

  }
}

- (void)_notifyDelegateOfReceivedPlaintextData:(id)a3 forCharacteristic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer delegate](self, "delegate"));
  if (objc_msgSend(v8, "conformsToProtocol:", &OBJC_PROTOCOL___HAPAccessoryServerDelegatePrivate))
  {
    v9 = -[_HAPAccessoryServerBTLE200 _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", "accessoryServerBTLE:didReceivePlaintextPayload:forCharacteristic:");

    if (v9)
    {
      v10 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer delegateQueue](self, "delegateQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10006CC74;
      block[3] = &unk_100236EA8;
      block[4] = self;
      v12 = v6;
      v13 = v7;
      dispatch_async(v10, block);

    }
  }
  else
  {

  }
}

- (void)_notifyDelegateOfSentEncryptedAuthenticatedData:(id)a3 forCharacteristic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer delegate](self, "delegate"));
  if (objc_msgSend(v8, "conformsToProtocol:", &OBJC_PROTOCOL___HAPAccessoryServerDelegatePrivate))
  {
    v9 = -[_HAPAccessoryServerBTLE200 _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", "accessoryServerBTLE:willSendEncryptedAndAuthenticatedPayload:forCharacteristic:");

    if (v9)
    {
      v10 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer delegateQueue](self, "delegateQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10006CDBC;
      block[3] = &unk_100236EA8;
      block[4] = self;
      v12 = v6;
      v13 = v7;
      dispatch_async(v10, block);

    }
  }
  else
  {

  }
}

- (void)_notifyDelegateOfSentPlaintextData:(id)a3 forCharacteristic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer delegate](self, "delegate"));
  if (objc_msgSend(v8, "conformsToProtocol:", &OBJC_PROTOCOL___HAPAccessoryServerDelegatePrivate))
  {
    v9 = -[_HAPAccessoryServerBTLE200 _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", "accessoryServerBTLE:willSendPlaintextPayload:forCharacteristic:");

    if (v9)
    {
      v10 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer delegateQueue](self, "delegateQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10006CF04;
      block[3] = &unk_100236EA8;
      block[4] = self;
      v12 = v6;
      v13 = v7;
      dispatch_async(v10, block);

    }
  }
  else
  {

  }
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _HAPAccessoryServerBTLE200 *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  __CFString *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _HAPAccessoryServerBTLE200 *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "services"));
  v9 = objc_msgSend(v8, "copy");

  v10 = self;
  v12 = sub_10007CCE4((uint64_t)v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = sub_10007CD2C(v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    *(_DWORD *)buf = 138543618;
    v26 = v15;
    v27 = 2112;
    v28 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%{public}@Discovered CB services: %@", buf, 0x16u);

  }
  v16 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](v10, "clientQueue"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10006D0E4;
  v20[3] = &unk_100237BC0;
  v21 = v6;
  v22 = v10;
  v23 = v9;
  v24 = v7;
  v17 = v7;
  v18 = v9;
  v19 = v6;
  dispatch_async(v16, v20);

}

- (void)peripheral:(id)a3 didModifyServices:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  _HAPAccessoryServerBTLE200 *v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006D1E0;
  block[3] = &unk_100236EA8;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _HAPAccessoryServerBTLE200 *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10006D560;
  v15[3] = &unk_100237BC0;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)peripheral:(id)a3 didDiscoverDescriptorsForCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _HAPAccessoryServerBTLE200 *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10006D684;
  v15[3] = &unk_100237BC0;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)peripheral:(id)a3 didUpdateValueForDescriptor:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _HAPAccessoryServerBTLE200 *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10006D7A8;
  v15[3] = &unk_100237BC0;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _HAPAccessoryServerBTLE200 *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10006D8CC;
  v15[3] = &unk_100237BC0;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _HAPAccessoryServerBTLE200 *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10006D9F0;
  v15[3] = &unk_100237BC0;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _HAPAccessoryServerBTLE200 *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10006DD14;
  v15[3] = &unk_100237BC0;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)controlOutputStream:(id)a3 didReceiveRequestToSendControlPacket:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10006DF98;
  v15[3] = &unk_100237208;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)controlOutputStream:(id)a3 didCloseWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10006E254;
  v11[3] = &unk_100236AD0;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

}

- (void)controlOutputStreamDidComplete:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006E338;
  block[3] = &unk_100236AA8;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

- (void)pairSetupSession:(id)a3 didReceiveSetupExchangeData:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  _HAPAccessoryServerBTLE200 *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006E448;
  block[3] = &unk_100236EA8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (id)pairSetupSession:(id)a3 didReceiveLocalPairingIdentityRequestWithError:(id *)a4
{
  _HAPAccessoryServerBTLE200 *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v16;
  int v17;
  void *v18;

  v5 = self;
  v7 = sub_10007CCE4((uint64_t)v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = sub_10007CD2C(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v17 = 138543362;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@Request for local pairing identity", (uint8_t *)&v17, 0xCu);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer pairingRequest](v5, "pairingRequest"));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pairingIdentity"));
  if (v12)
  {
    v13 = (void *)v12;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer keyBag](v5, "keyBag"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentIdentity"));

    if (v13)
      return v13;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer keyStore](v5, "keyStore"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer identifier](v5, "identifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "readControllerPairingKeyForAccessory:error:", v16, a4));

  }
  return v13;
}

- (BOOL)pairSetupSession:(id)a3 didPairWithPeer:(id)a4 error:(id *)a5
{
  id v7;
  _HAPAccessoryServerBTLE200 *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  id v22;
  unsigned __int8 v23;
  id v24;
  _HAPAccessoryServerBTLE200 *v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  __CFString *v29;
  void *v30;
  _HAPAccessoryServerBTLE200 *v31;
  uint64_t v32;
  id v33;
  NSObject *v34;
  __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  _HAPAccessoryServerBTLE200 *v39;
  uint64_t v40;
  id v41;
  NSObject *v42;
  __CFString *v43;
  void *v44;
  id v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;

  v7 = a4;
  v8 = self;
  v10 = sub_10007CCE4((uint64_t)v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = sub_10007CD2C(v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    *(_DWORD *)buf = 138543618;
    v49 = v13;
    v50 = 2112;
    v51 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{public}@Request to save pairing peer: %@", buf, 0x16u);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer identifier](v8, "identifier"));
  v16 = objc_msgSend(v14, "isEqualToString:", v15);

  if ((v16 & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "publicKey"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "data"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer keyStore](v8, "keyStore"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    v47 = 0;
    v21 = objc_msgSend(v19, "savePublicKey:forAccessoryName:error:", v18, v20, &v47);
    v22 = v47;

    if ((v21 & 1) != 0)
    {
      -[HAPAccessoryServer associateAccessoryWithControllerKeyUsingAccessoryPublicKey:](v8, "associateAccessoryWithControllerKeyUsingAccessoryPublicKey:", v18);
      v46 = 0;
      v23 = -[HAPAccessoryServerBTLE updatePeripheralIdentifier:isPairing:](v8, "updatePeripheralIdentifier:isPairing:", &v46, 1);
      v24 = v46;
      if ((v23 & 1) == 0)
      {
        v25 = v8;
        v27 = sub_10007CCE4((uint64_t)v25, v26);
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v29 = sub_10007CD2C(v25);
          v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
          *(_DWORD *)buf = 138543618;
          v49 = v30;
          v50 = 2112;
          v51 = v24;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to update the accessory's peripheral identifier with error: %@", buf, 0x16u);

        }
        if (a5)
          *a5 = objc_retainAutorelease(v24);
      }

    }
    else
    {
      v39 = v8;
      v41 = sub_10007CCE4((uint64_t)v39, v40);
      v42 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v43 = sub_10007CD2C(v39);
        v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
        *(_DWORD *)buf = 138543618;
        v49 = v44;
        v50 = 2112;
        v51 = v22;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%{public}@Failed to save accessory's identifier and public key to the keystore with error: %@", buf, 0x16u);

      }
      v23 = 0;
      if (a5)
        *a5 = objc_retainAutorelease(v22);
    }

  }
  else
  {
    v31 = v8;
    v33 = sub_10007CCE4((uint64_t)v31, v32);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = sub_10007CD2C(v31);
      v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer identifier](v31, "identifier"));
      *(_DWORD *)buf = 138543874;
      v49 = v36;
      v50 = 2112;
      v51 = v37;
      v52 = 2112;
      v53 = v38;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%{public}@The peer's identifier exchanged during Pair Setup, %@, does not match the identifier from the accessory's advertisement, %@", buf, 0x20u);

    }
    v23 = 0;
    if (a5)
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 7, CFSTR("Pairing failed."), CFSTR("The peer's identifier does not match it's advertised identifier"), 0, 0));
  }

  return v23;
}

- (void)pairSetupSession:(id)a3 didStopWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  _HAPAccessoryServerBTLE200 *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006EB64;
  block[3] = &unk_100236EA8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)pairSetupSession:(id)a3 didReceiveProductData:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  _HAPAccessoryServerBTLE200 *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006EC74;
  block[3] = &unk_100236EA8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)pairSetupSession:(id)a3 didReceiveSetupCodeRequestWithCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  _HAPAccessoryServerBTLE200 *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006ED84;
  block[3] = &unk_100236B98;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)pairSetupSessionDidReceiveInvalidSetupCode:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _HAPAccessoryServerBTLE200 *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006EF0C;
  v7[3] = &unk_100236AD0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (BOOL)pairSetupSession:(id)a3 didReceiveBackoffRequestWithTimeInterval:(double)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v11;
  _HAPAccessoryServerBTLE200 *v12;
  double v13;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006F0B8;
  block[3] = &unk_1002377D8;
  v11 = v6;
  v12 = self;
  v13 = a4;
  v8 = v6;
  dispatch_async(v7, block);

  return 0;
}

- (void)getAccessoryInfo:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;
  _QWORD *v9;
  _QWORD v10[3];
  char v11;

  v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006F2A0;
  block[3] = &unk_100237C10;
  v8 = v4;
  v9 = v10;
  block[4] = self;
  v6 = v4;
  dispatch_async(v5, block);

  _Block_object_dispose(v10, 8);
}

- (BOOL)_validateProtocolInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  BOOL v14;
  _HAPAccessoryServerBTLE200 *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  int v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  unint64_t v35;
  __int16 v36;
  void *v37;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceIdentifer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer identifier](self, "identifier"));
  if (!objc_msgSend(v5, "isEqualToString:", v6))
    goto LABEL_7;
  v7 = objc_msgSend(v4, "categoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer category](self, "category"));
  if (v7 != objc_msgSend(v8, "unsignedShortValue")
    || (v9 = objc_msgSend(v4, "featureFlags"),
        v9 != -[_HAPAccessoryServerBTLE200 featureFlags](self, "featureFlags")))
  {

LABEL_7:
    goto LABEL_8;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "protocolVersion"));
  v11 = objc_msgSend(v10, "majorVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer version](self, "version"));
  v13 = objc_msgSend(v12, "majorVersion");

  if (v11 == v13)
  {
    v14 = 1;
    goto LABEL_11;
  }
LABEL_8:
  v15 = self;
  v17 = sub_10007CCE4((uint64_t)v15, v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v19 = sub_10007CD2C(v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer identifier](v15, "identifier"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer category](v15, "category"));
    v23 = -[HAPAccessoryServer authMethod](v15, "authMethod");
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer version](v15, "version"));
    v26 = 138544642;
    v27 = v20;
    v28 = 2112;
    v29 = v4;
    v30 = 2112;
    v31 = v21;
    v32 = 2112;
    v33 = v22;
    v34 = 2048;
    v35 = v23;
    v36 = 2112;
    v37 = v24;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%{public}@Authenticated Info %@ does not match: identifier: %@, category: %@, authMethods: %tu version: %@", (uint8_t *)&v26, 0x3Eu);

  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (void)authenticateAccessory
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006F888;
  block[3] = &unk_100236AA8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)continueAuthAfterValidation:(BOOL)a3
{
  _HAPAccessoryServerBTLE200 *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  BOOL v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;

  v4 = self;
  v6 = sub_10007CCE4((uint64_t)v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = sub_10007CD2C(v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = sub_100020918(-[HAPAccessoryServer authMethod](v4, "authMethod"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    *(_DWORD *)buf = 138543618;
    v16 = v9;
    v17 = 2112;
    v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}@Current Auth Method %@", buf, 0x16u);

  }
  v12 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](v4, "clientQueue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10006FA04;
  v13[3] = &unk_100236C08;
  v13[4] = v4;
  v14 = a3;
  dispatch_async(v12, v13);

}

- (void)provisionToken:(id)a3
{
  id v4;
  _HAPAccessoryServerBTLE200 *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;

  v4 = a3;
  v5 = self;
  v7 = sub_10007CCE4((uint64_t)v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = sub_10007CD2C(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    *(_DWORD *)buf = 138543618;
    v16 = v10;
    v17 = 2112;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}@Provisioning Tokens T1: %@", buf, 0x16u);

  }
  v11 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](v5, "clientQueue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10006FD78;
  v13[3] = &unk_100236AD0;
  v13[4] = v5;
  v14 = v4;
  v12 = v4;
  dispatch_async(v11, v13);

}

- (void)tearDownSessionOnAuthCompletion
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006FE24;
  block[3] = &unk_100236AA8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_continuePairingAfterMFiCertValidation
{
  -[_HAPAccessoryServerBTLE200 tearDownSessionOnAuthCompletion](self, "tearDownSessionOnAuthCompletion");
  -[_HAPAccessoryServerBTLE200 setPairing:](self, "setPairing:", 0);
  -[_HAPAccessoryServerBTLE200 setBadPairSetupCode:](self, "setBadPairSetupCode:", 0);
  -[_HAPAccessoryServerBTLE200 setPairSetupBackoffTimeInterval:](self, "setPairSetupBackoffTimeInterval:", 0.0);
  -[_HAPAccessoryServerBTLE200 setPairSetupSession:](self, "setPairSetupSession:", 0);
  -[_HAPAccessoryServerBTLE200 _notifyDelegatesPairingStopped:](self, "_notifyDelegatesPairingStopped:", 0);
}

- (void)_notifyDelegatesPairingStopped:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  _HAPAccessoryServerBTLE200 *v8;

  v4 = a3;
  if (-[_HAPAccessoryServerBTLE200 _delegateRespondsToSelector:](self, "_delegateRespondsToSelector:", "accessoryServer:didStopPairingWithError:"))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer delegateQueue](self, "delegateQueue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10006FFD8;
    v6[3] = &unk_100236AD0;
    v7 = v4;
    v8 = self;
    dispatch_async(v5, v6);

  }
}

- (void)authSession:(id)a3 sendAuthExchangeData:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  v6 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100070188;
  v8[3] = &unk_100236AD0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)authSession:(id)a3 validateUUID:(id)a4 token:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10007067C;
  v15[3] = &unk_100237BC0;
  v15[4] = self;
  v16 = v9;
  v17 = v10;
  v18 = v8;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_async(v11, v15);

}

- (void)authSession:(id)a3 authenticateUUID:(id)a4 token:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000709B0;
  v15[3] = &unk_100237BC0;
  v15[4] = self;
  v16 = v9;
  v17 = v10;
  v18 = v8;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_async(v11, v15);

}

- (void)authSession:(id)a3 confirmUUID:(id)a4 token:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100070C88;
  v15[3] = &unk_100237BC0;
  v15[4] = self;
  v16 = v9;
  v17 = v10;
  v18 = v8;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_async(v11, v15);

}

- (void)authSession:(id)a3 authComplete:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  v6 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100070F14;
  v8[3] = &unk_100236AD0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)submitPairVerifyMetricWithError:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer metric_pairVerifyReason](self, "metric_pairVerifyReason"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 securitySession](self, "securitySession"));
    v8 = objc_msgSend(v7, "sessionStartTime");

    if (v8)
    {
      v9 = mach_absolute_time();
      v10 = UpTicksToMilliseconds(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 securitySession](self, "securitySession"));
      -[HAPAccessoryServer setMetric_pairVerifyDurationInMS:](self, "setMetric_pairVerifyDurationInMS:", v10 - (_QWORD)objc_msgSend(v11, "sessionStartTime"));

      v12.receiver = self;
      v12.super_class = (Class)_HAPAccessoryServerBTLE200;
      -[HAPAccessoryServer submitPairVerifyMetricWithError:](&v12, "submitPairVerifyMetricWithError:", v4);
    }
  }

}

- (id)securitySession:(id)a3 didReceiveLocalPairingIdentityRequestWithError:(id *)a4
{
  _HAPAccessoryServerBTLE200 *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  int v12;
  void *v13;

  v5 = self;
  v7 = sub_10007CCE4((uint64_t)v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = sub_10007CD2C(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v12 = 138543362;
    v13 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}@Request for local pairing identity", (uint8_t *)&v12, 0xCu);

  }
  return (id)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 getLocalPairingIdentityWithError:](v5, "getLocalPairingIdentityWithError:", a4));
}

- (id)securitySession:(id)a3 didReceiveRequestForPeerPairingIdentityWithIdentifier:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  id v12;
  _HAPAccessoryServerBTLE200 *v13;
  HAPPairingIdentity *v14;
  _HAPAccessoryServerBTLE200 *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  __CFString *v19;
  void *v20;
  _HAPAccessoryServerBTLE200 *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  __CFString *v25;
  void *v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  __CFString *v30;
  void *v31;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;

  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer identifier](self, "identifier"));
  v9 = objc_msgSend(v8, "isEqualToString:", v7);

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer keyStore](self, "keyStore"));
    v33 = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "readPublicKeyForAccessoryName:registeredWithHomeKit:error:", v7, 0, &v33));
    v12 = v33;

    if (v11)
    {
      v13 = (_HAPAccessoryServerBTLE200 *)objc_msgSend(objc_alloc((Class)HMFPairingKey), "initWithPairingKeyData:", v11);
      v14 = -[HAPPairingIdentity initWithIdentifier:publicKey:privateKey:permissions:]([HAPPairingIdentity alloc], "initWithIdentifier:publicKey:privateKey:permissions:", v7, v13, 0, 0);
      if (!v14)
      {
        v15 = self;
        v17 = sub_10007CCE4((uint64_t)v15, v16);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          v19 = sub_10007CD2C(v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          *(_DWORD *)buf = 138543874;
          v35 = v20;
          v36 = 2112;
          v37 = v7;
          v38 = 2112;
          v39 = v11;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%{public}@Failed to create pairing identity with identififer, %@, public key, %@", buf, 0x20u);

        }
        if (a5)
          *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 1, CFSTR("Failed to retrieve peer pairing identity."), CFSTR("Failed to create pairing identity"), 0, 0));
      }
    }
    else
    {
      v13 = self;
      v28 = sub_10007CCE4((uint64_t)v13, v27);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = sub_10007CD2C(v13);
        v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
        *(_DWORD *)buf = 138543874;
        v35 = v31;
        v36 = 2112;
        v37 = v7;
        v38 = 2112;
        v39 = v12;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrived public key for accessory with identifier '%@' with error: %@", buf, 0x20u);

      }
      v14 = 0;
    }

  }
  else
  {
    v21 = self;
    v23 = sub_10007CCE4((uint64_t)v21, v22);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v25 = sub_10007CD2C(v21);
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      *(_DWORD *)buf = 138543618;
      v35 = v26;
      v36 = 2112;
      v37 = v7;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "%{public}@Unexpected pairing peer identifier, %@", buf, 0x16u);

    }
    v14 = 0;
    if (a5)
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 16, CFSTR("Insufficient Authorization."), CFSTR("Unexpected pairing peer identifier."), 0, 0));
  }

  return v14;
}

- (void)securitySession:(id)a3 didReceiveSetupExchangeData:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  _HAPAccessoryServerBTLE200 *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100071864;
  block[3] = &unk_100236EA8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)securitySessionIsOpening:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _HAPAccessoryServerBTLE200 *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000719EC;
  v7[3] = &unk_100236AD0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)securitySessionDidOpen:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _HAPAccessoryServerBTLE200 *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100071B6C;
  v7[3] = &unk_100236AD0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (BOOL)_shouldIgnoreRetryDiscoveryError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "underlyingErrors"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  v6 = ((objc_msgSend(v3, "isHAPError") & 1) != 0 || objc_msgSend(v5, "isHAPError"))
    && (objc_msgSend(v3, "code") == (id)27 || objc_msgSend(v5, "code") == (id)27);

  return v6;
}

- (void)securitySession:(id)a3 didCloseWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  _HAPAccessoryServerBTLE200 *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100071E20;
  block[3] = &unk_100236EA8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  _HAPAccessoryServerBTLE200 *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[5];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer clientQueue](self, "clientQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 connectionIdleTimer](self, "connectionIdleTimer"));
  if (v6 == v4)
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100072284;
    v25[3] = &unk_100236AA8;
    v25[4] = self;
    sub_100072284((uint64_t)v25);
    -[_HAPAccessoryServerBTLE200 _handleConnectionIdleTimeout](self, "_handleConnectionIdleTimeout");
  }
  else
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_HAPAccessoryServerBTLE200 pendingRequests](self, "pendingRequests", 0));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "responseTimer"));

          if (v13 == v4)
          {
            v14 = self;
            v16 = sub_10007CCE4((uint64_t)v14, v15);
            v17 = objc_claimAutoreleasedReturnValue(v16);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              v18 = sub_10007CD2C(v14);
              v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
              *(_DWORD *)buf = 138543618;
              v27 = v19;
              v28 = 2112;
              v29 = v12;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%{public}@Cancelling the timed out request: %@", buf, 0x16u);

            }
            v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 24, CFSTR("Request failed."), CFSTR("Request timed out waiting for response."), 0, 0));
            objc_msgSend(v12, "cancelWithError:", v20);

            goto LABEL_14;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_14:

  }
}

- (void)disconnect
{
  _HAPAccessoryServerBTLE200 *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  __CFString *v6;
  void *v7;
  int v8;
  void *v9;

  v2 = self;
  v4 = sub_10007CCE4((uint64_t)v2, v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = sub_10007CD2C(v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = 138543362;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@Disconnecting as a result of direct disconnect call", (uint8_t *)&v8, 0xCu);

  }
  -[_HAPAccessoryServerBTLE200 disconnectWithCompletionHandler:](v2, "disconnectWithCompletionHandler:", 0);
}

+ (id)logCategory
{
  if (qword_1002716B0 != -1)
    dispatch_once(&qword_1002716B0, &stru_100237C58);
  return (id)qword_1002716B8;
}

- (int64_t)connectionState
{
  return (int64_t)self->_securitySession;
}

- (void)setConnectionState:(int64_t)a3
{
  self->_securitySession = (HAPSecuritySession *)a3;
}

- (HAPBLEAccessoryCache)accessoryCache
{
  return (HAPBLEAccessoryCache *)self->_connectionState;
}

- (void)setAccessoryCache:(id)a3
{
  objc_storeStrong((id *)&self->_connectionState, a3);
}

- (id)connectionCompletionHandler
{
  return self->_accessoryCache;
}

- (void)setConnectionCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (HMFTimer)connectionIdleTimer
{
  return (HMFTimer *)self->_connectionCompletionHandler;
}

- (void)setConnectionIdleTimer:(id)a3
{
  objc_storeStrong(&self->_connectionCompletionHandler, a3);
}

- (_HAPBTLEDiscoveryContext)discoveryContext
{
  return (_HAPBTLEDiscoveryContext *)self->_connectionIdleTimer;
}

- (void)setDiscoveryContext:(id)a3
{
  objc_storeStrong((id *)&self->_connectionIdleTimer, a3);
}

- (int64_t)discoveryRetries
{
  return (int64_t)self->_discoveryContext;
}

- (void)setDiscoveryRetries:(int64_t)a3
{
  self->_discoveryContext = (_HAPBTLEDiscoveryContext *)a3;
}

- (BOOL)isVerified
{
  return BYTE6(self->super._blePeripheral);
}

- (void)setVerified:(BOOL)a3
{
  BYTE6(self->super._blePeripheral) = a3;
}

- (void)setIdentifyCharacteristic:(id)a3
{
  objc_storeWeak((id *)&self->_discoveryRetries, a3);
}

- (HAPPairSetupSession)pairSetupSession
{
  return (HAPPairSetupSession *)objc_loadWeakRetained((id *)&self->_identifyCharacteristic);
}

- (void)setPairSetupSession:(id)a3
{
  objc_storeWeak((id *)&self->_identifyCharacteristic, a3);
}

- (double)pairSetupBackoffTimeInterval
{
  return *(double *)&self->_pairSetupSession;
}

- (void)setPairSetupBackoffTimeInterval:(double)a3
{
  *(double *)&self->_pairSetupSession = a3;
}

- (BOOL)isBadSetupCode
{
  return HIBYTE(self->super._blePeripheral);
}

- (void)setBadPairSetupCode:(BOOL)a3
{
  HIBYTE(self->super._blePeripheral) = a3;
}

- (id)setupCodeCompletionHandler
{
  return *(id *)&self->_pairSetupBackoffTimeInterval;
}

- (void)setSetupCodeCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (BOOL)isPairing
{
  return self->_hasValidCache;
}

- (void)setPairing:(BOOL)a3
{
  self->_hasValidCache = a3;
}

- (NSError)pairingDisconnectionError
{
  return (NSError *)self->_setupCodeCompletionHandler;
}

- (void)setPairingDisconnectionError:(id)a3
{
  objc_storeStrong(&self->_setupCodeCompletionHandler, a3);
}

- (BOOL)authenticated
{
  return self->_hasBeenDiscovered;
}

- (void)setAuthenticated:(BOOL)a3
{
  self->_hasBeenDiscovered = a3;
}

- (BOOL)waitingForAuth
{
  return self->_verified;
}

- (void)setWaitingForAuth:(BOOL)a3
{
  self->_verified = a3;
}

- (BOOL)enhancedEncryption
{
  return self->_badPairSetupCode;
}

- (void)setEnhancedEncryption:(BOOL)a3
{
  self->_badPairSetupCode = a3;
}

- (HAPAuthSession)authSession
{
  return (HAPAuthSession *)self->_pairingDisconnectionError;
}

- (void)setAuthSession:(id)a3
{
  objc_storeStrong((id *)&self->_pairingDisconnectionError, a3);
}

- (HAPAccessoryProtocolInfo)authenticatedProtocolInfo
{
  return (HAPAccessoryProtocolInfo *)self->_authSession;
}

- (void)setAuthenticatedProtocolInfo:(id)a3
{
  objc_storeStrong((id *)&self->_authSession, a3);
}

- (void)setPairingFeaturesCharacteristic:(id)a3
{
  objc_storeWeak((id *)&self->_authenticatedProtocolInfo, a3);
}

- (void)setPairSetupCharacteristic:(id)a3
{
  objc_storeWeak((id *)&self->_pairingFeaturesCharacteristic, a3);
}

- (void)setPairVerifyCharacteristic:(id)a3
{
  objc_storeWeak((id *)&self->_pairSetupCharacteristic, a3);
}

- (NSOperationQueue)pairVerifyOperationQueue
{
  return (NSOperationQueue *)self->_pairVerifyCharacteristic;
}

- (void)setPairingsCharacteristic:(id)a3
{
  objc_storeWeak((id *)&self->_pairVerifyOperationQueue, a3);
}

- (NSMutableArray)pendingRequests
{
  return (NSMutableArray *)self->_pairingsCharacteristic;
}

- (NSOperationQueue)requestOperationQueue
{
  return (NSOperationQueue *)self->_pendingRequests;
}

- (NSMutableArray)pendingResponses
{
  return (NSMutableArray *)self->_requestOperationQueue;
}

- (NSMapTable)characteristicWriteCompletionHandlers
{
  return (NSMapTable *)self->_pendingResponses;
}

- (NSMapTable)characteristicEnableEventCompletionHandlers
{
  return self->_characteristicWriteCompletionHandlers;
}

- (unsigned)featureFlags
{
  return self->_pairing;
}

- (void)setFeatureFlags:(unsigned __int8)a3
{
  self->_pairing = a3;
}

- (NSMutableSet)discoveredAccessoryCharacteriticsPendingRead
{
  return (NSMutableSet *)self->_characteristicEnableEventCompletionHandlers;
}

- (void)setDiscoveredAccessoryCharacteriticsPendingRead:(id)a3
{
  objc_storeStrong((id *)&self->_characteristicEnableEventCompletionHandlers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicEnableEventCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_characteristicWriteCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_pendingResponses, 0);
  objc_storeStrong((id *)&self->_requestOperationQueue, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_pairingsCharacteristic, 0);
  objc_destroyWeak((id *)&self->_pairVerifyOperationQueue);
  objc_storeStrong((id *)&self->_pairVerifyCharacteristic, 0);
  objc_destroyWeak((id *)&self->_pairSetupCharacteristic);
  objc_destroyWeak((id *)&self->_pairingFeaturesCharacteristic);
  objc_destroyWeak((id *)&self->_authenticatedProtocolInfo);
  objc_storeStrong((id *)&self->_authSession, 0);
  objc_storeStrong((id *)&self->_pairingDisconnectionError, 0);
  objc_storeStrong(&self->_setupCodeCompletionHandler, 0);
  objc_storeStrong((id *)&self->_pairSetupBackoffTimeInterval, 0);
  objc_destroyWeak((id *)&self->_identifyCharacteristic);
  objc_destroyWeak((id *)&self->_discoveryRetries);
  objc_storeStrong((id *)&self->_connectionIdleTimer, 0);
  objc_storeStrong(&self->_connectionCompletionHandler, 0);
  objc_storeStrong((id *)&self->_accessoryCache, 0);
  objc_storeStrong((id *)&self->_connectionState, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
}

@end
