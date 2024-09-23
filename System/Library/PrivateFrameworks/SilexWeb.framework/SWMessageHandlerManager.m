@implementation SWMessageHandlerManager

- (SWMessageHandlerManager)initWithUserContentController:(id)a3 logger:(id)a4
{
  id v6;
  id v7;
  SWMessageHandlerManager *v8;
  SWMessageHandlerManager *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *messageHandlers;
  SWWeakScriptMessageHandler *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SWMessageHandlerManager;
  v8 = -[SWMessageHandlerManager init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_logger, a4);
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    messageHandlers = v9->_messageHandlers;
    v9->_messageHandlers = v10;

    v12 = -[SWWeakScriptMessageHandler initWithScriptMessageHandler:]([SWWeakScriptMessageHandler alloc], "initWithScriptMessageHandler:", v9);
    objc_msgSend(v6, "addScriptMessageHandler:name:", v12, CFSTR("applenews"));

  }
  return v9;
}

- (void)addMessageHandler:(id)a3 name:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v11 && v6)
  {
    -[SWMessageHandlerManager messageHandlers](self, "messageHandlers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SWMessageHandlerManager messageHandlers](self, "messageHandlers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v6, "copy");
      objc_msgSend(v9, "setObject:forKey:", v8, v10);

    }
    objc_msgSend(v8, "addObject:", v11);

  }
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  id v5;
  void *v6;
  char isKindOfClass;
  SWMessage *v8;
  void *v9;
  SWMessage *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SWMessageSecurityOrigin *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  SWMessageSecurityOrigin *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(v5, "body");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v8 = [SWMessage alloc];
    objc_msgSend(v5, "body");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SWMessage initWithDictionary:](v8, "initWithDictionary:", v9);

    if (v10)
    {
      -[SWMessageHandlerManager logger](self, "logger");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x24BDD17C8];
      -[SWMessage name](v10, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SWMessage body](v10, "body");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "log:", v15);

      objc_msgSend(v5, "frameInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "securityOrigin");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = [SWMessageSecurityOrigin alloc];
      objc_msgSend(v17, "protocol");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "host");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "frameInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "request");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[SWMessageSecurityOrigin initWithProtocol:host:request:](v18, "initWithProtocol:host:request:", v19, v20, v22);

      -[SWMessageHandlerManager messageHandlers](self, "messageHandlers");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SWMessage name](v10, "name");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKey:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v27 = v26;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v33;
        do
        {
          v31 = 0;
          do
          {
            if (*(_QWORD *)v33 != v30)
              objc_enumerationMutation(v27);
            objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v31++), "didReceiveMessage:securityOrigin:", v10, v23);
          }
          while (v29 != v31);
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        }
        while (v29);
      }

    }
  }

}

- (SWLogger)logger
{
  return self->_logger;
}

- (NSMutableDictionary)messageHandlers
{
  return self->_messageHandlers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageHandlers, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

@end
