@implementation SKUIURLViewElement

- (SKUIURLViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIURLViewElement *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSURL *url;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIURLViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUIURLViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v18, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "textContent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v13);
      v14 = objc_claimAutoreleasedReturnValue();

      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v14);
      url = v11->_url;
      v11->_url = (NSURL *)v15;

      v12 = (void *)v14;
    }

  }
  return v11;
}

- (NSURL)URL
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIURLViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
