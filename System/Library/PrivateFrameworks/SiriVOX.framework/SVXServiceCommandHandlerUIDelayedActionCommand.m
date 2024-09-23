@implementation SVXServiceCommandHandlerUIDelayedActionCommand

- (SVXServiceCommandHandlerUIDelayedActionCommand)initWithDelayedActionStore:(id)a3 sessionManager:(id)a4 performer:(id)a5
{
  id v9;
  id v10;
  id v11;
  SVXServiceCommandHandlerUIDelayedActionCommand *v12;
  SVXServiceCommandHandlerUIDelayedActionCommand *v13;
  id v14;
  objc_class *v15;
  void *v16;
  uint64_t v17;
  NSString *identifier;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SVXServiceCommandHandlerUIDelayedActionCommand;
  v12 = -[SVXServiceCommandHandlerUIDelayedActionCommand init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_delayedActionStore, a3);
    objc_storeStrong((id *)&v13->_sessionManager, a4);
    objc_storeStrong((id *)&v13->_performer, a5);
    v14 = objc_alloc(MEMORY[0x24BDD17C8]);
    v15 = (objc_class *)objc_msgSend((id)objc_opt_class(), "supportedCommandClass");
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v14, "initWithFormat:", CFSTR("com.apple.SiriVOXService.service-command.%@"), v16);
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v17;

  }
  return v13;
}

- (BOOL)isCommandUUFR:(id)a3
{
  return 0;
}

- (void)handleCommand:(id)a3 withContext:(id)a4 taskTracker:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *);
  id v13;
  void *v14;
  SVXPerforming *performer;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  SVXPerforming *v23;
  id v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  SVXServiceCommandHandlerUIDelayedActionCommand *v32;
  id v33;

  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, void *))a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SVXServiceCommandHandlerUIDelayedActionCommand.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[command isKindOfClass:[SAUIDelayedActionCommand class]]"));

  }
  v13 = v10;
  objc_msgSend(v13, "aceId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  performer = self->_performer;
  v16 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __99__SVXServiceCommandHandlerUIDelayedActionCommand_handleCommand_withContext_taskTracker_completion___block_invoke;
  v29[3] = &unk_24D24E638;
  v17 = v13;
  v30 = v17;
  v18 = v11;
  v31 = v18;
  v32 = self;
  v19 = v14;
  v33 = v19;
  -[SVXPerforming performBlock:](performer, "performBlock:", v29);
  objc_msgSend(v17, "timerValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValue");
  v22 = v21;

  v23 = self->_performer;
  v27[0] = v16;
  v27[1] = 3221225472;
  v27[2] = __99__SVXServiceCommandHandlerUIDelayedActionCommand_handleCommand_withContext_taskTracker_completion___block_invoke_2;
  v27[3] = &unk_24D24F018;
  v27[4] = self;
  v24 = v19;
  v28 = v24;
  -[SVXPerforming performBlock:afterDelay:](v23, "performBlock:afterDelay:", v27, v22 / 1000.0);
  if (v12)
  {
    +[SVXServiceCommandResult resultSuccess](SVXServiceCommandResult, "resultSuccess");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v25);

  }
}

- (void)_performDelayedAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SVXSessionManager *sessionManager;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(v4, "command");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commands");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "taskTracker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  sessionManager = self->_sessionManager;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__SVXServiceCommandHandlerUIDelayedActionCommand__performDelayedAction___block_invoke;
  v11[3] = &unk_24D24D278;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[SVXSessionManager getCurrentSessionUsingBlock:](sessionManager, "getCurrentSessionUsingBlock:", v11);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_performer, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_delayedActionStore, 0);
}

void __72__SVXServiceCommandHandlerUIDelayedActionCommand__performDelayedAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "handleCommand:taskTracker:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), *(_QWORD *)(a1 + 40), (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

void __99__SVXServiceCommandHandlerUIDelayedActionCommand_handleCommand_withContext_taskTracker_completion___block_invoke(_QWORD *a1)
{
  SVXServiceCommandDelayedAction *v2;

  v2 = -[SVXServiceCommandDelayedAction initWithCommand:taskTracker:]([SVXServiceCommandDelayedAction alloc], "initWithCommand:taskTracker:", a1[4], a1[5]);
  objc_msgSend(*(id *)(a1[6] + 8), "setAction:forKey:", v2, a1[7]);

}

void __99__SVXServiceCommandHandlerUIDelayedActionCommand_handleCommand_withContext_taskTracker_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "actionForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "_performDelayedAction:", v2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeActionForKey:", *(_QWORD *)(a1 + 40));
    v2 = v3;
  }

}

+ (Class)supportedCommandClass
{
  return (Class)objc_opt_class();
}

@end
