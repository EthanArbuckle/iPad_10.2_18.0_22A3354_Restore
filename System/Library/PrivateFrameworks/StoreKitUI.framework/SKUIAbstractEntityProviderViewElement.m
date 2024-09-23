@implementation SKUIAbstractEntityProviderViewElement

- (SKUIAbstractEntityProviderViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIAbstractEntityProviderViewElement *v11;
  void *v12;
  uint64_t v13;
  NSString *entityTypeString;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSArray *prefetchedProperties;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIAbstractEntityProviderViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v21.receiver = self;
  v21.super_class = (Class)SKUIAbstractEntityProviderViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v21, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("entityType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
    {
      v13 = objc_msgSend(v12, "copy");
      entityTypeString = v11->_entityTypeString;
      v11->_entityTypeString = (NSString *)v13;

    }
    objc_msgSend(v8, "getAttribute:", CFSTR("prefetchedProperties"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    objc_msgSend(v16, "replaceOccurrencesOfString:withString:options:range:", CFSTR(" "), &stru_1E73A9FB0, 1, 0, objc_msgSend(v16, "length"));
    if (objc_msgSend(v16, "length"))
    {
      objc_msgSend(v16, "componentsSeparatedByString:", CFSTR(","));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
    if (objc_msgSend(v17, "count"))
    {
      v18 = objc_msgSend(v17, "copy");
      prefetchedProperties = v11->_prefetchedProperties;
      v11->_prefetchedProperties = (NSArray *)v18;

    }
  }

  return v11;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUIAbstractEntityProviderViewElement *v4;
  SKUIAbstractEntityProviderViewElement *v5;
  SKUIAbstractEntityProviderViewElement *v6;
  void *v7;
  NSString *v8;
  NSString *entityTypeString;
  void *v10;
  NSArray *v11;
  NSArray *prefetchedProperties;
  objc_super v14;

  v4 = (SKUIAbstractEntityProviderViewElement *)a3;
  v14.receiver = self;
  v14.super_class = (Class)SKUIAbstractEntityProviderViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v14, sel_applyUpdatesWithElement_, v4);
  v5 = (SKUIAbstractEntityProviderViewElement *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self && v5 == self)
  {
    -[SKUIAbstractEntityProviderViewElement entityTypeString](v4, "entityTypeString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (NSString *)objc_msgSend(v7, "copy");
    entityTypeString = self->_entityTypeString;
    self->_entityTypeString = v8;

    -[SKUIAbstractEntityProviderViewElement prefetchedProperties](v4, "prefetchedProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (NSArray *)objc_msgSend(v10, "copy");
    prefetchedProperties = self->_prefetchedProperties;
    self->_prefetchedProperties = v11;

  }
  return v6;
}

- (SKUILimitListViewElement)limitListViewElement
{
  return (SKUILimitListViewElement *)-[SKUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 61);
}

- (SKUIPredicateListViewElement)predicateListViewElement
{
  return (SKUIPredicateListViewElement *)-[SKUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 89);
}

- (SKUISortDescriptorListViewElement)sortDescriptorListViewElement
{
  return (SKUISortDescriptorListViewElement *)-[SKUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 126);
}

- (NSString)entityTypeString
{
  return self->_entityTypeString;
}

- (NSArray)prefetchedProperties
{
  return self->_prefetchedProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefetchedProperties, 0);
  objc_storeStrong((id *)&self->_entityTypeString, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIAbstractEntityProviderViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
