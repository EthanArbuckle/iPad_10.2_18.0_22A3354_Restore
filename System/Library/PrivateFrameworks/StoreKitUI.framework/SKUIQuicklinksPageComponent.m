@implementation SKUIQuicklinksPageComponent

- (SKUIQuicklinksPageComponent)initWithCustomPageContext:(id)a3
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
  SKUIQuicklinksPageComponent *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *title;
  void *v18;
  objc_super v20;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIQuicklinksPageComponent initWithCustomPageContext:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUIQuicklinksPageComponent;
  v13 = -[SKUIPageComponent initWithCustomPageContext:](&v20, sel_initWithCustomPageContext_, v4);
  if (v13)
  {
    objc_msgSend(v4, "componentDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("title"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = objc_msgSend(v15, "copy");
      title = v13->_title;
      v13->_title = (NSString *)v16;

    }
    objc_msgSend(v14, "objectForKey:", CFSTR("children"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SKUIQuicklinksPageComponent _setLinksWithLinksArray:context:](v13, "_setLinksWithLinksArray:context:", v18, v4);

  }
  return v13;
}

- (SKUIQuicklinksPageComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4
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
  SKUIQuicklinksPageComponent *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  NSString *title;
  void *v23;
  objc_super v25;

  v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        -[SKUIQuicklinksPageComponent initWithFeaturedContentContext:kind:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  v25.receiver = self;
  v25.super_class = (Class)SKUIQuicklinksPageComponent;
  v15 = -[SKUIPageComponent initWithFeaturedContentContext:kind:](&v25, sel_initWithFeaturedContentContext_kind_, v6, a4);
  if (v15)
  {
    objc_msgSend(v6, "componentDictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", CFSTR("children"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v17, "count"))
    {
      objc_msgSend(v17, "objectAtIndex:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = v18;

        v16 = v19;
      }

    }
    objc_msgSend(v16, "objectForKey:", CFSTR("name"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = objc_msgSend(v20, "copy");
      title = v15->_title;
      v15->_title = (NSString *)v21;

    }
    objc_msgSend(v16, "objectForKey:", CFSTR("links"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[SKUIQuicklinksPageComponent _setLinksWithLinksArray:context:](v15, "_setLinksWithLinksArray:context:", v23, v6);

  }
  return v15;
}

- (int64_t)componentType
{
  return 12;
}

- (id)metricsElementName
{
  return CFSTR("quicklink");
}

- (id)valueForMetricsField:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DAFC60]) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DAFC68]) & 1) != 0)
  {
    -[SKUIQuicklinksPageComponent title](self, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_7;
  }
  else
  {
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DAFC58]) & 1) == 0)
    {
LABEL_7:
      v7.receiver = self;
      v7.super_class = (Class)SKUIQuicklinksPageComponent;
      -[SKUIPageComponent valueForMetricsField:](&v7, sel_valueForMetricsField_, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    v5 = &unk_1E749B888;
  }
LABEL_8:

  return v5;
}

- (void)_setLinksWithLinksArray:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  SKUILink *v15;
  NSArray *v16;
  NSArray *links;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = (void *)objc_msgSend(v6, "copy");
          objc_msgSend(v14, "setComponentDictionary:", v13);
          v15 = -[SKUILink initWithComponentContext:]([SKUILink alloc], "initWithComponentContext:", v14);
          if (v15)
            objc_msgSend(v7, "addObject:", v15);

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  v16 = (NSArray *)objc_msgSend(v7, "copy");
  links = self->_links;
  self->_links = v16;

}

- (NSArray)links
{
  return self->_links;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_links, 0);
}

- (void)initWithCustomPageContext:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithFeaturedContentContext:(uint64_t)a3 kind:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
