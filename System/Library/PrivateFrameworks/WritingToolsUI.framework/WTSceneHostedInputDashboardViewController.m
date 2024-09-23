@implementation WTSceneHostedInputDashboardViewController

- (WTSceneHostedInputDashboardViewController)initWithWritingToolsDelegate:(id)a3 sessionUUID:(id)a4 requestedTool:(int64_t)a5 forAssistant:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  WTSceneHostedInputDashboardViewController *v12;
  WTSceneHostedInputDashboardViewController *v13;
  objc_super v15;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WTSceneHostedInputDashboardViewController;
  v12 = -[WTSceneHostedInputDashboardViewController init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_writingToolsDelegate, v10);
    objc_storeStrong((id *)&v13->_sessionUUID, a4);
    -[WTSceneHostedInputDashboardViewController _setupSceneHostingWithRequestedTool:sessionUUID:forAssistant:smartReplyConfiguration:](v13, "_setupSceneHostingWithRequestedTool:sessionUUID:forAssistant:smartReplyConfiguration:", a5, v11, v6, 0);
  }

  return v13;
}

- (WTSceneHostedInputDashboardViewController)initWithWritingToolsDelegate:(id)a3 sessionUUID:(id)a4 smartReplyConfiguration:(id)a5
{
  id v8;
  id v9;
  id v10;
  WTSceneHostedInputDashboardViewController *v11;
  WTSceneHostedInputDashboardViewController *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)WTSceneHostedInputDashboardViewController;
  v11 = -[WTSceneHostedInputDashboardViewController init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_writingToolsDelegate, v8);
    objc_storeStrong((id *)&v12->_sessionUUID, a4);
    -[WTSceneHostedInputDashboardViewController _setupSceneHostingWithRequestedTool:sessionUUID:forAssistant:smartReplyConfiguration:](v12, "_setupSceneHostingWithRequestedTool:sessionUUID:forAssistant:smartReplyConfiguration:", 101, v9, 0, v10);
  }

  return v12;
}

- (void)willBeginWritingToolsSession:(id)a3 requestContexts:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  WTSceneHostedInputDashboardViewController *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _WTVCLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315906;
    v14 = "-[WTSceneHostedInputDashboardViewController willBeginWritingToolsSession:requestContexts:]";
    v15 = 2112;
    v16 = self;
    v17 = 2112;
    v18 = v9;
    v19 = 2048;
    v20 = objc_msgSend(v6, "type");
    _os_log_impl(&dword_24A7CB000, v8, OS_LOG_TYPE_INFO, "%s (%@, sessUUIS: %@, sessType: %lu)", (uint8_t *)&v13, 0x2Au);

  }
  -[WTSceneHostedInputDashboardViewController sessionUUID](self, "sessionUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(v6, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WTSceneHostedInputDashboardViewController setSessionUUID:](self, "setSessionUUID:", v11);

  }
  -[WTSceneHostedInputDashboardViewController writingToolsDelegate](self, "writingToolsDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "willBeginWritingToolsSession:requestContexts:", v6, v7);

}

- (void)didBeginWritingToolsSession:(id)a3 contexts:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  WTSceneHostedInputDashboardViewController *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _WTVCLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136316162;
    v12 = "-[WTSceneHostedInputDashboardViewController didBeginWritingToolsSession:contexts:]";
    v13 = 2112;
    v14 = self;
    v15 = 2112;
    v16 = v9;
    v17 = 2048;
    v18 = objc_msgSend(v6, "type");
    v19 = 2048;
    v20 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_24A7CB000, v8, OS_LOG_TYPE_INFO, "%s (%@, sessUUID: %@, sessType: %lu, #contexts: %lu)", (uint8_t *)&v11, 0x34u);

  }
  -[WTSceneHostedInputDashboardViewController writingToolsDelegate](self, "writingToolsDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "didBeginWritingToolsSession:contexts:", v6, v7);

}

- (void)writingToolsSession:(id)a3 didReceiveAction:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  WTSceneHostedInputDashboardViewController *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  int64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  _WTVCLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136316162;
    v11 = "-[WTSceneHostedInputDashboardViewController writingToolsSession:didReceiveAction:]";
    v12 = 2112;
    v13 = self;
    v14 = 2112;
    v15 = v8;
    v16 = 2048;
    v17 = objc_msgSend(v6, "type");
    v18 = 2048;
    v19 = a4;
    _os_log_impl(&dword_24A7CB000, v7, OS_LOG_TYPE_INFO, "%s (%@, sessUUIS: %@, sessType: %lu, action: %lu)", (uint8_t *)&v10, 0x34u);

  }
  -[WTSceneHostedInputDashboardViewController writingToolsDelegate](self, "writingToolsDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "writingToolsSession:didReceiveAction:", v6, a4);

}

- (void)didEndWritingToolsSession:(id)a3 accepted:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  WTSceneHostedInputDashboardViewController *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  _WTVCLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "type");
    v13 = 136316162;
    v14 = "-[WTSceneHostedInputDashboardViewController didEndWritingToolsSession:accepted:]";
    v10 = "no";
    if (v4)
      v10 = "yes";
    v15 = 2112;
    v16 = self;
    v17 = 2112;
    v18 = v8;
    v19 = 2048;
    v20 = v9;
    v21 = 2080;
    v22 = v10;
    _os_log_impl(&dword_24A7CB000, v7, OS_LOG_TYPE_INFO, "%s (%@, sessUUIS: %@, sessType: %lu, accepted: %s)", (uint8_t *)&v13, 0x34u);

  }
  -[WTSceneHostedInputDashboardViewController writingToolsDelegate](self, "writingToolsDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "didEndWritingToolsSession:accepted:", v6, v4);

  -[WTSceneHostedInputDashboardViewController hostingController](self, "hostingController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "invalidate");

}

- (void)compositionSession:(id)a3 didReceiveText:(id)a4 replacementRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7
{
  _BOOL8 v7;
  NSUInteger length;
  NSUInteger location;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  int v22;
  const char *v23;
  __int16 v24;
  WTSceneHostedInputDashboardViewController *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  NSUInteger v33;
  __int16 v34;
  NSUInteger v35;
  __int16 v36;
  const char *v37;
  uint64_t v38;

  v7 = a7;
  length = a5.length;
  location = a5.location;
  v38 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a6;
  _WTVCLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v13, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v13, "type");
    v19 = objc_msgSend(v14, "length");
    v22 = 136316930;
    v23 = "-[WTSceneHostedInputDashboardViewController compositionSession:didReceiveText:replacementRange:inContext:finished:]";
    v20 = "no";
    if (v7)
      v20 = "yes";
    v24 = 2112;
    v25 = self;
    v26 = 2112;
    v27 = v17;
    v28 = 2048;
    v29 = v18;
    v30 = 2048;
    v31 = v19;
    v32 = 2048;
    v33 = location;
    v34 = 2048;
    v35 = length;
    v36 = 2080;
    v37 = v20;
    _os_log_impl(&dword_24A7CB000, v16, OS_LOG_TYPE_INFO, "%s (%@, sessUUIS: %@, sessType: %lu, textLen: %lu, replaceRange: {%lu,%lu}, finished: %s)", (uint8_t *)&v22, 0x52u);

  }
  -[WTSceneHostedInputDashboardViewController writingToolsDelegate](self, "writingToolsDelegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "compositionSession:didReceiveText:replacementRange:inContext:finished:", v13, v14, location, length, v15, v7);

}

- (void)proofreadingSession:(id)a3 didReceiveSuggestions:(id)a4 processedRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7
{
  _BOOL8 v7;
  NSUInteger length;
  NSUInteger location;
  id v13;
  id v14;
  id v15;
  id v16;

  v7 = a7;
  length = a5.length;
  location = a5.location;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  -[WTSceneHostedInputDashboardViewController writingToolsDelegate](self, "writingToolsDelegate");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "proofreadingSession:didReceiveSuggestions:processedRange:inContext:finished:", v15, v14, location, length, v13, v7);

}

- (void)proofreadingSession:(id)a3 didUpdateState:(int64_t)a4 forSuggestionWithUUID:(id)a5 inContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  -[WTSceneHostedInputDashboardViewController writingToolsDelegate](self, "writingToolsDelegate");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "proofreadingSession:didUpdateState:forSuggestionWithUUID:inContext:", v12, a4, v11, v10);

}

- (void)endWritingToolsWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  WTSceneHostedInputDashboardViewController *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _WTVCLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 136315650;
    v8 = "-[WTSceneHostedInputDashboardViewController endWritingToolsWithError:]";
    v9 = 2112;
    v10 = self;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_24A7CB000, v5, OS_LOG_TYPE_INFO, "%s (%@, error: %@)", (uint8_t *)&v7, 0x20u);
  }

  -[WTSceneHostedInputDashboardViewController writingToolsDelegate](self, "writingToolsDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endWritingToolsWithError:", v4);

}

- (void)showContentWarningWithTitle:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v9 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_251C07D50, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __81__WTSceneHostedInputDashboardViewController_showContentWarningWithTitle_message___block_invoke;
  v20 = &unk_251C06FE0;
  objc_copyWeak(&v21, &location);
  objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 0, &v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v12, v17, v18, v19, v20);

  v13 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Continue"), &stru_251C07D50, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 0, &__block_literal_global_0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v16);

  -[WTSceneHostedInputDashboardViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __81__WTSceneHostedInputDashboardViewController_showContentWarningWithTitle_message___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "writingToolsDelegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "endWritingTools");

}

- (void)endWritingTools
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  WTSceneHostedInputDashboardViewController *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _WTVCLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 136315394;
    v5 = "-[WTSceneHostedInputDashboardViewController endWritingTools]";
    v6 = 2112;
    v7 = self;
    _os_log_impl(&dword_24A7CB000, v3, OS_LOG_TYPE_INFO, "%s (%@)", (uint8_t *)&v4, 0x16u);
  }

  -[WTSceneHostedInputDashboardViewController endWritingToolsWithError:](self, "endWritingToolsWithError:", 0);
}

- (void)undo
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  WTSceneHostedInputDashboardViewController *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _WTVCLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "-[WTSceneHostedInputDashboardViewController undo]";
    v7 = 2112;
    v8 = self;
    _os_log_impl(&dword_24A7CB000, v3, OS_LOG_TYPE_INFO, "%s (%@)", (uint8_t *)&v5, 0x16u);
  }

  -[WTSceneHostedInputDashboardViewController writingToolsDelegate](self, "writingToolsDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "undo");

}

- (void)redo
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  WTSceneHostedInputDashboardViewController *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _WTVCLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "-[WTSceneHostedInputDashboardViewController redo]";
    v7 = 2112;
    v8 = self;
    _os_log_impl(&dword_24A7CB000, v3, OS_LOG_TYPE_INFO, "%s (%@)", (uint8_t *)&v5, 0x16u);
  }

  -[WTSceneHostedInputDashboardViewController writingToolsDelegate](self, "writingToolsDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "redo");

}

- (void)replaceSelectionWithText:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  WTSceneHostedInputDashboardViewController *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _WTVCLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 136315650;
    v8 = "-[WTSceneHostedInputDashboardViewController replaceSelectionWithText:]";
    v9 = 2112;
    v10 = self;
    v11 = 2048;
    v12 = objc_msgSend(v4, "length");
    _os_log_impl(&dword_24A7CB000, v5, OS_LOG_TYPE_INFO, "%s (%@, textLen=%lu)", (uint8_t *)&v7, 0x20u);
  }

  -[WTSceneHostedInputDashboardViewController writingToolsDelegate](self, "writingToolsDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "replaceSelectionWithText:", v4);

}

- (void)copyText:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  WTSceneHostedInputDashboardViewController *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _WTVCLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 136315650;
    v8 = "-[WTSceneHostedInputDashboardViewController copyText:]";
    v9 = 2112;
    v10 = self;
    v11 = 2048;
    v12 = objc_msgSend(v4, "length");
    _os_log_impl(&dword_24A7CB000, v5, OS_LOG_TYPE_INFO, "%s (%@, textLen: %lu)", (uint8_t *)&v7, 0x20u);
  }

  -[WTSceneHostedInputDashboardViewController writingToolsDelegate](self, "writingToolsDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "copyText:", v4);

}

- (void)beginTextPlaceholder
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  WTSceneHostedInputDashboardViewController *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _WTVCLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "-[WTSceneHostedInputDashboardViewController beginTextPlaceholder]";
    v7 = 2112;
    v8 = self;
    _os_log_impl(&dword_24A7CB000, v3, OS_LOG_TYPE_INFO, "%s (%@)", (uint8_t *)&v5, 0x16u);
  }

  -[WTSceneHostedInputDashboardViewController writingToolsDelegate](self, "writingToolsDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginTextPlaceholder");

}

- (void)endTextPlaceholderAndWillInsertText:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const char *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  WTSceneHostedInputDashboardViewController *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  _WTVCLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = "no";
    v9 = "-[WTSceneHostedInputDashboardViewController endTextPlaceholderAndWillInsertText:]";
    v8 = 136315650;
    if (v3)
      v6 = "yes";
    v10 = 2112;
    v11 = self;
    v12 = 2080;
    v13 = v6;
    _os_log_impl(&dword_24A7CB000, v5, OS_LOG_TYPE_INFO, "%s (%@, willInsertText: %s)", (uint8_t *)&v8, 0x20u);
  }

  -[WTSceneHostedInputDashboardViewController writingToolsDelegate](self, "writingToolsDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endTextPlaceholderAndWillInsertText:", v3);

}

- (void)showSmartReplyQuestionnaireWithRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NSObject *v8;
  WTSmartReplyQuestionnaireViewController *v9;
  void *v10;
  WTSmartReplyQuestionnaireViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  _WTVCLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[WTSceneHostedInputDashboardViewController showSmartReplyQuestionnaireWithRect:].cold.1(self, v8, x, y, width, height);

  v9 = [WTSmartReplyQuestionnaireViewController alloc];
  -[WTSceneHostedInputDashboardViewController sessionUUID](self, "sessionUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WTSmartReplyQuestionnaireViewController initWithSessionUUID:](v9, "initWithSessionUUID:", v10);

  -[WTSmartReplyQuestionnaireViewController setModalPresentationStyle:](v11, "setModalPresentationStyle:", 7);
  -[WTSceneHostedInputDashboardViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WTSmartReplyQuestionnaireViewController popoverPresentationController](v11, "popoverPresentationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSourceView:", v12);

  -[WTSmartReplyQuestionnaireViewController popoverPresentationController](v11, "popoverPresentationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSourceRect:", x, y, width, height);

  -[WTSmartReplyQuestionnaireViewController popoverPresentationController](v11, "popoverPresentationController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPermittedArrowDirections:", 2);

  -[WTSmartReplyQuestionnaireViewController popoverPresentationController](v11, "popoverPresentationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCanOverlapSourceViewRect:", 1);

  -[WTSceneHostedInputDashboardViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, &__block_literal_global_12);
}

- (BOOL)isVisibleForInputDelegate:(id)a3 inputViews:(id)a4
{
  return 1;
}

- (double)preferredHeightForTraitCollection:(id)a3
{
  return *MEMORY[0x24BEBE3B8];
}

- (double)preferredWidthForTraitCollection:(id)a3
{
  return 500.0;
}

- (BOOL)allowsCompactAssistantBar
{
  return 0;
}

- (void)_setupSceneHostingWithRequestedTool:(int64_t)a3 sessionUUID:(id)a4 forAssistant:(BOOL)a5 smartReplyConfiguration:(id)a6
{
  _BOOL8 v7;
  void *v10;
  _TtC14WritingToolsUI16WTStartupOptions *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  WTUISceneHostingActivationController *v17;
  WTUISceneHostingActivationController *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _TtC14WritingToolsUI16WTStartupOptions *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id location;
  _QWORD v47[6];

  v7 = a5;
  v47[4] = *MEMORY[0x24BDAC8D0];
  v42 = a4;
  v43 = a6;
  -[WTSceneHostedInputDashboardViewController hostingController](self, "hostingController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[WTSceneHostedInputDashboardViewController _beginDelayingPresentation:cancellationHandler:](self, "_beginDelayingPresentation:cancellationHandler:", &__block_literal_global_14, 3.0);
    objc_msgSend(MEMORY[0x24BE80C98], "identityForEmbeddedApplicationIdentifier:", CFSTR("com.apple.WritingToolsUIService"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(_TtC14WritingToolsUI16WTStartupOptions);
    -[WTStartupOptions setRequestedTool:](v11, "setRequestedTool:", a3);
    -[WTStartupOptions setEditable:](v11, "setEditable:", 1);
    -[WTStartupOptions setIsForInputDashboard:](v11, "setIsForInputDashboard:", 1);
    -[WTStartupOptions setSessionUUID:](v11, "setSessionUUID:", v42);
    -[WTStartupOptions setIsForAssistant:](v11, "setIsForAssistant:", v7);
    v39 = v11;
    -[WTStartupOptions setSmartReplyConfiguration:](v11, "setSmartReplyConfiguration:", v43);
    v12 = objc_alloc(MEMORY[0x24BEBDCF8]);
    v13 = objc_alloc_init(MEMORY[0x24BEBDD10]);
    v14 = (void *)objc_msgSend(v12, "initWithProcessIdentity:sceneSpecification:", v40, v13);
    -[WTSceneHostedInputDashboardViewController setHostingController:](self, "setHostingController:", v14);

    -[WTSceneHostedInputDashboardViewController hostingController](self, "hostingController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_eventDeferringComponent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setMaintainHostFirstResponderWhenClientWantsKeyboard:", 1);

    -[WTStartupOptions asBSActionAndReturnError:](v11, "asBSActionAndReturnError:", 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v17 = [WTUISceneHostingActivationController alloc];
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __130__WTSceneHostedInputDashboardViewController__setupSceneHostingWithRequestedTool_sessionUUID_forAssistant_smartReplyConfiguration___block_invoke_2;
    v44[3] = &unk_251C070A8;
    objc_copyWeak(&v45, &location);
    v18 = -[WTUISceneHostingActivationController initWithStartupAction:invalidationHandler:](v17, "initWithStartupAction:invalidationHandler:", v38, v44);
    -[WTSceneHostedInputDashboardViewController hostingController](self, "hostingController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setActivationController:", v18);

    -[WTSceneHostedInputDashboardViewController hostingController](self, "hostingController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDelegate:", self);

    -[WTSceneHostedInputDashboardViewController hostingController](self, "hostingController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sceneViewController");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    -[WTSceneHostedInputDashboardViewController addChildViewController:](self, "addChildViewController:", v41);
    objc_msgSend(v41, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WTSceneHostedInputDashboardViewController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v22);
    objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v31 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v22, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v36);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v35;
    objc_msgSend(v22, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v32;
    objc_msgSend(v22, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v47[2] = v26;
    objc_msgSend(v22, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v47[3] = v29;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 4);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "activateConstraints:", v30);

    objc_msgSend(v41, "didMoveToParentViewController:", self);
    objc_destroyWeak(&v45);
    objc_destroyWeak(&location);

  }
}

uint64_t __130__WTSceneHostedInputDashboardViewController__setupSceneHostingWithRequestedTool_sessionUUID_forAssistant_smartReplyConfiguration___block_invoke()
{
  return 0;
}

void __130__WTSceneHostedInputDashboardViewController__setupSceneHostingWithRequestedTool_sessionUUID_forAssistant_smartReplyConfiguration___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "writingToolsDelegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "endWritingToolsWithError:", 0);

}

- (_UISceneHostingController)hostingController
{
  return self->_hostingController;
}

- (void)setHostingController:(id)a3
{
  objc_storeStrong((id *)&self->_hostingController, a3);
}

- (WTWritingToolsDelegate_Internal)writingToolsDelegate
{
  return (WTWritingToolsDelegate_Internal *)objc_loadWeakRetained((id *)&self->_writingToolsDelegate);
}

- (void)setWritingToolsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_writingToolsDelegate, a3);
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_destroyWeak((id *)&self->_writingToolsDelegate);
  objc_storeStrong((id *)&self->_hostingController, 0);
}

- (void)showSmartReplyQuestionnaireWithRect:(CGFloat)a3 .cold.1(void *a1, NSObject *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;
  CGRect v23;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "sessionUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23.origin.x = a3;
  v23.origin.y = a4;
  v23.size.width = a5;
  v23.size.height = a6;
  NSStringFromCGRect(v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 136315906;
  v15 = "-[WTSceneHostedInputDashboardViewController showSmartReplyQuestionnaireWithRect:]";
  v16 = 2112;
  v17 = a1;
  v18 = 2112;
  v19 = v12;
  v20 = 2112;
  v21 = v13;
  _os_log_debug_impl(&dword_24A7CB000, a2, OS_LOG_TYPE_DEBUG, "%s (%@, sessionUUID: %@, rect: %@)", (uint8_t *)&v14, 0x2Au);

}

@end
