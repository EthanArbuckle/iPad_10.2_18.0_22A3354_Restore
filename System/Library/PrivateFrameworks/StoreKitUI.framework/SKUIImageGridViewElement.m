@implementation SKUIImageGridViewElement

- (SKUIImageGridViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIImageGridViewElement *v11;
  void *v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIImageGridViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUIImageGridViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v17, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("height"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getAttribute:", CFSTR("width"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length") && objc_msgSend(v13, "length"))
    {
      objc_msgSend(v12, "doubleValue");
      v11->_size.height = v14;
      objc_msgSend(v13, "doubleValue");
      v11->_size.width = v15;
    }

  }
  return v11;
}

- (int64_t)columnCount
{
  void *v2;
  int64_t v3;

  -[SKUIImageGridViewElement style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "columnCount");

  if (v3 <= 1)
    return 1;
  else
    return v3;
}

- (UIEdgeInsets)contentInset
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  -[SKUIImageGridViewElement style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "elementPadding");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIImageGridViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
