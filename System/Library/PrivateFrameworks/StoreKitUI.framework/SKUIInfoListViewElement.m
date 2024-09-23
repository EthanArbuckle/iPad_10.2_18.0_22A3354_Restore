@implementation SKUIInfoListViewElement

- (SKUIInfoListViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIInfoListViewElement *v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIInfoListViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIInfoListViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v14, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("type"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_infoListType = objc_msgSend(v12, "isEqualToString:", CFSTR("titleAbove"));

  }
  return v11;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUIInfoListViewElement *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = (SKUIInfoListViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SKUIInfoListViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v8, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
    self->_infoListType = -[SKUIInfoListViewElement infoListType](v4, "infoListType");

  return v6;
}

- (void)enumerateChildrenUsingBlock:(id)a3
{
  id v4;
  objc_super v5;
  _QWORD v6[4];
  id v7;

  v6[1] = 3221225472;
  v6[2] = __55__SKUIInfoListViewElement_enumerateChildrenUsingBlock___block_invoke;
  v6[3] = &unk_1E73A1F80;
  v7 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SKUIInfoListViewElement;
  v6[0] = MEMORY[0x1E0C809B0];
  v4 = v7;
  -[SKUIViewElement enumerateChildrenUsingBlock:](&v5, sel_enumerateChildrenUsingBlock_, v6);

}

void __55__SKUIInfoListViewElement_enumerateChildrenUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "elementType") == 56)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (int64_t)pageComponentType
{
  if (self->_infoListType == 1)
    return 27;
  else
    return 26;
}

- (int64_t)infoListType
{
  return self->_infoListType;
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIInfoListViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
