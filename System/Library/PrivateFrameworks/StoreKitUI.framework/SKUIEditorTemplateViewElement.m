@implementation SKUIEditorTemplateViewElement

- (SKUIEditorTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIEditorTemplateViewElement *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSNumber *contentId;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIEditorTemplateViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUIEditorTemplateViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v18, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("contentId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = objc_msgSend(v12, "longLongValue");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
      contentId = v11->_contentId;
      v11->_contentId = (NSNumber *)v15;

    }
  }

  return v11;
}

- (NSNumber)contentId
{
  return self->_contentId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentId, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIEditorTemplateViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
