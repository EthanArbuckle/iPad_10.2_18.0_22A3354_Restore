@implementation SVXServiceCommandHandlerPreSynthesizeTTS

- (SVXServiceCommandHandlerPreSynthesizeTTS)initWithSpeechSynthesizer:(id)a3 speechSynthesisUtils:(id)a4
{
  id v7;
  id v8;
  SVXServiceCommandHandlerPreSynthesizeTTS *v9;
  SVXServiceCommandHandlerPreSynthesizeTTS *v10;
  id v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  NSString *identifier;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SVXServiceCommandHandlerPreSynthesizeTTS;
  v9 = -[SVXServiceCommandHandlerPreSynthesizeTTS init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_speechSynthesizer, a3);
    objc_storeStrong((id *)&v10->_speechSynthesisUtils, a4);
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
  void (**v10)(id, void *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  SVXServiceCommandHandlerPreSynthesizeTTS *v24;
  id v25;

  v9 = a3;
  v10 = (void (**)(id, void *))a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SVXServiceCommandHandlerPreSynthesizeTTS.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[command isKindOfClass:[SAPreSynthesizeTTS class]]"));

  }
  v20 = v9;
  objc_msgSend(v20, "dialogStrings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "aceAudioData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "streamIds");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "speakableContextInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __93__SVXServiceCommandHandlerPreSynthesizeTTS_handleCommand_withContext_taskTracker_completion___block_invoke;
  v21[3] = &unk_24D24D688;
  v15 = v13;
  v22 = v15;
  v16 = v12;
  v23 = v16;
  v24 = self;
  v17 = v14;
  v25 = v17;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v21);
  if (v10)
  {
    +[SVXServiceCommandResult resultSuccess](SVXServiceCommandResult, "resultSuccess");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v18);

  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_speechSynthesisUtils, 0);
  objc_storeStrong((id *)&self->_speechSynthesizer, 0);
}

void __93__SVXServiceCommandHandlerPreSynthesizeTTS_handleCommand_withContext_taskTracker_completion___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  SVXSpeechSynthesisRequest *v9;
  uint64_t v10;
  id v11;
  SVXSpeechSynthesisRequest *v12;
  id v13;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  if (objc_msgSend(v5, "count") <= a3)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(*(id *)(a1 + 40), "count") <= a3)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "createAudioFromUIAudioData:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [SVXSpeechSynthesisRequest alloc];
  v10 = *(_QWORD *)(a1 + 56);
  if (objc_msgSend(v13, "length"))
    v11 = v13;
  else
    v11 = 0;
  v12 = -[SVXSpeechSynthesisRequest initWithPriority:options:speakableText:speakableContext:localizationKey:presynthesizedAudio:streamID:](v9, "initWithPriority:options:speakableText:speakableContext:localizationKey:presynthesizedAudio:streamID:", 2, 0, v6, v10, 0, v8, v11);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "synthesizeRequest:audioChunkHandler:taskTracker:analyticsContext:completion:", v12, 0, 0, 0, &__block_literal_global_8398);
}

void __93__SVXServiceCommandHandlerPreSynthesizeTTS_handleCommand_withContext_taskTracker_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (objc_msgSend(v2, "type") == 4)
  {
    v3 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      objc_msgSend(v2, "error");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 136315394;
      v7 = "-[SVXServiceCommandHandlerPreSynthesizeTTS handleCommand:withContext:taskTracker:completion:]_block_invoke_2";
      v8 = 2112;
      v9 = v5;
      _os_log_error_impl(&dword_214934000, v4, OS_LOG_TYPE_ERROR, "%s PreSynthesis failed: %@", (uint8_t *)&v6, 0x16u);

    }
  }

}

+ (Class)supportedCommandClass
{
  return (Class)objc_opt_class();
}

@end
