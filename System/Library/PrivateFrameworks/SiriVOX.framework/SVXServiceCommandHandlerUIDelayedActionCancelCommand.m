@implementation SVXServiceCommandHandlerUIDelayedActionCancelCommand

- (SVXServiceCommandHandlerUIDelayedActionCancelCommand)initWithDelayedActionStore:(id)a3 performer:(id)a4
{
  id v7;
  id v8;
  SVXServiceCommandHandlerUIDelayedActionCancelCommand *v9;
  SVXServiceCommandHandlerUIDelayedActionCancelCommand *v10;
  id v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  NSString *identifier;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SVXServiceCommandHandlerUIDelayedActionCancelCommand;
  v9 = -[SVXServiceCommandHandlerUIDelayedActionCancelCommand init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_delayedActionStore, a3);
    objc_storeStrong((id *)&v10->_performer, a4);
    v11 = objc_alloc(MEMORY[0x24BDD17C8]);
    v12 = (objc_class *)objc_msgSend((id)objc_opt_class(), "supportedCommandClass");
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "initWithFormat:", CFSTR("com.apple.SiriVOXService.service-command.%@"), v13);
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v14;

  }
  return v10;
}

- (BOOL)isCommandUUFR:(id)a3
{
  return 0;
}

- (void)handleCommand:(id)a3 withContext:(id)a4 taskTracker:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void *v11;
  SVXPerforming *performer;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v9 = a3;
  v10 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SVXServiceCommandHandlerUIDelayedActionCancelCommand.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[command isKindOfClass:[SAUIDelayedActionCancelCommand class]]"));

  }
  objc_msgSend(v9, "delayedActionAceId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  performer = self->_performer;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __105__SVXServiceCommandHandlerUIDelayedActionCancelCommand_handleCommand_withContext_taskTracker_completion___block_invoke;
  v16[3] = &unk_24D24EED8;
  v16[4] = self;
  v17 = v11;
  v18 = v10;
  v13 = v10;
  v14 = v11;
  -[SVXPerforming performBlock:](performer, "performBlock:", v16);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_performer, 0);
  objc_storeStrong((id *)&self->_delayedActionStore, 0);
}

void __105__SVXServiceCommandHandlerUIDelayedActionCancelCommand_handleCommand_withContext_taskTracker_completion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 8), "actionForKey:", a1[5]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*(id *)(a1[4] + 8), "removeActionForKey:", a1[5]);
    v2 = a1[6];
    if (v2)
    {
      +[SVXServiceCommandResult resultSuccess](SVXServiceCommandResult, "resultSuccess");
      v3 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v4 = (void *)v3;
      (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);

    }
  }
  else
  {
    v2 = a1[6];
    if (v2)
    {
      +[SVXServiceCommandResult resultFailureWithErrorCode:reason:](SVXServiceCommandResult, "resultFailureWithErrorCode:reason:", 0, CFSTR("Unable to find the delayed action cached locally to cancel."));
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }

}

+ (Class)supportedCommandClass
{
  return (Class)objc_opt_class();
}

@end
