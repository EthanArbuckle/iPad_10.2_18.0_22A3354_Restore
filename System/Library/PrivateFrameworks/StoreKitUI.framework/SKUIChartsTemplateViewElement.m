@implementation SKUIChartsTemplateViewElement

- (SKUIChartsTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIChartsTemplateViewElement *v11;
  uint64_t v12;
  NSString *type;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIChartsTemplateViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIChartsTemplateViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v15, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("type"));
    v12 = objc_claimAutoreleasedReturnValue();
    type = v11->_type;
    v11->_type = (NSString *)v12;

  }
  return v11;
}

- (SKUIActivityIndicatorViewElement)activityIndicator
{
  return (SKUIActivityIndicatorViewElement *)-[SKUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 4);
}

- (NSArray)columns
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__SKUIChartsTemplateViewElement_columns__block_invoke;
  v6[3] = &unk_1E73A12A8;
  v4 = v3;
  v7 = v4;
  -[SKUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v6);

  return (NSArray *)v4;
}

void __40__SKUIChartsTemplateViewElement_columns__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "elementType") == 21)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (SKUINavigationBarViewElement)navigationBarElement
{
  return (SKUINavigationBarViewElement *)-[SKUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 74);
}

- (NSString)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIChartsTemplateViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
