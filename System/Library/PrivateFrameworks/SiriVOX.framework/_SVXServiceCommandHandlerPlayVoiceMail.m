@implementation _SVXServiceCommandHandlerPlayVoiceMail

- (_SVXServiceCommandHandlerPlayVoiceMail)initWithSessionManager:(id)a3 module:(id)a4
{
  id v6;
  id v7;
  SVXPlayVoicemailExpressionParserProvider *v8;
  SVXAudioFileDecoder *v9;
  SVXVoiceMailMarkAsReadHandler *v10;
  _SVXServiceCommandHandlerPlayVoiceMail *v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(SVXPlayVoicemailExpressionParserProvider);
  v9 = objc_alloc_init(SVXAudioFileDecoder);
  v10 = objc_alloc_init(SVXVoiceMailMarkAsReadHandler);
  v11 = -[_SVXServiceCommandHandlerPlayVoiceMail initWithSessionManager:module:playVoicemailExpressionParserProvider:audioFileDecoder:voicemailMarkAsReadHandler:](self, "initWithSessionManager:module:playVoicemailExpressionParserProvider:audioFileDecoder:voicemailMarkAsReadHandler:", v7, v6, v8, v9, v10);

  return v11;
}

- (_SVXServiceCommandHandlerPlayVoiceMail)initWithSessionManager:(id)a3 module:(id)a4 playVoicemailExpressionParserProvider:(id)a5 audioFileDecoder:(id)a6 voicemailMarkAsReadHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  _SVXServiceCommandHandlerPlayVoiceMail *v17;
  _SVXServiceCommandHandlerPlayVoiceMail *v18;
  id v19;
  objc_class *v20;
  void *v21;
  uint64_t v22;
  NSString *identifier;
  void *v25;
  void *v26;
  id v28;
  objc_super v29;

  v13 = a3;
  v14 = a4;
  v28 = a5;
  v15 = a6;
  v16 = a7;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SVXServiceCommandHandlerPlayVoiceMail.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sessionManager != nil"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SVXServiceCommandHandlerPlayVoiceMail.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("module != nil"));

LABEL_3:
  v29.receiver = self;
  v29.super_class = (Class)_SVXServiceCommandHandlerPlayVoiceMail;
  v17 = -[_SVXServiceCommandHandlerPlayVoiceMail init](&v29, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_sessionManager, a3);
    objc_storeStrong((id *)&v18->_module, a4);
    objc_storeStrong((id *)&v18->_playVoicemailExpressionParserProvider, a5);
    objc_storeStrong((id *)&v18->_audioFileDecoder, a6);
    objc_storeStrong((id *)&v18->_voiceMailMarkAsReadHandler, a7);
    v19 = objc_alloc(MEMORY[0x24BDD17C8]);
    v20 = (objc_class *)objc_msgSend((id)objc_opt_class(), "supportedCommandClass");
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v19, "initWithFormat:", CFSTR("com.apple.SiriVOXService.service-command.%@"), v21);
    identifier = v18->_identifier;
    v18->_identifier = (NSString *)v22;

  }
  return v18;
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
  void *v11;
  _SVXRemoteExpressionParsingService *v12;
  id v13;
  _SVXRemoteExpressionParsingService *v14;
  SVXPlayVoicemailExpressionParserProvider *playVoicemailExpressionParserProvider;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;

  v8 = a3;
  v9 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v8;
    objc_msgSend(v10, "targetDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = [_SVXRemoteExpressionParsingService alloc];
    v13 = objc_alloc_init(MEMORY[0x24BE09130]);
    v14 = -[_SVXRemoteExpressionParsingService initWithAceHandler:](v12, "initWithAceHandler:", v13);

    playVoicemailExpressionParserProvider = self->_playVoicemailExpressionParserProvider;
    -[SVXModule preferences](self->_module, "preferences");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVXPlayVoicemailExpressionParserProvider getWithParsingService:preferences:](playVoicemailExpressionParserProvider, "getWithParsingService:preferences:", v14, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __91___SVXServiceCommandHandlerPlayVoiceMail_handleCommand_withContext_taskTracker_completion___block_invoke;
    v20[3] = &unk_24D24CB88;
    v20[4] = self;
    v21 = v10;
    v22 = v21;
    v23 = v11;
    v24 = v9;
    v18 = v11;
    objc_msgSend(v17, "parsePlayVoicemail:reply:", v21, v20);

  }
  else if (v9)
  {
    +[SVXServiceCommandResult resultIgnored](SVXServiceCommandResult, "resultIgnored");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v19);

  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_voiceMailMarkAsReadHandler, 0);
  objc_storeStrong((id *)&self->_audioFileDecoder, 0);
  objc_storeStrong((id *)&self->_playVoicemailExpressionParserProvider, 0);
  objc_storeStrong((id *)&self->_module, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
}

+ (Class)supportedCommandClass
{
  return (Class)objc_opt_class();
}

@end
