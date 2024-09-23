@implementation SBPrototypeBasicActivityElementViewProvider

- (SBPrototypeBasicActivityElementViewProvider)init
{
  SBPrototypeBasicActivityElementViewProvider *v2;
  uint64_t v3;
  NSDate *startTime;
  NSDateComponentsFormatter *v5;
  NSDateComponentsFormatter *formatter;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBPrototypeBasicActivityElementViewProvider;
  v2 = -[SBPrototypeBasicActivityElementViewProvider init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = objc_claimAutoreleasedReturnValue();
    startTime = v2->_startTime;
    v2->_startTime = (NSDate *)v3;

    v5 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x1E0CB3570]);
    formatter = v2->_formatter;
    v2->_formatter = v5;

    -[NSDateComponentsFormatter setUnitsStyle:](v2->_formatter, "setUnitsStyle:", 0);
    -[NSDateComponentsFormatter setZeroFormattingBehavior:](v2->_formatter, "setZeroFormattingBehavior:", 0x10000);
    -[NSDateComponentsFormatter setAllowedUnits:](v2->_formatter, "setAllowedUnits:", 192);
  }
  return v2;
}

- (NSString)elementIdentifier
{
  return (NSString *)CFSTR("prototype timer countdown");
}

- (BOOL)hasActivityBehavior
{
  return 1;
}

- (BOOL)handleElementViewEvent:(int64_t)a3
{
  NSDate *v4;
  NSDate *startTime;

  if ((unint64_t)a3 < 2)
    goto LABEL_4;
  if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    startTime = self->_startTime;
    self->_startTime = v4;

    -[SBPrototypeBasicActivityElementViewProvider _updateLabel](self, "_updateLabel");
    return 1;
  }
  if (a3 == 3)
  {
LABEL_4:
    -[SBPrototypeBasicActivityElementViewProvider _activateApplication](self, "_activateApplication");
    return 1;
  }
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
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
    objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "configurationWithHierarchicalColor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemImageNamed:withConfiguration:", CFSTR("timer"), v8);
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
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIView *v13;
  uint64_t v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  trailingView = self->_trailingView;
  if (!trailingView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    -[UIView setText:](v4, "setText:", CFSTR("00:00"));
    objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0CEB558]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0CEB518];
    v17[0] = *MEMORY[0x1E0CEB520];
    v17[1] = v6;
    v18[0] = &unk_1E91D2030;
    v18[1] = &unk_1E91D2048;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = *MEMORY[0x1E0CEB4D0];
    v16 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fontDescriptorByAddingAttributes:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v10, 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setFont:](v4, "setFont:", v11);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setTextColor:](v4, "setTextColor:", v12);

    v13 = self->_trailingView;
    self->_trailingView = v4;

    trailingView = self->_trailingView;
  }
  return trailingView;
}

- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4
{
  void *v5;
  NSTimer *v6;
  NSTimer *v7;
  NSTimer *timer;
  _QWORD v9[4];
  id v10;
  id location;

  if (self->_layoutMode != a3)
  {
    self->_layoutMode = a3;
    if (a3 < 2)
    {
      -[NSTimer invalidate](self->_timer, "invalidate");
      timer = self->_timer;
      self->_timer = 0;

    }
    else
    {
      objc_initWeak(&location, self);
      v5 = (void *)MEMORY[0x1E0C99E88];
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __68__SBPrototypeBasicActivityElementViewProvider_setLayoutMode_reason___block_invoke;
      v9[3] = &unk_1E8E9FA90;
      objc_copyWeak(&v10, &location);
      objc_msgSend(v5, "scheduledTimerWithTimeInterval:repeats:block:", 1, v9, 1.0);
      v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      v7 = self->_timer;
      self->_timer = v6;

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

void __68__SBPrototypeBasicActivityElementViewProvider_setLayoutMode_reason___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_updateLabel");
  else
    objc_msgSend(v5, "invalidate");

}

- (int64_t)minimumSupportedLayoutMode
{
  return 1;
}

- (int64_t)maximumSupportedLayoutMode
{
  return 2;
}

- (int64_t)preferredLayoutMode
{
  return 2;
}

- (BOOL)acceptsFullScreenTransitionFromSceneWithIdentifier:(id)a3 ofBundleId:(id)a4
{
  return objc_msgSend(a4, "isEqualToString:", CFSTR("com.apple.mobiletimer"));
}

- (BOOL)shouldSuppressElementWhilePresentingAppWithBundleId:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.mobiletimer"));
}

- (UIColor)keyColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 1.0, 0.622, 0.044, 1.0);
}

- (void)_activateApplication
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v5, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D22D88]);
  objc_msgSend(v5, "setObject:forKey:", v2, *MEMORY[0x1E0D22DA8]);
  objc_msgSend(v5, "setObject:forKey:", *MEMORY[0x1E0DAB820], *MEMORY[0x1E0D22D58]);
  objc_msgSend(MEMORY[0x1E0D23158], "optionsWithDictionary:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SBSCreateOpenApplicationService();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openApplication:withOptions:completion:", CFSTR("com.apple.mobiletimer"), v3, 0);

}

- (void)_updateLabel
{
  NSDateComponentsFormatter *formatter;
  void *v4;
  void *v5;
  id WeakRetained;
  id v7;

  -[SBPrototypeBasicActivityElementViewProvider trailingView](self, "trailingView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  formatter = self->_formatter;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", self->_startTime);
  -[NSDateComponentsFormatter stringFromTimeInterval:](formatter, "stringFromTimeInterval:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v5);

  if (self->_layoutMode != 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
    objc_msgSend(WeakRetained, "preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:", self);

  }
}

- (int64_t)layoutMode
{
  return self->_layoutMode;
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
  objc_destroyWeak((id *)&self->_layoutHost);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end
