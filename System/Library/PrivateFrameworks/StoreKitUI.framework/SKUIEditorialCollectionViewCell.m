@implementation SKUIEditorialCollectionViewCell

- (SKUIEditorialCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIEditorialCollectionViewCell *v8;
  SKUIEditorialCellLayout *v9;
  SKUIEditorialCellLayout *layout;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIEditorialCollectionViewCell initWithFrame:].cold.1();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIEditorialCollectionViewCell;
  v8 = -[SKUICollectionViewCell initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = -[SKUIEditorialCellLayout initWithCollectionViewCell:]([SKUIEditorialCellLayout alloc], "initWithCollectionViewCell:", v8);
    layout = v8->_layout;
    v8->_layout = v9;

  }
  return v8;
}

- (void)setCellLayoutNeedsLayout
{
  self->_layoutNeedsLayout = 1;
  -[SKUIEditorialCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKUIEditorialCollectionViewCell;
  v4 = a3;
  -[SKUICollectionViewCell applyLayoutAttributes:](&v7, sel_applyLayoutAttributes_, v4);
  -[SKUIEditorialCollectionViewCell layout](self, "layout", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setBackgroundColor:", v6);
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  -[SKUIEditorialCollectionViewCell layout](self, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepareForReuse");

  v4.receiver = self;
  v4.super_class = (Class)SKUIEditorialCollectionViewCell;
  -[SKUIEditorialCollectionViewCell prepareForReuse](&v4, sel_prepareForReuse);
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  void *v11;
  objc_super v12;

  -[SKUIEditorialCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v12.receiver = self;
  v12.super_class = (Class)SKUIEditorialCollectionViewCell;
  -[SKUICollectionViewCell layoutSubviews](&v12, sel_layoutSubviews);
  if (self->_layoutNeedsLayout || ((objc_msgSend(v3, "frame"), v9 == v5) ? (v10 = v8 == v7) : (v10 = 0), !v10))
  {
    -[SKUIEditorialCollectionViewCell layout](self, "layout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layoutSubviews");

  }
  self->_layoutNeedsLayout = 0;

}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKUIEditorialCollectionViewCell;
  v4 = a3;
  -[SKUICollectionViewCell setBackgroundColor:](&v6, sel_setBackgroundColor_, v4);
  -[SKUIEditorialCollectionViewCell layout](self, "layout", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (SKUIEditorialCellLayout)layout
{
  return self->_layout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIEditorialCollectionViewCell initWithFrame:]";
}

@end
