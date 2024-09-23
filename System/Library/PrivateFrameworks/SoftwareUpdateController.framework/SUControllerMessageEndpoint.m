@implementation SUControllerMessageEndpoint

+ (id)sharedEndpoint
{
  if (sharedEndpoint_endpointOnce != -1)
    dispatch_once(&sharedEndpoint_endpointOnce, &__block_literal_global_0);
  return (id)sharedEndpoint_endpoint;
}

void __45__SUControllerMessageEndpoint_sharedEndpoint__block_invoke()
{
  SUControllerMessageEndpoint *v0;
  void *v1;

  v0 = objc_alloc_init(SUControllerMessageEndpoint);
  v1 = (void *)sharedEndpoint_endpoint;
  sharedEndpoint_endpoint = (uint64_t)v0;

}

- (SUControllerMessageEndpoint)init
{
  SUControllerMessageEndpoint *v2;
  uint64_t v3;
  IDSService *service;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  dispatch_queue_t v7;
  OS_dispatch_queue *messageQueue;
  dispatch_queue_t v9;
  OS_dispatch_queue *processingQueue;
  NSMutableDictionary *v11;
  NSMutableDictionary *messageHandlers;
  NSMutableDictionary *v13;
  NSMutableDictionary *pendingMessageCompletions;
  NSMutableDictionary *v15;
  NSMutableDictionary *pendingMessageReplies;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SUControllerMessageEndpoint;
  v2 = -[SUControllerMessageEndpoint init](&v18, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BE4FCB8]), "initWithService:", CFSTR("com.apple.private.alloy.otaupdate"));
    service = v2->_service;
    v2->_service = (IDSService *)v3;

    v5 = dispatch_queue_create("com.apple.sucontroller.SUControllerMessageEndpoint", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_create("com.apple.sucontroller.ids_endpoint", MEMORY[0x24BDAC9C0]);
    messageQueue = v2->_messageQueue;
    v2->_messageQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_create("com.apple.sucontrollerd.SUControllerMessageHandler", 0);
    processingQueue = v2->_processingQueue;
    v2->_processingQueue = (OS_dispatch_queue *)v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    messageHandlers = v2->_messageHandlers;
    v2->_messageHandlers = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    pendingMessageCompletions = v2->_pendingMessageCompletions;
    v2->_pendingMessageCompletions = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    pendingMessageReplies = v2->_pendingMessageReplies;
    v2->_pendingMessageReplies = v15;

  }
  return v2;
}

- (void)resume
{
  -[IDSService addDelegate:queue:](self->_service, "addDelegate:queue:", self, self->_messageQueue);
}

- (void)suspend
{
  -[IDSService removeDelegate:](self->_service, "removeDelegate:", self);
}

- (void)sendMessage:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", SUControllerMessageTypeKey);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logAtLevel:label:format:", 0, "-[SUControllerMessageEndpoint sendMessage:completion:]", CFSTR("Trying to send this message over IDS... %@"), v9);

  __assert_rtn("-[SUControllerMessageEndpoint sendMessage:completion:]", "SUControllerMessageEndpoint.m", 92, "false");
}

- (void)sendMessage:(id)a3 isCritical:(BOOL)a4 completion:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a5;
  +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", SUControllerMessageTypeKey);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logAtLevel:label:format:", 0, "-[SUControllerMessageEndpoint sendMessage:isCritical:completion:]", CFSTR("Trying to send this message over IDS... %@"), v10);

  __assert_rtn("-[SUControllerMessageEndpoint sendMessage:isCritical:completion:]", "SUControllerMessageEndpoint.m", 99, "false");
}

- (void)sendMessage:(id)a3 withReply:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", SUControllerMessageTypeKey);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logAtLevel:label:format:", 0, "-[SUControllerMessageEndpoint sendMessage:withReply:]", CFSTR("Trying to send this message over IDS... %@"), v9);

  __assert_rtn("-[SUControllerMessageEndpoint sendMessage:withReply:]", "SUControllerMessageEndpoint.m", 120, "false");
}

- (void)sendReply:(id)a3 toMessage:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logAtLevel:label:format:", 0, "-[SUControllerMessageEndpoint sendReply:toMessage:]", CFSTR("Trying to send this message over IDS... %@"), v5);

  __assert_rtn("-[SUControllerMessageEndpoint sendReply:toMessage:]", "SUControllerMessageEndpoint.m", 142, "false");
}

- (void)setHandler:(id)a3 forMessagesOfType:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[SUControllerMessageEndpoint queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__SUControllerMessageEndpoint_setHandler_forMessagesOfType___block_invoke;
  block[3] = &unk_2518D07E8;
  v12 = v7;
  v13 = v6;
  block[4] = self;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

void __60__SUControllerMessageEndpoint_setHandler_forMessagesOfType___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "messageHandlers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x249580430](*(_QWORD *)(a1 + 48));
  objc_msgSend(v3, "setObject:forKey:", v2, *(_QWORD *)(a1 + 40));

}

- (void)setHandler:(id)a3 forMessagesOfTypes:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SUControllerMessageEndpoint *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[SUControllerMessageEndpoint queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__SUControllerMessageEndpoint_setHandler_forMessagesOfTypes___block_invoke;
  block[3] = &unk_2518D0810;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(v8, block);

}

void __61__SUControllerMessageEndpoint_setHandler_forMessagesOfTypes___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "messageHandlers", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x249580430](*(_QWORD *)(a1 + 48));
        objc_msgSend(v8, "setObject:forKey:", v9, v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (id)sendMessage:(id)a3 replyingTo:(id)a4 expectingResponse:(BOOL)a5 isCritical:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v9;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v52;
  id v53;
  uint64_t v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  _QWORD v60[4];
  id v61;

  v9 = a5;
  v12 = a3;
  v17 = a4;
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = MEMORY[0x24BDAC760];
    v60[1] = 3221225472;
    v60[2] = __89__SUControllerMessageEndpoint_sendMessage_replyingTo_expectingResponse_isCritical_error___block_invoke;
    v60[3] = &unk_2518D0738;
    v19 = v18;
    v61 = v19;
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v60);
    v59 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v19, 200, 0, &v59);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v59;
    if (v20)
    {
      v55 = v20;
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", *MEMORY[0x24BE4F9C8]);
      v54 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x24BDBCED8];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
      v56 = v17;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "dictionaryWithObject:forKey:", v27, *MEMORY[0x24BE4FAA0]);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v56)
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v56, *MEMORY[0x24BE4FAF0]);
      v29 = (_QWORD *)MEMORY[0x24BE4FB30];
      if (a6)
      {
        v30 = &unk_2518D6248;
        v31 = 300;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BE4FA10]);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v35, *v29);

        v30 = (void *)MEMORY[0x24BDBD1C8];
        v29 = (_QWORD *)MEMORY[0x24BE4FAA8];
        v31 = 200;
      }
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v30, *v29);
      objc_msgSend(v28, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE4FA90]);
      -[SUControllerMessageEndpoint service](self, "service");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v25;
      v58 = 0;
      v34 = (void *)v54;
      v37 = objc_msgSend(v36, "sendData:toDestinations:priority:options:identifier:error:", v20, v54, v31, v28, &v58, &v57);
      v53 = v58;
      v38 = v57;

      +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v37 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", SUControllerMessageTypeKey);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (v41)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", SUControllerMessageTypeKey);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v53;
          objc_msgSend(v39, "logAtLevel:label:format:", 2, "-[SUControllerMessageEndpoint sendMessage:replyingTo:expectingResponse:isCritical:error:]", CFSTR("Sent message:%@ %@"), v43, v53);

          v34 = (void *)v54;
        }
        else
        {
          v44 = v53;
          objc_msgSend(v39, "logAtLevel:label:format:", 2, "-[SUControllerMessageEndpoint sendMessage:replyingTo:expectingResponse:isCritical:error:]", CFSTR("Sent message:%@ %@"), &stru_2518D1100, v53);
        }
        v17 = v56;

        v33 = v44;
        v50 = v44;
        v20 = v55;
      }
      else
      {
        objc_msgSend(v39, "logAtLevel:label:format:", 0, "-[SUControllerMessageEndpoint sendMessage:replyingTo:expectingResponse:isCritical:error:]", CFSTR("Failed to send message: %ld"), objc_msgSend(v38, "code"));

        if (a7)
        {
          SUControllerError(CFSTR("SUControllerError"), 2, v38, CFSTR("Failed to send message: %@"), v45, v46, v47, v48, (uint64_t)v38);
          *a7 = (id)objc_claimAutoreleasedReturnValue();
        }
        +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "logAtLevel:label:format:", 0, "-[SUControllerMessageEndpoint sendMessage:replyingTo:expectingResponse:isCritical:error:]", CFSTR("Failed to send message: %@"), v38);

        v33 = 0;
        v17 = v56;
        v50 = v53;
      }

      v25 = v38;
    }
    else
    {
      if (a7)
      {
        SUControllerError(CFSTR("SUControllerError"), 1, v25, CFSTR("Failed to serialize message '%@'"), v21, v22, v23, v24, (uint64_t)v12);
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "logAtLevel:label:format:", 0, "-[SUControllerMessageEndpoint sendMessage:replyingTo:expectingResponse:isCritical:error:]", CFSTR("Failed to serialize message '%@'"), v12);
      v33 = 0;
    }

  }
  else
  {
    if (a7)
    {
      SUControllerError(CFSTR("SUControllerError"), 1, 0, CFSTR("Cannot send nil message"), v13, v14, v15, v16, v52);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "logAtLevel:label:format:", 0, "-[SUControllerMessageEndpoint sendMessage:replyingTo:expectingResponse:isCritical:error:]", CFSTR("Cannot send nil message"));

    v33 = 0;
  }

  return v33;
}

void __89__SUControllerMessageEndpoint_sendMessage_replyingTo_expectingResponse_isCritical_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  char v9;
  id v10;

  v10 = a2;
  v7 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if ((v9 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v10);
  *a4 = 0;

}

- (void)sendErrorReply:(id)a3 toMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", SUControllerMessageErrorKey);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v9;
      v16[0] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      -[SUControllerMessageEndpoint sendMessage:replyingTo:expectingResponse:isCritical:error:](self, "sendMessage:replyingTo:expectingResponse:isCritical:error:", v10, v7, 0, 1, &v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v14;

      if (!v11)
      {
        +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "logAtLevel:label:format:", 2, "-[SUControllerMessageEndpoint sendErrorReply:toMessage:]", CFSTR("Failed to send error reply: %@"), v12);

      }
    }
    else
    {
      +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logAtLevel:label:format:", 2, "-[SUControllerMessageEndpoint sendErrorReply:toMessage:]", CFSTR("Failed to archive error '%@'"), v6);
    }

  }
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  id v46;
  _QWORD block[5];
  id v48;
  id v49;
  id v50;
  id v51;

  v9 = a7;
  v51 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a5, 0, 0, &v51);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v51;
  if (!v10)
  {
    +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "outgoingResponseIdentifier");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v41 = objc_msgSend(v13, "UTF8String");
    objc_msgSend(v11, "code");
    objc_msgSend(v12, "logAtLevel:label:format:", 0, "-[SUControllerMessageEndpoint service:account:incomingData:fromID:context:]", CFSTR("Failed to parse IDS message %s: %ld"));

  }
  objc_msgSend(v9, "incomingResponseIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[SUControllerMessageEndpoint queue](self, "queue");
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __75__SUControllerMessageEndpoint_service_account_incomingData_fromID_context___block_invoke;
    block[3] = &unk_2518D0838;
    block[4] = self;
    v48 = v9;
    v49 = v11;
    v50 = v10;
    dispatch_async(v19, block);

  }
  else
  {
    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", SUControllerMessageTypeKey);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        -[SUControllerMessageEndpoint messageHandlers](self, "messageHandlers");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v21);
        v23 = (id)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          -[SUControllerMessageEndpoint processingQueue](self, "processingQueue");
          v24 = objc_claimAutoreleasedReturnValue();
          v42[0] = MEMORY[0x24BDAC760];
          v42[1] = 3221225472;
          v42[2] = __75__SUControllerMessageEndpoint_service_account_incomingData_fromID_context___block_invoke_2;
          v42[3] = &unk_2518D0860;
          v43 = v21;
          v23 = v23;
          v46 = v23;
          v44 = v10;
          v45 = v9;
          dispatch_async(v24, v42);

          v25 = v43;
        }
        else
        {
          +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "outgoingResponseIdentifier");
          v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v35 = objc_msgSend(v34, "UTF8String");
          objc_msgSend(v33, "logAtLevel:label:format:", 0, "-[SUControllerMessageEndpoint service:account:incomingData:fromID:context:]", CFSTR("No handler for message %s of type %s"), v35, SUControllerMessageTypeKey);

          SUControllerError(CFSTR("SUControllerError"), 1, 0, CFSTR("No handler for message type '%@'"), v36, v37, v38, v39, (uint64_t)v21);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "outgoingResponseIdentifier");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUControllerMessageEndpoint sendErrorReply:toMessage:](self, "sendErrorReply:toMessage:", v25, v40);

        }
      }
      else
      {
        +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "outgoingResponseIdentifier");
        v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v28 = objc_msgSend(v27, "UTF8String");
        objc_msgSend(v26, "logAtLevel:label:format:", 0, "-[SUControllerMessageEndpoint service:account:incomingData:fromID:context:]", CFSTR("Got message %s without %s key"), v28, SUControllerMessageTypeKey);

        SUControllerError(CFSTR("SUControllerError"), 1, 0, CFSTR("Dropping message without '%@' key"), v29, v30, v31, v32, (uint64_t)SUControllerMessageTypeKey);
        v23 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "outgoingResponseIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUControllerMessageEndpoint sendErrorReply:toMessage:](self, "sendErrorReply:toMessage:", v23, v25);
      }

    }
    else
    {
      SUControllerError(CFSTR("SUControllerError"), 1, v11, CFSTR("Unparseable IDS message"), v15, v16, v17, v18, v41);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "outgoingResponseIdentifier");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      -[SUControllerMessageEndpoint sendErrorReply:toMessage:](self, "sendErrorReply:toMessage:", v21, v23);
    }

  }
}

void __75__SUControllerMessageEndpoint_service_account_incomingData_fromID_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(id, _QWORD, void *);

  objc_msgSend(*(id *)(a1 + 32), "pendingMessageReplies");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "incomingResponseIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v14 = (void (**)(id, _QWORD, void *))objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "incomingResponseIdentifier");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v4, "logAtLevel:label:format:", 0, "-[SUControllerMessageEndpoint service:account:incomingData:fromID:context:]_block_invoke", CFSTR("No reply handler set for message identifier %s"), objc_msgSend(v5, "UTF8String"));
    goto LABEL_8;
  }
  if (!*(_QWORD *)(a1 + 48))
  {
    v6 = *(void **)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", SUControllerMessageErrorKey);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (void *)MEMORY[0x24BDD1620];
      v10 = objc_opt_class();
      v11 = *(void **)(a1 + 56);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", SUControllerMessageErrorKey);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "unarchivedObjectOfClass:fromData:error:", v10, v13, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      v14[2](v14, 0, v4);
LABEL_9:

      goto LABEL_10;
    }
    v14[2](v14, *(_QWORD *)(a1 + 56), 0);
    objc_msgSend(*(id *)(a1 + 32), "pendingMessageReplies");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "incomingResponseIdentifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:", v5);
LABEL_8:

    goto LABEL_9;
  }
  ((void (*)(void (**)(id, _QWORD, void *), _QWORD))v14[2])(v14, 0);
LABEL_10:

}

void __75__SUControllerMessageEndpoint_service_account_incomingData_fromID_context___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logAtLevel:label:format:", 2, "-[SUControllerMessageEndpoint service:account:incomingData:fromID:context:]_block_invoke_2", CFSTR("Received message: %@"), *(_QWORD *)(a1 + 32));

  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "outgoingResponseIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, v4, v5);

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  SUControllerMessageEndpoint *v17;
  id v18;
  BOOL v19;

  v10 = a5;
  v11 = a7;
  -[SUControllerMessageEndpoint queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __83__SUControllerMessageEndpoint_service_account_identifier_didSendWithSuccess_error___block_invoke;
  v15[3] = &unk_2518D0888;
  v16 = v11;
  v17 = self;
  v18 = v10;
  v19 = a6;
  v13 = v10;
  v14 = v11;
  dispatch_async(v12, v15);

}

void __83__SUControllerMessageEndpoint_service_account_identifier_didSendWithSuccess_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  uint64_t v16;
  id v17;

  v9 = *(void **)(a1 + 32);
  if (v9)
  {
    SUControllerError(CFSTR("SUControllerError"), 2, v9, CFSTR("failed to send message"), a5, a6, a7, a8, v16);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "pendingMessageCompletions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    ((void (**)(_QWORD, id))v11)[2](v11, v17);
    objc_msgSend(*(id *)(a1 + 40), "pendingMessageCompletions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectForKey:", *(_QWORD *)(a1 + 48));

  }
  objc_msgSend(*(id *)(a1 + 40), "pendingMessageReplies");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (!*(_BYTE *)(a1 + 56) && v14)
  {
    ((void (**)(_QWORD, _QWORD, id))v14)[2](v14, 0, v17);
    objc_msgSend(*(id *)(a1 + 40), "pendingMessageReplies");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeObjectForKey:", *(_QWORD *)(a1 + 48));

  }
}

- (IDSService)service
{
  return self->_service;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_queue)messageQueue
{
  return self->_messageQueue;
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (NSMutableDictionary)messageHandlers
{
  return self->_messageHandlers;
}

- (void)setMessageHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_messageHandlers, a3);
}

- (NSMutableDictionary)pendingMessageCompletions
{
  return self->_pendingMessageCompletions;
}

- (void)setPendingMessageCompletions:(id)a3
{
  objc_storeStrong((id *)&self->_pendingMessageCompletions, a3);
}

- (NSMutableDictionary)pendingMessageReplies
{
  return self->_pendingMessageReplies;
}

- (void)setPendingMessageReplies:(id)a3
{
  objc_storeStrong((id *)&self->_pendingMessageReplies, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingMessageReplies, 0);
  objc_storeStrong((id *)&self->_pendingMessageCompletions, 0);
  objc_storeStrong((id *)&self->_messageHandlers, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
