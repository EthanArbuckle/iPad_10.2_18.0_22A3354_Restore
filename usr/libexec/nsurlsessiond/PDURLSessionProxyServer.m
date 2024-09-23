@implementation PDURLSessionProxyServer

- (PDURLSessionProxyServer)initWithConfiguration:(id)a3 uuidString:(id)a4 options:(unint64_t)a5 delegate:(id)a6
{
  unsigned int v7;
  id v11;
  id v12;
  id v13;
  PDURLSessionProxyServer *v14;
  PDURLSessionProxyServer *v15;
  id *p_sessionConfiguration;
  uint64_t v17;
  NSString *identifier;
  int16x8_t v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  BOOL v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v30;
  NSMutableDictionary *tasks;
  NSMutableDictionary *v32;
  NSMutableDictionary *tasksToIdentifiers;
  NSMutableSet *v34;
  NSMutableSet *taskIdentifiersRetainingInfraWiFi;
  NSMutableSet *v36;
  NSMutableSet *taskIdentifiersRetainingBTLinkAssertion;
  NSMutableDictionary *v38;
  NSMutableDictionary *taskIdentifiersToSequenceNumbers;
  NSMutableDictionary *v40;
  NSMutableDictionary *taskIdentifiersToBodyStreams;
  NSMutableDictionary *v42;
  NSMutableDictionary *taskIdentifiersToInitialBodyInputStreams;
  NSMutableDictionary *v44;
  NSMutableDictionary *taskIdentifiersToWaitingReasons;
  NSMutableDictionary *v46;
  NSMutableDictionary *taskIdentifiersToPendingDataBytes;
  NSMutableDictionary *v48;
  NSMutableDictionary *taskIdentifiersToPendingDataCompletion;
  NSMutableDictionary *v50;
  NSMutableDictionary *streamTasksToOpenSocketReplies;
  NSMutableDictionary *v52;
  NSMutableDictionary *streamTasksToDeviceConnections;
  NSMutableDictionary *v54;
  NSMutableDictionary *streamTasksToIDSTCPConnections;
  NSMutableArray *v56;
  NSMutableArray *messagesToReSend;
  NSMutableSet *v58;
  NSMutableSet *deviceConnections;
  uint64_t v60;
  NSURLSession *session;
  NSString *v63;
  void *v64;
  objc_super v65;
  uint8_t buf[4];
  NSString *v67;
  __int16 v68;
  void *v69;

  v7 = a5;
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v65.receiver = self;
  v65.super_class = (Class)PDURLSessionProxyServer;
  v14 = -[PDURLSessionProxyServer init](&v65, "init");
  v15 = v14;
  if (v14)
  {
    p_sessionConfiguration = (id *)&v14->_sessionConfiguration;
    objc_storeStrong((id *)&v14->_sessionConfiguration, a3);
    objc_storeStrong((id *)&v15->_uuidString, a4);
    objc_storeStrong((id *)&v15->_delegate, a6);
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(*p_sessionConfiguration, "identifier"));
    identifier = v15->_identifier;
    v15->_identifier = (NSString *)v17;

    v15->_supportsRedirects = v7 & 1;
    v19.i64[0] = *(_QWORD *)&vshl_u16((uint16x4_t)(*(_QWORD *)&vdup_n_s16(v7) & 0xFF00FF00FF00FFLL), (uint16x4_t)0xFFFCFFFDFFFEFFFFLL) & 0xFF01FF01FF01FF01;
    *(_DWORD *)&v15->_implementsWillSendRequest = vmovn_s16(v19).u32[0];
    v15->_implementsDidReceiveResponse = (v7 & 0x20) != 0;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingFormat:](v15->_identifier, "stringByAppendingFormat:", CFSTR(" uuid:%@"), v15->_uuidString));
    objc_msgSend(v11, "setIdentifier:", v20);
    if (objc_msgSend(v11, "_nsurlsessionproxy_requiresBackgroundSession"))
    {
      objc_msgSend(*p_sessionConfiguration, "setDisposition:", CFSTR("BackgroundDisposition"));
      objc_msgSend(*p_sessionConfiguration, "set_connectionPoolName:", CFSTR("com.apple.nsurlsessiond.NSURLSessionProxyPool"));
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_companionAppBundleIdentifier"));
    v22 = v21 == 0;

    if (!v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_sessionConfiguration, "_companionAppBundleIdentifier"));
      objc_msgSend(*p_sessionConfiguration, "set_sourceApplicationBundleIdentifier:", v23);

    }
    objc_msgSend(*p_sessionConfiguration, "setURLCache:", 0);
    objc_msgSend(*p_sessionConfiguration, "setHTTPCookieStorage:", 0);
    objc_msgSend(*p_sessionConfiguration, "set_onBehalfOfPairedDevice:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_sessionConfiguration, "_sourceApplicationAuditTokenData"));
    v25 = v24 == 0;

    if (!v25)
    {
      v26 = (id)qword_1000C7120;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v63 = v15->_identifier;
        v64 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLSessionConfiguration _sourceApplicationAuditTokenData](v15->_sessionConfiguration, "_sourceApplicationAuditTokenData"));
        *(_DWORD *)buf = 138412546;
        v67 = v63;
        v68 = 2112;
        v69 = v64;
        _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "PDURLSessionProxyServer Session %@ had _sourceApplicationAuditTokenData [%@]- discarding", buf, 0x16u);

      }
      objc_msgSend(*p_sessionConfiguration, "set_sourceApplicationAuditTokenData:", 0);
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[PDURLSessionProxyServerService sharedService](PDURLSessionProxyServerService, "sharedService"));
    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "queue"));
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v28;

    v30 = objc_opt_new(NSMutableDictionary);
    tasks = v15->_tasks;
    v15->_tasks = v30;

    v32 = objc_opt_new(NSMutableDictionary);
    tasksToIdentifiers = v15->_tasksToIdentifiers;
    v15->_tasksToIdentifiers = v32;

    v34 = objc_opt_new(NSMutableSet);
    taskIdentifiersRetainingInfraWiFi = v15->_taskIdentifiersRetainingInfraWiFi;
    v15->_taskIdentifiersRetainingInfraWiFi = v34;

    v36 = objc_opt_new(NSMutableSet);
    taskIdentifiersRetainingBTLinkAssertion = v15->_taskIdentifiersRetainingBTLinkAssertion;
    v15->_taskIdentifiersRetainingBTLinkAssertion = v36;

    v38 = objc_opt_new(NSMutableDictionary);
    taskIdentifiersToSequenceNumbers = v15->_taskIdentifiersToSequenceNumbers;
    v15->_taskIdentifiersToSequenceNumbers = v38;

    v40 = objc_opt_new(NSMutableDictionary);
    taskIdentifiersToBodyStreams = v15->_taskIdentifiersToBodyStreams;
    v15->_taskIdentifiersToBodyStreams = v40;

    v42 = objc_opt_new(NSMutableDictionary);
    taskIdentifiersToInitialBodyInputStreams = v15->_taskIdentifiersToInitialBodyInputStreams;
    v15->_taskIdentifiersToInitialBodyInputStreams = v42;

    v44 = objc_opt_new(NSMutableDictionary);
    taskIdentifiersToWaitingReasons = v15->_taskIdentifiersToWaitingReasons;
    v15->_taskIdentifiersToWaitingReasons = v44;

    v46 = objc_opt_new(NSMutableDictionary);
    taskIdentifiersToPendingDataBytes = v15->_taskIdentifiersToPendingDataBytes;
    v15->_taskIdentifiersToPendingDataBytes = v46;

    v48 = objc_opt_new(NSMutableDictionary);
    taskIdentifiersToPendingDataCompletion = v15->_taskIdentifiersToPendingDataCompletion;
    v15->_taskIdentifiersToPendingDataCompletion = v48;

    v50 = objc_opt_new(NSMutableDictionary);
    streamTasksToOpenSocketReplies = v15->_streamTasksToOpenSocketReplies;
    v15->_streamTasksToOpenSocketReplies = v50;

    v52 = objc_opt_new(NSMutableDictionary);
    streamTasksToDeviceConnections = v15->_streamTasksToDeviceConnections;
    v15->_streamTasksToDeviceConnections = v52;

    v54 = objc_opt_new(NSMutableDictionary);
    streamTasksToIDSTCPConnections = v15->_streamTasksToIDSTCPConnections;
    v15->_streamTasksToIDSTCPConnections = v54;

    v56 = objc_opt_new(NSMutableArray);
    messagesToReSend = v15->_messagesToReSend;
    v15->_messagesToReSend = v56;

    v58 = objc_opt_new(NSMutableSet);
    deviceConnections = v15->_deviceConnections;
    v15->_deviceConnections = v58;

    v60 = objc_claimAutoreleasedReturnValue(+[NSURLSession _sessionWithConfiguration:delegate:delegateDispatchQueue:](NSURLSession, "_sessionWithConfiguration:delegate:delegateDispatchQueue:", v15->_sessionConfiguration, v15, v15->_queue));
    session = v15->_session;
    v15->_session = (NSURLSession *)v60;

    v15->_isInvalid = 0;
  }

  return v15;
}

- (id)getTaskInformation
{
  void *v3;
  void *v4;
  NSMutableDictionary *tasks;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer identifier](self, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  tasks = self->_tasks;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10005A824;
  v11[3] = &unk_1000B1B98;
  v6 = v3;
  v12 = v6;
  v7 = v4;
  v13 = v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](tasks, "enumerateKeysAndObjectsUsingBlock:", v11);
  v8 = v13;
  v9 = v7;

  return v9;
}

- (int64_t)messagePriorityForTaskWithIdentifier:(unint64_t)a3 isReply:(BOOL)a4
{
  unsigned int v7;
  int64_t v8;
  NSMutableDictionary *tasks;
  void *v10;
  void *v11;
  NSURLSessionConfiguration *sessionConfiguration;

  v7 = -[NSURLSessionConfiguration _requiresSustainedDataDelivery](self->_sessionConfiguration, "_requiresSustainedDataDelivery");
  if (v7)
    v8 = 300;
  else
    v8 = 200;
  if ((v7 & 1) == 0 && !a4)
  {
    tasks = self->_tasks;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](tasks, "objectForKeyedSubscript:", v10));

    sessionConfiguration = self->_sessionConfiguration;
    if (v11)
    {
      if (-[NSURLSessionConfiguration isDiscretionary](sessionConfiguration, "isDiscretionary"))
      {
        v8 = 100;
      }
      else if ((uint64_t)objc_msgSend(v11, "_priority") <= 399)
      {
        v8 = 200;
      }
      else
      {
        v8 = 100;
      }
    }
    else if (-[NSURLSessionConfiguration isDiscretionary](sessionConfiguration, "isDiscretionary"))
    {
      v8 = 100;
    }
    else
    {
      v8 = 200;
    }

  }
  return v8;
}

- (id)sourceApplicationBundleIdentifier
{
  return -[NSURLSessionConfiguration _sourceApplicationBundleIdentifier](self->_sessionConfiguration, "_sourceApplicationBundleIdentifier");
}

- (int64_t)IDSMessageTimeout
{
  return (int64_t)-[NSURLSessionConfiguration _IDSMessageTimeout](self->_sessionConfiguration, "_IDSMessageTimeout");
}

- (id)messageLoggableDescriptionForTaskWithIdentifier:(unint64_t)a3
{
  void *v3;

  if (a3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer descriptionForTaskWithIdentifier:](self, "descriptionForTaskWithIdentifier:"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Session <%@>"), self->_uuidString));
  return v3;
}

- (BOOL)shouldRetainInfraWiFi
{
  unsigned int v3;

  v3 = -[NSURLSessionConfiguration _prefersInfraWiFi](self->_sessionConfiguration, "_prefersInfraWiFi");
  if (v3)
    LOBYTE(v3) = !-[NSURLSessionConfiguration isDiscretionary](self->_sessionConfiguration, "isDiscretionary");
  return v3;
}

- (void)retainInfraWiFiForTaskWithIdentifier:(unint64_t)a3
{
  NSMutableSet *taskIdentifiersRetainingInfraWiFi;
  NSMutableSet *v6;
  id v7;
  id v8;
  id v9;

  taskIdentifiersRetainingInfraWiFi = self->_taskIdentifiersRetainingInfraWiFi;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  LOBYTE(taskIdentifiersRetainingInfraWiFi) = -[NSMutableSet containsObject:](taskIdentifiersRetainingInfraWiFi, "containsObject:");

  if ((taskIdentifiersRetainingInfraWiFi & 1) == 0)
  {
    v6 = self->_taskIdentifiersRetainingInfraWiFi;
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    -[NSMutableSet addObject:](v6, "addObject:");

    v9 = (id)objc_claimAutoreleasedReturnValue(+[PDURLSessionProxyServerService sharedService](PDURLSessionProxyServerService, "sharedService"));
    objc_msgSend(v9, "retainInfraWiFi");

  }
}

- (void)releaseInfraWiFiForTaskIfNecessary:(unint64_t)a3
{
  NSMutableSet *taskIdentifiersRetainingInfraWiFi;
  NSMutableSet *v6;
  id v7;
  id v8;
  id v9;

  taskIdentifiersRetainingInfraWiFi = self->_taskIdentifiersRetainingInfraWiFi;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  LODWORD(taskIdentifiersRetainingInfraWiFi) = -[NSMutableSet containsObject:](taskIdentifiersRetainingInfraWiFi, "containsObject:");

  if ((_DWORD)taskIdentifiersRetainingInfraWiFi)
  {
    v6 = self->_taskIdentifiersRetainingInfraWiFi;
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    -[NSMutableSet removeObject:](v6, "removeObject:");

    v9 = (id)objc_claimAutoreleasedReturnValue(+[PDURLSessionProxyServerService sharedService](PDURLSessionProxyServerService, "sharedService"));
    objc_msgSend(v9, "releaseInfraWiFi");

  }
}

- (BOOL)shouldRetainBTLinkAssertion
{
  if (qword_1000C7098 != -1)
    dispatch_once(&qword_1000C7098, &stru_1000B17D8);
  if (byte_1000C7090)
    return -[NSURLSessionConfiguration _requiresSustainedDataDelivery](self->_sessionConfiguration, "_requiresSustainedDataDelivery");
  else
    return 0;
}

- (void)retainBTLinkAssertionWithIdentifier:(unint64_t)a3
{
  NSMutableSet *taskIdentifiersRetainingBTLinkAssertion;
  NSMutableSet *v6;
  id v7;
  id v8;
  id v9;

  taskIdentifiersRetainingBTLinkAssertion = self->_taskIdentifiersRetainingBTLinkAssertion;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  LOBYTE(taskIdentifiersRetainingBTLinkAssertion) = -[NSMutableSet containsObject:](taskIdentifiersRetainingBTLinkAssertion, "containsObject:");

  if ((taskIdentifiersRetainingBTLinkAssertion & 1) == 0)
  {
    v6 = self->_taskIdentifiersRetainingBTLinkAssertion;
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    -[NSMutableSet addObject:](v6, "addObject:");

    v9 = (id)objc_claimAutoreleasedReturnValue(+[PDURLSessionProxyServerService sharedService](PDURLSessionProxyServerService, "sharedService"));
    objc_msgSend(v9, "retainBTLinkAssertion");

  }
}

- (void)releaseBTLinkAssertionIfNecessary:(unint64_t)a3
{
  NSMutableSet *taskIdentifiersRetainingBTLinkAssertion;
  NSMutableSet *v6;
  id v7;
  id v8;
  id v9;

  taskIdentifiersRetainingBTLinkAssertion = self->_taskIdentifiersRetainingBTLinkAssertion;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  LODWORD(taskIdentifiersRetainingBTLinkAssertion) = -[NSMutableSet containsObject:](taskIdentifiersRetainingBTLinkAssertion, "containsObject:");

  if ((_DWORD)taskIdentifiersRetainingBTLinkAssertion)
  {
    v6 = self->_taskIdentifiersRetainingBTLinkAssertion;
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    -[NSMutableSet removeObject:](v6, "removeObject:");

    v9 = (id)objc_claimAutoreleasedReturnValue(+[PDURLSessionProxyServerService sharedService](PDURLSessionProxyServerService, "sharedService"));
    objc_msgSend(v9, "releaseBTLinkAssertion");

  }
}

- (void)obliterate
{
  self->_skipInvalidateMessage = 1;
  self->_isInvalid = 1;
  -[NSURLSession invalidateAndCancel](self->_session, "invalidateAndCancel");
}

- (void)devicesConnected
{
  NSMutableArray *v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = self->_messagesToReSend;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        -[PDURLSessionProxyServer resendPendingMessage:](self, "resendPendingMessage:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), (_QWORD)v7);
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

  -[NSMutableArray removeAllObjects](self->_messagesToReSend, "removeAllObjects");
}

- (void)resendPendingMessage:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int16 v5;
  void *v6;
  id v7;

  v7 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("message")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("type")));
  v5 = (unsigned __int16)objc_msgSend(v4, "unsignedIntegerValue");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[PDURLSessionProxyServerService sharedService](PDURLSessionProxyServerService, "sharedService"));
  objc_msgSend(v6, "sendProtobufMessage:ofType:withReply:", v3, v5, 0);

}

- (id)baseMessage
{
  PDURLSessionProxySessionMessage *v3;

  v3 = objc_opt_new(PDURLSessionProxySessionMessage);
  -[PDURLSessionProxySessionMessage setSessionIdentifier:](v3, "setSessionIdentifier:", self->_identifier);
  -[PDURLSessionProxySessionMessage setUuidString:](v3, "setUuidString:", self->_uuidString);
  return v3;
}

- (id)taskMessageForIdentifier:(unint64_t)a3
{
  PDURLSessionProxyTaskMessage *v5;
  void *v6;

  v5 = objc_opt_new(PDURLSessionProxyTaskMessage);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer baseMessage](self, "baseMessage"));
  -[PDURLSessionProxyTaskMessage setSession:](v5, "setSession:", v6);

  -[PDURLSessionProxyTaskMessage setTaskIdentifier:](v5, "setTaskIdentifier:", a3);
  return v5;
}

- (id)descriptionForTaskWithIdentifier:(unint64_t)a3
{
  NSMutableDictionary *tasks;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  tasks = self->_tasks;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](tasks, "objectForKeyedSubscript:", v5));

  if (v6)
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_loggableDescription"));
  else
    v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Task <?>.<%lu>"), a3));
  v8 = (void *)v7;

  return v8;
}

- (void)handleMessage:(id)a3 ofType:(unsigned __int16)a4 withReply:(id)a5
{
  int v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSString *identifier;
  int v14;
  NSString *v15;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_nsurlsessionproxy_sessionUUID"));
  v11 = objc_msgSend(v8, "_nsurlsessionproxy_taskIdentifier");
  if (v10 && (objc_msgSend(v10, "isEqualToString:", self->_uuidString) & 1) == 0)
  {
    v12 = qword_1000C7120;
    if (os_log_type_enabled((os_log_t)qword_1000C7120, OS_LOG_TYPE_DEFAULT))
    {
      identifier = self->_identifier;
      v14 = 138412290;
      v15 = identifier;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PDURLSessionProxyClient Session %@ received message with non-matching session UUID; dropping message",
        (uint8_t *)&v14,
        0xCu);
    }
  }
  else
  {
    switch(v6)
    {
      case 2:
        -[PDURLSessionProxyServer handleDataTaskWithRequestMessage:forTaskIdentifier:withReply:](self, "handleDataTaskWithRequestMessage:forTaskIdentifier:withReply:", v8, v11, v9);
        break;
      case 3:
        -[PDURLSessionProxyServer handleCancelTaskMessage:forTaskIdentifier:](self, "handleCancelTaskMessage:forTaskIdentifier:", v8, v11);
        break;
      case 4:
        -[PDURLSessionProxyServer handleSuspendTaskMessage:forTaskIdentifier:](self, "handleSuspendTaskMessage:forTaskIdentifier:", v8, v11);
        break;
      case 5:
        -[PDURLSessionProxyServer handleResumeTaskMessage:forTaskIdentifier:withReply:](self, "handleResumeTaskMessage:forTaskIdentifier:withReply:", v8, v11, v9);
        break;
      case 6:
        -[PDURLSessionProxyServer handleSetDescriptionMessage:forTaskIdentifier:](self, "handleSetDescriptionMessage:forTaskIdentifier:", v8, v11);
        break;
      case 7:
        -[PDURLSessionProxyServer handleSetPriorityMessage:forTaskIdentifier:](self, "handleSetPriorityMessage:forTaskIdentifier:", v8, v11);
        break;
      case 8:
        -[PDURLSessionProxyServer handleInvalidateMessage:](self, "handleInvalidateMessage:", v8);
        break;
      default:
        if (v6 == 2001)
        {
          -[PDURLSessionProxyServer handleUploadBodyDataMessage:forTaskIdentifier:withReply:](self, "handleUploadBodyDataMessage:forTaskIdentifier:withReply:", v8, v11, v9);
        }
        else if (v6 == 3001)
        {
          -[PDURLSessionProxyServer handleOpenSocketMessage:withReply:](self, "handleOpenSocketMessage:withReply:", v8, v9);
        }
        break;
    }
  }

}

- (void)handleFailedMessageSend:(id)a3 ofType:(unsigned __int16)a4
{
  int v4;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  dispatch_time_t v11;
  NSObject *queue;
  id v13;
  NSMutableDictionary *taskIdentifiersToWaitingReasons;
  void *v15;
  NSMutableDictionary *tasks;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[2];
  _QWORD v28[2];
  uint8_t buf[4];
  void *v30;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "_nsurlsessionproxy_taskIdentifier"))
  {
    v7 = objc_msgSend(v6, "_nsurlsessionproxy_taskIdentifier");
    if (v4 == 1009)
    {
      taskIdentifiersToWaitingReasons = self->_taskIdentifiersToWaitingReasons;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
      -[NSMutableDictionary removeObjectForKey:](taskIdentifiersToWaitingReasons, "removeObjectForKey:", v15);

    }
    else if (v4 == 1005)
    {
      v8 = (id)qword_1000C7120;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer descriptionForTaskWithIdentifier:](self, "descriptionForTaskWithIdentifier:", v7));
        *(_DWORD *)buf = 138543362;
        v30 = v23;
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}@ didCompleteWithError message failed to send, so re-sending when devices are connected", buf, 0xCu);

      }
      v27[0] = CFSTR("message");
      v27[1] = CFSTR("type");
      v28[0] = v6;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 1005));
      v28[1] = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 2));

      -[NSMutableArray addObject:](self->_messagesToReSend, "addObject:", v10);
      v11 = dispatch_time(0, 10000000000);
      queue = self->_queue;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10005A79C;
      v25[3] = &unk_1000B23F0;
      v25[4] = self;
      v26 = v10;
      v13 = v10;
      dispatch_after(v11, queue, v25);

    }
    else
    {
      tasks = self->_tasks;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](tasks, "objectForKeyedSubscript:", v17));

      if (v18)
      {
        v19 = (id)qword_1000C7120;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer descriptionForTaskWithIdentifier:](self, "descriptionForTaskWithIdentifier:", v7));
          *(_DWORD *)buf = 138543362;
          v30 = v24;
          _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}@ message failed to send, so canceling task", buf, 0xCu);

        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "currentRequest"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "URL"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _web_errorWithDomain:code:URL:](NSError, "_web_errorWithDomain:code:URL:", NSURLErrorDomain, -997, v21));

        objc_msgSend(v18, "_nsurlsessionproxy_cancelWithError:", v22);
      }

    }
  }

}

- (void)handleDataTaskWithRequestMessage:(id)a3 forTaskIdentifier:(unint64_t)a4 withReply:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  NSString *v11;
  NSObject *v12;
  NSString *identifier;
  PDURLSessionProxyDataTaskWithRequestReply *v14;
  NSMutableDictionary *tasks;
  void *v16;
  void *v17;
  NSMutableDictionary *v18;
  void *v19;
  void *v20;
  NSString *v21;
  NSMutableDictionary *taskIdentifiersToSequenceNumbers;
  void *v23;
  void *v24;
  NSString *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  NSMutableDictionary *v31;
  void *v32;
  NSMutableDictionary *v33;
  void *v34;
  PDURLSessionProxyDataTaskWithRequestReply *v35;
  void *v36;
  unsigned int v37;
  NSString *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  NSMutableDictionary *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  NSString *v51;
  void *v52;
  NSMutableDictionary *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  NSObject *v59;
  void *v60;
  PDURLSessionProxyDataTaskWithRequestReply *v61;
  uint8_t buf[4];
  unint64_t v63;
  __int16 v64;
  NSString *v65;
  __int16 v66;
  NSString *v67;

  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentRequest"));
  v11 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_actualRequest"));

  v12 = qword_1000C7120;
  if (os_log_type_enabled((os_log_t)qword_1000C7120, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 134218498;
    v63 = a4;
    v64 = 2112;
    v65 = identifier;
    v66 = 2112;
    v67 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "dataTaskWithRequest message forTaskIdentifier %lu in session %@, currentRequest = %@", buf, 0x20u);
  }
  v14 = objc_opt_new(PDURLSessionProxyDataTaskWithRequestReply);
  tasks = self->_tasks;
  v61 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](tasks, "objectForKeyedSubscript:", v16));
  LOBYTE(tasks) = v17 == 0;

  if ((tasks & 1) == 0)
  {
    v18 = self->_tasks;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", v19));

    v21 = (NSString *)objc_msgSend(v8, "taskSequenceNumber");
    taskIdentifiersToSequenceNumbers = self->_taskIdentifiersToSequenceNumbers;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](taskIdentifiersToSequenceNumbers, "objectForKeyedSubscript:", v23));
    v25 = (NSString *)objc_msgSend(v24, "unsignedIntegerValue");

    v26 = (id)qword_1000C7120;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer descriptionForTaskWithIdentifier:](self, "descriptionForTaskWithIdentifier:", a4));
      *(_DWORD *)buf = 138543874;
      v63 = (unint64_t)v27;
      v64 = 2048;
      v65 = v21;
      v66 = 2048;
      v67 = v25;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ received task creation message and that task already exists. Sequence number: %llu, existing sequence number: %llu", buf, 0x20u);

    }
    v28 = (id)qword_1000C7120;
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
    if (v21 <= v25)
    {
      if (v29)
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer descriptionForTaskWithIdentifier:](self, "descriptionForTaskWithIdentifier:", a4));
        *(_DWORD *)buf = 138543362;
        v63 = (unint64_t)v41;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ received duplicate task creation message. Dropping message", buf, 0xCu);

      }
      if (!self->_isInvalid)
        goto LABEL_20;
      goto LABEL_17;
    }
    if (v29)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer taskMessageForIdentifier:](self, "taskMessageForIdentifier:", a4));
      *(_DWORD *)buf = 138543362;
      v63 = (unint64_t)v30;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ canceling exisitng task since we received a new request for that task with a higher sequence number", buf, 0xCu);

    }
    v31 = self->_tasks;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    -[NSMutableDictionary removeObjectForKey:](v31, "removeObjectForKey:", v32);

    -[NSMutableDictionary removeObjectForKey:](self->_tasksToIdentifiers, "removeObjectForKey:", v20);
    v33 = self->_taskIdentifiersToSequenceNumbers;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    -[NSMutableDictionary removeObjectForKey:](v33, "removeObjectForKey:", v34);

    -[PDURLSessionProxyServer releaseInfraWiFiForTaskIfNecessary:](self, "releaseInfraWiFiForTaskIfNecessary:", a4);
    -[PDURLSessionProxyServer releaseBTLinkAssertionIfNecessary:](self, "releaseBTLinkAssertionIfNecessary:", a4);
    objc_msgSend(v20, "cancel");

  }
  if (self->_isInvalid)
  {
LABEL_17:
    v42 = (id)qword_1000C7120;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer descriptionForTaskWithIdentifier:](self, "descriptionForTaskWithIdentifier:", a4));
      *(_DWORD *)buf = 138543362;
      v63 = (unint64_t)v43;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ received task creation message for invalidated session. Dropping message", buf, 0xCu);

    }
    goto LABEL_20;
  }
  v35 = v61;
  if (-[NSString _nsurlsessionproxy_isSafeRequest](v11, "_nsurlsessionproxy_isSafeRequest"))
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLProtocol propertyForKey:inRequest:](NSURLProtocol, "propertyForKey:inRequest:", CFSTR("_kCFNetworkProxySessionNeedsNewBodyStreamSignal"), v11));
    v37 = objc_msgSend(v36, "BOOLValue");

    if (v37)
    {
      v38 = (NSString *)-[NSString mutableCopy](v11, "mutableCopy");
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSInputStream inputStreamWithData:](NSInputStream, "inputStreamWithData:", v39));

      objc_msgSend(v40, "open");
      objc_msgSend(v40, "close");
      -[NSString setHTTPBodyStream:](v38, "setHTTPBodyStream:", v40);

    }
    else
    {
      v38 = v11;
    }
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLSession dataTaskWithRequest:](self->_session, "dataTaskWithRequest:", v38));
    v46 = self->_tasks;
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v46, "setObject:forKeyedSubscript:", v45, v47);

    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tasksToIdentifiers, "setObject:forKeyedSubscript:", v48, v45);

    if (objc_msgSend(v45, "taskIdentifier") != (id)a4)
    {
      v49 = (id)qword_1000C7120;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        v50 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer descriptionForTaskWithIdentifier:](self, "descriptionForTaskWithIdentifier:", a4));
        v51 = (NSString *)objc_msgSend(v45, "taskIdentifier");
        *(_DWORD *)buf = 138543618;
        v63 = (unint64_t)v50;
        v64 = 2048;
        v65 = v51;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%{public}@ using local task identifier %lu", buf, 0x16u);

      }
    }
    if (objc_msgSend(v8, "taskSequenceNumber"))
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v8, "taskSequenceNumber")));
      v53 = self->_taskIdentifiersToSequenceNumbers;
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v53, "setObject:forKeyedSubscript:", v52, v54);

    }
    v55 = objc_alloc((Class)__NSCFURLSessionTaskInfo);
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "_uniqueIdentifier"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer identifier](self, "identifier"));
    v58 = objc_msgSend(v55, "initWithDataTask:uniqueIdentifier:bundleID:sessionID:", v45, v56, 0, v57);

    v59 = (id)qword_1000C7120;
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer descriptionForTaskWithIdentifier:](self, "descriptionForTaskWithIdentifier:", a4));
      *(_DWORD *)buf = 138543362;
      v63 = (unint64_t)v60;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "%{public}@ acknowledging dataTaskWithRequest message", buf, 0xCu);

    }
    -[PDURLSessionProxyDataTaskWithRequestReply _setActualTaskInfo:](v61, "_setActualTaskInfo:", v58);

    v11 = v38;
LABEL_20:
    v35 = v61;
    goto LABEL_21;
  }
  v44 = qword_1000C7120;
  if (os_log_type_enabled((os_log_t)qword_1000C7120, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v63 = (unint64_t)v11;
    _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Received proxy request %@ with non-http URL. Dropping request.", buf, 0xCu);
  }
LABEL_21:
  v9[2](v9, v35);

}

- (void)handleCancelTaskMessage:(id)a3 forTaskIdentifier:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSMutableDictionary *tasks;
  void *v10;
  void *v11;
  int v12;
  void *v13;

  v6 = a3;
  v7 = (id)qword_1000C7120;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer descriptionForTaskWithIdentifier:](self, "descriptionForTaskWithIdentifier:", a4));
    v12 = 138543362;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ receiving cancel task message", (uint8_t *)&v12, 0xCu);

  }
  tasks = self->_tasks;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](tasks, "objectForKeyedSubscript:", v10));

  objc_msgSend(v11, "cancel");
}

- (void)handleSuspendTaskMessage:(id)a3 forTaskIdentifier:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSMutableDictionary *tasks;
  void *v10;
  void *v11;
  int v12;
  void *v13;

  v6 = a3;
  v7 = (id)qword_1000C7120;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer descriptionForTaskWithIdentifier:](self, "descriptionForTaskWithIdentifier:", a4));
    v12 = 138543362;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ receiving suspend task message", (uint8_t *)&v12, 0xCu);

  }
  tasks = self->_tasks;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](tasks, "objectForKeyedSubscript:", v10));

  objc_msgSend(v11, "suspend");
}

- (void)handleResumeTaskMessage:(id)a3 forTaskIdentifier:(unint64_t)a4 withReply:(id)a5
{
  id v8;
  void (**v9)(id, id);
  void *v10;
  NSObject *v11;
  void *v12;
  NSMutableDictionary *tasks;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;

  v8 = a3;
  v9 = (void (**)(id, id))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_actualAdditionalProperties"));
  v11 = (id)qword_1000C7120;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer descriptionForTaskWithIdentifier:](self, "descriptionForTaskWithIdentifier:", a4));
    v20 = 138543618;
    v21 = v12;
    v22 = 2112;
    v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ receiving resume task message, props %@", (uint8_t *)&v20, 0x16u);

  }
  tasks = self->_tasks;
  v14 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](tasks, "objectForKeyedSubscript:", v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("effectiveConfig")));
  LOBYTE(v14) = v16 == 0;

  if ((v14 & 1) == 0)
  {
    v17 = (id)qword_1000C7120;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer descriptionForTaskWithIdentifier:](self, "descriptionForTaskWithIdentifier:", a4));
      v20 = 138543362;
      v21 = v19;
      _os_log_fault_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "%{public}@ dropping effective configuration", (uint8_t *)&v20, 0xCu);

    }
    v18 = objc_msgSend(v10, "mutableCopy");
    objc_msgSend(v18, "setObject:forKeyedSubscript:", 0, CFSTR("effectiveConfig"));

    v10 = v18;
  }
  sub_10000C984(v15, v10);
  objc_msgSend(v15, "resume");
  v9[2](v9, v8);

}

- (void)handleSetDescriptionMessage:(id)a3 forTaskIdentifier:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSMutableDictionary *tasks;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "taskDescription"));
  v8 = (id)qword_1000C7120;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer descriptionForTaskWithIdentifier:](self, "descriptionForTaskWithIdentifier:", a4));
    v13 = 138543618;
    v14 = v9;
    v15 = 2112;
    v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ receiving set description message, description = %@", (uint8_t *)&v13, 0x16u);

  }
  tasks = self->_tasks;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](tasks, "objectForKeyedSubscript:", v11));

  objc_msgSend(v12, "setTaskDescription:", v7);
}

- (void)handleSetPriorityMessage:(id)a3 forTaskIdentifier:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSMutableDictionary *tasks;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;

  v6 = a3;
  v7 = objc_msgSend(v6, "priority");
  v8 = (id)qword_1000C7120;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer descriptionForTaskWithIdentifier:](self, "descriptionForTaskWithIdentifier:", a4));
    v13 = 138543618;
    v14 = v9;
    v15 = 2048;
    v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ receiving set priority message, priority = %lld", (uint8_t *)&v13, 0x16u);

  }
  tasks = self->_tasks;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](tasks, "objectForKeyedSubscript:", v11));

  objc_msgSend(v12, "set_priority:", v7);
}

- (void)handleInvalidateMessage:(id)a3
{
  id v4;
  unsigned int v5;
  NSURLSession *session;
  id v7;

  v4 = a3;
  self->_isInvalid = 1;
  v7 = v4;
  v5 = objc_msgSend(v4, "shouldCancel");
  session = self->_session;
  if (v5)
    -[NSURLSession invalidateAndCancel](session, "invalidateAndCancel");
  else
    -[NSURLSession finishTasksAndInvalidate](session, "finishTasksAndInvalidate");

}

- (void)handleUploadBodyDataMessage:(id)a3 forTaskIdentifier:(unint64_t)a4 withReply:(id)a5
{
  id v8;
  id v9;
  PDURLSessionProxyUploadBodyData *v10;
  NSMutableDictionary *taskIdentifiersToBodyStreams;
  void *v12;
  void *v13;
  NSMutableDictionary *tasks;
  void *v15;
  void *v16;
  dispatch_queue_global_t global_queue;
  NSObject *v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  PDURLSessionProxyServer *v23;
  id v24;
  PDURLSessionProxyUploadBodyData *v25;
  id v26;
  unint64_t v27;

  v8 = a3;
  v9 = a5;
  v10 = objc_opt_new(PDURLSessionProxyUploadBodyData);
  taskIdentifiersToBodyStreams = self->_taskIdentifiersToBodyStreams;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](taskIdentifiersToBodyStreams, "objectForKeyedSubscript:", v12));

  if (v13)
  {
    tasks = self->_tasks;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](tasks, "objectForKeyedSubscript:", v15));

    global_queue = dispatch_get_global_queue(0, 0);
    v18 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005A478;
    block[3] = &unk_1000B1BC0;
    v21 = v8;
    v22 = v13;
    v23 = self;
    v27 = a4;
    v24 = v16;
    v26 = v9;
    v25 = v10;
    v19 = v16;
    dispatch_async(v18, block);

  }
}

- (void)handleOpenSocketMessage:(id)a3 withReply:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _BYTE *v22;
  _BYTE buf[24];
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _QWORD v27[3];
  _QWORD v28[3];

  v6 = a3;
  v18 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "socketUUID"));
  v8 = (id)qword_1000C7120;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "host"));
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v24) = objc_msgSend(v6, "port");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Open IDS Socket with UUID %@ to host %@ port %d", buf, 0x1Cu);

  }
  v27[0] = IDSOpenSocketOptionPriorityKey;
  v27[1] = IDSOpenSocketOptionStreamNameKey;
  v28[0] = &off_1000B4A48;
  v28[1] = v7;
  v27[2] = IDSOpenSocketOptionTransportKey;
  v28[2] = &off_1000B4A60;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 3));
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v24 = sub_10005A190;
  v25 = sub_10005A1A0;
  v26 = 0;
  v11 = objc_alloc((Class)IDSDeviceConnection);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[PDURLSessionProxyServerService sharedService](PDURLSessionProxyServerService, "sharedService"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "defaultPairedDevice"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10005A1A8;
  v19[3] = &unk_1000B1C10;
  v19[4] = self;
  v14 = v6;
  v20 = v14;
  v22 = buf;
  v15 = v18;
  v21 = v15;
  v16 = objc_msgSend(v11, "initSocketWithDevice:options:completionHandler:queue:", v13, v10, v19, self->_queue);
  v17 = *(void **)(*(_QWORD *)&buf[8] + 40);
  *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v16;

  -[NSMutableSet addObject:](self->_deviceConnections, "addObject:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
  _Block_object_dispose(buf, 8);

}

- (void)performForwardingFromTCPConnection:(id)a3 toStreamTask:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  PDURLSessionProxyServer *v11;
  id v12;

  v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100059F0C;
  v9[3] = &unk_1000B1C60;
  v10 = a4;
  v11 = self;
  v12 = v6;
  v7 = v6;
  v8 = v10;
  tcp_connection_read(v7, 1, 0x40000, v9);

}

- (void)performForwardingFromStreamTask:(id)a3 toTCPConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_taskGroup"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_groupConfiguration"));
  objc_msgSend(v9, "timeoutIntervalForRequest");
  v11 = v10;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100059B90;
  v14[3] = &unk_1000B1CD8;
  v14[4] = self;
  v12 = v7;
  v15 = v12;
  v13 = v6;
  v16 = v13;
  objc_msgSend(v13, "readDataOfMinLength:maxLength:timeout:completionHandler:", 1, 0x40000, v14, v11);

}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  PDURLSessionProxySessionBecameInvalid *v11;
  id v12;
  void *v13;
  void *v14;
  NSMutableSet *v15;
  id v16;
  uint64_t v17;
  void *i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;

  v6 = a3;
  v7 = a4;
  v8 = (id)qword_1000C7120;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "configuration"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
    *(_DWORD *)buf = 138412802;
    v25 = v10;
    v26 = 2112;
    v27 = v7;
    v28 = 2048;
    v29 = objc_msgSend(v7, "code");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Session %@ became invalid with error %@ [%ld]", buf, 0x20u);

  }
  if (!self->_skipInvalidateMessage)
  {
    v11 = objc_opt_new(PDURLSessionProxySessionBecameInvalid);
    v12 = -[PDURLSessionProxyError _initWithActualError:]([PDURLSessionProxyError alloc], "_initWithActualError:", v7);
    -[PDURLSessionProxySessionBecameInvalid setError:](v11, "setError:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer baseMessage](self, "baseMessage"));
    -[PDURLSessionProxySessionBecameInvalid setSession:](v11, "setSession:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[PDURLSessionProxyServerService sharedService](PDURLSessionProxyServerService, "sharedService"));
    objc_msgSend(v14, "sendProtobufMessage:ofType:withReply:", v11, 1008, 0);

  }
  -[PDURLSessionProxyServerDelegate proxyServerBecameInvalid:](self->_delegate, "proxyServerBecameInvalid:", self);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v15 = self->_deviceConnections;
  v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), "close", (_QWORD)v19);
      }
      v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v16);
  }

  -[NSMutableSet removeAllObjects](self->_deviceConnections, "removeAllObjects");
}

- (void)_URLSession:(id)a3 connectionEstablishedForStreamTask:(id)a4
{
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  PDURLSessionProxyOpenSocketReply *v7;
  id v8;

  v8 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTasksToOpenSocketReplies, "objectForKeyedSubscript:"));

  if (v5)
  {
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTasksToOpenSocketReplies, "objectForKeyedSubscript:", v8));
    v7 = objc_opt_new(PDURLSessionProxyOpenSocketReply);
    ((void (**)(_QWORD, PDURLSessionProxyOpenSocketReply *))v6)[2](v6, v7);
    -[NSMutableDictionary removeObjectForKey:](self->_streamTasksToOpenSocketReplies, "removeObjectForKey:", v8);

  }
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  PDURLSessionProxyDidReceiveChallenge *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tasksToIdentifiers, "objectForKeyedSubscript:", v9));
  v13 = objc_msgSend(v12, "unsignedIntegerValue");

  v14 = (id)qword_1000C7120;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer descriptionForTaskWithIdentifier:](self, "descriptionForTaskWithIdentifier:", v13));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "protectionSpace"));
    *(_DWORD *)buf = 138543874;
    v25 = v15;
    v26 = 2112;
    v27 = v10;
    v28 = 2112;
    v29 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ didReceiveChallenge: %@, protection space: %@", buf, 0x20u);

  }
  if (self->_implementsSessionAuthChallenge || self->_implementsTaskAuthChallenge)
  {
    v17 = objc_opt_new(PDURLSessionProxyDidReceiveChallenge);
    v18 = -[PDURLSessionProxyAuthChallenge _initWithActualAuthChallenge:]([PDURLSessionProxyAuthChallenge alloc], "_initWithActualAuthChallenge:", v10);
    -[PDURLSessionProxyDidReceiveChallenge setChallenge:](v17, "setChallenge:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer taskMessageForIdentifier:](self, "taskMessageForIdentifier:", v13));
    -[PDURLSessionProxyDidReceiveChallenge setTask:](v17, "setTask:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[PDURLSessionProxyServerService sharedService](PDURLSessionProxyServerService, "sharedService"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100059A10;
    v21[3] = &unk_1000B1D00;
    v23 = v11;
    v22 = v9;
    objc_msgSend(v20, "sendProtobufMessage:ofType:withReply:", v17, 1001, v21);

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))v11 + 2))(v11, 1, 0);
  }

}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  PDURLSessionProxyWillSendRequest *v16;
  id v17;
  void *v18;
  void *v19;
  NSMutableDictionary *taskIdentifiersToInitialBodyInputStreams;
  void *v21;
  void *v22;
  PDURLSessionProxyWillSendRequest *v23;
  NSMutableDictionary *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  PDURLSessionProxyServer *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tasksToIdentifiers, "objectForKeyedSubscript:", v9));
  v13 = objc_msgSend(v12, "unsignedIntegerValue");

  v14 = (id)qword_1000C7120;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer descriptionForTaskWithIdentifier:](self, "descriptionForTaskWithIdentifier:", v13));
    *(_DWORD *)buf = 138543362;
    v33 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ _willSendRequestForEstablishedConnection", buf, 0xCu);

  }
  if (self->_implementsWillSendRequest)
  {
    v16 = objc_opt_new(PDURLSessionProxyWillSendRequest);
    v17 = -[PDURLSessionProxyRequest _initWithActualRequest:]([PDURLSessionProxyRequest alloc], "_initWithActualRequest:", v10);
    -[PDURLSessionProxyWillSendRequest setRequest:](v16, "setRequest:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer taskMessageForIdentifier:](self, "taskMessageForIdentifier:", v13));
    -[PDURLSessionProxyWillSendRequest setTask:](v16, "setTask:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[PDURLSessionProxyServerService sharedService](PDURLSessionProxyServerService, "sharedService"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100059704;
    v27[3] = &unk_1000B1D28;
    v28 = v9;
    v29 = self;
    v31 = v13;
    v30 = v11;
    objc_msgSend(v19, "sendProtobufMessage:ofType:withReply:", v16, 1002, v27);

  }
  else
  {
    v16 = (PDURLSessionProxyWillSendRequest *)v10;
    taskIdentifiersToInitialBodyInputStreams = self->_taskIdentifiersToInitialBodyInputStreams;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v13));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](taskIdentifiersToInitialBodyInputStreams, "objectForKeyedSubscript:", v21));
    LOBYTE(taskIdentifiersToInitialBodyInputStreams) = v22 == 0;

    if ((taskIdentifiersToInitialBodyInputStreams & 1) == 0)
    {
      v23 = (PDURLSessionProxyWillSendRequest *)-[PDURLSessionProxyWillSendRequest mutableCopy](v16, "mutableCopy");
      v24 = self->_taskIdentifiersToInitialBodyInputStreams;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v13));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v24, "objectForKeyedSubscript:", v25));
      -[PDURLSessionProxyWillSendRequest setHTTPBodyStream:](v23, "setHTTPBodyStream:", v26);

      v16 = v23;
    }
    if (v16)
    {
      if (-[PDURLSessionProxyServer shouldRetainInfraWiFi](self, "shouldRetainInfraWiFi"))
        -[PDURLSessionProxyServer retainInfraWiFiForTaskWithIdentifier:](self, "retainInfraWiFiForTaskWithIdentifier:", v13);
      if (-[PDURLSessionProxyServer shouldRetainBTLinkAssertion](self, "shouldRetainBTLinkAssertion"))
        -[PDURLSessionProxyServer retainBTLinkAssertionWithIdentifier:](self, "retainBTLinkAssertionWithIdentifier:", v13);
    }
    (*((void (**)(id, PDURLSessionProxyWillSendRequest *))v11 + 2))(v11, v16);
  }

}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  void (**v7)(id, id);
  void *v8;
  id v9;
  id v10;
  id v11;
  NSMutableDictionary *taskIdentifiersToBodyStreams;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  NSMutableDictionary *taskIdentifiersToInitialBodyInputStreams;
  void *v19;
  void *v20;
  NSMutableDictionary *v21;
  void *v22;
  NSMutableDictionary *v23;
  void *v24;
  PDURLSessionProxyOpenBodyStream *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;

  v7 = (void (**)(id, id))a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tasksToIdentifiers, "objectForKeyedSubscript:", a4));
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  v28 = 0;
  v29 = 0;
  +[NSStream getBoundStreamsWithBufferSize:inputStream:outputStream:](NSStream, "getBoundStreamsWithBufferSize:inputStream:outputStream:", 0x20000, &v29, &v28);
  v10 = v29;
  v11 = v28;
  taskIdentifiersToBodyStreams = self->_taskIdentifiersToBodyStreams;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v9));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](taskIdentifiersToBodyStreams, "objectForKeyedSubscript:", v13));

  if (v14)
  {
    v15 = self->_taskIdentifiersToBodyStreams;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v9));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v16));
    objc_msgSend(v17, "close");

    taskIdentifiersToInitialBodyInputStreams = self->_taskIdentifiersToInitialBodyInputStreams;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v9));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](taskIdentifiersToInitialBodyInputStreams, "objectForKeyedSubscript:", v19));
    objc_msgSend(v20, "close");

  }
  v21 = self->_taskIdentifiersToBodyStreams;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v9));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v11, v22);

  v23 = self->_taskIdentifiersToInitialBodyInputStreams;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v9));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v10, v24);

  objc_msgSend(v11, "open");
  v7[2](v7, v10);
  v25 = objc_opt_new(PDURLSessionProxyOpenBodyStream);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer taskMessageForIdentifier:](self, "taskMessageForIdentifier:", v9));
  -[PDURLSessionProxyOpenBodyStream setTask:](v25, "setTask:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[PDURLSessionProxyServerService sharedService](PDURLSessionProxyServerService, "sharedService"));
  objc_msgSend(v27, "sendProtobufMessage:ofType:withReply:", v25, 1011, 0);

}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v11;
  void *v12;
  void *v13;
  id v14;
  PDURLSessionProxyDidSendBodyData *v15;

  v14 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tasksToIdentifiers, "objectForKeyedSubscript:", a4));
  v11 = objc_msgSend(v14, "unsignedIntegerValue");

  v15 = objc_opt_new(PDURLSessionProxyDidSendBodyData);
  -[PDURLSessionProxyDidSendBodyData setBytesSent:](v15, "setBytesSent:", a5);
  -[PDURLSessionProxyDidSendBodyData setTotalBytesSent:](v15, "setTotalBytesSent:", a6);
  -[PDURLSessionProxyDidSendBodyData setTotalBytesExpectedToSend:](v15, "setTotalBytesExpectedToSend:", a7);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer taskMessageForIdentifier:](self, "taskMessageForIdentifier:", v11));
  -[PDURLSessionProxyDidSendBodyData setTask:](v15, "setTask:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[PDURLSessionProxyServerService sharedService](PDURLSessionProxyServerService, "sharedService"));
  objc_msgSend(v13, "sendProtobufMessage:ofType:withReply:", v15, 1004, 0);

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  PDURLSessionProxyTaskCompleted *v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  BOOL v34;
  void (**v35)(_QWORD, _QWORD);
  PDURLSessionProxyOpenSocketReply *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  NSString *identifier;
  int v46;
  void *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  __int16 v54;
  NSString *v55;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tasksToIdentifiers, "objectForKeyedSubscript:", v7));

  if (v9)
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_nsurlsessionproxy_error"));
    v11 = (void *)v10;
    if (v10)
      v12 = (void *)v10;
    else
      v12 = v8;
    v13 = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tasksToIdentifiers, "objectForKeyedSubscript:", v7));
    v15 = objc_msgSend(v14, "unsignedIntegerValue");

    v16 = (id)qword_1000C7120;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer descriptionForTaskWithIdentifier:](self, "descriptionForTaskWithIdentifier:", v15));
      v46 = 138543874;
      v47 = v17;
      v48 = 2112;
      v49 = v13;
      v50 = 2048;
      v51 = objc_msgSend(v13, "code");
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ completed with error %@ [%ld]", (uint8_t *)&v46, 0x20u);

    }
    v18 = objc_opt_new(PDURLSessionProxyTaskCompleted);
    if (v13)
    {
      v19 = -[PDURLSessionProxyError _initWithActualError:]([PDURLSessionProxyError alloc], "_initWithActualError:", v13);
      -[PDURLSessionProxyTaskCompleted setError:](v18, "setError:", v19);

    }
    v20 = objc_alloc((Class)__NSCFURLSessionTaskInfo);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_uniqueIdentifier"));
    v22 = objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer identifier](self, "identifier"));
    v23 = objc_msgSend(v20, "initWithDataTask:uniqueIdentifier:bundleID:sessionID:", v7, v21, 0, v22);

    objc_msgSend(v23, "setCountOfBytesSent:", objc_msgSend(v7, "countOfBytesSent"));
    objc_msgSend(v23, "setCountOfBytesReceived:", objc_msgSend(v7, "countOfBytesReceived"));
    objc_msgSend(v23, "setCountOfBytesExpectedToSend:", objc_msgSend(v7, "countOfBytesExpectedToSend"));
    objc_msgSend(v23, "setCountOfBytesExpectedToReceive:", objc_msgSend(v7, "countOfBytesExpectedToReceive"));
    -[PDURLSessionProxyTaskCompleted _setActualTaskInfo:](v18, "_setActualTaskInfo:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer taskMessageForIdentifier:](self, "taskMessageForIdentifier:", v15));
    -[PDURLSessionProxyTaskCompleted setTask:](v18, "setTask:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[PDURLSessionProxyServerService sharedService](PDURLSessionProxyServerService, "sharedService"));
    objc_msgSend(v25, "sendProtobufMessage:ofType:withReply:", v18, 1005, 0);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tasksToIdentifiers, "objectForKeyedSubscript:", v7));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_taskIdentifiersToBodyStreams, "objectForKeyedSubscript:", v26));
    LOBYTE(v22) = v27 == 0;

    if ((v22 & 1) == 0)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_taskIdentifiersToBodyStreams, "objectForKeyedSubscript:", v26));
      objc_msgSend(v28, "close");
      -[NSMutableDictionary removeObjectForKey:](self->_taskIdentifiersToBodyStreams, "removeObjectForKey:", v26);
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_taskIdentifiersToInitialBodyInputStreams, "objectForKeyedSubscript:", v26));
      -[NSMutableDictionary removeObjectForKey:](self->_taskIdentifiersToInitialBodyInputStreams, "removeObjectForKey:", v26);
      if (!objc_msgSend(v29, "streamStatus"))
        objc_msgSend(v29, "open");
      if ((unint64_t)objc_msgSend(v29, "streamStatus") <= 5)
        objc_msgSend(v29, "close");

    }
    if (v26)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_tasks, "removeObjectForKey:", v26);
      -[NSMutableDictionary removeObjectForKey:](self->_tasksToIdentifiers, "removeObjectForKey:", v7);
      -[NSMutableDictionary removeObjectForKey:](self->_taskIdentifiersToSequenceNumbers, "removeObjectForKey:", v26);
    }
    -[PDURLSessionProxyServer releaseInfraWiFiForTaskIfNecessary:](self, "releaseInfraWiFiForTaskIfNecessary:", v15);
    -[PDURLSessionProxyServer releaseBTLinkAssertionIfNecessary:](self, "releaseBTLinkAssertionIfNecessary:", v15);

  }
  else
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTasksToDeviceConnections, "objectForKeyedSubscript:", v7));

    v18 = (PDURLSessionProxyTaskCompleted *)(id)qword_1000C7120;
    v31 = os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT);
    if (v30)
    {
      if (v31)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_loggableDescription"));
        v46 = 138544130;
        v47 = v32;
        v48 = 2112;
        v49 = v7;
        v50 = 2112;
        v51 = v8;
        v52 = 2048;
        v53 = objc_msgSend(v8, "code");
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v18, OS_LOG_TYPE_DEFAULT, "%{public}@ StreamTask %@ completed with error %@ [%ld]", (uint8_t *)&v46, 0x2Au);

      }
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTasksToOpenSocketReplies, "objectForKeyedSubscript:", v7));
      v34 = v33 == 0;

      if (!v34)
      {
        v35 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTasksToOpenSocketReplies, "objectForKeyedSubscript:", v7));
        v36 = objc_opt_new(PDURLSessionProxyOpenSocketReply);
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", _kCFStreamErrorCodeKey));
        -[PDURLSessionProxyOpenSocketReply setStreamErrorCode:](v36, "setStreamErrorCode:", objc_msgSend(v38, "intValue"));

        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", _kCFStreamErrorDomainKey));
        -[PDURLSessionProxyOpenSocketReply setStreamErrorDomain:](v36, "setStreamErrorDomain:", objc_msgSend(v40, "intValue"));

        ((void (**)(_QWORD, PDURLSessionProxyOpenSocketReply *))v35)[2](v35, v36);
        -[NSMutableDictionary removeObjectForKey:](self->_streamTasksToOpenSocketReplies, "removeObjectForKey:", v7);

      }
      v41 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTasksToIDSTCPConnections, "objectForKeyedSubscript:", v7));
      v18 = (PDURLSessionProxyTaskCompleted *)v41;
      if (v41)
      {
        tcp_connection_cancel(v41);
        -[NSMutableDictionary removeObjectForKey:](self->_streamTasksToIDSTCPConnections, "removeObjectForKey:", v7);
      }
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTasksToDeviceConnections, "objectForKeyedSubscript:", v7));
      objc_msgSend(v42, "close");

      -[NSMutableDictionary removeObjectForKey:](self->_streamTasksToDeviceConnections, "removeObjectForKey:", v7);
    }
    else if (v31)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_loggableDescription"));
      v44 = objc_msgSend(v8, "code");
      identifier = self->_identifier;
      v46 = 138544386;
      v47 = v43;
      v48 = 2112;
      v49 = v7;
      v50 = 2112;
      v51 = v8;
      v52 = 2048;
      v53 = v44;
      v54 = 2112;
      v55 = identifier;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v18, OS_LOG_TYPE_DEFAULT, "%{public}@ ignoring task completion for task %@ with error %@ [%ld] in session %@ since we do not have an associated client taskIdentifier", (uint8_t *)&v46, 0x34u);

    }
    v13 = v8;
  }

}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  PDURLSessionProxyWillPerformRedirection *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  PDURLSessionProxyServer *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tasksToIdentifiers, "objectForKeyedSubscript:", v11));
  v16 = objc_msgSend(v15, "unsignedIntegerValue");

  v17 = (id)qword_1000C7120;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer descriptionForTaskWithIdentifier:](self, "descriptionForTaskWithIdentifier:", v16));
    *(_DWORD *)buf = 138543874;
    v31 = v18;
    v32 = 2112;
    v33 = v12;
    v34 = 2112;
    v35 = v13;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ willPerformHTTPRedirection, response: %@, new request: %@", buf, 0x20u);

  }
  if (self->_supportsRedirects && self->_implementsWillPerformRedirection)
  {
    v19 = objc_opt_new(PDURLSessionProxyWillPerformRedirection);
    v20 = -[PDURLSessionProxyResponse _initWithActualResponse:]([PDURLSessionProxyResponse alloc], "_initWithActualResponse:", v12);
    v21 = -[PDURLSessionProxyRequest _initWithActualRequest:]([PDURLSessionProxyRequest alloc], "_initWithActualRequest:", v13);
    -[PDURLSessionProxyWillPerformRedirection setResponse:](v19, "setResponse:", v20);
    -[PDURLSessionProxyWillPerformRedirection setRequest:](v19, "setRequest:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer taskMessageForIdentifier:](self, "taskMessageForIdentifier:", v16));
    -[PDURLSessionProxyWillPerformRedirection setTask:](v19, "setTask:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[PDURLSessionProxyServerService sharedService](PDURLSessionProxyServerService, "sharedService"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000594D8;
    v24[3] = &unk_1000B1D50;
    v25 = v11;
    v28 = v14;
    v26 = v13;
    v27 = self;
    v29 = v16;
    objc_msgSend(v23, "sendProtobufMessage:ofType:withReply:", v19, 1012, v24);

  }
  else
  {
    (*((void (**)(id, id))v14 + 2))(v14, v13);
  }

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  PDURLSessionProxyDidReceiveResponse *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  PDURLSessionProxyServer *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tasksToIdentifiers, "objectForKeyedSubscript:", v9));
  v13 = objc_msgSend(v12, "unsignedIntegerValue");

  v14 = (id)qword_1000C7120;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer descriptionForTaskWithIdentifier:](self, "descriptionForTaskWithIdentifier:", v13));
    *(_DWORD *)buf = 138543618;
    v30 = v15;
    v31 = 2112;
    v32 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ didReceiveResponse: %@", buf, 0x16u);

  }
  v16 = objc_opt_new(PDURLSessionProxyDidReceiveResponse);
  v17 = -[PDURLSessionProxyResponse _initWithActualResponse:]([PDURLSessionProxyResponse alloc], "_initWithActualResponse:", v10);
  -[PDURLSessionProxyDidReceiveResponse setResponse:](v16, "setResponse:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer taskMessageForIdentifier:](self, "taskMessageForIdentifier:", v13));
  -[PDURLSessionProxyDidReceiveResponse setTask:](v16, "setTask:", v18);

  if (self->_implementsDidReceiveResponse
    && (v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_taskGroup")),
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "_groupConfiguration")),
        v21 = objc_msgSend(v20, "_ignoreDidReceiveResponseDisposition"),
        v20,
        v19,
        (v21 & 1) == 0))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[PDURLSessionProxyServerService sharedService](PDURLSessionProxyServerService, "sharedService"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000592FC;
    v24[3] = &unk_1000B1D28;
    v25 = v9;
    v26 = self;
    v28 = v13;
    v27 = v11;
    objc_msgSend(v23, "sendProtobufMessage:ofType:withReply:", v16, 1003, v24);

  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[PDURLSessionProxyServerService sharedService](PDURLSessionProxyServerService, "sharedService"));
    objc_msgSend(v22, "sendProtobufMessage:ofType:withReply:", v16, 1003, 0);

    (*((void (**)(id, uint64_t))v11 + 2))(v11, 1);
  }

}

- (void)URLSession:(id)a3 dataTask:(id)a4 _didReceiveData:(id)a5 completionHandler:(id)a6
{
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void (**v21)(_QWORD);
  id v22;
  NSMutableDictionary *taskIdentifiersToPendingDataBytes;
  void *v24;
  void *v25;
  char *v26;
  unint64_t v27;
  void *v28;
  NSMutableDictionary *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  NSMutableDictionary *taskIdentifiersToPendingDataCompletion;
  void *v38;
  void (**v39)(_QWORD);
  NSMutableDictionary *v40;
  void *v41;
  PDURLSessionProxyDidReceiveData *v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  PDURLSessionProxyServer *v47;
  id v48;
  id v49;
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;

  v43 = a3;
  v10 = a4;
  v44 = a5;
  v11 = (void (**)(_QWORD))a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tasksToIdentifiers, "objectForKeyedSubscript:", v10));
  v13 = objc_msgSend(v12, "unsignedIntegerValue");

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_nsurlsessionproxy_error"));
  v15 = (id)qword_1000C7120;
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer descriptionForTaskWithIdentifier:](self, "descriptionForTaskWithIdentifier:", v13));
      *(_DWORD *)buf = 138543618;
      v52 = v17;
      v53 = 2048;
      v54 = objc_msgSend(v44, "length");
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ ignoring data of length %lu since we've already failed that task", buf, 0x16u);

    }
    v11[2](v11);
  }
  else
  {
    if (v16)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer descriptionForTaskWithIdentifier:](self, "descriptionForTaskWithIdentifier:", v13));
      *(_DWORD *)buf = 138543618;
      v52 = v18;
      v53 = 2048;
      v54 = objc_msgSend(v44, "length");
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ did receive data with length %lu", buf, 0x16u);

    }
    v42 = objc_opt_new(PDURLSessionProxyDidReceiveData);
    -[PDURLSessionProxyDidReceiveData setReceivedData:](v42, "setReceivedData:", v44);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer taskMessageForIdentifier:](self, "taskMessageForIdentifier:", v13));
    -[PDURLSessionProxyDidReceiveData setTask:](v42, "setTask:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[PDURLSessionProxyServerService sharedService](PDURLSessionProxyServerService, "sharedService"));
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_100058F20;
    v45[3] = &unk_1000B1D50;
    v46 = v10;
    v47 = self;
    v21 = v11;
    v49 = v21;
    v50 = v13;
    v22 = v44;
    v48 = v22;
    objc_msgSend(v20, "sendProtobufMessage:ofType:withReply:", v42, 1006, v45);

    if (-[NSURLSessionConfiguration _requiresSustainedDataDelivery](self->_sessionConfiguration, "_requiresSustainedDataDelivery"))
    {
      taskIdentifiersToPendingDataBytes = self->_taskIdentifiersToPendingDataBytes;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v13));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](taskIdentifiersToPendingDataBytes, "objectForKeyedSubscript:", v24));
      v26 = (char *)objc_msgSend(v25, "unsignedIntegerValue");

      v27 = (unint64_t)&v26[(_QWORD)objc_msgSend(v22, "length")];
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v27));
      v29 = self->_taskIdentifiersToPendingDataBytes;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v13));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v28, v30);

      v31 = (id)qword_1000C7120;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer descriptionForTaskWithIdentifier:](self, "descriptionForTaskWithIdentifier:", v13));
        *(_DWORD *)buf = 138543618;
        v52 = v32;
        v53 = 2048;
        v54 = (id)v27;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ data pending, now has %lu bytes pending acknowledgement", buf, 0x16u);

      }
      v33 = (id)qword_1000C7120;
      v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
      if (v27 >> 19)
      {
        if (v34)
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer descriptionForTaskWithIdentifier:](self, "descriptionForTaskWithIdentifier:", v13));
          *(_DWORD *)buf = 138543362;
          v52 = v36;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ will wait to acknowledge data", buf, 0xCu);

        }
        taskIdentifiersToPendingDataCompletion = self->_taskIdentifiersToPendingDataCompletion;
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v13));
        if (objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](taskIdentifiersToPendingDataCompletion, "objectForKeyedSubscript:", v38)))
        {
          __assert_rtn("-[PDURLSessionProxyServer URLSession:dataTask:_didReceiveData:completionHandler:]", "PDURLSessionProxyServer.mm", 893, "!_taskIdentifiersToPendingDataCompletion[@(taskIdentifier)]");
        }

        v39 = objc_retainBlock(v21);
        v40 = self->_taskIdentifiersToPendingDataCompletion;
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v13));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v40, "setObject:forKeyedSubscript:", v39, v41);

      }
      else
      {
        if (v34)
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer descriptionForTaskWithIdentifier:](self, "descriptionForTaskWithIdentifier:", v13));
          *(_DWORD *)buf = 138543362;
          v52 = v35;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ immediately acknowledging data", buf, 0xCu);

        }
        v21[2](v21);
      }
    }

  }
}

- (void)URLSession:(id)a3 _willRetryBackgroundDataTask:(id)a4
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  PDURLSessionProxyTaskWillBeRetried *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tasksToIdentifiers, "objectForKeyedSubscript:", v5));
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  v8 = (id)qword_1000C7120;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer descriptionForTaskWithIdentifier:](self, "descriptionForTaskWithIdentifier:", v7));
    v13 = 138543362;
    v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ will be retried", (uint8_t *)&v13, 0xCu);

  }
  v10 = objc_opt_new(PDURLSessionProxyTaskWillBeRetried);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer taskMessageForIdentifier:](self, "taskMessageForIdentifier:", v7));
  -[PDURLSessionProxyTaskWillBeRetried setTask:](v10, "setTask:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[PDURLSessionProxyServerService sharedService](PDURLSessionProxyServerService, "sharedService"));
  objc_msgSend(v12, "sendProtobufMessage:ofType:withReply:", v10, 1007, 0);

  -[PDURLSessionProxyServer releaseInfraWiFiForTaskIfNecessary:](self, "releaseInfraWiFiForTaskIfNecessary:", v7);
  -[PDURLSessionProxyServer releaseBTLinkAssertionIfNecessary:](self, "releaseBTLinkAssertionIfNecessary:", v7);

}

- (void)URLSession:(id)a3 _willRetryBackgroundDataTask:(id)a4 withError:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  PDURLSessionProxyTaskWillBeRetried *v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tasksToIdentifiers, "objectForKeyedSubscript:", v7));
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  v11 = (id)qword_1000C7120;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer descriptionForTaskWithIdentifier:](self, "descriptionForTaskWithIdentifier:", v10));
    v17 = 138543618;
    v18 = v12;
    v19 = 2112;
    v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ will be retried - error: %@", (uint8_t *)&v17, 0x16u);

  }
  v13 = objc_opt_new(PDURLSessionProxyTaskWillBeRetried);
  if (v8)
  {
    v14 = -[PDURLSessionProxyError _initWithActualError:]([PDURLSessionProxyError alloc], "_initWithActualError:", v8);
    -[PDURLSessionProxyTaskWillBeRetried setError:](v13, "setError:", v14);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer taskMessageForIdentifier:](self, "taskMessageForIdentifier:", v10));
  -[PDURLSessionProxyTaskWillBeRetried setTask:](v13, "setTask:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[PDURLSessionProxyServerService sharedService](PDURLSessionProxyServerService, "sharedService"));
  objc_msgSend(v16, "sendProtobufMessage:ofType:withReply:", v13, 1007, 0);

  -[PDURLSessionProxyServer releaseInfraWiFiForTaskIfNecessary:](self, "releaseInfraWiFiForTaskIfNecessary:", v10);
  -[PDURLSessionProxyServer releaseBTLinkAssertionIfNecessary:](self, "releaseBTLinkAssertionIfNecessary:", v10);

}

- (void)URLSession:(id)a3 task:(id)a4 _isWaitingForConnectionWithReason:(int64_t)a5
{
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *taskIdentifiersToWaitingReasons;
  void *v14;
  PDURLSessionProxyTaskWaiting *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  int64_t v21;

  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tasksToIdentifiers, "objectForKeyedSubscript:", v7));
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  v10 = (id)qword_1000C7120;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer descriptionForTaskWithIdentifier:](self, "descriptionForTaskWithIdentifier:", v9));
    v18 = 138543618;
    v19 = v11;
    v20 = 2048;
    v21 = a5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ is waiting for connection with reason: %lld", (uint8_t *)&v18, 0x16u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a5));
  taskIdentifiersToWaitingReasons = self->_taskIdentifiersToWaitingReasons;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v9));
  -[NSMutableDictionary setObject:forKeyedSubscript:](taskIdentifiersToWaitingReasons, "setObject:forKeyedSubscript:", v12, v14);

  v15 = objc_opt_new(PDURLSessionProxyTaskWaiting);
  -[PDURLSessionProxyTaskWaiting setReason:](v15, "setReason:", a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer taskMessageForIdentifier:](self, "taskMessageForIdentifier:", v9));
  -[PDURLSessionProxyTaskWaiting setTask:](v15, "setTask:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[PDURLSessionProxyServerService sharedService](PDURLSessionProxyServerService, "sharedService"));
  objc_msgSend(v17, "sendProtobufMessage:ofType:withReply:", v15, 1009, 0);

}

- (void)_URLSession:(id)a3 task:(id)a4 getAuthHeadersForResponse:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  PDURLSessionProxyGetAuthHeaders *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_tasksToIdentifiers, "objectForKeyedSubscript:", v9));
  v13 = objc_msgSend(v12, "unsignedIntegerValue");

  v14 = (id)qword_1000C7120;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer descriptionForTaskWithIdentifier:](self, "descriptionForTaskWithIdentifier:", v13));
    *(_DWORD *)buf = 138543618;
    v24 = v15;
    v25 = 2112;
    v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ getAuthHeadersForResponse %@", buf, 0x16u);

  }
  v16 = objc_opt_new(PDURLSessionProxyGetAuthHeaders);
  v17 = -[PDURLSessionProxyResponse _initWithActualResponse:]([PDURLSessionProxyResponse alloc], "_initWithActualResponse:", v10);
  -[PDURLSessionProxyGetAuthHeaders setResponse:](v16, "setResponse:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer taskMessageForIdentifier:](self, "taskMessageForIdentifier:", v13));
  -[PDURLSessionProxyGetAuthHeaders setTask:](v16, "setTask:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[PDURLSessionProxyServerService sharedService](PDURLSessionProxyServerService, "sharedService"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100058E7C;
  v21[3] = &unk_1000B1D78;
  v20 = v11;
  v22 = v20;
  objc_msgSend(v19, "sendProtobufMessage:ofType:withReply:", v16, 1010, v21);

}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 160);
}

- (NSString)uuidString
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setUuidString:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 168);
}

- (PDURLSessionProxyServerDelegate)delegate
{
  return (PDURLSessionProxyServerDelegate *)objc_getProperty(self, a2, 176, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_messagesToReSend, 0);
  objc_storeStrong((id *)&self->_deviceConnections, 0);
  objc_storeStrong((id *)&self->_taskIdentifiersRetainingBTLinkAssertion, 0);
  objc_storeStrong((id *)&self->_taskIdentifiersRetainingInfraWiFi, 0);
  objc_storeStrong((id *)&self->_streamTasksToOpenSocketReplies, 0);
  objc_storeStrong((id *)&self->_streamTasksToIDSTCPConnections, 0);
  objc_storeStrong((id *)&self->_streamTasksToDeviceConnections, 0);
  objc_storeStrong((id *)&self->_taskIdentifiersToPendingDataCompletion, 0);
  objc_storeStrong((id *)&self->_taskIdentifiersToPendingDataBytes, 0);
  objc_storeStrong((id *)&self->_taskIdentifiersToWaitingReasons, 0);
  objc_storeStrong((id *)&self->_taskIdentifiersToInitialBodyInputStreams, 0);
  objc_storeStrong((id *)&self->_taskIdentifiersToBodyStreams, 0);
  objc_storeStrong((id *)&self->_taskIdentifiersToSequenceNumbers, 0);
  objc_storeStrong((id *)&self->_tasksToIdentifiers, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_sessionConfiguration, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

+ (void)initialize
{
  if (qword_1000C7118 != -1)
    dispatch_once(&qword_1000C7118, &stru_1000B1B70);
}

@end
