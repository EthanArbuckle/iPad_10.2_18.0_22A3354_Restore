@implementation SBSystemApertureStatusBarPillElement

+ (id)backgroundActivityIdentifiersThatIgnoreSystemChromeSuppression
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0DB0B00], *MEMORY[0x1E0DB0C00], *MEMORY[0x1E0DB0C08], 0);
}

- (SBSystemApertureStatusBarPillElement)initWithBackgroundActivityIdentifier:(id)a3
{
  id v4;
  SBSystemApertureStatusBarPillElement *v5;
  uint64_t v6;
  NSString *representedBackgroundActivityIdentifier;
  void *v8;
  void *v9;
  id *v10;
  NSString *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  uint64_t v16;
  NSString *elementIdentifier;
  UIView *v18;
  UIView *trailingView;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SBSystemApertureStatusBarPillElement;
  v5 = -[SBSystemApertureStatusBarPillElement init](&v21, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    representedBackgroundActivityIdentifier = v5->_representedBackgroundActivityIdentifier;
    v5->_representedBackgroundActivityIdentifier = (NSString *)v6;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0DB0B00], *MEMORY[0x1E0DB0B58], *MEMORY[0x1E0DB0C00], *MEMORY[0x1E0DB0B60], *MEMORY[0x1E0DB0BD0], *MEMORY[0x1E0DB0BE0], *MEMORY[0x1E0DB0BD8], CFSTR("com.apple.systemstatus.background-activity.CallRecording"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0DB0BF0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "containsObject:", v5->_representedBackgroundActivityIdentifier))
    {
      v10 = (id *)MEMORY[0x1E0DAC938];
    }
    else
    {
      if (!objc_msgSend(v9, "containsObject:", v5->_representedBackgroundActivityIdentifier))
      {
        v13 = (void *)MEMORY[0x1E0CB3940];
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        STBackgroundActivityIdentifierDescription();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ - %@"), v12, v15);
        v16 = objc_claimAutoreleasedReturnValue();
        elementIdentifier = v5->_elementIdentifier;
        v5->_elementIdentifier = (NSString *)v16;

        goto LABEL_8;
      }
      v10 = (id *)MEMORY[0x1E0DAC950];
    }
    v11 = (NSString *)*v10;
    v12 = v5->_elementIdentifier;
    v5->_elementIdentifier = v11;
LABEL_8:

    v18 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    trailingView = v5->_trailingView;
    v5->_trailingView = v18;

  }
  return v5;
}

- (void)setAssociatedApplications:(id)a3
{
  NSSet *v4;
  NSSet *associatedApplications;
  void *v6;
  id v7;

  v7 = a3;
  if ((BSEqualSets() & 1) == 0)
  {
    v4 = (NSSet *)objc_msgSend(v7, "copy");
    associatedApplications = self->_associatedApplications;
    self->_associatedApplications = v4;

    -[SBSystemApertureStatusBarPillElement layoutHost](self, "layoutHost");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredLayoutModeDidInvalidateForLayoutSpecifier:", self);

  }
}

- (BOOL)hasActivityBehavior
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)handleElementViewEvent:(int64_t)a3
{
  NSString *representedBackgroundActivityIdentifier;
  void *v5;
  void *v6;

  if ((unint64_t)a3 <= 3)
  {
    representedBackgroundActivityIdentifier = self->_representedBackgroundActivityIdentifier;
    -[SBSystemApertureStatusBarPillElement leadingView](self, "leadingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_sbWindowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SBWorkspaceHandleStatusBarReturnActionFromApp(0, 0, representedBackgroundActivityIdentifier, v6);

  }
  return (unint64_t)a3 < 4;
}

- (int64_t)preferredLayoutMode
{
  return 2;
}

- (int64_t)minimumSupportedLayoutMode
{
  return 1;
}

- (int64_t)maximumSupportedLayoutMode
{
  return 2;
}

- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4
{
  self->_layoutMode = a3;
}

- (UIView)leadingView
{
  UIView *leadingView;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  UIView *v9;
  void *v10;
  void *v11;
  UIView *v12;
  UIView *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UIView *v18;
  UIView *v19;
  UIView *v20;
  void *v21;

  leadingView = self->_leadingView;
  if (!leadingView)
  {
    -[SBSystemApertureStatusBarPillElement _packageName](self, "_packageName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSystemApertureStatusBarPillElement activeSymbolName](self, "activeSymbolName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSystemApertureStatusBarPillElement _imageName](self, "_imageName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSystemApertureStatusBarPillElement _textLabel](self, "_textLabel");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v4)
    {
      -[SBSystemApertureStatusBarPillElement _viewWithPackageName:](self, "_viewWithPackageName:", v4);
      v9 = (UIView *)objc_claimAutoreleasedReturnValue();
      v10 = self->_leadingView;
      self->_leadingView = v9;
    }
    else if (v5)
    {
      -[SBSystemApertureStatusBarPillElement activeSymbolName](self, "activeSymbolName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSystemApertureStatusBarPillElement activeTintColor](self, "activeTintColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSystemApertureStatusBarPillElement _viewWithSymbolName:tintColor:](self, "_viewWithSymbolName:tintColor:", v10, v11);
      v12 = (UIView *)objc_claimAutoreleasedReturnValue();
      v13 = self->_leadingView;
      self->_leadingView = v12;

    }
    else
    {
      if (v6)
      {
        -[SBSystemApertureStatusBarPillElement _sizeForPillWithImageName](self, "_sizeForPillWithImageName");
        v15 = v14;
        v17 = v16;
        -[SBSystemApertureStatusBarPillElement activeTintColor](self, "activeTintColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBSystemApertureStatusBarPillElement _viewWithImageName:systemApertureSize:tintColor:](self, "_viewWithImageName:systemApertureSize:tintColor:", v6, v10, v15, v17);
        v18 = (UIView *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!v7)
        {
LABEL_12:
          v20 = self->_leadingView;
          -[SBSystemApertureStatusBarPillElement accessibilityLabel](self, "accessibilityLabel");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView setAccessibilityLabel:](v20, "setAccessibilityLabel:", v21);

          leadingView = self->_leadingView;
          return leadingView;
        }
        -[SBSystemApertureStatusBarPillElement activeTintColor](self, "activeTintColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBSystemApertureStatusBarPillElement _viewWithTextLabel:tintColor:](self, "_viewWithTextLabel:tintColor:", v8, v10);
        v18 = (UIView *)objc_claimAutoreleasedReturnValue();
      }
      v19 = self->_leadingView;
      self->_leadingView = v18;

    }
    goto LABEL_12;
  }
  return leadingView;
}

- (BOOL)shouldIgnoreSystemChromeSuppression
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend((id)objc_opt_class(), "backgroundActivityIdentifiersThatIgnoreSystemChromeSuppression");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemApertureStatusBarPillElement representedBackgroundActivityIdentifiers](self, "representedBackgroundActivityIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "intersectsSet:", v4);

  return v5;
}

- (BOOL)shouldSuppressElementWhileOnCoversheet
{
  return 0;
}

- (BOOL)shouldSuppressElementWhileProximityReaderPresent
{
  void *v2;
  char v3;

  -[SBSystemApertureStatusBarPillElement elementIdentifier](self, "elementIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0DAC938]) ^ 1;

  return v3;
}

- (BOOL)acceptsFullScreenTransitionFromSceneWithIdentifier:(id)a3 ofBundleId:(id)a4
{
  id v5;
  void *v6;
  BOOL v7;

  v5 = a4;
  -[SBSystemApertureStatusBarPillElement representedBackgroundActivityIdentifiers](self, "representedBackgroundActivityIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_msgSend(v6, "containsObject:", *MEMORY[0x1E0DB0BA0]) & 1) == 0
    && -[SBSystemApertureStatusBarPillElement _isAssociatedWithApplicationWithBundleIdentifier:](self, "_isAssociatedWithApplicationWithBundleIdentifier:", v5);

  return v7;
}

- (BOOL)shouldSuppressElementWhilePresentingAppWithBundleId:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[NSSet count](self->_associatedApplications, "count") <= 1
    && -[SBSystemApertureStatusBarPillElement _isAssociatedWithApplicationWithBundleIdentifier:](self, "_isAssociatedWithApplicationWithBundleIdentifier:", v4);

  return v5;
}

- (NSSet)representedBackgroundActivityIdentifiers
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", self->_representedBackgroundActivityIdentifier);
}

- (BOOL)_isAssociatedWithApplicationWithBundleIdentifier:(id)a3
{
  id v4;
  NSSet *associatedApplications;
  id v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  associatedApplications = self->_associatedApplications;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89__SBSystemApertureStatusBarPillElement__isAssociatedWithApplicationWithBundleIdentifier___block_invoke;
  v8[3] = &unk_1E8EAE428;
  v9 = v4;
  v6 = v4;
  LOBYTE(associatedApplications) = -[NSSet bs_containsObjectPassingTest:](associatedApplications, "bs_containsObjectPassingTest:", v8);

  return (char)associatedApplications;
}

uint64_t __89__SBSystemApertureStatusBarPillElement__isAssociatedWithApplicationWithBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_viewWithPackageName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01910]), "initWithPackageName:inBundle:", v4, v5);

  return v6;
}

- (id)_viewWithSymbolName:(id)a3 tintColor:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CEA650];
  v6 = a3;
  objc_msgSend(v5, "configurationWithHierarchicalColor:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:withConfiguration:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v8);
  return v9;
}

- (id)_viewWithImageName:(id)a3 systemApertureSize:(CGSize)a4 tintColor:(id)a5
{
  double height;
  double width;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SBSystemAperturePillImageView *v16;

  height = a4.height;
  width = a4.width;
  v8 = (void *)MEMORY[0x1E0CEA638];
  v9 = (void *)MEMORY[0x1E0CB34D0];
  v10 = a5;
  v11 = a3;
  objc_msgSend(v9, "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageNamed:inBundle:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "_imageThatSuppressesAccessibilityHairlineThickening");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "imageWithRenderingMode:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[SBSystemAperturePillImageView initWithImage:]([SBSystemAperturePillImageView alloc], "initWithImage:", v15);
  -[SBSystemAperturePillImageView setSystemApertureSize:](v16, "setSystemApertureSize:", width, height);
  -[SBSystemAperturePillImageView setTintColor:](v16, "setTintColor:", v10);

  -[SBSystemAperturePillImageView setContentMode:](v16, "setContentMode:", 1);
  return v16;
}

- (id)_viewWithTextLabel:(id)a3 tintColor:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  id v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (v5)
  {
    v6 = v5;
    v7 = a3;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CEA478];
    v9 = a3;
    objc_msgSend(v8, "systemWhiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = objc_alloc(MEMORY[0x1E0CB3498]);
  v25 = *MEMORY[0x1E0CEA0A0];
  v26[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithString:attributes:", a3, v11);

  v13 = objc_alloc(MEMORY[0x1E0CEA610]);
  objc_msgSend(v12, "size");
  v14 = (void *)objc_msgSend(v13, "initWithSize:");
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __69__SBSystemApertureStatusBarPillElement__viewWithTextLabel_tintColor___block_invoke;
  v23 = &unk_1E8EAE450;
  v24 = v12;
  v15 = v12;
  objc_msgSend(v14, "imageWithActions:", &v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc(MEMORY[0x1E0CEA658]);
  v18 = (void *)objc_msgSend(v17, "initWithImage:", v16, v20, v21, v22, v23);

  return v18;
}

uint64_t __69__SBSystemApertureStatusBarPillElement__viewWithTextLabel_tintColor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (id)_packageName
{
  uint64_t v2;
  id result;
  const __CFString *v4;
  const __CFString *v5;

  v2 = -[SBSystemApertureStatusBarPillElement _representedStatusBarStyleOverrides](self, "_representedStatusBarStyleOverrides");
  result = 0;
  if (v2 > 63)
  {
    if (v2 <= 1023)
    {
      if (v2 != 64 && v2 != 128)
        return result;
    }
    else
    {
      if (v2 == 1024)
        return CFSTR("AudioRecording-D73");
      if (v2 != 2048)
      {
        if (v2 != 0x4000000)
          return result;
        return CFSTR("AudioRecording-D73");
      }
    }
    return CFSTR("Navigation-D73");
  }
  if (v2 <= 7)
  {
    if (v2 == 1)
      return CFSTR("InCall-D73");
    if (v2 != 4)
      return result;
    return CFSTR("AudioRecording-D73");
  }
  v4 = CFSTR("VideoCall-D73");
  v5 = CFSTR("AirPlay-D73");
  if (v2 != 32)
    v5 = 0;
  if (v2 != 16)
    v4 = v5;
  if (v2 == 8)
    return CFSTR("Tethering-D73");
  else
    return (id)v4;
}

- (unint64_t)_representedStatusBarStyleOverrides
{
  void *v2;
  unint64_t v3;

  -[SBSystemApertureStatusBarPillElement representedBackgroundActivityIdentifiers](self, "representedBackgroundActivityIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = STUIStyleOverridesForBackgroundActivityIdentifiers();

  return v3;
}

- (id)_imageName
{
  unint64_t v2;
  const __CFString *v3;
  const __CFString *v4;

  v2 = -[SBSystemApertureStatusBarPillElement _representedStatusBarStyleOverrides](self, "_representedStatusBarStyleOverrides");
  v3 = CFSTR("FallbackPill_SOS");
  if (v2 != 0x10000)
    v3 = 0;
  if (v2 == 0x20000000)
    v4 = CFSTR("FallbackPill_satellite");
  else
    v4 = v3;
  if (v2 == 0x800000000)
    return CFSTR("FallbackPill_satellite-disconnected");
  else
    return (id)v4;
}

- (CGSize)_sizeForPillWithImageName
{
  uint64_t v2;
  double v3;
  double v4;
  CGSize result;

  v2 = -[SBSystemApertureStatusBarPillElement _representedStatusBarStyleOverrides](self, "_representedStatusBarStyleOverrides");
  v3 = 20.0;
  v4 = 40.0;
  if (v2 > 0x1FFFFFFF)
  {
    if (v2 != 0x20000000 && v2 != 0x800000000)
    {
LABEL_7:
      v4 = *MEMORY[0x1E0C9D820];
      v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    }
  }
  else
  {
    if (v2 == 512)
    {
      v4 = 24.0;
      v3 = 24.0;
      goto LABEL_9;
    }
    if (v2 != 0x10000)
      goto LABEL_7;
  }
LABEL_9:
  result.height = v3;
  result.width = v4;
  return result;
}

- (id)_accessibilityLabel
{
  if (-[SBSystemApertureStatusBarPillElement _representedStatusBarStyleOverrides](self, "_representedStatusBarStyleOverrides") == 0x10000)return CFSTR("SOS");
  else
    return 0;
}

- (UIColor)activeTintColor
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;

  v3 = -[SBSystemApertureStatusBarPillElement _representedStatusBarStyleOverrides](self, "_representedStatusBarStyleOverrides");
  if (v3 <= 127)
  {
    if (v3 > 15)
    {
      if (v3 != 16)
      {
        if (v3 == 32)
        {
          v4 = (void *)MEMORY[0x1E0CEA478];
          v7 = 0.117647059;
          v5 = 0.619607843;
          goto LABEL_25;
        }
        if (v3 != 64)
          goto LABEL_29;
        goto LABEL_19;
      }
    }
    else if (v3 != 1)
    {
      if (v3 == 4)
        goto LABEL_15;
      if (v3 != 8)
        goto LABEL_29;
    }
    v4 = (void *)MEMORY[0x1E0CEA478];
    v7 = 0.22745098;
    v6 = 0.352941176;
    v5 = 1.0;
    goto LABEL_26;
  }
  if (v3 <= 2047)
  {
    if (v3 != 128)
    {
      if (v3 == 256)
        goto LABEL_23;
      if (v3 != 1024)
        goto LABEL_29;
LABEL_15:
      v4 = (void *)MEMORY[0x1E0CEA478];
      v5 = 0.592156863;
      v6 = 0.0509803922;
      v7 = 1.0;
LABEL_26:
      objc_msgSend(v4, "colorWithRed:green:blue:alpha:", v7, v5, v6, 1.0);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
LABEL_19:
    v4 = (void *)MEMORY[0x1E0CEA478];
    v7 = 0.160784314;
    v5 = 0.517647059;
LABEL_25:
    v6 = 1.0;
    goto LABEL_26;
  }
  if (v3 <= 0x7FFFFFFFFLL)
  {
    if (v3 != 2048)
    {
      if (v3 != 0x4000000)
        goto LABEL_29;
      goto LABEL_15;
    }
    goto LABEL_19;
  }
  if (v3 != 0x800000000 && v3 != 0x10000000000)
  {
LABEL_29:
    -[SBSystemApertureStatusBarPillElement _representedVisualDescriptor](self, "_representedVisualDescriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v11)
    {
      v9 = 0;
      goto LABEL_35;
    }
    objc_msgSend(v11, "backgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqual:", v13))
    {
      objc_msgSend(v12, "preferredVisualEffectName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0DB0C28]);

      if (!v15)
      {
LABEL_35:

        return (UIColor *)v9;
      }
      objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
      v13 = v9;
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_35;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_27:
  v9 = (void *)v8;
  return (UIColor *)v9;
}

- (NSString)activeSymbolName
{
  uint64_t v3;
  __CFString *v4;
  void *v5;
  void *v6;

  v3 = -[SBSystemApertureStatusBarPillElement _representedStatusBarStyleOverrides](self, "_representedStatusBarStyleOverrides");
  v4 = 0;
  if (v3 > 0x1FFFFFFF)
  {
    if (v3 == 0x20000000 || v3 == 0x800000000)
      return (NSString *)v4;
    goto LABEL_7;
  }
  if (v3 == 0x4000)
  {
    v4 = CFSTR("shareplay");
    return (NSString *)v4;
  }
  if (v3 != 0x10000)
  {
LABEL_7:
    -[SBSystemApertureStatusBarPillElement _representedVisualDescriptor](self, "_representedVisualDescriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "systemImageName");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = CFSTR("questionmark");
    }

  }
  return (NSString *)v4;
}

- (id)_textLabel
{
  void *v2;
  void *v3;
  void *v4;

  -[SBSystemApertureStatusBarPillElement _representedVisualDescriptor](self, "_representedVisualDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "textLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_representedVisualDescriptor
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DB0890], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visualDescriptorForBackgroundActivityWithIdentifier:", self->_representedBackgroundActivityIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)elementIdentifier
{
  return self->_elementIdentifier;
}

- (SAUILayoutHosting)layoutHost
{
  return (SAUILayoutHosting *)objc_loadWeakRetained((id *)&self->_layoutHost);
}

- (void)setLayoutHost:(id)a3
{
  objc_storeWeak((id *)&self->_layoutHost, a3);
}

- (int64_t)layoutMode
{
  return self->_layoutMode;
}

- (UIView)trailingView
{
  return self->_trailingView;
}

- (NSSet)associatedApplications
{
  return self->_associatedApplications;
}

- (id)clientStorage
{
  return self->_clientStorage;
}

- (void)setClientStorage:(id)a3
{
  objc_storeStrong(&self->_clientStorage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clientStorage, 0);
  objc_storeStrong((id *)&self->_associatedApplications, 0);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_destroyWeak((id *)&self->_layoutHost);
  objc_storeStrong((id *)&self->_elementIdentifier, 0);
  objc_storeStrong((id *)&self->_representedBackgroundActivityIdentifier, 0);
}

@end
