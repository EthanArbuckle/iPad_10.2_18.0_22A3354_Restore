@implementation SUICFlamesViewLegacy

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
    -[SUICFlamesViewLegacy _currentDisplayScale](self, "_currentDisplayScale", a3);
    v5 = v4 * 6.0;
    v6 = v4 * self->_activeFrame.size.width * self->_horizontalScaleFactor;
    *(float *)&v4 = v6;
    self->_maxSubdivisionLevel = logf(roundf((float)(fmaxf(v5, *(float *)&v4) / v5) / 3.0) * 4.0) / 0.69315;
    v7 = v6 / ((float)-[SUICFlamesViewLegacy _numVerticesPerCircle](self, "_numVerticesPerCircle") * 0.25);
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

- (SUICFlamesViewLegacy)initWithFrame:(CGRect)a3 screen:(id)a4 fidelity:(int64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  SUICFlamesViewLegacy *v13;
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
  uint64_t v29;
  EAGLContext *eaglContext;
  _BOOL4 v31;
  NSMutableArray *v32;
  NSMutableArray *flameGroups;
  SUICFlameGroup *v34;
  SUICFlameGroup *currentFlameGroup;
  uint64_t v36;
  NSMutableSet *renderingDisabledReasons;
  SUICFlamesViewLegacy *v38;
  objc_super v40;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a4;
  v40.receiver = self;
  v40.super_class = (Class)SUICFlamesViewLegacy;
  v13 = -[SUICFlamesViewLegacy initWithFrame:](&v40, sel_initWithFrame_, x, y, width, height);
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
    -[SUICFlamesViewLegacy setMode:](v13, "setMode:", 0);
    v13->_fidelity = a5;
    -[SUICFlamesViewLegacy _setValuesForFidelity:](v13, "_setValuesForFidelity:", a5);
    -[SUICFlamesViewLegacy bounds](v13, "bounds");
    v13->_activeFrame.origin.x = v25;
    v13->_activeFrame.origin.y = v26;
    v13->_currentContextCount = 0;
    v13->_activeFrame.size.width = v27;
    v13->_activeFrame.size.height = v28;
    v13->_horizontalScaleFactor = 1.0;
    v13->_frameRateScalingFactor = 1.0;
    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD0958]), "initWithAPI:", 2);
    eaglContext = v13->_eaglContext;
    v13->_eaglContext = (EAGLContext *)v29;

    if (!v13->_eaglContext
      || (v31 = -[SUICFlamesViewLegacy _setCurrentContext](v13, "_setCurrentContext"),
          -[SUICFlamesViewLegacy _restoreCurrentContext](v13, "_restoreCurrentContext"),
          !v31))
    {
      v38 = 0;
      goto LABEL_7;
    }
    v13->_state = 0;
    v13->_dictationRedColor = 1.0;
    v13->_dictationGreenColor = 1.0;
    v13->_dictationBlueColor = 1.0;
    v32 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    flameGroups = v13->_flameGroups;
    v13->_flameGroups = v32;

    v34 = objc_alloc_init(SUICFlameGroup);
    currentFlameGroup = v13->_currentFlameGroup;
    v13->_currentFlameGroup = v34;

    -[NSMutableArray addObject:](v13->_flameGroups, "addObject:", v13->_currentFlameGroup);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v36 = objc_claimAutoreleasedReturnValue();
    renderingDisabledReasons = v13->_renderingDisabledReasons;
    v13->_renderingDisabledReasons = (NSMutableSet *)v36;

  }
  v38 = v13;
LABEL_7:

  return v38;
}

- (SUICFlamesViewLegacy)initWithFrame:(CGRect)a3 screenScale:(double)a4 fidelity:(int64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v11;
  SUICFlamesViewLegacy *v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SUICFlamesViewLegacy initWithFrame:screen:fidelity:](self, "initWithFrame:screen:fidelity:", v11, a5, x, y, width, height);

  return v12;
}

- (void)dealloc
{
  void *v3;
  EAGLContext *eaglContext;
  objc_super v5;

  -[SUICFlamesViewLegacy _tearDownDisplayLink](self, "_tearDownDisplayLink");
  -[SUICFlamesViewLegacy _cleanupGL](self, "_cleanupGL");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[SUICFlamesViewLegacy _restoreCurrentContext](self, "_restoreCurrentContext");
  eaglContext = self->_eaglContext;
  self->_eaglContext = 0;

  v5.receiver = self;
  v5.super_class = (Class)SUICFlamesViewLegacy;
  -[SUICFlamesViewLegacy dealloc](&v5, sel_dealloc);
}

- (void)didMoveToSuperview
{
  void *v3;
  void *v4;

  -[SUICFlamesViewLegacy superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SUICFlamesViewLegacy _setupDisplayLink](self, "_setupDisplayLink");
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUICFlamesViewLegacy setBackgroundColor:](self, "setBackgroundColor:", v4);

    -[SUICFlamesViewLegacy setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  }
  else
  {
    -[SUICFlamesViewLegacy _tearDownDisplayLink](self, "_tearDownDisplayLink");
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
    -[SUICFlamesViewLegacy _tearDownDisplayLink](self, "_tearDownDisplayLink");
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
    -[SUICFlamesViewLegacy _setPreferredFramesPerSecond](self, "_setPreferredFramesPerSecond", (_QWORD)v15);
    -[SUICFlamesViewLegacy _updateDisplayLinkPausedState](self, "_updateDisplayLinkPausedState");
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
  if (_supportsAdaptiveFramerate_onceToken != -1)
    dispatch_once(&_supportsAdaptiveFramerate_onceToken, &__block_literal_global_0);
  return _supportsAdaptiveFramerate_supportsAdaptiveFramerate;
}

uint64_t __50__SUICFlamesViewLegacy__supportsAdaptiveFramerate__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  _supportsAdaptiveFramerate_supportsAdaptiveFramerate = result;
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
      v3 = qword_1A377E0E8[state];
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
      switch(mode)
      {
        case 2:
          goto LABEL_18;
        case 1:
          v3 = 30;
          break;
        case 0:
LABEL_18:
          if (self->_state != 2)
            v3 = 30;
          break;
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
      -[SUICFlamesViewLegacy _setValuesForFidelity:](self, "_setValuesForFidelity:", 0);
    if (self->_isInitialized)
      -[SUICFlamesViewLegacy _initGLAndSetupDisplayLink:](self, "_initGLAndSetupDisplayLink:", 1);
  }
}

- (void)setHidden:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SUICFlamesViewLegacy;
  -[SUICFlamesViewLegacy setHidden:](&v5, sel_setHidden_);
  if (v3)
  {
    -[SUICFlamesViewLegacy _tearDownDisplayLink](self, "_tearDownDisplayLink");
  }
  else if (self->_isInitialized)
  {
    -[SUICFlamesViewLegacy _setupDisplayLink](self, "_setupDisplayLink");
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
  v9.super_class = (Class)SUICFlamesViewLegacy;
  -[SUICFlamesViewLegacy setFrame:](&v9, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (!self->_hasCustomActiveFrame)
  {
    -[SUICFlamesViewLegacy bounds](self, "bounds");
    self->_activeFrame.origin.x = v4;
    self->_activeFrame.origin.y = v5;
    self->_activeFrame.size.width = v6;
    self->_activeFrame.size.height = v7;
  }
  if (self->_mode == 1)
  {
    -[SUICFlamesViewLegacy _setValuesForFidelity:](self, "_setValuesForFidelity:", 0);
    if (self->_isInitialized)
      -[SUICFlamesViewLegacy _initGLAndSetupDisplayLink:](self, "_initGLAndSetupDisplayLink:", 1);
  }
  overlayImageView = self->_overlayImageView;
  -[SUICFlamesViewLegacy frame](self, "frame");
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
  v8.super_class = (Class)SUICFlamesViewLegacy;
  -[SUICFlamesViewLegacy setBounds:](&v8, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (!self->_hasCustomActiveFrame)
  {
    -[SUICFlamesViewLegacy bounds](self, "bounds");
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
    -[SUICFlamesViewLegacy _setValuesForFidelity:](self, "_setValuesForFidelity:", 0);
    if (self->_isInitialized)
      -[SUICFlamesViewLegacy _initGLAndSetupDisplayLink:](self, "_initGLAndSetupDisplayLink:", 1);
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
    -[SUICFlamesViewLegacy frame](self, "frame");
    -[UIImageView setFrame:](v7, "setFrame:");
    -[SUICFlamesViewLegacy addSubview:](self, "addSubview:", self->_overlayImageView);
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
  _BOOL4 v3;

  self->_renderInBackground = a3;
  v3 = a3;
  -[EAGLContext setParameter:to:](self->_eaglContext, "setParameter:to:", 321, &v3);
}

- (BOOL)flamesPaused
{
  return self->_flamesPaused;
}

- (void)setFlamesPaused:(BOOL)a3
{
  self->_flamesPaused = a3;
  -[SUICFlamesViewLegacy _setPreferredFramesPerSecond](self, "_setPreferredFramesPerSecond");
  -[SUICFlamesViewLegacy _updateDisplayLinkPausedState](self, "_updateDisplayLinkPausedState");
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
  SUICFlamesViewLegacy *v18;

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
  v18 = -[SUICFlamesViewLegacy initWithFrame:screen:fidelity:]([SUICFlamesViewLegacy alloc], "initWithFrame:screen:fidelity:", v17, a6, v16, v15, v14, v13);

  -[SUICFlamesViewLegacy setRenderInBackground:](v18, "setRenderInBackground:", v7);
  -[SUICFlamesViewLegacy setActiveFrame:](v18, "setActiveFrame:", x, y, width, height);
  -[SUICFlamesViewLegacy _prewarmShaders](v18, "_prewarmShaders");

}

- (void)setHorizontalScaleFactor:(double)a3
{
  void *v4;
  CGAffineTransform v5;

  self->_horizontalScaleFactor = a3;
  if (a3 != 0.0)
  {
    -[SUICFlamesViewLegacy layer](self, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    CGAffineTransformMakeScale(&v5, 1.0 / self->_horizontalScaleFactor, 1.0);
    objc_msgSend(v4, "setAffineTransform:", &v5);

    -[SUICFlamesViewLegacy _setValuesForFidelity:](self, "_setValuesForFidelity:", self->_fidelity);
  }
}

- (void)_prewarmShaders
{
  self->_isInitialized = -[SUICFlamesViewLegacy _initGLAndSetupDisplayLink:](self, "_initGLAndSetupDisplayLink:", 0);
  -[SUICFlamesViewLegacy _updateCurveLayer:](self, "_updateCurveLayer:", self->_displayLink);
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
    -[SUICFlamesViewLegacy _initGLAndSetupDisplayLink:](self, "_initGLAndSetupDisplayLink:", 1);
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
  -[SUICFlamesViewLegacy _updateCurveLayer:](self, "_updateCurveLayer:", self->_displayLink);

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
  {
    -[NSMutableSet removeObject:](renderingDisabledReasons, "removeObject:", v6);
  }
  else
  {
    -[NSMutableSet addObject:](renderingDisabledReasons, "addObject:", v6);
    if (!self->_renderInBackground)
      glFinish();
  }
  if (-[SUICFlamesViewLegacy isRenderingEnabled](self, "isRenderingEnabled"))
    -[SUICFlamesViewLegacy setNeedsLayout](self, "setNeedsLayout");

}

- (BOOL)_setCurrentContext
{
  EAGLContext *v3;
  EAGLContext *v4;
  int64_t currentContextCount;
  char v6;

  objc_msgSend(MEMORY[0x1E0CD0958], "currentContext");
  v3 = (EAGLContext *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  currentContextCount = self->_currentContextCount;
  if (currentContextCount <= 0 && v3 != self->_eaglContext)
  {
    objc_storeStrong((id *)&self->_previousContext, v3);
    currentContextCount = self->_currentContextCount;
  }
  self->_currentContextCount = currentContextCount + 1;
  v6 = objc_msgSend(MEMORY[0x1E0CD0958], "setCurrentContext:", self->_eaglContext);

  return v6;
}

- (void)_restoreCurrentContext
{
  int64_t currentContextCount;

  currentContextCount = self->_currentContextCount;
  if (currentContextCount <= 1)
    currentContextCount = 1;
  self->_currentContextCount = currentContextCount - 1;
  if ((unint64_t)currentContextCount <= 1)
    objc_msgSend(MEMORY[0x1E0CD0958], "setCurrentContext:", self->_previousContext);
}

- (void)_reduceMotionStatusChanged:(id)a3
{
  self->_reduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  if (!self->_mode)
  {
    self->_shadersAreCompiled = 0;
    -[SUICFlamesViewLegacy resetAndReinitialize:](self, "resetAndReinitialize:", 1);
  }
}

- (void)_applicationWillResignActive:(id)a3
{
  -[SUICFlamesViewLegacy setRenderingEnabled:forReason:](self, "setRenderingEnabled:forReason:", 0, CFSTR("kSUICFlamesViewUIApplicationNotificationReason"));
}

- (void)_applicationWillEnterForeground:(id)a3
{
  -[SUICFlamesViewLegacy setRenderingEnabled:forReason:](self, "setRenderingEnabled:forReason:", 1, CFSTR("kSUICFlamesViewUIApplicationNotificationReason"));
}

- (void)_applicationDidBecomeActive:(id)a3
{
  -[SUICFlamesViewLegacy setRenderingEnabled:forReason:](self, "setRenderingEnabled:forReason:", 1, CFSTR("kSUICFlamesViewUIApplicationNotificationReason"));
}

- (void)_setupDisplayLink
{
  CADisplayLink *v3;
  CADisplayLink *displayLink;
  CADisplayLink *v5;
  void *v6;

  if ((-[SUICFlamesViewLegacy isHidden](self, "isHidden") & 1) == 0 && !self->_displayLink)
  {
    -[UIScreen displayLinkWithTarget:selector:](self->_screen, "displayLinkWithTarget:selector:", self, sel__updateCurveLayer_);
    v3 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    displayLink = self->_displayLink;
    self->_displayLink = v3;

    v5 = self->_displayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v5, "addToRunLoop:forMode:", v6, *MEMORY[0x1E0C99860]);

    -[SUICFlamesViewLegacy _setPreferredFramesPerSecond](self, "_setPreferredFramesPerSecond");
    -[SUICFlamesViewLegacy _updateDisplayLinkPausedState](self, "_updateDisplayLinkPausedState");
  }
}

- (BOOL)_setupFramebuffer
{
  unsigned int *p_framebufferHandle;
  unsigned int *p_renderbufferHandle;
  EAGLContext *eaglContext;
  void *v6;

  p_framebufferHandle = &self->_framebufferHandle;
  glGenFramebuffers(1, &self->_framebufferHandle);
  if (glGetError())
    return 0;
  p_renderbufferHandle = &self->_renderbufferHandle;
  glGenRenderbuffers(1, &self->_renderbufferHandle);
  if (glGetError())
    return 0;
  glBindFramebuffer(0x8D40u, *p_framebufferHandle);
  if (glGetError())
    return 0;
  glBindRenderbuffer(0x8D41u, *p_renderbufferHandle);
  if (glGetError())
    return 0;
  eaglContext = self->_eaglContext;
  -[SUICFlamesViewLegacy layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(eaglContext) = -[EAGLContext renderbufferStorage:fromDrawable:](eaglContext, "renderbufferStorage:fromDrawable:", 36161, v6);

  if (!(_DWORD)eaglContext)
    return 0;
  glFramebufferRenderbuffer(0x8D40u, 0x8CE0u, 0x8D41u, *p_renderbufferHandle);
  if (glGetError())
    return 0;
  glGetRenderbufferParameteriv(0x8D41u, 0x8D42u, &self->_viewWidth);
  if (glGetError())
    return 0;
  glGetRenderbufferParameteriv(0x8D41u, 0x8D43u, &self->_viewHeight);
  return !glGetError() && glCheckFramebufferStatus(0x8D40u) == 36053;
}

- (BOOL)_setupShaders
{
  BOOL v2;
  GLuint flameProgramHandle;
  GLuint auraProgramHandle;
  GLuint v6;
  GLuint v7;
  GLuint v8;
  _BOOL4 v9;
  int64_t mode;
  char **v11;
  GLuint v12;
  GLuint v13;
  char v14;
  GLuint v15;
  _BOOL4 v16;
  GLenum Error;
  GLuint v18;
  char **v19;
  _BOOL4 v20;
  float width;
  double v22;
  GLfloat x;
  GLfloat y;
  GLfloat height;
  GLfloat viewWidth;
  GLfloat viewHeight;
  double v28;
  GLfloat v29;
  GLfloat dictationRedColor;
  GLfloat dictationGreenColor;
  GLfloat dictationBlueColor;
  _BOOL4 v33;
  GLuint v34;
  int AttribLocation;
  int v36;
  int v37;
  int v38;
  int v39;
  BOOL v40;
  BOOL v41;
  GLuint v42;
  GLuint v43;
  GLenum v45;
  GLuint v46;
  GLuint shader;
  GLint params;

  if (self->_shadersAreCompiled)
    return 1;
  flameProgramHandle = self->_flameProgramHandle;
  if (flameProgramHandle)
  {
    glDeleteProgram(flameProgramHandle);
    self->_flameProgramHandle = 0;
  }
  auraProgramHandle = self->_auraProgramHandle;
  if (auraProgramHandle)
  {
    glDeleteProgram(auraProgramHandle);
    self->_auraProgramHandle = 0;
  }
  v6 = glCreateShader(0x8B31u);
  v7 = glCreateShader(0x8B30u);
  v8 = v7;
  v9 = 0;
  params = 0;
  if (v6 && v7)
  {
    glDisable(0xB71u);
    if (glGetError() || (glDisable(0xBD0u), glGetError()) || (glEnable(0xBE2u), glGetError()))
    {
      v9 = 0;
    }
    else
    {
      glBlendFunc(0x302u, 0x303u);
      v9 = glGetError() == 0;
    }
  }
  mode = self->_mode;
  if (mode == 2)
  {
    if (!v9)
      goto LABEL_54;
    glShaderSource(v6, 1, (const GLchar *const *)siriTrainingVertexShader, 0);
    if (glGetError())
      goto LABEL_54;
    glCompileShader(v6);
    if (glGetError())
      goto LABEL_54;
    glGetShaderiv(v6, 0x8B81u, &params);
    if (glGetError())
      goto LABEL_54;
    v19 = &siriTrainingFragmentShader;
  }
  else
  {
    if (mode != 1)
    {
      if (mode)
        goto LABEL_34;
      if (v9)
      {
        if (self->_reduceMotionEnabled)
          v11 = siriFlameAccessibilityVertexShader;
        else
          v11 = siriFlameVertexShader;
        glShaderSource(v6, 1, (const GLchar *const *)v11, 0);
        if (glGetError()
          || (glCompileShader(v6), glGetError())
          || (glGetShaderiv(v6, 0x8B81u, &params), glGetError())
          || (glShaderSource(v8, 1, (const GLchar *const *)siriFlameFragmentShader, 0), glGetError())
          || (glCompileShader(v8), glGetError()))
        {
          v9 = 0;
        }
        else
        {
          glGetShaderiv(v8, 0x8B81u, &params);
          v9 = glGetError() == 0;
        }
      }
      if (!self->_showAura)
      {
LABEL_34:
        v13 = 0;
        goto LABEL_35;
      }
      v12 = glCreateShader(0x8B30u);
      v13 = v12;
      v14 = !v9;
      if (!v12)
        v14 = 1;
      if ((v14 & 1) == 0)
      {
        glShaderSource(v12, 1, (const GLchar *const *)siriAuraFragmentShader, 0);
        if (!glGetError())
        {
          glCompileShader(v13);
          if (!glGetError())
          {
            v15 = v13;
LABEL_33:
            glGetShaderiv(v15, 0x8B81u, &params);
            v9 = glGetError() == 0;
LABEL_35:
            v16 = 0;
            if (!v9)
              goto LABEL_56;
            if (!params)
              goto LABEL_56;
            self->_flameProgramHandle = glCreateProgram();
            Error = glGetError();
            v16 = 0;
            if (Error)
              goto LABEL_56;
            v18 = self->_flameProgramHandle;
            if (!v18)
              goto LABEL_56;
            glAttachShader(v18, v6);
            if (!glGetError())
            {
              glAttachShader(self->_flameProgramHandle, v8);
              if (!glGetError())
              {
                glLinkProgram(self->_flameProgramHandle);
                if (!glGetError())
                {
                  glGetProgramiv(self->_flameProgramHandle, 0x8B82u, &params);
                  v16 = glGetError() == 0;
                  goto LABEL_56;
                }
              }
            }
          }
        }
      }
LABEL_55:
      v16 = 0;
      goto LABEL_56;
    }
    if (!v9
      || (glShaderSource(v6, 1, (const GLchar *const *)siriDictationVertexShader, 0), glGetError())
      || (glCompileShader(v6), glGetError())
      || (glGetShaderiv(v6, 0x8B81u, &params), glGetError()))
    {
LABEL_54:
      v13 = 0;
      goto LABEL_55;
    }
    v19 = siriDictationFragmentShader;
  }
  glShaderSource(v8, 1, (const GLchar *const *)v19, 0);
  if (glGetError())
    goto LABEL_54;
  glCompileShader(v8);
  v45 = glGetError();
  v13 = 0;
  v16 = 0;
  v15 = v8;
  if (!v45)
    goto LABEL_33;
LABEL_56:
  if (params)
    v20 = v16;
  else
    v20 = 0;
  glClear(0x4000u);
  width = self->_activeFrame.size.width;
  v22 = self->_horizontalScaleFactor * width;
  x = self->_activeFrame.origin.x;
  y = self->_activeFrame.origin.y;
  *(float *)&v22 = v22;
  height = self->_activeFrame.size.height;
  glVertexAttrib4f(2u, x, y, *(GLfloat *)&v22, height);
  viewWidth = (float)self->_viewWidth;
  viewHeight = (float)self->_viewHeight;
  -[SUICFlamesViewLegacy _currentDisplayScale](self, "_currentDisplayScale");
  v29 = v28;
  glVertexAttrib4f(1u, viewWidth, viewHeight, v29, self->_dictationUnitSize);
  glVertexAttrib4f(4u, 0.0, 0.0, 0.0, 0.0);
  glVertexAttrib4f(3u, 0.0, 0.0, 0.0, 0.0);
  if (self->_mode == 1)
  {
    dictationRedColor = self->_dictationRedColor;
    dictationGreenColor = self->_dictationGreenColor;
    dictationBlueColor = self->_dictationBlueColor;
    glVertexAttrib3f(5u, dictationRedColor, dictationGreenColor, dictationBlueColor);
  }
  shader = v13;
  if (!v13)
  {
    if (!v20)
    {
      v40 = 0;
      goto LABEL_81;
    }
    goto LABEL_77;
  }
  v46 = v8;
  if (!v20)
    goto LABEL_68;
  self->_auraProgramHandle = glCreateProgram();
  v33 = 0;
  if (!glGetError())
  {
    v34 = self->_auraProgramHandle;
    if (v34)
    {
      glAttachShader(v34, v6);
      if (glGetError()
        || (glAttachShader(self->_auraProgramHandle, v13), glGetError())
        || (glLinkProgram(self->_auraProgramHandle), glGetError()))
      {
LABEL_68:
        v33 = 0;
        goto LABEL_69;
      }
      glGetProgramiv(self->_auraProgramHandle, 0x8B82u, &params);
      v33 = 0;
      if (!glGetError() && params)
      {
        glUseProgram(self->_auraProgramHandle);
        v33 = glGetError() == 0;
      }
    }
  }
LABEL_69:
  AttribLocation = glGetAttribLocation(self->_auraProgramHandle, "in_Polar");
  v36 = glGetAttribLocation(self->_auraProgramHandle, "in_FittedBounds");
  v37 = glGetAttribLocation(self->_auraProgramHandle, "in_Time_ZTime_Height_Alpha");
  v38 = glGetAttribLocation(self->_auraProgramHandle, "in_States");
  v39 = glGetAttribLocation(self->_auraProgramHandle, "in_ViewportDim_ScreenScale_UnitLength");
  glDrawArrays(4u, 0, 3);
  v40 = 0;
  if (!v33 || AttribLocation || v36 != 2 || v37 != 3)
  {
    v8 = v46;
    goto LABEL_81;
  }
  v8 = v46;
  if (v38 == 4 && v39 == 1)
  {
LABEL_77:
    glUseProgram(self->_flameProgramHandle);
    v40 = glGetError() == 0;
  }
LABEL_81:
  if (glGetAttribLocation(self->_flameProgramHandle, "in_Polar"))
    v41 = 0;
  else
    v41 = v40;
  if (glGetAttribLocation(self->_flameProgramHandle, "in_FittedBounds") != 2)
    v41 = 0;
  if (glGetAttribLocation(self->_flameProgramHandle, "in_Time_ZTime_Height_Alpha") != 3)
    v41 = 0;
  if (glGetAttribLocation(self->_flameProgramHandle, "in_States") != 4)
    v41 = 0;
  v2 = glGetAttribLocation(self->_flameProgramHandle, "in_ViewportDim_ScreenScale_UnitLength") == 1 && v41;
  if (self->_mode == 1 && glGetAttribLocation(self->_flameProgramHandle, "in_FragmentColor") != 5)
    v2 = 0;
  glDrawArrays(4u, 0, 3);
  if (v6)
    glDeleteShader(v6);
  if (v8)
    glDeleteShader(v8);
  if (shader)
    glDeleteShader(shader);
  if (v2)
  {
    self->_shadersAreCompiled = 1;
  }
  else
  {
    v42 = self->_flameProgramHandle;
    if (v42)
    {
      glDeleteProgram(v42);
      self->_flameProgramHandle = 0;
    }
    v43 = self->_auraProgramHandle;
    if (v43)
    {
      glDeleteProgram(v43);
      self->_auraProgramHandle = 0;
    }
  }
  return v2;
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

  v2.f64[0] = *(double *)(a1 + 712) * *(double *)(a1 + 664);
  v2.f64[1] = *(float64_t *)(a1 + 720);
  __asm { FMOV            V3.2S, #-1.0 }
  v8 = vmla_f32(_D3, (float32x2_t)0x4000000040000000, vdiv_f32(vmla_f32(vcvt_f32_f64(*(float64x2_t *)(a1 + 696)), (float32x2_t)0x3F0000003F000000, vcvt_f32_f64(v2)), vcvt_f32_s32(*(int32x2_t *)(a1 + 544))));
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
  signed int v50;
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
  signed int *v68;
  int32x2_t v69;
  int32x2_t v70;
  int v71;
  signed int *v72;
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
  v15 = -[SUICFlamesViewLegacy _numVerticesPerCircle](self, "_numVerticesPerCircle");
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
        v55 = *((_OWORD *)a10 + v50);
        v56 = (int)v52 % v15 + v89;
        -[SUICFlamesViewLegacy _predeterminedVertexPositionForAuraWithPolarVertex:](self, "_predeterminedVertexPositionForAuraWithPolarVertex:", *(double *)&v55);
        v58 = v57 & 0x7FFFFFFF7FFFFFFFLL;
        v53 = v56;
        -[SUICFlamesViewLegacy _predeterminedVertexPositionForAuraWithPolarVertex:](self, "_predeterminedVertexPositionForAuraWithPolarVertex:", *((double *)a10 + 2 * (int)((int)(float)((float)(v88 * (float)v44) / v46) % v15 + v90)));
        v60 = v59 & 0x7FFFFFFF7FFFFFFFLL;
        -[SUICFlamesViewLegacy _predeterminedVertexPositionForAuraWithPolarVertex:](self, "_predeterminedVertexPositionForAuraWithPolarVertex:", *((double *)a10 + 2 * (int)v51));
        v62 = v61 & 0x7FFFFFFF7FFFFFFFLL;
        -[SUICFlamesViewLegacy _predeterminedVertexPositionForAuraWithPolarVertex:](self, "_predeterminedVertexPositionForAuraWithPolarVertex:", *((double *)a10 + 2 * (int)v56));
        v64 = v63 & 0x7FFFFFFF7FFFFFFFLL;
        -[SUICFlamesViewLegacy _predeterminedVertexPositionForAuraWithPolarVertex:](self, "_predeterminedVertexPositionForAuraWithPolarVertex:", *((double *)a10 + 2 * (int)v54));
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
      v68 = (signed int *)&v16[4 * a7];
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
      v72 = (signed int *)&v16[4 * v71];
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
  int32x2_t v4;
  uint64_t v5;
  const GLvoid **v6;
  uint64_t v7;
  unsigned int v8;
  int v9;
  int v10;
  float v11;
  float64x2_t v12;
  int v13;
  int64_t mode;
  const GLvoid **v15;
  int v16;
  int v17;
  float32x2_t v18;
  float v19;
  int32x2_t v20;
  double v21;
  __int128 v22;
  void *v23;
  void *v24;
  SUICGLIndexCacheEntry *v25;
  NSObject *v26;
  double v27;
  double v28;
  uint64_t v29;
  double v30;
  double v31;
  uint64_t v32;
  double v33;
  double v34;
  unsigned int v35;
  void *v36;
  BOOL v37;
  const GLvoid *v39[2];

  v39[1] = *(const GLvoid **)MEMORY[0x1E0C80C00];
  self->_numVertices = self->_maxVertexCircles
                     * -[SUICFlamesViewLegacy _numVerticesPerCircle](self, "_numVerticesPerCircle");
  v3 = MEMORY[0x1E0C80A78]();
  v6 = &v39[-2 * v5];
  v8 = *(_DWORD *)((char *)&self->super.super.super.isa + v7);
  if (v8)
  {
    v9 = 0;
    v10 = 0;
    v11 = (float)v3;
    v12 = (float64x2_t)vdupq_n_s64(0x401921FB54442D18uLL);
    do
    {
      ++v10;
      if (v3 >= 1)
      {
        v13 = 0;
        mode = self->_mode;
        v15 = &v6[2 * v9];
        do
        {
          if (mode == 1)
          {
            v16 = v13 & 1;
            v17 = v13++ | 1;
            v18.f32[0] = (float)v17 / v11;
            v19 = (double)v13 + (double)(v16 - 1);
            v18.i32[1] = fminf((float)(v19 / v11) - floorf(v19 / v11), 1.0);
            v20 = (int32x2_t)vcvt_f32_f64(vmulq_f64(vcvtq_f64_f32(v18), v12));
          }
          else
          {
            v21 = (float)((float)v13 / v11) * 6.28318531;
            *(float *)&v21 = v21;
            ++v13;
            v20 = vdup_lane_s32(*(int32x2_t *)&v21, 0);
          }
          *(float *)v4.i32 = (float)v10 / (float)v8;
          *(int32x2_t *)&v22 = vzip1_s32(v4, v20);
          v20.i32[0] = v4.i32[0];
          *((int32x2_t *)&v22 + 1) = v20;
          *(_OWORD *)v15 = v22;
          v15 += 2;
          ++v9;
        }
        while (v13 != v3);
      }
    }
    while (v10 != v8);
  }
  v39[0] = 0;
  SUICGetIndexCacheEntryKey(self->_fidelity, self->_mode, self->_viewWidth, self->_viewHeight, self->_activeFrame.origin.x, self->_activeFrame.origin.y, self->_activeFrame.size.width, self->_activeFrame.size.height, self->_horizontalScaleFactor);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_indexCache");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKey:", v23);
  v25 = (SUICGLIndexCacheEntry *)objc_claimAutoreleasedReturnValue();

  v26 = *MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEBUG))
  {
    -[SUICFlamesViewLegacy _setupVertexBuffer].cold.1((uint64_t)v25, v26);
    if (v25)
      goto LABEL_12;
LABEL_14:
    *(float *)&v27 = self->_auraMaxSubdivisionLevel;
    *(float *)&v28 = self->_auraMinSubdivisionLevel;
    v29 = -[SUICFlamesViewLegacy _generateIndicesForNumCircleShapes:withMaxSubdivisionLevel:startingWithNumSubdivisionLevel:forIndices:atStartIndex:withFill:withCullingForAura:forVertices:](self, "_generateIndicesForNumCircleShapes:withMaxSubdivisionLevel:startingWithNumSubdivisionLevel:forIndices:atStartIndex:withFill:withCullingForAura:forVertices:", self->_auraVertexCircles, v39, 0, 1, 0, v6, v27, v28);
    self->_numAuraIndices = v29;
    *(float *)&v30 = self->_auraMaxSubdivisionLevel;
    *(float *)&v31 = self->_auraMinSubdivisionLevel;
    v32 = -[SUICFlamesViewLegacy _generateIndicesForNumCircleShapes:withMaxSubdivisionLevel:startingWithNumSubdivisionLevel:forIndices:atStartIndex:withFill:withCullingForAura:forVertices:](self, "_generateIndicesForNumCircleShapes:withMaxSubdivisionLevel:startingWithNumSubdivisionLevel:forIndices:atStartIndex:withFill:withCullingForAura:forVertices:", self->_auraVertexCircles, v39, v29, 1, 1, v6, v30, v31);
    self->_numAuraIndicesCulled = v32;
    *(float *)&v33 = self->_maxSubdivisionLevel;
    LODWORD(v34) = LODWORD(v33);
    v35 = -[SUICFlamesViewLegacy _generateIndicesForNumCircleShapes:withMaxSubdivisionLevel:startingWithNumSubdivisionLevel:forIndices:atStartIndex:withFill:withCullingForAura:forVertices:](self, "_generateIndicesForNumCircleShapes:withMaxSubdivisionLevel:startingWithNumSubdivisionLevel:forIndices:atStartIndex:withFill:withCullingForAura:forVertices:", 1, v39, v32, 1, 0, v6, v33, v34);
    self->_numWaveIndices = v35;
    self->_numWaveIndices = v35 - self->_numAuraIndicesCulled;
    self->_numAuraIndicesCulled -= self->_numAuraIndices;
    v25 = objc_alloc_init(SUICGLIndexCacheEntry);
    -[SUICGLIndexCacheEntry setNumAuraIndices:](v25, "setNumAuraIndices:", self->_numAuraIndices);
    -[SUICGLIndexCacheEntry setNumAuraIndicesCulled:](v25, "setNumAuraIndicesCulled:", self->_numAuraIndicesCulled);
    -[SUICGLIndexCacheEntry setNumWaveIndices:](v25, "setNumWaveIndices:", self->_numWaveIndices);
    -[SUICGLIndexCacheEntry setGl_indices:](v25, "setGl_indices:", v39[0]);
    objc_msgSend((id)objc_opt_class(), "_indexCache");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKey:", v25, v23);

    goto LABEL_15;
  }
  if (!v25)
    goto LABEL_14;
LABEL_12:
  self->_numAuraIndices = -[SUICGLIndexCacheEntry numAuraIndices](v25, "numAuraIndices");
  self->_numAuraIndicesCulled = -[SUICGLIndexCacheEntry numAuraIndicesCulled](v25, "numAuraIndicesCulled");
  self->_numWaveIndices = -[SUICGLIndexCacheEntry numWaveIndices](v25, "numWaveIndices");
  v39[0] = -[SUICGLIndexCacheEntry gl_indices](v25, "gl_indices");
LABEL_15:
  glGenVertexArraysOES();
  if (glGetError()
    || (glBindVertexArrayOES(), glGetError())
    || (glGenBuffers(1, &self->_vertexBufferHandle), glGetError())
    || (glGenBuffers(1, &self->_elementArrayHandle), glGetError())
    || (glBindBuffer(0x8892u, self->_vertexBufferHandle), glGetError())
    || (glBufferData(0x8892u, 16 * self->_numVertices, v6, 0x88E4u), glGetError())
    || (glBindBuffer(0x8893u, self->_elementArrayHandle), glGetError())
    || (glBufferData(0x8893u, 4 * (self->_numAuraIndicesCulled + self->_numAuraIndices + self->_numWaveIndices), v39[0], 0x88E4u), glGetError()))
  {
    v37 = 0;
  }
  else
  {
    glVertexAttribPointer(0, 4, 0x1406u, 0, 16, 0);
    v37 = 0;
    if (!glGetError())
    {
      glEnableVertexAttribArray(0);
      v37 = glGetError() == 0;
    }
  }

  return v37;
}

- (BOOL)_initGLAndSetupDisplayLink:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _BOOL4 v6;

  v3 = a3;
  -[SUICFlamesViewLegacy _cleanupGL](self, "_cleanupGL");
  -[SUICFlamesViewLegacy layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOpaque:", 0);
  -[SUICFlamesViewLegacy _currentDisplayScale](self, "_currentDisplayScale");
  objc_msgSend(v5, "setContentsScale:");
  -[SUICFlamesViewLegacy _setCurrentContext](self, "_setCurrentContext");
  if (-[SUICFlamesViewLegacy _setupFramebuffer](self, "_setupFramebuffer")
    && -[SUICFlamesViewLegacy _setupVertexBuffer](self, "_setupVertexBuffer"))
  {
    v6 = -[SUICFlamesViewLegacy _setupShaders](self, "_setupShaders");
    glClearColor(0.0, 0.0, 0.0, 0.0);
    if (v6 && v3)
      -[SUICFlamesViewLegacy _setupDisplayLink](self, "_setupDisplayLink");
  }
  else
  {
    glClearColor(0.0, 0.0, 0.0, 0.0);
    LOBYTE(v6) = 0;
  }
  -[SUICFlamesViewLegacy _restoreCurrentContext](self, "_restoreCurrentContext");

  return v6;
}

- (void)_cleanupGL
{
  GLuint flameProgramHandle;
  GLuint auraProgramHandle;

  if (self->_eaglContext)
  {
    -[SUICFlamesViewLegacy _setCurrentContext](self, "_setCurrentContext");
    flameProgramHandle = self->_flameProgramHandle;
    if (flameProgramHandle)
    {
      glDeleteProgram(flameProgramHandle);
      self->_flameProgramHandle = 0;
    }
    auraProgramHandle = self->_auraProgramHandle;
    if (auraProgramHandle)
    {
      glDeleteProgram(auraProgramHandle);
      self->_auraProgramHandle = 0;
    }
    if (self->_elementArrayHandle)
    {
      glDeleteBuffers(1, &self->_elementArrayHandle);
      self->_elementArrayHandle = 0;
    }
    if (self->_vertexBufferHandle)
    {
      glDeleteBuffers(1, &self->_vertexBufferHandle);
      self->_vertexBufferHandle = 0;
    }
    if (self->_vertexArrayObjectHandle)
    {
      glDeleteBuffers(1, &self->_vertexArrayObjectHandle);
      self->_vertexArrayObjectHandle = 0;
    }
    if (self->_framebufferHandle)
    {
      glDeleteFramebuffers(1, &self->_framebufferHandle);
      self->_framebufferHandle = 0;
    }
    if (self->_renderbufferHandle)
    {
      glDeleteRenderbuffers(1, &self->_renderbufferHandle);
      self->_renderbufferHandle = 0;
    }
    glFinish();
    -[SUICFlamesViewLegacy _restoreCurrentContext](self, "_restoreCurrentContext");
  }
}

- (BOOL)_resizeFromLayer:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[SUICFlamesViewLegacy isRenderingEnabled](self, "isRenderingEnabled"))
  {
    glBindRenderbuffer(0x8D41u, self->_renderbufferHandle);
    v5 = !glGetError()
      && -[EAGLContext renderbufferStorage:fromDrawable:](self->_eaglContext, "renderbufferStorage:fromDrawable:", 36161, v4)&& (glGetRenderbufferParameteriv(0x8D41u, 0x8D42u, &self->_viewWidth), !glGetError())&& (glGetRenderbufferParameteriv(0x8D41u, 0x8D43u, &self->_viewHeight), !glGetError())&& glCheckFramebufferStatus(0x8D40u) == 36053;
    glBindRenderbuffer(0x8D41u, self->_renderbufferHandle);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_updateOrthoProjection
{
  if (-[SUICFlamesViewLegacy isRenderingEnabled](self, "isRenderingEnabled"))
    glViewport(0, 0, self->_viewWidth, self->_viewHeight);
}

- (void)layoutSubviews
{
  void *v3;

  -[SUICFlamesViewLegacy _setCurrentContext](self, "_setCurrentContext");
  if (self->_isInitialized)
  {
    -[SUICFlamesViewLegacy layer](self, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUICFlamesViewLegacy _resizeFromLayer:](self, "_resizeFromLayer:", v3);

  }
  else
  {
    self->_isInitialized = -[SUICFlamesViewLegacy _initGLAndSetupDisplayLink:](self, "_initGLAndSetupDisplayLink:", 1);
  }
  -[SUICFlamesViewLegacy _updateOrthoProjection](self, "_updateOrthoProjection");
  -[SUICFlamesViewLegacy _restoreCurrentContext](self, "_restoreCurrentContext");
}

- (double)_currentDisplayScale
{
  void *v3;
  double v4;
  double v5;
  double v6;
  _BOOL4 v7;
  double result;

  -[SUICFlamesViewLegacy traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");
  v5 = v4;

  if (v5 < 1.0)
  {
    -[UIScreen scale](self->_screen, "scale");
    v5 = v6;
  }
  v7 = -[SUICFlamesViewLegacy _deviceNeeds2xFlamesWithCurrentScale:](self, "_deviceNeeds2xFlamesWithCurrentScale:", v5);
  result = 2.0;
  if (!v7)
    return v5;
  return result;
}

- (BOOL)_deviceNeeds2xFlamesWithCurrentScale:(double)a3
{
  if (_deviceNeeds2xFlamesWithCurrentScale__onceToken != -1)
    dispatch_once(&_deviceNeeds2xFlamesWithCurrentScale__onceToken, &__block_literal_global_66);
  return a3 == 3.0 && _deviceNeeds2xFlamesWithCurrentScale__needsLowerQualityFlames != 0;
}

uint64_t __61__SUICFlamesViewLegacy__deviceNeeds2xFlamesWithCurrentScale___block_invoke()
{
  uint64_t result;

  result = MGGetProductType();
  _deviceNeeds2xFlamesWithCurrentScale__needsLowerQualityFlames = result == 1737882206;
  return result;
}

- (void)_tearDownDisplayLink
{
  CADisplayLink *displayLink;

  self->_state = 4;
  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

}

- (BOOL)inSiriMode
{
  return -[SUICFlamesViewLegacy mode](self, "mode") == 0;
}

- (BOOL)inDictationMode
{
  return -[SUICFlamesViewLegacy mode](self, "mode") == 1;
}

- (void)stopRenderingAndCleanupGL
{
  -[SUICFlamesViewLegacy _tearDownDisplayLink](self, "_tearDownDisplayLink");
  -[SUICFlamesViewLegacy _cleanupGL](self, "_cleanupGL");
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

- (void)_updateCurveLayer:(id)a3
{
  id v4;
  void *v5;
  float *v6;
  float32x4_t *v7;
  float32x4_t v8;
  double v9;
  SUICAudioLevelSmoother *levelSmoother;
  double v11;
  float v12;
  float v13;
  double v14;
  double v15;
  double horizontalScaleFactor;
  double v17;
  GLfloat y;
  GLfloat v19;
  GLfloat viewWidth;
  GLfloat viewHeight;
  double v22;
  GLfloat v23;
  GLfloat dictationRedColor;
  GLfloat dictationGreenColor;
  GLfloat dictationBlueColor;
  id v27;
  uint64_t v28;
  uint64_t v29;
  float v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  void *v34;
  float32x4_t *v35;
  _BOOL4 reduceMotionEnabled;
  double frameRateScalingFactor;
  float v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  float v45;
  double v46;
  double v47;
  GLsizei numAuraIndicesCulled;
  uint64_t numAuraIndices;
  float v50;
  float v51;
  GLfloat v52;
  float v53;
  GLfloat v54;
  GLfloat v55;
  GLsizei numWaveIndices;
  unsigned int v57;
  float v58;
  GLfloat v59;
  float v60;
  GLfloat v61;
  GLfloat v62;
  const GLvoid *v63;
  float v64;
  float *v65;
  float v66;
  float v67;
  int8x16_t v68;
  float32x2_t v69;
  int8x8_t v70;
  void *v71;
  char v72;
  void *v73;
  uint64_t v74;
  double v75;
  double v76;
  int v77;
  uint64_t v78;
  float v79;
  void *v80;
  id v81;
  float32x2_t v82;
  int v83;
  void *v84;
  NSMutableArray *obj;
  double v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_currentFlameGroup
    || !self->_isInitialized
    || !-[SUICFlamesViewLegacy isRenderingEnabled](self, "isRenderingEnabled"))
  {
    goto LABEL_69;
  }
  -[SUICFlamesViewLegacy layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isDrawableAvailable"))
    goto LABEL_68;
  v80 = v5;
  v81 = v4;
  v6 = -[SUICFlameGroup transitionPhasePtr](self->_currentFlameGroup, "transitionPhasePtr");
  v7 = -[SUICFlameGroup stateModifiersPtr](self->_currentFlameGroup, "stateModifiersPtr");
  v8.f32[0] = *v6;
  LODWORD(v9) = 1.0;
  v79 = *v6;
  if (*v6 < 1.0)
  {
    v9 = v79;
    switch(self->_state)
    {
      case 0:
        v11 = v9 + self->_frameRateScalingFactor * 0.03;
        *(float *)&v11 = v11;
        *(float *)&v11 = fminf(*(float *)&v11, 1.0);
        *v6 = *(float *)&v11;
        *v7 = vmlaq_n_f32(*v7, vsubq_f32((float32x4_t)xmmword_1A377E0B0, *v7), *(float *)&v11);
        levelSmoother = self->_levelSmoother;
        LODWORD(v11) = 1064514355;
        goto LABEL_9;
      case 1:
        v11 = v9 + self->_frameRateScalingFactor * 0.03;
        *(float *)&v11 = v11;
        *(float *)&v11 = fminf(*(float *)&v11, 1.0);
        *v6 = *(float *)&v11;
        *v7 = vmlaq_n_f32(*v7, vsubq_f32((float32x4_t)xmmword_1A377E0A0, *v7), *(float *)&v11);
        levelSmoother = self->_levelSmoother;
        LODWORD(v11) = 1063675494;
LABEL_9:
        -[SUICAudioLevelSmoother setDecaySpeed:](levelSmoother, "setDecaySpeed:", v11);
        break;
      case 2:
        v9 = v9 + self->_frameRateScalingFactor * 0.02;
        *(float *)&v9 = v9;
        *(float *)&v9 = fminf(*(float *)&v9, 1.0);
        *v6 = *(float *)&v9;
        v8 = vmlaq_n_f32(*v7, vsubq_f32((float32x4_t)xmmword_1A377E090, *v7), *(float *)&v9);
        *v7 = v8;
        break;
      case 4:
        v8.i64[0] = *(_QWORD *)&self->_frameRateScalingFactor;
        v9 = v9 + *(double *)v8.i64 * 0.03;
        *(float *)&v9 = v9;
        v8.i32[0] = 1.0;
        *(float *)&v9 = fminf(*(float *)&v9, 1.0);
        *v6 = *(float *)&v9;
        *v7 = vmlaq_n_f32(*v7, vsubq_f32((float32x4_t)0, *v7), *(float *)&v9);
        *(float *)&v9 = *v6;
        if (*v6 == 1.0)
          -[SUICFlamesViewLegacy setHidden:](self, "setHidden:", 1, v9);
        break;
      default:
        break;
    }
  }
  v12 = 0.0;
  if (self->_state == 1)
  {
    -[SUICFlamesViewLegacy _currentMicPowerLevel](self, "_currentMicPowerLevel", v9, *(double *)v8.i64);
    v12 = v13;
  }
  -[SUICFlamesViewLegacy _setCurrentContext](self, "_setCurrentContext");
  -[CADisplayLink duration](self->_displayLink, "duration");
  v15 = v14;
  glClear(0x4000u);
  horizontalScaleFactor = self->_horizontalScaleFactor;
  v17 = horizontalScaleFactor * self->_activeFrame.size.width;
  *(float *)&horizontalScaleFactor = self->_activeFrame.origin.x * horizontalScaleFactor;
  y = self->_activeFrame.origin.y;
  v19 = v17;
  *(float *)&v17 = self->_activeFrame.size.height;
  glVertexAttrib4f(2u, *(GLfloat *)&horizontalScaleFactor, y, v19, *(GLfloat *)&v17);
  viewWidth = (float)self->_viewWidth;
  viewHeight = (float)self->_viewHeight;
  -[SUICFlamesViewLegacy _currentDisplayScale](self, "_currentDisplayScale");
  v23 = v22;
  glVertexAttrib4f(1u, viewWidth, viewHeight, v23, self->_dictationUnitSize);
  if (self->_mode == 1)
  {
    dictationRedColor = self->_dictationRedColor;
    dictationGreenColor = self->_dictationGreenColor;
    dictationBlueColor = self->_dictationBlueColor;
    glVertexAttrib3f(5u, dictationRedColor, dictationGreenColor, dictationBlueColor);
  }
  v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v78 = 528;
  obj = self->_flameGroups;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v87, v91, 16);
  v84 = v27;
  if (!v28)
  {
    v83 = 0;
    goto LABEL_60;
  }
  v29 = v28;
  v83 = 0;
  v30 = v15;
  v31 = *(_QWORD *)v88;
  v32 = v30;
  v86 = v30 * 0.5;
  v82 = (float32x2_t)vdup_n_s32(0x25800000u);
  do
  {
    v33 = 0;
    do
    {
      if (*(_QWORD *)v88 != v31)
        objc_enumerationMutation(obj);
      v34 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v33);
      v35 = (float32x4_t *)objc_msgSend(v34, "stateModifiersPtr", v78);
      if (!self->_freezesAura || (objc_msgSend(v34, "isAura") & 1) == 0)
      {
        reduceMotionEnabled = self->_reduceMotionEnabled;
        frameRateScalingFactor = self->_frameRateScalingFactor;
        objc_msgSend(v34, "stateTime");
        v39 = v38;
        v40 = v86;
        if (reduceMotionEnabled)
        {
          v41 = 0.1;
        }
        else
        {
          v40 = v32;
          v41 = 0.25;
        }
        if (reduceMotionEnabled)
          v42 = v12 * 0.5 + 0.1;
        else
          v42 = v12 * 2.0 + 0.25;
        v43 = v39 + v40 * frameRateScalingFactor;
        *(float *)&v43 = v43;
        objc_msgSend(v34, "setStateTime:", v43);
        v44 = v41 * v35->f32[2] + v42 * (float)(v35->f32[0] + v35->f32[1]) + v35->f32[3] * 0.05;
        objc_msgSend(v34, "zTime");
        v46 = v45 + v32 * v44;
        *(float *)&v46 = v46;
        objc_msgSend(v34, "setZTime:", v46);
      }
      if (objc_msgSend(v34, "isDyingOff"))
      {
        objc_msgSend(v34, "globalAlpha");
        *(float *)&v47 = *(float *)&v47 + -0.03;
        if (*(float *)&v47 < 0.0)
          *(float *)&v47 = 0.0;
        objc_msgSend(v34, "setGlobalAlpha:", v47);
      }
      if (!objc_msgSend(v34, "isAura") || self->_mode)
      {
        numAuraIndicesCulled = 0;
LABEL_38:
        numAuraIndices = 0;
        goto LABEL_39;
      }
      v65 = (float *)objc_msgSend(v34, "transitionPhasePtr");
      if (*v65 >= 1.0)
      {
        numAuraIndices = self->_numAuraIndices;
        numAuraIndicesCulled = self->_numAuraIndicesCulled;
        v83 = 1;
      }
      else
      {
        numAuraIndices = 0;
        v66 = *v65 + dbl_1A377E0C0[!self->_reduceMotionEnabled] * self->_frameRateScalingFactor;
        v67 = fminf(v66, 1.0);
        *v65 = v67;
        v68 = (int8x16_t)vmlaq_n_f32(*v35, vsubq_f32((float32x4_t)xmmword_1A377E0D0, *v35), v67);
        *v35 = (float32x4_t)v68;
        numAuraIndicesCulled = self->_numAuraIndices;
        if (*(float *)v68.i32 <= 2.2204e-16)
        {
          v69.i32[1] = v68.i32[1];
          v69.i32[0] = vextq_s8(v68, v68, 8uLL).u32[0];
          v70 = vmvn_s8((int8x8_t)vcge_f32(v82, v69));
          if ((v70.i8[4] & 1) == 0 && (v70.i8[0] & 1) == 0)
          {
            if (*(float *)&v68.i32[3] + 2.22044605e-16 < 1.0)
              goto LABEL_38;
            -[SUICFlamesViewLegacy flamesDelegate](self, "flamesDelegate");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = objc_opt_respondsToSelector();

            if ((v72 & 1) != 0)
            {
              -[SUICFlamesViewLegacy flamesDelegate](self, "flamesDelegate");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v73, "flamesViewAuraDidDisplay:", self);

            }
            numAuraIndices = 0;
            v27 = v84;
          }
        }
      }
LABEL_39:
      v50 = v35->f32[3];
      if (self->_reduceMotionEnabled)
      {
        if (v50 > 0.5)
          goto LABEL_41;
      }
      else if (v50 > 0.0)
      {
LABEL_41:
        glUseProgram(self->_auraProgramHandle);
        glVertexAttrib4f(4u, v35->f32[0], v35->f32[1], v35->f32[2], v35->f32[3]);
        objc_msgSend(v34, "stateTime");
        v52 = v51;
        objc_msgSend(v34, "zTime");
        v54 = v53;
        objc_msgSend(v34, "globalAlpha");
        glVertexAttrib4f(3u, v52, v54, v12, v55);
        glDrawElements(4u, numAuraIndicesCulled, 0x1405u, (const GLvoid *)(4 * numAuraIndices));
        glUseProgram(self->_flameProgramHandle);
        goto LABEL_44;
      }
      numWaveIndices = self->_numWaveIndices;
      v57 = self->_numAuraIndicesCulled + self->_numAuraIndices;
      glVertexAttrib4f(4u, v35->f32[0], v35->f32[1], v35->f32[2], v50);
      objc_msgSend(v34, "stateTime");
      v59 = v58;
      objc_msgSend(v34, "zTime");
      v61 = v60;
      objc_msgSend(v34, "globalAlpha");
      glVertexAttrib4f(3u, v59, v61, v12, v62);
      v63 = (const GLvoid *)(4 * v57);
      v27 = v84;
      glDrawElements(4u, numWaveIndices, 0x1405u, v63);
LABEL_44:
      objc_msgSend(v34, "globalAlpha");
      if (v64 == 0.0)
        objc_msgSend(v27, "addObject:", v34);
      ++v33;
    }
    while (v29 != v33);
    v74 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v87, v91, 16);
    v29 = v74;
  }
  while (v74);
LABEL_60:

  if (objc_msgSend(v27, "count"))
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v78), "removeObjectsInArray:", v27);
  glBindRenderbuffer(0x8D41u, self->_renderbufferHandle);
  -[EAGLContext presentRenderbuffer:](self->_eaglContext, "presentRenderbuffer:", 36161);
  -[SUICFlamesViewLegacy _restoreCurrentContext](self, "_restoreCurrentContext");
  v5 = v80;
  v4 = v81;
  if (!self->_transitionFinished)
  {
    LODWORD(v75) = 1.0;
    *(float *)&v76 = v79;
    v77 = v79 >= 1.0;
    if (self->_freezesAura)
      v77 &= v83;
    if (v77 == 1)
    {
      self->_transitionFinished = 1;
      -[SUICFlamesViewLegacy _didFinishTransition](self, "_didFinishTransition", v75, v76);
    }
  }

LABEL_68:
LABEL_69:

}

+ (id)_indexCache
{
  if (_indexCache_onceToken != -1)
    dispatch_once(&_indexCache_onceToken, &__block_literal_global_69);
  return (id)_indexCache_sIndexCache;
}

uint64_t __35__SUICFlamesViewLegacy__indexCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)_indexCache_sIndexCache;
  _indexCache_sIndexCache = (uint64_t)v0;

  return objc_msgSend((id)_indexCache_sIndexCache, "setCountLimit:", sIndexCacheSize);
}

+ (void)setIndexCacheSize:(unint64_t)a3
{
  id v3;

  sIndexCacheSize = a3;
  objc_msgSend(a1, "_indexCache");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCountLimit:", sIndexCacheSize);

}

- (float)_currentMicPowerLevel
{
  void *v3;
  int v4;
  int v5;
  double v6;
  float v7;

  -[SUICFlamesViewLegacy flamesDelegate](self, "flamesDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "audioLevelForFlamesView:", self);
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
  v9.super_class = (Class)SUICFlamesViewLegacy;
  -[SUICFlamesViewLegacy traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[SUICFlamesViewLegacy traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayScale");
    v7 = v6;
    objc_msgSend(v4, "displayScale");
    if (v7 != v8)
    {
      -[SUICFlamesViewLegacy resetAndReinitialize:](self, "resetAndReinitialize:", 1);
      -[SUICFlamesViewLegacy _setValuesForFidelity:](self, "_setValuesForFidelity:", self->_fidelity);
      -[SUICFlamesViewLegacy setNeedsLayout](self, "setNeedsLayout");
    }

  }
}

- (int64_t)mode
{
  return self->_mode;
}

- (int64_t)state
{
  return self->_state;
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

- (double)horizontalScaleFactor
{
  return self->_horizontalScaleFactor;
}

- (BOOL)showAura
{
  return self->_showAura;
}

- (void)setShowAura:(BOOL)a3
{
  self->_showAura = a3;
}

- (BOOL)freezesAura
{
  return self->_freezesAura;
}

- (void)setFreezesAura:(BOOL)a3
{
  self->_freezesAura = a3;
}

- (UIImage)overlayImage
{
  return self->_overlayImage;
}

- (SUICFlamesViewProvidingDelegate)flamesDelegate
{
  return (SUICFlamesViewProvidingDelegate *)objc_loadWeakRetained((id *)&self->_flamesDelegate);
}

- (UIColor)dictationColor
{
  return self->_dictationColor;
}

- (BOOL)renderInBackground
{
  return self->_renderInBackground;
}

- (BOOL)accelerateTransitions
{
  return self->_accelerateTransitions;
}

- (void)setAccelerateTransitions:(BOOL)a3
{
  self->_accelerateTransitions = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictationColor, 0);
  objc_destroyWeak((id *)&self->_flamesDelegate);
  objc_storeStrong((id *)&self->_overlayImage, 0);
  objc_storeStrong((id *)&self->_levelSmoother, 0);
  objc_storeStrong((id *)&self->_overlayImageView, 0);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_currentFlameGroup, 0);
  objc_storeStrong((id *)&self->_flameGroups, 0);
  objc_storeStrong((id *)&self->_renderingDisabledReasons, 0);
  objc_storeStrong((id *)&self->_previousContext, 0);
  objc_storeStrong((id *)&self->_eaglContext, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

- (void)_setupVertexBuffer
{
  int v2;
  const char *v3;
  __int16 v4;
  _BOOL4 v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[SUICFlamesViewLegacy _setupVertexBuffer]";
  v4 = 1024;
  v5 = a1 != 0;
  _os_log_debug_impl(&dword_1A3752000, a2, OS_LOG_TYPE_DEBUG, "%s Vertex buffer data cached: %d", (uint8_t *)&v2, 0x12u);
}

@end
