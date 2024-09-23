@implementation SWErrorManager

- (SWErrorManager)initWithMessageHandlerManager:(id)a3 timeoutManager:(id)a4 logger:(id)a5
{
  id v8;
  id v9;
  id v10;
  SWErrorManager *v11;
  SWErrorManager *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SWErrorManager;
  v11 = -[SWErrorManager init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_logger, a5);
    +[SWWeakMessageHandler handlerWithMessageHandler:](SWWeakMessageHandler, "handlerWithMessageHandler:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addMessageHandler:name:", v13, CFSTR("failed"));

    objc_initWeak(&location, v12);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __70__SWErrorManager_initWithMessageHandlerManager_timeoutManager_logger___block_invoke;
    v15[3] = &unk_24DA0B7C0;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v9, "onTimeout:", v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __70__SWErrorManager_initWithMessageHandlerManager_timeoutManager_logger___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("web_content"), 1, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "reportError:", v1);

}

- (void)reportError:(id)a3
{
  id v5;
  void *error;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a3;
  v15 = v5;
  if (v5 && objc_msgSend(v5, "code") != -999)
  {
    objc_storeStrong((id *)&self->_error, a3);
    -[SWErrorManager block](self, "block");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[SWErrorManager block](self, "block");
      v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[SWErrorManager error](self, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v8)[2](v8, v9);

    }
    -[SWErrorManager logger](self, "logger");
    error = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDD17C8];
    v11 = objc_msgSend(v15, "code");
    objc_msgSend(v15, "localizedDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "underlyingErrors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Error with code: %lu description: %@ underlyingErrors: %@"), v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(error, "logError:", v14);

  }
  else
  {
    error = self->_error;
    self->_error = 0;
  }

}

- (void)didReceiveMessage:(id)a3 securityOrigin:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "body");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("errorCode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = objc_msgSend(v7, "integerValue");
  else
    v8 = -1;
  objc_msgSend(v5, "body");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("error"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v13 = *MEMORY[0x24BDD0FC8];
    v14[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("web_content"), v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWErrorManager reportError:](self, "reportError:", v12);

}

- (NSError)error
{
  return self->_error;
}

- (id)block
{
  return self->_block;
}

- (void)onError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SWLogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
