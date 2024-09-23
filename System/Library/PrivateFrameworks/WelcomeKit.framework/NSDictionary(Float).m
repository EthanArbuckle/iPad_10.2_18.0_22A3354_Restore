@implementation NSDictionary(Float)

- (double)wl_floatForKey:()Float
{
  void *v1;
  double v2;
  float v3;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), v2 = 0.0, (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v1, "floatValue");
    v2 = v3;
  }

  return v2;
}

@end
