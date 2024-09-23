@implementation SKUIPreviewControlViewElement

- (SKUIPreviewControlViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIPreviewControlViewElement *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  NSString *mediaURLString;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIPreviewControlViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUIPreviewControlViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v18, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("disabled"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
      v13 = objc_msgSend(v12, "BOOLValue") ^ 1;
    else
      v13 = -1;
    v11->_enabled = v13;
    objc_msgSend(v8, "getAttribute:", CFSTR("data-content-id"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "length"))
      v11->_itemIdentifier = objc_msgSend(v14, "longLongValue");
    objc_msgSend(v8, "getAttribute:", CFSTR("preview-url"));
    v15 = objc_claimAutoreleasedReturnValue();
    mediaURLString = v11->_mediaURLString;
    v11->_mediaURLString = (NSString *)v15;

  }
  return v11;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUIPreviewControlViewElement *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *mediaURLString;
  objc_super v10;

  v4 = (SKUIPreviewControlViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SKUIPreviewControlViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v10, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    self->_enabled = v4->_enabled;
    self->_itemIdentifier = -[SKUIPreviewControlViewElement itemIdentifier](v4, "itemIdentifier");
    -[SKUIPreviewControlViewElement mediaURLString](v4, "mediaURLString");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    mediaURLString = self->_mediaURLString;
    self->_mediaURLString = v7;

  }
  return v6;
}

- (BOOL)isEnabled
{
  int enabled;
  objc_super v4;

  enabled = self->_enabled;
  if (enabled != 255)
    return enabled != 0;
  v4.receiver = self;
  v4.super_class = (Class)SKUIPreviewControlViewElement;
  return -[SKUIViewElement isEnabled](&v4, sel_isEnabled);
}

- (int64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSString)mediaURLString
{
  return self->_mediaURLString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaURLString, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIPreviewControlViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
