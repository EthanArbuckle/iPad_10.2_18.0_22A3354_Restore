@implementation SLAttributionView

- (SLAttributionView)initWithHighlight:(id)a3
{
  id v5;
  SLAttributionView *v6;
  SLAttributionView *v7;
  NSObject *v8;
  UIColor *preferredBackgroundColor;
  _BOOL8 v10;
  SLHighlightPillView *v11;
  void *v12;
  double v13;
  SLHighlightPillView *v14;
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
  objc_super v26;

  v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SLAttributionView;
  v6 = -[SLAttributionView initWithFrame:](&v26, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    -[SLAttributionView _setHostsLayoutEngine:](v6, "_setHostsLayoutEngine:", 1);
    SLFrameworkLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[SLAttributionView initWithHighlight:].cold.1((uint64_t)v7, v5, v8);

    objc_storeStrong((id *)&v7->_highlight, a3);
    v7->_isCollaboration = 0;
    objc_opt_class();
    v7->_isCollaboration = objc_opt_isKindOfClass() & 1;
    v7->_preferredBackgroundStyle = -1;
    v7->_preferredAlignment = -1;
    preferredBackgroundColor = v7->_preferredBackgroundColor;
    v7->_preferredBackgroundColor = 0;

    v10 = -[SLAttributionView _backgroundStyleEnforcingPolicies](v7, "_backgroundStyleEnforcingPolicies") == 1;
    v11 = [SLHighlightPillView alloc];
    -[SLAttributionView highlight](v7, "highlight");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLAttributionView frame](v7, "frame");
    v14 = -[SLHighlightPillView initWithHighlight:maxWidth:variant:shouldDrawBlur:](v11, "initWithHighlight:maxWidth:variant:shouldDrawBlur:", v12, -[SLAttributionView variant](v7, "variant"), v10, v13);
    -[SLAttributionView setPillView:](v7, "setPillView:", v14);

    -[SLAttributionView _backgroundColorEnforcingPolicies](v7, "_backgroundColorEnforcingPolicies");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLAttributionView pillView](v7, "pillView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPreferredBackgroundColor:", v15);

    -[SLAttributionView pillView](v7, "pillView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLAttributionView addSubview:](v7, "addSubview:", v17);

    -[SLAttributionView pillView](v7, "pillView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDelegate:", v7);

    -[SLAttributionView pillView](v7, "pillView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "centerYAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLAttributionView centerYAnchor](v7, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLAttributionView setPillCenterYConstraint:](v7, "setPillCenterYConstraint:", v22);

    -[SLAttributionView pillCenterYConstraint](v7, "pillCenterYConstraint");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setIdentifier:", CFSTR("SLAttributionViewInternal-PillCenterY"));

    -[SLAttributionView pillView](v7, "pillView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAccessibilityIdentifier:", CFSTR("AttributionView"));

  }
  return v7;
}

- (void)setBlurEffectGroupName:(id)a3
{
  id *p_blurEffectGroupName;
  id v6;
  void *v7;
  id v8;

  p_blurEffectGroupName = (id *)&self->_blurEffectGroupName;
  v8 = a3;
  if ((objc_msgSend(*p_blurEffectGroupName, "isEqualToString:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_blurEffectGroupName, a3);
    v6 = *p_blurEffectGroupName;
    -[SLAttributionView pillView](self, "pillView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBlurEffectGroupName:", v6);

  }
}

- (BOOL)_crossPlatformIsRTL
{
  void *v2;
  BOOL v3;

  -[SLAttributionView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "layoutDirection") == 1;

  return v3;
}

- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (!a3)
    -[SLAttributionView _setHostsLayoutEngine:](self, "_setHostsLayoutEngine:", 0);
  v5.receiver = self;
  v5.super_class = (Class)SLAttributionView;
  -[SLAttributionView setTranslatesAutoresizingMaskIntoConstraints:](&v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, v3);
}

- (void)layoutSubviews
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_1(&dword_199EFF000, v0, v1, "[SLAttributionView: %p] Frame width is currently 0.0, we will not layout remote content with this width.", v2);
  OUTLINED_FUNCTION_5();
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  NSObject *v13;
  double v14;
  objc_super v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SLAttributionView frame](self, "frame");
  v18.origin.x = v8;
  v18.origin.y = v9;
  v18.size.width = v10;
  v18.size.height = v11;
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  if (!CGRectEqualToRect(v16, v18) && width <= 0.0)
  {
    -[SLAttributionView frame](self, "frame");
    SL_NSStringFromRect(v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SLFrameworkLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[SLAttributionView setFrame:].cold.1();

  }
  -[SLAttributionView _minHeightForCurrentStyle](self, "_minHeightForCurrentStyle");
  v15.receiver = self;
  v15.super_class = (Class)SLAttributionView;
  -[SLAttributionView setFrame:](&v15, sel_setFrame_, x, y, width, fmax(v14, height));
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  width = a3.width;
  -[SLAttributionView pillView](self, "pillView", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expectedHeightForMaxWidth:", width);
  v6 = v5;

  v7 = width;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[SLAttributionView frame](self, "frame");
  v4 = v3;
  -[SLAttributionView _minHeightForCurrentStyle](self, "_minHeightForCurrentStyle");
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)prepareLayout
{
  double v3;

  -[SLAttributionView frame](self, "frame");
  -[SLAttributionView prepareLayoutWithMaxWidth:](self, "prepareLayoutWithMaxWidth:", v3);
}

- (void)prepareLayoutWithMaxWidth:(double)a3
{
  double v5;
  void *v6;
  double v7;
  NSObject *v8;
  void *v9;
  double v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;

  if (self->_enablesMarquee)
    v5 = 10000.0;
  else
    v5 = a3;
  if (-[SLAttributionView usesBannerLayout](self, "usesBannerLayout"))
  {
    -[SLAttributionView closeButton](self, "closeButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v5 = fmax(v5 - v7 + -8.0, 0.0);

    SLFrameworkLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[SLAttributionView prepareLayoutWithMaxWidth:].cold.3();

  }
  if (a3 <= 0.0)
  {
    SLFrameworkLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[SLAttributionView prepareLayoutWithMaxWidth:].cold.2(v15);

  }
  else
  {
    -[SLAttributionView pillView](self, "pillView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "maxWidth");
    v11 = SL_CGFloatApproximatelyEqualToFloat(v5, v10);

    if (!v11)
    {
      SLFrameworkLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[SLAttributionView prepareLayoutWithMaxWidth:].cold.1();

      -[SLAttributionView pillView](self, "pillView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setMaxWidth:", v5);

      -[SLAttributionView pillView](self, "pillView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setRemoteRenderingEnabled:", 1);

      -[SLAttributionView _crossPlatformNeedsUpdateConstraints](self, "_crossPlatformNeedsUpdateConstraints");
      -[SLAttributionView _sanitizeFrameIfNecessaryForTAMIC](self, "_sanitizeFrameIfNecessaryForTAMIC");
    }
  }
}

- (void)feedbackForCloseButtonHit
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "[SLAttributionView %p]:  _closeButtonTapped", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __46__SLAttributionView_feedbackForCloseButtonHit__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SLFrameworkLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 134218242;
      v11 = v8;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_199EFF000, v7, OS_LOG_TYPE_INFO, "[SLHighlightPillView %p] _hideMenuItemSelected: Sent hide feedback for highlight: %@. Posting highlights deleted notification.", (uint8_t *)&v10, 0x16u);

    }
    notify_post("com.apple.spotlight.SyndicatedContentDeleted");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __46__SLAttributionView_feedbackForCloseButtonHit__block_invoke_cold_1(a1, (uint64_t)v5, v7);

  }
}

- (void)_sanitizeFrameIfNecessaryForTAMIC
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGRect v22;
  CGRect v23;

  if (-[SLAttributionView translatesAutoresizingMaskIntoConstraints](self, "translatesAutoresizingMaskIntoConstraints"))
  {
    -[SLAttributionView pillView](self, "pillView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "maxWidth");
    v5 = v4;

    if (v5 != 0.0)
    {
      if (self->_enablesMarquee)
      {
        -[SLAttributionView maxWidthForClippingMarquee](self, "maxWidthForClippingMarquee");
        v7 = v6;
      }
      else
      {
        -[SLAttributionView pillView](self, "pillView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "maxWidth");
        v7 = v9;

      }
      -[SLAttributionView _minHeightForCurrentStyle](self, "_minHeightForCurrentStyle");
      v11 = v10;
      -[SLAttributionView frame](self, "frame");
      v13 = fmax(v11, v12);
      -[SLAttributionView frame](self, "frame");
      v15 = v14;
      v17 = v16;
      -[SLAttributionView frame](self, "frame");
      v23.origin.x = v18;
      v23.origin.y = v19;
      v23.size.width = v20;
      v23.size.height = v21;
      v22.origin.x = v15;
      v22.origin.y = v17;
      v22.size.width = v7;
      v22.size.height = v13;
      if (!CGRectEqualToRect(v22, v23))
        -[SLAttributionView setFrame:](self, "setFrame:", v15, v17, v7, v13);
    }
  }
}

- (void)updateAlignment:(int64_t)a3
{
  NSObject *v5;

  if (-[SLAttributionView preferredAlignment](self, "preferredAlignment") != a3)
  {
    SLFrameworkLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[SLAttributionView updateAlignment:].cold.1();

    -[SLAttributionView setPreferredAlignment:](self, "setPreferredAlignment:", a3);
    -[SLAttributionView _updateMarqueeTargetContentAlignment](self, "_updateMarqueeTargetContentAlignment");
    -[SLAttributionView _crossPlatformNeedsUpdateConstraints](self, "_crossPlatformNeedsUpdateConstraints");
  }
}

- (int64_t)_alignmentEnforcingPolicies
{
  if (-[SLAttributionView preferredAlignment](self, "preferredAlignment") == -1)
    return 0;
  else
    return -[SLAttributionView preferredAlignment](self, "preferredAlignment");
}

- (void)updateBackgroundStyle:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;

  if (-[SLAttributionView preferredBackgroundStyle](self, "preferredBackgroundStyle") != a3)
  {
    -[SLAttributionView setPreferredBackgroundStyle:](self, "setPreferredBackgroundStyle:", a3);
    SLFrameworkLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[SLAttributionView updateBackgroundStyle:].cold.1();

    -[SLAttributionView pillView](self, "pillView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = -[SLAttributionView _backgroundStyleEnforcingPolicies](self, "_backgroundStyleEnforcingPolicies") == 1;
      -[SLAttributionView pillView](self, "pillView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setShouldDrawBackgroundBlur:", v7);

      -[SLAttributionView _backgroundColorEnforcingPolicies](self, "_backgroundColorEnforcingPolicies");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLAttributionView pillView](self, "pillView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setPreferredBackgroundColor:", v9);

      -[SLAttributionView _crossPlatformNeedsLayout](self, "_crossPlatformNeedsLayout");
    }
  }
}

- (int64_t)_backgroundStyleEnforcingPolicies
{
  _BOOL4 v3;

  v3 = -[SLAttributionView preferredBackgroundStyle](self, "preferredBackgroundStyle") == 1;
  return v3 & ~-[SLAttributionView _hasiOSBannerVariant](self, "_hasiOSBannerVariant");
}

- (BOOL)_hasiOSBannerVariant
{
  return (-[SLAttributionView variant](self, "variant") & 0xFFFFFFFFFFFFFFFELL) == 6;
}

- (void)updateInterfaceStyle:(int64_t)a3
{
  uint64_t v3;

  if (a3 == 1)
    v3 = 2;
  else
    v3 = a3 == 0;
  -[SLAttributionView setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", v3);
}

- (void)updateBackgroundColor:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[SLAttributionView preferredBackgroundColor](self, "preferredBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    -[SLAttributionView setPreferredBackgroundColor:](self, "setPreferredBackgroundColor:", v4);
    SLFrameworkLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[SLAttributionView updateBackgroundColor:].cold.1();

    -[SLAttributionView pillView](self, "pillView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[SLAttributionView _backgroundColorEnforcingPolicies](self, "_backgroundColorEnforcingPolicies");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLAttributionView pillView](self, "pillView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setPreferredBackgroundColor:", v9);

      -[SLAttributionView _crossPlatformNeedsLayout](self, "_crossPlatformNeedsLayout");
    }
  }

}

- (id)_backgroundColorEnforcingPolicies
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SLAttributionView _backgroundStyleEnforcingPolicies](self, "_backgroundStyleEnforcingPolicies");
  if (-[SLAttributionView _hasiOSBannerVariant](self, "_hasiOSBannerVariant")
    || v4
    || (-[SLAttributionView preferredBackgroundColor](self, "preferredBackgroundColor"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    -[SLAttributionView preferredBackgroundColor](self, "preferredBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      -[SLAttributionView preferredBackgroundColor](self, "preferredBackgroundColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v3;
  }

  return v7;
}

- (void)setHideMenuItemTitle:(id)a3
{
  id v5;
  NSString **p_hideMenuItemTitle;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_hideMenuItemTitle = &self->_hideMenuItemTitle;
  if (!-[NSString isEqualToString:](self->_hideMenuItemTitle, "isEqualToString:", v5))
  {
    objc_storeStrong((id *)&self->_hideMenuItemTitle, a3);
    if (*p_hideMenuItemTitle)
    {
      v7 = *p_hideMenuItemTitle;
    }
    else
    {
      SLFrameworkBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("HIDE_CONTEXTMENU"), &stru_1E3797070, CFSTR("SocialLayer"));
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();

    }
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[SLAttributionView pillView](self, "pillView", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contextMenuItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v15, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("slHideMenuItem"));

          if (v17)
          {
            objc_msgSend(v15, "setTitle:", v7);
            goto LABEL_15;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_15:

  }
}

+ (void)presentTranscriptForAttributionIdentifier:(id)a3 presentingViewController:(id)a4
{
  +[SLAttributionView presentTranscriptForAttributionIdentifier:attachmentGUID:presentingViewController:](SLAttributionView, "presentTranscriptForAttributionIdentifier:attachmentGUID:presentingViewController:", a3, 0, a4);
}

+ (void)presentTranscriptForAttributionIdentifier:(id)a3 attachmentGUID:(id)a4 presentingViewController:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  SLTranscriptController *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  SLFrameworkLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v12 = 138412546;
    v13 = v7;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_199EFF000, v10, OS_LOG_TYPE_INFO, "Trying to present Messages Transcript for identifier : %@ and view controller: %@", (uint8_t *)&v12, 0x16u);
  }

  if (v9)
  {
    v11 = objc_alloc_init(SLTranscriptController);
    -[SLTranscriptController presentTranscriptForMessageGUID:attachmentGUID:presentingViewController:](v11, "presentTranscriptForMessageGUID:attachmentGUID:presentingViewController:", v7, v8, v9);
  }
  else
  {
    SLFrameworkLogHandle();
    v11 = (SLTranscriptController *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super.super.super, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_199EFF000, &v11->super.super.super, OS_LOG_TYPE_INFO, "Presenting view controller is nil. Returning.", (uint8_t *)&v12, 2u);
    }
  }

}

- (void)useBannerLayout
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;

  if (!-[SLAttributionView usesBannerLayout](self, "usesBannerLayout"))
  {
    -[SLAttributionView setUsesBannerLayout:](self, "setUsesBannerLayout:", 1);
    v3 = -[SLAttributionView _backgroundStyleEnforcingPolicies](self, "_backgroundStyleEnforcingPolicies") == 1;
    -[SLAttributionView pillView](self, "pillView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShouldDrawBackgroundBlur:", v3);

    -[SLAttributionView _backgroundColorEnforcingPolicies](self, "_backgroundColorEnforcingPolicies");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLAttributionView pillView](self, "pillView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPreferredBackgroundColor:", v5);

    if (!self->_closeButton)
      -[SLAttributionView loadCloseButton](self, "loadCloseButton");
    -[SLAttributionView _crossPlatformNeedsLayout](self, "_crossPlatformNeedsLayout");
  }
}

- (id)contextMenuItems
{
  void *v2;
  void *v3;

  -[SLAttributionView pillView](self, "pillView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contextMenuItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)excludeContextMenuItemsWithIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  if (!objc_msgSend(v4, "count"))
  {
    SLFrameworkLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SLAttributionView excludeContextMenuItemsWithIdentifiers:].cold.1();

  }
  -[SLAttributionView pillView](self, "pillView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "excludeContextMenuItemsWithIdentifiers:", v4);

}

- (unint64_t)variant
{
  unint64_t result;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  if (-[SLAttributionView usesBannerLayout](self, "usesBannerLayout"))
  {
    if (-[SLAttributionView isCollaboration](self, "isCollaboration"))
      return 7;
    else
      return 6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    LODWORD(result) = -[SLAttributionView isCollaboration](self, "isCollaboration");
    v6 = 2;
    if ((_DWORD)result)
      v6 = 3;
    if (v5 == 5)
      return v6;
    else
      return result;
  }
}

- (double)_minHeightForCurrentStyle
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[SLAttributionView pillView](self, "pillView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLAttributionView pillView](self, "pillView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maxWidth");
  objc_msgSend(v3, "expectedHeightForMaxWidth:");
  v6 = v5;

  return v6;
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  int64_t v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  const __CFString *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  BOOL v76;
  void *v77;
  void *v78;
  char v79;
  void *v80;
  void *v81;
  void *v82;
  NSLayoutConstraint *v83;
  NSLayoutConstraint *closeButtonVerticalConstraint;
  void *v85;
  _BOOL4 v86;
  void *v87;
  objc_super v88;

  v88.receiver = self;
  v88.super_class = (Class)SLAttributionView;
  -[SLAttributionView updateConstraints](&v88, sel_updateConstraints);
  -[SLAttributionView pillView](self, "pillView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[SLAttributionView translatesAutoresizingMaskIntoConstraints](self, "translatesAutoresizingMaskIntoConstraints") & 1) == 0)
  {
    -[SLAttributionView pillView](self, "pillView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if (self->_enablesMarquee)
        v6 = CFSTR("SLAttrConstraintWidthAnchorEqualToMarqueeID");
      else
        v6 = CFSTR("SLAttrConstraintWidthAnchorEqualToPillID");
      v7 = v6;
      -[SLAttributionView heightAnchor](self, "heightAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = v3;
      objc_msgSend(v3, "heightAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "constraintGreaterThanOrEqualToAnchor:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "setIdentifier:", v7);
      -[SLAttributionView ourHeightConstraint](self, "ourHeightConstraint");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[SLAttributionView ourHeightConstraint](self, "ourHeightConstraint");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqualToString:", v14);

        if ((v15 & 1) != 0)
          goto LABEL_10;
        -[SLAttributionView ourHeightConstraint](self, "ourHeightConstraint");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "addObject:", v16);

      }
      -[SLAttributionView setOurHeightConstraint:](self, "setOurHeightConstraint:", v10);
      -[SLAttributionView ourHeightConstraint](self, "ourHeightConstraint");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v17);

LABEL_10:
      -[SLAttributionView widthAnchor](self, "widthAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v85;
      objc_msgSend(v85, "widthAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintGreaterThanOrEqualToAnchor:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "setIdentifier:", v7);
      -[SLAttributionView ourWidthConstraint](self, "ourWidthConstraint");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        -[SLAttributionView ourWidthConstraint](self, "ourWidthConstraint");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqualToString:", v24);

        v3 = v85;
        if ((v25 & 1) != 0)
        {
LABEL_14:

          goto LABEL_21;
        }
        -[SLAttributionView ourWidthConstraint](self, "ourWidthConstraint");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "addObject:", v26);

      }
      -[SLAttributionView setOurWidthConstraint:](self, "setOurWidthConstraint:", v20);
      -[SLAttributionView ourWidthConstraint](self, "ourWidthConstraint");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v27);

      goto LABEL_14;
    }
  }
  -[SLAttributionView ourHeightConstraint](self, "ourHeightConstraint");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[SLAttributionView ourHeightConstraint](self, "ourHeightConstraint");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "isActive");

    if (v31)
    {
      -[SLAttributionView ourHeightConstraint](self, "ourHeightConstraint");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "addObject:", v32);

      -[SLAttributionView setOurHeightConstraint:](self, "setOurHeightConstraint:", 0);
    }
  }
  -[SLAttributionView ourWidthConstraint](self, "ourWidthConstraint");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[SLAttributionView ourWidthConstraint](self, "ourWidthConstraint");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "isActive");

    if (v36)
    {
      -[SLAttributionView ourWidthConstraint](self, "ourWidthConstraint");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "addObject:", v37);

      -[SLAttributionView setOurWidthConstraint:](self, "setOurWidthConstraint:", 0);
    }
  }
LABEL_21:
  v38 = -[SLAttributionView _alignmentEnforcingPolicies](self, "_alignmentEnforcingPolicies");
  if (self->_closeButton)
    v39 = -[SLAttributionView usesBannerLayout](self, "usesBannerLayout");
  else
    v39 = 0;
  v86 = v39;
  if (v38 == 2)
  {
    if (v39)
    {
      -[SLAttributionView closeButton](self, "closeButton");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "trailingAnchor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLAttributionView trailingAnchor](self, "trailingAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "constraintEqualToAnchor:", v48);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "trailingAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLAttributionView closeButton](self, "closeButton");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "leadingAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "constraintEqualToAnchor:constant:", v51, -8.0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v3, "trailingAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLAttributionView trailingAnchor](self, "trailingAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "constraintEqualToAnchor:", v50);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 0;
    }

    v61 = CFSTR("SLAttributionViewClient-PillTrailing");
LABEL_39:
    objc_msgSend(v42, "setIdentifier:", v61);
    goto LABEL_40;
  }
  if (v38)
  {
    if (v39)
    {
      -[SLAttributionView closeButton](self, "closeButton");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "leadingAnchor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "trailingAnchor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "constraintEqualToAnchor:constant:", v54, 8.0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v52) = -[SLAttributionView _crossPlatformIsRTL](self, "_crossPlatformIsRTL");
      -[UIButton intrinsicContentSize](self->_closeButton, "intrinsicContentSize");
      v56 = v55 + 8.0;
      v57 = -0.5;
      if ((_DWORD)v52)
        v57 = 0.5;
      v58 = v56 * v57;
      objc_msgSend(v3, "centerXAnchor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLAttributionView centerXAnchor](self, "centerXAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "constraintEqualToAnchor:constant:", v60, v58);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v3, "centerXAnchor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLAttributionView centerXAnchor](self, "centerXAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "constraintEqualToAnchor:", v60);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 0;
    }

    v61 = CFSTR("SLAttributionViewClient-PillCenter");
    goto LABEL_39;
  }
  objc_msgSend(v3, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLAttributionView leadingAnchor](self, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v42, "setIdentifier:", CFSTR("SLAttributionViewClient-PillLeading"));
  if (v39)
  {
    -[UIButton leadingAnchor](self->_closeButton, "leadingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:constant:", v44, 8.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v45 = 0;
  }
LABEL_40:
  -[SLAttributionView pillHorizontalAlignmentConstraint](self, "pillHorizontalAlignmentConstraint");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v62)
  {
LABEL_43:
    -[SLAttributionView setPillHorizontalAlignmentConstraint:](self, "setPillHorizontalAlignmentConstraint:", v42);
    -[SLAttributionView pillHorizontalAlignmentConstraint](self, "pillHorizontalAlignmentConstraint");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v67);

    goto LABEL_44;
  }
  -[SLAttributionView pillHorizontalAlignmentConstraint](self, "pillHorizontalAlignmentConstraint");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "firstAttribute");
  v65 = objc_msgSend(v42, "firstAttribute");

  if (v64 != v65)
  {
    -[SLAttributionView pillHorizontalAlignmentConstraint](self, "pillHorizontalAlignmentConstraint");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "addObject:", v66);

    goto LABEL_43;
  }
LABEL_44:
  -[SLAttributionView closeButtonXDimensionConstraint](self, "closeButtonXDimensionConstraint");
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (v68 || !v45)
  {
    -[SLAttributionView closeButtonXDimensionConstraint](self, "closeButtonXDimensionConstraint");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v70 || !v45)
    {
      v69 = v45;
      goto LABEL_52;
    }
    -[SLAttributionView closeButtonXDimensionConstraint](self, "closeButtonXDimensionConstraint");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v71, "firstAttribute");
    v69 = v45;
    v73 = objc_msgSend(v45, "firstAttribute");
    v74 = v3;
    v75 = v73;

    v76 = v72 == v75;
    v3 = v74;
    if (v76)
      goto LABEL_53;
    -[SLAttributionView closeButtonXDimensionConstraint](self, "closeButtonXDimensionConstraint");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "addObject:", v77);

    v45 = v69;
  }
  v69 = v45;
  -[SLAttributionView setCloseButtonXDimensionConstraint:](self, "setCloseButtonXDimensionConstraint:", v45);
  -[SLAttributionView closeButtonXDimensionConstraint](self, "closeButtonXDimensionConstraint");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v70);
LABEL_52:

LABEL_53:
  -[SLAttributionView pillCenterYConstraint](self, "pillCenterYConstraint");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = objc_msgSend(v78, "isActive");

  if ((v79 & 1) == 0)
  {
    -[SLAttributionView pillCenterYConstraint](self, "pillCenterYConstraint");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v80);

  }
  if (v86 && !self->_closeButtonVerticalConstraint)
  {
    -[UIButton centerYAnchor](self->_closeButton, "centerYAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLAttributionView centerYAnchor](self, "centerYAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:", v82);
    v83 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    closeButtonVerticalConstraint = self->_closeButtonVerticalConstraint;
    self->_closeButtonVerticalConstraint = v83;

    objc_msgSend(v4, "addObject:", self->_closeButtonVerticalConstraint);
  }
  if (objc_msgSend(v87, "count"))
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", v87);
  if (objc_msgSend(v4, "count"))
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v4);

}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[SLAttributionView pillView](self, "pillView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "refreshContextMenuItems");

    v5 = obj;
  }

}

- (void)setSupplementalMenu:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqual:", self->_supplementalMenu) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_supplementalMenu, a3);
    -[SLAttributionView pillView](self, "pillView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "refreshContextMenuItems");

  }
}

- (id)additionalContextMenuItemsForHighlightPillView:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLAttributionView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SLAttributionView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contextMenuItemsForAttributionView:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "mutableCopy");

    v4 = (void *)v9;
  }
  -[SLAttributionView supplementalMenu](self, "supplementalMenu");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SLAttributionView supplementalMenu](self, "supplementalMenu");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v11);

  }
  v12 = objc_msgSend(v4, "count");
  SLFrameworkLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
  if (v12)
  {
    if (v14)
      -[SLAttributionView additionalContextMenuItemsForHighlightPillView:].cold.2(v4, v13);
  }
  else if (v14)
  {
    -[SLAttributionView additionalContextMenuItemsForHighlightPillView:].cold.1(v13);
  }

  return v4;
}

- (void)highlightPillViewDidLoadNewRemoteContent:(id)a3
{
  -[SLAttributionView _crossPlatformNeedsUpdateConstraints](self, "_crossPlatformNeedsUpdateConstraints", a3);
  -[SLAttributionView _sanitizeFrameIfNecessaryForTAMIC](self, "_sanitizeFrameIfNecessaryForTAMIC");
  -[SLAttributionView _updateMarqueeRequiredIfNecessary](self, "_updateMarqueeRequiredIfNecessary");
}

- (void)setEnablesMarquee:(BOOL)a3
{
  self->_enablesMarquee = 0;
}

- (void)setMarqueeRequired:(BOOL)a3
{
  self->_marqueeRequired = 0;
}

- (void)_updateMarqueeRequiredIfNecessary
{
  double v3;
  double v4;
  double v5;
  id v6;

  if (self->_enablesMarquee)
  {
    -[SLAttributionView bounds](self, "bounds");
    v4 = v3;
    -[SLAttributionView pillView](self, "pillView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    -[SLAttributionView setMarqueeRequired:](self, "setMarqueeRequired:", v4 < v5);

  }
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_1(&dword_199EFF000, v0, v1, "[SLAttributionView: %p] dealloc", v2);
  OUTLINED_FUNCTION_5();
}

- (SLAttributionViewDelegate)delegate
{
  return (SLAttributionViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)enablesMarquee
{
  return self->_enablesMarquee;
}

- (NSString)blurEffectGroupName
{
  return self->_blurEffectGroupName;
}

- (NSString)hideMenuItemTitle
{
  return self->_hideMenuItemTitle;
}

- (UIMenu)supplementalMenu
{
  return self->_supplementalMenu;
}

- (SLHighlight)highlight
{
  return self->_highlight;
}

- (void)setHighlight:(id)a3
{
  objc_storeStrong((id *)&self->_highlight, a3);
}

- (BOOL)isCollaboration
{
  return self->_isCollaboration;
}

- (void)setIsCollaboration:(BOOL)a3
{
  self->_isCollaboration = a3;
}

- (SLHighlightPillView)pillView
{
  return self->_pillView;
}

- (void)setPillView:(id)a3
{
  objc_storeStrong((id *)&self->_pillView, a3);
}

- (int64_t)preferredAlignment
{
  return self->_preferredAlignment;
}

- (void)setPreferredAlignment:(int64_t)a3
{
  self->_preferredAlignment = a3;
}

- (int64_t)preferredBackgroundStyle
{
  return self->_preferredBackgroundStyle;
}

- (void)setPreferredBackgroundStyle:(int64_t)a3
{
  self->_preferredBackgroundStyle = a3;
}

- (UIColor)preferredBackgroundColor
{
  return self->_preferredBackgroundColor;
}

- (void)setPreferredBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_preferredBackgroundColor, a3);
}

- (BOOL)usesBannerLayout
{
  return self->_usesBannerLayout;
}

- (void)setUsesBannerLayout:(BOOL)a3
{
  self->_usesBannerLayout = a3;
}

- (NSLayoutConstraint)ourWidthConstraint
{
  return self->_ourWidthConstraint;
}

- (void)setOurWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_ourWidthConstraint, a3);
}

- (NSLayoutConstraint)ourHeightConstraint
{
  return self->_ourHeightConstraint;
}

- (void)setOurHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_ourHeightConstraint, a3);
}

- (NSLayoutConstraint)pillCenterYConstraint
{
  return self->_pillCenterYConstraint;
}

- (void)setPillCenterYConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_pillCenterYConstraint, a3);
}

- (NSLayoutConstraint)pillHorizontalAlignmentConstraint
{
  return self->_pillHorizontalAlignmentConstraint;
}

- (void)setPillHorizontalAlignmentConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_pillHorizontalAlignmentConstraint, a3);
}

- (NSLayoutConstraint)closeButtonXDimensionConstraint
{
  return self->_closeButtonXDimensionConstraint;
}

- (void)setCloseButtonXDimensionConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_closeButtonXDimensionConstraint, a3);
}

- (NSLayoutConstraint)closeButtonVerticalConstraint
{
  return self->_closeButtonVerticalConstraint;
}

- (void)setCloseButtonVerticalConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_closeButtonVerticalConstraint, a3);
}

- (double)maxWidthForClippingMarquee
{
  return self->_maxWidthForClippingMarquee;
}

- (void)setMaxWidthForClippingMarquee:(double)a3
{
  self->_maxWidthForClippingMarquee = a3;
}

- (BOOL)marqueeRequired
{
  return self->_marqueeRequired;
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_closeButtonVerticalConstraint, 0);
  objc_storeStrong((id *)&self->_closeButtonXDimensionConstraint, 0);
  objc_storeStrong((id *)&self->_pillHorizontalAlignmentConstraint, 0);
  objc_storeStrong((id *)&self->_pillCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_ourHeightConstraint, 0);
  objc_storeStrong((id *)&self->_ourWidthConstraint, 0);
  objc_storeStrong((id *)&self->_preferredBackgroundColor, 0);
  objc_storeStrong((id *)&self->_pillView, 0);
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_storeStrong((id *)&self->_supplementalMenu, 0);
  objc_storeStrong((id *)&self->_hideMenuItemTitle, 0);
  objc_storeStrong((id *)&self->_blurEffectGroupName, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithHighlight:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218242;
  v8 = a1;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_0_3(&dword_199EFF000, a3, v6, "[SLAttributionView: %p] Initializing with with highlight: [%@].", (uint8_t *)&v7);

}

- (void)setFrame:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_199EFF000, v0, (uint64_t)v0, "[SLAttributionView: %p] frame width was set to 0.0. Content will not display and remote content will not be updated until a non-zero width is set. Previous frame was [%@]", v1);
  OUTLINED_FUNCTION_5();
}

- (void)prepareLayoutWithMaxWidth:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_3(&dword_199EFF000, v0, v1, "[SLAttributionView: %p] Received a new max width, updating the pill view. New width: [%f]", v2);
  OUTLINED_FUNCTION_5();
}

- (void)prepareLayoutWithMaxWidth:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_199EFF000, log, OS_LOG_TYPE_ERROR, "prepareLayoutWithMaxWidth: called with a frame with 0 width. This will cause the pill to not render.", v1, 2u);
}

- (void)prepareLayoutWithMaxWidth:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_3(&dword_199EFF000, v0, v1, "[SLAttributionView: %p] Updating the frame for the close button. New width: [%f]", v2);
  OUTLINED_FUNCTION_5();
}

void __46__SLAttributionView_feedbackForCloseButtonHit__block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218498;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  v11 = 2112;
  v12 = a2;
  _os_log_error_impl(&dword_199EFF000, a3, OS_LOG_TYPE_ERROR, "[SLHighlightPillView %p] _hideMenuItemSelected error sending hide feedback for highlight: [%@] error: [%@].", (uint8_t *)&v7, 0x20u);

}

- (void)updateAlignment:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3(&dword_199EFF000, v0, (uint64_t)v0, "[SLAttributionView: %p] Client updated the preferred alignment: %ld", v1);
  OUTLINED_FUNCTION_5();
}

- (void)updateBackgroundStyle:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3(&dword_199EFF000, v0, (uint64_t)v0, "[SLAttributionView: %p] Client updated the preferred background style to: %ld", v1);
  OUTLINED_FUNCTION_5();
}

- (void)updateBackgroundColor:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_199EFF000, v0, (uint64_t)v0, "[SLAttributionView: %p] Client updated the preferred background color to: %@", v1);
  OUTLINED_FUNCTION_5();
}

- (void)excludeContextMenuItemsWithIdentifiers:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_199EFF000, v0, v1, "Not excluding context menu items with identifiers: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)additionalContextMenuItemsForHighlightPillView:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_199EFF000, log, OS_LOG_TYPE_DEBUG, "No additional context menu items from delegate", v1, 2u);
}

- (void)additionalContextMenuItemsForHighlightPillView:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_1(&dword_199EFF000, a2, v3, "%lu additional context menu items from delegate", v4);
}

@end
