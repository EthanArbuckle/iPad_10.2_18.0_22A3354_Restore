@implementation SKUISettingsFieldViewElement

- (id)textInputViewElement
{
  void *v3;
  id v4;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUISettingsFieldViewElement textInputViewElement].cold.1();
  }
  -[SKUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 140);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (void)textInputViewElement
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUISettingsFieldViewElement textInputViewElement]";
}

@end
