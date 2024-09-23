@implementation HAPAccessoryServerBTLE

+ (id)hapUUIDFromBTLEUUID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HAPMetadata getSharedInstance](HAPMetadata, "getSharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "btleToServiceType:", v5));

  v7 = objc_alloc((Class)NSUUID);
  v8 = v7;
  if (v6)
  {
    v9 = objc_msgSend(v7, "initWithUUIDString:", v6);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));
    v9 = objc_msgSend(v8, "initWithUUIDString:", v10);

  }
  return v9;
}

- (HAPAccessoryServerBTLE)initWithPeripheral:(id)a3 name:(id)a4 pairingUsername:(id)a5 statusFlags:(id)a6 stateNumber:(id)a7 enhancedEncryption:(BOOL)a8 connectReason:(unsigned __int8)a9 configNumber:(id)a10 category:(id)a11 setupHash:(id)a12 connectionIdleTime:(unsigned __int8)a13 browser:(id)a14 keyStore:(id)a15 whbStableIdentifier:(id)a16
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  char *v27;
  char *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id obj;
  id v37;
  id v38;
  id v39;
  objc_super v40;

  v20 = a3;
  v38 = a4;
  v39 = a5;
  v21 = a6;
  obj = a7;
  v37 = a7;
  v22 = a10;
  v23 = a11;
  v24 = a12;
  v25 = a14;
  v26 = a16;
  v40.receiver = self;
  v40.super_class = (Class)HAPAccessoryServerBTLE;
  v27 = -[HAPAccessoryServer initWithKeystore:](&v40, "initWithKeystore:", a15);
  v28 = v27;
  if (v27)
  {
    objc_storeWeak((id *)(v27 + 356), v20);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "cbPeripheral"));
    objc_storeWeak((id *)(v28 + 300), v29);

    v30 = objc_msgSend(v38, "copy");
    v31 = (void *)*((_QWORD *)v28 + 1);
    *((_QWORD *)v28 + 1) = v30;

    v32 = objc_msgSend(v39, "copy");
    v33 = (void *)*((_QWORD *)v28 + 2);
    *((_QWORD *)v28 + 2) = v32;

    objc_storeStrong((id *)(v28 + 284), obj);
    v28[282] = 0;
    v28[281] = 0;
    v28[280] = a9;
    v28[283] = a13;
    objc_storeWeak((id *)(v28 + 348), v25);
    objc_storeStrong((id *)(v28 + 292), a16);
    objc_msgSend(v28, "setSetupHash:", v24);
    objc_msgSend(v28, "setHasPairings:", sub_100015F64((char)objc_msgSend(v21, "unsignedCharValue")));
    objc_msgSend(v28, "setCategory:", v23);
    objc_msgSend(v28, "setConfigNumber:", objc_msgSend(v22, "unsignedIntegerValue"));
    objc_msgSend(v28, "updatePeripheralIdentifier:isPairing:", 0, 0);
  }

  return (HAPAccessoryServerBTLE *)v28;
}

- (int64_t)linkType
{
  return 2;
}

- (NSNumber)stateNumber
{
  os_unfair_lock_s *p_lock;
  id v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options(&self->super._lock, 0);
  v4 = *(id *)(&self->_connectionIdleTime + 1);
  os_unfair_lock_unlock(p_lock);
  return (NSNumber *)v4;
}

- (void)setStateNumber:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  HAPAccessoryServerBTLE *v13;

  v5 = a3;
  os_unfair_lock_lock_with_options(&self->super._lock, 0);
  if ((HMFEqualObjects(*(_QWORD *)(&self->_connectionIdleTime + 1), v5) & 1) != 0)
  {
    os_unfair_lock_unlock(&self->super._lock);
  }
  else
  {
    objc_storeStrong((id *)(&self->_connectionIdleTime + 1), a3);
    os_unfair_lock_unlock(&self->super._lock);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer delegate](self, "delegate"));
    v7 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer delegateQueue](self, "delegateQueue"));
    if (v7)
    {
      v8 = (void *)v7;
      v9 = objc_opt_respondsToSelector(v6, "accessoryServerDidUpdateStateNumber:");

      if ((v9 & 1) != 0)
      {
        v10 = objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer delegateQueue](self, "delegateQueue"));
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_10007A8D4;
        v11[3] = &unk_100236AD0;
        v12 = v6;
        v13 = self;
        dispatch_async(v10, v11);

      }
    }

  }
}

- (unsigned)connectReason
{
  HAPAccessoryServerBTLE *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options(&self->super._lock, 0);
  LOBYTE(v2) = v2->_connectReason;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (void)setConnectReason:(unsigned __int8)a3
{
  int v3;
  os_unfair_lock_s *p_lock;

  v3 = a3;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options(&self->super._lock, 0);
  self->_connectReason = v3;
  if (v3)
    ++*(unint64_t *)((char *)&self->_metricHAPBTLEDiscoveryCount + 4);
  os_unfair_lock_unlock(p_lock);
}

- (void)handleConnectionWithPeripheral:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSString *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  v7 = a4;
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v9));
  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v10, 0));

  objc_exception_throw(v11);
}

- (void)handleDisconnectionWithError:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSString *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  v7 = a4;
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v9));
  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v10, 0));

  objc_exception_throw(v11);
}

- (BOOL)updateResumeSessionID:(unint64_t)a3
{
  void *v5;
  void *v6;
  unsigned int v7;
  HAPAccessoryServerBTLE *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  id v19;
  HAPAccessoryServerBTLE *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  __CFString *v24;
  void *v25;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  unint64_t v31;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServerBTLE browser](self, "browser"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer identifier](self, "identifier"));
  v7 = objc_msgSend(v5, "isPaired:", v6);

  if (!v7)
    return 0;
  *(unint64_t *)((char *)&self->_hapBLEProtocolVersion + 4) = a3;
  v8 = self;
  v10 = sub_10007CCE4((uint64_t)v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = sub_10007CD2C(v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    *(_DWORD *)buf = 138543618;
    v29 = v13;
    v30 = 2048;
    v31 = a3;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}@Updating resumeSessionID: %llu", buf, 0x16u);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer keyStore](v8, "keyStore"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServerBTLE blePeripheral](v8, "blePeripheral"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uniqueBTIdentifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer identifier](v8, "identifier"));
  v27 = 0;
  v18 = objc_msgSend(v14, "updatePeripheralIdentifier:forAccessoryIdentifier:protocolVersion:previousVersion:resumeSessionID:error:", v16, v17, -[HAPAccessoryServerBTLE hapBLEProtocolVersion](v8, "hapBLEProtocolVersion"), 0, a3, &v27);
  v19 = v27;

  if ((v18 & 1) == 0)
  {
    v20 = v8;
    v22 = sub_10007CCE4((uint64_t)v20, v21);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = sub_10007CD2C(v20);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      *(_DWORD *)buf = 138543618;
      v29 = v25;
      v30 = 2112;
      v31 = (unint64_t)v19;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to update the peripheral identifier with error: %@", buf, 0x16u);

    }
  }

  return v18;
}

- (void)updatePeripheral:(id)a3
{
  objc_storeWeak((id *)((char *)&self->_whbStableIdentifier + 4), a3);
}

- (BOOL)updatePeripheralIdentifier:(id *)a3 isPairing:(BOOL)a4
{
  void *v7;
  void *v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  HAPAccessoryServerBTLE *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  HAPAccessoryServerBTLE *v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  __CFString *v30;
  void *v31;
  HAPAccessoryServerBTLE *v32;
  uint64_t v33;
  id v34;
  NSObject *v35;
  __CFString *v36;
  void *v37;
  id v39;
  id v40;
  unint64_t v41;
  uint64_t v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  unint64_t v46;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServerBTLE browser](self, "browser"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer identifier](self, "identifier"));
  v9 = objc_msgSend(v7, "isPaired:", v8);

  if ((v9 & 1) != 0 || a4)
  {
    v41 = 0;
    v42 = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer keyStore](self, "keyStore"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer identifier](self, "identifier"));
    v40 = 0;
    v13 = objc_msgSend(v11, "readPeripheralIdentifierForAccessoryIdentifier:protocolVersion:resumeSessionID:error:", v12, 0, &v41, &v40);
    v14 = v40;

    if (v41)
    {
      v15 = self;
      v17 = sub_10007CCE4((uint64_t)v15, v16);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = sub_10007CD2C(v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        *(_DWORD *)buf = 138543618;
        v44 = v20;
        v45 = 2048;
        v46 = v41;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%{public}@Initializing BLE Server with resumeSessionID: %llu", buf, 0x16u);

      }
      *(unint64_t *)((char *)&v15->_hapBLEProtocolVersion + 4) = v41;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer keyStore](self, "keyStore"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServerBTLE blePeripheral](self, "blePeripheral"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "uniqueBTIdentifier"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer identifier](self, "identifier"));
    v39 = 0;
    v10 = objc_msgSend(v21, "updatePeripheralIdentifier:forAccessoryIdentifier:protocolVersion:previousVersion:resumeSessionID:error:", v23, v24, -[HAPAccessoryServerBTLE hapBLEProtocolVersion](self, "hapBLEProtocolVersion"), &v42, -[HAPAccessoryServerBTLE resumeSessionID](self, "resumeSessionID"), &v39);
    v25 = v39;

    if ((v10 & 1) != 0)
    {
      if (v42 == 1 && (id)-[HAPAccessoryServerBTLE hapBLEProtocolVersion](self, "hapBLEProtocolVersion") != (id)1)
      {
        v26 = self;
        v28 = sub_10007CCE4((uint64_t)v26, v27);
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = sub_10007CD2C(v26);
          v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
          *(_DWORD *)buf = 138543362;
          v44 = v31;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Incompatible update BLE 1.0 -> BLE 2.x", buf, 0xCu);

        }
        -[HAPAccessoryServer setIncompatibleUpdate:](v26, "setIncompatibleUpdate:", 1);
      }
    }
    else
    {
      v32 = self;
      v34 = sub_10007CCE4((uint64_t)v32, v33);
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = sub_10007CD2C(v32);
        v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
        *(_DWORD *)buf = 138543618;
        v44 = v37;
        v45 = 2112;
        v46 = (unint64_t)v25;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to update the peripheral identifier with error: %@", buf, 0x16u);

      }
      if (a3)
        *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 1, CFSTR("Failed to update peripheral"), CFSTR("Failed to store peripheral identifier to the keystore"), 0, v25));
    }

  }
  else
  {
    v10 = 0;
    if (a3)
      *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 3, CFSTR("Failed to update peripheral."), CFSTR("The accessory is unpaired"), 0, 0));
  }
  return v10;
}

- (void)updateConnectionIdleTime:(unsigned __int8)a3
{
  NSString *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v4));
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v5, 0));

  objc_exception_throw(v6);
}

- (void)configureCharacteristics:(id)a3 queue:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSString *v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = NSStringFromSelector(a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v12));
  v14 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v13, 0));

  objc_exception_throw(v14);
}

- (void)generateBroadcastKey:(unsigned __int8)a3 queue:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  id v8;
  NSString *v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a4;
  v8 = a5;
  v9 = NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v10));
  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v11, 0));

  objc_exception_throw(v12);
}

- (BOOL)isPaired
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServerBTLE browser](self, "browser"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServer identifier](self, "identifier"));
  v5 = objc_msgSend(v3, "isPaired:", v4);

  return v5;
}

- (void)discoverAccessoriesAndReadCharacteristicTypes:(id)a3
{
  -[HAPAccessoryServer discoverAccessories](self, "discoverAccessories", a3);
}

- (BOOL)isCached
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServerBTLE blePeripheral](self, "blePeripheral"));
  v3 = objc_msgSend(v2, "isCached");

  return v3;
}

- (NSString)shortDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HAPAccessoryServerBTLE;
  v3 = -[HAPAccessoryServer shortDescription](&v8, "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAccessoryServerBTLE stateNumber](self, "stateNumber"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%@)"), v4, v5));

  return (NSString *)v6;
}

- (void)enterTrackingMode
{
  -[HAPAccessoryServerBTLE setConnectReason:](self, "setConnectReason:", 8);
}

- (void)exitTrackingMode
{
  -[HAPAccessoryServerBTLE setConnectReason:](self, "setConnectReason:", 0);
}

- (id)hapCharacteristicForCBCharacteristic:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v6));
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v7, 0));

  objc_exception_throw(v8);
}

- (NSString)whbStableIdentifier
{
  return *(NSString **)((char *)&self->_stateNumber + 4);
}

- (BOOL)stateChanged
{
  return self->_stateChanged;
}

- (void)setStateChanged:(BOOL)a3
{
  self->_stateChanged = a3;
}

- (BOOL)notifyingCharacteristicUpdated
{
  return self->_notifyingCharacteristicUpdated;
}

- (void)setNotifyingCharacteristicUpdated:(BOOL)a3
{
  self->_notifyingCharacteristicUpdated = a3;
}

- (CBPeripheral)peripheral
{
  return (CBPeripheral *)objc_loadWeakRetained((id *)((char *)&self->_whbStableIdentifier + 4));
}

- (unint64_t)hapBLEProtocolVersion
{
  return *(unint64_t *)((char *)&self->_peripheral + 4);
}

- (unint64_t)resumeSessionID
{
  return *(unint64_t *)((char *)&self->_hapBLEProtocolVersion + 4);
}

- (unint64_t)metricHAPBTLEConnectionCount
{
  return *(unint64_t *)((char *)&self->_resumeSessionID + 4);
}

- (void)setMetricHAPBTLEConnectionCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_resumeSessionID + 4) = a3;
}

- (unint64_t)metricHAPBTLEDiscoveryCount
{
  return *(unint64_t *)((char *)&self->_metricHAPBTLEConnectionCount + 4);
}

- (void)setMetricHAPBTLEDiscoveryCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_metricHAPBTLEConnectionCount + 4) = a3;
}

- (unint64_t)metricHAPBTLEConnectionPerReasonCount
{
  return *(unint64_t *)((char *)&self->_metricHAPBTLEDiscoveryCount + 4);
}

- (void)setMetricHAPBTLEConnectionPerReasonCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_metricHAPBTLEDiscoveryCount + 4) = a3;
}

- (HAPAccessoryServerBrowser)browser
{
  return (HAPAccessoryServerBrowser *)objc_autoreleaseReturnValue(objc_loadWeakRetained((id *)((char *)&self->_metricHAPBTLEConnectionPerReasonCount
                                                                                             + 4)));
}

- (unsigned)connectionIdleTime
{
  return self->_connectionIdleTime;
}

- (void)setConnectionIdleTime:(unsigned __int8)a3
{
  self->_connectionIdleTime = a3;
}

- (HAPBLEPeripheral)blePeripheral
{
  return (HAPBLEPeripheral *)objc_loadWeakRetained((id *)((char *)&self->_browser + 4));
}

- (void)setBlePeripheral:(id)a3
{
  objc_storeWeak((id *)((char *)&self->_browser + 4), a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)((char *)&self->_browser + 4));
  objc_destroyWeak((id *)((char *)&self->_metricHAPBTLEConnectionPerReasonCount + 4));
  objc_destroyWeak((id *)((char *)&self->_whbStableIdentifier + 4));
  objc_storeStrong((id *)((char *)&self->_stateNumber + 4), 0);
  objc_storeStrong((id *)(&self->_connectionIdleTime + 1), 0);
}

- (void)incrementHAPBTLEMetricsConnectionCount
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options(&self->super._lock, 0);
  ++*(unint64_t *)((char *)&self->_resumeSessionID + 4);
  os_unfair_lock_unlock(p_lock);
}

- (void)incrementHAPBTLEMetricsDiscoveryCount
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options(&self->super._lock, 0);
  ++*(unint64_t *)((char *)&self->_metricHAPBTLEConnectionCount + 4);
  os_unfair_lock_unlock(p_lock);
}

- (id)readAndResetHAPMetrics:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[3];

  v3 = a3;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options(&self->super._lock, 0);
  v11[0] = &off_100245798;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(unint64_t *)((char *)&self->_metricHAPBTLEConnectionCount + 4)));
  v12[0] = v6;
  v11[1] = &off_1002457B0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(unint64_t *)((char *)&self->_resumeSessionID + 4)));
  v12[1] = v7;
  v11[2] = &off_1002457C8;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(unint64_t *)((char *)&self->_metricHAPBTLEDiscoveryCount + 4)));
  v12[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 3));

  if (v3)
  {
    *(unint64_t *)((char *)&self->_metricHAPBTLEConnectionCount + 4) = 0;
    *(unint64_t *)((char *)&self->_resumeSessionID + 4) = 0;
    *(unint64_t *)((char *)&self->_metricHAPBTLEDiscoveryCount + 4) = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v9;
}

@end
