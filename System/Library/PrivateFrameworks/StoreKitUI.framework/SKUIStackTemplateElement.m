@implementation SKUIStackTemplateElement

- (SKUIStackTemplateElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIStackTemplateElement *v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIStackTemplateElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIStackTemplateElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v14, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("resetState"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_needsStateReset = objc_msgSend(v12, "BOOLValue");

  }
  return v11;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUIStackTemplateElement *v4;
  void *v5;
  NSMutableArray *collectionElements;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKUIStackTemplateElement;
  v4 = (SKUIStackTemplateElement *)a3;
  -[SKUIViewElement applyUpdatesWithElement:](&v8, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != self || objc_msgSend(v5, "updateType", v8.receiver, v8.super_class))
  {
    collectionElements = self->_collectionElements;
    self->_collectionElements = 0;

  }
  return v5;
}

- (NSArray)collectionElements
{
  NSMutableArray *collectionElements;
  NSMutableArray *v4;
  NSMutableArray *v5;
  _QWORD v7[5];

  collectionElements = self->_collectionElements;
  if (!collectionElements)
  {
    v4 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    v5 = self->_collectionElements;
    self->_collectionElements = v4;

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__SKUIStackTemplateElement_collectionElements__block_invoke;
    v7[3] = &unk_1E73A12A8;
    v7[4] = self;
    -[SKUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v7);
    collectionElements = self->_collectionElements;
  }
  return (NSArray *)collectionElements;
}

void __46__SKUIStackTemplateElement_collectionElements__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  v7 = a2;
  v5 = objc_msgSend(v7, "elementType");
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 280);
  if (v5 == 20)
  {
    objc_msgSend(v6, "removeAllObjects");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __46__SKUIStackTemplateElement_collectionElements__block_invoke_2;
    v8[3] = &unk_1E73A12A8;
    v8[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "enumerateChildrenUsingBlock:", v8);
    *a3 = 1;
  }
  else
  {
    objc_msgSend(v6, "addObject:", v7);
  }

}

uint64_t __46__SKUIStackTemplateElement_collectionElements__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "addObject:", a2);
}

- (SKUIViewElement)collectionHeaderViewElement
{
  SKUIViewElement *collectionHeaderViewElement;
  _QWORD v5[5];

  collectionHeaderViewElement = self->_collectionHeaderViewElement;
  if (!collectionHeaderViewElement)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __55__SKUIStackTemplateElement_collectionHeaderViewElement__block_invoke;
    v5[3] = &unk_1E73A12A8;
    v5[4] = self;
    -[SKUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v5);
    collectionHeaderViewElement = self->_collectionHeaderViewElement;
  }
  return collectionHeaderViewElement;
}

void __55__SKUIStackTemplateElement_collectionHeaderViewElement__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "elementType") == 107)
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 288), a2);

}

- (SKUIIndexBarViewElement)indexBarViewElement
{
  return (SKUIIndexBarViewElement *)-[SKUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 53);
}

- (SKUINavigationBarViewElement)navigationBarElement
{
  return (SKUINavigationBarViewElement *)-[SKUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 74);
}

- (SKUIToolbarViewElement)toolbarElement
{
  return (SKUIToolbarViewElement *)-[SKUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 145);
}

- (int64_t)numberOfSplits
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
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__SKUIStackTemplateElement_numberOfSplits__block_invoke;
  v4[3] = &unk_1E73A01D0;
  v4[4] = &v5;
  -[SKUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __42__SKUIStackTemplateElement_numberOfSplits__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "elementType");
  if (result == 128)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

- (BOOL)needsStateReset
{
  return self->_needsStateReset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionHeaderViewElement, 0);
  objc_storeStrong((id *)&self->_collectionElements, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIStackTemplateElement initWithDOMElement:parent:elementFactory:]";
}

@end
