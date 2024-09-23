@implementation SKUIColumnViewElement

- (SKUIColumnViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIColumnViewElement *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIColumnViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIColumnViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v16, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("span"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
    {
      v13 = objc_msgSend(v12, "integerValue");
      if (v13 <= 1)
        v14 = 1;
      else
        v14 = v13;
    }
    else
    {
      v14 = 1;
    }
    v11->_columnSpan = v14;

  }
  return v11;
}

- (SKUIHeaderViewElement)headerElement
{
  id v2;
  objc_super v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__64;
  v10 = __Block_byref_object_dispose__64;
  v11 = 0;
  v5[1] = 3221225472;
  v5[2] = __38__SKUIColumnViewElement_headerElement__block_invoke;
  v5[3] = &unk_1E73A01D0;
  v5[4] = &v6;
  v4.receiver = self;
  v4.super_class = (Class)SKUIColumnViewElement;
  v5[0] = MEMORY[0x1E0C809B0];
  -[SKUIViewElement enumerateChildrenUsingBlock:](&v4, sel_enumerateChildrenUsingBlock_, v5);
  v2 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SKUIHeaderViewElement *)v2;
}

void __38__SKUIColumnViewElement_headerElement__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "elementType") == 48)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (id)applyUpdatesWithElement:(id)a3
{
  id v4;
  SKUIColumnViewElement *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SKUIColumnViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v7, sel_applyUpdatesWithElement_, v4);
  v5 = (SKUIColumnViewElement *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
    self->_columnSpan = objc_msgSend(v4, "columnSpan");

  return v5;
}

- (void)enumerateChildrenUsingBlock:(id)a3
{
  id v4;
  objc_super v5;
  _QWORD v6[4];
  id v7;
  objc_super v8;

  v4 = a3;
  if (-[SKUIViewElement descendsFromElementWithType:](self, "descendsFromElementWithType:", 17))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __53__SKUIColumnViewElement_enumerateChildrenUsingBlock___block_invoke;
    v6[3] = &unk_1E73A1F80;
    v7 = v4;
    v5.receiver = self;
    v5.super_class = (Class)SKUIColumnViewElement;
    -[SKUIViewElement enumerateChildrenUsingBlock:](&v5, sel_enumerateChildrenUsingBlock_, v6);

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SKUIColumnViewElement;
    -[SKUIViewElement enumerateChildrenUsingBlock:](&v8, sel_enumerateChildrenUsingBlock_, v4);
  }

}

void __53__SKUIColumnViewElement_enumerateChildrenUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "elementType") != 48)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (int64_t)pageComponentType
{
  return 8;
}

- (int64_t)columnSpan
{
  return self->_columnSpan;
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIColumnViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
