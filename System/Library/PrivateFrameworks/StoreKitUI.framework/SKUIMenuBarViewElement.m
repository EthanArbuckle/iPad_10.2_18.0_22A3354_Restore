@implementation SKUIMenuBarViewElement

- (SKUIMenuBarViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  objc_class *v15;
  SKUIMenuBarViewElement *v16;
  SKUIMenuBarViewElement *v17;
  SKUIMenuBarViewElementConfiguration *v18;
  SKUIMenuBarViewElementConfiguration *configuration;
  void *v20;
  uint64_t v21;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMenuBarViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v11 = objc_opt_class();
  if (v11 == objc_opt_class())
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("entityProviderID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "length");

    if (v21)
    {
      v15 = (objc_class *)SKUIDynamicMenuBarViewElement;
      goto LABEL_13;
    }
  }
  v12 = objc_opt_class();
  if (v12 == objc_msgSend((id)objc_opt_class(), "_titlesMenuBarViewElementClass"))
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("type"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("shelf"));

    if (v14)
    {
      v15 = (objc_class *)objc_msgSend((id)objc_opt_class(), "_shelfMenuBarViewElementClass");
LABEL_13:
      v17 = (SKUIMenuBarViewElement *)objc_msgSend([v15 alloc], "initWithDOMElement:parent:elementFactory:", v8, v9, v10);
      goto LABEL_14;
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)SKUIMenuBarViewElement;
  v16 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v23, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  v17 = v16;
  if (v16)
  {
    -[SKUIViewElement featureWithName:](v16, "featureWithName:", *MEMORY[0x1E0D3A380]);
    self = (SKUIMenuBarViewElement *)objc_claimAutoreleasedReturnValue();
    v18 = -[SKUIMenuBarViewElementConfiguration _initWithMenuBarDocument:]([SKUIMenuBarViewElementConfiguration alloc], "_initWithMenuBarDocument:", self);
    configuration = v17->_configuration;
    v17->_configuration = v18;

    -[SKUIMenuBarViewElementConfiguration _setReloadDelegate:](v17->_configuration, "_setReloadDelegate:", v17);
LABEL_14:

  }
  return v17;
}

+ (id)supportedFeatures
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v9[0] = *MEMORY[0x1E0D3A380];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___SKUIMenuBarViewElement;
  objc_msgSendSuper2(&v8, sel_supportedFeatures);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = v3;
  }

  return v6;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUIMenuBarViewElement *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKUIMenuBarViewElement;
  v4 = (SKUIMenuBarViewElement *)a3;
  -[SKUIViewElement applyUpdatesWithElement:](&v7, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != self || objc_msgSend(v5, "updateType", v7.receiver, v7.super_class))
    -[SKUIMenuBarViewElementConfiguration _setNeedsReload:](self->_configuration, "_setNeedsReload:", 1, v7.receiver, v7.super_class);
  return v5;
}

- (void)_menuBarViewElementConfigurationRequestsReload:(id)a3
{
  if (self->_configuration == a3)
    -[SKUIMenuBarViewElement _reloadMenuItems](self, "_reloadMenuItems");
}

- (id)titleForMenuItemAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndex:](self->_titleViewElements, "objectAtIndex:", a3);
}

+ (Class)_titlesMenuBarViewElementClass
{
  return (Class)objc_opt_class();
}

+ (Class)_shelfMenuBarViewElementClass
{
  return (Class)objc_opt_class();
}

- (void)_reloadMenuItems
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[SKUIMenuBarViewElement children](self, "children");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v10, "elementType") == 72)
        {
          v11 = v10;
          objc_msgSend(v11, "firstChildForElementType:", 138);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            if (!v6)
              v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v6, "addObject:", v12);
            if (!v7)
              v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v7, "addObject:", v11);
          }

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  objc_storeStrong((id *)&self->_titleViewElements, v6);
  if (v7 && objc_msgSend(v7, "count"))
  {
    v13 = 1;
  }
  else
  {
    -[SKUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      v13 = 3;
    else
      v13 = 1;
  }
  -[SKUIMenuBarViewElement style](self, "style");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "valueForStyle:", CFSTR("itml-scroll-enabled"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  -[SKUIMenuBarViewElementConfiguration _reloadWithMenuBarStyle:menuItemViewElements:scrollEnabled:](self->_configuration, "_reloadWithMenuBarStyle:menuItemViewElements:scrollEnabled:", v13, v7, v17);
}

- (SKUIMenuBarViewElementConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_titleViewElements, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIMenuBarViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
