@implementation SKUIJSONDataConsumer

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;

  v6 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIJSONDataConsumer objectForData:response:error:].cold.1();
  }
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v6, 0, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)objectForData:response:error:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIJSONDataConsumer objectForData:response:error:]";
}

@end
