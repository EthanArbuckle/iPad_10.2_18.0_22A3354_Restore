@implementation SKUICompletion

- (SKUICompletion)initWithCompletionDictionary:(id)a3
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
  SKUICompletion *v13;
  void *v14;
  uint64_t v15;
  NSString *title;
  void *v17;
  uint64_t v18;
  NSString *alternateTitle;
  void *v20;
  uint64_t v21;
  NSString *URLString;
  objc_super v24;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUICompletion initWithCompletionDictionary:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)SKUICompletion;
  v13 = -[SKUICompletion init](&v24, sel_init);
  if (v13)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("term"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = objc_msgSend(v14, "copy");
      title = v13->_title;
      v13->_title = (NSString *)v15;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("search-field-term"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = objc_msgSend(v17, "copy");
      alternateTitle = v13->_alternateTitle;
      v13->_alternateTitle = (NSString *)v18;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("url"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = objc_msgSend(v20, "copy");
      URLString = v13->_URLString;
      v13->_URLString = (NSString *)v21;

    }
  }

  return v13;
}

- (SKUICompletion)initWithCacheRepresentation:(id)a3
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
  SKUICompletion *v13;
  void *v14;
  uint64_t v15;
  NSString *title;
  void *v17;
  uint64_t v18;
  NSString *alternateTitle;
  uint64_t v20;
  NSString *URLString;
  objc_super v23;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUICompletion initWithCacheRepresentation:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = 0;
LABEL_14:

    goto LABEL_15;
  }
  v23.receiver = self;
  v23.super_class = (Class)SKUICompletion;
  v13 = -[SKUICompletion init](&v23, sel_init);
  if (v13)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("title"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = objc_msgSend(v14, "copy");
      title = v13->_title;
      v13->_title = (NSString *)v15;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("alttitle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = objc_msgSend(v17, "copy");
      alternateTitle = v13->_alternateTitle;
      v13->_alternateTitle = (NSString *)v18;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("url"));
    self = (SKUICompletion *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = -[SKUICompletion copy](self, "copy");
      URLString = v13->_URLString;
      v13->_URLString = (NSString *)v20;

    }
    goto LABEL_14;
  }
LABEL_15:

  return v13;
}

- (NSMutableDictionary)cacheRepresentation
{
  void *v3;
  void *v4;
  NSString *title;
  NSString *alternateTitle;
  NSString *URLString;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKey:", title, CFSTR("title"));
  alternateTitle = self->_alternateTitle;
  if (alternateTitle)
    objc_msgSend(v4, "setObject:forKey:", alternateTitle, CFSTR("alttitle"));
  URLString = self->_URLString;
  if (URLString)
    objc_msgSend(v4, "setObject:forKey:", URLString, CFSTR("url"));
  return (NSMutableDictionary *)v4;
}

- (NSString)alternateTitle
{
  return self->_alternateTitle;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)URLString
{
  return self->_URLString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URLString, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_alternateTitle, 0);
}

- (void)initWithCompletionDictionary:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithCacheRepresentation:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
