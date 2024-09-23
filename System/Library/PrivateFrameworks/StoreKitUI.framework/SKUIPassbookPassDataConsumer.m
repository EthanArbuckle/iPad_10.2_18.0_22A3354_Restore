@implementation SKUIPassbookPassDataConsumer

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v12;

  v6 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIPassbookPassDataConsumer objectForData:response:error:].cold.1();
  }
  v7 = SKUIPassKitCoreFramework();
  v12 = 0;
  v8 = (void *)objc_msgSend(objc_alloc((Class)SKUIWeakLinkedClassForString(CFSTR("PKPass"), v7)), "initWithData:error:", v6, &v12);

  v9 = v12;
  v10 = v9;
  if (a5 && !v8)
    *a5 = objc_retainAutorelease(v9);

  return v8;
}

- (void)objectForData:response:error:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIPassbookPassDataConsumer objectForData:response:error:]";
}

@end
