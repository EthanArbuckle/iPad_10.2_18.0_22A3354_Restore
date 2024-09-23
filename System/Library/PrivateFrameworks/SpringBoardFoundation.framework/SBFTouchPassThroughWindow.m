@implementation SBFTouchPassThroughWindow

- (SBFTouchPassThroughWindow)initWithWindowScene:(id)a3 role:(id)a4 debugName:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  SBFTouchPassThroughWindow *v21;
  objc_class *v22;
  id v23;
  void *v25;
  objc_super v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
    objc_msgSend(v9, "screen");
  else
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v26.receiver = self;
  v26.super_class = (Class)SBFTouchPassThroughWindow;
  v21 = (SBFTouchPassThroughWindow *)-[SBFTouchPassThroughWindow _initWithFrame:debugName:windowScene:](&v26, sel__initWithFrame_debugName_windowScene_, v11, v9, v14, v16, v18, v20);
  if (v21)
  {
    v22 = (objc_class *)objc_msgSend((id)objc_opt_class(), "touchPassThroughRootViewControllerClass");
    if ((-[objc_class isSubclassOfClass:](v22, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
    {
      if (!v10)
      {
LABEL_8:
        v23 = objc_alloc_init(v22);
        -[SBFTouchPassThroughWindow setRootViewController:](v21, "setRootViewController:", v23);

        goto LABEL_9;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, v21, CFSTR("SBFTouchPassThroughWindow.m"), 29, CFSTR("Requested rootVC class must be a subclass of SBFTouchPassThroughViewController"));

      if (!v10)
        goto LABEL_8;
    }
    -[SBFTouchPassThroughWindow _setRoleHint:](v21, "_setRoleHint:", v10);
    goto LABEL_8;
  }
LABEL_9:

  return v21;
}

+ (Class)touchPassThroughRootViewControllerClass
{
  return (Class)objc_opt_class();
}

- (SBFTouchPassThroughWindow)initWithFrame:(CGRect)a3
{
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99750];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("%s is not a valid initializer. You must call -[%@ initWithWindowScene:role:debugName:]."), "-[SBFTouchPassThroughWindow initWithFrame:]", v7);

  return -[SBFTouchPassThroughWindow initWithWindowScene:role:debugName:](self, "initWithWindowScene:role:debugName:", 0, 0, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFTouchPassThroughWindow _debugName](self, "_debugName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, 0);

  v6 = (id)objc_msgSend(v3, "appendSuper");
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  SBFTouchPassThroughWindow *v5;
  SBFTouchPassThroughWindow *v6;
  SBFTouchPassThroughWindow *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBFTouchPassThroughWindow;
  -[SBFTouchPassThroughWindow hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (SBFTouchPassThroughWindow *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

@end
