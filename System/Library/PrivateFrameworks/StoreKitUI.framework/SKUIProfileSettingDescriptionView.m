@implementation SKUIProfileSettingDescriptionView

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
        +[SKUIProfileSettingDescriptionView prefetchResourcesForSettingDescription:reason:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
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
        +[SKUIProfileSettingDescriptionView preferredSizeForSettingDescription:context:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
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
      +[SKUIProfileSettingDescriptionView requestLayoutForSettingDescription:width:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
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
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGSize result;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        +[SKUIProfileSettingDescriptionView sizeThatFitsWidth:settingDescription:context:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  v14 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AA0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_scaledValueForValue:", 36.0);
  v19 = v18 + 0.0;
  objc_msgSend(v16, "_scaledValueForValue:", 16.0);
  v21 = v19 + v20;
  objc_msgSend(v17, "_scaledValueForValue:", 20.0);
  v23 = v21 + v22;

  v24 = a3;
  v25 = v23;
  result.height = v25;
  result.width = v24;
  return result;
}

- (BOOL)hasDisclosureChevron
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIProfileSettingDescriptionView hasDisclosureChevron].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  return self->_hasDisclosureChevron;
}

- (void)reloadWithSettingDescription:(id)a3 width:(double)a4 context:(id)a5
{
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  UILabel *v18;
  UILabel *handleLabel;
  UILabel *v20;
  void *v21;
  void *v22;
  void *v23;
  UILabel *v24;
  void *v25;
  UILabel *nameLabel;
  UILabel *v27;
  UILabel *v28;
  UILabel *v29;
  void *v30;
  void *v31;
  SKUIImageView *imageView;
  SKUIImageView *v33;
  SKUIImageView *v34;
  void *v35;

  v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        -[SKUIProfileSettingDescriptionView reloadWithSettingDescription:width:context:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  v15 = v6;
  objc_msgSend(v15, "viewElement");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstChildForElementType:", 29);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  self->_hasDisclosureChevron = v17 != 0;

  if (!self->_handleLabel)
  {
    v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    handleLabel = self->_handleLabel;
    self->_handleLabel = v18;

    v20 = self->_handleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setColor:](v20, "setColor:", v21);

    -[SKUIProfileSettingDescriptionView addSubview:](self, "addSubview:", self->_handleLabel);
  }
  objc_msgSend(v15, "handle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22 && objc_msgSend(v22, "length"))
  {
    -[UILabel setHidden:](self->_handleLabel, "setHidden:", 0);
    v24 = self->_handleLabel;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("@%@"), v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v24, "setText:", v25);

  }
  else
  {
    -[UILabel setHidden:](self->_handleLabel, "setHidden:", 1);
  }
  nameLabel = self->_nameLabel;
  if (!nameLabel)
  {
    v27 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    v28 = self->_nameLabel;
    self->_nameLabel = v27;

    v29 = self->_nameLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setColor:](v29, "setColor:", v30);

    -[SKUIProfileSettingDescriptionView addSubview:](self, "addSubview:", self->_nameLabel);
    nameLabel = self->_nameLabel;
  }
  objc_msgSend(v15, "name");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](nameLabel, "setText:", v31);

  imageView = self->_imageView;
  if (!imageView)
  {
    v33 = objc_alloc_init(SKUIImageView);
    v34 = self->_imageView;
    self->_imageView = v33;

    -[SKUIProfileSettingDescriptionView addSubview:](self, "addSubview:", self->_imageView);
    imageView = self->_imageView;
  }
  objc_msgSend(v15, "photo");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIImageView setImage:](imageView, "setImage:", v35);

}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
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
        -[SKUIProfileSettingDescriptionView setImage:forArtworkRequest:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  return 0;
}

- (void)layoutSubviews
{
  OUTLINED_FUNCTION_1();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_handleLabel, 0);
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

- (void)hasDisclosureChevron
{
  OUTLINED_FUNCTION_1();
}

- (void)reloadWithSettingDescription:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setImage:(uint64_t)a3 forArtworkRequest:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
