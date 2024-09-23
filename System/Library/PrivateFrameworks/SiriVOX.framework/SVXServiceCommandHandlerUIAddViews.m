@implementation SVXServiceCommandHandlerUIAddViews

- (SVXServiceCommandHandlerUIAddViews)initWithSpeechSynthesizer:(id)a3 module:(id)a4 instrumentationUtils:(id)a5 modeProvider:(id)a6 dialogTransformer:(id)a7 synthesisResultConverter:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  SVXAceViewHandler *v20;
  _SVXAddViewsExpressionParserProvider *v21;
  SVXServiceCommandHandlerUIAddViews *v22;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = -[SVXAceViewHandler initWithModule:instrumentationUtils:modeProvider:speechSynthesizer:synthesisResultConverter:]([SVXAceViewHandler alloc], "initWithModule:instrumentationUtils:modeProvider:speechSynthesizer:synthesisResultConverter:", v18, v17, v16, v19, v14);

  v21 = objc_alloc_init(_SVXAddViewsExpressionParserProvider);
  v22 = -[SVXServiceCommandHandlerUIAddViews initWithModule:instrumentationUtils:dialogTransformer:aceViewHandler:expressionParserProvider:](self, "initWithModule:instrumentationUtils:dialogTransformer:aceViewHandler:expressionParserProvider:", v18, v17, v15, v20, v21);

  return v22;
}

- (SVXServiceCommandHandlerUIAddViews)initWithModule:(id)a3 instrumentationUtils:(id)a4 dialogTransformer:(id)a5 aceViewHandler:(id)a6 expressionParserProvider:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SVXServiceCommandHandlerUIAddViews *v17;
  SVXServiceCommandHandlerUIAddViews *v18;
  id v19;
  objc_class *v20;
  void *v21;
  uint64_t v22;
  NSString *identifier;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  objc_super v30;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v29 = a6;
  v16 = a7;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SVXServiceCommandHandlerUIAddViews.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("instrumentationUtils != nil"));

    if (v15)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SVXServiceCommandHandlerUIAddViews.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("module != nil"));

  if (!v14)
    goto LABEL_8;
LABEL_3:
  if (v15)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SVXServiceCommandHandlerUIAddViews.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dialogTransformer != nil"));

LABEL_4:
  v30.receiver = self;
  v30.super_class = (Class)SVXServiceCommandHandlerUIAddViews;
  v17 = -[SVXServiceCommandHandlerUIAddViews init](&v30, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_module, a3);
    objc_storeStrong((id *)&v18->_instrumentationUtils, a4);
    objc_storeStrong((id *)&v18->_dialogTransformer, a5);
    objc_storeStrong((id *)&v18->_aceViewHandler, a6);
    objc_storeStrong((id *)&v18->_expressionParserProvider, a7);
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
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v10;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SVXServiceCommandHandlerUIAddViews.m"), 92, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[command isKindOfClass:[SAUIAddViews class]]"));

  }
  objc_msgSend(v5, "af_dialogPhase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "isExpository") ^ 1;
  else
    LOBYTE(v8) = 0;

  return v8;
}

- (BOOL)shouldDependOnCommand:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (void)prepareToHandleCommand:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _SVXRemoteExpressionParsingService *v10;
  id v11;
  _SVXRemoteExpressionParsingService *v12;
  _SVXAddViewsExpressionParserProvider *expressionParserProvider;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SVXServiceCommandHandlerUIAddViews.m"), 102, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[command isKindOfClass:[SAUIAddViews class]]"));

  }
  -[SVXDialogTransformer transformAddViews:](self->_dialogTransformer, "transformAddViews:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [_SVXRemoteExpressionParsingService alloc];
  v11 = objc_alloc_init(MEMORY[0x24BE09130]);
  v12 = -[_SVXRemoteExpressionParsingService initWithAceHandler:](v10, "initWithAceHandler:", v11);

  expressionParserProvider = self->_expressionParserProvider;
  -[SVXModule preferences](self->_module, "preferences");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SVXAddViewsExpressionParserProvider getWithParsingService:preferences:](expressionParserProvider, "getWithParsingService:preferences:", v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __72__SVXServiceCommandHandlerUIAddViews_prepareToHandleCommand_completion___block_invoke;
  v18[3] = &unk_24D24D2A0;
  v19 = v8;
  v16 = v8;
  objc_msgSend(v15, "parseAddViews:reply:", v9, v18);

}

- (void)handleCommand:(id)a3 withContext:(id)a4 taskTracker:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  unsigned int v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  SVXInstrumentationUtilities *instrumentationUtils;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  uint64_t v35;
  SVXAceViewHandler *aceViewHandler;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  unsigned int v44;
  _QWORD block[4];
  id v47;
  _QWORD v48[4];
  NSObject *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[4];
  id v55;
  uint64_t v56;
  uint8_t v57[128];
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  id v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v41 = a6;
  v13 = mach_absolute_time();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SVXServiceCommandHandlerUIAddViews.m"), 120, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[command isKindOfClass:[SAUIAddViews class]]"));

  }
  v14 = v10;
  objc_msgSend(v14, "af_dialogPhase");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isExpository");

  v44 = v16;
  if ((v16 & 1) == 0)
    kdebug_trace();
  objc_msgSend(v12, "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = MEMORY[0x24BDAC760];
  v54[1] = 3221225472;
  v54[2] = __87__SVXServiceCommandHandlerUIAddViews_handleCommand_withContext_taskTracker_completion___block_invoke;
  v54[3] = &unk_24D24E420;
  v56 = v13;
  v18 = v14;
  v55 = v18;
  objc_msgSend(v17, "mutatedCopyWithMutator:", v54);
  v19 = objc_claimAutoreleasedReturnValue();

  v39 = (void *)v19;
  objc_msgSend(v12, "beginChildWithContext:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v43 = v11;
  v40 = v18;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v21 = v11;
  else
    v21 = v18;
  v22 = v21;
  v23 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v24 = v23;
    objc_msgSend(v22, "patternId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "patternType");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v59 = "-[SVXServiceCommandHandlerUIAddViews handleCommand:withContext:taskTracker:completion:]";
    v60 = 2112;
    v61 = v22;
    v62 = 2112;
    v63 = v25;
    v64 = 2112;
    v65 = v26;
    _os_log_impl(&dword_214934000, v24, OS_LOG_TYPE_INFO, "%s preparedAddViews = %@, patternId = %@, patternType = %@", buf, 0x2Au);

  }
  instrumentationUtils = self->_instrumentationUtils;
  v42 = v12;
  objc_msgSend(v12, "instrumentationContext");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVXInstrumentationUtilities emitPatternExecutedEvent:addViews:](instrumentationUtils, "emitPatternExecutedEvent:addViews:", v28, v22);

  v29 = dispatch_group_create();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  objc_msgSend(v22, "views");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v51 != v33)
          objc_enumerationMutation(v30);
        v35 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
        dispatch_group_enter(v29);
        aceViewHandler = self->_aceViewHandler;
        v48[0] = MEMORY[0x24BDAC760];
        v48[1] = 3221225472;
        v48[2] = __87__SVXServiceCommandHandlerUIAddViews_handleCommand_withContext_taskTracker_completion___block_invoke_24;
        v48[3] = &unk_24D24D2C8;
        v49 = v29;
        -[SVXAceViewHandler handleAceView:isExpository:taskTracker:completion:](aceViewHandler, "handleAceView:isExpository:taskTracker:completion:", v35, v44, v20, v48);

      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
    }
    while (v32);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __87__SVXServiceCommandHandlerUIAddViews_handleCommand_withContext_taskTracker_completion___block_invoke_2;
  block[3] = &unk_24D24DE08;
  v47 = v41;
  v37 = v41;
  dispatch_group_notify(v29, MEMORY[0x24BDAC9B8], block);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_expressionParserProvider, 0);
  objc_storeStrong((id *)&self->_dialogTransformer, 0);
  objc_storeStrong((id *)&self->_aceViewHandler, 0);
  objc_storeStrong((id *)&self->_instrumentationUtils, 0);
  objc_storeStrong((id *)&self->_module, 0);
}

void __87__SVXServiceCommandHandlerUIAddViews_handleCommand_withContext_taskTracker_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setTimestamp:", v3);
  objc_msgSend(*(id *)(a1 + 32), "dialogPhase");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDialogPhase:", v5);

}

void __87__SVXServiceCommandHandlerUIAddViews_handleCommand_withContext_taskTracker_completion___block_invoke_24(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __87__SVXServiceCommandHandlerUIAddViews_handleCommand_withContext_taskTracker_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    +[SVXServiceCommandResult resultSuccess](SVXServiceCommandResult, "resultSuccess");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

uint64_t __72__SVXServiceCommandHandlerUIAddViews_prepareToHandleCommand_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (Class)supportedCommandClass
{
  return (Class)objc_opt_class();
}

@end
