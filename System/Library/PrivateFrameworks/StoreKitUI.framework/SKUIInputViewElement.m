@implementation SKUIInputViewElement

- (SKUIInputViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  SKUIInputViewElement *v12;
  void *v13;
  __objc2_class *v14;
  objc_super v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIInputViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v11 = objc_opt_class();
  if (v11 == objc_opt_class())
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("type"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("checkbox")))
    {
      v14 = SKUICheckboxInputViewElement;
    }
    else if (+[SKUITextInputViewElement isTextInputType:](SKUITextInputViewElement, "isTextInputType:", v13))
    {
      v14 = SKUITextInputViewElement;
    }
    else if (objc_msgSend(v13, "isEqualToString:", CFSTR("search")))
    {
      v14 = SKUISearchBarViewElement;
    }
    else
    {
      if (!objc_msgSend(v13, "isEqualToString:", CFSTR("submit")))
      {
        v16.receiver = self;
        v16.super_class = (Class)SKUIInputViewElement;
        v12 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v16, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
        goto LABEL_16;
      }
      v14 = SKUISubmitInputViewElement;
    }
    v12 = (SKUIInputViewElement *)objc_msgSend([v14 alloc], "initWithDOMElement:parent:elementFactory:", v8, v9, v10);

LABEL_16:
    goto LABEL_17;
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUIInputViewElement;
  v12 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v17, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
LABEL_17:

  return v12;
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIInputViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
