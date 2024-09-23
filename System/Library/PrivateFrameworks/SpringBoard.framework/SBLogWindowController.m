@implementation SBLogWindowController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_47 != -1)
    dispatch_once(&sharedInstance_onceToken_47, &__block_literal_global_322);
  return (id)gSharedInstance;
}

void __39__SBLogWindowController_sharedInstance__block_invoke()
{
  SBLogWindowController *v0;
  void *v1;

  v0 = objc_alloc_init(SBLogWindowController);
  v1 = (void *)gSharedInstance;
  gSharedInstance = (uint64_t)v0;

}

+ (id)sharedInstanceIfAvailable
{
  return (id)gSharedInstance;
}

+ (UIWindowScene)windowScene
{
  return (UIWindowScene *)objc_loadWeakRetained(&_windowScene);
}

+ (void)setWindowScene:(id)a3
{
  id WeakRetained;
  void *v4;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained(&_windowScene);

  v4 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak(&_windowScene, obj);
    +[SBLogWindowController sharedInstanceIfAvailable](SBLogWindowController, "sharedInstanceIfAvailable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_createAndUpdateWindowIfNecessary");

    v4 = obj;
  }

}

- (SBLogWindowController)initWithNibName:(id)a3 bundle:(id)a4
{
  SBLogWindowController *v4;
  SBLogWindowController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBLogWindowController;
  v4 = -[SBLogWindowController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    -[SBLogWindowController _createAndUpdateWindowIfNecessary](v4, "_createAndUpdateWindowIfNecessary");
  return v5;
}

- (void)_createAndUpdateWindowIfNecessary
{
  SBWindow *logWindow;
  id v4;
  SBWindow *v5;
  SBWindow *v6;
  SBWindow *v7;
  void *v8;
  void *v9;
  void *v10;
  UITextView *v11;
  UITextView *logTextView;
  UITextView *v13;
  void *v14;
  void *v15;
  id v16;

  objc_msgSend((id)objc_opt_class(), "windowScene");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  logWindow = self->_logWindow;
  if (logWindow)
  {
    -[SBWindow windowScene](logWindow, "windowScene");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (v4 != v16)
      -[SBWindow setWindowScene:](self->_logWindow, "setWindowScene:", v16);
  }
  else
  {
    v5 = -[SBWindow initWithWindowScene:role:debugName:]([SBWindow alloc], "initWithWindowScene:role:debugName:", v16, CFSTR("SBTraitsParticipantRoleLogWindowRecipe"), CFSTR("LogWindow"));
    v6 = self->_logWindow;
    self->_logWindow = v5;

    v7 = self->_logWindow;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB8]), "initWithNibName:bundle:", 0, 0);
    -[SBWindow setRootViewController:](v7, "setRootViewController:", v8);

    -[SBWindow rootViewController](self->_logWindow, "rootViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBWindow setWindowLevel:](self->_logWindow, "setWindowLevel:", *MEMORY[0x1E0CEBBD0] + 250.0 + -1.0);
    -[SBWindow setHidden:](self->_logWindow, "setHidden:", 1);
    v11 = (UITextView *)objc_alloc_init(MEMORY[0x1E0CEAB18]);
    logTextView = self->_logTextView;
    self->_logTextView = v11;

    -[UITextView setAutoresizingMask:](self->_logTextView, "setAutoresizingMask:", 18);
    v13 = self->_logTextView;
    -[SBWindow rootViewController](self->_logWindow, "rootViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    -[UITextView setFrame:](v13, "setFrame:");

    objc_msgSend(v10, "addSubview:", self->_logTextView);
  }

}

- (void)show
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGRect v12;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[SBWindow setHidden:](self->_logWindow, "setHidden:", 0);
  v12.origin.x = v5;
  v12.origin.y = v7;
  v12.size.width = v9;
  v12.size.height = v11;
  -[SBWindow setFrame:](self->_logWindow, "setFrame:", CGRectGetMaxX(v12) + -300.0, 0.0, 300.0, 300.0);
}

- (void)hide
{
  -[SBWindow setHidden:](self->_logWindow, "setHidden:", 1);
}

- (UITextView)logTextView
{
  return self->_logTextView;
}

- (void)setLogTextView:(id)a3
{
  objc_storeStrong((id *)&self->_logTextView, a3);
}

- (SBWindow)logWindow
{
  return self->_logWindow;
}

- (void)setLogWindow:(id)a3
{
  objc_storeStrong((id *)&self->_logWindow, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logWindow, 0);
  objc_storeStrong((id *)&self->_logTextView, 0);
}

@end
