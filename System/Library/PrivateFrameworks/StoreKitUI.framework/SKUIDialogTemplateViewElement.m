@implementation SKUIDialogTemplateViewElement

- (SKUIDialogTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIDialogTemplateViewElement *v11;
  void *v12;
  uint64_t v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIDialogTemplateViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIDialogTemplateViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v15, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("type"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("actionSheet")))
    {
      v13 = 1;
    }
    else if (objc_msgSend(v12, "isEqualToString:", CFSTR("error")))
    {
      v13 = 3;
    }
    else if (objc_msgSend(v12, "isEqualToString:", CFSTR("itemActionSheet")))
    {
      v13 = 2;
    }
    else
    {
      if (!objc_msgSend(v12, "isEqualToString:", CFSTR("toast")))
      {
        v11->_dialogType = 0;
        goto LABEL_15;
      }
      v13 = 4;
    }
    v11->_dialogType = v13;
LABEL_15:

  }
  return v11;
}

- (NSArray)buttons
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__SKUIDialogTemplateViewElement_buttons__block_invoke;
  v6[3] = &unk_1E73A12A8;
  v4 = v3;
  v7 = v4;
  -[SKUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v6);

  return (NSArray *)v4;
}

void __40__SKUIDialogTemplateViewElement_buttons__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "elementType") == 12)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (SKUILabelViewElement)message
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
  v8 = __Block_byref_object_copy__17;
  v9 = __Block_byref_object_dispose__17;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__SKUIDialogTemplateViewElement_message__block_invoke;
  v4[3] = &unk_1E73A01D0;
  v4[4] = &v5;
  -[SKUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SKUILabelViewElement *)v2;
}

void __40__SKUIDialogTemplateViewElement_message__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "elementType") == 138 && objc_msgSend(v6, "labelViewStyle") != 5)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (SKUILabelViewElement)title
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
  v8 = __Block_byref_object_copy__17;
  v9 = __Block_byref_object_dispose__17;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__SKUIDialogTemplateViewElement_title__block_invoke;
  v4[3] = &unk_1E73A01D0;
  v4[4] = &v5;
  -[SKUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SKUILabelViewElement *)v2;
}

void __38__SKUIDialogTemplateViewElement_title__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "elementType") == 138 && objc_msgSend(v6, "labelViewStyle") == 5)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (SKUIImageViewElement)image
{
  return (SKUIImageViewElement *)-[SKUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 49);
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUIDialogTemplateViewElement *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = (SKUIDialogTemplateViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SKUIDialogTemplateViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v8, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
    self->_dialogType = -[SKUIDialogTemplateViewElement dialogType](v4, "dialogType");

  return v6;
}

- (int64_t)dialogType
{
  return self->_dialogType;
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIDialogTemplateViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
