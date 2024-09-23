@implementation SiriUISiriStatusView

- (SiriUISiriStatusView)initWithFrame:(CGRect)a3 screen:(id)a4 textInputEnabled:(BOOL)a5 configuration:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  id v15;
  SiriUISiriStatusView *v16;
  SiriUISiriStatusView *v17;
  id v18;
  uint64_t v19;
  UIView *touchInputView;
  UIView *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  UIView *glyphView;
  UIView *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  dispatch_queue_t v30;
  OS_dispatch_queue *glyphConfigurationQueue;
  void *v32;
  uint64_t v33;
  UILongPressGestureRecognizer *longPressRecognizer;
  id v35;
  uint64_t v36;
  UIView *flamesContainerView;
  void *v38;
  objc_super v40;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14 = a4;
  v15 = a6;
  v40.receiver = self;
  v40.super_class = (Class)SiriUISiriStatusView;
  v16 = -[SiriUISiriStatusView initWithFrame:](&v40, sel_initWithFrame_, x, y, width, height);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_screen, a4);
    objc_storeStrong((id *)&v17->_configuration, a6);
    v17->_textInputEnabled = a5;
    v18 = objc_alloc(MEMORY[0x24BDF6F90]);
    v19 = objc_msgSend(v18, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    touchInputView = v17->_touchInputView;
    v17->_touchInputView = (UIView *)v19;

    v21 = v17->_touchInputView;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v21, "setBackgroundColor:", v22);

    -[UIView layer](v17->_touchInputView, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setHitTestsAsOpaque:", 1);

    -[SiriUISiriStatusView addSubview:](v17, "addSubview:", v17->_touchInputView);
    v24 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", 0.0, 0.0, 85.0, 85.0);
    glyphView = v17->_glyphView;
    v17->_glyphView = (UIView *)v24;

    -[UIView setAlpha:](v17->_glyphView, "setAlpha:", 0.0);
    -[UIView setHidden:](v17->_glyphView, "setHidden:", v17->_textInputEnabled);
    v26 = v17->_glyphView;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v26, "setBackgroundColor:", v27);

    -[UIView layer](v17->_glyphView, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setAllowsGroupBlending:", 0);

    -[SiriUISiriStatusView insertSubview:below:](v17, "insertSubview:below:", v17->_glyphView, v17->_touchInputView);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = dispatch_queue_create("SiriUIStatusView.GlyphConfigurationQueue", v29);
    glyphConfigurationQueue = v17->_glyphConfigurationQueue;
    v17->_glyphConfigurationQueue = (OS_dispatch_queue *)v30;

    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", v17, sel__micButtonTapped_);
    objc_msgSend(v32, "setDelegate:", v17);
    -[UIView addGestureRecognizer:](v17->_touchInputView, "addGestureRecognizer:", v32);
    v33 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6BA0]), "initWithTarget:action:", v17, sel__micButtonHeld_);
    longPressRecognizer = v17->_longPressRecognizer;
    v17->_longPressRecognizer = (UILongPressGestureRecognizer *)v33;

    -[UILongPressGestureRecognizer setMinimumPressDuration:](v17->_longPressRecognizer, "setMinimumPressDuration:", 0.1);
    -[UILongPressGestureRecognizer setDelegate:](v17->_longPressRecognizer, "setDelegate:", v17);
    -[UIView addGestureRecognizer:](v17->_touchInputView, "addGestureRecognizer:", v17->_longPressRecognizer);
    v35 = objc_alloc(MEMORY[0x24BDF6F90]);
    -[SiriUISiriStatusView bounds](v17, "bounds");
    v36 = objc_msgSend(v35, "initWithFrame:");
    flamesContainerView = v17->_flamesContainerView;
    v17->_flamesContainerView = (UIView *)v36;

    -[SiriUISiriStatusView insertSubview:above:](v17, "insertSubview:above:", v17->_flamesContainerView, v17->_touchInputView);
    -[UIView setUserInteractionEnabled:](v17->_flamesContainerView, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObserver:selector:name:object:", v17, sel__handleKeyboardDidShowNotification_, *MEMORY[0x24BDF7A00], 0);
    objc_msgSend(v38, "addObserver:selector:name:object:", v17, sel__handleKeyboardWillHideNotification_, *MEMORY[0x24BDF7B78], 0);
    -[SiriUISiriStatusView setNeedsLayout](v17, "setNeedsLayout");

  }
  return v17;
}

+ (CGRect)activeFrameForScreen:(id)a3 frame:(CGRect)a4 safeAreaInsets:(UIEdgeInsets)a5
{
  CGFloat y;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect result;

  y = a4.origin.y;
  v9 = a4.origin.x + a5.left;
  v6 = v9;
  v10 = a4.size.width - (a5.left + a5.right);
  v7 = v10;
  v11 = a4.size.height - a5.bottom;
  v8 = v11;
  CGRectGetHeight(a4);
  v16.origin.x = v6;
  v16.origin.y = y;
  v16.size.width = v7;
  v16.size.height = v8;
  CGRectGetWidth(v16);
  UIRectCenteredXInRect();
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[SUICFlamesView setDelegate:](self->_flamesView, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SiriUISiriStatusView;
  -[SiriUISiriStatusView dealloc](&v3, sel_dealloc);
}

- (UIView)flamesContainerView
{
  return self->_flamesContainerView;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = 90.0;
  result.height = v3;
  return result;
}

- (void)forceMicVisible:(BOOL)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (a3 && (unint64_t)(self->_mode - 1) <= 1)
  {
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[SiriUISiriStatusView forceMicVisible:]";
      _os_log_impl(&dword_21764F000, v3, OS_LOG_TYPE_DEFAULT, "%s Tried to force mic visible, but we're already showing flames. Ignoring.", (uint8_t *)&v4, 0xCu);
    }
  }
  else
  {
    -[SiriUISiriStatusView _animateSiriGlyphHidden:](self, "_animateSiriGlyphHidden:", !a3);
  }
}

- (void)setupOrbIfNeeded
{
  -[SiriUISiriStatusView _setupOrbIfNeeded:](self, "_setupOrbIfNeeded:", 0);
}

- (void)fadeOutCurrentAura
{
  -[SUICFlamesView fadeOutCurrentAura](self->_flamesView, "fadeOutCurrentAura");
}

- (void)layoutSubviews
{
  UIView *flamesContainerView;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double x;
  CGFloat y;
  double width;
  double height;
  double v21;
  CGFloat v22;
  void *v23;
  SUICFlamesView *flamesView;
  UIView *touchInputView;
  CGFloat rect;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  flamesContainerView = self->_flamesContainerView;
  -[SiriUISiriStatusView _flamesViewFrame](self, "_flamesViewFrame");
  -[UIView setFrame:](flamesContainerView, "setFrame:");
  -[SiriUISiriStatusView _layoutFlamesViewIfNeeded](self, "_layoutFlamesViewIfNeeded");
  -[SiriUISiriStatusView bounds](self, "bounds");
  v5 = v4;
  rect = v6;
  v8 = v7;
  v10 = v9;
  -[SiriUISiriStatusView safeAreaInsets](self, "safeAreaInsets");
  v12 = v5 + v11;
  v14 = v8 - (v11 + v13);
  v16 = v10 - v15;
  -[UIView frame](self->_glyphView, "frame");
  UIRectCenteredXInRect();
  x = v27.origin.x;
  y = v27.origin.y;
  width = v27.size.width;
  height = v27.size.height;
  v21 = floor((90.0 - CGRectGetHeight(v27)) * 0.5);
  v28.origin.x = v12;
  v28.origin.y = rect;
  v28.size.width = v14;
  v28.size.height = v16;
  v22 = CGRectGetHeight(v28) - v21;
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  -[UIView setFrame:](self->_glyphView, "setFrame:", x, v22 - CGRectGetHeight(v29), width, height);
  -[SiriUISiriStatusView layer](self, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAllowsGroupBlending:", 0);

  flamesView = self->_flamesView;
  -[SiriUISiriStatusView _flamesFrame](self, "_flamesFrame");
  -[SUICFlamesView setActiveFrame:](flamesView, "setActiveFrame:");
  touchInputView = self->_touchInputView;
  -[SiriUISiriStatusView _flamesFrame](self, "_flamesFrame");
  -[UIView setFrame:](touchInputView, "setFrame:");
}

- (CGRect)_flamesViewFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  -[SiriUISiriStatusView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SiriUISiriStatusView flamesViewWidth](self, "flamesViewWidth");
  if (v11 > 0.0)
  {
    -[SiriUISiriStatusView flamesViewWidth](self, "flamesViewWidth");
    UIRectCenteredXInRectScale();
    v4 = v12;
    v6 = v13;
    v8 = v14;
    v10 = v15;
  }
  v16 = v4;
  v17 = v6;
  v18 = v8;
  v19 = v10;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)setMode:(int64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  double v10;
  SiriUISiriStatusView *v11;
  uint64_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    v7 = v5;
    objc_msgSend(v6, "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315394;
    v14 = "-[SiriUISiriStatusView setMode:]";
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_21764F000, v7, OS_LOG_TYPE_DEFAULT, "%s setMode: %@", (uint8_t *)&v13, 0x16u);

  }
  if (self->_mode != a3)
  {
    self->_mode = a3;
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "systemUptime");
    self->_lastStateChangeTime = v10;

    switch(a3)
    {
      case 1:
        -[SiriUISiriStatusView _attachFlamesViewIfNeeded](self, "_attachFlamesViewIfNeeded");
        -[SiriUISiriStatusView _setFlamesViewState:](self, "_setFlamesViewState:", 1);
        -[SiriUISiriStatusView _animateSiriGlyphHidden:](self, "_animateSiriGlyphHidden:", 1);
        -[SUICFlamesView setRenderingEnabled:forReason:](self->_flamesView, "setRenderingEnabled:forReason:", 1, *MEMORY[0x24BDF7F78]);
        objc_msgSend((id)*MEMORY[0x24BDF74F8], "finishedIPTest:", *MEMORY[0x24BEA8608]);
        return;
      case 2:
        -[SiriUISiriStatusView _setFlamesViewState:](self, "_setFlamesViewState:", 2);
        -[SiriUISiriStatusView _animateSiriGlyphHidden:](self, "_animateSiriGlyphHidden:", 1);
        -[SUICFlamesView setRenderingEnabled:forReason:](self->_flamesView, "setRenderingEnabled:forReason:", 1, *MEMORY[0x24BDF7F78]);
        return;
      case 3:
        -[SUICFlamesView setState:](self->_flamesView, "setState:", 3);
        goto LABEL_9;
      case 4:
        -[SiriUISiriStatusView _setFlamesViewState:](self, "_setFlamesViewState:", 0);
        v11 = self;
        v12 = 1;
        goto LABEL_11;
      default:
        -[SiriUISiriStatusView _setFlamesViewState:](self, "_setFlamesViewState:", 0);
LABEL_9:
        v11 = self;
        v12 = 0;
LABEL_11:
        -[SiriUISiriStatusView _animateSiriGlyphHidden:](v11, "_animateSiriGlyphHidden:", v12);
        break;
    }
  }
}

- (void)setFlamesViewDeferred:(BOOL)a3
{
  self->_flamesViewDeferred = a3;
  if (!a3)
    -[SiriUISiriStatusView _attachFlamesViewIfNeeded](self, "_attachFlamesViewIfNeeded");
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    -[SUICFlamesView setPaused:](self->_flamesView, "setPaused:");
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UILongPressGestureRecognizer *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;

  v4 = (UILongPressGestureRecognizer *)a3;
  v9 = (self->_mode != 2
     || (objc_msgSend(MEMORY[0x24BDD1760], "processInfo"),
         v5 = (void *)objc_claimAutoreleasedReturnValue(),
         objc_msgSend(v5, "systemUptime"),
         v7 = v6,
         v8 = self->_lastStateChangeTime + 0.7,
         v5,
         v7 > v8))
    && (self->_longPressRecognizer != v4 || self->_mode != 1);

  return v9;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[UIView frame](self->_flamesContainerView, "frame", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (void)_micButtonTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    v7 = v5;
    objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v4, "state"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315394;
    v11 = "-[SiriUISiriStatusView _micButtonTapped:]";
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_21764F000, v7, OS_LOG_TYPE_DEFAULT, "%s Mic Button Tapped State %@", (uint8_t *)&v10, 0x16u);

  }
  if (objc_msgSend(v4, "state") == 3)
  {
    -[SiriUISiriStatusView delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "siriStatusViewWasTapped:", self);

  }
}

- (void)_micButtonHeld:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(a3, "state");
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    v7 = v5;
    objc_msgSend(v6, "numberWithInteger:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315394;
    v11 = "-[SiriUISiriStatusView _micButtonHeld:]";
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_21764F000, v7, OS_LOG_TYPE_DEFAULT, "%s Mic Button Held State %@", (uint8_t *)&v10, 0x16u);

  }
  if (v4 == 1)
  {
    -[SiriUISiriStatusView delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "siriStatusViewHoldDidBegin:", self);
  }
  else
  {
    if ((unint64_t)(v4 - 3) > 1)
      return;
    -[SiriUISiriStatusView delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "siriStatusViewHoldDidEnd:", self);
  }

}

- (id)_flamesView
{
  SUICFlamesView *flamesView;
  os_log_t *v4;
  NSObject *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  SUICFlamesView *v11;
  SUICFlamesView *v12;
  SUICFlamesView *v13;
  UIView *touchInputView;
  NSObject *v15;
  int v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  flamesView = self->_flamesView;
  if (!flamesView)
  {
    if (self->_flamesViewDeferred)
    {
      flamesView = 0;
    }
    else
    {
      v4 = (os_log_t *)MEMORY[0x24BE08FB0];
      v5 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v17 = 136315138;
        v18 = "-[SiriUISiriStatusView _flamesView]";
        _os_log_impl(&dword_21764F000, v5, OS_LOG_TYPE_DEFAULT, "%s Beginning flamesView setup", (uint8_t *)&v17, 0xCu);
      }
      v6 = objc_alloc(MEMORY[0x24BEA85C8]);
      -[UIScreen bounds](self->_screen, "bounds");
      v11 = (SUICFlamesView *)objc_msgSend(v6, "initWithFrame:screen:fidelity:", self->_screen, -[SiriUIConfiguration flamesViewFidelity](self->_configuration, "flamesViewFidelity"), v7, v8, v9, v10);
      v12 = self->_flamesView;
      self->_flamesView = v11;

      v13 = self->_flamesView;
      -[SiriUISiriStatusView _flamesFrame](self, "_flamesFrame");
      -[SUICFlamesView setActiveFrame:](v13, "setActiveFrame:");
      if (UIAccessibilityIsReduceTransparencyEnabled())
        -[SUICFlamesView setShowAura:](self->_flamesView, "setShowAura:", 0);
      -[SUICFlamesView setFreezesAura:](self->_flamesView, "setFreezesAura:", SiriUIDeviceShouldFreezeAura());
      -[SUICFlamesView setState:](self->_flamesView, "setState:", self->_deferredFlamesViewState);
      touchInputView = self->_touchInputView;
      -[SiriUISiriStatusView _flamesFrame](self, "_flamesFrame");
      -[UIView setFrame:](touchInputView, "setFrame:");
      -[SUICFlamesView setDelegate:](self->_flamesView, "setDelegate:", self);
      v15 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 136315138;
        v18 = "-[SiriUISiriStatusView _flamesView]";
        _os_log_impl(&dword_21764F000, v15, OS_LOG_TYPE_DEFAULT, "%s Finished flamesView setup", (uint8_t *)&v17, 0xCu);
      }
      flamesView = self->_flamesView;
    }
  }
  return flamesView;
}

- (void)setInUITrackingMode:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t mode;
  uint64_t v6;
  uint64_t v7;

  v3 = a3;
  kdebug_trace();
  self->_inUITrackingMode = v3;
  mode = self->_mode;
  if (mode <= 4)
  {
    if (((1 << mode) & 0x19) != 0)
    {
      v6 = !v3;
      v7 = *MEMORY[0x24BDF7F78];
    }
    else
    {
      v7 = *MEMORY[0x24BDF7F78];
      v6 = 1;
    }
    -[SUICFlamesView setRenderingEnabled:forReason:](self->_flamesView, "setRenderingEnabled:forReason:", v6, v7);
  }
}

- (void)_setFlamesViewState:(int64_t)a3
{
  -[SUICFlamesView setState:](self->_flamesView, "setState:");
  self->_deferredFlamesViewState = a3;
}

- (void)_attachFlamesViewIfNeeded
{
  void *v3;
  void *v4;
  id v5;

  -[SiriUISiriStatusView _flamesView](self, "_flamesView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    objc_msgSend(v3, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v5;
    if (!v4)
    {
      -[UIView addSubview:](self->_flamesContainerView, "addSubview:", v5);
      -[SiriUISiriStatusView setNeedsLayout](self, "setNeedsLayout");
      v3 = v5;
    }
  }

}

- (void)_layoutFlamesViewIfNeeded
{
  UIView *v3;
  UIView *flamesContainerView;
  SUICFlamesView *flamesView;

  -[SUICFlamesView superview](self->_flamesView, "superview");
  v3 = (UIView *)objc_claimAutoreleasedReturnValue();
  flamesContainerView = self->_flamesContainerView;

  if (v3 == flamesContainerView)
  {
    flamesView = self->_flamesView;
    -[UIView bounds](self->_flamesContainerView, "bounds");
    -[SUICFlamesView setFrame:](flamesView, "setFrame:");
  }
}

- (void)_setupOrbIfNeeded:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *glyphConfigurationQueue;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  void (**v18)(_QWORD);
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[SiriUISiriStatusView _setupOrbIfNeeded:]";
    _os_log_impl(&dword_21764F000, v5, OS_LOG_TYPE_DEFAULT, "%s Beginning orb setup", buf, 0xCu);
  }
  v6 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke;
  v21[3] = &unk_24D7D91F8;
  v21[4] = self;
  v7 = MEMORY[0x219A0F948](v21);
  v8 = (void *)v7;
  if (self->_glyphPlayerItem)
  {
    (*(void (**)(uint64_t))(v7 + 16))(v7);
    if (v4)
      v4[2](v4);
  }
  else
  {
    v20[0] = v6;
    v20[1] = 3221225472;
    v20[2] = __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_26;
    v20[3] = &unk_24D7D91F8;
    v20[4] = self;
    v9 = (void *)MEMORY[0x219A0F948](v20);
    v19[0] = v6;
    v19[1] = 3221225472;
    v19[2] = __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_32;
    v19[3] = &unk_24D7D91F8;
    v19[4] = self;
    v10 = (void *)MEMORY[0x219A0F948](v19);
    glyphConfigurationQueue = self->_glyphConfigurationQueue;
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_34;
    block[3] = &unk_24D7D9248;
    v15 = v9;
    v16 = v10;
    v17 = v8;
    v18 = v4;
    v12 = v10;
    v13 = v9;
    dispatch_async(glyphConfigurationQueue, block);

  }
}

void __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void (**v3)(_QWORD);
  void (**v4)(_QWORD);
  void (**v5)(_QWORD);
  NSObject *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_2;
  v9[3] = &unk_24D7D91F8;
  v9[4] = *(_QWORD *)(a1 + 32);
  v3 = (void (**)(_QWORD))MEMORY[0x219A0F948](v9);
  v8[0] = v2;
  v8[1] = 3221225472;
  v8[2] = __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_21;
  v8[3] = &unk_24D7D91F8;
  v8[4] = *(_QWORD *)(a1 + 32);
  v4 = (void (**)(_QWORD))MEMORY[0x219A0F948](v8);
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_2_24;
  v7[3] = &unk_24D7D91F8;
  v7[4] = *(_QWORD *)(a1 + 32);
  v5 = (void (**)(_QWORD))MEMORY[0x219A0F948](v7);
  v3[2](v3);
  v4[2](v4);
  v5[2](v5);
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[SiriUISiriStatusView _setupOrbIfNeeded:]_block_invoke_3";
    _os_log_impl(&dword_21764F000, v6, OS_LOG_TYPE_DEFAULT, "%s Finished Queue Player setup", buf, 0xCu);
  }

}

void __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 472))
  {
    v2 = objc_alloc_init(MEMORY[0x24BDB2670]);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 472);
    *(_QWORD *)(v3 + 472) = v2;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setPreventsDisplaySleepDuringVideoPlayback:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setAllowsExternalPlayback:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "pause");
    v5 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v5 + 488))
    {
      objc_msgSend(*(id *)(v5 + 472), "setAudioSession:");
    }
    else
    {
      v6 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
        __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_2_cold_1(v6);
    }
  }
}

uint64_t __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_21(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_QWORD *)(v1 + 456))
  {
    v2 = result;
    objc_msgSend(MEMORY[0x24BDB2648], "playerLayerWithPlayer:", *(_QWORD *)(v1 + 472));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(v2 + 32);
    v5 = *(void **)(v4 + 456);
    *(_QWORD *)(v4 + 456) = v3;

    v6 = *(void **)(*(_QWORD *)(v2 + 32) + 456);
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BD8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCompositingFilter:", v7);

    v8 = *(_QWORD *)(v2 + 32);
    v9 = *(void **)(v8 + 456);
    objc_msgSend(*(id *)(v8 + 448), "bounds");
    objc_msgSend(v9, "setFrame:");
    objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 448), "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSublayer:", *(_QWORD *)(*(_QWORD *)(v2 + 32) + 456));

    return objc_msgSend(*(id *)(v2 + 32), "setNeedsLayout");
  }
  return result;
}

void __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_2_24(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  CMTime v9;
  CMTime start;
  CMTimeRange v11;

  v1 = *(_QWORD **)(a1 + 32);
  if (!v1[58])
  {
    v2 = v1[60];
    if (v2)
    {
      v4 = (void *)MEMORY[0x24BDB2650];
      v5 = v1[59];
      CMTimeMake(&start, 966, 1000);
      CMTimeMake(&v9, 33330, 1000);
      CMTimeRangeMake(&v11, &start, &v9);
      objc_msgSend(v4, "playerLooperWithPlayer:templateItem:timeRange:", v5, v2, &v11);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 464);
      *(_QWORD *)(v7 + 464) = v6;

    }
  }
}

void __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_26(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("Siri Blob"), CFSTR("mov"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x24BDB2618];
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playerItemWithURL:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 480);
  *(_QWORD *)(v7 + 480) = v6;

  v9 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[SiriUISiriStatusView _setupOrbIfNeeded:]_block_invoke";
    _os_log_impl(&dword_21764F000, v9, OS_LOG_TYPE_DEFAULT, "%s Loaded glyph player item", (uint8_t *)&v10, 0xCu);
  }

}

void __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_32(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  os_log_t *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BDB1598];
  v17 = 0;
  objc_msgSend(v2, "setCategory:withOptions:error:", v3, 1, &v17);
  v4 = v17;

  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  if (v4 && os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_32_cold_3();
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 488))
  {
    objc_msgSend(MEMORY[0x24BDB1858], "auxiliarySession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x24BDB15A8];
    v8 = *MEMORY[0x24BDB1618];
    v16 = 0;
    objc_msgSend(v6, "setCategory:mode:options:error:", v7, v8, 1, &v16);
    v9 = v16;
    if (v9)
    {
      v10 = v9;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
        __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_32_cold_1();
    }
    else
    {
      v15 = 0;
      objc_msgSend(v6, "setRequiresNoAudioResources:error:", 1, &v15);
      v11 = v15;
      if (v11)
      {
        v10 = v11;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
          __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_32_cold_1();
      }
      else
      {
        v12 = *(_QWORD *)(a1 + 32);
        v13 = v6;
        v10 = *(void **)(v12 + 488);
        *(_QWORD *)(v12 + 488) = v13;
      }
    }

  }
  v14 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[SiriUISiriStatusView _setupOrbIfNeeded:]_block_invoke";
    _os_log_impl(&dword_21764F000, v14, OS_LOG_TYPE_DEFAULT, "%s Created audio sessions", buf, 0xCu);
  }

}

void __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_34(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_2_35;
  v2[3] = &unk_24D7D9220;
  v3 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);

}

uint64_t __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_2_35(uint64_t a1)
{
  uint64_t result;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_animateSiriGlyphHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  double v9;
  double v10;
  _QWORD v11[5];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    v7 = v5;
    objc_msgSend(v6, "numberWithBool:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v13 = "-[SiriUISiriStatusView _animateSiriGlyphHidden:]";
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_21764F000, v7, OS_LOG_TYPE_DEFAULT, "%s animateSiriGlyphHidden: %@", buf, 0x16u);

  }
  self->_siriGlyphHidden = v3;
  if (v3)
  {
    -[UIView alpha](self->_glyphView, "alpha");
    if (v9 < 2.22044605e-16)
      return;
    if (self->_siriGlyphHidden)
      goto LABEL_7;
  }
  -[UIView alpha](self->_glyphView, "alpha");
  if (v10 <= 0.0)
  {
LABEL_7:
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __48__SiriUISiriStatusView__animateSiriGlyphHidden___block_invoke;
    v11[3] = &unk_24D7D91F8;
    v11[4] = self;
    -[SiriUISiriStatusView _setupOrbIfNeeded:](self, "_setupOrbIfNeeded:", v11);
  }
}

uint64_t __48__SiriUISiriStatusView__animateSiriGlyphHidden___block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  uint64_t result;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = 0.0;
  if (!*(_BYTE *)(v2 + 537))
    v3 = 0.35;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__SiriUISiriStatusView__animateSiriGlyphHidden___block_invoke_2;
  v7[3] = &unk_24D7D91F8;
  v7[4] = v2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__SiriUISiriStatusView__animateSiriGlyphHidden___block_invoke_3;
  v6[3] = &unk_24D7D9270;
  result = objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v7, v6, 0.35, v3, 1.0, 0.0);
  v5 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v5 + 537))
    return objc_msgSend(*(id *)(v5 + 448), "setAlpha:", 1.0);
  return result;
}

uint64_t __48__SiriUISiriStatusView__animateSiriGlyphHidden___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  void *v6;
  _BOOL4 IsReduceMotionEnabled;
  void *v8;
  double v9;
  __int128 v10;
  uint64_t v11;
  CMTime v12;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 537))
  {
    objc_msgSend(*(id *)(v2 + 448), "setAlpha:", 0.0);
    v3 = *(_QWORD **)(a1 + 32);
    v4 = (void *)v3[52];
    objc_msgSend(v3, "_flamesFrame");
    return objc_msgSend(v4, "setFrame:");
  }
  else
  {
    v6 = *(void **)(v2 + 416);
    objc_msgSend((id)v2, "_siriGlyphTappableRect");
    objc_msgSend(v6, "setFrame:");
    IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 472);
    if (IsReduceMotionEnabled)
    {
      CMTimeMake(&v12, 9800, 1000);
      objc_msgSend(v8, "seekToTime:", &v12);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "pause");
      return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setAlpha:", 1.0);
    }
    else
    {
      v10 = *MEMORY[0x24BDC0D88];
      v11 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
      objc_msgSend(v8, "seekToTime:", &v10);
      LODWORD(v9) = 1.0;
      return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "playImmediatelyAtRate:", v9);
    }
  }
}

void __48__SiriUISiriStatusView__animateSiriGlyphHidden___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  BOOL IsReduceMotionEnabled;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  uint64_t v16;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 537))
  {
    IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
    v2 = *(_QWORD *)(a1 + 32);
    if (!IsReduceMotionEnabled)
    {
      v4 = objc_msgSend(*(id *)(v2 + 472), "timeControlStatus");
      v2 = *(_QWORD *)(a1 + 32);
      if (v4 != 2)
      {
        v5 = *(void **)(v2 + 472);
        v15 = *MEMORY[0x24BDC0D88];
        v16 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
        objc_msgSend(v5, "seekToTime:", &v15);
        LODWORD(v6) = 1.0;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "playImmediatelyAtRate:", v6);
        v2 = *(_QWORD *)(a1 + 32);
      }
    }
  }
  objc_msgSend(*(id *)(v2 + 448), "alpha");
  if (v7 < 2.22044605e-16)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 464);
    *(_QWORD *)(v8 + 464) = 0;

    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 472);
    v15 = *MEMORY[0x24BDC0D88];
    v16 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    objc_msgSend(v10, "seekToTime:", &v15);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "pause");
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 472);
    *(_QWORD *)(v11 + 472) = 0;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "removeFromSuperlayer");
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 456);
    *(_QWORD *)(v13 + 456) = 0;

  }
}

- (CGRect)_flamesFrame
{
  void *v3;
  UIScreen *screen;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  v3 = (void *)objc_opt_class();
  screen = self->_screen;
  -[SiriUISiriStatusView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SiriUISiriStatusView safeAreaInsets](self, "safeAreaInsets");
  objc_msgSend(v3, "activeFrameForScreen:frame:safeAreaInsets:", screen, v6, v8, v10, v12, v13, v14, v15, v16);
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)_siriGlyphTappableRect
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect v11;
  CGRect v12;
  CGRect result;

  -[UIView bounds](self->_glyphView, "bounds");
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  CGRectGetHeight(v11);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  CGRectGetWidth(v12);
  -[UIView frame](self->_touchInputView, "frame");
  -[SiriUISiriStatusView bounds](self, "bounds");
  -[SiriUISiriStatusView safeAreaInsets](self, "safeAreaInsets");
  UIRectCenteredXInRect();
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (double)statusViewHeight
{
  double v2;

  -[SiriUISiriStatusView safeAreaInsets](self, "safeAreaInsets");
  return v2 + 90.0;
}

- (UIEdgeInsets)safeAreaInsets
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  -[SiriUISiriStatusView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsetsForSiriStatusView:", self);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (void)_handleKeyboardDidShowNotification:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  os_log_t *v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDF7AE8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if ((v6 & 1) != 0)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[UIView gestureRecognizers](self->_touchInputView, "gestureRecognizers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      v11 = (os_log_t *)MEMORY[0x24BE08FB0];
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          v14 = *v11;
          if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v21 = "-[SiriUISiriStatusView _handleKeyboardDidShowNotification:]";
            v22 = 2112;
            v23 = v13;
            _os_log_impl(&dword_21764F000, v14, OS_LOG_TYPE_DEFAULT, "%s Keyboard showing inside of our process, disabling gesture recognizer: %@", buf, 0x16u);
          }
          objc_msgSend(v13, "setEnabled:", 0);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v9);
    }

  }
  else
  {
    v15 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[SiriUISiriStatusView _handleKeyboardDidShowNotification:]";
      _os_log_impl(&dword_21764F000, v15, OS_LOG_TYPE_DEFAULT, "%s Keyboard showing outside of our process, ignoring notification", buf, 0xCu);
    }
  }

}

- (void)_handleKeyboardWillHideNotification:(id)a3
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  os_log_t *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[UIView gestureRecognizers](self->_touchInputView, "gestureRecognizers", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v14;
    v8 = (os_log_t *)MEMORY[0x24BE08FB0];
    *(_QWORD *)&v5 = 136315394;
    v12 = v5;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        v11 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v12;
          v18 = "-[SiriUISiriStatusView _handleKeyboardWillHideNotification:]";
          v19 = 2112;
          v20 = v10;
          _os_log_impl(&dword_21764F000, v11, OS_LOG_TYPE_DEFAULT, "%s Keyboard hiding, re-enabling gesture recognizer: %@", buf, 0x16u);
        }
        objc_msgSend(v10, "setEnabled:", 1, v12);
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v6);
  }

}

- (float)audioLevelForFlamesView:(id)a3
{
  void *v4;
  float v5;
  float v6;

  -[SiriUISiriStatusView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioLevelForSiriStatusView:", self);
  v6 = v5;

  return v6;
}

- (int64_t)mode
{
  return self->_mode;
}

- (double)disabledMicOpacity
{
  return self->_disabledMicOpacity;
}

- (void)setDisabledMicOpacity:(double)a3
{
  self->_disabledMicOpacity = a3;
}

- (SiriUISiriStatusViewDelegate)delegate
{
  return (SiriUISiriStatusViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)flamesViewWidth
{
  return self->_flamesViewWidth;
}

- (void)setFlamesViewWidth:(double)a3
{
  self->_flamesViewWidth = a3;
}

- (BOOL)flamesViewDeferred
{
  return self->_flamesViewDeferred;
}

- (BOOL)isInUITrackingMode
{
  return self->_inUITrackingMode;
}

- (BOOL)paused
{
  return self->_paused;
}

- (SiriUISiriStatusViewAnimationDelegate)animationDelegate
{
  return (SiriUISiriStatusViewAnimationDelegate *)objc_loadWeakRetained((id *)&self->_animationDelegate);
}

- (void)setAnimationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_animationDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_animationDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_glyphConfigurationQueue, 0);
  objc_storeStrong((id *)&self->_glyphAudioSession, 0);
  objc_storeStrong((id *)&self->_glyphPlayerItem, 0);
  objc_storeStrong((id *)&self->_glyphQueuePlayer, 0);
  objc_storeStrong((id *)&self->_glyphPlayerLooper, 0);
  objc_storeStrong((id *)&self->_glyphLayer, 0);
  objc_storeStrong((id *)&self->_glyphView, 0);
  objc_storeStrong((id *)&self->_flamesView, 0);
  objc_storeStrong((id *)&self->_flamesContainerView, 0);
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
  objc_storeStrong((id *)&self->_touchInputView, 0);
}

void __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_2_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[SiriUISiriStatusView _setupOrbIfNeeded:]_block_invoke_2";
  _os_log_error_impl(&dword_21764F000, log, OS_LOG_TYPE_ERROR, "%s Using default audio session for glyphQueuePlayer", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_32_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21764F000, v0, v1, "%s Error setting playback audio session for blob view: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __42__SiriUISiriStatusView__setupOrbIfNeeded___block_invoke_32_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21764F000, v0, v1, "%s Error setting ambient audio session for blob view: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

@end
