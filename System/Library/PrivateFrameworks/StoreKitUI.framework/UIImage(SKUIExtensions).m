@implementation UIImage(SKUIExtensions)

+ (id)singlePointImageWithColor:()SKUIExtensions
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  CGFloat v14;
  CGContext *CurrentContext;
  id v16;
  CGColor *v17;
  void *v18;
  CGSize v20;
  CGRect v21;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        +[UIImage(SKUIExtensions) singlePointImageWithColor:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scale");
  v14 = v13;
  v20.width = 1.0;
  v20.height = 1.0;
  UIGraphicsBeginImageContextWithOptions(v20, 0, v14);

  CurrentContext = UIGraphicsGetCurrentContext();
  v16 = objc_retainAutorelease(v3);
  v17 = (CGColor *)objc_msgSend(v16, "CGColor");

  CGContextSetFillColorWithColor(CurrentContext, v17);
  v21.origin.x = 0.0;
  v21.origin.y = 0.0;
  v21.size.width = 1.0;
  v21.size.height = 1.0;
  CGContextFillRect(CurrentContext, v21);
  UIGraphicsGetImageFromCurrentImageContext();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v18;
}

+ (id)resizeImage:()SKUIExtensions toSize:
{
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  CGSize v18;

  v7 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        +[UIImage(SKUIExtensions) resizeImage:toSize:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v18.width = a1;
  v18.height = a2;
  UIGraphicsBeginImageContextWithOptions(v18, 0, 0.0);
  objc_msgSend(v7, "drawInRect:", 0.0, 0.0, a1, a2);

  UIGraphicsGetImageFromCurrentImageContext();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v16;
}

+ (void)singlePointImageWithColor:()SKUIExtensions .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)resizeImage:()SKUIExtensions toSize:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
