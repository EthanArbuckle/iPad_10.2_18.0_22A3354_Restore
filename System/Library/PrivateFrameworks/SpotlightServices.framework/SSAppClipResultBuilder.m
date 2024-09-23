@implementation SSAppClipResultBuilder

+ (id)bundleId
{
  return CFSTR("com.apple.app-clips");
}

- (id)buildCommand
{
  void *v2;
  void *v3;
  void *v4;

  -[SSResultBuilder result](self, "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "type") == 24 || objc_msgSend(v2, "type") == 22)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(v2, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setClipIdentifier:", v4);

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
