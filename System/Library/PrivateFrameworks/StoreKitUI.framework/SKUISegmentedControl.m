@implementation SKUISegmentedControl

- (CGRect)frameForSegmentAtIndex:(int64_t)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUISegmentedControl frameForSegmentAtIndex:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUISegmentedControl frame](self, "frame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = v15 / (double)(unint64_t)-[SKUISegmentedControl numberOfSegments](self, "numberOfSegments") * (double)a3;
  v20 = v16 / (double)(unint64_t)-[SKUISegmentedControl numberOfSegments](self, "numberOfSegments");
  v21 = v19;
  v22 = v14;
  v23 = v18;
  result.size.height = v23;
  result.size.width = v20;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUISegmentedControl touchesEnded:withEvent:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUISegmentedControl;
  -[SKUISegmentedControl touchesEnded:withEvent:](&v16, sel_touchesEnded_withEvent_, v6, v7);
  -[SKUISegmentedControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);

}

- (void)frameForSegmentAtIndex:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)touchesEnded:(uint64_t)a3 withEvent:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
