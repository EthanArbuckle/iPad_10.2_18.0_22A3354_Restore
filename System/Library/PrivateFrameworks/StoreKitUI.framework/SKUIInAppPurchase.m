@implementation SKUIInAppPurchase

- (SKUIInAppPurchase)initWithInAppPurchaseDictionary:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUIInAppPurchase *v13;
  void *v14;
  uint64_t v15;
  NSString *formattedPrice;
  void *v17;
  uint64_t v18;
  NSString *name;
  objc_super v21;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIInAppPurchase initWithInAppPurchaseDictionary:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)SKUIInAppPurchase;
  v13 = -[SKUIInAppPurchase init](&v21, sel_init);
  if (v13)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("price"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = objc_msgSend(v14, "copy");
      formattedPrice = v13->_formattedPrice;
      v13->_formattedPrice = (NSString *)v15;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("name"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = objc_msgSend(v17, "copy");
      name = v13->_name;
      v13->_name = (NSString *)v18;

    }
  }

  return v13;
}

- (SKUIInAppPurchase)initWithCacheRepresentation:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUIInAppPurchase *v13;
  void *v14;
  uint64_t v15;
  NSString *formattedPrice;
  void *v17;
  uint64_t v18;
  NSString *name;
  objc_super v21;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIInAppPurchase initWithCacheRepresentation:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)SKUIInAppPurchase;
  v13 = -[SKUIInAppPurchase init](&v21, sel_init);
  if (v13)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("price"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = objc_msgSend(v14, "copy");
      formattedPrice = v13->_formattedPrice;
      v13->_formattedPrice = (NSString *)v15;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("name"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = objc_msgSend(v17, "copy");
      name = v13->_name;
      v13->_name = (NSString *)v18;

    }
  }

  return v13;
}

- (NSMutableDictionary)cacheRepresentation
{
  void *v3;
  void *v4;
  NSString *formattedPrice;
  NSString *name;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  formattedPrice = self->_formattedPrice;
  if (formattedPrice)
    objc_msgSend(v3, "setObject:forKey:", formattedPrice, CFSTR("price"));
  name = self->_name;
  if (name)
    objc_msgSend(v4, "setObject:forKey:", name, CFSTR("name"));
  return (NSMutableDictionary *)v4;
}

- (NSString)formattedPrice
{
  return self->_formattedPrice;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_formattedPrice, 0);
}

- (void)initWithInAppPurchaseDictionary:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCacheRepresentation:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
