@implementation SBAssistantWindow

+ (id)defaultLayoutStrategy
{
  return +[SBWindowDefaultLayoutStrategy noClipStrategy](SBWindowDefaultLayoutStrategy, "noClipStrategy");
}

+ (BOOL)sb_autorotates
{
  return 0;
}

- (SBAssistantWindow)initWithWindowScene:(id)a3 role:(id)a4 debugName:(id)a5
{
  id v8;
  SBAssistantWindow *v9;
  SBAssistantRootViewController *v10;
  void *v11;
  SBAssistantRootViewController *v12;
  objc_super v14;
  objc_super v15;

  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBAssistantWindow;
  v9 = -[SBWindow initWithWindowScene:rootViewController:layoutStrategy:role:debugName:](&v15, sel_initWithWindowScene_rootViewController_layoutStrategy_role_debugName_, v8, 0, 0, a4, a5);
  if (v9)
  {
    v10 = [SBAssistantRootViewController alloc];
    objc_msgSend(v8, "screen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SBAssistantRootViewController initWithScreen:](v10, "initWithScreen:", v11);
    v14.receiver = v9;
    v14.super_class = (Class)SBAssistantWindow;
    -[SBAssistantWindow setRootViewController:](&v14, sel_setRootViewController_, v12);

    -[SBAssistantWindow setWindowLevel:](v9, "setWindowLevel:", *MEMORY[0x1E0CEBBD0] + 25.0);
    -[SBAssistantWindow setAccessibilityIdentifier:](v9, "setAccessibilityIdentifier:", CFSTR("siri-interface-window"));
    -[SBAssistantWindow setAllowsTouchPassThrough:](v9, "setAllowsTouchPassThrough:", 0);
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBAssistantWindow;
  -[SBAssistantWindow setRootViewController:](&v4, sel_setRootViewController_, 0);
  v3.receiver = self;
  v3.super_class = (Class)SBAssistantWindow;
  -[SBWindow dealloc](&v3, sel_dealloc);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  SBAssistantWindow *v5;
  SBAssistantWindow *v6;
  SBAssistantWindow *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBAssistantWindow;
  -[SBAssistantWindow hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (SBAssistantWindow *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v5 = 0;
  v7 = v5;

  return v7;
}

- (BOOL)isOpaque
{
  return 0;
}

- (BOOL)_canBecomeKeyWindow
{
  return 1;
}

- (id)_hitTest:(CGPoint)a3 withEvent:(id)a4 windowServerHitTestWindow:(id)a5
{
  double y;
  double x;
  id v9;
  SBAssistantWindow *v10;
  void *v11;
  objc_super v13;
  objc_super v14;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  v10 = (SBAssistantWindow *)a5;
  if (-[SBAssistantWindow allowsTouchPassThrough](self, "allowsTouchPassThrough"))
  {

    if (self == v10)
    {
      v14.receiver = self;
      v14.super_class = (Class)SBAssistantWindow;
      -[SBAssistantWindow _hitTest:withEvent:windowServerHitTestWindow:](&v14, sel__hitTest_withEvent_windowServerHitTestWindow_, v9, self, x, y);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBAssistantWindow;
    -[SBAssistantWindow _hitTest:withEvent:windowServerHitTestWindow:](&v13, sel__hitTest_withEvent_windowServerHitTestWindow_, v9, v10, x, y);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (void)_usesWindowServerHitTesting
{
  if (a1)
    return (void *)objc_msgSend(a1, "allowsTouchPassThrough");
  return a1;
}

- (id)hostedSceneIdentityTokens
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__126;
  v13 = __Block_byref_object_dispose__126;
  v14 = 0;
  -[UIWindow _sbWindowScene](self, "_sbWindowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assistantController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isVisible");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __46__SBAssistantWindow_hostedSceneIdentityTokens__block_invoke;
    v8[3] = &unk_1E8EA2C08;
    v8[4] = &v9;
    objc_msgSend(v5, "enumerateScenesWithBlock:", v8);

  }
  if (v10[5])
  {
    v15[0] = v10[5];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __46__SBAssistantWindow_hostedSceneIdentityTokens__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = objc_msgSend(v14, "isActive");
  v6 = v14;
  if (v5)
  {
    objc_msgSend(v14, "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isForeground") & 1) != 0)
    {
      objc_msgSend(v14, "clientProcess");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.siri"));

      v6 = v14;
      if (v10)
      {
        objc_msgSend(v14, "identityToken");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v13 = *(void **)(v12 + 40);
        *(_QWORD *)(v12 + 40) = v11;

        v6 = v14;
        *a3 = 1;
      }
    }
    else
    {

      v6 = v14;
    }
  }

}

- (BOOL)allowsTouchPassThrough
{
  void *v2;
  char v3;

  -[SBAssistantWindow layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hitTestsAsOpaque") ^ 1;

  return v3;
}

- (void)setAllowsTouchPassThrough:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[SBAssistantWindow layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHitTestsAsOpaque:", !v3);

}

- (void)setRootViewController:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("%s is not supported."), "-[SBAssistantWindow setRootViewController:]");
}

@end
