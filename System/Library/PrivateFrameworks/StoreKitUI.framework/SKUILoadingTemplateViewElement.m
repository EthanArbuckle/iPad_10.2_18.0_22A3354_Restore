@implementation SKUILoadingTemplateViewElement

- (SKUIActivityIndicatorViewElement)activityIndicator
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUILoadingTemplateViewElement activityIndicator].cold.1();
  }
  -[SKUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 4);
  return (SKUIActivityIndicatorViewElement *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)activityIndicator
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUILoadingTemplateViewElement activityIndicator]";
}

@end
