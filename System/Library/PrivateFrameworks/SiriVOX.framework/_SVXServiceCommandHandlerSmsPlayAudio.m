@implementation _SVXServiceCommandHandlerSmsPlayAudio

- (_SVXServiceCommandHandlerSmsPlayAudio)initWithSessionManager:(id)a3 module:(id)a4
{
  id v6;
  id v7;
  _SVXPlayAudioExpressionParserProvider *v8;
  _SVXServiceCommandHandlerSmsPlayAudio *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(_SVXPlayAudioExpressionParserProvider);
  v9 = -[_SVXServiceCommandHandlerSmsPlayAudio initWithSessionManager:module:expressionParserProvider:](self, "initWithSessionManager:module:expressionParserProvider:", v7, v6, v8);

  return v9;
}

- (_SVXServiceCommandHandlerSmsPlayAudio)initWithSessionManager:(id)a3 module:(id)a4 expressionParserProvider:(id)a5
{
  id v10;
  id v11;
  id v12;
  _SVXServiceCommandHandlerSmsPlayAudio *v13;
  _SVXServiceCommandHandlerSmsPlayAudio *v14;
  id v15;
  objc_class *v16;
  void *v17;
  uint64_t v18;
  NSString *identifier;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SVXServiceCommandHandlerSmsPlayAudio.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("module != nil"));

    if (v12)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SVXServiceCommandHandlerSmsPlayAudio.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sessionManager != nil"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SVXServiceCommandHandlerSmsPlayAudio.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("expressionParserProvider != nil"));

LABEL_4:
  v24.receiver = self;
  v24.super_class = (Class)_SVXServiceCommandHandlerSmsPlayAudio;
  v13 = -[_SVXServiceCommandHandlerSmsPlayAudio init](&v24, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_sessionManager, a3);
    objc_storeStrong((id *)&v14->_module, a4);
    objc_storeStrong((id *)&v14->_expressionParserProvider, a5);
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    v16 = (objc_class *)objc_msgSend((id)objc_opt_class(), "supportedCommandClass");
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v15, "initWithFormat:", CFSTR("com.apple.SiriVOXService.service-command.%@"), v17);
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v18;

  }
  return v14;
}

- (BOOL)isCommandUUFR:(id)a3
{
  return 0;
}

- (void)handleCommand:(id)a3 withContext:(id)a4 taskTracker:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  id v10;
  _SVXRemoteExpressionParsingService *v11;
  id v12;
  _SVXRemoteExpressionParsingService *v13;
  _SVXPlayAudioExpressionParserProvider *expressionParserProvider;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;

  v8 = a3;
  v9 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v8;
    v11 = [_SVXRemoteExpressionParsingService alloc];
    v12 = objc_alloc_init(MEMORY[0x24BE09130]);
    v13 = -[_SVXRemoteExpressionParsingService initWithAceHandler:](v11, "initWithAceHandler:", v12);

    expressionParserProvider = self->_expressionParserProvider;
    -[SVXModule preferences](self->_module, "preferences");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SVXPlayAudioExpressionParserProvider getWithParsingService:preferences:](expressionParserProvider, "getWithParsingService:preferences:", v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __90___SVXServiceCommandHandlerSmsPlayAudio_handleCommand_withContext_taskTracker_completion___block_invoke;
    v19[3] = &unk_24D24C668;
    v19[4] = self;
    v20 = v10;
    v21 = v9;
    v17 = v10;
    objc_msgSend(v16, "parsePlayAudio:reply:", v17, v19);

  }
  else if (v9)
  {
    +[SVXServiceCommandResult resultIgnored](SVXServiceCommandResult, "resultIgnored");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v18);

  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_expressionParserProvider, 0);
  objc_storeStrong((id *)&self->_module, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
}

+ (Class)supportedCommandClass
{
  return (Class)objc_opt_class();
}

@end
