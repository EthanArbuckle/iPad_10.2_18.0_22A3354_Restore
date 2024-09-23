@implementation DataStreamHAPTransport

- (DataStreamHAPTransport)initWithAccessory:(id)a3 sessionIdentifier:(int64_t)a4 maxControllerTransportMTU:(unint64_t)a5 workQueue:(id)a6 logIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  DataStreamHAPTransport *v15;
  DataStreamHAPTransport *v16;
  uint64_t v17;
  NSNumber *sessionIdentifier;
  DataStreamFrameReader *v19;
  DataStreamFrameReader *byteReader;
  NSString *v21;
  NSString *logIdentifier;
  uint64_t v23;
  NSMutableArray *pendingWrites;
  objc_super v26;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v26.receiver = self;
  v26.super_class = (Class)DataStreamHAPTransport;
  v15 = -[DataStreamHAPTransport init](&v26, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_workQueue, a6);
    objc_storeWeak((id *)&v16->_accessory, v12);
    v17 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
    sessionIdentifier = v16->_sessionIdentifier;
    v16->_sessionIdentifier = (NSNumber *)v17;

    v16->_maxControllerTransportMTU = a5;
    v19 = objc_opt_new(DataStreamFrameReader);
    byteReader = v16->_byteReader;
    v16->_byteReader = v19;

    v21 = (NSString *)objc_msgSend(v14, "copy");
    logIdentifier = v16->_logIdentifier;
    v16->_logIdentifier = v21;

    v23 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    pendingWrites = v16->_pendingWrites;
    v16->_pendingWrites = (NSMutableArray *)v23;

  }
  return v16;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)DataStreamHAPTransport;
  -[DataStreamHAPTransport dealloc](&v2, "dealloc");
}

- (BOOL)_isRunning
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamHAPTransport transportCharacteristic](self, "transportCharacteristic"));
  v3 = v2 != 0;

  return v3;
}

- (void)connect
{
  DataStreamHAPTransport *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  __CFString *v7;
  void *v8;
  DataStreamHAPTransport *v9;
  DataStreamHAPTransport *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  __CFString *v15;
  void *v16;
  DataStreamHAPTransport *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  __CFString *v21;
  void *v22;
  DataStreamHAPTransport *v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  __CFString *v27;
  void *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;

  if (-[DataStreamHAPTransport _isRunning](self, "_isRunning"))
  {
    v3 = self;
    v5 = sub_10007CCE4((uint64_t)v3, v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = sub_10007CD2C(v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v32 = 138543362;
      v33 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}@Connect called on an already-running transport", (uint8_t *)&v32, 0xCu);
LABEL_19:

    }
  }
  else
  {
    v9 = (DataStreamHAPTransport *)objc_claimAutoreleasedReturnValue(-[DataStreamHAPTransport accessory](self, "accessory"));
    v3 = v9;
    if (v9)
    {
      v6 = objc_claimAutoreleasedReturnValue(-[DataStreamHAPTransport characteristicOfType:serviceType:](v9, "characteristicOfType:serviceType:", CFSTR("00000138-0000-1000-8000-4D69736D6574"), CFSTR("00000129-0000-1000-8000-4D69736D6574")));
      if (v6)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamHAPTransport characteristicOfType:serviceType:](v3, "characteristicOfType:serviceType:", CFSTR("00000139-0000-1000-8000-4D69736D6574"), CFSTR("00000129-0000-1000-8000-4D69736D6574")));
        v10 = self;
        v12 = sub_10007CCE4((uint64_t)v10, v11);
        v13 = objc_claimAutoreleasedReturnValue(v12);
        v14 = v13;
        if (v8)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            v15 = sub_10007CD2C(v10);
            v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
            v32 = 138543362;
            v33 = v16;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%{public}@[Connect] All good; connected!",
              (uint8_t *)&v32,
              0xCu);

          }
          -[DataStreamHAPTransport setTransportCharacteristic:](v10, "setTransportCharacteristic:", v6);
          -[DataStreamHAPTransport setInterruptCharacteristic:](v10, "setInterruptCharacteristic:", v8);
          -[DataStreamHAPTransport _registerForMessages](v10, "_registerForMessages");
          -[DataStreamHAPTransport _notifyDelegateDidOpen](v10, "_notifyDelegateDidOpen");
        }
        else
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            v29 = sub_10007CD2C(v10);
            v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
            v32 = 138543362;
            v33 = v30;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@[Connect] Missing characteristics to create transport for HDS over HAP (Interrupt Characteristic does not exist)", (uint8_t *)&v32, 0xCu);

          }
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSError dkErrorWithCode:](NSError, "dkErrorWithCode:", 4));
          -[DataStreamHAPTransport _teardownSessionWithError:](v10, "_teardownSessionWithError:", v31);

        }
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
          v32 = 138543362;
          v33 = v28;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%{public}@[Connect] Missing characteristics to create transport for HDS over HAP (Transport Characteristic does not exist)", (uint8_t *)&v32, 0xCu);

        }
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError dkErrorWithCode:](NSError, "dkErrorWithCode:", 4));
        -[DataStreamHAPTransport _teardownSessionWithError:](v23, "_teardownSessionWithError:", v8);
      }
      goto LABEL_19;
    }
    v17 = self;
    v19 = sub_10007CCE4((uint64_t)v17, v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = sub_10007CD2C(v17);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v32 = 138543362;
      v33 = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}@Connect called but accessory is no longer valid", (uint8_t *)&v32, 0xCu);

    }
    v6 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), 38, 0));
    -[DataStreamHAPTransport _teardownSessionWithError:](v17, "_teardownSessionWithError:", v6);
  }

}

- (void)invalidate
{
  -[DataStreamHAPTransport _stopWithError:](self, "_stopWithError:", 0);
}

- (void)close
{
  unsigned int v3;
  DataStreamHAPTransport *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  __CFString *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  int v13;
  void *v14;

  v3 = -[DataStreamHAPTransport _isRunning](self, "_isRunning");
  v4 = self;
  v6 = sub_10007CCE4((uint64_t)v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v8)
    {
      v9 = sub_10007CD2C(v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v13 = 138543362;
      v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@DataStream transport closing.", (uint8_t *)&v13, 0xCu);

    }
    -[DataStreamHAPTransport _teardownSessionWithError:](v4, "_teardownSessionWithError:", 0);
  }
  else
  {
    if (v8)
    {
      v11 = sub_10007CD2C(v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = 138543362;
      v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@DataStream Socket invoked closed but nothing to clean up.", (uint8_t *)&v13, 0xCu);

    }
  }
}

- (void)_stopWithError:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  if (-[DataStreamHAPTransport _isRunning](self, "_isRunning"))
    -[DataStreamHAPTransport _deregisterForMessages](self, "_deregisterForMessages");
  -[DataStreamHAPTransport setTransportCharacteristic:](self, "setTransportCharacteristic:", 0);
  -[DataStreamHAPTransport setInterruptCharacteristic:](self, "setInterruptCharacteristic:", 0);
  v5 = v4;
  v6 = v5;
  if (!v5)
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), 39, 0));
  -[DataStreamHAPTransport _cancelAllPendingWritesWithError:](self, "_cancelAllPendingWritesWithError:", v5);
  -[DataStreamHAPTransport setIsWriteInProgress:](self, "setIsWriteInProgress:", 0);
  if (v6)
    -[DataStreamHAPTransport _notifyDelegateDidFailWithError:](self, "_notifyDelegateDidFailWithError:", v6);
  else
    -[DataStreamHAPTransport _notifyDelegateDidClose](self, "_notifyDelegateDidClose");

}

- (void)_teardownSessionWithError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  DataStreamHAPTransport *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  __CFString *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  void *v17;
  _BYTE location[12];
  __int16 v19;
  id v20;

  v4 = a3;
  if (-[DataStreamHAPTransport _isRunning](self, "_isRunning"))
  {
    v16 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamHAPTransport _buildWriteRequestWithError:shouldForceClose:](self, "_buildWriteRequestWithError:shouldForceClose:", &v16, 1));
    v6 = v16;
    if (v5)
    {
      objc_initWeak((id *)location, self);
      v17 = v5;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10002B5FC;
      v14[3] = &unk_100236E30;
      objc_copyWeak(&v15, (id *)location);
      -[DataStreamHAPTransport _writeCharacteristicRequests:completion:](self, "_writeCharacteristicRequests:completion:", v7, v14);

      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)location);

    }
    else
    {
      v8 = self;
      v10 = sub_10007CCE4((uint64_t)v8, v9);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = sub_10007CD2C(v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        *(_DWORD *)location = 138543618;
        *(_QWORD *)&location[4] = v13;
        v19 = 2112;
        v20 = v6;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}@[Transport] Unable to write: Closing after session force close failed; error=%@",
          location,
          0x16u);

      }
      -[DataStreamHAPTransport _stopWithError:](v8, "_stopWithError:", v4);

    }
  }
  else
  {
    -[DataStreamHAPTransport _stopWithError:](self, "_stopWithError:", v4);
  }

}

- (void)_registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamHAPTransport accessory](self, "accessory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "server"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamHAPTransport interruptCharacteristic](self, "interruptCharacteristic"));
  v9 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002B770;
  v8[3] = &unk_100236E58;
  v8[4] = self;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamHAPTransport workQueue](self, "workQueue"));
  objc_msgSend(v4, "enableEvents:forCharacteristics:withCompletionHandler:queue:", 1, v6, v8, v7);

}

- (void)_notifyDelegateDidOpen
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[DataStreamHAPTransport workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B978;
  block[3] = &unk_100236AA8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_notifyDelegateDidClose
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[DataStreamHAPTransport workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002BA24;
  block[3] = &unk_100236AA8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_notifyDelegateDidFailWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[DataStreamHAPTransport workQueue](self, "workQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002BAFC;
  v7[3] = &unk_100236AD0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_notifyDelegateDidReceiveFrame:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[DataStreamHAPTransport workQueue](self, "workQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002BBD4;
  v7[3] = &unk_100236AD0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)sendRawFrame:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  DataStreamHAPPendingWrite *v9;

  v6 = a4;
  v7 = a3;
  v9 = -[DataStreamHAPPendingWrite initWithData:completion:]([DataStreamHAPPendingWrite alloc], "initWithData:completion:", v7, v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamHAPTransport pendingWrites](self, "pendingWrites"));
  objc_msgSend(v8, "addObject:", v9);

  -[DataStreamHAPTransport _doNextWriteOperation](self, "_doNextWriteOperation");
}

- (id)_getPendingWritesUpToLength:(unint64_t)a3
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamHAPTransport pendingWrites](self, "pendingWrites", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v18;
    while (1)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v10), "popNextFrameUpToMaxLength:", a3));
        if (!objc_msgSend(v11, "length"))
          goto LABEL_13;
        if (v7)
        {
          v12 = v7;
LABEL_11:
          objc_msgSend(v12, "appendData:", v11);
          goto LABEL_12;
        }
        if (v8)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithData:](NSMutableData, "dataWithData:", v8));
          v7 = v12;
          goto LABEL_11;
        }
        v8 = v11;
        v7 = 0;
LABEL_12:
        a3 -= (unint64_t)objc_msgSend(v11, "length");
        if (!a3)
        {

          goto LABEL_20;
        }
LABEL_13:

        v10 = (char *)v10 + 1;
      }
      while (v6 != v10);
      v13 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v6 = v13;
      if (!v13)
        goto LABEL_20;
    }
  }
  v7 = 0;
  v8 = 0;
LABEL_20:

  if (v7)
    v14 = v7;
  else
    v14 = v8;
  v15 = v14;

  return v15;
}

- (id)_buildWriteRequestWithError:(id *)a3 shouldForceClose:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  HAPTLVUnsignedNumberValue *v8;
  void *v9;
  DataStreamHAPTransport *v10;
  HAPTLVUnsignedNumberValue *v11;
  void *v12;
  NSObject *v13;
  HAPDataStreamHAPControllerPayload *v14;
  void *v15;
  id v16;
  DataStreamHAPTransport *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  uint64_t v28;
  id v29;
  __CFString *v30;
  void *v31;
  int v32;
  void *v33;
  __int16 v34;
  unsigned int v35;
  __int16 v36;
  unsigned int v37;

  v4 = a4;
  if (a4)
  {
    v7 = 0;
    goto LABEL_5;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamHAPTransport _getPendingWritesUpToLength:](self, "_getPendingWritesUpToLength:", -[DataStreamHAPTransport maxControllerTransportMTU](self, "maxControllerTransportMTU")));
  if (objc_msgSend(v7, "length")
    || -[DataStreamHAPTransport lastAccessoryRequestToSendFlag](self, "lastAccessoryRequestToSendFlag"))
  {
LABEL_5:
    v8 = [HAPTLVUnsignedNumberValue alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamHAPTransport sessionIdentifier](self, "sessionIdentifier"));
    v10 = -[HAPTLVNumberValueBase initWithValue:](v8, "initWithValue:", v9);

    if (v4)
    {
      v11 = [HAPTLVUnsignedNumberValue alloc];
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
      v13 = -[HAPTLVNumberValueBase initWithValue:](v11, "initWithValue:", v12);

    }
    else
    {
      v13 = 0;
    }
    v14 = -[HAPDataStreamHAPControllerPayload initWithPayload:sessionIdentifier:forceClose:]([HAPDataStreamHAPControllerPayload alloc], "initWithPayload:sessionIdentifier:forceClose:", v7, v10, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamHAPControllerPayload serializeWithError:](v14, "serializeWithError:", a3));
    v16 = *a3;
    v17 = self;
    v19 = sub_10007CCE4((uint64_t)v17, v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = v20;
    if (v16)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v22 = sub_10007CD2C(v17);
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        v32 = 138543362;
        v33 = v23;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}@Error: failed to serialize Controller Payload; should not happen!",
          (uint8_t *)&v32,
          0xCu);

      }
      v24 = 0;
    }
    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        v25 = sub_10007CD2C(v17);
        v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
        v32 = 138543874;
        v33 = v26;
        v34 = 1024;
        v35 = objc_msgSend(v7, "length");
        v36 = 1024;
        v37 = -[DataStreamHAPTransport lastAccessoryRequestToSendFlag](v17, "lastAccessoryRequestToSendFlag");
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%{public}@Writing: %u bytes (rts=%d)", (uint8_t *)&v32, 0x18u);

      }
      v17 = (DataStreamHAPTransport *)objc_claimAutoreleasedReturnValue(-[DataStreamHAPTransport transportCharacteristic](v17, "transportCharacteristic"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[HAPCharacteristicWriteRequestTuple writeRequestTupleForCharacteristic:value:authorizationData:timedWrite:responseValue:type:](HAPCharacteristicWriteRequestTuple, "writeRequestTupleForCharacteristic:value:authorizationData:timedWrite:responseValue:type:", v17, v15, 0, 0, 1, 0));
    }

    goto LABEL_16;
  }
  v10 = self;
  v29 = sub_10007CCE4((uint64_t)v10, v28);
  v13 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v30 = sub_10007CD2C(v10);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v32 = 138543362;
    v33 = v31;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%{public}@Writing: nothing to write", (uint8_t *)&v32, 0xCu);

  }
  v24 = 0;
LABEL_16:

  return v24;
}

- (void)_writeCharacteristicRequests:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[DataStreamHAPTransport accessory](self, "accessory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamHAPTransport workQueue](self, "workQueue"));
  objc_msgSend(v9, "writeCharacteristicValues:timeout:completionQueue:completionHandler:", v7, v8, v6, 0.0);

}

- (void)_doNextWriteOperation
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  id v7;
  DataStreamHAPTransport *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  __CFString *v12;
  void *v13;
  DataStreamHAPTransport *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  __CFString *v18;
  void *v19;
  DataStreamHAPTransport *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  void *v30;
  uint8_t buf[4];
  void *v32;

  if (!-[DataStreamHAPTransport isWriteInProgress](self, "isWriteInProgress"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamHAPTransport pendingWrites](self, "pendingWrites"));
    if (objc_msgSend(v3, "hmf_isEmpty"))
    {
      v4 = -[DataStreamHAPTransport lastAccessoryRequestToSendFlag](self, "lastAccessoryRequestToSendFlag");

      if ((v4 & 1) == 0)
        return;
    }
    else
    {

    }
    if (-[DataStreamHAPTransport _isRunning](self, "_isRunning"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamHAPTransport accessory](self, "accessory"));
      if (v5)
      {
        -[DataStreamHAPTransport setIsWriteInProgress:](self, "setIsWriteInProgress:", 1);
        v29 = 0;
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamHAPTransport _buildWriteRequestWithError:shouldForceClose:](self, "_buildWriteRequestWithError:shouldForceClose:", &v29, 0));
        v7 = v29;
        if (v7)
        {
          v8 = self;
          v10 = sub_10007CCE4((uint64_t)v8, v9);
          v11 = objc_claimAutoreleasedReturnValue(v10);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            v12 = sub_10007CD2C(v8);
            v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
            *(_DWORD *)buf = 138543362;
            v32 = v13;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}@[Transport] Unable to write: building next payload failed and should not do that; closing.",
              buf,
              0xCu);

          }
          -[DataStreamHAPTransport _stopTransportForWriteFailureError:](v8, "_stopTransportForWriteFailureError:", v7);
        }
        else if (v6)
        {
          objc_initWeak((id *)buf, self);
          v30 = v6;
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_10002C588;
          v27[3] = &unk_100236E30;
          objc_copyWeak(&v28, (id *)buf);
          -[DataStreamHAPTransport _writeCharacteristicRequests:completion:](self, "_writeCharacteristicRequests:completion:", v26, v27);

          objc_destroyWeak(&v28);
          objc_destroyWeak((id *)buf);
        }
        else
        {
          -[DataStreamHAPTransport _removeAndMarkCompleteAllCompletedWrites](self, "_removeAndMarkCompleteAllCompletedWrites");
          -[DataStreamHAPTransport _doNextWriteOperation](self, "_doNextWriteOperation");
        }

      }
      else
      {
        v20 = self;
        v22 = sub_10007CCE4((uint64_t)v20, v21);
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = sub_10007CD2C(v20);
          v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
          *(_DWORD *)buf = 138543362;
          v32 = v25;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}@[Transport] Unable to write: HAPAccessory is no longer active; closing.",
            buf,
            0xCu);

        }
        v7 = (id)objc_claimAutoreleasedReturnValue(+[NSError dkErrorWithCode:](NSError, "dkErrorWithCode:", 40));
        -[DataStreamHAPTransport _stopTransportForWriteFailureError:](v20, "_stopTransportForWriteFailureError:", v7);
      }

    }
    else
    {
      v14 = self;
      v16 = sub_10007CCE4((uint64_t)v14, v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = sub_10007CD2C(v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        *(_DWORD *)buf = 138543362;
        v32 = v19;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@[Transport] Unable to write: transport already closed.", buf, 0xCu);

      }
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), 39, 0));
      -[DataStreamHAPTransport _cancelAllPendingWritesWithError:](v14, "_cancelAllPendingWritesWithError:", v5);
    }

  }
}

- (void)_handleCompletionWithResponseTuples:(id)a3
{
  id v4;
  unsigned __int8 v5;
  DataStreamHAPTransport *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  __CFString *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  __CFString *v22;
  void *v23;
  DataStreamHAPTransport *v24;
  void *v25;
  DataStreamHAPTransport *v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  DataStreamHAPTransport *v34;
  uint64_t v35;
  id v36;
  NSObject *v37;
  __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  DataStreamHAPTransport *v46;
  uint64_t v47;
  id v48;
  NSObject *v49;
  __CFString *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t v61[128];
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  id v65;

  v4 = a3;
  v5 = -[DataStreamHAPTransport isWriteInProgress](self, "isWriteInProgress");
  v6 = self;
  v8 = sub_10007CCE4((uint64_t)v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if ((v5 & 1) != 0)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v11 = sub_10007CD2C(v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      *(_DWORD *)buf = 138543618;
      v63 = v12;
      v64 = 2112;
      v65 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}@[Transport] Handling responses: %@", buf, 0x16u);

    }
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v55 = v4;
    v13 = v4;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v58;
LABEL_6:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v58 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "characteristic", v55));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "type"));
        v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("00000138-0000-1000-8000-4D69736D6574"));

        if ((v21 & 1) != 0)
          break;
        if (v15 == (id)++v17)
        {
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
          if (v15)
            goto LABEL_6;
          goto LABEL_12;
        }
      }
      v24 = v18;

      if (!v24)
        goto LABEL_21;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamHAPTransport error](v24, "error"));

      if (v25)
      {
        v26 = v6;
        v28 = sub_10007CCE4((uint64_t)v26, v27);
        v29 = objc_claimAutoreleasedReturnValue(v28);
        v4 = v55;
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v30 = sub_10007CD2C(v26);
          v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamHAPTransport error](v24, "error"));
          *(_DWORD *)buf = 138543618;
          v63 = v31;
          v64 = 2112;
          v65 = v32;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%{public}@[Transport] Write response errored out: %@", buf, 0x16u);

        }
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamHAPTransport error](v24, "error"));
        -[DataStreamHAPTransport _stopTransportForWriteFailureError:](v26, "_stopTransportForWriteFailureError:", v33);

      }
      else
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamHAPTransport value](v24, "value"));
        v56 = 0;
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[HAPDataStreamHAPAccessoryPayload parsedFromData:error:](HAPDataStreamHAPAccessoryPayload, "parsedFromData:error:", v40, &v56));
        v42 = v56;

        if (v42 || !v41)
        {
          v46 = v6;
          v48 = sub_10007CCE4((uint64_t)v46, v47);
          v49 = objc_claimAutoreleasedReturnValue(v48);
          v4 = v55;
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            v50 = sub_10007CD2C(v46);
            v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
            *(_DWORD *)buf = 138543618;
            v63 = v51;
            v64 = 2112;
            v65 = v42;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "%{public}@[Start Stream] The setup transfer write reply could not be parsed (error=%@)", buf, 0x16u);

          }
          v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSError dkErrorWithCode:](NSError, "dkErrorWithCode:", 36));
          -[DataStreamHAPTransport _stopTransportForWriteFailureError:](v46, "_stopTransportForWriteFailureError:", v52);

        }
        else
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "accessoryRequestToSend"));

          v4 = v55;
          if (v43)
          {
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "accessoryRequestToSend"));
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "value"));
            -[DataStreamHAPTransport setLastAccessoryRequestToSendFlag:](v6, "setLastAccessoryRequestToSendFlag:", objc_msgSend(v45, "BOOLValue"));

          }
          else
          {
            -[DataStreamHAPTransport setLastAccessoryRequestToSendFlag:](v6, "setLastAccessoryRequestToSendFlag:", 0);
          }
          -[DataStreamHAPTransport _removeAndMarkCompleteAllCompletedWrites](v6, "_removeAndMarkCompleteAllCompletedWrites");
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "payload"));

          if (v53)
          {
            v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "payload"));
            -[DataStreamHAPTransport _handleReceivedData:](v6, "_handleReceivedData:", v54);

          }
          -[DataStreamHAPTransport _doNextWriteOperation](v6, "_doNextWriteOperation");
        }

      }
      v6 = v24;
    }
    else
    {
LABEL_12:

LABEL_21:
      v34 = v6;
      v36 = sub_10007CCE4((uint64_t)v34, v35);
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v38 = sub_10007CD2C(v34);
        v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
        *(_DWORD *)buf = 138543362;
        v63 = v39;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%{public}@[Transport] Write-response contained no response; weird. Erroring out.",
          buf,
          0xCu);

      }
      v6 = (DataStreamHAPTransport *)objc_claimAutoreleasedReturnValue(+[NSError dkErrorWithCode:](NSError, "dkErrorWithCode:", 1));
      -[DataStreamHAPTransport _stopTransportForWriteFailureError:](v34, "_stopTransportForWriteFailureError:", v6);
      v4 = v55;
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v22 = sub_10007CD2C(v6);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      *(_DWORD *)buf = 138543362;
      v63 = v23;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@[Transport] Write-response returned but nothing in progress; stale reply? Ignoring",
        buf,
        0xCu);

    }
  }

}

- (void)_removeAndMarkCompleteAllCompletedWrites
{
  void *v3;
  char *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamHAPTransport pendingWrites](self, "pendingWrites", 0));
  v4 = (char *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v4)
    goto LABEL_13;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v12;
  while (2)
  {
    v8 = 0;
    v9 = &v5[(_QWORD)v6];
    do
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(v3);
      v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8);
      if (!objc_msgSend(v10, "isComplete"))
      {
        v9 = &v8[(_QWORD)v6];
        goto LABEL_11;
      }
      -[DataStreamHAPTransport _notifyWriteOperation:didCompleteWithError:](self, "_notifyWriteOperation:didCompleteWithError:", v10, 0);
      ++v8;
    }
    while (v5 != v8);
    v5 = (char *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    v6 = v9;
    if (v5)
      continue;
    break;
  }
LABEL_11:

  if (v9)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamHAPTransport pendingWrites](self, "pendingWrites"));
    objc_msgSend(v3, "removeObjectsInRange:", 0, v9);
LABEL_13:

  }
  -[DataStreamHAPTransport setIsWriteInProgress:](self, "setIsWriteInProgress:", 0);
}

- (void)_cancelAllPendingWritesWithError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamHAPTransport pendingWrites](self, "pendingWrites", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[DataStreamHAPTransport _notifyWriteOperation:didCompleteWithError:](self, "_notifyWriteOperation:didCompleteWithError:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), v4);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamHAPTransport pendingWrites](self, "pendingWrites"));
  objc_msgSend(v10, "removeAllObjects");

}

- (void)_notifyWriteOperation:(id)a3 didCompleteWithError:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "completion"));
  v8 = objc_claimAutoreleasedReturnValue(-[DataStreamHAPTransport workQueue](self, "workQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002CE98;
  v11[3] = &unk_100236E80;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, v11);

}

- (void)_handleReceivedData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  dispatch_data_t v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  DataStreamHAPTransport *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  int v24;
  void *v25;

  v4 = a3;
  v5 = objc_autoreleasePoolPush();
  v6 = objc_retainAutorelease(v4);
  v7 = dispatch_data_create(objc_msgSend(v6, "bytes"), (size_t)objc_msgSend(v6, "length"), 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamHAPTransport byteReader](self, "byteReader"));
  objc_msgSend(v8, "pushFrameData:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamHAPTransport byteReader](self, "byteReader"));
  v10 = objc_msgSend(v9, "hasFailed");

  if ((v10 & 1) != 0)
  {
    v11 = self;
    v13 = sub_10007CCE4((uint64_t)v11, v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = sub_10007CD2C(v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v24 = 138543362;
      v25 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%{public}@DataStream has encountered irrecoverable framing issue. Closing stream.", (uint8_t *)&v24, 0xCu);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), 27, 0));
    -[DataStreamHAPTransport _teardownSessionWithError:](v11, "_teardownSessionWithError:", v17);

  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamHAPTransport byteReader](self, "byteReader"));
    v19 = objc_msgSend(v18, "hasCompleteFrame");

    if (v19)
    {
      do
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamHAPTransport byteReader](self, "byteReader"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "popRawFrame"));

        if (v21)
          -[DataStreamHAPTransport _notifyDelegateDidReceiveFrame:](self, "_notifyDelegateDidReceiveFrame:", v21);

        v22 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamHAPTransport byteReader](self, "byteReader"));
        v23 = objc_msgSend(v22, "hasCompleteFrame");

      }
      while ((v23 & 1) != 0);
    }
  }

  objc_autoreleasePoolPop(v5);
}

- (void)_handleInterruptCharacteristicValue:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  DataStreamHAPTransport *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  DataStreamHAPTransport *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  __CFString *v25;
  DataStreamHAPTransport *v26;
  uint64_t v27;
  id v28;
  __CFString *v29;
  uint64_t v30;
  id v31;
  __CFString *v32;
  DataStreamHAPTransport *v33;
  __CFString *v34;
  DataStreamHAPTransport *v35;
  id v36;
  uint8_t buf[4];
  DataStreamHAPTransport *v38;
  __int16 v39;
  DataStreamHAPTransport *v40;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[DataStreamHAPTransport workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = v4;
  v8 = objc_opt_class(NSData, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
    v9 = v6;
  else
    v9 = 0;
  v10 = v9;

  if (!v10)
  {
    v12 = self;
    v28 = sub_10007CCE4((uint64_t)v12, v27);
    v11 = objc_claimAutoreleasedReturnValue(v28);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    v29 = sub_10007CD2C(v12);
    v20 = (DataStreamHAPTransport *)objc_claimAutoreleasedReturnValue(v29);
    *(_DWORD *)buf = 138543362;
    v38 = v20;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}@[Interrupt] Received interrupt value but it was not of the expected type; IGNORING.",
      buf,
      0xCu);
LABEL_18:

    goto LABEL_19;
  }
  v36 = 0;
  v11 = objc_claimAutoreleasedReturnValue(+[HAPDataStreamTransportInterruptPayload parsedFromData:error:](HAPDataStreamTransportInterruptPayload, "parsedFromData:error:", v10, &v36));
  v12 = (DataStreamHAPTransport *)v36;
  if (v12 || !v11)
  {
    v20 = self;
    v31 = sub_10007CCE4((uint64_t)v20, v30);
    v24 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v32 = sub_10007CD2C(v20);
      v33 = (DataStreamHAPTransport *)objc_claimAutoreleasedReturnValue(v32);
      *(_DWORD *)buf = 138543618;
      v38 = v33;
      v39 = 2112;
      v40 = v12;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%{public}@[Interrupt] The interrupt value could not be parsed (error=%@)", buf, 0x16u);

    }
    goto LABEL_17;
  }
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSObject requestToSendIdentifiers](v11, "requestToSendIdentifiers")));
  v14 = objc_msgSend(v13, "bytes");

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject requestToSendIdentifiers](v11, "requestToSendIdentifiers"));
  v16 = objc_msgSend(v15, "length");

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamHAPTransport sessionIdentifier](self, "sessionIdentifier"));
  v18 = objc_msgSend(v17, "intValue");

  v19 = memchr(v14, v18, (size_t)v16);
  v20 = self;
  v22 = sub_10007CCE4((uint64_t)v20, v21);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  v24 = v23;
  if (!v19)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v34 = sub_10007CD2C(v20);
      v35 = (DataStreamHAPTransport *)objc_claimAutoreleasedReturnValue(v34);
      *(_DWORD *)buf = 138543618;
      v38 = v35;
      v39 = 1024;
      LODWORD(v40) = v18;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "%{public}@[Interrupt] The interrupt value does not contain any Request To Send (0x%x)", buf, 0x12u);

    }
LABEL_17:

    goto LABEL_18;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v25 = sub_10007CD2C(v20);
    v26 = (DataStreamHAPTransport *)objc_claimAutoreleasedReturnValue(v25);
    *(_DWORD *)buf = 138543618;
    v38 = v26;
    v39 = 1024;
    LODWORD(v40) = v18;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%{public}@[Interrupt] The interrupt value contains valid accessory Request To Send (0x%x)", buf, 0x12u);

  }
  -[DataStreamHAPTransport setLastAccessoryRequestToSendFlag:](v20, "setLastAccessoryRequestToSendFlag:", 1);
  -[DataStreamHAPTransport _doNextWriteOperation](v20, "_doNextWriteOperation");
LABEL_19:

}

- (DataStreamTransportDelegate)delegate
{
  return (DataStreamTransportDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (HAPAccessory)accessory
{
  return (HAPAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (HAPCharacteristic)transportCharacteristic
{
  return (HAPCharacteristic *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTransportCharacteristic:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (HAPCharacteristic)interruptCharacteristic
{
  return (HAPCharacteristic *)objc_getProperty(self, a2, 48, 1);
}

- (void)setInterruptCharacteristic:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSNumber)sessionIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (unint64_t)maxControllerTransportMTU
{
  return self->_maxControllerTransportMTU;
}

- (DataStreamFrameReader)byteReader
{
  return (DataStreamFrameReader *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)notificationClientIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (NSMutableArray)pendingWrites
{
  return (NSMutableArray *)objc_getProperty(self, a2, 96, 1);
}

- (BOOL)isWriteInProgress
{
  return self->_isWriteInProgress;
}

- (void)setIsWriteInProgress:(BOOL)a3
{
  self->_isWriteInProgress = a3;
}

- (BOOL)lastAccessoryRequestToSendFlag
{
  return self->_lastAccessoryRequestToSendFlag;
}

- (void)setLastAccessoryRequestToSendFlag:(BOOL)a3
{
  self->_lastAccessoryRequestToSendFlag = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingWrites, 0);
  objc_storeStrong((id *)&self->_notificationClientIdentifier, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_byteReader, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_interruptCharacteristic, 0);
  objc_storeStrong((id *)&self->_transportCharacteristic, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
