@implementation SWScriptsManager

- (SWScriptsManager)initWithWebView:(id)a3 documentStateProvider:(id)a4 logger:(id)a5
{
  id v9;
  id v10;
  id v11;
  SWScriptsManager *v12;
  SWScriptsManager *v13;
  uint64_t v14;
  NSMutableArray *queuedExecutableScripts;
  NSMutableDictionary *v16;
  NSMutableDictionary *scripts;
  uint64_t v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id location;
  objc_super v27;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)SWScriptsManager;
  v12 = -[SWScriptsManager init](&v27, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_webView, a3);
    objc_storeStrong((id *)&v13->_logger, a5);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = objc_claimAutoreleasedReturnValue();
    queuedExecutableScripts = v13->_queuedExecutableScripts;
    v13->_queuedExecutableScripts = (NSMutableArray *)v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    scripts = v13->_scripts;
    v13->_scripts = v16;

    objc_initWeak(&location, v13);
    v18 = MEMORY[0x24BDAC760];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __65__SWScriptsManager_initWithWebView_documentStateProvider_logger___block_invoke;
    v24[3] = &unk_24DA0B7C0;
    objc_copyWeak(&v25, &location);
    objc_msgSend(v10, "onUnload:", v24);
    v22[0] = v18;
    v22[1] = 3221225472;
    v22[2] = __65__SWScriptsManager_initWithWebView_documentStateProvider_logger___block_invoke_2;
    v22[3] = &unk_24DA0B7C0;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v10, "onLoad:", v22);
    v20[0] = v18;
    v20[1] = 3221225472;
    v20[2] = __65__SWScriptsManager_initWithWebView_documentStateProvider_logger___block_invoke_3;
    v20[3] = &unk_24DA0B7C0;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v10, "onReady:", v20);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __65__SWScriptsManager_initWithWebView_documentStateProvider_logger___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_pauseScriptExecution");

}

void __65__SWScriptsManager_initWithWebView_documentStateProvider_logger___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_pauseScriptExecution");

}

void __65__SWScriptsManager_initWithWebView_documentStateProvider_logger___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resumeScriptExecution");

}

- (void)addScript:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "userScript");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SWScriptsManager scripts](self, "scripts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v11, v6);

    -[SWScriptsManager webView](self, "webView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userContentController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "userScript");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addUserScript:", v10);

  }
}

- (void)removeAllScripts
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SWScriptsManager scripts](self, "scripts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[SWScriptsManager webView](self, "webView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userContentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllUserScripts");

}

- (void)removeScript:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "userScript");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SWScriptsManager scripts](self, "scripts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v6);

    -[SWScriptsManager webView](self, "webView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userContentController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "userScript");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_removeUserScript:", v10);

  }
}

- (void)removeScriptByIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SWScriptsManager scripts](self, "scripts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v7)
  {
    -[SWScriptsManager removeScript:](self, "removeScript:", v7);
    v6 = v7;
  }

}

- (void)_pauseScriptExecution
{
  -[SWScriptsManager setReadyToExecuteScripts:](self, "setReadyToExecuteScripts:", 0);
}

- (void)_resumeScriptExecution
{
  -[SWScriptsManager setReadyToExecuteScripts:](self, "setReadyToExecuteScripts:", 1);
  -[SWScriptsManager executeQueuedScripts](self, "executeQueuedScripts");
}

- (void)executeScript:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "executableScript");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = -[SWScriptsManager readyToExecuteScripts](self, "readyToExecuteScripts");
    -[SWScriptsManager logger](self, "logger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "identifier");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v9)
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("Script: Executing script with identifier: %@; script: %@"),
        v13,
        v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "log:", v16);

      -[SWScriptsManager webView](self, "webView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __45__SWScriptsManager_executeScript_completion___block_invoke;
      v19[3] = &unk_24DA0C6D8;
      v19[4] = self;
      v20 = v6;
      v21 = v8;
      v22 = v7;
      objc_msgSend(v17, "evaluateJavaScript:completionHandler:", v21, v19);

    }
    else
    {
      objc_msgSend(v11, "stringWithFormat:", CFSTR("Script: Queuing script with identifier: %@"), v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "log:", v18);

      -[SWScriptsManager queueExecutableScript:scriptExecutionCompletion:](self, "queueExecutableScript:scriptExecutionCompletion:", v6, v7);
    }
  }

}

void __45__SWScriptsManager_executeScript_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "logger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("Failed to evaluate JavaScript with error: %@; script class=%@; script=%@"),
      v9,
      v11,
      *(_QWORD *)(a1 + 48));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logError:", v12);

  }
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "webView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __45__SWScriptsManager_executeScript_completion___block_invoke_2;
    v14[3] = &unk_24DA0BA68;
    v15 = *(id *)(a1 + 56);
    objc_msgSend(v13, "_doAfterNextPresentationUpdate:", v14);

  }
}

uint64_t __45__SWScriptsManager_executeScript_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)queueExecutableScript:(id)a3 scriptExecutionCompletion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  SWQueueableScriptWithCompletion *v20;
  void *v21;
  void (**v22)(_QWORD);
  SWScriptsManager *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if ((objc_msgSend(v6, "queueable") & 1) == 0)
  {
    v22 = v7;
    v23 = self;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[SWScriptsManager queuedExecutableScripts](self, "queuedExecutableScripts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v25;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v13);
          objc_msgSend(v6, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "script");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v15, "isEqualToString:", v17);

          if (v18)
          {
            -[SWScriptsManager queuedExecutableScripts](v23, "queuedExecutableScripts");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "removeObject:", v14);

          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v11);
    }

    v7 = v22;
    self = v23;
    if (v22)
      v22[2](v22);
  }
  v20 = -[SWQueueableScriptWithCompletion initWithScript:completion:]([SWQueueableScriptWithCompletion alloc], "initWithScript:completion:", v6, v7);
  -[SWScriptsManager queuedExecutableScripts](self, "queuedExecutableScripts");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObject:", v20);

}

- (void)executeQueuedScripts
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SWScriptsManager queuedExecutableScripts](self, "queuedExecutableScripts", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "script");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "completion");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SWScriptsManager executeScript:completion:](self, "executeScript:completion:", v10, v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  -[SWScriptsManager queuedExecutableScripts](self, "queuedExecutableScripts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

}

- (WKWebView)webView
{
  return self->_webView;
}

- (SWLogger)logger
{
  return self->_logger;
}

- (NSMutableArray)queuedExecutableScripts
{
  return self->_queuedExecutableScripts;
}

- (BOOL)readyToExecuteScripts
{
  return self->_readyToExecuteScripts;
}

- (void)setReadyToExecuteScripts:(BOOL)a3
{
  self->_readyToExecuteScripts = a3;
}

- (NSMutableDictionary)scripts
{
  return self->_scripts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scripts, 0);
  objc_storeStrong((id *)&self->_queuedExecutableScripts, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_webView, 0);
}

@end
