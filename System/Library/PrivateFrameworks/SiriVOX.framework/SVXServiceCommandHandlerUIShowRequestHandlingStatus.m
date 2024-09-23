@implementation SVXServiceCommandHandlerUIShowRequestHandlingStatus

- (SVXServiceCommandHandlerUIShowRequestHandlingStatus)initWithSessionManager:(id)a3 performer:(id)a4
{
  id v6;
  id v7;
  SVXAFPreferencesProvider *v8;
  SVXServiceCommandHandlerUIShowRequestHandlingStatus *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(SVXAFPreferencesProvider);
  v9 = -[SVXServiceCommandHandlerUIShowRequestHandlingStatus initWithSessionManager:performer:afPreferencesProvider:](self, "initWithSessionManager:performer:afPreferencesProvider:", v7, v6, v8);

  return v9;
}

- (SVXServiceCommandHandlerUIShowRequestHandlingStatus)initWithSessionManager:(id)a3 performer:(id)a4 afPreferencesProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  SVXServiceCommandHandlerUIShowRequestHandlingStatus *v11;
  id v12;
  objc_class *v13;
  void *v14;
  uint64_t v15;
  NSString *identifier;
  void *v17;
  SBSDebugInterface *v18;
  SBSDebugInterface *debugInterface;
  SVXLEDStatusFactory *v20;
  SVXLEDStatusFactory *ledStatusFactory;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)SVXServiceCommandHandlerUIShowRequestHandlingStatus;
  v11 = -[SVXServiceCommandHandlerUIShowRequestHandlingStatus init](&v23, sel_init);
  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x24BDD17C8]);
    v13 = (objc_class *)objc_msgSend((id)objc_opt_class(), "supportedCommandClass");
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "initWithFormat:", CFSTR("com.apple.SiriVOXService.service-command.%@"), v14);
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v15;

    objc_msgSend(v10, "get");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_shouldShowStatus = objc_msgSend(v17, "siriXDebugStatusEnabled");

    if (v11->_shouldShowStatus)
    {
      objc_storeStrong((id *)&v11->_performer, a4);
      v18 = (SBSDebugInterface *)objc_alloc_init((Class)getSBSDebugInterfaceClass());
      debugInterface = v11->_debugInterface;
      v11->_debugInterface = v18;

      v20 = objc_alloc_init(SVXLEDStatusFactory);
      ledStatusFactory = v11->_ledStatusFactory;
      v11->_ledStatusFactory = v20;

      objc_msgSend(v8, "addActivityListener:", v11);
    }
  }

  return v11;
}

- (BOOL)isCommandUUFR:(id)a3
{
  return 0;
}

- (void)handleCommand:(id)a3 withContext:(id)a4 taskTracker:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD, _QWORD);
  id v16;
  SVXLEDStatusFactory *ledStatusFactory;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void (**)(_QWORD, _QWORD))v14;
  if (self->_shouldShowStatus)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SVXServiceCommandHandlerUIShowRequestHandlingStatus.m"), 94, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[command isKindOfClass:[SAUIShowRequestHandlingStatus class]]"));

    }
    v16 = v11;
    ledStatusFactory = self->_ledStatusFactory;
    objc_msgSend(v16, "requestHandlingStatus");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVXLEDStatusFactory createCommandForStatus:](ledStatusFactory, "createCommandForStatus:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = (void *)*MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
      {
        v23 = v20;
        objc_msgSend(v16, "requestHandlingStatus");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v27 = "-[SVXServiceCommandHandlerUIShowRequestHandlingStatus handleCommand:withContext:taskTracker:completion:]";
        v28 = 2112;
        v29 = v24;
        v30 = 2112;
        v31 = v19;
        _os_log_debug_impl(&dword_214934000, v23, OS_LOG_TYPE_DEBUG, "%s Handling requestHandlingStatus [%@] with command [%@]", buf, 0x20u);

      }
      -[SBSDebugInterface sendLEDCommand:](self->_debugInterface, "sendLEDCommand:", v19);
    }
    if (v15)
    {
      +[SVXServiceCommandResult resultSuccess](SVXServiceCommandResult, "resultSuccess");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v15)[2](v15, v21);

    }
  }
  else if (v14)
  {
    +[SVXServiceCommandResult resultSuccess](SVXServiceCommandResult, "resultSuccess");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v15)[2](v15, v22);

  }
}

- (void)_clearLEDs
{
  SBSDebugInterface *debugInterface;
  id v3;

  debugInterface = self->_debugInterface;
  -[SVXLEDStatusFactory createClearLEDStatus](self->_ledStatusFactory, "createClearLEDStatus");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSDebugInterface sendLEDCommand:](debugInterface, "sendLEDCommand:", v3);

}

- (void)sessionDidResignActiveWithDeactivationContext:(id)a3
{
  SVXPerforming *performer;
  _QWORD v4[5];

  performer = self->_performer;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __101__SVXServiceCommandHandlerUIShowRequestHandlingStatus_sessionDidResignActiveWithDeactivationContext___block_invoke;
  v4[3] = &unk_24D24EFF0;
  v4[4] = self;
  -[SVXPerforming performBlock:afterDelay:](performer, "performBlock:afterDelay:", v4, 4.0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_ledStatusFactory, 0);
  objc_storeStrong((id *)&self->_performer, 0);
  objc_storeStrong((id *)&self->_debugInterface, 0);
}

uint64_t __101__SVXServiceCommandHandlerUIShowRequestHandlingStatus_sessionDidResignActiveWithDeactivationContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clearLEDs");
}

+ (Class)supportedCommandClass
{
  return (Class)objc_opt_class();
}

@end
