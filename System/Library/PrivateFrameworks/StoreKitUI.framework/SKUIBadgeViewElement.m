@implementation SKUIBadgeViewElement

- (SKUIBadgeViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  SKUIBadgeViewElement *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  NSURL *resourceName;
  NSURL *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  float v23;
  CGFloat v24;
  float v25;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIBadgeViewElement initWithDOMElement:parent:elementFactory:].cold.1();
  }
  v27.receiver = self;
  v27.super_class = (Class)SKUIBadgeViewElement;
  v11 = -[SKUIViewElement initWithDOMElement:parent:elementFactory:](&v27, sel_initWithDOMElement_parent_elementFactory_, v8, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("src"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v12);
      objc_msgSend(v13, "scheme");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("resource"));

      if (v15)
      {
        objc_msgSend(v13, "host");
        v16 = objc_claimAutoreleasedReturnValue();
        resourceName = (NSURL *)v11->_resourceName;
        v11->_resourceName = (NSString *)v16;
      }
      else
      {
        v18 = v13;
        resourceName = v11->_url;
        v11->_url = v18;
      }

    }
    if (!v11->_resourceName && !v11->_url)
    {
      objc_msgSend(v8, "getAttribute:", CFSTR("content"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v19, "length"))
      {
        objc_msgSend(v8, "getAttribute:", CFSTR("text"));
        v20 = objc_claimAutoreleasedReturnValue();

        v19 = (void *)v20;
      }
      if (objc_msgSend(v19, "length"))
        objc_storeStrong((id *)&v11->_text, v19);

    }
    objc_msgSend(v8, "getAttribute:", CFSTR("height"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getAttribute:", CFSTR("width"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "length") && objc_msgSend(v22, "length"))
    {
      objc_msgSend(v22, "floatValue");
      v24 = v23;
      objc_msgSend(v21, "floatValue");
      v11->_size.width = v24;
      v11->_size.height = v25;
    }

  }
  return v11;
}

- (NSAttributedString)attributedString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  if (self->_text)
  {
    -[SKUIBadgeViewElement style](self, "style");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    SKUIViewElementFontWithStyle(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 10.0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "ikColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "color");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "setLineBreakMode:", 4);
    v9 = objc_alloc(MEMORY[0x1E0C99D80]);
    v10 = (void *)objc_msgSend(v9, "initWithObjectsAndKeys:", v4, *MEMORY[0x1E0DC1138], v8, *MEMORY[0x1E0DC1178], v6, *MEMORY[0x1E0DC1140], 0);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", self->_text, v10);

  }
  else
  {
    v11 = 0;
  }
  return (NSAttributedString *)v11;
}

- (int64_t)badgeType
{
  void *v3;

  -[SKUIBadgeViewElement fallbackImage](self, "fallbackImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3 && !self->_resourceName)
    return self->_url == 0;

  return 0;
}

- (id)accessibilityText
{
  void *v3;
  NSString *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKUIBadgeViewElement;
  -[SKUIBadgeViewElement accessibilityText](&v6, sel_accessibilityText);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    v4 = self->_text;

    v3 = v4;
  }
  return v3;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SKUIBadgeViewElement *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  UIImage *v8;
  UIImage *fallbackImage;
  UIImage *v10;
  NSString *v11;
  NSString *resourceName;
  CGFloat v13;
  CGFloat v14;
  NSURL *v15;
  NSURL *url;
  objc_super v18;

  v4 = (SKUIBadgeViewElement *)a3;
  v18.receiver = self;
  v18.super_class = (Class)SKUIBadgeViewElement;
  -[SKUIViewElement applyUpdatesWithElement:](&v18, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 == self)
  {
    v7 = objc_msgSend(v5, "updateType");
    if (!v4 || !v7)
      goto LABEL_10;
  }
  else if (!v4)
  {
    goto LABEL_10;
  }
  if (v4->_hasValidFallbackImage)
  {
    -[SKUIBadgeViewElement fallbackImage](v4, "fallbackImage");
    v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
    fallbackImage = self->_fallbackImage;
    self->_fallbackImage = v8;

    self->_hasValidFallbackImage = 1;
  }
  else
  {
    self->_hasValidFallbackImage = 0;
    v10 = self->_fallbackImage;
    self->_fallbackImage = 0;

  }
  -[SKUIBadgeViewElement resourceName](v4, "resourceName");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  resourceName = self->_resourceName;
  self->_resourceName = v11;

  -[SKUIBadgeViewElement size](v4, "size");
  self->_size.width = v13;
  self->_size.height = v14;
  objc_storeStrong((id *)&self->_text, v4->_text);
  -[SKUIBadgeViewElement URL](v4, "URL");
  v15 = (NSURL *)objc_claimAutoreleasedReturnValue();
  url = self->_url;
  self->_url = v15;

LABEL_10:
  return v6;
}

- (UIImage)fallbackImage
{
  void *v3;
  void *v4;
  int v5;
  NSString *v6;
  void *v7;
  void *v8;
  UIImage *v9;
  UIImage *fallbackImage;
  void *v11;
  UIImage *v12;
  UIImage *v13;

  if (!self->_hasValidFallbackImage)
  {
    self->_hasValidFallbackImage = 1;
    -[SKUIBadgeViewElement style](self, "style");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "badgeTreatment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("rect"));

    if (v5)
    {
      v6 = self->_text;
      objc_msgSend(v3, "ikColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "color");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        SKUIBadgeImageFromText(v6, v8, 1);
        v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
        fallbackImage = self->_fallbackImage;
        self->_fallbackImage = v9;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.62745098, 1.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        SKUIBadgeImageFromText(v6, v11, 1);
        v12 = (UIImage *)objc_claimAutoreleasedReturnValue();
        v13 = self->_fallbackImage;
        self->_fallbackImage = v12;

        fallbackImage = (UIImage *)v6;
        v6 = (NSString *)v11;
      }

    }
  }
  return self->_fallbackImage;
}

- (NSString)resourceName
{
  return self->_resourceName;
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

- (NSURL)URL
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_resourceName, 0);
  objc_storeStrong((id *)&self->_fallbackImage, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIBadgeViewElement initWithDOMElement:parent:elementFactory:]";
}

@end
