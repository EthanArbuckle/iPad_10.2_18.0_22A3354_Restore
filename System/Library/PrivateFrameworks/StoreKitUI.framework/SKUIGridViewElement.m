@implementation SKUIGridViewElement

- (SKUIGridViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  SKUIDynamicGridViewElement *v12;
  void *v13;
  uint64_t v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGridViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v11 = objc_opt_class();
  if (v11 == objc_opt_class())
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("entityProviderID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");

    if (v14)
    {
      v12 = -[SKUIDynamicGridViewElement initWithDOMElement:parent:elementFactory:]([SKUIDynamicGridViewElement alloc], "initWithDOMElement:parent:elementFactory:", v8, v9, v10);
LABEL_11:

      goto LABEL_12;
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIGridViewElement;
  v12 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v16, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v12)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("editMode"));
    self = (SKUIGridViewElement *)objc_claimAutoreleasedReturnValue();
    if (-[SKUIGridViewElement length](self, "length"))
      v12->super._showsEditMode = -[SKUIGridViewElement BOOLValue](self, "BOOLValue");
    goto LABEL_11;
  }
LABEL_12:

  return &v12->super;
}

+ (id)supportedFeatures
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v9[0] = 0x1E73B0FD0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___SKUIGridViewElement;
  objc_msgSendSuper2(&v8, sel_supportedFeatures);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = v3;
  }

  return v6;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUIGridViewElement *v4;
  SKUIGridViewElement *v5;
  id *p_isa;
  id v7;
  _BOOL4 showsEditMode;
  unsigned int v9;
  void *v10;
  id persistenceKey;
  objc_super v13;

  v4 = (SKUIGridViewElement *)a3;
  v13.receiver = self;
  v13.super_class = (Class)SKUIGridViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v13, sel_applyUpdatesWithElement_, v4);
  v5 = (SKUIGridViewElement *)objc_claimAutoreleasedReturnValue();
  p_isa = (id *)&v5->super.super.super.isa;
  if (v4 == self || v5 != self)
  {
    showsEditMode = self->_showsEditMode;
    if (showsEditMode != -[SKUIGridViewElement showsEditMode](v5, "showsEditMode"))
    {
      do
        v9 = __ldxr((unsigned int *)&applyUpdatesWithElement__sGridPersistenceID);
      while (__stxr(v9 + 1, (unsigned int *)&applyUpdatesWithElement__sGridPersistenceID));
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", (int)(v9 + 1));
      persistenceKey = self->_persistenceKey;
      self->_persistenceKey = v10;

      objc_storeStrong(p_isa + 35, self->_persistenceKey);
    }
  }
  else
  {
    v7 = self->_persistenceKey;
    self->_persistenceKey = 0;

    self->_showsEditMode = -[SKUIGridViewElement showsEditMode](v4, "showsEditMode");
  }

  return p_isa;
}

- (void)enumerateChildrenUsingBlock:(id)a3
{
  id v4;
  objc_super v5;
  _QWORD v6[4];
  id v7;

  v6[1] = 3221225472;
  v6[2] = __51__SKUIGridViewElement_enumerateChildrenUsingBlock___block_invoke;
  v6[3] = &unk_1E73A1F80;
  v7 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SKUIGridViewElement;
  v6[0] = MEMORY[0x1E0C809B0];
  v4 = v7;
  -[SKUIViewElement enumerateChildrenUsingBlock:](&v5, sel_enumerateChildrenUsingBlock_, v6);

}

void __51__SKUIGridViewElement_enumerateChildrenUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  BOOL v4;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(v5, "elementType");
  v4 = (unint64_t)(v3 - 4) > 0x3E || ((1 << (v3 - 4)) & 0x4000700000000501) == 0;
  if (!v4 || v3 == 152 || v3 == 141)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (int64_t)pageComponentType
{
  return 8;
}

- (id)persistenceKey
{
  id persistenceKey;
  objc_super v4;

  persistenceKey = self->_persistenceKey;
  if (persistenceKey)
    return persistenceKey;
  v4.receiver = self;
  v4.super_class = (Class)SKUIGridViewElement;
  -[SKUIViewElement persistenceKey](&v4, sel_persistenceKey);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)allowsMultipleSelectionDuringEditing
{
  BOOL v2;
  _QWORD v4[7];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[3];
  char v10;

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v10 = 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__SKUIGridViewElement_allowsMultipleSelectionDuringEditing__block_invoke;
  v4[3] = &unk_1E73A7CF0;
  v4[4] = self;
  v4[5] = &v5;
  v4[6] = v9;
  -[SKUIGridViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v4);
  v2 = v6[3] != 0;
  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(v9, 8);
  return v2;
}

uint64_t __59__SKUIGridViewElement_allowsMultipleSelectionDuringEditing__block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_countOfInputCheckboxesWithBaseElement:limit:", a2, 2 - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += result;
  if (*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) >= 2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (SKUICollectionDOMFeature)collectionFeature
{
  return (SKUICollectionDOMFeature *)-[SKUIViewElement featureWithName:](self, "featureWithName:", 0x1E73B0FD0);
}

- (int64_t)_countOfInputCheckboxesWithBaseElement:(id)a3 limit:(int64_t)a4
{
  id v6;
  void *v7;
  int64_t v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v6 = a3;
  v7 = v6;
  if (a4)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    if (objc_msgSend(v6, "elementType") == 18)
    {
      v8 = v12[3] + 1;
      v12[3] = v8;
    }
    else
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __68__SKUIGridViewElement__countOfInputCheckboxesWithBaseElement_limit___block_invoke;
      v10[3] = &unk_1E73A40C0;
      v10[4] = self;
      v10[5] = &v11;
      v10[6] = a4;
      -[SKUIGridViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v10);
      v8 = v12[3];
    }
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __68__SKUIGridViewElement__countOfInputCheckboxesWithBaseElement_limit___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = objc_msgSend(*(id *)(a1 + 32), "_countOfInputCheckboxesWithBaseElement:limit:", a2, *(_QWORD *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += result;
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(_QWORD *)(v7 + 24);
  if (v8 > v6)
  {
    *(_QWORD *)(v7 + 24) = v6;
    v6 = *(_QWORD *)(a1 + 48);
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  if (v8 == v6)
    *a3 = 1;
  return result;
}

- (BOOL)showsEditMode
{
  return self->_showsEditMode;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_persistenceKey, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIGridViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
