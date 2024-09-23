@implementation SKUICarouselPageComponent

- (SKUICarouselPageComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4
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
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  SKUICarouselItem *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSArray *carouselItems;
  void *v32;
  void *v33;
  void *v34;
  SKUICarouselPageComponent *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        -[SKUICarouselPageComponent initWithFeaturedContentContext:kind:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  v40.receiver = self;
  v40.super_class = (Class)SKUICarouselPageComponent;
  v35 = -[SKUIPageComponent initWithFeaturedContentContext:kind:](&v40, sel_initWithFeaturedContentContext_kind_, v6, a4);
  if (v35)
  {
    objc_msgSend(v6, "componentDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", CFSTR("children"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = v15;
      v17 = (void *)objc_msgSend(v6, "copy");
      v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v32 = v16;
      v19 = v16;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v37 != v22)
              objc_enumerationMutation(v19);
            v24 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v17, "setComponentDictionary:", v24);
              v25 = -[SKUICarouselItem initWithComponentContext:]([SKUICarouselItem alloc], "initWithComponentContext:", v17);
              -[SKUICarouselItem link](v25, "link");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v26, "isActionable"))
              {
                objc_msgSend(v18, "addObject:", v25);
              }
              else
              {
                objc_msgSend(v26, "itemIdentifier");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                if (v27 && (objc_msgSend(v6, "isUnavailableItemIdentifier:", v27) & 1) == 0)
                {
                  ++v35->_missingItemCount;
                  objc_msgSend(v18, "addObject:", v25);
                }

              }
            }
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        }
        while (v21);
      }

      if (objc_msgSend(v6, "layoutStyle") == 1 && (unint64_t)objc_msgSend(v18, "count") >= 3)
      {
        objc_msgSend(v18, "objectAtIndex:", 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "removeObjectAtIndex:", 1);
        objc_msgSend(v18, "addObject:", v28);

      }
      v29 = objc_msgSend(v18, "copy", v32);
      carouselItems = v35->_carouselItems;
      v35->_carouselItems = (NSArray *)v29;

      v16 = v33;
      v15 = v34;
    }
    v35->_cycleInterval = 5.0;

  }
  return v35;
}

- (SKUICarouselPageComponent)initWithViewElement:(id)a3
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
  SKUICarouselPageComponent *v13;
  double v14;
  objc_super v16;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUICarouselPageComponent initWithViewElement:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUICarouselPageComponent;
  v13 = -[SKUIPageComponent initWithViewElement:](&v16, sel_initWithViewElement_, v4);
  if (v13)
  {
    objc_msgSend(v4, "displayInterval");
    if (v14 < 0.0)
      v14 = 5.0;
    v13->_cycleInterval = v14;
  }

  return v13;
}

- (void)updateWithMissingItems:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_carouselItems;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "link", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "itemIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 && (objc_msgSend(v11, "isActionable") & 1) == 0)
        {
          objc_msgSend(v4, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_msgSend(v10, "_setLinkItem:", v13);
            --self->_missingItemCount;
          }

        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (int64_t)componentType
{
  return 18;
}

- (void)enumerateMissingItemIdentifiersFromIndex:(int64_t)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_carouselItems;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "link", (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  -[SKUIPageComponent _enumerateMissingItemIdentifiersFromLinks:startIndex:usingBlock:](self, "_enumerateMissingItemIdentifiersFromLinks:startIndex:usingBlock:", v7, a3, v6);
}

- (BOOL)isMissingItemData
{
  return self->_missingItemCount > 0;
}

- (id)metricsElementName
{
  return CFSTR("carousel");
}

- (id)valueForMetricsField:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DAFC58]) & 1) != 0)
  {
    v5 = &unk_1E749B8A0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SKUICarouselPageComponent;
    -[SKUIPageComponent valueForMetricsField:](&v7, sel_valueForMetricsField_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (NSArray)carouselItems
{
  return self->_carouselItems;
}

- (double)cycleInterval
{
  return self->_cycleInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carouselItems, 0);
}

- (void)initWithFeaturedContentContext:(uint64_t)a3 kind:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithViewElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
