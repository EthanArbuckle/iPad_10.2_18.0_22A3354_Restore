@implementation SKUISettingsTableHeaderFooterView

- (void)displaySettingsHeaderFooterDescriptionView:(id)a3
{
  SKUISettingsHeaderFooterDescriptionView *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUISettingsHeaderFooterDescriptionView *settingsHeaderFooterDescriptionView;
  SKUISettingsHeaderFooterDescriptionView *v14;
  void *v15;

  v4 = (SKUISettingsHeaderFooterDescriptionView *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUISettingsTableHeaderFooterView displaySettingsHeaderFooterDescriptionView:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  settingsHeaderFooterDescriptionView = self->_settingsHeaderFooterDescriptionView;
  self->_settingsHeaderFooterDescriptionView = v4;
  v14 = v4;

  -[SKUISettingsTableHeaderFooterView contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", self->_settingsHeaderFooterDescriptionView);

  -[SKUISettingsTableHeaderFooterView setNeedsLayout](self, "setNeedsLayout");
}

- (void)prepareForReuse
{
  OUTLINED_FUNCTION_1();
}

- (void)layoutSubviews
{
  OUTLINED_FUNCTION_1();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsHeaderFooterDescriptionView, 0);
}

- (void)displaySettingsHeaderFooterDescriptionView:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
