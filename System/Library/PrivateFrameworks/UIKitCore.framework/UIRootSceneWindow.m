@implementation UIRootSceneWindow

- (BOOL)_appearsInLoupe
{
  return 0;
}

- (UIRootSceneWindow)initWithDisplay:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIRootSceneWindow.m"), 34, CFSTR("you can't call this"));

  return 0;
}

- (UIRootSceneWindow)initWithScreen:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIRootSceneWindow.m"), 39, CFSTR("you can't call this"));

  return 0;
}

- (UIRootSceneWindow)initWithDisplayConfiguration:(id)a3
{
  id v5;
  UIRootSceneWindow *v6;
  UIRootSceneWindow *v7;
  UIMutableTransformer *v8;
  UIMutableTransformer *sceneTransformer;
  UIView *v10;
  uint64_t v11;
  UIView *sceneContainerView;
  void *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UIRootSceneWindow;
  v6 = -[_UIRootWindow initWithDisplay:](&v15, sel_initWithDisplay_, v5);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_displayConfiguration, a3);
    v8 = objc_alloc_init(UIMutableTransformer);
    sceneTransformer = v7->_sceneTransformer;
    v7->_sceneTransformer = v8;

    -[UIMutableTransformer _setDelegate:](v7->_sceneTransformer, "_setDelegate:", v7);
    v10 = [UIView alloc];
    -[UIView bounds](v7, "bounds");
    v11 = -[UIView initWithFrame:](v10, "initWithFrame:");
    sceneContainerView = v7->_sceneContainerView;
    v7->_sceneContainerView = (UIView *)v11;

    -[UIView setAutoresizingMask:](v7->_sceneContainerView, "setAutoresizingMask:", 18);
    -[UIView addSubview:](v7, "addSubview:", v7->_sceneContainerView);
    +[UIColor blackColor](UIColor, "blackColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v7, "setBackgroundColor:", v13);

    -[UIWindow setLevel:](v7, "setLevel:", 0.0);
    -[UIView setOpaque:](v7, "setOpaque:", 1);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[UIMutableTransformer _setDelegate:](self->_sceneTransformer, "_setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIRootSceneWindow;
  -[_UIRootWindow dealloc](&v3, sel_dealloc);
}

+ (BOOL)definesDisplayBounds
{
  return 0;
}

- (BOOL)_usesWindowServerHitTesting
{
  return 1;
}

- (BOOL)_shouldPrepareScreenForWindow
{
  return 0;
}

- (BOOL)canBecomeKeyWindow
{
  return 0;
}

- (id)_focusResponder
{
  return 0;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  UIRootSceneWindow *v5;
  UIRootSceneWindow *v6;
  UIRootSceneWindow *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIRootSceneWindow;
  -[UIView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (UIRootSceneWindow *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
  {
    v5 = 0;
  }
  else if (v5 == (UIRootSceneWindow *)self->_sceneContainerView)
  {
    v5 = 0;
  }
  v7 = v5;

  return v7;
}

+ (BOOL)_isSecure
{
  return 1;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  FBSDisplayConfiguration *displayConfiguration;
  objc_super v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  FBSDisplayConfiguration *v38;
  uint64_t v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v39 = *MEMORY[0x1E0C80C00];
  -[UIView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v30.receiver = self;
  v30.super_class = (Class)UIRootSceneWindow;
  -[UIWindow setFrame:](&v30, sel_setFrame_, x, y, width, height);
  -[UIView frame](self, "frame");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v40.origin.x = v9;
  v40.origin.y = v11;
  v40.size.width = v13;
  v40.size.height = v15;
  v43.origin.x = v17;
  v43.origin.y = v19;
  v43.size.width = v21;
  v43.size.height = v23;
  if (!CGRectEqualToRect(v40, v43))
  {
    UIScenePresentationLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v41.origin.x = v9;
      v41.origin.y = v11;
      v41.size.width = v13;
      v41.size.height = v15;
      NSStringFromCGRect(v41);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v42.origin.x = v17;
      v42.origin.y = v19;
      v42.size.width = v21;
      v42.size.height = v23;
      NSStringFromCGRect(v42);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      displayConfiguration = self->_displayConfiguration;
      *(_DWORD *)buf = 138544130;
      v32 = v26;
      v33 = 2114;
      v34 = v27;
      v35 = 2114;
      v36 = v28;
      v37 = 2114;
      v38 = displayConfiguration;
      _os_log_impl(&dword_185066000, v24, OS_LOG_TYPE_INFO, "[%{public}@] modified frame from %{public}@ to %{public}@ on display: %{public}@", buf, 0x2Au);

    }
  }
}

- (void)_configureContextOptions:(id)a3
{
  id v3;

  v3 = a3;
  if (objc_msgSend((id)objc_opt_class(), "definesDisplayBounds"))
    objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD2A08]);

}

- (void)_updateTransforms
{
  UIView *sceneContainerView;
  UIMutableTransformer *sceneTransformer;
  _OWORD v4[3];

  sceneContainerView = self->_sceneContainerView;
  sceneTransformer = self->_sceneTransformer;
  if (sceneTransformer)
    -[UITransform transform](sceneTransformer, "transform");
  else
    memset(v4, 0, sizeof(v4));
  -[UIView setTransform:](sceneContainerView, "setTransform:", v4);
}

- (FBSDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (UIMutableTransformer)sceneTransformer
{
  return self->_sceneTransformer;
}

- (UIView)_sceneContainerView
{
  return self->_sceneContainerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneTransformer, 0);
  objc_storeStrong((id *)&self->_sceneContainerView, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
}

@end
