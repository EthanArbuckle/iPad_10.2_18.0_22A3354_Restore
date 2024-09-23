@implementation SKUIRowComponent

- (SKUIRowComponent)initWithCustomPageContext:(id)a3
{
  id v4;
  SKUIRowComponent *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  UIColor *backgroundColor;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSArray *childComponents;
  uint64_t v27;
  NSArray *columnWidths;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIRowComponent initWithCustomPageContext:].cold.1();
  }
  v39.receiver = self;
  v39.super_class = (Class)SKUIRowComponent;
  v5 = -[SKUIPageComponent initWithCustomPageContext:](&v39, sel_initWithCustomPageContext_, v4);
  if (v5)
  {
    objc_msgSend(v4, "componentDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("columns"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5->_numberOfColumns = objc_msgSend(v7, "integerValue");
    objc_msgSend(v6, "objectForKey:", CFSTR("backgroundColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      SKUIColorWithHTMLCode(v8);
      v9 = objc_claimAutoreleasedReturnValue();
      backgroundColor = v5->_backgroundColor;
      v5->_backgroundColor = (UIColor *)v9;

    }
    objc_msgSend(v6, "objectForKey:", CFSTR("shouldAutoFlow"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5->_shouldAutoFlow = objc_msgSend(v11, "BOOLValue");
    else
      v5->_shouldAutoFlow = 1;
    objc_msgSend(v6, "objectForKey:", CFSTR("children"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = v11;
      v32 = v6;
      v33 = v4;
      v13 = (void *)objc_msgSend(v4, "copy");
      v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v30 = v12;
      v15 = v12;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v36 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v13, "setComponentDictionary:", v20);
              -[SKUIRowComponent _childComponentWithContext:](v5, "_childComponentWithContext:", v13);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (v21)
              {
                objc_msgSend(v20, "objectForKey:", CFSTR("colspan"));
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_opt_respondsToSelector() & 1) != 0)
                {
                  v23 = v34;
                  v24 = v22;
                }
                else
                {
                  v23 = v34;
                  v24 = &unk_1E749B510;
                }
                objc_msgSend(v23, "addObject:", v24, v30);
                if (-[SKUIRowComponent _isChildMissingItemData:](v5, "_isChildMissingItemData:", v21))
                  ++v5->_missingItemCount;
                objc_msgSend(v14, "addObject:", v21);

              }
            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        }
        while (v17);
      }

      v25 = objc_msgSend(v14, "copy");
      childComponents = v5->_childComponents;
      v5->_childComponents = (NSArray *)v25;

      v27 = objc_msgSend(v34, "copy");
      columnWidths = v5->_columnWidths;
      v5->_columnWidths = (NSArray *)v27;

      v6 = v32;
      v4 = v33;
      v12 = v30;
      v11 = v31;
    }

  }
  return v5;
}

- (SKUIRowComponent)initWithViewElement:(id)a3
{
  id v4;
  SKUIRowComponent *v5;
  objc_super v7;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIRowComponent initWithViewElement:].cold.1();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUIRowComponent;
  v5 = -[SKUIPageComponent initWithViewElement:](&v7, sel_initWithViewElement_, v4);

  return v5;
}

- (int64_t)componentType
{
  return 3;
}

- (void)enumerateMissingItemIdentifiersFromIndex:(int64_t)a3 usingBlock:(id)a4
{
  void (**v6)(id, void *, int64_t, _BYTE *);
  int64_t v7;
  int64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  unsigned __int8 v17;

  v6 = (void (**)(id, void *, int64_t, _BYTE *))a4;
  v7 = -[NSArray count](self->_childComponents, "count");
  if (v7 > a3)
  {
    v8 = v7 - 1;
    do
    {
      v9 = (void *)MEMORY[0x1BCCE6C7C]();
      v17 = 0;
      -[NSArray objectAtIndex:](self->_childComponents, "objectAtIndex:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "componentType") == 9)
      {
        v11 = objc_msgSend(v10, "itemIdentifier");
        if (v11)
        {
          v12 = v11;
          objc_msgSend(v10, "item");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13)
          {
            v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", v12);
            v6[2](v6, v14, a3, &v17);

          }
        }
      }
      v15 = v17;

      objc_autoreleasePoolPop(v9);
      if (v15)
        break;
    }
    while (v8 != a3++);
  }

}

- (BOOL)isMissingItemData
{
  return self->_missingItemCount > 0;
}

- (id)metricsElementName
{
  return CFSTR("customRow");
}

- (id)_updateWithMissingItems:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  SKUIRowComponent *v10;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__SKUIRowComponent__updateWithMissingItems___block_invoke;
  v8[3] = &unk_1E73A34D0;
  v9 = v4;
  v10 = self;
  v6 = v4;
  -[SKUIRowComponent enumerateMissingItemIdentifiersFromIndex:usingBlock:](self, "enumerateMissingItemIdentifiersFromIndex:usingBlock:", 0, v8);

  return v5;
}

void __44__SKUIRowComponent__updateWithMissingItems___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setItem:", v6);
    --*(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);

  }
}

- (id)_childComponentWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  BOOL v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "componentDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ((v6 = SKUIPageComponentTypeForBlockType(v5), v6 <= 0xE) ? (v7 = ((1 << v6) & 0x46A4) == 0) : (v7 = 1), v7))
  {
    v8 = 0;
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc((Class)SKUIPageComponentClassForComponentType(v6)), "initWithCustomPageContext:", v3);
  }

  return v8;
}

- (BOOL)_isChildMissingItemData:(id)a3
{
  id v3;
  id v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  if (objc_msgSend(v3, "componentType") == 9)
  {
    v4 = v3;
    objc_msgSend(v4, "item");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v6 = 0;
    else
      v6 = objc_msgSend(v4, "itemIdentifier") != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)SKUIRowComponent;
  -[SKUIRowComponent description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %ld columns; %@"),
    v4,
    self->_numberOfColumns,
    self->_childComponents);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (NSArray)childComponents
{
  return self->_childComponents;
}

- (NSArray)columnWidths
{
  return self->_columnWidths;
}

- (int64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (BOOL)shouldAutoFlow
{
  return self->_shouldAutoFlow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnWidths, 0);
  objc_storeStrong((id *)&self->_childComponents, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

- (void)initWithCustomPageContext:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIRowComponent initWithCustomPageContext:]";
}

- (void)initWithViewElement:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIRowComponent initWithViewElement:]";
}

@end
