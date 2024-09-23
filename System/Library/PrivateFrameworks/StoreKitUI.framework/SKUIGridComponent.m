@implementation SKUIGridComponent

- (SKUIGridComponent)initWithBrickItems:(id)a3
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
  SKUIGridComponent *v13;
  uint64_t v14;
  NSMutableArray *children;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  objc_super v23;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIGridComponent initWithBrickItems:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)SKUIGridComponent;
  v13 = -[SKUIGridComponent init](&v23, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v4, "mutableCopy");
    children = v13->_children;
    v13->_children = (NSMutableArray *)v14;

    SKUIEditorialStyleDefault((uint64_t)&v20);
    v16 = v20;
    v17 = v21;
    *(_QWORD *)&v13->_editorialStyle.titleFontSize = v22;
    *(_OWORD *)&v13->_editorialStyle.alignment = v16;
    *(_OWORD *)&v13->_editorialStyle.bodyFontSize = v17;
    v13->_gridType = 2;
    SKUILockupStyleDefault((uint64_t)&v20);
    v18 = v20;
    v13->_lockupStyle.visibleFields = v21;
    *(_OWORD *)&v13->_lockupStyle.artworkSize = v18;
    -[SKUIGridComponent _reloadMissingItemCount](v13, "_reloadMissingItemCount");
  }

  return v13;
}

- (SKUIGridComponent)initWithCustomPageContext:(id)a3
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
  SKUIGridComponent *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  __int128 v22;
  void *v23;
  NSMutableArray *v24;
  NSMutableArray *children;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  void *v32;
  SKUILockupComponent *v33;
  __int128 v34;
  SKUIBrickItem *v35;
  SKUILockupComponent *v36;
  id v37;
  void *v38;
  __objc2_class *v39;
  void *v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  objc_super v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIGridComponent initWithCustomPageContext:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v51.receiver = self;
  v51.super_class = (Class)SKUIGridComponent;
  v13 = -[SKUIPageComponent initWithCustomPageContext:](&v51, sel_initWithCustomPageContext_, v4);
  if (v13)
  {
    objc_msgSend(v4, "componentDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("childType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((objc_msgSend(v15, "isEqualToString:", CFSTR("lockup")) & 1) != 0)
      {
        v16 = 0;
LABEL_15:
        v13->_gridType = v16;
        goto LABEL_16;
      }
      if ((objc_msgSend(v15, "isEqualToString:", CFSTR("brick")) & 1) != 0)
      {
        v16 = 2;
        goto LABEL_15;
      }
      if ((objc_msgSend(v15, "isEqualToString:", CFSTR("editorial")) & 1) != 0)
      {
        v16 = 3;
        goto LABEL_15;
      }
      if (objc_msgSend(v15, "isEqualToString:", CFSTR("media")))
      {
        v16 = 4;
        goto LABEL_15;
      }
    }
LABEL_16:
    objc_msgSend(v14, "objectForKey:", CFSTR("ranked"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13->_showsIndexNumbers = objc_msgSend(v17, "BOOLValue");
    objc_msgSend(v14, "objectForKey:", CFSTR("editorialStyle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      SKUIEditorialStyleForDictionary(v18, (uint64_t)&v48);
    else
      SKUIEditorialStyleDefault((uint64_t)&v48);
    v19 = v48;
    v20 = v49;
    *(_QWORD *)&v13->_editorialStyle.titleFontSize = v50;
    *(_OWORD *)&v13->_editorialStyle.alignment = v19;
    *(_OWORD *)&v13->_editorialStyle.bodyFontSize = v20;
    objc_msgSend(v14, "objectForKey:", CFSTR("lockupStyle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      SKUILockupStyleForDictionary(v21, v4, (uint64_t)&v48);
    else
      SKUILockupStyleDefault((uint64_t)&v48);
    v22 = v48;
    v13->_lockupStyle.visibleFields = v49;
    *(_OWORD *)&v13->_lockupStyle.artworkSize = v22;
    objc_msgSend(v14, "objectForKey:", CFSTR("children"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v43 = v14;
      v42 = v21;
      v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      children = v13->_children;
      v13->_children = v24;

      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v41 = v23;
      v26 = v23;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v45 != v29)
              objc_enumerationMutation(v26);
            v31 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
            switch(v13->_gridType)
            {
              case 0:
              case 1:
              case 5:
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v4, "itemForItemIdentifier:", v31);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v32)
                    goto LABEL_49;
                  v33 = [SKUILockupComponent alloc];
                  v34 = *(_OWORD *)&v13->_lockupStyle.artworkSize;
                  *(_QWORD *)&v49 = v13->_lockupStyle.visibleFields;
                  v48 = v34;
                  v35 = -[SKUILockupComponent initWithItem:style:](v33, "initWithItem:style:", v32, &v48);
                  goto LABEL_41;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v32 = (void *)objc_msgSend(v4, "copy");
                  objc_msgSend(v32, "setComponentDictionary:", v31);
                  v36 = -[SKUILockupComponent initWithCustomPageContext:]([SKUILockupComponent alloc], "initWithCustomPageContext:", v32);
                  if (v36)
                  {
                    v37 = v4;
                    -[NSMutableArray addObject:](v13->_children, "addObject:", v36);
                    -[SKUILockupComponent editorial](v36, "editorial");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v38)
                      v13->_gridType = 1;
                    v4 = v37;
                  }
                  goto LABEL_48;
                }
                break;
              case 2:
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v32 = (void *)objc_msgSend(v4, "copy");
                  objc_msgSend(v32, "setComponentDictionary:", v31);
                  v35 = -[SKUIBrickItem initWithCustomPageContext:]([SKUIBrickItem alloc], "initWithCustomPageContext:", v32);
LABEL_41:
                  v36 = (SKUILockupComponent *)v35;
                  goto LABEL_47;
                }
                break;
              case 3:
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v32 = (void *)objc_msgSend(v4, "copy");
                  objc_msgSend(v32, "setComponentDictionary:", v31);
                  v39 = SKUIEditorialComponent;
                  goto LABEL_46;
                }
                break;
              case 4:
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v32 = (void *)objc_msgSend(v4, "copy");
                  objc_msgSend(v32, "setComponentDictionary:", v31);
                  v39 = SKUIMediaComponent;
LABEL_46:
                  v36 = (SKUILockupComponent *)objc_msgSend([v39 alloc], "initWithCustomPageContext:", v32);
                  if (v36)
LABEL_47:
                    -[NSMutableArray addObject:](v13->_children, "addObject:", v36);
LABEL_48:

LABEL_49:
                }
                break;
              default:
                continue;
            }
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        }
        while (v28);
      }

      -[SKUIGridComponent _reloadMissingItemCount](v13, "_reloadMissingItemCount");
      v21 = v42;
      v14 = v43;
      v23 = v41;
    }

  }
  return v13;
}

- (SKUIGridComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4
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
  SKUIGridComponent *v15;
  SKUIGridComponent *v16;
  SKUIEditorialStyle *p_editorialStyle;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  objc_super v25;

  v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        -[SKUIGridComponent initWithFeaturedContentContext:kind:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  v25.receiver = self;
  v25.super_class = (Class)SKUIGridComponent;
  v15 = -[SKUIPageComponent initWithFeaturedContentContext:kind:](&v25, sel_initWithFeaturedContentContext_kind_, v6, a4);
  v16 = v15;
  if (v15)
  {
    p_editorialStyle = &v15->_editorialStyle;
    SKUIEditorialStyleDefault((uint64_t)&v22);
    v18 = v22;
    v19 = v23;
    *(_QWORD *)&v16->_editorialStyle.titleFontSize = v24;
    *(_OWORD *)&p_editorialStyle->alignment = v18;
    *(_OWORD *)&v16->_editorialStyle.bodyFontSize = v19;
    SKUILockupStyleDefault((uint64_t)&v22);
    v20 = v22;
    v16->_lockupStyle.visibleFields = v23;
    *(_OWORD *)&v16->_lockupStyle.artworkSize = v20;
    -[SKUIGridComponent _setChildrenWithFeaturedContextContext:](v16, "_setChildrenWithFeaturedContextContext:", v6);
  }

  return v16;
}

- (SKUIGridComponent)initWithGridItems:(id)a3
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
  SKUIGridComponent *v13;
  SKUIGridComponent *v14;
  SKUIEditorialStyle *p_editorialStyle;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  __int128 v26;
  id v27;
  uint64_t v28;
  NSMutableArray *children;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  objc_super v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIGridComponent initWithGridItems:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v38.receiver = self;
  v38.super_class = (Class)SKUIGridComponent;
  v13 = -[SKUIGridComponent init](&v38, sel_init);
  v14 = v13;
  if (v13)
  {
    p_editorialStyle = &v13->_editorialStyle;
    SKUIEditorialStyleDefault((uint64_t)&v35);
    v16 = v35;
    v17 = v36;
    *(_QWORD *)&v14->_editorialStyle.titleFontSize = v37;
    *(_OWORD *)&p_editorialStyle->alignment = v16;
    *(_OWORD *)&v14->_editorialStyle.bodyFontSize = v17;
    v14->_gridType = 0;
    SKUILockupStyleDefault((uint64_t)&v35);
    v18 = v35;
    v14->_lockupStyle.visibleFields = v36;
    *(_OWORD *)&v14->_lockupStyle.artworkSize = v18;
    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v20 = v4;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v32 != v23)
            objc_enumerationMutation(v20);
          v25 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          v26 = *(_OWORD *)&v14->_lockupStyle.artworkSize;
          *(_QWORD *)&v36 = v14->_lockupStyle.visibleFields;
          v35 = v26;
          v27 = -[SKUIGridComponent _newLockupComponentWithItem:defaultStyle:](v14, "_newLockupComponentWithItem:defaultStyle:", v25, &v35, (_QWORD)v31);
          objc_msgSend(v19, "addObject:", v27);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v22);
    }

    v28 = objc_msgSend(v19, "mutableCopy");
    children = v14->_children;
    v14->_children = (NSMutableArray *)v28;

    -[SKUIGridComponent _reloadMissingItemCount](v14, "_reloadMissingItemCount");
  }

  return v14;
}

- (SKUIGridComponent)initWithLockups:(id)a3
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
  SKUIGridComponent *v13;
  SKUIGridComponent *v14;
  SKUIEditorialStyle *p_editorialStyle;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  NSMutableArray *children;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  objc_super v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIGridComponent initWithLockups:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v35.receiver = self;
  v35.super_class = (Class)SKUIGridComponent;
  v13 = -[SKUIGridComponent init](&v35, sel_init);
  v14 = v13;
  if (v13)
  {
    p_editorialStyle = &v13->_editorialStyle;
    SKUIEditorialStyleDefault((uint64_t)&v32);
    v16 = v32;
    v17 = v33;
    *(_QWORD *)&v14->_editorialStyle.titleFontSize = v34;
    *(_OWORD *)&p_editorialStyle->alignment = v16;
    *(_OWORD *)&v14->_editorialStyle.bodyFontSize = v17;
    v14->_gridType = 0;
    SKUILockupStyleDefault((uint64_t)&v32);
    v18 = v32;
    v14->_lockupStyle.visibleFields = v33;
    *(_OWORD *)&v14->_lockupStyle.artworkSize = v18;
    v19 = objc_msgSend(v4, "mutableCopy");
    children = v14->_children;
    v14->_children = (NSMutableArray *)v19;

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v21 = v14->_children;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v29 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "editorial", (_QWORD)v28);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
          {
            v14->_gridType = 1;
            goto LABEL_16;
          }
        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v23)
          continue;
        break;
      }
    }
LABEL_16:

    -[SKUIGridComponent _reloadMissingItemCount](v14, "_reloadMissingItemCount");
  }

  return v14;
}

- (SKUIGridComponent)initWithRoomContext:(id)a3 gridType:(int64_t)a4
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
  SKUIGridComponent *v15;
  SKUIGridComponent *v16;
  SKUIEditorialStyle *p_editorialStyle;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  objc_super v25;

  v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        -[SKUIGridComponent initWithRoomContext:gridType:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  v25.receiver = self;
  v25.super_class = (Class)SKUIGridComponent;
  v15 = -[SKUIGridComponent init](&v25, sel_init);
  v16 = v15;
  if (v15)
  {
    p_editorialStyle = &v15->_editorialStyle;
    SKUIEditorialStyleDefault((uint64_t)&v22);
    v18 = v22;
    v19 = v23;
    *(_QWORD *)&v16->_editorialStyle.titleFontSize = v24;
    *(_OWORD *)&p_editorialStyle->alignment = v18;
    *(_OWORD *)&v16->_editorialStyle.bodyFontSize = v19;
    v16->_gridType = a4;
    SKUILockupStyleDefault((uint64_t)&v22);
    v20 = v22;
    v16->_lockupStyle.visibleFields = v23;
    *(_OWORD *)&v16->_lockupStyle.artworkSize = v20;
    if (v16->_gridType == 5)
    {
      v16->_lockupStyle.artworkSize = 1;
      v16->_lockupStyle.visibleFields = 1054;
    }
    -[SKUIGridComponent _setChildrenWithFeaturedContextContext:](v16, "_setChildrenWithFeaturedContextContext:", v6);
  }

  return v16;
}

- (SKUIGridComponent)initWithViewElement:(id)a3
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
  SKUIGridComponent *v13;
  SKUIGridComponent *v14;
  objc_super v16;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIGridComponent initWithViewElement:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIGridComponent;
  v13 = -[SKUIPageComponent initWithViewElement:](&v16, sel_initWithViewElement_, v4);
  v14 = v13;
  if (v13)
    v13->_gridType = 6;

  return v14;
}

- (int64_t)componentType
{
  return 8;
}

- (void)enumerateMissingItemIdentifiersFromIndex:(int64_t)a3 usingBlock:(id)a4
{
  id v6;
  unint64_t gridType;
  id v8;

  v6 = a4;
  gridType = self->_gridType;
  if (gridType < 2)
  {
    v8 = v6;
    -[SKUIPageComponent _enumerateMissingItemIdentifiersFromLockups:startIndex:usingBlock:](self, "_enumerateMissingItemIdentifiersFromLockups:startIndex:usingBlock:", self->_children, a3, v6);
LABEL_5:
    v6 = v8;
    goto LABEL_6;
  }
  if (gridType == 2)
  {
    v8 = v6;
    -[SKUIPageComponent _enumerateMissingItemIdentifiersFromBricks:startIndex:usingBlock:](self, "_enumerateMissingItemIdentifiersFromBricks:startIndex:usingBlock:", self->_children, a3, v6);
    goto LABEL_5;
  }
LABEL_6:

}

- (BOOL)isMissingItemData
{
  return self->_missingItemCount > 0;
}

- (id)metricsElementName
{
  return CFSTR("grid");
}

- (id)_updateWithInvalidItemIdentifiers:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t);
  void *v14;
  id v15;
  id v16;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __55__SKUIGridComponent__updateWithInvalidItemIdentifiers___block_invoke;
  v14 = &unk_1E73A34D0;
  v6 = v4;
  v15 = v6;
  v7 = v5;
  v16 = v7;
  -[SKUIGridComponent enumerateMissingItemIdentifiersFromIndex:usingBlock:](self, "enumerateMissingItemIdentifiersFromIndex:usingBlock:", 0, &v11);
  if (objc_msgSend(v7, "count", v11, v12, v13, v14))
  {
    -[NSMutableArray removeObjectsAtIndexes:](self->_children, "removeObjectsAtIndexes:", v7);
    self->_missingItemCount -= objc_msgSend(v7, "count");
  }
  v8 = v16;
  v9 = v7;

  return v9;
}

uint64_t __55__SKUIGridComponent__updateWithInvalidItemIdentifiers___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
  return result;
}

- (id)_updateWithMissingItems:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  SKUIGridComponent *v13;
  id v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v17 = 0uLL;
  v18 = 0;
  SKUILockupStyleDefault((uint64_t)&v17);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__SKUIGridComponent__updateWithMissingItems___block_invoke;
  v11[3] = &unk_1E73A34F8;
  v12 = v4;
  v13 = self;
  v6 = v5;
  v14 = v6;
  v15 = v17;
  v16 = v18;
  v7 = v4;
  -[SKUIGridComponent enumerateMissingItemIdentifiersFromIndex:usingBlock:](self, "enumerateMissingItemIdentifiersFromIndex:usingBlock:", 0, v11);
  v8 = v14;
  v9 = v6;

  return v9;
}

void __45__SKUIGridComponent__updateWithMissingItems___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(v6 + 72);
    if (v7 < 2)
    {
      objc_msgSend(*(id *)(v6 + 24), "objectAtIndex:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_setItem:", v5);
      v13 = 0uLL;
      v14 = 0;
      if (v8)
        objc_msgSend(v8, "lockupStyle");
      if (objc_msgSend(v5, "itemKind") == 17)
      {
        v11 = *(_OWORD *)(a1 + 56);
        v12 = *(_QWORD *)(a1 + 72);
        v9 = v13;
        v10 = v14;
        if (SKUILockupStyleEqualToLockupStyle(&v11, &v9))
        {
          v14 = 214;
          v11 = v13;
          v12 = 214;
          objc_msgSend(v8, "_setLockupStyle:", &v11);
        }
      }
      goto LABEL_10;
    }
    if (v7 == 2)
    {
      objc_msgSend(*(id *)(v6 + 24), "objectAtIndex:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_setLinkItem:", v5);
LABEL_10:
      objc_msgSend(*(id *)(a1 + 48), "addIndex:", a3);
      --*(_QWORD *)(*(_QWORD *)(a1 + 40) + 104);

    }
  }

}

- (id)_newLockupComponentWithItem:(id)a3 defaultStyle:(SKUILockupStyle *)a4
{
  id v5;
  SKUILockupComponent *v6;
  SKUILockupComponent *v7;
  __int128 v9;
  unint64_t visibleFields;

  v5 = a3;
  if (objc_msgSend(v5, "itemKind") == 17)
    a4->visibleFields = 214;
  v6 = [SKUILockupComponent alloc];
  v9 = *(_OWORD *)&a4->artworkSize;
  visibleFields = a4->visibleFields;
  v7 = -[SKUILockupComponent initWithItem:style:](v6, "initWithItem:style:", v5, &v9);

  return v7;
}

- (void)_reloadMissingItemCount
{
  unint64_t gridType;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t j;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  self->_missingItemCount = 0;
  gridType = self->_gridType;
  if (gridType >= 2)
  {
    if (gridType != 2)
      return;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v4 = self->_children;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "link");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v15, "isActionable") & 1) == 0)
          {
            objc_msgSend(v15, "itemIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
              ++self->_missingItemCount;
          }

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v12);
    }
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v4 = self->_children;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      do
      {
        for (j = 0; j != v6; ++j)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * j);
          objc_msgSend(v9, "item", (_QWORD)v17);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {

          }
          else if (objc_msgSend(v9, "itemIdentifier"))
          {
            ++self->_missingItemCount;
          }
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v6);
    }
  }

}

- (void)_setChildrenWithFeaturedContextContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  NSMutableArray *children;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  SKUILockupComponent *v17;
  id v18;
  id v19;
  uint64_t v20;
  SKUILockupComponent *v21;
  uint64_t v22;
  SKUILockupComponent *v23;
  SKUILockupComponent *v24;
  void *v25;
  void *v26;
  __int128 v27;
  unint64_t visibleFields;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "componentDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("adamIds"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = v5;
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = 24;
    children = self->_children;
    self->_children = v7;

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v25 = v6;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (!v11)
      goto LABEL_16;
    v12 = v11;
    v13 = *(_QWORD *)v30;
    while (1)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v4, "itemForItemIdentifier:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v27 = *(_OWORD *)&self->_lockupStyle.artworkSize;
            visibleFields = self->_lockupStyle.visibleFields;
            v17 = -[SKUIGridComponent _newLockupComponentWithItem:defaultStyle:](self, "_newLockupComponentWithItem:defaultStyle:", v16, &v27);
            goto LABEL_12;
          }
          if ((objc_msgSend(v4, "isUnavailableItemIdentifier:", v15) & 1) == 0)
          {
            v18 = v10;
            v19 = v4;
            v20 = v8;
            v21 = [SKUILockupComponent alloc];
            v22 = objc_msgSend(v15, "longLongValue");
            v27 = *(_OWORD *)&self->_lockupStyle.artworkSize;
            visibleFields = self->_lockupStyle.visibleFields;
            v23 = v21;
            v8 = v20;
            v4 = v19;
            v10 = v18;
            v17 = -[SKUILockupComponent initWithItemIdentifier:style:](v23, "initWithItemIdentifier:style:", v22, &v27);
LABEL_12:
            v24 = v17;
            objc_msgSend(*(id *)((char *)&self->super.super.isa + v8), "addObject:", v17, v25);

          }
          continue;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (!v12)
      {
LABEL_16:

        -[SKUIGridComponent _reloadMissingItemCount](self, "_reloadMissingItemCount");
        v6 = v25;
        v5 = v26;
        break;
      }
    }
  }

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %lu children"), objc_opt_class(), -[NSMutableArray count](self->_children, "count"));
}

- (NSArray)children
{
  return &self->_children->super;
}

- (int64_t)gridType
{
  return self->_gridType;
}

- (SKUILockupStyle)lockupStyle
{
  *retstr = *(SKUILockupStyle *)((char *)self + 80);
  return self;
}

- (BOOL)showsIndexNumbers
{
  return self->_showsIndexNumbers;
}

- (SKUIEditorialStyle)editorialStyle
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].bodyFontWeight;
  *(_OWORD *)&retstr->alignment = *(_OWORD *)&self->titleFontSize;
  *(_OWORD *)&retstr->bodyFontSize = v3;
  *(_QWORD *)&retstr->titleFontSize = self[1].titleFontWeight;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
}

- (void)initWithBrickItems:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithCustomPageContext:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithFeaturedContentContext:(uint64_t)a3 kind:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithGridItems:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithLockups:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithRoomContext:(uint64_t)a3 gridType:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithViewElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
