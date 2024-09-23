@implementation BMRapportClient

- (id)_initWithType:(unint64_t)a3 controlFlags:(unint64_t)a4 serviceName:(id)a5 queue:(id)a6
{
  id v11;
  id v12;
  BMRapportClient *v13;
  BMRapportClient *v14;
  NSMutableArray *v15;
  NSMutableArray *activationHandlers;
  objc_super v18;

  v11 = a5;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)BMRapportClient;
  v13 = -[BMRapportClient init](&v18, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_queue, a6);
    v14->_type = a3;
    v14->_state = 0;
    v14->_controlFlags = a4;
    objc_storeStrong((id *)&v14->_serviceName, a5);
    v15 = objc_opt_new(NSMutableArray);
    activationHandlers = v14->_activationHandlers;
    v14->_activationHandlers = v15;

  }
  return v14;
}

+ (id)clientForHandlingRequestsWithServiceName:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)a1), "_initWithType:controlFlags:serviceName:queue:", 1, 0, v7, v6);

  if (v8)
  {
    v9 = (void *)v8[8];
    v8[8] = CFSTR("RequestHandler");

  }
  return v8;
}

+ (id)clientForSameAccountDiscoveryWithServiceName:(id)a3 delegate:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id *v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = objc_alloc((Class)a1);
  v13 = (id *)objc_msgSend(v11, "_initWithType:controlFlags:serviceName:queue:", 0, objc_msgSend((id)objc_opt_class(a1, v12), "controlFlagsForSameAccountDiscovery"), v10, v9);

  if (v13)
  {
    objc_storeWeak(v13 + 6, v8);
    v14 = v13[8];
    v13[8] = CFSTR("DiscoverySameAccount");

  }
  return v13;
}

+ (id)clientForSharedHomeDiscoveryWithServiceName:(id)a3 delegate:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v12 = objc_msgSend((id)objc_opt_class(a1, v11), "controlFlagsForSharedHomeDiscovery");
  if (v12)
  {
    v13 = objc_msgSend(objc_alloc((Class)a1), "_initWithType:controlFlags:serviceName:queue:", 0, v12, v8, v10);
    v14 = v13;
    if (v13)
    {
      objc_storeWeak((id *)v13 + 6, v9);
      v15 = (void *)v14[8];
      v14[8] = CFSTR("DiscoverySharedHome");

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)clientForCommunicatingWithDevice:(id)a3 serviceName:(id)a4 queue:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;

  v9 = a3;
  v10 = a5;
  v11 = a4;
  v12 = objc_alloc((Class)a1);
  v14 = (id *)objc_msgSend(v12, "_initWithType:controlFlags:serviceName:queue:", 2, objc_msgSend((id)objc_opt_class(a1, v13), "controlFlagsForMessagingDevice:", v9), v11, v10);

  if (v14)
  {
    objc_storeStrong(v14 + 11, a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bm_companionLinkDeviceIdentifier"));
    if ((unint64_t)objc_msgSend(v15, "length") <= 8)
    {
      v16 = v14[8];
      v14[8] = CFSTR("UnknownDevice");
    }
    else
    {
      v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bm_companionLinkDeviceIdentifier"));
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "substringToIndex:", 8));
      v18 = v14[8];
      v14[8] = (id)v17;

    }
  }

  return v14;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_activationHandlers, 0);
  objc_storeStrong((id *)&self->_destinationDevice, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_loggingIdentifier, 0);
  objc_storeStrong((id *)&self->_outstandingResponseHandlers, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_registeredRequests, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  NSString *loggingIdentifier;
  NSMutableArray *activationHandlers;
  id v9;
  NSMutableArray *v10;
  id v11;
  void *v12;
  void *v13;
  NSErrorUserInfoKey v14;
  const __CFString *v15;
  uint8_t buf[4];
  NSString *v17;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = __biome_log_for_category(11);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    loggingIdentifier = self->_loggingIdentifier;
    *(_DWORD *)buf = 138412290;
    v17 = loggingIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "BMRapportClient[%@]: activate", buf, 0xCu);
  }

  switch(self->_state)
  {
    case 0uLL:
      if (v4)
      {
        activationHandlers = self->_activationHandlers;
        v9 = objc_retainBlock(v4);
        -[NSMutableArray addObject:](activationHandlers, "addObject:", v9);

      }
      -[BMRapportClient _createAndActivateCompanionLinkClient](self, "_createAndActivateCompanionLinkClient");
      break;
    case 1uLL:
      if (v4)
      {
        v10 = self->_activationHandlers;
        v11 = objc_retainBlock(v4);
        -[NSMutableArray addObject:](v10, "addObject:", v11);

      }
      break;
    case 2uLL:
      if (v4)
        (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
      break;
    case 3uLL:
      if (v4)
      {
        v14 = NSLocalizedDescriptionKey;
        v15 = CFSTR("BMRapportClient has been invalidated");
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BMRapportErrorDomain"), 4, v12));
        (*((void (**)(id, void *))v4 + 2))(v4, v13);

      }
      break;
    default:
      break;
  }

}

- (void)invalidate
{
  uint64_t v3;
  NSObject *v4;
  NSString *loggingIdentifier;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  NSErrorUserInfoKey v20;
  const __CFString *v21;
  uint8_t v22[128];
  uint8_t buf[4];
  NSString *v24;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_state != 3)
  {
    v3 = __biome_log_for_category(11);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      loggingIdentifier = self->_loggingIdentifier;
      *(_DWORD *)buf = 138412290;
      v24 = loggingIdentifier;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "BMRapportClient[%@]: invalidate", buf, 0xCu);
    }

    self->_state = 3;
    -[RPCompanionLinkClient setDeviceChangedHandler:](self->_client, "setDeviceChangedHandler:", 0);
    -[RPCompanionLinkClient setDeviceFoundHandler:](self->_client, "setDeviceFoundHandler:", 0);
    -[RPCompanionLinkClient setDeviceLostHandler:](self->_client, "setDeviceLostHandler:", 0);
    -[RPCompanionLinkClient setDisconnectHandler:](self->_client, "setDisconnectHandler:", 0);
    -[RPCompanionLinkClient setErrorFlagsChangedHandler:](self->_client, "setErrorFlagsChangedHandler:", 0);
    -[RPCompanionLinkClient setInterruptionHandler:](self->_client, "setInterruptionHandler:", 0);
    -[RPCompanionLinkClient setInvalidationHandler:](self->_client, "setInvalidationHandler:", 0);
    -[RPCompanionLinkClient setLocalDeviceUpdatedHandler:](self->_client, "setLocalDeviceUpdatedHandler:", 0);
    -[RPCompanionLinkClient setStateUpdatedHandler:](self->_client, "setStateUpdatedHandler:", 0);
    if (self->_type == 1)
      -[BMRapportClient _deregisterRequests](self, "_deregisterRequests");
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_outstandingResponseHandlers, "allValues", self));
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v9);
          v20 = NSLocalizedDescriptionKey;
          v21 = CFSTR("Rapport client invalidated");
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BMRapportErrorDomain"), 4, v11));
          (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v10 + 16))(v10, 0, 0, v12);

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      }
      while (v7);
    }

    objc_msgSend(*(id *)(v14 + 56), "removeAllObjects");
    objc_msgSend(*(id *)(v14 + 32), "invalidate");
    v13 = *(_QWORD *)(v14 + 104);
    if (v13)
      (*(void (**)(void))(v13 + 16))();
  }
}

- (void)_companionLinkClientActivatedWithError:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_state != 3)
  {
    if (v4)
      -[BMRapportClient invalidate](self, "invalidate");
    else
      self->_state = 2;
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = self->_activationHandlers;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9));
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

    -[NSMutableArray removeAllObjects](self->_activationHandlers, "removeAllObjects", (_QWORD)v10);
  }

}

- (void)_companionLinkClientInvalidated
{
  uint64_t v3;
  NSObject *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_state != 3)
  {
    v3 = __biome_log_for_category(11);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_100041290((uint64_t)self, v4);

    -[BMRapportClient invalidate](self, "invalidate");
  }
}

- (void)_createAndActivateCompanionLinkClient
{
  uint64_t v3;
  NSObject *v4;
  RPCompanionLinkClient *v5;
  RPCompanionLinkClient *client;
  unint64_t type;
  RPCompanionLinkClient *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_state)
  {
    v3 = __biome_log_for_category(11);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      sub_100041308((uint64_t)self, v4);

  }
  else
  {
    self->_state = 1;
    v5 = (RPCompanionLinkClient *)objc_alloc_init((Class)RPCompanionLinkClient);
    client = self->_client;
    self->_client = v5;

    -[RPCompanionLinkClient setDispatchQueue:](self->_client, "setDispatchQueue:", self->_queue);
    -[RPCompanionLinkClient setControlFlags:](self->_client, "setControlFlags:", self->_controlFlags);
    if (self->_type - 1 <= 1)
      -[RPCompanionLinkClient setServiceType:](self->_client, "setServiceType:", self->_serviceName);
    if (self->_destinationDevice)
      -[RPCompanionLinkClient setDestinationDevice:](self->_client, "setDestinationDevice:");
    objc_initWeak(&location, self);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100005FC0;
    v15[3] = &unk_100068A28;
    objc_copyWeak(&v16, &location);
    -[RPCompanionLinkClient setInvalidationHandler:](self->_client, "setInvalidationHandler:", v15);
    type = self->_type;
    if (!type)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100005FEC;
      v13[3] = &unk_100068A50;
      objc_copyWeak(&v14, &location);
      -[RPCompanionLinkClient setDeviceFoundHandler:](self->_client, "setDeviceFoundHandler:", v13);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100006034;
      v11[3] = &unk_100068A50;
      objc_copyWeak(&v12, &location);
      -[RPCompanionLinkClient setDeviceLostHandler:](self->_client, "setDeviceLostHandler:", v11);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&v14);
      type = self->_type;
    }
    if (type == 1)
      -[BMRapportClient _registerRequests](self, "_registerRequests");
    v8 = self->_client;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000607C;
    v9[3] = &unk_100068A78;
    objc_copyWeak(&v10, &location);
    -[RPCompanionLinkClient activateWithCompletion:](v8, "activateWithCompletion:", v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSString *v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *outstandingResponseHandlers;
  void *v18;
  id v19;
  id v20;
  NSString *v21;
  RPCompanionLinkClient *client;
  _QWORD v23[4];
  NSString *v24;
  id v25;
  id v26;
  id v27;
  id location;
  NSErrorUserInfoKey v29;
  const __CFString *v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_state != 3)
  {
    if (v13)
    {
      if (!self->_outstandingResponseHandlers)
      {
        v16 = objc_opt_new(NSMutableDictionary);
        outstandingResponseHandlers = self->_outstandingResponseHandlers;
        self->_outstandingResponseHandlers = v16;

      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v19 = objc_msgSend(v13, "copy");

      v20 = objc_retainBlock(v19);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_outstandingResponseHandlers, "setObject:forKeyedSubscript:", v20, v18);

    }
    else
    {
      v18 = 0;
      v19 = 0;
    }
    v21 = self->_loggingIdentifier;
    objc_initWeak(&location, self);
    client = self->_client;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100010CF8;
    v23[3] = &unk_100068DB8;
    objc_copyWeak(&v27, &location);
    v15 = v21;
    v24 = v15;
    v14 = v18;
    v25 = v14;
    v13 = v19;
    v26 = v13;
    -[RPCompanionLinkClient sendRequestID:request:options:responseHandler:](client, "sendRequestID:request:options:responseHandler:", v10, v11, v12, v23);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
    goto LABEL_10;
  }
  if (v13)
  {
    v29 = NSLocalizedDescriptionKey;
    v30 = CFSTR("Rapport client has been invalidated");
    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
    v15 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BMRapportErrorDomain"), 4, v14));
    (*((void (**)(id, _QWORD, _QWORD, NSString *))v13 + 2))(v13, 0, 0, v15);
LABEL_10:

  }
}

- (void)_handleResponseUUID:(id)a3 response:(id)a4 options:(id)a5 error:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, id, id, id);
  uint64_t v17;
  NSObject *v18;
  NSString *loggingIdentifier;
  id v20;
  uint64_t v21;
  NSString *v22;
  id v23;
  int v24;
  NSString *v25;
  __int16 v26;
  id v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, id, id, id))a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_state == 3)
  {
    v17 = __biome_log_for_category(11);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      loggingIdentifier = self->_loggingIdentifier;
      if (v13)
        v20 = v13;
      else
        v20 = v15;
      v24 = 138412546;
      v25 = loggingIdentifier;
      v26 = 2112;
      v27 = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "BMRapportClient[%@]: Warning: ignoring response arriving after invalidation: %@", (uint8_t *)&v24, 0x16u);
    }
LABEL_12:

    goto LABEL_13;
  }
  if (v12)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_outstandingResponseHandlers, "setObject:forKeyedSubscript:", 0, v12);
  if (!v16)
  {
    v21 = __biome_log_for_category(11);
    v18 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v22 = self->_loggingIdentifier;
      if (v13)
        v23 = v13;
      else
        v23 = v15;
      v24 = 138412546;
      v25 = v22;
      v26 = 2112;
      v27 = v23;
      _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "BMRapportClient[%@]: Warning: ignoring response because no response handler is set: %@", (uint8_t *)&v24, 0x16u);
    }
    goto LABEL_12;
  }
  v16[2](v16, v13, v14, v15);
LABEL_13:

}

- (RPCompanionLinkDevice)localDevice
{
  void *v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_state == 3)
    v3 = 0;
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient localDevice](self->_client, "localDevice"));
  return (RPCompanionLinkDevice *)v3;
}

- (NSArray)activeDevices
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_state == 3)
    return (NSArray *)0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPCompanionLinkClient activeDevices](self->_client, "activeDevices"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100022CA4;
  v6[3] = &unk_100069418;
  v6[4] = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_pas_filteredArrayWithTest:", v6));

  return (NSArray *)v5;
}

- (void)_companionLinkClientDiscoveredDevice:(id)a3
{
  id v4;
  NSObject *WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL4 v9;
  uint64_t v10;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_state != 3)
  {
    if (-[BMRapportClient _validateDevice:](self, "_validateDevice:", v4))
    {
      WeakRetained = objc_loadWeakRetained(&self->_delegate);
      -[NSObject rapportClient:didDiscoverDevice:](WeakRetained, "rapportClient:didDiscoverDevice:", self, v4);
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bm_companionLinkDeviceIdentifier"));

      if (v6)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));

        v8 = __biome_log_for_category(11);
        WeakRetained = objc_claimAutoreleasedReturnValue(v8);
        v9 = os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR);
        if (v7)
        {
          if (v9)
            sub_100042F50();
        }
        else if (v9)
        {
          sub_100042EE0();
        }
      }
      else
      {
        v10 = __biome_log_for_category(11);
        WeakRetained = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
          sub_100042E70();
      }
    }

  }
}

- (void)_companionLinkClientLostDevice:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_state != 3)
  {
    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    objc_msgSend(WeakRetained, "rapportClient:didLoseDevice:", self, v5);

  }
}

- (BOOL)_validateDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bm_companionLinkDeviceIdentifier"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "model"));
    LOBYTE(v4) = v5 != 0;

  }
  return (char)v4;
}

+ (unint64_t)controlFlagsForSameAccountDiscovery
{
  id v2;
  unint64_t result;
  uint64_t v4;
  NSObject *v5;

  v2 = +[BMDeviceMetadataUtils platform](BMDeviceMetadataUtils, "platform");
  result = 38;
  switch((unint64_t)v2)
  {
    case 0uLL:
      v4 = __biome_log_for_category(11);
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        sub_100044030();

      goto LABEL_7;
    case 1uLL:
    case 8uLL:
      result = 6;
      break;
    case 2uLL:
      return result;
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 7uLL:
      result = 4;
      break;
    case 6uLL:
      result = 32;
      break;
    default:
LABEL_7:
      result = 0;
      break;
  }
  return result;
}

+ (unint64_t)controlFlagsForSharedHomeDiscovery
{
  id v2;
  unint64_t result;
  uint64_t v4;
  NSObject *v5;

  v2 = +[BMDeviceMetadataUtils platform](BMDeviceMetadataUtils, "platform");
  result = 2084;
  switch((unint64_t)v2)
  {
    case 0uLL:
    case 6uLL:
      v4 = __biome_log_for_category(11);
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        sub_1000440B0((uint64_t)v2);

      goto LABEL_6;
    case 1uLL:
    case 3uLL:
    case 4uLL:
    case 7uLL:
    case 8uLL:
      result = 2052;
      break;
    case 2uLL:
      return result;
    case 5uLL:
      result = 4;
      break;
    default:
LABEL_6:
      result = 0;
      break;
  }
  return result;
}

+ (unint64_t)controlFlagsForMessagingDevice:(id)a3
{
  void *v3;
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  NSObject *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "model"));
  v4 = BMDevicePlatformFromModelString(v3);

  result = 0;
  switch(v4)
  {
    case 0:
      v6 = __biome_log_for_category(11);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        sub_100044030();

      result = 0;
      break;
    case 3:
    case 4:
    case 5:
    case 7:
      result = 0x20000400000;
      break;
    case 6:
      result = 0x400000;
      break;
    default:
      return result;
  }
  return result;
}

- (void)registerRequestID:(id)a3 options:(id)a4 requestHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSString *loggingIdentifier;
  uint64_t v15;
  NSObject *v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *registeredRequests;
  int v19;
  NSString *v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_registeredRequests, "objectForKeyedSubscript:", v8));

  if (!v11)
  {
    v12 = __biome_log_for_category(11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      loggingIdentifier = self->_loggingIdentifier;
      v19 = 138412290;
      v20 = loggingIdentifier;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "BMRapportClient[%@]: register request", (uint8_t *)&v19, 0xCu);
    }

    if (self->_state)
    {
      v15 = __biome_log_for_category(11);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_10004412C((uint64_t)self, v16);
    }
    else
    {
      if (!self->_registeredRequests)
      {
        v17 = objc_opt_new(NSMutableDictionary);
        registeredRequests = self->_registeredRequests;
        self->_registeredRequests = v17;

      }
      v16 = objc_alloc_init((Class)RPRequestRegistration);
      -[NSObject setRequestID:](v16, "setRequestID:", v8);
      -[NSObject setOptions:](v16, "setOptions:", v9);
      -[NSObject setHandler:](v16, "setHandler:", v10);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_registeredRequests, "setObject:forKeyedSubscript:", v16, v8);
    }

  }
}

- (void)_handleRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_state != 3)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_registeredRequests, "objectForKeyedSubscript:", v15));
    v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "handler"));

    if (v14)
      ((void (**)(_QWORD, id, id, id))v14)[2](v14, v10, v11, v12);

  }
}

- (void)_registerRequests
{
  id v3;
  uint64_t v4;
  void *i;
  uint64_t v6;
  void *v7;
  RPCompanionLinkClient *client;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  NSObject *v12;
  NSMutableDictionary *obj;
  _QWORD v14[5];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id location;
  _BYTE v21[128];

  if (self->_state == 1)
  {
    objc_initWeak(&location, self);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    obj = self->_registeredRequests;
    v3 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v3)
    {
      v4 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v3; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v4)
            objc_enumerationMutation(obj);
          v6 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_registeredRequests, "objectForKeyedSubscript:", v6));
          client = self->_client;
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "options"));
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472;
          v14[2] = sub_100030E0C;
          v14[3] = &unk_100068CA0;
          objc_copyWeak(&v15, &location);
          v14[4] = v6;
          v10 = objc_retainBlock(v14);
          objc_destroyWeak(&v15);
          -[RPCompanionLinkClient registerRequestID:options:handler:](client, "registerRequestID:options:handler:", v6, v9, v10);

        }
        v3 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v3);
    }

    objc_destroyWeak(&location);
  }
  else
  {
    v11 = __biome_log_for_category(11);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      sub_1000441B0((uint64_t)self, v12);

  }
}

- (void)_deregisterRequests
{
  NSMutableDictionary *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_registeredRequests;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[RPCompanionLinkClient deregisterRequestID:](self->_client, "deregisterRequestID:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), (_QWORD)v8);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->_registeredRequests, "removeAllObjects");
}

@end
