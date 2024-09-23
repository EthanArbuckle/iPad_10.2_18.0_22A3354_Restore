@implementation SKUIItemCollectionViewCell

- (SKUIItemCellLayout)layout
{
  return 0;
}

- (void)setCellLayoutNeedsLayout
{
  OUTLINED_FUNCTION_1();
}

- (void)applyLayoutAttributes:(id)a3
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
  void *v13;
  void *v14;
  objc_super v15;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIItemCollectionViewCell applyLayoutAttributes:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIItemCollectionViewCell;
  -[SKUICollectionViewCell applyLayoutAttributes:](&v15, sel_applyLayoutAttributes_, v4);
  -[SKUIItemCollectionViewCell layout](self, "layout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setBackgroundColor:", v14);
}

- (void)prepareForReuse
{
  OUTLINED_FUNCTION_1();
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  objc_super v14;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIItemCollectionViewCell setHighlighted:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUIItemCollectionViewCell layout](self, "layout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHighlighted:", v3);

  v14.receiver = self;
  v14.super_class = (Class)SKUIItemCollectionViewCell;
  -[SKUICollectionViewCell setHighlighted:](&v14, sel_setHighlighted_, v3);
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  objc_super v14;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIItemCollectionViewCell setSelected:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUIItemCollectionViewCell layout](self, "layout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSelected:", v3);

  v14.receiver = self;
  v14.super_class = (Class)SKUIItemCollectionViewCell;
  -[SKUICollectionViewCell setSelected:](&v14, sel_setSelected_, v3);
}

- (void)layoutSubviews
{
  OUTLINED_FUNCTION_1();
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIItemCollectionViewCell setBounds:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  -[SKUIItemCollectionViewCell bounds](self, "bounds");
  if (v17 != width || v16 != height)
    self->_layoutNeedsLayout = 1;
  v19.receiver = self;
  v19.super_class = (Class)SKUIItemCollectionViewCell;
  -[SKUIItemCollectionViewCell setBounds:](&v19, sel_setBounds_, x, y, width, height);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIItemCollectionViewCell setFrame:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  -[SKUIItemCollectionViewCell frame](self, "frame");
  if (v17 != width || v16 != height)
    self->_layoutNeedsLayout = 1;
  v19.receiver = self;
  v19.super_class = (Class)SKUIItemCollectionViewCell;
  -[SKUIItemCollectionViewCell setFrame:](&v19, sel_setFrame_, x, y, width, height);
}

- (void)applyLayoutAttributes:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setHighlighted:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setSelected:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setBounds:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)setFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
