@implementation SKUISystemCombinedIndexBarEntry

- (SKUISystemCombinedIndexBarEntry)init
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SKUISystemCombinedIndexBarEntry *v11;
  SKUISystemCombinedIndexBarEntry *v12;
  objc_super v14;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUISystemCombinedIndexBarEntry init].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUISystemCombinedIndexBarEntry;
  v11 = -[SKUISystemCombinedIndexBarEntry init](&v14, sel_init);
  v12 = v11;
  if (v11)
    -[SKUIIndexBarEntry setEntryType:](v11, "setEntryType:", 3);
  return v12;
}

- (CGSize)_calculatedContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "_dotDiameter");
  v3 = v2;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_drawContentInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  id v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SKUIIndexBarEntry tintColor](self, "tintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFill");

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", x, y, width, height);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fill");

}

+ (double)_dotDiameter
{
  return 4.0;
}

- (void)init
{
  OUTLINED_FUNCTION_1();
}

@end
