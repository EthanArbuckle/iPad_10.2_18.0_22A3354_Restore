@implementation SVXServiceCommandHandler

- (void)reset
{
  void *v3;
  _QWORD v4[5];

  -[SVXModule performer](self->_module, "performer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __33__SVXServiceCommandHandler_reset__block_invoke;
  v4[3] = &unk_24D24EFF0;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

- (BOOL)isCommandUUFR:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SVXServiceCommandHandlerRegistry handlersForCommand:](self->_handlerRegistry, "handlersForCommand:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isCommandUUFR:", v4) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)handleCommand:(id)a3 taskTracker:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SVXModule performer](self->_module, "performer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __65__SVXServiceCommandHandler_handleCommand_taskTracker_completion___block_invoke;
  v15[3] = &unk_24D24F068;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "performBlock:", v15);

}

- (SVXServiceCommandHandler)initWithModule:(id)a3
{
  id v4;
  SVXServiceCommandHandlerFallback *v5;
  void *v6;
  SVXServiceCommandHandlerFallback *v7;
  SVXServiceCommandHandlerRegistryProvider *v8;
  SVXServiceCommandDelayedActionStoreProvider *v9;
  SVXServiceCommandHandler *v10;

  v4 = a3;
  v5 = [SVXServiceCommandHandlerFallback alloc];
  +[SVXServiceCommandResult resultIgnored](SVXServiceCommandResult, "resultIgnored");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SVXServiceCommandHandlerFallback initWithResult:](v5, "initWithResult:", v6);
  v8 = objc_alloc_init(SVXServiceCommandHandlerRegistryProvider);
  v9 = objc_alloc_init(SVXServiceCommandDelayedActionStoreProvider);
  v10 = -[SVXServiceCommandHandler initWithModule:fallbackHandler:commandHandlerRegistryFactory:delayedActionStoreFactory:](self, "initWithModule:fallbackHandler:commandHandlerRegistryFactory:delayedActionStoreFactory:", v4, v7, v8, v9);

  return v10;
}

- (SVXServiceCommandHandler)initWithModule:(id)a3 fallbackHandler:(id)a4 commandHandlerRegistryFactory:(id)a5 delayedActionStoreFactory:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SVXServiceCommandHandler *v15;
  SVXServiceCommandHandler *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SVXServiceCommandHandler;
  v15 = -[SVXServiceCommandHandler init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_module, a3);
    objc_storeStrong((id *)&v16->_fallbackHandler, a4);
    objc_storeStrong((id *)&v16->_commandHandlerRegistryFactory, a5);
    objc_storeStrong((id *)&v16->_delayedActionStoreFactory, a6);
  }

  return v16;
}

- (id)fallbackModeProvider
{
  MDFixedModeProvider *fallbackModeProvider;
  MDFixedModeProvider *v4;
  MDFixedModeProvider *v5;

  fallbackModeProvider = self->_fallbackModeProvider;
  if (!fallbackModeProvider)
  {
    v4 = (MDFixedModeProvider *)objc_msgSend(objc_alloc(MEMORY[0x24BE9C038]), "initWithFixedMode:", 1);
    v5 = self->_fallbackModeProvider;
    self->_fallbackModeProvider = v4;

    fallbackModeProvider = self->_fallbackModeProvider;
  }
  return fallbackModeProvider;
}

- (void)startWithModuleInstanceProvider:(id)a3 platformDependencies:(id)a4
{
  id v6;
  id v7;
  SVXServiceCommandDelayedActionStore *v8;
  SVXServiceCommandDelayedActionStore *delayedActionStore;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  os_log_t *v17;
  uint64_t i;
  void *v19;
  void *v20;
  NSObject *v21;
  MDFixedModeProvider *v22;
  SVXInstrumentationUtilities *v23;
  SVXDialogTransformer *v24;
  SVXSpeechSynthesisResultConverter *v25;
  SVXServiceCommandHandlerUIAddViews *v26;
  SVXSpeechSynthesisUtils *v27;
  SVXServiceCommandHandlerUISayIt *v28;
  uint64_t v29;
  uint64_t v30;
  SVXServiceCommandHandlerUIDelayedActionCancelCommand *v31;
  SVXServiceCommandDelayedActionStore *v32;
  SVXServiceCommandHandlerUIDelayedActionCommand *v33;
  SVXServiceCommandDelayedActionStore *v34;
  SVXServiceCommandHandlerUIRepeatIt *v35;
  SVXServiceCommandHandlerUIRepeatIt *v36;
  SVXServiceCommandHandlerUIShowRequestHandlingStatus *v37;
  void *v38;
  SVXServiceCommandHandlerUIShowRequestHandlingStatus *v39;
  SVXServiceCommandHandlerClientCoordinationPhoneCall *v40;
  _SVXServiceCommandHandlerSmsPlayAudio *v41;
  _SVXServiceCommandHandlerPlayVoiceMail *v42;
  void *v43;
  id v44;
  void *v45;
  SVXServiceCommandHandlerRegistry *v46;
  SVXServiceCommandHandlerRegistry *handlerRegistry;
  NSMutableSet *v48;
  NSMutableSet *transactions;
  void *v50;
  SVXServiceCommandHandlerUIDelayedActionCommand *v51;
  void *v52;
  SVXServiceCommandHandlerUIDelayedActionCancelCommand *v53;
  void *v54;
  SVXServiceCommandHandlerUICloseAssistant *v55;
  SVXServiceCommandHandlerUIAddDialogs *v56;
  SVXServiceCommandHandlerPreSynthesizeTTS *v57;
  void *v58;
  SVXServiceCommandHandlerUISayIt *v59;
  SVXSpeechSynthesisUtils *v60;
  SVXServiceCommandHandlerUIAddViews *v61;
  SVXSpeechSynthesisResultConverter *v62;
  SVXDialogTransformer *v63;
  MDFixedModeProvider *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  SVXInstrumentationUtilities *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD v74[12];
  _QWORD v75[2];
  uint8_t buf[4];
  const char *v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SVXServiceCommandDelayedActionStoreProvider create](self->_delayedActionStoreFactory, "create");
  v8 = (SVXServiceCommandDelayedActionStore *)objc_claimAutoreleasedReturnValue();
  delayedActionStore = self->_delayedActionStore;
  self->_delayedActionStore = v8;

  objc_msgSend(v6, "sessionManager");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v6;
  objc_msgSend(v6, "speechSynthesizer");
  v10 = objc_claimAutoreleasedReturnValue();
  v65 = v7;
  v67 = (void *)v10;
  if (!objc_msgSend(v7, "count"))
  {
    v11 = 0;
    goto LABEL_22;
  }
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
  if (!v13)
  {

    goto LABEL_22;
  }
  v14 = v13;
  v15 = 0;
  v16 = *(_QWORD *)v71;
  v17 = (os_log_t *)MEMORY[0x24BE08FA8];
  do
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v71 != v16)
        objc_enumerationMutation(v12);
      v19 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
      if (objc_msgSend(v19, "type") == 1)
      {
        objc_msgSend(v19, "serviceCommandHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
          objc_msgSend(v11, "addObject:", v20);
      }
      else
      {
        if (objc_msgSend(v19, "type") != 4)
          continue;
        if (v15)
        {
          v21 = *v17;
          if (os_log_type_enabled(*v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v77 = "-[SVXServiceCommandHandler startWithModuleInstanceProvider:platformDependencies:]";
            _os_log_error_impl(&dword_214934000, v21, OS_LOG_TYPE_ERROR, "%s More than one platform dependency of type SVXPlatformDependencyTypeSiriModesManager has been provided. Will pick the last one in the array.", buf, 0xCu);
          }
        }
        objc_msgSend(v19, "siriModesManager");
        v20 = v15;
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
  }
  while (v14);

  v10 = (uint64_t)v67;
  if (v15)
  {
    objc_msgSend(v15, "modeProvider");
    v22 = (MDFixedModeProvider *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
LABEL_22:
  v22 = self->_fallbackModeProvider;
  v15 = 0;
LABEL_23:
  v23 = objc_alloc_init(SVXInstrumentationUtilities);
  v24 = -[SVXDialogTransformer initWithModeProvider:]([SVXDialogTransformer alloc], "initWithModeProvider:", v22);
  v25 = objc_alloc_init(SVXSpeechSynthesisResultConverter);
  v69 = v23;
  v64 = v22;
  v26 = -[SVXServiceCommandHandlerUIAddViews initWithSpeechSynthesizer:module:instrumentationUtils:modeProvider:dialogTransformer:synthesisResultConverter:]([SVXServiceCommandHandlerUIAddViews alloc], "initWithSpeechSynthesizer:module:instrumentationUtils:modeProvider:dialogTransformer:synthesisResultConverter:", v10, self->_module, v23, v22, v24, v25);
  v27 = objc_alloc_init(SVXSpeechSynthesisUtils);
  v28 = -[SVXServiceCommandHandlerUISayIt initWithSpeechSynthesizer:module:instrumentationUtils:synthesisResultConverter:speechSynthesisUtils:]([SVXServiceCommandHandlerUISayIt alloc], "initWithSpeechSynthesizer:module:instrumentationUtils:synthesisResultConverter:speechSynthesisUtils:", v10, self->_module, v23, v25, v27);
  v75[0] = v26;
  v75[1] = v28;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v75, 2);
  v29 = v10;
  v30 = objc_claimAutoreleasedReturnValue();
  v60 = v27;
  v57 = -[SVXServiceCommandHandlerPreSynthesizeTTS initWithSpeechSynthesizer:speechSynthesisUtils:]([SVXServiceCommandHandlerPreSynthesizeTTS alloc], "initWithSpeechSynthesizer:speechSynthesisUtils:", v29, v27);
  v74[0] = v57;
  v58 = (void *)v30;
  v63 = v24;
  v56 = -[SVXServiceCommandHandlerUIAddDialogs initWithHandlers:dialogTransformer:]([SVXServiceCommandHandlerUIAddDialogs alloc], "initWithHandlers:dialogTransformer:", v30, v24);
  v74[1] = v56;
  v74[2] = v26;
  v61 = v26;
  v55 = -[SVXServiceCommandHandlerUICloseAssistant initWithSessionManager:]([SVXServiceCommandHandlerUICloseAssistant alloc], "initWithSessionManager:", v68);
  v74[3] = v55;
  v31 = [SVXServiceCommandHandlerUIDelayedActionCancelCommand alloc];
  v32 = self->_delayedActionStore;
  -[SVXModule performer](self->_module, "performer");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = -[SVXServiceCommandHandlerUIDelayedActionCancelCommand initWithDelayedActionStore:performer:](v31, "initWithDelayedActionStore:performer:", v32, v54);
  v74[4] = v53;
  v33 = [SVXServiceCommandHandlerUIDelayedActionCommand alloc];
  v34 = self->_delayedActionStore;
  -[SVXModule performer](self->_module, "performer");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = -[SVXServiceCommandHandlerUIDelayedActionCommand initWithDelayedActionStore:sessionManager:performer:](v33, "initWithDelayedActionStore:sessionManager:performer:", v34, v68, v52);
  v74[5] = v51;
  v35 = [SVXServiceCommandHandlerUIRepeatIt alloc];
  -[SVXModule performer](self->_module, "performer");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v25;
  v36 = -[SVXServiceCommandHandlerUIRepeatIt initWithSpeechSynthesizer:performer:instrumentationUtils:synthesisResultConverter:](v35, "initWithSpeechSynthesizer:performer:instrumentationUtils:synthesisResultConverter:", v29, v50, v69, v25);
  v74[6] = v36;
  v74[7] = v28;
  v59 = v28;
  v37 = [SVXServiceCommandHandlerUIShowRequestHandlingStatus alloc];
  -[SVXModule performer](self->_module, "performer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[SVXServiceCommandHandlerUIShowRequestHandlingStatus initWithSessionManager:performer:](v37, "initWithSessionManager:performer:", v68, v38);
  v74[8] = v39;
  v40 = -[SVXServiceCommandHandlerClientCoordinationPhoneCall initWithSessionManager:]([SVXServiceCommandHandlerClientCoordinationPhoneCall alloc], "initWithSessionManager:", v68);
  v74[9] = v40;
  v41 = -[_SVXServiceCommandHandlerSmsPlayAudio initWithSessionManager:module:]([_SVXServiceCommandHandlerSmsPlayAudio alloc], "initWithSessionManager:module:", v68, self->_module);
  v74[10] = v41;
  v42 = -[_SVXServiceCommandHandlerPlayVoiceMail initWithSessionManager:module:]([_SVXServiceCommandHandlerPlayVoiceMail alloc], "initWithSessionManager:module:", v68, self->_module);
  v74[11] = v42;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v74, 12);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v43, "arrayByAddingObjectsFromArray:", v11);
    v44 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v44 = v43;
  }
  v45 = v44;
  -[SVXServiceCommandHandlerRegistryProvider createWithHandlers:](self->_commandHandlerRegistryFactory, "createWithHandlers:", v44);
  v46 = (SVXServiceCommandHandlerRegistry *)objc_claimAutoreleasedReturnValue();
  handlerRegistry = self->_handlerRegistry;
  self->_handlerRegistry = v46;

  v48 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
  transactions = self->_transactions;
  self->_transactions = v48;

}

- (void)stopWithModuleInstanceProvider:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[SVXModule performer](self->_module, "performer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __59__SVXServiceCommandHandler_stopWithModuleInstanceProvider___block_invoke;
  v5[3] = &unk_24D24EFF0;
  v5[4] = self;
  objc_msgSend(v4, "performBlock:", v5);

}

- (void)_reset
{
  os_log_t *v3;
  void *v4;
  NSMutableSet *transactions;
  NSObject *v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  os_log_t v12;
  NSMutableSet *v13;
  NSObject *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = (os_log_t *)MEMORY[0x24BE08FB0];
  v4 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    transactions = self->_transactions;
    v6 = v4;
    *(_DWORD *)buf = 136315394;
    v22 = "-[SVXServiceCommandHandler _reset]";
    v23 = 2048;
    v24 = -[NSMutableSet count](transactions, "count");
    _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s Invalidating %tu transactions...", buf, 0x16u);

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = self->_transactions;
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11++), "invalidate", (_QWORD)v16);
      }
      while (v9 != v11);
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  v12 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
  {
    v13 = self->_transactions;
    v14 = v12;
    v15 = -[NSMutableSet count](v13, "count");
    *(_DWORD *)buf = 136315394;
    v22 = "-[SVXServiceCommandHandler _reset]";
    v23 = 2048;
    v24 = v15;
    _os_log_impl(&dword_214934000, v14, OS_LOG_TYPE_INFO, "%s Removing %tu transactions...", buf, 0x16u);

  }
  -[NSMutableSet removeAllObjects](self->_transactions, "removeAllObjects", (_QWORD)v16);
  -[SVXServiceCommandDelayedActionStore removeAllActions](self->_delayedActionStore, "removeAllActions");
}

- (void)_handleCommand:(id)a3 taskTracker:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  SVXServiceCommandTransaction *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  SVXServiceCommandTransaction *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;
  id v25;
  id location;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SVXServiceCommandHandlerRegistry handlersForCommand:](self->_handlerRegistry, "handlersForCommand:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "count"))
  {
    v27[0] = self->_fallbackHandler;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  objc_initWeak(&location, self);
  v13 = [SVXServiceCommandTransaction alloc];
  -[SVXModule performer](self->_module, "performer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)-[NSMutableSet copy](self->_transactions, "copy");
  v19 = MEMORY[0x24BDAC760];
  v20 = 3221225472;
  v21 = __66__SVXServiceCommandHandler__handleCommand_taskTracker_completion___block_invoke;
  v22 = &unk_24D24BE48;
  objc_copyWeak(&v25, &location);
  v16 = v8;
  v23 = v16;
  v17 = v10;
  v24 = v17;
  v18 = -[SVXServiceCommandTransaction initWithPerformer:command:handlers:taskTracker:dependencies:completion:](v13, "initWithPerformer:command:handlers:taskTracker:dependencies:completion:", v14, v16, v11, v9, v15, &v19);

  -[NSMutableSet addObject:](self->_transactions, "addObject:", v18, v19, v20, v21, v22);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

- (void)handleResult:(id)a3 forCommand:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x24BDAC760];
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = __63__SVXServiceCommandHandler_handleResult_forCommand_completion___block_invoke;
  v43[3] = &unk_24D24EF28;
  v12 = v10;
  v45 = v12;
  v13 = v9;
  v44 = v13;
  v14 = (void *)MEMORY[0x2199D950C](v43);
  v40[0] = v11;
  v40[1] = 3221225472;
  v40[2] = __63__SVXServiceCommandHandler_handleResult_forCommand_completion___block_invoke_2;
  v40[3] = &unk_24D24EF28;
  v15 = v12;
  v42 = v15;
  v16 = v13;
  v41 = v16;
  v17 = (void *)MEMORY[0x2199D950C](v40);
  v37[0] = v11;
  v37[1] = 3221225472;
  v37[2] = __63__SVXServiceCommandHandler_handleResult_forCommand_completion___block_invoke_3;
  v37[3] = &unk_24D24BE70;
  v18 = v15;
  v38 = v16;
  v39 = v18;
  v19 = v16;
  v20 = (void *)MEMORY[0x2199D950C](v37);
  v35[0] = v11;
  v35[1] = 3221225472;
  v35[2] = __63__SVXServiceCommandHandler_handleResult_forCommand_completion___block_invoke_4;
  v35[3] = &unk_24D24BE98;
  v36 = v18;
  v21 = v18;
  v22 = (void *)MEMORY[0x2199D950C](v35);
  -[SVXModule performer](self->_module, "performer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v11;
  v29[1] = 3221225472;
  v29[2] = __63__SVXServiceCommandHandler_handleResult_forCommand_completion___block_invoke_5;
  v29[3] = &unk_24D24BEC0;
  v30 = v8;
  v31 = v14;
  v32 = v17;
  v33 = v20;
  v34 = v22;
  v24 = v22;
  v25 = v20;
  v26 = v17;
  v27 = v14;
  v28 = v8;
  objc_msgSend(v23, "performBlock:", v29);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackModeProvider, 0);
  objc_storeStrong((id *)&self->_transactions, 0);
  objc_storeStrong((id *)&self->_delayedActionStore, 0);
  objc_storeStrong((id *)&self->_handlerRegistry, 0);
  objc_storeStrong((id *)&self->_delayedActionStoreFactory, 0);
  objc_storeStrong((id *)&self->_commandHandlerRegistryFactory, 0);
  objc_storeStrong((id *)&self->_fallbackHandler, 0);
  objc_storeStrong((id *)&self->_module, 0);
}

void __63__SVXServiceCommandHandler_handleResult_forCommand_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (*(_QWORD *)(a1 + 40))
  {
    v3 = objc_alloc_init(MEMORY[0x24BE811B0]);
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRefId:", v2);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __63__SVXServiceCommandHandler_handleResult_forCommand_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  if (*(_QWORD *)(a1 + 40))
  {
    v3 = objc_alloc_init(MEMORY[0x24BE811B8]);
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRefId:", v2);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __63__SVXServiceCommandHandler_handleResult_forCommand_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v5;
  id v6;
  void *v7;
  id v8;

  if (*(_QWORD *)(a1 + 40))
  {
    v5 = (objc_class *)MEMORY[0x24BE811A8];
    v6 = a3;
    v8 = objc_alloc_init(v5);
    objc_msgSend(v8, "setErrorCode:", a2);
    objc_msgSend(v8, "setReason:", v6);

    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRefId:", v7);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __63__SVXServiceCommandHandler_handleResult_forCommand_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __63__SVXServiceCommandHandler_handleResult_forCommand_completion___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleResultUsingIgnoredBlock:successBlock:failureBlock:commandBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __66__SVXServiceCommandHandler__handleCommand_taskTracker_completion___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "handleResult:forCommand:completion:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __59__SVXServiceCommandHandler_stopWithModuleInstanceProvider___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "_reset");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 56);
  *(_QWORD *)(v4 + 56) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = 0;

}

uint64_t __65__SVXServiceCommandHandler_handleCommand_taskTracker_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCommand:taskTracker:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __33__SVXServiceCommandHandler_reset__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reset");
}

@end
