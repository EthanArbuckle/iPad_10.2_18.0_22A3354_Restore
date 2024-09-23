@implementation SKUIFamilySettingDescriptionView

+ (BOOL)prefetchResourcesForSettingDescription:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        +[SKUIFamilySettingDescriptionView prefetchResourcesForSettingDescription:reason:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  return 0;
}

+ (CGSize)preferredSizeForSettingDescription:(id)a3 context:(id)a4
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  CGSize result;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        +[SKUIFamilySettingDescriptionView preferredSizeForSettingDescription:context:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = *MEMORY[0x1E0C9D820];
  v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v13;
  result.width = v12;
  return result;
}

+ (void)requestLayoutForSettingDescription:(id)a3 width:(double)a4 context:(id)a5
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (v5)
      +[SKUIFamilySettingDescriptionView requestLayoutForSettingDescription:width:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 settingDescription:(id)a4 context:(id)a5
{
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        +[SKUIFamilySettingDescriptionView sizeThatFitsWidth:settingDescription:context:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_scaledValueForValue:", 48.0);
  v16 = v15;

  v17 = a3;
  v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)reloadWithSettingDescription:(id)a3 width:(double)a4 context:(id)a5
{
  id v7;
  uint64_t v8;

  objc_storeStrong((id *)&self->_layoutContext, a5);
  v7 = a3;
  v8 = objc_msgSend(v7, "viewState");

  -[SKUIFamilySettingDescriptionView _setViewState:](self, "_setViewState:", v8);
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (void)layoutSubviews
{
  int64_t viewState;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUIFamilySettingDescriptionView;
  -[SKUIFamilySettingDescriptionView layoutSubviews](&v4, sel_layoutSubviews);
  viewState = self->_viewState;
  if ((unint64_t)(viewState - 1) >= 3)
  {
    if (viewState == -1)
      -[SKUIFamilySettingDescriptionView _layoutWithActivityIndicator](self, "_layoutWithActivityIndicator");
  }
  else
  {
    -[SKUIFamilySettingDescriptionView _layoutWithLockup](self, "_layoutWithLockup");
  }
}

- (id)_attributedStringForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v4 = a3;
  -[SKUISettingsFamilyViewElement style](self->_viewElement, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIViewElementLayoutContext clientContext](self->_layoutContext, "clientContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "localizedStringForKey:inTable:", v4, CFSTR("Settings"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", v4, 0, CFSTR("Settings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "textShadow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIFamilySettingDescriptionView tintColor](self, "tintColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementPlainColorWithStyle(v5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  SKUIViewElementFontWithStyle(v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x1E0C99D80]);
  v14 = (void *)objc_msgSend(v13, "initWithObjectsAndKeys:", v11, *MEMORY[0x1E0DC1140], v12, *MEMORY[0x1E0DC1138], v9, *MEMORY[0x1E0DC1198], 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v8, v14);

  return v15;
}

- (id)_attributedStringForViewState
{
  int64_t viewState;
  const __CFString *v3;
  const __CFString *v4;

  viewState = self->_viewState;
  v3 = CFSTR("SETTINGS_FAMILY_SETUP");
  if (viewState == 2)
    v3 = CFSTR("SETTINGS_FAMILY_ADD");
  if (viewState == 3)
    v4 = CFSTR("SETTINGS_FAMILY_MANAGE");
  else
    v4 = v3;
  -[SKUIFamilySettingDescriptionView _attributedStringForKey:](self, "_attributedStringForKey:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_layoutWithActivityIndicator
{
  UIActivityIndicatorView *v3;
  UIActivityIndicatorView *activityIndicator;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  UIActivityIndicatorView *v9;
  double MidX;
  CGRect v11;
  CGRect v12;

  -[UIImageView setHidden:](self->_iconImageView, "setHidden:", 1);
  -[UILabel setHidden:](self->_labelView, "setHidden:", 1);
  -[UIActivityIndicatorView startAnimating](self->_activityIndicator, "startAnimating");
  if (!self->_activityIndicator)
  {
    v3 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 2);
    activityIndicator = self->_activityIndicator;
    self->_activityIndicator = v3;

    -[UIActivityIndicatorView setHidesWhenStopped:](self->_activityIndicator, "setHidesWhenStopped:", 1);
    -[UIActivityIndicatorView startAnimating](self->_activityIndicator, "startAnimating");
    -[SKUIFamilySettingDescriptionView addSubview:](self, "addSubview:", self->_activityIndicator);
  }
  -[SKUIFamilySettingDescriptionView bounds](self, "bounds");
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  v9 = self->_activityIndicator;
  MidX = CGRectGetMidX(v11);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  -[UIActivityIndicatorView setCenter:](v9, "setCenter:", MidX, CGRectGetMidY(v12));
}

- (void)_layoutWithLockup
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  UIImageView *iconImageView;
  id v15;
  void *v16;
  UIImageView *v17;
  UIImageView *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  UILabel *labelView;
  UILabel *v26;
  UILabel *v27;
  void *v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  id v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  -[UIImageView setHidden:](self->_iconImageView, "setHidden:", 0);
  -[UILabel setHidden:](self->_labelView, "setHidden:", 0);
  -[UIActivityIndicatorView stopAnimating](self->_activityIndicator, "stopAnimating");
  -[SKUISettingDescriptionView layoutMargins](self, "layoutMargins");
  v4 = v3;
  v36 = v5;
  -[SKUIFamilySettingDescriptionView bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  iconImageView = self->_iconImageView;
  if (!iconImageView)
  {
    v15 = objc_alloc(MEMORY[0x1E0DC3890]);
    SKUIImageWithResourceName(CFSTR("familySharing"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (UIImageView *)objc_msgSend(v15, "initWithImage:", v16);
    v18 = self->_iconImageView;
    self->_iconImageView = v17;

    -[SKUIFamilySettingDescriptionView addSubview:](self, "addSubview:", self->_iconImageView);
    iconImageView = self->_iconImageView;
  }
  -[UIImageView image](iconImageView, "image");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "size");
  v21 = v20;
  v23 = v22;

  v38.origin.x = v7;
  v38.origin.y = v9;
  v38.size.width = v11;
  v38.size.height = v13;
  v24 = floor((CGRectGetHeight(v38) - v23) * 0.5);
  -[UIImageView setFrame:](self->_iconImageView, "setFrame:", v4, v24, v21, v23);
  labelView = self->_labelView;
  if (!labelView)
  {
    v26 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    v27 = self->_labelView;
    self->_labelView = v26;

    -[UILabel _setTextColorFollowsTintColor:](self->_labelView, "_setTextColorFollowsTintColor:", 1);
    -[SKUIFamilySettingDescriptionView addSubview:](self, "addSubview:", self->_labelView);
    labelView = self->_labelView;
  }
  -[SKUIFamilySettingDescriptionView _attributedStringForViewState](self, "_attributedStringForViewState");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setAttributedText:](labelView, "setAttributedText:", v28);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v37 = (id)objc_claimAutoreleasedReturnValue();
  v39.origin.x = v4;
  v39.origin.y = v24;
  v39.size.width = v21;
  v39.size.height = v23;
  v29 = CGRectGetMaxX(v39) + 8.0;
  v40.origin.x = v7;
  v40.origin.y = v9;
  v40.size.width = v11;
  v40.size.height = v13;
  v30 = CGRectGetWidth(v40) - v29 - v36;
  -[UILabel sizeThatFits:](self->_labelView, "sizeThatFits:", v30, 1.79769313e308);
  v32 = v31;
  objc_msgSend(v37, "_scaledValueForValue:", 30.0);
  v34 = v33;
  -[UILabel _firstBaselineOffsetFromTop](self->_labelView, "_firstBaselineOffsetFromTop");
  -[UILabel setFrame:](self->_labelView, "setFrame:", v29, v34 - v35, v30, v32);

}

- (void)_setViewState:(int64_t)a3
{
  self->_viewState = a3;
  -[SKUIFamilySettingDescriptionView setNeedsLayout](self, "setNeedsLayout");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_layoutContext, 0);
  objc_storeStrong((id *)&self->_labelView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

+ (void)prefetchResourcesForSettingDescription:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)preferredSizeForSettingDescription:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)requestLayoutForSettingDescription:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 settingDescription:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
