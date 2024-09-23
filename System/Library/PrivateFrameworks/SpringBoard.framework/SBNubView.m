@implementation SBNubView

+ (double)hitTestWidth
{
  return 76.0;
}

+ (double)height
{
  if (height_onceToken != -1)
    dispatch_once(&height_onceToken, &__block_literal_global_59);
  return *(double *)&height___height;
}

- (SBNubView)initWithDeviceApplicationSceneHandle:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  SBNubView *v10;
  SBNubView *v11;
  uint64_t v12;
  UIView *nubView;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;

  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SBNubView;
  v6 = *MEMORY[0x1E0C9D648];
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v10 = -[SBNubView initWithFrame:](&v25, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v7, v8, v9);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_deviceApplicationSceneHandle, a3);
    v11->_highlighted = 0;
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v6, v7, v8, v9);
    nubView = v11->_nubView;
    v11->_nubView = (UIView *)v12;

    -[UIView _setCornerRadius:](v11->_nubView, "_setCornerRadius:", 2.5);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v11->_nubView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SBNubView addSubview:](v11, "addSubview:", v11->_nubView);
    -[SBNubView _updateNubViewOverrideUserInterfaceStyleAndBackgroundColor](v11, "_updateNubViewOverrideUserInterfaceStyleAndBackgroundColor");
    -[UIView widthAnchor](v11->_nubView, "widthAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToConstant:", 36.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActive:", 1);

    -[UIView heightAnchor](v11->_nubView, "heightAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToConstant:", 5.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActive:", 1);

    -[UIView centerXAnchor](v11->_nubView, "centerXAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBNubView centerXAnchor](v11, "centerXAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setActive:", 1);

    -[UIView centerYAnchor](v11->_nubView, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBNubView centerYAnchor](v11, "centerYAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setActive:", 1);

    -[SBDeviceApplicationSceneHandle addObserver:](v11->_deviceApplicationSceneHandle, "addObserver:", v11);
  }

  return v11;
}

- (SBNubView)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99750];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("%s is not a valid initializer. You must call -[%@ initWithDeviceApplicationSceneHandle:]."), "-[SBNubView initWithNibName:bundle:]", v8);

  return -[SBNubView initWithDeviceApplicationSceneHandle:](self, "initWithDeviceApplicationSceneHandle:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[UIApplicationSceneClientSettingsDiffInspector removeAllObservers](self->_applicationSceneClientSettingsDiffInspector, "removeAllObservers");
  -[SBDeviceApplicationSceneHandle removeObserver:](self->_deviceApplicationSceneHandle, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBNubView;
  -[SBNubView dealloc](&v3, sel_dealloc);
}

- (UIView)contentView
{
  return self->_nubView;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBNubView;
  v4 = a3;
  -[SBNubView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[SBNubView traitCollection](self, "traitCollection", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[SBNubView _updateNubViewOverrideUserInterfaceStyleAndBackgroundColor](self, "_updateNubViewOverrideUserInterfaceStyleAndBackgroundColor");
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  v2 = *MEMORY[0x1E0CEBDE0];
  objc_msgSend((id)objc_opt_class(), "height");
  v4 = v3;
  v5 = v2;
  result.height = v4;
  result.width = v5;
  return result;
}

- (SBNubView)initWithCoder:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  objc_class *v7;
  void *v8;
  SBNubView *v9;
  objc_super v11;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99768];
  v6 = a3;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("%@ does not support unarchiving from a nib."), v8);

  v11.receiver = self;
  v11.super_class = (Class)SBNubView;
  v9 = -[SBNubView initWithCoder:](&v11, sel_initWithCoder_, v6);

  return v9;
}

- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  UIApplicationSceneClientSettingsDiffInspector *applicationSceneClientSettingsDiffInspector;
  UIApplicationSceneClientSettingsDiffInspector *v12;
  UIApplicationSceneClientSettingsDiffInspector *v13;
  UIApplicationSceneClientSettingsDiffInspector *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  applicationSceneClientSettingsDiffInspector = self->_applicationSceneClientSettingsDiffInspector;
  if (!applicationSceneClientSettingsDiffInspector)
  {
    objc_initWeak(&location, self);
    v12 = (UIApplicationSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E0CEA328]);
    v13 = self->_applicationSceneClientSettingsDiffInspector;
    self->_applicationSceneClientSettingsDiffInspector = v12;

    v14 = self->_applicationSceneClientSettingsDiffInspector;
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __75__SBNubView_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke;
    v18 = &unk_1E8EA2658;
    objc_copyWeak(&v19, &location);
    -[UIApplicationSceneClientSettingsDiffInspector observeStatusBarStyleWithBlock:](v14, "observeStatusBarStyleWithBlock:", &v15);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    applicationSceneClientSettingsDiffInspector = self->_applicationSceneClientSettingsDiffInspector;
  }
  objc_msgSend(v9, "evaluateWithInspector:context:", applicationSceneClientSettingsDiffInspector, 0, v15, v16, v17, v18);

}

void __75__SBNubView_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateNubViewOverrideUserInterfaceStyleAndBackgroundColor");
    WeakRetained = v2;
  }

}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    -[SBNubView _updateNubViewBackgroundColor](self, "_updateNubViewBackgroundColor");
  }
}

+ (double)hitTestPadding
{
  return 20.0;
}

uint64_t __19__SBNubView_height__block_invoke()
{
  uint64_t result;
  uint64_t v1;

  result = objc_msgSend(MEMORY[0x1E0CEA9E8], "heightForStyle:orientation:", 0, 1);
  height___height = v1;
  return result;
}

+ (double)contentHeight
{
  return 5.0;
}

- (void)_updateNubViewBackgroundColor
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  if (self->_highlighted)
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView backgroundColor](self->_nubView, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v7, "isEqual:", v3);

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D01870], "settingsWithMass:stiffness:damping:", 2.0, 400.0, 45.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0D01908];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __42__SBNubView__updateNubViewBackgroundColor__block_invoke;
    v8[3] = &unk_1E8E9E820;
    v8[4] = self;
    v9 = v7;
    objc_msgSend(v6, "animateWithSettings:actions:", v5, v8);

  }
}

uint64_t __42__SBNubView__updateNubViewBackgroundColor__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setBackgroundColor:", *(_QWORD *)(a1 + 40));
}

- (void)_updateNubViewOverrideUserInterfaceStyleAndBackgroundColor
{
  void *v3;
  void *v4;
  UIView *nubView;
  uint64_t v6;
  id v7;

  -[SBNubView deviceApplicationSceneHandle](self, "deviceApplicationSceneHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sceneIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientSettings");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    nubView = self->_nubView;
    if (_SBStatusBarColorStyleFromStyle(objc_msgSend(v7, "statusBarModernStyle")) == 2)
      v6 = 1;
    else
      v6 = 2;
    -[UIView _setOverrideUserInterfaceStyle:](nubView, "_setOverrideUserInterfaceStyle:", v6);
  }
  -[SBNubView _updateNubViewBackgroundColor](self, "_updateNubViewBackgroundColor");

}

- (SBDeviceApplicationSceneHandle)deviceApplicationSceneHandle
{
  return self->_deviceApplicationSceneHandle;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceApplicationSceneHandle, 0);
  objc_storeStrong((id *)&self->_nubView, 0);
  objc_storeStrong((id *)&self->_applicationSceneClientSettingsDiffInspector, 0);
}

@end
