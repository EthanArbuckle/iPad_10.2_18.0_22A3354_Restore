@implementation SKUIScrollForwardingView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  SKUIScrollForwardingView *v8;
  objc_super v10;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIScrollForwardingView hitTest:withEvent:].cold.1();
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUIScrollForwardingView;
  -[SKUIScrollForwardingView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, v7, x, y);
  v8 = (SKUIScrollForwardingView *)objc_claimAutoreleasedReturnValue();
  if (v8 == self)
  {
    -[SKUIScrollForwardingView scrollView](self, "scrollView");
    v8 = (SKUIScrollForwardingView *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
}

- (void)hitTest:withEvent:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIScrollForwardingView hitTest:withEvent:]";
}

@end
