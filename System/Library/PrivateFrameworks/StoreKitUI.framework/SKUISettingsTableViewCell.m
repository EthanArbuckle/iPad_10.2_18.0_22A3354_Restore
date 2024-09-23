@implementation SKUISettingsTableViewCell

- (SKUISettingsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6;
  SKUISettingsTableViewCell *v7;
  SKUISettingsTableViewCell *v8;
  objc_super v10;

  v6 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUISettingsTableViewCell initWithStyle:reuseIdentifier:].cold.1();
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUISettingsTableViewCell;
  v7 = -[SKUISettingsTableViewCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, a3, v6);
  v8 = v7;
  if (v7)
    v7->_hasDisclosureChevron = 0;

  return v8;
}

- (void)displaySettingDescriptionView:(id)a3
{
  SKUISettingDescriptionView *v4;
  SKUISettingDescriptionView *settingDescriptionView;
  SKUISettingDescriptionView *v6;
  void *v7;

  v4 = (SKUISettingDescriptionView *)a3;
  self->_hasDisclosureChevron = -[SKUISettingDescriptionView hasDisclosureChevron](v4, "hasDisclosureChevron");
  settingDescriptionView = self->_settingDescriptionView;
  self->_settingDescriptionView = v4;
  v6 = v4;

  -[SKUISettingsTableViewCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_settingDescriptionView);

  -[SKUISettingsTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (SKUISettingDescriptionView)settingDescriptionView
{
  return self->_settingDescriptionView;
}

- (void)prepareForReuse
{
  SKUISettingDescriptionView *settingDescriptionView;

  -[SKUISettingDescriptionView removeFromSuperview](self->_settingDescriptionView, "removeFromSuperview");
  settingDescriptionView = self->_settingDescriptionView;
  self->_settingDescriptionView = 0;

  self->_hasDisclosureChevron = 0;
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return -[SKUISettingDescriptionView setImage:forArtworkRequest:context:](self->_settingDescriptionView, "setImage:forArtworkRequest:context:", a3, a4, a5);
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  void *v5;
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
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  UIImageView *v24;
  UIImageView *disclosureChevron;
  UIImageView *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  objc_super v38;
  CGRect v39;
  CGRect v40;

  v38.receiver = self;
  v38.super_class = (Class)SKUISettingsTableViewCell;
  -[SKUISettingsTableViewCell layoutSubviews](&v38, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceLayoutDirection");

  -[SKUISettingsTableViewCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[SKUISettingsTableViewCell layoutMargins](self, "layoutMargins");
  v16 = v14;
  v18 = v17;
  v19 = v15;
  v21 = v20;
  if (self->_hasDisclosureChevron)
  {
    v35 = v15;
    v36 = v14;
    SKUIImageWithResourceName(CFSTR("chevronRight"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "imageFlippedForRightToLeftLayoutDirection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!self->_disclosureChevron)
    {
      v24 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v23);
      disclosureChevron = self->_disclosureChevron;
      self->_disclosureChevron = v24;

      v26 = self->_disclosureChevron;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.674509804, 1.0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setTintColor:](v26, "setTintColor:", v27);

      -[SKUISettingsTableViewCell contentView](self, "contentView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addSubview:", self->_disclosureChevron);

    }
    v37 = v18;
    objc_msgSend(v23, "size");
    v30 = v29;
    v32 = v31;
    if (v4)
    {
      v33 = v21;
      v34 = v37;
    }
    else
    {
      v39.origin.x = v7;
      v39.origin.y = v9;
      v39.size.width = v11;
      v39.size.height = v13;
      v33 = v21;
      v34 = CGRectGetWidth(v39) - v30 - v21;
    }
    v40.origin.x = v7;
    v40.origin.y = v9;
    v40.size.width = v11;
    v40.size.height = v13;
    -[UIImageView setFrame:](self->_disclosureChevron, "setFrame:", v34, (CGRectGetHeight(v40) - v32) * 0.5, v30, v32);
    -[UIImageView setHidden:](self->_disclosureChevron, "setHidden:", 0);

    v19 = v35;
    v16 = v36;
    v21 = v33;
    v18 = v37;
  }
  else
  {
    -[UIImageView setHidden:](self->_disclosureChevron, "setHidden:", 1);
  }
  -[SKUISettingDescriptionView setLayoutMargins:](self->_settingDescriptionView, "setLayoutMargins:", v16, v18, v19, v21);
  -[SKUISettingDescriptionView setFrame:](self->_settingDescriptionView, "setFrame:", v7, v9, v11, v13);
}

- (void)setBackgroundColor:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKUISettingsTableViewCell;
  -[SKUISettingsTableViewCell setBackgroundColor:](&v3, sel_setBackgroundColor_, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingDescriptionView, 0);
  objc_storeStrong((id *)&self->_disclosureChevron, 0);
}

- (void)initWithStyle:reuseIdentifier:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUISettingsTableViewCell initWithStyle:reuseIdentifier:]";
}

@end
