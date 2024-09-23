@implementation SPCoreParsecInterface

+ (void)initialize
{
  objc_opt_class();
}

+ (id)getSharedInstance
{
  id v2;
  SPCoreParsecInterface *v3;
  void *v4;

  v2 = a1;
  objc_sync_enter(v2);
  if (!getSharedInstance_interface)
  {
    v3 = objc_alloc_init(SPCoreParsecInterface);
    v4 = (void *)getSharedInstance_interface;
    getSharedInstance_interface = (uint64_t)v3;

  }
  objc_sync_exit(v2);

  return (id)getSharedInstance_interface;
}

+ (void)setSharedFeedbackListener:(id)a3
{
  objc_storeStrong((id *)&gSharedFeedbackListener, a3);
}

+ (id)sharedFeedbackListener
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = a1;
  objc_sync_enter(v2);
  if (!gSharedFeedbackListener)
  {
    +[SPCoreParsecInterface getSharedInstance](SPCoreParsecInterface, "getSharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "getFeedbackListener");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)gSharedFeedbackListener;
    gSharedFeedbackListener = v4;

  }
  objc_sync_exit(v2);

  return (id)gSharedFeedbackListener;
}

- (void)setupSearchSession
{
  SPCoreParsecInterface *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SPCoreParsecInterface *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (!obj->_parsecEnabled)
    goto LABEL_3;
  -[SPCoreParsecInterface searchSession](obj, "searchSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = obj;
  if (v3)
    goto LABEL_3;
  v4 = objc_alloc(MEMORY[0x24BEB0240]);
  -[SPCoreParsecInterface sharedQueue](obj, "sharedQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithClient:clientQueue:", obj, v5);
  -[SPCoreParsecInterface setSearchSession:](obj, "setSearchSession:", v6);

  -[SPCoreParsecInterface searchSession](obj, "searchSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = obj;
  if (v7)
  {
    -[SPCoreParsecInterface searchSession](obj, "searchSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "listener");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPSearchParsecFeedbackProxy setListener:](obj->_listener, "setListener:", v9);

    +[SPSearchFeedbackSender synchronizedBlock:](SPSearchFeedbackSender, "synchronizedBlock:", &__block_literal_global_3);
    objc_sync_exit(obj);

    +[SPSearchFeedbackSender updateFeedbackListeners](SPSearchFeedbackSender, "updateFeedbackListeners");
  }
  else
  {
LABEL_3:
    objc_sync_exit(v2);

  }
}

void __43__SPCoreParsecInterface_setupSearchSession__block_invoke()
{
  id v0;

  +[SPCoreParsecInterface getSharedInstance](SPCoreParsecInterface, "getSharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setParsecFeedbackAllowed:", _parsecFeedbackAllowed);

}

- (void)setParsecFeedbackAllowed:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  os_log_type_t v6;
  NSObject *v7;
  os_log_type_t v8;
  char *v9;
  SPCoreParsecInterface *v10;
  NSObject *v11;
  const char *v12;
  xpc_object_t v13;
  void *v14;
  void *v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  SPLogForSPLogCategoryDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v5, v6))
  {
    v16 = 67109120;
    LODWORD(v17) = v3;
    _os_log_impl(&dword_213202000, v5, v6, "[FEEDBACK-DEBUG] (SPCoreParsecInterface setParsecFeedbackAllowed) allowed: %d, ", (uint8_t *)&v16, 8u);
  }

  SPLogForSPLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v7, v8))
  {
    -[SPCoreParsecInterface searchSession](self, "searchSession");
    v9 = (char *)objc_claimAutoreleasedReturnValue();
    v16 = 138412290;
    v17 = v9;
    _os_log_impl(&dword_213202000, v7, v8, "[FEEDBACK-DEBUG] (SPCoreParsecInterface setParsecFeedbackAllowed) self.session: %@, ", (uint8_t *)&v16, 0xCu);

  }
  v10 = self;
  objc_sync_enter(v10);
  SPLogForSPLogCategoryDefault();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = "allowed";
    if (!v3)
      v12 = "forbidden";
    v16 = 136315138;
    v17 = v12;
    _os_log_impl(&dword_213202000, v11, OS_LOG_TYPE_DEFAULT, "Parsec feedback %s", (uint8_t *)&v16, 0xCu);
  }

  v13 = xpc_BOOL_create(v3);
  one_member_dict("allowed", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  analytics_send_event();

  _parsecFeedbackAllowed = v3;
  -[SPCoreParsecInterface searchSession](v10, "searchSession");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setParsecFeedbackAllowed:", _parsecFeedbackAllowed);

  objc_sync_exit(v10);
  +[SPSearchFeedbackSender updateFeedbackListeners](SPSearchFeedbackSender, "updateFeedbackListeners");
}

- (id)getFeedbackListener
{
  int64_t *p_sessionOnceToken;
  int64_t sessionOnceToken;
  uint64_t v5;
  void *v6;
  void *v7;
  SPSearchParsecFeedbackProxy *v8;
  void *v9;
  xpc_object_t v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  SPCoreParsecInterface *v17;
  uint64_t block;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  SPCoreParsecInterface *v22;

  if (self->_parsecEnabled)
  {
    sessionOnceToken = self->_sessionOnceToken;
    p_sessionOnceToken = &self->_sessionOnceToken;
    v5 = MEMORY[0x24BDAC760];
    block = MEMORY[0x24BDAC760];
    v19 = 3221225472;
    v20 = __44__SPCoreParsecInterface_getFeedbackListener__block_invoke;
    v21 = &unk_24CF63D90;
    v22 = self;
    if (sessionOnceToken != -1)
      dispatch_once(p_sessionOnceToken, &block);
    -[SPCoreParsecInterface searchSession](self, "searchSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[SPCoreParsecInterface setupSearchSession](self, "setupSearchSession");
      -[SPCoreParsecInterface searchSession](self, "searchSession");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)client, "setSession:", v7);

    }
    v13 = v5;
    v14 = 3221225472;
    v15 = __44__SPCoreParsecInterface_getFeedbackListener__block_invoke_2;
    v16 = &unk_24CF63D90;
    v17 = self;
    if (getFeedbackListener_onceToken != -1)
      dispatch_once(&getFeedbackListener_onceToken, &v13);
    v8 = self->_listener;
    -[SPCoreParsecInterface searchSession](self, "searchSession", v13, v14, v15, v16, v17, block, v19, v20, v21, v22);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = xpc_BOOL_create(v9 != 0);

    one_member_dict("parsecPresent", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    analytics_send_event();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

void __44__SPCoreParsecInterface_getFeedbackListener__block_invoke(uint64_t a1)
{
  QueryController *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v2 = objc_alloc_init(QueryController);
  v3 = (void *)client;
  client = (uint64_t)v2;

  v4 = objc_alloc(MEMORY[0x24BEB0240]);
  v5 = client;
  objc_msgSend(*(id *)(a1 + 32), "sharedQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithClient:clientQueue:", v5, v6);
  objc_msgSend(*(id *)(a1 + 32), "setSearchSession:", v7);

  objc_msgSend(*(id *)(a1 + 32), "searchSession");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)client, "setSession:", v8);

}

uint64_t __44__SPCoreParsecInterface_getFeedbackListener__block_invoke_2(uint64_t a1)
{
  SPSearchParsecFeedbackProxy *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(SPSearchParsecFeedbackProxy);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  objc_msgSend(*(id *)(a1 + 32), "searchSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "listener");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setListener:", v6);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setInterface:");
}

- (SPCoreParsecInterface)init
{
  SPCoreParsecInterface *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *sharedQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SPCoreParsecInterface;
  v2 = -[SPCoreParsecInterface init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("Shared parsec queue", 0);
    sharedQueue = v2->_sharedQueue;
    v2->_sharedQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SPCoreParsecInterface;
  -[SPCoreParsecInterface dealloc](&v2, sel_dealloc);
}

- (void)setParsecState:(BOOL)a3
{
  self->_parsecEnabled = a3;
}

- (void)activate:(double)a3
{
  int64_t *p_sessionOnceToken;
  int64_t sessionOnceToken;
  void *v7;
  void *v8;
  _QWORD block[5];

  sessionOnceToken = self->_sessionOnceToken;
  p_sessionOnceToken = &self->_sessionOnceToken;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__SPCoreParsecInterface_activate___block_invoke;
  block[3] = &unk_24CF63D90;
  block[4] = self;
  if (sessionOnceToken != -1)
    dispatch_once(p_sessionOnceToken, block);
  -[SPCoreParsecInterface searchSession](self, "searchSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[SPCoreParsecInterface setupSearchSession](self, "setupSearchSession");
    -[SPCoreParsecInterface searchSession](self, "searchSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)client, "setSession:", v8);

  }
  self->_gSessionStartTime = a3;
  -[PRSSearchSession setSessionStartTime:](self->_searchSession, "setSessionStartTime:", a3);
  -[PRSSearchSession activate](self->_searchSession, "activate");
}

void __34__SPCoreParsecInterface_activate___block_invoke(uint64_t a1)
{
  QueryController *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v2 = objc_alloc_init(QueryController);
  v3 = (void *)client;
  client = (uint64_t)v2;

  v4 = objc_alloc(MEMORY[0x24BEB0240]);
  v5 = client;
  objc_msgSend(*(id *)(a1 + 32), "sharedQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithClient:clientQueue:", v5, v6);
  objc_msgSend(*(id *)(a1 + 32), "setSearchSession:", v7);

  objc_msgSend(*(id *)(a1 + 32), "searchSession");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)client, "setSession:", v8);

}

- (void)deactivate
{
  -[PRSSearchSession deactivate](self->_searchSession, "deactivate");
}

- (PRSSearchSession)searchSession
{
  return (PRSSearchSession *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSearchSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)parsecEnabled
{
  return self->_parsecEnabled;
}

- (void)setParsecEnabled:(BOOL)a3
{
  self->_parsecEnabled = a3;
}

- (OS_dispatch_queue)sharedQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSharedQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (double)gSessionStartTime
{
  return self->_gSessionStartTime;
}

- (void)setGSessionStartTime:(double)a3
{
  self->_gSessionStartTime = a3;
}

- (int64_t)sessionOnceToken
{
  return self->_sessionOnceToken;
}

- (void)setSessionOnceToken:(int64_t)a3
{
  self->_sessionOnceToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedQueue, 0);
  objc_storeStrong((id *)&self->_searchSession, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
