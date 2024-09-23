@implementation PUILockdownModeOnboardingCell

- (PUILockdownModeOnboardingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6;
  void *v7;
  PUILockdownModeOnboardingCell *v8;
  id v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v6 = a4;
  PUI_LocalizedStringForLockdownMode(CFSTR("LOCKDOWN_MODE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24.receiver = self;
  v24.super_class = (Class)PUILockdownModeOnboardingCell;
  v8 = -[PUIOnboardingCell initWithStyle:reuseIdentifier:title:](&v24, sel_initWithStyle_reuseIdentifier_title_, a3, v6, v7);

  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0D3A830]);
    -[PUILockdownModeOnboardingCell traitCollection](v8, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayScale");
    v12 = (void *)objc_msgSend(v9, "initWithSize:scale:", 60.0, 60.0, v11);

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithType:", CFSTR("com.apple.graphic-icon.privacy"));
    objc_msgSend(v13, "prepareImageForDescriptor:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0DC3870];
    v16 = objc_msgSend(v14, "CGImage");
    objc_msgSend(v14, "scale");
    objc_msgSend(v15, "imageWithCGImage:scale:orientation:", v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUILockdownModeOnboardingCell setSeparatorInset:](v8, "setSeparatorInset:", 0.0, 0.0, 0.0, 0.0);
    -[PUIOnboardingCell setSymbolImage:tintColor:](v8, "setSymbolImage:tintColor:", v17, 0);
    v18 = (void *)MEMORY[0x1E0CB3940];
    PUI_LocalizedStringForLockdownMode(CFSTR("ONBOARDING_CELL_DETAIL"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    getLocalizedDeviceName();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PUI_LocalizedStringForLockdownMode(CFSTR("ONBOARDING_CELL_LINK"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIOnboardingCell setDetailText:linkText:](v8, "setDetailText:linkText:", v21, v22);

  }
  return v8;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PUILockdownModeOnboardingCell;
  v4 = a3;
  -[PUILockdownModeOnboardingCell traitCollectionDidChange:](&v16, sel_traitCollectionDidChange_, v4);
  -[PUILockdownModeOnboardingCell traitCollection](self, "traitCollection", v16.receiver, v16.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hasDifferentColorAppearanceComparedToTraitCollection:", v5);

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0D3A830]);
    -[PUILockdownModeOnboardingCell traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayScale");
    v10 = (void *)objc_msgSend(v7, "initWithSize:scale:", 60.0, 60.0, v9);

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithType:", CFSTR("com.apple.graphic-icon.privacy"));
    objc_msgSend(v11, "prepareImageForDescriptor:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0DC3870];
    v14 = objc_msgSend(v12, "CGImage");
    objc_msgSend(v12, "scale");
    objc_msgSend(v13, "imageWithCGImage:scale:orientation:", v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIOnboardingCell setSymbolImage:tintColor:](self, "setSymbolImage:tintColor:", v15, 0);

  }
}

@end
