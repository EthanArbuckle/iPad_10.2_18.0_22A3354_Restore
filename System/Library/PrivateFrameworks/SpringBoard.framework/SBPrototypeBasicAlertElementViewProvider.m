@implementation SBPrototypeBasicAlertElementViewProvider

- (NSString)elementIdentifier
{
  return (NSString *)CFSTR("prototype sparkles alert");
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

- (UIView)leadingView
{
  UIView *leadingView;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIView *v10;
  UIView *v11;

  leadingView = self->_leadingView;
  if (!leadingView)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA658]);
    v5 = (void *)MEMORY[0x1E0CEA638];
    v6 = (void *)MEMORY[0x1E0CEA650];
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "configurationWithHierarchicalColor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemImageNamed:withConfiguration:", CFSTR("sparkles"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (UIView *)objc_msgSend(v4, "initWithImage:", v9);
    v11 = self->_leadingView;
    self->_leadingView = v10;

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
    -[UIView setText:](v4, "setText:", CFSTR("Demo"));
    v5 = (void *)MEMORY[0x1E0CEA5E8];
    objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0CEB558]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fontWithDescriptor:size:", v6, 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setFont:](v4, "setFont:", v7);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
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
  _SBPrototypeBasicAlertElementCompoundView *minimalCompoundView;
  _SBPrototypeBasicAlertElementCompoundView *v4;
  _SBPrototypeBasicAlertElementCompoundView *v5;
  _SBPrototypeBasicAlertElementCompoundView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _SBPrototypeBasicAlertElementCompoundView *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  minimalCompoundView = self->_minimalCompoundView;
  if (!minimalCompoundView)
  {
    v4 = objc_alloc_init(_SBPrototypeBasicAlertElementCompoundView);
    v5 = self->_minimalCompoundView;
    self->_minimalCompoundView = v4;

    v6 = self->_minimalCompoundView;
    v7 = (void *)MEMORY[0x1E0CEA638];
    v8 = (void *)MEMORY[0x1E0CEA650];
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configurationWithHierarchicalColor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "systemImageNamed:withConfiguration:", CFSTR("sparkles"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SBPrototypeBasicAlertElementCompoundView setLeadingImage:](v6, "setLeadingImage:", v11);

    v12 = self->_minimalCompoundView;
    v13 = (void *)MEMORY[0x1E0CEA638];
    v14 = (void *)MEMORY[0x1E0CEA650];
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "configurationWithHierarchicalColor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "systemImageNamed:withConfiguration:", CFSTR("bubbles.and.sparkles.fill"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SBPrototypeBasicAlertElementCompoundView setTrailingImage:](v12, "setTrailingImage:", v17);

    minimalCompoundView = self->_minimalCompoundView;
  }
  return (UIView *)minimalCompoundView;
}

- (unint64_t)layoutAxis
{
  return -[_SBPrototypeBasicAlertElementCompoundView layoutAxis](self->_minimalCompoundView, "layoutAxis");
}

- (void)setLayoutAxis:(unint64_t)a3
{
  if (a3 - 1 <= 1 && -[SBPrototypeBasicAlertElementViewProvider layoutAxis](self, "layoutAxis") != a3)
    -[_SBPrototypeBasicAlertElementCompoundView setLayoutAxis:](self->_minimalCompoundView, "setLayoutAxis:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_storeStrong((id *)&self->_minimalCompoundView, 0);
}

@end
