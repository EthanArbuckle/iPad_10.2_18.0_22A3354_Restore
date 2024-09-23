@implementation SBUIEmergencyCallHostViewController

+ (void)requestEmergencyCallControllerWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_opt_class();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __84__SBUIEmergencyCallHostViewController_requestEmergencyCallControllerWithCompletion___block_invoke;
    v6[3] = &unk_1E4C40868;
    v7 = v3;
    v5 = (id)objc_msgSend(v4, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("PHEmergencyDialerViewController"), CFSTR("com.apple.InCallService"), v6);

  }
}

void __84__SBUIEmergencyCallHostViewController_requestEmergencyCallControllerWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  const __CFString *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v5;
  v8 = v7;
  if (v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __84__SBUIEmergencyCallHostViewController_requestEmergencyCallControllerWithCompletion___block_invoke_2;
    v16[3] = &unk_1E4C40818;
    v10 = v7;
    v17 = v10;
    v18 = *(id *)(a1 + 32);
    objc_msgSend(v10, "serviceViewControllerProxyWithErrorHandler:", v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __84__SBUIEmergencyCallHostViewController_requestEmergencyCallControllerWithCompletion___block_invoke_3;
    v13[3] = &unk_1E4C40840;
    v14 = v10;
    v15 = *(id *)(a1 + 32);
    objc_msgSend(v11, "backgroundStyle:", v13);

  }
  else
  {
    SBLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v20 = CFSTR("com.apple.mobilephone");
      v21 = 2114;
      v22 = CFSTR("PHEmergencyDialerViewController");
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_1A471F000, v12, OS_LOG_TYPE_INFO, "Emergency call: error requesting <%@:%{public}@> -> %@", buf, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __84__SBUIEmergencyCallHostViewController_requestEmergencyCallControllerWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "disconnect");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __84__SBUIEmergencyCallHostViewController_requestEmergencyCallControllerWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  double v6;

  objc_msgSend(*(id *)(a1 + 32), "setBackgroundStyle:", a2);
  v6 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "tintColorForBackgroundStyle:outBlurRadius:", a2, &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTintColor:", v4);
  objc_msgSend(*(id *)(a1 + 32), "setBlurRadius:", v6);
  objc_msgSend(*(id *)(a1 + 32), "setBlursSelf:", 1);
  objc_msgSend(*(id *)(a1 + 32), "serviceViewControllerProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "noteTintColorForBackgroundStyleChanged:", v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)setBlursSelf:(BOOL)a3
{
  _UIBackdropView *blurView;

  if (self->_blursSelf != a3)
  {
    self->_blursSelf = a3;
    if (a3)
    {
      -[SBUIEmergencyCallHostViewController _createAndAddBlurViewIfNecessary](self, "_createAndAddBlurViewIfNecessary");
    }
    else
    {
      -[_UIBackdropView removeFromSuperview](self->_blurView, "removeFromSuperview");
      blurView = self->_blurView;
      self->_blurView = 0;

    }
  }
}

- (id)tintColorForBackgroundStyle:(int64_t)a3 outBlurRadius:(double *)a4
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  if ((unint64_t)(a3 - 3) > 2)
    v5 = 2010;
  else
    v5 = qword_1A47AF790[a3 - 3];
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CEAC70], "settingsForPrivateStyle:graphicsQuality:", v5, 100);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "blurRadius");
    *(_QWORD *)a4 = v7;

  }
  objc_msgSend(MEMORY[0x1E0CEAC70], "settingsForPrivateStyle:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "combinedTintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7B54D0);
}

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7A69B0);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBUIEmergencyCallHostViewController;
  -[_UIRemoteViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if (self->_blursSelf && !self->_blurView)
    -[SBUIEmergencyCallHostViewController _createAndAddBlurViewIfNecessary](self, "_createAndAddBlurViewIfNecessary");
}

- (void)_createAndAddBlurViewIfNecessary
{
  void *v3;
  void *v4;
  uint64_t v5;
  _UIBackdropView *v6;
  _UIBackdropView *blurView;
  _UIBackdropView *v8;
  void *v9;
  void *v10;
  id v11;

  if (!self->_blurView)
  {
    objc_msgSend(MEMORY[0x1E0CEAC70], "settingsForPrivateStyle:", -2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_graphicsQuality");

    if (v5 == 100)
    {
      objc_msgSend(v3, "setBlurRadius:", self->_blurRadius);
      objc_msgSend(v3, "setBackdropVisible:", 1);
    }
    v6 = (_UIBackdropView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAC68]), "initWithSettings:", v3);
    blurView = self->_blurView;
    self->_blurView = v6;

    v8 = self->_blurView;
    -[SBUIEmergencyCallHostViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    -[_UIBackdropView setFrame:](v8, "setFrame:");

    -[_UIBackdropView setAutoresizingMask:](self->_blurView, "setAutoresizingMask:", 18);
    -[_UIBackdropView setAlpha:](self->_blurView, "setAlpha:", 1.0);
    -[_UIBackdropView setComputesColorSettings:](self->_blurView, "setComputesColorSettings:", 1);

  }
  -[SBUIEmergencyCallHostViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", self->_blurView);

  -[SBUIEmergencyCallHostViewController view](self, "view");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendSubviewToBack:", self->_blurView);

}

- (BOOL)blursSelf
{
  return self->_blursSelf;
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setBackgroundStyle:(int64_t)a3
{
  self->_backgroundStyle = a3;
}

- (double)blurRadius
{
  return self->_blurRadius;
}

- (void)setBlurRadius:(double)a3
{
  self->_blurRadius = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
}

@end
