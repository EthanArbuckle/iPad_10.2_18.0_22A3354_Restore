@implementation UITableViewHeaderFooterView

- (void)didMoveToSuperview
{
  objc_super v3;

  if ((*((_BYTE *)&self->_headerFooterFlags + 1) & 4) == 0)
    objc_storeWeak((id *)&self->_table, 0);
  v3.receiver = self;
  v3.super_class = (Class)UITableViewHeaderFooterView;
  -[UIView didMoveToSuperview](&v3, sel_didMoveToSuperview);
}

- (void)layoutMarginsDidChange
{
  int v3;

  -[UIView setNeedsLayout](self, "setNeedsLayout");
  if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
  {
    v3 = *((_DWORD *)&self->super._viewFlags + 4);
    *((_DWORD *)&self->super._viewFlags + 4) = v3 | 0x200;
    -[UIView layoutBelowIfNeeded](self, "layoutBelowIfNeeded");
    if ((v3 & 0x200) == 0)
      *((_DWORD *)&self->super._viewFlags + 4) &= ~0x200u;
  }
}

- (UICellConfigurationState)_configurationState
{
  UIViewConfigurationState *v3;
  void *v4;
  UIViewConfigurationState *v5;

  v3 = [UIViewConfigurationState alloc];
  -[UIView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UIViewConfigurationState initWithTraitCollection:](v3, "initWithTraitCollection:", v4);

  -[UIViewConfigurationState setDisabled:](v5, "setDisabled:", -[UIView isUserInteractionEnabled](self, "isUserInteractionEnabled") ^ 1);
  -[UIViewConfigurationState setFocused:](v5, "setFocused:", -[UIView isFocused](self, "isFocused"));
  -[UIViewConfigurationState setPinned:](v5, "setPinned:", (*(_DWORD *)&self->_headerFooterFlags >> 3) & 1);
  return (UICellConfigurationState *)v5;
}

- (BOOL)_hostsLayoutEngineAllowsTAMIC_NO
{
  return 0;
}

uint64_t __65__UITableViewHeaderFooterView__updateDefaultBackgroundAppearance__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundConfiguration:", *(_QWORD *)(a1 + 40));
}

- (void)setBackgroundConfiguration:(UIBackgroundConfiguration *)backgroundConfiguration
{
  $459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags;
  int v4;
  int v5;

  headerFooterFlags = self->_headerFooterFlags;
  v4 = (*(unsigned int *)&headerFooterFlags >> 13) & 1;
  if (backgroundConfiguration)
    v4 = 1;
  if (v4)
    v5 = 0x2000;
  else
    v5 = 0;
  self->_headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(v5 | *(_DWORD *)&headerFooterFlags & 0xFFFFDFFF);
  -[UITableViewHeaderFooterView _applyBackgroundViewConfiguration:withState:](self, "_applyBackgroundViewConfiguration:withState:");
}

void __52__UITableViewHeaderFooterView__setupLabelAppearance__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  int v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSString *v22;
  _BOOL4 IsAccessibilityCategory;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  int v30;
  _QWORD *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[71];
  if (v3)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(v2, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _UITableConstantsForTraitCollection(v5);
    v43 = (id)objc_claimAutoreleasedReturnValue();

    v4 = v43;
  }
  v44 = v4;
  v6 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v6 + 496))
  {
    objc_msgSend(*(id *)(v6 + 496), "font");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pointSize");
    v9 = v8;

    v6 = *(_QWORD *)(a1 + 32);
    if (v9 == 0.0)
    {
      objc_msgSend((id)objc_opt_class(), "_defaultFontForHeaderFooterView:", *(_QWORD *)(a1 + 32));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setFont:", v10);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setTextAlignment:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 464));
      v11 = objc_msgSend(v44, "supportsUserInterfaceStyles");
      v12 = *(_QWORD **)(a1 + 32);
      if (v11)
      {
        v13 = (void *)v12[62];
        objc_msgSend(v44, "fallbackHeaderTextColorForTableViewStyle:userInterfaceStyle:", v12[52], 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_setFallbackTextColor:forUserInterfaceStyle:", v14, 1);

        v15 = *(_QWORD *)(a1 + 32);
        v16 = *(void **)(v15 + 496);
        objc_msgSend(v44, "fallbackHeaderTextColorForTableViewStyle:userInterfaceStyle:", *(_QWORD *)(v15 + 416), 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "_setFallbackTextColor:forUserInterfaceStyle:", v17, 2);

        v18 = *(_QWORD *)(a1 + 32);
        v19 = *(void **)(v18 + 496);
        objc_msgSend(v44, "fallbackHeaderTextColorForTableViewStyle:userInterfaceStyle:", *(_QWORD *)(v18 + 416), 1000);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "_setFallbackTextColor:forUserInterfaceStyle:", v20, 1000);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "_defaultTextColor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_accessibilityHigherContrastTintColorForColor:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setTextColor:", v21);

      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setLineBreakMode:", 4);
      v6 = *(_QWORD *)(a1 + 32);
      if (*(_QWORD *)(v6 + 416))
      {
        objc_msgSend((id)UIApp, "preferredContentSizeCategory");
        v22 = (NSString *)objc_claimAutoreleasedReturnValue();
        IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v22);

        if (IsAccessibilityCategory)
        {
          LODWORD(v24) = 1055286886;
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "_setHyphenationFactor:", v24);
        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setNumberOfLines:", 0);
        v6 = *(_QWORD *)(a1 + 32);
      }
    }
  }
  v25 = *(void **)(v6 + 504);
  if (v25)
  {
    objc_msgSend(v25, "font");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "pointSize");
    v28 = v27;

    if (v28 == 0.0)
    {
      objc_msgSend((id)objc_opt_class(), "_defaultFontForHeaderFooterView:", *(_QWORD *)(a1 + 32));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setFont:", v29);

      v30 = objc_msgSend(v44, "supportsUserInterfaceStyles");
      v31 = *(_QWORD **)(a1 + 32);
      if (v30)
      {
        v32 = (void *)v31[63];
        objc_msgSend(v44, "fallbackHeaderTextColorForTableViewStyle:userInterfaceStyle:", v31[52], 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "_setFallbackTextColor:forUserInterfaceStyle:", v33, 1);

        v34 = *(_QWORD *)(a1 + 32);
        v35 = *(void **)(v34 + 504);
        objc_msgSend(v44, "fallbackHeaderTextColorForTableViewStyle:userInterfaceStyle:", *(_QWORD *)(v34 + 416), 2);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "_setFallbackTextColor:forUserInterfaceStyle:", v36, 2);

        v37 = *(_QWORD *)(a1 + 32);
        v38 = *(void **)(v37 + 504);
        objc_msgSend(v44, "fallbackHeaderTextColorForTableViewStyle:userInterfaceStyle:", *(_QWORD *)(v37 + 416), 1000);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "_setFallbackTextColor:forUserInterfaceStyle:", v39, 1000);
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "_defaultTextColorForTableViewStyle:isSectionHeader:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 576) & 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "_accessibilityHigherContrastTintColorForColor:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setTextColor:", v40);

      }
      v41 = *(_QWORD *)(a1 + 32);
      v42 = *(_QWORD *)(v41 + 416);
      objc_msgSend(*(id *)(v41 + 504), "setLineBreakMode:", 4);
      if (v42)
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setNumberOfLines:", 0);
    }
  }

}

uint64_t __38__UITableViewHeaderFooterView__label___block_invoke(uint64_t a1)
{
  _UITableViewHeaderFooterViewLabel *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = objc_alloc_init(_UITableViewHeaderFooterViewLabel);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 496);
  *(_QWORD *)(v3 + 496) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setOpaque:", 0);
  +[UIColor clearColor](UIColor, "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setBackgroundColor:", v5);

  objc_msgSend(off_1E167A828, "systemFontOfSize:", 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setFont:", v6);

  v7 = *(_QWORD *)(a1 + 32);
  if ((*(_QWORD *)(v7 + 416) & 0x8000000000000000) == 0)
  {
    objc_msgSend((id)v7, "_setupLabelAppearance");
    v7 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v7 + 496), "setUserInteractionEnabled:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setEnabled:", 1);
}

+ (double)defaultFooterHeightForStyle:(int64_t)a3
{
  double result;
  int v4;
  void *v5;
  double v6;
  double v7;

  if (a3)
    return 17.5;
  v4 = dyld_program_sdk_at_least();
  result = 23.0;
  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "_defaultPlainHeaderFooterFont");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_scaledValueForValue:", 28.0);
    v7 = v6;

    return v7;
  }
  return result;
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  self->_frame = a3;
  v4.receiver = self;
  v4.super_class = (Class)UITableViewHeaderFooterView;
  -[UIView setFrame:](&v4, sel_setFrame_);
  if (qword_1ECD79590 != -1)
    dispatch_once(&qword_1ECD79590, &__block_literal_global_533);
  if (_MergedGlobals_37_0 == 1)
    -[UIView layoutBelowIfNeeded](self, "layoutBelowIfNeeded");
}

- (void)setFloating:(BOOL)a3
{
  _BOOL4 v3;
  int v5;

  if (((((*(_BYTE *)&self->_headerFooterFlags & 8) == 0) ^ a3) & 1) == 0)
  {
    v3 = a3;
    -[UITableViewHeaderFooterView _prepareForConfigurationStateUpdate](self, "_prepareForConfigurationStateUpdate");
    if (v3)
      v5 = 8;
    else
      v5 = 0;
    self->_headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(*(_DWORD *)&self->_headerFooterFlags & 0xFFFFFFF7 | v5);
    if ((dyld_program_sdk_at_least() & 1) == 0)
      -[UIView setOpaque:](self, "setOpaque:", (*(_DWORD *)&self->_headerFooterFlags & 8) == 0);
    -[UITableViewHeaderFooterView setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }
}

- (void)setMaxTitleWidth:(double)a3
{
  self->_maxTitleWidth = a3;
}

- (void)_notifyIsDisplaying:(BOOL)a3
{
  _BOOL4 v3;
  int v5;

  if (((((*(_DWORD *)&self->_headerFooterFlags & 0x200) == 0) ^ a3) & 1) == 0)
  {
    v3 = a3;
    if (a3)
      v5 = 512;
    else
      v5 = 0;
    self->_headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(*(_DWORD *)&self->_headerFooterFlags & 0xFFFFFDFF | v5);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UIView _containerViewIsHiddenForReuse:](self->_contentView, "_containerViewIsHiddenForReuse:", !v3);
  }
}

- (BOOL)_forwardsSystemLayoutFittingSizeToContentView:(id)a3
{
  void *v4;
  BOOL v5;

  if (self->_contentView != a3 || !objc_msgSend(a3, "_wantsAutolayout"))
    return 0;
  -[UIView subviews](self->_contentView, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (void)_updateContentViewConfigurationForState:(id)a3
{
  id v4;
  void (**contentViewConfigurationProvider)(id, unint64_t);
  void *v6;
  UITableViewHeaderFooterView *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;

  v4 = a3;
  contentViewConfigurationProvider = (void (**)(id, unint64_t))self->_contentViewConfigurationProvider;
  if (!contentViewConfigurationProvider)
  {
    if ((*((_BYTE *)&self->_headerFooterFlags + 2) & 1) == 0)
      goto LABEL_4;
    v11 = v4;
    if (self->_viewForContentConfiguration)
    {
      -[UITableViewHeaderFooterView contentConfiguration](self, "contentConfiguration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
        goto LABEL_3;
      v7 = self;
      v8 = v6;
      v9 = v11;
      v10 = 0;
    }
    else
    {
      -[UITableViewHeaderFooterView _contentViewConfiguration](self, "_contentViewConfiguration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
        goto LABEL_3;
      v7 = self;
      v8 = v6;
      v9 = v11;
      v10 = 1;
    }
    -[UITableViewHeaderFooterView _applyContentViewConfiguration:withState:usingSPI:](v7, "_applyContentViewConfiguration:withState:usingSPI:", v8, v9, v10);
    goto LABEL_3;
  }
  v11 = v4;
  contentViewConfigurationProvider[2](contentViewConfigurationProvider, -[UITableViewHeaderFooterView _viewConfigurationState](self, "_viewConfigurationState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewHeaderFooterView _setContentViewConfiguration:](self, "_setContentViewConfiguration:", v6);
LABEL_3:

  v4 = v11;
LABEL_4:

}

- (_UIContentViewConfiguration)_contentViewConfiguration
{
  if ((*((_BYTE *)&self->_headerFooterFlags + 1) & 0x80) == 0 || self->_viewForContentConfiguration)
    return (_UIContentViewConfiguration *)0;
  -[UIView configuration](self->_contentView, "configuration");
  return (_UIContentViewConfiguration *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)contentConfiguration
{
  void *viewForContentConfiguration;

  if ((*((_BYTE *)&self->_headerFooterFlags + 1) & 0x80) == 0)
    return 0;
  viewForContentConfiguration = self->_viewForContentConfiguration;
  if (viewForContentConfiguration)
  {
    objc_msgSend(viewForContentConfiguration, "configuration");
    viewForContentConfiguration = (void *)objc_claimAutoreleasedReturnValue();
  }
  return viewForContentConfiguration;
}

- (void)setContentConfiguration:(id)contentConfiguration
{
  -[UITableViewHeaderFooterView _applyContentViewConfiguration:withState:usingSPI:](self, "_applyContentViewConfiguration:withState:usingSPI:", contentConfiguration, 0, 0);
}

- (UITableViewHeaderFooterView)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
  NSString *v4;
  UITableViewHeaderFooterView *v5;
  UITableViewHeaderFooterView *v6;
  objc_super v8;

  v4 = reuseIdentifier;
  if (dyld_program_sdk_at_least())
  {
    v8.receiver = self;
    v8.super_class = (Class)UITableViewHeaderFooterView;
    v5 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = v5;
    if (v5)
      UITableViewHeaderFooterViewCommonInit(v5, v4);
  }
  else
  {
    v6 = -[UITableViewHeaderFooterView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }

  return v6;
}

- (void)_applyContentViewConfiguration:(id)a3 withState:(id)a4 usingSPI:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  void *v11;
  $459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags;
  void *v13;
  _UITableViewHeaderFooterContentView *v14;
  _UITableViewHeaderFooterContentView *v15;
  void *viewForContentConfiguration;
  id v17;
  id v18;
  int v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  objc_class *v24;
  id v25;
  void *v26;
  objc_class *v27;
  void *contentView;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  const char *v35;
  id v36;
  void *v37;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v11 = v10;
  headerFooterFlags = self->_headerFooterFlags;
  if (v9)
  {
    if ((*(_DWORD *)&headerFooterFlags & 0x10000) != 0 && !self->_contentViewConfigurationProvider)
    {
      if (!v10)
      {
        -[UITableViewHeaderFooterView configurationState](self, "configurationState");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v37 = v11;
      if (v5)
      {
        v21 = -[UITableViewHeaderFooterView _viewConfigurationState](self, "_viewConfigurationState");
        -[UIView traitCollection](self, "traitCollection");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "updatedConfigurationForState:traitCollection:", v21, v22);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v9, "updatedConfigurationForState:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (!v13)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITableViewHeaderFooterView.m"), 653, CFSTR("Updated configuration was nil for configuration: %@"), v9);

      }
      v11 = v37;
    }
    else
    {
      v13 = v9;
    }
    v36 = v11;
    if ((*(_WORD *)&headerFooterFlags & 0x8000) == 0)
    {
      *(_DWORD *)&self->_headerFooterFlags |= 0x8000u;
      -[UITableViewHeaderFooterView _resetContentViews](self, "_resetContentViews");
      if (!v5)
      {
LABEL_44:
        objc_msgSend(v13, "makeContentView");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)&self->_viewForContentConfiguration, v29);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[_UIContentViewInternal _wrappedContentView](self->_viewForContentConfiguration, "_wrappedContentView");
          v31 = objc_claimAutoreleasedReturnValue();

          v29 = (void *)v31;
        }
        goto LABEL_46;
      }
      goto LABEL_40;
    }
    viewForContentConfiguration = self->_viewForContentConfiguration;
    if (!viewForContentConfiguration)
      viewForContentConfiguration = self->_contentView;
    v17 = v13;
    v18 = viewForContentConfiguration;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v19 = objc_msgSend(v18, "supportsConfiguration:", v17);
    }
    else
    {
      v35 = a2;
      objc_msgSend(v18, "configuration");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = v20;
      if (v18)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v18, "_wrappedConfigurationIdentifier");
        }
        else
        {
          v24 = (objc_class *)objc_opt_class();
          NSStringFromClass(v24);
        }
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = 0;
      }

      v25 = v17;
      if (v25)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v25, "_wrappedConfigurationIdentifier");
        }
        else
        {
          v27 = (objc_class *)objc_opt_class();
          NSStringFromClass(v27);
        }
        v26 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = 0;
      }

      v19 = objc_msgSend(v23, "isEqualToString:", v26);
      a2 = v35;
    }

    *(_DWORD *)&self->_headerFooterFlags |= 0x8000u;
    if (!v19)
    {
      if (!v5)
      {
        -[_UIContentViewInternal configuration](self->_viewForContentConfiguration, "configuration");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        UIContentConfigurationAlertForReplacedContentView(CFSTR("header/footer view"), self, v30, v17, CFSTR("Use separate reuse identifiers for different types of header/footer views to avoid this."));

        -[UITableViewHeaderFooterView _resetContentViews](self, "_resetContentViews");
        goto LABEL_44;
      }
      -[UITableViewHeaderFooterView _resetContentViews](self, "_resetContentViews");
LABEL_40:
      objc_msgSend(v13, "createContentView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_46:
      if (!v29)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITableViewHeaderFooterView.m"), 684, CFSTR("Content configuration returned a nil content view: %@"), v13);

      }
      if ((objc_msgSend(v29, "translatesAutoresizingMaskIntoConstraints") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITableViewHeaderFooterView.m"), 685, CFSTR("The content view returned from the content configuration must have translatesAutoresizingMaskIntoConstraints enabled: %@"), v29);

      }
      -[UITableViewHeaderFooterView _setContentView:insertAtBack:](self, "_setContentView:insertAtBack:", v29, 0);

      goto LABEL_51;
    }
    if (v5)
      contentView = self->_contentView;
    else
      contentView = self->_viewForContentConfiguration;
    objc_msgSend(contentView, "setConfiguration:", v17);
    v13 = v17;
LABEL_51:

    v11 = v36;
    goto LABEL_52;
  }
  self->_headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(*(_DWORD *)&headerFooterFlags & 0xFFFF7FFF);
  if ((*(_WORD *)&headerFooterFlags & 0x8000) != 0)
  {
    v36 = v10;
    v14 = [_UITableViewHeaderFooterContentView alloc];
    -[UITableViewHeaderFooterView _contentRect](self, "_contentRect");
    v15 = -[_UITableViewHeaderFooterContentView initWithFrame:](v14, "initWithFrame:");
    -[UITableViewHeaderFooterView _setContentView:insertAtBack:](self, "_setContentView:insertAtBack:", v15, 0);

    -[UITableViewHeaderFooterView _configureDefaultContentViewLayoutMargins](self, "_configureDefaultContentViewLayoutMargins");
    v13 = self->_viewForContentConfiguration;
    self->_viewForContentConfiguration = 0;
    goto LABEL_51;
  }
LABEL_52:

}

- (void)_applyBackgroundViewConfiguration:(id)a3 withState:(id)a4
{
  _UISystemBackgroundView *v7;
  id v8;
  uint64_t v9;
  _UISystemBackgroundView *systemBackgroundView;
  _UISystemBackgroundView *v11;
  _UISystemBackgroundView *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v7 = (_UISystemBackgroundView *)a3;
  v8 = a4;
  v9 = (uint64_t)v8;
  systemBackgroundView = self->_systemBackgroundView;
  if (v7)
  {
    if ((*((_BYTE *)&self->_headerFooterFlags + 2) & 2) != 0 && !self->_backgroundViewConfigurationProvider)
    {
      if (!v8)
      {
        -[UITableViewHeaderFooterView configurationState](self, "configurationState");
        v9 = objc_claimAutoreleasedReturnValue();
      }
      v15 = (id)v9;
      -[_UISystemBackgroundView _updatedConfigurationForState:](v7, "_updatedConfigurationForState:", v9);
      v13 = objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITableViewHeaderFooterView.m"), 1530, CFSTR("Updated configuration was nil for configuration: %@"), v7);

      }
      v7 = (_UISystemBackgroundView *)v13;
    }
    else
    {
      v15 = v8;
    }
    -[_UISystemBackgroundView __setMaskedCorners:](v7, "__setMaskedCorners:", 15);
    if (systemBackgroundView)
    {
      -[_UISystemBackgroundView setConfiguration:](self->_systemBackgroundView, "setConfiguration:", v7);
    }
    else
    {
      -[UITableViewHeaderFooterView _resetBackgroundViewsAndColor](self, "_resetBackgroundViewsAndColor");
      v11 = -[_UISystemBackgroundView initWithConfiguration:]([_UISystemBackgroundView alloc], "initWithConfiguration:", v7);
      v12 = self->_systemBackgroundView;
      self->_systemBackgroundView = v11;

      -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_systemBackgroundView, 0);
    }
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    goto LABEL_11;
  }
  v15 = v8;
  objc_msgSend(0, "__setMaskedCorners:", 15);
  if (systemBackgroundView)
  {
    -[UIView removeFromSuperview](self->_systemBackgroundView, "removeFromSuperview");
    v7 = self->_systemBackgroundView;
    self->_systemBackgroundView = 0;
LABEL_11:

  }
}

- (void)setBackgroundView:(UIView *)backgroundView
{
  UIView *v5;
  UIView **p_backgroundView;
  $459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags;
  int v8;
  int v9;
  UIView *v10;
  UIView *v11;

  v5 = backgroundView;
  p_backgroundView = &self->_backgroundView;
  if (self->_backgroundView != v5)
  {
    v11 = v5;
    if (v5)
    {
      -[UITableViewHeaderFooterView _resetBackgroundViewConfiguration](self, "_resetBackgroundViewConfiguration");
      v5 = v11;
    }
    headerFooterFlags = self->_headerFooterFlags;
    v8 = (*(unsigned int *)&headerFooterFlags >> 11) & 1;
    if (v5)
      v8 = 1;
    if (v8)
      v9 = 2048;
    else
      v9 = 0;
    self->_headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(v9 | *(_DWORD *)&headerFooterFlags & 0xFFFFF7FF);
    -[UIView removeFromSuperview](*p_backgroundView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_backgroundView, backgroundView);
    v10 = *p_backgroundView;
    -[UITableViewHeaderFooterView _backgroundRect](self, "_backgroundRect");
    -[UIView setFrame:](v10, "setFrame:");
    -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", *p_backgroundView, 0);
    v5 = v11;
  }

}

- (void)_setContentView:(id)a3 insertAtBack:(BOOL)a4
{
  _BOOL4 v4;
  UIView *v7;
  UIView *v8;
  UIView **p_contentView;
  UIView *contentView;
  UIView *v11;
  uint64_t v12;
  UIView *v13;

  v4 = a4;
  v7 = (UIView *)a3;
  v8 = v7;
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  if (contentView != v7)
  {
    v13 = v7;
    if (contentView)
    {
      -[UITableViewHeaderFooterView _clearChangeHandlersForOldContentView:](self, "_clearChangeHandlersForOldContentView:");
      if (*p_contentView)
      {
        *((_QWORD *)&(*p_contentView)->_viewFlags + 1) &= ~0x200uLL;
        v11 = *p_contentView;
      }
      else
      {
        v11 = 0;
      }
      -[UIView removeFromSuperview](v11, "removeFromSuperview");
    }
    objc_storeStrong((id *)&self->_contentView, a3);
    -[UIView setSemanticContentAttribute:](v13, "setSemanticContentAttribute:", -[UIView semanticContentAttribute](self, "semanticContentAttribute"));
    v8 = v13;
    if (v13)
    {
      if (v4)
        -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", v13, 0);
      else
        -[UIView addSubview:](self, "addSubview:", v13);
      v12 = 512;
      if ((((*(_QWORD *)&v13->_viewFlags & 0x20000000000000) == 0) & (*(_DWORD *)&self->_headerFooterFlags >> 18)) == 0)
        v12 = 0;
      *((_QWORD *)&v13->_viewFlags + 1) = v12 | *((_QWORD *)&v13->_viewFlags + 1) & 0xFFFFFFFFFFFFFDFFLL;
      -[UITableViewHeaderFooterView _setupChangeHandlersForNewContentView:](self, "_setupChangeHandlersForNewContentView:", v13);
      v8 = v13;
    }
  }

}

- (void)_setupChangeHandlersForNewContentView:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __69__UITableViewHeaderFooterView__setupChangeHandlersForNewContentView___block_invoke;
    v7[3] = &unk_1E16B3F40;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v4, "_setContainerBackgroundViewDidChangeHandler:", v7);
    if (-[UITableViewHeaderFooterView _usingBackgroundConfigurationOrDefaultBackgroundConfiguration](self, "_usingBackgroundConfigurationOrDefaultBackgroundConfiguration"))
    {
      -[UITableViewHeaderFooterView _updateDefaultBackgroundAppearance](self, "_updateDefaultBackgroundAppearance");
    }
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __69__UITableViewHeaderFooterView__setupChangeHandlersForNewContentView___block_invoke_2;
    v5[3] = &unk_1E16BC328;
    objc_copyWeak(&v6, &location);
    objc_msgSend(v4, "_setDefaultListContentConfigurationProvider:", v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "_containingListStyleUpdated:", -[UITableViewHeaderFooterView _contentViewListStyleFromTableViewStyle:](self, "_contentViewListStyleFromTableViewStyle:", self->_tableViewStyle));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "_containerViewIsHiddenForReuse:", (*(_DWORD *)&self->_headerFooterFlags & 0x200) == 0);

}

- (void)_resetBackgroundViewsAndColor
{
  -[UITableViewHeaderFooterView setBackgroundView:](self, "setBackgroundView:", 0);
}

- (void)_configureDefaultContentViewLayoutMargins
{
  if (dyld_program_sdk_at_least())
  {
    -[UIView setEdgesPreservingSuperviewLayoutMargins:](self->_contentView, "setEdgesPreservingSuperviewLayoutMargins:", 15);
  }
  else if (dyld_program_sdk_at_least())
  {
    -[UIView setEdgesPreservingSuperviewLayoutMargins:](self->_contentView, "setEdgesPreservingSuperviewLayoutMargins:", 10);
    -[UIView setEdgesInsettingLayoutMarginsFromSafeArea:](self->_contentView, "setEdgesInsettingLayoutMarginsFromSafeArea:", -[UIView edgesInsettingLayoutMarginsFromSafeArea](self->_contentView, "edgesInsettingLayoutMarginsFromSafeArea") & 0xA);
  }
}

- (UIViewConfigurationState)_bridgedConfigurationState
{
  UITableViewHeaderFooterView *v2;
  UIViewConfigurationState *result;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v2 = self;
  result = -[UITableViewHeaderFooterView _configurationState](v2, sel__configurationState);
  if (result)
  {
    sub_1851E8F0C(result, (uint64_t)v8);

    v4 = (void *)v8[0];
    v7 = (void *)v8[3];
    sub_1851E94B8();
    v6 = v5;
    swift_bridgeObjectRelease();

    return (UIViewConfigurationState *)v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)_resetContentViews
{
  _UITableViewHeaderFooterViewLabel *label;
  _UITableViewHeaderFooterViewLabel *detailLabel;

  -[UIView removeFromSuperview](self->_label, "removeFromSuperview");
  label = self->_label;
  self->_label = 0;

  -[UIView removeFromSuperview](self->_detailLabel, "removeFromSuperview");
  detailLabel = self->_detailLabel;
  self->_detailLabel = 0;

}

- (void)_clearChangeHandlersForOldContentView:(id)a3
{
  id v3;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "_setContainerBackgroundViewDidChangeHandler:", 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "_setDefaultListContentConfigurationProvider:", 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "_containingListStyleUpdated:", -1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "_containerViewIsHiddenForReuse:", 0);

}

- (UIView)contentView
{
  return self->_contentView;
}

- (NSString)reuseIdentifier
{
  return self->_reuseIdentifier;
}

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  UIView *v4;
  UIView *contentView;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UITableViewHeaderFooterView;
  v4 = (UIView *)a3;
  -[UIView _intrinsicContentSizeInvalidatedForChildView:](&v6, sel__intrinsicContentSizeInvalidatedForChildView_, v4);
  contentView = self->_contentView;

  if (contentView == v4)
    -[UITableViewHeaderFooterView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize", v6.receiver, v6.super_class);
}

- (void)invalidateIntrinsicContentSize
{
  void *v3;
  void *v4;
  objc_super v5;

  -[UITableViewHeaderFooterView _table](self, "_table");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "_headerFooterDidInvalidateIntrinsicContentSize:", self);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UITableViewHeaderFooterView;
    -[UIView invalidateIntrinsicContentSize](&v5, sel_invalidateIntrinsicContentSize);
  }

}

- (CGRect)_contentRectForWidth:(double)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _BOOL4 v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  CGFloat y;
  CGFloat width;
  CGFloat x;
  double MinX;
  double MaxX;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat height;
  double v45;
  double v46;
  double v47;
  double v48;
  CGFloat rect;
  CGFloat v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  CGFloat v60;
  CGFloat v61;
  double v62;
  double v63;
  double v64;
  CGFloat v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect result;
  CGRect v78;

  -[UITableViewHeaderFooterView _backgroundRectForWidth:](self, "_backgroundRectForWidth:");
  v62 = v5;
  v63 = v4;
  v64 = v6;
  v50 = v7;
  -[UITableViewHeaderFooterView _effectiveSafeAreaInsets](self, "_effectiveSafeAreaInsets");
  v55 = v9;
  v58 = v8;
  -[UIView bounds](self, "bounds");
  v60 = v10;
  v61 = v11;
  v66 = v12;
  -[UITableViewHeaderFooterView _table](self, "_table");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_sectionContentInset");
  v15 = v14;
  v17 = v16;
  v18 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  objc_msgSend(v13, "_indexBarExtentFromEdge");
  v20 = fmax(v15, v19);
  v21 = fmax(v17, v19);
  if (v18)
    v21 = v17;
  else
    v20 = v15;
  v51 = v20;
  v53 = v21;
  objc_msgSend(v13, "_scrollView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bounds");
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  -[UIView frame](self, "frame");
  y = v67.origin.y;
  width = v67.size.width;
  rect = v67.size.height;
  x = v67.origin.x;
  MinX = CGRectGetMinX(v67);
  v68.origin.x = v24;
  v68.origin.y = v26;
  v68.size.width = v28;
  v68.size.height = v30;
  v52 = fmax(v51 - fmax(MinX - CGRectGetMinX(v68), 0.0), 0.0);
  v69.origin.x = v24;
  v69.origin.y = v26;
  v69.size.width = v28;
  v69.size.height = v30;
  MaxX = CGRectGetMaxX(v69);
  v70.origin.x = x;
  v70.origin.y = y;
  v70.size.width = width;
  v70.size.height = rect;
  v36 = fmax(v53 - fmax(MaxX - CGRectGetMaxX(v70), 0.0), 0.0);

  v54 = fmax(v58, v52);
  v59 = fmax(v55, v36);
  v71.origin.x = v63;
  v71.origin.y = v62;
  v71.size.width = v64;
  v71.size.height = v50;
  v56 = CGRectGetMinX(v71);
  v72.origin.x = v60;
  v72.origin.y = v66;
  v72.size.width = a3;
  v72.size.height = v61;
  v57 = fmax(v54 - fmax(v56 - CGRectGetMinX(v72), 0.0), 0.0);
  v73.origin.x = v60;
  v73.origin.y = v66;
  v73.size.width = a3;
  v73.size.height = v61;
  v37 = CGRectGetMaxX(v73);
  v74.origin.x = v63;
  v74.origin.y = v62;
  v74.size.width = v64;
  v74.size.height = v50;
  v38 = v37 - CGRectGetMaxX(v74);
  v39 = a3;
  v78.size.height = v61;
  v40 = fmax(v59 - fmax(v38, 0.0), 0.0);
  v75.origin.x = v63 + v57;
  v75.origin.y = v62 + 0.0;
  v75.size.width = v64 - (v57 + v40);
  v75.size.height = v50;
  v78.origin.x = v60;
  v78.origin.y = v66;
  v78.size.width = a3;
  v76 = CGRectIntersection(v75, v78);
  v41 = v76.origin.x;
  v42 = v76.origin.y;
  v43 = v76.size.width;
  height = v76.size.height;
  if (CGRectIsNull(v76))
  {
    height = v61;
    v42 = v66;
    v41 = v60;
  }
  else
  {
    v39 = v43;
  }

  v45 = v41;
  v46 = v42;
  v47 = v39;
  v48 = height;
  result.size.height = v48;
  result.size.width = v47;
  result.origin.y = v46;
  result.origin.x = v45;
  return result;
}

- (UIEdgeInsets)_concreteDefaultLayoutMargins
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  UIEdgeInsets result;

  v8.receiver = self;
  v8.super_class = (Class)UITableViewHeaderFooterView;
  -[UIView _concreteDefaultLayoutMargins](&v8, sel__concreteDefaultLayoutMargins);
  v4 = _UITableViewHeaderFooterViewConcreteDefaultLayoutMargins(self, 0, v3);
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (id)_table
{
  UITable **p_table;
  void *WeakRetained;
  uint64_t v5;
  id v6;

  p_table = &self->_table;
  WeakRetained = objc_loadWeakRetained((id *)&self->_table);
  if (!WeakRetained)
  {
    v5 = objc_opt_class();
    _UIFallbackViewOfClassForReusableView(v5, self);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    if (WeakRetained)
      objc_storeWeak((id *)p_table, WeakRetained);
  }
  v6 = WeakRetained;

  return v6;
}

- (int64_t)tableViewStyle
{
  return self->_tableViewStyle;
}

- (CGRect)_backgroundRectForWidth:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[UIView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    -[UITableViewHeaderFooterView _rightMarginWidth](self, "_rightMarginWidth");
    a3 = a3 - v11;
  }
  v12 = v6;
  v13 = v8;
  v14 = a3;
  v15 = v10;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (UIEdgeInsets)_effectiveSafeAreaInsets
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  v3 = -[UITableViewHeaderFooterView _insetsContentViewsToSafeArea](self, "_insetsContentViewsToSafeArea");
  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  if (v3)
  {
    -[UIView superview](self, "superview", 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[UIView safeAreaInsets](self, "safeAreaInsets");
      v6 = v9;
      v5 = v10;
      v4 = v11;
    }
    else
    {
      -[UITableViewHeaderFooterView _table](self, "_table");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_scrollView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "safeAreaInsets");
      v6 = v14 + 0.0;
      v4 = v15 + 0.0;

      v7 = 0.0;
    }
  }
  v16 = v6;
  v17 = v5;
  v18 = v4;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v7;
  return result;
}

- (BOOL)_insetsContentViewsToSafeArea
{
  return *((_BYTE *)&self->_headerFooterFlags + 1) & 1;
}

- (CGRect)_contentRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect v7;
  CGRect result;

  -[UIView bounds](self, "bounds");
  -[UITableViewHeaderFooterView _contentRectForWidth:](self, "_contentRectForWidth:", CGRectGetWidth(v7));
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (UITableConstants)_constants
{
  return self->_constants;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  UIView *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  UIView *contentView;
  CGFloat v33;
  double v34;
  double v35;
  objc_super *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[2];
  objc_super v41;
  _QWORD block[5];
  CGSize v43;
  CGSize result;
  CGRect v45;

  height = a3.height;
  width = a3.width;
  -[UITableViewHeaderFooterView _performConfigurationStateUpdate](self, "_performConfigurationStateUpdate");
  -[UITableViewHeaderFooterView _contentRectForWidth:](self, "_contentRectForWidth:", width);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[UIView setFrame:](self->_contentView, "setFrame:");
  if ((*((_BYTE *)&self->_headerFooterFlags + 1) & 0x80) == 0
    || !-[UIView translatesAutoresizingMaskIntoConstraints](self->_contentView, "translatesAutoresizingMaskIntoConstraints"))
  {
    if (-[UIView _wantsAutolayoutOrIsGuardingForEngineHosting]((uint64_t)self->_contentView))
    {
      -[UIView subviews](self->_contentView, "subviews");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "count");

      if (v31)
      {
        contentView = self->_contentView;
        v45.origin.x = v11;
        v45.origin.y = v13;
        v45.size.width = v15;
        v45.size.height = v17;
        v33 = CGRectGetWidth(v45);
        *(float *)&v34 = a4;
        *(float *)&v35 = a5;
        -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](contentView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v33, height, v34, v35);
        goto LABEL_25;
      }
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __113__UITableViewHeaderFooterView_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority___block_invoke;
      block[3] = &unk_1E16B1B28;
      block[4] = self;
      if (systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority__once_0 != -1)
        dispatch_once(&systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority__once_0, block);
      v41.receiver = self;
      v41.super_class = (Class)UITableViewHeaderFooterView;
      v36 = &v41;
    }
    else
    {
      v40[0] = self;
      v40[1] = UITableViewHeaderFooterView;
      v36 = (objc_super *)v40;
    }
    *(float *)&v28 = a4;
    *(float *)&v29 = a5;
    -[objc_super systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](v36, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v28, v29);
    goto LABEL_25;
  }
  if (a5 >= 1000.0)
    v20 = height;
  else
    v20 = 1.79769313e308;
  *(float *)&v18 = a4;
  *(float *)&v19 = a5;
  -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_contentView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v15, v20, v18, v19);
  v22 = v21;
  v24 = v23;
  v25 = self->_contentView;
  if (a4 != 1000.0 && v22 > 2777777.0 || a5 != 1000.0 && v24 > 2777777.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _UIContentViewAssertValidFittingSize(UIView * _Nonnull __strong, CGSize, UILayoutPriority, UILayoutPriority)");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v43.width = v22;
    v43.height = v24;
    NSStringFromCGSize(v43);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, CFSTR("_UIContentViewShared.h"), 66, CFSTR("Content view returned an invalid size %@ from -systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority: which is not allowed. If you have implemented a custom content view, you need to add constraints inside it so that its size is not ambiguous, or you need to manually compute and return a valid size. Content view: %@"), v39, v25);

  }
  if (a4 >= 1000.0)
    v26 = width;
  else
    v26 = v22;
  if (a5 >= 1000.0)
    v27 = height;
  else
    v27 = v24;
LABEL_25:
  result.height = v27;
  result.width = v26;
  return result;
}

- (void)_performConfigurationStateUpdate
{
  $459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags;

  headerFooterFlags = self->_headerFooterFlags;
  if ((*(_WORD *)&headerFooterFlags & 0x4000) != 0)
  {
    self->_headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(*(_DWORD *)&headerFooterFlags & 0xFFFFBFFF);
    if (_UIObservationTrackingEnabled())
      -[UITableViewHeaderFooterView _updateConfigurationWithObservationTracking](self, "_updateConfigurationWithObservationTracking");
    else
      -[UITableViewHeaderFooterView _executeConfigurationUpdate](self);
  }
}

- (UITableViewHeaderFooterViewConfigurationUpdateHandler)configurationUpdateHandler
{
  return self->_configurationUpdateHandler;
}

- (unint64_t)_viewConfigurationState
{
  void *v2;
  unint64_t v3;

  -[UITableViewHeaderFooterView configurationState](self, "configurationState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_viewConfigurationState");

  return v3;
}

- (void)_updateConfigurationUsingState:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIView _defaultListContentConfigurationMayHaveChanged](self->_contentView, "_defaultListContentConfigurationMayHaveChanged");
}

- (void)_updateBackgroundViewConfigurationForState:(id)a3
{
  id v4;
  void (**backgroundViewConfigurationProvider)(id, unint64_t);
  void *v6;
  id v7;

  v4 = a3;
  backgroundViewConfigurationProvider = (void (**)(id, unint64_t))self->_backgroundViewConfigurationProvider;
  if (backgroundViewConfigurationProvider)
  {
    v7 = v4;
    backgroundViewConfigurationProvider[2](backgroundViewConfigurationProvider, -[UITableViewHeaderFooterView _viewConfigurationState](self, "_viewConfigurationState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_3:
    -[UITableViewHeaderFooterView _applyBackgroundViewConfiguration:withState:](self, "_applyBackgroundViewConfiguration:withState:", v6, v7);
    goto LABEL_4;
  }
  if ((*((_BYTE *)&self->_headerFooterFlags + 2) & 2) == 0)
    goto LABEL_5;
  v7 = v4;
  -[_UISystemBackgroundView configuration](self->_systemBackgroundView, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    goto LABEL_3;
LABEL_4:

  v4 = v7;
LABEL_5:

}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  void *v3;
  id v4;
  _QWORD v5[6];

  sub_1851E8F0C(a3, (uint64_t)v5);
  v3 = (void *)v5[0];
  v4 = (id)v5[3];
  swift_bridgeObjectRelease();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  $459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UITableViewHeaderFooterView _performConfigurationStateUpdate](self, "_performConfigurationStateUpdate");
  headerFooterFlags = self->_headerFooterFlags;
  if ((*(_WORD *)&headerFooterFlags & 0x8000) != 0)
  {
    -[UITableViewHeaderFooterView _contentRectForWidth:](self, "_contentRectForWidth:", width);
    v10 = v9;
    -[UIView setFrame:](self->_contentView, "setFrame:");
    v13 = 1.79769313e308;
    if (width == 0.0)
      v14 = 1.79769313e308;
    else
      v14 = v10;
    if (height != 0.0)
      v13 = height;
    LODWORD(v11) = 1112014848;
    LODWORD(v12) = 1112014848;
    -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_contentView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v14, v13, v11, v12);
  }
  else
  {
    -[UITableViewHeaderFooterView _sizeThatFits:stripPaddingForAbuttingView:isTopHeader:](self, "_sizeThatFits:stripPaddingForAbuttingView:isTopHeader:", (*(unsigned int *)&headerFooterFlags >> 4) & 1, (*(unsigned int *)&headerFooterFlags >> 5) & 1, width, height);
  }
  result.height = v8;
  result.width = v7;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_configurationUpdateHandler, 0);
  objc_destroyWeak((id *)&self->_table);
  objc_storeStrong((id *)&self->_constants, 0);
  objc_storeStrong(&self->_backgroundViewConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_systemBackgroundView, 0);
  objc_storeStrong(&self->_contentViewConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_viewForContentConfiguration, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
}

void __56__UITableViewHeaderFooterView__setupDefaultsIfNecessary__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  unint64_t v3;
  BOOL v4;
  uint64_t v5;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend((id)objc_opt_class(), "_defaultFontForHeaderFooterView:", *(_QWORD *)(a1 + 32));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setFont:", v9);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setFont:", v9);
  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[52];
  v4 = v3 > 0x10;
  v5 = (1 << v3) & 0x10006;
  if (v4 || v5 == 0)
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "_isSourceListOrMacIdiom"))
      goto LABEL_6;
    v2 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v2, "_defaultTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityHigherContrastTintColorForColor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setTextColor:", v8);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setTextColor:", v8);

LABEL_6:
}

- (void)_setupLabelAppearance
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __52__UITableViewHeaderFooterView__setupLabelAppearance__block_invoke;
  v2[3] = &unk_1E16B1B28;
  v2[4] = self;
  +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v2);
}

- (void)setSectionHeader:(BOOL)a3
{
  _BOOL4 v3;
  $459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags;

  v3 = a3;
  headerFooterFlags = self->_headerFooterFlags;
  self->_headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(*(_DWORD *)&headerFooterFlags & 0xFFFFFFFE | a3);
  if ((dyld_program_sdk_at_least() & 1) != 0 || ((((*(_BYTE *)&headerFooterFlags & 1) == 0) ^ v3) & 1) == 0)
  {
    *(_DWORD *)&self->_headerFooterFlags |= 0x40u;
    -[UITableViewHeaderFooterView _setupDefaultsIfNecessary](self, "_setupDefaultsIfNecessary");
  }
}

- (void)_setRightMarginWidth:(double)a3
{
  if (self->_trailingMarginWidth != a3)
  {
    self->_trailingMarginWidth = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_setMarginWidth:(double)a3
{
  if (self->_leadingMarginWidth != a3)
  {
    self->_leadingMarginWidth = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_setInsetsContentViewsToSafeArea:(BOOL)a3
{
  int v3;

  if (((((*(_DWORD *)&self->_headerFooterFlags & 0x100) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v3 = 256;
    else
      v3 = 0;
    self->_headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(*(_DWORD *)&self->_headerFooterFlags & 0xFFFFFEFF | v3);
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTableViewStyle:(int64_t)a3
{
  -[UITableViewHeaderFooterView _setTableViewStyle:updateFrame:](self, "_setTableViewStyle:updateFrame:", a3, 1);
}

- (void)setTableView:(id)a3
{
  self->_headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(*(_DWORD *)&self->_headerFooterFlags & 0xFFFFFBFF | ((a3 != 0) << 10));
  objc_storeWeak((id *)&self->_table, a3);
}

- (void)_setTableViewStyle:(int64_t)a3 updateFrame:(BOOL)a4
{
  _BOOL4 v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;

  if (self->_tableViewStyle != a3)
  {
    v6 = a4;
    v7 = -[UITableViewHeaderFooterView _contentViewListStyleFromTableViewStyle:](self, "_contentViewListStyleFromTableViewStyle:");
    self->_tableViewStyle = a3;
    if (!-[UITableViewHeaderFooterView _usingBackgroundConfigurationOrDefaultBackgroundConfiguration](self, "_usingBackgroundConfigurationOrDefaultBackgroundConfiguration"))-[UITableViewHeaderFooterView _setupBackgroundView](self, "_setupBackgroundView");
    -[UITableViewHeaderFooterView _updateBackgroundView](self, "_updateBackgroundView");
    -[UITableViewHeaderFooterView _invalidateDetailLabelBackgroundColor](self, "_invalidateDetailLabelBackgroundColor");
    v8 = -[UITableViewHeaderFooterView _contentViewListStyleFromTableViewStyle:](self, "_contentViewListStyleFromTableViewStyle:", a3);
    if (v7 != v8)
    {
      v9 = v8;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[UIView _containingListStyleUpdated:](self->_contentView, "_containingListStyleUpdated:", v9);
    }
    if (v6)
      -[UITableViewHeaderFooterView setFrame:](self, "setFrame:", self->_frame.origin.x, self->_frame.origin.y, self->_frame.size.width, self->_frame.size.height);
    goto LABEL_11;
  }
  if (!self->_systemBackgroundView)
LABEL_11:
    -[UITableViewHeaderFooterView _updateDefaultBackgroundAppearance](self, "_updateDefaultBackgroundAppearance");
}

- (int64_t)_contentViewListStyleFromTableViewStyle:(int64_t)a3
{
  unint64_t v3;
  unint64_t v4;
  NSObject *v5;
  NSObject *v7;
  int v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3 & ~(a3 >> 63);
  if (v3 >= 3)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        v8 = 134217984;
        v9 = v3;
        _os_log_fault_impl(&dword_185066000, v7, OS_LOG_TYPE_FAULT, "Unhandled UITableViewStyle (%ld)", (uint8_t *)&v8, 0xCu);
      }

    }
    else
    {
      v4 = _contentViewListStyleFromTableViewStyle____s_category_0;
      if (!_contentViewListStyleFromTableViewStyle____s_category_0)
      {
        v4 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v4, (unint64_t *)&_contentViewListStyleFromTableViewStyle____s_category_0);
      }
      v5 = *(NSObject **)(v4 + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v8 = 134217984;
        v9 = v3;
        _os_log_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "Unhandled UITableViewStyle (%ld)", (uint8_t *)&v8, 0xCu);
      }
    }
    return -1;
  }
  return v3;
}

- (void)_setConstants:(id)a3
{
  id *p_constants;
  id v6;

  p_constants = (id *)&self->_constants;
  v6 = *p_constants;
  objc_storeStrong(p_constants, a3);
  if (-[UITableViewHeaderFooterView _isSourceListOrMacIdiom](self, "_isSourceListOrMacIdiom"))
    *(_DWORD *)&self->_headerFooterFlags &= ~0x80u;
  if (dyld_program_sdk_at_least()
    && !-[UITableViewHeaderFooterView _usingBackgroundConfigurationOrDefaultBackgroundConfiguration](self, "_usingBackgroundConfigurationOrDefaultBackgroundConfiguration"))
  {
    -[UITableViewHeaderFooterView _setupBackgroundView](self, "_setupBackgroundView");
  }
  -[UITableViewHeaderFooterView _setupDefaultsIfNecessary](self, "_setupDefaultsIfNecessary");
  if (v6 != a3)
    -[UITableViewHeaderFooterView _updateDefaultBackgroundAppearance](self, "_updateDefaultBackgroundAppearance");
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)_isSourceListOrMacIdiom
{
  void *v2;
  uint64_t v3;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  return v3 == 5;
}

- (void)_setupDefaultsIfNecessary
{
  void *v3;
  $459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags;
  _QWORD v5[5];

  if ((*(_BYTE *)&self->_headerFooterFlags & 0x80) == 0)
  {
    if (self->_constants)
    {
      -[UITableViewHeaderFooterView _table](self, "_table");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        headerFooterFlags = self->_headerFooterFlags;

        if ((*(_BYTE *)&headerFooterFlags & 0x40) != 0)
        {
          *(_DWORD *)&self->_headerFooterFlags |= 0x80u;
          v5[0] = MEMORY[0x1E0C809B0];
          v5[1] = 3221225472;
          v5[2] = __56__UITableViewHeaderFooterView__setupDefaultsIfNecessary__block_invoke;
          v5[3] = &unk_1E16B1B28;
          v5[4] = self;
          +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v5);
        }
      }
    }
  }
}

- (BOOL)_usingBackgroundConfigurationOrDefaultBackgroundConfiguration
{
  int v3;

  v3 = dyld_program_sdk_at_least();
  if (v3)
    LOBYTE(v3) = -[UITableViewHeaderFooterView _usingBackgroundViewConfiguration](self, "_usingBackgroundViewConfiguration")|| (*(_DWORD *)&self->_headerFooterFlags & 0x3000) == 0&& (*(_DWORD *)&self->_headerFooterFlags & 0x800) == 0;
  return v3;
}

- (BOOL)_usingBackgroundViewConfiguration
{
  return self->_systemBackgroundView || self->_backgroundViewConfigurationProvider != 0;
}

- (void)_updateDefaultBackgroundAppearance
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  if (dyld_program_sdk_at_least())
  {
    if ((*((_BYTE *)&self->_headerFooterFlags + 1) & 0x38) == 0)
    {
      -[UITableViewHeaderFooterView _defaultBackgroundConfiguration](self, "_defaultBackgroundConfiguration");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __65__UITableViewHeaderFooterView__updateDefaultBackgroundAppearance__block_invoke;
      v5[3] = &unk_1E16B1B50;
      v5[4] = self;
      v6 = v3;
      v4 = v3;
      +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v5);
      *(_DWORD *)&self->_headerFooterFlags &= ~0x2000u;

    }
  }
}

- (id)_defaultBackgroundConfiguration
{
  void *v3;
  void *v4;
  int64_t tableViewStyle;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  -[UITableViewHeaderFooterView _customViewForDefaultBackgroundAppearance](self, "_customViewForDefaultBackgroundAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[UIBackgroundConfiguration clearConfiguration](UIBackgroundConfiguration, "clearConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCustomView:", v3);
  }
  else
  {
    tableViewStyle = self->_tableViewStyle;
    if (tableViewStyle == 2)
    {
      +[UIBackgroundConfiguration _listInsetGroupedHeaderFooterConfiguration](UIBackgroundConfiguration, "_listInsetGroupedHeaderFooterConfiguration");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (tableViewStyle)
        +[UIBackgroundConfiguration listGroupedHeaderFooterConfiguration](UIBackgroundConfiguration, "listGroupedHeaderFooterConfiguration");
      else
        +[UIBackgroundConfiguration listPlainHeaderFooterConfiguration](UIBackgroundConfiguration, "listPlainHeaderFooterConfiguration");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v4 = (void *)v6;
    if (-[UITableViewHeaderFooterView _tintColorAffectsBackgroundColor](self, "_tintColorAffectsBackgroundColor"))
    {
      -[UIView _interactionTintColor](self, "_interactionTintColor");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)v7;
        objc_msgSend(v4, "setBackgroundColor:", v7);

      }
    }
  }

  return v4;
}

- (BOOL)_tintColorAffectsBackgroundColor
{
  return self->_tableViewStyle == 0;
}

- (id)_customViewForDefaultBackgroundAppearance
{
  objc_class *v3;
  objc_class *v4;
  id v5;

  if (!self->_contentView
    || (objc_opt_respondsToSelector() & 1) == 0
    || (-[UIView _containerBackgroundView](self->_contentView, "_containerBackgroundView"),
        (v3 = (objc_class *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (!self->_constants
      || !-[UITableViewHeaderFooterView _isSourceListOrMacIdiom](self, "_isSourceListOrMacIdiom")
      || (objc_opt_respondsToSelector() & 1) == 0)
    {
      goto LABEL_10;
    }
    v3 = (objc_class *)-[UITableConstants defaultHeaderFooterBackgroundViewClassForTableViewStyle:](self->_constants, "defaultHeaderFooterBackgroundViewClassForTableViewStyle:", self->_tableViewStyle);
    if (v3)
    {
      v4 = v3;
      if (-[objc_class isSubclassOfClass:](v3, "isSubclassOfClass:", objc_opt_class()))
      {
        v5 = [v4 alloc];
        v3 = (objc_class *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        return v3;
      }
LABEL_10:
      v3 = 0;
    }
  }
  return v3;
}

- (void)_setAutomaticIntrinsicContentSizeInvalidationEnabled:(BOOL)a3
{
  int v3;
  UIView *contentView;
  $1DC6EB69857CC9E7E7608875A7943F0A *p_viewFlags;
  uint64_t v6;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(*(_DWORD *)&self->_headerFooterFlags & 0xFFFBFFFF | v3);
  contentView = self->_contentView;
  if (contentView)
  {
    p_viewFlags = &contentView->_viewFlags;
    v6 = 512;
    if (!a3 || (*(_QWORD *)p_viewFlags & 0x20000000000000) != 0)
      v6 = 0;
    *((_QWORD *)p_viewFlags + 1) = v6 | *((_QWORD *)p_viewFlags + 1) & 0xFFFFFFFFFFFFFDFFLL;
  }
}

- (void)_updateBackgroundView
{
  UIView *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (self->_backgroundView)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (-[UITableViewHeaderFooterView _tintColorAffectsBackgroundColor](self, "_tintColorAffectsBackgroundColor"))
      {
        -[UIView _interactionTintColor](self, "_interactionTintColor");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        v3 = self->_backgroundView;
        v4 = v3;
        if (v8)
        {
          -[UIView setBackgroundColor:](v3, "setBackgroundColor:", v8);
          objc_msgSend(v4, "applyBackgroundConfiguration:", 0);
        }
        else
        {
          -[UIView setBackgroundColor:](v3, "setBackgroundColor:", 0);
          -[UITableViewHeaderFooterView _defaultBackgroundConfiguration](self, "_defaultBackgroundConfiguration");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          -[UITableViewHeaderFooterView configurationState](self, "configurationState");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "updatedConfigurationForState:", v6);
          v7 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "applyBackgroundConfiguration:", v7);
          v4 = (void *)v7;
        }

      }
    }
  }
}

+ (id)_defaultFontForHeaderFooterView:(id)a3
{
  id v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "sectionHeader");
  objc_msgSend(v3, "_constants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "_tableStyle");
  if ((v4 & 1) != 0)
    objc_msgSend(v5, "defaultHeaderFontForTableViewStyle:", v7);
  else
    objc_msgSend(v5, "defaultFooterFontForTableViewStyle:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (UITableView)tableView
{
  void *v2;
  id v3;

  -[UITableViewHeaderFooterView _table](self, "_table");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return (UITableView *)v3;
}

- (BOOL)sectionHeader
{
  return *(_DWORD *)&self->_headerFooterFlags & 1;
}

- (void)_invalidateDetailLabelBackgroundColor
{
  *(_DWORD *)&self->_headerFooterFlags |= 4u;
  if (self->_detailLabel)
    -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTextAlignment:(int64_t)a3
{
  if (self->_textAlignment != a3)
  {
    self->_textAlignment = a3;
    -[UILabel setTextAlignment:](self->_label, "setTextAlignment:");
  }
}

- (void)_setTopHeader:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(*(_DWORD *)&self->_headerFooterFlags & 0xFFFFFFDF | v3);
}

- (void)_setStripPadding:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(*(_DWORD *)&self->_headerFooterFlags & 0xFFFFFFEF | v3);
}

- (id)_defaultTextColor
{
  $459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags;
  UITableConstants *constants;
  int64_t tableViewStyle;
  _BOOL8 v6;
  void *v7;

  if (-[UITableViewHeaderFooterView _isSourceListOrMacIdiom](self, "_isSourceListOrMacIdiom"))
  {
    headerFooterFlags = self->_headerFooterFlags;
    constants = self->_constants;
    tableViewStyle = self->_tableViewStyle;
    v6 = -[UIView isFocused](self, "isFocused");
    if ((*(_BYTE *)&headerFooterFlags & 1) != 0)
      -[UITableConstants defaultHeaderTextColorForTableViewStyle:focused:](constants, "defaultHeaderTextColorForTableViewStyle:focused:", tableViewStyle, v6);
    else
      -[UITableConstants defaultFooterTextColorForTableViewStyle:focused:](constants, "defaultFooterTextColorForTableViewStyle:focused:", tableViewStyle, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_defaultTextColorForTableViewStyle:isSectionHeader:", self->_tableViewStyle, *(_DWORD *)&self->_headerFooterFlags & 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

+ (id)_defaultTextColorForTableViewStyle:(int64_t)a3 isSectionHeader:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;

  +[UITraitCollection _fallbackTraitCollection]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _UITableConstantsForTraitCollection(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
    objc_msgSend(v7, "defaultHeaderTextColorForTableViewStyle:focused:", a3, 0);
  else
    objc_msgSend(v7, "defaultFooterTextColorForTableViewStyle:focused:", a3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (UILabel)textLabel
{
  return (UILabel *)-[UITableViewHeaderFooterView _label:](self, "_label:", 1);
}

- (id)_label:(BOOL)a3
{
  _UITableViewHeaderFooterViewLabel *label;
  BOOL v5;
  _QWORD v7[5];

  label = self->_label;
  if (label)
    v5 = 1;
  else
    v5 = !a3;
  if (!v5)
  {
    if ((*((_BYTE *)&self->_headerFooterFlags + 1) & 0x80) == 0)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __38__UITableViewHeaderFooterView__label___block_invoke;
      v7[3] = &unk_1E16B1B28;
      v7[4] = self;
      +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v7);
      return self->_label;
    }
    label = 0;
  }
  return label;
}

- (void)layoutSubviews
{
  _BOOL8 v3;
  _UITableViewHeaderFooterViewLabel *label;
  UIView *v5;
  UIView *contentView;
  _UITableViewHeaderFooterViewLabel *detailLabel;
  UIView *v8;
  UIView *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)UITableViewHeaderFooterView;
  -[UIView layoutSubviews](&v21, sel_layoutSubviews);
  -[UITableViewHeaderFooterView _performConfigurationStateUpdate](self, "_performConfigurationStateUpdate");
  -[UITableViewHeaderFooterView _layoutSystemBackgroundView](self, "_layoutSystemBackgroundView");
  -[UITableViewHeaderFooterView _updateContentAndBackgroundView](self, "_updateContentAndBackgroundView");
  -[UITableViewHeaderFooterView _updateBackgroundView](self, "_updateBackgroundView");
  -[UITableViewHeaderFooterView _setupLabelAppearance](self, "_setupLabelAppearance");
  v3 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
  label = self->_label;
  if (label)
  {
    -[UIView superview](label, "superview");
    v5 = (UIView *)objc_claimAutoreleasedReturnValue();
    contentView = self->_contentView;

    if (v5 != contentView)
    {
      +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 0);
      -[UIView addSubview:](self->_contentView, "addSubview:", self->_label);
    }
    -[UITableViewHeaderFooterView _labelFrame](self, "_labelFrame");
    -[UILabel setFrame:](self->_label, "setFrame:");
    +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", v3);
  }
  detailLabel = self->_detailLabel;
  if (detailLabel)
  {
    -[UIView superview](detailLabel, "superview");
    v8 = (UIView *)objc_claimAutoreleasedReturnValue();
    v9 = self->_contentView;

    if (v8 != v9)
    {
      +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", 0);
      -[UIView addSubview:](self->_contentView, "addSubview:", self->_detailLabel);
    }
    -[UITableViewHeaderFooterView _detailLabelFrame](self, "_detailLabelFrame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    -[UIView frame](self->_detailLabel, "frame");
    if (v15 != v19 || v17 != v18)
      -[UITableViewHeaderFooterView _invalidateDetailLabelBackgroundColor](self, "_invalidateDetailLabelBackgroundColor");
    -[UILabel setFrame:](self->_detailLabel, "setFrame:", v11, v13, v15, v17);
    -[UITableViewHeaderFooterView _updateDetailLabelBackgroundColorIfNeeded](self, "_updateDetailLabelBackgroundColorIfNeeded");
    +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", v3);
  }
}

- (void)_updateContentAndBackgroundView
{
  -[UITableViewHeaderFooterView _backgroundRect](self, "_backgroundRect");
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  -[UITableViewHeaderFooterView _contentRect](self, "_contentRect");
  -[UIView setFrame:](self->_contentView, "setFrame:");
}

- (void)_layoutSystemBackgroundView
{
  _UISystemBackgroundView *systemBackgroundView;

  systemBackgroundView = self->_systemBackgroundView;
  if (systemBackgroundView)
  {
    -[_UISystemBackgroundView frameInContainerView:](systemBackgroundView, "frameInContainerView:", self);
    -[_UISystemBackgroundView setFrame:](self->_systemBackgroundView, "setFrame:");
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
    {
      -[UIView layoutIfNeeded](self->_systemBackgroundView, "layoutIfNeeded");
    }
  }
}

- (CGRect)_backgroundRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect v7;
  CGRect result;

  -[UIView bounds](self, "bounds");
  -[UITableViewHeaderFooterView _backgroundRectForWidth:](self, "_backgroundRectForWidth:", CGRectGetWidth(v7));
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_labelFrame
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double maxTitleWidth;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double Height;
  double v26;
  double v27;
  double v28;
  int v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  CGFloat v34;
  double MinY;
  double v36;
  double v37;
  double v38;
  void *v39;
  uint64_t v40;
  double v41;
  void *v42;
  int v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  _BOOL4 v50;
  int v51;
  double v52;
  double v53;
  double v54;
  $459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags;
  void *v56;
  double v57;
  int v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double MaxY;
  int v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double rect;
  double rect_8;
  double rect_16;
  double rect_24;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect result;

  -[UILabel text](self->_label, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewHeaderFooterView _table](self, "_table");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C9D648];
  v6 = *MEMORY[0x1E0C9D648];
  rect_24 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  if (!objc_msgSend(v3, "length"))
  {
    v19 = *(double *)(v5 + 16);
    v20 = *(double *)(v5 + 24);
    goto LABEL_50;
  }
  -[UITableViewHeaderFooterView _contentRect](self, "_contentRect");
  v8 = v7;
  rect_8 = v10;
  rect_16 = v9;
  v12 = v11;
  -[UITableViewHeaderFooterView _insetsToContentRect](self, "_insetsToContentRect");
  v82 = v13;
  v83 = v14;
  v15 = v12;
  if (v12 - v13 - v14 <= self->_maxTitleWidth)
    maxTitleWidth = v12 - v13 - v14;
  else
    maxTitleWidth = self->_maxTitleWidth;
  -[UITableViewHeaderFooterView _textSizeForWidth:](self, "_textSizeForWidth:", maxTitleWidth);
  v19 = v17;
  v20 = v18;
  rect = v8;
  if (!self->_tableViewStyle)
  {
    -[UITableConstants defaultPlainHeaderLabelYPositionForTableView:headerBounds:textRect:isHeader:](self->_constants, "defaultPlainHeaderLabelYPositionForTableView:headerBounds:textRect:isHeader:", v4, *(_DWORD *)&self->_headerFooterFlags & 1, v8, rect_16, v15, rect_8, v6, rect_24, v17, v18);
    rect_24 = v28;
    goto LABEL_18;
  }
  -[UILabel font](self->_label, "font");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_headerFooterFlags & 1) != 0)
  {
    if (v20 > 1.79769313e308)
    {
      v29 = dyld_program_sdk_at_least();
      v30 = 35.0;
      if (v29)
        objc_msgSend(v21, "_scaledValueForValue:", 35.0);
      rect_24 = rect_16 + v30;
      v20 = 1.79769313e308;
      goto LABEL_17;
    }
    v50 = -[UITableViewHeaderFooterView _useDetailText](self, "_useDetailText");
    v51 = dyld_program_sdk_at_least();
    if (v50)
    {
      if (v51)
      {
        objc_msgSend(v21, "_scaledValueForValue:", 45.0);
        v53 = v52;
        -[UILabel _firstLineBaselineOffsetFromBoundsTop](self->_label, "_firstLineBaselineOffsetFromBoundsTop");
        rect_24 = v53 - v54;
        headerFooterFlags = self->_headerFooterFlags;
        if ((*(_BYTE *)&headerFooterFlags & 0x10) != 0)
        {
          objc_msgSend(v21, "_scaledValueForValue:", 10.0);
        }
        else
        {
          if ((*(_BYTE *)&headerFooterFlags & 0x20) != 0)
            goto LABEL_17;
          if (v4)
          {
            objc_msgSend(v4, "_scrollView");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "_currentScreenScale");
            rect_24 = rect_24 - UIPixelBoundaryOffset(0, 17.5, v57);

            goto LABEL_17;
          }
          -[UIView _currentScreenScale](self, "_currentScreenScale");
          v80 = UIPixelBoundaryOffset(0, 17.5, v81);
        }
        rect_24 = rect_24 - v80;
        goto LABEL_17;
      }
      v108.origin.x = v8;
      v108.size.height = rect_8;
      v108.origin.y = rect_16;
      v108.size.width = v15;
      MaxY = CGRectGetMaxY(v108);
      v76 = dyld_program_sdk_at_least();
      v77 = 10.0;
      if (v76)
        v77 = 8.0;
      v78 = MaxY - v77;
      -[UITableViewHeaderFooterView _detailTextSizeForWidth:](self, "_detailTextSizeForWidth:", maxTitleWidth);
      v27 = v78 - v79 + -10.0 - v20;
    }
    else
    {
      v70 = 10.0;
      if (v51)
      {
        objc_msgSend(v21, "_scaledValueForValue:", 10.0);
        v70 = v71;
      }
      v106.origin.x = v8;
      v106.size.height = rect_8;
      v106.origin.y = rect_16;
      v106.size.width = v15;
      v72 = CGRectGetMaxY(v106);
      v107.origin.x = v6;
      v107.origin.y = rect_24;
      v107.size.width = v19;
      v107.size.height = v20;
      v73 = v72 - (v70 + CGRectGetHeight(v107));
      -[UILabel _baselineOffsetFromBottom](self->_label, "_baselineOffsetFromBottom");
      v27 = v73 + v74;
    }
  }
  else
  {
    v22 = 10.0;
    if (dyld_program_sdk_at_least())
    {
      objc_msgSend(v21, "_scaledValueForValue:", 10.0);
      v22 = v23;
    }
    v88.origin.x = rect;
    v88.size.height = rect_8;
    v88.origin.y = rect_16;
    v88.size.width = v15;
    v24 = CGRectGetMaxY(v88);
    v89.origin.x = v6;
    v89.origin.y = rect_24;
    v89.size.width = v19;
    v89.size.height = v20;
    Height = CGRectGetHeight(v89);
    -[UILabel _baselineOffsetFromBottom](self->_label, "_baselineOffsetFromBottom");
    v27 = v24 - (v22 + Height) + v26;
  }
  rect_24 = v27;
LABEL_17:

LABEL_18:
  -[UILabel font](self->_label, "font");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "lineHeight");
  v33 = v32;

  v90.origin.x = v6;
  v90.origin.y = rect_24;
  v90.size.width = v19;
  v90.size.height = v20;
  if (CGRectGetHeight(v90) < v33)
  {
    v34 = v20;
    if (v33 >= rect_8)
      v20 = rect_8;
    else
      v20 = v33;
    v91.origin.x = v6;
    v91.origin.y = rect_24;
    v91.size.width = v19;
    v91.size.height = v34;
    MinY = CGRectGetMinY(v91);
    v92.origin.x = v6;
    v92.origin.y = rect_24;
    v92.size.width = v19;
    v92.size.height = v34;
    v93.origin.y = round(MinY + CGRectGetHeight(v92) * 0.5 - v20 * 0.5);
    v93.origin.x = v6;
    rect_24 = v93.origin.y;
    v93.size.width = v19;
    v93.size.height = v20;
    v36 = CGRectGetMinY(v93);
    v94.origin.x = rect;
    v94.origin.y = rect_16;
    v94.size.width = v15;
    v94.size.height = rect_8;
    if (v36 < CGRectGetMinY(v94))
    {
      v95.origin.x = rect;
      v95.size.height = rect_8;
      v95.origin.y = rect_16;
      v95.size.width = v15;
      rect_24 = CGRectGetMinY(v95);
    }
    v96.origin.x = v6;
    v96.origin.y = rect_24;
    v96.size.width = v19;
    v96.size.height = v20;
    v37 = CGRectGetMaxY(v96);
    v97.origin.x = rect;
    v97.size.height = rect_8;
    v97.origin.y = rect_16;
    v97.size.width = v15;
    if (v37 > CGRectGetMaxY(v97))
    {
      v98.origin.x = rect;
      v98.size.height = rect_8;
      v98.origin.y = rect_16;
      v98.size.width = v15;
      v38 = CGRectGetMaxY(v98);
      v99.origin.x = v6;
      v99.origin.y = rect_24;
      v99.size.width = v19;
      v99.size.height = v20;
      rect_24 = rect_24 - (v38 - CGRectGetMaxY(v99));
    }
  }
  -[UILabel attributedText](self->_label, "attributedText");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "_ui_resolvedTextAlignmentForUserInterfaceLayoutDirection:", +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[UIView semanticContentAttribute](self, "semanticContentAttribute")));

  if (v40 == 2)
  {
    v101.origin.x = rect;
    v101.size.height = rect_8;
    v101.origin.y = rect_16;
    v101.size.width = v15;
    v44 = ceil(CGRectGetWidth(v101) - v19 - v83);
    if (v44 >= 0.0)
      v6 = v44;
    else
      v6 = 0.0;
    objc_msgSend(v4, "_scrollView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v45, "_shouldReverseLayoutDirection") & 1) != 0)
    {

    }
    else
    {
      v58 = objc_msgSend(v4, "_isShowingIndex");

      if (v58)
      {
        objc_msgSend(v4, "_indexFrame");
        v6 = v6 - CGRectGetWidth(v102);
      }
    }
  }
  else
  {
    v41 = rect;
    if (v40 == 1)
    {
      v47 = rect_8;
      v46 = rect_16;
      v48 = v15;
      v49 = ceil((CGRectGetWidth(*(CGRect *)&v41) - v19) * 0.5);
      if (v49 >= 0.0)
        v6 = v49;
      else
        v6 = 0.0;
      goto LABEL_50;
    }
    if (!v40)
    {
      objc_msgSend(v4, "_scrollView", rect);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v42, "_shouldReverseLayoutDirection"))
      {
        v43 = objc_msgSend(v4, "_isShowingIndex");

        if (v43)
        {
          objc_msgSend(v4, "_indexFrame");
          v6 = v82 + CGRectGetWidth(v100);
          goto LABEL_50;
        }
      }
      else
      {

      }
      v6 = v82;
    }
  }
LABEL_50:
  v103.origin.x = v6;
  v103.origin.y = rect_24;
  v103.size.width = v19;
  v103.size.height = v20;
  v59 = fmax(CGRectGetWidth(v103), 0.0);
  v104.origin.x = v6;
  v104.origin.y = rect_24;
  v104.size.width = v59;
  v104.size.height = v20;
  v60 = fmax(CGRectGetHeight(v104), 0.0);
  v105.origin.x = v6;
  v105.origin.y = rect_24;
  v105.size.width = v59;
  v105.size.height = v60;
  v61 = CGRectGetMinY(v105);
  if (v4)
  {
    objc_msgSend(v4, "_scrollView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "_currentScreenScale");
    v64 = UIPixelBoundaryOffset(0, v61, v63);

  }
  else
  {
    -[UIView _currentScreenScale](self, "_currentScreenScale");
    v64 = UIPixelBoundaryOffset(0, v61, v65);
  }

  v66 = v6;
  v67 = v64;
  v68 = v59;
  v69 = v60;
  result.size.height = v69;
  result.size.width = v68;
  result.origin.y = v67;
  result.origin.x = v66;
  return result;
}

- (CGSize)_textSizeForWidth:(double)a3
{
  void *v5;
  int has_internal_diagnostics;
  void *v7;
  double v8;
  double v9;
  _UITableViewHeaderFooterViewLabel *label;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  NSObject *v26;
  objc_class *v27;
  void *v28;
  unint64_t v29;
  NSObject *v30;
  objc_class *v31;
  int v32;
  void *v33;
  uint64_t v34;
  CGSize result;

  v34 = *MEMORY[0x1E0C80C00];
  -[UILabel text](self->_label, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    -[UILabel font](self->_label, "font");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pointSize");
    v9 = v8;

    if (has_internal_diagnostics)
    {
      if (v9 != 0.0)
        goto LABEL_4;
      __UIFaultDebugAssertLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
LABEL_20:

LABEL_4:
        label = self->_label;
        if (self->_tableViewStyle)
        {
          -[UILabel sizeThatFits:](label, "sizeThatFits:", a3, 1.79769313e308);
          v12 = v11;
          v14 = v13;
        }
        else
        {
          -[UILabel font](label, "font");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "_legacy_sizeWithFont:forWidth:lineBreakMode:", v15, -[UILabel lineBreakMode](self->_label, "lineBreakMode"), a3);
          v12 = v16;
          v14 = v17;

        }
        goto LABEL_8;
      }
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138412290;
      v33 = v28;
      _os_log_fault_impl(&dword_185066000, v26, OS_LOG_TYPE_FAULT, "Attempting to compute the size of a %@ text label with an undefined (0 pt) font! This will yield invalid results.", (uint8_t *)&v32, 0xCu);
    }
    else
    {
      if (v9 != 0.0)
        goto LABEL_4;
      v29 = _textSizeForWidth____s_category;
      if (!_textSizeForWidth____s_category)
      {
        v29 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v29, (unint64_t *)&_textSizeForWidth____s_category);
      }
      v30 = *(NSObject **)(v29 + 8);
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        goto LABEL_4;
      v26 = v30;
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138412290;
      v33 = v28;
      _os_log_impl(&dword_185066000, v26, OS_LOG_TYPE_ERROR, "Attempting to compute the size of a %@ text label with an undefined (0 pt) font! This will yield invalid results.", (uint8_t *)&v32, 0xCu);
    }

    goto LABEL_20;
  }
  v12 = *MEMORY[0x1E0C9D820];
  v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
LABEL_8:
  -[UITableViewHeaderFooterView _table](self, "_table");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    objc_msgSend(v18, "_scrollView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_currentScreenScale");
    v22 = v21;

  }
  else
  {
    -[UIView _currentScreenScale](self, "_currentScreenScale");
    v22 = v23;
  }

  v24 = ceil(v12 * v22) / v22;
  v25 = ceil(v14 * v22) / v22;
  result.height = v25;
  result.width = v24;
  return result;
}

- (CGSize)_sizeThatFits:(CGSize)a3 stripPaddingForAbuttingView:(BOOL)a4 isTopHeader:(BOOL)a5
{
  _BOOL4 v6;
  double width;
  _UITableViewHeaderFooterViewLabel **p_label;
  _UITableViewHeaderFooterViewLabel *label;
  _UITableViewHeaderFooterViewLabel **p_detailLabel;
  _UITableViewHeaderFooterViewLabel *detailLabel;
  void *v13;
  double v14;
  double v15;
  double v16;
  double maxTitleWidth;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  unint64_t tableViewStyle;
  BOOL v28;
  uint64_t v29;
  BOOL v30;
  UITableConstants *constants;
  void *v32;
  double v33;
  int v34;
  $459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  _BOOL4 v42;
  double v43;
  double v44;
  double v45;
  int v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  int v52;
  double v53;
  _UITableViewHeaderFooterViewLabel **v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  double v64;
  double v65;
  int v66;
  double v67;
  double v68;
  void *v69;
  double v70;
  double v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  void *v81;
  double v82;
  double v83;
  double v84;
  double v85;
  void *v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  CGSize result;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;

  v6 = a4;
  width = a3.width;
  p_label = &self->_label;
  label = self->_label;
  if (label)
  {
    -[UIView frame](label, "frame", a3.width, a3.height);
    if (CGRectGetWidth(v96) <= 0.0
      || (-[UIView frame](*p_label, "frame"), a3.width = CGRectGetHeight(v97), a3.width <= 0.0))
    {
      -[UIView setNeedsLayout](self, "setNeedsLayout");
    }
  }
  p_detailLabel = &self->_detailLabel;
  detailLabel = self->_detailLabel;
  if (detailLabel)
  {
    -[UIView frame](detailLabel, "frame", a3.width, a3.height);
    if (CGRectGetWidth(v98) <= 0.0
      || (-[UIView frame](*p_detailLabel, "frame"), a3.width = CGRectGetHeight(v99), a3.width <= 0.0))
    {
      -[UIView setNeedsLayout](self, "setNeedsLayout");
    }
  }
  -[UIView layoutIfNeeded](self, "layoutIfNeeded", a3.width, a3.height);
  -[UITableViewHeaderFooterView _table](self, "_table");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewHeaderFooterView _insetsToBounds](self, "_insetsToBounds");
  v16 = v14 + v15;
  if (width - (v14 + v15) <= self->_maxTitleWidth)
    maxTitleWidth = width - (v14 + v15);
  else
    maxTitleWidth = self->_maxTitleWidth;
  -[UITableViewHeaderFooterView _textSizeForWidth:](self, "_textSizeForWidth:", maxTitleWidth);
  v19 = v18;
  v21 = v20;
  -[UIView traitCollection](self, "traitCollection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "userInterfaceIdiom");

  if (v23 == 6)
  {
    -[UITableConstants defaultHeaderFooterLayoutMarginsForTableViewStyle:isHeader:isFirstSection:](self->_constants, "defaultHeaderFooterLayoutMarginsForTableViewStyle:isHeader:isFirstSection:", self->_tableViewStyle, *(_DWORD *)&self->_headerFooterFlags & 1, (*(_DWORD *)&self->_headerFooterFlags >> 5) & 1);
    v26 = v25 + v21 + v24;
  }
  else
  {
    tableViewStyle = self->_tableViewStyle;
    v28 = tableViewStyle > 0x10;
    v29 = (1 << tableViewStyle) & 0x10006;
    v30 = v28 || v29 == 0;
    if (v30 || -[UITableViewHeaderFooterView _isSourceListOrMacIdiom](self, "_isSourceListOrMacIdiom"))
    {
      constants = self->_constants;
      -[UITableViewHeaderFooterView table](self, "table");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableConstants defaultSectionHeaderHeightForTableView:](constants, "defaultSectionHeaderHeightForTableView:", v32);
      v26 = v33;

    }
    else
    {
      v34 = dyld_program_sdk_at_least();
      headerFooterFlags = self->_headerFooterFlags;
      if (v34 && (*(_BYTE *)&headerFooterFlags & 1) != 0)
      {
        -[UILabel font](*p_label, "font");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "_scaledValueForValue:", 45.0);
        v38 = v37;
        -[UILabel font](*p_label, "font");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "lineHeight");
        v41 = v21 + v38 - v40;

        v42 = -[UITableViewHeaderFooterView _useDetailText](self, "_useDetailText");
        v43 = 10.0;
        if (v42)
        {
          -[UITableViewHeaderFooterView _detailTextSizeForWidth:](self, "_detailTextSizeForWidth:", maxTitleWidth);
          v45 = v41 + v44;
          v46 = dyld_program_sdk_at_least();
          v47 = 20.0;
          if (v46)
            v47 = 16.0;
          objc_msgSend(v36, "_scaledValueForValue:", v47);
          v49 = v48;
          -[UILabel font](*p_detailLabel, "font");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "lineHeight");
          v41 = v45 + v49 - v51;

          v52 = dyld_program_sdk_at_least();
          v43 = 10.0;
          if (v52)
            v43 = 8.0;
        }
        objc_msgSend(v36, "_scaledValueForValue:", v43);
        v26 = v41 + v53;
        if (v6)
        {
          v26 = v26 + -10.0;
        }
        else if (!a5)
        {
          if (v13)
          {
            objc_msgSend(v13, "_scrollView");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "_currentScreenScale");
            v26 = v26 - UIPixelBoundaryOffset(0, 17.5, v64);

          }
          else
          {
            -[UIView _currentScreenScale](self, "_currentScreenScale");
            v26 = v26 - UIPixelBoundaryOffset(0, 17.5, v83);
          }
        }
        -[UIView _currentScreenScale](self, "_currentScreenScale");
        if (v26 < UIPixelBoundaryOffset(0, 17.5, v84))
        {
          -[UIView _currentScreenScale](self, "_currentScreenScale");
          v26 = UIPixelBoundaryOffset(0, 17.5, v85);
        }

      }
      else if ((*(_BYTE *)&headerFooterFlags & 1) != 0)
      {
        if (-[UITableViewHeaderFooterView _useDetailText](self, "_useDetailText"))
        {
          if (dyld_program_sdk_at_least())
            v65 = 61.0;
          else
            v65 = 65.0;
          v66 = dyld_program_sdk_at_least();
          v67 = 10.0;
          if (v66)
            v67 = 8.0;
          v68 = v65 + v67;
          -[UILabel font](*p_label, "font");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "lineHeight");
          v71 = v70;
          -[UILabel font](*p_detailLabel, "font");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "lineHeight");
          v74 = v68 - (v71 + v73);

        }
        else
        {
          -[UILabel _firstLineBaselineOffsetFromBoundsTop](*p_label, "_firstLineBaselineOffsetFromBoundsTop");
          v79 = v78;
          -[UILabel _baselineOffsetFromBottom](*p_label, "_baselineOffsetFromBottom");
          v74 = 55.0 - (v79 + v80);
        }
        v26 = v21 + v74;
        if (v6)
        {
          v26 = v26 + -10.0;
        }
        else if (!a5)
        {
          if (v13)
          {
            objc_msgSend(v13, "_scrollView");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "_currentScreenScale");
            v26 = v26 - UIPixelBoundaryOffset(0, 17.5, v82);

          }
          else
          {
            -[UIView _currentScreenScale](self, "_currentScreenScale");
            v26 = v26 - UIPixelBoundaryOffset(0, 17.5, v92);
          }
        }
        -[UIView _currentScreenScale](self, "_currentScreenScale");
        if (v26 < UIPixelBoundaryOffset(0, 17.5, v93))
        {
          -[UIView _currentScreenScale](self, "_currentScreenScale");
          v26 = UIPixelBoundaryOffset(0, 17.5, v94);
        }
      }
      else if (dyld_program_sdk_at_least())
      {
        if (dyld_program_sdk_at_least())
          v54 = p_label;
        else
          v54 = &self->_detailLabel;
        -[UILabel font](*v54, "font");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "_scaledValueForValue:", 20.0);
        v57 = v56;
        objc_msgSend(v55, "_scaledValueForValue:", 10.0);
        v59 = v58;
        -[UILabel _firstLineBaselineOffsetFromBoundsTop](*p_label, "_firstLineBaselineOffsetFromBoundsTop");
        v61 = v60;
        -[UILabel _baselineOffsetFromBottom](*p_label, "_baselineOffsetFromBottom");
        v26 = v59 + v21 + v57 - (v61 + v62);

      }
      else
      {
        -[UILabel _firstLineBaselineOffsetFromBoundsTop](*p_label, "_firstLineBaselineOffsetFromBoundsTop");
        v76 = v75;
        -[UILabel _baselineOffsetFromBottom](*p_label, "_baselineOffsetFromBottom");
        v26 = v21 + 20.0 - (v76 + v77) + 10.0;
      }
    }
  }
  if (v13)
  {
    objc_msgSend(v13, "_scrollView");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "_currentScreenScale");
    v88 = UIPixelBoundaryOffset(1, v26, v87);

  }
  else
  {
    -[UIView _currentScreenScale](self, "_currentScreenScale");
    v88 = UIPixelBoundaryOffset(1, v26, v89);
  }

  v90 = v16 + v19;
  v91 = v88;
  result.height = v91;
  result.width = v90;
  return result;
}

- (UIEdgeInsets)_insetsToContentRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  UIEdgeInsets result;

  -[UITableViewHeaderFooterView _insetsToBounds](self, "_insetsToBounds");
  v4 = v3;
  v6 = v5;
  -[UITableViewHeaderFooterView _contentRect](self, "_contentRect");
  x = v17.origin.x;
  y = v17.origin.y;
  width = v17.size.width;
  height = v17.size.height;
  v11 = fmax(v4 - CGRectGetMinX(v17), 0.0);
  -[UIView bounds](self, "bounds");
  v12 = CGRectGetWidth(v18);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v13 = fmax(v6 - (v12 - CGRectGetMaxX(v19)), 0.0);
  v14 = 0.0;
  v15 = 0.0;
  v16 = v11;
  result.right = v13;
  result.bottom = v15;
  result.left = v16;
  result.top = v14;
  return result;
}

- (UIEdgeInsets)_insetsToBounds
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  int v10;
  double v11;
  int v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double MinX;
  double v24;
  double v25;
  double MaxX;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  UIEdgeInsets result;

  -[UITableViewHeaderFooterView _table](self, "_table");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "_supplementarySectionHeadersHugContent")
    && (*(_BYTE *)&self->_headerFooterFlags & 1) != 0
    || objc_msgSend(v3, "_supplementariesFollowSectionContentInsets"))
  {
    -[UITableConstants defaultHeaderFooterLayoutMarginsForTableViewStyle:isHeader:isFirstSection:](self->_constants, "defaultHeaderFooterLayoutMarginsForTableViewStyle:isHeader:isFirstSection:", -[UITableViewHeaderFooterView tableViewStyle](self, "tableViewStyle"), *(_DWORD *)&self->_headerFooterFlags & 1, -[UITableViewHeaderFooterView _isTopHeader](self, "_isTopHeader"));
    v5 = v4;
    v7 = v6;
  }
  else
  {
    objc_msgSend(v3, "_scrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "_scrollView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "_shouldReverseLayoutDirection");

    }
    else
    {
      v10 = 0;
    }

    -[UITableViewHeaderFooterView _marginWidth](self, "_marginWidth");
    v7 = v11;
    v12 = dyld_program_sdk_at_least();
    -[UITableViewHeaderFooterView _rightMarginWidth](self, "_rightMarginWidth");
    v14 = v13;
    if (v12)
    {
      -[UITableViewHeaderFooterView _contentRect](self, "_contentRect");
      v19 = v15;
      v20 = v16;
      v21 = v17;
      v22 = v18;
      if ((v10 & 1) != 0)
      {
        MinX = CGRectGetMinX(*(CGRect *)&v15);
        -[UIView bounds](self, "bounds");
        v24 = MinX - CGRectGetMinX(v31);
      }
      else
      {
        -[UIView bounds](self, "bounds");
        MaxX = CGRectGetMaxX(v32);
        v33.origin.x = v19;
        v33.origin.y = v20;
        v33.size.width = v21;
        v33.size.height = v22;
        v24 = MaxX - CGRectGetMaxX(v33);
      }
      v25 = v14 + v24;
    }
    else
    {
      v25 = fmax(v7, v13);
    }
    if (v10)
      v5 = v25;
    else
      v5 = v7;
    if (!v10)
      v7 = v25;
  }

  v27 = 0.0;
  v28 = 0.0;
  v29 = v5;
  v30 = v7;
  result.right = v30;
  result.bottom = v28;
  result.left = v29;
  result.top = v27;
  return result;
}

- (UITable)table
{
  return (UITable *)objc_loadWeakRetained((id *)&self->_table);
}

- (double)_rightMarginWidth
{
  double result;

  result = self->_trailingMarginWidth;
  if (result == -1.0)
    return 0.0;
  return result;
}

- (double)_marginWidth
{
  double result;

  result = self->_leadingMarginWidth;
  if (result == -1.0)
    return 15.0;
  return result;
}

- (BOOL)_useDetailText
{
  unint64_t tableViewStyle;
  BOOL v3;
  uint64_t v4;
  BOOL v5;
  BOOL v6;
  void *v7;

  tableViewStyle = self->_tableViewStyle;
  v3 = tableViewStyle > 0x10;
  v4 = (1 << tableViewStyle) & 0x10006;
  v5 = v3 || v4 == 0;
  if (v5 || (*(_BYTE *)&self->_headerFooterFlags & 1) == 0)
    return 0;
  -[UILabel text](self->_detailLabel, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "length") != 0;

  return v6;
}

void __40__UITableViewHeaderFooterView_setFrame___block_invoke()
{
  id v0;

  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    _UIMainBundleIdentifier();
    v0 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v0, "rangeOfString:", CFSTR("com.inditex.zara")))
      _MergedGlobals_37_0 = 1;

  }
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  objc_super v6;

  v3 = a3;
  v5 = -[UIView isUserInteractionEnabled](self, "isUserInteractionEnabled");
  if (v5 != v3)
    -[UITableViewHeaderFooterView _prepareForConfigurationStateUpdate](self, "_prepareForConfigurationStateUpdate");
  v6.receiver = self;
  v6.super_class = (Class)UITableViewHeaderFooterView;
  -[UIView setUserInteractionEnabled:](&v6, sel_setUserInteractionEnabled_, v3);
  if (v5 != -[UIView isUserInteractionEnabled](self, "isUserInteractionEnabled"))
    -[UITableViewHeaderFooterView setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (void)setNeedsUpdateConfiguration
{
  if (dyld_program_sdk_at_least())
  {
    *(_DWORD *)&self->_headerFooterFlags |= 0x4000u;
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
    {
      -[UITableViewHeaderFooterView _performConfigurationStateUpdate](self, "_performConfigurationStateUpdate");
    }
    else
    {
      -[UIView setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (void)prepareForReuse
{
  -[UILabel setText:](self->_detailLabel, "setText:", 0);
  -[UILabel setText:](self->_label, "setText:", 0);
  if (dyld_program_sdk_at_least())
  {
    *(_DWORD *)&self->_headerFooterFlags &= 0xFFFFFF3E;
    -[UIView _removeAllAnimations:](self, "_removeAllAnimations:", 1);
  }
  -[UITableViewHeaderFooterView _notifyIsDisplaying:](self, "_notifyIsDisplaying:", 0);
  -[UITableViewHeaderFooterView setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (void)_invalidateConfiguration
{
  -[UITableViewHeaderFooterView setNeedsUpdateConfiguration](self, sel_setNeedsUpdateConfiguration);
}

- (void)_updateConfigurationWithObservationTracking
{
  UITableViewHeaderFooterView *v2;

  v2 = self;
  sub_18572A3AC();

}

- (UITableViewHeaderFooterView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  UITableViewHeaderFooterView *v8;
  UITableViewHeaderFooterView *v9;
  UITableViewHeaderFooterView *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (dyld_program_sdk_at_least())
  {
    v8 = -[UITableViewHeaderFooterView initWithReuseIdentifier:](self, "initWithReuseIdentifier:", 0);
    v9 = v8;
    if (v8)
    {
      -[UITableViewHeaderFooterView setFrame:](v8, "setFrame:", x, y, width, height);
      -[UITableViewHeaderFooterView _updateContentAndBackgroundView](v9, "_updateContentAndBackgroundView");
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)UITableViewHeaderFooterView;
    v10 = -[UIView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
    v9 = v10;
    if (v10)
      UITableViewHeaderFooterViewCommonInit(v10, 0);
  }
  return v9;
}

- (UITableViewHeaderFooterView)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  UITableViewHeaderFooterView *v5;
  void *v6;
  uint64_t v7;
  _UISystemBackgroundView *systemBackgroundView;
  _UISystemBackgroundView *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _UIContentViewInternal *viewForContentConfiguration;
  void *v14;
  uint64_t v15;
  _UITableViewHeaderFooterViewLabel *label;
  uint64_t v17;
  _UITableViewHeaderFooterViewLabel *detailLabel;
  int v19;
  double v20;
  objc_super v22;

  v4 = coder;
  v22.receiver = self;
  v22.super_class = (Class)UITableViewHeaderFooterView;
  v5 = -[UIView initWithCoder:](&v22, sel_initWithCoder_, v4);
  if (dyld_program_sdk_at_least() && v5)
  {
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIReuseIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    UITableViewHeaderFooterViewCommonInit(v5, v6);

    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UISystemBackgroundView"));
    v7 = objc_claimAutoreleasedReturnValue();
    systemBackgroundView = v5->_systemBackgroundView;
    v5->_systemBackgroundView = (_UISystemBackgroundView *)v7;

    v9 = v5->_systemBackgroundView;
    if (v9)
    {
      -[UIView insertSubview:atIndex:](v5, "insertSubview:atIndex:", v9, 0);
    }
    else
    {
      -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIBackgroundView"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableViewHeaderFooterView setBackgroundView:](v5, "setBackgroundView:", v10);

    }
    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIContentConfigurationIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(*(_DWORD *)&v5->_headerFooterFlags & 0xFFFF7FFF | ((v11 != 0) << 15));

    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIContentConfigurationView"));
    v12 = objc_claimAutoreleasedReturnValue();
    viewForContentConfiguration = v5->_viewForContentConfiguration;
    v5->_viewForContentConfiguration = (_UIContentViewInternal *)v12;

    -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIContentView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      -[UITableViewHeaderFooterView _setContentView:insertAtBack:](v5, "_setContentView:insertAtBack:", v14, 0);
    if ((*((_BYTE *)&v5->_headerFooterFlags + 1) & 0x80) == 0)
    {
      -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UILabel"));
      v15 = objc_claimAutoreleasedReturnValue();
      label = v5->_label;
      v5->_label = (_UITableViewHeaderFooterViewLabel *)v15;

      -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UIDetailLabel"));
      v17 = objc_claimAutoreleasedReturnValue();
      detailLabel = v5->_detailLabel;
      v5->_detailLabel = (_UITableViewHeaderFooterViewLabel *)v17;

    }
    if (!dyld_program_sdk_at_least()
      || -[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UITableViewStyle")))
    {
      v5->_tableViewStyle = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UITableViewStyle"));
    }
    if (-[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIFloating")))
      v19 = 8;
    else
      v19 = 0;
    v5->_headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(*(_DWORD *)&v5->_headerFooterFlags & 0xFFFFFFF7 | v19);
    v5->_headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(*(_DWORD *)&v5->_headerFooterFlags & 0xFFFFFFFE | -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UIIsHeader")));
    v5->_textAlignment = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UITextAlignment"));
    -[NSCoder decodeDoubleForKey:](v4, "decodeDoubleForKey:", CFSTR("UIMaxTitleWidth"));
    v5->_maxTitleWidth = v20;
    -[UIView setNeedsLayout](v5, "setNeedsLayout");

  }
  return v5;
}

- (void)_populateArchivedSubviews:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UITableViewHeaderFooterView;
  -[UIView _populateArchivedSubviews:](&v5, sel__populateArchivedSubviews_, v4);
  if (self->_systemBackgroundView)
    objc_msgSend(v4, "removeObject:");

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *reuseIdentifier;
  void *v6;
  id v7;
  objc_class *v8;
  void *v9;
  UIView *backgroundView;
  UIView *contentView;
  _UITableViewHeaderFooterViewLabel *label;
  _UITableViewHeaderFooterViewLabel *detailLabel;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UITableViewHeaderFooterView;
  -[UIView encodeWithCoder:](&v14, sel_encodeWithCoder_, v4);
  reuseIdentifier = self->_reuseIdentifier;
  if (reuseIdentifier)
    objc_msgSend(v4, "encodeObject:forKey:", reuseIdentifier, CFSTR("UIReuseIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_systemBackgroundView, CFSTR("UISystemBackgroundView"));
  if ((*((_BYTE *)&self->_headerFooterFlags + 1) & 0x80) != 0)
  {
    -[UITableViewHeaderFooterView contentConfiguration](self, "contentConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = v6;
    }
    else
    {
      -[UITableViewHeaderFooterView _contentViewConfiguration](self, "_contentViewConfiguration");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        v9 = 0;
LABEL_11:
        objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("UIContentConfigurationIdentifier"));

        goto LABEL_12;
      }
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "_wrappedConfigurationIdentifier");
    }
    else
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend(v4, "encodeObject:forKey:", self->_viewForContentConfiguration, CFSTR("UIContentConfigurationView"));
  backgroundView = self->_backgroundView;
  if (backgroundView)
    objc_msgSend(v4, "encodeObject:forKey:", backgroundView, CFSTR("UIBackgroundView"));
  contentView = self->_contentView;
  if (contentView)
    objc_msgSend(v4, "encodeObject:forKey:", contentView, CFSTR("UIContentView"));
  label = self->_label;
  if (label)
    objc_msgSend(v4, "encodeObject:forKey:", label, CFSTR("UILabel"));
  detailLabel = self->_detailLabel;
  if (detailLabel)
    objc_msgSend(v4, "encodeObject:forKey:", detailLabel, CFSTR("UIDetailLabel"));
  objc_msgSend(v4, "encodeBool:forKey:", (*(_DWORD *)&self->_headerFooterFlags >> 3) & 1, CFSTR("UIFloating"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_tableViewStyle, CFSTR("UITableViewStyle"));
  objc_msgSend(v4, "encodeBool:forKey:", *(_DWORD *)&self->_headerFooterFlags & 1, CFSTR("UIIsHeader"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_textAlignment, CFSTR("UITextAlignment"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("UIMaxTitleWidth"), self->_maxTitleWidth);

}

void __69__UITableViewHeaderFooterView__setupChangeHandlersForNewContentView___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateDefaultBackgroundAppearance");

}

id __69__UITableViewHeaderFooterView__setupChangeHandlersForNewContentView___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "defaultContentConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "configurationState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updatedConfigurationForState:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (UIListContentConfiguration)defaultContentConfiguration
{
  int64_t tableViewStyle;
  void *v4;
  int v5;
  void *v6;

  tableViewStyle = self->_tableViewStyle;
  if (tableViewStyle < 0)
  {
    -[UITableViewHeaderFooterView _table](self, "_table");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    tableViewStyle = objc_msgSend(v4, "_tableStyle");

  }
  v5 = *(_DWORD *)&self->_headerFooterFlags & 0x41;
  if ((unint64_t)(tableViewStyle - 1) >= 2)
  {
    if (v5 == 64)
      +[UIListContentConfiguration plainFooterConfiguration](UIListContentConfiguration, "plainFooterConfiguration");
    else
      +[UIListContentConfiguration plainHeaderConfiguration](UIListContentConfiguration, "plainHeaderConfiguration");
  }
  else if (v5 == 64)
  {
    +[UIListContentConfiguration groupedFooterConfiguration](UIListContentConfiguration, "groupedFooterConfiguration");
  }
  else
  {
    +[UIListContentConfiguration groupedHeaderConfiguration](UIListContentConfiguration, "groupedHeaderConfiguration");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return (UIListContentConfiguration *)v6;
}

- (void)_setContentViewConfiguration:(id)a3
{
  -[UITableViewHeaderFooterView _applyContentViewConfiguration:withState:usingSPI:](self, "_applyContentViewConfiguration:withState:usingSPI:", a3, 0, 1);
}

- (void)setAutomaticallyUpdatesContentConfiguration:(BOOL)automaticallyUpdatesContentConfiguration
{
  id contentViewConfigurationProvider;
  $459C830AD401FFB60020A0C1FEE757B7 *p_headerFooterFlags;
  $459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags;

  if (automaticallyUpdatesContentConfiguration)
  {
    contentViewConfigurationProvider = self->_contentViewConfigurationProvider;
    p_headerFooterFlags = &self->_headerFooterFlags;
    headerFooterFlags = self->_headerFooterFlags;
    if ((contentViewConfigurationProvider == 0) != ((*(_DWORD *)&headerFooterFlags & 0x10000) == 0))
      return;
    if (!contentViewConfigurationProvider)
    {
      *p_headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(*(_DWORD *)&headerFooterFlags | 0x10000);
      -[UITableViewHeaderFooterView setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
      return;
    }
  }
  else
  {
    p_headerFooterFlags = &self->_headerFooterFlags;
    headerFooterFlags = self->_headerFooterFlags;
    if ((*(_DWORD *)&headerFooterFlags & 0x10000) == 0)
      return;
  }
  *p_headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(*(_DWORD *)&headerFooterFlags & 0xFFFEFFFF);
}

- (BOOL)automaticallyUpdatesContentConfiguration
{
  return *((_BYTE *)&self->_headerFooterFlags + 2) & 1;
}

- (void)_setContentViewConfigurationProvider:(id)a3
{
  void *v4;
  id contentViewConfigurationProvider;

  if (self->_contentViewConfigurationProvider != a3)
  {
    if (a3)
      *(_DWORD *)&self->_headerFooterFlags &= ~0x10000u;
    v4 = (void *)objc_msgSend(a3, "copy");
    contentViewConfigurationProvider = self->_contentViewConfigurationProvider;
    self->_contentViewConfigurationProvider = v4;

    -[UITableViewHeaderFooterView setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }
}

- (id)_contentViewConfigurationProvider
{
  return _Block_copy(self->_contentViewConfigurationProvider);
}

+ (id)_defaultFontForTableViewStyle:(int64_t)a3 isSectionHeader:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;

  +[UITraitCollection _fallbackTraitCollection]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _UITableConstantsForTraitCollection(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
    objc_msgSend(v7, "defaultHeaderFontForTableViewStyle:", a3);
  else
    objc_msgSend(v7, "defaultFooterFontForTableViewStyle:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_defaultPlainHeaderFooterFont
{
  if (dyld_program_sdk_at_least())
    objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleHeadline"));
  else
    objc_msgSend(off_1E167A828, "boldSystemFontOfSize:", 14.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (double)defaultHeaderHeightForStyle:(int64_t)a3
{
  double result;
  int v4;
  void *v5;
  double v6;
  double v7;

  if (a3)
    return 17.5;
  v4 = dyld_program_sdk_at_least();
  result = 23.0;
  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "_defaultPlainHeaderFooterFont");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_scaledValueForValue:", 28.0);
    v7 = v6;

    return v7;
  }
  return result;
}

- (BOOL)_automaticIntrinsicContentSizeInvalidationEnabled
{
  return (*((unsigned __int8 *)&self->_headerFooterFlags + 2) >> 2) & 1;
}

- (void)_setupLabelForSourceList:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setNumberOfLines:", 1);
  objc_msgSend(v3, "setLineBreakMode:", 4);
  objc_msgSend(v3, "setAllowsDefaultTighteningForTruncation:", 0);
  objc_msgSend(v3, "setAdjustsFontSizeToFitWidth:", 0);

}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (CGSize)_detailTextSizeForWidth:(double)a3
{
  _BOOL4 v5;
  double v6;
  double v7;
  void *v8;
  int has_internal_diagnostics;
  void *v10;
  double v11;
  double v12;
  int v13;
  _UITableViewHeaderFooterViewLabel *detailLabel;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  NSObject *v28;
  objc_class *v29;
  void *v30;
  unint64_t v31;
  NSObject *v32;
  objc_class *v33;
  int v34;
  void *v35;
  uint64_t v36;
  CGSize result;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = -[UITableViewHeaderFooterView _useDetailText](self, "_useDetailText");
  v6 = *MEMORY[0x1E0C9D820];
  v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (!v5)
    goto LABEL_12;
  -[UILabel text](self->_detailLabel, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    -[UILabel font](self->_detailLabel, "font");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pointSize");
    v12 = v11;

    if (has_internal_diagnostics)
    {
      if (v12 != 0.0)
        goto LABEL_5;
      __UIFaultDebugAssertLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
LABEL_21:

LABEL_5:
        v13 = dyld_program_sdk_at_least();
        detailLabel = self->_detailLabel;
        if (v13)
        {
          -[UILabel sizeThatFits:](detailLabel, "sizeThatFits:", a3, 1.79769313e308);
          v6 = v15;
          v7 = v16;
        }
        else
        {
          -[UILabel font](detailLabel, "font");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", v17, -[UILabel lineBreakMode](self->_detailLabel, "lineBreakMode"), a3, 3.40282347e38);
          v6 = v18;
          v7 = v19;

        }
        goto LABEL_8;
      }
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138412290;
      v35 = v30;
      _os_log_fault_impl(&dword_185066000, v28, OS_LOG_TYPE_FAULT, "Attempting to compute the size of a %@ detail text label with an undefined (0 pt) font! This will yield invalid results.", (uint8_t *)&v34, 0xCu);
    }
    else
    {
      if (v12 != 0.0)
        goto LABEL_5;
      v31 = _detailTextSizeForWidth____s_category;
      if (!_detailTextSizeForWidth____s_category)
      {
        v31 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v31, (unint64_t *)&_detailTextSizeForWidth____s_category);
      }
      v32 = *(NSObject **)(v31 + 8);
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        goto LABEL_5;
      v28 = v32;
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138412290;
      v35 = v30;
      _os_log_impl(&dword_185066000, v28, OS_LOG_TYPE_ERROR, "Attempting to compute the size of a %@ detail text label with an undefined (0 pt) font! This will yield invalid results.", (uint8_t *)&v34, 0xCu);
    }

    goto LABEL_21;
  }
LABEL_8:
  -[UITableViewHeaderFooterView _table](self, "_table");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    objc_msgSend(v20, "_scrollView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_currentScreenScale");
    v24 = v23;

  }
  else
  {
    -[UIView _currentScreenScale](self, "_currentScreenScale");
    v24 = v25;
  }
  v6 = ceil(v6 * v24) / v24;
  v7 = ceil(v7 * v24) / v24;

LABEL_12:
  v26 = v6;
  v27 = v7;
  result.height = v27;
  result.width = v26;
  return result;
}

- (void)_invalidateLabelBackgroundColor
{
  *(_DWORD *)&self->_headerFooterFlags |= 2u;
  if (self->_label)
    -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateDetailLabelBackgroundColor
{
  _QWORD v2[5];

  if (self->_detailLabel)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __64__UITableViewHeaderFooterView__updateDetailLabelBackgroundColor__block_invoke;
    v2[3] = &unk_1E16B1B28;
    v2[4] = self;
    +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v2);
  }
}

void __64__UITableViewHeaderFooterView__updateDetailLabelBackgroundColor__block_invoke(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  BOOL v4;
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  CGRect v20;
  CGRect v21;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 416);
  v4 = v3 > 0x10;
  v5 = (1 << v3) & 0x10006;
  if (v4 || v5 == 0)
    goto LABEL_7;
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "userInterfaceIdiom"))
  {

    v2 = *(_QWORD *)(a1 + 32);
LABEL_7:
    v8 = *(void **)(v2 + 504);
LABEL_8:
    +[UIColor clearColor](UIColor, "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v9);

    goto LABEL_9;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "backgroundColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "alphaComponent");
  v17 = v16;

  v18 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v18 + 504);
  if (v17 != 1.0)
    goto LABEL_8;
  objc_msgSend(*(id *)(v18 + 512), "backgroundColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v19);

LABEL_9:
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 504);
  objc_msgSend(*(id *)(v10 + 512), "backgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isPatternColor"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "frame");
    v13 = -CGRectGetMinX(v20);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "frame");
    v14 = -CGRectGetMinY(v21);
  }
  else
  {
    v13 = *MEMORY[0x1E0C9D820];
    v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  objc_msgSend(v11, "setPatternPhase:", v13, v14);

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 576) &= ~4u;
}

- (void)_updateDetailLabelBackgroundColorIfNeeded
{
  if ((*(_BYTE *)&self->_headerFooterFlags & 4) != 0)
  {
    if (self->_detailLabel)
      -[UITableViewHeaderFooterView _updateDetailLabelBackgroundColor](self, "_updateDetailLabelBackgroundColor");
  }
}

- (UILabel)detailTextLabel
{
  _UITableViewHeaderFooterViewLabel *detailLabel;
  _QWORD v5[5];

  detailLabel = self->_detailLabel;
  if (!detailLabel)
  {
    if ((*((_BYTE *)&self->_headerFooterFlags + 1) & 0x80) == 0)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __46__UITableViewHeaderFooterView_detailTextLabel__block_invoke;
      v5[3] = &unk_1E16B1B28;
      v5[4] = self;
      +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v5);
      -[UITableViewHeaderFooterView _invalidateDetailLabelBackgroundColor](self, "_invalidateDetailLabelBackgroundColor");
      return (UILabel *)self->_detailLabel;
    }
    detailLabel = 0;
  }
  return (UILabel *)detailLabel;
}

uint64_t __46__UITableViewHeaderFooterView_detailTextLabel__block_invoke(uint64_t a1)
{
  _UITableViewHeaderFooterViewLabel *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = objc_alloc_init(_UITableViewHeaderFooterViewLabel);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 504);
  *(_QWORD *)(v3 + 504) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setOpaque:", 0);
  +[UIColor clearColor](UIColor, "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setBackgroundColor:", v5);

  objc_msgSend(off_1E167A828, "systemFontOfSize:", 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setFont:", v6);

  v7 = *(_QWORD *)(a1 + 32);
  if ((*(_QWORD *)(v7 + 416) & 0x8000000000000000) == 0)
  {
    objc_msgSend((id)v7, "_setupLabelAppearance");
    v7 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v7 + 504), "setUserInteractionEnabled:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setEnabled:", 1);
}

- (NSString)text
{
  _UITableViewHeaderFooterViewLabel *label;
  __CFString *v3;

  label = self->_label;
  if (label)
  {
    -[UILabel text](label, "text");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1E16EDF20;
  }
  return (NSString *)v3;
}

- (void)setText:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  if (self->_label || objc_msgSend(v5, "length"))
  {
    v4 = -[UITableViewHeaderFooterView _label:](self, "_label:", 1);
    -[UILabel setText:](self->_label, "setText:", v5);
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    -[UIView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (CGRect)_detailLabelFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double maxTitleWidth;
  double v20;
  double v21;
  double v22;
  double v23;
  double MaxY;
  CGFloat v25;
  CGFloat v26;
  double v27;
  _BOOL4 v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  int v33;
  double v34;
  double v35;
  double v36;
  double Height;
  double v38;
  double v39;
  double MinY;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CGFloat rect;
  double rect_8;
  CGFloat rect_16;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect result;

  -[UITableViewHeaderFooterView _table](self, "_table");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewHeaderFooterView _labelFrame](self, "_labelFrame");
  v5 = v4;
  v7 = v6;
  rect_8 = v8;
  -[UITableViewHeaderFooterView _contentRect](self, "_contentRect");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  if (objc_msgSend(v3, "_isShowingIndex"))
  {
    objc_msgSend(v3, "_indexFrame");
    v14 = v14 - CGRectGetWidth(v52);
  }
  -[UITableViewHeaderFooterView _insetsToContentRect](self, "_insetsToContentRect");
  maxTitleWidth = v14 - v17 - v18;
  if (maxTitleWidth > self->_maxTitleWidth)
    maxTitleWidth = self->_maxTitleWidth;
  -[UITableViewHeaderFooterView _detailTextSizeForWidth:](self, "_detailTextSizeForWidth:", maxTitleWidth);
  v21 = v20;
  v23 = v22;
  v53.origin.x = v5;
  rect_16 = v7;
  v53.origin.y = v7;
  v53.size.width = v21;
  v53.size.height = v23;
  MaxY = CGRectGetMaxY(v53);
  rect = v10;
  v54.origin.x = v10;
  v25 = v12;
  v54.origin.y = v12;
  v54.size.width = v14;
  v54.size.height = v16;
  v26 = v16;
  if (MaxY > CGRectGetMaxY(v54))
  {
    v55.origin.x = rect;
    v55.origin.y = v25;
    v55.size.width = v14;
    v55.size.height = v16;
    v27 = CGRectGetMaxY(v55);
    v56.origin.x = v5;
    v56.origin.y = rect_16;
    v56.size.width = v21;
    v56.size.height = v23;
    v23 = fmax(v27 - CGRectGetMinY(v56), 0.0);
  }
  v28 = -[UIView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v29 = rect_8 - v21;
  if (!v28)
    v29 = -0.0;
  v30 = v5 + v29;
  if ((dyld_program_sdk_at_least() & 1) != 0)
  {
    v57.origin.x = rect;
    v57.origin.y = v25;
    v57.size.width = v14;
    v57.size.height = v26;
    v31 = CGRectGetMaxY(v57);
    -[UILabel font](self->_label, "font");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = dyld_program_sdk_at_least();
    v34 = 10.0;
    if (v33)
      v34 = 8.0;
    objc_msgSend(v32, "_scaledValueForValue:", v34);
    v36 = v35;
    v58.origin.x = v30;
    v58.origin.y = rect_16;
    v58.size.width = v21;
    v58.size.height = v23;
    Height = CGRectGetHeight(v58);
    -[UILabel _baselineOffsetFromBottom](self->_detailLabel, "_baselineOffsetFromBottom");
    v39 = v31 - (v36 + Height - v38);

  }
  else
  {
    v59.origin.x = v30;
    v59.origin.y = rect_16;
    v59.size.width = v21;
    v59.size.height = v23;
    v39 = CGRectGetMaxY(v59) + 10.0;
  }
  v60.origin.x = v30;
  v60.origin.y = v39;
  v60.size.width = v21;
  v60.size.height = v23;
  MinY = CGRectGetMinY(v60);
  if (v3)
  {
    objc_msgSend(v3, "_scrollView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "_currentScreenScale");
    v43 = UIPixelBoundaryOffset(0, MinY, v42);

  }
  else
  {
    -[UIView _currentScreenScale](self, "_currentScreenScale");
    v43 = UIPixelBoundaryOffset(0, MinY, v44);
  }

  v45 = v30;
  v46 = v43;
  v47 = v21;
  v48 = v23;
  result.size.height = v48;
  result.size.width = v47;
  result.origin.y = v46;
  result.origin.x = v45;
  return result;
}

- (void)_setBackgroundViewConfiguration:(id)a3
{
  $459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags;
  int v4;
  int v5;

  headerFooterFlags = self->_headerFooterFlags;
  v4 = (*(unsigned int *)&headerFooterFlags >> 13) & 1;
  if (a3)
    v4 = 1;
  if (v4)
    v5 = 0x2000;
  else
    v5 = 0;
  self->_headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(v5 | *(_DWORD *)&headerFooterFlags & 0xFFFFDFFF);
  -[UITableViewHeaderFooterView _applyBackgroundViewConfiguration:withState:](self, "_applyBackgroundViewConfiguration:withState:");
}

- (UIBackgroundConfiguration)backgroundConfiguration
{
  void *v2;
  void *v3;
  UIBackgroundConfiguration *v4;

  -[_UISystemBackgroundView configuration](self->_systemBackgroundView, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (_UIBackgroundViewConfiguration)_backgroundViewConfiguration
{
  void *v2;
  void *v3;
  _UIBackgroundViewConfiguration *v4;

  -[_UISystemBackgroundView configuration](self->_systemBackgroundView, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (void)setAutomaticallyUpdatesBackgroundConfiguration:(BOOL)automaticallyUpdatesBackgroundConfiguration
{
  id backgroundViewConfigurationProvider;
  $459C830AD401FFB60020A0C1FEE757B7 *p_headerFooterFlags;
  $459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags;

  if (automaticallyUpdatesBackgroundConfiguration)
  {
    backgroundViewConfigurationProvider = self->_backgroundViewConfigurationProvider;
    p_headerFooterFlags = &self->_headerFooterFlags;
    headerFooterFlags = self->_headerFooterFlags;
    if ((backgroundViewConfigurationProvider == 0) != ((*(_DWORD *)&headerFooterFlags & 0x20000) == 0))
      return;
    if (!backgroundViewConfigurationProvider)
    {
      *p_headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(*(_DWORD *)&headerFooterFlags | 0x20000);
      -[UITableViewHeaderFooterView setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
      return;
    }
  }
  else
  {
    p_headerFooterFlags = &self->_headerFooterFlags;
    headerFooterFlags = self->_headerFooterFlags;
    if ((*(_DWORD *)&headerFooterFlags & 0x20000) == 0)
      return;
  }
  *p_headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(*(_DWORD *)&headerFooterFlags & 0xFFFDFFFF);
}

- (BOOL)automaticallyUpdatesBackgroundConfiguration
{
  return (*((unsigned __int8 *)&self->_headerFooterFlags + 2) >> 1) & 1;
}

- (void)_setBackgroundViewConfigurationProvider:(id)a3
{
  $459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags;
  int v4;
  int v5;
  unsigned int v6;
  id v8;
  void *v9;
  id backgroundViewConfigurationProvider;

  headerFooterFlags = self->_headerFooterFlags;
  v4 = (*(unsigned int *)&headerFooterFlags >> 12) & 1;
  if (a3)
    v4 = 1;
  if (v4)
    v5 = 4096;
  else
    v5 = 0;
  v6 = v5 | *(_DWORD *)&headerFooterFlags & 0xFFFFEFFF;
  self->_headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)v6;
  if (self->_backgroundViewConfigurationProvider != a3)
  {
    if (a3)
      self->_headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(v6 & 0xFFFDFFFF);
    v8 = a3;
    v9 = (void *)objc_msgSend(v8, "copy");
    backgroundViewConfigurationProvider = self->_backgroundViewConfigurationProvider;
    self->_backgroundViewConfigurationProvider = v9;

    -[UITableViewHeaderFooterView setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }
}

- (id)_backgroundViewConfigurationProvider
{
  return _Block_copy(self->_backgroundViewConfigurationProvider);
}

- (void)_resetBackgroundViewConfiguration
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __64__UITableViewHeaderFooterView__resetBackgroundViewConfiguration__block_invoke;
  v2[3] = &unk_1E16B1B28;
  v2[4] = self;
  +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v2);
}

uint64_t __64__UITableViewHeaderFooterView__resetBackgroundViewConfiguration__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundConfiguration:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_setBackgroundViewConfigurationProvider:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_setBackgroundViewConfiguration:", 0);
}

- (void)setConfigurationUpdateHandler:(UITableViewHeaderFooterViewConfigurationUpdateHandler)configurationUpdateHandler
{
  void *v4;
  id v5;

  if (self->_configurationUpdateHandler != configurationUpdateHandler)
  {
    v4 = (void *)objc_msgSend(configurationUpdateHandler, "copy");
    v5 = self->_configurationUpdateHandler;
    self->_configurationUpdateHandler = v4;

    -[UITableViewHeaderFooterView setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
  }
}

- (void)_prepareForConfigurationStateUpdate
{
  _QWORD v3[5];

  if ((*((_BYTE *)&self->_headerFooterFlags + 1) & 0x40) != 0)
  {
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
    {
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __66__UITableViewHeaderFooterView__prepareForConfigurationStateUpdate__block_invoke;
      v3[3] = &unk_1E16B1B28;
      v3[4] = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v3);
    }
  }
}

uint64_t __66__UITableViewHeaderFooterView__prepareForConfigurationStateUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performConfigurationStateUpdate");
}

- (void)_executeConfigurationUpdate
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  char *v6;
  _BYTE v7[352];
  _BYTE __dst[352];
  _OWORD __src[22];

  if (a1)
  {
    v2 = (void *)_UISetCurrentFallbackEnvironment(a1);
    objc_msgSend(a1, "configurationState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    memset(__src, 0, sizeof(__src));
    _UIBeginTrackingTraitUsage(a1, 0, __src);
    objc_msgSend(a1, "_updateBackgroundViewConfigurationForState:", v3);
    objc_msgSend(a1, "_updateContentViewConfigurationForState:", v3);
    objc_msgSend(a1, "_updateConfigurationUsingState:", v3);
    objc_msgSend(a1, "_updateViewConfigurationsWithState:", objc_msgSend(a1, "_viewConfigurationState"));
    objc_msgSend(a1, "updateConfigurationUsingState:", v3);
    objc_msgSend(a1, "_bridgedUpdateConfigurationUsingState:", v3);
    objc_msgSend(a1, "configurationUpdateHandler");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
      (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, a1, v3);
    memcpy(v7, __src, sizeof(v7));
    v6 = (char *)GetTraitCollectionTSD() + 16;
    memcpy(__dst, v6, sizeof(__dst));
    memcpy(v6, v7, 0x160uLL);
    -[UIView _recordTraitUsage:insideMethod:withInvalidationAction:]((uint64_t *)a1, (uint64_t)&__dst[136], objc_msgSend(a1, "methodForSelector:", sel_updateConfigurationUsingState_), sel_setNeedsUpdateConfiguration);
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled", _UITraitUsageTrackingResultDestroy((uint64_t)__dst)))
    {
      objc_msgSend(a1, "_layoutSystemBackgroundView");
    }
    _UIRestorePreviousFallbackEnvironment(v2);

  }
}

- (void)_setupBackgroundView
{
  _UITableViewHeaderFooterViewBackground *v3;
  _UITableViewHeaderFooterViewBackground *v4;

  if (!self->_backgroundView && !self->_systemBackgroundView && !self->_backgroundViewConfigurationProvider)
  {
    v3 = [_UITableViewHeaderFooterViewBackground alloc];
    -[UITableViewHeaderFooterView _backgroundRect](self, "_backgroundRect");
    v4 = -[_UITableViewHeaderFooterViewBackground initWithFrame:](v3, "initWithFrame:");
    -[UITableViewHeaderFooterView setBackgroundView:](self, "setBackgroundView:", v4);

  }
}

- (void)_safeAreaInsetsDidChangeFromOldInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  double v8;
  double v9;
  objc_super v11;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[UIView safeAreaInsets](self, "safeAreaInsets");
  if (left != v9 || right != v8)
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  v11.receiver = self;
  v11.super_class = (Class)UITableViewHeaderFooterView;
  -[UIView _safeAreaInsetsDidChangeFromOldInsets:](&v11, sel__safeAreaInsetsDidChangeFromOldInsets_, top, left, bottom, right);
}

- (BOOL)_isFloating
{
  return (*(_BYTE *)&self->_headerFooterFlags >> 3) & 1;
}

- (BOOL)floating
{
  return (*(_BYTE *)&self->_headerFooterFlags >> 3) & 1;
}

- (void)setBackgroundColor:(id)a3
{
  unint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = setBackgroundColor____s_category;
  if (!setBackgroundColor____s_category)
  {
    v3 = __UILogCategoryGetNode("TableView", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v3, (unint64_t *)&setBackgroundColor____s_category);
  }
  v4 = *(NSObject **)(v3 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "Changing the background color of UITableViewHeaderFooterView is not supported. Use the background view configuration instead.", v5, 2u);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITableViewHeaderFooterView;
  -[UIView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  if (!_UITraitUsageTrackingEnabled() || (dyld_program_sdk_at_least() & 1) == 0)
    -[UITableViewHeaderFooterView setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

void __113__UITableViewHeaderFooterView_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = _UIInternalPreference_LabelDisableDefaultClipping_block_invoke___s_category_1;
  if (!_UIInternalPreference_LabelDisableDefaultClipping_block_invoke___s_category_1)
  {
    v2 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&_UIInternalPreference_LabelDisableDefaultClipping_block_invoke___s_category_1);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_ERROR, "Custom views and layout for UITableViewHeaderFooterView should be contained within the content view. Offending view: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)setNeedsUpdateConstraints
{
  void *v3;

  -[UIView setNeedsUpdateConstraints](self->_contentView, "setNeedsUpdateConstraints");
  -[UIView _setNeedsUpdateConstraints](self, "_setNeedsUpdateConstraints");
  -[UIView _layoutEngine](self, "_layoutEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else if ((*(_QWORD *)&self->super._viewFlags & 0x8000000000000000) == 0)
  {
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)a3
{
  _BOOL8 v3;
  unint64_t v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  UITableViewHeaderFooterView *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  if (!a3
    && -[UIView translatesAutoresizingMaskIntoConstraints](self, "translatesAutoresizingMaskIntoConstraints")
    && dyld_program_sdk_at_least())
  {
    v5 = setTranslatesAutoresizingMaskIntoConstraints____s_category_141;
    if (!setTranslatesAutoresizingMaskIntoConstraints____s_category_141)
    {
      v5 = __UILogCategoryGetNode("LayoutConstraints", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&setTranslatesAutoresizingMaskIntoConstraints____s_category_141);
    }
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = self;
      _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "Changing the translatesAutoresizingMaskIntoConstraints property of a UITableViewHeaderFooterView that is managed by a UITableView is not supported, and will result in incorrect self-sizing. View: %@", buf, 0xCu);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)UITableViewHeaderFooterView;
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](&v7, sel_setTranslatesAutoresizingMaskIntoConstraints_, v3);
}

- (void)setTintColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[UIView _interactionTintColor](self, "_interactionTintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)UITableViewHeaderFooterView;
  -[UIView setTintColor:](&v7, sel_setTintColor_, v4);

  -[UIView _interactionTintColor](self, "_interactionTintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 != v6)
  {
    -[UITableViewHeaderFooterView _updateBackgroundView](self, "_updateBackgroundView");
    -[UITableViewHeaderFooterView _updateDefaultBackgroundAppearance](self, "_updateDefaultBackgroundAppearance");
  }

}

- (void)_tableViewDidUpdateMarginWidth
{
  if (self->_leadingMarginWidth == -1.0)
  {
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    -[UIView layoutBelowIfNeeded](self, "layoutBelowIfNeeded");
  }
}

- (BOOL)_stripPadding
{
  return (*(_BYTE *)&self->_headerFooterFlags >> 4) & 1;
}

- (BOOL)_isTopHeader
{
  return (*(_BYTE *)&self->_headerFooterFlags >> 5) & 1;
}

- (BOOL)_isTransparentFocusRegion
{
  void *v3;
  BOOL v4;
  objc_super v6;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceIdiom") == 3)
  {
    v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UITableViewHeaderFooterView;
    v4 = -[UIView _isTransparentFocusRegion](&v6, sel__isTransparentFocusRegion);
  }

  return v4;
}

- (void)_willUpdateFocusInContext:(id)a3
{
  id v4;
  UITableViewHeaderFooterView *v5;
  UITableViewHeaderFooterView *v6;
  UITableViewHeaderFooterView *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UITableViewHeaderFooterView;
  -[UIView _willUpdateFocusInContext:](&v8, sel__willUpdateFocusInContext_, v4);
  objc_msgSend(v4, "previouslyFocusedView");
  v5 = (UITableViewHeaderFooterView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {

LABEL_5:
    -[UITableViewHeaderFooterView _prepareForConfigurationStateUpdate](self, "_prepareForConfigurationStateUpdate");
    goto LABEL_6;
  }
  v6 = v5;
  objc_msgSend(v4, "nextFocusedView");
  v7 = (UITableViewHeaderFooterView *)objc_claimAutoreleasedReturnValue();

  if (v7 == self)
    goto LABEL_5;
LABEL_6:

}

- (void)_didUpdateFocusInContext:(id)a3
{
  id v4;
  UITableViewHeaderFooterView *v5;
  UITableViewHeaderFooterView *v6;
  UITableViewHeaderFooterView *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UITableViewHeaderFooterView;
  -[UIView _didUpdateFocusInContext:](&v8, sel__didUpdateFocusInContext_, v4);
  objc_msgSend(v4, "previouslyFocusedView");
  v5 = (UITableViewHeaderFooterView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {

LABEL_5:
    -[UITableViewHeaderFooterView setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
    goto LABEL_6;
  }
  v6 = v5;
  objc_msgSend(v4, "nextFocusedView");
  v7 = (UITableViewHeaderFooterView *)objc_claimAutoreleasedReturnValue();

  if (v7 == self)
    goto LABEL_5;
LABEL_6:

}

- (void)setReuseIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (void)setTable:(id)a3
{
  objc_storeWeak((id *)&self->_table, a3);
}

- (double)maxTitleWidth
{
  return self->_maxTitleWidth;
}

- (UIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (void)setBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundImage, a3);
}

@end
