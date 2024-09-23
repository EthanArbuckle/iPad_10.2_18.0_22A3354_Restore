@implementation SXVisibilityMonitor

- (SXVisibilityMonitor)initWithObject:(id)a3 visiblePercentageProvider:(id)a4
{
  id v6;
  id v7;
  SXVisibilityMonitor *v8;
  uint64_t v9;
  NSMutableArray *willAppearBlocks;
  uint64_t v11;
  NSMutableArray *didAppearBlocks;
  uint64_t v13;
  NSMutableArray *visiblePercentageBlocks;
  uint64_t v15;
  NSMutableArray *willDisappearBlocks;
  uint64_t v17;
  NSMutableArray *didDisappearBlocks;
  uint64_t v19;
  NFStateMachineState *appearingState;
  uint64_t v21;
  NFStateMachineState *appearedState;
  uint64_t v23;
  NFStateMachineState *disappearingState;
  uint64_t v25;
  NFStateMachineState *disappearedState;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  NFStateMachineState *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  NFStateMachineState *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  NFStateMachine *stateMachine;
  objc_super v56;
  _QWORD v57[2];
  NFStateMachineState *v58;
  _QWORD v59[2];
  _QWORD v60[2];

  v60[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v56.receiver = self;
  v56.super_class = (Class)SXVisibilityMonitor;
  v8 = -[SXVisibilityMonitor init](&v56, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    willAppearBlocks = v8->_willAppearBlocks;
    v8->_willAppearBlocks = (NSMutableArray *)v9;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    didAppearBlocks = v8->_didAppearBlocks;
    v8->_didAppearBlocks = (NSMutableArray *)v11;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    visiblePercentageBlocks = v8->_visiblePercentageBlocks;
    v8->_visiblePercentageBlocks = (NSMutableArray *)v13;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v15 = objc_claimAutoreleasedReturnValue();
    willDisappearBlocks = v8->_willDisappearBlocks;
    v8->_willDisappearBlocks = (NSMutableArray *)v15;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v17 = objc_claimAutoreleasedReturnValue();
    didDisappearBlocks = v8->_didDisappearBlocks;
    v8->_didDisappearBlocks = (NSMutableArray *)v17;

    objc_storeStrong((id *)&v8->_visiblePercentageProvider, a4);
    objc_storeWeak(&v8->_object, v6);
    v8->_state = 0;
    v19 = objc_msgSend(objc_alloc(MEMORY[0x24BE6CF90]), "initWithName:", CFSTR("appearing"));
    appearingState = v8->_appearingState;
    v8->_appearingState = (NFStateMachineState *)v19;

    v21 = objc_msgSend(objc_alloc(MEMORY[0x24BE6CF90]), "initWithName:", CFSTR("appeared"));
    appearedState = v8->_appearedState;
    v8->_appearedState = (NFStateMachineState *)v21;

    v23 = objc_msgSend(objc_alloc(MEMORY[0x24BE6CF90]), "initWithName:", CFSTR("disappearing"));
    disappearingState = v8->_disappearingState;
    v8->_disappearingState = (NFStateMachineState *)v23;

    v25 = objc_msgSend(objc_alloc(MEMORY[0x24BE6CF90]), "initWithName:", CFSTR("disappeared"));
    disappearedState = v8->_disappearedState;
    v8->_disappearedState = (NFStateMachineState *)v25;

    v27 = (id)-[NFStateMachineState onDidEnter:](v8->_appearingState, "onDidEnter:", &__block_literal_global_30);
    v28 = (id)-[NFStateMachineState onDidEnter:](v8->_appearedState, "onDidEnter:", &__block_literal_global_10);
    v29 = (id)-[NFStateMachineState onDidEnter:](v8->_disappearingState, "onDidEnter:", &__block_literal_global_11);
    v30 = (id)-[NFStateMachineState onDidEnter:](v8->_disappearedState, "onDidEnter:", &__block_literal_global_12);
    v31 = objc_alloc(MEMORY[0x24BE6CF88]);
    v32 = (void *)MEMORY[0x24BDBCF20];
    v60[0] = v8->_disappearedState;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setWithArray:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v31, "initWithName:transitionFromStates:toState:", CFSTR("appearing"), v34, v8->_appearingState);

    v36 = objc_alloc(MEMORY[0x24BE6CF88]);
    v37 = (void *)MEMORY[0x24BDBCF20];
    v38 = v8->_disappearingState;
    v59[0] = v8->_appearingState;
    v59[1] = v38;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setWithArray:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)objc_msgSend(v36, "initWithName:transitionFromStates:toState:", CFSTR("appeared"), v40, v8->_appearedState);

    v42 = objc_alloc(MEMORY[0x24BE6CF88]);
    v43 = (void *)MEMORY[0x24BDBCF20];
    v58 = v8->_appearedState;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v58, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setWithArray:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)objc_msgSend(v42, "initWithName:transitionFromStates:toState:", CFSTR("disappearing"), v45, v8->_disappearingState);

    v47 = objc_alloc(MEMORY[0x24BE6CF88]);
    v48 = (void *)MEMORY[0x24BDBCF20];
    v49 = v8->_disappearingState;
    v57[0] = v8->_appearingState;
    v57[1] = v49;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 2);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setWithArray:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void *)objc_msgSend(v47, "initWithName:transitionFromStates:toState:", CFSTR("disappeared"), v51, v8->_disappearedState);

    v53 = objc_msgSend(objc_alloc(MEMORY[0x24BE6CF80]), "initWithState:withOwner:", v8->_disappearedState, v8);
    stateMachine = v8->_stateMachine;
    v8->_stateMachine = (NFStateMachine *)v53;

    -[NFStateMachine addState:](v8->_stateMachine, "addState:", v8->_appearedState);
    -[NFStateMachine addEvent:](v8->_stateMachine, "addEvent:", v35);
    -[NFStateMachine addEvent:](v8->_stateMachine, "addEvent:", v41);
    -[NFStateMachine addEvent:](v8->_stateMachine, "addEvent:", v46);
    -[NFStateMachine addEvent:](v8->_stateMachine, "addEvent:", v52);
    -[NFStateMachine activate](v8->_stateMachine, "activate");

  }
  return v8;
}

id __64__SXVisibilityMonitor_initWithObject_visiblePercentageProvider___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "setState:", 1);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v3, "willAppearBlocks", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++) + 16))();
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x24BE6CF70], "asVoid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __64__SXVisibilityMonitor_initWithObject_visiblePercentageProvider___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "setState:", 2);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v3, "didAppearBlocks", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++) + 16))();
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x24BE6CF70], "asVoid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __64__SXVisibilityMonitor_initWithObject_visiblePercentageProvider___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "setState:", 3);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v3, "willDisappearBlocks", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++) + 16))();
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x24BE6CF70], "asVoid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __64__SXVisibilityMonitor_initWithObject_visiblePercentageProvider___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "setState:", 4);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v3, "didDisappearBlocks", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++) + 16))();
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x24BE6CF70], "asVoid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)lock
{
  -[SXVisibilityMonitor setLockCount:](self, "setLockCount:", -[SXVisibilityMonitor lockCount](self, "lockCount") + 1);
}

- (void)unlock
{
  -[SXVisibilityMonitor setLockCount:](self, "setLockCount:", -[SXVisibilityMonitor lockCount](self, "lockCount") - 1);
}

- (BOOL)locked
{
  return -[SXVisibilityMonitor lockCount](self, "lockCount") > 0;
}

- (BOOL)appeared
{
  SXVisibilityMonitor *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = self;
  -[SXVisibilityMonitor stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXVisibilityMonitor appearedState](v2, "appearedState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v4 == v5;

  return (char)v2;
}

- (void)onWillAppear:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SXVisibilityMonitor willAppearBlocks](self, "willAppearBlocks");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x219A070A8](v4);

  objc_msgSend(v6, "addObject:", v5);
}

- (void)onDidAppear:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SXVisibilityMonitor didAppearBlocks](self, "didAppearBlocks");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x219A070A8](v4);

  objc_msgSend(v6, "addObject:", v5);
}

- (void)onVisiblePercentageChange:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SXVisibilityMonitor visiblePercentageBlocks](self, "visiblePercentageBlocks");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x219A070A8](v4);

  objc_msgSend(v6, "addObject:", v5);
}

- (void)onWillDisappear:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SXVisibilityMonitor willDisappearBlocks](self, "willDisappearBlocks");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x219A070A8](v4);

  objc_msgSend(v6, "addObject:", v5);
}

- (void)onDidDisappear:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SXVisibilityMonitor didDisappearBlocks](self, "didDisappearBlocks");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x219A070A8](v4);

  objc_msgSend(v6, "addObject:", v5);
}

- (void)willAppear
{
  id v2;
  id v3;

  -[SXVisibilityMonitor stateMachine](self, "stateMachine");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "fireEventWithName:withContext:", CFSTR("appearing"), 0);

}

- (void)didAppear
{
  id v2;
  id v3;

  -[SXVisibilityMonitor stateMachine](self, "stateMachine");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "fireEventWithName:withContext:", CFSTR("appeared"), 0);

}

- (void)willDisappear
{
  id v2;
  id v3;

  -[SXVisibilityMonitor stateMachine](self, "stateMachine");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "fireEventWithName:withContext:", CFSTR("disappearing"), 0);

}

- (void)didDisappear
{
  id v2;
  id v3;

  -[SXVisibilityMonitor stateMachine](self, "stateMachine");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "fireEventWithName:withContext:", CFSTR("disappeared"), 0);

}

- (void)determineVisiblePercentage
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  if (-[SXVisibilityMonitor locked](self, "locked"))
    return;
  -[SXVisibilityMonitor visiblePercentageProvider](self, "visiblePercentageProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXVisibilityMonitor object](self, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visiblePercentageOfObject:", v4);
  v6 = v5;

  -[SXVisibilityMonitor setVisiblePercentage:](self, "setVisiblePercentage:", v6);
  -[SXVisibilityMonitor stateMachine](self, "stateMachine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXVisibilityMonitor appearedState](self, "appearedState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 != v9 || v6 >= 1.0)
  {

    goto LABEL_8;
  }

  if (v6 < 0.0)
  {
LABEL_8:
    -[SXVisibilityMonitor stateMachine](self, "stateMachine");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "state");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXVisibilityMonitor disappearedState](self, "disappearedState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 == v12 && v6 <= 1.0)
    {

      if (v6 > 0.0)
        -[SXVisibilityMonitor willAppear](self, "willAppear");
    }
    else
    {

    }
    goto LABEL_13;
  }
  -[SXVisibilityMonitor willDisappear](self, "willDisappear");
LABEL_13:
  -[SXVisibilityMonitor stateMachine](self, "stateMachine");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "state");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXVisibilityMonitor disappearedState](self, "disappearedState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 == v15 || v6 > 0.0)
  {
    -[SXVisibilityMonitor stateMachine](self, "stateMachine");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "state");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXVisibilityMonitor appearedState](self, "appearedState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17 != v18 && v6 >= 1.0)
      -[SXVisibilityMonitor didAppear](self, "didAppear");
  }
  else
  {
    -[SXVisibilityMonitor didDisappear](self, "didDisappear");
  }
}

- (void)setVisiblePercentage:(double)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (self->_visiblePercentage != a3)
  {
    self->_visiblePercentage = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[SXVisibilityMonitor visiblePercentageBlocks](self, "visiblePercentageBlocks", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          (*(void (**)(double))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i) + 16))(a3);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (double)visiblePercentage
{
  return self->_visiblePercentage;
}

- (id)object
{
  return objc_loadWeakRetained(&self->_object);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (SXVisiblePercentageProviding)visiblePercentageProvider
{
  return self->_visiblePercentageProvider;
}

- (NFStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (NFStateMachineState)appearingState
{
  return self->_appearingState;
}

- (NFStateMachineState)appearedState
{
  return self->_appearedState;
}

- (NFStateMachineState)disappearingState
{
  return self->_disappearingState;
}

- (NFStateMachineState)disappearedState
{
  return self->_disappearedState;
}

- (NSMutableArray)willAppearBlocks
{
  return self->_willAppearBlocks;
}

- (NSMutableArray)didAppearBlocks
{
  return self->_didAppearBlocks;
}

- (NSMutableArray)visiblePercentageBlocks
{
  return self->_visiblePercentageBlocks;
}

- (NSMutableArray)willDisappearBlocks
{
  return self->_willDisappearBlocks;
}

- (NSMutableArray)didDisappearBlocks
{
  return self->_didDisappearBlocks;
}

- (int64_t)lockCount
{
  return self->_lockCount;
}

- (void)setLockCount:(int64_t)a3
{
  self->_lockCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_didDisappearBlocks, 0);
  objc_storeStrong((id *)&self->_willDisappearBlocks, 0);
  objc_storeStrong((id *)&self->_visiblePercentageBlocks, 0);
  objc_storeStrong((id *)&self->_didAppearBlocks, 0);
  objc_storeStrong((id *)&self->_willAppearBlocks, 0);
  objc_storeStrong((id *)&self->_disappearedState, 0);
  objc_storeStrong((id *)&self->_disappearingState, 0);
  objc_storeStrong((id *)&self->_appearedState, 0);
  objc_storeStrong((id *)&self->_appearingState, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_visiblePercentageProvider, 0);
  objc_destroyWeak(&self->_object);
}

@end
