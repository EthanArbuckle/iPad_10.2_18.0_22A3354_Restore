@implementation SKUIEntityProviderListViewElement

- (SKUIEntityProviderListViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIEntityProviderListViewElement *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  NSDictionary *entityProviders;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIEntityProviderListViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v29.receiver = self;
  v29.super_class = (Class)SKUIEntityProviderListViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v29, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    v23 = v9;
    v24 = v8;
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[SKUIEntityProviderListViewElement children](v11, "children");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v26 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v18, "elementID", v23, v24);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v19, "length") && objc_msgSend(v18, "conformsToProtocol:", &unk_1EF4C5E80))
            objc_msgSend(v12, "setObject:forKey:", v18, v19);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v15);
    }

    v20 = objc_msgSend(v12, "copy");
    entityProviders = v11->_entityProviders;
    v11->_entityProviders = (NSDictionary *)v20;

    v9 = v23;
    v8 = v24;
  }

  return v11;
}

- (id)entityProviderWithIdentifier:(id)a3
{
  return -[NSDictionary objectForKey:](self->_entityProviders, "objectForKey:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityProviders, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIEntityProviderListViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
