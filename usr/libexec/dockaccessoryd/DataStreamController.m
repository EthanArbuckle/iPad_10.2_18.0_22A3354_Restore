@implementation DataStreamController

- (DataStreamController)initWithAccessory:(id)a3 service:(id)a4 workQueue:(id)a5
{
  return -[DataStreamController initWithAccessory:service:workQueue:dataStreamFactory:](self, "initWithAccessory:service:workQueue:dataStreamFactory:", a3, a4, a5, &stru_100238160);
}

- (DataStreamController)initWithAccessory:(id)a3 service:(id)a4 workQueue:(id)a5 dataStreamFactory:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  DataStreamController *v14;
  DataStreamController *v15;
  uint64_t v16;
  NSMutableArray *pendingSocketRequests;
  id v18;
  id dataStreamFactory;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)DataStreamController;
  v14 = -[DataStreamController init](&v21, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_accessory, v10);
    objc_storeWeak((id *)&v15->_transferManagementService, v11);
    objc_storeStrong((id *)&v15->_workQueue, a5);
    v16 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    pendingSocketRequests = v15->_pendingSocketRequests;
    v15->_pendingSocketRequests = (NSMutableArray *)v16;

    v18 = objc_retainBlock(v13);
    dataStreamFactory = v15->_dataStreamFactory;
    v15->_dataStreamFactory = v18;

  }
  return v15;
}

- (void)deRegisterFromNotifications
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)handleAccessoryConnected:(id)a3
{
  -[DataStreamController handleAccessoryConnected](self, "handleAccessoryConnected", a3);
}

- (void)_resetTransportInfo
{
  -[DataStreamController setSupportsDataStreamOverHAP:](self, "setSupportsDataStreamOverHAP:", 0);
  -[DataStreamController setMaxControllerTransportMTU:](self, "setMaxControllerTransportMTU:", 0);
}

- (void)handleAccessoryConnected
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[DataStreamController workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100087D08;
  block[3] = &unk_100236AA8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)handleAccessoryConnectedSync
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100087EE8;
  v2[3] = &unk_100236E58;
  v2[4] = self;
  -[DataStreamController _readRequiredTransportCharacteristicsIfNeededWithCompletion:](self, "_readRequiredTransportCharacteristicsIfNeededWithCompletion:", v2);
}

- (BOOL)_isDataStreamConfigurationValid
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  DataStreamController *v9;
  BOOL v10;
  BOOL v11;
  DataStreamController *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  DataStreamController *v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  __CFString *v29;
  void *v30;
  uint64_t v31;
  id v32;
  __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  NSObject *v41;
  __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  DataStreamController *v49;
  void *v50;
  void *v51;
  BOOL v52;
  BOOL v53;
  NSObject *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  id v59;
  uint8_t v60[128];
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;

  v3 = objc_claimAutoreleasedReturnValue(-[DataStreamController workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController transferManagementService](self, "transferManagementService"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "characteristicsOfType:", CFSTR("00000130-0000-1000-8000-4D69736D6574")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));

  if (v6)
  {
    -[DataStreamController _resetTransportInfo](self, "_resetTransportInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "value"));
    v59 = 0;
    v8 = objc_claimAutoreleasedReturnValue(+[HAPDataStreamTransportSupportedConfiguration parsedFromData:error:](HAPDataStreamTransportSupportedConfiguration, "parsedFromData:error:", v7, &v59));
    v9 = (DataStreamController *)v59;

    if (v9)
      v10 = 1;
    else
      v10 = v8 == 0;
    v11 = !v10;
    if (v10)
    {
      v12 = self;
      v40 = sub_10007CCE4((uint64_t)v12, v39);
      v41 = objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        v42 = sub_10007CD2C(v12);
        v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
        v54 = v8;
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController accessory](v12, "accessory"));
        v53 = v11;
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "name"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController accessory](v12, "accessory"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "identifier"));
        *(_DWORD *)buf = 138543874;
        v62 = v43;
        v63 = 2112;
        v64 = v45;
        v65 = 2112;
        v66 = v47;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "%{public}@Failed to parse HDS supported configuration (%@/%@)", buf, 0x20u);

        v11 = v53;
        v8 = v54;

      }
    }
    else
    {
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v12 = (DataStreamController *)objc_claimAutoreleasedReturnValue(-[NSObject configurations](v8, "configurations"));
      v13 = -[DataStreamController countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
      if (v13)
      {
        v14 = v13;
        v52 = v11;
        v49 = v9;
        v50 = v6;
        v51 = v4;
        v15 = *(_QWORD *)v56;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v56 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i);
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "transport"));

            if (v18)
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "transport"));
              v20 = objc_msgSend(v19, "value");

              if (v20 == (id)1 && !-[DataStreamController supportsDataStreamOverHAP](self, "supportsDataStreamOverHAP"))
              {
                v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "maximumControllerTransportMTU"));

                if (v21)
                {
                  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "maximumControllerTransportMTU"));
                  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "value"));
                  v24 = objc_msgSend(v23, "unsignedIntegerValue");

                  -[DataStreamController setSupportsDataStreamOverHAP:](self, "setSupportsDataStreamOverHAP:", 1);
                  -[DataStreamController setMaxControllerTransportMTU:](self, "setMaxControllerTransportMTU:", v24);
                }
                else
                {
                  v25 = self;
                  v27 = sub_10007CCE4((uint64_t)v25, v26);
                  v28 = objc_claimAutoreleasedReturnValue(v27);
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                  {
                    v29 = sub_10007CD2C(v25);
                    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
                    *(_DWORD *)buf = 138543362;
                    v62 = v30;
                    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Accessory with HDS service advertises HDS-over-HAP but provides no MTU; ignoring.",
                      buf,
                      0xCu);

                  }
                }
              }
            }
          }
          v14 = -[DataStreamController countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
        }
        while (v14);
        v6 = v50;
        v4 = v51;
        v9 = v49;
        v11 = v52;
      }
    }

  }
  else
  {
    v9 = self;
    v32 = sub_10007CCE4((uint64_t)v9, v31);
    v8 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v33 = sub_10007CD2C(v9);
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController accessory](v9, "accessory"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "name"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController accessory](v9, "accessory"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "identifier"));
      *(_DWORD *)buf = 138543874;
      v62 = v34;
      v63 = 2112;
      v64 = v36;
      v65 = 2112;
      v66 = v38;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@No HDS supported configuration (%@/%@)", buf, 0x20u);

    }
    v11 = 0;
  }

  return v11;
}

- (void)readRequiredTransportCharacteristicsIfNeededWithCompletion:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100088558;
  v5[3] = &unk_100238188;
  v6 = a3;
  v4 = v6;
  -[DataStreamController _readRequiredTransportCharacteristicsIfNeededWithCompletion:](self, "_readRequiredTransportCharacteristicsIfNeededWithCompletion:", v5);

}

- (void)_readRequiredTransportCharacteristicsIfNeededWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  DataStreamController *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  void (**v23)(id, _QWORD, void *);
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  void *v28;

  v4 = (void (**)(id, _QWORD, void *))a3;
  v5 = objc_claimAutoreleasedReturnValue(-[DataStreamController workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController transferManagementService](self, "transferManagementService"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "characteristicsOfType:", CFSTR("00000130-0000-1000-8000-4D69736D6574")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", 0));

  if (!v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError dkErrorWithCode:](NSError, "dkErrorWithCode:", 4));
    v4[2](v4, 0, v10);
LABEL_11:

    goto LABEL_12;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "value"));

  if (!v9)
  {
    v28 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
    if (objc_msgSend(v10, "count"))
    {
      v11 = self;
      v13 = sub_10007CCE4((uint64_t)v11, v12);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = sub_10007CD2C(v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController accessory](v11, "accessory"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
        *(_DWORD *)buf = 138543618;
        v25 = v16;
        v26 = 2112;
        v27 = v18;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Reading required transport characteristic for data stream controller %@", buf, 0x16u);

      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController accessory](v11, "accessory"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController workQueue](v11, "workQueue"));
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100088818;
      v22[3] = &unk_100238188;
      v23 = v4;
      objc_msgSend(v19, "readCharacteristicValues:timeout:completionQueue:completionHandler:", v10, v20, v22, 0.0);

      v21 = v23;
    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError dkErrorWithCode:](NSError, "dkErrorWithCode:", 4));
      v4[2](v4, 0, v21);
    }

    goto LABEL_11;
  }
  v4[2](v4, 0, 0);
LABEL_12:

}

- (void)_handleAccessoryConnected
{
  NSObject *v3;
  _BOOL8 v4;
  _BOOL8 v5;
  DataStreamController *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;

  v3 = objc_claimAutoreleasedReturnValue(-[DataStreamController workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = -[DataStreamController _isDataStreamConfigurationValid](self, "_isDataStreamConfigurationValid");
  v5 = -[DataStreamController canAcceptBulkSendListeners](self, "canAcceptBulkSendListeners");
  v6 = self;
  v8 = sub_10007CCE4((uint64_t)v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = sub_10007CD2C(v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController accessory](v6, "accessory"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "shortDescription"));
    v14 = HMFBooleanToString(v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = HMFBooleanToString(v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = 138544130;
    v19 = v11;
    v20 = 2112;
    v21 = v13;
    v22 = 2112;
    v23 = v15;
    v24 = 2112;
    v25 = v17;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Accessory with HDS service is connected: %@. Configured: %@ Accepts Bulk Send: %@", (uint8_t *)&v18, 0x2Au);

  }
}

- (void)handleAccessoryDisconnected:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  DataStreamController *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[DataStreamController workQueue](self, "workQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100088A28;
  v7[3] = &unk_100236AD0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)_getActiveProtocolWithName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[DataStreamController workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController defaultDataStream](self, "defaultDataStream"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "protocolWithName:", v4));

  return v7;
}

- (void)addBulkSendListener:(id)a3 fileType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  DataStreamController *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  _BOOL4 v21;
  __CFString *v22;
  void *v23;
  void *v24;
  DataStreamController *v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  __CFString *v30;
  void *v31;
  __CFString *v32;
  void *v33;
  __CFString *v34;
  void *v35;
  int v36;
  void *v37;
  __int16 v38;
  id v39;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController accessory](self, "accessory"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController defaultDataStream](self, "defaultDataStream"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[DataStreamBulkSendProtocol protocolName](DataStreamBulkSendProtocol, "protocolName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController _getActiveProtocolWithName:](self, "_getActiveProtocolWithName:", v10));

    v12 = v11;
    v14 = objc_opt_class(DataStreamBulkSendProtocol, v13);
    if ((objc_opt_isKindOfClass(v12, v14) & 1) != 0)
      v15 = v12;
    else
      v15 = 0;
    v16 = v15;

    v17 = self;
    v19 = sub_10007CCE4((uint64_t)v17, v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
    if (v16)
    {
      if (v21)
      {
        v22 = sub_10007CD2C(v17);
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        v36 = 138543618;
        v37 = v23;
        v38 = 2112;
        v39 = v7;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%{public}@Adding bulk-send listener on this stream for file-type '%@'", (uint8_t *)&v36, 0x16u);

      }
      objc_msgSend(v16, "addListener:fileType:", v6, v7);
    }
    else
    {
      if (v21)
      {
        v32 = sub_10007CD2C(v17);
        v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
        v36 = 138543618;
        v37 = v33;
        v38 = 2112;
        v39 = v7;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%{public}@Cancelling bulk-send listener registration for file-type '%@' due to no such protocol on this stream", (uint8_t *)&v36, 0x16u);

      }
      objc_msgSend(v6, "accessoryDidCloseDataStream:", v8);
    }

LABEL_17:
    goto LABEL_18;
  }
  -[DataStreamController _initiateStreamSetup](self, "_initiateStreamSetup");
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController setupInProgress](self, "setupInProgress"));

  v25 = self;
  v27 = sub_10007CCE4((uint64_t)v25, v26);
  v28 = objc_claimAutoreleasedReturnValue(v27);
  v29 = v28;
  if (v24)
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v30 = sub_10007CD2C(v25);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      v36 = 138543618;
      v37 = v31;
      v38 = 2112;
      v39 = v7;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%{public}@Add pending bulk-send listener registration for file-type '%@' (waiting for stream setup)", (uint8_t *)&v36, 0x16u);

    }
    v12 = (id)objc_claimAutoreleasedReturnValue(-[DataStreamController setupInProgress](v25, "setupInProgress"));
    objc_msgSend(v12, "addBulkSendListener:fileType:", v6, v7);
    goto LABEL_17;
  }
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v34 = sub_10007CD2C(v25);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    v36 = 138543618;
    v37 = v35;
    v38 = 2112;
    v39 = v7;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Canceling bulk-send listener registration for file-type '%@' due to no active data stream", (uint8_t *)&v36, 0x16u);

  }
  objc_msgSend(v6, "accessoryDidCloseDataStream:", v8);
LABEL_18:

}

- (void)removeBulkSendListener:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  DataStreamController *v8;
  uint64_t v9;
  uint64_t v10;
  DataStreamController *v11;
  NSObject *v12;
  DataStreamController *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  _BOOL4 v17;
  __CFString *v18;
  DataStreamController *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  uint64_t v23;
  id v24;
  _BOOL4 v25;
  __CFString *v26;
  const char *v27;
  __CFString *v28;
  DataStreamController *v29;
  uint64_t v30;
  id v31;
  __CFString *v32;
  __CFString *v33;
  void *v34;
  int v35;
  DataStreamController *v36;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController defaultDataStream](self, "defaultDataStream"));

  if (!v5)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController setupInProgress](self, "setupInProgress"));

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController setupInProgress](self, "setupInProgress"));
      v22 = objc_msgSend(v21, "removeBulkSendListener:", v4);

      v8 = self;
      v24 = sub_10007CCE4((uint64_t)v8, v23);
      v12 = objc_claimAutoreleasedReturnValue(v24);
      v25 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
      if (v22)
      {
        if (!v25)
          goto LABEL_22;
        v26 = sub_10007CD2C(v8);
        v13 = (DataStreamController *)objc_claimAutoreleasedReturnValue(v26);
        v35 = 138543362;
        v36 = v13;
        v27 = "%{public}@Removed pending bulk-send listener registration (waiting for stream setup)";
      }
      else
      {
        if (!v25)
          goto LABEL_22;
        v33 = sub_10007CD2C(v8);
        v13 = (DataStreamController *)objc_claimAutoreleasedReturnValue(v33);
        v35 = 138543362;
        v36 = v13;
        v27 = "%{public}@Removed bulk-send listener trivially (stream setting up, but this was not part of it)";
      }
    }
    else
    {
      v8 = self;
      v31 = sub_10007CCE4((uint64_t)v8, v30);
      v12 = objc_claimAutoreleasedReturnValue(v31);
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        goto LABEL_22;
      v32 = sub_10007CD2C(v8);
      v13 = (DataStreamController *)objc_claimAutoreleasedReturnValue(v32);
      v35 = 138543362;
      v36 = v13;
      v27 = "%{public}@Removed bulk-send listener trivially (nothing had started)";
    }
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, v27, (uint8_t *)&v35, 0xCu);
LABEL_21:

    goto LABEL_22;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[DataStreamBulkSendProtocol protocolName](DataStreamBulkSendProtocol, "protocolName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController _getActiveProtocolWithName:](self, "_getActiveProtocolWithName:", v6));

  v8 = v7;
  v10 = objc_opt_class(DataStreamBulkSendProtocol, v9);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
    v11 = v8;
  else
    v11 = 0;
  v12 = v11;

  v13 = self;
  v15 = sub_10007CCE4((uint64_t)v13, v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
  if (!v12)
  {
    if (v17)
    {
      v28 = sub_10007CD2C(v13);
      v29 = (DataStreamController *)objc_claimAutoreleasedReturnValue(v28);
      v35 = 138543362;
      v36 = v29;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%{public}@Removed bulk-send listener on this stream (but there was no protocol!?)", (uint8_t *)&v35, 0xCu);

    }
    goto LABEL_21;
  }
  if (v17)
  {
    v18 = sub_10007CD2C(v13);
    v19 = (DataStreamController *)objc_claimAutoreleasedReturnValue(v18);
    v35 = 138543362;
    v36 = v19;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%{public}@Removed bulk-send listener on this stream", (uint8_t *)&v35, 0xCu);

  }
  -[NSObject removeListener:](v12, "removeListener:", v4);
LABEL_22:

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController accessory](self, "accessory"));
  objc_msgSend(v4, "accessoryDidCloseDataStream:", v34);

}

- (void)sendTargetControlWhoAmIWithIdentifier:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  DataStreamController *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  __CFString *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  int v15;
  void *v16;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController defaultDataStream](self, "defaultDataStream"));

  v6 = self;
  v8 = sub_10007CCE4((uint64_t)v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v10)
    {
      v11 = sub_10007CD2C(v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v15 = 138543362;
      v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%{public}@Data Stream sending target-control whoami message", (uint8_t *)&v15, 0xCu);

    }
    v6 = (DataStreamController *)objc_claimAutoreleasedReturnValue(-[DataStreamController defaultDataStream](v6, "defaultDataStream"));
    v9 = objc_claimAutoreleasedReturnValue(-[DataStreamController protocolDelegateHandle](v6, "protocolDelegateHandle"));
    +[DataStreamTargetControlProtocol sendTargetControlWhoAmIWithIdentifier:dataStreamProtocolDelegate:](DataStreamTargetControlProtocol, "sendTargetControlWhoAmIWithIdentifier:dataStreamProtocolDelegate:", v3, v9);
  }
  else if (v10)
  {
    v13 = sub_10007CD2C(v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = 138543362;
    v16 = v14;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%{public}@Data Stream not running; dropping target-control whoami message",
      (uint8_t *)&v15,
      0xCu);

  }
}

- (void)openStreamSocketWithApplicationProtocol:(id)a3 completion:(id)a4
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
  v8 = objc_claimAutoreleasedReturnValue(-[DataStreamController workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100089538;
  block[3] = &unk_100237AD0;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)_processPendingSocketRequests
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController pendingSocketRequests](self, "pendingSocketRequests"));
  v4 = objc_msgSend(v3, "hmf_isEmpty");

  if ((v4 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController _getStreamProtocol](self, "_getStreamProtocol"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController pendingSocketRequests](self, "pendingSocketRequests", 0));
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
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "applicationProtocolName"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "completion"));
          -[DataStreamController _createStreamSocketWithStreamProtocol:applicationProtocolName:completion:](self, "_createStreamSocketWithStreamProtocol:applicationProtocolName:completion:", v5, v12, v13);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController pendingSocketRequests](self, "pendingSocketRequests"));
    objc_msgSend(v14, "removeAllObjects");

  }
}

- (void)_failPendingSocketRequestsWithError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController pendingSocketRequests](self, "pendingSocketRequests", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9), "completion"));
        ((void (**)(_QWORD, _QWORD, id))v10)[2](v10, 0, v4);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController pendingSocketRequests](self, "pendingSocketRequests"));
  objc_msgSend(v11, "removeAllObjects");

}

- (id)_getStreamProtocol
{
  void *v3;
  void *v4;
  DataStreamStreamProtocol *v5;
  uint64_t v6;
  uint64_t v7;
  DataStreamStreamProtocol *v8;
  DataStreamStreamProtocol *v9;
  DataStreamStreamProtocol *v10;
  DataStreamStreamProtocol *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DataStreamStreamProtocol protocolName](DataStreamStreamProtocol, "protocolName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController _getActiveProtocolWithName:](self, "_getActiveProtocolWithName:", v3));

  v5 = v4;
  v7 = objc_opt_class(DataStreamStreamProtocol, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
    v8 = v5;
  else
    v8 = 0;
  v9 = v8;

  v10 = v5;
  if (!v9)
  {
    v11 = [DataStreamStreamProtocol alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController defaultDataStream](self, "defaultDataStream"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "protocolDelegateHandle"));
    v10 = -[DataStreamStreamProtocol initWithDataStream:](v11, "initWithDataStream:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController defaultDataStream](self, "defaultDataStream"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[DataStreamStreamProtocol protocolName](DataStreamStreamProtocol, "protocolName"));
    objc_msgSend(v14, "addProtocol:name:", v10, v15);

  }
  return v10;
}

- (void)_createStreamSocketWithStreamProtocol:(id)a3 applicationProtocolName:(id)a4 completion:(id)a5
{
  id v8;
  DataStreamController *v9;
  void (**v10)(id, id, _QWORD);
  id v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  __CFString *v15;
  void *v16;
  DataStreamSocket *v17;
  void *v18;
  DataStreamSocket *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;

  v8 = a4;
  v9 = self;
  v10 = (void (**)(id, id, _QWORD))a5;
  v11 = a3;
  v13 = sub_10007CCE4((uint64_t)v9, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = sub_10007CD2C(v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v20 = 138543618;
    v21 = v16;
    v22 = 2112;
    v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%{public}@Creating stream socket for application protocol %@", (uint8_t *)&v20, 0x16u);

  }
  v17 = [DataStreamSocket alloc];
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController workQueue](v9, "workQueue"));
  v19 = -[DataStreamSocket initWithStreamProtocol:applicationProtocolName:workQueue:](v17, "initWithStreamProtocol:applicationProtocolName:workQueue:", v11, v8, v18);

  objc_msgSend(v11, "registerSocket:", v19);
  v10[2](v10, v19, 0);

}

- (BOOL)setupRequiresCharactertisticReads
{
  DataStreamController *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  __CFString *v7;
  void *v8;
  int v10;
  void *v11;

  if (-[DataStreamController _isDataStreamCapable](self, "_isDataStreamCapable"))
    return 0;
  if (!-[DataStreamController _isDataStreamConfigurationValid](self, "_isDataStreamConfigurationValid"))
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
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}@Current data stream configuration is not valid", (uint8_t *)&v10, 0xCu);

    }
  }
  return !-[DataStreamController _isDataStreamCapable](self, "_isDataStreamCapable");
}

- (void)_initiateStreamSetup
{
  void *v3;
  DataStreamController *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  __CFString *v8;
  void *v9;
  _BOOL8 v10;
  DataStreamController *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController setupInProgress](self, "setupInProgress"));

  if (v3)
  {
    v4 = self;
    v6 = sub_10007CCE4((uint64_t)v4, v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = sub_10007CD2C(v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v22 = 138543362;
      v23 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}@Initiating stream setup while already in progress; ignoring this extra call.",
        (uint8_t *)&v22,
        0xCu);
LABEL_11:

    }
  }
  else
  {
    v10 = -[DataStreamController setupRequiresCharactertisticReads](self, "setupRequiresCharactertisticReads");
    v4 = (DataStreamController *)objc_claimAutoreleasedReturnValue(-[DataStreamController accessory](self, "accessory"));
    v7 = objc_claimAutoreleasedReturnValue(-[DataStreamController transferManagementService](self, "transferManagementService"));
    if (-[DataStreamController supportsDataStreamOverHAP](self, "supportsDataStreamOverHAP") || v10)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController workQueue](self, "workQueue"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController logIdentifier](self, "logIdentifier"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[DataStreamSetupOperation hapSetupOperationWithAccessory:queue:logIdentifier:transferManagementService:maxControllerTransportMTU:setupOperationReadRequired:](DataStreamSetupOperation, "hapSetupOperationWithAccessory:queue:logIdentifier:transferManagementService:maxControllerTransportMTU:setupOperationReadRequired:", v4, v18, v19, v7, -[DataStreamController maxControllerTransportMTU](self, "maxControllerTransportMTU"), v10));
      -[DataStreamController setSetupInProgress:](self, "setSetupInProgress:", v20);

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController setupInProgress](self, "setupInProgress"));
      objc_msgSend(v21, "setDelegate:", self);

      if (!v10)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController setupInProgress](self, "setupInProgress"));
        objc_msgSend(v9, "startSetup");
        goto LABEL_11;
      }
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
        v22 = 138543362;
        v23 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to create new DataStream; not supported",
          (uint8_t *)&v22,
          0xCu);

      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError dkErrorWithCode:](NSError, "dkErrorWithCode:", 1));
      -[DataStreamController _cancelStreamTransportWithError:](v11, "_cancelStreamTransportWithError:", v17);

    }
  }

}

- (void)dataStreamInitializationSetupOperation:(id)a3 didCompleteSupportReadWithStatus:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  DataStreamController *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  __CFString *v12;
  void *v13;
  DataStreamController *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;

  v4 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[DataStreamController setupInProgress](self, "setupInProgress"));

  if (v7 != v6)
  {
    v8 = self;
    v10 = sub_10007CCE4((uint64_t)v8, v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = sub_10007CD2C(v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v21 = 138543362;
      v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}@Setup init operation succeeded however is no longer the current one; ignoring its result.",
        (uint8_t *)&v21,
        0xCu);

    }
    goto LABEL_9;
  }
  if (v4)
    -[DataStreamController _handleAccessoryConnected](self, "_handleAccessoryConnected");
  if (-[DataStreamController _isDataStreamCapable](self, "_isDataStreamCapable"))
  {
    objc_msgSend(v6, "setMaxControllerTransportMTU:", self->_maxControllerTransportMTU);
    v8 = (DataStreamController *)objc_claimAutoreleasedReturnValue(-[DataStreamController setupInProgress](self, "setupInProgress"));
    -[DataStreamController startSetup](v8, "startSetup");
LABEL_9:

    goto LABEL_10;
  }
  v14 = self;
  v16 = sub_10007CCE4((uint64_t)v14, v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = sub_10007CD2C(v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v21 = 138543362;
    v22 = v19;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%{public}@Canceling DataStream initialization setup (which is in progress)", (uint8_t *)&v21, 0xCu);

  }
  -[DataStreamController setSetupInProgress:](v14, "setSetupInProgress:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError dkErrorWithCode:](NSError, "dkErrorWithCode:", 4));
  -[DataStreamController _failPendingSocketRequestsWithError:](v14, "_failPendingSocketRequestsWithError:", v20);

LABEL_10:
}

- (void)dataStreamSetupOperation:(id)a3 didSucceedWithTransport:(id)a4 sessionEncryption:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  DataStreamController *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  __CFString *v16;
  void *v17;
  uint64_t (**v18)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[DataStreamController setupInProgress](self, "setupInProgress"));

  if (v11 == v10)
  {
    v18 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[DataStreamController dataStreamFactory](self, "dataStreamFactory"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController workQueue](self, "workQueue"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController logIdentifier](self, "logIdentifier"));
    v21 = ((uint64_t (**)(_QWORD, id, id, void *, void *))v18)[2](v18, v8, v9, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

    -[DataStreamController setDefaultDataStream:](self, "setDefaultDataStream:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController defaultDataStream](self, "defaultDataStream"));
    objc_msgSend(v23, "setDelegate:", self);

    objc_msgSend(v8, "setDelegate:", v22);
    -[DataStreamController _createBulkStreamProtocol](self, "_createBulkStreamProtocol");
    objc_msgSend(v22, "connect");
    -[DataStreamController setSetupInProgress:](self, "setSetupInProgress:", 0);

  }
  else
  {
    v12 = self;
    v14 = sub_10007CCE4((uint64_t)v12, v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = sub_10007CD2C(v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v24 = 138543362;
      v25 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%{public}@Setup operation succeeded however is no longer the current one; ignoring its result.",
        (uint8_t *)&v24,
        0xCu);

    }
  }

}

- (void)dataStreamSetupOperation:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  id v8;
  DataStreamController *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  __CFString *v13;
  void *v14;
  int v15;
  void *v16;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[DataStreamController setupInProgress](self, "setupInProgress"));

  if (v8 == v7)
  {
    v9 = self;
    v11 = sub_10007CCE4((uint64_t)v9, v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = sub_10007CD2C(v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = 138543362;
      v16 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}@Canceling DataStream setup (which is in progress)", (uint8_t *)&v15, 0xCu);

    }
    -[DataStreamController setSetupInProgress:](v9, "setSetupInProgress:", 0);
    -[DataStreamController _failPendingSocketRequestsWithError:](v9, "_failPendingSocketRequestsWithError:", v6);
  }

}

- (void)_cancelStreamTransportWithError:(id)a3
{
  id v4;
  void *v5;
  DataStreamController *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  __CFString *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController setupInProgress](self, "setupInProgress"));

  v6 = self;
  v8 = sub_10007CCE4((uint64_t)v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v10)
    {
      v11 = sub_10007CD2C(v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v17 = 138543362;
      v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%{public}@Canceling DataStream setup", (uint8_t *)&v17, 0xCu);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController setupInProgress](v6, "setupInProgress"));
    objc_msgSend(v13, "cancelSetup");

    -[DataStreamController _failPendingSocketRequestsWithError:](v6, "_failPendingSocketRequestsWithError:", v4);
    -[DataStreamController setSetupInProgress:](v6, "setSetupInProgress:", 0);
  }
  else
  {
    if (v10)
    {
      v14 = sub_10007CD2C(v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v17 = 138543362;
      v18 = v15;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%{public}@Canceling active DataStream", (uint8_t *)&v17, 0xCu);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController defaultDataStream](v6, "defaultDataStream"));
    objc_msgSend(v16, "invalidate");

  }
}

- (void)_createBulkStreamProtocol
{
  DataStreamBulkSendProtocol *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  DataStreamBulkSendProtocol *v12;

  v3 = [DataStreamBulkSendProtocol alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController workQueue](self, "workQueue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController accessory](self, "accessory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController logIdentifier](self, "logIdentifier"));
  v12 = -[DataStreamBulkSendProtocol initWithQueue:accessory:logIdentifier:](v3, "initWithQueue:accessory:logIdentifier:", v4, v5, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController defaultDataStream](self, "defaultDataStream"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[DataStreamBulkSendProtocol protocolName](DataStreamBulkSendProtocol, "protocolName"));
  objc_msgSend(v7, "addProtocol:name:", v12, v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController defaultDataStream](self, "defaultDataStream"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "protocolDelegateHandle"));
  -[DataStreamBulkSendProtocol setDataStream:](v12, "setDataStream:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController setupInProgress](self, "setupInProgress"));
  objc_msgSend(v11, "movePendingBulkSendListenersToBulkSendProtocol:", v12);

}

- (void)_resetDefaultDataStream
{
  id v3;

  -[DataStreamController setDefaultDataStream:](self, "setDefaultDataStream:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSError dkErrorWithCode:](NSError, "dkErrorWithCode:", 33));
  -[DataStreamController _failPendingSocketRequestsWithError:](self, "_failPendingSocketRequestsWithError:", v3);

}

- (void)dataStream:(id)a3 didFailWithError:(id)a4
{
  id v5;
  DataStreamController *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  __CFString *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;

  v5 = a4;
  v6 = self;
  v8 = sub_10007CCE4((uint64_t)v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = sub_10007CD2C(v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = 138543618;
    v13 = v11;
    v14 = 2112;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@DataStream failed with error (%@)!", (uint8_t *)&v12, 0x16u);

  }
  -[DataStreamController _resetDefaultDataStream](v6, "_resetDefaultDataStream");

}

- (void)dataStreamDidClose:(id)a3
{
  DataStreamController *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  __CFString *v7;
  void *v8;
  int v9;
  void *v10;

  v3 = self;
  v5 = sub_10007CCE4((uint64_t)v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = sub_10007CD2C(v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = 138543362;
    v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@DataStream closed", (uint8_t *)&v9, 0xCu);

  }
  -[DataStreamController _resetDefaultDataStream](v3, "_resetDefaultDataStream");
}

- (void)dataStreamDidOpen:(id)a3
{
  DataStreamController *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  __CFString *v7;
  void *v8;
  int v9;
  void *v10;

  v3 = self;
  v5 = sub_10007CCE4((uint64_t)v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = sub_10007CD2C(v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = 138543362;
    v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@DataStream opened", (uint8_t *)&v9, 0xCu);

  }
  -[DataStreamController _processPendingSocketRequests](v3, "_processPendingSocketRequests");
}

- (void)dataStreamDidReceiveRawFrame:(id)a3
{
  DataStreamController *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  __CFString *v7;
  void *v8;
  int v9;
  void *v10;

  v3 = self;
  v5 = sub_10007CCE4((uint64_t)v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = sub_10007CD2C(v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = 138543362;
    v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@dataStreamDidReceiveRawFrame", (uint8_t *)&v9, 0xCu);

  }
}

- (void)dataStreamDidUpdateActiveStatus:(id)a3
{
  NSObject *v4;
  void *v5;
  unsigned int v6;

  v4 = objc_claimAutoreleasedReturnValue(-[DataStreamController workQueue](self, "workQueue", a3));
  dispatch_assert_queue_V2(v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController defaultDataStream](self, "defaultDataStream"));
  v6 = objc_msgSend(v5, "isActive");

  if (v6)
    -[DataStreamController _stopIdleTimer](self, "_stopIdleTimer");
  else
    -[DataStreamController _startIdleTimer](self, "_startIdleTimer");
}

- (void)openBulkSendSessionForFileType:(id)a3 reason:(id)a4 metadata:(id)a5 queue:(id)a6 callback:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = objc_claimAutoreleasedReturnValue(-[DataStreamController workQueue](self, "workQueue"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10008AC60;
  v23[3] = &unk_1002381B0;
  v23[4] = self;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v18 = v15;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  v22 = v16;
  dispatch_async(v17, v23);

}

- (void)invalidate
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[DataStreamController workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008AE58;
  block[3] = &unk_100236AA8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_startIdleTimer
{
  NSObject *v3;
  DataStreamController *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;

  v3 = objc_claimAutoreleasedReturnValue(-[DataStreamController workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v3);

  -[DataStreamController _stopIdleTimer](self, "_stopIdleTimer");
  v4 = self;
  v6 = sub_10007CCE4((uint64_t)v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = sub_10007CD2C(v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v21 = 138543362;
    v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@Starting idle timer", (uint8_t *)&v21, 0xCu);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[HMFPreferences sharedPreferences](HMFPreferences, "sharedPreferences"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "preferenceForKey:", CFSTR("hdsIdleTimeout")));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "numberValue"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "numberValue"));
    objc_msgSend(v13, "doubleValue");
    v15 = v14;

  }
  else
  {
    v15 = 5.0;
  }
  v16 = objc_msgSend(objc_alloc((Class)HMFTimer), "initWithTimeInterval:options:", 1, v15);
  -[DataStreamController setIdleTimer:](v4, "setIdleTimer:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController idleTimer](v4, "idleTimer"));
  objc_msgSend(v17, "setDelegate:", v4);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController workQueue](v4, "workQueue"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController idleTimer](v4, "idleTimer"));
  objc_msgSend(v19, "setDelegateQueue:", v18);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController idleTimer](v4, "idleTimer"));
  objc_msgSend(v20, "resume");

}

- (void)_stopIdleTimer
{
  NSObject *v3;
  void *v4;
  DataStreamController *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;

  v3 = objc_claimAutoreleasedReturnValue(-[DataStreamController workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController idleTimer](self, "idleTimer"));
  if (v4)
  {
    v5 = self;
    v7 = sub_10007CCE4((uint64_t)v5, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = sub_10007CD2C(v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v12 = 138543362;
      v13 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@Stopping idle timer", (uint8_t *)&v12, 0xCu);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController idleTimer](v5, "idleTimer"));
    objc_msgSend(v11, "suspend");

    -[DataStreamController setIdleTimer:](v5, "setIdleTimer:", 0);
  }
}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  DataStreamController *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  const __CFString *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  const __CFString *v22;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[DataStreamController workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[DataStreamController idleTimer](self, "idleTimer"));
  if (v6 == v4)
  {
    v7 = self;
    v9 = sub_10007CCE4((uint64_t)v7, v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = sub_10007CD2C(v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController defaultDataStream](v7, "defaultDataStream"));
      v14 = objc_msgSend(v13, "isActive");
      v15 = CFSTR("inactive");
      if (v14)
        v15 = CFSTR("active");
      v19 = 138543618;
      v20 = v12;
      v21 = 2112;
      v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}@Idle timer fired and data stream is %@", (uint8_t *)&v19, 0x16u);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController defaultDataStream](v7, "defaultDataStream"));
    v17 = objc_msgSend(v16, "isActive");

    if ((v17 & 1) == 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamController defaultDataStream](v7, "defaultDataStream"));
      objc_msgSend(v18, "close");

    }
    -[DataStreamController _stopIdleTimer](v7, "_stopIdleTimer");
  }
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (HAPAccessory)accessory
{
  return (HAPAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (void)setAccessory:(id)a3
{
  objc_storeWeak((id *)&self->_accessory, a3);
}

- (HAPService)transferManagementService
{
  return (HAPService *)objc_loadWeakRetained((id *)&self->_transferManagementService);
}

- (void)setTransferManagementService:(id)a3
{
  objc_storeWeak((id *)&self->_transferManagementService, a3);
}

- (DataStream)defaultDataStream
{
  return self->_defaultDataStream;
}

- (void)setDefaultDataStream:(id)a3
{
  objc_storeStrong((id *)&self->_defaultDataStream, a3);
}

- (NSMutableArray)pendingSocketRequests
{
  return self->_pendingSocketRequests;
}

- (void)setPendingSocketRequests:(id)a3
{
  objc_storeStrong((id *)&self->_pendingSocketRequests, a3);
}

- (DataStreamSetupOperation)setupInProgress
{
  return self->_setupInProgress;
}

- (void)setSetupInProgress:(id)a3
{
  objc_storeStrong((id *)&self->_setupInProgress, a3);
}

- (id)dataStreamFactory
{
  return self->_dataStreamFactory;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (BOOL)supportsDataStreamOverHAP
{
  return self->_supportsDataStreamOverHAP;
}

- (void)setSupportsDataStreamOverHAP:(BOOL)a3
{
  self->_supportsDataStreamOverHAP = a3;
}

- (unint64_t)maxControllerTransportMTU
{
  return self->_maxControllerTransportMTU;
}

- (void)setMaxControllerTransportMTU:(unint64_t)a3
{
  self->_maxControllerTransportMTU = a3;
}

- (HMFTimer)idleTimer
{
  return self->_idleTimer;
}

- (void)setIdleTimer:(id)a3
{
  objc_storeStrong((id *)&self->_idleTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong(&self->_dataStreamFactory, 0);
  objc_storeStrong((id *)&self->_setupInProgress, 0);
  objc_storeStrong((id *)&self->_pendingSocketRequests, 0);
  objc_storeStrong((id *)&self->_defaultDataStream, 0);
  objc_destroyWeak((id *)&self->_transferManagementService);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
