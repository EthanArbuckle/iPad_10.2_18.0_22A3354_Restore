@implementation SBDashBoardStatusBarController

- (SBDashBoardStatusBarController)initWithWindowSceneStatusBarManager:(id)a3
{
  id v4;
  SBDashBoardStatusBarController *v5;
  NSMutableSet *v6;
  NSMutableSet *statusBarHiddenReasons;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableSet *statusBars;
  uint64_t v12;
  NSMapTable *statusBarsToVisbilityAssertions;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBDashBoardStatusBarController;
  v5 = -[SBDashBoardStatusBarController init](&v15, sel_init);
  if (v5)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    statusBarHiddenReasons = v5->_statusBarHiddenReasons;
    v5->_statusBarHiddenReasons = v6;

    objc_storeWeak((id *)&v5->_windowSceneStatusBarManager, v4);
    v8 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v4, "statusBar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithObject:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    statusBars = v5->_statusBars;
    v5->_statusBars = (NSMutableSet *)v10;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v12 = objc_claimAutoreleasedReturnValue();
    statusBarsToVisbilityAssertions = v5->_statusBarsToVisbilityAssertions;
    v5->_statusBarsToVisbilityAssertions = (NSMapTable *)v12;

  }
  return v5;
}

- (void)dealloc
{
  NSObject *v3;
  _BOOL4 v4;
  objc_super v5;

  if (-[NSMutableSet count](self->_statusBarHiddenReasons, "count"))
  {
    SBLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);

    if (v4)
      NSLog(CFSTR("SBDashBoardStatusBarController being deallocated with outstanding status bar hidden reasons"));
  }
  v5.receiver = self;
  v5.super_class = (Class)SBDashBoardStatusBarController;
  -[SBDashBoardStatusBarController dealloc](&v5, sel_dealloc);
}

- (id)effectiveStatusBarStyleRequestForAlpha:(id)a3 style:(int64_t)a4 legibilitySettings:(id)a5
{
  id v8;
  id v9;
  SBMutableStatusBarSettings *v10;
  SBMutableStatusBarSettings *v11;
  id WeakRetained;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a5;
  v10 = objc_alloc_init(SBMutableStatusBarSettings);
  v11 = v10;
  if (v8)
    -[SBMutableStatusBarSettings setAlpha:](v10, "setAlpha:", v8);
  if (a4 != -1)
    -[SBMutableStatusBarSettings setStyle:](v11, "setStyle:", a4);
  if (v9)
    -[SBMutableStatusBarSettings setLegibilitySettings:](v11, "setLegibilitySettings:", v9);
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowSceneStatusBarManager);
  objc_msgSend(WeakRetained, "assertionManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "effectiveStatusBarStyleRequestWithSettings:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)createFakeStatusBarWithReason:(id)a3 withFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  SBWindowSceneStatusBarManager **p_windowSceneStatusBarManager;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  p_windowSceneStatusBarManager = &self->_windowSceneStatusBarManager;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_windowSceneStatusBarManager);
  objc_msgSend(WeakRetained, "reusePool");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "getReusableStatusBarWithReason:withFrame:", v10, x, y, width, height);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableSet addObject:](self->_statusBars, "addObject:", v13);
  return v13;
}

- (void)destroyFakeStatusBar:(id)a3
{
  NSMapTable *statusBarsToVisbilityAssertions;
  id v5;
  void *v6;
  void *v7;
  id WeakRetained;

  statusBarsToVisbilityAssertions = self->_statusBarsToVisbilityAssertions;
  v5 = a3;
  -[NSMapTable objectForKey:](statusBarsToVisbilityAssertions, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[NSMapTable removeObjectForKey:](self->_statusBarsToVisbilityAssertions, "removeObjectForKey:", v5);
  -[NSMutableSet removeObject:](self->_statusBars, "removeObject:", v5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowSceneStatusBarManager);
  objc_msgSend(WeakRetained, "reusePool");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recycleStatusBar:", v5);

}

- (void)setStatusBarHidden:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableSet *statusBarHiddenReasons;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  SBWindowSceneStatusBarSettingsAssertion *v12;
  SBWindowSceneStatusBarSettingsAssertion *hideStatusBarAssertion;
  uint64_t v14;
  SBWindowSceneStatusBarSettingsAssertion *v15;
  id v16;

  v4 = a3;
  v6 = a4;
  statusBarHiddenReasons = self->_statusBarHiddenReasons;
  v16 = v6;
  if (v4)
  {
    -[NSMutableSet addObject:](statusBarHiddenReasons, "addObject:", v6);
    v8 = v16;
    if (!self->_hideStatusBarAssertion)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_windowSceneStatusBarManager);
      objc_msgSend(WeakRetained, "assertionManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBDashBoardStatusBarController-0x%p"), self);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (SBWindowSceneStatusBarSettingsAssertion *)objc_msgSend(v10, "newSettingsAssertionWithStatusBarHidden:atLevel:reason:", 1, 8, v11);
      hideStatusBarAssertion = self->_hideStatusBarAssertion;
      self->_hideStatusBarAssertion = v12;

      -[SBWindowSceneStatusBarSettingsAssertion acquire](self->_hideStatusBarAssertion, "acquire");
LABEL_7:

      v8 = v16;
    }
  }
  else
  {
    -[NSMutableSet removeObject:](statusBarHiddenReasons, "removeObject:", v6);
    v14 = -[NSMutableSet count](self->_statusBarHiddenReasons, "count");
    v8 = v16;
    if (!v14)
    {
      v15 = self->_hideStatusBarAssertion;
      if (v15)
      {
        -[SBWindowSceneStatusBarSettingsAssertion invalidate](v15, "invalidate");
        v10 = self->_hideStatusBarAssertion;
        self->_hideStatusBarAssertion = 0;
        goto LABEL_7;
      }
    }
  }

}

- (void)setStatusBarAlpha:(id)a3 style:(int64_t)a4 legibilitySettings:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD);
  SBWindowSceneStatusBarSettingsAssertion *statusBarParametersAssertion;
  SBMutableStatusBarSettings *v14;
  id WeakRetained;
  void *v16;
  SBWindowSceneStatusBarSettingsAssertion *v17;
  SBWindowSceneStatusBarSettingsAssertion *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  int64_t v22;

  v8 = a3;
  v9 = a5;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __77__SBDashBoardStatusBarController_setStatusBarAlpha_style_legibilitySettings___block_invoke;
  v19[3] = &unk_1E8EC15D0;
  v10 = v8;
  v20 = v10;
  v22 = a4;
  v11 = v9;
  v21 = v11;
  v12 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v19);
  statusBarParametersAssertion = self->_statusBarParametersAssertion;
  if (statusBarParametersAssertion)
  {
    -[SBWindowSceneStatusBarSettingsAssertion modifySettingsWithBlock:](statusBarParametersAssertion, "modifySettingsWithBlock:", v12);
  }
  else
  {
    v14 = objc_alloc_init(SBMutableStatusBarSettings);
    ((void (**)(_QWORD, SBMutableStatusBarSettings *))v12)[2](v12, v14);
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowSceneStatusBarManager);
    objc_msgSend(WeakRetained, "assertionManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (SBWindowSceneStatusBarSettingsAssertion *)objc_msgSend(v16, "newSettingsAssertionWithSettings:atLevel:reason:", v14, 7, CFSTR("SBDashBoardStatusBar"));
    v18 = self->_statusBarParametersAssertion;
    self->_statusBarParametersAssertion = v17;

    -[SBWindowSceneStatusBarSettingsAssertion acquire](self->_statusBarParametersAssertion, "acquire");
  }

}

void __77__SBDashBoardStatusBarController_setStatusBarAlpha_style_legibilitySettings___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if (a1[4])
  {
    objc_msgSend(v3, "setAlpha:");
    v3 = v4;
  }
  if (a1[6] != -1)
  {
    objc_msgSend(v4, "setStyle:");
    v3 = v4;
  }
  if (a1[5])
  {
    objc_msgSend(v4, "setLegibilitySettings:");
    v3 = v4;
  }

}

- (void)clearStatusBarParameters
{
  SBWindowSceneStatusBarSettingsAssertion *statusBarParametersAssertion;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[SBWindowSceneStatusBarSettingsAssertion invalidate](self->_statusBarParametersAssertion, "invalidate");
  statusBarParametersAssertion = self->_statusBarParametersAssertion;
  self->_statusBarParametersAssertion = 0;

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_statusBars;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_statusBarsToVisbilityAssertions, "objectForKey:", v9, (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "invalidate");

        -[NSMapTable removeObjectForKey:](self->_statusBarsToVisbilityAssertions, "removeObjectForKey:", v9);
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (NSNumber)statusBarAlpha
{
  void *v2;
  void *v3;

  -[SBWindowSceneStatusBarSettingsAssertion settings](self->_statusBarParametersAssertion, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alpha");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (int64_t)statusBarStyle
{
  void *v2;
  void *v3;
  int64_t v4;

  -[SBWindowSceneStatusBarSettingsAssertion settings](self->_statusBarParametersAssertion, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "style");
  else
    v4 = -1;

  return v4;
}

- (_UILegibilitySettings)statusBarLegibilitySettings
{
  void *v2;
  void *v3;

  -[SBWindowSceneStatusBarSettingsAssertion settings](self->_statusBarParametersAssertion, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "legibilitySettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UILegibilitySettings *)v3;
}

- (void)_enumerateStatusBarsAndPartAssertions:(id)a3
{
  void (**v5)(id, _QWORD, SBStatusBarPartVisibilityAssertion *);
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  SBStatusBarPartVisibilityAssertion *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD, SBStatusBarPartVisibilityAssertion *))a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDashBoardStatusBarController.m"), 145, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enumerationBlock"));

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_statusBars;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_statusBarsToVisbilityAssertions, "objectForKey:", v11);
        v12 = (SBStatusBarPartVisibilityAssertion *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBDashBoardStatusBarController-<%@: %p>"), objc_opt_class(), v11, (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[SBStatusBarPartVisibilityAssertion initWithIdentifier:statusBar:forReason:]([SBStatusBarPartVisibilityAssertion alloc], "initWithIdentifier:statusBar:forReason:", v13, v11, CFSTR("SBDashBoardStatusBarController"));
          -[NSMapTable setObject:forKey:](self->_statusBarsToVisbilityAssertions, "setObject:forKey:", v12, v11);

        }
        v5[2](v5, v11, v12);

      }
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

}

- (void)setStatusBarPart:(unint64_t)a3 hidden:(BOOL)a4 animationDuration:(double)a5
{
  id *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  double v13;
  BOOL v14;

  if (a3 == 1)
  {
    v8 = (id *)MEMORY[0x1E0CEC208];
  }
  else
  {
    if (a3)
    {
      v9 = 0;
      goto LABEL_7;
    }
    v8 = (id *)MEMORY[0x1E0CEC1F0];
  }
  v9 = *v8;
LABEL_7:
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__SBDashBoardStatusBarController_setStatusBarPart_hidden_animationDuration___block_invoke;
  v11[3] = &unk_1E8EC15F8;
  v12 = v9;
  v14 = a4;
  v13 = a5;
  v10 = v9;
  -[SBDashBoardStatusBarController _enumerateStatusBarsAndPartAssertions:](self, "_enumerateStatusBarsAndPartAssertions:", v11);

}

uint64_t __76__SBDashBoardStatusBarController_setStatusBarPart_hidden_animationDuration___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setStatusBarPartWithIdentifier:hidden:animatedWithDuration:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(double *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusBarsToVisbilityAssertions, 0);
  objc_storeStrong((id *)&self->_statusBars, 0);
  objc_destroyWeak((id *)&self->_windowSceneStatusBarManager);
  objc_storeStrong((id *)&self->_statusBarParametersAssertion, 0);
  objc_storeStrong((id *)&self->_hideStatusBarAssertion, 0);
  objc_storeStrong((id *)&self->_statusBarHiddenReasons, 0);
}

@end
