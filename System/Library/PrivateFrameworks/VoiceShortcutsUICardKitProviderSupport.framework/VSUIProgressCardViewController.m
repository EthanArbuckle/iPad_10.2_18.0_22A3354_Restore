@implementation VSUIProgressCardViewController

- (void)_setUpViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *statusViewSuccessHeightConstraint;
  void *v13;
  void *v14;
  NSLayoutConstraint *v15;
  NSLayoutConstraint *statusViewFailureHeightConstraint;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
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
  void *v39;
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
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  _QWORD v64[12];

  v64[10] = *MEMORY[0x24BDAC8D0];
  -[VSUIProgressCardViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUIProgressCardViewController _statusView](self, "_statusView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  -[VSUIProgressCardViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUIProgressCardViewController _hairlineView](self, "_hairlineView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

  -[VSUIProgressCardViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUIProgressCardViewController _loadingIndicatorView](self, "_loadingIndicatorView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  -[VSUIProgressCardViewController _statusView](self, "_statusView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "heightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToConstant:", 40.0);
  v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  statusViewSuccessHeightConstraint = self->_statusViewSuccessHeightConstraint;
  self->_statusViewSuccessHeightConstraint = v11;

  -[VSUIProgressCardViewController _statusView](self, "_statusView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "heightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintLessThanOrEqualToConstant:", 70.0);
  v15 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  statusViewFailureHeightConstraint = self->_statusViewFailureHeightConstraint;
  self->_statusViewFailureHeightConstraint = v15;

  v44 = (void *)MEMORY[0x24BDD1628];
  v64[0] = self->_statusViewSuccessHeightConstraint;
  -[VSUIProgressCardViewController _statusView](self, "_statusView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "leftAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUIProgressCardViewController view](self, "view");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "leftAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:", v60);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v59;
  -[VSUIProgressCardViewController _statusView](self, "_statusView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "rightAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUIProgressCardViewController view](self, "view");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "rightAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:", v55);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v64[2] = v54;
  -[VSUIProgressCardViewController _statusView](self, "_statusView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "bottomAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUIProgressCardViewController view](self, "view");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "bottomAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v50);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v64[3] = v49;
  -[VSUIProgressCardViewController _hairlineView](self, "_hairlineView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "heightAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToConstant:", 1.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v64[4] = v46;
  -[VSUIProgressCardViewController _hairlineView](self, "_hairlineView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "leftAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUIProgressCardViewController view](self, "view");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "leftAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v64[5] = v40;
  -[VSUIProgressCardViewController _hairlineView](self, "_hairlineView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "rightAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUIProgressCardViewController view](self, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "rightAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v64[6] = v35;
  -[VSUIProgressCardViewController _hairlineView](self, "_hairlineView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUIProgressCardViewController _statusView](self, "_statusView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v64[7] = v30;
  -[VSUIProgressCardViewController _loadingIndicatorView](self, "_loadingIndicatorView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "centerXAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUIProgressCardViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "centerXAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v64[8] = v19;
  -[VSUIProgressCardViewController _loadingIndicatorView](self, "_loadingIndicatorView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUIProgressCardViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUIProgressCardViewController _loadingIndicatorView](self, "_loadingIndicatorView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bounds");
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v23, (98.0 - v25) * 0.5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v64[9] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v64, 10);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "activateConstraints:", v27);

}

- (void)_setUpHelpers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x24BDAC8D0];
  -[VSUIProgressCardViewController _progressStateMachine](self, "_progressStateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSUIProgressCardViewController _progressIndicatorViewController](self, "_progressIndicatorViewController", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  -[VSUIProgressCardViewController _statusView](self, "_statusView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObservers:", v6);

}

- (void)_updateDelegateOnBoundsDidChange
{
  id v3;

  -[VSUIProgressCardViewController cardViewControllerDelegate](self, "cardViewControllerDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cardViewControllerBoundsDidChange:", self);

}

- (SUICProgressStateMachine)_progressStateMachine
{
  SUICProgressStateMachine *progressStateMachine;
  SUICProgressStateMachine *v4;
  SUICProgressStateMachine *v5;

  progressStateMachine = self->_progressStateMachine;
  if (!progressStateMachine)
  {
    v4 = (SUICProgressStateMachine *)objc_opt_new();
    v5 = self->_progressStateMachine;
    self->_progressStateMachine = v4;

    progressStateMachine = self->_progressStateMachine;
  }
  return progressStateMachine;
}

- (SUICProgressIndicatorViewController)_progressIndicatorViewController
{
  SUICProgressIndicatorViewController *progressIndicatorViewController;
  void *v4;
  SUICProgressIndicatorViewController *v5;

  progressIndicatorViewController = self->_progressIndicatorViewController;
  if (!progressIndicatorViewController)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setDataSource:", self);
    -[VSUIProgressCardViewController addChildViewController:](self, "addChildViewController:", v4);
    v5 = self->_progressIndicatorViewController;
    self->_progressIndicatorViewController = (SUICProgressIndicatorViewController *)v4;

    progressIndicatorViewController = self->_progressIndicatorViewController;
  }
  return progressIndicatorViewController;
}

- (UIView)_hairlineView
{
  UIView *hairlineView;
  UIView *v4;
  void *v5;
  UIView *v6;

  hairlineView = self->_hairlineView;
  if (!hairlineView)
  {
    v4 = (UIView *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[UIView setAlpha:](v4, "setAlpha:", 0.04);
    -[UIView setHidden:](v4, "setHidden:", 1);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = self->_hairlineView;
    self->_hairlineView = v4;

    hairlineView = self->_hairlineView;
  }
  return hairlineView;
}

- (VSUIActionStatusView)_statusView
{
  VSUIActionStatusView *statusView;
  VSUIActionStatusView *v4;
  VSUIActionStatusView *v5;

  statusView = self->_statusView;
  if (!statusView)
  {
    v4 = (VSUIActionStatusView *)objc_opt_new();
    -[VSUIActionStatusView setDelegate:](v4, "setDelegate:", self);
    -[VSUIActionStatusView setHidden:](v4, "setHidden:", 1);
    -[VSUIActionStatusView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = self->_statusView;
    self->_statusView = v4;

    statusView = self->_statusView;
  }
  return statusView;
}

- (UIActivityIndicatorView)_loadingIndicatorView
{
  UIActivityIndicatorView *loadingIndicatorView;
  UIActivityIndicatorView *v4;
  UIActivityIndicatorView *v5;

  loadingIndicatorView = self->_loadingIndicatorView;
  if (!loadingIndicatorView)
  {
    v4 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
    -[UIActivityIndicatorView startAnimating](v4, "startAnimating");
    -[UIActivityIndicatorView setHidesWhenStopped:](v4, "setHidesWhenStopped:", 1);
    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v5 = self->_loadingIndicatorView;
    self->_loadingIndicatorView = v4;

    loadingIndicatorView = self->_loadingIndicatorView;
  }
  return loadingIndicatorView;
}

- (void)actionStatusView:(id)a3 didAddViewFromProgressViewController:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  -[VSUIProgressCardViewController _progressIndicatorViewController](self, "_progressIndicatorViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
  {
    -[VSUIProgressCardViewController _progressIndicatorViewController](self, "_progressIndicatorViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didMoveToParentViewController:", self);

  }
}

- (void)progressStateMachine:(id)a3 didTransitionToState:(unint64_t)a4 fromState:(unint64_t)a5 forEvent:(unint64_t)a6
{
  uint64_t v7;
  void (**v8)(_QWORD);
  void *v9;
  _QWORD v10[5];
  void (**v11)(_QWORD);
  _QWORD v12[6];

  v7 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __95__VSUIProgressCardViewController_progressStateMachine_didTransitionToState_fromState_forEvent___block_invoke;
  v12[3] = &unk_24E716FC0;
  v12[4] = self;
  v12[5] = a6;
  v8 = (void (**)(_QWORD))MEMORY[0x22766D844](v12, a2, a3, a4, a5);
  v9 = v8;
  if (self->_animatesStateTransitions)
  {
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __95__VSUIProgressCardViewController_progressStateMachine_didTransitionToState_fromState_forEvent___block_invoke_2;
    v10[3] = &unk_24E716FE8;
    v10[4] = self;
    v11 = v8;
    dispatch_async(MEMORY[0x24BDAC9B8], v10);

  }
  else
  {
    v8[2](v8);
  }

}

void __95__VSUIProgressCardViewController_progressStateMachine_didTransitionToState_fromState_forEvent___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v2 = *(_QWORD *)(a1 + 40);
  switch(v2)
  {
    case 0:
      goto LABEL_4;
    case 3:
      objc_msgSend(*(id *)(a1 + 32), "_statusView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setHidden:", 0);

      objc_msgSend(*(id *)(a1 + 32), "_hairlineView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setHidden:", 0);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "setActive:", 1);
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 1080;
      break;
    case 2:
LABEL_4:
      objc_msgSend(*(id *)(a1 + 32), "_statusView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setHidden:", 0);

      objc_msgSend(*(id *)(a1 + 32), "_hairlineView");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setHidden:", 0);

      return;
    default:
      objc_msgSend(*(id *)(a1 + 32), "_statusView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setHidden:", 0);

      objc_msgSend(*(id *)(a1 + 32), "_hairlineView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHidden:", 0);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "setActive:", 1);
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 1088;
      break;
  }
  objc_msgSend(*(id *)(v6 + v7), "setActive:", 0);
}

uint64_t __95__VSUIProgressCardViewController_progressStateMachine_didTransitionToState_fromState_forEvent___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_updateDelegateOnBoundsDidChange");
}

- (CGSize)preferredContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGSize result;

  v8.receiver = self;
  v8.super_class = (Class)VSUIProgressCardViewController;
  -[VSUIProgressCardViewController preferredContentSize](&v8, sel_preferredContentSize);
  v4 = v3;
  -[VSUIProgressCardViewController contentHeightForWidth:](self, "contentHeightForWidth:");
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)_initWithCard:(id)a3 delegate:(id)a4 loadProvidersImmediately:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  _QWORD *v9;
  id v10;
  void *v11;
  objc_super v13;

  v5 = a5;
  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VSUIProgressCardViewController;
  v9 = -[VSUIProgressCardViewController _initWithCard:delegate:loadProvidersImmediately:](&v13, sel__initWithCard_delegate_loadProvidersImmediately_, v8, a4, v5);
  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x24BDD1768]);
    v11 = (void *)v9[133];
    v9[133] = v10;

    *((_BYTE *)v9 + 1072) = 1;
    *((_BYTE *)v9 + 1073) = objc_msgSend(v8, "asynchronous");
    objc_msgSend(v9, "_setUpViews");
    objc_msgSend(v9, "_setUpHelpers");
  }

  return v9;
}

- (void)cardSectionViewWillAppearForCardSection:(id)a3 withAppearanceFeedback:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;

  v16 = a3;
  if ((-[VSUIProgressCardViewController isLoading](self, "isLoading") & 1) == 0)
  {
    -[VSUIProgressCardViewController _loadingIndicatorView](self, "_loadingIndicatorView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopAnimating");

  }
  v6 = v16;
  if (self->_hasAsynchronousCard)
  {
    -[VSUIProgressCardViewController cardSectionViewSource](self, "cardSectionViewSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewConfigurationForCardSection:", v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cardSectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setAlpha:", 0.0);
    -[VSUIProgressCardViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v12 = v11;
    v14 = v13;

    objc_msgSend(v9, "sizeThatFits:", v12, v14);
    objc_msgSend(v9, "setFrame:", 0.0, 0.0, v12, v15);

    v6 = v16;
  }

}

- (void)cardSectionViewDidAppearForCardSection:(id)a3 withAppearanceFeedback:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  if (self->_hasAsynchronousCard)
  {
    v5 = a3;
    -[VSUIProgressCardViewController cardSectionViewSource](self, "cardSectionViewSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewConfigurationForCardSection:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "cardSectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x24BDF6F90];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __96__VSUIProgressCardViewController_cardSectionViewDidAppearForCardSection_withAppearanceFeedback___block_invoke;
    v11[3] = &unk_24E717010;
    v12 = v8;
    v10 = v8;
    objc_msgSend(v9, "animateWithDuration:animations:", v11, 0.300000012);

  }
}

uint64_t __96__VSUIProgressCardViewController_cardSectionViewDidAppearForCardSection_withAppearanceFeedback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (double)contentHeightForWidth:(double)a3
{
  double v5;
  double v6;
  void *v7;
  char v8;
  double result;
  void *v10;
  double v11;
  double v12;
  _BOOL4 v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)VSUIProgressCardViewController;
  -[VSUIProgressCardViewController contentHeightForWidth:](&v15, sel_contentHeightForWidth_);
  v6 = v5;
  -[VSUIProgressCardViewController _statusView](self, "_statusView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isHidden");

  result = v6;
  if ((v8 & 1) == 0)
  {
    -[VSUIProgressCardViewController _statusView](self, "_statusView", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sizeThatFits:", a3, 2.22507386e-308);
    v12 = v11;

    v13 = -[NSLayoutConstraint isActive](self->_statusViewFailureHeightConstraint, "isActive");
    v14 = 40.0;
    if (v13)
      v14 = 70.0;
    if (v14 < v12)
      v14 = v12;
    result = v6 + v14;
  }
  if (v6 == 0.0)
    return result + 98.0;
  return result;
}

- (void)handleCardCommand:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSProgress *v9;
  NSProgress *progress;
  unint64_t v11;
  uint64_t v12;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6;
    self->_animatesStateTransitions = objc_msgSend(v8, "animatesProgress");
    objc_msgSend(v8, "progress");
    v9 = (NSProgress *)objc_claimAutoreleasedReturnValue();
    progress = self->_progress;
    self->_progress = v9;

    v11 = objc_msgSend(v8, "event");
    if (v11 >= 5)
      v12 = -1;
    else
      v12 = v11;
    -[SUICProgressStateMachine handleEvent:](self->_progressStateMachine, "handleEvent:", v12);
    if (v7)
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)VSUIProgressCardViewController;
    -[VSUIProgressCardViewController handleCardCommand:reply:](&v13, sel_handleCardCommand_reply_, v6, v7);
  }

}

- (BOOL)shouldAnimateTransitionToState:(unint64_t)a3 fromState:(unint64_t)a4 forProgressIndicatorViewController:(id)a5
{
  return self->_animatesStateTransitions;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)_setStatusView:(id)a3
{
  objc_storeStrong((id *)&self->_statusView, a3);
}

- (void)_setLoadingIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_loadingIndicatorView, a3);
}

- (void)_setProgressIndicatorViewController:(id)a3
{
  objc_storeStrong((id *)&self->_progressIndicatorViewController, a3);
}

- (void)_setHairlineView:(id)a3
{
  objc_storeStrong((id *)&self->_hairlineView, a3);
}

- (void)_setProgressStateMachine:(id)a3
{
  objc_storeStrong((id *)&self->_progressStateMachine, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressStateMachine, 0);
  objc_storeStrong((id *)&self->_hairlineView, 0);
  objc_storeStrong((id *)&self->_progressIndicatorViewController, 0);
  objc_storeStrong((id *)&self->_loadingIndicatorView, 0);
  objc_storeStrong((id *)&self->_statusView, 0);
  objc_storeStrong((id *)&self->_statusViewFailureHeightConstraint, 0);
  objc_storeStrong((id *)&self->_statusViewSuccessHeightConstraint, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

@end
