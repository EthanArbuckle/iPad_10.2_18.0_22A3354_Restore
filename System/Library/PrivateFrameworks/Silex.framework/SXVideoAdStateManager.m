@implementation SXVideoAdStateManager

- (SXVideoAdStateManager)init
{
  SXVideoAdStateManager *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  NFStateMachine *stateMachine;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  objc_super v53;
  _QWORD v54[3];
  _QWORD v55[2];
  void *v56;
  _QWORD v57[3];
  void *v58;
  _QWORD v59[5];

  v59[3] = *MEMORY[0x24BDAC8D0];
  v53.receiver = self;
  v53.super_class = (Class)SXVideoAdStateManager;
  v2 = -[SXVideoAdStateManager init](&v53, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BE6CF90]), "initWithName:", CFSTR("idle"));
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6CF90]), "initWithName:", CFSTR("playing"));
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6CF90]), "initWithName:", CFSTR("paused"));
    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6CF90]), "initWithName:", CFSTR("finished"));
    v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6CF90]), "initWithName:", CFSTR("failed"));
    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6CF90]), "initWithName:", CFSTR("learning"));
    v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6CF90]), "initWithName:", CFSTR("skipped"));
    v6 = objc_alloc(MEMORY[0x24BE6CF88]);
    v7 = (void *)MEMORY[0x24BDBCF20];
    v59[0] = v3;
    v59[1] = v5;
    v43 = (void *)v3;
    v59[2] = v42;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)objc_msgSend(v6, "initWithName:transitionFromStates:toState:", CFSTR("play"), v9, v4);

    v10 = objc_alloc(MEMORY[0x24BE6CF88]);
    v11 = (void *)MEMORY[0x24BDBCF20];
    v58 = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v58, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)objc_msgSend(v10, "initWithName:transitionFromStates:toState:", CFSTR("pause"), v13, v5);

    v14 = objc_alloc(MEMORY[0x24BE6CF88]);
    v15 = (void *)MEMORY[0x24BDBCF20];
    v57[0] = v3;
    v57[1] = v4;
    v57[2] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)objc_msgSend(v14, "initWithName:transitionFromStates:toState:", CFSTR("fail"), v17, v50);

    v18 = objc_alloc(MEMORY[0x24BE6CF88]);
    v19 = (void *)MEMORY[0x24BDBCF20];
    v56 = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v56, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWithArray:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)objc_msgSend(v18, "initWithName:transitionFromStates:toState:", CFSTR("finish"), v21, v49);

    v22 = objc_alloc(MEMORY[0x24BE6CF88]);
    v23 = (void *)MEMORY[0x24BDBCF20];
    v55[0] = v4;
    v55[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setWithArray:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)objc_msgSend(v22, "initWithName:transitionFromStates:toState:", CFSTR("learnMore"), v25, v42);

    v26 = objc_alloc(MEMORY[0x24BE6CF88]);
    v27 = (void *)MEMORY[0x24BDBCF20];
    v54[0] = v4;
    v54[1] = v5;
    v54[2] = v42;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setWithArray:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend(v26, "initWithName:transitionFromStates:toState:", CFSTR("skip"), v29, v45);

    v30 = (id)objc_msgSend(v5, "onWillEnter:", &__block_literal_global_56);
    v31 = (id)objc_msgSend(v49, "onWillEnter:", &__block_literal_global_29);
    v32 = (id)objc_msgSend(v50, "onWillEnter:", &__block_literal_global_30);
    v33 = (id)objc_msgSend(v45, "onWillEnter:", &__block_literal_global_32);
    v34 = (id)objc_msgSend(v42, "onWillEnter:", &__block_literal_global_33);
    v51[0] = MEMORY[0x24BDAC760];
    v51[1] = 3221225472;
    v51[2] = __29__SXVideoAdStateManager_init__block_invoke_6;
    v51[3] = &unk_24D68B3C8;
    v52 = v43;
    v35 = v43;
    v36 = (id)objc_msgSend(v4, "onWillEnter:", v51);
    v37 = objc_msgSend(objc_alloc(MEMORY[0x24BE6CF80]), "initWithState:withOwner:", v35, v2);
    stateMachine = v2->_stateMachine;
    v2->_stateMachine = (NFStateMachine *)v37;

    -[NFStateMachine addState:](v2->_stateMachine, "addState:", v4);
    -[NFStateMachine addState:](v2->_stateMachine, "addState:", v5);
    -[NFStateMachine addState:](v2->_stateMachine, "addState:", v49);
    -[NFStateMachine addState:](v2->_stateMachine, "addState:", v50);
    -[NFStateMachine addState:](v2->_stateMachine, "addState:", v45);
    -[NFStateMachine addState:](v2->_stateMachine, "addState:", v42);
    -[NFStateMachine addEvent:](v2->_stateMachine, "addEvent:", v48);
    -[NFStateMachine addEvent:](v2->_stateMachine, "addEvent:", v47);
    -[NFStateMachine addEvent:](v2->_stateMachine, "addEvent:", v46);
    -[NFStateMachine addEvent:](v2->_stateMachine, "addEvent:", v44);
    -[NFStateMachine addEvent:](v2->_stateMachine, "addEvent:", v41);
    -[NFStateMachine addEvent:](v2->_stateMachine, "addEvent:", v40);
    -[NFStateMachine activate](v2->_stateMachine, "activate");

  }
  return v2;
}

void __29__SXVideoAdStateManager_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void (**v4)(void);
  id v5;

  v5 = a3;
  objc_msgSend(v5, "onPauseBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v5, "onPauseBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

void __29__SXVideoAdStateManager_init__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void (**v4)(void);
  id v5;

  v5 = a3;
  objc_msgSend(v5, "onFinishBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v5, "onFinishBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

void __29__SXVideoAdStateManager_init__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  id v11;

  v11 = a2;
  v4 = a3;
  objc_msgSend(v4, "onFailBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v11, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v11, "context");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(v4, "onFailBlock");
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v10)[2](v10, v9);

  }
}

void __29__SXVideoAdStateManager_init__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void (**v4)(void);
  id v5;

  v5 = a3;
  objc_msgSend(v5, "onSkipBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v5, "onSkipBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

void __29__SXVideoAdStateManager_init__block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void (**v4)(void);
  id v5;

  v5 = a3;
  objc_msgSend(v5, "onLearnMoreBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v5, "onLearnMoreBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

void __29__SXVideoAdStateManager_init__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(a2, "fromState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);

  if (v5 == v6)
  {
    objc_msgSend(v12, "onPlayBlock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v12;
    if (v10)
    {
      objc_msgSend(v12, "onPlayBlock");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend(v12, "onResumeBlock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v12;
    if (v7)
    {
      objc_msgSend(v12, "onResumeBlock");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v11 = (void *)v9;
      (*(void (**)(void))(v9 + 16))();

      v8 = v12;
    }
  }

}

- (void)play
{
  id v2;
  id v3;

  -[SXVideoAdStateManager stateMachine](self, "stateMachine");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "fireEventWithName:withContext:", CFSTR("play"), 0);

}

- (void)pause
{
  id v2;
  id v3;

  -[SXVideoAdStateManager stateMachine](self, "stateMachine");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "fireEventWithName:withContext:", CFSTR("pause"), 0);

}

- (void)resume
{
  id v2;
  id v3;

  -[SXVideoAdStateManager stateMachine](self, "stateMachine");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "fireEventWithName:withContext:", CFSTR("play"), 0);

}

- (void)finish
{
  id v2;
  id v3;

  -[SXVideoAdStateManager stateMachine](self, "stateMachine");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "fireEventWithName:withContext:", CFSTR("finish"), 0);

}

- (void)failWithError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  SXVideoAdStateManagerErrorContext *v7;

  v4 = a3;
  v7 = -[SXVideoAdStateManagerErrorContext initWithError:]([SXVideoAdStateManagerErrorContext alloc], "initWithError:", v4);

  -[SXVideoAdStateManager stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "fireEventWithName:withContext:", CFSTR("fail"), v7);

}

- (void)learnMore
{
  id v2;
  id v3;

  -[SXVideoAdStateManager stateMachine](self, "stateMachine");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "fireEventWithName:withContext:", CFSTR("learnMore"), 0);

}

- (void)skip
{
  id v2;
  id v3;

  -[SXVideoAdStateManager stateMachine](self, "stateMachine");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "fireEventWithName:withContext:", CFSTR("skip"), 0);

}

- (id)onPlayBlock
{
  return self->onPlayBlock;
}

- (void)onPlay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)onPauseBlock
{
  return self->onPauseBlock;
}

- (void)onPause:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)onResumeBlock
{
  return self->onResumeBlock;
}

- (void)onResume:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)onFinishBlock
{
  return self->onFinishBlock;
}

- (void)onFinish:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)onFailBlock
{
  return self->onFailBlock;
}

- (void)onFail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)onLearnMoreBlock
{
  return self->onLearnMoreBlock;
}

- (void)onLearnMore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)onSkipBlock
{
  return self->onSkipBlock;
}

- (void)onSkip:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NFStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong(&self->onSkipBlock, 0);
  objc_storeStrong(&self->onLearnMoreBlock, 0);
  objc_storeStrong(&self->onFailBlock, 0);
  objc_storeStrong(&self->onFinishBlock, 0);
  objc_storeStrong(&self->onResumeBlock, 0);
  objc_storeStrong(&self->onPauseBlock, 0);
  objc_storeStrong(&self->onPlayBlock, 0);
}

@end
