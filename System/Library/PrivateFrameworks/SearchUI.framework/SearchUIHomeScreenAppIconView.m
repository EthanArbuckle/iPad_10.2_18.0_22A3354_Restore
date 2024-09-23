@implementation SearchUIHomeScreenAppIconView

- (unint64_t)imageLoadingBehavior
{
  return 2;
}

- (void)removePlaceholderAndSetShadowAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];

  v3 = a3;
  -[SearchUIHomeScreenAppIconView _iconImageView](self, "_iconImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBDA50], "enableShadow:forView:", 1, v5);
  -[SearchUIHomeScreenAppIconView placeholderView](self, "placeholderView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_continuousCornerRadius");
  objc_msgSend(v5, "_setContinuousCornerRadius:");

  -[SearchUIHomeScreenAppIconView effectiveScreenScale](self, "effectiveScreenScale");
  v8 = v7;
  objc_msgSend(v5, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContentsScale:", v8);

  objc_msgSend(v5, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setShadowPathIsBounds:", 1);

  objc_msgSend(v5, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAllowsGroupOpacity:", 0);

  v12 = (void *)MEMORY[0x1E0CB3940];
  -[SearchUIHomeScreenAppIconView rowModel](self, "rowModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifyingResult");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "text");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("Identifier:AppIconButton,AppName:%@"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUIHomeScreenAppIconView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v17);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __71__SearchUIHomeScreenAppIconView_removePlaceholderAndSetShadowAnimated___block_invoke;
  v18[3] = &unk_1EA1F62F0;
  v18[4] = self;
  objc_msgSend(MEMORY[0x1E0DBDA48], "performAnimatableChanges:animated:", v18, v3);

}

- (void)hidePlaceholder:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  v3 = a3;
  -[SearchUIHomeScreenAppIconView placeholderView](self, "placeholderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    v7 = 0.0;
  else
    v7 = 1.0;
  if (v3)
    v8 = 1.0;
  else
    v8 = 0.0;
  objc_msgSend(v5, "setAlpha:", v7);

  -[SearchUIHomeScreenAppIconView _iconImageView](self, "_iconImageView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", v8);

}

- (TLKProminenceView)placeholderView
{
  return (TLKProminenceView *)objc_getProperty(self, a2, 1288, 1);
}

- (void)updateWithRowModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  SearchUITemporaryInternalAppsIcon *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;

  v4 = a3;
  -[SearchUIHomeScreenAppIconView setRowModel:](self, "setRowModel:", v4);
  objc_msgSend(v4, "identifyingResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "command");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "cardSection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "cardSection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v7 = 0;
  }
  objc_msgSend(v5, "sectionBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIHomeScreenAppIconView setIsInSuggestionContext:](self, "setIsInSuggestionContext:", objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.searchd.zkw.apps")));

  objc_msgSend(v10, "applicationBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(v5, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      objc_msgSend(v7, "applicationBundleIdentifier");
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v17;

  }
  objc_msgSend(v5, "applicationBundleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "isEqualToString:", v19);

  +[SearchUIHomeScreenModel sharedInstance](SearchUIHomeScreenModel, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v20)
    objc_msgSend(v21, "clipIconForIdentifier:", v14);
  else
    objc_msgSend(v21, "appIconForApplicationBundleIdentifier:", v14);
  v23 = (SearchUITemporaryInternalAppsIcon *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    v23 = -[SearchUITemporaryInternalAppsIcon initWithResult:variant:]([SearchUITemporaryInternalAppsIcon alloc], "initWithResult:variant:", v5, -[SearchUIHomeScreenAppIconView variant](self, "variant"));
    SearchUIGeneralLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      -[SearchUIHomeScreenAppIconView updateWithRowModel:].cold.1(v5, (uint64_t)v14, v24);

  }
  -[SBIcon setDelegate:](v23, "setDelegate:", self);
  -[SearchUIHomeScreenAppIconView setIcon:](self, "setIcon:", v23);
  if (v23)
  {
    -[SearchUIHomeScreenAppIconView _iconImageView](self, "_iconImageView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "displayedImage");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {

    }
    else
    {
      -[SearchUIHomeScreenAppIconView icon](self, "icon");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v28 = objc_opt_isKindOfClass();

      if ((v28 & 1) == 0)
      {
        -[SearchUIHomeScreenAppIconView hidePlaceholder:](self, "hidePlaceholder:", 0);
        goto LABEL_24;
      }
    }
    -[SearchUIHomeScreenAppIconView removePlaceholderAndSetShadowAnimated:](self, "removePlaceholderAndSetShadowAnimated:", 0);
  }
LABEL_24:

}

- (void)setRowModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1280);
}

- (SearchUIHomeScreenAppIconView)init
{
  SearchUIHomeScreenAppIconView *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SearchUIHomeScreenAppIconView;
  v2 = -[SearchUIHomeScreenAppIconView init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DBD9D0], "viewWithProminence:", 3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIHomeScreenAppIconView setPlaceholderView:](v2, "setPlaceholderView:", v3);

    if (+[SearchUIUtilities isIpad](SearchUIUtilities, "isIpad"))
      v4 = 4;
    else
      v4 = 5;
    -[SearchUIHomeScreenAppIconView setVariant:](v2, "setVariant:", v4);
    -[SearchUIHomeScreenAppIconView placeholderView](v2, "placeholderView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIHomeScreenAppIconView insertSubview:atIndex:](v2, "insertSubview:atIndex:", v5, 0);

    -[SearchUIHomeScreenAppIconView setSharesIconTintColorWithSpringBoard:](v2, "setSharesIconTintColorWithSpringBoard:", 1);
    -[SearchUIHomeScreenAppIconView setUsesSceneUserInterfaceStyleForImage:](v2, "setUsesSceneUserInterfaceStyleForImage:", 1);
  }
  return v2;
}

- (void)setVariant:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  if (self->_variant != a3)
  {
    self->_variant = a3;
    objc_msgSend((id)objc_opt_class(), "cacheForVariant:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIHomeScreenAppIconView setIconImageCache:](self, "setIconImageCache:", v4);

    -[SearchUIHomeScreenAppIconView rowModel](self, "rowModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[SearchUIHomeScreenAppIconView rowModel](self, "rowModel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIHomeScreenAppIconView updateWithRowModel:](self, "updateWithRowModel:", v6);

    }
    -[SearchUIHomeScreenAppIconView iconImageCache](self, "iconImageCache");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "iconImageInfo");
    v8 = v7;
    -[SearchUIHomeScreenAppIconView placeholderView](self, "placeholderView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setContinuousCornerRadius:", v8);

  }
}

- (SearchUIRowModel)rowModel
{
  return (SearchUIRowModel *)objc_getProperty(self, a2, 1280, 1);
}

- (void)setPlaceholderView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1288);
}

+ (id)cacheForVariant:(unint64_t)a3
{
  void *v4;
  void *v5;
  SearchUIIconImageCache *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  if (cacheForVariant__onceToken != -1)
    dispatch_once(&cacheForVariant__onceToken, &__block_literal_global_22);
  v4 = (void *)cacheForVariant__iconCache;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (SearchUIIconImageCache *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    +[SearchUIAppIconImage sizeForVariant:](SearchUIAppIconImage, "sizeForVariant:", a3);
    v8 = v7;
    v10 = v9;
    objc_msgSend(MEMORY[0x1E0DBDA48], "appIconCornerRadiusRatio");
    v12 = v8 * v11;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scale");
    v15 = v14;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("SearchUIIconImageCache"), "stringByAppendingFormat:", CFSTR("-%@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = -[SBHIconImageCache initWithName:iconImageInfo:]([SearchUIIconImageCache alloc], "initWithName:iconImageInfo:", v17, v8, v10, v15, v12);
    v18 = (void *)cacheForVariant__iconCache;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v6, v19);

  }
  return v6;
}

- (BOOL)iconViewShouldIncludeUninstallShortcutItem:(id)a3
{
  return 1;
}

uint64_t __71__SearchUIHomeScreenAppIconView_removePlaceholderAndSetShadowAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hidePlaceholder:", 1);
}

- (BOOL)currentIconIsPlaceholder
{
  void *v2;
  void *v3;
  char v4;

  -[SearchUIHomeScreenAppIconView icon](self, "icon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leafIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", SearchUIPlaceholderIconIdentifier);

  return v4;
}

- (CGRect)highlightFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  +[SearchUIAutoLayout selectionBorderWidth](SearchUIAutoLayout, "selectionBorderWidth");
  v4 = v3;
  -[SearchUIHomeScreenAppIconView iconImageFrame](self, "iconImageFrame");
  v6 = v5 - v4;
  v8 = v7 - v4;
  v10 = v9 + v4 * 2.0;
  v12 = v11 + v4 * 2.0;
  result.size.height = v10;
  result.size.width = v12;
  result.origin.y = v8;
  result.origin.x = v6;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SearchUIHomeScreenAppIconView;
  -[SearchUIHomeScreenAppIconView layoutSubviews](&v12, sel_layoutSubviews);
  -[SearchUIHomeScreenAppIconView iconImageFrame](self, "iconImageFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SearchUIHomeScreenAppIconView placeholderView](self, "placeholderView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[SearchUIHomeScreenAppIconView setFocusHighlightFrame](self, "setFocusHighlightFrame");
}

- (void)setFocusHighlightFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[SearchUIHomeScreenAppIconView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsGroupBlending:", 0);

  -[SearchUIHomeScreenAppIconView highlightFrame](self, "highlightFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SearchUIHomeScreenAppIconView focusHighlightView](self, "focusHighlightView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[SearchUIHomeScreenAppIconView focusHighlightView](self, "focusHighlightView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "superview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAllowsGroupBlending:", 0);

}

- (TLKProminenceView)focusHighlightView
{
  return (TLKProminenceView *)objc_getProperty(self, a2, 1296, 1);
}

- (void)didMoveToWindow
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchUIHomeScreenAppIconView;
  -[SearchUIHomeScreenAppIconView didMoveToWindow](&v6, sel_didMoveToWindow);
  -[SearchUIHomeScreenAppIconView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
  -[SearchUIHomeScreenAppIconView window](self, "window");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[SearchUIHomeScreenAppIconView labelNeedsUpdateOnMovingToWindow](self, "labelNeedsUpdateOnMovingToWindow");

    if (v5)
      -[SearchUIHomeScreenAppIconView _updateLabel](self, "_updateLabel");
  }
}

- (void)_updateLabel
{
  void *v3;
  objc_super v4;

  -[SearchUIHomeScreenAppIconView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SearchUIHomeScreenAppIconView setLabelNeedsUpdateOnMovingToWindow:](self, "setLabelNeedsUpdateOnMovingToWindow:", 0);
    v4.receiver = self;
    v4.super_class = (Class)SearchUIHomeScreenAppIconView;
    -[SearchUIHomeScreenAppIconView _updateLabel](&v4, sel__updateLabel);
  }
  else
  {
    -[SearchUIHomeScreenAppIconView setLabelNeedsUpdateOnMovingToWindow:](self, "setLabelNeedsUpdateOnMovingToWindow:", 1);
  }
}

- (void)setLabelNeedsUpdateOnMovingToWindow:(BOOL)a3
{
  self->_labelNeedsUpdateOnMovingToWindow = a3;
}

- (BOOL)labelNeedsUpdateOnMovingToWindow
{
  return self->_labelNeedsUpdateOnMovingToWindow;
}

- (void)setAddRoundedKeyboardHighlight:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  if (self->_addRoundedKeyboardHighlight != a3)
  {
    v3 = a3;
    self->_addRoundedKeyboardHighlight = a3;
    -[SearchUIHomeScreenAppIconView focusHighlightView](self, "focusHighlightView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5 && v3)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBD9D0]), "initWithProminence:", +[SearchUIFocusStyleUtilities secondaryHaloProminence](SearchUIFocusStyleUtilities, "secondaryHaloProminence"));
      -[SearchUIHomeScreenAppIconView setFocusHighlightView:](self, "setFocusHighlightView:", v6);

      -[SearchUIHomeScreenAppIconView focusHighlightView](self, "focusHighlightView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIHomeScreenAppIconView insertSubview:atIndex:](self, "insertSubview:atIndex:", v7, 0);

    }
    -[SearchUIHomeScreenAppIconView focusHighlightCornerRadius](self, "focusHighlightCornerRadius");
    v9 = v8;
    -[SearchUIHomeScreenAppIconView focusHighlightView](self, "focusHighlightView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setContinuousCornerRadius:", v9);

    -[SearchUIHomeScreenAppIconView setFocusHighlightFrame](self, "setFocusHighlightFrame");
    -[SearchUIHomeScreenAppIconView focusHighlightView](self, "focusHighlightView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", !v3);

  }
}

- (void)setFeedbackDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_feedbackDelegate, a3);
}

- (void)setEngagementDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_engagementDelegate, a3);
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SearchUIHomeScreenAppIconView;
  v4 = a3;
  -[SearchUIHomeScreenAppIconView tlk_updateForAppearance:](&v15, sel_tlk_updateForAppearance_, v4);
  v5 = (void *)MEMORY[0x1E0DC4270];
  v6 = objc_msgSend(v4, "isDark", v15.receiver, v15.super_class);

  if (v6)
    v7 = 1;
  else
    v7 = 2;
  objc_msgSend(v5, "sharedInstanceForStyle:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0DC4270]);
  v10 = objc_msgSend(v8, "style");
  objc_msgSend(v8, "primaryColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "secondaryColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v9, "initWithStyle:primaryColor:secondaryColor:shadowColor:", v10, v11, v12, v13);

  -[SearchUIHomeScreenAppIconView setLegibilitySettings:](self, "setLegibilitySettings:", v14);
}

void __49__SearchUIHomeScreenAppIconView_cacheForVariant___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)cacheForVariant__iconCache;
  cacheForVariant__iconCache = v0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusHighlightView, 0);
  objc_storeStrong((id *)&self->_placeholderView, 0);
  objc_storeStrong((id *)&self->_rowModel, 0);
  objc_destroyWeak((id *)&self->_engagementDelegate);
  objc_destroyWeak((id *)&self->_feedbackDelegate);
}

- (double)focusHighlightCornerRadius
{
  double v3;
  double v4;
  double Width;
  double v6;
  CGRect v8;

  objc_msgSend(MEMORY[0x1E0DBDA48], "appIconCornerRadiusRatio");
  v4 = v3;
  -[SearchUIHomeScreenAppIconView iconImageFrame](self, "iconImageFrame");
  Width = CGRectGetWidth(v8);
  +[SearchUIAutoLayout selectionBorderWidth](SearchUIAutoLayout, "selectionBorderWidth");
  return v6 + v4 * Width;
}

- (id)keyCommands
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchUIHomeScreenAppIconView;
  -[SearchUIHomeScreenAppIconView keyCommands](&v6, sel_keyCommands);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0x20000, sel_launchWithShift);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWantsPriorityOverSystemBehavior:", 1);
  objc_msgSend(v2, "arrayByAddingObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)launchWithShift
{
  -[SearchUIHomeScreenAppIconView _launchWithModifierFlags:](self, "_launchWithModifierFlags:", 0x20000);
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (id)focusEffect
{
  return 0;
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  SearchUIHomeScreenAppIconView *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SearchUIHomeScreenAppIconView *v14;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SearchUIHomeScreenAppIconView;
  -[SearchUIHomeScreenAppIconView didUpdateFocusInContext:withAnimationCoordinator:](&v15, sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, a4);
  objc_msgSend(v6, "nextFocusedView");
  v7 = (SearchUIHomeScreenAppIconView *)objc_claimAutoreleasedReturnValue();
  if (v7 != self)
    goto LABEL_4;
  -[SearchUIHomeScreenAppIconView engagementDelegate](self, "engagementDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[SearchUIHomeScreenAppIconView rowModel](self, "rowModel");
    v7 = (SearchUIHomeScreenAppIconView *)objc_claimAutoreleasedReturnValue();
    -[SearchUIHomeScreenAppIconView engagementDelegate](self, "engagementDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIHomeScreenAppIconView identifyingResult](v7, "identifyingResult");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIHomeScreenAppIconView cardSection](v7, "cardSection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "didUpdateKeyboardFocusToResult:cardSection:", v11, v12);

LABEL_4:
  }
  objc_msgSend(MEMORY[0x1E0DC39F0], "mainSystem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNeedsRebuild");

  objc_msgSend(v6, "nextFocusedView");
  v14 = (SearchUIHomeScreenAppIconView *)objc_claimAutoreleasedReturnValue();
  -[SearchUIHomeScreenAppIconView setAddRoundedKeyboardHighlight:](self, "setAddRoundedKeyboardHighlight:", v14 == self);

}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchUIHomeScreenAppIconView;
  -[SearchUIHomeScreenAppIconView _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[SearchUIHomeScreenAppIconView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (void)iconImageViewDidChangeContents:(id)a3 forIcon:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SearchUIHomeScreenAppIconView;
  v6 = a4;
  -[SearchUIHomeScreenAppIconView iconImageViewDidChangeContents:forIcon:](&v12, sel_iconImageViewDidChangeContents_forIcon_, a3, v6);
  -[SearchUIHomeScreenAppIconView icon](self, "icon", v12.receiver, v12.super_class);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    v8 = -[SearchUIHomeScreenAppIconView currentIconIsPlaceholder](self, "currentIconIsPlaceholder");
    if (a3)
    {
      if (!v8)
      {
        -[SearchUIHomeScreenAppIconView placeholderView](self, "placeholderView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "alpha");
        v11 = v10;

        if (v11 == 1.0)
          -[SearchUIHomeScreenAppIconView removePlaceholderAndSetShadowAnimated:](self, "removePlaceholderAndSetShadowAnimated:", 1);
      }
    }
  }
}

- (void)iconViewWillBeginDrag:(id)a3 session:(id)a4
{
  id v4;

  -[SearchUIHomeScreenAppIconView didEngageWithTriggerEvent:destination:](self, "didEngageWithTriggerEvent:destination:", 18, 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("SearchUIWillInitiateDragHomeScreenIconNotification"), 0);

}

- (BOOL)shouldHideShortcutsForAppIcon:(id)a3
{
  return !+[SearchUIUtilities deviceIsAuthenticatedForView:](SearchUIUtilities, "deviceIsAuthenticatedForView:", self);
}

- (BOOL)iconViewCanBeginDrags:(id)a3
{
  return objc_msgSend(MEMORY[0x1E0DC3750], "isEnabledByDefault", a3);
}

- (BOOL)isTimedOutForIcon:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[SearchUIScreenTimeManager sharedInstance](SearchUIScreenTimeManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "getCachedObjectIfAvailableForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "BOOLValue");
  return (char)v4;
}

- (void)icon:(id)a3 launchFromLocation:(id)a4 context:(id)a5
{
  -[SearchUIHomeScreenAppIconView _launchWithModifierFlags:](self, "_launchWithModifierFlags:", 0, a4, a5);
}

- (void)_launchWithModifierFlags:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[SearchUIHomeScreenAppIconView engagementDelegate](self, "engagementDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    SearchUIGeneralLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[SearchUIHomeScreenAppIconView icon](self, "icon");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIHomeScreenAppIconView rowModel](self, "rowModel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifyingResult");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "applicationBundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v7;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_1DAD39000, v6, OS_LOG_TYPE_DEFAULT, "icon %@, rowModel:%@", (uint8_t *)&v15, 0x16u);

    }
    -[SearchUIHomeScreenAppIconView feedbackDelegate](self, "feedbackDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIUtilities environmentForDelegate:](SearchUIUtilities, "environmentForDelegate:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setModifierFlags:", a3);
    -[SearchUIHomeScreenAppIconView rowModel](self, "rowModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUICommandHandler handlerForRowModel:environment:](SearchUICommandHandler, "handlerForRowModel:environment:", v13, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "executeWithTriggerEvent:", 2);

  }
}

- (void)didEngageWithTriggerEvent:(unint64_t)a3 destination:(unint64_t)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[SearchUIHomeScreenAppIconView rowModel](self, "rowModel");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifyingResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIHomeScreenAppIconView feedbackDelegate](self, "feedbackDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v14, "queryId");
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C628]), "initWithResult:triggerEvent:destination:actionTarget:", v7, a3, a4, 0);
    objc_msgSend(v10, "setQueryId:", v9);
    objc_msgSend(v8, "didEngageResult:", v10);

  }
  -[SearchUIHomeScreenAppIconView rowModel](self, "rowModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cardSection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C220]), "initWithCardSection:destination:triggerEvent:actionCardType:", v12, 0, a3, 0);
    objc_msgSend(v13, "setQueryId:", v9);
    objc_msgSend(v8, "didEngageCardSection:", v13);

  }
}

- (void)iconTapped:(id)a3 modifierFlags:(int64_t)a4
{
  -[SearchUIHomeScreenAppIconView _launchWithModifierFlags:](self, "_launchWithModifierFlags:", a4);
}

- (void)iconTapped:(id)a3
{
  id v3;

  objc_msgSend(a3, "icon");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "launchFromLocation:context:", *MEMORY[0x1E0DAA9E0], 0);

}

- (void)launchIcon
{
  -[SearchUIHomeScreenAppIconView iconTapped:modifierFlags:](self, "iconTapped:modifierFlags:", self, 0);
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (forwardEvent(v6))
  {
    v8.receiver = self;
    v8.super_class = (Class)SearchUIHomeScreenAppIconView;
    -[SearchUIHomeScreenAppIconView pressesBegan:withEvent:](&v8, sel_pressesBegan_withEvent_, v6, v7);
  }

}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (forwardEvent(v6))
  {
    v11.receiver = self;
    v11.super_class = (Class)SearchUIHomeScreenAppIconView;
    -[SearchUIHomeScreenAppIconView pressesEnded:withEvent:](&v11, sel_pressesEnded_withEvent_, v6, v7);
  }
  else
  {
    -[SearchUIHomeScreenAppIconView feedbackDelegate](self, "feedbackDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[SearchUIHomeScreenAppIconView feedbackDelegate](self, "feedbackDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "performSelector:", sel_skipDown);

    }
  }

}

- (int64_t)_focusItemDeferralMode
{
  return 2;
}

- (id)focusGroupIdentifier
{
  return +[SearchUIUtilities focusGroupIdentifier](SearchUIUtilities, "focusGroupIdentifier");
}

- (BOOL)iconViewShouldBeginShortcutsPresentation:(id)a3
{
  _BOOL4 v4;

  v4 = +[SearchUIUtilities deviceIsAuthenticatedForView:](SearchUIUtilities, "deviceIsAuthenticatedForView:", self);
  if (v4)
    -[SearchUIHomeScreenAppIconView didEngageWithTriggerEvent:destination:](self, "didEngageWithTriggerEvent:destination:", 5, 1);
  return v4;
}

- (BOOL)iconView:(id)a3 shouldActivateApplicationShortcutItem:(id)a4 atIndex:(unint64_t)a5
{
  void *v6;

  objc_msgSend(a3, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = !-[SearchUIHomeScreenAppIconView isTimedOutForIcon:](self, "isTimedOutForIcon:", v6);

  return (char)self;
}

- (BOOL)shouldUseSecureWindowForShortcutsPresentationWithIconView:(id)a3
{
  return 1;
}

- (id)parallaxSettingsForShortcutsPresentationWithIconView:(id)a3
{
  return 0;
}

- (int64_t)iconView:(id)a3 draggingStartLocationWithProposedStartLocation:(int64_t)a4
{
  return 5;
}

- (id)iconView:(id)a3 applicationShortcutItemsWithProposedItems:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (void *)objc_msgSend(a4, "mutableCopy", a3);
  -[SearchUIHomeScreenAppIconView rowModel](self, "rowModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifyingResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "type") == 22)
  {
    -[SearchUIHomeScreenAppIconView isInSuggestionContext](self, "isInSuggestionContext");
  }
  else
  {
    v8 = objc_msgSend(v7, "type");
    if (-[SearchUIHomeScreenAppIconView isInSuggestionContext](self, "isInSuggestionContext") && v8 != 24)
    {
      v9 = (void *)objc_opt_class();
      objc_msgSend(v7, "title");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "text");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "neverSuggestAppShortcutItemWithLocalizedName:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v12);

    }
  }

  return v5;
}

- (BOOL)shouldActivateApplicationShortcutItem:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  int v8;
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
  BOOL v21;
  objc_super v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", SearchUINeverShowSuggestionShortcutItemType);

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = CFSTR("SearchUIHomeScreenAppIconViewBundleIdUserInfoKey");
    -[SearchUIHomeScreenAppIconView rowModel](self, "rowModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "applicationBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("SearchUIHomeScreenAppIconViewDidHideIconNotification"), 0, v12);

    v13 = (void *)objc_opt_new();
    objc_msgSend(v13, "setCategory:", 6);
    -[SearchUIHomeScreenAppIconView rowModel](self, "rowModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifyingResult");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setProactiveIdentifier:", v16);

    -[SearchUIHomeScreenAppIconView feedbackDelegate](self, "feedbackDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIUtilities environmentForDelegate:](SearchUIUtilities, "environmentForDelegate:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[SearchUIHomeScreenAppIconView rowModel](self, "rowModel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUICommandHandler handlerForCommand:rowModel:button:sectionModel:environment:](SearchUICommandHandler, "handlerForCommand:rowModel:button:sectionModel:environment:", v13, v19, 0, 0, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "executeWithTriggerEvent:", 17);
    v21 = 0;
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)SearchUIHomeScreenAppIconView;
    v21 = -[SearchUIHomeScreenAppIconView shouldActivateApplicationShortcutItem:atIndex:](&v23, sel_shouldActivateApplicationShortcutItem_atIndex_, v6, a4);
  }

  return v21;
}

+ (id)neverSuggestAppShortcutItemWithLocalizedName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)MEMORY[0x1E0CB3940];
  +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", CFSTR("HIDE_APP_SUGGESTION"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithValidatedFormat:validFormatSpecifiers:error:", v6, CFSTR("%@"), 0, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAADB8]), "initWithSystemImageName:", CFSTR("hand.raised"));
  objc_msgSend(v4, "setIcon:", v8);

  objc_msgSend(v4, "setLocalizedTitle:", v7);
  objc_msgSend(v4, "setType:", SearchUINeverShowSuggestionShortcutItemType);

  return v4;
}

- (SearchUIFeedbackDelegate)feedbackDelegate
{
  return (SearchUIFeedbackDelegate *)objc_loadWeakRetained((id *)&self->_feedbackDelegate);
}

- (SearchUIHomeScreenEngagementDelegate)engagementDelegate
{
  return (SearchUIHomeScreenEngagementDelegate *)objc_loadWeakRetained((id *)&self->_engagementDelegate);
}

- (unint64_t)variant
{
  return self->_variant;
}

- (BOOL)addRoundedKeyboardHighlight
{
  return self->_addRoundedKeyboardHighlight;
}

- (void)setFocusHighlightView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1296);
}

- (BOOL)isInSuggestionContext
{
  return self->_isInSuggestionContext;
}

- (void)setIsInSuggestionContext:(BOOL)a3
{
  self->_isInSuggestionContext = a3;
}

- (void)updateWithRowModel:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "applicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_fault_impl(&dword_1DAD39000, a3, OS_LOG_TYPE_FAULT, "No Springboard icon for app %@, identifier %@", (uint8_t *)&v6, 0x16u);

}

@end
