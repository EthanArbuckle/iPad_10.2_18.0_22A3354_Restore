@implementation PNPDoubleTapViewController

+ (id)_controllerWithType:(int64_t)a3 buttonType:(int64_t)a4 deviceType:(int64_t)a5 delegate:(id)a6
{
  id v9;
  PNPDoubleTapViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PNPDoubleTapViewController *v15;

  v9 = a6;
  v10 = [PNPDoubleTapViewController alloc];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("QUICK_SWAP_TITLE"), &stru_24F4E5CD0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("QUICK_SWAP_DESCRIPTION"), &stru_24F4E5CD0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PNPDoubleTapViewController initWithTitle:detailText:icon:](v10, "initWithTitle:detailText:icon:", v12, v14, 0);

  -[PNPWelcomeController setControllerType:buttonType:deviceType:delegate:](v15, "setControllerType:buttonType:deviceType:delegate:", a3, a4, a5, v9);
  return v15;
}

- (void)viewDidLoad
{
  void *v3;
  PNPWizardScratchpadView *v4;
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
  PNPPencilView *v15;
  void *v16;
  void *v17;
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
  id v30;
  void *v31;
  void *v32;
  void *v33;
  PNPQuickSwapEventSource *v34;
  void *v35;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)PNPDoubleTapViewController;
  -[OBBaseWelcomeController viewDidLoad](&v36, sel_viewDidLoad);
  -[PNPDoubleTapViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(PNPWizardScratchpadView);
  -[PNPWizardScratchpadView setDelegate:](v4, "setDelegate:", self);
  -[PNPWizardScratchpadView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", v4);
  -[PNPWizardScratchpadView widthAnchor](v4, "widthAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToConstant:", 448.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive:", 1);

  -[PNPWizardScratchpadView heightAnchor](v4, "heightAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToConstant:", 286.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

  -[PNPWizardScratchpadView topAnchor](v4, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  -[PNPWizardScratchpadView centerXAnchor](v4, "centerXAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerXAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  -[PNPDoubleTapViewController setScratchPadView:](self, "setScratchPadView:", v4);
  v15 = -[PNPPencilView initWithVariant:]([PNPPencilView alloc], "initWithVariant:", 0);
  -[PNPPencilView setTranslatesAutoresizingMaskIntoConstraints:](v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", v15);
  -[PNPPencilView leadingAnchor](v15, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPWizardScratchpadView leadingAnchor](v4, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  -[PNPPencilView trailingAnchor](v15, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPWizardScratchpadView trailingAnchor](v4, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  -[PNPPencilView topAnchor](v15, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPWizardScratchpadView bottomAnchor](v4, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, -20.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setActive:", 1);

  -[PNPPencilView heightAnchor](v15, "heightAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToConstant:", 100.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setActive:", 1);

  -[PNPPencilView bottomAnchor](v15, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setActive:", 1);

  -[PNPDoubleTapViewController setPencilView:](self, "setPencilView:", v15);
  v30 = objc_alloc_init(MEMORY[0x24BDF6C48]);
  -[PNPDoubleTapViewController setPencilInteraction:](self, "setPencilInteraction:", v30);

  -[PNPDoubleTapViewController pencilInteraction](self, "pencilInteraction");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setDelegate:", self);

  -[PNPDoubleTapViewController view](self, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPDoubleTapViewController pencilInteraction](self, "pencilInteraction");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addInteraction:", v33);

  v34 = objc_alloc_init(PNPQuickSwapEventSource);
  -[PNPDoubleTapViewController setQuickSwapEventSource:](self, "setQuickSwapEventSource:", v34);

  -[PNPDoubleTapViewController quickSwapEventSource](self, "quickSwapEventSource");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setEventDestination:", self);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PNPDoubleTapViewController;
  -[PNPDoubleTapViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[PNPDoubleTapViewController scratchPadView](self, "scratchPadView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepareCanvasViews");

  -[PNPDoubleTapViewController scratchPadView](self, "scratchPadView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStep:", 1);

  -[PNPDoubleTapViewController quickSwapEventSource](self, "quickSwapEventSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "play");

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PNPDoubleTapViewController;
  -[PNPDoubleTapViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[PNPDoubleTapViewController quickSwapEventSource](self, "quickSwapEventSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stop");

}

- (void)pencilInteractionDidTap:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[PNPDoubleTapViewController quickSwapEventSource](self, "quickSwapEventSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stop");

  -[PNPDoubleTapViewController pencilView](self, "pencilView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventSource:hadPencilDoubleTapped:", 0, 0);

  -[PNPDoubleTapViewController scratchPadView](self, "scratchPadView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "eventSource:hadPencilDoubleTapped:", 0, 0);

}

- (void)eventSource:(id)a3 hadPencilDoubleTapped:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  -[PNPDoubleTapViewController quickSwapEventSource](self, "quickSwapEventSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stop");

  objc_initWeak(&location, self);
  -[PNPDoubleTapViewController pencilView](self, "pencilView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __64__PNPDoubleTapViewController_eventSource_hadPencilDoubleTapped___block_invoke;
  v10[3] = &unk_24F4E5798;
  v10[4] = self;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v9, "eventSource:hadPencilDoubleTapped:", 0, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __64__PNPDoubleTapViewController_eventSource_hadPencilDoubleTapped___block_invoke(uint64_t a1)
{
  void *v2;
  PNPQuickSwapEventSource *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  if ((objc_msgSend(*(id *)(a1 + 32), "animationsCancelled") & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "scratchPadView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "eventSource:hadPencilDoubleTapped:", 0, 0);

    v3 = objc_alloc_init(PNPQuickSwapEventSource);
    objc_msgSend(WeakRetained, "setQuickSwapEventSource:", v3);

    objc_msgSend(WeakRetained, "quickSwapEventSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEventDestination:", WeakRetained);

    objc_msgSend(WeakRetained, "quickSwapEventSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "play");

  }
}

- (void)scratchPadViewHadInteractionEvent:(id)a3
{
  id v4;

  -[PNPDoubleTapViewController setAnimationsCancelled:](self, "setAnimationsCancelled:", 1);
  -[PNPDoubleTapViewController quickSwapEventSource](self, "quickSwapEventSource");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stop");

}

- (BOOL)scratchPadViewIsPlayingAnimation:(id)a3
{
  void *v3;
  char v4;

  -[PNPDoubleTapViewController quickSwapEventSource](self, "quickSwapEventSource", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPlaying");

  return v4;
}

- (PNPWizardScratchpadView)scratchPadView
{
  return self->_scratchPadView;
}

- (void)setScratchPadView:(id)a3
{
  objc_storeStrong((id *)&self->_scratchPadView, a3);
}

- (UIPencilInteraction)pencilInteraction
{
  return self->_pencilInteraction;
}

- (void)setPencilInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_pencilInteraction, a3);
}

- (PNPQuickSwapEventSource)quickSwapEventSource
{
  return self->_quickSwapEventSource;
}

- (void)setQuickSwapEventSource:(id)a3
{
  objc_storeStrong((id *)&self->_quickSwapEventSource, a3);
}

- (PNPPencilView)pencilView
{
  return self->_pencilView;
}

- (void)setPencilView:(id)a3
{
  objc_storeStrong((id *)&self->_pencilView, a3);
}

- (BOOL)animationsCancelled
{
  return self->_animationsCancelled;
}

- (void)setAnimationsCancelled:(BOOL)a3
{
  self->_animationsCancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pencilView, 0);
  objc_storeStrong((id *)&self->_quickSwapEventSource, 0);
  objc_storeStrong((id *)&self->_pencilInteraction, 0);
  objc_storeStrong((id *)&self->_scratchPadView, 0);
}

@end
