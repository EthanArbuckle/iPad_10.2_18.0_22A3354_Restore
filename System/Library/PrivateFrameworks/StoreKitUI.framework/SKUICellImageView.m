@implementation SKUICellImageView

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  UIColor *v5;
  UIColor *cachedBackgroundColor;
  void *v7;
  objc_super v8;
  objc_super v9;

  v3 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUICellImageView setHighlighted:].cold.1();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUICellImageView;
  if (-[SKUICellImageView isHighlighted](&v9, sel_isHighlighted) != v3)
  {
    if (v3)
    {
      -[SKUICellImageView backgroundColor](self, "backgroundColor");
      v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
      cachedBackgroundColor = self->_cachedBackgroundColor;
      self->_cachedBackgroundColor = v5;

      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUICellImageView setBackgroundColor:](self, "setBackgroundColor:", v7);
    }
    else
    {
      -[SKUICellImageView setBackgroundColor:](self, "setBackgroundColor:", self->_cachedBackgroundColor);
      v7 = self->_cachedBackgroundColor;
      self->_cachedBackgroundColor = 0;
    }

    v8.receiver = self;
    v8.super_class = (Class)SKUICellImageView;
    -[SKUICellImageView setHighlighted:](&v8, sel_setHighlighted_, v3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedBackgroundColor, 0);
}

- (void)setHighlighted:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUICellImageView setHighlighted:]";
}

@end
