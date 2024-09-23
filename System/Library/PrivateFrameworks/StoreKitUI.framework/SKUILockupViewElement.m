@implementation SKUILockupViewElement

- (SKUILockupViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
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
  SKUILockupViewElement *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v11 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v11)
        -[SKUILockupViewElement initWithDOMElement:parent:elementFactory:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  v26.receiver = self;
  v26.super_class = (Class)SKUILockupViewElement;
  v19 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v26, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v19)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("disabled"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "length"))
      v21 = objc_msgSend(v20, "BOOLValue") ^ 1;
    else
      LOBYTE(v21) = -1;
    v19->_enabled = v21;
    objc_msgSend(v8, "getAttribute:", CFSTR("selectable"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "length"))
    {
      objc_msgSend(v22, "lowercaseString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v19->_selectable = objc_msgSend(v23, "isEqualToString:", CFSTR("true"));

    }
    objc_msgSend(v8, "getAttribute:", CFSTR("type"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v19->_lockupViewType = SKUILockupViewTypeForString(v24);

  }
  return v19;
}

- (BOOL)containsElementGroups
{
  void *v2;
  BOOL v3;

  -[SKUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 127);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (SKUIFullscreenImageViewElement)fullscreenImage
{
  return (SKUIFullscreenImageViewElement *)-[SKUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 42);
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUILockupViewElement *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = (SKUILockupViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SKUILockupViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v8, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    self->_enabled = v4->_enabled;
    self->_lockupViewType = -[SKUILockupViewElement lockupViewType](v4, "lockupViewType");
  }

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
  v4.super_class = (Class)SKUILockupViewElement;
  return -[SKUIViewElement isEnabled](&v4, sel_isEnabled);
}

- (int64_t)pageComponentType
{
  return 24;
}

- (int64_t)lockupViewType
{
  return self->_lockupViewType;
}

- (BOOL)isSelectable
{
  return self->_selectable;
}

- (void)initWithDOMElement:(uint64_t)a3 parent:(uint64_t)a4 elementFactory:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
