@implementation SKUICGRectHelpers

+ (CGRect)rect:(CGRect)a3 withFlippedOriginXRelativeTo:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double MinX;
  CGFloat MaxX;
  CGFloat rect;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  rect = a3.size.height;
  v8 = a3.size.width;
  v9 = a3.origin.y;
  v10 = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    +[SKUICGRectHelpers rect:withFlippedOriginXRelativeTo:].cold.1();
  }
  memset(&v16, 0, sizeof(v16));
  CGAffineTransformMakeScale(&v16, -1.0, 1.0);
  memset(&v15, 0, sizeof(v15));
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  MinX = CGRectGetMinX(v17);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  MaxX = CGRectGetMaxX(v18);
  v14 = v16;
  CGAffineTransformTranslate(&v15, &v14, -(MinX + MaxX), 0.0);
  v14 = v15;
  v19.origin.x = v10;
  v19.origin.y = v9;
  v19.size.width = v8;
  v19.size.height = rect;
  return CGRectApplyAffineTransform(v19, &v14);
}

+ (void)rect:withFlippedOriginXRelativeTo:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "+[SKUICGRectHelpers rect:withFlippedOriginXRelativeTo:]";
}

@end
