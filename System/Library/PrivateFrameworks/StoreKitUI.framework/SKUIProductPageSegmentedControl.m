@implementation SKUIProductPageSegmentedControl

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  SKUIProductPageSegmentedControl *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  SKUIProductPageSegmentedControl *v13;
  SKUIProductPageSegmentedControl *v14;
  objc_super v16;
  CGPoint v17;
  CGRect v18;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIProductPageSegmentedControl hitTest:withEvent:].cold.1();
  }
  if (-[SKUIProductPageSegmentedControl isEnabled](self, "isEnabled")
    && !-[SKUIProductPageSegmentedControl isHidden](self, "isHidden"))
  {
    -[SKUIProductPageSegmentedControl bounds](self, "bounds");
    v18.origin.x = v9 + -10.0;
    v18.origin.y = v10 + -10.0;
    v18.size.width = v11 + 20.0;
    v18.size.height = v12 + 20.0;
    v17.x = x;
    v17.y = y;
    if (CGRectContainsPoint(v18, v17))
      v13 = self;
    else
      v13 = 0;
    v8 = v13;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)SKUIProductPageSegmentedControl;
    -[SKUIProductPageSegmentedControl hitTest:withEvent:](&v16, sel_hitTest_withEvent_, v7, x, y);
    v8 = (SKUIProductPageSegmentedControl *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v8;

  return v14;
}

- (void)hitTest:withEvent:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIProductPageSegmentedControl hitTest:withEvent:]";
}

@end
