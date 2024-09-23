@implementation UIScreen(IC)

+ (double)ic_scale
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "mainScreen");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scale");
  v3 = v2;

  return v3;
}

- (uint64_t)ic_isSecure
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "displayIdentity");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "expectsSecureRendering");

  return v2;
}

@end
