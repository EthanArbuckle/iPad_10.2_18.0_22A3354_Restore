@implementation SXQuickLookComponentView

- (SXQuickLookComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 fileProvider:(id)a7 quickLookModule:(id)a8
{
  id v15;
  id v16;
  SXQuickLookComponentView *v17;
  SXQuickLookComponentView *v18;
  objc_super v20;

  v15 = a7;
  v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)SXQuickLookComponentView;
  v17 = -[SXComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:](&v20, sel_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_, a3, a4, a5, a6);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_fileProvider, a7);
    objc_storeStrong((id *)&v18->_quickLookModule, a8);
  }

  return v18;
}

- (void)configure
{
  UITapGestureRecognizer *v3;
  UITapGestureRecognizer *tapGestureRecognizer;
  UIActivityIndicatorView *v5;
  UIActivityIndicatorView *loadingIndicator;
  void *v7;
  void *v8;
  NFStateMachineState *v9;
  NFStateMachineState *idleState;
  NFStateMachineState *v11;
  NFStateMachineState *loadingState;
  NFStateMachineState *v13;
  NFStateMachineState *presentingState;
  NFStateMachineState *v15;
  NFStateMachineState *errorState;
  id v17;
  void *v18;
  NFStateMachine *v19;
  NFStateMachine *stateMachine;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  objc_super v58;

  v58.receiver = self;
  v58.super_class = (Class)SXQuickLookComponentView;
  -[SXComponentView configure](&v58, sel_configure);
  v3 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel_handleTap);
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v3;

  v5 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
  loadingIndicator = self->_loadingIndicator;
  self->_loadingIndicator = v5;

  -[SXComponentView contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXQuickLookComponentView loadingIndicator](self, "loadingIndicator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  -[SXQuickLookComponentView createIdleState](self, "createIdleState");
  v9 = (NFStateMachineState *)objc_claimAutoreleasedReturnValue();
  idleState = self->_idleState;
  self->_idleState = v9;

  -[SXQuickLookComponentView createLoadingState](self, "createLoadingState");
  v11 = (NFStateMachineState *)objc_claimAutoreleasedReturnValue();
  loadingState = self->_loadingState;
  self->_loadingState = v11;

  -[SXQuickLookComponentView createPresentingState](self, "createPresentingState");
  v13 = (NFStateMachineState *)objc_claimAutoreleasedReturnValue();
  presentingState = self->_presentingState;
  self->_presentingState = v13;

  -[SXQuickLookComponentView createErrorState](self, "createErrorState");
  v15 = (NFStateMachineState *)objc_claimAutoreleasedReturnValue();
  errorState = self->_errorState;
  self->_errorState = v15;

  v17 = objc_alloc(MEMORY[0x24BE6CF80]);
  -[SXQuickLookComponentView idleState](self, "idleState");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (NFStateMachine *)objc_msgSend(v17, "initWithState:withOwner:", v18, self);
  stateMachine = self->_stateMachine;
  self->_stateMachine = v19;

  -[SXQuickLookComponentView stateMachine](self, "stateMachine");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXQuickLookComponentView loadingState](self, "loadingState");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addState:", v22);

  -[SXQuickLookComponentView stateMachine](self, "stateMachine");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXQuickLookComponentView presentingState](self, "presentingState");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addState:", v24);

  -[SXQuickLookComponentView stateMachine](self, "stateMachine");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXQuickLookComponentView errorState](self, "errorState");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addState:", v26);

  v27 = objc_alloc(MEMORY[0x24BE6CF88]);
  v28 = (void *)MEMORY[0x24BDBCF20];
  -[SXQuickLookComponentView idleState](self, "idleState");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXQuickLookComponentView errorState](self, "errorState");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setWithObjects:", v29, v30, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXQuickLookComponentView loadingState](self, "loadingState");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v27, "initWithName:transitionFromStates:toState:", CFSTR("load"), v31, v32);

  v34 = objc_alloc(MEMORY[0x24BE6CF88]);
  v35 = (void *)MEMORY[0x24BDBCF20];
  -[SXQuickLookComponentView loadingState](self, "loadingState");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setWithObjects:", v36, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXQuickLookComponentView presentingState](self, "presentingState");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v34, "initWithName:transitionFromStates:toState:", CFSTR("present"), v37, v38);

  v40 = objc_alloc(MEMORY[0x24BE6CF88]);
  v41 = (void *)MEMORY[0x24BDBCF20];
  -[SXQuickLookComponentView loadingState](self, "loadingState");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setWithObjects:", v42, 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXQuickLookComponentView errorState](self, "errorState");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend(v40, "initWithName:transitionFromStates:toState:", CFSTR("error"), v43, v44);

  v46 = objc_alloc(MEMORY[0x24BE6CF88]);
  v47 = (void *)MEMORY[0x24BDBCF20];
  -[SXQuickLookComponentView loadingState](self, "loadingState");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXQuickLookComponentView presentingState](self, "presentingState");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setWithObjects:", v48, v49, 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXQuickLookComponentView idleState](self, "idleState");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)objc_msgSend(v46, "initWithName:transitionFromStates:toState:", CFSTR("unload"), v50, v51);

  -[SXQuickLookComponentView stateMachine](self, "stateMachine");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "addEvent:", v33);

  -[SXQuickLookComponentView stateMachine](self, "stateMachine");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addEvent:", v39);

  -[SXQuickLookComponentView stateMachine](self, "stateMachine");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "addEvent:", v45);

  -[SXQuickLookComponentView stateMachine](self, "stateMachine");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "addEvent:", v52);

  -[SXQuickLookComponentView stateMachine](self, "stateMachine");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "activate");

}

- (void)presentComponentWithChanges:(id)a3
{
  BOOL var0;
  objc_super v5;

  var0 = a3.var0;
  v5.receiver = self;
  v5.super_class = (Class)SXQuickLookComponentView;
  -[SXComponentView presentComponentWithChanges:](&v5, sel_presentComponentWithChanges_, *(_QWORD *)&a3.var0 & 0xFFFFFFLL);
  if (var0)
    -[SXQuickLookComponentView layout](self, "layout");
}

- (void)renderContents
{
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SXQuickLookComponentView;
  -[SXComponentView renderContents](&v5, sel_renderContents);
  -[SXQuickLookComponentView stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "fireEventWithName:withContext:", CFSTR("load"), 0);

  -[SXQuickLookComponentView layout](self, "layout");
}

- (void)discardContents
{
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SXQuickLookComponentView;
  -[SXComponentView discardContents](&v5, sel_discardContents);
  -[SXQuickLookComponentView stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "fireEventWithName:withContext:", CFSTR("unload"), 0);

}

- (void)handleTap
{
  id v2;
  id v3;

  -[SXQuickLookComponentView stateMachine](self, "stateMachine");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "fireEventWithName:withContext:", CFSTR("load"), 0);

}

- (void)layout
{
  -[SXQuickLookComponentView layoutLoadingIndicator](self, "layoutLoadingIndicator");
  -[SXQuickLookComponentView layoutErrorView](self, "layoutErrorView");
  -[SXQuickLookComponentView layoutWebView](self, "layoutWebView");
}

- (void)layoutLoadingIndicator
{
  void *v3;
  double MidX;
  void *v5;
  id v6;
  CGRect v7;
  CGRect v8;

  -[SXQuickLookComponentView loadingIndicator](self, "loadingIndicator");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SXComponentView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  MidX = CGRectGetMidX(v7);
  -[SXComponentView contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v6, "setCenter:", MidX, CGRectGetMidY(v8));

}

- (void)layoutWebView
{
  void *v3;
  void *v4;
  id v5;

  -[SXQuickLookComponentView quickLookViewController](self, "quickLookViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "setFrame:");

}

- (void)layoutErrorView
{
  void *v3;
  double MidX;
  void *v5;
  id v6;
  CGRect v7;
  CGRect v8;

  -[SXQuickLookComponentView errorLabel](self, "errorLabel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SXComponentView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  MidX = CGRectGetMidX(v7);
  -[SXComponentView contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v6, "setCenter:", MidX, CGRectGetMidY(v8));

}

- (id)createIdleState
{
  void *v2;
  id v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6CF90]), "initWithName:", CFSTR("idle"));
  v3 = (id)objc_msgSend(v2, "onWillEnter:", &__block_literal_global_75);
  return v2;
}

void __43__SXQuickLookComponentView_createIdleState__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "loadingIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAnimating");

  objc_msgSend(v8, "quickLookViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "willMoveToParentViewController:", 0);

  objc_msgSend(v8, "quickLookViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeFromSuperview");

  objc_msgSend(v8, "quickLookViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didMoveToParentViewController:", 0);

  objc_msgSend(v8, "setQuickLookViewController:", 0);
}

- (id)createLoadingState
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6CF90]), "initWithName:", CFSTR("loading"));
  v3 = (id)objc_msgSend(v2, "onWillEnter:", &__block_literal_global_27);
  v4 = (id)objc_msgSend(v2, "onWillExit:", &__block_literal_global_33_0);
  return v2;
}

void __46__SXQuickLookComponentView_createLoadingState__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  objc_msgSend(v3, "loadingIndicator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startAnimating");

  objc_msgSend(v3, "fileProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "component");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __46__SXQuickLookComponentView_createLoadingState__block_invoke_2;
  v11[3] = &unk_24D68CAB8;
  v12 = v3;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __46__SXQuickLookComponentView_createLoadingState__block_invoke_4;
  v9[3] = &unk_24D68CAE0;
  v10 = v12;
  v8 = v12;
  objc_msgSend(v5, "fileForComponent:onCompletion:onError:", v6, v11, v9);

}

void __46__SXQuickLookComponentView_createLoadingState__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  SXQuickLookComponentPresentationTransitionContext *v4;
  SXQuickLookComponentPresentationTransitionContext *v5;
  _QWORD v6[4];
  id v7;
  SXQuickLookComponentPresentationTransitionContext *v8;

  v3 = a2;
  v4 = -[SXQuickLookComponentPresentationTransitionContext initWithFile:]([SXQuickLookComponentPresentationTransitionContext alloc], "initWithFile:", v3);

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__SXQuickLookComponentView_createLoadingState__block_invoke_3;
  v6[3] = &unk_24D687408;
  v7 = *(id *)(a1 + 32);
  v8 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __46__SXQuickLookComponentView_createLoadingState__block_invoke_3(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "fireEventWithName:withContext:", CFSTR("present"), *(_QWORD *)(a1 + 40));

}

void __46__SXQuickLookComponentView_createLoadingState__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  SXQuickLookComponentErrorTransitionContext *v4;
  SXQuickLookComponentErrorTransitionContext *v5;
  _QWORD v6[4];
  id v7;
  SXQuickLookComponentErrorTransitionContext *v8;

  v3 = a2;
  v4 = -[SXQuickLookComponentErrorTransitionContext initWithError:]([SXQuickLookComponentErrorTransitionContext alloc], "initWithError:", v3);

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__SXQuickLookComponentView_createLoadingState__block_invoke_5;
  v6[3] = &unk_24D687408;
  v7 = *(id *)(a1 + 32);
  v8 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __46__SXQuickLookComponentView_createLoadingState__block_invoke_5(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "fireEventWithName:withContext:", CFSTR("error"), *(_QWORD *)(a1 + 40));

}

void __46__SXQuickLookComponentView_createLoadingState__block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  objc_msgSend(a3, "loadingIndicator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAnimating");

}

- (id)createPresentingState
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6CF90]), "initWithName:", CFSTR("presenting"));
  v3 = (id)objc_msgSend(v2, "onWillEnter:", &__block_literal_global_36);
  v4 = (id)objc_msgSend(v2, "onWillExit:", &__block_literal_global_38);
  return v2;
}

void __49__SXQuickLookComponentView_createPresentingState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
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
  id v32;
  _QWORD v33[4];
  id v34;

  v4 = a3;
  objc_msgSend(a2, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "quickLookModule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "file");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createViewControllerWithFile:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQuickLookViewController:", v8);

  objc_msgSend(v4, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v4, "quickLookViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v11, v13, v15, v17);

  objc_msgSend(v4, "quickLookViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setHidden:", 1);

  objc_msgSend(v4, "presentationDelegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "presentingContentViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "quickLookViewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addChildViewController:", v24);

  objc_msgSend(v4, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "quickLookViewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addSubview:", v27);

  objc_msgSend(v4, "quickLookViewController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentationDelegate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "presentingContentViewController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "didMoveToParentViewController:", v30);

  v31 = (void *)MEMORY[0x24BDF6F90];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __49__SXQuickLookComponentView_createPresentingState__block_invoke_2;
  v33[3] = &unk_24D6874A8;
  v34 = v4;
  v32 = v4;
  objc_msgSend(v31, "animateWithDuration:animations:", v33, 0.15);

}

void __49__SXQuickLookComponentView_createPresentingState__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "quickLookViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHidden:", 0);

}

void __49__SXQuickLookComponentView_createPresentingState__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDF6F90];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__SXQuickLookComponentView_createPresentingState__block_invoke_4;
  v6[3] = &unk_24D6874A8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "animateWithDuration:animations:", v6, 0.15);

}

void __49__SXQuickLookComponentView_createPresentingState__block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "quickLookViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHidden:", 1);

}

- (id)createErrorState
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6CF90]), "initWithName:", CFSTR("error"));
  v3 = (id)objc_msgSend(v2, "onWillEnter:", &__block_literal_global_39);
  v4 = (id)objc_msgSend(v2, "onWillExit:", &__block_literal_global_45_1);
  return v2;
}

void __44__SXQuickLookComponentView_createErrorState__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "errorLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    objc_msgSend(v15, "setErrorLabel:", v4);

    objc_msgSend(v15, "errorLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    SXBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SXTapToRetry"), &stru_24D68E0F8, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v7);

    objc_msgSend(v15, "errorLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNumberOfLines:", 2);

    objc_msgSend(v15, "errorLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextAlignment:", 1);

    objc_msgSend(v15, "errorLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sizeToFit");

    objc_msgSend(v15, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v12);

  }
  objc_msgSend(v15, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "tapGestureRecognizer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addGestureRecognizer:", v14);

  objc_msgSend(v15, "layoutErrorView");
}

void __44__SXQuickLookComponentView_createErrorState__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(v3, "errorLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  objc_msgSend(v3, "setErrorLabel:", 0);
  objc_msgSend(v3, "contentView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tapGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeGestureRecognizer:", v5);
}

- (SXQuickLookModule)quickLookModule
{
  return self->_quickLookModule;
}

- (SXQuickLookComponentFileProvider)fileProvider
{
  return self->_fileProvider;
}

- (NFStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (NFStateMachineState)idleState
{
  return self->_idleState;
}

- (NFStateMachineState)loadingState
{
  return self->_loadingState;
}

- (NFStateMachineState)presentingState
{
  return self->_presentingState;
}

- (NFStateMachineState)errorState
{
  return self->_errorState;
}

- (UIActivityIndicatorView)loadingIndicator
{
  return self->_loadingIndicator;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (UILabel)errorLabel
{
  return self->_errorLabel;
}

- (void)setErrorLabel:(id)a3
{
  objc_storeStrong((id *)&self->_errorLabel, a3);
}

- (SXQuickLookViewController)quickLookViewController
{
  return self->_quickLookViewController;
}

- (void)setQuickLookViewController:(id)a3
{
  objc_storeStrong((id *)&self->_quickLookViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quickLookViewController, 0);
  objc_storeStrong((id *)&self->_errorLabel, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_loadingIndicator, 0);
  objc_storeStrong((id *)&self->_errorState, 0);
  objc_storeStrong((id *)&self->_presentingState, 0);
  objc_storeStrong((id *)&self->_loadingState, 0);
  objc_storeStrong((id *)&self->_idleState, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_fileProvider, 0);
  objc_storeStrong((id *)&self->_quickLookModule, 0);
}

@end
