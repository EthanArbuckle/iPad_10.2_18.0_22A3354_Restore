@implementation SKUIMenuViewElement

- (SKUIMenuViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIMenuViewElement *v11;
  void *v12;
  char v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMenuViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIMenuViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v15, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("disabled"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
      v13 = objc_msgSend(v12, "BOOLValue") ^ 1;
    else
      v13 = -1;
    v11->_enabled = v13;

  }
  return v11;
}

- (void)dispatchEventOfType:(unint64_t)a3 forItemAtIndex:(int64_t)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__SKUIMenuViewElement_dispatchEventOfType_forItemAtIndex___block_invoke;
  v4[3] = &__block_descriptor_48_e36_v32__0__SKUIItemViewElement_8Q16_B24l;
  v4[4] = a4;
  v4[5] = a3;
  -[SKUIMenuViewElement _enumerateItemElementsUsingBlock:](self, "_enumerateItemElementsUsingBlock:", v4);
}

uint64_t __58__SKUIMenuViewElement_dispatchEventOfType_forItemAtIndex___block_invoke(uint64_t result, void *a2, uint64_t a3, _BYTE *a4)
{
  if (*(_QWORD *)(result + 32) == a3)
  {
    result = objc_msgSend(a2, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", *(_QWORD *)(result + 40), 1, 1, 0, 0);
    *a4 = 1;
  }
  return result;
}

- (NSArray)menuItemTitles
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__SKUIMenuViewElement_menuItemTitles__block_invoke;
  v6[3] = &unk_1E73A4C80;
  v4 = v3;
  v7 = v4;
  -[SKUIMenuViewElement _enumerateItemElementsUsingBlock:](self, "_enumerateItemElementsUsingBlock:", v6);

  return (NSArray *)v4;
}

void __37__SKUIMenuViewElement_menuItemTitles__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "itemText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
}

- (int64_t)selectedItemIndex
{
  int64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = -1;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__SKUIMenuViewElement_selectedItemIndex__block_invoke;
  v4[3] = &unk_1E73A4C58;
  v4[4] = &v5;
  -[SKUIMenuViewElement _enumerateItemElementsUsingBlock:](self, "_enumerateItemElementsUsingBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __40__SKUIMenuViewElement_selectedItemIndex__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isSelected");
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (SKUIItemViewElement)titleItem
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__88;
  v9 = __Block_byref_object_dispose__88;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__SKUIMenuViewElement_titleItem__block_invoke;
  v4[3] = &unk_1E73A4C58;
  v4[4] = &v5;
  -[SKUIMenuViewElement _enumerateItemElementsUsingBlock:](self, "_enumerateItemElementsUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SKUIItemViewElement *)v2;
}

void __32__SKUIMenuViewElement_titleItem__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "isSelected"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
  else if (!a3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUIMenuViewElement *v4;
  SKUIMenuViewElement *v5;
  SKUIMenuViewElement *v6;
  objc_super v8;

  v4 = (SKUIMenuViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SKUIMenuViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v8, sel_applyUpdatesWithElement_, v4);
  v5 = (SKUIMenuViewElement *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self && v5 == self)
    self->_enabled = v4->_enabled;

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
  v4.super_class = (Class)SKUIMenuViewElement;
  return -[SKUIViewElement isEnabled](&v4, sel_isEnabled);
}

- (void)_enumerateItemElementsUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD *v8;
  _QWORD v9[4];

  v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__SKUIMenuViewElement__enumerateItemElementsUsingBlock___block_invoke;
  v6[3] = &unk_1E73A4498;
  v5 = v4;
  v7 = v5;
  v8 = v9;
  -[SKUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v6);

  _Block_object_dispose(v9, 8);
}

void __56__SKUIMenuViewElement__enumerateItemElementsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "elementType") == 59)
  {
    objc_msgSend(v5, "itemText");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "string");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    }

  }
}

- (SKUILabelViewElement)menuLabel
{
  return self->_menuLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuLabel, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIMenuViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
