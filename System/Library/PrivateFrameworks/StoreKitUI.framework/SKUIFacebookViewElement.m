@implementation SKUIFacebookViewElement

- (SKUIFacebookViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  SKUIFacebookViewElement *v19;
  void *v20;
  uint64_t v21;
  NSString *urlString;
  objc_super v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v11 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v11)
        -[SKUIFacebookViewElement initWithDOMElement:parent:elementFactory:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)SKUIFacebookViewElement;
  v19 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v24, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v19)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("type"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19->_facebookType = SKUIFacebookViewElementTypeForString(v20);

    objc_msgSend(v8, "getAttribute:", CFSTR("url"));
    v21 = objc_claimAutoreleasedReturnValue();
    urlString = v19->_urlString;
    v19->_urlString = (NSString *)v21;

  }
  return v19;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUIFacebookViewElement *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *urlString;
  objc_super v10;

  v4 = (SKUIFacebookViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SKUIFacebookViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v10, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    self->_facebookType = -[SKUIFacebookViewElement facebookType](v4, "facebookType");
    -[SKUIFacebookViewElement URLString](v4, "URLString");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    urlString = self->_urlString;
    self->_urlString = v7;

  }
  return v6;
}

- (int64_t)pageComponentType
{
  return 20;
}

- (int64_t)facebookType
{
  return self->_facebookType;
}

- (NSString)URLString
{
  return self->_urlString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlString, 0);
}

- (void)initWithDOMElement:(uint64_t)a3 parent:(uint64_t)a4 elementFactory:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
