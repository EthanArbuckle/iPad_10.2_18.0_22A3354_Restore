@implementation SKUIMenuPageComponent

- (SKUIMenuPageComponent)initWithCustomPageContext:(id)a3
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
  void *v15;
  uint64_t v16;
  NSString *titleForMoreItem;
  void *v18;
  uint64_t v19;
  NSString *menuTitle;
  void *v21;
  float v22;
  void *v23;
  NSMutableArray *v24;
  NSMutableArray *childrenComponents;
  NSMutableArray *v26;
  NSMutableArray *titles;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v53;
  void *v54;
  uint64_t v55;
  id v56;
  id v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  SKUIMenuPageComponent *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  objc_super v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIMenuPageComponent initWithCustomPageContext:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v72.receiver = self;
  v72.super_class = (Class)SKUIMenuPageComponent;
  v63 = -[SKUIPageComponent initWithCustomPageContext:](&v72, sel_initWithCustomPageContext_, v4);
  if (v63)
  {
    objc_msgSend(v4, "componentDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("type"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v14, "isEqualToString:", CFSTR("popup")))
      v63->_menuStyle = 1;
    objc_msgSend(v13, "objectForKey:", CFSTR("moreTitle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = objc_msgSend(v15, "copy");
      titleForMoreItem = v63->_titleForMoreItem;
      v63->_titleForMoreItem = (NSString *)v16;

    }
    objc_msgSend(v13, "objectForKey:", CFSTR("title"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = objc_msgSend(v18, "copy");
      menuTitle = v63->_menuTitle;
      v63->_menuTitle = (NSString *)v19;

      objc_msgSend(v13, "objectForKey:", CFSTR("titleSize"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v21, "floatValue");
        v63->_menuTitleFontSize = v22;
      }
      objc_msgSend(v13, "objectForKey:", CFSTR("titleWeight"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v63->_menuTitleFontWeight = SKUIPageComponentFontWeightForString(v18);
    }
    objc_msgSend(v13, "objectForKey:", CFSTR("children"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v54 = v13;
      v61 = objc_alloc_init(MEMORY[0x1E0CB3550]);
      v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      childrenComponents = v63->_childrenComponents;
      v63->_childrenComponents = v24;

      v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      titles = v63->_titles;
      v63->_titles = v26;

      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v53 = v23;
      v28 = v23;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v69;
        v57 = v4;
        v55 = *(_QWORD *)v69;
        v56 = v28;
        do
        {
          v32 = 0;
          v58 = v30;
          do
          {
            if (*(_QWORD *)v69 != v31)
              objc_enumerationMutation(v28);
            v60 = v32;
            v33 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v32);
            objc_msgSend(v33, "objectForKey:", CFSTR("content"));
            v34 = objc_claimAutoreleasedReturnValue();
            v35 = v33;
            v36 = (void *)v34;
            objc_msgSend(v35, "objectForKey:", CFSTR("title"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v38 = (void *)objc_msgSend(v4, "copy");
                v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                v40 = v36;
                v41 = v39;
                v64 = 0u;
                v65 = 0u;
                v66 = 0u;
                v67 = 0u;
                v59 = v40;
                v42 = v40;
                v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
                if (v43)
                {
                  v44 = v43;
                  v45 = *(_QWORD *)v65;
                  do
                  {
                    v46 = 0;
                    v62 = v44;
                    do
                    {
                      if (*(_QWORD *)v65 != v45)
                        objc_enumerationMutation(v42);
                      v47 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * v46);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        objc_msgSend(v38, "setComponentDictionary:", v47);
                        -[SKUIMenuPageComponent _componentWithContext:](v63, "_componentWithContext:", v38);
                        v48 = (void *)objc_claimAutoreleasedReturnValue();
                        v49 = v48;
                        if (v48)
                        {
                          v50 = v37;
                          objc_msgSend(v48, "metricsElementName");
                          v51 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v51)
                          {
                            objc_msgSend(v49, "_setMetricsLocationPosition:", objc_msgSend(v61, "countForObject:", v51));
                            v44 = v62;
                            objc_msgSend(v61, "addObject:", v51);
                          }
                          objc_msgSend(v41, "addObject:", v49);

                          v37 = v50;
                        }

                      }
                      ++v46;
                    }
                    while (v44 != v46);
                    v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
                  }
                  while (v44);
                }

                if (objc_msgSend(v41, "count"))
                {
                  -[NSMutableArray addObject:](v63->_childrenComponents, "addObject:", v41);
                  -[NSMutableArray addObject:](v63->_titles, "addObject:", v37);
                }

                v4 = v57;
                v31 = v55;
                v28 = v56;
                v30 = v58;
                v36 = v59;
              }
            }

            v32 = v60 + 1;
          }
          while (v60 + 1 != v30);
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
        }
        while (v30);
      }

      v13 = v54;
      v23 = v53;
    }

  }
  return v63;
}

- (SKUIMenuPageComponent)initWithRoomSortData:(id)a3
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
  SKUIMenuPageComponent *v13;
  NSMutableArray *v14;
  NSMutableArray *childrenComponents;
  NSMutableArray *v16;
  NSMutableArray *sortURLStrings;
  NSMutableArray *v18;
  NSMutableArray *titles;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *, uint64_t);
  void *v28;
  SKUIMenuPageComponent *v29;
  id v30;
  objc_super v31;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIMenuPageComponent initWithRoomSortData:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v31.receiver = self;
  v31.super_class = (Class)SKUIMenuPageComponent;
  v13 = -[SKUIMenuPageComponent init](&v31, sel_init);
  if (v13)
  {
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    childrenComponents = v13->_childrenComponents;
    v13->_childrenComponents = v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    sortURLStrings = v13->_sortURLStrings;
    v13->_sortURLStrings = v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    titles = v13->_titles;
    v13->_titles = v18;

    objc_msgSend(v4, "objectForKey:", CFSTR("defaultSort"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v20, "objectForKey:", CFSTR("id"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("sorts"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = MEMORY[0x1E0C809B0];
      v26 = 3221225472;
      v27 = __46__SKUIMenuPageComponent_initWithRoomSortData___block_invoke;
      v28 = &unk_1E73A9238;
      v29 = v13;
      v30 = v21;
      objc_msgSend(v22, "enumerateObjectsUsingBlock:", &v25);

    }
    v23 = -[NSMutableArray count](v13->_sortURLStrings, "count", v25, v26, v27, v28);
    if (v23 != -[NSMutableArray count](v13->_titles, "count")
      || !-[NSMutableArray count](v13->_sortURLStrings, "count")
      || !-[NSMutableArray count](v13->_titles, "count"))
    {

      v13 = 0;
    }

  }
  return v13;
}

void __46__SKUIMenuPageComponent_initWithRoomSortData___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = v12;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v12, "objectForKey:", CFSTR("name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "addObject:", v7);
    objc_msgSend(v12, "objectForKey:", CFSTR("url"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "addObject:", v8);
    objc_msgSend(v12, "objectForKey:", CFSTR("id"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "isEqual:", *(_QWORD *)(a1 + 40)))
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = a3;
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

    v6 = v12;
  }

}

- (SKUIMenuPageComponent)initWithViewElement:(id)a3
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
  SKUIMenuPageComponent *v13;
  void *v14;
  uint64_t v15;
  NSMutableArray *titles;
  objc_super v18;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIMenuPageComponent initWithViewElement:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUIMenuPageComponent;
  v13 = -[SKUIPageComponent initWithViewElement:](&v18, sel_initWithViewElement_, v4);
  if (v13)
  {
    v13->_defaultSelectedIndex = objc_msgSend(v4, "initialSelectedItemIndex");
    objc_msgSend(v4, "segmentItemTitles");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "mutableCopy");
    titles = v13->_titles;
    v13->_titles = (NSMutableArray *)v15;

  }
  return v13;
}

- (NSArray)allTitles
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_titles, "copy");
}

- (id)childComponentsForIndex:(int64_t)a3
{
  void *v3;

  -[NSMutableArray objectAtIndex:](self->_childrenComponents, "objectAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v3 = 0;
  }
  return v3;
}

- (int64_t)numberOfItems
{
  return -[NSMutableArray count](self->_titles, "count");
}

- (id)sortURLForIndex:(int64_t)a3
{
  NSMutableArray *sortURLStrings;
  void *v4;
  void *v5;

  sortURLStrings = self->_sortURLStrings;
  if (sortURLStrings)
  {
    -[NSMutableArray objectAtIndex:](sortURLStrings, "objectAtIndex:", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)titleForIndex:(int64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_titles, "objectAtIndex:", a3);
}

- (int64_t)componentType
{
  return 11;
}

- (void)_setChildComponents:(id)a3 forIndex:(int64_t)a4
{
  -[NSMutableArray replaceObjectAtIndex:withObject:](self->_childrenComponents, "replaceObjectAtIndex:withObject:", a4, a3);
}

- (id)_componentWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "componentDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v6 = SKUIPageComponentTypeForBlockType(v5),
        (v7 = (objc_class *)SKUIPageComponentClassForComponentType(v6)) != 0))
  {
    v8 = (void *)objc_msgSend([v7 alloc], "initWithCustomPageContext:", v3);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)defaultSelectedIndex
{
  return self->_defaultSelectedIndex;
}

- (int64_t)menuStyle
{
  return self->_menuStyle;
}

- (NSString)menuTitle
{
  return self->_menuTitle;
}

- (float)menuTitleFontSize
{
  return self->_menuTitleFontSize;
}

- (int64_t)menuTitleFontWeight
{
  return self->_menuTitleFontWeight;
}

- (NSString)titleForMoreItem
{
  return self->_titleForMoreItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_titleForMoreItem, 0);
  objc_storeStrong((id *)&self->_sortURLStrings, 0);
  objc_storeStrong((id *)&self->_menuTitle, 0);
  objc_storeStrong((id *)&self->_childrenComponents, 0);
}

- (void)initWithCustomPageContext:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithRoomSortData:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithViewElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
