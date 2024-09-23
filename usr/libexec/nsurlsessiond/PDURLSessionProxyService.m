@implementation PDURLSessionProxyService

- (PDURLSessionProxyService)init
{
  PDURLSessionProxyService *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *outstandingReplies;
  NSMutableDictionary *v5;
  NSMutableDictionary *outstandingMessages;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v11;
  NSMutableDictionary *outgoingSequenceNumbersByPriority;
  NSMutableDictionary *v13;
  NSMutableDictionary *incomingSequenceNumbersByPriority;
  NSMutableSet *v15;
  NSMutableSet *receivedLaunchUUIDs;
  NSString *startupMessageIdentifier;
  void *v18;
  uint64_t v19;
  NSString *launchUUID;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)PDURLSessionProxyService;
  v2 = -[PDURLSessionProxyService init](&v22, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    outstandingReplies = v2->_outstandingReplies;
    v2->_outstandingReplies = v3;

    v5 = objc_opt_new(NSMutableDictionary);
    outstandingMessages = v2->_outstandingMessages;
    v2->_outstandingMessages = v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("com.apple.nsurlsessiond.NSURLSessionProxyService-Queue", v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;

    v11 = objc_opt_new(NSMutableDictionary);
    outgoingSequenceNumbersByPriority = v2->_outgoingSequenceNumbersByPriority;
    v2->_outgoingSequenceNumbersByPriority = v11;

    v13 = objc_opt_new(NSMutableDictionary);
    incomingSequenceNumbersByPriority = v2->_incomingSequenceNumbersByPriority;
    v2->_incomingSequenceNumbersByPriority = v13;

    v15 = objc_opt_new(NSMutableSet);
    receivedLaunchUUIDs = v2->_receivedLaunchUUIDs;
    v2->_receivedLaunchUUIDs = v15;

    startupMessageIdentifier = v2->_startupMessageIdentifier;
    v2->_startupMessageIdentifier = 0;

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "UUIDString"));
    launchUUID = v2->_launchUUID;
    v2->_launchUUID = (NSString *)v19;

    v2->_haveReceivedMessage = 0;
  }
  return v2;
}

- (void)start
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023D18;
  block[3] = &unk_1000B23A0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)devicesDidUnpair:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;

  v4 = a3;
  v5 = (id)qword_1000C7120;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class(self);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    *(_DWORD *)buf = 138412290;
    v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Devices unpaired", buf, 0xCu);

  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100023CF0;
  v9[3] = &unk_1000B23A0;
  v9[4] = self;
  -[PDURLSessionProxyService withWorkQueue:](self, "withWorkQueue:", v9);

}

- (void)_onqueue_sendStartupMessage
{
  PDURLSessionProxyStartedUp *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  IDSService *idsService;
  void *v11;
  unsigned int v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;

  if (self->_haveReceivedMessage)
  {
    v3 = objc_opt_new(PDURLSessionProxyStartedUp);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyService launchUUID](self, "launchUUID"));
    -[PDURLSessionProxyStartedUp setLaunchUUID:](v3, "setLaunchUUID:", v4);

    v5 = objc_alloc((Class)IDSProtobuf);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyStartedUp data](v3, "data"));
    v7 = objc_msgSend(v5, "initWithProtobufData:type:isResponse:", v6, 10000, 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, IDSSendMessageOptionLocalDeliveryKey);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", IDSMaxMessageTimeout));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, IDSSendMessageOptionTimeoutKey);

    objc_msgSend(v8, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, IDSSendMessageOptionNSURLSessionKey);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, IDSSendMessageOptionEnforceRemoteTimeoutsKey);
    idsService = self->_idsService;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", IDSDefaultPairedDevice));
    v21 = 0;
    v22 = 0;
    v12 = -[IDSService sendProtobuf:toDestinations:priority:options:identifier:error:](idsService, "sendProtobuf:toDestinations:priority:options:identifier:error:", v7, v11, 200, v8, &v22, &v21);
    v13 = v22;
    v14 = v22;
    v15 = v21;

    self->_startupMessageFailed = v12 ^ 1;
    if (((v12 ^ 1) & 1) != 0)
    {
      v16 = (id)qword_1000C7120;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v20 = objc_msgSend(v15, "code");
        *(_DWORD *)buf = 138412546;
        v24 = v15;
        v25 = 2048;
        v26 = v20;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "sendProtobuf: returned NO for PDURLSessionProxy startup message, error %@ [%ld]", buf, 0x16u);
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_startupMessageIdentifier, v13);
      v16 = (id)qword_1000C7120;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (objc_class *)objc_opt_class(self);
        v18 = NSStringFromClass(v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        *(_DWORD *)buf = 138412546;
        v24 = v19;
        v25 = 2112;
        v26 = v14;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@ sent startup message with identifier %@", buf, 0x16u);

      }
    }

  }
}

- (void)withWorkQueue:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_queue, a3);
}

- (id)defaultPairedDevice
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_idsService, "devices", 0));
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
        if ((objc_msgSend(v6, "isDefaultPairedDevice") & 1) != 0)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_onqueue_updateDeviceState
{
  _BOOL4 connected;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  NSString *v17;
  uint64_t v18;
  void *v19;
  int v20;
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  int v29;
  _BYTE v30[128];

  connected = self->_connected;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_idsService, "devices"));
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v23;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v7)
        objc_enumerationMutation(v5);
      v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v8);
      if (objc_msgSend(v9, "isDefaultPairedDevice", (_QWORD)v22))
      {
        if (objc_msgSend(v9, "isNearby"))
          break;
      }
      if (v6 == (id)++v8)
      {
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    if ((unint64_t)objc_msgSend(v9, "serviceMinCompatibilityVersion") < 8)
    {
      v10 = 1;
      goto LABEL_16;
    }
    v11 = (id)qword_1000C7120;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class(self);
      v13 = NSStringFromClass(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      *(_DWORD *)buf = 138412290;
      v27 = (uint64_t)v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ Connected to post PDURL device - resetting state", buf, 0xCu);

    }
    self->_haveReceivedMessage = 0;
    -[PDURLSessionProxyService _onqueue_remoteDeviceStartedUp](self, "_onqueue_remoteDeviceStartedUp");

  }
  else
  {
LABEL_10:
    v10 = 0;
LABEL_16:

    self->_connected = v10;
    v15 = (id)qword_1000C7120;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (objc_class *)objc_opt_class(self);
      v17 = NSStringFromClass(v16);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      v19 = (void *)v18;
      if (self->_connected)
        v20 = 89;
      else
        v20 = 78;
      *(_DWORD *)buf = 138412546;
      v27 = v18;
      v28 = 1024;
      v29 = v20;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@ Updated device state connected = %c", buf, 0x12u);

    }
    if (!connected || v10)
    {
      v21 = !v10;
      if (connected)
        v21 = 1;
      if ((v21 & 1) == 0)
        -[PDURLSessionProxyService _onqueue_devicesConnected](self, "_onqueue_devicesConnected");
    }
    else
    {
      -[PDURLSessionProxyService _onqueue_devicesDisconnected](self, "_onqueue_devicesDisconnected");
    }
  }

}

- (void)_onqueue_remoteDeviceStartedUp
{
  -[NSMutableDictionary removeAllObjects](self->_incomingSequenceNumbersByPriority, "removeAllObjects");
}

- (void)_onqueue_setPrefersInfraWiFi:(BOOL)a3
{
  _BOOL8 v3;
  const __CFBoolean *v5;
  const __CFBoolean *v6;
  const __CFBoolean *v7;
  CFTypeID v8;
  int Value;
  CFTypeID v10;
  int v11;
  const CFBooleanRef *v12;
  NSObject *v13;
  int v14;
  _DWORD v15[2];

  v3 = a3;
  v5 = (const __CFBoolean *)qword_1000C7088;
  if (!qword_1000C7088)
  {
    v6 = (const __CFBoolean *)CFPreferencesCopyAppValue(CFSTR("DisableInfraWiFi"), CFSTR("com.apple.nsurlsessiond"));
    if (v6)
    {
      v7 = v6;
      v8 = CFGetTypeID(v6);
      if (v8 == CFBooleanGetTypeID())
      {
        Value = CFBooleanGetValue(v7);
      }
      else
      {
        v10 = CFGetTypeID(v7);
        if (v10 != CFStringGetTypeID())
        {
          CFRelease(v7);
          goto LABEL_10;
        }
        Value = CFEqual(v7, CFSTR("1"));
      }
      v11 = Value;
      CFRelease(v7);
      if (v11)
      {
        v12 = &kCFBooleanTrue;
LABEL_11:
        v5 = *v12;
        qword_1000C7088 = (uint64_t)*v12;
        goto LABEL_12;
      }
    }
LABEL_10:
    v12 = &kCFBooleanFalse;
    goto LABEL_11;
  }
LABEL_12:
  if (!CFBooleanGetValue(v5) && self->_prefersInfraWiFi != v3)
  {
    self->_prefersInfraWiFi = v3;
    v13 = qword_1000C7120;
    if (os_log_type_enabled((os_log_t)qword_1000C7120, OS_LOG_TYPE_DEFAULT))
    {
      if (v3)
        v14 = 89;
      else
        v14 = 78;
      v15[0] = 67109120;
      v15[1] = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "PDURLSessionProxyService setting preferInfraWiFi to %c", (uint8_t *)v15, 8u);
    }
    -[IDSService setPreferInfraWiFi:](self->_idsService, "setPreferInfraWiFi:", v3);
  }
}

- (int64_t)_onqueue_priorityForMessage:(id)a3 ofType:(unsigned __int16)a4 isReply:(BOOL)a5
{
  return 200;
}

- (id)_onqueue_sourceApplicationForMessage:(id)a3
{
  return 0;
}

- (int64_t)_onqueue_IDSTimoutForMessage:(id)a3
{
  return 50;
}

- (id)_onqueue_loggableDescriptionForMessage:(id)a3
{
  return 0;
}

- (unint64_t)bumpAndReturnOutgoingSequenceNumberForPriority:(int64_t)a3
{
  NSMutableDictionary *outgoingSequenceNumbersByPriority;
  void *v6;
  void *v7;
  char *v8;
  unint64_t v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;

  outgoingSequenceNumbersByPriority = self->_outgoingSequenceNumbersByPriority;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](outgoingSequenceNumbersByPriority, "objectForKeyedSubscript:", v6));
  v8 = (char *)objc_msgSend(v7, "unsignedLongLongValue");

  v9 = (unint64_t)(v8 + 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v8 + 1));
  v11 = self->_outgoingSequenceNumbersByPriority;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a3));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v10, v12);

  return v9;
}

- (BOOL)verifyAndUpdateIncomingSequenceNumber:(unint64_t)a3 forPriority:(int64_t)a4
{
  NSMutableDictionary *incomingSequenceNumbersByPriority;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  NSObject *v15;
  int v17;
  int64_t v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  id v22;

  incomingSequenceNumbersByPriority = self->_incomingSequenceNumbersByPriority;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](incomingSequenceNumbersByPriority, "objectForKeyedSubscript:", v8));
  v10 = objc_msgSend(v9, "unsignedLongLongValue");

  v11 = a3 - 1;
  if (a3 - 1 < (unint64_t)v10)
  {
    v15 = qword_1000C7120;
    if (os_log_type_enabled((os_log_t)qword_1000C7120, OS_LOG_TYPE_ERROR))
    {
      v17 = 134218496;
      v18 = a4;
      v19 = 2048;
      v20 = a3;
      v21 = 2048;
      v22 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Received a message of priority %ld with lower sequence number %llu than existing sequence number %llu. Dropping message.", (uint8_t *)&v17, 0x20u);
    }
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    v13 = self->_incomingSequenceNumbersByPriority;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a4));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v12, v14);

  }
  return v11 >= (unint64_t)v10;
}

- (void)_onqueue_sendMessage:(id)a3 ofType:(unsigned __int16)a4 responseIdentifier:(id)a5 forSourceApplication:(id)a6 withUrgency:(BOOL)a7 withIDSMessageTimeout:(int64_t)a8 withReply:(id)a9
{
  id v15;
  NSObject *v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  NSString *v20;
  uint64_t v21;
  void *v22;
  int v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  int64_t v28;
  void *v29;
  BOOL v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  _BOOL4 v37;
  NSObject *v38;
  int64_t v39;
  void *v40;
  id v41;
  void *v42;
  IDSService *idsService;
  void *v44;
  unsigned int v45;
  id v46;
  id v47;
  PDURLSessionProxyMessageInfo *v48;
  id v49;
  dispatch_time_t v50;
  NSObject *queue;
  NSObject *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  int v56;
  void *v57;
  id v58;
  int v59;
  void *v60;
  BOOL v61;
  uint64_t v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  void *v67;
  unint64_t v68;
  id v69;
  unsigned int v70;
  id v71;
  _QWORD block[5];
  id v73;
  __int16 v74;
  id v75;
  id v76;
  id v77;
  id v78;
  uint8_t buf[4];
  _BYTE v80[24];
  __int16 v81;
  int v82;
  __int16 v83;
  _BYTE v84[14];
  __int16 v85;
  int64_t v86;

  v70 = a4;
  v15 = a3;
  v71 = a5;
  v68 = (unint64_t)a6;
  v69 = a9;
  v16 = (id)qword_1000C7120;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (objc_class *)objc_opt_class(self);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = NSStringFromSelector(a2);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    v22 = (void *)v21;
    if (self->_connected)
      v23 = 89;
    else
      v23 = 78;
    *(_DWORD *)buf = 138413826;
    if (v71)
      v24 = 89;
    else
      v24 = 78;
    *(_QWORD *)v80 = v19;
    *(_WORD *)&v80[8] = 2112;
    *(_QWORD *)&v80[10] = v21;
    *(_WORD *)&v80[18] = 1024;
    *(_DWORD *)&v80[20] = v70;
    v81 = 1024;
    v82 = v23;
    v83 = 1024;
    *(_DWORD *)v84 = v24;
    *(_WORD *)&v84[4] = 2112;
    *(_QWORD *)&v84[6] = v68;
    v85 = 2048;
    v86 = a8;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@::%@ type = %u, connected = %c, isReply = %c, sourceApplication = %@, msgTO = %ld", buf, 0x3Cu);

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v25, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, IDSSendMessageOptionLocalDeliveryKey);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a8));
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v26, IDSSendMessageOptionTimeoutKey);

  objc_msgSend(v25, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, IDSSendMessageOptionNSURLSessionKey);
  objc_msgSend(v25, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, IDSSendMessageOptionEnforceRemoteTimeoutsKey);
  v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_nsurlsessionproxy_sessionIdentifier"));
  LODWORD(v26) = (v68 | v27) != 0;

  v28 = 2 * a8 + 5;
  if ((_DWORD)v26)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_nsurlsessionproxy_sessionIdentifier"));
    v30 = v29 == 0;

    if (v30)
    {
      v32 = 0;
      v33 = 0;
    }
    else
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_nsurlsessionproxy_sessionIdentifier"));
      v77 = 0;
      v78 = 0;
      +[PDURLSessionProxyCommon getComponentsForFullIdentifier:bundleIdentifier:sessionIdentifier:](PDURLSessionProxyCommon, "getComponentsForFullIdentifier:bundleIdentifier:sessionIdentifier:", v31, &v78, &v77);
      v32 = v78;
      v33 = v77;

      if (v32)
      {
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v32, CFSTR("NSURLSessionProxyClientBundleIdentifier"));
        if ((objc_msgSend(v32, "isEqualToString:", CFSTR("com.apple.cloudkit.cloudd")) & 1) != 0
          || objc_msgSend(v32, "isEqualToString:", CFSTR("com.apple.cloudd")))
        {
          v28 = 3600;
        }
      }
    }
    v34 = (id)v68;
    if (v68)
    {
      v35 = v34;
    }
    else
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_nsurlsessionproxy_sessionIdentifier"));
      v61 = v60 == 0;

      if (v61)
      {
        v35 = 0;
        goto LABEL_19;
      }
      v62 = objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyService _onqueue_sourceApplicationForMessage:](self, "_onqueue_sourceApplicationForMessage:", v15));
      v63 = (void *)v62;
      if (v62)
        v64 = (void *)v62;
      else
        v64 = v32;
      v35 = v64;

      if (!v35)
        goto LABEL_19;
    }
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v35, CFSTR("IDSSendMessageOptionMetricReportIdentifier"));
LABEL_19:

  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("IDSSendMessageOptionMetricReportIdentifier")));
  v37 = v36 == 0;

  if (v37)
  {
    v38 = qword_1000C7120;
    if (os_log_type_enabled((os_log_t)qword_1000C7120, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Unable to determine source application for message", buf, 2u);
    }
  }
  if (v69)
    objc_msgSend(v25, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, IDSSendMessageOptionExpectsPeerResponseKey);
  if (v71)
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v71, IDSSendMessageOptionPeerResponseIdentifierKey);
  if (a7)
    v39 = 300;
  else
    v39 = -[PDURLSessionProxyService _onqueue_priorityForMessage:ofType:isReply:](self, "_onqueue_priorityForMessage:ofType:isReply:", v15, v70, v71 != 0);
  if (!v71)
  {
    objc_msgSend(v15, "_nsurlsessionproxy_setSequenceNumber:", -[PDURLSessionProxyService bumpAndReturnOutgoingSequenceNumberForPriority:](self, "bumpAndReturnOutgoingSequenceNumberForPriority:", v39));
    objc_msgSend(v15, "_nsurlsessionproxy_setMessagePriority:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyService launchUUID](self, "launchUUID"));
    objc_msgSend(v15, "_nsurlsessionproxy_setLaunchUUID:", v40);

  }
  v41 = objc_alloc((Class)IDSProtobuf);
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "data"));
  v66 = objc_msgSend(v41, "initWithProtobufData:type:isResponse:", v42, v70, v71 != 0);

  idsService = self->_idsService;
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", IDSDefaultPairedDevice));
  v75 = 0;
  v76 = 0;
  v45 = -[IDSService sendProtobuf:toDestinations:priority:options:identifier:error:](idsService, "sendProtobuf:toDestinations:priority:options:identifier:error:", v66, v44, v39, v25, &v76, &v75);
  v46 = v76;
  v47 = v75;

  if (v45)
  {
    v48 = -[PDURLSessionProxyMessageInfo initWithMessage:type:]([PDURLSessionProxyMessageInfo alloc], "initWithMessage:type:", v15, v70);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_outstandingMessages, "setObject:forKeyedSubscript:", v48, v46);
    if (v69)
    {
      v49 = objc_msgSend(v69, "copy");
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_outstandingReplies, "setObject:forKeyedSubscript:", v49, v46);

      if (v70 != 3001)
      {
        v50 = dispatch_time(0, 1000000000 * v28);
        queue = self->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100023BCC;
        block[3] = &unk_1000B0FB8;
        block[4] = self;
        v73 = v46;
        v74 = v70;
        dispatch_after(v50, queue, block);

      }
    }

  }
  else
  {
    v52 = (id)qword_1000C7120;
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      v65 = objc_msgSend(v47, "code");
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v80 = v70;
      *(_WORD *)&v80[4] = 2112;
      *(_QWORD *)&v80[6] = v47;
      *(_WORD *)&v80[14] = 2048;
      *(_QWORD *)&v80[16] = v65;
      _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "Failed to send message! Type = %u, error = %@ [%ld]", buf, 0x1Cu);
    }

    if (v69)
    {
      v53 = v47;
      if (!v47)
        v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSURLErrorDomain, -1, 0));
      (*((void (**)(id, _QWORD, void *))v69 + 2))(v69, 0, v53);
      if (!v47)

    }
    -[PDURLSessionProxyService _onqueue_handleFailedMessageSend:ofType:](self, "_onqueue_handleFailedMessageSend:ofType:", v15, v70, v66);
  }
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyService _onqueue_loggableDescriptionForMessage:](self, "_onqueue_loggableDescriptionForMessage:", v15, v66));
  v55 = (id)qword_1000C7120;
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    if (v71)
      v56 = 89;
    else
      v56 = 78;
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "data"));
    v58 = objc_msgSend(v57, "length");
    *(_DWORD *)buf = 138544642;
    if (v45)
      v59 = 89;
    else
      v59 = 78;
    *(_QWORD *)v80 = v54;
    *(_WORD *)&v80[8] = 2114;
    *(_QWORD *)&v80[10] = v46;
    *(_WORD *)&v80[18] = 1024;
    *(_DWORD *)&v80[20] = v70;
    v81 = 1024;
    v82 = v56;
    v83 = 2048;
    *(_QWORD *)v84 = v58;
    *(_WORD *)&v84[8] = 1024;
    *(_DWORD *)&v84[10] = v59;
    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%{public}@ sent NSURLSessionProxy message, identifier = %{public}@, type = %u, isReply = %c, data length = %lu, result = %c", buf, 0x32u);

  }
}

- (void)sendProtobufMessage:(id)a3 ofType:(unsigned __int16)a4 withReply:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unsigned __int16 v16;

  v8 = a3;
  v9 = a5;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100023B64;
  v13[3] = &unk_1000B0FE0;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

}

- (void)_onqueue_handleReceivedMessage:(id)a3 ofType:(unsigned __int16)a4 withReply:(id)a5
{
  int v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  int v11;

  v5 = a4;
  v6 = a3;
  v7 = qword_1000C7120;
  if (os_log_type_enabled((os_log_t)qword_1000C7120, OS_LOG_TYPE_ERROR))
  {
    v8 = 138412546;
    v9 = v6;
    v10 = 1024;
    v11 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Subclass did not handle message %@ of type %u", (uint8_t *)&v8, 0x12u);
  }

}

- (void)_onqueue_handleFailedMessageSend:(id)a3 ofType:(unsigned __int16)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;

  v4 = a3;
  v5 = qword_1000C7120;
  if (os_log_type_enabled((os_log_t)qword_1000C7120, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Subclass did not handle message send failure for message %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)_onqueue_handleReceivedReply:(id)a3 forIdentifier:(id)a4 ofType:(unsigned __int16)a5 withError:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  int v15;
  id v16;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_outstandingReplies, "objectForKeyedSubscript:", v10));
  v13 = (void *)v12;
  if (v12)
  {
    (*(void (**)(uint64_t, id, id))(v12 + 16))(v12, v9, v11);
    -[NSMutableDictionary removeObjectForKey:](self->_outstandingReplies, "removeObjectForKey:", v10);
    -[NSMutableDictionary removeObjectForKey:](self->_outstandingMessages, "removeObjectForKey:", v10);
  }
  else
  {
    v14 = qword_1000C7120;
    if (os_log_type_enabled((os_log_t)qword_1000C7120, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412290;
      v16 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Received a reply with identifier %@ but don't have a corresponding reply block", (uint8_t *)&v15, 0xCu);
    }
  }

}

- (void)_onqueue_messageWithIdentifier:(id)a3 didSendWithSuccess:(BOOL)a4 error:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a5;
  if (!a4)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_outstandingMessages, "objectForKeyedSubscript:", v13));
    v11 = v8;
    if (!v8)
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSURLErrorDomain, -1, 0));
    -[PDURLSessionProxyService _onqueue_handleReceivedReply:forIdentifier:ofType:withError:](self, "_onqueue_handleReceivedReply:forIdentifier:ofType:withError:", 0, v13, 0, v11);
    if (!v8)

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "message"));
    -[PDURLSessionProxyService _onqueue_handleFailedMessageSend:ofType:](self, "_onqueue_handleFailedMessageSend:ofType:", v12, objc_msgSend(v10, "type"));

    goto LABEL_9;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_outstandingReplies, "objectForKeyedSubscript:", v13));

  if (!v9)
LABEL_9:
    -[NSMutableDictionary removeObjectForKey:](self->_outstandingMessages, "removeObjectForKey:", v13);

}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  NSObject *v12;
  objc_class *v13;
  NSString *v14;
  id v15;
  NSString *v16;
  id v17;
  id v18;
  unsigned int v19;
  id v20;
  int v21;
  objc_class *v22;
  NSObject *v23;
  id v24;
  id v25;
  void *v26;
  NSObject *v27;
  _BOOL4 v28;
  NSObject *v29;
  _BOOL4 v30;
  const char *v31;
  NSObject *v32;
  id v33;
  unsigned int v34;
  id v35;
  int v36;
  void *v37;
  id v38;
  id v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  objc_class *v43;
  NSString *v44;
  id v45;
  unsigned int v46;
  id v47;
  int v48;
  void *v49;
  void *v50;
  id v51;
  _QWORD v52[5];
  id v53;
  id v54;
  __int16 v55;
  uint8_t buf[4];
  id v57;
  __int16 v58;
  _BYTE v59[10];
  _BYTE v60[10];
  _BYTE v61[10];
  __int16 v62;
  id v63;

  v10 = a5;
  v51 = a7;
  v11 = objc_msgSend(v10, "type");
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "data"));
  v12 = (id)qword_1000C7120;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (objc_class *)objc_opt_class(self);
    v14 = NSStringFromClass(v13);
    v15 = (id)objc_claimAutoreleasedReturnValue(v14);
    v16 = NSStringFromSelector(a2);
    v17 = (id)objc_claimAutoreleasedReturnValue(v16);
    v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "outgoingResponseIdentifier"));
    v19 = objc_msgSend(v10, "isResponse");
    v20 = objc_msgSend(v50, "length");
    *(_DWORD *)buf = 138413570;
    if (v19)
      v21 = 89;
    else
      v21 = 78;
    v57 = v15;
    v58 = 2112;
    *(_QWORD *)v59 = v17;
    *(_WORD *)&v59[8] = 2114;
    *(_QWORD *)v60 = v18;
    *(_WORD *)&v60[8] = 1024;
    *(_DWORD *)v61 = (_DWORD)v11;
    *(_WORD *)&v61[4] = 1024;
    *(_DWORD *)&v61[6] = v21;
    v62 = 2048;
    v63 = v20;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@::%@ outgoingResponseIdentifier = %{public}@, type = %u, isResponse = %c, data length = %lu", buf, 0x36u);

  }
  v22 = +[PDURLSessionProxyCommon messageSubclassForMessageType:isReply:](PDURLSessionProxyCommon, "messageSubclassForMessageType:isReply:", v11, objc_msgSend(v10, "isResponse"));
  if (-[objc_class isEqual:](v22, "isEqual:", objc_opt_class(PBCodable)))
  {
    v23 = (id)qword_1000C7120;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v43 = (objc_class *)objc_opt_class(self);
      v44 = NSStringFromClass(v43);
      v45 = (id)objc_claimAutoreleasedReturnValue(v44);
      v46 = objc_msgSend(v10, "isResponse");
      v47 = objc_msgSend(v50, "length");
      *(_DWORD *)buf = 138413058;
      if (v46)
        v48 = 89;
      else
        v48 = 78;
      v57 = v45;
      v58 = 1024;
      *(_DWORD *)v59 = (_DWORD)v11;
      *(_WORD *)&v59[4] = 1024;
      *(_DWORD *)&v59[6] = v48;
      *(_WORD *)v60 = 2048;
      *(_QWORD *)&v60[2] = v47;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@ received protobuf of type %u which could not be decoded! isResponse = %c, data length = %lu", buf, 0x22u);

    }
    v24 = 0;
  }
  else
  {
    v25 = [v22 alloc];
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "data"));
    v24 = objc_msgSend(v25, "initWithData:", v23);
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "_nsurlsessionproxy_launchUUID"));
  if (!self->_haveReceivedMessage)
  {
    self->_haveReceivedMessage = 1;
    if (!self->_startupMessageIdentifier)
      -[PDURLSessionProxyService _onqueue_sendStartupMessage](self, "_onqueue_sendStartupMessage");
  }
  if (!v26 || (objc_msgSend(v10, "isResponse") & 1) != 0)
  {
    if ((_DWORD)v11 == 10000)
    {
      v27 = qword_1000C7120;
      if (os_log_type_enabled((os_log_t)qword_1000C7120, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Received PDURLSessionProxy Startup message (without a launchUUID)", buf, 2u);
      }
      -[PDURLSessionProxyService _onqueue_remoteDeviceStartedUp](self, "_onqueue_remoteDeviceStartedUp");
      self->_haveReceivedLegacyStartupMessage = 1;
      goto LABEL_47;
    }
    goto LABEL_21;
  }
  if ((-[NSMutableSet containsObject:](self->_receivedLaunchUUIDs, "containsObject:", v26) & 1) == 0)
  {
    v29 = qword_1000C7120;
    v30 = os_log_type_enabled((os_log_t)qword_1000C7120, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v11 == 10000)
    {
      if (!v30)
        goto LABEL_28;
      *(_DWORD *)buf = 138412290;
      v57 = v26;
      v31 = "Received PDURLSession Startup message with launchUUID %@";
    }
    else
    {
      if (!v30)
        goto LABEL_28;
      *(_DWORD *)buf = 138412290;
      v57 = v26;
      v31 = "Received PDURLSessionProxy message with new launchUUID %@";
    }
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, v31, buf, 0xCu);
LABEL_28:
    v28 = (_DWORD)v11 != 10000;
    if (self->_currentRemoteLaunchUUID || (_DWORD)v11 == 10000 || self->_haveReceivedLegacyStartupMessage)
      -[PDURLSessionProxyService _onqueue_remoteDeviceStartedUp](self, "_onqueue_remoteDeviceStartedUp");
    objc_storeStrong((id *)&self->_currentRemoteLaunchUUID, v26);
    -[NSMutableSet addObject:](self->_receivedLaunchUUIDs, "addObject:", v26);
    goto LABEL_31;
  }
  if (-[NSString isEqualToString:](self->_currentRemoteLaunchUUID, "isEqualToString:", v26))
  {
LABEL_21:
    v28 = 1;
LABEL_31:
    if (v24 && v28)
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyService _onqueue_loggableDescriptionForMessage:](self, "_onqueue_loggableDescriptionForMessage:", v24));
      v32 = (id)qword_1000C7120;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "outgoingResponseIdentifier"));
        v34 = objc_msgSend(v10, "isResponse");
        v35 = objc_msgSend(v50, "length");
        *(_DWORD *)buf = 138544386;
        if (v34)
          v36 = 89;
        else
          v36 = 78;
        v57 = v49;
        v58 = 2114;
        *(_QWORD *)v59 = v33;
        *(_WORD *)&v59[8] = 1024;
        *(_DWORD *)v60 = (_DWORD)v11;
        *(_WORD *)&v60[4] = 1024;
        *(_DWORD *)&v60[6] = v36;
        *(_WORD *)v61 = 2048;
        *(_QWORD *)&v61[2] = v35;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ receiving NSURLSession proxy message, identifier = %{public}@, type = %u, isReply = %c, data length = %lu", buf, 0x2Cu);

      }
      if (objc_msgSend(v10, "isResponse"))
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "incomingResponseIdentifier"));
        -[PDURLSessionProxyService _onqueue_handleReceivedReply:forIdentifier:ofType:withError:](self, "_onqueue_handleReceivedReply:forIdentifier:ofType:withError:", v24, v37, v11, 0);

      }
      else
      {
        v38 = objc_msgSend(v24, "_nsurlsessionproxy_sequenceNumber");
        v39 = objc_msgSend(v24, "_nsurlsessionproxy_messagePriority");
        v40 = (id)qword_1000C7120;
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "outgoingResponseIdentifier"));
          *(_DWORD *)buf = 138543874;
          v57 = v41;
          v58 = 2048;
          *(_QWORD *)v59 = v39;
          *(_WORD *)&v59[8] = 2048;
          *(_QWORD *)v60 = v38;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Incoming (non-reply) message with identifier %{public}@ has priority %lld and sequence number %llu", buf, 0x20u);

        }
        if (-[PDURLSessionProxyService verifyAndUpdateIncomingSequenceNumber:forPriority:](self, "verifyAndUpdateIncomingSequenceNumber:forPriority:", v38, v39))
        {
          v52[0] = _NSConcreteStackBlock;
          v52[1] = 3221225472;
          v52[2] = sub_1000239C8;
          v52[3] = &unk_1000B1030;
          v52[4] = self;
          v53 = v24;
          v55 = (__int16)v11;
          v54 = v51;
          -[PDURLSessionProxyService _onqueue_handleReceivedMessage:ofType:withReply:](self, "_onqueue_handleReceivedMessage:ofType:withReply:", v53, v11, v52);

        }
      }

    }
    goto LABEL_47;
  }
  v42 = qword_1000C7120;
  if (os_log_type_enabled((os_log_t)qword_1000C7120, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v57 = v26;
    _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Dropping NSURLSessionProxy message with old launchUUID %@", buf, 0xCu);
  }
LABEL_47:

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  _BOOL8 v8;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  objc_class *v18;
  NSString *v19;
  id v20;
  NSString *v21;
  void *v22;
  id v23;
  int v24;
  NSObject *v25;
  int v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;

  v8 = a6;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = (id)qword_1000C7120;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (objc_class *)objc_opt_class(self);
    v19 = NSStringFromClass(v18);
    v20 = (id)objc_claimAutoreleasedReturnValue(v19);
    v21 = NSStringFromSelector(a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = objc_msgSend(v16, "code");
    v26 = 138413570;
    if (v8)
      v24 = 89;
    else
      v24 = 78;
    v27 = v20;
    v28 = 2112;
    v29 = v22;
    v30 = 1024;
    v31 = v24;
    v32 = 2114;
    v33 = v15;
    v34 = 2112;
    v35 = v16;
    v36 = 2048;
    v37 = v23;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@::%@ success = %c, identifier = %{public}@, error = %@ [%ld]", (uint8_t *)&v26, 0x3Au);

  }
  if ((objc_msgSend(v15, "isEqualToString:", self->_startupMessageIdentifier) & 1) != 0)
  {
    if (!v8)
    {
      v25 = qword_1000C7120;
      if (os_log_type_enabled((os_log_t)qword_1000C7120, OS_LOG_TYPE_ERROR))
      {
        v26 = 138412290;
        v27 = v16;
        _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to send PDURLSessionProxy startup message, error %@", (uint8_t *)&v26, 0xCu);
      }
    }
  }
  else
  {
    -[PDURLSessionProxyService _onqueue_messageWithIdentifier:didSendWithSuccess:error:](self, "_onqueue_messageWithIdentifier:didSendWithSuccess:error:", v15, v8, v16);
  }

}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = (id)qword_1000C7120;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (objc_class *)objc_opt_class(self);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = 138412546;
    v13 = v11;
    v14 = 2112;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: activeAccountsChanged: %@", (uint8_t *)&v12, 0x16u);

  }
  if (objc_msgSend(v7, "count") && self->_startupMessageFailed)
    -[PDURLSessionProxyService _onqueue_sendStartupMessage](self, "_onqueue_sendStartupMessage");

}

- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  NSObject *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  NSString *currentRemoteLaunchUUID;
  void *v16;
  NSString *v17;
  NSString *launchUUID;
  int v19;
  void *v20;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  v11 = (id)qword_1000C7120;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (objc_class *)objc_opt_class(self);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v19 = 138412290;
    v20 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@: didSwitchActivePairedDevice", (uint8_t *)&v19, 0xCu);

  }
  currentRemoteLaunchUUID = self->_currentRemoteLaunchUUID;
  self->_currentRemoteLaunchUUID = 0;

  -[NSMutableSet removeAllObjects](self->_receivedLaunchUUIDs, "removeAllObjects");
  -[PDURLSessionProxyService _onqueue_remoteDeviceStartedUp](self, "_onqueue_remoteDeviceStartedUp");
  v10[2](v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v17 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUIDString"));
  launchUUID = self->_launchUUID;
  self->_launchUUID = v17;

  self->_haveReceivedMessage = 0;
  -[PDURLSessionProxyService _onqueue_sendStartupMessage](self, "_onqueue_sendStartupMessage");

}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (NSString)launchUUID
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLaunchUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchUUID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentRemoteLaunchUUID, 0);
  objc_storeStrong((id *)&self->_receivedLaunchUUIDs, 0);
  objc_storeStrong((id *)&self->_incomingSequenceNumbersByPriority, 0);
  objc_storeStrong((id *)&self->_outgoingSequenceNumbersByPriority, 0);
  objc_storeStrong((id *)&self->_startupMessageIdentifier, 0);
  objc_storeStrong((id *)&self->_outstandingMessages, 0);
  objc_storeStrong((id *)&self->_outstandingReplies, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
}

@end
