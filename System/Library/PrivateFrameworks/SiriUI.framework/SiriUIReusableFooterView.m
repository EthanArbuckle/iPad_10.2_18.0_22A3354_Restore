@implementation SiriUIReusableFooterView

+ (id)reuseIdentifier
{
  objc_class *v2;
  void *v3;
  void *v4;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("ReuseIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (double)defaultHeight
{
  return 0.0;
}

+ (id)elementKind
{
  return (id)*MEMORY[0x24BDF7628];
}

- (UIEdgeInsets)edgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 8.0;
  v4 = 0.0;
  v5 = 8.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

@end
