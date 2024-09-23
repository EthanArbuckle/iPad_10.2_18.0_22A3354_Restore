@implementation SLHighlightDisambiguationPillView

- (SLHighlightDisambiguationPillView)initWithAttribution:(id)a3
{
  id v5;
  SLHighlightDisambiguationPillView *v6;
  SLHighlightDisambiguationPillView *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSLayoutConstraint *transcriptButtonConstraint;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SLHighlightDisambiguationPillView;
  v6 = -[SLHighlightDisambiguationPillView init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_attribution, a3);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v7, sel__macroPillTapped);
    -[SLHighlightDisambiguationPillView addGestureRecognizer:](v7, "addGestureRecognizer:", v8);

    -[SLHighlightDisambiguationPillView _loadDisambiguationPillSlotView](v7, "_loadDisambiguationPillSlotView");
    -[SLHighlightDisambiguationPillView _loadTranscriptButton](v7, "_loadTranscriptButton");
    -[UIButton trailingAnchor](v7->_transcriptButton, "trailingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLHighlightDisambiguationPillView trailingAnchor](v7, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, -15.0);
    v11 = objc_claimAutoreleasedReturnValue();
    transcriptButtonConstraint = v7->_transcriptButtonConstraint;
    v7->_transcriptButtonConstraint = (NSLayoutConstraint *)v11;

    v13 = (void *)MEMORY[0x1E0CB3718];
    -[SLHighlightDisambiguationPillView _layoutConstraintsForIndividualContact](v7, "_layoutConstraintsForIndividualContact");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activateConstraints:", v14);

    -[SLHighlightDisambiguationPillView _loadBlurView](v7, "_loadBlurView");
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "userInterfaceIdiom");

    if (v16 == 1)
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v7);
      -[SLHighlightDisambiguationPillView setPointerInteraction:](v7, "setPointerInteraction:", v17);

      -[SLHighlightDisambiguationPillView pointerInteraction](v7, "pointerInteraction");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLHighlightDisambiguationPillView addInteraction:](v7, "addInteraction:", v18);

    }
  }

  return v7;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  NSObject *v12;
  OS_dispatch_queue *v13;
  OS_dispatch_queue *remoteRenderingQueue;
  SLDServiceProxy *v15;
  SLDServiceProxy *pillProxy;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SLHighlightDisambiguationPillView frame](self, "frame");
  v9 = v8;
  v21.receiver = self;
  v21.super_class = (Class)SLHighlightDisambiguationPillView;
  -[SLHighlightDisambiguationPillView setFrame:](&v21, sel_setFrame_, x, y, width, height);
  if (width != v9)
  {
    -[SLHighlightDisambiguationPillView frame](self, "frame");
    -[SLHighlightDisambiguationPillView setPillMaxWidth:](self, "setPillMaxWidth:", v10 + -34.0);
    if (self->_pillProxy)
    {
      -[_UISlotView _updateContent](self->_pillSlotView, "_updateContent");
    }
    else
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v11 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INTERACTIVE, 0);
      v12 = objc_claimAutoreleasedReturnValue();

      v13 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.SocialLayer.SLHighlightDisambiguationPillView.RemoteRendering", v12);
      remoteRenderingQueue = self->_remoteRenderingQueue;
      self->_remoteRenderingQueue = v13;

      +[SLDServiceProxy proxyForServiceClass:targetSerialQueue:delegate:](SLDServiceProxy, "proxyForServiceClass:targetSerialQueue:delegate:", objc_opt_class(), self->_remoteRenderingQueue, self);
      v15 = (SLDServiceProxy *)objc_claimAutoreleasedReturnValue();
      pillProxy = self->_pillProxy;
      self->_pillProxy = v15;

      objc_initWeak(&location, self);
      v17 = self->_remoteRenderingQueue;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __46__SLHighlightDisambiguationPillView_setFrame___block_invoke;
      v18[3] = &unk_1E3794220;
      objc_copyWeak(&v19, &location);
      dispatch_async(v17, v18);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);

    }
  }
}

void __46__SLHighlightDisambiguationPillView_setFrame___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "pillProxy");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "connect");

}

- (id)_layoutConstraintsForIndividualContact
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
  NSLayoutConstraint *transcriptButtonConstraint;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[8];

  v24[7] = *MEMORY[0x1E0C80C00];
  -[_UISlotView leadingAnchor](self->_pillSlotView, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLHighlightDisambiguationPillView leadingAnchor](self, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v21;
  -[_UISlotView topAnchor](self->_pillSlotView, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLHighlightDisambiguationPillView topAnchor](self, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v18;
  -[_UISlotView centerYAnchor](self->_pillSlotView, "centerYAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLHighlightDisambiguationPillView centerYAnchor](self, "centerYAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v15;
  -[UIButton centerYAnchor](self->_transcriptButton, "centerYAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLHighlightDisambiguationPillView centerYAnchor](self, "centerYAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v5;
  -[UIButton heightAnchor](self->_transcriptButton, "heightAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLHighlightDisambiguationPillView heightAnchor](self, "heightAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:multiplier:", v7, 0.53125);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v8;
  -[UIButton widthAnchor](self->_transcriptButton, "widthAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton heightAnchor](self->_transcriptButton, "heightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  transcriptButtonConstraint = self->_transcriptButtonConstraint;
  v24[5] = v11;
  v24[6] = transcriptButtonConstraint;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_loadDisambiguationPillSlotView
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc_init(MEMORY[0x1E0DC4360]);
  -[SLHighlightDisambiguationPillView setPillSlotView:](self, "setPillSlotView:", v3);

  -[SLHighlightDisambiguationPillView pillSlotView](self, "pillSlotView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[SLHighlightDisambiguationPillView pillSlotView](self, "pillSlotView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentMode:", 1);

  -[SLHighlightDisambiguationPillView pillSlotView](self, "pillSlotView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SLHighlightDisambiguationPillView addSubview:](self, "addSubview:", v6);

}

- (id)_loadButtonWithImageName:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0DC3518];
  v5 = a3;
  objc_msgSend(v4, "buttonWithType:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__transcriptButtonTapped_, 64);
  objc_msgSend(v6, "setImage:forState:", v7, 0);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v8);

  objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v9);

  objc_msgSend(v6, "setClipsToBounds:", 1);
  return v6;
}

- (void)_loadTranscriptButton
{
  UIButton *v3;
  UIButton *transcriptButton;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  UIButton *v18;
  void *v19;
  id v20;

  -[SLHighlightDisambiguationPillView _loadButtonWithImageName:](self, "_loadButtonWithImageName:", CFSTR("message.fill"));
  v3 = (UIButton *)objc_claimAutoreleasedReturnValue();
  transcriptButton = self->_transcriptButton;
  self->_transcriptButton = v3;

  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 18);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3F08], "_effectForBlurEffect:vibrancyStyle:", v20, 112);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v5);
  -[SLHighlightDisambiguationPillView setButtonEffectView:](self, "setButtonEffectView:", v6);

  -[SLHighlightDisambiguationPillView buttonEffectView](self, "buttonEffectView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClipsToBounds:", 1);

  -[SLHighlightDisambiguationPillView buttonEffectView](self, "buttonEffectView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UIButton bounds](self->_transcriptButton, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[SLHighlightDisambiguationPillView buttonEffectView](self, "buttonEffectView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

  v18 = self->_transcriptButton;
  -[SLHighlightDisambiguationPillView buttonEffectView](self, "buttonEffectView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton addSubview:](v18, "addSubview:", v19);

  -[SLHighlightDisambiguationPillView addSubview:](self, "addSubview:", self->_transcriptButton);
}

- (void)_loadBlurView
{
  id v3;
  void *v4;
  UIVisualEffectView *v5;
  UIVisualEffectView *blurView;
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
  void *v19;
  void *v20;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC3F58]);
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (UIVisualEffectView *)objc_msgSend(v3, "initWithEffect:", v4);
  blurView = self->_blurView;
  self->_blurView = v5;

  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_blurView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SLHighlightDisambiguationPillView addSubview:](self, "addSubview:", self->_blurView);
  -[SLHighlightDisambiguationPillView sendSubviewToBack:](self, "sendSubviewToBack:", self->_blurView);
  v17 = (void *)MEMORY[0x1E0CB3718];
  -[UIVisualEffectView widthAnchor](self->_blurView, "widthAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLHighlightDisambiguationPillView widthAnchor](self, "widthAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v18;
  -[UIVisualEffectView heightAnchor](self->_blurView, "heightAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLHighlightDisambiguationPillView heightAnchor](self, "heightAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v9;
  -[UIVisualEffectView centerXAnchor](self->_blurView, "centerXAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLHighlightDisambiguationPillView centerXAnchor](self, "centerXAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v12;
  -[UIVisualEffectView centerYAnchor](self->_blurView, "centerYAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLHighlightDisambiguationPillView centerYAnchor](self, "centerYAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "activateConstraints:", v16);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SLHighlightDisambiguationPillView;
  -[SLHighlightDisambiguationPillView layoutSubviews](&v8, sel_layoutSubviews);
  -[SLHighlightDisambiguationPillView frame](self, "frame");
  v4 = v3 * 0.5;
  -[SLHighlightDisambiguationPillView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", v3 * 0.5);
  -[UIVisualEffectView _setContinuousCornerRadius:](self->_blurView, "_setContinuousCornerRadius:", v4);
  -[UIButton frame](self->_transcriptButton, "frame");
  v6 = v5 * 0.5;
  -[UIButton layer](self->_transcriptButton, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerRadius:", v6);

}

- (void)_transcriptButtonTapped:(id)a3
{
  NSObject *v4;
  int v5;
  SLHighlightDisambiguationPillView *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SLFrameworkLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 134217984;
    v6 = self;
    _os_log_impl(&dword_199EFF000, v4, OS_LOG_TYPE_INFO, "[SLHighlightDisambiguationPillView %p] _transcriptButtonTapped", (uint8_t *)&v5, 0xCu);
  }

  -[SLHighlightDisambiguationPillView _presentTranscript](self, "_presentTranscript");
}

- (void)_macroPillTapped
{
  NSObject *v3;
  int v4;
  SLHighlightDisambiguationPillView *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  SLFrameworkLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 134217984;
    v5 = self;
    _os_log_impl(&dword_199EFF000, v3, OS_LOG_TYPE_INFO, "[SLHighlightDisambiguationPillView %p] _macroPillTapped", (uint8_t *)&v4, 0xCu);
  }

  -[SLHighlightDisambiguationPillView _presentTranscript](self, "_presentTranscript");
}

- (void)_presentTranscript
{
  NSObject *v3;
  SLTranscriptController *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  SLHighlightDisambiguationPillView *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  SLFrameworkLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v8 = 134217984;
    v9 = self;
    _os_log_impl(&dword_199EFF000, v3, OS_LOG_TYPE_INFO, "[SLHighlightDisambiguationPillView %p] _presentTranscript", (uint8_t *)&v8, 0xCu);
  }

  v4 = objc_alloc_init(SLTranscriptController);
  -[SLAttribution uniqueIdentifier](self->_attribution, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLAttribution attachmentGUID](self->_attribution, "attachmentGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLHighlightDisambiguationPillView _viewControllerForAncestor](self, "_viewControllerForAncestor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLTranscriptController presentTranscriptForMessageGUID:attachmentGUID:presentingViewController:](v4, "presentTranscriptForMessageGUID:attachmentGUID:presentingViewController:", v5, v6, v7);
  SLSendPortraitFeedbackTypeAppButtonForAttribution(self->_attribution);

}

- (void)serviceProxyDidConnect:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__SLHighlightDisambiguationPillView_serviceProxyDidConnect___block_invoke;
  block[3] = &unk_1E3794360;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __60__SLHighlightDisambiguationPillView_serviceProxyDidConnect___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_contentProviderForCurrentConfiguration");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pillSlotView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSlotAnyContentProvider:", v3);

}

- (id)_contentProviderForCurrentConfiguration
{
  void *v3;
  _QWORD aBlock[5];
  id v6;
  id location;

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__SLHighlightDisambiguationPillView__contentProviderForCurrentConfiguration__block_invoke;
  aBlock[3] = &unk_1E3795DA0;
  objc_copyWeak(&v6, &location);
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

void __76__SLHighlightDisambiguationPillView__contentProviderForCurrentConfiguration__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  void (**v8)(id, void *);
  id WeakRetained;
  void *v10;
  int v11;
  void *v12;
  SLDHighlightDisambiguationPillEmptySlotContent *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  _QWORD block[5];
  id v28;
  void (**v29)(id, void *);
  _QWORD *v30;
  uint64_t v31;
  _QWORD v32[5];
  id v33;

  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__13;
  v32[4] = __Block_byref_object_dispose__13;
  objc_msgSend(WeakRetained, "attribution");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uniqueIdentifier");
  v33 = (id)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(WeakRetained, "remoteContentIsLoaded");
  objc_msgSend(WeakRetained, "placeholderSlotContent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SLDHighlightDisambiguationPillEmptySlotContent initWithStyle:variant:forRemote:]([SLDHighlightDisambiguationPillEmptySlotContent alloc], "initWithStyle:variant:forRemote:", v7, objc_msgSend(WeakRetained, "pillVariant"), 0);
  objc_msgSend(WeakRetained, "setPlaceholderSlotContent:", v13);

  if (!v11)
    goto LABEL_4;
  objc_msgSend(v12, "contentSize");
  v15 = v14;
  v17 = v16;
  objc_msgSend(WeakRetained, "placeholderSlotContent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "contentSize");
  v20 = v19;
  v22 = v21;

  if (v15 != v20 || v17 != v22)
  {
LABEL_4:
    objc_msgSend(WeakRetained, "placeholderSlotContent");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v23);

  }
  objc_msgSend(WeakRetained, "pillProxy");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "connectionActive");

  if (v25)
  {
    objc_msgSend(*(id *)(a1 + 32), "remoteRenderingQueue");
    v26 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__SLHighlightDisambiguationPillView__contentProviderForCurrentConfiguration__block_invoke_28;
    block[3] = &unk_1E3795D78;
    block[4] = WeakRetained;
    v30 = v32;
    v28 = v7;
    v31 = a2;
    v29 = v8;
    dispatch_async(v26, block);

  }
  _Block_object_dispose(v32, 8);

}

void __76__SLHighlightDisambiguationPillView__contentProviderForCurrentConfiguration__block_invoke_28(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  __int128 v14;
  _QWORD v15[5];
  id v16;
  __int128 v17;

  objc_msgSend(*(id *)(a1 + 32), "pillProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "length")
    && objc_msgSend(v3, "conformsToProtocol:", &unk_1EE3993A0))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v6 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = v3;
    objc_msgSend(v6, "pillMaxWidth");
    v9 = v8;
    v10 = objc_msgSend(*(id *)(a1 + 32), "pillVariant");
    v11 = *(_QWORD *)(a1 + 64);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __76__SLHighlightDisambiguationPillView__contentProviderForCurrentConfiguration__block_invoke_2;
    v15[3] = &unk_1E3795D50;
    v12 = *(void **)(a1 + 40);
    v15[4] = *(_QWORD *)(a1 + 32);
    v16 = v12;
    v14 = *(_OWORD *)(a1 + 48);
    v13 = (id)v14;
    v17 = v14;
    objc_msgSend(v7, "highlightDisambiguationPillForAttributionIdentifier:style:maxWidth:variant:layerContextID:reply:", v4, v5, v10, v11, v15, v9);

  }
}

void __76__SLHighlightDisambiguationPillView__contentProviderForCurrentConfiguration__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD block[5];
  id v9;
  id v10;
  __int128 v11;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__SLHighlightDisambiguationPillView__contentProviderForCurrentConfiguration__block_invoke_3;
  block[3] = &unk_1E3795D28;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v4;
  v10 = v3;
  v7 = *(_OWORD *)(a1 + 48);
  v5 = (id)v7;
  v11 = v7;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __76__SLHighlightDisambiguationPillView__contentProviderForCurrentConfiguration__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  NSObject *v5;

  v2 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "lastRenderedSlotStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(v2 + 8));

  if ((v4 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setLastRenderedSlotStyle:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setRemoteContentIsLoaded:", *(_QWORD *)(a1 + 48) != 0);
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    SLFrameworkLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __76__SLHighlightDisambiguationPillView__contentProviderForCurrentConfiguration__block_invoke_3_cold_1((id *)v2, a1, v5);

  }
}

- (void)serviceProxyDidDisconnect:(id)a3
{
  -[SLHighlightDisambiguationPillView setLastRenderedSlotStyle:](self, "setLastRenderedSlotStyle:", 0);
  -[SLHighlightDisambiguationPillView setRemoteContentIsLoaded:](self, "setRemoteContentIsLoaded:", 0);
}

- (void)dealloc
{
  SLDServiceProxy *pillProxy;
  objc_super v4;

  self->_remoteContentIsLoaded = 0;
  -[SLDServiceProxy disconnect](self->_pillProxy, "disconnect");
  pillProxy = self->_pillProxy;
  self->_pillProxy = 0;

  v4.receiver = self;
  v4.super_class = (Class)SLHighlightDisambiguationPillView;
  -[SLHighlightDisambiguationPillView dealloc](&v4, sel_dealloc);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a3;
  -[SLHighlightDisambiguationPillView pointerInteraction](self, "pointerInteraction");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v8)
    v10 = v7;
  else
    v10 = 0;

  return v10;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  -[SLHighlightDisambiguationPillView pointerInteraction](self, "pointerInteraction");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
    -[SLHighlightDisambiguationPillView _continuousCornerRadius](self, "_continuousCornerRadius");
    v9 = (void *)MEMORY[0x1E0DC3508];
    -[SLHighlightDisambiguationPillView bounds](self, "bounds");
    objc_msgSend(v9, "bezierPathWithRoundedRect:cornerRadius:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setVisiblePath:", v10);

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:", self, v8);
    objc_msgSend(MEMORY[0x1E0DC3B20], "effectWithPreview:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v12, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (SLAttribution)attribution
{
  return self->_attribution;
}

- (void)setAttribution:(id)a3
{
  objc_storeStrong((id *)&self->_attribution, a3);
}

- (unint64_t)pillVariant
{
  return self->_pillVariant;
}

- (void)setPillVariant:(unint64_t)a3
{
  self->_pillVariant = a3;
}

- (OS_dispatch_queue)remoteRenderingQueue
{
  return self->_remoteRenderingQueue;
}

- (BOOL)isRTL
{
  return self->_RTL;
}

- (void)setRTL:(BOOL)a3
{
  self->_RTL = a3;
}

- (_UISlotView)pillSlotView
{
  return self->_pillSlotView;
}

- (void)setPillSlotView:(id)a3
{
  objc_storeStrong((id *)&self->_pillSlotView, a3);
}

- (SLDServiceProxy)pillProxy
{
  return self->_pillProxy;
}

- (void)setPillProxy:(id)a3
{
  objc_storeStrong((id *)&self->_pillProxy, a3);
}

- (BOOL)remoteContentIsLoaded
{
  return self->_remoteContentIsLoaded;
}

- (void)setRemoteContentIsLoaded:(BOOL)a3
{
  self->_remoteContentIsLoaded = a3;
}

- (SLDHighlightDisambiguationPillEmptySlotContent)placeholderSlotContent
{
  return self->_placeholderSlotContent;
}

- (void)setPlaceholderSlotContent:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderSlotContent, a3);
}

- (UISSlotStyle)lastRenderedSlotStyle
{
  return self->_lastRenderedSlotStyle;
}

- (void)setLastRenderedSlotStyle:(id)a3
{
  objc_storeStrong((id *)&self->_lastRenderedSlotStyle, a3);
}

- (double)pillMaxWidth
{
  return self->_pillMaxWidth;
}

- (void)setPillMaxWidth:(double)a3
{
  self->_pillMaxWidth = a3;
}

- (UIButton)transcriptButton
{
  return self->_transcriptButton;
}

- (void)setTranscriptButton:(id)a3
{
  objc_storeStrong((id *)&self->_transcriptButton, a3);
}

- (NSLayoutConstraint)transcriptButtonConstraint
{
  return self->_transcriptButtonConstraint;
}

- (void)setTranscriptButtonConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_transcriptButtonConstraint, a3);
}

- (UIVisualEffectView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_blurView, a3);
}

- (UIVisualEffectView)buttonEffectView
{
  return self->_buttonEffectView;
}

- (void)setButtonEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonEffectView, a3);
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void)setPointerInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_pointerInteraction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_buttonEffectView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_transcriptButtonConstraint, 0);
  objc_storeStrong((id *)&self->_transcriptButton, 0);
  objc_storeStrong((id *)&self->_lastRenderedSlotStyle, 0);
  objc_storeStrong((id *)&self->_placeholderSlotContent, 0);
  objc_storeStrong((id *)&self->_pillProxy, 0);
  objc_storeStrong((id *)&self->_pillSlotView, 0);
  objc_storeStrong((id *)&self->_remoteRenderingQueue, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
}

void __76__SLHighlightDisambiguationPillView__contentProviderForCurrentConfiguration__block_invoke_3_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 64) + 8) + 40);
  objc_msgSend(*a1, "pillMaxWidth");
  v7 = 134218498;
  v8 = v4;
  v9 = 2112;
  v10 = v5;
  v11 = 2048;
  v12 = v6;
  _os_log_error_impl(&dword_199EFF000, a3, OS_LOG_TYPE_ERROR, "[SLHighlightPillView: %p] sociallayerd returned nil remote content for attribution ID: [%@], maxWidth: [%f]", (uint8_t *)&v7, 0x20u);
}

@end
