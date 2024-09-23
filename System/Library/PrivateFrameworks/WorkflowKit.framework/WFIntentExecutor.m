@implementation WFIntentExecutor

- (WFIntentExecutor)initWithIntent:(id)a3 donateInteraction:(BOOL)a4 groupIdentifier:(id)a5
{
  return -[WFIntentExecutor initWithIntent:donateInteraction:groupIdentifier:requiresTrustCheck:](self, "initWithIntent:donateInteraction:groupIdentifier:requiresTrustCheck:", a3, a4, a5, 1);
}

- (WFIntentExecutor)initWithIntent:(id)a3 donateInteraction:(BOOL)a4 groupIdentifier:(id)a5 requiresTrustCheck:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v8;
  id v10;
  id v11;
  WFIntentExecutor *v12;
  uint64_t v13;
  INCExtensionConnection *connection;
  void *v15;
  uint64_t v16;
  NSProgress *progress;
  WFIntentExecutor *v18;
  objc_super v20;

  v6 = a6;
  v8 = a4;
  v10 = a3;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WFIntentExecutor;
  v12 = -[WFIntentExecutor init](&v20, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D3E530]), "initWithIntent:supportedExtensionTypes:donateInteraction:groupIdentifier:remoteProxyProvider:", v10, 7, v8, v11, 0);
    connection = v12->_connection;
    v12->_connection = (INCExtensionConnection *)v13;

    -[INCExtensionConnection setRequiresTCC:](v12->_connection, "setRequiresTCC:", 0);
    -[INCExtensionConnection setRequiresTrustCheck:](v12->_connection, "setRequiresTrustCheck:", v6);
    -[WFIntentExecutor extensionInputItemsWithIntent:](v12, "extensionInputItemsWithIntent:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCExtensionConnection setExtensionInputItems:](v12->_connection, "setExtensionInputItems:", v15);

    v16 = objc_opt_new();
    progress = v12->_progress;
    v12->_progress = (NSProgress *)v16;

    v18 = v12;
  }

  return v12;
}

- (id)extensionInputItemsWithIntent:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0CB35E8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = objc_msgSend(v4, "_executionContext");

  if (v7 <= 9 && ((1 << v7) & 0x206) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CBDA90], "siriLanguageCode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)_CFLocaleCopyPreferred();
    objc_msgSend(v9, "languageIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v8, *MEMORY[0x1E0CBDD78]);

  objc_msgSend(v5, "setUserInfo:", v6);
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (INIntent)intent
{
  return (INIntent *)-[INCExtensionConnection intent](self->_connection, "intent");
}

- (void)startWithCompletionHandler:(id)a3
{
  void *v4;
  id completionHandler;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];

  v4 = (void *)objc_msgSend(a3, "copy");
  completionHandler = self->_completionHandler;
  self->_completionHandler = v4;

  -[WFIntentExecutor retainSelf](self, "retainSelf");
  -[WFIntentExecutor progress](self, "progress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCompletedUnitCount:", 0);

  if (-[WFIntentExecutor skipResolveAndConfirm](self, "skipResolveAndConfirm"))
    v7 = 2;
  else
    v7 = 4;
  -[WFIntentExecutor progress](self, "progress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTotalUnitCount:", v7);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__WFIntentExecutor_startWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E7AF1540;
  v9[4] = self;
  -[WFIntentExecutor startConnectionWithCompletionHandler:](self, "startConnectionWithCompletionHandler:", v9);
}

- (void)startConnectionForParameterName:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  WFIntentExecutor *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__WFIntentExecutor_startConnectionForParameterName_completionHandler___block_invoke;
  v10[3] = &unk_1E7AF1608;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v6;
  v9 = v7;
  -[WFIntentExecutor startConnectionWithCompletionHandler:](self, "startConnectionWithCompletionHandler:", v10);

}

- (void)getDefaultValueForParameterNamed:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = a3;
  -[WFIntentExecutor retainSelf](self, "retainSelf");
  -[WFIntentExecutor connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAppProtectionPolicy:", 1);

  -[WFIntentExecutor startConnectionForParameterName:completionHandler:](self, "startConnectionForParameterName:completionHandler:", v8, v6);
}

- (void)startConnectionForParameterName:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  WFIntentExecutor *v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__WFIntentExecutor_startConnectionForParameterName_searchTerm_completionHandler___block_invoke;
  v14[3] = &unk_1E7AF15B8;
  v15 = v8;
  v16 = v9;
  v17 = self;
  v18 = v10;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  -[WFIntentExecutor startConnectionWithCompletionHandler:](self, "startConnectionWithCompletionHandler:", v14);

}

- (void)getDynamicOptionsForParameterNamed:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v11 = a3;
  -[WFIntentExecutor retainSelf](self, "retainSelf");
  -[WFIntentExecutor connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAppProtectionPolicy:", 1);

  -[WFIntentExecutor startConnectionForParameterName:searchTerm:completionHandler:](self, "startConnectionForParameterName:searchTerm:completionHandler:", v11, v9, v8);
}

- (void)configureConnection
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  -[WFIntentExecutor connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFIntentExecutor intent](self, "intent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.PassKit.PassKitIntentsExtension"));

  if (v6)
    objc_msgSend(v3, "setRequestTimeoutInterval:", 60.0);
  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __39__WFIntentExecutor_configureConnection__block_invoke;
  v10[3] = &unk_1E7AF15E0;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v3, "setTimeoutHandler:", v10);
  v8[0] = v7;
  v8[1] = 3221225472;
  v8[2] = __39__WFIntentExecutor_configureConnection__block_invoke_2;
  v8[3] = &unk_1E7AF15E0;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "setInterruptionHandler:", v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)startConnectionWithCompletionHandler:(id)a3
{
  id v4;
  WFAutoIncrementingProgress *v5;
  void *v6;
  WFAutoIncrementingProgress *v7;
  WFAutoIncrementingProgress *v8;
  id v9;
  _QWORD v10[5];
  WFAutoIncrementingProgress *v11;
  id v12;

  v4 = a3;
  -[WFIntentExecutor configureConnection](self, "configureConnection");
  v5 = [WFAutoIncrementingProgress alloc];
  -[WFIntentExecutor progress](self, "progress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFAutoIncrementingProgress initWithParent:pendingUnitCount:duration:](v5, "initWithParent:pendingUnitCount:duration:", v6, 1, 1.0);

  -[WFAutoIncrementingProgress start](v7, "start");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__WFIntentExecutor_startConnectionWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E7AF1608;
  v11 = v7;
  v12 = v4;
  v10[4] = self;
  v8 = v7;
  v9 = v4;
  -[WFIntentExecutor resumeConnectionWithCompletionHandler:](self, "resumeConnectionWithCompletionHandler:", v10);

}

- (void)resumeConnectionWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WFIntentExecutor connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__WFIntentExecutor_resumeConnectionWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E7AF1658;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "resumeWithCompletionHandler:", v7);

}

- (void)resolveIntent:(id)a3 withExtensionProxy:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  WFAutoIncrementingProgress *v12;
  void *v13;
  WFAutoIncrementingProgress *v14;
  WFAutoIncrementingProgress *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  WFAutoIncrementingProgress *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  getWFIntentExecutionLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v22 = "-[WFIntentExecutor resolveIntent:withExtensionProxy:]";
    v23 = 2112;
    v24 = v6;
    v25 = 2112;
    v26 = v7;
    _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_DEFAULT, "%s Resolving %@ with extension proxy %@", buf, 0x20u);
  }

  objc_msgSend(v6, "_intentInstanceDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "slotDescriptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "if_compactMap:", &__block_literal_global_33083);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count"))
  {
    v12 = [WFAutoIncrementingProgress alloc];
    -[WFIntentExecutor progress](self, "progress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[WFAutoIncrementingProgress initWithParent:pendingUnitCount:duration:](v12, "initWithParent:pendingUnitCount:duration:", v13, 1, 0.5);

    -[WFAutoIncrementingProgress start](v14, "start");
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __53__WFIntentExecutor_resolveIntent_withExtensionProxy___block_invoke_2;
    v17[3] = &unk_1E7AF1760;
    v17[4] = self;
    v18 = v6;
    v19 = v7;
    v20 = v14;
    v15 = v14;
    objc_msgSend(v19, "resolveIntentSlotKeyPaths:completionHandler:", v11, v17);

  }
  else
  {
    -[WFIntentExecutor progress](self, "progress");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setCompletedUnitCount:", objc_msgSend(v16, "completedUnitCount") + 1);

    -[WFIntentExecutor confirmIntent:withExtensionProxy:](self, "confirmIntent:withExtensionProxy:", v6, v7);
  }

}

- (void)resolveIntentResolutionResults:(id)a3 slotDescription:(id)a4 intent:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD v29[3];
  char v30;
  _QWORD v31[5];
  id v32;
  _QWORD v33[5];
  id v34;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__33076;
  v33[4] = __Block_byref_object_dispose__33077;
  v34 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__33076;
  v31[4] = __Block_byref_object_dispose__33077;
  v32 = (id)objc_msgSend(v12, "copy");
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v14 = MEMORY[0x1E0C809B0];
  v30 = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __85__WFIntentExecutor_resolveIntentResolutionResults_slotDescription_intent_completion___block_invoke;
  v23[3] = &unk_1E7AF17B0;
  v23[4] = self;
  v15 = v11;
  v24 = v15;
  v16 = v12;
  v25 = v16;
  v26 = v29;
  v27 = v31;
  v28 = v33;
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __85__WFIntentExecutor_resolveIntentResolutionResults_slotDescription_intent_completion___block_invoke_3;
  v18[3] = &unk_1E7AF17D8;
  v17 = v13;
  v19 = v17;
  v20 = v29;
  v21 = v31;
  v22 = v33;
  objc_msgSend(v10, "if_enumerateAsynchronouslyInSequence:completionHandler:", v23, v18);

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);

  _Block_object_dispose(v33, 8);
}

- (void)confirmIntent:(id)a3 withExtensionProxy:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  WFAutoIncrementingProgress *v9;
  void *v10;
  WFAutoIncrementingProgress *v11;
  id v12;
  WFAutoIncrementingProgress *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  WFAutoIncrementingProgress *v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  getWFIntentExecutionLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v20 = "-[WFIntentExecutor confirmIntent:withExtensionProxy:]";
    v21 = 2112;
    v22 = v6;
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_DEFAULT, "%s Confirming %@ with extension proxy %@", buf, 0x20u);
  }

  v9 = [WFAutoIncrementingProgress alloc];
  -[WFIntentExecutor progress](self, "progress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WFAutoIncrementingProgress initWithParent:pendingUnitCount:duration:](v9, "initWithParent:pendingUnitCount:duration:", v10, 1, 1.0);

  -[WFAutoIncrementingProgress start](v11, "start");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __53__WFIntentExecutor_confirmIntent_withExtensionProxy___block_invoke;
  v15[3] = &unk_1E7AF1828;
  v15[4] = self;
  v16 = v6;
  v17 = v11;
  v18 = v7;
  v12 = v7;
  v13 = v11;
  v14 = v6;
  objc_msgSend(v12, "confirmIntentWithCompletionHandler:", v15);

}

- (void)handleIntent:(id)a3 withExtensionProxy:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__WFIntentExecutor_handleIntent_withExtensionProxy___block_invoke;
  v4[3] = &unk_1E7AF1850;
  v4[4] = self;
  -[WFIntentExecutor handleIntent:withExtensionProxy:completionHandler:](self, "handleIntent:withExtensionProxy:completionHandler:", a3, a4, v4);
}

- (void)handleIntent:(id)a3 withExtensionProxy:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  WFAutoIncrementingProgress *v12;
  void *v13;
  WFAutoIncrementingProgress *v14;
  WFAutoIncrementingProgress *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  WFAutoIncrementingProgress *v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  getWFIntentExecutionLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v23 = "-[WFIntentExecutor handleIntent:withExtensionProxy:completionHandler:]";
    v24 = 2112;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_DEFAULT, "%s Handling %@ with extension proxy %@", buf, 0x20u);
  }

  v12 = [WFAutoIncrementingProgress alloc];
  -[WFIntentExecutor progress](self, "progress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[WFAutoIncrementingProgress initWithParent:pendingUnitCount:duration:](v12, "initWithParent:pendingUnitCount:duration:", v13, 1, 5.0);

  -[WFAutoIncrementingProgress start](v14, "start");
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __70__WFIntentExecutor_handleIntent_withExtensionProxy_completionHandler___block_invoke;
  v18[3] = &unk_1E7AF1878;
  v18[4] = self;
  v19 = v8;
  v20 = v14;
  v21 = v10;
  v15 = v14;
  v16 = v10;
  v17 = v8;
  objc_msgSend(v9, "handleIntentWithCompletionHandler:", v18);

}

- (void)updateIntentWithItemToConfirm:(id)a3 forSlot:(id)a4 onIntent:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!objc_msgSend(v8, "isEnum"))
  {
    if (objc_msgSend(v8, "valueStyle") == 3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      if (!v7)
      {
        v10 = 0;
        goto LABEL_14;
      }
      v15[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v8, "valueStyle") == 3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_msgSend(v8, "facadePropertyName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v9;
        v11 = v7;
        goto LABEL_9;
      }
      objc_msgSend(v7, "firstObject");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v13;
LABEL_14:
    objc_msgSend(v8, "facadePropertyName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forKey:", v10, v14);

    goto LABEL_15;
  }
  objc_msgSend(v8, "facadePropertyName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = &unk_1E7B8B5D8;
  v12 = v9;
LABEL_9:
  objc_msgSend(v12, "setValue:forKey:", v11, v10);
LABEL_15:

}

- (void)startReceivingRideStatusUpdates
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  -[WFIntentExecutor intent](self, "intent");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[WFIntentExecutor getRideStatusUpdatingExtensionProxy](self, "getRideStatusUpdatingExtensionProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      -[WFIntentExecutor connection](self, "connection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_transaction");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setShouldResetRequestAfterHandle:", 0);

      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __51__WFIntentExecutor_startReceivingRideStatusUpdates__block_invoke;
      v7[3] = &unk_1E7AF1540;
      v7[4] = self;
      -[WFIntentExecutor startConnectionWithCompletionHandler:](self, "startConnectionWithCompletionHandler:", v7);
    }
  }
  else
  {

  }
}

- (void)stopReceivingRideStatusUpdates
{
  void *v3;
  char isKindOfClass;
  void *v5;

  -[WFIntentExecutor intent](self, "intent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[WFIntentExecutor getRideStatusUpdatingExtensionProxy](self, "getRideStatusUpdatingExtensionProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopSendingUpdates");

    -[WFIntentExecutor setGetRideStatusUpdatingExtensionProxy:](self, "setGetRideStatusUpdatingExtensionProxy:", 0);
    -[WFIntentExecutor finish](self, "finish");
  }
}

- (void)intentResponseDidUpdate:(id)a3 withSerializedCacheItems:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v12;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;
  -[WFIntentExecutor delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[WFIntentExecutor delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "intentExecutor:receivingRideStatusDidReceiveUpdate:", self, v8);

  }
}

- (id)errorFromExtensionError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[WFIntentExecutor intent](self, "intent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("WFIntentExecutorIntentErrorKey"));

  if (v4)
    objc_msgSend(v5, "setObject:forKey:", v4, *MEMORY[0x1E0CB3388]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFIntentExecutorErrorDomain"), 100, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)errorFromConfirmResponse:(id)a3 intent:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "_intentResponseCode");
  if ((unint64_t)(v7 - 1) < 8 && ((0x8Du >> (v7 - 1)) & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v12[0] = CFSTR("WFIntentExecutorIntentErrorKey");
    v12[1] = CFSTR("WFIntentExecutorIntentResponseErrorKey");
    v13[0] = v6;
    v13[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("WFIntentExecutorErrorDomain"), 102, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)errorFromHandleResponse:(id)a3 intent:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "_intentResponseCode");
  if (v7 > 4 || ((1 << v7) & 0x1A) == 0)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v13[0] = CFSTR("WFIntentExecutorIntentErrorKey");
    v13[1] = CFSTR("WFIntentExecutorIntentResponseErrorKey");
    v14[0] = v6;
    v14[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("WFIntentExecutorErrorDomain"), 103, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)errorFromResolutionResult:(id)a3 forSlot:(id)a4 onIntent:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("WFIntentExecutorSlotResolutionResultErrorKey");
  v14[1] = CFSTR("WFIntentExecutorSlotDescriptionErrorKey");
  v15[0] = a3;
  v15[1] = a4;
  v14[2] = CFSTR("WFIntentExecutorIntentErrorKey");
  v15[2] = a5;
  v7 = (void *)MEMORY[0x1E0C99D80];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFIntentExecutorErrorDomain"), 101, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)finishWithInteraction:(id)a3 error:(id)a4
{
  void (**completionHandler)(id, id, id);
  id v6;

  completionHandler = (void (**)(id, id, id))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, a3, a4);
    v6 = self->_completionHandler;
    self->_completionHandler = 0;

  }
  -[WFIntentExecutor finish](self, "finish", a3, a4);
}

- (void)finishWithInteraction:(id)a3
{
  -[WFIntentExecutor finishWithInteraction:error:](self, "finishWithInteraction:error:", a3, 0);
}

- (void)failWithError:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFIntentExecutionLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[WFIntentExecutor failWithError:]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1C15B3000, v5, OS_LOG_TYPE_ERROR, "%s Executing intent failed with error %@", (uint8_t *)&v6, 0x16u);
  }

  -[WFIntentExecutor finishWithInteraction:error:](self, "finishWithInteraction:error:", 0, v4);
}

- (void)finish
{
  void *v3;

  -[WFIntentExecutor connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reset");

  -[WFIntentExecutor autoreleaseSelf](self, "autoreleaseSelf");
}

- (BOOL)continueInApp
{
  void *v3;
  char v4;
  void *v5;

  -[WFIntentExecutor delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[WFIntentExecutor delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "intentExecutorRequestsContinueInApp:", self);

  }
  return v4 & 1;
}

- (void)showConfirmationForInteraction:(id)a3 confirmationRequired:(BOOL)a4 authenticationRequired:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  void *v11;
  char v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;

  v7 = a5;
  v8 = a4;
  v16 = a3;
  v10 = a6;
  -[WFIntentExecutor delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[WFIntentExecutor delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "intentExecutor:showConfirmationForInteraction:confirmationRequired:authenticationRequired:completionHandler:", self, v16, v8, v7, v10);

  }
  else
  {
    if (v8 || v7)
    {
      v14 = v10;
      v15 = 0;
    }
    else
    {
      v14 = v10;
      v15 = 1;
    }
    (*((void (**)(id, uint64_t, _QWORD))v10 + 2))(v14, v15, 0);
  }

}

- (void)retainSelf
{
  objc_storeStrong((id *)&self->_strongSelf, self);
}

- (void)autoreleaseSelf
{
  WFIntentExecutor **p_strongSelf;
  WFIntentExecutor *v3;

  p_strongSelf = &self->_strongSelf;
  objc_storeStrong((id *)&self->_strongSelf, objc_retainAutorelease(self->_strongSelf));
  v3 = *p_strongSelf;
  *p_strongSelf = 0;

}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 24, 1);
}

- (INCExtensionConnection)connection
{
  return self->_connection;
}

- (WFIntentExecutorDelegate)delegate
{
  return (WFIntentExecutorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (INCExtensionProxy)getRideStatusUpdatingExtensionProxy
{
  return self->_getRideStatusUpdatingExtensionProxy;
}

- (void)setGetRideStatusUpdatingExtensionProxy:(id)a3
{
  objc_storeStrong((id *)&self->_getRideStatusUpdatingExtensionProxy, a3);
}

- (BOOL)forceExecutionOnPhone
{
  return self->_forceExecutionOnPhone;
}

- (void)setForceExecutionOnPhone:(BOOL)a3
{
  self->_forceExecutionOnPhone = a3;
}

- (BOOL)skipResolveAndConfirm
{
  return self->_skipResolveAndConfirm;
}

- (void)setSkipResolveAndConfirm:(BOOL)a3
{
  self->_skipResolveAndConfirm = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_getRideStatusUpdatingExtensionProxy, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_strongSelf, 0);
}

void __51__WFIntentExecutor_startReceivingRideStatusUpdates__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  _QWORD v13[5];
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "setGetRideStatusUpdatingExtensionProxy:", v5);
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v8, "intent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __51__WFIntentExecutor_startReceivingRideStatusUpdates__block_invoke_2;
    v13[3] = &unk_1E7AF18A0;
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = v5;
    objc_msgSend(v8, "handleIntent:withExtensionProxy:completionHandler:", v9, v14, v13);

  }
  else if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "intentExecutor:receivingRideStatusDidReceiveError:", *(_QWORD *)(a1 + 32), v7);

    }
  }

}

void __51__WFIntentExecutor_startReceivingRideStatusUpdates__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  if (v15)
  {
    objc_msgSend(v15, "intentResponse");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v11 = v7;

    objc_msgSend(*(id *)(a1 + 40), "startSendingUpdatesToObserver:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "intentExecutor:receivingRideStatusDidReceiveUpdate:", *(_QWORD *)(a1 + 32), v11);

    }
  }
  else
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "intentExecutor:receivingRideStatusDidReceiveError:", *(_QWORD *)(a1 + 32), v5);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "setGetRideStatusUpdatingExtensionProxy:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "finish");
  }

}

void __70__WFIntentExecutor_handleIntent_withExtensionProxy_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v18 = a2;
  v5 = a3;
  if (!v18)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v5, "underlyingError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorFromExtensionError:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "failWithError:", v9);
LABEL_18:

    goto LABEL_19;
  }
  v6 = objc_msgSend(v18, "_intentResponseCode");
  if (v6 != 7)
  {
    if (v6 == 4)
    {
      if (!objc_msgSend(*(id *)(a1 + 40), "_shouldForwardToAppOnSucccess"))
      {
LABEL_9:
        v10 = *(void **)(a1 + 32);
        objc_msgSend(v10, "connection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "intent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "errorFromHandleResponse:intent:", v18, v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          v9 = 0;
        }
        else
        {
          v13 = objc_alloc(MEMORY[0x1E0CBD9A8]);
          v14 = objc_opt_respondsToSelector();
          v15 = *(_QWORD *)(a1 + 40);
          if ((v14 & 1) != 0)
            v16 = objc_msgSend(v13, "_initWithIntent:response:", v15, v18);
          else
            v16 = objc_msgSend(v13, "initWithIntent:response:", v15, v18);
          v9 = (void *)v16;
        }
        v17 = *(_QWORD *)(a1 + 56);
        if (v17)
          (*(void (**)(uint64_t, void *, void *))(v17 + 16))(v17, v9, v8);
        objc_msgSend(*(id *)(a1 + 48), "finish");
        goto LABEL_18;
      }
    }
    else if (v6 != 2)
    {
      goto LABEL_9;
    }
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "continueInApp") & 1) == 0)
    goto LABEL_9;
LABEL_19:

}

uint64_t __52__WFIntentExecutor_handleIntent_withExtensionProxy___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a3)
    return objc_msgSend(v3, "failWithError:");
  else
    return objc_msgSend(v3, "finishWithInteraction:", a2);
}

void __53__WFIntentExecutor_confirmIntent_withExtensionProxy___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _BOOL4 v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  char v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  unsigned int v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  uint64_t v37;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5)
  {
    v12 = a1[4];
    objc_msgSend(v6, "underlyingError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorFromExtensionError:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "failWithError:", v13);

LABEL_21:
    goto LABEL_22;
  }
  if (objc_msgSend(v5, "_intentResponseCode") != 2 || (objc_msgSend(a1[4], "continueInApp") & 1) == 0)
  {
    v8 = a1[4];
    objc_msgSend(v8, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "intent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorFromConfirmResponse:intent:", v5, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(a1[4], "failWithError:", v11);
    }
    else
    {
      v14 = (objc_msgSend(a1[5], "_isUserConfirmationRequired") & 1) != 0
         || (objc_msgSend(v5, "_userConfirmationRequired") & 1) != 0
         || objc_msgSend(v5, "_intentResponseCode") == 8;
      v15 = objc_msgSend(v5, "_requiresAuthentication");
      v16 = objc_msgSend(a1[5], "_intentCategory");
      v17 = 1;
      v18 = v16 == 4 || v14;
      if (v16 != 4 && (v15 & 1) == 0)
      {
        objc_msgSend(a1[5], "launchId");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 0;
        INExtractAppInfoFromSiriLaunchId();
        v20 = 0;

        +[ICAppRegistry sharedRegistry](ICAppRegistry, "sharedRegistry");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "appWithBundleIdentifier:", v20);
        v32 = v18;
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "appInfo");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "actionsRestrictedWhileLocked");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "_className");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = objc_msgSend(v24, "containsObject:", v25);
        v18 = v32;
      }
      objc_msgSend(a1[6], "finish");
      v26 = objc_alloc(MEMORY[0x1E0CBD9A8]);
      v27 = objc_opt_respondsToSelector();
      v28 = a1[5];
      if ((v27 & 1) != 0)
        v29 = objc_msgSend(v26, "_initWithIntent:response:", v28, v5);
      else
        v29 = objc_msgSend(v26, "initWithIntent:response:", v28, v5);
      v30 = (void *)v29;
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __53__WFIntentExecutor_confirmIntent_withExtensionProxy___block_invoke_2;
      v33[3] = &unk_1E7AF1800;
      v31 = a1[5];
      v34 = a1[4];
      v35 = v31;
      v36 = a1[7];
      objc_msgSend(v34, "showConfirmationForInteraction:confirmationRequired:authenticationRequired:completionHandler:", v30, v18, v17, v33);

    }
    goto LABEL_21;
  }
LABEL_22:

}

void __53__WFIntentExecutor_confirmIntent_withExtensionProxy___block_invoke_2(_QWORD *a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = (void *)a1[4];
  v8 = v5;
  if (a2)
  {
    objc_msgSend(v6, "handleIntent:withExtensionProxy:", a1[5], a1[6]);
  }
  else if (v5)
  {
    objc_msgSend(v6, "failWithError:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "userCancelledError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "failWithError:", v7);

  }
}

void __85__WFIntentExecutor_resolveIntentResolutionResults_slotDescription_intent_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, _BYTE *a5)
{
  id v9;
  void (**v10)(id, _QWORD);
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  _QWORD v23[5];
  id v24;
  void (**v25)(id, _QWORD);
  uint64_t v26;
  uint64_t v27;

  v9 = a2;
  v10 = a4;
  v11 = objc_msgSend(v9, "resolutionResultCode");
  if (v11 == 5)
    goto LABEL_8;
  if (v11 != 3)
  {
    if (!v11)
      goto LABEL_8;
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) == 0)
  {
LABEL_7:
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a2);
    *a5 = 1;
LABEL_8:
    v10[2](v10, 0);
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v9, "itemToConfirm");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[2] = __85__WFIntentExecutor_resolveIntentResolutionResults_slotDescription_intent_completion___block_invoke_2;
  v23[3] = &unk_1E7AF1788;
  v18 = *(_QWORD *)(a1 + 48);
  v19 = *(_QWORD *)(a1 + 32);
  v20 = *(void **)(a1 + 40);
  v26 = *(_QWORD *)(a1 + 56);
  v23[4] = v19;
  v23[1] = 3221225472;
  v21 = v20;
  v22 = *(_QWORD *)(a1 + 64);
  v24 = v21;
  v27 = v22;
  v25 = v10;
  objc_msgSend(v14, "intentExecutor:showConfirmationForSlot:item:intent:completion:", v15, v16, v17, v18, v23);

LABEL_9:
}

uint64_t __85__WFIntentExecutor_resolveIntentResolutionResults_slotDescription_intent_completion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
}

void __85__WFIntentExecutor_resolveIntentResolutionResults_slotDescription_intent_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  objc_msgSend(*(id *)(a1 + 32), "updateIntentWithItemToConfirm:forSlot:onIntent:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (!a2)
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v8 = CFSTR("WFIntentExecutorIntentErrorKey");
    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("WFIntentExecutorErrorDomain"), 104, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "failWithError:", v7);
  }
}

void __53__WFIntentExecutor_resolveIntent_withExtensionProxy___block_invoke_2(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t *v30;
  _QWORD aBlock[6];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  v7 = a3;
  v8 = a4;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__33076;
  v48 = __Block_byref_object_dispose__33077;
  v9 = v7;
  v49 = v9;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__33076;
  v42 = __Block_byref_object_dispose__33077;
  v43 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__33076;
  v36 = __Block_byref_object_dispose__33077;
  v37 = 0;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__WFIntentExecutor_resolveIntent_withExtensionProxy___block_invoke_132;
  aBlock[3] = &unk_1E7AF16C0;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  aBlock[5] = &v44;
  v11 = _Block_copy(aBlock);
  v12 = v11;
  if ((a2 & 1) != 0)
  {
    (*((void (**)(void *, uint64_t, _QWORD, uint64_t, uint64_t, _QWORD))v11 + 2))(v11, v45[5], *(_QWORD *)(a1 + 48), v39[5], v33[5], *(_QWORD *)(a1 + 56));
  }
  else
  {
    objc_msgSend(v8, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v10;
    v23[1] = 3221225472;
    v23[2] = __53__WFIntentExecutor_resolveIntent_withExtensionProxy___block_invoke_2_134;
    v23[3] = &unk_1E7AF1710;
    v24 = v8;
    v28 = &v38;
    v14 = *(id *)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 32);
    v25 = v14;
    v26 = v15;
    v29 = &v44;
    v27 = *(id *)(a1 + 48);
    v30 = &v32;
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __53__WFIntentExecutor_resolveIntent_withExtensionProxy___block_invoke_4;
    v16[3] = &unk_1E7AF1738;
    v19 = v12;
    v20 = &v44;
    v17 = *(id *)(a1 + 48);
    v21 = &v38;
    v22 = &v32;
    v18 = *(id *)(a1 + 56);
    objc_msgSend(v13, "if_enumerateAsynchronouslyInSequence:completionHandler:", v23, v16);

  }
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

}

void __53__WFIntentExecutor_resolveIntent_withExtensionProxy___block_invoke_132(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(a6, "finish");
  v12 = *(void **)(a1 + 32);
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "errorFromResolutionResult:forSlot:onIntent:", v11, v10, *(_QWORD *)(v13 + 40));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "failWithError:", v14);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "confirmIntent:withExtensionProxy:", *(_QWORD *)(v13 + 40), v15);
  }

}

void __53__WFIntentExecutor_resolveIntent_withExtensionProxy___block_invoke_2_134(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  int8x16_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "result") == 1)
  {
    objc_msgSend(*(id *)(a1 + 40), "_intentInstanceDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "slotByName:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    v13 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "resolutionResultClass");
    objc_msgSend(v8, "data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_resolutionResultWithData:slotDescription:", v14, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v17 = 0;
        goto LABEL_9;
      }
      v16 = v15;
    }
    v17 = v16;
LABEL_9:
    v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __53__WFIntentExecutor_resolveIntent_withExtensionProxy___block_invoke_3;
    v21[3] = &unk_1E7AF16E8;
    v20 = *(void **)(a1 + 48);
    v22 = *(id *)(a1 + 56);
    v24 = vextq_s8(*(int8x16_t *)(a1 + 72), *(int8x16_t *)(a1 + 72), 8uLL);
    v23 = v7;
    objc_msgSend(v20, "resolveIntentResolutionResults:slotDescription:intent:completion:", v17, v18, v19, v21);

    goto LABEL_10;
  }
  (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
LABEL_10:

}

uint64_t __53__WFIntentExecutor_resolveIntent_withExtensionProxy___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), a1[4], *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 40), a1[5]);
}

void __53__WFIntentExecutor_resolveIntent_withExtensionProxy___block_invoke_3(uint64_t a1, int a2, void *a3, void *a4)
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  if (v13 && a2)
  {
    v9 = *(id *)(a1 + 32);
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v11 = v10;

    objc_msgSend(v11, "_connection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setIntent:", v13);

  }
  if (v8)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a4);
  if (v13)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

id __53__WFIntentExecutor_resolveIntent_withExtensionProxy___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "resolveSelector"))
  {
    objc_msgSend(v2, "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __58__WFIntentExecutor_resumeConnectionWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  uint64_t v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5
    && objc_msgSend(v6, "code") == 1320
    && (objc_msgSend(*(id *)(a1 + 32), "delegate"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_opt_respondsToSelector(),
        v8,
        (v9 & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __58__WFIntentExecutor_resumeConnectionWithCompletionHandler___block_invoke_2;
    v12[3] = &unk_1E7AF1630;
    v11 = *(void **)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 32);
    v16 = v11;
    v14 = 0;
    v15 = v7;
    objc_msgSend(v10, "intentExecutor:needsAppProtectionUnlockWithCompletionHandler:", v13, v12);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __58__WFIntentExecutor_resumeConnectionWithCompletionHandler___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  id v4;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "connection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAppProtectionPolicy:", 1);

    objc_msgSend(*(id *)(a1 + 32), "connection");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resumeWithCompletionHandler:", *(_QWORD *)(a1 + 56));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void __57__WFIntentExecutor_startConnectionWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "errorFromExtensionError:", a3);
    a3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "finish");

}

void __39__WFIntentExecutor_configureConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v3)
  {
    v8 = *MEMORY[0x1E0CB3388];
    v9[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D3E518], 1307, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "errorFromExtensionError:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "failWithError:", v7);

}

void __39__WFIntentExecutor_configureConnection__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v3)
  {
    v8 = *MEMORY[0x1E0CB3388];
    v9[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D3E518], 1301, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "errorFromExtensionError:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "failWithError:", v7);

}

void __81__WFIntentExecutor_startConnectionForParameterName_searchTerm_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;

  if (a2)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __81__WFIntentExecutor_startConnectionForParameterName_searchTerm_completionHandler___block_invoke_2;
    v8[3] = &unk_1E7AF1590;
    v6 = *(id *)(a1 + 56);
    v7 = *(_QWORD *)(a1 + 48);
    v10 = v6;
    v8[4] = v7;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(a2, "getOptionsForParameterNamed:searchTerm:completionHandler:", v4, v5, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void __81__WFIntentExecutor_startConnectionForParameterName_searchTerm_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "intent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_codableDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attributeByName:", *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __81__WFIntentExecutor_startConnectionForParameterName_searchTerm_completionHandler___block_invoke_3;
    v12[3] = &unk_1E7AF1568;
    v15 = *(id *)(a1 + 48);
    v10 = v6;
    v11 = *(_QWORD *)(a1 + 32);
    v13 = v10;
    v14 = v11;
    objc_msgSend(v5, "wf_transformValueForCodableAttribute:completionHandler:", v9, v12);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "finish");
  }

}

uint64_t __81__WFIntentExecutor_startConnectionForParameterName_searchTerm_completionHandler___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "finish");
}

void __70__WFIntentExecutor_startConnectionForParameterName_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  int8x16_t v6;
  _QWORD v7[4];
  int8x16_t v8;
  id v9;

  if (a2)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __70__WFIntentExecutor_startConnectionForParameterName_completionHandler___block_invoke_2;
    v7[3] = &unk_1E7AF5D38;
    v9 = *(id *)(a1 + 48);
    v6 = *(int8x16_t *)(a1 + 32);
    v5 = (id)v6.i64[0];
    v8 = vextq_s8(v6, v6, 8uLL);
    objc_msgSend(a2, "getDefaultValueForParameterNamed:completionHandler:", v4, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __70__WFIntentExecutor_startConnectionForParameterName_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "intent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_codableDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attributeByName:", *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __70__WFIntentExecutor_startConnectionForParameterName_completionHandler___block_invoke_3;
    v12[3] = &unk_1E7AF1568;
    v15 = *(id *)(a1 + 48);
    v10 = v6;
    v11 = *(_QWORD *)(a1 + 32);
    v13 = v10;
    v14 = v11;
    objc_msgSend(v5, "wf_transformValueForCodableAttribute:completionHandler:", v9, v12);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "finish");
  }

}

uint64_t __70__WFIntentExecutor_startConnectionForParameterName_completionHandler___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 40), "finish");
}

void __47__WFIntentExecutor_startWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (v10)
  {
    v7 = objc_msgSend(v6, "skipResolveAndConfirm");
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v8, "intent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v8, "handleIntent:withExtensionProxy:", v9, v10);
    else
      objc_msgSend(v8, "resolveIntent:withExtensionProxy:", v9, v10);

  }
  else
  {
    objc_msgSend(v6, "failWithError:", v5);
  }

}

@end
