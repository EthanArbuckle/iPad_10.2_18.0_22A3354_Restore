@implementation DataStreamHAPSetupOperation

- (DataStreamHAPSetupOperation)initWithAccessory:(id)a3 queue:(id)a4 logIdentifier:(id)a5 transferManagementService:(id)a6 maxControllerTransportMTU:(unint64_t)a7 setupOperationReadRequired:(BOOL)a8
{
  _BOOL4 v8;
  DataStreamHAPSetupOperation *v10;
  DataStreamHAPSetupOperation *v11;
  objc_super v13;

  v8 = a8;
  v13.receiver = self;
  v13.super_class = (Class)DataStreamHAPSetupOperation;
  v10 = -[DataStreamSetupOperation initWithAccessory:queue:logIdentifier:transferManagementService:](&v13, "initWithAccessory:queue:logIdentifier:transferManagementService:", a3, a4, a5, a6);
  v11 = v10;
  if (v10)
  {
    v10->_maxControllerTransportMTU = a7;
    if (v8)
      -[DataStreamHAPSetupOperation _readRequiredTransportCharacteristics](v10, "_readRequiredTransportCharacteristics");
  }
  return v11;
}

- (void)setMaxControllerTransportMTU:(unint64_t)a3
{
  if (!self->_maxControllerTransportMTU)
    self->_maxControllerTransportMTU = a3;
}

- (void)_readRequiredTransportCharacteristics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  DataStreamHAPSetupOperation *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  _QWORD block[5];
  void *v23;
  _BYTE location[12];
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamSetupOperation transferManagementService](self, "transferManagementService"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "characteristicsOfType:", CFSTR("00000130-0000-1000-8000-4D69736D6574")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 0));

  if (v5)
  {
    v23 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
    objc_initWeak((id *)location, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamSetupOperation accessory](self, "accessory"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamSetupOperation queue](self, "queue"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10002F2D0;
    v20[3] = &unk_100236E30;
    objc_copyWeak(&v21, (id *)location);
    objc_msgSend(v7, "readCharacteristicValues:timeout:completionQueue:completionHandler:", v6, v8, v20, 0.0);

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)location);

  }
  else
  {
    v9 = self;
    v11 = sub_10007CCE4((uint64_t)v9, v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = sub_10007CD2C(v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamSetupOperation accessory](v9, "accessory"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamSetupOperation accessory](v9, "accessory"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
      *(_DWORD *)location = 138543874;
      *(_QWORD *)&location[4] = v14;
      v25 = 2112;
      v26 = v16;
      v27 = 2112;
      v28 = v18;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}@HDS characteristic(s) not found configuration/version (%@/%@)", location, 0x20u);

    }
    v19 = objc_claimAutoreleasedReturnValue(-[DataStreamSetupOperation queue](v9, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002F244;
    block[3] = &unk_100236AA8;
    block[4] = v9;
    dispatch_async(v19, block);

  }
}

- (void)startSetup
{
  DataStreamHAPSetupOperation *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  __CFString *v6;
  void *v7;
  HAPDataStreamTransportCommandWrapper *v8;
  HAPDataStreamTransportProtocolWrapper *v9;
  HAPDataStreamTransportSetup *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  DataStreamHAPSetupOperation *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  __CFString *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;

  v2 = self;
  v4 = sub_10007CCE4((uint64_t)v2, v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = sub_10007CD2C(v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    *(_DWORD *)buf = 138543362;
    v31 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@Creating new DataStream using HAP", buf, 0xCu);

  }
  v8 = -[HAPDataStreamTransportCommandWrapper initWithValue:]([HAPDataStreamTransportCommandWrapper alloc], "initWithValue:", 0);
  v9 = -[HAPDataStreamTransportProtocolWrapper initWithValue:]([HAPDataStreamTransportProtocolWrapper alloc], "initWithValue:", 1);
  v10 = -[HAPDataStreamTransportSetup initWithCommand:transportType:controllerKeySalt:]([HAPDataStreamTransportSetup alloc], "initWithCommand:transportType:controllerKeySalt:", v8, v9, 0);

  v28 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPDataStreamTransportSetup serializeWithError:](v10, "serializeWithError:", &v28));
  v12 = v28;
  if (v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamSetupOperation transferManagementService](v2, "transferManagementService"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "characteristicsOfType:", CFSTR("00000131-0000-1000-8000-4D69736D6574")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", 0));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[HAPCharacteristicWriteRequestTuple writeRequestTupleForCharacteristic:value:authorizationData:timedWrite:responseValue:type:](HAPCharacteristicWriteRequestTuple, "writeRequestTupleForCharacteristic:value:authorizationData:timedWrite:responseValue:type:", v15, v11, 0, 0, 1, 0));
    objc_initWeak((id *)buf, v2);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamSetupOperation accessory](v2, "accessory"));
    v29 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamSetupOperation queue](v2, "queue"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10002F6C0;
    v26[3] = &unk_100236E30;
    objc_copyWeak(&v27, (id *)buf);
    objc_msgSend(v17, "writeCharacteristicValues:timeout:completionQueue:completionHandler:", v18, v19, v26, 0.0);

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    v20 = v2;
    v22 = sub_10007CCE4((uint64_t)v20, v21);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = sub_10007CD2C(v20);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      *(_DWORD *)buf = 138543618;
      v31 = v25;
      v32 = 2112;
      v33 = v12;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to create new DataStream; cannot serialize request (%@)",
        buf,
        0x16u);

    }
    -[DataStreamSetupOperation postDidFailWithError:](v20, "postDidFailWithError:", v12);
  }

}

- (void)processTransportSetupResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  DataStreamHAPSetupOperation *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  DataStreamHAPSetupOperation *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  __CFString *v23;
  void *v24;
  DataStreamHAPTransport *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  DataStreamHAPTransport *v31;
  __CFString *v32;
  void *v33;
  int v34;
  void *v35;
  __int16 v36;
  void *v37;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parameters"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sessionIdentifier"));

  v7 = self;
  v9 = sub_10007CCE4((uint64_t)v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v6)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v12 = sub_10007CD2C(v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parameters"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sessionIdentifier"));
      v34 = 138543618;
      v35 = v13;
      v36 = 2112;
      v37 = v15;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{public}@[Start Stream] The setup transfer succeeded; will use session identifier %@",
        (uint8_t *)&v34,
        0x16u);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parameters"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "sessionIdentifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "value"));
    -[DataStreamHAPSetupOperation setSessionIdentifier:](v7, "setSessionIdentifier:", objc_msgSend(v18, "integerValue"));

    v19 = v7;
    v21 = sub_10007CCE4((uint64_t)v19, v20);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = sub_10007CD2C(v19);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v34 = 138543362;
      v35 = v24;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%{public}@[Start Stream] DataStream configuration valid; starting stream",
        (uint8_t *)&v34,
        0xCu);

    }
    v25 = [DataStreamHAPTransport alloc];
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamSetupOperation accessory](v19, "accessory"));
    v27 = -[DataStreamHAPSetupOperation sessionIdentifier](v19, "sessionIdentifier");
    v28 = -[DataStreamHAPSetupOperation maxControllerTransportMTU](v19, "maxControllerTransportMTU");
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamSetupOperation queue](v19, "queue"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamSetupOperation logIdentifier](v19, "logIdentifier"));
    v31 = -[DataStreamHAPTransport initWithAccessory:sessionIdentifier:maxControllerTransportMTU:workQueue:logIdentifier:](v25, "initWithAccessory:sessionIdentifier:maxControllerTransportMTU:workQueue:logIdentifier:", v26, v27, v28, v29, v30);

    -[DataStreamSetupOperation postDidSucceedWithTransport:sessionEncryption:](v19, "postDidSucceedWithTransport:sessionEncryption:", v31, 0);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v32 = sub_10007CD2C(v7);
      v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      v34 = 138543362;
      v35 = v33;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}@[Start Stream] The setup transfer write reply did not contain a session identifier", (uint8_t *)&v34, 0xCu);

    }
    v31 = (DataStreamHAPTransport *)objc_claimAutoreleasedReturnValue(+[NSError dkErrorWithCode:](NSError, "dkErrorWithCode:", 36));
    -[DataStreamSetupOperation postDidFailWithError:](v7, "postDidFailWithError:", v31);
  }

}

- (unint64_t)maxControllerTransportMTU
{
  return self->_maxControllerTransportMTU;
}

- (int64_t)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(int64_t)a3
{
  self->_sessionIdentifier = a3;
}

@end
