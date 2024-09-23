@implementation SKUIPageComponent

- (SKUIPageComponent)initWithCustomPageContext:(id)a3
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
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  _BOOL4 v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  SKUIPageComponent *v23;
  objc_super v25;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIPageComponent initWithCustomPageContext:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend(v4, "componentDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("startTime"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "pageGenerationTime");
    v16 = v15;
    objc_msgSend(v14, "doubleValue");
    v18 = v16 < v17;
  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(v13, "objectForKey:", CFSTR("endTime"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!v18)
      goto LABEL_10;
LABEL_12:

    v23 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v4, "pageGenerationTime");
  v21 = v20;
  objc_msgSend(v19, "doubleValue");
  if (v21 > v22)
    goto LABEL_12;
LABEL_10:
  v25.receiver = self;
  v25.super_class = (Class)SKUIPageComponent;
  v23 = -[SKUIPageComponent init](&v25, sel_init);
LABEL_13:

  return v23;
}

- (SKUIPageComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIPageComponent initWithFeaturedContentContext:kind:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIPageComponent;
  return -[SKUIPageComponent init](&v14, sel_init);
}

- (SKUIPageComponent)initWithViewElement:(id)a3
{
  id v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  SKUIPageComponent *v14;
  SKUIPageComponent *v15;
  objc_super v17;

  v5 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v6)
        -[SKUIPageComponent initWithViewElement:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUIPageComponent;
  v14 = -[SKUIPageComponent init](&v17, sel_init);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_viewElement, a3);

  return v15;
}

- (int64_t)componentType
{
  int64_t result;

  result = (int64_t)self->_viewElement;
  if (result)
    return objc_msgSend((id)result, "pageComponentType");
  return result;
}

- (BOOL)isMissingItemData
{
  return 0;
}

- (NSString)metricsElementName
{
  return 0;
}

- (id)valueForMetricsField:(id)a3
{
  return 0;
}

- (void)_enumerateMissingItemIdentifiersFromBricks:(id)a3 startIndex:(int64_t)a4 usingBlock:(id)a5
{
  id v7;
  void (**v8)(id, void *, int64_t, _BYTE *);
  int64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  unsigned __int8 v17;

  v7 = a3;
  v8 = (void (**)(id, void *, int64_t, _BYTE *))a5;
  v9 = objc_msgSend(v7, "count");
  if (v9 > a4)
  {
    v10 = v9 - 1;
    do
    {
      v11 = (void *)MEMORY[0x1BCCE6C7C]();
      v17 = 0;
      objc_msgSend(v7, "objectAtIndex:", a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "link");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "itemIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "isActionable") & 1) == 0 && v14)
        v8[2](v8, v14, a4, &v17);
      v15 = v17;

      objc_autoreleasePoolPop(v11);
      if (v15)
        break;
    }
    while (v10 != a4++);
  }

}

- (void)_enumerateMissingItemIdentifiersFromLinks:(id)a3 startIndex:(int64_t)a4 usingBlock:(id)a5
{
  id v7;
  void (**v8)(id, void *, int64_t, _BYTE *);
  int64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  unsigned __int8 v16;

  v7 = a3;
  v8 = (void (**)(id, void *, int64_t, _BYTE *))a5;
  v9 = objc_msgSend(v7, "count");
  if (v9 > a4)
  {
    v10 = v9 - 1;
    do
    {
      v11 = (void *)MEMORY[0x1BCCE6C7C]();
      v16 = 0;
      objc_msgSend(v7, "objectAtIndex:", a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "itemIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "isActionable") & 1) == 0 && v13)
        v8[2](v8, v13, a4, &v16);
      v14 = v16;

      objc_autoreleasePoolPop(v11);
      if (v14)
        break;
    }
    while (v10 != a4++);
  }

}

- (void)_enumerateMissingItemIdentifiersFromLockups:(id)a3 startIndex:(int64_t)a4 usingBlock:(id)a5
{
  id v7;
  void (**v8)(id, void *, int64_t, _BYTE *);
  int64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  unsigned __int8 v18;

  v7 = a3;
  v8 = (void (**)(id, void *, int64_t, _BYTE *))a5;
  v9 = objc_msgSend(v7, "count");
  if (v9 > a4)
  {
    v10 = v9 - 1;
    do
    {
      v11 = (void *)MEMORY[0x1BCCE6C7C]();
      v18 = 0;
      objc_msgSend(v7, "objectAtIndex:", a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "itemIdentifier");
      if (v13)
      {
        v14 = v13;
        if (objc_msgSend(v12, "_needsItemData"))
        {
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", v14);
          v8[2](v8, v15, a4, &v18);

        }
      }
      v16 = v18;

      objc_autoreleasePoolPop(v11);
      if (v16)
        break;
    }
    while (v10 != a4++);
  }

}

- (int64_t)metricsLocationPosition
{
  return self->_metricsLocationPosition;
}

- (void)_setMetricsLocationPosition:(int64_t)a3
{
  self->_metricsLocationPosition = a3;
}

- (SKUIViewElement)viewElement
{
  return self->_viewElement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
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
