@implementation SKUIAccountButtonsComponent

- (SKUIAccountButtonsComponent)initWithCustomPageContext:(id)a3
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
  SKUIAccountButtonsComponent *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIAccountButtonsComponent initWithCustomPageContext:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUIAccountButtonsComponent;
  v13 = -[SKUIPageComponent initWithCustomPageContext:](&v17, sel_initWithCustomPageContext_, v4);
  if (v13)
  {
    objc_msgSend(v4, "componentDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("hideTerms"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13->_hidesTermsAndConditions = objc_msgSend(v15, "BOOLValue");

  }
  return v13;
}

- (SKUIAccountButtonsComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4
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
  SKUIAccountButtonsComponent *v15;
  void *v16;
  void *v17;
  SKUILink *v18;
  SKUILink *ecommerceLink;
  objc_super v21;

  v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        -[SKUIAccountButtonsComponent initWithFeaturedContentContext:kind:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)SKUIAccountButtonsComponent;
  v15 = -[SKUIPageComponent initWithFeaturedContentContext:kind:](&v21, sel_initWithFeaturedContentContext_kind_, v6, a4);
  if (v15)
  {
    objc_msgSend(v6, "componentDictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", CFSTR("ecommerceLink"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = -[SKUILink initWithLinkDictionary:]([SKUILink alloc], "initWithLinkDictionary:", v17);
      ecommerceLink = v15->_ecommerceLink;
      v15->_ecommerceLink = v18;

    }
  }

  return v15;
}

- (SKUIAccountButtonsComponent)initWithViewElement:(id)a3
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
  SKUIAccountButtonsComponent *v13;
  objc_super v15;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIAccountButtonsComponent initWithViewElement:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIAccountButtonsComponent;
  v13 = -[SKUIPageComponent initWithViewElement:](&v15, sel_initWithViewElement_, v4);

  return v13;
}

- (int64_t)componentType
{
  return 1;
}

- (SKUILink)ECommerceLink
{
  return self->_ecommerceLink;
}

- (void)setECommerceLink:(id)a3
{
  objc_storeStrong((id *)&self->_ecommerceLink, a3);
}

- (BOOL)hidesTermsAndConditions
{
  return self->_hidesTermsAndConditions;
}

- (void)setHidesTermsAndConditions:(BOOL)a3
{
  self->_hidesTermsAndConditions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ecommerceLink, 0);
}

- (void)initWithCustomPageContext:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithFeaturedContentContext:(uint64_t)a3 kind:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithViewElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
