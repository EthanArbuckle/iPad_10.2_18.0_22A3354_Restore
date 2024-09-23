@implementation SKUIImageDeckViewElement

- (SKUIImageDeckViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIImageDeckViewElement *v11;
  SKUIImageDeckViewElement *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  float v18;
  float v19;
  float v20;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIImageDeckViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v22.receiver = self;
  v22.super_class = (Class)SKUIImageDeckViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v22, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  v12 = v11;
  if (v11)
  {
    v11->_initialDragLeft = 0.25;
    v11->_initialDragRight = 0.25;
    v11->_additionalDragLeft = 0.33;
    v11->_additionalDragRight = 0.33;
    objc_msgSend(v8, "getAttribute:", CFSTR("initialDragLeft"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getAttribute:", CFSTR("initialDragRight"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getAttribute:", CFSTR("additionalDragLeft"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getAttribute:", CFSTR("additionalDragRight"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 && objc_msgSend(v13, "length"))
    {
      objc_msgSend(v13, "floatValue");
      v12->_initialDragLeft = v17;
    }
    if (v14 && objc_msgSend(v14, "length"))
    {
      objc_msgSend(v14, "floatValue");
      v12->_initialDragRight = v18;
    }
    if (v15 && objc_msgSend(v15, "length"))
    {
      objc_msgSend(v15, "floatValue");
      v12->_additionalDragLeft = v19;
    }
    if (v16 && objc_msgSend(v16, "length"))
    {
      objc_msgSend(v16, "floatValue");
      v12->_additionalDragRight = v20;
    }

  }
  return v12;
}

- (double)initialDragLeft
{
  return self->_initialDragLeft;
}

- (double)initialDragRight
{
  return self->_initialDragRight;
}

- (double)additionalDragLeft
{
  return self->_additionalDragLeft;
}

- (double)additionalDragRight
{
  return self->_additionalDragRight;
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIImageDeckViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
