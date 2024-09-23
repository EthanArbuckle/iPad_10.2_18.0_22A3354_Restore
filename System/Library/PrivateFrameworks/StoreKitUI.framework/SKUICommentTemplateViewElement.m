@implementation SKUICommentTemplateViewElement

- (SKUICommentTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUICommentTemplateViewElement *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v26;
  id v27;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUICommentTemplateViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v28.receiver = self;
  v28.super_class = (Class)SKUICommentTemplateViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v28, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("postPlaceholderText"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_storeStrong((id *)&v11->_postPlaceholderText, v12);
    objc_msgSend(v8, "getAttribute:", CFSTR("postButtonText"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_storeStrong((id *)&v11->_postButtonText, v13);
    objc_msgSend(v8, "getAttribute:", CFSTR("scrollNewCommentToView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "lowercaseString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v11->_scrollNewCommentToView = objc_msgSend(v16, "isEqualToString:", CFSTR("true"));

    }
    objc_msgSend(v8, "getAttribute:", CFSTR("showKeyboard"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      objc_msgSend(v17, "lowercaseString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v11->_showKeyboard = objc_msgSend(v19, "isEqualToString:", CFSTR("true"));

    }
    objc_msgSend(v8, "getAttribute:", CFSTR("asText"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      objc_storeStrong((id *)&v11->_asText, v20);
    v27 = v10;
    objc_msgSend(v8, "getAttribute:", CFSTR("asFormat"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
      objc_storeStrong((id *)&v11->_asFormat, v21);
    v22 = v9;
    objc_msgSend(v8, "getAttribute:", CFSTR("commentAsText"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
      objc_storeStrong((id *)&v11->_commentAsText, v23);
    objc_msgSend(v8, "getAttribute:", CFSTR("myselfText"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      objc_storeStrong((id *)&v11->_myselfText, v24);

    v9 = v22;
    v10 = v27;
  }

  return v11;
}

- (NSString)asText
{
  return self->_asText;
}

- (NSString)asFormat
{
  return self->_asFormat;
}

- (NSString)commentAsText
{
  return self->_commentAsText;
}

- (NSString)myselfText
{
  return self->_myselfText;
}

- (NSString)postButtonText
{
  return self->_postButtonText;
}

- (NSString)postPlaceholderText
{
  return self->_postPlaceholderText;
}

- (BOOL)scrollNewCommentToView
{
  return self->_scrollNewCommentToView;
}

- (BOOL)showKeyboard
{
  return self->_showKeyboard;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postPlaceholderText, 0);
  objc_storeStrong((id *)&self->_postButtonText, 0);
  objc_storeStrong((id *)&self->_myselfText, 0);
  objc_storeStrong((id *)&self->_commentAsText, 0);
  objc_storeStrong((id *)&self->_asFormat, 0);
  objc_storeStrong((id *)&self->_asText, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUICommentTemplateViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
