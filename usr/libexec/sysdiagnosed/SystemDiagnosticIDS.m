@implementation SystemDiagnosticIDS

+ (void)setTestingMode:(BOOL)a3
{
  _BOOL4 v3;
  _DWORD v4[2];

  v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Setting IDS testing mode to %d", (uint8_t *)v4, 8u);
  }
  byte_1000B9948 = v3;
}

+ (id)sharedInstance
{
  uint8_t v3[16];

  if (byte_1000B9948)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IDS testing mode enabled, return nil for object", v3, 2u);
    }
    return 0;
  }
  else
  {
    if (qword_1000B9958 != -1)
      dispatch_once(&qword_1000B9958, &stru_10009A140);
    return (id)qword_1000B9950;
  }
}

+ (id)getIDSCaseString:(int)a3
{
  if (a3 > 5)
    return CFSTR("Invalid SD_IDSCase");
  else
    return (id)*((_QWORD *)&off_10009A1A0 + a3);
}

+ (id)getIDSCommandString:(int)a3
{
  if (a3 > 9)
    return CFSTR("Invalid IDSCommand");
  else
    return (id)*((_QWORD *)&off_10009A1D0 + a3);
}

- (SystemDiagnosticIDS)init
{
  SystemDiagnosticIDS *v3;
  IDSService *v4;
  IDSService *service;
  dispatch_queue_t v6;
  OS_dispatch_queue *run_queue;
  NSObject *v8;
  dispatch_queue_global_t global_queue;
  NSObject *v10;
  uint64_t v11;
  NSMutableDictionary *localGroupDictionary;
  uint64_t v13;
  NSMutableDictionary *localTupleDictionary;
  uint64_t v15;
  NSMutableDictionary *executionGroupDictionary;
  NSObject *v17;
  void *v18;
  SystemDiagnosticIDS *v19;
  uint8_t v21[8];
  _QWORD block[4];
  SystemDiagnosticIDS *v23;
  objc_super v24;

  if (objc_opt_class(IDSService, a2))
  {
    v24.receiver = self;
    v24.super_class = (Class)SystemDiagnosticIDS;
    v3 = -[SystemDiagnosticIDS init](&v24, "init");
    if (v3)
    {
      v4 = (IDSService *)objc_msgSend(objc_alloc((Class)IDSService), "initWithService:", CFSTR("com.apple.private.alloy.sysdiagnose"));
      service = v3->_service;
      v3->_service = v4;

      if (!v3->_service)
        sub_1000628A0();
      v6 = dispatch_queue_create("com.apple.sysdiagnose.idsqueue", 0);
      run_queue = v3->_run_queue;
      v3->_run_queue = (OS_dispatch_queue *)v6;

      v8 = v3->_run_queue;
      global_queue = dispatch_get_global_queue(2, 0);
      v10 = objc_claimAutoreleasedReturnValue(global_queue);
      dispatch_set_target_queue(v8, v10);

      v11 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      localGroupDictionary = v3->_localGroupDictionary;
      v3->_localGroupDictionary = (NSMutableDictionary *)v11;

      v13 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      localTupleDictionary = v3->_localTupleDictionary;
      v3->_localTupleDictionary = (NSMutableDictionary *)v13;

      v15 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      executionGroupDictionary = v3->_executionGroupDictionary;
      v3->_executionGroupDictionary = (NSMutableDictionary *)v15;

      v17 = v3->_run_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10005B10C;
      block[3] = &unk_100098F88;
      v23 = v3;
      dispatch_async(v17, block);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IDS service initialized.", v21, 2u);
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v18, "log:", CFSTR("IDS service initialized."));

    }
    self = v3;
    v19 = self;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)isPaired
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_service, "devices", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "isDefaultPairedDevice"))
        {
          if (objc_msgSend(v6, "isActive"))
            LOBYTE(v3) = objc_msgSend(v6, "isConnected");
          else
            LOBYTE(v3) = 0;
          goto LABEL_13;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_13:

  return (char)v3;
}

- (id)getDispatchGroupForDiagnostic:(id)a3
{
  NSMutableDictionary *localGroupDictionary;

  localGroupDictionary = self->_localGroupDictionary;
  if (localGroupDictionary)
    localGroupDictionary = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](localGroupDictionary, "objectForKey:", a3));
  return localGroupDictionary;
}

- (void)setPreferredWifi:(BOOL)a3
{
  -[IDSService setPreferInfraWiFi:](self->_service, "setPreferInfraWiFi:", a3);
}

- (BOOL)sendFileAtPath:(id)a3 forDiagnosticID:(id)a4 withCase:(int)a5
{
  return 0;
}

- (BOOL)sendMessage:(int)a3 WithString:(id)a4
{
  uint64_t v4;
  void *v6;

  if (!a4)
    return 0;
  v4 = *(_QWORD *)&a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "dataUsingEncoding:", 4));
  LOBYTE(v4) = -[SystemDiagnosticIDS sendMessage:WithData:](self, "sendMessage:WithData:", v4, v6);

  return v4;
}

- (BOOL)sendMessage:(int)a3 WithData:(id)a4
{
  BOOL v4;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  IDSService *service;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;
  _UNKNOWN **v23;

  v4 = 0;
  if (a3 && self->_service)
  {
    v6 = *(_QWORD *)&a3;
    v22 = IDSSendMessageOptionTimeoutKey;
    v23 = &off_1000AD010;
    v7 = a4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
    v9 = objc_msgSend(objc_alloc((Class)IDSProtobuf), "initWithProtobufData:type:isResponse:", v7, (unsigned __int16)v6, 0);

    service = self->_service;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", IDSDefaultPairedDevice));
    v18 = 0;
    v19 = 0;
    -[IDSService sendProtobuf:toDestinations:priority:options:identifier:error:](service, "sendProtobuf:toDestinations:priority:options:identifier:error:", v9, v11, 300, v8, &v19, &v18);
    v12 = v19;
    v13 = v18;

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS getIDSCommandString:](SystemDiagnosticIDS, "getIDSCommandString:", v6));
      *(_DWORD *)buf = 138412290;
      v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IDS sendMessage: %@", buf, 0xCu);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS getIDSCommandString:](SystemDiagnosticIDS, "getIDSCommandString:", v6));
    objc_msgSend(v15, "log:", CFSTR("IDS sendMessage: %@"), v16);

    v4 = objc_msgSend(v12, "length") != 0;
  }
  return v4;
}

- (BOOL)sendFilenamePair:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0));
  LOBYTE(self) = -[SystemDiagnosticIDS sendMessage:WithData:](self, "sendMessage:WithData:", 5, v4);

  return (char)self;
}

- (id)stringFromProtobuf:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_5;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "data"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "data"));
    v7 = objc_msgSend(v6, "length");

    if (v7)
    {
      v8 = objc_alloc((Class)NSString);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "data"));
      v5 = objc_msgSend(v8, "initWithData:encoding:", v9, 4);

      goto LABEL_6;
    }
LABEL_5:
    v5 = 0;
  }
LABEL_6:

  return v5;
}

- (void)SDStart:(id)a3
{
  id v4;
  void *v5;
  dispatch_queue_global_t global_queue;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  SystemDiagnosticIDS *v12;
  id v13;

  v4 = a3;
  v5 = (void *)os_transaction_create("Respond to co-sysdiagnose");
  global_queue = dispatch_get_global_queue(25, 0);
  v7 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005B988;
  block[3] = &unk_100099730;
  v11 = v5;
  v12 = self;
  v13 = v4;
  v8 = v4;
  v9 = v5;
  dispatch_async(v7, block);

}

- (void)SDStop
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v2, "clearAllResources");

  +[SDTaskDepot signalStopTasks](SDTaskDepot, "signalStopTasks");
}

- (void)SDTransfer_Size:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint8_t buf[4];
  uint64_t v11;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "data"));

    if (v6)
    {
      v9 = 0;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "data"));
      objc_msgSend(v7, "getBytes:length:", &v9, 8);

      -[SystemDiagnosticIDS setTransfer_size:](self, "setTransfer_size:", v9);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v11 = v9;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Transfersize %zu", buf, 0xCu);
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v8, "log:", CFSTR("Transfersize %zu"), v9);

    }
  }

}

- (void)SDRemote_Complete:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSSet *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  NSObject *v31;
  uint8_t buf[16];
  uint8_t v33[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "data"));

    if (v6)
    {
      v8 = objc_opt_class(NSString, v7);
      v10 = objc_opt_class(NSMutableDictionary, v9);
      v12 = objc_opt_class(NSDictionary, v11);
      v14 = objc_opt_class(NSNull, v13);
      v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v10, v12, v14, objc_opt_class(NSNumber, v15), 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "data"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v17, v18, 0));

      v21 = objc_opt_class(NSDictionary, v20);
      if ((objc_opt_isKindOfClass(v19, v21) & 1) != 0 && (v22 = v19) != 0)
      {
        v23 = v22;
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "allKeys"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "firstObject"));

        v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", v25));
        if (!v26
          || (v27 = (void *)v26,
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", v25)),
              v29 = objc_msgSend(v28, "isEqual:", &__kCFBooleanFalse),
              v28,
              v27,
              v29))
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Transfer of remote archive failed", buf, 2u);
          }
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticIDS executionGroupDictionary](self, "executionGroupDictionary"));
          v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKey:", v25));
          dispatch_group_leave(v31);

        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v33 = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No dictionary from the protobuff.", v33, 2u);
        }
        v23 = 0;
      }

    }
  }

}

- (void)sendWatchListWithDiagnosticId:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  -[SystemDiagnosticIDS sendMessage:WithData:](self, "sendMessage:WithData:", 6, v4);

}

- (void)SDList_Complete:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSSet *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;

  v4 = a3;
  v5 = v4;
  if (v4 && (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "data")), v6, v6))
  {
    v8 = objc_opt_class(NSMutableArray, v7);
    v10 = objc_opt_class(NSArray, v9);
    v12 = objc_opt_class(NSString, v11);
    v14 = objc_opt_class(NSNull, v13);
    v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v10, v12, v14, objc_opt_class(NSNumber, v15), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "data"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v17, v18, 0));

    v21 = objc_opt_class(NSArray, v20);
    v22 = 0;
    if ((objc_opt_isKindOfClass(v19, v21) & 1) != 0)
    {
      v23 = v19;
      v22 = v23;
      if (v23)
      {
        if (objc_msgSend(v23, "count"))
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "firstObject"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticIDS executionGroupDictionary](self, "executionGroupDictionary"));
          v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKey:", v24));

          if ((unint64_t)objc_msgSend(v22, "count") < 2)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No archives on the watch", buf, 2u);
            }
          }
          else
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "subarrayWithRange:", 1, (char *)objc_msgSend(v22, "count") - 1));
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticIDS executionGroupDictionary](self, "executionGroupDictionary"));
            objc_msgSend(v28, "setObject:forKey:", v27, v24);

            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v30 = v27;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received watch archive list: %@", buf, 0xCu);
            }

          }
          if (v26)
            dispatch_group_leave(v26);

        }
      }
    }

  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Not received any data from the watch", buf, 2u);
  }

}

- (BOOL)sendMessage:(int)a3
{
  return -[SystemDiagnosticIDS sendMessage:WithData:](self, "sendMessage:WithData:", *(_QWORD *)&a3, 0);
}

- (BOOL)sendTransferSize:(unint64_t)a3
{
  return 0;
}

- (BOOL)sendRemoteArchiveMessage:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  LOBYTE(self) = -[SystemDiagnosticIDS sendMessage:WithData:](self, "sendMessage:WithData:", 8, v4);

  return (char)self;
}

- (BOOL)startCoSysdiagnoseForFilename:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  LOBYTE(self) = -[SystemDiagnosticIDS sendMessage:WithData:](self, "sendMessage:WithData:", 1, v4);

  return (char)self;
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  unsigned __int8 v27;
  id v28;
  _BOOL4 v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  uint64_t v59;
  void *i;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  _BOOL4 v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  id v85;
  id v86;
  const __CFString *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  const __CFString *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  id v101;
  id v102;
  uint64_t v103;
  void *v104;
  id v105;
  BOOL v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  id v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  unsigned __int8 v116;
  void *v117;
  void *v118;
  void *v119;
  id v120;
  uint64_t v121;
  uint64_t v122;
  NSObject *v123;
  id v124;
  _BOOL4 v125;
  void *v126;
  uint64_t v127;
  void *v128;
  void *v129;
  unsigned __int8 v130;
  void *v131;
  void *v132;
  void *v133;
  unsigned __int8 v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  unsigned int v142;
  id v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  id v149;
  id v150;
  void *v151;
  id v152;
  id v153;
  id v154;
  id v155;
  unsigned int v156;
  void *v158;
  void *v159;
  id v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  id v165;
  void *v166;
  id v167;
  id v168;
  id v169;
  id v170;
  id v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  id v180;
  id v181;
  NSFileAttributeKey v182;
  _UNKNOWN **v183;
  uint8_t buf[4];
  id v185;
  __int16 v186;
  void *v187;
  __int16 v188;
  void *v189;
  __int16 v190;
  void *v191;
  NSFileAttributeKey v192;
  _UNKNOWN **v193;
  _BYTE v194[128];
  _BYTE v195[128];
  NSFileAttributeKey v196;
  _UNKNOWN **v197;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v160 = a7;
  v17 = a8;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDCacheEnumerator sysdiagnoseDirectory](SDCacheEnumerator, "sysdiagnoseDirectory"));
  v164 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "path"));
  v163 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", CFSTR("SDREMOTE")));
  v161 = v16;
  v162 = v18;
  v159 = v17;
  if (!v20 || (v21 = objc_opt_class(NSNumber, v19), (objc_opt_isKindOfClass(v20, v21) & 1) == 0))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", CFSTR("SDCASE")));

    if (v30 && (v32 = objc_opt_class(NSNumber, v31), (objc_opt_isKindOfClass(v30, v32) & 1) != 0))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", CFSTR("SDCASE")));
      v34 = objc_msgSend(v33, "unsignedIntValue");

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS getIDSCaseString:](SystemDiagnosticIDS, "getIDSCaseString:", v34));
        *(_DWORD *)buf = 138412290;
        v185 = v35;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Target case %@", buf, 0xCu);

      }
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v156 = v34;
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS getIDSCaseString:](SystemDiagnosticIDS, "getIDSCaseString:", v34));
      objc_msgSend(v36, "log:", CFSTR("Target case %@"), v37);

      v30 = 0;
      v16 = v161;
    }
    else
    {
      v156 = 2;
    }
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKey:", CFSTR("SDLOCATION")));

    v155 = v15;
    if (v38)
    {
      v40 = objc_opt_class(NSString, v39);
      if ((objc_opt_isKindOfClass(v38, v40) & 1) != 0)
      {
        v41 = v38;
        v42 = v156;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v185 = v41;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Target location %@", buf, 0xCu);
        }
        v43 = v41;
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v44, "log:", CFSTR("Target location %@"), v43);

        v45 = v43;
        v158 = 0;
        v46 = v43;
        goto LABEL_80;
      }
    }
    v158 = v38;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Archive arrived without local target.", buf, 2u);
    }
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v47, "log:", CFSTR("Archive arrived without local target."));

    if (!v13
      || (v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "devices")),
          v49 = objc_msgSend(v48, "count"),
          v48,
          !v49))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Setting to watch-only", buf, 2u);
      }
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v45, "log:", CFSTR("Setting to watch-only"));
      v46 = 0;
      v42 = 2;
LABEL_80:

      v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v164, "lastPathComponent"));
      v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "lastPathComponent"));
      if (objc_msgSend(v98, "rangeOfString:", CFSTR(".tar.gz")) == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v99 = v46;
        v100 = v15;
        v101 = v14;
        v102 = v13;
        v103 = v42;
        v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "lastPathComponent"));
        v105 = objc_msgSend(v104, "rangeOfString:", CFSTR(".log."));

        v42 = v103;
        v13 = v102;
        v14 = v101;
        v15 = v100;
        v46 = v99;

        v106 = v105 == (id)0x7FFFFFFFFFFFFFFFLL;
        v18 = v162;
        if (v106)
        {
LABEL_86:
          v71 = v163;
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "stringByDeletingPathExtension"));

          v166 = v46;
          if ((_DWORD)v42 != 2)
          {
            if ((_DWORD)v42 == 5 || (_DWORD)v42 == 3)
            {
              v154 = v14;
              v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("co-"), "stringByAppendingString:", v46));
              v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByAppendingPathComponent:", v108));

              v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "stringByAppendingPathExtension:", CFSTR("tar")));
              if ((objc_msgSend(v163, "fileExistsAtPath:", v109) & 1) != 0)
              {
                v111 = 0;
              }
              else
              {
                v192 = NSFilePosixPermissions;
                v193 = &off_1000AD028;
                v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v193, &v192, 1));
                v171 = 0;
                v116 = objc_msgSend(v163, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v109, 1, v115, &v171);
                v111 = v171;

                if ((v116 & 1) == 0)
                  sub_10006290C((uint64_t)v109, v111);
              }
              v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v164, "lastPathComponent"));
              v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "stringByAppendingPathComponent:", v117));

              v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v164, "lastPathComponent"));
              v120 = objc_msgSend(v119, "rangeOfString:", CFSTR(".log."));

              if (v120 != (id)0x7FFFFFFFFFFFFFFFLL)
              {
                v121 = objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "stringByDeletingPathExtension"));

                v118 = (void *)v121;
              }
              v122 = objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](SystemDiagnosticIDS, "sharedInstance"));
              v123 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)v122, "getDispatchGroupForDiagnostic:", v46));

              v170 = v111;
              LOBYTE(v122) = objc_msgSend(v163, "moveItemAtPath:toPath:error:", v164, v118, &v170);
              v124 = v170;

              v125 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
              if ((v122 & 1) != 0)
              {
                if (v125)
                {
                  *(_DWORD *)buf = 138412290;
                  v185 = v118;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Successfully dropped %@", buf, 0xCu);
                }
                v126 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
                objc_msgSend(v126, "log:", CFSTR("Successfully dropped %@"), v118);
              }
              else
              {
                if (v125)
                {
                  v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "localizedDescription"));
                  *(_DWORD *)buf = 138412802;
                  v185 = v164;
                  v186 = 2112;
                  v187 = v118;
                  v188 = 2112;
                  v189 = v135;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not move watch directory from %@ to %@ with error %@", buf, 0x20u);

                }
                v126 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
                v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "localizedDescription"));
                objc_msgSend(v126, "log:", CFSTR("Could not move watch directory from %@ to %@ with error %@"), v164, v118, v136);

              }
              v14 = v154;

              if (v123)
              {
                dispatch_group_leave(v123);
              }
              else
              {
                v150 = v13;
                v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "stringByAppendingPathExtension:", CFSTR("tar.gz")));
                v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v162, "stringByAppendingPathComponent:", v137));

                v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "lastPathComponent"));
                v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "stringByAppendingPathComponent:", v139));

                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138413058;
                  v185 = v138;
                  v186 = 2112;
                  v187 = v140;
                  v188 = 2112;
                  v189 = v110;
                  v190 = 2112;
                  v191 = v109;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Local tarball: %@, newpath: %@, co-sysdiagnose tarball: %@, co-sysdiagnose path: %@", buf, 0x2Au);
                }
                v141 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
                objc_msgSend(v141, "log:", CFSTR("Local tarball: %@, newpath: %@, co-sysdiagnose tarball: %@, co-sysdiagnose path: %@"), v138, v140, v110, v109);

                v169 = v124;
                v142 = objc_msgSend(v163, "moveItemAtPath:toPath:error:", v138, v140, &v169);
                v143 = v169;

                if (v142)
                  sub_100025B9C(v109, v110, 0x10u, 0);

                v124 = v143;
                v13 = v150;
                v14 = v154;
              }
              goto LABEL_124;
            }
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v112 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS getIDSCaseString:](SystemDiagnosticIDS, "getIDSCaseString:", v42));
              *(_DWORD *)buf = 138412290;
              v185 = v112;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Remote sysdiagnose was in %@ unexpectedly", buf, 0xCu);

            }
            v113 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
            v114 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS getIDSCaseString:](SystemDiagnosticIDS, "getIDSCaseString:", v42));
            objc_msgSend(v113, "log:", CFSTR("Remote sysdiagnose was in %@ unexpectedly"), v114);

            v71 = v163;
          }
          v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v164, "lastPathComponent"));
          v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByAppendingPathComponent:", v110));
          if ((objc_msgSend(v71, "fileExistsAtPath:", v18) & 1) != 0)
          {
            v28 = 0;
          }
          else
          {
            v182 = NSFilePosixPermissions;
            v183 = &off_1000AD028;
            v127 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v183, &v182, 1));
            v128 = v71;
            v129 = (void *)v127;
            v168 = 0;
            v130 = objc_msgSend(v128, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v18, 1, v127, &v168);
            v28 = v168;

            if ((v130 & 1) == 0)
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedDescription"));
                *(_DWORD *)buf = 138412290;
                v185 = v131;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Sysdiagnose directory did not exist and could not be created with error: %@", buf, 0xCu);

              }
              v132 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
              v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedDescription"));
              objc_msgSend(v132, "log:", CFSTR("Sysdiagnose directory did not exist and could not be created with error: %@"), v133);

            }
            v18 = v162;
            v71 = v163;
          }
          if (!objc_msgSend(v71, "fileExistsAtPath:isDirectory:", v164, 0))
            goto LABEL_126;
          v167 = v28;
          v134 = objc_msgSend(v71, "moveItemAtPath:toPath:error:", v164, v109, &v167);
          v124 = v167;

          if ((v134 & 1) != 0)
          {
            v28 = v124;
            v15 = v155;
LABEL_125:
            v71 = v163;
LABEL_126:

            -[SystemDiagnosticIDS setPreferredWifi:](self, "setPreferredWifi:", 0);
            v68 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "dataUsingEncoding:", 4));
            -[SystemDiagnosticIDS sendMessage:WithData:](self, "sendMessage:WithData:", 3, v68);
            v70 = v166;
            goto LABEL_127;
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "lastPathComponent"));
            v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "localizedDescription"));
            *(_DWORD *)buf = 138412546;
            v185 = v144;
            v186 = 2112;
            v187 = v145;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not move watch directory %@ with error %@", buf, 0x16u);

          }
          v118 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
          v123 = objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "lastPathComponent"));
          v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "localizedDescription"));
          objc_msgSend(v118, "log:", CFSTR("Could not move watch directory %@ with error %@"), v123, v146);

LABEL_124:
          v28 = v124;
          v15 = v155;
          v18 = v162;
          goto LABEL_125;
        }
      }
      else
      {

      }
      v107 = objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "stringByDeletingPathExtension"));

      v97 = (void *)v107;
      goto LABEL_86;
    }
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "devices"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectAtIndexedSubscript:", 0));

    v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "productBuildVersion"));
    v147 = v51;
    if (v156 != 5 && v156 != 3 || objc_msgSend(v151, "rangeOfString:", CFSTR("14S")) == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Archive arrived without target diagnosticID when one was expected. Setting to watch-only.", buf, 2u);
      }
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v52, "log:", CFSTR("Archive arrived without target diagnosticID when one was expected. Setting to watch-only."));

      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v18, 1));
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", NSURLNameKey, NSURLPathKey, 0));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v163, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v53, v54, 7, &stru_10009A180));

      v174 = 0u;
      v175 = 0u;
      v172 = 0u;
      v173 = 0u;
      v56 = v55;
      v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v172, v194, 16);
      if (v57)
      {
        v58 = v57;
        v59 = *(_QWORD *)v173;
        do
        {
          for (i = 0; i != v58; i = (char *)i + 1)
          {
            if (*(_QWORD *)v173 != v59)
              objc_enumerationMutation(v56);
            v61 = *(void **)(*((_QWORD *)&v172 + 1) + 8 * (_QWORD)i);
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "lastPathComponent"));
              *(_DWORD *)buf = 138412290;
              v185 = v62;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Candidate: %@", buf, 0xCu);

            }
            v63 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
            v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "lastPathComponent"));
            objc_msgSend(v63, "log:", CFSTR("Candidate: %@"), v64);

          }
          v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v172, v194, 16);
        }
        while (v58);
      }

      v46 = 0;
      v42 = 2;
LABEL_79:
      v18 = v162;

      v45 = v147;
      goto LABEL_80;
    }
    v72 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](SystemDiagnosticIDS, "sharedInstance"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "localGroupDictionary"));
    v74 = objc_msgSend(v73, "count");

    v75 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v74)
    {
      if (v75)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Using exisiting dgroup", buf, 2u);
      }
      v76 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v76, "log:", CFSTR("Using exisiting dgroup"));

      v77 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](SystemDiagnosticIDS, "sharedInstance"));
      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "localGroupDictionary"));
      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "allKeys"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "objectAtIndexedSubscript:", 0));
      goto LABEL_75;
    }
    v153 = v14;
    v149 = v13;
    if (v75)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Using best-guess based existing files.", buf, 2u);
    }
    v80 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v80, "log:", CFSTR("Using best-guess based existing files."));

    v148 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v18, 1));
    v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", NSURLNameKey, NSURLPathKey, 0));
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v163, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v81, v82, 7, &stru_10009A160));

    v178 = 0u;
    v179 = 0u;
    v176 = 0u;
    v177 = 0u;
    v84 = v83;
    v85 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v176, v195, 16);
    v152 = v84;
    if (!v85)
    {
LABEL_73:

      v77 = v148;
      if (!objc_msgSend(v148, "count"))
      {
        v13 = v149;
        v14 = v153;
        v15 = v155;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Best guess approach failed, defaulting to watch-only.", buf, 2u);
        }
        v79 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v79, "log:", CFSTR("Best guess approach failed, defaulting to watch-only."));
        v46 = 0;
        v42 = 2;
        v78 = v152;
        goto LABEL_76;
      }
      v78 = v84;
      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "sortedArrayUsingSelector:", "localizedCaseInsensitiveCompare:"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "objectAtIndexedSubscript:", 0));
      v13 = v149;
      v14 = v153;
      v15 = v155;
LABEL_75:
      v42 = v156;
LABEL_76:

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v185 = v151;
        v186 = 2112;
        v187 = v46;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Transfer from legacy device with build %@ detected. Setting to group %@", buf, 0x16u);
      }
      v56 = (id)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v56, "log:", CFSTR("Transfer from legacy device with build %@ detected. Setting to group %@"), v151, v46);
      goto LABEL_79;
    }
    v86 = v85;
    v87 = CFSTR("sysdiagnose");
    v88 = *(_QWORD *)v177;
LABEL_58:
    v89 = 0;
    while (1)
    {
      if (*(_QWORD *)v177 != v88)
        objc_enumerationMutation(v84);
      v90 = *(void **)(*((_QWORD *)&v176 + 1) + 8 * v89);
      v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "absoluteString"));
      if (objc_msgSend(v91, "rangeOfString:", v87) == (id)0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_70;
      v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "absoluteString"));
      if (objc_msgSend(v92, "rangeOfString:", CFSTR("watch")) != (id)0x7FFFFFFFFFFFFFFFLL)
      {

        goto LABEL_70;
      }
      v93 = v87;
      v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "absoluteString"));
      if (objc_msgSend(v94, "rangeOfString:", CFSTR("incomplete")) != (id)0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_69;
      v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "absoluteString"));
      if (objc_msgSend(v95, "rangeOfString:", CFSTR(".tmp")) != (id)0x7FFFFFFFFFFFFFFFLL)
        break;
      v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "absoluteString"));
      v165 = objc_msgSend(v96, "rangeOfString:", CFSTR("co-sysdiagnose"));

      v84 = v152;
      v87 = v93;
      if (v165 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "absoluteString"));
        objc_msgSend(v148, "addObject:", v91);
        goto LABEL_70;
      }
LABEL_71:
      if (v86 == (id)++v89)
      {
        v86 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v176, v195, 16);
        if (!v86)
          goto LABEL_73;
        goto LABEL_58;
      }
    }

LABEL_69:
    v87 = v93;
LABEL_70:

    goto LABEL_71;
  }
  v158 = v20;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v185 = v164;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received file %@ successfully for Remote transfer request", buf, 0xCu);
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v164, "lastPathComponent"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByAppendingPathComponent:", v22));

  v24 = v163;
  v25 = 0;
  if ((objc_msgSend(v163, "fileExistsAtPath:isDirectory:", v18, 0) & 1) == 0)
  {
    v196 = NSFilePosixPermissions;
    v197 = &off_1000AD028;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v197, &v196, 1));
    v181 = 0;
    objc_msgSend(v163, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v18, 1, v26, &v181);
    v25 = v181;

    v24 = v163;
  }
  v180 = v25;
  v27 = objc_msgSend(v24, "moveItemAtPath:toPath:error:", v164, v23, &v180);
  v28 = v180;

  v29 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if ((v27 & 1) != 0)
  {
    if (v29)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Transfer of remote archive success", buf, 2u);
    }
  }
  else if (v29)
  {
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedDescription"));
    *(_DWORD *)buf = 138412802;
    v185 = v164;
    v186 = 2112;
    v187 = v23;
    v188 = 2112;
    v189 = v65;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Couldn't move file from %@ to %@, error: %@", buf, 0x20u);

  }
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticIDS executionGroupDictionary](self, "executionGroupDictionary"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v164, "lastPathComponent"));
  v68 = objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "objectForKey:", v67));

  if (v68)
  {
    v18 = v162;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v164, "lastPathComponent"));
      *(_DWORD *)buf = 138412290;
      v185 = v69;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Leaving dispatch group for %@", buf, 0xCu);

    }
    dispatch_group_leave(v68);
    v70 = 0;
    v71 = v163;
  }
  else
  {
    v70 = 0;
    v18 = v162;
    v71 = v163;
  }
LABEL_127:

}

- (NSMutableDictionary)localGroupDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLocalGroupDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)executionGroupDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setExecutionGroupDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableDictionary)localTupleDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLocalTupleDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unint64_t)transfer_size
{
  return self->_transfer_size;
}

- (void)setTransfer_size:(unint64_t)a3
{
  self->_transfer_size = a3;
}

- (IDSService)service
{
  return (IDSService *)objc_getProperty(self, a2, 40, 1);
}

- (void)setService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (OS_dispatch_queue)run_queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRun_queue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)transferIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTransferIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferIdentifier, 0);
  objc_storeStrong((id *)&self->_run_queue, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_localTupleDictionary, 0);
  objc_storeStrong((id *)&self->_executionGroupDictionary, 0);
  objc_storeStrong((id *)&self->_localGroupDictionary, 0);
}

@end
