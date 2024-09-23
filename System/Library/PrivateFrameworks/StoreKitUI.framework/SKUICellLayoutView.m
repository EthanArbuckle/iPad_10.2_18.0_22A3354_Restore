@implementation SKUICellLayoutView

- (void)layoutSubviews
{
}

- (void)setBackgroundColor:(id)a3
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
  objc_super v13;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUICellLayoutView setBackgroundColor:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUICellLayout setBackgroundColor:](self->_layout, "setBackgroundColor:", v4);
  v13.receiver = self;
  v13.super_class = (Class)SKUICellLayoutView;
  -[SKUICellLayoutView setBackgroundColor:](&v13, sel_setBackgroundColor_, v4);

}

- (SKUICellLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
}

- (void)setBackgroundColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
