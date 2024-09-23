@implementation SBMedusaHostedKeyboardWindow

- (void)medusaHostedKeyboardWindowWillHide:(id)a3
{
  SBMedusaHostedKeyboardWindow *v3;
  int v4;

  objc_msgSend(a3, "object");
  v3 = (SBMedusaHostedKeyboardWindow *)objc_claimAutoreleasedReturnValue();
  if (v3 == self)
  {

  }
  else
  {
    v4 = -[UIScenePresenter isActive](self->_remoteHostedKeyboardScenePresenter, "isActive");

    if (v4)
      -[UIScenePresenter deactivate](self->_remoteHostedKeyboardScenePresenter, "deactivate");
  }
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  UIScenePresenter *remoteHostedKeyboardScenePresenter;
  const char *v10;
  void *v11;
  void *v12;
  objc_super v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  UIScenePresenter *v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  SBLogMedusaKeyboard();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    _SBFLoggingMethodProem();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = "SHOWING";
    remoteHostedKeyboardScenePresenter = self->_remoteHostedKeyboardScenePresenter;
    if (v3)
      v8 = "HIDING";
    *(_DWORD *)buf = 138544130;
    v15 = v6;
    v16 = 2082;
    v17 = v8;
    v10 = "deactivating";
    if (!v3)
      v10 = "activating";
    v18 = 2080;
    v19 = v10;
    v20 = 2114;
    v21 = remoteHostedKeyboardScenePresenter;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "%{public}@ %{public}s the keyboard and %s scene presenter %{public}@", buf, 0x2Au);

  }
  v13.receiver = self;
  v13.super_class = (Class)SBMedusaHostedKeyboardWindow;
  -[SBWindow setHidden:](&v13, sel_setHidden_, v3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v3)
  {
    objc_msgSend(v11, "postNotificationName:object:", CFSTR("SBMedusaHostedKeyboardWindowWillHideNotification"), self);

    -[UIScenePresenter deactivate](self->_remoteHostedKeyboardScenePresenter, "deactivate");
  }
  else
  {
    objc_msgSend(v11, "postNotificationName:object:", CFSTR("SBMedusaHostedKeyboardWindowWillShowNotification"), self);

    -[UIScenePresenter activate](self->_remoteHostedKeyboardScenePresenter, "activate");
  }
}

- (SBMedusaHostedKeyboardWindow)initWithWindowScene:(id)a3 keyboardScene:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  SBMedusaHostedKeyboardWindow *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  UIScenePresenter *remoteHostedKeyboardScenePresenter;
  _SBHostedKeyboardViewController *v22;
  void *v23;
  void *v24;
  void *v25;
  NSMutableArray *v26;
  NSMutableArray *windowLevelAssertions;
  uint64_t v28;
  SBMedusaHostedKeyboardWindowLevelAssertion *defaultWindowLevelAssertion;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "settings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sb_displayIdentityForSceneManagers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UIScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "settings");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "displayConfiguration");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBMedusaHostedKeyboardWindow.m"), 69, CFSTR("Must have a UIScreen associated to the display identity vended by the keyboard scene: %@"), v35);

  }
  v36.receiver = self;
  v36.super_class = (Class)SBMedusaHostedKeyboardWindow;
  v12 = -[SBWindow initWithWindowScene:rootViewController:layoutStrategy:role:debugName:](&v36, sel_initWithWindowScene_rootViewController_layoutStrategy_role_debugName_, v7, 0, 0, CFSTR("SBTraitsParticipantRoleFloatingKeyboard"), CFSTR("HostedKeyboardWindow"));
  if (v12)
  {
    objc_msgSend(v8, "uiPresentationManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "_FBSScene");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    v18 = &stru_1E8EC7EC0;
    if (v16)
      v18 = (const __CFString *)v16;
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("SBMedusaHostedKeyboardWindow"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "createPresenterWithIdentifier:priority:", v19, 1);
    v20 = objc_claimAutoreleasedReturnValue();
    remoteHostedKeyboardScenePresenter = v12->_remoteHostedKeyboardScenePresenter;
    v12->_remoteHostedKeyboardScenePresenter = (UIScenePresenter *)v20;

    v22 = objc_alloc_init(_SBHostedKeyboardViewController);
    -[_SBHostedKeyboardViewController view](v22, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAutoresizingMask:", 18);

    -[_SBHostedKeyboardViewController view](v22, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScenePresenter presentationView](v12->_remoteHostedKeyboardScenePresenter, "presentationView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", v25);

    -[SBMedusaHostedKeyboardWindow setRootViewController:](v12, "setRootViewController:", v22);
    v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    windowLevelAssertions = v12->_windowLevelAssertions;
    v12->_windowLevelAssertions = v26;

    v28 = -[SBMedusaHostedKeyboardWindow newWindowLevelAssertionWithPriority:windowLevel:](v12, "newWindowLevelAssertionWithPriority:windowLevel:", 0, *MEMORY[0x1E0CEBE28] + 5.0 + 15.0);
    defaultWindowLevelAssertion = v12->_defaultWindowLevelAssertion;
    v12->_defaultWindowLevelAssertion = (SBMedusaHostedKeyboardWindowLevelAssertion *)v28;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObserver:selector:name:object:", v12, sel_medusaHostedKeyboardWindowWillShow_, CFSTR("SBMedusaHostedKeyboardWindowWillShowNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObserver:selector:name:object:", v12, sel_medusaHostedKeyboardWindowWillHide_, CFSTR("SBMedusaHostedKeyboardWindowWillHideNotification"), 0);

  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[SBMedusaHostedKeyboardWindow invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBMedusaHostedKeyboardWindow;
  -[SBWindow dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  -[UIScenePresenter invalidate](self->_remoteHostedKeyboardScenePresenter, "invalidate");
  -[SBMedusaHostedKeyboardWindowLevelAssertion invalidate](self->_defaultWindowLevelAssertion, "invalidate");
}

- (id)newWindowLevelAssertionWithPriority:(unint64_t)a3 windowLevel:(double)a4
{
  return -[SBMedusaHostedKeyboardWindowLevelAssertion initWithMedusaHostedKeyboardWindow:priority:windowLevel:]([SBMedusaHostedKeyboardWindowLevelAssertion alloc], "initWithMedusaHostedKeyboardWindow:priority:windowLevel:", self, a3, a4);
}

- (void)addWindowLevelAssertion:(id)a3
{
  id v4;
  NSMutableArray *windowLevelAssertions;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, uint64_t);
  void *v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  windowLevelAssertions = self->_windowLevelAssertions;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __56__SBMedusaHostedKeyboardWindow_addWindowLevelAssertion___block_invoke;
  v10 = &unk_1E8EAB590;
  v6 = v4;
  v11 = v6;
  v12 = &v13;
  -[NSMutableArray enumerateObjectsUsingBlock:](windowLevelAssertions, "enumerateObjectsUsingBlock:", &v7);
  -[NSMutableArray insertObject:atIndex:](self->_windowLevelAssertions, "insertObject:atIndex:", v6, v14[3], v7, v8, v9, v10);
  -[SBMedusaHostedKeyboardWindow _updateWindowLevel](self, "_updateWindowLevel");

  _Block_object_dispose(&v13, 8);
}

void __56__SBMedusaHostedKeyboardWindow_addWindowLevelAssertion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v7 = objc_msgSend(v5, "priority");
  v8 = objc_msgSend(v6, "priority");

  if (v7 > v8)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
}

- (void)removeWindowLevelAssertion:(id)a3
{
  -[NSMutableArray removeObject:](self->_windowLevelAssertions, "removeObject:", a3);
  -[SBMedusaHostedKeyboardWindow _updateWindowLevel](self, "_updateWindowLevel");
}

- (void)_updateWindowLevel
{
  void *v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray firstObject](self->_windowLevelAssertions, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "windowLevel");
    -[SBMedusaHostedKeyboardWindow setWindowLevel:](self, "setWindowLevel:");
    SBLogMedusaKeyboard();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "windowLevel");
      v9 = v8;
      v10 = objc_msgSend(v4, "priority");
      if ((unint64_t)(v10 - 1) > 2)
        v11 = CFSTR("Medusa");
      else
        v11 = off_1E8EAB5D8[v10 - 1];
      v12 = 138543874;
      v13 = v7;
      v14 = 2048;
      v15 = v9;
      v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating window level to %f for %{public}@", (uint8_t *)&v12, 0x20u);

    }
  }

}

- (BOOL)_shouldControlAutorotation
{
  return 0;
}

+ (BOOL)_isSecure
{
  return 1;
}

+ (BOOL)autorotates
{
  return 0;
}

- (BOOL)isActive
{
  return 0;
}

- (void)medusaHostedKeyboardWindowWillShow:(id)a3
{
  SBMedusaHostedKeyboardWindow *v3;
  int v4;

  objc_msgSend(a3, "object");
  v3 = (SBMedusaHostedKeyboardWindow *)objc_claimAutoreleasedReturnValue();
  if (v3 == self)
  {

  }
  else
  {
    v4 = -[UIScenePresenter isActive](self->_remoteHostedKeyboardScenePresenter, "isActive");

    if (v4)
      -[UIScenePresenter deactivate](self->_remoteHostedKeyboardScenePresenter, "deactivate");
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  SBMedusaHostedKeyboardWindow *v5;
  SBMedusaHostedKeyboardWindow *v6;
  SBMedusaHostedKeyboardWindow *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBMedusaHostedKeyboardWindow;
  -[SBMedusaHostedKeyboardWindow hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (SBMedusaHostedKeyboardWindow *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

- (NSString)description
{
  return (NSString *)-[SBMedusaHostedKeyboardWindow descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBMedusaHostedKeyboardWindow succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMedusaHostedKeyboardWindow _debugName](self, "_debugName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v4, 0, 1);

  -[SBMedusaHostedKeyboardWindow frame](self, "frame");
  _SBWindowFrameDescription(v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendObject:withName:", v10, CFSTR("frame"));

  v12 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", -[SBMedusaHostedKeyboardWindow isHidden](self, "isHidden"), CFSTR("hidden"), 1);
  -[SBMedusaHostedKeyboardWindow layer](self, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v3, "appendObject:withName:", v13, CFSTR("layer"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBMedusaHostedKeyboardWindow descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBMedusaHostedKeyboardWindow *v11;

  v4 = a3;
  -[SBMedusaHostedKeyboardWindow succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__SBMedusaHostedKeyboardWindow_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __70__SBMedusaHostedKeyboardWindow_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 968), CFSTR("presenter"));
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 984), "count");
  v4 = *(void **)(a1 + 32);
  if (v3 == 1)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 984), "firstObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("( %@)"), v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v4, "appendObject:withName:", v6, CFSTR("window level assertions"));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "appendArraySection:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 984), CFSTR("window level assertions"), 1);
  }
}

- (NSMutableArray)windowLevelAssertions
{
  return self->_windowLevelAssertions;
}

- (void)setWindowLevelAssertions:(id)a3
{
  objc_storeStrong((id *)&self->_windowLevelAssertions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowLevelAssertions, 0);
  objc_storeStrong((id *)&self->_defaultWindowLevelAssertion, 0);
  objc_storeStrong((id *)&self->_remoteHostedKeyboardScenePresenter, 0);
}

@end
