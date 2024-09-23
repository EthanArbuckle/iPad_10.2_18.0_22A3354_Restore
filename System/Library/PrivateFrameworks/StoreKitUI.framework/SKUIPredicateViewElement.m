@implementation SKUIPredicateViewElement

- (NSPredicate)entityValuePredicate
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIPredicateViewElement entityValuePredicate].cold.1();
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  return (NSPredicate *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)entityValuePredicate
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIPredicateViewElement entityValuePredicate]";
}

@end
