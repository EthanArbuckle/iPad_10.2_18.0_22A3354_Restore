@implementation UIAutonomousSingleAppModeSession

- (UIAutonomousSingleAppModeSession)initWithEffectiveConfiguration:(id)a3
{
  id v4;
  UIAutonomousSingleAppModeSession *v5;
  UIAutonomousSingleAppModeSession *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIAutonomousSingleAppModeSession;
  v5 = -[UIAutonomousSingleAppModeSession init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[UIAutonomousSingleAppModeSession setEffectiveConfiguration:](v5, "setEffectiveConfiguration:", v4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel__guidedAccessStateDidChange_, CFSTR("UIAccessibilityGuidedAccessStateChanged"), 0);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIAccessibilityGuidedAccessStateChanged"), 0);

  v4.receiver = self;
  v4.super_class = (Class)UIAutonomousSingleAppModeSession;
  -[UIAutonomousSingleAppModeSession dealloc](&v4, sel_dealloc);
}

- (void)_guidedAccessStateDidChange:(id)a3
{
  if (!UIAccessibilityIsGuidedAccessEnabled())
    -[UIAutonomousSingleAppModeSession setActive:](self, "setActive:", 0);
}

- (UIAutonomousSingleAppModeConfiguration)effectiveConfiguration
{
  return (UIAutonomousSingleAppModeConfiguration *)(id)-[UIAutonomousSingleAppModeConfiguration copy](self->_effectiveConfiguration, "copy");
}

+ (id)currentlyActiveSession
{
  +[UIApplication _accessibilityLoadSettingsLoaderIfNeeded](UIApplication, "_accessibilityLoadSettingsLoaderIfNeeded");
  return (id)objc_msgSend(a1, "__gaxTrampoline_currentlyActiveSession");
}

+ (id)__gaxTrampoline_currentlyActiveSession
{
  return 0;
}

+ (void)requestSessionWithConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  +[UIApplication _accessibilityLoadSettingsLoaderIfNeeded](UIApplication, "_accessibilityLoadSettingsLoaderIfNeeded");
  objc_msgSend(a1, "__gaxTrampoline_requestSessionWithConfiguration:completion:", v7, v6);

}

+ (void)__gaxTrampoline_requestSessionWithConfiguration:(id)a3 completion:(id)a4
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;

  v4 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__UIAutonomousSingleAppModeSession___gaxTrampoline_requestSessionWithConfiguration_completion___block_invoke;
  block[3] = &unk_1E16B1BF8;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __95__UIAutonomousSingleAppModeSession___gaxTrampoline_requestSessionWithConfiguration_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    _UINSLocalizedStringWithDefaultValue(CFSTR("The application is not configured properly for Autonomous Single App Mode."), CFSTR("The application is not configured properly for Autonomous Single App Mode."));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v6 = *MEMORY[0x1E0CB2D50];
    v7[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("UIAutonomousSingleAppModeErrorDomain"), 0, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

- (void)endWithCompletion:(id)a3
{
  id v4;

  v4 = a3;
  +[UIApplication _accessibilityLoadSettingsLoaderIfNeeded](UIApplication, "_accessibilityLoadSettingsLoaderIfNeeded");
  -[UIAutonomousSingleAppModeSession __gaxTrampoline_endSessionWithCompletion:](self, "__gaxTrampoline_endSessionWithCompletion:", v4);

}

- (void)__gaxTrampoline_endSessionWithCompletion:(id)a3
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__UIAutonomousSingleAppModeSession___gaxTrampoline_endSessionWithCompletion___block_invoke;
  block[3] = &unk_1E16B1BF8;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __77__UIAutonomousSingleAppModeSession___gaxTrampoline_endSessionWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    _UINSLocalizedStringWithDefaultValue(CFSTR("Ending the guided access session failed with an unknown internal error."), CFSTR("Ending the guided access session failed with an unknown internal error."));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v6 = *MEMORY[0x1E0CB2D50];
    v7[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("UIAutonomousSingleAppModeErrorDomain"), 0x7FFFFFFFFFFFFFFFLL, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

- (void)setEffectiveConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectiveConfiguration, 0);
}

@end
