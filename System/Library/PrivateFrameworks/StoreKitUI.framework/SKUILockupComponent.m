@implementation SKUILockupComponent

- (SKUILockupComponent)initWithCustomPageContext:(id)a3
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
  SKUILockupComponent *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  SKUIItem *item;
  void *v18;
  void *v19;
  SKUIEditorialComponent *v20;
  SKUIEditorialComponent *editorial;
  SKUIEditorialComponent *v22;
  void *v23;
  __int128 v25;
  unint64_t v26;
  objc_super v27;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUILockupComponent initWithCustomPageContext:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v27.receiver = self;
  v27.super_class = (Class)SKUILockupComponent;
  v13 = -[SKUIPageComponent initWithCustomPageContext:](&v27, sel_initWithCustomPageContext_, v4);
  if (v13)
  {
    objc_msgSend(v4, "componentDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("adamId"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "itemForItemIdentifier:", v15);
      v16 = objc_claimAutoreleasedReturnValue();
      item = v13->_item;
      v13->_item = (SKUIItem *)v16;

      v13->_itemIdentifier = objc_msgSend(v15, "longLongValue");
    }
    objc_msgSend(v14, "objectForKey:", CFSTR("editorial"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = (void *)objc_msgSend(v4, "copy");
      objc_msgSend(v19, "setComponentDictionary:", v18);
      v20 = -[SKUIEditorialComponent initWithCustomPageContext:]([SKUIEditorialComponent alloc], "initWithCustomPageContext:", v19);
      editorial = v13->_editorial;
      v13->_editorial = v20;

      if (-[SKUIEditorialComponent _usesLockupTitle](v13->_editorial, "_usesLockupTitle"))
      {
        v22 = v13->_editorial;
        -[SKUIItem title](v13->_item, "title");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIEditorialComponent _setTitleText:](v22, "_setTitleText:", v23);

      }
    }
    SKUILockupStyleForDictionary(v14, v4, (uint64_t)&v25);
    *(_OWORD *)&v13->_lockupStyle.artworkSize = v25;
    v13->_lockupStyle.visibleFields = v26;

  }
  return v13;
}

- (SKUILockupComponent)initWithItemIdentifier:(int64_t)a3 style:(SKUILockupStyle *)a4
{
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  SKUILockupComponent *result;
  __int128 v16;
  objc_super v17;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        -[SKUILockupComponent initWithItemIdentifier:style:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUILockupComponent;
  result = -[SKUILockupComponent init](&v17, sel_init);
  if (result)
  {
    result->_itemIdentifier = a3;
    v16 = *(_OWORD *)&a4->artworkSize;
    result->_lockupStyle.visibleFields = a4->visibleFields;
    *(_OWORD *)&result->_lockupStyle.artworkSize = v16;
  }
  return result;
}

- (SKUILockupComponent)initWithItem:(id)a3 style:(SKUILockupStyle *)a4
{
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SKUILockupComponent *v16;
  unint64_t visibleFields;
  objc_super v19;

  v7 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUILockupComponent initWithItem:style:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)SKUILockupComponent;
  v16 = -[SKUILockupComponent init](&v19, sel_init);
  if (v16)
  {
    v16->_itemIdentifier = objc_msgSend(v7, "itemIdentifier");
    objc_storeStrong((id *)&v16->_item, a3);
    visibleFields = a4->visibleFields;
    *(_OWORD *)&v16->_lockupStyle.artworkSize = *(_OWORD *)&a4->artworkSize;
    v16->_lockupStyle.visibleFields = visibleFields;
  }

  return v16;
}

- (SKUILockupComponent)initWithViewElement:(id)a3
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
  SKUILockupComponent *v13;
  objc_super v15;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUILockupComponent initWithViewElement:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUILockupComponent;
  v13 = -[SKUIPageComponent initWithViewElement:](&v15, sel_initWithViewElement_, v4);

  return v13;
}

- (int64_t)componentType
{
  return 9;
}

- (BOOL)_needsItemData
{
  void *v2;
  void *v3;
  int v4;

  -[SKUIItem artworksProvider](self->_item, "artworksProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "hasArtwork") ^ 1;
  else
    LOBYTE(v4) = 1;

  return v4;
}

- (void)_setItem:(id)a3
{
  SKUIItem *v5;
  SKUIItem **p_item;
  _BOOL4 v7;
  SKUIEditorialComponent *editorial;
  void *v9;
  SKUIItem *v10;

  v5 = (SKUIItem *)a3;
  p_item = &self->_item;
  if (self->_item != v5)
  {
    v10 = v5;
    objc_storeStrong((id *)&self->_item, a3);
    v7 = -[SKUIEditorialComponent _usesLockupTitle](self->_editorial, "_usesLockupTitle");
    v5 = v10;
    if (v7)
    {
      editorial = self->_editorial;
      -[SKUIItem title](*p_item, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUIEditorialComponent _setTitleText:](editorial, "_setTitleText:", v9);

      v5 = v10;
    }
  }

}

- (void)_setLockupStyle:(SKUILockupStyle *)a3
{
  unint64_t visibleFields;

  visibleFields = a3->visibleFields;
  *(_OWORD *)&self->_lockupStyle.artworkSize = *(_OWORD *)&a3->artworkSize;
  self->_lockupStyle.visibleFields = visibleFields;
}

- (SKUIEditorialComponent)editorial
{
  return self->_editorial;
}

- (SKUIItem)item
{
  return self->_item;
}

- (int64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (SKUILockupStyle)lockupStyle
{
  *retstr = self[2];
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_editorial, 0);
}

- (void)initWithCustomPageContext:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithItemIdentifier:(uint64_t)a3 style:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithItem:(uint64_t)a3 style:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)initWithViewElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
