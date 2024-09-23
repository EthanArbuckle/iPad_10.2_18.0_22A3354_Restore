@implementation SBPrototypeProminentPresentingActivityElementViewProvider

- (SBPrototypeProminentPresentingActivityElementViewProvider)init
{
  SBPrototypeProminentPresentingActivityElementViewProvider *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBPrototypeProminentPresentingActivityElementViewProvider;
  result = -[SBPrototypeProminentPresentingActivityElementViewProvider init](&v3, sel_init);
  if (result)
  {
    result->_preferredLayoutMode = 2;
    *(_WORD *)&result->_prominent = 1;
  }
  return result;
}

- (void)setProminent:(BOOL)a3
{
  id WeakRetained;

  if (self->_prominent != a3)
  {
    self->_prominent = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
    objc_msgSend(WeakRetained, "preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:", self);

  }
}

- (BOOL)isProminent
{
  return self->_prominent;
}

- (void)setShowsTrailing:(BOOL)a3
{
  id WeakRetained;

  if (self->_showsTrailing != a3)
  {
    self->_showsTrailing = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
    objc_msgSend(WeakRetained, "preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:", self);

  }
}

- (BOOL)showsTrailing
{
  return self->_showsTrailing;
}

- (NSString)elementIdentifier
{
  return (NSString *)CFSTR("prototype.prominent.alert");
}

- (BOOL)hasAlertBehavior
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)handleElementViewEvent:(int64_t)a3
{
  return 0;
}

- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4
{
  self->_layoutMode = a3;
}

- (int64_t)minimumSupportedLayoutMode
{
  return 2;
}

- (int64_t)maximumSupportedLayoutMode
{
  return 2;
}

- (int64_t)systemApertureLayoutCustomizingOptions
{
  if (self->_showsTrailing)
    return self->_prominent;
  else
    return self->_prominent | 2;
}

- (UIView)leadingView
{
  UIView *leadingView;
  SBPrototypeHeightFittingSizeView *v4;
  UIView *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  void *v24;

  leadingView = self->_leadingView;
  if (!leadingView)
  {
    v4 = objc_alloc_init(SBPrototypeHeightFittingSizeView);
    v5 = self->_leadingView;
    self->_leadingView = &v4->super;

    v6 = objc_alloc(MEMORY[0x1E0CEA658]);
    v7 = (void *)MEMORY[0x1E0CEA638];
    v8 = (void *)MEMORY[0x1E0CEA650];
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configurationWithHierarchicalColor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "systemImageNamed:withConfiguration:", CFSTR("flashlight.on.fill"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v6, "initWithImage:", v11);

    objc_msgSend(v12, "setContentMode:", 1);
    -[UIView addSubview:](self->_leadingView, "addSubview:", v12);
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v12, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](self->_leadingView, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActive:", 1);

    objc_msgSend(v12, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](self->_leadingView, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setActive:", 1);

    objc_msgSend(v12, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](self->_leadingView, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setActive:", 1);

    objc_msgSend(v12, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](self->_leadingView, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setActive:", 1);

    leadingView = self->_leadingView;
  }
  return leadingView;
}

- (UIView)trailingView
{
  UIView *trailingView;
  UIView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIView *v9;

  trailingView = self->_trailingView;
  if (!trailingView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    -[UIView setText:](v4, "setText:", CFSTR("ON"));
    v5 = (void *)MEMORY[0x1E0CEA5E8];
    objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0CEB558]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fontWithDescriptor:size:", v6, 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setFont:](v4, "setFont:", v7);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemYellowColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setTextColor:](v4, "setTextColor:", v8);

    v9 = self->_trailingView;
    self->_trailingView = v4;

    trailingView = self->_trailingView;
  }
  return trailingView;
}

- (UIView)minimalView
{
  return self->_leadingView;
}

- (int64_t)layoutMode
{
  return self->_layoutMode;
}

- (int64_t)preferredLayoutMode
{
  return self->_preferredLayoutMode;
}

- (SAUILayoutHosting)layoutHost
{
  return (SAUILayoutHosting *)objc_loadWeakRetained((id *)&self->_layoutHost);
}

- (void)setLayoutHost:(id)a3
{
  objc_storeWeak((id *)&self->_layoutHost, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_destroyWeak((id *)&self->_layoutHost);
}

@end
