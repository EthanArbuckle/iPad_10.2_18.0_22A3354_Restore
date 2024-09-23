@implementation SXQuickLookViewController

- (SXQuickLookViewController)initWithEventHandler:(id)a3 renderer:(id)a4
{
  id v7;
  id v8;
  SXQuickLookViewController *v9;
  SXQuickLookViewController *v10;
  UIButton *v11;
  UIButton *thumbnailControl;
  UILabel *v13;
  UILabel *errorLabel;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SXQuickLookViewController;
  v9 = -[SXQuickLookViewController initWithNibName:bundle:](&v16, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eventHandler, a3);
    objc_storeStrong((id *)&v10->_renderer, a4);
    v11 = (UIButton *)objc_alloc_init(MEMORY[0x24BDF6880]);
    thumbnailControl = v10->_thumbnailControl;
    v10->_thumbnailControl = v11;

    -[UIButton addTarget:action:forControlEvents:](v10->_thumbnailControl, "addTarget:action:forControlEvents:", v10, sel_handleTap, 64);
    -[UIButton setHidden:](v10->_thumbnailControl, "setHidden:", 1);
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
    errorLabel = v10->_errorLabel;
    v10->_errorLabel = v13;

    -[SXQuickLookViewController configureStateMachine](v10, "configureStateMachine");
  }

  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SXQuickLookViewController;
  -[SXQuickLookViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[SXQuickLookViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXQuickLookViewController thumbnailControl](self, "thumbnailControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXQuickLookViewController;
  -[SXQuickLookViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[SXQuickLookViewController stateMachine](self, "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "fireEventWithName:withContext:", CFSTR("reload"), 0);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  id v4;
  SXQuickLookLayoutAttributes *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  SXQuickLookLayoutAttributes *v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)SXQuickLookViewController;
  -[SXQuickLookViewController viewDidLayoutSubviews](&v22, sel_viewDidLayoutSubviews);
  -[SXQuickLookViewController stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "fireEventWithName:withContext:", CFSTR("reload"), 0);

  v5 = [SXQuickLookLayoutAttributes alloc];
  -[SXQuickLookViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[SXQuickLookViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v20 = -[SXQuickLookLayoutAttributes initWithThumbnailFrame:errorLabelFrame:](v5, "initWithThumbnailFrame:errorLabelFrame:", v8, v10, v12, v14, v16, v17, v18, v19);

  -[SXQuickLookViewController renderer](self, "renderer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "render:attributes:", self, v20);

}

- (void)configureStateMachine
{
  NFStateMachineState *v3;
  NFStateMachineState *loadingState;
  NFStateMachineState *v5;
  NFStateMachineState *presentingState;
  NFStateMachineState *v7;
  NFStateMachineState *errorState;
  NFStateMachine *v9;
  NFStateMachine *stateMachine;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;

  v40 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE6CF90]), "initWithName:", CFSTR("idle"));
  -[SXQuickLookViewController createLoadingState](self, "createLoadingState");
  v3 = (NFStateMachineState *)objc_claimAutoreleasedReturnValue();
  loadingState = self->_loadingState;
  self->_loadingState = v3;

  -[SXQuickLookViewController createPresentingState](self, "createPresentingState");
  v5 = (NFStateMachineState *)objc_claimAutoreleasedReturnValue();
  presentingState = self->_presentingState;
  self->_presentingState = v5;

  -[SXQuickLookViewController createErrorState](self, "createErrorState");
  v7 = (NFStateMachineState *)objc_claimAutoreleasedReturnValue();
  errorState = self->_errorState;
  self->_errorState = v7;

  v9 = (NFStateMachine *)objc_msgSend(objc_alloc(MEMORY[0x24BE6CF80]), "initWithState:withOwner:", v40, self);
  stateMachine = self->_stateMachine;
  self->_stateMachine = v9;

  -[SXQuickLookViewController stateMachine](self, "stateMachine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXQuickLookViewController loadingState](self, "loadingState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addState:", v12);

  -[SXQuickLookViewController stateMachine](self, "stateMachine");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXQuickLookViewController presentingState](self, "presentingState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addState:", v14);

  -[SXQuickLookViewController stateMachine](self, "stateMachine");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXQuickLookViewController errorState](self, "errorState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addState:", v16);

  v17 = objc_alloc(MEMORY[0x24BE6CF88]);
  v18 = (void *)MEMORY[0x24BDBCF20];
  -[SXQuickLookViewController presentingState](self, "presentingState");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXQuickLookViewController errorState](self, "errorState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithObjects:", v40, v19, v20, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXQuickLookViewController loadingState](self, "loadingState");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v17, "initWithName:transitionFromStates:toState:", CFSTR("reload"), v21, v22);

  v24 = objc_alloc(MEMORY[0x24BE6CF88]);
  v25 = (void *)MEMORY[0x24BDBCF20];
  -[SXQuickLookViewController loadingState](self, "loadingState");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setWithObjects:", v26, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXQuickLookViewController presentingState](self, "presentingState");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v24, "initWithName:transitionFromStates:toState:", CFSTR("present"), v27, v28);

  v30 = objc_alloc(MEMORY[0x24BE6CF88]);
  v31 = (void *)MEMORY[0x24BDBCF20];
  -[SXQuickLookViewController loadingState](self, "loadingState");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setWithObjects:", v32, 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXQuickLookViewController errorState](self, "errorState");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v30, "initWithName:transitionFromStates:toState:", CFSTR("error"), v33, v34);

  -[SXQuickLookViewController stateMachine](self, "stateMachine");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addEvent:", v23);

  -[SXQuickLookViewController stateMachine](self, "stateMachine");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addEvent:", v29);

  -[SXQuickLookViewController stateMachine](self, "stateMachine");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "addEvent:", v35);

  -[SXQuickLookViewController stateMachine](self, "stateMachine");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "activate");

}

- (id)createLoadingState
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6CF90]), "initWithName:", CFSTR("loading"));
  v3 = (id)objc_msgSend(v2, "onCanTry:", &__block_literal_global_99);
  v4 = (id)objc_msgSend(v2, "onWillEnter:", &__block_literal_global_25);
  return v2;
}

BOOL __47__SXQuickLookViewController_createLoadingState__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  _BOOL8 v12;

  v3 = a3;
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v3, "thumbnailControl");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "frame");
  v12 = v8 != v11 || v6 != v10;

  return v12;
}

void __47__SXQuickLookViewController_createLoadingState__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  id v7;

  v3 = a3;
  objc_msgSend(v3, "eventHandler");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "bounds");
  objc_msgSend(v7, "requestThumbnailWithSize:", v5, v6);

}

- (id)createPresentingState
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6CF90]), "initWithName:", CFSTR("presenting"));
  v3 = (id)objc_msgSend(v2, "onWillEnter:", &__block_literal_global_28);
  v4 = (id)objc_msgSend(v2, "onWillExit:", &__block_literal_global_31);
  return v2;
}

void __50__SXQuickLookViewController_createPresentingState__block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
  v6[2] = __50__SXQuickLookViewController_createPresentingState__block_invoke_2;
  v6[3] = &unk_24D6874A8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "animateWithDuration:animations:", v6, 0.2);

}

void __50__SXQuickLookViewController_createPresentingState__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "thumbnailControl");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHidden:", 0);

}

void __50__SXQuickLookViewController_createPresentingState__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
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
  v6[2] = __50__SXQuickLookViewController_createPresentingState__block_invoke_4;
  v6[3] = &unk_24D6874A8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "animateWithDuration:animations:", v6, 0.2);

}

void __50__SXQuickLookViewController_createPresentingState__block_invoke_4(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "thumbnailControl");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHidden:", 1);

}

- (id)createErrorState
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6CF90]), "initWithName:", CFSTR("error"));
  v3 = (id)objc_msgSend(v2, "onWillEnter:", &__block_literal_global_32_0);
  v4 = (id)objc_msgSend(v2, "onWillExit:", &__block_literal_global_33_1);
  return v2;
}

void __45__SXQuickLookViewController_createErrorState__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

  objc_msgSend(v3, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setNeedsLayout");
}

void __45__SXQuickLookViewController_createErrorState__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  objc_msgSend(a3, "errorLabel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

}

- (void)handleTap
{
  void *v3;
  id v4;

  -[SXQuickLookViewController eventHandler](self, "eventHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SXQuickLookViewController thumbnailImageView](self, "thumbnailImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didTapThumbnailView:", v3);

}

- (void)showThumbnailImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  -[SXQuickLookViewController renderer](self, "renderer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXQuickLookViewController thumbnailControl](self, "thumbnailControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "renderThumbnailImage:view:", v4, v6);

  -[SXQuickLookViewController stateMachine](self, "stateMachine");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v8, "fireEventWithName:withContext:", CFSTR("present"), 0);

}

- (void)showThumbnailErrorWithMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  -[SXQuickLookViewController renderer](self, "renderer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXQuickLookViewController errorLabel](self, "errorLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "renderErrorMessage:view:", v4, v6);

  -[SXQuickLookViewController stateMachine](self, "stateMachine");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v8, "fireEventWithName:withContext:", CFSTR("error"), 0);

}

- (SXQuickLookEventHandler)eventHandler
{
  return self->_eventHandler;
}

- (SXQuickLookRenderer)renderer
{
  return self->_renderer;
}

- (NFStateMachine)stateMachine
{
  return self->_stateMachine;
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

- (UIImageView)thumbnailImageView
{
  return self->_thumbnailImageView;
}

- (UIButton)thumbnailControl
{
  return self->_thumbnailControl;
}

- (UILabel)errorLabel
{
  return self->_errorLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorLabel, 0);
  objc_storeStrong((id *)&self->_thumbnailControl, 0);
  objc_storeStrong((id *)&self->_thumbnailImageView, 0);
  objc_storeStrong((id *)&self->_errorState, 0);
  objc_storeStrong((id *)&self->_presentingState, 0);
  objc_storeStrong((id *)&self->_loadingState, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_eventHandler, 0);
}

@end
