@implementation SKUIBrowseItemComponent

- (SKUIBrowseItemComponent)initWithViewElement:(id)a3
{
  id v4;
  SKUIBrowseItemComponent *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *title;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *subtitle;
  uint64_t v15;
  SKUIImageViewElement *decorationImage;
  objc_super v18;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIBrowseItemComponent initWithViewElement:].cold.1();
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUIBrowseItemComponent;
  v5 = -[SKUIPageComponent initWithViewElement:](&v18, sel_initWithViewElement_, v4);
  if (v5)
  {
    objc_msgSend(v4, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "objectAtIndex:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "text");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "string");
      v9 = objc_claimAutoreleasedReturnValue();
      title = v5->_title;
      v5->_title = (NSString *)v9;

    }
    if ((unint64_t)objc_msgSend(v6, "count") >= 2)
    {
      objc_msgSend(v6, "objectAtIndex:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "text");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "string");
      v13 = objc_claimAutoreleasedReturnValue();
      subtitle = v5->_subtitle;
      v5->_subtitle = (NSString *)v13;

    }
    objc_msgSend(v4, "decorationImage");
    v15 = objc_claimAutoreleasedReturnValue();
    decorationImage = v5->_decorationImage;
    v5->_decorationImage = (SKUIImageViewElement *)v15;

  }
  return v5;
}

- (int64_t)componentType
{
  return 16;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (BOOL)showTopBorder
{
  return self->_showTopBorder;
}

- (void)setShowTopBorder:(BOOL)a3
{
  self->_showTopBorder = a3;
}

- (SKUIImageViewElement)decorationImage
{
  return self->_decorationImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decorationImage, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)initWithViewElement:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIBrowseItemComponent initWithViewElement:]";
}

@end
