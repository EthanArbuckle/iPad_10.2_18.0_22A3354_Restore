@implementation SVXServiceCommandHandlerClientCoordinationPhoneCall

- (SVXServiceCommandHandlerClientCoordinationPhoneCall)initWithSessionManager:(id)a3
{
  id v5;
  SVXServiceCommandHandlerClientCoordinationPhoneCall *v6;
  SVXServiceCommandHandlerClientCoordinationPhoneCall *v7;
  id v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  NSString *identifier;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SVXServiceCommandHandlerClientCoordinationPhoneCall;
  v6 = -[SVXServiceCommandHandlerClientCoordinationPhoneCall init](&v14, sel_init);
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
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v9 = (void (**)(id, void *))a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SVXServiceCommandHandlerClientCoordinationPhoneCall.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[command isKindOfClass:[SAPhoneClientCoordinationPhoneCall class]]"));

  }
  if (objc_msgSend(v12, "emergencyCall"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[SVXSessionManager initiateEmergency:](self->_sessionManager, "initiateEmergency:", v9);
  }
  else if (v9)
  {
    +[SVXServiceCommandResult resultFailureWithErrorCode:reason:](SVXServiceCommandResult, "resultFailureWithErrorCode:reason:", -1, CFSTR("unsupported type"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v10);

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

+ (Class)supportedCommandClass
{
  return (Class)objc_opt_class();
}

@end
