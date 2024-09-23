@implementation SVXServiceCommandHandlerUIRepeatIt

- (SVXServiceCommandHandlerUIRepeatIt)initWithSpeechSynthesizer:(id)a3 performer:(id)a4 instrumentationUtils:(id)a5 synthesisResultConverter:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SVXServiceCommandHandlerUIRepeatIt *v15;
  SVXServiceCommandHandlerUIRepeatIt *v16;
  id v17;
  objc_class *v18;
  void *v19;
  uint64_t v20;
  NSString *identifier;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)SVXServiceCommandHandlerUIRepeatIt;
  v15 = -[SVXServiceCommandHandlerUIRepeatIt init](&v23, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_speechSynthesizer, a3);
    -[SVXSpeechSynthesizer addListener:](v16->_speechSynthesizer, "addListener:", v16);
    objc_storeStrong((id *)&v16->_performer, a4);
    objc_storeStrong((id *)&v16->_instrumentationUtils, a5);
    objc_storeStrong((id *)&v16->_synthesisResultConverter, a6);
    v17 = objc_alloc(MEMORY[0x24BDD17C8]);
    v18 = (objc_class *)objc_msgSend((id)objc_opt_class(), "supportedCommandClass");
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "initWithFormat:", CFSTR("com.apple.SiriVOXService.service-command.%@"), v19);
    identifier = v16->_identifier;
    v16->_identifier = (NSString *)v20;

  }
  return v16;
}

- (BOOL)isCommandUUFR:(id)a3
{
  return 1;
}

- (BOOL)shouldDependOnCommand:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
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

- (void)handleCommand:(id)a3 withContext:(id)a4 taskTracker:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  SVXPerforming *performer;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SVXServiceCommandHandlerUIRepeatIt.m"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[command isKindOfClass:[SAUIRepeatIt class]]"));

  }
  v13 = v10;
  kdebug_trace();
  objc_msgSend(v13, "contingency");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  performer = self->_performer;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __87__SVXServiceCommandHandlerUIRepeatIt_handleCommand_withContext_taskTracker_completion___block_invoke;
  v21[3] = &unk_24D24DF70;
  v21[4] = self;
  v22 = v14;
  v23 = v11;
  v24 = v13;
  v25 = v12;
  v16 = v12;
  v17 = v13;
  v18 = v11;
  v19 = v14;
  -[SVXPerforming performBlock:](performer, "performBlock:", v21);

}

- (void)speechSynthesizerWillStartRequest:(id)a3 taskTracker:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  SVXPerforming *performer;
  _QWORD v9[5];
  id v10;

  v5 = a3;
  objc_msgSend(v5, "speakableText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    performer = self->_performer;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __84__SVXServiceCommandHandlerUIRepeatIt_speechSynthesizerWillStartRequest_taskTracker___block_invoke;
    v9[3] = &unk_24D24F018;
    v9[4] = self;
    v10 = v5;
    -[SVXPerforming performBlock:](performer, "performBlock:", v9);

  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_synthesisResultConverter, 0);
  objc_storeStrong((id *)&self->_lastStartedRequest, 0);
  objc_storeStrong((id *)&self->_instrumentationUtils, 0);
  objc_storeStrong((id *)&self->_performer, 0);
  objc_storeStrong((id *)&self->_speechSynthesizer, 0);
}

void __84__SVXServiceCommandHandlerUIRepeatIt_speechSynthesizerWillStartRequest_taskTracker___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

}

void __87__SVXServiceCommandHandlerUIRepeatIt_handleCommand_withContext_taskTracker_completion___block_invoke(uint64_t a1)
{
  void *v2;
  SVXSpeechSynthesisRequest *v3;
  SVXSpeechSynthesisRequest *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  SVXSpeechSynthesisRequest *v16;
  uint64_t v17;
  id v18;
  _QWORD v19[4];
  SVXSpeechSynthesisRequest *v20;
  id v21;
  uint64_t v22;
  id v23;
  _QWORD v24[4];
  SVXSpeechSynthesisRequest *v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (v2)
  {
    v3 = (SVXSpeechSynthesisRequest *)objc_msgSend(v2, "copy");
  }
  else
  {
    if (!*(_QWORD *)(a1 + 40))
      goto LABEL_9;
    v3 = -[SVXSpeechSynthesisRequest initWithPriority:options:speakableText:speakableContext:localizationKey:presynthesizedAudio:streamID:]([SVXSpeechSynthesisRequest alloc], "initWithPriority:options:speakableText:speakableContext:localizationKey:presynthesizedAudio:streamID:", 2, 1, *(_QWORD *)(a1 + 40), 0, 0, 0, 0);
  }
  v4 = v3;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 48), "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dialogPhase");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v8 = v7;
      -[SVXSpeechSynthesisRequest speakableText](v4, "speakableText");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v28 = "-[SVXServiceCommandHandlerUIRepeatIt handleCommand:withContext:taskTracker:completion:]_block_invoke";
      v29 = 2112;
      v30 = v9;
      v31 = 2112;
      v32 = v6;
      _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s speakableText = %@ dialogPhase = %@", buf, 0x20u);

    }
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    objc_msgSend(*(id *)(a1 + 48), "instrumentationContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "emitUUFRSaid:dialogIdentifier:dialogPhase:", v11, 0, v6);

    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v13 = MEMORY[0x24BDAC760];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __87__SVXServiceCommandHandlerUIRepeatIt_handleCommand_withContext_taskTracker_completion___block_invoke_12;
    v24[3] = &unk_24D24F018;
    v25 = v4;
    v26 = *(id *)(a1 + 56);
    v19[0] = v13;
    v19[1] = 3221225472;
    v19[2] = __87__SVXServiceCommandHandlerUIRepeatIt_handleCommand_withContext_taskTracker_completion___block_invoke_14;
    v19[3] = &unk_24D24D8B8;
    v20 = v25;
    v21 = *(id *)(a1 + 56);
    v14 = *(id *)(a1 + 64);
    v22 = *(_QWORD *)(a1 + 32);
    v23 = v14;
    v15 = *(_QWORD *)(a1 + 48);
    v16 = v25;
    objc_msgSend(v12, "enqueueRequest:languageCode:voiceName:gender:audioSessionID:preparation:finalization:taskTracker:analyticsContext:", v16, 0, 0, 0, 0, v24, v19, v15, 0);

    return;
  }
LABEL_9:
  v17 = *(_QWORD *)(a1 + 64);
  if (v17)
  {
    +[SVXServiceCommandResult resultFailureWithErrorCode:reason:](SVXServiceCommandResult, "resultFailureWithErrorCode:reason:", 0, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v17 + 16))(v17);

  }
}

void __87__SVXServiceCommandHandlerUIRepeatIt_handleCommand_withContext_taskTracker_completion___block_invoke_12(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 136315650;
    v6 = "-[SVXServiceCommandHandlerUIRepeatIt handleCommand:withContext:taskTracker:completion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_214934000, v2, OS_LOG_TYPE_INFO, "%s Begin TTS request %@ for %@.", (uint8_t *)&v5, 0x20u);
  }
}

void __87__SVXServiceCommandHandlerUIRepeatIt_handleCommand_withContext_taskTracker_completion___block_invoke_14(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v5 = a1[4];
    v6 = a1[5];
    v9 = 136315906;
    v10 = "-[SVXServiceCommandHandlerUIRepeatIt handleCommand:withContext:taskTracker:completion:]_block_invoke";
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s End TTS request %@ for %@ with result %@.", (uint8_t *)&v9, 0x2Au);
  }
  v7 = a1[7];
  if (v7)
  {
    objc_msgSend(*(id *)(a1[6] + 40), "toServiceCommandResult:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  }
}

+ (Class)supportedCommandClass
{
  return (Class)objc_opt_class();
}

@end
