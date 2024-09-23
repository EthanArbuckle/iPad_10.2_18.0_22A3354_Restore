@implementation SKUIProxyScrollView

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
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
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v31;
  objc_super v32;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIProxyScrollView setContentInset:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  -[SKUIProxyScrollView contentInset](self, "contentInset");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v32.receiver = self;
  v32.super_class = (Class)SKUIProxyScrollView;
  -[SKUIProxyScrollView setContentInset:](&v32, sel_setContentInset_, top, left, bottom, right);
  -[SKUIProxyScrollView contentInset](self, "contentInset");
  if (v27 != v19 || v24 != v17 || v26 != v23 || v25 != v21)
  {
    -[SKUIProxyScrollView delegate](self, "delegate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v31, "scrollViewDidChangeContentInset:", self);

  }
}

- (void)didMoveToWindow
{
}

- (void)setContentInset:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
