@implementation SVXServiceCommandHandlerUISayIt

- (SVXServiceCommandHandlerUISayIt)initWithSpeechSynthesizer:(id)a3 module:(id)a4 instrumentationUtils:(id)a5 synthesisResultConverter:(id)a6 speechSynthesisUtils:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _SVXRemoteExpressionParsingServiceProvider *v16;
  SVXSAUILParseableExpressionProvider *v17;
  SVXSayItChildTaskProvider *v18;
  SVXAFUtilitiesWrapper *v19;
  SVXServiceCommandHandlerUISayIt *v20;
  SVXAFSpeakableUtteranceParserProvider *v22;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v22 = objc_alloc_init(SVXAFSpeakableUtteranceParserProvider);
  v16 = objc_alloc_init(_SVXRemoteExpressionParsingServiceProvider);
  v17 = objc_alloc_init(SVXSAUILParseableExpressionProvider);
  v18 = objc_alloc_init(SVXSayItChildTaskProvider);
  v19 = objc_alloc_init(SVXAFUtilitiesWrapper);
  v20 = -[SVXServiceCommandHandlerUISayIt initWithSpeechSynthesizer:module:instrumentationUtils:synthesisResultConverter:speechSynthesisUtils:utteranceParserProvider:expressionParsingServiceProvider:parseableExpressionFactory:sayItChildTaskFactory:afUtilities:](self, "initWithSpeechSynthesizer:module:instrumentationUtils:synthesisResultConverter:speechSynthesisUtils:utteranceParserProvider:expressionParsingServiceProvider:parseableExpressionFactory:sayItChildTaskFactory:afUtilities:", v15, v14, v13, v12, v11, v22, v16, v17, v18, v19);

  return v20;
}

- (SVXServiceCommandHandlerUISayIt)initWithSpeechSynthesizer:(id)a3 module:(id)a4 instrumentationUtils:(id)a5 synthesisResultConverter:(id)a6 speechSynthesisUtils:(id)a7 utteranceParserProvider:(id)a8 expressionParsingServiceProvider:(id)a9 parseableExpressionFactory:(id)a10 sayItChildTaskFactory:(id)a11 afUtilities:(id)a12
{
  id v18;
  id v19;
  id v20;
  SVXServiceCommandHandlerUISayIt *v21;
  id v22;
  SVXServiceCommandHandlerUISayIt *v23;
  SVXServiceCommandHandlerUISayIt *v24;
  id v25;
  objc_class *v26;
  void *v27;
  uint64_t v28;
  NSString *identifier;
  void *v31;
  void *v32;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  objc_super v46;

  v18 = a3;
  v35 = a4;
  v19 = a4;
  v36 = a5;
  v45 = a5;
  v37 = a6;
  v20 = a6;
  v21 = self;
  v44 = v20;
  v43 = a7;
  v38 = a8;
  v42 = a8;
  v41 = a9;
  v40 = a10;
  v39 = a11;
  v22 = a12;
  if (v18)
  {
    if (v19)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, v21, CFSTR("SVXServiceCommandHandlerUISayIt.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("speechSynthesizer != nil"));

    if (v19)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, v21, CFSTR("SVXServiceCommandHandlerUISayIt.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("module != nil"));

LABEL_3:
  v46.receiver = v21;
  v46.super_class = (Class)SVXServiceCommandHandlerUISayIt;
  v23 = -[SVXServiceCommandHandlerUISayIt init](&v46, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_speechSynthesizer, a3);
    objc_storeStrong((id *)&v24->_module, v35);
    objc_storeStrong((id *)&v24->_instrumentationUtils, v36);
    objc_storeStrong((id *)&v24->_synthesisResultConverter, v37);
    objc_storeStrong((id *)&v24->_speechSynthesisUtils, a7);
    objc_storeStrong((id *)&v24->_utteranceParserProvider, v38);
    objc_storeStrong((id *)&v24->_expressionParsingServiceProvider, a9);
    objc_storeStrong((id *)&v24->_parseableExpressionFactory, a10);
    objc_storeStrong((id *)&v24->_sayItChildTaskFactory, a11);
    objc_storeStrong((id *)&v24->_afUtilities, a12);
    v25 = objc_alloc(MEMORY[0x24BDD17C8]);
    v26 = (objc_class *)objc_msgSend((id)objc_opt_class(), "supportedCommandClass");
    NSStringFromClass(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v25, "initWithFormat:", CFSTR("com.apple.SiriVOXService.service-command.%@"), v27);
    identifier = v24->_identifier;
    v24->_identifier = (NSString *)v28;

  }
  return v24;
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

- (void)prepareToHandleCommand:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, uint64_t, _QWORD);
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _SVXRemoteExpressionParsingServiceProvider *expressionParsingServiceProvider;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  SVXSAUILParseableExpressionProvider *parseableExpressionFactory;
  void *v32;
  _QWORD v33[4];
  id v34;
  void (**v35)(id, uint64_t, _QWORD);
  id v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(id, uint64_t, _QWORD))a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SVXServiceCommandHandlerUISayIt.m"), 115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[command isKindOfClass:[SAUISayIt class]]"));

  }
  v9 = v7;
  objc_msgSend(v9, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v10, "svx_isDeferredExpressionContextObject"))
  {
    v11 = objc_alloc(MEMORY[0x24BDBCEA0]);
    -[SVXModule preferences](self->_module, "preferences");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "languageCode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithLocaleIdentifier:", v13);

    -[SVXAFSpeakableUtteranceParserProvider getWithLocale:](self->_utteranceParserProvider, "getWithLocale:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "groupIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[_SVXSpeakableNamespaceDomainOccurrenceProvider providerForDomain:](_SVXSpeakableNamespaceDomainOccurrenceProvider, "providerForDomain:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "registerProvider:forNamespace:", v17, *MEMORY[0x24BE09468]);
    objc_msgSend(v9, "message");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v19 = (id)objc_msgSend(v15, "parseStringWithFormat:error:", v18, &v36);
    v20 = v36;

    if (v20 || !objc_msgSend(v17, "count"))
    {
      if (v8)
        v8[2](v8, 1, 0);
    }
    else
    {
      expressionParsingServiceProvider = self->_expressionParsingServiceProvider;
      v22 = objc_alloc_init(MEMORY[0x24BE09130]);
      -[_SVXRemoteExpressionParsingServiceProvider getWithAceHandler:](expressionParsingServiceProvider, "getWithAceHandler:", v22);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      parseableExpressionFactory = self->_parseableExpressionFactory;
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "UUIDString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "message");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SVXSAUILParseableExpressionProvider createWithAceId:context:expressionString:](parseableExpressionFactory, "createWithAceId:context:expressionString:", v24, v10, v25);
      v32 = v14;
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v37[0] = v26;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __69__SVXServiceCommandHandlerUISayIt_prepareToHandleCommand_completion___block_invoke;
      v33[3] = &unk_24D24D118;
      v34 = v26;
      v35 = v8;
      v28 = v26;
      objc_msgSend(v30, "parseExpressions:targetDevice:reply:", v27, 0, v33);

      v14 = v32;
    }

  }
  else if (v8)
  {
    v8[2](v8, 1, 0);
  }

}

- (void)handleCommand:(id)a3 withContext:(id)a4 taskTracker:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SVXSayItChildTaskProvider *sayItChildTaskFactory;
  void *v16;
  __CFString *v17;
  _BOOL4 v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  id v22;
  os_log_t *v23;
  NSObject *v24;
  SVXSpeechSynthesisUtils *speechSynthesisUtils;
  void *v26;
  void *v27;
  NSObject *v28;
  SVXInstrumentationUtilities *instrumentationUtils;
  void *v30;
  void *v31;
  void *v32;
  SVXSpeechSynthesisRequest *v33;
  SVXSpeechSynthesizer *speechSynthesizer;
  uint64_t v35;
  SVXSpeechSynthesisRequest *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  SVXSpeechSynthesisRequest *v46;
  id v47;
  SVXServiceCommandHandlerUISayIt *v48;
  id v49;
  _QWORD v50[4];
  SVXSpeechSynthesisRequest *v51;
  id v52;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  void *v56;
  const __CFString *v57;
  _QWORD v58[3];

  v58[1] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v42 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SVXServiceCommandHandlerUISayIt.m"), 165, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[command isKindOfClass:[SAUISayIt class]]"));

  }
  v14 = v11;
  kdebug_trace();
  sayItChildTaskFactory = self->_sayItChildTaskFactory;
  -[SVXModule preferences](self->_module, "preferences");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVXSayItChildTaskProvider createWithCommand:taskTracker:listenAfterSpeakingDisabled:](sayItChildTaskFactory, "createWithCommand:taskTracker:listenAfterSpeakingDisabled:", v14, v13, objc_msgSend(v16, "listenAfterSpeakingDisabled"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "dialogIdentifier");
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v18 = -[SVXAFUtilitiesWrapper af_IsInternalInstall](self->_afUtilities, "af_IsInternalInstall");
  v19 = 0;
  if (v18)
  {
    if (v17)
      v20 = v17;
    else
      v20 = &stru_24D24F378;
    v57 = CFSTR("dialogIdentifier");
    v58[0] = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v58, &v57, 1);
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v40 = (void *)v19;
  v21 = v13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = v12;
  }
  else
  {
    objc_msgSend(v14, "message");
    v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  v43 = v12;
  v44 = v22;
  v23 = (os_log_t *)MEMORY[0x24BE08FB0];
  v24 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v54 = "-[SVXServiceCommandHandlerUISayIt handleCommand:withContext:taskTracker:completion:]";
    v55 = 2112;
    v56 = v44;
    _os_log_impl(&dword_214934000, v24, OS_LOG_TYPE_INFO, "%s preparedSpeakableText = %@", buf, 0x16u);
  }
  speechSynthesisUtils = self->_speechSynthesisUtils;
  objc_msgSend(v14, "audioData");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVXSpeechSynthesisUtils createAudioFromUIAudioData:](speechSynthesisUtils, "createAudioFromUIAudioData:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = *v23;
  if (os_log_type_enabled(*v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v54 = "-[SVXServiceCommandHandlerUISayIt handleCommand:withContext:taskTracker:completion:]";
    v55 = 2112;
    v56 = v27;
    _os_log_impl(&dword_214934000, v28, OS_LOG_TYPE_INFO, "%s presynthesizedAudio = %@", buf, 0x16u);
  }
  instrumentationUtils = self->_instrumentationUtils;
  objc_msgSend(v21, "instrumentationContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "context");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "dialogPhase");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVXInstrumentationUtilities emitUUFRSaid:dialogIdentifier:dialogPhase:](instrumentationUtils, "emitUUFRSaid:dialogIdentifier:dialogPhase:", v30, v17, v32);

  v33 = -[SVXSpeechSynthesisRequest initWithPriority:options:speakableText:speakableContext:localizationKey:presynthesizedAudio:streamID:]([SVXSpeechSynthesisRequest alloc], "initWithPriority:options:speakableText:speakableContext:localizationKey:presynthesizedAudio:streamID:", 2, objc_msgSend(v14, "canUseServerTTS"), v44, 0, 0, v27, 0);
  speechSynthesizer = self->_speechSynthesizer;
  v35 = MEMORY[0x24BDAC760];
  v50[0] = MEMORY[0x24BDAC760];
  v50[1] = 3221225472;
  v50[2] = __84__SVXServiceCommandHandlerUISayIt_handleCommand_withContext_taskTracker_completion___block_invoke;
  v50[3] = &unk_24D24F018;
  v51 = v33;
  v52 = v14;
  v45[0] = v35;
  v45[1] = 3221225472;
  v45[2] = __84__SVXServiceCommandHandlerUISayIt_handleCommand_withContext_taskTracker_completion___block_invoke_34;
  v45[3] = &unk_24D24D8B8;
  v46 = v51;
  v47 = v14;
  v48 = self;
  v49 = v42;
  v36 = v51;
  v37 = v42;
  v38 = v14;
  -[SVXSpeechSynthesizer enqueueRequest:languageCode:voiceName:gender:audioSessionID:preparation:finalization:taskTracker:analyticsContext:](speechSynthesizer, "enqueueRequest:languageCode:voiceName:gender:audioSessionID:preparation:finalization:taskTracker:analyticsContext:", v36, 0, 0, 0, 0, v50, v45, v41, v40);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_speechSynthesisUtils, 0);
  objc_storeStrong((id *)&self->_synthesisResultConverter, 0);
  objc_storeStrong((id *)&self->_afUtilities, 0);
  objc_storeStrong((id *)&self->_sayItChildTaskFactory, 0);
  objc_storeStrong((id *)&self->_parseableExpressionFactory, 0);
  objc_storeStrong((id *)&self->_expressionParsingServiceProvider, 0);
  objc_storeStrong((id *)&self->_utteranceParserProvider, 0);
  objc_storeStrong((id *)&self->_instrumentationUtils, 0);
  objc_storeStrong((id *)&self->_module, 0);
  objc_storeStrong((id *)&self->_speechSynthesizer, 0);
}

void __84__SVXServiceCommandHandlerUISayIt_handleCommand_withContext_taskTracker_completion___block_invoke(uint64_t a1)
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
    v6 = "-[SVXServiceCommandHandlerUISayIt handleCommand:withContext:taskTracker:completion:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_214934000, v2, OS_LOG_TYPE_INFO, "%s Begin TTS request %@ for %@.", (uint8_t *)&v5, 0x20u);
  }
}

void __84__SVXServiceCommandHandlerUISayIt_handleCommand_withContext_taskTracker_completion___block_invoke_34(_QWORD *a1, void *a2)
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
    v10 = "-[SVXServiceCommandHandlerUISayIt handleCommand:withContext:taskTracker:completion:]_block_invoke";
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
    objc_msgSend(*(id *)(a1[6] + 72), "toServiceCommandResult:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  }
}

void __69__SVXServiceCommandHandlerUISayIt_prepareToHandleCommand_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  objc_msgSend(a3, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((_DWORD)a2
    && (objc_msgSend(v5, "parseableExpression"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32)),
        v7,
        v8))
  {
    objc_msgSend(v6, "parsedOutput");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v11 = (id)v9;
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, a2, v11);

}

+ (Class)supportedCommandClass
{
  return (Class)objc_opt_class();
}

@end
