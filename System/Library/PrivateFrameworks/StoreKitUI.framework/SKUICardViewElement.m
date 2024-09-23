@implementation SKUICardViewElement

- (SKUICardViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
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
  SKUICardViewElement *v19;
  void *v20;
  char v21;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v11 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v11)
        -[SKUICardViewElement initWithDOMElement:parent:elementFactory:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)SKUICardViewElement;
  v19 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v23, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v19)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("disabled"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "length"))
      v21 = objc_msgSend(v20, "BOOLValue") ^ 1;
    else
      v21 = -1;
    v19->_enabled = v21;

  }
  return v19;
}

- (int64_t)cardType
{
  void *v2;
  void *v3;
  int64_t v4;

  -[SKUICardViewElement style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cardType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = SKUICardElementTypeForString(v3);

  return v4;
}

- (BOOL)isAdCard
{
  void *v2;
  void *v3;
  char v4;

  -[SKUICardViewElement attributes](self, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("isAdCard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUICardViewElement *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = (SKUICardViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SKUICardViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v8, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
    self->_enabled = v4->_enabled;

  return v6;
}

- (void)enumerateChildrenUsingBlock:(id)a3
{
  id v4;
  objc_super v5;
  _QWORD v6[4];
  id v7;

  v6[1] = 3221225472;
  v6[2] = __51__SKUICardViewElement_enumerateChildrenUsingBlock___block_invoke;
  v6[3] = &unk_1E73A1F80;
  v7 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SKUICardViewElement;
  v6[0] = MEMORY[0x1E0C809B0];
  v4 = v7;
  -[SKUIViewElement enumerateChildrenUsingBlock:](&v5, sel_enumerateChildrenUsingBlock_, v6);

}

void __51__SKUICardViewElement_enumerateChildrenUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  BOOL v4;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(v5, "elementType");
  v4 = (unint64_t)(v3 - 7) > 0x3B || ((1 << (v3 - 7)) & 0x8801E0002000023) == 0;
  if (!v4 || (unint64_t)(v3 - 108) <= 0x2C && ((1 << (v3 - 108)) & 0x100040800001) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (int64_t)pageComponentType
{
  return 24;
}

- (BOOL)isEnabled
{
  int enabled;
  objc_super v4;

  enabled = self->_enabled;
  if (enabled != 255)
    return enabled != 0;
  v4.receiver = self;
  v4.super_class = (Class)SKUICardViewElement;
  return -[SKUIViewElement isEnabled](&v4, sel_isEnabled);
}

- (void)initWithDOMElement:(uint64_t)a3 parent:(uint64_t)a4 elementFactory:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
