@implementation SKUIShelfMenuBarViewElement

- (SKUIShelfMenuBarViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  SKUIShelfMenuBarViewElement *v12;
  SKUIDynamicShelfMenuBarViewElement *v13;
  SKUIMenuBarViewElementConfiguration *v14;
  SKUIMenuBarViewElementConfiguration *configuration;
  void *v16;
  uint64_t v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIShelfMenuBarViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v11 = objc_opt_class();
  if (v11 == objc_opt_class())
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("entityProviderID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "length");

    if (v17)
    {
      v13 = -[SKUIShelfMenuBarViewElement initWithDOMElement:parent:elementFactory:]([SKUIDynamicShelfMenuBarViewElement alloc], "initWithDOMElement:parent:elementFactory:", v8, v9, v10);
      goto LABEL_10;
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)SKUIShelfMenuBarViewElement;
  v12 = -[SKUIShelfViewElement initWithDOMElement:parent:elementFactory:](&v19, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  v13 = (SKUIDynamicShelfMenuBarViewElement *)v12;
  if (v12)
  {
    -[SKUIViewElement featureWithName:](v12, "featureWithName:", *MEMORY[0x1E0D3A380]);
    self = (SKUIShelfMenuBarViewElement *)objc_claimAutoreleasedReturnValue();
    v14 = -[SKUIMenuBarViewElementConfiguration _initWithMenuBarDocument:]([SKUIMenuBarViewElementConfiguration alloc], "_initWithMenuBarDocument:", self);
    configuration = v13->super._configuration;
    v13->super._configuration = v14;

    -[SKUIMenuBarViewElementConfiguration _setReloadDelegate:](v13->super._configuration, "_setReloadDelegate:", v13);
LABEL_10:

  }
  return &v13->super;
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
  v8.super_class = (Class)&OBJC_METACLASS___SKUIShelfMenuBarViewElement;
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
  SKUIShelfMenuBarViewElement *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKUIShelfMenuBarViewElement;
  v4 = (SKUIShelfMenuBarViewElement *)a3;
  -[SKUIShelfViewElement applyUpdatesWithElement:](&v7, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != self || objc_msgSend(v5, "updateType", v7.receiver, v7.super_class))
    -[SKUIMenuBarViewElementConfiguration _setNeedsReload:](self->_configuration, "_setNeedsReload:", 1, v7.receiver, v7.super_class);
  return v5;
}

- (unint64_t)elementType
{
  return 118;
}

- (void)enumerateChildrenUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SKUIShelfMenuBarViewElement children](self, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__SKUIShelfMenuBarViewElement_enumerateChildrenUsingBlock___block_invoke;
  v7[3] = &unk_1E73A3E58;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

void __59__SKUIShelfMenuBarViewElement_enumerateChildrenUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = objc_msgSend(v7, "elementType") == 72;
  v4 = v7;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "shelfItemViewElementValidator");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (!v5 || (*(unsigned int (**)(uint64_t, id))(v5 + 16))(v5, v7))
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    v4 = v7;
  }

}

- (void)_menuBarViewElementConfigurationRequestsReload:(id)a3
{
  if (self->_configuration == a3)
    -[SKUIShelfMenuBarViewElement _reloadMenuItems](self, "_reloadMenuItems");
}

- (id)regularViewElementForMenuItemAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndex:](self->_regularViewElements, "objectAtIndex:", a3);
}

- (id)focusedViewElementForMenuItemAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndex:](self->_focusedViewElements, "objectAtIndex:", a3);
}

- (void)_reloadMenuItems
{
  SKUIShelfMenuBarViewElement *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSArray *focusedViewElements;
  uint64_t v21;
  NSArray *regularViewElements;
  void *v23;
  SKUIShelfMenuBarViewElement *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  int v28;
  SKUIShelfMenuBarViewElement *v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v2 = self;
  v39 = *MEMORY[0x1E0C80C00];
  -[SKUIShelfMenuBarViewElement style](self, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForStyle:", CFSTR("itml-shelf-layout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("zooming"));

  if (v5)
  {
    v28 = v5;
    v29 = v2;
    -[SKUIShelfMenuBarViewElement children](v2, "children");
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      v11 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v35 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          v31 = 0;
          v32 = 0;
          v33 = 0;
          SKUIZoomingShelfMenuBarGetValidationInfoForViewElement(v13, (uint64_t)&v31);
          if ((_BYTE)v31)
          {
            v14 = v13;
            objc_msgSend(v14, "children");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectAtIndex:", v32);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectAtIndex:", v33);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v10)
              v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v10, "addObject:", v14);
            if (!v9)
              v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v9, "addObject:", v16);
            if (!v8)
              v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v8, "addObject:", v17);

          }
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v7);
    }
    else
    {
      v8 = 0;
      v9 = 0;
      v10 = 0;
    }

    v18 = 2;
    v2 = v29;
    v5 = v28;
  }
  else
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v18 = 0;
  }
  v19 = objc_msgSend(v9, "copy");
  focusedViewElements = v2->_focusedViewElements;
  v2->_focusedViewElements = (NSArray *)v19;

  v21 = objc_msgSend(v8, "copy");
  regularViewElements = v2->_regularViewElements;
  v2->_regularViewElements = (NSArray *)v21;

  if (v5)
  {
    v23 = &__block_literal_global_14;
    v24 = v2;
  }
  else
  {
    v24 = v2;
    v23 = 0;
  }
  -[SKUIShelfViewElement setShelfItemViewElementValidator:](v24, "setShelfItemViewElementValidator:", v23);
  -[SKUIShelfMenuBarViewElement style](v2, "style");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "valueForStyle:", CFSTR("itml-scroll-enabled"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "BOOLValue");

  -[SKUIMenuBarViewElementConfiguration _reloadWithMenuBarStyle:menuItemViewElements:scrollEnabled:](v2->_configuration, "_reloadWithMenuBarStyle:menuItemViewElements:scrollEnabled:", v18, v10, v27);
}

uint64_t __47__SKUIShelfMenuBarViewElement__reloadMenuItems__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[3];

  memset(v3, 0, sizeof(v3));
  SKUIZoomingShelfMenuBarGetValidationInfoForViewElement(a2, (uint64_t)v3);
  return LOBYTE(v3[0]);
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
  objc_storeStrong((id *)&self->_regularViewElements, 0);
  objc_storeStrong((id *)&self->_focusedViewElements, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIShelfMenuBarViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
