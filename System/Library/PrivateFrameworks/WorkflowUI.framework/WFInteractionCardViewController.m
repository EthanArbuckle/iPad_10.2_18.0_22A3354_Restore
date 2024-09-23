@implementation WFInteractionCardViewController

- (WFInteractionCardViewController)initWithInteraction:(id)a3
{
  id v6;
  WFInteractionCardViewController *v7;
  WFInteractionCardViewController *v8;
  uint64_t v9;
  WFCompactUnlockService *unlockService;
  WFInteractionCardViewController *v11;
  void *v13;
  objc_super v14;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFInteractionCardViewController.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interaction"));

  }
  v14.receiver = self;
  v14.super_class = (Class)WFInteractionCardViewController;
  v7 = -[WFInteractionCardViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_interaction, a3);
    v9 = objc_opt_new();
    unlockService = v8->_unlockService;
    v8->_unlockService = (WFCompactUnlockService *)v9;

    softLinkAPUIRegisterCardServicesIfNeeded();
    softLinkAPUIRegisterCardKitProvidersIfNeeded();
    v11 = v8;
  }

  return v8;
}

- (void)loadView
{
  void *v3;
  void *v4;
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
  void *v15;
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)WFInteractionCardViewController;
  -[WFInteractionCardViewController loadView](&v16, sel_loadView);
  -[WFInteractionCardViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClipsToBounds:", 1);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[WFInteractionCardViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v4);

  objc_msgSend(v4, "startAnimating");
  -[WFInteractionCardViewController setActivityIndicatorView:](self, "setActivityIndicatorView:", v4);
  v15 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v4, "centerXAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFInteractionCardViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "centerXAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  objc_msgSend(v4, "centerYAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFInteractionCardViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "centerYAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activateConstraints:", v14);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFInteractionCardViewController;
  -[WFInteractionCardViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[WFInteractionCardViewController unlockService](self, "unlockService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__WFInteractionCardViewController_viewDidAppear___block_invoke;
  v5[3] = &unk_24E604C20;
  v5[4] = self;
  objc_msgSend(v4, "requestUnlockIfNeeded:", v5);

}

- (id)cardRequestForInteraction:(id)a3
{
  Class (__cdecl *v3)();
  id v4;
  id v5;
  void *v6;

  v3 = (Class (__cdecl *)())getAPUIActionCardViewConfigClass;
  v4 = a3;
  v5 = objc_alloc_init(v3());
  objc_msgSend(v5, "setStyle:", 0);
  objc_msgSend(v5, "setShowThumbnailImage:", 1);
  objc_msgSend(v5, "setShowActionButton:", 0);
  objc_msgSend(v5, "setShowAppFootnote:", 0);
  v6 = (void *)objc_msgSend(objc_alloc(getAPUIActionCardRequestClass()), "initWithCardViewConfig:", v5);
  objc_msgSend(v6, "setFormat:", 1);
  objc_msgSend(v6, "setContent:", v4);

  objc_msgSend(v6, "setLoadsBundleServices:", 0);
  return v6;
}

- (id)cardViewController
{
  void *v2;
  void *v3;

  -[WFInteractionCardViewController cardPresentation](self, "cardPresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cardViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updateWithInteraction:(id)a3
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFInteractionCardViewController.m"), 179, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interaction"));

  }
  objc_storeStrong((id *)&self->_interaction, a3);
  -[WFInteractionCardViewController cardRequestForInteraction:](self, "cardRequestForInteraction:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  getWFDialogLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v12 = "-[WFInteractionCardViewController updateWithInteraction:]";
    v13 = 2112;
    v14 = v7;
    v15 = 2114;
    v16 = v6;
    _os_log_impl(&dword_22007E000, v8, OS_LOG_TYPE_DEFAULT, "%s Updating existing card; sending CardKit request: %@, for interaction: %{public}@",
      buf,
      0x20u);
  }

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__WFInteractionCardViewController_updateWithInteraction___block_invoke;
  v10[3] = &unk_24E603678;
  v10[4] = self;
  objc_msgSend(v7, "startWithReply:", v10);

}

- (double)contentHeightForWidth:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;

  -[WFInteractionCardViewController cardViewController](self, "cardViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 98.0;
  -[WFInteractionCardViewController cardViewController](self, "cardViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentHeightForWidth:", a3);
  v8 = v7;

  return v8;
}

- (void)updateCardViewSize
{
  id v3;

  -[WFInteractionCardViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "interactionCardViewControllerDidInvalidateSize:", self);

}

- (void)cardViewControllerDidLoad:(id)a3
{
  void *v4;

  -[WFInteractionCardViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interactionCardViewControllerDidLoad:", self);

  -[WFInteractionCardViewController updateCardViewSize](self, "updateCardViewSize");
}

- (void)buttonOverlayWasTouchedUpInside:(id)a3
{
  id v4;
  void *v5;
  dispatch_time_t v6;
  id v7;
  _QWORD block[4];
  id v9;

  v4 = a3;
  -[WFInteractionCardViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "interactionCardViewControllerDidRequestPunchout:", self);

  v6 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__WFInteractionCardViewController_buttonOverlayWasTouchedUpInside___block_invoke;
  block[3] = &unk_24E604D88;
  v9 = v4;
  v7 = v4;
  dispatch_after(v6, MEMORY[0x24BDAC9B8], block);

}

- (void)buttonOverlayWasTouchedUpOutside:(id)a3
{
  objc_msgSend(a3, "setSelected:animated:", 0, 1);
}

- (void)buttonOverlayWasTouchedDown:(id)a3
{
  objc_msgSend(a3, "setSelected:", 1);
}

- (void)buttonOverlayTouchWasCancelled:(id)a3
{
  objc_msgSend(a3, "setSelected:", 0);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (INInteraction)interaction
{
  return self->_interaction;
}

- (WFInteractionCardViewControllerDelegate)delegate
{
  return (WFInteractionCardViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CRKCardPresentation)cardPresentation
{
  return self->_cardPresentation;
}

- (void)setCardPresentation:(id)a3
{
  objc_storeStrong((id *)&self->_cardPresentation, a3);
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return (UIActivityIndicatorView *)objc_loadWeakRetained((id *)&self->_activityIndicatorView);
}

- (void)setActivityIndicatorView:(id)a3
{
  objc_storeWeak((id *)&self->_activityIndicatorView, a3);
}

- (WFCompactUnlockService)unlockService
{
  return self->_unlockService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unlockService, 0);
  objc_destroyWeak((id *)&self->_activityIndicatorView);
  objc_storeStrong((id *)&self->_cardPresentation, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_interaction, 0);
}

uint64_t __67__WFInteractionCardViewController_buttonOverlayWasTouchedUpInside___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSelected:animated:", 0, 1);
}

void __57__WFInteractionCardViewController_updateWithInteraction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  getWFDialogLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v12 = "-[WFInteractionCardViewController updateWithInteraction:]_block_invoke";
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_22007E000, v7, OS_LOG_TYPE_DEFAULT, "%s Received CardKit response: %@, error: %@", buf, 0x20u);
  }

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__WFInteractionCardViewController_updateWithInteraction___block_invoke_28;
  v9[3] = &unk_24E604E80;
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

}

void __57__WFInteractionCardViewController_updateWithInteraction___block_invoke_28(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "card");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCard:", v2);

}

void __49__WFInteractionCardViewController_viewDidAppear___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "interaction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cardRequestForInteraction:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    getWFDialogLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "interaction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v15 = "-[WFInteractionCardViewController viewDidAppear:]_block_invoke";
      v16 = 2112;
      v17 = v5;
      v18 = 2114;
      v19 = v7;
      _os_log_impl(&dword_22007E000, v6, OS_LOG_TYPE_DEFAULT, "%s Created card request: %@, for interaction: %{public}@", buf, 0x20u);

    }
    v8 = objc_alloc_init(getCRKCardPresentationClass());
    objc_msgSend(v8, "setDelegate:", *(_QWORD *)(a1 + 32));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 984), v8);
    v9 = (void *)objc_msgSend(objc_alloc(getCRKCardPresentationConfigurationClass()), "initWithCardRequest:", v5);
    objc_msgSend(v9, "setRespectsUserConsent:", 0);
    objc_msgSend(v9, "setLoadsBundleProviders:", 0);
    getWFDialogLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[WFInteractionCardViewController viewDidAppear:]_block_invoke";
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_22007E000, v10, OS_LOG_TYPE_DEFAULT, "%s Setting CRKCardPresentation configuration to: %@", buf, 0x16u);
    }

    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __49__WFInteractionCardViewController_viewDidAppear___block_invoke_14;
    v12[3] = &unk_24E604A10;
    objc_copyWeak(&v13, (id *)buf);
    objc_msgSend(v8, "setConfiguration:animated:completion:", v9, 0, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "interactionCardViewControllerDidRequestCancel:", *(_QWORD *)(a1 + 32));

  }
}

void __49__WFInteractionCardViewController_viewDidAppear___block_invoke_14(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (v4
    || (objc_msgSend(WeakRetained, "cardViewController"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
    getWFDialogLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[WFInteractionCardViewController viewDidAppear:]_block_invoke";
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_22007E000, v7, OS_LOG_TYPE_FAULT, "%s Failed to create a CardKit card: %@", buf, 0x16u);
    }

  }
  else
  {
    getWFDialogLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[WFInteractionCardViewController viewDidAppear:]_block_invoke";
      _os_log_impl(&dword_22007E000, v9, OS_LOG_TYPE_DEFAULT, "%s Finished configuring CRKCardPresentation, installing card view", buf, 0xCu);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49__WFInteractionCardViewController_viewDidAppear___block_invoke_15;
    block[3] = &unk_24E604D88;
    block[4] = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

void __49__WFInteractionCardViewController_viewDidAppear___block_invoke_15(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "cardViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addChildViewController:", v2);
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v3);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "wf_addConstraintsToFillSuperview:", v5);

  objc_msgSend(v2, "didMoveToParentViewController:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "activityIndicatorView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "updateCardViewSize");
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.100000001);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(getCRKOverlayButtonClass());
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "setBackgroundColor:forState:", v8, 1);
  objc_msgSend(v9, "setBackgroundColor:forState:", v8, 4);
  objc_msgSend(v9, "setBackgroundColor:forState:", v8, 5);
  objc_msgSend(v9, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel_buttonOverlayWasTouchedUpInside_, 64);
  objc_msgSend(v9, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel_buttonOverlayWasTouchedUpOutside_, 128);
  objc_msgSend(v9, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel_buttonOverlayWasTouchedDown_, 1);
  objc_msgSend(v9, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel_buttonOverlayTouchWasCancelled_, 256);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v9);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v9, "wf_addConstraintsToFillSuperview:", v11);

  v13 = (void *)MEMORY[0x24BEBDB00];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __49__WFInteractionCardViewController_viewDidAppear___block_invoke_2;
  v15[3] = &unk_24E604D88;
  v16 = v3;
  v14 = v3;
  objc_msgSend(v13, "animateWithDuration:animations:", v15, 0.300000012);

}

uint64_t __49__WFInteractionCardViewController_viewDidAppear___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

+ (void)initialize
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__WFInteractionCardViewController_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, block);
}

void __45__WFInteractionCardViewController_initialize__block_invoke(uint64_t a1)
{
  objc_class *v1;
  Protocol *v2;

  v1 = *(objc_class **)(a1 + 32);
  getCRKCardViewControllerDelegateProtocol();
  v2 = (Protocol *)objc_claimAutoreleasedReturnValue();
  class_addProtocol(v1, v2);

}

@end
