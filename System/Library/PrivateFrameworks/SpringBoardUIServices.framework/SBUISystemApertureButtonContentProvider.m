@implementation SBUISystemApertureButtonContentProvider

- (SBUISystemApertureButtonContentProvider)initWithDefaultTextActionConfigurationWithAction:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  SBUISystemApertureButtonContentProvider *v7;

  v4 = (void *)MEMORY[0x1E0CEA3A8];
  v5 = a3;
  objc_msgSend(v4, "sbui_systemApertureTextButtonConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBUISystemApertureButtonContentProvider initWithButtonConfiguration:action:](self, "initWithButtonConfiguration:action:", v6, v5);

  return v7;
}

- (SBUISystemApertureButtonContentProvider)initWithDefaultSymbolActionConfigurationWithAction:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  SBUISystemApertureButtonContentProvider *v7;

  v4 = (void *)MEMORY[0x1E0CEA3A8];
  v5 = a3;
  objc_msgSend(v4, "sbui_systemApertureSymbolButtonConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBUISystemApertureButtonContentProvider initWithButtonConfiguration:action:](self, "initWithButtonConfiguration:action:", v6, v5);

  return v7;
}

- (SBUISystemApertureButtonContentProvider)initWithButtonConfiguration:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  SBUISystemApertureButtonContentProvider *v8;
  uint64_t v9;
  UIView *providedView;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBUISystemApertureButtonContentProvider;
  v8 = -[SBUISystemApertureButtonContentProvider init](&v12, sel_init);
  if (v8)
  {
    +[SBUISystemApertureButton buttonWithConfiguration:primaryAction:](SBUISystemApertureButton, "buttonWithConfiguration:primaryAction:", v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    providedView = v8->_providedView;
    v8->_providedView = (UIView *)v9;

  }
  return v8;
}

- (UIButtonConfiguration)buttonConfiguration
{
  void *v2;
  void *v3;

  -[SBUISystemApertureButtonContentProvider _providedView](self, "_providedView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIButtonConfiguration *)v3;
}

- (void)setButtonConfiguration:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBUISystemApertureButtonContentProvider _providedView](self, "_providedView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConfiguration:", v4);

}

- (UIColor)contentColor
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[SBUISystemApertureButtonContentProvider buttonConfiguration](self, "buttonConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "baseForegroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v2, "baseBackgroundColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (UIColor *)v6;
}

- (void)setContentColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBUISystemApertureButtonContentProvider buttonConfiguration](self, "buttonConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBaseForegroundColor:", v4);
  objc_msgSend(v5, "setBaseBackgroundColor:", v4);

  -[SBUISystemApertureButtonContentProvider setButtonConfiguration:](self, "setButtonConfiguration:", v5);
}

- (id)_providedView
{
  return self->_providedView;
}

- (UIView)providedView
{
  return self->_providedView;
}

- (SBUISystemApertureContentViewContaining)contentContainer
{
  return (SBUISystemApertureContentViewContaining *)objc_loadWeakRetained((id *)&self->_contentContainer);
}

- (void)setContentContainer:(id)a3
{
  objc_storeWeak((id *)&self->_contentContainer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentContainer);
  objc_storeStrong((id *)&self->_providedView, 0);
}

@end
