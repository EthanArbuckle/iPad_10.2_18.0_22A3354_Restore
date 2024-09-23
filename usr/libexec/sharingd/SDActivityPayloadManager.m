@implementation SDActivityPayloadManager

+ (id)sharedPayloadManager
{
  if (qword_1007C6A08 != -1)
    dispatch_once(&qword_1007C6A08, &stru_100717DD8);
  return (id)qword_1007C6A00;
}

- (SDActivityPayloadManager)init
{
  SDActivityPayloadManager *v2;
  BOOL v3;
  uint64_t v4;
  SDActivityAdvertiser *advertiser;
  uint64_t v6;
  SDActivityScanner *scanner;
  NSMutableArray *v8;
  NSMutableArray *cachedActivityPayloadsForDemo;
  NSMutableDictionary *v10;
  NSMutableDictionary *uniqueIDToKeyReplyDate;
  NSMutableDictionary *v12;
  NSMutableDictionary *messageIdentifierToKeyRequestRecords;
  NSMutableDictionary *v14;
  NSMutableDictionary *messageIdentifierToReplyRecords;
  NSMutableDictionary *v16;
  NSMutableDictionary *messageIdentifierToRequestRecords;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SDActivityPayloadManager;
  v2 = -[SDActivityPayloadManager init](&v19, "init");
  if (v2)
  {
    if (IsAppleInternalBuild())
      v3 = sub_1000CE8D0(CFSTR("DisabledKeyRequestBudget"), 0) != 0;
    else
      v3 = 0;
    v2->_restrictionsDisabled = v3;
    v4 = objc_claimAutoreleasedReturnValue(+[SDActivityAdvertiser sharedAdvertiser](SDActivityAdvertiser, "sharedAdvertiser"));
    advertiser = v2->_advertiser;
    v2->_advertiser = (SDActivityAdvertiser *)v4;

    v6 = objc_claimAutoreleasedReturnValue(+[SDActivityScanner sharedScanner](SDActivityScanner, "sharedScanner"));
    scanner = v2->_scanner;
    v2->_scanner = (SDActivityScanner *)v6;

    v8 = objc_opt_new(NSMutableArray);
    cachedActivityPayloadsForDemo = v2->_cachedActivityPayloadsForDemo;
    v2->_cachedActivityPayloadsForDemo = v8;

    v10 = objc_opt_new(NSMutableDictionary);
    uniqueIDToKeyReplyDate = v2->_uniqueIDToKeyReplyDate;
    v2->_uniqueIDToKeyReplyDate = v10;

    v12 = objc_opt_new(NSMutableDictionary);
    messageIdentifierToKeyRequestRecords = v2->_messageIdentifierToKeyRequestRecords;
    v2->_messageIdentifierToKeyRequestRecords = v12;

    v14 = objc_opt_new(NSMutableDictionary);
    messageIdentifierToReplyRecords = v2->_messageIdentifierToReplyRecords;
    v2->_messageIdentifierToReplyRecords = v14;

    v16 = objc_opt_new(NSMutableDictionary);
    messageIdentifierToRequestRecords = v2->_messageIdentifierToRequestRecords;
    v2->_messageIdentifierToRequestRecords = v16;

    -[SDActivityPayloadManager clearPersistedKeyRequests](v2, "clearPersistedKeyRequests");
    -[SDActivityPayloadManager setUpSystemMonitor](v2, "setUpSystemMonitor");
    -[SDActivityPayloadManager setUpRapport](v2, "setUpRapport");
    -[SDActivityPayloadManager setUpIDSServices](v2, "setUpIDSServices");
    -[SDActivityPayloadManager setUpHandoffPreferenceMonitor](v2, "setUpHandoffPreferenceMonitor");
  }
  return v2;
}

- (void)setUpSystemMonitor
{
  CUSystemMonitor *v3;
  CUSystemMonitor *systemMonitor;
  _QWORD *v5;
  _QWORD v6[5];
  id v7;
  id location;

  v3 = objc_opt_new(CUSystemMonitor);
  systemMonitor = self->_systemMonitor;
  self->_systemMonitor = v3;

  location = 0;
  objc_initWeak(&location, self->_systemMonitor);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10011B940;
  v6[3] = &unk_1007147A0;
  v6[4] = self;
  objc_copyWeak(&v7, &location);
  v5 = objc_retainBlock(v6);
  -[CUSystemMonitor setManateeChangedHandler:](self->_systemMonitor, "setManateeChangedHandler:", v5);
  -[CUSystemMonitor activateWithCompletion:](self->_systemMonitor, "activateWithCompletion:", v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)setUpRapport
{
  RPCompanionLinkClient *v3;
  RPCompanionLinkClient *rapportDiscoveryClient;
  RPCompanionLinkClient *v5;
  RPCompanionLinkClient *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  if (!sub_1000CE8D0(CFSTR("DisableContinuityRapportPayloads"), 0))
  {
    v3 = (RPCompanionLinkClient *)objc_claimAutoreleasedReturnValue(-[SDActivityPayloadManager createRapportClientWithDestinationDevice:](self, "createRapportClientWithDestinationDevice:", 0));
    rapportDiscoveryClient = self->_rapportDiscoveryClient;
    self->_rapportDiscoveryClient = v3;

    v5 = self->_rapportDiscoveryClient;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10011BA6C;
    v8[3] = &unk_1007157B0;
    v8[4] = self;
    -[RPCompanionLinkClient registerRequestID:options:handler:](v5, "registerRequestID:options:handler:", CFSTR("com.apple.handoff.encryption-key-request"), 0, v8);
    v6 = self->_rapportDiscoveryClient;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10011BA80;
    v7[3] = &unk_1007157B0;
    v7[4] = self;
    -[RPCompanionLinkClient registerRequestID:options:handler:](v6, "registerRequestID:options:handler:", CFSTR("com.apple.handoff.payload-request"), 0, v7);
    -[RPCompanionLinkClient activateWithCompletion:](self->_rapportDiscoveryClient, "activateWithCompletion:", &stru_100717DF8);
  }
}

- (void)setUpIDSServices
{
  IDSService *v3;
  IDSService *encryptionService;
  IDSService *v5;
  IDSService *activityService;

  v3 = (IDSService *)objc_msgSend(objc_alloc((Class)IDSService), "initWithService:", CFSTR("com.apple.private.alloy.continuity.encryption"));
  encryptionService = self->_encryptionService;
  self->_encryptionService = v3;

  -[IDSService setProtobufAction:forIncomingRequestsOfType:](self->_encryptionService, "setProtobufAction:forIncomingRequestsOfType:", "handleEncryptionKeyRequestProtobuf:service:account:fromID:context:", 4);
  -[IDSService setProtobufAction:forIncomingResponsesOfType:](self->_encryptionService, "setProtobufAction:forIncomingResponsesOfType:", "handleEncryptionKeyReplyRequestProtobuf:service:account:fromID:context:", 5);
  -[IDSService addDelegate:queue:](self->_encryptionService, "addDelegate:queue:", self, &_dispatch_main_q);
  v5 = (IDSService *)objc_msgSend(objc_alloc((Class)IDSService), "initWithService:", CFSTR("com.apple.private.alloy.continuity.activity"));
  activityService = self->_activityService;
  self->_activityService = v5;

  -[IDSService setProtobufAction:forIncomingRequestsOfType:](self->_activityService, "setProtobufAction:forIncomingRequestsOfType:", "handlePayloadRequestProtobuf:service:account:fromID:context:", 1);
  -[IDSService setProtobufAction:forIncomingResponsesOfType:](self->_activityService, "setProtobufAction:forIncomingResponsesOfType:", "handlePayloadReplyProtobuf:service:account:fromID:context:", 2);
  -[IDSService setProtobufAction:forIncomingRequestsOfType:](self->_activityService, "setProtobufAction:forIncomingRequestsOfType:", "handleNewAdvertisementWithpayloadRequestProtobuf:service:account:fromID:context:", 3);
  -[IDSService addDelegate:queue:](self->_activityService, "addDelegate:queue:", self, &_dispatch_main_q);

}

- (id)idsDeviceWithUniqueID:(id)a3 onService:(id)a4
{
  id v5;
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

  v5 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "devices", 0));
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
        v12 = objc_msgSend(v11, "isEqual:", v5);

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

- (void)requestTimedOut:(id)a3
{
  void *v4;
  NSMutableDictionary **p_messageIdentifierToRequestRecords;
  uint64_t v6;
  NSMutableDictionary **p_messageIdentifierToKeyRequestRecords;
  uint64_t v8;
  id v9;
  void ***v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id *v22;
  uint64_t v23;
  uint64_t v24;
  void **v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *);
  void *v28;
  SDActivityPayloadManager *v29;
  id v30;
  NSErrorUserInfoKey v31;
  const __CFString *v32;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  p_messageIdentifierToRequestRecords = &self->_messageIdentifierToRequestRecords;
  v6 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_messageIdentifierToRequestRecords, "objectForKeyedSubscript:", v4));
  p_messageIdentifierToKeyRequestRecords = &self->_messageIdentifierToKeyRequestRecords;
  v8 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_messageIdentifierToKeyRequestRecords, "objectForKeyedSubscript:", v4));
  v25 = _NSConcreteStackBlock;
  v26 = 3221225472;
  v27 = sub_10011BFAC;
  v28 = &unk_100717E20;
  v29 = self;
  v9 = v4;
  v30 = v9;
  v10 = objc_retainBlock(&v25);
  if (v6 | v8)
  {
    v23 = v8;
    if (v6)
      v11 = (void *)v6;
    else
      v11 = (void *)v8;
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "error"));

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "error"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userInfo"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

      if (v16)
      {
        do
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userInfo", v23, v25, v26, v27, v28, v29));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "userInfo"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

          v14 = v18;
        }
        while (v20);
      }
      else
      {
        v18 = v14;
      }
    }
    else
    {
      v31 = NSLocalizedDescriptionKey;
      v32 = CFSTR("Request timed out");
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 60, v21));

    }
    objc_msgSend(v12, "setError:", v18, v23);

    if (v6)
      v22 = (id *)p_messageIdentifierToRequestRecords;
    else
      v22 = (id *)p_messageIdentifierToKeyRequestRecords;
    objc_msgSend(*v22, "removeObjectForKey:", v9);
    ((void (*)(void ***, id))v10[2])(v10, v12);
    v8 = v24;
  }

}

- (NSString)state
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  id v6;
  id v7;
  const __CFString *v8;
  id v9;
  IDSService *activityService;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  IDSService *encryptionService;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;

  v35 = 0;
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  NSAppendPrintF(&v35, "%@\n", v5);
  v6 = v35;

  v34 = v6;
  NSAppendPrintF(&v34, "-------------\n");
  v7 = v34;

  v33 = v7;
  if (self->_restrictionsDisabled)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  NSAppendPrintF(&v33, "Budget Restrictions Disabled: %@\n", v8);
  v9 = v33;

  v32 = v9;
  activityService = self->_activityService;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](activityService, "devices"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForKeyPath:", CFSTR("@unionOfObjects.uniqueIDOverride")));
  v13 = SFCompactStringFromCollection(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  NSAppendPrintF(&v32, "Activity Service: %@, devices: \n", activityService, v14);
  v15 = v32;

  v31 = v15;
  encryptionService = self->_encryptionService;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](encryptionService, "devices"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "valueForKeyPath:", CFSTR("@unionOfObjects.uniqueIDOverride")));
  v19 = SFCompactStringFromCollection(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  NSAppendPrintF(&v31, "Encryption Service: %@, devices: %@\n", encryptionService, v20);
  v21 = v31;

  v30 = v21;
  NSAppendPrintF(&v30, "Unique ID To Key Reply Date: %@\n", self->_uniqueIDToKeyReplyDate);
  v22 = v30;

  v29 = v22;
  NSAppendPrintF(&v29, "Message Identifier To KeyRequest Records: %@\n", self->_messageIdentifierToKeyRequestRecords);
  v23 = v29;

  v28 = v23;
  NSAppendPrintF(&v28, "Message Identifier To Request Records: %@\n", self->_messageIdentifierToRequestRecords);
  v24 = v28;

  v27 = v24;
  NSAppendPrintF(&v27, "Message Identifier To Reply Records: %@\n", self->_messageIdentifierToReplyRecords);
  v25 = v27;

  return (NSString *)v25;
}

- (void)clearPersistedKeyRequests
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("EncryptionKeyRequests"));

}

- (void)sendEncryptionKeyRequestToDeviceIdentifier:(id)a3 previousKeyIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSUUID *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  objc_class *v26;
  NSString *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  SDActivityEncryptionKeyRequestRecord *v33;
  void *v34;
  void *v35;
  SDActivityEncryptionKeyRequestRecord *v36;
  NSMutableDictionary *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  NSMutableDictionary *v44;
  SDActivityEncryptionKeyRequestRecord *v45;
  SDActivityPayloadManager *v46;
  _QWORD v47[4];
  SDActivityEncryptionKeyRequestRecord *v48;
  SDActivityPayloadManager *v49;
  NSMutableDictionary *v50;
  _QWORD block[4];
  SDActivityEncryptionKeyRequestRecord *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  void *v58;
  _BYTE v59[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v46 = self;
  v11 = (NSUUID *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_messageIdentifierToKeyRequestRecords, "allValues"));
  v12 = -[NSUUID countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v54;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v54 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "deviceIdentifier"));
        v18 = objc_msgSend(v17, "isEqual:", v8);

        if (v18)
        {
          v29 = objc_msgSend(v16, "setCompletionHandler:", v10);
          v31 = handoff_log(v29, v30);
          v32 = objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            sub_1001236F0();

          v25 = v9;
          goto LABEL_19;
        }
      }
      v13 = -[NSUUID countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
      if (v13)
        continue;
      break;
    }
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockSessionManager sharedManager](SDAutoUnlockSessionManager, "sharedManager"));
  v20 = objc_msgSend(v19, "attemptInProgress");

  if (v20)
  {
    v23 = handoff_log(v21, v22);
    v11 = (NSUUID *)objc_claimAutoreleasedReturnValue(v23);
    v25 = v9;
    if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_DEFAULT))
    {
      v26 = (objc_class *)objc_opt_class(v46, v24);
      v27 = NSStringFromClass(v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      *(_DWORD *)buf = 138412290;
      v58 = v28;
      _os_log_impl((void *)&_mh_execute_header, &v11->super, OS_LOG_TYPE_DEFAULT, "%@: Preventing encryption key request - Auto Unlock in progress", buf, 0xCu);

    }
  }
  else
  {
    v11 = objc_opt_new(NSUUID);
    v33 = objc_opt_new(SDActivityEncryptionKeyRequestRecord);
    -[SDActivityRequestRecord setRequestIdentifier:](v33, "setRequestIdentifier:", v11);
    -[SDActivityRequestRecord setDeviceIdentifier:](v33, "setDeviceIdentifier:", v8);
    -[SDActivityRequestRecord setCompletionHandler:](v33, "setCompletionHandler:", v10);
    v25 = v9;
    -[SDActivityEncryptionKeyRequestRecord setPreviousKeyIdentifier:](v33, "setPreviousKeyIdentifier:", v9);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityRequestRecord requestIdentifier](v33, "requestIdentifier"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer timerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "timerWithTimeInterval:target:selector:userInfo:repeats:", v46, "requestTimedOut:", v34, 0, 16.0));
    -[SDActivityRequestRecord setTimeoutTimer:](v33, "setTimeoutTimer:", v35);

    -[SDActivityRequestRecord setTimeoutTimeInterval:](v33, "setTimeoutTimeInterval:", 15);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v46->_messageIdentifierToKeyRequestRecords, "setObject:forKeyedSubscript:", v33, v11);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10011C7C8;
    block[3] = &unk_1007146D8;
    v36 = v33;
    v52 = v36;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v37 = objc_opt_new(NSMutableDictionary);
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionKeyRequestRecord previousKeyIdentifier](v36, "previousKeyIdentifier"));
    v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "UUIDString"));
    v40 = (void *)v39;
    if (v39)
      v41 = (const __CFString *)v39;
    else
      v41 = &stru_10072FE60;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v37, "setObject:forKeyedSubscript:", v41, CFSTR("rKeyPreviousIdentifier"));

    v42 = (void *)objc_claimAutoreleasedReturnValue(+[SDActivityEncryptionManager sharedEncryptionManager](SDActivityEncryptionManager, "sharedEncryptionManager"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "dataRepresentationForCurrentEncryptionKey"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v37, "setObject:forKeyedSubscript:", v43, CFSTR("rKeyDataRepresentation"));

    -[NSMutableDictionary setObject:forKeyedSubscript:](v37, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("rLocalOnly"));
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_10011C830;
    v47[3] = &unk_100717E48;
    v48 = v36;
    v49 = v46;
    v50 = v37;
    v44 = v37;
    v45 = v36;
    -[SDActivityPayloadManager sendRapportEncryptionKeyRequest:withRequestRecord:completionHandler:](v46, "sendRapportEncryptionKeyRequest:withRequestRecord:completionHandler:", v44, v45, v47);

  }
LABEL_19:

}

- (void)sendRapportEncryptionKeyRequest:(id)a3 withRequestRecord:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  int v36;
  id v37;
  _QWORD v38[4];
  id v39;
  SDActivityPayloadManager *v40;
  id v41;
  id v42;
  id v43;
  int v44;
  _BYTE buf[12];
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  int v51;

  v37 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient activeDevices](self->_rapportDiscoveryClient, "activeDevices"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("idsDeviceIdentifier == %@"), v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "filteredArrayUsingPredicate:", v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));

  if (v14)
  {
    v17 = (uint64_t)objc_msgSend(v8, "timeoutTimeInterval");
    v19 = 5;
    if (v17 < 5)
      v19 = v17;
    v36 = v19;
    v20 = handoff_log(v17, v18);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceIdentifier"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "requestIdentifier"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "UUIDString"));
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v22;
      v46 = 2112;
      v47 = v23;
      v48 = 2112;
      v49 = v25;
      v50 = 1024;
      v51 = v36;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Requesting Encryption key via Rapport from \"%@\" %@ with message GUID: %@ and timeout: %d", buf, 0x26u);

    }
    v28 = handoff_log(v26, v27);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      sub_100123778();

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "linkClient"));
    if (v30)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "linkClient"));
      objc_msgSend(v31, "invalidate");

      objc_msgSend(v8, "setLinkClient:", 0);
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityPayloadManager createRapportClientWithDestinationDevice:](self, "createRapportClientWithDestinationDevice:", v14));
    objc_msgSend(v8, "setLinkClient:", v32);

    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, v8);
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "linkClient"));
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10011CCC8;
    v38[3] = &unk_100717E98;
    objc_copyWeak(&v43, (id *)buf);
    v44 = v36;
    v39 = v37;
    v40 = self;
    v41 = v14;
    v42 = v9;
    objc_msgSend(v33, "activateWithCompletion:", v38);

    objc_destroyWeak(&v43);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (self->_rapportDiscoveryClient)
    {
      v34 = handoff_log(v15, v16);
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v8;
        v46 = 2112;
        v47 = v10;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Cannot send Handoff encryption key request %@ via Rapport as we found no devices in %@", buf, 0x16u);
      }

    }
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

- (void)sendIDSEncryptionKeyRequest:(id)a3 withRequestRecord:(id)a4 desiredTimeout:(double)a5
{
  id v8;
  void *v9;
  void *v10;
  id *p_encryptionService;
  void *v12;
  NSMutableSet *v13;
  uint64_t v14;
  NSMutableSet *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *i;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  NSMutableDictionary *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  IDSService *encryptionService;
  id v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  NSMutableSet *v64;
  SDActivityPayloadManager *v65;
  id v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  NSErrorUserInfoKey v72;
  const __CFString *v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  double v81;
  _BYTE v82[128];

  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityPayloadManager protobufDataFromRequest:](self, "protobufDataFromRequest:", a3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceIdentifier"));
  p_encryptionService = (id *)&self->_encryptionService;
  v65 = self;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityPayloadManager idsDeviceWithUniqueID:onService:](self, "idsDeviceWithUniqueID:onService:", v10, self->_encryptionService));

  v13 = objc_opt_new(NSMutableSet);
  v15 = v13;
  if (v12)
  {
    v62 = v9;
    v16 = *p_encryptionService;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "nsuuid"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "devicesForBTUUID:", v17));

    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v19 = v18;
    v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v69;
      v64 = v15;
      while (2)
      {
        v23 = v8;
        v24 = v12;
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(_QWORD *)v69 != v22)
            objc_enumerationMutation(v19);
          v26 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)i);
          v27 = IDSCopyForDevice(v26);
          if (v27)
          {
            v32 = (void *)v27;
            -[NSMutableSet addObject:](v64, "addObject:", v27);
            v33 = -[NSObject count](v19, "count");
            v12 = v24;
            v8 = v23;
            if ((unint64_t)v33 >= 2)
            {
              v35 = handoff_log(v33, v34);
              v36 = objc_claimAutoreleasedReturnValue(v35);
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Sending encryption key request to single of multiple possible destinations.", buf, 2u);
              }

            }
            v15 = v64;
            goto LABEL_18;
          }
          v29 = handoff_log(0, v28);
          v30 = objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_encryptionService, "devices"));
            *(_DWORD *)buf = 138412546;
            v75 = v26;
            v76 = 2112;
            v77 = v31;
            _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Encryption key: No device ID generated for device %@ (Devices: %@)", buf, 0x16u);

          }
        }
        v21 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
        v12 = v24;
        v8 = v23;
        v15 = v64;
        if (v21)
          continue;
        break;
      }
    }
LABEL_18:

    v9 = v62;
  }
  else
  {
    v37 = handoff_log(v13, v14);
    v19 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_1001238A4();
  }

  if (v15)
  {
    v40 = handoff_log(v38, v39);
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceIdentifier"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "requestIdentifier"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "UUIDString"));
      *(_DWORD *)buf = 138413058;
      v75 = v42;
      v76 = 2112;
      v77 = v43;
      v78 = 2112;
      v79 = v45;
      v80 = 2048;
      v81 = a5;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Requesting Encryption key via IDS from \"%@\" %@ with message GUID: %@ and timeout: %f", buf, 0x2Au);

    }
    v63 = v12;

    v48 = handoff_log(v46, v47);
    v49 = objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      sub_100123844();

    v50 = objc_opt_new(NSMutableDictionary);
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "requestIdentifier"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityPayloadManager dataFromUUID:](v65, "dataFromUUID:", v51));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v50, "setObject:forKeyedSubscript:", v52, IDSSendMessageOptionUUIDKey);

    -[NSMutableDictionary setObject:forKeyedSubscript:](v50, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, IDSSendMessageOptionExpectsPeerResponseKey);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v50, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, IDSSendMessageOptionEnforceRemoteTimeoutsKey);
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a5));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v50, "setObject:forKeyedSubscript:", v53, IDSSendMessageOptionTimeoutKey);

    -[NSMutableDictionary setObject:forKeyedSubscript:](v50, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, IDSSendMessageOptionLocalDeliveryKey);
    v54 = objc_msgSend(objc_alloc((Class)IDSProtobuf), "initWithProtobufData:type:isResponse:", v9, 4, 0);
    encryptionService = v65->_encryptionService;
    v66 = 0;
    v67 = 0;
    v56 = -[IDSService sendProtobuf:toDestinations:priority:options:identifier:error:](encryptionService, "sendProtobuf:toDestinations:priority:options:identifier:error:", v54, v15, 300, v50, &v67, &v66);
    v57 = v67;
    v58 = v66;
    v59 = v9;
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "requestIdentifier"));
    -[SDActivityPayloadManager messageWithIdentifier:didSendWithSuccess:error:](v65, "messageWithIdentifier:didSendWithSuccess:error:", v60, v56, v58);

    v9 = v59;
    v12 = v63;
  }
  else
  {
    v72 = NSLocalizedDescriptionKey;
    v73 = CFSTR("Failed to find device to request encryption key from");
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1));
    v57 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 65, v61));

    v50 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "requestIdentifier"));
    -[SDActivityPayloadManager messageWithIdentifier:didSendWithSuccess:error:](v65, "messageWithIdentifier:didSendWithSuccess:error:", v50, 0, v57);
  }

}

- (void)sendEncryptionKeyReplyRequestToDevice:(id)a3 reply:(id)a4 requestIdentifier:(id)a5
{
  id v7;
  id v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSUUID *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  NSUUID *v20;
  void *v21;
  NSMutableDictionary *v22;
  void *v23;
  id v24;
  IDSService *encryptionService;
  unsigned __int8 v26;
  SDActivityPayloadManager *v27;
  unsigned __int8 v28;
  id v29;
  id v30;
  IDSService *v31;
  id v32;
  id v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  NSUUID *v41;
  void *v42;
  id v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  id v50;

  v7 = a3;
  v8 = a5;
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uniqueIDOverride"));
  v9 = objc_opt_new(NSMutableDictionary);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDActivityEncryptionManager sharedEncryptionManager](SDActivityEncryptionManager, "sharedEncryptionManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dataRepresentationForCurrentEncryptionKey"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v11, CFSTR("rKeyDataRepresentation"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityPayloadManager protobufDataFromRequest:](self, "protobufDataFromRequest:", v9));
  v14 = (void *)IDSCopyForDevice(v7);
  if (v14)
  {
    v40 = v14;
    v15 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v14));
    v16 = objc_opt_new(NSUUID);
    v18 = handoff_log(v16, v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = v16;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
      *(_DWORD *)buf = 138412290;
      v46 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Responding to Handoff encryption key request from \"%@\" via IDS", buf, 0xCu);

      v16 = v20;
    }
    v41 = v16;

    v22 = objc_opt_new(NSMutableDictionary);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityPayloadManager dataFromUUID:](self, "dataFromUUID:", v16));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v23, IDSSendMessageOptionUUIDKey);

    -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v8, IDSSendMessageOptionPeerResponseIdentifierKey);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, IDSSendMessageOptionEnforceRemoteTimeoutsKey);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", &off_10074B8B0, IDSSendMessageOptionTimeoutKey);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, IDSSendMessageOptionLocalDeliveryKey);
    v24 = objc_msgSend(objc_alloc((Class)IDSProtobuf), "initWithProtobufData:type:isResponse:", v12, 5, 1);
    encryptionService = self->_encryptionService;
    v43 = 0;
    v44 = 0;
    v39 = v15;
    v26 = -[IDSService sendProtobuf:toDestinations:priority:options:identifier:error:](encryptionService, "sendProtobuf:toDestinations:priority:options:identifier:error:", v24, v15, 300, v22, &v44, &v43);
    v27 = self;
    v28 = v26;
    v29 = v44;
    v30 = v43;
    if ((v28 & 1) == 0)
    {
      v31 = v27->_encryptionService;
      v38 = v12;
      v32 = v7;
      v33 = v8;
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v41, "UUIDString"));
      -[SDActivityPayloadManager service:account:identifier:didSendWithSuccess:error:](v27, "service:account:identifier:didSendWithSuccess:error:", v31, 0, v34, 0, v30);

      v8 = v33;
      v7 = v32;
      v12 = v38;
    }

    v35 = v39;
    v14 = v40;
  }
  else
  {
    v36 = handoff_log(0, v13);
    v35 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_encryptionService, "devices"));
      *(_DWORD *)buf = 138412802;
      v46 = v42;
      v47 = 2112;
      v48 = v37;
      v49 = 2112;
      v50 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "No device ID generated for device %@ (Devices: %@) for requestIdentifier %@", buf, 0x20u);

    }
  }

}

- (void)sendActivityPayloadRequestToDeviceIdentifier:(id)a3 withAdvertisementPayload:(id)a4 command:(id)a5 timeout:(int64_t)a6 completionHandler:(id)a7
{
  SDActivityPayloadRequestRecord *v12;
  id v13;
  id v14;
  void (**v15)(id, void *, _QWORD);
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  SDActivityPayloadRequestRecord *v19;
  NSMutableArray *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  SDActivityPayloadRequestRecord *v26;
  id v27;
  SDActivityPayloadRequestRecord *v28;
  NSUUID *v29;
  void *v30;
  void *v31;
  SDActivityPayloadRequestRecord *v32;
  void *v33;
  SDActivityPayloadRequestRecord *v34;
  SDActivityPayloadRequestRecord *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  unsigned int v42;
  uint64_t v43;
  void *v44;
  int64_t v45;
  SDActivityPayloadManager *v46;
  id v47;
  id v48;
  NSUUID *obj;
  _QWORD v50[4];
  SDActivityPayloadRequestRecord *v51;
  SDActivityPayloadManager *v52;
  id v53;
  _QWORD block[4];
  SDActivityPayloadRequestRecord *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[3];
  _QWORD v61[3];
  uint8_t v62[128];
  uint8_t buf[4];
  SDActivityPayloadRequestRecord *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  id v68;
  __int16 v69;
  int v70;

  v12 = (SDActivityPayloadRequestRecord *)a3;
  v13 = a4;
  v14 = a5;
  v15 = (void (**)(id, void *, _QWORD))a7;
  v17 = handoff_log(v15, v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v43 = SFHexStringForData(v13);
    v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
    *(_DWORD *)buf = 138413058;
    v64 = v12;
    v65 = 2112;
    v66 = v44;
    v67 = 2112;
    v68 = v14;
    v69 = 1024;
    v70 = a6;
    _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%@ %@ %@ %d", buf, 0x26u);

  }
  if (-[NSMutableArray count](self->_cachedActivityPayloadsForDemo, "count"))
  {
    v45 = a6;
    v46 = self;
    v47 = v14;
    v48 = v13;
    v19 = v12;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v20 = self->_cachedActivityPayloadsForDemo;
    v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v57;
      obj = (NSUUID *)v20;
      while (2)
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(_QWORD *)v57 != v23)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)i);
          v26 = (SDActivityPayloadRequestRecord *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("deviceIdentifier"), v45, v46));
          v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("advertisementPayload")));
          v28 = (SDActivityPayloadRequestRecord *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("activityCommand")));
          if (-[SDActivityPayloadRequestRecord isEqual:](v26, "isEqual:", v19)
            && objc_msgSend(v27, "isEqual:", v48)
            && -[SDActivityPayloadRequestRecord isEqual:](v28, "isEqual:", v47))
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("activityPayload")));
            v38 = handoff_log(v36, v37);
            v39 = objc_claimAutoreleasedReturnValue(v38);
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              v40 = SFHexStringForData(v27);
              v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
              v42 = objc_msgSend(v36, "length");
              *(_DWORD *)buf = 138412802;
              v64 = v26;
              v65 = 2112;
              v66 = v41;
              v67 = 1024;
              LODWORD(v68) = v42;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Found activity payload in cache for %@ from %@ of size %d", buf, 0x1Cu);

            }
            v15[2](v15, v36, 0);

            v35 = v19;
            v14 = v47;
            v13 = v48;
            v29 = obj;
            goto LABEL_19;
          }

        }
        v20 = (NSMutableArray *)obj;
        v22 = -[NSUUID countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
        if (v22)
          continue;
        break;
      }
    }

    v12 = v19;
    v14 = v47;
    v13 = v48;
    self = v46;
    a6 = v45;
  }
  v29 = objc_opt_new(NSUUID);
  v60[0] = CFSTR("rAdvPayload");
  v60[1] = CFSTR("rClientCommand");
  v61[0] = v13;
  v61[1] = v14;
  v60[2] = CFSTR("rIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v29, "UUIDString"));
  v61[2] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v61, v60, 3));

  v32 = objc_opt_new(SDActivityPayloadRequestRecord);
  -[SDActivityRequestRecord setRequestIdentifier:](v32, "setRequestIdentifier:", v29);
  -[SDActivityRequestRecord setDeviceIdentifier:](v32, "setDeviceIdentifier:", v12);
  -[SDActivityRequestRecord setCompletionHandler:](v32, "setCompletionHandler:", v15);
  -[SDActivityPayloadRequestRecord setAdvertisementPayload:](v32, "setAdvertisementPayload:", v13);
  -[SDActivityPayloadRequestRecord setCommand:](v32, "setCommand:", v14);
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer timerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "timerWithTimeInterval:target:selector:userInfo:repeats:", self, "requestTimedOut:", v29, 0, (double)(a6 + 1)));
  -[SDActivityRequestRecord setTimeoutTimer:](v32, "setTimeoutTimer:", v33);

  -[SDActivityRequestRecord setTimeoutTimeInterval:](v32, "setTimeoutTimeInterval:", a6);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_messageIdentifierToRequestRecords, "setObject:forKeyedSubscript:", v32, v29);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011E050;
  block[3] = &unk_1007146D8;
  v34 = v32;
  v55 = v34;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_10011E0B8;
  v50[3] = &unk_100717E48;
  v51 = v34;
  v52 = self;
  v53 = v31;
  v35 = v12;
  v27 = v31;
  v26 = v34;
  -[SDActivityPayloadManager sendRapportActivityPayloadRequest:withRequestRecord:completionHandler:](self, "sendRapportActivityPayloadRequest:withRequestRecord:completionHandler:", v27, v26, v50);

  v28 = v55;
LABEL_19:

}

- (void)sendRapportActivityPayloadRequest:(id)a3 withRequestRecord:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  int v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  NSObject *v48;
  void *v49;
  id v50;
  _QWORD v51[5];
  id v52;
  id v53;
  _QWORD *v54;
  _BYTE *v55;
  _QWORD v56[4];
  id v57;
  SDActivityPayloadManager *v58;
  id v59;
  id v60;
  _BYTE *v61;
  _QWORD *v62;
  _QWORD v63[3];
  char v64;
  _BYTE buf[24];
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;

  v50 = a3;
  v8 = a4;
  v9 = a5;
  v11 = handoff_log(v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Attempting to send rapport activity payload request", buf, 2u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
  v14 = objc_msgSend(v13, "isMirroringActive");

  v17 = handoff_log(v15, v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if ((v14 & 1) != 0)
  {
    if (v19)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Mirroring is active, bringing up scanner and sending if we find device", buf, 2u);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v66 = sub_10011E73C;
    v67 = sub_10011E74C;
    v68 = 0;
    v68 = objc_alloc_init((Class)RPCompanionLinkClient);
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setControlFlags:", 2);
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setControlFlags:", (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "controlFlags") | 0x10000);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceIdentifier"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v20));
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setDeviceFilter:", v21);

    v63[0] = 0;
    v63[1] = v63;
    v63[2] = 0x2020000000;
    v64 = 0;
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_10011E754;
    v56[3] = &unk_100717EE8;
    v22 = v8;
    v57 = v22;
    v58 = self;
    v59 = v50;
    v23 = v9;
    v60 = v23;
    v61 = buf;
    v62 = v63;
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setDeviceFoundHandler:", v56);
    v24 = *(void **)(*(_QWORD *)&buf[8] + 40);
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_10011E900;
    v51[3] = &unk_100717F38;
    v53 = v23;
    v54 = v63;
    v51[4] = self;
    v52 = v22;
    v55 = buf;
    objc_msgSend(v24, "activateWithCompletion:", v51);

    _Block_object_dispose(v63, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    if (v19)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Mirroring is not active, sending directly", buf, 2u);
    }

    v49 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient activeDevices](self->_rapportDiscoveryClient, "activeDevices"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceIdentifier"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("idsDeviceIdentifier == %@"), v25));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "filteredArrayUsingPredicate:", v26));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "firstObject"));

    if (v28)
    {
      v31 = (uint64_t)objc_msgSend(v8, "timeoutTimeInterval");
      v33 = handoff_log(v31, v32);
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        if (v31 >= 5)
          v35 = 5;
        else
          v35 = v31;
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "advertisementPayload"));
        v37 = SFHexStringForData(v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "requestIdentifier"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "UUIDString"));
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v38;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v40;
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v66) = v35;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Requesting Handoff payload via Rapport for %@ with message GUID: %@ and timeout: %d", buf, 0x1Cu);

      }
      v43 = handoff_log(v41, v42);
      v44 = objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        sub_100123944();

      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "linkClient"));
      if (v45)
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "linkClient"));
        objc_msgSend(v46, "invalidate");

        objc_msgSend(v8, "setLinkClient:", 0);
      }
      -[SDActivityPayloadManager sendActivityPayloadRequestMessageToDevice:withRequestRecord:withDestinationDevice:completionHandler:](self, "sendActivityPayloadRequestMessageToDevice:withRequestRecord:withDestinationDevice:completionHandler:", v50, v8, v28, v9);
    }
    else
    {
      if (self->_rapportDiscoveryClient)
      {
        v47 = handoff_log(v29, v30);
        v48 = objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v8;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v49;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Cannot send Handoff payload request %@ via Rapport as we found no devices in %@", buf, 0x16u);
        }

      }
      (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
    }

  }
}

- (void)sendActivityPayloadRequestMessageToDevice:(id)a3 withRequestRecord:(id)a4 withDestinationDevice:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  SDActivityPayloadManager *v37;
  id v38;
  id v39;
  id v40;
  int v41;
  _BYTE buf[12];
  __int16 v43;
  void *v44;
  __int16 v45;
  int v46;

  v34 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (uint64_t)objc_msgSend(v10, "timeoutTimeInterval");
  if (v13 >= 5)
    v15 = 5;
  else
    v15 = v13;
  v16 = handoff_log(v13, v14);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "advertisementPayload"));
    v19 = SFHexStringForData(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "requestIdentifier"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "UUIDString"));
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v20;
    v43 = 2112;
    v44 = v22;
    v45 = 1024;
    v46 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Requesting Handoff payload via Rapport for %@ with message GUID: %@ and timeout: %d", buf, 0x1Cu);

  }
  v25 = handoff_log(v23, v24);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    sub_100123944();

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "linkClient"));
  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "linkClient"));
    objc_msgSend(v28, "invalidate");

    objc_msgSend(v10, "setLinkClient:", 0);
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityPayloadManager createRapportClientWithDestinationDevice:](self, "createRapportClientWithDestinationDevice:", v11));
  objc_msgSend(v10, "setLinkClient:", v29);

  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, v10);
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "linkClient"));
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10011EE68;
  v35[3] = &unk_100717E98;
  objc_copyWeak(&v40, (id *)buf);
  v41 = v15;
  v31 = v34;
  v36 = v31;
  v37 = self;
  v32 = v11;
  v38 = v32;
  v33 = v12;
  v39 = v33;
  objc_msgSend(v30, "activateWithCompletion:", v35);

  objc_destroyWeak(&v40);
  objc_destroyWeak((id *)buf);

}

- (void)sendIDSActivityPayloadRequest:(id)a3 withRequestRecord:(id)a4 desiredTimeout:(double)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableSet *v12;
  uint64_t v13;
  NSMutableSet *v14;
  IDSService *activityService;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  NSMutableDictionary *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  IDSService *v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  NSErrorUserInfoKey v68;
  const __CFString *v69;
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  unsigned int v75;
  _BYTE v76[128];

  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityPayloadManager protobufDataFromRequest:](self, "protobufDataFromRequest:", a3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityPayloadManager idsDeviceWithUniqueID:onService:](self, "idsDeviceWithUniqueID:onService:", v10, self->_activityService));

  v12 = objc_opt_new(NSMutableSet);
  v14 = v12;
  v61 = v11;
  if (v11)
  {
    v60 = v9;
    activityService = self->_activityService;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nsuuid"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devicesForBTUUID:](activityService, "devicesForBTUUID:", v16));

    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v18 = v17;
    v19 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v65;
      while (2)
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(_QWORD *)v65 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)i);
          v24 = IDSCopyForDevice(v23);
          if (v24)
          {
            v29 = (void *)v24;
            -[NSMutableSet addObject:](v14, "addObject:", v24);
            v30 = -[NSObject count](v18, "count");
            if ((unint64_t)v30 >= 2)
            {
              v32 = handoff_log(v30, v31);
              v33 = objc_claimAutoreleasedReturnValue(v32);
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Sending handoff payload request via IDS to single of multiple possible destinations.", buf, 2u);
              }

            }
            goto LABEL_18;
          }
          v26 = handoff_log(0, v25);
          v27 = objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_encryptionService, "devices"));
            *(_DWORD *)buf = 138412546;
            v71 = v23;
            v72 = 2112;
            v73 = v28;
            _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "No device ID generated for device %@ (Devices: %@)", buf, 0x16u);

          }
        }
        v20 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
        if (v20)
          continue;
        break;
      }
    }
LABEL_18:

    v9 = v60;
  }
  else
  {
    v34 = handoff_log(v12, v13);
    v18 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_100123ACC();
  }

  if (v14)
  {
    v37 = handoff_log(v35, v36);
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "advertisementPayload"));
      v40 = SFHexStringForData(v39);
      v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "requestIdentifier"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "UUIDString"));
      v44 = objc_msgSend(v8, "timeoutTimeInterval");
      *(_DWORD *)buf = 138412802;
      v71 = v41;
      v72 = 2112;
      v73 = v43;
      v74 = 1024;
      v75 = v44;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Requesting Handoff payload via IDS for %@ with message GUID: %@ and timeout: %d", buf, 0x1Cu);

    }
    v47 = handoff_log(v45, v46);
    v48 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      sub_100123A64();

    v49 = objc_opt_new(NSMutableDictionary);
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "requestIdentifier"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityPayloadManager dataFromUUID:](self, "dataFromUUID:", v50));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v49, "setObject:forKeyedSubscript:", v51, IDSSendMessageOptionUUIDKey);

    -[NSMutableDictionary setObject:forKeyedSubscript:](v49, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, IDSSendMessageOptionExpectsPeerResponseKey);
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a5));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v49, "setObject:forKeyedSubscript:", v52, IDSSendMessageOptionTimeoutKey);

    -[NSMutableDictionary setObject:forKeyedSubscript:](v49, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, IDSSendMessageOptionFireAndForgetKey);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v49, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, IDSSendMessageOptionActivityContinuationKey);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v49, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, IDSSendMessageOptionEnforceRemoteTimeoutsKey);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v49, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, IDSSendMessageOptionLocalDeliveryKey);
    v53 = objc_msgSend(objc_alloc((Class)IDSProtobuf), "initWithProtobufData:type:isResponse:", v9, 1, 0);
    kdebug_trace(722141184, 0, 0, 0, 0);
    v54 = self->_activityService;
    v62 = 0;
    v63 = 0;
    v55 = -[IDSService sendProtobuf:toDestinations:priority:options:identifier:error:](v54, "sendProtobuf:toDestinations:priority:options:identifier:error:", v53, v14, 300, v49, &v63, &v62);
    v56 = v63;
    v57 = v62;
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "requestIdentifier"));
    -[SDActivityPayloadManager messageWithIdentifier:didSendWithSuccess:error:](self, "messageWithIdentifier:didSendWithSuccess:error:", v58, v55, v57);

  }
  else
  {
    v68 = NSLocalizedDescriptionKey;
    v69 = CFSTR("Failed to find device to request activity payload from");
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1));
    v56 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 65, v59));

    v49 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "requestIdentifier"));
    -[SDActivityPayloadManager messageWithIdentifier:didSendWithSuccess:error:](self, "messageWithIdentifier:didSendWithSuccess:error:", v49, 0, v56);
  }

}

- (void)handleEncyptionKeyRequest:(id)a3 fromIDSDevice:(id)a4 withRequestIdentifier:(id)a5 transportType:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, NSMutableDictionary *);
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  double v21;
  double v22;
  uint64_t v23;
  NSObject *v24;
  NSDate *v25;
  NSMutableDictionary *v26;
  void *v27;
  id v28;
  void (**v29)(id, NSMutableDictionary *);
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = (void (**)(id, NSMutableDictionary *))a7;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "uniqueIDOverride"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("rKeyDataRepresentation")));
  -[SDActivityPayloadManager setDecryptionKeyDataRepresentation:forDeviceIdentifier:](self, "setDecryptionKeyDataRepresentation:forDeviceIdentifier:", v17, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_uniqueIDToKeyReplyDate, "objectForKeyedSubscript:", v16));
  v19 = objc_msgSend(v18, "timeIntervalSinceNow");
  if (v21 <= -0.0)
    v22 = -v21;
  else
    v22 = 0.0;
  if (v18 && v22 < 5.0)
  {
    v23 = handoff_log(v19, v20);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v33 = SFStringFromTimeInterval(1, v22);
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      *(_DWORD *)buf = 138413058;
      v37 = v16;
      v38 = 2112;
      v39 = v14;
      v40 = 2112;
      v41 = v13;
      v42 = 2112;
      v43 = v34;
      _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Ignoring request from %@ via %@ for key with requestIdentifier %@ as we replied only %@ ago", buf, 0x2Au);

    }
  }
  else
  {
    v25 = objc_opt_new(NSDate);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_uniqueIDToKeyReplyDate, "setObject:forKeyedSubscript:", v25, v16);

    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("rKeyPreviousIdentifier")));
    v26 = objc_opt_new(NSMutableDictionary);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[SDActivityEncryptionManager sharedEncryptionManager](SDActivityEncryptionManager, "sharedEncryptionManager"));
    v28 = v12;
    v29 = v15;
    v30 = v14;
    v31 = v13;
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "dataRepresentationForCurrentEncryptionKey"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v32, CFSTR("rKeyDataRepresentation"));

    v13 = v31;
    v14 = v30;
    v15 = v29;
    v12 = v28;

    v15[2](v15, v26);
  }

}

- (void)handleEncryptionKeyRequestRapport:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (RPOptionSenderIDSDeviceID)
    v11 = (const __CFString *)RPOptionSenderIDSDeviceID;
  else
    v11 = CFSTR("senderIDS");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v11));
  if (!v12)
  {
    v16 = 0;
LABEL_11:
    v23 = NSErrorWithOSStatusF(4294960588, "IDS device not found");
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    (*((void (**)(id, _QWORD, _QWORD, void *))v10 + 2))(v10, 0, 0, v24);

    goto LABEL_12;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_activityService, "devices"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("uniqueIDOverride == %@"), v12));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "filteredArrayUsingPredicate:", v14));
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));

  if (!v8 || !v16)
    goto LABEL_11;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("rIdentifier")));
  v19 = handoff_log(v17, v18);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "name"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", RPOptionXID));
    *(_DWORD *)buf = 138412802;
    v29 = v21;
    v30 = 2112;
    v31 = v17;
    v32 = 2112;
    v33 = v22;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Received Handoff encryption key request from \"%@\" via Rapport with requestIdentifier %@, xid %@", buf, 0x20u);

  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10011FE4C;
  v25[3] = &unk_100717F60;
  v16 = v16;
  v26 = v16;
  v27 = v10;
  -[SDActivityPayloadManager handleEncyptionKeyRequest:fromIDSDevice:withRequestIdentifier:transportType:completionHandler:](self, "handleEncyptionKeyRequest:fromIDSDevice:withRequestIdentifier:transportType:completionHandler:", v8, v16, v17, CFSTR("Rapport"), v25);

LABEL_12:
}

- (void)handleEncryptionKeyRequestProtobuf:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  IDSService *encryptionService;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  _QWORD v26[5];
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;

  v10 = a6;
  v11 = a7;
  encryptionService = self->_encryptionService;
  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService deviceForFromID:](encryptionService, "deviceForFromID:", v10));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "data"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityPayloadManager requestFromProtobufData:](self, "requestFromProtobufData:", v15));
  if (v14 && v16)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "outgoingResponseIdentifier"));
    v21 = handoff_log(v19, v20);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));
      *(_DWORD *)buf = 138412546;
      v30 = v23;
      v31 = 2112;
      v32 = v19;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Received Handoff encryption key request from \"%@\" via IDS with requestIdentifier %@", buf, 0x16u);

    }
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10012013C;
    v26[3] = &unk_100717F88;
    v26[4] = self;
    v27 = v14;
    v28 = v19;
    v24 = v19;
    -[SDActivityPayloadManager handleEncyptionKeyRequest:fromIDSDevice:withRequestIdentifier:transportType:completionHandler:](self, "handleEncyptionKeyRequest:fromIDSDevice:withRequestIdentifier:transportType:completionHandler:", v16, v27, v24, CFSTR("IDS"), v26);

  }
  else
  {
    v25 = handoff_log(v17, v18);
    v24 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_100123B6C();
  }

}

- (void)handleEncryptionKeyReplyRapport:(id)a3 options:(id)a4 forRequestRecord:(id)a5 fromDevice:(id)a6
{
  id v10;
  id v11;
  IDSService *activityService;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t Int64Ranged;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  const char *v25;
  void *v26;
  void *v27;
  SDActivityPayloadManager *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;

  v10 = a4;
  v11 = a5;
  activityService = self->_activityService;
  v13 = a6;
  v14 = a3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](activityService, "devices"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "idsDeviceIdentifier"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("uniqueIDOverride == %@"), v16));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "filteredArrayUsingPredicate:", v17));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));

  Int64Ranged = CFDictionaryGetInt64Ranged(v10, RPOptionDataLinkType, 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
  v22 = handoff_log(Int64Ranged, v21);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v28 = self;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "name"));
    if (Int64Ranged > 0xB)
      v25 = "?";
    else
      v25 = off_100718048[(int)Int64Ranged];
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "requestIdentifier"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", RPOptionXID));
    *(_DWORD *)buf = 138413058;
    v30 = v24;
    v31 = 2080;
    v32 = v25;
    v33 = 2112;
    v34 = v26;
    v35 = 2112;
    v36 = v27;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Received a new Handoff encryption key from \"%@\" via Rapport (%s) with requestIdentifier %@, xid %@", buf, 0x2Au);

    self = v28;
  }

  -[SDActivityPayloadManager handleEncryptionKeyReply:forRequestRecord:fromDevice:transportLinkType:](self, "handleEncryptionKeyReply:forRequestRecord:fromDevice:transportLinkType:", v14, v11, v19, Int64Ranged);
}

- (void)handleEncryptionKeyReplyRequestProtobuf:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  IDSService *encryptionService;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;

  encryptionService = self->_encryptionService;
  v11 = a7;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService deviceForFromID:](encryptionService, "deviceForFromID:", a6));
  v14 = objc_alloc((Class)NSUUID);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "incomingResponseIdentifier"));

  v16 = objc_msgSend(v14, "initWithUUIDString:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "data"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityPayloadManager requestFromProtobufData:](self, "requestFromProtobufData:", v17));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_messageIdentifierToKeyRequestRecords, "objectForKeyedSubscript:", v16));
  v21 = handoff_log(v19, v20);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "requestIdentifier"));
    v25 = 138412546;
    v26 = v23;
    v27 = 2112;
    v28 = v24;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Received a new Handoff encryption key from \"%@\" via IDS with requestIdentifier %@", (uint8_t *)&v25, 0x16u);

  }
  -[SDActivityPayloadManager handleEncryptionKeyReply:forRequestRecord:fromDevice:transportLinkType:](self, "handleEncryptionKeyReply:forRequestRecord:fromDevice:transportLinkType:", v18, v19, v13, 0xFFFFFFFFLL);

}

- (void)handleEncryptionKeyReply:(id)a3 forRequestRecord:(id)a4 fromDevice:(id)a5 transportLinkType:(int)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void (**v26)(_QWORD, _QWORD, _QWORD);
  uint64_t v27;
  NSObject *v28;
  _BOOL4 v29;

  v6 = *(_QWORD *)&a6;
  v10 = a4;
  v11 = a5;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueIDOverride"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("rKeyDataRepresentation")));

  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "requestIdentifier"));
  v17 = (void *)v15;
  if (v10 && v11)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_messageIdentifierToKeyRequestRecords, "removeObjectForKey:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "timeoutTimer"));
    objc_msgSend(v18, "invalidate");

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceIdentifier"));
    v20 = objc_msgSend(v19, "isEqual:", v13);

    if ((v20 & 1) == 0)
    {
      v23 = handoff_log(v21, v22);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        sub_100123BFC();

    }
    sub_1000C0874(1, 1, 0, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "requestCreatedDate"));
    objc_msgSend(v25, "timeIntervalSinceNow");
    -[SDActivityPayloadManager logDashboardHandoffRequestViaTransportLinkType:type:success:rtt:](self, "logDashboardHandoffRequestViaTransportLinkType:type:success:rtt:", v6, CFSTR("EncryptionKey"), 1);

    v26 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "completionHandler"));
    ((void (**)(_QWORD, void *, _QWORD))v26)[2](v26, v14, 0);

  }
  else
  {
    v27 = handoff_log(v15, v16);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG);
    if (v14 && v13)
    {
      if (v29)
        sub_100123C8C();

      -[SDActivityPayloadManager setDecryptionKeyDataRepresentation:forDeviceIdentifier:](self, "setDecryptionKeyDataRepresentation:forDeviceIdentifier:", v14, v13);
    }
    else
    {
      if (v29)
        sub_100123D24();

    }
  }

}

- (void)handlePayloadRequestRapport:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  SDActivityPayloadManager *v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (RPOptionSenderIDSDeviceID)
    v11 = (const __CFString *)RPOptionSenderIDSDeviceID;
  else
    v11 = CFSTR("senderIDS");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v11));
  if (!v12)
  {
    v16 = 0;
LABEL_11:
    v23 = NSErrorWithOSStatusF(4294960588, "IDS device not found");
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    (*((void (**)(id, _QWORD, _QWORD, void *))v10 + 2))(v10, 0, 0, v24);

    goto LABEL_12;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_activityService, "devices"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("uniqueIDOverride == %@"), v12));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "filteredArrayUsingPredicate:", v14));
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));

  if (!v8 || !v16)
    goto LABEL_11;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("rIdentifier")));
  v19 = handoff_log(v17, v18);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "name"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", RPOptionXID));
    *(_DWORD *)buf = 138412802;
    v30 = v21;
    v31 = 2112;
    v32 = v17;
    v33 = 2112;
    v34 = v22;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Received Handoff payload request from \"%@\" via Rapport with requestIdentifier %@, xid %@", buf, 0x20u);

  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1001209F0;
  v25[3] = &unk_100717FB0;
  v16 = v16;
  v26 = v16;
  v27 = self;
  v28 = v10;
  -[SDActivityPayloadManager handlePayloadRequest:fromIDSDevice:withRequestIdentifier:transportType:completionHandler:](self, "handlePayloadRequest:fromIDSDevice:withRequestIdentifier:transportType:completionHandler:", v8, v16, v17, CFSTR("Rapport"), v25);

LABEL_12:
}

- (void)handlePayloadRequestProtobuf:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  IDSService *activityService;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD v21[5];

  v10 = a6;
  v11 = a7;
  activityService = self->_activityService;
  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService deviceForFromID:](activityService, "deviceForFromID:", v10));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "data"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityPayloadManager requestFromProtobufData:](self, "requestFromProtobufData:", v15));
  if (v14 && v16)
  {
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "outgoingResponseIdentifier"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100120CC8;
    v21[3] = &unk_100717FD8;
    v21[4] = self;
    -[SDActivityPayloadManager handlePayloadRequest:fromIDSDevice:withRequestIdentifier:transportType:completionHandler:](self, "handlePayloadRequest:fromIDSDevice:withRequestIdentifier:transportType:completionHandler:", v16, v14, v19, CFSTR("IDS"), v21);
  }
  else
  {
    v20 = handoff_log(v17, v18);
    v19 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_100123E68();
  }

}

- (void)handlePayloadRequest:(id)a3 fromIDSDevice:(id)a4 withRequestIdentifier:(id)a5 transportType:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSDate *v18;
  id v19;
  void *v20;
  __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  const __CFString *v27;
  uint64_t v28;
  void *v29;
  SDActivityAdvertiser *advertiser;
  id v31;
  __CFString *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  NSDate *v38;
  id v39;
  NSDate *v40;
  SDActivityPayloadManager *v41;
  void *v42;
  _QWORD v43[4];
  NSDate *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  __CFString *v50;
  SDActivityPayloadManager *v51;
  id v52;
  uint8_t buf[4];
  id v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  const __CFString *v62;
  __int16 v63;
  void *v64;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = a3;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uniqueIDOverride"));
  v18 = objc_opt_new(NSDate);
  v19 = sub_1000C0734(v12);
  v42 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("rAdvPayload")));
  v21 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("rClientCommand")));

  v24 = handoff_log(v22, v23);
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v41 = self;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
    v39 = v15;
    if (v21)
      v27 = v21;
    else
      v27 = CFSTR("-");
    v28 = SFHexStringForData(v20);
    v40 = v18;
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    *(_DWORD *)buf = 138413570;
    v54 = v14;
    v55 = 2112;
    v56 = v26;
    v57 = 2112;
    v58 = v17;
    v59 = 2112;
    v60 = v13;
    v61 = 2112;
    v62 = v27;
    v15 = v39;
    v63 = 2112;
    v64 = v29;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Received handoff payload request via %@ from \"%@\" (%@) with requestIdentifier %@ command=%@ for advertisementPayload %@", buf, 0x3Eu);

    self = v41;
    v18 = v40;
  }

  advertiser = self->_advertiser;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100120FBC;
  v43[3] = &unk_100718000;
  v44 = v18;
  v45 = v14;
  v46 = v12;
  v47 = v17;
  v48 = v13;
  v49 = v20;
  v50 = v21;
  v51 = self;
  v52 = v15;
  v31 = v15;
  v32 = v21;
  v33 = v20;
  v34 = v13;
  v35 = v17;
  v36 = v12;
  v37 = v14;
  v38 = v18;
  -[SDActivityAdvertiser activityPayloadForAdvertisementPayload:command:requestedByDevice:withCompletionHandler:](advertiser, "activityPayloadForAdvertisementPayload:command:requestedByDevice:withCompletionHandler:", v33, v32, v42, v43);

}

- (void)sendIDSActivityPayloadReply:(id)a3 withReplyRecord:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  NSMutableDictionary *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  IDSService *activityService;
  unsigned int v37;
  id v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  uint8_t buf[4];
  void *v47;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_activityService, "devices"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "deviceIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("uniqueIDOverride == %@"), v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filteredArrayUsingPredicate:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));

  v14 = (void *)IDSCopyForDevice(v12);
  if (v14)
  {
    v15 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v14));
    v16 = objc_claimAutoreleasedReturnValue(-[SDActivityPayloadManager protobufDataFromRequest:](self, "protobufDataFromRequest:", v6));
    v18 = handoff_log(v16, v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
      *(_DWORD *)buf = 138412290;
      v47 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Responding to Handoff payload request from \"%@\" via IDS", buf, 0xCu);

    }
    v23 = handoff_log(v21, v22);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      sub_100123E08();
    v42 = v12;
    v43 = v6;

    v27 = handoff_log(v25, v26);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      sub_100123DA8();

    v29 = objc_opt_new(NSMutableDictionary);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "messageIdentifier"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityPayloadManager dataFromUUID:](self, "dataFromUUID:", v30));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v31, IDSSendMessageOptionUUIDKey);

    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "requestIdentifier"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "UUIDString"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v33, IDSSendMessageOptionPeerResponseIdentifierKey);

    -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", &off_10074B8B0, IDSSendMessageOptionTimeoutKey);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, IDSSendMessageOptionFireAndForgetKey);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, IDSSendMessageOptionActivityContinuationKey);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, IDSSendMessageOptionEnforceRemoteTimeoutsKey);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, IDSSendMessageOptionLocalDeliveryKey);
    v34 = (void *)v16;
    v35 = objc_msgSend(objc_alloc((Class)IDSProtobuf), "initWithProtobufData:type:isResponse:", v16, 2, 1);
    activityService = self->_activityService;
    v44 = 0;
    v45 = 0;
    v37 = -[IDSService sendProtobuf:toDestinations:priority:options:identifier:error:](activityService, "sendProtobuf:toDestinations:priority:options:identifier:error:", v35, v15, 300, v29, &v45, &v44);
    v38 = v45;
    v39 = v44;
    if (v37)
    {
      -[SDActivityPayloadManager activityPayloadReplySuccess:](self, "activityPayloadReplySuccess:", v7);
    }
    else
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "messageIdentifier"));
      -[SDActivityPayloadManager messageWithIdentifier:didSendWithSuccess:error:](self, "messageWithIdentifier:didSendWithSuccess:error:", v41, 0, v39);

    }
    v6 = v43;

    v12 = v42;
  }
  else
  {
    v40 = handoff_log(0, v13);
    v15 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_10012407C();
  }

}

- (void)activityPayloadReplySuccess:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activityIdentifier"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v9 = CFSTR("SDStreamActivityIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activityIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
    v10 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
    objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("com.apple.sharingd.ContinuationPayloadSent"), 0, v8);

  }
}

- (void)handlePayloadReplyRapport:(id)a3 options:(id)a4 forRequestRecord:(id)a5 fromDevice:(id)a6
{
  id v10;
  id v11;
  IDSService *activityService;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t Int64Ranged;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  const char *v25;
  void *v26;
  void *v27;
  SDActivityPayloadManager *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;

  v10 = a4;
  v11 = a5;
  activityService = self->_activityService;
  v13 = a6;
  v14 = a3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](activityService, "devices"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "idsDeviceIdentifier"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("uniqueIDOverride == %@"), v16));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "filteredArrayUsingPredicate:", v17));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));

  Int64Ranged = CFDictionaryGetInt64Ranged(v10, RPOptionDataLinkType, 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
  v22 = handoff_log(Int64Ranged, v21);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v28 = self;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "name"));
    if (Int64Ranged > 0xB)
      v25 = "?";
    else
      v25 = off_100718048[(int)Int64Ranged];
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "requestIdentifier"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", RPOptionXID));
    *(_DWORD *)buf = 138413058;
    v30 = v24;
    v31 = 2080;
    v32 = v25;
    v33 = 2112;
    v34 = v26;
    v35 = 2112;
    v36 = v27;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Received Handoff payload reply from \"%@\" via Rapport (%s) with requestIdentifier %@, xid %@", buf, 0x2Au);

    self = v28;
  }

  -[SDActivityPayloadManager handlePayloadReply:forRequestRecord:fromDevice:transportLinkType:](self, "handlePayloadReply:forRequestRecord:fromDevice:transportLinkType:", v14, v11, v19, Int64Ranged);
}

- (void)handlePayloadReplyProtobuf:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;

  v10 = a3;
  v11 = a7;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService deviceForFromID:](self->_activityService, "deviceForFromID:", a6));
  if (v12)
  {
    v13 = objc_alloc((Class)NSUUID);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "incomingResponseIdentifier"));
    v15 = objc_msgSend(v13, "initWithUUIDString:", v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_messageIdentifierToRequestRecords, "objectForKeyedSubscript:", v15));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "data"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityPayloadManager requestFromProtobufData:](self, "requestFromProtobufData:", v17));

    v21 = handoff_log(v19, v20);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "requestIdentifier"));
      v25 = 138412546;
      v26 = v23;
      v27 = 2112;
      v28 = v24;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Received Handoff payload reply from \"%@\" via IDS with requestIdentifier %@", (uint8_t *)&v25, 0x16u);

    }
    -[SDActivityPayloadManager handlePayloadReply:forRequestRecord:fromDevice:transportLinkType:](self, "handlePayloadReply:forRequestRecord:fromDevice:transportLinkType:", v18, v16, v12, 0xFFFFFFFFLL);

  }
}

- (void)handlePayloadReply:(id)a3 forRequestRecord:(id)a4 fromDevice:(id)a5 transportLinkType:(int)a6
{
  uint64_t v6;
  id v9;
  id v10;
  __CFString *v11;
  uint64_t v12;
  const char *v13;
  NSMutableDictionary *messageIdentifierToRequestRecords;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void (**v44)(_QWORD, _QWORD, _QWORD);
  unsigned int v45;
  void *v46;
  NSObject *v47;
  void *v48;
  __CFString *v50;
  __CFString *v51;
  uint8_t buf[4];
  __CFString *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  id v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;

  v6 = *(_QWORD *)&a6;
  v9 = a3;
  v10 = a4;
  v11 = (__CFString *)a5;
  v51 = v11;
  if ((v6 & 0x80000000) != 0)
  {
    v50 = CFSTR("IDS");
    if (!v9)
      goto LABEL_11;
  }
  else
  {
    if (v6 > 0xB)
      v13 = "?";
    else
      v13 = off_100718048[(int)v6];
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Rapport (%s)"), v13));
    v50 = v11;
    if (!v9)
      goto LABEL_11;
  }
  if (v10)
  {
    messageIdentifierToRequestRecords = self->_messageIdentifierToRequestRecords;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "requestIdentifier"));
    -[NSMutableDictionary removeObjectForKey:](messageIdentifierToRequestRecords, "removeObjectForKey:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "timeoutTimer"));
    objc_msgSend(v16, "invalidate");

    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("rAdvPayload")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("rActPayload")));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("rActPayloadErrorDomain")));

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("rActPayloadErrorDomain")));
      v21 = v18;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("rActPayloadErrorCode")));
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v20, objc_msgSend(v22, "integerValue"), 0));

      v18 = v21;
    }
    else
    {
      v48 = 0;
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "requestCreatedDate"));
    objc_msgSend(v27, "timeIntervalSinceNow");
    v29 = SFStringFromTimeInterval(1, -v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

    v33 = handoff_log(v31, v32);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString name](v51, "name"));
      v45 = v6;
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString uniqueIDOverride](v51, "uniqueIDOverride"));
      v37 = SFHexStringForData(v17);
      v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
      v46 = v18;
      v39 = objc_msgSend(v18, "length");
      v47 = v17;
      v40 = v30;
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "requestIdentifier"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "UUIDString"));
      *(_DWORD *)buf = 138414082;
      v53 = v50;
      v54 = 2112;
      v55 = v35;
      v56 = 2112;
      v57 = v36;
      v58 = 2112;
      v59 = v38;
      v60 = 2048;
      v61 = v39;
      v18 = v46;
      v62 = 2112;
      v63 = v42;
      v64 = 2112;
      v65 = v48;
      v66 = 2112;
      v67 = v40;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Received requested Handoff payload via %@ from \"%@\" (%@) for %@ with activity payload of size %ld for requestIdentifier %@ (%@). RTT:%@", buf, 0x52u);

      v30 = v40;
      v17 = v47;

      v6 = v45;
    }

    kdebug_trace(722141188, 0, 0, 0, 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "requestCreatedDate"));
    objc_msgSend(v43, "timeIntervalSinceNow");
    -[SDActivityPayloadManager logDashboardHandoffRequestViaTransportLinkType:type:success:rtt:](self, "logDashboardHandoffRequestViaTransportLinkType:type:success:rtt:", v6, CFSTR("Request"), 1);

    v44 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "completionHandler"));
    ((void (**)(_QWORD, void *, void *))v44)[2](v44, v18, v48);

    goto LABEL_17;
  }
LABEL_11:
  v23 = handoff_log(v11, v12);
  v17 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "requestIdentifier"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "UUIDString"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString uniqueIDOverride](v51, "uniqueIDOverride"));
    *(_DWORD *)buf = 138412802;
    v53 = v50;
    v54 = 2112;
    v55 = v25;
    v56 = 2112;
    v57 = v26;
    _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Activity payload received via %@ for requestIdentifier %@ not/no longer wanted from %@", buf, 0x20u);

  }
LABEL_17:

}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;

  v8 = a5;
  v9 = a7;
  v11 = handoff_log(v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    sub_100124148();

}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;

  v7 = a7;
  v9 = handoff_log(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_1001241B0();

}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;

  v6 = a5;
  v8 = handoff_log(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    sub_100124210();

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;

  v7 = a6;
  v10 = a7;
  v11 = a5;
  v12 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v11);

  -[SDActivityPayloadManager messageWithIdentifier:didSendWithSuccess:error:](self, "messageWithIdentifier:didSendWithSuccess:error:", v12, v7, v10);
}

- (void)messageWithIdentifier:(id)a3 didSendWithSuccess:(BOOL)a4 error:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  SDActivityAdvertiser *advertiser;
  void *v27;
  NSErrorUserInfoKey v28;
  const __CFString *v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  id v35;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_messageIdentifierToReplyRecords, "objectForKeyedSubscript:", v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_messageIdentifierToRequestRecords, "objectForKeyedSubscript:", v8));
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_messageIdentifierToKeyRequestRecords, "objectForKeyedSubscript:", v8));
  v14 = v13;

  v17 = handoff_log(v15, v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    if (v14)
      v19 = v14;
    else
      v19 = v8;
    if (v10)
      v19 = v10;
    v20 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    v31 = v19;
    v32 = 2112;
    if (v6)
      v20 = CFSTR("YES");
    v33 = v20;
    v34 = 2112;
    v35 = v9;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@ %@ (%@)", buf, 0x20u);
  }

  if (!v9 && !v6)
  {
    v28 = NSLocalizedDescriptionKey;
    v29 = CFSTR("Unknown Error");
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 94, v21));

  }
  if (v10)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_messageIdentifierToReplyRecords, "removeObjectForKey:", v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceIdentifier"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityPayloadManager idsDeviceWithUniqueID:onService:](self, "idsDeviceWithUniqueID:onService:", v22, self->_activityService));
    v24 = sub_1000C0734(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

    advertiser = self->_advertiser;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activityIdentifier"));
    -[SDActivityAdvertiser didSendPayloadForActivityIdentifier:toDevice:error:](advertiser, "didSendPayloadForActivityIdentifier:toDevice:error:", v27, v25, v9);

LABEL_21:
    goto LABEL_22;
  }
  if (v14 && v9)
  {
    objc_msgSend(v14, "setError:", v9);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "timeoutTimer"));
    objc_msgSend(v25, "fire");
    goto LABEL_21;
  }
LABEL_22:

}

- (id)dataFromUUID:(id)a3
{
  _QWORD v4[2];

  v4[0] = 0;
  v4[1] = 0;
  objc_msgSend(a3, "getUUIDBytes:", v4);
  return (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v4, 16));
}

- (id)requestFromProtobufData:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v10;
  uint64_t v11;

  v10 = 0;
  v11 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", a3, 0, &v11, &v10));
  v4 = v10;
  v6 = v4;
  if (!v3)
  {
    v7 = handoff_log(v4, v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100124270();

  }
  return v3;
}

- (id)protobufDataFromRequest:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v12;

  v3 = a3;
  v4 = objc_msgSend(&off_10074E4E0, "mutableCopy");
  objc_msgSend(v4, "addEntriesFromDictionary:", v3);

  v12 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v4, 200, 0, &v12));
  v6 = v12;
  v8 = v6;
  if (!v5)
  {
    v9 = handoff_log(v6, v7);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1001242D0();

  }
  return v5;
}

- (void)setDecryptionKeyDataRepresentation:(id)a3 forDeviceIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  uint64_t v18;
  unsigned int v19;
  _BOOL4 v20;
  NSObject *v22;
  uint64_t v23;

  v5 = a4;
  if (a3)
  {
    v6 = a3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDActivityEncryptionManager sharedEncryptionManager](SDActivityEncryptionManager, "sharedEncryptionManager"));
    v8 = objc_msgSend(v7, "newDecryptionKeyFromDataRepresentation:", v6);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "decryptionKeyForDeviceIdentifier:", v5));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dateCreated"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateCreated"));
    objc_msgSend(v10, "timeIntervalSinceDate:", v11);
    v13 = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "keyIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "keyIdentifier"));
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (v16)
    {
      v19 = objc_msgSend(v9, "lastUsedCounter");
      v17 = objc_msgSend(v8, "lastUsedCounter");
      v20 = v19 < v17;
      if (!v8)
        goto LABEL_14;
    }
    else
    {
      v20 = 0;
      if (!v8)
        goto LABEL_14;
    }
    if (v13 < 0.0 || v9 == 0)
      v20 = 1;
    if (v20)
    {
      v22 = objc_claimAutoreleasedReturnValue(+[SDActivityEncryptionManager sharedEncryptionManager](SDActivityEncryptionManager, "sharedEncryptionManager"));
      -[NSObject setDecryptionKey:forDeviceIdentifier:](v22, "setDecryptionKey:forDeviceIdentifier:", v8, v5);
LABEL_16:

      goto LABEL_17;
    }
LABEL_14:
    v23 = handoff_log(v17, v18);
    v22 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      sub_100124338();
    goto LABEL_16;
  }
LABEL_17:

}

- (void)logDashboardHandoffRequestViaTransportLinkType:(int)a3 type:(id)a4 success:(BOOL)a5 rtt:(double)a6
{
  _BOOL8 v6;
  uint64_t v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[7];
  _QWORD v20[7];

  v6 = a5;
  v8 = *(_QWORD *)&a3;
  v19[0] = CFSTR("_cat");
  v19[1] = CFSTR("_op");
  v20[0] = CFSTR("Handoff");
  v20[1] = a4;
  v19[2] = CFSTR("rapportTransport");
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v8));
  v20[2] = v11;
  v19[3] = CFSTR("success");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v6));
  v20[3] = v12;
  v19[4] = CFSTR("wasRapport");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (int)v8 >= 0));
  v20[4] = v13;
  v19[5] = CFSTR("RTT");
  v14 = (int)(a6 * 1000.0);
  if (v14 >= 0)
    v15 = v14;
  else
    v15 = -v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v15));
  v20[5] = v16;
  v19[6] = CFSTR("d2dEncryptionAvailable");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_d2dEncryptionAvailable));
  v20[6] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 7));

  SFDashboardLogJSON(v18);
}

- (id)createRapportClientWithDestinationDevice:(id)a3
{
  id v3;
  RPCompanionLinkClient *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  RPCompanionLinkClient *v13;

  v3 = a3;
  v4 = objc_opt_new(RPCompanionLinkClient);
  if (!sub_1000CE8D0(CFSTR("ContinuityRapportDisableBLEDiscovery"), 0))
    -[RPCompanionLinkClient setControlFlags:](v4, "setControlFlags:", (unint64_t)-[RPCompanionLinkClient controlFlags](v4, "controlFlags") | 2);
  if (sub_1000CE8D0(CFSTR("ContinuityRapportForceL2CAP"), 0))
    -[RPCompanionLinkClient setControlFlags:](v4, "setControlFlags:", (unint64_t)-[RPCompanionLinkClient controlFlags](v4, "controlFlags") | 0x100);
  v5 = -[RPCompanionLinkClient setDestinationDevice:](v4, "setDestinationDevice:", v3);
  if (v3)
    v5 = -[RPCompanionLinkClient setControlFlags:](v4, "setControlFlags:", (unint64_t)-[RPCompanionLinkClient controlFlags](v4, "controlFlags") | 0x8000000000000);
  v7 = handoff_log(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[SDActivityPayloadManager createRapportClientWithDestinationDevice:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s creating client: %@", (uint8_t *)&v10, 0x16u);
  }

  return v4;
}

- (void)sendActivityPayloadWithAdvertisementData:(id)a3 forAdvertisementPayload:(id)a4 activityIdentifier:(id)a5 activityPayload:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSMutableDictionary *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  NSUUID *v35;
  SDActivityPayloadReplyRecord *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  const __CFString *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  NSMutableDictionary *v47;
  void *v48;
  id v49;
  IDSService *activityService;
  unsigned __int8 v51;
  id v52;
  id v53;
  IDSService *v54;
  void *v55;
  unsigned int v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v61;
  NSMutableDictionary *v62;
  void *v63;
  id v64;
  void *v65;
  SDActivityPayloadManager *v66;
  void *v67;
  id v68;
  id v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t v75[128];
  uint8_t buf[4];
  _BYTE v77[24];

  v10 = a3;
  v11 = a4;
  v68 = a5;
  v12 = a6;
  v66 = self;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_activityService, "devices"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uniqueIDOverride"));

  v17 = handoff_log(v15, v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v56 = objc_msgSend(v12, "length");
    v57 = SFHexStringForData(v11);
    v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v77 = v56;
    *(_WORD *)&v77[4] = 2112;
    *(_QWORD *)&v77[6] = v68;
    *(_WORD *)&v77[14] = 2112;
    *(_QWORD *)&v77[16] = v58;
    _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Got payload to send of size %d with activityIdentifier:%@ for advertisementPayload:%@", buf, 0x1Cu);

  }
  v63 = v11;

  v19 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v10, CFSTR("rAdvData"));
  if (v12)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v12, CFSTR("rActPayload"));
  v64 = v12;
  v62 = v19;
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityPayloadManager protobufDataFromRequest:](v66, "protobufDataFromRequest:", v19, a2));
  v20 = objc_alloc_init((Class)NSMutableSet);
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](v66->_activityService, "devices"));
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v72;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(_QWORD *)v72 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)i);
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "nsuuid"));

        if (v27)
        {
          v31 = IDSCopyForDevice(v26);
          if (v31)
          {
            objc_msgSend(v20, "addObject:", v31);
          }
          else
          {
            v33 = handoff_log(0, v30);
            v34 = objc_claimAutoreleasedReturnValue(v33);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)v77 = v68;
              *(_WORD *)&v77[8] = 2112;
              *(_QWORD *)&v77[10] = v26;
              _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "Not sending %@ to device as we could not get deviceID: %@", buf, 0x16u);
            }

          }
        }
        else
        {
          v32 = handoff_log(v28, v29);
          v31 = objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)v77 = v68;
            *(_WORD *)&v77[8] = 2112;
            *(_QWORD *)&v77[10] = v26;
            _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "Not sending %@ to device as it has no nsuuid/BTUUID: %@", buf, 0x16u);
          }
        }

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
    }
    while (v23);
  }

  if (!v20)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", v61, v66, CFSTR("SDActivityPayloadManager.m"), 1149, CFSTR("Demo mode enabled, yet cannot find any destinations on service"));

  }
  v35 = objc_opt_new(NSUUID);
  v36 = objc_opt_new(SDActivityPayloadReplyRecord);
  -[SDActivityPayloadReplyRecord setMessageIdentifier:](v36, "setMessageIdentifier:", v35);
  -[SDActivityPayloadReplyRecord setRequestIdentifier:](v36, "setRequestIdentifier:", 0);
  -[SDActivityPayloadReplyRecord setActivityIdentifier:](v36, "setActivityIdentifier:", v68);
  -[SDActivityPayloadReplyRecord setDeviceIdentifier:](v36, "setDeviceIdentifier:", v67);
  v37 = -[NSMutableDictionary setObject:forKeyedSubscript:](v66->_messageIdentifierToReplyRecords, "setObject:forKeyedSubscript:", v36, v35);
  v39 = handoff_log(v37, v38);
  v40 = objc_claimAutoreleasedReturnValue(v39);
  v41 = v64;
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    v42 = CFSTR("final ");
    if (!v64)
      v42 = &stru_10072FE60;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v77 = v42;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Sending Handoff %@advertisement", buf, 0xCu);
  }

  v45 = handoff_log(v43, v44);
  v46 = objc_claimAutoreleasedReturnValue(v45);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    sub_1001243A0();

  v47 = objc_opt_new(NSMutableDictionary);
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityPayloadManager dataFromUUID:](v66, "dataFromUUID:", v35));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v47, "setObject:forKeyedSubscript:", v48, IDSSendMessageOptionUUIDKey);

  -[NSMutableDictionary setObject:forKeyedSubscript:](v47, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, IDSSendMessageOptionActivityContinuationKey);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v47, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, IDSSendMessageOptionLocalDeliveryKey);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v47, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, IDSSendMessageOptionEnforceRemoteTimeoutsKey);
  if (!v64)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v47, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, IDSSendMessageOptionNonWakingKey);
  v49 = objc_msgSend(objc_alloc((Class)IDSProtobuf), "initWithProtobufData:type:isResponse:", v65, 3, 0);
  activityService = v66->_activityService;
  v69 = 0;
  v70 = 0;
  v51 = -[IDSService sendProtobuf:toDestinations:priority:options:identifier:error:](activityService, "sendProtobuf:toDestinations:priority:options:identifier:error:", v49, v20, 300, v47, &v70, &v69);
  v52 = v70;
  v53 = v69;
  if ((v51 & 1) == 0)
  {
    v54 = v66->_activityService;
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v35, "UUIDString"));
    -[SDActivityPayloadManager service:account:identifier:didSendWithSuccess:error:](v66, "service:account:identifier:didSendWithSuccess:error:", v54, 0, v55, 0, v53);

    v41 = v64;
  }

}

- (void)handleNewAdvertisementWithpayloadRequestProtobuf:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SDActivityScanner *scanner;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  SDActivityPayloadManager *v23;
  id v24;
  id v25;

  v10 = a6;
  v11 = a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "data"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityPayloadManager requestFromProtobufData:](self, "requestFromProtobufData:", v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "deviceForFromID:", v10));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uniqueIDOverride"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("rAdvData")));
  scanner = self->_scanner;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001232B4;
  v21[3] = &unk_100718028;
  v22 = v13;
  v23 = self;
  v24 = v15;
  v25 = v14;
  v18 = v14;
  v19 = v15;
  v20 = v13;
  -[SDActivityScanner handleNewAdvertisementDevice:data:receivedViaScanning:withSuccessHandler:](scanner, "handleNewAdvertisementDevice:data:receivedViaScanning:withSuccessHandler:", v18, v16, 0, v21);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedActivityPayloadsForDemo, 0);
  objc_storeStrong((id *)&self->_tempDeviceScanTimer, 0);
  objc_storeStrong((id *)&self->_messageIdentifierToRequestRecords, 0);
  objc_storeStrong((id *)&self->_messageIdentifierToReplyRecords, 0);
  objc_storeStrong((id *)&self->_messageIdentifierToKeyRequestRecords, 0);
  objc_storeStrong((id *)&self->_uniqueIDToKeyReplyDate, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_scanner, 0);
  objc_storeStrong((id *)&self->_advertiser, 0);
  objc_storeStrong((id *)&self->_rapportDiscoveryClient, 0);
  objc_storeStrong((id *)&self->_encryptionService, 0);
  objc_storeStrong((id *)&self->_activityService, 0);
}

@end
