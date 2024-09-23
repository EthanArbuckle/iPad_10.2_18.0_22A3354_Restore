@implementation SKUILink

- (SKUILink)initWithLinkDictionary:(id)a3
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
  SKUILink *v13;
  void *v14;
  uint64_t v15;
  NSString *title;
  void *v17;
  uint64_t v18;
  NSURL *url;
  void *v20;
  uint64_t v21;
  NSString *target;
  objc_super v24;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUILink initWithLinkDictionary:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)SKUILink;
  v13 = -[SKUILink init](&v24, sel_init);
  if (v13)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("label"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = objc_msgSend(v14, "copy");
      title = v13->_title;
      v13->_title = (NSString *)v15;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("url"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v17);
      v18 = objc_claimAutoreleasedReturnValue();
      url = v13->_url;
      v13->_url = (NSURL *)v18;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("target"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = objc_msgSend(v20, "copy");
      target = v13->_target;
      v13->_target = (NSString *)v21;

    }
  }

  return v13;
}

- (SKUILink)initWithComponentContext:(id)a3
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
  SKUILink *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *title;
  void *v18;
  uint64_t v19;
  NSURL *url;
  void *v21;
  SKUIItem *v22;
  void *item;
  void *v24;
  uint64_t v25;
  SKUIItem *v26;
  void *v27;
  uint64_t v28;
  NSString *target;
  uint64_t v31;
  objc_super v32;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUILink initWithComponentContext:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v32.receiver = self;
  v32.super_class = (Class)SKUILink;
  v13 = -[SKUILink init](&v32, sel_init);
  if (v13)
  {
    objc_msgSend(v4, "componentDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("label"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = objc_msgSend(v15, "copy");
      title = v13->_title;
      v13->_title = (NSString *)v16;

    }
    objc_msgSend(v14, "objectForKey:", CFSTR("url"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v18);
      v19 = objc_claimAutoreleasedReturnValue();
      url = v13->_url;
      v13->_url = (NSURL *)v19;

    }
    objc_msgSend(v14, "objectForKey:", CFSTR("lockupData"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = -[SKUIItem initWithLookupDictionary:]([SKUIItem alloc], "initWithLookupDictionary:", v21);
      item = v13->_item;
      v13->_item = v22;
      v24 = v21;
    }
    else
    {
      objc_msgSend(v14, "objectForKey:", CFSTR("adamId"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_16;
      objc_msgSend(v4, "itemForItemIdentifier:", v24);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = v13->_item;
      v13->_item = (SKUIItem *)v25;

      if (v13->_item || (objc_msgSend(v4, "isUnavailableItemIdentifier:", v24) & 1) != 0)
        goto LABEL_16;
      v31 = objc_msgSend(v24, "copy");
      item = v13->_itemIdentifier;
      v13->_itemIdentifier = (NSNumber *)v31;
    }

LABEL_16:
    objc_msgSend(v14, "objectForKey:", CFSTR("target"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = objc_msgSend(v27, "copy");
      target = v13->_target;
      v13->_target = (NSString *)v28;

    }
  }

  return v13;
}

- (SKUILink)initWithURL:(id)a3
{
  return -[SKUILink initWithURL:title:targetString:](self, "initWithURL:title:targetString:", a3, 0, 0);
}

- (SKUILink)initWithURL:(id)a3 title:(id)a4 targetString:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  SKUILink *v19;
  uint64_t v20;
  NSString *target;
  uint64_t v22;
  NSString *title;
  uint64_t v24;
  NSURL *url;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v11 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v11)
        -[SKUILink initWithURL:title:targetString:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  v27.receiver = self;
  v27.super_class = (Class)SKUILink;
  v19 = -[SKUILink init](&v27, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v10, "copy");
    target = v19->_target;
    v19->_target = (NSString *)v20;

    v22 = objc_msgSend(v9, "copy");
    title = v19->_title;
    v19->_title = (NSString *)v22;

    v24 = objc_msgSend(v8, "copy");
    url = v19->_url;
    v19->_url = (NSURL *)v24;

  }
  return v19;
}

- (BOOL)isActionable
{
  return self->_url || self->_item != 0;
}

- (NSDictionary)linkDictionary
{
  void *v3;
  void *v4;
  NSString *target;
  NSString *title;
  NSURL *url;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  target = self->_target;
  if (target)
    objc_msgSend(v3, "setObject:forKey:", target, CFSTR("target"));
  title = self->_title;
  if (title)
    objc_msgSend(v4, "setObject:forKey:", title, CFSTR("label"));
  url = self->_url;
  if (url)
  {
    -[NSURL absoluteString](url, "absoluteString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("url"));

  }
  return (NSDictionary *)v4;
}

- (id)valueForMetricsField:(id)a3
{
  id v4;
  SKUIItem *item;
  NSNumber *v6;
  NSNumber *v7;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DAFC50]))
  {
    item = self->_item;
    if (item)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[SKUIItem itemIdentifier](item, "itemIdentifier"));
      v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = self->_itemIdentifier;
    }
  }
  else
  {
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DAFC60]) & 1) == 0
      && !objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DAFC68]))
    {
      v7 = 0;
      goto LABEL_9;
    }
    -[SKUILink title](self, "title");
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
LABEL_9:

  return v7;
}

- (void)_setItem:(id)a3
{
  SKUIItem *v5;
  SKUIItem **p_item;
  SKUIItem *item;
  SKUIItem *v8;

  v5 = (SKUIItem *)a3;
  item = self->_item;
  p_item = &self->_item;
  if (item != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_item, a3);
    v5 = v8;
  }

}

- (SKUIItem)item
{
  return self->_item;
}

- (NSNumber)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSString)targetString
{
  return self->_target;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)URL
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_countdown, 0);
}

- (void)initWithLinkDictionary:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithComponentContext:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithURL:(uint64_t)a3 title:(uint64_t)a4 targetString:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
