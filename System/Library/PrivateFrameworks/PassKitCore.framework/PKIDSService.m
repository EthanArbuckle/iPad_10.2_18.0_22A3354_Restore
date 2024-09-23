@implementation PKIDSService

- (PKIDSService)init
{

  return 0;
}

- (PKIDSService)initWithServiceName:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  PKIDSService *v7;

  v4 = (objc_class *)MEMORY[0x1E0D34358];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithService:", v5);

  v7 = -[PKIDSService initWithService:](self, "initWithService:", v6);
  return v7;
}

- (PKIDSService)initWithService:(id)a3
{
  PKIDSService *result;
  PKIDSService *v6;
  PKIDSService *v7;
  PKIDSService *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *listeners;
  uint64_t v11;
  NSHashTable *delegates;
  dispatch_queue_t v13;
  OS_dispatch_queue *internalQueue;
  dispatch_queue_t v15;
  OS_dispatch_queue *replyQueue;
  objc_super v17;

  result = (PKIDSService *)a3;
  if (result)
  {
    v6 = result;
    v17.receiver = self;
    v17.super_class = (Class)PKIDSService;
    v7 = -[PKIDSService init](&v17, sel_init);
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_underlyingService, a3);
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      listeners = v8->_listeners;
      v8->_listeners = v9;

      objc_msgSend(MEMORY[0x1E0CB3690], "pk_weakObjectsHashTableUsingPointerPersonality");
      v11 = objc_claimAutoreleasedReturnValue();
      delegates = v8->_delegates;
      v8->_delegates = (NSHashTable *)v11;

      v8->_lock._os_unfair_lock_opaque = 0;
      v13 = dispatch_queue_create("com.apple.passd.idsservice.internal", 0);
      internalQueue = v8->_internalQueue;
      v8->_internalQueue = (OS_dispatch_queue *)v13;

      v15 = dispatch_queue_create("com.apple.passd.idsservice.reply", 0);
      replyQueue = v8->_replyQueue;
      v8->_replyQueue = (OS_dispatch_queue *)v15;

    }
    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[IDSService removeDelegate:](self->_underlyingService, "removeDelegate:", self);
  v3.receiver = self;
  v3.super_class = (Class)PKIDSService;
  -[PKIDSService dealloc](&v3, sel_dealloc);
}

- (void)start
{
  -[IDSService addDelegate:queue:](self->_underlyingService, "addDelegate:queue:", self, self->_internalQueue);
}

- (void)setProtobufAction:(SEL)a3 target:(id)a4 forIncomingRequestsOfType:(unsigned __int16)a5 queue:(id)a6
{
  -[PKIDSService _setProtobufAction:target:messageType:isRequest:queue:](self, "_setProtobufAction:target:messageType:isRequest:queue:", a3, a4, a5, 1, a6);
}

- (void)setProtobufAction:(SEL)a3 target:(id)a4 forIncomingResponsesOfType:(unsigned __int16)a5 queue:(id)a6
{
  -[PKIDSService _setProtobufAction:target:messageType:isRequest:queue:](self, "_setProtobufAction:target:messageType:isRequest:queue:", a3, a4, a5, 0, a6);
}

- (void)_setProtobufAction:(SEL)a3 target:(id)a4 messageType:(unsigned __int16)a5 isRequest:(BOOL)a6 queue:(id)a7
{
  _BOOL8 v8;
  uint64_t v9;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16[2];
  id from;
  id location;

  v8 = a6;
  v9 = a5;
  v12 = a4;
  v13 = a7;
  objc_initWeak(&location, v12);
  objc_initWeak(&from, self);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__PKIDSService__setProtobufAction_target_messageType_isRequest_queue___block_invoke;
  v14[3] = &unk_1E2ACA600;
  objc_copyWeak(&v15, &location);
  objc_copyWeak(v16, &from);
  v16[1] = (id)a3;
  -[PKIDSService registerListenerForMessageType:isRequest:referenceObject:queue:onMessageReceived:](self, "registerListenerForMessageType:isRequest:referenceObject:queue:onMessageReceived:", v9, v8, v12, v13, v14);
  objc_destroyWeak(v16);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __70__PKIDSService__setProtobufAction_target_messageType_isRequest_queue___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id WeakRetained;
  char *v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v18 = a2;
  v17 = a3;
  v16 = a4;
  v15 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  v11 = v10;
  if (WeakRetained && v10)
  {
    v12 = (void *)MEMORY[0x1E0C99DB8];
    objc_msgSend(WeakRetained, "methodSignatureForSelector:", *(_QWORD *)(a1 + 48), v15, v16, v17, v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invocationWithMethodSignature:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setSelector:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v14, "setTarget:", WeakRetained);
    objc_msgSend(v14, "setArgument:atIndex:", &v18, 2);
    objc_msgSend(v14, "setArgument:atIndex:", v11 + 48, 3);
    objc_msgSend(v14, "setArgument:atIndex:", &v17, 4);
    objc_msgSend(v14, "setArgument:atIndex:", &v16, 5);
    objc_msgSend(v14, "setArgument:atIndex:", &v15, 6);
    objc_msgSend(v14, "invoke");

  }
}

- (void)registerListenerForMessageType:(unsigned __int16)a3 isRequest:(BOOL)a4 referenceObject:(id)a5 onMessageReceived:(id)a6
{
  -[PKIDSService registerListenerForMessageType:isRequest:referenceObject:queue:onMessageReceived:](self, "registerListenerForMessageType:isRequest:referenceObject:queue:onMessageReceived:", a3, a4, a5, 0, a6);
}

- (void)registerListenerForMessageType:(unsigned __int16)a3 isRequest:(BOOL)a4 referenceObject:(id)a5 queue:(id)a6 onMessageReceived:(id)a7
{
  _BOOL8 v9;
  uint64_t v10;
  os_unfair_lock_s *p_lock;
  id v13;
  id v14;
  id v15;
  PKIDSServiceListenerRegistrationKey *v16;
  uint64_t v17;
  void *v18;
  PKIDSServiceListener *v19;
  id v20;
  PKIDSServiceListener *v21;
  IDSService *underlyingService;

  v9 = a4;
  v10 = a3;
  p_lock = &self->_lock;
  v13 = a7;
  v14 = a6;
  v15 = a5;
  os_unfair_lock_lock(p_lock);
  v16 = -[PKIDSServiceListenerRegistrationKey initWithMessageType:isRequest:]([PKIDSServiceListenerRegistrationKey alloc], "initWithMessageType:isRequest:", v10, v9);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_listeners, "objectForKeyedSubscript:", v16);
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    v19 = -[PKIDSServiceListener initWithReferenceObject:onMessageReceived:]([PKIDSServiceListener alloc], "initWithReferenceObject:onMessageReceived:", v15, v13);

    -[PKIDSServiceListener setReplyQueue:](v19, "setReplyQueue:", v14);
    objc_msgSend(v18, "addObject:", v19);

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_listeners, "setObject:forKeyedSubscript:", v20, v16);
    v21 = -[PKIDSServiceListener initWithReferenceObject:onMessageReceived:]([PKIDSServiceListener alloc], "initWithReferenceObject:onMessageReceived:", v15, v13);

    -[PKIDSServiceListener setReplyQueue:](v21, "setReplyQueue:", v14);
    objc_msgSend(v20, "addObject:", v21);

    os_unfair_lock_unlock(p_lock);
    underlyingService = self->_underlyingService;
    if (v9)
      -[IDSService setProtobufAction:forIncomingRequestsOfType:](underlyingService, "setProtobufAction:forIncomingRequestsOfType:", sel__receivedRequestMessage_service_account_fromID_context_, v10);
    else
      -[IDSService setProtobufAction:forIncomingResponsesOfType:](underlyingService, "setProtobufAction:forIncomingResponsesOfType:", sel__receivedResponseMessage_service_account_fromID_context_, v10);
  }
}

- (void)_receivedRequestMessage:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  -[PKIDSService _receivedMessage:isRequest:service:account:fromID:context:](self, "_receivedMessage:isRequest:service:account:fromID:context:", a3, 1, a4, a5, a6, a7);
}

- (void)_receivedResponseMessage:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  -[PKIDSService _receivedMessage:isRequest:service:account:fromID:context:](self, "_receivedMessage:isRequest:service:account:fromID:context:", a3, 0, a4, a5, a6, a7);
}

- (void)_receivedMessage:(id)a3 isRequest:(BOOL)a4 service:(id)a5 account:(id)a6 fromID:(id)a7 context:(id)a8
{
  _BOOL8 v11;
  id v13;
  id v14;
  id v15;
  id v16;
  os_unfair_lock_s *p_lock;
  PKIDSServiceListenerRegistrationKey *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  NSObject *v29;
  void (**v30)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD block[5];
  id v32;
  id v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v11 = a4;
  v41 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v18 = -[PKIDSServiceListenerRegistrationKey initWithMessageType:isRequest:]([PKIDSServiceListenerRegistrationKey alloc], "initWithMessageType:isRequest:", objc_msgSend(v13, "type"), v11);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_listeners, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "pk_objectsPassingTest:", &__block_literal_global_78);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_listeners, "setObject:forKeyedSubscript:", v21, v18);
  v22 = (void *)objc_msgSend(v21, "copy");

  os_unfair_lock_unlock(p_lock);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v23 = v22;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v37 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v28, "replyQueue");
        v29 = objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __74__PKIDSService__receivedMessage_isRequest_service_account_fromID_context___block_invoke_2;
          block[3] = &unk_1E2AC0F68;
          block[4] = v28;
          v32 = v13;
          v33 = v14;
          v34 = v15;
          v35 = v16;
          dispatch_async(v29, block);

        }
        else
        {
          objc_msgSend(v28, "onMessageReceived");
          v30 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, id, id, id, id))v30)[2](v30, v13, v14, v15, v16);

        }
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v25);
  }

}

BOOL __74__PKIDSService__receivedMessage_isRequest_service_account_fromID_context___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "referenceObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

void __74__PKIDSService__receivedMessage_isRequest_service_account_fromID_context___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "onMessageReceived");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v2 + 2))(v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

- (void)unregisterListenersForTarget:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSMutableDictionary allKeys](self->_listeners, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_listeners, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __45__PKIDSService_unregisterListenersForTarget___block_invoke;
        v15[3] = &unk_1E2ACA648;
        v16 = v4;
        objc_msgSend(v10, "pk_objectsPassingTest:", v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v11, "mutableCopy");

        if (objc_msgSend(v12, "count"))
          v13 = v12;
        else
          v13 = 0;
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_listeners, "setObject:forKeyedSubscript:", v13, v9);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(&self->_lock);
}

BOOL __45__PKIDSService_unregisterListenersForTarget___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "referenceObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != *(void **)(a1 + 32);

  return v4;
}

- (void)addDelegate:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable addObject:](self->_delegates, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeDelegate:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_delegates, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __71__PKIDSService_service_account_identifier_hasBeenDeliveredWithContext___block_invoke;
  v18[3] = &unk_1E2ACA670;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v22 = v13;
  v14 = v13;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  -[PKIDSService _enumerateDelegatesWithBlock:](self, "_enumerateDelegatesWithBlock:", v18);

}

void __71__PKIDSService_service_account_identifier_hasBeenDeliveredWithContext___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "service:account:identifier:hasBeenDeliveredWithContext:", a1[4], a1[5], a1[6], a1[7]);

}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __73__PKIDSService_service_account_incomingUnhandledProtobuf_fromID_context___block_invoke;
  v22[3] = &unk_1E2ACA698;
  v23 = v12;
  v24 = v13;
  v25 = v14;
  v26 = v15;
  v27 = v16;
  v17 = v16;
  v18 = v15;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  -[PKIDSService _enumerateDelegatesWithBlock:](self, "_enumerateDelegatesWithBlock:", v22);

}

void __73__PKIDSService_service_account_incomingUnhandledProtobuf_fromID_context___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "service:account:incomingUnhandledProtobuf:fromID:context:", a1[4], a1[5], a1[6], a1[7], a1[8]);

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  BOOL v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __68__PKIDSService_service_account_identifier_didSendWithSuccess_error___block_invoke;
  v20[3] = &unk_1E2ACA6C0;
  v21 = v12;
  v22 = v13;
  v25 = a6;
  v23 = v14;
  v24 = v15;
  v16 = v15;
  v17 = v14;
  v18 = v13;
  v19 = v12;
  -[PKIDSService _enumerateDelegatesWithBlock:](self, "_enumerateDelegatesWithBlock:", v20);

}

void __68__PKIDSService_service_account_identifier_didSendWithSuccess_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "service:account:identifier:didSendWithSuccess:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));

}

- (void)_enumerateDelegatesWithBlock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *replyQueue;
  id v13;
  id obj;
  _QWORD block[5];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)-[NSHashTable copy](self->_delegates, "copy");
  os_unfair_lock_unlock(&self->_lock);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        replyQueue = self->_replyQueue;
        block[0] = v9;
        block[1] = 3221225472;
        block[2] = __45__PKIDSService__enumerateDelegatesWithBlock___block_invoke;
        block[3] = &unk_1E2ABDA18;
        v13 = v4;
        block[4] = v11;
        v16 = v13;
        dispatch_async(replyQueue, block);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

}

uint64_t __45__PKIDSService__enumerateDelegatesWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (IDSService)underlyingService
{
  return self->_underlyingService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingService, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
}

@end
