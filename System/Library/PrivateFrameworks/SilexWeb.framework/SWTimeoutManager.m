@implementation SWTimeoutManager

- (SWTimeoutManager)initWithTimeout:(double)a3 messageHandlerManager:(id)a4 documentStateProvider:(id)a5
{
  id v8;
  id v9;
  void *v10;
  SWTimeoutManager *v13;
  SWTimeoutManager *v14;
  SWTimeoutManager *v15;
  uint64_t v16;
  NSMutableArray *timeoutBlocks;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  NFStateMachine *stateMachine;
  id v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[5];
  objc_super v53;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (a3 < 0.0 || v8 == 0 || v9 == 0)
  {
    v13 = 0;
  }
  else
  {
    v53.receiver = self;
    v53.super_class = (Class)SWTimeoutManager;
    v14 = -[SWTimeoutManager init](&v53, sel_init);
    v15 = v14;
    if (v14)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v16 = objc_claimAutoreleasedReturnValue();
      timeoutBlocks = v15->_timeoutBlocks;
      v15->_timeoutBlocks = (NSMutableArray *)v16;

      +[SWWeakMessageHandler handlerWithMessageHandler:](SWWeakMessageHandler, "handlerWithMessageHandler:", v15);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addMessageHandler:name:", v42, CFSTR("presentable"));
      objc_msgSend(v8, "addMessageHandler:name:", v42, CFSTR("loading"));
      objc_msgSend(v8, "addMessageHandler:name:", v42, CFSTR("update"));
      v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6CF90]), "initWithName:", CFSTR("idle"));
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6CF90]), "initWithName:", CFSTR("waiting"));
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6CF90]), "initWithName:", CFSTR("timeout"));
      v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6CF90]), "initWithName:", CFSTR("loaded"));
      v20 = objc_alloc(MEMORY[0x24BE6CF88]);
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v44);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (void *)objc_msgSend(v20, "initWithName:transitionFromStates:toState:", CFSTR("waiting"), v21, v18);

      v22 = objc_alloc(MEMORY[0x24BE6CF88]);
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (void *)objc_msgSend(v22, "initWithName:transitionFromStates:toState:", CFSTR("timeout"), v23, v19);

      v24 = objc_alloc(MEMORY[0x24BE6CF88]);
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v18);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)objc_msgSend(v24, "initWithName:transitionFromStates:toState:", CFSTR("loaded"), v25, v43);

      v26 = objc_alloc(MEMORY[0x24BE6CF88]);
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", v19, v18, v43, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v26, "initWithName:transitionFromStates:toState:", CFSTR("reload"), v27, v44);

      v29 = MEMORY[0x24BDAC760];
      v52[0] = MEMORY[0x24BDAC760];
      v52[1] = 3221225472;
      v52[2] = __80__SWTimeoutManager_initWithTimeout_messageHandlerManager_documentStateProvider___block_invoke;
      v52[3] = &__block_descriptor_40_e55_v24__0__NFStateMachineTransition_8__SWTimeoutManager_16l;
      *(double *)&v52[4] = a3;
      v30 = (id)objc_msgSend(v18, "onWillEnter:", v52);
      v31 = (id)objc_msgSend(v18, "onWillExit:", &__block_literal_global_7);
      v32 = (id)objc_msgSend(v19, "onWillEnter:", &__block_literal_global_16_0);
      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6CF80]), "initWithState:withOwner:", v44, v15);
      objc_msgSend(v33, "addState:", v18);
      objc_msgSend(v33, "addState:", v43);
      objc_msgSend(v33, "addState:", v19);
      objc_msgSend(v33, "addEvent:", v45);
      objc_msgSend(v33, "addEvent:", v41);
      objc_msgSend(v33, "addEvent:", v40);
      objc_msgSend(v33, "addEvent:", v28);
      v50[0] = v29;
      v50[1] = 3221225472;
      v50[2] = __80__SWTimeoutManager_initWithTimeout_messageHandlerManager_documentStateProvider___block_invoke_5;
      v50[3] = &unk_24DA0BB38;
      v34 = v33;
      v51 = v34;
      objc_msgSend(v10, "onReady:", v50);
      v48[0] = v29;
      v48[1] = 3221225472;
      v48[2] = __80__SWTimeoutManager_initWithTimeout_messageHandlerManager_documentStateProvider___block_invoke_6;
      v48[3] = &unk_24DA0BB38;
      v35 = v34;
      v49 = v35;
      objc_msgSend(v10, "onLoad:", v48);
      v46[0] = v29;
      v46[1] = 3221225472;
      v46[2] = __80__SWTimeoutManager_initWithTimeout_messageHandlerManager_documentStateProvider___block_invoke_7;
      v46[3] = &unk_24DA0BB38;
      v36 = v35;
      v47 = v36;
      objc_msgSend(v10, "onUnload:", v46);
      stateMachine = v15->_stateMachine;
      v15->_stateMachine = (NFStateMachine *)v36;
      v38 = v36;

    }
    self = v15;
    v13 = self;
  }

  return v13;
}

void __80__SWTimeoutManager_initWithTimeout_messageHandlerManager_documentStateProvider___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x24BDBCF40];
    v7 = *(double *)(a1 + 32);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __80__SWTimeoutManager_initWithTimeout_messageHandlerManager_documentStateProvider___block_invoke_2;
    v10[3] = &unk_24DA0C700;
    v8 = v4;
    v11 = v8;
    objc_msgSend(v6, "scheduledTimerWithTimeInterval:repeats:block:", 0, v10, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTimer:", v9);

  }
}

void __80__SWTimeoutManager_initWithTimeout_messageHandlerManager_documentStateProvider___block_invoke_2(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "fireEventWithName:withContext:", CFSTR("timeout"), 0);

}

void __80__SWTimeoutManager_initWithTimeout_messageHandlerManager_documentStateProvider___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v4 = a3;
  objc_msgSend(v4, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  objc_msgSend(v4, "setTimer:", 0);
}

void __80__SWTimeoutManager_initWithTimeout_messageHandlerManager_documentStateProvider___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(a3, "timeoutBlocks", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

id __80__SWTimeoutManager_initWithTimeout_messageHandlerManager_documentStateProvider___block_invoke_5(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "fireEventWithName:withContext:", CFSTR("waiting"), 0);
}

id __80__SWTimeoutManager_initWithTimeout_messageHandlerManager_documentStateProvider___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "activateIfNeeded");
  return (id)objc_msgSend(*(id *)(a1 + 32), "fireEventWithName:withContext:", CFSTR("reload"), 0);
}

uint64_t __80__SWTimeoutManager_initWithTimeout_messageHandlerManager_documentStateProvider___block_invoke_7(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "fireEventWithName:withContext:", CFSTR("reload"), 0);
  return objc_msgSend(*(id *)(a1 + 32), "deactivateIfNeeded");
}

- (void)onTimeout:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    -[SWTimeoutManager timeoutBlocks](self, "timeoutBlocks");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x219A22DDC](v4);

    objc_msgSend(v6, "addObject:", v5);
  }
}

- (void)didReceiveMessage:(id)a3 securityOrigin:(id)a4
{
  id v4;
  id v5;

  -[SWTimeoutManager stateMachine](self, "stateMachine", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v5, "fireEventWithName:withContext:", CFSTR("loaded"), 0);

}

- (NSMutableArray)timeoutBlocks
{
  return self->_timeoutBlocks;
}

- (NFStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_timeoutBlocks, 0);
}

@end
