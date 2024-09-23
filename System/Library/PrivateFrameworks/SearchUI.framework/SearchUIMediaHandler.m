@implementation SearchUIMediaHandler

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  SearchUIMediaHandler *v12;

  -[SearchUIMediaHandler clientSelectedBundleIdentifier](self, "clientSelectedBundleIdentifier", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    -[SearchUIMediaHandler intent](self, "intent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIMediaHandler performIntent:withBundleIdentifier:](self, "performIntent:withBundleIdentifier:", v7, v6);

  }
  else
  {
    -[SearchUIMediaHandler mediaMetadata](self, "mediaMetadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __64__SearchUIMediaHandler_performCommand_triggerEvent_environment___block_invoke;
    v10[3] = &unk_1EA1F8008;
    v11 = v8;
    v12 = self;
    v9 = v8;
    +[SearchUIMediaUtilities predictionForMediaMetadata:completion:](SearchUIMediaUtilities, "predictionForMediaMetadata:completion:", v9, v10);

  }
}

void __64__SearchUIMediaHandler_performCommand_triggerEvent_environment___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__SearchUIMediaHandler_performCommand_triggerEvent_environment___block_invoke_2;
  v7[3] = &unk_1EA1F6518;
  v8 = v3;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9 = v4;
  v10 = v5;
  v6 = v3;
  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v7);

}

void __64__SearchUIMediaHandler_performCommand_triggerEvent_environment___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[6];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint8_t v56[128];
  uint8_t buf[4];
  uint64_t v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "selectedBundleIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_3;
  v3 = (void *)v2;
  objc_msgSend(*(id *)(a1 + 40), "bundleIdentifiersToExclude");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "selectedBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  if ((v6 & 1) == 0)
  {
    SearchUITapLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "selectedBundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v58 = v9;
      v59 = 2112;
      v60 = v10;
      _os_log_impl(&dword_1DAD39000, v8, OS_LOG_TYPE_DEFAULT, "%@: performing intent with selectedBundleIdentifier: %@", buf, 0x16u);

    }
    v11 = *(void **)(a1 + 48);
    objc_msgSend(v11, "intent");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "selectedBundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "performIntent:withBundleIdentifier:", v12, v13);

  }
  else
  {
LABEL_3:
    +[SearchUIMediaUtilities mediaDestinationsForMediaMetadata:](SearchUIMediaUtilities, "mediaDestinationsForMediaMetadata:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {

LABEL_9:
      v16 = (void *)objc_opt_new();
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      objc_msgSend(*(id *)(a1 + 32), "disambiguateBundleIdentifiers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v52;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v52 != v20)
              objc_enumerationMutation(v17);
            v22 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
            objc_msgSend(*(id *)(a1 + 40), "bundleIdentifiersToExclude");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "containsObject:", v22);

            if ((v24 & 1) == 0)
            {
              v25 = (void *)objc_opt_new();
              objc_msgSend(v25, "setAppBundleIdentifier:", v22);
              objc_msgSend(v25, "setMediaMetadata:", *(_QWORD *)(a1 + 40));
              objc_msgSend(v16, "addObject:", v25);

            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
        }
        while (v19);
      }

      +[SearchUIMediaUtilities mediaDestinationsForMediaMetadata:](SearchUIMediaUtilities, "mediaDestinationsForMediaMetadata:", *(_QWORD *)(a1 + 40));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObjectsFromArray:", v26);

      SearchUITapLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = objc_opt_class();
        v29 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        v58 = v28;
        v59 = 2112;
        v60 = v29;
        _os_log_impl(&dword_1DAD39000, v27, OS_LOG_TYPE_DEFAULT, "%@: adding disambiguationUI for bundleIdentifiers: %@", buf, 0x16u);
      }

      v30 = (void *)MEMORY[0x1E0DC3450];
      v31 = a1;
      objc_msgSend(*(id *)(a1 + 40), "disambiguationTitle");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "alertControllerWithTitle:message:preferredStyle:", v32, 0, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v12 = v16;
      v34 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v48;
        do
        {
          for (j = 0; j != v35; ++j)
          {
            if (*(_QWORD *)v48 != v36)
              objc_enumerationMutation(v12);
            v38 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
            v39 = (void *)MEMORY[0x1E0DC3448];
            objc_msgSend(v38, "title");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v46[0] = MEMORY[0x1E0C809B0];
            v46[1] = 3221225472;
            v46[2] = __64__SearchUIMediaHandler_performCommand_triggerEvent_environment___block_invoke_42;
            v46[3] = &unk_1EA1F7FE0;
            v41 = *(_QWORD *)(v31 + 48);
            v46[4] = v38;
            v46[5] = v41;
            objc_msgSend(v39, "actionWithTitle:style:handler:", v40, 0, v46);
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v33, "addAction:", v42);
          }
          v35 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
        }
        while (v35);
      }

      v43 = (void *)MEMORY[0x1E0DC3448];
      +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", CFSTR("CANCEL"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "actionWithTitle:style:handler:", v44, 1, 0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addAction:", v45);

      objc_msgSend(*(id *)(v31 + 48), "requestAuthIfNecessaryAndPresentViewController:animated:", v33, 1);
      goto LABEL_28;
    }
    objc_msgSend(*(id *)(a1 + 32), "disambiguateBundleIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15)
      goto LABEL_9;
    SearchUITapLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __64__SearchUIMediaHandler_performCommand_triggerEvent_environment___block_invoke_2_cold_1(v12);
  }
LABEL_28:

}

void __64__SearchUIMediaHandler_performCommand_triggerEvent_environment___block_invoke_42(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "command");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUICommandHandler handlerForCommand:environment:](SearchUICommandHandler, "handlerForCommand:environment:", v2, v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "executeWithTriggerEvent:", 2);
}

- (BOOL)prefersModalPresentation
{
  return 1;
}

- (void)performIntent:(id)a3 withBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_storeStrong((id *)&self->_clientSelectedBundleIdentifier, a4);
  SearchUITapLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v7;
    _os_log_impl(&dword_1DAD39000, v8, OS_LOG_TYPE_DEFAULT, "media bundle identifier selected %@", (uint8_t *)&v10, 0xCu);
  }

  if (-[SearchUIMediaHandler supportsIntentPath](self, "supportsIntentPath"))
  {
    objc_msgSend(v6, "_setLaunchId:", v7);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC7D68]), "initWithIntent:", v6);
    -[NSObject setDelegate:](v9, "setDelegate:", self);
    -[NSObject start](v9, "start");
    -[SearchUIMediaHandler setWorkflowClient:](self, "setWorkflowClient:", v9);
    objc_storeStrong((id *)&s_activeHandler, self);
  }
  else
  {
    -[SearchUIMediaHandler executeFallbackPath](self, "executeFallbackPath");
    SearchUITapLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SearchUIMediaHandler performIntent:withBundleIdentifier:].cold.1();
  }

}

- (void)executeFallbackPath
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1DAD39000, v0, v1, "No punchouts for media app simply opening app %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint8_t v11[16];

  v7 = a5;
  SearchUITapLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SearchUIMediaHandler workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:].cold.1();

    -[SearchUIMediaHandler executeFallbackPath](self, "executeFallbackPath");
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1DAD39000, v9, OS_LOG_TYPE_DEFAULT, "Audio played successfully", v11, 2u);
    }

  }
  v10 = (void *)s_activeHandler;
  s_activeHandler = 0;

}

- (NSString)clientSelectedBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (INIntent)intent
{
  return (INIntent *)objc_getProperty(self, a2, 104, 1);
}

- (SFMediaMetadata)mediaMetadata
{
  return (SFMediaMetadata *)objc_getProperty(self, a2, 112, 1);
}

- (BOOL)supportsIntentPath
{
  return self->_supportsIntentPath;
}

- (WFSpotlightResultWorkflowRunnerClient)workflowClient
{
  return (WFSpotlightResultWorkflowRunnerClient *)objc_getProperty(self, a2, 120, 1);
}

- (void)setWorkflowClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workflowClient, 0);
  objc_storeStrong((id *)&self->_mediaMetadata, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_clientSelectedBundleIdentifier, 0);
}

void __64__SearchUIMediaHandler_performCommand_triggerEvent_environment___block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DAD39000, log, OS_LOG_TYPE_ERROR, "No apps available to play intent punchout to app store?", v1, 2u);
}

- (void)performIntent:withBundleIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1DAD39000, v0, v1, "Failed to get siri intent open capability for app %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1DAD39000, v0, v1, "Workflow finished with error: %@", v2);
  OUTLINED_FUNCTION_1();
}

@end
