@implementation VTPeerRemoteConnection

- (VTPeerRemoteConnection)initWithServiceIdentifier:(id)a3 requireNearbyPeer:(BOOL)a4
{
  id v6;
  VTPeerRemoteConnection *v7;
  uint64_t v8;
  NSString *identifier;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  NSObject *v12;
  NSObject *v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VTPeerRemoteConnection;
  v7 = -[VTPeerRemoteConnection init](&v15, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v8;

    v10 = dispatch_queue_create("VTRemotePeerConnection", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    v12 = v7->_queue;
    dispatch_get_global_queue(33, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v12, v13);

    v7->_requireNearbyPeer = a4;
  }

  return v7;
}

- (VTPeerRemoteConnection)initWithServiceIdentifier:(id)a3
{
  return -[VTPeerRemoteConnection initWithServiceIdentifier:requireNearbyPeer:](self, "initWithServiceIdentifier:requireNearbyPeer:", a3, 0);
}

- (BOOL)hasPeer
{
  void *v2;
  BOOL v3;

  -[VTPeerRemoteConnection _account](self, "_account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)_pairedDevice
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[VTPeerRemoteConnection serviceIdentifier](self, "serviceIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTPeerRemoteConnection _service](self, "_service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "devices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v5;
    v22 = 2114;
    v23 = v7;
    _os_log_impl(&dword_20D965000, v4, OS_LOG_TYPE_DEFAULT, "devices for %{public}@: %{public}@", buf, 0x16u);

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[VTPeerRemoteConnection _service](self, "_service", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "devices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "isDefaultPairedDevice"))
        {
          v10 = v13;
          goto LABEL_13;
        }
      }
      v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_13:

  return v10;
}

- (BOOL)_hasNearbyPeer
{
  void *v2;
  char v3;

  -[VTPeerRemoteConnection _pairedDevice](self, "_pairedDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNearby");

  return v3;
}

- (id)serviceIdentifier
{
  return self->_identifier;
}

- (id)_service
{
  IDSService *idsService;
  IDSService *v4;
  IDSService *v5;

  idsService = self->_idsService;
  if (!idsService)
  {
    v4 = (IDSService *)objc_msgSend(objc_alloc(MEMORY[0x24BE4FCC0]), "initWithService:", self->_identifier);
    v5 = self->_idsService;
    self->_idsService = v4;

    -[IDSService addDelegate:queue:](self->_idsService, "addDelegate:queue:", self, self->_queue);
    idsService = self->_idsService;
  }
  return idsService;
}

- (id)_account
{
  void *v2;
  void *v3;

  -[IDSService accounts](self->_idsService, "accounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_destination
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_destination_sDestination;
  if (!_destination_sDestination)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *MEMORY[0x24BE4F9C0]);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_destination_sDestination;
    _destination_sDestination = v3;

    v2 = (void *)_destination_sDestination;
  }
  return v2;
}

- (void)sendRequestType:(unint64_t)a3 nonWaking:(BOOL)a4
{
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *queue;
  _QWORD block[6];
  BOOL v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    v9 = v7;
    objc_msgSend(v8, "numberWithUnsignedInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v15 = v10;
    _os_log_impl(&dword_20D965000, v9, OS_LOG_TYPE_DEFAULT, "Sending Request %{public}@", buf, 0xCu);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__VTPeerRemoteConnection_sendRequestType_nonWaking___block_invoke;
  block[3] = &unk_24C7F3D90;
  block[4] = self;
  block[5] = a3;
  v13 = a4;
  dispatch_async(queue, block);
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__VTPeerRemoteConnection_setDelegate___block_invoke;
  v7[3] = &unk_24C7F4DC0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_sendResponse:(id)a3 forRequestId:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  id v12;
  VTPeerRemoteConnection *v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__VTPeerRemoteConnection__sendResponse_forRequestId___block_invoke;
    block[3] = &unk_24C7F3BA0;
    v11 = v6;
    v12 = v7;
    v13 = self;
    dispatch_async(queue, block);

  }
  else
  {
    v9 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v6;
      _os_log_impl(&dword_20D965000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring response with no requestId %{public}@", buf, 0xCu);
    }
  }

}

- (void)_invokeCompletionForIdentifier:(id)a3 response:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  -[NSMutableDictionary objectForKey:](self->_completions, "objectForKey:", v14);
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    if (objc_msgSend(v8, "isResponse"))
    {
      v11 = objc_alloc((Class)(id)-[NSMutableDictionary objectForKey:](self->_responseClasses, "objectForKey:", v14));
      objc_msgSend(v8, "data");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithData:", v12);

      if (v13)
      {
        v9 = 0;
        if (!v10)
          goto LABEL_9;
        goto LABEL_8;
      }
    }
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("VTRemoteConnectionErrorDomain"), 0, 0);
  }
  v13 = 0;
  if (v10)
LABEL_8:
    ((void (**)(_QWORD, void *, id))v10)[2](v10, v13, v9);
LABEL_9:
  -[NSMutableDictionary removeObjectForKey:](self->_completions, "removeObjectForKey:", v14);
  -[NSMutableDictionary removeObjectForKey:](self->_responseClasses, "removeObjectForKey:", v14);

}

- (id)_wrappedSendFailureError:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BDD1540]);
  v5 = v4;
  if (v3)
  {
    v9 = *MEMORY[0x24BDD1398];
    v10[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithDomain:code:userInfo:", CFSTR("VTRemoteConnectionErrorDomain"), 3, v6);

  }
  else
  {
    v7 = (void *)objc_msgSend(v4, "initWithDomain:code:userInfo:", CFSTR("VTRemoteConnectionErrorDomain"), 3, 0);
  }

  return v7;
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  NSString *identifier;
  NSObject *v21;
  int v22;
  id v23;
  void *v24;
  id WeakRetained;
  void *v26;
  id v27;
  NSObject *v28;
  _BOOL4 v29;
  id v30;
  uint64_t v31;
  NSObject *v32;
  VTPeerRemoteConnection *v33;
  _QWORD v34[4];
  id v35;
  VTPeerRemoteConnection *v36;
  uint8_t buf[4];
  NSString *v38;
  __int16 v39;
  _BYTE v40[14];
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  v12 = a7;
  objc_msgSend(v12, "incomingResponseIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "outgoingResponseIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "expectsPeerResponse");
  v16 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v15;
    v18 = v14;
    v19 = v11;
    identifier = self->_identifier;
    v21 = v16;
    v22 = objc_msgSend(v10, "type");
    v33 = self;
    v23 = v10;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v12, "expectsPeerResponse"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v38 = identifier;
    v11 = v19;
    v14 = v18;
    v15 = v17;
    v39 = 1026;
    *(_DWORD *)v40 = v22;
    *(_WORD *)&v40[4] = 2114;
    *(_QWORD *)&v40[6] = v11;
    v41 = 2114;
    v42 = v13;
    v43 = 2114;
    v44 = v14;
    v45 = 2114;
    v46 = v24;
    _os_log_impl(&dword_20D965000, v21, OS_LOG_TYPE_DEFAULT, "Received %{public}@ type %{public}d fromId %{public}@ incoming %{public}@ outgoing %{public}@ expects response %{public}@", buf, 0x3Au);

    v10 = v23;
    self = v33;

  }
  if (v13)
  {
    -[VTPeerRemoteConnection _invokeCompletionForIdentifier:response:error:](self, "_invokeCompletionForIdentifier:response:error:", v13, v10, 0);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      v26 = v10;
      v27 = objc_loadWeakRetained((id *)&self->_delegate);

      v28 = VTLogContextFacilityVoiceTrigger;
      v29 = os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT);
      if (v27)
      {
        if (v29)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20D965000, v28, OS_LOG_TYPE_DEFAULT, "Handing protobuf to delegate", buf, 2u);
        }
        v30 = objc_loadWeakRetained((id *)&self->_delegate);
        v10 = v26;
        v31 = objc_msgSend(v26, "type");
        if ((v15 & 1) != 0)
        {
          v34[0] = MEMORY[0x24BDAC760];
          v34[1] = 3221225472;
          v34[2] = __83__VTPeerRemoteConnection_service_account_incomingUnhandledProtobuf_fromID_context___block_invoke;
          v34[3] = &unk_24C7F3BC8;
          v35 = v14;
          v36 = self;
          objc_msgSend(v30, "remoteConnection:handleMessageType:completion:", self, v31, v34);

        }
        else
        {
          objc_msgSend(v30, "remoteConnection:handleMessageType:completion:", self, v31, 0);

        }
      }
      else
      {
        v10 = v26;
        if (v29)
        {
          *(_DWORD *)buf = 138543618;
          v38 = (NSString *)v26;
          v39 = 2114;
          *(_QWORD *)v40 = v12;
          _os_log_impl(&dword_20D965000, v28, OS_LOG_TYPE_DEFAULT, "Tried to handle protobuf but couldn't find class or had no delegate %{public}@ %{public}@", buf, 0x16u);
        }
      }
    }
    else
    {
      v32 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v38 = (NSString *)v10;
        v39 = 2114;
        *(_QWORD *)v40 = v12;
        _os_log_impl(&dword_20D965000, v32, OS_LOG_TYPE_DEFAULT, "Don't know how to handle protobuf %{public}@ %{public}@", buf, 0x16u);
      }
      if (v15)
        -[VTPeerRemoteConnection _sendResponse:forRequestId:](self, "_sendResponse:forRequestId:", 0, v14);
    }
  }

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (!a6)
  {
    v16 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      v18 = 138543618;
      v19 = v14;
      v20 = 2114;
      v21 = v15;
      _os_log_error_impl(&dword_20D965000, v16, OS_LOG_TYPE_ERROR, "Message send with identifier %{public}@ failed %{public}@", (uint8_t *)&v18, 0x16u);
    }
    -[VTPeerRemoteConnection _wrappedSendFailureError:](self, "_wrappedSendFailureError:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTPeerRemoteConnection _invokeCompletionForIdentifier:response:error:](self, "_invokeCompletionForIdentifier:response:error:", v14, 0, v17);

  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_responseClasses, 0);
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __83__VTPeerRemoteConnection_service_account_incomingUnhandledProtobuf_fromID_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138543618;
      v10 = v8;
      v11 = 2114;
      v12 = v6;
      _os_log_error_impl(&dword_20D965000, v7, OS_LOG_TYPE_ERROR, "Error for request id %{public}@ %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "_sendResponse:forRequestId:", v5, *(_QWORD *)(a1 + 32));

}

void __53__VTPeerRemoteConnection__sendResponse_forRequestId___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BE4FC90]);
  objc_msgSend(*(id *)(a1 + 32), "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithProtobufData:type:isResponse:", v3, 0, 1);

  v5 = *(_QWORD *)(a1 + 40);
  v17 = *MEMORY[0x24BE4FAF8];
  v18[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "_service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "_account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "_destination");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = 0;
  objc_msgSend(v7, "sendProtobuf:fromAccount:toDestinations:priority:options:identifier:error:", v4, v8, v9, 300, v6, &v14, &v13);
  v10 = v14;
  v11 = v13;

  if (v11)
  {
    v12 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v11;
      _os_log_error_impl(&dword_20D965000, v12, OS_LOG_TYPE_ERROR, "Error sending response %{public}@", buf, 0xCu);
    }
  }

}

id __38__VTPeerRemoteConnection_setDelegate___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "_service");
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
}

void __52__VTPeerRemoteConnection_sendRequestType_nonWaking___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  _BYTE *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BE4FC90]);
  objc_msgSend(MEMORY[0x24BDBCE50], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithProtobufData:type:isResponse:", v3, *(unsigned __int16 *)(a1 + 40), 0);

  v5 = *(_BYTE **)(a1 + 32);
  if (v5[16] || *(_BYTE *)(a1 + 48))
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v7 = v6;
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16))
      objc_msgSend(v6, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE4FAB8]);
    objc_msgSend(v7, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE4FAB0]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", kVTPeerRemotePhraseSpotterRecommendedTimeout);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, *MEMORY[0x24BE4FB38]);

    if (*(_BYTE *)(a1 + 48))
      objc_msgSend(v7, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE4FAE0]);
    objc_msgSend(v7, "setObject:forKey:", CFSTR("VoiceTriggerRemotePhraseSpotter"), *MEMORY[0x24BE4FB10]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", kVTPeerRemotePhraseSpotterRecommendedTimeout);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v9, *MEMORY[0x24BE4FA98]);

    v5 = *(_BYTE **)(a1 + 32);
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v5, "_service");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_destination");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = 0;
  objc_msgSend(v10, "sendProtobuf:fromAccount:toDestinations:priority:options:identifier:error:", v4, v11, v12, 300, v7, &v17, &v16);
  v13 = v17;
  v14 = v16;

  if (v14)
  {
    v15 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v14;
      _os_log_error_impl(&dword_20D965000, v15, OS_LOG_TYPE_ERROR, "Error sending request %{public}@", buf, 0xCu);
    }
  }

}

@end
