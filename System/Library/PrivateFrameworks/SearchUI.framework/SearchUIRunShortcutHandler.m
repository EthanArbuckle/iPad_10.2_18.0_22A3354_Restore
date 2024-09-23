@implementation SearchUIRunShortcutHandler

+ (id)fallbackCommandForRowModel:(id)a3 environment:(id)a4
{
  void *v4;
  _BOOL4 v5;
  void *v6;

  objc_msgSend(a3, "identifyingResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[SearchUIUtilities resultIsSiriAction:](SearchUIUtilities, "resultIsSiriAction:", v4);

  if (v5)
    v6 = (void *)objc_opt_new();
  else
    v6 = 0;
  return v6;
}

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  SearchUIRunShortcutHandler *v20;

  v6 = a3;
  -[SearchUICommandHandler rowModel](self, "rowModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifyingResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[SearchUIUtilities resultBlockedForScreenTime:](SearchUIUtilities, "resultBlockedForScreenTime:", v8))
  {
    goto LABEL_10;
  }
  objc_msgSend(v8, "identifier");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_9;
  v10 = (void *)v9;
  objc_msgSend(v8, "sectionBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqualToString:", v12) & 1) == 0)
  {

    goto LABEL_9;
  }
  v13 = objc_msgSend(MEMORY[0x1E0DBDA48], "isMacOS");

  if ((v13 & 1) != 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0DC7958], "standardClient");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "voiceShortcutIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __70__SearchUIRunShortcutHandler_performCommand_triggerEvent_environment___block_invoke;
    v18[3] = &unk_1EA1F8578;
    v19 = v6;
    v20 = self;
    objc_msgSend(v16, "getVoiceShortcutWithIdentifier:completion:", v17, v18);

    goto LABEL_10;
  }
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setSearchResult:", v8);
  objc_msgSend(v14, "setDelegate:", self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SearchUIRunShortcutHandler runViewSource](self, "runViewSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setRunViewSource:", v15);

  }
  objc_msgSend(v14, "executeShortcut");
  -[SearchUIRunShortcutHandler setAction:](self, "setAction:", v14);
  objc_storeStrong((id *)&s_activeHandler_0, self);

LABEL_10:
}

void __70__SearchUIRunShortcutHandler_performCommand_triggerEvent_environment___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  objc_msgSend(a2, "shortcut");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    SearchUIGeneralLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __70__SearchUIRunShortcutHandler_performCommand_triggerEvent_environment___block_invoke_cold_1(a1, v4);

  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7DA8]), "initWithINShortcut:executionContext:", v3, 5);
  objc_msgSend(v5, "setDelegate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "setWorkFlowRunnerClient:", v5);
  objc_msgSend(*(id *)(a1 + 40), "workFlowRunnerClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "workFlowRunnerClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "runViewSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRunViewSource:", v9);

  }
  objc_storeStrong((id *)&s_activeHandler_0, *(id *)(a1 + 40));
  objc_msgSend(v5, "start");

}

- (unint64_t)destination
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  -[SearchUICommandHandler rowModel](self, "rowModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "punchouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isRunnableInBackground"))
    v5 = 3;
  else
    v5 = 2;

  return v5;
}

- (void)actionSearchResultExecution:(id)a3 didDismissRemoteAlertWithReason:(int64_t)a4 actionCompleted:(BOOL)a5 withResult:(int64_t)a6 shouldClearAction:(BOOL)a7
{
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  int64_t v17;
  int64_t v18;
  BOOL v19;

  v11 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "runViewSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:", CFSTR("SearchUICommandHandlerShortcutDidEndNotification"), v13);

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __135__SearchUIRunShortcutHandler_actionSearchResultExecution_didDismissRemoteAlertWithReason_actionCompleted_withResult_shouldClearAction___block_invoke;
  v15[3] = &unk_1EA1F85A0;
  v19 = a7;
  v15[4] = self;
  v16 = v11;
  v17 = a6;
  v18 = a4;
  v14 = v11;
  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v15);

}

void __135__SearchUIRunShortcutHandler_actionSearchResultExecution_didDismissRemoteAlertWithReason_actionCompleted_withResult_shouldClearAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  if (*(_BYTE *)(a1 + 64))
    objc_msgSend(*(id *)(a1 + 32), "removeRowModel");
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "feedbackDelegate");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (*(_QWORD *)(a1 + 48) == 4)
    {
      objc_msgSend(*(id *)(a1 + 40), "searchResult");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "punchout");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v4)
        v6 = v4;
      else
        v6 = (id)objc_opt_new();
      v7 = v6;

    }
    else
    {
      v7 = 0;
    }
    v8 = objc_alloc(MEMORY[0x1E0D8C220]);
    objc_msgSend(*(id *)(a1 + 32), "rowModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cardSection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithCardSection:destination:triggerEvent:actionCardType:", v10, v7, 2, 0);

    objc_msgSend(*(id *)(a1 + 40), "searchResult");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setQueryId:", objc_msgSend(v12, "queryId"));

    objc_msgSend(v17, "didEngageCardSection:", v11);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13 = *(_QWORD *)(a1 + 56) - 1;
    if (v13 > 2)
      v14 = 0;
    else
      v14 = qword_1DAE1D918[v13];
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C238]), "initWithEvent:", v14);
    objc_msgSend(v17, "cardViewDidDisappear:", v15);

  }
  v16 = (void *)s_activeHandler_0;
  s_activeHandler_0 = 0;

}

- (id)actionProvider
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];

  -[SearchUICommandHandler environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICommandHandler rowModel](self, "rowModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CF95F8];
  objc_msgSend(v4, "identifyingResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __44__SearchUIRunShortcutHandler_actionProvider__block_invoke;
  v14[3] = &unk_1EA1F62F0;
  v14[4] = self;
  objc_msgSend(v5, "actionProviderForSearchResult:dismissSearchResultHandler:", v6, v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __44__SearchUIRunShortcutHandler_actionProvider__block_invoke_2;
  v12[3] = &unk_1EA1F85C8;
  v13 = v8;
  v9 = v8;
  v10 = _Block_copy(v12);

  return v10;
}

uint64_t __44__SearchUIRunShortcutHandler_actionProvider__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeRowModel");
}

uint64_t __44__SearchUIRunShortcutHandler_actionProvider__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    SearchUITapLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SearchUIRunShortcutHandler workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:].cold.1((uint64_t)v10, v11, v12);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "runViewSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:", CFSTR("SearchUICommandHandlerShortcutDidEndNotification"), v14);

  }
}

- (BOOL)shouldDeselectAfterExecution
{
  return 1;
}

- (void)removeRowModel
{
  void *v3;
  void *v4;
  dispatch_time_t v5;
  _QWORD v6[4];
  id v7;
  SearchUIRunShortcutHandler *v8;

  -[SearchUICommandHandler environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "feedbackDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = dispatch_time(0, 400000000);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __44__SearchUIRunShortcutHandler_removeRowModel__block_invoke;
    v6[3] = &unk_1EA1F6210;
    v7 = v4;
    v8 = self;
    dispatch_after(v5, MEMORY[0x1E0C80D38], v6);

  }
}

void __44__SearchUIRunShortcutHandler_removeRowModel__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "rowModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeRowModel:completion:", v2, 0);

}

- (WFWorkflowRunViewSource)runViewSource
{
  return self->_runViewSource;
}

- (void)setRunViewSource:(id)a3
{
  objc_storeStrong((id *)&self->_runViewSource, a3);
}

- (ATXActionSearchResultExecution)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (WFWorkflowRunnerClient)workFlowRunnerClient
{
  return self->_workFlowRunnerClient;
}

- (void)setWorkFlowRunnerClient:(id)a3
{
  objc_storeStrong((id *)&self->_workFlowRunnerClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workFlowRunnerClient, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_runViewSource, 0);
}

void __70__SearchUIRunShortcutHandler_performCommand_triggerEvent_environment___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "voiceShortcutIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_4(&dword_1DAD39000, a2, v4, "SearchUIRunShortcutHandler: No INShortcut for identifier: %@", (uint8_t *)&v5);

}

- (void)workflowRunnerClient:(uint64_t)a3 didFinishRunningWorkflowWithOutput:error:cancelled:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_4(&dword_1DAD39000, a2, a3, "SearchUIRunShortcutHandler workflowRunnerClient didFinishRunningWorkflowWith error: %@", (uint8_t *)&v3);
}

@end
