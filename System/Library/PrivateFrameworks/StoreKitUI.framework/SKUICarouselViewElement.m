@implementation SKUICarouselViewElement

- (SKUICarouselViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUICarouselViewElement *v11;
  void *v12;
  double v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUICarouselViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUICarouselViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v15, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("displayInterval"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
      objc_msgSend(v12, "doubleValue");
    else
      v13 = -1.0;
    v11->_displayInterval = v13;

  }
  return v11;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUICarouselViewElement *v4;
  void *v5;
  void *v6;
  double v7;
  objc_super v9;

  v4 = (SKUICarouselViewElement *)a3;
  v9.receiver = self;
  v9.super_class = (Class)SKUICarouselViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v9, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    -[SKUICarouselViewElement displayInterval](v4, "displayInterval");
    self->_displayInterval = v7;
  }

  return v6;
}

- (void)enumerateChildrenUsingBlock:(id)a3
{
  id v4;
  objc_super v5;
  _QWORD v6[4];
  id v7;

  v6[1] = 3221225472;
  v6[2] = __55__SKUICarouselViewElement_enumerateChildrenUsingBlock___block_invoke;
  v6[3] = &unk_1E73A1F80;
  v7 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SKUICarouselViewElement;
  v6[0] = MEMORY[0x1E0C809B0];
  v4 = v7;
  -[SKUIViewElement enumerateChildrenUsingBlock:](&v5, sel_enumerateChildrenUsingBlock_, v6);

}

void __55__SKUICarouselViewElement_enumerateChildrenUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  BOOL v4;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(v5, "elementType");
  v4 = (unint64_t)(v3 - 14) > 0x34 || ((1 << (v3 - 14)) & 0x10000800004001) == 0;
  if (!v4 || v3 == 152)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (int64_t)pageComponentType
{
  return 18;
}

- (SKUIProgressIndicatorViewElement)progressIndicatorElement
{
  void *v2;
  id v3;
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
  v9 = __Block_byref_object_copy__10;
  v10 = __Block_byref_object_dispose__10;
  v11 = 0;
  -[SKUICarouselViewElement children](self, "children");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__SKUICarouselViewElement_progressIndicatorElement__block_invoke;
  v5[3] = &unk_1E73A2250;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SKUIProgressIndicatorViewElement *)v3;
}

void __51__SKUICarouselViewElement_progressIndicatorElement__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "elementType") == 95)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (double)displayInterval
{
  return self->_displayInterval;
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUICarouselViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
