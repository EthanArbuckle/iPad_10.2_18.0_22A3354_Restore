@implementation SKUIURLResolverDataConsumer

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  SKUIURLResolverResponse *v17;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v8)
        -[SKUIURLResolverDataConsumer objectForData:response:error:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  SSVProtocolRedirectURLForResponse();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    v17 = 0;
  else
    v17 = -[SKUIURLResolverResponse initWithData:URLResponse:]([SKUIURLResolverResponse alloc], "initWithData:URLResponse:", v6, v7);

  return v17;
}

- (void)objectForData:(uint64_t)a3 response:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
