@implementation SKUISpacePageComponent

- (SKUISpacePageComponent)initWithCustomPageContext:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUISpacePageComponent *v13;
  void *v14;
  void *v15;
  double v16;
  char v17;
  float v18;
  objc_super v20;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUISpacePageComponent initWithCustomPageContext:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUISpacePageComponent;
  v13 = -[SKUIPageComponent initWithCustomPageContext:](&v20, sel_initWithCustomPageContext_, v4);
  if (v13)
  {
    objc_msgSend(v4, "componentDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("size"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = SKUISpacePageComponentHeightForString(v15);
    }
    else
    {
      v17 = objc_opt_respondsToSelector();
      v16 = 7.0;
      if ((v17 & 1) != 0)
      {
        objc_msgSend(v15, "floatValue", 7.0);
        v16 = v18;
      }
    }
    v13->_height = v16;

  }
  return v13;
}

- (int64_t)componentType
{
  return 14;
}

- (double)height
{
  return self->_height;
}

- (void)initWithCustomPageContext:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
