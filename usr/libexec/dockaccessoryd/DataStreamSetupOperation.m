@implementation DataStreamSetupOperation

+ (id)hapSetupOperationWithAccessory:(id)a3 queue:(id)a4 logIdentifier:(id)a5 transferManagementService:(id)a6 maxControllerTransportMTU:(unint64_t)a7 setupOperationReadRequired:(BOOL)a8
{
  _BOOL8 v8;
  id v13;
  id v14;
  id v15;
  id v16;
  DataStreamHAPSetupOperation *v17;

  v8 = a8;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = -[DataStreamHAPSetupOperation initWithAccessory:queue:logIdentifier:transferManagementService:maxControllerTransportMTU:setupOperationReadRequired:]([DataStreamHAPSetupOperation alloc], "initWithAccessory:queue:logIdentifier:transferManagementService:maxControllerTransportMTU:setupOperationReadRequired:", v16, v15, v14, v13, a7, v8);

  return v17;
}

- (DataStreamSetupOperation)initWithAccessory:(id)a3 queue:(id)a4 logIdentifier:(id)a5 transferManagementService:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  DataStreamSetupOperation *v15;
  DataStreamSetupOperation *v16;
  uint64_t v17;
  NSMutableSet *pendingBulkSendListeners;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)DataStreamSetupOperation;
  v15 = -[DataStreamSetupOperation init](&v20, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accessory, a3);
    objc_storeStrong((id *)&v16->_queue, a4);
    objc_storeStrong((id *)&v16->_logIdentifier, a5);
    objc_storeStrong((id *)&v16->_transferManagementService, a6);
    v17 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    pendingBulkSendListeners = v16->_pendingBulkSendListeners;
    v16->_pendingBulkSendListeners = (NSMutableSet *)v17;

  }
  return v16;
}

- (void)dealloc
{
  objc_super v3;

  -[DataStreamSetupOperation _clearPendingBulkSendListeners](self, "_clearPendingBulkSendListeners");
  v3.receiver = self;
  v3.super_class = (Class)DataStreamSetupOperation;
  -[DataStreamSetupOperation dealloc](&v3, "dealloc");
}

- (void)postDidFailWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[DataStreamSetupOperation queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002E11C;
  v7[3] = &unk_100236AD0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)postDidSucceedWithTransport:(id)a3 sessionEncryption:(id)a4
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
  v8 = objc_claimAutoreleasedReturnValue(-[DataStreamSetupOperation queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E218;
  block[3] = &unk_100236EA8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)continueStreamSetupWithResponse:(id)a3
{
  id v4;
  DataStreamSetupOperation *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  id v20;
  void *v21;
  DataStreamSetupOperation *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  DataStreamSetupOperation *v30;
  uint64_t v31;
  id v32;
  NSObject *v33;
  __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  DataStreamSetupOperation *v43;
  uint64_t v44;
  id v45;
  NSObject *v46;
  __CFString *v47;
  void *v48;
  void *v49;
  DataStreamSetupOperation *v50;
  uint64_t v51;
  id v52;
  NSObject *v53;
  __CFString *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  id v58;
  NSObject *v59;
  __CFString *v60;
  void *v61;
  void *v62;
  __CFString *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  id v67;
  __CFString *v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  id v77;
  _BYTE v78[128];

  v4 = a3;
  v5 = self;
  v7 = sub_10007CCE4((uint64_t)v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = sub_10007CD2C(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    *(_DWORD *)buf = 138543362;
    v75 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}@[Start Stream] Parsing accessory response", buf, 0xCu);

  }
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v11 = v4;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v71;
LABEL_5:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v71 != v14)
        objc_enumerationMutation(v11);
      v16 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "characteristic"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "type"));
      v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("00000131-0000-1000-8000-4D69736D6574"));

      if ((v19 & 1) != 0)
        break;
      if (v13 == (id)++v15)
      {
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
        if (v13)
          goto LABEL_5;
        goto LABEL_11;
      }
    }
    v20 = v16;

    if (!v20)
      goto LABEL_17;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "error"));

    if (v21)
    {
      v22 = v5;
      v24 = sub_10007CCE4((uint64_t)v22, v23);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = sub_10007CD2C(v22);
        v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "error"));
        *(_DWORD *)buf = 138543618;
        v75 = v27;
        v76 = 2112;
        v77 = v28;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%{public}@[Start Stream] The setup transfer write reply errored out: %@", buf, 0x16u);

      }
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "error"));
      -[DataStreamSetupOperation postDidFailWithError:](v22, "postDidFailWithError:", v29);

      goto LABEL_20;
    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "value"));
    v69 = 0;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[HAPDataStreamTransportSetupResponse parsedFromData:error:](HAPDataStreamTransportSetupResponse, "parsedFromData:error:", v36, &v69));
    v38 = v69;

    if (v38 || !v37)
    {
      v43 = v5;
      v45 = sub_10007CCE4((uint64_t)v43, v44);
      v46 = objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v47 = sub_10007CD2C(v43);
        v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
        *(_DWORD *)buf = 138543618;
        v75 = v48;
        v76 = 2112;
        v77 = v38;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%{public}@[Start Stream] The setup transfer write reply could not be parsed (error=%@)", buf, 0x16u);

      }
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSError dkErrorWithCode:](NSError, "dkErrorWithCode:", 36));
      -[DataStreamSetupOperation postDidFailWithError:](v43, "postDidFailWithError:", v49);

      goto LABEL_42;
    }
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "status"));

    if (!v39)
    {
      v50 = v5;
      v52 = sub_10007CCE4((uint64_t)v50, v51);
      v53 = objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        v54 = sub_10007CD2C(v50);
        v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
        *(_DWORD *)buf = 138543362;
        v75 = v55;
        v56 = "%{public}@[Start Stream] The setup transfer write reply did not have status";
LABEL_32:
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, v56, buf, 0xCu);

      }
LABEL_33:

      v38 = (id)objc_claimAutoreleasedReturnValue(+[NSError dkErrorWithCode:](NSError, "dkErrorWithCode:", 36));
LABEL_41:
      -[DataStreamSetupOperation postDidFailWithError:](v50, "postDidFailWithError:", v38);
LABEL_42:

LABEL_43:
      goto LABEL_20;
    }
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "status"));
    v41 = objc_msgSend(v40, "value");
    if (v41 == (id)1)
    {
      v42 = 10;
    }
    else
    {
      if (v41 != (id)2)
      {
        v38 = 0;
LABEL_37:

        if (v38)
        {
          v50 = v5;
          v58 = sub_10007CCE4((uint64_t)v50, v57);
          v59 = objc_claimAutoreleasedReturnValue(v58);
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
            v60 = sub_10007CD2C(v50);
            v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
            v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "status"));
            v63 = HAPDataStreamTransportCommandStatusAsString((unint64_t)objc_msgSend(v62, "value"));
            v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
            *(_DWORD *)buf = 138543618;
            v75 = v61;
            v76 = 2112;
            v77 = v64;
            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "%{public}@[Start Stream] The setup transfer write failed with status %@", buf, 0x16u);

          }
          goto LABEL_41;
        }
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "parameters"));

        if (v65)
        {
          -[DataStreamSetupOperation processTransportSetupResponse:](v5, "processTransportSetupResponse:", v37);
          goto LABEL_43;
        }
        v50 = v5;
        v67 = sub_10007CCE4((uint64_t)v50, v66);
        v53 = objc_claimAutoreleasedReturnValue(v67);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          v68 = sub_10007CD2C(v50);
          v55 = (void *)objc_claimAutoreleasedReturnValue(v68);
          *(_DWORD *)buf = 138543362;
          v75 = v55;
          v56 = "%{public}@[Start Stream] The setup transfer write reply did not contain setup parameters";
          goto LABEL_32;
        }
        goto LABEL_33;
      }
      v42 = 21;
    }
    v38 = (id)objc_claimAutoreleasedReturnValue(+[NSError dkErrorWithCode:](NSError, "dkErrorWithCode:", v42));
    goto LABEL_37;
  }
LABEL_11:

LABEL_17:
  v30 = v5;
  v32 = sub_10007CCE4((uint64_t)v30, v31);
  v33 = objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    v34 = sub_10007CD2C(v30);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    *(_DWORD *)buf = 138543362;
    v75 = v35;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%{public}@[Start Stream] The setup transfer write reply does not contain a response", buf, 0xCu);

  }
  v20 = (id)objc_claimAutoreleasedReturnValue(+[NSError dkErrorWithCode:](NSError, "dkErrorWithCode:", 36));
  -[DataStreamSetupOperation postDidFailWithError:](v30, "postDidFailWithError:", v20);
LABEL_20:

}

- (void)_clearPendingBulkSendListeners
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
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
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamSetupOperation pendingBulkSendListeners](self, "pendingBulkSendListeners", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v7), "listener"));
        if (v8)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamSetupOperation accessory](self, "accessory"));
          objc_msgSend(v8, "accessoryDidCloseDataStream:", v9);

        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamSetupOperation pendingBulkSendListeners](self, "pendingBulkSendListeners"));
  objc_msgSend(v10, "removeAllObjects");

}

- (void)startSetup
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[DataStreamSetupOperation startSetup]"));
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, v2, 0));

  objc_exception_throw(v3);
}

- (void)processTransportSetupResponse:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[DataStreamSetupOperation processTransportSetupResponse:]"));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, v4, 0));

  objc_exception_throw(v5);
}

- (void)addBulkSendListener:(id)a3 fileType:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  DKPendingBulkSendListener *v10;

  v6 = a4;
  v7 = a3;
  v8 = objc_claimAutoreleasedReturnValue(-[DataStreamSetupOperation queue](self, "queue"));
  dispatch_assert_queue_V2(v8);

  v10 = -[DKPendingBulkSendListener initWithListener:fileType:]([DKPendingBulkSendListener alloc], "initWithListener:fileType:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamSetupOperation pendingBulkSendListeners](self, "pendingBulkSendListeners"));
  objc_msgSend(v9, "addObject:", v10);

}

- (BOOL)removeBulkSendListener:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  BOOL v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[DataStreamSetupOperation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamSetupOperation pendingBulkSendListeners](self, "pendingBulkSendListeners", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "listener"));

        if (v12 == v4)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamSetupOperation pendingBulkSendListeners](self, "pendingBulkSendListeners"));
          objc_msgSend(v14, "removeObject:", v11);

          v13 = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (void)movePendingBulkSendListenersToBulkSendProtocol:(id)a3
{
  id v4;
  NSObject *v5;
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
  v5 = objc_claimAutoreleasedReturnValue(-[DataStreamSetupOperation queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamSetupOperation pendingBulkSendListeners](self, "pendingBulkSendListeners", 0));
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
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "listener"));
        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fileType"));
          objc_msgSend(v4, "addListener:fileType:", v12, v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamSetupOperation pendingBulkSendListeners](self, "pendingBulkSendListeners"));
  objc_msgSend(v14, "removeAllObjects");

}

- (DataStreamSetupOperationDelegate)delegate
{
  return (DataStreamSetupOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HAPAccessory)accessory
{
  return self->_accessory;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (HAPService)transferManagementService
{
  return self->_transferManagementService;
}

- (NSMutableSet)pendingBulkSendListeners
{
  return self->_pendingBulkSendListeners;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingBulkSendListeners, 0);
  objc_storeStrong((id *)&self->_transferManagementService, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
