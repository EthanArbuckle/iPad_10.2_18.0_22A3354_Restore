@implementation SWURLSchemeHandlerManager

- (SWURLSchemeHandlerManager)initWithConfiguration:(id)a3 logger:(id)a4
{
  id v6;
  id v7;
  SWURLSchemeHandlerManager *v8;
  SWURLSchemeHandlerManager *v9;
  uint64_t v10;
  NSMutableDictionary *factories;
  uint64_t v12;
  NSMapTable *handlers;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SWURLSchemeHandlerManager;
  v8 = -[SWURLSchemeHandlerManager init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_configuration, v6);
    objc_storeStrong((id *)&v9->_logger, a4);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    factories = v9->_factories;
    v9->_factories = (NSMutableDictionary *)v10;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v12 = objc_claimAutoreleasedReturnValue();
    handlers = v9->_handlers;
    v9->_handlers = (NSMapTable *)v12;

  }
  return v9;
}

- (void)registerFactory:(id)a3 forScheme:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SWWeakURLSchemeHandler *v12;

  v6 = a4;
  v7 = a3;
  -[SWURLSchemeHandlerManager factories](self, "factories");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

  v12 = -[SWWeakURLSchemeHandler initWithURLSchemeHandler:]([SWWeakURLSchemeHandler alloc], "initWithURLSchemeHandler:", self);
  -[SWURLSchemeHandlerManager configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setURLSchemeHandler:forURLScheme:", v12, v6);

  -[SWURLSchemeHandlerManager logger](self, "logger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Register URL scheme handler factory %@ for scheme %@"), v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "log:", v11);
}

- (void)webView:(id)a3 startURLSchemeTask:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SWURLSchemeTask *v17;
  void *v18;
  SWURLSchemeTask *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *);
  void *v31;
  id v32;
  id location;

  v6 = a3;
  v7 = a4;
  -[SWURLSchemeHandlerManager logger](self, "logger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Start URL scheme task with %@"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "log:", v9);

  objc_msgSend(v7, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scheme");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    goto LABEL_6;
  -[SWURLSchemeHandlerManager factories](self, "factories");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[SWURLSchemeHandlerManager logger](self, "logger");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Found URL scheme handler factory %@ for task %@"), v14, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "log:", v16);

  if (!v14)
    goto LABEL_6;
  v17 = [SWURLSchemeTask alloc];
  -[SWURLSchemeHandlerManager logger](self, "logger");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[SWURLSchemeTask initWithTask:logger:](v17, "initWithTask:logger:", v7, v18);

  -[SWURLSchemeHandlerManager logger](self, "logger");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Created wrapping task %@ for task %@"), v19, v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "log:", v21);

  objc_initWeak(&location, self);
  v28 = MEMORY[0x24BDAC760];
  v29 = 3221225472;
  v30 = __56__SWURLSchemeHandlerManager_webView_startURLSchemeTask___block_invoke;
  v31 = &unk_24DA0C2D0;
  objc_copyWeak(&v32, &location);
  -[SWURLSchemeTask onCompletion:](v19, "onCompletion:", &v28);
  objc_msgSend(v14, "createURLSchemeHandlerWithTask:", v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);

LABEL_6:
    -[SWURLSchemeHandlerManager logger](self, "logger");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to create URL scheme handler for task %@"), v7);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "logError:", v27);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("web_content"), 3, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didFailWithError:", v14);
    v22 = 0;
    goto LABEL_7;
  }
  -[SWURLSchemeHandlerManager logger](self, "logger");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Created URL scheme handler %@ for task %@"), v22, v7, v28, v29, v30, v31);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "log:", v24);

  -[SWURLSchemeHandlerManager handlers](self, "handlers");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKey:", v22, v7);

  objc_msgSend(v22, "start");
  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

LABEL_7:
}

void __56__SWURLSchemeHandlerManager_webView_startURLSchemeTask___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "logger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Received completion callback for task %@"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "log:", v6);

  v7 = objc_loadWeakRetained(v2);
  objc_msgSend(v7, "handlers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v3);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "finish");
  v9 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "handlers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObjectForKey:", v3);

  v11 = objc_loadWeakRetained(v2);
  objc_msgSend(v11, "logger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Finished task handler %@ for task %@"), v14, v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "log:", v13);
}

- (void)webView:(id)a3 stopURLSchemeTask:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  -[SWURLSchemeHandlerManager handlers](self, "handlers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "cancel");
  -[SWURLSchemeHandlerManager handlers](self, "handlers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v5);

  -[SWURLSchemeHandlerManager logger](self, "logger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cancel URL scheme handler %@ for task %@"), v10, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "log:", v9);
}

- (WKWebViewConfiguration)configuration
{
  return (WKWebViewConfiguration *)objc_loadWeakRetained((id *)&self->_configuration);
}

- (SWLogger)logger
{
  return self->_logger;
}

- (NSMutableDictionary)factories
{
  return self->_factories;
}

- (NSMapTable)handlers
{
  return self->_handlers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_factories, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_destroyWeak((id *)&self->_configuration);
}

@end
