@implementation SKUINavigationBarViewElement

- (SKUINavigationBarViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUINavigationBarViewElement *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUINavigationBarViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUINavigationBarViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v15, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("hideShadow"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_hidesShadow = objc_msgSend(v12, "BOOLValue");

    objc_msgSend(v8, "getAttribute:", CFSTR("hideBackButton"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_hidesBackButton = objc_msgSend(v13, "BOOLValue");

  }
  return v11;
}

- (BOOL)isTransparent
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  double v7;

  -[SKUINavigationBarViewElement style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ikBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v7 = 0.0;
    objc_msgSend(v3, "color");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getWhite:alpha:", 0, &v7);

    v5 = v7 < 0.00000011920929;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (UIColor)tintColor
{
  void *v2;
  void *v3;
  void *v4;

  -[SKUINavigationBarViewElement style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ikColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v4;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUINavigationBarViewElement *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = (SKUINavigationBarViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SKUINavigationBarViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v8, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    self->_hidesShadow = -[SKUINavigationBarViewElement hidesShadow](v4, "hidesShadow");
    self->_hidesBackButton = -[SKUINavigationBarViewElement hidesBackButton](v4, "hidesBackButton");
  }

  return v6;
}

- (NSArray)mainViewElements
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__SKUINavigationBarViewElement_mainViewElements__block_invoke;
  v6[3] = &unk_1E73A12A8;
  v4 = v3;
  v7 = v4;
  -[SKUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v6);

  return (NSArray *)v4;
}

void __48__SKUINavigationBarViewElement_mainViewElements__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  BOOL v4;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(v5, "elementType");
  v4 = (unint64_t)(v3 - 12) > 0x39 || ((1 << (v3 - 12)) & 0x200004000000003) == 0;
  if (!v4 || (unint64_t)(v3 - 106) <= 0x23 && ((1 << (v3 - 106)) & 0x900000009) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

- (NSArray)navigationPalettes
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__SKUINavigationBarViewElement_navigationPalettes__block_invoke;
  v6[3] = &unk_1E73A12A8;
  v4 = v3;
  v7 = v4;
  -[SKUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v6);

  return (NSArray *)v4;
}

void __50__SKUINavigationBarViewElement_navigationPalettes__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "elementType") == 75)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (BOOL)hidesShadow
{
  return self->_hidesShadow;
}

- (BOOL)hidesBackButton
{
  return self->_hidesBackButton;
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUINavigationBarViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
