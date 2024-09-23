@implementation SWSessionManager

- (SWSessionManager)initWithScriptsManager:(id)a3 logger:(id)a4
{
  id v7;
  id v8;
  SWSessionManager *v9;
  SWSessionManager *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SWSessionManager;
  v9 = -[SWSessionManager init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_scriptsManager, a3);
    objc_storeStrong((id *)&v10->_logger, a4);
  }

  return v10;
}

- (void)refresh
{
  SWSession *v3;
  SWSession *session;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SWSessionScript *v12;

  v3 = objc_alloc_init(SWSession);
  session = self->_session;
  self->_session = v3;

  -[SWSessionManager logger](self, "logger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWSession identifier](self->_session, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindValue:forKey:", v6, CFSTR("session"));

  -[SWSessionManager logger](self, "logger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD17C8];
  -[SWSession identifier](self->_session, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("Refreshing session with identifier: %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "log:", v10);

  v12 = -[SWSessionScript initWithSession:]([SWSessionScript alloc], "initWithSession:", self->_session);
  -[SWSessionManager scriptsManager](self, "scriptsManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addScript:", v12);

}

- (SWSession)session
{
  return self->_session;
}

- (SWScriptsManager)scriptsManager
{
  return self->_scriptsManager;
}

- (SWLogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_scriptsManager, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
