@implementation SUICFlamesViewMetal

- (void)_setValuesForFidelity:(int64_t)a3
{
  double v4;
  float v5;
  double v6;
  float v7;
  unsigned int maxVertexCircles;
  float v9;
  float v10;
  float v11;

  if (self->_mode == 1)
  {
    self->_maxVertexCircles = 1;
    -[SUICFlamesViewMetal _currentDisplayScale](self, "_currentDisplayScale", a3);
    v5 = v4 * 6.0;
    v6 = v4 * self->_activeFrame.size.width * self->_horizontalScaleFactor;
    *(float *)&v4 = v6;
    self->_maxSubdivisionLevel = logf(roundf((float)(fmaxf(v5, *(float *)&v4) / v5) / 3.0) * 4.0) / 0.69315;
    v7 = v6 / ((float)-[SUICFlamesViewMetal _numVerticesPerCircle](self, "_numVerticesPerCircle") * 0.25);
    self->_dictationUnitSize = v7;
    maxVertexCircles = self->_maxVertexCircles;
    v9 = 0.0;
    v10 = 0.0;
  }
  else
  {
    if (a3 == 2)
    {
      maxVertexCircles = 18;
      self->_maxVertexCircles = 18;
      self->_maxSubdivisionLevel = 8.0;
      v10 = 4.0;
    }
    else
    {
      if (a3 == 1)
      {
        maxVertexCircles = 12;
        self->_maxVertexCircles = 12;
        v11 = 7.0;
      }
      else
      {
        if (a3)
          return;
        maxVertexCircles = 6;
        self->_maxVertexCircles = 6;
        v11 = 6.0;
      }
      self->_maxSubdivisionLevel = v11;
      v10 = 3.0;
    }
    v9 = 1.0;
  }
  self->_auraVertexCircles = maxVertexCircles;
  self->_auraMinSubdivisionLevel = v9;
  self->_auraMaxSubdivisionLevel = v10;
}

- (SUICFlamesViewMetal)initWithFrame:(CGRect)a3 screen:(id)a4 fidelity:(int64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  SUICFlamesViewMetal *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SUICAudioLevelSmoother *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  SUICAudioLevelSmoother *levelSmoother;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  NSMutableArray *v29;
  NSMutableArray *flameGroups;
  SUICFlameGroup *v31;
  SUICFlameGroup *currentFlameGroup;
  uint64_t v33;
  NSMutableSet *renderingDisabledReasons;
  NSObject *v35;
  objc_super v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  SUICFlamesViewMetal *v41;
  uint64_t v42;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v42 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v37.receiver = self;
  v37.super_class = (Class)SUICFlamesViewMetal;
  v13 = -[MTKView initWithFrame:](&v37, sel_initWithFrame_, x, y, width, height);
  if (v13)
  {
    v13->_reduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v13, sel__reduceMotionStatusChanged_, *MEMORY[0x1E0DC45B0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v13, sel__applicationWillResignActive_, *MEMORY[0x1E0DC4868], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v13, sel__applicationWillEnterForeground_, *MEMORY[0x1E0DC4860], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v13, sel__applicationDidBecomeActive_, *MEMORY[0x1E0DC4750], 0);

    v18 = [SUICAudioLevelSmoother alloc];
    LODWORD(v19) = -1032847360;
    LODWORD(v20) = 1051931443;
    LODWORD(v21) = 1063675494;
    LODWORD(v22) = -10.0;
    v23 = -[SUICAudioLevelSmoother initWithMinimumPower:maximumPower:historyLength:attackSpeed:decaySpeed:](v18, "initWithMinimumPower:maximumPower:historyLength:attackSpeed:decaySpeed:", 5, v19, v22, v20, v21);
    levelSmoother = v13->_levelSmoother;
    v13->_levelSmoother = (SUICAudioLevelSmoother *)v23;

    objc_storeStrong((id *)&v13->_screen, a4);
    v13->_showAura = 1;
    -[SUICFlamesViewMetal setMode:](v13, "setMode:", 0);
    v13->_fidelity = a5;
    -[SUICFlamesViewMetal _setValuesForFidelity:](v13, "_setValuesForFidelity:", a5);
    -[SUICFlamesViewMetal bounds](v13, "bounds");
    v13->_activeFrame.origin.x = v25;
    v13->_activeFrame.origin.y = v26;
    v13->_activeFrame.size.width = v27;
    v13->_activeFrame.size.height = v28;
    v13->_currentContextCount = 0;
    v13->_horizontalScaleFactor = 1.0;
    v13->_frameRateScalingFactor = 1.0;
    v13->_state = 0;
    v13->_dictationRedColor = 1.0;
    v13->_dictationGreenColor = 1.0;
    v13->_dictationBlueColor = 1.0;
    v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    flameGroups = v13->_flameGroups;
    v13->_flameGroups = v29;

    v31 = objc_alloc_init(SUICFlameGroup);
    currentFlameGroup = v13->_currentFlameGroup;
    v13->_currentFlameGroup = v31;

    -[NSMutableArray addObject:](v13->_flameGroups, "addObject:", v13->_currentFlameGroup);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v33 = objc_claimAutoreleasedReturnValue();
    renderingDisabledReasons = v13->_renderingDisabledReasons;
    v13->_renderingDisabledReasons = (NSMutableSet *)v33;

    -[MTKView setClearColor:](v13, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
    v35 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v39 = "-[SUICFlamesViewMetal initWithFrame:screen:fidelity:]";
      v40 = 2112;
      v41 = v13;
      _os_log_impl(&dword_1A3752000, v35, OS_LOG_TYPE_DEFAULT, "%s Created flames view: %@", buf, 0x16u);
    }
  }

  return v13;
}

- (SUICFlamesViewMetal)initWithFrame:(CGRect)a3 screenScale:(double)a4 fidelity:(int64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v11;
  SUICFlamesViewMetal *v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SUICFlamesViewMetal initWithFrame:screen:fidelity:](self, "initWithFrame:screen:fidelity:", v11, a5, x, y, width, height);

  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SUICFlamesViewMetal _tearDownDisplayLink](self, "_tearDownDisplayLink");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SUICFlamesViewMetal;
  -[MTKView dealloc](&v4, sel_dealloc);
}

- (void)didMoveToSuperview
{
  void *v3;
  void *v4;

  -[SUICFlamesViewMetal superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SUICFlamesViewMetal _setupDisplayLink](self, "_setupDisplayLink");
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUICFlamesViewMetal setBackgroundColor:](self, "setBackgroundColor:", v4);

    -[SUICFlamesViewMetal setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  }
  else
  {
    -[SUICFlamesViewMetal _tearDownDisplayLink](self, "_tearDownDisplayLink");
  }
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setFlamesDelegate:(id)a3
{
  id v4;
  id obj;

  v4 = a3;
  obj = v4;
  if (!v4 && self->_displayLink)
  {
    -[SUICFlamesViewMetal _tearDownDisplayLink](self, "_tearDownDisplayLink");
    v4 = 0;
  }
  objc_storeWeak((id *)&self->_flamesDelegate, v4);

}

- (void)setState:(int64_t)a3
{
  double v3;
  double v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  SUICFlameGroup *v12;
  SUICFlameGroup *v13;
  SUICFlameGroup *currentFlameGroup;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_state != a3)
  {
    self->_transitionFinished = 0;
    self->_state = a3;
    LODWORD(v3) = 0.25;
    if (!self->_accelerateTransitions)
      *(float *)&v3 = 0.0;
    -[SUICFlameGroup setTransitionPhase:](self->_currentFlameGroup, "setTransitionPhase:", v3);
    LODWORD(v6) = 0;
    -[SUICFlameGroup setStateTime:](self->_currentFlameGroup, "setStateTime:", v6);
    if (a3 == 3)
    {
      if (self->_showAura)
      {
        -[SUICFlameGroup setIsAura:](self->_currentFlameGroup, "setIsAura:", 1);
        v17 = 0u;
        v18 = 0u;
        v15 = 0u;
        v16 = 0u;
        v7 = self->_flameGroups;
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v16;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v16 != v10)
                objc_enumerationMutation(v7);
              v12 = *(SUICFlameGroup **)(*((_QWORD *)&v15 + 1) + 8 * i);
              if (v12 != self->_currentFlameGroup)
                -[SUICFlameGroup setIsDyingOff:](v12, "setIsDyingOff:", 1, (_QWORD)v15);
            }
            v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          }
          while (v9);
        }

        self->_state = 0;
        v13 = objc_alloc_init(SUICFlameGroup);
        currentFlameGroup = self->_currentFlameGroup;
        self->_currentFlameGroup = v13;

        -[NSMutableArray addObject:](self->_flameGroups, "addObject:", self->_currentFlameGroup);
      }
      else
      {
        self->_state = 0;
      }
    }
    -[SUICFlamesViewMetal _setPreferredFramesPerSecond](self, "_setPreferredFramesPerSecond", (_QWORD)v15);
    -[SUICFlamesViewMetal _updateDisplayLinkPausedState](self, "_updateDisplayLinkPausedState");
  }
}

- (void)fadeOutCurrentAura
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_flameGroups;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v7, "isAura", (_QWORD)v8))
          objc_msgSend(v7, "setIsDyingOff:", 1);
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

+ (BOOL)_supportsAdaptiveFramerate
{
  if (_supportsAdaptiveFramerate_onceToken_0 != -1)
    dispatch_once(&_supportsAdaptiveFramerate_onceToken_0, &__block_literal_global_6);
  return _supportsAdaptiveFramerate_supportsAdaptiveFramerate_0;
}

uint64_t __49__SUICFlamesViewMetal__supportsAdaptiveFramerate__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  _supportsAdaptiveFramerate_supportsAdaptiveFramerate_0 = result;
  return result;
}

- (void)_setPreferredFramesPerSecond
{
  uint64_t v3;
  unint64_t state;
  int64_t mode;
  uint64_t v6;
  double v7;

  if (self->_flamesPaused)
  {
    v3 = 10;
  }
  else
  {
    if (objc_msgSend((id)objc_opt_class(), "_supportsAdaptiveFramerate")
      && (state = self->_state, state <= 4))
    {
      v3 = qword_1A37FD038[state];
    }
    else
    {
      v3 = 0;
    }
    mode = self->_mode;
    if (!mode && self->_state == 2 && self->_reduceThinkingFramerate)
    {
      v6 = -[UIScreen maximumFramesPerSecond](self->_screen, "maximumFramesPerSecond", v3);
      v7 = (double)(v6 / 20);
      if (v6 < 20)
        v7 = 1.0;
      self->_frameRateScalingFactor = v7;
      v3 = 20;
    }
    else if (self->_reduceFrameRate)
    {
      if ((mode | 2) == 2)
      {
        if (self->_state != 2)
          v3 = 30;
      }
      else
      {
        v3 = 30;
      }
    }
  }
  -[CADisplayLink setPreferredFramesPerSecond:](self->_displayLink, "setPreferredFramesPerSecond:", v3);
}

- (int64_t)_preferredFramesPerSecond
{
  return -[CADisplayLink preferredFramesPerSecond](self->_displayLink, "preferredFramesPerSecond");
}

- (void)_updateDisplayLinkPausedState
{
  int64_t state;
  CADisplayLink *displayLink;
  _BOOL8 flamesPaused;
  BOOL v5;

  state = self->_state;
  if ((unint64_t)(state - 1) > 1)
  {
    if (self->_showAura)
    {
      if (state)
        v5 = 1;
      else
        v5 = !self->_freezesAura;
      if (v5)
        goto LABEL_14;
    }
    else if (state)
    {
      goto LABEL_14;
    }
    if (self->_transitionFinished)
    {
      displayLink = self->_displayLink;
      flamesPaused = 1;
      goto LABEL_3;
    }
LABEL_14:
    flamesPaused = self->_flamesPaused;
    displayLink = self->_displayLink;
    goto LABEL_3;
  }
  displayLink = self->_displayLink;
  flamesPaused = 0;
LABEL_3:
  -[CADisplayLink setPaused:](displayLink, "setPaused:", flamesPaused);
}

- (void)setMode:(int64_t)a3
{
  if (self->_mode != a3)
  {
    self->_shadersAreCompiled = 0;
    self->_mode = a3;
    if (a3 == 1)
      -[SUICFlamesViewMetal _setValuesForFidelity:](self, "_setValuesForFidelity:", 0);
    if (self->_isInitialized)
      -[SUICFlamesViewMetal _initMetalAndSetupDisplayLink:](self, "_initMetalAndSetupDisplayLink:", 1);
  }
}

- (void)setHidden:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SUICFlamesViewMetal;
  -[SUICFlamesViewMetal setHidden:](&v5, sel_setHidden_);
  if (v3)
  {
    -[SUICFlamesViewMetal _tearDownDisplayLink](self, "_tearDownDisplayLink");
  }
  else if (self->_isInitialized)
  {
    -[SUICFlamesViewMetal _setupDisplayLink](self, "_setupDisplayLink");
  }
}

- (void)setDictationColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_dictationColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_dictationColor, a3);
    -[UIColor getRed:green:blue:alpha:](self->_dictationColor, "getRed:green:blue:alpha:", &self->_dictationRedColor, &self->_dictationGreenColor, &self->_dictationBlueColor, 0);
    v5 = v6;
  }

}

- (void)setFrame:(CGRect)a3
{
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  UIImageView *overlayImageView;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUICFlamesViewMetal;
  -[MTKView setFrame:](&v9, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (!self->_hasCustomActiveFrame)
  {
    -[SUICFlamesViewMetal bounds](self, "bounds");
    self->_activeFrame.origin.x = v4;
    self->_activeFrame.origin.y = v5;
    self->_activeFrame.size.width = v6;
    self->_activeFrame.size.height = v7;
  }
  if (self->_mode == 1)
  {
    -[SUICFlamesViewMetal _setValuesForFidelity:](self, "_setValuesForFidelity:", 0);
    if (self->_isInitialized)
      -[SUICFlamesViewMetal _initMetalAndSetupDisplayLink:](self, "_initMetalAndSetupDisplayLink:", 1);
  }
  overlayImageView = self->_overlayImageView;
  -[SUICFlamesViewMetal frame](self, "frame");
  -[UIImageView setFrame:](overlayImageView, "setFrame:");
}

- (void)setBounds:(CGRect)a3
{
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUICFlamesViewMetal;
  -[SUICFlamesViewMetal setBounds:](&v8, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (!self->_hasCustomActiveFrame)
  {
    -[SUICFlamesViewMetal bounds](self, "bounds");
    self->_activeFrame.origin.x = v4;
    self->_activeFrame.origin.y = v5;
    self->_activeFrame.size.width = v6;
    self->_activeFrame.size.height = v7;
  }
}

- (void)setActiveFrame:(CGRect)a3
{
  self->_hasCustomActiveFrame = 1;
  self->_activeFrame = a3;
  if (self->_mode == 1)
  {
    -[SUICFlamesViewMetal _setValuesForFidelity:](self, "_setValuesForFidelity:", 0);
    if (self->_isInitialized)
      -[SUICFlamesViewMetal _initMetalAndSetupDisplayLink:](self, "_initMetalAndSetupDisplayLink:", 1);
  }
}

- (void)setOverlayImage:(id)a3
{
  UIImageView *v5;
  UIImageView *overlayImageView;
  UIImageView *v7;
  UIImageView *v8;
  id v9;

  v9 = a3;
  objc_storeStrong((id *)&self->_overlayImage, a3);
  if (self->_overlayImage)
  {
    v5 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v9);
    overlayImageView = self->_overlayImageView;
    self->_overlayImageView = v5;

    v7 = self->_overlayImageView;
    -[SUICFlamesViewMetal frame](self, "frame");
    -[UIImageView setFrame:](v7, "setFrame:");
    -[SUICFlamesViewMetal addSubview:](self, "addSubview:", self->_overlayImageView);
  }
  else
  {
    -[UIImageView removeFromSuperview](self->_overlayImageView, "removeFromSuperview");
    v8 = self->_overlayImageView;
    self->_overlayImageView = 0;

  }
}

- (void)setRenderInBackground:(BOOL)a3
{
  self->_renderInBackground = a3;
}

- (BOOL)flamesPaused
{
  return self->_flamesPaused;
}

- (void)setFlamesPaused:(BOOL)a3
{
  self->_flamesPaused = a3;
  -[SUICFlamesViewMetal _setPreferredFramesPerSecond](self, "_setPreferredFramesPerSecond");
  -[SUICFlamesViewMetal _updateDisplayLinkPausedState](self, "_updateDisplayLinkPausedState");
}

- (void)setHorizontalScaleFactor:(double)a3
{
  void *v4;
  CGAffineTransform v5;

  self->_horizontalScaleFactor = a3;
  if (a3 != 0.0)
  {
    -[SUICFlamesViewMetal layer](self, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    CGAffineTransformMakeScale(&v5, 1.0 / self->_horizontalScaleFactor, 1.0);
    objc_msgSend(v4, "setAffineTransform:", &v5);

    -[SUICFlamesViewMetal _setValuesForFidelity:](self, "_setValuesForFidelity:", self->_fidelity);
  }
}

- (void)setRenderingEnabled:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableSet *renderingDisabledReasons;
  id v8;

  v4 = a3;
  v6 = a4;
  renderingDisabledReasons = self->_renderingDisabledReasons;
  v8 = v6;
  if (v4)
    -[NSMutableSet removeObject:](renderingDisabledReasons, "removeObject:", v6);
  else
    -[NSMutableSet addObject:](renderingDisabledReasons, "addObject:", v6);
  if (-[SUICFlamesViewMetal isRenderingEnabled](self, "isRenderingEnabled"))
    -[SUICFlamesViewMetal setNeedsLayout](self, "setNeedsLayout");

}

+ (void)prewarmShadersForScreen:(id)a3 size:(CGSize)a4
{
  objc_msgSend(a1, "prewarmShadersForScreen:size:fidelity:", a3, 2, a4.width, a4.height);
}

+ (void)prewarmShadersForScreen:(id)a3 size:(CGSize)a4 fidelity:(int64_t)a5
{
  objc_msgSend(a1, "prewarmShadersForScreen:size:fidelity:prewarmInBackground:", a3, a5, 0, a4.width, a4.height);
}

+ (void)prewarmShadersForScreen:(id)a3 size:(CGSize)a4 fidelity:(int64_t)a5 prewarmInBackground:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  double v11;
  double v12;
  id v13;

  v6 = a6;
  height = a4.height;
  width = a4.width;
  v13 = a3;
  objc_msgSend(v13, "bounds");
  objc_msgSend(a1, "prewarmShadersForScreen:initialFrame:activeFrame:fidelity:prewarmInBackground:", v13, a5, v6, v11, v12, width, height, v11, v12, width, height);

}

+ (void)prewarmShadersForScreen:(id)a3 activeFrame:(CGRect)a4 fidelity:(int64_t)a5
{
  id v7;

  v7 = a3;
  objc_msgSend(v7, "bounds");
  objc_msgSend(a1, "prewarmShadersForScreen:initialFrame:activeFrame:fidelity:prewarmInBackground:", v7, a5, 0);

}

+ (void)prewarmShadersForScreen:(id)a3 initialFrame:(CGRect)a4 activeFrame:(CGRect)a5 fidelity:(int64_t)a6 prewarmInBackground:(BOOL)a7
{
  _BOOL8 v7;
  double height;
  double width;
  double y;
  double x;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  SUICFlamesViewMetal *v18;

  v7 = a7;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a4.size.height;
  v14 = a4.size.width;
  v15 = a4.origin.y;
  v16 = a4.origin.x;
  v17 = a3;
  v18 = -[SUICFlamesViewMetal initWithFrame:screen:fidelity:]([SUICFlamesViewMetal alloc], "initWithFrame:screen:fidelity:", v17, a6, v16, v15, v14, v13);

  -[SUICFlamesViewMetal setRenderInBackground:](v18, "setRenderInBackground:", v7);
  -[SUICFlamesViewMetal setActiveFrame:](v18, "setActiveFrame:", x, y, width, height);
  -[SUICFlamesViewMetal _prewarmShaders](v18, "_prewarmShaders");

}

- (void)_prewarmShaders
{
  self->_isInitialized = -[SUICFlamesViewMetal _initMetalAndSetupDisplayLink:](self, "_initMetalAndSetupDisplayLink:", 0);
  -[SUICFlamesViewMetal _updateCurveLayer:](self, "_updateCurveLayer:", self->_displayLink);
}

- (void)resetAndReinitialize:(BOOL)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a3)
    -[SUICFlamesViewMetal _initMetalAndSetupDisplayLink:](self, "_initMetalAndSetupDisplayLink:", 1);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_flameGroups;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        if (*(SUICFlameGroup **)(*((_QWORD *)&v10 + 1) + 8 * v9) != self->_currentFlameGroup)
          objc_msgSend(v4, "addObject:", (_QWORD)v10);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  -[NSMutableArray removeObjectsInArray:](self->_flameGroups, "removeObjectsInArray:", v4);
  -[SUICFlamesViewMetal _updateCurveLayer:](self, "_updateCurveLayer:", self->_displayLink);

}

- (void)_reduceMotionStatusChanged:(id)a3
{
  self->_reduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  if (!self->_mode)
  {
    self->_shadersAreCompiled = 0;
    -[SUICFlamesViewMetal resetAndReinitialize:](self, "resetAndReinitialize:", 1);
  }
}

- (void)_applicationWillResignActive:(id)a3
{
  -[SUICFlamesViewMetal setRenderingEnabled:forReason:](self, "setRenderingEnabled:forReason:", 0, CFSTR("kSUICFlamesViewUIApplicationNotificationReason"));
}

- (void)_applicationWillEnterForeground:(id)a3
{
  -[SUICFlamesViewMetal setRenderingEnabled:forReason:](self, "setRenderingEnabled:forReason:", 1, CFSTR("kSUICFlamesViewUIApplicationNotificationReason"));
}

- (void)_applicationDidBecomeActive:(id)a3
{
  -[SUICFlamesViewMetal setRenderingEnabled:forReason:](self, "setRenderingEnabled:forReason:", 1, CFSTR("kSUICFlamesViewUIApplicationNotificationReason"));
}

- (void)_setupDisplayLink
{
  uint64_t v3;
  void *v4;
  char v5;
  CADisplayLink *v6;
  CADisplayLink *displayLink;
  CADisplayLink *v8;
  void *v9;

  if (!self->_displayLink)
  {
    -[SUICFlamesViewMetal superview](self, "superview");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      v5 = -[SUICFlamesViewMetal isHidden](self, "isHidden");

      if ((v5 & 1) == 0)
      {
        -[UIScreen displayLinkWithTarget:selector:](self->_screen, "displayLinkWithTarget:selector:", self, sel__updateCurveLayer_);
        v6 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
        displayLink = self->_displayLink;
        self->_displayLink = v6;

        v8 = self->_displayLink;
        objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[CADisplayLink addToRunLoop:forMode:](v8, "addToRunLoop:forMode:", v9, *MEMORY[0x1E0C99860]);

        -[SUICFlamesViewMetal _setPreferredFramesPerSecond](self, "_setPreferredFramesPerSecond");
        -[SUICFlamesViewMetal _updateDisplayLinkPausedState](self, "_updateDisplayLinkPausedState");
      }
    }
  }
}

- (unsigned)_numVerticesPerCircle
{
  return llroundf(exp2f(self->_maxSubdivisionLevel) * 3.0);
}

- (float32x2_t)_predeterminedVertexPositionForAuraWithPolarVertex:(uint64_t)a1
{
  float64x2_t v2;
  float32x2_t v8;
  float32x2_t v9;
  float32x2_t v10;
  __float2 v11;
  float v13;

  v2.f64[0] = *(double *)(a1 + 1360) * *(double *)(a1 + 1320);
  v2.f64[1] = *(float64_t *)(a1 + 1368);
  __asm { FMOV            V3.2S, #-1.0 }
  v8 = vmla_f32(_D3, (float32x2_t)0x4000000040000000, vdiv_f32(vmla_f32(vcvt_f32_f64(*(float64x2_t *)(a1 + 1344)), (float32x2_t)0x3F0000003F000000, vcvt_f32_f64(v2)), *(float32x2_t *)(a1 + 1128)));
  v9 = vneg_f32(v8);
  v10 = vsub_f32(_D3, v8);
  v13 = sqrtf(vaddv_f32(vmul_f32(v10, v10))) * *(float *)&a2;
  v11 = __sincosf_stret(*((float *)&a2 + 1));
  return vmla_n_f32(v9, (float32x2_t)__PAIR64__(LODWORD(v11.__sinval), LODWORD(v11.__cosval)), v13);
}

- (int)_generateIndicesForNumCircleShapes:(int)a3 withMaxSubdivisionLevel:(float)a4 startingWithNumSubdivisionLevel:(float)a5 forIndices:(unsigned int *)a6 atStartIndex:(int)a7 withFill:(BOOL)a8 withCullingForAura:(BOOL)a9 forVertices:(id *)a10
{
  _BOOL4 v10;
  unsigned int v15;
  char *v16;
  unsigned int v17;
  unsigned int v18;
  int v19;
  int v20;
  uint64_t v21;
  int v22;
  unsigned int v23;
  unsigned int *v24;
  unsigned int v25;
  unsigned int v26;
  int v27;
  int v28;
  float32x2_t v29;
  unsigned int maxVertexCircles;
  float v36;
  int v37;
  float v38;
  float v39;
  float v40;
  int v41;
  float v42;
  float v43;
  int v44;
  int v45;
  float v46;
  float v47;
  float v48;
  unsigned int v49;
  unsigned int v50;
  unsigned int v51;
  float v52;
  unsigned int v53;
  unsigned int v54;
  __int128 v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  float32x2_t v65;
  int32x2_t v66;
  int32x2_t v67;
  unsigned int *v68;
  int32x2_t v69;
  int32x2_t v70;
  int v71;
  unsigned int *v72;
  int32x2_t v73;
  int32x2_t v74;
  uint64_t v75;
  char *v76;
  unsigned int **v78;
  int v79;
  float v80;
  float v82;
  int v83;
  int v85;
  unsigned int v87;
  float v88;
  int v89;
  int v90;
  int v91;
  float v92;
  int v93;
  _BOOL4 v94;

  v94 = a9;
  v10 = a8;
  v15 = -[SUICFlamesViewMetal _numVerticesPerCircle](self, "_numVerticesPerCircle");
  v78 = a6;
  v16 = (char *)*a6;
  v91 = a3;
  if (v10)
  {
    v17 = vcvtas_u32_f32(exp2f(a5) * 3.0);
    v18 = a3 == 1 ? (self->_maxVertexCircles - 1) * v15 : 0;
    v19 = (v17 >> 1) - 1;
    if (v17 >> 1 != 1)
    {
      v20 = (int)(float)((float)v15 / (float)v17);
      v21 = 4 * a7;
      v93 = v20 * (v17 - 1);
      v22 = v20 * (v17 - 2);
      v23 = v18;
      do
      {
        v16 = (char *)malloc_type_realloc(v16, v21 + 24, 0x100004052888210uLL);
        v24 = (unsigned int *)&v16[v21];
        v25 = v22 + v23;
        *v24 = v18;
        v24[1] = v20 + v18;
        v24[2] = v22 + v23;
        v24[3] = v18;
        v26 = v93 + v23;
        v23 -= v20;
        v24[4] = v25;
        v24[5] = v26;
        a7 += 6;
        v18 += v20;
        v21 += 24;
        --v19;
      }
      while (v19);
    }
  }
  v27 = v91 - 2;
  if (v91 >= 2)
  {
    v80 = a5;
    v28 = 0;
    v82 = (float)v91;
    v88 = (float)v15;
    v29 = (float32x2_t)vdup_n_s32(0x3F8CCCCDu);
    __asm { FMOV            V14.2S, #1.0 }
    v79 = v91 - 2;
    while (1)
    {
      maxVertexCircles = self->_maxVertexCircles;
      v36 = (float)maxVertexCircles;
      v37 = v28 == v27 ? maxVertexCircles - 1 : (int)(float)((float)((float)(v28 + 1) / v82) * v36);
      v38 = (float)v28 + v80;
      v39 = v38 >= a4 ? a4 : (float)v28 + v80;
      v40 = exp2f(v39) * 3.0;
      v41 = llroundf(v40);
      v42 = v38 + 1.0;
      if ((float)(v38 + 1.0) >= a4)
        v42 = a4;
      v43 = exp2f(v42);
      v83 = v28;
      if (v41 >= 1)
        break;
LABEL_35:
      v28 = v83 + 1;
      v27 = v79;
      if (v83 == v79)
        goto LABEL_36;
    }
    v44 = 0;
    v45 = (int)(float)((float)((float)v28 / v82) * v36);
    v46 = (float)(int)roundf(v40);
    v47 = v46 / (float)(int)roundf(v43 * 3.0);
    v89 = v37 * v15;
    v90 = v15 * v45;
    v92 = v47;
    v85 = v41;
    while (1)
    {
      v48 = (float)v44;
      v49 = (int)(float)((float)((float)v44 / v46) * v88) % v15;
      v50 = v49 + v90;
      ++v44;
      v51 = v49 + v89;
      v52 = (float)((float)(v47 + v48) / v46) * v88;
      v53 = (int)v52 % v15 + v89;
      v54 = (int)(float)((float)((float)((float)(v46 + v48) - v47) / v46) * v88) % v15 + v89;
      if (v94)
      {
        v87 = v49 + v90;
        v55 = *((_OWORD *)a10 + 2 * (int)v50);
        v56 = (int)v52 % v15 + v89;
        -[SUICFlamesViewMetal _predeterminedVertexPositionForAuraWithPolarVertex:](self, "_predeterminedVertexPositionForAuraWithPolarVertex:", *(double *)&v55);
        v58 = v57 & 0x7FFFFFFF7FFFFFFFLL;
        v53 = v56;
        -[SUICFlamesViewMetal _predeterminedVertexPositionForAuraWithPolarVertex:](self, "_predeterminedVertexPositionForAuraWithPolarVertex:", *((double *)a10 + 4 * (int)((int)(float)((float)(v88 * (float)v44) / v46) % v15 + v90)));
        v60 = v59 & 0x7FFFFFFF7FFFFFFFLL;
        -[SUICFlamesViewMetal _predeterminedVertexPositionForAuraWithPolarVertex:](self, "_predeterminedVertexPositionForAuraWithPolarVertex:", *((double *)a10 + 4 * (int)v51));
        v62 = v61 & 0x7FFFFFFF7FFFFFFFLL;
        -[SUICFlamesViewMetal _predeterminedVertexPositionForAuraWithPolarVertex:](self, "_predeterminedVertexPositionForAuraWithPolarVertex:", *((double *)a10 + 4 * (int)v56));
        v64 = v63 & 0x7FFFFFFF7FFFFFFFLL;
        -[SUICFlamesViewMetal _predeterminedVertexPositionForAuraWithPolarVertex:](self, "_predeterminedVertexPositionForAuraWithPolarVertex:", *((double *)a10 + 4 * (int)v54));
        if (v92 == 1.0)
        {
          v41 = v85;
          v50 = v87;
LABEL_28:
          v69 = (int32x2_t)vbic_s8(_D14, (int8x8_t)vcgt_f32(v29, (float32x2_t)v58));
          v70 = (int32x2_t)vbic_s8(_D14, (int8x8_t)vcgt_f32(v29, (float32x2_t)v62));
          if ((float)(vaddv_f32(vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v69, v70), (float32x2_t)vzip2_s32(v69, v70))))
                     + sqrtf(vaddv_f32((float32x2_t)vbic_s8(_D14, (int8x8_t)vcgt_f32(v29, (float32x2_t)v64))))) >= 3.0)
            goto LABEL_30;
          goto LABEL_29;
        }
        v66 = (int32x2_t)vbic_s8(_D14, (int8x8_t)vcgt_f32(v29, (float32x2_t)v58));
        v67 = (int32x2_t)vbic_s8(_D14, (int8x8_t)vcgt_f32(v29, vabs_f32(v65)));
        v41 = v85;
        v50 = v87;
        if ((float)(sqrtf(vaddv_f32((float32x2_t)vbic_s8(_D14, (int8x8_t)vcgt_f32(v29, (float32x2_t)v62))))
                   + vaddv_f32(vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v66, v67), (float32x2_t)vzip2_s32(v66, v67))))) >= 3.0)
          goto LABEL_28;
      }
      else
      {
        v58 = 0;
        v60 = 0;
        v62 = 0;
        v64 = 0;
        if (v47 == 1.0)
          goto LABEL_29;
      }
      v16 = (char *)malloc_type_realloc(v16, 4 * (a7 + 3), 0x100004052888210uLL);
      v68 = (unsigned int *)&v16[4 * a7];
      *v68 = v50;
      v68[1] = v54;
      v68[2] = v51;
      a7 += 3;
      if (v94)
        goto LABEL_28;
LABEL_29:
      v71 = a7;
      a7 += 3;
      v16 = (char *)malloc_type_realloc(v16, 4 * a7, 0x100004052888210uLL);
      v72 = (unsigned int *)&v16[4 * v71];
      *v72 = v50;
      v72[1] = v51;
      v72[2] = v53;
      if (!v94)
      {
        v75 = a7;
        goto LABEL_33;
      }
LABEL_30:
      v73 = (int32x2_t)vbic_s8(_D14, (int8x8_t)vcgt_f32(v29, (float32x2_t)v58));
      v74 = (int32x2_t)vbic_s8(_D14, (int8x8_t)vcgt_f32(v29, (float32x2_t)v64));
      if ((float)(sqrtf(vaddv_f32((float32x2_t)vbic_s8(_D14, (int8x8_t)vcgt_f32(v29, (float32x2_t)v60))))
                 + vaddv_f32(vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v74, v73), (float32x2_t)vzip2_s32(v74, v73))))) < 3.0)
      {
        v75 = a7;
LABEL_33:
        v16 = (char *)malloc_type_realloc(v16, 4 * (a7 + 3), 0x100004052888210uLL);
        *(_DWORD *)&v16[4 * v75] = v50;
        v76 = &v16[4 * a7];
        *((_DWORD *)v76 + 1) = v53;
        *((_DWORD *)v76 + 2) = (int)(float)((float)(v88 * (float)v44) / v46) % v15 + v90;
        a7 += 3;
      }
      v47 = v92;
      if (v41 == v44)
        goto LABEL_35;
    }
  }
LABEL_36:
  *v78 = (unsigned int *)v16;
  return a7;
}

- (BOOL)_setupVertexBuffer
{
  int v3;
  unint64_t v4;
  id v5;
  uint64_t v6;
  double v7;
  float64x2_t v8;
  int32x2_t v9;
  uint64_t v10;
  unsigned int maxVertexCircles;
  int v12;
  int v13;
  float v14;
  int v15;
  _OWORD *v16;
  int v17;
  int v18;
  float32x2_t v19;
  float v20;
  int32x2_t v21;
  double v22;
  __int128 v23;
  uint64_t v24;
  double v25;
  double v26;
  uint64_t v27;
  double v28;
  double v29;
  unsigned int v30;
  unsigned int v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  MTLBuffer *v37;
  MTLBuffer *vertexBuffer;
  void *v39;
  id v40;
  MTLBuffer *v41;
  MTLBuffer *indexBuffer;
  uint64_t v44;

  v3 = -[SUICFlamesViewMetal _numVerticesPerCircle](self, "_numVerticesPerCircle");
  v4 = self->_maxVertexCircles * v3;
  self->_numVertices = v4;
  v5 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 32 * v4));
  v6 = objc_msgSend(v5, "mutableBytes");
  v10 = v6;
  maxVertexCircles = self->_maxVertexCircles;
  if (maxVertexCircles)
  {
    v12 = 0;
    v13 = 0;
    v14 = (float)v3;
    v8 = (float64x2_t)vdupq_n_s64(0x401921FB54442D18uLL);
    do
    {
      ++v12;
      if (v3 >= 1)
      {
        v15 = 0;
        v16 = (_OWORD *)(v6 + 32 * v13);
        do
        {
          if (self->_mode == 1)
          {
            v17 = v15 & 1;
            v18 = v15++ | 1;
            v19.f32[0] = (float)v18 / v14;
            v20 = (double)v15 + (double)(v17 - 1);
            v19.i32[1] = fminf((float)(v20 / v14) - floorf(v20 / v14), 1.0);
            v21 = (int32x2_t)vcvt_f32_f64(vmulq_f64(vcvtq_f64_f32(v19), v8));
          }
          else
          {
            v22 = (float)((float)v15 / v14) * 6.28318531;
            *(float *)&v22 = v22;
            ++v15;
            v21 = vdup_lane_s32(*(int32x2_t *)&v22, 0);
          }
          *(float *)v9.i32 = (float)v12 / (float)maxVertexCircles;
          *(int32x2_t *)&v23 = vzip1_s32(v9, v21);
          v21.i32[0] = v9.i32[0];
          *((int32x2_t *)&v23 + 1) = v21;
          *v16 = v23;
          v16 += 2;
          ++v13;
        }
        while (v15 != v3);
        maxVertexCircles = self->_maxVertexCircles;
      }
    }
    while (v12 < maxVertexCircles);
  }
  v44 = 0;
  *(float *)&v7 = self->_auraMaxSubdivisionLevel;
  *(float *)v8.f64 = self->_auraMinSubdivisionLevel;
  v24 = -[SUICFlamesViewMetal _generateIndicesForNumCircleShapes:withMaxSubdivisionLevel:startingWithNumSubdivisionLevel:forIndices:atStartIndex:withFill:withCullingForAura:forVertices:](self, "_generateIndicesForNumCircleShapes:withMaxSubdivisionLevel:startingWithNumSubdivisionLevel:forIndices:atStartIndex:withFill:withCullingForAura:forVertices:", self->_auraVertexCircles, &v44, 0, 1, 0, v6, v7, v8.f64[0]);
  self->_numAuraIndices = v24;
  *(float *)&v25 = self->_auraMaxSubdivisionLevel;
  *(float *)&v26 = self->_auraMinSubdivisionLevel;
  v27 = -[SUICFlamesViewMetal _generateIndicesForNumCircleShapes:withMaxSubdivisionLevel:startingWithNumSubdivisionLevel:forIndices:atStartIndex:withFill:withCullingForAura:forVertices:](self, "_generateIndicesForNumCircleShapes:withMaxSubdivisionLevel:startingWithNumSubdivisionLevel:forIndices:atStartIndex:withFill:withCullingForAura:forVertices:", self->_auraVertexCircles, &v44, v24, 1, 1, v10, v25, v26);
  self->_numAuraIndicesCulled = v27;
  *(float *)&v28 = self->_maxSubdivisionLevel;
  LODWORD(v29) = LODWORD(v28);
  v30 = -[SUICFlamesViewMetal _generateIndicesForNumCircleShapes:withMaxSubdivisionLevel:startingWithNumSubdivisionLevel:forIndices:atStartIndex:withFill:withCullingForAura:forVertices:](self, "_generateIndicesForNumCircleShapes:withMaxSubdivisionLevel:startingWithNumSubdivisionLevel:forIndices:atStartIndex:withFill:withCullingForAura:forVertices:", 1, &v44, v27, 1, 0, v10, v28, v29);
  self->_numWaveIndices = v30;
  self->_numWaveIndices = v30 - self->_numAuraIndicesCulled;
  v31 = self->_numAuraIndicesCulled - self->_numAuraIndices;
  self->_numAuraIndicesCulled = v31;
  v32 = 4 * (self->_numAuraIndices + self->_numWaveIndices + v31);
  v33 = objc_alloc(MEMORY[0x1E0C99D50]);
  v34 = (void *)objc_msgSend(v33, "initWithBytesNoCopy:length:freeWhenDone:", v44, v32, 1);
  -[MTKView device](self, "device");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_retainAutorelease(v5);
  v37 = (MTLBuffer *)objc_msgSend(v35, "newBufferWithBytes:length:options:", objc_msgSend(v36, "bytes"), objc_msgSend(v36, "length"), 0);
  vertexBuffer = self->_vertexBuffer;
  self->_vertexBuffer = v37;

  self->_numVertices = (unint64_t)objc_msgSend(v36, "length") >> 5;
  -[MTKView device](self, "device");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_retainAutorelease(v34);
  v41 = (MTLBuffer *)objc_msgSend(v39, "newBufferWithBytes:length:options:", objc_msgSend(v40, "bytes"), objc_msgSend(v40, "length"), 0);
  indexBuffer = self->_indexBuffer;
  self->_indexBuffer = v41;

  self->_numIndices = (unint64_t)objc_msgSend(v40, "length") >> 1;
  return 1;
}

- (BOOL)_initMetalAndSetupDisplayLink:(BOOL)a3
{
  _BOOL4 v3;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  float v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  float v22;
  id v23;
  void *v24;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v44;
  const char *v45;
  uint64_t v46;

  v3 = a3;
  v46 = *MEMORY[0x1E0C80C00];
  v5 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v6 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v44 = 136315138;
    v45 = "-[SUICFlamesViewMetal _initMetalAndSetupDisplayLink:]";
    _os_log_impl(&dword_1A3752000, v6, OS_LOG_TYPE_DEFAULT, "%s Setup Metal Rendering", (uint8_t *)&v44, 0xCu);
  }
  kdebug_trace();
  -[SUICFlamesViewMetal layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOpaque:", 0);

  -[SUICFlamesViewMetal _currentDisplayScale](self, "_currentDisplayScale");
  v9 = v8;
  -[SUICFlamesViewMetal layer](self, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContentsScale:", v9);

  -[SUICFlamesViewMetal layer](self, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentsScale");
  v13 = v12;
  -[SUICFlamesViewMetal layer](self, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v13 * v15;
  self->_viewWidth = v16;

  -[SUICFlamesViewMetal layer](self, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "contentsScale");
  v19 = v18;
  -[SUICFlamesViewMetal layer](self, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  v22 = v19 * v21;
  self->_viewHeight = v22;

  -[MTKView setDrawableSize:](self, "setDrawableSize:", self->_viewWidth, self->_viewHeight);
  v23 = MTLCreateSystemDefaultDevice();
  -[MTKView setDevice:](self, "setDevice:", v23);

  -[MTKView device](self, "device");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    v27 = *v5;
    v26 = os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR);
    if (!v26)
      return v26;
    -[SUICFlamesViewMetal _initMetalAndSetupDisplayLink:].cold.1(v27, v28, v29, v30, v31, v32, v33, v34);
    goto LABEL_15;
  }
  -[SUICFlamesViewMetal _setupVertexBuffer](self, "_setupVertexBuffer");
  if (!-[SUICFlamesViewMetal _loadPipelineLibraries](self, "_loadPipelineLibraries"))
  {
    v35 = *v5;
    v26 = os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR);
    if (!v26)
      return v26;
    -[SUICFlamesViewMetal _initMetalAndSetupDisplayLink:].cold.2(v35, v36, v37, v38, v39, v40, v41, v42);
LABEL_15:
    LOBYTE(v26) = 0;
    return v26;
  }
  if (v3)
    -[SUICFlamesViewMetal _setupDisplayLink](self, "_setupDisplayLink");
  v25 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v44 = 136315138;
    v45 = "-[SUICFlamesViewMetal _initMetalAndSetupDisplayLink:]";
    _os_log_impl(&dword_1A3752000, v25, OS_LOG_TYPE_DEFAULT, "%s Metal Rendering Setup Complete", (uint8_t *)&v44, 0xCu);
  }
  kdebug_trace();
  LOBYTE(v26) = 1;
  return v26;
}

- (id)_from:(id)a3 getRenderPipeline:(id)a4 err:(id *)a5
{
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  id v11;

  v11 = 0;
  v6 = (void *)objc_msgSend(a3, "newRenderPipelineStateWithName:options:reflection:error:", a4, 0, 0, &v11);
  v7 = v11;
  v8 = v7;
  if (v7)
    v9 = 1;
  else
    v9 = v6 == 0;
  if (v9)
    *a5 = objc_retainAutorelease(v7);

  return v6;
}

- (BOOL)_loadPipelineLibraries
{
  os_log_t *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  MTLRenderPipelineState *v11;
  id v12;
  MTLRenderPipelineState *v13;
  MTLRenderPipelineState *v14;
  id v15;
  MTLRenderPipelineState *v16;
  MTLRenderPipelineState *v17;
  id v18;
  MTLRenderPipelineState *v19;
  MTLRenderPipelineState *v20;
  MTLRenderPipelineState *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  unint64_t v27;
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
  const __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  MTLRenderPipelineState *v42;
  id v43;
  MTLRenderPipelineState **pipelineState;
  MTLRenderPipelineState *v45;
  void *v46;
  void *v47;
  MTLRenderPipelineState *v48;
  id v49;
  MTLRenderPipelineState *v50;
  void *v51;
  void *v52;
  void *v53;
  MTLRenderPipelineState *v54;
  MTLRenderPipelineState *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  id v60;
  MTLRenderPipelineState *v61;
  NSObject *v62;
  NSObject *v63;
  BOOL v64;
  NSObject *v65;
  void *v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  uint8_t buf[4];
  const char *v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v3 = (os_log_t *)MEMORY[0x1E0CFE6A0];
  v4 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v79 = "-[SUICFlamesViewMetal _loadPipelineLibraries]";
    _os_log_impl(&dword_1A3752000, v4, OS_LOG_TYPE_DEFAULT, "%s Started Loading Pipeline Libraries", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundlePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("SUICPipelineState.pipelinelib"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v9 = 0;
    v10 = 0;
    goto LABEL_8;
  }
  -[MTKView device](self, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = 0;
  v9 = (void *)objc_msgSend(v8, "newPipelineLibraryWithFilePath:error:", v7, &v77);
  v10 = v77;

  if (!v9)
    goto LABEL_8;
  v76 = v10;
  -[SUICFlamesViewMetal _from:getRenderPipeline:err:](self, "_from:getRenderPipeline:err:", v9, CFSTR("Flame Pipeline"), &v76);
  v11 = (MTLRenderPipelineState *)objc_claimAutoreleasedReturnValue();
  v12 = v76;

  v13 = self->_pipelineState[0];
  self->_pipelineState[0] = v11;

  v75 = v12;
  -[SUICFlamesViewMetal _from:getRenderPipeline:err:](self, "_from:getRenderPipeline:err:", v9, CFSTR("Dictation Pipeline"), &v75);
  v14 = (MTLRenderPipelineState *)objc_claimAutoreleasedReturnValue();
  v15 = v75;

  v16 = self->_pipelineState[1];
  self->_pipelineState[1] = v14;

  v74 = v15;
  -[SUICFlamesViewMetal _from:getRenderPipeline:err:](self, "_from:getRenderPipeline:err:", v9, CFSTR("Training Pipeline"), &v74);
  v17 = (MTLRenderPipelineState *)objc_claimAutoreleasedReturnValue();
  v18 = v74;

  v19 = self->_pipelineState[2];
  self->_pipelineState[2] = v17;

  v73 = v18;
  -[SUICFlamesViewMetal _from:getRenderPipeline:err:](self, "_from:getRenderPipeline:err:", v9, CFSTR("Aura Pipeline"), &v73);
  v20 = (MTLRenderPipelineState *)objc_claimAutoreleasedReturnValue();
  v10 = v73;

  v21 = self->_pipelineState[3];
  self->_pipelineState[3] = v20;

  if (v10)
  {
LABEL_8:
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
      -[SUICFlamesViewMetal _loadPipelineLibraries].cold.5();
    v67 = v7;
    -[MTKView device](self, "device");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v10;
    v23 = (void *)objc_msgSend(v22, "newDefaultLibraryWithBundle:error:", v5, &v72);
    v24 = v72;

    if (!v23)
    {
      -[MTKView device](self, "device");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v25, "newDefaultLibrary");

    }
    v26 = objc_alloc_init(MEMORY[0x1E0CC6B68]);
    v27 = -[MTKView colorPixelFormat](self, "colorPixelFormat");
    objc_msgSend(v26, "colorAttachments");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setPixelFormat:", v27);

    objc_msgSend(v26, "colorAttachments");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setBlendingEnabled:", 1);

    objc_msgSend(v26, "colorAttachments");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setRgbBlendOperation:", 0);

    objc_msgSend(v26, "colorAttachments");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setSourceRGBBlendFactor:", 4);

    objc_msgSend(v26, "colorAttachments");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setDestinationRGBBlendFactor:", 5);

    objc_msgSend(v26, "setLabel:", CFSTR("Flame Pipeline"));
    if (self->_reduceMotionEnabled)
      v38 = CFSTR("siriFlameAccessibilityVertexShader");
    else
      v38 = CFSTR("siriFlameVertexShader");
    v39 = (void *)objc_msgSend(v23, "newFunctionWithName:", v38);
    objc_msgSend(v26, "setVertexFunction:", v39);

    v40 = (void *)objc_msgSend(v23, "newFunctionWithName:", CFSTR("siriFlameFragmentShader"));
    objc_msgSend(v26, "setFragmentFunction:", v40);

    -[MTKView device](self, "device");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v24;
    v42 = (MTLRenderPipelineState *)objc_msgSend(v41, "newRenderPipelineStateWithDescriptor:error:", v26, &v71);
    v43 = v71;

    pipelineState = self->_pipelineState;
    v45 = self->_pipelineState[0];
    self->_pipelineState[0] = v42;

    if (self->_pipelineState[0])
    {
      objc_msgSend(v26, "setLabel:", CFSTR("Aura Pipeline"));
      v46 = (void *)objc_msgSend(v23, "newFunctionWithName:", CFSTR("siriAuraFragmentShader"));
      objc_msgSend(v26, "setFragmentFunction:", v46);

      -[MTKView device](self, "device");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = v43;
      v48 = (MTLRenderPipelineState *)objc_msgSend(v47, "newRenderPipelineStateWithDescriptor:error:", v26, &v70);
      v49 = v70;

      v50 = self->_pipelineState[3];
      self->_pipelineState[3] = v48;

      if (!self->_pipelineState[3])
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
          -[SUICFlamesViewMetal _loadPipelineLibraries].cold.2();
        v64 = 0;
        v43 = v49;
        goto LABEL_33;
      }
      objc_msgSend(v26, "setLabel:", CFSTR("Dictation Pipeline"));
      v51 = (void *)objc_msgSend(v23, "newFunctionWithName:", CFSTR("siriDictationVertexShader"));
      objc_msgSend(v26, "setVertexFunction:", v51);

      v52 = (void *)objc_msgSend(v23, "newFunctionWithName:", CFSTR("siriDictationFragmentShader"));
      objc_msgSend(v26, "setFragmentFunction:", v52);

      -[MTKView device](self, "device");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v49;
      v54 = (MTLRenderPipelineState *)objc_msgSend(v53, "newRenderPipelineStateWithDescriptor:error:", v26, &v69);
      v43 = v69;

      v55 = self->_pipelineState[1];
      self->_pipelineState[1] = v54;

      if (self->_pipelineState[1])
      {
        objc_msgSend(v26, "setLabel:", CFSTR("Training Pipeline"));
        v56 = (void *)objc_msgSend(v23, "newFunctionWithName:", CFSTR("siriTrainingVertexShader"));
        objc_msgSend(v26, "setVertexFunction:", v56);

        v57 = (void *)objc_msgSend(v23, "newFunctionWithName:", CFSTR("siriTrainingFragmentShader"));
        objc_msgSend(v26, "setFragmentFunction:", v57);

        -[MTKView device](self, "device");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = v43;
        v59 = objc_msgSend(v58, "newRenderPipelineStateWithDescriptor:error:", v26, &v68);
        v60 = v68;

        v61 = pipelineState[2];
        pipelineState[2] = (MTLRenderPipelineState *)v59;

        v62 = *MEMORY[0x1E0CFE6A0];
        v63 = *MEMORY[0x1E0CFE6A0];
        if (pipelineState[2])
        {
          v7 = v67;
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v79 = "-[SUICFlamesViewMetal _loadPipelineLibraries]";
            _os_log_impl(&dword_1A3752000, v62, OS_LOG_TYPE_DEFAULT, "%s Finished Loading Pipeline Libraries", buf, 0xCu);
          }
          v64 = 1;
        }
        else
        {
          v7 = v67;
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            -[SUICFlamesViewMetal _loadPipelineLibraries].cold.4();
          v64 = 0;
        }
        v43 = v60;
        goto LABEL_38;
      }
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
        -[SUICFlamesViewMetal _loadPipelineLibraries].cold.3();
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
    {
      -[SUICFlamesViewMetal _loadPipelineLibraries].cold.1();
    }
    v64 = 0;
LABEL_33:
    v7 = v67;
LABEL_38:

    goto LABEL_39;
  }
  v65 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v79 = "-[SUICFlamesViewMetal _loadPipelineLibraries]";
    _os_log_impl(&dword_1A3752000, v65, OS_LOG_TYPE_DEFAULT, "%s Finished Loading Pipeline Libraries", buf, 0xCu);
  }
  v64 = 1;
LABEL_39:

  return v64;
}

- (BOOL)_resizeFromLayer:(id)a3
{
  id v4;
  _BOOL4 v5;
  double v6;
  double v7;
  double v8;
  float v9;
  double v10;
  double v11;
  double v12;
  float v13;

  v4 = a3;
  v5 = -[SUICFlamesViewMetal isRenderingEnabled](self, "isRenderingEnabled");
  if (v5)
  {
    objc_msgSend(v4, "contentsScale");
    v7 = v6;
    objc_msgSend(v4, "bounds");
    v9 = v7 * v8;
    self->_viewWidth = v9;
    objc_msgSend(v4, "contentsScale");
    v11 = v10;
    objc_msgSend(v4, "bounds");
    v13 = v11 * v12;
    self->_viewHeight = v13;
    -[MTKView setDrawableSize:](self, "setDrawableSize:", self->_viewWidth, v13);
  }

  return v5;
}

- (void)layoutSubviews
{
  void *v3;

  if (self->_isInitialized)
  {
    -[SUICFlamesViewMetal _metalLayer](self, "_metalLayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUICFlamesViewMetal _resizeFromLayer:](self, "_resizeFromLayer:", v3);

  }
  else
  {
    self->_isInitialized = -[SUICFlamesViewMetal _initMetalAndSetupDisplayLink:](self, "_initMetalAndSetupDisplayLink:", 1);
  }
  -[SUICFlamesViewMetal _updateOrthoProjection](self, "_updateOrthoProjection");
}

- (double)_currentDisplayScale
{
  void *v3;
  double v4;
  double v5;
  double v6;
  _BOOL4 v7;
  double result;

  -[SUICFlamesViewMetal traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");
  v5 = v4;

  if (v5 < 1.0)
  {
    -[UIScreen scale](self->_screen, "scale");
    v5 = v6;
  }
  v7 = -[SUICFlamesViewMetal _deviceNeeds2xFlamesWithCurrentScale:](self, "_deviceNeeds2xFlamesWithCurrentScale:", v5);
  result = 2.0;
  if (!v7)
    return v5;
  return result;
}

- (BOOL)_deviceNeeds2xFlamesWithCurrentScale:(double)a3
{
  if (_deviceNeeds2xFlamesWithCurrentScale__onceToken_0 != -1)
    dispatch_once(&_deviceNeeds2xFlamesWithCurrentScale__onceToken_0, &__block_literal_global_80);
  return a3 == 3.0 && _deviceNeeds2xFlamesWithCurrentScale__needsLowerQualityFlames_0 != 0;
}

uint64_t __60__SUICFlamesViewMetal__deviceNeeds2xFlamesWithCurrentScale___block_invoke()
{
  uint64_t result;

  result = MGGetProductType();
  _deviceNeeds2xFlamesWithCurrentScale__needsLowerQualityFlames_0 = result == 1737882206;
  return result;
}

- (void)_tearDownDisplayLink
{
  CADisplayLink *displayLink;
  MTLCommandQueue *commandQueue;

  self->_state = 4;
  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  commandQueue = self->_commandQueue;
  self->_commandQueue = 0;

}

- (BOOL)inSiriMode
{
  return -[SUICFlamesViewMetal mode](self, "mode") == 0;
}

- (BOOL)inDictationMode
{
  return -[SUICFlamesViewMetal mode](self, "mode") == 1;
}

- (BOOL)isRenderingEnabled
{
  return -[NSMutableSet count](self->_renderingDisabledReasons, "count") == 0;
}

- (BOOL)_isOriginatingProcessInBackground
{
  proc_pidoriginatorinfo();
  return 0;
}

- (void)_didSkipFrameUpdateWithReason:(id)a3 andCount:(unint64_t)a4
{
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315650;
    v8 = "-[SUICFlamesViewMetal _didSkipFrameUpdateWithReason:andCount:]";
    v9 = 2112;
    v10 = v5;
    v11 = 2048;
    v12 = a4;
    _os_log_impl(&dword_1A3752000, v6, OS_LOG_TYPE_DEFAULT, "%s Frame Skip Reason: %@; count = %lu",
      (uint8_t *)&v7,
      0x20u);
  }
  kdebug_trace();

}

- (id)_lazy_commandQueue
{
  MTLCommandQueue *commandQueue;
  void *v4;
  MTLCommandQueue *v5;
  MTLCommandQueue *v6;

  commandQueue = self->_commandQueue;
  if (!commandQueue)
  {
    -[MTKView device](self, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (MTLCommandQueue *)objc_msgSend(v4, "newCommandQueue");
    v6 = self->_commandQueue;
    self->_commandQueue = v5;

    commandQueue = self->_commandQueue;
  }
  return commandQueue;
}

- (void)_updateCurveLayer:(id)a3
{
  id v4;
  void *v5;
  float *v6;
  float32x4_t *v7;
  float v8;
  BOOL v9;
  double v10;
  SUICAudioLevelSmoother *levelSmoother;
  double v12;
  const __CFString *v13;
  uint64_t v14;
  float v15;
  float v16;
  double v17;
  float v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  float v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  void *v31;
  float32x4_t *v32;
  _BOOL4 reduceMotionEnabled;
  double frameRateScalingFactor;
  float v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  float v42;
  double v43;
  double v44;
  unsigned int numAuraIndices;
  uint64_t numAuraIndicesCulled;
  double v47;
  double v48;
  float v49;
  double v50;
  __int128 v51;
  unsigned int v52;
  unsigned int v53;
  __int128 v54;
  unsigned int v55;
  float64x2_t v56;
  float dictationBlueColor;
  MTLRenderPipelineState **v58;
  float v59;
  float *v60;
  float v61;
  float v62;
  int8x16_t v63;
  float32x2_t v64;
  int8x8_t v65;
  id WeakRetained;
  id v67;
  uint64_t v68;
  void *v69;
  BOOL v70;
  uint64_t v71;
  id v72;
  id v73;
  MTLCommandQueue *commandQueue;
  BOOL v75;
  float v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  float32x2_t v81;
  char v82;
  NSMutableArray *obj;
  id v84;
  double v85;
  float v86;
  unsigned int location;
  unsigned int v88;
  char v89;
  _QWORD v90[4];
  id v91;
  _QWORD v92[4];
  id v93;
  SUICFlamesViewMetal *v94;
  float64x2_t v95;
  __int128 v96;
  float32x4_t v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_currentFlameGroup)
  {
    v13 = CFSTR("No current flame group");
LABEL_11:
    -[SUICFlamesViewMetal _didSkipFrameUpdateWithReason:andCount:](self, "_didSkipFrameUpdateWithReason:andCount:", v13, 0);
    goto LABEL_12;
  }
  if (!self->_isInitialized)
  {
    v13 = CFSTR("not initialized");
    goto LABEL_11;
  }
  if (!-[SUICFlamesViewMetal isRenderingEnabled](self, "isRenderingEnabled"))
  {
    v13 = CFSTR("rendering disabled");
    goto LABEL_11;
  }
  -[SUICFlamesViewMetal _metalLayer](self, "_metalLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isDrawableAvailable") & 1) != 0)
  {
    v6 = -[SUICFlameGroup transitionPhasePtr](self->_currentFlameGroup, "transitionPhasePtr");
    v7 = -[SUICFlameGroup stateModifiersPtr](self->_currentFlameGroup, "stateModifiersPtr");
    v8 = *v6;
    v9 = *v6 >= 1.0;
    if (*v6 < 1.0)
    {
      v10 = v8;
      switch(self->_state)
      {
        case 0:
          v12 = v10 + self->_frameRateScalingFactor * 0.03;
          *(float *)&v12 = v12;
          *(float *)&v12 = fminf(*(float *)&v12, 1.0);
          *v6 = *(float *)&v12;
          *v7 = vmlaq_n_f32(*v7, vsubq_f32((float32x4_t)xmmword_1A377E0B0, *v7), *(float *)&v12);
          levelSmoother = self->_levelSmoother;
          LODWORD(v12) = 1064514355;
          goto LABEL_16;
        case 1:
          v12 = v10 + self->_frameRateScalingFactor * 0.03;
          *(float *)&v12 = v12;
          *(float *)&v12 = fminf(*(float *)&v12, 1.0);
          *v6 = *(float *)&v12;
          *v7 = vmlaq_n_f32(*v7, vsubq_f32((float32x4_t)xmmword_1A377E0A0, *v7), *(float *)&v12);
          levelSmoother = self->_levelSmoother;
          LODWORD(v12) = 1063675494;
LABEL_16:
          -[SUICAudioLevelSmoother setDecaySpeed:](levelSmoother, "setDecaySpeed:", v12);
          break;
        case 2:
          v15 = v10 + self->_frameRateScalingFactor * 0.02;
          v16 = fminf(v15, 1.0);
          *v6 = v16;
          *v7 = vmlaq_n_f32(*v7, vsubq_f32((float32x4_t)xmmword_1A377E090, *v7), v16);
          break;
        case 4:
          v17 = v10 + self->_frameRateScalingFactor * 0.03;
          *(float *)&v17 = v17;
          *(float *)&v17 = fminf(*(float *)&v17, 1.0);
          *v6 = *(float *)&v17;
          *v7 = vmlaq_n_f32(*v7, vsubq_f32((float32x4_t)0, *v7), *(float *)&v17);
          if (*v6 == 1.0)
          {
            *(float *)&v17 = *v6;
            -[SUICFlamesViewMetal setHidden:](self, "setHidden:", 1, v17);
          }
          break;
        default:
          break;
      }
    }
    v86 = 0.0;
    if (self->_state == 1)
    {
      -[SUICFlamesViewMetal _currentMicPowerLevel](self, "_currentMicPowerLevel");
      v86 = v18;
    }
    -[MTKView currentRenderPassDescriptor](self, "currentRenderPassDescriptor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v76 = v8;
      v75 = v9;
      v79 = v5;
      v80 = v4;
      -[SUICFlamesViewMetal _lazy_commandQueue](self, "_lazy_commandQueue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "commandBuffer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "setLabel:", CFSTR("SUICFlamesViewMetalBuffer"));
      v77 = v21;
      v78 = v19;
      objc_msgSend(v21, "renderCommandEncoderWithDescriptor:", v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setLabel:", CFSTR("SUICFlamesViewMetalEncoder"));
      -[CADisplayLink duration](self->_displayLink, "duration");
      v24 = v23;
      v84 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v99 = 0u;
      v100 = 0u;
      v101 = 0u;
      v102 = 0u;
      obj = self->_flameGroups;
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v99, v103, 16);
      if (v25)
      {
        v26 = v25;
        v82 = 0;
        v27 = v24;
        v28 = *(_QWORD *)v100;
        v29 = v27;
        v85 = v27 * 0.5;
        v81 = (float32x2_t)vdup_n_s32(0x25800000u);
        do
        {
          v30 = 0;
          do
          {
            if (*(_QWORD *)v100 != v28)
              objc_enumerationMutation(obj);
            v31 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * v30);
            v32 = (float32x4_t *)objc_msgSend(v31, "stateModifiersPtr");
            if (!self->_freezesAura || (objc_msgSend(v31, "isAura") & 1) == 0)
            {
              reduceMotionEnabled = self->_reduceMotionEnabled;
              frameRateScalingFactor = self->_frameRateScalingFactor;
              objc_msgSend(v31, "stateTime");
              v36 = v35;
              v37 = v85;
              if (reduceMotionEnabled)
              {
                v38 = 0.1;
              }
              else
              {
                v37 = v29;
                v38 = 0.25;
              }
              if (reduceMotionEnabled)
                v39 = v86 * 0.5 + 0.1;
              else
                v39 = v86 * 2.0 + 0.25;
              v40 = v36 + v37 * frameRateScalingFactor;
              *(float *)&v40 = v40;
              objc_msgSend(v31, "setStateTime:", v40);
              v41 = v38 * v32->f32[2] + v39 * (float)(v32->f32[0] + v32->f32[1]) + v32->f32[3] * 0.05;
              objc_msgSend(v31, "zTime");
              v43 = v42 + v29 * v41;
              *(float *)&v43 = v43;
              objc_msgSend(v31, "setZTime:", v43);
            }
            if (objc_msgSend(v31, "isDyingOff"))
            {
              objc_msgSend(v31, "globalAlpha");
              *(float *)&v44 = *(float *)&v44 + -0.03;
              if (*(float *)&v44 < 0.0)
                *(float *)&v44 = 0.0;
              objc_msgSend(v31, "setGlobalAlpha:", v44);
            }
            if (objc_msgSend(v31, "isAura") && !self->_mode)
            {
              v60 = (float *)objc_msgSend(v31, "transitionPhasePtr");
              if (*v60 >= 1.0)
              {
                numAuraIndices = self->_numAuraIndices;
                numAuraIndicesCulled = self->_numAuraIndicesCulled;
                v82 = 1;
              }
              else
              {
                numAuraIndices = 0;
                v61 = *v60 + dbl_1A377E0C0[!self->_reduceMotionEnabled] * self->_frameRateScalingFactor;
                v62 = fminf(v61, 1.0);
                *v60 = v62;
                v63 = (int8x16_t)vmlaq_n_f32(*v32, vsubq_f32((float32x4_t)xmmword_1A377E0D0, *v32), v62);
                *v32 = (float32x4_t)v63;
                numAuraIndicesCulled = self->_numAuraIndices;
                if (*(float *)v63.i32 <= 2.2204e-16)
                {
                  v64.i32[1] = v63.i32[1];
                  v64.i32[0] = vextq_s8(v63, v63, 8uLL).u32[0];
                  v65 = vmvn_s8((int8x8_t)vcge_f32(v81, v64));
                  if ((v65.i8[4] & 1) == 0 && (v65.i8[0] & 1) == 0)
                  {
                    if (*(float *)&v63.i32[3] + 2.22044605e-16 >= 1.0)
                    {
                      WeakRetained = objc_loadWeakRetained((id *)&self->_flamesDelegate);
                      v89 = objc_opt_respondsToSelector();

                      if ((v89 & 1) != 0)
                      {
                        v67 = objc_loadWeakRetained((id *)&self->_flamesDelegate);
                        objc_msgSend(v67, "flamesViewAuraDidDisplay:", self);

                      }
                    }
                    numAuraIndices = 0;
                  }
                }
              }
            }
            else
            {
              numAuraIndices = 0;
              numAuraIndicesCulled = 0;
            }
            v98 = 0u;
            -[MTKView drawableSize](self, "drawableSize");
            *(float *)&v47 = v47;
            LODWORD(v98) = LODWORD(v47);
            -[MTKView drawableSize](self, "drawableSize");
            v49 = v48;
            *((float *)&v98 + 1) = v49;
            objc_msgSend(v22, "setVertexBuffer:offset:atIndex:", self->_vertexBuffer, 0, 0);
            -[SUICFlamesViewMetal _currentDisplayScale](self, "_currentDisplayScale");
            *(float *)&v50 = v50;
            *(_QWORD *)&v51 = v98;
            DWORD2(v51) = LODWORD(v50);
            HIDWORD(v51) = LODWORD(self->_dictationUnitSize);
            v98 = v51;
            objc_msgSend(v22, "setVertexBytes:length:atIndex:", &v98, 16, 1);
            objc_msgSend(v22, "setVertexBytes:length:atIndex:", v32, 16, 4);
            v97 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)self->_activeFrame.origin), (float64x2_t)self->_activeFrame.size);
            objc_msgSend(v22, "setVertexBytes:length:atIndex:", &v97, 16, 2);
            v96 = 0u;
            objc_msgSend(v31, "stateTime");
            v88 = v52;
            objc_msgSend(v31, "zTime");
            location = v53;
            objc_msgSend(v31, "globalAlpha");
            *(_QWORD *)&v54 = __PAIR64__(location, v88);
            *((_QWORD *)&v54 + 1) = __PAIR64__(v55, LODWORD(v86));
            v96 = v54;
            objc_msgSend(v22, "setVertexBytes:length:atIndex:", &v96, 16, 3);
            if (-[SUICFlamesViewMetal inDictationMode](self, "inDictationMode"))
            {
              v56 = *(float64x2_t *)&self->_dictationRedColor;
              *(float32x2_t *)&v56.f64[0] = vcvt_f32_f64(v56);
              dictationBlueColor = self->_dictationBlueColor;
              *(float *)&v56.f64[1] = dictationBlueColor;
              v95 = v56;
              objc_msgSend(v22, "setFragmentBytes:length:atIndex:", &v95, 16, 5);
            }
            if (v32->f32[3] <= 0.0)
            {
              numAuraIndicesCulled = self->_numWaveIndices;
              numAuraIndices = self->_numAuraIndicesCulled + self->_numAuraIndices;
              v58 = &self->_pipelineState[self->_mode];
            }
            else
            {
              v58 = &self->_pipelineState[3];
            }
            objc_msgSend(v22, "setRenderPipelineState:", *v58);
            objc_msgSend(v22, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", 3, numAuraIndicesCulled, 1, self->_indexBuffer, 4 * numAuraIndices);
            objc_msgSend(v31, "globalAlpha");
            if (v59 == 0.0)
              objc_msgSend(v84, "addObject:", v31);
            ++v30;
          }
          while (v26 != v30);
          v68 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v99, v103, 16);
          v26 = v68;
        }
        while (v68);
      }
      else
      {
        v82 = 0;
      }

      objc_msgSend(v22, "endEncoding");
      -[MTKView currentDrawable](self, "currentDrawable");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "presentDrawable:", v69);

      if (self->_freezesAura)
      {
        v70 = (v76 >= 1.0) & v82;
        v4 = v80;
      }
      else
      {
        v4 = v80;
        v70 = v75;
      }
      v19 = v78;
      self->_transitionFinished = v70;
      v71 = MEMORY[0x1E0C809B0];
      v92[0] = MEMORY[0x1E0C809B0];
      v92[1] = 3221225472;
      v92[2] = __41__SUICFlamesViewMetal__updateCurveLayer___block_invoke;
      v92[3] = &unk_1E4A556F0;
      v93 = v84;
      v94 = self;
      v72 = v84;
      v90[0] = v71;
      v90[1] = 3221225472;
      v90[2] = __41__SUICFlamesViewMetal__updateCurveLayer___block_invoke_2;
      v90[3] = &unk_1E4A55718;
      v91 = (id)MEMORY[0x1A8593D14](v92);
      v73 = v91;
      objc_msgSend(v77, "addCompletedHandler:", v90);
      objc_msgSend(v77, "commit");

      v5 = v79;
    }
    if (!v4)
    {
      commandQueue = self->_commandQueue;
      self->_commandQueue = 0;

    }
  }
  else
  {
    v14 = _updateCurveLayer__skipCount++;
    if (__ROR8__(0x1CAC083126E978D5 * v14, 3) <= 0x4189374BC6A7EFuLL)
      -[SUICFlamesViewMetal _didSkipFrameUpdateWithReason:andCount:](self, "_didSkipFrameUpdateWithReason:andCount:", CFSTR("no drawable available"));
  }

LABEL_12:
}

_BYTE *__41__SUICFlamesViewMetal__updateCurveLayer___block_invoke(uint64_t a1)
{
  _BYTE *result;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1112), "removeObjectsInArray:", *(_QWORD *)(a1 + 32));
  result = *(_BYTE **)(a1 + 40);
  if (result[1216])
    return (_BYTE *)objc_msgSend(result, "_didFinishTransition");
  return result;
}

void __41__SUICFlamesViewMetal__updateCurveLayer___block_invoke_2(uint64_t a1)
{
  _QWORD block[4];
  id v3;

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__SUICFlamesViewMetal__updateCurveLayer___block_invoke_3;
    block[3] = &unk_1E4A54C70;
    v3 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __41__SUICFlamesViewMetal__updateCurveLayer___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)_indexCache
{
  if (_indexCache_onceToken_0 != -1)
    dispatch_once(&_indexCache_onceToken_0, &__block_literal_global_97);
  return (id)_indexCache_sIndexCache_0;
}

uint64_t __34__SUICFlamesViewMetal__indexCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)_indexCache_sIndexCache_0;
  _indexCache_sIndexCache_0 = (uint64_t)v0;

  return objc_msgSend((id)_indexCache_sIndexCache_0, "setCountLimit:", sIndexCacheSize_0);
}

+ (void)setIndexCacheSize:(unint64_t)a3
{
  id v3;

  sIndexCacheSize_0 = a3;
  objc_msgSend(a1, "_indexCache");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCountLimit:", sIndexCacheSize_0);

}

- (float)_currentMicPowerLevel
{
  id WeakRetained;
  int v4;
  int v5;
  double v6;
  float v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_flamesDelegate);
  objc_msgSend(WeakRetained, "audioLevelForFlamesView:", self);
  v5 = v4;

  LODWORD(v6) = v5;
  -[SUICAudioLevelSmoother smoothedLevelForMicPower:](self->_levelSmoother, "smoothedLevelForMicPower:", v6);
  return v7 * 0.95 + 0.05;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUICFlamesViewMetal;
  -[SUICFlamesViewMetal traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[SUICFlamesViewMetal traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayScale");
    v7 = v6;
    objc_msgSend(v4, "displayScale");
    if (v7 != v8)
    {
      -[SUICFlamesViewMetal resetAndReinitialize:](self, "resetAndReinitialize:", 1);
      -[SUICFlamesViewMetal _setValuesForFidelity:](self, "_setValuesForFidelity:", self->_fidelity);
      -[SUICFlamesViewMetal setNeedsLayout](self, "setNeedsLayout");
    }

  }
}

- (SUICFlamesViewProvidingDelegate)flamesDelegate
{
  return (SUICFlamesViewProvidingDelegate *)objc_loadWeakRetained((id *)&self->_flamesDelegate);
}

- (BOOL)accelerateTransitions
{
  return self->_accelerateTransitions;
}

- (void)setAccelerateTransitions:(BOOL)a3
{
  self->_accelerateTransitions = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)showAura
{
  return self->_showAura;
}

- (void)setShowAura:(BOOL)a3
{
  self->_showAura = a3;
}

- (CGRect)activeFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_activeFrame.origin.x;
  y = self->_activeFrame.origin.y;
  width = self->_activeFrame.size.width;
  height = self->_activeFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (UIColor)dictationColor
{
  return self->_dictationColor;
}

- (BOOL)freezesAura
{
  return self->_freezesAura;
}

- (void)setFreezesAura:(BOOL)a3
{
  self->_freezesAura = a3;
}

- (double)horizontalScaleFactor
{
  return self->_horizontalScaleFactor;
}

- (int64_t)mode
{
  return self->_mode;
}

- (UIImage)overlayImage
{
  return self->_overlayImage;
}

- (BOOL)reduceFrameRate
{
  return self->_reduceFrameRate;
}

- (void)setReduceFrameRate:(BOOL)a3
{
  self->_reduceFrameRate = a3;
}

- (BOOL)reduceThinkingFramerate
{
  return self->_reduceThinkingFramerate;
}

- (void)setReduceThinkingFramerate:(BOOL)a3
{
  self->_reduceThinkingFramerate = a3;
}

- (BOOL)renderInBackground
{
  return self->_renderInBackground;
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong((id *)&self->_overlayImage, 0);
  objc_storeStrong((id *)&self->_dictationColor, 0);
  objc_destroyWeak((id *)&self->_flamesDelegate);
  objc_storeStrong((id *)&self->_indexBuffer, 0);
  objc_storeStrong((id *)&self->_vertexBuffer, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  for (i = 3; i != -1; --i)
    objc_storeStrong((id *)&self->_pipelineState[i], 0);
  objc_storeStrong((id *)&self->_levelSmoother, 0);
  objc_storeStrong((id *)&self->_overlayImageView, 0);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_currentFlameGroup, 0);
  objc_storeStrong((id *)&self->_flameGroups, 0);
  objc_storeStrong((id *)&self->_renderingDisabledReasons, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

- (void)_initMetalAndSetupDisplayLink:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A3752000, a1, a3, "%s Metal is not supported on this device", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_initMetalAndSetupDisplayLink:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A3752000, a1, a3, "%s Unable to setup pipeline library", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_loadPipelineLibraries
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1A3752000, v0, v1, "%s Unable to load pipelines: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

@end
