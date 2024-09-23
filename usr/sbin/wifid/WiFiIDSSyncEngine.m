@implementation WiFiIDSSyncEngine

- (void)initializeWithWiFiManager:(__WiFiManager *)a3 queue:(id)a4
{
  void *v7;
  void *v8;
  NSObject *global_queue;
  OS_dispatch_source *v10;
  _QWORD block[5];

  v7 = objc_autoreleasePoolPush();
  v8 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s", "-[WiFiIDSSyncEngine initializeWithWiFiManager:queue:]");
  objc_autoreleasePoolPop(v8);
  -[WiFiIDSSyncEngine setConnectionState:](self, "setConnectionState:", 0);
  -[WiFiIDSSyncEngine setManager:](self, "setManager:", a3);
  -[WiFiIDSSyncEngine setManagerQueue:](self, "setManagerQueue:", a4);
  -[WiFiIDSSyncEngine setIsWaitingForIdsMessageDelivery:](self, "setIsWaitingForIdsMessageDelivery:", 1);
  -[WiFiIDSSyncEngine setUpIDS](self, "setUpIDS");
  -[WiFiIDSSyncEngine setRole:](self, "setRole:", 1);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016F948;
  block[3] = &unk_10022EEE8;
  block[4] = self;
  dispatch_async(global_queue, block);
  -[WiFiIDSSyncEngine registerForInitialSyncTrigger](self, "registerForInitialSyncTrigger");
  -[WiFiIDSSyncEngine registerForSoftwareUpdateTrigger](self, "registerForSoftwareUpdateTrigger");
  -[WiFiIDSSyncEngine subscribeToKeychainChanges](self, "subscribeToKeychainChanges");
  v10 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)a4);
  self->_timer = v10;
  if (v10)
  {
    dispatch_set_context((dispatch_object_t)v10, self);
    dispatch_source_set_event_handler_f((dispatch_source_t)self->_timer, (dispatch_function_t)sub_10016FA1C);
    dispatch_activate((dispatch_object_t)self->_timer);
  }
  self->_knownNetworkStartPoint = 0;
  -[WiFiIDSSyncEngine setReceivedKnownNetworks:](self, "setReceivedKnownNetworks:", 0);
  objc_autoreleasePoolPop(v7);
}

- (void)dealloc
{
  NSObject *serialIdsDispatchQ;
  NSObject *timer;
  objc_super v5;

  serialIdsDispatchQ = self->_serialIdsDispatchQ;
  if (serialIdsDispatchQ)
    dispatch_release(serialIdsDispatchQ);

  -[WiFiIDSSyncEngine releaseKnownNetworkGuessingDictionary](self, "releaseKnownNetworkGuessingDictionary");
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    dispatch_release((dispatch_object_t)self->_timer);
    self->_timer = 0;
  }

  v5.receiver = self;
  v5.super_class = (Class)WiFiIDSSyncEngine;
  -[WiFiIDSSyncEngine dealloc](&v5, "dealloc");
}

- (void)setUpIDS
{
  void *v3;
  void *v4;
  const char *v5;
  NSObject *v6;
  OS_dispatch_queue *v7;
  void *v8;

  v3 = objc_autoreleasePoolPush();
  v4 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s", "-[WiFiIDSSyncEngine setUpIDS]");
  objc_autoreleasePoolPop(v4);
  v5 = off_10026D1D0;
  v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v7 = (OS_dispatch_queue *)dispatch_queue_create(v5, v6);
  self->_serialIdsDispatchQ = v7;
  if (v7)
  {
    self->_idsService = (IDSService *)objc_msgSend(objc_alloc((Class)IDSService), "initWithService:", CFSTR("com.apple.private.alloy.wifi.networksync"));
    -[IDSService addDelegate:queue:](-[WiFiIDSSyncEngine idsService](self, "idsService"), "addDelegate:queue:", self, -[WiFiIDSSyncEngine serialIdsDispatchQ](self, "serialIdsDispatchQ"));
  }
  else
  {
    v8 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: failed to create serialIdsDispatchQ", "-[WiFiIDSSyncEngine setUpIDS]");
    objc_autoreleasePoolPop(v8);
  }
  objc_autoreleasePoolPop(v3);
}

+ (id)getStringForDataType:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return CFSTR("unknown");
  else
    return off_100233650[a3];
}

- (void)registerForInitialSyncTrigger
{
  void *v3;
  void *v4;
  _QWORD handler[5];
  int v6;
  int out_token;

  v3 = objc_autoreleasePoolPush();
  v4 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s", "-[WiFiIDSSyncEngine registerForInitialSyncTrigger]");
  objc_autoreleasePoolPop(v4);
  out_token = 0;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10016FEB4;
  handler[3] = &unk_1002335E0;
  v6 = 0;
  handler[4] = self;
  notify_register_dispatch("com.apple.nanoregistry.devicedidpair", &out_token, (dispatch_queue_t)-[WiFiIDSSyncEngine serialIdsDispatchQ](self, "serialIdsDispatchQ"), handler);
  objc_autoreleasePoolPop(v3);
}

- (void)registerForSoftwareUpdateTrigger
{
  void *v3;
  _QWORD block[5];

  v3 = objc_autoreleasePoolPush();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016FFE0;
  block[3] = &unk_10022EEE8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)qword_10026DD40, block);
  objc_autoreleasePoolPop(v3);
}

- (void)enteredCompatibilityState:(id)a3
{
  void *v5;
  id v6;

  v5 = objc_autoreleasePoolPush();
  v6 = objc_msgSend(a3, "userInfo");
  -[WiFiIDSSyncEngine checkIfSoftwareUpdateStateEntered:](self, "checkIfSoftwareUpdateStateEntered:", (unsigned __int16)objc_msgSend(objc_msgSend(v6, "objectForKey:", NRPairedDeviceRegistryCompatibilityStateKey), "integerValue"));
  objc_autoreleasePoolPop(v5);
}

- (void)checkIfSoftwareUpdateStateEntered:(unsigned __int16)a3
{
  unsigned int v3;
  void *v5;
  void *v6;
  NSNotificationCenter *v7;
  _QWORD block[5];

  v3 = a3;
  v5 = objc_autoreleasePoolPush();
  v6 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Entered NR Compatibility State %d", "-[WiFiIDSSyncEngine checkIfSoftwareUpdateStateEntered:]", v3);
  objc_autoreleasePoolPop(v6);
  if (v3 == 2)
  {
    v7 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter removeObserver:name:object:](v7, "removeObserver:name:object:", self, NRPairedDeviceRegistryDeviceDidEnterCompatibilityStateNotification, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100170188;
    block[3] = &unk_10022EEE8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)-[WiFiIDSSyncEngine managerQueue](self, "managerQueue"), block);
  }
  objc_autoreleasePoolPop(v5);
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  OS_dispatch_queue *v18;
  _QWORD *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *context;
  _QWORD v26[6];
  _QWORD block[6];
  _QWORD v28[6];
  _QWORD v29[7];

  context = objc_autoreleasePoolPush();
  v9 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: rxd ids data from ID %@", "-[WiFiIDSSyncEngine service:account:incomingData:fromID:context:]", a6);
  objc_autoreleasePoolPop(v9);
  v10 = objc_opt_class(NSDictionary);
  v11 = objc_opt_class(NSArray);
  v12 = objc_opt_class(NSNumber);
  v13 = objc_opt_class(NSDate);
  v14 = objc_opt_class(NSString);
  v15 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, v11, v12, v13, v14, objc_opt_class(NSData), 0), a5, 0);
  if (v15)
  {
    v16 = v15;
    v17 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
    {
      v18 = -[WiFiIDSSyncEngine managerQueue](self, "managerQueue");
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_100170498;
      v29[3] = &unk_10022EB70;
      v29[4] = self;
      v29[5] = v16;
      v19 = v29;
LABEL_15:
      dispatch_sync((dispatch_queue_t)v18, v19);
      goto LABEL_16;
    }
    v20 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v16, v20) & 1) != 0)
    {
      v21 = objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("V2"));
      v18 = -[WiFiIDSSyncEngine managerQueue](self, "managerQueue");
      if (v21)
      {
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_1001704A4;
        v28[3] = &unk_10022EB70;
        v28[4] = self;
        v28[5] = v16;
        v19 = v28;
      }
      else
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1001704D4;
        block[3] = &unk_10022EB70;
        block[4] = self;
        block[5] = v16;
        v19 = block;
      }
      goto LABEL_15;
    }
    v22 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v16, v22) & 1) != 0)
    {
      v18 = -[WiFiIDSSyncEngine managerQueue](self, "managerQueue");
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1001704E0;
      v26[3] = &unk_10022EB70;
      v26[4] = self;
      v26[5] = v16;
      v19 = v26;
      goto LABEL_15;
    }
    v23 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: unknown message type.", "-[WiFiIDSSyncEngine service:account:incomingData:fromID:context:]");
  }
  else
  {
    v23 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: null incoming data.", "-[WiFiIDSSyncEngine service:account:incomingData:fromID:context:]");
  }
  objc_autoreleasePoolPop(v23);
LABEL_16:
  objc_autoreleasePoolPop(context);
}

- (void)sendToGizmoOfDataType:(int64_t)a3
{
  void *v5;
  NSDictionary *v6;
  void *v7;
  NSData *v8;
  NSData *v9;
  dispatch_time_t v10;
  unsigned int v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD block[6];
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[3];
  _QWORD v23[3];

  v5 = objc_autoreleasePoolPush();
  v20 = 0;
  v21 = 0;
  v22[0] = IDSSendMessageOptionEncryptPayloadKey;
  v22[1] = IDSSendMessageOptionWantsClientAcknowledgementKey;
  v23[0] = &__kCFBooleanTrue;
  v23[1] = &__kCFBooleanTrue;
  v22[2] = IDSSendMessageOptionEnforceRemoteTimeoutsKey;
  v23[2] = &__kCFBooleanFalse;
  v6 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v7 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: ID:%@, data type <%@>", "-[WiFiIDSSyncEngine sendToGizmoOfDataType:]", -[WiFiIDSSyncEngine pairedDeviceDestinationID](self, "pairedDeviceDestinationID"), +[WiFiIDSSyncEngine getStringForDataType:](WiFiIDSSyncEngine, "getStringForDataType:", a3));
  objc_autoreleasePoolPop(v7);
  if (-[WiFiIDSSyncEngine pairedDeviceDestinationID](self, "pairedDeviceDestinationID"))
  {
    if (a3)
    {
      if (a3 == 1)
      {
        if (!-[WiFiIDSSyncEngine lastSyncedCompanionAssistedAutoJoinData](self, "lastSyncedCompanionAssistedAutoJoinData"))goto LABEL_23;
        v8 = -[WiFiIDSSyncEngine lastSyncedCompanionAssistedAutoJoinData](self, "lastSyncedCompanionAssistedAutoJoinData");
      }
      else
      {
        if (a3 != 2)
        {
          if (a3 == 3
            && -[WiFiIDSSyncEngine lastSyncedKnownNetworkPayloadData](self, "lastSyncedKnownNetworkPayloadData"))
          {
            v8 = -[WiFiIDSSyncEngine lastSyncedKnownNetworkPayloadData](self, "lastSyncedKnownNetworkPayloadData");
            goto LABEL_16;
          }
LABEL_23:
          v12 = objc_autoreleasePoolPush();
          if (qword_10026DD20)
            objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "there is no data of type <%@> to send...", +[WiFiIDSSyncEngine getStringForDataType:](WiFiIDSSyncEngine, "getStringForDataType:", a3), v15, v16, v17, v18);
          goto LABEL_31;
        }
        if (!-[WiFiIDSSyncEngine lastSyncedCompanionLocaleData](self, "lastSyncedCompanionLocaleData"))
          goto LABEL_23;
        v8 = -[WiFiIDSSyncEngine lastSyncedCompanionLocaleData](self, "lastSyncedCompanionLocaleData");
      }
    }
    else
    {
      if (!-[WiFiIDSSyncEngine lastSyncedKnownNetworksData](self, "lastSyncedKnownNetworksData"))
        goto LABEL_23;
      v8 = -[WiFiIDSSyncEngine lastSyncedKnownNetworksData](self, "lastSyncedKnownNetworksData");
    }
LABEL_16:
    v9 = v8;
    -[WiFiIDSSyncEngine setIsWaitingForIdsMessageDelivery:](self, "setIsWaitingForIdsMessageDelivery:", 1);
    if ((-[WiFiIDSSyncEngine reSendIdsMessageBitMap](self, "reSendIdsMessageBitMap") & (1 << a3)) == 0)
    {
      v10 = dispatch_time(0, 600000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100170884;
      block[3] = &unk_1002306C8;
      block[4] = self;
      block[5] = a3;
      dispatch_after(v10, (dispatch_queue_t)-[WiFiIDSSyncEngine serialIdsDispatchQ](self, "serialIdsDispatchQ"), block);
    }
    v11 = -[IDSService sendData:toDestinations:priority:options:identifier:error:](-[WiFiIDSSyncEngine idsService](self, "idsService"), "sendData:toDestinations:priority:options:identifier:error:", v9, +[NSSet setWithObject:](NSSet, "setWithObject:", -[WiFiIDSSyncEngine pairedDeviceDestinationID](self, "pairedDeviceDestinationID")), 200, v6, &v20, &v21);
    if (a3)
    {
      if (a3 == 1)
      {
        -[WiFiIDSSyncEngine setLastSyncedCompanionAssistedAutoJoinDataGUID:](self, "setLastSyncedCompanionAssistedAutoJoinDataGUID:", v20);
        if (!v11)
          goto LABEL_29;
        goto LABEL_28;
      }
      if (a3 != 2)
      {
        -[WiFiIDSSyncEngine setLastSyncedKnownNetworkPayloadDataGUID:](self, "setLastSyncedKnownNetworkPayloadDataGUID:", v20);
        if (!v11)
          goto LABEL_29;
LABEL_28:
        -[WiFiIDSSyncEngine setIsWaitingForIdsSendResponse:](self, "setIsWaitingForIdsSendResponse:", 1);
        goto LABEL_29;
      }
      -[WiFiIDSSyncEngine setLastSyncedCompanionLocaleGUID:](self, "setLastSyncedCompanionLocaleGUID:", v20);
      if (v11)
        goto LABEL_28;
    }
    else
    {
      -[WiFiIDSSyncEngine setLastSyncedKnownNetworksDataGUID:](self, "setLastSyncedKnownNetworksDataGUID:", v20);
      if (v11)
        goto LABEL_28;
    }
LABEL_29:
    v12 = objc_autoreleasePoolPush();
    v13 = (void *)qword_10026DD20;
    if (qword_10026DD20)
    {
      v14 = +[WiFiIDSSyncEngine getStringForDataType:](WiFiIDSSyncEngine, "getStringForDataType:", a3);
      objc_msgSend(v13, "WFLog:message:", 3, "%s: dataType <%@>, success %d, guid %@, error %@ ", "-[WiFiIDSSyncEngine sendToGizmoOfDataType:]", v14, v11, v20, v21);
    }
LABEL_31:
    objc_autoreleasePoolPop(v12);
  }
  objc_autoreleasePoolPop(v5);
}

- (void)reSendIdsMessage:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;

  v5 = objc_autoreleasePoolPush();
  v6 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: reSendIdsMessageBitMap 0x%lx, isWaitingForIdsMessageDelivery %d, data type <%@>", "-[WiFiIDSSyncEngine reSendIdsMessage:]", -[WiFiIDSSyncEngine reSendIdsMessageBitMap](self, "reSendIdsMessageBitMap"), -[WiFiIDSSyncEngine isWaitingForIdsMessageDelivery](self, "isWaitingForIdsMessageDelivery"), +[WiFiIDSSyncEngine getStringForDataType:](WiFiIDSSyncEngine, "getStringForDataType:", a3));
  objc_autoreleasePoolPop(v6);
  v7 = 1 << a3;
  if ((-[WiFiIDSSyncEngine reSendIdsMessageBitMap](self, "reSendIdsMessageBitMap") & v7) == 0
    && -[WiFiIDSSyncEngine isWaitingForIdsMessageDelivery](self, "isWaitingForIdsMessageDelivery"))
  {
    -[WiFiIDSSyncEngine sendToGizmoOfDataType:](self, "sendToGizmoOfDataType:", a3);
    -[WiFiIDSSyncEngine setReSendIdsMessageBitMap:](self, "setReSendIdsMessageBitMap:", -[WiFiIDSSyncEngine reSendIdsMessageBitMap](self, "reSendIdsMessageBitMap") | v7);
  }
  objc_autoreleasePoolPop(v5);
}

- (id)copyPairedDestinationID
{
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = objc_autoreleasePoolPush();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = -[IDSService devices](-[WiFiIDSSyncEngine idsService](self, "idsService"), "devices");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "isDefaultPairedDevice"))
        {
          v10 = (void *)IDSCopyIDForDevice(v9);
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:
  v11 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: devices# %lu, destinationID %@", "-[WiFiIDSSyncEngine copyPairedDestinationID]", objc_msgSend(-[IDSService devices](-[WiFiIDSSyncEngine idsService](self, "idsService"), "devices"), "count"), v10);
  objc_autoreleasePoolPop(v11);
  objc_autoreleasePoolPop(v3);
  return v10;
}

- (id)getPairedVersionID
{
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = objc_autoreleasePoolPush();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = -[IDSService devices](-[WiFiIDSSyncEngine idsService](self, "idsService"), "devices");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "isDefaultPairedDevice"))
        {
          v10 = objc_msgSend(v9, "productVersion");
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:
  v11 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: paired device version ID %@", "-[WiFiIDSSyncEngine getPairedVersionID]", v10);
  objc_autoreleasePoolPop(v11);
  objc_autoreleasePoolPop(v3);
  return v10;
}

- (void)updateConnectionState:(id)a3 waitUntilDone:(unsigned __int8)a4
{
  int v4;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  const __CFString *v11;
  void *i;
  uint64_t v13;
  unsigned int v14;
  void *v15;
  void *v16;
  unsigned int v17;
  const __CFString *v18;
  OS_dispatch_queue *v19;
  _QWORD v20[5];
  _QWORD block[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v4 = a4;
  v7 = objc_autoreleasePoolPush();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    v11 = CFSTR("Connected");
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(a3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i), "isNearby") & 1) != 0)
        {
          v13 = 2;
          goto LABEL_12;
        }
      }
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v9)
        continue;
      break;
    }
    v13 = 1;
    v11 = CFSTR("Not Connected");
  }
  else
  {
    v13 = 1;
    v11 = CFSTR("Not Connected");
  }
LABEL_12:
  v14 = -[WiFiIDSSyncEngine connectionState](self, "connectionState");
  v15 = objc_autoreleasePoolPush();
  v16 = (void *)qword_10026DD20;
  if ((_DWORD)v13 == v14)
  {
    if (qword_10026DD20)
    {
      v17 = -[WiFiIDSSyncEngine connectionState](self, "connectionState");
      v18 = CFSTR("Unknown");
      if (v17 == 2)
        v18 = CFSTR("Connected");
      if (v17 == 1)
        v18 = CFSTR("Not Connected");
      objc_msgSend(v16, "WFLog:message:", 3, "%s: no change to connection state (is %@)", "-[WiFiIDSSyncEngine updateConnectionState:waitUntilDone:]", v18);
    }
    objc_autoreleasePoolPop(v15);
  }
  else
  {
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: connection state changed (is %@)", "-[WiFiIDSSyncEngine updateConnectionState:waitUntilDone:]", v11);
    objc_autoreleasePoolPop(v15);
    -[WiFiIDSSyncEngine setConnectionState:](self, "setConnectionState:", v13);
    v19 = -[WiFiIDSSyncEngine managerQueue](self, "managerQueue");
    if (v4)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100170EDC;
      block[3] = &unk_10022EEE8;
      block[4] = self;
      dispatch_sync((dispatch_queue_t)v19, block);
    }
    else
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100170EE4;
      v20[3] = &unk_10022EEE8;
      v20[4] = self;
      dispatch_async((dispatch_queue_t)v19, v20);
    }
  }
  objc_autoreleasePoolPop(v7);
}

- (void)updatePairedDeviceID:(id)a3 versionID:(id)a4
{
  void *v7;
  void *v8;
  void *v9;

  v7 = objc_autoreleasePoolPush();
  v8 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: isWaitingForIdsMessageDelivery %d, isWaitingForIdsSendResponse %d, pairedDeviceDestinationID prev %@, new %@, pairedDeviceVersionID prev %@, new %@", "-[WiFiIDSSyncEngine updatePairedDeviceID:versionID:]", -[WiFiIDSSyncEngine isWaitingForIdsMessageDelivery](self, "isWaitingForIdsMessageDelivery"), -[WiFiIDSSyncEngine isWaitingForIdsSendResponse](self, "isWaitingForIdsSendResponse"), -[WiFiIDSSyncEngine pairedDeviceDestinationID](self, "pairedDeviceDestinationID"), a3, -[WiFiIDSSyncEngine pairedDeviceVersionID](self, "pairedDeviceVersionID"), a4);
  objc_autoreleasePoolPop(v8);
  -[WiFiIDSSyncEngine setPairedDeviceDestinationID:](self, "setPairedDeviceDestinationID:", a3);
  -[WiFiIDSSyncEngine setPairedDeviceVersionID:](self, "setPairedDeviceVersionID:", a4);
  if (-[WiFiIDSSyncEngine isWaitingForIdsMessageDelivery](self, "isWaitingForIdsMessageDelivery")
    && !-[WiFiIDSSyncEngine isWaitingForIdsSendResponse](self, "isWaitingForIdsSendResponse"))
  {
    if (-[WiFiIDSSyncEngine lastSyncedKnownNetworksData](self, "lastSyncedKnownNetworksData"))
    {
      -[WiFiIDSSyncEngine sendToGizmoOfDataType:](self, "sendToGizmoOfDataType:", 0);
    }
    else
    {
      v9 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: there is no previous data blob for known networks", "-[WiFiIDSSyncEngine updatePairedDeviceID:versionID:]");
      objc_autoreleasePoolPop(v9);
      -[WiFiIDSSyncEngine knownNetworksListChanged](self, "knownNetworksListChanged");
    }
    -[WiFiIDSSyncEngine sendToGizmoOfDataType:](self, "sendToGizmoOfDataType:", 1);
    -[WiFiIDSSyncEngine sendToGizmoOfDataType:](self, "sendToGizmoOfDataType:", 2);
  }
  objc_autoreleasePoolPop(v7);
}

- (void)pairedDeviceConnectionChanged:(id)a3
{
  void *v5;
  int64_t v6;
  void *v7;
  id v8;
  id v9;
  _QWORD block[7];

  v5 = objc_autoreleasePoolPush();
  v6 = -[WiFiIDSSyncEngine role](self, "role");
  if (a3 && v6 && objc_msgSend(a3, "count"))
  {
    v7 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s", "-[WiFiIDSSyncEngine pairedDeviceConnectionChanged:]");
    objc_autoreleasePoolPop(v7);
    v8 = -[WiFiIDSSyncEngine copyPairedDestinationID](self, "copyPairedDestinationID");
    v9 = -[WiFiIDSSyncEngine getPairedVersionID](self, "getPairedVersionID");
    if (v8)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10017115C;
      block[3] = &unk_100232518;
      block[4] = self;
      block[5] = v8;
      block[6] = v9;
      dispatch_sync((dispatch_queue_t)-[WiFiIDSSyncEngine managerQueue](self, "managerQueue"), block);

    }
  }
  objc_autoreleasePoolPop(v5);
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  unsigned int v13;
  const __CFString *v14;
  _QWORD block[5];

  v6 = objc_autoreleasePoolPush();
  v7 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: #devices %lu", "-[WiFiIDSSyncEngine service:nearbyDevicesChanged:]", objc_msgSend(a4, "count"));
  objc_autoreleasePoolPop(v7);
  if (a4 && objc_msgSend(a4, "count"))
  {
    v8 = 2;
    v9 = CFSTR("Connected");
  }
  else
  {
    v8 = 1;
    v9 = CFSTR("Not Connected");
  }
  v10 = -[WiFiIDSSyncEngine connectionState](self, "connectionState");
  v11 = objc_autoreleasePoolPush();
  v12 = (void *)qword_10026DD20;
  if ((_DWORD)v8 == v10)
  {
    if (qword_10026DD20)
    {
      v13 = -[WiFiIDSSyncEngine connectionState](self, "connectionState");
      v14 = CFSTR("Unknown");
      if (v13 == 2)
        v14 = CFSTR("Connected");
      if (v13 == 1)
        v14 = CFSTR("Not Connected");
      objc_msgSend(v12, "WFLog:message:", 3, "%s: no change to connection state (is %@)", "-[WiFiIDSSyncEngine service:nearbyDevicesChanged:]", v14);
    }
    objc_autoreleasePoolPop(v11);
  }
  else
  {
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: connection state changed (is %@)", "-[WiFiIDSSyncEngine service:nearbyDevicesChanged:]", v9);
    objc_autoreleasePoolPop(v11);
    -[WiFiIDSSyncEngine setConnectionState:](self, "setConnectionState:", v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100171334;
    block[3] = &unk_10022EEE8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)-[WiFiIDSSyncEngine managerQueue](self, "managerQueue"), block);
  }
  -[WiFiIDSSyncEngine pairedDeviceConnectionChanged:](self, "pairedDeviceConnectionChanged:", a4);
  objc_autoreleasePoolPop(v6);
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  void *v6;
  void *v7;

  v6 = objc_autoreleasePoolPush();
  v7 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: #devices %lu", "-[WiFiIDSSyncEngine service:devicesChanged:]", objc_msgSend(a4, "count"));
  objc_autoreleasePoolPop(v7);
  -[WiFiIDSSyncEngine pairedDeviceConnectionChanged:](self, "pairedDeviceConnectionChanged:", a4);
  objc_autoreleasePoolPop(v6);
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  void *v6;
  void *v7;

  v6 = objc_autoreleasePoolPush();
  v7 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: devices %lu", "-[WiFiIDSSyncEngine service:connectedDevicesChanged:]", objc_msgSend(a4, "count"));
  objc_autoreleasePoolPop(v7);
  -[WiFiIDSSyncEngine pairedDeviceConnectionChanged:](self, "pairedDeviceConnectionChanged:", a4);
  objc_autoreleasePoolPop(v6);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  _BOOL4 v8;
  void *v11;
  unsigned int v12;
  int v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  dispatch_time_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  _QWORD block[5];
  _QWORD v27[7];

  v8 = a6;
  v11 = objc_autoreleasePoolPush();
  -[WiFiIDSSyncEngine setIsWaitingForIdsSendResponse:](self, "setIsWaitingForIdsSendResponse:", 0);
  v12 = -[NSString isEqualToString:](-[WiFiIDSSyncEngine lastSyncedKnownNetworksDataGUID](self, "lastSyncedKnownNetworksDataGUID"), "isEqualToString:", a5);
  if ((v12 & 1) != 0)
  {
    v24 = 0;
    v13 = 0;
    v14 = 0;
    v25 = 0;
  }
  else
  {
    if (-[NSString isEqualToString:](-[WiFiIDSSyncEngine lastSyncedKnownNetworkPayloadDataGUID](self, "lastSyncedKnownNetworkPayloadDataGUID"), "isEqualToString:", a5))
    {
      v13 = 0;
      v14 = 0;
      v24 = 1;
      v15 = 3;
    }
    else if (-[NSString isEqualToString:](-[WiFiIDSSyncEngine lastSyncedCompanionAssistedAutoJoinDataGUID](self, "lastSyncedCompanionAssistedAutoJoinDataGUID"), "isEqualToString:", a5))
    {
      v24 = 0;
      v14 = 0;
      v13 = 1;
      v15 = 1;
    }
    else
    {
      if (!-[NSString isEqualToString:](-[WiFiIDSSyncEngine lastSyncedCompanionLocaleGUID](self, "lastSyncedCompanionLocaleGUID"), "isEqualToString:", a5))
      {
        v21 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: Unrecogonized ID... success %d, error %@, id %@, KNs guid %@, AJA guid %@", "-[WiFiIDSSyncEngine service:account:identifier:didSendWithSuccess:error:]", v8, a7, a5, -[WiFiIDSSyncEngine lastSyncedKnownNetworksDataGUID](self, "lastSyncedKnownNetworksDataGUID"), -[WiFiIDSSyncEngine lastSyncedCompanionAssistedAutoJoinDataGUID](self, "lastSyncedCompanionAssistedAutoJoinDataGUID"));
        goto LABEL_38;
      }
      v24 = 0;
      v13 = 0;
      v14 = 1;
      v15 = 2;
    }
    v25 = v15;
  }
  v16 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: %d, error %@, idsSendFailureCount %lu, data type <%@>", "-[WiFiIDSSyncEngine service:account:identifier:didSendWithSuccess:error:]", v8, a7, -[WiFiIDSSyncEngine idsSendFailureCount](self, "idsSendFailureCount"), +[WiFiIDSSyncEngine getStringForDataType:](WiFiIDSSyncEngine, "getStringForDataType:", v25));
  objc_autoreleasePoolPop(v16);
  if (v8)
  {
    if (v12)
      -[WiFiIDSSyncEngine setLastSyncedKnownNetworksData:](self, "setLastSyncedKnownNetworksData:", 0);
    if (v24)
    {
      -[WiFiIDSSyncEngine setLastSyncedKnownNetworkPayloadData:](self, "setLastSyncedKnownNetworkPayloadData:", 0);
      if (!v13)
        goto LABEL_17;
    }
    else if (!v13)
    {
LABEL_17:
      if (!v14)
        goto LABEL_19;
      goto LABEL_18;
    }
    -[WiFiIDSSyncEngine setLastSyncedCompanionAssistedAutoJoinData:](self, "setLastSyncedCompanionAssistedAutoJoinData:", 0);
    if (!v14)
    {
LABEL_19:
      if (!-[WiFiIDSSyncEngine lastSyncedCompanionAssistedAutoJoinData](self, "lastSyncedCompanionAssistedAutoJoinData")&& !-[WiFiIDSSyncEngine lastSyncedKnownNetworksData](self, "lastSyncedKnownNetworksData")&& !-[WiFiIDSSyncEngine lastSyncedCompanionLocaleData](self, "lastSyncedCompanionLocaleData"))
      {
        -[WiFiIDSSyncEngine setIsWaitingForIdsMessageDelivery:](self, "setIsWaitingForIdsMessageDelivery:", 0);
      }
      -[WiFiIDSSyncEngine setIdsSendFailureCount:](self, "setIdsSendFailureCount:", 0);
      -[WiFiIDSSyncEngine setReSendIdsMessageBitMap:](self, "setReSendIdsMessageBitMap:", -[WiFiIDSSyncEngine reSendIdsMessageBitMap](self, "reSendIdsMessageBitMap") & ~(1 << v25));
      if (v12)
      {
        v17 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: known networks delivered, now resend companion assist", "-[WiFiIDSSyncEngine service:account:identifier:didSendWithSuccess:error:]");
        objc_autoreleasePoolPop(v17);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1001718D0;
        block[3] = &unk_10022EEE8;
        block[4] = self;
        dispatch_async((dispatch_queue_t)-[WiFiIDSSyncEngine managerQueue](self, "managerQueue"), block);
      }
      goto LABEL_36;
    }
LABEL_18:
    -[WiFiIDSSyncEngine setLastSyncedCompanionLocaleData:](self, "setLastSyncedCompanionLocaleData:", 0);
    goto LABEL_19;
  }
  if (-[WiFiIDSSyncEngine idsSendFailureCount](self, "idsSendFailureCount") > 4)
  {
LABEL_36:
    v21 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: failure count %ld, reSendIdsMessageBitMap 0x%lx, is waiting for delivery %d", "-[WiFiIDSSyncEngine service:account:identifier:didSendWithSuccess:error:]", -[WiFiIDSSyncEngine idsSendFailureCount](self, "idsSendFailureCount"), -[WiFiIDSSyncEngine reSendIdsMessageBitMap](self, "reSendIdsMessageBitMap"), -[WiFiIDSSyncEngine isWaitingForIdsMessageDelivery](self, "isWaitingForIdsMessageDelivery"), v22, v23);
LABEL_38:
    objc_autoreleasePoolPop(v21);
    goto LABEL_39;
  }
  -[WiFiIDSSyncEngine setIdsSendFailureCount:](self, "setIdsSendFailureCount:", (char *)-[WiFiIDSSyncEngine idsSendFailureCount](self, "idsSendFailureCount") + 1);
  if ((id)-[WiFiIDSSyncEngine idsSendFailureCount](self, "idsSendFailureCount") != (id)5)
  {
    v18 = objc_msgSend(a7, "code") == (id)27 ? 1 : v12;
    if ((v18 & 1) == 0)
    {
      v19 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: will retry ids send in 60secs...", "-[WiFiIDSSyncEngine service:account:identifier:didSendWithSuccess:error:]");
      objc_autoreleasePoolPop(v19);
      v20 = dispatch_time(0, 60000000000);
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_1001718C4;
      v27[3] = &unk_1002306C8;
      v27[4] = self;
      v27[5] = v25;
      dispatch_after(v20, (dispatch_queue_t)-[WiFiIDSSyncEngine serialIdsDispatchQ](self, "serialIdsDispatchQ"), v27);
      goto LABEL_36;
    }
  }
LABEL_39:
  objc_autoreleasePoolPop(v11);
}

- (BOOL)doesNetworkContainBssidForGuessing2GhzNetwork:(__WiFiNetwork *)a3
{
  void *v4;

  if (a3)
  {
    if (sub_10002BE64((uint64_t)a3, CFSTR("GUESSED_2ghzBSSID1")))
      return 1;
    v4 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null guessedBssid1", "-[WiFiIDSSyncEngine doesNetworkContainBssidForGuessing2GhzNetwork:]");
  }
  else
  {
    v4 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null network", "-[WiFiIDSSyncEngine doesNetworkContainBssidForGuessing2GhzNetwork:]");
  }
  objc_autoreleasePoolPop(v4);
  return 0;
}

- (int64_t)isRxdNetwork:(id)a3 equalToPlistNetwork:(__WiFiNetwork *)a4
{
  void *v7;
  void *v8;
  void *v9;
  int v10;
  __CFString *v11;
  uint64_t v12;
  int v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  int64_t v20;
  void *v22;

  v7 = objc_autoreleasePoolPush();
  if (!objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("SSID_STR")), "isEqualToString:", sub_10002B088(a4)))
  {
LABEL_24:
    v11 = 0;
    v9 = 0;
LABEL_26:
    v20 = 0;
    goto LABEL_20;
  }
  v8 = sub_100177254(a4, (uint64_t)-[WiFiIDSSyncEngine manager](self, "manager"));
  if (!v8)
  {
    v22 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null syncFormattedNetworkRecord", "-[WiFiIDSSyncEngine isRxdNetwork:equalToPlistNetwork:]");
    objc_autoreleasePoolPop(v22);
    goto LABEL_24;
  }
  v9 = v8;
  v10 = sub_100178BEC(v8);
  if (v10 != sub_100178BEC(a3))
  {
    v11 = 0;
    goto LABEL_26;
  }
  if (v10)
  {
    v11 = (__CFString *)sub_1000C37A0((CFDictionaryRef *)a4);
    if (-[__CFString isEqualToString:](v11, "isEqualToString:", objc_msgSend(a3, "objectForKey:", CFSTR("WiFiNetworkPasswordString"))))v12 = 0;
    else
      v12 = 2;
  }
  else
  {
    v11 = 0;
    v12 = 0;
  }
  v13 = sub_100031670(a4);
  if (v13 != objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("UserDirected")), "BOOLValue"))
    v12 |= 4uLL;
  v14 = (const __CFString *)objc_msgSend(a3, "objectForKey:", CFSTR("GUESSED_2ghzBSSID4"));
  if (v14)
  {
    v15 = v14;
    v16 = (const __CFString *)sub_10002BE64((uint64_t)a4, CFSTR("GUESSED_2ghzBSSID4"));
    if (v16)
    {
      v17 = v15;
      goto LABEL_17;
    }
LABEL_18:
    v12 |= 8uLL;
    goto LABEL_19;
  }
  v18 = (const __CFString *)objc_msgSend(a3, "objectForKey:", CFSTR("GUESSED_2ghzBSSID1"));
  if (!v18)
    goto LABEL_19;
  v19 = v18;
  v16 = (const __CFString *)sub_10002BE64((uint64_t)a4, CFSTR("GUESSED_2ghzBSSID1"));
  if (!v16)
    goto LABEL_18;
  v17 = v19;
LABEL_17:
  if (CFStringCompare(v16, v17, 1uLL))
    goto LABEL_18;
LABEL_19:
  v20 = v12 | 1;
LABEL_20:

  objc_autoreleasePoolPop(v7);
  return v20;
}

- (void)updateGuessedNetworkCredentials:(__WiFiNetwork *)a3 password:(__CFString *)a4
{
  const void *v5;
  void *v6;
  CFArrayRef v7;
  CFArrayRef v8;
  unint64_t i;
  id v10;
  const void *v11;
  const __CFNumber *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  int valuePtr;

  v19 = a4;
  if (a3)
  {
    v5 = sub_10002B088(a3);
    v6 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Received companion network <%@>", "-[WiFiIDSSyncEngine updateGuessedNetworkCredentials:password:]", v5, v19);
    objc_autoreleasePoolPop(v6);
    v7 = sub_100090DA4((uint64_t)-[WiFiIDSSyncEngine manager](self, "manager"));
    if (v7)
    {
      v8 = v7;
      for (i = 0; i < (unint64_t)-[__CFArray count](v8, "count"); ++i)
      {
        v10 = -[__CFArray objectAtIndex:](v8, "objectAtIndex:", i);
        if (v10)
        {
          v11 = v10;
          v12 = (const __CFNumber *)sub_10002BE64((uint64_t)v10, CFSTR("WiFiManagerKnownNetworksEventType"));
          valuePtr = 0;
          if (!v12 || (CFNumberGetValue(v12, kCFNumberIntType, &valuePtr), valuePtr == 5))
          {
            v13 = objc_autoreleasePoolPush();
            if (qword_10026DD20)
              objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Guessed network <%@>", "-[WiFiIDSSyncEngine updateGuessedNetworkCredentials:password:]", sub_10002B088(v11));
            objc_autoreleasePoolPop(v13);
            v14 = -[WiFiIDSSyncEngine getCorresponding5GhzSsidInPlistFor2GhzNetwork:](self, "getCorresponding5GhzSsidInPlistFor2GhzNetwork:", v11);
            if (v14)
            {
              v15 = v14;
              v16 = objc_autoreleasePoolPush();
              if (qword_10026DD20)
                objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Correspondng 5GHz network <%@>", "-[WiFiIDSSyncEngine updateGuessedNetworkCredentials:password:]", v15);
              objc_autoreleasePoolPop(v16);
              if (objc_msgSend(v15, "isEqualToString:", v5))
              {
                v17 = objc_autoreleasePoolPush();
                if (qword_10026DD20)
                  objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Networks matched, updating password for <%@>", "-[WiFiIDSSyncEngine updateGuessedNetworkCredentials:password:]", sub_10002B088(v11));
                objc_autoreleasePoolPop(v17);
                sub_1000C64F0(v11, v19);
              }
            }
          }
        }
      }
      CFRelease(v8);
    }
  }
  else
  {
    v18 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null network", "-[WiFiIDSSyncEngine updateGuessedNetworkCredentials:password:]");
    objc_autoreleasePoolPop(v18);
  }
}

- (__WiFiNetwork)_findMatchingPlistNetworkForNetworkRecord:(id)a3
{
  CFArrayRef v5;
  void *v6;
  uint64_t v7;
  __WiFiNetwork *v8;

  v5 = sub_100090DA4((uint64_t)-[WiFiIDSSyncEngine manager](self, "manager"));
  v6 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: %lu plist networks, %lu rxd networks", "-[WiFiIDSSyncEngine _findMatchingPlistNetworkForNetworkRecord:]", -[__CFArray count](v5, "count"), objc_msgSend(a3, "objectForKey:", CFSTR("SSID_STR")));
  objc_autoreleasePoolPop(v6);
  if (!-[__CFArray count](v5, "count"))
  {
LABEL_7:
    v8 = 0;
    if (!v5)
      return v8;
LABEL_8:
    CFRelease(v5);
    return v8;
  }
  v7 = 0;
  while (1)
  {
    v8 = (__WiFiNetwork *)-[__CFArray objectAtIndex:](v5, "objectAtIndex:", v7);
    if (-[WiFiIDSSyncEngine isRxdNetwork:equalToPlistNetwork:](self, "isRxdNetwork:equalToPlistNetwork:", a3, v8) >= 1)
      break;
    if (++v7 >= (unint64_t)-[__CFArray count](v5, "count"))
      goto LABEL_7;
  }
  CFRetain(v8);
  if (v5)
    goto LABEL_8;
  return v8;
}

- (void)processReceivedKnownNetwork:(id)a3
{
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  __WiFiNetwork *v15;
  const void *v16;
  const void *v17;
  void *v18;
  const __CFNumber *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _WORD *v28;
  _WORD *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _WORD *v34;
  unsigned int v35;
  unsigned int v36;
  void *v37;
  void *v38;
  const void *v39;
  void *contexta;
  const __CFString *context;
  unsigned int valuePtr;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];

  v5 = objc_autoreleasePoolPush();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v6 = objc_msgSend(a3, "allKeys");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v44 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
        v12 = objc_msgSend(a3, "objectForKey:", v11);
      }
      v13 = v12;
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v8);
  }
  else
  {
    v11 = 0;
    v13 = 0;
  }
  if (sub_1000A4BC4((uint64_t)-[WiFiIDSSyncEngine manager](self, "manager")))
  {
    v14 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: %@ operation", "-[WiFiIDSSyncEngine processReceivedKnownNetwork:]", v11);
    objc_autoreleasePoolPop(v14);
    if (objc_msgSend(v11, "isEqual:", CFSTR("REMOVE")))
    {
      v15 = -[WiFiIDSSyncEngine _findMatchingPlistNetworkForNetworkRecord:](self, "_findMatchingPlistNetworkForNetworkRecord:", v13);
      v16 = sub_10002B088(v15);
      if (v15)
      {
        v17 = v16;
        v18 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Network needs removing %@", "-[WiFiIDSSyncEngine processReceivedKnownNetwork:]", v17);
        objc_autoreleasePoolPop(v18);
        v19 = (const __CFNumber *)sub_10002BE64((uint64_t)v15, CFSTR("WiFiManagerKnownNetworksEventType"));
        valuePtr = 0;
        if (v19)
        {
          CFNumberGetValue(v19, kCFNumberIntType, &valuePtr);
          v20 = objc_autoreleasePoolPush();
          if (qword_10026DD20)
            objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "Reason for adding <%@> is %d: ", v17, valuePtr);
          objc_autoreleasePoolPop(v20);
          if ((valuePtr & 0xFFFFFFFB) != 1 && (!sub_1000C5378((uint64_t)v15) || !sub_1000CB480((uint64_t)v15)))
          {
            -[WiFiIDSSyncEngine removeFromKnownNetworkGuessingDictionaryTheNetwork:](self, "removeFromKnownNetworkGuessingDictionaryTheNetwork:", v15);
            sub_100098DBC((uint64_t)-[WiFiIDSSyncEngine manager](self, "manager"), v15, (const void *)0x15);
            if (!-[WiFiIDSSyncEngine getCorresponding5GhzSsidInPlistFor2GhzNetwork:](self, "getCorresponding5GhzSsidInPlistFor2GhzNetwork:", v15))-[WiFiIDSSyncEngine removeFromKnownNetworkGuessingDictionaryTheNetwork:](self, "removeFromKnownNetworkGuessingDictionaryTheNetwork:", v15);
            sub_100098DBC((uint64_t)-[WiFiIDSSyncEngine manager](self, "manager"), v15, (const void *)0x15);
          }
        }
      }
    }
    else
    {
      v15 = 0;
    }
    if ((objc_msgSend(v11, "isEqual:", CFSTR("ADD")) & 1) == 0
      && !objc_msgSend(v11, "isEqual:", CFSTR("UPDATE")))
    {
      goto LABEL_74;
    }
    v21 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", v13);
    v22 = objc_msgSend(v13, "objectForKey:", CFSTR("SSID_STR"));
    if (!v22)
    {
LABEL_72:
      if (v21)

LABEL_74:
      if (v15)
        CFRelease(v15);
      goto LABEL_76;
    }
    v23 = v22;
    v24 = (unint64_t)objc_msgSend(v21, "objectForKey:", CFSTR("IS_NETWORK_CAPTIVE"));
    if (!(v24 | (unint64_t)objc_msgSend(v21, "objectForKey:", CFSTR("IS_NETWORK_WHITELISTING_CAPTIVE"))))
    {
      v33 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: captive determination is not present for %@ , not adding network!!", "-[WiFiIDSSyncEngine processReceivedKnownNetwork:]", v23);
      objc_autoreleasePoolPop(v33);
      goto LABEL_72;
    }
    v25 = -[WiFiIDSSyncEngine isRxdNetwork:equalToPlistNetwork:](self, "isRxdNetwork:equalToPlistNetwork:", v13, v15);
    if (v25 < 1)
    {
      if (!sub_100178BEC(v13))
        goto LABEL_62;
      v29 = 0;
    }
    else
    {
      v26 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "rxd network <%@> exits in plist", v23);
      objc_autoreleasePoolPop(v26);
      if (v25 == 1)
        goto LABEL_72;
      v27 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: rxd network properties have changed(%d), update the network <%@>", "-[WiFiIDSSyncEngine processReceivedKnownNetwork:]", v25, v23);
      objc_autoreleasePoolPop(v27);
      -[WiFiIDSSyncEngine manager](self, "manager");
      v28 = sub_100177FD0(v13);
      if (!v28)
        goto LABEL_72;
      v29 = v28;
      if ((v25 & 8) != 0)
      {
        -[WiFiIDSSyncEngine removeFromKnownNetworkGuessingDictionaryTheNetwork:](self, "removeFromKnownNetworkGuessingDictionaryTheNetwork:", v15);
        -[WiFiIDSSyncEngine addToKnownNetworkGuessingDictionaryTheNetwork:](self, "addToKnownNetworkGuessingDictionaryTheNetwork:", v29);
      }
      if (!sub_1000C69C8((uint64_t)v15))
      {
        v30 = objc_autoreleasePoolPush();
        v31 = (void *)qword_10026DD20;
        if (qword_10026DD20)
        {
          contexta = v30;
          v39 = sub_10002B088(v15);
          objc_msgSend(v31, "WFLog:message:", 4, "%s: local network record for '%@' contains autojoin preference (%d)", "-[WiFiIDSSyncEngine processReceivedKnownNetwork:]", v39, sub_100007F24((uint64_t)v15));
          v30 = contexta;
        }
        objc_autoreleasePoolPop(v30);
        sub_10002C478((uint64_t)v29, CFSTR("enabled"), 0);
      }
      sub_100099EA4((uint64_t)-[WiFiIDSSyncEngine manager](self, "manager"), v29, 1u);
      sub_10002C478((uint64_t)v29, CFSTR("SyncedHomeProperties"), 0);
      if ((v25 & 2) == 0)
        goto LABEL_71;
      v32 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Password update required", "-[WiFiIDSSyncEngine processReceivedKnownNetwork:]");
      objc_autoreleasePoolPop(v32);
      if (!sub_100178BEC(v13))
      {
        CFRelease(v29);
LABEL_62:
        -[WiFiIDSSyncEngine manager](self, "manager");
        v29 = sub_100177FD0(v21);
        goto LABEL_63;
      }
    }
    context = (const __CFString *)objc_msgSend(v13, "objectForKey:", CFSTR("WiFiNetworkPasswordString"));
    if (!context)
      goto LABEL_66;
    objc_msgSend(v21, "removeObjectForKey:", CFSTR("WiFiNetworkPasswordString"));
    if (v29)
      CFRelease(v29);
    -[WiFiIDSSyncEngine manager](self, "manager");
    v34 = sub_100177FD0(v13);
    if (!v34)
      goto LABEL_72;
    v29 = v34;
    LOBYTE(valuePtr) = 0;
    v35 = sub_1000C6458(v34, context, (BOOL *)&valuePtr, 0.1);
    v36 = v35;
    if ((_BYTE)valuePtr || !v35)
    {
      v38 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiNetworkSetPasswordWithTimeout for <%@> has timeout = %d and result = %d", "-[WiFiIDSSyncEngine processReceivedKnownNetwork:]", v23, valuePtr, v36);
      objc_autoreleasePoolPop(v38);
      goto LABEL_71;
    }
    if (v25 >= 1)
    {
      -[WiFiIDSSyncEngine updateGuessedNetworkCredentials:password:](self, "updateGuessedNetworkCredentials:password:", v29, context);
      goto LABEL_71;
    }
LABEL_63:
    -[WiFiIDSSyncEngine addToKnownNetworkGuessingDictionaryTheNetwork:](self, "addToKnownNetworkGuessingDictionaryTheNetwork:", v29);
    sub_100172598(v21, v29);
    sub_1001785DC(v29, (uint64_t)-[WiFiIDSSyncEngine manager](self, "manager"));
    v37 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: ADDED <%@> to plist !!!", "-[WiFiIDSSyncEngine processReceivedKnownNetwork:]", v23);
    objc_autoreleasePoolPop(v37);
LABEL_66:
    if (!v29)
      goto LABEL_72;
LABEL_71:
    CFRelease(v29);
    goto LABEL_72;
  }
LABEL_76:
  objc_autoreleasePoolPop(v5);
}

- (void)processReceivedKnownNetworks:(id)a3
{
  NSObject *timer;
  dispatch_time_t v6;

  if (self->_knownNetworkList)
  {

    self->_latestReceivedNetworkRecords = (NSArray *)objc_msgSend(objc_alloc((Class)NSArray), "initWithArray:copyItems:", a3, 1);
  }
  else
  {
    self->_knownNetworkList = (NSArray *)objc_msgSend(objc_alloc((Class)NSArray), "initWithArray:copyItems:", a3, 1);
    timer = self->_timer;
    v6 = dispatch_time(0, 0);
    dispatch_source_set_timer(timer, v6, 0x12A05F200uLL, 0x77359400uLL);
  }
}

- (void)processReceivedKnownNetworksInBatch:(id)a3
{
  void *v5;
  CFArrayRef v6;
  void *v7;
  uint64_t v8;
  id v9;
  const __CFNumber *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  CFArrayRef v15;
  CFArrayRef v16;
  unint64_t v17;
  id v18;
  const __CFNumber *v19;
  void *v20;
  CFArrayRef v21;
  unint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  uint64_t v30;
  _WORD *v31;
  const __CFString *v32;
  const __CFString *v33;
  _WORD *v34;
  unsigned int v35;
  void *v36;
  void *v37;
  _WORD *v38;
  void *v39;
  unsigned int v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  int v46;
  BOOL v47;
  int v48;
  int valuePtr;

  v5 = objc_autoreleasePoolPush();
  if (sub_1000A4BC4((uint64_t)-[WiFiIDSSyncEngine manager](self, "manager")))
  {
    v45 = v5;
    v6 = sub_100090DA4((uint64_t)-[WiFiIDSSyncEngine manager](self, "manager"));
    v7 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: %lu plist networks, %lu rxd networks", "-[WiFiIDSSyncEngine processReceivedKnownNetworksInBatch:]", -[__CFArray count](v6, "count"), objc_msgSend(a3, "count"));
    objc_autoreleasePoolPop(v7);
    if (v6)
    {
      if (-[__CFArray count](v6, "count"))
      {
        v8 = 0;
        while (1)
        {
          v9 = -[__CFArray objectAtIndex:](v6, "objectAtIndex:", v8);
          v10 = (const __CFNumber *)sub_10002BE64((uint64_t)v9, CFSTR("WiFiManagerKnownNetworksEventType"));
          valuePtr = 0;
          if (!v10)
            goto LABEL_13;
          CFNumberGetValue(v10, kCFNumberIntType, &valuePtr);
          if (valuePtr == 1)
          {
            v11 = objc_autoreleasePoolPush();
            if (qword_10026DD20)
              objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "Network added by UI, so ignore removal check for plist network <%@>", sub_10002B088(v9));
            goto LABEL_18;
          }
          if (valuePtr == 5)
          {
            v11 = objc_autoreleasePoolPush();
            if (qword_10026DD20)
              objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "Guessed network, so ignore removal check for plist network <%@>", sub_10002B088(v9));
          }
          else
          {
LABEL_13:
            if (!sub_1000C5378((uint64_t)v9) && !sub_1000CB480((uint64_t)v9))
            {
              if (objc_msgSend(a3, "count"))
              {
                v12 = 0;
                while (-[WiFiIDSSyncEngine isRxdNetwork:equalToPlistNetwork:](self, "isRxdNetwork:equalToPlistNetwork:", objc_msgSend(a3, "objectAtIndex:", v12), v9) < 1)
                {
                  if (++v12 >= (unint64_t)objc_msgSend(a3, "count"))
                    goto LABEL_25;
                }
              }
              else
              {
LABEL_25:
                v13 = objc_autoreleasePoolPush();
                if (qword_10026DD20)
                  objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: REMOVE <%@> from plist !!!", "-[WiFiIDSSyncEngine processReceivedKnownNetworksInBatch:]", sub_10002B088(v9));
                objc_autoreleasePoolPop(v13);
                -[WiFiIDSSyncEngine removeFromKnownNetworkGuessingDictionaryTheNetwork:](self, "removeFromKnownNetworkGuessingDictionaryTheNetwork:", v9);
                sub_100098DBC((uint64_t)-[WiFiIDSSyncEngine manager](self, "manager"), v9, (const void *)0x15);
              }
              goto LABEL_19;
            }
            v11 = objc_autoreleasePoolPush();
            if (qword_10026DD20)
              objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "Network added by profile, so ignore removal check for plist network <%@>", sub_10002B088(v9));
          }
LABEL_18:
          objc_autoreleasePoolPop(v11);
LABEL_19:
          if (++v8 >= (unint64_t)-[__CFArray count](v6, "count"))
            goto LABEL_33;
        }
      }
      v9 = 0;
LABEL_33:
      CFRelease(v6);
    }
    else
    {
      v9 = 0;
    }
    v15 = sub_100090DA4((uint64_t)-[WiFiIDSSyncEngine manager](self, "manager"));
    if (v15)
    {
      v16 = v15;
      if (-[__CFArray count](v15, "count"))
      {
        v17 = 0;
        do
        {
          v18 = -[__CFArray objectAtIndex:](v16, "objectAtIndex:", v17);
          v9 = v18;
          if (v18)
          {
            v19 = (const __CFNumber *)sub_10002BE64((uint64_t)v18, CFSTR("WiFiManagerKnownNetworksEventType"));
            v48 = 0;
            if (!v19 || (CFNumberGetValue(v19, kCFNumberIntType, &v48), v48 == 5))
            {
              if (!-[WiFiIDSSyncEngine getCorresponding5GhzSsidInPlistFor2GhzNetwork:](self, "getCorresponding5GhzSsidInPlistFor2GhzNetwork:", v9))
              {
                v20 = objc_autoreleasePoolPush();
                if (qword_10026DD20)
                  objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: REMOVE guessed <%@> from plist", "-[WiFiIDSSyncEngine processReceivedKnownNetworksInBatch:]", sub_10002B088(v9));
                objc_autoreleasePoolPop(v20);
                -[WiFiIDSSyncEngine removeFromKnownNetworkGuessingDictionaryTheNetwork:](self, "removeFromKnownNetworkGuessingDictionaryTheNetwork:", v9);
                sub_100098DBC((uint64_t)-[WiFiIDSSyncEngine manager](self, "manager"), v9, (const void *)0x15);
              }
            }
          }
          ++v17;
        }
        while (v17 < (unint64_t)-[__CFArray count](v16, "count"));
      }
      CFRelease(v16);
    }
    v21 = sub_100090DA4((uint64_t)-[WiFiIDSSyncEngine manager](self, "manager"));
    if (objc_msgSend(a3, "count"))
    {
      v22 = 0;
      v23 = 0;
      do
      {
        v24 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", objc_msgSend(a3, "objectAtIndex:", v22));
        v25 = objc_msgSend(v24, "objectForKey:", CFSTR("SSID_STR"));
        if (!v25)
          goto LABEL_94;
        v26 = v25;
        v27 = (unint64_t)objc_msgSend(v24, "objectForKey:", CFSTR("IS_NETWORK_CAPTIVE"));
        v28 = v27 | (unint64_t)objc_msgSend(v24, "objectForKey:", CFSTR("IS_NETWORK_WHITELISTING_CAPTIVE"));
        v29 = objc_autoreleasePoolPush();
        if (!v28)
        {
          if (qword_10026DD20)
            objc_msgSend((id)qword_10026DD20, "WFLog:message:", 4, "%s: captive determination is not present for %@ , not adding network!!", "-[WiFiIDSSyncEngine processReceivedKnownNetworksInBatch:]", v26);
          objc_autoreleasePoolPop(v29);
          goto LABEL_94;
        }
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "check rxd <%@> for ADD", v26);
        objc_autoreleasePoolPop(v29);
        if (-[__CFArray count](v21, "count"))
        {
          v30 = 0;
          while (1)
          {
            v9 = -[__CFArray objectAtIndex:](v21, "objectAtIndex:", v30);
            v23 = -[WiFiIDSSyncEngine isRxdNetwork:equalToPlistNetwork:](self, "isRxdNetwork:equalToPlistNetwork:", v24, v9);
            if (v23 >= 1)
              break;
            if (++v30 >= (unint64_t)-[__CFArray count](v21, "count"))
              goto LABEL_61;
          }
          v36 = objc_autoreleasePoolPush();
          if (qword_10026DD20)
            objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "rxd network <%@> exits in plist", v26);
          objc_autoreleasePoolPop(v36);
          if (v23 == 1)
            goto LABEL_94;
        }
        else if (v23 < 2)
        {
LABEL_61:
          if (!sub_100178BEC(v24))
            goto LABEL_88;
          v46 = 0;
          v31 = 0;
          goto LABEL_63;
        }
        v37 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: rxd network properties have changed(%d), update the network <%@>", "-[WiFiIDSSyncEngine processReceivedKnownNetworksInBatch:]", v23, v26);
        objc_autoreleasePoolPop(v37);
        -[WiFiIDSSyncEngine manager](self, "manager");
        v38 = sub_100177FD0(v24);
        if (!v38)
          goto LABEL_94;
        v31 = v38;
        if ((v23 & 8) != 0)
        {
          -[WiFiIDSSyncEngine removeFromKnownNetworkGuessingDictionaryTheNetwork:](self, "removeFromKnownNetworkGuessingDictionaryTheNetwork:", v9);
          -[WiFiIDSSyncEngine addToKnownNetworkGuessingDictionaryTheNetwork:](self, "addToKnownNetworkGuessingDictionaryTheNetwork:", v31);
        }
        sub_100099EA4((uint64_t)-[WiFiIDSSyncEngine manager](self, "manager"), v31, 1u);
        sub_10002C478((uint64_t)v31, CFSTR("SyncedHomeProperties"), 0);
        if ((v23 & 2) == 0)
          goto LABEL_93;
        v39 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Password update required", "-[WiFiIDSSyncEngine processReceivedKnownNetworksInBatch:]");
        objc_autoreleasePoolPop(v39);
        if (!sub_100178BEC(v24))
        {
          CFRelease(v31);
LABEL_88:
          -[WiFiIDSSyncEngine manager](self, "manager");
          v31 = sub_100177FD0(v24);
          goto LABEL_89;
        }
        v46 = 1;
LABEL_63:
        v32 = (const __CFString *)objc_msgSend(v24, "objectForKey:", CFSTR("WiFiNetworkPasswordString"));
        if (!v32)
          goto LABEL_92;
        v33 = v32;
        objc_msgSend(v24, "removeObjectForKey:", CFSTR("WiFiNetworkPasswordString"));
        if (v31)
          CFRelease(v31);
        -[WiFiIDSSyncEngine manager](self, "manager");
        v34 = sub_100177FD0(v24);
        if (!v34)
          goto LABEL_94;
        v31 = v34;
        v47 = 0;
        v35 = sub_1000C6458(v34, v33, &v47, 0.1);
        if (v47 || !v35)
        {
          v40 = v35;
          v41 = objc_autoreleasePoolPush();
          if (qword_10026DD20)
          {
            v44 = v40;
            v42 = v41;
            objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WiFiNetworkSetPasswordWithTimeout for <%@> has timeout = %d and result = %d", "-[WiFiIDSSyncEngine processReceivedKnownNetworksInBatch:]", v26, v47, v44);
            v41 = v42;
          }
          objc_autoreleasePoolPop(v41);
          goto LABEL_93;
        }
        if (v46)
        {
          -[WiFiIDSSyncEngine updateGuessedNetworkCredentials:password:](self, "updateGuessedNetworkCredentials:password:", v31, v33);
LABEL_93:
          CFRelease(v31);
          goto LABEL_94;
        }
LABEL_89:
        -[WiFiIDSSyncEngine addToKnownNetworkGuessingDictionaryTheNetwork:](self, "addToKnownNetworkGuessingDictionaryTheNetwork:", v31);
        sub_100172598(v24, v31);
        sub_1001785DC(v31, (uint64_t)-[WiFiIDSSyncEngine manager](self, "manager"));
        v43 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: ADDED <%@> to plist !!!", "-[WiFiIDSSyncEngine processReceivedKnownNetworksInBatch:]", v26);
        objc_autoreleasePoolPop(v43);
LABEL_92:
        if (v31)
          goto LABEL_93;
LABEL_94:

        ++v22;
      }
      while (v22 < (unint64_t)objc_msgSend(a3, "count"));
    }
    v5 = v45;
    if (v21)
      CFRelease(v21);
  }
  else
  {
    v14 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Cannot apply synced networks as device has not unlock after boot", "-[WiFiIDSSyncEngine processReceivedKnownNetworksInBatch:]");
    objc_autoreleasePoolPop(v14);

    self->_receivedKnownNetworks = (NSArray *)objc_msgSend(a3, "copy");
  }
  objc_autoreleasePoolPop(v5);
}

- (void)knownNetworksListChanged
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_autoreleasePoolPush();
  v4 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: role %ld, isKeychainUnlocked %d", "-[WiFiIDSSyncEngine knownNetworksListChanged]", -[WiFiIDSSyncEngine role](self, "role"), -[WiFiIDSSyncEngine isKeychainUnlocked](self, "isKeychainUnlocked"));
  objc_autoreleasePoolPop(v4);
  if (-[WiFiIDSSyncEngine role](self, "role") && -[WiFiIDSSyncEngine isKeychainUnlocked](self, "isKeychainUnlocked"))
  {
    if (-[WiFiIDSSyncEngine coalesceKnownNetworksSyncTimer](self, "coalesceKnownNetworksSyncTimer"))
    {
      -[NSTimer setFireDate:](-[WiFiIDSSyncEngine coalesceKnownNetworksSyncTimer](self, "coalesceKnownNetworksSyncTimer"), "setFireDate:", +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 10.0));
      v5 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: adjusted coalesceKnownNetworksSyncTimer %@", "-[WiFiIDSSyncEngine knownNetworksListChanged]", -[WiFiIDSSyncEngine coalesceKnownNetworksSyncTimer](self, "coalesceKnownNetworksSyncTimer"));
      objc_autoreleasePoolPop(v5);
    }
    else
    {
      self->_coalesceKnownNetworksSyncTimer = (NSTimer *)objc_msgSend(objc_alloc((Class)NSTimer), "initWithFireDate:interval:target:selector:userInfo:repeats:", +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 10.0), self, "syncKnownWiFiNetworks:", 0, 1, 315360000.0);
      v6 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: created coalesceKnownNetworksSyncTimer %@", "-[WiFiIDSSyncEngine knownNetworksListChanged]", -[WiFiIDSSyncEngine coalesceKnownNetworksSyncTimer](self, "coalesceKnownNetworksSyncTimer"));
      objc_autoreleasePoolPop(v6);
      -[NSRunLoop addTimer:forMode:](+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"), "addTimer:forMode:", -[WiFiIDSSyncEngine coalesceKnownNetworksSyncTimer](self, "coalesceKnownNetworksSyncTimer"), NSDefaultRunLoopMode);
    }
  }
  objc_autoreleasePoolPop(v3);
}

- (BOOL)isNetwork:(__WiFiNetwork *)a3 updatedSince:(double)a4 withinInterval:(double)a5 basedOn:(__CFString *)a6
{
  const __CFDate *v8;
  double AbsoluteTime;
  const __CFDate *v10;
  CFTypeID v11;
  BOOL v12;

  v8 = (const __CFDate *)sub_10002BE64((uint64_t)a3, a6);
  AbsoluteTime = 0.0;
  if (v8)
  {
    v10 = v8;
    v11 = CFGetTypeID(v8);
    if (v11 == CFDateGetTypeID())
      AbsoluteTime = CFDateGetAbsoluteTime(v10);
  }
  v12 = a4 > 0.0;
  if (AbsoluteTime <= 0.0)
    v12 = 0;
  return a4 - AbsoluteTime < a5 && v12;
}

- (BOOL)skipSyncForNetwork:(__WiFiNetwork *)a3
{
  double Current;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;

  Current = CFAbsoluteTimeGetCurrent();
  v6 = -[WiFiIDSSyncEngine isNetwork:updatedSince:withinInterval:basedOn:](self, "isNetwork:updatedSince:withinInterval:basedOn:", a3, CFSTR("lastAutoJoined"), Current, 604800.0);
  v7 = -[WiFiIDSSyncEngine isNetwork:updatedSince:withinInterval:basedOn:](self, "isNetwork:updatedSince:withinInterval:basedOn:", a3, CFSTR("lastJoined"), Current, 604800.0);
  v8 = -[WiFiIDSSyncEngine isNetwork:updatedSince:withinInterval:basedOn:](self, "isNetwork:updatedSince:withinInterval:basedOn:", a3, CFSTR("lastUpdated"), Current, 604800.0);
  return (v6 | v7 | v8 | -[WiFiIDSSyncEngine isNetwork:updatedSince:withinInterval:basedOn:](self, "isNetwork:updatedSince:withinInterval:basedOn:", a3, CFSTR("addedAt"), Current, 604800.0)) ^ 1;
}

- (void)syncKnownWiFiNetwork:(__WiFiNetwork *)a3 withOperation:(int)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  CFStringRef v16;
  id v17;
  const void *v18;
  void *v19;
  const void *v20;
  void *v21;
  _QWORD block[7];
  int v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  uint64_t v30;
  _BYTE v31[128];

  v6 = objc_autoreleasePoolPush();
  v7 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: role %ld, destinationID %@, version %@", "-[WiFiIDSSyncEngine syncKnownWiFiNetwork:withOperation:]", -[WiFiIDSSyncEngine role](self, "role"), -[WiFiIDSSyncEngine pairedDeviceDestinationID](self, "pairedDeviceDestinationID"), -[WiFiIDSSyncEngine pairedDeviceVersionID](self, "pairedDeviceVersionID"));
  objc_autoreleasePoolPop(v7);
  if (-[WiFiIDSSyncEngine role](self, "role"))
  {
    if (-[WiFiIDSSyncEngine pairedDeviceDestinationID](self, "pairedDeviceDestinationID"))
    {
      v29[0] = 0;
      v29[1] = v29;
      v29[2] = 0x3052000000;
      v29[3] = sub_10002FB58;
      v29[4] = sub_10002FA1C;
      v30 = 0xAAAAAAAAAAAAAAAALL;
      v30 = sub_10001E1C8((uint64_t)"-[WiFiIDSSyncEngine syncKnownWiFiNetwork:withOperation:]");
      v8 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
      v9 = (void *)sub_1000D94B8();
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v26 != v11)
              objc_enumerationMutation(v9);
            objc_msgSend(v8, "setObject:forKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i), objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i), "objectForKeyedSubscript:", kSecAttrAccount));
          }
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
        }
        while (v10);
      }

      if (-[WiFiIDSSyncEngine skipSyncForNetwork:](self, "skipSyncForNetwork:", a3))
      {
        v13 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Skipping sync for network: <%@>", "-[WiFiIDSSyncEngine syncKnownWiFiNetwork:withOperation:]", sub_10002B088(a3));
        objc_autoreleasePoolPop(v13);
        goto LABEL_35;
      }
      v14 = sub_100177254(a3, (uint64_t)-[WiFiIDSSyncEngine manager](self, "manager"));
      v15 = v14;
      if (v14 && sub_1001788C0(v14))
      {
        if (sub_100178BEC(v15))
        {
          v16 = sub_1000C37A0((CFDictionaryRef *)a3);
          if (!v16)
          {
LABEL_35:
            _Block_object_dispose(v29, 8);
            goto LABEL_36;
          }
          objc_msgSend(v15, "setObject:forKey:", v16, CFSTR("WiFiNetworkPasswordString"));
          if (!sub_1000CA3FC((uint64_t)a3))
          {
            v17 = objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", sub_10002B088(a3)), "objectForKeyedSubscript:", kSecAttrModificationDate);
            sub_1000CA2C0(a3, v17);
            sub_100094200((uint64_t)-[WiFiIDSSyncEngine manager](self, "manager"), (CFDictionaryRef *)a3, 0);
          }
        }
        else
        {
          v16 = 0;
        }
        v18 = sub_10002BE64((uint64_t)a3, CFSTR("NetworkOfInterestHomeState"));
        if (v18)
        {
          objc_msgSend(v15, "setObject:forKey:", v18, CFSTR("NetworkOfInterestHomeState"));
          v19 = objc_autoreleasePoolPush();
          if (qword_10026DD20)
            objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WFMacRandomisation : syncing NOI for network : <%@>", "-[WiFiIDSSyncEngine syncKnownWiFiNetwork:withOperation:]", sub_10002B088(a3));
          objc_autoreleasePoolPop(v19);
        }
        v20 = sub_10002BE64((uint64_t)a3, CFSTR("NetworkAtLocationOfInterestType"));
        if (v20)
        {
          objc_msgSend(v15, "setObject:forKey:", v20, CFSTR("NetworkAtLocationOfInterestType"));
          v21 = objc_autoreleasePoolPush();
          if (qword_10026DD20)
            objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: WFMacRandomisation : syncing LOI for network : <%@>", "-[WiFiIDSSyncEngine syncKnownWiFiNetwork:withOperation:]", sub_10002B088(a3));
          objc_autoreleasePoolPop(v21);
        }
        if (v16)
          CFRelease(v16);
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1001737D0;
      block[3] = &unk_100233608;
      v24 = a4;
      block[4] = v15;
      block[5] = self;
      block[6] = v29;
      dispatch_async((dispatch_queue_t)-[WiFiIDSSyncEngine serialIdsDispatchQ](self, "serialIdsDispatchQ"), block);

      goto LABEL_35;
    }
    -[WiFiIDSSyncEngine setIsWaitingForIdsMessageDelivery:](self, "setIsWaitingForIdsMessageDelivery:", 1);
  }
LABEL_36:
  objc_autoreleasePoolPop(v6);
}

- (void)syncKnownWiFiNetworks:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001739A8;
  block[3] = &unk_10022EEE8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)-[WiFiIDSSyncEngine managerQueue](self, "managerQueue", a3), block);
}

- (void)keychainAccessibleNow
{
  void *v3;
  void *v4;

  v3 = objc_autoreleasePoolPush();
  v4 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s", "-[WiFiIDSSyncEngine keychainAccessibleNow]");
  objc_autoreleasePoolPop(v4);
  -[WiFiIDSSyncEngine setIsKeychainUnlocked:](self, "setIsKeychainUnlocked:", 1);
  -[WiFiIDSSyncEngine knownNetworksListChanged](self, "knownNetworksListChanged");
  objc_autoreleasePoolPop(v3);
}

- (void)checkForWiFiPasswordChange
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  char v13;
  id v14;
  const void *v15;
  const __CFDate *v16;
  const __CFDate *v17;
  const __CFDate *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v3 = objc_autoreleasePoolPush();
  v4 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s", "-[WiFiIDSSyncEngine checkForWiFiPasswordChange]");
  objc_autoreleasePoolPop(v4);
  v5 = (void *)sub_10001E1C8((uint64_t)"-[WiFiIDSSyncEngine checkForWiFiPasswordChange]");
  -[WiFiIDSSyncEngine setKnownNetworks:](self, "setKnownNetworks:", sub_10008674C((uint64_t)-[WiFiIDSSyncEngine manager](self, "manager")));
  v6 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v7 = (void *)sub_1000D94B8();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "setObject:forKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i), objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i), "objectForKeyedSubscript:", kSecAttrAccount));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }
  if (-[NSArray count](-[WiFiIDSSyncEngine knownNetworks](self, "knownNetworks"), "count"))
  {
    v21 = v5;
    v12 = 0;
    v13 = 0;
    while (1)
    {
      v14 = -[NSArray objectAtIndex:](-[WiFiIDSSyncEngine knownNetworks](self, "knownNetworks"), "objectAtIndex:", v12);
      v15 = sub_10002B088(v14);
      if (sub_1000C5C14((uint64_t)v14))
      {
        if (MGGetBoolAnswer(CFSTR("InternalBuild")))
          sub_10009E988((CFArrayRef *)-[WiFiIDSSyncEngine manager](self, "manager"), v14);
        v16 = (const __CFDate *)sub_1000CA3FC((uint64_t)v14);
        v17 = (const __CFDate *)objc_msgSend(objc_msgSend(v6, "objectForKeyedSubscript:", v15), "objectForKeyedSubscript:", kSecAttrModificationDate);
        v18 = v17;
        if (v16 && v17)
        {
          if (CFDateCompare(v16, v17, 0))
          {
            v13 = 1;
LABEL_20:
            sub_1000CA2C0(v14, v18);
            sub_100094200((uint64_t)-[WiFiIDSSyncEngine manager](self, "manager"), (CFDictionaryRef *)v14, 0);
          }
        }
        else if (v17)
        {
          goto LABEL_20;
        }
      }
      if (++v12 >= -[NSArray count](-[WiFiIDSSyncEngine knownNetworks](self, "knownNetworks"), "count"))
      {
        v5 = v21;
        if ((v13 & 1) != 0)
        {
          v19 = sub_100095610((uint64_t)-[WiFiIDSSyncEngine manager](self, "manager"), (const __CFArray *)-[WiFiIDSSyncEngine knownNetworks](self, "knownNetworks"));
          v20 = objc_autoreleasePoolPush();
          if (qword_10026DD20)
            objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: mod date changes saved to the plist: %d", "-[WiFiIDSSyncEngine checkForWiFiPasswordChange]", v19);
          objc_autoreleasePoolPop(v20);
          if (v19)
            -[WiFiIDSSyncEngine knownNetworksListChanged](self, "knownNetworksListChanged");
        }
        break;
      }
    }
  }

  objc_autoreleasePoolPop(v3);
}

- (void)subscribeToKeychainChanges
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  _QWORD handler[5];
  int out_token;

  v3 = objc_autoreleasePoolPush();
  v4 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s", "-[WiFiIDSSyncEngine subscribeToKeychainChanges]");
  objc_autoreleasePoolPop(v4);
  out_token = 0;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1001744D0;
  handler[3] = &unk_100233630;
  handler[4] = self;
  notify_register_dispatch("com.apple.security.keychainchanged", &out_token, (dispatch_queue_t)qword_10026DD40, handler);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10017457C;
  v5[3] = &unk_100233630;
  v5[4] = self;
  notify_register_dispatch("com.apple.wifid.WiFiPasswordChanged", &out_token, (dispatch_queue_t)qword_10026DD40, v5);
  objc_autoreleasePoolPop(v3);
}

- (void)currentNetworkChanged
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_autoreleasePoolPush();
  v4 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: role %ld, currentNetwork %@", "-[WiFiIDSSyncEngine currentNetworkChanged]", -[WiFiIDSSyncEngine role](self, "role"), -[WiFiIDSSyncEngine currentNetwork](self, "currentNetwork"));
  objc_autoreleasePoolPop(v4);
  if (-[WiFiIDSSyncEngine role](self, "role")
    && -[WiFiIDSSyncEngine pairedDeviceDestinationID](self, "pairedDeviceDestinationID"))
  {
    if (-[WiFiIDSSyncEngine currentNetwork](self, "currentNetwork"))
    {
      -[NSTimer setFireDate:](-[WiFiIDSSyncEngine waitForReAssociationTimer](self, "waitForReAssociationTimer"), "setFireDate:", +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", CFAbsoluteTimeGetCurrent() + 315360000.0));
      v5 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: reset waitForReAssociationTimer %@", "-[WiFiIDSSyncEngine currentNetworkChanged]", -[WiFiIDSSyncEngine waitForReAssociationTimer](self, "waitForReAssociationTimer"));
      objc_autoreleasePoolPop(v5);
      -[WiFiIDSSyncEngine sendCurrentCompanionNetworkWithChannelUpdate:](self, "sendCurrentCompanionNetworkWithChannelUpdate:", 0);
    }
    else if (-[WiFiIDSSyncEngine waitForReAssociationTimer](self, "waitForReAssociationTimer"))
    {
      v6 = objc_autoreleasePoolPush();
      -[NSTimer setFireDate:](-[WiFiIDSSyncEngine waitForReAssociationTimer](self, "waitForReAssociationTimer"), "setFireDate:", +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 30.0));
      objc_autoreleasePoolPop(v6);
      v7 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: adjusted waitForReAssociationTimer %@", "-[WiFiIDSSyncEngine currentNetworkChanged]", -[WiFiIDSSyncEngine waitForReAssociationTimer](self, "waitForReAssociationTimer"));
      objc_autoreleasePoolPop(v7);
    }
    else
    {
      -[WiFiIDSSyncEngine setWaitForReAssociationTimer:](self, "setWaitForReAssociationTimer:", objc_msgSend(objc_alloc((Class)NSTimer), "initWithFireDate:interval:target:selector:userInfo:repeats:", +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 30.0), self, "companionReAssociationWaitTimerFired:", 0, 1, CFAbsoluteTimeGetCurrent() + 315360000.0));
      v8 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: created waitForReAssociationTimer %@", "-[WiFiIDSSyncEngine currentNetworkChanged]", -[WiFiIDSSyncEngine waitForReAssociationTimer](self, "waitForReAssociationTimer"));
      objc_autoreleasePoolPop(v8);
      -[NSRunLoop addTimer:forMode:](+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"), "addTimer:forMode:", -[WiFiIDSSyncEngine waitForReAssociationTimer](self, "waitForReAssociationTimer"), NSDefaultRunLoopMode);
    }
  }
  objc_autoreleasePoolPop(v3);
}

- (void)companionReAssociationWaitTimerFired:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017491C;
  block[3] = &unk_10022EEE8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)-[WiFiIDSSyncEngine managerQueue](self, "managerQueue", a3), block);
}

- (void)sendCurrentCompanionNetworkWithChannelUpdate:(unsigned __int8)a3
{
  int v3;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  CFStringRef v9;
  const void *v10;
  const __CFNumber *v11;
  NSNumber *v12;
  const __CFNumber *v13;
  uint64_t v14;
  NSNumber *v15;
  void *v16;
  _QWORD v17[6];
  unsigned int v18;
  float valuePtr;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _QWORD block[6];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  void *v32;

  v3 = a3;
  v5 = objc_autoreleasePoolPush();
  v27 = 0;
  v28 = &v27;
  v29 = 0x3052000000;
  v30 = sub_10002FB58;
  v31 = sub_10002FA1C;
  v32 = (void *)0xAAAAAAAAAAAAAAAALL;
  v32 = sub_100177254(-[WiFiIDSSyncEngine currentNetwork](self, "currentNetwork"), (uint64_t)-[WiFiIDSSyncEngine manager](self, "manager"));
  v6 = (void *)v28[5];
  if (v6 && sub_1001788C0(v6))
  {
    v7 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: autojoinAssist SSID %@", "-[WiFiIDSSyncEngine sendCurrentCompanionNetworkWithChannelUpdate:]", objc_msgSend((id)v28[5], "objectForKey:", CFSTR("SSID_STR")));
    objc_autoreleasePoolPop(v7);
    if (&_CNForgetSSID)
    {
      v8 = sub_1000C475C((uint64_t)-[WiFiIDSSyncEngine currentNetwork](self, "currentNetwork"));
      objc_msgSend((id)v28[5], "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v8), CFSTR("IS_NETWORK_CAPTIVE"));
    }
    if (sub_100178BEC((void *)v28[5]))
    {
      v9 = sub_1000C37A0((CFDictionaryRef *)-[WiFiIDSSyncEngine currentNetwork](self, "currentNetwork"));
      if (v9)
      {
        objc_msgSend((id)v28[5], "setObject:forKey:", v9, CFSTR("WiFiNetworkPasswordString"));
        CFRelease(v9);
      }
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100174D98;
    block[3] = &unk_10022EC00;
    block[4] = self;
    block[5] = &v27;
    dispatch_async((dispatch_queue_t)-[WiFiIDSSyncEngine serialIdsDispatchQ](self, "serialIdsDispatchQ"), block);
  }
  else
  {
    if (-[WiFiIDSSyncEngine currentNetwork](self, "currentNetwork"))
      v10 = sub_10002B088(-[WiFiIDSSyncEngine currentNetwork](self, "currentNetwork"));
    else
      v10 = 0;
    v20 = 0;
    v21 = &v20;
    v22 = 0x3052000000;
    v23 = sub_10002FB58;
    v24 = sub_10002FA1C;
    v25 = (id)0xAAAAAAAAAAAAAAAALL;
    v25 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 3);
    if (v10)
    {
      objc_msgSend((id)v21[5], "setObject:forKey:", v10, CFSTR("SSID_STR"));
      valuePtr = 0.0;
      v11 = (const __CFNumber *)sub_10002BE64((uint64_t)-[WiFiIDSSyncEngine currentNetwork](self, "currentNetwork"), CFSTR("RSSI"));
      if (v11)
        CFNumberGetValue(v11, kCFNumberFloatType, &valuePtr);
      v12 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", valuePtr);
      objc_msgSend((id)v21[5], "setObject:forKey:", v12, CFSTR("RSSI"));
      v18 = 0;
      v13 = (const __CFNumber *)sub_10002BE64((uint64_t)-[WiFiIDSSyncEngine currentNetwork](self, "currentNetwork"), CFSTR("CHANNEL"));
      if (v13)
      {
        CFNumberGetValue(v13, kCFNumberIntType, &v18);
        v14 = v18;
      }
      else
      {
        v14 = 0;
      }
      v15 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v14);
      objc_msgSend((id)v21[5], "setObject:forKey:", v15, CFSTR("CHANNEL"));
      if (v3)
        objc_msgSend((id)v21[5], "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), CFSTR("CHANNEL_UPDATE"));
    }
    if (-[WiFiIDSSyncEngine countryCodeStr](self, "countryCodeStr"))
      objc_msgSend((id)v21[5], "setObject:forKey:", -[WiFiIDSSyncEngine countryCodeStr](self, "countryCodeStr"), CFSTR("ISO_CC_CODE"));
    v16 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: autojoinAssistDict %@", "-[WiFiIDSSyncEngine sendCurrentCompanionNetworkWithChannelUpdate:]", v21[5]);
    objc_autoreleasePoolPop(v16);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100174EB8;
    v17[3] = &unk_10022EC00;
    v17[4] = self;
    v17[5] = &v20;
    dispatch_async((dispatch_queue_t)-[WiFiIDSSyncEngine serialIdsDispatchQ](self, "serialIdsDispatchQ"), v17);
    _Block_object_dispose(&v20, 8);
  }
  _Block_object_dispose(&v27, 8);
  objc_autoreleasePoolPop(v5);
}

- (void)sendLocaleToGizmo:(id)a3
{
  void *v5;
  void *v6;
  _QWORD block[5];

  v5 = objc_autoreleasePoolPush();
  v6 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Sending countryCode %@", "-[WiFiIDSSyncEngine sendLocaleToGizmo:]", a3);
  objc_autoreleasePoolPop(v6);

  self->_countryCodeStr = (NSString *)objc_msgSend(a3, "copy");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100175058;
  block[3] = &unk_10022EEE8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)-[WiFiIDSSyncEngine serialIdsDispatchQ](self, "serialIdsDispatchQ"), block);
  objc_autoreleasePoolPop(v5);
}

- (void)currentNetworkChannelChanged
{
  void *v3;
  void *v4;

  v3 = objc_autoreleasePoolPush();
  v4 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: role %ld, currentNetwork %@", "-[WiFiIDSSyncEngine currentNetworkChannelChanged]", -[WiFiIDSSyncEngine role](self, "role"), -[WiFiIDSSyncEngine currentNetwork](self, "currentNetwork"));
  objc_autoreleasePoolPop(v4);
  if (-[WiFiIDSSyncEngine currentNetwork](self, "currentNetwork")
    && -[WiFiIDSSyncEngine role](self, "role")
    && -[WiFiIDSSyncEngine pairedDeviceDestinationID](self, "pairedDeviceDestinationID"))
  {
    -[WiFiIDSSyncEngine sendCurrentCompanionNetworkWithChannelUpdate:](self, "sendCurrentCompanionNetworkWithChannelUpdate:", 1);
  }
  objc_autoreleasePoolPop(v3);
}

- (void)networkRemoved:(__WiFiNetwork *)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  v5 = objc_autoreleasePoolPush();
  if ((id)-[WiFiIDSSyncEngine role](self, "role") != (id)1)
  {
    v6 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Clear the guessing dictionaries for %@", "-[WiFiIDSSyncEngine networkRemoved:]", a3);
    objc_autoreleasePoolPop(v6);
    -[WiFiIDSSyncEngine removeFromKnownNetworkGuessingDictionaryTheNetwork:](self, "removeFromKnownNetworkGuessingDictionaryTheNetwork:", a3);
    v7 = -[WiFiIDSSyncEngine getCorresponding5GhzSsidInPlistFor2GhzNetwork:](self, "getCorresponding5GhzSsidInPlistFor2GhzNetwork:", a3);
    if (v7)
    {
      v8 = v7;
      v9 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Clear the dictionaries for corresponding 5GHz network %@", "-[WiFiIDSSyncEngine networkRemoved:]", v8);
      objc_autoreleasePoolPop(v9);
      -[NSMutableDictionary removeObjectForKey:](-[WiFiIDSSyncEngine authGuessingDictionary](self, "authGuessingDictionary"), "removeObjectForKey:", v8);
    }
  }
  objc_autoreleasePoolPop(v5);
}

- (void)processReceivedAutoJoinAssist:(id)a3
{
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  unsigned __int8 v15;
  int v16;
  void *v17;
  const char *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  __WiFiManager *v27;
  const void *v28;
  unsigned int v29;
  int v30;
  int v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  int v36;

  v5 = objc_autoreleasePoolPush();
  if (!a3)
  {
    v35 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null autojoin assist", "-[WiFiIDSSyncEngine processReceivedAutoJoinAssist:]");
    goto LABEL_53;
  }
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SSID_STR"));
  if (!v6)
  {
    v35 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null companionSsid", "-[WiFiIDSSyncEngine processReceivedAutoJoinAssist:]");
LABEL_53:
    objc_autoreleasePoolPop(v35);
    v27 = -[WiFiIDSSyncEngine manager](self, "manager");
    v28 = 0;
    v29 = 0;
    v30 = 0;
    v31 = 0;
    goto LABEL_39;
  }
  v7 = v6;
  v8 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RSSI"));
  if (v8)
  {
    v9 = objc_msgSend(v8, "intValue");
    v10 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "rxd companion rssi %d", v9);
    objc_autoreleasePoolPop(v10);
  }
  else
  {
    LODWORD(v9) = 0;
  }
  v11 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CHANNEL"));
  if (v11)
  {
    v12 = objc_msgSend(v11, "intValue");
    v13 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "rxd companion channel %d", v12);
    objc_autoreleasePoolPop(v13);
  }
  else
  {
    LODWORD(v12) = 0;
  }
  v36 = (int)v9;
  v14 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CHANNEL_UPDATE"));
  if (v14)
  {
    v15 = objc_msgSend(v14, "intValue");
    v16 = v15;
    v17 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
    {
      v18 = "true";
      if (!v15)
        v18 = "false";
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "rxd channel update request: %s", v18);
    }
    objc_autoreleasePoolPop(v17);
  }
  else
  {
    v16 = 0;
  }
  v19 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ISO_CC_CODE"));
  if (v19)
    sub_10009C654((uint64_t)-[WiFiIDSSyncEngine manager](self, "manager"), v19);
  v20 = (void *)sub_10008674C((uint64_t)-[WiFiIDSSyncEngine manager](self, "manager"));
  v21 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: %lu plist networks, autojoin assist SSID: %@", "-[WiFiIDSSyncEngine processReceivedAutoJoinAssist:]", objc_msgSend(v20, "count"), objc_msgSend(a3, "objectForKey:", CFSTR("SSID_STR")));
  objc_autoreleasePoolPop(v21);
  if (objc_msgSend(v20, "count"))
  {
    v22 = 0;
    while (1)
    {
      v23 = objc_msgSend(v20, "objectAtIndex:", v22);
      v24 = (void *)sub_10002B088(v23);
      if (objc_msgSend(v24, "isEqualToString:", v7))
        break;
      if (++v22 >= (unint64_t)objc_msgSend(v20, "count"))
        goto LABEL_30;
    }
    v26 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "rxd companion network <%@> exists in gizmo plist", v24);
    objc_autoreleasePoolPop(v26);
  }
  else
  {
    v24 = 0;
    v23 = 0;
LABEL_30:
    v25 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", a3, CFSTR("ADD"), 0);
    -[WiFiIDSSyncEngine processReceivedKnownNetwork:](self, "processReceivedKnownNetwork:", v25);

  }
  if (!-[WiFiIDSSyncEngine doesNetworkContainBssidForGuessing2GhzNetwork:](self, "doesNetworkContainBssidForGuessing2GhzNetwork:", v23))
  {
    v34 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: companion network %@ is not a 5ghz network", "-[WiFiIDSSyncEngine processReceivedAutoJoinAssist:]", v7);
LABEL_48:
    objc_autoreleasePoolPop(v34);
    goto LABEL_36;
  }
  if (!sub_100092C9C((uint64_t)-[WiFiIDSSyncEngine manager](self, "manager"))
    && objc_msgSend(v20, "count"))
  {
    v32 = 0;
    while (1)
    {
      v33 = objc_msgSend(v20, "objectAtIndex:", v32);
      if (objc_msgSend(-[WiFiIDSSyncEngine getCorresponding5GhzSsidInPlistFor2GhzNetwork:](self, "getCorresponding5GhzSsidInPlistFor2GhzNetwork:", v33), "isEqualToString:", v7))break;
      if (++v32 >= (unint64_t)objc_msgSend(v20, "count"))
        goto LABEL_36;
    }
    v24 = (void *)sub_10002B088(v33);
    v34 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "rxd companion network <%@> has guessed counterpart 2.4ghz network <%@> in gizmo plist", v7, v24);
    goto LABEL_48;
  }
LABEL_36:
  v27 = -[WiFiIDSSyncEngine manager](self, "manager");
  if (!v16)
  {
    v28 = v24;
    v29 = 1;
    v30 = v36;
    v31 = (int)v12;
LABEL_39:
    sub_10009F314((uint64_t)v27, v28, v29, v30, v31);
    goto LABEL_40;
  }
  sub_10009F7C8((uint64_t)v27, (int)v12, 0);
LABEL_40:
  objc_autoreleasePoolPop(v5);
}

- (void)processReceivedLocaleString:(id)a3
{
  void *v5;

  v5 = objc_autoreleasePoolPush();
  sub_10009C654((uint64_t)-[WiFiIDSSyncEngine manager](self, "manager"), a3);
  objc_autoreleasePoolPop(v5);
}

- (void)notifyStateChanged
{
  void (**v3)(id, _QWORD, void *);

  if (-[WiFiIDSSyncEngine stateChangeCallback](self, "stateChangeCallback"))
  {
    v3 = -[WiFiIDSSyncEngine stateChangeCallback](self, "stateChangeCallback");
    v3[2](v3, -[WiFiIDSSyncEngine connectionState](self, "connectionState"), -[WiFiIDSSyncEngine stateChangeContext](self, "stateChangeContext"));
  }
}

- (void)releaseKnownNetworkGuessingDictionary
{

}

- (void)createKnownNetworkGuessingDictionary
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  self->_bssidGuessingDictionary = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  self->_authGuessingDictionary = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  v3 = (void *)sub_10008674C((uint64_t)-[WiFiIDSSyncEngine manager](self, "manager"));
  v4 = objc_autoreleasePoolPush();
  if (v3)
  {
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: %lu known networks", "-[WiFiIDSSyncEngine createKnownNetworkGuessingDictionary]", objc_msgSend(v3, "count"));
    objc_autoreleasePoolPop(v4);
    v5 = objc_autoreleasePoolPush();
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v3);
          -[WiFiIDSSyncEngine addToKnownNetworkGuessingDictionaryTheNetwork:](self, "addToKnownNetworkGuessingDictionaryTheNetwork:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i));
        }
        v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null plistNetworks", "-[WiFiIDSSyncEngine createKnownNetworkGuessingDictionary]");
    objc_autoreleasePoolPop(v4);
  }
}

- (void)updateBssidGuessingDictForBssid:(id)a3 guessingFailureCountDict:(id)a4 forNetworkSsid:(id)a5
{
  id *v9;
  const __CFString **v10;
  uint64_t v11;
  const __CFString *v12;
  id v13;
  _QWORD v14[2];
  _QWORD v15[2];

  if (a4 && objc_msgSend(a4, "valueForKey:", a3))
  {
    v14[0] = CFSTR("5GhzSsid");
    v14[1] = CFSTR("GuessingFailureCount");
    v15[0] = a5;
    v15[1] = objc_msgSend(a4, "valueForKey:", a3);
    v9 = (id *)v15;
    v10 = (const __CFString **)v14;
    v11 = 2;
  }
  else
  {
    v12 = CFSTR("5GhzSsid");
    v13 = a5;
    v9 = &v13;
    v10 = &v12;
    v11 = 1;
  }
  -[NSMutableDictionary setValue:forKey:](-[WiFiIDSSyncEngine bssidGuessingDictionary](self, "bssidGuessingDictionary"), "setValue:forKey:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v10, v11), a3);
}

- (void)addToKnownNetworkGuessingDictionaryTheNetwork:(__WiFiNetwork *)a3
{
  const void *v5;
  const void *v6;
  uint64_t v7;
  void *v8;
  CFStringRef v9;
  CFStringRef v10;
  NSDictionary *v11;
  void *v12;
  const void *v13;
  const void *v14;
  const void *v15;
  const void *v16;
  const void *v17;
  const void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[2];

  if (a3 && (v5 = sub_10002B088(a3)) != 0)
  {
    v6 = v5;
    v7 = sub_1000C5C14((uint64_t)a3);
    v8 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: %@[%d]", "-[WiFiIDSSyncEngine addToKnownNetworkGuessingDictionaryTheNetwork:]", v6, v7);
    objc_autoreleasePoolPop(v8);
    if (!(_DWORD)v7)
    {
      v11 = (NSDictionary *)&off_100254048;
LABEL_13:
      -[NSMutableDictionary setObject:forKey:](-[WiFiIDSSyncEngine authGuessingDictionary](self, "authGuessingDictionary"), "setObject:forKey:", v11, v6);
      v13 = sub_10002BE64((uint64_t)a3, CFSTR("GUESSED_2ghzBSSID1"));
      if (v13)
      {
        v14 = v13;
        v15 = sub_10002BE64((uint64_t)a3, CFSTR("GUESSED_2ghzBSSID2"));
        v16 = sub_10002BE64((uint64_t)a3, CFSTR("GUESSED_2ghzBSSID3"));
        v17 = sub_10002BE64((uint64_t)a3, CFSTR("GUESSED_2ghzBSSID4"));
        v18 = sub_10002BE64((uint64_t)a3, CFSTR("WiFiPreference2GhzGuessingAttemptsPerBSSID"));
        -[WiFiIDSSyncEngine updateBssidGuessingDictForBssid:guessingFailureCountDict:forNetworkSsid:](self, "updateBssidGuessingDictForBssid:guessingFailureCountDict:forNetworkSsid:", v14, v18, v6);
        if (v15)
          -[WiFiIDSSyncEngine updateBssidGuessingDictForBssid:guessingFailureCountDict:forNetworkSsid:](self, "updateBssidGuessingDictForBssid:guessingFailureCountDict:forNetworkSsid:", v15, v18, v6);
        if (v16)
          -[WiFiIDSSyncEngine updateBssidGuessingDictForBssid:guessingFailureCountDict:forNetworkSsid:](self, "updateBssidGuessingDictForBssid:guessingFailureCountDict:forNetworkSsid:", v16, v18, v6);
        if (v17)
          -[WiFiIDSSyncEngine updateBssidGuessingDictForBssid:guessingFailureCountDict:forNetworkSsid:](self, "updateBssidGuessingDictForBssid:guessingFailureCountDict:forNetworkSsid:", v17, v18, v6);
      }
      else
      {
        v19 = objc_autoreleasePoolPush();
        if (qword_10026DD20)
          objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null guessedBssid1", "-[WiFiIDSSyncEngine addToKnownNetworkGuessingDictionaryTheNetwork:]");
        objc_autoreleasePoolPop(v19);
      }
      return;
    }
    v9 = sub_1000C37A0((CFDictionaryRef *)a3);
    if (v9)
    {
      v10 = v9;
      v21[0] = CFSTR("AuthFlag");
      v21[1] = CFSTR("Password");
      v22[0] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7);
      v22[1] = v10;
      v11 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
      CFRelease(v10);
      goto LABEL_13;
    }
    v20 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: no password for %@", "-[WiFiIDSSyncEngine addToKnownNetworkGuessingDictionaryTheNetwork:]", v6);
    objc_autoreleasePoolPop(v20);
  }
  else
  {
    v12 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null network", "-[WiFiIDSSyncEngine addToKnownNetworkGuessingDictionaryTheNetwork:]");
    objc_autoreleasePoolPop(v12);
  }
}

- (void)removeFromKnownNetworkGuessingDictionaryTheNetwork:(__WiFiNetwork *)a3
{
  const void *v5;
  void *v6;
  const void *v7;
  const void *v8;
  const void *v9;
  const void *v10;
  void *v11;

  if (!a3)
  {
    v11 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null network", "-[WiFiIDSSyncEngine removeFromKnownNetworkGuessingDictionaryTheNetwork:]");
    goto LABEL_19;
  }
  v5 = sub_10002B088(a3);
  v6 = objc_autoreleasePoolPush();
  if (v5)
  {
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: %@", "-[WiFiIDSSyncEngine removeFromKnownNetworkGuessingDictionaryTheNetwork:]", v5);
    objc_autoreleasePoolPop(v6);
    -[NSMutableDictionary removeObjectForKey:](-[WiFiIDSSyncEngine authGuessingDictionary](self, "authGuessingDictionary"), "removeObjectForKey:", v5);
    v7 = sub_10002BE64((uint64_t)a3, CFSTR("GUESSED_2ghzBSSID1"));
    if (v7)
    {
      -[NSMutableDictionary removeObjectForKey:](-[WiFiIDSSyncEngine bssidGuessingDictionary](self, "bssidGuessingDictionary"), "removeObjectForKey:", v7);
      v8 = sub_10002BE64((uint64_t)a3, CFSTR("GUESSED_2ghzBSSID2"));
      if (v8)
        -[NSMutableDictionary removeObjectForKey:](-[WiFiIDSSyncEngine bssidGuessingDictionary](self, "bssidGuessingDictionary"), "removeObjectForKey:", v8);
      v9 = sub_10002BE64((uint64_t)a3, CFSTR("GUESSED_2ghzBSSID3"));
      if (v9)
        -[NSMutableDictionary removeObjectForKey:](-[WiFiIDSSyncEngine bssidGuessingDictionary](self, "bssidGuessingDictionary"), "removeObjectForKey:", v9);
      v10 = sub_10002BE64((uint64_t)a3, CFSTR("GUESSED_2ghzBSSID4"));
      if (v10)
        -[NSMutableDictionary removeObjectForKey:](-[WiFiIDSSyncEngine bssidGuessingDictionary](self, "bssidGuessingDictionary"), "removeObjectForKey:", v10);
      return;
    }
    v11 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null guessedBssid1", "-[WiFiIDSSyncEngine removeFromKnownNetworkGuessingDictionaryTheNetwork:]");
LABEL_19:
    objc_autoreleasePoolPop(v11);
    return;
  }
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null network", "-[WiFiIDSSyncEngine removeFromKnownNetworkGuessingDictionaryTheNetwork:]");
  objc_autoreleasePoolPop(v6);
}

- (unsigned)canAttemptAssociationBasedOnBssidGuessingForScannedNetwork:(__WiFiNetwork *)a3
{
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  unsigned int v21;
  const __CFString *v22;
  const __CFString *v23;
  _WORD *v24;
  const void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const __CFString *v32;
  const void *v33;

  if (!a3)
  {
    v11 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null scanned network", "-[WiFiIDSSyncEngine canAttemptAssociationBasedOnBssidGuessingForScannedNetwork:]", v29, v30);
    goto LABEL_14;
  }
  v5 = sub_10002B088(a3);
  if (!v5)
  {
    v11 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null scanned network ssid", "-[WiFiIDSSyncEngine canAttemptAssociationBasedOnBssidGuessingForScannedNetwork:]", v29, v30);
    goto LABEL_14;
  }
  v6 = v5;
  v7 = sub_10002BE64((uint64_t)a3, CFSTR("BSSID"));
  if (!v7)
  {
    v11 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null scanned network bssid", "-[WiFiIDSSyncEngine canAttemptAssociationBasedOnBssidGuessingForScannedNetwork:]", v29, v30);
    goto LABEL_14;
  }
  v8 = v7;
  if (!-[WiFiIDSSyncEngine isNetworkKnown:](self, "isNetworkKnown:", v6))
  {
    v13 = -[NSMutableDictionary valueForKey:](-[WiFiIDSSyncEngine bssidGuessingDictionary](self, "bssidGuessingDictionary"), "valueForKey:", v8);
    if (!v13)
    {
      v9 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: %@: null bssidGuessingDictionary", "-[WiFiIDSSyncEngine canAttemptAssociationBasedOnBssidGuessingForScannedNetwork:]", v6);
      goto LABEL_7;
    }
    v14 = v13;
    v15 = objc_msgSend(v13, "valueForKey:", CFSTR("5GhzSsid"));
    if (v15)
    {
      v16 = v15;
      v17 = objc_msgSend(v14, "valueForKey:", CFSTR("GuessingFailureCount"));
      if (!v17 || (int)objc_msgSend(v17, "intValue") < 5)
      {
        v18 = -[NSMutableDictionary objectForKey:](-[WiFiIDSSyncEngine authGuessingDictionary](self, "authGuessingDictionary"), "objectForKey:", v16);
        if (v18)
        {
          v19 = v18;
          v20 = objc_msgSend(v18, "valueForKey:", CFSTR("AuthFlag"));
          if (v20)
          {
            v21 = objc_msgSend(v20, "unsignedIntegerValue");
            if (sub_1000C5C14((uint64_t)a3) == v21)
            {
              if (!v21)
                return 0;
              v22 = (const __CFString *)objc_msgSend(v19, "valueForKey:", CFSTR("Password"));
              if (v22)
              {
                v23 = v22;
                v32 = CFSTR("SSID_STR");
                v33 = v6;
                v24 = sub_10002B314((uint64_t)kCFAllocatorDefault, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
                if (v24)
                {
                  v25 = v24;
                  if (sub_1000C66B0((CFDictionaryRef *)a3))
                  {
                    v26 = objc_autoreleasePoolPush();
                    if (qword_10026DD20)
                      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Password is already available for scanned network [%@]", "-[WiFiIDSSyncEngine canAttemptAssociationBasedOnBssidGuessingForScannedNetwork:]", sub_10002B088(a3), v30, v31);
                  }
                  else
                  {
                    v28 = sub_1000C64F0(v25, v23);
                    v26 = objc_autoreleasePoolPush();
                    if (!v28)
                    {
                      if (qword_10026DD20)
                        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: %@[%@]: failed to set password", "-[WiFiIDSSyncEngine canAttemptAssociationBasedOnBssidGuessingForScannedNetwork:]", v16, v8);
                      objc_autoreleasePoolPop(v26);
                      CFRelease(v25);
                      return 0;
                    }
                    if (qword_10026DD20)
                      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: 2Ghz scanned network[%@] has a matching known 5Ghz network [%@]. Using password from [%@]", "-[WiFiIDSSyncEngine canAttemptAssociationBasedOnBssidGuessingForScannedNetwork:]", v6, v16, v16);
                  }
                  objc_autoreleasePoolPop(v26);
                  CFRelease(v25);
                  return 1;
                }
                v11 = objc_autoreleasePoolPush();
                if (qword_10026DD20)
                  objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: %@[%@]: failed to create network ref", "-[WiFiIDSSyncEngine canAttemptAssociationBasedOnBssidGuessingForScannedNetwork:]", v16, v8);
              }
              else
              {
                v11 = objc_autoreleasePoolPush();
                if (qword_10026DD20)
                  objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: %@[%@]: password not found", "-[WiFiIDSSyncEngine canAttemptAssociationBasedOnBssidGuessingForScannedNetwork:]", v16, v8);
              }
              goto LABEL_14;
            }
            v27 = objc_autoreleasePoolPush();
            if (qword_10026DD20)
              objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: %@ - %@: auth mismatch", "-[WiFiIDSSyncEngine canAttemptAssociationBasedOnBssidGuessingForScannedNetwork:]", v6, v16);
          }
          else
          {
            v27 = objc_autoreleasePoolPush();
            if (qword_10026DD20)
              objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: %@ - %@: null auth", "-[WiFiIDSSyncEngine canAttemptAssociationBasedOnBssidGuessingForScannedNetwork:]", v6, v16);
          }
        }
        else
        {
          v27 = objc_autoreleasePoolPush();
          if (qword_10026DD20)
            objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: %@ - %@: null authGuessingDictionary", "-[WiFiIDSSyncEngine canAttemptAssociationBasedOnBssidGuessingForScannedNetwork:]", v6, v16);
        }
        v10 = v27;
        goto LABEL_15;
      }
      v11 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: %@[%@]: reached max failed attempts", "-[WiFiIDSSyncEngine canAttemptAssociationBasedOnBssidGuessingForScannedNetwork:]", v16, v8);
    }
    else
    {
      v11 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: invalid 5ghzSsid", "-[WiFiIDSSyncEngine canAttemptAssociationBasedOnBssidGuessingForScannedNetwork:]", v29, v30);
    }
LABEL_14:
    v10 = v11;
    goto LABEL_15;
  }
  v9 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: scanned [%@] is a known network", "-[WiFiIDSSyncEngine canAttemptAssociationBasedOnBssidGuessingForScannedNetwork:]", v6);
LABEL_7:
  v10 = v9;
LABEL_15:
  objc_autoreleasePoolPop(v10);
  return 0;
}

- (unsigned)isNetworkKnown:(id)a3
{
  void *v4;

  if (a3)
    return -[NSMutableDictionary objectForKey:](-[WiFiIDSSyncEngine authGuessingDictionary](self, "authGuessingDictionary"), "objectForKey:", a3) != 0;
  v4 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: invalid ssid", "-[WiFiIDSSyncEngine isNetworkKnown:]");
  objc_autoreleasePoolPop(v4);
  return 0;
}

- (void)incrementGuessingFailedCountForScannedNetworkWithBssid:(id)a3
{
  id v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  id v10;
  unsigned int v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[2];

  if (!a3)
  {
    v13 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: invalid bssid", "-[WiFiIDSSyncEngine incrementGuessingFailedCountForScannedNetworkWithBssid:]");
    goto LABEL_13;
  }
  v5 = -[NSMutableDictionary valueForKey:](-[WiFiIDSSyncEngine bssidGuessingDictionary](self, "bssidGuessingDictionary"), "valueForKey:", a3);
  if (!v5)
  {
    v13 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null bssidGuessingDictionary", "-[WiFiIDSSyncEngine incrementGuessingFailedCountForScannedNetworkWithBssid:]");
    goto LABEL_13;
  }
  v6 = v5;
  v7 = (const __CFString *)objc_msgSend(v5, "valueForKey:", CFSTR("5GhzSsid"));
  if (!v7)
  {
    v13 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null known5ghzSsid", "-[WiFiIDSSyncEngine incrementGuessingFailedCountForScannedNetworkWithBssid:]");
LABEL_13:
    objc_autoreleasePoolPop(v13);
    return;
  }
  v8 = v7;
  v9 = objc_msgSend(objc_msgSend(v6, "valueForKey:", CFSTR("GuessingFailureCount")), "unsignedIntegerValue")+ 1;
  v10 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedInt:", v9);
  v14[0] = CFSTR("5GhzSsid");
  v14[1] = CFSTR("GuessingFailureCount");
  v15[0] = v8;
  v15[1] = v10;
  -[NSMutableDictionary setValue:forKey:](-[WiFiIDSSyncEngine bssidGuessingDictionary](self, "bssidGuessingDictionary"), "setValue:forKey:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 2), a3);
  v11 = sub_10009B5C0(-[WiFiIDSSyncEngine manager](self, "manager"), v8, a3, v10);
  v12 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: %@[%@]: update guessing failure count to %d, status:%d", "-[WiFiIDSSyncEngine incrementGuessingFailedCountForScannedNetworkWithBssid:]", a3, v8, v9, v11);
  objc_autoreleasePoolPop(v12);

}

- (id)getCorresponding5GhzSsidInPlistFor2GhzNetwork:(__WiFiNetwork *)a3
{
  id result;
  id v5;

  result = (id)sub_10002BE64((uint64_t)a3, CFSTR("BSSID"));
  if (result)
  {
    result = objc_msgSend(-[NSMutableDictionary valueForKey:](-[WiFiIDSSyncEngine bssidGuessingDictionary](self, "bssidGuessingDictionary"), "valueForKey:", result), "valueForKey:", CFSTR("5GhzSsid"));
    if (result)
    {
      v5 = result;
      if (-[NSMutableDictionary objectForKey:](-[WiFiIDSSyncEngine authGuessingDictionary](self, "authGuessingDictionary"), "objectForKey:", result))
      {
        return v5;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

- (IDSService)idsService
{
  return self->_idsService;
}

- (void)setIdsService:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (OS_dispatch_queue)managerQueue
{
  return self->_managerQueue;
}

- (void)setManagerQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (OS_dispatch_queue)serialIdsDispatchQ
{
  return self->_serialIdsDispatchQ;
}

- (void)setSerialIdsDispatchQ:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (__WiFiManager)manager
{
  return self->_manager;
}

- (void)setManager:(__WiFiManager *)a3
{
  self->_manager = a3;
}

- (int64_t)role
{
  return self->_role;
}

- (void)setRole:(int64_t)a3
{
  self->_role = a3;
}

- (__WiFiNetwork)currentNetwork
{
  return self->_currentNetwork;
}

- (void)setCurrentNetwork:(__WiFiNetwork *)a3
{
  self->_currentNetwork = a3;
}

- (NSArray)knownNetworks
{
  return self->_knownNetworks;
}

- (void)setKnownNetworks:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSArray)receivedKnownNetworks
{
  return self->_receivedKnownNetworks;
}

- (void)setReceivedKnownNetworks:(id)a3
{
  self->_receivedKnownNetworks = (NSArray *)a3;
}

- (NSDictionary)receivedKnownNetworksAdded
{
  return self->_receivedKnownNetworksAdded;
}

- (void)setReceivedKnownNetworksAdded:(id)a3
{
  self->_receivedKnownNetworksAdded = (NSDictionary *)a3;
}

- (NSDictionary)receivedKnownNetworksRemoved
{
  return self->_receivedKnownNetworksRemoved;
}

- (void)setReceivedKnownNetworksRemoved:(id)a3
{
  self->_receivedKnownNetworksRemoved = (NSDictionary *)a3;
}

- (NSDictionary)receivedKnownNetworksUpdated
{
  return self->_receivedKnownNetworksUpdated;
}

- (void)setReceivedKnownNetworksUpdated:(id)a3
{
  self->_receivedKnownNetworksUpdated = (NSDictionary *)a3;
}

- (BOOL)isWaitingForIdsMessageDelivery
{
  return self->_isWaitingForIdsMessageDelivery;
}

- (void)setIsWaitingForIdsMessageDelivery:(BOOL)a3
{
  self->_isWaitingForIdsMessageDelivery = a3;
}

- (BOOL)isWaitingForIdsSendResponse
{
  return self->_isWaitingForIdsSendResponse;
}

- (void)setIsWaitingForIdsSendResponse:(BOOL)a3
{
  self->_isWaitingForIdsSendResponse = a3;
}

- (unint64_t)reSendIdsMessageBitMap
{
  return self->_reSendIdsMessageBitMap;
}

- (void)setReSendIdsMessageBitMap:(unint64_t)a3
{
  self->_reSendIdsMessageBitMap = a3;
}

- (NSString)pairedDeviceDestinationID
{
  return self->_pairedDeviceDestinationID;
}

- (void)setPairedDeviceDestinationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)pairedDeviceVersionID
{
  return self->_pairedDeviceVersionID;
}

- (void)setPairedDeviceVersionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSTimer)coalesceKnownNetworksSyncTimer
{
  return self->_coalesceKnownNetworksSyncTimer;
}

- (void)setCoalesceKnownNetworksSyncTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (NSTimer)waitForReAssociationTimer
{
  return self->_waitForReAssociationTimer;
}

- (void)setWaitForReAssociationTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (NSData)lastSyncedKnownNetworksData
{
  return self->_lastSyncedKnownNetworksData;
}

- (void)setLastSyncedKnownNetworksData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (NSData)lastSyncedKnownNetworkPayloadData
{
  return self->_lastSyncedKnownNetworkPayloadData;
}

- (void)setLastSyncedKnownNetworkPayloadData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (NSData)lastSyncedCompanionAssistedAutoJoinData
{
  return self->_lastSyncedCompanionAssistedAutoJoinData;
}

- (void)setLastSyncedCompanionAssistedAutoJoinData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (NSData)lastSyncedCompanionLocaleData
{
  return self->_lastSyncedCompanionLocaleData;
}

- (void)setLastSyncedCompanionLocaleData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

- (NSString)lastSyncedKnownNetworksDataGUID
{
  return self->_lastSyncedKnownNetworksDataGUID;
}

- (void)setLastSyncedKnownNetworksDataGUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 176);
}

- (NSString)lastSyncedKnownNetworkPayloadDataGUID
{
  return self->_lastSyncedKnownNetworkPayloadDataGUID;
}

- (void)setLastSyncedKnownNetworkPayloadDataGUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 184);
}

- (NSString)lastSyncedCompanionAssistedAutoJoinDataGUID
{
  return self->_lastSyncedCompanionAssistedAutoJoinDataGUID;
}

- (void)setLastSyncedCompanionAssistedAutoJoinDataGUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 192);
}

- (NSString)lastSyncedCompanionLocaleGUID
{
  return self->_lastSyncedCompanionLocaleGUID;
}

- (void)setLastSyncedCompanionLocaleGUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 200);
}

- (NSString)countryCodeStr
{
  return self->_countryCodeStr;
}

- (void)setCountryCodeStr:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 208);
}

- (unint64_t)idsSendFailureCount
{
  return self->_idsSendFailureCount;
}

- (void)setIdsSendFailureCount:(unint64_t)a3
{
  self->_idsSendFailureCount = a3;
}

- (BOOL)isKeychainUnlocked
{
  return self->_isKeychainUnlocked;
}

- (void)setIsKeychainUnlocked:(BOOL)a3
{
  self->_isKeychainUnlocked = a3;
}

- (id)stateChangeCallback
{
  return self->_stateChangeCallback;
}

- (void)setStateChangeCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (void)stateChangeContext
{
  return self->_stateChangeContext;
}

- (void)setStateChangeContext:(void *)a3
{
  self->_stateChangeContext = a3;
}

- (int)connectionState
{
  return self->_connectionState;
}

- (void)setConnectionState:(int)a3
{
  self->_connectionState = a3;
}

- (NSMutableDictionary)bssidGuessingDictionary
{
  return self->_bssidGuessingDictionary;
}

- (void)setBssidGuessingDictionary:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 240);
}

- (NSMutableDictionary)authGuessingDictionary
{
  return self->_authGuessingDictionary;
}

- (void)setAuthGuessingDictionary:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 248);
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 256);
}

- (NSArray)knownNetworkList
{
  return self->_knownNetworkList;
}

- (void)setKnownNetworkList:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 264);
}

- (NSArray)latestReceivedNetworkRecords
{
  return self->_latestReceivedNetworkRecords;
}

- (void)setLatestReceivedNetworkRecords:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 272);
}

- (unint64_t)knownNetworkStartPoint
{
  return self->_knownNetworkStartPoint;
}

- (void)setKnownNetworkStartPoint:(unint64_t)a3
{
  self->_knownNetworkStartPoint = a3;
}

@end
