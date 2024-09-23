@implementation SKUICollectionListViewElement

- (SKUICollectionListViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUICollectionListViewElement *v11;
  SKUICollectionListViewElement *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUICollectionListViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v24.receiver = self;
  v24.super_class = (Class)SKUICollectionListViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v24, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  v12 = v11;
  if (v11)
  {
    v19 = v8;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[SKUICollectionListViewElement children](v11, "children");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v21;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v13);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            NSLog(CFSTR("OMG SEARCH IN A COLLECTION"));
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v15);
    }

    v8 = v19;
  }

  return v12;
}

- (SKUISearchBarViewElement)searchHeader
{
  return self->_searchHeader;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchHeader, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUICollectionListViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
