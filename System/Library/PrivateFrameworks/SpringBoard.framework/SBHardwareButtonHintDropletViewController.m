@implementation SBHardwareButtonHintDropletViewController

- (void)dealloc
{
  CADisplayLink *displayLink;
  objc_super v4;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBHardwareButtonHintDropletViewController;
  -[SBHardwareButtonHintDropletViewController dealloc](&v4, sel_dealloc);
}

- (SBHardwareButtonHintDropletViewController)init
{
  SBHardwareButtonHintDropletViewController *v2;
  uint64_t v3;
  NSMutableDictionary *buttonStates;
  uint64_t v5;
  SBButtonBezelGeometryInfo *buttonGeometryInfo;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBHardwareButtonHintDropletViewController;
  v2 = -[SBHardwareButtonHintDropletViewController init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    buttonStates = v2->_buttonStates;
    v2->_buttonStates = (NSMutableDictionary *)v3;

    +[SBButtonBezelGeometryInfo buttonBezelGeometryInfoForCurrentEmbeddedDisplayBezel](SBButtonBezelGeometryInfo, "buttonBezelGeometryInfoForCurrentEmbeddedDisplayBezel");
    v5 = objc_claimAutoreleasedReturnValue();
    buttonGeometryInfo = v2->_buttonGeometryInfo;
    v2->_buttonGeometryInfo = (SBButtonBezelGeometryInfo *)v5;

    v2->_keylineStyle = 0;
  }
  return v2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)loadView
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  -[SBHardwareButtonHintDropletViewController _defaultInitialViewFrame](self, "_defaultInitialViewFrame");
  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9F28]), "initWithFrame:", v3, v4, v5, v6);
  objc_msgSend(v7, "setOpaque:", 0);
  -[SBHardwareButtonHintDropletViewController setView:](self, "setView:", v7);

}

- (void)viewDidLoad
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
  DRPDropletContextView *v12;
  DRPDropletContextView *lockDropletContextView;
  DRPDropletContextView *v14;
  DRPDropletContextView *dropletContextView;
  void *v16;
  void *v17;
  DRPDropletAnimationCoordinator *v18;
  DRPDropletAnimationCoordinator *animator;
  void *v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)SBHardwareButtonHintDropletViewController;
  -[SBHardwareButtonHintDropletViewController viewDidLoad](&v22, sel_viewDidLoad);
  -[SBHardwareButtonHintDropletViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = (DRPDropletContextView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D8E8]), "initWithFrame:", v5, v7, v9, v11);
  lockDropletContextView = self->_lockDropletContextView;
  self->_lockDropletContextView = v12;

  v14 = (DRPDropletContextView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D8E8]), "initWithFrame:", v5, v7, v9, v11);
  dropletContextView = self->_dropletContextView;
  self->_dropletContextView = v14;

  -[SBHardwareButtonHintDropletViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", self->_lockDropletContextView);

  -[SBHardwareButtonHintDropletViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", self->_dropletContextView);

  -[DRPDropletContextView setAutoresizingMask:](self->_lockDropletContextView, "setAutoresizingMask:", 18);
  -[DRPDropletContextView setAutoresizingMask:](self->_dropletContextView, "setAutoresizingMask:", 18);
  v18 = (DRPDropletAnimationCoordinator *)objc_alloc_init(MEMORY[0x1E0D1D8E0]);
  animator = self->_animator;
  self->_animator = v18;

  -[SBHardwareButtonHintDropletViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setNeedsLayout");

  -[SBHardwareButtonHintDropletViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layoutIfNeeded");

}

- (id)activateHintDropletForButton:(int64_t)a3
{
  NSObject *v7;
  NSTimer *idleTimer;
  NSMutableDictionary *buttonStates;
  void *v10;
  id *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21[2];
  uint8_t buf[4];
  int64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a3 == 10)
    return 0;
  SBLogButtonHintingUI();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v23 = a3;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Hint Droplet Activating: %ld", buf, 0xCu);
  }

  -[NSTimer invalidate](self->_idleTimer, "invalidate");
  idleTimer = self->_idleTimer;
  self->_idleTimer = 0;

  buttonStates = self->_buttonStates;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](buttonStates, "objectForKey:", v10);
  v11 = (id *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = v11[7];
    v13 = v12;
    if (v12 && objc_msgSend(v12, "isValid"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("activating an already-active button %li"), a3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBHardwareButtonHintDropletViewController activateHintDropletForButton:].cold.1(a2, (uint64_t)self, (uint64_t)v19);
      objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D0C04AA4);
    }

  }
  else
  {
    -[SBHardwareButtonHintDropletViewController _existingOrNewDropletStateForButton:](self, "_existingOrNewDropletStateForButton:", a3);
    v11 = (id *)objc_claimAutoreleasedReturnValue();
  }
  objc_initWeak((id *)buf, self);
  v14 = objc_alloc(MEMORY[0x1E0D01868]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C80D38];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __74__SBHardwareButtonHintDropletViewController_activateHintDropletForButton___block_invoke;
  v20[3] = &unk_1E8E9E4B8;
  objc_copyWeak(v21, (id *)buf);
  v21[1] = (id)a3;
  v18 = (void *)objc_msgSend(v14, "initWithIdentifier:forReason:queue:invalidationBlock:", v16, CFSTR("activatedButton"), MEMORY[0x1E0C80D38], v20);

  -[SBCameraHardwareButton setForegroundCameraShutterButtonPIDs:]((uint64_t)v11, v18);
  -[SBHardwareButtonHintDropletViewController _applyButtonState:animated:](self, "_applyButtonState:animated:", v11, 1);
  objc_destroyWeak(v21);
  objc_destroyWeak((id *)buf);

  return v18;
}

void __74__SBHardwareButtonHintDropletViewController_activateHintDropletForButton___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_activateButtonAssertionDidInvalidate:forButton:", v4, *(_QWORD *)(a1 + 40));

}

- (void)_activateButtonAssertionDidInvalidate:(id)a3 forButton:(int64_t)a4
{
  NSMutableDictionary *buttonStates;
  void *v7;
  id v8;
  void *v9;
  _QWORD *v10;
  id v11;
  NSObject *v12;
  int v13;
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  buttonStates = self->_buttonStates;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a3;
  objc_msgSend(v7, "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](buttonStates, "objectForKey:", v9);
  v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = (id)v10[7];
  else
    v11 = 0;

  if (v11 && v11 == v8)
  {
    SBLogButtonHintingUI();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134217984;
      v14 = a4;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "Hint Droplet Deactivating: %ld", (uint8_t *)&v13, 0xCu);
    }

    -[SBCameraHardwareButton setForegroundCameraShutterButtonPIDs:]((uint64_t)v10, 0);
    -[SBHardwareButtonHintDropletViewController _applyButtonState:animated:](self, "_applyButtonState:animated:", v10, 1);
  }

}

- (id)associateHintView:(id)a3 withButton:(int64_t)a4
{
  id v6;
  NSTimer *idleTimer;
  NSObject *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  SBButtonBezelGeometryInfo *buttonGeometryInfo;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  _QWORD v34[4];
  id v35;
  id v36[2];
  uint8_t buf[4];
  int64_t v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NSTimer invalidate](self->_idleTimer, "invalidate");
  idleTimer = self->_idleTimer;
  self->_idleTimer = 0;

  SBLogButtonHintingUI();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v38 = a4;
    v39 = 2112;
    v40 = v6;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Hint Droplet: %ld Associating Hint View: %@", buf, 0x16u);
  }

  -[SBHardwareButtonHintDropletViewController _existingOrNewDropletStateForButton:](self, "_existingOrNewDropletStateForButton:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCameraHardwareButton setAllCameraShutterButtonPIDs:]((uint64_t)v9, v6);
  -[SBHardwareButtonHintDropletViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v6);
  v11 = -[SBButtonBezelGeometryInfo buttonScreenEdgeForButton:](self->_buttonGeometryInfo, "buttonScreenEdgeForButton:", a4);
  buttonGeometryInfo = self->_buttonGeometryInfo;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_referenceBounds");
  -[SBButtonBezelGeometryInfo buttonHWRectForButton:onEmbeddedDisplayBounds:](buttonGeometryInfo, "buttonHWRectForButton:onEmbeddedDisplayBounds:", a4);
  v15 = v14;
  v17 = v16;

  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "centerYAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, v15 + v17 * 0.5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setActive:", 1);

  if (v11 == 8)
  {
    objc_msgSend(v6, "leftAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rightAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, -v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (v11 == 2)
  {
    objc_msgSend(v6, "rightAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "leftAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v26 = v24;
    objc_msgSend(v24, "setActive:", 1);

  }
  objc_initWeak((id *)buf, self);
  v27 = objc_alloc(MEMORY[0x1E0D01868]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "UUIDString");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = MEMORY[0x1E0C80D38];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __74__SBHardwareButtonHintDropletViewController_associateHintView_withButton___block_invoke;
  v34[3] = &unk_1E8EBBB40;
  objc_copyWeak(v36, (id *)buf);
  v31 = v6;
  v35 = v31;
  v36[1] = (id)a4;
  v32 = (void *)objc_msgSend(v27, "initWithIdentifier:forReason:queue:invalidationBlock:", v29, CFSTR("associatedHintView"), MEMORY[0x1E0C80D38], v34);

  -[SBHardwareButtonHintDropletViewController _applyButtonState:animated:](self, "_applyButtonState:animated:", v9, 1);
  objc_destroyWeak(v36);
  objc_destroyWeak((id *)buf);

  return v32;
}

void __74__SBHardwareButtonHintDropletViewController_associateHintView_withButton___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_associateHintViewAssertionDidInvalidate:forView:forButton:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

- (void)updateHintContentVisibility:(int64_t)a3 forButton:(int64_t)a4 animationSettings:(id)a5
{
  NSMutableDictionary *buttonStates;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  int64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  buttonStates = self->_buttonStates;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](buttonStates, "objectForKey:", v9);
  v10 = objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = *(id *)(v10 + 48);
    if (v11)
    {

      goto LABEL_5;
    }
    if (*(_QWORD *)(v10 + 40))
    {
LABEL_5:
      if (a3 == 1)
        v12 = 2;
      else
        v12 = 1;
      if (*(_QWORD *)(v10 + 64) != v12)
      {
        SBLogButtonHintingUI();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v15 = 134218240;
          v16 = a4;
          v17 = 2048;
          v18 = v12;
          _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "Hint Droplet: %ld Updated hint presented stage: %ld", (uint8_t *)&v15, 0x16u);
        }

        *(_QWORD *)(v10 + 64) = v12;
        -[SBHardwareButtonHintDropletViewController _applyButtonState:animated:](self, "_applyButtonState:animated:", v10, 1);
      }
      goto LABEL_15;
    }
  }
  SBLogButtonHintingUI();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[SBHardwareButtonHintDropletViewController updateHintContentVisibility:forButton:animationSettings:].cold.1(a4, v14);

LABEL_15:
}

- (void)_associateHintViewAssertionDidInvalidate:(id)a3 forView:(id)a4 forButton:(int64_t)a5
{
  id v7;
  NSMutableDictionary *buttonStates;
  void *v9;
  _QWORD *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  int v15;
  int64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  buttonStates = self->_buttonStates;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](buttonStates, "objectForKey:", v9);
  v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = (void *)v10[6];
  else
    v11 = 0;
  v12 = v11;
  v13 = v12;
  if (v12 && v12 == v7)
  {
    SBLogButtonHintingUI();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 134218242;
      v16 = a5;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "Hint Droplet: %ld Disassociating Hint View: %@", (uint8_t *)&v15, 0x16u);
    }

    objc_msgSend(v7, "removeFromSuperview");
    -[SBCameraHardwareButton setAllCameraShutterButtonPIDs:]((uint64_t)v10, 0);
    if (v10)
      v10[8] = 1;
    -[SBHardwareButtonHintDropletViewController _applyButtonState:animated:](self, "_applyButtonState:animated:", v10, 1);
  }

}

- (id)setDropletLayoutCallback:(id)a3 forButton:(int64_t)a4
{
  id v6;
  NSTimer *idleTimer;
  NSObject *v8;
  void *v9;
  const char *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21[2];
  uint8_t buf[4];
  int64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NSTimer invalidate](self->_idleTimer, "invalidate");
  idleTimer = self->_idleTimer;
  self->_idleTimer = 0;

  SBLogButtonHintingUI();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v23 = a4;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Hint Droplet Setting Layout Callback: %ld", buf, 0xCu);
  }

  -[SBHardwareButtonHintDropletViewController _existingOrNewDropletStateForButton:](self, "_existingOrNewDropletStateForButton:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  if (v9)
    objc_setProperty_nonatomic_copy(v9, v10, v6, 40);
  objc_initWeak((id *)buf, self);
  v12 = objc_alloc(MEMORY[0x1E0D01868]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C80D38];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __80__SBHardwareButtonHintDropletViewController_setDropletLayoutCallback_forButton___block_invoke;
  v19[3] = &unk_1E8EBBB68;
  objc_copyWeak(v21, (id *)buf);
  v16 = v6;
  v20 = v16;
  v21[1] = (id)a4;
  v17 = (void *)objc_msgSend(v12, "initWithIdentifier:forReason:queue:invalidationBlock:", v14, CFSTR("setLayoutCallback"), MEMORY[0x1E0C80D38], v19);

  -[SBHardwareButtonHintDropletViewController _applyButtonState:animated:](self, "_applyButtonState:animated:", v11, 1);
  objc_destroyWeak(v21);
  objc_destroyWeak((id *)buf);

  return v17;
}

void __80__SBHardwareButtonHintDropletViewController_setDropletLayoutCallback_forButton___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_dropletLayoutCallbackAssertionDidInvalidate:forCallback:forButton:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

- (void)_dropletLayoutCallbackAssertionDidInvalidate:(id)a3 forCallback:(id)a4 forButton:(int64_t)a5
{
  NSMutableDictionary *buttonStates;
  void *v8;
  id v9;
  void *v10;
  _QWORD *v11;
  id v12;
  NSObject *v13;
  const char *v14;
  int v15;
  int64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  buttonStates = self->_buttonStates;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a4;
  objc_msgSend(v8, "numberWithInteger:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](buttonStates, "objectForKey:", v10);
  v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v12 = (id)v11[5];
  else
    v12 = 0;

  if (v12 && v12 == v9)
  {
    SBLogButtonHintingUI();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 134217984;
      v16 = a5;
      _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "Hint Droplet Removing Layout Callback: %ld", (uint8_t *)&v15, 0xCu);
    }

    if (v11)
    {
      objc_setProperty_nonatomic_copy(v11, v14, 0, 40);
      v11[8] = 1;
    }
    -[SBHardwareButtonHintDropletViewController _applyButtonState:animated:](self, "_applyButtonState:animated:", v11, 1);
  }

}

- (id)_existingOrNewDropletStateForButton:(int64_t)a3
{
  NSMutableDictionary *buttonStates;
  void *v6;
  void *v7;
  id *v8;
  void *v9;
  id v10;
  void *v11;
  id *v12;
  NSMutableDictionary *v13;
  void *v14;

  buttonStates = self->_buttonStates;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](buttonStates, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    if ((unint64_t)(a3 - 3) > 1)
    {
      v9 = 0;
    }
    else
    {
      -[SBHardwareButtonHintDropletViewController _existingOrNewDropletStateForButton:](self, "_existingOrNewDropletStateForButton:", 10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    -[SBHardwareButtonHintDropletViewController _dropletContextViewForButton:](self, "_dropletContextViewForButton:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[_SBHardwareButtonHintDropletState initWithButton:dropletContextView:contentView:groupState:]((id *)[_SBHardwareButtonHintDropletState alloc], (void *)a3, v11, v10, v9);
    -[SBHardwareButtonHintDropletViewController _applyButtonState:animated:checkForIdle:](self, "_applyButtonState:animated:checkForIdle:", v12, 0, 0);
    v13 = self->_buttonStates;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v12, v14);

    v8 = v12;
  }

  return v8;
}

- (id)_dropletContextViewForButton:(int64_t)a3
{
  int *v3;

  v3 = &OBJC_IVAR___SBHardwareButtonHintDropletViewController__dropletContextView;
  if (a3 == 2)
    v3 = &OBJC_IVAR___SBHardwareButtonHintDropletViewController__lockDropletContextView;
  return *(id *)((char *)&self->super.super.super.isa + *v3);
}

- (void)_applyStateForExistingButton:(int64_t)a3 animated:(BOOL)a4 checkForIdle:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  NSMutableDictionary *buttonStates;
  void *v9;
  void *v10;
  id v11;

  v5 = a5;
  v6 = a4;
  buttonStates = self->_buttonStates;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](buttonStates, "objectForKey:", v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v10 = v11;
  if (v11)
  {
    -[SBHardwareButtonHintDropletViewController _applyButtonState:animated:checkForIdle:](self, "_applyButtonState:animated:checkForIdle:", v11, v6, v5);
    v10 = v11;
  }

}

- (void)_applyButtonState:(id)a3 animated:(BOOL)a4
{
  -[SBHardwareButtonHintDropletViewController _applyButtonState:animated:checkForIdle:](self, "_applyButtonState:animated:checkForIdle:", a3, a4, 1);
}

- (void)_applyButtonState:(id)a3 animated:(BOOL)a4 checkForIdle:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  _QWORD *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  _BOOL4 v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v5 = a5;
  v6 = a4;
  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (v8)
  {
    v10 = v8[1];
    if (v10 == 10)
    {
      -[SBHardwareButtonHintDropletViewController _applyStateForExistingButton:animated:checkForIdle:](self, "_applyStateForExistingButton:animated:checkForIdle:", 3, v6, 0);
      -[SBHardwareButtonHintDropletViewController _applyStateForExistingButton:animated:checkForIdle:](self, "_applyStateForExistingButton:animated:checkForIdle:", 4, v6, 0);
    }
  }
  else
  {
    v10 = 0;
  }
  v11 = -[_SBHardwareButtonHintDropletState stage](v9);
  -[SBHardwareButtonHintDropletViewController _configurationForButton:stage:](self, "_configurationForButton:stage:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    SBLogButtonHintingUI();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSBSHardwareButtonKind();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSBHardwareButtonHintDropletStage((uint64_t)v11);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSBHardwareButtonHintDropletKeylineStyle(self->_keylineStyle);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "debugDescription");
      *(_DWORD *)buf = 138413314;
      v32 = v25;
      v33 = 2112;
      v34 = v22;
      v35 = 2112;
      v36 = v23;
      v37 = 1024;
      v38 = v6;
      v39 = 2112;
      v40 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v40;
      _os_log_debug_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEBUG, "applying button state for button: %@; stage: %@; keylineStyle: %@; animated:s %{BOOL}u;\nconfiguration: %@",
        buf,
        0x30u);

    }
    -[SBHardwareButtonHintDropletViewController _dropletContextViewForButton:](self, "_dropletContextViewForButton:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v15 = v9[3];
    else
      v15 = 0;
    -[DRPDropletAnimationCoordinator applyViewConfiguration:animated:tracking:containerView:contextView:](self->_animator, "applyViewConfiguration:animated:tracking:containerView:contextView:", v12, v6, 0, v15, v14);

  }
  if (v9 && v5 && !v9[7] && !v9[6] && !v9[5])
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[NSMutableDictionary objectEnumerator](self->_buttonStates, "objectEnumerator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if (!v21 || v21[7] || v21[6] || v21[5])
          {

            goto LABEL_28;
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v18)
          continue;
        break;
      }
    }

    -[SBHardwareButtonHintDropletViewController _startIdleTimer](self, "_startIdleTimer");
  }
LABEL_28:
  -[SBHardwareButtonHintDropletViewController _updateDisplayLink](self, "_updateDisplayLink");
  -[SBHardwareButtonHintDropletViewController _updateSnapshotVisibility](self, "_updateSnapshotVisibility");

}

- (void)_startIdleTimer
{
  void *v3;
  NSTimer *v4;
  NSTimer *idleTimer;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  -[NSTimer invalidate](self->_idleTimer, "invalidate");
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0C99E88];
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __60__SBHardwareButtonHintDropletViewController__startIdleTimer__block_invoke;
  v9 = &unk_1E8E9FA90;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v6, 3.0);
  v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  idleTimer = self->_idleTimer;
  self->_idleTimer = v4;

  -[NSTimer setTolerance:](self->_idleTimer, "setTolerance:", 0.3, v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __60__SBHardwareButtonHintDropletViewController__startIdleTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "hintDropletViewControllerDidBecomeIdle:", v3);

    WeakRetained = v3;
  }

}

- (void)_updateDisplayLink
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  CADisplayLink *v14;
  CADisplayLink *displayLink;
  CADisplayLink *v16;
  uint8_t v17[16];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_buttonStates, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v7);
        if (v8)
        {
          v9 = *(id *)(v8 + 40);
          if (v9)
          {

LABEL_18:
            if (self->_displayLink)
              return;
            SBLogButtonHintingUI();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v17 = 0;
              _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "Hint Droplet Starting CADisplayLink", v17, 2u);
            }

            objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__displayLinkCallback_);
            v14 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
            displayLink = self->_displayLink;
            self->_displayLink = v14;

            v16 = self->_displayLink;
            objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[CADisplayLink addToRunLoop:forMode:](v16, "addToRunLoop:forMode:", v12, *MEMORY[0x1E0C99860]);
            goto LABEL_22;
          }
          if (*(_QWORD *)(v8 + 48))
            goto LABEL_18;
        }
        ++v7;
      }
      while (v5 != v7);
      v10 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v5 = v10;
      if (v10)
        continue;
      break;
    }
  }

  if (self->_displayLink)
  {
    SBLogButtonHintingUI();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "Hint Droplet Stopping CADisplayLink", v17, 2u);
    }

    -[CADisplayLink invalidate](self->_displayLink, "invalidate");
    v12 = self->_displayLink;
    self->_displayLink = 0;
LABEL_22:

  }
}

- (void)_displayLinkCallback:(id)a3
{
  CADisplayLink *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  SBHardwareButtonHintDropletViewController *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  double v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  double v29;
  void *v30;
  uint64_t v31;
  CADisplayLink *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  _QWORD v36[4];
  id v37;
  double v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = (CADisplayLink *)a3;
  if (self->_displayLink == v4)
  {
    v32 = v4;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[NSMutableDictionary objectEnumerator](self->_buttonStates, "objectEnumerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (!v6)
    {
      v8 = 0;
      goto LABEL_44;
    }
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v40;
    v33 = *(_QWORD *)v40;
    v34 = v5;
    while (1)
    {
      v10 = 0;
      v35 = v7;
      do
      {
        if (*(_QWORD *)v40 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v10);
        if (v11)
        {
          v12 = *(_QWORD *)(v11 + 8);
          v13 = (unint64_t)*(id *)(v11 + 40);
          v14 = *(void **)(v11 + 48);
        }
        else
        {
          v13 = 0;
          v12 = 0;
          v14 = 0;
        }
        v15 = v14;
        if (!(v13 | v15))
        {
          v13 = 0;
          goto LABEL_35;
        }
        if (!v8)
        {
          -[SBHardwareButtonHintDropletViewController view](self, "view");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "window");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v17 = -[SBButtonBezelGeometryInfo buttonScreenEdgeForButton:](self->_buttonGeometryInfo, "buttonScreenEdgeForButton:", v12);
        if (v12 == 10)
        {
          v18 = self;
          -[NSMutableDictionary objectForKey:](self->_buttonStates, "objectForKey:", &unk_1E91D1D18);
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = (void *)v19;
          if (v19)
            v21 = *(void **)(v19 + 24);
          else
            v21 = 0;
          v22 = v21;

          if (v22)
            v23 = _offsetOfDropletView(v22, v8, v17);
          else
            v23 = 0.0;
          -[NSMutableDictionary objectForKey:](v18->_buttonStates, "objectForKey:", &unk_1E91D1D30);
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = (void *)v25;
          if (v25)
            v27 = *(void **)(v25 + 24);
          else
            v27 = 0;
          v28 = v27;

          if (v28)
            v29 = _offsetOfDropletView(v28, v8, v17);
          else
            v29 = 0.0;
          if (v23 < v29)
            v23 = v29;

          self = v18;
          v9 = v33;
          v5 = v34;
          if (!v13)
            goto LABEL_32;
LABEL_31:
          (*(void (**)(unint64_t, uint64_t, double))(v13 + 16))(v13, v12, v23);
          goto LABEL_32;
        }
        if (v11)
          v24 = *(void **)(v11 + 24);
        else
          v24 = 0;
        v23 = _offsetOfDropletView(v24, v8, v17);
        if (v13)
          goto LABEL_31;
LABEL_32:
        if (v15)
        {
          v30 = (void *)MEMORY[0x1E0CEABB0];
          v36[0] = MEMORY[0x1E0C809B0];
          v36[1] = 3221225472;
          v36[2] = __66__SBHardwareButtonHintDropletViewController__displayLinkCallback___block_invoke;
          v36[3] = &unk_1E8E9DE88;
          v37 = (id)v15;
          v38 = v23;
          objc_msgSend(v30, "performWithoutAnimation:", v36);

        }
        v7 = v35;
LABEL_35:

        ++v10;
      }
      while (v7 != v10);
      v31 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      v7 = v31;
      if (!v31)
      {
LABEL_44:

        v4 = v32;
        break;
      }
    }
  }

}

uint64_t __66__SBHardwareButtonHintDropletViewController__displayLinkCallback___block_invoke(uint64_t a1)
{
  void *v1;
  CGAffineTransform v3;

  v1 = *(void **)(a1 + 32);
  CGAffineTransformMakeTranslation(&v3, *(CGFloat *)(a1 + 40), 0.0);
  return objc_msgSend(v1, "setTransform:", &v3);
}

- (void)setKeylineStyle:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  if (self->_keylineStyle != a3)
  {
    self->_keylineStyle = a3;
    -[NSMutableDictionary objectForKey:](self->_buttonStates, "objectForKey:", &unk_1E91D1D48);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
      -[SBHardwareButtonHintDropletViewController _applyButtonState:animated:](self, "_applyButtonState:animated:", v6, 1);
    -[NSMutableDictionary allValues](self->_buttonStates, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bs_firstObjectPassingTest:", &__block_literal_global_324);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[SBHardwareButtonHintDropletViewController _applyButtonState:animated:](self, "_applyButtonState:animated:", v5, 1);

  }
}

BOOL __61__SBHardwareButtonHintDropletViewController_setKeylineStyle___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v2;
  _BOOL8 v3;
  uint64_t v4;

  v2 = a2;
  if (!v2)
  {
    v4 = 0;
    goto LABEL_5;
  }
  if (v2[1] != 2)
  {
    v4 = v2[3];
LABEL_5:
    v3 = v4 != 0;
    goto LABEL_6;
  }
  v3 = 0;
LABEL_6:

  return v3;
}

- (id)_configurationForButton:(int64_t)a3 stage:(unint64_t)a4
{
  unint64_t v7;
  SBButtonBezelGeometryInfo *buttonGeometryInfo;
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
  double v19;
  double v20;
  double v21;
  double v22;

  v7 = -[SBButtonBezelGeometryInfo buttonScreenEdgeForButton:](self->_buttonGeometryInfo, "buttonScreenEdgeForButton:");
  buttonGeometryInfo = self->_buttonGeometryInfo;
  -[SBHardwareButtonHintDropletViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  -[SBButtonBezelGeometryInfo buttonHWRectForButton:onEmbeddedDisplayBounds:](buttonGeometryInfo, "buttonHWRectForButton:onEmbeddedDisplayBounds:", a3);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  -[SBHardwareButtonHintDropletViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  v20 = v19;
  v22 = v21;

  return (id)objc_msgSend(MEMORY[0x1E0D1D8F0], "hardwareButtonHintForButton:stage:keylineStyle:rectEdge:buttonRect:canvasSize:", a3, a4, self->_keylineStyle, v7, v11, v13, v15, v17, v20, v22);
}

- (void)_updateSnapshotVisibility
{
  void *v3;
  char v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  __int16 v13;
  __int16 v14;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("SBHardwareButtonHintDropletsAlwaysVisibleInSnapshots"));

  v5 = (v4 & 1) == 0 && self->_displayLink == 0;
  -[SBHardwareButtonHintDropletViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "disableUpdateMask");
  if (v5)
  {
    v9 = v8 | 2u;
    if (v8 != (_DWORD)v9)
    {
      SBLogButtonHintingUI();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 0;
        v11 = "Hint Droplet: Hiding droplets from snapshots";
        v12 = (uint8_t *)&v14;
LABEL_11:
        _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
  }
  else
  {
    v9 = v8 & 0xFFFFFFFD;
    if (v8 != (_DWORD)v9)
    {
      SBLogButtonHintingUI();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 0;
        v11 = "Hint Droplet: Revealing droplets in snapshots";
        v12 = (uint8_t *)&v13;
        goto LABEL_11;
      }
LABEL_12:

      objc_msgSend(v7, "setDisableUpdateMask:", v9);
    }
  }

}

- (unint64_t)keylineStyle
{
  return self->_keylineStyle;
}

- (SBHardwareButtonHintDropletViewControllerDelegate)delegate
{
  return (SBHardwareButtonHintDropletViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_buttonStates, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_dropletContextView, 0);
  objc_storeStrong((id *)&self->_lockDropletContextView, 0);
  objc_storeStrong((id *)&self->_buttonGeometryInfo, 0);
}

- (void)activateHintDropletForButton:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("SBHardwareButtonHintDropletViewController.m");
  v16 = 1024;
  v17 = 133;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

- (void)updateHintContentVisibility:(uint64_t)a1 forButton:(NSObject *)a2 animationSettings:.cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromSBSHardwareButtonKind();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "We shouldn't be trying to update the hint content appearance state for a button that has no hinting state: %{public}@", (uint8_t *)&v4, 0xCu);

}

@end
