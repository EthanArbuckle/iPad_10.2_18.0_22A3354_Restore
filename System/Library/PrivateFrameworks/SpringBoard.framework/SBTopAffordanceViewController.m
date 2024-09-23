@implementation SBTopAffordanceViewController

+ (UIImageSymbolConfiguration)symbolConfiguration
{
  if (symbolConfiguration_once != -1)
    dispatch_once(&symbolConfiguration_once, &__block_literal_global_362);
  return (UIImageSymbolConfiguration *)(id)symbolConfiguration_symbolConfiguration;
}

void __52__SBTopAffordanceViewController_symbolConfiguration__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0CEB5C0], *MEMORY[0x1E0CEB5E8]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fontWithSize:", 14.0);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithFont:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)symbolConfiguration_symbolConfiguration;
  symbolConfiguration_symbolConfiguration = v1;

}

+ (id)imageForAction:(int64_t)a3 interfaceOrientation:(int64_t)a4
{
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(a1, "symbolConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = a4 - 1;
  v9 = (void *)MEMORY[0x1E0CEA638];
  if (v8 >= 2)
    objc_msgSend(a1, "landscapeImageNameForAction:", a3);
  else
    objc_msgSend(a1, "portraitImageNameForAction:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "systemImageNamed:withConfiguration:", v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "imageWithRenderingMode:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)portraitImageNameForAction:(int64_t)a3
{
  __CFString *v3;
  uint64_t v4;
  __CFString *v5;
  const __CFString *v6;
  id result;

  v3 = CFSTR("rectangle.portrait.inset.filled");
  switch(a3)
  {
    case 1:
      goto LABEL_12;
    case 2:
      return CFSTR("rectangle.portrait.split.2x1");
    case 3:
      v4 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
      v5 = CFSTR("rectangle.portrait.lefthalf.inset.filled");
      v6 = CFSTR("rectangle.portrait.righthalf.inset.filled");
      goto LABEL_9;
    case 4:
      v4 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
      v5 = CFSTR("rectangle.portrait.righthalf.inset.filled");
      v6 = CFSTR("rectangle.portrait.lefthalf.inset.filled");
      goto LABEL_9;
    case 5:
    case 7:
      v4 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
      v5 = CFSTR("rectangle.portrait.rightthird.inset.filled");
      v6 = CFSTR("rectangle.portrait.leftthird.inset.filled");
      goto LABEL_9;
    case 6:
      v4 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
      v5 = CFSTR("rectangle.portrait.leftthird.inset.filled");
      v6 = CFSTR("rectangle.portrait.rightthird.inset.filled");
LABEL_9:
      if (v4 == 1)
        v5 = (__CFString *)v6;
      v3 = v5;
LABEL_12:
      result = v3;
      break;
    case 9:
    case 10:
      result = CFSTR("rectangle.inset.fill");
      break;
    case 11:
      result = CFSTR("rectangle.center.inset.fill");
      break;
    case 12:
      result = CFSTR("plus.rectangle.on.rectangle");
      break;
    case 13:
      result = CFSTR("minus.rectangle");
      break;
    case 14:
    case 16:
      result = CFSTR("ipad");
      break;
    case 15:
      result = CFSTR("display");
      break;
    case 17:
      result = CFSTR("xmark");
      break;
    default:
      result = &stru_1E8EC7EC0;
      break;
  }
  return result;
}

+ (id)landscapeImageNameForAction:(int64_t)a3
{
  __CFString *v3;
  uint64_t v4;
  __CFString *v5;
  const __CFString *v6;
  id result;

  v3 = CFSTR("rectangle.inset.fill");
  switch(a3)
  {
    case 1:
    case 9:
    case 10:
      goto LABEL_11;
    case 2:
      return CFSTR("rectangle.split.2x1");
    case 3:
      v4 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
      v5 = CFSTR("rectangle.lefthalf.inset.fill");
      v6 = CFSTR("rectangle.righthalf.inset.fill");
      goto LABEL_8;
    case 4:
      v4 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
      v5 = CFSTR("rectangle.righthalf.inset.fill");
      v6 = CFSTR("rectangle.lefthalf.inset.fill");
      goto LABEL_8;
    case 5:
    case 7:
      v4 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
      v5 = CFSTR("rectangle.rightthird.inset.fill");
      v6 = CFSTR("rectangle.leftthird.inset.fill");
      goto LABEL_8;
    case 6:
      v4 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
      v5 = CFSTR("rectangle.leftthird.inset.fill");
      v6 = CFSTR("rectangle.rightthird.inset.fill");
LABEL_8:
      if (v4 == 1)
        v5 = (__CFString *)v6;
      v3 = v5;
LABEL_11:
      result = v3;
      break;
    case 11:
      result = CFSTR("rectangle.center.inset.fill");
      break;
    case 12:
      result = CFSTR("plus.rectangle.on.rectangle");
      break;
    case 13:
      result = CFSTR("minus.rectangle");
      break;
    case 14:
    case 16:
      result = CFSTR("ipad.landscape");
      break;
    case 15:
      result = CFSTR("display");
      break;
    case 17:
      result = CFSTR("xmark");
      break;
    default:
      result = &stru_1E8EC7EC0;
      break;
  }
  return result;
}

- (SBTopAffordanceViewController)initWithDeviceApplicationSceneHandle:(id)a3
{
  id v5;
  SBTopAffordanceViewController *v6;
  SBTopAffordanceViewController *v7;
  uint64_t v8;
  BSSpringAnimationSettings *styleSettings;
  SBAffordancePresenceController *v10;
  void *v11;
  uint64_t v12;
  SBAffordancePresenceController *affordancePresenceController;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBTopAffordanceViewController;
  v6 = -[SBTopAffordanceViewController initWithNibName:bundle:](&v15, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    v6->_highlighted = 0;
    objc_storeStrong((id *)&v6->_sceneHandle, a3);
    objc_msgSend(MEMORY[0x1E0D01870], "settingsWithMass:stiffness:damping:", 2.0, 400.0, 45.0);
    v8 = objc_claimAutoreleasedReturnValue();
    styleSettings = v7->_styleSettings;
    v7->_styleSettings = (BSSpringAnimationSettings *)v8;

    v10 = [SBAffordancePresenceController alloc];
    -[SBDeviceApplicationSceneHandle _windowScene](v7->_sceneHandle, "_windowScene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SBAffordancePresenceController initWithDelegate:windowScene:](v10, "initWithDelegate:windowScene:", v7, v11);
    affordancePresenceController = v7->_affordancePresenceController;
    v7->_affordancePresenceController = (SBAffordancePresenceController *)v12;

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBTopAffordanceViewController;
  -[SBTopAffordanceViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  _SBTopAffordanceView *v3;
  _SBTopAffordanceView *v4;

  v3 = [_SBTopAffordanceView alloc];
  v4 = -[_SBTopAffordanceView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[_SBTopAffordanceView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SBTopAffordanceViewController setView:](self, "setView:", v4);

}

- (void)viewDidLoad
{
  void *v3;
  _UILumaTrackingBackdropView *v4;
  _UILumaTrackingBackdropView *lumaTrackingView;
  SBTopAffordanceDotsView *v6;
  SBTopAffordanceDotsView *dotsView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;
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
  objc_super v28;
  _QWORD v29[8];

  v29[6] = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)SBTopAffordanceViewController;
  -[SBTopAffordanceViewController viewDidLoad](&v28, sel_viewDidLoad);
  -[SBTopAffordanceViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTopAffordanceViewController _makeLumaTrackingView](self, "_makeLumaTrackingView");
  v4 = (_UILumaTrackingBackdropView *)objc_claimAutoreleasedReturnValue();
  lumaTrackingView = self->_lumaTrackingView;
  self->_lumaTrackingView = v4;

  objc_msgSend(v3, "addSubview:", self->_lumaTrackingView);
  -[SBTopAffordanceViewController _makeDotsView](self, "_makeDotsView");
  v6 = (SBTopAffordanceDotsView *)objc_claimAutoreleasedReturnValue();
  dotsView = self->_dotsView;
  self->_dotsView = v6;

  objc_msgSend(v3, "addSubview:", self->_dotsView);
  -[SBTopAffordanceDotsView centerXAnchor](self->_dotsView, "centerXAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v3;
  objc_msgSend(v3, "centerXAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v24;
  -[SBTopAffordanceDotsView centerYAnchor](self->_dotsView, "centerYAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTopAffordanceViewController _defaultCenterYOffset](self, "_defaultCenterYOffset");
  objc_msgSend(v23, "constraintEqualToAnchor:constant:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v21;
  -[_UILumaTrackingBackdropView centerXAnchor](self->_lumaTrackingView, "centerXAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTopAffordanceDotsView centerXAnchor](self->_dotsView, "centerXAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v18;
  -[_UILumaTrackingBackdropView topAnchor](self->_lumaTrackingView, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTopAffordanceDotsView topAnchor](self->_dotsView, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v10;
  -[_UILumaTrackingBackdropView widthAnchor](self->_lumaTrackingView, "widthAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToConstant:", 32.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v12;
  -[_UILumaTrackingBackdropView heightAnchor](self->_lumaTrackingView, "heightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToConstant:", 32.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addConstraints:", v15);

  v16 = -[SBAffordancePresenceController currentPresence](self->_affordancePresenceController, "currentPresence");
  v17 = 0.0;
  if (!v16)
    v17 = 1.0;
  -[SBTopAffordanceDotsView setAlpha:](self->_dotsView, "setAlpha:", v17);

}

- (void)setOverrideUserInterfaceStyle:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBTopAffordanceViewController;
  -[SBTopAffordanceViewController setOverrideUserInterfaceStyle:](&v4, sel_setOverrideUserInterfaceStyle_, a3);
  -[SBTopAffordanceViewController _updateStyleForOverrideUserInterfaceStyle](self, "_updateStyleForOverrideUserInterfaceStyle");
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (void)setHighlighted:(BOOL)a3
{
  BSSpringAnimationSettings *styleSettings;
  _QWORD v4[5];
  BOOL v5;

  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    styleSettings = self->_styleSettings;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __48__SBTopAffordanceViewController_setHighlighted___block_invoke;
    v4[3] = &unk_1E8E9F508;
    v4[4] = self;
    v5 = a3;
    objc_msgSend(MEMORY[0x1E0D01908], "animateWithSettings:actions:", styleSettings, v4);
  }
}

uint64_t __48__SBTopAffordanceViewController_setHighlighted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "setHighlighted:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)isExpanded
{
  void *v2;
  char v3;

  -[SBTopAffordanceViewController dotsView](self, "dotsView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHeld");

  return v3;
}

- (void)dismissAnimated:(BOOL)a3
{
  void *v4;
  id v5;

  if (-[SBTopAffordanceViewController isExpanded](self, "isExpanded", a3))
  {
    -[SBTopAffordanceViewController dotsView](self, "dotsView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contextMenuInteraction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissMenu");

  }
}

- (BOOL)isLumaTrackingEnabled
{
  return -[_UILumaTrackingBackdropView isPaused](self->_lumaTrackingView, "isPaused") ^ 1;
}

- (void)setLumaTrackingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  _UILumaTrackingBackdropView *lumaTrackingView;
  uint64_t v6;
  id v7;

  v3 = a3;
  if (-[_UILumaTrackingBackdropView isPaused](self->_lumaTrackingView, "isPaused") == a3)
  {
    lumaTrackingView = self->_lumaTrackingView;
    if (v3)
    {
      -[SBTopAffordanceViewController traitCollection](self, "traitCollection");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "userInterfaceStyle") == 2)
        v6 = 2;
      else
        v6 = 1;
      -[_UILumaTrackingBackdropView unpauseAfterSeedingWithLumaLevel:](lumaTrackingView, "unpauseAfterSeedingWithLumaLevel:", v6);

    }
    else
    {
      -[_UILumaTrackingBackdropView setPaused:](self->_lumaTrackingView, "setPaused:", 1);
    }
  }
}

- (BOOL)_dismissIfNeededWithLocation:(CGPoint)a3 window:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  NSObject *v14;
  uint8_t v15[16];

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (!-[SBTopAffordanceViewController isExpanded](self, "isExpanded"))
    goto LABEL_3;
  -[SBTopAffordanceViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "screen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fixedCoordinateSpace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "convertPoint:toCoordinateSpace:", v10, x, y);
  objc_msgSend(v8, "convertPoint:fromCoordinateSpace:", v10);
  objc_msgSend(v8, "hitTest:withEvent:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    SBLogTopAffordance();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "Top affordance dismiss upon screen tap", v15, 2u);
    }

    v12 = 1;
    -[SBTopAffordanceViewController dismissAnimated:](self, "dismissAnimated:", 1);
    -[SBTopAffordanceViewController _emitAnalyticsEventForMenuInteraction:](self, "_emitAnalyticsEventForMenuInteraction:", 18);
  }
  else
  {
LABEL_3:
    v12 = 0;
  }

  return v12;
}

- (BOOL)transientUIHandledTouch:(id)a3 withSystemGestureRecognizer:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;

  v5 = a3;
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  objc_msgSend(v5, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "convertPoint:fromView:", v12, v8, v10);
  v14 = v13;
  v16 = v15;

  objc_msgSend(v5, "window");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[SBTopAffordanceViewController _dismissIfNeededWithLocation:window:](self, "_dismissIfNeededWithLocation:window:", v17, v14, v16);
  return (char)self;
}

- (void)transientUI:(id)a3 wasIndirectPannedToDismissFromGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationInView:", v8);
  v10 = v9;
  v12 = v11;

  objc_msgSend(v7, "window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "convertPoint:fromView:", v14, v10, v12);
  v16 = v15;
  v18 = v17;

  objc_msgSend(v7, "window");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  -[SBTopAffordanceViewController _dismissIfNeededWithLocation:window:](self, "_dismissIfNeededWithLocation:window:", v19, v16, v18);
}

- (void)setAutoHides:(BOOL)a3
{
  self->_autoHides = a3;
  -[SBAffordancePresenceController setAutoHideAffordance:](self->_affordancePresenceController, "setAutoHideAffordance:");
}

- (void)affordancePresenceController:(id)a3 didChangeToPresence:(int64_t)a4
{
  SBTopAffordanceDotsView *dotsView;
  double v5;

  dotsView = self->_dotsView;
  v5 = 0.0;
  if (!a4)
    v5 = 1.0;
  -[SBTopAffordanceDotsView setAlpha:](dotsView, "setAlpha:", a3, v5);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBTopAffordanceViewController;
  v4 = a3;
  -[SBTopAffordanceViewController traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[SBTopAffordanceViewController traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[SBTopAffordanceViewController _updateStyleForOverrideUserInterfaceStyle](self, "_updateStyleForOverrideUserInterfaceStyle");
}

- (void)backgroundLumaView:(id)a3 didTransitionToLevel:(unint64_t)a4
{
  uint64_t v4;

  if (a4 == 2)
    v4 = 2;
  else
    v4 = 1;
  -[SBTopAffordanceViewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", v4);
}

- (void)_lockScreenUIDidLock:(id)a3
{
  -[SBTopAffordanceViewController dismissAnimated:](self, "dismissAnimated:", 0);
}

- (BOOL)_applicationSupportsAnyAffordanceActions
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  BOOL v6;

  -[SBTopAffordanceViewController _switcherController](self, "_switcherController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "windowManagementStyle");

  v5 = -[SBTopAffordanceViewController _applicationSupportsMedusa](self, "_applicationSupportsMedusa");
  if (v4)
    v6 = v5;
  else
    v6 = 0;
  return v6
      || v4 == 2
      || -[SBTopAffordanceViewController _multipleSwitcherControllersAvailable](self, "_multipleSwitcherControllersAvailable");
}

- (BOOL)_applicationSupportsMedusa
{
  void *v2;
  char v3;

  -[SBApplicationSceneHandle application](self->_sceneHandle, "application");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMedusaCapable");

  return v3;
}

- (BOOL)_layoutStatePrimaryApplicationSupportsMedusa
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (self->_override_layoutStatePrimaryApplicationSupportsMedusa)
    return 1;
  -[SBTopAffordanceViewController _switcherController](self, "_switcherController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "elementWithRole:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workspaceEntity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationSceneEntity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "application");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v8, "isMedusaCapable");

  return (char)v6;
}

- (BOOL)_applicationIsInOrCanMoveToSplitViewFromLayoutRole:(int64_t)a3
{
  _BOOL4 v5;
  BOOL v7;
  BOOL v8;

  v5 = -[SBTopAffordanceViewController _applicationSupportsMedusa](self, "_applicationSupportsMedusa");
  v7 = a3 == 3 || a3 == 4 || a3 == 1;
  v8 = !v7 && v5;
  if (v7 && v5)
    return -[SBTopAffordanceViewController _layoutStatePrimaryApplicationSupportsMedusa](self, "_layoutStatePrimaryApplicationSupportsMedusa");
  else
    return v8;
}

- (double)_defaultCenterYOffset
{
  double v2;

  objc_msgSend(MEMORY[0x1E0CEA9E8], "heightForStyle:orientation:", 0, 1);
  return v2 * 0.5;
}

- (void)_emitAnalyticsEventForMenuInteraction:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v11[0] = *MEMORY[0x1E0DABF68];
  -[SBApplicationSceneHandle application](self->_sceneHandle, "application");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v11[1] = *MEMORY[0x1E0DABF70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0DA9D78];
  v9 = v7;
  objc_msgSend(v8, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "emitEvent:withPayload:", 52, v9);

}

- (id)_makeLumaTrackingView
{
  id v3;
  void *v4;

  v3 = objc_alloc(MEMORY[0x1E0CEAE00]);
  v4 = (void *)objc_msgSend(v3, "initWithTransitionBoundaries:delegate:frame:", self, 0.4, 0.5, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v4;
}

- (id)_makeDotsView
{
  SBTopAffordanceDotsView *v3;
  SBTopAffordanceDotsView *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = [SBTopAffordanceDotsView alloc];
  v4 = -[SBTopAffordanceDotsView initWithFrame:delegate:](v3, "initWithFrame:delegate:", self, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAffordanceHitTestExtendTop");
  v7 = -v6;
  objc_msgSend(v5, "topAffordanceHitTestExtendLeft");
  v9 = -v8;
  objc_msgSend(v5, "topAffordanceHitTestExtendBottom");
  v11 = -v10;
  objc_msgSend(v5, "topAffordanceHitTestExtendRight");
  -[SBTopAffordanceDotsView setHitTestEdgeInsets:](v4, "setHitTestEdgeInsets:", v7, v9, v11, -v12);
  v13 = (void *)MEMORY[0x1E0CB3940];
  -[SBApplicationSceneHandle application](self->_sceneHandle, "application");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("top-affordance:%@"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTopAffordanceDotsView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v16);

  -[SBTopAffordanceDotsView setHidden:](v4, "setHidden:", -[SBTopAffordanceViewController _applicationSupportsAnyAffordanceActions](self, "_applicationSupportsAnyAffordanceActions") ^ 1);
  -[SBTopAffordanceDotsView setShowsMenuAsPrimaryAction:](v4, "setShowsMenuAsPrimaryAction:", 1);
  -[SBTopAffordanceDotsView setMenu:](v4, "setMenu:", self->_menu);

  return v4;
}

- (id)_makePillBackgroundContainerView
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v2;
}

- (id)_makePillContentsView
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v2;
}

- (void)updateContextMenuWithLayoutRole:(int64_t)a3 spaceConfiguration:(int64_t)a4 floatingConfiguration:(int64_t)a5 interfaceOrientation:(int64_t)a6 isZoomed:(BOOL)a7
{
  _BOOL4 v7;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  UIAction *maximizationAction;
  void *v16;
  UIAction *fullScreenAction;
  void *v18;
  void *v19;
  UIAction *v20;
  UIAction *v21;
  void *v22;
  UIAction *splitViewAction;
  void *v24;
  UIAction *v25;
  UIAction *v26;
  void *v27;
  void *v28;
  void *v29;
  UIAction *v30;
  UIAction *addToSetAction;
  void *v32;
  void *v33;
  void *v34;
  UIAction *v35;
  UIAction *removeFromSetAction;
  void *v37;
  void *v38;
  UIAction *v39;
  UIAction *v40;
  uint64_t v42;
  uint64_t v44;
  void *v45;
  UIAction *slideOverAction;
  void *v47;
  void *v48;
  UIAction *v49;
  UIAction *v50;
  void *v51;
  UIAction *primarySplitAction;
  void *v53;
  const __CFString *v54;
  void *v55;
  UIAction *v56;
  UIAction *v57;
  UIAction *sideSplitAction;
  void *v59;
  const __CFString *v60;
  void *v61;
  UIAction *v62;
  UIAction *v63;
  void *v64;
  void *v65;
  void *v66;
  UIAction *v67;
  void *v68;
  UIMenu *v69;
  UIMenu *splitViewMenu;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  UIAction *v75;
  UIAction *closeAction;
  void *v77;
  int v78;
  uint64_t v79;
  void *v80;
  __CFString *v81;
  __CFString *v82;
  UIAction *moveToDisplayAction;
  void *v84;
  UIAction *v85;
  UIAction *v86;
  void *v87;
  void *v88;
  _BOOL4 v89;
  void *v91;
  UIAction **p_fullScreenAction;
  BOOL v93;
  int *v94;
  id v95;
  BOOL v96;
  _BOOL4 v97;
  UIAction **p_primarySplitAction;
  void *v99;
  void *v100;
  UIMenu *v101;
  UIMenu *menu;
  _BOOL4 v103;
  void *v104;
  void *v105;
  void *v106;
  __CFString *v107;
  __CFString *v108;
  uint64_t v109;
  _BOOL4 v110;
  void *v111;
  void *v114;
  uint64_t v115;
  void *v116;
  _QWORD v117[4];
  id v118;
  _QWORD v119[4];
  id v120;
  _QWORD v121[4];
  id v122;
  _QWORD v123[4];
  id v124;
  _QWORD v125[4];
  id v126;
  _QWORD v127[4];
  id v128;
  _QWORD v129[4];
  id v130;
  _QWORD v131[4];
  id v132;
  _QWORD v133[4];
  id v134;
  _QWORD v135[4];
  id v136;
  id location;
  _QWORD v138[4];

  v7 = a7;
  v138[2] = *MEMORY[0x1E0C80C00];
  -[SBTopAffordanceViewController _switcherController](self, "_switcherController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = objc_msgSend(v11, "windowManagementStyle");

  v110 = -[SBTopAffordanceViewController _applicationSupportsMedusa](self, "_applicationSupportsMedusa");
  objc_initWeak(&location, self);
  if (v115 == 2)
  {
    if (v7)
      v12 = 11;
    else
      v12 = 10;
    +[SBTopAffordanceViewController imageForAction:interfaceOrientation:](SBTopAffordanceViewController, "imageForAction:interfaceOrientation:", v12, a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTopAffordanceViewController _localizedMenuTitleForKey:](self, "_localizedMenuTitleForKey:", CFSTR("TOP_AFFORDANCE_MENU_TITLE_MAXIMIZATION_ZOOM"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    maximizationAction = self->_maximizationAction;
    if (maximizationAction)
    {
      -[UIAction setTitle:](maximizationAction, "setTitle:", v14);
      -[UIAction setImage:](self->_maximizationAction, "setImage:", v13);
    }
    else
    {
      v24 = (void *)MEMORY[0x1E0CEA2A8];
      v135[0] = MEMORY[0x1E0C809B0];
      v135[1] = 3221225472;
      v135[2] = __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke;
      v135[3] = &unk_1E8EA3C88;
      objc_copyWeak(&v136, &location);
      objc_msgSend(v24, "actionWithTitle:image:identifier:handler:", v14, v13, CFSTR("top-affordance-toggle-maximization-button"), v135);
      v25 = (UIAction *)objc_claimAutoreleasedReturnValue();
      v26 = self->_maximizationAction;
      self->_maximizationAction = v25;

      -[UIAction setAccessibilityIdentifier:](self->_maximizationAction, "setAccessibilityIdentifier:", CFSTR("top-affordance-toggle-maximization-button"));
      objc_destroyWeak(&v136);
    }
    if (!self->_addToSetAction)
    {
      v27 = (void *)MEMORY[0x1E0CEA2A8];
      -[SBTopAffordanceViewController _localizedMenuTitleForKey:](self, "_localizedMenuTitleForKey:", CFSTR("TOP_AFFORDANCE_MENU_TITLE_ADD_TO_SET"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBTopAffordanceViewController imageForAction:interfaceOrientation:](SBTopAffordanceViewController, "imageForAction:interfaceOrientation:", 12, a6);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v133[0] = MEMORY[0x1E0C809B0];
      v133[1] = 3221225472;
      v133[2] = __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke_2;
      v133[3] = &unk_1E8EA3C88;
      objc_copyWeak(&v134, &location);
      objc_msgSend(v27, "actionWithTitle:image:identifier:handler:", v28, v29, CFSTR("top-affordance-add-to-set-button"), v133);
      v30 = (UIAction *)objc_claimAutoreleasedReturnValue();
      addToSetAction = self->_addToSetAction;
      self->_addToSetAction = v30;

      -[UIAction setAccessibilityIdentifier:](self->_addToSetAction, "setAccessibilityIdentifier:", CFSTR("top-affordance-add-to-set-button"));
      objc_destroyWeak(&v134);
    }
    if (!self->_removeFromSetAction)
    {
      v32 = (void *)MEMORY[0x1E0CEA2A8];
      -[SBTopAffordanceViewController _localizedMenuTitleForKey:](self, "_localizedMenuTitleForKey:", CFSTR("TOP_AFFORDANCE_MENU_TITLE_REMOVE_FROM_SET"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBTopAffordanceViewController imageForAction:interfaceOrientation:](SBTopAffordanceViewController, "imageForAction:interfaceOrientation:", 13, a6);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v131[0] = MEMORY[0x1E0C809B0];
      v131[1] = 3221225472;
      v131[2] = __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke_3;
      v131[3] = &unk_1E8EA3C88;
      objc_copyWeak(&v132, &location);
      objc_msgSend(v32, "actionWithTitle:image:identifier:handler:", v33, v34, CFSTR("top-affordance-remove-from-set-button"), v131);
      v35 = (UIAction *)objc_claimAutoreleasedReturnValue();
      removeFromSetAction = self->_removeFromSetAction;
      self->_removeFromSetAction = v35;

      -[UIAction setAccessibilityIdentifier:](self->_removeFromSetAction, "setAccessibilityIdentifier:", CFSTR("top-affordance-remove-from-set-button"));
      objc_destroyWeak(&v132);
    }

  }
  else
  {
    +[SBTopAffordanceViewController imageForAction:interfaceOrientation:](SBTopAffordanceViewController, "imageForAction:interfaceOrientation:", 1, a6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    fullScreenAction = self->_fullScreenAction;
    if (fullScreenAction)
    {
      -[UIAction setImage:](fullScreenAction, "setImage:", v16);
    }
    else
    {
      v18 = (void *)MEMORY[0x1E0CEA2A8];
      -[SBTopAffordanceViewController _localizedMenuTitleForKey:](self, "_localizedMenuTitleForKey:", CFSTR("TOP_AFFORDANCE_MENU_TITLE_FULL_SCREEN"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v129[0] = MEMORY[0x1E0C809B0];
      v129[1] = 3221225472;
      v129[2] = __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke_4;
      v129[3] = &unk_1E8EA3C88;
      objc_copyWeak(&v130, &location);
      objc_msgSend(v18, "actionWithTitle:image:identifier:handler:", v19, v16, CFSTR("top-affordance-full-screen-button"), v129);
      v20 = (UIAction *)objc_claimAutoreleasedReturnValue();
      v21 = self->_fullScreenAction;
      self->_fullScreenAction = v20;

      -[UIAction setAccessibilityIdentifier:](self->_fullScreenAction, "setAccessibilityIdentifier:", CFSTR("top-affordance-full-screen-button"));
      objc_destroyWeak(&v130);
    }
    +[SBTopAffordanceViewController imageForAction:interfaceOrientation:](SBTopAffordanceViewController, "imageForAction:interfaceOrientation:", 2, a6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    splitViewAction = self->_splitViewAction;
    if (splitViewAction)
    {
      -[UIAction setImage:](splitViewAction, "setImage:", v22);
    }
    else
    {
      v37 = (void *)MEMORY[0x1E0CEA2A8];
      -[SBTopAffordanceViewController _localizedMenuTitleForKey:](self, "_localizedMenuTitleForKey:", CFSTR("TOP_AFFORDANCE_MENU_TITLE_SPLIT_VIEW"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v127[0] = MEMORY[0x1E0C809B0];
      v127[1] = 3221225472;
      v127[2] = __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke_5;
      v127[3] = &unk_1E8EA3C88;
      objc_copyWeak(&v128, &location);
      objc_msgSend(v37, "actionWithTitle:image:identifier:handler:", v38, v22, CFSTR("top-affordance-split-view-button"), v127);
      v39 = (UIAction *)objc_claimAutoreleasedReturnValue();
      v40 = self->_splitViewAction;
      self->_splitViewAction = v39;

      -[UIAction setAccessibilityIdentifier:](self->_splitViewAction, "setAccessibilityIdentifier:", CFSTR("top-affordance-split-view-button"));
      objc_destroyWeak(&v128);
    }
    if (a3 != 1 || a4 <= 1)
      v42 = 7;
    else
      v42 = 6;
    if (a3 == 2)
      v42 = 7;
    if (a3 == 3 && (a5 & 0xFFFFFFFFFFFFFFFDLL) == 1)
      v44 = 6;
    else
      v44 = v42;
    +[SBTopAffordanceViewController imageForAction:interfaceOrientation:](SBTopAffordanceViewController, "imageForAction:interfaceOrientation:", v44, a6);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    slideOverAction = self->_slideOverAction;
    if (slideOverAction)
    {
      -[UIAction setImage:](slideOverAction, "setImage:", v45);
    }
    else
    {
      v47 = (void *)MEMORY[0x1E0CEA2A8];
      -[SBTopAffordanceViewController _localizedMenuTitleForKey:](self, "_localizedMenuTitleForKey:", CFSTR("TOP_AFFORDANCE_MENU_TITLE_SLIDE_OVER"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v125[0] = MEMORY[0x1E0C809B0];
      v125[1] = 3221225472;
      v125[2] = __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke_6;
      v125[3] = &unk_1E8EA3C88;
      objc_copyWeak(&v126, &location);
      objc_msgSend(v47, "actionWithTitle:image:identifier:handler:", v48, v45, CFSTR("top-affordance-slide-over-button"), v125);
      v49 = (UIAction *)objc_claimAutoreleasedReturnValue();
      v50 = self->_slideOverAction;
      self->_slideOverAction = v49;

      -[UIAction setAccessibilityIdentifier:](self->_slideOverAction, "setAccessibilityIdentifier:", CFSTR("top-affordance-slide-over-button"));
      objc_destroyWeak(&v126);
    }
    +[SBTopAffordanceViewController imageForAction:interfaceOrientation:](SBTopAffordanceViewController, "imageForAction:interfaceOrientation:", 3, a6);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    primarySplitAction = self->_primarySplitAction;
    if (primarySplitAction)
    {
      -[UIAction setImage:](primarySplitAction, "setImage:", v51);
    }
    else
    {
      v53 = (void *)MEMORY[0x1E0CEA2A8];
      if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
        v54 = CFSTR("TOP_AFFORDANCE_MENU_TITLE_RIGHT_SPLIT");
      else
        v54 = CFSTR("TOP_AFFORDANCE_MENU_TITLE_LEFT_SPLIT");
      -[SBTopAffordanceViewController _localizedMenuTitleForKey:](self, "_localizedMenuTitleForKey:", v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v123[0] = MEMORY[0x1E0C809B0];
      v123[1] = 3221225472;
      v123[2] = __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke_7;
      v123[3] = &unk_1E8EA3C88;
      objc_copyWeak(&v124, &location);
      objc_msgSend(v53, "actionWithTitle:image:identifier:handler:", v55, v51, CFSTR("top-affordance-split-view-left-button"), v123);
      v56 = (UIAction *)objc_claimAutoreleasedReturnValue();
      v57 = self->_primarySplitAction;
      self->_primarySplitAction = v56;

      -[UIAction setAccessibilityIdentifier:](self->_primarySplitAction, "setAccessibilityIdentifier:", CFSTR("top-affordance-split-view-left-button"));
      objc_destroyWeak(&v124);
    }
    +[SBTopAffordanceViewController imageForAction:interfaceOrientation:](SBTopAffordanceViewController, "imageForAction:interfaceOrientation:", 4, a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    sideSplitAction = self->_sideSplitAction;
    if (sideSplitAction)
    {
      -[UIAction setImage:](sideSplitAction, "setImage:", v13);
    }
    else
    {
      v59 = (void *)MEMORY[0x1E0CEA2A8];
      if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
        v60 = CFSTR("TOP_AFFORDANCE_MENU_TITLE_LEFT_SPLIT");
      else
        v60 = CFSTR("TOP_AFFORDANCE_MENU_TITLE_RIGHT_SPLIT");
      -[SBTopAffordanceViewController _localizedMenuTitleForKey:](self, "_localizedMenuTitleForKey:", v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v121[0] = MEMORY[0x1E0C809B0];
      v121[1] = 3221225472;
      v121[2] = __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke_8;
      v121[3] = &unk_1E8EA3C88;
      objc_copyWeak(&v122, &location);
      objc_msgSend(v59, "actionWithTitle:image:identifier:handler:", v61, v13, CFSTR("top-affordance-split-view-right-button"), v121);
      v62 = (UIAction *)objc_claimAutoreleasedReturnValue();
      v63 = self->_sideSplitAction;
      self->_sideSplitAction = v62;

      -[UIAction setAccessibilityIdentifier:](self->_sideSplitAction, "setAccessibilityIdentifier:", CFSTR("top-affordance-split-view-right-button"));
      objc_destroyWeak(&v122);
    }
    v64 = (void *)MEMORY[0x1E0CEA740];
    -[SBTopAffordanceViewController _localizedMenuTitleForKey:](self, "_localizedMenuTitleForKey:", CFSTR("TOP_AFFORDANCE_MENU_TITLE_SPLIT_VIEW"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBTopAffordanceViewController imageForAction:interfaceOrientation:](SBTopAffordanceViewController, "imageForAction:interfaceOrientation:", 2, a6);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = self->_sideSplitAction;
    v138[0] = self->_primarySplitAction;
    v138[1] = v67;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v138, 2);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "menuWithTitle:image:identifier:options:children:", v65, v66, CFSTR("top-affordance-split-view-sub-menu"), 32, v68);
    v69 = (UIMenu *)objc_claimAutoreleasedReturnValue();
    splitViewMenu = self->_splitViewMenu;
    self->_splitViewMenu = v69;

    -[UIMenu setAccessibilityIdentifier:](self->_splitViewMenu, "setAccessibilityIdentifier:", CFSTR("top-affordance-split-view-sub-menu"));
    -[UIMenu setPreferredElementSize:](self->_splitViewMenu, "setPreferredElementSize:", 1);
    -[UIMenu _sb_setSurfacesSelectionState:](self->_splitViewMenu, "_sb_setSurfacesSelectionState:", 1);
  }
  v71 = 1056;
  if (!self->_closeAction)
  {
    v72 = (void *)MEMORY[0x1E0CEA2A8];
    -[SBTopAffordanceViewController _localizedMenuTitleForKey:](self, "_localizedMenuTitleForKey:", CFSTR("TOP_AFFORDANCE_MENU_TITLE_CLOSE"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBTopAffordanceViewController imageForAction:interfaceOrientation:](SBTopAffordanceViewController, "imageForAction:interfaceOrientation:", 17, a6);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v119[0] = MEMORY[0x1E0C809B0];
    v119[1] = 3221225472;
    v119[2] = __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke_9;
    v119[3] = &unk_1E8EA3C88;
    objc_copyWeak(&v120, &location);
    objc_msgSend(v72, "actionWithTitle:image:identifier:handler:", v73, v74, CFSTR("top-affordance-close-window"), v119);
    v75 = (UIAction *)objc_claimAutoreleasedReturnValue();
    closeAction = self->_closeAction;
    self->_closeAction = v75;

    -[UIAction setAccessibilityIdentifier:](self->_closeAction, "setAccessibilityIdentifier:", CFSTR("top-affordance-close-window"));
    -[UIAction setAttributes:](self->_closeAction, "setAttributes:", 2);
    objc_destroyWeak(&v120);
  }
  -[SBDeviceApplicationSceneHandle _windowScene](self->_sceneHandle, "_windowScene");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = objc_msgSend(v77, "isMainDisplayWindowScene");

  if (v78)
    v79 = 15;
  else
    v79 = 16;
  +[SBTopAffordanceViewController imageForAction:interfaceOrientation:](SBTopAffordanceViewController, "imageForAction:interfaceOrientation:", v79, a6);
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  v81 = CFSTR("TOP_AFFORDANCE_MENU_TITLE_MOVE_TO_MAIN_DISPLAY");
  if (v78)
    v81 = CFSTR("TOP_AFFORDANCE_MENU_TITLE_MOVE_TO_EXTERNAL_DISPLAY");
  v82 = v81;
  -[SBTopAffordanceViewController _localizedMenuTitleForKey:](self, "_localizedMenuTitleForKey:", v82);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  moveToDisplayAction = self->_moveToDisplayAction;
  if (moveToDisplayAction)
  {
    -[UIAction setTitle:](moveToDisplayAction, "setTitle:", v114);
    -[UIAction setImage:](self->_moveToDisplayAction, "setImage:", v80);
  }
  else
  {
    v84 = (void *)MEMORY[0x1E0CEA2A8];
    v117[0] = MEMORY[0x1E0C809B0];
    v117[1] = 3221225472;
    v117[2] = __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke_10;
    v117[3] = &unk_1E8EA3C88;
    objc_copyWeak(&v118, &location);
    objc_msgSend(v84, "actionWithTitle:image:identifier:handler:", v114, v80, CFSTR("top-affordance-move-to-other-display-button"), v117);
    v85 = (UIAction *)objc_claimAutoreleasedReturnValue();
    v86 = self->_moveToDisplayAction;
    self->_moveToDisplayAction = v85;

    -[UIAction setAccessibilityIdentifier:](self->_moveToDisplayAction, "setAccessibilityIdentifier:", CFSTR("top-affordance-move-to-other-display-button"));
    objc_destroyWeak(&v118);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = v87;
  if (v115 == 2)
  {
    objc_msgSend(v87, "addObject:", self->_maximizationAction);
    objc_msgSend(v88, "addObject:", self->_addToSetAction);
    objc_msgSend(v88, "addObject:", self->_removeFromSetAction);
    goto LABEL_87;
  }
  v89 = -[SBTopAffordanceViewController _applicationSupportsMedusa](self, "_applicationSupportsMedusa");
  if (v115 == 1 && v89)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    p_fullScreenAction = &self->_fullScreenAction;
    objc_msgSend(v91, "addObject:", self->_fullScreenAction);
    if (-[SBTopAffordanceViewController _applicationIsInOrCanMoveToSplitViewFromLayoutRole:](self, "_applicationIsInOrCanMoveToSplitViewFromLayoutRole:", a3))
    {
      v93 = a3 == 1 && a4 == 1;
      v94 = &OBJC_IVAR___SBTopAffordanceViewController__splitViewMenu;
      if (v93)
        v94 = &OBJC_IVAR___SBTopAffordanceViewController__splitViewAction;
      v95 = *(id *)((char *)&self->super.super.super.isa + *v94);
      objc_msgSend(v91, "addObject:", v95);

    }
    if (v110)
      objc_msgSend(v91, "addObject:", self->_slideOverAction);
    objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:image:identifier:options:children:", &stru_1E8EC7EC0, 0, 0, 33, v91);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = v82;
    v111 = v80;
    v96 = 0;
    if (a3 == 3)
    {
      v97 = 0;
    }
    else
    {
      v97 = 0;
      if (a3 != 4)
      {
        v96 = a4 == 1;
        v97 = a4 != 1;
      }
    }
    -[UIAction setState:](*p_fullScreenAction, "setState:", 0, v91, v107, 1056);
    p_primarySplitAction = &self->_primarySplitAction;
    -[UIAction setState:](self->_primarySplitAction, "setState:", 0);
    -[UIAction setState:](self->_sideSplitAction, "setState:", 0);
    -[UIAction setState:](self->_slideOverAction, "setState:", 0);
    if (!v96)
    {
      if (v97)
      {
        if (a3 == 1 || (p_primarySplitAction = &self->_sideSplitAction, a3 == 2))
          -[UIAction setState:](*p_primarySplitAction, "setState:", 1);
        p_fullScreenAction = &self->_splitViewAction;
      }
      else
      {
        p_fullScreenAction = &self->_slideOverAction;
        if (a3 != 3)
        {
LABEL_86:
          objc_msgSend(v88, "addObject:", v116);

          v71 = v109;
          v80 = v111;
          v82 = v108;

          goto LABEL_87;
        }
      }
    }
    -[UIAction setState:](*p_fullScreenAction, "setState:", 1);
    goto LABEL_86;
  }
LABEL_87:
  if (-[SBTopAffordanceViewController _multipleSwitcherControllersAvailable](self, "_multipleSwitcherControllersAvailable"))
  {
    objc_msgSend(v88, "addObject:", self->_moveToDisplayAction);
  }
  objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:image:identifier:options:children:", &stru_1E8EC7EC0, 0, 0, 1, v88);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "addObject:", v99);
  if (!-[SBDeviceApplicationSceneHandle prefersKillingInSwitcherDisabled](self->_sceneHandle, "prefersKillingInSwitcherDisabled"))objc_msgSend(v100, "addObject:", *(Class *)((char *)&self->super.super.super.isa + v71));
  objc_msgSend(MEMORY[0x1E0CEA740], "menuWithTitle:image:identifier:options:children:", &stru_1E8EC7EC0, 0, CFSTR("top-affordance-context-menu"), 1, v100);
  v101 = (UIMenu *)objc_claimAutoreleasedReturnValue();
  menu = self->_menu;
  self->_menu = v101;

  v103 = -[SBTopAffordanceViewController _applicationSupportsAnyAffordanceActions](self, "_applicationSupportsAnyAffordanceActions");
  -[SBTopAffordanceDotsView setHidden:](self->_dotsView, "setHidden:", !v103);
  if (-[SBTopAffordanceViewController isExpanded](self, "isExpanded") && !v103)
  {
    -[SBTopAffordanceViewController dotsView](self, "dotsView");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "contextMenuInteraction");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "dismissMenu");

  }
  -[SBTopAffordanceDotsView setShowsMenuAsPrimaryAction:](self->_dotsView, "setShowsMenuAsPrimaryAction:", 1);
  -[SBTopAffordanceDotsView setMenu:](self->_dotsView, "setMenu:", self->_menu);

  objc_destroyWeak(&location);
}

void __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "topAffordanceViewController:handleActionType:", WeakRetained, 9);

}

void __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "topAffordanceViewController:handleActionType:", WeakRetained, 12);

}

void __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke_3(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "topAffordanceViewController:handleActionType:", WeakRetained, 13);

}

void __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke_4(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "topAffordanceViewController:handleActionType:", WeakRetained, 1);

}

void __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke_5(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "topAffordanceViewController:handleActionType:", WeakRetained, 2);

}

void __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke_6(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "topAffordanceViewController:handleActionType:", WeakRetained, 5);

}

void __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke_7(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "topAffordanceViewController:handleActionType:", WeakRetained, 3);

}

void __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke_8(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "topAffordanceViewController:handleActionType:", WeakRetained, 4);

}

void __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke_9(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "topAffordanceViewController:handleActionType:", WeakRetained, 17);

}

void __136__SBTopAffordanceViewController_updateContextMenuWithLayoutRole_spaceConfiguration_floatingConfiguration_interfaceOrientation_isZoomed___block_invoke_10(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "topAffordanceViewController:handleActionType:", WeakRetained, 14);

}

- (void)_updateStyleForOverrideUserInterfaceStyle
{
  id v2;

  -[SBTopAffordanceViewController view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

}

- (void)_setSystemPointerInteractionEnabled:(BOOL)a3
{
  if (self->_isSystemPointerInteractionEnabled != a3)
  {
    self->_isSystemPointerInteractionEnabled = a3;
    -[SBTopAffordanceDotsView setPointerInteractionEnabled:](self->_dotsView, "setPointerInteractionEnabled:");
  }
}

- (id)_localizedMenuTitleForKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_multipleSwitcherControllersAvailable
{
  BOOL v2;
  void *v3;
  void *v4;
  void *v5;

  if (self->_override_multipleSwitcherControllersAvailable)
    return 1;
  -[SBTopAffordanceViewController _switcherController](self, "_switcherController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "switcherCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coordinatedSwitcherControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (unint64_t)objc_msgSend(v5, "count") > 1;

  return v2;
}

- (id)_switcherController
{
  void *v2;
  void *v3;

  -[SBDeviceApplicationSceneHandle _windowScene](self->_sceneHandle, "_windowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "switcherController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setLayoutStatePrimaryApplicationSupportsMedusa:(BOOL)a3
{
  if (self->_override_layoutStatePrimaryApplicationSupportsMedusa != a3)
    self->_override_layoutStatePrimaryApplicationSupportsMedusa = a3;
}

- (void)_setMultipleSwitcherControllersAvailable:(BOOL)a3
{
  if (self->_override_multipleSwitcherControllersAvailable != a3)
    self->_override_multipleSwitcherControllersAvailable = a3;
}

- (BOOL)isHidden
{
  return -[SBAffordancePresenceController currentPresence](self->_affordancePresenceController, "currentPresence") != 0;
}

- (void)setHidden:(BOOL)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTopAffordanceViewController.m"), 809, CFSTR("-setHidden: is unavailable on SBTopAffordanceViewController"));

}

- (void)setHidden:(BOOL)a3 forReason:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;

  v5 = a5;
  v6 = a3;
  v8 = a4;
  if (v6)
    -[SBTopAffordanceViewController dismissAnimated:](self, "dismissAnimated:", v5);
  -[SBAffordancePresenceController setHidden:forReason:animated:](self->_affordancePresenceController, "setHidden:forReason:animated:", v6, v8, v5);

}

- (void)topAffordanceDotsViewWillPresentMenu:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "topAffordanceViewControllerWillPresentMenu:", self);

  -[SBDeviceApplicationSceneHandle _windowScene](self->_sceneHandle, "_windowScene");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transientUIInteractionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerParticipantForTapToDismiss:", self);

  objc_msgSend(v7, "transientUIInteractionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerParticipantForIndirectPanToDismiss:", self);

}

- (void)topAffordanceDotsViewWillDismissMenu:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[SBDeviceApplicationSceneHandle _windowScene](self->_sceneHandle, "_windowScene", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transientUIInteractionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterParticipantForTapToDismiss:", self);

  objc_msgSend(v6, "transientUIInteractionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterParticipantForIndirectPanToDismiss:", self);

}

- (SBTopAffordanceViewControllerDelegate)delegate
{
  return (SBTopAffordanceViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)autoHides
{
  return self->_autoHides;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (_UILumaTrackingBackdropView)lumaTrackingView
{
  return self->_lumaTrackingView;
}

- (SBDeviceApplicationSceneHandle)sceneHandle
{
  return self->_sceneHandle;
}

- (SBTopAffordanceDotsView)dotsView
{
  return self->_dotsView;
}

- (UIAction)maximizationAction
{
  return self->_maximizationAction;
}

- (UIAction)addToSetAction
{
  return self->_addToSetAction;
}

- (UIAction)removeFromSetAction
{
  return self->_removeFromSetAction;
}

- (UIAction)moveToDisplayAction
{
  return self->_moveToDisplayAction;
}

- (UIAction)closeAction
{
  return self->_closeAction;
}

- (UIAction)fullScreenAction
{
  return self->_fullScreenAction;
}

- (UIAction)splitViewAction
{
  return self->_splitViewAction;
}

- (UIMenu)splitViewMenu
{
  return self->_splitViewMenu;
}

- (UIAction)slideOverAction
{
  return self->_slideOverAction;
}

- (UIAction)primarySplitAction
{
  return self->_primarySplitAction;
}

- (UIAction)sideSplitAction
{
  return self->_sideSplitAction;
}

- (UIMenu)menu
{
  return self->_menu;
}

- (BSSpringAnimationSettings)styleSettings
{
  return self->_styleSettings;
}

- (void)setStyleSettings:(id)a3
{
  objc_storeStrong((id *)&self->_styleSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleSettings, 0);
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_sideSplitAction, 0);
  objc_storeStrong((id *)&self->_primarySplitAction, 0);
  objc_storeStrong((id *)&self->_slideOverAction, 0);
  objc_storeStrong((id *)&self->_splitViewMenu, 0);
  objc_storeStrong((id *)&self->_splitViewAction, 0);
  objc_storeStrong((id *)&self->_fullScreenAction, 0);
  objc_storeStrong((id *)&self->_closeAction, 0);
  objc_storeStrong((id *)&self->_moveToDisplayAction, 0);
  objc_storeStrong((id *)&self->_removeFromSetAction, 0);
  objc_storeStrong((id *)&self->_addToSetAction, 0);
  objc_storeStrong((id *)&self->_maximizationAction, 0);
  objc_storeStrong((id *)&self->_dotsView, 0);
  objc_storeStrong((id *)&self->_sceneHandle, 0);
  objc_storeStrong((id *)&self->_lumaTrackingView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_affordancePresenceController, 0);
}

@end
