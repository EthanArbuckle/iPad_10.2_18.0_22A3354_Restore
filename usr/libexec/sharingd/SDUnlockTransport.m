@implementation SDUnlockTransport

- (SDUnlockTransport)init
{
  SDUnlockTransport *v2;
  uint64_t v3;
  NSMutableDictionary *completionHandlersByMessageIdentifier;
  uint64_t v5;
  NSMutableDictionary *sendDatesByMessageIdentifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SDUnlockTransport;
  v2 = -[SDUnlockTransport init](&v8, "init");
  v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  completionHandlersByMessageIdentifier = v2->_completionHandlersByMessageIdentifier;
  v2->_completionHandlersByMessageIdentifier = (NSMutableDictionary *)v3;

  v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  sendDatesByMessageIdentifier = v2->_sendDatesByMessageIdentifier;
  v2->_sendDatesByMessageIdentifier = (NSMutableDictionary *)v5;

  return v2;
}

- (id)dataFromUUID:(id)a3
{
  _QWORD v4[2];

  v4[0] = 0;
  v4[1] = 0;
  objc_msgSend(a3, "getUUIDBytes:", v4);
  return (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v4, 16));
}

- (id)transferDataFromPayload:(id)a3 sessionID:(id)a4
{
  id v6;
  id v7;
  SDAutoUnlockSessionWrapper *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_new(SDAutoUnlockSessionWrapper);
  -[SDAutoUnlockSessionWrapper setVersion:](v8, "setVersion:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockTransport dataFromUUID:](self, "dataFromUUID:", v6));

  -[SDAutoUnlockSessionWrapper setSessionID:](v8, "setSessionID:", v9);
  -[SDAutoUnlockSessionWrapper setPayload:](v8, "setPayload:", v7);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionWrapper data](v8, "data"));
  return v10;
}

- (id)activeDevice
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockTransport autoUnlockService](self, "autoUnlockService", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "devices"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "isActive"))
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)idsDeviceForUniqueID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned int v12;
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockTransport autoUnlockService](self, "autoUnlockService", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "devices"));

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
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uniqueIDOverride"));
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
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

- (id)sendAutoUnlockPayload:(id)a3 toDevice:(id)a4 type:(unsigned __int16)a5 sessionID:(id)a6 queueOneID:(id)a7 timeout:(id)a8 completion:(id)a9
{
  uint64_t v12;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  unsigned int v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void **v26;
  NSObject *v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  id v43;
  uint64_t v44;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  id v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  uint8_t buf[4];
  id v64;
  __int16 v65;
  id v66;
  void *v67;
  void *v68;

  v12 = a5;
  v15 = a4;
  v16 = a6;
  v17 = v15;
  v18 = v16;
  v19 = a7;
  v60 = a8;
  v57 = a9;
  v58 = v18;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockTransport transferDataFromPayload:sessionID:](self, "transferDataFromPayload:sessionID:", a3, v18));
  v20 = objc_msgSend(v17, "isEqualToString:", IDSDefaultPairedDevice);
  if (v20)
  {
    v21 = objc_claimAutoreleasedReturnValue(-[SDUnlockTransport activeDevice](self, "activeDevice"));
    v22 = (void *)v21;
    if (!v21)
    {
      v28 = 0;
      v29 = v60;
      goto LABEL_12;
    }
    v23 = v19;
    v24 = (void *)IDSCopyIDForDevice(v21);
    v25 = objc_alloc((Class)NSMutableSet);
    v68 = v24;
    v26 = &v68;
  }
  else
  {
    v23 = v19;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockTransport idsDeviceForUniqueID:](self, "idsDeviceForUniqueID:", v17));
    v24 = (void *)((uint64_t (*)(void))IDSCopyIDForDevice)();
    if (!v24)
    {
      v30 = auto_unlock_log(0);
      v27 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        sub_1001A7430();
      v28 = 0;
      goto LABEL_11;
    }
    v25 = objc_alloc((Class)NSMutableSet);
    v67 = v24;
    v26 = &v67;
  }
  v27 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 1));
  v28 = objc_msgSend(v25, "initWithArray:", v27);
LABEL_11:
  v29 = v60;

  v19 = v23;
LABEL_12:

  if (v28)
  {
    v32 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v33 = v32;
    if (v29)
    {
      -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v29, IDSSendMessageOptionTimeoutKey);
    }
    else
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", IDSMaxMessageTimeout));
      -[NSObject setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", v39, IDSSendMessageOptionTimeoutKey);

    }
    -[NSObject setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, IDSSendMessageOptionEnforceRemoteTimeoutsKey);
    if (v19)
      -[NSObject setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", v19, IDSSendMessageOptionQueueOneIdentifierKey);
    v56 = v19;
    if (v20)
      -[NSObject setObject:forKeyedSubscript:](v33, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, IDSSendMessageOptionForceLocalDeliveryKey);
    -[SDUnlockTransport updateSendOptions:](self, "updateSendOptions:", v33);
    v40 = objc_msgSend(objc_alloc((Class)IDSProtobuf), "initWithProtobufData:type:isResponse:", v59, v12, 0);
    v41 = v12;
    kdebug_trace(725287032, v12, 0, 0, 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockTransport autoUnlockService](self, "autoUnlockService"));
    v61 = 0;
    v62 = 0;
    v55 = v40;
    LODWORD(v40) = objc_msgSend(v42, "sendProtobuf:toDestinations:priority:options:identifier:error:", v40, v28, 300, v33, &v62, &v61);
    v35 = v62;
    v36 = v61;

    v38 = v58;
    v43 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("type: %d, sessionID: %ld, destinations: %@"), v41, v58, v28);
    v44 = auto_unlock_log(v43);
    v45 = objc_claimAutoreleasedReturnValue(v44);
    v46 = v45;
    if ((_DWORD)v40)
    {
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v64 = v43;
        v65 = 2112;
        v66 = v35;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Sending %@, identifier: %@", buf, 0x16u);
      }

      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockTransport sendDatesByMessageIdentifier](self, "sendDatesByMessageIdentifier"));
      objc_msgSend(v48, "setObject:forKeyedSubscript:", v47, v35);

      v37 = v57;
      if (v57)
      {
        v54 = v43;
        v49 = objc_msgSend(v57, "copy");
        v50 = objc_retainBlock(v49);
        v51 = v17;
        v52 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockTransport completionHandlersByMessageIdentifier](self, "completionHandlersByMessageIdentifier"));
        objc_msgSend(v52, "setObject:forKeyedSubscript:", v50, v35);

        v17 = v51;
        v38 = v58;

        v43 = v54;
      }
      -[SDUnlockTransport handleSuccessfulMessageSentWithIdentifier:sessionID:](self, "handleSuccessfulMessageSentWithIdentifier:sessionID:", v35, v38);
    }
    else
    {
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        sub_1001A73CC();

      v37 = v57;
      if (v57)
        (*((void (**)(id, _QWORD, id))v57 + 2))(v57, 0, v36);
    }

    v19 = v56;
    v29 = v60;
  }
  else
  {
    v34 = auto_unlock_log(v31);
    v33 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v64 = v17;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "No destinations for device ID: %@", buf, 0xCu);
    }
    v35 = 0;
    v36 = 0;
    v37 = v57;
    v38 = v58;
  }

  return v35;
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  _BOOL8 v8;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  const __CFString *v15;
  NSDate *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  void *v23;
  int v24;
  const __CFString *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  id v31;

  v8 = a6;
  v10 = a5;
  v11 = a7;
  v12 = kdebug_trace(725287036, 0, 0, 0, 0);
  v13 = auto_unlock_log(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    if (v8)
      v15 = CFSTR("YES");
    else
      v15 = CFSTR("NO");
    v16 = objc_opt_new(NSDate);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockTransport sendDatesByMessageIdentifier](self, "sendDatesByMessageIdentifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v10));
    -[NSDate timeIntervalSinceDate:](v16, "timeIntervalSinceDate:", v18);
    v24 = 138413058;
    v25 = v15;
    v26 = 2112;
    v27 = v10;
    v28 = 2048;
    v29 = v19;
    v30 = 2112;
    v31 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "success = %@, identifier = %@, time = %.2f, error = %@", (uint8_t *)&v24, 0x2Au);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockTransport sendDatesByMessageIdentifier](self, "sendDatesByMessageIdentifier"));
  objc_msgSend(v20, "removeObjectForKey:", v10);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockTransport completionHandlersByMessageIdentifier](self, "completionHandlersByMessageIdentifier"));
  v22 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", v10));

  if (v22)
  {
    ((void (**)(_QWORD, _BOOL8, id))v22)[2](v22, v8, v11);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDUnlockTransport completionHandlersByMessageIdentifier](self, "completionHandlersByMessageIdentifier"));
    objc_msgSend(v23, "removeObjectForKey:", v10);

  }
}

- (IDSService)autoUnlockService
{
  return self->_autoUnlockService;
}

- (NSMutableDictionary)completionHandlersByMessageIdentifier
{
  return self->_completionHandlersByMessageIdentifier;
}

- (NSMutableDictionary)sendDatesByMessageIdentifier
{
  return self->_sendDatesByMessageIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendDatesByMessageIdentifier, 0);
  objc_storeStrong((id *)&self->_completionHandlersByMessageIdentifier, 0);
  objc_storeStrong((id *)&self->_autoUnlockService, 0);
}

@end
