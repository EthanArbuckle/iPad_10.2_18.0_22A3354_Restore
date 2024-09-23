@implementation SWDocumentStateManager

- (SWDocumentStateManager)initWithUserContentController:(id)a3
{
  id v5;
  SWDocumentStateManager *v6;
  SWDocumentStateManager *v7;
  uint64_t v8;
  NSMutableArray *onReadyBlocks;
  uint64_t v10;
  NSMutableArray *onLoadBlocks;
  uint64_t v12;
  NSMutableArray *onUnloadBlocks;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NFStateMachine *stateMachine;
  void *v35;
  void *v36;
  void *v37;
  SWWeakScriptMessageHandler *v38;
  id v39;
  objc_super v40;
  _QWORD v41[2];
  _QWORD v42[4];

  v42[3] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v40.receiver = self;
  v40.super_class = (Class)SWDocumentStateManager;
  v6 = -[SWDocumentStateManager init](&v40, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userContentController, a3);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    onReadyBlocks = v7->_onReadyBlocks;
    v7->_onReadyBlocks = (NSMutableArray *)v8;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    onLoadBlocks = v7->_onLoadBlocks;
    v7->_onLoadBlocks = (NSMutableArray *)v10;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    onUnloadBlocks = v7->_onUnloadBlocks;
    v7->_onUnloadBlocks = (NSMutableArray *)v12;

    v38 = -[SWWeakScriptMessageHandler initWithScriptMessageHandler:]([SWWeakScriptMessageHandler alloc], "initWithScriptMessageHandler:", v7);
    objc_msgSend(v5, "addScriptMessageHandler:name:", v38, CFSTR("documentReady"));
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFA900]), "initWithSource:injectionTime:forMainFrameOnly:", CFSTR("window.webkit.messageHandlers.documentReady.postMessage({});"),
                    0,
                    1);
    objc_msgSend(v5, "addUserScript:", v37);
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6CF90]), "initWithName:", CFSTR("idle"));
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6CF90]), "initWithName:", CFSTR("loading"));
    v15 = (id)objc_msgSend(v14, "onWillEnter:", &__block_literal_global);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6CF90]), "initWithName:", CFSTR("ready"));
    v17 = (id)objc_msgSend(v16, "onWillEnter:", &__block_literal_global_13);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6CF90]), "initWithName:", CFSTR("unload"));
    v19 = (id)objc_msgSend(v18, "onWillEnter:", &__block_literal_global_16);
    v39 = v5;
    v20 = objc_alloc(MEMORY[0x24BE6CF88]);
    v21 = (void *)MEMORY[0x24BDBCF20];
    v42[0] = v35;
    v42[1] = v18;
    v42[2] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setWithArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(v20, "initWithName:transitionFromStates:toState:", CFSTR("loading"), v23, v14);

    v24 = objc_alloc(MEMORY[0x24BE6CF88]);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v14);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v24, "initWithName:transitionFromStates:toState:", CFSTR("ready"), v25, v16);

    v27 = objc_alloc(MEMORY[0x24BE6CF88]);
    v28 = (void *)MEMORY[0x24BDBCF20];
    v41[0] = v14;
    v41[1] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setWithArray:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v27, "initWithName:transitionFromStates:toState:", CFSTR("unload"), v30, v18);

    v5 = v39;
    v32 = objc_msgSend(objc_alloc(MEMORY[0x24BE6CF80]), "initWithState:withOwner:", v35, v7);
    stateMachine = v7->_stateMachine;
    v7->_stateMachine = (NFStateMachine *)v32;

    -[NFStateMachine addState:](v7->_stateMachine, "addState:", v14);
    -[NFStateMachine addState:](v7->_stateMachine, "addState:", v16);
    -[NFStateMachine addState:](v7->_stateMachine, "addState:", v18);
    -[NFStateMachine addEvent:](v7->_stateMachine, "addEvent:", v36);
    -[NFStateMachine addEvent:](v7->_stateMachine, "addEvent:", v26);
    -[NFStateMachine addEvent:](v7->_stateMachine, "addEvent:", v31);
    -[NFStateMachine activate](v7->_stateMachine, "activate");

  }
  return v7;
}

void __56__SWDocumentStateManager_initWithUserContentController___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a3, "onLoadBlocks", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++) + 16))();
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

void __56__SWDocumentStateManager_initWithUserContentController___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a3, "onReadyBlocks", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++) + 16))();
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

void __56__SWDocumentStateManager_initWithUserContentController___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a3, "onUnloadBlocks", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++) + 16))();
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)documentStartedLoading
{
  id v2;
  id v3;

  -[SWDocumentStateManager stateMachine](self, "stateMachine");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "fireEventWithName:withContext:", CFSTR("loading"), 0);

}

- (void)documentIsReady
{
  id v2;
  id v3;

  -[SWDocumentStateManager stateMachine](self, "stateMachine");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "fireEventWithName:withContext:", CFSTR("ready"), 0);

}

- (void)documentWillUnload
{
  id v2;
  id v3;

  -[SWDocumentStateManager stateMachine](self, "stateMachine");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "fireEventWithName:withContext:", CFSTR("unload"), 0);

}

- (void)onReady:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    -[SWDocumentStateManager onReadyBlocks](self, "onReadyBlocks");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x219A22DDC](v4);

    objc_msgSend(v6, "addObject:", v5);
  }
}

- (void)onLoad:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    -[SWDocumentStateManager onLoadBlocks](self, "onLoadBlocks");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x219A22DDC](v4);

    objc_msgSend(v6, "addObject:", v5);
  }
}

- (void)onUnload:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    -[SWDocumentStateManager onUnloadBlocks](self, "onUnloadBlocks");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x219A22DDC](v4);

    objc_msgSend(v6, "addObject:", v5);
  }
}

- (BOOL)isDocumentReady
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[SWDocumentStateManager stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("ready"));

  return v5;
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  void *v5;
  int v6;

  objc_msgSend(a4, "name", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("documentReady"));

  if (v6)
    -[SWDocumentStateManager documentIsReady](self, "documentIsReady");
}

- (WKUserContentController)userContentController
{
  return self->_userContentController;
}

- (NSMutableArray)onReadyBlocks
{
  return self->_onReadyBlocks;
}

- (NSMutableArray)onLoadBlocks
{
  return self->_onLoadBlocks;
}

- (NSMutableArray)onUnloadBlocks
{
  return self->_onUnloadBlocks;
}

- (NFStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_onUnloadBlocks, 0);
  objc_storeStrong((id *)&self->_onLoadBlocks, 0);
  objc_storeStrong((id *)&self->_onReadyBlocks, 0);
  objc_storeStrong((id *)&self->_userContentController, 0);
}

@end
