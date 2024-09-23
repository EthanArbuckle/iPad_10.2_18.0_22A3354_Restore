@implementation SVXServiceCommandHandlerUICloseAssistant

- (SVXServiceCommandHandlerUICloseAssistant)initWithSessionManager:(id)a3
{
  id v5;
  SVXServiceCommandHandlerUICloseAssistant *v6;
  SVXServiceCommandHandlerUICloseAssistant *v7;
  id v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  NSString *identifier;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SVXServiceCommandHandlerUICloseAssistant;
  v6 = -[SVXServiceCommandHandlerUICloseAssistant init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sessionManager, a3);
    v8 = objc_alloc(MEMORY[0x24BDD17C8]);
    v9 = (objc_class *)objc_msgSend((id)objc_opt_class(), "supportedCommandClass");
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "initWithFormat:", CFSTR("com.apple.SiriVOXService.service-command.%@"), v10);
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v11;

  }
  return v7;
}

- (BOOL)isCommandUUFR:(id)a3
{
  return 0;
}

- (void)handleCommand:(id)a3 withContext:(id)a4 taskTracker:(id)a5 completion:(id)a6
{
  void (**v9)(id, void *);
  id v10;
  uint64_t v11;
  char isKindOfClass;
  SVXSessionManager *sessionManager;
  void *v14;
  void *v15;
  _QWORD v16[5];

  v9 = (void (**)(id, void *))a6;
  v10 = a3;
  v11 = mach_absolute_time();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SVXServiceCommandHandlerUICloseAssistant.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[command isKindOfClass:[SAUICloseAssistant class]]"));

  }
  sessionManager = self->_sessionManager;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __93__SVXServiceCommandHandlerUICloseAssistant_handleCommand_withContext_taskTracker_completion___block_invoke;
  v16[3] = &__block_descriptor_40_e20_v16__0__SVXSession_8l;
  v16[4] = v11;
  -[SVXSessionManager getCurrentSessionUsingBlock:](sessionManager, "getCurrentSessionUsingBlock:", v16);
  if (v9)
  {
    +[SVXServiceCommandResult resultSuccess](SVXServiceCommandResult, "resultSuccess");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v14);

  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
}

void __93__SVXServiceCommandHandlerUICloseAssistant_handleCommand_withContext_taskTracker_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  SVXDeactivationContext *v4;
  uint64_t v5;
  SVXDeactivationContext *v6;
  id v7;

  v3 = a2;
  v4 = [SVXDeactivationContext alloc];
  v5 = *(_QWORD *)(a1 + 32);
  SVXClientInfoGetCurrent();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = -[SVXDeactivationContext initWithSource:timestamp:buttonEvent:clientInfo:userInfo:options:](v4, "initWithSource:timestamp:buttonEvent:clientInfo:userInfo:options:", 4, v5, 0, v7, 0, 0);
  objc_msgSend(v3, "deactivateWithContext:completion:", v6, 0);

}

+ (Class)supportedCommandClass
{
  return (Class)objc_opt_class();
}

@end
