@implementation MSDIDSHandler

- (MSDIDSHandler)initWithDelegate:(id)a3
{
  id v5;
  MSDIDSHandler *v6;
  id v7;
  void *v9;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MSDIDSHandler;
  v6 = -[MSDIDSHandler init](&v10, "init");
  if (v6)
  {
    v7 = objc_alloc_init((Class)NSMutableDictionary);
    -[MSDIDSHandler setResponseHandlers:](v6, "setResponseHandlers:", v7);

    if ((objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL___MSDIDSHandlerDelegate) & 1) == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("MSDIDSHandler.m"), 48, CFSTR("Delegate does not conform to MSDIDSHandlerDelegate protocol."));

    }
    -[MSDIDSHandler setDelegate:](v6, "setDelegate:", v5);
    -[MSDIDSHandler setIsDeviceReachable:](v6, "setIsDeviceReachable:", 1);
  }

  return v6;
}

- (void)start
{
  id v3;
  dispatch_queue_t v4;
  void *v5;
  id v6;

  v3 = objc_msgSend(objc_alloc((Class)IDSService), "initWithService:", CFSTR("com.apple.private.alloy.mobilestoredemo"));
  -[MSDIDSHandler setIdsService:](self, "setIdsService:", v3);

  v4 = dispatch_queue_create("com.apple.msdidsservicequeue", 0);
  -[MSDIDSHandler setIdsServiceQueue:](self, "setIdsServiceQueue:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[MSDIDSHandler getPairedDevice](self, "getPairedDevice"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDIDSHandler delegate](self, "delegate"));
  objc_msgSend(v5, "didUpdateDeviceReachability:", objc_msgSend(v6, "isConnected"));

}

- (BOOL)sendAck:(BOOL)a3 forRequest:(id)a4 andMessageType:(unsigned __int16)a5 completionHandler:(id)a6
{
  uint64_t v6;
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  void *v13;

  v6 = a5;
  v8 = a3;
  v10 = a6;
  v11 = a4;
  v12 = objc_alloc_init((Class)NSMutableDictionary);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v8));
  objc_msgSend(v12, "setObject:forKey:", v13, CFSTR("RequestResult"));

  LOBYTE(v6) = -[MSDIDSHandler sendResponseMessageOfType:withPayload:forRequest:andCompletionHandler:](self, "sendResponseMessageOfType:withPayload:forRequest:andCompletionHandler:", v6, v12, v11, v10);
  return v6;
}

- (BOOL)sendRequestMessageOfType:(unsigned __int16)a3 withPayload:(id)a4 andResponseHandler:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  MSDIDSHandler *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  id v25;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[3];
  _QWORD v34[3];
  uint8_t buf[4];
  uint64_t v36;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v10 = sub_1000604F0();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v36 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "About to send request of type: %ld to paired device.", buf, 0xCu);
  }

  v28 = v8;
  if (v8)
  {
    v32 = 0;
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v8, 0, &v32));
    v12 = v32;
  }
  else
  {
    v12 = 0;
  }
  v29 = v8;
  v13 = objc_msgSend(objc_alloc((Class)IDSProtobuf), "initWithProtobufData:type:isResponse:", v8, v6, 0);
  v14 = objc_alloc((Class)NSMutableDictionary);
  v33[0] = IDSSendMessageOptionTimeoutKey;
  v33[1] = IDSSendMessageOptionForceLocalDeliveryKey;
  v34[0] = &off_10014D880;
  v34[1] = &__kCFBooleanTrue;
  v33[2] = IDSSendMessageOptionFireAndForgetKey;
  v34[2] = &__kCFBooleanTrue;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 3));
  v16 = objc_msgSend(v14, "initWithDictionary:", v15);

  if (v9)
    objc_msgSend(v16, "setObject:forKey:", &__kCFBooleanTrue, IDSSendMessageOptionExpectsPeerResponseKey);
  v17 = self;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDIDSHandler idsService](self, "idsService"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", IDSDefaultPairedDevice));
  v30 = v12;
  v31 = 0;
  v20 = objc_msgSend(v18, "sendProtobuf:toDestinations:priority:options:identifier:error:", v13, v19, 300, v16, &v31, &v30);
  v21 = v31;
  v22 = v30;

  if ((v20 & 1) == 0)
  {
    v27 = sub_1000604F0();
    v24 = objc_claimAutoreleasedReturnValue(v27);
    v23 = v28;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_1000BD0C8((uint64_t)v21, (uint64_t)v22, v24);
    goto LABEL_11;
  }
  v23 = v28;
  if (v9)
  {
    v24 = objc_claimAutoreleasedReturnValue(-[MSDIDSHandler responseHandlers](v17, "responseHandlers"));
    v25 = objc_retainBlock(v9);
    -[NSObject setObject:forKey:](v24, "setObject:forKey:", v25, v21);

LABEL_11:
  }

  return v20;
}

- (BOOL)sendResponseMessageOfType:(unsigned __int16)a3 withPayload:(id)a4 forRequest:(id)a5 andCompletionHandler:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  MSDIDSHandler *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[5];
  _QWORD v39[5];
  uint8_t buf[4];
  uint64_t v41;

  v8 = a3;
  v10 = a4;
  v11 = a5;
  v34 = a6;
  v12 = sub_1000604F0();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v41 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "About to send response of type: %ld to paired device.", buf, 0xCu);
  }

  v32 = v10;
  if (v10)
  {
    v37 = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v10, 0, &v37));
    v15 = v37;
  }
  else
  {
    v14 = 0;
    v15 = 0;
  }
  v16 = objc_msgSend(objc_alloc((Class)IDSProtobuf), "initWithProtobufData:type:isResponse:", v14, v8, 1);
  v17 = objc_alloc((Class)NSMutableDictionary);
  v38[0] = IDSSendMessageOptionTimeoutKey;
  v38[1] = IDSSendMessageOptionForceLocalDeliveryKey;
  v39[0] = &off_10014D880;
  v39[1] = &__kCFBooleanTrue;
  v38[2] = IDSSendMessageOptionFireAndForgetKey;
  v38[3] = IDSSendMessageOptionPeerResponseIdentifierKey;
  v39[2] = &__kCFBooleanTrue;
  v39[3] = v11;
  v33 = v11;
  v38[4] = IDSSendMessageOptionWantsClientAcknowledgementKey;
  v39[4] = &__kCFBooleanTrue;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v39, v38, 5));
  v19 = objc_msgSend(v17, "initWithDictionary:", v18);

  v20 = self;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MSDIDSHandler idsService](self, "idsService"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", IDSDefaultPairedDevice));
  v35 = v15;
  v36 = 0;
  v23 = objc_msgSend(v21, "sendProtobuf:toDestinations:priority:options:identifier:error:", v16, v22, 300, v19, &v36, &v35);
  v24 = v36;
  v25 = v35;

  if ((v23 & 1) == 0)
  {
    v31 = sub_1000604F0();
    v28 = objc_claimAutoreleasedReturnValue(v31);
    v26 = v32;
    v27 = v34;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_1000BD144((uint64_t)v24, v25, v28);
    goto LABEL_9;
  }
  v26 = v32;
  v27 = v34;
  if (v34)
  {
    v28 = objc_claimAutoreleasedReturnValue(-[MSDIDSHandler responseHandlers](v20, "responseHandlers"));
    v29 = objc_retainBlock(v34);
    -[NSObject setObject:forKey:](v28, "setObject:forKey:", v29, v24);

    v27 = v34;
LABEL_9:

  }
  return v23;
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD);
  void *v16;

  v10 = a5;
  v11 = a7;
  if (!a6)
  {
    v12 = sub_1000604F0();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000BD1D0((uint64_t)v10, v11, v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDIDSHandler responseHandlers](self, "responseHandlers"));
    v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v10));

    if (v15)
    {
      v15[2](v15, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDIDSHandler responseHandlers](self, "responseHandlers"));
      objc_msgSend(v16, "removeObjectForKey:", v10);

    }
  }

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  id v10;

  v10 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDIDSHandler responseHandlers](self, "responseHandlers"));
  v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v10));

  if (v8)
  {
    v8[2](v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDIDSHandler responseHandlers](self, "responseHandlers"));
    objc_msgSend(v9, "removeObjectForKey:", v10);

  }
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  unsigned int v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[MSDIDSHandler getPairedDevice](self, "getPairedDevice", a3, a4));
  v5 = objc_msgSend(v7, "isConnected");
  if (v5 != -[MSDIDSHandler isDeviceReachable](self, "isDeviceReachable"))
  {
    -[MSDIDSHandler setIsDeviceReachable:](self, "setIsDeviceReachable:", objc_msgSend(v7, "isConnected"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDIDSHandler delegate](self, "delegate"));
    objc_msgSend(v6, "didUpdateDeviceReachability:", -[MSDIDSHandler isDeviceReachable](self, "isDeviceReachable"));

  }
}

- (id)getPairedDevice
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDIDSHandler idsService](self, "idsService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "devices"));

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "isDefaultPairedDevice", (_QWORD)v10))
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (IDSService)idsService
{
  return self->_idsService;
}

- (void)setIdsService:(id)a3
{
  objc_storeStrong((id *)&self->_idsService, a3);
}

- (OS_dispatch_queue)idsServiceQueue
{
  return self->_idsServiceQueue;
}

- (void)setIdsServiceQueue:(id)a3
{
  objc_storeStrong((id *)&self->_idsServiceQueue, a3);
}

- (NSMutableDictionary)responseHandlers
{
  return self->_responseHandlers;
}

- (void)setResponseHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_responseHandlers, a3);
}

- (MSDIDSHandlerDelegate)delegate
{
  return (MSDIDSHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isDeviceReachable
{
  return self->_isDeviceReachable;
}

- (void)setIsDeviceReachable:(BOOL)a3
{
  self->_isDeviceReachable = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_responseHandlers, 0);
  objc_storeStrong((id *)&self->_idsServiceQueue, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
}

@end
