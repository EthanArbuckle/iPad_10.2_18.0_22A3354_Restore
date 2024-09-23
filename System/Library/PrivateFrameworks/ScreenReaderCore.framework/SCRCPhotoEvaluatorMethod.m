@implementation SCRCPhotoEvaluatorMethod

+ (id)detect:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  CGRect v9;
  CGRect v10;

  v4 = a3;
  v5 = (double)objc_msgSend(v4, "width");
  v6 = (double)objc_msgSend(v4, "height");
  v9.origin.x = 0.0;
  v9.origin.y = 0.0;
  v9.size.width = v5;
  v9.size.height = v6;
  if (CGRectIsEmpty(v9)
    || (v10.origin.x = 0.0, v10.origin.y = 0.0, v10.size.width = v5, v10.size.height = v6, CGRectIsInfinite(v10)))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(a1, "detect:inRect:", v4, 0.0, 0.0, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)detect:(id)a3 inRect:(CGRect)a4
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end
